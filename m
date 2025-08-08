Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC75B1E047
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 03:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073895.1436655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCD4-0000Ml-Eo; Fri, 08 Aug 2025 01:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073895.1436655; Fri, 08 Aug 2025 01:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCD4-0000Ka-BK; Fri, 08 Aug 2025 01:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1073895;
 Fri, 08 Aug 2025 01:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukCD1-0000KU-S6
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 01:47:52 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7f8791-73f9-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 03:47:46 +0200 (CEST)
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
X-Inumbo-ID: ae7f8791-73f9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754617664; x=1754876864;
	bh=PupGkEt+H2hruks94NFk3Xw/txr6q5cPMt03fQ8gads=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IyvJ+BKojN/1QNJRYoqhCV0Qi1A48bs66jVj6TDuBM4cwteRPn0Q+EZvgL0Lmmc0k
	 Y36R6RgZBxYaIFJ1Sm/0gxouucpwlcJxKun0GLU/KWaCn2DEQUSXhpqIWTy5g+dchq
	 /S4R3zF8CpC0XtyVc8F6niI/tnVJoD2TxNzAVl18ppO19qnf4hhI4NF7iKxh+RJ+wX
	 2bYnu8oD3IYiwlDlbDBwAWN/3oIL3n2cGPORTKqNaQexDmdyjMDlE1lfdhaDuv/4EW
	 WpUMz1liIPVRbeL/u2odfQFntEwo8WzU9Lw41gWX/m905JYhKhRWLuxB53i7tEYH5l
	 NFMdzEBkdfw6A==
Date: Fri, 08 Aug 2025 01:47:40 +0000
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] automation/eclair: restrict clean target to xen
Message-ID: <aJVXNofYlNG32ZiU@kraken>
In-Reply-To: <a1127245a45139c3c3fcd05b07c1c1e6dabb66c0.1747387457.git.nicola.vetrini@bugseng.com>
References: <a1127245a45139c3c3fcd05b07c1c1e6dabb66c0.1747387457.git.nicola.vetrini@bugseng.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2f5436f19dcc19127e1753d1dfb035d1ef92496e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 11:53:56PM +0200, Nicola Vetrini wrote:
> The clean target also clears files outside the xen directory,
> which is not needed for the purposes of running an analysis.
>=20
> No functional change.
>=20
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
>  automation/eclair_analysis/prepare.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_an=
alysis/prepare.sh
> index 4285ff26de54..e941e6edc4f3 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -39,12 +39,12 @@ fi
>      fi
>=20
>      ./configure
> -    make clean
> +    make -C xen clean
>      find . -type f -name "*.safparse" -print -delete
>      "${script_dir}/build.sh" "$1"
>      # Generate additional configuration files
>      "${script_dir}/ECLAIR/generate_ecl.sh"
> -    make clean
> +    make -C xen clean
>      cd xen
>      make -f "${script_dir}/Makefile.prepare" prepare
>      # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
> --
> 2.43.0
>=20
>=20


