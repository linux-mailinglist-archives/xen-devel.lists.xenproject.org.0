Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A1F44ABC5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 11:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223855.386774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOdF-00006S-2N; Tue, 09 Nov 2021 10:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223855.386774; Tue, 09 Nov 2021 10:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkOdE-0008VX-VW; Tue, 09 Nov 2021 10:45:36 +0000
Received: by outflank-mailman (input) for mailman id 223855;
 Tue, 09 Nov 2021 10:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkOdD-0008VM-7N
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:45:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkOdD-0005AB-51
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:45:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkOdD-0006vp-42
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 10:45:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mkOd0-0004tx-MA; Tue, 09 Nov 2021 10:45:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=xa8/qMuNhYINcNiV8+d2rg7CR8LprJ+dEYaZuTjLmNc=; b=zqbdMK97E0Kbl+AqcAZF/Cg08X
	txkyCONuslZRAYQa1YSEdJWLE0qEqaFg9UvIDIQZ9kh+IHTQUuCEqc/9gKYkE8tiNFSZpfPw3Tqlq
	073gKooU1GqUeuNHdTGpQpQMjTO15vDie3gXl/wMB0yNyCeFjBth5cLptP+h26B0p7Lw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24970.20802.96908.223297@mariner.uk.xensource.com>
Date: Tue, 9 Nov 2021 10:45:22 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org,
    Penny.Zheng@arm.com,
    Bertrand.Marquis@arm.com,
    Wei.Chen@arm.com,
    iwj@xenproject.org,
    Volodymyr_Babchuk@epam.com,
    xen-devel@lists.xenproject.org,
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH for-4.16] xen/arm: don't assign domU static-mem to dom0 as reserved-memory
In-Reply-To: <20211109004808.115906-1-sstabellini@kernel.org>
References: <20211109004808.115906-1-sstabellini@kernel.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("[PATCH for-4.16] xen/arm: don't assign domU static-mem to dom0 as reserved-memory"):
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> DomUs static-mem ranges are added to the reserved_mem array for
> accounting, but they shouldn't be assigned to dom0 as the other regular
> reserved-memory ranges in device tree.
> 
> In make_memory_nodes, fix the error by skipping banks with xen_domain
> set to true in the reserved-memory array. Also make sure to use the
> first valid (!xen_domain) start address for the memory node name.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

