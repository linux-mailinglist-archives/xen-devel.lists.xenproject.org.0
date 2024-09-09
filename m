Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79C9711A4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 10:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794023.1202681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snZZr-0001Pf-0K; Mon, 09 Sep 2024 08:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794023.1202681; Mon, 09 Sep 2024 08:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snZZq-0001OC-Qe; Mon, 09 Sep 2024 08:16:50 +0000
Received: by outflank-mailman (input) for mailman id 794023;
 Mon, 09 Sep 2024 08:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8W/=QH=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1snZZq-0001O6-5k
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 08:16:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc6ff4d1-6e83-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 10:16:49 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso373711466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 01:16:49 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cec10asm304067166b.160.2024.09.09.01.16.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2024 01:16:47 -0700 (PDT)
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
X-Inumbo-ID: dc6ff4d1-6e83-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725869808; x=1726474608; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/PiqUsOQbAHADPrl+snqDRMiOh1cdvZorNS4xppdv4=;
        b=cIpRJ9bD1KvSRuqP36v7BVBuJg8A+8KbC7QOTCW7xsW8JtNQwH4flr6DZuRLc3gvdT
         0BxwyDeLpYRpyvm0LwrhzE6Agi7gp3KcxWg5PNe40NLlpvuGx29yLEhEd2bX3CBV0Ht+
         sVC4cEpseVl4Xg9vXW1aXbh05MoFpIVOsKjRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869808; x=1726474608;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/PiqUsOQbAHADPrl+snqDRMiOh1cdvZorNS4xppdv4=;
        b=TZexO0bDxjG/GjEonZSq57M2cAAo/xfQ88sbn67b6DIOIhJwOHQryE17j9Cuz70TGE
         nuyzWXL3Lj5iEBf7CQADXLxwxIK1W/wkYZ9vcQSDU+iEzJWZZ77+Yk8IH8EF2Wv8snut
         sKzA3NEMaftswxEvQoFNUrtX5qhR/46ES42YxMuuB7E6nJEZPo6lc3jCYViH9iw/ctrV
         Rf2MrZnWkyNXtoicjBwU/XyUhBJuWjCHmt9hcZJkWrz6SNMq7RMcy9b99p6EJfDpIM/0
         KwoqcdOv93/Xed6PVv1s25FDiWZOxUZPgXdV4uq1IG+G2jQzyt4JisNmPNCGFy8ZNpxI
         MKog==
X-Gm-Message-State: AOJu0YxsaAiFS5DahDE+sTWRTzX61mviYGKr6LJWTTUHtZh1NMO6P5AE
	YJ+Mblvz8mM5IdZ/EJSw9o1HyuwQEAdF/VjrTXRIv8E4HqexrHeFCE5eMjt85oM=
X-Google-Smtp-Source: AGHT+IH7aTaHXBD4KfFGjOuFa2BvOqKC168ooTMY1CidMi6QFcj0nFsMOgAiAEYE/XRpzDAsqublQA==
X-Received: by 2002:a17:906:6a0c:b0:a8d:6261:23ff with SMTP id a640c23a62f3a-a8d6261269fmr75198966b.17.1725869807675;
        Mon, 09 Sep 2024 01:16:47 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] tools/ocaml: Rationalise .gitignore
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240906145524.186148-1-andrew.cooper3@citrix.com>
Date: Mon, 9 Sep 2024 09:16:35 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D37A12FC-377D-4770-90E6-B8C8697E6702@cloud.com>
References: <20240906145524.186148-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 6 Sep 2024, at 15:55, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> The root .gitignore is quite stale from recent (and less recent) =
removals, but
> also fails to work for the forthcoming dynamic plugin work.
>=20
> Strip all Ocaml content out of the root .gitignore, and provide a more =
local
> .gitignore's with up-to-date patterns.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: Andrii Sultanov <andrii.sultanov@cloud.com>

Acked-by: Christian Lindig <christian.lindig@cloud.com>


