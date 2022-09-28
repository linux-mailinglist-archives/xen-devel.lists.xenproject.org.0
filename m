Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C961A5EDDBB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 15:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413341.656925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXAs-0003kA-Oa; Wed, 28 Sep 2022 13:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413341.656925; Wed, 28 Sep 2022 13:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXAs-0003hG-LW; Wed, 28 Sep 2022 13:32:30 +0000
Received: by outflank-mailman (input) for mailman id 413341;
 Wed, 28 Sep 2022 13:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koGe=Z7=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1odXAr-0003hA-Ca
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 13:32:29 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feb71358-3f31-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 15:32:28 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id s13so8095696qvq.10
 for <xen-devel@lists.xenproject.org>; Wed, 28 Sep 2022 06:32:28 -0700 (PDT)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bb208bd889sm2988237qkb.120.2022.09.28.06.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 06:32:26 -0700 (PDT)
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
X-Inumbo-ID: feb71358-3f31-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6o+q+v2aIGZEskjyk0+qGEOnEAAO7SKQ70FzXx2J318=;
        b=EtiESMFRLPnc8/Cmg5kTJyidHSVPD2e0Zhn34e64gurRN4BAJFigzv9UurW4R1lx7T
         Juj8kNLQqAhB3mApl+//tPE8P6hDGoz+B0+QhTmqWNId6loTIGoBqnWu8FXg65MpTfEE
         llzZ8W4JbHndDnpws21dHcOAc+jo/uD3p+ymj9RhN6vnARvLZn5HK6qAW8qBPFclvazc
         XZk7pIofdB5NSX7xHv4/yfgrlR/pSD6sQa9LcoK2deDgvkJLb8Gej8bStK8o4Qt7F/Q6
         pfpUb5rkEdpLCq9kgXAs79V7Suhx3Jc9LqGWzBpfbh000xfo0+GXw+XHfM+7BlaDVAkV
         Fpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6o+q+v2aIGZEskjyk0+qGEOnEAAO7SKQ70FzXx2J318=;
        b=2KdqysUB0QwSFfP2nEy1VNDUGjSlCvpQJngNvt1VaaBNgmg/k6GeP5DM0EJLMsHqov
         fz09u+l5+Lu2KfeQ0CAAXWiyVSvpSiXaaBak48JkArRsv7zDYw0QYA8DyI9ndCwJW4ue
         0ibLVVk4l854yicutnfn73mAz7Hr4UgdKBlOeMoPxOIv9TRwYeIPNU9XMnzCfYVBgsLE
         U2TES9YkUdeCs9kaphlSPqRw4mo4IvSl3flFcv0ZmMzuWRgf2QgZcnwZSS6GdSiZ7435
         97zsnYVM0MITNPU6fFlsAn6wKCs/sAf0pKXtclGVa6pbZipcZqJhcihFROv3/1EB25ti
         p8YQ==
X-Gm-Message-State: ACrzQf2Ps0HvyWHUaH+pdqLx7QQZPnkCSaUKOwkIMQHhs6ATa11a+E1C
	PqUpkPI46KhrxwS8jAZ+5/FCv4AwqUk=
X-Google-Smtp-Source: AMsMyM7sHmtjL446ge86Qtx0vbY7S01QAHBs/oaCINxQKC8nxuOhQ7ArRP8oWkRhEJWcnMBMVdYUXA==
X-Received: by 2002:a05:6214:20e6:b0:4ac:99bb:5821 with SMTP id 6-20020a05621420e600b004ac99bb5821mr25270573qvk.39.1664371947168;
        Wed, 28 Sep 2022 06:32:27 -0700 (PDT)
Message-ID: <9340769a-d3cf-a7bb-f8f4-dc9bde463c02@gmail.com>
Date: Wed, 28 Sep 2022 09:32:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
From: "dpsmith.dev" <dpsmith.dev@gmail.com>
In-Reply-To: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/28/22 06:38, Jan Beulich wrote:
> For quite some time we've been talking about replacing the present virtual
> address based hypercall interface with one using physical addresses.  This is in
> particular a prerequisite to being able to support guests with encrypted
> memory, as for such guests we cannot perform the page table walks necessary to
> translate virtual to (guest-)physical addresses.  But using (guest) physical
> addresses is also expected to help performance of non-PV guests (i.e. all Arm
> ones plus HVM/PVH on x86), because of the no longer necessary address
> translation.

Greetings Jan,

I think there are multiple issues in play here, but the two major ones 
are 1.) eliminating the use of guest virtual addresses and 2.) handling 
the change in the security model for hypercalls from encrypted VMs. As 
Andy was pointing out, attempting to address (1) in a backwards 
compatible approach will likely not arrive at a solution that can 
address issue (2). IMHO, the only result from teaching the existing ABI 
to speak GPAs instead of VAs will be to break current and new kernels of 
the habit of using VAs. Beyond that I do not see how it will do anything 
to prepare current OS kernels for running as encrypted VMs, at least for 
AMD since that is the specification I have been focused on studying the 
last couple of months.

As for ABIv2, I understand and can appreciate Andy's desired approach. 
Recently, especially with the hardware changes being introduced by SEV, 
I would like to have considered a naive and more radical approach. 
Currently hypercalls function using a more ioctl style. I would like to 
suggest that a packet style interface similar to netlink be considered. 
There are many benefits to adopting this type of interface that could be 
covered in a larger RFC if there was any sense of willingness to 
consider it. As a glimpse, a few benefits would be that arbitrary 
buffers, continuations/asynchronous calls, and multi-call are all 
natural consequence. It would also allow advanced extensions, such as an 
optional PF_RING-like interface for zero-copy messaging from guest 
user-space to hypervisor. While a packet interface could easily co-exist 
with the existing ioctl-style interface, it would be a paradigm shift 
from the past, though I feel ABIv2 was already going to be such a shift. 
Anyway, just my 2¢.

V/r,
DPS

