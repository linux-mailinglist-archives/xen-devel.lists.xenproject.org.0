Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D1B99A67
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 13:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129361.1469356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1O0j-0005S1-DJ; Wed, 24 Sep 2025 11:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129361.1469356; Wed, 24 Sep 2025 11:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1O0j-0005PT-A6; Wed, 24 Sep 2025 11:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1129361;
 Wed, 24 Sep 2025 11:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUMG=4D=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v1O0i-0005PG-07
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 11:50:12 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fd85506-993c-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 13:50:11 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e1e318f58so17202605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 04:50:11 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac5basm35884395e9.7.2025.09.24.04.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 04:50:09 -0700 (PDT)
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
X-Inumbo-ID: 9fd85506-993c-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1758714610; x=1759319410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w4NUC+z63X17U9VukrJh/ccZd6HBxfTIkH8sGzGx5f0=;
        b=TRfCaJ9hZV6H0eQwtVHwvef94UeVOpwLRgUSsASHbFG9LUJMaIjjRomv3wklIbP/qV
         GtOr3O11moZCtcEs5rONXGC0RJCfjCViNfn0K0tJA2VhHiwetOnsAQFdSHN27Lz9DqUr
         4ztM3kHKmB/TqJ8NThRKQJs+YDYWoLDIPqQiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714610; x=1759319410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4NUC+z63X17U9VukrJh/ccZd6HBxfTIkH8sGzGx5f0=;
        b=jN2eWVOEMldt2gAHbkQwWkystSDw0g5eW8f3naEuuhdjvsauWCfkHv2wXQDId2eZRE
         N8o00Tpn8Mw0dIawzV7tAxtsLICPQ9QpPatxG8oq10ZAQ/GDaMMi7bsA9GU6rZ4swU5w
         bnoVfSnI2BgjpbqB802cdn/yxJ4PCrHNyG9o/euLmffhobMJCLRf2UyQbjJJUn86ew0P
         wyhmGmBC6rmkscJ5XExFSEvj5OO6uB+/PzQWhQK6QkahU89JO+Wb4j0W3mjYgEPp6Ggp
         zk1Z4sU49JiB31Cs4r502FvMBbnudl2jcLjL7yTIgP9B+/k4OvcBeQE3HgQq9EN5Y0xx
         T4HA==
X-Forwarded-Encrypted: i=1; AJvYcCU8FmcB++BHt493+4ttD08GCRJ3iMGv2meOVWzLrBRjwSGzFVnzn7BD1KPLSBMHYDT4i3NQJMks1wY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrC0aN7OOQdhMVfmgFdskXxdHwAgxW7OLT8fB6MC0nwfssxSMw
	AuU8Ab0AOd0ns5dE18Zew3DotlNYccSZn/vdJX3RrIdbDLWUboRcwGgZqm+kmTksoaY=
X-Gm-Gg: ASbGncv7QJCwrsOb5WRZ7YOk0JJHHA6/7qB5Mwowz1S7m/bd6rsBOcPDo7Du4ikIDg6
	OAaVrISb9LG2/ORRVfk1sJk1MgDqKc0wIDqdsJwHEwplmzwDP3kab/CT4GPhRrG4foq8X+PFW6R
	Iu3Wy2X/LXSojkrtPki1YYuRudh/DVtG8n0f1+/z0IgcaQRqnK94blICl/+yCEwllP31IOsHRZN
	zkodtFNVIK3lzm2tzpcZ1bkWz//Pv5eJr+RgESvyLv2TPuMZ+8KRtkvgG7aEUF2CoXMuBJcv5VK
	ABEhLPDZnoHO3/ZOosRsBclozPUnZmCPrGPR0JA7Lsj+J6jPm0XPo2vHVg5Q0s8tsFqiEX6iFdU
	ifCUEpwgXN2TTYL41CpBQ80GDTFfwjJ6FV7VH39x11dXCa6f/n1ZWJuacnxATsXZl9C4k
X-Google-Smtp-Source: AGHT+IHgx3vivsXPC3nEl5EvQKu276zSNzNPLu04iQtOsxUzKjcliAZOzbj+64dlkAlS2tIKkVeb0w==
X-Received: by 2002:a05:600c:1ca5:b0:468:9798:2043 with SMTP id 5b1f17b1804b1-46e1dabf75bmr70088985e9.26.1758714610245;
        Wed, 24 Sep 2025 04:50:10 -0700 (PDT)
Message-ID: <ffc1067c-677d-4277-b56f-a63ba2fe4d06@citrix.com>
Date: Wed, 24 Sep 2025 12:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250924110051.2160-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250924110051.2160-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2025 4:00 am, Roger Pau Monne wrote:
> Otherwise the check for the SS feature in
> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
> X86_FEATURE_XEN_SELFSNOOP never being set.
>
> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
> identify_cpu(), because SS detection uses boot_cpu_data.

Doesn't this, mean ...

>   However that
> creates an imbalance on the state of the BSP versus the APs in the
> identify_cpu() code.
>
> I've opted for the less controversial solution of populating FEATURESET_1d
> in generic_identify(), as the value is already there.  The same is done for
> the AMD faulting probe code.
>
> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

... this Fixes tag is incorrect?

~Andrew

