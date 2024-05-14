Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE38C5463
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 13:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721435.1124835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qgS-0003QL-ND; Tue, 14 May 2024 11:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721435.1124835; Tue, 14 May 2024 11:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qgS-0003OG-KV; Tue, 14 May 2024 11:51:04 +0000
Received: by outflank-mailman (input) for mailman id 721435;
 Tue, 14 May 2024 11:51:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6qgR-0003OA-Vg
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 11:51:03 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bc89039-11e8-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 13:51:01 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3c999d53e04so2410911b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 04:51:01 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792db4083c1sm245330085a.76.2024.05.14.04.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 04:50:59 -0700 (PDT)
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
X-Inumbo-ID: 3bc89039-11e8-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715687460; x=1716292260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aDL66rKh/a2veKVvyvn4d1xqXs8dntitr9GgFylNT+I=;
        b=ZlYMYvM5E7VNqV3FbhSScO5/NKSue5KD7srXUMjub1VIIX8haErliC5aE5rzCfiMhv
         i/QqrJcVopGRWa+WCTcuJxGZxeR9q/I5k1p1DJEtchipT2d0kY619zC4na5w61V7t2Tr
         sl6xokKyOicJVRRBSxp3Jp2rlz3U92fE5FHcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715687460; x=1716292260;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDL66rKh/a2veKVvyvn4d1xqXs8dntitr9GgFylNT+I=;
        b=CIX6m+W/LP1j9OVliY/+6BcYVIhgBXs+aK55+OhgX36buqMC/b8hloUtMwR1uIdE0G
         JB3jegj14Jfx8gGmX/MNtV3dmZSwNs4zGYxe6n47XK0ZmZmo+wgckZwpsuUJrSKxqEI0
         ho2RLSVM+E0gxH8TgmMP4R/2EItRIk81HPVYe7HY9WR2+kg3FqFw2Lm6lKJ2vJjaVjOa
         UxT+KdLWgZy9QgFrX/pwsxIp2dtghxKz78CNUg3uDd940+0MWbRBE5Xh5g6ZqCHezULL
         mr7+mh29VVjjt6uGaNKQ0OIe6+0qUE2+JSJ8QoDM7JT9qSUp0pI/QfyOxUbZ+VOfbkoj
         PIIg==
X-Forwarded-Encrypted: i=1; AJvYcCXbWiU3vBpDdKIqOutVXeyvuoWlCYykOxHSK905pHc6JQVrguKsOe3y6XqivA4/Xau4/0k8PiZdNynMdbdk1G+aNQpf0PRoXqyIiz3wAIk=
X-Gm-Message-State: AOJu0YycN7Wa+QJ6kWN5fEn1iMJim9NrhF/tekgz7G1rEjrn6aVxyaTH
	2188Lri+QN9QnLYcAjiys966WsqQXD9Wll5R0vxaecSqLbSkEnfJ0crzdQUkZYI=
X-Google-Smtp-Source: AGHT+IHQBr8J9M8C6o+w7iF8iqRimFJfh6Db9MyBa3OYWwHK10kzK+T4rEtIVNOlcCA5j0pv9/7Zkw==
X-Received: by 2002:a05:6808:4193:b0:3c7:a4d:d54d with SMTP id 5614622812f47-3c99704881bmr13929579b6e.15.1715687459877;
        Tue, 14 May 2024 04:50:59 -0700 (PDT)
Message-ID: <34214222-1fe3-41a7-9017-412347654e66@citrix.com>
Date: Tue, 14 May 2024 12:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240513085925.59324-1-roger.pau@citrix.com>
 <2d245c04-3bf9-4b9d-ad02-e754dcbefa28@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2d245c04-3bf9-4b9d-ad02-e754dcbefa28@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 12:09 pm, Andrew Cooper wrote:
> On 13/05/2024 9:59 am, Roger Pau Monne wrote:
>> There's no point in forcing a system wide update of the MTRRs on all processors
>> when there are no changes to be propagated.  On AP startup it's only the AP
>> that needs to write the system wide MTRR values in order to match the rest of
>> the already online CPUs.
>>
>> We have occasionally seen the watchdog trigger during `xen-hptool cpu-online`
>> in one Intel Cascade Lake box with 448 CPUs due to the re-setting of the MTRRs
>> on all the CPUs in the system.
>>
>> While there adjust the comment to clarify why the system-wide resetting of the
>> MTRR registers is not needed for the purposes of mtrr_ap_init().
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> For consideration for 4.19: it's a bugfix of a rare instance of the watchdog
>> triggering, but it's also a good performance improvement when performing
>> cpu-online.
>>
>> Hopefully runtime changes to MTRR will affect a single MSR at a time, lowering
>> the chance of the watchdog triggering due to the system-wide resetting of the
>> range.
> "Runtime" changes will only be during dom0 boot, if at all, but yes - it
> is restricted to a single MTRR at a time.
>
> It's XENPF_{add,del,read}_memtype, but it's only used by Classic Linux. 
> PVOps only issues read_memtype.
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Having stared at the manuals, I expect the reason this is intermittent
even with dedicated testing is because on SMM entry, CR0.CD/NW are
specifically unmodified.

Therefore, an SMI hitting the critical region will proceed at a glacial
pace.

But it does occur to me that the rendezvous is a plain rendezvous, which
means it will also be taking NMIs because of the watchdog at 2Hz, and
those will be glacial too.

A further optimisation would be to not disable caches if there are no
updates to make.  This will be the overwhelming common case in general,
and 100% case on CPU hot{un,}plug, but as it is, getting rid of the
unnecessary rendezvous is still a massive improvement.

~Andrew

