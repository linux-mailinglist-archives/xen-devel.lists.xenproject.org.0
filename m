Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8236E85462E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680309.1058383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBgG-0008JS-Kl; Wed, 14 Feb 2024 09:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680309.1058383; Wed, 14 Feb 2024 09:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBgG-0008GZ-Hn; Wed, 14 Feb 2024 09:35:52 +0000
Received: by outflank-mailman (input) for mailman id 680309;
 Wed, 14 Feb 2024 09:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBgF-0008GT-BC
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:35:51 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe8bea1-cb1c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:35:49 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3cede53710so201321166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:35:49 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 jw18-20020a170906e95200b00a3d606ad367sm84807ejb.38.2024.02.14.01.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:35:48 -0800 (PST)
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
X-Inumbo-ID: 6fe8bea1-cb1c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707903349; x=1708508149; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jm4piMvAEf9h/Ke1toGz6mjDyUEI8hyJyycjFH3AcA8=;
        b=hwy02Xb5MIPRCO/SgBHuM8RcuVDh3TWRM6q2UHQY1Z3WjkxvAAY6s4zjVi5xjqQ/ci
         0Uq2rgl6QJE1Fn2tqHIglE4ywYOphBcFO4/vnkwqUDGLopqaLaRPlpSLBJt+FhBaRFeD
         x7/sJHM1cBsGc9BTFZwz0fwnLXDZbSjPUN0z+kJY2OsilZg9SaT7vn5hq5NoZuYQlRTF
         2ndBHctLBfGdsTc/9Kly/1R5plo6bG0rI9lvbT0gUINb8JazwOOZYJF7nRSMCF9CMX/s
         Q1XMdKqVHeW1YT2CQNX5qmmFGO5Lds+T8QfFmoPcQWj9mFOQQOSpYXFFpc4L7qPDW9rQ
         YbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903349; x=1708508149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jm4piMvAEf9h/Ke1toGz6mjDyUEI8hyJyycjFH3AcA8=;
        b=lD5THyaIT0vkccL89qELpRY8aGuCyVp8/WFKzoX5eBCsk4lq/ezf48UvzgeKiO5ITw
         wfmYbKz5l7Vbvlr06HWvxYBOOgXe3YtMdKVH/iHgij0BMMehLtxFzpNZF2u1lk8hrnZj
         Oj6kNkI0kJmPTk97PGV/HKPmtFMFF2ISn1eeKCWmCUeeCEsJjwVELvtvSVtI9dDa/P/c
         Y4nMtZufJkoZx6LBBGVJYwZqZROV/dpEj+ivRWWXSVO9oN/prFYBtjI8DJFT1HirDPor
         jh27aqdW36Z4qx8jE9I4nrWSEeocPOSi6u/3agUzVKvbP57vkBENHu5zEq1Q1RvL1aEd
         awHw==
X-Forwarded-Encrypted: i=1; AJvYcCXI7VFS+j5JGRcUDUeiwv3rDfGTc1ZPWg7aXdsS7LxSW1KxsJNGIufKZOIi/quFhp/nNk70YFF7s52aErppI+aqSw5h782ltmuS2U7xGyM=
X-Gm-Message-State: AOJu0Yz7LGsIvQusG1havwqxTReCdJho156yR2OkJXtt3iKRn2FHOkDu
	vR9CzTEwuIRL3JV2CgJc3vqKLqejdcDl1aj9ujJTWLvtLWNMu4JN
X-Google-Smtp-Source: AGHT+IGkgu301vkQpKrx9qs6p7JGMW0OKBRVP+Cbe3+5a/ekBvf6YqTf1Pr4DlpXqMtIUYeyrYAfEQ==
X-Received: by 2002:a17:906:48e:b0:a3c:cd89:edb2 with SMTP id f14-20020a170906048e00b00a3ccd89edb2mr1571243eja.22.1707903348684;
        Wed, 14 Feb 2024 01:35:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFM0XDq6DySXxtBtLMUU1ynIy5FiLs2U7AxeH2JLG01oTja95kZlisaQYITSzE0XvSi3RCe/nm3mgCLjretUYfwzag5ks/LfyZwhdf24Z7K52CFTz7Ic9DWE54yE92sC2yOvGzl2wMwE/x1SEjOSg708CF5Pkykk6/Azqx1OU09JgVYkJObqQLueNJOfhVww0OfKhSJYM7YlYjEJFpqm17yJw5PcNAWcZRV8GQGrDTZ7vIXUu/XYai6KcLD2DFT6m7UOMu6bgPNGs7P6ddUSXCK0vkeMaaesPXaw6Yv380JDXflcjdhjMIEyDZS2+KVNWUf03yE1ipxy2nnBWLLflwqcuQOc9f1wb0OQ==
Message-ID: <656dfb55b67e78061e83ca5863b515fa9b6de24f.camel@gmail.com>
Subject: Re: [PATCH v2] xen/lib: introduce generic find next bit operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>,  xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 10:35:47 +0100
In-Reply-To: <f8534623-39bf-4c4a-9236-ed5bd3d655c2@suse.com>
References: 
	<fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
	 <f8534623-39bf-4c4a-9236-ed5bd3d655c2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 15:15 +0100, Jan Beulich wrote:
> On 09.02.2024 18:58, Oleksii Kurochko wrote:
> > find-next-bit.c is common for Arm64, PPC and RISCV64,
> > so it is moved to xen/lib.
> >=20
> > PPC has been transitioned to generic functions from find-next-bit.c
> > since it now shares the same implementation as the PPC-specific
> > code.
> >=20
> > The MISRA exclude list has been updated to verify
> > lib/find-next-bit.c instead of Arm's find_next_bit.c,
> > as Arm's find_next_bit.c has been relocated to xen/lib/.
> >=20
> > Despite CONFIG_GENERIC_FIND_FIRST_BIT not currently being used in
> > Xen and being removed from the Linux kernel [1], it could
> > theoretically
> > prove useful for Xen. This is because the Linux kernel transitioned
> > Arm to the generic version of find_first_bit() and
> > find_first_zero_bit() due to improvements [1] in both performance
> > and .text size.
> > It would be prudent to investigate whether [1] is applicable to Xen
> > as well and, if so, implement the necessary changes in a separate
> > patch.
> >=20
> > [1]
> > https://lore.kernel.org/linux-arch/20211005054059.475634-5-yury.norov@g=
mail.com/
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Thanks!

>=20
> A revision log would have been nice, though.
Missed that. In case if it will be needed a new patch version, I'll
back the log.

~ Oleksii

