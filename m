Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C254816A6E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655759.1023510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFATm-00079Q-TZ; Mon, 18 Dec 2023 10:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655759.1023510; Mon, 18 Dec 2023 10:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFATm-00077l-Qv; Mon, 18 Dec 2023 10:04:06 +0000
Received: by outflank-mailman (input) for mailman id 655759;
 Mon, 18 Dec 2023 10:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFATm-00076O-0T
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:04:06 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6234c44-9d8c-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:04:04 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cc5a0130faso22897641fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:04:04 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a05651c158100b002cc6843108bsm645584ljq.41.2023.12.18.02.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:04:03 -0800 (PST)
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
X-Inumbo-ID: c6234c44-9d8c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702893843; x=1703498643; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q3q+WJeZahjrDtBWxkMwuCI2o49JSbRrdJ4UjvtwwqI=;
        b=a4qrZ3Z7XwI/pxjtDvc/P8gKdRWwxmwW8cq4+iRwGjV4cq8cQd6JulN40hZZyC0gjx
         kTjFM9jMhgAsD1sqJ8uKYY3AmNkJK4KPbVAbGlTv7KDIq5Ys2M5qAoJ5SnwSdl7cszVk
         hLDMgTBn6Z4LP4paELqX0pd9drOynWscqLMt/D+jNHJEzz2opmCknvmn4++m0/m7j2zw
         4UqcJkNrcl1fZW6ByfXPtl2RllJ9U/Ub4CKxPmZLcyI6MZkZ1vrTbdw91NFcysOtgJZP
         BWfQkhkTHYMb7hASW1Gr7jB3yr+UxmeXeTsFoU1IpfPGThAq9hrXrIM4IOVJJFaWsrm9
         DdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893843; x=1703498643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3q+WJeZahjrDtBWxkMwuCI2o49JSbRrdJ4UjvtwwqI=;
        b=k/hWuLTUYrrAZQpBQyHA4bfmxUoffRNF5mxideVklDeyTk4lpoPGyO7osCOfY36MoY
         ZdZlLVdTIVT7a8rhbi3oa4TX93LrLSepkdDZfJPgPm1hFJQUAkt6bLg8xl0fcxcuCfu3
         1GeGF4ymUUkR0I43iitNeRrW4PUnPEhGiPaTC6EoNAGY5HM/xAPuPhUPmbKDnrOySa70
         IKY9k6GXegbagVTsByv0URFhlpl9Gr5lC8dxYJUGreg2phPXg6TOF+PoPg9tRAqoNRL1
         wz6dJ1Kskxskcvmjz4hwnmN1bJbqYdXgn1vcq9tOL3wz8rUimRku5OsQ8UD2W+EBK4eF
         8Kvw==
X-Gm-Message-State: AOJu0YxISh/pZIvLA2uFbieXSNWey4sGbxZwIhYsgP6+RoCTevLblPqe
	hTMvdkomcUM5pH3uOLmbVvE=
X-Google-Smtp-Source: AGHT+IHcYZt6eK2QPUbrxpFGI95kJn4KJXgPNPun56K6jzzC2m4hjf2s9SBpUubHAiuhOTrlYr8rVg==
X-Received: by 2002:a2e:bcd1:0:b0:2cc:2b1c:e2a0 with SMTP id z17-20020a2ebcd1000000b002cc2b1ce2a0mr7304926ljp.106.1702893843430;
        Mon, 18 Dec 2023 02:04:03 -0800 (PST)
Message-ID: <d50405f2181396931941874f24c5018800cc5b44.camel@gmail.com>
Subject: Re: [PATCH v2 24/39] xen/riscv: introduce asm/irq.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:04:02 +0200
In-Reply-To: <479cd511-c01b-4460-bafc-2d3943956914@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <e9fc98cad562dad495ac1eb87b98be77cda72524.1700761381.git.oleksii.kurochko@gmail.com>
	 <479cd511-c01b-4460-bafc-2d3943956914@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 15:09 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > 	- add ifdef CONFIG_HAS_DEVICE_TREE for things that
> > shouldn't be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in case !CONFIG_HAS_DEVICE_TREE
>=20
> Is there going to be a RISC-V build without this enabled (selected)?
> If
> not, I'd recommend against such pointless #ifdef-ary.
For this stage (Xen RISC-V full build), CONFIG_HAS_DEVICE_TREE will not
be selected, but it will be in the near future.

~ Oleksii


