Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1925AC69F9
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 15:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999410.1380103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKGR8-000320-Nz; Wed, 28 May 2025 13:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999410.1380103; Wed, 28 May 2025 13:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKGR8-0002zs-Kr; Wed, 28 May 2025 13:03:14 +0000
Received: by outflank-mailman (input) for mailman id 999410;
 Wed, 28 May 2025 13:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isSc=YM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uKGR7-0002zm-Ns
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 13:03:13 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc8477b-3bc4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 15:03:11 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad8a6c202ffso70637066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 06:03:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a19adc74sm104061566b.32.2025.05.28.06.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 06:02:55 -0700 (PDT)
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
X-Inumbo-ID: 1bc8477b-3bc4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748437391; x=1749042191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pNvINVs7gmZNYXmnuabnAH7O2eXk3CaMnroHsqWYhpo=;
        b=cFw+jN1oXnht8kEjkYbXO8sTem/f5dd+DtIzChE9E4AhImWCohusAHw4c90/VJJ5VT
         9j9hOJ1UPwA8Mc/S4o7OgvENb0D98OGATzIuWSKST/FSwsHQf3g5S4VXvq+PI1n9lNGA
         r1qlwsgc8/Opmow5NTY8LBnrKqh4uQ6Luu0Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437391; x=1749042191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNvINVs7gmZNYXmnuabnAH7O2eXk3CaMnroHsqWYhpo=;
        b=B5hod+QFxYcAMK751+zaK70JarlgyshlzS4wMJ+oM3waVQN4iuHLTYYLGfwHn4mTOi
         ZdPNBH1OAtENmaqJVTUDpjiKdG2SYIanhYxK4R+B6JfPwbiL0qJQcaSH3xoy3ts2K0pr
         k7KNYzpgnsQrOSRvEFi5WgtAeLbvuuqWAQKEi3eoqadRsan5SxQRCIyrkkkiPFG592Va
         b0G9644BpOrRM32xHPwLY2Lt5+C/R8Fx0J44+yP2mtk5Ig3wHPSoL7iTpiNoiEs1sn6Z
         XxWfYqhHpt8qZlSAJOyJWC9w1TRsbnGbWWdpfgSqpSi40vGcpAtPr2dcaEOCM4A2GUE/
         OfHA==
X-Gm-Message-State: AOJu0YyBIJbi2Gm/G75wulg2SDTWgOuqxkF1o1C/VQp+sJLAJP7hErYo
	3HMw26lnU+EpgYsvuCnpOcnM+5+O9SbFu9bi78CwYkb5r/K+ar0pOQHZacvP4+H90vSMIcAmDe3
	2WjFV
X-Gm-Gg: ASbGnctHwNd8SHv2mhh8TsGcIIQNM09cBtzjmRfRu6BCQAOa0AV8YFdNLuCEFqXeLxv
	QrTVY9uLAykXQOAQLp7CvHJir5HgQqk0fI1gFZpB6KCnoqxjR8OZZFDqFB5x0h9LOZdsvTT3Di7
	hJ9xcRIQK1VWnO23pxqe4hL9VrUFJdOKCz58W3CWzoKXLaSsiki/rC04masFrk89dKZZO1Nk+QD
	oYCs9m/yEeAqxOoMgayDfhIJvvTmy+PDlNa1kvFnVMnxrH+03kuRUbmCqIWCNJNGh3ve8FurDjV
	Pthp0WhbVpBJnQc9rTD1FwnCYlO+JCX+lRVJu/x2RuYh6/koa3KT4o4IMENU08TN2oF6bet0MFP
	ctARbrIuxUPrw3z6QBR5Qccihg9s=
X-Google-Smtp-Source: AGHT+IFScGN7b8CVhZBRudIk1LkuVL0EN+28rGkY7rBVlk8sC6T31+PZ34klmcF4M0ms7DF4XnnKoQ==
X-Received: by 2002:a17:907:2d23:b0:ad8:a935:b906 with SMTP id a640c23a62f3a-ad8a935c9a9mr71523566b.0.1748437376316;
        Wed, 28 May 2025 06:02:56 -0700 (PDT)
Message-ID: <0c68b3ed-9dc8-4802-8889-9971d8c45e0a@citrix.com>
Date: Wed, 28 May 2025 14:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Trim includes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>
References: <20250527150911.59744-1-andrew.cooper3@citrix.com>
 <aDcE5K9oUI5nYEPk@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDcE5K9oUI5nYEPk@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2025 1:43 pm, Roger Pau Monné wrote:
> On Tue, May 27, 2025 at 04:09:11PM +0100, Andrew Cooper wrote:
>> None of these are used by traps.c today.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I'm experimenting with include-what-you-use but it's not the most
>> ergonomic of tools to use.
> Does include-what-you-use take into account #ifdef sections?  I'm
> wondering whether non-default Kconfig could require extra headers that
> are not accounted for the tool?

Testing suggests that it does a normal preprocessor pass first.

Given:

    #include <xen/bitops.h>

    #if 0
    void *ptr = NULL;
    #endif

the report suggests:

arch/x86/iwyu.c should add these lines:

arch/x86/iwyu.c should remove these lines:
- #include <xen/bitops.h>  // lines 1-1

The full include-list for arch/x86/iwyu.c:
---


and does not make the recommendation to include <xen/types.h> to get NULL.


For traps.c,

grep -e '#ifdef' -e '#.*defined(' -e "IS_ENABLED" arch/x86/traps.c
#ifdef NDEBUG
#ifdef CONFIG_PV32
#ifdef CONFIG_HVM
#ifdef CONFIG_XEN_SHSTK
#if !defined(CONFIG_FRAME_POINTER)
    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
    if ( IS_ENABLED(CONFIG_DEBUG) && print )
#ifdef CONFIG_PV
#ifdef CONFIG_PV
#ifdef CONFIG_PV
#ifdef CONFIG_PV
        if ( IS_ENABLED(CONFIG_PV) && ret == EXCRET_fault_fixed )
#ifdef CONFIG_PV
#ifdef CONFIG_PV
#ifdef CONFIG_PV
#ifdef CONFIG_DEBUG

and each of HVM, PV and PV32 and XEN_SHSTK are active in the analysis I did.

NDEBUG, CONFIG_DEBUG and CONFIG_FRAME_POINTER aren't doing anything
interesting here.

So I think this patch for traps.c is accurate.

setup.c is far less certain, and I'll need to do some more analysis
before committing that.

~Andrew

