Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE3BC5494
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 15:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139706.1474962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UZT-0003zF-LS; Wed, 08 Oct 2025 13:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139706.1474962; Wed, 08 Oct 2025 13:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UZT-0003x6-Ih; Wed, 08 Oct 2025 13:51:11 +0000
Received: by outflank-mailman (input) for mailman id 1139706;
 Wed, 08 Oct 2025 13:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6UZS-0003wM-0r
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 13:51:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d766d029-a44d-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 15:51:08 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3783199f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 06:51:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c49sm30257978f8f.3.2025.10.08.06.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 06:51:07 -0700 (PDT)
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
X-Inumbo-ID: d766d029-a44d-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759931467; x=1760536267; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YB5qGXq/xuFxITrZOMOJ4YfVsgdc2LJPG3/gdY9qhk=;
        b=imzLm3hd/VvJA2mYetwWjupfh7CeCKEJZZQ1geQuyjUQ3ecvisDl0roTpgElua0Q1d
         jZay4dG01t6AP6G7INtEe5VDwpl7mZJvMzaWjnHowpHnbo8Yj8OYNbKKua2TiqVRCiAL
         RNHxDJH/uQHmOvMIpRuT3QNtcFDJWABVRu8g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759931467; x=1760536267;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YB5qGXq/xuFxITrZOMOJ4YfVsgdc2LJPG3/gdY9qhk=;
        b=sEptOs47C+GPdpiOQ5GDut+qMCVq4vrYsxqRpG8K/2nqjdNYOIK3Zga+Ff0SJqCGQc
         M+Zno3yVV8pmpKBLV8XGObtANQR2KbwEUzowToUtnq63uJW72vsFrxl4PhlLlqqYPK1s
         dMc7hsgW2PKokBNKK79LvYCHtL6qBNDALxjwGb+buVBiAaacx5/JQuSgtCtc3cAFFbcf
         lhhRoe7yDBtEHdkKQ4d6F3M72J6Rw8RgAmDbZxIVwKRxAALBlmNTh0Z5zUvNUnbaH18n
         9mkXJNgYx7nGFrYd3n2RwWxLrtNydGSsbrYlQfs5K9t6mLcp2JdUEUIZp/99084LkzL5
         yj4A==
X-Gm-Message-State: AOJu0Yxfx1b8T85NNZ0ToyTSC4CHtZv++RWP5lERMtwv6VMgxc5RVSXt
	HHNxLwaq6l8YFqaiVNEM36YfFyTXHlJwoirlCvjsSNCGwpnWpyS6f+nhflIWbUoq6qYnSzohlkL
	COR12ACK4qw==
X-Gm-Gg: ASbGncvmrXnr2nsuUCb4onbGMAGzN+MRwFWPKnN2amUemfr0MubZk+8WBWS3tenpTFU
	A+wjYW2eW7/6026crTGpMZxfx3re96STFt/9pRaUh9AgyeljtgWWGXqe7xYQlohyqWqwjRnxp1V
	FjFqHoHjWE76NWGKW5vTzJtFbNhUqi4hgWDQCazhQ+msAIbHZ4aFgZQclD3ZQweUAaVWCWqTOq9
	/PXTj0+xPKs+An5AqXXNz3/klZjQtLI7ac06Oz+ujcne59rLW/h2ABWVXzYM85O+rZE2qQf1mza
	r2ecInZabOeYQXzAP6vI/LXAI2fiXgbL9deYHPHnRkcNVJDX0lfr2O/dCkqG50uOfDXbs0BYpkD
	enZDd1dVU0VgBuelTYU0cnVKqJbQKhFpcPBKyWsoloTLQFyUP2DAehBus/nY+AvVUz2iGQc+7IA
	yMdZY2uOwbLgWT
X-Google-Smtp-Source: AGHT+IGD3+A0qGBotLIY9PDsBKb4xctFQWN941pyjEVEyJFK5ejKGb9H60fUt4Xpd6FhDqGn1pPWEA==
X-Received: by 2002:a05:6000:2c0e:b0:3ec:de3c:c56 with SMTP id ffacd0b85a97d-42667177c79mr2294107f8f.16.1759931467471;
        Wed, 08 Oct 2025 06:51:07 -0700 (PDT)
Message-ID: <d2974179-0d3b-4bc7-a034-dd6f865e4ea1@citrix.com>
Date: Wed, 8 Oct 2025 14:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: ./configure default for systemd
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

(Related to my "Linux xenfs vs privcmd" email, if anyone was wondering
why I ended up playing with systemd manually)

It turns out that when you build on a systemd-enabled system, you still
need to explicitly --enable-systemd to get a working debball.

This is contrary to most other behaviours which are active by default if
the preconditions are met.  In this case there are no preconditions -
it's just a bunch of text files being processed and written out into the
proper directory structure.

I think we want to do something better by default here.

~Andrew

