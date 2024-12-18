Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC87F9F6B04
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 17:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860644.1272647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwpp-0004z6-1N; Wed, 18 Dec 2024 16:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860644.1272647; Wed, 18 Dec 2024 16:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwpo-0004wo-UK; Wed, 18 Dec 2024 16:23:40 +0000
Received: by outflank-mailman (input) for mailman id 860644;
 Wed, 18 Dec 2024 16:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNwpn-0004wi-8X
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 16:23:39 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eedef73-bd5c-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 17:23:36 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so43925195e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 08:23:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b01c72sm24655885e9.15.2024.12.18.08.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 08:23:35 -0800 (PST)
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
X-Inumbo-ID: 6eedef73-bd5c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734539016; x=1735143816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oEIAagIF9OJNP006px3kTaeut4c8v+2sgXBVNhAMma8=;
        b=FIHhiS6uqw/51JfLthQJYIi8otc8n1LjHLW2QBPUm/Vd2/9hNdH751mBA3wANFrGe0
         EwHOrB6ompPJvPPWznx444gwAFzYir2reazINXp3hJUnxwllzHiCmWQeo9Oy+MKyCdQd
         SUHLfkzjEBkSDX3oLAn40+pSGtUdZ4SBqIfQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734539016; x=1735143816;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEIAagIF9OJNP006px3kTaeut4c8v+2sgXBVNhAMma8=;
        b=ZVb4YVBzBhXiXd6SJfgnyUmXDT48krvtiey6Nx6R3GBHvEfyy1xCS761X/T/UG3hSJ
         uAFw+EorZMqvkUxMYROmWOtjtWmTeOIdq0Xx3rK5r/uS/m96TtffU8W82TNhOsONL2Qk
         R6M9DYu0HRczhpfucxlFA8iycs63fUCt6rUanAw1KhINXqZo1AEUIci6Qf+mxVv3wr/S
         jvIp38THDEttlO5CNAX5q5G1iuEHpyugpkx3WwMOe4lzcBRvhV3t9IOAV4FyWOPGnGJR
         rEpPzpGcT1alu9SVXh2fQIIKOfWX6tbPdQ0IzAF7FUFoNb3jTtVw1OkcHJaefpGul4QT
         +GBw==
X-Forwarded-Encrypted: i=1; AJvYcCXfW81Ly6oRbAcOiwhwdR+v5rBzJVoeYPIFKJZE46WIkYUUlMISMUo5akcCn4weI24K7BGrM4W4Axo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLoi4O3VYPDbq35PR3u6RrZ7qnfJU50MrWlpEjRXrWfp5X6p2k
	w0d6ulVcpXdAY7JzY7Znkxa/BWNsAJM8a42o55NfrGqc8j9gZaYmlJ7ey5Bs2L0=
X-Gm-Gg: ASbGncs3ulzGElzPFzZajzcYOJuZr8aPauA0pC1maGYk8Aq2cidbDViK6O0HVuGpeld
	u5BxKa6CFxmV5JQU6BQes6R4D5CDfwpD0IiAwTYWsYJznFQnXS9meKvjCBsDS1nk7Ao2kdG2NVj
	psgAuf4ndr6ElQoAlN/VVmbXpZ0YkF1NQNE0RG04VeCOFbxYJVhlIifJ461H7jrWXjVlK8jVoiT
	ONUG4mLAlbiC5030zHy6KA+2X3551018Tdi6Ql1IpmxQIkmO+cvkzvFBmJjIefp09TCRAKJpmR+
	MjEL1pnA+cntj2nG9een
X-Google-Smtp-Source: AGHT+IHze0wmGYcdugNrGRa4bJuT5laGQO79WQoVtv7nVk3ZZ5Zo3H+FIoXHpwNvtksl9RkQD7dU2g==
X-Received: by 2002:a05:600c:314a:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-436553ff1d2mr40203975e9.31.1734539016221;
        Wed, 18 Dec 2024 08:23:36 -0800 (PST)
Message-ID: <f9c6f5cc-53d9-44f8-a518-d7af67cc98d4@citrix.com>
Date: Wed, 18 Dec 2024 16:23:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/hvm: Use constants for x86 modes
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
 <6a0ee425-96ce-4361-ad23-7f21c3398694@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6a0ee425-96ce-4361-ad23-7f21c3398694@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2024 3:54 pm, Andrew Cooper wrote:
> On 02/12/2024 9:49 am, Teddy Astie wrote:
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
>> index 02de18c7d4..dbc37e8b75 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -26,6 +26,12 @@ extern bool opt_hvm_fep;
>>  #define opt_hvm_fep 0
>>  #endif
>>  
>> +#define X86_MODE_REAL  0
>> +#define X86_MODE_VM86  1
>> +#define X86_MODE_16BIT 2
>> +#define X86_MODE_32BIT 4
>> +#define X86_MODE_64BIT 8
>> +
>>  /* Interrupt acknowledgement sources. */
>>  enum hvm_intsrc {
>>      hvm_intsrc_none,
> We discussed this in the x86 meeting.  These want to live next to
> hvm_guest_x86_mode() with a comment stating that they're not
> architectural modes.
>
> During your work, you seem to have only looked at the the VMX side of
> things.
>
> There are several callers of hvm_guest_x86_mode() and
> svm_guest_x86_mode() missed.  Also an unnecessary include, and a couple
> of overly long lines.
>
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=4f8f63d49776d69ed9a978b6601c13c54c579a98
> is the incremental fix on top of this patch.
>
> Does this look reasonable?

Bah, randconfig says this doesn't quite work. 
https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8677688167  The
constants need to be available in the !HVM case too.

That will involve moving them higher into hvm.h and where they are in
this hunk is probably ok.  I'll move the comment too.

~Andrew

