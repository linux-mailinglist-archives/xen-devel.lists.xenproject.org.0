Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C24D3C272A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 17:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153793.284138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sti-0008Li-7P; Fri, 09 Jul 2021 15:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153793.284138; Fri, 09 Jul 2021 15:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sti-0008Jt-4N; Fri, 09 Jul 2021 15:58:38 +0000
Received: by outflank-mailman (input) for mailman id 153793;
 Fri, 09 Jul 2021 15:58:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1stg-0008Jn-7L
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:58:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1stc-0003ma-QU; Fri, 09 Jul 2021 15:58:32 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1stc-00028j-KU; Fri, 09 Jul 2021 15:58:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iwMuUrx8wPTxt8aYxEc7wISOn8P8ja4mwUT0aUygz8s=; b=e6WF/vd5gcrkOVtyEsIJbRIgSq
	JZpOCIx8/+OytpT18hiXvcg+yt2pNZOxtx9HQ7GCQh0ajW8iEocjgzmcIw1K5xLHsw8vsuAGdku0Z
	9tvkdKb9xkx6MYr5zWPXgxsWWhTIxrKqHl8iHRKmuC20Dj7Lv2kX8tv7eVZAPGOmxDK4=;
Subject: Re: gitlab merge request -> list patchbomb workflows
To: Ian Jackson <iwj@xenproject.org>, committers@xenproject.org
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
References: <24808.28606.387467.578829@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8a40ee32-4141-ddc4-4c19-582334f3b245@xen.org>
Date: Fri, 9 Jul 2021 16:58:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <24808.28606.387467.578829@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 09/07/2021 16:48, Ian Jackson wrote:
> At Xen Summit we had another discussion about patch submission and
> review workflows.
> 
> We agreed that it would be a nice idea to conduct another experiment
> with gitlab MRs.  The previous experiment yielded negative results,
> but we think we might be able to do better.
> 
> The shape of the experiment was roughly:
> 
>   * Some robot would convert a gitlab MR into a patchbomb and email
>     it to the list.  (The From: line would be the MR submitter's
>     gitlab profile email address.)
> 
>   * Patch review would be done in the usual way by email.  These emails
>     would naturally end up in the MR submitter's mailbox.
> 
>   * We would initially conduct the experiment with internal submitters,
>     and with short/simple patches.
> 
> Open questions that weren't answered at the time include:
> 
>   * How do we intend to track acked/reviewed status ?  I think
>     patchwork can help with this, but if we keep the series simple
>     perhaps this will be fine.
> 
>   * If a resubmission was needed, how would a v2 post be triggered ?
>     I don't think we have a good answer to this.  I considered tha
>     following possible ultimate possibilities:
> 
>       A. when you update the git branch after the v1 posting,
>          the robot marks the MR as draft.  Repost happe ns when
>          you mark the MR as ready for review
> 
>       B. the robot comments in the gitlab issue, and there is
>          some @robot command to tell it to repost
> 
>     AFAICT there is no code anywhere that would do either of these.
>     I suggest for now we do (B) manually with a human (probably, me)
>     writing comments in the MR.
> 
>   * Who if anyone will fold acked-by/reviewed-by into commit messages
> 
>     We cannot sensibly ask someone using the gitlab MR UI to do this.
>     Also avoiding this manual clerical work was one of the benefits we
>     are hoping to achieve.
> 
>     I therefore suggest that we don't do this folding at all, and use
>     patchwork's UI to review the status of a series.

I am not entirely sure if this is what you are looking for. However, I 
thought I would mention it.

I have recently started to use b4 [1] to fetch patches and collect tags 
from the mailing list. I am wondering if the tools could be extended to 
also allow a quick look through of the review "state" of each patch?

Cheers,

[1] 
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

-- 
Julien Grall

