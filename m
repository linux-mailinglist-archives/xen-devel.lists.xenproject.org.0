Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61298467593
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237329.411624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt671-0005xS-O3; Fri, 03 Dec 2021 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237329.411624; Fri, 03 Dec 2021 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt671-0005uE-L2; Fri, 03 Dec 2021 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 237329;
 Fri, 03 Dec 2021 10:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5e4h=QU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mt670-0005u8-0d
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:48:18 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 848bf863-5426-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 11:48:16 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 163852849217445.058757401994285;
 Fri, 3 Dec 2021 02:48:12 -0800 (PST)
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
X-Inumbo-ID: 848bf863-5426-11ec-b1df-f38ee3fbfdf7
ARC-Seal: i=1; a=rsa-sha256; t=1638528492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TaBRyp4nFoqA/S9tFHNyss1oBo5irgI8QCYvAMI0KM7eebRnAYWtJUt2k5L/uj03VslQgFHgymqQHUUD9Dr1AFhUgmGzd32cn4OYfOSNUgF2xMvPPvaCWfVrPWt7LoSpx2MFdGNfIfX0QM2ygT/X0LwmPZZxmSjZ5nOBql1olaE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1638528492; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1dRofJOzVtY4OZ1Nw1VTYn7dI1mHMPytqIhGHOjfe4k=; 
	b=lPscpkjsVWAN8SxZNKOH/QJTvBv5RUqwmqUyLLwDYOH3yF1wUV2ks7KCuTO4cTRWsJjXaiRXirPIKzELC2o3FFoSyp3yyfCNRMb7QhJBNfcRjZ9cWLKlL9wRai1bDudEv+TXm+uIj8l1xfLvVRrh1MDINXKh+wVU4WR5CnD0NSw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1638528492;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1dRofJOzVtY4OZ1Nw1VTYn7dI1mHMPytqIhGHOjfe4k=;
	b=UqoOenT7jSMIfJOTU63EQZUo58BsRsVs/wO0Cw+8Wbzpqr4SmUOjcaStEo5X7Jps
	oX8ybL6Yn4OdgjfHXxgSZ/Azkz7LkTxVfBuhSovDt0o4Ketn9+UJVmJq4DhgALz7j/B
	XZvjYRpiHnkoKVFJ0bZlz3GoUWTAwPDwZxBW3JHs=
Subject: Re: [PATCH 0/2] xsm: Further fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211201111555.16408-1-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <06b3cac9-7cd5-7402-f6ad-7d82a43eb8df@apertussolutions.com>
Date: Fri, 3 Dec 2021 05:47:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211201111555.16408-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/1/21 6:15 AM, Andrew Cooper wrote:
> Andrew Cooper (2):
>    xsm: Switch xsm_ops to __alt_call_maybe_initdata
>    xsm: Drop extern of non-existent variable
> 
>   xen/include/xsm/xsm.h | 2 --
>   xen/xsm/xsm_core.c    | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

