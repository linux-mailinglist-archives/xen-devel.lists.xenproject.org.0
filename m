Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C365F09E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 16:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471977.732043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDScp-0007o2-JN; Thu, 05 Jan 2023 15:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471977.732043; Thu, 05 Jan 2023 15:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDScp-0007lV-GW; Thu, 05 Jan 2023 15:57:51 +0000
Received: by outflank-mailman (input) for mailman id 471977;
 Thu, 05 Jan 2023 15:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDScn-0007lP-No
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 15:57:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2058.outbound.protection.outlook.com [40.107.14.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b31eb18d-8d11-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 16:57:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:57:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:57:45 +0000
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
X-Inumbo-ID: b31eb18d-8d11-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIr82r64RqQ2fdOQa8XsTQ00nLj001I3N9/HBwlly9WHA674lkaPET8gm6s0GOSL34D7SmarEX6etShRAh7tmU7D4SxrRFH9fPWypk6xhGAEYu2FOKM6Apw9215/TKn9X7ONB5thoqd9DCei4IOlz98y4txraAOFPVTiVFfHtkCs3LmhTzlgKI2T2BZipTomrL/rN4iuQiJhQD7bbm1m4UcVMmQ9VrbdoO8B0QYIrowF+dKx0pU5tFrafgdupAoL2jO7LsuCm7ydh8el16Ib0okcC7esQz9nEFVlWSSdn/uOxn7BKzeuV8m16/vQ6uNLP3+sYxb0Y3rh6DWYOhZbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSiR8+UjgVMW8QiXCNqPlZifOkOHmStw8A6NZfqu+kQ=;
 b=A5RV05DiHqFjo4Y9ZzQbBkgzLfzbZk+2lruXvKkecMj6WY00YuyOJZj6GsfxQ1k6Vid/mIyuJPUKuAMQD87keo9Iu4PZIRFyaR8+5a2MP+7bMQ25UxNJiXWg6ukfIs0MVSFiFFumCMDcqlZp80y5HFOWCc0Ex7cn8umQkXveFHFEKAi365PSLkz6QAvVEhKUF4NzS23NGAhDMgem2GcqPLJ7IZh0I4q4k0X39Ld7QzJfnC1ZOM4mJo7fl/9Va0JCmYd51ENtTSe+kRPUHz4uC7W2h42n7VIazDv7+GcnC555udbhVeDiO5NDGF/R/AmXF03ACSJymEUTFbJDwSOk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSiR8+UjgVMW8QiXCNqPlZifOkOHmStw8A6NZfqu+kQ=;
 b=idkqKQzojWApzPy/EL5JrXlaczlBfUJSfwrx5YRqH3cVQQshhSU519kBftJ1M5s5Tm2Y2ibRaakAkyv4iq0Sk3Z5zATUROvqyIOzDasv0xkNCwZS6UEg7/Yt3HYMsiYqq39DwZ2/avlv9jwgLYHMwDMkyoLcAaihOaBnooJkPsL6PQlsxJ31MiD9x86221EihUtTqbdJ30q2hlOw3cbildXOEzKCaS29xKdWeU348p4gCC2TbyLh7oAEXbUjjDp7GEcPupwMLx604BzCaxeDTCPw8wVyX7vI5xfolWYmxsNg+Z5yJmYk22TVikUy7Dd3Wts5nGhtImhwat45buELdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Date: Thu, 5 Jan 2023 16:57:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/11] x86/shadow: misc tidying
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac1bcb8-b040-43f4-df0c-08daef359602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fXlf/Ki00uVFwYM2FFy4afSYUzRKNVVLDDglYy/3Fpu8JS6AAbIZsupLFv+pWwV6sUfALnRarCOMktysUidNCqtngc329xmaqMBut4z++jUa5OQduU/ukN2zySfQgoGXfIzhFdtSzRQ9yY+do3973dwD4uWOhznm7/dPMD39P3Ivy+CB+Wq0BF69JzCQG2z1EZh7TT+OOpWc51qK0QmCm/wKfb3MBOhV6NgmZx69KD1JkhcIQaLTUUxCk6ClWIkRDlNYI+tWOY5k33XlAaC0ST72O+daZM7xEPx6+UbzyhWCdNTnjX0MP+Cu6nLjp6PtmN9+F7RhWyCx3buG8CFh1ZbV+3dCq9MPsnS00Uvbqo1KEQZMdirdnsg8zpo1+hxzn+QzZS8piF1ocvJNvHDoJhEou98KdNAsWUa+YG9+k3EcTI7RYsgo46et+b6TCjUakwpdW2um6CTwZu7fVC+qJHAwOHuSJDJFZfDsinrOrE9zLUExvOiNXKxHtdpafr+bz/sCr61kMSwxUsQ9MjT5mpD6aD53V12wipkDk2iuWJ7ZslAPzUc0QjBiNu77IRQJndhCpkHVvnHOEX03fRB/ysaCwFLvE98thO2dhHOR5laVdtJk2ZLqn3Bvct1JsmFSGT3AFYLsascGpwM171pyiLq8yQs7QDFwBiMrUJufZA5jYy8MoUtjZ+YFjP3RcM9ymVSgIHB3pV27H2gu8KQkxSn1HfJLWlHgpon7k59al4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(54906003)(186003)(26005)(31686004)(66476007)(66556008)(2616005)(6486002)(66946007)(6512007)(478600001)(83380400001)(8676002)(8936002)(5660300002)(4744005)(41300700001)(4326008)(2906002)(316002)(31696002)(86362001)(38100700002)(6916009)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWplbXdERUJDR3k5dUpUQVUva2U5b2JHMWQ1N1k2RlJDV1Qrb1YvcmRxNlNJ?=
 =?utf-8?B?VG5iemNkUEN4a0lEV0l2aEs1Q0N3KzNRMVZaWmMvMVh2RWFOM0tpMmRDa3JG?=
 =?utf-8?B?NTdFcXpuWlRsWjIzU0VBSktGbHYvY2lNMUROMjk1eWhvSzcvRXNnYXhZQzg1?=
 =?utf-8?B?NkpWQW9GT0FpVlJ1czJSKzRseXQxZ21ub0tzZU5BL2d3UjRRWVVFRm0wVi9u?=
 =?utf-8?B?QlhzVkNieWl0SndDTHc5bGp1ZVJyRmEybnhtMWU5b1NYY1p0SWVDRys1bm9v?=
 =?utf-8?B?VlFYazhJeHl4WmtzZWJIK1VtVENTeWNscGExSHJXMWh1dGh4WldDcGYxSWow?=
 =?utf-8?B?dWRVWlpaa0JxQmwwdHdnTzVsYkFFOU0wdEZHQUI2anpEK3l0K2gwMXcvVmRC?=
 =?utf-8?B?dXlhSzJKUndzWmNwRTMycDEvZTh4ZDJjTnN3ais0dmd1RGFTZk93cE9YTEsr?=
 =?utf-8?B?Z2VZSzVXekdiazRCYmg5ckZhK3UzcnNsNTJyQkZCdHVnVFJrbXhvZlJSQVJa?=
 =?utf-8?B?YUhSVFZrTjFaUGtHZ1pDbFN6aEVOYnhYbW9pd0J4M0s2RXRQZ2lYVEdXRHBh?=
 =?utf-8?B?cnZTNmlQUnUrejQ0RnMrRnZ4SDVSYXFCd28vL2hHYlhHdUkvbVo4QmtINnVy?=
 =?utf-8?B?MVhPdXBxYUwyUS81bm54dzM0UDdZZFgwK2hjY3RiMHNOb1JJMFlGTk5uQTRT?=
 =?utf-8?B?dXVsRmlPck5ZM2xnMU0vS2V3Rk0rRDhremdVQmU2WkJQVlZGVzJMd3ZUSWVO?=
 =?utf-8?B?dVc3MWVKa0hSNWtKM3E4MmZLNk1OZHlVcWhDQ2dXZ09YSkprNG5JR3ZVWTVP?=
 =?utf-8?B?dmMyS0dSTVNKeVJBbURCMk5MUDFTUWNmRE9FVXFoVVo1NmxrR3JxWEJNVCt1?=
 =?utf-8?B?NmhSZlFtNURFdXFBVTNDQ0dESVliVUpjVTVmdmFkNjZTaTJPbHl2a2RYUjhj?=
 =?utf-8?B?NGE1b2NsQ08rU3dkTUpCUVZiQ3htN3BySlhvdTVXVmVHNlJpUXMxUkZEMUxp?=
 =?utf-8?B?Q1A0bXFjVndMZ3E5My9YSHRBdzVBYzBVRnZlWHVLbldXQjNiMkhKM0FqVHNp?=
 =?utf-8?B?UHNBSitPWnRFZ1ZjK1hMS0JZeGpBVTZpd0VFSDVUM3hFVm1xckRvNDVXY1Yz?=
 =?utf-8?B?TUVzVWVTNUQxVnB0dDIySlU5SEtJaFl5M0JWUHJ5ejZ1c1FaMmdLK20wTTA2?=
 =?utf-8?B?UzVxT09YSDZwazEvNk45N0QrUGNobXVkMnpwY3RRTFdGNytRS2Q1VlExT0JM?=
 =?utf-8?B?TGNvdElzSzdqc2R4WStaY1Z3WlI5UnZDZHArTGlrbjR6WGtyQnN0eG9hM3NW?=
 =?utf-8?B?dTBXazNSbUw4S0FIQzUyM0FkdkdUaGlpMTFISnhMaGNtTU5MQk5SZVA0VTlo?=
 =?utf-8?B?K3hCSGFlemNYdmJ1OEZkdDNMU0VZNnZyazdTZ1pwZ05UUWRlV3ZNR29wQ3V3?=
 =?utf-8?B?ZE44Q2hBM1NEOFVGaUdlWXNGU2ZKeFlvdHd5THhNeTVvZ0syZkFqNjBmb1FD?=
 =?utf-8?B?a2xnYmxaYzBsUnpTaE5LQ2c4T3FhM25lajNiakR0YWRQaGNVbVFjMVQ4R1gv?=
 =?utf-8?B?SURuSEcrSEg4SEpsYXkvandmNXpCdUQ1bzJ2ck84dGRJYXE5c0hIMTZVcGxF?=
 =?utf-8?B?Q0lveWFiVDAzcStSTWVOUXZYVDE2QTlBRlM2NDVReGF2T082SHRoaXJ4MThL?=
 =?utf-8?B?N0picUY5NTE1dGZVc0xzUmxPZmF3QnFkbkpML1o2OStJVExFbDFVMzFTcW8r?=
 =?utf-8?B?TzFpcGhnU3FsUjVFQkxDODhtTTZNS1llVjd0ZERQbEVhcmwwZUZxOVhXOGpK?=
 =?utf-8?B?T09ZUWhxUnNJbEpEV3FOeUJsR1NSY0ZYN3dDZGs1T3VkR1YwSmhxVG10R3VL?=
 =?utf-8?B?cFJyOXc5RWtFTEcydUowaW9jU01xZzZULzdEeGRvajE2dEF5ZjZubm1nRWZo?=
 =?utf-8?B?dE5EcEtaRGhsU3dqQW5vbEhDamlRR3R0S1hJTlAwMU5pR1l6ZktONFhIUldL?=
 =?utf-8?B?cjVCSGdHT2RMdmNGV2czZHVHcndiU3VLeHJKcFpRMkRuNTRSQmlOc2tRcnZG?=
 =?utf-8?B?SG91SmZ0Nm50bDk3cndIZnExNGZOcHh0QUQvalJqMy9Hc251YThnY0JzaUtJ?=
 =?utf-8?Q?cYwyh8Vbs8QRuQc99saRqVWNg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac1bcb8-b040-43f4-df0c-08daef359602
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:57:45.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IS/IdPKpj6oDXBaHcckujCKCUeFvD/0yTweAplS4JRhMpNefvKFCkexkZkkTGRQW1ExK0zxkrjBoJ/0dZbFRZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285

... or so I hope. The main observation was that we still have both
hash_vcpu_for_each() and hash_domain_for_each(), where the latter was
introduced in 2014/15 to replace the former. Only some eight years
later we can now complete this conversion. Everything else addresses
other things noticed along the road.

01: replace sh_reset_l3_up_pointers()
02: convert sh_audit_flags()'es 1st parameter to domain
03: drop hash_vcpu_foreach()
04: rename hash_domain_foreach()
05: move bogus HVM checks in sh_pagetable_dying()
06: drop a few uses of mfn_valid()
07: L2H shadow type is PV32-only
08: reduce effort of hash calculation
09: simplify conditionals in sh_{get,put}_ref()
10: correct shadow type bounds checks
11: sh_remove_all_mappings() is HVM-only

Jan

