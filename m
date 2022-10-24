Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0EC60B43F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 19:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429298.680236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on1Jv-00043Y-Ji; Mon, 24 Oct 2022 17:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429298.680236; Mon, 24 Oct 2022 17:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on1Jv-00041I-Fv; Mon, 24 Oct 2022 17:33:03 +0000
Received: by outflank-mailman (input) for mailman id 429298;
 Mon, 24 Oct 2022 17:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDLv=2Z=bombadil.srs.infradead.org=BATV+126e47513ec1fd56a858+7001+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1on1Ju-000419-3n
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 17:33:02 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7ee3212-53c1-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 19:33:01 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on1Jk-002Tzq-40; Mon, 24 Oct 2022 17:32:52 +0000
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
X-Inumbo-ID: e7ee3212-53c1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rmYsPiQAe01mPUbVVVEiS6SzJmrWKoOMvVqAUcXlI3E=; b=tv4ds0D7DIvDaukA98ZSEiuXsj
	5bqFYvG7Kxc26coWWzyB01UmgmfRdJ9NHPgGN6+MQ7K4t49rWSudQCsuaeA2oImMNf7NVrvZZ9/uD
	LvzpmEf/Q3O+XSsEElVRnf67XBDZEQpKYSLXlClNzP2bbrz/OL+1qNcB8wfxo54awzWM5rIQW5SQ/
	mR7WVWNmsqKU02JvuN3+2ectX7Y6LsXwS8vxfIVuIqrpT2VhpH1Qyb4ulEE9SK5kFgYa/qJZTiELn
	BbRs/CqIvv5s4bT0EFrEYnFdKZlIxXYw4/DTUf4Iv1wnoozDaByH7HaF9dz2HWVwJ+sJRQ7vuPAgn
	7hdtcQuA==;
Date: Mon, 24 Oct 2022 10:32:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Christoph Hellwig <hch@infradead.org>, Juergen Gross <jgross@suse.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Salvatore Bonaccorso <carnil@debian.org>,
	"sathya.prakash@broadcom.com" <sathya.prakash@broadcom.com>,
	"suganath-prabu.subramani@broadcom.com" <suganath-prabu.subramani@broadcom.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"MPT-FusionLinux.pdl@broadcom.com" <MPT-FusionLinux.pdl@broadcom.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"adi@kriegisch.at" <adi@kriegisch.at>
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <Y1bMRNhmq41/y3Jb@infradead.org>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
 <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
 <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
 <2fd505a07bd26d76f1166761fa50905414edb7ef.camel@linux.ibm.com>
 <30a056c8-071f-4259-3253-75e718af619d@suse.com>
 <Y1bEQMS5SNTbZO/3@infradead.org>
 <858a4288-46ac-d423-a529-b3b77b7fbc8a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <858a4288-46ac-d423-a529-b3b77b7fbc8a@citrix.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Oct 24, 2022 at 05:28:05PM +0000, Andrew Cooper wrote:
> I don't know exactly how this translates to Linux internals, but most
> devices are fine and it's routinely the mpt2/3sas drivers which
> encounter problems.  It would be lovely if we could get to the bottom of
> this for once and for all.

So to summarize my two mails:  I think te use of dma_get_required_mask
in mpt3sas is wrong, and the dma_get_required_mask return value from
xen-swiotlb is also wrong.  Fixing either one should fix this problem,
and I think we should fix both.

