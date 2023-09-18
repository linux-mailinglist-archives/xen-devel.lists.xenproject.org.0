Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7E7A49AE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 14:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604018.941211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDPV-0007jc-Mm; Mon, 18 Sep 2023 12:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604018.941211; Mon, 18 Sep 2023 12:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDPV-0007hN-KA; Mon, 18 Sep 2023 12:31:29 +0000
Received: by outflank-mailman (input) for mailman id 604018;
 Mon, 18 Sep 2023 12:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngl4=FC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qiDPU-0007hH-UV
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 12:31:28 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4979a252-561f-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 14:31:27 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40476ce8b2fso38048555e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 05:31:27 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003fefcbe7fa8sm12422668wmo.28.2023.09.18.05.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 05:31:08 -0700 (PDT)
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
X-Inumbo-ID: 4979a252-561f-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695040287; x=1695645087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eyq7XKz+Pwc3IHWuGyUogdikjt6N7gbNZGUDPCycHWE=;
        b=kfvuNamhIyVRVTW5HwntsD4Oe53peDtYew5/qMhr1l6V7RTdkf9aBgzJx71unBDXOg
         vKSubAlbmykc/xhT4iUsN4kt/jllD2G7DuNmeZQbIW+O/o2aWZm7fz+YUQlit/NpRfZv
         X4xbEcrzaDP3DAb0eBDpXQ1lTZ4X/NyQB2svQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695040287; x=1695645087;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eyq7XKz+Pwc3IHWuGyUogdikjt6N7gbNZGUDPCycHWE=;
        b=aTGGS/PB5oxOkh6Y7efnq0IdV38XBlQaNDBLfgMjuobXHvn18HIoI31yZ1d6ndJa5M
         KNa3SnHtj7Tf2SJgfZFf9tVMjUsSPBOUA63ZfwJUB8ywVHLFzGebtJB3V4v1rMhhPq26
         Qh9sTZ7OFk5/+TeLKIVZApwvtLFyF9E4mvaa+ITVST6qAsPwYpTDuT+yCs/o/f0XiIQN
         lXnIbNipRy7y0NYdiKkUZGuU8Mpw4UKG15XlbQEhh4VOh6ZRrMgHYbcgUTNyYhqMNMK2
         V9aBa8qIDRkU1GNAqyUFK8iAhq13MNi3iIO9Aytqw1Ffayy4ISSYXDcNXkg5Gp5PiNOv
         NK+Q==
X-Gm-Message-State: AOJu0Yzl14FzzCmQ1sjo/NmILU4qlKVFJu0Gl9KcXFdetSta+L0kTYgT
	5S1rU0FP6pW7liXOazputRMTvptwIxpb6zUo+T4=
X-Google-Smtp-Source: AGHT+IGCkzVGmx78iq0Pc4rpUPg8VOyCxqnY4qyMet0vDPgE6Glk0JEQbLxzRDMmaHpTYcM3BdH9dA==
X-Received: by 2002:a05:600c:228c:b0:401:c52c:5ed8 with SMTP id 12-20020a05600c228c00b00401c52c5ed8mr7524727wmf.13.1695040286752;
        Mon, 18 Sep 2023 05:31:26 -0700 (PDT)
Message-ID: <7d1eb0eb-adec-0890-2c30-a99404e0291c@citrix.com>
Date: Mon, 18 Sep 2023 13:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] x86/spec-ctrl: Improve all SPEC_CTRL_{ENTER,EXIT}_*
 comments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-5-andrew.cooper3@citrix.com>
 <7eeaaf67-336b-e5a1-6f64-9ad5db14e330@suse.com>
In-Reply-To: <7eeaaf67-336b-e5a1-6f64-9ad5db14e330@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2023 11:59 am, Jan Beulich wrote:
> On 15.09.2023 17:00, Andrew Cooper wrote:
>> ... to better explain how they're used.
>>
>> Doing so highlights that SPEC_CTRL_EXIT_TO_XEN is missing a VERW flush for the
>> corner case when e.g. an NMI hits late in an exit-to-guest path.
>>
>> Leave a TODO, which will be addressed in subsequent patches which arrange for
>> DO_COND_VERW to be safe within SPEC_CTRL_EXIT_TO_XEN.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Two nits though:
>
>> @@ -233,7 +236,11 @@
>>          X86_FEATURE_SC_MSR_PV
>>  .endm
>>  
>> -/* Use in interrupt/exception context.  May interrupt Xen or PV context. */
>> +/*
>> + * Used after an exception or maskable interrupt, hitting Xen or PV context.
>> + * There will either be a guest speculation context, or (baring fatal
> Isn't this "barring"?
>
>> @@ -260,7 +270,13 @@
>>  .endm
>>  
>>  /*
>> - * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
>> + * Used after an IST entry hitting Xen or PV context.  Special care is needed,
>> + * because when hitting Xen context, there may not a well-formed speculation
> Missing "be"?

Both fixed, thanks.

~Andrew

