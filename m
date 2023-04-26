Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEB6EF4CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 14:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526688.818566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1preie-0008ER-US; Wed, 26 Apr 2023 12:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526688.818566; Wed, 26 Apr 2023 12:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1preie-0008BS-RM; Wed, 26 Apr 2023 12:58:00 +0000
Received: by outflank-mailman (input) for mailman id 526688;
 Wed, 26 Apr 2023 12:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1preid-00087s-Ka
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 12:57:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f82e5e91-e431-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 14:57:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8799.eurprd04.prod.outlook.com (2603:10a6:102:20e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 12:57:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 12:57:56 +0000
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
X-Inumbo-ID: f82e5e91-e431-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDyKX6YF40SxYygAlXF6rlt07fDgYTi7F7MMuVSHsqZyYehQ/AWT9pTmB8fWzoRe7beC/glhVkRazmuBjh4euEqQWsjJcXjIVwcSSJbWxafJ0ddXunPCa63JC1qN97MvF8L0vKrjCGH7vsFATFsKNyL/zFoD+V3GAdpfbZZyxp1fGrhySbRwxn8fNmZXPOxj0YBhHEFW1Hhbws0A0Pbp13CKij2+/tGVXDYmuJG/mJxF5Vod2zz8a1dp43BAsgEbOCc3wI5+Cz97yI0MgkV1lUq+os6rW2TtCa0vBQaz54oH4dqC0LCj6DtGs9bPVT1ZAq2yt8gi1ybDRZx2tBMBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpLaqKMeaT1bmjVi3m3iJaeh3uX4cpagAbFfokRvcts=;
 b=iL2tP/sn25sqST0bIBBOABKVMgYN1dQbk9N5alJcn19vlqxkQkS27efBuy3+5oKh22Xea1jTMn/+Zjf9ve9ZKyqXqG8/YKS/S1DhKMC5UqWjG7XbUfHMi/oHrIbcsOuo3WJxyZGMm5jUw6l8fLi+8/zf72lmx1NUSv33W1n/FGmtinkVSMRA+kEEHFrgmH0yTUMN5hcgNLqC/lBhx5eDNIWSEaXjPouNDLy6HCra6P4FqU0qAq1gK/hCUAPbBzObBWnjS2t/FvTJYH/M0RMlm5gq+jNgx0l975eCNEu1HVYb+JI57nZDsShoKNEyjNf69FdDNN463tWWZIIErI2WZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpLaqKMeaT1bmjVi3m3iJaeh3uX4cpagAbFfokRvcts=;
 b=Zn/VJmUdJF5HJ2QSpRhhT9B8U53NG6WvEBa4QkxDUg/wTMEdT6CbNiCo7YtsLNcYPXXS3vSW96ts1DzrZZIvpvadj86qveo1c6q7KM7RO7YzY97j+dYU+U1Q/5mCngojubOCJjo+f2TPXBea/BVivZlE5NZHY+XPlXzGbvX1FZouMFEjTHwS+MCXVREMCXhlcANueOUquMIf0BuJtQ261zug1s76FtVmsx5ZukTgPeT9GW8H0rCmCqZ4/JwZPSe+PP1kBaRGdzYbno9V4Et/wn0r+dkuCL34TnHcreEHLjKvHFbfGDqa2n5aWowuVus1/oEUbbRRDKtN0lca4a3wpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cae19837-31f6-9fb3-5c90-37aaf8920594@suse.com>
Date: Wed, 26 Apr 2023 14:57:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 1/2] VMX/cpu-policy: check availability of RDTSCP and INVPCID
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
In-Reply-To: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ea104e-e69a-46c7-ce3e-08db4655dab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AfGQGd7ZrPjjq449pWTZYap5Zq7cdNlXj+0R61+4InXh6JcOOSCDTTEnTELVJxw48kcmO+e8hMBDks//7yRevRmgleSmWzomGGFz7N8EtNHIw+ohxxNy6/JYHBcy8dyMqrQHRAfdQeHwesMeuUWD8JSj78jSdlBpsKr36tUfVkf5rrVVcpZDoDCC05ZbUIZYD718nm/GMLqJTzAsx5vgWdY2VbhSMy4T+h/uTmZvWr5YdaK2yCx2L5CxkvZNkVmLIiw2tCFcW0Am2Fx+LOw2ZuBVY8OPsEukUz4tVeteBHERQCIsrk5wLYJvRtsl/Rrg0A6/R8geblVz6IFux15LfGvTjqA09DV6pNFF7KYqfX2kmrjNKC8VDBGW2zQFxUWkOj92W6tIf0tGV3K3o/DBilOmPeTm9Rzb+f+NcERMf8hRrt8EaerViulWCP8Zutv6kbpDBn8B10CVHTSXZoe0Qtu8oe8qB/YRZDe/3xaecgW8ibCd91q3AXJF1JBWYo3sVCi67JMWCx4wFbBwpd4jTssqcJmo5Vg4XhLEdMgGAWDXDSV6k42/N3vI5oqf1QfNLTGR62vquGWs0PY3/e1Ybbxo6RnvWKmlJ9UUHFw+pjXtSeevbMALMx/gBT2+Oqn0tlqZGXJy3i1kNHDPBU+EXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(8936002)(38100700002)(2616005)(8676002)(66946007)(66556008)(66476007)(86362001)(31696002)(6916009)(316002)(4326008)(5660300002)(41300700001)(478600001)(6486002)(6666004)(54906003)(186003)(36756003)(26005)(31686004)(6506007)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHRYYmpOM25lV3l0dDlPdEUrMVdIS3NOTE56b1NPNFRHeVZHbXdoazRmazNu?=
 =?utf-8?B?TTBLS2NzVWx3empwV1l6OVdpT2lHdkpBVGhOWURCaGpvMlZEcVhwVmpqd1BC?=
 =?utf-8?B?VEVjTWs5TVNLTEV1cUk5dUFzSk1aWE5vcFdaY2RJdXUvaXoxbmdGU0w0UTZJ?=
 =?utf-8?B?ek5XVEZoN3I3TEs5RmpDakxTWUJvNzBFcER4R0hLZHgxV3doOXh1RG5Zckcz?=
 =?utf-8?B?K1YzVWhQQTJnOVFWaloxaEprWjd4OVRVbC9BMmZkdUYzbFFHY25GQ1dNaUFP?=
 =?utf-8?B?S05RMHQrcmVZNEhtNGxmMTRKT0VlR2RXMTVrS2g2bHlCdTdVdXRwbXhOeGFH?=
 =?utf-8?B?TWF3aHZaQVZzQ2l6ZWFLMGJ0UHhDaWtsUE0zTEljVk0wSVJYYWs3RGtGd3BK?=
 =?utf-8?B?UnI2NExKOVhuVzMvZ2FUam03MXB0OExTTlBEUGhGRXozTHFHMmpuRWdBRGxS?=
 =?utf-8?B?ajA4NHA1SGpKMnR5Wk5Ba0Fla295aXlVclRYeVZMY1MranRBdG1rZHZwN1Mw?=
 =?utf-8?B?VkhzTXBSekhVcXVVeU41ZjhPbnNscWtQMlFsdktqeGc3eGVwUVUyTm1hRkF6?=
 =?utf-8?B?YXY4dWk0MzEvU285MDRWeW0ydnM2bDUzdzV2WVVsU2ZYOXdpSFQzSXhKME9w?=
 =?utf-8?B?OHpQNkVZcnpVRnZuYnR0ajRDcTVWVkxLRDVGKzdCVUQ2bk5yUkRMZ29xRVQv?=
 =?utf-8?B?TEF0bzBQU0ZqVjlVREhLUW85UklrOGNJN0NnN1NVS21SL3BhZ3VwS1ltMm9X?=
 =?utf-8?B?Y2twTE9pYSsxUkhuRjZPQ0RlSVpSSTliVDlhL1lKaW1ld085ajNwSXBlSm94?=
 =?utf-8?B?SkpGd2QzY2JnRWtmL2R1RVNnaDBXSlJ3aUdIYzlJaG4yUndRL2g5L0k3MkVa?=
 =?utf-8?B?UDdTUjZha1pkOU8zQzhRWHlMTDdXNEVadlNBOW56L0JhSG16U2N3VEM4UENk?=
 =?utf-8?B?MUxFZDBmczBpT2xjZFhPMjVpRTNkZ09laHNNZldpWjhKY1dPNUFyV2hIQkx1?=
 =?utf-8?B?RzliTGZrQ2ZtclRyU0F5WnZzN1hEWHRTK3BCekdUM0xuQTJycWJ0ZkYxNEpu?=
 =?utf-8?B?NXF4RTA0d2dnZ0pkRTdMM0lRVWFlc0RtZlhSZ2VwY3MzNGk0VlZqQUlJMSts?=
 =?utf-8?B?bHV1R0NlUkphbmpLK2ZFc293Vkh2TytqQ3cyWWV5TXZJTFdveFN3cTdQWFRB?=
 =?utf-8?B?T1loNmpJR1AvNTdweDh1VjNDOGdycGNRb2ZDTCtocmVSTEYxNWxaZ2tkc09B?=
 =?utf-8?B?RzRJQVYvK2tSdmpaZTlnYzg3SnF3ZjF0T2Iyc1lqV2kwZmxBczFGYWNKVmpQ?=
 =?utf-8?B?Z29SUExjQStFMHJUemNKYk0yOWpvVERMNU1ZVWFYTThNV2JiczVjZ0ovQ3ZY?=
 =?utf-8?B?dGdJbDYyVEV6Z3pzUFpBcytnUWEvZkRXWEhSOTIvTWpOdDJ2Q2hSR0xFR29U?=
 =?utf-8?B?VVg1YnFMOGxHV3RRMmN2WU9mMUl0aldHdmhMSnhCdStwR3Y3ZW44c0ZpZHJv?=
 =?utf-8?B?c1JmV0JoRE5MbHpZVFRxOWJrUGtlWWV6OEg1cWpBQWxGOE9hR2h0ZGhnUnNW?=
 =?utf-8?B?UDAyN0FScE5sbmU0V2ZSVnBVYUtOdHRwM0F0U05YU1JINHVCR29PWEZtMThC?=
 =?utf-8?B?R214OCtZcGRsY21iMVc2WWJJN3loZk1yTFhEL2NQT0phTVRkSUwyRVdjR2Ry?=
 =?utf-8?B?MlU2Q05ic0ZBSmRRT0o2TjZhNS9VZ0hDVlpmYjZRd09GS09rMlNjNHo2cUxW?=
 =?utf-8?B?aGhJaTJJSjNkRHFrSkhKbWoxMDRZT3EySlNoMFdEMUxUTHRLcFZ4cGU2dWpz?=
 =?utf-8?B?N0haUk43eXA0NTFGWGcrSDFId0s4ZzlvaW53ZlRkVVk1dG5RUG93TlhmNDJF?=
 =?utf-8?B?dm9OS25WVEVicURpTCtqdjJPeEJRczBNZDFIV0JmTWdBMmtrU0UyWW1hR3V4?=
 =?utf-8?B?c2wwZDBqcFJuZ0pVeGlaL2JZb1lTNVJJdmJqb3huTXlybDBDVWZLdHlVMjNy?=
 =?utf-8?B?OXdsS1N5RUdlOGM5R1IxRXdHWDFobWlBU3gxT0EvOE5FdWk2QXdTR2RLcTJu?=
 =?utf-8?B?REFwaFI2VjFjVWh6MVZtanY5SE9MTDU1K0JZazI4SForcDRjNjMyRjhrZVpF?=
 =?utf-8?Q?/7oawOXlhdbrLvFRvA7JorVYB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ea104e-e69a-46c7-ce3e-08db4655dab6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 12:57:56.0061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Lx6bsEtSOzq7NcktbXZwL2FTPrUjWrNjBJz5juj4yg6ObYpm5HR8bBgC5mI+rJZGM/tiddFEJ0EQDw4C2MZ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8799

Both have separate enable bits, which are optional. While on real
hardware we can perhaps expect these VMX controls to be available if
(and only if) the base CPU feature is available, when running
virtualized ourselves this may not be the case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Afaics we don't ourselves expose the 1-setting of the two enables. (We
also don't constrain guests to set only bits we report as available to
set; there's a respective TODO comment in set_vvmcs_virtual_safe().)

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -594,6 +594,12 @@ static void __init calculate_hvm_max_pol
      */
     if ( cpu_has_vmx )
     {
+        if ( !cpu_has_vmx_rdtscp )
+            __clear_bit(X86_FEATURE_RDTSCP, fs);
+
+        if ( !cpu_has_vmx_invpcid )
+            __clear_bit(X86_FEATURE_INVPCID, fs);
+
         if ( !cpu_has_vmx_mpx )
             __clear_bit(X86_FEATURE_MPX, fs);
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -299,6 +299,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
+#define cpu_has_vmx_rdtscp \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
 #define cpu_has_vmx_vpid \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
@@ -314,6 +316,8 @@ extern u64 vmx_ept_vpid_cap;
      SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define cpu_has_vmx_ple \
     (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
+#define cpu_has_vmx_invpcid \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
 #define cpu_has_vmx_apic_reg_virt \
     (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \


