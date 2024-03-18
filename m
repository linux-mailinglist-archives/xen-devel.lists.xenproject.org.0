Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BC87EE9B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695091.1084643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGf1-0000a7-Td; Mon, 18 Mar 2024 17:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695091.1084643; Mon, 18 Mar 2024 17:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGf1-0000Xe-QI; Mon, 18 Mar 2024 17:20:31 +0000
Received: by outflank-mailman (input) for mailman id 695091;
 Mon, 18 Mar 2024 17:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Otdy=KY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rmGez-0000XY-Uz
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 17:20:29 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0d5c3e2-e54b-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 18:20:29 +0100 (CET)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5a4a2d99598so867614eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 10:20:29 -0700 (PDT)
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
X-Inumbo-ID: d0d5c3e2-e54b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710782428; x=1711387228; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRFfA5psmxpI/SQG+I5c+atf9Gqhl39S47/tTYJbKvc=;
        b=Q2xys6GllBRK/2u/3EVT9+f6oF3wxm1YwqfAkie+ls8RHxn6FG5FV3sVNcvBVzhI3x
         +x9vmPv0HNhWG4rBuFEuo6oEuRXgFVC3NsvGGT54JhOtaw4Tm7LnE+RALUZaG8ZZWJSW
         R3zGPboxVN45Xm7t32btltgHVVISY7shj3WIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710782428; x=1711387228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRFfA5psmxpI/SQG+I5c+atf9Gqhl39S47/tTYJbKvc=;
        b=ex3n+Dor1JrpShRDravmOMcflsOzhUwK+mlVgjBrBtaG93/hUejislgzsV5WsH1+Bt
         PpIPIq4zWIbuqIOw36yNYf91stYVraXTI7uWam8ToHsoj1ZWDuLTKH+GrJKwItp4UCO3
         oRNxO1mhUi6zZ3+pE8iaBz036QF8m275Ng2ntOoJpnkuBAwuyc9Yp0RFKuFq8AZzvrhM
         AOtcAZvan26yto26a+IgcY51puu2pq2QAstZgsWYuPuKN9wnD8JjPmfh/CTqOF939snG
         v2faPPM78XN3xnlYeorgopNUxUEHd1j9Uimv07INxcZEFXpKoWykYAzSmx1ECzgOOmVA
         CRhA==
X-Gm-Message-State: AOJu0Yz6b+gAAJFNdAZJ2jg0c1AhmcKQx19neJdqQ/vLCUOM5S+eGRR/
	C0BwtnjyxwdTUDL/BsltVDzmtC5pBPdTzPwDhPLprDQ8heGAQCNi8AFVojHfg5AlqwIrg/F9w+3
	hM0bDgtt4VrXft13hmswBk9Qc14UFAXHT1SPW
X-Google-Smtp-Source: AGHT+IE0+3glIPabxQE8gkIiHq4hq+82ClKk4n+ky6RcZAIFss1sBo+HA/rESppmyhkUigeBtEMV6pKNgUk4mMdkY0k=
X-Received: by 2002:a05:6358:782:b0:17e:6954:5750 with SMTP id
 n2-20020a056358078200b0017e69545750mr7944930rwj.9.1710782427852; Mon, 18 Mar
 2024 10:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com> <20240318110442.3653997-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240318110442.3653997-3-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 18 Mar 2024 17:20:15 +0000
Message-ID: <CAG7k0Eoa65GYgShW-nOe=e8q-3iHGNjvx_JzNVy+pJ3J4tjg_A@mail.gmail.com>
Subject: Re: [PATCH 2/4] xen/virtual-region: Rework how bugframe linkage works
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 11:04=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> The start/stop1/etc linkage scheme predates struct virtual_region, and as
> setup_virtual_regions() shows, it's awkward to express in the new scheme.
>
> Change the linker to provide explicit start/stop symbols for each bugfram=
e
> type, and change virtual_region to have a stop pointer rather than a coun=
t.
>
> This marginly simplifies both do_bug_frame()s and prepare_payload(), but =
it
> massively simplifies setup_virtual_regions() by allowing the compiler to
> initialise the .frame[] array at build time.
>
> virtual_region.c is the only user of the linker symbols, and this is unli=
kely
> to change given the purpose of struct virtual_region, so move their exter=
ns
> out of bug.h
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

