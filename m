Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A25147B2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 13:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317216.536452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOM1-0000cm-IL; Fri, 29 Apr 2022 11:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317216.536452; Fri, 29 Apr 2022 11:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOM1-0000a8-FJ; Fri, 29 Apr 2022 11:00:05 +0000
Received: by outflank-mailman (input) for mailman id 317216;
 Fri, 29 Apr 2022 11:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkOM0-0000M7-7b
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 11:00:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 851bd576-c7ab-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 13:00:03 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-ev0zMhsoOlmHcHOJjS7JdQ-1; Fri, 29 Apr 2022 13:00:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 11:00:00 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 11:00:00 +0000
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
X-Inumbo-ID: 851bd576-c7ab-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651230002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCNHfbP1+2Osqn+Qk2ZaU3/aNHtjuqChHD0R3hCrAPE=;
	b=Tt3FcuWsAiXqmcvwF1qqAvOv+dezRlpS16FMxJ25DgfHJF9reowF2gNYeUDCdmJixTROE/
	wVrIwg/IOMu8t5cPreBJhM7u2I+UM05L4iSz0vhQx1i/nD4WwWJTTUBTJ+ejKtmzHL4QrS
	mbnQGJvZGExZsstkmoBm9ovui9m0kc4=
X-MC-Unique: ev0zMhsoOlmHcHOJjS7JdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDYd8bCUKvf20KHg0xrujZlqT8LIpO5F+m83rZgBXNknDwPUtGj9JLU+IAEhqZ+2QHa6EvxAbr0NzavZ9FV6RVjXSLYV5VT9lsmAu2gj1wdSaDlZtnUAyy0w4rQ3cHZQ5YX1FPGRO9E7AodRAI6Lyj4M94O167vOIJc2i3CEGudvSvSbt/Ku1nA/BKYiGe67BVsBRlDw6IZrOebuPCTRA3zmkOWS7/5/g8jFQcPEKaJqQhsCiTf3rccjM2+u1AjqIFcpNWV3i1q8t5Ob2aqDBEtDCyu9CyqZQfpt5BKY93oJSQOxt4nv2YvJv6W2BhacMZRb0QE+nQLAmwPn9Xph2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCNHfbP1+2Osqn+Qk2ZaU3/aNHtjuqChHD0R3hCrAPE=;
 b=O9rTPch+PKJQKRQsLsn8tQ286EwwC1SvAkJHYEPIZ0p/z2iE9h3UEMkUWjiuWjA6NRXuTzCFG/Zym4959mVmXGREqBNTW+qbN5L6Qv+O1dUtK3MzXh/JZVwDB/M1+fSH2hsWjgn9Opwnc+ZDL8+UlC+rFBjBLqh+VbVpdizBFNOlnu8WLuLNh/Kw88WuxRZD2nxJ76x2q91ka3Zplu5fDFzFX+idqsiTfe8JH82Cs+oNoFb4A8+y3Qs34/4GL7qAEBB7dq8xpZM8o3reoS8QbkLdM7J5etLar6EvFbGIfgiuqVOFoUwghlYR/Tl9Ex2wX/Kg3KsVJhv/ZfcHZ09AEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38f0e56e-f72f-698f-c4c3-5973ec9e46a3@suse.com>
Date: Fri, 29 Apr 2022 12:59:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427104718.81342-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 644d2b14-9ffd-4839-3a8e-08da29cf678c
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB350698FF385BB1492828BDE5B3FC9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DL85ujGkMsCW/9p0fGYFlgPZi6axce7sAh/oqjCXqHRK+Z+FHxlQqnWBTkrSqnAaScxrR6Sy93YqGsU/oXgc+tW0eLRjoS0NUKOA8bbHYznPcUyhrPitcamiMbFRaZ11mpE7ZgAYH9ym+L3ThzlEVMjWjt40lwrWoVoTsVe2zoMJUxna7KivErclqgT+MLEEWzBLXB7c2TssQ1rLYi0zXJPKa8rVmjUqkEq3S3wcNLp0bnoDd4U43RiPqtOku17kOdqiS3ThQpK+tA+Z6iRn5cXFX6hNy0ZpbEh9e98q5/g4ZJ1bs9nOkaXALvDGVb6sJuWvVnqIry2UeGTW8GfcZ/hjrVJ2YeRIuMi34KY867gTM7cKNrzpIwn1Dn7TuM673gBwsKKZGCcz8z5/1YzMku41p4CQVY41WniTzmeo8+WAPS5VOQMCKt0ssb0XDi9cv8sC37vifzNmflIPCs73Dnj9eaUzLTg/DGFvX9yQpOrbegMfMm43rImcpLrrs6ageJ04Yr43yhcjUsLI37+iBAG/a0iClKx9vgzux45zpUAvCrEIf1b8b1PF4deV7Hxk1jJmRnX4EKiV2S/SMAkTi0ANEP+GVbbQCtWCS99WuRbkBOp5Z4sXrIFG1isY2Vmbp/lIAWBkiVipgtQCFvwIQyvE7CYiIc95cS86VliMABkPYYMtWAOjNiByZkVj0wDZxuXGWWKthPV2pUr/UhulvM6PckD/HtWhdftsX+RRFHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(83380400001)(2906002)(26005)(6506007)(66946007)(6512007)(8676002)(4326008)(66556008)(66476007)(5660300002)(186003)(38100700002)(31696002)(316002)(86362001)(36756003)(8936002)(6486002)(31686004)(6916009)(54906003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N05pTjVYaG5hUkxTSyt1NFoxc21lRmU0WDlvK3lXaXpDbXRWbmZmMmZJMjN6?=
 =?utf-8?B?SklpcEFCei9zOENJald2eTlwTGlINVh6SURtOThRNXlXQkpiR2N4M2xQai9C?=
 =?utf-8?B?VU41YmkzVG4raWgraFhrR2c1amdpT2d4ckRUalplOFBDR1lRMTZnVUo5czZR?=
 =?utf-8?B?OHI1TUJzbGFPcDA3N2orcHBtYkw0cUlDaHRQWGpKV0hSMGp4MnFzZkJIVWlj?=
 =?utf-8?B?dkExR05FOGdpeThlZ1pSN3FyLzZENC9BUnJhbm5JVDJUYklQZmgyU09heEZ0?=
 =?utf-8?B?dzdnYzFYOWgvYVQ0bTNHRTVTT2VDUXdiSjBScWRkUExiaFlIREZuT3Arb2pZ?=
 =?utf-8?B?UmpyZmdRbEJSMDNnSzMzc0hiVXgwNWgzbldQWTQ0RkI4c2tScmxxTzdZNjlP?=
 =?utf-8?B?cWxtYXE1MlFFdnBsMC8rSnhwTE0yaDF5dUt3dVFHWGZ0ZU05TW9DUmVWYnpk?=
 =?utf-8?B?aHB4NGpSbnd1bFVKUW1JMXVVQllBbGU2M2JnTkhzNEl5ZHRaSDRMVllJRUov?=
 =?utf-8?B?cmxudi96Z3haL1lQZzQzMWdxZStHME85aVNhSi9pS29wQk0wL1h6OEpIY0xv?=
 =?utf-8?B?dFBzVkV4TDZMdkxCalJtVHg4Q3BVZ3RkMG90cTJDY29yRnBWRzRLaHRKd1Vz?=
 =?utf-8?B?d3BEbmdNRkpmOFRveXBRRFVFY0wrQzk3SGtzbUNrU0wzakZ4Nk8xUVpZNmRh?=
 =?utf-8?B?QkVWUkUvYVF0T3hBeUVGcDdQdEsxUnJvM0JjQU9LQ0ZZS1E3TnE0RGpQdGdq?=
 =?utf-8?B?Qkg3L29teStoWUltRmlTekFRbmRENkoweVN6TDh1bkY1NmJlRFdZUkRJVVpK?=
 =?utf-8?B?K3BXZ1kxUjdsZzNLeXFxNklFR0xUeUwrdTBvbUdVbkFFdTM4Z2ZjbU4xMDFi?=
 =?utf-8?B?TWpuMEhNckMxV2p6Qm9hSzFERFhVSVRpak9zMWNzNVloSDdnSVdyc0JKbHJS?=
 =?utf-8?B?Rlg2RFYyNWQ4OWQvRHdPZGpuYUlOYURuazFOalB6c2I0MTVkcTFuUUlwaERR?=
 =?utf-8?B?NTZWQ2VtcVhwcG5zaCtLZzQyRU1VbHNINkM2R0wvL3dIV3JwV0I5a1ZJazdk?=
 =?utf-8?B?OU5HRFRrWXMwamhuOUdUbFhadWp1clVTTld4U0cvczNPU1lOVW5meWtodmtG?=
 =?utf-8?B?WjJlcDZKZHBuQW8rdnV5WDdyWDJFMXNlTWRMWkd1VlI1VU5hc2hibXRvdC85?=
 =?utf-8?B?aEtmZDdMUjA2dmF1Ylpvc1RsbWZ0WXEzTXQvemY4TCtWUnNpSFN4R3pYanJT?=
 =?utf-8?B?WDRndXJEN1pNTi9jRTJwZ3ZpVDBSelczRTlFcTFiK1AzOTVPMnB5MlpvcDgy?=
 =?utf-8?B?TXhYRk14bytDSmVEdGt0RUxrYVR0NlNJZCtrMmxNdWpXMlVDWEZoeFRmSkxJ?=
 =?utf-8?B?TUliaU0xOGFhKzJGc1FqYldES3k2QlViOXk2VEFjSXNmekcvcWpuNVFZMFdU?=
 =?utf-8?B?SlkxUExUbGVKNndpQ0ZjOFdXeWJqSGtxOUNhREhOeWtOWml3aUpZZDVXcjBK?=
 =?utf-8?B?MG4xSk5YRUVpaHFoZkh0V1hObXVnbndPOC8vb0I4aWQySGhVcmt1QXZpUmRR?=
 =?utf-8?B?Y20yb0ZTOWhQZVBsMVNoOTdjS3pTWE1PaEFyaFhORnRXV0F1V29xSmp5YUJh?=
 =?utf-8?B?d2xiK2tmQlNwOXUwaFUyMnhZM1FLbmNGNGNveHRiSFc1RjFJSWpxWlBqd2l2?=
 =?utf-8?B?ZGJSUlIwa2VlRTZ3eHpBVU5RTW1sM1ZZUmo0d05vT09URXBBSTQrOGxxRkRS?=
 =?utf-8?B?YjZNOTZmRzBSZDk1MnpOOU43MkF2L2RnUjhURnlyeTFkRUk2UVN2VlpXYmxr?=
 =?utf-8?B?R2FqOGhiV2FwOHVvM1NiTDF5aGZ6cmhqOVg5cGEwaWIrNTY0c251alFxM1V0?=
 =?utf-8?B?Zjd2Z1plbjIzRTZKUUlWNXJsZTNBTUV6S1AzcTRUMExLbHZXaGdwVTBwaFVq?=
 =?utf-8?B?YjIvYWRzMHlXZmpDK1FFM1BmMXpWWlQ0dmlmZjhSNzFRdHdzQmFxL3RpVkd2?=
 =?utf-8?B?cmxrTk5GSXNCMlU1em16bld0a0s0SzBoZ25PbGl6NmVYU1ljR0tZaCs3Y0dH?=
 =?utf-8?B?dU9DMmRwRDBnYVdwakhEaEF6M0ZZUGtua1lxdzIrdmhNZFFoV09CdUhuRFMv?=
 =?utf-8?B?WnkreDJZbit5dmRqRzBQK1RVOEhSOXJjL2pPdEJLZUxDMHFLVzZQTnFhMkh4?=
 =?utf-8?B?dnlENDZ3ckYvSkZVZDd5NUtHdGZ1RHhtMEY1TFBhRUU4T01qT0NUZjRCWWw0?=
 =?utf-8?B?WnczbVdHZ0Q3eUpESk9xc0VLZDNDZXk1RlJWNDl2KzgvWHEzbVFIdlNaREd1?=
 =?utf-8?B?NWVNT2NGaStZZlo0OS9TWmozK0hKVmI0eC9BQlhYOVpBYmJVZStzdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644d2b14-9ffd-4839-3a8e-08da29cf678c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:59:59.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grkC3Mx4B6VTdOSWh+vpAM+GDci9HixwNxVMcRFeTxbmHJaU7gbZoV7i/bTBNrMgTwk5FK7Ngnr4kMtV3QmD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3506

On 27.04.2022 12:47, Roger Pau Monne wrote:> Changes since v3:>  - Align ssbd per-core struct to a cache line.>  - Open code a simple spinlock to avoid playing tricks with the lock>    detector.>  - s/ssbd_core/ssbd_ls_cfg/.>  - Fix log message wording.>  - Fix define name and remove comment.>  - Also handle Hygon processors (Fam18h).>  - Add changelog entry.
What is this last line about?

> +bool __init amd_setup_legacy_ssbd(void)
> +{
> +	unsigned int i;
> +
> +	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
> +	    boot_cpu_data.x86_num_siblings <= 1)
> +		return true;
> +
> +	/*
> +	 * One could be forgiven for thinking that c->x86_max_cores is the
> +	 * correct value to use here.
> +	 *
> +	 * However, that value is derived from the current configuration, and
> +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> +	 */
> +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
> +	}
> +	if (!ssbd_max_cores)
> +		return false;
> +
> +	ssbd_ls_cfg = xzalloc_array(struct ssbd_ls_cfg,
> +	                            ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS);
> +	if (!ssbd_ls_cfg)
> +		return false;
> +
> +	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
> +		/* Record initial state, also applies to any hotplug CPU. */
> +		if (opt_ssbd)
> +			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;

Perhaps flip if() and for()?

> +void amd_set_legacy_ssbd(bool enable)
> +{
> +	const struct cpuinfo_x86 *c = &current_cpu_data;
> +	struct ssbd_ls_cfg *status;
> +
> +	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
> +		BUG_ON(!set_legacy_ssbd(c, enable));
> +		return;
> +	}
> +
> +	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
> +	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
> +	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
> +	                      c->cpu_core_id];
> +
> +	/*
> +	 * Open code a very simple spinlock: this function is used with GIF==0
> +	 * and different IF values, so would trigger the checklock detector.
> +	 * Instead of trying to workaround the detector, use a very simple lock
> +	 * implementation: it's better to reduce the amount of code executed
> +	 * with GIF==0.
> +	 */
> +	while ( test_and_set_bool(status->locked) )
> +	    cpu_relax();
> +	status->count += enable ? 1 : -1;
> +	ASSERT(status->count <= c->x86_num_siblings);
> +	if (enable ? status->count == 1 : !status->count)
> +		BUG_ON(!set_legacy_ssbd(c, enable));

What are the effects of ASSERT() or BUG_ON() triggering in a GIF=0
region?

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -544,6 +544,16 @@ static void __init calculate_hvm_max_policy(void)
>      if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
>          /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
>          __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> +    else
> +        /*
> +         * Expose VIRT_SSBD if VIRT_SPEC_CTRL is supported, as that implies the
> +         * underlying hardware is capable of setting SSBD using
> +         * non-architectural way or VIRT_SSBD is available.
> +         *
> +         * Note that if the hardware supports VIRT_SSBD natively this setting
> +         * will just override an already set bit.
> +         */
> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);

With the 's' annotation gone from the public header, is this last
sentence of the comment actually true? Aiui code near the top of
the function would have zapped the bit from hvm_featureset[].

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -3126,6 +3126,8 @@ void vmexit_virt_spec_ctrl(void)
>  
>      if ( cpu_has_virt_ssbd )
>          wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
> +    else
> +         amd_set_legacy_ssbd(opt_ssbd);

Nit: Indentation is off by one here. Of course this alone could
easily be adjusted while committing.

> @@ -3138,6 +3140,9 @@ void vmentry_virt_spec_ctrl(void)
>  
>      if ( cpu_has_virt_ssbd )
>          wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
> +    else
> +        amd_set_legacy_ssbd(current->arch.msrs->virt_spec_ctrl.raw &
> +                            SPEC_CTRL_SSBD);

Would seem cheaper to use !val here (and then val for symmetry in
the other function).

Jan


