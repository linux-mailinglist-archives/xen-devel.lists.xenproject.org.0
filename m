Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894DEC5778D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161268.1489255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWgp-0000Ps-Fn; Thu, 13 Nov 2025 12:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161268.1489255; Thu, 13 Nov 2025 12:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWgp-0000OO-CB; Thu, 13 Nov 2025 12:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1161268;
 Thu, 13 Nov 2025 12:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWgn-0000OI-PY
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:44:37 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8248fffe-c08e-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:44:35 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640b4a52950so1113685a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:44:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f880fsm1418163a12.11.2025.11.13.04.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:44:34 -0800 (PST)
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
X-Inumbo-ID: 8248fffe-c08e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763037875; x=1763642675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FmKMyhmQFzN+FQ9PkM/1vwTn38LjX4jHXFc36N4k6pc=;
        b=GEF204LERKVq63w9cbGsIibJPRR4fWp9Dd7ahn4A33/n0pwnbOz3Sh3QmIF31I1w5W
         a+EWrq2Sf5224vzRcFBTrqOmq2hireX5IzFb0/yTmPY52gNYxFTEbn0S/YFOZjhf69ge
         0vBhq33Yx7HBKm3RLsIXmbF2+tdfR9iIIL9H52/QSnNj2MtvlRLyJ9KKmnkrrGVSxMPX
         4/tAHcLYUv6ANw3uQTTUQRPTJZz2Slk6cRZixyjATspCN1+ZayI3050bPR/Tr99SMLjs
         wdQSQ7umPzi4pvLqpDTaQPY8xeNIi9jRkw1pCjPF+l75dDm+FJQk0n31+i90xH7F8Fsm
         SCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763037875; x=1763642675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmKMyhmQFzN+FQ9PkM/1vwTn38LjX4jHXFc36N4k6pc=;
        b=ZcuDxvO460UCoB5z7Fnm7/hG4k9uyfz6Nx+OzM+BCN3RH9HbLXXphh1jvHKu6wjVnj
         KSHkIPu8O1a7yQT410qzC+oNLyKa5wQcBK8Zv7YQI7q/hJ4jxjUf0Bs9T+6So4leEXls
         bQI6W3pK6IbCXpMtY+mDEoPOgHj318i7A4mI8pS0PSEMeJE8aCyoLUfFekxous+7XCsp
         8dvJ07PanSX0DLmEGANVLjzGcer9aLEXoGs7KpPR0aFDtxX+pNfM5wLKhZzqMFBgoUpE
         UrYYfNUFOclaAN6hv4ek6X0CfI7W2sdXsdI4d8GCW2RXNjt/uncCwUwzZHGHiCtW7WEo
         sKCA==
X-Forwarded-Encrypted: i=1; AJvYcCU0qeXj9lHQGlAqB+7nX5qsSJMHKTOyWpyC8/GnARp9YIKnh3O3Bt2E5XOzUuK3tT5TrY+kdKoOyvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT6kt324NFnpCpk8TZptvJr2GDEUO+uNjo6Cb1qU3HAnh5PI1k
	CQPNTs216Ajb82SVggKh8DGmItZTFOsnzCz/F1TotaschXlKT3+hYPJYgE4cUrFzdQ==
X-Gm-Gg: ASbGncsp51OIl7Nq+OY48NKoZodva6pBYSIY5yVIfHPmuJmt/1JnVaP7h5bjffPkPcp
	wODo424AYQklDkHyGG9lrCBgq7XgZ9YJrYYa0dXZCn43vTWLTCAK5qOVGRMPTmoLDrH+3YWu+38
	UjMCH7aPMVaQqhFzQXq6EUpL9FCWPbNmpLm2gFqoE2vzvDCS1vcLI2mQB554NPgHnvRHHe8rZ/B
	1B0/vtnjylh36hXcjj3WCd3B1adUvXNKME7yUtPs3JE5NgM5duuH8rPldz7dWoYDwgIYeRtfWvK
	8vuJ+o3yfhsilMC/lh+G/Hqne5hHGQMWVWUzqzaUKULElWDa3dGOS03ww7rV0IG9j7Ayh1acFye
	S710sKnFIU3fJuCqEjJwHn/8VVMov+5XSapHC+9tmnaiMT1HOtBbXqbVhSHdBY7cVddXiCAlAob
	SkBW3Ge7esO4z2DUujXSHWyrWMBoC52kUaMzuLhiUj6ZBLW44NTuyUqlBTiBAJgFdH
X-Google-Smtp-Source: AGHT+IE5dC99nSM/w/m2Lac3OCA6tnlKJhzNNliWY+Dd/dWSbKVTS9N4OlkBqwKSfkwd9OR64jLGAQ==
X-Received: by 2002:a05:6402:1e94:b0:63c:4537:75c0 with SMTP id 4fb4d7f45d1cf-6431a57e1c1mr6515560a12.38.1763037874656;
        Thu, 13 Nov 2025 04:44:34 -0800 (PST)
Message-ID: <77ff68f1-55dc-4b9b-a40a-ee17cbbeaf09@suse.com>
Date: Thu, 13 Nov 2025 13:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Rewrite the Tagging and Branching checklist
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251112185402.209485-1-andrew.cooper3@citrix.com>
 <9a949edb-8eb8-4984-adf0-4ab8b82e64db@suse.com>
 <88523cc6-d069-4384-a5c2-e4399e389a41@citrix.com>
Content-Language: en-US
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
In-Reply-To: <88523cc6-d069-4384-a5c2-e4399e389a41@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 13:28, Andrew Cooper wrote:
> On 13/11/2025 7:54 am, Jan Beulich wrote:
>> On 12.11.2025 19:54, Andrew Cooper wrote:
>>> There's a lot of stale information in the current checklists.  Merge the
>>> documents and present the information in chronological order.  Provide real
>>> examples from the tree rather than trying to be too prescriptive.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Hardly anything is being said about stable releases - is this intentional?
> 
> Is there anything you think I'm missing?

Well, ...

> I suppose the releasing section is slightly specific to new releases,
> but for the stable release, it really is just bump extraversion, commit
> and tag, and where usually tag is the only action after you've prepared
> the tree.

... this distinction isn't made clear (enough) for my taste. And while I agree
with "usually", there are the rare cases where qemu and/or minios tags would
still need making and propagating (the latter normally being done by me rather
than the release engineer).

>>> +Branching
>>> +=========
>>> +
>>> +On xenbits:
>>> +
>>> + * Create new staging and stable branches in xen.git.
>>> +
>>> + * Add the new branches to patchbot.  In ``~xen/HG/patchbot`` copy the exsting
>>> +   master and staging reported heads, update the ``versions`` file, and commit
>>> +   the result.
>>> +
>>> + * Add the new stable branch to the docs cronjob.  In ``~xendocs/cronjobs``
>>> +   edit ``xenbits-docs-all.sh`` and commit the result.  e.g.:
>>> +
>>> +::
>>> +
>>> +  ssh xenbits.xen.org
>>> +
>>> +  cd ~xen/git/xen.git
>>> +  git branch staging-$v staging
>>> +  git branch stable-$v master
>>> +
>>> +  cd ~xen/HG/patchbot
>>> +  cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
>>> +  cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
>>> +  $EDITOR versions
>>> +  git commit -am "Branch for $v"
>>> +
>>> +  cd ~xendocs/cronjobs
>>> +  $EDITOR xenbits-docs-all.sh
>>> +  git commit -am "Branch for $v"
>>> +
>>> +
>>> +On the new branch:
>>> +
>>> + * Switch to release builds by default.  Commit.
>>> +
>>> +On staging:
>>> +
>>> + * Update ``XEN_SUBVERSION`` to the next version.  Update
>>> +   ``XEN_EXTRAVERSION``, ``README`` and ``SUPPORT.md`` back to ``-unstable``.
>>> +   Commit.  Tag the start of the new development window.
>>> +
>>> + * Rerun ``./autogen.sh`` to refresh the configure scripts.  Commit.
>>> +
>>> + * Switch ``QEMU_UPSTREAM_REVISION`` back to ``master``.  Commit.
>>> +
>>> + * Create a new section in ``CHANGELOG.md``.  Commit.
>> Should this really be four separate commits?
> 
> It is and has been for a while.

In practice maybe, but not as per the original doc?

> Folding autogen into the version update might be sensible.  Everywhere
> else needing an autogen does so in the same patch.
> 
> But, I don't see it being sensible to fold the remaining thee patches.

Why not? It's all part of the branching operation.

> This also begs the question of how we indicate a planned change from the
> example given.  Maybe "Note, example is from prior to deciding to $X",
> which gets removed when the example gets updated?
> 
> If we're going to do that, I'd want to make it a separate change to the
> main rewrite.

As far as changing what was written down so far goes, I'd certainly agree.
But as per the original branching-checklist.txt it's not spelled out either
way, so describing it one way or the other can be seen as part of the
re-write.

>>> +e.g. from Xen 4.21, ``d510f9c1430c^..62d0a92057ca`` and ``d510f9c1430c^..b0255656d121``::
>>> +
>>> +  * 62d0a92057ca - CHANGELOG.md: Start a new 4.22 section
>>> +  * 7b88e463f999 - Config.mk: Switch QEMU back to master
>>> +  * d954e8c5c8de - Rerun ./autogen.sh for 4.22
>>> +  * 85768c28b705 - (tag: 4.22-dev) Update Xen to 4.22
>>> +  | * b0255656d121 - (staging-4.21) Switch to release builds by default
>>> +  |/
>>> +  * d510f9c1430c - doc/man: Align list of viridian default enlightenments with libxl
>>> +
>>> +
>>> +Releasing
>>> +=========
>>> +
>>> + * Finalise the release dates in ``CHANGELOG.md`` (backported from staging)
>>> +   and ``SUPPORT.md`` (only in the release branch).
>>> +
>>> + * Tag the release in relevant external repos, and update ``Config.mk`` to
>>> +   refer to the tag.
>>> +
>>> + * Update ``XEN_EXTRAVERSION`` to drop the ``-rc`` suffix, and update
>> Since further up it's now rc<N>, imo it would be better to also say it that way
>> here.
> 
> One thing I found very problematic with the older checklists was the
> excessive use of variables.  In this doc, I've got it down to two, and
> using the examples to clear up any ambiguity.
> 
> Would "to drop the RC suffix" work?  This is supposed to be clear that
> it means rc and whatever number we've got to, but rc<N> (especially
> rendered as a literal) doesn't help IMO.

Yes, fine with me.

>>> +   ``README`` to match.  Commit.
>> The latest here QEMU_UPSTREAM_REVISION and MINIOS_UPSTREAM_REVISION also need
>> adjusting to reference version tags, aiui. Taking tag creation in the respective
>> leaf trees as prereq.
> 
> That's the previous bullet point.  I should probably make it clearer
> saying ``*_UPSTREAM_REVISION`` but naming more specifically like that is
> going to bitrot.

Oh, I see. The absence of *_UPSTREAM_REVISION made me not recognize it as
what it is.

>>> + * Tag.  Produce tarballs.
>> Link to the respective section further down?
> 
> I considered that.  The linking syntax detracts from the readability as
> a text file, while on the rendered version it's clear from the
> navigation panel that there are relevant sections.

Well, okay.

Jan

