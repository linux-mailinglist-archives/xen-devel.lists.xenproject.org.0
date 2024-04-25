Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659188B2803
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 20:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712221.1112728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03e0-0008Is-Ja; Thu, 25 Apr 2024 18:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712221.1112728; Thu, 25 Apr 2024 18:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03e0-0008Gf-Fx; Thu, 25 Apr 2024 18:16:28 +0000
Received: by outflank-mailman (input) for mailman id 712221;
 Thu, 25 Apr 2024 18:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s03dz-0008GX-O0
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 18:16:27 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edf81cc4-032f-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 20:16:26 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78f056f0a53so79100885a.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 11:16:26 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z12-20020a0cf00c000000b006a0441c4d15sm7145119qvk.38.2024.04.25.11.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 11:16:25 -0700 (PDT)
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
X-Inumbo-ID: edf81cc4-032f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714068986; x=1714673786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MaX4o5LBeJn3t8xAOHYRZgxxvBmmdxJbFDAYUiF8a1E=;
        b=vjeenQOmDdTP5A8xR3r3h6nJXPHketm8X8EsxSfaCQDOTHyittNCt0UYW72V8t0CED
         ALJjAvtatw19qVPAIXHW34tQUlv8+pXb++SKVW/GlNccPtrZmHDxO2iVPxLfvwQdmV59
         BE41Zx5yf8CgvsC3oGFFCmNCaIPI+A4cgC4dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714068986; x=1714673786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaX4o5LBeJn3t8xAOHYRZgxxvBmmdxJbFDAYUiF8a1E=;
        b=NSMkJ+9MprphjlNPQS0F+ClS3hnqjANci7E2VcL8svtHThWusyLNGYaIojq2bgPzMh
         2gk5NN0oG0PDGbty7vyAq5IaIS8O2+RqJezUKBsC6ycX/aMJQyO1rIjKUsjFyFzDzLjt
         yRCs4/LdRYRfOcJ0GnEg/y6SEV1F8NF6JgwxR1qb6BO/gjPo4TrERnhBgJDORv4qqZpu
         RIxHXJCFgdBpQeGFq8V3ARjoKvjBcbHynuylc9g8F9M1dfLtPTsl5EToNKzdRyJPyNXo
         swwwPffyoyzRwAw/CdnXDFPC9OegRAGUds0yycszMndow+c417FkzPqetbnjAebF9+NZ
         vuAg==
X-Gm-Message-State: AOJu0Yyi4QSavCVY4/Aix/ZtcL8m0/awGx7o2AEMSN/RrUCOhlBN9Lfs
	CfXckMkZhnBH3nxvTxrNe/CVZS/v+12sFQfESvIxYgQiJaM1AvmmCwVPvTU0+iI=
X-Google-Smtp-Source: AGHT+IGdN8iqqCAaHepHcmbauZkQQFWM6BGCMxK/efp6mRz8pjydQoCojOQT0p7PNEnArNPXlRrPaA==
X-Received: by 2002:a05:6214:5582:b0:6a0:ab56:8466 with SMTP id mi2-20020a056214558200b006a0ab568466mr9523qvb.50.1714068985539;
        Thu, 25 Apr 2024 11:16:25 -0700 (PDT)
Message-ID: <341c5901-254e-4ad2-b935-6b586cd25f2e@citrix.com>
Date: Thu, 25 Apr 2024 19:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
 <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/04/2024 7:06 pm, Anthony PERARD wrote:
> On Thu, Apr 25, 2024 at 06:32:15PM +0100, Andrew Cooper wrote:
>> libsystemd is a giant dependency for one single function, but in the wake of
>> the xz backdoor, it turns out that even systemd leadership recommend against
>> linking against libsystemd for sd_notify().
>>
>> Since commit 7b61011e1450 ("tools: make xenstore domain easy configurable") in
>> Xen 4.8, the launch-xenstore script invokes systemd-notify directly, so its
> That's not enough, it's needs to be `systemd-notify --ready` to be a
> replacement for sd_notify(READY=1).
>
>> not even necessary for the xenstored's to call sd_notify() themselves.
> So, sd_notify() or equivalent is still necessary.
>
>> Therefore, just drop the calls to sd_notify() and stop linking against
>> libsystemd.
> Sounds good, be we need to replace the call by something like:
>     echo READY=1 > $NOTIFY_SOCKET
> implemented in C and ocaml. Detail to be checked.
>
> Otherwise, things won't work.

Hmm.  It worked in XenRT when stripping this all out, but that is
extremely unintuitive behaviour for `systemd-notify --booted`, seeing as
it's entirely different to --ready.

I've got no interest in keeping the C around, but if:

[ -n "$NOTIFY_SOCKET" ] && echo READY=1 > $NOTIFY_SOCKET

works, then can't we just use that after waiting for the the pidfile ?

~Andrew

