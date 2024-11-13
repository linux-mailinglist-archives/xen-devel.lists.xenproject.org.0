Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF69C6796
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 04:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835038.1250863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3ik-0006O0-Ci; Wed, 13 Nov 2024 03:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835038.1250863; Wed, 13 Nov 2024 03:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3ik-0006MW-9K; Wed, 13 Nov 2024 03:07:06 +0000
Received: by outflank-mailman (input) for mailman id 835038;
 Wed, 13 Nov 2024 03:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tB3ij-0006MQ-Fy
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 03:07:05 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a165569-a16c-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 04:07:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 94629A42649;
 Wed, 13 Nov 2024 03:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A056C4CECD;
 Wed, 13 Nov 2024 03:06:59 +0000 (UTC)
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
X-Inumbo-ID: 5a165569-a16c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjVhMTY1NTY5LWExNmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDY3MjIyLjA3NTM4NCwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731467220;
	bh=dNoCWoA0tHuqgAc9AxELrFWRvptNmrWxyQdAkzjNrTk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JEzrssWleDe2YYBoHGS+SZPTtmDDU2hqkfFvaUBtqEIGr43dO+4j7qMZQdByLMyp6
	 ZmrRXgp/6XthVStyUpwtQpfyrfoquJ9hY2tIRcKA6NzCp9Sspejp+WPrFVLgVOiEy9
	 8J1/l8YSuN+aYWwr7HiyHXHRE9UOcKVjCriEDf12Fz5NhHAkSwgmmJC5xCxUXMF/rv
	 QdIG2HGTF9w21zJyz+VuYEnRIv6S+h1obthfVoIgnl/LGVTWS4hCWqu8uKByQHd2c8
	 3mWlpNohxA2RjcjE5q/W9pghd5OwKdpnX5XGVAWcALANOJWq3OV+PbeUNn1r2+y8Rr
	 9OG34nKc4ZZdQ==
Date: Tue, 12 Nov 2024 19:06:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Kelly Choi <kelly.choi@cloud.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [ARM] Re: preparations for 4.19.1
In-Reply-To: <718c2a9c-15b0-4f21-941a-5094c06787c7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2411121906520.222505@ubuntu-linux-20-04-desktop>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com> <4aa24b39-5734-4b0a-8969-dc3eb4942975@amd.com> <718c2a9c-15b0-4f21-941a-5094c06787c7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Nov 2024, Julien Grall wrote:
> Hi,
> 
> On 12/11/2024 16:00, Stewart Hildebrand wrote:
> > On 11/12/24 08:00, Jan Beulich wrote:
> > > All,
> > > 
> > > the release is due by the end of the month. Please point out backports you
> > > find
> > > missing from the respective staging branch, but which you consider
> > > relevant.
> > > 
> > > Advance notice: 4.18.4 ought to follow about two weeks later.
> > > 
> > > Jan
> > > 
> > 
> > Looking for Julien's input on this one:
> > 
> > 35c64c3dce01 ("xen/arm64: entry: Actually skip do_trap_*() when an SError is
> > triggered")
> > 
> > As mentioned in the post-commit notes [0] it's a candidate for backport.
> 
> In the past, Stefano handled backports for Arm. I am not sure if this is still
> case. Stefano?

Done

