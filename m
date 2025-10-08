Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9247BC5800
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 17:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139882.1475091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Vdz-0002Xd-La; Wed, 08 Oct 2025 14:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139882.1475091; Wed, 08 Oct 2025 14:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Vdz-0002Uu-Hr; Wed, 08 Oct 2025 14:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1139882;
 Wed, 08 Oct 2025 14:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6Vdx-0002Un-K5
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:59:53 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ee6e19-a457-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:59:51 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA1PR03MB7123.namprd03.prod.outlook.com (2603:10b6:806:330::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 14:59:43 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 14:59:43 +0000
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
X-Inumbo-ID: 70ee6e19-a457-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLwhzoopvR5/BRXfhj6fpHZqKc0lCq386dxcVsi7H+FzoJGgV6dBHMpERl+NyRamzWQUzMzjIK7Gg6tpCY/l1k6Ot3tAOZ6H6SrZZpoAlCfH2n+zcqunnkt7ovQ5DcyOIDJnQBdUWK7YARW4yJBI5/7dB9ZWqLfJauqqjKLtS3KJY7phdiwkYSFDKuEMoyQtt/EOai3g0th+4DdxtuWObcnHm8glBlgLxUsmL+lCVij1mgnv9/2/xckFP8lh/O3hg08kEaIz/di1RfVH/xl0VKL6cCeibHFmDe2XERnHaxA1T121lLDw3Ju/7iigump3EB78TQqOteHCoX/l1aWogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdrZEuNbT5FGOF2ASae5QkYCjvrjXbRZKa8qWbCWAVw=;
 b=JEd+RgaeTsGQmWPwPvpV89JHLBLIyhID4Gpcv8d66GV5IgewhByJz1Gi2BRLBEVTuWM7s0Io6eQRrTKfP6JWhgjK/X/sFXkL/ffm3kbePEU9JiOSu6HHDvEKpJdhpif39h3v03y9SjYNAi8jwNOC3wXrb9yGgumaw3/ZMjJlaA8AapgNEe4+i/e/9ipSYOCmqHfzT/XtdLb+2RrwTuO7R/2FkYpfLhUfje9P9/qQ9flqlFqSPSnmkW/xx5I5rUTulsG8DV7mmX1S/1Z7JtOoaGlmtJvKBK09lFXiIAbL/oJkQz0uec3EUAXWHvVD7ieJGtmnR9MDZD2P55kpNoS2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdrZEuNbT5FGOF2ASae5QkYCjvrjXbRZKa8qWbCWAVw=;
 b=gZFbZeGu7fUD7RU/VpILGYcP6F9CQHxXkbVIt3gQN4fJoBcxFI3Lxdq1qLt+5bxbreheytFNEyYJY2XliUzyZTwCbfkOiBVMwff0kxzTCNVrpLSHXQNDWCVeUTezepEWFvKBZdd/EFPoo9jHZWqGHVTfg/M1GLDFWVXKNMBcU6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 16:59:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH for-4.21 v2] vpci/msix: improve handling of bogus MSI-X
 capabilities
Message-ID: <aOZ8W_--kyn6Kjol@Mac.lan>
References: <20251008143923.2557-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008143923.2557-1-roger.pau@citrix.com>
X-ClientProxiedBy: PR1P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ce::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA1PR03MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a0674c-918f-4f91-6837-08de067b5021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVorQk9Cc01KMFFSNWJuaStnUU9DRXhydlhiSHZ2ZnhkalBYRFRsWE56U1dz?=
 =?utf-8?B?anIyc2lrSytKSkJUVlV0SXhYNWYxaVhvWlBLaHdYWXgwdURuRmd5MmZNREZw?=
 =?utf-8?B?U2RIcituTmtvYmhvUGZsRDFidWw3Vm9hTkhoL2dXdE9VQktDSlNSSGVaWVg5?=
 =?utf-8?B?S2krSGM0RVU3cUhEUHd4SVlSTGFzK1c1MitBVkZJSUtLZmtPR1A4a2NjK3dG?=
 =?utf-8?B?eGsxQndFdW42N1NhZmV4Z2FxWHRCMjlFQ1Bjb1lXenZpeHN2YnBXVVJKVmZt?=
 =?utf-8?B?WU1mTEpQOEEvamcwMk5xZmtmQ3QzZG9YaVJzNkVvUnB4bFJGcDdXbFV5K2Zi?=
 =?utf-8?B?WENIS0g0YkdTZ1dJZEFIdXM4YjNEd2h2TTB4ajc1ekIwN2tONG1IS0ZpMlM0?=
 =?utf-8?B?S0IvUndKTG1UeGF3Q3NXODQ2bWVmbmNlSTdBZ2Zqd1A3MUlOTGQwc2t2OTUy?=
 =?utf-8?B?Q2hCQ3Zyc1AxWC9vRURKcXJ5OUw3bk9xZzFnRnIrWExnUm5NbkZlR2hqbTZk?=
 =?utf-8?B?cDQ2ZnpGbXJnbUVFV2hnZlpoN3RLekVHOG9zL0I1VUdOU2lLUFhSTHFLVEhM?=
 =?utf-8?B?ZjA4aGR3ZHZhczhrNm5Kb3JZQTBmRFlVSmNCVjFzZGhqN0t4T0VyZUtKOE9z?=
 =?utf-8?B?RmpZblc0VTN3ZU1jQjhURE9lZ2o1NzQwQ2dlZmFEWFlaQjZnZFMxWEwzVkZu?=
 =?utf-8?B?NVl1b01mdWFCUG9mU1ZkdVVJem9aeUxPdlJmeEhsTE43VTFQWWdlWlZLa0c3?=
 =?utf-8?B?S1dlSU1iVTFEeElockNQdmp1UXBualZOamlhc2hrUDJLaU40UlpLQ2Y2QUV6?=
 =?utf-8?B?cjJaN1VYQWVMM2daUmJMbHZCSkw3NStic1ViSzFMSkltL1hFNWRvMzBWQVBt?=
 =?utf-8?B?R3lzREFjRHBkbDZORHZhbGQ5RVc2eHo5bFc2cVRGVC9XWVcwUERKMDd5WkpJ?=
 =?utf-8?B?WXBJUGJHRUZoc1F6TnlMVzBBVDR1WGI2TERKS1k0enBIQzAxNFJqZ01vaTRy?=
 =?utf-8?B?NXZkK05jbjR4dlJyek40b2hKNmZyc1ArSGI1aDNYMDNqeWZWTmtGR0pCOFc3?=
 =?utf-8?B?YUZ1SGVwU0RnR3RJWFRDK3VYVnNjK3hBY2NqOXQySDNuU1Q4ektvbjg4QVlS?=
 =?utf-8?B?V2JrTUhnUVBmTWpZV05ZY3FqSXgyVGgvQjNzQVJCL2UvdXF4cjg1SkNSdS9p?=
 =?utf-8?B?YkI2Wm1sZlM2d041Y20wSVd5bHpoZjk3elRRNzRNaktzMWF4cjJwUG0vdS9Y?=
 =?utf-8?B?WUZubm5vWEkrV0Njc3c5TS9WbEoxMVRwRHptd3NteDFQOVA2cVBGV2Z3UVJv?=
 =?utf-8?B?VDJaL2k5ZGZKd0kwYis1Szk5QmFpdkhzcWt1ZGI5WWM3M2VjSC9ZNGpBY09h?=
 =?utf-8?B?NEV4eU5QL1hTeXl2dGhGWEVuMndiRlZOcWlKeFZQWlJCU2hldnY0cDJaemNH?=
 =?utf-8?B?TFozbjQ2OVk1d21UQkpBSjJsdTc4VlcxUzJFUk02Y1pHakNWUWgrQnFIZmxr?=
 =?utf-8?B?NVZlZVkyaVZTall2bGFxbEJyaVdrcE51YXJsbHZrelhWNEpQNk5kR0FYNEhx?=
 =?utf-8?B?eTlnaVdBZkR1RXVQejBGRGt5Q3R6bTlCbng3NFViKy9XVDh6UmNWWFlNeEo0?=
 =?utf-8?B?d2hTNnZYNFA1OHZteUhwRzJ3Uml1ZStWM2VKRzFNcFpXaGxWMUZlOUppTzJa?=
 =?utf-8?B?T3pIYjgxRWh1dk9tUDd0disrak9ZM3dPaU8xdmxrTWlhQm1kMXF4eGVDNzNh?=
 =?utf-8?B?RTNVQ0VhbU5tVmxxK3c5TXR3UllKS2ZLRmlvSlRVRTFmYkJoR25BdzZOaVlD?=
 =?utf-8?B?RzYvVDd6RzVWTSs4WDU5SW8yMjJjOGlhYklRZUFTL1BQNkMreGdQOElvbkJj?=
 =?utf-8?B?Rk1HeW9jQ1lKWDJkNS9aa0lpQ1JjVVdVMnNHMDJsTFhFVW1QWmJNaXhiNWYw?=
 =?utf-8?Q?zKgfGqkygMGpMYL/G6oTNB3klBWLrLh0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjg4QWpsWXlyLzJldjB5QlVDcnZEYVFyVmF4Y0RkZmZLWHdJbDFOWTJoSXpP?=
 =?utf-8?B?T2NLZ0J1QzYzMjg0Y2cvTWxvMXFhMktlemtNSHJsdXNySTZIUEJuV2xNUjI5?=
 =?utf-8?B?Wjdqc215L2hEK2tXWUptTW50L0czS21UV1N3TzdFeEVYQzFmLzd3bUVXUENt?=
 =?utf-8?B?eGxpa1dkaFRaQytPTHpEMXl6b1hLQnZsMkdMOGxlYkIvQ2R1bHF5eFZMRVBZ?=
 =?utf-8?B?Tm1NR1F6NGFyb1hFemhZbWUxNFRXQktaNUhEZXFnZy8xQkdFMlZWWmh4SUw2?=
 =?utf-8?B?a041WHByWE1CTThXcU5tQVAyTzdhWXM1eitQdVhlNWs2ZTFkMHhkbmhvOGZF?=
 =?utf-8?B?SHEzVFFtOWdSQ2luUnFYczA5SEhYM3lEekE2ODZUR3c4UHkwVXh1RFptSnlv?=
 =?utf-8?B?UmpWa3BOeVdkUk9BUWp1MW01end6KzBXa0xtSWtJcWE1RGhiSUtFejRtRStq?=
 =?utf-8?B?ZjA2S2d4Tk1QUGVXZHJ2WlkzMHlSSER6UXgrQng4SkJSSkpkQWY5eHQ4OXBi?=
 =?utf-8?B?S21laStEeEl0aVFCM0RXUG0zOWN4TkpOZFpDQlcwem5oUkJsVGl2MXFtQzNB?=
 =?utf-8?B?Z0FNRUp4Y1RLNFdHNWl1eDZJSzg5Y3g2MU81cWtqZXpKK3U5MFJHV3BoRlVm?=
 =?utf-8?B?a1h5QWxQK2RYVU9xVDEzV09mZjRNWC9NajhDdFZ1Wkx1aTAydGtESjBVMCtL?=
 =?utf-8?B?ZTVDdEdLdUdpcDdzTWNESTRCTXI3aW13VnQ4NEh0ak9JSGxLMCtMNzlSa09N?=
 =?utf-8?B?aWlzalo1YUx5MTVYRUZxVEJhVlhQTDZNalpLUkJxNzErVCszT0RwVmN4RUVM?=
 =?utf-8?B?c2FjRFc5Y0EyS3RYa0tvNjYvdEtaZTFkejJFVHBVM3NsSy9kTXJTdG5ORGZx?=
 =?utf-8?B?b1pZYUVLb3J2NjJjTjU5WHRka2gvUktLTkFuTXJNeU45RlNjVFc5MkdkUGV3?=
 =?utf-8?B?WHlpdDBodzF6VDBpaDFHQ25ISy9uR1FjcGpSSktXQ1VXVnlqdzRCOGdHbkYv?=
 =?utf-8?B?S281L1NwTjFXZmhQR0F6TUxzWC83Y0xRa0Y3emRLUVJYbFZybWlkcmxNbEp6?=
 =?utf-8?B?WEtKUGN6OEZ3SFdmbEFHZldSV1ZJUUFLTGJNZUFycnNpcHFnQVlFaklRMFJy?=
 =?utf-8?B?ek8zYm9Oc2wwYzdkbTNiUmZEOW5yL0t2QnhyYVNEYlF0WFRHUlJQOWE2UEZJ?=
 =?utf-8?B?b0VHUi92MVBSeE83U2h5bTBYRTdwR3V0RVJ5ZDdzRVlFSEgwSlIyOWdOL3lk?=
 =?utf-8?B?UFcvenExOGI4amxaOVVIeVVXT2RKRHJzaE8wWWhLVnBiM29LdWJqMU4xdW9K?=
 =?utf-8?B?N2JKbXFKQ1VPUVd0RUx5NDFjaitIUTF1U3ppNVkxOXZtS2pyL0pvbDg3ckYv?=
 =?utf-8?B?MVZ6ZU04WkI4NWpKeWZqN09Xc2hma2NnOUNUTkI2WjZIaVBCUlQzdCtOQ0dl?=
 =?utf-8?B?ODJiQUc0b0FrYTRFVmVxbitLcmhTQWdqWldrSFV2NFlIM01HS3U4R3dYRmQz?=
 =?utf-8?B?cHVKUTlsays4MFY4dklsLzE1ZFhOekNySnFEbXExKytZa2lxOXhLbkpmL292?=
 =?utf-8?B?emRUQlREdFFUNnorOW1NT3UvNHFrUWR5LzYxRVA5WXUxT3MvUjVhMCtEUWYx?=
 =?utf-8?B?WS81NXcyUkhLeWtlZkU5RUpwZEpnQ2lCUlVzSVZBZXZJN1g4R3hpL0pqVTFa?=
 =?utf-8?B?cGIveGd0Tm4rUVBXWG9RZEpjek1rbEhTamNsdzMvTWRLTGVyUU8xdzZwbnVO?=
 =?utf-8?B?UzZlNEZNL3ZkdzlTQVJtMlp0VmYrR2JhMEl6RDlpVkc2WXpGZlZEQ0Yra1Yz?=
 =?utf-8?B?RXEraGdsem1xc2NyMTh4YzlZNElyQVFXMFovNHZnaWk1TjlzWFNyT2EvL3JJ?=
 =?utf-8?B?bGxyMUkwSDVLT01TT2U4STFWU0dyVE9ycDlrckV6NDZqaHZtTDhKYkNCb0lk?=
 =?utf-8?B?MkhPQUtvMDltR2l1LzJzOXBkRlB1Q2UvQlJwdGJzNVJyQXF1dGY1WlpianBl?=
 =?utf-8?B?RFlJSjRIVktLdVFMWTNCcDc5Wk0rWUN3dnJXR2liVHRMaENvZzdLQjlnL1RG?=
 =?utf-8?B?VjJSbldkcFJqNGhQUDd5c2FCQ1ZhSUt1WjNZQitNWGtncUwxdjk5RkozWU1Q?=
 =?utf-8?Q?zxjAYlDL4+Hv5yRcT3ge7pg7i?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a0674c-918f-4f91-6837-08de067b5021
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:59:43.0998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpudZ3NuDORrSg0kSMt2GbeVZr1qoJK3CAkz2Dl8k4vYpxGPkopxuaEsJp0rFsx/Deq6S74F0hRQCeXZTem8vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7123

On Wed, Oct 08, 2025 at 04:39:23PM +0200, Roger Pau Monne wrote:
> I've had the luck to come across a PCI card that exposes a MSI-X capability
> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> 
> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> still use the address of such empty BAR (0) and attempt to carve a hole in
> the p2m.  This leads to errors like the one below being reported by Xen:
> 
> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> 
> And the device left unable to enable memory decoding due to the failure
> reported by vpci_make_msix_hole().
> 
> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> tables are usable.  This requires checking that the BIR points to a
> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> target BAR.
> 
> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> EPYC 9965 processors.  The broken device is:
> 
> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> 
> There are multiple of those integrated controllers in the system, all
> broken in the same way.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v1:
>  - Introduce a DEVICE BUG prefix.
>  - Remove extra newline.
>  - Fix typo in commit message.
> ---
>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>  xen/include/xen/lib.h   |  3 +++
>  2 files changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..4ddcefbcb274 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      if ( !msix )
>          return -ENOMEM;
>  
> +    msix->tables[VPCI_MSIX_TABLE] =
> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> +    msix->tables[VPCI_MSIX_PBA] =
> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> +
> +    /* Check that the provided BAR is valid. */

I had the following local change that I forgot to update the patch
with before sending:

/* Check that the referenced BAR(s) regions are valid. */

I think this is a better wording.

Thanks, Roger.

