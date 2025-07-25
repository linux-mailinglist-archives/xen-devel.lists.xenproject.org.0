Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7CB116C0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056946.1424975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8bU-0005Pj-3o; Fri, 25 Jul 2025 02:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056946.1424975; Fri, 25 Jul 2025 02:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8bT-0005MZ-Un; Fri, 25 Jul 2025 02:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1056946;
 Fri, 25 Jul 2025 02:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50hf=2G=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1uf8bS-0005MT-VD
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:56:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea285b92-6902-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:56:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so319788366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 19:56:08 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f44d85esm196204966b.89.2025.07.24.19.56.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Jul 2025 19:56:07 -0700 (PDT)
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
X-Inumbo-ID: ea285b92-6902-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753412168; x=1754016968; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzGOuzDhEi3TMJulLXZr4GFUL3lm8OH7E+i1imGtL3w=;
        b=gNOiSRq0RbhA6Y/yh0fk6S/NhkwFn5oySxxKFrPmw6Y+KEbCJ6p/XJq4kgJnJIJW1k
         Qw7y0XNqAvsuwph1UVwN2S1wIvt5ncl/NKoXPODPmApV1AV5oAHoI/FagWdRDY/P0BU7
         GJ0Z5J/taRq58pI1YMASr5om1dwF+o3NrHr2ffDDgrc6RpFCo6dnD1KXTjLwruVdlyvV
         FU3hv6rkiewNKkhccTqr3O+llBZjJw1at+I8W8/ZQOXAuXsRNbZEFxV8xA1PXBwy6JK4
         xA4GLn5nPxt+TH6zUmBR866+F+DhD2VXaVlgcj1s+LrlsWezDy7mOnjwNxAFjYIBUJQk
         WYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753412168; x=1754016968;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzGOuzDhEi3TMJulLXZr4GFUL3lm8OH7E+i1imGtL3w=;
        b=OCY8mDASQmVs1nSOPl1YDD5fYcLDh31vNEoU0+2m78+phYaRSf/QDgQqdv0jyLWCA1
         gqxLCbDQWF//qtziajPTgHGQhiA5MGvrXs9/qj8YlxuxJLaG1UcOJSPHvpgD4iEFhk1H
         1rZpwWZdhJaFh4gzggCXYkE8BYLGXbhCP+eTkWU+/ZZv9/zqQgRuplcXaoHeO/l++j+x
         TiPhJG4/bGeN1KTTq5RT814IDaCey78kNiSca9rA2gXUC41PihuRR0of9yWzEQ+1ZbvG
         vqlTrCXzTLeSyeV2QkjMCSq07GKkgzaMY2yPjpKqMl8SP9SYpFL+mGcBcqbSYhWFXmjk
         zg1g==
X-Forwarded-Encrypted: i=1; AJvYcCXhGRZT5sJrfXNx7qbId4ecJCuplxjztBaw225McbHDxRu+kv57dnoYi5NuPydi5PhfbTzMk9kyPok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLi0xQCRr2gUBXmNPg4cMkPvuiv9zlZ3WWbbOzWP3x9OKp6904
	MrCPd3Jnbz84CpD1olEaPF1gSt79PN9UMMBaEEWxEdXxNHxVixcOnk8g
X-Gm-Gg: ASbGncvUvMz6t9y+W9B/7sqP5firtKOQRbQHwfIewLWGk8L4aM+K3l7iT4UU68dw0U2
	I78gNgzfh0IRFlgfTrVDKSc1pfvGz9B20MBjcLk8AtCtyAhXB1utUzBL92/rxhRearf2aCqdGOx
	1qW6jc5AFsBxRbH4ZZtBLL95OA52J+MUot+zUscCLWOK6ZwWmIkA0hjFsQebrEBvnCKafDMXkGM
	oyZWnYoXgyGKzWzkm5OUc3CWEqlgIDsZrM1CQg+sxiy0+7x9WTlMTuq7JhF8ZiPH4ikShRD72k0
	NK69fM3WgypMqDYAPl8YXEWZ0aT38TLMicYuw8er9TMLZKdkkvJxdPgeL2C/gcQi88ZOHAohNrE
	kmtzZN30Gc6issULSXVOhWxQRclvlNP/G
X-Google-Smtp-Source: AGHT+IHhkClQ6+YPICgV57QIRUaI7tNGak2Dw44PbpFkJLABqr49v5gkdZqRJ5Z7WHZCF0LZz7A43Q==
X-Received: by 2002:a17:907:3e1d:b0:ade:4593:d7cd with SMTP id a640c23a62f3a-af61c8a6743mr34848666b.13.1753412167981;
        Thu, 24 Jul 2025 19:56:07 -0700 (PDT)
Date: Fri, 25 Jul 2025 02:56:07 +0000
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
Subject: Re: [PATCH v2 2/9] mm/huge_memory: move more common code into
 insert_pud()
Message-ID: <20250725025607.vi7n6wvwmzajcv3q@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717115212.1825089-3-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jul 17, 2025 at 01:52:05PM +0200, David Hildenbrand wrote:
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

