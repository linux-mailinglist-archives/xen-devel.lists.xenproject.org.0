Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E4A6AE155
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507407.780851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXjG-0004i9-Ql; Tue, 07 Mar 2023 13:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507407.780851; Tue, 07 Mar 2023 13:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXjG-0004g8-Nv; Tue, 07 Mar 2023 13:51:46 +0000
Received: by outflank-mailman (input) for mailman id 507407;
 Tue, 07 Mar 2023 13:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZXjE-0004fq-G7
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:51:44 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30f9a67d-bcef-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 14:51:42 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id az36so7818568wmb.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:51:42 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm12863551wrr.58.2023.03.07.05.51.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:51:41 -0800 (PST)
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
X-Inumbo-ID: 30f9a67d-bcef-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678197102;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VSyVFg7J7TubDf3OOWlQoBsaoQ/Li0UBTheHqmICqNA=;
        b=Yes0vRSLKmkYu2xYNSDv2IqSJSBxEX2Dv743hcHCJt30inGRRXHHmM6HQ8+cKuy0cR
         f+s3FwGdavOc/bA8QtTaNd9oWCFSUcrbklAKs5LiIPd0GC3gXRc5ffLVy2Rhkip+ZiRp
         fByJxbzSib6BoagBys0tiwUOjj4aYE6O7vO9bHDsX1XWTxCH3EpNuZ45du42L78G+sbk
         j5Ivzkr+8FqE91wVz3aYReKGsKQSZHVUyDLloYzSD8jlfOdeKb2/JbTI5WOlSaFBaDl8
         G5XKsn8Ao+73ayW/25EBafiVhkgFlRKKG21uDNg4oNjC+zS7UCxS+Z7ye6heh91ZSswp
         5pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678197102;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSyVFg7J7TubDf3OOWlQoBsaoQ/Li0UBTheHqmICqNA=;
        b=k+29Q5vDTEzRq1bjFFJRlO8zSn8BC262l78yPTQ89UQ/hGd2Iwot4epxR3bCCFkEWS
         Xr2F+0sjydauWtQDCTT4Nitd0n7JsjiU1aigayd/x7l9XL/lmc+tg9ukFTHpC4oHcZ4I
         WuEDVpZ+YmrPcde7jhUxcND9MTMP/RL51CqO0gIdq3SQXzROe4SYKKjNdGx6jhI4auO1
         REuyPa8/cY4EGnrBdw0i0itpuLe2fh0D+/Cx+pZ80MpEc4QVFGkrJYTO3Re+ehq6U37q
         t+SZM18/zDmCSOAInwi1r3i7pJJ0LQ0YOb3UuoVuGw0F7HK0RS9hz/qDkP53YDXUDXRt
         CkYg==
X-Gm-Message-State: AO0yUKVu6Mv1zSxGvKkY2g+rjcV9BJMVJR9cXQZx++dvMkCN+83Ne8Nb
	7eT0F6qfUzW+ZZA9KwwK3YCue9NAvoQWNA==
X-Google-Smtp-Source: AK7set+vSQPebbqfpJXmFa42fmhp55jhJt3npAzNkm26f/rohKHFKR4nk0rtKnddvTPOXW2srnEg8g==
X-Received: by 2002:a05:600c:4748:b0:3df:e4b4:de69 with SMTP id w8-20020a05600c474800b003dfe4b4de69mr12646893wmo.27.1678197101950;
        Tue, 07 Mar 2023 05:51:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ac35d26a-f07b-6b49-fb61-2b858782f99e@xen.org>
Date: Tue, 7 Mar 2023 13:51:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
Reply-To: paul@xen.org
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In fact I think we want to only serialize the contents of the domain's
> path in /local/domain/${domid} and leave the rest to be recreated? Will
> defer to Paul for that.
> 

Yes. Assuming backends have properly implemented save/restore code then 
they should be able to re-create their xenstore content. Also, it's 
generally convenient for them to start back in 'InitWait' state the 
drive their state machine back to 'Connected' so that grant refs can be 
mapped, event channels bound etc. along the way.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c  |  25 +-
>   hw/i386/kvm/xenstore_impl.c | 574 +++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xenstore_impl.h |   5 +
>   tests/unit/test-xs-node.c   | 236 ++++++++++++++-
>   4 files changed, 824 insertions(+), 16 deletions(-)

The code LGTM though; just need to limit the saved tree to 
'/local/domain/<domid>'

   Paul

