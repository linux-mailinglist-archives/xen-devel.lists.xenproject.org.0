Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE29E3E24
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 16:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848635.1263475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIrDX-0005tt-QH; Wed, 04 Dec 2024 15:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848635.1263475; Wed, 04 Dec 2024 15:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIrDX-0005rX-N4; Wed, 04 Dec 2024 15:23:07 +0000
Received: by outflank-mailman (input) for mailman id 848635;
 Wed, 04 Dec 2024 15:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Nih=S5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tIrDW-0005rR-Cr
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 15:23:06 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:240a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7499f94-b253-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 16:23:04 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CYYPR12MB8937.namprd12.prod.outlook.com (2603:10b6:930:cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 15:22:59 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 15:22:59 +0000
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
X-Inumbo-ID: a7499f94-b253-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlQCXePat+yJaJfC6Wbh70X3v5SSdgoG4N61Z9Tf3GmLNOfvAw2BlkPd5TUbE7IYGwhulIY323xO/47hUq3Y75vrBqNnwSQ7HAPjpEjpFH5XFcwmyt5HbMB/elky58HBCqWLWbMlKtv/+OlqMSZ9E6BsS/C7yVVY+ZdSknkmcWBi8wynz5RKP6JzJow7P3kzhKzyp6zuk9BFPxdmfoeEIGZACWmF6aO8pd4WAy6OYqxFHxAkId8+WMVBo8b3eOw7DUPPRv+D64rQpscvK+c87v80gohyxKVapYMyjk/9+SWiINgJDHzgfgOTrgmPOzehB/+Q3BMIo57o/XdzOUvg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDvX3WI++Ebn5mIbPO9jEB/bjvBn2cBlAmji3v+1rzA=;
 b=DDgVD/GEgP8xtTZ/O+DOhTd2ZBZM/eDxWOSvg1ZuhqbyWYC5fwfxycVvvDMzCLaXBWSckWzjfj8Y7FiHPjA8BBk4HnMH47ycbcJWCOqO9n1lUDL+zaHVrNwkJo717NG6xSfs+gwP3WkctDLstx6S3j3KCA1IEztTNl6yTOF0KkyQy6ueDASXR1R6hhIfG/w8HCy0/m4qx9iiWxRb4pr+dZSGjChTvs0EmmaErA8Hp0MvArVaZghkZ38fPzeVU995GTyz0OPPkaLuRw3VMJqc+5vGTq0pzH0o4Co378IbRscfJ1XuIQOhWUX4jM7A1+VfaOkajl+BsWrSEFdcM7FzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDvX3WI++Ebn5mIbPO9jEB/bjvBn2cBlAmji3v+1rzA=;
 b=KwXl1jLjFb/HyAprur8bITVWtBjyIKeG6Qe5CJxrFROf/DVu48ZbfBN6OKzsQ3DbkMGWileI1A3S6ZzjV78jQefuej1FWPzoTnzzcbTrpPP7gD6KGjWMvgaHc+J8lsN83kb54SZvEW/7h08t3NEDShGUoxLHCIaDvZNKGz+4AnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9fa5a82f-d1cf-403b-9488-64494324e438@amd.com>
Date: Wed, 4 Dec 2024 15:22:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Munakata Hisao <hisao.munakata.vt@renesas.com>
References: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
 <4dbf2c4d-f7bd-4032-b52f-29c24e3ec055@xen.org>
 <22282f26-5c66-444b-b63a-d5442e6fcdad@amd.com>
 <04a358de-ed76-46b4-bc09-f3f343e09186@xen.org>
 <1E89C10B-2307-4076-A018-0E1722DD22EC@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1E89C10B-2307-4076-A018-0E1722DD22EC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CYYPR12MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dda5ba0-0141-4847-eb7b-08dd14778920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlMvT3NML01jVGNGYmt5MUNDQlRZd01zL05HSUZ4c0dBa05kSDZjY0c4UDkz?=
 =?utf-8?B?UkRmMmlWR0tHakprWk8ya2hoTnhaTTlnZGxrZmx5WEgzQ2RmUm5mYWF2YkZO?=
 =?utf-8?B?U2tTYk1MU2xJeHFTSTFFVGM4YkZ5Tk5pUjhNS1hEdXVnU3BJN205Mk5XUW1S?=
 =?utf-8?B?L21abEk3WlZCSWNoVUg5STJ4UGFKcVc2Rm1oQU9ZdzUzREtEaklOQjF6Smk2?=
 =?utf-8?B?N2JkRHpleFpVOFZGSWZzOWY0eXRrMXVCTGlaSkh4ZG9PcVJoWHBpcS9HTWNU?=
 =?utf-8?B?WWlTK21YSkVPRU42NXBUTkR6aCttUDM4REZsT2NGZjF3cXZKb3B4QzBJcVY3?=
 =?utf-8?B?TnpFSStrbGRNMTVvbkt5d082VXk2N0l4QVd1RjRpeTdGMlJ4ZXlOZTNscFV4?=
 =?utf-8?B?eXo3dk5yeHo0N2IrdXdkTFBCVDBSeVlReGtXS0VLQmNUTE1ONzdHN28xbjdz?=
 =?utf-8?B?OVd3VFVSM3RUMzd1QkFzSXNaSnVtTUtKZFEvblpiYVhTVmUwWGtydHpYUHVm?=
 =?utf-8?B?ek5NQUxvREpsTHdRcUtzZ3BORW9iSVBvZmZCMnZiUkxtbVBSekRzLzZlbEx1?=
 =?utf-8?B?dWdKU1hRN3NJcUlKVVJVc0c4YVQ0R1pNT2FWNVVXSXpkN05CejBjTTBXcFA1?=
 =?utf-8?B?Uk9TbzVaN1k4YUtoOWtGZU5TK2c0anFjUEhYNjc1am1ocmdiUndIVnhEbTlu?=
 =?utf-8?B?U0RtVTVjZVYrZDMrQ3hvMXZUaUJVa01RRXNsVXllM2pUSHFPQzVZTG9SSVZW?=
 =?utf-8?B?Z0J5Und2eCtQeE43eXAwUXNlcWNxUFdsZmF1WXlDUDUzeFVIWnExZ2RIc0xE?=
 =?utf-8?B?UHV4N29wckY0YXc5UXhySTc5SGhqZWxMTnBQMEJBTlE5ZDhRa3JZZjlkUEI4?=
 =?utf-8?B?WWVjTGxHVWN5TGkzUU10V0ZHKzd0WW9zOUR0VU5EeURBbnZ3a0dtNFJLWk92?=
 =?utf-8?B?MWI3S0t4Ni92SWFaOXBpOGw5ZWNNS1F6VXMrRS91Vy9GWlRNa0lMbGxoblFu?=
 =?utf-8?B?ZFIvSnlYcFdIWkxIRXZlUXZZLzJKaTd0K2xtZDYza0JkQ3hKTzRyWm5SeVhz?=
 =?utf-8?B?OTY1QzZjTzRaS05Henl1c29KU2xGWFRLbk5YZDdoOHZaaXR3VG56RFcvb1Bq?=
 =?utf-8?B?ZUNmcUZJWXFwRXQyZmVLSVVHMDVxdVlGVmJveWtlSW9SNXF1Y3hiUjJOeEtY?=
 =?utf-8?B?Z0V1V2FrVEVHazdhMkswcUNJN1ppNzJpbW1HV0dHK3RXSXlYWVYwMHI2Z0M1?=
 =?utf-8?B?WEdiWHpTazVONmUxZHdkOEJyVFRCeDlycjh1c0RPZlJxRTE1bGRFOTBzVUMv?=
 =?utf-8?B?WEYyR0lCSUc3cTdOV2pxS3Q0TE5FU0E3N2s3WWtLdVkwdlA3TGFSRUZaeGpS?=
 =?utf-8?B?a3MySlcvaHhubTgrT3ovbDJ0ZGU2OUQ2cS9mQXd2WTNSN3F1ODlxQk9LT0J3?=
 =?utf-8?B?OU1ySGRKL3NTNHZMdStiUEcxUWFCUWNpelc1UndlWkpDY242Vi9yb2dITmt6?=
 =?utf-8?B?Tlo5WkFQa21yZEdqSXFVMTQzUThuUGxrMjdvRXk0YWZYTmc1WXhXQUh4WWFs?=
 =?utf-8?B?dWFzMlNKMzE2V2lpbTk1bmEzRmJ4UHIvN0RheG9jSEFva0dzUGhCVUtESHRL?=
 =?utf-8?B?SmJPeW00c1RPbDNwQmsyVWQ0Nm9QTXpGai9lOWNLZkpaM21NbnBMUytFekQy?=
 =?utf-8?B?UzB2WlBzeUhhdWlOUFEySkhra1Q4THpJWno4N0ZNVkhyQnVlSVBic2FRbUZw?=
 =?utf-8?B?b2JtQUZYQ3VMaW15NjltaGJHQzZpNWdMeTFiS2xTbnhFTngzZmdlUlRKZ2My?=
 =?utf-8?B?cjdmcHdlY1loclZpdjRtZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXJmNGd1OVVRQnJDUk1LWDZuQ2tUZHNCRUVhMjNkbXZWaUV1OTNkNDE5cW84?=
 =?utf-8?B?K2dEWDRHa0NIamJtamY1YWF5T2h3akNqcUJ1ZTNIeWpOTHR0MWtiUGI0SEpP?=
 =?utf-8?B?NGN4cnozN2c3dnRNTDZ0UENXVXZSdzFkT0xpQXZ6WVh4V3FybVFubjFGUW1i?=
 =?utf-8?B?dWg1MEhMeGVXRGJtekVqdmc2ZVBhV2J3K2p0SlJjOHpBWHlhcTVqOWx1WEZ2?=
 =?utf-8?B?NW1tdmRPWnJBeUFHMWZLSTFNZ3JUdEtnOEN1d2RtSFBmQWUrbzJzS1VSTWwz?=
 =?utf-8?B?ekFwU3dHa1FpbEF1TGxPRmhsdmVyQThVUkZ1cTIvM1VyL0JnUHRsc2RNMXhn?=
 =?utf-8?B?aEx6QldRQStQcDV0RngzMytIL0dKQW8vZTFHSVVZaVlWMFNpWE5VSFQ5b0dD?=
 =?utf-8?B?VllhdkJ0WGcya2R6Wk9PaDNodTBJNXVEUHBpd1dueS9aS0ZuWW12WlBlNHVZ?=
 =?utf-8?B?cGxJYVJpUzlaY0FLNHc2SEJzZ0cvTmpCUk5QUFpSdlVJU1FLSWh5RE9zMksy?=
 =?utf-8?B?RFJwaTZLZ1V4UWlrUXh1aGI4WTNiS0o5czB5NkJ3bXI3bVk1cW5tRkptK1Zi?=
 =?utf-8?B?QURPSlR3MDVMeXVjTFlCSDdkYndGYllMK0ZMWkFyRnU2SS9JQ0c5VEVBalNl?=
 =?utf-8?B?SzhmMnpaV0lrMmQyZUtLOWpTSS9hS2VpWW05aVNSb04xWnBrRXBJSVVUSGFs?=
 =?utf-8?B?U2ZwZHJJaXo2amxCQ2NyRmM1UzdTZU4weTk5SkgwWk05a3lyTUdTSzRBamZh?=
 =?utf-8?B?RFhvUCtFVW5KdStFSkxTWXNqNklhK0xGb0VRQlRIY043RkZEMmowSysyWlV0?=
 =?utf-8?B?WlZFVzBLVEJFMTJPbk1iZXZDR2FJelhaOUJzYmY2dkxaVUdYSEZaN2dURTJQ?=
 =?utf-8?B?UzlDalJQQTFZQ29qZnN4UnZvdDNCblhBVkxkNUIvckF1NWt0azQ4TVNpR0lK?=
 =?utf-8?B?M1k3dFhZYWVxOTBCSUMrZVJuREdSN3gvT3QzQ040citFYlVmRlc2Wk5oQ2VK?=
 =?utf-8?B?VkF2Tm10WldEdC8wbkhmV1gwbFRJdHFrcUN6dk9XbEpuUllBMkFMVHBsTXg4?=
 =?utf-8?B?eDlTUjlYYURIUktkTUpnbjVnZVoreW1hNDBzWHhuQUpxYWRsL1U5NDF4WnRN?=
 =?utf-8?B?VTd5R1pCSlZsRlFwWXpNb1I2U05wYitmeERIOHhlWUluL0ZvaGxTTEJaUHA3?=
 =?utf-8?B?cmIrVEV3UytwTmFHNkZ4RmVhcmZvVU0zSXYzNm9nbmdsMVo3dlZUelRBeVZT?=
 =?utf-8?B?RSszb25nNXo4K3E4eEdNZnZHNC95ekVZM0dmYUhFTVVyQW96RGd1a3hjT255?=
 =?utf-8?B?MTNvd1A4Q1pOY3dNcWd5REZ3SXh6NG1qRW8vbStDZEFWb3VCMGJCTFJneitK?=
 =?utf-8?B?TitkQlllMnB4UysyRzhiZ0F5b1ZPb1V0cEhyajU5aWw4cmVzbGFqcXZNcVFm?=
 =?utf-8?B?ZWFvVG02VThOQ3pnUkIxUFRXU3RBSzBpUURNMHNxR0M5d2lkdktQWWZVYzlZ?=
 =?utf-8?B?b1I4UFk2NnRmZERhY1czTVVNUFhNc1VNMVBLd0hIZ3N3d21aOW8yR1Z3emIx?=
 =?utf-8?B?QTdDRWVsQXU4aE50U0g3VjlMaG5JWEo1Y0s0VWNNUVU4MXdnOTh2b3ZsaHRQ?=
 =?utf-8?B?SXllT204OFhqdzRHdXZSNFhuaVdScjFDVFhVaHVpeksrWjZCeitmTFpMdkVQ?=
 =?utf-8?B?S1J0TlV2dlVNd0ZzbnpGcjFBdUFTa25hWnFVQW9CRHk4Z1lOaW5FdnZyNUpW?=
 =?utf-8?B?Y2hKTlA0SFJNOTVZR2F2dVdBbjZyMVhxbWFKV3ZGREl0dS8zZ29Db3UwZjk1?=
 =?utf-8?B?TGNQOHQrZ0FCdFk4a2FyZDNFSGt1RGpUUkFuaGJrOTZWS2NOb29FcUpmakV3?=
 =?utf-8?B?a1l0Y0EwNFpOejNHNU0xM3V4MGphUXg2RXZVREhtUWFydVpVY1pqNmd4UDJB?=
 =?utf-8?B?UzNDUHd5NlBmbENqc1BDOFZ6dmxFYXR2T0NuRHdPdm1YZllUbFFPaC9CbGZO?=
 =?utf-8?B?SUdyVWZoWXBtd2JlSXFPOGRlWEMyZE5scy94Z3paMFc4b1dSQjV0WitucWc4?=
 =?utf-8?B?emZZc3U3S2h1TXNOT2o3NjFUQXVKRHJXRTZLQjg2U0FQdVViSHJLYThIRGRI?=
 =?utf-8?Q?ahIn0IbRFvRNCzFmwnQVrIWEx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dda5ba0-0141-4847-eb7b-08dd14778920
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 15:22:59.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4Q9ZpkkMdBM2DfmP8k8FjnqNQnzLnXW3shhhy7i51bJIZtxAWZIGdTCs8NX4ZCULufYxCIHjGaPsBVV/D/Uaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8937


On 19/11/2024 09:04, Bertrand Marquis wrote:
> Hi Ayan and Julien,
Hi,
>
>> On 16 Nov 2024, at 10:57, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Ayan,
>>
>> On 15/11/2024 18:53, Ayan Kumar Halder wrote:
>>>>> +Assign vCPUs from CPU pool
>>>>> +--------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign vCPUs to a domain from a CPU pool.
>>>> Same remark about the wording. You create a domain with N vCPUs and *assign* a CPU pool to a domain.
>>> Ok, so all the previous 3 requirements can be merged into
>>> Xen shall create a domain with N vCPUs and assign a CPU pool to a domain.
>>> Or
>>> Xen shall create a domain with N vCPUs.
>> I think this one is better because it is not mandatory for the user to select a CPU pool and you will have it ...
>>
>>> (which of the two looks better to you if we keep the next requirement ?)
>> ... by the next one.
>>
>>> Comments:
>>> Here N is determined by the device tree configuration provided by the user.
>>>> You also assign pCPU to a CPU pool.
>>>>
>>>> But I am not sure about if this requirement is actually necessary given ...
>>>>
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~static_domains_configuration~1`
>>>>> +
>>>>> +Specify CPU pool scheduler
>>>>> +--------------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign a CPU pool scheduler to a domain.
>>>> ... you have th is one.
>>> So, we can keep it as it is.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~static_domains_configuration~1`
>>>>> +
>>>>> +Assign virtual UART
>>>>> +-------------------
>>>>> +
>>>>> +`XenSwdgn~arm64_assign_virtual_uart~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign a virtual UART to a domain.
>>>> Are we talking about the virtual PL011 or the fake emulation of the real UART we do?
>>> virtual PL011.
>> Is it possible to specify it in the market requirements?
>>
>> [...]
>>
>>>>> +
>>>>> +Static VM definition
>>>>> +--------------------
>>>>> +
>>>>> +`XenMkt~static_vm_definition~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall support specifying resources for a domain.
>>>> Compare to the other requirements, this is quite a vague. Should we list the resources?
>>> The list of resources depends on what the user has provided in the device tree configuration.
>>> But the requirement is correct as it is. Xen allows direct assignment of devices to domains (ie passthrough).
>>> How do you want to write it ?
>> This is probably a better question for Bertrand. I don't know how market requirements are usually described. I was making a comparison with the other where you explicitely listed the expected resources (e.g. CPU, Memory, device).
> I definitely agree with Julien here, this requirement is not clear as "resources" is not specified or defined.
> I would highly suggest to be more specific by listing what we mean by resources and maybe even split this requirement in several to make testing and linking easier.

As per our discussion , the market requirement should be

Xen shall support assigning peripherals to various domains.

Comment: /* we need to define peripheral */

Peripheral implies an iomem (input output memory) and/or interrupts.

(This aligns with our definition of market requirement where we specify 
the capabilities of Xen at a high level.)

And the product requirements should be

1. Xen shall support assigning iomem to a domain.

2. Xen shall support forwarding interrupts to a domain.

(Here, we try to describe the interface between Xen and domain. So, 
domains unterstand how Xen will interact with them.)

The design requirements will be

1. Xen shall create a mapping for iomem in stage 2 page tables.

2. Xen shall route the interrupts to the domains.

3. Xen shall add iommu master (if present) for the iomem, to the 
domain's device tree.

4. Xen shall add the iomem to its iommu master.

5. Xen shall allow assignment of iomem without iommu protection.

The design requirements are still a bit high level ie it does not 
describe the details (at register level or granular level) of how Xen 
creates a mapping (for eg).

The advantage is that the requirements will be linked to the top level 
functions. It will allow the underneath functions to change without 
requiring us to modify the requirements.

Besides, it will help us to provide some justification for the missing 
coverage at the lower level (ie we can say that we don't really care if 
Xen chooses to  perform a manual translation vs hardware translation. )

- Ayan

>
> Cheers
> Bertrand
>
>> Cheers,
>>
>> -- 
>> Julien Grall

