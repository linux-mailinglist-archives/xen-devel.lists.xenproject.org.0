Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432E1A3C79
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 00:39:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMfpA-0004in-B2; Thu, 09 Apr 2020 22:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JlmV=5Z=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jMfp9-0004ii-94
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 22:39:03 +0000
X-Inumbo-ID: e9188686-7ab2-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9188686-7ab2-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 22:39:02 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z65so274551ede.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 15:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=60WcPQqUKk5AonSBYJ/LZClYE6Z1dNBYiPXvDTlvKqw=;
 b=UoRYI0Tf18hLHyQMKeWgULSqdr/G1PruNHXO5x1BNo6x/yv8KDg19NWgE1XjcjprWY
 TU3jnmX2TbdgPNwHqk50qRwTxMgav6e7zHjUctshzzqaUGuALqTa1BrQDTAaHjfU3er6
 OFmYGLsGTpiNu+KKeDRqzxZvYbdXpdjAuZ9VfKb43psUoXOm0zic9glLrjMwyw25DVjf
 GTNASi7CJ0NM/+u5VRuEmkD6J4rZrpoFxjrduob4kD5aK1J25Aou1ehFTBufPyqFhXcf
 1mJ2SW3Re856svOHGFZeQmSltDuBmoQXu0JVOD5F8wVdMisnd0YZe8m8Xtv8saHYiLyr
 En1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=60WcPQqUKk5AonSBYJ/LZClYE6Z1dNBYiPXvDTlvKqw=;
 b=GvsykP6u9Wv9hfdOAeOYUx3K2vV/UlSQsZBhSi7Wz8NNE6SaXXh/CHpndBJwSjbpKN
 XMC0RZvLDB3Ore+VBxm867qTSqSXPf+RVpYRB6SHG3LlL3bFwUl3HFz91cc0JzDYmWiG
 fGXw1aVjFphmBcCkTcccjizWw/JH2VyTwcwfwt2Hm9+y9FndPyCibe5qypPRR7bipWS4
 e/O2AUH01SL8wPgC25ynvuGaOW1/wAvRVbcRm8FYAVChmpPg9aCh6c+Mf35xr9fsA5l1
 33I1W4+Ognbw8oXS1VfWT/Mhe1bUCPrpupSQN1UhpiDUIVmm6LDJdbS7Hno1reDpeplS
 IfNg==
X-Gm-Message-State: AGi0PuamBQcbHAaPbw47aTD5R5JgbLyKfgU+xUZbmUFAdU9RSE/aWjFG
 2nw1cJqEsa7ZNOkxA7F6ECKF623TYxA=
X-Google-Smtp-Source: APiQypKzdvfnikVVLuCRZPSVRxYwd0oTG7ud8TEHpOdm+rdwg2ZkWvTIijt6KC91oOnqLifJXCKGRw==
X-Received: by 2002:aa7:d513:: with SMTP id y19mr2287973edq.362.1586471941627; 
 Thu, 09 Apr 2020 15:39:01 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id ga1sm2561ejb.65.2020.04.09.15.39.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 15:39:00 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id f13so48399wrm.13
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 15:39:00 -0700 (PDT)
X-Received: by 2002:adf:f98b:: with SMTP id f11mr1332170wrr.259.1586471940001; 
 Thu, 09 Apr 2020 15:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200409204837.7017-1-andrew.cooper3@citrix.com>
 <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
 <769887ee-c381-ff58-bdf9-bd1a3032cbfb@citrix.com>
In-Reply-To: <769887ee-c381-ff58-bdf9-bd1a3032cbfb@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Apr 2020 16:38:24 -0600
X-Gmail-Original-Message-ID: <CABfawh=UPcyHRgNvsA8wNwV798e3RL_FhSF6ZrOrx89up4w+fQ@mail.gmail.com>
Message-ID: <CABfawh=UPcyHRgNvsA8wNwV798e3RL_FhSF6ZrOrx89up4w+fQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: Fix build folloing VM Fork work
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 9, 2020 at 4:05 PM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> On 09/04/2020 22:24, Tamas K Lengyel wrote:
> > On Thu, Apr 9, 2020 at 2:48 PM Andrew Cooper <andrew.cooper3@citrix.com=
> wrote:
> >> A default build fails with:
> >>
> >>   mem_sharing.c: In function =E2=80=98copy_special_pages=E2=80=99:
> >>   mem_sharing.c:1649:9: error: =E2=80=98HVM_PARAM_STORE_PFN=E2=80=99 u=
ndeclared (first use in this function)
> >>            HVM_PARAM_STORE_PFN,
> >>            ^~~~~~~~~~~~~~~~~~~
> >>
> >> I suspect this is a rebasing issue with respect to c/s 12f0c69f2709 "x=
86/HVM:
> >> reduce hvm.h include dependencies".
> >>
> >> Fixes: 41548c5472a "mem_sharing: VM forking"
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > So staging definitely compiles for me both with and without
> > CONFIG_MEM_SHARING enabled. By default its off, so this shouldn't even
> > be compiled so I'm curious what's happening in your build. That said,
> > I have no objection to the extra include if it turns out to be
> > actually necessary.
>
> Exact config attached.  I've just double checked that staging fails.
>
> We should get  to the bottom of exactly what is going on here, if it
> isn't the obvious thing.

Strange, with your config it does produce the error. With "echo
CONFIG_MEM_SHARING=3Dy > .config && XEN_CONFIG_EXPERT=3Dy make
olddefconfig && make" it does compile.

Tamas

