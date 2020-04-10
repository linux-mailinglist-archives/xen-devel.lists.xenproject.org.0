Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AF1A3E23
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 04:20:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMjGs-0001Br-Bk; Fri, 10 Apr 2020 02:19:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TlO0=52=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jMjGq-0001Bm-Tn
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 02:19:53 +0000
X-Inumbo-ID: c26be518-7ad1-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c26be518-7ad1-11ea-83d8-bc764e2007e4;
 Fri, 10 Apr 2020 02:19:52 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x62so781051ede.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 19:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PpPT7lPl20frKGDc10gigFzLYju/84WLlJyhaR5CkVI=;
 b=xnPWxXf4KPbFcCK10glq5HWbhBlhup8tz3s+iUvtnbLIvImgb+Cl4YM5rjnagjh0w+
 IlAWGNi1onf64o9GnGWlJTq/4/XcYxAnfrmuFqBMDq9GLdhQo1VihwqknayUuzxBc+JG
 x205MjvQz81MWywJLh+s3aK2GQPyXuRQBxRWbGGCKiE9ZAjYdrXMBvyJs/RTZ3qYdMy9
 7XQy8/foMFZtlL4ENIlXtzNd2ygOZ2kVShxKQFDpqrNCx1v3gmzmbCtnkhgGuPSYhrBi
 ob9tzB+bs+DIGqYKemr0tVckpBISUDYSdo6eWXQtgt+xYaY3MDt1SunwOlA/Ni3K7IQ3
 /j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PpPT7lPl20frKGDc10gigFzLYju/84WLlJyhaR5CkVI=;
 b=KWqq9AVeSxsRysgZHkPoV6wn2OiMOhg07y1UsTxHD3tx/m0AFIXnqofECqauDt4PbS
 9zKlZ4Ew/cuuLI/f9OBlz+OcHgpDsXCzI07l9EokeOEZ+8E74FZGRYO5d9hdGV11OMJF
 ljjAX+6el/mTXbufsLnq6+Mmqyi0mm/3em1OWbVfQy6oKzncKfeGkWq0FcLmDA/wU9VK
 go9rZhaKzsZx+wLYtXP790wj/hjgboW3yI7K/csGPkb8fCWPELg5wSHs2xHGiO7Ev4MY
 IRLQx1k5u/wvfsCXNwBAdxUcORnBlHAfhxXM6tz9cMyXQBn9m+h+P0/NDnXhVMrUyjR6
 ySZw==
X-Gm-Message-State: AGi0PuabqMujNlYAStBcnRlqV35mvL31fH84ZTb6r+CRSl+Xr5hIfrSa
 LeOOCkq7tLKV/daN1W5lQrH/hU/wDJA=
X-Google-Smtp-Source: APiQypKPaprPFUJs5TSkDLeUyuvSoR45P6vfAcuftpOpBNuctrK8pLYOdSWZl4holExL6tgPKjv1dw==
X-Received: by 2002:a17:906:4004:: with SMTP id
 v4mr1812633ejj.265.1586485190729; 
 Thu, 09 Apr 2020 19:19:50 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id w3sm27638ejf.21.2020.04.09.19.19.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 19:19:50 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id j2so695635wrs.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 19:19:49 -0700 (PDT)
X-Received: by 2002:adf:eac1:: with SMTP id o1mr2274313wrn.182.1586485189257; 
 Thu, 09 Apr 2020 19:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200409204837.7017-1-andrew.cooper3@citrix.com>
 <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
 <769887ee-c381-ff58-bdf9-bd1a3032cbfb@citrix.com>
 <CABfawh=UPcyHRgNvsA8wNwV798e3RL_FhSF6ZrOrx89up4w+fQ@mail.gmail.com>
 <a89b2a51-8c54-4a35-4f77-e31018936534@citrix.com>
 <CABfawhm4Tdcp7QWqOyUXb_7Ag9yuQ93E3knH6joG4TDyXbgufA@mail.gmail.com>
 <be90b42c-5e7b-fda3-9c57-29cea0dc66d5@citrix.com>
In-Reply-To: <be90b42c-5e7b-fda3-9c57-29cea0dc66d5@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Apr 2020 20:19:12 -0600
X-Gmail-Original-Message-ID: <CABfawhnayMsu8QV-_fcn4GGpURW0=4txNKKTFUpBBkUOC8knYg@mail.gmail.com>
Message-ID: <CABfawhnayMsu8QV-_fcn4GGpURW0=4txNKKTFUpBBkUOC8knYg@mail.gmail.com>
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

On Thu, Apr 9, 2020 at 6:58 PM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> On 10/04/2020 00:23, Tamas K Lengyel wrote:
> > On Thu, Apr 9, 2020 at 5:00 PM Andrew Cooper <andrew.cooper3@citrix.com=
> wrote:
> >> On 09/04/2020 23:38, Tamas K Lengyel wrote:
> >>> On Thu, Apr 9, 2020 at 4:05 PM Andrew Cooper <andrew.cooper3@citrix.c=
om> wrote:
> >>>> On 09/04/2020 22:24, Tamas K Lengyel wrote:
> >>>>> On Thu, Apr 9, 2020 at 2:48 PM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
> >>>>>> A default build fails with:
> >>>>>>
> >>>>>>   mem_sharing.c: In function =E2=80=98copy_special_pages=E2=80=99:
> >>>>>>   mem_sharing.c:1649:9: error: =E2=80=98HVM_PARAM_STORE_PFN=E2=80=
=99 undeclared (first use in this function)
> >>>>>>            HVM_PARAM_STORE_PFN,
> >>>>>>            ^~~~~~~~~~~~~~~~~~~
> >>>>>>
> >>>>>> I suspect this is a rebasing issue with respect to c/s 12f0c69f270=
9 "x86/HVM:
> >>>>>> reduce hvm.h include dependencies".
> >>>>>>
> >>>>>> Fixes: 41548c5472a "mem_sharing: VM forking"
> >>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>> So staging definitely compiles for me both with and without
> >>>>> CONFIG_MEM_SHARING enabled. By default its off, so this shouldn't e=
ven
> >>>>> be compiled so I'm curious what's happening in your build. That sai=
d,
> >>>>> I have no objection to the extra include if it turns out to be
> >>>>> actually necessary.
> >>>> Exact config attached.  I've just double checked that staging fails.
> >>>>
> >>>> We should get  to the bottom of exactly what is going on here, if it
> >>>> isn't the obvious thing.
> >>> Strange, with your config it does produce the error. With "echo
> >>> CONFIG_MEM_SHARING=3Dy > .config && XEN_CONFIG_EXPERT=3Dy make
> >>> olddefconfig && make" it does compile.
> >> You lose XEN_CONFIG_EXPERT=3Dy in the second make, so it rewrites your
> >> .config behind your back.  (This behaviour is totally obnoxious).
> > I also compiled with export XEN_CONFIG_EXPERT=3Dy and it compiles fine.
> >
> >> Diff the current config against original?
> > drt@t0:~/workspace/xen/xen$ diff .config .config-debug
> > 6c6
> > < CONFIG_GCC_VERSION=3D80300
> > ---
> >> CONFIG_GCC_VERSION=3D60300
>
> ;-(
>
> I occasionally forget that `diff` defaults to unreadable.
>
> >> # CONFIG_XEN_ALIGN_DEFAULT is not set
> >> CONFIG_XEN_ALIGN_2M=3Dy
> >> CONFIG_GUEST=3Dy
> >> CONFIG_XEN_GUEST=3Dy
> >> CONFIG_PVH_GUEST=3Dy
> >> CONFIG_PV_SHIM=3Dy
> >> # CONFIG_PV_SHIM_EXCLUSIVE is not set
> >> CONFIG_HYPERV_GUEST=3Dy
> > 61,62c65,74
> > < # CONFIG_XSM is not set
>
> With XSM compiled out, xsm/dummy.h is used, and has to include
> public/hvm/params.h to get XEN_ALTP2M_* for xsm_hvm_altp2mhvm_op(), and
> this bleeds through into everything which includes xsm/xsm.h, which is
> basically everything.
>
> Are you happy for me to fix up the commit message to this effect,
> replacing the previous guesswork?

Of course. Thanks for deciphering this.

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

