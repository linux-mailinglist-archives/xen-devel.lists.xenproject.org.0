Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C7B7DC91E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 10:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625540.974904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxkjv-0003FF-FO; Tue, 31 Oct 2023 09:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625540.974904; Tue, 31 Oct 2023 09:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxkjv-0003CU-Ci; Tue, 31 Oct 2023 09:08:47 +0000
Received: by outflank-mailman (input) for mailman id 625540;
 Tue, 31 Oct 2023 09:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+CR=GN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxkju-0003CO-DB
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 09:08:46 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17942795-77cd-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 10:08:44 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso550702966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 02:08:44 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 gv21-20020a170906f11500b009932337747esm608618ejb.86.2023.10.31.02.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 02:08:43 -0700 (PDT)
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
X-Inumbo-ID: 17942795-77cd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698743324; x=1699348124; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCXNlIfMoyVSdTvk0VtP87TFdeFjDRAbDQq3QIRqV28=;
        b=UFJwC6kqls7CogrzgskWSgFrApINovD5inJKFbwqQUhudAKhjdBrDGatBNNhok5T8M
         Z9d1C2zfLKC2J3Z9yqpZ/FV2Az9M62+WyCF2I1GYhXoNASNwI3aNZslQKq4Dr3eoKEf7
         71231ZmemhijmP4citgsQujtAWTlbaPSJTKvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698743324; x=1699348124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCXNlIfMoyVSdTvk0VtP87TFdeFjDRAbDQq3QIRqV28=;
        b=lX8/n7x3z7V7/myU5brhyChL4yre3d7Mg+W+pRKmcq/Y6NmXc67qVBucabnrIFB9CT
         ONdHTgoOvfnCOrZMrUFT1R6JtzsICBkWDFVIy5BmAkZWmrpwUqqJydQDpNAV4EMOwz9w
         etjEPaoY8koqlRl0gAAmYGbeMcICoATv/HoEzvSTyqfrZJK6tdgUbh644GQuKoP6WHPw
         sMQUClqhHKqCFtGowGXkYk8TYxiID57sH/LCyeeFuTWHQDLGPpYfqgKy95QCGO30FNZT
         vpWOkPWiFIsl2s8sSZGRndnKwIafwpKhSm9EbS5IDZUoCv3aCXITLEv54yMkRxCnr5nH
         DCWQ==
X-Gm-Message-State: AOJu0YyoLm7ZvwJMOSLIlffwKcw1/2iTckeowgoZM4k2dgVDxuViYKTA
	eVzAcQwfeLjUMNDiYhe8qMTBNfsth3sihsDHeDs=
X-Google-Smtp-Source: AGHT+IEaizyXKri5aZftjaAOOF8/6YcPeZ8KlBvJ9Rrjy5qTd9FOKjwvMEyT+GWWzjMMRu3KAPiNYA==
X-Received: by 2002:a17:907:d311:b0:9d1:a628:3e4f with SMTP id vg17-20020a170907d31100b009d1a6283e4fmr7399900ejc.32.1698743323896;
        Tue, 31 Oct 2023 02:08:43 -0700 (PDT)
Date: Tue, 31 Oct 2023 10:08:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PVH: allow Dom0 ELF parsing to be verbose
Message-ID: <ZUDEGqGBjKWpwY5e@macbook>
References: <b297e430-f3e3-97a7-be7d-1debdbcb0119@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b297e430-f3e3-97a7-be7d-1debdbcb0119@suse.com>

On Mon, Oct 30, 2023 at 02:14:44PM +0100, Jan Beulich wrote:
> VERBOSE had ceased to exist already before the introduction of this ELF
> parsing code.
> 
> Fixes: 62ba982424cb ("x86: parse Dom0 kernel for PVHv2")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Some of the printed information might not be relevant for PVH mode,
like the 'ELF: addresses:' virt_* fields.

Note also that in 62ba982424cb opt_dom0_verbose wasn't available yet,
that option got introduced a couple of years later by 525ef6584f852.

Maybe it's 679216943f545 that should have also switched the
elf_set_verbose() in the PVH dom0 builder to use opt_dom0_verbose, at
the same time that the PV one was switched?

Thanks, Roger.

