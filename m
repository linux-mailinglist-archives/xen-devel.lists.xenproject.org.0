Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A71A7536
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 09:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOGMi-0007wH-5d; Tue, 14 Apr 2020 07:52:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOGMg-0007wC-Aj
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 07:52:14 +0000
X-Inumbo-ID: d98ea284-7e24-11ea-88fa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d98ea284-7e24-11ea-88fa-12813bfff9fa;
 Tue, 14 Apr 2020 07:52:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B39DDAC12;
 Tue, 14 Apr 2020 07:52:10 +0000 (UTC)
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200410164942.9747-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
Date: Tue, 14 Apr 2020 09:52:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410164942.9747-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
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
Cc: lars.kurth@citrix.com, julien@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.04.2020 18:49, Stefano Stabellini wrote:
> Create a new document under docs/process to describe our special tags.
> For now, only add the new backport tag.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> Acked-by: Wei Liu <wl@xen.org>
> CC: jbeulich@suse.com
> CC: george.dunlap@citrix.com
> CC: julien@xen.org
> CC: lars.kurth@citrix.com
> CC: andrew.cooper3@citrix.com
> CC: konrad.wilk@oracle.com
> 
> ---
> 
> This is the original thread: https://marc.info/?l=xen-devel&m=157324027614941
> 
> The backport tag was agreed upon.

Well, sort of.

> George requested the file to be
> renamed to something more generic, where we could add more information
> later.
> 
> I kept the original content and acked-by. I renamed the file to
> tags.pandoc.
> ---
>  docs/process/tags.pandoc | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 docs/process/tags.pandoc
> 
> diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
> new file mode 100644
> index 0000000000..e570efdcc8
> --- /dev/null
> +++ b/docs/process/tags.pandoc
> @@ -0,0 +1,23 @@
> +Backport Tag
> +------------
> +
> +A backport tag is an optional tag in the commit message to request a
> +given commit to be backported to the stable trees:

Insert "fully maintained"?

> +    Backport: all
> +
> +It marks a commit for being a candidate for backports to all relevant
> +trees.

I'm unconvinced of the utility of this form - what "all" resolves to
changes over time. There's almost always a first version where a
particular issue was introduced. If we want this to be generally
useful, imo we shouldn't limit the scope of the tag to the upstream
maintained stable trees.

> +    Backport: 4.9+
> +
> +It marks a commit for being a candidate for backports to all stable
> +trees from 4.9 onward.
> +
> +Maintainers request the Backport tag to be added on commit.
> +Contributors are also welcome to mark their patches with the Backport
> +tag when they deem appropriate. Maintainers will request for it to be
> +removed when that is not the case.
> +
> +Please note that the Backport tag is a **request** for backport, which
> +will still need to be evaluated by the stable tree maintainers.

Now that we see more widespread use of the Fixes: tag, with there
being effectively some overlap between the information conveyed I
think there should be some mention of this. Not the least there's the
risk of the Backport: one to become stale when a flaky commit gets
backported - the Fixes: tag doesn't have this issue.

Jan

