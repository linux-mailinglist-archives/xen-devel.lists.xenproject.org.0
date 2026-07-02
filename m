Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DxGULmiPRmpkYgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:18:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599406FA130
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=ZvFsPkNB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=linux.dev
Received: from list by lists.xenproject.org with outflank-mailman.1352166.1609071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfK7H-00072W-EH; Thu, 02 Jul 2026 16:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352166.1609071; Thu, 02 Jul 2026 16:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfK7H-000707-Au; Thu, 02 Jul 2026 16:18:19 +0000
Received: by outflank-mailman (input) for mailman id 1352166;
 Thu, 02 Jul 2026 16:18:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lance.yang@linux.dev>) id 1wfK7F-0006zy-43
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:18:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfK7C-008CkH-TV
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 18:18:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6a468f43-e002-0a2a0a5209dd-0a2a4506d37c-6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:18:14 +0200
Received: from [95.215.58.181] (helo=out-181.mta1.migadu.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6a468f45-08de-0a2a45060019-5fd73ab5ae21-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:18:13 +0200
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
Message-ID: <2f36a2da-0686-485f-b4b9-ae699bef4fd4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783009091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLm6wd6MZy34PotO0lu+sqiieTpRzFwK6t+5eDAyG2s=;
	b=ZvFsPkNBnPpT/fXlkSqC4NvmGcAElqV1ItfaWxOxanuNMADXNea0vysO/aaC9fK20Fa/Nl
	/h+xkuVNERTD1ctetn6nlGPrMQ61CJ3XCqhhkVF860M2M509mqat5nuz+pZfFLHprM1shj
	DZ6Bs3Xsc4eQrpsCTRy6e4DCc3heh0Y=
Date: Fri, 3 Jul 2026 00:17:29 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 13/13] mm/mremap: convert mremap code to use vma_flags_t
Content-Language: en-US
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de,
 maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, lyude@redhat.com, dakr@kernel.org,
 tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, thierry.reding@kernel.org, mperttunen@nvidia.com,
 jonathanh@nvidia.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, hughd@google.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, kees@kernel.org, perex@perex.cz,
 tiwai@suse.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
References: <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org>
 <20260702134947.25189-1-lance.yang@linux.dev> <akaJx8Zt8kazlrjq@lucifer>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <akaJx8Zt8kazlrjq@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-16d1c6/1783009094-C5B3A68D-7765C000/0/0
X-purgate-type: clean
X-purgate-size: 984
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,linux.dev:from_mime];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.l
 inux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:l
 inux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 599406FA130



On 2026/7/3 00:07, Lorenzo Stoakes wrote:
> On Thu, Jul 02, 2026 at 09:49:47PM +0800, Lance Yang wrote:
>>
>> On Mon, Jun 29, 2026 at 08:25:36PM +0100, Lorenzo Stoakes wrote:
>>> Replace use of the legacy vm_flags_t flags with vma_flags_t values
>>> throughout the mremap logic.
>>>
>>> Additionally update comments to reflect the changes to be consistent.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>>> ---
>>
>> The vm_flags_set() cases below spell out vma_start_write(), but the
>> vm_flags_clear() cases don't?
> 
> Yep as I said elsewhere, implicitly taking the lock is terrible and me doing
> this is completely on purpose to get rid of that :)
> 
> But I haven't been clear enough clearly, so I should put the argument as to why
> that's ok in the commit message.
> 
> Will do so on respin.

Makes sense, thanks for spelling it out! A short changelog note
should clear it up for me :D

[...]

