Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2FCA404BA
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2025 02:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894743.1303461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tleQC-0001NG-OL; Sat, 22 Feb 2025 01:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894743.1303461; Sat, 22 Feb 2025 01:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tleQC-0001K8-LN; Sat, 22 Feb 2025 01:35:12 +0000
Received: by outflank-mailman (input) for mailman id 894743;
 Sat, 22 Feb 2025 01:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tleQB-0001Jh-El
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 01:35:11 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04::f03c:95ff:fe5e:7468])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc1e0ad-f0bd-11ef-9896-31a8f345e629;
 Sat, 22 Feb 2025 02:35:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B91846116F;
 Sat, 22 Feb 2025 01:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF063C4CED6;
 Sat, 22 Feb 2025 01:35:05 +0000 (UTC)
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
X-Inumbo-ID: 3fc1e0ad-f0bd-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740188107;
	bh=+J/Rs/pBcsq9TOXQGhM6W++S3/kGdcoLAtm2gTcSdr8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BINAVE0Nyql+o9JYgtKqi4wraoyPb9Xm1E4kUBN1Xqh6yFn+cjfWjrmzXy+xqzMJq
	 vt805oZUUQVP/YFLfq8n+w3tR2v0Tb3CG0Sd6xWBR+sr++3EejHs4qlZ7LuQgISMl/
	 8uCi/Ycs96tXw/PY914Vum8d0ukWAgwO7bCwi693p6gWgy6rBerBl0191atawH/VDW
	 OccyIRYPbsVcYUjz4X6ohT0tK2Z5ksMe3kB4/AUmflnytL0q6B6iqMhhuOOKpnThRu
	 C+8tEcPmbEDqKcey1tnEl/eQKsoYTv933ZIBH4VU7zyoF+95LgprnRyNjKD9SvH1L2
	 r5tpIr4uj8A2Q==
Date: Fri, 21 Feb 2025 17:35:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] scripts: Fix git-checkout.sh to work with non-master
 branches (take 2)
In-Reply-To: <20250221223432.882705-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502211734570.1791669@ubuntu-linux-20-04-desktop>
References: <20250221223432.882705-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-21574023-1740188107=:1791669"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-21574023-1740188107=:1791669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 21 Feb 2025, Andrew Cooper wrote:
> First, rename $TAG to $COMMITTISH.  We already pass tags, branches (well, only
> master) and full SHAs into this script.
> 
> Xen uses master for QEMU_UPSTREAM_REVISION, and has done for other trees too
> in the path.  Apparently we've never specified a different branch, because the
> git-clone rune only pulls in the master branch; it does not pull in diverging
> branches.
> 
> Fix this by performing an explicit fetch of the $COMMITTISH, then checking out
> the dummy branch from the FETCH_HEAD.
> 
> Suggested-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Jason Andryuk <jason.andryuk@amd.com>
> 
> A second attempt, given that c554ec124b12 ended up having to be reverted.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1683296906
> ---
>  scripts/git-checkout.sh | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
> index fd4425ac4ee8..a22540a2a5bb 100755
> --- a/scripts/git-checkout.sh
> +++ b/scripts/git-checkout.sh
> @@ -1,12 +1,12 @@
>  #!/bin/sh
>  
>  if test $# -lt 3; then
> -	echo "Usage: $0 <tree> <tag> <dir>"
> +	echo "Usage: $0 <tree> <committish> <dir>"
>  	exit 1
>  fi
>  
>  TREE=$1
> -TAG=$2
> +COMMITTISH=$2
>  DIR=$3
>  
>  set -e
> @@ -15,10 +15,11 @@ if test \! -d $DIR-remote; then
>  	rm -rf $DIR-remote $DIR-remote.tmp
>  	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
>  	$GIT clone $TREE $DIR-remote.tmp
> -	if test "$TAG" ; then
> +	if test "$COMMITTISH" ; then
>  		cd $DIR-remote.tmp
> +		$GIT fetch origin $COMMITTISH
>  		$GIT branch -D dummy >/dev/null 2>&1 ||:
> -		$GIT checkout -b dummy $TAG
> +		$GIT checkout -b dummy FETCH_HEAD
>  		cd -
>  	fi
>  	mv $DIR-remote.tmp $DIR-remote
> -- 
> 2.39.5
> 
--8323329-21574023-1740188107=:1791669--

