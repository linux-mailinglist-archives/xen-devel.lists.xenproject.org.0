Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HTHJ+DmqWnuHQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 21:26:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A42181FB
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 21:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247123.1545994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyFFv-0006vw-If; Thu, 05 Mar 2026 20:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247123.1545994; Thu, 05 Mar 2026 20:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyFFv-0006sv-FZ; Thu, 05 Mar 2026 20:25:11 +0000
Received: by outflank-mailman (input) for mailman id 1247123;
 Thu, 05 Mar 2026 20:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vyFFt-0006sp-Rx
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 20:25:09 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66adbf56-18d1-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 21:25:08 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6470.namprd03.prod.outlook.com (2603:10b6:a03:396::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:25:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 20:25:03 +0000
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
X-Inumbo-ID: 66adbf56-18d1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWOg0cpRru4auTsFsubdKbZ/UDipjtWMwjKLeXEQuG5w3IataLrAeH8jSj4uJcALW9Qyj+QtFUkZ0RW+sRBXQGbZBR/cvhgX4Yg7r/PrJ593lxP0eEa2ZfCS5ivskpBNr72RK0H98/q6dkfz7eLeyKNa5IcwfA84Iw3CQf2k6jr2u1j2mzQfz0EnJCf14oHL+JssnqZj/E6wNz52N0rGcUVqvotsqW2eq7AqZWWO0ZT5ZlUmySLIXN/fVGarEDzlnXHaZbYkq//ywUxPPcyxpQ671EZQZRo0GBGxrfqIoQSKWxPMI1B4QHx6EAalabHyedY31arT/L+W6YLIPXAULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwSb0AQsqbBm3g9wEJyMQTvkXvqq3aGJzRJL7F+bE04=;
 b=hNXwzqCBL1w+lHHiwntXhsJB9K3648m6b21nNbHCEvzA0A18lxy/ouGMBuAbgdkoxGZjQSzLyF+hd1CrFj3pHRzF5YExRFB1P0xgW6qptQzsX/gEB4tf3sURQ9vv3Y+bCeZTAbBJETz8mLMGfKVh3IHGq0AIA/qdcgfWL8Pb2oUCRyDmkoKME5PUMiqPwkW/uDFs0xdm2Feavn7mKU6lBK2kU2ovNSTNB7fJbo/dZzcrXW9WEtLfhwdqlGuUdo2DXbaqH4tu1NVyKg/DfbFkwzKcXEVCSDBKh3DwJ8BJuoVmRsFFEyCb8geAGGgKsSo+RZmFNRGsULBDjOawF0+8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwSb0AQsqbBm3g9wEJyMQTvkXvqq3aGJzRJL7F+bE04=;
 b=MI+vAFbIFmO5WNuXZsaRGVpunwuSUPgIQq0j/ZIJ1oJnxeajnsRe5Q13abM/2fvVdEmrOnlgKVKpEe1i1J9O3YD4ayMmjUSazM7nitBQDYMoirPGYHaUCwAb0FUcvNCNYwWIMeh0dmc1Xxt4NpGOMLpREfvC7LQVLXAYxTGSYKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 21:25:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>,
	Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
Message-ID: <aanmnEiwbmXoEkKr@macbook.local>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
 <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
 <aalD5VRBBuM16pxN@macbook.local>
 <73dd0000-4044-486a-915d-6381d0820cf6@suse.com>
 <aalYScWQQx_vMqII@macbook.local>
 <cf959649-139b-4e9a-84ef-f7548edd7f42@suse.com>
 <aal3dVPUyh2_4g4z@macbook.local>
 <4264cd39-00f3-4114-af90-baa29f9a00b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4264cd39-00f3-4114-af90-baa29f9a00b9@suse.com>
X-ClientProxiedBy: MA2P292CA0020.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::10)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5794cf8f-3437-422a-c7a5-08de7af5486f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	DKYWa59wWJPK6pycVf1rKDA8YqIyjTlY8FKe+PC6LoXKwzgzao6VCWN9Vk4y+8iF1+IkEcwHGfPOL7JO9+ITa3B4G0NYaIvO/WfQAUNyj6SMBnb55CXLOFHWBrQpKUh97c8JD1PTvoKLBHx3LYQIxCZuJSpv4angpV9Ef99NMRzz3aXtv43W+NEciS3bHCE1e3Cz2tfaarnU3HQHhyqlO7AmQYGQUcdgUYJyGr2niFNTAuOZljgJic6309/1hZwtXsg9XHkp9B90Nzg52mI+UGWIDP5NRIUMImXGE76oTvZod5hed1gwwabqTc2iAwwvoB2YqML7SSVu2qxpdWJqQz833CB2L/7se/Q7mU3bgoZzDO6wZc/zjLAB6dpetRgTgXDD/9jOANcxMPYWwc1cXiwNH7ntg26/n+8UqH0E+IYUzaeHWeOdWV3/uh//H/5erf6OBgI9CzMISHi3phH3phGKNTiNMOMWB9pFn6ZiiGnhQ9wKIhuU3ofJhrXSZvAv5jly8gxc7+oRTU4MmIIZ3nazmA8Km2TsLV3N9pgDGM8309dtuS6Q4UqVFGEMI9GhiykayPjAsaPE/oJriQCmeOB/kzxZwLW+mstghnibQjWfGZ/aRPqKbx6VSEeG9Dwaw54xyxNg3oLoxBFBKyLEnYioFll+yLsEuoXR6sobyA6iziqOKPGCylIgr1yBroaNKi57/psKzgLhtMi8uutKqOFDHT5UhJXw3bjL5sTDL/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnhITUFLQWloTFJERUJQL25WQmNQT0dhMXZFWmhQemxKNzlFUEVJdE9PZWlj?=
 =?utf-8?B?U3J1cHlmSUl6L1VldWxnb2ZDZTZxeXVKbXhxcjRQbEJCZFdwZWF6MUdDYnZ5?=
 =?utf-8?B?L0RNYmh6U200Z2ZzWDdhcW9JM3EyUUYvV1lIYU1aNnhLSlZHUVIzQXdTNFpv?=
 =?utf-8?B?elJMWWhwTER2dnRuM3NsdFpOcTJxZnhESkZBeDcrRjNtTjF6b1RQTlNsZnNI?=
 =?utf-8?B?eUJwWklXVVdRSlFDVXVzZmZ6UkFoSlZnUkNnQ1Nua1RBQ0Z3T2RzcnlFTHpN?=
 =?utf-8?B?b2lPWHFJWFQydFdrL3dlUW1hbGg3UllRYVRZWEowOXV4Vlp0SGZPMzZjQVVj?=
 =?utf-8?B?MGt6MlQ0cWJERjE1NFBaUzhneXNaaFJvNThucit4L0pBdG54YzFxeGJzaktK?=
 =?utf-8?B?TXl6R3hqSTNBNzFWY2t0akJmeVY1V3RHa3IyRXZxRzVqVFJUdUJyeDB5UlYw?=
 =?utf-8?B?cjFNdVBOR0tkVVdId3Zuc25rR3BOOSswYlkvdTBkRjMvLzloaU1mNTZGTkRj?=
 =?utf-8?B?a3UrbjNYaDRGNzF2TG9aNjBFK215SWpoZEp4U0YwM2R5ZnpGNFIraStSZUhJ?=
 =?utf-8?B?WmNFQzVCL0NWZncxVGtzRHFJd3h2REVySXhSaUYvOFdDQ1M1WUZZRmJoSWpK?=
 =?utf-8?B?RlFVL0hlQ2pMdCs5MllLbEw2Y3MyQ0w2OHV4aVhmL0FUVWFqZ3hjcnUwQkVn?=
 =?utf-8?B?RHB1R0duYllnTEVla0c1QUM4Z1BjV2p5UnRDeXh2TGZCNzdZdkZXOWhBcFNM?=
 =?utf-8?B?bEc4U0ZRbnQ2dytEV1NZWmU5aTlKeE5XeVlIOVowVlliU0R4Yy9YanZUMkhY?=
 =?utf-8?B?UmVkbkw5STZDMnQvL1hBWlE1THNLTkhNRkNjc25MNWwxQ2RJYTFyOHMxd2Yr?=
 =?utf-8?B?RTRBNFpOZjNmQWVwakh2L1EvRXl3bnFla1J0bXlVVEY0cjV4dXFGb2xmakVX?=
 =?utf-8?B?OWIzN2ZLVnR5SjdNRlNvU2o3WHFxM2toV0pJMEw3TUc1OUxiam13MDh1WXl6?=
 =?utf-8?B?cFNHbC8zS3k1aEZNcnByNXc5QXlLeHhhU0FWNDdFdDROZjFuUHNNN085cnNK?=
 =?utf-8?B?QWN6cmRyaGxnU2ZkeUZHN2Nvd2l5RFAya09HOFBMNHdTcDhHVHY4RENVNWoz?=
 =?utf-8?B?YmJqZHgvNVdVaDFCdjdxMUczQVg2a2lib1NXRDgvZUw1L05vR0pzYzVXT09N?=
 =?utf-8?B?Y05yQ3BRc3hHbENOTDlLbEJlUHIzY1J6b3pXc0kvbDcybTIwWk5LL3VJeVcr?=
 =?utf-8?B?TWNxTVlUS3F3ZWFPcXExdGVvWGVwdURQQXAyVXIxQk9CYWp4d0VpUHF5Qjh4?=
 =?utf-8?B?TEwyVXlocWtaN09iREttdGI5aDFjMGlDZncwandJMEJ5Sk9ldHh6QytpZ0VF?=
 =?utf-8?B?aE5qU0RPWkMvcEoxZG8vUGNpT2k4RU9lWEhjb0QwMkp4UkhYMURQdHpNdkZq?=
 =?utf-8?B?dVhicWRlRWR2SDNQQW1CWTg5QlFmVnVRK3RkcUozUE5ucUZVUnM3cVF3U0hV?=
 =?utf-8?B?YXhWcE8wUjYzMk9icGFmQlAxMHMzY2FxajNkbHlKVk1Wd1pyN3RkUTRGRDMw?=
 =?utf-8?B?a1RCRDk3VnNYeW1kY2tUbE93clNnNkxCWlZ0bm9FeTBESVl3WGEvbllLMDZP?=
 =?utf-8?B?OWE2MG9UUFpSQ3N1U1NzaGp0dDhiM0k1WE9TdElzM01FekQzM1NzVFZOZmZo?=
 =?utf-8?B?aWIyVzFISFc2bXl6bC9QYklnOGxDSEhCdUtFTE1va2hENzVMWGVORFNoajZP?=
 =?utf-8?B?RFVpSnc4VFNPNW1lMzBMYVNuTWI1b3RyQnNEdFZveHQ2MUtZcXZiWE1oOUlw?=
 =?utf-8?B?Nnk5Rjk3MWsvVmJpRzA5c0V6NjRuRlRWRThQdUg5Q0tpWXNVUEMxNStjY3lJ?=
 =?utf-8?B?QktTRSthSkE5UCtMck44QStWWnNtWWh4VzUyRmFra2pWa21qUzBNRHRycHlx?=
 =?utf-8?B?bVZLUGxiaVlBOHg1UzNLQThKVVdCYjFnN3BxZVNMVkxwZ2laNVNjaThkZEdD?=
 =?utf-8?B?UXpqdTJyQmdIb2FKdGJNOTQ2c1NTbnU2ZUs2bVpjbHlmemk1bm00eldLc25C?=
 =?utf-8?B?Qlk2a0ExN3lKS2t3UmtFenpUWUd4U0kwcHFybVhMTTR3eGFyRG9JMHJhMS8w?=
 =?utf-8?B?ZjBNU1RqTEpJWDRSWG1IeXlOekJFSHJ5aytmTDNlaDVJUkNKbVkwMnJKU3RE?=
 =?utf-8?B?S0drdjl6bm1mRmdVNWtoOUhOOWFCblhBTnh1Vld3bVJGQVp2ZmgwK2pnUng5?=
 =?utf-8?B?c2ZhQTNtd1NCYWNCdk5YYVhYRmtWVVpoZElOSm9PQktyc0NiSmNaOFZURnJq?=
 =?utf-8?B?NnIzM1BicUoxeDRXWTkrR3g5b1poU1hjT0w1dUdLMnBucWxTS0dxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5794cf8f-3437-422a-c7a5-08de7af5486f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:25:03.6566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqP5gh6I5jxvVCCudR4+OLPcGzRQJatEf5HtWVsHB7R51rGBRn7s2dNnWBQhQOzHdOWCb26escayWG8KwcGLXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6470
X-Rspamd-Queue-Id: 015A42181FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,m:Alejandro.GarciaVallejo@amd.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:40:23PM +0100, Jan Beulich wrote:
> On 05.03.2026 13:30, Roger Pau Monné wrote:
> > On Thu, Mar 05, 2026 at 12:39:51PM +0100, Jan Beulich wrote:
> >> On 05.03.2026 11:17, Roger Pau Monné wrote:
> >>> On Thu, Mar 05, 2026 at 10:20:02AM +0100, Jan Beulich wrote:
> >>>> On 05.03.2026 09:50, Roger Pau Monné wrote:
> >>>>> Since we have the parsing of the ACPI related data done from dom0 it's
> >>>>> not only Xen that needs to support the feature, but dom0 also needs to
> >>>>> know how to parse it.  Or we just assume the driver in dom0 must
> >>>>> strictly know how to parse data from the features enabled by Xen.
> >>>>>
> >>>>> Maybe Xen supported bits should be & with the dom0 ones?  So dom0
> >>>>> would set what it can parse, and Xen would AND that with what the
> >>>>> cpufreq drivers support?  However that would be an ABI change.
> >>>>
> >>>> What cpufreq drivers are you talking about here?
> >>>
> >>> I was talking about the Xen cpufreq driver, sorry the context was
> >>> confusing.
> >>>
> >>>> When Xen handles P-
> >>>> state transitions, the drivers in Dom0 would preferably not even be
> >>>> loaded. That's what the forward-port did. Upstream they may be loaded,
> >>>> but they then can't actually do anything (and they may exit early).
> >>>
> >>> Well, yes, on FreeBSD I simply overtake the native ACPI Processor
> >>> driver with a Xen specific one that has higher priority.  So the
> >>> native ACPI Processor driver doesn't even attach.  I think Linux is
> >>> slightly different in that it allows the native driver to do the
> >>> fetching of the information, and then the Xen driver only does the
> >>> uploading.
> >>>
> >>>> Coordination is necessary only with the ACPI driver(s), and that's what
> >>>> this function is about.
> >>>
> >>> I think Xen also needs coordination with the driver in dom0 that
> >>> fetches the information from ACPI?
> >>
> >> That's what I meant with "ACPI driver(s)".
> >>
> >>>  It's not only Xen that needs to
> >>> report what the cpufreq driver support, but also dom0 would need to
> >>> expose what it can correctly parse.
> >>
> >> Hmm, yes, strictly speaking we should tie setting of respective bits to
> >> Dom0 having uploaded corresponding data. The order of these operations
> >> may, however, be at best undefined (and possibly be well defined in the
> >> unhelpful - for us - order). I don't think I see anything we can do
> >> about this.
> > 
> > I'm afraid it's the other way around, you need to first call _PDC, and
> > then fetch the data.  As I've learned the hard way while doing the
> > FreeBSD driver: you must call _PDC before attempting to fetch the
> > data, as ACPI will modulate what gets returned/is present on the
> > Processor objects based on what support the OSPM has specified in the
> > _PDC bits.
> 
> In which case at least for Linux we're okay, as what we need it has always
> been capable of parsing.
> 
> > Anyway, not sure there's much we can do now about any of this, it's
> > too late to change the interface, and what we have seems to kind of
> > work on for the purpose.
> 
> Which reads almost(?) like an ack-in-disguise to me ...

Possibly, I'm just a bit hesitant because I'm unsure about what CPPC
requires to be set in the _PDC.  Right now we would allow any
P-related bits set by dom0 to be propagated into _PDC when using CPPC
driver.  With this change we would mask any P-related bits from _PDC
when using CPPC.

I think this is likely fine, but would like to get confirmation from
AMD.  Maybe I'm overthinking it.

Penny, Jason, Alejandro, Stefano: do you know which/if there's any
_PDC/_OSC bits defined on AMD Processor Objects, or is it just
supposed to be always empty?  It would be good to get some
clarification there about which bits if any are supposed to be
meaningful when using CPPC.

Also, on a related tangent, \_SB._OSC seems to also define some
vendor-agnostic bits related to CPPC [0].  Should the CPPC cpufreq
driver force any of those to be set?  "CPPC {2} Support" bits seem
like they should be set when Xen is using the CPPC cpufreq driver?

Thanks, Roger.

[0] https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#osc-operating-system-capabilities

