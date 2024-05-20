Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068B8C9EA6
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 16:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726166.1130408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s93pF-0008NW-Pc; Mon, 20 May 2024 14:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726166.1130408; Mon, 20 May 2024 14:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s93pF-0008LC-M3; Mon, 20 May 2024 14:17:17 +0000
Received: by outflank-mailman (input) for mailman id 726166;
 Mon, 20 May 2024 14:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfm=MX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s93pD-0008L6-V0
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 14:17:15 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6fc3a87-16b3-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 16:17:13 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5b277e17e15so2489938eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 07:17:13 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2971c5sm1180724485a.51.2024.05.20.07.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 07:17:10 -0700 (PDT)
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
X-Inumbo-ID: a6fc3a87-16b3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716214632; x=1716819432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UhnDU8sUL5y+X8ol6Kjrz9AYZn8Ic1bHjj3hFBtZoXA=;
        b=B6S/9q0WUqtk4QP/l/18ES8sTJNWuVf1pRk7nlHIK8lSAqMSSAFYH8klfOpePYFku0
         XbQDQW45tE9pdYIhatOtnWz4RLZeSKNBKpEwCYEsusQwC9RVMtzAA6dl+Z3MtDS2v/al
         wWfCR6dJEeVlxa9ypXkWScm53h+jFt+0b4ZLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214632; x=1716819432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhnDU8sUL5y+X8ol6Kjrz9AYZn8Ic1bHjj3hFBtZoXA=;
        b=XB1fgl1A4vKGXm5F5XlAjiVYnnJwoBzNbZslCFh/vXCvDkiWuLA7PTsAN/HBUSUayT
         +eNnTGXpjk0pefJeIWIRQzlevT+uehVFw2PavJcEJw2zc1QAjaUEOVe4HaYTTUrMoSv3
         Cslsn8KXKmVG6ktxXN/Vyyneo/8jmCovPJFjl+uE45rzlIXMC+WAXvj9/gR6SSmXL2zQ
         CzFqH+aSvHfwKFqmbRo0zIa4YfDL1bx3rjTrFiabo7j4w/Dvh9b4w27TK0RBWtG2tFAS
         6bTophkENznGw4Mrq2mQpDF8H7t01WttAX4lr6d+XVDc07qRIpsb//R9/jxsYF+Apvii
         +B0g==
X-Gm-Message-State: AOJu0YyBKjFYQ0abmtIr2IxpvIXFlBW/b4rz/2LNdgIqenPQJTU0emXA
	7QMfgzDF3CGzPfcfpQp+NsV9skpMoVboRTZNQcxoKsXIRKpl3GZXmQybSR/zaAY=
X-Google-Smtp-Source: AGHT+IGx9Ht91H+O8exJywiqP5d+wMgeIlRYdoGWm40YSv6Xt6FusoIaExbGcHxv/o+P4EocPvP6bw==
X-Received: by 2002:a05:6870:3b05:b0:248:e519:2185 with SMTP id 586e51a60fabf-248e51943c6mr8134032fac.26.1716214631980;
        Mon, 20 May 2024 07:17:11 -0700 (PDT)
Message-ID: <165c385b-a688-4e87-9e3a-e87ada724595@citrix.com>
Date: Mon, 20 May 2024 15:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/gen-cpuid: Minor cleanup
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-2-andrew.cooper3@citrix.com>
 <ZkMPOxF2aR6wp1Vj@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZkMPOxF2aR6wp1Vj@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 8:14 am, Roger Pau Monné wrote:
> On Fri, May 10, 2024 at 11:39:59PM +0100, Andrew Cooper wrote:
>> Rename INIT_FEATURE_NAMES to INIT_FEATURE_NAME_TO_VAL as we're about to gain a
>> inverse mapping of the same thing.
>>
>> Use dict.items() unconditionally.  iteritems() is a marginal perf optimsiation
>> for Python2 only, and simply not worth the effort on a script this small.
> My understanding is that what used to be iteritems() in Python 2 is
> the behavior of items() in Python 3 (return a generator instead of a
> copy of the dictionary list).

Yes-ish.  They're actually now view() objects following the official
stabilisation of the internal format, which are more-efficient-still in
the common case.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

