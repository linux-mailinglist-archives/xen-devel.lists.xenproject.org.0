Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF9A59AFF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 17:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906702.1314091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trfzM-0000Gk-2b; Mon, 10 Mar 2025 16:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906702.1314091; Mon, 10 Mar 2025 16:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trfzL-0000FF-W7; Mon, 10 Mar 2025 16:28:23 +0000
Received: by outflank-mailman (input) for mailman id 906702;
 Mon, 10 Mar 2025 16:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trfzK-0000F9-OG
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 16:28:22 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6f16733-fdcc-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 17:28:09 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22423adf751so63364855ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 09:28:09 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736ab33e1d3sm7113582b3a.132.2025.03.10.09.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 09:28:07 -0700 (PDT)
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
X-Inumbo-ID: a6f16733-fdcc-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741624088; x=1742228888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MB2fJsQ4IboLQPMn+u5sD/iZ5CoCsD5DvTx+in/FBzM=;
        b=eJkNTixXsyJ0pnRryoV5ksuDfqYGvmeJ1A+AQB4JFtGkBDOEfEM1knsM+egpq6JK2S
         pNfXEiZAE9jkxWrkF4Jp7eX/jZNzS5f3xwL6Y3pg8dAnTELNMHJPXoMC6cRRrzP9Ymio
         4mAhdDOsrPaV963R0IIsnZ8GL/y2M2ThzDPRtZJDYS02U2ZOYjbQK6jtFChYdB5fq+SJ
         heZle0ZQ9HWxw8YiFvnh1GWjP7wCUToPxa+tCgwy6mjuRYRKiOuBYNwXVNRrglCldUCS
         FqQ+/WLNx2OLZWveG3/CJpZVHmGyapVV6Xkk+9PeeGggnHouL3Oq5lithGTfvHym/azc
         XEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741624088; x=1742228888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB2fJsQ4IboLQPMn+u5sD/iZ5CoCsD5DvTx+in/FBzM=;
        b=OSO7ucwjhyQ2/jeZ2VQtJKfGjMoIXr/xqcEs668DHGY8St+DN90JzEdCMa2IVR4YUB
         yUnMmqr/u5KlEQO6825AWutxGQ22KCr1B8ydkURmZbuaOhuZCa7heYniyI4Bvb/a/HNM
         4qq4UPKwg/WMpt0ZyaqXAR7WVrNwfqsLc8o3bOHfH+wdovG2bO8VCVQ+ui+2h5B8WPI7
         sGqbuxRXiS4jO6qHW7rnrsr37sLbfKazj5UVRz06A+3ZmLvV9rz7IA5vbtMIsuPYE/tv
         /l7jBLPl3RVoLU1/5/i/eKwhYe5RQJoF2gWzcfN8z/jdbMp733vNlIWIsdjhtOptOoGZ
         oH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV43+bqRJ1LwWcJb/JhnPvOGIO0Ympn6mg8zAMABWBqgxPVowE6XUbT/ewbDXJ8EckY5O4IAdV8Jq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0wP2f+GxM/oWf/9QZFwzwwM/ncv0BGs/XaYElLZPaz29yYUWt
	MITNBzUeOUXI0maLsNL8A92JIK1QruMB8myVagK+z6jA30HKf1Ru08BZws+PpjI=
X-Gm-Gg: ASbGncuvym3tslVSP/9V9B5sfs6H2IW6G1iyduQ1RXpNB8FW22o66jSOgUj10kv/lmJ
	XtvNPmqI9A2mHcsX2nfDgBiU12sqqfc/T/mKKhNZEjC54hmOVbEXL/aDkW3C+FQvMnbZDld6C2G
	v88lFhvCDUvEqUFiPgHtUlEQdM3Kwnk+4xRLN9u1QPErncytN6Ux6TtX+fT3RH21Y5myvDLX/Tk
	pBtpmwNtU4JAcMJfnag+RUfu4I7HMgDEt5ojdme2B32FYmUbpFc/iSOJ5Jl9siSgCTHB9zziD6+
	WrChjfxxLsmyBPzA0LTCD6mjjE+qST6wuI2w3DmtDo1zCFVfa7iVbgQ8qg==
X-Google-Smtp-Source: AGHT+IEMClmiHQu47yv2LCemW+QIh5GG4atFR9obpakYwQTFo0T5HFRT/xNIXLHFw49N04gZ3Ngyqw==
X-Received: by 2002:a05:6a21:6e8a:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1f58cb438c6mr642912637.19.1741624088169;
        Mon, 10 Mar 2025 09:28:08 -0700 (PDT)
Message-ID: <c5b9eea9-c412-461d-b79b-0fa2f72128ee@linaro.org>
Date: Mon, 10 Mar 2025 09:28:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] make system memory API available for common code
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, manos.pitsidianakis@linaro.org,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
 <f231b3be-b308-56cf-53ff-1a6a7fb4da5c@eik.bme.hu>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f231b3be-b308-56cf-53ff-1a6a7fb4da5c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zoltan,

On 3/10/25 06:23, BALATON Zoltan wrote:
> On Sun, 9 Mar 2025, Pierrick Bouvier wrote:
>> The main goal of this series is to be able to call any memory ld/st function
>> from code that is *not* target dependent.
> 
> Why is that needed?
> 

this series belongs to the "single binary" topic, where we are trying to 
build a single QEMU binary with all architectures embedded.

To achieve that, we need to have every single compilation unit compiled 
only once, to be able to link a binary without any symbol conflict.

A consequence of that is target specific code (in terms of code relying 
of target specific macros) needs to be converted to common code, 
checking at runtime properties of the target we run. We are tackling 
various places in QEMU codebase at the same time, which can be confusing 
for the community members.

This series take care of system memory related functions and associated 
compilation units in system/.

>> As a positive side effect, we can
>> turn related system compilation units into common code.
> 
> Are there any negative side effects? In particular have you done any
> performance benchmarking to see if this causes a measurable slow down?
> Such as with the STREAM benchmark:
> https://stackoverflow.com/questions/56086993/what-does-stream-memory-bandwidth-benchmark-really-measure
> 
> Maybe it would be good to have some performance tests similiar to
> functional tests that could be run like the CI tests to detect such
> performance changes. People report that QEMU is getting slower and slower
> with each release. Maybe it could be a GSoC project to make such tests but
> maybe we're too late for that.
> 

I agree with you, and it's something we have mentioned during our 
"internal" conversations. Testing performance with existing functional 
tests would already be a first good step. However, given the poor 
reliability we have on our CI runners, I think it's a bit doomed.

Ideally, every QEMU release cycle should have a performance measurement 
window to detect potential sources of regressions.

To answer to your specific question, I am trying first to get a review 
on the approach taken. We can always optimize in next series version, in 
case we identify it's a big deal to introduce a branch for every memory 
related function call.

In all cases, transforming code relying on compile time 
optimization/dead code elimination through defines to runtime checks 
will *always* have an impact, even though it should be minimal in most 
of cases. But the maintenance and compilation time benefits, as well as 
the perspectives it opens (single binary, heterogeneous emulation, use 
QEMU as a library) are worth it IMHO.

> Regards,
> BALATON Zoltan

Regards,
Pierrick


