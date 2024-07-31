Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08125942AB5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 11:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768389.1179165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ5mG-0005bD-TZ; Wed, 31 Jul 2024 09:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768389.1179165; Wed, 31 Jul 2024 09:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ5mG-0005YY-QR; Wed, 31 Jul 2024 09:37:48 +0000
Received: by outflank-mailman (input) for mailman id 768389;
 Wed, 31 Jul 2024 09:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ5mG-0005YS-05
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 09:37:48 +0000
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [2607:f8b0:4864:20::a32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0a31e9-4f20-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 11:37:46 +0200 (CEST)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4f6e9fc29b7so1528178e0c.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 02:37:46 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1ee464348sm397774585a.90.2024.07.31.02.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 02:37:44 -0700 (PDT)
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
X-Inumbo-ID: 8b0a31e9-4f20-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722418665; x=1723023465; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gBYNCiEYD5dFw9i2uWH5352DjikYHrHRN3LeDQJSbsg=;
        b=KHmReE8kKrDr9R4BuLvpDUrMKrFEEDrez+DmsOhCtrJ3f8JbL8CFBM2O0bcKzusf+e
         EMIrpvS4QNNxCVU788DjLfkD+zBoBD9JasIGnN3eIDC7Igc9RCr6Fa/fVCYjKmc5ABIQ
         ztuWi4IX2UrVO1aNFmyeeaWpRl7wDLEO+s+G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722418665; x=1723023465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBYNCiEYD5dFw9i2uWH5352DjikYHrHRN3LeDQJSbsg=;
        b=I2UV+ANBejq2rsjybHtnLrWTFMY8Hm4V2jptQZ3uZ95/uSN0txAyKlC0YXn62g26GG
         T/2uX2PtOR2dLBXHH+3PqDUa1otOTa9qxKm2Ly3HIUUj14swDTCEMazrStOF9IiXUJ0g
         4PDcxd3kVbdu7vbXdQB2Y97vMwf7zOofzeN86XsgyLBhNHFyuplpZvHg8sFOpd2JF6+j
         OVcE/Sp1CZ65PsEScID3SrryWcZ72nz0lVxuJssoxU/4CezhLu4xoFGdKeMRQi7FsZXL
         j54Bsi+cAQ+MW6DfJBtW17P16EqueOV2TxQQImNrhaq33JwlS7vmT8eWIEM7wkXrpJ70
         dgVg==
X-Gm-Message-State: AOJu0Yx9vYyyWn9MaR27IN2ecieyUMjAggVSuh2FcnuDPqqUl5s/WFW4
	+TUZMXweDstxABQNo+rKkhKUs63P0rgIajKEhy28FE2Kmsbwm/UbfM2wQGKzSNg=
X-Google-Smtp-Source: AGHT+IE68Km61+o4bZHIm7S6Jh3zDtozian/U96wM+oTo+kGFiYCfIViMUwW822bVaF5wqKRSn1CUg==
X-Received: by 2002:a05:6122:1828:b0:4f5:27ac:ce6e with SMTP id 71dfb90a1353d-4f6e68ef18bmr14983229e0c.7.1722418665376;
        Wed, 31 Jul 2024 02:37:45 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:37:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Message-ID: <ZqoF55yapMxGN_WM@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com>
 <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>
 <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com>

On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
> On 31.07.2024 10:51, Roger Pau Monné wrote:
> > I agree with (a), but I don't think enabling PVH dom0 usage of the
> > hypercalls should be gated on this.  As said a PV dom0 is already
> > capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
> > domU.
> 
> Okay, I can accept that as an intermediate position. We ought to deny
> such requests at some point though for PVH domains, the latest in the
> course of making vPCI work there.

Hm, once physdev_map_pirq() works as intended against PVH domains, I
don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
against such domains.

Granted using vPCI for plain PCI passthrough is the best option, but I
also don't think we should limit it in the hypervisor.  Some kind of
passthrough (like when using vfio/mdev) will still need something akin
to a device model I would expect.

Thanks, Roger.

