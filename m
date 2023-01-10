Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ADF664E78
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 23:05:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474988.736463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFMjA-0006AK-NR; Tue, 10 Jan 2023 22:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474988.736463; Tue, 10 Jan 2023 22:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFMjA-00068a-Kd; Tue, 10 Jan 2023 22:04:16 +0000
Received: by outflank-mailman (input) for mailman id 474988;
 Tue, 10 Jan 2023 22:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyTY=5H=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1pFMj9-00068U-Ll
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 22:04:15 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6e89f3c-9132-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 23:04:12 +0100 (CET)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3ACFA745712;
 Tue, 10 Jan 2023 23:01:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F3B30745706; Tue, 10 Jan 2023 23:01:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F05E37456E3;
 Tue, 10 Jan 2023 23:01:52 +0100 (CET)
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
X-Inumbo-ID: b6e89f3c-9132-11ed-b8d0-410ff93cb8f0
Date: Tue, 10 Jan 2023 23:01:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
    qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
    Richard Henderson <richard.henderson@linaro.org>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, ale@rev.ng, 
    qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
    Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
In-Reply-To: <20230110212947.34557-1-philmd@linaro.org>
Message-ID: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
References: <20230110212947.34557-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1251169997-1673388112=:35553"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.1.10.215119, AntiVirus-Engine: 5.96.0, AntiVirus-Data: 2023.1.10.5960001
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1251169997-1673388112=:35553
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>
>    hwaddr is the type of a physical address
>   (its size can be different from 'target_ulong').
>
> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>
> $ fgrep define include/exec/hwaddr.h
> #define HWADDR_H
> #define HWADDR_BITS 64
> #define HWADDR_MAX UINT64_MAX
> #define TARGET_FMT_plx "%016" PRIx64
>         ^^^^^^
> #define HWADDR_PRId PRId64
> #define HWADDR_PRIi PRIi64
> #define HWADDR_PRIo PRIo64
> #define HWADDR_PRIu PRIu64
> #define HWADDR_PRIx PRIx64

Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
HWADDR_PRIx instead?

Regards,
BALATON Zoltan
--3866299591-1251169997-1673388112=:35553--

