Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC86463211
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 12:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235029.407808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms16F-0004UU-Ll; Tue, 30 Nov 2021 11:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235029.407808; Tue, 30 Nov 2021 11:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms16F-0004SN-IR; Tue, 30 Nov 2021 11:15:03 +0000
Received: by outflank-mailman (input) for mailman id 235029;
 Tue, 30 Nov 2021 11:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms16E-0004RU-Ij
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:15:02 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c23538d0-51ce-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 12:15:01 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34514)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms16C-000Leo-78 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 11:15:00 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 0D5511FA51;
 Tue, 30 Nov 2021 11:15:00 +0000 (GMT)
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
X-Inumbo-ID: c23538d0-51ce-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <625fdf21-8024-7a79-5c64-b8ed959c54aa@srcf.net>
Date: Tue, 30 Nov 2021 11:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-2-andrew.cooper3@citrix.com>
 <5b4dcbae-4100-ad3c-cbc4-51f2b2bbedaa@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/8] x86/boot: Drop incorrect mapping at l2_xenmap[0]
In-Reply-To: <5b4dcbae-4100-ad3c-cbc4-51f2b2bbedaa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 10:33, Jan Beulich wrote:
> On 30.11.2021 11:04, Andrew Cooper wrote:
>> It has been 4 years since the default load address changed from 1M to 2M, and
>> _stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
>> mapping.
>>
>> To ensure we don't create mappings accidentally, loop from 0 and obey
>> _PAGE_PRESENT on all entries.
>>
>> Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I guess this may be worth backporting despite not having any immediate
> adverse effect.

I'd say so, yes.  I too can't see an adverse effect right now, but I'm
definitely wary of stray executable mappings lying around.


In principle, it would be nice to reclaim the 2M of space (which only
exists for the MB1 path IIRC), but then we're getting into a position
where xen_phys_start isn't really that any more.

A different alternative could be to use it for early memory allocations
in Xen and treat it like .data, similar to Linux's early BRK().  This
might simplify some of the relocation hoops we currently jump through.

~Andrew

