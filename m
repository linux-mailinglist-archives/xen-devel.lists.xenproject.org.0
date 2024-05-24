Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943978CE62F
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 15:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729567.1134770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUyh-0005Yr-MD; Fri, 24 May 2024 13:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729567.1134770; Fri, 24 May 2024 13:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUyh-0005Wc-JC; Fri, 24 May 2024 13:28:59 +0000
Received: by outflank-mailman (input) for mailman id 729567;
 Fri, 24 May 2024 13:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nTfd=M3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sAUyf-0005WT-LY
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 13:28:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91b57b92-19d1-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 15:28:55 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so557611066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 06:28:55 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9376edsm132712666b.59.2024.05.24.06.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 06:28:54 -0700 (PDT)
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
X-Inumbo-ID: 91b57b92-19d1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716557335; x=1717162135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NcilalvADXfBySrQYa0n8hNSTrv08kwAHmEPErC5Dg=;
        b=JG7xY9EVOweJPQMsRSF5nw3g6/AhN+KrCvRvbVhfm3cuvytCnnT6naxyeIwEgIvr0q
         g0Twucanp5F5LWI3k/c8lVdfOnYdf87ZGXBIiwDMmbCWPPNUpICQ7d7PNj9LYK+SbSka
         W+eiZClqa/mO6E0OISuVhSZicpDZh5ts+yiNxJl0y2EXidolraRLUtZI7G4MrKj90g9g
         MuWDkVUdzfA4IIgOta2jMwa+tZTP53bLf8zmnImtueLpAA92WXGG1Y3rl4rtJdv/FqEV
         vSQi02hQ8JbD5ZNwFlN5rJJsAAJcd4LMsZ8YHdLLQp55ULAUUZU4rz1ExZvquQlSNOKD
         QeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716557335; x=1717162135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NcilalvADXfBySrQYa0n8hNSTrv08kwAHmEPErC5Dg=;
        b=mlV5/W1WYnwbzsIodQSkFBLV7W54jFVjSACjJ9wOsQeVD6Hm7TyEFo+hiv790G/tTo
         AyjOuVTCumhslNwsk1cWo6eeee7LOPhLiuiaoBJtggm4iD7Mv5eq7ew8eUx5CSEEirfo
         lgogerul5ug3njIKRKB5MRczeslxe7lkx6AG9VhglGiRR4YKIJAExHASBHPSjhzoNR21
         svo+hK/qluqIG2B0L1c8Dc5QOyh6LOjAhVmY4EcEN/NNkGxv6KPtrnS1bTNirY6tfbw7
         DKHDQMhdRA007NYiZVa9Km8r96/U8+VZOQFPgq2n8RXJAyNYZ88Cc0Ve0V8aGYSB+IjG
         VxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9GZYwH/c0KiBcpJpLUsHzBXoKB0lZZUjkXdXPsgkrEPdL5FVsrR/YXUKuOYvraMBxQ2ySxt5rNZKi4oMLHZEv1Hy4NjNJG2hV8NjqqiQ=
X-Gm-Message-State: AOJu0Yz3DPrDovNea1MK4bkcPqe6/rVxroYD3wXzQImN6nZudWvDmTj5
	kLdXisQ1bYCwnlQGrnUZy4eYlL9jLY7RBBsaBJyfK7CebRi0Z9mLP3+lxs1LI5g=
X-Google-Smtp-Source: AGHT+IFtDuHED1hdSpxXhxPqDbPnJHfqtWqQV3lWCA5XYYdtu1Yb0HgbFEJ/SAbPwr9HtzulYJKkgQ==
X-Received: by 2002:a17:906:275a:b0:a5a:3e00:6317 with SMTP id a640c23a62f3a-a623ea0380bmr413697766b.31.1716557335063;
        Fri, 24 May 2024 06:28:55 -0700 (PDT)
Message-ID: <6cc5222a-1dfb-434d-8d84-e1f02be38511@suse.com>
Date: Fri, 24 May 2024 15:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240517133352.94347-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.05.24 15:33, Roger Pau Monne wrote:
> Enabling it using an HVM param is fragile, and complicates the logic when
> deciding whether options that interact with altp2m can also be enabled.
> 
> Leave the HVM param value for consumption by the guest, but prevent it from
> being set.  Enabling is now done using and additional altp2m specific field in
> xen_domctl_createdomain.
> 
> Note that albeit only currently implemented in x86, altp2m could be implemented
> in other architectures, hence why the field is added to xen_domctl_createdomain
> instead of xen_arch_domainconfig.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com> # tools/libs/


Juergen

