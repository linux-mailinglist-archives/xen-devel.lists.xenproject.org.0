Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A230ECA71A3
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178609.1502357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSma-00028E-L6; Fri, 05 Dec 2025 10:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178609.1502357; Fri, 05 Dec 2025 10:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSma-00025g-I8; Fri, 05 Dec 2025 10:11:24 +0000
Received: by outflank-mailman (input) for mailman id 1178609;
 Fri, 05 Dec 2025 10:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vRSmZ-00025Y-Ih
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:11:23 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd6239d1-d1c2-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 11:11:18 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SA6PR03MB7615.namprd03.prod.outlook.com (2603:10b6:806:43d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 10:11:14 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 10:11:13 +0000
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
X-Inumbo-ID: bd6239d1-d1c2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgbdRS9ToWCSluHTY7lMM5gbJu0FvwZfkmst/WHCRtObLonwhDblK/wp/L+1bAsw4zqjrSIiiVaWfRd9Zq9hIwaKh2RDnbkOzlsBl3dPr5BYKV5CYlenbC2qPsqo+xXbsJT9AbeAXk4O5104ymdJSu24V6y/csxbIdg+HLrkrLYAAuB6HZdYKXjRqcLD3YBTlW9N9iM5qS23n8cjWyTO9eOG2ygaT1sTG8exKDd+SC9Dgk6L6lrtdCYqwvOEzFctnatKeSMODlywzHaRQ7eSdhwgSZZdYQawKnEf1XaC7lq2nuluYksJExbuaZcwlB+yuAAJSeLyKz6FxObEgPAzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFp2gWvhz88ECDiE3DmTP3jvDKyxuydcZtQ3k3DOMGI=;
 b=rRUwYcdCQaL/lb8HDtoe/oqyqNkzpV1PGCIPaSCTypDn7sD5YugB772hsqSF4fhXc6LjBd2DQrCELA0mur+sK8ZiOVL3WfGJtNBm/sb0xttcuTXF5pbxERfH7zwMYcK+5+F6afQx2YN2eEj4U9pHea00TRPZj4EhDf74FrfVssV0C9wRDcsGg9lJn/IUhoLRCrTFpPsyh0/O30Qv8Xy11nMYTrse7MnCVdwXT2IKg/2ZO5qZ8bBaO+DGeiyfWCfFibSKu9uUmJlVJe+muSG+V2/2oARstqUCPJfcJB23aQLTgEzecoqjwJblVNPx92Vxz3UJVSEMap5IbAj34oksZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFp2gWvhz88ECDiE3DmTP3jvDKyxuydcZtQ3k3DOMGI=;
 b=hu9/Vo02vIkZ2299LfSu6kSmi0Hq0My5U795UqWz/FiGjpM5Pgv9fVmhkYlt7iGB9LDySijmcwFrp+vrtwtNfcRpP3RoDLaG5wPg+3BoGk5yeM56CPrkhNOJ6pQGQYyp6u1utlU6DbEpH48NBGhXAbwmblbVxe1RiYgc2L04yUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 5 Dec 2025 11:11:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: be more strict with XENMAPSPACE_gmfn source
 types
Message-ID: <aTKvvsJLb30C3t7c@Mac.lan>
References: <20251205093151.56207-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205093151.56207-1-roger.pau@citrix.com>
X-ClientProxiedBy: BL1PR13CA0411.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::26) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SA6PR03MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb42f1c-b7b7-442e-4a8b-08de33e69eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGJFNlR0M0h0VFRBSVZIc3FIbzgrOTgwZ0hCZmlBZkNOSGdvWXZSQ1BwdEto?=
 =?utf-8?B?UlNtZnFjRFgvMVlRL1F6VWxyNENRVlloNUNMZFdRNWlGNUMzeXAyZm5xeFFj?=
 =?utf-8?B?SURPOENwZnpQSnFKR0Eydjd1aCsrWTJKSzlud2N5UWlzSTdzcUZCTWNtV1pn?=
 =?utf-8?B?VFppVktsaEczR0tLRlRsd3BBUUZTZTJJWGZUL1k3Q2lQclVSeUZ2TFVaNjY2?=
 =?utf-8?B?NmRTVXhudWU3akZYcXhzb1Z0UjNWangwUVRvUjkxeGV2bTR0Q0tmNTBMVklF?=
 =?utf-8?B?S2RCM08zdFA1NG84ZHRnV2pZV3p0K2lNNlM4dVZ4Znp2S1YxUGs5enRFTEpu?=
 =?utf-8?B?NVlUY0VYQlNSa1JyajFNWTJaWSs2Y2hxaGhhSGxaR25GWnhpUVAxc09jVGd5?=
 =?utf-8?B?WWljMTBvRnNnQ3BmVlU1VitDUGRJOEY3YXB0Sm12UzlEUUViNGUvWVZiUitS?=
 =?utf-8?B?R2E1VFl3SGFmempEVDI1OXNZMnI3MjduUm5Uc015Y0c5NkRVamdOclZPcFZO?=
 =?utf-8?B?MHNBbk0weEFVUlBPbGI3ekJSczBBNlNTcHFRVk5qc3pPMmF5SDdjWCtybndu?=
 =?utf-8?B?NnhEN0RGMmh5SEdTcnczZGZWVVJBMklnMDRaT2J4cWtTT2JZb2VlY0tsM3g4?=
 =?utf-8?B?MW9ZaFNHZ0VzSGdFSFp2VlljM1JhWGRwYVM0SmtKR1dSZTNPY3pFYXhZeWpK?=
 =?utf-8?B?eFdJM1VaZlpVKzIvb1JxU3hBUndIaW1oZHlVbE1NNENhcnBWckkrUXJYWmVk?=
 =?utf-8?B?NnVXb0JTNzhnd2hjMHIrT1BCUC9NWnpDM1EyU3lzTi8xSS9vUldBT0JSaVk0?=
 =?utf-8?B?cllyVXlYTENhV2grZnczbEp2UnpDRkM3UUdYaEtlWUtkaHJHQnNMWVlrL0Zw?=
 =?utf-8?B?NE4yV1hsWEFKMnBsVkxERTNoSUo0QkhidGlRSUZPdGxIU21pd0VZTzFtR0pz?=
 =?utf-8?B?WndHbnlDTkNEQkh4MEgzd1J0aUcvRUwyUkNtbWlwa241T0NKZm5Zb2JpZ3Nq?=
 =?utf-8?B?bVBWS0hLMXVxTC85S1p0STExLy9aK3NTQkdjbFhmbkQ1V0hlZkJXRDQzQlBL?=
 =?utf-8?B?a1doL21hNDhCcHMzSXVZZmNSUjI0eXlLK05LMDFnU0UxRXJadFlmMjBydUJ4?=
 =?utf-8?B?M013Q1ZLOUkxc2xMNVVaTDNSSC9QY3ppUTNzdUV2clhKTnVWendsQlZjMnl1?=
 =?utf-8?B?M1UvV2xpWE5MOVlWSTRvTjg3L21RTHJSK0ovdXViRFV0SGx1UTVVaDNQOXdl?=
 =?utf-8?B?YWNCbDlETmxnZ1g5d0lNMERJdGxVVW1WN2FuamJXSFpqZXBNYzQyMk1aM2NW?=
 =?utf-8?B?M0w0VGtrUkFnUVBsaDFhcHJyb3l1SEplc3diRkNhM0FiUTcxeStqd1ppZDNT?=
 =?utf-8?B?WHJNL29FQzlXNnA4eWUrSmx0anFYYzRYRWhEdGpvUGx2bk00djlFbUFpWFVq?=
 =?utf-8?B?UUZHUWZiR09nVFg3NU1Yd2VSazdrTFZvdFljNlVNcWlSVVdaMndKNXArbEZV?=
 =?utf-8?B?N1JydlFBZENPLzZKY044ek5qVmJlQVVhQUhJNlhFV1BXR3gzbDNuSlhXREh4?=
 =?utf-8?B?ZEZtMEJuWUJ3MnM3N3pBVXRqeXVPRHBtNzE0cks5T2NoZlNxQzdheGVrSTUx?=
 =?utf-8?B?a0hVV01FUysrQ0s5ZmZVaDJ5V3dXWmg0REVVVHU3eXp5NjVGeUlPRFFCRURD?=
 =?utf-8?B?dXY5N3hocVBkK01mY3pxSC9LYmIwWCs0S2E0Z3IzdktWcjg4czFDeGdCTStI?=
 =?utf-8?B?TlB1WldZMHhweVI0NFhBYVZ1YVpHWkRic21aTlJHK1JxUWlyTkZma1hoNkNh?=
 =?utf-8?B?eWJXQy9aa3Q2ZU12TE5XWmo5V3A2K2tJK3o4RHd5OTg2aUdPVzdFNS9FUncv?=
 =?utf-8?B?QllSdmF2eU9wb3NFRFMxZFBFblVwMkJSZ0ltYk5Ha1RxeVlnNnJ4d0hsY2Mr?=
 =?utf-8?Q?AfWM1h7nrPWXM20eTF1kd5VukO5i57Xn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUM5RW5qK2lxZHRrWUx1dEthdkRISEp6ZWNnTlA1ZzREWEFyS2Fadm5wUHJy?=
 =?utf-8?B?N0VBYk1jUVBQYjJNQmlMemp0QWdSTU5HZzl6Vmh3VGhlVXk5L1liYU9EQ2po?=
 =?utf-8?B?TDNMU05LVFFIaVY5aG92TW1KZkdTN0JaNVJtQ3hTbjZSejd0Y0dDb3oyd2dN?=
 =?utf-8?B?SGdPdTl6NjI2SngxUnNlUmRRd3c4WjRMR05FTy93MjBtSG10Z1RxdGNScERO?=
 =?utf-8?B?NmtHU011NG1PdzJ4Wkt3bm4zN2tyYXJiT1o3SDdWRlFZMkR4WlpVNUVpSWs1?=
 =?utf-8?B?VG4xQW53cGRCbW1TTzJoYVhVSllFaVU1ZWhkQ0R1ZDFBOWlIUm5Va0h1Tmx2?=
 =?utf-8?B?ZXc2TGhDZTlkQy80QjFSWVo0NXRHdFUvSjNxOW1Pd0dmQmF2Z1VmZzBjMXUw?=
 =?utf-8?B?Y1ViVEtXbzludVRFSUxZSjRGUnRnSGlyZXNqL05kdEQvR2paVFBmQ2FZR1pG?=
 =?utf-8?B?Zmk3a1dkdXh2dVJoMFd4WEZZMSt6ZW5vY1lCbHJkMzBpSnlCVGxXNFdZK25J?=
 =?utf-8?B?RkgrRXJkLzdUZWU3aVI1cERuakxHUVVRRHFlY0ZHa25HUVF5Q1VJK0pYeDQx?=
 =?utf-8?B?djlFNFRwV1l4VGplMjRXQ1plVXhKbGFwU2krZmJYNjFvR1BVWEpxT28yMXpD?=
 =?utf-8?B?c29CMDZEZXJlZUEyQldoOGI5WVpjZUhzbjRNQ1FWQTY2WHVKSk1YOEI5SWdB?=
 =?utf-8?B?ZE9PRUU4bEc0MWs1eFErUVJROXI0T3FSUndCN1RyVnIxbi9kNDJXQVhieWtl?=
 =?utf-8?B?OFlGNW5xNytwYU1YY2JCU3NoTHpzZ2JOZkFlTTVxaFljZGVtWkpSNmpIN3Bz?=
 =?utf-8?B?SC9UQXVBcXVrV29LTGJBcGxPaWZCREpiVjFOcmlINWorclVZRklpSGV1Njhp?=
 =?utf-8?B?OUhySXJPZmVHN2poK0JKcW5XMHVFY3E2c1dUaTg5dGRRZVRldWU4NjNUUkxR?=
 =?utf-8?B?REJOUlJYQU1veEhnQUFDenJ0R3lWQldCRlJZd01pWGI5UXFQT0czN3R3L0Rj?=
 =?utf-8?B?ZnZ2cTB0VDVjcEhlMkpjYkxaZ24rSGtwbXNLRWYwWkowT1ZkUUFZMlRiYVJU?=
 =?utf-8?B?cEE0ZnE2QWtnZE54cmxNekxIclhzT1MyajJZalJOUVJLUENmTUh6YmZLYm14?=
 =?utf-8?B?RTAvWDVLMTZDU3VZdW9zdlVkZnB0YWdBTXEycXlzTjBJeG4xWHh2eGRKN2lw?=
 =?utf-8?B?bGhEYnRVV0FDSHdsV0hWbmErUzJtZ0hlOHBPamJILzZkc25pY2ZDazNRcVVv?=
 =?utf-8?B?TlZLSHprbm1zUjlsMXNwSmw2M1J3MmFHUTlhN3JMWHhsY1ZFc3g3TUs2Mnpw?=
 =?utf-8?B?K1ZTWnVFMnhNMHdWM2dqWU10dTJ0dVo4b3ZVUEFoUUpGYjlVSlNFcU50Ym1H?=
 =?utf-8?B?aUZnc2hUd0pFczU5aU9PRmFMV3FGUGpjakc5aWFoY2FTT2NkdEJ5L3NSZlFj?=
 =?utf-8?B?ZGtVYTJFYjc3T0NwRStsb3o0SlNjTkNxVURySis4Mk4ya1NabldKQjVDZkd5?=
 =?utf-8?B?Vm5kZWh0QldFZFVjaXh6Vk5rRDcyN3BicnFoVVRQQlVOOVNDeFlvaHdwdERI?=
 =?utf-8?B?Zmw1Si9zQ3Rva1A4cGdKV2Z0NURSNjhBdzBSUDNFcThzbXRYMUJjR0F3R0Zn?=
 =?utf-8?B?YmxSalVQQ0s3OWE1c2RpY3VCT3lNdEZSQkUxVnp2bTg1aTdTMi9JVk90OXdk?=
 =?utf-8?B?MnM5MGhmeWE2dTd3cXBESStGMzdEOGRQY2NucUxIaTA0cGZZTG9JbFl2S3ps?=
 =?utf-8?B?WHZ0VXZuRlJHVUtRTXpXNjhOWkhjWWtYb1M0ZEcvTEtPRzYvSkQ5T1RKeWFH?=
 =?utf-8?B?NVFvNGtOa3NISlNnZjNDME12bTgzNTg3V3B0OFF4K2MrNFBHdWxNRUUrbWtM?=
 =?utf-8?B?d2hLTTJnaWxXQmcyN09xR1RPNGMyQUtJNWpWenRsZVd5NnhRUW5Ta1ZMTllU?=
 =?utf-8?B?c2ZBeFAxcnlUK20zWHZ3ZjlKd09tNklwQ042VytKRTZWMlhpR1ExcThPVklE?=
 =?utf-8?B?NWx5V011K3VoYk5UcDB2b3BUdFNKaXZlNWlVYWFiaHFoZzdYTjB3K3h5NVVh?=
 =?utf-8?B?Wkh4U09Qblc5a2E1NkVNSGI0VENld1ZlM2pRc3RYSTJYNFRWOE5PT3ltV2ov?=
 =?utf-8?Q?tykzRVhb4e7HMUwdw2IvIMj9P?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb42f1c-b7b7-442e-4a8b-08de33e69eb5
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:11:13.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmgSx5p51bPdsOxqeuCUtIaNq8N0mFndB5FWC4dz1qkfUL6cfx0FOIPGjLKsCERjM9EwD9tW8oduB72e4B/NaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7615

On Fri, Dec 05, 2025 at 10:31:51AM +0100, Roger Pau Monne wrote:
> XENMAPSPACE_gmfn{_range} allows moving gfn around the guest p2m: the mfn
> behind the source gfn is zapped from the origin and mapped at the
> requested destination gfn.  The destination p2m entries are always created
> with type p2m_ram_rw.
> 
> With the current checking done in xenmem_add_to_physmap_one() it's possible
> to use XENMAPSPACE_gmfn{_range} to change the type of a p2m entry.  The
> source gfn is only checked to be not shared, and that the underlying page
> is owned by the domain.
> 
> Make the source checks more strict, by checking that the source gfn is of
> type p2m_ram_rw.  That prevents the operation from inadvertently changing
> the type as part of the move.

This is missing:

Fixes: 3e50af3d8776 ('New XENMAPSPACE_gmfn parameter for XENMEM_add_to_physmap.')

The hypercall was missing any p2m type checks since introduction.
It's possible the get_page() seemed enough, but it was dangerous to
not account for new incompatible p2m types being added down the road.

Thanks, Roger.

