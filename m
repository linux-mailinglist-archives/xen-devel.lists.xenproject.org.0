Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DEAE43A2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022342.1398126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThJH-0001L5-Ci; Mon, 23 Jun 2025 13:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022342.1398126; Mon, 23 Jun 2025 13:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThJH-0001Il-A1; Mon, 23 Jun 2025 13:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1022342;
 Mon, 23 Jun 2025 13:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqlE=ZG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uThJF-0001If-NY
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:34:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9356fa8-5036-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:34:03 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Mon, 23 Jun
 2025 13:33:59 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 13:33:59 +0000
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
X-Inumbo-ID: b9356fa8-5036-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zO/sbyY/x7Aln4V/bEDWbuoZSaEMu1w+qitv4OhXpd9jzTlZEIQ/0Fj4sQmgP6pHr8nlXOC8A6pucO/EvP70eQytj/a0lyjvjNGXJnk7XwCh4JN/g/roLaTu41nJym+fbi6FDonb5W7Eme+ksiVpWnOWvFbsK1qobfbAPqQguKHw082R4+QjkOLIz9gQ0ong6GJ5b2zcwaQ+CNjvTDRHIQTO39m5KfSrVL3bHgEe4T7EczHtdNUbwoq04OEIDNk0xwIucXFYjck3C2SUSImDzCNwEcH1tPrYnJXeiNdjCNrDCWAXqRVZExJKKKpykjvgG/hVfZKUPApvan14zq+Elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFQWjcBCXw26hRC1ZWrkugATZ5VlbiL7Md2ju5lP1T0=;
 b=negXJ1Xxq/K6OE1FWIst1MvDnLxWCa2BwTGTsl3QHnXtk6A/mbo4W0Uy8EbRA81srZ6sKMf5Ijv+6Hbcu107RQwpY8PMPyfJS3dLTTAeB5dWJ07dpN27WicIsSL02ZeyfzFDg4ExQONl8lBa01Xdw1Gtqf/gm8bGOOtsY0qHHsocNEuwa44Ak9AoGpXftzAR0dX17+zI8Jbf35jonQX+QcIrXG9wWh6cwK5RqbSO7kGdfaq2Pz/9dr06CHpl2dcpdp5GxmwaopHshQK0RqbK1aPSKmWHMUoDJGflJ2JlTimr3Bd8XzLxZiz8mW9dMnqrkj6/K+pyRYBSmks4Y7AxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFQWjcBCXw26hRC1ZWrkugATZ5VlbiL7Md2ju5lP1T0=;
 b=eXAsOGkew3eeEdv9Stj8niyOEiDMdn7XTXtViQe/l7OJkDI3iL0zv6qsY+UojfIQiEBklT18f1PlhYPvt7Cvn34zKcnGQKfFkPTmfAh6rbq0xzNmIE70tf4kL1CMfOLZMhljmObi1S4Nzn8RCbmIwtXmtjGXozhm+Sk3N0A06d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e0187198-de00-439a-bd80-caf8faac6f5f@amd.com>
Date: Mon, 23 Jun 2025 15:33:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] xen/arm: Add wrapper find_unused_regions
To: Koichiro Den <den@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-2-den@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250621151201.896719-2-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: a98e60cb-49d3-479b-c689-08ddb25a9c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmZBeHR3ajZLbkR4bnBTTHZoTlNHYytDbU81QkFsbVhERmdUc1k3eEF0UGlk?=
 =?utf-8?B?QWc3Nkh1aXRCOUt1SEZXTjFvU2h2WEhCSXVQTmRpTUtGbmE5WFNEbjhESzZh?=
 =?utf-8?B?aWp5cGhONDdSUjJZU1VDM2p4LzUza0plQUgxbWs1b0x0NFRTbW9GeFFOVUZF?=
 =?utf-8?B?U2cvQlBZbHI1SlBlWDQ1VzNSdXBxUTBDczZPNWVRaTJYSlRLZHEwdFcrQnVk?=
 =?utf-8?B?b3ByOG4rd0RWMTZQUCswSnRFTE16dW5hTDJveFd6TGJGQmxsMVZLUG5ZQm5o?=
 =?utf-8?B?dFpzZlJxZFd3YmhrYlhVZzNLZHAySDlrYmdPM2Q1aGlsaVh0VFowVTVwaVZU?=
 =?utf-8?B?d2dNR21zN1VsSUs2bHlpc1VmVDgxNXc3MEZqbW81UGVobmRWZnNTNjlnUzRa?=
 =?utf-8?B?SFdJMHhCaFFMNjBNZmx5a2NOOFo0K2JldVpLMWVOdmMvaFBGc1JzM056Y0Ra?=
 =?utf-8?B?UEVJNWVuRHNoTEFraTRiUlBUdlhaYzhSeHVob3g3RVRIblJWaXYxVm1RcTMr?=
 =?utf-8?B?blBBMGVWeFVMT0hXbkxPbVpoeVJjclhmbm9XVlRkMjEvMzcrZXZ1RHRZSzlw?=
 =?utf-8?B?TGdlaHA3OXpMdGRpWk5tcCtZZnJuZkU5T216K29CbWRMNHU4VC9zeXpuM0JP?=
 =?utf-8?B?bjU0bVZVMnlwVUpERnp0ZWJ1Rjg1L1hXbExoYnZxWEdQbW9WVnd2WmIwZkhL?=
 =?utf-8?B?T1pVK2NIVjhWVzlsYlZFazIrbnZmamRTd1JTa2ZLd0RCTFlyeFJxdWpRZktO?=
 =?utf-8?B?elRLQTRnSzUwdHVBR2RWMHlQbkxaN29PbEM1RzlNSHRFUEh0ZWtRV2h4eGdU?=
 =?utf-8?B?M2pHMjR1VE1JTWNWbWhqNDJaT3ZQMHhpN0NOMEJpM2pxZndEa1huUUxnd0xQ?=
 =?utf-8?B?Wm4wUHlRTitBLzk5a08rZmhOYkZCVWJlR0RUT1lRTEhFbHhJK245ZnBvRkpO?=
 =?utf-8?B?ZFM5ZUphYW1jOXM5NjFXRUhoU2NGZGtVN1JYcTdzS2RPczRKY0t3bVA4c2l2?=
 =?utf-8?B?YzVNYnpycXpSRE9LaG9RajRCTm9Nb0tSVlJndzMxOTZXdVQ1NHh2OFliTTBq?=
 =?utf-8?B?TzBSNFRKZ0FXbmhIL1NUbVg1T053elV1c2NiWUVEWlBzaVBEdGRXYm44WVg1?=
 =?utf-8?B?WFhKYVpuTDNaUFo2RW9Ba21YMFhsTGw0Y1M1MHYwNmhlMlFOUU1QMUdrbUo2?=
 =?utf-8?B?WUF2SUc4R0ZSVWxkRWRCdXpaSndUOTAveTk2b2huOWZXYURaZ1lYajB0Y1c5?=
 =?utf-8?B?UGw0MllFYTBNSHpNVnJFU1M3aUpuNzdrV1I4ajRLaEo1bUN5TVRKek43c3Jn?=
 =?utf-8?B?VTk3TkNLeElpeWJSbVVqRElhNjFpWFdpampGTjl5VVB0Qm5RaGs3SlMwTFc4?=
 =?utf-8?B?MkVZNUhUSjd6Rmo1TXdrU3RmM0g3WEExemtjMnl3czhYMVpDaHZsUU42U2ZN?=
 =?utf-8?B?NSt0dWdzbUZkbmlJbHFGT3MrcnQvay8xWUxFbE9uVGpReGovYUpMbGFmMXRL?=
 =?utf-8?B?Z2NmS25nS3hPaXIrb0VyK21LdWpwb3h4UkR6cStCOGZWSEE4NnVOYTZCTWU5?=
 =?utf-8?B?VSs2ZER1SzRQWWtYUFZBYnZmNTBOL1VaUklCZE95YkdPRUhUWHdrOFJvNUd6?=
 =?utf-8?B?czVkRVdXbFFUR0EwZWRWWiswellTUStENUgwSDNaTkhJNmdHbFFNTWpDSCt4?=
 =?utf-8?B?UXl6NGExQ014bmkvZndlUCtqSWEzS0VGMGYzdTdURnVKYVg5K3RoNjFBRWFs?=
 =?utf-8?B?NmhMNVpmQ3RraC91Y2tIdy9BZ3d4bjVoUkxqOCt3dTdrR1drYTR0eHRidDZy?=
 =?utf-8?B?WExxSWZaR1llN3htdWxzREJhTW14NEh5U1NZalFDS2R3WWNQdkxZa05Qci9W?=
 =?utf-8?B?SUNRYWpzaFZ4MWZIRXl3ampCNGFiazBVOUg5RWZxUDZ6ZVMvYTNaU1QvT3Bu?=
 =?utf-8?Q?iq2UIz/iCHc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1qTmpGY3JINkdCVWo2MTRxUzg1eldEOHFLZFBzaTZ0UDVDMEtwNFd6ZlND?=
 =?utf-8?B?dUxiRGlYRmVlQllXVnQ0N0dkSzFhQWpvcU1lSTFER0NjdHRGUk9ObU90NUpj?=
 =?utf-8?B?YjlieWZIMEdxRFVFUmZRT1htSzA3RFhYeFprbFpnZlVBSkZ0TUxRNHdFVTl1?=
 =?utf-8?B?dUNxWFhoNjdkODkwcVJjNjlEdi9FVjU3V3N5MGFkdUZvSEI2dkhFMnBiWVI4?=
 =?utf-8?B?RW1vS2EvSFVoMmFQRXd5OVhMcXF2N1Y0aVZuOGlKU1N4ZTZiSmtXcjBLRW5r?=
 =?utf-8?B?STJiU2JwRzVPcHN0c0tBQTEzUGV6Tkd4VjkyWGhncjI5eGJDcjNPNEovOXUx?=
 =?utf-8?B?aVdoeHk5aDJxTFhBUUU5MHZlbVVZZkFwNGk1dHpBWWFYb09UQ05BRm9MTXhT?=
 =?utf-8?B?bWM4MTVQc2puVlVXVVpDWTRBK3VEU3gxZWs5djYyQXRJenYyc05VZkZ2Z2hL?=
 =?utf-8?B?OThyNlRJRm9wdk5CdWdrZ3ZyaldLTzZiaGx2STdDNGJPcEE2MkFsdGdrZk10?=
 =?utf-8?B?OHJTdHpPT0R6Mzh4UTVWRFA0dnlmaUgvOWtWU1FwM2h4SFRGallhWHh4ZmFN?=
 =?utf-8?B?VEFRbXRmQnVsZVFxOXQ1YTdMS1J0TVByZzlWRXh4Vzg4azRnSWZwVVEvd083?=
 =?utf-8?B?U3JsN2xSRTh2SUt3NlRicFlscjFSRUNneC9ZQ1NuSHNIanB6WFhJWVU3MzFF?=
 =?utf-8?B?WWNLVytFVUdqb1NjTmxUUmRDNlQ4dVVxNjNKTWlrdS9OMCtaVW9Ya0MrNWUz?=
 =?utf-8?B?S1Fpdldwb1RSbXlCVDNkamUxb1N1TXQrcFY4UjEwVGdiU3UyK2dkM1JMNUdJ?=
 =?utf-8?B?ZjJENW5uTTdUcldWWU1kaWJ4dXN6Z1dTT3pDbE8vTUdOWTRWMGQ0dTF1angz?=
 =?utf-8?B?bkFxWENKRlYvc2xza2JXQkgvZHVJZ0kxT0VSdzVrd1h1alVSeUNsUXF0WTAz?=
 =?utf-8?B?NmlydG9NbVJPeER3aHN6SHIwQUhUVGxJYUwwRTg1R2xRT3BJc0l5cFFEeGF4?=
 =?utf-8?B?cFRKQjBSREN4ZHBVOTNBY3VpMkdlSGZIWGlwWFV0Y0w4N0Q3MEo2SnlxZzk1?=
 =?utf-8?B?eElpZTBJbUtLMUg5WnNwRi81aEE0Y0M4UVlkQTNMdkhOVTZZVUhPQStKaUZ4?=
 =?utf-8?B?Wm9SVTJkZTRwRHFrSVZTclBOeFpXbGt6ckpORFpkMThyMVBqSFhCbm9sSksy?=
 =?utf-8?B?SkM5V1k5YUxxbTZPN2p1TThhMUh4bTNDbVZHNGpQaXhmQ1FESTh3WDVJclp1?=
 =?utf-8?B?d2NZSW9RRjFxUEwyd0x6M0tya051T29jazVnOXkvNFdGN28zK0RLSXNEM3V3?=
 =?utf-8?B?aHVWODBFNEZlZUVkbFAxa0VUS1lzMTF6MU5mRjhiWlZwRjlsQitrSDcvVm5z?=
 =?utf-8?B?cWNpNzg5M0lzSnVYM3FBdGhvZ2s5ak9yR2Y5M25La0ljWUJzVytFc0g1Z3B6?=
 =?utf-8?B?QTZ1STBUcTBiaVdLOE5YQkZyNW9PUXJpWXpTUnE5UHRjbGY2ZDRuREV0Z21u?=
 =?utf-8?B?N2EraDNmTEZNc0dGMUwxZTlXV2JnZ0t0a0duZzFQZEM0cVFKSEgwZmJaT0xq?=
 =?utf-8?B?MGFXZ1BVSDdhNURqdTZvdndPY0lVU3lrcjg1RU1QaUJFSy9zcWhDNDZncGdT?=
 =?utf-8?B?bC9PdjVzenlkZ3hZM1djeDh1RTVudlZjaUlaS1o4TVhlYzlIY2ZjdkoyODVv?=
 =?utf-8?B?dWNWY1BiUGF1dTVmclBoVWx1OXdBMXo3Zk5idldiNHMzUUtVZnRGWTBNMWVT?=
 =?utf-8?B?NlR3UHNETnlFQWFHYzhBQkNuY0N3SDR3RDF1TFByaW9SekNhZGtocExyZ3Zl?=
 =?utf-8?B?VnJhaWFyOHM3NFZ2em9CQisrVzE5Ri9hZXVpUmxIYVJRbWhMdW1PMG4vb2pX?=
 =?utf-8?B?NW5DQVgrSEd1Tk16cVlSQ2oyMjBNd0RRUXZhYTJXR1FhR1BlY0g2SmlUWEpi?=
 =?utf-8?B?KzBLQXdZcVlZdktCRjFSNjd2aXZIZisyaTFySS9VeGlDSDQ4SXliTUY3MWY0?=
 =?utf-8?B?RWpqa1loMDFXd3hwMzkrbkxBaWcxRmdyczR3aHlLZ1NSYXV1dkNiSndHeWo1?=
 =?utf-8?B?K2FUWXA0Rkxsd2xVWkcraG0vS2hPb2Q1em9oelBRZVZTNmtvUWZ0RGNrMlVU?=
 =?utf-8?Q?0VZU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98e60cb-49d3-479b-c689-08ddb25a9c00
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:33:59.3064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaBLkQH5wjVqOBcZBS6XWn53hL3RvD1R4NgRMJbmGluQZ2xlT5Lt0mg3AcoJRMn2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463



On 21/06/2025 17:11, Koichiro Den wrote:
> This is preparatory work for the upcoming commits that implement the
> standard PV time interface (ARM DEN 0057A).
I personally don't find such messages useful. If at all, reasoning should be
given first and then this message could appear.

> 
> No functional changes intended.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  xen/arch/arm/domain_build.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4ff161887ec3..9d44b6fa9470 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1070,6 +1070,23 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>      return res;
>  }
>  
> +static int __init find_unused_regions(struct domain *d,
> +                                      const struct kernel_info *kinfo,
Let's not propagate unjustified (IMO) behavior of passing both domain and kinfo
pointers. The latter contains the domain member and therefore is sufficient as
argument.

> +                                      struct membanks *ext_regions)
> +{
> +    if ( domain_use_host_layout(d) )
> +    {
> +        if ( !is_iommu_enabled(d) )
> +            return find_host_extended_regions(kinfo, ext_regions);
> +        else
> +            return find_memory_holes(kinfo, ext_regions);
> +    }
> +    else
> +    {
You can take opportunity to drop unneeded braces

Otherwise, LGTM.

~Michal


