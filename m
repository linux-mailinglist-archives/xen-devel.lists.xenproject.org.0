Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E038605E55
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426571.675097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTEN-0004Tc-Cy; Thu, 20 Oct 2022 10:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426571.675097; Thu, 20 Oct 2022 10:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTEN-0004Qk-9l; Thu, 20 Oct 2022 10:56:55 +0000
Received: by outflank-mailman (input) for mailman id 426571;
 Thu, 20 Oct 2022 10:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9p+=2V=omp.ru=s.shtylyov@srs-se1.protection.inumbo.net>)
 id 1olTDQ-0004P3-1t
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:55:56 +0000
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49a985d-5065-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 12:55:54 +0200 (CEST)
Received: from [192.168.1.103] (31.173.87.29) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Thu, 20 Oct
 2022 13:55:44 +0300
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
X-Inumbo-ID: c49a985d-5065-11ed-8fd0-01056ac49cbb
Subject: Re: [PATCH 03/21] drm/ingenic: Don't set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
	<airlied@gmail.com>, <sam@ravnborg.org>, <javierm@redhat.com>,
	<mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<etnaviv@lists.freedesktop.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
	<linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
	<virtualization@lists.linux-foundation.org>,
	<spice-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20221020103755.24058-1-tzimmermann@suse.de>
 <20221020103755.24058-4-tzimmermann@suse.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <013ea55b-3d51-c89c-eff8-b8d355ded352@omp.ru>
Date: Thu, 20 Oct 2022 13:55:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20221020103755.24058-4-tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.87.29]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/20/2022 10:25:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 173210 [Oct 20 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.29 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.29
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/20/2022 10:32:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/20/2022 7:12:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Hello!

On 10/20/22 1:37 PM, Thomas Zimmermann wrote:

> Don't set struct drm_mode_config.output_poll_changed. It's used to
> inform the fbdev console about conncetor changes. But as ingenic

   Connector. :-)

> uses generic fbdev emulation, the console is being informed by the
> DRM client helpers already. See the calls to drm_client_dev_hotplug()
> in drm_probe_helper.c.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
[...]

MBR, Sergey

