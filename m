Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D928C6B71
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 19:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722568.1126660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7IN0-0001CR-Pv; Wed, 15 May 2024 17:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722568.1126660; Wed, 15 May 2024 17:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7IN0-00019u-Mn; Wed, 15 May 2024 17:24:50 +0000
Received: by outflank-mailman (input) for mailman id 722568;
 Wed, 15 May 2024 17:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHxB=MS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7IMz-00019o-Bs
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 17:24:49 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b39987-12e0-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 19:24:47 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6a04bae513cso26120406d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 10:24:47 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179900sm66201596d6.19.2024.05.15.10.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 10:24:45 -0700 (PDT)
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
X-Inumbo-ID: 06b39987-12e0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715793886; x=1716398686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z1nN9Ar+qfmXEaldLdkdVicnTVi7R8lyro+Fz4srAmg=;
        b=jpmrj/lQVJ+9tPBhYy8DQZX+MEmC18wSeEdKo6v2Evpnr1smyz3mpvdzDQLE82bm4O
         eSeTPanXBzcQoR/iESb+60c145d+YXZV/x0rzDPnqqBjFwBgObWlrNBUvRuf39MxkhxX
         oprk3PfbtFqhBlG0fydGRDRy8xAFHVvukh+SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715793886; x=1716398686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1nN9Ar+qfmXEaldLdkdVicnTVi7R8lyro+Fz4srAmg=;
        b=SpXZa5y1FqWxhEkhGe2BIqlntyie7YZ4t9fXUDH2lfJIhhl1oxQrf1fsBeWc8/RfWX
         7wxK/ZfZoFLnLOehOcUChh4peIwnlv+8+0BldEws02n4v79yOdZ02s/dw4vwwTXOtiVW
         bQJX1dgLYhUrMMn2KjO+cPLWsOwuBBJK/YtNrBqtV2BELZNOSQfrZ6S1EBKN9Xs3ouMS
         /46LMTVTcH8ufDP22f/6IfJ+zE2Lbm3lS/MMbLP2kMV6D8cycKEHwugn3iw2h3PdUd5+
         OSoFoZcp4iJPEK/Wmz1i27MwwqTrcVnQcIy0sEkDAEV8y1NS39dIk54Vnh2pSOfoxxYJ
         /esQ==
X-Gm-Message-State: AOJu0Yyr6Y48iGFdzEKILZ+1vj3YDN49w/JMnJ21gl0UG65rZokB9oiO
	ex73IQIudLRINbKBzMykUmTSoHLPs338JLwBXpU2iH9eBbiT7KIJZ8/dygIsw+k=
X-Google-Smtp-Source: AGHT+IGdw9AG2XeUJ28f6yMJbXM1IBdkgQiHzyYnNYIXdLu+8pK5dtrqRxTVCz+1t401kvj+l3a/mw==
X-Received: by 2002:a05:6214:550a:b0:6a0:5446:dbc1 with SMTP id 6a1803df08f44-6a168144b8bmr174723556d6.2.1715793886121;
        Wed, 15 May 2024 10:24:46 -0700 (PDT)
Message-ID: <ddc6fe6c-e7bb-4cf1-876a-843a6c5a2877@citrix.com>
Date: Wed, 15 May 2024 18:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] docs/man: document VIF vlan keyword
To: Leigh Brown <leigh@solinno.co.uk>, Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, anthony.perard@citrix.com
References: <20240508213824.55824-1-leigh@solinno.co.uk>
 <20240508213824.55824-5-leigh@solinno.co.uk>
 <CAKf6xpviWyFxt4JMq23K0LxjDcP2zJF1Sqye=1jS2UAtwcaRww@mail.gmail.com>
 <c62b512c3b1ea58fb07e50df85b4ebd6@solinno.co.uk>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c62b512c3b1ea58fb07e50df85b4ebd6@solinno.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/05/2024 4:30 pm, Leigh Brown wrote:
> Hi Jason,
>
> On 2024-05-15 01:57, Jason Andryuk wrote:
>> On Wed, May 8, 2024 at 5:39 PM Leigh Brown <leigh@solinno.co.uk> wrote:
>>>
>>> Document the new `vlan' keyword in xl-network-configuration(5).
>>>
>>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> One nit below
>>
>>> ---
>>>  docs/man/xl-network-configuration.5.pod.in | 38 ++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/docs/man/xl-network-configuration.5.pod.in
>>> b/docs/man/xl-network-configuration.5.pod.in
>>> index f3e379bcf8..c35c0922b3 100644
>>> --- a/docs/man/xl-network-configuration.5.pod.in
>>> +++ b/docs/man/xl-network-configuration.5.pod.in
>>> @@ -259,6 +259,44 @@ Specifies the MTU (i.e. the maximum size of an
>>> IP payload, exclusing headers). T
>>
>>> +Note, one VLAN ID must be marked as the PVID. In the case of a vlan
>>> +specification consisting of a single VLAN ID (e.g. C<vlan=10>), the
>>> B<p> suffix
>>> +may be omitted. Specifying more than one untagged VLAN ID is an
>>> advanced
>>> +configuration - use with caution.
>>> +
>>> +For example:
>>> +
>>> +        'vlan=10' -- meaning a single VLAN that is the PVID.
>>> +       'vlan=10p/20' -- VLAN 10 is the PVID and VLAN 20 is tagged.
>>> +       'vlan=10p/100+10x4' -- VLANs 10, 100, 110, 120, 130, 140, 150.
>>
>> Indent mismatch between 7 and 8 spaces.
>
> FWIW I will sort that too :-)

This should be merged into patch 2 which introduces the vlan keyword.

As the indentation is the only issue, I'll fix it on commit while merging.

~Andrew

