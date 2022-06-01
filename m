Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FCF539AE0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 03:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340155.565114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwDOv-00005X-TN; Wed, 01 Jun 2022 01:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340155.565114; Wed, 01 Jun 2022 01:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwDOv-0008Ug-Qf; Wed, 01 Jun 2022 01:43:57 +0000
Received: by outflank-mailman (input) for mailman id 340155;
 Wed, 01 Jun 2022 01:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwDOt-0008Ua-Gz
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 01:43:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b7b4e15-e14c-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 03:43:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A43C8B8175B;
 Wed,  1 Jun 2022 01:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AC6C385A9;
 Wed,  1 Jun 2022 01:43:51 +0000 (UTC)
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
X-Inumbo-ID: 4b7b4e15-e14c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654047832;
	bh=z6rZJmg35HTbcLY6xC8GV/XUKS+KBk9uUWKRQMRZZoU=;
	h=Date:From:To:cc:Subject:From;
	b=Tg4tIFjEbr0/yDE0vMg37RT+FcqGCA+RE1XNCgLhV9YHRoWkpj7f8TqGuc8SPtWLq
	 OBsXSn/yxhNrY+Svx/9ghrlptqHWXLyhUnfJHJ39LxiLU8nyEUrUR1jbFX9DaWCtFH
	 BxbvhM2rn+Da/AH8aQhyLu21N/eBWYrMBJ/ClRv6+9Qjkdau/OZOZlGhlmb7G+BoHs
	 IH6Cu1dsYwrsi/iKIuUB9V2s/TAHGVTMx0YOLf0u7FM2g6/3PcKhPemBs4r93SBc0C
	 VRBYAvTq7PLFqSJj+oF9N309Jb8kMt1/zJ/kvcIF43y7WctNRxa0fu6UEz+pkB9Wbd
	 jaxWLKbneSqhg==
Date: Tue, 31 May 2022 18:43:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, jbeulich@suse.com, 
    roger.pau@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com
Subject: [PATCH v2 0/2] introduce docs/misra/rules.rst
Message-ID: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch series is a follow-up from the MISRA C meeting last Thursday,
when we went through the list of MISRA C rules on the spreadsheet and
agreed to accept into the Xen coding style the first ones, starting from
Dir 2.1 up until Rule 5.1 (except for Rule 2.2) in descending popularity
order.

This is the full list of accepted rules so far:

Dir 2.1
Dir 4.7
Dir 4.10
Dir 4.14
Rule 1.3
Rule 3.2
Rule 5.1
Rule 6.2
Rule 8.1
Rule 8.4
Rule 8.5
Rule 8.6
Rule 8.8
Rule 8.12

This short patch series add them as a new document under docs/misra as a
list in rst format. The file can be used as input to cppcheck using a
small python script from Bertrand (who will send it to the xen-devel
separately.)

Cheers,

Stefano

