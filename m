Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEFF46D2B5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242216.418962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muvPp-0001qj-CF; Wed, 08 Dec 2021 11:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242216.418962; Wed, 08 Dec 2021 11:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muvPp-0001or-7J; Wed, 08 Dec 2021 11:47:17 +0000
Received: by outflank-mailman (input) for mailman id 242216;
 Wed, 08 Dec 2021 11:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muvPn-0001ol-E1
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:47:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95787b00-581c-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 12:47:13 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-0ucW3XftNB65WnOuLM1RzQ-1; Wed, 08 Dec 2021 12:47:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 11:47:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 11:47:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Wed, 8 Dec 2021 11:47:09 +0000
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
X-Inumbo-ID: 95787b00-581c-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638964033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ch3fblJtqZjhd2k1FVzLRRy+qIj6nn4X9h22JMOWea0=;
	b=F1kGytxoUkvM+w9RyGQO9pOtqHjKYGXHIXrd4pkwqr0iSFo5i+xWkq3rU+p5+rOpMGaUlZ
	CGa7efBSZe+JwWSD4hFqpCN/tzJPDxFAYzBheUSO/5p2aToCiP9FYpkZyds0nhJL+Jp7Cs
	VmP0FQWrB5N4vS8++2gQx3YS/PwICrk=
X-MC-Unique: 0ucW3XftNB65WnOuLM1RzQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BthPTaIjH1WJR7+Vzqmgg+5kBJZzYo7rE6XmYAxvEKT5gRVYj2qsG97/rUd7f2TKg91NwDEcLl17dT3JkN2bVTtPAub2pDG59nkCSdUHY9w/R+oWigd399ZKpECZZGwtPPnluXZLwTbKuwIzriSCuD+I42lrvJOc+l4Q4HeUxykONUXKKEHyySy2gECJwZATcp30Y+QRC6fPjEgZ2hErpBThQF9O3YgKtprPALMYbCr1VzT/R+IhsA6z5pNiAz/3IqmkWumdTxLtp4MPVdx0m/gdEyW5Y1UO+PAHXvCruWDd76xY5Poa7TmdhWVV/i2jyLrHIBn1z289q0jXc86XTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch3fblJtqZjhd2k1FVzLRRy+qIj6nn4X9h22JMOWea0=;
 b=ibdUzomx+yUHfvoakpeTM/FkyRO6fE16y3W9qq+MMm7EKHNaUOOXq0II4eic/hIDVsBl67+SgfenXSLdB0SPm935z1za5PyvzB8pRKdY/pLAT/3fZy/y3Ni3Qnaf5lFIM1y5sCRl3pwe8n/By1RfEeOC1WiTXUmWhIHAaI3dAkNmYhIfnt2htlVmO9IO7NRTBnoMKVZKTp8cvIS3SXcLNyM6otUyz19q0A4/j7x0vlLARUBKr2VGbmj9Cy+rRAGpkZ9pnQ05Z59u+GHVZzi8KFmEAfwrVATRcwCEqaPYkoAjyvyFIqZC/Cf3unIHEkRNX+qc2VJZ733NlmsNlm9iuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <935688c8-c971-53c7-4c27-f34a841168ec@suse.com>
Date: Wed, 8 Dec 2021 12:47:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: avoid wrong use of all-but-self IPI shorthand
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd009ad-a3ff-44d5-3d03-08d9ba4077f4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71501D3C6CB37FEDE71CBE92B36F9@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w49F342N8Qe6RNfsPeNylYgJkvQ+4le7viREfKF0J/9VzoKy6ekNuZ66DKs2zJuIjwAU9sXJFDiMZEAWcqrt0lk9Dpj/i+1pGUcWP3Z/p11VI9p1nv/YaNbcaMc+q2aIk6VFY/RIvkxC3E2LA7GFqhT7qwf1AVUmmz5n9TuZ8oIkD46kL0kmBOIqs4k4ko76qHZUlLMUKSA2JmX2UloG8Z4Md3vnLLm7ybKs655CRW2L0y8UkpyB69xOwIhU19LIE6PvT8M6SEOcbxn8yNZ9ZVbjjFLVu5S2TgmYbicloevOCFvGfPjYgLazPAedgyFPRBcIpVVW/q6Da85X0mEgX2sEgzViSAD/KHS3RuAJ8s8sIIk9dk6GmswBxm6iIw++DN5lmiCUzyGXHaG1A7cdcooTkGz9YO4gRLIpRYU2EqS0BSpRCyUKInM511AHGNNnDIfxN1dEC/r5GxndVreY9nlWBuZqgxTjukFURsy63aWIHL3Xl/E8tjzrbDzjbh+PcaqRRdRzuHXmjSztGi91EsHFuQDcukBtSjcxet3AchJtZ+OKDnCLpsv4pmYGwZQ6f9OYhLfgVijauAyqZtlZ+bQplowoKC626fRMt2WXjh+X0053cMKHiNeyl6a5SuyPXqc0aFNJ6hW0sSQ8teT907s9LdPI+UdJmm/PexUCPQ8CFsffz3w6OWTPHfsBMguVJFMQnTvAIMjqlu+WuamkR0S3XQtQBgCtDmQaYX4EF/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(5660300002)(8936002)(2616005)(36756003)(31696002)(4326008)(38100700002)(8676002)(26005)(83380400001)(6916009)(186003)(54906003)(2906002)(66476007)(66556008)(66946007)(316002)(16576012)(31686004)(86362001)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2RhT0N1OHF2emVNdmV6K0llWDVCaW5ncnd6bnVFR1RvZFdsb0FqNHladkN6?=
 =?utf-8?B?OXFwTzVSQ1dFcjVUNXJ0UDRWYmFpZGhaR1hIc2liNEpsa3lJM29hRlRubEht?=
 =?utf-8?B?OW1KaUxhaXo3MjBHMm4rVW5UczVoWUIvNUFhc3BteXVRK0R0dXpPV3g4dEQ1?=
 =?utf-8?B?WHNkN3cyV3BSdHk2Q05WWkNiZFRmTU1NNE5QczY0T2ZJdkVJWXpSOC90K0NT?=
 =?utf-8?B?aWJPRi8yT1ltR2Rnb3Q5ZjFVODk5TnJrY3c5NldCeTd3bDlvSlFGazZLWEJh?=
 =?utf-8?B?K2tNR256MFNpaW5QSHFscEptenU1cUtEaVBKRUhHbk1BMFlnYm9mRjNLK1Ay?=
 =?utf-8?B?SWtBODdCanh4VGRIQzNUcWw3VGRzZTYwemlNL0gvalJuSTdGRkVHVFZmQngy?=
 =?utf-8?B?dlVzWmdXanI1NGpUek5iQk45bWpFb2dPU043K1BzaCt1Y0laR2h3OGMwVjN2?=
 =?utf-8?B?a1lJMExEc1R0YndVT0lHaGdkZ09lYkk2SmpSUnNsZWdwY1Q0dFo3QkwzQ0Fm?=
 =?utf-8?B?ZEpWd0V2ZnhDd3BqQ3BxeHhpYVVxMXN5L01NU3ZMdVFLeVM3OEx0MnRTaXRM?=
 =?utf-8?B?dldYN2h1UWNPQVQrcG1DUFhldzVEVzBUTkc2eXFMcnJCeFBSYlFKWFJ4UlNq?=
 =?utf-8?B?WnNGKzlraHNLKzB1NXlLV1NNS0JTRVpRRjJ4QitFMjlNMFlDK3lqWHhjSDhs?=
 =?utf-8?B?MnFLL1ZKWVRNOVdVekVQVEt0TnREd3dqcWpsTlEwVFFvVkVtWjljWnljUFMz?=
 =?utf-8?B?cklrQzZnejU4SThKUW1XbUh1YkZKWjhpVWRtQTgrKzFtdWNqU0V3M05EU0dH?=
 =?utf-8?B?ckk2czRyemZzbVlJKzJlVGtNNHU4bzlpSVZaTUFUaC9VUm14dlRpdC9zNHhL?=
 =?utf-8?B?Z2Zud2hOUjlyK1JXQzc1VGxsalRWWXJEYkRvZ01ycHpSUzBUR3owd3o0S2Nu?=
 =?utf-8?B?NWw2N3RqVnhoazh0d2N3MjlYaW1Zckp6KzE2ZEFsaUdFV2NJVmRIOElnekxU?=
 =?utf-8?B?T1o4QUNQdGlDUkhOelU2SnZXNDVYeEZoVk1HUC9mODVQbHdVdFh5UnhqV1pO?=
 =?utf-8?B?V0FYenEwaVVKeEtWa1hweUlYNDMrNzcyMXRZY0tPUHNWL3JWd0NoOXZ3SVdP?=
 =?utf-8?B?Q21XVExhVi94MHJ1SlAvbnJFVlY4bjZhRVpPMXg1cGpDM28rdmk5N29XU3BG?=
 =?utf-8?B?NXhJa2JXd2FuYitDL2tFYlYrY2JmZGFxVmliNzN1b2FsWmEvWHRNVEplRWJ5?=
 =?utf-8?B?eG8rWklDU0RWZ05TRVpuaG1hWEU2aDlqYjR1K1pyT2Rxdmp3cWtuM3JyclU1?=
 =?utf-8?B?ZWIwR2lTem0rMzh0bUtUU0h0N3BDRWlNNFhnU2FKTHNsMXh3Y3JycVVZb1hW?=
 =?utf-8?B?UU9USDVSOFZHWkRrMXpVMWlGNDNDOTM4cWl2QVZGbnFHZTNvV0QyaHMvZk8z?=
 =?utf-8?B?Um1ZWWQvSW9kczVzV294cENSZ1FxYjd3NVU2b3V6ZWhxcXlYTDhYeEF1OWtT?=
 =?utf-8?B?K1pFVVhvS1ovSFpIeEVVb0p1Y1hndFZmWTJrU0o3Z25RWlRMWGpDNllQaVN2?=
 =?utf-8?B?Rmp2ODR2YjVNdlRhbXFhWnREUC9oSEx5eDdRd2lsaVRuamZ0UndiaWpiTWpq?=
 =?utf-8?B?c0xGVGJJek45cGJNSUtvSTZRS1FJNHdmVjNUOUNQVlVIeGJORThkUXdvNWg5?=
 =?utf-8?B?UEJ2WFFFZmNvdHFCYS9hcDJIWGdSajlRM1pzVzhTaDNhYWNnNFBkUWRSSk5V?=
 =?utf-8?B?bU9maWJndHhaSFQvMVFtWlp5UXpRWUxsYkxtU3F5WUtEMDFRVFlPUlMzKzNN?=
 =?utf-8?B?MUVrYmN6Zk9YNUJ1ZENtVXYvSUhUSCs4TXorYitnZ1JTVEpXVzZ6Unp2d2kv?=
 =?utf-8?B?TW1QcEJkMmFGMFVLcUttZnozS2NoTVQ1ajJjZDRKUXo2THZUMUlwWUd5dzVF?=
 =?utf-8?B?T2l3WWJncEJKQ1lSQlV1WklOMURBaWtZL1ZFbUc2bmdqYzMxSE56YkxUN1JL?=
 =?utf-8?B?bkhGUWFBSDk5SUw0ZjNqYVh2MnFxZllSb1BHNXdVVjhVMkpDMUNKUFpUaWc2?=
 =?utf-8?B?enlSTndMWGhiSkExMWFKUTZpaEVKc3FlSHIzTC80Sk1CdEk1aDRVRjZvYlJw?=
 =?utf-8?B?K0E0TllBQmpmRElaWTAwNS80ejUydGl2Qm1WcGNUZ3JQeGZVQ3JYMDFVZHhj?=
 =?utf-8?Q?/8Wpv9u7md9OMLAiAsdBXww=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd009ad-a3ff-44d5-3d03-08d9ba4077f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 11:47:10.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtQqG9IjhXxoeau6wZvC+j8ipG6o10FwjeoxPbvl/yUnYszEp2S96LfLvwDXL4e3wiqsPlw9TQnvRhVWbWi4lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

With "nosmp" I did observe a flood of "APIC error on CPU0: 04(04), Send
accept error" log messages on an AMD system. And rightly so - nothing
excludes the use of the shorthand in send_IPI_mask() in this case. Set
"unaccounted_cpus" to "true" also when command line restrictions are the
cause.

Note that PV-shim mode is unaffected by this change, first and foremost
because "nosmp" and "maxcpus=" are ignored in this case.

Fixes: 5500d265a2a8 ("x86/smp: use APIC ALLBUT destination shorthand when possible")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While in "nosmp" mode it's probably benign that we switch to the bigsmp
APIC driver simply because there are more than 8 physical CPUs, I
suppose that's inefficient when "maxcpus=" with a value between 2 and 8
(inclusive) is in use. Question is whether that's worthwhile to find a
solution for.

--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -84,9 +84,14 @@ void __init set_nr_cpu_ids(unsigned int
 	if (!park_offline_cpus)
 		tot_cpus = max_cpus;
 	nr_cpu_ids = min(tot_cpus, NR_CPUS + 0u);
-	if (park_offline_cpus && nr_cpu_ids < num_processors)
-		printk(XENLOG_WARNING "SMP: Cannot bring up %u further CPUs\n",
-		       num_processors - nr_cpu_ids);
+	if (nr_cpu_ids < num_processors)
+	{
+		unaccounted_cpus = true;
+		if (park_offline_cpus)
+			printk(XENLOG_WARNING
+			       "SMP: Cannot bring up %u further CPUs\n",
+			       num_processors - nr_cpu_ids);
+	}
 
 #ifndef nr_cpumask_bits
 	nr_cpumask_bits = ROUNDUP(nr_cpu_ids, BITS_PER_LONG);


