Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D5760B336
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 18:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429273.680191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on0mz-0006Or-6T; Mon, 24 Oct 2022 16:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429273.680191; Mon, 24 Oct 2022 16:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on0mz-0006Mg-3i; Mon, 24 Oct 2022 16:59:01 +0000
Received: by outflank-mailman (input) for mailman id 429273;
 Mon, 24 Oct 2022 16:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDLv=2Z=bombadil.srs.infradead.org=BATV+126e47513ec1fd56a858+7001+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1on0mv-0006Ma-NV
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 16:58:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23d5550b-53bd-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 18:58:55 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on0me-002PNe-1e; Mon, 24 Oct 2022 16:58:40 +0000
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
X-Inumbo-ID: 23d5550b-53bd-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sD1/9KUepwxnnbZHmOxcQ0nb2LDnGCi+U3tMVxTFuSE=; b=ShSp2+NTgj4NbO//OTI9ybjHre
	/+4idaGTfOP2cZZepFuVzG6VTj106A725AmvchWCyGPhWW0ULuEu9DESP6S6HnDAZcwb/1eiFs/Ci
	j5KU9irR0d90+K8+3LNua77wdl1V/SNAlKyMa/t7P4h2siKyDhWQ6pyEHXHIrybXYLUutHjNs+QHK
	nhFt5+e0jO/84nYFbMU3YyCT27pYCUZFLRZuUQcj1KLM9OcabmPUK6f8sQY93XZBo642wxbKfXltd
	aw1qFRMAKxER3crTMWbM10pDCoXSJKAtbHaxOXAIv1nUG8KRZtBNUY3iMbLLUKak3RZjS0oBe4a1r
	AWDX7Z2g==;
Date: Mon, 24 Oct 2022 09:58:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: jejb@linux.ibm.com, Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Salvatore Bonaccorso <carnil@debian.org>,
	sathya.prakash@broadcom.com, suganath-prabu.subramani@broadcom.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	adi@kriegisch.at
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <Y1bEQMS5SNTbZO/3@infradead.org>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
 <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
 <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
 <2fd505a07bd26d76f1166761fa50905414edb7ef.camel@linux.ibm.com>
 <30a056c8-071f-4259-3253-75e718af619d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30a056c8-071f-4259-3253-75e718af619d@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Oct 24, 2022 at 03:20:43PM +0200, Juergen Gross wrote:
> Dom0 is (normally) a PV domain, so the physical memory can be still above
> 4 GB even with dom0_mem set to 4GB.

Which means that we need to ensure the DMA ops for Xen-PV (which is
always xen-swiotlb I think?) need to return DMA_BIT_MASK(64) or whatever
is the highest possible address.

