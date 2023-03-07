Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD36AE024
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507370.780772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXAw-0004L2-72; Tue, 07 Mar 2023 13:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507370.780772; Tue, 07 Mar 2023 13:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXAw-0004J1-3T; Tue, 07 Mar 2023 13:16:18 +0000
Received: by outflank-mailman (input) for mailman id 507370;
 Tue, 07 Mar 2023 13:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZXAv-0004Iu-Bt
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:16:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d2a1c43-bcea-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 14:16:15 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so10369248wmb.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:16:15 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a7bc8c5000000b003e896d953a8sm16951714wml.17.2023.03.07.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:16:14 -0800 (PST)
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
X-Inumbo-ID: 3d2a1c43-bcea-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678194975;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFum2acnD9qYIwVa4tN5V4rmj4o+XnW3TVVaSWehf/Q=;
        b=SZwu487hPaxa1Ml6JrIRmk1SY/X8d1XEVA1jvsk+qGJqyzpAGGs9uOKiVrUZep6KgC
         9joBlBXOePTp4l1Ul9zRJ6OScp+nUDimFrAcgK1umvqbMRDW8iU/QdVo7vT11uqrxmgW
         FZKOgl0HA9zzzg7ldT8D+wDOwqhqj6idTeX8casyH7OhHPnypet9OLHo+cvzxHhXS2Al
         QeUHwUq7uYT1aChO4csj3cWZsYbeVmILH8HI0OmGqxBgndZvD7yfBqWZrMzr4LHicCak
         3qOnEMyM1QlEnqhbuI8jS1I6v2elutXpeNlz1BIOVOBPUH+0meavW0W+Bb7Cx6EyzA4G
         70qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194975;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFum2acnD9qYIwVa4tN5V4rmj4o+XnW3TVVaSWehf/Q=;
        b=n6+c7aaDGvNRKUfxn7/Mxs8H7/UDqIJSObkuTBgjtt6gzdEWWtXOzSKwfco4ax3BcN
         wEEAa7rrZs08S69jQrAlC+0Ns8WiqZ8UMq02N059SxxnZgmgxMbC+731NKu+EPI6d+/h
         8lVPYk+ClFYczcTJuz9Zvg6AuiNTtc/9zK7v6lBpxpuub515CRHBR7Uv5ss3UuZAS4Mh
         G+z95QKLgVZw3n6UTbETkND7wiV4Th2QGv2a0Uu4Pp5ND1elnC3obXQIj86KrFIQmwgu
         G/zXF5Nhhy+Hh7vWkZge+YmnA28Tl1NcrCzGaEf4bX5oktdrsoKRIRGGCu9dXyi8n1H5
         1Vig==
X-Gm-Message-State: AO0yUKXOzzdOgb6t4Gc/FI5AqyYSU0wrpkrFNxR88ijFZzF4Ys0z9sXF
	bGmJdPOL7R7W5xl96Jl5pzBucfxovC2fjw==
X-Google-Smtp-Source: AK7set/3FVQWrAPQv/TXVvlTUtHXEfMHwVBFmnk+0VpesCeDk1kQ6VPtR483XrvlOZgc5jZ/Tz2uWA==
X-Received: by 2002:a05:600c:1c05:b0:3eb:2e32:72c3 with SMTP id j5-20020a05600c1c0500b003eb2e3272c3mr13181892wms.22.1678194974851;
        Tue, 07 Mar 2023 05:16:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <58ab28a8-ac77-889f-fb5a-aec140811889@xen.org>
Date: Tue, 7 Mar 2023 13:16:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 04/25] hw/xen: Implement XenStore transactions
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Given that the whole thing supported copy on write from the beginning,
> transactions end up being fairly simple. On starting a transaction, just
> take a ref of the existing root; swap it back in on a successful commit.
> 
> The main tree has a transaction ID too, and we keep a record of the last
> transaction ID given out. if the main tree is ever modified when it isn't
> the latest, it gets a new transaction ID.
> 
> A commit can only succeed if the main tree hasn't moved on since it was
> forked. Strictly speaking, the XenStore protocol allows a transaction to
> succeed as long as nothing *it* read or wrote has changed in the interim,
> but no implementations do that; *any* change is sufficient to abort a
> transaction.
> 
> This does not yet fire watches on the changed nodes on a commit. That bit
> is more fun and will come in a follow-on commit.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 150 ++++++++++++++++++++++++++++++++++--
>   tests/unit/test-xs-node.c   | 118 ++++++++++++++++++++++++++++
>   2 files changed, 262 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


