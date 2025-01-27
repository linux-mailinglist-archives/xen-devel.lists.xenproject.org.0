Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEFA1D9D0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 16:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878048.1288226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRHN-0000Tr-V2; Mon, 27 Jan 2025 15:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878048.1288226; Mon, 27 Jan 2025 15:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRHN-0000SA-R8; Mon, 27 Jan 2025 15:44:01 +0000
Received: by outflank-mailman (input) for mailman id 878048;
 Mon, 27 Jan 2025 15:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFPb=UT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcRHM-0000S2-8V
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 15:44:00 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 863c4ba6-dcc5-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 16:43:59 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862d161947so2377937f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 07:43:59 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48574csm137098645e9.9.2025.01.27.07.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 07:43:58 -0800 (PST)
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
X-Inumbo-ID: 863c4ba6-dcc5-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737992639; x=1738597439; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuMOHJudoXPgzPtgSV+ojiBsyso+cl8f7sg2TFlWHh0=;
        b=OkUue7ZhSFRPUzKVBsvlSkMg66Fx4EnNbOAYvARwOChk0JhZ3FKTSbJHXD6pjx6pr2
         JPzcKCeLgzKxSZuOFGTkKZRFJILI9wcrjD055/8PbgwOrr3SqFYWZguFkrse72HwVCML
         mzkpe+1hhD5eNx2qo/RqfiD4C7WgMrXKBho+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992639; x=1738597439;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuMOHJudoXPgzPtgSV+ojiBsyso+cl8f7sg2TFlWHh0=;
        b=dF0zXhnijY1auYfgZE6I1dnNAa8pO/emAcwZ/VURE6uQaJTYAC/CJV+NKgAjza798E
         53n6BLwC6XqML8KHKuiFOm+s5MKWDcFAVp4WP2iJDQXg2WSPdx+aWqVNUY47lxfljORz
         rgOJry4wOWSgGJ/UFTTNFXrXM/hNpxGY5nFdWgzc6WmA5Y5uhxRi6WTlZt2f8zi4/iCh
         ticMiJt8Y84r1UierCK9Yy0UmNVlI9mKaqLA+vDDr467PMsYjhINOiphMKt55Y2c9G13
         +izzQxnogmPRq0thqQpAyJB25BcD6jA6JxRL5s219bZx5f9dti16NAOWRGfHRDZC0o9h
         q8ew==
X-Forwarded-Encrypted: i=1; AJvYcCW/Hp4LxEPvyBxc9FrM27EaKfwNi9Ww2pwsWvbcg0w3Y6AZB2qExQZaxd3ueJ3FhAJX30HWE+zLACY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz50Z9yHZw95xy0EZgN9oGwW58kZteqJ2nnVpAFwwzR1mSLekjf
	CiPthhwK+VJWLZk9/ONyPmzK/A0fxHN4G3kONzcv7UTaMaeUvgbo/XsXtvMDbH0=
X-Gm-Gg: ASbGncu7GOMMK953OGHUK48IOr7jgVqPgdrxM9i5KG4hSEQFtyy7y0kC9JqMCF+d0+4
	TL6It6O43SVQQ3IBN6wAcmTGOKpXGmqSf6sa5h0ZCGSh6tacSyBySGb5Pj19IkNp35jcZp27waJ
	GJOErjjXt/snGeETugkXh+xXQGneyKDIqAivp3EGFAP2oj+Cmk++/rhJZylY1dKw2iyQL/Lu+rS
	bz8axkTAFji7zzXvkeSWXsoX7vBdRDG0KLGIWbF8KRSkxLgjZhDXDl0nlqz+pgl5Ynu7252OLjh
	SerQDbxcvebr67FfpPQI6VLkVN++KE+BJjc=
X-Google-Smtp-Source: AGHT+IE28Ua4x5CtYdEPb/xGIcmnu7/aDKftHQsHftpAeED79woDN2BQ2y+mt59dCALNsoLEIWl3Ow==
X-Received: by 2002:a05:6000:1888:b0:385:fb59:8358 with SMTP id ffacd0b85a97d-38bf57bd745mr33693302f8f.53.1737992638668;
        Mon, 27 Jan 2025 07:43:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 15:43:54 +0000
Message-Id: <D7CYYY32L980.13KVUVEGKDHK@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 10/12] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xsave()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-11-alejandro.vallejo@cloud.com>
 <5c0f2096-32ec-4d08-83be-6153f4a637e3@suse.com>
In-Reply-To: <5c0f2096-32ec-4d08-83be-6153f4a637e3@suse.com>

On Mon Jan 27, 2025 at 11:01 AM GMT, Jan Beulich wrote:
> On 10.01.2025 14:28, Alejandro Vallejo wrote:
> > No functional change.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > v2->v3:
> >   * const-ified v in fpu_fxsave() (missing in v2)
>
> Sadly this has rendered ...
>
> > --- a/xen/arch/x86/i387.c
> > +++ b/xen/arch/x86/i387.c
> > @@ -129,7 +129,7 @@ static inline uint64_t vcpu_xsave_mask(const struct=
 vcpu *v)
> >  }
> > =20
> >  /* Save x87 extended state */
> > -static inline void fpu_xsave(struct vcpu *v)
> > +static inline void fpu_xsave(const struct vcpu *v, struct xsave_struct=
 *xsave_area)
>
> ... this line too long now. With it suitably wrapped (possibly doable whi=
le
> committing, if no other reason for a v4 appears)

Bah, yes. You're right. I don't mind it being adjusted on commit.

> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

Cheers,
Alejandro

