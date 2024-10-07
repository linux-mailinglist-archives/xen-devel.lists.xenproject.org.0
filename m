Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E6D993250
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 18:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812237.1224974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq99-0003FX-IE; Mon, 07 Oct 2024 15:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812237.1224974; Mon, 07 Oct 2024 15:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq99-0003E2-FU; Mon, 07 Oct 2024 15:59:43 +0000
Received: by outflank-mailman (input) for mailman id 812237;
 Mon, 07 Oct 2024 15:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5Pn=RD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sxq97-0003Dd-Tw
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:59:41 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28cd50ab-84c5-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 17:59:40 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5398e33155fso5758304e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:59:40 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99325c5c48sm388172266b.170.2024.10.07.08.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 08:59:38 -0700 (PDT)
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
X-Inumbo-ID: 28cd50ab-84c5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728316779; x=1728921579; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12COLQx8z2XFe6amR/mvWLGl0kGN+KarOHS2OvuT2G8=;
        b=DeC5SHSmRu98aLrzO/C3y4wC7M8MpxcSTyJL0OjbNMJVATgL0VtrnrOB/ozLm/nzPi
         +MPK0dNuW0f7vJmVQvjud8Kves4cQyD9A+J45lfGXNIV5vGGLZ+2TcMkcQBHleUhhr0u
         n03xovhem0ISKwcq2dS5jybqWajG2/TdCpEpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728316779; x=1728921579;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=12COLQx8z2XFe6amR/mvWLGl0kGN+KarOHS2OvuT2G8=;
        b=OHGhAQSLw/C6/kAEajb9uMFupSK5UGUHGuqkkr+WYP5mKg2MjSp7QL3vi46W2tW79+
         hByo/sE93fFrkuMymaKo9ovCXjm2bgWZi2xLDvWKHFSELmN1p+d0cYlcZ2d4usF3Y4xk
         U0eFw84hAXVIp0j6prHbaPZLEjLIkQ4DGXUqMW7ME9X/KWmiSX2eeq81Ny0XGkm4eIhP
         nYvuQuy3ZULVldP/m4SCDfW9csthCVvPUenurb/mEhS0uJ2KCvZH3sHJknSgOVtuZK1o
         5iVnxbnTrg7yEHx7xpWQ73GZ+gHYkPW9ecqgaGY0k3yLkglt2DIXRy3InuUpIf6pIkE4
         wzXA==
X-Forwarded-Encrypted: i=1; AJvYcCVGff7KGT7iXM6TWHwuKP1uf3/4AD5Alo6bbJ+N7HV56j7iIvq21eMCUPt2Uon+2FNGhF18oxvh8UE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yztoj8dpVG7BgC6S+EeYN8MrKdFOvm9mxzsAZI+FD0AKUgywfv4
	chunoO8Hf9IsNkXU1dUpNHQ+hlNkx+AagioC6rVzcJF8mhvQ4qRoqFiJYSCEFKo=
X-Google-Smtp-Source: AGHT+IFHmBD5rR0BRIaaupl4dWspvlQ0vQi8tNA3YLtWnTHr0Qtoz9nYxmurff0yceRF0WDEqxXKIw==
X-Received: by 2002:a05:6512:e88:b0:539:8ad5:5093 with SMTP id 2adb3069b0e04-539ab88ce30mr7193975e87.35.1728316779404;
        Mon, 07 Oct 2024 08:59:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Oct 2024 16:59:38 +0100
Message-Id: <D4PP5YZ1G78X.PJY4WZKR15YX@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-3-alejandro.vallejo@cloud.com>
 <c83942d9-bb55-45c2-9a44-314266ce14c0@suse.com>
 <D3EXG6HDKMYR.15275C42NLLBL@cloud.com>
 <D4M7ZZL8YUXE.1D7KX3JJDYH6L@cloud.com>
 <1a0d69a0-84fb-4178-9f73-5490bb1d1adf@suse.com>
In-Reply-To: <1a0d69a0-84fb-4178-9f73-5490bb1d1adf@suse.com>

Hi,

On Fri Oct 4, 2024 at 7:08 AM BST, Jan Beulich wrote:
> On 03.10.2024 15:54, Alejandro Vallejo wrote:
> > On Tue Aug 13, 2024 at 5:33 PM BST, Alejandro Vallejo wrote:
> >> On Tue Aug 13, 2024 at 3:32 PM BST, Jan Beulich wrote:
> >>> On 13.08.2024 16:21, Alejandro Vallejo wrote:
> >>>> It was trying to do too many things at once and there was no clear w=
ay of
> >>>> defining what it was meant to do. This commit splits the function in=
 three.
> >>>>
> >>>>   1. A function to return the FPU to power-on reset values.
> >>>>   2. A function to return the FPU to default values.
> >>>>   3. A x87/SSE state loader (equivalent to the old function when it =
took a data
> >>>>      pointer).
> >>>>
> >>>> While at it, make sure the abridged tag is consistent with the manua=
ls and
> >>>> start as 0xFF.
> >>>>
> >>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>>
> >>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>>> ---
> >>>> v3:
> >>>>   * Adjust commit message, as the split is now in 3.
> >>>>   * Remove bulky comment, as the rationale for it turned out to be
> >>>>     unsubstantiated. I can't find proof in xen-devel of the stream
> >>>>     operating the way I claimed, and at that point having the commen=
t
> >>>>     at all is pointless
> >>>
> >>> So you deliberately removed the comment altogether, not just point 3 =
of it?
> >>>
> >>> Jan
> >>
> >> Yes. The other two cases can be deduced pretty trivially from the cond=
itional,
> >> I reckon. I commented them more heavily in order to properly introduce=
 (3), but
> >> seeing how it was all a midsummer dream might as well reduce clutter.
> >>
> >> I got as far as the original implementation of XSAVE in Xen and it see=
ms to
> >> have been tested against many combinations of src and dst, none of whi=
ch was
> >> that ficticious "xsave enabled + xsave context missing". I suspect the
> >> xsave_enabled(v) was merely avoiding writing to the XSAVE buffer just =
for
> >> efficiency (however minor effect it might have had). I just reverse en=
gineering
> >> it wrong.
> >>
> >> Which reminds me. Thanks for mentioning that, because it was really ju=
st
> >> guesswork on my part.
> >>
> >> Cheers,
> >> Alejandro
> >=20
> > Playing around with the FPU I noticed this patch wasn't committed, did =
it fall
> > under the cracks or is there a specific reason?
>
> Well, it's patch 2 in a series with no statement that it's independent of=
 patch

I meant the series as a whole, rather than this specific patch. They are in=
deed
not independent.

> 1, and patch 1 continues to lack an ack (based on earlier comments of min=
e you
> probably have inferred that I'm not intending to ack it in this shape, wh=
ile at
> the same time - considering the arguments you gave - I also don't mean to=
 stand
> in the way of it going in with someone else's ack).

I didn't infer that at all, I'm afraid. I merely thought you had been busy =
and
forgot about it. Is the "in this shape" about the overallocation that you
mentioned in v1?

>
> Jan

Cheers,
Alejandro

