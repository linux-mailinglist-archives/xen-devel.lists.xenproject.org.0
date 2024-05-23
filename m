Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B43E8CCDC0
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728178.1133003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3RE-0005JJ-SU; Thu, 23 May 2024 08:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728178.1133003; Thu, 23 May 2024 08:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3RE-0005Go-Ou; Thu, 23 May 2024 08:04:36 +0000
Received: by outflank-mailman (input) for mailman id 728178;
 Thu, 23 May 2024 08:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgV8=M2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sA3RD-0005Gi-9Q
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:04:35 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16a6a3d4-18db-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 10:04:32 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5206a5854adso6603405e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:04:33 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad3c7sm5248350e87.35.2024.05.23.01.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:04:32 -0700 (PDT)
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
X-Inumbo-ID: 16a6a3d4-18db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716451472; x=1717056272; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X2UdYcGeBEiDNLatqEDT2A8B9sTUunerNT7zZ2p/WiE=;
        b=hT8YeGrtqVbl92xB8pP/AxZcy7wqygDsxisPcAtIUPlI/YtFCB6uyT4AyCztKcN+it
         nOHfkPEkhfMu71Mc/m4nLdtUieTbh6xAAZ8gsRhyNXZ9P/Hxick4wBDKhclQL0q3JFei
         G22Pi6xY4qROhErczoB/k7H2MhpJhBPOoihBvZ6ZlUBzSnnisyWybQEztpckRu+CPkUq
         zDSCXhLP5B8KXF58gEDilOhc6NLk2R7JQvTz1qVy7ZR8XMSH9692bu8CXqMC5pvGmxQD
         xegM3XmOn/wABMgJ4m9hp/BV08goYEwnNIAiDgINrz0QsgxTMloNhFllRm/pO5Fl1Bik
         x3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451472; x=1717056272;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2UdYcGeBEiDNLatqEDT2A8B9sTUunerNT7zZ2p/WiE=;
        b=mSYWKbQsy+Ap3Qz3au7PqCBymaM5j6a1AsP95mz7aWFZqqg5IrwM4TsMUH1DqNUS/Y
         sbbjBWFd/fh7SWzyK2p2HdDCiN2gECtkBgWnZrh0fjVuckwrf4q4bvWLT6l6XGXJThke
         kjELIhj487kdldr7CEoOcYk1NjfD50rp07RsY3fmj68HJbjC0C4F/151eO1+ycAWvA6f
         /yBhgVc/9ntU62gletlmsBnKqNk2BkQvXhiTZ6xgPRfjkepI1QvRjql6ccmyEGyBBIva
         K9MlSJORQb4vLDZWoA38omADIdBgwjQXrZpwzkycYkZCgRd5wLOeJGBR9LZMh7GQc1kC
         gvWA==
X-Gm-Message-State: AOJu0Ywy5UZr3mcZF07mM7GKEluwRIsGV7/iaeLZGn0JJ6gMhF+lGWjO
	F8AeTDEwBEifv2DrVjUpRg6PV4lSD0b0jyDN9jAaOMJ5DFglY9vk
X-Google-Smtp-Source: AGHT+IGy2lqeeGLvLdZyq1Nzxq1SnkMMcHXq3cAIbUUtiTRHx+7HniiYP9D+sNg59A2J/RFdD198Kw==
X-Received: by 2002:a05:6512:3ee:b0:518:9cbf:cd6b with SMTP id 2adb3069b0e04-526bd69494fmr2500440e87.13.1716451472368;
        Thu, 23 May 2024 01:04:32 -0700 (PDT)
Message-ID: <a9fdb75d26839c31a8b0ceda9c940b2e13a89bab.camel@gmail.com>
Subject: Re: [for-4.19] Re: [XEN PATCH v3] arm/mem_access: add conditional
 build of mem_access.c
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Date: Thu, 23 May 2024 10:04:31 +0200
In-Reply-To: <fb426cc8-fda9-4e21-983d-37649499e0e4@xen.org>
References: 
	<b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
	 <CABfawh=7jZmtseCm9yaZUcKkK7i+yYiudVDvTFeF6bax_1+BjA@mail.gmail.com>
	 <fb426cc8-fda9-4e21-983d-37649499e0e4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hi Julien,

On Wed, 2024-05-22 at 21:50 +0100, Julien Grall wrote:
> Hi,
>=20
> Adding Oleksii as the release manager.
>=20
> On 22/05/2024 19:27, Tamas K Lengyel wrote:
> > On Fri, May 10, 2024 at 8:32=E2=80=AFAM Alessandro Zucchelli
> > <alessandro.zucchelli@bugseng.com> wrote:
> > >=20
> > > In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
> > > changes are done:
> > > revert preprocessor conditional changes to xen/mem_access.h which
> > > had it build unconditionally, add conditional build for
> > > xen/mem_access.c
> > > as well and provide stubs in asm/mem_access.h for the users of
> > > this
> > > header.
> > >=20
> > > Signed-off-by: Alessandro Zucchelli
> > > <alessandro.zucchelli@bugseng.com>
> >=20
> > Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
>=20
> Oleksii, would you be happy if this patch is committed for 4.19?
Sure:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

>=20
> BTW, do you want to be release-ack every bug until the hard code
> freeze?=20
> Or would you be fine to levea the decision to the maintainers?
I would prefer to leave the decision to the maintainers.

~ Oleksii

