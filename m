Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F8386DDF
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 01:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128536.241302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1limvs-00007X-37; Mon, 17 May 2021 23:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128536.241302; Mon, 17 May 2021 23:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1limvr-0008WF-Vc; Mon, 17 May 2021 23:45:55 +0000
Received: by outflank-mailman (input) for mailman id 128536;
 Mon, 17 May 2021 23:45:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1limvq-0008W9-2G
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 23:45:54 +0000
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 341beecd-4ff2-4ed8-99c6-76f2ec0071a0;
 Mon, 17 May 2021 23:45:53 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id b25so8142005oic.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 16:45:53 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l11sm3289900ooq.44.2021.05.17.16.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 16:45:51 -0700 (PDT)
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
X-Inumbo-ID: 341beecd-4ff2-4ed8-99c6-76f2ec0071a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0Td9hzMwh0l7nVPyPWJs5h3Oib92yw47wCHz+OsqDpw=;
        b=T+6mAgbkl+b8IFSlSCGNMM2mJ/c/iaQFGhfg6fP+HM61EYma0ePPNTI/OB+njrnd2a
         +fvSUhqhKPwSDUPToS4Nu9YJUnjUiKhkNlVQP8+3glRYY2O6c+9w1ATKIlxdrBXO1G16
         C4RRJmV8vh6FfMiCtQhu585ep47HhFEtBUM11aueYYPhvvjI94zFl464SdsaSlKJiCog
         D3ht30rZgSEMEwt7VCjCHLb7plwbB8jlALbul8r7QQTA+0xHbaMyhcx0wlexU1BguHza
         Y3fI60035uurmYTAM6jrUtunD0KccuF3vFux8W6qeqUFmX0BgLZvHFMybZvVz8bGEa9I
         BXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0Td9hzMwh0l7nVPyPWJs5h3Oib92yw47wCHz+OsqDpw=;
        b=lRxc0FwUcKt+u60E4hx854hV9+FyH/0KKllgPxH8EE1OT9nfNkA9hVTAvisoLAtqp1
         7Vz4Jp3EW1tWUE2r/rbdR4txDgM4LKNq5QcS2AGbLGwQcoXCbcIkfWtobVtdVrBjIkHy
         w/TzDhcPaRhNCOdg3GRa1CvfdewN3OKgolpr/q5eDGkjKZt+t8yJmByvFZz/6gEsNejF
         ZeiuvDncRgFLIe/8eJH8CEEBCEB3f0jqyU62BRs8NBjMbGbbmyLNpsagWajyst4Tpji9
         ITlIbH2mScHCsMCHduGEkBBKrFAyIkOp1Dysj7hWaKBH4u63Yriif9ppyU6BXEj3EJER
         9Ang==
X-Gm-Message-State: AOAM530j4QwzeqkoZkOBdQV5yXf6j4tsXyqInGNYqWfQ2FjLji/JBYA5
	Qowi2bRz3g549j9QEQ9WhIhc+MaN/cdV+w==
X-Google-Smtp-Source: ABdhPJzHyDxnUrn7L68qr7XKG/umoQqc5tYC5XKWM9l8HmSbyEg8bbSKHVYxHsr6srMr/fZvEm9EsA==
X-Received: by 2002:aca:c6d7:: with SMTP id w206mr1735235oif.87.1621295152791;
        Mon, 17 May 2021 16:45:52 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] xen: Fix build when !CONFIG_GRANT_TABLE
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <834f7995ae80a3b37b6d508d1c989b4ee391f61b.1621017334.git.connojdavis@gmail.com>
 <b56a1cfd-46ab-c601-883c-73537dfaac92@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <42d16824-0dd2-0aea-e396-62231a71a0e0@gmail.com>
Date: Mon, 17 May 2021 17:46:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b56a1cfd-46ab-c601-883c-73537dfaac92@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/21 5:22 AM, Jan Beulich wrote:
> On 14.05.2021 20:53, Connor Davis wrote:
>> Move struct grant_table; in grant_table.h above
>> ifdef CONFIG_GRANT_TABLE. This fixes the following:
>>
>> /build/xen/include/xen/grant_table.h:84:50: error: 'struct grant_table'
>> declared inside parameter list will not be visible outside of this
>> definition or declaration [-Werror]
>>     84 | static inline int mem_sharing_gref_to_gfn(struct grant_table *gt,
>>        |
> There must be more to this, as e.g. the PV shim does get built with
> !GRANT_TABLE. Nevertheless, ...
>
You are right... you're comment made me realize I had only tested this

with XEN_TARGET_ARCH=riscv64. I will rework this.

>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ... since the potential of breaking the build is obvious enough,
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan


Thanks,

Connor


