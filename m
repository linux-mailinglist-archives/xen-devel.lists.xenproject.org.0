Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE693F8FF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766886.1177434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRug-0007Kh-8M; Mon, 29 Jul 2024 15:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766886.1177434; Mon, 29 Jul 2024 15:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRug-0007GH-5U; Mon, 29 Jul 2024 15:03:50 +0000
Received: by outflank-mailman (input) for mailman id 766886;
 Mon, 29 Jul 2024 15:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtVC=O5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sYRue-0006eV-Qx
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:03:48 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c215cb5f-4dbb-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 17:03:48 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7abf92f57bso476391766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:03:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab22ffcsm527202666b.12.2024.07.29.08.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:03:47 -0700 (PDT)
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
X-Inumbo-ID: c215cb5f-4dbb-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722265428; x=1722870228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9yvEDyX53YGg23DSo2/GlutdHQD1gV8kYZOT5EPEzE=;
        b=F24rJA8NEIaz8Z5pXP1+lhl5tu3WnkANbiudwzXwkkYc5huYdgOBnUsrxDMH8yQ9tQ
         qReCzy0Bai5cvE1SMmApr386odf/dv0fyGnfLatsJvCXhqVgJQmCcQ6y4GVqWcrOaIlP
         ORRpLyF6lph89IW86F7R+L+x871S+1QZbNA6MQZWYQDuTdpCgf4CH1VrENHG7pGr9xVM
         ceFnofrpYh1y+25nGMjaHO/O8W+RmHVzP3ETBovHi1x/v2g9x2mR7cTaRyIBxJVJzoUd
         y7lIurcfSKV1uVzAALVSWdXQBS89/nyUa/5UcR8z0ElivYKgqorXZmirUa3BrhIlpCND
         6rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265428; x=1722870228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9yvEDyX53YGg23DSo2/GlutdHQD1gV8kYZOT5EPEzE=;
        b=eyZayETAhkawyBV/CppF3mVBuDkFWWEkIPNMustuegrI9nRk0tMBOEJWMzRL+Db+Cs
         DG+S5FNXjmNXwCanJxOKDUIaP55ex46Vkhfk6cPyWhMWKi1utYne3rwF2Du0bSboGPem
         BiGsLL/gzc0B6CsLytfa3TWjE9zLOmaqkqebO9QE98bp/LmhCKrcK+ZB9UlphFMzMrHy
         A6VRGYq9yE57EXfKdupnNKCjSJBbldNsORbr6hgDkr7jrFsJt5IuVvCEH2snt9vt1gL+
         boxV2YpD0bYMBFcZahQYT9rdJdJ0uk3dizbZTvQvYv9Q47BYCadueLqaWHAPb8Mim/6R
         lb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXxshQV0RuGg/SpQQP03/h7X6M4iqO7o6gRiYPbOLWKdJt7NHH80ZJo2F1pZXA/XJVwMzgZTfZ+IFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdDL+dv6pUfYvyL9i8DHUKVCNc4xj+cPngAW8nPW8K0lrT24Bc
	Z3osJFy4ybl+WsZtQ7bOckE0YWUj7jdYF58EePMM8NhkoECvzrbVcVrg55jxNMI=
X-Google-Smtp-Source: AGHT+IGaY7wvRrbE2uT53l17q+geoEIGqr0rBezVhy9b7P+tbOxmLf0itgEUVet7+9VhXHCXASLUHg==
X-Received: by 2002:a17:906:ee85:b0:a72:9d25:8ad3 with SMTP id a640c23a62f3a-a7d3ff58047mr493046766b.9.1722265427389;
        Mon, 29 Jul 2024 08:03:47 -0700 (PDT)
Message-ID: <b49f76cb-f22e-498e-83ae-68cc9840c48d@suse.com>
Date: Mon, 29 Jul 2024 17:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen: silence maybe-unitialized warning
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-3-stewart.hildebrand@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240729142421.137283-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.07.24 16:24, Stewart Hildebrand wrote:
> When building with gcc with -finstrument-functions, optimization level
> -O1, CONFIG_HYPFS=y and # CONFIG_HAS_SCHED_GRANULARITY is not set, the
> the following build warning (error) is encountered:
> 
> common/sched/cpupool.c: In function ‘cpupool_gran_write’:
> common/sched/cpupool.c:1220:26: error: ‘gran’ may be used uninitialized [-Werror=maybe-uninitialized]
>   1220 |                      0 : cpupool_check_granularity(gran);
>        |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> common/sched/cpupool.c:1207:21: note: ‘gran’ declared here
>   1207 |     enum sched_gran gran;
>        |                     ^~~~
> 
> This is a false positive. Silence the warning (error) by initializing
> the variable.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


