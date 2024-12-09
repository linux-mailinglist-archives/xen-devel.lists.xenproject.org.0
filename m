Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416A9E9A78
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851541.1265595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfeb-0006OP-FG; Mon, 09 Dec 2024 15:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851541.1265595; Mon, 09 Dec 2024 15:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfeb-0006Ls-CM; Mon, 09 Dec 2024 15:26:33 +0000
Received: by outflank-mailman (input) for mailman id 851541;
 Mon, 09 Dec 2024 15:26:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8HV+=TC=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1tKfeZ-0006Lm-QM
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:26:31 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6b08819-b641-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 16:26:30 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa670ffe302so261430066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:26:30 -0800 (PST)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3d69e5b72sm4121836a12.0.2024.12.09.07.26.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2024 07:26:28 -0800 (PST)
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
X-Inumbo-ID: f6b08819-b641-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733757989; x=1734362789; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRPncsvYa3Esbmk/0nVF41JAamgPk5b3GpM4zUM1nuE=;
        b=MgcIDIDErd9VUp9+AYIS+VnoKoaaJcafEYHNXvlO/jyvwQMJ8hkyEcjdBOZGLbeXSa
         X8gViSp3mMCo1MzQ2UO6FVhBOafsEkLUROHEeGPf43eGkzwjK87IFdA6RVBXV/UsVIbm
         CPJHgWKcccN2R2bUhPxPJ8Y3SW2cKD9S/7TuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757989; x=1734362789;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRPncsvYa3Esbmk/0nVF41JAamgPk5b3GpM4zUM1nuE=;
        b=ppo5HVERXIBOlrmy1QxUzU8h5vM9wvTjpbVWRzZ/uPzd9fSXLVl1xVyGykzXfzJvNU
         nFerTES6pmTjmyGkqdbsCE5d0VTipMR7W8ml/pn8LgC5FQbrsRyvgYhLgcyH64JQB1FH
         4Gf9XwGuXprZ9gxMp2qRIdhtH9a2e5aBe69TNzJSGEy2E2wSFlIt7Gv8oUBu3or71AVx
         A9Ne1oZVJ4eAa7ZUP/qMDg5P8PsRpNYs+YaX4WLcQhU9dDSyiHYX66ieNHlEx0a1YL+K
         AKPxVrsQjgyqssKG1sBgQzrghMvYC47c3/r1lgLWWYVWaOF/x8qGXQ7eqJMA4YvDIT68
         ReyA==
X-Gm-Message-State: AOJu0YypFI77tCDndKlXE+au4iGXpYTextVYp9jzmtI+dya8aTm9PTZq
	f4Fw6UL0v/Z9DxrZLdmX2+g/qRagZUS66fx2VME4ckcwq4QXImGLIcf+Oe7WW7/WaLIWafINNQ1
	a
X-Gm-Gg: ASbGncvg0O+C2IH0WSBrnZvdMY9N5ST8wvv4rrRjY7/wfCupFtRIUNCq/rbqtZ56THX
	CGODlUhaOsz7DdcRRaWHdMyB0NXDIORYHELtO9wQ3OUIzkqx1wweMiXcUkPwZfUEEypUct2atxA
	HQTn6Pw7AfFPe92mWr38bKvjbrmaMQu3MX35aS4+7E0hZVXJ6Rl3nCBqzqB9TDUxLf55Bsw7Juj
	w1bYrqNnjYazxjtOiJ0PkoyLh4Ep0JIVlQ06mOPUM2Rv8+iQ8TBj/LqU4Hu5uSc5DF+0qaYGvs=
X-Google-Smtp-Source: AGHT+IEcQCBZUX0XPvMU/HR/ZggPQb9gubzweghrLhqmKZOk0qUOd1eYBHNQBuV7X9nl0tD9O65LoA==
X-Received: by 2002:a17:906:3158:b0:aa6:9b02:7fd9 with SMTP id a640c23a62f3a-aa69b0280f8mr156112966b.52.1733757989462;
        Mon, 09 Dec 2024 07:26:29 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 0/1] Fix rpath handling in OCaml's Makefile.rules
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cover.1733757256.git.andrii.sultanov@cloud.com>
Date: Mon, 9 Dec 2024 15:26:16 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Content-Transfer-Encoding: 7bit
Message-Id: <6C856A94-576C-4AE8-9B81-5AD827EB3B52@cloud.com>
References: <cover.1733757256.git.andrii.sultanov@cloud.com>
To: Andrii Sultanov <andrii.sultanov@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 9 Dec 2024, at 15:16, Andrii Sultanov <andrii.sultanov@cloud.com> wrote:
> 
> As reported by Nix's Xen team, OCaml stub libs would embed an absolute
> rpath in the binaries, which was picked up on by patchelf. This is a
> symptom of improper handling of -rpath-link in the first place, so
> correct that and get rid of the issue.
> 
> Andrii Sultanov (1):
>  tools/ocaml: Specify rpath correctly for ocamlmklib
> 
> tools/ocaml/Makefile.rules | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 2.39.5
> 

Acked-by: Christian Lindig <christian.lindig@cloud.com>


