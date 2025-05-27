Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96BAC51FA
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998549.1379270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwAp-0008W9-90; Tue, 27 May 2025 15:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998549.1379270; Tue, 27 May 2025 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwAp-0008TT-6J; Tue, 27 May 2025 15:25:03 +0000
Received: by outflank-mailman (input) for mailman id 998549;
 Tue, 27 May 2025 15:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJwAo-0008TN-KF
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:25:02 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c18869d9-3b0e-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:25:01 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7c559b3eb0bso202905685a.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:25:01 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd468cb4e0sm1733995285a.91.2025.05.27.08.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 08:24:59 -0700 (PDT)
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
X-Inumbo-ID: c18869d9-3b0e-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359500; x=1748964300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xvHAl8YUlbeq9ZsDMffJsYnLgyhpPHQc2K2St+lVIl0=;
        b=o5Gz3YJD/pLSlh6aslwK7KSut/AOCekTPW920fRSdMGnFkJHF3ewdB+W7JpMCy919q
         9E7uavJtdgiaa6qCR9r24kbfYvbbtLVYjnvjeRi8zuHuyV2q30CkkNGogKOm/eb41eH/
         j6kGBTOXHIZUFrBwm1nSEl/64a/kXzmKABWMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359500; x=1748964300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvHAl8YUlbeq9ZsDMffJsYnLgyhpPHQc2K2St+lVIl0=;
        b=cgBlk8WY8tgJbmr1IWboNwWp81r/rHR4JDWbRzAXS69wL2Nk9Vp3D8BM1i68uFzGgo
         +RSSBaZ0P27sX+tRu558cHhjQHULagzq8+hvKM2HNZW/qpypBTNBWPi7mjQT7KD41F++
         OGgUEWoRf3FnTIBeon3PYv3Cd+bswKyZLhUHO9rf6LLJ6JZqluhvOnMRRd2/N1yKoP9K
         ZF8GpPIvtZfdJPMBTz+b/3tPgZ3xQaLi36Q9L7EeYTcShYsFWs9kL6dWrPnFTWr0oL40
         Z6nAouXt+7h4m0jHxvBzJSZDBceKBlzF7fYJ4/oZFtSb6TJH4AJ4HCVkFg04x3bjYeWj
         ZRRg==
X-Gm-Message-State: AOJu0YyQWIqWBGMs07nt9+mfYfxe89FbtcdPmjSG7j6LhzSuz2FeGA7P
	S9rX+jAWMuSwzIzPgPl7Cb3xWpDdcK4eM4095LLQGLJ1WWst4yYPpSy7ikDDAP2ZX3g=
X-Gm-Gg: ASbGncuvqzSapHuZMhkHJSiZIQ7pc8DJVI3FPmL2TGvQ2e+h1KaUxkwG+raZgSjHjuO
	VxBy1BqxBnJ2/iYsdT9QbrpmDR4ClLMFanB1ZCdwpcgGeNLeG4AEJkeZowMaUyjT3tpP510M4sp
	TUmi0ibHUclQn6ff630b7gjARMxFiHI+NWzAvq78CWsg+prnU9LRdvQJ5TKQNPXfoFAjfNfENUF
	kywK2Y1XH5wD54jr2yak0ZlzZIA/TsKoJYDZvCigXlWWoVXacaD3uUF1h7PhMm9ceq3uV1b6rrl
	0MyC1kF3k4uAPYX1+zk+WTYFv1rSVlmxsC9GS6wDqk2DbWqDrV1J6eoEEtzWBA==
X-Google-Smtp-Source: AGHT+IFK2G0n2BxBtCRpvhJ511swp0KxHtzJIrD+n/H5SdZ0rkk6FE8dM+HdZ1yNh2wn558/JvHn8w==
X-Received: by 2002:a05:620a:4482:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7ceecb95b11mr1730610585a.28.1748359500392;
        Tue, 27 May 2025 08:25:00 -0700 (PDT)
Message-ID: <b5dfadcb-6f22-40bb-84a9-fcc48955c44c@citrix.com>
Date: Tue, 27 May 2025 16:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-3-andrew.cooper3@citrix.com> <aDXFviVAxsscfKV2@l14>
 <aDXX-PagUgzu54u4@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDXX-PagUgzu54u4@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 4:19 pm, Marek Marczykowski-Górecki wrote:
> On Tue, May 27, 2025 at 04:01:34PM +0200, Anthony PERARD wrote:
>> On Thu, May 22, 2025 at 06:36:39PM +0100, Andrew Cooper wrote:
>>> For Qubes, this requires switching from sh to bash.
>>>
>>> This reduces the number of times the target filename needs to be written to 1.
>>>
>>> Expand the comment to explain the concatination constraints.
>> Isn't the correct spelling "concatenation"? Same for the two comments.
>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> I would like to find a slightly nicer way of conditional parts, but nothing
>>> comes to mind.
>> Well, one way I can think of is having a new variable which can carry
>> the rootfs part associated with a particular test, then that variable
>> can be updated at the time we configure for that test. Something like:
>>
>> # init
>> declare -a append_rootfs_part
>> # or append_rootfs_part=() is probably fine too.
>>
>> case $test in
>>   argo)
>>     append_rootfs_part+=(argo.cpio.gz)
>>     # ... other test configuration
>>     ;;
>> esac
>>
>> # Dom0 rootfs
>> parts=(
>>     rootfs.cpio.gz
>>     xen-tools.cpio.gz
>>     "${append_rootfs_part[@]}"
>> )
>>
>> And that should works fine, even if there isn't any extra rootfs part.
> That would work for compressed parts, but not for uncompressed - which
> need to come before all compressed. But maybe there could be two arrays
> - one for uncompressed and another for compressed? Then, each could be
> extended anywhere, without messing the order.

Hmm, two might work, but they surely need to not be quoted when forming
parts=(), or having multiple entries will go wrong on the eventual cat
command line.

~Andrew

