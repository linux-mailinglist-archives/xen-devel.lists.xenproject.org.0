Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373818176EF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656212.1024282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFG9Q-0000OZ-0J; Mon, 18 Dec 2023 16:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656212.1024282; Mon, 18 Dec 2023 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFG9P-0000Mm-TZ; Mon, 18 Dec 2023 16:07:27 +0000
Received: by outflank-mailman (input) for mailman id 656212;
 Mon, 18 Dec 2023 16:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=De97=H5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFG9O-0000Mg-Rc
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:07:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8889bef4-9dbf-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 17:07:25 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so36778145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:07:25 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b0040b4b66110csm43056584wms.22.2023.12.18.08.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:07:24 -0800 (PST)
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
X-Inumbo-ID: 8889bef4-9dbf-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702915644; x=1703520444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ju/xDinfhcKy+MgLeA+RTPkDetkQgP8SoqAsacng96U=;
        b=ufqd9isy4V/h43TlPTXhwzR/i5gjRrI4pl07M/U677nBiedD9fsXRbszh4vxbswOGR
         AznHaHS1KOj9FwORmcezk8v5TN6/8ABvfL86vsrspB+foM1ZGKLP9ADvIJc8rRwPTME/
         1BHbvC7rHzDqfR73SxvPqWLOZKDsVTznTSPMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915644; x=1703520444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ju/xDinfhcKy+MgLeA+RTPkDetkQgP8SoqAsacng96U=;
        b=GozsmTMXrHUS5BTP3Y9fiBawjfxD3G13Wvyq/uuuQuzvvq+Kn3m4EZdtWTHq4h9sII
         aevBMoGGSSzT9FZ5pjDmNWRfvU+PSa5Oz9HjsuicFxCa/6VVWa5fmJwxhcRK0+inttCU
         TKG+nts/2nVVZ4Fspd0HuggSlL/NqjAxn5pmstxoENRNyzHzjhKONyel157LFkMcfuxR
         61cK7L9tV4Whc9XHasIMj07iqkapxE0eP4I+MIqCjJ45NMjMrnc1s1Y4/RbmbqPUqjUB
         0Y3FQMiketpq84Zj96vQLzLoN0iNrtlj3OOivGC4MdrRS2y6hPYSXSgUVPx0GUf5Lfpk
         twLQ==
X-Gm-Message-State: AOJu0YwomkQmJUzsSgVUXjUa2iT0p0e4nWlXgWIreDrJXFpakvNMhMpa
	hV1cMSsVaKqeOK/MzDr9+nWehA==
X-Google-Smtp-Source: AGHT+IHSLrfm0jzPHHVGnxEp/osWsrS193CdpHjOCVBQO6lpi9exy2AAnBkkIWSS7aMnD9iKbucZlA==
X-Received: by 2002:a05:600c:4e8d:b0:40c:348a:1f8 with SMTP id f13-20020a05600c4e8d00b0040c348a01f8mr8397525wmq.17.1702915644565;
        Mon, 18 Dec 2023 08:07:24 -0800 (PST)
Message-ID: <95d3e8e9-66d3-4097-b2ed-c808369a08ac@citrix.com>
Date: Mon, 18 Dec 2023 16:07:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG for
 randconfig
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
 <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
 <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/2023 3:56 pm, Jan Beulich wrote:
> On 07.12.2023 21:17, Andrew Cooper wrote:
>> On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
>>> ARCH_FIXED_CONFIG is required in the case of randconfig
>>> and CI for configs that aren't ready or are not
>>> supposed to be implemented for specific architecture.
>>> These configs should always be disabled to prevent randconfig
>>> related tests from failing.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  xen/Makefile | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index ca571103c8..8ae8fe1480 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
>>>  # *config targets only - make sure prerequisites are updated, and descend
>>>  # in tools/kconfig to make the *config target
>>>  
>>> +ARCH_FORCED_CONFIG := $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
>>> +
>>>  # Create a file for KCONFIG_ALLCONFIG which depends on the environment.
>>>  # This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
>>>  filechk_kconfig_allconfig = \
>>>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
>>> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
>>> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
>>> +    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat $(ARCH_FORCED_CONFIG);) ) \
>>>      :
>>>  
>>>  .allconfig.tmp: FORCE
>> We already have infrastructure for this.  What's wrong with
>> EXTRA_FIXED_RANDCONFIG?
> What I don't understand here is why dealing with the issue would want
> limiting to gitlab-CI. Anyone could run randconfig on their own, and
> imo it would be helpful if the same issue(s) could be prevented there,
> too. Hence my earlier suggestion to have a snippet which can be used
> by "interested" parties. And once dealt with in e.g. the makefile
> there should not be a need for any overrides in the CI config anymore.

This is trying to find a solution to a problem which doesn't exist.

RISC-V and PPC are experimental in Xen.  Noone else is going to come and
randconfig them until they're rather more production ready, and a
prerequisite of that is removing this list of exclusions.

Until you can actually find an interested party to comment, I think this
is just churn for no useful improvement.  If nothing else, calling it
randomforced.config isn't appropriate given the explanation of what this
target is used for...

~Andrew

