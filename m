Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7A264820
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:41:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNla-00067R-3n; Thu, 10 Sep 2020 14:41:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGNlY-00067E-Au
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:41:36 +0000
X-Inumbo-ID: 17a6fdd8-f63f-4c43-91af-01ca2ce4d8fe
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17a6fdd8-f63f-4c43-91af-01ca2ce4d8fe;
 Thu, 10 Sep 2020 14:41:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so6990152wrx.7
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=wWsG6Qzy/vIvVAEoZMIU+gw2ZufxGT1g8aoXKzlyMX8=;
 b=d5n5zLzK40bo9OPMhL9ysT1JP7m/4OVLqwgr7PPv3/iqcFiLocwu3sAzx4o8tUhu02
 0EqdA9BEQlyGyUe3+j8sJVQb6CwpS/NtCj4Sra9b9xoTFNvMKHPL4CFeItVpG8WO21el
 b+l7eyDv6CGOfeMjQZyi0gf+bMTC0KNkohUnU/hIC2suIEaq+NnPJxnNzKnWqTbgWHgC
 0q2JCdIEDT4fLFxiciNsRjpBnB3g7hjB4sQI8EiT09lxbkEd9+NT4/GweOw/t4Df52Nj
 MomebDQXkWS599RXNOcgeXoPauc1EYdh/xGSP+amIn66X7gnGOc/jh75JR09dC9E7YyP
 84pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=wWsG6Qzy/vIvVAEoZMIU+gw2ZufxGT1g8aoXKzlyMX8=;
 b=PH5KUyT2M0g6w//ZzSjIAkDKDt3aLVfuLfvwl7PjTR4buNTmp08TpfadbRnUPI4w7P
 cJLIvZQ8r/ZnCYhp7mQTecaxpJFEpyibT04cNZfVYlelWfChWY2wo3w0rsog/f182wly
 WgyT3oaOqA/5QCH0pWq7weZ/3MdYHnchEku+F7y/Jk2qdLiJFcljhyATABG5eAJ9wnFp
 Qe7MFkBA//SJ8jytCnySDLYki6BZSfGmvsWRgQJEtub7R2aXlJCxzBo+QV+V8h7ntxEn
 /CF3fJD1uaAw38ZECr8B3Ux/onftQeF5dkfWnVI3GZI5nHl8KNA5iDB1krtLbhoRANYO
 sykA==
X-Gm-Message-State: AOAM5306xJrvrLBGUps3Lw49QrD1wxWcNRNbQLg6dTvJ7fMBFkQBJtF2
 t0zPKEAjrTNhQLwNp69plZk=
X-Google-Smtp-Source: ABdhPJyZG09DEZVAg6J1oQiAgxppECEpXszeJ3eUTZIqG2BUdDMEaGFtGMzWFsu7nGq+ESuno4LdQQ==
X-Received: by 2002:adf:fa52:: with SMTP id y18mr9612277wrr.264.1599748894463; 
 Thu, 10 Sep 2020 07:41:34 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id v17sm9859599wrc.23.2020.09.10.07.41.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:41:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-7-paul@xen.org>
 <69b7db3f-2f8d-fa96-f5e9-3cb4e35e9dba@suse.com>
 <003101d6877d$2e8a36c0$8b9ea440$@xen.org>
 <e1cd8cb1-27ad-7915-f5ef-817462995507@suse.com>
In-Reply-To: <e1cd8cb1-27ad-7915-f5ef-817462995507@suse.com>
Subject: RE: [PATCH v5 6/8] common/grant_table: batch flush I/O TLB
Date: Thu, 10 Sep 2020 15:41:33 +0100
Message-ID: <003601d68780$7ac23580$7046a080$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHhwG7ATr0KfpJW6ur2MqQg9p50hwJJLhviAbcz1SECIvJS+QM2Pr0eqQCzQpA=
Content-Language: en-gb
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 10 September 2020 15:39
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Julien Grall' <julien@xen.org>; 'Stefano Stabellini'
> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH v5 6/8] common/grant_table: batch flush I/O TLB
> 
> On 10.09.2020 16:17, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 10 September 2020 14:49
> >>
> >> On 07.09.2020 09:40, Paul Durrant wrote:
> >>> --- a/xen/common/grant_table.c
> >>> +++ b/xen/common/grant_table.c
> >>> @@ -241,7 +241,13 @@ struct gnttab_unmap_common {
> >>>      grant_ref_t ref;
> >>>  };
> >>>
> >>> -/* Number of unmap operations that are done between each tlb flush */
> >>> +/* Number of map operations that are done between each pre-emption check */
> >>> +#define GNTTAB_MAP_BATCH_SIZE 32
> >>> +
> >>> +/*
> >>> + * Number of unmap operations that are done between each tlb flush and
> >>> + * pre-emption check.
> >>> + */
> >>>  #define GNTTAB_UNMAP_BATCH_SIZE 32
> >>
> >> Interesting - I don't think I've ever seen preemption spelled like
> >> this (with a hyphen). In the interest of grep-ability, would you
> >> mind changing to the more "conventional" spelling? Albeit I now
> >> notice we have two such spellings in the tree already ...
> >>
> >
> > Sure, I'll change it.
> >
> >>> @@ -979,7 +985,7 @@ static unsigned int mapkind(
> >>>
> >>>  static void
> >>>  map_grant_ref(
> >>> -    struct gnttab_map_grant_ref *op)
> >>> +    struct gnttab_map_grant_ref *op, bool do_flush, unsigned int *flush_flags)
> >>
> >> Why two parameters? Simply pass NULL for singletons instead? Although,
> >> you'd need another local variable then, which maybe isn't overly much
> >> nicer.
> >>
> >
> > No, I think the extra arg is clearer.
> >
> >>> @@ -1319,29 +1324,60 @@ static long
> >>>  gnttab_map_grant_ref(
> >>>      XEN_GUEST_HANDLE_PARAM(gnttab_map_grant_ref_t) uop, unsigned int count)
> >>>  {
> >>> -    int i;
> >>> -    struct gnttab_map_grant_ref op;
> >>> +    struct domain *currd = current->domain;
> >>
> >> Is this a worthwhile variable to have in this case? It's used
> >> exactly once, granted in the loop body, but still not the inner
> >> one.
> >>
> >
> > I thought it was nicer for consistency with the unmap function (where curd is used more than once)
> but I'll drop it.
> >
> >>> +    unsigned int done = 0;
> >>> +    int rc = 0;
> >>>
> >>> -    for ( i = 0; i < count; i++ )
> >>> +    while ( count )
> >>>      {
> >>> -        if ( i && hypercall_preempt_check() )
> >>> -            return i;
> >>> +        unsigned int i, c = min_t(unsigned int, count, GNTTAB_MAP_BATCH_SIZE);
> >>> +        unsigned int flush_flags = 0;
> >>>
> >>> -        if ( unlikely(__copy_from_guest_offset(&op, uop, i, 1)) )
> >>> -            return -EFAULT;
> >>> +        for ( i = 0; i < c; i++ )
> >>> +        {
> >>> +            struct gnttab_map_grant_ref op;
> >>>
> >>> -        map_grant_ref(&op);
> >>> +            if ( unlikely(__copy_from_guest(&op, uop, 1)) )
> >>> +            {
> >>> +                rc = -EFAULT;
> >>> +                break;
> >>> +            }
> >>>
> >>> -        if ( unlikely(__copy_to_guest_offset(uop, i, &op, 1)) )
> >>> -            return -EFAULT;
> >>> +            map_grant_ref(&op, c == 1, &flush_flags);
> >>> +
> >>> +            if ( unlikely(__copy_to_guest(uop, &op, 1)) )
> >>> +            {
> >>> +                rc = -EFAULT;
> >>> +                break;
> >>> +            }
> >>> +
> >>> +            guest_handle_add_offset(uop, 1);
> >>> +        }
> >>> +
> >>> +        if ( c > 1 )
> >>> +        {
> >>> +            int err = iommu_iotlb_flush_all(currd, flush_flags);
> >>
> >> There's still some double flushing involved in the error case here.
> >> Trying to eliminate this (by having map_grant_ref() write zero
> >> into *flush_flags) may not be overly important, but I thought I'd
> >> still mention it.
> >>
> >
> > This only kicks in if there's more than one operation and is it safe to squash the flush_flags if
> some ops succeed and others fail? If all ops fail then flush_flags should still be zero because the
> call to iommu_map() is the last failure point in map_grant_ref() anyway.
> 
> Well, yes, not a common thing to run into. With the small changes
> further up
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 

Thanks. Will send v6 shortly.

  Paul

> Jan


