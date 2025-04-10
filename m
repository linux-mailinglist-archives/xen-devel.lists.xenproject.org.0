Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A677A83FBC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945182.1343425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ogs-0002v0-TI; Thu, 10 Apr 2025 09:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945182.1343425; Thu, 10 Apr 2025 09:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ogs-0002t1-Pb; Thu, 10 Apr 2025 09:59:22 +0000
Received: by outflank-mailman (input) for mailman id 945182;
 Thu, 10 Apr 2025 09:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2ogr-0002sv-Rl
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:59:21 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76808008-15f2-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 11:59:16 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so4969615e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:59:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a83esm4212132f8f.47.2025.04.10.02.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:59:15 -0700 (PDT)
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
X-Inumbo-ID: 76808008-15f2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744279155; x=1744883955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=18ZEjGNY5mJeNBXc1ft6OMaKW0sKAkG+uD9c51PQmRk=;
        b=FQsTSseMYPTNNxo2bRsoNWPNUvqx/BUbJHrGuIV4RIFG1MRFPi8sAnMk5T0ieprxje
         ofst+9TLTL0hjlzPIUAQxnmeTE08LSw9kjXofnChr8+i6ORzWms3S0rdZV4F6LiyBCw4
         HeDsXm8ua3gpOj/QSAWFOzqh6dRJ9Yo0+XnBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279155; x=1744883955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18ZEjGNY5mJeNBXc1ft6OMaKW0sKAkG+uD9c51PQmRk=;
        b=OdOnigO8K8TptRNyWxjG9Hkg2hFMI4bpwPehPwfhb1OOgvDOBeZ0N4qFiOlUI4L6cC
         BLQVvEZ417bm2LXKWc3HROx2NKvs9hsJg1ohy4W8SpcPXjhLNP2mrXjmuDU2AYAXTL+b
         P5/UDZNBv/QmcMWZkBTNtvK3afTGuUr7G2eOm0/WNTEShjH7SLGt+zr1PKM9NnN4hXTE
         qyUBx5OKhck5/Z5eZhpcF7m6F3tAjJgZWV52WA/SQQBXW0u6EC4gLKJ9qocolaIhB7YZ
         YC5HnxVoCVQqekb5kmauH60hnqoVKuXJNYfWv9RoDkGgxOdCVydNsHINZvp3RYWLQseO
         DItw==
X-Gm-Message-State: AOJu0YwIy2Mxfy+8EioV9w1Cjpn7KM8iu80pRnWHtamiOBHqOSxAtXmI
	MgT7+GV1dYDelKsQRlY3jISSiaH0VM2sXKtBJ05O0HUDkG/VW3g4Cb69AvAwoo+YOq5qfIvgUD4
	iaPw=
X-Gm-Gg: ASbGncv0UCaNgeui3NT366Ykxi9EcJEd8HxxEOgoWg6a9I1EN9uwy55Oqy7ieOnXwsp
	WnKAsYS87ti5UjaZ3akpJQ/PPkJlPecihBugdYEJgWPuca8hsKacme7p5lLlN3EvYIMxzhDiAg3
	vetgy1zABwxd/0CfOOLmqHku6UyI04YIndKITQI9Zc5jFt1CZgjVchsHmB/b5b55oi2CVrJNDp/
	fvO3QIiIO1DOGTNAXyucf4ndcUk7Ew0eyYwIPAJAEzusay4ttZxHBSAFmbW/M5pCwHGdCSVS4PN
	upr7rDye0Es+X7CCn8d2ATSQRXzY4rnyu14OoimD0EtYi0zrXGt0NWaRMO9z/vrTkOgxTuaLJ8K
	WdKGMmg==
X-Google-Smtp-Source: AGHT+IFEZJBVM2Zfz2WH+uR1rMRCFxYZQevPe7XN8vhK2qa2UeljyTUiPlD7kUQWhuLpseMMnfvhRw==
X-Received: by 2002:a05:600c:c3:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-43f33ca05eamr6686455e9.11.1744279155591;
        Thu, 10 Apr 2025 02:59:15 -0700 (PDT)
Message-ID: <c9c1090c-1ed5-46a8-bf5b-440367b1d553@citrix.com>
Date: Thu, 10 Apr 2025 10:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] Infrastructure for arm64 linux builds
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-8-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250409163702.2037301-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2025 5:37 pm, Andrew Cooper wrote:
> diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
> new file mode 100644
> index 000000000000..c76ac435e8dd
> --- /dev/null
> +++ b/images/alpine/3.18-arm64-build.dockerfile
> @@ -0,0 +1,27 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/arm64/v8 alpine:3.18
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +RUN apk --no-cache add bash
> +
> +RUN bash -ex <<EOF
> +      adduser -D user --shell bash
> +
> +      DEPS=(# Base environment
> +            musl-dev
> +            build-base
> +            curl

It turns out we don't need musl-dev.  build-base depends on libc-dev
which musl-dev provides.  This was a bad dependency brought across from
the form we have in xen.git right now.

~Andrew

