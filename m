Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCA4748B8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:02:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246930.425877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBCH-0003Yk-Tv; Tue, 14 Dec 2021 17:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246930.425877; Tue, 14 Dec 2021 17:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBCH-0003VK-QP; Tue, 14 Dec 2021 17:02:37 +0000
Received: by outflank-mailman (input) for mailman id 246930;
 Tue, 14 Dec 2021 17:02:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBCG-0003VA-G6
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:02:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBCD-0004Wl-T0; Tue, 14 Dec 2021 17:02:33 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBCD-0004Kn-Nf; Tue, 14 Dec 2021 17:02:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=yMVbd1odnAEVw/2SZF//3pcjOGZ9OCHBWl6xLcEeUh8=; b=b7DaHShhks/4HGgkI3e4b7/hzu
	J7NnKNPMSDdVXbfCYOkwhkbKlND+fiBjrOICd2kOH0MdHtTQSbcrNmCk9KWOz/0LSnI3jpNhEva3U
	gK+gPuOhZoVmIJNnP2w1ebEzn2B4GRI5SY5e0VkGP2Ai30vMj7t9ZZVY9fWoxcFsURIU=;
Message-ID: <b9226076-a5e9-b664-8947-eb1d94c8a2ca@xen.org>
Date: Tue, 14 Dec 2021 17:02:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 08/47] build: prepare to always invoke $(MAKE) from
 xen/, use $(obj)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-9-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-9-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/11/2021 13:39, Anthony PERARD wrote:
> In a future patch, when building a subdirectory, we will set
> "obj=$subdir" rather than change directory.
> 
> Before that, we add "$(obj)" and "$(src)" in as many places as
> possible where we will need to know which subdirectory is been built.
> "$(obj)" is for files been generated during the build, and "$(src)" is
> for files present in the source tree.
> 
> For now, we set both to "." in Rules.mk and Makefile.clean.
> 
> A few places don't tolerate the addition of "./", this is because make
> remove the leading "./" in targets and dependencies in rules, so these
> will be change later.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

