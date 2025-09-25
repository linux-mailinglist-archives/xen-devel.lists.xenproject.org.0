Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84702BA164F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 22:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130874.1470230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1so2-0003zy-2G; Thu, 25 Sep 2025 20:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130874.1470230; Thu, 25 Sep 2025 20:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1so1-0003yA-VV; Thu, 25 Sep 2025 20:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1130874;
 Thu, 25 Sep 2025 20:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCQs=4E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1so0-0003y4-6e
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 20:43:08 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ce0c5b3-9a50-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 22:43:05 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso193341066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 13:43:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fcde34sm234001966b.73.2025.09.25.13.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 13:43:04 -0700 (PDT)
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
X-Inumbo-ID: 3ce0c5b3-9a50-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832985; x=1759437785; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNZBPjENghkHar9VDG+i1SkRR2uSbbOVXQHDNwfwvzg=;
        b=Gkze9Bm1734w/c5/ctiAjs2YBk1Y+j9wKhYBVQwCqHOMERU9ehfBgx36bHPpDka1cW
         p45c/qRXpgJCzH3AqZFc00Y/T7EdBUl9gsj8c099Mn9ASaqcux6f9RpRbJfDwnghaSyX
         uAaXlf4+Pr8BAMSXafGdpKjlD3dOkJM+Lk2PZR6Jgwip17jCQRyojXa8ont/1DQ6qo0Y
         vb3vDeL2Xmev2s6LgV54KACDckIn52zxXvs2kyrEelety/175NsAikSYCxHEZnbmglcy
         g0cFgLCQF9Ide9hGZY8u6Vb3lTeq+49EOeinxojTBwlBnOiyy9gLag+GxIAZFEtpcaw5
         SCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832985; x=1759437785;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MNZBPjENghkHar9VDG+i1SkRR2uSbbOVXQHDNwfwvzg=;
        b=kuurqRyWtT0KU2ulvwvSGhh/wg8nxShs1Hhpu9oDDAZmLkq+u3zalnZyW53tBgAae/
         x3ytki/gBXv/dMfG8SWBySlkGg+RbiyN4HUwkJn4ILJzOHELLcLJ7qEjlaHe/Jt2LUs1
         D3iCq9iHD2fcZfW4bkX/0vD5xaLEZ82Kym29Ss9UlylVUbY4NRwDpoXxsRh9kBnuujOT
         oX0NrAbL6sQZLbFdDslbXAPfFFMfjIs2gKvcA75utC121UhV/6CXhaBQShFjvjYWeP6F
         Zz422sBGRNF++y2CTleLpCjnenomGKhUh414DejTX8h1DFEV+fAPSxjrQe3klgwkiuA+
         GncQ==
X-Gm-Message-State: AOJu0YzJ1pcmBZGLpJDEfdaiKv42+Hq3rmvXs4+9PlbKOFdaLKldnF4z
	0kcFPD6T49jVRuvDhPMZhiYbBAAJktFfUqlLfyqF2LtUE5yVwsXfBQBv
X-Gm-Gg: ASbGnctCPsMP1X8WPP9nnZLVviM+ZZn66pW8mqmB+6BV2E7gRLSYk+oAnfrCY7bQ3/N
	S1aFjUZJszJiDIgd4zbSaAKYo15RiQqySKAhyoOJD6WHdy/sovqVYpJO2ec+2E2E2CH9O/IhN0e
	DtCpCJllc6dBGHc3waX0+rzKamQ7TTQq3LBbpI4T1h9AizEfcxv/14X+Q2FUbQEc0wLvOOqB95K
	617F7AP3KxUS6X0ZrzuBUuZPpJDuKEJL7NZp/doIslWAADtqt7NLURrc3eW6p3lhIS8JRJkQTHo
	MNqGqI5OpeWfrHvIVNjmDm+gsHYUxt5ziceFwTMasKOEzlJSVSofr4eeQzGZP5q0/PHcXufRIEB
	/VecAE8JYZvVOY3g0uAPbHONd57GF0J8xPinah4VqYZWrsauU9PHsN63A0D5uPoTtcUmotL1k
X-Google-Smtp-Source: AGHT+IHj3a9hhtdKz7xLdDmj7OBCR7aSaDmpYQnb/3rg4GOUQ2tmp7wtQGHC8/NeMtRp2jbZ1WQ1IA==
X-Received: by 2002:a17:907:60d4:b0:b2e:ca89:dcc4 with SMTP id a640c23a62f3a-b34bad22510mr443061966b.37.1758832985172;
        Thu, 25 Sep 2025 13:43:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uedu0LlpqIQn4v00k4cqBRWM"
Message-ID: <913d7e21-72ec-4823-9a4c-84d8a5e97cba@gmail.com>
Date: Thu, 25 Sep 2025 22:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper@citrix.com>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan> <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
 <aNTwlR02jijpwYeC@Mac.lan> <1083faae-d565-48ab-8e41-3a5a12178a9f@suse.com>
 <aNTx1DuSIRvj7eqv@Mac.lan> <58e5e9ae-9b57-41b0-a2d9-bdd2f312293b@suse.com>
 <aNT5MZMU29bdoRE4@Mac.lan>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aNT5MZMU29bdoRE4@Mac.lan>

This is a multi-part message in MIME format.
--------------uedu0LlpqIQn4v00k4cqBRWM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/25/25 10:11 AM, Roger Pau Monné wrote:
> On Thu, Sep 25, 2025 at 09:41:43AM +0200, Jan Beulich wrote:
>> On 25.09.2025 09:40, Roger Pau Monné wrote:
>>> On Thu, Sep 25, 2025 at 09:37:46AM +0200, Jan Beulich wrote:
>>>> On 25.09.2025 09:34, Roger Pau Monné wrote:
>>>>> On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
>>>>>> On 24.09.2025 15:40, Roger Pau Monné wrote:
>>>>>>> On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
>>>>>>>> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
>>>>>>>>> Otherwise the check for the SS feature in
>>>>>>>>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
>>>>>>>>> X86_FEATURE_XEN_SELFSNOOP never being set.
>>>>>>>>>
>>>>>>>>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
>>>>>>>>> identify_cpu(), because SS detection uses boot_cpu_data.
>>>>>>>> Doesn't this, mean ...
>>>>>>> Well, that's the reason for the rant here.  The reset at the top of
>>>>>>> identify_cpu() has been there since 2005.  It's arguably to make sure
>>>>>>> the BSP and the APs have the same empty state in the passed
>>>>>>> cpuinfo_x86 struct, as for the BSP this would be already partially
>>>>>>> initialized due to what's done in early_cpu_init().
>>>>>>>
>>>>>>> The underlying question is whether we would rather prefer to not do
>>>>>>> the reset for the BSP, but that would lead to differences in the
>>>>>>> contents of cpuinfo_x86 struct between the BSP and the APs.  In the
>>>>>>> past we have arranged for leaves needed early to be populated in
>>>>>>> generic_identify(), like FEATURESET_e21a, hence the proposed patch
>>>>>>> does that for FEATURESET_1d.
>>>>>>>
>>>>>>>>>    However that
>>>>>>>>> creates an imbalance on the state of the BSP versus the APs in the
>>>>>>>>> identify_cpu() code.
>>>>>>>>>
>>>>>>>>> I've opted for the less controversial solution of populating FEATURESET_1d
>>>>>>>>> in generic_identify(), as the value is already there.  The same is done for
>>>>>>>>> the AMD faulting probe code.
>>>>>>>>>
>>>>>>>>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
>>>>>>>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>>>>>>>> ... this Fixes tag is incorrect?
>>>>>>> I think the Fixes tag is accurate; the code was OK before that change.
>>>>>>> Nothing in c_early_init hooks depended on (some of) the x86_capability
>>>>>>> fields being populated, which is required after the change.
>>>>>> I agree. Hence:
>>>>>> Reviewed-by: Jan Beulich<jbeulich@suse.com>
>>>>>>
>>>>>> I wonder though whether while there we wouldn't want to also store ecx if
>>>>>> we already have it. (Really there is the question of whether we haven't
>>>>>> other cpu_has_* uses which similarly come "too early".)
>>>>> Yeah, I was about to do it, but it's not strictly needed for
>>>>> c_early_init, and it's done anyway just after the call to
>>>>> c_early_init.  I can set that field also, but then I would need to
>>>>> tweak the comment ahead, something like:
>>>> Sure, i.e. fine with me.
>>> Oleksii, can I please get a release-ack for this to go in?
>> Do bug fixes actually need release-acks just yet?
> I always err on the side of caution and ask for them.  Maybe Oleksii
> can state if/when he formally wants release-acks for bugfixes.

I am okay not to have release-acks for bugfixes until the end of code
freeze.

When I will announce a next stages of release process,
I would put such the information explicitly.

Thanks.

~ Oleksii

> Regards, Roger.
--------------uedu0LlpqIQn4v00k4cqBRWM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/25 10:11 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aNT5MZMU29bdoRE4@Mac.lan">
      <pre wrap="" class="moz-quote-pre">On Thu, Sep 25, 2025 at 09:41:43AM +0200, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 25.09.2025 09:40, Roger Pau Monné wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Thu, Sep 25, 2025 at 09:37:46AM +0200, Jan Beulich wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 25.09.2025 09:34, Roger Pau Monné wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 24.09.2025 15:40, Roger Pau Monné wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">On 24/09/2025 4:00 am, Roger Pau Monne wrote:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">Otherwise the check for the SS feature in
check_memory_type_self_snoop_errata() fails unconditionally, which leads to
X86_FEATURE_XEN_SELFSNOOP never being set.

We could also avoid this by not doing the reset_cpuinfo() for the BSP in
identify_cpu(), because SS detection uses boot_cpu_data.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">
Doesn't this, mean ...
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">
Well, that's the reason for the rant here.  The reset at the top of
identify_cpu() has been there since 2005.  It's arguably to make sure
the BSP and the APs have the same empty state in the passed
cpuinfo_x86 struct, as for the BSP this would be already partially
initialized due to what's done in early_cpu_init().

The underlying question is whether we would rather prefer to not do
the reset for the BSP, but that would lead to differences in the
contents of cpuinfo_x86 struct between the BSP and the APs.  In the
past we have arranged for leaves needed early to be populated in
generic_identify(), like FEATURESET_e21a, hence the proposed patch
does that for FEATURESET_1d.

</pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">  However that
creates an imbalance on the state of the BSP versus the APs in the
identify_cpu() code.

I've opted for the less controversial solution of populating FEATURESET_1d
in generic_identify(), as the value is already there.  The same is done for
the AMD faulting probe code.

Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">
... this Fixes tag is incorrect?
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">
I think the Fixes tag is accurate; the code was OK before that change.
Nothing in c_early_init hooks depended on (some of) the x86_capability
fields being populated, which is required after the change.
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">
I agree. Hence:
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

I wonder though whether while there we wouldn't want to also store ecx if
we already have it. (Really there is the question of whether we haven't
other cpu_has_* uses which similarly come "too early".)
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">
Yeah, I was about to do it, but it's not strictly needed for
c_early_init, and it's done anyway just after the call to
c_early_init.  I can set that field also, but then I would need to
tweak the comment ahead, something like:
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Sure, i.e. fine with me.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Oleksii, can I please get a release-ack for this to go in?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Do bug fixes actually need release-acks just yet?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I always err on the side of caution and ask for them.  Maybe Oleksii
can state if/when he formally wants release-acks for bugfixes.
</pre>
    </blockquote>
    <pre>I am okay not to have release-acks for bugfixes until the end of code
freeze.

When I will announce a next stages of release process,
I would put such the information explicitly.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite" cite="mid:aNT5MZMU29bdoRE4@Mac.lan">
      <pre wrap="" class="moz-quote-pre">
Regards, Roger.
</pre>
    </blockquote>
  </body>
</html>

--------------uedu0LlpqIQn4v00k4cqBRWM--

