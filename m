Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D465AB359
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 16:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397790.638471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU7Yr-0002hz-24; Fri, 02 Sep 2022 14:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397790.638471; Fri, 02 Sep 2022 14:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU7Yq-0002eW-VA; Fri, 02 Sep 2022 14:22:20 +0000
Received: by outflank-mailman (input) for mailman id 397790;
 Fri, 02 Sep 2022 14:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSmw=ZF=amazon.com=prvs=2378ed032=ptyadav@srs-se1.protection.inumbo.net>)
 id 1oU7Yo-0002eQ-EK
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 14:22:19 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2c9c170-2aca-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 16:22:15 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 14:21:52 +0000
Received: from EX13D08EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com (Postfix) with
 ESMTPS id 03919810AD; Fri,  2 Sep 2022 14:21:49 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08EUB003.ant.amazon.com (10.43.166.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Fri, 2 Sep 2022 14:21:48 +0000
Received: from dev-dsk-ptyadav-1c-613f0921.eu-west-1.amazon.com (10.15.8.155)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1497.38 via Frontend Transport; Fri, 2 Sep 2022 14:21:46 +0000
Received: by dev-dsk-ptyadav-1c-613f0921.eu-west-1.amazon.com (Postfix,
 from userid 23027615)
 id 406C025972; Fri,  2 Sep 2022 14:21:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a2c9c170-2aca-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1662128537; x=1693664537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UKSdy9ljsTc9naNZmAjGvtO5F0jQVq8xZyMjs59heuU=;
  b=SuTzX5fVvLbsdkYAjpv7EsQJ0ws8W+DmP2Wf2VjSJmmrK4/KxVKTRFeX
   FIYaCkWRHpHDR8H8K7C+MfFmbc7YSE1wqBqCR7qODabEJqaUfCduVPTxU
   Pb1GDblpqqSjHBAaIvXRFJYrcL26UmjlG/86oDFI11BMRl+fw9O/anhaA
   o=;
X-IronPort-AV: E=Sophos;i="5.93,283,1654560000"; 
   d="scan'208";a="255595992"
Date: Fri, 2 Sep 2022 14:21:45 +0000
From: Pratyush Yadav <ptyadav@amazon.de>
To: Juergen Gross <jgross@suse.com>
CC: SeongJae Park <sj@kernel.org>, <roger.pau@citrix.com>,
	<marmarek@invisiblethingslab.com>, <mheyne@amazon.de>,
	<xen-devel@lists.xenproject.org>, <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] xen-blkback: Advertise feature-persistent as user
 requested
Message-ID: <20220902142145.txtszulz6edsf455@amazon.de>
References: <20220831165824.94815-1-sj@kernel.org>
 <20220831165824.94815-2-sj@kernel.org>
 <20220902095207.y3whbc5mw4hyqphg@yadavpratyush.com>
 <84def263-c061-605f-44da-580c745bf5b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <84def263-c061-605f-44da-580c745bf5b6@suse.com>
Precedence: Bulk

On 02/09/22 01:08PM, Juergen Gross wrote:
> On 02.09.22 11:53, Pratyush Yadav wrote:
> > On 31/08/22 04:58PM, SeongJae Park wrote:
> > > The advertisement of the persistent grants feature (writing
> > > 'feature-persistent' to xenbus) should mean not the decision for using
> > > the feature but only the availability of the feature.  However, commit
> > > aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent
> > > grants") made a field of blkback, which was a place for saving only the
> > > negotiation result, to be used for yet another purpose: caching of the
> > > 'feature_persistent' parameter value.  As a result, the advertisement,
> > > which should follow only the parameter value, becomes inconsistent.
> > > 
> > > This commit fixes the misuse of the semantic by making blkback saves the
> > > parameter value in a separate place and advertises the support based on
> > > only the saved value.
> > > 
> > > Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
> > > Cc: <stable@vger.kernel.org> # 5.10.x
> > > Suggested-by: Juergen Gross <jgross@suse.com>
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >   drivers/block/xen-blkback/common.h | 3 +++
> > >   drivers/block/xen-blkback/xenbus.c | 6 ++++--
> > >   2 files changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
> > > index bda5c815e441..a28473470e66 100644
> > > --- a/drivers/block/xen-blkback/common.h
> > > +++ b/drivers/block/xen-blkback/common.h
> > > @@ -226,6 +226,9 @@ struct xen_vbd {
> > >          sector_t                size;
> > >          unsigned int            flush_support:1;
> > >          unsigned int            discard_secure:1;
> > > +       /* Connect-time cached feature_persistent parameter value */
> > > +       unsigned int            feature_gnt_persistent_parm:1;
> > 
> > Continuing over from the previous version:
> > 
> > > > If feature_gnt_persistent_parm is always going to be equal to
> > > > feature_persistent, then why introduce it at all? Why not just use
> > > > feature_persistent directly? This way you avoid adding an extra flag
> > > > whose purpose is not immediately clear, and you also avoid all the
> > > > mess with setting this flag at the right time.
> > > 
> > > Mainly because the parameter should read twice (once for
> > > advertisement, and once later just before the negotitation, for
> > > checking if we advertised or not), and the user might change the
> > > parameter value between the two reads.
> > > 
> > > For the detailed available sequence of the race, you could refer to the
> > > prior conversation[1].
> > > 
> > > [1] https://lore.kernel.org/linux-block/20200922111259.GJ19254@Air-de-Roger/
> > 
> > Okay, I see. Thanks for the pointer. But still, I think it would be
> > better to not maintain two copies of the value. How about doing:
> > 
> > 	blkif->vbd.feature_gnt_persistent =
> > 		xenbus_read_unsigned(dev->nodename, "feature-persistent", 0) &&
> > 		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
> > 
> > This makes it quite clear that we only enable persistent grants if
> > _both_ ends support it. We can do the same for blkfront.
> 
> I prefer it as is, as it will not rely on nobody having modified the
> Xenstore node (which would in theory be possible).

Okay. In that case,

Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>

-- 
Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879

