Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753F3BA9BA
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149570.276659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjH4-0003lm-Vq; Sat, 03 Jul 2021 17:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149570.276659; Sat, 03 Jul 2021 17:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjH4-0003ju-SA; Sat, 03 Jul 2021 17:17:50 +0000
Received: by outflank-mailman (input) for mailman id 149570;
 Sat, 03 Jul 2021 17:17:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjH3-0003jo-Fs
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:17:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjH1-0007lM-LK; Sat, 03 Jul 2021 17:17:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjH1-0006Hx-Ep; Sat, 03 Jul 2021 17:17:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3UfzSvMMnZkxcyV4Kvv08/v+z5+aqf8C6iBaDyXpPcM=; b=K5ELL+7YlduhIpK/sI+E1DPzeC
	KFxa7HiFU2JbztqXPVClRqDSJgKhFf5sgDhcJb1HKETr/ndBJdUMALy95+PXcMdgAtcHBeFv+i3G5
	HbBcvyzpzyXBsUrFoqnBL+DM+uQGeUuhI5jfNjKtO8UEm2FcXG0wbR4FiwrsN14QNlZU=;
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monn?? <royger@freebsd.org>, Mitchell Horne <mhorne@freebsd.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
References: <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
 <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
 <YJ8hTE/JbJygtVAL@mattapan.m5p.com>
 <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
 <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
 <b6fe6e06-517c-ee4c-5b71-a1bee4d4df13@xen.org>
 <alpine.DEB.2.21.2105200919100.14426@sstabellini-ThinkPad-T480s>
 <2d18f588-5e76-e3da-e7df-5c754516f8d6@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b9247885-8fc0-3a74-8f86-740997b4453e@xen.org>
Date: Sat, 3 Jul 2021 18:17:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2d18f588-5e76-e3da-e7df-5c754516f8d6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/06/2021 13:19, Oleksandr Andrushchenko wrote:
> Hi, all!

Hi,

Sorry for the late reply.

> What do we need in order to move on on this?

The next steps would be
  1) Write a PoC to confirm the approach is feasible
  2) Write a design document

Unfortunately, I will not have time to work on it any time soon. Is it 
something you plan to work on?

Cheers,

-- 
Julien Grall

