Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82FE57FB30
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 10:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374452.606509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFtMg-0003lC-7u; Mon, 25 Jul 2022 08:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374452.606509; Mon, 25 Jul 2022 08:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFtMg-0003i9-4v; Mon, 25 Jul 2022 08:22:58 +0000
Received: by outflank-mailman (input) for mailman id 374452;
 Mon, 25 Jul 2022 08:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rs0=X6=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oFtMe-0003hz-VE
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 08:22:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0f1410-0bf2-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 10:22:56 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so7328035wmq.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jul 2022 01:22:55 -0700 (PDT)
Received: from [192.168.43.143] ([62.74.23.66])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a310fe1d75sm18959251wmq.38.2022.07.25.01.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 01:22:54 -0700 (PDT)
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
X-Inumbo-ID: fc0f1410-0bf2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=15aj+0E/UcFe5hRzcTzX2m7ze62KPV2MGGip38EmLKU=;
        b=QNEqUSqby8SN60gPFrHSLP8iubXPMcJEPrT0eSYx9PVHS1u28V735xzZI++/rKHsYU
         tnJ9d0KqnogQUS7e0LEDz/mHdxIyo6+epciX/dt4ip68/SJ019OHFW98fa8G66yKbofk
         3xK2xuS44EgZCCePMjI+E2GrqxXzYsCJwNdTRyy5rhz8fAkCK9uq+Yo3pfDhoFSOq4fB
         xaqWqsyDV6R5hp826d02lmaWPxNg3ksQomYOVKfVgfWkJWsPhyPz2xkwJudp4AR+TgdX
         WzNUGo9ik7JX+Yc1TOf/t+irVu7H3aUP/qlimIxMbG6MeZbVBURYIVLDzGnqCKEgAcvZ
         SocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=15aj+0E/UcFe5hRzcTzX2m7ze62KPV2MGGip38EmLKU=;
        b=oMdBsq7DDskwbdh4h4n56IpaHWSOdIsgLSBLBfE5SDYSUifRKLph7nd77UsAURNJ4z
         M8seITGbNYq+iMhPUYipS+y/kdBkaAfbOOErKTR8OlDyKACBiPlLZ8549k9Nw7MxmEmM
         AD2I+7v8THNvzwKQASoQtCh74YNl+QzUdgt9b0qmVACbRGFOKboOl7dH+xbG+mydGvR+
         cG8pnPSxMWB0Kigo04sQBwL9fe6NF+9Xp/GqsVw1AEF3B3vVOidQTlvaGB07qrV0AE3A
         seL3BMak9Xr5tYmxgsdK+RwDvl+cnkrwRToUryTBfNoDnTB8cySFsPPQmGmE0qaRoEvu
         GVOw==
X-Gm-Message-State: AJIora/cPKRmIrNaktJpWf5F2F6tAsgPI+zCyjgb9QrzMQZ+g1UI23Ck
	1NxgZmdErkezZGWdaGASvZAsfUPkP+4=
X-Google-Smtp-Source: AGRyM1tsHG2gnVWK6/oSuF1dxKOiQ7tMYSBKmx7WEdXBE6xLj3X2Q8sy38lYXE89srUnCMAvVzVLhA==
X-Received: by 2002:a1c:27c4:0:b0:3a3:365d:10a2 with SMTP id n187-20020a1c27c4000000b003a3365d10a2mr13146366wmn.61.1658737375234;
        Mon, 25 Jul 2022 01:22:55 -0700 (PDT)
Message-ID: <1d64331b-5258-6c91-82a7-54fc7f2600ab@gmail.com>
Date: Mon, 25 Jul 2022 11:22:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220724173159.410535-1-burzalodowa@gmail.com>
 <69b5906f-163b-b7cd-81ed-98be8e45bdf2@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <69b5906f-163b-b7cd-81ed-98be8e45bdf2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/25/22 11:00, Jan Beulich wrote:
> On 24.07.2022 19:31, Xenia Ragiadakou wrote:
>> The function snprintf() returns the number of characters that would have been
>> written in the buffer if the buffer size had been sufficiently large,
>> not counting the terminating null character.
>> Hence, the value returned is not guaranteed to be smaller than the buffer size.
>> Check the return value of snprintf to prevent leaking stack contents to the
>> guest by accident.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>> I 've noticed that in general in xen the return value of snprintf is not
>> checked. Is there a particular reason for this? I mean if there is no space to
>> fit the entire string, is it preferable to write only a part of it instead of
>> failing? If that's the case, then scnprintf could be used instead below.
> 
> You will find lack of checking particularly in cases where the buffer size
> has been chosen to always fit the (expected) to-be-formatted value(s).
> While in a number of (most?) cases this ends up being fragile when
> considering general portability (like assuming that "unsigned int" can
> always be expressed in 10 decimal digits), I guess making such assumptions
> has been deemed "good enough" up until now. I think this also applies here,
> so ...
> 
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -377,6 +377,8 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>>       unsigned int e_namelen, e_len;
>>   
>>       e_namelen = snprintf(name, sizeof(name), template->e.name, id);
>> +    if ( e_namelen >= sizeof(name) )
>> +        return -ENOBUFS;
> 
> ... I wonder whether you don't want to additionally put ASSERT_UNREACHABLE()
> here (but leave -ENOBUFS to keep release builds safe). (I also take it that
> you haven't found an actual case of the buffer being too small here?)

hypfs_read_dyndir_id_entry() currently is used only by the cpupool 
pooldir and the name needs to hold an unsigned int. So, currently there 
is not a case of the buffer being too small.

> 
> But of course the main purpose of using snprintf() is to avoid buffer
> overrun, so truncation is indeed deemed only secondary in many cases.
> Which doesn't mean adding such checks would be unwelcome - it's just that
> in some of the cases your options are limited - see e.g. the other similar
> use of snprintf() in hypfs_gen_dyndir_id_entry(), where the function doesn't
> presently have any error cases.

What I considered an issue here is that when copying the buffer to the 
guest we use the value returned by snprintf().

copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name, e_namelen + 1)

Also, if truncation is not considered an issue, I can remove the check 
and replace snprintf with scnprintf.

-- 
Xenia

