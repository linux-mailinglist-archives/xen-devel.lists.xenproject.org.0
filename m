Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212C46126A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 11:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234472.406876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdsS-0005t7-5n; Mon, 29 Nov 2021 10:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234472.406876; Mon, 29 Nov 2021 10:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdsS-0005qV-2h; Mon, 29 Nov 2021 10:27:16 +0000
Received: by outflank-mailman (input) for mailman id 234472;
 Mon, 29 Nov 2021 10:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9yz=QQ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mrdsR-0005qP-4D
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 10:27:15 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d799a3cc-50fe-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 11:26:42 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50154)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mrdsO-000NYV-gv (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 29 Nov 2021 10:27:12 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D42521FC54;
 Mon, 29 Nov 2021 10:27:11 +0000 (GMT)
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
X-Inumbo-ID: d799a3cc-50fe-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <89f31e12-6d68-881e-0622-bb19a80641dc@srcf.net>
Date: Mon, 29 Nov 2021 10:27:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
 <fb030726-c3c1-9225-08a9-8e2c37281962@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <fb030726-c3c1-9225-08a9-8e2c37281962@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2021 09:27, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -46,6 +46,12 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
>>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
>>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
>>  
>> +ifdef CONFIG_HAS_CC_CET_IBT
>> +CFLAGS += -fcf-protection=branch -mmanual-endbr
> Don't you mean to check XEN_IBT here rather than the underlying
> compiler capability?

I did, and elsewhere in the patch (already fixed up).  I added
CONFIG_XEN_IBT rather late in the dev cycle, and missed a few conversions.

~Andrew

