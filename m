Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B33B21C74
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 06:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078243.1439228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulh5Y-00034I-2T; Tue, 12 Aug 2025 04:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078243.1439228; Tue, 12 Aug 2025 04:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulh5X-00033I-W6; Tue, 12 Aug 2025 04:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1078243;
 Tue, 12 Aug 2025 04:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FCi3=2Y=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulh5X-00033C-Bb
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 04:58:19 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5d2bfa2-7738-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 06:58:17 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3338149d8a3so56358011fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 21:58:17 -0700 (PDT)
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
X-Inumbo-ID: f5d2bfa2-7738-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754974697; x=1755579497; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl5nblFzS+zxUAxpd/KW6BXU2tOQFqRW8XEJB5U+dV8=;
        b=R32dSyCzCvPE/4rVmN3fTvEkNWSoLVYWpUWwM4wV4dYZucWXf+EBwIrF54tfQ1RubU
         wOObZoWtguwsrXH+6PyXukBrAyqFobr/8E+uK/lGrVl+czLttzKu9yqxRy9SnBUGhrcL
         kRW/WuQkxoPusLPZcYIpbDOKezlKhtXgPz8s25fihOdpx6C6k55yz3I+X+bKUEk0KB2E
         cNglvxIkbRr/XVQaLuOOXscA088m7xo/fcouMs7ZJZt39U6fV6/l31SJocw8Xow54kxA
         VK+k/t26fTMOmyXAnne8hNe6zvY7+ssCYozMJcRNJXJ92yWG9id6jWMz8mGfDoVdTOe+
         CTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754974697; x=1755579497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl5nblFzS+zxUAxpd/KW6BXU2tOQFqRW8XEJB5U+dV8=;
        b=XQx1aMRTwAIwYwL2/hfq8tykF5fNBZEgKmICpuGjO1hRJYEi6F8CYBiYuc7fv4uZOJ
         lv+0L2i1/m0yrBvNje8MBJYxgRPoUYUj03QqpmieWbWiTpE9oCh5/eUZJMeQevMG81Lg
         rtEoKDEGwYTvS5N8+/CWYGJ9ukCDd9yls4RHOz8Ma1/kyo3oiJ5vbJtFRaGoDDyBLVru
         hHByF5+uHfrqjL2ytGMdzk4w2adSI3fu68pPE4vISRSFydK+T3eW6FarB/kNyzx0O+aC
         zpUXdAFQt7Y9ULEOQw4BQk7fedbvg3H0PxwKuliD9D4IauvMPRoqiaLEvD3WyGmt+1hw
         qBuA==
X-Gm-Message-State: AOJu0YyJFX0RFfGxaC0sS2xFJJ2qMPOjOABEZlBXPWoRMlVKkg+Rg/Py
	P86T27mC+WzpXLuq1YY7NVuF+HMrFQY4eRlIJv4cObigZfG3hYfecn6th/E8LhAZOBDyVZY9G1t
	OviRtssCbFUweUoNoqzI9ZNXNEIFbQdU=
X-Gm-Gg: ASbGnctrk6Yd+Iy+FyGHAO2EhU6gTtrC3TrYzucLY7VkxcOgi5q9mgYyu9c7loaY1OB
	8Wno0uUeNZgu6BP/HSajMFAUg1XqzO0EO0LDnCnFg5+r5JYl1O1GexL1pBp/lczMzkTxCYNj5th
	fZoQMW9+HX9A9qYgQYRy0k3eKyFydMo8AGWPMszdiChHIbCE7nIvwof1iAMFXmQ+/9qDvLMNHs7
	C+v5fU53Pwmi5wy
X-Google-Smtp-Source: AGHT+IFVYvj/rAMU9CeFCM2/BSO3h5OoVP0TSq9ETG4qzqIrLOccC53KZKP9dNvPzcCGTL7x8GSRxyPxQXGLlzYsuWk=
X-Received: by 2002:a05:651c:1115:b0:32b:968d:2019 with SMTP id
 38308e7fff4ca-333d7be8608mr4859971fa.18.1754974696526; Mon, 11 Aug 2025
 21:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <2b3afe23-1d47-4a66-bf0f-9a94b0b906c7@xen.org>
In-Reply-To: <2b3afe23-1d47-4a66-bf0f-9a94b0b906c7@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 12 Aug 2025 07:58:05 +0300
X-Gm-Features: Ac12FXwwrPi18rr0OaP4V7p08dvDV9TLMSOaLE-G8WzY7yIqwcaPWUClDoB73qs
Message-ID: <CAGeoDV-T8+0DSZN9n9XF5mguONKkXO+vQGGBrNtpGydDm3Z2BA@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Add initial Xen Suspend-to-RAM support on ARM64
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Tue, Aug 12, 2025 at 12:53=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Mykola,
>
> On 11/08/2025 21:47, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > This is part 2 of version 5 of the ARM Xen system suspend/resume patch
> > series, based on earlier work by Mirela Simonovic and Mykyta Poturai.
>
> Thanks for adding support for Suspend-to-RAM. You mention this is part
> 2, can you clarify what's the state of part 1? Is this already merged?
>
> If not, then can you add a link in the cover letter? This would be
> helpful to know the review ordering.

Thank you for pointing this out. I missed adding the link to the
corresponding part of this patch series. Here is part 1:
https://patchew.org/Xen/cover.1754595198.git.mykola._5Fkvach@epam.com/

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

