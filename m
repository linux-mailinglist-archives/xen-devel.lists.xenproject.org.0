Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F869318E5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759209.1168831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTP1r-0003Rm-T1; Mon, 15 Jul 2024 16:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759209.1168831; Mon, 15 Jul 2024 16:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTP1r-0003P7-Pd; Mon, 15 Jul 2024 16:58:23 +0000
Received: by outflank-mailman (input) for mailman id 759209;
 Mon, 15 Jul 2024 16:58:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sTP1q-0003P1-By
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:58:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTP1q-0002KA-7U; Mon, 15 Jul 2024 16:58:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTP1q-0007yp-1O; Mon, 15 Jul 2024 16:58:22 +0000
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
	bh=lCziwif5S7EsgbO8ZmKIhaQfkLcRDa5dkscscSXfmP8=; b=K9sgQsQtYRjE0Gd606Bj2MAP4g
	f9rzgp7oed09jmjk3WIKF3RjSktZivtWKSfZP7y029moTPy1AwzJwEMnk6oPUDcUE0ozzwwn4HoRd
	Fwo303FFc+A0WTItyHb6GEv4FM33ibJJq/r01ZZxQP7KwEoS26jOBNAE8yLbaO9V1hyk=;
Message-ID: <7db0879f-93a3-4690-8ba5-1f0897027e47@xen.org>
Date: Mon, 15 Jul 2024 17:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC for-4.19] docs/checklist: Start tagging new dev
 windows
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240715164639.3378294-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240715164639.3378294-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 15/07/2024 17:46, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With one remark below:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> This is about figuring out when a change was first introduced.  Take
> 10b719dc88 for example (completely random pick).
> 
> The right answer is `git tag --contains $sha` and look for the oldest
> RELEASE-$X.  In this case it's Xen 4.6, but the tags are not numerically
> sorted so the answer is towards the end of the list of 166 tags.
> 
> The better answer would be to `git describe $sha` because git has an algorithm
> to do this nicely.  In this case, it's 4.5.0-rc4-934-g10b719dc8830 because we
> branch first and tag RELEASE-4.6.0 on the branch, rather than releasing off
> master.
> 
> With 0082626f35af (opening of the 4.6 tree) containing an annotated tag of
> 4.6-dev, git describe now gives 4.6-dev-902-g10b719dc8830 which far more
> helpful when doing code archeology.

I think some of this explanation should be in the commit message.

> 
> I propose that we retroactively tag each commit which opened a new dev
> tree (the commit which changes the version number)
> 
> Looking back in history, Keir did used to tag the point that the tree
> branched, but that seems to have stopped when moving from HG to git.
> 
> Thoughts?
> ---
>   docs/process/branching-checklist.txt          | 3 ++-
>   docs/process/release-technician-checklist.txt | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
> index 3dfa8ec2570b..b2bb9ac1fa00 100644
> --- a/docs/process/branching-checklist.txt
> +++ b/docs/process/branching-checklist.txt
> @@ -79,7 +79,8 @@ The variables and there content should be:
>   Where X.Y is the release version (e.g. 4.17).
>   
>   Update newly diverging staging (unstable) according to
> -release-technician-checklist.txt section re README etc.
> +release-technician-checklist.txt section re README etc.,
> +including tagging the new dev window.
>   
>   Update newly diverging staging-$v according to
>   release-technician-checklist.txt section re README etc.,
> diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
> index e6db02b87585..7d2d90e57e7b 100644
> --- a/docs/process/release-technician-checklist.txt
> +++ b/docs/process/release-technician-checklist.txt
> @@ -79,6 +79,8 @@ t=RELEASE-$r
>   #           - xen/Kconfig.debug
>   #                 config DEBUG
>   #                     default n
> +#
> +#    - tag staging branch for the new dev window.  e.g. 4.20-dev
>   
>   * tag xen-unstable
>   
> 
> base-commit: 1ddc8c1bad93aa6cbfe616dd72333460c47f96c9
> prerequisite-patch-id: 2ea535e6248ebf47b5db0c59db0f4fcfc7a74cf9

Cheers,


-- 
Julien Grall

