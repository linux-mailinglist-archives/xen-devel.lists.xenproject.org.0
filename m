Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F07FBB30
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643153.1003092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xxj-0007RD-W3; Tue, 28 Nov 2023 13:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643153.1003092; Tue, 28 Nov 2023 13:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xxj-0007Ox-SM; Tue, 28 Nov 2023 13:17:15 +0000
Received: by outflank-mailman (input) for mailman id 643153;
 Tue, 28 Nov 2023 13:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az8h=HJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r7xxh-0007N7-Nh
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:17:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7084cc23-8df0-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 14:17:11 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b4f6006d5so2808855e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 05:17:11 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05600c3b9a00b0040b400711f5sm11209339wms.7.2023.11.28.05.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:17:10 -0800 (PST)
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
X-Inumbo-ID: 7084cc23-8df0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701177431; x=1701782231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ0k6nF4XrGSAuuM3xrwpeuswIKUI/osZ8Pp8TLKQqw=;
        b=nJx7DatwZV42uGE1HIn10TDnQKHAGvzNnlQ1tnNvAM7FtTKlyoAuDNGFz+XZFRb4vS
         ut5Sm/wFstfJ7zgjaZMAfSv8myCa0OLFMT53xdOp2lXMPrRWl1Vfoqo67n53w0zEnYH9
         sDXbTzo4dBNML88to6GTUbmNILZNo8fonn5ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177431; x=1701782231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ0k6nF4XrGSAuuM3xrwpeuswIKUI/osZ8Pp8TLKQqw=;
        b=BJ5nBYAmcVoktxfBgT93nRm2/4bfNvuJ9mfeNX7yf/Va0GS7Mz6Rrr6tMDEBZQ2qxw
         Me+EfHUZwHdX72DtwCsnnWxR6RgS2TaVemBHO58HQMmSo6Thq9KJW3Ztwh9JrD0CzBtd
         8KaxHgCpQ0sySDH5WKhgHD/5mYzXPMbMbhdwPu3AJ7nfbcelzxPqAThcDEOdPdLoCYWA
         pttIiDZUrstIfyDYVEAZPteSfaqBUkqvhzznEaKmrVKjfrQstYjZqwGymCiN3iu8yzAR
         FiMcMZCA0wPcBxruOb309TKYf9H0iQ/YvcKAJUxIKzRzaGcq/TI/VpuQ4oEGetIOP8aI
         tadA==
X-Gm-Message-State: AOJu0YxZTpfR++LXtpcmSaa9cZ7RDKbEUPMrtWW6D7gyqSEKQW46U0MF
	P8QnKEW8z7Hqy5dd9LX3UhQ9dw==
X-Google-Smtp-Source: AGHT+IEWi5wcoMwutNFCNuGDq33BdsZvon6Qow110Rw8NfYdi+ev2o95IASrpemZp9Y84rbqczpJkA==
X-Received: by 2002:a05:600c:4fc5:b0:40b:2a15:9b30 with SMTP id o5-20020a05600c4fc500b0040b2a159b30mr6713450wmq.1.1701177430995;
        Tue, 28 Nov 2023 05:17:10 -0800 (PST)
Message-ID: <4f09cc01-3975-4c2f-960f-67f3ac1f53a4@citrix.com>
Date: Tue, 28 Nov 2023 13:17:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2023 1:00 pm, Jan Beulich wrote:
> On 28.11.2023 10:46, Federico Serafini wrote:
>> Uniform declaration and definition of guest_walk_tables() using
>> parameter name "pfec_walk":
>> this name highlights the connection with PFEC_* constants and it is
>> consistent with the use of the parameter within function body.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> I'm curious what other x86 maintainers think. I for one don't like this,
> but not enough to object if others are happy. That said, there was earlier
> discussion (and perhaps even a patch), yet without a reference I don't
> think I can locate this among all the Misra bits and pieces.

I looked at this and wanted a bit of time to think.

Sadly, this code is half way through some cleanup, which started before
speculation and will continue in my copious free time.

It's wrong to be passing PFEC_* constants, and that's why I renamed pfec
-> walk the last time I was fixing security bugs here  (indeed, passing
the wrong constant here *was* the security issue).  I missed the
prototype while fixing the implementation.

At some point, PFEC_* will no longer be passed in.

Therefore I'd far rather this was a one-line change for the declaration
changing pfec -> walk.

As it stands, you're effectively reverting a correction I made.

Thanks,

~Andrew

