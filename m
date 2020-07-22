Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58891229E1A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 19:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyIJI-00077J-Ba; Wed, 22 Jul 2020 17:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j3fc=BB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jyIJG-00077D-It
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 17:13:38 +0000
X-Inumbo-ID: ae13d8aa-cc3e-11ea-8685-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae13d8aa-cc3e-11ea-8685-bc764e2007e4;
 Wed, 22 Jul 2020 17:13:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a15so2623637wrh.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2020 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=eg+DRkQhY0ItKbPuycTxg6YkUMHgHt0fn6xg39BAEdg=;
 b=twHzVk8LsIAqzCP51yaQay2ZF3NwICO14rM8fMa05PI7taXnbJrrhAAQ8f8xVN3SWZ
 fBMO81qnufz/sf9cnibiOqQvyFWICkTjJuTLqS7/Op3C35chJx31oCKjAKnVSDDFXrVP
 AvRx4VQ4L6mWEYKl42yQ3vPWwMEhM91UqCYeNVaOWbplHB89CBg6IIOlzEnLIzV7Q38R
 H8koxRI0QL0KFTsQ5uiB39/QOeljvtrR2ahR5BGE4hIOFNPD9UDOT/3iPG0rzaYl+cPd
 Bcd3lKq8aGlXPxLwtzdUDMp+iDY/Y8d2KJ/IqlIddL/9ph5eCTo3kUxYrgzEdJGyHB9/
 MgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=eg+DRkQhY0ItKbPuycTxg6YkUMHgHt0fn6xg39BAEdg=;
 b=CmjEb9pRpBTwJi+lYhOUkv6JV7fIiqMXyzuHxXYiOAf9i2xAczAAAFb3Kdg+qZnxCq
 IRcUeidw4veSwAiM0ej9MDmYolyPkgOgWf2dbTku1JXZ1FrSJXKLidj1aWPXGafCcpJG
 LbiFj8PEzr0b6Am/pzeVMNMzJROGdcWVUgE+jtOkHJujsCrMGe5ydnuv2FGM1NpBdYT1
 FNmjKSWVZdJ5Y0h3k67lpxXT6KWjUl/x8la8EkrfwytrLlpPnBPri1XqKfsP9CycARTx
 8GXCyQNvKacQ0x4bXa+k2epPST6TVOhsjmmeCMnswuVRKc7JoNc5VgscLGGQzdpy9MEl
 aJsQ==
X-Gm-Message-State: AOAM531k7HrSS8C/pqBUr4XfAIZNpHQLmRyKb4oMtMcuNAA1+sMhQBY4
 CqMEOIW8v0rvDEGLO+mGwdU=
X-Google-Smtp-Source: ABdhPJyo9Ri6+VWgzfq46t5H+Tepp7GSb7Xei9uTt5g6lqVRrivGj2BXAhtx06ogl23/JFjIA4PbuQ==
X-Received: by 2002:a5d:66c7:: with SMTP id k7mr492550wrw.290.1595438016438;
 Wed, 22 Jul 2020 10:13:36 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:5de9:cd31:71fa:3a6f])
 by smtp.gmail.com with ESMTPSA id g3sm718835wrb.59.2020.07.22.10.13.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 10:13:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200722165544.557-1-paul@xen.org>
 <7d608d35-e373-07bf-81a4-16f3a4ee03c1@xen.org>
In-Reply-To: <7d608d35-e373-07bf-81a4-16f3a4ee03c1@xen.org>
Subject: RE: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
Date: Wed, 22 Jul 2020 18:13:35 +0100
Message-ID: <001c01d6604b$6fa953b0$4efbfb10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFr5LSoFCjTNW2heY+JVDg0SR/0qQFrPA2nqd1ziGA=
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 22 July 2020 17:59
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
> 
> 
> 
> On 22/07/2020 17:55, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> > ---
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Wei Liu <wl@xen.org>
> >
> > Obviously this has my implicit Release-acked-by and is to be committed to
> > the staging-4.14 branch only.
> 
> I will commit it.

Thanks,

  Paul

> 
> > ---
> >   SUPPORT.md | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index efbcb26ddf..88a182ac31 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
> >
> >   # Release Support
> >
> > -    Xen-Version: 4.14-rc
> > -    Initial-Release: n/a
> > -    Supported-Until: TBD
> > -    Security-Support-Until: Unreleased - not yet security-supported
> > +    Xen-Version: 4.14
> > +    Initial-Release: 2020-07-24
> > +    Supported-Until: 2022-01-24
> > +    Security-Support-Until: 2023-07-24
> >
> >   Release Notes
> >   : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.14_Release_Notes">RN</a>
> >
> 
> --
> Julien Grall


