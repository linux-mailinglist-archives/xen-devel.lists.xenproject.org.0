Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A40B05385
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043585.1413559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaJ2-0001sj-2k; Tue, 15 Jul 2025 07:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043585.1413559; Tue, 15 Jul 2025 07:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaJ2-0001qw-05; Tue, 15 Jul 2025 07:42:28 +0000
Received: by outflank-mailman (input) for mailman id 1043585;
 Tue, 15 Jul 2025 07:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKxO=Z4=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1ubaJ0-0001qq-Bm
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:42:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37cb32ad-614f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:42:11 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60c79bedc19so9089415a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:42:11 -0700 (PDT)
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
X-Inumbo-ID: 37cb32ad-614f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752565331; x=1753170131; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYR7w4dLF7UXeRre8tSi0Eeo0/ev/t+Pvvxeqfux61o=;
        b=DU1aFYrhwauWlEK2A9X9FTECXeBz9qtluzwy1HVV7X+8Ww5UqL5OUsvEECH2xDMPyh
         tBklhDRPOBybu4xomcqpAqcFTVAFDaoZMxJ5RzDHmLfDHZiAxZOaVrlA7P3DhpSlpi1e
         VgCMpJr1BCtn59l360IKWSc/vvWI5CXCzSk0y4ojezMsQg4KGjUSFxUUfHgLkbKI9zjy
         qgoVDabyrjrUOdhSEb0gIBsqfwVPYoBMpTXxsK/pefoC+AmGfCmvHb1aByUJJ2YmCO4+
         8mhf98lT6dYhWUulv1MEAhNYAVcBpSj2ODBobTGyzto4+xJPsaLWGLrq1gc98i5IK2FR
         FVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752565331; x=1753170131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYR7w4dLF7UXeRre8tSi0Eeo0/ev/t+Pvvxeqfux61o=;
        b=my2fUE5xHZZdKOMNOB+NXH7xT167KbD/AuOl5Pm7+Ws5/rp7EuLDGzrvocMJNtOFic
         uEYn4EgptLyr/bYb09/u8DovC1zqDX2GBMZoMTAFoO+71YAxAHd8ZkK0sVWn2jQJOzfZ
         i2U1L1TGoU4Za9veQcBmu8OcvWiWLFkY6BCAYyoN+VLu2A3AVZm8jMIRp4GbORtY7dGT
         FtNvOCBBSnVVoPAmyLhEscUimNCef8gLGEqx1RoF/f3FkL/zhVtJEBeMuz0FpNkl0++u
         W+SjspqQUhkM6dBeZKhtfWOe7HVF+BMnsSKIM4x9CQ+FeBRWB5DD0PcNdBuEYl9jAAan
         U5cw==
X-Forwarded-Encrypted: i=1; AJvYcCU+8IafmzcsZhXa2+ivjS8whEvSH7Qi8y7JMV8M5Vwr2EdX64lh0wX5tXxvhM3LqaubnJGBB+/3hns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMaqHOLtm2i/PqZHbMT9Qr/kzir7J0K4TMhsbZRd1IIvSC/qEo
	6gR8xiVEHORSoSR6CucZaG23FpjdeuiIJ5NHKhN2JUoWO7Q2MKGhpCFgKXcV115CjPzQE0i0/SO
	lqztyfyuVi1rEv6ytKg2MQbvSu1aFjDgdQ8ypwIJ/wg==
X-Gm-Gg: ASbGnctDQO0/mzlTSabw4SekexoMd9maWyRrAJJqXNqm8gSsbzwlkkw5m6nBQgoamwI
	S/lHicHMimo90ouxvn0GHdtusCDmIpn/L4QXmoflc9EyVZaskFTzq6Gl56DWWLzNyuuu36YnrKp
	usTwzQkm7xXquSh333DxRPtEqbiZ6QElq0HCDQSWS4NEW+KrFGGe5rvYiFcx4f7bvCcwB1ICp4V
	1Pq28s=
X-Google-Smtp-Source: AGHT+IH9l5kwQ+/aFdN2ODXd15pi1XqGQJurcOEDtEwFvl/KI9Uv8CfosqCqCc4PCqPhf/Abc0EHOszJG7thOk13GEM=
X-Received: by 2002:a05:6402:3127:b0:609:b263:41d3 with SMTP id
 4fb4d7f45d1cf-611e86184f3mr10956068a12.32.1752565330836; Tue, 15 Jul 2025
 00:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250715071528.46196-1-philmd@linaro.org>
In-Reply-To: <20250715071528.46196-1-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 15 Jul 2025 10:41:44 +0300
X-Gm-Features: Ac12FXxi_XwekSIvtVBq4Pa1K_wHfP3KJhO9XrJJKp-apJEpMIR0cI6nIp8L1RQ
Message-ID: <CAAjaMXaeRTCw7XStmq=Mnj0M4TWop1zNCrSSa6sH0mvoE1SM9A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/xen-pvh: Remove unnecessary 'hw/xen/arch_hvm.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, David Woodhouse <dwmw@amazon.co.uk>, 
	Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 10:19=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> "hw/xen/arch_hvm.h" only declares the arch_handle_ioreq() and
> arch_xen_set_memory() prototypes, which are not used by xen-pvh.c.
> Remove the unnecessary header inclusion.
>
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Based-on: <20250513171737.74386-1-philmd@linaro.org>
> ---
>  hw/arm/xen-pvh.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>  #include "hw/boards.h"
>  #include "system/system.h"
>  #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>
> --
> 2.49.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

