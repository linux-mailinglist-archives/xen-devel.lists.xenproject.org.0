Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCsfAbz0lmndrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:32:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02315E4C6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236164.1538924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt2G1-0004xB-Vd; Thu, 19 Feb 2026 11:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236164.1538924; Thu, 19 Feb 2026 11:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt2G1-0004uN-Si; Thu, 19 Feb 2026 11:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1236164;
 Thu, 19 Feb 2026 11:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6FJ=AX=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vt2G1-0004uH-BV
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 11:31:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8be89a01-0d86-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 12:31:35 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-59dd54b1073so880443e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 03:31:35 -0800 (PST)
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
X-Inumbo-ID: 8be89a01-0d86-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771500694; cv=none;
        d=google.com; s=arc-20240605;
        b=cuWTp9KT9ntigLklIXtGzAHDxNDxWb/ynnkuQibxafzCYl5vlHvddS8n3cpAevZr/D
         xXIl2G45ZlwVkOXQCV+HYnoSQW7kS15FbadAQ1yGKmvCIsaH9AHzO2WVLSpp1qLpbueG
         l/7nX4QbD0jw/KZSbB3LLd3PeyXOaxqYlMmID3nx55Z8iI5X405gFJ7qzdqpeb37CquR
         mifcodRHxrO7xuT2+db1t1vDs+AYRO/NSF67k6S50x9tdgr+bwM7hLLqtLEAo7iB+Fl/
         LuCzhkWy5nM79ZNI7PjWNA0cmWsz3v98/KYDx/uaugBO2WeMRe0NGWzrUgrCq6vicMLy
         VgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+0dXSeRtWCKix83gT4AX0pNlKVs2OTwhYRewJnqDpz4=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=NWSB7AyFyFQ6jscDw/7CAvmNvzzu2+RDCsT+WlYMSMGBsV1heiQUX22NZZss+p5xZ4
         zmHT2693wdq7ij65C9prlZIayVFqv2ou3bRD1j+C8YW3WgfkgKa2wvlskR+0lrCRF87x
         xPu/dYeiW19cNplP+wXZpK1SyifBiZEbJGpQ9qlj+1YWWX9rMd4N+llS7p6/Di//xcTQ
         mlmULgX/TvqQxaG0CWAZtfD8TcyV/JmGx9JBpYI4pwKlcgoILez1rh0Vu7/09Zq4jRom
         MseQEMrdTU8agO5iBvg09LAsyqc+7uEXu27k7jj13M3t4YTm7rwALbgBWSDh3GyGLctm
         69sA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771500694; x=1772105494; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0dXSeRtWCKix83gT4AX0pNlKVs2OTwhYRewJnqDpz4=;
        b=Vd88RLjRtO7RtptNqrzMZZJbDmarfuocHi5MovEcZ744iL/LFubRXKpDI+EQ3YXXAW
         kOZur414iQEikMDRLeI/OkjPXQ+xMPSLNVeCy9p25XcCfBd7i8izSgiXu7sHlU35oqED
         sq25DFkqFNzK5eaFSE30d6U7QocZNTG+GaA0fYtTyQ2GisAmWIuSSwbZ7uqekq5eHvZl
         zb0cwFwenjMU6AfoG1tZqcS5X6JIPzro75DUwEWqW/Rvp5x3wecNjluwdFhlUCnP6tmI
         FuyWHfkkLp/zEJoXwcROuUBgttonYIDwNVvlx9BneshgW3Q/bEyRFuKHc+xe+KUZP3qn
         sPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500694; x=1772105494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+0dXSeRtWCKix83gT4AX0pNlKVs2OTwhYRewJnqDpz4=;
        b=K/ZPWFyAe3f4pU5fD39Xw3ba1KUKlkjVNVSQYgKUgOPXf3cbb7IIv9JXilhW6Jz55X
         lYQ5E3xxN5DF+Iw1DwCXS0g3nzwzPf1XEbq5aeczNJVNXrwCdh4wSyhXM2kA5j0NMqJo
         lADy2ijtuRGrwlWPLnZ9i/6CyXK+D9fpd8DFup9msgCVRarxcDcu4m96xhW/5zxjM8wy
         IWxTX8FyO9IQ1NEXCDID5Dzfb/iPKoNajAZ1ClmtvY+YM3H8qRbg7R29GYn3UewA6Lxc
         WGeZlQyBw50h+XwVcFVSRTLDm2JjJ2xzml3Q2qhITa6lsA8KmMR3ZJZXaAAuXNFS6owZ
         jtJA==
X-Gm-Message-State: AOJu0YwPcIZe2zf60qSLXAM1RpuYH9Qg9h1N4WRiB3IG/gorkHSHTs+/
	Qifr6ROkSn027BNrIdHZUMDCrlmBh5c5dj6g4DLAQY28J8UwXB6fHQntZSJPplZ8r8QAUzKF2ED
	EKHE4fSw+D9yJRA52X2jUlY2EuuhNQ+E=
X-Gm-Gg: AZuq6aJPTxGIKBW9pS0PD5Sxcf64GY3RJNKisEt6XaOaedWGRRthPaj3ry+64frpFix
	NrEOJRDRH+rPCUfFG9FUpq4JPQYikUkvNmm8fOwq41+/7DpHmFNPL1w9z+q5lV7xrR58zOqMbCS
	XJldRWooAW3O/dj5UTjqEhFLbDeuv8R4KeON/KDoUHMRGSVY7siTgGxR0LCTXHGs5TpqEECsBPC
	7JPh0+hrSQFSbAiOR9Ca6bCKxfK9qpmjFIYF1ZRCNhUdUTzl5fug0ssic7fxntE/qxIUjNssNZF
	S3Tejw==
X-Received: by 2002:ac2:4e0b:0:b0:59d:e2f4:3fda with SMTP id
 2adb3069b0e04-59f6d353e94mr5204097e87.15.1771500694113; Thu, 19 Feb 2026
 03:31:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <df0e40200cffa20bbce9bf7af4496677cd64a636.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <df0e40200cffa20bbce9bf7af4496677cd64a636.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Feb 2026 13:30:00 +0200
X-Gm-Features: AaiRm51Apm7sIIJJGgwklv7hfE0ykWU46owng2WKu_jdM0zGipNMrr19vnfFAXQ
Message-ID: <CAGeoDV-==sdUGtt9+r-EONH=R0Mg-dt3MigpA7Z8CUBji19qYg@mail.gmail.com>
Subject: Re: [RFC PATCH 19/19] arm/gicv4: Add GICv4 to the build system
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B02315E4C6
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Add a config option to enable GICv4 support and include the
> corresponding source file in the build system.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/Kconfig  | 6 ++++++
>  xen/arch/arm/Makefile | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 442d353b43..c18eca9f9a 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -255,6 +255,12 @@ config ARM64_BTI
>           Branch Target Identification support.
>           This feature is not supported in Xen.
>
> +config GICV4
> +       bool "GICv4 driver"

nit: I would rename this to something more specific, e.g.:
    "GICv4 vLPI direct injection (experimental)",
as this is not a standalone GIC driver but v4 ITS extensions for direct
vLPI delivery.

It may also be worth gating it under "if UNSUPPORTED", since this builds
on the ITS code path which is currently marked as unsupported.

> +       depends on GICV3 && HAS_ITS
> +       help
> +         Driver for ARM Generic Interrupt Controller v4 extension.

Maybe expand the help text a bit, for example:

  Enable direct injection of vLPIs using the GICv4 ITS extensions.

  This adds support for vPE/vLPI management via ITS commands such as
  VMAPP, VMAPTI and (on vCPU migration) VMOVP, plus handling of per-vPE
  doorbell LPIs used by Xen to reschedule vCPUs when vLPIs are pending.

  Note: This relies on the (currently unsupported) ITS code path in Xen
  and is considered experimental.


Best regards,
Mykola

> +
>  source "arch/arm/tee/Kconfig"
>
>  config PARTIAL_EMULATION
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 95bc7ad25e..8569df571b 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -27,6 +27,7 @@ obj-y +=3D gic.o
>  obj-$(CONFIG_GICV2) +=3D gic-v2.o
>  obj-$(CONFIG_GICV3) +=3D gic-v3.o
>  obj-$(CONFIG_HAS_ITS) +=3D gic-v3-its.o
> +obj-$(CONFIG_GICV4) +=3D gic-v4-its.o
>  obj-$(CONFIG_HAS_ITS) +=3D gic-v3-lpi.o
>  obj-y +=3D guestcopy.o
>  obj-y +=3D guest_atomics.o
> --
> 2.51.2

