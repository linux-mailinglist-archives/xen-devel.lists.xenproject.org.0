Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EEF6B83CF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 22:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509386.785049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbpRy-000463-CG; Mon, 13 Mar 2023 21:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509386.785049; Mon, 13 Mar 2023 21:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbpRy-00043r-9K; Mon, 13 Mar 2023 21:11:22 +0000
Received: by outflank-mailman (input) for mailman id 509386;
 Mon, 13 Mar 2023 21:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AHq2=7F=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1pbpRx-00043k-Kb
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 21:11:21 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9943f0a0-c1e3-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 22:11:19 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id c18so14753965qte.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 14:11:19 -0700 (PDT)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 he3-20020a05622a600300b003b2ea9b76d0sm531480qtb.34.2023.03.13.14.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 14:11:18 -0700 (PDT)
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
X-Inumbo-ID: 9943f0a0-c1e3-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxjfrC1RVzowEsrbiQt3NxdAPBiEVLmHFpGZAw3vd74=;
        b=OfIMkdTF+8iIL629XaxNH0Jf7dAwGJIQ/akYY/xZlgqNfYTZ2uZ/ai8aS6uKU0dfMg
         6qhu6UTqLnIGDp+Pe6DGyyeC0N8Btqqs8lZmRN8Gk+W1tmCfbTiktmFiuc6p1XkHjuQp
         dj3mId8zZpHtcky/mOrgSIFv8LjyOsQe3+Z1l8MU9RjhvBP6Q1cftscI+9W2Pfwk25Qk
         fPWIDMDY/MNYG6/EuCSxhCf7m7hDo8NsLEHtjIUT10SfuoWugGU1vxk+hU9WVJZSmSMD
         rAEQ9Waoof2Bfhp3au9dEzSHm6AiqNtx1qZoT9bjmY4g6AaR8OD9Sq68rFh1J50IXt5M
         L3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxjfrC1RVzowEsrbiQt3NxdAPBiEVLmHFpGZAw3vd74=;
        b=xwpeihtV2jwpAUYw9V5xGjsaS8nsUQ3F5pdqxSjeM6A+VEeaJxLtHpevcA0IXdz+9q
         06XyNCHKRGO/j9suxKtnMex7JAPR80dFCE2mhixilhBIqBdHP8jUwzMxy3/C9qXFPaqy
         5aizvduWxFYMq2cygfDqa+j0Aj6rVs9oMpV3RWNEw2IQhbsMRzDQIeYRbs1pC1irs/hP
         aR0zyQJK7d00roAxRgmLD/7Ictd9zPcqpMSd8ssPGfhCDrcD/66godwGpYDRP6zuVCzs
         jHJQ+TlmZ0frvM8tdyBYQNAG+iM97dl/TdhivZ9XjoA6j3ZemksxH3I+gdTeL+ZkGSLM
         2J3w==
X-Gm-Message-State: AO0yUKVyfDbC2dki6vjGwOk7U+IizjUzoQYWpQmKx6tt6Y15eICLA5O1
	8eJCpKglQwZAmFlYm4YpGUQ=
X-Google-Smtp-Source: AK7set9SjO3qTMLNBsvz/fTTNMfBfYnBakPz802pwHaNPzoiIUcnqKUMJ7JyqfY837saYa9LTbeIRQ==
X-Received: by 2002:ac8:7f02:0:b0:3bf:c6ec:e960 with SMTP id f2-20020ac87f02000000b003bfc6ece960mr29916903qtk.32.1678741878526;
        Mon, 13 Mar 2023 14:11:18 -0700 (PDT)
Message-ID: <d17d7b39-28ce-55a6-8d2b-fe2dfd10c38d@gmail.com>
Date: Mon, 13 Mar 2023 17:11:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230313175047.20719-1-jandryuk@gmail.com>
 <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
 <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
From: "dpsmith.dev" <dpsmith.dev@gmail.com>
In-Reply-To: <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/23 15:14, Jason Andryuk wrote:
> On Mon, Mar 13, 2023 at 2:49 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>> On 3/13/23 13:50, Jason Andryuk wrote:
>>>                usage(argCnt, argv);
>>>
>>> +     if (argCnt == 4) {
>>> +         pirq_label = argv[3];
>>> +     } else {
>>> +         pirq_label = argv[2];
>>> +     }
>>> +
>>
>> style nit: space inside parens and curly brackets could be dropped or
>> should be moved to their own lines.
> 
> This file doesn't follow Xen style.  I think dropping the curly braces
> is fine, but the lack of spaces 'if (argCnt == 4)' should stay for
> consistency.  Does that sound okay?
>

Hmm, I thought there was interest in getting everything in tree 
consistent, maybe I am mistaken. I am not hard pressed to enforce the 
style. Unless someone else objects, I am good with your proposal.

>>>        xch = xc_interface_open(0,0,0);
>>>        if ( !xch )
>>>        {
>>> @@ -107,7 +114,7 @@ int main (int argCnt, char *argv[])
>>>        if (fscanf(f, "%" SCNu64, &start) != 1)
>>>                start = 0;
>>>        if (start) {
>>> -             ret = xc_flask_add_pirq(xch, start, argv[2]);
>>> +             ret = xc_flask_add_pirq(xch, start, pirq_label);
>>>                if (ret) {
>>>                        fprintf(stderr, "xc_flask_add_pirq %"PRIu64" failed: %d\n",
>>>                                        start, ret);
>>
>> Style nits aside, LGTM.
>>
>> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Thanks,
> Jason
> 

