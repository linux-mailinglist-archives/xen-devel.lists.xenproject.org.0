Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D24183ADCD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671136.1044322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfYd-0000mU-3i; Wed, 24 Jan 2024 15:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671136.1044322; Wed, 24 Jan 2024 15:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfYd-0000ku-0v; Wed, 24 Jan 2024 15:52:55 +0000
Received: by outflank-mailman (input) for mailman id 671136;
 Wed, 24 Jan 2024 15:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSfYb-0000kj-D6
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:52:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ea03d1-bad0-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 16:52:52 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso67322525e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:52:52 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 s20-20020a05600c45d400b0040e395cd20bsm73267wmo.7.2024.01.24.07.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:52:52 -0800 (PST)
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
X-Inumbo-ID: a1ea03d1-bad0-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706111572; x=1706716372; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2v0Mu6nlvp9WWHwblCnMv7pR1mMRQLcj5g6YjRP3i3A=;
        b=Vkv44fXiCxwLkKCn4/Iws4EuX8sNMYMaYrx3txTZVd/9GdWxRZ+s2sxTCY7+VUMCtP
         VLkarhg36k1Bi9kHyFTkeuVq7ydG3iYSc4JhKxng2zcN/tXrHD3MX0z6WjoeQqvRHEyL
         RObZ1NX93M7vq6CBH7HsszOT8Nj4odaWONYCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706111572; x=1706716372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2v0Mu6nlvp9WWHwblCnMv7pR1mMRQLcj5g6YjRP3i3A=;
        b=o/+4dz8iY7UYcz1wnL5RNCrjJR4jFkPjpi9K89atRbkKWOPWtZRirSe/n0CYhuJS/g
         llLAzrjDUv9SBlbQWGWzuN97C62dIfUeLTl6a6DlpCFNKknM8zhsorbOiZZ891tgJkat
         DcJDiVylN9hMe/ROEzGVYSHwFBI7xTuYpK2EhCDJYmguufqEM0WRYS52sYophZqOobMB
         9WXF+SIbQUuITIj5UUv/7Il3dgEhPnOIZbd98EhWgy1699b69Fl+pfSve9gWyNu4cpgY
         rcvyuj8pBPhOU8/JtSpg1fyt0F7docK+zztmH5h0hDPKo5/6xMsBk/v96PrlgRFkek0X
         KY8Q==
X-Gm-Message-State: AOJu0Yzcua/KlPA+95indBwXUTRuNCkHkT9mVUw7GPvcDQ1Vn82O2HA9
	N+AbyKlZyNW7czg1DbK9CILSyf/Auj3nNgY8fF3ldrJNScI6zHUHc52o3eEnDaI=
X-Google-Smtp-Source: AGHT+IH7ydDx2XrVAOAnYntZsJ+axrNFsWPMJ7nBfGCN7x+/HNZ/5KbagEfkNpGVBhwW3tE6iTak6w==
X-Received: by 2002:a05:600c:4c19:b0:40e:509b:4bcd with SMTP id d25-20020a05600c4c1900b0040e509b4bcdmr875755wmp.375.1706111572348;
        Wed, 24 Jan 2024 07:52:52 -0800 (PST)
Date: Wed, 24 Jan 2024 16:52:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/NMI: refine "watchdog stuck" log message
Message-ID: <ZbEyU4HQjYG7biii@macbook>
References: <87108f1d-4b13-4c1e-9432-4f14d4f5c12d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87108f1d-4b13-4c1e-9432-4f14d4f5c12d@suse.com>

On Wed, Jan 24, 2024 at 04:21:24PM +0100, Jan Beulich wrote:
> Observing
> 
> "Testing NMI watchdog on all CPUs: 0 stuck"
> 
> it felt like it's not quite right, but I still read it as "no CPU stuck;
> all good", when really the system suffered from what 6bdb965178bb
> ("x86/intel: ensure Global Performance Counter Control is setup
> correctly") works around. Convert this to
> 
> "Testing NMI watchdog on all CPUs: {0} stuck"

To make this even more obvious, maybe it could be prefixed with "error":

"Testing NMI watchdog on all CPUs: error {0} stuck"

Hm, albeit I don't like it that much

> 
> or, with multiple CPUs having an issue, e.g.
> 
> "Testing NMI watchdog on all CPUs: {0,40} stuck"
> 
> to make more obvious that a lone number is not a count of CPUs.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> In principle "sep" could also fulfill the job of "ok"; it felt to me as
> if this may not be liked very much, though.

I think I prefer it the current way.

Thanks, Roger.

