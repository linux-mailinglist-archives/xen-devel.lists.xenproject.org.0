Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF825948CE5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772777.1183227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHYh-0001VW-Ni; Tue, 06 Aug 2024 10:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772777.1183227; Tue, 06 Aug 2024 10:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHYh-0001St-KM; Tue, 06 Aug 2024 10:36:51 +0000
Received: by outflank-mailman (input) for mailman id 772777;
 Tue, 06 Aug 2024 10:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbHYg-0000EE-3X
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:36:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c980031b-53df-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 12:36:49 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so50343766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 03:36:49 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3cfesm538440966b.2.2024.08.06.03.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 03:36:48 -0700 (PDT)
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
X-Inumbo-ID: c980031b-53df-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722940609; x=1723545409; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFtBrtEcDkT8CUfFVYSUAwjgVLP/XZHVGTf/vOi9tU4=;
        b=fHtb0MviEBLAgsI0KQVcdxxhywAiMRIyUERPTbnahen9sfd6iAqIV7H4mxI5GQOMf9
         peEdfggzut+panaldW/K8+Iv5Zo/0293juQQbt0gAvcq4dfgsPeGJVm/Nviiv3BY1hNU
         jV4HWXj1hXkzm2HUcv6bBYT+hQKmrLYLhfzdd0rfymWuJWHHKL4npUQ1uFB44fVle+TZ
         9d+IFmLBSal5w1uFR3nQmEGmCtjVTrXC0LJOi5ShHgJIOfMMTlZdg0LI8thdRp+FJCdd
         zbKNv5mOyB5FtNIUBITL8zHw76jCbq38oxQ4Zhbk45b3+XGEDbQbpX91aPYuJkBZnBIs
         C87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940609; x=1723545409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFtBrtEcDkT8CUfFVYSUAwjgVLP/XZHVGTf/vOi9tU4=;
        b=cAMYb3988hsx1RFa47j4PW4Fs1QJvAiUicS+fWXRTv4SIgrxw/I8vp6xRObO06yL5L
         4+2MUjsEeJWfIuPYshcZuTMEA6p7ajjnS5tD/uK3ZYZMr6Z4Lzl0jlSfyXYlK58jqKic
         dI4k9zSQAlWhEQqRnTwWMkhLPmVapBiFI6KUxx066LJBD0QkLq7OMEuZlDr0NG8t7tVo
         v/UpTXUVTu9NRnPGnU8mVtw1KLUR91mfvCCXB3hQI4PPZfVckTHvmWXJB456God+3NY1
         p27Kq5w9P8JUru9vylf3VRAvcHZBdsU9om8LYAB0mERAx4Pa5SEgIhHs33WYr738KCxI
         F+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYY2ix0+Fsu6fhiJnsDF02RKPDrOoQ5dhJ/1XixG6UuIRI4pIh1m91Hz8pqpBtWSQ9dchU+IJjf3p+mbFORVFKQhKF6W7+BqmVG1SRcj8=
X-Gm-Message-State: AOJu0YwkS5/Mrm1HYqtQ5W+0X6Fiiy5nqf4qlEIm6xqnjEHvzJ0tLWPL
	DOoLa3+nkN3tAIyMjxp6eUWssdfzg5hukxQxeTsI2gNEKgxAGQrY
X-Google-Smtp-Source: AGHT+IFAW/Kl8lG1/5m3thEc/a0rVPmSeemlvrs7mENtEc7wb4cFsw5agBZItQMSvGxkjYBCqf9X2g==
X-Received: by 2002:a17:906:bc21:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a7dc4da7644mr1057348766b.7.1722940608812;
        Tue, 06 Aug 2024 03:36:48 -0700 (PDT)
Message-ID: <d4378fbd76517b8745d3cfce9fabdf2176fc2bcd.camel@gmail.com>
Subject: Re: [PATCH v8 2/2] xen/common: Move Arm's bootfdt.c to common
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Date: Tue, 06 Aug 2024 12:36:47 +0200
In-Reply-To: <c8aa0451-4a99-4496-a5eb-cb4cf6b49862@xen.org>
References: <cover.1722856894.git.oleksii.kurochko@gmail.com>
	 <85321f4a2fc7f1d892aa658603bffaae25249045.1722856894.git.oleksii.kurochko@gmail.com>
	 <c8aa0451-4a99-4496-a5eb-cb4cf6b49862@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Mon, 2024-08-05 at 20:01 +0100, Julien Grall wrote:
> Hi,
>=20
> On 05/08/2024 12:33, Oleksii Kurochko wrote:
> > From: Shawn Anastasio <sanastasio@raptorengineering.com>
> >=20
> > Move Arm's bootfdt.c to xen/common so that it can be used by other
> > device tree architectures like PPC and RISCV.
> >=20
> > Remove stubs for process_shm_node() and early_print_info_shmem()
> > from $xen/arch/arm/include/asm/static-shmem.h.
> > These stubs are removed to avoid introducing them for architectures
> > that do not support CONFIG_STATIC_SHM.
> > The process_shm_node() stub is now implemented in common code to
> > maintain the current behavior of early_scan_code() on ARM.
> > The early_print_info_shmem() stub is only used in
> > early_print_info(),
> > so it's now guarded with #ifdef CONFIG_STATIC_SHM ... #endif.
> >=20
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks.

~ Oleksii

