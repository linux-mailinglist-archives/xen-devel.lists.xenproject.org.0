Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F8B1497E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 09:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062114.1427732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugf8d-00066M-GU; Tue, 29 Jul 2025 07:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062114.1427732; Tue, 29 Jul 2025 07:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugf8d-00063f-DG; Tue, 29 Jul 2025 07:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1062114;
 Tue, 29 Jul 2025 07:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=izQy=2K=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1ugf8c-00063Z-0O
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 07:52:42 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 002098a3-6c51-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 09:52:40 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae0c4945c76so744036166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 00:52:40 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af6358a1aacsm549963466b.49.2025.07.29.00.52.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Jul 2025 00:52:38 -0700 (PDT)
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
X-Inumbo-ID: 002098a3-6c51-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753775559; x=1754380359; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smgFHrQGxmFhyoF2rRGKiX2BsEmUYdFGX1JZMpUcdm4=;
        b=XBMnciyFTzGYsFTAERkvGtW3lphkz4DrVtTCmxISFrqgZchvUGCmiVQQwuRkN7JWte
         Yg6icLtuh8AXjgnlP0aCFKQxPJ4a4l75xw5soIz/WE57bLEmGAMEyTC3LPIHf7JgxoLv
         lAM8Am2FlVA6M6FBPNEcwDNhje8ZYaCbx91f0nh02DwDkt/+Uq/Z30bhEbwUiWnMp5UJ
         zoOfYWZtVpnrnRLv9JKSBmz2gfeoR3cfHU+EKdkzDY87a0LsEJMcuods5msWVnH1ok/I
         exhV9qtSKw5kfC/IxjWdiSttXyA29smBoaC8j+7S/6itXtKMAhWcj5gGDj0AikBRx6bz
         mZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775559; x=1754380359;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=smgFHrQGxmFhyoF2rRGKiX2BsEmUYdFGX1JZMpUcdm4=;
        b=b61Pu/UJKV64C0tHi2arcZqqgbOOzzrP+HcrjmCHKdiCSo2GLZph2JJU7SqJNXza+g
         qVY3oUD7YPlD26NYicSc6twkAU3V1cUfCndaY8kJEcjjpwdyuWhOPxmBYUmKDL7y1F8a
         kNIGFmsEYU10WCcedlZ7SvZnLLpa/mW/4fo4PRDf3aXBbzuDIsoEPPZyPSZ3uLPdERNc
         BEdHbJUtyl6UkChhL3q16JD3EcmqQJoREGPWF18Ye4InYArbwvN+27q2HSiqhgTRK/E6
         80NwnAxp+ZTHhn4Zf9hG7NepIHXwqKoSfUrB02nFewLKG+K3HyZ3ezpD+PXHujAViXzS
         hqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQcnBhJtdrJufNNnhA9u3EOq+BqcJJBOaH+D440mLWA1/PUpeWzR4QJDJ+eg+N9SUgaEmdfokxbI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLftkPfF3diDrnPubhRXSvZwEYA10X8hhnDehf39X/icP7iqes
	aGFAPyPhxfiCm9ck7NGDIOLMoan5hAI7X5Y81x1Jknh2xgY4NyVVq5+f
X-Gm-Gg: ASbGncvjLTPw9Ku3leaJeYllp79e5QM3+dW+vgXOsAN2hIRxNTAvvSEZpYd79YnTp/l
	50IgJ9uEPi+B5/8AiSOVe2rt5u/9ZODVqNnNq3MLsgavrmNVuNH1fXNA0aY+pNO+OtHH9lMJbAJ
	TE1yqibrzapsbQq96AdqyX0l9gPFLiRyBx1B1lcNlYUTyfduLQpBiaQBanM8NFnId+RscKGMOMB
	k2gmL/jRRg+y1+26wWdFe0l4zswxorMPgKGE9tIJG3wz5IhjXuiSOxgazf0xKgc5CzFGDHcy++p
	kizFH3sa9qcDxWsy1+/3Pply3ZLkJjDZnOGGELZT9BqBN2R6V9edAUAvkgYjEhlFWpsCxi9n0+7
	+T5MGdKiUU+NY8Fu8sYCt9A==
X-Google-Smtp-Source: AGHT+IEV6FhS7BcuKiy2mmCmExHdPH8UplQNL1+hlnfx7GXoYFJTZHp4rwskMVqcf+8guTBozWXdIg==
X-Received: by 2002:a17:907:6094:b0:aec:5a33:1573 with SMTP id a640c23a62f3a-af619aff33bmr1645989666b.41.1753775559042;
        Tue, 29 Jul 2025 00:52:39 -0700 (PDT)
Date: Tue, 29 Jul 2025 07:52:38 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 8/9] mm: introduce and use vm_normal_page_pud()
Message-ID: <20250729075238.44l3jgz2l6fbss2j@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717115212.1825089-9-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jul 17, 2025 at 01:52:11PM +0200, David Hildenbrand wrote:
>Let's introduce vm_normal_page_pud(), which ends up being fairly simple
>because of our new common helpers and there not being a PUD-sized zero
>folio.
>
>Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
>structuring the code like the other (pmd/pte) cases. Defer
>introducing vm_normal_folio_pud() until really used.
>
>Reviewed-by: Oscar Salvador <osalvador@suse.de>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

