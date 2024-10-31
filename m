Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2F9B8648
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 23:53:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828918.1244020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6e2O-0007nL-Bp; Thu, 31 Oct 2024 22:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828918.1244020; Thu, 31 Oct 2024 22:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6e2O-0007kg-8f; Thu, 31 Oct 2024 22:53:08 +0000
Received: by outflank-mailman (input) for mailman id 828918;
 Thu, 31 Oct 2024 22:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6e2M-0007kZ-Km
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 22:53:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e167e2b0-97da-11ef-a0c5-8be0dac302b0;
 Thu, 31 Oct 2024 23:53:01 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so12973145e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 15:53:01 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e7c8bsm41910345e9.26.2024.10.31.15.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 15:53:00 -0700 (PDT)
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
X-Inumbo-ID: e167e2b0-97da-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUxNjdlMmIwLTk3ZGEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDE1MTgxLjQwODE1MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730415181; x=1731019981; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nU0ddsqSD7jM58inbL6QlbEbRm+nqHttQg+xn/YS3HY=;
        b=kc8mXnlR5XrN9E966gw+KXTisANPYlxgOu0KNRcdqVWlFs5WmMVqRJZ4bvJ8p3uec0
         +sB+FsLeGCUnRtDcgZ/fKbBwZtbLDA9a6H9V36hP46vwgAcWzf7JZuFCQ9Bxxd6hnLF8
         O5aOg3JJQ31Q1gJeAjPEiNezqvPv4LmEZvxCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730415181; x=1731019981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU0ddsqSD7jM58inbL6QlbEbRm+nqHttQg+xn/YS3HY=;
        b=eRQd3OK+Ph1DoyT+cctjb9XNfgIAjhth9IZvwCifuv+ND2dpez0SaqOunIOkQV37Yp
         8APNd65Br3GrLEEioTFZAOrN3N99VLwlQbtLTdnL9++HFiRo+PVmMErgCUCWNG6t8P4Y
         /c6AY3Znkk6a9DnaIeio1lg1fUeb+W4EtJW5BXKkhvvOkto5tAAZpPXnJxgzHUipSXkX
         prxDvb8z4bPO+Nl9u+HuGgcEN0S2mkoSQbId3wratWUm7sI7TEkSFszKG/hSWl2TIk2G
         7PhjVW+u8/RFy+WJXWsx7Vpzfnmx4PrOKefj/xQLKOXhojGVwbj+6nwojPNOJzpyGgUl
         oBmA==
X-Gm-Message-State: AOJu0YwOe+XTOwiP4oTJVwCghEtvXgsdzP0vUDUpUvGm3MXdyHtu9+Xj
	iZGWd16aAIgAh/Se916nYr3tzzqdv9C1MBi/jFm2UwECpvhSMSirXcNqWi8A2Z70KNs/vUeJF0K
	G
X-Google-Smtp-Source: AGHT+IHZPQAN5FEtrXs6R/hULqQQvquls7ef03DO2pfA5i/ErmgBjKLgSFwdaqsPRtxFbqFuPmyoKg==
X-Received: by 2002:a05:600c:4f85:b0:430:5887:c238 with SMTP id 5b1f17b1804b1-4327b6fd60dmr42943455e9.11.1730415180668;
        Thu, 31 Oct 2024 15:53:00 -0700 (PDT)
Message-ID: <79c9b208-05f2-4520-80c8-930ef5cc4b5a@citrix.com>
Date: Thu, 31 Oct 2024 22:52:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: Refine git-checkout.sh change for different
 branches
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Julien Grall <julien@xen.org>
References: <20241031134702.2913536-1-andrew.cooper3@citrix.com>
 <5d8f492d-6fa0-434d-8d01-f28376ed20be@citrix.com>
 <alpine.DEB.2.22.394.2410311543430.2525410@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2410311543430.2525410@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 10:44 pm, Stefano Stabellini wrote:
>
> On Thu, 31 Oct 2024, Andrew Cooper wrote:
>
>> On 31/10/2024 1:47 pm, Andrew Cooper wrote:
>>> The change works for divergent branches, but doesn't work for explicit SHAs.
>>>
>>> Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we want after
>>> cloning.
>>>
>>> Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branches other than master")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>>
>>> Speculative fix, pending CI:
>>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1521847529
>> Nope.  While this works on staging, it breaks on 4.17
>>
>> Back to the drawing board.
>  
> I am not certain about this but maybe we need:
>
>   $GIT fetch origin
>
> without the $TAG

You need the $TAG to guide what to pull when it's not a parent of master.

For real tags (which live in a global namespace), and real SHAs (don't
need any further reference), creating a branch called `dummy` from them
works fine.

The problem for branches is that $GIT fetch origin $TAG only updates
FETCH_HEAD and doesn't create a remote branch of the same name.  You can
do that with $GIT fetch origin $TAG:$TAG but only if you know that $TAG
is really a branch in the first place.

Which circles back around to the original problem of not being able to
disambiguate what $TAG is until you've got the whole repository.

I'm not aware of any way to ask the remote "do you know what type of
object $TAG actually is?" and that's probably because it would be a
reverse lookup through refs/ to figure out if it was a branch or not.

I'm sure there must be a way of doing this...

~Andrew

