Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B67A94A1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 15:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606446.944356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJdF-0000Hv-MM; Thu, 21 Sep 2023 13:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606446.944356; Thu, 21 Sep 2023 13:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJdF-0000GA-JQ; Thu, 21 Sep 2023 13:22:13 +0000
Received: by outflank-mailman (input) for mailman id 606446;
 Thu, 21 Sep 2023 13:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95bz=FF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjJdE-0000Fg-DT
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 13:22:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea243da-5881-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 15:22:10 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401b393ddd2so10267595e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 06:22:10 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r2-20020adfe682000000b0031ff89af0e4sm1739963wrm.99.2023.09.21.06.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 06:22:09 -0700 (PDT)
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
X-Inumbo-ID: dea243da-5881-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695302530; x=1695907330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8dVQX0yCi7ghczoROjvyfPzm3xMrXMwt1ohYLvFo1LE=;
        b=B80Pmcz6sbUkaoY+xJcWQYp3xx9xwd/Jp63FLTxWyIQlhg1/K9mxhQgrcfzPfw9Dm9
         xP1ToydeP9y0xshSLVKMV2PX6wqClqfLlTqt499k8a/l5Lyi0AMa5Zd/Q9CGcgh51RH0
         IrLCXIBedHPAMuIdUSiAACKmH67VQMsWBtEc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695302530; x=1695907330;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dVQX0yCi7ghczoROjvyfPzm3xMrXMwt1ohYLvFo1LE=;
        b=Dy/cqcD9bWphNHMZ2wWdQ/z1JlLJkpWNdkzUmJcOKjwL8sw73OQp8rMevyOHrnzNsv
         ioz/TtHQYrRK9ebYR54NQe5QznA6xl9qazNFU2T1UetOcXQiVEdj7yKjaqybnIce7+n9
         M2B6eqe1ToM1ARGGJjC/W8I4vr6TUrZF6MZMys1xDnWrl3VF7UBnPlmo5DQBT5tt2drU
         hGv+bya0Clxo97FhA0f0yH79sYqSrHO5I2Dw5ccH89MrQWrLK/RnjIol8JCa5UT1c4Oe
         PnlibEt0hv/+eJNCGa0ftFr6tUGbApyrf+yco249LRBaS4/Nrxdc9vts+FJC4S1z/aqi
         oMNw==
X-Gm-Message-State: AOJu0Yzi+u3Uv02A9PzEpE7agRNSVqGwPxcUuNYo5SxCvn7s9Dd8lLGk
	Wk+gUdMn5OHXbUfbeBjiQqRCng==
X-Google-Smtp-Source: AGHT+IGnWZ82d4kjIh0k77eDZZAbkE/+M5zc0hDvyULYRRQYw7qweBLL3ooDS+hRFr061DGVSkwrWQ==
X-Received: by 2002:a05:600c:22ca:b0:3fe:2b60:b24e with SMTP id 10-20020a05600c22ca00b003fe2b60b24emr5307653wmg.29.1695302530020;
        Thu, 21 Sep 2023 06:22:10 -0700 (PDT)
Message-ID: <f8f7e4b7-377c-41b6-8fbc-5a26d51329e0@citrix.com>
Date: Thu, 21 Sep 2023 14:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/paging: Delete update_cr3()'s do_locking parameter
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230920192153.1967618-1-andrew.cooper3@citrix.com>
 <0ba4e387-5f58-6828-9168-cab0ae3b3698@suse.com>
In-Reply-To: <0ba4e387-5f58-6828-9168-cab0ae3b3698@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/09/2023 1:38 pm, Jan Beulich wrote:
> On 20.09.2023 21:21, Andrew Cooper wrote:
>> Nicola reports that the XSA-438 fix introduced new MISRA violations because of
>> some incidental tidying it tried to do.  The parameter is useless, so resolve
>> the MISRA regression by removing it.
>>
>> hap_update_cr3() discards the parameter entirely, while sh_update_cr3() uses
>> it to distinguish internal and external callers and therefore whether the
>> paging lock should be taken.
>>
>> However, we have paging_lock_recursive() for this purpose, which also avoids
>> the ability for the shadow internal callers to accidentally not hold the lock.
>>
>> Fixes: fb0ff49fe9f7 ("x86/shadow: defer releasing of PV's top-level shadow reference")
>> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: George Dunlap <george.dunlap@eu.citrix.com>
>> CC: Tim Deegan <tim@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Slightly RFC.  Only compile tested so far.
> With shadow/none.c also suitably edited
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Ah yes - I did forget about none.c.  Thanks.

> I'm a little surprised you introduce new uses of the (kind of odd) recursive lock,
> when previously you voiced your dislike for our use of such. ("Kind of odd" because
> unlike spin_lock_recursive(), only the potentially inner caller needs to use the
> recursive form of the acquire.)

I do very much dislike recursive locks, and I do think that an
alternative universe without them would be better code.  But a stream of
int/bool params are a similarly bad antipattern too.

As paging_lock_recursive() is used for this exact purpose elsewhere,
it's silly not to use fix one of the problems when it doesn't really
make the other problem worse.

~Andrew

