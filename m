Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53C948C65
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772671.1183127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGp4-0004ZZ-66; Tue, 06 Aug 2024 09:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772671.1183127; Tue, 06 Aug 2024 09:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGp4-0004WR-3S; Tue, 06 Aug 2024 09:49:42 +0000
Received: by outflank-mailman (input) for mailman id 772671;
 Tue, 06 Aug 2024 09:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbGp2-0004WL-8x
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:49:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327d6f0d-53d9-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 11:49:39 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52fc14d6689so316086e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 02:49:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba1129dsm1419786e87.118.2024.08.06.02.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 02:49:37 -0700 (PDT)
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
X-Inumbo-ID: 327d6f0d-53d9-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722937779; x=1723542579; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3kttPg0jTgLnySiSrZ7tLdlSbiwfr5TPh4B2ogxf3Oc=;
        b=d2G35J60EWJ/8UNma3uW39I3H2lYfCVM756l7jXxtcwUlkbth9IB5Qf1kO157kvgeF
         aCrUQays3Y1Us3bUvHOnbKard85uoZcvgG8Ghzlw2cdcon6faA4BhV5Rn9IqY2+JMfiR
         MeiLEKN4FEyIgoVBscRgtDLFj+/0Th7hdypQf58xGA+jmyng2aA4fjzOu9cx7j0d2Wix
         h55LZBnn2+baPiNLj0dPaojsvB0Sj5qelc1A5wxrxdp4JJ0CaqFBED/zdQarnp4S0UmC
         qPNJW7AWvbooCxG21IdGsIMCxNl4hpHSYPkoGBOHHKmdE2DTKwKb6srvkz4cofM1maPQ
         1dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722937779; x=1723542579;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kttPg0jTgLnySiSrZ7tLdlSbiwfr5TPh4B2ogxf3Oc=;
        b=qmqvP2iSx57KOfbyPrd39qTxJEWkvQGNsPOvdUj7sbNi9Z0mC+Ot43+GrrisFluJvg
         ClBWPbkYokVSuhR6K3kkdCxVXonGaQJaPziYLvqK6vKbSTgXyTas4G6Aefo6Z90fn6MR
         LsPrn9rwGLTiR046tv23RtSM6jjkQvmKLrc5mPKxoTU22qBmiAJQ76gNqRmq3Nc+az6H
         swsmxPqHmM4yD6hWoasLQUDTnYovyYWaO1lW4KY0s5TSf9Bi17g/tEKOrErp6dvBOsBU
         LABBCdBalH9Gp1uGp3sVA0R07HvKtNrim0cGMVz3bsxJo8qfHoMWRZz/OAaSX6alZDHO
         JKWA==
X-Forwarded-Encrypted: i=1; AJvYcCVk2rusYCejHu952cxhrlaBIzklzKWUKXINdHF8cd87N6X1Sj9AM+tiXkwTJ4Ji5bf1loJkHnLbMwunBDQsywCUvOhphaEtgzfCGDczY0A=
X-Gm-Message-State: AOJu0Yw8fVG3CerUHh7u+EejLIdvXgYqjwA+ET6TBPpsAjDTnuau104N
	HrK6hQkQLhm2dtCZDJAJ1T3m76LapvojaKPyVsSroDH0kAnem9be
X-Google-Smtp-Source: AGHT+IHdaJ2d+FehdSZ71SWMJj1TqpOUvVFfxlhnC0ETJdDFF58f31asuDsUmXcsjFepSQds/cZ+FQ==
X-Received: by 2002:a05:6512:10d0:b0:52c:842b:c276 with SMTP id 2adb3069b0e04-530bb3a2ee0mr10062699e87.53.1722937778258;
        Tue, 06 Aug 2024 02:49:38 -0700 (PDT)
Message-ID: <887c062b02e9eae9953759275d97c1fafd608d28.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Tue, 06 Aug 2024 11:49:36 +0200
In-Reply-To: <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > +=C2=A0=C2=A0=C2=A0 write_pte(pte, tmp);
> > +
> > +=C2=A0=C2=A0=C2=A0 sfence_vma();
> > +
> > +=C2=A0=C2=A0=C2=A0 printk("(XEN) fixmap is mapped\n");
>=20
> Why the (XEN) prefix? And perhaps why the printk() in the first
> place?
printk() is available after common code started to be buildable and can
be used here as we have already introduced early_puts() which uses
sbi_console_putchar(). So it doesn't matter if we use printk() or
early_printk() here the result will be the same the call of
sbi_console_putchar().

Am I missing something?

~ Oleksii


