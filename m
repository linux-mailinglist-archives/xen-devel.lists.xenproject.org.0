Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF56238706A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 05:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128579.241371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liqsE-0006GU-FE; Tue, 18 May 2021 03:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128579.241371; Tue, 18 May 2021 03:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liqsE-0006DW-BZ; Tue, 18 May 2021 03:58:26 +0000
Received: by outflank-mailman (input) for mailman id 128579;
 Tue, 18 May 2021 03:58:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k696=KN=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1liqsC-0006DQ-KG
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 03:58:24 +0000
Received: from mail-oi1-x22d.google.com (unknown [2607:f8b0:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a30a1820-66a7-4c1b-a7b5-cf6f638c39e7;
 Tue, 18 May 2021 03:58:23 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u144so8514437oie.6
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 20:58:23 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id e22sm3578062otl.74.2021.05.17.20.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 20:58:22 -0700 (PDT)
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
X-Inumbo-ID: a30a1820-66a7-4c1b-a7b5-cf6f638c39e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aFBMoqSfZ2tjkO3rtPY9w47poNJ9sXu+3W96WXkUC0s=;
        b=nsno12JfrqerkfpE8sQT+RQdrmQOKRgo5QtWNSMgtRUp4ywL9YW3i7Hfiim7GLZJhu
         sCjV5k1ftysZLQCwTvzbw1prKDsG7YoQXmgTkS8w/xS59D1WvBEcNpr0X8zkcJX0ssJe
         wExgGr+wNi5tLg2EUzEBPkv1os6yIkOq0s1xEgWfXAG0SdfGFBGGIDiSvldQvSPO2zr1
         W8gdpgbySZT+v5ceJaOizp5O00cQqDf8M3vlahkVBdyLEHC4G0juZ/jYN00oriHQdy6D
         iW7iRAGWEV4ol6TVty70t3XsTVGxZfJSbQCcUREdGx4C4Zo1B2rjOSDBea+jd9msVOa4
         GSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aFBMoqSfZ2tjkO3rtPY9w47poNJ9sXu+3W96WXkUC0s=;
        b=DzdCShWjXQn9htW0XU3+DtKwm5lJLvzxTfouT4LbVLNNoOsUwytyiUMKD6/CAPcQq4
         ZnYPyAF3RPmrUu7Eukl5glChOpo4R3IjwZ5OJy1nZhyjieLTekceVfPqeKqaowrqYUKC
         F8mDXJA4jbRxu7Rt/rxpSdWcd/aQiQxar/O5RN1PWTNa1CXPl6R8yB7MmuMeRMAnP402
         tlMyzKazIokYHDE9VtegcdqMGuA46QZg9wjYSrWLPU+0nstAT4WbD41fJIv9Nze9IzjC
         KrmwGZNW/fhl0FMjvq9T0wW/I809z3/tyo3/c3qSRNLJdDEWuA+zL31E++aewOSFEmbn
         wFLQ==
X-Gm-Message-State: AOAM530fXv7+UsiQ831cyLCPvHtRtGssLUaEcSddePBDHog1NFXEKVVx
	mcVLvlHkmxINsP4pEWBNX0sGHBaFB6oH2Q==
X-Google-Smtp-Source: ABdhPJw7VedbAGRfDlbn81vO0pJOcGWUFfarg28s2qv+sJ0ZXg2pZfTanVK9BSeKm7xUHY5KAZe9NQ==
X-Received: by 2002:a05:6808:4d3:: with SMTP id a19mr1914349oie.40.1621310302845;
        Mon, 17 May 2021 20:58:22 -0700 (PDT)
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
Message-ID: <9b231486-bdf8-d6a7-c9c6-126d5bc207f8@gmail.com>
Date: Mon, 17 May 2021 21:58:43 -0600
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
Can you elaborate? I tested all defconfigs with and without grant tables

enabled on x86 and ARM and they all build fine.

>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ... since the potential of breaking the build is obvious enough,
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan


Thanks,

Connor


