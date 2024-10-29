Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9739B495B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 13:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827342.1241932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5l6r-0007Rd-90; Tue, 29 Oct 2024 12:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827342.1241932; Tue, 29 Oct 2024 12:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5l6r-0007Or-5i; Tue, 29 Oct 2024 12:14:05 +0000
Received: by outflank-mailman (input) for mailman id 827342;
 Tue, 29 Oct 2024 12:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5l6p-0007Of-N5
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 12:14:03 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45793400-95ef-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 13:13:56 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso81482591fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 05:13:56 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0887d8sm462299666b.206.2024.10.29.05.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 05:13:55 -0700 (PDT)
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
X-Inumbo-ID: 45793400-95ef-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1NzkzNDAwLTk1ZWYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjA0MDM2Ljg2NDUyMSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730204036; x=1730808836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNLG94zofXiiI7d0dsBDEMGOuZ2adjcYgITjw7GRDa0=;
        b=vsBBGDIy2dtGYUBQ4jQfvutcktP8GD1OzXfMX921D/+IMMf41aTzbKwckmHsgd8iP9
         Kg5RYKulW/FXoM3edvbjf4UsGxBbIeOdl3aONGFNeJekp/u8MjZsrgKSn/EmQDdpY+nM
         fGYz5XwG7CQZ+dQT97Sup+QUJxE6EEDt+0GdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730204036; x=1730808836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNLG94zofXiiI7d0dsBDEMGOuZ2adjcYgITjw7GRDa0=;
        b=gjbKyhTaCH8QKRXsIxXAJbAkIJwZkm6lkKAkJv6a0UFjte+HgdxmphgTvRxIE0NK/I
         m/YILvMY/YX5r8FRTYy/1cYT4Fc/TCcYoCcSiD4c9u5ae2KODqH9N7HpAAmjbEFr7Mia
         DF7K4cGQ3J4vZAFA/dlwfVOJ6L3OM0bmo/zLslZmhwj/P/yCmXwWteT0IHLljMoEWx/R
         1R/U+rf7wT9SM1j50YHaYZkkZ78gqhVmdU2vtjlxIoXFiKA2XLloEKjxbpARW0FGySiR
         fRfn3Wsf/mqrWTRh6H4ezNf5DL0EJH8IHtEbu4TRSY2/zMAGzXn8b71jmr2ESXVAkK/Y
         QtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE4J7xtCzVljwfUiHUWfpZLTI1r577AztKSawEYsJ5vfDB9sdAk6TGbZbs+d1bOjAF2SfSr1neAV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKOEQb8rYxfp2z6UIdStIQDV5Moj53O7N5itmsNM3G6CSWc/L4
	3EjydZmqh96W/PQaxpvlNYFrJ4vdTHOVFRe55wKQI9YPGS3zGHUk1MNDpoYBJ5I=
X-Google-Smtp-Source: AGHT+IEV02CtnFHSOHWc7WxYUHrNxxp14A1WJXO8mTFQP8aW27YgZc4J/mbc02Vt7XXTlv0cZq0J0g==
X-Received: by 2002:a05:6512:3c9f:b0:539:93b2:1380 with SMTP id 2adb3069b0e04-53b34921b15mr9786845e87.48.1730204036105;
        Tue, 29 Oct 2024 05:13:56 -0700 (PDT)
Message-ID: <2846b6dc-4209-4f1e-8713-cb8e66ca789c@citrix.com>
Date: Tue, 29 Oct 2024 12:13:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Natanael Copa <ncopa@alpinelinux.org>
References: <20241029114158.17231-1-jgross@suse.com> <ZyDL9fGtcouw9bar@begin>
 <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
 <b13cc450-f032-44e2-bbbe-bdc98d4b7050@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b13cc450-f032-44e2-bbbe-bdc98d4b7050@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/10/2024 12:02 pm, Jürgen Groß wrote:
> On 29.10.24 13:01, Andrew Cooper wrote:
>> On 29/10/2024 11:50 am, Samuel Thibault wrote:
>>> Juergen Gross, le mar. 29 oct. 2024 12:41:58 +0100, a ecrit:
>>>> Grub-pv needs start_info_union and phys_to_machine_mapping to be
>>>> accessible. Export both symbols.
>>>>
>>>> Fixes: 33411a11f848 ("Mini-OS: hide all symbols not exported via
>>>> EXPORT_SYMBOLS()")
>>>> Reported-by: Natanael Copa <ncopa@alpinelinux.org>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>>
>> Committed.
>>
>> Jurgen, what do you want to do with updating 4.19?  Don't we need to
>> fork a 4.19 branch to avoid the CONFIG_XC change ?
>
> Yes, I think this is the way to go.

Ok.  https://xenbits.xen.org/gitweb/?p=mini-os.git;a=summary

master has this fix, and there's a new branch, xen-stable-4.19, starting
from the xen-RELEASE-4.19.0 tag with this change backported.

Xen 4.18 and earlier don't have the symbol restrictions.

~Andrew

