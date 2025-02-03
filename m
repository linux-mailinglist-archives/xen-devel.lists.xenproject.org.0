Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E0A25C25
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 15:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880638.1290721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1texIO-0005yb-7x; Mon, 03 Feb 2025 14:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880638.1290721; Mon, 03 Feb 2025 14:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1texIO-0005x8-5B; Mon, 03 Feb 2025 14:19:28 +0000
Received: by outflank-mailman (input) for mailman id 880638;
 Mon, 03 Feb 2025 14:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1texIM-0005x2-PT
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 14:19:26 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd2d66d6-e239-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 15:19:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4368a293339so52298035e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 06:19:22 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c121951sm12785214f8f.45.2025.02.03.06.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:19:21 -0800 (PST)
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
X-Inumbo-ID: dd2d66d6-e239-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738592362; x=1739197162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETHDWanz7Pqyli/mRcZ89Djn2JGXGcmhrS8B5n0KDH0=;
        b=QPKe/ahlXz+Dabi7yQ925jy0fCLeHd0ov/+F/8VNkLIIfqRLCSB2/VoUgVH6tB5Z2A
         npD4qK7c2lTyq5m4w0jmJk75VYiw+s9YPKx42LsieM4+KUqxp8EvUrM3QL3WssCfsvgF
         xbXDtlgti57LFJAIPh6+R7s4avQ8ZfZb8rxXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592362; x=1739197162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETHDWanz7Pqyli/mRcZ89Djn2JGXGcmhrS8B5n0KDH0=;
        b=wNMJqYSCmwETpUIp6YwXplguJzvHs83WsZ3IeufHRFo5sh2dsb8tGQIjIENhzR/y2G
         2fZZ8G0rydDeucz5G/aXOG1W1803GpgYN0TxVmfbYLmnLg5y/YVghQbNO8nSwmxMmuh0
         hp0oiLyYI2E4N+Rwge1OrUb/vepoiFzU9k3NbKdCzywDeZVpiprctl4QIeqhCGYBZJjq
         55/tJ1E2t1Q86DiZ13w5RBowYranMDAiPIIdyJ7rOW0V60A9B/em9vauE3qexKM2Czl1
         fvznhAt54BsrHnDEqMJLTI1D3cC5mpq8gKFQz7NR+NUO1xhwBI/PyyT8Xc4hTyImv2gE
         kf9g==
X-Forwarded-Encrypted: i=1; AJvYcCVVtwpcDbJNG3tHnsw0itPVre7oQYvxGYzyjpgDS2ib3GsEYfPbpsFTIsSsp87yqOq6ZF6h1IyYX8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaXCDK1rADqgjiko7HBAxvv8fBK9wvD7f3BHfak5WrOUxXAXgS
	pC06kU8v4nqTD7pznssKU8yEQidi4x8IAALMa6qNKWbFSNRCdHjNftXgLmbgo14=
X-Gm-Gg: ASbGncux/JavZIJkRS5dYumfC9RxOJN4yauOTlgSY5zQRkuTrulHXRy1clxvVXFQRNj
	GTfZFNQXO9wWhdchETr+iayj5li6aYo4qK6IUC+NmkA5N72522TmelLglWlJ3HxUzgo1gAQIOHj
	eSqy3G2QyQsJHn/2WWUbN5dfzWhSOr7xxy+Nu3No369K8B0A1JA9CLijcXSeYMhy29EiYOSEekU
	bepP7sVBYRdHvkRvRqDWN9rSxgBG2eTYLDtYeBGAV/tszoievXhqXXK8+6MRYNwXZwUE++yUMrB
	sS9kO3+23BE/US0gAZsOW9LAjmPcogh7XB3apna8xIysss89njJvg7I=
X-Google-Smtp-Source: AGHT+IGd2+ykeUw7SJ1VGRLZb2G7YfZ2IPBqeLaoEmNAllDJjf3pdOstFXrpdY3RNUJYcFgcsSetUA==
X-Received: by 2002:a7b:c347:0:b0:436:6460:e680 with SMTP id 5b1f17b1804b1-438dc3cc9e6mr208640275e9.16.1738592361827;
        Mon, 03 Feb 2025 06:19:21 -0800 (PST)
Message-ID: <ad10a9d3-672e-443f-a7cd-c50df16b67b4@citrix.com>
Date: Mon, 3 Feb 2025 14:19:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
 <cf5ae390-fb9d-4839-9423-d1ead9bd34bf@citrix.com>
 <14d1f7fb-4e4e-4f06-b3e6-8ab25de7f939@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <14d1f7fb-4e4e-4f06-b3e6-8ab25de7f939@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 8:41 am, Jan Beulich wrote:
> On 02.02.2025 14:50, Andrew Cooper wrote:
>> On 30/01/2025 11:11 am, Jan Beulich wrote:
>>> While the 2nd of the commits referenced below should have moved the call
>>> to amd_iommu_msi_enable() instead of adding another one, the situation
>>> wasn't quite right even before: It can't have done any good to enable
>>> MSI when no IRQ was allocated for it, yet.
>>>
>>> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
>>> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>> @@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm
>> There's a call to amd_iommu_msi_enable() just out of context here which
>> was added by the 2nd referenced commit.
>>
>> Given that it's asymmetric in an if() condition regarding xt_en, and the
>> calls are only set_affinity() calls, why is this retained?
>>
>> (I think I know, and if it is the reason I suspect, then you're missing
>> a very critical detail from the commit message.)
> Hmm, you did read the commit message, didn't you? That commit should have
> moved that call, rather than adding another one.
>
> However, you have a point. It looks like 7a89f62dddee ("AMD IOMMU: make
> interrupt work again") should already have removed that call. Prior to
> that change request_irq()'s call (via setup_irq()) to iommu_msi_startup()
> was in fact premature, as MSI address and data weren't set up yet (IOW
> while still apparently redundant, the extra call served kind of a doc
> purpose). Things apparently worked because the IOMMU itself wasn't
> enabled yet, and hence shouldn't have raised any interrupts prior to MSI
> being fully configured.
>
> However, for S3 resume I think the call needs to stay there, as the
> startup hook wouldn't be called in that case (which may be the detail
> you're alluding to). Imo that wants solving differently though. Not sure
> it's a good idea to do this right here, or perhaps better in a separate
> change.
>
> I've added
>
> "The other call to amd_iommu_msi_enable(), just out of patch context,
>  needs to stay there until S3 resume is re-worked. For the boot path that
>  call should be unnecessary, as iommu{,_maskable}_msi_startup() will have
>  done it already (by way of invoking iommu_msi_unmask())."
>
> as a 2nd paragraph to the description, in the hope that's what you're
> after.

Ok, not the reason I was thinking.  I was thinking it was an x vs x2
APIC issue, and split setup path.

It is specifically weird to have:

    if ( msi )
    {
        if ( cap_xt_en )
            ...
        else
        {
            ...
            amd_iommu_msi_enable();
        }
        // should enable here ?
    }

If this call really is only necessary for the S3 path, that explains
half the problem, but what activates MSIs for the xt_en case after S3?

~Andrew

