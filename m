Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94F7B3A1F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 20:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610671.950154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmIMa-0007Sn-E2; Fri, 29 Sep 2023 18:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610671.950154; Fri, 29 Sep 2023 18:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmIMa-0007Ps-BR; Fri, 29 Sep 2023 18:37:20 +0000
Received: by outflank-mailman (input) for mailman id 610671;
 Fri, 29 Sep 2023 18:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmIMZ-0007Pm-52
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 18:37:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36a6983a-5ef7-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 20:37:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C11C261E60;
 Fri, 29 Sep 2023 18:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3C6C433C7;
 Fri, 29 Sep 2023 18:37:14 +0000 (UTC)
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
X-Inumbo-ID: 36a6983a-5ef7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696012635;
	bh=6AttsrdlHwcqgy5BFIqx1gbmhA9SO1rE0b9T+ky3AwA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z8FZhCTvVgyzqepXZQNDCLl7b4WlDI+tyKAPXSlbf9q5Y7Pr440QD1ss8goPkSOcI
	 XQ2NSUgJ2hJFpQzYIKB+Fxt04Y8l7gYhJoPxZ6PRtjtpPSGA+FEHGBtjBijQymaALb
	 KZhBIuko+WCLc9O5zhtWy2GX0cOVtNwKUaw7/wjtDgYWQ3Nwjn5drI6d3CvNadd7bt
	 zsOREvBnLDJvfw3lRZg9URX67ozM21fekligCPbakzPeKYeOQageq4doRcp/iHTZD5
	 1WzNhEksIIfxvhDD/ghQygz5iKKzaBFwSu0ZLy7G89Junmye6UDxV9Ehc1lD2e9FXF
	 2tn4zMom8o3AQ==
Date: Fri, 29 Sep 2023 11:37:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, 
    "simone.ballarin@bugseng.com" <simone.ballarin@bugseng.com>, 
    "federico.serafini@bugseng.com" <federico.serafini@bugseng.com>
Subject: Re: Misra rule 10.3 violations report script
In-Reply-To: <AB2332E6-1EE4-4657-8403-F090D1E6C13E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309291136590.2348112@ubuntu-linux-20-04-desktop>
References: <D36FE722-43D5-4A93-B725-AD4157A1BA61@arm.com> <alpine.DEB.2.22.394.2309281609360.1996340@ubuntu-linux-20-04-desktop> <AB2332E6-1EE4-4657-8403-F090D1E6C13E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-843683343-1696012635=:2348112"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-843683343-1696012635=:2348112
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 29 Sep 2023, Luca Fancellu wrote:
> > On 29 Sep 2023, at 00:20, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 28 Sep 2023, Luca Fancellu wrote:
> >> Hi all,
> >> 
> >> In the last MISRA meeting Stefano told me about the Rule 10.3 and that we have a lot of violations,
> >> but GCC has a way to list them as written in rules.rst.
> >> 
> >> So the issue was just that we have a lot of violations, most of them coming from headers and the
> >> Developer might feel a bit lost since the number is very high, so I’ve developed this script to take
> >> the GCC build log and create a list of unique occurrences of the violations sorted in descending
> >> order, so that who has a bit of time can try to fix some of those and maybe can start from the top
> >> of the list to fix as many as possible occurrences.
> >> 
> >> I attach the script as patch file.
> 
> Hi Stefano,
> 
> > 
> > Thanks Luca! Actually I think this is great! The script makes it much
> > easier to use the GCC output to address 10.3 violations. I think we
> > should have it in the xen.git tree.
> 
> Ok I can refine it a bit in that case and push it to the ML.
> 
> > 
> > Thanks to the script I was able to quickly address the top violation in
> > bitmap.h.
> 
> I’m wondering if we need to remove from the list the excluded files, in this
> first shot I didn’t do that but should be easy.

Uhm, maybe with a command line option?
--8323329-843683343-1696012635=:2348112--

