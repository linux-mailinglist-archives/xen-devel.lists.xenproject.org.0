Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133ED1A3CD2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 01:25:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMgX2-0000P7-M7; Thu, 09 Apr 2020 23:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JlmV=5Z=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jMgX1-0000P1-31
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 23:24:23 +0000
X-Inumbo-ID: 3e0556b4-7ab9-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e0556b4-7ab9-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 23:24:22 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e5so343718edq.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QycfvTbWwW+iyuTJiBcOd+/nNNukvsofmFoMp8DmCFM=;
 b=Otuws/WKNqIWqTFbH9wqGyasiqtmVSMuqr/6RD3+k8lLRDztA1BIpCnoIvmuSHsOZi
 eNyx3BXC40686Na69d/xb7Z7kHnbhhf8eBOcHl1ytJvpx5huvbYaLOhDWLKx+lH6pWrB
 gaNVEA1w+JQUJF5gX++1PkUVrxAQZEmNr04ILjeFsU9jLYSmx/os9uEK0H0b6M0XHtSM
 uxECtJzuAh+Aeb6jSFcMnbah2iNbGZWn1wzTCQg8cT47RlfXdZpEGnX5TZHV6yxyNePc
 lJemlMvZmtO82eb/OayBnSiOPyE+4VXqZa41mrEpaHPlSI0TQeXAGRLuiVylsjp5Mm1A
 5dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QycfvTbWwW+iyuTJiBcOd+/nNNukvsofmFoMp8DmCFM=;
 b=ZNx/Mu1b+lZlcJHUxI5FJfSDP4RFAWJioD+CGMx184npqNUS+195VTAShVt4yZKKiF
 O0wecPa0ROJHXX4NkJmtxcb12zUXJu9UfU8u+BiYoTGhOaH4d2Jr8YxMy8dK2C0myVxV
 oZV/FHWfklsVhJ1gRi0H6PzM8puawnYhKP2Mh4hDE/eTRZuOLpTP73Ad88zVphIbI8EZ
 ELPX7wS0nFv4Zz4+5nU+f6u3PqJl9WsdM19nBXr4RQh292uxzYXk4ZeRc3gX6xNtJP6o
 zSKgYmThBbA9M7C9KKekEFjFJNLm5B832g5tXbJvyRKFFN6VoaIlHTKGhj4mNYLb0JF5
 qEUw==
X-Gm-Message-State: AGi0PubojACfGe1RHGFyPVgdmjcDWVG+ZJhan0KaEx8LfxFU3uzCeCA6
 +UYfqWsSsaEo4nQ9s3xJAkJ2Z3ONdmg=
X-Google-Smtp-Source: APiQypJRCpBE2KvBpWQ2C/2YOtFadVR2u55caWtz9xhiPKB2RviaWQf2k7Tm6VBmQFfA1inaG+U8hw==
X-Received: by 2002:a17:906:d1c3:: with SMTP id
 bs3mr1348687ejb.334.1586474660560; 
 Thu, 09 Apr 2020 16:24:20 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id n62sm26355edc.74.2020.04.09.16.24.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 16:24:20 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id h9so239487wrc.8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 16:24:19 -0700 (PDT)
X-Received: by 2002:adf:eac1:: with SMTP id o1mr1663352wrn.182.1586474659175; 
 Thu, 09 Apr 2020 16:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200409204837.7017-1-andrew.cooper3@citrix.com>
 <CABfawhnhfTScVDRxezP3qRarBczCPs2EVmLZMnN-FMpxyWN8XQ@mail.gmail.com>
 <769887ee-c381-ff58-bdf9-bd1a3032cbfb@citrix.com>
 <CABfawh=UPcyHRgNvsA8wNwV798e3RL_FhSF6ZrOrx89up4w+fQ@mail.gmail.com>
 <a89b2a51-8c54-4a35-4f77-e31018936534@citrix.com>
In-Reply-To: <a89b2a51-8c54-4a35-4f77-e31018936534@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Apr 2020 17:23:44 -0600
X-Gmail-Original-Message-ID: <CABfawhm4Tdcp7QWqOyUXb_7Ag9yuQ93E3knH6joG4TDyXbgufA@mail.gmail.com>
Message-ID: <CABfawhm4Tdcp7QWqOyUXb_7Ag9yuQ93E3knH6joG4TDyXbgufA@mail.gmail.com>
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

On Thu, Apr 9, 2020 at 5:00 PM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> On 09/04/2020 23:38, Tamas K Lengyel wrote:
> > On Thu, Apr 9, 2020 at 4:05 PM Andrew Cooper <andrew.cooper3@citrix.com=
> wrote:
> >> On 09/04/2020 22:24, Tamas K Lengyel wrote:
> >>> On Thu, Apr 9, 2020 at 2:48 PM Andrew Cooper <andrew.cooper3@citrix.c=
om> wrote:
> >>>> A default build fails with:
> >>>>
> >>>>   mem_sharing.c: In function =E2=80=98copy_special_pages=E2=80=99:
> >>>>   mem_sharing.c:1649:9: error: =E2=80=98HVM_PARAM_STORE_PFN=E2=80=99=
 undeclared (first use in this function)
> >>>>            HVM_PARAM_STORE_PFN,
> >>>>            ^~~~~~~~~~~~~~~~~~~
> >>>>
> >>>> I suspect this is a rebasing issue with respect to c/s 12f0c69f2709 =
"x86/HVM:
> >>>> reduce hvm.h include dependencies".
> >>>>
> >>>> Fixes: 41548c5472a "mem_sharing: VM forking"
> >>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> So staging definitely compiles for me both with and without
> >>> CONFIG_MEM_SHARING enabled. By default its off, so this shouldn't eve=
n
> >>> be compiled so I'm curious what's happening in your build. That said,
> >>> I have no objection to the extra include if it turns out to be
> >>> actually necessary.
> >> Exact config attached.  I've just double checked that staging fails.
> >>
> >> We should get  to the bottom of exactly what is going on here, if it
> >> isn't the obvious thing.
> > Strange, with your config it does produce the error. With "echo
> > CONFIG_MEM_SHARING=3Dy > .config && XEN_CONFIG_EXPERT=3Dy make
> > olddefconfig && make" it does compile.
>
> You lose XEN_CONFIG_EXPERT=3Dy in the second make, so it rewrites your
> .config behind your back.  (This behaviour is totally obnoxious).

I also compiled with export XEN_CONFIG_EXPERT=3Dy and it compiles fine.

> Diff the current config against original?

drt@t0:~/workspace/xen/xen$ diff .config .config-debug
6c6
< CONFIG_GCC_VERSION=3D80300
---
> CONFIG_GCC_VERSION=3D60300
25,28c25,32
< CONFIG_XEN_ALIGN_DEFAULT=3Dy
< # CONFIG_XEN_ALIGN_2M is not set
< # CONFIG_XEN_GUEST is not set
< # CONFIG_HYPERV_GUEST is not set
---
> # CONFIG_XEN_ALIGN_DEFAULT is not set
> CONFIG_XEN_ALIGN_2M=3Dy
> CONFIG_GUEST=3Dy
> CONFIG_XEN_GUEST=3Dy
> CONFIG_PVH_GUEST=3Dy
> CONFIG_PV_SHIM=3Dy
> # CONFIG_PV_SHIM_EXCLUSIVE is not set
> CONFIG_HYPERV_GUEST=3Dy
61,62c65,74
< # CONFIG_XSM is not set
< # CONFIG_ARGO is not set
---
> CONFIG_XSM=3Dy
> CONFIG_XSM_FLASK=3Dy
> CONFIG_XSM_FLASK_AVC_STATS=3Dy
> CONFIG_XSM_FLASK_POLICY=3Dy
> CONFIG_XSM_SILO=3Dy
> # CONFIG_XSM_DUMMY_DEFAULT is not set
> # CONFIG_XSM_FLASK_DEFAULT is not set
> CONFIG_XSM_SILO_DEFAULT=3Dy
> # CONFIG_LATE_HWDOM is not set
> CONFIG_ARGO=3Dy
72,73c84,85
< # CONFIG_SCHED_CREDIT_DEFAULT is not set
< CONFIG_SCHED_CREDIT2_DEFAULT=3Dy
---
> CONFIG_SCHED_CREDIT_DEFAULT=3Dy
> # CONFIG_SCHED_CREDIT2_DEFAULT is not set
77c89
< CONFIG_SCHED_DEFAULT=3D"credit2"
---
> CONFIG_SCHED_DEFAULT=3D"credit"

Tamas

