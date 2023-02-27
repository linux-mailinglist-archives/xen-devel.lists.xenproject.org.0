Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9C6A3D74
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 09:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502273.774001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZEt-0005ZS-8E; Mon, 27 Feb 2023 08:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502273.774001; Mon, 27 Feb 2023 08:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZEt-0005Wz-5I; Mon, 27 Feb 2023 08:52:07 +0000
Received: by outflank-mailman (input) for mailman id 502273;
 Mon, 27 Feb 2023 08:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRQf=6X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWZEr-0005Wt-9T
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 08:52:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f77183-b67c-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 09:52:04 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id s26so22433048edw.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 00:52:04 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.185])
 by smtp.gmail.com with ESMTPSA id
 ml12-20020a170906cc0c00b008b1fc59a22esm2959801ejb.65.2023.02.27.00.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:52:03 -0800 (PST)
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
X-Inumbo-ID: 01f77183-b67c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWa+q1jNuttV60i7FGHAfquXZh1ICfAvONgpeNS7hVQ=;
        b=IhKdYtfXPNJzTVTNl7v6hn8v0lTjSAIkpvIPbYtJCQMs4YWOXOWp3/mHaWxNJ6rYZj
         n7u4fciKJ/xwY0uhSMFJjep7PGp9stNzybEGcT9BUAHRmxKrtq306R9VMBM4dWbobWR8
         7dp1XjxUN1LcYbEiT9m307NogtscPirF1ERzfC8W6sVn6zpps4RurbZ26So/bZ4CL1zp
         VcwT6ez0xk1XmobnrcCiRW18r1RhB5UXi0FG2aRduULeoooxfyrN/EWIqN7f549qGlSA
         7ig3FyPvKsXhqVbheXB0LbXAb/KdvtIZEVRzR8FA3gXvJKXuDysKna0KIIvAX3LC8nkZ
         0Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWa+q1jNuttV60i7FGHAfquXZh1ICfAvONgpeNS7hVQ=;
        b=jpFKK48f2m/CRAQpHl69AY4yHSpqUCQDxalhxE/Svp17o19HEpL5sOp7OcEhTRXnoE
         bWeY9w3EQJ+nlA0zK3MiX/+K89hFHTYv6xiSgBSs2oS6s7ZYnKdxhliaweMYE721Lc3s
         Ev+vUBmLuXHCeiB7QtvUpgyaWBwPzZIKOMj/h/wRD3lDyAQ1tWQEAKxcZw/EWg4RcyJw
         tYXmNzsRv9RDHI+9KZWLXRgoERSN6VEJMBpTvIvAoc6r6TOwO77m4oZAH0rb3nntdWnd
         9hV/vCq4J/LfmnrtwlZRs/b895NwxC4UEABUEj1qJmNIrif9Vf0oZf7eSlOyt1expuhI
         tegw==
X-Gm-Message-State: AO0yUKXrBl/4+4fwTQvwRqkJ41g/AALH6QhshUj7WlapY3gn1EOtHy5B
	GE8LoefrmRKxRiUyPX3VTTNPm9uvqr4=
X-Google-Smtp-Source: AK7set+cYym4Mr1awaXrWhJwTJguF5MYmZDsueAaJQ8ZRL4sov/Nu+J34xNbeR9FY8WTJbx34hPnyA==
X-Received: by 2002:a17:907:2099:b0:8a9:fa2f:e440 with SMTP id pv25-20020a170907209900b008a9fa2fe440mr31225122ejb.55.1677487924007;
        Mon, 27 Feb 2023 00:52:04 -0800 (PST)
Message-ID: <709fef03-4263-861b-3ccd-44e3706b5fb3@gmail.com>
Date: Mon, 27 Feb 2023 10:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 05.5/14] x86/svm: Decouple types in struct nestedsvm
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>
References: <20230224185010.3692754-6-burzalodowa@gmail.com>
 <20230224210616.2818727-1-andrew.cooper3@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20230224210616.2818727-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/23 23:06, Andrew Cooper wrote:
> struct nestedvm uses mostly plain integer types, except for virt_ext_t which
> is a union wrapping two bitfield names.  But the nested virt logic only ever
> deals with it as full opaque register.
> 
> Switch it to being a plain uint64_t, allowing us to hide even more of the SVM
> internal infrastructure.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

-- 
Xenia

