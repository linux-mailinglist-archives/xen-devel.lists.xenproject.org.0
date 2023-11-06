Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DE7E22E9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:06:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627969.978928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzJD-0005U1-9e; Mon, 06 Nov 2023 13:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627969.978928; Mon, 06 Nov 2023 13:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzJD-0005R8-6W; Mon, 06 Nov 2023 13:06:27 +0000
Received: by outflank-mailman (input) for mailman id 627969;
 Mon, 06 Nov 2023 13:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3DI=GT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qzzJB-0005R2-Hn
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:06:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 492ee84d-7ca5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:06:23 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso7391355a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 05:06:23 -0800 (PST)
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
X-Inumbo-ID: 492ee84d-7ca5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699275983; x=1699880783; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELRYQZKkES8PTQajV1im084C0bW7XyWkpmhDM0jUfTU=;
        b=W09cL3V/uiWvBO7V+TkOL/qbBkOZxEWBp8ZcF4ikGt2UrprPkKq4iqJFqUazB1065q
         py6Pi+x1+FmznehJJNTztGIzP+d37CyttntyJvW71nbCF1NcVjktQi2kxdKiLXbHd0hU
         jOvruTjlk1/wixSLymV0FSeULVIngAqvrsN8oXWDNG1xHnIxWiukkYmCCZhTyBALKYzI
         Qxb1lz4hE2tt09VKj+bQY2UxqkpalAVCmiGenUXC33HteGqAL1kCxqaQnWPHidSlvZ6u
         vk2gM/P6CTBcRU/HtETdfFPsXj0V+h3T5cYvhodLq/ZEGZ76LglC1I3EykFGlCXBWsb7
         743g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275983; x=1699880783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELRYQZKkES8PTQajV1im084C0bW7XyWkpmhDM0jUfTU=;
        b=Nxnv/U/9RXLko5hTHepKWBILGSQ3uMJBMxZaSrQ9RN0Y806yq7wjPSik7tYP4/tkop
         ePMzuk49RKdzIlXHR5EvTNmPQZoDootSGMaJ0d2jS1cFHZpmB1zizEPGXEhCPOwCV7PX
         M0EnV0lveroh29edH1B0QZRan3xdy89ij+vUb3/5w/WkuJO80ikPjukrpEgVhIT0e+r2
         NMzygpc4ZPI1KA92oRnJZeUurOlYY+gV6XwSvWKjcOLugoPws2Gr0sjdetETg8Xj2qoQ
         M15xZc3G3AR4c9JsXEi4e/EQ7cu1EcHU3wTiwPQxwqvUGbF90TTW4u8b0+EOvC1oLPAZ
         NhRA==
X-Gm-Message-State: AOJu0YxAZhZr7co9PrOk0xQUCFeowTNHo8b6Nrz83VsPfbKNqVanK8eC
	EYlFuW/snrXHVNmJ2aFpnCHl54elO3gQ1dsOMBU=
X-Google-Smtp-Source: AGHT+IGKRYnJx9F2q8PDQIovQUudvOOu8CTr0zwmAsx0InVEfC+g3qc1rJwXkRY6t8PySnCfDerGGj4kyrLKz7LDCSU=
X-Received: by 2002:aa7:c994:0:b0:53e:f321:e6fd with SMTP id
 c20-20020aa7c994000000b0053ef321e6fdmr24406363edt.9.1699275983073; Mon, 06
 Nov 2023 05:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20231103194551.64448-1-jandryuk@gmail.com> <ZUjf1bZrlH8nsX-j@macbook>
In-Reply-To: <ZUjf1bZrlH8nsX-j@macbook>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 6 Nov 2023 08:06:11 -0500
Message-ID: <CAKf6xpuostm4JZZ_QT_5R_TA6QqFdq9ZzEfMWAhQANROA3_7Qg@mail.gmail.com>
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 7:45=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
>
> On Fri, Nov 03, 2023 at 03:45:49PM -0400, Jason Andryuk wrote:
> > These two patches refresh the bindings which have gone a little stale.
> > I used two separate patches since the XSA-443 one may want backporting.
>
> The XSA-443 one is only relevant for unstable and 4.18.  Stable
> branches at the time of the XSA didn't get those fields added as it
> would break the API.

Oh, good.  Thanks for confirming, Roger.

Regards,
Jason

