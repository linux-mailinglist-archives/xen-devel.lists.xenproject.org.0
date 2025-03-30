Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA4A75920
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 11:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931578.1333784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyopK-00081n-CX; Sun, 30 Mar 2025 09:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931578.1333784; Sun, 30 Mar 2025 09:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyopK-0007zf-85; Sun, 30 Mar 2025 09:19:34 +0000
Received: by outflank-mailman (input) for mailman id 931578;
 Sun, 30 Mar 2025 09:19:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyopJ-0007zZ-FS
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 09:19:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyopJ-000Ee5-0V;
 Sun, 30 Mar 2025 09:19:33 +0000
Received: from [2a02:8012:3a1:0:bc2b:32d:d844:1191]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyopI-0095AN-34;
 Sun, 30 Mar 2025 09:19:33 +0000
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
	bh=sUtk6NcT49oh/eI7tK+FbfS31oBr1EZgq64UqSlVvQI=; b=29YQC9ijiOPyFrJrspaT7QyTHo
	8/dn8BC3aXVYvhVP0DfxgQDbVvRStKjL/i1mXy9bdu8Lt2ToNV5obrjwULaAhibWZGsQM5DJBvcX+
	wOss6ZHiw6QmWPTeLehKJ/UaxejP+J0JSgtXXSZdKEK5xTY+dRZ268FNgtwd0aBP/OOk=;
Message-ID: <aaea3429-a0bf-481a-87c3-8af6c7a71719@xen.org>
Date: Sun, 30 Mar 2025 10:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm/efi: merge neighboring banks
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20250328213331.1498584-1-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250328213331.1498584-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/03/2025 21:33, Stefano Stabellini wrote:
> When booting from U-Boot bootefi, there can be a high number of
> neighboring RAM banks. See for example:
> 
> (XEN) RAM: 0000000000000000 - 0000000000bfffff
> (XEN) RAM: 0000000000c00000 - 0000000000c00fff
> (XEN) RAM: 0000000000c01000 - 0000000000dfffff
> (XEN) RAM: 0000000000e00000 - 000000000279dfff
> (XEN) RAM: 000000000279e000 - 00000000029fffff
> (XEN) RAM: 0000000002a00000 - 0000000008379fff
> (XEN) RAM: 000000000837a000 - 00000000083fffff
> (XEN) RAM: 0000000008400000 - 0000000008518fff
> (XEN) RAM: 0000000008519000 - 00000000085fffff
> (XEN) RAM: 0000000008600000 - 0000000008613fff
> (XEN) RAM: 0000000008614000 - 00000000097fffff
> (XEN) RAM: 0000000009800000 - 00000000098a7fff
> (XEN) RAM: 00000000098a8000 - 0000000009dfffff
> (XEN) RAM: 0000000009e00000 - 0000000009ea7fff
> (XEN) RAM: 0000000009ea8000 - 000000001fffffff
> (XEN) RAM: 0000000020000000 - 000000002007ffff
> (XEN) RAM: 0000000020080000 - 0000000077b17fff
> (XEN) RAM: 0000000077b19000 - 0000000077b2bfff
> (XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
> (XEN) RAM: 0000000077c8e000 - 0000000077c91fff
> (XEN) RAM: 0000000077ca7000 - 0000000077caafff
> (XEN) RAM: 0000000077cac000 - 0000000077caefff
> (XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
> (XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
> (XEN) RAM: 0000000077cd8000 - 000000007bd07fff
> (XEN) RAM: 000000007bd09000 - 000000007fd5ffff
> (XEN) RAM: 000000007fd70000 - 000000007fefffff
> (XEN) RAM: 0000000800000000 - 000000087fffffff
> 
> Xen does not currently support boot modules that span multiple banks: at
> least one of the regions get freed twice. The first time from
> setup_mm->populate_boot_allocator, then again from
> discard_initial_modules->fw_unreserved_regions. With a high number of
> banks, it can be difficult to arrange the boot modules in a way that
> avoids spanning across multiple banks.
> 
> This small patch merges neighboring regions, to make dealing with them
> more efficient, and to make it easier to load boot modules.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


