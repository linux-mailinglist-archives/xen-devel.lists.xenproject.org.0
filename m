Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2C533B1A
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 12:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337133.561649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntojb-0006Vo-L0; Wed, 25 May 2022 10:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337133.561649; Wed, 25 May 2022 10:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntojb-0006TM-IC; Wed, 25 May 2022 10:59:23 +0000
Received: by outflank-mailman (input) for mailman id 337133;
 Wed, 25 May 2022 10:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o0G/=WB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ntoja-0006T4-9L
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 10:59:22 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d0e379-dc19-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 12:59:20 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44360)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ntojS-000hX1-jR (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 25 May 2022 11:59:14 +0100
Received: from [10.80.3.190] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CC9E21FB2E;
 Wed, 25 May 2022 11:59:13 +0100 (BST)
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
X-Inumbo-ID: b9d0e379-dc19-11ec-bd2c-47488cf2e6aa
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <21392cc6-55b6-647e-08eb-c818d6229603@srcf.net>
Date: Wed, 25 May 2022 11:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tools/xenstore: fix event sending in introduce_domain()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Luca Miccio
 <lucmiccio@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220525105549.30184-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220525105549.30184-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/05/2022 11:55, Juergen Gross wrote:
> Commit fc2b57c9af46 ("xenstored: send an evtchn notification on
> introduce_domain") introduced a potential NULL dereference in case of
> Xenstore live update.
>
> Fix that by adding an appropriate check.
>
> Coverity-Id: 1504572
> Fixes: fc2b57c9af46 ("xenstored: send an evtchn notification on introduce_domain")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> seeing as I've
just looked at the Coverity report too.

CC'ing the others involved in the original patch just so they're aware
it was broken.

~Andrew

> ---
>  tools/xenstore/xenstored_domain.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index de88bf2a68..ead4c237d2 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -493,9 +493,11 @@ static struct domain *introduce_domain(const void *ctx,
>  		/* Now domain belongs to its connection. */
>  		talloc_steal(domain->conn, domain);
>  
> -		/* Notify the domain that xenstore is available */
> -		interface->connection = XENSTORE_CONNECTED;
> -		xenevtchn_notify(xce_handle, domain->port);
> +		if (!restore) {
> +			/* Notify the domain that xenstore is available */
> +			interface->connection = XENSTORE_CONNECTED;
> +			xenevtchn_notify(xce_handle, domain->port);
> +		}
>  
>  		if (!is_master_domain && !restore)
>  			fire_watches(NULL, ctx, "@introduceDomain", NULL,


