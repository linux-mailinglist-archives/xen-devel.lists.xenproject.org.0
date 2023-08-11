Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68195778BF9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 12:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582369.912106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUPJ7-00032v-VV; Fri, 11 Aug 2023 10:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582369.912106; Fri, 11 Aug 2023 10:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUPJ7-0002zz-RR; Fri, 11 Aug 2023 10:23:49 +0000
Received: by outflank-mailman (input) for mailman id 582369;
 Fri, 11 Aug 2023 10:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUPJ5-0002zt-GJ
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 10:23:47 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24d4bc02-3831-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 12:23:41 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9f48b6796so27713271fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 03:23:41 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a2e2416000000b002b9e0aeff68sm800873ljk.95.2023.08.11.03.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 03:23:40 -0700 (PDT)
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
X-Inumbo-ID: 24d4bc02-3831-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691749421; x=1692354221;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7iuEY2UnDa0+QqdwZhx+2gFy5aRcIMESe8OuaPJrHSo=;
        b=IDMSI63tV65pDf3dtRgNNG8BM6Z5hwiYJTRQPRsCr88H8CIl684K64iMOkANC9NSkO
         kfRP0btMi5V0OGYsH0RB16fnVDArvs5DgEi34t4aDfsgtoJJPGM1wNhWexsByQmrJCww
         GnhdqZNFmZWiTkHwVwbqpiOH0XvnAv5LDjY0Dg3Cd8K0ZRtOgssemWffZVdsVwDTuCjF
         rsBB+ajWgW+dPfn6NTJIfJ0ACZUyBo+JhVQUGNIrtc/mNu9ipR4rTRrZO72ihljvs4eJ
         adrxDiOwiO+ioxn8WOxt4V/tg2yj/Xy7Fi/wTcAPjVMLga0lSQCQPw5zRbAj+5mlOWAf
         BLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691749421; x=1692354221;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iuEY2UnDa0+QqdwZhx+2gFy5aRcIMESe8OuaPJrHSo=;
        b=JoPMWntqqBslwA6sQ0jVghv/JLU71mBVIdhz7H2VN/O0L4ZWjnStA1qzr0QpHwVx9Y
         AH8bI84oJ+Co9TAMTMQOQBOeQucWMML5TSD2fsHr9+8CVtApQDuaReS7VEZvxPYLn7Dr
         igbfA8oY1RoakiboM65on2KVCpZWaciV1HuiXcyDbFY4Log/9oQAHaZe0IdkVuWfJPAf
         n5Nosh39SjfLPXwkzwaTzLDTvEnRQxNYZeIrzny2t+PrDxeL77+Q6FMHTZXFeji9foUG
         bOpdmarJ0dBpwx/9Vp0L98w8fKeZVgKqUmoJ0v7wzGMEf65uVMMlq0ZawngXbvdGhEBR
         1eeg==
X-Gm-Message-State: AOJu0Yxs267J3QKuUY0sgWewhm0NlPZYu3zfF4w8PQ0C3J174TF9GG/D
	/rV+h2ETNcLxfwzbGcLgcYg=
X-Google-Smtp-Source: AGHT+IFzbb1poenr1s4QcsvohzII4Wq13Gd1Bxpl7pkcQ/JdxgurSBPlGmG0LiO8v+mmV1A/pqciwg==
X-Received: by 2002:a2e:b60a:0:b0:2b8:3a1e:eec9 with SMTP id r10-20020a2eb60a000000b002b83a1eeec9mr1189876ljn.36.1691749420957;
        Fri, 11 Aug 2023 03:23:40 -0700 (PDT)
Message-ID: <daa4d4f73e3fb67dd8ce51eff81f38167e8a5397.camel@gmail.com>
Subject: Re: [PATCH v7 2/6] xen/riscv: introduce dummy <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Fri, 11 Aug 2023 13:23:39 +0300
In-Reply-To: <b2d4db80-6719-1e8b-94ef-d839e4d6486e@suse.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
	 <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
	 <b2d4db80-6719-1e8b-94ef-d839e4d6486e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-08-07 at 11:01 +0200, Jan Beulich wrote:
> On 03.08.2023 14:05, Oleksii Kurochko wrote:
> > <xen/lib.h> will be used in the patch "xen/riscv: introduce
> > decode_cause() stuff" and requires <asm/bug.h>
>=20
> While as it stands the description is accurate, I don't think that
> later
> patch has a need to include xen/lib.h anymore. xen/macros.h will do,
> I
> think.
It looks like xen/lib.h should be still included as the code in traps.c
uses printk().

>=20
> Also please don't write descriptions in terms of "patches" or more
> generally future "commits". Their titles may change, they may
> disappear
> altogether, etc. Finding such a description later will end up
> confusing.
>=20

~ Oleksii


