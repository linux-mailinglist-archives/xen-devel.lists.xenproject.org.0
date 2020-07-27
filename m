Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419922EDC7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 15:46:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k03Rq-0003Zk-Lf; Mon, 27 Jul 2020 13:45:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k03Rp-0003Zf-Er
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 13:45:45 +0000
X-Inumbo-ID: 78011c26-d00f-11ea-a7ce-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78011c26-d00f-11ea-a7ce-12813bfff9fa;
 Mon, 27 Jul 2020 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFDYRYFVAaz8Aqbh+dVeouxgn8PgmqGLW5mQE1CoTIs=; b=e42LpALH3BFY0qElxOEWzLQaQR
 0qJa+tkqtn9TZvqPyUPl7ZbNyYmpBLuFLYM4LlEQ1an+CwC4sB1vj6k8GyBCKZqmj22ylVTBVKQah
 1schNvLyrDv93ny4zHfBSNl9Ngv+S2tIjE+vFypFPtU7ATW8XNzwiWeZYO7teoemVdB4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k03Rn-0000UL-QO; Mon, 27 Jul 2020 13:45:43 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=edge-cache-102.e-fra50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k03Rn-0000m3-GM; Mon, 27 Jul 2020 13:45:43 +0000
Message-ID: <16bfc39511221b683aea98b1440d3ab7f987b27e.camel@xen.org>
Subject: Re: [PATCH v7 09/15] efi: use new page table APIs in copy_mapping
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 27 Jul 2020 14:45:41 +0100
In-Reply-To: <0c421dee1729295eb8504ee81abbc8e57f220b12.camel@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <0259b645c81ecc3879240e30760b0e7641a2b602.1590750232.git.hongyxia@amazon.com>
 <bfe28c9c-af4e-96c2-9e6c-354a5bf626d8@suse.com>
 <0c421dee1729295eb8504ee81abbc8e57f220b12.camel@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 2020-07-27 at 13:45 +0100, Hongyan Xia wrote:
> On Tue, 2020-07-14 at 14:42 +0200, Jan Beulich wrote:
> > On 29.05.2020 13:11, Hongyan Xia wrote:
> > > From: Wei Liu <wei.liu2@citrix.com>
> > > 
> > > After inspection ARM doesn't have alloc_xen_pagetable so this
> > > function
> > > is x86 only, which means it is safe for us to change.
> > 
> > Well, it sits inside a "#ifndef CONFIG_ARM" section.
> > 
> > > @@ -1442,29 +1443,42 @@ static __init void copy_mapping(unsigned
> > > long mfn, unsigned long end,
> > >                                                   unsigned long
> > > emfn))
> > >  {
> > >      unsigned long next;
> > > +    l3_pgentry_t *l3src = NULL, *l3dst = NULL;
> > >  
> > >      for ( ; mfn < end; mfn = next )
> > >      {
> > >          l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn <<
> > > PAGE_SHIFT)];
> > > -        l3_pgentry_t *l3src, *l3dst;
> > >          unsigned long va = (unsigned long)mfn_to_virt(mfn);
> > >  
> > > +        if ( !((mfn << PAGE_SHIFT) & ((1UL <<
> > > L4_PAGETABLE_SHIFT)
> > > - 1)) )
> > 
> > To be in line with ...
> > 
> > > +        {
> > > +            UNMAP_DOMAIN_PAGE(l3src);
> > > +            UNMAP_DOMAIN_PAGE(l3dst);
> > > +        }
> > >          next = mfn + (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT));
> > 
> > ... this, please avoid the left shift of mfn in the if().
> > Judgingfrom
> 
> What do you mean by "in line" here? It does not look to me that "next
> =" can be easily squashed into the if() condition.

Sorry, never mind. "in line" != "inline".

Hongyan


