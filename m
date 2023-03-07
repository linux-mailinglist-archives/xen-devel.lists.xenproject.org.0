Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736336ADD0A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507298.780621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVGh-000055-7z; Tue, 07 Mar 2023 11:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507298.780621; Tue, 07 Mar 2023 11:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVGh-0008Uk-5L; Tue, 07 Mar 2023 11:14:07 +0000
Received: by outflank-mailman (input) for mailman id 507298;
 Tue, 07 Mar 2023 11:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZVGf-0008Ue-Fb
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 11:14:05 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a70015a-bcd9-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 12:14:03 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id bw19so11695761wrb.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 03:14:02 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adfea8a000000b002c7e1a39adcsm12438895wrm.23.2023.03.07.03.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:14:01 -0800 (PST)
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
X-Inumbo-ID: 2a70015a-bcd9-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678187642;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UfWWeab53Q03jZDtXQ+5Yh0vqFB94sHitv/tkqXpLU=;
        b=dv8vTJjwqtTjXs3u3XBxY8Imbr19fxW4hvcJCbEr4fv5qf7FHyVcArSx1WAAKIrnZg
         RwlJVPSOgwspaKLI7tNJFUrfsISnDvmrnLjDJgjloTs9Rm5qFLKtJ7f3AwfjOPcz/n24
         RqsOoNYbwCEk5IOL3AIBrcU8FCwnZiVDyfA8HcoDQI1KAWFIejtD38v57p/sDfksIeJj
         Zl/JVsxC13Jcwxyk6ApSHFlvh60IgB5pO3QIrsS+z3H1GhHj3/GwB5yr8rD8QylF0khM
         9O/yRVLU2QTK9POMEMh174whFAcf7knPFxr0d+eFD60K3LnmO/D0msrzdbFLd9ya8MPD
         iFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187642;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UfWWeab53Q03jZDtXQ+5Yh0vqFB94sHitv/tkqXpLU=;
        b=mLhIHATCRF6Pg/wfnufQzCIv2eDXUjdK7XY4aCsWvfT0VNwGJhyWcR5bt9RtPErTjI
         3Z74TAlHnwYb4bwkEkADXUIqb9WgkzP46LQtEbQ/9bvoE/EfBOQBb1U7Z62nXqsISTS6
         yVkYVUMsFcDO7iRTerYttqMOjg2kKPGdnW3K0UN8q08MfvaxPk42HrEwau/SV22BWPP1
         yOD2pX2JvbunaJMh6bW77cZlo2CHtYRmRUhy5ydKibi/fbEkOZnI6vMFORTkmXQALdZD
         kYwAnvS5pfEzLCGxuBs0VAjhFP9kSspeZ7N6XNMvBGtzIapMuPOLu/tUn04m8d/1sXLd
         Y6ng==
X-Gm-Message-State: AO0yUKX3wMR1CkeI9XHJu8EZJ65yJRD/+zTDTkYbtk7z3CuVW6+bCggX
	kr94cWMHQ4lyUCWrKsVdSZs=
X-Google-Smtp-Source: AK7set9YJQPgeJ4SYTMx8cCML/BVjgNf7J5REgSM4A5jb0VULVqcnJA3hCJjLkMEK5Knls1hRwlMjQ==
X-Received: by 2002:a5d:43d0:0:b0:2ca:8ae5:ea2 with SMTP id v16-20020a5d43d0000000b002ca8ae50ea2mr7831817wrr.40.1678187642054;
        Tue, 07 Mar 2023 03:14:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5d2f10e0-cfa2-38f8-2d4f-0ef1926d9054@xen.org>
Date: Tue, 7 Mar 2023 11:14:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 02/25] hw/xen: Add basic XenStore tree walk and
 write/read/directory support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-3-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is a fairly simple implementation of a copy-on-write tree.
> 
> The node walk function starts off at the root, with 'inplace == true'.
> If it ever encounters a node with a refcount greater than one (including
> the root node), then that node is shared with other trees, and cannot
> be modified in place, so the inplace flag is cleared and we copy on
> write from there on down.
> 
> Xenstore write has 'mkdir -p' semantics and will create the intermediate
> nodes if they don't already exist, so in that case we flip the inplace
> flag back to true as as populated the newly-created nodes.

Something has gone wrong with the comment there... 'as we populate' perhaps?

> 
> We put a copy of the absolute path into the buffer in the struct walk_op,
> with *two* NUL terminators at the end. As xs_node_walk() goes down the
> tree, it replaces the next '/' separator with a NUL so that it can use
> the 'child name' in place. The next recursion down then puts the '/'
> back and repeats the exercise for the next path element... if it doesn't
> hit that *second* NUL termination which indicates the true end of the
> path.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 527 +++++++++++++++++++++++++++++++++++-
>   tests/unit/meson.build      |   1 +
>   tests/unit/test-xs-node.c   | 197 ++++++++++++++
>   3 files changed, 718 insertions(+), 7 deletions(-)
>   create mode 100644 tests/unit/test-xs-node.c
> 

With the comment fixed...

Reviewed-by: Paul Durrant <paul@xen.org>


