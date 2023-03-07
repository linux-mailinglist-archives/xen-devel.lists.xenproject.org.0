Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAB6AE35E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:54:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507485.781042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYht-00056c-5T; Tue, 07 Mar 2023 14:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507485.781042; Tue, 07 Mar 2023 14:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYht-00054X-18; Tue, 07 Mar 2023 14:54:25 +0000
Received: by outflank-mailman (input) for mailman id 507485;
 Tue, 07 Mar 2023 14:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYhr-00054P-OR
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:54:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f25b9d93-bcf7-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:54:22 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so10571412wmb.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:54:22 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b003e4326a6d53sm18436678wmq.35.2023.03.07.06.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:54:21 -0800 (PST)
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
X-Inumbo-ID: f25b9d93-bcf7-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200862;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdxSf6SnonAAwLmy54FpkIbxFn6Qi3VVeANxs4vZxrg=;
        b=bibefQLATF40wYnR5zViShOZ89NAvBfsEeNNinDWOv5sbqm//7xkftpPqmOYl5jh/3
         q2r0COCaVa6QuJ/q3xNydDdH3MYKZlRpobyfxVBdZuZgRECwq/4XDVghXE9glnLo2L+l
         Pe4Lr5sAbI6XGtbP/HGuKYVoxhcG94Z6ei3LXeEG+CtqyPe28dmoJ7oBvZD1hOpqUjJ8
         Tx6Fj660MUZVLfF/eJ/WTgh0JmdRUl87WwduKkXLwbagPAEmcDwVJWEu5IRw4wWp2rjX
         5ZxIHk6zJwBTW36hiHXdiuf8tifDQhYoN/4aIKJID2iSF7o92pc1hOPhNjxmpRwlTBz/
         +QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200862;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdxSf6SnonAAwLmy54FpkIbxFn6Qi3VVeANxs4vZxrg=;
        b=RGFN8S5G/fSl2NBuacswfZvZ6D9Ni0VdMcn5wWxNhtZeZA81GGC9Z2HufVNnG65Y9m
         o/uKnai8j2gc3rk8uhN1vCo3oqeuiBJvalj0+8JlhVxfk+nJSmLfZ6+T7EKAHtQ8LWAp
         cxGNbyMRLoAGGyy9Q4PBZnm46jZMqZzraITSJDJEq3PMqqEmmOa7CRh5rkYRDvKIKY4F
         47ptarXzIWOks8CCXcsmNAsVZzl30jwxYPYftL+fTCIAgBcE7YC9G1gRulIpxZUovXXs
         Nj1NeQn6FNiqIN/iE2kgssBmKjRWPS4cF1Flovrmf0Gd6j4i8+vQJ8yn1vBTqbF37FFk
         cM3Q==
X-Gm-Message-State: AO0yUKUoxxVxmNgHq/MXF8BuRr1r0n24VxvLGEdVFuju6RZmVwRLPw9N
	F700a0P8z7CylMWdROVO9mw=
X-Google-Smtp-Source: AK7set8iCKTQBnGbDNjKai95sv5yqanRu3s4h7W0GOaj7zxXgfCOXEduXIziA7ZdHqZF4BIIyAlBCw==
X-Received: by 2002:a05:600c:4751:b0:3eb:2e66:8 with SMTP id w17-20020a05600c475100b003eb2e660008mr13423737wmo.35.1678200862386;
        Tue, 07 Mar 2023 06:54:22 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f121c025-2203-70b7-c20d-aed40b88faa4@xen.org>
Date: Tue, 7 Mar 2023 14:54:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 12/25] hw/xen: Add foreignmem operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-13-dwmw2@infradead.org>
 <470e51bf-5159-fd32-93b5-03f5bdf5f050@xen.org>
 <bac842b0b1ea81e5aee922f3864bf57b99c515d4.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <bac842b0b1ea81e5aee922f3864bf57b99c515d4.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2023 14:48, David Woodhouse wrote:
> On Tue, 2023-03-07 at 14:40 +0000, Paul Durrant wrote:
>>
>>> -
>>> -#define xenforeignmemory_unmap(h, p, s) munmap(p, s * XC_PAGE_SIZE)
>>> -
>>
>> Actually, probably best 'static inline' that, or at least put brackets
>> round the 'p' and 's' for safety.
>>
> That's the one we're *removing* :)
> 

D'oh... so we are :-)

>> With either one of those options chosen...
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Taking that anyway.


