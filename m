Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E16C73072
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166619.1493117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fS-00011x-L0; Thu, 20 Nov 2025 09:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166619.1493117; Thu, 20 Nov 2025 09:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fS-00010D-Hg; Thu, 20 Nov 2025 09:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1166619;
 Thu, 20 Nov 2025 09:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM0fQ-0000ko-Rg
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:09:28 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d3b0cae-c5f0-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:09:27 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:09:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:09:25 +0000
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
X-Inumbo-ID: 9d3b0cae-c5f0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opDwc27w//lq7tx6MGfu0Ts43rrRmNuj0rz+CTuNK5D/H7qfTqKsukpex9Xz4B+UyMP0KpDx4MBClcc7NAFQKfCB+sab0kBDjusHAm6DQ5MkvuVS2YpymfhMhAnENmaIMp60p7+UUbzrzssxn+/R31Pkr/lKaYzLQqPbj9bMLms3lnOLQWILx5s3XtnYQM++q7Skmr1OP/AHMD6B7Lg6GIRlWWWINLaJiCGA4JZXE1aUgn+8bMYhLf+bYtoNnVxgqLBASV9d9Oxv03RDkp9nnxf65XpxEU9Hj3EpDfjUrgE+Hq6AfidrCt0tvYu0EkieEx3JIdecFpdJMKDN1/2o/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ps4qpb/HeavGjoMpeWQVB1HeWzQZcZOSFbllOt3RlQ=;
 b=SF0wmm+LYf/dIyWeUEIUEAbmAu4lr1jKDvXmgOVKcP1cdKaaxStX8vegDd0q+9cxiyA7NdgbO2YzqBN4AIJ3tNSW/bqQOMHu50NK0ZcLdE8eQYkykSxSjwt6zus7/wOwil6QmUUyrlSj80BSpH9NW0c7jbydj05uQgudg88xb+Epnpmxl7uBlOXjqKhx+SBi/mUGPtahp60vBYlxW6xn8UL+3EwNDpKHdvRZsWBIsK1geYpG5uNazVElD6oXGShU3lmk60JMgM0k7RG0JirjEAQpnnG4YStD/DUdV/8g+pR+E+8jlOTy+53Ke7zn9R7Q8moAxSKlV0lHpNdVhOYidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ps4qpb/HeavGjoMpeWQVB1HeWzQZcZOSFbllOt3RlQ=;
 b=Q6z81Ei/ubxNiCrPCe6QgTkw5v7LwweA2ppkBMuonZoYDIKtdpv16b9N6CAi6gv7/GlPmv0OUvntr8lZwfnnN/i/5ahdk6nijwsKDWxbWpX+ZtMWRA9cGBxHHuOzLjYkbacKzZeYSY0lTxcu4nSsFFy++RLkd73Fqf/YOXoqR8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 02/12] x86/apic: remove vector_allocation_cpumask hook
Date: Thu, 20 Nov 2025 10:06:27 +0100
Message-ID: <20251120090637.25087-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120090637.25087-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0024.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae1d432-83c0-461c-e7e1-08de28148072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFlsT0lsTTZIdC9rL0VNL0J1eUNnL2cwZUpaanFobnhTamlsMUJadkZySGlj?=
 =?utf-8?B?SUl5c2Q5cGNtbE1zTVVrdjEzWWdITysxdURlM1JlUjR2NWNuYitCTUMvdHpD?=
 =?utf-8?B?TGlFd3BtVU5sZ1lZeVFYTlM1WVAwRDNLNm9UblhreTY2UFpaekh0Rmk4ZGxT?=
 =?utf-8?B?emRVTS96L2NxUlNCSitzWVB6anJlVGdHRUNnb1R5ZHpLeDkvYWg1N0o0aDdl?=
 =?utf-8?B?WkFtNmt3VE52bDRsQ2ZmMzVHZUx1M3pCTUVCdGNTRHcvVGhJTnVyMmwvTGor?=
 =?utf-8?B?dVphL28zanozZ3dzeVcrb2FVeG9ZenQ3N1NCVkl3WXhkYWF5RFZxZ00vYW9y?=
 =?utf-8?B?aXYyOVpwNVRjemlDTXdGWTcwM29OUHR0V1Z5bUU5MmFHcU9XK1VsSVVyL0dr?=
 =?utf-8?B?NGpsR05xZUxaR1pjZkQwS3czbmxOMXR4S2xGd3JJZVVQUjNid3dtdnd1Q2V4?=
 =?utf-8?B?UG5sbUQ5NnZNRTF3ZDVhcFk5MVlhTHp2TWltSW9MUmkxNWphWnVXYW5aQW9E?=
 =?utf-8?B?YWx5azhrSmZNUGtJak4rNTV6N2tqbE9ZWEZCcitNSHljZng4WDlxQ0lNYlVQ?=
 =?utf-8?B?WkQ1Tzg5QkJnbmMyMURyYlBLYk5raWp6b3Y3cC9MWURlVjJRRVhjRlJiOVRM?=
 =?utf-8?B?OEpwODNXUHlVQ3VoTTZSU29JMVNES1gwV1d1c0loRVVtaU5TWWE3RElINldj?=
 =?utf-8?B?UHRxdFMrY3Avb09Zb2dCZWdmRSt3WEg4VW1HdVRib0dONmVBUUduSHNMWk1R?=
 =?utf-8?B?MEhBaWl1eHNpRzMvcGNtKzErQkJvVWtwZHR5WU1lRFJsTENIRkFMVUEybmFC?=
 =?utf-8?B?ZDZXUlp0SzdON0lReWYvdTE4VHorRVV1ODR6MkZtTnJpK1dGRUpsMHc0ak5t?=
 =?utf-8?B?dEQvOXc2OXJ5Z2VBZkZLRXdzNENaZXRNWnNsc0s3eFZqRGdiYUhZWHFaRTBj?=
 =?utf-8?B?M1NzM0RadGVKTEJGY3lSd1c2cXBQcEs4QjdQSy9KbVhsWnNJU1pUdWNsRXh5?=
 =?utf-8?B?cmRja0ovbUJVcVBuZmRpbnRGV2NYK1BCMmdSZFYrcXlrekdGQjRaSDFrYVBO?=
 =?utf-8?B?djlLVzV4NEpCYWtaUXFSMlZuaWMrVE95WXgzcVg4QUFRckM2ZzNEK2VnTUVU?=
 =?utf-8?B?VExxKzM3VjJxQlNZc1F2K3M2WGJhNnV6TFpRWlp2czA1WU1SaFB2bXJWdTlS?=
 =?utf-8?B?RERnN1NocDNyUHdvampjMVVYeDBXSW90THNNd1NHTDd5Yi9aellsNE5FZHhM?=
 =?utf-8?B?MVdtNmIwajMzVVd0UnlCaWZSR3g2OWwxaDdiMkhMWXRockJNSTZHajFldVFs?=
 =?utf-8?B?NW9ReHVQN2xTamFqNTQxNzBWWFZ0WlFleHlXYjRCL0QzbVJWUzZmaXJ4NUdq?=
 =?utf-8?B?SGpMMXlobU1rYlFMSVQ4U1k3a0R5blowVHMvRE80OFR1YzFja29xVlpOVFJ5?=
 =?utf-8?B?WGdMS2RIakExa0J2bHgxOXhXOEgwd3IyTy9jZFZYaVVNWU5ibmtERjk3WUJG?=
 =?utf-8?B?aTNkMTl6TnVaSkgxSEIyQ1FDMldBMHpnUGdPVlRFcFVJTVFhMFlOTHk5bEEw?=
 =?utf-8?B?QmVLNjF0QVYvTit2UGdMWisxUlZ3dHpIZlM0SDh0bTdma2dpZWFaMk4zSmRk?=
 =?utf-8?B?Tm1QZWl2Ny9kdkhhaTlMN0V0NGJqdmV5N0E1YmRtUWhyT0J2RzBFVVN0SWZX?=
 =?utf-8?B?SUdVZXlxNERmdVVGRGNyU2taNy9CdTRKNHBQTDNCdjBzeUt4R0F3Q2g5WWlp?=
 =?utf-8?B?UDlRelRTMzd0NXJSV0h0bjB1QkN5azh5Z1R5a2hrM0N6OVBqRzlOWEtNc1V4?=
 =?utf-8?B?eE51RkgrZXVhQk5lQk5SUm1EWHZWMTZaU3dhZzdRSklrU1ErcXJwWS8yWnlG?=
 =?utf-8?B?TXovMDJuYW1DcEdnbHA4eXQvb1MwZnVKQzZtK3RZMnRWS0p5ZmpIMDFpN0NK?=
 =?utf-8?Q?F1CTMFZShQN0N+BKDveoAM7m9I5jVnGL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHVlQ1Yzb2JMR0VyL3p4YktBelkzcFZvVXFwUHc4dGlpTUFwL0hyaTQ2SFNv?=
 =?utf-8?B?RFJIWHdoaC9sdDdEaWdaUUk2blBGRVpENWxvMUxvcmU0d2tHazM5akxLTmFu?=
 =?utf-8?B?WXdiYjZSdjNGYVZvcmI5VTNOUlRscHhJdkZWeEt4eFR3SlhRMktORldaU0Nt?=
 =?utf-8?B?S212L1BWUmdUUWNMamxYdng0ampvYmFWU0JwL1B1TUF6VmwySWJjdmExNDQw?=
 =?utf-8?B?Q3pVTVp5ZkxSYnV4UFAxN0xLVlpQbHhjcEpBazNtNDF4bUsyekJ4ZHBYS2F5?=
 =?utf-8?B?MWpzeTdzOEV5TEd2SDJsSzVRSkcrNVp3cndSUlBwc3BzdzlTaUx1ZGxsbjZy?=
 =?utf-8?B?V1ZWak9UZDUyWjA3RElPOFYyWmpCLzEvVncwM3cvVGpKaG5rRWFMVWVrNEda?=
 =?utf-8?B?Z0Jyb0U2dGJiejF5L3JVTHo1b2cyNXQ3bXd0U3h5Z2RQMDNoS0VTYlIreHBL?=
 =?utf-8?B?T0JiM2xaV25JaEZyem5VWmc0Umphd0FzckRlRXk3dlMvRUtEeUdTdTVmUkVm?=
 =?utf-8?B?SkxydU1QMUk5bVhTM0kva0Y0SWxXcXhnUHBEWkV4RStFeElqQndqTURidnB0?=
 =?utf-8?B?OUVaeDlVeTh2aUJCL1FyVHdySEJxbHcrLzE4QkpZRmg4MjFzRnUvMnJVSTNs?=
 =?utf-8?B?L3BQdWl1Z0ZIeS81VURUbnpNTzFrQ0gyK0oySzRMK09iQ0ZnV3AwREtVRlVl?=
 =?utf-8?B?R0NZZkhkK0dad1ZVMzFFMWZ5TDhCODFLMXJEQ0M3eWhiZ1o0U3FBcGduUUlT?=
 =?utf-8?B?UWhHUDZjZVNydGw3U3MxM1l6ZFNOdS9ydFNseVYwazVueThicytVaXB2dExw?=
 =?utf-8?B?ZnlvWDNwMjRxWnFhL3dYMkYveUFwckZHMXZnUFpybDB1T3daWlMzU2prUG5K?=
 =?utf-8?B?bFQ2SGJwWVcvMUlRcnJDRmxOdjdDR0luekpSNjc4ZzlSTEtOY3BIOXIwZjFN?=
 =?utf-8?B?SVBwV01kSnJqZGhPRWx2bDFHbG56SDdLT2tKbjA0dmNnRWVMVVM4R0VMMUps?=
 =?utf-8?B?a2NpUDlGbHJTTVVKeWF1a1Awb0Z4RDZQbHhDYUN4RlhMc0JqNHpic3NwVmQz?=
 =?utf-8?B?RC8wdkk5a21JV0FwR255cG9ZWlhpcXdXaGx1Nmp1blNhSzh0U2U5eUgyZjZq?=
 =?utf-8?B?YXBla2JQK2hoa2IvWjBYN2JRQ2VSelNtbkZrYlYrdDlnbHB3clo4aFd1eVpF?=
 =?utf-8?B?TXNsK1FiUWVqVWttS2xLSjhaUTYyK0VjVmFUL3cwbWxZdlBtZDdSMmpUc1la?=
 =?utf-8?B?MmdjRWZWZ2IyenR1UGcxT3cxeE1EM21XSjlua3ljTWlQWmlvUnFVVGhsUzFt?=
 =?utf-8?B?NHFmMDIyMTRaU1Z1QlZiTGkrc3ZPb1F4dldEeWpZTElUZll4ekl4L2RCK1B1?=
 =?utf-8?B?M0xVYVlNSmRxc3FDYm0rNmRGQ3dvS2JNTkVvdVI3WkV1Q1NSS0J3K2ZHQVJZ?=
 =?utf-8?B?S1M4c1J1R0pGTXF3MWgwYnB1OW8wS2VmOG9wZzNyNmRkcWsrNnNUSjllRmxR?=
 =?utf-8?B?VVFnUE5WbzN5MTBTNFdtT3Q4cGhzZXI5c0pnSExDQUFIdG9sSkNQYTdWbkJR?=
 =?utf-8?B?MWpkOFZ0eXVJNmtIMjdYWHBqY1dLS21rNjltT1BVM2ZLKzhCaEVYd1IyVGxm?=
 =?utf-8?B?UkNXTDNxOG1SN0cySW0yUTZSUXJ1UGVsdGRiVXV5djB0alhVd3VmclowNHFE?=
 =?utf-8?B?V01hUmpsVWdweGlzcjFoU2xubVhPYTVoVGdyV0dPRnBnaXUxT1N0M2FHR1g3?=
 =?utf-8?B?Mk5ReUlTY000Z1I1b1NvRkNuem1zMktUcTNhQXk1U3hkMXRFeUlpVHk2S1Nj?=
 =?utf-8?B?dlZhNGlxV1NQV0EwbHZMdU9hRmpqNGc2K21rZ1JaYlJnaGI5R1pyNWpJNUFu?=
 =?utf-8?B?aVFjcUxDZUZqRUhyZDRZNktrU3ZpY1J3K2YvNllCM3RrUUFOUW9lMDZEaDZ0?=
 =?utf-8?B?dit3MENOY1gvZmhadk5JNDlyS3VmRXJucTdCZDhNL3UreDZkNXdkRk1oWGFC?=
 =?utf-8?B?QjQ4MURsb1UycFJsRkN2RnFyemVQdjFseExoQTlVUGV5OTYzekwwT1V4UERs?=
 =?utf-8?B?QkhrM2lUSEh3eEdPOUM2dVlaYm5OelhkdmN3TUdwQWNKUVZ2VGtNclM2WXBw?=
 =?utf-8?Q?Vtuot/yk9P35VAOt8ld9z+tBB?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae1d432-83c0-461c-e7e1-08de28148072
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:09:25.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jog2sB7IPoau5TKzDSMbWxaPlapU9soAdkN2mnGw5jExdq5+c7rJybLK5HZLi6qwVG+QL+xjbTvGAwam+smo+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072

All implementations use the same hook which is a wrapper around
cpumask_of(cpu).  Adjust callers to no longer use such dummy mask with a
single CPU set, as the CPU is already known to the caller.  This removes a
pair of usages of for_each_cpu().

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/genapic/bigsmp.c      |  1 -
 xen/arch/x86/genapic/default.c     |  1 -
 xen/arch/x86/genapic/delivery.c    |  5 -----
 xen/arch/x86/genapic/x2apic.c      |  7 -------
 xen/arch/x86/include/asm/genapic.h |  4 ----
 xen/arch/x86/irq.c                 | 19 +++++++------------
 6 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/genapic/bigsmp.c b/xen/arch/x86/genapic/bigsmp.c
index 066feb4a1755..c0bcee659f1b 100644
--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -47,7 +47,6 @@ static int __init cf_check probe_bigsmp(void)
 const struct genapic __initconst_cf_clobber apic_bigsmp = {
 	APIC_INIT("bigsmp", probe_bigsmp),
 	.init_apic_ldr = init_apic_ldr_phys,
-	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
 	.send_IPI_mask = send_IPI_mask_phys,
 	.send_IPI_self = send_IPI_self_legacy
 };
diff --git a/xen/arch/x86/genapic/default.c b/xen/arch/x86/genapic/default.c
index ab9a292464d6..58b5884aac0d 100644
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -17,7 +17,6 @@
 const struct genapic __initconst_cf_clobber apic_default = {
 	APIC_INIT("default", NULL),
 	.init_apic_ldr = init_apic_ldr_flat,
-	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
 	.send_IPI_mask = send_IPI_mask_flat,
 	.send_IPI_self = send_IPI_self_legacy
 };
diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index 5d105e848502..777570f3b633 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -30,11 +30,6 @@ void cf_check init_apic_ldr_phys(void)
 	/* We only deliver in phys mode - no setup needed. */
 }
 
-const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu)
-{
-	return cpumask_of(cpu);
-}
-
 unsigned int cpu_mask_to_apicid(const cpumask_t *cpumask)
 {
 	/* As we are using single CPU as destination, pick only one CPU here */
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index f4709ab92950..89d66bc627d7 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -141,7 +141,6 @@ static void cf_check send_IPI_mask_x2apic_cluster(
 static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
     APIC_INIT("x2apic_phys", NULL),
     .init_apic_ldr = init_apic_ldr_phys,
-    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
     .send_IPI_mask = send_IPI_mask_x2apic_phys,
     .send_IPI_self = send_IPI_self_x2apic
 };
@@ -156,12 +155,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
 static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
     APIC_INIT("x2apic_mixed", NULL),
 
-    /*
-     * The following fields are exclusively used by external interrupts and
-     * hence are set to use Physical destination mode handlers.
-     */
-    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
-
     /*
      * The following fields are exclusively used by IPIs and hence are set to
      * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 6d979279bd2b..33ec492a6ff5 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -24,7 +24,6 @@ struct genapic {
 	int (*probe)(void);
 
 	void (*init_apic_ldr)(void);
-	const cpumask_t *(*vector_allocation_cpumask)(int cpu);
 	void (*send_IPI_mask)(const cpumask_t *mask, int vector);
     void (*send_IPI_self)(uint8_t vector);
 };
@@ -35,8 +34,6 @@ struct genapic {
 
 #define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
 #define init_apic_ldr() alternative_vcall(genapic.init_apic_ldr)
-#define vector_allocation_cpumask(cpu) \
-	alternative_call(genapic.vector_allocation_cpumask, cpu)
 
 extern struct genapic genapic;
 extern const struct genapic apic_default;
@@ -50,7 +47,6 @@ void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
 void cf_check init_apic_ldr_phys(void);
 unsigned int cpu_mask_to_apicid(const cpumask_t *cpumask);
 void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
-const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 
 void generic_apic_probe(void);
 void generic_bigsmp_probe(void);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 80f7417d2103..7009a3c6d0dd 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -621,16 +621,12 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
 
     for_each_cpu(cpu, mask)
     {
-        const cpumask_t *vec_mask;
-        int new_cpu;
         int vector, offset;
 
         /* Only try and allocate irqs on cpus that are present. */
         if (!cpu_online(cpu))
             continue;
 
-        vec_mask = vector_allocation_cpumask(cpu);
-
         vector = current_vector;
         offset = current_offset;
 next:
@@ -650,13 +646,12 @@ next:
             && test_bit(vector, irq_used_vectors) )
             goto next;
 
-        if ( cpumask_test_cpu(0, vec_mask) &&
+        if ( !cpu &&
              vector >= FIRST_LEGACY_VECTOR && vector <= LAST_LEGACY_VECTOR )
             goto next;
 
-        for_each_cpu(new_cpu, vec_mask)
-            if (per_cpu(vector_irq, new_cpu)[vector] >= 0)
-                goto next;
+        if ( per_cpu(vector_irq, cpu)[vector] >= 0 )
+            goto next;
         /* Found one! */
         current_vector = vector;
         current_offset = offset;
@@ -688,12 +683,12 @@ next:
                 release_old_vec(desc);
         }
 
-        trace_irq_mask(TRC_HW_IRQ_ASSIGN_VECTOR, irq, vector, vec_mask);
+        trace_irq_mask(TRC_HW_IRQ_ASSIGN_VECTOR, irq, vector, cpumask_of(cpu));
 
-        for_each_cpu(new_cpu, vec_mask)
-            per_cpu(vector_irq, new_cpu)[vector] = irq;
+        per_cpu(vector_irq, cpu)[vector] = irq;
         desc->arch.vector = vector;
-        cpumask_copy(desc->arch.cpu_mask, vec_mask);
+        cpumask_clear(desc->arch.cpu_mask);
+        cpumask_set_cpu(cpu, desc->arch.cpu_mask);
 
         desc->arch.used = IRQ_USED;
         ASSERT((desc->arch.used_vectors == NULL)
-- 
2.51.0


