Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1857304D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366284.597004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXUN-0004OU-AP; Wed, 13 Jul 2022 08:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366284.597004; Wed, 13 Jul 2022 08:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXUN-0004MC-79; Wed, 13 Jul 2022 08:12:55 +0000
Received: by outflank-mailman (input) for mailman id 366284;
 Wed, 13 Jul 2022 08:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Vcv=XS=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oBXUM-0004M6-Ib
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 08:12:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a52da1-0283-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 10:12:52 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so742493wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jul 2022 01:12:52 -0700 (PDT)
Received: from [10.139.203.5] ([54.239.6.190])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1c2104000000b00397402ae674sm1414763wmh.11.2022.07.13.01.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 01:12:51 -0700 (PDT)
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
X-Inumbo-ID: 97a52da1-0283-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0uRDex1sPZB8+kY6pRwjfFra2BxS6+wEYBs3OQaRvL4=;
        b=czMyWCpWUG776U3vRaa14UMGbkTFNvyvooqLdkooVASOb+MgSYYymDK+xBJAr1+Kfk
         xKAE/nB6N3vhxDMiOOVIzVNBchQ1IMj6ZVqGzYxjgdHvxuhzZFxdfThrGD55Ha0xag5n
         xraVDVz10BAO8ieSsWuBun9KxgsaU3Nclb9mh/erBve+sCIF7oC8UXWO64NkMkNlviTt
         A586Ch9/rYorCbYsqZHCnXi9WzCCc2cECYaHLoyf6dNA5GHJtVhPkmcIFwO0ygEm60Ni
         NseVUc9g6bW49kel1rQibobW38H9GudctoaUDFzGkrAs3mDQWobIW6dwA2R3nC9e2FfP
         8uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0uRDex1sPZB8+kY6pRwjfFra2BxS6+wEYBs3OQaRvL4=;
        b=QgMY32vxd+AI21TqZANUpCBZYtuUdwppobeNkq6pbQ+aRsXZMSyOxbhl3RUpBUu63W
         m9LXI1+TGh/RBtV4RR2zH4bc5vc2TAf+J6tBjWFncJF901NZf7Jxep0uA+QzVDOahv0k
         +8t0GulCpCTKIrizk9SjYkwZMs+uDVcO1qulCfKTzIDoh4sMi1Ax7XvGzrGBzJP9pkJh
         aAFoDFvJMLxodt03pxleu7uMSvDbOTU9VPRuPIg093CDviJ3XkqMO57I66D+OL0/Zzw3
         4O/ZTm+4bFOBmZvGpUSqWyulKDE341DMGdehQvNHb6Nlt89IhfWFKvk4vw4kcr8I4uNn
         4Jzg==
X-Gm-Message-State: AJIora/mQbK9+OSbWN2CR13VT1YopXI9lTZUhS6Ou7vEs2y8PMfJM5rw
	MLByup4LhARVoCCZUerIxHM=
X-Google-Smtp-Source: AGRyM1t2/g2aQx4hW4BD8FkYMRkeZOzwdnkao9wmFSElnULULsGShBJ93EfxE/7iVcV/SZaP2yWAhw==
X-Received: by 2002:a05:600c:42d3:b0:3a2:e7b8:8430 with SMTP id j19-20020a05600c42d300b003a2e7b88430mr2281220wme.42.1657699972267;
        Wed, 13 Jul 2022 01:12:52 -0700 (PDT)
Message-ID: <016536af-2ab8-b557-abe6-1c8f2b6d7e91@gmail.com>
Date: Wed, 13 Jul 2022 10:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen/netback: handle empty rx queue in
 xenvif_rx_next_skb()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20220713074823.5679-1-jgross@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220713074823.5679-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2022 09:48, Juergen Gross wrote:
> xenvif_rx_next_skb() is expecting the rx queue not being empty, but
> in case the loop in xenvif_rx_action() is doing multiple iterations,
> the availability of another skb in the rx queue is not being checked.
> 
> This can lead to crashes:
> 
> [40072.537261] BUG: unable to handle kernel NULL pointer dereference at 0000000000000080
> [40072.537407] IP: xenvif_rx_skb+0x23/0x590 [xen_netback]
> [40072.537534] PGD 0 P4D 0
> [40072.537644] Oops: 0000 [#1] SMP NOPTI
> [40072.537749] CPU: 0 PID: 12505 Comm: v1-c40247-q2-gu Not tainted 4.12.14-122.121-default #1 SLE12-SP5
> [40072.537867] Hardware name: HP ProLiant DL580 Gen9/ProLiant DL580 Gen9, BIOS U17 11/23/2021
> [40072.537999] task: ffff880433b38100 task.stack: ffffc90043d40000
> [40072.538112] RIP: e030:xenvif_rx_skb+0x23/0x590 [xen_netback]
> [40072.538217] RSP: e02b:ffffc90043d43de0 EFLAGS: 00010246
> [40072.538319] RAX: 0000000000000000 RBX: ffffc90043cd7cd0 RCX: 00000000000000f7
> [40072.538430] RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffc90043d43df8
> [40072.538531] RBP: 000000000000003f R08: 000077ff80000000 R09: 0000000000000008
> [40072.538644] R10: 0000000000007ff0 R11: 00000000000008f6 R12: ffffc90043ce2708
> [40072.538745] R13: 0000000000000000 R14: ffffc90043d43ed0 R15: ffff88043ea748c0
> [40072.538861] FS: 0000000000000000(0000) GS:ffff880484600000(0000) knlGS:0000000000000000
> [40072.538988] CS: e033 DS: 0000 ES: 0000 CR0: 0000000080050033
> [40072.539088] CR2: 0000000000000080 CR3: 0000000407ac8000 CR4: 0000000000040660
> [40072.539211] Call Trace:
> [40072.539319] xenvif_rx_action+0x71/0x90 [xen_netback]
> [40072.539429] xenvif_kthread_guest_rx+0x14a/0x29c [xen_netback]
> 
> Fix that by stopping the loop in case the rx queue becomes empty.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>


