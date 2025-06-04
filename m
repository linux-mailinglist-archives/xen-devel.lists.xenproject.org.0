Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D3ACDC36
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 12:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005415.1384914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlo6-0002GO-As; Wed, 04 Jun 2025 10:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005415.1384914; Wed, 04 Jun 2025 10:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlo6-0002Eo-7q; Wed, 04 Jun 2025 10:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1005415;
 Wed, 04 Jun 2025 10:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/urA=YT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMlo4-0002Eh-6A
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 10:57:16 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe9e837-4132-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 12:57:13 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so31535335e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 03:57:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb80f6sm192840155e9.28.2025.06.04.03.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 03:57:12 -0700 (PDT)
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
X-Inumbo-ID: abe9e837-4132-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749034633; x=1749639433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kIdDRLdK9ahe0t0qTzt/qdF8nLEjAB0AXrpApyXgJyk=;
        b=FHrIJYEdDngEtg/mKKKkKQKJq28vnf26ojUFfY5/AMJAjWHn4woXiUlJE8J+wjQ0+m
         YZPAzp1OqQ5qDX3nk0gcsbjRBz89Ris2WX1k32S982sPgxYi+Jotvb79hyjQLP9LszQk
         xgO/2DF84XfTFYCIc/fU/Q6ygioCP+u1Y2KWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034633; x=1749639433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIdDRLdK9ahe0t0qTzt/qdF8nLEjAB0AXrpApyXgJyk=;
        b=icU+07785FiFg/wh6CXvn+WSfewmxjVr9tnnFtxwUMNNedF66kjd5W9As7tx0KDrkv
         FWbvsGFAHgvIYGguWwWKFR1Ttdbxw4vqQiAyPH+/oe/2OxwYDoxVztJTVHjNQ8sNBUnh
         DtGgnNpsxpF5jDcKQJ07ywSMRdMek3QG9/N7vx8uXzmp1McearipvUrcaITtEjDR9tI8
         92YwOGeqDYWDYx1Qy3fOLPkoWhNxo+9yrUbpQB9PP4br8KSsnBmlx4H8TDUy7qHYpdbv
         OCzsfwtBSrWe2Ve/YPTfd/k2V+KSPZDQOpQpah90AK8e9ZHfXVO1+UQyTx/fe72HCGM4
         fWAw==
X-Gm-Message-State: AOJu0YwbfMiXa+Zqe3zBxL7GwBRTOS9Rs06wjwJu77JTxsBUP3Qa09er
	j+EHupt2b7P4R8/uel+WK9g7kDhZ7ynxFUnXYJzF+XDwnrbqg1NgxgxlK6js/LVLAM0=
X-Gm-Gg: ASbGncvWQJg/fDVZLs5J5W69SOsStRbqm8pCgNx/cV4/Fu+ezuSRPHAGI1I/3xDfq5A
	EPeMtwJWgAFsvorgb5tvVDDWTijkkwkIHkz7kWuQiTTQDlP1kPeDjVmeM66H3G9sXQqx2eC6pNy
	KewyHAbRmLA+bg8qAR2EMttMmh6TZF45q3XoYoYg+hhI+wb3Bw03kFdQ32DnXrAqo6LB3XiZKBv
	eXc7+e4oQMavvOEX4Jhcp79qufKQ6WN4yZLT/QQ1WrkIfoPvw6C3jPP6CurSYL27QgGI3WUtxpY
	fHg6TKEOis8GezLmu44Op8i5suH5CwwlelaMabvtjkswosyHsG42ecx/sX8i4FDz4Q/J4Gv9Z7e
	1o2RMri+cU4hqLLNT
X-Google-Smtp-Source: AGHT+IGI2SBhRZBFTbtMTow/6jyX/VdSaAAq/Qv8jYwoAGWQYL4x1hTt1GZbsgK25ZCGsZEX/23i7w==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a51dc49afcmr1776994f8f.51.1749034633199;
        Wed, 04 Jun 2025 03:57:13 -0700 (PDT)
Message-ID: <384fd17a-9236-4727-b564-543edff65e9e@citrix.com>
Date: Wed, 4 Jun 2025 11:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 9/9] CI: Add timing to junit
To: Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-10-anthony@xenproject.org>
 <alpine.DEB.2.22.394.2506031130060.1147082@ubuntu-linux-20-04-desktop>
 <aEAIXmOlht3b9TkK@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aEAIXmOlht3b9TkK@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/06/2025 9:48 am, Anthony PERARD wrote:
> On Tue, Jun 03, 2025 at 11:35:22AM -0700, Stefano Stabellini wrote:
>> On Tue, 3 Jun 2025, Anthony PERARD wrote:
>>> From: Anthony PERARD <anthony.perard@vates.tech>
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>>> ---
>>>  automation/scripts/run-tools-tests | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
>>> index 852c1cfbcf..e38cc4068c 100755
>>> --- a/automation/scripts/run-tools-tests
>>> +++ b/automation/scripts/run-tools-tests
>>> @@ -18,9 +18,12 @@ for f in "$1"/*; do
>>>          continue
>>>      fi
>>>      echo "Running $f"
>>> -    printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
>>> +    time_start=$EPOCHREALTIME
>>>      "$f" 2>&1 | tee /tmp/out
>>>      ret=${PIPESTATUS[0]}
>>> +    time_end=$EPOCHREALTIME
>>> +    time_test="$(bc <<<"$time_end - $time_start")"
>> As it looks like no other scripts need bc at the moment but we already
>> rely on awk (automation/scripts/xilinx-smoke-dom0less-arm64.sh) I'd
>> prefer this version:
>>
>> time_test="$(awk "BEGIN {print $time_end - $time_start}")"
> You mean I have to choose between busybox and busybox?
>
> $ ls -l $(which bc awk)
> lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/awk -> /bin/busybox
> lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/bc -> /bin/busybox
>
> :-)
>
> I guess it doesn't really matter.
>
> One difference though:
> $ awk "BEGIN {print $time_end - $time_start}"
> 3.28798
> $ bc <<<"$time_end - $time_start"
> 3.287982
>
> awk is less precise, but I guess that doesn't matter as well, gitlab UI
> isn't going to show the extra digits.
>
> So I guess I can change to use `awk` instead, just in case for some
> reason `bc` isn't present, since `awk` seems mandatory for many of our
> scripts.
>
> Thanks,

bc is a normal posix utility just like awk is, so there's no change in
dependencies caused by this.

Furthermore, it is the right tool for this job in a way that awk isn't. 
Besides the reduction in precision, see xen/tools/check-endbr.sh for the
number of ways we found that awk malfunctions with large numbers.

I firmly suggest continuing to use bc here.

~Andrew

