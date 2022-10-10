Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD35FA720
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 23:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419379.664132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi0XN-0006UM-1c; Mon, 10 Oct 2022 21:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419379.664132; Mon, 10 Oct 2022 21:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi0XM-0006RO-Ua; Mon, 10 Oct 2022 21:42:12 +0000
Received: by outflank-mailman (input) for mailman id 419379;
 Mon, 10 Oct 2022 21:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zPM=2L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oi0XL-0006RI-2Q
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 21:42:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 644c34ad-48e4-11ed-8fd0-01056ac49cbb;
 Mon, 10 Oct 2022 23:42:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86E07B80E41;
 Mon, 10 Oct 2022 21:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB6CC433D6;
 Mon, 10 Oct 2022 21:42:06 +0000 (UTC)
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
X-Inumbo-ID: 644c34ad-48e4-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665438127;
	bh=vGkDy70hnp9OjlQ/BdLF7CswwyQr80qNtWkcWXNI9L0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PYqXduc8FTxN7CVdK/SDITZhOOWSzLbTiIhjIh6uCQI1eMzqF98loXwbql4pf60jM
	 tR+FkA3CEFBF61kvow3+nb31EoTOT4XEcw2r9Izay6tl0DHTFbQQEQCG16eb5JX2rm
	 7oJShy0+hhxAcH27Pnjpb3cer9V4cvurG5QabqdJoRqegnXZLT4w2eBFBPgOS5K0Yx
	 PQvrwFPHwpN31WnJucO2THfWdc5iR84SMBtQsiES8Jg29EQU394lO7/3IlmWCBmEaW
	 98J+EyTxcD1LI2P+PCsqqiNo+pS7xIXIRXX8oDelEEZPkle9SvcNvpstRDrkMSkWh7
	 T/8I9E4Kx+ROw==
Date: Mon, 10 Oct 2022 14:42:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder v2] Add support for 64-bit addresses/sizes
In-Reply-To: <890ee988-34ff-38c4-3ffa-70abe00d3df8@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210101424330.3690179@ubuntu-linux-20-04-desktop>
References: <20221010072947.8300-1-michal.orzel@amd.com> <4fc23936-4bfd-635c-b3a2-554e280ce884@gmail.com> <f052cf3f-529c-2156-f058-2a320a4f1b02@amd.com> <81ac614e-ca88-5f14-bd76-eaa20c9270bc@gmail.com> <890ee988-34ff-38c4-3ffa-70abe00d3df8@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Oct 2022, Michal Orzel wrote:
> On 10/10/2022 12:48, Xenia Ragiadakou wrote:
> > 
> > 
> > On 10/10/22 12:48, Michal Orzel wrote:
> >> Hi Xenia,
> >>
> >> On 10/10/2022 10:52, Xenia Ragiadakou wrote:
> >>>
> >>>
> >>> On 10/10/22 10:29, Michal Orzel wrote:
> >>>
> >>> Hi Michal
> >>>
> >>>> At the moment, ImageBuilder assumes that all addresses/sizes are
> >>>> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
> >>>> value for the first cell. Because of that, we cannot specify
> >>>> MEMORY_START and MEMORY_END to be above 32-bits (e.g. to place the images
> >>>> in the upper memory bank).
> >>>>
> >>>> Add support to properly handle 64-bit addresses/sizes:
> >>>>    - add function split_into_halves to split the value passed as a first
> >>>>      argument into upper and lower halves. These are then set as values for
> >>>>      variables passed respetively as the second and third argument,
> >>>
> >>> s/respetively/respectively/
> >> Ok.
> >>
> >>>
> >>>>    - add function split_addr_size to split address and size and form a
> >>>>      string to be passed to dt_set as data argument for reg property.
> >>>>
> >>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >>>> ---
> >>>> Changes in v2:
> >>>> - redesign a patch based on master-next instead of NXP dynamic assignment patch
> >>>> ---
> >>>>    scripts/uboot-script-gen | 33 ++++++++++++++++++++++++++++-----
> >>>>    1 file changed, 28 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> >>>> index b24dca2b7f7e..09d237d192c1 100755
> >>>> --- a/scripts/uboot-script-gen
> >>>> +++ b/scripts/uboot-script-gen
> >>>> @@ -22,6 +22,29 @@ function dt_mknode()
> >>>>        fi
> >>>>    }
> >>>>
> >>>> +# Usage:
> >>>> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
> >>>> +function split_into_halves()
> >>>> +{
> >>>> +    local value=$1
> >>>> +    local upper=$2
> >>>> +    local lower=$3
> >>>> +
> >>>> +    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
> >>>> +    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
> >>>> +}
> >>>> +
> >>>> +function split_addr_size()
> >>>> +{
> >>>> +    local addr=$1
> >>>> +    local size=$2
> >>>> +
> >>>> +    split_into_halves $addr addr_upper addr_lower
> >>>> +    split_into_halves $size size_upper size_lower
> >>>> +
> >>>
> >>> Just a minor observation, the variables addr_upper, addr_lower,
> >>> size_upper and size_lower can be declared local.
> >>>
> >> This function is to be called to perform substitution and as such
> >> is always executed within a subshell so no need for local.
> > 
> > So split_addr_size() is supposed to be executed only in a subshell ...
> > Ok I did not think of that. So neither addr or size need to be declared
> > local.
> Exactly, but in ImageBuilder we don't seem to use $1, $2, ... directly so
> that is why I added local only for the arguments passed to this function.

Thanks Michal for the patch and Xenia for the review.

I like to use local, not just because of necessity, but also just as a
way to "tag" variables that we know are not going to be used outside a
specific function. Almost like a naming convention.

I ended up committing a slightly modified version of split_addr_size that
should be simpler and slightly more performant:

function split_value()
{
    local value=$1
    printf "0x%X " "$(($value >> 32))"
    printf "0x%X " "$(($value & 0xFFFFFFFF))"
}

function split_addr_size()
{
    local addr=$1
    local size=$2

    split_value $addr
    split_value $size
}


