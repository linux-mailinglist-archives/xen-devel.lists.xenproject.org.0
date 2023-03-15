Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBD6BAC8C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510003.786892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNlu-0004KB-UH; Wed, 15 Mar 2023 09:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510003.786892; Wed, 15 Mar 2023 09:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNlu-0004HH-RU; Wed, 15 Mar 2023 09:50:14 +0000
Received: by outflank-mailman (input) for mailman id 510003;
 Wed, 15 Mar 2023 09:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7Eb=7H=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pcNls-0004FZ-Q5
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:50:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c677c60a-c316-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:50:10 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id l1so16685522wry.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 02:50:10 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q22-20020a056000137600b002c71d206329sm4113010wrz.55.2023.03.15.02.50.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:50:09 -0700 (PDT)
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
X-Inumbo-ID: c677c60a-c316-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678873810;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJGSTPOHlznlTemasWJCSU2+RGH1E9MkIVTPeCqKgRU=;
        b=kvh7jrYmIznr191Wf1sx6B5hWVEf/XAS/itN0IQSFmp+8ZQqkS04INqOs1dy4UArzD
         QJU6XAB1KRgIkQXJSLC8HmBaQdXd9G2XBs2Vtxy/qwipaM4Nkun6imh8HfMTUJv4N+CD
         4k23yJsrKtooxQod4kO39oz6mjliUTmXgIraQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678873810;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJGSTPOHlznlTemasWJCSU2+RGH1E9MkIVTPeCqKgRU=;
        b=TJjUVBZhbGYNZIzWXJY+3PBLPDTmANQAiQkZDFHLUEEY4ZJhvyrTI+FduWqxEkIw/l
         bggBsWA5XDJO2iqc0vL4sY3hWboIreKpluCeWV8g/CgEHxsOdE5xncH9EvJt8RRa5hj7
         3W09UukyEGFlGcw8/+utBVfC4o1HYr2oaUVNt77imLtB5gj7dqDfY8Qi6br0RImQCB5j
         XXWPJyE3kHiaBI3bn+otSE3TZ6SwH3+zXYwZGRPH/xfYM3A/kP6f/9V/ClVBkrDOgjXS
         xSsR3ZciJdNSjJaBLSmCQ2qjYPGfIKQ+EyXb1pkOE0vfwpLv0EpkMyi8e4nNp5Jsqvm0
         Bm8g==
X-Gm-Message-State: AO0yUKXq3Vug4k2Q62I/Bx/Yx196NrwsImXGOXmrrErJJtCE2LjwDid/
	lf8+Ke/mURl0jQbjf+4yL0+CSQ==
X-Google-Smtp-Source: AK7set+g0W1hDmGbWKgkQPjPcLiVdX/ShaaOamAIw2w/KjS8eAHjobjs7sNdfL9HdUek15u46adoRA==
X-Received: by 2002:a5d:4ac4:0:b0:2d0:2d4:958d with SMTP id y4-20020a5d4ac4000000b002d002d4958dmr969831wrs.21.1678873810055;
        Wed, 15 Mar 2023 02:50:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 08/10] tools: add physinfo arch_capabilities handling
 for Arm
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230315090558.731029-9-luca.fancellu@arm.com>
Date: Wed, 15 Mar 2023 09:50:08 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E2CADF7-E092-46F2-80A6-5EADBDB6817A@cloud.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-9-luca.fancellu@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>,
 Edwin Torok <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

Acked-by: Christian Lindig <christian.lindig@cloud.com>


> On 15 Mar 2023, at 09:05, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
> type arch_physinfo_cap_flags =3D
> -  | ARM of arm_physinfo_cap_flag list
> +  | ARM of int
>   | X86 of x86_physinfo_cap_flag list
>=20

I notice that other capabilities are split into a list and not kept as a =
bit field. Is this not needed here or am I misunderstanding the =
representation?

=E2=80=94 C=

