Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BEB244E6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 11:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079599.1440357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um7NZ-0003xv-IC; Wed, 13 Aug 2025 09:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079599.1440357; Wed, 13 Aug 2025 09:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um7NZ-0003xK-EI; Wed, 13 Aug 2025 09:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1079599;
 Wed, 13 Aug 2025 09:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um7NY-0003xD-3W
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 09:02:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f6990ba-7824-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 11:02:32 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-459d7726ee6so33299365e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 02:02:32 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac036sm46749052f8f.15.2025.08.13.02.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 02:02:31 -0700 (PDT)
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
X-Inumbo-ID: 3f6990ba-7824-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755075752; x=1755680552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=txaAUTRoBhONYmC+af7jlHgfLxTRbTLT/LQBaQCG6Dk=;
        b=Va7fSjFoWJwj9ISGbzf7VrLH++x/XMiis3RKUSjgV+OOWdqgaDjQSLTtue+FOtCh71
         /aPvY0lqYhTRyJfgjh1BdizlUn8cHJeQm+tKdxpXZf7eL69yjE+r0pvXKmcPa9/so0iz
         gHcmZCZlkCKEWAcdo0A7lbqC7AeNSfQZnLN4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075752; x=1755680552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txaAUTRoBhONYmC+af7jlHgfLxTRbTLT/LQBaQCG6Dk=;
        b=A7FcyevT/cxjG0MPQTKNp4I5fTneGdEKZ8AtrP1bb3uQXZwAqMEaZx/7L+luPpKuv/
         Prh3ItaZGqYVsfN8jUHGMgDNmaKGgFKu8m3cp+gzofyxdzAgjESLZzbQiApBIg7u9Qxw
         iCXIZ+4RH7I/hWiq/oR8V/cEPMSuATtXRPIqAjdjxRhIKl2Gosbj6chPYWPAoqEWj6ta
         CduIRzPCBTltWzGV0PHfE+jK2BX7cqLDidLwbb9nntZjBj7dzy+xP/IZT88bvoPYkmeS
         YUcOROS7TUAGbRbeqF+hWjRQiKuyYQxM9xkRtvDgCclzb0krVK6EsfAkYYFvGuLSYHXC
         hQAg==
X-Forwarded-Encrypted: i=1; AJvYcCWWiu2mbRaPHuJQ42EqVbMx68/QS2/7c1OCv3LY3L8lgsKmfzaJeVycRWZi7PRJ+g9L33SuOwktLKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPturjERPyVGYtvTeeQOlUwyaHRBaBG7mBuP2ELK9jFJAE4gat
	NVI76pfX4iYFIKcsj/Ya8i1+iEHXcEUIz7oaV0SglX+opy1RzBuauOJx2OJIVWWNqrw=
X-Gm-Gg: ASbGnctpn7nLGHw6V2xWQeDnUrIfbDD0xxmfNIlobfxPN7RVqHKdyZSlXWG3IbYHgal
	anMWFEjDyPImz33+21dgjFdI2/WBiBshC9wQ5PPwdA+jNWItm0OC4KcCzSaHoUcvjiaTGNIgWJP
	iGJ0hX5VKadzjmreT0Y1+AQBIZhGe3wp0BXtKPqtYjbZSeBKfpoIkkNOsJ+gk95Bxwb7Y+yM9Hj
	tkjA20utAeJ31e0J0yywsnVDbKpkTjNIAvZiiyT9BDQc/I2in+4H4z5BqGBo5h9nnY8hPpCM4Nd
	GeF186vyPczVDWRtedVjA1lZJ69H2wb/ou64phk9MqrJEb5xakqAvuhhbn33HsLBUI7nz//ILVy
	ZI/lJcDH1AOsE269hTXVtsVCkwoJSmYY4jsT0//i2AASODkpUonouc8YzzOCdfaCjtko5
X-Google-Smtp-Source: AGHT+IGL5YBlnQvLblYTbhWS4gs5bS1IP5wdMEnKuzlbTDvoG6YiWanLVZzU0YR+5H57O4Kzd5PGfw==
X-Received: by 2002:a05:600c:1f06:b0:459:df07:6da4 with SMTP id 5b1f17b1804b1-45a174eebecmr12294035e9.5.1755075752086;
        Wed, 13 Aug 2025 02:02:32 -0700 (PDT)
Message-ID: <700c5b2b-3cdb-4ea5-a22a-e06f41931e7b@citrix.com>
Date: Wed, 13 Aug 2025 10:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] x86/msr: Rename MSR_INTERRUPT_SSP_TABLE to MSR_ISST
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-2-andrew.cooper3@citrix.com>
 <9f13d1c5-8f92-4a73-8a67-f4b44b72fa50@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9f13d1c5-8f92-4a73-8a67-f4b44b72fa50@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 9:06 am, Jan Beulich wrote:
> On 08.08.2025 22:22, Andrew Cooper wrote:
>> The name AMD chose is rather more concise.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I'm okay with the (much) shorter name, so:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> But I can't make the connection to AMD: It's INTERRUPT_SST_TABLE (figure)
> or INTERRUPT_SSP_TABLE (text) there, afaics. And ISST_ADDR in yet further
> places.

ISST has a better association with IST than the long form, which is
ambiguous if turned into an initialism.  The ADDR suffix I dropped like
we do elsewhere.

But now you point it out, there is a confusing mix in AMD.  I'm pretty
sure SST is a plain typo, and I've fed this back.

I'll tweak the wording a little bit.

~Andrew

