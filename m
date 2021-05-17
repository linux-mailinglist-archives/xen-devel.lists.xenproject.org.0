Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D676382B8E
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 13:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128195.240710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libr0-00083o-Cz; Mon, 17 May 2021 11:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128195.240710; Mon, 17 May 2021 11:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libr0-000817-A3; Mon, 17 May 2021 11:56:10 +0000
Received: by outflank-mailman (input) for mailman id 128195;
 Mon, 17 May 2021 11:56:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1libqz-000811-3L
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 11:56:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b09e2cf-cdb7-44ca-8712-5e3072878035;
 Mon, 17 May 2021 11:56:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6CE6ABF6;
 Mon, 17 May 2021 11:56:06 +0000 (UTC)
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
X-Inumbo-ID: 0b09e2cf-cdb7-44ca-8712-5e3072878035
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621252566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpM7LXCKjoAEKzHogk/TQuEiqSyV2Ek4pl3OH8UCDkk=;
	b=dkfsgVuXNLPgpitWSc3AXIGdfVfoW7UwYEUJ7m0XSF0vQfwhyHW6ZTc7DyRz3rZD8lykNl
	H9z2dVfsndkqW9qjjC4RhQWEtv5sMmoITnACAVjwjZiTMSLUOWLEDpAkdZj7ZRQz6+mBMy
	l+OoHQ07esx9NZWJwE7AQGgPwfqGY/s=
Subject: Re: [PATCH v3 1/5] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <3960a676376e0163d97ac02f968966cdfaccbf75.1621017334.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76b5e429-a0b0-b8a2-cd31-85cbb4da8680@suse.com>
Date: Mon, 17 May 2021 13:56:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3960a676376e0163d97ac02f968966cdfaccbf75.1621017334.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.05.2021 20:53, Connor Davis wrote:
> Defaulting to yes only for X86 and ARM reduces the requirements
> for a minimal build when porting new architectures.

While I agree with the statement, ...

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -1,6 +1,6 @@
>  config HAS_NS16550
>  	bool "NS16550 UART driver" if ARM
> -	default y
> +	default y if (ARM || X86)

... this approach doesn't scale very well. You would likely have
been hesitant to add a, say, 12-way || here if we had this many
architectures already. I think you instead want

 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
+	default n if RISCV
 	default y

which then can be adjusted back by another one line change once
the driver code actually builds.

Jan

