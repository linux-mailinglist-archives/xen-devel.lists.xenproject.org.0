Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA480DB02
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 20:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652517.1018414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCm8o-0004Qr-Ug; Mon, 11 Dec 2023 19:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652517.1018414; Mon, 11 Dec 2023 19:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCm8o-0004NU-RI; Mon, 11 Dec 2023 19:40:34 +0000
Received: by outflank-mailman (input) for mailman id 652517;
 Mon, 11 Dec 2023 19:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+fN=HW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rCm8n-0004NO-7F
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 19:40:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2568b114-985d-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 20:40:32 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1f8f470903so235690166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 11:40:32 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vc12-20020a170907d08c00b00a1d4a920dffsm5193427ejc.88.2023.12.11.11.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 11:40:31 -0800 (PST)
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
X-Inumbo-ID: 2568b114-985d-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702323632; x=1702928432; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CQ0yHzTJ5OEC6SXiONpkyL6MmfJgj9nvBYWcNZPY740=;
        b=fkIAB/Envh3QdlcBs26kfr9A8IfLiwv/qsiAym61kk28h6UW/InuWU6VHG1j9P+Y5T
         NmDbqfjrahtJj4RZRKRdh9i+4IoGs9iZExycWvolwQThmBuRb6Wyx2CODlLPNR/26ZWj
         13+gpVFRxxn0bYCZ9GUr50XD+yrbc5DclW08xofw4bUZhKmgVF6Csj7oPWoBAuORK+Qr
         FX1rNMI7hfv94bBARbVHzhUUZ7Pkzjzc+TvXVV1N23DvGQIGDT/nj38A39ML/5wI7Z+N
         gLtkRUUo3IEDAjjfcQeUsIbrJfOFBksjTAX3HeQxztOLb/nV/D2iOtoOiWtNRIE9aut1
         y46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702323632; x=1702928432;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQ0yHzTJ5OEC6SXiONpkyL6MmfJgj9nvBYWcNZPY740=;
        b=OD5U4G2NDVDbHHWbF7urudc/eSsRQlJADY7xIHmVpHt7IBvb00+T/g9HBLhynnE0OX
         MchO/LyqRcu8XD9k1zcU3KTYJGn8/ZvUUt5pZmd1pTlipo7oZelZWVZF4ixjY7KFtm2l
         jX+64vbAiWllTGp4UfX5n/p/2w9w/8k0mhaoWaSNd+elXn3RUB6bHzZ9sfOgXr+608XX
         E2/jeDhdhQwDoAHdtZjJMWH1g+5xRaSJFd134u94P0usticZoJ+y+ZwYYonuM2isBTgv
         3uiYZ4Nmy1nhQBP/EBolqeeow4nwjVhW7Jyj8BxrWf9mHibgdingQL+uRoRy1PhJagdx
         L8WQ==
X-Gm-Message-State: AOJu0YwBQM1VBsseQWBSXuQmC41ePFgVuAsIQ3a1V5l2GAQu47Gzn2WA
	2jvuSYzXApNz2hBXHBGH8QY=
X-Google-Smtp-Source: AGHT+IH/LGA+K/2eAcNbaFtGOM2kXaBT3ChITF0OMt/TCx8vlMtwFkygJVU608fUHttPDSkREg7Mjw==
X-Received: by 2002:a17:907:94d6:b0:a1b:7608:f962 with SMTP id dn22-20020a17090794d600b00a1b7608f962mr4044493ejc.54.1702323631639;
        Mon, 11 Dec 2023 11:40:31 -0800 (PST)
Message-ID: <54f05f88178a152b4f3b4ecb52933bc75d3a37a4.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 11 Dec 2023 21:40:30 +0200
In-Reply-To: <6592eb30-a8eb-423b-81ae-89acccc4e751@suse.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
	 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
	 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
	 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
	 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
	 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
	 <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
	 <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
	 <ed29735f-2d2e-4b29-b5d1-efa78480acd6@suse.com>
	 <bad7c686af22aef9124891f5610976687452e784.camel@gmail.com>
	 <6592eb30-a8eb-423b-81ae-89acccc4e751@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-11 at 18:49 +0100, Jan Beulich wrote:
> On 11.12.2023 18:37, Oleksii wrote:
> > On Mon, 2023-12-11 at 17:02 +0100, Jan Beulich wrote:
> > > =C2=A0In which case the approach taken here may be fine, but
> > > it still wouldn't be what I suggested. It may then be Stefano or
> > > Andrew
> > > who you could consider for such a tag.
> > I'm a bit confused again. In this case, it seems that both you
> > andStefano or Andrew should be on the suggested list.
> > You proposed the approach with "#ifdef CONFIG_GRANT_TABLE #include
> > <asm/grant_table.h> #endif".
>=20
> But you're not meaning to use that approach anymore, are you?
No, I am going to use it because there is still a need to use #ifdef
for #include <asm/grant_table.h> in <xen/grant_table.h> to avoid
providing a useless empty asm/grant_table.h header if
CONFIG_GRANT_TABLE isn't supported.

~ Oleksii

