Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4048DDB0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 19:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257336.442162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n84rJ-0007fu-J9; Thu, 13 Jan 2022 18:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257336.442162; Thu, 13 Jan 2022 18:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n84rJ-0007cv-FF; Thu, 13 Jan 2022 18:30:01 +0000
Received: by outflank-mailman (input) for mailman id 257336;
 Thu, 13 Jan 2022 18:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVjj=R5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n84rI-0007co-3b
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 18:30:00 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf347988-749e-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 19:29:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47602)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n84rD-000Ziv-8y (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 13 Jan 2022 18:29:55 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7B4EE1FC87;
 Thu, 13 Jan 2022 18:29:55 +0000 (GMT)
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
X-Inumbo-ID: cf347988-749e-11ec-a563-1748fde96b53
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <87307be7-ec4b-35f7-ef6a-29abdcecc6c3@srcf.net>
Date: Thu, 13 Jan 2022 18:29:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] x86/HVM: convert remaining hvm_funcs hook invocations
 to alt-call
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <ed34964c-c612-497f-0350-b9202c0ba057@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <ed34964c-c612-497f-0350-b9202c0ba057@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 17:02, Jan Beulich wrote:
> The aim being to have as few indirect calls as possible (see [1]),
> whereas during initial conversion performance was the main aspect and
> hence rarely used hooks didn't get converted. Apparently one use of
> get_interrupt_shadow() was missed at the time.
>
> While doing this, drop NULL checks ahead of CPU management and .nhvm_*()
> calls when the hook is always present. Also convert the
> .nhvm_vcpu_reset() call to alternative_vcall(), as the return value is
> unused and the caller has currently no way of propagating it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

