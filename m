Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93459D27B0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840107.1255896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOwb-00079c-40; Tue, 19 Nov 2024 14:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840107.1255896; Tue, 19 Nov 2024 14:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOwb-00077N-1O; Tue, 19 Nov 2024 14:11:05 +0000
Received: by outflank-mailman (input) for mailman id 840107;
 Tue, 19 Nov 2024 14:11:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDOwZ-00072S-8C
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:11:03 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a6db899-a680-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:11:00 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso158854966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:11:00 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08aa47sm651311566b.196.2024.11.19.06.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:10:59 -0800 (PST)
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
X-Inumbo-ID: 1a6db899-a680-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFhNmRiODk5LWE2ODAtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI1NDYwLjY1NjEzMywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732025459; x=1732630259; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dbj4393xKiLG65NLJpzLD53XB3seZWf6XOINGDnrcfI=;
        b=gD025HB34xVkv0pR/Yl3SyfyUJOPf8KP6bvryUWKyJnjHTKA4MZy2tzhT4A7QltJ/E
         JDfgfG2gQ2sKYO+a82OMFu2fItHjOSBFEqAkxqC5JAax3gCBmmRqNOgWMx0GAijTi5Ih
         58iq8wIsRS6mH3HyD6E66z6TB0EYGeimYHC5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025459; x=1732630259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dbj4393xKiLG65NLJpzLD53XB3seZWf6XOINGDnrcfI=;
        b=sZDPpQRTYhSCBm/1Ov78sMN8+f/xVVPEM1EQRlAqjAxTrbDDFluEDhNJpmidYRV7VG
         6B0epGivqfDlDS42Jku93k1xeLn8QNQJ/DOeYZxZ80/rbBDbLY6kh0OF7dQ9o4VRmriw
         Hv7Y7VDvfN27DpN96ht/BtXZbURt+0nwhS8QgsvDwMSeRjXbixvNqJrLZR+42Jzm+XO1
         pC7ZWeP+TE2mYSODrMrfZTVA5eN1ivxDnXhEIBjx2DWafdPQBF5ECxcrww0EcC2Jyuny
         Rl+rEfxjIf+5JEwhJqLjo96h2emSr8ZvV9WXT1cOL9h2oW1exwSafVrY6KNqKjsF/zkb
         MN8A==
X-Gm-Message-State: AOJu0YwYK/LABXn3qAkhoENCd0xf+5v4AyhxoSQGRFtcVvevBtAFtvHb
	X9pybgZ7F0OUlLLNDJgMbAkQeynce/J1IaashRWkcZbIJEwuTfaUEFzbuvUa5BY=
X-Google-Smtp-Source: AGHT+IHoG6lgJycu3VukC+EgoMh//2KsLMuw8P3eGpELcMSY2fNvjG3kqTCXZ8fTbRjnUNHfJj0v8w==
X-Received: by 2002:a17:907:a43:b0:aa1:f73b:be3d with SMTP id a640c23a62f3a-aa48347e853mr1462196166b.27.1732025459557;
        Tue, 19 Nov 2024 06:10:59 -0800 (PST)
Date: Tue, 19 Nov 2024 15:10:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x8&/mm: fix IS_LnE_ALIGNED() to comply with Misra
 Rule 20.7
Message-ID: <ZzyccgtimsbbFMHH@macbook>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-2-roger.pau@citrix.com>
 <CACHz=Zg20Sxw_HY6EwXYvhcm=3ZjPwUH7vbdsZtSCU+2_TU7Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=Zg20Sxw_HY6EwXYvhcm=3ZjPwUH7vbdsZtSCU+2_TU7Kw@mail.gmail.com>

On Tue, Nov 19, 2024 at 10:52:26AM +0000, Frediano Ziglio wrote:
> On Tue, Nov 19, 2024 at 10:35 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > While not strictly needed to guarantee operator precedence is as expected, add
> > the parentheses to comply with Misra Rule 20.7.
> >
> > No functional change intended.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Fixes: 5b52e1b0436f ('x86/mm: skip super-page alignment checks for non-present entries')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/mm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 494c14e80ff9..fa21903eb25a 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5498,7 +5498,7 @@ int map_pages_to_xen(
> >   * be INVALID_MFN, since alignment is only relevant for present entries.
> >   */
> >  #define IS_LnE_ALIGNED(v, m, n) ({                              \
> > -    mfn_t m_ = m;                                               \
> > +    mfn_t m_ = (m);                                             \
> >                                                                  \
> >      ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
> >      IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
> 
> Minor, typo in subject: x8& -> x86

Nice, that's what you get when you press shift + 6 on a Spanish
keyboard.  Hope it can be adjusted at commit.

Thanks.

