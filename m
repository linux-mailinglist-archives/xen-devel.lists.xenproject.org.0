Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7E83B594
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 00:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671290.1044548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSmea-0000QF-HE; Wed, 24 Jan 2024 23:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671290.1044548; Wed, 24 Jan 2024 23:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSmea-0000NM-Cq; Wed, 24 Jan 2024 23:27:32 +0000
Received: by outflank-mailman (input) for mailman id 671290;
 Wed, 24 Jan 2024 23:27:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zgc/=JC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSmeZ-0000NG-2h
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 23:27:31 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 245aac8f-bb10-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 00:27:30 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3150c9568bso76222766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 15:27:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 ew21-20020a170907951500b00a311082cd00sm377047ejc.37.2024.01.24.15.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:27:29 -0800 (PST)
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
X-Inumbo-ID: 245aac8f-bb10-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706138849; x=1706743649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tEn01KwZNU0+GA5hs7byTE8DBvbc2zLj1d+aiVcGjo=;
        b=ti8wW44YAN9PIXYK4VHADa9WocCeRFnA2kP3FgQvrMqzq1xSJ0XgLI4x4A0CYzkaa9
         KqPgDk/6791Yla+wi7nPajxsm9lVwwSuWhUb+dzCROFOHNLAuFUncygOUzYWcunNWOYE
         w5UlCV9j9u3PxVB8bwpaXJTVvrWahvXusI+Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706138849; x=1706743649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tEn01KwZNU0+GA5hs7byTE8DBvbc2zLj1d+aiVcGjo=;
        b=qF8Qmhy1pkpPkn9dVCMM5uG4qJ70epJ33NXz69eGLT7vg9zXYxiQZSotGO9KH0ZNmA
         Cv6UhYEKxV+HFkpk46aq51NrTJZWR0tm331RIs37R2wqQihtvwokJPlzMMj5Vue23ivk
         thjDLLQZdHsXLBwUEwyKFzJFJKLt+gKqh+74/JJlaQae/wZKib15o4kqRmjKFGGtfNOZ
         2trfeznYJcERMgmybkmCnM+4EZMDoLhPMNPhU7gXJrsfkUYVlhBZWdpPz3FtqhHUxHnh
         EfQi9zLv27PvE5YywxvbXkOEBfsLPsk0aDfbsZIY90nxpNSpHXVlmD8OCR/5iRmiyLDl
         dcXQ==
X-Gm-Message-State: AOJu0YxIv6B4nkhbAkHPNfJm6W5ndOsyvBymUGx7eWQ5fcRFCX8o0twY
	sU4T0gxeHdHcbtIF+Neq8unkr6MO+VDvUtHPUyFm3OHiBHT1D3NVy0X6w7KLQME=
X-Google-Smtp-Source: AGHT+IFoRyoZ4FclVKG6OguP1WAErK5PP5pzsY/uUUUGO95/C7nY3i3f0g+acqdGj0Gn6SQMvk69LQ==
X-Received: by 2002:a17:906:da0e:b0:a30:8f07:ba00 with SMTP id fi14-20020a170906da0e00b00a308f07ba00mr24629ejb.224.1706138849539;
        Wed, 24 Jan 2024 15:27:29 -0800 (PST)
Message-ID: <211c5cbb-2269-48b6-91b5-3a1a8127ce48@citrix.com>
Date: Wed, 24 Jan 2024 23:27:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Paul Leiber <paul@onlineschubla.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <D2496DDC-78FA-4CC1-B7FC-EB62E506BC4F@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D2496DDC-78FA-4CC1-B7FC-EB62E506BC4F@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2024 8:29 am, Bertrand Marquis wrote:
>> Thanks for raising the visibility of this.  I'm not familiar with ARM,
>> but if I were investigating this I'd try to figure out what the
>> "unhandled" error messages are.  "gnttab_mark_dirty not implemented
>> yet" looks pretty sus too, and also sounds like it might be something
>> ARM-specific.
> I tried to explain those and they are not the reason of the problem.

The "gnttab_mark_dirty not implemented yet" printk() should be deleted.

It's /* TODO - logdirty support */ in a form that is actively unhelpful
to people using a debug hypervisor to debug other things.

~Andrew

