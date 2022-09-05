Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840415ADBDD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 01:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399252.640359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVLPc-0000CK-Es; Mon, 05 Sep 2022 23:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399252.640359; Mon, 05 Sep 2022 23:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVLPc-00008r-Bq; Mon, 05 Sep 2022 23:21:52 +0000
Received: by outflank-mailman (input) for mailman id 399252;
 Mon, 05 Sep 2022 23:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0v=ZI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVLPb-00008l-7R
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 23:21:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844e5d96-2d71-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 01:21:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8155AB815F0;
 Mon,  5 Sep 2022 23:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B74DC433D6;
 Mon,  5 Sep 2022 23:21:46 +0000 (UTC)
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
X-Inumbo-ID: 844e5d96-2d71-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662420107;
	bh=63tJtpZoPgyfLZgi2FZnF3BpCtPOFfJWkevsfGMuQbE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TaUu0eHFxeC9D3A+emIlo1tGWqTOdorIXaEPHMpLDWUl3prJm/3j+iWcdECv6vUZ/
	 FSfLtIYVzhWJj7TvFyXUTf9EKpNO7niWQKLDjpn7VX6eMLFERiPO0vdtT14iE557h+
	 Hn/EZTsAsvzywO/QP0QN+fq5S/4SYN4l91R3duNJtySa//6Q2L4ViEFcT87PPopRAD
	 bfHQmz9u7c58LXAAaCI9u0sTuDwssxY6Rmjkv/uNVgvI7092HT76YpTICcPsVBvwIG
	 ZzLarHeYaC9bqH8W8GfeTVDjMBPYCMYhEartAbIPqhN3ZjFd01HNupivd7+EE88cx7
	 4W3Hz4FoSSXKw==
Date: Mon, 5 Sep 2022 16:21:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [for-4.17 3/3] automation: Add a new job for testing boot time
 cpupools on arm64
In-Reply-To: <98b712c1-2a02-9baa-b816-3c28cccaf74e@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209051552230.3931@ubuntu-linux-20-04-desktop>
References: <20220902070905.1262-1-michal.orzel@amd.com> <20220902070905.1262-4-michal.orzel@amd.com> <alpine.DEB.2.22.394.2209021645160.3931@ubuntu-linux-20-04-desktop> <98b712c1-2a02-9baa-b816-3c28cccaf74e@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Sep 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 03/09/2022 01:49, Stefano Stabellini wrote:
> > 
> > 
> > Currently this test fails with:
> > 
> > + fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
> > + [[ boot-cpupools == \b\o\o\t\-\c\p\u\p\o\o\l\s ]]
> > ++ fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle
> > Error at 'phandle': FDT_ERR_NOTFOUND
> My bad. The qemu version used by CI does not generate phandles for cpus.
> So the fix is very straightforward and requires putting custom phandle for cpu@1.
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index c2184850293c..158d5665d71d 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -50,8 +50,9 @@ fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
>  
>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>      # Create cpupool node and assign it to domU0
> -    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
> +    cpu_phandle="0xfffffe"
>      cpupool_phandle="0xffffff"
> +    fdtput binaries/virt-gicv2.dtb -p -t x /cpus/cpu@1 phandle $cpu_phandle
>      fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
>      fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
>      fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
 
 
> > Given my other comment below, I would leave this code as is.
> > 
> > 
> >> +if [[ "${test_variant}" == "boot-cpupools" ]]; then
> >> +    # Create cpupool node and assign it to domU0
> >> +    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
> >> +    cpupool_phandle="0xffffff"
> >> +    fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
> >> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
> >> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
> >> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/domU0 domain-cpupool $cpupool_phandle
> >> +
> >> +    # Check if domU0 (id=1) is assigned to Pool-1
> >> +    passed="${test_variant} test passed"
> >> +    dom0_check="if xl list -c 1 | grep -q Pool-1; then echo ${passed}; fi"
> >> +fi
> > 
> > I would prefer to keep the device tree editing here to a minimum and
> > instead add boot-cpupool support in ImageBuilder and add CPUPOOL* config
> > options to the existing config file for ImageBuilder created in this
> > file below. This way, we keep this test cleaner and we help more the
> > user by proving a way to set boot-cpupools more easily in general, also
> > useful outside gitlab-ci.
> 
> I agree that ImageBuilder is a great tool. However, I would opt for keeping what I did because of the following:
> - current release schedule (we could benefit from having a test for 4.17 feature instead of waiting for the corresponding
>   change to be done in ImageBuilder first and tested),
> - test is already prepared and requires just a trivial fix,
> - we should not enforce users willing to add tests to gitlab-ci to always prepare the ImageBuilder changes first.
>   ImageBuilder is not meant to support all the features strictly because some of them require too much
>   end-user knowledge and digging into device tree (it should stay as simple as possible),
> - all in all we need to have a way to modify the dtb and fdtput is certainly better than sed as it does not
>   require additional steps for decompilation/compilation and its commands look more clean than using sed transformation.
>
> Let me know what you think.
>
> On a side note, I can add boot-time cpupools support in ImageBuilder to my TODO list so that we can check if this is something
> ImageBuilder should support. If yes, we can modify this test after the release.


Yeah, ImageBuilder doesn't necessarely need to support every feature.
However, a tool (if not ImageBuilder, Lopper, or a new ImageBuilder
script) should support CPUPOOLs to enable the user.

You are right that ImageBuilder is not necessarely tied with gitlab-ci.
This is especially true once we start doing more interface-level
testing, such as hypercalls fuzzing with XTF. We are not going to be
able to use ImageBuilder to trigger every possible device tree boot time
combination, especially the ones that are invalid. We want to be able to
test Xen with invalid device tree input as well.

In addition to interface-level testing, we need user-level testing to
test features the way we expect a user to use them. This is what
ImageBuilder is for and that is why it has been used today in gitlab-ci.
On ARM today we only have user-level testing in gitlab-ci, but I'd love
to have more interface-level testing, which will surely require more
device tree manipulations outside of ImageBuilder.

- user-level tests -> ImageBuilder, common valid configurations
- interface-level tests -> not ImageBuilder, various valid and invalid
                           configurations, maybe automatically generated?
                           Device tree manipulations expected in gitlab-ci.


In my view, this test belongs to the "user-level test" category, this is
why I would prefer if it was done using the same tool that we expect the
user to use. Ideally, it would be ImageBuilder because that is the tool
that we have used so far (but it could be a new script under
ImageBuilder or Lopper).

But I understand deadlines, release schedule, etc., so if you think it
cannot be done properly using ImageBuilder in 2-3 days, then I would
take this patch as is, and we can revisit it in the future as you
suggested. I am OK with that too.

 
> I can already think of the following IB config options that would need to be introduced to properly support boot-time cpupools:
> CPUPOOL[number] = "<list_of_cpus> <scheduler>" - to create cpupools
> NUM_CPUPOOLS = "<number>" - to keep the number of created cpupools
> DOMU_CPUPOOL[number] = "CPUPOOL[number]" - to assing domU to one of the created cpupools
> So we already have 3 new options and the number of required sanity checks I can think of is significant.
> Even then, we could easily trigger a failure e.g. if user assigns cpus of different type and does not pass hmp-unsafe=1.


As we both wrote above, ImageBuilder doesn't need to support every
feature and every possible way a feature can be used. Only the most
common ones. I don't think we want to support the case where a user
assigns cpus of different type.

I think you are right that these are the interesting options at the
ImageBuilder level:

NUM_CPUPOOLS="<number>"
CPUPOOL[number] = "<list_of_cpus> <scheduler>"
DOMU_CPUPOOL[number] = "CPUPOOL[number]"

The last one could also be:

DOMU_CPUPOOL[number] = "CPUPOOL<number>" # e.g. DOMU_CPUPOOL[1] = "CPUPOOL2"

