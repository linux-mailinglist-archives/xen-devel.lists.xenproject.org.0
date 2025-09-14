Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BACB56C67
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 23:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124026.1466622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxu5g-0006oO-KE; Sun, 14 Sep 2025 21:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124026.1466622; Sun, 14 Sep 2025 21:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxu5g-0006mv-El; Sun, 14 Sep 2025 21:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1124026;
 Sun, 14 Sep 2025 21:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zIW=3Z=bootlin.com=alexandre.belloni@srs-se1.protection.inumbo.net>)
 id 1uxu5f-0006mk-1I
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 21:16:55 +0000
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffada21-91b0-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 23:16:49 +0200 (CEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EBAB9C8EC7C;
 Sun, 14 Sep 2025 21:16:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 092936063F;
 Sun, 14 Sep 2025 21:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76865102F2A78; 
 Sun, 14 Sep 2025 23:16:29 +0200 (CEST)
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
X-Inumbo-ID: 1ffada21-91b0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PrFkxRI/rM5SQxoVJY6C6jishZsikS57oIN/hwunQlI=;
	b=j+82wh8EW/26ftt8B3pTo1EF6a84LZS/ds3nQRpCwbhT3EnmTALAHRvlO8AaJPUcIhLHT/
	gl6jy60jXJho+DItqUqAiO30JedIhLNi6Q8iHiliohdlf/U1fzqVAfru1ocswYYozJrZ6b
	G8T1SuFDUk3FEl5M8tYxF5FckzXCm3SvxGXKysA2w/fNni0aqN7/YjLZ7Qrcx+e+82gmuN
	TrF/Uq8mV4ZHEstaLbfM1ST8YeXhs0i1w7ilUCrIHelmL+RBtOtGJN4y4l7FAtcPFuJc7e
	9AmDmRUv8YBvnRbWBiulqtUTQeRPGkyMscOZZNXSS0NMEANY+15EN7K4nD8YnA==
Date: Sun, 14 Sep 2025 23:16:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev
Subject: Re: (subset) [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
Message-ID: <175788449957.388732.6353062596898107602.b4-ty@bootlin.com>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <20250714060843.4029171-6-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714060843.4029171-6-ardb+git@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 14 Jul 2025 08:08:45 +0200, Ard Biesheuvel wrote:
> The EFI rtc driver is used by non-x86 architectures only, and exposes
> the get/set wakeup time functionality provided by the underlying
> platform. This is usually broken on most platforms, and not widely used
> to begin with [if at all], so let's just remove it.
> 
> 

Applied, thanks!

[1/3] efi-rtc: Remove wakeup functionality
      https://git.kernel.org/abelloni/c/50562f9cd366

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

