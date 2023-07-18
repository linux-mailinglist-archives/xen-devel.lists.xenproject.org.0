Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332D758642
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 22:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565480.883627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrbJ-0003Oc-5y; Tue, 18 Jul 2023 20:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565480.883627; Tue, 18 Jul 2023 20:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrbJ-0003M8-3I; Tue, 18 Jul 2023 20:47:17 +0000
Received: by outflank-mailman (input) for mailman id 565480;
 Tue, 18 Jul 2023 20:47:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLrbI-0003Lz-BI
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 20:47:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrbH-0003pH-IC; Tue, 18 Jul 2023 20:47:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrbH-0006yX-Bq; Tue, 18 Jul 2023 20:47:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=tGIRZSeijg/akSjbgvitaZxe8jfjTbwXxoc9mPLpy0o=; b=h1+D1wrWiXswLiAHiQLTMabqby
	+/GNGxd/qCUFssCfDOgODCbML5uvL+r5j0D+fx2a0YQxlX/hlF9B4MbZYshEpXEOY5ybuUDzmVisj
	Mkql27MswFde11toEc3txKEDUYX1n+7hx05M15H1wCc3A2zM+XzA0VgJMaHGklPs27oo=;
Message-ID: <82fabb4c-394d-cf1e-6cb5-cfe0542eec53@xen.org>
Date: Tue, 18 Jul 2023 21:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/18] tools/xenstore: add wrapper for tdb_fetch()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230710065947.4201-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Add a wrapper function for tdb_fetch taking the name of the node in
> the data base as a parameter. Let it return a data pointer and the
> length of the data via a length pointer provided as additional
> parameter.
> 
> Move logging of the TDB access from the callers into the wrapper.
> 
> This enables to make set_tdb_key() and tdb_ctx static.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

