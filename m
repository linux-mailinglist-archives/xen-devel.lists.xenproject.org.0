Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0091838F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 16:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749060.1157117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTD3-0001Ed-Gk; Wed, 26 Jun 2024 14:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749060.1157117; Wed, 26 Jun 2024 14:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTD3-0001CR-Dv; Wed, 26 Jun 2024 14:01:17 +0000
Received: by outflank-mailman (input) for mailman id 749060;
 Wed, 26 Jun 2024 14:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTD1-0001Bl-Pn
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 14:01:15 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c51e63f-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 16:01:14 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-250ca14422aso3518331fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 07:01:13 -0700 (PDT)
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
X-Inumbo-ID: 8c51e63f-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410472; x=1720015272; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcDvYxKVscZQ/IvCEyIO70fDtvFBEVaS5wPbRV4gR3A=;
        b=SQdrQ5cFWdJj2SuaUqbPv5uQ00Qz1R+8aOp0Fif42vSb9oNTPXMoDW/kgDR/ZniZWy
         T0r+khTMVpMGIXZ2i493MC6MQAQR6kM76d01afUQMh7E2P1d2LC7R5tOe5d46f7ElRhh
         +S/2Xhm162A/WQX6rezOpiV+puVpQr7goyv7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410472; x=1720015272;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcDvYxKVscZQ/IvCEyIO70fDtvFBEVaS5wPbRV4gR3A=;
        b=apvQAQCFvuRyOo09iCNqWyKxSdog4bJaIwK/wOz8XkLcZSvGnETkVO63pTaRZa4dQ9
         FA6Cz9CvdIr1kX4nTmYsEcIK2lSI49rel3D/L9oEx3q7p/cVXU0TUCfFEurka95UrAGf
         ZZOTKcVs+AQx008sA2VSfPs+RC4/OhnwQ/nwPbt9mtMPtI5dgeYLFylFy6/FQJh9Qp4Y
         biKFHqGS6qPI6PU/8Uu+wyAl4PrnCudTg2d5f+mCN+q5Jszb7xHHlJEu7ikqVBHKYM5u
         UO2FopoC46x46wn+V9hkp8lIR7SOi2lqm5buAyYRJLSmDRk+qh3W2uc/TEI9f5taMjxQ
         bYSg==
X-Gm-Message-State: AOJu0YwdM8bUkj/Fs+HcME05knaPwkLKulw34FGa4WPKD4ILLIkeaueW
	MpZ7NgItUI3O3cNex3nm+GhgROTm8njDroelNzVHmhw4gjeUS2DYWtV/xCuci2NIzNyffHRt8QZ
	sz7w9SJEQmlDoEo1n8co9WdT1+HoJGpJP+hD+oR9JkLxNJp6KDVpsQw==
X-Google-Smtp-Source: AGHT+IEXnIqA+tmUuNEeRG2+ESZO5mFLmoOVqYSMO/KqkBy/rQxzLoNfAu/7zcD+ZV5TGhP2hLX3JqT8nb9NEAogqnU=
X-Received: by 2002:a05:6870:c10e:b0:25d:5f08:6b0b with SMTP id
 586e51a60fabf-25d5f087941mr1387302fac.18.1719410472502; Wed, 26 Jun 2024
 07:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 26 Jun 2024 15:01:01 +0100
Message-ID: <CA+zSX=bS-0Q8GBu9kD-o1VN1i6V8V46PyYxNoiAMwchLsQEGog@mail.gmail.com>
Subject: Re: [PATCH WIP 00/14] AMD Nested Virt Preparation
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 2:57=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com> wrote:
>
> This is my work-in-progress series for getting nested virt working
> again on AMD.

Forgot to add, this can be found at this branch:

https://gitlab.com/xen-project/people/gdunlap/xen/-/commits/working/amd-nes=
ted-virt

 -George

