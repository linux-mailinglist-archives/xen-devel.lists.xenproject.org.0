Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884372DED7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547968.855669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q912r-0005X1-9Y; Tue, 13 Jun 2023 10:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547968.855669; Tue, 13 Jun 2023 10:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q912r-0005Up-5u; Tue, 13 Jun 2023 10:14:37 +0000
Received: by outflank-mailman (input) for mailman id 547968;
 Tue, 13 Jun 2023 10:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSml=CB=vaga.pv.it=federico.vaga@srs-se1.protection.inumbo.net>)
 id 1q912p-0005FJ-Qh
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:14:35 +0000
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1710ddea-09d3-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:14:32 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 572CEC5C;
 Tue, 13 Jun 2023 12:14:32 +0200 (CEST)
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzXKXS9F3agU; Tue, 13 Jun 2023 12:14:29 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by mx.kolabnow.com (Postfix) with ESMTPS id 33888A6F;
 Tue, 13 Jun 2023 12:14:24 +0200 (CEST)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id 358533500;
 Tue, 13 Jun 2023 12:14:24 +0200 (CEST)
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
X-Inumbo-ID: 1710ddea-09d3-11ee-8611-37d641c3527e
Authentication-Results: ext-mx-out001.mykolab.com (amavisd-new);
	dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
	header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	message-id:references:in-reply-to:subject:subject:from:from:date
	:date:content-transfer-encoding:content-type:content-type
	:mime-version:received:received:received; s=dkim20160331; t=
	1686651269; x=1688465670; bh=94135Llpo4X+SaFFGeVF4swSyy+5MGZ6pEN
	GkoD9PzI=; b=COiv4Xy/HgpKYDWq2SGnRCUqZRQUFU8kPYWDbzEk2OvLpBay6z1
	U9DLvTiXU4YERZPI6gUc/yTgvIS3IuvP8kOSPvWkn0l1qTZfWRmq6dQAE1rGYWjs
	rfhNiyhxUobBWE3nuSRo8jjEj4B/k92UQtD+p5iNsV3RZ2rXDedQVSsfYmZmct1V
	1i9a/nA3TZKOwRqNfaDhUPesBJu+i7OTwMIQIg+Tsdbs6w+eoxvR7O2KGY15QatV
	FKupam9oHEa7NKdfZ9mI8sj3nwndNhxknzH0sDPOKY1frrgvPiBbCEVfLNm2CoOF
	fDNSqJsx/k/uBVAv7jwSk0EVnTe5Zc7lvtze2kFYW6+SPq8dtWvaiAo0iJnpZazF
	DKQHKcEpyV3umm89c+Od2I08Lg333Hwrx07XaFVvBuX2S/1HGgjPDwF0a5rJIzL3
	4tiWp9YngvStOgIqlZBzAMEUkm6PIBuZg5RI9rfHHrqNIgg/dpGyPqZtamL4Z2PN
	P+6LyvORze/gBoc0S1+s/kdCIssBrBXXcNmfsLaF5Qr0eVvc6o//SOmY9LQcNG9a
	JNZYfwgn1dJA+LlYzE4zUktSssF0cvO9ArvH/ZWLfuJT/EXCrDi7u0qcocSedyBK
	Y8L7KIQSw8QWFvSkgoCxlWw/O/niNRKHxPVoVJ95zPQl7o1JI7IgKH58=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level:
X-Spam-Status: No, score=-1.899 tagged_above=-10 required=4
	tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
	autolearn=no autolearn_force=no
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 13 Jun 2023 12:14:22 +0200
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet
 <corbet@lwn.net>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Lee Jones <lee@kernel.org>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] Rip out simple_strtoll()
In-Reply-To: <20230610025759.1813-1-demi@invisiblethingslab.com>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
Message-ID: <5606bac989cc4ca706d04faf196fc6ab@vaga.pv.it>

On 2023-06-10 04:57, Demi Marie Obenour wrote:
> It is not used anywhere but its own unit tests.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  Documentation/dev-tools/checkpatch.rst             |  9 ++++-----
>  Documentation/process/deprecated.rst               |  5 ++---
>  .../translations/it_IT/process/deprecated.rst      |  9 ++++-----
>  .../translations/sp_SP/process/deprecated.rst      | 14 +++++++-------
>  include/linux/kstrtox.h                            |  1 -
>  lib/kstrtox.c                                      |  2 +-
>  lib/test_scanf.c                                   | 10 ----------
>  lib/vsprintf.c                                     | 14 --------------
>  8 files changed, 18 insertions(+), 46 deletions(-)

> --- a/Documentation/translations/it_IT/process/deprecated.rst
> +++ b/Documentation/translations/it_IT/process/deprecated.rst
> @@ -118,12 +118,11 @@ Per maggiori dettagli fate riferimento a
> array3_size() e flex_array_size(), ma
>  anche le funzioni della famiglia check_mul_overflow(), 
> check_add_overflow(),
>  check_sub_overflow(), e check_shl_overflow().
> 
> -simple_strtol(), simple_strtoll(), simple_strtoul(), simple_strtoull()
> +simple_strtol(), simple_strtoul(), simple_strtoull()
>  ----------------------------------------------------------------------
> -Le funzioni simple_strtol(), simple_strtoll(),
> -simple_strtoul(), e simple_strtoull() ignorano volutamente
> -i possibili overflow, e questo può portare il chiamante a generare 
> risultati
> -inaspettati. Le rispettive funzioni kstrtol(), kstrtoll(),
> +Le funzioni simple_strtol(), simple_strtoul(), e simple_strtoull() 
> ignorano
> +volutamente i possibili overflow, e questo può portare il chiamante a 
> generare
> +risultati inaspettati. Le rispettive funzioni kstrtol(), kstrtoll(),
>  kstrtoul(), e kstrtoull() sono da considerarsi le corrette
>  sostitute; tuttavia va notato che queste richiedono che la stringa sia
>  terminata con il carattere NUL o quello di nuova riga.

This is fine

-- 
Federico Vaga

