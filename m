Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429C7B0FAB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609185.948110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleKi-00032S-Kv; Wed, 27 Sep 2023 23:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609185.948110; Wed, 27 Sep 2023 23:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleKi-00030I-IG; Wed, 27 Sep 2023 23:52:44 +0000
Received: by outflank-mailman (input) for mailman id 609185;
 Wed, 27 Sep 2023 23:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiVY=FL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qleKh-0002zs-GQ
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:52:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b814ef-5d90-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 01:52:42 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-405361bba99so120339875e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Sep 2023 16:52:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-62-212.as13285.net. [92.12.62.212])
 by smtp.gmail.com with ESMTPSA id
 d29-20020adfa41d000000b003197869bcd7sm13021847wra.13.2023.09.27.16.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 16:52:41 -0700 (PDT)
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
X-Inumbo-ID: f2b814ef-5d90-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695858762; x=1696463562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K74mjmEvgSGZBxH98NSZ2fJL7O7MrHJ5pRZ+4flV+hI=;
        b=cpsu8aJgK5CsokaPgGox80wAaCU74Mll4JjqNg58mFV4OUbKlp9XoUWg0rrM2zzgD2
         8lmozD0S0jjYRBJpTd9fQFMGUTW3GEM+f7+ZvXmyS6vuZRY+djkHFoZkNhGTJpL0ERTl
         oESyO9W1wKa6yA1gUULe0eZTyNZ1GFu/kTX+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695858762; x=1696463562;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K74mjmEvgSGZBxH98NSZ2fJL7O7MrHJ5pRZ+4flV+hI=;
        b=jKqdSE3ImH1urlgkvAI89oZ32v87ee075LIQlFWKDrcb3jvFwwWS5e9k9+0wXbCGb/
         nVV1s9Q2rwti9NPLawwvjCOeVJL17BgN3sEFuqDc0jb2YVC/pd5ZBNMsjEtgDyHOcf0k
         rlMDzdHJ7JPp284fblxQWpWQO9rCBIHCfjzgND/2+KPE+gFQtVP8mXBiOg1p4OU7IZeD
         X7EtiyrdUPD4X3446425UXdHLXT1FGTC36GNjdeGdWcm4Y4m15pZH3gnkJ5oq+HkPso7
         myZeiZv1+QYzSWPNKK5sa0ArVlp2EmsbxRRxwbgXf2NMj5rPkEOBZdGa6p5wRfOkV3P/
         a7Cw==
X-Gm-Message-State: AOJu0YyQKXV/wcOS7xUhhAgp9Ae50PF2ijxy6GSV8vOVS9z4sTlsordF
	nlm5K8dPMnLnS6JQG7gklJ1gNQ==
X-Google-Smtp-Source: AGHT+IHN6/ZlARfR3fPMWQum55Zi9m6EL9BZdMQuVrcfMH7L3m05JV2KD/CqiWqTQNAZR/iM0JYu0Q==
X-Received: by 2002:adf:ec05:0:b0:323:1df0:c039 with SMTP id x5-20020adfec05000000b003231df0c039mr2901417wrn.56.1695858762022;
        Wed, 27 Sep 2023 16:52:42 -0700 (PDT)
Message-ID: <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
Date: Thu, 28 Sep 2023 00:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/09/2023 12:04 am, Stefano Stabellini wrote:
> On Mon, 25 Sep 2023, Henry Wang wrote:
>> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
>>
>> https://marc.info/?l=xen-devel&m=168312468808977
>>
>> https://marc.info/?l=xen-devel&m=168312687610283
> For this issue I suggest to go with this fix unless someone can produce
> a better fix before RC2. I don't think we should cut RC2 with this issue
> unsolved.
>
> ---
> [PATCH] xenstored: reset domain connection before XENSTORE_CONNECTED
>
> From: Julien Grall <julien@xen.org>
>
> xenstored will set interface->connection to XENSTORE_CONNECTED before
> finalizing the connection which can cause initialization errors on the
> guest side. Make sure to call domain_conn_reset(domain) before setting
> XENSTORE_CONNECTED.
>
> Signed-off-by: Julien Grall <julien@xen.org>
> [stefano: rebase, commit message]
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

No - this hasn't got any better at fixing the problem than the last time
it failed to fix the problem.

You cannot have 3 entities in parallel fight for control in a 2-way
communication channel.

Failure to understand this is what created the problem to begin with.

You took an existing ABI from oxenstored, and implemented it
incompatibly in other entities, had init-dom0less corrupt a shared comms
buffer that it isn't the producer or consumer of, and added bug in Linux
because you didn't write down the behaviour you wanted, let alone the
behaviour you actually provided.

Stop tinkering in the hope that it hides the problem.  You're only
making it harder to fix properly.

Tell me, when was the last time this failed...

~Andrew

