Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7559769B9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797461.1207423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojME-00059W-Q1; Thu, 12 Sep 2024 12:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797461.1207423; Thu, 12 Sep 2024 12:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojME-00056h-NO; Thu, 12 Sep 2024 12:55:34 +0000
Received: by outflank-mailman (input) for mailman id 797461;
 Thu, 12 Sep 2024 12:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sojMD-00055o-GP
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:55:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b20c18f-7106-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:55:31 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso10436275e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:55:31 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25831827sm738980966b.20.2024.09.12.05.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:55:30 -0700 (PDT)
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
X-Inumbo-ID: 4b20c18f-7106-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726145731; x=1726750531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QPBxgEueuv5nAYI3b7TSVRuPKuQbpbx7+kjD7ozjKH0=;
        b=qXvqqeVY5biUp75JO2PSMVp9Zx9Mgf1IygbB6ItWuoifcGqNlUrYY6Ttv5+AVYOduE
         DIReGAfh4XSVRZy0RLlbHjw8pJiGS7y3ftlIHNN17LXcb4+AtnLgQBK4hEMSaQcVfUUq
         howtQJOEEa+dWoKRFoyHf03rLK9YSMwDY9MwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145731; x=1726750531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPBxgEueuv5nAYI3b7TSVRuPKuQbpbx7+kjD7ozjKH0=;
        b=cZTZvvEZD0XeVgOFf0vN45YCfgCFIMLnjhtfMnT65cmU95asnWs+hS2X2KStgZhmWs
         oCrziPaqjQCNV5Ht//DtXUUdLHLOYg06oxIB8xEfotv/ZvhdCk2NtlVsJEfPf/duS+XM
         B2o1kdwHgTDquoSzTluOnWhNgTH32zoy7VjbEfHcpgaQ9aSbZBbWOoWFcXUif17pCICs
         FqGoIIS/9+E2TmKyyv8ZAJGv6SaPZRIFgUOM84joG5X7K5ZM4YQhbLmXHFG15eN2eD5M
         3eILcn0ZJZvzaudxW0Ji+sdhsh4u2QTGZi0e3X4xdjAiyQuiKtCAylkw0mxA0cmOFs4z
         4Rcg==
X-Forwarded-Encrypted: i=1; AJvYcCUQvXDrefsP+Uv68dBBMEdJu5eVcQViQs1euVe5phzZsFh4QXPRGBmpiDFBsVZc0YJvWvwZGQzDX3E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6Q7uEfScex/M1R+iiVid4fj+Kpj6aAWjl+bJNhFcBNBpeqWgd
	q/4EXsPO8Q0UcI5AsUZTNJAdxZfIUBBhj+OvtjiP1A4LR+RpRNZNFcHARWm7ifQ=
X-Google-Smtp-Source: AGHT+IE105sQnmGCnrjjSjZKP5YvT9UpBHy9HgQVC2/ehf1UBJ8+0ab03FCYTYPOhjbhlw3c3EVTeg==
X-Received: by 2002:adf:fc83:0:b0:374:ba2b:4d1c with SMTP id ffacd0b85a97d-378c2d034d2mr2284897f8f.31.1726145730820;
        Thu, 12 Sep 2024 05:55:30 -0700 (PDT)
Message-ID: <52c63542-8acd-4920-bbd3-c4088089a804@citrix.com>
Date: Thu, 12 Sep 2024 13:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] blkif: reconcile protocol specification with in-use
 implementations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Paul Durrant <paul@xen.org>,
 Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240912095729.25927-1-roger.pau@citrix.com>
 <a82d2493-c347-4519-a454-59349df1e62e@suse.com>
 <ZuLjifg2KiKfAZpp@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZuLjifg2KiKfAZpp@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2024 1:50 pm, Roger Pau Monné wrote:
> On Thu, Sep 12, 2024 at 02:06:23PM +0200, Jan Beulich wrote:
>> On 12.09.2024 11:57, Roger Pau Monne wrote:
>>> Current blkif implementations (both backends and frontends) have all slight
>>> differences about how they handle the 'sector-size' xenstore node, and how
>>> other fields are derived from this value or hardcoded to be expressed in units
>>> of 512 bytes.
>>>
>>> To give some context, this is an excerpt of how different implementations use
>>> the value in 'sector-size' as the base unit for to other fields rather than
>>> just to set the logical sector size of the block device:
>>>
>>>                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> Linux blk{front,back}   │         512         │          512           │           512
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> QEMU blkback            │     sector-size     │      sector-size       │       sector-size
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> Windows blkfront        │     sector-size     │      sector-size       │       sector-size
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> MiniOS                  │     sector-size     │          512           │           512
>>>
>>> An attempt was made by 67e1c050e36b in order to change the base units of the
>>> request fields and the xenstore 'sectors' node.  That however only lead to more
>>> confusion, as the specification now clearly diverged from the reference
>>> implementation in Linux.  Such change was only implemented for QEMU Qdisk
>>> and Windows PV blkfront.
>>>
>>> Partially revert to the state before 67e1c050e36b while adjusting the
>>> documentation for 'sectors' to match what it used to be previous to
>>> 2fa701e5346d:
>>>
>>>  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
>>>    the node, backends should not make decisions based on its presence.
>>>
>>>  * Clarify that 'sectors' xenstore node and the requests fields are always in
>>>    512-byte units, like it was previous to 2fa701e5346d and 67e1c050e36b.
>>>
>>> All base units for the fields used in the protocol are 512-byte based, the
>>> xenbus 'sector-size' field is only used to signal the logic block size.  When
>>> 'sector-size' is greater than 512, blkfront implementations must make sure that
>>> the offsets and sizes (despite being expressed in 512-byte units) are aligned
>>> to the logical block size specified in 'sector-size', otherwise the backend
>>> will fail to process the requests.
>>>
>>> This will require changes to some of the frontends and backends in order to
>>> properly support 'sector-size' nodes greater than 512.
>>>
>>> Fixes: 2fa701e5346d ('blkif.h: Provide more complete documentation of the blkif interface')
>>> Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>> The Fixes: tags generally suggest this wants backporting. I'm a little uncertain
>> here though, as it won't really affect anything that is built. Opinions?
> I would suggest to backport to open release branches, as people
> working on protocol implementations might not use the headers from
> unstable, but rather from the last release.

Independently to backport, this definitely warrants a CHANGELOG entry.

We need to take all reasonable steps to make people aware that there are
breakages here.

~Andrew

