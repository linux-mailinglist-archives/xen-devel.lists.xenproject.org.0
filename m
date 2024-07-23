Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBDE9399D4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 08:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762628.1172843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW98E-00013Q-Oz; Tue, 23 Jul 2024 06:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762628.1172843; Tue, 23 Jul 2024 06:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW98E-00010p-Lf; Tue, 23 Jul 2024 06:36:18 +0000
Received: by outflank-mailman (input) for mailman id 762628;
 Tue, 23 Jul 2024 06:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sW98D-0000zJ-PU
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 06:36:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc5bff3f-48bd-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 08:36:15 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so25690275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 23:36:15 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a94c30sm186095845e9.47.2024.07.22.23.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 23:36:14 -0700 (PDT)
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
X-Inumbo-ID: dc5bff3f-48bd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721716575; x=1722321375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZsEviKFG3wTW1BzdmZxS8T6IyNpfu8fyNZg8X0k2a0=;
        b=RT88ItpRJPekiNEFlVFtZA8ZPoccYKtxfz4ztfVSJ4JVKs2HrTPZg1LW/HiJ6ay6KA
         VgboPt79plA5Ulg6cjGPJ9J1a7Mz0rtXbKXkQ5CEu1JRgRYyIItRMiTQ33RhwCa2eVvm
         oxzFdsszc80B1Cw+UITL1agFKR3M/ij6YksmzQSGNxaZNc5IgSW7Zcp6QJv4EdiCIOJa
         IyaZTktPzH+0QlAMww2YVJwQ6S7m7+FdrOFSpoqJmhpKiCnDZMp5z9No7l9nF4/l28BG
         kX/OtFu2Wlhyy/Md9LDSB1ZOPi4IHei1xrQwp/86oGxDOS8Q3+vbfzeUVB7e87bJMi2C
         Ka7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721716575; x=1722321375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZsEviKFG3wTW1BzdmZxS8T6IyNpfu8fyNZg8X0k2a0=;
        b=LS86AX8j4uM0cd2A5IqY1ttk8RDcIySCPK9CAJdbKjoGVGQ1qi2qebMg2WNYKvFkPA
         aIedDMMDHXVExGYaYAadcssVovFAPyhH8izRCcidO2ra9NrFzrWix8PoQJ5Opn2qg00X
         oXo9EX2tXUJ/ZFr0wxcuZyGg8NPM3L88+7zBG10U3L25knxYb6/bizn893FmTdgk/g6c
         8347QIXITidM18tSVQb5Z9tbeywDFHD/Kqyr8/EpdPxG8QNmcGitu+2Rqg/2tu5zQo+T
         z6u+3SwuETyYoVMsL7va1+rYfxaz+9BrCfF6abqEhHWVtWJCjI+PDBJep8M1Bdc9W0e4
         0qQw==
X-Forwarded-Encrypted: i=1; AJvYcCUPUemF/albR3n/pp/OyGyqOblaFAVU6nEuXCPC9pSNcHXFsDLj6lyoROe5btiS/fqCBVXp/2zBc/PFvpPmZxSLcIy94RRa/mHU56H3niQ=
X-Gm-Message-State: AOJu0YyM+LPfbphFVtmJ3PoDABAv5r/5NUsbAP3o1F5eNceXGG5imC4X
	5U4kozhPMnf5pPxRc+KgGEoN3+MH6gAdaRiGwLXGC16ET48RlJkARao1G/ixLl5qJW5naldeD3t
	K
X-Google-Smtp-Source: AGHT+IFN3fahd1hwRSpW0sk1Yg2dTUOzpPenu6V5gXlgFatZeJpbcGMNoAGO+hQTOB77LHTvlfdqBg==
X-Received: by 2002:a05:600c:4694:b0:426:5b19:d2b3 with SMTP id 5b1f17b1804b1-427ef3a8937mr6548375e9.14.1721716575048;
        Mon, 22 Jul 2024 23:36:15 -0700 (PDT)
Message-ID: <884d746c-47e4-4d0f-87a9-e2a03d2a3286@suse.com>
Date: Tue, 23 Jul 2024 08:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mini-os: remove sanity_check()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-5-jgross@suse.com>
 <20240722213544.hjyohnoz4mtcfltr@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240722213544.hjyohnoz4mtcfltr@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.07.24 23:35, Samuel Thibault wrote:
> Juergen Gross, le lun. 22 juil. 2024 17:01:41 +0200, a ecrit:
>> Remove the sanity_check() function, as it is used nowhere.
>>
>> Since any application linked with Mini-OS can't call sanity_check()
>> either (there is no EXPORT_SYMBOL for it), there is zero chance of
>> breaking any use case.
> 
> Don't we still want to keep it around, at least as formal documentation
> of the expected status of the list?

Hmm, is it really worth the extra code?

There are 2 ASSERT()s I'm deleting: one testing the allocation bitmap
to match the comment further up:

/*
  * ALLOCATION BITMAP
  *  One bit per page of memory. Bit set => page is allocated.
  */

And the other one testing the linked lists being correct, which IMO
doesn't need any further documentation.


Juergen

