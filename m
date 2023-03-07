Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A66AE70D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507624.781382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaRa-00030J-GV; Tue, 07 Mar 2023 16:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507624.781382; Tue, 07 Mar 2023 16:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaRa-0002xm-Dk; Tue, 07 Mar 2023 16:45:42 +0000
Received: by outflank-mailman (input) for mailman id 507624;
 Tue, 07 Mar 2023 16:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaRZ-0002xg-8p
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:45:41 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e4de450-bd07-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:45:40 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id e13so12762351wro.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:45:40 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm17238951wmb.36.2023.03.07.08.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:45:39 -0800 (PST)
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
X-Inumbo-ID: 7e4de450-bd07-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678207539;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUCJfRpYrXa3hmennCAGY+YEYiHIHFS8VjWjYrfABl8=;
        b=qnaUa/I/dBMAkJF5FD9r6rk+SMtRb6wgzitTv5oWBCrsribwdMR7kGxVbuy01FEfIw
         zWps1z5lp9KqGPQysCltLKEHPfOuXl/r5zfcV3Z5BAgjHI5DFudIo9xKQWnaKWKUTyq1
         7U8XvriFUuToj9oiYBqK2GldleGu91Lgo+FLPwtASmsFvu+HsVxnIIB1Z0XmkGEM4oN1
         2UvZlalsLxpDwQ8S9JCsthCJlaKfWhrM8p42y+wd1epfM07dErMu+5R9Si2Rhq/jo7Ub
         RTNyl4FlXRWpi3UwAZUfwz2WxgjCABptazkjcI9/5FqO5LXYjTnZRM+5OLrb1kIG+xLx
         98XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207539;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUCJfRpYrXa3hmennCAGY+YEYiHIHFS8VjWjYrfABl8=;
        b=6j8GCaOoXM01Dzot+m/l3lozCnS0X85RPK1wopAHvhucmU1K26fbRykJVJ254Ty4rp
         EL+endk+Gjf6kWt74OYlGst9oMdY5UlD/9yUytcxsz5PVdXB9H9UeK/o3RlyLwdyWVyD
         v4TYj0Kh3Y7mbawHeFK8j8DgUrgqqs+JXrJlwmu/1rdqvvGN2Io+tTAf17J8JWhfBKub
         03Bejc2B/+OiVg9jUa8Ujq/undTk9BrwZdj7a0pk8nSBb2iQgnOdY2ZNOxczQFGGzzpM
         OTwcdU1/5UyykwswgNr4W14Q1thg9nf+9n2ve8U2y/zVnDalp2irqFUQJ8Pgi5gDlqcS
         WVXw==
X-Gm-Message-State: AO0yUKX74uCHlFe0vi23RLShKY3aVflnXfE4ENyIdiDSZLWQUaq2APwd
	URG47LAuHReDUMyYGh4hPpg=
X-Google-Smtp-Source: AK7set+Ulo8gRwDEUDvXMRkcCF1ujJVtm0HZBUCFKEzw+2d7ysEPC8zYBkw1bLIGRVeh5T6KX5n0iQ==
X-Received: by 2002:a5d:650d:0:b0:2c5:48bd:d494 with SMTP id x13-20020a5d650d000000b002c548bdd494mr11405626wru.29.1678207539667;
        Tue, 07 Mar 2023 08:45:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b9cd15c7-99d1-ff8b-03e5-e77241b13346@xen.org>
Date: Tue, 7 Mar 2023 16:45:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
 <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
Organization: Xen Project
In-Reply-To: <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/03/2023 16:39, Paul Durrant wrote:
> On 07/03/2023 16:33, David Woodhouse wrote:
>> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> In fact I think we want to only serialize the contents of the domain's
>>> path in /local/domain/${domid} and leave the rest to be recreated? Will
>>> defer to Paul for that.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>
>> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
>> mentioned migration in the cover letter — this much is working fine,
>> but it's the PV back ends that don't yet work.
>>
>> I'd quite like to merge the basic serialization/deserialization of
>> XenStore itself, with the unit tests.
> 
> The patch is basically ok, I just think the serialization should be 
> limited to the guest nodes... filtering out those not owned by xen_domid 
> would probably work for that.
> 
>>
>> Perhaps we can also set TYPE_XEN_DEVICE or TYPE_XEN_BLOCK_DEVICE to be
>> unmigratable? Ideally I think we want TYPE_XEN_DEVICE to be
>> unmigratable by default *unless* the specific device class (including
>> net and other as we port them from XenLegacyDevice) says otherwise.
>>
> 
> Yes, that sounds like a good idea.
> 
>> Is there a way to do that?
> 
> Not something I've looked into. I'll go look now.
> 

Maybe calling migrate_add_blocker() in the realize method is the right 
way to achieve this?

   Paul


