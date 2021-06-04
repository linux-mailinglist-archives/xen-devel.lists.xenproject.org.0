Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C139B004
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 03:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136623.253236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loyxs-0000Ij-DC; Fri, 04 Jun 2021 01:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136623.253236; Fri, 04 Jun 2021 01:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loyxs-0000Fz-A7; Fri, 04 Jun 2021 01:49:36 +0000
Received: by outflank-mailman (input) for mailman id 136623;
 Fri, 04 Jun 2021 01:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjsn=K6=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loyxq-0000Ft-Ue
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 01:49:34 +0000
Received: from mail-ot1-x32f.google.com (unknown [2607:f8b0:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a52cb18b-cc8d-4560-a140-ab594ebd5ba6;
 Fri, 04 Jun 2021 01:49:34 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so7664916otk.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 18:49:34 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id i9sm151710oog.17.2021.06.03.18.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 18:49:33 -0700 (PDT)
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
X-Inumbo-ID: a52cb18b-cc8d-4560-a140-ab594ebd5ba6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cnn1WIVeIkKDuZit5//DlNFEUDGCm+dDJ+Nj7pdKMb4=;
        b=Gan7PgMouXZ0akfuXQ7Nq5K2gy+hIgs2Ks39ahncwUjCrzIvPEtwsr51Wjr0TkztP+
         Dd5xt243YLNIhxcp48StqLUak1Cr6rfOjBjbVVUZivi6FNLT/NBBtMH30arVn0ESwHad
         t9hQXDA1teNuVNg33JVS/6eQhZuKmVqj38EHM7E8nDBHpwmAoMIpGPVFSCt7MsiCydSg
         p6cuN1YjGOzEJKNZv7fn/AHgpZXucYpivP0bU4QdYtmqmGhoO9vo9qFYTld5/p8sLNya
         KsRxJoWGzAckzpc8rmPsrO3c+olV0/2m5cy+AfhBm4dMZh18A4r71PP/YN8hLnpdYvLh
         8vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cnn1WIVeIkKDuZit5//DlNFEUDGCm+dDJ+Nj7pdKMb4=;
        b=M4FX9FsP9HPA+5KGqQ7R/wmZ4ao3N9NfldlMFS5FjvVhDTg2AOLBFm4i9PlE9ovj4J
         MjRPPcjRHtSmiwO2HIaLGV9XfloY4so9GlpnS2h+FdZKQbAZMa7KlstrZbjXSawOqKOi
         uXRCHQR0yZQ4mDubRerPb8g1bayc5t7A9aT6vfbMqGwSARXLKy+FUTxT9w5ybujg+61U
         93p5bCCjzJsS0+kC67Vd326Ax0w9+tNG+hOj1v4OJiJqS1Nkm0MhgEkY27eqJmTDedIL
         C1db9KHH5PTjn71E+dycGiubjWfM4sE6iyfSLaQGaCwW6uP24lfLuSZRVVI3C1UdP2+D
         iPGw==
X-Gm-Message-State: AOAM533CW0BPODvCypwWYfRL6Ee53itLlp4EQMnIhR1SStGszXMA7W8+
	7pSsfw70TIWLGJIVkM7jHqY=
X-Google-Smtp-Source: ABdhPJygi+Mu0NIWldqRI0E1lCIvefrKFp/C4Mrm2lkkT8OQabChnw7Q/GWU3Vn3FwIWmrQryjKrdg==
X-Received: by 2002:a9d:7987:: with SMTP id h7mr1820146otm.70.1622771374010;
        Thu, 03 Jun 2021 18:49:34 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1622676439.git.connojdavis@gmail.com>
 <d2d19b62bd2a570db97f2940e6152bf93dc01632.1622676439.git.connojdavis@gmail.com>
 <CAKmqyKO0JQVOxfrO0jk_-4eBBZSkcQm1-pMhd2xzXaE55usXWQ@mail.gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <4b674135-fb25-689c-dbac-8a8f006e3f58@gmail.com>
Date: Thu, 3 Jun 2021 19:49:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO0JQVOxfrO0jk_-4eBBZSkcQm1-pMhd2xzXaE55usXWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/3/21 5:27 PM, Alistair Francis wrote:
> On Thu, Jun 3, 2021 at 9:38 AM Connor Davis <connojdavis@gmail.com> wrote:
>> Defaulting to yes only for X86 and ARM reduces the requirements
>> for a minimal build when porting new architectures.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
Thanks, added

Connor

