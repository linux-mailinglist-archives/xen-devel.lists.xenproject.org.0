Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C763831B37
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 15:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668780.1041219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTDV-0007Vt-SX; Thu, 18 Jan 2024 14:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668780.1041219; Thu, 18 Jan 2024 14:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTDV-0007Tc-PY; Thu, 18 Jan 2024 14:18:01 +0000
Received: by outflank-mailman (input) for mailman id 668780;
 Thu, 18 Jan 2024 14:18:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQTDT-0007SM-Us
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 14:17:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQTDT-0006YJ-0J; Thu, 18 Jan 2024 14:17:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQTDS-0002WB-Pa; Thu, 18 Jan 2024 14:17:58 +0000
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
	bh=/sPuEXwnxBJNDk/+GhqmPYJO3OpUikcu8DbyywlhBWU=; b=nUpZ4+rX8D1fMs77Gq0NdQ1mQM
	PPlw5Lp94lT8ZRSBJ9nGKT2DTSSvNuOk9C/7v7VGv3jpBRipQYjPhw0x/mW9j0/RVZsYggtgQGnpn
	xZs+7JNuRokccoBSFCFzMKx3l4gJSwDrswcBhpJBXfNS1S+u1p7rIZuvS6VorDCRlDPY=;
Message-ID: <36628428-3284-47c4-8471-21218c63df07@xen.org>
Date: Thu, 18 Jan 2024 14:17:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] IRQ: drop register parameter from handler functions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Kevin Tian <kevin.tian@intel.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <c6926627-aeb6-40dd-a85a-1be0b324bf49@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c6926627-aeb6-40dd-a85a-1be0b324bf49@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/01/2024 07:35, Jan Beulich wrote:
> It's simply not needed anymore. Note how Linux made this change many
> years ago already, in 2.6.19 (late 2006, see [1]).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This patch will need to be adjusted to compile on Arm. If you 
incorporate the changes from Michal (see the reply to the cover letter), 
then:

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=7d12e780e003f93433d49ce78cfedf4b4c52adc5

NIT: I was under the impresion the tags would usually last in a commit. 
So this would go before [1].

Cheers,

-- 
Julien Grall

