Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F29495F4C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 13:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259335.447532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAtPx-0007P4-2A; Fri, 21 Jan 2022 12:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259335.447532; Fri, 21 Jan 2022 12:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAtPw-0007N8-VM; Fri, 21 Jan 2022 12:53:24 +0000
Received: by outflank-mailman (input) for mailman id 259335;
 Fri, 21 Jan 2022 12:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l1/X=SF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAtPv-0007N2-P2
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 12:53:23 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc153ac-7ab9-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 13:53:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50402)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAtPs-000oJk-2q (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 21 Jan 2022 12:53:20 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A95CD1FC25;
 Fri, 21 Jan 2022 12:53:20 +0000 (GMT)
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
X-Inumbo-ID: 1cc153ac-7ab9-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <eca3cd2c-b58d-3e00-659a-d970f5166e91@srcf.net>
Date: Fri, 21 Jan 2022 12:53:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220121104901.22702-1-andrew.cooper3@citrix.com>
 <0e3a51eb-a04a-f471-201b-8aa27aca4224@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86: Fix build with the get/set_reg() infrastructure
In-Reply-To: <0e3a51eb-a04a-f471-201b-8aa27aca4224@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/01/2022 11:03, Jan Beulich wrote:
> On 21.01.2022 11:49, Andrew Cooper wrote:
>> I clearly messed up concluding that the stubs were safe to drop.
>>
>> The is_{pv,hvm}_domain() predicates are not symmetrical with both CONFIG_PV
>> and CONFIG_HVM.  As a result logic of the form `if ( pv/hvm ) ... else ...`
>> will always have one side which can't be DCE'd.
>>
>> While technically only the hvm stubs are needed, due to the use of the
>> is_pv_domain() predicate in guest_{rd,wr}msr(), sort out the pv stubs too to
>> avoid leaving a bear trap for future users.
> Well, as said on irc - only the PV stubs ought to be needed if the
> conditionals always used "if ( is_hvm_...() )" / "if ( !is_hvm_...() )".
> Despite us making use of this property elsewhere, you appear to dislike
> that though ...

Yes - I consider that an accident at best, and not something which
people can reasonably be expected to know or use.

If nothing else, the pv form is the more useful one to use, given a
potential pvh-dom0 future where CONFIG_PV might credibly be dropped by
downstreams.

>
> Hence / nevertheless:
>
>> Fixes: 88d3ff7ab15d ("x86/guest: Introduce {get,set}_reg() infrastructure")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks, but CI still says no.

Some compilers don't tolerate the lack of a return value in a non-void
function, despite the ASSERT_UNREACHABLE().  It might be down to the
absence of __builtin_unreahcable().

I've folded "return 0;" into the two get stubs, and will see how that
fairs, but given how trivial it is, I don't intend to post a v2 before
committing.

~Andrew

