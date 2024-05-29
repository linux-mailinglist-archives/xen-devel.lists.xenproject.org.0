Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07988D3EF4
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732312.1138243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCP4v-0000Sc-46; Wed, 29 May 2024 19:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732312.1138243; Wed, 29 May 2024 19:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCP4v-0000Qs-1O; Wed, 29 May 2024 19:35:17 +0000
Received: by outflank-mailman (input) for mailman id 732312;
 Wed, 29 May 2024 19:35:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0akS=NA=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sCP4t-0000Qm-M1
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:35:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 909ac36f-1df2-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 21:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 092A58287045;
 Wed, 29 May 2024 14:35:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WiR5U2434Tuw; Wed, 29 May 2024 14:35:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CDC43828718A;
 Wed, 29 May 2024 14:35:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id u-IVwvgOBNcD; Wed, 29 May 2024 14:35:09 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C6B9F8287045;
 Wed, 29 May 2024 14:35:08 -0500 (CDT)
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
X-Inumbo-ID: 909ac36f-1df2-11ef-90a1-e314d9c70b13
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CDC43828718A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1717011309; bh=dwXIRi2j9fE09Pzdoge9/pLUywiTgX1ILFFSyE1O6Gc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=sxOxTfzuKi6BmoGGNt0fvda0Yucgiwi5lGbwWNMggm8D+uIPYcYdvP86udtWnBrnk
	 5b1tNqz/dkYRZjcLgVqSFmNK75RpqMGiK4nl8vDeU5ijbSVOB3B2bmrzWhmWdjgj2y
	 K48MZlgUCjwOzgvXVlTQ2jwc/z1DOpupAJvN2QsI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <2e845397-5d0f-4905-baef-cbf4402abd55@raptorengineering.com>
Date: Wed, 29 May 2024 14:35:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] ppc/boot: Run constructors on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240524200338.1232391-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 5/24/24 3:03 PM, Andrew Cooper wrote:
> PPC collects constructors, but doesn't run them yet.  Do so.
> 
> They'll shortly be used to confirm correct behaviour of the bitops primitives.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Looks good to me.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn


