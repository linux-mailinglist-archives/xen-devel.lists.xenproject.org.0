Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1907A61005
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914456.1320212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3KG-0002pn-Db; Fri, 14 Mar 2025 11:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914456.1320212; Fri, 14 Mar 2025 11:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3KG-0002n7-Av; Fri, 14 Mar 2025 11:35:40 +0000
Received: by outflank-mailman (input) for mailman id 914456;
 Fri, 14 Mar 2025 11:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt3KE-0002n1-IA
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:35:38 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 728cfd59-00c8-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 12:35:36 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so1142935f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:35:36 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdc5sm5295923f8f.80.2025.03.14.04.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:35:35 -0700 (PDT)
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
X-Inumbo-ID: 728cfd59-00c8-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741952136; x=1742556936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0tbA7FFfpQbHDRbUIMNxV0ur4xKx7ECZKozsA70cDPs=;
        b=lWnGfCmIVJIvANe4/EkgkL+8i2G93vxbAedjqG0hgv2d1BeIsOWi/qAfrYFGm/SXpY
         o8peQOkYWoKnDdpUFd3Go4CDik3iJUpSNTMXALmhc06dKIzkWSddl1L9J/oJHxc5Ei4i
         rqUXLAhM3P+I3yQ/BT+nDrTZ6ZCNO6rl+N9Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952136; x=1742556936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tbA7FFfpQbHDRbUIMNxV0ur4xKx7ECZKozsA70cDPs=;
        b=JlKm5pzrXgxnXlyn8bg34S6Z3lX910DFDMCkmuFgc1939kwARMKYVyVLPXPfP2+3hC
         64fUxSJAxNlmI8XxnXNCB4xdcI7fW4pUFknPAk1WAAx+urQnrPhq/LN0zGIZrIWFi1S7
         71U9qT4Lwi0MExDy73+V7QFzfrKjLqwXoo+5VDwmVQf4BmW/pOxY1sM91+4ci8rczRsp
         iXJNg8pEtNfe1K5uktgnqfGy+GKiTJSzEaf/ZK20fwe/MH1Thw42ivQP4XAPx1Uar1Na
         liUxjMYsEdJriXlrxjvaqJ4q5gq8UiKXmCTWhJs8mWpdPl1A7hxpVopjaCyEoEx5rqQc
         M2PA==
X-Forwarded-Encrypted: i=1; AJvYcCVmkfNBUS9VXrvVe8jyEbAk3oEdom0bopwKfbcjSogH40+DQ1tb0Z2sQSNyGfB4ZQnv/kR60oVFptk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdNChF90yIpVQhI25Y/L7KJFbXbql/v5+6oDLQ7kbiWajd/oIY
	j3cquhai3mcWFkX8gQwQ40/egLw1XkaNrxMB62IL587PP60weACAi+crgvPfc14=
X-Gm-Gg: ASbGnctdjiUnc+VE/0bbAwFJiP0HVsV1SdhIBq4MwpBdf780wL+58Lcjlm3bGzCxApF
	f8OfYkyqe06p0iXUS6IT/jqb9bnDgB6dktHTpaJdjxn167OORFn35W39aKj50rHHrwZmtuGGPnb
	yiKx3nyxGXRr8nqNnGHI3pohO84p5LhamKHl1PMVU241xxn/L4n/3h71cXizBU52AC2ollkzVKv
	WHK6aWqyeFeFblldGx5ehKNHJwOuHv4y5V8+xtybNhe50UDgl7c2zoDUeUIiBgtrk812Kv1wssp
	JcMfQFyp/R/DdxiQeqTZasggEzRVOT1//K6gYrLkcDsTPWl/dEjZlgdZXKSt1rGRHXXag3UOEAS
	ASgYCUKmt
X-Google-Smtp-Source: AGHT+IEQFw7TU+tRDRyQinGCfDFZ6PjD6+2ItfRZxnu9LM0ofY9MPgyRjVYoT64tcitH0MOOkJufVg==
X-Received: by 2002:adf:cb83:0:b0:391:2d8f:dd59 with SMTP id ffacd0b85a97d-3971dae8de5mr2039294f8f.24.1741952135782;
        Fri, 14 Mar 2025 04:35:35 -0700 (PDT)
Message-ID: <82a5c9e4-6498-4c3d-b9a9-7e4425f0bd8f@citrix.com>
Date: Fri, 14 Mar 2025 11:35:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
 <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
 <d597523c-aa3a-4682-824f-e6e2f8ce753a@citrix.com>
 <61b762d0-d513-4d02-80ac-50fa12a725f3@suse.com>
 <b13543a1-4d43-4e2d-8fcd-08ec60be9dd3@citrix.com>
 <e016d8e7-e662-419f-a181-5bbfdc71764b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e016d8e7-e662-419f-a181-5bbfdc71764b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 6:49 am, Jan Beulich wrote:
> On 13.03.2025 18:03, Andrew Cooper wrote:
>> On 13/03/2025 4:37 pm, Jan Beulich wrote:
>>> On 13.03.2025 17:28, Andrew Cooper wrote:
>>>> On 13/03/2025 2:19 pm, Jan Beulich wrote:
>>>>> On 13.03.2025 14:58, Andrew Cooper wrote:
>>>>>> On 13/03/2025 1:38 pm, Jan Beulich wrote:
>>>>>> I'm tempted to ack this on the basis that it is an improvement, but a /*
>>>>>> TODO this is all mad, please fix */ wouldn't go amiss either.
>>>>> I understand you like adding such comments; I, however, at least
>>>>> sometimes (e.g.) don't. Especially without at least outlining what
>>>>> would need doing. Just saying "this is all mad" doesn't really help
>>>>> very much.
>>>> I was being somewhat flippant.  But a /* TODO, try and make this a
>>>> presmp_initcall() to improve alloc_trace_bufs() */ would be fine.
>>> Okay, added (to the existing comment).
>> RISC-V and PPC were both green in the pipeline, so they seem happy.
> As alluded to, not surprising at all, as the tests surely don't supply
> a "tbuf_size=" command line option. Without which init_trace_bufs() does
> close to nothing. Still - thanks for double checking. May I imply an ack
> from this (formally I'll need a separate Arm one then still anyway)?

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

