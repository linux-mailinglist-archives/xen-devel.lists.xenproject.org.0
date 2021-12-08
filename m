Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6446C87B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 01:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241989.418622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mukTt-0003w5-Jg; Wed, 08 Dec 2021 00:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241989.418622; Wed, 08 Dec 2021 00:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mukTt-0003uI-Gb; Wed, 08 Dec 2021 00:06:45 +0000
Received: by outflank-mailman (input) for mailman id 241989;
 Wed, 08 Dec 2021 00:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aoc2=QZ=linaro.org=mathieu.poirier@srs-se1.protection.inumbo.net>)
 id 1mukTr-0003uC-60
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 00:06:43 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8a81809-57ba-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 01:06:41 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id g14so2333145edb.8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Dec 2021 16:06:41 -0800 (PST)
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
X-Inumbo-ID: b8a81809-57ba-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07gOr7vYtk1uVvLqelaTBUbdnkVX+qvyUroCmQe9uEs=;
        b=ybvJqGBCzbVa8iw9P4fxFYdhZ3f7pKBt6JOm+hC6q+FWHUqPOT9+rAOGTfMxV1g9L3
         O7+wZUIiIqxP5+4le4lAzdN1EgklwZ75EfUmT5oE4RuGs1e47TzoiKwkf3YWO340nzDd
         EDMCbiKI/AMHXg/GNqcELUj4Dr6Nfm03cILqxC/5h4rtBzbn5LEjVE52CokUEQ32iuDr
         U6newSjbJaFBaUPJTBKkvVd4SpwVjYL9l+llKH/Nqv6T826xGE7Bw6KUAwwhwMfs0TVQ
         XgBiLivJKyOMORt5Wr5wLpdtTx0uoS8sFWCZfAPV3FMlbZh/5wxB4ocYcztCeJ18wXFM
         B6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07gOr7vYtk1uVvLqelaTBUbdnkVX+qvyUroCmQe9uEs=;
        b=1Hxfefto4sACdecuhm4S92P1FBDE129Fm1G81Ld30++Ef2Iu25cniv/AjaN0s2k47+
         LCTwjxYzfAVwwb5UaPhyok+20/qinQRZoH/FKZ6pOK6dxmercHYY+XAtBZQbTSlLPPJe
         iBNL7JlTBt+7ys/KXxHlDTfWnpuGVPvRbFcLoyFo07AfKtKihvcY3avRa+/gI/LuAaUy
         RHCXk/dn/h7rAe3l8m8F9r4FNvttgmVa9It/XQB+ipMNnLNYBBeKYynIY4SaeyGQKY8N
         6kTq/MsjhXWSUE9JMAGW7j8MHRfxNU48RbZZ0qeoM/9UP4j1Na6ZsZsmLtcebqfzoDxz
         mM5Q==
X-Gm-Message-State: AOAM532eZPxWev+vNQY6re+ARURAiatrUOYMJDXgXcRLz99uHJGGh1L/
	D6LIfi5uJkhdzguUJnai8TEXFAsgKwdU7iP5trwzmiTYcARhdg==
X-Google-Smtp-Source: ABdhPJybNbjzgcHov9auSIHF38le4y3GFmWHye72mxcbHUi3IgaY/nCYUfVTS/ruque/3I7Tci9DO6Ao7g7cGOs2M9s=
X-Received: by 2002:a05:6402:3cd:: with SMTP id t13mr13992587edw.97.1638922001248;
 Tue, 07 Dec 2021 16:06:41 -0800 (PST)
MIME-Version: 1.0
References: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
In-Reply-To: <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 7 Dec 2021 17:06:30 -0700
Message-ID: <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
Subject: Re: Aarch64 stand-alone application for Xen
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>
> Hi Mathieu,
>
> > On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > Good day,
> >
> > I am in the process of adding support for aarch64 to the xen-sys
> > crate[1].  The crate currently supports x86_64 and includes a
> > stand-alone "oxerun" application that can be used to validate
> > hypercalls.  My goal is to provide the same functionality on arm64.  I
> > am looking for a stand-alone aarch64 example, something like an "hello
> > world" to help me with the assembler startup code.
>
> We are working on porting XTF to arm64 and already have something running.
> I think it could be a good starting point for you:
> https://github.com/orzelmichal/xtf/tree/arm-devel

Quick one - have you been able to get the "test-arm-64le-example"
application to run?  So far Xen gives me the following error:

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Unable to copy the kernel in the hwdom memory
(XEN) ****************************************

I wanted to check with you before starting to dig into it.

Thanks,
Mathieu

>
> Regards
> Bertrand
>
> >
> > Many thanks for the consideration,
> > Mathieu
> >
> > [1]. https://crates.io/crates/xen-sys
> >
>

