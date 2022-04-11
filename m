Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE24FC117
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 17:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303164.517219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndw9p-0004r1-Bn; Mon, 11 Apr 2022 15:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303164.517219; Mon, 11 Apr 2022 15:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndw9p-0004ou-8e; Mon, 11 Apr 2022 15:40:49 +0000
Received: by outflank-mailman (input) for mailman id 303164;
 Mon, 11 Apr 2022 15:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndw9n-0004om-4N
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 15:40:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0b56f8c-b9ad-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 17:40:45 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-31FY59WmNXOLbUOeWfdFgg-1; Mon, 11 Apr 2022 17:40:44 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6154.eurprd04.prod.outlook.com (2603:10a6:10:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:40:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:40:42 +0000
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
X-Inumbo-ID: c0b56f8c-b9ad-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649691645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kb+DhhD+9SUxowGZBzjTz5FW1HqJximSLjpwkMACALg=;
	b=TBXIWXV85WWW3DCrvNKCrOnybanMJ+v1iHveWc876j41LQBfHryDbM+cOm82orXRJ5CK5x
	/7UEqOSjQhFFVyZj9VaDi4Ahx5JnK9EnUiLAXvcWfUjxuMTOB6DfUDxosZy7ibBX0jxOQN
	UwpGNJlNUrKwHhmEDB7mQsGaEbEAdR4=
X-MC-Unique: 31FY59WmNXOLbUOeWfdFgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNmZgLOKd0Qi68mzBeHCxtz38ubDNa7RVyM2P1rLap5WBMcXu1epAf+a3wD6lUZy3DdTyJGkDBp0u1dM/NL0iagJPQyer/gOjA83ZYsieLJI3a9Z8JF6/EnMWk7dZ/r9MCpX9Ov2zlXVKI6xqN1aERwb+PymegB1uWZ95ewc0EHNnwYphVtx9faQrRe0xqbTgrPNSZaL9QuUClaA3b/33lRQTcCbIt43ptWlXfm4hgsg5tPBpZnkzaGKFoswGIQa4DqRmyeBruEQ0stlsI+A7S4emJNJ2fzweladjRoNzwPjL/rl7fk1sQ29ZYoxFNpXMqh3n0KKCKTaiKe1NN1gsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb+DhhD+9SUxowGZBzjTz5FW1HqJximSLjpwkMACALg=;
 b=WLjp3ShpuDQLqyI/WlD6P18Jt+uKdjY9RJ0CTvF8DOaU8QnDtRKhbRV3C3FgG5SJSw6Uyg2z69WD/HSt4b3IpE9A8p6NlUaKQO8RGizxXLtJhxMHyYoXTTi2DXsND+NBhV/GLdcFSxbkxyTEa9176LrE45HQRdTcopETvWpSccIwLDlXulmYsRTZEKCWkxn+Bk/+VBfDi8uGMh/Uc8whAdsDjOEdKxbiCWfwBaMfZcLqjlkzcwyvaluTETAbMEyVfRS2ezvjoFqRgYrvMDWECIx9B0FO4jIayhwkIlodhTzWdJCVLuPsnITUxzFTCrazfW+qSHmcgmLIavTgWDYCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
Date: Mon, 11 Apr 2022 17:40:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220411152101.17539-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82c65f67-5fcd-4049-204e-08da1bd1a2b4
X-MS-TrafficTypeDiagnostic: DBBPR04MB6154:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6154EA0FC170B36C6A90B856B3EA9@DBBPR04MB6154.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UIBhFzzuwxGn8gQCT9x1n19v3P6ajSGrKChST7cEFB+vFQY9qMWmrSKcknaWeSJYam0K+49MjIczgdkZLSMfGYze8HTchqkKE7plZs9IqPi8jXNGpc8Yd5JSybeMu5wh/BFsXgCqxxuBDivmVq9zAGYr9laIzh7hoGthzhWS+TkOxjuwc8TyXkF9QGP7w0cpN9dJaM7otp5NWutmahJruZ2Eo8Bv30iiYfj7xowfmTe/g3bm/ZRmfJ3mj0tRYXhyKAEbJStLlUstjsqCZZSNq/fKLMI5Fek+iiq9QPdYjeKG/1V8zzy1PHaHVc6ph/FFsCal/ZKiWH86ufExZyI06h5VZ1YE3sVFQBoLDG3THa0SpiZUSu5F3HPTV3+5Y82SwbJQPRqZyv7t8ECCb9rbdPDNi8nOrpdB1E8HHLRFe3c8gCA0FeoGiwLDq9Soj+s0NB1HHu0LAlizENPtg9wLDNFQXCauPbFBtkXnaUwyjb2LLs51+D7QO9jJHh2vqNe6OzIwgaWIU0iEOJZ7XBURxwNZ0AY/s8UlDCq3enEY0Pi2fclu8mnCsczUykBYaFavj2o+ubNXdtM6YeTTHp4x9vSJJala62xJknCMJZKctxIvmijDAEmsQkkDsPPFAIozInPFLuiTtTI/I0O+VufdNtY9G3ppP35USBQ1Uwf5ZxKSQp6NO87Jk7n8jBZVs+6aBJXtop41e/HmkQ1SUCYI/g9eYT5cYNhceypXqm01Ub8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(4326008)(7416002)(66556008)(8676002)(66476007)(6486002)(53546011)(36756003)(6916009)(508600001)(2616005)(186003)(26005)(54906003)(6512007)(31686004)(316002)(8936002)(6506007)(2906002)(38100700002)(5660300002)(83380400001)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWhmT3YyYnV5NFBkMCtQZ3c4L0hiZDUwbFZBdFR6cnR4SjQ0NEhpT0Q3S1V0?=
 =?utf-8?B?T2tBaWNTaXc3VzBoN3pveEhiK3FSZnN6Nk9uQnhNTGQvcjl0YVBZMllWQU1Q?=
 =?utf-8?B?OXMvQi9oMHptNTNpV3RiU3lsZHpFb2VXM2tLZUVmZDZqWTlOM1h5MGhodmsw?=
 =?utf-8?B?OUY0TllUSXpQOFdrR2o0YkpGcGRVaWdNM1BUOUdyaTQzZThzZTY4R3hidmk2?=
 =?utf-8?B?QjdYU09MREFaYjRBVStOYW5kZTAvZUVkWnFnZkxmcjJTVVNmeFpnczFqR3Z5?=
 =?utf-8?B?dysvQzIxc1NVTUoyK3RQZFlSNVUxcTM1Z3dxd3FlaElPdm9QMHFDbnRTN1lu?=
 =?utf-8?B?QmUxY2VveCtvYm5reW55ZUd4YzdjZzV5S00zOUJDSWVObDF2czZndUE2cjFm?=
 =?utf-8?B?UlVWOFpsN2EwS3RFM3RCZUtKb2JBY2pKcnZTa1FrMWtGTlN3b0RubGNHVlBR?=
 =?utf-8?B?eVQ0blV2ekM0MzhXSm9ib2VUOHBLVjRKRjhHNVREQ2xLNmJsdHFCNzBFYWxW?=
 =?utf-8?B?UVZCbUozZjhxODMrdjlFcVh0ZkxxK2pabDF6VWZXTHI5RHhHWjVrRDNaU1V0?=
 =?utf-8?B?RmVENzZpdkVKQVlmWUcxRW5LZlpXRDdKalh0Zk0wbjMwUDhDekVzeGF0ajJq?=
 =?utf-8?B?ZkNwa1B3QWhRd2U5dUpYdmxZdEVrNloxdXZrTU1NQjVTT0tpOFhGS0lCdFdk?=
 =?utf-8?B?VTc4TmpKbUxuaittbEduVmZhZThmMHI1ZkVMb0RYSU15U3RGY012V1pEaUww?=
 =?utf-8?B?SGJvb1NCeHQvQmp2QXRUSDlRS09zZFlNL2tHVVFGQVlzcU5lSWhNbnJ6aUNZ?=
 =?utf-8?B?WVhzNjkrSzhlMXBqeTh0WVFSQUhkYnp3L3VlRGNEb1RlWHpaUVI5YkRDQlhL?=
 =?utf-8?B?Q1hLMDNZK0xlYkFDZHZCZU5QYzVPazdBYldZdzB5dTh0bWh6eWRpR2dnbEE5?=
 =?utf-8?B?WUpFaEdyNnRvY2g0VDJmaFBOMDhMOXNCRUY1YlczK2c5Y0dLeWRsU0U5NTY0?=
 =?utf-8?B?KzZneGE0WUNZNHBjZUNZYmhML3FldXVTOUxINEtBTTlKV3pnN0pGcGJTcERF?=
 =?utf-8?B?b0VZRVgzYllMcTN0UTVBaExYTzJwMlJLbk94V21PV1FmOE1VRlZpd2VzR3Na?=
 =?utf-8?B?NUR3cUpvVVgvOGlXRk83RFNQOWd0cFFUeE5xaEJmVnVRb3U3MG13N3RhTVJN?=
 =?utf-8?B?SnZWVXE5YUlqM2liVndVQlA5OVRwUDJNa3dKZ0h6cDBMb3dzMS8yYjRPenJM?=
 =?utf-8?B?amIyT091T3BxR1J5Y200bGhlT0x5SzJHQ1FhRFN4eXFmSkJIQTIyNVFXbUFp?=
 =?utf-8?B?WUNOMlI4d3ZIUERWamR1K21WbW1tMWZkWmlhSmpBallDQmxDSm9RMklkSUo4?=
 =?utf-8?B?M3RYVlZUVGVTYTQ3NGd6NFdHVHhhSlc2M1B0YmhnMGVnVk1mRTlzTVpIRW1U?=
 =?utf-8?B?YkRqWnpycUUrWExBblJZdllTVFJQZjJTMnROYzlxK0dBTVRwUk8rQkR2QUEz?=
 =?utf-8?B?elR0NVUydTVXNEpuNWhodkx4K0JqRFBmODRxV1NzcFhCT0hWN2p4Vms0cFdo?=
 =?utf-8?B?L1NPaWZDNVMzcGFzN1hXYmhJSDQ2dUs3MnN0U1REVnFxZEdGVkZJQkVLNjFU?=
 =?utf-8?B?N3NyMnFRd2dTRDZFT3N5TDZkTWhFSzByK3hmZG9XUEhmQ1hPN0NrR2tnQWVq?=
 =?utf-8?B?dmxMSXMrU2dkZ09SelZ6d1U3ZStIWlFjQ3VaMWVwM0dLeDZPcWZmWGt5SnJC?=
 =?utf-8?B?U015L2VaVHZ3emdCenZyRmF0ZGNic01lakFQOW92RWNDV0x2NTV3dlRyQ3BB?=
 =?utf-8?B?TFpMaTJFZWh3TnhMY085dGVmQmt5YzFqTEliaWF2cVJyYmxzeUhRVEI5UGd3?=
 =?utf-8?B?WHJDeDdTRTRVejhwa0U1MU5icTJ2dEtFK3hlOTZXUFVEaE9EV0J4TG9rc0tE?=
 =?utf-8?B?Y283R3RxeitibmV0bDgrTDhuTFB5S3VTbUJoRDVKYnB4bnc0N1pMcWFaUVli?=
 =?utf-8?B?NndERU53WEViQWhLSElmMVJlYi9nZG41Vnd5emtMcVZiK3d1eE1ZcWl4ZGtW?=
 =?utf-8?B?aC9IVG5QRk5kQWUySFNzWkJhWFByQU80a1pMMEhLaDdZWThLSTU2QWlZd0lz?=
 =?utf-8?B?RUdmd0dXVlJwaGpsYklpL3lSd1BuRmMvd0pmVnBPeDkycWE0UXRwR2RVenRt?=
 =?utf-8?B?UkN4bUJSd3pRMWdBMUtJMVR0bkJmNkh2YW85dmVnZHNWd1YwTjhzY0ZhQ3Bw?=
 =?utf-8?B?cElDOGgwM25mUlBBZVJWbVZSU0pRYUlvZndMdys5MHBJcGJ2MFRvV25Xbyt0?=
 =?utf-8?B?UFM2Q3hhUkNMbkpYNlFqYllVaXpqNCtLWmtQclJqSG9PSGxJZVZmZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c65f67-5fcd-4049-204e-08da1bd1a2b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:40:41.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNvVUt5vFZlrO94lnU9+QxHRM474ZKD7/3hv7KSK0L/EKe/glSfmrm6pDpRGlHBTcUTncTiPZ6o2DzoArZL6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6154

On 11.04.2022 17:20, Luca Fancellu wrote:
> Introduce a way to create different cpupools at boot time, this is
> particularly useful on ARM big.LITTLE system where there might be the
> need to have different cpupools for each type of core, but also
> systems using NUMA can have different cpu pools for each node.
> 
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.
> 
> ACPI is not supported for this feature.
> 
> With this patch, cpupool0 can now have less cpus than the number of
> online ones, so update the default case for opt_dom0_max_vcpus.
> 
> Documentation is created to explain the feature.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v7:
> - rename xen/common/boot_cpupools.c to xen/common/sched/boot-cpupool.c (Jan)
> - reverted xen/common/Makefile, add entry in xen/common/sched/Makefile
> - changed line in MAINTAINERS under CPU POOLS section (Dario)
> - Fix documentation, update opt_dom0_max_vcpus to the number of cpu in
>   cpupool0 (Julien)
> Changes in v6:
> - Changed docs, return if booted with ACPI in btcpupools_dtb_parse,
>   panic if /chosen does not exists. Changed commit message (Julien)
> - Add Juergen R-by for the xen/common/sched part that didn't change
> Changes in v5:
> - Fixed wrong variable name, swapped schedulers, add scheduler info
>   in the printk (Stefano)
> - introduce assert in cpupool_init and btcpupools_get_cpupool_id to
>   harden the code
> Changes in v4:
> - modify Makefile to put in *.init.o, fixed stubs and macro (Jan)
> - fixed docs, fix brakets (Stefano)
> - keep cpu0 in Pool-0 (Julien)
> - moved printk from btcpupools_allocate_pools to
>   btcpupools_get_cpupool_id
> - Add to docs constraint about cpu0 and Pool-0
> Changes in v3:
> - Add newline to cpupools.txt and removed "default n" from Kconfig (Jan)
> - Fixed comment, moved defines, used global cpu_online_map, use
>   HAS_DEVICE_TREE instead of ARM and place arch specific code in header
>   (Juergen)
> - Fix brakets, x86 code only panic, get rid of scheduler dt node, don't
>   save pool pointer and look for it from the pool list (Stefano)
> - Changed data structures to allow modification to the code.
> Changes in v2:
> - Move feature to common code (Juergen)
> - Try to decouple dtb parse and cpupool creation to allow
>   more way to specify cpupools (for example command line)
> - Created standalone dt node for the scheduler so it can
>   be used in future work to set scheduler specific
>   parameters
> - Use only auto generated ids for cpupools
> ---
>  MAINTAINERS                            |   2 +-
>  docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>  xen/arch/arm/domain_build.c            |   5 +-
>  xen/arch/arm/include/asm/smp.h         |   3 +
>  xen/common/Kconfig                     |   7 +

For consistency, should the addition here - with ...

>  xen/common/sched/Makefile              |   1 +
>  xen/common/sched/boot-cpupool.c        | 207 +++++++++++++++++++++++++
>  xen/common/sched/cpupool.c             |  12 +-

... the new file now under sched/, also be put in sched/Kconfig?

Jan


