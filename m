Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F9BD97F0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 15:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142771.1476704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ed5-0004nh-P2; Tue, 14 Oct 2025 12:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142771.1476704; Tue, 14 Oct 2025 12:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ed5-0004ll-ML; Tue, 14 Oct 2025 12:59:51 +0000
Received: by outflank-mailman (input) for mailman id 1142771;
 Tue, 14 Oct 2025 12:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+O4t=4X=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1v8ed4-0004lf-IU
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 12:59:50 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa8d734c-a8fd-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 14:59:49 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-72e565bf2f0so56418787b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 05:59:49 -0700 (PDT)
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
X-Inumbo-ID: aa8d734c-a8fd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760446788; x=1761051588; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DGAb+4USIiQWrIYxqWxfsLF1eArRgLsM7HUF2jQ9eV8=;
        b=fn8vAzzZRJuNuk8KHAazE95JxErLvpsoD33HZdwzjzpjOF0bApOxGkaDLp6eLBTzN4
         cf7A8XeawOckbogpz11/spB6pyhT1xeM9/24GciYk5rhu3btZoSkmegaO02JYY/HA5KF
         hLqL7DEaEqbSg9s5xjQARJeeXGGjiFkKO19G/QZEtE42dMgUWz3CboaBnaSNbmnjJU4f
         c2uO4MZ9WIIy6SRMTDWX415FL/yilbLMvzsvjbmWIc+q3WvdOpyCsieyHTtipZbORTLQ
         w2gVjvTfe+ji8RvdYVZG1UKq9Tnxo0R1GYf7/QFK9sI7HYQPDOzvV9rYQIGYNNA5MZZj
         gVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446788; x=1761051588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGAb+4USIiQWrIYxqWxfsLF1eArRgLsM7HUF2jQ9eV8=;
        b=LBh7HVpBdXFb1wJxlAhuSaory/mxQzIriFG9MKef4Yc8w2sKt04PeX6swtPnsOACXJ
         L6x3F3UlO5sxZmY3Cq53rOOhh/RlRmurgFycgrxuF7HgXm/OrS7pF9Wk4sxjEbDdnk6t
         8qW2kXxPzIp1HNNzhfPxjhbI6uyqYBhKHBNYnpzGXgwdzhu6fFEYEO/KQgwFY/UXssV5
         +urkoJbzYkXxaqxYDz9Vzvp9KVqbBQ4Fw/xEyKw8Y2rPdMDKHJ/iIDsatoO5flj+FT5m
         9Chyp/JIda/K+Knb4aSsP27Efen7DaeZW9pguzTlAq1v2lF6oKxsAg6v+wxmSpgMeLmw
         3Bxg==
X-Forwarded-Encrypted: i=1; AJvYcCXlc4c0sH4n1MYgRMcheGa4m+a2mIZpjwMTT0aCVkuIW4Md3Cg0Vg9wovFdiMJGFMGV9rgM4aXwJKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCbHOSUuEAuS5QnW2H/blHngKXm8Etzfr+wsg0BQp4kZwuKXIC
	wMWkCOfulfdvY9JfCxH5fJIoQulnGxvPZ/0JtmYhIfqcpsCTm0xsa5MTqf9bsi3slgr2+OSKLx0
	dVmSJZ6hxapujhsQcskxnyfsbhj9W4o4Vybag/kiOLg==
X-Gm-Gg: ASbGncuteJ80VUWI+zA+K2pmCTtukdmI0lT9x48q5nrO3qNIvbph4awOCZZGs4umlSc
	7AjQm1D7eCPWxc0e9uHR7Q+mVzmibUDLlwAPxsLQN6HrnLHeaet5CmUXYW19CYM036H2nKhC25B
	b/Pv+zPYLHZA3WpFHraUoptYTbiTbkuItR2MMS+ggZDBwXh7nWxPmbmwMhuaLo9VspHAmPIbBO4
	L5Lu3ODnvX26Ds+w4jlHDr4l1PNfZ1iHjpUwG4Gpg==
X-Google-Smtp-Source: AGHT+IED4DPQdBK7ONm26OmCpKVlBffbLSUSkcJilcgE42YRs0GaEMyY5HjOGbcIqDd1U1OSOTWygdg0r2hHPeNy8JI=
X-Received: by 2002:a53:ac49:0:b0:63c:e72f:d354 with SMTP id
 956f58d0204a3-63ce72fd63cmr12424599d50.22.1760446788372; Tue, 14 Oct 2025
 05:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250729111226.3627499-1-armbru@redhat.com> <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 13:59:34 +0100
X-Gm-Features: AS18NWAkDU_I2OBOHorXRS1aTrsOfZLJKRYRT_z0zRWC_KiBP47Dd1fp0k_Ow-I
Message-ID: <CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org, 
	qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 09:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > xenfb_mouse_event() has a switch statement whose controlling
> > expression move->axis is an enum InputAxis.  The enum values are
> > INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> > case for both axes.  In addition, it has an unreachable default label.
> > This convinces Coverity that move->axis can be greater than 1.  It
> > duly reports a buffer overrun when it is used to subscript an array
> > with two elements.
>
> I think also that Coverity gets confused by QAPI's convention
> in generated code of defining enumerations like this:
>
> typedef enum InputAxis {
>     INPUT_AXIS_X,
>     INPUT_AXIS_Y,
>     INPUT_AXIS__MAX,
> } InputAxis;
>
> Coverity thinks that INPUT_AXIS__MAX might be a valid
> value it can see in move->axis, because we defined the
> enum that way.
>
> In theory I suppose that since the __MAX value is only
> there to be an array or enumeration bound that we could
> emit code that #defines it rather than making it part
> of the enum.

Also, there's an argument that this function should
ignore unknown input-axis enum values. If we ever in future
extend this to support a Z-axis, it would be better to
ignore the events we can't send, the same way we already
do for unknown INPUT_EVENT_KIND_BTN button types, rather
than aborting. But it's not very important, so the
g_assert_not_reached() will do.

(In some other languages, we'd get a compile failure for
adding a new value to the enum that we didn't handle.
But not in C :-))

thanks
-- PMM

