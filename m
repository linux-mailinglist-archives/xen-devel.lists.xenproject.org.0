Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC7733A35
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 21:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550398.859458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFVn-0003r0-6K; Fri, 16 Jun 2023 19:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550398.859458; Fri, 16 Jun 2023 19:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFVn-0003nf-2u; Fri, 16 Jun 2023 19:53:35 +0000
Received: by outflank-mailman (input) for mailman id 550398;
 Fri, 16 Jun 2023 19:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r/i=CE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qAFVm-0003nZ-92
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 19:53:34 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78d9798a-0c7f-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 21:53:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B8E4F82856D4;
 Fri, 16 Jun 2023 14:53:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Sr49pqWOxKDe; Fri, 16 Jun 2023 14:53:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F24EB8285808;
 Fri, 16 Jun 2023 14:53:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RoORfQvYC0Q2; Fri, 16 Jun 2023 14:53:30 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 64B3982856D4;
 Fri, 16 Jun 2023 14:53:30 -0500 (CDT)
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
X-Inumbo-ID: 78d9798a-0c7f-11ee-b232-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F24EB8285808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686945211; bh=tQ8vUXLBsOQ50XNg2TxpwjYI32WyqoMDK+L8Lj6bMK0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=M0dSoLDuYMHWc+xsu+gHgnOCH3bD8yuhrynSG2Y0YP7cBjElL1uPyqH1LpvHybiae
	 SeCjmT09rognWvJc1rhZiPUqp9PKCyXAh0JBWAltwb4xjC+hP2LI6Fdo+koKQTscOX
	 OAC7+6tJCkV2SVgV6uQ3Zm6kl+PGeAVq96Z0cBAg=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <58c46f7b-033e-0107-90c4-4454d813d381@raptorengineering.com>
Date: Fri, 16 Jun 2023 14:53:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/4] automation: Add container for ppc64le builds
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <0d59b5eb8de2b00839204c36a2a45eebab994369.1686936278.git.sanastasio@raptorengineering.com>
 <89f3e9fd-9cbb-1263-a8ce-c671b52a8529@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <89f3e9fd-9cbb-1263-a8ce-c671b52a8529@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6/16/23 2:49 PM, Andrew Cooper wrote:
> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>> Add a container for cross-compiling xen for ppc64le.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Just to say that I already committed this patch, when rebuilding the
> container.=C2=A0 We likely raced given the time you posted the series, =
but
> you'll want to drop it as part of rebasing onto the staging branch (if
> another series is needed).

Apologies. If a v5 is needed I'll definitely exclude this patch then.

> ~Andrew
Thanks,
Shawn

