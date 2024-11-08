Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166149C1982
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 10:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832392.1247709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Lcb-00054e-1Y; Fri, 08 Nov 2024 09:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832392.1247709; Fri, 08 Nov 2024 09:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Lca-00052N-VE; Fri, 08 Nov 2024 09:49:40 +0000
Received: by outflank-mailman (input) for mailman id 832392;
 Fri, 08 Nov 2024 09:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9LcZ-00052H-Au
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 09:49:39 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3bcc721-9db6-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 10:49:36 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539f7606199so1890279e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 01:49:36 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6c11f8sm92022035e9.25.2024.11.08.01.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 01:49:35 -0800 (PST)
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
X-Inumbo-ID: c3bcc721-9db6-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzYmNjNzIxLTlkYjYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDU5Mzc2LjYwMDE0Nywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731059376; x=1731664176; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ckRx2buNXd0fpJLrWZiiRs+lCRAQLfxh+9AWVZ3zjRQ=;
        b=V8aCOBt74giQzPn1/lvZNIuDc6f4aazGN60BH9bAJJ4sQ6sjWk+PVyOwiF5Ru3zoR8
         0wVddUL9jZ7XLYtWQXvC1OJzNn+dazs+0Di64dFmfTFQzJYUBTbsdgaxIrYt2coHlaY9
         9eCuLJZy7YLRogcgksvoxh74CWcfldS2vG62M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059376; x=1731664176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckRx2buNXd0fpJLrWZiiRs+lCRAQLfxh+9AWVZ3zjRQ=;
        b=bTccOcB5hgVphPAHi5tI/4C24J/2+U7PkxNLI/hGz5KfBa7rvvQUkZK9HjEMoxnDFC
         L0yoz5gGDP4AkBg6SS6EPPf7qa4037T9n3Mlg6HkmGCV+NNYAKLG0UqZr1k46Hixt0Cj
         f1y4ZpdHjOD2A0AlhQTahyKyasVxfqQXldlr2YvghXJY07hWBhYv2OPf5Rxt+1ZPsRov
         eG+ZjISKZp9tSGOI1w817LeBugIpy4X420/+fIS/nW1ryR5SeAUiHHCpdP6hFTAXAKLM
         oumMt00JQSLMBDW7exRWbiDXs1SQ/MUlXYulsEUbdyFAC3T4s17WR4zu6P+Wkqo3I9mu
         IkkQ==
X-Gm-Message-State: AOJu0YyRfilrkRchXMBYkgJrUcIXCx3sGTydftP73YLiuusiLLw5DzKR
	FuvIRdK/JDMDfTvMBJdLV8t9pihQiISyrii2iNfsfu7kheDI4G1LHRnaFbYfeXL7mjROKKBPczB
	2
X-Google-Smtp-Source: AGHT+IESQ2Q6NRj4WBRaRbHzaV66uUguAlm4P5zTEQZe+e+K7ta4XTcXYeZolxFgGTvhJUxai/vHVw==
X-Received: by 2002:a05:6512:3c84:b0:539:f807:ada5 with SMTP id 2adb3069b0e04-53d86227edfmr1150279e87.3.1731059375992;
        Fri, 08 Nov 2024 01:49:35 -0800 (PST)
Date: Fri, 8 Nov 2024 10:49:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@ctrix.com>
Subject: Re: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of
 destroy_xen_mappings()
Message-ID: <Zy3ernBVL8OplX0t@macbook>
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-4-roger.pau@citrix.com>
 <ac948cdc-8ae6-41f1-b7dd-35820e9c2193@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac948cdc-8ae6-41f1-b7dd-35820e9c2193@citrix.com>

On Fri, Nov 08, 2024 at 09:41:35AM +0000, Andrew Cooper wrote:
> On 06/11/2024 12:29 pm, Roger Pau Monne wrote:
> > bootstrap_map_addr() top level comment states that it doesn't indented to
> > remove the L2 tables, as the same L2 will be re-used to create further 2MB
> > mappings.  It's incorrect for the function to use destroy_xen_mappings() which
> > will free empty L2 tables.
> >
> > Fix this by using map_pages_to_xen(), which does zap the page-table entries,
> > but does not free page-table structures even when empty.
> >
> > Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
> > Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
> > ---
> > The fixes tag reflects the fact that if 4376c05c3113 freed the L2 correctly
> > when empty, it would have become obvious that bootstrap_map_addr() shouldn't be
> > using it if it wants to keep the L2.  4376c05c3113 should have switched
> > bootstrap_map_addr() to not use destroy_xen_mappings().
> > ---
> >  xen/arch/x86/setup.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 177f4024abca..815b8651ba79 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -456,7 +456,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
> >  
> >      if ( !end )
> >      {
> > -        destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
> > +        map_pages_to_xen(BOOTSTRAP_MAP_BASE, INVALID_MFN,
> > +                         PFN_DOWN(map_cur - BOOTSTRAP_MAP_BASE),
> > +                         _PAGE_NONE);
> >          map_cur = BOOTSTRAP_MAP_BASE;
> 
> One option to consider is this.
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index eac8488c4ca5..b317a4d12f55 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -461,8 +461,13 @@ static void *__init bootstrap_map_addr(paddr_t
> start, paddr_t end)
>  
>      if ( !end )
>      {
> -        destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
> -        map_cur = BOOTSTRAP_MAP_BASE;
> +        if ( map_cur > BOOTSTRAP_MAP_BASE )
> +        {
> +            memset(&l2_bootmap[l2_table_offset(BOOTSTRAP_MAP_BASE)],
> +                   0, (map_cur - BOOTSTRAP_MAP_BASE) >>
> L2_PAGETABLE_SHIFT);
> +            flush_tlb_local();
> +            map_cur = BOOTSTRAP_MAP_BASE;
> +        }
>          return NULL;
>      }
>  
> We know for certain there's nothing to free, and and this far less logic
> than either destroy_xen_mappings() or map_pages_to_xen().

Should we then also consider using l2_bootmap directly when creating
the mappings?  So that we have symmetry between the map and unmap
logic.

I think it might be better do to this change as a followup patch, as I
would like to change both the map and unmap paths at the same time.

Thanks, Roger.

