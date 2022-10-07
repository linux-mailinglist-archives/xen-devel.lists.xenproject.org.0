Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD45F7EDA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 22:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418301.663093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogu2U-00038g-IT; Fri, 07 Oct 2022 20:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418301.663093; Fri, 07 Oct 2022 20:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogu2U-00035G-ET; Fri, 07 Oct 2022 20:33:46 +0000
Received: by outflank-mailman (input) for mailman id 418301;
 Fri, 07 Oct 2022 20:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogu2S-0002u5-4p
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 20:33:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55004645-467f-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 22:33:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6650561DD2;
 Fri,  7 Oct 2022 20:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E36FC433D6;
 Fri,  7 Oct 2022 20:33:40 +0000 (UTC)
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
X-Inumbo-ID: 55004645-467f-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665174820;
	bh=dVFICHtaG+JkviHXFXOU1zYcJHQZVRLeOHTl8JVmAJc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mQm4ewWr+It2XZsEf4o4WiGWcReJ1VhX+yJq3CndHkPymXly8CiMzO49aO/pjcHgP
	 glxGQm+fn4wGE+GNx29OK5qD4Q+W24+8V3NQv+aKcQvOXadvmKp08EeQ0Mhg2jVJJy
	 0WPYInHV2JII9r55zFVQ8WKmLbJsupURyGHrmI/POn1jS2CZfOQxsLyrPbFPKbiUe2
	 uqoCc/c4o059L2OAVLJwK8Ew0RHnM6r9s0LEgSeQ389rCGgZwv7QbV05wDXh+Gv8S2
	 qMLiNAFFnVbqCzB3wRybhdFjVjH6lUEuLjXu/kqXlnQl+jxOFi3M2DyHHQ6MGwpF44
	 +OLctm8qDN5Og==
Date: Fri, 7 Oct 2022 13:33:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, stefano.stabellini@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ImageBuilder: Add support for 64-bit addresses
In-Reply-To: <25626565-ba7d-265b-38f5-003b0b504d67@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210071332420.3690179@ubuntu-linux-20-04-desktop>
References: <20221006102035.16281-1-michal.orzel@amd.com> <alpine.DEB.2.22.394.2210061349110.3690179@ubuntu-linux-20-04-desktop> <25626565-ba7d-265b-38f5-003b0b504d67@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Oct 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 07/10/2022 00:34, Stefano Stabellini wrote:
> > 
> > 
> > +xen-devel
> > 
> > On Thu, 6 Oct 2022, Michal Orzel wrote:
> >> At the moment, ImageBuilder assumes that all addresses/sizes are
> >> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
> >> value for the first cell. Because of that, we cannot specify MEMORY_START
> >> and MEMORY_END to be above 32-bits (e.g. to place the images in the
> >> upper memory bank).
> >>
> >> Add support to properly handle 64-bit addresses:
> >>  - add function split_into_halves to split the value passed as a first
> >>    argument into upper and lower halves. These are then set as values for
> >>    variables passed respetively as the second and third argument,
> >>  - whenever there is a variable storing the full 64-bit number with
> >>    "addr" or "size" in name, introduce two additional variables with
> >>    "addr1,addr2"/"size1,size2" in name to store the halves. These are
> >>    then used to properly set cells.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >>
> >> ---
> >>  scripts/uboot-script-gen | 60 +++++++++++++++++++++++++++++++++++-----
> >>  1 file changed, 53 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> >> index 16269f02f1e7..4c6525a910f3 100755
> >> --- a/scripts/uboot-script-gen
> >> +++ b/scripts/uboot-script-gen
> >> @@ -25,6 +25,14 @@ function dt_mknode()
> >>      fi
> >>  }
> >>
> >> +# Usage:
> >> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
> >> +function split_into_halves()
> >> +{
> >> +    eval "$2=$(printf "0x%X\n" $(($1 >> 32)))"
> >> +    eval "$3=$(printf "0x%X\n" $(($1 & 0xFFFFFFFF)))"
> >> +}
> > 
> > I know it is the same thing, but I would prefer the following version
> > because it makes it easier to read:
> > 
> > # Usage:
> > # split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
> > function split_into_halves()
> > {
> >     local value=$1
> >     local upper=$2
> >     local lower=$3
> > 
> >     eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
> >     eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
> > }
> That is ok for me.
> 
> > 
> > 
> >> +
> >>  # data_type is either
> >>  #   int
> >>  #   hex
> >> @@ -41,10 +49,14 @@ function dt_set()
> >>
> >>      if test $data_type = "var"
> >>      then
> >> -        eval data_addr_var="$data"_addr
> >> -        eval data_addr=\$"$data_addr_var"
> >> -        eval data_size_var="$data"_size
> >> -        eval data_size=\$"$data_size_var"
> >> +        eval data_addr1_var="$data"_addr1
> >> +        eval data_addr2_var="$data"_addr2
> >> +        eval data_addr1=\$"$data_addr1_var"
> >> +        eval data_addr2=\$"$data_addr2_var"
> >> +        eval data_size1_var="$data"_size1
> >> +        eval data_size2_var="$data"_size2
> >> +        eval data_size1=\$"$data_size1_var"
> >> +        eval data_size2=\$"$data_size2_var"
> > 
> > To avoid making the code more complex, is it possible to stick with just
> > a single data_addr variable in u-boot and calculate the upper and lower
> > 32-bit using u-boot commands?
> The reason why we need these extra variables is to add them into respective
> cells under different nodes. In dt_set we need to put the variable names
> for dynamic assignment and variable values for static assignment. We cannot
> do this having a single pair data_addr_var,data_addr. These evals corresponds
> to variables from xen_file_loading. dt_set and add_size are two different
> functions. The former is used to create the nodes and the latter is used to
> set values for the environment variables.
> 
> Example:
> dt_set "/chosen/dom0" "reg" "var" "dom0_linux"
> - this will create a reg property for dom0 kernel. We need to insert the upper
> and lower halves into this property (so we need separate variables for that)
> e.g.
> reg <0x${dom0_linux_addr1} 0x${dom0_linux_addr2} 0x${dom0_linux_size1} 0x${dom0_linux_size2}>
> 
> load_file $DOM0_KERNEL "dom0_linux" calling add_size
> - this will set values for upper and lower halves into u-boot env variables
> that corresponds to variables we placed previously in reg property,
> e.g.
> setenv dom0_linux_addr1 ${memaddr1}
> setenv dom0_linux_addr2 ${memaddr2}
> setenv dom0_linux_size1 ${filesize1}
> setenv dom0_linux_size2 ${filesize2}
> 
> FWICS, we cannot achieve this using a single pair.

OK. In that case please rebase the patch on the "master-next" branch.
We'll figure out how to handle the dynamic address calculation at a
later time.

