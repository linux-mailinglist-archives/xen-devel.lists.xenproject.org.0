Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD2996BB4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814491.1228059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWcM-0005tS-Gh; Wed, 09 Oct 2024 13:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814491.1228059; Wed, 09 Oct 2024 13:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWcM-0005r9-E3; Wed, 09 Oct 2024 13:20:42 +0000
Received: by outflank-mailman (input) for mailman id 814491;
 Wed, 09 Oct 2024 13:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XgrK=RF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syWcL-0005r3-0b
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:20:41 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46c9b883-8641-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 15:20:39 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so9418032a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:20:39 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9949c54efdsm507455166b.60.2024.10.09.06.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 06:20:38 -0700 (PDT)
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
X-Inumbo-ID: 46c9b883-8641-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728480038; x=1729084838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wOsNSigtz0hhZv3+Htt0LvedX7W4FVMiSdYS+/0R6oM=;
        b=YHN5QWiM0FHbxwqCpmzLWdBoI+N5dlfhvAU4cYS8J6mYlo1E08UFsG0XZfsgolJH/S
         3vP++cW8eIRWz4ReqqhfXkO0t7zcoxWLbWx6loAzrGcGt3PSs0WECWjuAbJbjiUUqWg/
         9cZ0mkhimVrfznrAo+qXWkVATQ0BuBDPERvSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728480038; x=1729084838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOsNSigtz0hhZv3+Htt0LvedX7W4FVMiSdYS+/0R6oM=;
        b=Eheyp2xp7/k7h44/nsgSMW62IgDV4h0l0nupE2fUMFiJVTdQql83+o0ZiNAQyfuVg9
         UoK5LYGISz2sVQ4FFtjGSBq2dlayXqh7/G4BMHgYEsFJRasZUdmrfoovCEwrb6KXh8xq
         ockjJj/EnirhuBubD6ANtcx7YjqpuVlIMwaYZQdPrBgvNqjuRv/XDRzpcrADgoNnm6mv
         5LiCKd6KGGlzJoJsKRfoRyXoB/AgurOHdxuz+bsD8CvKoUgasZ+ZAr5P7BOmk14+soXb
         wzmme0UIcKPSyTDbNeqCCORkpiCucC0L3NvkOeh1So57+WyXeANbmmfrLAXtm9p0Do9q
         dEEA==
X-Forwarded-Encrypted: i=1; AJvYcCVoYmnsgQ+pXfCoh82kFL7oT0RT5Ch5VlyvIdkoa0zn6SkTjzEf0rx4PVM8S5nVPq4lhK/s/F4wqtY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzECAq81VSOkmSOGI6H+lqqPiRxWcQGX6t/9oyNS+92LadTNP34
	vo8/vu6qHXKAhlcWn7VJn53L5angq2KOx71V5QzPiU2BX66CXez1ppaaap81595VRWPxHYSPu/r
	9wLs=
X-Google-Smtp-Source: AGHT+IFLwy6WSDUK5rWV8LdzCcMXGAti9QDrsAPN7anoVnlyzcNTcR56P4cPvJe3+TyO78nGwyPTog==
X-Received: by 2002:a17:906:d265:b0:a86:c1ff:c973 with SMTP id a640c23a62f3a-a998d314beamr237038766b.47.1728480038547;
        Wed, 09 Oct 2024 06:20:38 -0700 (PDT)
Message-ID: <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
Date: Wed, 9 Oct 2024 14:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] byteorder: replace __u16
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2024 10:21 am, Jan Beulich wrote:
> In {big,little}_endian.h the changes are entirely mechanical, except for
> dealing with casting away of const from pointers-to-const on lines
> touched anyway.
>
> In swab.h the casting of constants is done away with as well - I simply
> don't see what the respective comment is concerned about in our
> environment (sizeof(int) >= 4, sizeof(long) >= {4,8} depending on
> architecture, sizeof(long long) >= 8). The comment is certainly relevant
> in more general cases. Excess parentheses are dropped as well,
> ___swab16()'s local variable is renamed, and __arch__swab16()'s is
> dropped as being redundant with ___swab16()'s.
>
> With that no uses of the type remain, so it moves to linux-compat.h.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm unconvinced of the need of the separate ___constant_swab16(). I'm
> also unconvinced of the need for said constants (that even had casts on
> them).

There is a still-good series deleting the whole of byteorder/ and
replacing it with a few-hundred line single header.

It is the second thing stalled on a governance change (prohibited
reasons to object to a change) which clearly no-one gives a damn about
fixing.  In fact double spite because it denied a good engineer his
first changes in Xen.


I don't particularly feel like trying to polish byteorder.  I'm inclined
to rebase+repost Lin's patches, at which point the majority of this
series simply disappears.

~Andrew

