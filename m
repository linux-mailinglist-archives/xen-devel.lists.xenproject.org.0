Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1644A478
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 03:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223669.386461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkGcK-0005Us-Cw; Tue, 09 Nov 2021 02:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223669.386461; Tue, 09 Nov 2021 02:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkGcK-0005RT-4i; Tue, 09 Nov 2021 02:12:08 +0000
Received: by outflank-mailman (input) for mailman id 223669;
 Tue, 09 Nov 2021 02:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkGcI-0005RN-7a
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 02:12:06 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 661e3a88-4102-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 03:11:59 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4005161152;
 Tue,  9 Nov 2021 02:11:49 +0000 (UTC)
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
X-Inumbo-ID: 661e3a88-4102-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636423909;
	bh=vAd6l7i5cYc1ffNYOwSpfTYDRHavyWQVcGZ5RFkL77w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C1eKalWaCX4fHcanRHJIsjQSuF72y3dokvbtUiulR2xrlw5EutAdLCYGxmH/Ma5iv
	 TXfsAcdQmWVBv13PWidxUwB7A+Hnf1WFmwYkLHxt8oavMRHXHj24RWDdlroFHYPjwj
	 K66omTKlP/YpE43fowZ9w9yCm9AKWF+Q2wFKfF6Pl/3XuslIeh0qI5rSDsM7+FKNQP
	 lwq1d4wXOwA20vEYZYtjbqrYJvMXIY3h24s4kb9DSJrQIH2BWz8UV6AduVo0PoesGq
	 JXUDSlBeJ3oRrT5Jfh8SwcDMVWZnLC0L/q01m/7aKUiqXu/nBJkCgUpym6D0teelN/
	 an+ffpX9RuN7Q==
Date: Mon, 8 Nov 2021 18:11:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
References: <20211104141206.25153-1-luca.fancellu@arm.com> <81685961-501e-7a41-6f6f-bc4491645264@suse.com> <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop> <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop> <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com> <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop> <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop> <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1476451275-1636423908=:3317"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1476451275-1636423908=:3317
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 8 Nov 2021, Jan Beulich wrote:
> On 05.11.2021 16:33, Stefano Stabellini wrote:
> > On Fri, 5 Nov 2021, Jan Beulich wrote:
> >> On 04.11.2021 22:50, Stefano Stabellini wrote:
> >>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
> >>>>> On 4 Nov 2021, at 21:35, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
> >>>>>>> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>>>>> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> >>>>>>> * dom0 and domU guests to be loaded.
> >>>>>>> * Returns the number of multiboot modules found or a negative number for error.
> >>>>>>> */
> >>>>>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> >>>>>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> >>>>>>> {
> >>>>>>>    int chosen, node, addr_len, size_len;
> >>>>>>>    unsigned int i = 0, modules_found = 0;
> >>>>>>> +    EFI_FILE_HANDLE dir_handle;
> >>>>>>> +    CHAR16 *file_name;
> >>>>>>> +
> >>>>>>> +    dir_handle = get_parent_handle(loaded_image, &file_name);
> >>>>>>
> >>>>>> We can’t use get_parent_handle here because we will end up with the same problem,
> >>>>>> we would need to use the filesystem if and only if we need to use it, 
> >>>>>
> >>>>> Understood, but it would work the same way as this version of the patch:
> >>>>> if we end up calling read_file with dir_handle == NULL, then read_file
> >>>>> would do:
> >>>>>
> >>>>>  blexit(L"Error: No access to the filesystem");
> >>>>>
> >>>>> If we don't end up calling read_file, then everything works even if
> >>>>> dir_handle == NULL. Right?
> >>>>
> >>>> Oh yes sorry my bad Stefano! Having this version of the patch, it will work.
> >>>>
> >>>> My understanding was instead that the Jan suggestion is to revert the place
> >>>> of call of get_parent_handle (like in your code diff), but also to remove the
> >>>> changes to get_parent_handle and read_file.
> >>>> I guess Jan will specify his preference, but if he meant the last one, then
> >>>> the only way I see...
> >>>
> >>> I think we should keep the changes to get_parent_handle and read_file,
> >>> otherwise it will make it awkward, and those changes are good in their
> >>> own right anyway.
> >>
> >> As a maintainer of this code I'm afraid I have to say that I disagree.
> >> These changes were actually part of the reason why I went and looked
> >> how things could (and imo ought to be) done differently.
> > 
> > You know this code and EFI booting better than me -- aren't you
> > concerned about Xen calling get_parent_handle / dir_handle->Close so
> > many times (by allocate_module_file)?
> 
> I'm not overly concerned there; my primary concern is for it to get called
> without need in the first place.

Exactly my thinking! Except that now it gets called 10x times with
dom0less boot :-(


> > My main concern is performance and resource utilization. With v3 of the
> > patch get_parent_handle will get called for every module to be loaded.
> > With dom0less, it could easily get called 10 times or more. Taking a
> > look at get_parent_handle, the Xen side doesn't seem small and I have
> > no idea how the EDK2 side looks. I am just worried that it would
> > actually have an impact on boot times (also depending on the bootloader
> > implementation).
> 
> The biggest part of the function deals with determining the "residual" of
> the file name. That part looks to be of no interest at all to
> allocate_module_file() (whether that's actually correct I can't tell). I
> don't see why this couldn't be made conditional (e.g. by passing in NULL
> for "leaf").

I understand the idea of passing NULL instead of "leaf", but I tried
having a look and I can't tell what we would be able to skip in
get_parent_handle.

Should we have a global variable to keep the dir_handle open during
dom0less module loading?
--8323329-1476451275-1636423908=:3317--

