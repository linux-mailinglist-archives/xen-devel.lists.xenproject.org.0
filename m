Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C98A1DE390
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4OI-00085C-Ks; Fri, 22 May 2020 09:54:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPHd=7E=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jc4OG-000855-N1
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:54:56 +0000
X-Inumbo-ID: 4a41949a-9c12-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a41949a-9c12-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 09:54:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f5so980449wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=iaKsEP9YxVg/i27p2cuZ3z6rXXbvQ5bbumLMMOklFro=;
 b=b7p5QMd8vlzhHPIwg7bzdDLzc6HJSaOj7CiEhyPr8m4/fsogObBAdjkagqAFrKR332
 AU/mzPUBarTktfZPiybu/DKRxZk5DH4FuuRZWFAmmlJ85++xyxCH6/8PGuleZp49a62B
 jaBfdiy9uWGVMSUvXPOj+8aOn+8qIvCC+MZQ9COn79xsdWd0VA1YHgpkVs7wQzSoE9Jg
 kWqFKA4Wp+UyJWUuB4RX+v6ArEF0wa9sxR2sie9O+mtPfW9UZGVbWlmbybQUZsQGRd+Q
 OJR5In2fzlPAirlFKRoljO4r+Cnufj9jM1ASGI3iW1a32h1XaBxZExZJkwmDcd7GgSvw
 U4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=iaKsEP9YxVg/i27p2cuZ3z6rXXbvQ5bbumLMMOklFro=;
 b=iwJUGnUHoQcTE/hLliks0D9uoPAesudZgglHbHeIsbNgTYZ64+DiwXW2ZvgJSQFyUN
 Gn7Ubg/M2SeAzr5sSatP9qPOA3LU2ZvfZxscROfZO5PiaEOTiC7RhLa0nROcrQsB8dTk
 OYlSThAqAeQ59VM3IyxVEnEWuLaEl19MDnSMCY2t3ryaLEhnJS7Emh9oGoJLPWxcWuhh
 HV+f84eHzfJHQR2bL/xw1Yk3tfQqvLn8aPr1OR4PanWvHUgnHK2ylV2YxWCW6yV13mmV
 b7e+P0qKNDgwMpX2z0T3TpDXqCygt6pXGR06ahRYN5FhiDSV/LkdLKchSZd1vIchgrjN
 Y7+w==
X-Gm-Message-State: AOAM5332qd4FbVhXHHJB+e9Hcd4XQSIUvNFXm3bVYv6kzptQm/8f8y6M
 yX3OEhdiVu8mtzCbhiUDQ6o=
X-Google-Smtp-Source: ABdhPJyfNbwbyaOn7KKmyTfGxtoqbs9RWSOJEJW4kFlt7983av6rC9Xp8EuyhFqXBNVFaIGoZdEfqQ==
X-Received: by 2002:a1c:98cc:: with SMTP id a195mr5020506wme.32.1590141295432; 
 Fri, 22 May 2020 02:54:55 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id m7sm9206225wmc.40.2020.05.22.02.54.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 02:54:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <George.Dunlap@citrix.com>,
 "'Jason Andryuk'" <jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <4510049C-2AD1-4AE4-B0E5-F4231450EDB6@citrix.com>
In-Reply-To: <4510049C-2AD1-4AE4-B0E5-F4231450EDB6@citrix.com>
Subject: RE: [PATCH v7 00/19] Add support for qemu-xen runnning in a
 Linux-based stubdomain
Date: Fri, 22 May 2020 10:54:52 +0100
Message-ID: <001301d6301f$0b546cd0$21fd4670$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGuWQTXNTg7A7WCU27izkdscEVquQGwNvazqPYKEdA=
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <Andrew.Cooper3@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'Samuel Thibault' <samuel.thibault@ens-lyon.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
George Dunlap
> Sent: 22 May 2020 10:11
> To: Jason Andryuk <jandryuk@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall =
<julien@xen.org>; Samuel Thibault
> <samuel.thibault@ens-lyon.org>; Wei Liu <wl@xen.org>; Andrew Cooper =
<Andrew.Cooper3@citrix.com>; Jan
> Beulich <jbeulich@suse.com>; Ian Jackson <Ian.Jackson@citrix.com>; =
Anthony Perard
> <anthony.perard@citrix.com>; xen-devel =
<xen-devel@lists.xenproject.org>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>
> Subject: Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a =
Linux-based stubdomain
>=20
>=20
> > On May 19, 2020, at 2:54 AM, Jason Andryuk <jandryuk@gmail.com> =
wrote:
> >
> > General idea is to allow freely set device_model_version and
> > device_model_stubdomain_override and choose the right options based =
on this
> > choice.  Also, allow to specific path to stubdomain kernel/ramdisk, =
for greater
> > flexibility.
>=20
> Excited to see this patch series get in.  But I didn=E2=80=99t really =
notice any documents explaining how to
> actually use it =E2=80=94 is there a blog post anywhere describing how =
to get the kernel / initrd image and so
> on?
>=20
> Also, would it be possible to add a follow-up series which modifies =
SUPPORT.md and CHANGELOG.md?

Yes please. In future I think we should encourage the patch to =
CHANGELOG.md to be the last patch of a series such as this.

  Paul

>=20
> Thanks,
>  -George


