Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567719550F7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 20:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778753.1188764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1sV-0004lj-Aq; Fri, 16 Aug 2024 18:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778753.1188764; Fri, 16 Aug 2024 18:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1sV-0004j3-7t; Fri, 16 Aug 2024 18:40:47 +0000
Received: by outflank-mailman (input) for mailman id 778753;
 Fri, 16 Aug 2024 18:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2/C=PP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sf1sU-0004ix-1Z
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 18:40:46 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b5ea376-5bff-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 20:40:43 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso2876855e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 11:40:43 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838eeedasm292198966b.94.2024.08.16.11.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 11:40:42 -0700 (PDT)
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
X-Inumbo-ID: 0b5ea376-5bff-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723833643; x=1724438443; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txNU6K5Z94jOa7kGMNFjkKteyqZwZ1+WnjUo52dlHnI=;
        b=DLw9VKm0cTlRO9lcasAHtliJu2fdR6sLqMzYgdqxi0M60y+6YoMWFyS7zYePSaGVlC
         4mcFw6HeDL4hP6E3U7pj1dePiSTBQxyiK9spx9Donb95oAFqGo2nBCNvUpFygU4v6/v3
         Mk3FM0NrH9LF4HCUOJ/8UYmHX25PoWFP0ArIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723833643; x=1724438443;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txNU6K5Z94jOa7kGMNFjkKteyqZwZ1+WnjUo52dlHnI=;
        b=M3AWb4rkg4EXw9wEAhCntZWBBi8TjiherTdyahECdlm7qOyD3m8CKviIHjcIziDydG
         gxQd/sbrq6Ieyh7JsAqLkFVSNs+YnvzVUsa45JBPn4he/WVT+xi5YKDx9uZzLFef8Hg9
         PLR+N81DSA7yD3UFalaWv12jwX+eXv5MKFV4+Fm3Ek/QCerHqPRKR1stpfl2xxK8YgEa
         ngQJDPvoYQkgCU/1wFiRr0kjZzm0+LgArEUiORmFmuivYaR77gpxAXEo0Nd1L5av2GdG
         aVHIRGWrdN23QNKxzQHcOovbZ5A/spVG1pozjXEBdb2e3FHXtF4gtMOvrQb7s2VAaZFG
         Zv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXl6Gq00+/DSlNaznJ4BUUTJ//TOV0TxCtnC7xGhmTL6iYyZUV3MMZXLg/z8rRjMrQQZOcmK0c9gzQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZgnnA2yfGrX9B8yHvliyttSQrCZx3zExfFuDFidZMVrqsUguT
	WwMdu4y4eULlsRXBUxJEGWdx3a0tao9nxRC+9XHtX1rQJROyVMlv0G2twcrRFtI=
X-Google-Smtp-Source: AGHT+IHFpOp2NvrWKrkf2baSt+dWZuQ3GgoiTu8U54rKCb10A8hcm9G0D9PWN+SnNiixPqmNSrZx6g==
X-Received: by 2002:a05:6512:3082:b0:52f:cd03:a847 with SMTP id 2adb3069b0e04-5331c6f47f1mr2061371e87.61.1723833643109;
        Fri, 16 Aug 2024 11:40:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 19:40:40 +0100
Message-Id: <D3HK0XQWARJS.F66A01YC9WXY@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 16/22] x86/mm: introduce a per-CPU L3 table for the
 per-domain slot
X-Mailer: aerc 0.17.0
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-17-roger.pau@citrix.com>
In-Reply-To: <20240726152206.28411-17-roger.pau@citrix.com>

On Fri Jul 26, 2024 at 4:22 PM BST, Roger Pau Monne wrote:
> So far L4 slot 260 has always been per-domain, in other words: all vCPUs =
of a
> domain share the same L3 entry.  Currently only 3 slots are used in that =
L3
> table, which leaves plenty of room.
>
> Introduce a per-CPU L3 that's used the the domain has Address Space Isola=
tion
> enabled.  Such per-CPU L3 gets currently populated using the same L3 entr=
ies
> present on the per-domain L3 (d->arch.perdomain_l3_pg).
>
> No functional change expected, as the per-CPU L3 is always a copy of the
> contents of d->arch.perdomain_l3_pg.
>
> Note that all the per-domain L3 entries are populated at domain create, a=
nd
> hence there's no need to sync the state of the per-CPU L3 as the domain w=
on't
> yet be running when the L3 is modified.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Still scratching my head with the details on this, but in general I'm utter=
ly
confused whenever I read per-CPU in the series because it's not obvious whi=
ch
CPU (p or v) I should be thinking about. A general change that would help a=
 lot
is to replace every instance of per-CPU with per-vCPU or per-pCPU as needed=
.

Cheers,
Alejandro

