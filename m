Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A7C73815
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 11:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166794.1493229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM27H-0004hC-R9; Thu, 20 Nov 2025 10:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166794.1493229; Thu, 20 Nov 2025 10:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM27H-0004e5-OX; Thu, 20 Nov 2025 10:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1166794;
 Thu, 20 Nov 2025 10:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQ23=54=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vM27G-0004dz-PW
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 10:42:18 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92cddd7f-c5fd-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 11:42:13 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PAWPR03MB9922.eurprd03.prod.outlook.com (2603:10a6:102:358::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:42:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 10:42:09 +0000
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
X-Inumbo-ID: 92cddd7f-c5fd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+sAEh60w3VNgKlZVwv3dLZO6gv5mqsnaTg/2HaK35qzRl3feBzPJAOZGN8cfDuS0twAOCAANsYJM+deCoD85qFGFstfaWKQuQKiNxkUE8ex+vjLugbwTDeD8MkeQozhzfz4egbkoSXAMhu5/oyEEdUbgo9P9/y1kTed8QosMysCA9kXQj4H+Tk85Vy0d5BoOyv8hRTmtoYArWTpUc1qBZY3dB3WwbqOJx8/bd603brfg9IxfQxVWYm98FWRoqVrPbbSeEJZWRy3QwoezaX20fa9gcry98u7ripIVqipNlue51ubWBHNE5npFADTri6elm5ClmzT9gZ7D0xKWB2J0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inbO6NBfMbBH+ZAwmnx+90g/Pwa6NY7Yn+qjllpju+Y=;
 b=Y+i5S7lkfPmN+cUebtzKzqBTFpCHqki4Xx1sAQ2yYyy6acqA6eX5LQ8/qDWunTCG4Gr34boh/XPg3NIcgSHX6O5sa/Qc/jEsyiQEwF1ez5Vqrul2Qp8kN7sNdgDgAObDyvcjUJ/yUqwccc4VNxufHvCJJ23yxFfusczYVCjOrZe2N1/4tdN2mvgdo5llJ4vn67C79Uj9++N8bNIJSXTddDvtesdzXXwM0rUP6/p10zWQSijacWnCVtcIy7s4nvpDHPYc/HV8C77M7Jx9UNpqH9LLo6RV3a0EyBn4OtJP8EVN9DON7nZp7ooCtxNOHJtgPIBRkpGq0fi2Ey6tnOsAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inbO6NBfMbBH+ZAwmnx+90g/Pwa6NY7Yn+qjllpju+Y=;
 b=Ohc9vS8ISmbrsn6mdngg+ooszte2cFws1vajpXkck3aQtA5QIgbTElqjgsBkmxviWd2C0i/+IWVEUbdGsBKboxm4Waiw4IKYn5MVQctq42gnaVOLph7GsK3uZKMvOb8mMCS5S+s9uNeSgG7FR6J3I0HwYQ1HRdEh+C74fP1245ixQvhiHZJY81I9BVyq8zuRM71eEvoiL3EUD8/6N5L4YkEdBgaGMKM42/UX3CP7CKb+mKceXf3ATm3i7hEkUQdiAuYmAK2euwBQLbemahdUEiz3K0UhDnnA2q7kkQgRvF+5P53BZRMwsGO2fr+OeIconuP+55AmzuZEwxqX8mTKCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e79baedf-c619-461a-81e2-eb7eeafa648d@epam.com>
Date: Thu, 20 Nov 2025 12:42:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v8] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193215.1012108-1-grygorii_strashko@epam.com>
 <dc779808-a46d-4b71-8cde-6239b4a68819@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <dc779808-a46d-4b71-8cde-6239b4a68819@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PAWPR03MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: e91c6ebe-cd5d-483c-0e34-08de2821740f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkZWUEtPbzhtVXdCdXcrVUdVU1B0cW9HcWN4a0dMdVlmVXg3TVp4YXVZbFY5?=
 =?utf-8?B?K2dtY2lTdnMyVlFZWFBkNWw3dlpmVkZpeVN3Ky9LSkNVKzZOWU9FZlBzMUUy?=
 =?utf-8?B?VGJBZDJvdEZ4RENwdW9vR2dBR3RCWEx1dVZVbnhLTjkxUjFaWXN0dXlHYmh1?=
 =?utf-8?B?L1hZZWY4SHo3ZTBoY21VSDFXU0FGQmtUMGpVQUdvZDE4Z0d0VDBQVStZNDNZ?=
 =?utf-8?B?Mnp3ZkQ1MDNaRVJTTFRqbnpablE2KzB5NENpV252eWpTRGJDZEVMWHBnYkpy?=
 =?utf-8?B?blJFMVQ2T2ZJdWlFRHN2ZEdFUTJQM2dMaGFZc0ZDcVNPUEhVL3E0NGdCMDhT?=
 =?utf-8?B?R1NOT0cxTGFwVGpNaVE4a080TWJxekZpcGN6OFBZLzlVOXR0VHlkMVFXNktz?=
 =?utf-8?B?dHpJNFBqL0lJQlBaMUl2dEVXalgwb0pWYUJsL0t6OHNwTUlKN0dPdGFCQlcy?=
 =?utf-8?B?YXFNRTBHQ3YzaTRZbndBT1VEbGF4S1VnSWx1dWd5YTNkTWs1WnkxOEkxV2dY?=
 =?utf-8?B?aExUbGVya1d1ZTJWeE1uYWE1cFluMEcvazZiVVFtaWxBT09nUnY0NU1nNW9x?=
 =?utf-8?B?TnFybmg5Y0IvbXFsQUMvb0ZrUW1JWnQ1ZlpHNlgvMTVLZk9DTmdVaXIvRFFY?=
 =?utf-8?B?Y1JudlVTbTkxSE9wa2JVcEZGaitvYWl6NVVKSk9sbVRZTnhQQVBBUUJBVXlC?=
 =?utf-8?B?bitvaENnRmlqbGdJL2xWcHVzL296eFhMZm9KMm1PRkgwandrbmZoZ1NoUEdI?=
 =?utf-8?B?K3FrMFdKYzNPakgxQTM5TXg4TXFtb01kMlJoQ0VJL0oydi9IYS95amMyZGdw?=
 =?utf-8?B?TjU2b1dtbmREZ21tYnZJdjYvVFFnMUJ6VHRjaE85d3BROEhJTjJ4bklPWHJJ?=
 =?utf-8?B?UmxHTW1VUm5BczZwVUNYN3JLVklmQUpsMTBGdGM4b1hGazdDMjVYelozSldG?=
 =?utf-8?B?eFc1N0ZMblcyWXZPenFqdnd6TnF0bEdMbEk1Ykh5bnN5eFFwNy9RdmpJSTN6?=
 =?utf-8?B?K28vU0V4SStSekpRR0RUVHR3cmFZQnpYYnl2dFZYZFFPd2Fpb0YxWGJjcjYv?=
 =?utf-8?B?Wml4ajlhd2R0VUw2a1FrY2ppL3d1RjRRcFJtTDdCYXNoQ00vV3BLQjhyUWVS?=
 =?utf-8?B?a1AyWXFNOTl6YWkzdnRMN1dzT0NtNzBnVDc2TGdFVnoyM01VN0d1QVB2aXYr?=
 =?utf-8?B?L2NwV01ycXA2QVI5YVVSaFF3SEdFTGVwZGxBZWIwWU1ERlVQWThmYytGRmtP?=
 =?utf-8?B?eUZ0WnBJRkQxZWUwZFpYMEk0dzNid09JMjV4bmI5Wm5UdUt1UWtTRXMwbUg2?=
 =?utf-8?B?S09RMnV2dytiSEphUGl1SDRxak5wKzZMeW1TRWtaQ1RaemtPeDBZVTFGUWNo?=
 =?utf-8?B?bXRac2pyTUJ0WXNvR0xiWUtWY1JtSVU2VlVnYk5IMy9CeUlXUHZxSEZsNW9o?=
 =?utf-8?B?bGJSYW1tUnM4dHQ2U05WTUtDVUpLTk43dDNmaVRyVE83Qi8vYjdCOVBlNFBh?=
 =?utf-8?B?eGJiWnRVUUU2Tk1XMHBTZVNWdDJnc3hpVEJpUW8yLzdDb0pVQzh1VVhPanJs?=
 =?utf-8?B?Vkx1NlQrSlBucjVzSVlOR3c2VWNCa3ZKTzhBSnlldDZDSFlWU2ZXVlQyVytm?=
 =?utf-8?B?VzJzSWNaM2xkOE1wK0doblJseUtLekgwTzJ3U3k4RDI2ZGI4TEtmVTZFNW1F?=
 =?utf-8?B?L0lGOXpqZWx5RHl5UWgxOERlZkFzOVNFR1U3T2IyeldsNFdyZmRDS01ORElQ?=
 =?utf-8?B?ZjBRaVkvZnJZZ2Jma2VZWit3RU1zL2w5UThLNVlGUDF6NVJTRFFqZjgzNEFM?=
 =?utf-8?B?M1p4MG1LaVZxRjNTWThVcFJpcURtQjlDUlVHMW1qVDFVbEVhM05ZQXlPeUsx?=
 =?utf-8?B?aUVjWFVSYi9Wb0JWU1dMcG5lY0gvb0ZUVVpldU1KWWVSdzc2cEFxbGxYNzVa?=
 =?utf-8?Q?wwUMtozC07ZJBLpFlCw8ABtvyPbp4ypF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T29hSDVvdFFyQWIzMEkvOG52dUR5RDhuenBldDdlYzVRRHdKMkh1SGlzWWhQ?=
 =?utf-8?B?dVlrTmNMQlBMa0xwVjBCamNMU1k5WnJ0aUo3STVYQXptNDJyaDhLMElaOEJu?=
 =?utf-8?B?RkJmZmtHMHBJYW5JOHdzYmVTSXh1dExxZk1YdGIzdUZ3VStNdXdJUlNINkVh?=
 =?utf-8?B?cWVPdHU4RFpqU1NMdjNKTmpYZm9uOTQzaHlTU3oxcGdkYzBRazlmNUkrcFhx?=
 =?utf-8?B?UGlNUGVWNnR1djl2Yk5MNVBzNWw5MWo5bmpuRWpXdDRDMGtueVgvSUc3SEkr?=
 =?utf-8?B?N1crbDd3SWpmaDRXbGlFdlRyYXJNcEV3YmgyUHI3U3U0ekI2WFRJcDJlRlYw?=
 =?utf-8?B?RExVTWRtb0h6ZWNvZTlyMzhvSk9HUVo1Rkdqa3NHd1U4QjR2dFlRQXZLblda?=
 =?utf-8?B?cXI0dFZPMFlOUHBmZXMvbFlBTHQ2anZ4N0xibjJnMTV5YXBxYTFJSUNpS00r?=
 =?utf-8?B?eitITlUvb2ZSaU1vYnJkRmJhYjVhUDVaMFhpdUN2bTRhbC9VYTRMdUQrUk05?=
 =?utf-8?B?bHhoQnQ0bU5DYjIrRzdNc2lBMXZvQk1FR0haUzV2dW5Sc2tNWElwYTZhV3Q0?=
 =?utf-8?B?NGRxNE5VS2Jic3dYWUczVHRMSzRtMmllSzk2NlhxWTZwVkVkMUtSWUVCR1Ew?=
 =?utf-8?B?RWs5OVNZYndkSDRiS2hzaG9XdW05bVlCMnhaMWF4eTI2VlNac3B2N2JxYTlx?=
 =?utf-8?B?ZXZvSW9xT0VYd2VUMTdEWEMzRktJc2JpMUNOaDRiREJuQkZpdk1Ya2QzRUJw?=
 =?utf-8?B?Y01ZbEJqSlVDc3Y5R1p3ZE1VdUdMSU1rVGZGZ2l4RjE0c0MvNE0xOTc2a0ZX?=
 =?utf-8?B?SVJJc0NKK1plb0RCSkkxSkFYd0ZhcG5qandTRXJELzcrTEo1dExEU2pSRWJ4?=
 =?utf-8?B?TllBb2pQeUgwYlMvSTNmS3FGVXl4bXBKQWlNYXFINWRrTG5TMzdCb2tuRkpI?=
 =?utf-8?B?bDM4MzJCRjdyeGVFNWhtRGRoYWVEZmVWWnI1aU1aM3ZwcTV3MTViZWZMODhQ?=
 =?utf-8?B?RTZDTjhLMkU5UlR6MUlpZHk0dWlLT1l1TE5vRUJYdEoyU3U3N2RuVTRZQnFF?=
 =?utf-8?B?RktkbE92Ukx4Z05pSDE0T2NCZ24wbDRJTDZOd0JnRXMzY2RBTVZoZGZGbzhZ?=
 =?utf-8?B?L29MNk51UktMd0k0WTJPM0EzRkpGMHFFRkg3NE5ST0R6M0xtQUdXWkw3TG5q?=
 =?utf-8?B?WXYwVkNlTll4dDRvQ0VreWgvVkxsamF5aGN5c0VOWGt4bmd3Mm5UbXlVa2pk?=
 =?utf-8?B?aDAxVGlQZUhRQXI2U1A1MmczQ3BXS2pzR1V3aTNtSFpWK3ZOQnZjQWFja3h1?=
 =?utf-8?B?b01pRkJqQ0JoS2FBbzdBMjBFUENFTkJXc0ZERzZTT3cxbUE2UjkxRXdjcUVH?=
 =?utf-8?B?WXY1UFBJbURJd29VWlVkN2oxemlCbnFob0xVSTN1bk5KQ2UwQnVWNEdnOFZ0?=
 =?utf-8?B?b2RnUlBTaDdEcVpoRUZIbUYyRXVjT01sdWowcXQ5RnZPZitwNE1YVi9PN3pG?=
 =?utf-8?B?dFJta2pudjhtRmVSQWlKWVJxQSt5RVV0aUFLeHIvaVdlY282M3dMcDBHekVZ?=
 =?utf-8?B?eDRxdU1xdnJacW1JaHJCcEZBcnZQSTM3NzFuZ3BXMHZvTG9SdC95aVFJdWww?=
 =?utf-8?B?RE9OOWg4TGhwK1R1RW9jeVdON2pNTXVvdWtMUzFyTnRJWTF4d3NWZFF3WklO?=
 =?utf-8?B?MkE1OXE3eGk3MGJ4WE03ZWszV0JkUGtpTVViZ3l5U0Ywa1BVbCtaL29uOTBC?=
 =?utf-8?B?RWJoLzhPakdTVGxsRkNQa1E0Mit2ZGUxc2tuU1owUlV2bC9OZFowRTNWSVBH?=
 =?utf-8?B?djZZd0taTFVOK1BCb240NTlRZjAvSk41eUJGaHBoM0RCZ3VOTHpaamZnNlJy?=
 =?utf-8?B?UHBCRXlKSU9id3J2Mk1xNG13ay9CMklNWGVQemN3TkRISVlKSy9QVHlUSS91?=
 =?utf-8?B?UjE3Slp4V29ZQVVodVE3MnhNNzRqY25PNzJIMzQ5M21vK2owNE9rc09XMWcy?=
 =?utf-8?B?QTF5alhEQWcyOERST2UrcTRGNC9rR1BRcVZGcFZCeUtRTHdBMG9UVmt4c1Rh?=
 =?utf-8?B?TmZycjhaK1NlbGQyL0V0dXhhWm5KSk5GRWNKc2xveDVJcDlYbTljYjU4NEpJ?=
 =?utf-8?B?WjlMdm84WVVQYTVwRmlnK2ZHeHVYS0hlN2hDZi9tUGVVVHRVQ1p0SmxlcEFO?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91c6ebe-cd5d-483c-0e34-08de2821740f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:42:09.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lqKXarIWHvwWCEJdgmmpJv2s8nPmhE7vvSftthKkDm2a5y3p/aZqBLX9KtWRzoGCkPg+3O4MmbAxvmmsSEyyxyDUCwzG9yAXoykka8A96I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9922

Hi Jan,

On 20.11.25 10:50, Jan Beulich wrote:
> (adding v8 tag to subject)
> 
> On 19.11.2025 20:32, Grygorii Strashko wrote:
>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Add config option VIRIDIAN that covers viridian code within HVM.
>> Calls to viridian functions guarded by is_viridian_domain() and related macros.
>> Having this option may be beneficial by reducing code footprint for systems
>> that are not using Hyper-V.
>>
>> [grygorii_strashko@epam.com: fixed NULL pointer deref in
>> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> As before - this R-b likely would need dropping, ...
> 
>> ---
>> changes in v8:
>> - drop checks from viridian_load_vcpu/domain_ctxt()
>> - drop check "value != 0" in HVM_PARAM_VIRIDIAN handler, laways return
>>    -ENODEV for VIRIDIAN=n
> 
> ... when more than just cosmetic changes are made. Jason, please can you
> indicate whether it's fine to retain?

Sorry, I'll be more careful with tags.

> 
>> --- a/xen/arch/x86/hvm/Makefile
>> +++ b/xen/arch/x86/hvm/Makefile
>> @@ -1,6 +1,6 @@
>>   obj-$(CONFIG_AMD_SVM) += svm/
>>   obj-$(CONFIG_INTEL_VMX) += vmx/
>> -obj-y += viridian/
>> +obj-$(CONFIG_VIRIDIAN) += viridian/
> 
> When committing, I'll likely take the liberty to also move the altered line
> up, to restore proper alphabetical sorting here.
> 
>> --- a/xen/arch/x86/include/asm/hvm/viridian.h
>> +++ b/xen/arch/x86/include/asm/hvm/viridian.h
>> @@ -86,11 +86,26 @@ viridian_hypercall(struct cpu_user_regs *regs);
>>   void viridian_time_domain_freeze(const struct domain *d);
>>   void viridian_time_domain_thaw(const struct domain *d);
>>   
>> +#if defined(CONFIG_VIRIDIAN)
> 
> Similarly I'm likely going to take the liberty and change this to #ifdef,
> just like you have it elsewhere.

I'm ok with mentioned adjustments.

> 
> Preferably with the adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you.

-- 
Best regards,
-grygorii


