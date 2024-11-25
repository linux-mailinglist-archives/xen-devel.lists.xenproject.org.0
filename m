Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24C9D8C86
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 19:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843094.1258748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFeD2-0005R3-Lq; Mon, 25 Nov 2024 18:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843094.1258748; Mon, 25 Nov 2024 18:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFeD2-0005OG-Ig; Mon, 25 Nov 2024 18:53:20 +0000
Received: by outflank-mailman (input) for mailman id 843094;
 Mon, 25 Nov 2024 18:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toQe=SU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFeD1-0005O8-5w
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 18:53:19 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8585b984-ab5e-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 19:53:13 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cfc035649bso6398547a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 10:53:12 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d401f64sm4365437a12.70.2024.11.25.10.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 10:53:11 -0800 (PST)
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
X-Inumbo-ID: 8585b984-ab5e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1ODViOTg0LWFiNWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTYwNzkzLjc4MDk5Miwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732560792; x=1733165592; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl3zhNmZgTRvTEReqGu5Ux58qMzkLcJXeOsEPoFIVR4=;
        b=gi3g3L/r5O8Fg++KFm9hzvWaF4ORwPFzBPwT22HKUtKIyHli8qUTKoIIRAYpo60gf+
         9zB0s5ZKc4tVMRFpnd9Si36lhfbzP+sCOptuFpgDje84oOPfHxXUqjOrAlr2mHDlPgPP
         I9iOurZnhv+Zw7JTtGtxUIicBhgqbAhnatnSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560792; x=1733165592;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wl3zhNmZgTRvTEReqGu5Ux58qMzkLcJXeOsEPoFIVR4=;
        b=nLdssG5k4hhRW3b6v+1wtjfns5SBl8qSl0K6bBna+hSxHEgbFH6g31QucEG0F25+oc
         9XEOdAB4iINdPZ5qwYzASJ60G5slFXzp8XhwtCXBC+NoDFDJV9FPtrJVaUuwRujJfc2p
         qjAgMQYGnNNq98T2+MDvgAHcG+vh+sls/f87a0BjEDkZBpuX4SuKmFNDlQtPxFRegPWi
         VBN5nbSLQy77jtaEdq5/J9sYn1oCE3zThgJJIdk4idxbiTnc8kQRKivmKaxwB6C30ZkN
         bh3A58Ya6BUox1a0IpxAtV6o3zXnpFhVMTculRIWEZMpvtgU3hmmGyZK2eUaRsU4Zf43
         6r6g==
X-Forwarded-Encrypted: i=1; AJvYcCXkMMx4fTu0f6ZNXtJ4vASubZLw1KF96Oi1lKBkE72jXl7+f9O5alSafyWUjSwpkCpd5OBSk4075DY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcP2ax9OlweMN34gY6QiTtVOxJ4xGy3zYQRaBv9VV5ozrtltRa
	aPeZMbnfbrG/BqC1DIPbRuuMUTTQdFIO0HZh17jCDduvIOrnrIzc1kHQraYzrV8=
X-Gm-Gg: ASbGncsSOMCMV3NOBId7cVk1IJhDGlkGTj7Hb1ZBD7KVrmkUm25SBAiT/a8p0ZLPcCo
	7I8UtWk5TcIsWV4zlY4/1xF7BJvhOg9RyKVozHueyBWsVPOwe+BuKY/ezLgGWYndCHbw3ZnDuiM
	fCHiQvDGH8AvSSBTSFFyx4AKO48GYMQ7KEPCS11PFT24TZwYTIqrSq/VUybrHS1910u3C9LqUq8
	PfTIub4TAwGvHOkvCtgcI7nUmpjgcdkpUhRQ8/htNhVcuwlFaElxSJh
X-Google-Smtp-Source: AGHT+IGE/wLutvKwe0fsXlxo5GI/m1IDeDPgOVZFy7vCbNDSb4tw/tv3m4Ml3pY3Qlu1jKjWTQ5WZw==
X-Received: by 2002:a05:6402:5256:b0:5ce:bb32:ccac with SMTP id 4fb4d7f45d1cf-5d020695138mr10264907a12.26.1732560792237;
        Mon, 25 Nov 2024 10:53:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 18:53:06 +0000
Message-Id: <D5VHJHKS0N3P.3KJG9X9PU0MT1@cloud.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross"
 <jgross@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Christian Lindig" <christian.lindig@citrix.com>, "David Scott"
 <dave@recoil.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 16/25] xen/x86: Replace hand-crafted
 xen_arch_domainconfig with autogenerated one
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-17-alejandro.vallejo@cloud.com>
 <f0c46c9a-9ff1-4627-9692-13e2483f7187@suse.com>
In-Reply-To: <f0c46c9a-9ff1-4627-9692-13e2483f7187@suse.com>

On Mon Nov 25, 2024 at 12:09 PM GMT, Jan Beulich wrote:
> On 15.11.2024 12:51, Alejandro Vallejo wrote:
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  tools/libs/light/libxl_x86.c                  |  4 +-
> >  tools/ocaml/libs/xc/xenctrl_stubs.c           |  4 +-
> >  .../extra/arch-x86/domainconfig.toml          | 87 +++++++++++++++++++
> >  .../xenbindgen/extra/domctl/createdomain.toml |  6 ++
> >  xen/arch/x86/domain.c                         |  8 +-
> >  xen/arch/x86/include/asm/domain.h             |  4 +-
> >  xen/arch/x86/setup.c                          |  2 +-
> >  xen/include/public/arch-x86/xen.h             | 51 -----------
> >  xen/include/public/autogen/arch_x86.h         | 52 +++++++++++
>
> Nit: If at all possible, please avoid underscores in the names of new fil=
es.
>
> Jan

Sure, re-casing it is easy.

Cheers,
Alejandro

