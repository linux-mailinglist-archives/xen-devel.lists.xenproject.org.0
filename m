Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444616820A4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 01:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487276.754870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMePW-0006fm-Kv; Tue, 31 Jan 2023 00:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487276.754870; Tue, 31 Jan 2023 00:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMePW-0006dy-HR; Tue, 31 Jan 2023 00:22:06 +0000
Received: by outflank-mailman (input) for mailman id 487276;
 Tue, 31 Jan 2023 00:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMePU-0006ds-OS
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 00:22:04 +0000
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [2607:f8b0:4864:20::a32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4870b4b0-a0fd-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 01:22:02 +0100 (CET)
Received: by mail-vk1-xa32.google.com with SMTP id l20so6602939vkm.11
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 16:22:02 -0800 (PST)
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
X-Inumbo-ID: 4870b4b0-a0fd-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lCKttsuDVf51XjHaovWCYjyPXGiNd+/TAWMpshQo7To=;
        b=YMlCMt1NgNAEV/lNHGZtwhlL+fz+rgRer7enoOXwV/cqUc5I3Bnt3obQKMg3ACv5wQ
         p/yrV/nCAYlo8qlY27gupISbaKkZnzjdv7ITYl/wkdk3P/w9iYLC4T6vnFPy44L7qUYc
         GIqLAfEoEqe1jEoorXxkEG0o1ShYpXhzqdu2IpnTGroHIt2bd957CSf4eO/wQ++T0CAM
         yvbuTvIldvEFNUMrXL1Uyg4olbYVd+gKb3opt5C4rFD9Sx8/6AunA2aiv7rTBjIcWcMb
         OppKcLgn0sM9AB0oAftUacFWoPhUARw2C0c1EiUcj0ZpZlfUg0nGv5GAsckQxzcoXB+C
         vaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCKttsuDVf51XjHaovWCYjyPXGiNd+/TAWMpshQo7To=;
        b=gaEAXpZCdiPdDiFXhrSgVM6g8/xwpAUzYQQMLSmNi4gGbzpz46Iikfinb+KRE3wWem
         BeN8xaimcsjmdgy01Xrf9BrFAa0Aimlmf5JreGrjY3dl0BG6NgbSjDxiLAifUIIqlX2r
         m3iGS1iBDox3fqYl1ZkBbL0R0iDa+hNDffzvSxg4B6wdBSNpqFd6LtaDSYz1NsN/En9O
         A/NTYxtAmIvYA2Nusj97N5hLlLpZnh+aOLrurLRWhILzFkYyyOWumSaRPWNi1gP6sgUo
         ZpN6NWKYWmGuoHHbge5Rn7EXnYt+53H2R3frNL1sl0CjPHoOhz/anDQ9AxF1oqfzr38a
         IyyQ==
X-Gm-Message-State: AFqh2krliFUUWipQt5y+Yg7Za+l+Rkw7J1mnEQS/HzbgRyhoeE8bY9yu
	D4/IkL3flBKld2LrYNH86PXYLMiYvJ9Xy2gAViA=
X-Google-Smtp-Source: AMrXdXuW/JSKWwpsCH5njcgJf5G3OnExFuB77ejREq7GzG9XkGmQeVTLJeiI9dNvSeOzu4VRcDIyZWTH52ZImNXMANs=
X-Received: by 2002:a1f:2c0c:0:b0:3e1:7e08:a117 with SMTP id
 s12-20020a1f2c0c000000b003e17e08a117mr6804924vks.34.1675124521576; Mon, 30
 Jan 2023 16:22:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674818705.git.oleksii.kurochko@gmail.com> <971c400abf7f88a6be322db72481c075d3ceb233.1674818705.git.oleksii.kurochko@gmail.com>
In-Reply-To: <971c400abf7f88a6be322db72481c075d3ceb233.1674818705.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 10:21:35 +1000
Message-ID: <CAKmqyKNSywyF8=KUTiKN12JL_Bst5if74h6mgek1aMYS1QpjeQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] xen/riscv: add _zicsr to CFLAGS
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 28, 2023 at 12:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Work with some registers requires csr command which is part of
> Zicsr.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>   - Nothing changed
> ---
>  xen/arch/riscv/arch.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index 012dc677c3..95b41d9f3e 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -10,7 +10,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  # into the upper half _or_ the lower half of the address space.
>  # -mcmodel=medlow would force Xen into the lower half.
>
> -CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> +CFLAGS += -march=$(riscv-march-y)_zicsr -mstrict-align -mcmodel=medany
>
>  # TODO: Drop override when more of the build is working
>  override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
> --
> 2.39.0
>
>

