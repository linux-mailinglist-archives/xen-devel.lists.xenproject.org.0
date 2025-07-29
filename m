Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBFAB1497F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 09:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062121.1427742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugf9U-0006ZG-PA; Tue, 29 Jul 2025 07:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062121.1427742; Tue, 29 Jul 2025 07:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugf9U-0006XQ-Lk; Tue, 29 Jul 2025 07:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1062121;
 Tue, 29 Jul 2025 07:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=izQy=2K=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1ugf9T-00063Z-Ii
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 07:53:35 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e75b18-6c51-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 09:53:35 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61557997574so2074890a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 00:53:35 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61556326ee7sm1444188a12.55.2025.07.29.00.53.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Jul 2025 00:53:33 -0700 (PDT)
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
X-Inumbo-ID: 20e75b18-6c51-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753775614; x=1754380414; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsVo12V6n1cHZPjfQGvjTgS28eByrDkHggKW6JJVbsg=;
        b=WPZ98pH92pxCCSGArOpcc9sQ/zU7+O9AmU7tH1C4PJq4VDgNnExEGom0thWxxrBlgF
         WWAvStnBj2WWAWsJtstPIKQTHkoIa0a29RAIYJ571+i2Q50+TT1y4Fk5eusxbzGjxJl/
         ecA0pTsx9za4QVnAOod2k/xxq1oFMNwsztgyru+EICL9LkBK5vZj0dePeMlRtZlaVhBg
         wiNG8+KZkXVbiRPVaKMCaTTIA7AkbH6Zx1qIoy+wAjUtFrRFd/oxbY7GLEuHLgCtv/gL
         fEeYk1AkK2c0DnvoBTlfFQbM65QOtoVZYqyPeM3R/WVCZD+GKanTubUklpJTqkPHEcm8
         w+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775614; x=1754380414;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xsVo12V6n1cHZPjfQGvjTgS28eByrDkHggKW6JJVbsg=;
        b=HHO6GXESMgjQ3Ozyfp7R3RIIx2FUnzVPBv5kMTdmk16hBbN0iopiw7jz+U1wxmFiYi
         Nvjn2HxYuRKmMjuZxWpbrU5rvPtWyO0HPgn2RYnBd4UFd7sY7nGWfGqgknVpEVBHpLxs
         C2G4soVdealtEEJob9TM2pgFyX0EPQZZUUa1A9ZFhKe7n/W8D7SH9LRPbw58Y7l2OHZc
         9IvIeU75IX/QHz1RMGbtyp9hNvC34LTECKMOWRuGKUz1lbx+aActeFszq+7/l3NUmvbA
         eyPQRuYt88X4Xo9TrQ/Gd/a5c+z1lamxuAaccrbDXd/WZrN74vWsd5BERV+R0YkkqK8o
         ZQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeu2FdhnkmNT7J7tCrs528HedWU1WjMn6q14W8UVWZiPY0u8JOm4i2w96N2XA+KsDLoanMDVONw+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyiWaI0PZZlPcRgWJ491DqDTa5QkQODOoaWosRFMLhrYn8tI9/
	xiPIMCb4Z6OiKeYGRB5qWkcT4laxuTojKP1Owipz6FEeivVISeKpTmPN
X-Gm-Gg: ASbGncsT/PEXzNts7TwBZx7qlbw6SLkoY+nYuZDnTB7W1xeWYwsDd5+nyYnekBLGbPp
	l3wGp0JqdYR9zbQTQRHxu/sJqWSIGDV2qmjwS+p62cAoSVWrZdFwCfqb/PdbIPuHnX0j2hqq2u2
	TxbxaLav0kVwUzyNkFRvkSNF7iyvA8N2wqCM66fiNQi+OwHu8Ry6u1jT1TU4m6+T9PDwZ66GQwM
	zR8BfYk04cL//lnYh5iVIsuRn7GjI5vS4+TZNqnokIsOj7TYxPLl8wkd5XKU4mqZEUylRGnbVlI
	nCuDWUJgknvpjR2Gj/Ah0305DVgKvZ7fPnxBGukSXZiDNQT3la4aBf+WAGB7ZF7aqAjN1xLHa3n
	93AyC3maIzvtho8MIwCXh8w==
X-Google-Smtp-Source: AGHT+IGAnknk8rhP20f+2sNuwxA4iW0E1pa7hcWsSRXI9dwJsSvI+o2WMSlmcCRhgf1zJ9FE5orwQQ==
X-Received: by 2002:a05:6402:2789:b0:615:4655:c74c with SMTP id 4fb4d7f45d1cf-6154655ca5emr5234235a12.31.1753775614152;
        Tue, 29 Jul 2025 00:53:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 07:53:33 +0000
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
	David Vrabel <david.vrabel@citrix.com>
Subject: Re: [PATCH v2 9/9] mm: rename vm_ops->find_special_page() to
 vm_ops->find_normal_page()
Message-ID: <20250729075333.47jnxp7fly5wfx6n@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717115212.1825089-10-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jul 17, 2025 at 01:52:12PM +0200, David Hildenbrand wrote:
>... and hide it behind a kconfig option. There is really no need for
>any !xen code to perform this check.
>
>The naming is a bit off: we want to find the "normal" page when a PTE
>was marked "special". So it's really not "finding a special" page.
>
>Improve the documentation, and add a comment in the code where XEN ends
>up performing the pte_mkspecial() through a hypercall. More details can
>be found in commit 923b2919e2c3 ("xen/gntdev: mark userspace PTEs as
>special on x86 PV guests").
>
>Cc: David Vrabel <david.vrabel@citrix.com>
>Reviewed-by: Oscar Salvador <osalvador@suse.de>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

