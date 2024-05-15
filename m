Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE81E8C61BF
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721952.1125678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799F-0004OU-8l; Wed, 15 May 2024 07:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721952.1125678; Wed, 15 May 2024 07:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799F-0004MR-5x; Wed, 15 May 2024 07:34:01 +0000
Received: by outflank-mailman (input) for mailman id 721952;
 Wed, 15 May 2024 07:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s799E-0004ML-0E
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:34:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dfdebfe-128d-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 09:33:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so135340766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 00:33:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b178b1sm820131066b.191.2024.05.15.00.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 00:33:57 -0700 (PDT)
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
X-Inumbo-ID: 7dfdebfe-128d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715758438; x=1716363238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6PonMRQvEhASBmXrBQYuUr+6RexroA7OI1t5pueh6U=;
        b=BP9uPE3LcnL5OsAW8SKa2gWmASp62vISAfGuHt5uPyH9yPpvjidytd6lMNPDkvaTa8
         89XD9u+LJuZLmiHdjP4edFPVE1tCPscMM+Ix1ekNnwLEFUUKk7kUrP29kfrz8Y+TaAd2
         uisoZJVfiiSh9BlhLWt1kNlgIqw7En7wod7Y9qXTkvuXj0zzx44sH0/tkJvIQireOnw5
         Dkljz9HWLsthdEa5aBhciVtsgvvE6/I3pKndnZquP1hZRNu9I3ZHEnwHBT51I8QGq+nx
         UuRnlPUchepLys87ymXe7Vfvx8e7hu5YGtSCw86sQCoF15njXjRmUWm5UWJ/vH/MNx+t
         /T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715758438; x=1716363238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6PonMRQvEhASBmXrBQYuUr+6RexroA7OI1t5pueh6U=;
        b=g4B/mzTRScYa9CwDUiQjc3yVTPrBm2bgmEZgUS4t1PPiHZH85UlM72/v+6rMjbWBrf
         mS5o3+yFqREdS8QQ+zglGwW1llYSSBAxUBtvOJ0VyLtEQIRzn3fOg0hm1Qc6RQut0fqE
         9fe1Ac6q5wvqDonXKsthorBgpgTcjZr92ww3/TwJF3jRtuYQvli9WzNoSJNasGgSFgrK
         MMLV/EOvLrKhr5cNaurR9CVxg4y5LNSLk5HQq6Nmjj0GJaOGeRJHi3qwozRpnaIWDD1K
         Qu81R0pXPK3IeCVv6ZuXuwPzpkRbsD+6sJFDQpv2QCua0rz4jCTvV5ZpHRtPc40BdB6u
         Cg9g==
X-Forwarded-Encrypted: i=1; AJvYcCWmeKCcSAMF8YHzFmmXk91nle62h0vRXcRZbNfSbLFuKO4U9ztqtg/d1iWwj22us5IeV40PRDb8+mjzbkJwO+usR8czrIBTVHxkdIb5I2I=
X-Gm-Message-State: AOJu0Yz9O3XCuLziWa788uzswSnvPuIP6auzE+mNc7KDDjCuPbRSPKXa
	zxwmqjDpa0gacUMxoH8PXMpWxX2oKt3eIdfQDSSqNomJBmMT/uObRcZpDJMAqA==
X-Google-Smtp-Source: AGHT+IE/83SHFOdlL9UQghm8SQqKA1YYYHDsZ4Wl22oQF96QFMrT7y8EeRZqmQmU5oECakmouF8/rg==
X-Received: by 2002:a17:906:2b85:b0:a59:9f4e:4e3b with SMTP id a640c23a62f3a-a5a2d53ae89mr1026769066b.2.1715758438068;
        Wed, 15 May 2024 00:33:58 -0700 (PDT)
Message-ID: <a00b26e0-cf65-44fb-8d74-630bfdb20dfe@suse.com>
Date: Wed, 15 May 2024 09:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall <julien@xen.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
 <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
 <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
 <alpine.DEB.2.22.394.2405141411210.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405141411210.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 23:35, Stefano Stabellini wrote:
> On Tue, 14 May 2024, Julien Grall wrote:
>> On 14/05/2024 11:03, Jan Beulich wrote:
>>> On 14.05.2024 11:51, Andrew Cooper wrote:
>>>> You tried defending breaking a utility with "well it shouldn't exist
>>>> then".
>>>>
>>>> You don't have a leg to stand on, and two maintainers of relevant
>>>> subsystems here just got tired of bullshit being presented in place of
>>>> any credible argument for having done the change in the way you did.
>>>
>>> Please can you finally get into the habit of not sending rude replies?
>>>
>>>> The correct response was "Sorry I broke things.  Lets revert this for
>>>> now to unbreak, and I'll see about reworking it to not intentionally
>>>> subvert Xen's security mechanism".
>>>
>>> I'm sorry, but I didn't break things. I made things more consistent with
>>> the earlier change, as pointed out before: With your revert,
>>> evtchn_status() is now (again) inconsistent with e.g. evtchn_send(). If
>>> you were serious about this being something that needs leaving to XSM,
>>> you'd have adjusted such further uses of consumer_is_xen() as well. But
>>> you aren't. You're merely insisting on lsevtchn needing to continue to
>>> work in a way it should never have worked, with a patch to improve the
>>> situation already pending.
>>>
>>> Just to state a very basic principle here again: Xen-internal event
>>> channels ought to either be fully under XSM control when it comes to
>>> domains attempting to access them (in whichever way), or they should
>>> truly be Xen-internal, with access uniformly prevented. To me the
>>> former option simply makes very little sense.
>>
>> I agree we need consistency on how we handle security policy event channel.
>> Although, I don't have a strong opinion on which way to go.
> 
> Same here
> 
> 
>> For the commit message, it is not entirely clear what "broke lseventch in
>> dom0" really mean. Is it lsevtchn would not stop or it will just not display
>> the event channel?
>>
>> If the former, isn't a sign that the tool needs to be harden a bit more? If
>> the latter, then I would argue that consistency for the XSM policy is more
>> important than displaying the event channel for now (the patch was also
>> committed 3 years ago...).
> 
> I realize 3 years have passed and it is a long time, but many
> downstreams (including some which are widely used) don't rebase
> regularly and we are still missing lots of tests from gitlab-ci. The
> unfortunate result is that it can take years to realize there is a
> breakage. We need more gitlab-ci (or OSSTest) tests.
> 
> 
>> So I would vote for a revert and, if desired, replacing with a patch that
>> would change the XSM policy consistently. Alternatively, the consistency
>> should be a blocker for Xen 4.19.
> 
> I am convinced by Daniel's argument here:
> 
> https://marc.info/?l=xen-devel&m=171215093102694

I particularly disagree with the "since it is access control and falls under
the purview of XSM" in there, without addressing my point regarding Xen-
internal resources. It is a fundamental hypervisor decision whether to leave
access to Xen-internal resources to XSM control. If that decision ended up
being "yes", then I agree XSM maintainers may ack a respective change. If
that decision as "no", though, acking would purely fall to REST for code
like what is being touched here.

Just to further clarify: If it was "yes" above, other Xen-internal resources
then also ought to be domain accessible based on XSM policy. I don't think
that's the case e.g. for Xen-private memory.

IOW I can't help the impression that both the patch and the ack were
provided looking at just the one special case, driven by the (perceived)
tool breakage (see below).

> https://marc.info/?l=xen-devel&m=171215073502479

In there he said in particular: "And it is incorrect because as again you
have not articulated why the lsevtchn behavior is wrong and thus whether
this is the valid corrective action." Daniel, did you even look at the code
when saying so? With the revert in place, lsevtchn is still going to fall
on the nose when XSM denies access to a particular channel. I didn't think
this needed calling out explicitly; the tool needs fixing.

> I would ack Andrew's revert. If we decide to revert Andrew's revert, I
> also think that we should make the alternative solution, whatever that
> might be, a blocker for Xen 4.19.
> 
> My favorite alternative solition is Daniel's suggestion of adding a
> check to the dummy XSM policy. I am not sure if this is the same thing
> you mean with "change the XSM policy consistently".

I don't think it would be, but I also don't know what exact check was
thought about. I think I was quite clear about evtchn_send()'s similar
code (there may be more). All of these want to behave the same: All
involving XSM, or all not doing so. This is the kind of thing where I
don't think any "majority" can trump technical aspects. If the verdict was
"XSM", then yes, my original patch would have moved us in the wrong
direction. But then a plain revert is insufficient, and the blaming in
there also should have been done at least differently, if at all.

Jan

