Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G22bD276SGplwQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 04 Jul 2026 14:19:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C698870788F
	for <lists+xen-devel@lfdr.de>; Sat, 04 Jul 2026 14:19:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=SaAUPL01;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1354331.1609773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfzKQ-0006ZN-Jo; Sat, 04 Jul 2026 12:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1354331.1609773; Sat, 04 Jul 2026 12:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfzKQ-0006Wg-Em; Sat, 04 Jul 2026 12:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1354331;
 Sat, 04 Jul 2026 12:18:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wfzKO-0006Wa-UN
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 12:18:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfzKO-002eU2-BK
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 14:18:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a48f9eb-bab6-0a2a0a5309dd-0a2a4505d6b8-34
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 14:18:35 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a48fa19-3cb2-0a2a45050019-888fbc3352b3-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 14:18:35 +0200
Received: by mx.zohomail.com with SMTPS id 1783167502132933.2922733573388;
 Sat, 4 Jul 2026 05:18:22 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783167505; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EfZ9cGjuuv37D6ppIlfjx5EWNVOZLItHTlo2+Y2K7x9cGFZeI9S1RZATbtdhq1o6vDNeU1sRTwRVPO0EsdLekXQv7zFgGGGAl+dmPJnbxS1HyUeCypznftabO8yRYJgwok5PBGmAe/enqeMAjx9A0T110IfGKica3BRn8vfwKgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783167505; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nvPyqzORMvUik+ZDU3iWG4TakUWWBCyUbCCHGUSGanU=; 
	b=nPafiV32pAQA0w9x0f04xLvE3aVCmBt61a/FUdGukPWoMk1Y/Tkj65eh31SxRQEIUpPCU/Cws1YBjYfE269Sbu1ORWuYyPnUX4Jyg2HptcUbj15M98/Rx+LbkMKSmJqWTy3GnTAfC2U0yslYRmaH9534/eKjdLKTEi+Tthn880s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783167505;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nvPyqzORMvUik+ZDU3iWG4TakUWWBCyUbCCHGUSGanU=;
	b=SaAUPL01Q9G13nzfQyeUgzjEMCA12Nt7pxKRzfiggQBRmmCLWfc3RS5IwZgnOfXg
	rWMx8a/nyYKnZxanKCVIAcg+dEUVMalK9EXull/ZyyDEjEBB/AcFqFUs2ehmhuduG6l
	IGgFjJ0JyyZGyr+5lkKsT5WI+xYk76NlTEID0U9c=
Message-ID: <0a6e5076-d5d1-4ae7-9f34-07454881301a@apertussolutions.com>
Date: Sat, 4 Jul 2026 08:18:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pci: Use pci_sbdf_t in pci_add_device()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c201ff/1783167515-0F1142B8-05D1C448/0/0
X-purgate-type: clean
X-purgate-size: 2762
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email,apertussolutions.com:from_mime,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:dkim];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C698870788F


On 6/29/26 1:21 PM, Teddy Astie wrote:
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v3: Don't adjust adjacent code.
> ---
>   xen/arch/x86/physdev.c        |  6 +++---
>   xen/drivers/passthrough/pci.c | 36 +++++++++++++++++------------------
>   xen/drivers/pci/physdev.c     |  3 ++-
>   xen/include/xen/pci.h         |  4 ++--
>   4 files changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 5bbcf3b530..60c02076d6 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -472,7 +472,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>           if ( copy_from_guest(&manage_pci, arg, 1) != 0 )
>               break;
>   
> -        ret = pci_add_device(0, manage_pci.bus, manage_pci.devfn,
> +        ret = pci_add_device(PCI_SBDF(0, manage_pci.bus, manage_pci.devfn),
>                                NULL, NUMA_NO_NODE);
>           break;
>       }
> @@ -503,8 +503,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>           pdev_info.is_virtfn = manage_pci_ext.is_virtfn;
>           pdev_info.physfn.bus = manage_pci_ext.physfn.bus;
>           pdev_info.physfn.devfn = manage_pci_ext.physfn.devfn;
> -        ret = pci_add_device(0, manage_pci_ext.bus,
> -                             manage_pci_ext.devfn,
> +        ret = pci_add_device(PCI_SBDF(0, manage_pci_ext.bus,
> +                                      manage_pci_ext.devfn),
>                                &pdev_info, NUMA_NO_NODE);
>           break;
>       }
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 0adf573150..3038827e28 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -662,12 +662,11 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>       return is64bits ? 2 : 1;
>   }
>   
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> -                   const struct pci_dev_info *info, nodeid_t node)
> +int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, nodeid_t node)
>   {
>       struct pci_seg *pseg;
>       struct pci_dev *pdev;
> -    unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
> +    unsigned int slot = sbdf.devfn, func = sbdf.fn;
>       const char *type;
>       int ret;
>   
> @@ -680,17 +679,17 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>       else
>           type = "device";
>   
> -    ret = xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
> +    ret = xsm_resource_plug_pci(XSM_PRIV, sbdf.sbdf);
>       if ( ret )
>           return ret;

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


