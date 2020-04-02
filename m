Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49819C3FB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 16:26:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK0mY-0005KU-Qm; Thu, 02 Apr 2020 14:25:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK0mX-0005KP-MK
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 14:25:21 +0000
X-Inumbo-ID: c819ff5c-74ed-11ea-bbf0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c819ff5c-74ed-11ea-bbf0-12813bfff9fa;
 Thu, 02 Apr 2020 14:25:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34489AC26;
 Thu,  2 Apr 2020 14:25:19 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH] tools/xenstore: fix a use after free problem
 in xenstored
To: xen-devel@lists.xenproject.org
References: <20200324101257.20781-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1599c563-483c-05e1-9dc7-2d2ddf10d9c7@suse.com>
Date: Thu, 2 Apr 2020 16:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324101257.20781-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping?

On 24.03.20 11:12, Juergen Gross wrote:
> Commit 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object
> twice") introduced a potential use after free problem in
> domain_cleanup(): after calling talloc_unlink() for domain->conn
> domain->conn is set to NULL. The problem is that domain is registered
> as talloc child of domain->conn, so it might be freed by the
> talloc_unlink() call.
> 
> Fixes: 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object twice")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_domain.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index baddaba5df..5858185211 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -214,6 +214,7 @@ static void domain_cleanup(void)
>   {
>   	xc_dominfo_t dominfo;
>   	struct domain *domain;
> +	struct connection *conn;
>   	int notify = 0;
>   
>    again:
> @@ -230,8 +231,10 @@ static void domain_cleanup(void)
>   				continue;
>   		}
>   		if (domain->conn) {
> -			talloc_unlink(talloc_autofree_context(), domain->conn);
> +			/* domain is a talloc child of domain->conn. */
> +			conn = domain->conn;
>   			domain->conn = NULL;
> +			talloc_unlink(talloc_autofree_context(), conn);
>   			notify = 0; /* destroy_domain() fires the watch */
>   			goto again;
>   		}
> 


