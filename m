Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6D69311F7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 12:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758812.1168307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIcW-0004Xm-2i; Mon, 15 Jul 2024 10:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758812.1168307; Mon, 15 Jul 2024 10:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIcV-0004Vn-Vi; Mon, 15 Jul 2024 10:07:47 +0000
Received: by outflank-mailman (input) for mailman id 758812;
 Mon, 15 Jul 2024 10:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTIcU-0004Vg-E4
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 10:07:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 149ef05e-4292-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 12:07:45 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77cc73d35fso883233966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 03:07:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24a770c3sm3166007a12.20.2024.07.15.03.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 03:07:44 -0700 (PDT)
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
X-Inumbo-ID: 149ef05e-4292-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721038064; x=1721642864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pVIXYrBZNPykrKTTCOhgq/O6z5wgGsql0rTfogkg8A8=;
        b=Ys0kNfVitqvqvB6ZIGyyAnC3FsJuNr3BilyQJDgZXbOxk1J85X/uugWoWuYPxMH3LL
         W+P+q5nPveU/7I1OjljuhrH37u3SkypvmwQEgL9mGDBLfv2EKyp5NvxzOAQJ2862mm0w
         ohaTNJPlc9X9NRGXcCmxf9Lx3rkElIScub6lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721038064; x=1721642864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVIXYrBZNPykrKTTCOhgq/O6z5wgGsql0rTfogkg8A8=;
        b=iYRyzgpVxgBAyxXiaYlxLDXXD5EQ+y71QzCXM+nWvUV8WhVUUwBgHBfTCHzSujIGZn
         n6twVGl0EKoKgAmv1bElviYuIJes4HTGqe0pRE8tzp2ZlacMtwwa8necH/BIopq+tCgd
         o6q7IK0ZpSwtSQXKhgrLrK1LIYbZwVwH7RFKqW55zwbRESUR8tdtI3bAt1ydnyf6YObz
         CimPUrwQ7f3bVq2bzBUdVIBRdKw/ehsNJrM8LSg9b3SsPNDkHjPHlfRj01h+5oRUT+Px
         VhhoJeEPN5H7xy/3EoO0oo44EcPlAXmbfcw0xMmOcfHOapqPTT5dAw2gtuI1t9LVIVVZ
         C/KA==
X-Forwarded-Encrypted: i=1; AJvYcCXhdctYew82i9Hx8W9sJp6/QnBJfRQ0/Dfr1gx5unLPyopbmxMxAEenFZKauGxt6gaK0VXj3MmsJspDP7Re+cynGoKDRDKbnQ2RB/30Q9w=
X-Gm-Message-State: AOJu0YwS10sabQzUtuBfzNmiJ1jjrJ9hLnJ+V6WuO7Ei3Ei/0EEXWC4v
	TyeVK7orxXbrDRuEpzcjcUN4AUhgyDZxSeWXkTUZa5IDbe1MIsxC39ifO/4Si6RZF3JlrX9yExe
	I
X-Google-Smtp-Source: AGHT+IHXbrjH5xLOZsdcIcyF29uaIhil1r3utWfjHcA3y/E4zfn7GMMv01w8VoRsfZfaupXk0bzCtQ==
X-Received: by 2002:a17:907:7e8b:b0:a6f:a2aa:a4c7 with SMTP id a640c23a62f3a-a799cc26313mr861354566b.3.1721038064558;
        Mon, 15 Jul 2024 03:07:44 -0700 (PDT)
Message-ID: <4cf46d24-2e21-4909-b1f4-fd6757801101@citrix.com>
Date: Mon, 15 Jul 2024 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: systemd units are not installed in 4.19.0-rc2 anymore
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ZpHqR4e3VaFAXC3m@mail-itl>
 <94d0ef92-9fb8-4097-a633-59f1190434c4@citrix.com>
 <1057f937-da16-415f-a760-ac4f00bc29f3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1057f937-da16-415f-a760-ac4f00bc29f3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/07/2024 9:11 am, Jan Beulich wrote:
> On 13.07.2024 15:02, Andrew Cooper wrote:
>> On 13/07/2024 3:45 am, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> Something has changed between -rc1 and -rc2 that systemd units are not
>>> installed anymore by default.
>>>
>>> Reproducer: 
>>>
>>>     ./configure --prefix=/usr
>>>     make dist-tools
>>>     ls dist/install/usr/lib/systemd/system
>>>
>>> It does work, if I pass --enable-systemd to ./configure.
>>>
>>> My guess is the actual change is earlier, specifically 6ef4fa1e7fe7
>>> "tools: (Actually) drop libsystemd as a dependency", but configure was
>>> regenerated only later. But TBH, I don't fully understand interaction
>>> between those m4 macros...
>> Between -rc1 and -rc2 was 7cc95f41669d
>>
>> That regenerated the existing configure scripts with Autoconf 2.71, vs
>> 2.69 previously.
>>
>> Glancing through again, I can't spot anything that looks relevant.
>>
>>
>> 6ef4fa1e7fe7 for systemd itself was regenerated, and I had to go out of
>> my way to get autoconf 2.69 to do it.
> Yet was it correct for that commit to wholesale drop
> AX_CHECK_SYSTEMD_ENABLE_AVAILABLE? That's, afaics, the only place where
> $systemd would have been set to y in the absence of --enable-systemd.

Hmm.

Yes it was right to drop that, because the whole purpose of the change
was to break the dependency with systemd.

Thereafter, looking for systemd in the build environment is a bogus
heuristic, and certainly one which would go wrong in XenServer's build
system where the Mock chroot strictly has only the declared dependencies.

I see two options.

1) Activate Systemd by default on Linux now (as it's basically free), or
2) Update CHANGELOG to note this behaviour

Personally I think 2 is the better option, because we don't special case
the other init systems.

~Andrew

