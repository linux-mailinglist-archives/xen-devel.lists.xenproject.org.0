Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F27968A47
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 16:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788043.1197486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8O1-0005qu-BP; Mon, 02 Sep 2024 14:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788043.1197486; Mon, 02 Sep 2024 14:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8O1-0005oj-8E; Mon, 02 Sep 2024 14:50:33 +0000
Received: by outflank-mailman (input) for mailman id 788043;
 Mon, 02 Sep 2024 14:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlOG=QA=cloud.com=mark.syms@srs-se1.protection.inumbo.net>)
 id 1sl8Nz-0005ob-6n
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 14:50:31 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2c636cb-693a-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 16:50:30 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-374c3400367so1219687f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 07:50:30 -0700 (PDT)
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
X-Inumbo-ID: b2c636cb-693a-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725288629; x=1725893429; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X27QUa9Rg2PdK3TlIZBkGsNPi5CsBokDP4wBZXifbqg=;
        b=X+dTKfbhfGu8Ds2REMo30T3973sFS5rwu1AigTXiQmXwMUPB1K6Q06BbnTou80VBLn
         MFfN5qW2lkT3F9m77hvVKC+QuPUjFs1WFSMtnOWd32EhCctJ/T5I7PLXJA2eVwGwC9zu
         mZT7rCGJ/UE2CAhqQAGIHmhm7irsLi/yYBg04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725288629; x=1725893429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X27QUa9Rg2PdK3TlIZBkGsNPi5CsBokDP4wBZXifbqg=;
        b=Sxwn+T56vKvcNQ2zCIM9Po8ajQQKl/BxKNv69qEmDpJXG8qVqJMTA7bvynyCQj/QE6
         1Yig+REOG0WNGS59iC4qcQoSa1a+0gvZmMQ4Zy0zNiJofpwnM1+gUzm5Y5xpqIrlqWdU
         EPvYd16URxNBoGXLyRMBMJ/la2UrQ6Zn0XFJJbN0sNLnU8O8qJxlFSYyEUKoyHvTEzt7
         o2ovn/eUc4vPMfAw/Pnkd3D73kStrGDi/+QQP1mCjatYEf0PvzwbYyuiZYCFYD91DFxU
         TIZLnoKD/xIhYSVp4Q78+lzIp/e/fDhVJcWb1cTVkYplrTNHI4Wi6GNe+SLCVsbEuJaP
         GISw==
X-Forwarded-Encrypted: i=1; AJvYcCXOTqGoTDdt7McUEET/raEG/zvT0aVEvzekKbqyAY9BjYtNmkzU3oe0cVpF+K6J1bCjAMXp4Gbq6sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykRXE4MevxtdNIHj9skLAxZF7ad2ifZTxNcLS5S0MzLPcQDSU+
	vAOYWUetOBU+hejVBIxqI+ohyzryvowdo2j9YC2CgoHjBoZJB9bSdQMRpuZQ+gQiVHR31ArmeiD
	q6iP56N4Whyumj3MXn09ALT78+11OSHO8SHQyoQ==
X-Google-Smtp-Source: AGHT+IEzDUnTwah9XKGTdxGOMO2A0SnlBIPKrici80Jc9FdC3blFiz6FTG7hEKcTILYlGTWYl9sOOVVhlWqIvUKubX0=
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr11576373f8f.12.1725288628835; Mon, 02 Sep 2024
 07:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <ZtBUnzH4sIrFAo0f@macbook.local> <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local> <ZtHus/ytlA1UnHEI@l14> <ZtV9hteu_sVyvnih@macbook.local>
In-Reply-To: <ZtV9hteu_sVyvnih@macbook.local>
From: Mark Syms <mark.syms@cloud.com>
Date: Mon, 2 Sep 2024 15:50:17 +0100
Message-ID: <CAPYKksUiSqakVWFbA68VowxHyt5LR3KXBuOqYQ0zbODz98a5rA@mail.gmail.com>
Subject: Re: Block protocol incompatibilities with 4K logical sector size disks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org, 
	Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Sept 2024 at 09:55, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> > So yes, after more research, having sector in the protocol been a
> > 512-byte size seems the least bad option. "sector_number" and
> > "{first,last}_sect" have been described as is for a long while. Only
> > "sectors" for the size has been described as a "sector-size" quantity.
>
> Thanks for your input.  I would also like to hear from the blktap and
> Windows PV drivers maintainers, as the change that I'm proposing here
> will require changes to their implementations.

Well, that's a whole big mess isn't it ;( FWIW, it's tacitly assumed
that tapdisk is only running on 512 or 512e storage as its primary use
case is VHD and that driver explodes spectacularly on 4KN. So,
hardening those implicit conditions into hard explicit ones seems like
an entirely reasonable thing.

Mark

