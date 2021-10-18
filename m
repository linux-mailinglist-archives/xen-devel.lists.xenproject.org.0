Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B5431A37
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212200.369984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSDm-0004lo-1D; Mon, 18 Oct 2021 12:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212200.369984; Mon, 18 Oct 2021 12:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSDl-0004jT-UI; Mon, 18 Oct 2021 12:58:29 +0000
Received: by outflank-mailman (input) for mailman id 212200;
 Mon, 18 Oct 2021 12:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcSDl-0004jN-9H
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:58:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6327172-53d7-4984-b8ab-5fc41de036a6;
 Mon, 18 Oct 2021 12:58:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-YkFS12LjPJWqzBh5J7b90Q-1; Mon, 18 Oct 2021 14:58:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3294.eurprd04.prod.outlook.com (2603:10a6:802:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 12:58:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:58:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0097.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 12:58:23 +0000
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
X-Inumbo-ID: f6327172-53d7-4984-b8ab-5fc41de036a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634561906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBh4PhXUiSGM5y0kJRwhAu9vswK+nC6+vxL0JOCcpYA=;
	b=aga06lzShJn4g17FEV7StHJ7fqz89I7ELEItaVpS4Ul6BHgNs1mnKfg+mOiHjgxoa8o1yk
	EimqYTdoQ3h6cbW6LEP2/d69Cwh+s3PLPykC0IB9MYsq/WJc0ZPnu/fy/myDM3dCS/ouva
	065Ta/x/zB+OyH7m8fTq4bEpphS9T6s=
X-MC-Unique: YkFS12LjPJWqzBh5J7b90Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMr9Z7EWTMZ7OkSVzn/bqffpF5fQD+MKEb10kwH0IffmJim20uB1VLTSf7r4rGtSyoX7+rFZ6LLMj+GBawsOjsfPW5+IblRg/8OMef8r2kpRHnizx8WVhsmP1Nu3yK8V0yAgipJRcPIrAtQ8kk61rEfOC94ODeSLhCUNsUTcKEqgrzITuBPh1UXKgh8aBP1Q1IdHSchdLUYxki0XrrPtBR5Gkyt3BrArGaeBOt/XMKm9KHjaP+/R9BXQn/ea2FOa3ipVd0mq6TkND+4hMC1wFcuWBvne0zu80FdhXs2ThOydKH8xlJoJ+N5IA4wy5AZtjjiM9s8xcIb9d4dltYBP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBh4PhXUiSGM5y0kJRwhAu9vswK+nC6+vxL0JOCcpYA=;
 b=AqYHvvc5cnmhZ2wEPJLjsfW4J1Zc0YAONkzXt6UXG9G1RsWp04uPdKJBln1gJJGVsZ812R2O412SeCMkGigyE+uJ4Bwra300yVM0mPGcKcpY3hTYHTHaMVdrYcNWdyr5nGCWIsEx6JKxQOrbwLgEqrkfLzZnNiBPkYRFx0TA1c3QyzfLbl7nne5YA0AQH5nY6i5j0uVzxOrTZOLjPegHfOoBcXQ5j1DZt1ywrgeAQVzv8fV1AZeuiD2TBq+wKAOkYOAhgJ3H/WeCSiEGRMRjOUf7sueqYc1JATxgAUDxAolvgx3yz2ZjadXq1hynpJq6QkYIujTR/BpvKAKiMvj2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
Date: Mon, 18 Oct 2021 14:58:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0097.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c8854e0-bc33-4bba-cc16-08d99236f860
X-MS-TrafficTypeDiagnostic: VI1PR04MB3294:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3294AB72772A1F978A9F217BB3BC9@VI1PR04MB3294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cJum7pBPgOYUZMWI5p9yln0fZlpvGdz2RT5DspDD+h72brvcqUq1n2L75hMdPZV/Z673ypF2vcSB/Iq36EHsmlBCdulOi9ySQCcnS9AxfK18iAp82DcOpO6Fq7ud9QMKk//Yrp0UHqp3FpZ0RSBaOt5KauBcps+os65rpgT0sySrzb7vAze8NUZDn6n2CxN8mRO2H9QC/PanoguiMXe0xT+9AzXnnpfaWKyJlnySbnNu3YQ9NmXYU296NKUhBM6GgrP8Z+E/+uAPiz9XW0FJD8Vb3PixbmvD96XXbuW7eehoC4AyoyEqdPecekdbOxmnZMdcw/rQJkvvZ40E17cfIT4wKXuWZmicJpr7zIx9eVQpfqOlyh8Ty/iMND7VitLPEMQcmuLDIDghpKxL3HR5x+6J/bDUTY30oWwTmrjbMvedM923vO1lamTPbjM4KuFwRMCft+LRdC+3Pl52vLUWGuccNfpCRIHOl5ruLE71MmRnj5WORIscaHKgMcIbpTvXK19eE8v3jCM2MuSdKV9tHmpYeVzYxxJu9sZWKZyVs5tDekrtR+WVFQbulbcFNctYJoRpn9qxeG1Vk2k7ClHVzEeL5kUu5NGYQqy7su5Wwh5IxZFDOJBWr3cEWadbXkNs59x9pCp/mMr7iD4radgrQm20hvN/e0PC4wcgg4aoJylYMC0RImIuasEOUuoK7yS2iMRlNWcRbQG+Qs08wtepIEsIdtccrbPy4Z+jPklVy2oUv20zDL8R8KeBAWOlZjDX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8676002)(4326008)(5660300002)(6862004)(8936002)(6486002)(66476007)(186003)(36756003)(956004)(31686004)(66556008)(26005)(83380400001)(86362001)(66946007)(508600001)(6636002)(316002)(54906003)(37006003)(2906002)(31696002)(16576012)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGswekpQMWE4M3RqemFKTUNKT1ovZG9NWk1leFF0di92ZkVFVmJ1dVc2ZW5i?=
 =?utf-8?B?NEF6czRTa2ZMSTNoWjZvMkVUdHNodlg0aGIxNUo3L0RoQjN1c3U2cTJCRjNq?=
 =?utf-8?B?WnF2TVhEWkNZTmdXemxuZlI5U3E2NzFUVlhndGVDS0dKYjlYbEY3U0s4ZHFt?=
 =?utf-8?B?RGZhNTlPa3J0bFl0aTdzZ1RBYjdGNkFBU044SkZvQW1aM1A2Zjk5NkFNQWcy?=
 =?utf-8?B?QXZFZE9iVnJYS2VyVWFwVHBXK0FRWmtkaFI4YlJLLzhjdkE2SHRxR0xFQkJr?=
 =?utf-8?B?V1YycUJvWlphY2J3WUlWWWhPTitxTlNvV2paZXZ0NmIvOUtVNGtycHJMb1Jo?=
 =?utf-8?B?QU5sWEd2VUJZc1lrV2crdkppM0l1L29vMzl6cE43TVpOS2NmZU1ONVloUzMx?=
 =?utf-8?B?djc5aEduQjREMlpYMm15dlh2NThtdk55a1lOcWptQjg1Mng1SDFMMURlV21y?=
 =?utf-8?B?TWdTaEhRNU5hNEE3ZGtVaWFjMVdNRFFLRzQ2MXA5Y0x6d2RTOXJ2T21QVDJS?=
 =?utf-8?B?Y0dhUTNsQk5Ubk1oQTZBUmFiZi90UTk1VXptU1htRER1T0V5ZHhvU1owY1g0?=
 =?utf-8?B?UWFSczR1TFhVcXRMZHAvcDYwU0VvcTZUNmpBajRTdUZTR2dUV3pZRXYvUUQz?=
 =?utf-8?B?ZDJGRGFyNHN4aG9FdXlTV2EraVR4d2RmeHE2ZzFKTmtGc0Ixcys2VTVCdEtm?=
 =?utf-8?B?RUhyc2ZxYXI5UjAyRjZtZSt0WG1XUHJkYWRKemxxYmFJWFZWSnZPN1F1V1hH?=
 =?utf-8?B?TndnN0RuWUZnY0ZrVzVZV05IcHVDZ0g4enNxSmRNNVJVVFBacER2V3Vublli?=
 =?utf-8?B?d05DL3N2MjNVVHBsSUhHblQrcURlZ3I3REdIOUkvdmZ2S0x3MkpBbm1waGdw?=
 =?utf-8?B?NFFiL0E5bGRENGJyaUlmRzh5K2JnblA0S01TY0ZGbUNrQjJudlNkVUtGV1ZH?=
 =?utf-8?B?ak05QU8rRXNZc2RBc0I4M2RYbDRZZG8xUWJpTWc0ZjFLOE5VdFFaRkU2OHdQ?=
 =?utf-8?B?eDFrWUsxZ2VTb29WSW5LVU1VTzFOZ0RkT0NySVQwZ3J5dDBYVEowSE5RRXoy?=
 =?utf-8?B?eTZwTFdDZXM5eUtueGdEM211clZDdVgvM0FtYlc4M1BNQU85L1hXTDdUUWUv?=
 =?utf-8?B?bWVxdi8ydjJkSWNvYjRUQ2JmdFdsMUt0UG1vZHEvM3RId3NwR01Lb2dtL00y?=
 =?utf-8?B?d3B1ZDIwTGZVZ1FsRUxuMkt1V1ZmbVNabGRtZkZIdEpCejByd1pHQ2xhN2x4?=
 =?utf-8?B?Y2hZTHo4UlUrOFI0VXBOWHNXeXNnS3FVTEVDdW80N095QXg4Y0dlNnNOSExF?=
 =?utf-8?B?YjlRajd5RjhsYlRIeGRaTkZHdUVEeWVsam1NYXlHQVlDMWNuNjNkVlZQMzds?=
 =?utf-8?B?NzY0b3E5dEJqOHMxM1MzdWFnTXM1Z1ZYVlZmU3VuQW1sNlFRdmwwKzBDbVp0?=
 =?utf-8?B?czh4T05HVmxMd3RXYk84M1VlOHRudjEyeVVjYzFnUVl1QVRTUERiQ0hCL09z?=
 =?utf-8?B?RHlKTmFqRHpBS3dLZkN6R21jdGNjQjV2aG9xc3Exa1ltVnJ1bXY1Rm04KzUx?=
 =?utf-8?B?dzVHekVFZ05qcWpkbkRBTFBTdVpQMFo1a3hqdHF5aG0rRWJtZzQxeTBESnVk?=
 =?utf-8?B?OVFUaW1OQ2FpaVVGVGkvdS9SVTVVNGhmQmpyMFdTNVRGL1hVZjFtUXl2QXhn?=
 =?utf-8?B?aVhNcURUYy9IVGdPeFR4em9LL2lqVnVZdHdHa3NOQ0MzekFsMnpRSk1TVERV?=
 =?utf-8?Q?EDXgXk7HnhzufUR4DLF6vGhmVXkZzRgkNUbWEeV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8854e0-bc33-4bba-cc16-08d99236f860
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:58:24.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsV5ViJOP3Gbh4pSNM8064Mm1naNNHhHSCpLU72AAjAKJEL5vyDN3afneDFAyVeK8WdQndamMdwf10hl/DKBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3294

On 15.10.2021 14:51, Juergen Gross wrote:
> Instead of repeating similar data multiple times use a single source
> file and a generator script for producing prototypes and call sequences
> of the hypercalls.
> 
> As the script already knows the number of parameters used add generating
> a macro for populating an array with the number of parameters per
> hypercall.

Isn't that array intended to go away?

> --- a/.gitignore
> +++ b/.gitignore
> @@ -332,10 +332,12 @@ xen/include/asm-x86/asm-macros.h
>  xen/include/compat/*
>  xen/include/config/
>  xen/include/generated/
> +xen/include//hypercall-defs.i

Nit: Stray double slash (unless this has a meaning I'm unaware of).

Yet then I wonder: Shouldn't *.i be among the patterns at the top of
the file, like *.o is?

> @@ -466,6 +468,14 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
>  	  echo ""; \
>  	  echo "#endif") <$< >$@
>  
> +quiet_cmd_genhyp = GEN     $@
> +define cmd_genhyp
> +    awk -f scripts/gen_hypercall.awk <$< >$@
> +endef
> +
> +include/xen/hypercall-defs.h: include/hypercall-defs.i scripts/gen_hypercall.awk FORCE
> +	$(call if_changed,genhyp)

As per patch 5 there are quite a few sources including xen/hypercall.h
and hence (in one of the next patches) the header generated here. If
this one gets re-generated for a benign reason (i.e. without changing
the header), all dependents will get rebuilt for no reason. Use
$(move-if-changed ...)?

> +prefix: do
> +set_timer_op(s_time_t timeout)
> +console_io(unsigned int cmd, unsigned int count, char *buffer)
> +vm_assist(unsigned int cmd, unsigned int type)
> +event_channel_op(int cmd, void *arg)
> +mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
> +multicall(multicall_entry_t *call_list, unsigned int nr_calls)
> +#ifdef CONFIG_PV
> +mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
> +stack_switch(unsigned long ss, unsigned long esp)
> +fpu_taskswitch(int set)
> +set_debugreg(int reg, unsigned long value)
> +get_debugreg(int reg)
> +set_segment_base(unsigned int which, unsigned long base)
> +mca(xen_mc_t *u_xen_mc)
> +set_trap_table(const_trap_info_t *traps)
> +set_gdt(xen_ulong_t *frame_list, unsigned int entries)
> +set_callbacks(unsigned long event_address, unsigned long failsafe_address, unsigned long syscall_address)
> +update_descriptor(uint64_t gaddr, seg_desc_t desc)
> +update_va_mapping(unsigned long va, uint64_t val64, unsigned long flags)
> +update_va_mapping_otherdomain(unsigned long va, uint64_t val64, unsigned long flags, domid_t domid)
> +#endif
> +#ifdef CONFIG_IOREQ_SERVER
> +dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
> +#endif
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +sysctl(xen_sysctl_t *u_sysctl)
> +domctl(xen_domctl_t *u_domctl)
> +paging_domctl_cont(xen_domctl_t *u_domctl)
> +#endif
> +#ifdef CONFIG_HVM
> +hvm_op(unsigned long op, void *arg)
> +#endif
> +#ifdef CONFIG_HYPFS
> +hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, unsigned long arg4)
> +#endif
> +#ifdef CONFIG_X86
> +xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
> +#endif
> +
> +#ifdef CONFIG_PV
> +caller: pv64
> +#ifdef CONFIG_PV32
> +caller: pv32
> +#endif
> +#endif
> +#ifdef CONFIG_HVM
> +caller: hvm64
> +#ifdef CONFIG_COMPAT
> +caller: hvm32
> +#endif

HVM selects COMPAT, so I don't see a point in this inner conditional.

> +#endif
> +#ifdef CONFIG_ARM
> +caller: arm
> +#endif
> +
> +table:                             pv32    pv64    hvm32   hvm64   arm
> +set_trap_table                     compat  do      -       -       -
> +mmu_update                         do      do      -       -       -
> +set_gdt                            compat  do      -       -       -
> +stack_switch                       do      do      -       -       -
> +set_callbacks                      compat  do      -       -       -
> +fpu_taskswitch                     do      do      -       -       -
> +sched_op_compat                    do      do      -       -       dep
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +platform_op                        compat  do      compat  do      do
> +#endif
> +set_debugreg                       do      do      -       -       -
> +get_debugreg                       do      do      -       -       -
> +update_descriptor                  compat  do      -       -       -
> +memory_op                          compat  do      hvm     hvm     do
> +multicall                          compat  do      compat  do      do
> +update_va_mapping                  compat  do      -       -       -
> +set_timer_op                       compat  do      compat  do      -
> +event_channel_op_compat            do      do      -       -       dep
> +xen_version                        compat  do      compat  do      do
> +console_io                         do      do      do      do      do
> +physdev_op_compat                  compat  do      -       -       dep
> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
> +grant_table_op                     compat  do      hvm     hvm     do
> +#endif
> +vm_assist                          do      do      do      do      do
> +update_va_mapping_otherdomain      compat  do      -       -       -
> +iret                               compat  do      -       -       -
> +vcpu_op                            compat  do      compat  do      do
> +set_segment_base                   do      do      -       -       -
> +#ifdef CONFIG_PV
> +mmuext_op                          compat  do      compat  do      -
> +#endif
> +xsm_op                             compat  do      compat  do      do
> +nmi_op                             compat  do      -       -       -
> +sched_op                           compat  do      compat  do      do
> +callback_op                        compat  do      -       -       -
> +#ifdef CONFIG_XENOPROF
> +xenoprof_op                        compat  do      -       -       -
> +#endif
> +event_channel_op                   do      do      do      do      do
> +physdev_op                         compat  do      hvm     hvm     do
> +#ifdef CONFIG_HVM
> +hvm_op                             do      do      do      do      do
> +#endif
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +sysctl                             do      do      do      do      do
> +domctl                             do      do      do      do      do
> +#endif
> +#ifdef CONFIG_KEXEC
> +kexec_op                           compat  do      -       -       -
> +#endif
> +tmem_op                            -       -       -       -       -
> +#ifdef CONFIG_ARGO
> +argo_op                            compat  do      compat  do      do
> +#endif
> +xenpmu_op                          do      do      do      do      -
> +#ifdef CONFIG_IOREQ_SERVER
> +dm_op                              compat  do      compat  do      do
> +#endif
> +#ifdef CONFIG_HYPFS
> +hypfs_op                           do      do      do      do      do
> +#endif
> +mca                                do      do      -       -       -
> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
> +paging_domctl_cont                 do      do      do      do      -
> +#endif

I assume the intention here is to sort by hypercall number. This results
in 3 PV_SHIM_EXCLUSIVE conditionals when one might do. Just a remark for
consideration, not strictly a request to change anything.

Jan


