Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C361F7680
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 12:10:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjgdz-00010D-VZ; Fri, 12 Jun 2020 10:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5ow=7Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjgdy-000104-OV
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 10:10:38 +0000
X-Inumbo-ID: f664d1b4-ac94-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f664d1b4-ac94-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 10:10:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r9so7578482wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=t3lcbxAFLUSZI9BwS8SsjPDTYt7d8BC6LqD5PrNEVso=;
 b=rHYFFfX59ZTaT3UEnFV8TzuaU6du9pRXlvRvHJ0VYHZ93T+6RH1PF3izA7/Kx+iQL9
 X0Se9dDRa5qC1UKObsXKRg+0l0tSST0wjd3KbZ0OjuBva3mHPD95RRNE+3jYwpudfAdB
 jBfxfT3fc2vt3T7ZalwGEz5b0rmB57zLYP+FLoS35rWMRY3imrHBzYEktzv+wJIAi+r1
 Acn1E1oryRvdNalEw0fitfUiOZLvHj8xeKvM9SInbtXaK19eici2Nr72cmfmKeCC4kVo
 /ms9TEOVsRrvhd2WEgkY329O6Cfcop/gTB4w499t1/MFN/7AsyRWAMwpBea2Y96/bqMZ
 0v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=t3lcbxAFLUSZI9BwS8SsjPDTYt7d8BC6LqD5PrNEVso=;
 b=K6S13t0hoFRD1SSg9Krc52biA95dbAYGQt2Am4LN8c68sRhaTbqRE0I8a5Yo9BRA9e
 c0ztV0iXdHOnwOpSG2JlkncFUuXitP0pO32Sf67hKmeaLtVlnEs3Y14jTW0YWxo06jf6
 MDgYce58xDsn5I4DGhHV3d9vkvxnp68X24g5JeSD5oa5yKT+y1jznbtBP9L14rW8Onv4
 vsfObJZfRTdml9k8d31/ApO6yM8wRIK+09akZsgbpJEbHzlVG1XlkEunvKfD5jQg3Pkc
 6QqZBGR1SP3ANkC6D83oNzH769v/UAppasT8kM+06TIwT9qbM00maZVBmxr8i0KqL5NE
 KNjw==
X-Gm-Message-State: AOAM5328rDMZqk+lplxtHJxXYUBHe1FHLoS7dqOEd+BexGqfhEHo1YPZ
 aFfDT25XYJKv/e8QrSyL9Ig=
X-Google-Smtp-Source: ABdhPJxZ3WuvGOa1DT4kCElPLbF+A+CUaIqC8Nj/2wvnDcFwiPKHqqNwmTcOT/5RYJvg9Xf4OVE+Ig==
X-Received: by 2002:a1c:66d5:: with SMTP id
 a204mr12358608wmc.134.1591956637415; 
 Fri, 12 Jun 2020 03:10:37 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id j4sm8975895wma.7.2020.06.12.03.10.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 03:10:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Bertrand Marquis'" <Bertrand.Marquis@arm.com>
References: <c945e231995ac708bf7b7e3d6ec82e08d4a42bf6.1591806680.git.bertrand.marquis@arm.com>
 <5cf46b52-6a57-3e11-67a0-28f841865c1e@citrix.com>
 <7DA75B75-725F-40CC-9DDE-5727452309A0@arm.com>
 <f8f3b858-6fd3-4766-b2c1-30010b664f01@citrix.com>
In-Reply-To: <f8f3b858-6fd3-4766-b2c1-30010b664f01@citrix.com>
Subject: RE: [PATCH] x86/boot: use BASEDIR for include path
Date: Fri, 12 Jun 2020 11:10:35 +0100
Message-ID: <000201d640a1$b7a2cb20$26e86160$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGjyn0thtHg83Swx4SMZrQD/sC/UQMS4ommAZ2dNBwCLHawgKkCxolQ
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>, 'nd' <nd@arm.com>,
 'Wei Liu' <wl@xen.org>, 'Jan Beulich' <jbeulich@suse.com>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 11 June 2020 18:28
> To: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Cc: xen-devel <xen-devel@lists.xenproject.org>; nd <nd@arm.com>; Jan =
Beulich <jbeulich@suse.com>; Wei
> Liu <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Paul =
Durrant <paul@xen.org>
> Subject: Re: [PATCH] x86/boot: use BASEDIR for include path
>=20
> On 11/06/2020 17:50, Bertrand Marquis wrote:
> > Hi Andrew,
> >
> >> On 11 Jun 2020, at 17:24, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
> >>
> >> On 11/06/2020 12:54, Bertrand Marquis wrote:
> >>> Use $(BASEDIR)/include instead of $(XEN_ROOT)/xen/include for the
> >>> include path to be coherent with the rest of the Makefiles.
> >>>
> >>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> Does something subtle break before this change?
> > Without changing anything no.
> > But if xen sub-directory is renamed yes.
> >
> > As there is no easy way to build xen hypervisor out of tree (I might =
be wrong here !) I found a
> solution using cp -rs from xen subdir in a xen-build1 xen-build2 etc =
this way I can check build for
> x86 and arm without cleaning.
> >
> > Without the patch, the sources are actually compiles with an include =
path containing xen/../xen as a
> result of using XEN_ROOT which does not allow to rename xen =
subdirectory.
> > As it was the only place in which XEN_ROOT was used for include =
paths, this is normalising the
> paths.
>=20
> Ok.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC Paul for 4.14.

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> ~Andrew


