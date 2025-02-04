Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C472A2744B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881611.1291767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJt2-0004Wg-P4; Tue, 04 Feb 2025 14:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881611.1291767; Tue, 04 Feb 2025 14:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJt2-0004UU-MC; Tue, 04 Feb 2025 14:26:48 +0000
Received: by outflank-mailman (input) for mailman id 881611;
 Tue, 04 Feb 2025 14:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfJt0-0004UM-On
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:26:46 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fcdf4e8-e304-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 15:26:45 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso1166064566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:26:45 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6fe37da7bsm757870766b.109.2025.02.04.06.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:26:44 -0800 (PST)
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
X-Inumbo-ID: 0fcdf4e8-e304-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738679205; x=1739284005; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaiBsY9Vawf5rDo153pbPxRRo7LzbIqFnQkuliKqFFk=;
        b=PyR8Srgyson4YFmlbjHyNO0dxyBZjjg65PtIDtHaqsLM9VMUuTad1NNrayEXlhSlG5
         7eKk3JHsoHz0tgK81CJwymmbHJfcUvpQ0dyC+pgVqTGrl21eJGomofj4u5zoS91ECaLz
         zPd2wH6+VGiO11L6lAKBtkA1k4AW2UOa2otRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679205; x=1739284005;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AaiBsY9Vawf5rDo153pbPxRRo7LzbIqFnQkuliKqFFk=;
        b=iErVCB8kJC3PY7S0aKWNzuXkoElMKrGUNBjIsobuhkrUGuhOPx6VtrzrFyuaJtPh4O
         b5nnVRME8pA8egod1/bHPi3wgFbIf7qmLSHGnWfJDG+EM9QQYOZeQ5X/j8aSbbaeOVXF
         vDXZFIA4h9frDJ2SbPMo7IOB7jW5cXOwpHHm9+VEgxzD3Kp05C9el2MTsC67toDQ4PKi
         1biqFfxzrZj+XySgdKZqnUH2LdMQSozctRR+oSgYsFEIyyTiibJanDL7dGswY8EW8NXj
         f62r3OHIEIn+Gm3XbAid3RvHQ1Vxn35N5vTjEHA03/bQXGMO6BBhwqyDw95RIxOsqsmR
         33ug==
X-Gm-Message-State: AOJu0YyDBrcA160D55wYgBNC9UwjMcLqD/cIcWRxnjsKR+C29fwnxDwM
	qIsZw8xGuotcP0Xk5CGRx6QIE2la/Os5u+AbrHYUQWWud+GA/Rxmck3VBon2Q7kC9ozIF5YNJ7D
	XpCwG/Q==
X-Gm-Gg: ASbGncuS13y95qkGM3cP5nRYE6NyDxV4itWa0ofYeJ3duBytXx6n0L6w90uwyqqvGkz
	JmdsGcHeqkmfsWmMsYJq0NToMs8yUsXD0/ahfHO+P0Ja4dsO7BKyzOo9YsjHDdli8yGcc2MHFpL
	eE50uZQdBasGokwmxpgRNfqxkFcCGQu4BT+HhiESv43xYht9Y7ZJKjqUHMjAk/XQlq0mXucOQR2
	jW3tkJabHBdg625Nh6e0PY3ci0vmUnyzu6/VZ13iKhMs/gtO0y8LhlGFAHqCTffS8wkBmR/9Wzv
	l3YUv9v2jHaCMj79mRbpoiACz17cFxBZgX7sYrg3MArJ6g==
X-Google-Smtp-Source: AGHT+IGmlyRcFB86o23bQw67fQywFj7Z87mIDCgF5GwgLjJ3HGoBlTsfwmvwaOX3UD6xC8jd8At+rA==
X-Received: by 2002:a17:907:724c:b0:ab2:b5f1:567d with SMTP id a640c23a62f3a-ab6cfd0a17amr2285668966b.32.1738679204660;
        Tue, 04 Feb 2025 06:26:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 14:26:43 +0000
Message-Id: <D7JQC7B1DAF3.A0UH923TTV4T@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/3] tools/hvmloader: Decouple APIC IDs from vCPU IDs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <Z5kXq2RehzyFEYqA@macbook.local> <D7DXEC0N45CT.2JHUHP1XAVB5F@cloud.com>
 <Z5pWiYWGv66uXpAm@macbook.local>
 <cb108460-b3df-4d59-8cad-696981660bc2@suse.com>
In-Reply-To: <cb108460-b3df-4d59-8cad-696981660bc2@suse.com>

On Thu Jan 30, 2025 at 9:17 AM GMT, Jan Beulich wrote:
> On 29.01.2025 17:25, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Jan 28, 2025 at 06:42:38PM +0000, Alejandro Vallejo wrote:
> >> On Tue Jan 28, 2025 at 5:45 PM GMT, Roger Pau Monn=C3=A9 wrote:
> >>> On Tue, Jan 28, 2025 at 04:33:39PM +0000, Alejandro Vallejo wrote:
> >>>> The hypervisor, hvmloader and the toolstack currently engage in a sh=
ared
> >>>> assumption that for every vCPU apicid =3D=3D 2 * vcpuid. This series=
 removes such
> >>>> assumption from hvmloader, by making it read the APIC ID of each vCP=
U and
> >>>> storing it for later use.
> >>>>
> >>>> The last patch prevents writing an MP Tables should we have vCPUs th=
at can not
> >>>> be represented there. That's at the moment dead code because all vCP=
Us are
> >>>> currently representable in 8 bits. This will inavitably stop being t=
rue in the
> >>>> future after we increase the maximum number of guest vCPUs.
> >>>
> >>> While I'm fine with the MP Table change, should it also come together
> >>> with a patch that introduces the code to create x2APIC entries in
> >>> libacpi construct_madt() helper? (and bumping the MADT revision, as
> >>> I'm quite sure version 2 didn't have x2APIC entries in the
> >>> specification).
> >>
> >> That's a lot more involved though. Matt started something in that dire=
ction
> >> last year, but testing it was (and still is) effectively impossible un=
til
> >> HVM_MAX_VCPUS increases.
> >>
> >>   https://lore.kernel.org/xen-devel/cd1a3ce14790af8c1bb4372ef0be5a6cbb=
b50b1c.1710338145.git.matthew.barnes@cloud.com/
> >>
> >> The rest of the topo series can be used to test that (with a hack to
> >> artificially bump the width of thread_id space), I'd rather not test a=
 patch
> >> with a long and still uncommitted series.
> >>
> >>>
> >>> Otherwise the MP Table change seems like a red herring, because the
> >>> MADT created by libacpi will also be incorrect and APIC IDs will wrap=
 in
> >>> local APIC entries, just like it would on MP Tables.
> >>>
> >>> Thanks, Roger.
> >>
> >> My take is that this is strictly better than what we have today by vir=
tue of
> >> going down from 2 latent bugs to just 1. That said, I don't strictly n=
eed it
> >> for the topo series to advance, so it is (in a sense) optional.
> >=20
> > I'm fine with the patch, but it probably wants to mention in the
> > commit message that MADT tables will still wrap when using APIC IDs >
> > 255, as otherwise it seems MADT is not taken into consideration.
>
> I think we simply should not add MADT entries with wrapped (truncated)
> APIC IDs. Which can be done when they truly are at risk of wrapping, or
> right here.
>
> Jan

I'm unsure that's the best approach, but I'll just drop the patch on the ne=
xt
version. It's all gated on getting extended APIC IDs on the IOAPIC and MSIs
working anyway.

Cheers,
Alejandro

