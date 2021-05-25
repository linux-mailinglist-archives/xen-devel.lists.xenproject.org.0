Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5238FD17
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 10:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132100.246532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llSg0-00019n-NP; Tue, 25 May 2021 08:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132100.246532; Tue, 25 May 2021 08:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llSg0-000174-KK; Tue, 25 May 2021 08:44:36 +0000
Received: by outflank-mailman (input) for mailman id 132100;
 Tue, 25 May 2021 08:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llSfz-00016y-Me
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 08:44:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c42afd9b-235a-4f33-834b-5848992670a1;
 Tue, 25 May 2021 08:44:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C35E3AEAE;
 Tue, 25 May 2021 08:44:33 +0000 (UTC)
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
X-Inumbo-ID: c42afd9b-235a-4f33-834b-5848992670a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621932273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wMF+8OHJAPX0xw9IVTDsZ1Nv9fXbJdPoT6ypLs9eL4=;
	b=UwbrOqPJeo4a25lIwTfLRaopvEPTqiI50dvZ4l/i/264QEhTlKhzkPHsboyMg3ybzNfFeD
	QXF2M1QlU0VReVD0EtFB7h6QoTu/OIh/j0YaRIddUy4exdBvKPlmaC69767kJGhvK8iXwv
	wBolz+1CQQtbtMHNwm3M78kimsJELRk=
Subject: Re: [PATCH v4 2/4] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <f76852db6601b1bf243781b0b8b16c7a6fdc8a01.1621712830.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b872d59-4330-68ee-c62b-230f5d6cb2cf@suse.com>
Date: Tue, 25 May 2021 10:44:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <f76852db6601b1bf243781b0b8b16c7a6fdc8a01.1621712830.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.05.2021 16:34, Connor Davis wrote:
> The variables iommu_enabled and iommu_dont_flush_iotlb are defined in
> drivers/passthrough/iommu.c and are referenced in common code, which
> causes the link to fail when !CONFIG_HAS_PASSTHROUGH.
> 
> Guard references to these variables in common code so that xen
> builds when !CONFIG_HAS_PASSTHROUGH.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>

Somewhat hesitantly
Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -51,9 +51,15 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
>      return dfn_x(x) == dfn_x(y);
>  }
>  
> -extern bool_t iommu_enable, iommu_enabled;
> +extern bool_t iommu_enable;

... just "bool" used here, as I think I did say before. Can be taken
care of while committing, I think.

Jan

