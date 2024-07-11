Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915CF92E6B1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757392.1166300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRs0o-0002up-K8; Thu, 11 Jul 2024 11:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757392.1166300; Thu, 11 Jul 2024 11:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRs0o-0002rv-H4; Thu, 11 Jul 2024 11:30:58 +0000
Received: by outflank-mailman (input) for mailman id 757392;
 Thu, 11 Jul 2024 11:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRs0n-0002rp-4f
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:30:57 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09d3bd4f-3f79-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:30:56 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58b447c519eso1035772a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:30:56 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda30a24sm3364739a12.86.2024.07.11.04.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 04:30:55 -0700 (PDT)
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
X-Inumbo-ID: 09d3bd4f-3f79-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720697456; x=1721302256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rrfCwx32lgECMEE6wZyprTGjDEyQrDE0dJq6TARcQXU=;
        b=kgaCYSnlmU4JdgwtyaaJsT32eZmLqtBb72Lu+TCH8cqQ8G7o0Ye975ZpYAqtQb0VlM
         9Qn7V9b1TU+qpsx7aGydf1LNAksd9ElhtfTd/kvxPNo5KCF3NC/L6UNAK2evbme53RdU
         +ENRajYnQaPI8SiJMoHXLECjvPMyfUakIC1OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697456; x=1721302256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrfCwx32lgECMEE6wZyprTGjDEyQrDE0dJq6TARcQXU=;
        b=Mb4zpjOIlVf6SmosqzGbYDLPLu4NlSQxUDZ9d1ly9us0kM8hB49umtepIqPn7Hmir3
         ccqww5uolPrTiUY9fKKKSHvLu8HGXDNNVp2mppSEqFiwXtd7nCO0RqWB4e6n/sHQes0j
         /xAPoBuAQb8oqLOWnoMlQR6iRf5dWdPavVu7bLw62cepj481wplGWyDd4ToUqkMVQ+QC
         45T2eHsFNYiJnKoKd9BGRou2aAjH4kwKZ3kzyg25eiHTsTOTDJu2tgijD26yrvJFOhzK
         9AP7EsaLtWCKWFRjrz0W03PNEGr2u9GvlJG7Q2gEbvuI+XrrC+EjzYZG8+XcvHKmu90K
         1JLQ==
X-Gm-Message-State: AOJu0YzYbkBaum+utWdOT/KUAu03vPBoW1K0iwlSkZLG2QCr2WsnpRYq
	X6qLdkPdSkxles530ZZBtSdFygJGqH2pvCuyEum+yurnwn33l9a90EdcX3K4KEM=
X-Google-Smtp-Source: AGHT+IGxQk0DVltCMGOZQdWc2D9dQw0FT+b/Jw2WGclTEQN9pWmSuGurNB0ijFRhZ4oCAq0PwfoD8A==
X-Received: by 2002:a05:6402:28a5:b0:58c:804a:6f0a with SMTP id 4fb4d7f45d1cf-594ba59f87emr4877619a12.19.1720697455615;
        Thu, 11 Jul 2024 04:30:55 -0700 (PDT)
Message-ID: <f0bdd5ca-3f85-4998-9476-18e768352bec@citrix.com>
Date: Thu, 11 Jul 2024 12:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
 <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 12:09 pm, Fonyuy-Asheri Caleb wrote:
> ----- Original Message -----
>> From: "Andrew Cooper" <andrew.cooper3@citrix.com>
>> To: "Fonyuy-Asheri Caleb" <fonyuy-asheri.caleb@inria.fr>, "xen-devel" <xen-devel@lists.xenproject.org>
>> Sent: Thursday, July 11, 2024 12:45:18 PM
>> Subject: Re: Help with Understanding vcpu xstate restore error during vm migration
>> On 11/07/2024 11:38 am, Fonyuy-Asheri Caleb wrote:
>>> Hello,
>>>
>>> I am trying to understand the causes of the vcpu xstate restore error
>>> during live migration.
>>> I get the following error during live migration:
>>>
>>> xc: error: Failed to set vcpu0's xsave info (22 = Invalid argument):
>>> Internal error
>>>
>>> I was able to locate the failure point to the file
>>> xen/arch/x86/domctl.c  with the following check.
>>>
>>> if( evc->size<PV_XSAVE_HDR_SIZE||
>>> evc->size>PV_XSAVE_SIZE(xfeature_mask) )
>>> gotovcpuextstate_out;
>>>
>>> I know this is related to the number of xstates handled by the source
>>> server. Please can
>>> someone explain to me how these states are computed?
>>>
>>> I earlier thought it was simply the number xsave dependent features on
>>> the CPU but it seems
>>> to be more than that.
>>>
>>> Thanks in advance.
>> It is certainly more complicated than that.
>>
>> What that's saying is that Xen doesn't think that the size of the blob
>> matches expectations.  That said - I'm in the middle of rewriting this
>> logic because lots of it is subtly wrong.
> Please do you mind giving me more insight on the logic currently implemented 
> and maybe what is wrong with it? It will be important for me since what I'm 
> doing is research work.

See 9e6dbbe8bf40^..267122a24c49

> How do the values evc->size and xfeature_mask relate to the source and target
> processor xstates (or xstate management)?

The lower bounds check is for normal reasons, while the upper bounds
check is a sanity "does this image appear to have more states active
than the current system".

The upper bound is bogus, because "what this VM has" has no true
relationship to "what Xen decided to turn on by default at boot".
>> To start with, which version (or versions?) of Xen, and what hardware?
> Xen version 4.18.3-pre

As you're not on a specific tag, exact changeset?

Not that it likely matters - there shouldn't be anything relevant in
staging-4.18 since RELEASE-4.18.2 as far as this goes.

There are backports of 2 of bugfixes, but in a way that should be
practical change on 4.18.

> My CPU is : Intel(R) Xeon(R) CPU E5-2630 v3 @ 2.40GHz

Ok, so Haswell.

Let me stare at the CPUID dumps and see if anything stands out.

~Andrew

