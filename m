Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D215764A484
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459771.717555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lEc-0001Gr-4j; Mon, 12 Dec 2022 16:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459771.717555; Mon, 12 Dec 2022 16:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lEc-0001Dt-1V; Mon, 12 Dec 2022 16:00:54 +0000
Received: by outflank-mailman (input) for mailman id 459771;
 Mon, 12 Dec 2022 16:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xn9i=4K=citrix.com=prvs=338000f17=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p4lEa-0001D6-8O
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 16:00:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 255a4895-7a36-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 17:00:50 +0100 (CET)
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
X-Inumbo-ID: 255a4895-7a36-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670860850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/QBxbfUQdXss78gS6ySYQ49L6ltH/g8PhjsZUOSm3IA=;
  b=U1DXH4RRqXfXly6tSx3CtmBxVq5zCCiAsdlvHnvDUO3Tvy4MVxfxc551
   OfebEryq05+XHA56zxc3Yb05ocGxvbhUbivU5q2xsiPDsZxcB+mQEHw50
   qcMCfddHF7xEbCtcewvbUw424/8SwTETuH0gCUaxwCGasS8VTHlvavTxq
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87457978
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AhwYQa8bxCpYshgbxEodDrUDcn6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GoeWzvUPv3YM2H2Kt1+adnl9x5Tv5PVnddlGwI+/no8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkli6
 /lGIzkhNCmJpLuQ65+3WMU33OEKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUKwhvH9
 z2Wl4j/KjQjaN6G82anyDX2ovaWwx7eYLkrKLLto5aGh3XMnzdOWXX6T2CTv/i/gUO4R5RQN
 k0I5i0yhawz8kWxSZ/6RRLQiHeAsw5aUddWFeA3wAWMzKPO5ECeHGdsZiVdZdIvsshwXiAj3
 FKNm9LvBBR/sbmUT2Lb/bCRxRuwJCwUIGkqdSICCwwf7LHLvoApgwnPCNV+Faevptn0Hzjqx
 HaNtidWr6Uei4sH2ru2+XjDgimwvd7ZQwhz4R/YNkqn4Rl+f5WNfJGz5B7Q6vMoEWqCZgDf5
 j5ewZHYtb1QS8HW/MCQfAkTNJ234qiOORGGuFRMRr8K2ji/1yX5WKkFtVmSO3xVGsoDfDboZ
 mratgVQ+IJfMROWUENnX26iI590lPa9TLwJQtiRN4MTOcYpKGdr6Qk0PSatM3bRfF/AeE3VE
 bOSao6SAHkTEsyLJxLmFr5GgdfHKs3TrF4/pKwXLTz9itJyh1bPE9/p1WdiichnhJ5oWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UJKbbcclE7RjF6W665LVYdl2tNxvQ9qws11
 ivlBh8wJKTX2hUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd/H0UvrTLNuJeNP3LU6nZZJo
 wwtJ53o7gJnFm6WpFzwrPDV8ORfSfhcrVvVb3T1MWVlIcAIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX7vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:jbPly64k4ENL14nC+gPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="87457978"
Date: Mon, 12 Dec 2022 16:00:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH V8 3/3] docs: Add documentation for generic virtio devices
Message-ID: <Y5dQLFzlSE+zPb5t@perard.uk.xensource.com>
References: <cover.1670839220.git.viresh.kumar@linaro.org>
 <b427a95b2c051ecd12d8342d65a34aa16a1feebd.1670839220.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b427a95b2c051ecd12d8342d65a34aa16a1feebd.1670839220.git.viresh.kumar@linaro.org>

On Mon, Dec 12, 2022 at 03:35:55PM +0530, Viresh Kumar wrote:
> This patch updates xl.cfg man page with details of generic Virtio device
> related information.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

