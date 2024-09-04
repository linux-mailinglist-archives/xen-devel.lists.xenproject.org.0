Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E8396B794
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789994.1199687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmnP-0004d4-TD; Wed, 04 Sep 2024 09:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789994.1199687; Wed, 04 Sep 2024 09:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmnP-0004b4-QL; Wed, 04 Sep 2024 09:59:27 +0000
Received: by outflank-mailman (input) for mailman id 789994;
 Wed, 04 Sep 2024 09:59:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slmnO-0004ay-Mz
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:59:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0cd622-6aa4-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 11:59:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a869f6ce2b9so687927266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:59:25 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c24sm782579266b.196.2024.09.04.02.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:59:24 -0700 (PDT)
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
X-Inumbo-ID: 5e0cd622-6aa4-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725443965; x=1726048765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln5JB6RKCbw2M/9bLlP669YGn2BUJ85uD6S9vZPMuRs=;
        b=Ikjhjhx/VotMlmNlT1VuhtT3DE/pPMni6iAK0oLzOcCVF0w8BH5xomlDQ+Lh39Mf6h
         yj7MdT+OyWfgoAPyagBwysP+CaKTBbLScADSMTMrbioUy0Q8OwrWn33IqHUyvWioyJR5
         NY7VW19C0JRvCqoCC7himVXxO8dJI2AIpAx1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443965; x=1726048765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln5JB6RKCbw2M/9bLlP669YGn2BUJ85uD6S9vZPMuRs=;
        b=KRLi0mIdwvsWA17LIlkALX8Yyg6AA+JA7oVJkEXsb6+iyeDbJyvQ3q6Q4+ffB6Qo1C
         DGvOufErUpCzfTgU1Redo+8FDzor2EirkiJnqi2PMcPv6NA/1Gjm8Nqq1MLaJpEybAvQ
         xy5b2heIk5Dug9uc6N/0e5q+83lDys0rr/O6K6xKI+eZUibdLDiRv3xdylXPn2j85U+N
         /uIJR+2c1jdmigkZGrmjk8YkvdcITOHKx4kWfUzYbcZMLGbxXSPliluIRrZ+PXrpus2p
         tdUTRAAEWvq7HH/34LtxwCa1lAe1eIusZp+pNuEJ+LtOrg2G6nt21GHWfSyzvWUBDFyY
         r2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVnlrL8HmBQJy6kFtS/7hC8aGKrHeHctbD+1VwRGjWrMnhsm6tEdYfVUBMCB1IwtK2+RMa9LZ3FRFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN8h0rYWviYop91s57bD1KwDCURdLus55WEt5vDfB/kqOB+VVV
	CKKQIy5SEnZH9cNJDVt4l/t8vY5IocNgxJwbNIEiFZGVrG2OOMFqdkxtcqFIbKQ=
X-Google-Smtp-Source: AGHT+IGCSjZNwXbSCsKB9a5Vg9/IziPU+A7EgWHlNSSNZm4WyWh+qUVRPEa3FgOaqfTR6ixyPTzO1w==
X-Received: by 2002:a17:907:2d9e:b0:a86:8368:860a with SMTP id a640c23a62f3a-a8a32edcf75mr277915266b.35.1725443964720;
        Wed, 04 Sep 2024 02:59:24 -0700 (PDT)
Message-ID: <291083ba-7480-4cfa-90c4-997f83c7a3a9@citrix.com>
Date: Wed, 4 Sep 2024 10:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mktarball: only archive Xen
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony@xenproject.org>
References: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2024 4:10 pm, Jan Beulich wrote:
> As was basically decided already a while ago, remove - in the simplest
> possible way - the archiving of both qemu-s and mini-os from tarball
> generation.
>
> With this the subtree-force-update-all prereq isn't needed anymore in
> the top level Makefile. That goal, including the respective ones
> underneath tools/, then also are unreferenced and hence are being
> dropped, too.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is the simplistic approach; I'm sure this could now be done quite a
> bit more efficiently. I also expect there's no longer a need to run
> ./configure ahead of the invocation of this script, but since I have no
> idea why it was needed earlier on, I'm not removing that here from the
> doc. IOW all cleanup that's probably better done separately, by someone
> actually using all of that machinery.
> ---
> v3: Drop subtree-force-update-all rules from underneath tools/.
> v2: Drop subtree-force-update-all prereqs from ./Makefile.

Removing the archiving is one thing, and we have agreed that's a good
thing to do.

However, the makefile rules might be used manually.  While we have the
other trees cloned in Xen, I'd be wary about dropping the rules.

I guess the real question is how long we expect this interim state to last.

SeaBIOS and iPXE could disappear right away; there's nothing xen-local
there at all.

OVMF doesn't have anything xen-local, but there's a bit of complexity
setting up a Xen build IIRC.

Qemu-upstream won't be going anywhere until a) a release of Xen with
stabilised hypercalls, b) a release of Qemu after that

~Andrew

