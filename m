Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B328908D00
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 16:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740733.1147833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7Zz-0005lL-Ge; Fri, 14 Jun 2024 14:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740733.1147833; Fri, 14 Jun 2024 14:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7Zz-0005j0-CS; Fri, 14 Jun 2024 14:06:59 +0000
Received: by outflank-mailman (input) for mailman id 740733;
 Fri, 14 Jun 2024 14:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sI7Zy-0005iu-4h
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 14:06:58 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bfd33a9-2a57-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 16:06:57 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso36321931fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 07:06:57 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da40f6sm188129666b.43.2024.06.14.07.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 07:06:55 -0700 (PDT)
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
X-Inumbo-ID: 5bfd33a9-2a57-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718374016; x=1718978816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GG+LmC7JCivuLSPlMRF8/UrM2XQvSMmEr23dsq/XCts=;
        b=g9D6z41rD55BLBvRk+HvWdPPeguk7ai9cjzqSGZotEHVc98Jyebv17y1Co73+bk813
         8eAzcu7MBgvYHHYGJN40h4Ody0/1qYXLN3uEQYYMZPHSkxm9+awJblypecVuH4Gzpt5C
         QMOeRSKjFqcs1CcC3ikPp5l2Q7nu3ukyvRoBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374016; x=1718978816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG+LmC7JCivuLSPlMRF8/UrM2XQvSMmEr23dsq/XCts=;
        b=n0cloHCabaCo4t1MgMP7g0OVkz0Bxi9OLZ0j7cQknMyV2bfe83DI3O0e8j220bPniD
         j61MIUM/tytFxmaHedHRYoyKthD6HLh2vKPemF5LC8w8uqasOgRlXqw8VUIDeRVyEl2o
         eugUUcwsItBjURguxhROOnS8aZ+l97zITbsJSBkTW4koewzJLBy234rvDAWGRHd90vmj
         du4esKDqB6iVAcbgFDuT90SnJuj+5nbMcr+QqNNNDbYCce7W2HClpQvJme2Fqs9iJ9Rt
         FzbxMjVmGYvboaj/4n1YuqHTQUAIhynk5zgo7A7YwV9y7cYF7myzSj2nB5g9LQdcP1jA
         e2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNnbGDd4WxS7NThVKADfuJ1dx3yjweAJ8+h/jMt40r1/veCIpYBKJIsfw76/Ih/5BadEUcU0qpyagXhDW16GyvyFbQYcc+9D1h1vWu/Aw=
X-Gm-Message-State: AOJu0YwdWMAKjHPRm14FIGwmv1ceTXlL2wbKYTc1hBW1MWpKVyn4YmD1
	fprfw72ci4FDu2GTLxKuv1IuattcSdNp0X+xQaW8KBjjL4rkCFRA01jVHQu3NsI=
X-Google-Smtp-Source: AGHT+IHkmnkjurRVetym/WDZPXA+ZsFtgqHA1M1O5kWuGSQUyXbMYFpjVxVDT40XkMZ6ilPvaHmpXQ==
X-Received: by 2002:a05:6512:549:b0:521:cc8a:46dd with SMTP id 2adb3069b0e04-52ca6e56e2dmr2216246e87.11.1718374016080;
        Fri, 14 Jun 2024 07:06:56 -0700 (PDT)
Message-ID: <49313683-fb34-4f6f-a41c-e02ea6837cfd@citrix.com>
Date: Fri, 14 Jun 2024 15:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/cpuid: Fix handling of XSAVE dynamic leaves
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-7-andrew.cooper3@citrix.com>
 <9e6803c6-3d83-4e5c-a7bd-b8b844eec66d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9e6803c6-3d83-4e5c-a7bd-b8b844eec66d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 5:16 pm, Jan Beulich wrote:
> On 23.05.2024 13:16, Andrew Cooper wrote:
>> First, if XSAVE is available in hardware but not visible to the guest, the
>> dynamic leaves shouldn't be filled in.
>>
>> Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
>> host/guest state automatically, but there is provision for "host only" bits to
>> be set, so the implications are still accurate.
>>
>> Introduce xstate_compressed_size() to mirror the uncompressed one.  Cross
>> check it at boot.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Irrespective ...
>
>> v3:
>>  * Adjust commit message about !XSAVE guests
>>  * Rebase over boot time cross check
>>  * Use raw policy
> ... it should probably have occurred to me earlier on to ask: Why raw policy?
> Isn't the host one the more appropriate one to use for any kind of internal
> decisions?

State information is identical in all policies.  It's the ABI of the
X{SAVE,RSTOR}* instructions.

Beyond that, consistency.

xstate_uncompressed_size() does strictly need to be the raw policy,
because it is used by recalculate_xstate() to calculate the host policy.

xstate_compressed_size() doesn't have the same restriction, but should
use the same source of data.

Finally, xstate_{un,}compressed_size() aren't really tied to a choice of
features in the first place.  They shouldn't be limited to the
host_policy's subset of active features.

~Andrew

