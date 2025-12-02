Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D4C9C3E0
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 17:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176249.1500759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQTPd-00067F-VH; Tue, 02 Dec 2025 16:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176249.1500759; Tue, 02 Dec 2025 16:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQTPd-00064U-SE; Tue, 02 Dec 2025 16:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1176249;
 Tue, 02 Dec 2025 16:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqM6=6I=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQTPc-00064O-Ft
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 16:39:36 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7badc599-cf9d-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 17:39:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7915.namprd03.prod.outlook.com (2603:10b6:303:270::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:39:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 16:39:31 +0000
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
X-Inumbo-ID: 7badc599-cf9d-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbIf4JMge8OS+UCiFJto5uyD/KkdnJ4VIpxANRdVWk44xFl8NYYvrzJxL44wlpn1+eVsYN9pSfhTXVYyZxXkfZzMGPYaKklNkJWN7RTe7D0SxtZQwVbLelaYKNkoix0Ln+9xbevzia5u9tKHF+mMDP86Na/99doPXSU2YTBXy6t10AAeJB2xDg7YgedLfsbhlakeVQOYy/6X/u4HZdQVmt+yxrSe3BUdXA4QkkA+2fJalrDcxfzu+m9ySoazcjV7e0hqmXOLvi1fOV5ZzzGlgcxuWK0V3Y304zoZ3KoC+hKWF/Dw/1atfLJc1p8jgsL/FBKG1Qn+silrvDAgkMEX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNiCogE6Pi2TTTBLzbjTvI7Jluz7Q9CDEMTi2mlQm50=;
 b=hOs+PhgrmV1Mn5XNRRjjLxL3bfylARgQ7m4AK97wDNRzip/T/88cm20qldHGqG/w+6UUppeYn1mMtUfFqbZ2a2gq7CTwZEiReEVtHBob9S4HwElWOooqZN1NM0LFKe9dewOXbDU5+3eGfJ4M5WH6Ekr0euyuolTjzb5xNjcHlr1PSeDRPRfoC1qvXyXkaDpg+AuVDNVmv5oSTTrILp61ospOJizDSdwYHJ7BglQFA7YcZO0YwN4NgCO0RamVQAAEy7djY3/AC4MAZUubw4uDXBdrXZUO7Drf7bFELdJhU+/spQlIui3M2CFc1Fr3dQIxk1k+/Z9q0yY6em+O/JHfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNiCogE6Pi2TTTBLzbjTvI7Jluz7Q9CDEMTi2mlQm50=;
 b=O/en1XKv0tgZFqhQYD0kQgcSTQa6FkR54rP23IZWS207zZE1iMa1q/ZXsMVY5z5Vd2EkXs1vGwKypHt4DSVvkYB/90SyTj3Qei7CQgOrVDV2zk9POL0SOnGrhJfGHI/nQ3C8MViqxLlXAxq+qUxho7q5ZJo/yJWtpbGyLQYdV+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fd86d046-40c7-4c95-be75-ba3013689961@citrix.com>
Date: Tue, 2 Dec 2025 16:39:27 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Krystian Hebel <krystian.hebel@3mdeb.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/lib: Introduce SHA-1
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
 <20251128184757.1243678-3-andrew.cooper3@citrix.com>
 <bb4ca936-da10-46f2-bf9c-055e19990d82@suse.com>
 <040dbfeb-fe2f-4b5f-9495-799a22876d4a@citrix.com>
 <8556154c-86d8-4208-8c47-3a2507c80dd1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <8556154c-86d8-4208-8c47-3a2507c80dd1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0506.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c6af9d-7f93-4847-19fe-08de31c15e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmJhVm8zTmJJNjJLaEN4ZWU2bWxacUNBQ2FMOU5BQmhEMitHU1pIeS80cDBR?=
 =?utf-8?B?UE9tWGwyUVVEblpMOS9iZFRjWXd1WmNvQW5wcFFFTGhYTEFzaXZBY0JEelRk?=
 =?utf-8?B?RXkvQTRiWU9lTFlhdjRrYXlyNlcyNnRhcmwyQytIaVlaMnpxSUNseVk3cFNn?=
 =?utf-8?B?azZkak1SaG10U3hlWHc1TUw4bGtuK2RJMjJ0OExocTU2SGxuZFRCYnk0Wktj?=
 =?utf-8?B?RUFzYjVlcktOWThCNUovbUZlY0N4N29haEFOYTdrOWVHN21LTGpRVTVZdFpS?=
 =?utf-8?B?dHJQZVpGQ3gwZitKZTQreWlaN1l5S0dlbFZCSmY4QUFiTzIxMytDZ1RGeFlm?=
 =?utf-8?B?SlB1cmtkTm9walBzaTJMNjNRQkJPZGtCOHdTT3Z1N1VBRjloSllib3BpTmkv?=
 =?utf-8?B?T2s4WmFSenBtN2x2enZ0KzVsem1vTG9lN0NXUC95dDZJVEZjOGxrVG9PMHFa?=
 =?utf-8?B?ekJpQTlDaHp3eklpUFlWYm54b1NOd1Q0TUF0TGdTbzJqakorVCtJU2tiSlR6?=
 =?utf-8?B?b3RuZVBVL2xCL2xBWTF1dUV5bGk5eG85QkgrK0l1aDF4MEwxbEJrVnd0QzIr?=
 =?utf-8?B?VGVhYlFXUFBqS1N1bW1Va3J6OUdpY1g1aUNXNUF0YndPVFhOOUNydVY4M1BP?=
 =?utf-8?B?RlczZ1hvVmZncXJRaUtwaGVKU2JvblVlcmRMeHF6RWxoWGdxczk5UENDTzEz?=
 =?utf-8?B?VkhlQjlMSDNiRU1nS3Rlc1FDL3ZWOW90SUtlQThiQkIxWFJpOVlTNmRmOWZS?=
 =?utf-8?B?Y0d3V0VIL3c0MEdnNURhL3c2VUlGbXI0Rkd0Qk5wWnpDYk9DQy9wbjZWQXV1?=
 =?utf-8?B?N1k4SFlab1p3RFNDWHJ4azZrellKOUxPOEloSHh0NTRMWjFjR3dZZWNMQWlT?=
 =?utf-8?B?aFY1SVVKU2EvanU1dVZLcksxY2VnZ1JLZSs0WUlOL2E5YXFMS3NhQkJ6VlhR?=
 =?utf-8?B?eXY0em41UytxcUFkM0oremtxZDUxbGFodCtRWWd4YitIOS9CYm02SDZZcmVN?=
 =?utf-8?B?eXhXR0F2U2MwZkFFamdvbmNBLzdVOTY4d1d1ZHh0czIvOFdKL3hMRUpxS09w?=
 =?utf-8?B?bmJBZDU1ODBnQzdmNVJJR2N3NGhYS2VBU0owYkxRb2dRUW1UcUM0dDM4dXBT?=
 =?utf-8?B?VmhVdFR2U3hET0QvQ0tPWUlCTVpsUHRjSkpDV2pObENFWURpaGtGazU2bG82?=
 =?utf-8?B?SnZjM1N2blB6VGNhcmxZTk1FTlI1ZktNVXVMVmdEcnlScDhNSkliR3J6bkJ5?=
 =?utf-8?B?UTBUL3did1hGUHNoTllHT3ZGeHQ3RzVzMzduNUhFS3RjV3hDTEphNWtZaW0y?=
 =?utf-8?B?QVRoK1ovOTBJS25ONVZueWxPZmhxVDNBT0J2K1lEcis5ajFpdGM3cjFJVUd6?=
 =?utf-8?B?WktacGZxTGNmS0NpVEJrVmE2c1hwSmFHUDBFYUNybjZscDBRVGlONytma3pz?=
 =?utf-8?B?dGNMUHJBQ1FOK1dkUkFCSE5OZTFuWjE2MVBzNkJtUGtqNmh0dkl4ZG1oeVk2?=
 =?utf-8?B?NlAxb1BLeUY5VW1UMXlDSUlPbVlkdXNsWkRReWVwOFRzTUh1cjBML1ErMFBF?=
 =?utf-8?B?b0JFaXVxYlE5TE9mWTMrMzltOG5nbFJ5SnA5MlQvZlNxZnY3V2RHWDZvU3RK?=
 =?utf-8?B?a2QybGdoS3ZuWEJZWTZJcjlxVVNxdURtOWsybkdjdkZYVXoyZ0YrTWl5M0k4?=
 =?utf-8?B?azVXVTFETWNrbnd3MWdOcCtad3ZBTk1OcWZ5Q3VKVzhSeDBIanhiN1FBNmZs?=
 =?utf-8?B?VTlISS9pRHdBYXNYODFDV3NZVk9ZWFN0YUZ5M0JJbk5TWU15Tm94c1JhT0VP?=
 =?utf-8?B?d1dmSFhTOXo3RjZVNDBJOGVyY0hIY2ZHbTFKVERBcWlZSlFKUlAyTGJNdUFP?=
 =?utf-8?B?OGtSRmNmZmdCTTUyaTJ3TmVFNXFhT3NkOVQ4WVJ2UVR2YW5XTC9sakdyRXpO?=
 =?utf-8?Q?nuFeI3zlla+nxEvxYIiVy2tKuGXHVaVb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXVtRy8yL3Y1R3laUTh3a1o4SEY3L2pLZExKOFF3N245ejJKZkFXbmJjejBl?=
 =?utf-8?B?c3N5K2pJOFlucUpQeVRSNzFYN005L2pjemcwL3pTSnBPbENVSTE2THVzNEQ2?=
 =?utf-8?B?UjVjcURJVmJnanJJYzZ2TzBXNVNxWjBIMTcrV3hTVXhIZWpyRUNJOEJKazNt?=
 =?utf-8?B?eXhuaWZkcTJ5M2Q5MTJaS1lzazZQMkw5eVVuWlNETE52VGliQllxczYzTTN2?=
 =?utf-8?B?YjR6eHdOakVubVFEcmtJeE5tazBOaWg4UTFVVkYzN2ZUUEdDMjlPdkZZdVZQ?=
 =?utf-8?B?RmRaNXJVSU1tekxWcDdHOThlSGc1TitPLzBJMjZCeDY5c3FYMHgycXRZOFFX?=
 =?utf-8?B?NWN5YVU5NjVjaHIyMmNkVjZ1VmwyTE1makl3bFhvRUhXbHVOb1BVTW1nTS9J?=
 =?utf-8?B?Szh5a1E0dmtsZmdGdnlrZXd6K3N1WG5mblVGMHFITEdUQy9aZlRPcWtpei9O?=
 =?utf-8?B?YnBNN2JJMkpVT0NkMGhIcGNzeUJHdjg2R0NRR1p4OTlNam9obDZCZXc4SnlZ?=
 =?utf-8?B?d0cvc3pKUm1DVTRJWHQ5YkFJeGdvSk9xZitzb21sRFYxQlJ3UVZFYXZTck5T?=
 =?utf-8?B?VG5naGIvd2ZHTEF6UUJVaTR1YkRoTlRSM0RuU05PN1F3dTcyYytQOTQzWC9P?=
 =?utf-8?B?UGNRQUJhMVdUTUFlQThUViszdmxUTlNOcUNpZUw1YlRGNkxTUzNVWmR1blUz?=
 =?utf-8?B?MVFDVGNSek1jQTFEc3c5Tzg2UEdtWTVrd0R5Z2ZyS1pQTTRrMXJIWTl2Snpi?=
 =?utf-8?B?L2JPakJyZ2J1YnRpTytFUlExSVZrSHZKd29EemRVRGUyNHp3dktyc0kxT3ZH?=
 =?utf-8?B?dkVmN3RLVWRBUmtsTExTUlRPRE1NNlFscjU1SmtIR0tBdnFSNDNqd0trUWoy?=
 =?utf-8?B?NFRXdEtSVlBsYTI3STAvZk9NS3g2Vks2ZUpiTXBXNlBlT2FBV2tTUzFmRjNj?=
 =?utf-8?B?dGxFQ095Z0tIN09Ecm1NaS93djVySnBOL2l6eVdrQTFiSXk4STY2RHRrOVpi?=
 =?utf-8?B?TFBIWHhQdytrUGwvQlR5ZDFjWWYwdGd4aS81MlVOQm5UL2VCTkt2dXlzQTBx?=
 =?utf-8?B?SHlpWHVpdFJ6VFArTGxQbFR3M3JWVkJmVk00N3NmRzZTZmFLaWV3b0xEdDM5?=
 =?utf-8?B?TE5MNk81TkU4T1dQRjl0L0pVU0ZFSEVCenJmU0RWdmtXWjFOY0tiNFRYbUlP?=
 =?utf-8?B?OXM3OVdIVGllTjYrclFremtzUTlPSFlndWMrU3RBUEtDeEt6ckVZQkVZNXdm?=
 =?utf-8?B?MzFjN0NzMkcyNGZFc21WSHhxUFdZMDN0WXpCMTNwWC9GWE5zZ0FBSlk3dGlC?=
 =?utf-8?B?U3NWNmQrdVlCeUNiOHJWL2NxSG9oc0dkTTZHVzNDb2tmTmNHbEZicnV4eWt0?=
 =?utf-8?B?eVlxMVdkL3RXSnRZZlNCYmhmNmlvbzUwSVhMN3J0b0NHRXYwbEphdXRTcEU5?=
 =?utf-8?B?a2NMSUQ4cGVRaVJKTUpCTmhYUG1QK2tRSkZtbFIvM25nRWhSVnZkMGovTHRP?=
 =?utf-8?B?T1oxSWxnTktINEUxQ1pHZmVCaERVZUVISkZ5UzhubGFndHZ5TnpsdklWZDEw?=
 =?utf-8?B?SW10RWJxcks3eGo4MXo5K05pQlQ3NURudEpYTUNBVUxMZXdZeDFWc2l1a09J?=
 =?utf-8?B?d251ODZiZnpNMEVsWnNIRGlZaW5SRzlEODgvWHBMakI0dW5QKzZrRkExTFBa?=
 =?utf-8?B?NU14OXZYRVlRUkFldTdIK0lsa0J1cWVmT1E4bGpyYS8xdDM2Ynd1VkFaL1Jp?=
 =?utf-8?B?N2FxWmg1ZzlaWGxoeHZMd2lxTGpOMWRScDRaNlc3SGNEcCs1TXRUWU1Kc1Iy?=
 =?utf-8?B?bS90UEUzbk4xWXVETEYxYmlYWVduNVJDUGQ5RGRsbGRWTno3MGF6TmFWOU54?=
 =?utf-8?B?cm5JaHNJSTFjZk9tZjF3TThUS0lxK1YyTjFHbGhYMlhvK255emROT29sWVdw?=
 =?utf-8?B?YkZiNTI1WWJSczFxU3FXNCtIVmRZMy9uYjRhQVIvT3VnSGgwTEExL3N6UXZN?=
 =?utf-8?B?WW0vV1VFa3VWMXZWbU5oNWIzUW50cVM2T3F6bVlqZnhkN2JrUE1CUzdxMTRh?=
 =?utf-8?B?SXlNejhEY2EzdCtjSTB4VlgyUitjSE5kY096MVRPOUQ0cFNRRDhzcTVZVnZV?=
 =?utf-8?B?anljemo1Slp1ZVBqVllFdTRLK3FsbTJUMiswc3hIT0JUckxjZ1U4a2tRQkZR?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c6af9d-7f93-4847-19fe-08de31c15e15
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:39:31.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xKylmMLmUEvyr9flQjocIw26zaYCaXTLK6Z3X++OB2AlqjFfVchgfrsQhgVdjl9r9g9c8VdfdQFuQjCXWmAGgQmWFLgBdFxfPieLpROMxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7915

On 01/12/2025 2:24 pm, Jan Beulich wrote:
> On 01.12.2025 15:19, Andrew Cooper wrote:
>> On 01/12/2025 8:46 am, Jan Beulich wrote:
>>> On 28.11.2025 19:47, Andrew Cooper wrote:
>>>> --- a/xen/lib/Makefile
>>>> +++ b/xen/lib/Makefile
>>>> @@ -17,6 +17,7 @@ lib-y += memset.o
>>>>  lib-y += muldiv64.o
>>>>  lib-y += parse-size.o
>>>>  lib-y += rbtree.o
>>>> +lib-$(CONFIG_X86) += sha1.o
>>>>  lib-$(CONFIG_X86) += sha2-256.o
>>>>  lib-y += sort.o
>>>>  lib-y += strcasecmp.o
>>> Why exactly are we confining the two SHA<n> to x86? They're both plain C
>>> implementations, so ought to be fine to build everywhere. Being in $(lib-y)
>>> they also wouldn't make it into the final binary until a reference would
>>> appear.
>> For the SHA2 patch, an objection was made to compiling it on the other
>> architectures.  Personally I think they ought to be plain lib-y.
> Everyone (not knowing where the objection came from) - can we please re-
> consider this, ideally ...
>
>> I could always have patch 1 fix up to lib-y and have patch 2 match...
> ... allowing this to be done?

FYI, we discussed this on the committers/maintainers call, and decided
that lib/ does want to be generally enabled.

As such, I'll do as suggested.  Have patch 1 make sha2 non-x86-specific,
and have patch 2 be general from its introduction.

~Andrew

