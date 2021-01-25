Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8C3026EF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 16:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74161.133269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43wZ-0004Cm-Jr; Mon, 25 Jan 2021 15:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74161.133269; Mon, 25 Jan 2021 15:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43wZ-0004CN-Gn; Mon, 25 Jan 2021 15:38:19 +0000
Received: by outflank-mailman (input) for mailman id 74161;
 Mon, 25 Jan 2021 15:38:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lE5z=G4=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l43wX-0004CI-U0
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 15:38:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bc0ca24-0de6-413d-a1db-d71701c01445;
 Mon, 25 Jan 2021 15:38:16 +0000 (UTC)
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
X-Inumbo-ID: 9bc0ca24-0de6-413d-a1db-d71701c01445
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611589096;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=adE1+SXOcPkQiHxBBtZNKWgJz/NYJbNMGjFkSpBu5js=;
  b=D7rUMndvWScAUZo4WYkKR7rMP+7Dw82un14Z79fMrDv+9YqEiIWjkVOX
   PW0r+NVAnvw1rBaX/4OyQ/5FAyA3xbH/HeND7FNTmldNvkOdzBeWuoTiB
   YJcjQl3fFdYlAh8A/svoE2J54/5/oB48XPpyOMHwiKF06yPdZvQPLJQUa
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +hqyqSIfTNzOdFEkfG/siAoz5I/u/bPF461iv+zDVxe1n3IOBdAfKnaxTBxhRYaLUlX4T9X3ZE
 44qhRW3ktIVGjfu/57vOZAfJy/MnkwkvBJcuSxpS3ZlHA2dJMAtUZkTtdMt2yMAUoQZDvXHAK2
 y8rs4oRHnGqyKee2NQAbFnbO+cJhnDc/RTGnTpzJXtv4EpSgsCBCMeqKYlAAZe+SjY/AKoAr6q
 oiHc0VRH2Gqmg1dBiOcMpWw56YgtYTp2lxlMsmHaupyMHcUK3LTHXsX2youKokFoP/VhRrKFu1
 vkc=
X-SBRS: 4.4
X-MesageID: 36169763
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,373,1602561600"; 
   d="scan'208";a="36169763"
Subject: Re: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
	<roger.pau@citrix.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <396e7b8d-444a-d67d-e0f7-f6b85052dff7@citrix.com>
Date: Mon, 25 Jan 2021 15:37:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/01/2021 04:17, Igor Druzhinin wrote:
> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
> the maximum number of virtual processors per partition" that "can be obtained
> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
> the Microsoft Hypervisor Interface" defines that starting from Windows Server
> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
> contain a value -1 basically assuming the hypervisor has no restriction while
> 0 (that we currently expose) means the default restriction is still present.
> 
> Along with the previous changes exposing ExProcessorMasks this allows a recent
> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
> going into BSOD in some cases.
> 
> Since we didn't expose the leaf before and to keep CPUID data consistent for
> incoming streams from previous Xen versions - let's keep it behind an option.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---

ping? Paul?

Igor

