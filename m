Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6D353E4CE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342563.567609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCx5-0001h4-RH; Mon, 06 Jun 2022 13:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342563.567609; Mon, 06 Jun 2022 13:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCx5-0001fI-Mi; Mon, 06 Jun 2022 13:39:27 +0000
Received: by outflank-mailman (input) for mailman id 342563;
 Mon, 06 Jun 2022 13:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Jy1=WN=citrix.com=prvs=14988d3bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nyCx3-0001fA-Ot
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:39:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 132d315c-e59e-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 15:39:24 +0200 (CEST)
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
X-Inumbo-ID: 132d315c-e59e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654522764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fTLexGdJToP1puX9yfkdXLVy4Nlx8Eqcf7dDJZT9zow=;
  b=e2ef+aDX7n5W7MO4rEjSAXXzdMsypsjmAPMhDvBqgqkrLTvN3ucVAC0q
   d0VAiLjGq4TrAyrCXui2lVKu9Rge+2dqaKeIecaBP+0TlGFvP4X+z0APy
   D8T0dnumPcxY5wgOHxeTpbw82+6UeHOwQ7yJYDDmvvSUO88JmIQ+6vPiz
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72294500
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XJVZE6NcNkIM8m7vrR3dl8FynXyQoLVcMsEvi/4bfWQNrUor1jIBn
 TNKUG6COPyCajf3fY9zaorlp0tXvZPWzIVjTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn2tMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 o4UhMOMF1gVZvOSuOs7bR92NnheIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRR6yPO
 5dBMVKDajzHURAQPEUOE6hnwr/rr1rnURdy9nWa8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW73XcPARcbUV+6p/iRiUOkXd9bb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c9hNF+w37imdx6yS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWzEiusqYvK8g/qZ3Y1Ikk8YwEhFCsatoyLTJ4Isv7fcjpyOPfr04GvQ2msm
 W/iQDsW3OtK05NSv0mv1RWe2m/3+MCUJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnuNOvwjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGO5V8MuMcLYSXyPcebhr5d7OxzlMDd+SnNDKiIPrKinLAtHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lGDeb75EidcDn3lirUuOFMuT50n2jtKjiIu9FO5t3K2mNbhpsstpYWz9r
 r5iCid940wGALGuPHSMqN57wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:k0sQe6HMYMcmCCwCpLqFfZHXdLJyesId70hD6qkvc3Bom52j+v
 xGws5w6fatskdoZJhSo6H6BEDgewKVyXcb2/h0AV7PZmjbUS6TXfhfBOjZsnbd8k/Fh4lgPM
 5bGsAUZ7PN5BpB/KDHCWKDYrUdKay8gcWVbJDlvhVQpG9RC51I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmPm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTujxj78G6S64bg1eUWpDLT8KoCOCVKsLlXFtzYsHfnWG2mYczBgNl6mpDr1L9gqq
 i3n/5pBbUP15qWRBD+nfKl4Xid7B8+r3Dl0lOWmn3lvIjwQy87EdNIgcZDfgLe8FdIhqAK7E
 tn5RPti3NsN2K1oM093am5azh60k6v5XYym+8aiHJSFYMYdb9KtIQauEdYCo0JEi724J0uVL
 AGNrCU2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgMYfgnAD/pQgTIQs3Z
 WzDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdHmfJFz2fZt3SU4la6SHk4ndyNvaBqDglqFC56
 gpeGkoxFIPRw==
X-IronPort-AV: E=Sophos;i="5.91,280,1647316800"; 
   d="scan'208";a="72294500"
Date: Mon, 6 Jun 2022 14:39:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Message-ID: <Yp4Dhj4UkORelT8D@perard.uk.xensource.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <0f8f0c20-690c-f02a-e1f8-957462118999@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0f8f0c20-690c-f02a-e1f8-957462118999@suse.com>

On Thu, Jun 02, 2022 at 11:11:15AM +0200, Jan Beulich wrote:
> On 01.06.2022 18:59, Anthony PERARD wrote:
> > Use "define" for the headers*_chk commands as otherwise the "#"
> > is interpreted as a comment and make can't find the end of
> > $(foreach,).
> 
> In cmd_xlat_lst you use $(pound) - any reason this doesn't work in
> these rules? Note that I don't mind the use of "define", just that I'm
> puzzled by the justification.

I think I just forgot about $(pound) when I tried to debug why the
command didn't work in some environment (that is when not using define).

I think the second thing that make me not replacing '#' by "$(pound)" is
that reading "#include" in the Makefile is probably better that
reading "$(pound)include".

I guess we should add something to the justification like:
    That allow us to keep writing "#include" in the Makefile without
    having to replace that by "$(pound)include" which would be a bit
    less obvious about the command line purpose.

Thanks,

-- 
Anthony PERARD

