Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C56BABBA96
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 12:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989690.1373684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGxMY-0002hu-Oq; Mon, 19 May 2025 10:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989690.1373684; Mon, 19 May 2025 10:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGxMY-0002fK-Lz; Mon, 19 May 2025 10:04:50 +0000
Received: by outflank-mailman (input) for mailman id 989690;
 Mon, 19 May 2025 10:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9i=YD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uGxMX-0002fA-54
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 10:04:49 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b233e8e7-3498-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 12:04:48 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso7627425a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 03:04:47 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d04e80asm566224266b.2.2025.05.19.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:04:46 -0700 (PDT)
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
X-Inumbo-ID: b233e8e7-3498-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747649087; x=1748253887; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XVrJLDO6fe7QBZLwBaJKM6pWz7Wb0RBYQjDq2kYoJo=;
        b=PlQgj+OFqV0bTEMZyIRpH4bOHL3ivdYWRJ680Xsccw+QyLQWxwUVNMjddT/aZPKZ6H
         pzZxOrw90fnZYUobH/3ru0XQJNzYefYIMSakzZOxfJIKF5D3utCfhvVsr/V4ajXpua8Q
         w/LOKRyaKJORqIfRudy5My4IiPZUwFbIuILZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649087; x=1748253887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XVrJLDO6fe7QBZLwBaJKM6pWz7Wb0RBYQjDq2kYoJo=;
        b=niBDc9OZP0a4wuM/wzSS6QEOotnuryqM0odzpAkM/LcNmiIjFQc7qceGYdILvRlMHB
         GNk8hZMOZzIwMJc5AMgfpCgrR3GgeHX/W3ejC5+k4P2KZFUB6AJAWwrXpOZ7hG5Y6b6/
         rVNcQPkTv/8wI1jYfiqPt0atmzbzMol0GQH8nai1/essjMQT8EBaDgTUMdbpy2VC9XKG
         7q1S6uF7ZCndueAnBaFKHPY2BliXheu4liTv6Xro3aWqsQTy6Z/tO1RcQOlN3pYoU4vL
         ppBrhDjf3OSYiRIgSaJWP/49MHiDYijMYAPi+P21IQEt+2/a6c6zzWVWKGXDh0hYFgsg
         qV/g==
X-Forwarded-Encrypted: i=1; AJvYcCX4UuoehXYD9t8motZmk4AGa+3tyvTSvtPOua1WzwbkpZSZuIz96vthFkND1BE6rtPvtPqRhMzM3ok=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+8TUmz68lBZgdr8ao8JNN+UuCtaPVE6bj2ZzVof1neeN6sgH8
	buRAdrrR5JIPs8PUAAfdjvYdHR9249polWKDvHQ2Rf/sWBD/xq1Exurwn0ZyMj+yxUw=
X-Gm-Gg: ASbGncsN4zwjBgIlYGpNVbSCqPfFF1U213FpR8Hbo4ZyS6xOcEY62buOXPJXiQoQuKl
	pYflwg1ck7AczJFGvRO4e6Ut5MoOj/VjG9w8xopLW62r+bmWexOZQt5U7Ozn/0JH6liGSeXwyOC
	TuAFcW9jq5niqvrJtFHk2Qru8iffTjAMMmBB0D8Ue6LK4y0lsVmSmFFhwz2Hl59csqBkhVMbWRt
	SyXUNMTqJ+OJbQxWY71VWLL5A6c5AoQSXz93Fm6iTs7x2ORO5VqykgSbfntaAX1oHdpcA/xW+/q
	wetic6mOgsCHP23qcE+uzUp5iYHESL2C4v2Wwk5YPZBrUULEjaGCzLfqHwNymmJ9BhTPl3m9NsH
	nEpKj77x3eu99Qz9FHKUv81ce
X-Google-Smtp-Source: AGHT+IF7g9AcS43I+lRf56dOymaxZmOUZUT1ZYtiNmqHTNzkv8M2x8lF0Utu11yLsxEDG7+7v0F/iw==
X-Received: by 2002:a17:907:7205:b0:ad5:1bfd:30d2 with SMTP id a640c23a62f3a-ad536ffb552mr1292687166b.55.1747649087236;
        Mon, 19 May 2025 03:04:47 -0700 (PDT)
Date: Mon, 19 May 2025 12:04:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v4 05/10] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aCsCPRwqMyN9PUGo@Mac.lan>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-6-Jiqian.Chen@amd.com>
 <76d58a17-90aa-46eb-bbe8-c6d9400c489f@suse.com>
 <BL1PR12MB5849D19B57CDB80DF65F5CC2E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5849D19B57CDB80DF65F5CC2E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, May 19, 2025 at 07:35:49AM +0000, Chen, Jiqian wrote:
> On 2025/5/18 22:44, Jan Beulich wrote:
> > On 09.05.2025 11:05, Jiqian Chen wrote:
> >> +static int vpci_capability_mask(struct pci_dev *pdev, unsigned int cap)
> > 
> > What's the word "mask" indicating here? The function doesn't return any
> > mask afaics. Do you perhaps mean "hide"?
> Yes, hide.
> This is a question of naming preference.
> I remember Roger suggested this name, but maybe I remember wrong.
> For double confirmation, hi Roger, are you fine that I change this name from mask to hide?

Sure, it's fine to use hide, and it's possibly more inline with how
we use hide in other functions (like pci_hide_device()).

Thanks, Roger.

