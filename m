Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B464373E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 22:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454198.711773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2JFQ-0000Xy-24; Mon, 05 Dec 2022 21:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454198.711773; Mon, 05 Dec 2022 21:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2JFP-0000VS-Ud; Mon, 05 Dec 2022 21:43:35 +0000
Received: by outflank-mailman (input) for mailman id 454198;
 Mon, 05 Dec 2022 21:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTDa=4D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p2JFN-0000VE-U8
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 21:43:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db9b0daf-74e5-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 22:43:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 798A161477;
 Mon,  5 Dec 2022 21:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCDDC433B5;
 Mon,  5 Dec 2022 21:43:27 +0000 (UTC)
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
X-Inumbo-ID: db9b0daf-74e5-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670276609;
	bh=iaHKrSg73PpHOjJ6zCk6wiyDHxIolfRHsh55KV1syaY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iTyP6RJPrHV6GIiNJMjWws7bmpE3qhchxYmW3RBE8c/FWev1cbNYOL+x+0kOzTndj
	 xjHLiBbANryfrOuM1bnFafEzmQF7z3b0/qY5YUSMGJVBN2ZLqVsCSzdSRy7Hl+9HDG
	 cK4R5d3JWgP7tr2zaY+po/BPW8SdvNONV4+V1x76CgVEOamCFblrD1APrbl3J3A9fm
	 AR3H5pdQmm2+cKH/EkxB8/BUigFtkjGW4ogkmm9KprMwCdJxLXaIKiN6Q7BRSwwBVB
	 UuukqdHSAsXX1kjlNgJMSiy9DkqB47HIUKVxr0zFpL//zr9YERA7nwb4FarBsT19Se
	 HMgAtuiM89kuQ==
Date: Mon, 5 Dec 2022 13:43:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
In-Reply-To: <849cf3a4-e7b2-f555-d759-978170088a54@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212051342490.4039@ubuntu-linux-20-04-desktop>
References: <cover.1669888522.git.rahul.singh@arm.com> <849cf3a4-e7b2-f555-d759-978170088a54@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-105642208-1670276184=:4039"
Content-ID: <alpine.DEB.2.22.394.2212051336370.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-105642208-1670276184=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2212051336371.4039@ubuntu-linux-20-04-desktop>

On Sat, 3 Dec 2022, Julien Grall wrote:
> On 01/12/2022 16:02, Rahul Singh wrote:
> > This patch series is sent as RFC to get the initial feedback from the
> > community. This patch series consists of 21 patches which is a big number
> > for
> > the reviewer to review the patches but to understand the feature end-to-end
> > we
> > thought of sending this as a big series. Once we will get initial feedback,
> > we
> > will divide the series into a small number of patches for review.
> 
> From the cover letter, it is not clear to me what sort of input you are
> expecting for the RFC. Is this about the design itself?
> 
> If so, I think it would be more helpful to write an high level document on how
> you plan to emulate the vIOMMU in Xen. So there is one place to
> read/agree/verify rather than trying to collate all the information from the
> 20+ patches.
> 
> Briefly skimming through I think the main things that need to be addressed in
> order of priority:
>   - How to secure the vIOMMU
>   - 1 vs multiple vIOMMU
> 
> The questions are very similar to the vITS because the SMMUv3 is based on a
> queue. And given you are selling this feature as a security one, I don't think
> we can go forward with the review without any understanding/agreement on what
> needs to be implemented in order to have a safe/secure vIOMMU.

I think we are all aligned here, but let me try to clarify further.

As the vIOMMU is exposed to the guest, and exposing a queue-based
interface to the guest is not simple, it would be good to clarify in a
document the following points:

- how is the queue exposed to the guest
- how are guest-inputs sanitized
- how do the virtual queue resources map to the physical queue
  resources
- lifecycle of the resource mappings
- any memory allocations triggered by guest actions and their lifecycle

It is difficult to extrapole these details from 21 patches. Having these
key detailed written down in the 0/21 email would greatly help with the
review. It would make the review go a lot faster.
--8323329-105642208-1670276184=:4039--

