Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870F4550A5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 23:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227022.392518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnTYR-0005if-J4; Wed, 17 Nov 2021 22:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227022.392518; Wed, 17 Nov 2021 22:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnTYR-0005gP-FL; Wed, 17 Nov 2021 22:37:23 +0000
Received: by outflank-mailman (input) for mailman id 227022;
 Wed, 17 Nov 2021 22:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnTYP-0005g0-M0
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 22:37:21 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ece2874e-47f6-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 23:37:20 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:37156)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnTYI-000rjr-pB (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 22:37:14 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 944621FC53;
 Wed, 17 Nov 2021 22:37:14 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ece2874e-47f6-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1a9aae9f-fbe0-7c12-3a3c-222583a52b00@srcf.net>
Date: Wed, 17 Nov 2021 22:37:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-5-andrew.cooper3@citrix.com>
 <e2a68ed1-e7b3-0862-65d6-0f0e1ca454c3@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 4/5] xen/xsm: Improve fallback handling in xsm_fixup_ops()
In-Reply-To: <e2a68ed1-e7b3-0862-65d6-0f0e1ca454c3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/11/2021 09:04, Jan Beulich wrote:
> On 05.11.2021 14:55, Andrew Cooper wrote:
>> +void __init xsm_fixup_ops(struct xsm_ops *ops)
>> +{
>> +    /*
>> +     * We make some simplifying assumptions about struct xsm_ops; that it is
>> +     * made exclusively of function pointers to non-init text.
>> +     *
>> +     * This allows us to walk over struct xsm_ops as if it were an array of
>> +     * unsigned longs.
>> +     */
>> +    unsigned long *dst = _p(ops);
>> +    unsigned long *src = _p(&dummy_ops);
> I'm afraid I consider this an abuse of _p(): It hides casting when
> that would better not be hidden (and there's then also a pointless
> step through "unsigned long" in the casting). I suppose this is
> also why "src" didn't end up "const unsigned long *" - with spelled
> out casts the casting away of const might have been more noticable.

I've changed to a const pointer, but opencoding _p() wouldn't make it 
any more likely for me to have spotted that it ought to have been const 
to begin with.

But ultimately it comes down to neatness/clarity.  This:

unsigned long *dst = _p(ops);
const unsigned long *src = _p(&dummy_ops);

is easier to read than this:

unsigned long *dst = (unsigned long *)ops;
const unsigned long *src = (const unsigned long *)&dummy_ops;

Fundamentally, I can do either, but I have a preference for the one 
which is easier to follow.

>> +    for ( ; dst < (unsigned long *)(ops + 1); src++, dst++ )
>> +    {
>> +        /*
>> +         * If you encounter this BUG(), then you've most likely added a new
>> +         * XSM hook but failed to provide the default implementation in
>> +         * dummy_ops.
>> +         *
>> +         * If not, then perhaps a function pointer to an init function, or
>> +         * something which isn't a function pointer at all.
>> +         */
>> +        BUG_ON(!is_kernel_text(*src));
> Just as a remark, not a request to change anything: A cause of this
> triggering may also be is_kernel_text() not covering all text
> sections. Some of what recently we've been talking about informally
> may lead to new text section variants appearing, and whether those
> would sensibly end up inside [_stext,_etext) is uncertain.

I'm afraid that I'm not aware of what you're referring to here.  But I 
don't think any good will come from having is_kernel_text() not covering 
suitable things.

~Andrew

