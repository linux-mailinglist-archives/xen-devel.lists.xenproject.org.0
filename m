Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804841FAF81
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 13:50:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlA6o-0007Nr-DG; Tue, 16 Jun 2020 11:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHWY=75=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlA6n-0007Nm-Cw
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 11:50:29 +0000
X-Inumbo-ID: 92abc20a-afc7-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92abc20a-afc7-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 11:50:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q11so20459721wrp.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=gJBqAYNuHTwcbvP6olgulukkw1YaLXwNhJaPEC0XO64=;
 b=j2Bu9pWTflXoVzG4of/FGVUmoSNCF5o52ls4ytFGzDvXAXA7nVEPewG8pY34dChiaB
 uqHCs2TLt9KCQo000nEduziqcDMC67p2DOEkj2Avz1EKXIY3Tpp5IdoA8PSX4zN9CPF9
 Z3dLiVUqfX2F29v5pEvBgnTYUQ6DNVX5L55IZiXNMLVf0PBI0d8nuz3ProU5Nbowac/v
 Y7I0AZfwsZoOERZvs/odiIYvEFc1ynwXmYS7aOHkL9zZxq1TV21lSZzc4S0DLUPmMnvc
 4QI+23g7C6a9nNgNt7H1bFWJtW3PpCXYcwcB96Y3vj9wQrIWp1lNxQ5R/BwietD8RH3W
 9vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=gJBqAYNuHTwcbvP6olgulukkw1YaLXwNhJaPEC0XO64=;
 b=o8i8pcQ+GisEqtfLQOcNqVMz/a2D1SdyV14Nj4R53W1rMDz3ifvL0KTJF6yMLWqBkd
 o4C2vP3KuxXCgTOE2r+SOUIy5M+8sbxALWxMy+1UsiotJokSNy13dZgKe1aBqbUuIkwy
 56UmRMJjeDVV7HpjUEMeOSPPJWdWKAcFOcNIhVnyqbGOhJkPbFC4sgavZev1plnuCApS
 F3IvRnFNWc2Uf1Oc8Gcfp70Y/STamHGNH1mrSwXMNHAAoahZ+2LM2s4C2GKqIQVITua/
 mGYkYi7fuH4k1SJY1utMzOGIMfeZfuq+TDOdzZPRiFma+YMIEj5bAOnhEFViCVKvDb3U
 l5rg==
X-Gm-Message-State: AOAM5332w1dYLKhD9PhkFfNR3Mxla43EnqkUrKS/UR/0+74vpdsUqRo1
 q/YM4GHfeBMnBwgBDUV/puQ=
X-Google-Smtp-Source: ABdhPJzZQPvGU5M9lg0swP8ft8ziU+/pjYasxBer2JxfHa/s63nr9ATtpks0i2v7HykACCL6zct9Tg==
X-Received: by 2002:adf:a350:: with SMTP id d16mr2755407wrb.237.1592308227941; 
 Tue, 16 Jun 2020 04:50:27 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id r5sm29305450wrq.0.2020.06.16.04.50.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 04:50:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Roger Pau Monne'" <roger.pau@citrix.com>
References: <20200616102056.18074-1-roger.pau@citrix.com>
 <e2596596-3dec-4317-b0a0-c03d85dd05ff@suse.com>
In-Reply-To: <e2596596-3dec-4317-b0a0-c03d85dd05ff@suse.com>
Subject: RE: [PATCH] x86/hvm: check against VIOAPIC_LEVEL_TRIG in
 hvm_gsi_deassert
Date: Tue, 16 Jun 2020 12:50:25 +0100
Message-ID: <002d01d643d4$53e0d6a0$fba283e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGCFOmVxi5Iajm8LYmxSaYnvh23ZgNQQnvrqWj8oOA=
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 16 June 2020 12:22
> To: Roger Pau Monne <roger.pau@citrix.com>
> Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH] x86/hvm: check against VIOAPIC_LEVEL_TRIG in =
hvm_gsi_deassert
>=20
> On 16.06.2020 12:20, Roger Pau Monne wrote:
> > In order to avoid relying on the specific values of
> > VIOAPIC_{LEVEL/EDGE}_TRIG.
> >
> > No functional change.
> >
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Since the other patch went in, also Cc-ing Paul for a possible
> release ack.
>=20

Sure, it's trivial so...

Release-acked-by: Paul Durrant <paul@xen.org>


