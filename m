Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F5CB0ADA
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182004.1504958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1FI-000485-P1; Tue, 09 Dec 2025 17:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182004.1504958; Tue, 09 Dec 2025 17:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1FI-00046A-LF; Tue, 09 Dec 2025 17:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1182004;
 Tue, 09 Dec 2025 17:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vT1FG-000458-Sy
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:11:27 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 171f3c1b-d522-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 18:11:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7706.namprd03.prod.outlook.com (2603:10b6:408:289::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 17:11:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 17:11:20 +0000
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
X-Inumbo-ID: 171f3c1b-d522-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2Ah5Xl9HNxXhMYAvsRKehfEtfErYe2hIh0LO9kQiWFb93oP6zIGgjwBXFwov6x5Pm/TtN9N9QaIEuAAdoOtqqDhzrklJF6Yt4nE9iKEKsUKF4uyTeGZz62+VXtKVvVoU4W5PWCrIv6Le6BktonLFBPl+HRc2w1SAhFwD+GB14hqSu2XvsHp9v1PJVWLpN67u7DJNgoS5GV+MT8JO0nDQEcL0bICq7GTnAFLTlHIILXFUUku8VTSNYPlvsqIhCiV9o/5zX7GKs+m9p59+wbsJAaDlA66z7Td89TT6MPutbXYn7LQ/GUSWVbwMttsDjKILPsmWcw+0oPf3zVN+mT3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6QRlRnOOWb0fT8WCiHNQNF5kN9b080mQBdOP1l46TQ=;
 b=ygK/MO0rFY54QpwcAQ+qc4ZOscgnqUiBiUzvLXlOrVgHfg9jvlxiybFJi1pVEcoHcPk4Ltr8BXM1+QYrDppyd+LTXZMxCiWt7f8j+LX4tWfXktDxnXRfcbcRb5wyncTN5b3wJDXREfvRDg3fcZodjJXOhy+SggBfoviK/MJb/Zpz9/s2+HhWAEhHw+WdXqcW6hVmyvYhnrWsXb7Sl3kYoVuaiAloBXerXJJ4nz7GTZxZSyqs+HIpzx73SInIGILcSVZKfkXPgfpmcdnZ4v6KpaUsbfsT2VsWIybE0RRoIB26LqMKJ8GZgu6KaGWetzIwwtxS/15c7f5XjTrCi7/o0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6QRlRnOOWb0fT8WCiHNQNF5kN9b080mQBdOP1l46TQ=;
 b=tcj7OQyis0EMFmmNPi2FtNI5X2sSkqoGIqyeywtrPuQUU4LlC0pnNw/KpEvuGX58cCM+5MUvFCl2uZE2XqzA5U1m/2tqCoMMnWQLlPlEXk7VuQjsgGcTyr0yGN3k3rw4uGNllUgDGNPFEBxX5M76HFnNLKhDSLK1BLv3jsTrvdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a9292dc-0903-43db-9646-437c6c2ed9eb@citrix.com>
Date: Tue, 9 Dec 2025 17:11:16 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
To: Jan Beulich <jbeulich@suse.com>
References: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
 <79fd0f6a-8fbb-433e-9c74-3da339301b96@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <79fd0f6a-8fbb-433e-9c74-3da339301b96@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cb020c-1222-471f-6881-08de3745f8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzlSMEEwbEhaWkhQRUk5VnlqVjQ4clIvR0pmY25LVU4rMlNuazlvWEhma2VZ?=
 =?utf-8?B?QjJWZU5DZmRRSG5lV3dXblp1RUl6TVFrcjFkWXYvUFZFWGdlRldnMnBnRlFU?=
 =?utf-8?B?Y0ZTSTBUVis2RzdlTEJtOStMNW9RdmFJaGJwNytGYUF4NGI2Wm4yYmNuZFIw?=
 =?utf-8?B?T0t6MjJ0bkVKQnUwU0FNNGVXV2tiL0N1bDRISWYzVjdCR0lIN2JVdnJ1MWdD?=
 =?utf-8?B?RitvVmREMVNuOGtsRnJjdkc3SkRzbVVhYm5pM3FuSXI1Y0FNVzN2VnQ2aUxR?=
 =?utf-8?B?cm1sMk14RnpNZnNWTkZ2c1ZlenM1VnNSSHF1OGJQbDJWeU91R21DNEpkdjhk?=
 =?utf-8?B?OURSREtBa3ZlQTdtS3JvcHJoSmNmV05WbWhCWjVqcW1tWlYreVplQ0Q5SWZa?=
 =?utf-8?B?MDdRQnFqYlVnQndEeDRDeXMxdjkvY0pmRWlNQi9ZSjJrbWJJY3o2NkRxU013?=
 =?utf-8?B?azVTWFZSS1Q3aXR2R2FUMU4vTnBxc1FSQnVJVHFtaVBNdjF3SDlNcHpUeGdW?=
 =?utf-8?B?RitYSE1UTXQzUHhnd29hV0pSMXUrRG81Y3NqSGJZS0RqdGUrWFBsdGQ2S2tm?=
 =?utf-8?B?YVVsM2poaXpwdHNTTVhjK0J4NThIelVHbms4UXFlNFkyOC9BNlg2ZlI1eUlY?=
 =?utf-8?B?VVVZM3cyU2U2eVRwMEpWRlJtOG5oYUxKaHBaNFRhNHhaOUVhSEhBeG1ES2dk?=
 =?utf-8?B?ZFlBaUh6bktjendGZWh1aTdTZWMzVXVWb1NkVFpEaEhGVDYyVW9NNG5NK0xL?=
 =?utf-8?B?T0NUTjVWcnVPbFdza0FvSlBub1lDdnFMVzBaS0F5aytlRklkVUtrSmI1TVJ1?=
 =?utf-8?B?bXhpRldGMmNJekhhUmk0ZUxLZkNPVGgwWHFBbXBTZDRmOVhHenlaR0lodXFa?=
 =?utf-8?B?bjBIK0ZrQXNnQU4zRHgwZkdiM2NlNmZ4KzBXdEd1L3puNmpmY21yVGlodFpl?=
 =?utf-8?B?V2QvNmNjRkpudGRMWHJ2RmplUkZwcVNRSmdxRGowTWhOSGQ2dVRSaVhuOVBr?=
 =?utf-8?B?OVY2eEFwZ09vekJRYi8zdHhYZm9jZDlZU1piaCtHU09VN3hNSlVMaURwSHJH?=
 =?utf-8?B?enQzZ2ZoV285OTR4TlpQRzMvWGNKanpPRVVxYWNmaEtvc3ZpVmlVWHhNTDQy?=
 =?utf-8?B?SWRFZURiS0Q2Q254SmI3bWNsZGloMmU2ZC9JZURUdUhydkE3U0tEREV0M0RB?=
 =?utf-8?B?ZFQ1Tms5NUFmTXh0VjdFVFVlMUI3MDdubGFIK2xWZU5UaGdTc2ZreGxEZXVW?=
 =?utf-8?B?UmQwcFROUG9rMnkwTEVReEM0bG9YSzVmay9MVkkvNGJBVkZLYytwR1RVNEFN?=
 =?utf-8?B?ckRNUUllQkZqcU1va1FkVXZua3EwNW9yNndGMW00d3ozMCtnL2FVbEE3cTA4?=
 =?utf-8?B?dUNaOUtKWnA3SFUvK1N0empJaUpJcjFpV3R1aUliOHlxSHV4eTYyaFh6MDZi?=
 =?utf-8?B?bkNhTHBaMFlmU2dHRmljSjlPRGNNZEJzZE9IZDdYRmNXdk13TERmdTB0OXI3?=
 =?utf-8?B?Q1M4dit6NTFzVWpHcTc1OE4rbFJwM1VpN2d1YUVwL0JmRUl3cHdCWHlhK0du?=
 =?utf-8?B?c29TYW4ranNFZ3FodnRhUjgzL01LUExyT2RDTG9NY2VoaFFyQnQ0RDRwdjl1?=
 =?utf-8?B?WkU0R1hRdDVwZzE1bFlmVnRmUXlwYW5aamNBZjhNQ2dKdFB4aGFrVFl5RitE?=
 =?utf-8?B?V0VKTGtieVNZQXJWS3RsV3F6UG1OajBVZGZINUVIMi94QzM4V1YremF2am9I?=
 =?utf-8?B?Ri9yTTJGMVh5MmhMajZJaWZGa3VYYWZUU290NkljS21rUlA1dnlwQktLTCtZ?=
 =?utf-8?B?R1JhWXN1a3lJMTRtdHFtaTNOS1pZd3N4TjQzZUkwMm4wZ2dBYkh6UWt6dE93?=
 =?utf-8?B?RWxYVjBLbkVBc2xaOEY1SmlLdXZVbThnY1ZidkZCNUR1YlUwc2NBOUZiclJ0?=
 =?utf-8?Q?US4VB/N/k4KKZbEZUZm9rQ6ukPd1Bumj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFJvMnBpZFRMdGdMcFVYckhXendQYmh3SUxkMEpCSXJyR1dWY2MxUUY2S05U?=
 =?utf-8?B?WHprRjFvUmVQOUt1UXFxYWlsQzFtRE5FWVZjVXZCUWFVd2FLcloxRWxkUG9T?=
 =?utf-8?B?MVhCL0IreXI5dXhScEh0citaendWaGtpOVBDaVhvSFRXSkg2WitkazR2eFNC?=
 =?utf-8?B?TzVZNWJzbDU4N0lsSDlkTXJIWHg0TVdkR2FSQnEzeHQxY2R4WnQxVFdlajMr?=
 =?utf-8?B?bFZtMzE5V0dERHdzdUdzWklQUTBYbmdQVHd2S3RCdDZ0SjFBM28rRVdrSUlw?=
 =?utf-8?B?Q2VzSFVHVkQzUERaVzMwVndLcHRRZExDVkhLL1k2MG5DUlpPajR2N1djWWlI?=
 =?utf-8?B?WXl3ZWREdzhtL1hQZFMwWG9Jdk5TZHN0V3ZkNTVkcFRBSmJackJPMEJCRkk5?=
 =?utf-8?B?eEZRTW1KQTdEbTRvTW5pWmhDaEVwMnp3ZmkwWENEOGRLMmwxN0V3RnFycE5X?=
 =?utf-8?B?QkU1T2YrOFNIc1pvaURuOUlSK2lYRHNxc2dWZVJ1QUk1SCtyeDVzNWZKRmNM?=
 =?utf-8?B?OGVWZ3hoN1BXZGNweTA5dDRRci94S3gvODIvVjdEWC96L2djOFJueUVRaUl0?=
 =?utf-8?B?YnNTMDlHZktGRmpUTmRIR0tyM0RMVW12WG1oU29iQXVPRk05WkpvR2FleDM5?=
 =?utf-8?B?STJGTWx5bllrVVF2VFJSdFU3SHZCTk5zSmhLNmxabHB6dm5XVllkUTVZVERB?=
 =?utf-8?B?anM5a2YwdCtMS3NDa1UwQ3YwQkZBb3dCZVNKR3FVYzZnd0lPK0ZwUTBkWjJQ?=
 =?utf-8?B?b3RqOG5HRW1RYk13bEt2NEJ0N0JGNkFldlVjRlZHSEtXZno3VG1NU0t0eFB3?=
 =?utf-8?B?UXBwNEVLeDY2S1pXcnFWZW5kTURsb01vVHltbUw1cnZRem5SNk5HYVVSc1hN?=
 =?utf-8?B?dFVHcXZNUUF3QjZ0WGorTldaUjlQcGgxV3dsYTZZV2xtSFhQeTlvL2xDRjB5?=
 =?utf-8?B?WlRtaWdXV2RackR4WFhyeUl4eVlkYUpmM0dyWENmRHE4QktTMFliQVpwMjkz?=
 =?utf-8?B?bVVvUWNGcWNrNkJ5SEZQMFhJYk9TQVNUQ3lEMmoybXlLUk9yTU92Ym40MGtp?=
 =?utf-8?B?OHVhY1FXNTdRNng4ZDd0VEZvWXFoQzJZWXNtNkExQ2ZrUG1aVGdhejNnVGRm?=
 =?utf-8?B?Yngrb2cyMG9DbmJPemZHRHI1SEZlSndxZEJVd05NeXc5ODN3QUE4ZXNUZERZ?=
 =?utf-8?B?OG9OU3BpelFyNmR5M09UVFVlNXhoR0pEM0ZKY3RnQnZlNDVpK3U2Qkk3VDkx?=
 =?utf-8?B?MGVGdG8xTVNhTGc4K1BXcm1pMU9OSkdzc2pFUVVuRm1hcGt1WTQvNGRBRlU2?=
 =?utf-8?B?RkI1eG1VTGxEVmNqV2JUMjZWalV2enBiSUFPL0N4a0w2a01oSG41MkdyTlVQ?=
 =?utf-8?B?Q0FXQkRHZ0V5SW4wSFpvclFpam5mbDBXck1BNTNwQkZwNE1VRzlDcW9SeHN5?=
 =?utf-8?B?VW9vU0o2NXRhdHdLcXpGQSsvQWVORmJnd2ZZY3pWSjFHdDcvMnJZVjVTZFRZ?=
 =?utf-8?B?eUl1QjgxMklKbWllU2ptcnhTZjhvYkhjellmU1hUVTJCbFdZQWZJMUU5RVc2?=
 =?utf-8?B?T045REMxZlRBVkFwUGZNTFQ0TFZUUlNCUWFPamhGS2o2L3pMdWJtUVFISVNR?=
 =?utf-8?B?enFwblJXTFRrQllKSUUxcEpxZ3oyY1A1ZTlGOS9pcHpNNVk2TXc0bDRvLzdT?=
 =?utf-8?B?SkFqVEo5VExGOG0xTWJneWNEL3lxZFJjZEVIemFsZjJzV1NqTXFzeXR1clBo?=
 =?utf-8?B?TlJQYkM0OER5cHZPUk9UcTdZVnlCbzU2ZnhCektvVjdlQzhNajNWbXVwVjR3?=
 =?utf-8?B?ZEQxZVFwNlU5c0lNQXRzUmdXNW5qdVVZZDlLV0RrYmMzOUVSdFd1alUwQnFx?=
 =?utf-8?B?OGlxL0hjVXpJU2Y0UHFIVHdhT0pvektHb01oZ1ZFUTJMbUtER1lHV1lIcmxY?=
 =?utf-8?B?ZEhvQmx0LzdTVWt3aCtZaEVBOCtkSkVHV3g3R2Q3bnFDbGFrLytqWXdJVXU0?=
 =?utf-8?B?M00xZ3diTjIzM25tQnNvOTE1Q3gwTkNwTzBPVlJkeERFNElqYjY0OXQrTUp2?=
 =?utf-8?B?S2NFeWF3T2xmYSs4cDBpbUdDWkJmME8rczZvZXpQOEFxUUQ2ang1WHVYK1Ba?=
 =?utf-8?B?eXN2YlJCRldmMUdpTUpTMHJnekdjYW1RaWNIZFMvNjVIM1RJWGltemFIaHNC?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cb020c-1222-471f-6881-08de3745f8b4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:11:19.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YA9170VRX4VglaAA3jUmEtuRPlTQvUf8X47yunureJdIb0u6vKhIc+5p9/Z2gsrO+2XMWY7+l8K0EAwem58xQFo72OqYXNFy+Y+KGICa1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7706

On 09/12/2025 4:41 pm, Jan Beulich wrote:
> On 09.12.2025 16:57, Andrew Cooper wrote:
>> The variable is never 0, but because the writes into it are hidden behind the
>> HYPERVISOR_COMPAT_VIRT_START() macro, it does a good impression of appearing
>> to be 0.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I don't kind it being this way or the original one, so
> Acked-by: Jan Beulich <jbeulich@suse.com>

Do you mean s/kind/mind/ ?

Thanks,

~Andrew

