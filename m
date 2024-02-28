Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B586ABCE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 11:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686439.1068456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfGiY-0003Mn-Lg; Wed, 28 Feb 2024 09:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686439.1068456; Wed, 28 Feb 2024 09:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfGiY-0003L2-Ip; Wed, 28 Feb 2024 09:59:14 +0000
Received: by outflank-mailman (input) for mailman id 686439;
 Wed, 28 Feb 2024 09:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6mx=KF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfGiX-0003Kd-9D
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 09:59:13 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 052f5193-d620-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 10:59:11 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513181719easo720399e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 01:59:11 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o26-20020ac2435a000000b00512d747866asm1478764lfl.127.2024.02.28.01.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 01:59:09 -0800 (PST)
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
X-Inumbo-ID: 052f5193-d620-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709114350; x=1709719150; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uP8g1BKObLvdPj3GeR3kbFtD7/85sFX7fNf7mAGODJY=;
        b=D0XeA98httkw+tKaf8G/SeQalf8hDGHdkhOzzDljQkf+03iFiBAXYYFgcwB/BMPhWE
         NDKgCwhF/003m2Los0kf9q00ykeS+e5vbb6PcrMforZ5CxwV/AZ9aK4/RJZIm3MvLdEi
         732y7JTAly7QlKWfeiyGkl13E/jm5k4HhysTZP+ym83VRgaS+HFTuFqwV3LfhcIpCk6X
         Gb1G0/fH2fNjeb/JMoyPVaEE4IL4fzcfmbIfjqI8fY57W7AEvwkWhNmxGfbL9XQeBkRv
         aHaTWEbF0Jvz60ybFJ140iOGVkpvuA9Y5lEjkPbZv1lfDPVENytQXUVbj00Mlqwdr3d6
         L+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709114350; x=1709719150;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP8g1BKObLvdPj3GeR3kbFtD7/85sFX7fNf7mAGODJY=;
        b=Uv5nnYB1kTxVzXkFKPwNbmWOyLA5THW+VxWPQsSFPh5Nc9CNuLJIFwrvRM3q9He3+3
         FGOayzSbUHfZan09HcuBKvh0z/vQUiO0Tq3ZH4utfozzbBOZ1X8Y7kYZlrNJFcglYz1i
         wZC0ep6kqOj4Qx5y8sB5U6mBNvaqACnc8K75xcSrjBUDhs/Mk+QAVXDpc6Qi1BXImHGy
         VGyOD7hNjWCi4M/XL1U2oAUhAVjzkjZt/8PiQHlxQbEcqL8Zf+C8FZ4G0Uw0me1WFMq+
         CvV0WPYraL844yRa8hpJ/CfDa0PwGwIlcOxPHADEEpScStVBmx6QjAAvceBITv9g0zZh
         6k5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQJx/htcvnzGxS99/2ka9K4wM26RCFrvS5hlRdLF/wQuHEm+IRZ1UnDP01MddDaBjObasM8VS7BoHxLn58iO1azelOJvuubvbKgM2baBg=
X-Gm-Message-State: AOJu0YwxANCiZAjR1WmZcG0GbDRZd1SM/RcaX6VLBUA8gu/L8VKhMo1u
	3/t8tocVMJV2fgyzhABNl4W/5MtP1o/x+LgNziYa8mADTmRYR1l2
X-Google-Smtp-Source: AGHT+IHmWKmpOZ9MM/CGGUSiULBpzWz/jGboiIzRrB7SF6fRiiBgLSKtb96rZ9tbbZtmTQa2kHbhyw==
X-Received: by 2002:a05:6512:3d1a:b0:513:43e:e22d with SMTP id d26-20020a0565123d1a00b00513043ee22dmr3603754lfv.35.1709114350294;
        Wed, 28 Feb 2024 01:59:10 -0800 (PST)
Message-ID: <3637804a9dde10871b4f4a354cced82548114893.camel@gmail.com>
Subject: Re: [PATCH v5 03/23] xen/riscv: introduce nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 28 Feb 2024 10:59:09 +0100
In-Reply-To: <293c6236-1ad0-4a48-853f-afec419656e9@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
	 <293c6236-1ad0-4a48-853f-afec419656e9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-02-27 at 08:38 +0100, Jan Beulich wrote:
> On 26.02.2024 18:38, Oleksii Kurochko wrote:
> > From the unpriviliged doc:
> > =C2=A0 No standard hints are presently defined.
> > =C2=A0 We anticipate standard hints to eventually include memory-system
> > spatial
> > =C2=A0 and temporal locality hints, branch prediction hints, thread-
> > scheduling
> > =C2=A0 hints, security tags, and instrumentation flags for
> > simulation/emulation.
> >=20
> > Also, there are no speculation execution barriers.
> >=20
> > Therefore, functions evaluate_nospec() and block_speculation()
> > should
> > remain empty until a specific platform has an extension to deal
> > with
> > speculation execution.
>=20
> What about array_index_mask_nospec(), though? No custom
> implementation,
> meaning the generic one will be used there? If that's the intention,
> then ...
Yes, the generic one will be used.

~ Oleksii
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Jan
>=20


