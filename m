Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1E4610DA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234360.406741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcgV-0001N1-Hn; Mon, 29 Nov 2021 09:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234360.406741; Mon, 29 Nov 2021 09:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcgV-0001Kz-En; Mon, 29 Nov 2021 09:10:51 +0000
Received: by outflank-mailman (input) for mailman id 234360;
 Mon, 29 Nov 2021 09:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcgU-0001Km-CF
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:10:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e05ee6c-50f4-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 10:10:48 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-50_XIFP6N5isC5GZoBPbFw-1; Mon, 29 Nov 2021 10:10:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 09:10:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:10:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0143.eurprd04.prod.outlook.com (2603:10a6:20b:127::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Mon, 29 Nov 2021 09:10:45 +0000
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
X-Inumbo-ID: 3e05ee6c-50f4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638177049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KqEtdF6b8e6P1Mb32jkTsVPi0STtOfseFIL0jFb6joo=;
	b=dnm6cdsNpeBJHqQIyGJ7G3H18Sd4s7F6g+FIsj8/BAVeHJsA0bZy9w1TkvTNrbBhacn3rK
	tnGJvFetQeXKEQzbzNsSWYOHcQM18NzeWdjNn5DyE10LmOA/zq74fV6uBRO1OQ8v0HWm8t
	mp7vh3kikkQ3anMDVI2+05skWsNBpDk=
X-MC-Unique: 50_XIFP6N5isC5GZoBPbFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz8BlGsnmconm4WglBK+B/KkwvoyhB9TmMABC20VlhFblBwHWiLk0U+Iu1pxMOFGxfL/P/ndFYKesKlcVdl7tRdA1CS0+j7Oa2IFsxCTDdCT16vf/XzOyHBxP2SaCKXyy1fkmGhQZBIWMJw2OIsAA2GdgmuQlmqAwQxOvitA5SmrT89UTjNElyPdGWlmL+jUYw+nC6xVmx8bGXqM0mrqlQTDYHcctJw/kR+zCdJLVilhhReiIfZuAFXn7C6Q0wE6gW5E9t6UP7bbR2JBSPwr8BtMfnk3K/y7LE++BQw1RnMtFhS2iz/4Fkdzw2V4hCmEJUa9LSLsLBBsldwxo4d1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqEtdF6b8e6P1Mb32jkTsVPi0STtOfseFIL0jFb6joo=;
 b=OMy1jTIhHadUs/+JNMP7qpE3s5TTxGGXwflvMNltM5OH/7HyZ29LzSAQ2Y3E5MBZWx7A/KdJBWbPvf4ydepe1uDFFDKP21rQe3U1M8uaY2kE36kxxY2AxnoWxwNXfE2ogXAxByYafhUs2PpDv0hplztO8SpF6DPcZBRsfWSftx/uQ/N+n+1scfEsVzA+TYsixX9xoPoHC6LAR3C7aCRGIS8KYIiVTOpOkjOtkdAS+wra6TLSu5WO6+GDEwscyIWPtq4nv9ENyCNJiFl7c/IdDyDvav/GdzUfS278hRk8OO3XS1UEHvVpqT4unPe4HrWV0gADqliU8AFW1SqnOx7Y4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66e64fc5-34f1-7877-42b1-3533136f56ab@suse.com>
Date: Mon, 29 Nov 2021 10:10:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/3] x86/vPMU: invoke <vendor>_vpmu_initialise() through a
 hook as well
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
In-Reply-To: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06afb1c9-779e-4930-e0b8-08d9b31820c9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469BDEB45F5AD280841D3B8B3669@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MfQI6+XlGO/KOaJ1UUv+//QxtbUdeWxF3bTpSW+dgR5rVRDuFBJIt5rj/HmBKgRq86ASG3wnXimDsMn3weVAx/OjyevJ0Y6sZiDINVZ1unHB+qo4oxEBBpbwmaGaZy/iwvy7h4fB48pfskvEFd1koSav7NUKYfERDPNzji8J7GIT2+qNMDu4WjrZUGq64gzyBgRwTa6TmrDP4FoyN8UeFIsP7O51Gn+UA4RBg1g1ctjdNuXAAYgTIl/1Bvj8K8cYDBvLi1g6yMFtCc06g4KmVtC5xMXMdoGkJfucWoiKXXtvmFCPpYo6K8O74fngoUIZeIaep3CgXAi0naqFYLDqDNipSNk/++Z+zClyw9EF0jq6BhFR9Viyno+JFKbtqV9/qUssrDh+ZPQTMGtr0fcxnFghTmUHz6dPL0naUt9oqzEhwjNCnStF86l0wiWKsLN9V+dCEfpc9EvWLznfjs9ncaAAIvqnarDaX/3+h2VbzB5MPTC2ROY4EdC6qZ9TJjTqSeyg9pTcZgpTgxpjnRusENL3ofsiS1OIkqopMH2JOXstL0FL+TWP+BYUpdkz20Ym6v+Nsk056Q4oyS4FuwSHAGm9vMX6i9QUkutGd9MfwJuCFjEVXtha6m+CcvLKWsUGfWzfaUuapJt+Xx8rIINF8k9eoy9dviqbKTIMw0RO4krNHCUO9CG8nmJi/Rau316Mw0SolU7Hvsy2uPM7Jcht0wAjiDCNXKBmiQjjSxkYK6tHcNtGLdsrrWQGiZNDds2O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(5660300002)(31696002)(956004)(2616005)(2906002)(186003)(316002)(36756003)(54906003)(16576012)(26005)(31686004)(8936002)(6486002)(38100700002)(508600001)(4326008)(66556008)(66946007)(83380400001)(66476007)(86362001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REpDZUI0RkdvWHhoQXV1bS82Q05qVnlidkp6RUJEQytFYnVnR2ZxbFQxRlpU?=
 =?utf-8?B?MmM0dVZNZ01XRzU0ZFhURDdOSWluSmhJUUlHa0lwWWpRL2N4MlNJVFZ5ZVJi?=
 =?utf-8?B?Y0o0UUtwZkxuejhFbUtVc042RkZ2RUo3NEg0cEZ2OVhLSzJhcUR4dW5zM0pV?=
 =?utf-8?B?UXc4eXpTY2hOOWd6ZjR6TkQ0ODlEdVJyZjB3ZGhtUEY1ZTlyd25GQk5qWlU3?=
 =?utf-8?B?N0Z0SVhpaXhrMGNjdS9wS3NuOEhOblZBMjZydDg5NVhrNmM5Slhwc1RVa3lG?=
 =?utf-8?B?OUtrUjlQSTVOM0VlaSs2bnNJWEZPY3Z6R2d5cHc2WU9iTGp6VktWWFpreUdF?=
 =?utf-8?B?TSt2VVJYNzFMYTBnRlJBSTJMaTMwQUF2anRiNGJ6ZC82R3Q0YXAzekIxWXE0?=
 =?utf-8?B?S09ha2xJaVBvT1VPTlhkQXhBWW0wYVNRNjNCY05IZ0tmd25WdEUxUmJ5Wkdi?=
 =?utf-8?B?b21TdmxvR3BMN1ZGWUJOMHVDSGZaNjZ2SWNHMTZVa1NCUmtQZ3pLUDhITklW?=
 =?utf-8?B?YWMvc21ZdW9JVUpFRzJFQ05TeFpuRGFzUzlucE95cmJ2d2hSVitFd0d2WDBP?=
 =?utf-8?B?NVVDNVcwTnpWcFZKby9aM3l0Ulk1TzV0b1I0VFBOUU1FWjBZWXo5MlJkSGxu?=
 =?utf-8?B?Ri9YaGR6V0NVSTVvREx2bWx1R3JJSkVZaTRMRzExckE4dGc5KzdGOUVSSzhR?=
 =?utf-8?B?aE4xSmR2VHd0ODYwcFBhdnFlR1dId2EydXhrZEpSbXNFUHdxdzY5dWhaWFh4?=
 =?utf-8?B?dmhnL1RVVC9OMFJ2VUFGZ0MrZHhId2ZNOGZoS0J5Rk1vTExBZloweGxyeUwv?=
 =?utf-8?B?eml4Um0zZk9OaXpMODFoUEZlYVlDYnhIYlVyOUM3N1BkRk1Rbkd0T0EzNDkv?=
 =?utf-8?B?OFpQM1REZnNhK3dxM2RzK2VMZFpvT0NVNERSSUhmQ1BIbWhURGpwYURsQWMw?=
 =?utf-8?B?YkMxQlo1UDBMRGd5UXB2WisvV2wwaWRLRWJOWFJEeSs2Qk1EWndqRkR4OHRk?=
 =?utf-8?B?QXdWRTdCZ1BlUGNpUVdSaWg0VE5EZGx5TEJ6U3NkRCtmODJQS2lUVTFPMi82?=
 =?utf-8?B?K2hzN3NoR3ZaR3Y4WUtld2tkZ2V1L2RtS0Y0Q2x3bVV3V29DNHN1VE4wM25h?=
 =?utf-8?B?T1ZaMnluRzArVjFNeGVWMzhPN3dqTk5QK0ZTcnBIU2Z1bkNLbFZ1cDRRWlBK?=
 =?utf-8?B?VzN2cFlpajEvZjVncW42K2k4aHFlMiswRmVzUVV1T0tuUkxQUFR4WUFDRHR6?=
 =?utf-8?B?NS9HeTAwcGZJTGg2VGVHQnFHczBOWWcyUCtIallOcTZ0TUFvQUlmK0lMYmNM?=
 =?utf-8?B?SlpEbTMxQmZ3VVA1eDd0Z0o1d3lBTUVvK216TG81L1Z5RHR6OXNvYnZ4Ylp6?=
 =?utf-8?B?VlAybDBKc3BJOEpWaHFCa0Y0U1FYUVFQVzJLNy8xNkhnNEZPaXA5c0tBcVBV?=
 =?utf-8?B?Tmh1YndLb3RLNlFrdS9KZzJkWHdKeHlhVXhRUmthemVvdXBIVHdMRHVOWU1U?=
 =?utf-8?B?aHBVNzE3L3ZpWHZYbnR1SEk1VFo3cW15UVhWbkpBeHhWL0JRNnM0bWYyd2l6?=
 =?utf-8?B?QWR4bURsY0Nrd2E4N2RMbDRDNWlWbVdxSmJNbmxxK1VaT3lSL0M4YXZzd0Jo?=
 =?utf-8?B?N0VSTU9kUDBodi9oZjZzN21LOFlDUEpVWktRYnZkMTBOeW5zRnRMVmttTXZ1?=
 =?utf-8?B?b2tsMHVCZk90L1NBcFZiZEgvUEt3VXZ1OGFMOWR0TjFvMVo1ZlJKWXc2U3ZH?=
 =?utf-8?B?M3ArdDJpNUJ2dWhKSERndmhDbVF2OGFiVGs0RHVkNmdhRnluOXJpSXRHWThC?=
 =?utf-8?B?OG1PUGdtcTIxNnJUbnd1R3czdWlubTlCaEhXbWtMNVNLdHlGRUpzWDdWN0xF?=
 =?utf-8?B?cjhSNTJCRVhDNHIyWEZZU0RPMzZsVHhhblUzWjZCSnlNc3dhc3NjRkluZ1gr?=
 =?utf-8?B?bmpNYi9FMTBVZWwvNmNMWjc2S0dCZzlEc0NsVUZQUDI2U2FTL0xIaFcwMXgw?=
 =?utf-8?B?b05Kd1dqY2d3VWdGU09WVnlWcVBmK252a2huMWpoMlNHdXdlSy9WY1JIVlVF?=
 =?utf-8?B?aTRxWVd0Vm11ajRTQnlDNkVJMVp6MmJXRGRMV3FOanJ5dGY1TW5uQ1crOUUw?=
 =?utf-8?B?Y0xwVEdBRytDbXpweUFJOUVabitIeW1janNpaVVZd2FMMkNxcit1a09ERG94?=
 =?utf-8?Q?o/g86ztVZwHouQaKtAhxQoA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06afb1c9-779e-4930-e0b8-08d9b31820c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:10:46.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuzpchk4NJLEegX/gxtoOcia4S18TLBgfwOQs7SBQi+7qbjEwq6BaPe3RlX6KhSem7hGz+Dg/m/2uDAOkZDMWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

I see little point in having an open-coded switch() statement to achieve
the same; like other vendor-specific operations the function can be
supplied in the respective ops structure instances.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -455,21 +455,11 @@ static int vpmu_arch_initialise(struct v
 
     ASSERT(!(vpmu->flags & ~VPMU_AVAILABLE) && !vpmu->context);
 
-    if ( !vpmu_available(v) )
+    if ( !vpmu_available(v) || vpmu_mode == XENPMU_MODE_OFF )
         return 0;
 
-    switch ( vendor )
+    if ( !vpmu_ops.initialise )
     {
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
-        ret = svm_vpmu_initialise(v);
-        break;
-
-    case X86_VENDOR_INTEL:
-        ret = vmx_vpmu_initialise(v);
-        break;
-
-    default:
         if ( vpmu_mode != XENPMU_MODE_OFF )
         {
             printk(XENLOG_G_WARNING "VPMU: Unknown CPU vendor %d. "
@@ -480,12 +470,17 @@ static int vpmu_arch_initialise(struct v
         return -EINVAL;
     }
 
-    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
-
+    ret = alternative_call(vpmu_ops.initialise, v);
     if ( ret )
+    {
         printk(XENLOG_G_WARNING "VPMU: Initialization failed for %pv\n", v);
+        return ret;
+    }
+
+    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
+    vpmu_set(vpmu, VPMU_INITIALIZED);
 
-    return ret;
+    return 0;
 }
 
 static void get_vpmu(struct vcpu *v)
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -483,24 +483,11 @@ static void amd_vpmu_dump(const struct v
     }
 }
 
-static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
-    .do_wrmsr = amd_vpmu_do_wrmsr,
-    .do_rdmsr = amd_vpmu_do_rdmsr,
-    .do_interrupt = amd_vpmu_do_interrupt,
-    .arch_vpmu_destroy = amd_vpmu_destroy,
-    .arch_vpmu_save = amd_vpmu_save,
-    .arch_vpmu_load = amd_vpmu_load,
-    .arch_vpmu_dump = amd_vpmu_dump
-};
-
-int svm_vpmu_initialise(struct vcpu *v)
+static int svm_vpmu_initialise(struct vcpu *v)
 {
     struct xen_pmu_amd_ctxt *ctxt;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
-    if ( vpmu_mode == XENPMU_MODE_OFF )
-        return 0;
-
     if ( !counters )
         return -EINVAL;
 
@@ -529,11 +516,22 @@ int svm_vpmu_initialise(struct vcpu *v)
                offsetof(struct xen_pmu_amd_ctxt, regs));
     }
 
-    vpmu_set(vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED);
+    vpmu_set(vpmu, VPMU_CONTEXT_ALLOCATED);
 
     return 0;
 }
 
+static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
+    .initialise = svm_vpmu_initialise,
+    .do_wrmsr = amd_vpmu_do_wrmsr,
+    .do_rdmsr = amd_vpmu_do_rdmsr,
+    .do_interrupt = amd_vpmu_do_interrupt,
+    .arch_vpmu_destroy = amd_vpmu_destroy,
+    .arch_vpmu_save = amd_vpmu_save,
+    .arch_vpmu_load = amd_vpmu_load,
+    .arch_vpmu_dump = amd_vpmu_dump
+};
+
 static const struct arch_vpmu_ops *__init common_init(void)
 {
     unsigned int i;
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -819,25 +819,12 @@ static void core2_vpmu_destroy(struct vc
     vpmu_clear(vpmu);
 }
 
-static const struct arch_vpmu_ops __initconstrel core2_vpmu_ops = {
-    .do_wrmsr = core2_vpmu_do_wrmsr,
-    .do_rdmsr = core2_vpmu_do_rdmsr,
-    .do_interrupt = core2_vpmu_do_interrupt,
-    .arch_vpmu_destroy = core2_vpmu_destroy,
-    .arch_vpmu_save = core2_vpmu_save,
-    .arch_vpmu_load = core2_vpmu_load,
-    .arch_vpmu_dump = core2_vpmu_dump
-};
-
-int vmx_vpmu_initialise(struct vcpu *v)
+static int vmx_vpmu_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
     u64 msr_content;
     static bool_t ds_warned;
 
-    if ( vpmu_mode == XENPMU_MODE_OFF )
-        return 0;
-
     if ( v->domain->arch.cpuid->basic.pmu_version <= 1 ||
          v->domain->arch.cpuid->basic.pmu_version >= 6 )
         return -EINVAL;
@@ -893,11 +880,20 @@ int vmx_vpmu_initialise(struct vcpu *v)
     if ( is_pv_vcpu(v) && !core2_vpmu_alloc_resource(v) )
         return -EIO;
 
-    vpmu_set(vpmu, VPMU_INITIALIZED);
-
     return 0;
 }
 
+static const struct arch_vpmu_ops __initconstrel core2_vpmu_ops = {
+    .initialise = vmx_vpmu_initialise,
+    .do_wrmsr = core2_vpmu_do_wrmsr,
+    .do_rdmsr = core2_vpmu_do_rdmsr,
+    .do_interrupt = core2_vpmu_do_interrupt,
+    .arch_vpmu_destroy = core2_vpmu_destroy,
+    .arch_vpmu_save = core2_vpmu_save,
+    .arch_vpmu_load = core2_vpmu_load,
+    .arch_vpmu_dump = core2_vpmu_dump
+};
+
 const struct arch_vpmu_ops *__init core2_vpmu_init(void)
 {
     unsigned int version = 0;
--- a/xen/include/asm-x86/vpmu.h
+++ b/xen/include/asm-x86/vpmu.h
@@ -39,6 +39,7 @@
 
 /* Arch specific operations shared by all vpmus */
 struct arch_vpmu_ops {
+    int (*initialise)(struct vcpu *v);
     int (*do_wrmsr)(unsigned int msr, uint64_t msr_content,
                     uint64_t supported);
     int (*do_rdmsr)(unsigned int msr, uint64_t *msr_content);
@@ -50,10 +51,8 @@ struct arch_vpmu_ops {
 };
 
 const struct arch_vpmu_ops *core2_vpmu_init(void);
-int vmx_vpmu_initialise(struct vcpu *);
 const struct arch_vpmu_ops *amd_vpmu_init(void);
 const struct arch_vpmu_ops *hygon_vpmu_init(void);
-int svm_vpmu_initialise(struct vcpu *);
 
 struct vpmu_struct {
     u32 flags;


