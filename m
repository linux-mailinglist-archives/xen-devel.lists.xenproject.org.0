Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DDAACB92D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003653.1383246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7aU-0003Jn-OL; Mon, 02 Jun 2025 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003653.1383246; Mon, 02 Jun 2025 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7aU-0003Hv-LW; Mon, 02 Jun 2025 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 1003653;
 Mon, 02 Jun 2025 16:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM7aT-0003Hp-LV
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:00:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b5a96d-3fca-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 18:00:31 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so33670665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 09:00:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009f9d6sm15209795f8f.84.2025.06.02.09.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 09:00:30 -0700 (PDT)
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
X-Inumbo-ID: b5b5a96d-3fca-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748880031; x=1749484831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Shq0jHtUzQDgV0IdKjL8hlrAHgToAhtVE+Rp5+dg7xg=;
        b=olQRuRXLonxB0GWOh/WbXezgidkXmyAMVeNR4uk3MnoN0c/72ORHCrlEC728GpwhSw
         mirdZR7PcfKyEt5XRcOgyVctzxUVCZ4MLpZk302ad3wYjUldWLsQkvjBpXjiQiZHSfQ/
         jPR8Msn8TI4fUp3kwOepdl6Db47B82/ARZ4ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880031; x=1749484831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shq0jHtUzQDgV0IdKjL8hlrAHgToAhtVE+Rp5+dg7xg=;
        b=H7+F+P4eIjBCYKMFuZPwBKzmBXKy/BaE2RiEUxcK2SPhWAWqBkSm25zapfTN/LSIdG
         NNE1srV5poOIsvQjJzz+Hhd+84LYbf31r7gZH3XOHiOfN475e0ib3lHdXefqKskw1xeC
         CfbI/cR52SCZRnYXv+DJMhlrY58B2TV+iG2BO+Xx+ZfGZMQIVM0IxPXz9iM+dP9Xnn7j
         rNNBWtUIlD7rKAXlN5KDJKYCKZQzXtr5i4BKE/CulpICGTFA5TmFMDO0yewbfhNB7AOv
         rK06MZHvC5ke6V89DK+lOgy16fu2cvPLFPO3pgj8B/JTjEobhWOmh6Jgl2Vqvu66TteG
         mj2w==
X-Forwarded-Encrypted: i=1; AJvYcCXTwOaGhDmNMZjApc7BE1tDEb2IkLSJX9yvE9MKbOAXugFoU5CgzdwcDJiD9jdn8TvmNDGY6W5VrK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjMijk7xnBnInPUwCl5wwA2vVbVK5cTw4GWMpBV9TR6U8m4m+Q
	CS7lqL/cH3vDNVPXWNLrt37bnphT1pjVYP0ON2XlpuFyR6WyrFgL3tAWlG8m/xsZrzg=
X-Gm-Gg: ASbGncswFpz/UDp44GzV0gm7+MakEiRSxEsF6cAJE7AONInTrX+qxwEnkb83XixrslC
	W9xTLHRY7FclENsJtMopBi6gt5vnhBt8N/uyPzfJb4Wm+pS52LVbEsfjE8o5Epzpl91fKKe/5ti
	FfVfcDEHlgzNIp2GEUN5Xjxjt1qISf06hZOC0XIYvlVxHfDpAnOaxopXbOCMEkJQnC73Lpd/9V7
	oQ+a5gy2ipakyUN/zdqTreSVURQkkNT6sHMNVqSvl6q0PFk1U327+04nKYiOogp/3+oPpwBakwT
	yv7ihNAY6U3+M3KOE33ofaYCYVKiegE642YePDSnK9r8K0kylUPufSAXQ5c+dipxshek4dXTNSX
	Dx4HhOSMekCLfPOKs
X-Google-Smtp-Source: AGHT+IHnggI/9DeQr343iS9W2mhXQg200DgsoUxhLTSfNQV/Ub8BR6DZk09UdcweZrCuUrnLyK1+sg==
X-Received: by 2002:a05:600c:1d81:b0:442:e03b:589d with SMTP id 5b1f17b1804b1-4511edf2931mr70847295e9.24.1748880030680;
        Mon, 02 Jun 2025 09:00:30 -0700 (PDT)
Message-ID: <baf14861-d4d3-4691-8c39-0aa54434cdaa@citrix.com>
Date: Mon, 2 Jun 2025 17:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
 <811c154c-d7d4-480c-8898-a21f62f2cf6a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <811c154c-d7d4-480c-8898-a21f62f2cf6a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 4:50 pm, Jan Beulich wrote:
> On 02.06.2025 17:36, Andrew Cooper wrote:
>> On 02/06/2025 4:09 pm, Michal Orzel wrote:
>>> These tests are supposed to run on target. HOSTCC can be different than
>>> CC (when cross-compiling). At the moment, tests installation would put
>>> a binary of a wrong format in the destdir.
>>>
>>> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Oh.  This didn't explode in GitlabCI because there's no ARM version of
>> *-tools-tests-*.
>>
>> Can we fix that too please, seeing as there is a real ARM board?
>>
>> Also, I guess we have to finally sort out the CC vs HOSTCC debate.
> I think the situation here makes pretty clear that HOSTCC is almost always
> wrong to use for tests/. The emulator test harness is special in that it (in
> principle) needs a target compiler (CC) and additionally an x86 one (with no
> present representation). The present way of (partly) distinguishing the two
> by using CC and HOSTCC was assigning wrong meaning to one (perhaps both) of
> them. The (or maybe just my) problem is that in the toolchain world it is
> build, host, and target which are distinguished. As per Michal's description
> my understanding is that HOSTCC is matching "build" there, not "host".

vPCI is a true unit test.  It can be run in the build environment. 
Installing it here was to get it run somewhere.

x86_emulator is weird.  It can be run in the build environment, but it
is also dependent on CPUID so wants running on target environments too.

Everything else (IIRC) needs a real dom0 to run in, because they make
hypercalls.

~Andrew

