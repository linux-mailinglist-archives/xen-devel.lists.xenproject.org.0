Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EAF6A5B63
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503451.775730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1bK-000098-8W; Tue, 28 Feb 2023 15:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503451.775730; Tue, 28 Feb 2023 15:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1bK-00005e-5e; Tue, 28 Feb 2023 15:09:10 +0000
Received: by outflank-mailman (input) for mailman id 503451;
 Tue, 28 Feb 2023 15:09:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pX1bI-00005O-9n
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:09:08 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7999d38-b779-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 16:09:06 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id i28so904195lfv.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 07:09:05 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 a6-20020ac25206000000b004dc4bb914c7sm1357750lfl.201.2023.02.28.07.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:09:04 -0800 (PST)
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
X-Inumbo-ID: d7999d38-b779-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dm/zzJO/AZK8RXCT9sIWiD+OL/udz98OaMG8IJ3iN/w=;
        b=b0EfBBX4a7WhMIzXy8+ki0Q6Dv5w7wS5D/ked4yvj9mo+cuNs6A8nq0hQ4T3fzUd6n
         GMPH3f9sgY7OrPR3TaI+SoSN6gJpoou7Uy1oVfVo552g8AuFU/SapWKTeJIaRmz1X4k6
         qNNDr1y3oNebI2NwzvQMwGIwjy4U0rVeQ098kPAGNlRfED27qluwuMiUvfQvJ1ntn9rD
         FdvP8GugYOQmD6icWR6fTymGD/+vS7PoT2Mt9pUHPJsP7LDnH0vb+W1YGPW5kMEIKk9c
         1oJXEoWPmTc1S2G7nh+PDqZ6lyZ/PsLGJuKC145hHYiv/t1aj2HZVIut1pVlu+maOe0H
         u0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dm/zzJO/AZK8RXCT9sIWiD+OL/udz98OaMG8IJ3iN/w=;
        b=NnCoSAE7Lz2MA/eYPdCaw/vgTPizsUud5m+YH3qpjVqQeemnOru6PDaUtQdSTnbER1
         oi5vpco8pw49wCOdw+XkOdT3A6J1kT4ofX2w1gILFAXoz7W8569tMorzfcKg4uKcN0aK
         RPjxePT+UHqkMyYooKvEHcmVuhzZT/foAW2RGMrlRAIe3xbICt7lsypN0BJvjmTcqzHC
         DgZ+pN82lfDVfQ/XvJckqGq5+yJAhet7l1zaLa0iH6MhmRQvKKqOuBaQiepZskc12UsW
         jAqOxSyO4TDIPV+NQKm94YhGQ/7xjTsILg5XrXtpu6oL+s0XevECMeao9AJZU1tET0Xc
         g7XQ==
X-Gm-Message-State: AO0yUKVwOlIJK+Pd+XZP9tP8DfoKyuGUVA7n7nWlZtDH/UjE3TS15Mw3
	guzBzvW7kS0yYciCN3ftNfA=
X-Google-Smtp-Source: AK7set81+BMaBNaeor6x+zTxK3aMjvBahX9fNWbLTGw8xLSgTaTU8OHwWXAqoToHUh8rlZW/AmRPkQ==
X-Received: by 2002:ac2:46c8:0:b0:4db:3877:817a with SMTP id p8-20020ac246c8000000b004db3877817amr921002lfo.28.1677596944862;
        Tue, 28 Feb 2023 07:09:04 -0800 (PST)
Message-ID: <c0e628d744f03c70d2e7b66540ea27aa31d90043.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Tue, 28 Feb 2023 17:09:03 +0200
In-Reply-To: <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Sat, 2023-02-25 at 16:49 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > The following changes were made:
> > * make GENERIC_BUG_FRAME mandatory for ARM
>=20
> I have asked in patch #1 but will ask it again because I think this=20
> should be recorded in the commit message. Can you outline why it is
> not=20
> possible to completely switch to the generic version?
I haven't tried to switch ARM too because of comment regarding 'i' in
<asm/bug.h>:
/*
 * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set
the
 * flag but instead rely on the default value from the compiler). So
the
 * easiest way to implement run_in_exception_handler() is to pass the
to
 * be called function in a fixed register.
 */
#define  run_in_exception_handler(fn) do {                           =20
\

So I decided to leave ARM implementation  as is.
But I'll try to switch it for the test and look at tests. If tests
won't fail that I'll switch ARM to generic implementation too.

>=20
> Cheers,
>=20
~ Oleksii


