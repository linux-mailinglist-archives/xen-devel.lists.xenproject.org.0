Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2E38FB61
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 09:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132078.246506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llR98-0007tQ-Ox; Tue, 25 May 2021 07:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132078.246506; Tue, 25 May 2021 07:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llR98-0007rG-Lj; Tue, 25 May 2021 07:06:34 +0000
Received: by outflank-mailman (input) for mailman id 132078;
 Tue, 25 May 2021 07:06:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llR97-0007r4-RE
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 07:06:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97be7c8d-a173-4ac3-8087-c17c9d985c58;
 Tue, 25 May 2021 07:06:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C5F2AE99;
 Tue, 25 May 2021 07:06:32 +0000 (UTC)
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
X-Inumbo-ID: 97be7c8d-a173-4ac3-8087-c17c9d985c58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621926392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MVWrXTN9/FDv7kkR8qPnXjznWziHZao0rmhrij1nsg=;
	b=ciqZREOQ4qUReuWUFe+xT/wSL6wbNEnSW4wJimgR8+dBBsVaAzjDdrUlasPFHOP6UeGRxi
	3cZzbYE7AbdOk+2WM4no6QjPpO7FSsBj4fvtbJpSvmnvLVi32uiAZtaFVizj0ZSGwctzz7
	6Z1s/wkoHK+V37ZVBEDr9BzuF/lVwrs=
Subject: Re: [PATCH v4 1/4] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
From: Jan Beulich <jbeulich@suse.com>
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Alistair Francis <alistair.francis@wdc.com>,
 xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <2a8329da33d2af0eab8581a01e3098e8360bda87.1621712830.git.connojdavis@gmail.com>
 <97ef9c85-b5ba-42c6-88f0-6ac66063754c@suse.com>
Message-ID: <2d1e11a6-4923-9935-5576-002a9acb1510@suse.com>
Date: Tue, 25 May 2021 09:06:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <97ef9c85-b5ba-42c6-88f0-6ac66063754c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.05.2021 09:02, Jan Beulich wrote:
> On 24.05.2021 16:34, Connor Davis wrote:
>> Defaulting to yes only for X86 and ARM reduces the requirements
>> for a minimal build when porting new architectures.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually, just to make sure: This ...

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -1,5 +1,6 @@
>  config HAS_NS16550
>  	bool "NS16550 UART driver" if ARM
> +	default n if RISCV

... won't trigger a kconfig warning prior to the RISCV symbol getting
introduced, will it? (I was about to commit the change when I started
wondering.)

Jan

