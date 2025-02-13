Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE051A3522E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 00:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888208.1297605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiidS-0003ui-MD; Thu, 13 Feb 2025 23:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888208.1297605; Thu, 13 Feb 2025 23:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiidS-0003sG-J2; Thu, 13 Feb 2025 23:28:46 +0000
Received: by outflank-mailman (input) for mailman id 888208;
 Thu, 13 Feb 2025 23:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiidQ-0003sA-OJ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 23:28:44 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4338770b-ea62-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 00:28:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4396794bfdeso1837865e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 15:28:42 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43961885077sm29333065e9.25.2025.02.13.15.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 15:28:41 -0800 (PST)
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
X-Inumbo-ID: 4338770b-ea62-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739489322; x=1740094122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zxrwch8xDEZV36ATUdORQAcuFYQLHLW0BSPLWfX9lw=;
        b=dTMTrmqX8RNxr9Nym1Ll8E0GBs230GT6rTqcrChCp93YzlenX2ZDeNelQrlShP/w6b
         GDlZ6GgLUC4/KveRWP/mTEC3hS8+NfOlsaDGOaFtYNIcn4tDlvaTKgHI6IEGeh7SECcT
         e2WnKzZhtdmxH37/VksI3JrIfN+BsJ2gosEtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739489322; x=1740094122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Zxrwch8xDEZV36ATUdORQAcuFYQLHLW0BSPLWfX9lw=;
        b=E1d2PbPpD/+/cFN2hiJIcov8scCFvtOMv0WFJqNPPD/HmlHCLZw73WH94/fdUJtudm
         19tQDUNXuMFUayKLhXLlXKgpInLSKOGK7k0+EG0TzWOiFK1+zG444ajQqR3LFTtRqN7K
         IwVAZK5B6VR5gmiAUNO/bVIz1Xc9EnlOcN/MOoK3bPBJ8gm1gl+OVDoRDvh/F/3Jt0uu
         oJHwsIKIS5RujmdpyE8s3K8gSHsm9CEd2L3JDAE86qS96I/Hnsr3zDq+IRjF0sZLFvHi
         ASmGuV26ifhk/tOJ/EXWiywoJexIjOcgWGlUZ8S/TCnfzKAETMOZ9izpLpBogMmtr3Jo
         XbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxHq8E7mZ9Tl1+as4vqQZ5BEz0hQRzuUKPX4uV7+44aQ5llb6ELMLzO0ZKRvnzghOzBF8GVRz2Ey4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHH4vnAepEaMOOSE5UBnCP+v2PBr+0+DWK8Mxa+vApQha0G3ZY
	lJwVm3eDN4Rq5oN/r/oscIFrSZXHY3HZy0KhYdf9/Ip+wA3mrzSZcMx6XaNhO04=
X-Gm-Gg: ASbGncuMgCrX06+SDYtUcz5gDMzdHvqDlzBEuLUnnUtxLmXz2lp+45ydok+GEP2zYvc
	22ouFOV5Fm5lUXUojbRSVnJDgEQoP3kABRk072PhOeL5c1UdTafGHPazaCu7lW7jRE+ZiNNFfzl
	Cc0eJZ+W0xuYViP2a8AGyJIxfeJgJuUz7GS3tSKQCN/A2etE4kNUCC50V8QsokUNqewUWAFupa1
	7QifDCFUqgU8Ol+z7t8r6Uy6Ym2PJC8IEeS9VN3SpOREuNpLcam3PlTzFKXTP/8hnExyU8evh5i
	w4jlkDJkuUjxB2xJ+o05RtFWmnLzHW2Yq1hSZfD8tz/BhhmiGkJhas8=
X-Google-Smtp-Source: AGHT+IF8+1egAOt048QahBC/5qozyO65DuBPrvYSg7P2fZ4+Hvrzy22CdUzlIvUhUy8ayW0I9B+sUA==
X-Received: by 2002:a05:600c:c14:b0:439:63cb:ff7e with SMTP id 5b1f17b1804b1-43963cc00d4mr55974715e9.10.1739489322282;
        Thu, 13 Feb 2025 15:28:42 -0800 (PST)
Message-ID: <30dbb0ca-33d8-40fa-9c98-9ea266ff44c2@citrix.com>
Date: Thu, 13 Feb 2025 23:28:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: pre-compute domain prefix for printouts
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250213214350.1745843-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250213214350.1745843-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 10:35 pm, dmkhn@proton.me wrote:
> Every guest_printk() call computes "(d%d) " prefix on every call.
> Move prefix generation to the domain creation time.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I'm on the fence here.

Part of that is speaking as someone who has had to shrink struct domain
several times to keep it fitting within 1 page.

But as to calculating it every time, does that matter?  In production
environments, we get a handful of print lines per domain across their
lifetime.  Is the saving really worth it?

~Andrew

