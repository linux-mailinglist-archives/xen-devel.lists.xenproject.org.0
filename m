Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E72812D3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2049.6154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKGn-0003jL-7j; Fri, 02 Oct 2020 12:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2049.6154; Fri, 02 Oct 2020 12:34:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKGn-0003iw-44; Fri, 02 Oct 2020 12:34:41 +0000
Received: by outflank-mailman (input) for mailman id 2049;
 Fri, 02 Oct 2020 12:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anut=DJ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kOKGm-0003ip-7c
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:34:40 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e960f30a-c63c-42b7-961c-fdfa7243362a;
 Fri, 02 Oct 2020 12:34:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A8EFB67373; Fri,  2 Oct 2020 14:34:36 +0200 (CEST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Anut=DJ=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kOKGm-0003ip-7c
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:34:40 +0000
X-Inumbo-ID: e960f30a-c63c-42b7-961c-fdfa7243362a
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e960f30a-c63c-42b7-961c-fdfa7243362a;
	Fri, 02 Oct 2020 12:34:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A8EFB67373; Fri,  2 Oct 2020 14:34:36 +0200 (CEST)
Date: Fri, 2 Oct 2020 14:34:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: xen-swiotlb vs phys_to_dma
Message-ID: <20201002123436.GA30329@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)

Hi Stefano,

I've looked over xen-swiotlb in linux-next, that is with your recent
changes to take dma offsets into account.  One thing that puzzles me
is that xen_swiotlb_map_page passes virt_to_phys(xen_io_tlb_start) as
the tbl_dma_addr argument to swiotlb_tbl_map_single, despite the fact
that the argument is a dma_addr_t and both other callers translate
from a physical to the dma address.  Was this an oversight?

