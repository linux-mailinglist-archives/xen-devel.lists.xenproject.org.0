Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734DB7AB5A2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 18:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606945.945051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjikh-0006Gc-Sg; Fri, 22 Sep 2023 16:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606945.945051; Fri, 22 Sep 2023 16:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjikh-0006Dm-Op; Fri, 22 Sep 2023 16:11:35 +0000
Received: by outflank-mailman (input) for mailman id 606945;
 Fri, 22 Sep 2023 16:11:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5esq=FG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjikf-0006De-Cc
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 16:11:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11f5920-5962-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 18:11:31 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-405497850dbso2477675e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 09:11:31 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b12-20020adff90c000000b0031fb91f23e9sm4765070wrr.43.2023.09.22.09.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 09:11:30 -0700 (PDT)
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
X-Inumbo-ID: b11f5920-5962-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695399090; x=1696003890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NanpKBgSiW5Vy97Fod+2bEXgd1WaBGRNJtbrr8dk9TY=;
        b=FKD0qf1eQb+khVV/g9byNkqFkGSEG6L4q14XRAwXbdmGFHFwvvEwtcUgvnJ23foxyn
         VxbFK15iIl/yiS712IxW/hFR3g93zQrc170V53GIXtK1ofcLZMkIQhNlL1eVWgr3y/c6
         XBs/mZZ+ltb6yg83ybzildiu9BJjweaDj7AR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695399090; x=1696003890;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NanpKBgSiW5Vy97Fod+2bEXgd1WaBGRNJtbrr8dk9TY=;
        b=oeBRisgKzd0H9GIf3Ms9D/bed8YSizZgiq674rzOicTojNbH55R/glQ+uJpTYZt76l
         Zdi6zT/FAgICPeC7O4ZozF6olTnUK0b8h4P0PS0dhinWYUCVk1bOU14ohi325TAAElZB
         p8fD+pgV1I/+x3p0kXf+advD3xOW7xR2vohIsrIEjP22dnbisgk47GfBi1ahYBVx2A0i
         tcWYwpTSL/QbEdK8qvIN9C3oj37f6GN+EQh76LDmpz7PZAFP/uJIf40rW8NuSm8Sixo2
         s8rizapwrEaQazpN62Tgy2Wlo6Ph5oUmsPwlYses0EUonuMxHnlsFNKzkYZD5QF9oF7p
         ZGiA==
X-Gm-Message-State: AOJu0YxUlE22DTwLoPdLx+WdqkaB5hfgAYqjJ7Lct6B0W+YqRhGHvDVL
	WYnD1Pm2ilKuFbjiRtAhsM2ZZQ==
X-Google-Smtp-Source: AGHT+IFK7wcez8or/rk3c8ywJ1Clu8XeVuM32QbQf8PbhRnsUPNvB8RWgGlK730hFdyC35ZttT9PZQ==
X-Received: by 2002:a05:6000:180c:b0:31a:d4e4:4f63 with SMTP id m12-20020a056000180c00b0031ad4e44f63mr115782wrh.18.1695399090450;
        Fri, 22 Sep 2023 09:11:30 -0700 (PDT)
Message-ID: <43428539-4fe0-e2ac-48a0-b2fd9bcc0d1f@citrix.com>
Date: Fri, 22 Sep 2023 17:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/7] x86: Introduce x86_merge_dr6()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-6-andrew.cooper3@citrix.com>
 <943d1d28-08de-3c1a-5a64-6caa98cdba78@suse.com>
In-Reply-To: <943d1d28-08de-3c1a-5a64-6caa98cdba78@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/09/2023 12:37 pm, Jan Beulich wrote:
> On 15.09.2023 22:36, Andrew Cooper wrote:
>> The current logic used to update %dr6 when injecting #DB is buggy.
>>
>> The SDM/APM documention on %dr6 updates is far from ideal, but does at least
>> make clear that it's non-trivial.  The actual behaviour is to overwrite
>> B{0..3} and accumulate all other bits.
> As mentioned before, I'm okay to ack this patch provided it is explicitly said
> where the information is coming from.

The information *is* coming from the relevant paragraph of the relevant
chapters of the relevant manuals.

I don't need to teach programmers how to suck eggs.  Nor am I going to
quote buggy manuals (corrections are pending for both) as a
justification for restating several paragraphs of information as a oneliner.

~Andrew

