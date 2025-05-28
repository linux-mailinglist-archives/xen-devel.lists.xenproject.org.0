Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E61AC68E3
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 14:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999368.1380045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKFe8-0003S4-Hm; Wed, 28 May 2025 12:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999368.1380045; Wed, 28 May 2025 12:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKFe8-0003Pd-EH; Wed, 28 May 2025 12:12:36 +0000
Received: by outflank-mailman (input) for mailman id 999368;
 Wed, 28 May 2025 12:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isSc=YM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uKFe6-0003PX-EV
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 12:12:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e135fa-3bbd-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 14:12:33 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad69e4f2100so662221966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 05:12:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a19ad3f2sm96862666b.36.2025.05.28.05.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 05:12:32 -0700 (PDT)
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
X-Inumbo-ID: 08e135fa-3bbd-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748434353; x=1749039153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/8XPbmZZrPbEhugF2Ma/nX1LS00H4PPsJY3H+d7TJ+0=;
        b=ocJAvFYTkm+rEGLpRXmANjSYBpBdBNEOguQufE9Epa53JuGQ98lSNhfZ3QTmCGIFDS
         F21jCpQJqcVZSEyQXujs6SMKKbjwkhT6IwcnJkDQTwWaEWRwXiYBtCFz1gFJwez/WFJ8
         hzqD3SA9kWbNZwv/Q/IqpkldO19YnQwyl8+gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434353; x=1749039153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8XPbmZZrPbEhugF2Ma/nX1LS00H4PPsJY3H+d7TJ+0=;
        b=kWM0VxBfFdu7T8TcJpFIYouGnKSIx2I5flFkNaWKgDC7ejjMoKRAJ+uTwXEVQpRS/r
         9lUlzcbQWBSUtHecJ+PJIO2IdFjP+6q9U+aCXSK0U7AInJHWH+wjEdrJdZZnT3VzOFAx
         B3uTQl3WGfSGHtvKJJBrEVyrjkPRMCRZTXRCt5fKXlqLoFGV2b5opfwf0egMIddJXSny
         LTEjPC17Y6IVH1YvHDPyAJzJ0BPvsmnNl2cgI5ZjGq8BE6qx0r0nKsiWNXi0qRaz1DZ2
         PK93tnEARtPQM5nmPdBCgMOEmkdJcOIi4AWUky0V3V/LamXLRpRxhufGJ9PmDxo0gSEt
         mw8w==
X-Forwarded-Encrypted: i=1; AJvYcCXT4ECG6JqlYWTG9z4utYZnwBfoQN5vDYaRnmN4B4OaGKSsM+xUDpdYbjeAiV4YJYjIWsMwlI/YAFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyndoGuPffWUhRywAVZ42qePVbIB1xYuC+ALo5+oTL3SH9lNTOX
	QZ0ky8pb+beaLjVBe4OR6mwfwTymmrIleZaTvurhc1RjpWZUo1DSKMqte7Ez0tv7cyvbtkAdpJt
	LhhX0
X-Gm-Gg: ASbGncsbQ6vur79S6PYIrKrre/3RxcYa1trXVMBSI7qxRm0QOXDUE7pbuBIXzoKW4Dc
	2NeXedJIgpvsXjewIf7chFXs2NxyhaW0DAO23FY6XdT6YGqec/vCSJvT84yol19Kb66mDoC3Mfr
	pMzBwUxg20t1dbOHTmAWCdOGyJ7X/0wVwzfOiCePYkm/wyzIsyc3ebXAgJcyoc48evRapc8snIp
	ghxeIwNko8SeQxRLL9LfYRTiVw22G4oGTz+TNSOx2PyjyrxDxKe9l7Xkb2CWQ1auqimYjJBa/D3
	lyDsiR2iHdckoD1vpt9Gku0uPGf4BABvAXgrIrIdZ+Vr+cfBO68o/4Rrp6grqLUlTAUFNhUM3DW
	rJrs6maVIOc5MPwIb
X-Google-Smtp-Source: AGHT+IEdc0v/AGFEEUbRTlAW4HFOAAsCdXi3mJmhev9JryzswbNtSpC5Vrx4BK+aSwaTPTJiRRHkXA==
X-Received: by 2002:a17:907:7e8c:b0:ad2:3577:38fb with SMTP id a640c23a62f3a-ad85b1ce89emr1474791466b.30.1748434352748;
        Wed, 28 May 2025 05:12:32 -0700 (PDT)
Message-ID: <2fbcfbee-1ae6-47b9-b6e3-32d3330f2d02@citrix.com>
Date: Wed, 28 May 2025 13:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction
To: Anthony PERARD <anthony@xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-3-andrew.cooper3@citrix.com> <aDXFviVAxsscfKV2@l14>
 <aDXX-PagUgzu54u4@mail-itl> <b5dfadcb-6f22-40bb-84a9-fcc48955c44c@citrix.com>
 <aDbbL9cgz5ZqFV5O@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDbbL9cgz5ZqFV5O@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2025 10:45 am, Anthony PERARD wrote:
> On Tue, May 27, 2025 at 04:24:57PM +0100, Andrew Cooper wrote:
>> On 27/05/2025 4:19 pm, Marek Marczykowski-Górecki wrote:
>>> On Tue, May 27, 2025 at 04:01:34PM +0200, Anthony PERARD wrote:
>>>> On Thu, May 22, 2025 at 06:36:39PM +0100, Andrew Cooper wrote:
>>>>> For Qubes, this requires switching from sh to bash.
>>>>>
>>>>> This reduces the number of times the target filename needs to be written to 1.
>>>>>
>>>>> Expand the comment to explain the concatination constraints.
>>>> Isn't the correct spelling "concatenation"? Same for the two comments.
>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> I would like to find a slightly nicer way of conditional parts, but nothing
>>>>> comes to mind.
>>>> Well, one way I can think of is having a new variable which can carry
>>>> the rootfs part associated with a particular test, then that variable
>>>> can be updated at the time we configure for that test. Something like:
>>>>
>>>> # init
>>>> declare -a append_rootfs_part
>>>> # or append_rootfs_part=() is probably fine too.
>>>>
>>>> case $test in
>>>>   argo)
>>>>     append_rootfs_part+=(argo.cpio.gz)
>>>>     # ... other test configuration
>>>>     ;;
>>>> esac
>>>>
>>>> # Dom0 rootfs
>>>> parts=(
>>>>     rootfs.cpio.gz
>>>>     xen-tools.cpio.gz
>>>>     "${append_rootfs_part[@]}"
>>>> )
>>>>
>>>> And that should works fine, even if there isn't any extra rootfs part.
>>> That would work for compressed parts, but not for uncompressed - which
>>> need to come before all compressed. But maybe there could be two arrays
>>> - one for uncompressed and another for compressed? Then, each could be
>>> extended anywhere, without messing the order.
> You could use "${append_rootfs_part:#*.gz}" and
> "${(M)append_rootfs_part:#*.gz}" to grab the uncompressed part then the
> compressed part... on zsh :-). But something similar could be codded in
> bash. But I guess two variables will be more acceptable.

I believe there's a restriction that only one type of compression can be
used, but I don't particularly fancy tying it to gz specifically.

Something else to look at in some copious free time is .xz or so.  For
test-artefacts its surely a size win, but whether it's better overall
depends on whether using xz in this script doesn't undo the
optimisations we've been trying.  Once this series is in, we're down to
a handful of tiny text files, so I expect it to be in the noise.

>> Hmm, two might work, but they surely need to not be quoted when forming
>> parts=(), or having multiple entries will go wrong on the eventual cat
>> command line.
> The double quote are needed!

Yes, sorry.  That was a stupid suggestion of mine.  I really ought to
know how "$@" works by now...

~Andrew

