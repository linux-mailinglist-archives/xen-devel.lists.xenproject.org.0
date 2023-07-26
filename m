Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C27631BE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570226.891833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOajj-0000C3-QZ; Wed, 26 Jul 2023 09:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570226.891833; Wed, 26 Jul 2023 09:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOajj-0000AI-Nm; Wed, 26 Jul 2023 09:23:15 +0000
Received: by outflank-mailman (input) for mailman id 570226;
 Wed, 26 Jul 2023 09:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNwf=DM=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qOaji-0000A4-FN
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:23:14 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b7a164f-2b96-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 11:23:13 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so5070715e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 02:23:13 -0700 (PDT)
Received: from [192.168.24.200] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adfe90c000000b0031758e7ba6dsm11331347wrm.40.2023.07.26.02.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:23:12 -0700 (PDT)
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
X-Inumbo-ID: 0b7a164f-2b96-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690363393; x=1690968193;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFQvuvTA0rApmyYbTz3tv5ZD3yKdHhVxq/4ZpYUd/aI=;
        b=AtnzzCtWg9h1M4tC8McICoStSn5jsjyoy+ew/xxN9mQBvEjNEHl4ER4tog0WNTSZzo
         lnglCuW3q0LPjKsD218sZEoandOW/q3lMtLwl+AsxR77MD1dRSn6X4XsvmWtrVsRzKqx
         HbfPYIBT6TxK3K/jd6jQgve3nBOLC+EBwnaFgWkBW/bEPc9WdxNixXHxIENuQ9+Y0kRV
         tkmfEhQsP1If3YM9jxQa5m8PT5p0Ub6KPO7nxZUQjDOXEjdxwxm8WTXDkSM5RaDye+/0
         2MZnNxRwkbUTt4TxF81R5wSwn6CjJ+KCgdvb+SNVvfYFZPMzLAg7XwyhXJ8AVnP28zIp
         IjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363393; x=1690968193;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFQvuvTA0rApmyYbTz3tv5ZD3yKdHhVxq/4ZpYUd/aI=;
        b=hdbZRRl+mtB28xIdLa3AjNLSxeF2eoOPfp9UdhJD9pEs91swJ9Hs1piqUQPKxfYzG8
         I9PftDYvQyrx2P8mgSjMM4o0Die71uVR+AdOp6IYem6+JQgz482d9xZN8lHn7XvcSzyO
         K1WTzstr5CpampBBOfP6gS6wkz/mR5jIgifHgKwERQn/Eq+7MBtu+RlIq8OU8oSmZ1kx
         EOguLivZ+gdjGLY8PtVT1GCut7zPiwKQt/Jnzyk4bLi87Rrd+rfytMdnsXPDARwH3H5d
         33gpLLYcLxuZcVfAfr58GUi/yzcKTV23heNwwbAw3DzFllAd+DfHPZKCwE3duMRjNKmq
         9MXw==
X-Gm-Message-State: ABy/qLZM2L0yjyU4vCUWoHqRFzdUL3O6Q9DZKy3nSSWtIoC6VGiOAR9b
	8F0AJFMRQv51M9dNWz4t44I=
X-Google-Smtp-Source: APBJJlEokAR5XBWIWrvKx0TqxfcWcSIIEbmM36Ox1s94Psz19r/IEQDX+DN0c5KH+aLxaizghWa1VQ==
X-Received: by 2002:a05:600c:3b88:b0:3fa:91d0:8ddb with SMTP id n8-20020a05600c3b8800b003fa91d08ddbmr4148536wms.14.1690363392741;
        Wed, 26 Jul 2023 02:23:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2ce9338f-30a3-e240-6cf6-a0280294c14f@xen.org>
Date: Wed, 26 Jul 2023 10:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] hw/xen: Clarify (lack of) error handling in
 transaction_commit()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-6-dwmw2@infradead.org>
 <CAFEAcA9gzJGMqsEY5TuNmb74RskgUTMW+XcqGV53n3SsKyVVXg@mail.gmail.com>
 <CAFEAcA9aFv5c4S=Pyf3dMU-v9FnNJqWTQ7ZbiDQLTjh8Qou71g@mail.gmail.com>
 <CAFEAcA--FqeioUdPb9sr5fEy3q0H0swcp+rbGxoNbhgMkYdC+A@mail.gmail.com>
 <20076888f6bdf06a65aafc5cf954260965d45b97.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <20076888f6bdf06a65aafc5cf954260965d45b97.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/2023 18:58, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity was unhappy (CID 1508359) because we didn't check the return of
> init_walk_op() in transaction_commit(), despite doing so at every other
> call site.
> 
> Strictly speaking, this is a false positive since it can never fail. It
> only fails for invalid user input (transaction ID or path), and both of
> those are hard-coded to known sane values in this invocation.
> 
> But Coverity doesn't know that, and neither does the casual reader of the
> code.
> 
> Returning an error here would be weird, since the transaction *is*
> committed by this point; all the walk_op is doing is firing watches on
> the newly-committed changed nodes. So make it a g_assert(!ret), since
> it really should never happen.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


