Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0778C8261
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 10:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723902.1129045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7scw-00053p-59; Fri, 17 May 2024 08:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723902.1129045; Fri, 17 May 2024 08:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7scw-00052J-1v; Fri, 17 May 2024 08:07:42 +0000
Received: by outflank-mailman (input) for mailman id 723902;
 Fri, 17 May 2024 08:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q70L=MU=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1s7scu-0004xV-Nv
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 08:07:40 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86b2c984-1424-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 10:07:38 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso25301011fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 01:07:38 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf91sm1087447766b.1.2024.05.17.01.07.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2024 01:07:37 -0700 (PDT)
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
X-Inumbo-ID: 86b2c984-1424-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715933258; x=1716538058; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAhbvMNjNeI6uVfAm48uZmXWCz65I34c4tiky0xbTic=;
        b=M+bQi0OdGU3hbJ3bxK79FJ38LCo6FEw13OOWWPoccukiHGEIcTlpR7rsIs1R4bz9ku
         rfNCmcL5ZRv43nnUyPMlv8h5lgibMFCd2gtZi/p6Rb4XP9Eul4Xt49mga+QIB/kciFdw
         wUhRd7X/TMxTPzO5I0t/d9Dr9qIYfnkjVSYHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715933258; x=1716538058;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAhbvMNjNeI6uVfAm48uZmXWCz65I34c4tiky0xbTic=;
        b=vz3wpGR/Rw3hx7/dAMUfeAaAfynUmdd4UuHuRHBjUo/BYO9J3L40yVQmfkwYv8L1Bf
         uzih9e0XxYNlUpu+MY/mnZum19Dx7Xp7AZFX5eeknoBolNcnf+V2AZGqgNjFVsgua0Cz
         i2onjM4IY9zqbnUJm3xb7s7FymroXtidKurW3UhZEgk5ZkC9t5Z1mHYpbrmBTJwvFVPb
         ShlrmH+Ka+YPPvfPuK6bbGcS9E7ttNeufcrYPAo9TKowNQEBvXuHgR7fuBsWTR/ZTSph
         dgJm8ZnwKPYo3F6YqzgoOLumTNEBt4711BcbP7aRC/VNHWSfr5ifCU+QbhwL79cV5A6P
         KggQ==
X-Gm-Message-State: AOJu0YwBg8BVUyAFoI2xWV4Ah3++68Zsn7WM9FaCObwGFxpkXwyDuoBs
	68arL+RP3vOxObhz45aKpc3v92f1hjDpERJ2QoXNpYu34FBBCLVGbUI95HmtIl4=
X-Google-Smtp-Source: AGHT+IFzFN4piK6kzfPjplbXkTBQXObg1P7TV+4dXfLWKgWMj8bKzZibiPdzLmsJSKN3Oq3BomP4gA==
X-Received: by 2002:a2e:984b:0:b0:2e0:3ad2:b371 with SMTP id 38308e7fff4ca-2e51fe5875dmr167094401fa.25.1715933257871;
        Fri, 17 May 2024 01:07:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v2 1/4] LICENSES: Add MIT-0 (MIT No Attribution)
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240516185804.3309725-2-andrew.cooper3@citrix.com>
Date: Fri, 17 May 2024 09:07:26 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <17B1DAA5-EBFB-47C2-95A3-057D5BD2AA60@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-2-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 16 May 2024, at 19:58, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> We are about to import code licensed under MIT-0.  It's compatible for =
us to
> use, so identify it as a permitted license.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>


Acked-by: Christian Lindig <christian.lindig@cloud.com>


