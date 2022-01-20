Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E8495205
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259129.447036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa00-0004QR-L5; Thu, 20 Jan 2022 16:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259129.447036; Thu, 20 Jan 2022 16:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa00-0004Mv-Hx; Thu, 20 Jan 2022 16:09:20 +0000
Received: by outflank-mailman (input) for mailman id 259129;
 Thu, 20 Jan 2022 16:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFdd=SE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAZzz-0004Mp-D9
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:09:19 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ed0095-7a0b-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 17:09:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50206)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAZzx-000A12-2C (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 20 Jan 2022 16:09:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 665D41FADB;
 Thu, 20 Jan 2022 16:09:17 +0000 (GMT)
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
X-Inumbo-ID: 51ed0095-7a0b-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c89f27a3-5873-b2c0-c545-90ac182b9048@srcf.net>
Date: Thu, 20 Jan 2022 16:09:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/APIC: no need for timer calibration when using TDT
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6f79f1e1-119b-b8fc-11a9-5f56bfc163e7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <6f79f1e1-119b-b8fc-11a9-5f56bfc163e7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2022 10:32, Jan Beulich wrote:
> The only global effect of calibrate_APIC_clock() is the setting of
> "bus_scale"; the final __setup_APIC_LVTT(0) is (at best) redundant with
> the immediately following setup_APIC_timer() invocation. Yet "bus_scale"
> isn't used when using TDT. Avoid wasting 100ms for calibration in this
> case.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

