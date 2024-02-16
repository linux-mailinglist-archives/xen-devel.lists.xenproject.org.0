Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102E857B59
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 12:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682161.1061253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rawCT-0003X6-5A; Fri, 16 Feb 2024 11:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682161.1061253; Fri, 16 Feb 2024 11:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rawCT-0003Ur-2W; Fri, 16 Feb 2024 11:16:13 +0000
Received: by outflank-mailman (input) for mailman id 682161;
 Fri, 16 Feb 2024 11:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rawCS-0003Ul-5e
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 11:16:12 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca23784c-ccbc-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 12:16:11 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5114fa38434so2220582e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 03:16:11 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a19384c000000b005119901e5e2sm587334lfj.53.2024.02.16.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:16:10 -0800 (PST)
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
X-Inumbo-ID: ca23784c-ccbc-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708082171; x=1708686971; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qFTJD7ZWQNAYy7lLma5emZeZTHLDT+Unm5MY/VjMcgE=;
        b=USp0LjxVTEkSoKFwRmDTrdUqFhIf857HKNuLyCPiJKDS/qaxvUiKlNAv8+xELckOEq
         zC9mteHCKsbZVNnA9ccfzc7R+mn5rtf7yblHv+EjgTEaQVkyRAN6iTKlaDfauEvTzL3M
         nQDtXpl3LmVxqyXo/2hUdjLDamXRb/q0tMOTA60FZStB5mw9yEQWBt2ncfSM4B2R6R6v
         28GzWY/C8vYFauB3yRFtOBB5DSimgeP8ohGjpXACVvLdHILwnx6ybMmHR6PQtoQJpI5J
         BJazetKaEYlae6VmGc+GvHwFD8rkxofijrPMx5QV3UsBe9Zwig+6IsczXrs90FAjiWfo
         eyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082171; x=1708686971;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFTJD7ZWQNAYy7lLma5emZeZTHLDT+Unm5MY/VjMcgE=;
        b=ZAaYMH91bVnfSsZVxey3yAXw6VioEnp1BdlbGMBkrwuYKFfcIAvkE6InzITPdBgPmW
         1eWUVBucwvKGu+onMGPS8IwMdbNnTuuv/Fa0fkTn5sIoaGABFJ6fEztDcke47NOLhkVs
         tW48n7qln7ORLuyPCfR5qRJlfsUUFO1APlCFtIThlR5/IZEnagxL1Fz58xxQWowZkpSL
         kDWMc7qDAvnHy/kwgo5Iw7jBp65RzDKXRurkuM8S2dnYdGrERJBU+iYe0yz6yk6R/nov
         axzIw/zPQJQyE4Cly/uAqDJGIsrDksPW5PyckmT8NkX8lfHvUI2LW0mUgAyCKDZt8yly
         hAsw==
X-Forwarded-Encrypted: i=1; AJvYcCXAnqVOnli2pZMBr358OcMAlt9WD3F3Rl/7MVhOZwPHjiyY+1JWD/kSrn4neD/2/rKixvQ1yRZOBLT2r8d5l13eKAJmOfD1xWbSGvqOgNA=
X-Gm-Message-State: AOJu0Yx0OcJoiHIs2TGD+wI/MhERjM6QWth2DrNSp5i68QDgeeOaLte0
	5EeB1Vp068xmy7GvDcbyTZsA7ptcVQDpZb3jKQS3l1w9NBMgLAk0
X-Google-Smtp-Source: AGHT+IGHBktLvr4FvayL3+anX4AUKAvl3jIyV4Z4LgOi22yWn6IgWj6q+8WFwc5V6OmioQvv35X4Mg==
X-Received: by 2002:a05:6512:3e23:b0:512:8d1f:de39 with SMTP id i35-20020a0565123e2300b005128d1fde39mr3706558lfv.27.1708082170445;
        Fri, 16 Feb 2024 03:16:10 -0800 (PST)
Message-ID: <0bafef389b30251bc9898bb61604aa3efaabe48c.camel@gmail.com>
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Fri, 16 Feb 2024 12:16:09 +0100
In-Reply-To: <2f1e4d2d-5b33-47ff-912b-c4693744d0e9@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
	 <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
	 <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
	 <2f1e4d2d-5b33-47ff-912b-c4693744d0e9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-15 at 17:43 +0100, Jan Beulich wrote:
> On 15.02.2024 17:38, Oleksii wrote:
> > On Tue, 2024-02-13 at 14:33 +0100, Jan Beulich wrote:
> > > On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > > > +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D
> > > > 23600
> > >=20
> > > What's the linker dependency here? Depending on the answer I
> > > might
> > > further
> > > ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_ or
> > > HAS_AS_.
> > I missed to introduce {L}LLD_VERSION config. It should output from
> > the
> > command:
> > =C2=A0 riscv64-linux-gnu-ld --version
>=20
> Doesn't answer my question though where the linker version matters
> here.
Then I misinterpreted your initial question.
Could you please provide further clarification or rephrase it for
better understanding?

Probably, your question was about why linker dependency is needed here,
then
it is not sufficient to check if a toolchain supports a particular =20
extension without checking if the linker supports that extension  =20
too.
For example, Clang 15 supports Zihintpause but GNU bintutils
2.35.2 does not, leading build errors like so:
   =20
   riscv64-linux-gnu-ld: -march=3Drv64i_zihintpause2p0: Invalid or
   unknown z ISA extension: 'zihintpause'


~ Oleksii

