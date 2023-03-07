Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993536AE676
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507602.781321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaBW-0005wY-QV; Tue, 07 Mar 2023 16:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507602.781321; Tue, 07 Mar 2023 16:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaBW-0005u9-NQ; Tue, 07 Mar 2023 16:29:06 +0000
Received: by outflank-mailman (input) for mailman id 507602;
 Tue, 07 Mar 2023 16:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaBU-0005tj-OV
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:29:04 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c886c48-bd05-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:29:03 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id j2so12715477wrh.9
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:29:03 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm13295109wrw.116.2023.03.07.08.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:29:03 -0800 (PST)
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
X-Inumbo-ID: 2c886c48-bd05-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206543;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8ddAlTHBUNSR2bNxJW07ioEGpTXoCqR+vwpPP+MbAw=;
        b=jqfLFA4Eo6KW+dzLA5mmFko9S+yhbN343Pj5B74cM5z3miV7pc4udKzMR+7c7t1CxJ
         NcyjUzXsl81EnbHGKnrJjDm/xXczws69lR04kgxH0clbrxAYNOYmN/Pl8/MwGikdoty0
         agymsT/GGuZjPCg5bjqwi2VLyr5w5IadNkbggqXQjXk4mKleQz7zbCLRC6bDN2chaDVF
         m19Z4LlmTA2w7ekPlSIuaciV6SOJ+2sAZTM8pZ3NQJwXz3fN0+/WikqBfhyghQRdKET8
         E4OQPiWX7qMFk5vz0nKXDFBQ9AoFnJ9O4pRtbTnvQJngXkug/Q3NmzpUH15s4Zvw3DOJ
         PMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206543;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8ddAlTHBUNSR2bNxJW07ioEGpTXoCqR+vwpPP+MbAw=;
        b=Alxl1lRksEvkFjOyVjrss4IlO1tVJexupsW2YM27VMN/0LS90i5Brl4DPkWeFdUw4b
         AS7QWv0QDmIlzsya0fUAfelg5T24ufyWRnwMAZdV9YIZNz1pBJ9Ay2o6B1L9cUfJPdG/
         RcdbTvSQbhQd8ZnDUDbB9mUyW7hldx2Dzl1Awg61YYScu92+BYwVH7lbeO4LbLkNfCer
         OZBNPcbtJpC78x4sEPZ34CQzpXA5gTerwATMreR25+9vbr5Gi4FgtEI1sUqVeQPFLBkY
         EZ9XMcq/C/fPfmoDu6RA1iMoA1Dk1gPnglOr3B+mohAuterc2LqXiLghW7HJKFP9EIJZ
         8Wuw==
X-Gm-Message-State: AO0yUKVUP3oPwCmr6AapIrw0Qy2W31DhNtTBkMUaZTfiaibY50vKu9gt
	y2Wbmrt8SvvNK/kMrTL2kzACuprCX2fB4Q==
X-Google-Smtp-Source: AK7set+Uykg24wX57cV5HATWYP9Pi3m1/igUgMzlaXoDtRCqnCQ049TPB17XBWPfdk0NGL4xtLeN5w==
X-Received: by 2002:a5d:5548:0:b0:2c7:2cf4:baff with SMTP id g8-20020a5d5548000000b002c72cf4baffmr10862293wrw.70.1678206543496;
        Tue, 07 Mar 2023 08:29:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8354e562-bbe5-d239-27a8-ed26bf537d5a@xen.org>
Date: Tue, 7 Mar 2023 16:29:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 24/25] hw/xen: Implement soft reset for emulated
 gnttab
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-25-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-25-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is only part of it; we will also need to get the PV back end drivers
> to tear down their own mappings (or do it for them, but they kind of need
> to stop using the pointers too).
> 
> Some more work on the actual PV back ends and xen-bus code is going to be
> needed to really make soft reset and migration fully functional, and this
> part is the basis for that.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c  | 26 ++++++++++++++++++++++++--
>   hw/i386/kvm/xen_gnttab.h  |  1 +
>   target/i386/kvm/xen-emu.c |  5 +++++
>   3 files changed, 30 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


