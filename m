Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77BCB9B9F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 21:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185784.1507764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU9Qm-0006rm-DT; Fri, 12 Dec 2025 20:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185784.1507764; Fri, 12 Dec 2025 20:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU9Qm-0006p9-AT; Fri, 12 Dec 2025 20:08:00 +0000
Received: by outflank-mailman (input) for mailman id 1185784;
 Fri, 12 Dec 2025 20:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5vH=6S=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vU9Qk-0006p3-5q
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 20:07:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ef4a917-d796-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 21:07:55 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3FDF14EEBFD6;
 Fri, 12 Dec 2025 21:07:54 +0100 (CET)
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
X-Inumbo-ID: 3ef4a917-d796-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765570074;
	b=LxU0+FscHcftBD/PEnA28C7HlRr1SZ9lPA8/j0pS0ASKyGPRE3iSVsnZnHTuiusr0HJS
	 JiDk1R8bmdhHLguH1BvUJChWgnITozZ0eH17jYJjdI9ZaW6KIjH+h4bEkIFN0BbYmsdB4
	 4spjXQejUPoGNFn5ib/Hi+Z3tDWNXeIuIC+2kxJWOtedd713XKx1Q5xr2huO/v7KHb0I4
	 XgrSVkVWc8Nrnzrz4YG/ereP3/b7Bi9VY9NyyXPbBLDw43BhCWaySta2qnUV2Fh9oZY/3
	 7xMQ3vM7WeYrGxrsAIUx2tT5k2HkDk5qG9hJmsMW2v4w7yZrcEl4/8D6RFfGC62FHy9oe
	 3gErFKbNmXRx1P/MVIiy0G4d3RW/DItVkGEHrgWkDz4F9c2KlQZOYTLmA7pww1R6pCubY
	 es34CTc3QFhYrVuOXoMvdg8C1jNEmE5Q4mQ187SORO82EcATzzejpqnNZhuWXCINZS5yp
	 bixnMwehelBYy5voiZmf0t0whbMwJJSJ1o6LBriY2HfvJP3VhTHHfugwmKTcnNAIgrbw8
	 kyWmI9lgRd9ZW8jdM/wTF8QLSESKwdYd9uxTXO7pLjHzOiGqWzc6veK8L3Fm5ZfoIuZBi
	 LFS1ATDQDTt7SaB190cRrkZR2ILOpExuwAoTBpEyKSi6tpLk1cSanLq8NDyRcpU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765570074;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=v5iqwXf/fqUGGuVi6Y7XXvEbRJ2bSxhNLCtCvK5BzFc=;
	b=FXNQCrzbwJmfBrJJeYAqdHPYQhK2GzJdalx8+ZCU4SVwFmSEJNTwLGpIKH3iqRlHyyQz
	 VDFWEgoQ4HoMQm1I8zIitqe0r/roVF3OtYSFtBaZ7fGHU35MWnQoosTLfTuk0ZlxEYNyv
	 1KP/FyftZYIyrB1tt3aScU3x+Fz1Vs1lwcbwasijbJOZmQrZaQmaYa8J2I+FGuPho5h0i
	 Z0lL7BZwFGQiq425gO9TZZrIp68rs4d1UWBApkPUHmPeoWs7Az50j40kF6cgMMEpry6kP
	 swnkBkqn7g2FuFuvblmlIUq9SOGBn1zb55vH3SHmWbzCVXbDtwuisaH6bfqxvbLMAuAHl
	 ++sPaAvp93M/TjhxZgfiqhcytkKrDvx5fq8L1DQKmDE8WCB6xn0vwMMlrE+u2HwVs38kt
	 AuUDCg4q6+IIObfPJpUKDGUeBS8wNdzs3AdSJxBydDxjpt9WQI3IijEP3JsDe7YmK97Wi
	 8hho3XfjPY5l5PCutr6GfqQksDtO19vxaKjJ1H7gDdkfz+m9bbPCIPEkvUGxzmnAEDYUe
	 su/uNAs0zRoTzoDnVDtivyiCKM664ryClHXBCLg9FMesu/w0FiJrIL5m33l4byOcGDpGd
	 XfeIc6c5TRAcG4qpjUdJv1KuKM/YJ/ICqAxNf1RwJJqwegd6V5wYzk+acB/1pWY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765570074; bh=Pxt73kFK8GqZjvH/ghjfpPJADZRK9/umb+Xf28kUMHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LJWycPNAj6CKI8FrNDkTJ5HBjhpftXHBNdeBOip5tc9hCVj3XmcLDzCSJe/4OIJKX
	 n020cSa8qlgZYL0ULunJMwPzYt3erYu7NdSUrpdGJ8CAW6hFZ4+QMuhkbZjP0+YnvZ
	 XXsZ/xBrqAtVtl0EawYiqPMLITU+7cYjznnZveOO5E13pMuUWAXkytZzFAKHRAYz3o
	 o0yr5jFtVJJle7PHivAy/PczbViiJrqllKTmll81ZHwFr40RIXAVh/I/Z+BEt4cbul
	 2EO6e0LcvpBMB1k6y/uejRW+tST7xHlWsRyo24N/XNJpFTTWxHl6lj/fC2Zqo0aRZY
	 mFxHDCcYJbjzA==
MIME-Version: 1.0
Date: Fri, 12 Dec 2025 21:07:54 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Victor Lira <victorm.lira@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] automation: prevent eclair-ARM64-amd from running
 by mistake
In-Reply-To: <20251212190850.1357779-1-victorm.lira@amd.com>
References: <20251212190850.1357779-1-victorm.lira@amd.com>
Message-ID: <d5f7b40d6fa93c7484a78de93ed5581c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-12 20:08, Victor Lira wrote:
> It seems unintentional that this job references .eclair-analysis
> instead of .eclair-analysis:triggered which does not apply the rules
> from that template. One effect is that it runs always instead of
> manually in my xen-project/people repo.
> 

Indeed it was a typo. Maybe add a Fixes tag to 2d9908a1d0d3 ? Other than 
that

> Signed-off-by: Victor Lira <victorm.lira@amd.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/gitlab-ci/analyze.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml 
> b/automation/gitlab-ci/analyze.yaml
> index 286faffeb3..e9a8f9d544 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -165,7 +165,7 @@ eclair-ARM64-amd:
>    rules:
>      - if: $ECLAIR_SAFETY
>        when: always
> -    - !reference [.eclair-analysis, rules]
> +    - !reference [.eclair-analysis:triggered, rules]
> 
>  .eclair-analysis:on-schedule:
>    extends: .eclair-analysis
> --
> 2.51.GIT

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

