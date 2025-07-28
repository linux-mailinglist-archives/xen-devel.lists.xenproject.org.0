Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E79B142B8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 22:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061927.1427532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUCc-0001gl-1Y; Mon, 28 Jul 2025 20:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061927.1427532; Mon, 28 Jul 2025 20:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugUCb-0001e8-Uc; Mon, 28 Jul 2025 20:12:05 +0000
Received: by outflank-mailman (input) for mailman id 1061927;
 Mon, 28 Jul 2025 20:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugUCa-0001e2-Fu
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 20:12:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2086c9c6-6bef-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 22:12:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45610582d07so31503285e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 13:12:03 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587abc13b3sm114309965e9.6.2025.07.28.13.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 13:12:02 -0700 (PDT)
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
X-Inumbo-ID: 2086c9c6-6bef-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753733523; x=1754338323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G/o7SB7Eeo8wWsOroQAsJptUfW8VvC55WnR1nJlUiiA=;
        b=VlXM6StmZQcL9Dig59OBvbCkZHmD9A4E3ItplKfEQrEr8Wf9Uj/qRGsFMP/OMdWip3
         f3WeKvvbzNA78RDoW6ZfAd2KpTWP5tzNeYeN6HnUv8ozuw7IxJUUFuLvYn5rmC9kcsMw
         OWxqGLmQIdIgJYAEcpDpBh2D2HDxs4QsgzlKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733523; x=1754338323;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/o7SB7Eeo8wWsOroQAsJptUfW8VvC55WnR1nJlUiiA=;
        b=jS20dvxFAuA29cGpsUp0X1ANgGSQIWP5e6Enx2S1RlM+V4p2hCx4fecex14fEOvK8V
         aJaBsvo9lSw2TsyTv+TSSZp2+Fb2Jc6iy3BLYPxNECzfkJIMFUU9wvGmbLrcJ1XXZNVe
         2No7uExlYAlEenZlZbg135qd3yL5LFImrsQr8xxPLQfvCeumjIsWbxaPcdNdfjNYEO3l
         RR1ilgma47aM1bHoHBWkuKziijOCWDeWlnxvJpVbZ2lDvgnZBvGMiIuLiAVjQbXugKjc
         XBXh5zo9/QiE+6L+j+FwoksCi/LWOTHLg/bSBZVRml6RBGsB+SC2EmPHHlPB6Cwe5CMl
         VWEg==
X-Forwarded-Encrypted: i=1; AJvYcCWbW3M0bgbK7M2M8uYrM+q/2E4tIFPo9hraO3d/7R9vR0q1tESbymhvZS+rgNBTxaMq4dg6WtHZODk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbjkf5iA/UrIaRUdMswdl7OIyy9MKhp/7s/MG5qk0OUe8w+5jr
	Kn5S1IEmzl7uiKBFut7cdUvy2A3bQDblPi7B9eiGTv4gBzkwRQjU6g9ouYNqGIn0KDo=
X-Gm-Gg: ASbGncvT24Q9Bp0UI9kNeAZU54/9wMYJ8upPL40FFmpt3XgY4PeJSx/7urbDBU1s5iw
	zzdmCBvo2okZ/ufKr2jU33M+qPuxfBQTi3ewrvb/yJqz9oW+Y68qxVpAZ+4+eKvrAToDRL45j8S
	KgIN+PKad0UM6Mz4JKwl35ULoUZjt4CoZxsbvSVIMqtYnIXPEpVcuiAelWNb7QYic7xKRiFS7kl
	ZBBvQ3axtUkQ1lrXtA2Dh2eB1MPVol7N285besc0rWjAu5ckWgaMfnNJFjN2fqSj97VqLPyDva6
	3MkmpjC17BKcp0uANis0mmCitNikDev7JqhenrAtBOXzXnrWnFLydtT6rZgJG/FQT3hSRhH2MLP
	vyMYMRQqsh5ugDBa0WRlyu8DUSETrwBOpcuTmywWnMvJqk2IHTFuPgOKwW9htUU5lL8gW
X-Google-Smtp-Source: AGHT+IH1+kHc2rG7XUFZ65eyr2d8rUHq8s1MhOcePuRLJjS+pnJWv3JnHINCFxvj4eMoBO2Ru0bFKw==
X-Received: by 2002:a05:600c:1992:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-45876554b45mr127542235e9.30.1753733523059;
        Mon, 28 Jul 2025 13:12:03 -0700 (PDT)
Message-ID: <65d17206-b6bc-4dc8-92f4-ccdf10315329@citrix.com>
Date: Mon, 28 Jul 2025 21:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix memory leak on error in vcpu_create
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250728195245.90356-1-stewart.hildebrand@amd.com>
 <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 9:09 pm, Andrew Cooper wrote:
> On 28/07/2025 8:52 pm, Stewart Hildebrand wrote:
>> In vcpu_create after scheduler data is allocated, if
>> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
>> resulting in a memory leak. Correct the label.
>>
>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Urgh, sorry for breaking this.  Ultimately it comes from having two
> different error handling schemes.
>
> This patch is probably ok to start with (and to backport), but a better
> fix would be to handle sched and wq in vcpu_teardown().  That way we get
> a single failure path that does the correct thing irrespective.
>
> An unrelated observation, but there's a waitqueue vcpu allocated in the
> common path, but I was under the impression that only x86 had any need
> for wqv (and I still need to get around to fixing introspection so we
> can drop wait.c entirely).

P.S. we allocate full wqv for idle CPUs, and they definitely do not need
it on any architecture.  Looks like there's some low hanging fruit here too.

~Andrew

