Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF7B28E998
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 03:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7056.18463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSrdI-0000DA-AI; Thu, 15 Oct 2020 01:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7056.18463; Thu, 15 Oct 2020 01:00:40 +0000
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
	id 1kSrdI-00008t-6z; Thu, 15 Oct 2020 01:00:40 +0000
Received: by outflank-mailman (input) for mailman id 7056;
 Thu, 15 Oct 2020 01:00:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsEj=DW=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1kSrdG-000898-Uy
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:00:38 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e5c3bc9-bca5-4c95-a360-780f87990fdd;
 Thu, 15 Oct 2020 01:00:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 18:00:33 -0700
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 18:00:33 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TsEj=DW=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
	id 1kSrdG-000898-Uy
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 01:00:38 +0000
X-Inumbo-ID: 6e5c3bc9-bca5-4c95-a360-780f87990fdd
Received: from mga09.intel.com (unknown [134.134.136.24])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6e5c3bc9-bca5-4c95-a360-780f87990fdd;
	Thu, 15 Oct 2020 01:00:35 +0000 (UTC)
IronPort-SDR: 6qH4PBgr3GRVJiM562Z+3wdm3ksv29kwdFYVXIeFB34y7aGAXHj3S6vxL7dE0QuWxuu6g2fBmo
 OhmMzFBNdjCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="166348621"
X-IronPort-AV: E=Sophos;i="5.77,376,1596524400"; 
   d="scan'208";a="166348621"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 18:00:33 -0700
IronPort-SDR: KS3Q2MPMmR4hzA6BX3wFA5W4ZTgE4BVgWBtN9d6K0JraXbAetqre2n+FMuEAQ3xYV6F7MwO/RB
 ken2QsQHin7A==
X-IronPort-AV: E=Sophos;i="5.77,376,1596524400"; 
   d="scan'208";a="531053664"
Received: from dwillia2-desk3.jf.intel.com (HELO dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 18:00:33 -0700
Subject: [PATCH 0/2] device-dax subdivision v5 to v6 fixups
From: Dan Williams <dan.j.williams@intel.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Brice Goglin <Brice.Goglin@inria.fr>, Vishal Verma <vishal.l.verma@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jia He <justin.he@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Juergen Gross <jgross@suse.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Joao Martins <joao.m.martins@oracle.com>, akpm@linux-foundation.org,
 linux-nvdimm@lists.01.org, linux-mm@kvack.org
Date: Wed, 14 Oct 2020 17:42:04 -0700
Message-ID: <160272252400.3136502.13635752844548960833.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

The v5 series of the device-dax-subdivision series landed upstream which
missed some of the late breaking fixups in v6 [1]. The Xen one is
cosmetic, the kmem one is a functional problem. I will handle the kmem
in a device-dax follow-on pull request post-rc1. The Xen one can go
through the Xen tree at its own pace.

My thanks to Andrew for wrangling the thrash up to v5, and my apologies
to Andrew et al for not highlighting this gap sooner.

[1]: http://lore.kernel.org/r/160196728453.2166475.12832711415715687418.stgit@dwillia2-desk3.amr.corp.intel.com

---

Dan Williams (2):
      device-dax/kmem: Fix resource release
      xen/unpopulated-alloc: Consolidate pgmap manipulation


 drivers/dax/kmem.c              |   48 ++++++++++++++++++++++++++++-----------
 drivers/xen/unpopulated-alloc.c |   14 ++++++-----
 2 files changed, 41 insertions(+), 21 deletions(-)

base-commit: 4da9af0014b51c8b015ed8c622440ef28912efe6

