Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1E872318
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688853.1073530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhX0i-00016D-HD; Tue, 05 Mar 2024 15:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688853.1073530; Tue, 05 Mar 2024 15:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhX0i-00014L-EI; Tue, 05 Mar 2024 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 688853;
 Tue, 05 Mar 2024 15:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhX0g-00014F-BU
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 15:47:18 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a496284e-db07-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 16:47:17 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-787990149edso311485085a.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 07:47:17 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n4-20020a0cbe84000000b0069074aa1cbfsm2375256qvi.142.2024.03.05.07.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 07:47:15 -0800 (PST)
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
X-Inumbo-ID: a496284e-db07-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709653636; x=1710258436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6alVIozG2iZAob4U/VARNU2Z9ykD/4r9O8K+FFYHQeE=;
        b=E6zOuz2/UnIEHfWBPJ8SSPkgUXrRs3KgHYGhyB/uti5x9X5CGDRgYZuAmq/G523cuJ
         WpuJYHLl4Oc6ce6YHsvMSBIDTIhRKXlvK8laj0O9m1K6DqUZcjp8PgOdAp8A7RpQ6LhC
         dp3q+FJ1sMkH6FXrMN83/5+kk3dJ8xhlp5jOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709653636; x=1710258436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6alVIozG2iZAob4U/VARNU2Z9ykD/4r9O8K+FFYHQeE=;
        b=NhKX8oSsd8l43vJyfnynDJOKN5+FRnGCW3GQbSMku1DtX2sW0AJ1FiZKcCRcwV8gnT
         0/5CoXkFdse0FVM7zw0xeSpH8nlCTQrf6r/HZ0rp43ZoWF3il/0kl0kKvS8PDcCBSH6t
         T04h5lpGAsNjSK7k47GVMoAfSuEAX2Rw6NqthBd1V73pdevIcZOxfmMuv2QnteAqFK1/
         pyaDT0nhmirVfc5P5iogb888kJE3Zi9UwbEZQvEv8tmw3tuyn7o1/3CgKOpPrB3KGfn0
         6y2oRzbacmmMlvdyM2QAY8mVAWC5WrKuoP9asP6j3g1xXBJsCsgzCGIG1vn6xIpPVI3x
         yIPA==
X-Forwarded-Encrypted: i=1; AJvYcCWYCqQKrR2lsq0R0DGIwj+IHEpfvbdgUUKGen6WZvW2uDa8L7U9TuscOhEhBNJFjUG7pX/fU3UR4rkbgpZTrXv0hpjJx8zQ6ORs6MUAuE8=
X-Gm-Message-State: AOJu0YxQqGWU1t3Bgo31uxWNWhTxYMQP2SSFA1XpB1T6G/lVnxB0c4WA
	m0eQusN818RiWfRGWiTeMuhGvR+xDtslmVk9TrKDAAoVAhsB1OQec8PguOMVQtA=
X-Google-Smtp-Source: AGHT+IGJNdCq11euNvwhoPJadQXk/wU8udr1RLuNTVgd4GZxY9VskOWjjKH+IqxH5epDLVvgY13NHw==
X-Received: by 2002:a0c:e84f:0:b0:690:5745:5b48 with SMTP id l15-20020a0ce84f000000b0069057455b48mr2252773qvo.59.1709653636230;
        Tue, 05 Mar 2024 07:47:16 -0800 (PST)
Message-ID: <a1517370-63a7-49d1-9f59-c62d764f7db8@citrix.com>
Date: Tue, 5 Mar 2024 15:47:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
 <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
 <4fb729fa-8519-4244-a795-cc66a79cd346@citrix.com>
 <c6f9c9fa-a252-41c4-b92f-435c57044cd2@xen.org>
 <3bc0b828-d3c5-447d-b338-c478d8e337fc@citrix.com>
 <7df33568918536487ec75a05cd47cee128150c0c.camel@gmail.com>
 <3d585715-7729-4a5a-b4e4-c0eb96601882@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3d585715-7729-4a5a-b4e4-c0eb96601882@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 3:43 pm, Jan Beulich wrote:
> On 05.03.2024 16:15, Oleksii wrote:
>> I agree that upon examining the current state of the code around these
>> functions, it appears safe to provide stubs. However, the reason my
>> patch was rejected is that it may not be entirely safe, as Julien
>> pointed out that even with Arm, some functions shouldn't be empty.
>>
>> What I would like to propose is that it might be beneficial, at least
>> in CONFIG_DEBUG=y, to have a warning message. Does that make sense?
> A warning message to what effect? And are you thinking of a build-time
> warning, or a runtime one? Plus wouldn't different aspects quickly lead
> to proliferation of warnings?

Putting in a warning for something like this is specifically a bad idea.

All it will do is cause people to ignore warnings, and that's the very
worst thing Xen could do.

~Andrew

