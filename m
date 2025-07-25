Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6CB116A8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056933.1424954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8T8-0002bZ-13; Fri, 25 Jul 2025 02:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056933.1424954; Fri, 25 Jul 2025 02:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8T7-0002ZM-TX; Fri, 25 Jul 2025 02:47:33 +0000
Received: by outflank-mailman (input) for mailman id 1056933;
 Fri, 25 Jul 2025 02:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50hf=2G=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1uf8T6-0002ZG-IH
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:47:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b48d94-6901-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 04:47:31 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so294470666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 19:47:31 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47ff42ce6sm195436866b.129.2025.07.24.19.47.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Jul 2025 19:47:30 -0700 (PDT)
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
X-Inumbo-ID: b5b48d94-6901-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753411651; x=1754016451; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc3hDEGPGsCDebYX51sWpA/bxBMOB24GoB4P11DkIaw=;
        b=fC87W08I2OqaqZLrqU7CY/nXSYTNrbFoeSmx2eJUDt589+05ZwPoXSsuJZlh9dOQlO
         DyYCFW9r0zvBJpkI3JVuXIUqT5bVhPjSWxW/UYMl1VVnqGV0xhTRgp25+zX3/FjCp395
         7lXflztFxeXTkBbQc/3xLuqMKywtAkg4u49ydye78gYBzQnX/ZiK8w2bnoun/+tbhyVF
         OyVQmWFcuyvE4GEsAkoj/E+NZIsUKoS4kLvSTYmiHhuQ/vV3y5q3qwPIf9GR5YzUwtT3
         4RnLcEn95r5Kr3fla8hyuwNBl4AD+RWjAC49x3sjwt4toRRmfbWGqGZ3WNdyLrndZ1mi
         YNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753411651; x=1754016451;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xc3hDEGPGsCDebYX51sWpA/bxBMOB24GoB4P11DkIaw=;
        b=ULcz59Woalcf9J/+zqhuasj43z5SOs4YwxXZmJZekwj23Oe8cmCvuyoqUxmJHeABaf
         4RmzjwGgoxn3FRkuC5e1hOtIAPOlb2jni7drUDsvLKJKmGvokXPPte4vHE5gugei/GaE
         c1zsNenL3K9Fau+8gVTwAGotVynqNo1AHoeaifcAttBKZF6FgL9zObDPJ5BAAfwmtR8j
         AeAftVQazoV3h2R6Mv1n/R2vVoYookEXO8uvTHeKOWtR+ATG+wZVKInu8jNKDMZqWLt0
         Nk2oMZf9N5+us8UOLTdh6+nhd4dz3b/DWZZtUsk7NRuQfvJ2ybvAV7BHvdhtcg1Lhsi5
         r0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkd/Np2MmIzqGNzI83oeEgx8AY+p2QovW5G72pTF23Ltl6aigf8Hcq1kAEswqwD6yRovnjKkLMdOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9J0Aw/AZo/c53lNSAMb2bNSkGq00Fl7E+tY+p9ENVuIXY95SF
	QYwGT1TC/70szVbW76F+Sy1vodzVOQraqfkSbtynphPiGQQZSK8U+YP+
X-Gm-Gg: ASbGncsq0o2T3PTWSHhmHQaXjNd+B1wfXmHwhFdB/B/825N19Xosmm05jm5dSjcWeCk
	Y7NjrEi8Zpx/SNIh37HG7PlpvDQ16DWzd8eBlqsGJCvtDCkmR9W9NbVqFzs91pzqtaR9WlkUZNJ
	l+DjVyM9fZ0ar1Kdv/oMOfaebluVVMqgIku68odTDUmqyKpCzMBczpgvBU2o86EEW6xtYAqu0y1
	/Sy4WlpGyej07vQ+Qa6IhwzTu+CiOYYW5cmUdKrhleou5jupbN8nJJtjwQScPnLrO7ZjTEMd2KY
	6AEEqVIc2PQgse0azDtmHBDdU845Lz27UlU0Who3ciwelSYFDXGyei8Z1Vh5qn1XtixUP2Ov/H2
	4tz3Dp8JFbx4lyJlXtQXHlw==
X-Google-Smtp-Source: AGHT+IHalRLNdYC73lbRRqlIizE8OiCJMhgGy8d4kUNVhjNjBAndWdZO49wygHZRXIZ+3UwJxXytHQ==
X-Received: by 2002:a17:906:f596:b0:ae0:d4f2:dff3 with SMTP id a640c23a62f3a-af619b04c91mr39263566b.58.1753411650558;
        Thu, 24 Jul 2025 19:47:30 -0700 (PDT)
Date: Fri, 25 Jul 2025 02:47:29 +0000
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
	Lance Yang <lance.yang@linux.dev>,
	Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/9] mm/huge_memory: move more common code into
 insert_pmd()
Message-ID: <20250725024729.emodbzsflthdzyzh@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717115212.1825089-2-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jul 17, 2025 at 01:52:04PM +0200, David Hildenbrand wrote:
>Let's clean it all further up.
>
>No functional change intended.
>
>Reviewed-by: Oscar Salvador <osalvador@suse.de>
>Reviewed-by: Alistair Popple <apopple@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

