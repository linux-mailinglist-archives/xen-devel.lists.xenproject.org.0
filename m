Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857BDC67A32
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164309.1491308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElR-0006LN-Ig; Tue, 18 Nov 2025 06:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164309.1491308; Tue, 18 Nov 2025 06:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElR-0006Jq-FM; Tue, 18 Nov 2025 06:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1164309;
 Tue, 18 Nov 2025 06:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLElQ-0006JB-LR
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:00:28 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e04c86f9-c443-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 07:00:25 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5957753e0efso5406680e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:00:25 -0800 (PST)
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
X-Inumbo-ID: e04c86f9-c443-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445625; x=1764050425; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS7CD3ob7b2szWAvPkkvFdWOiNIj8WJSli+X89WuyQ4=;
        b=GFVBzC5qvKj09ZPxKyXpTBTUZRP142EjNbmnACZpRh9y69xbWEVM3HR70aeGwZ6WRA
         eS8OA8nckZ/XvXYS5ksvFffuF3EmMoGdCcTTdgimBPlxg+NfkK8DKwmPGK3pkHEmjY34
         W94LOnA9/5SlQ8VWKY080fLjNwgc0IyPaf9KliaWyYxBkZ14Fs/p0u8dGYKLht26zHnX
         WztEShXWnnBvAHLDnJ+sf8Qasfbw+8w8iiWCjt/xxJQD4EWJRJEte3doKtgi4380vdjf
         tmPThqnMf2h+iOS+Eq+72tKeLPPakmbCujU+jub8GESny07M+6c/zA/7UFGfz9dIUFNK
         t+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445625; x=1764050425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iS7CD3ob7b2szWAvPkkvFdWOiNIj8WJSli+X89WuyQ4=;
        b=VXUPpA5G7WzOEdWLBB4EH8K7+SidGxTCtqMjioBcprpUYL7zI4fAuZmx+eCw61wKJc
         JhwnDAxrNi2wgsL4VCNH9zhUoSQ5mRC70d6bfOP3hg7RY+4QndZYZv6yndiUYLbXfcOH
         Pz6dIhBrXium/rWF1IheIWzWcHXQ31mXT0lOmKqTzwl8JRhvn/DDArIXIAnWfEmEwwCY
         4aqM1buzmwErqBhaye1QMlXB1tVgMH6iin5zhYRJXgrIqtUsiIeXwsYhjkSWVOhwGdMV
         F5u+51FlseigFEKEBWB/ruJaH6V7TarVv9JSiQL5v1G3IYokEg0uemVuPC0yhEJARcls
         QH/Q==
X-Gm-Message-State: AOJu0Yxo4B6ROOGXIFyk8ZZE25yt0EBikI6V9QxRFgSFJD2DorBkZ2l3
	O6AdI1uh3UqnPD6ah7KGfCb+xd/KM7NV+AhuVYBbU5qxQbuAvQyQFZ8ki/az+PEDQnbs7zSW9ZE
	x47UhTo0sMC7bqf29wYOg5BX+4kBmLEw=
X-Gm-Gg: ASbGncvdm04iRlnEg/JDwJHBDfV63lw/y3MylHaLk/qXuwIVsf4LZU3L0hUVaRFzW43
	mH7n5Wp3/5T4NWTcdaFgLlYx2PWpmzi/ijQt0eGGWzYL+jxIqr50Af1IDQrZUXgM+Lc7Z8j8nBk
	6iTL+PuwAswiwyoK6uFWxpfCp35wcC+TxV+lSYR/S6CprUc/bl6JkwcmeJqeuqgbl0pcOQdeCSj
	6ppDP+oinpFJ+O645yswSlq1lME5C6DdpWWOg41f4C/UirIm3DNr+uB3bw=
X-Google-Smtp-Source: AGHT+IFkO2c5vLWzmBkcc4QRCnaOdPFhYFdKKmXBrdr2vcxKwLbNQPdGFwnQVa8FRy12/k900vSpEGnCRGkZVqocuSY=
X-Received: by 2002:a05:6512:2311:b0:583:903e:b5a4 with SMTP id
 2adb3069b0e04-59584214f80mr4549912e87.46.1763445624675; Mon, 17 Nov 2025
 22:00:24 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-14-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-14-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_bnKh0qI2Z2r7j6FvorD1gq2XbLU-Cmx7phnhZAIOjwnUA5hSvzC7q-ajEI
Message-ID: <CAGeoDV91zO0ZQNdpK0keJf_xfq8mFY2BP7kD_Pbsvrc3c6Y21g@mail.gmail.com>
Subject: Re: [PATCH v7 13/16] emul/ns16x50: add Kconfig options
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>


Best regards,
Mykola


On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add initial Kconfig options configure NS16550-capable emulator.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - new patch
> ---
>  xen/common/emul/vuart/Kconfig | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfi=
g
> index ce1b976b7da7..9a49a6528b5a 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,23 @@ config VUART_FRAMEWORK
>
>  menu "UART Emulation"
>
> +config VUART_NS16X50
> +       bool "NS16550-compatible UART Emulator" if EXPERT
> +       depends on X86 && HVM
> +       select VUART_FRAMEWORK
> +       help
> +         In-hypervisor NS16550-compatible UART emulation.
> +
> +         Only one legacy PC COM port is emulated for domain with a certa=
in ID
> +         (set via 'vuart-domid=3D' command line setting).
> +
> +         This is strictly for testing purposes (such as early HVM guest =
console),
> +         and not appropriate for use in production.
> +
> +config VUART_NS16X50_DEBUG
> +       bool "Development: NS16550-compatible UART Emulator Debugging"
> +       depends on VUART_NS16X50 && DEBUG
> +       help
> +         Enable development debugging.
> +
>  endmenu
> --
> 2.51.0
>
>

