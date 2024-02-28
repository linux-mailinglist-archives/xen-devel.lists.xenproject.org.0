Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824CA86ACE4
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686481.1068588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfI14-0001rN-Ld; Wed, 28 Feb 2024 11:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686481.1068588; Wed, 28 Feb 2024 11:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfI14-0001p4-IT; Wed, 28 Feb 2024 11:22:26 +0000
Received: by outflank-mailman (input) for mailman id 686481;
 Wed, 28 Feb 2024 11:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfI13-0001oy-2Z
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:22:25 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a9c252-d62b-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 12:22:23 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so802009866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 03:22:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qh16-20020a170906ecb000b00a432777eb77sm1741836ejb.60.2024.02.28.03.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 03:22:22 -0800 (PST)
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
X-Inumbo-ID: a4a9c252-d62b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709119342; x=1709724142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzRSwln9kYqqayC627UbGURKm6ipG9CKJ/VFEG1KIPs=;
        b=bDPO6lm/TxcU1uXQI/O1kcN1HfVkG8ItVCt2PtuKnDiaC8riwEaekrasVKjcKAhWNp
         OS5apRcPfNFFBglldbfsQqyf0Wtfwf3zL81eL/BM/kn8Kt9gRhF1VL/Fg7QMrJjpTQCJ
         k7wRlFClmO8bj88mn6LPI438cBWnoSRDLiUmV1cfmAtVW6xDyve84dhuSj36JyPi0LBo
         alLcGoQIQswARt1BkNhEAD4IOwkUwQKzAGz5rx+bVBJ7hZ+KupnQvQqF1VH54HKjn/c8
         hAw0Z1EAMCXKYilG/B6dSuwup9Nz5/Vp8+b7Gq+UJC0lmznPteiXFckANdFehqO/AARV
         hhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709119342; x=1709724142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzRSwln9kYqqayC627UbGURKm6ipG9CKJ/VFEG1KIPs=;
        b=oNnT12wN6HWNL1eFfCDjB/Ajv4fV2ILIu/rUgAVqOt0QDb1uktZ47yM2KIgWwZ4w9V
         JvDUWUQi2mpROOimjfqDpNB0g54v6moJC3NyYNRtq5zC2RE0r3dxnPsGIgykPBLmn1Dw
         rwb+5uSeEZ17CG+KbHvQH8teg7tYk+/N/4x0j7djod8WZ3REeeMZS6AwqQVXPRKivJg5
         j5vri7pzJNNqsr2GcgFdO34BRXe7vAuGlcSwtthbzqeQc4JBNpwvTkmJidikvnGiPmz+
         2Gr3md7FyUYt5e1689+EvGzw9jONQXa/3+ywc7TzgsplEdVGG7oufe7XBUawfI3nGbsd
         2zRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOTvGEsewcJaWMXxiaDIjBvZXC+1Z6wPLXCjhbNLE08maQTuTjoyWhfu1mU8cmG9GfTQCwC7fldapfs2RJOW3Y3SCbx/m0Ah133HPhYJc=
X-Gm-Message-State: AOJu0YxJsCkQdHLybp+qhwGeLhFFXeYDk5b6wIHPaw8PF5QV7tFXba2x
	5BEHN6H29Y0Bc1Fe9+4ntXlyXzkQ4TjhQK/YAUWJoS957bXyYqVOZ7df4b8KoA==
X-Google-Smtp-Source: AGHT+IG10w+skdRKBQ2QKEtAWWQCWmBWo23p9FB0pkd1PJo6V8FxSZFSE757BUrQ/y7+61VFkEATaw==
X-Received: by 2002:a17:907:119b:b0:a38:916e:a4fe with SMTP id uz27-20020a170907119b00b00a38916ea4femr8551978ejb.39.1709119342655;
        Wed, 28 Feb 2024 03:22:22 -0800 (PST)
Message-ID: <52f536db-782d-4805-906a-2934b289b997@suse.com>
Date: Wed, 28 Feb 2024 12:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Julien Grall <julien@xen.org>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
 <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
 <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
 <61bdcfc51c4d6ad81949f1f4d84593e1@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <61bdcfc51c4d6ad81949f1f4d84593e1@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 12:06, Nicola Vetrini wrote:
> On 2024-02-27 13:47, Jan Beulich wrote:
>> On 27.02.2024 12:52, Julien Grall wrote:
>>> Do you have another proposal? As Stefano said, we adopted the rule 
>>> 17.7.
>>> So we know need a solution to address it.
>>
>> One possibility that was circulated while discussing was to add (void)
>> casts. I'm not a huge fan of those, but between the two options that
>> might be the lesser evil. We also use funny (should I say ugly)
>> workarounds in a few cases where we have __must_check but still want
>> to not really handle the return value in certain cases. Given there are
>> example in the code base, extending use of such constructs is certainly
>> also something that may want considering.
> 
> Can you point out some of these constructs, just to get an idea of what 
> that might look like?

Grep for __must_check used in comments.

Jan

