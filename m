Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538061EB86C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg3BN-0005xI-UU; Tue, 02 Jun 2020 09:26:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg3BM-0005xB-6a
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:26:04 +0000
X-Inumbo-ID: 140e2d80-a4b3-11ea-8993-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 140e2d80-a4b3-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 09:26:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r15so2355203wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ZEaYjWeN2XFm/ghGqVKRcX8WRVihSGkqtc6SPAjPdts=;
 b=k0ee3+EdMYA4r6L5EypuXiOL+KcbdedCZGbty3Bn2lCVnufGvkP7M5Ff5SnYysQ1xw
 FWL0bIIk+9b3d2doWhlyqSU9xTs9y+MOuZNFFSUVHvYI8dJi3Bw9Tx4rAdPEnOF0rl1L
 PQiq2w75CT0V0uJNUoHNkH2bCsdGsRibPg6JZBVt7tgp/o+kGM0TZWEXDrGmgBi94MJv
 xrPX1GCPXEQ+g/5WmcYnyNfJKSdEJJCI6ZqmERVv4W0VZnEn//7DYmLuRGFxxtqDs/0u
 4Y1XGN7sKD5QM/ATN9q8rePIeMokBPpvb5aHvdf5HkgAgVpTkjvPnIBtcKLWTbBHFtM5
 G8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ZEaYjWeN2XFm/ghGqVKRcX8WRVihSGkqtc6SPAjPdts=;
 b=cD0KxgzQjcP+i8mv3AulsvULUrnBOzhRr8ea4cc0ZOHnfAi0ZjjekIu8kgbBEXFjWN
 XiIFzRKwCqxS4Xuge7GxcRRw8UTYwyp/5jOitDYNzUS++HrSQFkWgy3hVt3OdiRnR/s5
 uqHDpOu3OUal4Jd21zfZnKuIwYCB/V1W6g2UWX3TvtzI+JvAxX3CfpGStn4s4u3QbPnR
 Bb0LKEzlVmUayxcTrbKgTb/ATTqym2LXqJNOX4bGbBHC3Ny375vomxMA/OGiuhIrD7A3
 84/m6/ly0XpCEYw9EXTF6pG1KGXyKCDlRoneMIaikHSxTnE8TVOV+4joTec22eyvNoQ7
 Nm9Q==
X-Gm-Message-State: AOAM532Zn47JJAhm80cxW95SLdmWYoSHgfCzvZycEEyhE/kkqD4CihwH
 POAsHWq94yFdqVpYv9txR5o=
X-Google-Smtp-Source: ABdhPJzv3i97CadNbDFzUwvwAiBt6NrvZZ/A1+KA0AiQFU30mt/ShxEb+HmLya0qOTu4Szht0Xt2cg==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr3467312wmf.17.1591089962795; 
 Tue, 02 Jun 2020 02:26:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id y17sm3204873wrn.12.2020.06.02.02.26.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 02:26:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Roger Pau Monne'" <roger.pau@citrix.com>
References: <20200602091602.38422-1-roger.pau@citrix.com>
 <20200602092314.uydguwrje4bomktf@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20200602092314.uydguwrje4bomktf@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Subject: RE: [PATCH for-4.14] compilers/clang: always use _Static_assert with
 clang
Date: Tue, 2 Jun 2020 10:26:01 +0100
Message-ID: <003a01d638bf$d54dc100$7fe94300$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIe/3Blvy/dLIniPJQXflJrQIvotwHksC7fqCRay6A=
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
 'Julien Grall' <julien@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 02 June 2020 10:23
> To: Roger Pau Monne <roger.pau@citrix.com>
> Cc: xen-devel@lists.xenproject.org; paul@xen.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14] compilers/clang: always use =
_Static_assert with clang
>=20
> On Tue, Jun 02, 2020 at 11:16:02AM +0200, Roger Pau Monne wrote:
> > All versions of clang used by Xen support _Static_assert, so use it
> > unconditionally when building Xen with clang.
> >
> > No functional change expected.
> >
> > Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Wei Liu <wl@xen.org>
>=20
> > ---
> > Not sure whether this fully qualifies as a bugfix, as the current
> > behavior should also work fine under clang. Note that all versions =
of
> > clang from 3.5 to trunk (11) seem to return __GNUC__ =3D=3D 4 and
> > __GNUC_MINOR__ =3D=3D 2.
>=20
> IMHO it wouldn't hurt to apply this patch since any breakage is easy =
to
> catch.

Yes, seems reasonable.

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> > ---
> >  xen/include/xen/lib.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> > index e5b0a007b8..076bcfb67d 100644
> > --- a/xen/include/xen/lib.h
> > +++ b/xen/include/xen/lib.h
> > @@ -25,7 +25,9 @@
> >  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
> >  #define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
> >
> > -#if __GNUC__ > 4 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6)
> > +/* All clang versions supported by Xen have _Static_assert. */
> > +#if defined(__clang__) || \
> > +    (__GNUC__ > 4 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6))
> >  /* Force a compilation error if condition is true */
> >  #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond =
")"); })
> >
> > --
> > 2.26.2
> >


