Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9B55BBB6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 21:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356923.585278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5uIK-0006hf-8B; Mon, 27 Jun 2022 19:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356923.585278; Mon, 27 Jun 2022 19:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5uIK-0006fV-4l; Mon, 27 Jun 2022 19:21:12 +0000
Received: by outflank-mailman (input) for mailman id 356923;
 Mon, 27 Jun 2022 19:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7a8=XC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o5uII-0006ee-HL
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 19:21:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4607ac-f64e-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 21:21:07 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656357661009927.8401575099294;
 Mon, 27 Jun 2022 12:21:01 -0700 (PDT)
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
X-Inumbo-ID: 4a4607ac-f64e-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; t=1656357663; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KB3mDj5erkiy2LXsnOadIyAlqDqc+f+WJTLCb38TbWTtaSGd1P2VIeFDWylLc8+aL7CMy+gQS6AZCgkOBpUNrlLGAni2cUUtGDEEWJBBBIEuIHbjQY9Ig9SAFhIbSQYOMJi03UR0fmcTnwEWrk37ZuknRVrWu8Hs7MX+Lt9viw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656357663; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2CNSh8Lmow9QY3JC7qAJgQkqEVgQUDK0vrwE5w0w8yg=; 
	b=KQyhIZZrlkpdcMXUW6f8bFscwwxuJKxFDvBeejA9in6DPAatr5F4axAg0gxkAYWII1fAmJqVJE4pcjHcSO/A46GKB1tItYLl61exi53s37/udBVjsohY5aVOvyWCSkseXyLv1bS6mVg0v/O6oGpVBVZ4sYuojTi3X3Bal8wR1LY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656357663;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2CNSh8Lmow9QY3JC7qAJgQkqEVgQUDK0vrwE5w0w8yg=;
	b=LIFu59qdnzIuXhvny3vDGsU2n9d22l469wFF/UfI1USMIOacXPevPptEENTw3wmT
	xxOuhJzSY1UCTOS3WDWh1feWNBuBAywLaRsTigHwE7p0mC28BnVNjQ33TDrE18jToCc
	rBNyQfKYrq0RqGqfzPYNUfk3QB8Q9oQ2HaTqvJ5w=
Message-ID: <c2b68766-9608-5910-7937-b7747ad189e7@apertussolutions.com>
Date: Mon, 27 Jun 2022 15:19:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 6/7] xsm/flask: Use unsigned int instead of plain unsigned
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-7-michal.orzel@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220627131543.410971-7-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 6/27/22 09:15, Michal Orzel wrote:
> This is just for the style and consistency reasons as the former is
> being used more often than the latter.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>  xen/xsm/flask/ss/avtab.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
> index 017f5183de..9761d028d8 100644
> --- a/xen/xsm/flask/ss/avtab.c
> +++ b/xen/xsm/flask/ss/avtab.c
> @@ -349,7 +349,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
>      struct avtab_key key;
>      struct avtab_datum datum;
>      int i, rc;
> -    unsigned set;
> +    unsigned int set;
>  
>      memset(&key, 0, sizeof(struct avtab_key));
>      memset(&datum, 0, sizeof(struct avtab_datum));

Is this not v2? Jason gave a Rb on the similar patch if I am not mistaken.

v/r,
dps

