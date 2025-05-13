Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B090AB5937
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 18:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983089.1369448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEs2l-0007Q9-8m; Tue, 13 May 2025 15:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983089.1369448; Tue, 13 May 2025 15:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEs2l-0007OU-64; Tue, 13 May 2025 15:59:47 +0000
Received: by outflank-mailman (input) for mailman id 983089;
 Tue, 13 May 2025 15:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJrs=X5=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEs2i-0007OE-OH
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 15:59:44 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ad9de4-3013-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 17:59:44 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2302d90c7f7so31175025ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 08:59:44 -0700 (PDT)
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
X-Inumbo-ID: 48ad9de4-3013-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747151982; x=1747756782; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyiOPlQIv7OaNEkg3KaqXanxm9PLMytrHQbLBMv3f+Q=;
        b=Qh1WFDXtZkXRcbK98sDrw3DHaA+QtEBd2M0cRLSAPO3s900ZmvS85rlLlxxxFEm9eI
         ddvp7n1Z1+ArNK7mGokWUO8N5+upf5k6fFd01k3UrM17bP4PCdsUXo1LBPEapOOmH/SA
         4bFWPolA7KUOMvKaLJH3k706gH5nyQnIeIMuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151982; x=1747756782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyiOPlQIv7OaNEkg3KaqXanxm9PLMytrHQbLBMv3f+Q=;
        b=YMNbN4WGggtTsud6z0uiI7ks+UxqdysR2yJvIposcWSEevUpzPZmpStOouONU/pNcg
         kRKMajaFNlhdOwsy0QQU+bJLw64VovDsPuQwfSaEDSf4ygROY4KtNtzUDawqrtTye5Zo
         FNDms8wemHS/7W5AKQw/2AZ9ScEOGwuts5RAXw6LImBIQoecUDilVs9g1OubeXGbxmhY
         6Ayo4wjM6wpKhKxWsmjhLKgQdd72Lrw40zUKk2V6NrOxioCu4HNronDp4XfYjSWMwVH8
         DSff9La2JVUZ17AvDVT78JIe0FSDz9eprnDzYFGIfudB6sYOGXY0tKd/ixCwCj89ZldZ
         8oZA==
X-Forwarded-Encrypted: i=1; AJvYcCVOwuce+RZ9EIkycekwQQ5Bgt8vZ2PzPzS9aGZOtfJDbu4SlUBGJW47t2YUXYibkxDkU3KtW6HpveE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIvKcJ/GhgG8iHtyJcrGzDB8KZgelpXEZQ4Mw4qxRr5MsKiBAp
	pQwSCtNEidmu503OVgheF6KPgzo68t5RCLOllSh+0jYYXiM2j2OTPl/TYG08XPW5RJPYdXhQs6j
	Gf5vepscjAc0ftJqk6qKWnXTxUSLNnHyhnxmeRAP+DElb65lI
X-Gm-Gg: ASbGncutad+iPEDuZEWCPjoNBYxblj2NkWonmrqQdfwm6gbdzaEXfW1gq+GdaRc/dzz
	ZhVw/rzIefMx1Oz/D3LOOxLpl+Xz0oQOlkKSqbFQF7KEvZgCwbW4OoAVLsLcandaUgPFCNaTgNq
	2FEVUq2XGFVQcFR/mt4D31TsKc4Cp0uQM=
X-Google-Smtp-Source: AGHT+IG2q/PQ72NOGbkd0pXPYNREjxQGQBAZGKuMIGIrpSO0EI4HBhU/kAJSe7eJq+aQTKl7GpjVumMAi5qMdXQyYzQ=
X-Received: by 2002:a17:902:d507:b0:224:23be:c569 with SMTP id
 d9443c01a7336-22fc8b7bdeamr294218075ad.22.1747151982333; Tue, 13 May 2025
 08:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com> <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
 <504f0be0-91fd-4847-8fcd-505771674814@suse.com> <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
 <55e73266-7727-4a1c-93e8-dd69712d64d2@suse.com> <CAHaoHxbvT5dbhVMnrPoWq3ma-maeLJh56N--B7svMXU+gY2Yrw@mail.gmail.com>
 <d5e62b4f-816f-4948-a9ec-4a7dedcb31d2@suse.com>
In-Reply-To: <d5e62b4f-816f-4948-a9ec-4a7dedcb31d2@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 13 May 2025 16:59:29 +0100
X-Gm-Features: AX0GCFsrIBMqFaa6AK3P-pnnWD1QaPwbaJvtnj21np3_lv_jDPyVd9AelfAze-4
Message-ID: <CAHaoHxbiQgiRpZLTP4RaEyNyhXYaUejZrESqM6NzH_t+EqdqQA@mail.gmail.com>
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Well, it's easily possible to catch that error without any extra parsing.

If `lockdown` is not the first argument then we should print a warning
to tell the user that Xen may have already parsed some insecure
arguments and lockdown mode will not be effective.

What would be a good way to check if lockdown is or isn't the first
argument? I am not sure.

