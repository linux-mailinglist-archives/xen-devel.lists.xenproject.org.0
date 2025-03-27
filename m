Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25AA727D5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 01:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928334.1331072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbJ1-0002ko-AY; Thu, 27 Mar 2025 00:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928334.1331072; Thu, 27 Mar 2025 00:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbJ1-0002iS-76; Thu, 27 Mar 2025 00:41:11 +0000
Received: by outflank-mailman (input) for mailman id 928334;
 Thu, 27 Mar 2025 00:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txbJ0-0002GY-2t
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 00:41:10 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c632a31-0aa4-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 01:41:08 +0100 (CET)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by PAXPR03MB7698.eurprd03.prod.outlook.com (2603:10a6:102:204::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:40:52 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:40:50 +0000
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
X-Inumbo-ID: 2c632a31-0aa4-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUo+denI8FQecJlhbUcIyKOtA+KwQ54O2YT6kHhXjcyXxCEtBbNpagOIBwrDjZx/LP/wS9nmM45dzzNPCBEabJbh04/xr2Ooen4pX2rr49HLDefqdib1vI3Lp98JycYoS0609FjRCfxAKfxiZ8Ft5Jsr6mGtJcTrs+RB7/nfjo8vJoXHns/++1CAPvLBnVmJQ2w0TB6KCVFMAZn9zBU2JANK8bu5jLr74/joT/tdSX4Y4Rkdg+etUK77vEiH8JkIEOZJOaZIot09CWGJVhKxPJdRbyplTAUyR41y0J573egmwf96EpM4m1sot7zSkYdtEYQIRm/bNydRSbIpBegdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PNoRs+P8rV3LA1/W8yDEqZfleN+5JFyDrKAcBiYHCc=;
 b=KMNPya8T3ByC/6B81+oik3ClV7/MzmtoozmS41CjFOF21PNi3qpa6E+Vr2nG+d21dmGICe/w5TYR8j2cn3u3ZgIk0F3pdVpHq+9EJKSz2a3pAisCFBgDxYo1NGA+Epmsm0S8VA0vKyfXb15bstV/HLYq6ZATkZJs0FsZ/i3nMrFkKW0JOqNozkuXyNP15I4X+EkzCYNVKBr7LFhD+AvxIp7Od3MoQo6k2OewecdlUXA2c3W3iDcSrwG/iO7a7eKAn4DM936A0+OPjNLfzcs3bbZ2Sxb/3gKos/+i51Dd/UK2iwMaCgp/QMCfsahAMvwUJGL//Qv7e2FPA9oEQb2wKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PNoRs+P8rV3LA1/W8yDEqZfleN+5JFyDrKAcBiYHCc=;
 b=phaj+ij3ZA8gtZoodwV3hrckIEn+8e+dEf5qVvJAPNt2Yi6sXLEB3hoknrSOFf8BUf0UGXmcjAU1tAIuInzzz4UYNg9Uo3V/ZQquu+SmvM6uzCyriZKCfI3rrPHLMkWos1JsJuBC5nkSJUfXkq+jpqwWgDtL1epBWl89XT3uiaLdSZy0kK7aKUFOJGBQlIZ+FEreDkMehlQroIMDGr2/1opGqRHIi9bRWmTLNkEHzShM8PxcdjYs0PsJtOZUtBCS38T9x8AAHcCAjjDzXEdaqSuXCRk+C2Fa8dcPd38Cc8Vw7uTwWVAlH8eYospVhqB6Vg0MZv+HBsFKr8dQsM/M7Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/3] Enable MC/DC support for GCOV
Thread-Topic: [PATCH v1 0/3] Enable MC/DC support for GCOV
Thread-Index: AQHbnrDjnU9KKdJKZ0alkRNpR7EUwA==
Date: Thu, 27 Mar 2025 00:40:50 +0000
Message-ID: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|PAXPR03MB7698:EE_
x-ms-office365-filtering-correlation-id: c62a440d-d24d-4cce-5037-08dd6cc805cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZEJzMHpYbHd5SkhHSEtBdUZ6RmVBYmJhbis5UFpmUmhEeFE2OVlzMlRmL09v?=
 =?utf-8?B?NmViOEo0ZUdKcnJDeWUvUVI2Unc4TTlPVDJ4YU9MN3FkTkhGRVFaVzRQLzJa?=
 =?utf-8?B?M2NQNlhUclU2RHNQWEQvWkdxTGZBVDBMYmpWR0QxSjgxbUpBZng3c3V4OS9i?=
 =?utf-8?B?YlFkdWRHRTJ2ODNad2xTRGRyMFVtZHZRYWdFV1NaVFgwcE5tTjdyWXBMNzRw?=
 =?utf-8?B?bUowSnk3THovYnFjUElWWjNXNVRaZkdxQXlvYzJxcVRsd2pVbGlWaGNsUTho?=
 =?utf-8?B?VFB5cTZPMUtMbjlFVkcvKzJDNW9oNi8wdVJUWGc2akJBUmh0UWdDUUhUWkRs?=
 =?utf-8?B?aEttMit6ZldIUlJmTDEwbG9NbURYdUVGczhhdjN2RitLVzNsY3RYeDJ3bTNt?=
 =?utf-8?B?YVU2UDRZTFlMUEFrZmF1ODhocVUzeFEwUWRld3hJOWFDdWRaSHdDRkQzcDJv?=
 =?utf-8?B?SG5ONHZ6bW5SNUQ4bkVnUkRmbVFQVkdzQXkrVkxMeHk1SHVRQ3QxQTk1bU84?=
 =?utf-8?B?ZVNJN1RvVlZCN3pVQjhiZzgyQWxJVWM3bWZ1Z25rbmgxOWx3MlNmZms4Y3ZT?=
 =?utf-8?B?KzZHaVNtZzBoOFdsU0V3OUovM002MjlJZ1BPcURadmNkNmV3bzg0V1kxUHdX?=
 =?utf-8?B?aXJpSWFwYTczNVByc3pGYzJ3OTFSLzFTazdkYStGRUlKc1RIa3ZEUy9kcUsv?=
 =?utf-8?B?UXY3a3hGdDRYR2pGL0p5UzFiMVpqY251RHVGbk01bGcvbXdlaWZlY3piR0dt?=
 =?utf-8?B?emFBSzQwd0d6c1BXNDlyVXhnd3dBVGk2R1dRZnYvZFhQdmRwb1VRSGE2ZXJJ?=
 =?utf-8?B?UnlTSWovU3k5OTgzNCtySkdYaFU4UGpDUUdJQ3dLa1NTMnJCdTRCbFkvUm5h?=
 =?utf-8?B?SDJjditwdXI5WlpiUzZzMFBlajQ5UEZMUjFpMjNLWmJWN0dQZkhBRWp1Vndn?=
 =?utf-8?B?cDVidm9BTnBFZk5jVkQ2QUcxMlY5SHpKR1MrWDBhcGxLME5pYURMSXZWRWNC?=
 =?utf-8?B?TFh4amkvUVI3RkFPR01wT3o5Qk1lY3pyUUREdUVmK084MnhsL2NBamJCQW1C?=
 =?utf-8?B?a0hQN2JMcUlXS2xWOXcreTFja3E2Y0JON1pwYmY4alZuSlpnWFZCYVdWUWRo?=
 =?utf-8?B?OS9oS1ZYSGJCR2ppRTdRVXNmWHdrSEZaemdYSlFEOXJhNEpTYTZoZXFMbzZV?=
 =?utf-8?B?RW5aUll5WDArandURDlTa0Z0TXVkeEhhYkFRNnFYcExCYlBITEE0bUprUjNz?=
 =?utf-8?B?cTJkYnJXWEtPenF3S0crbGNOL2ZKRHFQS3dSblZTaC85cVFrUEI1enJqdEJ5?=
 =?utf-8?B?eVZzRENuK3VlZWtWYzdlQkJBU2lXaHVOOWc0cHA0VWFYMUNsRlpuRjRSSXd0?=
 =?utf-8?B?WFcrNTJMVXRTYzMvOWdEUUFZZ1JKSytPZjhJOUZlOUxjWmQ5SEpyRWptU0JS?=
 =?utf-8?B?VG9ZK1F5TG9Bb2VWa3RqNlBDaU1WY3JuUlJQUVovTU9MRTIzZGl2eXVnVjFH?=
 =?utf-8?B?RVRpS0gxSnpTeDloWEJ5cmNqSHU0cUNhdGhpNVk1UEo3cnM3MnFQaU1iL1d4?=
 =?utf-8?B?NFZ0dnZra1EwVStzUERTR0p0eHpUbzZUUnF2TVB2WDk0Z3l3dHJCOHBOVm4y?=
 =?utf-8?B?Z2VuOExqRksvdXFOWlI2S1hhZE9IcnRjRS94cHRZNW9hVjZiV3lpLzFGSnNC?=
 =?utf-8?B?c3FOdlNQUU8yMG9LNktDZCtXdDNacXBXcERORGl3aEREK01OZi9CRVdHL3NU?=
 =?utf-8?B?SUh4MEtLSTBhRVFrNFNOdldpeGY4eWVseHlMb1l0UGhNYnpqZlVld0NTMlQx?=
 =?utf-8?B?ZWNybDlxM1NCMmM1K1lJcU1EQ3J0bFZKOWpxWWRZckQwQ0RVanQ4RkJQK3J5?=
 =?utf-8?B?WXAwTEZpbDJLYWdyenFsZ25UOXlEWHJocXNrbXFYSFVCZTg0b3NRT3ZZa3gw?=
 =?utf-8?Q?xUHJo/MMzIOWl3H4J/4GkZAxWS1Ww/vz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXh1VWRSYm1NdHJ4eWVWcnA5STRrRjN1OXdrOHRhaFJsQkVDTXJYOWdNMEhR?=
 =?utf-8?B?N2FPU1hWNzRVK3lmcm9uUktLSXRrdnIyWTJCdXMrS3lKQkZYY2VmWkVDNkNn?=
 =?utf-8?B?azR5ejJrRlpBWnhmb2RHa1AwdE1jOUVtYmdPOTdXOXVVTkhyTURXZVJHQi9y?=
 =?utf-8?B?eUZBOEY0dTZSRG5PSDg0S1ZVTDVKenk0U2pUdXcrWlJBdXZNT0tYMUdKOVFl?=
 =?utf-8?B?ZEJJT2Z1WmhWbnY2VlgxeDExOGxxQU9KNEprZzhVcXE2NkExNXh0MkpnUGpU?=
 =?utf-8?B?TDBLUzVWVVo2UG5rOHhYTjltYklGSTFvajEwSnRMNnVGb2lQYVM2end1ZVZI?=
 =?utf-8?B?WnJ1blorc2piWklHQVdwbk95eXJMa0t3NmltaGtNMGsvZ0Q2VnROaWx4MjlW?=
 =?utf-8?B?MG0rQm1mS1ByWWtBL0ZuWTd6UDl5OHdOTEdhNFhDbnQyb1VwSFc5S1ZWak9E?=
 =?utf-8?B?MWdUL1d1T3BtUHZualRVTk5VeVFNZFVEeE12bU85NFRJZ0hCVlhKTndIZ1hK?=
 =?utf-8?B?U0pMWEVVd3RoZTFZeW5rd05ERjMrNW5kVlRlT0I5Qi9EMllsdFM1Zk9xSGpS?=
 =?utf-8?B?dS82OEtiUld4azNyWTY3MXZYTzJsc3F1RTBaNUpnalRRVm1zN2pZWlVRKysr?=
 =?utf-8?B?cUdKblNoRGdOK2hjODViZk44dkNkRWU1aVk0ZHoyb2tsbU1Qa1F0dWlpbUE1?=
 =?utf-8?B?eGpIaEs5QVB4UGpUcExsTUlCZkQ2WUdLVUJnOWMwaDdodjZBWGpxZjM1WWw3?=
 =?utf-8?B?eUpkQXhYMTdjdzlZYVh6djBjekt2S1lpSXpJMVYxY3FlZkFqTzBudlJXaEVt?=
 =?utf-8?B?d2pvczRBNldIbnpmK0o2MndveWlKU0Y1TmozMnFRRWY1M1pncHh5Zm03aDNH?=
 =?utf-8?B?cGtoZ0xTMnZCTitxV0xIS1dTblhjSm1EMWRiQ2t4SzQ1blArZ3B3d2FNZGJH?=
 =?utf-8?B?emp6dmRVZ05RUVF6TW1lMlVPVXBxbUxWNzFOR3BYSnZ4RkVXdis4a0xxY3c4?=
 =?utf-8?B?UzdPT0pabEFrTk5Wdm1WOFRpN1FMRHU5bWIyNkdqSjBZTTh1YzdZa0RPdGIv?=
 =?utf-8?B?cFJFNFptejlZYzFwd3dROHdxcFduZzdWZWM5WllRaUZaL2JFU1pKVFdYenpo?=
 =?utf-8?B?YUczQ1h4R01Leld0bGt1d0NKb2dIakx5TCtSWWdCUnZlNkxMQjBkSEo5Vndz?=
 =?utf-8?B?QXBLRHdCVWJ2WkRGM0M5aC84UHpVYnBKcmZYNXp6Y2JJMVQ0UFgybHFmZXRu?=
 =?utf-8?B?ZDR3ckVPSDhLVEZOeU96VHZSemNmMEgxdjFQSHhvQ2FtNFdaSDZKSDN5Sll5?=
 =?utf-8?B?bkZ1SGhueVBhbzVPbTZTNnBadTRYZmQ4K05IQVdQTWg4OVVRZFc2N01PZFVQ?=
 =?utf-8?B?SVJJclNUSnVBckhrSVZoSHhRWnJqbE5LV0hSUnNoQUZna01veFQ5Tzh2anlk?=
 =?utf-8?B?bG9QRFp0TVdCV1QyaUZEVDYzajA2dzJISjA0Tk5TL0VzVVk3VHQ0a01wOENH?=
 =?utf-8?B?WDUxa0FObnB2cG12N2llYkpDbGFPMU9hWHdEZno4RlFDTXgxVndtN1VQOEFr?=
 =?utf-8?B?QTVVdDNaR2xvVTFabkhJditjUlBHMDZQVU41b2xyc2lub0RqQjU3SEg1eE8z?=
 =?utf-8?B?RHd0OElHVGNDajhyM1dENE5Tc2dvZ2VJYVF6TDBpSmFrK2pMUHJZaUg0Y1BE?=
 =?utf-8?B?VFJES3JReTlPSnliNGYwVytYaDlXODc1N0hKa2NIZTE4UlNqeDNXSG1EMGhC?=
 =?utf-8?B?ZmJnbDM2dXd4KzRwYStsdHY2MjRNTGNQREtLR2VXUnBORHBIaTFkS0ZGbjdI?=
 =?utf-8?B?akMzbmVsdjI4M29lY3hJT2tNSjJwWVZyOFlEVlZpd3NBWlNxNHM5MjhqNk80?=
 =?utf-8?B?SXVCL0hyRXBYeHcrSG1nN3hUdC94QzZQK2E2cGlZZy8ybEN0SWVLVVZQY2ZV?=
 =?utf-8?B?Mm9lQVNPaVZ0WFlDdFZGaXlUeGdPemd4VDFKNng5amFXRkh1djlTNmJ1WGYy?=
 =?utf-8?B?eW9rdEQ2Z2lHRjlqZ3RsK3Q3K1B2Zml1emVKbjNHdDc5TW1nQzBYclhzVVVQ?=
 =?utf-8?B?UlQwK1B1N3gwTnpYRnFnbm42QUhGbmprZFFKSnVla0V3Z0xHd1dZNUx0NklR?=
 =?utf-8?B?dmpvV3lsUm1MVmNzZkRTekMxOTdIeDhyUS9TMzRKMk42NGxhOXVKdkdhQ3JU?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F05FBEED21648B4489152A7DA0DC8D64@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62a440d-d24d-4cce-5037-08dd6cc805cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 00:40:50.2449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ApznvSSafW6QVPTOhEGsXbBQ5wrKzJE7L/X5O+McswPUgXFpFA5InlG52FYMkGDc2tpfKc7XdAMV0kgcLlYfgqofJe15XgN92kx/Cdeou0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7698

VGhpcyBzZXJpZXMgZW5hYmxlcyBNQy9EQyBmb3IgWGVuIHdoZW4gYnVpbGRpbmcgd2l0aCBHQ0Mu
DQoNCkNvbmRpdGlvbiBjb3ZlcmFnZSwgYWxzbyBrbm93biBhcyBNQy9EQyAobW9kaWZpZWQgY29u
ZGl0aW9uL2RlY2lzaW9uDQpjb3ZlcmFnZSkgaXMgYSBjb3ZlcmFnZSBtZXRyaWMgdGhhdCB0cmFj
a3Mgc2VwYXJhdGUgb3V0Y29tZXMgaW4NCmJvb2xlYW4gZXhwcmVzc2lvbnMuIFRoaXMgbWV0cmlj
IGlzIHVzZWQgaW4gY3JpdGljYWwgc29mdHdhcmUNCmNvbXBvbmVudHMsIHNvIGl0IG5hdHVyYWwg
dG8gY29sbGVjdCBpdCBmb3IgWGVuLg0KDQpTZWNvbmQgcGF0Y2ggaW4gdGhlIHNlcmllcyAoInhl
bjogeDg2OiBpcnE6IGluaXRpYWxpemUgaXJxIGRlc2MgaW4NCmNyZWF0ZV9pcnEoKSIpIGRlYWxz
IHdpdGggdW5leHBlY3RlZCBHQ0MgaXNzdWUuIEkgaGF2ZW4ndCBmb3VuZCBhDQpiZXR0ZXIgd2F5
IHRvIGZpeCBpdC4NCg0KVGhpcyBzZXJpZXMgc3VwcG9ydCBvbmx5IEdDQywgYWx0aG91Z2ggQ2xh
bmcsIHN0YXJ0aW5nIHdpdGggY2xhbmcgMTguDQpzdXBwb3J0cyBzaW1pbGFyIGZlYXR1cmUuIEJ1
dCBDbGFuZyAxOCB1c2VzIHJhdyBwcm9maWxpbmcgZm9ybWF0DQp2ZXJzaW9uIDEwLCB3aGlsZSBY
ZW4gc3VwcG9ydHMgb25seSB2ZXJzaW9uIDQsIGFuZCB0aGVyZSBhcmUgcXVpdGUNCnN1YnN0YW50
aWFsIGNoYW5nZXMgaW4gaGVhZGVycyBhbmQgc3RydWN0dXJlcywgc28gYWRkaW5nIG5ldyB2ZXJz
aW9uDQpmb3JtYXQgaXMgbm9uLXRyaXZpYWwuIEFsc28sIFhlbiBidWlsdCBmb3IgYWFyY2g2NCB3
aXRoIGNsYW5nIDE5LjEuMTcNCmFuZCBjb2RlIGNvdmVyYWdlIGVuYWJsZWQsIGNvbXBsZXRlbHkg
aGFuZ3MgdXAgZHVyaW5nIGJvb3QsIHNvIHRoZXJlDQppcyBjbGVhcmx5IG1vcmUgd29yayByZXF1
aXJlZC4gQnV0IGF0IGxlYXN0IHdlIGNhbiBoYXZlIE1DL0RDIHdpdGggR0NPVi4NCg0KVm9sb2R5
bXlyIEJhYmNodWsgKDMpOg0KICB4ZW46IGdjb3Y6IGFkZCBzdXBwb3J0IGZvciBnY2MgMTQuMQ0K
ICB4ZW46IHg4NjogaXJxOiBpbml0aWFsaXplIGlycSBkZXNjIGluIGNyZWF0ZV9pcnEoKQ0KICB4
ZW46IGRlYnVnOiBnY292OiBhZGQgY29uZGl0aW9uIGNvdmVyYWdlIHN1cHBvcnQNCg0KIHhlbi9L
Y29uZmlnLmRlYnVnICAgICAgICAgICAgICAgfCA5ICsrKysrKysrKw0KIHhlbi9SdWxlcy5tayAg
ICAgICAgICAgICAgICAgICAgfCAzICsrKw0KIHhlbi9hcmNoL3g4Ni9pcnEuYyAgICAgICAgICAg
ICAgfCAyICstDQogeGVuL2NvbW1vbi9jb3ZlcmFnZS9nY2NfNF83LmMgICB8IDggKysrKysrKy0N
CiB4ZW4vY29tbW9uL2NvdmVyYWdlL2djb3ZfYmFzZS5jIHwgNSArKysrKw0KIDUgZmlsZXMgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjQ4LjENCg==

