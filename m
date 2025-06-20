Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3465AE17EA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 11:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020705.1396828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYH0-0004At-Gr; Fri, 20 Jun 2025 09:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020705.1396828; Fri, 20 Jun 2025 09:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYH0-00048T-DW; Fri, 20 Jun 2025 09:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1020705;
 Fri, 20 Jun 2025 09:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSYGy-00048G-Fo
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 09:43:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2de7b12-4dba-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 11:42:59 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so17913055e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 02:42:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d0f187a5sm1605871f8f.34.2025.06.20.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 02:42:57 -0700 (PDT)
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
X-Inumbo-ID: f2de7b12-4dba-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750412578; x=1751017378; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubgPFVvM/Tg7diMc2XsBHckJiKaFKiS5Yk0XvSz32Bk=;
        b=su8vHC8syx4Dn4LgMscycgAw0tNAdn8qbgBYd1A4eCgBjnfvg9pPvxopE/Q24So6Au
         YIfOT+KQbgRTRd4G1y7NsWnZUEhbPUGyxu51oop/JFsqZ3yRkgde5WbjjP2bEaIC9sQ5
         0fJ9Y1Nk19PmyuKHaD05u40Grb2QMI4ci2zYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412578; x=1751017378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubgPFVvM/Tg7diMc2XsBHckJiKaFKiS5Yk0XvSz32Bk=;
        b=OJUkqA6xoFz1IhEYjNMuC9jlLVRb2A9HD/1Z7DzX0bAZ8ixar/CURuHRDp9FaHItzu
         Edd/ctMkJJdckANx6qKzXAy9lDagSX2MjPWR7GE/TRsGU0jramRowu7ZR7CBUFR+W5t4
         RcrxXG6FbyzY4ex4IUgK6+/TWL0yLs964thtmYgN2Vx6VTh8uDZHQoIDNWEiRJJOcYaE
         f17abbBdMhG7Si+5ZfbIGp+P09QYCZkQ/yQYZdYSVKIuGi56MGp/Maj7+5lJDQ9nS6uU
         ssTZTESScLvXhyJslcXywGmHbsUmZBk+fnlnVe44OiTc4TVFmAirU/CSyq2hfxptLl/S
         smWg==
X-Forwarded-Encrypted: i=1; AJvYcCWXYpujjf+szppF0RTg2yt2YW68DSvr+lTfEwZN6P6zRuh1FUGw7N5ju22DRRNAzgdqWGLD4ajrxXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzjzSVnxS/R03GpU1nkQkIG/QduIN5HCdP/uSfYCx8VjCcd4vZ
	xFhjrf9JCK61nMVuw21tcQ0a3hxWStQG3/d81taPFj11jCCP6uPM7unRcqt70t20QZk=
X-Gm-Gg: ASbGncvlqtpcwblnSKw6lClE1ztCSPAdPoiPXEBQViFCDMFRpHE2nkw61Wuv35uNmb4
	5yg4KtigZeJXAVseNOdQAGJQjaqNnY19535tayHzbLDFL5jxfUHkmJid5zQPVbfXqKLOyA1VLwJ
	07QssTsQniXbcXu/izYghi2vtdLVUTH+iwMWCtmI3XsqqJ6jpgnFgj8MUU4D/Z/rVEfl74u5vXs
	YdZKQOZrFiFM76UXhOGjd1WloqFenjneG50KiLbTuxF1FP5euBzx52hXdxpNrHbqwK7eF1tFeIF
	IxisvOTjjva8Za9o02akemIKWvnfAt5yIhCFoFlci0ZKlLvRgrpXO4AQDuzNC21Rvxwb6lPgKPX
	j9UL+8VQXU/XHn4PJVqXdn5oKBZ5kOsEVHVU=
X-Google-Smtp-Source: AGHT+IHxGiSQTF4nGFpmZXcydeDzicyLo2kanFzs2Bk/ZKVVUEunGk0iI/pWKxvMEv6XusvK1dZ/HQ==
X-Received: by 2002:a05:600c:5026:b0:450:b240:aaab with SMTP id 5b1f17b1804b1-453654cb3d9mr18736515e9.8.1750412577741;
        Fri, 20 Jun 2025 02:42:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:42:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/5] livepatch: Embed public key in Xen
Message-ID: <aFUtIA5agsSOit3j@macbook.local>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-3-ross.lagerwall@citrix.com>
 <c7fb63cf-b05e-49ff-9ffe-446231146ba4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7fb63cf-b05e-49ff-9ffe-446231146ba4@suse.com>

On Thu, Jun 05, 2025 at 01:19:00PM +0200, Jan Beulich wrote:
> On 02.06.2025 15:36, Ross Lagerwall wrote:
> > From: Kevin Lampis <kevin.lampis@cloud.com>
> > 
> > Make it possible to embed a public key in Xen to be used when verifying
> > live patch payloads. Inclusion of the public key is optional.
> > 
> > To avoid needing to include a DER / X.509 parser in the hypervisor, the
> > public key is unpacked at build time and included in a form that is
> > convenient for the hypervisor to consume. This is different approach
> > from that used by Linux which embeds the entire X.509 certificate and
> > builds in a parser for it.
> > 
> > A suitable key can be created using openssl:
> > 
> > openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
> >     -sha256 -days 3650 -nodes \
> >     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
> > openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem
> > 
> > Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> While reviewing patch 4 it occurred to me: Why embed the key? Can't this
> be specified as (another) boot module?

Then the key itself will need to be signed, and it's extra churn that
we would need to verify at boot.  I'm not opposed to being able to
load the key as a module, but it seems reasonable to also bundle one
in Xen.  If there's interest in passing one as a module it could
always be implemented as a separate feature.  IMO: I don't see both
approaches as being incompatible with each other.

Thanks, Roger.

