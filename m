Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B119442F2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 07:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769287.1180161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZOnp-00040l-Q9; Thu, 01 Aug 2024 05:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769287.1180161; Thu, 01 Aug 2024 05:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZOnp-0003yd-NB; Thu, 01 Aug 2024 05:56:41 +0000
Received: by outflank-mailman (input) for mailman id 769287;
 Thu, 01 Aug 2024 05:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZOnn-0003wm-U7
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 05:56:39 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d123e207-4fca-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 07:56:38 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52f04150796so10860308e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 22:56:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b038asm9570234a12.14.2024.07.31.22.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 22:56:37 -0700 (PDT)
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
X-Inumbo-ID: d123e207-4fca-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722491798; x=1723096598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tEnuP/UL4tXxHZWH01vp9h0c1uyXvZsZkgf8LziZQs=;
        b=DXD0Y5pmfzD/Eo7Gm+cWSUXfbJkGf3hNU99DN/2Ax6gLgokjsL2hdkfyWVnlPXSls7
         QRXS2J83bY/V0nE/Iz+fR6cOwIB0ZzQgmBX/cgMwpEJCX4VCE2SLAOQMEAaVJPFZSyiY
         HUHuH3e2ctkz+zOy/emj4U9ozcUZnNSt1A6s+sOj/oPInYSHoLw9995lAO4VMU5FB6FF
         XoWrOIw9trJtBnYcfhE9dvOatMN1kd6kb9AXvV1NeRdCl4htIWPm7/g1/Rl9Gt6/lx7q
         HFdeb7C2gyL68w+dTm59Jd4hpjNp0cafHoNTqmuUmlcQgCGd9d3ri58XzesvRCFyfNIE
         xZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722491798; x=1723096598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tEnuP/UL4tXxHZWH01vp9h0c1uyXvZsZkgf8LziZQs=;
        b=voOUjc5vUCa59AO9JvpHIS071/UsrWX4B5NTSzWlEkvTS2+ORxIJTMo/Rka2ceyN46
         +VLjWRwohap5JD+yK95OGX0fhL2kDnTw6LfimK3PlRIH7vGu2/u1KLG95wSrCvWqKAUu
         GdjNaXKPATMx0y2HWYhDZCQpnbjb4R4vrCCJzsQqW6tQCXPtOVJInOBWubuALJ1yzSBV
         z8/OkU8wtlO8IlgMoU5fWMDP1T/tNW3elh6V7b4GTLp7Yny+TgaHzyTmf91PB2FYij6f
         0GNJVEDha6VQd5AHBilFDOB2sZj+mqAJ5GXmp7ZNnneyjdHu2YRN/uV4PX0m9IhsqaAN
         D6+g==
X-Forwarded-Encrypted: i=1; AJvYcCWAdmqk8pF253zxTpvaYNDLU13XNtNq4Cu51HwREIrBVzk8sb56CqDSOvwinOviy4wkPS+g7vgLl/hvJdqSUWeTq5Sl+ZEXA0l90lFnHek=
X-Gm-Message-State: AOJu0YzynFFoRDvQ3Of2L19lArpaGNn5Ib/59o6ajNwjAd83/d6Z6BHZ
	BCviVOD4JnsTvbS+UiYN7jIznN4iKgLMSR/Fl8APfPuij4zY4W8SbmHH+Z/2Ydsn3rK7q5dbyyz
	s
X-Google-Smtp-Source: AGHT+IHCsd4f1Vqscyy4MNsvfeakSMScTCWtggjocQ8t3UXWgk6i+/pi+BdfpwDEC/vxDl6Ak6Dpag==
X-Received: by 2002:a05:6512:4851:b0:52e:9b68:d2d4 with SMTP id 2adb3069b0e04-530b6211441mr534845e87.56.1722491797556;
        Wed, 31 Jul 2024 22:56:37 -0700 (PDT)
Message-ID: <8fef9511-c5d0-49a9-a800-6087f03b3199@suse.com>
Date: Thu, 1 Aug 2024 07:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-3-jgross@suse.com>
 <20240731212752.zd5njpd7kgoc433d@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240731212752.zd5njpd7kgoc433d@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.24 23:27, Samuel Thibault wrote:
> Hello,
> 
> Juergen Gross, le mer. 31 juil. 2024 15:00:25 +0200, a ecrit:
>> -pgentry_t *need_pgt(unsigned long va)
>> +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
>> +                         pgentry_t *pte, void *par)
>>   {
> [...]
>> +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
> 
> Did you mean (*pte & _PAGE_PSE)?

No. I want to bail out if the PTE does not require a page table to be
added to it. This is the case if the PTE is valid or if it is at the
lowest page table level already.

An invalid PTE with PSE set is still invalid, so the PSE bit has no
real meaning.


Juergen

