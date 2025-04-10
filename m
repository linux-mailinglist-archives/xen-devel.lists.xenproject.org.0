Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14473A83EE2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945113.1343376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oJo-0002zA-4j; Thu, 10 Apr 2025 09:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945113.1343376; Thu, 10 Apr 2025 09:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oJo-0002w0-1s; Thu, 10 Apr 2025 09:35:32 +0000
Received: by outflank-mailman (input) for mailman id 945113;
 Thu, 10 Apr 2025 09:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2oJm-0002vs-BV
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:35:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23e025fb-15ef-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:35:29 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-399749152b4so237796f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:35:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdf3bsm4133990f8f.83.2025.04.10.02.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:35:28 -0700 (PDT)
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
X-Inumbo-ID: 23e025fb-15ef-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744277729; x=1744882529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SW4Ik/wV4z/V5OEQf+s0ow10uVY0kYF6K9B8ww7eMD0=;
        b=k15DCjLcxjgzL0fnbRTXNzyzu8zi84OMRtEy1fMvZWq4KGD5fRICOQyAHzwDSTGf44
         oqHUAqGqjx+ZnV6jmtgz/GuVPER4b5cF7KgcXrUsLz8JoaQJKmz+Jzf6A/SRY4u/GS9E
         yqnACsXRwUaYWXtlIYkkw15rb7V/jVML/i7AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277729; x=1744882529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW4Ik/wV4z/V5OEQf+s0ow10uVY0kYF6K9B8ww7eMD0=;
        b=LHmXFbVQj0QNR5vnJXoE4t3JH8vMjKAiOzWx3nFPfe04JcRk8hpFyGIfSj1imO6emq
         kKljSQOoNaZDnPYiP/MSixXqrLGRZQjya9oeLDRS8NRwCYgfP+w3Ou2+Bfzq5DKl5OaI
         Wz7APzoZi0ahRfCSF6EnLzcdT37z+0JR4hJcidd1yLBzGnXCu4X6EiBHPong0FaF9l3J
         3ytqrXWqHH5cK2H4bEmxNqKagVNESHGoacYzOFqRCdoNYzq3OXNwlWhRjLOs+gqsEyEe
         R8M87yBMzbX5Dioujzp+gTp5BgG2td15oJnoW2bNkmgTVKXWk8C4pzcbK5iVWGaih3gQ
         n8hg==
X-Gm-Message-State: AOJu0Yxf3U7oQWM5SZbaLOvfW33YqwthtqSTBZ2PErikI8bLWDWwMCjn
	CP54Be9btgv8yGI6gK0D4IW78I2zFW/SEdhq9oDOWjB9vJ6Ndbj5nPcn2ONTxjs=
X-Gm-Gg: ASbGncvyw8ShOk2kc/cegXgdv2MDARoS/2Tkgf2j6ThIFflG/ElpuBFprUkCAvQ2qHA
	NjCo1Ch4hVlK/u895ltp2TI785IXv9QLvEQy9tbz/b9mVwRNnWq80AQEdd+t7DBJa2ppxI+JvLX
	Oksg2+4t4yvkCLSSN35cVtUK38rOisvWtKSWOVRcTz9+HKbsFbqv4kLXgahtMhQ9hzJKHHL0EUb
	cZBLEBF9J8eVgZOtVeVUQLrDeElH9wCsf6QtKlAzeU1/9fitJt6iJgFwp/keGkpMSn0bR5dc1IS
	Dq/pVzSQvPGB28kqqcNjGeddo3Zyf8NomCRQ9hgRHcWLoD8Odh8krckyjtf6QgqcmQbdUbRPBRB
	JOKzmZg==
X-Google-Smtp-Source: AGHT+IFFAl/14o92Zmo3bXPV6LuunUDfSA8a0XSTE1s/v39muvzzlQR54qlDKHOofFAAFrfsz+DZ1A==
X-Received: by 2002:a05:6000:381:b0:391:4231:40a with SMTP id ffacd0b85a97d-39d8f474c13mr1745867f8f.33.1744277728741;
        Thu, 10 Apr 2025 02:35:28 -0700 (PDT)
Message-ID: <a065d9fc-e0ff-4f02-9baf-24ee6a25338a@citrix.com>
Date: Thu, 10 Apr 2025 10:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] Port containerise
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-3-andrew.cooper3@citrix.com> <Z_eQfmVjH5Z4TQ5K@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_eQfmVjH5Z4TQ5K@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 10:33 am, Anthony PERARD wrote:
> On Wed, Apr 09, 2025 at 05:36:56PM +0100, Andrew Cooper wrote:
>> +BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
>> +case "_${CONTAINER}" in
>> +    _alpine-x86_64-base) CONTAINER="${BASE}/alpine:x86_64-base" ;;
> There's no "images/alpine/x86_64-base.dockerfile" in the repo, do you
> mean "alpine:x86_64-rootfs" instead?

Yes and no.  I'm renaming the containers, but haven't posted that part
of the series yet.

This wants to go back to rootfs in the short term.

~Andrew

