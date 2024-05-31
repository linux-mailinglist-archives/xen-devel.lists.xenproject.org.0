Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225308D5B3E
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733326.1139492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwPA-0007GL-Ei; Fri, 31 May 2024 07:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733326.1139492; Fri, 31 May 2024 07:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwPA-0007Ej-Bh; Fri, 31 May 2024 07:10:24 +0000
Received: by outflank-mailman (input) for mailman id 733326;
 Fri, 31 May 2024 07:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDPo=NC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCwP9-0007DT-0g
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:10:23 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8393343-1f1c-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 09:10:22 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52b7b829bc7so1979639e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 00:10:21 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75f0asm231003e87.181.2024.05.31.00.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 00:10:20 -0700 (PDT)
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
X-Inumbo-ID: d8393343-1f1c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717139421; x=1717744221; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=asD06tKeYOLm9DU4GcU4NryDvwgLkhMMNNwedXmQIS0=;
        b=GiQNEIAj+EM6ObHp5zY2Iisp0jS1UmSpZhwQEC7hoi2EaHpgTqwjGdAPf4YOR3WHc5
         cxxZVFYDDLbK94iLIjObCLZhRuEIrj0bnK7tdRiDQLiDn3THavFbVMaYbREEIiay7g/H
         ueqv+yD+ovqHaRFzxNHAYdfp1cl7a5jITw79WFkVBM2aEBpTk2VWwVmglvDwBnezQ3Rv
         6HSZijk3lty9KiZFK47mCCK3c07RGk7R2KgqPa2C4S1XOAHkLky5lGqZknOIyG7BUjg0
         B5Ret+9xjHRsludKEeeH6b8RojJpZwU21kYvv/qNfwHhnvqC61M/oprBpui+PiLLaQtR
         Hr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139421; x=1717744221;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asD06tKeYOLm9DU4GcU4NryDvwgLkhMMNNwedXmQIS0=;
        b=vw8Za9g+9jOFDXUVZ2T2DGttopgZV0QGjl1y4ewF8s7eavMJ04iXAlsHkFIQZ0Kt9c
         saE0+DCmCSep0tzF4yQ7A9dPDkYK2UtC+9oOYMb1JB2Ovtvr2JlyZshXwoAUKbnmKJdB
         GGD89d1qu8J8JVb3LObQB8JLYOfmo+hP7qT7v0z2xu87y4ogTRSHG5enqKrdUH1+F1KC
         6Fx68ll3ggA8vTnkNWcTXqttic/IBjZ0SZA++IgYru9rlVbHyDkG1JN6HSeYoxUg/2L0
         4Sg067TDqdRQbQyBO3ZpSJKYUZmLqgfKx1epGEXO5Eb/AiyhdE4TEhszIAxDlp7j6Iub
         R13Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeVDeBPSeF9sUTjCPtMFYPScInkp3pSjCaaJI7aGfcTqFGGYpBC7tqn/UTIgyQjfZy16N/6XkTvzlcXrLd/UIUiPGeaXru0TQ+zNBDxKE=
X-Gm-Message-State: AOJu0YzNqLx3xJ/9+dDD1biBrA3a5aDV5DQOjyce/2v2hhiBvi5au3K8
	N8cfdC60Fx3xqEIrrV0lPdSrQs05B5jhDcjBZS0mTYhUn/xvk9Ek
X-Google-Smtp-Source: AGHT+IGLkYNkMpXu5uTi5c283Ga1Vd77e13m6jsBgozEB6pKOjR9Nyvyhg6kB+g0D7a8yQDUxb3TnA==
X-Received: by 2002:ac2:5222:0:b0:52b:6d5c:bf68 with SMTP id 2adb3069b0e04-52b896cbe85mr454221e87.57.1717139421108;
        Fri, 31 May 2024 00:10:21 -0700 (PDT)
Message-ID: <a0e350d7f15c36025624e1ed9328062e6be3a752.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/3] CI: Misc improvements
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Date: Fri, 31 May 2024 09:10:20 +0200
In-Reply-To: <20240529141945.41669-1-andrew.cooper3@citrix.com>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 15:19 +0100, Andrew Cooper wrote:
> All found while making extensive use of Gitlab CI for the bitops boot
> testing.
>=20
> For 4.19.=C2=A0 It's all very low risk, and improves the
> utility/useability of our
> testing.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> Andrew Cooper (3):
> =C2=A0 CI: Remove CI_COMMIT_REF_PROTECTED requirement for HW jobs
> =C2=A0 CI: Use a debug build of Xen for the Xilinx HW tests
> =C2=A0 CI: Improve serial handling in qemu-smoke-ppc64le.sh
>=20
> =C2=A0automation/gitlab-ci/test.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
> =C2=A0automation/scripts/qemu-smoke-ppc64le.sh | 13 +++++++------
> =C2=A02 files changed, 11 insertions(+), 10 deletions(-)
>=20


