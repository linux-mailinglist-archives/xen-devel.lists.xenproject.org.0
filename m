Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900DAB4533
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982111.1368661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZBR-0004js-NC; Mon, 12 May 2025 19:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982111.1368661; Mon, 12 May 2025 19:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZBR-0004hF-K1; Mon, 12 May 2025 19:51:29 +0000
Received: by outflank-mailman (input) for mailman id 982111;
 Mon, 12 May 2025 19:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZBQ-0004h9-Jl
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:51:28 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ced6cc9-2f6a-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:51:26 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-af91fc1fa90so4071083a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:51:26 -0700 (PDT)
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
X-Inumbo-ID: 7ced6cc9-2f6a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079485; x=1747684285; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy55oasryzHFf+6/8nS49qGQuO8xmK/rl+QKDdDFLaA=;
        b=IM1aLO5tZ+fmZumnOJFmwLlrf7noXTVPhtELskI4e/XvF9RRFHkHkAHo5n1jvSIkV9
         UvF2H0mLCWTM0Ip0JMyJRF2fsMz5dDSm8mL8Y64Zq8u5GSSAk6aV3M++YK9e5jwugNa6
         Lp+cchPcmUN/Jj1cBWLsJgTgh10OKhHEN78HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079485; x=1747684285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy55oasryzHFf+6/8nS49qGQuO8xmK/rl+QKDdDFLaA=;
        b=P0PTAVQGFUOh5/oXzk8UdTA7YbF7XhOLPyhYlx3gcKkIPOFHLV8avNdhL7e+tXHOoi
         /W5yXp25TA5Gyhi9I7g/TqkxetXG4LUfttPXE+3y+BbyZhtn5+wL4EdmxZdGlVNyX5c4
         bYMrnp5WzoAkKEjtmzkuVUCDdWo1tk2nV/K4BNaxeC34JC3TFQ9PvOElRF03SCgW7PMj
         X8LEsHxR803Qiyldgn3o9RZmgoKtq7XgmmW75kd8X2pBm+dBl7JumtDlnpwNAXk1lBm4
         0Oegj0Af2AD0KmAD60Fm9LxjLllJ8pHUY6pEe/rRjkrw5pUfqoQjkAXgMwkbu9xvL0JM
         cf7w==
X-Forwarded-Encrypted: i=1; AJvYcCWfVg1oOa3a43/ZxdoHSgorwG9GF15IVY0j3KXi/3BQ+x8UQK3QAkDnFjRwBsOE4W5B0oZ9vj2Dzgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzL3TUUY6nW6Ao3Efghm67jluOK/NSmuQJndYOWheg9GzoDphJA
	VFST0PcCj2XxAl+vXp3aziT2lYm/HxmcrZ6Hplh3OR6c+Hz35HrQ5FIOf6DWz2LGsBkJvmR+c7o
	WnJ4sK6gPLZhXPX+oOsbfyfjEmr95J5MGiFk/Vg==
X-Gm-Gg: ASbGnctFx3vj2GltEWRUmo9FL9vwPk6hX8MqsMwSpT2FUdhA/MFm7K2rHLK9mgzxohj
	JtAIKcn5nZxPVqnrByrC43FbfuCddORshGCfkKtmkhu+MADlVR6fqQF2QdFSCQl5E3TPmRSjPbA
	rqd2a8/d9H0VyzvWWoh0RFaL+kEQWeO4k=
X-Google-Smtp-Source: AGHT+IHMjWF9bZOpluLTAZWkfejyWmEm7tMplZsXI7HMT3url/Q+p/yPRo5o8wffOXkL+d9pQgZ6Mi0JTXUsucxCA3M=
X-Received: by 2002:a17:903:41c1:b0:22e:62c3:6990 with SMTP id
 d9443c01a7336-22fc8b33517mr182103975ad.16.1747079485041; Mon, 12 May 2025
 12:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162510.1676425-1-kevin.lampis@cloud.com> <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
In-Reply-To: <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Mon, 12 May 2025 20:51:13 +0100
X-Gm-Features: AX0GCFvnRToYWacK64ua10lcXPyrNZliAql0Ch5T2-6fZdJ1Wz0wy6WLkmhb_NI
Message-ID: <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:39=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> I can't spot the effect the comment mentions anywhere in this patch. Is t=
he
> description perhaps lacking some detail? It's rather odd after all to see=
 ...
>
> ... such custom token splitting ahead of normal command line handling.

If the UEFI firmware reports that secure boot mode is enabled then Xen
lockdown mode will always be enabled.

But we also have a command line argument to enable lockdown mode without se=
cure
boot. This is the thing that lockdown_init() is looking for.

It is important to know if we are in lockdown mode or not before parsing an=
y
other arguments. Otherwise there will be a race between parsing potentially
unsafe arguments and finding the lockdown enable argument.

