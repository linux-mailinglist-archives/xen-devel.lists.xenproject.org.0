Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83716A8265E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944133.1342674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vby-00085c-0y; Wed, 09 Apr 2025 13:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944133.1342674; Wed, 09 Apr 2025 13:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vbx-00083O-Uc; Wed, 09 Apr 2025 13:37:01 +0000
Received: by outflank-mailman (input) for mailman id 944133;
 Wed, 09 Apr 2025 13:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2Vbx-00083I-1m
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:37:01 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b7e0bf-1547-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:37:00 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso4129983f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:37:00 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207aed49sm20048615e9.34.2025.04.09.06.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:36:59 -0700 (PDT)
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
X-Inumbo-ID: b6b7e0bf-1547-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744205820; x=1744810620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdy+BT8jpIRziyBlF8uwp4Q/AJBaxmsSRuX8xG254QE=;
        b=He+JbbLWWIBlIqEKHiYl+4H41/8gYq5IMdTqEeLia8CHPxPN9fPTqly6ObI08Yy9yT
         Xgt2q5U138WR40ITyI0DGfhjHN+MhtcJPDeBZ56/eMv1BKdjUy0bKQVgwno2R2A6Jr6J
         YQ8byOgIDHzLm8XuRTVuc1GfbI5KV8el/WdoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744205820; x=1744810620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qdy+BT8jpIRziyBlF8uwp4Q/AJBaxmsSRuX8xG254QE=;
        b=Fv+zqmc3TmEU2yEmym0bZTM64+KVLT0tOovviW3Oxvb23qvrsEu2Xn/8K4OPwAi3c7
         q+2TGUUvhXpfJsekSOMgLernfNhg5KRkT6Z9CBGquUR/WegpgroFCCOa1/3eHK6gPem6
         5lCQ1SLGr/Um30EmYfzjgdNrm9lNAwixABGJh9PoTrvBlcN3jsngGN2ry200CeDNRqc3
         YWP3mO5bJOqeDUS6Flgh/k2/l4Ss0gRkV6am205ZWLNxG+JtZCKJKsgG7SFeTkxqAFOY
         AURLkyLHejM0O15IVK8QfiYHipLsiAJxNlcryxeIJH6atY62nJgXBlcK7/HX58xucgjJ
         5I8A==
X-Gm-Message-State: AOJu0Yw7wFyRfXA+peamp156Xon8WTcHfBcye5Ij8SVA5Kl4Jll7WwYt
	j0W0CGeUQyN7sMi8dlF0BmuhQIGCTYRYjsgwK7nCZcSSIjB/F0BVYXdj91+TTE4=
X-Gm-Gg: ASbGncsHrVeuglSo9nEVXDuYXuoaNqhCoyA/II9BhxvprEKTF85aC3vO4Vcxwul9rCn
	l5TPkNYQsVOCMTnV2UP8Rt6RVnvdkkYaM4rnKVLMDAg9BLPTYDlLkoSp5gaTFgeDNWVJGqF9zkM
	2OT2rIiEaDAafFKzmRg8V8054Y9iseGNKdvSPYJmXJbFdor3O0w72qdc1QiXN6nVxVpsLlrNmXt
	dDtJv6nCfgmDK7F1o3XGEdKuzERThMY7T261A2StSOZVDLXiQstCi8tL6yh9ITA5VLLCtclg4a+
	2OfexSndVm7m6wVjiA6RAAHOU+qMYueYdYyriHC0emncz/IxXiBpvYL7xAI4JmyW3SHVVfJOC26
	YYYHTvi+eRLVHTbeX
X-Google-Smtp-Source: AGHT+IGKGMhNDmJ1yYBH/TwjZuHuteYKw1O5CgM7Nk2QB4ksRClL+s5qICBEf5NbExpc8ALEkDeUyg==
X-Received: by 2002:a05:6000:40d9:b0:39a:c9ed:8555 with SMTP id ffacd0b85a97d-39d88539008mr2695662f8f.23.1744205819568;
        Wed, 09 Apr 2025 06:36:59 -0700 (PDT)
Message-ID: <c7bb4674-c3e7-48ff-83f3-52d4595d9fca@citrix.com>
Date: Wed, 9 Apr 2025 14:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Update x86 tests from Linux 6.1.19 to 6.6.56
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20250409130505.2011604-1-andrew.cooper3@citrix.com>
 <Z_Z2F4EvxqPB35bh@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_Z2F4EvxqPB35bh@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2025 2:28 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 09, 2025 at 02:05:05PM +0100, Andrew Cooper wrote:
>> Linux 6.6.56 was already added to test-artifacts for the argo testing, and
>> this removes one moving part while cleaning things up.
>>
>> Drop the associated export job, and dockerfile.
> My hw12 runner series adds CONFIG_USB_RTL8152, there are also other
> series that needs extending kernel config. Is there some better way of
> handling such series than sending patches to two repositories? Maybe
> test-artifacts.git scripts could pull some parts from xen.git? But the
> committing order would still be weird (commit kernel change into
> xen.git, rebuild test-artifacts, commit the rest to xen.git)...

Yes, I'm aware.  I'm trying to get us down to 1 way of doing artefacts,
rather than continuing the hybrid scheme.  I have a *lot* of changes to
test-artefacts to post too.

When that's done, updating the config (or another aspect of the
artefact) should just be a change to test-artefacts, with no change to Xen.

Updating the versions will require a patch to test-artefacts first, then
one to Xen to start using it.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1760198654
> This still waits in the queue for adl and kbl. But should be good, given
> it worked also with 6.12.
>

It worked in local smoke tests too.

~Andrew

