Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87411A37F0C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889947.1298977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxsG-0002Yv-4l; Mon, 17 Feb 2025 09:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889947.1298977; Mon, 17 Feb 2025 09:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxsG-0002XJ-27; Mon, 17 Feb 2025 09:57:12 +0000
Received: by outflank-mailman (input) for mailman id 889947;
 Mon, 17 Feb 2025 09:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tjxsE-0002XD-7j
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:57:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d4ebad0-ed15-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 10:57:09 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so3613815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:57:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439618ab352sm116509795e9.40.2025.02.17.01.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:57:08 -0800 (PST)
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
X-Inumbo-ID: 8d4ebad0-ed15-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739786229; x=1740391029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JFuJtNgbar4YgvAKE2HTzDhcAAaX2BDXiN97S/gYXaE=;
        b=jODZUWGiYt6TYtXZnS7H0enGNChBFz8AF50Bdp2UVUjd3rNUDY/vWfi7O+rHuNpuqR
         6kijrPUZ0qHJb9e0QtJRBZCUMUczipObt6Bj93lJ0ly92ZInv6AvuZ4+bghsjEvTtjh2
         TCfAKvorY8qYrMnYiQcNL7uI7yNBGxGmP0kGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786229; x=1740391029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFuJtNgbar4YgvAKE2HTzDhcAAaX2BDXiN97S/gYXaE=;
        b=mhZrphcKKofyKdEuE4UDbqy25mHTXb3gMeMmuZjhiwadV9DIhMzRet6FW7EFmcrXqo
         +YRBRuSzY5/nxr0f30U4sBu00BgVy7vVvaxMSkJf8wAmgAaSNVk53t9A9o66gebmlu9O
         MNUFGPaIP+kmjVLvJaL9pgn1hepRDtFeq6XMcdjFnmRdACT66S393EVt5mXY87/g4bf1
         VhaDaqUdHuZIlu164k19e/GXQt/ESOro/9FBDZ8mg10sxqmQVJ0dsOuIpGbPQB4KdtVk
         Hd24F3M/rHY3LK1+V1tobJf8COZkOFTX3R28cqEE5lFuQwWS4T4YlACZTtzuQY7P6TPd
         qM0A==
X-Forwarded-Encrypted: i=1; AJvYcCXgYbZ1FKlSRTnG6tLqcRA9KOe5I8/W+ufXXY45xZCRJdrpEavecslnkmu2MX20HnLrO+Svob/sbtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJc14QQp0i/ICOZHh3lEPUU0fsmbynFj8cUKNhHdZ2qIP6UExI
	+Hg0Shv67vg1Hr7bIlVirSDIXc5pGIW4OmTDOVjTeGdAwaSVmkUqCpOMPXm399I=
X-Gm-Gg: ASbGnct+s/46eopD5t5EhSExI0+CHnHDqBeVZ/etnLkMm4daUez2RZihD+paEIcEXwh
	xkHE6l7ryyos7e/wOyxWqVpr3Sz6X9V2EDiVctuKizRb4LuN2gBez20xIRppDBFmMt1SfZtnNio
	24Z2OHizoqqQt0WkMrvcHVNfNER7Wl0TpgfNgZBEaw4zD/89ff76n7lgcU7JkumowPGms7GR/Rf
	26QqVSTfb1+IG5+FZpQqQB6n0gO2jP+7ud7nHf+YlHLAQZ3HdITuRkIq+CQJvWfA71em2V+tCNt
	jtXnH1tucYxJVtlMpPpcz9vIQ58DdYO2hrO28K6BpXQKmRJmWP4uz20=
X-Google-Smtp-Source: AGHT+IEHYu1les6gsNL9il+u2a+8c0fGStmkxihl3+vCG3qVQTo8qWJixXI4SvPHTbE/d/wGeBrrbg==
X-Received: by 2002:a05:600c:6a15:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-439871dd97cmr14121215e9.3.1739786228743;
        Mon, 17 Feb 2025 01:57:08 -0800 (PST)
Message-ID: <6635fcbc-072c-4a47-979b-d4860d077e4e@citrix.com>
Date: Mon, 17 Feb 2025 09:57:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250216102356.18801-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/02/2025 10:23 am, Juergen Gross wrote:
> The list_for_each_entry*() iterators are testing for having reached the
> end of the list in a way which relies on undefined behavior: the
> iterator (being a pointer to the struct of a list element) is advanced
> and only then tested to have reached not the next element, but the list
> head. This results in the list head being addressed via a list element
> pointer, which is undefined, in case the list elements have a higher
> alignment then the list head.
>
> Avoid that by testing for the end of the list before advancing the
> iterator. In case of having reached the end of the list, set the
> iterator to NULL and use that for stopping the loop. This has the
> additional advantage of not leaking the iterator pointing to something
> which isn't a list element past the loop.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I have to admit that my gut feeling is that this is vastly overcomplicated.

It also further diverges from Linux.  I couldn't find an obvious example
of this kind of UBSAN failure in Linux which suggests to me that one of
the differences might be relevant.

I did start experimenting in this direction, but haven't finished.

~Andrew

