Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742864A47F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 16:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459752.717523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lAl-0006qk-WB; Mon, 12 Dec 2022 15:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459752.717523; Mon, 12 Dec 2022 15:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lAl-0006nj-SS; Mon, 12 Dec 2022 15:56:55 +0000
Received: by outflank-mailman (input) for mailman id 459752;
 Mon, 12 Dec 2022 15:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xn9i=4K=citrix.com=prvs=338000f17=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p4lAj-0006nd-Tl
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 15:56:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96b1e2ea-7a35-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 16:56:52 +0100 (CET)
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
X-Inumbo-ID: 96b1e2ea-7a35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670860612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNaG8qdunRfMp54Fkl9AJdw2bq+f3Mxs4wKLu8J1KvY=;
  b=Bmg98aFBbPZ8AHJksHOo2aZXSgvABBIsk4/MXgY2q+x9eXnDHZqaNRXP
   bchyfB0nDdoY7z/THj4eBma9IAuEuXBqKnBAVGH3xomW5d2h4VxnfTA/Y
   xwMy/MWN+Yo+s2lfZx12MqZH3nCkbJkuV/+hiRJZGMHY0MDLtgpftkSrN
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87457075
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:M0ZTTa9+BUI9hDDUWVcHDrUDcn6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GYaXjvQbPuIa2T1eNt0YY3go0xQ6JaDx4Q1T1A/+3w8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklCq
 eIIF24ALSuzjtOt/7K9Q/BupNoseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUKwhvH/
 j2bl4j/Kkoad+609haFy0uH37T3vDH3QLBVRZTto5aGh3XMnzdOWXX6T2CTv/i/gUO4R5RQN
 k0I5i0yhawz8kWxSZ/6RRLQiHeAsw5aUddWFeA3wAWMzKPO5ECeHGdsZiVdZdIvsshwXiAj3
 FKNm9LvBBR/sbmUT2Lb/bCRxRuwJCwUIGkqdSICCwwf7LHLvoApgwnPCNV+Faevptn0Hzjqx
 HaNtidWr6Uei4sH2ru2+XjDgimwvd7ZQwhz4R/YNkqn4Rl+f5WNfJGz5B7Q6vMoEWqCZgDf5
 j5ewZHYtb1QS8HW/MCQfAkTNL31+ea6bjCfum5mLoIe9zKk4nyBY48FtVmSO3xVGsoDfDboZ
 mratgVQ+IJfMROWUENnX26iI590lPa9TLwJQtiRN4MTOcYpKGdr6Qk0PSatM3bRfF/AeE3VE
 bOSao6SAHkTEsyLJxLmFr5GgdfHKs3TrF4/pKwXLTz9itJyh1bPE9/p1WdiichnhJ5oWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UJKbbcclE7RjF6W665LVYdl2tNxvQ9qws11
 ivlBh8wJKTX2hUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd/H0UvrTLNuJeNP3LU6nZZJo
 wwtJ53o7gJnFm6WpFzwrPDV8ORfSfhcrVvVb3T1MWVlIcAIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX5vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:RNFrEKzy0TwuCa76XEuSKrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxedZjLcKqweKJ8SUzJ8+6U
 4PSchD4abLfD9HZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="87457075"
Date: Mon, 12 Dec 2022 15:56:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH V8 2/3] xl: Add support to parse generic virtio device
Message-ID: <Y5dPMnXiDbZeBbrL@perard.uk.xensource.com>
References: <cover.1670839220.git.viresh.kumar@linaro.org>
 <feed7e77fb1e986c3f4ab3cf4fef09a21537b0c6.1670839220.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <feed7e77fb1e986c3f4ab3cf4fef09a21537b0c6.1670839220.git.viresh.kumar@linaro.org>

On Mon, Dec 12, 2022 at 03:35:54PM +0530, Viresh Kumar wrote:
> diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
> index 7bf26bdcd831..b188104299b1 100644
> --- a/tools/ocaml/libs/xl/genwrap.py
> +++ b/tools/ocaml/libs/xl/genwrap.py
> @@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
>  functions = { # ( name , [type1,type2,....] )
>      "device_vfb":     DEVICE_FUNCTIONS,
>      "device_vkb":     DEVICE_FUNCTIONS,
> +    "device_virtio":     DEVICE_FUNCTIONS,

Sorry, I meant that this change needed to be removed as well, because
the build fails in "tools/ocaml/test".


Thanks,

-- 
Anthony PERARD

