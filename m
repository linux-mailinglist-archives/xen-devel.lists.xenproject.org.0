Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609DA20FC0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 18:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878726.1288918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcpeL-0004nn-Vb; Tue, 28 Jan 2025 17:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878726.1288918; Tue, 28 Jan 2025 17:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcpeL-0004lC-Sp; Tue, 28 Jan 2025 17:45:21 +0000
Received: by outflank-mailman (input) for mailman id 878726;
 Tue, 28 Jan 2025 17:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00fH=UU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcpeJ-0004l2-RF
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 17:45:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e8957b-dd9f-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 18:45:17 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1289681766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 09:45:17 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e8acb6sm818432766b.76.2025.01.28.09.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:45:16 -0800 (PST)
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
X-Inumbo-ID: a2e8957b-dd9f-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738086317; x=1738691117; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kuDjnyy8QNCE5nXbBr2E5MtFQXBnd4rgNbbc7bDNldI=;
        b=KIdGjLiTDdTzn47Fv4HxisQYuT7SjSunH9+UvjvSk7RTN3XHjse6ki9TVPE1ySEqcA
         sW2pSmjZsrrpU7tE3YpEAPHKp7AEQ1SEiAbUYqdtEkLYJTFjWykB3V0NP2uwLc6uVAp6
         ycNPHcFI6tIs2D2I1BXFEFp6nENxio7T6LSeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738086317; x=1738691117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuDjnyy8QNCE5nXbBr2E5MtFQXBnd4rgNbbc7bDNldI=;
        b=U8pPnf/y3xfgyPwgdxpoAOldp51czT6lLX+zk00sG//wdChc4JyOxRyzJ9qkIKGQ8N
         JxX2rr+J8DBjXjv0R/7SNHGJcudsrjtOh8zle2ECh3djpOkF9rQUtdwWq6bhs59Bz9A7
         0oa6KH5ZO2H2w0c/SEyOe9ezfle41Xe6iPmUVUGohVviKNoZXkUXQS66as/ajZ2YkNon
         YNjN7X9S0Km/Emtull8uY/zgt5IFz5R0DGRbgdYa5KE1n3C4K9JgX6f+wIsnnw/IcbDT
         GR90Z5YjwtVF6SYibY4qNlqZVQDgA2ImJ6EKkSmm+BVeibqtf9OldIK5x2Rdk89EbZ74
         Yzpg==
X-Gm-Message-State: AOJu0Yx5UqS6ig9kZHlQ3shUFyXazGUUA8l5404zeNCRADWJf0imLLxK
	KSZcE3p8tYLZJGt4GNoDkA4pNMRzvZe72jwoUdgVw1z8laK7VCxi/lPok9fdS74=
X-Gm-Gg: ASbGncvlv6OJV9pTxVYrtwdIk9n3BzOuYpOCT3CVN9tOpTugLoxqqxRFzbhx7Pezh9C
	yyyDNvEToPtQ6e6VGsge5/aWVw1EQD1TK8zBXYUUdUFBRMzTBWGc3EcaSHPnp4gPjVskisoZDDv
	dTsGY7w7Uw5VKMaQieiKWvrbFOjLBVIltZX1KXSvDcmyQ2dphLTEmDnU4eLkQm7E+JlomngPMsf
	RJuPW2toyeErPiaJZCiCtn/OSiJ//LCXmtfvR/pEqs2qgbpne/BFFauMgLK46aBhvun9xWIyyyL
	nMV/HfAbttjab6rX6vSf
X-Google-Smtp-Source: AGHT+IGWnlP7bmYFK5wcedpA6oHCWe0jnq4OZAWhqcU5F2KRq/rub7Q9HZhgpCahoKaLrnBzR5Am4g==
X-Received: by 2002:a17:907:7fa8:b0:aa6:2704:4840 with SMTP id a640c23a62f3a-ab6cfe401d5mr492066b.51.1738086317045;
        Tue, 28 Jan 2025 09:45:17 -0800 (PST)
Date: Tue, 28 Jan 2025 18:45:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/3] tools/hvmloader: Decouple APIC IDs from vCPU IDs
Message-ID: <Z5kXq2RehzyFEYqA@macbook.local>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128163342.1491-1-alejandro.vallejo@cloud.com>

On Tue, Jan 28, 2025 at 04:33:39PM +0000, Alejandro Vallejo wrote:
> The hypervisor, hvmloader and the toolstack currently engage in a shared
> assumption that for every vCPU apicid == 2 * vcpuid. This series removes such
> assumption from hvmloader, by making it read the APIC ID of each vCPU and
> storing it for later use.
> 
> The last patch prevents writing an MP Tables should we have vCPUs that can not
> be represented there. That's at the moment dead code because all vCPUs are
> currently representable in 8 bits. This will inavitably stop being true in the
> future after we increase the maximum number of guest vCPUs.

While I'm fine with the MP Table change, should it also come together
with a patch that introduces the code to create x2APIC entries in
libacpi construct_madt() helper? (and bumping the MADT revision, as
I'm quite sure version 2 didn't have x2APIC entries in the
specification).

Otherwise the MP Table change seems like a red herring, because the
MADT created by libacpi will also be incorrect and APIC IDs will wrap in
local APIC entries, just like it would on MP Tables.

Thanks, Roger.

