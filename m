Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B2A5C43F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908254.1315388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0yn-0002ip-Kx; Tue, 11 Mar 2025 14:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908254.1315388; Tue, 11 Mar 2025 14:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0yn-0002gn-HD; Tue, 11 Mar 2025 14:53:13 +0000
Received: by outflank-mailman (input) for mailman id 908254;
 Tue, 11 Mar 2025 14:53:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QaIb=V6=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1ts0ym-0002gh-7B
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:53:12 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8abb8e1d-fe88-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 15:53:07 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso15240435e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 07:53:06 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf85f2359sm73265195e9.27.2025.03.11.07.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 07:53:05 -0700 (PDT)
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
X-Inumbo-ID: 8abb8e1d-fe88-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741704786; x=1742309586; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPHUIkRagrerQxbbIFC8W4cRa356O4VsA/PfNTIW4h0=;
        b=gu0sF74PXlrI022P/BdmxDLPqReiPNXSgoLZhZyzASdvuoGBj8ORnseYzQ2Ojc+qbP
         PO5V4C4V04xql3X4v1HCOt0+fGcWYF6lDoDwBidmVveF5+8MlVm1uyA+DFzunJBhObJN
         8hNwzRquUctBrhCn5P6oMnH+bQ0B0DvGf5k8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704786; x=1742309586;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPHUIkRagrerQxbbIFC8W4cRa356O4VsA/PfNTIW4h0=;
        b=qfuYbk59A87JQ4FRiJwpNldKHK1oF2eq2yvcVXpowa4KqV/Egomy/rYYVEUHE+KBWw
         Y+8vdho/1Akt8KlUnBeQpnzZK38LB9fyRUf+I0FI24Y0gBeZSeuh5Yet7KAg3v/nwa4y
         4Bhtglvdlt55+LiHa1BBrpA2qvdekRZBixM3Pkmma5q9QjiYxVA4j/6UlqeSTX78YQSO
         wA3MbRcwNmuUIQt4092MU/zFlgcv0ZYq9pWJP5EfT4mJCSm58kjDJ6eVOH6uUkftAOWt
         bInieqLPH1dqSy+KyK3E2JVt+P5ybMKRjcnZoS72DQgwiiLoj2YFpQWwJF9aFDHjlsyg
         s6YA==
X-Gm-Message-State: AOJu0YzMWi8cOhQIACqOPRkYIk6NCpBaooTrRPK3FOCjpjsFEe2VRKL7
	N8M903Gow5aU/FU/gt8//supFzM9S7p3xkYKlaQuo1JlyCmq4Gy7E/Yl6QS8lj4=
X-Gm-Gg: ASbGnctCmfurcH1oqSp1ygXAhl+fSucPHO3CYNk8pmORW3spzMqUIJxxHpoT8cnYpXz
	EjlFTPWyO+tvSbgBnBZuKPWhwV/U1dGGM9LUUlmXhMCHyAt+jAYhlq+rrvryq8rNhW01V8dbQzN
	AfEQHmXl/s+9NNZU1xbLUM/3a8uNqrobHjf3a+7JE48Dw5qzIVhipH8k9IFeXAP3suMHz+d23uP
	uZNrOu4zaxDU3nRVLBzg8vqFs0v4lK0OuNZ9vm8nmdz0gauGHSmtd0HHhsec8+uWRT5WvyJQ9CH
	crK4AwhlIHlff4CZayLV6XRT1Enin9LVrO3CcNGx3CqxBZu/gkI=
X-Google-Smtp-Source: AGHT+IEEIaN/SSV7MHpvZBfQENw6pUZfh2IYqIoTdGc0whdEAX6+z+9qXWhSNp86euEqVbzL28Yd3g==
X-Received: by 2002:a05:600c:4f0e:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43d01c1e135mr43707095e9.19.1741704786275;
        Tue, 11 Mar 2025 07:53:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 14:53:04 +0000
Message-Id: <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
X-Mailer: aerc 0.18.2
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local>
In-Reply-To: <Z9AwsrDBELe2UREz@macbook.local>

On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
> > The logic has too many levels of indirection and it's very hard to
> > understand it its current form. Split it between the corner case where
> > the adjustment is bigger than the current claim and the rest to avoid 5
> > auxiliary variables.
> >=20
> > Add a functional change to prevent negative adjustments from
> > re-increasing the claim. This has the nice side effect of avoiding
> > taking the heap lock here on every free.
> >=20
> > While at it, fix incorrect field name in nearby comment.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> I think it would be nice to also ensure that once the domain is
> finished building (maybe when it's unpaused for the first
> time?) d->outstanding_pages is set to 0.  IMO the claim system was
> designed to avoid races during domain building, and shouldn't be used
> once the domain is already running.
>
> Thanks, Roger.

As a matter of implementation that's already the case by toolstack being "n=
ice"
and unconditionally clearing claims after populating the physmap.

However, I agree the hypervisor should do it on its own. I didn't find a
suitable place for it. It may be possible to do it on every unpause with
minimal overhead because it doesn't need to take the heap lock unless there=
 are
outstanding claims on the domains. Would that sound like an ok idea? I'd ra=
ther
not add even more state into "struct domain" to count pauses...

Cheers,
Alejandro

