Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594948277F7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 19:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663881.1033780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMulx-0002YN-NN; Mon, 08 Jan 2024 18:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663881.1033780; Mon, 08 Jan 2024 18:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMulx-0002Vi-Ko; Mon, 08 Jan 2024 18:54:53 +0000
Received: by outflank-mailman (input) for mailman id 663881;
 Mon, 08 Jan 2024 18:54:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WJX=IS=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rMulw-0002Vc-2P
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 18:54:52 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 657993ca-ae57-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 19:54:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A6F6C8285512;
 Mon,  8 Jan 2024 12:54:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KSGMvER7xA8F; Mon,  8 Jan 2024 12:54:47 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0EAEC8285929;
 Mon,  8 Jan 2024 12:54:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xlcHdUk7Z0fF; Mon,  8 Jan 2024 12:54:46 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6A67E8285512;
 Mon,  8 Jan 2024 12:54:46 -0600 (CST)
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
X-Inumbo-ID: 657993ca-ae57-11ee-98ef-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0EAEC8285929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1704740087; bh=h4o4gZTTMz4GP230sXZWefhNNKAr2xR1wCk38zz7n3Q=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=nCwdkZV4gold6H9jrvRnbKIUKI0c+X0urbhJ1LzHZ8msW2WlDdpwfWg8t2MR4au5E
	 YeOgyZTs827y+iiMYaKwuyw1z/3BauPHynMXYP9ur143eduSYmFLafyf/0hE5B4Tn9
	 C8IABnoH0I8gu+Be74Dl+Ct0IXDiAFI/97jDzyC4=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <d3069761-51fe-4a7d-97e3-d12f786a2495@raptorengineering.com>
Date: Mon, 8 Jan 2024 12:54:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <94cffa48-5e31-4557-827d-c6dec6031d05@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <94cffa48-5e31-4557-827d-c6dec6031d05@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 1/8/24 5:30 AM, Jan Beulich wrote:
> There's no point in every architecture carrying the same stubs for the
> case when NUMA isn't enabled (or even supported). Move all of that to
> xen/numa.h; replace explicit uses of asm/numa.h in common code. Make
> inclusion of asm/numa.h dependent upon NUMA=y.
> 
> Drop the no longer applicable "implement NUMA support" comments - in a
> !NUMA section this simply makes no sense.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

