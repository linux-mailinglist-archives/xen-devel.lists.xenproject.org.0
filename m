Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8193AE18FF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 12:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020817.1396959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZ3r-0000IK-1m; Fri, 20 Jun 2025 10:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020817.1396959; Fri, 20 Jun 2025 10:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZ3q-0000FC-UR; Fri, 20 Jun 2025 10:33:30 +0000
Received: by outflank-mailman (input) for mailman id 1020817;
 Fri, 20 Jun 2025 10:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZ3p-0000F6-K0
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 10:33:29 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01299a33-4dc2-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 12:33:28 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso19325045e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 03:33:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453646fd816sm20791325e9.24.2025.06.20.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 03:33:27 -0700 (PDT)
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
X-Inumbo-ID: 01299a33-4dc2-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750415608; x=1751020408; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpBWZi53WDfZleXq1qmgrCIdkQnOQoPAV/yzUadBfo8=;
        b=PMCC2zdikX3+c6lDLIqaCg6JPPF3OwE0bkvwCf70r70lIOxKpvEQYbCt5+1uxnKbCB
         Sq95OeXE5LwgDr6Eu7alEVl9UYqeNCkpYNHB5Y86OQqF2D7idKSqwFnc5AaXwSyWZxHY
         aLAv5XTTcDyg67ADmCbdlQjnCAnduAdLAj4dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415608; x=1751020408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpBWZi53WDfZleXq1qmgrCIdkQnOQoPAV/yzUadBfo8=;
        b=h3EKjN9ijTPaSS+Bh5lsB2109nELDD7JrwJ3bZF+NBHLUR6pDLyzI5gov84o5Kljm8
         4VVXFi6mYpwtoEJ2IVf4Fha/Ugjd7D7ZyDFMjkrK9CPwUqgWM8/cckz/kHY1iKVTY0hw
         JMHNj6Ijwk+RlZC79hg04JeUMAs3meQFNXHQZr5Ib4pdnhK72JEioT/UB/8sMfIGhzqp
         8FkBeNjgVHO1vaoqqmps1P7MYtG6dgMpIyfV+OiASXj2xXP2nUOX8obrTCI7fq8G9N5X
         J8r+cNEQxdAfcNoviB8nXWkPTi52vt/nh46jpsw/Fe8cHhUTFp6bWRbSE5G6ysNoKimn
         CZWg==
X-Forwarded-Encrypted: i=1; AJvYcCWVgSoga62lQ5+5yhqNVXoCZzIWZs4DV4+sRMVZ1C6cPfmNG+kFfOdmliMhpF80d61IHyIzc8qv+Mw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd/FpeHW9y1j0YEUySeWfpLCMJnu+iJl+JWcUWqzN1VppvLd1s
	Pz2uAY3iHdbEzelMvDBEloK7MvyClA5ZZs0a/EfuTzsz/Z+jGnskc+gGky0s+BiiQBU=
X-Gm-Gg: ASbGncsaC4BsOR4BfZwSBbf1pp79hCSZlOAXGWjztO+dAOZ8LHpFNYKXSgXMfGv2RjD
	O1vIcG7TiPVVk/V3GiFQifPuDPam4BFP+hLXH3B4LCQG08bREV6py2915BxRoVyru+Z2Mbc/Czf
	ewbD8FQBmeKk8gcy8jJbvoyaUNwsX0gjD+EVHou0dSr5w+wgZSN0m769tK7XML5ebP1u/BUdoGl
	10f3qyex3rb4TAfAXYfUI+A1vRyKONlozem7XWbA1rHU4i1Uwo2C7FvMVbeDDBfBkTKMm9FAik1
	KzhIdR5NUbVxqv6xUN/40UwhqzNzlDHzLGsZXCGPi/xnTQwdL0nAr/JHx78Iubkehu//BhfrzIm
	QFf/AaA8YOufZQfbTbtSBMa765LC+4w==
X-Google-Smtp-Source: AGHT+IH0oFbwqe0ayHOh6UMaufWW2rI3lrnR6GsZoXszDkGBkKF6CpmwzLaDmFtKDqA7NGK7SgRyzA==
X-Received: by 2002:a05:600c:64cd:b0:453:6146:1172 with SMTP id 5b1f17b1804b1-453659b67femr22854825e9.3.1750415608217;
        Fri, 20 Jun 2025 03:33:28 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:33:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/5] livepatch: Embed public key in Xen
Message-ID: <aFU49lNOoQXxWf9N@macbook.local>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-3-ross.lagerwall@citrix.com>
 <aFUsaySlHs4ymmtB@macbook.local>
 <aa1354da-46d1-4867-9a51-1b6b00ceb50b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa1354da-46d1-4867-9a51-1b6b00ceb50b@suse.com>

On Fri, Jun 20, 2025 at 12:09:21PM +0200, Jan Beulich wrote:
> On 20.06.2025 11:39, Roger Pau Monné wrote:
> > On Mon, Jun 02, 2025 at 02:36:34PM +0100, Ross Lagerwall wrote:
> >> From: Kevin Lampis <kevin.lampis@cloud.com>
> >>
> >> Make it possible to embed a public key in Xen to be used when verifying
> >> live patch payloads. Inclusion of the public key is optional.
> >>
> >> To avoid needing to include a DER / X.509 parser in the hypervisor, the
> >> public key is unpacked at build time and included in a form that is
> >> convenient for the hypervisor to consume. This is different approach
> >> from that used by Linux which embeds the entire X.509 certificate and
> >> builds in a parser for it.
> >>
> >> A suitable key can be created using openssl:
> >>
> >> openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
> >>     -sha256 -days 3650 -nodes \
> >>     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
> >> openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem
> >>
> >> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> >> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> >> ---
> >>
> >> In v3:
> >>
> >> * Drop unnecessary condition in Makefile
> >> * Use dashes instead of underscores
> >> * Drop section placement annotation on declaration
> >> * Clarify endianness of embedded key
> >>
> >>  xen/common/Kconfig          | 18 +++++++++++++++++
> >>  xen/crypto/Makefile         | 11 ++++++++++
> >>  xen/include/xen/livepatch.h |  5 +++++
> >>  xen/tools/extract-key.py    | 40 +++++++++++++++++++++++++++++++++++++
> >>  4 files changed, 74 insertions(+)
> >>  create mode 100755 xen/tools/extract-key.py
> >>
> >> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> >> index 0951d4c2f286..74673078202a 100644
> >> --- a/xen/common/Kconfig
> >> +++ b/xen/common/Kconfig
> >> @@ -472,6 +472,24 @@ config LIVEPATCH
> >>  
> >>  	  If unsure, say Y.
> >>  
> >> +config PAYLOAD_VERIFY
> >> +	bool "Verify signed LivePatch payloads"
> >> +	depends on LIVEPATCH
> >> +	select CRYPTO
> >> +	help
> >> +	  Verify signed LivePatch payloads using an RSA public key built
> >> +	  into the Xen hypervisor. Selecting this option requires a
> >> +	  public key in PEM format to be available for embedding during
> >> +	  the build.
> >> +
> >> +config PAYLOAD_VERIFY_KEY
> >> +	string "File name of public key used to verify payloads"
> >> +	default "verify_key.pem"
> >> +	depends on PAYLOAD_VERIFY
> >> +	help
> >> +	  The file name of an RSA public key in PEM format to be used for
> >> +	  verifying signed LivePatch payloads.
> > 
> > I think this is likely to break the randconfig testing that we do in
> > Gitlab CI, as randconfig could select PAYLOAD_VERIFY, but there will
> > be no key included, and hence the build will fail?
> > 
> > Ideally Gitlab CI would need to be adjusted to provide such key so the
> > build doesn't fail.  I think it could be provided unconditionally to
> > simplify the logic, if the option is not selected the file will simply
> > be ignored.
> 
> Alternatively the two options could be folded, the default being the
> empty string meaning "no payload verification". I don't think randconfig
> can sensibly make up random strings ...

Could be an option.  Not sure if the menu interface would then look a
bit weird.  IMO it's a nicer UI to enable the option and then get
asked for the cert to use rather than bundling everything in a single
string-like option.

Thanks, Roger.

