Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAE4A02DE4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 17:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865831.1277099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUq6p-0007Zf-SI; Mon, 06 Jan 2025 16:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865831.1277099; Mon, 06 Jan 2025 16:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUq6p-0007WW-Oi; Mon, 06 Jan 2025 16:37:43 +0000
Received: by outflank-mailman (input) for mailman id 865831;
 Mon, 06 Jan 2025 16:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUq6o-0007WQ-Vl
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 16:37:43 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 884be297-cc4c-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 17:37:35 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso105585745e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 08:37:34 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832a90sm47699194f8f.28.2025.01.06.08.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 08:37:33 -0800 (PST)
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
X-Inumbo-ID: 884be297-cc4c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736181454; x=1736786254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IcvkX/5ZL+kPSoX1BuigmpSqK7fJqYkWuQNOCL2eGKY=;
        b=oJbrHnMVH1Qy+Nkuo9joEJ+n/H6+HMC1yguZinXDbP5Mq/lBoOLSsknOnj4D9duMeo
         w1rCbOQpfeCNL51C9ZDgffFnoBhobqwysMBodkZuJZpDFga03NSBPRDMMIO+Wvc5ZcSj
         G0S4JXOObl76Kbq8En7O73DW3P88UOsV2blsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736181454; x=1736786254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcvkX/5ZL+kPSoX1BuigmpSqK7fJqYkWuQNOCL2eGKY=;
        b=vwznwxWFJRCCL/7gP2ozf218VF69i1b5wptsZEM5dmX/4mdQtfllcKHiJI9ztSAPvn
         5A1bQIDk9Pxe+YSIPGycLSr5OvN36UBKHk3otYy+MmGkh5KJM6haArMWGdIchiev+fGx
         NwvAbzCuALWpl6Kky3zsaazP5jQ70HBkvdMVHZcL2Fql/cVyWsFqTOEXU8QgvSciJbKf
         cSVB0bXKc1nUTwh5rIDHYod+zpJKpC3FOWyi9P/+QMPjnQTqUwC3gaRsR+gHEn2vUq0I
         Rw8mqcs99dGh2qdcSqYBEmL4F3tcngKFw/n8P9Obiqz/VyI8O2ZkQdd9aHLY/QpHqqaF
         EERg==
X-Forwarded-Encrypted: i=1; AJvYcCWotO9kCxov6MzqQLipGzZD0C+6lKiGrW01kucT4gBihpxW3JTtzqu4XpvcM6//59WvSAA1VbPZosM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybhSzPPL+35z7l4ltt1YxcergqSNmV+ll9OZeS4LYOmi+CkJmC
	+MGwJxTOcjzSxVEKTwo+TB5LdD9Ry0Y0S/Ib7rax8Mkp3LYqVe8kIMMYw1zh3go=
X-Gm-Gg: ASbGncubXdM5yQIym3iC6Y56iSCVJ/i77wM5DpmV3ywoT2xFL5NohHc54ozvAKM8F/e
	tOGN+0jr3/CdlUT5/OLWNvTBuFcx5RSWMNQJl7C3zZexGjVTZjhcVmbTZQx5lgBFVBB4yb2Aq9Y
	UKurYpRJpMOwAalbW8Qjy2voS96OUi/sdH3DzHzvNFx22UhRDY4tUqabswbAp0PwxXz5KOmMx7f
	7RVDvAjB4lIhDU+5LyROc1Zv7g5LXRdrvE5OqgN2Shn/GxsFMPp4mPkharx+yCDYeDgz1XYKmpZ
	tO+9wAzTu/qlnM44YPps
X-Google-Smtp-Source: AGHT+IGLN4j2L5U5eqiIrAWpJz/FuCb9BJVF7DOB39Nbj0B7waFunuwjUKBeRb7p8k7f/XzIUR7T5g==
X-Received: by 2002:a05:600c:350c:b0:434:a1d3:a30f with SMTP id 5b1f17b1804b1-43668547554mr458996925e9.6.1736181454399;
        Mon, 06 Jan 2025 08:37:34 -0800 (PST)
Message-ID: <03d356de-d3ba-4cb9-acd6-408bde58e77b@citrix.com>
Date: Mon, 6 Jan 2025 16:37:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/amd: Misc setup for Fam1Ah processors
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106141929.615831-1-andrew.cooper3@citrix.com>
 <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/01/2025 2:41 pm, Jan Beulich wrote:
> On 06.01.2025 15:19, Andrew Cooper wrote:
>> Fam1Ah is similar to Fam19h in these regards.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> With this patch, I think we're in an ok position to declare support on Zen5
>> CPUs.
> What about amd_log_freq(), where the 0x19 upper bound may need bumping?

The Pstate MSRs are still there, but their layout is quite different. 
FID is 12 bits, and Vid is 9 bits in two split fields.

As this is only informational for now, I think I'll leave it.  This
needs a bigger rework to make the code tractable.

~Andrew

