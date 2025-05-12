Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DFAAB33F4
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981081.1367471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPks-0001EY-No; Mon, 12 May 2025 09:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981081.1367471; Mon, 12 May 2025 09:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPks-0001BT-Jx; Mon, 12 May 2025 09:47:26 +0000
Received: by outflank-mailman (input) for mailman id 981081;
 Mon, 12 May 2025 09:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEPkr-0001BN-36
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:47:25 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a61dbbe-2f16-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 11:47:23 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2c769da02b0so4108247fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:47:23 -0700 (PDT)
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
X-Inumbo-ID: 1a61dbbe-2f16-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747043242; x=1747648042; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h25lVqn72bj1XF2ohwpw077vyNok8RC37a4R1zyg5V4=;
        b=uRjTvabIzIoXzj3oy+AWHLkRNmVUPO4ZxVI0Uvfv5UrUd2Os4e/NlnUWQNFO3peGeg
         IYnPb9/OV5O5U/0S786mJdHMZ7gce+mO/AyM0bVFcKluKQgy0vhhvHrVXklxMSdZ+VLW
         H7v4E6tvAZHpCdeyZgbOerl8g+mma7B7ws6YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043242; x=1747648042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h25lVqn72bj1XF2ohwpw077vyNok8RC37a4R1zyg5V4=;
        b=W4om1uTZyypWjG/8a0fDM2V3UmZ+Ska5ygdoyEZu90X6RvMudmwdSu27MML+KcpMKn
         /Gs9v3Rne5NRRkNDS0xHVcfXCvvVo0Ww4oKNnvi11ATculAvbEC7FGXmM2yFc/D9sdd5
         I/qlvXTtuqyFQ2+bHLSsCSSXAMdRFGJ74+EV7kYXCIYkKoD5cHdNDszCUQNuk721WHeg
         ppidGs1IW9xUkCvtR3AWtuwgvcKAIh+qiK3EqspSg0KqlyRZt3Jo9CNrVHnyBA8/D0j5
         pJ0SpN4RAW6syhwGuSWhE8bGpgVne2dsatXcOOqFmzs379gFgfWOLmyNGImbqYGFECC7
         y4kg==
X-Gm-Message-State: AOJu0Yy5ndBxhFJNus10SDevB30ecWtmhmT4M2OLxKqMxjoCAExt5ihv
	GiXTsZqUiPJllFOPR9eDWYeZhOcE+5+pv9uQ1ptjzSAK9UrkRNEY/f+WWruEWMobpFaFUYX4vKz
	9fmALS1sV58FzQLWWaQXsZ6rc61yPtcq80tbx
X-Gm-Gg: ASbGnct/5LRRQJYJPOFr78rUoeGXnKGnw83bIBBn6CbAkjFNL8XbQU7225vEPXdM5+d
	hQ5CbRkDXntm/AtTOHrd0UDLWTmbiLa9YjcS58k1/1hTRMFNv1Mcu1roe8EZ+WjNCXLoHlNNtQS
	Uwfx2P7Gjd7DU8KjjVdwDWWNpl3OPm9wA=
X-Google-Smtp-Source: AGHT+IEGQexJLUUTPg9It44iQEnX4e1HpdGfDrAry2sLoy5emLTnzP/OSbgjnn0TS+qSAznC6VPfyBLIk2Tu3RcP2FE=
X-Received: by 2002:a05:6870:56a3:b0:2b8:f595:2374 with SMTP id
 586e51a60fabf-2dba456b938mr7505081fac.36.1747043242040; Mon, 12 May 2025
 02:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com> <20250509163212.2948359-2-andrew.cooper3@citrix.com>
In-Reply-To: <20250509163212.2948359-2-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 12 May 2025 10:47:11 +0100
X-Gm-Features: AX0GCFuOzBon7X8D6TaKYDLknTSlCe4NTEx7ATLagIh6KvGoVPqjNlzSMuxgvSE
Message-ID: <CAG7k0Erf-vXTgq+uR+FYKA4zieavTZU+Pper_kWTmF=vWzUZWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] xen/elfstructs: Include xen/types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:32=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> elfstructs.h needs the stdint.h types.  Two headers arrange this manually=
, but
> elf.h and livepatch.h do not, which breaks source files whose headers are
> properly sorted.
>
> elfstructs.h is used by tools too, so use stdint directly outside of Xen.
>
> Clean up trailing whitespace.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

