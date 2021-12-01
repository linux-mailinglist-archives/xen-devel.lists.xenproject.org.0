Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE8465633
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 20:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236207.409713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msV22-0008U7-95; Wed, 01 Dec 2021 19:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236207.409713; Wed, 01 Dec 2021 19:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msV22-0008Rn-6A; Wed, 01 Dec 2021 19:12:42 +0000
Received: by outflank-mailman (input) for mailman id 236207;
 Wed, 01 Dec 2021 19:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msV20-0008Rh-Lp
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 19:12:40 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6da67bc-52da-11ec-b1df-f38ee3fbfdf7;
 Wed, 01 Dec 2021 20:12:39 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50700)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msV1z-000SHc-he (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 19:12:39 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 437E41FD7A;
 Wed,  1 Dec 2021 19:12:39 +0000 (GMT)
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
X-Inumbo-ID: a6da67bc-52da-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <352d554d-dbea-e7b9-e499-91517ffc17c3@srcf.net>
Date: Wed, 1 Dec 2021 19:12:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/4] x86/ucode: Use altcall, and __initdata_cf_clobber
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-5-andrew.cooper3@citrix.com>
 <8943376d-b6cc-6c04-c4aa-c8d30800dfca@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <8943376d-b6cc-6c04-c4aa-c8d30800dfca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2021 08:23, Jan Beulich wrote:
> On 26.11.2021 22:22, Andrew Cooper wrote:
>> Microcode loading is not a fastpath, but there are control flow security
>> benefits from using altcall()'s hardening side effect.
>>
>> Convert the existing microcode_ops pointer into a __read_mostly structure, and
>> move {amd,intel}_ucode_ops into __initdata_cf_clobber.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Again subject to the resolution of the const aspect and perhaps
> with __read_mostly converted to __ro_after_init (assuming its
> introduction goes in first)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Given how simple __ro_after_init was, it would be preferable to get that
in first, than to go around patching these a second time.

~Andrew

