Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F15725AA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 21:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366051.596616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLeX-00012y-7o; Tue, 12 Jul 2022 19:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366051.596616; Tue, 12 Jul 2022 19:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLeX-0000zY-34; Tue, 12 Jul 2022 19:34:37 +0000
Received: by outflank-mailman (input) for mailman id 366051;
 Tue, 12 Jul 2022 19:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dIdn=XR=gmail.com=salvatore.bonaccorso@srs-se1.protection.inumbo.net>)
 id 1oBLeU-0000yq-O0
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 19:34:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6fe1df7-0219-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 21:34:31 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id j22so16147413ejs.2;
 Tue, 12 Jul 2022 12:34:31 -0700 (PDT)
Received: from eldamar (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
 by smtp.gmail.com with ESMTPSA id
 l1-20020aa7c301000000b0043ab5939ecbsm6522136edq.59.2022.07.12.12.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 12:34:30 -0700 (PDT)
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
X-Inumbo-ID: a6fe1df7-0219-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cUibCSxMoDeR+V4rKvezXaJVFqRh4BDSNyqzyGJ45Gw=;
        b=p8OpUHIOiSngRVmkadDU59ENA5YE1Vjf/ta6crjLkw2cIEsXcHQfAIepCdgvM24fb5
         /hv2mxkNHj4jlc6+22Xm3l4+diOCMNc4W9l7YwXdEELS5JMfd9b4LvKYVFftAIDCesE0
         9QR0ThnYp5JjEhw0QCf4LfHuE1I+n3eZwJAOAuCfjMlNwTB5wknD56wXdl/hlf7i0Npk
         wFD1Kx/G7Z9zERMfokbwJEUOgdgQqReOXm/8ChRsnVgJ89rOeG0jj/yCEU0Y2eJfkQqU
         s++OUtmVhAV/dvUwxUPkaPKYM1bs7a7ULMv2V5DLyxQal+a7IsbsKGwM63UUdbBwybSM
         I94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=cUibCSxMoDeR+V4rKvezXaJVFqRh4BDSNyqzyGJ45Gw=;
        b=FP62xSJO0P5kY71PevlKl+5dcOidyg8Um1RE6y0p0sEBY8mwL3vuZGNZvRT5ACIbGS
         nyiUeC+2piVYO37aSLIPgo8lPIt9ri7RLPxJgE2367ecu+mt5Aa712N5VokTWKIuiZjQ
         i79x2UpGruQE+p/WleD5O8rm5+kYNXEfkPbJkNe8NYqcsDc8Vw+teeC8x3u4Or5NcDfV
         JRvpxA9lALCF1KSD/Gcm8x0C1NLzeAh24NrcbvWKm04qwevYr0x+62IYGZrTIiilSQv5
         JKl8DlzGNOjEXd94liKSmZFpTrW3El3usnUb2qskrV5dE5lbv3gP5AaGGBNB5jsK6sQ8
         R4kQ==
X-Gm-Message-State: AJIora+NbdEd/pqsqK/NsLJkJWdnHir4AUKdoyOofCWvBi3ikO/Q2iu4
	UVJpkkaqWi3+TGTDJN/5UATZEN2zchQP/w==
X-Google-Smtp-Source: AGRyM1tEKkn1bdaPUb7b1bLudzPimOOYGYcxvbrVbouCSR2q/lPhvsXhcnPVC+v9w+hQWUzSox3ywA==
X-Received: by 2002:a17:907:2718:b0:72b:6b65:37dc with SMTP id w24-20020a170907271800b0072b6b6537dcmr8356123ejk.425.1657654471466;
        Tue, 12 Jul 2022 12:34:31 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Tue, 12 Jul 2022 21:34:30 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: oss-security@lists.openwall.com
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
	xen-users@lists.xen.org,
	"Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 407 v1
 (CVE-2022-23816,CVE-2022-23825,CVE-2022-29900) - Retbleed - arbitrary
 speculative code execution with return instructions
Message-ID: <Ys3MxgqixXKIMg/T@eldamar.lan>
References: <E1oBIrq-0007mF-D5@xenbits.xenproject.org>
 <Ys3LCx6LmRFF547K@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys3LCx6LmRFF547K@eldamar.lan>

Hi,

On Tue, Jul 12, 2022 at 09:27:07PM +0200, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Tue, Jul 12, 2022 at 04:36:10PM +0000, Xen.org security team wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA256
> > 
> >  Xen Security Advisory CVE-2022-23816,CVE-2022-23825,CVE-2022-29900 / XSA-407
> > 
> >    Retbleed - arbitrary speculative code execution with return instructions
> > 
> > ISSUE DESCRIPTION
> > =================
> > 
> > Researchers at ETH Zurich have discovered Retbleed, allowing for
> > arbitrary speculative execution in a victim context.
> > 
> > For more details, see:
> >   https://comsec.ethz.ch/retbleed
> > 
> > ETH Zurich have allocated CVE-2022-29900 for AMD and CVE-2022-29901 for
> > Intel.
> > 
> > Despite the similar preconditions, these are very different
> > microarchitectural behaviours between vendors.
> > 
> > On AMD CPUs, Retbleed is one specific instance of a more general
> > microarchitectural behaviour called Branch Type Confusion.  AMD have
> > assigned CVE-2022-23816 (Retbleed) and CVE-2022-23825 (Branch Type
> > Confusion).
> > 
> > For more details, see:
> >   https://www.amd.com/en/corporate/product-security/bulletin/amd-sb-1037
> 
> Is it confirmed that AMD is not using CVE-2022-29900? The above
> amd-sb-1037 references as well both CVE-2022-23825 (Branch Type
> Confusion) and CVE-2022-29900 (RETbleed), so I assume they agreed to
> use CVE-2022-29900 for retbleed?
> 
> So should the Xen advisory as well use CVE-2022-23825,CVE-2022-29900
> and CVE-2022-29901?

Nevermind, I missunderstood the wording and the advisory just mentions
all the related CVEs correctly and made a thinko. It might turn out
that CVE-2022-23816 will not be used, but then the title would read
only as 

Xen Security Advisory CVE-2022-23825,CVE-2022-29900 / XSA-407

So please disregard the question above.

Salvatore

