Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07388C58EF
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721653.1125244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uGP-0001NW-VV; Tue, 14 May 2024 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721653.1125244; Tue, 14 May 2024 15:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uGP-0001Kk-Sp; Tue, 14 May 2024 15:40:25 +0000
Received: by outflank-mailman (input) for mailman id 721653;
 Tue, 14 May 2024 15:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y506=MR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s6uGN-0001J7-So
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:40:23 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46476bbc-1208-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:40:22 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e43c481b53so69436671fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:40:22 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0cda6b7sm17623261fa.29.2024.05.14.08.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 08:40:20 -0700 (PDT)
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
X-Inumbo-ID: 46476bbc-1208-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715701221; x=1716306021; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tU2yXDAuZSc5ve1dF3Ml055enoyzRf2YW4t0BMnSwZg=;
        b=RtycvfqHVCOKyBsBFDMoNNXj6fw8xEy/zC+p+hrpadzXFaHiOjfIfH1HflaDg4dSXw
         DA71ahajMRDCCjimjMxgwICuQiMk+QpID4jF6fLVe9v+l4tp1VUJ6uL43U5d+biWuSWr
         TjFS+UtnM8GNq30GfEwCKAjpmjW17SiGnmgQ6taEZhF6kxLu9vZUFdVdJ286++4yfj63
         UREoNQUwRMau+KqDuA8vYOklMocu3e1hkwUsErqnNe2kshAqT+9Pkx8TpRTMjY639iUJ
         EyJ44JLcAp4Yc7cp686MNLCHlpfqo8yBvnYWpE1Ru2KQXFGy1qVUnFOxe1BN9SS+y5CD
         tiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701221; x=1716306021;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU2yXDAuZSc5ve1dF3Ml055enoyzRf2YW4t0BMnSwZg=;
        b=Ark5YlarR0RQi8eRUkg/SffUZqNISyhx10Qs+Bmr6RegHeD53e2Pw7TRAsm3s2pOsZ
         hfwWyLG49Sod4u7g4na5kkexpof3cPqXTgFWPoZKZB5VUXzFmH4FnkBrOiPmGAEmBWK9
         V6suMPTcrepRxkimGTBX+KFY8PoooTJlWa7i2d4lPl1HrBoLYi+9USGCjGA6zWM0PGLc
         HgHrZduUFuxiJvgDj992tJuPOiHn3QxdcbUC6FWbGAGnEDxpeCH9bCT+xffHNBQgvoRn
         iPSQU+5SoF3TBMsC4KH6mAh+OB3Z7l0uqdNcE948G0sECrUIlxTgO+mZ9XYilkhA0EZ8
         XjOg==
X-Gm-Message-State: AOJu0YxjbIveqEaAb9C7YSWzO6iEvNmRIp3kl9zsaoL3VRLucPeG1s9i
	ktaVondWzb9Q0+JGNm/s8s6yhBsVxMVMkEDQh5vNCObRRXaUV2g6h0w8JpaM
X-Google-Smtp-Source: AGHT+IFFMe/WXqEjDVJHc6BeTX4cEx9P9c4vvJSkaA/dHAqA2cEq+bbSE9KSN2XPy+biLXb1DpQHhw==
X-Received: by 2002:a2e:e02:0:b0:2d4:54f2:c409 with SMTP id 38308e7fff4ca-2e52028d78emr80870171fa.38.1715701220984;
        Tue, 14 May 2024 08:40:20 -0700 (PDT)
Message-ID: <a72f75b9edc4255761ff676d6a09a966290a24df.camel@gmail.com>
Subject: Proposal to Extend Feature Freeze Deadline
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, Henry Wang <xin.wang2@amd.com>, 
	kelly.choi@cloud.com
Date: Tue, 14 May 2024 17:40:19 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hello everyone,

We're observing fewer merged patches/series across several
architectures for the current 4.19 release in comparison to previous
release.

For example:
1. For Arm, significant features like Cache Coloring and PCI
Passthrough won't be fully merged. Thus, it would be beneficial to
commit at least the following two patch series:=20
[1]https://lore.kernel.org/xen-devel/20240511005611.83125-1-xin.wang2@amd.c=
om/
 =20
[2]https://lore.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@amd.=
com/

2. For RISC-V, having the following patch series [3], mostly reviewed
with only one blocker [4], would be advantageous (As far as I know,
Andrew is planning to update his patch series):
[3]https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@=
gmail.com/
[4]
https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/

3. For PPC, it would be beneficial to have [5] merged:
[5]
https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptoreng=
ineering.com/

Extending the feature freeze deadline by one week, until May 24th,
would provide additional time for merges mentioned above. This, in
turn, would create space for more features and fixes for x86 and other
common elements. If we agree to extend the feature freeze deadline,
please feel free to outline what you would like to see in the 4.19
release. This will make it easier to track our final goals and
determine if they are realistically achievable.

I'd like to open the floor for discussion on this proposal. Does it
make sense, and would it be useful?

Have a great day!

Best regards,
  Olesii


