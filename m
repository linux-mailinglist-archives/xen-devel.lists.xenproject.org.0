Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E782568C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662224.1032222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLm3v-0008Sq-S6; Fri, 05 Jan 2024 15:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662224.1032222; Fri, 05 Jan 2024 15:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLm3v-0008RC-PN; Fri, 05 Jan 2024 15:24:43 +0000
Received: by outflank-mailman (input) for mailman id 662224;
 Fri, 05 Jan 2024 15:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DYK8=IP=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rLm3t-0008R4-IX
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:24:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b588947-abde-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 16:24:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso17745805e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 07:24:40 -0800 (PST)
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
X-Inumbo-ID: 8b588947-abde-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704468280; x=1705073080; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnYvA6C259NsK5O+esL6YhNa/qj2wVkZ0Gh31+CLHi4=;
        b=adn7K4fOHj45TMThr5cKm4BQyJKnYvCGBnHvwoL5pRTWk1Z37yM5dopQe1JsJLCKxe
         KLsmXN/+BXj6OAxLF2qv1/JTxdaGQtHQzT1PcG6JeOOP7T5+N8TCRdxydmcdvECErkik
         xoMe867Wk9k2yAyKAa+W1w0ZN3OkxTuxHC4dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704468280; x=1705073080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnYvA6C259NsK5O+esL6YhNa/qj2wVkZ0Gh31+CLHi4=;
        b=PeyVulXpMkJa5CL0anT7s5GaFane9vhppaf5Y3ujgoT9j8PecS+7IsrGNb49//ndMj
         RnkA/VocIZkPyy+hBZdRra/cj42XlMX7YQE0naO0SokFSxa5iHuPCffv2dxAKM+fqqCv
         MdHazew1brbCXVkPCfeIqfbuHHtFp13SZKQQBhwLyYYhfpD7pE2HOtSd7KLGpqNT5oJ7
         pJSy7jTixinULibwrY+n58PfpBng3rnGJhp9cgtPn3OKmN9OQtn0+ddqo5aMV4T/kAiD
         nFawemdLbfy/6qEoG3z3JC7z95A4ERqgvbyTtQlYfXk1NhgIYqs2wKnmdNMgfN/491hL
         GAlw==
X-Gm-Message-State: AOJu0YxW66V/gqSK/TK74MiSmV74f2WeISela+k2kggCSV0hOxRFDGNc
	02UFQmo8aoeRAS8UMTJVZENAFx/pyy1lulqFBr1NboWV3nil
X-Google-Smtp-Source: AGHT+IHfzicJsepAJwlvjE2CM9hgEEBHUHHn46FN6cegpe7wHIq3Qynau2VhxqntYFMS5/rGf7InWFkQmam93YnKRic=
X-Received: by 2002:a05:600c:601d:b0:40e:393e:8de4 with SMTP id
 az29-20020a05600c601d00b0040e393e8de4mr330199wmb.114.1704468280046; Fri, 05
 Jan 2024 07:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
In-Reply-To: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 5 Jan 2024 15:24:28 +0000
Message-ID: <CAG7k0Erh3xE5EdWhNm4Koi-hU+77Swsx_GvSSNzfY2uOh3AoLQ@mail.gmail.com>
Subject: Re: [PATCH] xen/livepatch: Make check_for_livepatch_work() faster in
 the common case
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 10:01=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> When livepatching is enabled, this function is used all the time.  Really=
 do
> check the fastpath first, and annotate it likely() as this is the right a=
nswer
> 100% of the time (to many significant figures).
>
> This cuts out 3 pointer dereferences in the "nothing to do path", and it =
seems
> the optimiser has an easier time too.  Bloat-o-meter reports:
>
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-57 (-57)
>   Function                                     old     new   delta
>   check_for_livepatch_work.cold               1201    1183     -18
>   check_for_livepatch_work                    1021     982     -39
>
> which isn't too shabby for no logical change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

