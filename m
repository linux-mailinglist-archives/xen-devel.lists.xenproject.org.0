Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68AC1B9F8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152863.1483369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE81C-0008N0-3P; Wed, 29 Oct 2025 15:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152863.1483369; Wed, 29 Oct 2025 15:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE81B-0008Ke-W6; Wed, 29 Oct 2025 15:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1152863;
 Wed, 29 Oct 2025 15:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brwG=5G=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vE819-0008KF-Ux
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:23:19 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b37880-b4db-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 16:23:17 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 PH7PR03MB7162.namprd03.prod.outlook.com (2603:10b6:510:2ba::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Wed, 29 Oct 2025 15:23:11 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 15:23:11 +0000
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
X-Inumbo-ID: 30b37880-b4db-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9P0K/daelYqwR3K60DOcYN0kaTFyI12ziZLym78SIPCe3SvVyjXOiiz3+93oykkb7gRJ+7AGCP5BH/s/HpBHr9Zt0l1Pn38NxnRflfZ18VrUQbQLpQyH7IFnQb3mnYny6aO+E+ndi/jajmxxmBlUlmuAj3hLGmFHjgTh8cjN0+tuM1tTUbzNAdXLSZ0GGUcTREPILdMKMA69mEUI3NT1SlfRGdNB7EFqh8GAI2qZaMZRimoCAGPLo60FmtLPaoYTRXXMC/Q5Uc1n72DVYfy7iHHQtiJMEpXG2xwuV/+kZvCJJfKLNiFPdiCP1Psvz/47Ca27CP+wJPcHrmP8WcTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqaUHzyP6hHK6DvmB+UG7YTitAaWR9N1WO7g9OvvNtA=;
 b=QwN7gABYPvNlZbonPNg1NW41zgKrZvudkq3X2XHPGOUhDIBIqK+B5K7jreuujOLD+Y2Acfw7EFjNLQXJOXBS6rNjvxbtiysqmQYUF4DM3Okb9stub/VMG07YLtnop3tSh8IislU7Swl124dUJVt8Pzd53Y67raxQONV04vXWC8UqQRfP2rK30Zn9iEjmEGhgZfnCD7AopCQ3TUYedCuZ7ej41Th95umllx2K2+paNw6ScWqsIJKGq8hiYLffvWa3DxZSTLbLZB957dTqtWP171Fw2dB/dEM5Ld4C1kWLiEtKIl3GR9eJcgsM4BLpQXZygI2GagdESMMVDSol/AReAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqaUHzyP6hHK6DvmB+UG7YTitAaWR9N1WO7g9OvvNtA=;
 b=ubuwXFH6CO7ykSKoVJv5DOpyAgaC1TdakScDDmrexcV9JQvpjOlN4udn72Ls539/iwCh5VUbN2nSE1tYkNkWaVHTd8HFvn7vrtV/aO1JXlWS5+kqg2JiMLQEsQz5VdpyBFTaXFpVLF3CzSKJO873mcG7+evE/n8DC5QEPATGxa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <51be9c37-2102-48f6-a135-a079fec334ff@citrix.com>
Date: Wed, 29 Oct 2025 15:23:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
To: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::35) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|PH7PR03MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: dba02c06-b1b1-4e61-1de1-08de16ff11c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amFyMUxJQWl0ZXlveFR6QmczWU5Rb3VXZWZSWm9razR4MkV1ZitCOWxmek1Q?=
 =?utf-8?B?c1ZMYW5ub2VSYjFxZldjVFdUSXVCY1FPN0pBQ0pZNngxSlVsOEo3eTFWUlpk?=
 =?utf-8?B?MDg3ZkhPM09pWW5URVFEdHo4dXp4aUpWZnNlaWxDa1R3RnNMYWsyWjl3cmll?=
 =?utf-8?B?TWpsNzFvUHZOZG9WQkthUXdydVMrYzk5aFg4R2ozZlViUk9uUU5JdURsRUJ6?=
 =?utf-8?B?a1E5T0tFM0hwdi9GNDlUNFd5MnUvSWlNZ0loQVdkSW5oRnlESHVWVXpsK2RS?=
 =?utf-8?B?MW5BZytyc2RKcVIxU1lWc0d4MnZONUI0Ty9zbDNnR3Y2UWZtOWJ1cWRaUkVy?=
 =?utf-8?B?R28xVENmMjJLNXdVWmtVcFQ2VkhnUXJyYzY4OThUdDFMUk44TWtFLzBQaUV0?=
 =?utf-8?B?WTZIbkZzVWpzTFlqQlE3VjJ0QmxqcnFSazh1cjNBUWJlUjNpL3Rzbm00N3Zs?=
 =?utf-8?B?bDc2Y3Z0TDdqTWdSektjMDU4eHVGZGxnZWhES21hcmNISDh4ZHNQamt2aHRn?=
 =?utf-8?B?WFZ6Nk9GQlhxSXJaaGxtWmY4eC9kZE83a1A5QVpKNjl0cWhDQ1lWRFZBeTFy?=
 =?utf-8?B?cUhIa3RvbXlWZmRSK0l2OWdnejFRcGxOTzF5bGhnL0YzRmp2NTZ3MGtiRmZp?=
 =?utf-8?B?RENBaGRoN1I0SVJOREtTcDFyajJzNDlmdytocUJTbzlNYUg0T0Yyb3RoNEhu?=
 =?utf-8?B?b1FhQmZ5aXFkNWVGRlloSWVnem85TU15Ty8vRDhiWnRKOW93anZsYkJrRWho?=
 =?utf-8?B?ajBYdjNxampnYjNQbzdXNkkxTVd5WXVjUzh1aS92TnZTaXpmUGR5VHJRR1l2?=
 =?utf-8?B?RXI2eVdwbmpQd0V6OTRYbEM5d3BkTWRqVDQ5U08vRk9Pc3ZreVNTRTI4RHpu?=
 =?utf-8?B?UUZuakxESjFBUGhweDZnaTZWcC83bFA0U3p4L3MvcTBzUC9QcHA1L2Y4cURC?=
 =?utf-8?B?bDZKNXNBd2x5NWlDSnIrdk9BMExHeVZoaEQ1K29YOVV5WGdDeWNlT3dpWDlk?=
 =?utf-8?B?amVTQzlhRTl3KzVPYlZqRGNmbHhhUDBZNjJxdER4SmpvR0RUMElIL3BHTVl4?=
 =?utf-8?B?NDRlazJGdTdWbWNHd1FjbFpHZGpRekF6UElHTDBrRXRlY0FrRlJOZ0VOSzlU?=
 =?utf-8?B?RGV3QjRHOUwzNU81US9aVVR0ZG1RSGtCM3JrUUdLajl3Y3lMTGVEOVlZVWRp?=
 =?utf-8?B?eE1iYlE2SklmOUNJcVlISnVhbC96WHF3ZFp6YjFKL2EwWGdZRW1yc2pRaU1E?=
 =?utf-8?B?MGx3NmQzRkJGR1hBdVZKTXZVUDZXSFdUQmZHV2dackRnVlVySzlrZitrY1Fl?=
 =?utf-8?B?V3N5Q3phK0Z0dmlyQzJFa0ZCdHNTUzBsZVZjcy9zYlNtY0Vhb0wwWUNrMlU3?=
 =?utf-8?B?WGdHdktTNFhNOWJzUUtYT1A1cXFHR3RhWG5xTHVZMlhnNGgwM242K2ZJTWtQ?=
 =?utf-8?B?YkRBTC9rVmcvTHNxTFdLSW1QOGtRSVlyd0tFQTZON0RFbHFMMTRVbzVOVDVm?=
 =?utf-8?B?U1NWT1VGT2tURksreXlVMVpOd05VTGQvWFIwMjVJakxJZFB1c2FyYUlMNW95?=
 =?utf-8?B?MklzamZsc0dZMTN6RHNtOThlUXQyaHRXYS9yV3NFcFhMK1c0Q3kzRWVhSTkw?=
 =?utf-8?B?YldYeS96eElPZUNjc29iWWIrQTFNUmNYRUhsVy9UOTU3Zk5YNmJEZWR0Y3g1?=
 =?utf-8?B?ZkZGbllZUnZ2NTZQeXRWb0ZJQ2ZJdksvODA2OE5iZHJybkRTNmdVUmlZWEFl?=
 =?utf-8?B?ZjFCaGZPZHFTcUNTQ25FNjNxdGQvOS9GRTFocW9YQlpTRFhDYTBtUmZIcTI2?=
 =?utf-8?B?cWhvZXdVUE0rVHU3OU1kc2Vkc3lkUnV5L08yU1RvbUZ1c1BheC84blRoUjdy?=
 =?utf-8?B?bnNJMkNVRGt5SjhsYWxBQVBZVmhIbjlKWDVkK3RUTmJFTUlKb001bW5GeTQ4?=
 =?utf-8?Q?j97nR5LzEeBYIAbp84Ty1MNeayuyPz2b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3BjamEvZkhuWjJRZUhOdjNLZG1OT3hNSXZWaVA5aGNrbUVlOU9kNHUwbGYx?=
 =?utf-8?B?bGQ0eTFoYW8rZko0aWhIeFJrU2t1dWtTb2ZFZklLVVkvb3NWbjJLY3N4ZUVK?=
 =?utf-8?B?ZFZuRUhUbk5qbzUxRmQrSVRyNE41NkxHR0R6WUpmb1VzVThzeWlXSjAzVEFK?=
 =?utf-8?B?QVVEZ2JYalZyMjNrMEJqNWFuOWluczRQWmlVeDZtL3cwbDR2dUZIY1ZaZXlS?=
 =?utf-8?B?VTZCUFRBRXNnUlp1VzNLSTVGcVZnVkFRWEFybWF0VUxRbmpRSU1RR2NjTm9F?=
 =?utf-8?B?MDFsMDNkaGlONlhGWWZsbTdmYVpnN2s3YzF2UXd1aXRjWnhwR0JIbzY5ZG4z?=
 =?utf-8?B?d0dZR2FDeGQ0c3B6OWhmZmZDcWR5bForMEVtU2FXWFVVbnBUVG9DZWVpR0NM?=
 =?utf-8?B?cEt4WFNVWThlNVQwdHhUYzlhRVAvWExIR3l2Si9oanE4aHR2c1lGNVlhU2ty?=
 =?utf-8?B?UXV6bXpPRmxkT05ES3hnNVQvMTBJVmozWlk5QXFLUnR4TnlKdTVNOUlHei9N?=
 =?utf-8?B?a29teVRtbFdXT2NRRTMzMHRLYnRVZTMwYk8zYVVyc0NGbEhEcHc2S0N1aVQ1?=
 =?utf-8?B?cmlVcnozT2RRaGM2K1dLcEd2T3pqLzhUVDlnaXFHNFVyczBpZVM2TTBxajlO?=
 =?utf-8?B?VU1NMGdVejh2ZTBUdkVZNEN1Zm80blQxbjQ4YnBvNlBqNFliRUNvMEV3K1Yr?=
 =?utf-8?B?M2IyM0ZJOHg3MTUrVUF3amNrSWdaUXhHdDk4MndwcDkyeG8wVS84dWlsTmVJ?=
 =?utf-8?B?RVc2SzJmZXBKTERBeVVDWGdsSi93MkliVFhFdXQrTkpieEYxdnpXUWlHMVd5?=
 =?utf-8?B?YW1BTjg3MWFXWWlLSVBKbHd4akZZbjF2QldxMDZGaGRST2J0M1lYWU5BemY2?=
 =?utf-8?B?aVJsTUxhdGd2OXpTcERramNnVUFQZmZWcWNESC9pdng4cHVEbWQ3bVlpUGJj?=
 =?utf-8?B?ZXZEU1ZkVjRrcjhVaXh2OUVZL2xReW1rb1lqSGJvRzY3VTh1VjkwT1dnNGo0?=
 =?utf-8?B?dmZsTFlDY1pRckw4aUxXU1V1NWFJcXl6NEhIYWozUlRvR08vTUpPMDFYbmtI?=
 =?utf-8?B?OWEyZlE1QlZUMGhPdzZyeHZPZVhkMHQyWnMxOFZXS1R3M1JMWFZVNVppRy95?=
 =?utf-8?B?ZndXdEN6UjJWVnlibEF6ZlQwNm1lZmZVc2c5RklZSDVERks1QlZ4SFk3dkNO?=
 =?utf-8?B?OFV6U3E1M3YxT0pXblhXcmV5bWJtSG5mMkcvb0RqSWVXcmhmb0RaWUhXQ29F?=
 =?utf-8?B?N0hiZ2VEYWVaNEFzdXlGQXpVTW9ZZkFGTEVIbEFUVHBpalhtZjlZdnU4WkI4?=
 =?utf-8?B?SXNTUk13VjBOR2tOM3FoY2RDTklzTmtycjVvaFRaTW9GcjV2VU1rVzRtbERa?=
 =?utf-8?B?M215OHY1b25Qcklpem5IUFRIUFBoczFNdVRiSkhKRnRvY3NUNzhqUHRiL29l?=
 =?utf-8?B?dHRIaFBieXpCMjhrUTM4NDFMRXFNamhZTkRHZldNRzNhTFZROE10VDUyZHI4?=
 =?utf-8?B?QnhLOXBiZjZONjg1bS9ZN2Rvc2d1bk5pQ0ZSQ2o1RHl0Q2RXd2tTa2lzVEZ1?=
 =?utf-8?B?V3hlcFo4dmtsY1lEZm9Hb1B4a05DVHl0bkJQZG9jZG81ZTNCSXkxVVhSQ3hX?=
 =?utf-8?B?cTZ4OUl5eTFZWTFLbXRyT0liejE1Q3JJVms4ZEgzeTBuckptZlgxcGlOY2Jp?=
 =?utf-8?B?VndpeFZ6R1FuOXg3eDhrZUdCaHc4RnZndXcrNkh1bnZLMDBGUWF1MWVhbFZ1?=
 =?utf-8?B?Sy9lczNEdTdwUWhRU0hKZVpMdnpwd2hkTFQ1U2pObFpCdk44RVVkdU5TQUxx?=
 =?utf-8?B?TSt5bTZRT3RVYndHZi9LZmRwazRKYTl6eTJ0T2U4b2NmRXBtcnlFS1RlUEpC?=
 =?utf-8?B?Qm43aGlOUER6TVN2R0FaTGhFUnZ6clJhWHJjdklHSXVNRkRXSVIvSHNyeHZm?=
 =?utf-8?B?NHZJVzZQV0NWWVUzUHdrSFhEZjlkNTY2MGcxZCszWnFPU3hlbnZLS3BsNjVs?=
 =?utf-8?B?T2hETTZRZmppenZzcmo4MXBNZWtnNXMwTmdPcUY3OXhLbzVJUmpxTUE5RzNo?=
 =?utf-8?B?SzJKNGtsMVpEZDVtci9ZcDV6dGphS0xOV0xwZUVaT3pmWERMNjlEOXdJS2dw?=
 =?utf-8?B?SXBMekY2eDUxUmpGbkhTajVyc0h0K0xxUEZUa3BiZlZZTlViR0QwWTd1TElx?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba02c06-b1b1-4e61-1de1-08de16ff11c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:23:10.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEN3u144PCMVh6BDM28fqiDbwYd6d4eocTGRrLXpbmUmOCgaggkDf5W6lk7h61dThJnogG0YlOzxXhbSV3YkOQZw2kJ7vlolLS+IUEwa650=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7162

On 28/10/2025 11:28 pm, Timothy Pearson wrote:
> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
> maintainer.
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ecd3f40df8..c8764a8c5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
>  F:	xen/include/acpi/cpufreq/
>  
>  PPC64
> -M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> +M:	Timothy Pearson <tpearson@raptorengineering.com>
>  F:	xen/arch/ppc/

Sorry to hear, and thanks for letting us know.

For a long while now, the committers (the group called The Rest in
maintainer) have been operating as if this was an R rather than an M.

It turns out that most changes technically touching PPC are common/arch
rearrangements, or common things that need a copy in all arches, or
comments fixes/etc.  We've been putting these in without a PPC ack, so
as not to block work in other area.  Obviously, anything that is PPC
specific waits for input.

If you're not aware, we do have some PPC64 build jobs and one QEMU boot
test in CI running on every commit.  e.g.
https://gitlab.com/xen-project/hardware/xen/-/pipelines/2127184050

Would you mind changing to R to reflect how things are working in practice?

Also, we're in code freeze for the Xen 4.21 release right now.  This
patch will be fine, with a SoB, but the others will have to wait until
4.22 opens.

Thanks,

~Andrew

