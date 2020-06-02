Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A371EBC19
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6PF-0002G9-I4; Tue, 02 Jun 2020 12:52:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg6PE-0002G4-2a
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:52:36 +0000
X-Inumbo-ID: ee1bb83c-a4cf-11ea-81bc-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee1bb83c-a4cf-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 12:52:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g9so9959276edw.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SC2aYUuLkEh9YWcBjGQ8OFPka9a6woGYTDWf4xa8Aos=;
 b=NDKDMWTzXVb+QLnEiV03jjuFO19cpEZjFHMvpoJoWQ5lb1vAUJrQ9KrBEQ3fF6j0EM
 68rBAfP4WWHnye3+dSXf2iVuNikXqrttD2HWFJuLSBHAkREcoaLR148hHdaNAF8M6qpI
 5fcuiPUMHH7RRWPYcmWgwyqV4+K4UFPwpUlP1IElgIdje9YcDsL+5jw1jQfthxIl4yzO
 RJtqmn28FlD3cgE9UiX2fIMH/dYNZo2pbOJBpermjznuFF5v3GFUEpXdLd6KL9HfXK0f
 3XK4Ky3lMdc40YTjKiRnlmQDVBebtN+uhEhEzYSkZES7iQW574qECfPcGGwZRWThmxbr
 mgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SC2aYUuLkEh9YWcBjGQ8OFPka9a6woGYTDWf4xa8Aos=;
 b=NH++/TXZcPN99cx4HJiF6zOOMBVeIHrlz7t3l24/cUCBtxfZqVOvyhEPXnPVMc6sip
 ND+Ie/4eU3B6LSJc/eE01Xecx+oRcdBRR4lnyFkduhUD3da8g6K71aTxKuM6bBV7wWOW
 EHxaj4XOO+6VdIRtf40yXJ2NkROrIxMm8EaA7OertwfT3wk+Du0RXyvFCx1K0a9iekq/
 bFuDgI8mWCVchwSWt/hAR7syoYqTxUIdXO1nRXyPg5u7lc9JXfaBPMrJEhf9JGhWzvbw
 yUFNxOB6HRSrYpinqoHzP8rEF/gLbBT4yJtYOqTuyyQhW+TY6Imj/hK7/dgnwoAjTkWe
 SOuQ==
X-Gm-Message-State: AOAM530QuQpULcu/z8nJ9TAljnjEHBV88nwo+eX+XINwCXyow0lRlXhR
 9PhzrZvLj1n3iBluHSEkFpJE/RbWBps=
X-Google-Smtp-Source: ABdhPJxPOEs0bMsATGINlVeTV4UxcXrqAwa0MbZkd9C9KoK0ZhE558y56dYsOsjBhaBTdECo4FrKgA==
X-Received: by 2002:a50:9b13:: with SMTP id o19mr21068354edi.143.1591102354147; 
 Tue, 02 Jun 2020 05:52:34 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id d6sm1549054edn.75.2020.06.02.05.52.33
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 05:52:33 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id q11so3313679wrp.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:52:33 -0700 (PDT)
X-Received: by 2002:a5d:490f:: with SMTP id x15mr26040237wrq.259.1591102353002; 
 Tue, 02 Jun 2020 05:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
 <a9256e7a-b11f-cd45-7d8c-a72cfca4ddab@suse.com>
In-Reply-To: <a9256e7a-b11f-cd45-7d8c-a72cfca4ddab@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Jun 2020 06:51:56 -0600
X-Gmail-Original-Message-ID: <CABfawhkneOTsVE3nD41_F3u3Jihf8kk8N9eFHMP9znGUnugvsw@mail.gmail.com>
Message-ID: <CABfawhkneOTsVE3nD41_F3u3Jihf8kk8N9eFHMP9znGUnugvsw@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 2, 2020 at 6:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 02.06.2020 14:40, Tamas K Lengyel wrote:
> > On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
> >>
> >> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> >>> Extend the monitor_op domctl to include option that enables
> >>> controlling what values certain registers are permitted to hold
> >>> by a monitor subscriber.
> >>
> >> I think the change could benefit for some more detail commit message
> >> here. Why is this useful?
> >
> > You would have to ask the Bitdefender folks who made the feature. I
> > don't use it. Here we are just making it optional as it is buggy so it
> > is disabled by default.
>
> Now that's exactly the opposite of what I had derived from the
> description here so far. Perhaps an at least weak indication
> that you want to reword this. For example, from your reply to
> Roger I understand it's rather that the new flag allows to
> "suppress" the controlling (since presumably you don't change
> default behavior), rather then "enabling" it.

What we are adding is a domctl you need to call that enables this
feature. It's not an option to suppress it. It shouldn't have been
enabled by default to begin with. That was a mistake when the feature
was contributed and it is buggy.

>
> >> There already seems to be some support for gating MSR writes, which
> >> seems to be expanded by this commit?
> >
> > We don't expand on any existing features, we make an existing feature o=
ptional.
> >
> >>
> >> Is it solving some kind of bug reported?
> >
> > It does, please take a look at the cover letter.
>
> Please can such important aspects also go in the commit message,
> so they're available later without needing to hunt down mail
> threads (besides this way being more readily available to
> reviewers)?

Noted.

Thanks,
Tamas

