Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D83B20157
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077028.1438118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNYr-0005EN-9Y; Mon, 11 Aug 2025 08:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077028.1438118; Mon, 11 Aug 2025 08:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNYr-0005CJ-6D; Mon, 11 Aug 2025 08:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1077028;
 Mon, 11 Aug 2025 08:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulNYq-0005By-BV
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:07:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 319612f7-768a-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 10:07:15 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so2451301f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:07:15 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bd5a1148sm211018735e9.0.2025.08.11.01.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:07:14 -0700 (PDT)
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
X-Inumbo-ID: 319612f7-768a-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754899635; x=1755504435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KyGxyNxuALVI3DPa+y6OngNu8v1cFKDSX5qh3gQ1d0A=;
        b=ZrcnAyOM9LP+nxVUoufBBHmqj++NwgfHIpWPxEoGWKkoStzZasSqsatE87Tujjr3jT
         AIVu5ci9P3a2t6pRUFjM5G2Cll/a45MOUlGSJnIy4Q8/OQJ60I+AXM9jwGLc/xTisr/w
         mkITgkJSpOz+uel0nvVzGvcoHApJbJM6Zw8EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899635; x=1755504435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyGxyNxuALVI3DPa+y6OngNu8v1cFKDSX5qh3gQ1d0A=;
        b=pHv0z4ISy18FfWBgfyKOQYN0k82FhbWU+dJE2VgGSMhK8zQO96ABgfhvcysKWgwmFz
         CrH8oR9/5XaaFattvrq+XFB2WyGM0EvtD7FvieQrprBNoEZYLwwSGUupQp9OYe5cAZj7
         xANZERaGZSjzPvblXvCthxEoMRGjzNtcYfOwymO41HD1WIwVd+pxX7E7UVqXuG3dbbvB
         +kfpu6nO2ZEK4YKO0q5Zhe852cliuq02pRsoGviBK8r4fC1aw41bUwj/PmWU/nhyQVMu
         Rx90jOLQhWi7cg/Ps8l09QAgc3EWJodbJsVF66aLIvXYNv8+EMvAAke9EIiuhMTJQCpG
         NGQg==
X-Forwarded-Encrypted: i=1; AJvYcCUe1u6xKUun7c0CVRZu9NCD5wPoH3zdfS+niKt6i9J4P1DKzDuUGL1HGF+5OHrSBPRR0lQnTNoI9VY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyR4vDOBNm8CaEoN8cpjsx9pax7+qMbsjmPNroVsczJe8AGgKUv
	qa9heldjZW05q/vQ9nvwQ5N5HQ4mN7l0nP3vGaNjPNWeSARWXstFkAgorwBY7R+s9wk=
X-Gm-Gg: ASbGncu3oHnJBP3NWw6c1ojc55dz/Tu0Eu2uBp0TlNsso5fPCO8p9KUjiuzMy8qapXV
	+eX9srrB7It3jku2X+bSQA9HEnPHz4WKK8J2iFId3Q5J0Tec4mkINqBYdIooJbfrlec0v0828Ui
	Xfh1osX/lynJi4p7Vp6Sk69n9n38xqbe+2n4GZ44NrW4yqsyUZKt9+rGhkZ4TunTtDtdXibjMxH
	VSE+JwKA69ec1l6FFSI45xyXwRIwW2kHv+BnGRmzeF+SwxwXsTrZV4S3F51M0+QMVBQ+5EkyhSc
	hEZ842Fub69WShaYgvh6qaojC+pdSxaKNFWGlPTZGULohG7dUJ/ro527GmETnd8JMr6pjjND0az
	tZNCh1qDvBzyL4sN2yUL9zHV5Rv1aQ8zErMP1rUQWYg+ntD6CyLPs3lmaZxxFuNgXBy25
X-Google-Smtp-Source: AGHT+IFH+ZjHQHMjtWu9N06NWC7TyPc82GMPGor/CjsDKzM/y6qGOAT+vL8+FxxrzZqFTR0AblOzIQ==
X-Received: by 2002:a5d:5886:0:b0:3b7:94c6:865e with SMTP id ffacd0b85a97d-3b900b50436mr9393421f8f.30.1754899635286;
        Mon, 11 Aug 2025 01:07:15 -0700 (PDT)
Message-ID: <96b878a1-2a4e-4df3-900c-a2b2142f0638@citrix.com>
Date: Mon, 11 Aug 2025 09:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: Drop logic for old clang versions.
To: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e8bb42876317c19aca79f81c3fc48dc3a4fdaf71.1754830862.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/08/2025 2:03 pm, nicola.vetrini@gmail.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> The enforced toolchain baseline for clang is version 11,
> therefore this logic is effectively dead code.
>
> No functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>

Thanks for the patch, but your From and SoB lines don't match.  Which is
it supposed to be?

~Andrew

