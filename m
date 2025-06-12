Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19BCAD691A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012436.1390878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcQV-00049Y-7K; Thu, 12 Jun 2025 07:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012436.1390878; Thu, 12 Jun 2025 07:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcQV-00047U-4G; Thu, 12 Jun 2025 07:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1012436;
 Thu, 12 Jun 2025 07:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPcQT-00047O-QH
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:32:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6af48e3c-475f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:32:39 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so6942165e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:32:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e24155bsm11400615e9.17.2025.06.12.00.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 00:32:35 -0700 (PDT)
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
X-Inumbo-ID: 6af48e3c-475f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749713558; x=1750318358; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gAWW7lVm7WQQuR9+ND31YNRD8GoyHuETasTztULC8s=;
        b=lYIcOB0KHK11ncanm7v7P0Hbofy9CG07tavpsrJ94xOpm7Wex9sOA/tzoNK57iC0HS
         uw77yu9+abOrS2lLHp5kAOtSFruGETHbbBKq4a6pdg9QDdme0MxU73VlaP8Xa1WmXSwj
         QmTYzxyuP9uLWRY/sKeblD/yfDIIq2O15ZfF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713558; x=1750318358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gAWW7lVm7WQQuR9+ND31YNRD8GoyHuETasTztULC8s=;
        b=j8MK9H9Lgb4JYKVkp5BrXRhZASae+0ARucyIm3Wb+2PUFxkD1dxisVRqRQVaVbcRVd
         EpbrHwNxL2a5yOb7BMvdlHFLyjMijDwGwTlyvd12CVsA7dduTVmm07G0PJEs3lV35Z+s
         9M2iom9DnV8Y61ZUipNbDvhlRX6dZQZ4HrNoZkWrVWAuzhFXpvzZPW//CRDshma6pDo7
         cgS3/Z2hc5vSrnvzZCGNrMT2PxOVm5tfwyOOX0i4GBretU/RhZ0nxkEC47Pb5+VtjfIu
         69xeszfkKk0ViUX7mduXtc3gmi6Cpa7wqCqIbnILQ8TRdQNXwVWkfINJmL/a1ZCZNOPV
         IQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP4C8uH4Sb+Ei+CPbx/RZiPJpgLEGPiNfvC1VKhThqYvDZB2DFbl6Wo5ZeK6oIgTzZfnFb3NFNux0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxA1KKsEzM5WhP8SfJmDS1No/VkeZv9Ib7e1oOdYpBeFGR0ec9
	c31NfXmVJUVHHTIEj3zF2um/cozXiWc5bfVyKc80aV0W2bSe26XR/2/4zBAyoyQ8XHA=
X-Gm-Gg: ASbGnctINOsxV4Z/N4U4koeuP67+FI8nlZoOrhO9gN8X5mSHRFqUyPzzX7jor6QN68c
	uYI5E7Ynh978BC+pTm2psKeFKbeqDI2RNs0Voyi6CZwz5IGmbXXZSPhDVyCrIvgwLZpKZ9TosNB
	QQjKgYF1wkDrUpYUQfd8KstEJb3hB0KWM53wooCv6lZBQrlMaUrOXwD1Gfh9djOzTCcOOGjQAOI
	n38oCjwVLdrjejHcc0ets+6cvNkf7T+bHKG0lTziiWGmklWb8n9B9C4QyzpJ7C0G0jN8YRHTOCd
	3x368vkVZ0Q3+slYihGhN9S0y7kPEY1YZ/90awBZevBcUGPB2zb5PgK5knhgvVCa5bL/iVk62+F
	YDXd2XG6oiGQARssb4nQdMmwsu47C1w==
X-Google-Smtp-Source: AGHT+IGIDmpe/vpgG2F89wY0phShV8ZgXmKnmN499GI0gkWUeVkx7U6geXhTpUnzjdYW8T2K585Uaw==
X-Received: by 2002:a05:600c:138e:b0:442:e147:bea7 with SMTP id 5b1f17b1804b1-4532d368101mr17510785e9.29.1749713555860;
        Thu, 12 Jun 2025 00:32:35 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:32:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/5] vpci: allow 32-bit BAR writes with memory
 decoding enabled
Message-ID: <aEqCks_hy9xjiVD6@macbook.local>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-6-stewart.hildebrand@amd.com>
 <9ec5079f-9bc1-4843-a266-d74bf0556619@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ec5079f-9bc1-4843-a266-d74bf0556619@suse.com>

On Thu, Jun 05, 2025 at 12:41:06PM +0200, Jan Beulich wrote:
> On 31.05.2025 14:54, Stewart Hildebrand wrote:
> > Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
> > firmware initializes a 32-bit BAR to a bad address, Linux may try to
> > write a new address to the BAR without disabling memory decoding. Since
> > Xen refuses such writes, the BAR (and thus PCI device) will be
> > non-functional.
> 
> Doing this for 32-bit BARs only, with not even an outline what to do about
> the same issue with 64-bit ones, seems like it won't buy us very much.

IIRC Linux will disable decoding in the common case when updating the
position of a 64bit BAR.  However it won't disable decoding for 32bit
BARs.  I think that's why Stewart cares more about the 32bit case than
the 64bit one.

Regards, Roger.

