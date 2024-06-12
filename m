Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F709905113
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739211.1146191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLng-0004Pr-BN; Wed, 12 Jun 2024 11:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739211.1146191; Wed, 12 Jun 2024 11:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLng-0004NN-83; Wed, 12 Jun 2024 11:05:56 +0000
Received: by outflank-mailman (input) for mailman id 739211;
 Wed, 12 Jun 2024 11:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKT8=NO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sHLne-0004NH-AX
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 11:05:54 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb6405d-28ab-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 13:05:53 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-62f86eaffbeso8610447b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 04:05:53 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b06ae2266bsm45452746d6.3.2024.06.12.04.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 04:05:51 -0700 (PDT)
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
X-Inumbo-ID: bbb6405d-28ab-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718190352; x=1718795152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=51VaqkyJ2zdpT7OtjzMVMDyDBYuqua5OIfu8akJWwLY=;
        b=aEvJE2yQUCDDyr0e7GdMvpGfGOL1nZjN0/LkaHGC6BjXgsOHZtdzMGDT1DMU7/VHrg
         tGYjLIbUCR2EQ6Qsgyo3SsCVwY/3PdOPI7lRS13tQ9Rbf8ysT7aappzaiqw394lbbIlA
         zbZ8cMQ73uVms2cUTDrnCzT11o63kND+kqGbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718190352; x=1718795152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51VaqkyJ2zdpT7OtjzMVMDyDBYuqua5OIfu8akJWwLY=;
        b=jYyZoJQuEVqNz7w230ft7nKt21kG/wveKP0cnBGDEuEe3tGEhIdWsd1zp2DCxTMzQb
         txDDHge/GLdkHw3w9luS/w891xVN9BsE7g5X8Smf6H0pcyjmFTOntCjxAX/jmDHauYN7
         ou+AkM6WRfmVj+oJ8tVp+wFW83wsX3gNTFHhMI+Pb79Rrx0fXNlw6IHGBSIkwoI3uJnZ
         aQdH3HzXtBLe2TAemzMykCKkYHOTSE3zpaxAeWr878OlOPEUM9dFVuTOYrOTVf455/as
         jB3f+VrKaUQSGd4QqllUvdDmx0I1NlatljFp85Cvpr8OXU5YtFb622VXcG3eJpVrWxdA
         8S7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9GcORmQXrbe0u0t7WALo60RAH5DI6C6XWwfY2hnavF1ahc/ejtUJQKU1xC/mfecbc3epIP4yKLdlPXJu28U6AZ1fEf7TG4CbdU0N1Y1c=
X-Gm-Message-State: AOJu0YwIDe/te3Y3I7f/FoxIegcdus+x18O0SSPebzlz0IY/0JkLfcHA
	EuelWkLeRQfYXknfdiASbAvm7b8MopXHEDKXLL7rcD2p58VoySQU4CFmHCSZBpY=
X-Google-Smtp-Source: AGHT+IFRNpayvcqEX9Wd1PM4lc7BVPgeTk7t7r0vRyEV5gHooKj7bhivzlqu+UavCkBqgyUZ5bILbg==
X-Received: by 2002:a25:c741:0:b0:dfd:fac6:ff80 with SMTP id 3f1490d57ef6-dfe68b1451emr1267277276.57.1718190351972;
        Wed, 12 Jun 2024 04:05:51 -0700 (PDT)
Message-ID: <37ccb940-dfcd-419d-8cea-93800fd2c865@citrix.com>
Date: Wed, 12 Jun 2024 12:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19???] x86/physdev: replace physdev_{,un}map_pirq()
 checking against DOMID_SELF
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/06/2024 9:44 am, Jan Beulich wrote:
> It's hardly ever correct to check for just DOMID_SELF, as guests have
> ways to figure out their domain IDs and hence could instead use those as
> inputs to respective hypercalls. Note, however, that for ordinary DomU-s
> the adjustment is relaxing things rather than tightening them, since
> - as a result of XSA-237 - the respective XSM checks would have rejected
> self (un)mapping attempts for other than the control domain.
>
> Since in physdev_map_pirq() handling overall is a little easier this
> way, move obtaining of the domain pointer into the caller. Doing the
> same for physdev_unmap_pirq() is just to keep both consistent in this
> regard. For both this has the advantage that it is now provable (by the
> build not failing) that there are no DOMID_SELF checks left (and none
> could easily be re-added).
>
> Fixes: 0b469cd68708 ("Interrupt remapping to PIRQs in HVM guests")
> Fixes: 9e1a3415b773 ("x86: fixes after emuirq changes")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think it is right to perform the domid lookup in do_physdev_op() and
pass d down into physdev_{un,}map_pirq().

But I don't see what this has to do with the build failing.  You're not
undef-ing DOMID_SELF, so I don't see what kind of provability you've added.

> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -184,6 +170,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>  
>      switch ( cmd )
>      {
> +        struct domain *d;
> +

Please don't introduce any more of these.

We've discussed several times about wanting to start using trivial
autovar init support, and every one of these additions is going to need
reverting.

In this case, there's literally no difference having it at function scope.

Furthermore, I recall it being a MISRA violation now too.

~Andrew

