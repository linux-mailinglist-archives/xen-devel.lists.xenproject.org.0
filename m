Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4695B64AE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 02:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406080.648474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXuCv-00031y-2Q; Tue, 13 Sep 2022 00:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406080.648474; Tue, 13 Sep 2022 00:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXuCu-0002yd-VI; Tue, 13 Sep 2022 00:55:20 +0000
Received: by outflank-mailman (input) for mailman id 406080;
 Tue, 13 Sep 2022 00:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oXuCu-0002yX-5R
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 00:55:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc4e1ebc-32fe-11ed-9760-273f2230c3a0;
 Tue, 13 Sep 2022 02:55:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B21C661259;
 Tue, 13 Sep 2022 00:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A5DC433D6;
 Tue, 13 Sep 2022 00:55:16 +0000 (UTC)
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
X-Inumbo-ID: bc4e1ebc-32fe-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663030517;
	bh=ms+NxKiMLXxJiTg76z9itivlYrNHYd8j4xIAbBFQvmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AWTWodT3cKXs6uxglQg6TRmrYQN/eEd3dyrVgEuyjIIKaXgJg0SNVe7cDLU4KSzkB
	 TnaXlfx4rE4Lwdq9izG9BR7hLfKnK7g2r3HdVlXLZ6DoBiulVSomRGup22ADz/XFPy
	 OT3UyhWHlXn89BRswd8VlPXtt2a57dd1LNl3sWIIfwNMklkSojBptmgX+fEky2+jtV
	 WBobDC3QhqfPwDCgT1sZRdxNCkmNcUQ9XQBWVWkEscg3pDtCRFtOLIhjBIhcqE+rVS
	 BjHfTMZ66LY3Cmke2BErWow8zLS/JNlZTUbSBMDpZYUkRCcZWn3qIh7+uEwLpmylBQ
	 hHsjB0oqfbf4g==
Date: Mon, 12 Sep 2022 17:55:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder 1/2] Refactor sanity_check_partial_dts
In-Reply-To: <64edb22b-eda8-2274-004e-9a036a972614@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209121755050.157835@ubuntu-linux-20-04-desktop>
References: <20220912115934.19552-1-michal.orzel@amd.com> <20220912115934.19552-2-michal.orzel@amd.com> <64edb22b-eda8-2274-004e-9a036a972614@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Sep 2022, Ayan Kumar Halder wrote:
> On 12/09/2022 12:59, Michal Orzel wrote:
> > Currently function sanity_check_partial_dts from scripts/common takes
> > three arguments where the last two (repo, dir) are used always in
> > conjuction to form a path to a directory storing partial dts. Modify the
> > function to take only two arguments where the second one is to be a path
> > to a directory storing partial dts. This will help reusing this function
> > in the future to perform sanity checks on partial dts that do not
> > originate from a repository.
> > 
> > Modify compile_merge_partial_dts to take this change into account.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >   scripts/common | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/scripts/common b/scripts/common
> > index 25c041270c29..ccad03d82b30 100644
> > --- a/scripts/common
> > +++ b/scripts/common
> > @@ -40,8 +40,7 @@ function get_next_phandle()
> >   function sanity_check_partial_dts()
> >   {
> >       local domU_passthrough_path="$1"
> > -    local repo="$2"
> > -    local dir="$3"
> > +    local partial_dts_dir="$2"
> >       local address_cells_val
> >       local size_cells_val
> >       local tmpdtb
> > @@ -51,7 +50,7 @@ function sanity_check_partial_dts()
> >       for devpath in $domU_passthrough_path
> >       do
> >           file=${devpath##*/}
> > -        file="$repo"/"$dir"/"$file".dts
> > +        file="$partial_dts_dir"/"$file".dts
> >             if ! test -f "$file"
> >           then
> > @@ -96,6 +95,7 @@ function compile_merge_partial_dts()
> >       local dtb_dir=$1
> >       local repo=$(echo "$2" | awk '{print $1}')
> >       local dir=$(echo "$2" | awk '{print $2}')
> > +    local partial_dts_dir
> >       local tmp
> >       local tmpdts
> >       local file
> > @@ -123,6 +123,7 @@ function compile_merge_partial_dts()
> >           dir="."
> >       fi
> >   +    partial_dts_dir="$repo"/"$dir"
> >       i=0
> >       while test $i -lt $NUM_DOMUS
> >       do
> > @@ -132,7 +133,7 @@ function compile_merge_partial_dts()
> >               return 1
> >           fi
> >   -        sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$repo"
> > "$dir"
> > +        sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}"
> > "$partial_dts_dir"
> >           if test $? -ne 0
> >           then
> >               return 1
> > @@ -146,7 +147,7 @@ function compile_merge_partial_dts()
> >           for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
> >           do
> >               file=${devpath##*/}
> > -            file="$repo"/"$dir"/"$file".dts
> > +            file="$partial_dts_dir"/"$file".dts
> >                 # All the subsequent dts files should not have dts version
> > mentioned
> >               if test $j -gt 1
> 

