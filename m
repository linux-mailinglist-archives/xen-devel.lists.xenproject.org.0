Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8644BABC1FA
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989925.1373884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2Cn-0007Ma-F2; Mon, 19 May 2025 15:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989925.1373884; Mon, 19 May 2025 15:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2Cn-0007L9-CM; Mon, 19 May 2025 15:15:05 +0000
Received: by outflank-mailman (input) for mailman id 989925;
 Mon, 19 May 2025 15:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=58Im=YD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uH2Cl-0007L3-5v
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:15:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08801f11-34c4-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 17:15:01 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 787C14EE7C57;
 Mon, 19 May 2025 17:15:00 +0200 (CEST)
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
X-Inumbo-ID: 08801f11-34c4-11f0-a2fa-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747667700;
	b=r7OdQw9WvJj46nDDCjFbjrjiDTxKJ7EBON5dm2ClweIrNUiml7nhDuRYtiMSV/69ZGir
	 RAD+kbIfSekcIPlt8wBJhIQFo7+5KMH6Pzi0ciJxUJz5LQ8yCJjaultYHJtoBpTL/WKQY
	 t073dSLjc/0p3KJIXp/H5zwKBTAwQRpsi5zvcGd4eLM2yGczhVCnjr0zSKbHg7uniLzRF
	 4tWcob4wkvHl02I3c8e0Q3lcTvIgSz40wvq3jjbFQHLO6eQGJqX7kSISlRes2aoLC5XTs
	 MkXetmLio3ifJJI5Ai5hWLRUPMLWf6GMQ9ejdIQ7BB5ABazmNKzdC0AyJtBvDRwj1smQO
	 TWoutxAU7Uorc5MveheRNvXmtLCQAMUU/IN858MrkMyhzw1edEyYtZsYkyKl2D44a54jM
	 GWUEiD/qD+/uGlQIqC3GAas2UahxT4VB0CS/Gm0a0KXQV5XzXCBMk+D+dpS5pUtmZjXXO
	 tUkDuEWiuLPmBtfYs6PAMLz8pFNFThUpYq0EyqTjQr/Jx2pGhLouhWlts4A2va/uTpwvr
	 8de8pM5yV50BI2Qrw2MPCXPKJihJV2ptZztC+1rLXvb/H9B+99YOvoGcwhfTG3cjRF5sv
	 Rc0PIDATUHkZst2kY3jSM0xEPw9tKqZBvX5zfwkq3ntGG1cEWNVZX91I6jYqKWQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747667700;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=qVzn3AOUy75+D8+1BCusQ2C+wmjsH38vyex5rXrAK4w=;
	b=SQ5MzuXl4h7Syrayu0zWZVOmRKMRhKaZ0zgmxLTx3XrOmFnCYv99KHd1HpPaF8KlT/ei
	 FvHCZx3A/isCrBSA7Z24FBt67tjrNqO+RjMCg94n/zAvmH1vPBn004dAiMpmyDsWd1ItI
	 w0PUTg3ZxBBupFHcSByykHxT9nCdzm4UYPzT7KfjnaXc0hptYv/KUUVkbuCPNJNoquh6q
	 BljqNlNfbiBJqAbrxC+i7A5xc1CgC9u6V6GyJlzD6w3Tzk1o+Fweo8PFnjDIBPArOAfH0
	 0z9+MbqPnYPsxhyaNpPZBhXGUeF5YOwTyBWQfsQDyz1BUqx7Tg55+vIgfHlYI1zuHIpFW
	 66bcUYgcD+ndScyQLgBRThUEkuYZYowxHLMqMMohIy66Lkybl3PEwhJsX6GP5m+x+s3wz
	 epLUCmZXGcN7oGOLah+iN5FjHdE50n0ApfPTdBWJL2JCi8nqWCn71tlq3mzQriwonCmcO
	 7zqYVTrLlbONc00JiorEcg1q6t3kSu7udt/IOw0J7qMfhqbisUhD9Uc6ozxgHz3kQKLX1
	 xL9GCGKa0ev3CFbdGhUZ1UQrXjjwJ3vzhXxyxdlxfK7bXs/xgZFr1jExjviQkKO51VWoS
	 dQsIJZfLbxhq75uTfpEEZpYSLLt8gz8uHeNEle5DWR8Xc1tZLOTVJsT0T94poMk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747667700; bh=feJXjqyqU3ntfNDa8kJF+mxgPRRU6ZYDyK/9cg/8egc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ap7nZUJgoVVpzsAN/LtnbsOsozOzWxNP9aHAbs8p7V30a8kwT46xOVnAqCukAvS1l
	 LWyUT1Cg8Qm04LF2UkNnfabgZf+2zQvc3pObcEeoASKdM3G12z54EzzAg6fbuLVi4H
	 6rnFdl5X0YSUo+9vzGG/4Kr7cI3ScMFLZeHQqM5vNndIi4goY6hXPdYoGhoHu8Mqen
	 uOpfk88QjJwgK+Ka8Jjuqx37WcQLZRMr5qMp3f6BFHh7k8pfjGq2+GWG5B+6YlHn3e
	 pjfkQcFyzpWzLnyIGz7qg+jNiRD4abuz557ZZeSA3gTiAy3HPy597HV6Z+/UmiwPXq
	 83e4f5ml+n2HA==
MIME-Version: 1.0
Date: Mon, 19 May 2025 17:15:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH] CI/eclair: Remove ARM64 custom clean rules
In-Reply-To: <20250519140727.28562-1-andrew.cooper3@citrix.com>
References: <20250519140727.28562-1-andrew.cooper3@citrix.com>
Message-ID: <a99e1aaec90e51fea610a218e6f01ba4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-19 16:07, Andrew Cooper wrote:
> Rules 5.3, 11.2 and 16.6 are already listed in clean_guidelines_common 
> and
> apply to all architectures.  There's no need for arm64 to give them a 
> second
> time.
> 

Thanks.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> I've left the x86/arm split as-before so it's easier for those not 
> familiar
> with Eclair syntax to add per-arch configuruation.
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
> b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 7e3095423b79..b95f07feb099 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -122,7 +122,7 @@ if(string_equal(target,"x86_64"),
>  )
> 
>  if(string_equal(target,"arm64"),
> -    
> service_selector({"additional_clean_guidelines","MC3A2.R5.3||MC3.R11.2||MC3A2.R16.6"})
> +    service_selector({"additional_clean_guidelines","none()"})
>  )
> 
>  
> -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> 
> base-commit: 6fc02ebdd053856221f37ba5306232ac1575332d
> prerequisite-patch-id: 7bc1c498ba2c9c4a4939a56a0006f820f47f2a66
> prerequisite-patch-id: 8fcd84101ab012ed0aa427c30eca564c5ac10726

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

