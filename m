Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AF4B09517
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 21:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047320.1417773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUSh-0007KU-Lj; Thu, 17 Jul 2025 19:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047320.1417773; Thu, 17 Jul 2025 19:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUSh-0007IX-Hs; Thu, 17 Jul 2025 19:40:11 +0000
Received: by outflank-mailman (input) for mailman id 1047320;
 Thu, 17 Jul 2025 19:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucUSf-0006MA-Tw
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 19:40:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8fe23f1-6345-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 21:40:09 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso906690f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 12:40:09 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc217esm21009571f8f.28.2025.07.17.12.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 12:40:08 -0700 (PDT)
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
X-Inumbo-ID: d8fe23f1-6345-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752781209; x=1753386009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7SGu8sScKWjwxprwWcJT6UHhn8sIffCVVOcDz7Ab8uQ=;
        b=Dn1sNYOASENJJmzHPFYc6c9idY1VxjTsUzQQyOU5JJeLV5B/vwSYd01dhviugvoINq
         6SMcK86SmYrIWEjjWVEqdA3PiOTqUHJd/025QlcUABWsX8cP2vRUJ/dmCx8QkYd5mIlE
         6a7j+vXo9gwtpAyun2zY9SVouyfjqSr06nZDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752781209; x=1753386009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SGu8sScKWjwxprwWcJT6UHhn8sIffCVVOcDz7Ab8uQ=;
        b=wu2/pqqEBTW/aWG3gWqRBbYE3NlGEEKLf8MmW1AJT/a8PGdE1fve1mTDWw2akeGWjf
         FF9CW2ojpxXslrzIQjKh+dfIVQnYOfaMDnUOhsbSiUWTbEoD1HmYG7TZX4Inhjr9TVhZ
         1TqBgTbJM+NMraWoxGa3AikQyBv2QTuvVgV4QS8hgaWrtjQc9nrckdJFdH4csRelAm9h
         hKNR7qwWOTuJA5xS0itOsgTKZbcaxhbsViEBsDBnZQkH172dKSBpDZuEouy0hof3wwr4
         7QVfgJAyzO+ILKv98Dy7RjphOxRDB5Gn0lVkQJfhzEY1hzZ+ZW9uSIKooU2BI0yyc0cv
         /bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1UafFsSiU0ZC/vhHjZJME/SSUHsb0A8CVPfjvoFWrwZrxG2WiPD24LrdZDYBBVaSdrk5sMUgHIr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi8Iy681Xn0I7VaWclbilb5PnKI0Kgt3wcrMUxIvhxUaaiZAWV
	u/ajaBjdVGskpR40L2SMKvRfkbdYBGziCC3Ajw1MZ6IYZptqbWqQNvfgR0BredkfgXc=
X-Gm-Gg: ASbGncuGvlcqVhGUAH2Ng9IvrKXzTlBXCcFIFsu2X/rK54fNJOaIxZO3l+wPXfgrDzq
	n3sPJvtF1N8MFvBaljJuaGYnLYr9lhJ9xRroLY0Fy5tDRF1PUr+q43SpwgW4k5ZsDKw0RSlRr12
	U/sA0wR43dNhhj5RzRT4NH8KiUKVNBFPPq7pn3YRbs3tEhM8mYTPEKsb+OJcjSNlSXmv+YxD/G5
	9c143S/J4kJ8I3zZSokw83A3ZytvcU/cq8m9qAM2uvJbmAEQuPMtHrN1C8bse4k/1NVFzA1pNHj
	uno+UijmPu5arT7BzWWLu3BvohvR/rYyQT/Urajk4POCrVj9EMuff2SnKovLqlOzrLB7D7pV5gP
	pZieVUW8GAQrt+ipCAR9kVkDO36Nvb5Uo9QunQF+ryfP0TRmSKuLGZplywwjf6vd6ydNR
X-Google-Smtp-Source: AGHT+IF6gQLlgY6hvjLboZWN/l4D0fwi6k0L7ijGRbQzDmYjynVKiIh0H/q5YrDXrtKXdD9VlXlgew==
X-Received: by 2002:a5d:64c7:0:b0:3b5:dc2a:ee74 with SMTP id ffacd0b85a97d-3b60e4d2a46mr6720685f8f.24.1752781208887;
        Thu, 17 Jul 2025 12:40:08 -0700 (PDT)
Message-ID: <e036fdd9-790c-4842-b0c0-aae81fd143c7@citrix.com>
Date: Thu, 17 Jul 2025 20:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/apic: Convert the TSC deadline errata table to
 X86_MATCH_*()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <c057b1a5-ebcc-4691-affa-3a32ebf637ec@suse.com>
 <f708a816-dfa7-4ce9-b590-9802ea5f8b20@citrix.com>
 <238fb250-b0bc-4572-85e9-71bbd2a940d8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <238fb250-b0bc-4572-85e9-71bbd2a940d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 10:33 am, Jan Beulich wrote:
> On 17.07.2025 11:02, Andrew Cooper wrote:
>> On 17/07/2025 9:26 am, Jan Beulich wrote:
>>> On 16.07.2025 19:31, Andrew Cooper wrote:
>>>> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
>>>> helper to match a specific stepping, and use it to rework deadline_match[].
>>> I'm fine with the patch in principle, but I wonder how you envision to support
>>> a match for multiple steppings in one go then. In particular macro-naming-wise.
>> The Linux version uses
>>
>> X86_MATCH_VFM_STEPS(vfm, min_step, max_step, data)
> Hmm, yes, something like that (naming-wise at least) may be possible to use.
> It'll be potentially a little confusing, but I guess we'll manage. Or maybe ...
>
>> and calls GENMASK(min_step, max_step) but for a single stepping that
>> causes rows which look like:
>>
>> X86_MATCH_VFM_STEPS(INTEL_HASWELL_X,   0x2, 0x2, 0x3a), /* EP */
>>
>>
>> Even in Linux, there are very few examples which take a genuine range,
>> and nothing so far that we need in Xen, so I implemented a slightly
>> different helper.
> ... we get away without ever needing such.

We will want it in order to convert spec_ctrl.c

~Andrew

