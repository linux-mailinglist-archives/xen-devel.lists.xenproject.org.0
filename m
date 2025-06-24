Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29854AE6BC5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023922.1399981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5vv-0000lr-1y; Tue, 24 Jun 2025 15:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023922.1399981; Tue, 24 Jun 2025 15:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5vu-0000jW-VL; Tue, 24 Jun 2025 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1023922;
 Tue, 24 Jun 2025 15:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S2sc=ZH=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1uU5vu-0000jQ-1q
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:51:38 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c5758be-5113-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 17:51:37 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso5479695e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:51:37 -0700 (PDT)
Received: from smtpclient.apple ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e98b4bbsm177130985e9.15.2025.06.24.08.51.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Jun 2025 08:51:36 -0700 (PDT)
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
X-Inumbo-ID: 1c5758be-5113-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750780296; x=1751385096; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmGd69PDFrNPW22/J1mbXlYqViu5Kv+SdMkooLD1Y/w=;
        b=fZ3WROFheGjCLjz20DTBlclnZ4e3e921jUxpBQmNFFEILvRNabpdSfqO9u5kzJwmbp
         RPsKwXnAoGTAt1Tr2IsEKUnjtKAST2ZEmVibJl1P3ytFZ+4aqH2e9mZU4v9Bs1Y5QKMF
         wdGG6tQYHu80hJmrdCBJORWTO4MJIpkTvp+GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750780296; x=1751385096;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmGd69PDFrNPW22/J1mbXlYqViu5Kv+SdMkooLD1Y/w=;
        b=v2A6btBzigKNvcl45lk/N4F9iFK9dFaitATIjtyUP550oSZs1CJdvipGPGUGtPVCFa
         U4qG7yjhX2/UwUPuaLxdpntW436HfgwNsOFyme7aTxxa2njrU1ic0WqrdiWVmh0+W7F7
         ATvoDbPXA5erpgUSQy3YLXUI3aX9Ve/qWorfllZDILtd65NFnTYVJqwpnpTDJXbBE06A
         T4ELtjCaSVA/XMWwY1IM7rslJI7CtbT/hhY/w5gMz4NaMaViVM3u+PHW0SwZ3g25nNCo
         bY8DDgjEKgXNyDj32s01aoxdqmi/af7GGsGQrBIGY0bFTR2k1zotJ0AP6qolog5V1FMw
         WinQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrsHT5hfhsgDFhQkzFJzVOGgX+5dGCEFbWhXYLvlnmAxRnDHJ3yYpH+qvMPFMyqLOO/CO6XoNrTJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAPKr2kcWFmg+Pz/ohkjX2Vg+UuA0AClpjlPqnlo5Zl0djaWFp
	BR6YSpleo5AUcZ8t9UWPXR2ShSfl997Q8Vu/tKJNcPMQoE1e0SVGAaA6RmjwJpqsLNE=
X-Gm-Gg: ASbGncu/lvPPYi7OyEq/TkEdqw4DAm/6ThsTYwrhciT93SLDnqE4bIZFT5QSXliw/n0
	lkwxkKyvc7dDs+drtODZoMDi0QR7IBaybrD/yi+9EaZoIZ7VDl4gTHMRjVXpuWCeTOBSaAWr0qQ
	FYkS27sJKpLxFqSVq/SEdIFMVDqsAZ02TSn9yJikh6HNNdKbr9QaJ3wuqL9+H7dszDZYYAWZ2mQ
	Y4wClUBUe8FALzWpC8rNMIRgTwiDd+XZ4qv4nRrO1FFOZqC+zN48KawxcIjc6y2F95Mf4FwcBAi
	IpsV4hbxf03f4GAoHCGV8DRuLSxpY3STfHIi+V3hgtY4EEqOHaI/4TrNj5JyAm3UOwgysnOdIkr
	BxF+l3CuQ3W/BGxu5
X-Google-Smtp-Source: AGHT+IHlNpAmC9nky8iOX7FQo+3wKBpZQDqYzNSzLSaRXV8395DtwZ57C69nfswU4MrKwKl+bIBftg==
X-Received: by 2002:a05:600c:3b24:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-453653cf416mr154961135e9.5.1750780296565;
        Tue, 24 Jun 2025 08:51:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: xenstore - Suggestion of batching watch events
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <0b43d8e0-7ba6-43e4-9b0a-58c45d222c4a@gmail.com>
Date: Tue, 24 Jun 2025 16:51:25 +0100
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech,
 Christian Lindig <christian.lindig@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <66FC0F57-1654-40FD-88A9-37A960D37C1F@cloud.com>
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
 <aad590a6-fd57-4c8b-bc64-93b7f12a9352@suse.com>
 <0b43d8e0-7ba6-43e4-9b0a-58c45d222c4a@gmail.com>
To: Andriy Sultanov <sultanovandriy@gmail.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On 24 Jun 2025, at 16:43, Andriy Sultanov <sultanovandriy@gmail.com> =
wrote:
>=20
> But I think this only covers part of the problem. Looking at the =
concrete case of
> xenopsd and Windows VMs, xenopsd cares about most of the nodes it =
receives
> watch events from, the issue is that it doesn't know when these are =
grouped
> together in one way or another.

Is the common case that a client wants to observe the changes rather =
than just knowing that a change occurred? If so, it seems transmitting =
changes as part of a watch event (rather than forcing the client to =
traverse the tree) would be a better protocol. That would suggest to =
introduce a new kind of watch that reports changes at the end of a =
transaction. The size of the event would depend on the size of the =
change.

=E2=80=94 C



