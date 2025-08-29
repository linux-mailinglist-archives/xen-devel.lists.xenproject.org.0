Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EEBB3BA20
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 13:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101203.1454371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxYj-0002h5-LD; Fri, 29 Aug 2025 11:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101203.1454371; Fri, 29 Aug 2025 11:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxYj-0002dx-IT; Fri, 29 Aug 2025 11:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1101203;
 Fri, 29 Aug 2025 11:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sl0i=3J=epam.com=Dmytro_Firsov@srs-se1.protection.inumbo.net>)
 id 1urxYi-0002dp-RJ
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 11:46:20 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c75d9aa5-84cd-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 13:46:20 +0200 (CEST)
Received: from DB9PR03MB8327.eurprd03.prod.outlook.com (2603:10a6:10:37f::12)
 by AS8PR03MB7892.eurprd03.prod.outlook.com (2603:10a6:20b:423::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 11:46:17 +0000
Received: from DB9PR03MB8327.eurprd03.prod.outlook.com
 ([fe80::b7f:9b2d:242e:f7f0]) by DB9PR03MB8327.eurprd03.prod.outlook.com
 ([fe80::b7f:9b2d:242e:f7f0%6]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 11:46:17 +0000
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
X-Inumbo-ID: c75d9aa5-84cd-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1Ds7IkpX7HrXeveqxcH7oLYwE/D7hGyY2SU5vDKNumMmEzHGda06xaxxWK1Dw0AFcibFWT23V5iyjtHVHpu+z/5FfcQl1AydLYr13dS8yiH0MNg96s1shLKXFa4uUVppqVgEiGTvvdLsIoWGQlNYSi6foE4fUQ75EITD5iq57MncFRoCrZaqYReT3EBiuCuaQPTwAns56AgEawzoB5Whh8S6b3QNoakwE5g0jOBLaXmsjFQ/sZBU9gN1RMH3/gh+xNggWl4nfV5RCpJEo3sYbnvCtxO6HmsBZ8eTqRxbSYzNVR1lrNaCa67oM8Ncmrcy2XnpPExqJACKEfcDIOhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96l8p1chiKW05Wq4ko0zRmoTsMWj1UXQkSQf8AIiVUo=;
 b=nfOYcpRugfR7DvcN8iPa7tWvccsL+wo03YtGnefLD0RiD/j8QZ2CI2oKl2/FPBulde+hBPnThLgkCCzxtoPkKIXaqKlNx1fLn7spjPNiClC2dpy6E/d9iWjSfxwPclBDbpiU17UjkYACUlL96SsYD8TUoZyG++pBQuTkZvOmFjJ9u0J5/XbZof+OCI7X4xiIL07935DNZ164tRtmbytlzhBAnZ/DxBE6cJEBQyrUnFxo0bqBSsMRgU43X5EizHX8cmgodpXMFEnGnxoZRivTAfmay1qVADEv+pyRyF5izXJAtuY8sm9ZscF2vSlwZhZ0/dLUyXum6d7fwxi1C6uicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96l8p1chiKW05Wq4ko0zRmoTsMWj1UXQkSQf8AIiVUo=;
 b=tqB0qzx/hyodtQ4KdrQKCg/vSfZb0BkKeEq2CzhAK30yQDsB6qUDPQcG2v4nlgcByzyHLRwS0zR7ESwqQQwt887z/Yn15w/dmyxnQtZnc5iphy0s6O+vvT/nlMcvVqugDe/GbkVagF9HwrGBm5P+u5r1unuLyxRfwZmOhKfCqGB7zZl8F6ioHqhkabNSnuxMN5l99WoxiKmtkmxdxiVJCKj2W0aVeHv0bdKAYI6YLORYfma8tpJfLthegg1Zo7d13kA+EO5uNVk2NX3VpSiL3WP/lofx8V3Hf26mUZbyP0fr2464A5A8RHodBFUXtcWwMCd0D1zJA54Vk9+fiqFpSQ==
From: Dmytro Firsov <Dmytro_Firsov@epam.com>
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <xakep.amatop@gmail.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
Thread-Topic: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
Thread-Index:
 AQHcBuKhRQAjcpitXUCHafCQJ8zznbRuazEAgAZj94CAABDsgIAAD7AAgAI5V4CAAn4qgA==
Date: Fri, 29 Aug 2025 11:46:16 +0000
Message-ID: <15757493-0892-4a3a-b493-defa1b8668f0@epam.com>
References:
 <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
 <cff3e94c-4476-4103-ae7e-19656703e755@amd.com>
 <5d48d927-7e1e-4b11-b429-0b94259154ab@epam.com>
 <e0c2b06e-947a-4d1d-864f-5785cfe00b1c@xen.org>
 <474bffdc-f42e-4727-ab69-b11a67430adf@amd.com>
 <717da388-9382-4eaf-9275-27dd203dd492@xen.org>
In-Reply-To: <717da388-9382-4eaf-9275-27dd203dd492@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR03MB8327:EE_|AS8PR03MB7892:EE_
x-ms-office365-filtering-correlation-id: c7be0d02-7207-462e-5fb4-08dde6f1a9f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkNVYjFGVEx0Smlpc05Gci85aHpHbnRycEk4T1QwakNsRjhJaVRyQ3NVUTh5?=
 =?utf-8?B?aTZsaHNjajdSWkNndUxTQmw2d1VvL1BoaStKb1NBR0g5Uy9Oai94c0tOV21Y?=
 =?utf-8?B?azJaQVp5NC93emI4TUFMV3ExSWw1NGZ2ZkZtTG1rcmJ6bFlsNHY5dXRFMzFY?=
 =?utf-8?B?SFlFVTQxd0dvUGdFVERySzVxdGtaR211MnNJZFlhbTFBaUQ5elNlLzUrMyt4?=
 =?utf-8?B?WXFNT0hSTGNiTkxFWHFBRjlTc282RW1zc1dZd3hhWmIzdmh0RGhRTGwwMS9O?=
 =?utf-8?B?dTlIczFZQVQ2MElzNmtJUmhrZGRFUm9OaGdHREp3VmxjWllGSG02aUVybXhF?=
 =?utf-8?B?RzlKQlFnVitZZlFYRUVPVmQyYjBmckxtTXBqMStSb3dVa25TRDRXZ2FvNE1W?=
 =?utf-8?B?U1YreklBanlFcGdvSEU2elF6OFNRZUJOMGRiekJxTDRyaHRhSlR3cUs4UkxT?=
 =?utf-8?B?cVVNZzI0cFg1aWRrU2VuMGVEZFAwS1QyVitKUzRpZktrUllUWVRYTzIrNTVD?=
 =?utf-8?B?K1E1OWxBclhVRnVvRXQ4bFFHQ2d4Zk5uWm1GN212M2o3TGlnd0VKdlZxL2Y0?=
 =?utf-8?B?bWttNzlyUmxpTE5iWVhxRGZHVmtMM2N4ZmViS1JDSFhiK3VlcDJ1c2I0TkM1?=
 =?utf-8?B?TnVOcWhHUEhOd01RSVNkaVp5WUFZODZnaTRGcVREdnhJQjJzN3VIbXZsUElS?=
 =?utf-8?B?NkNQZkJFWUpqZ0IvdmwwNmR1aHFIL3U1anRySWh3czBYS1MzZHB1UjVUbDNR?=
 =?utf-8?B?a1didnB5bTVLY2F2SkZqdlNJdU9yaEwwcml0VXBjbkJWZnFxcUFzU2V1VzJU?=
 =?utf-8?B?Rlh1WmdSUFVIMEJQQ1MzNithSUlkbjRkbEZiZ3VwczcxNTE5OG1sMVYrd0lN?=
 =?utf-8?B?ZjlwdWgxRXQvM2JDOFV5aTFUcFIxRnkvYmVVK3ErVTRVY3B3T2FxNlNwd1M2?=
 =?utf-8?B?UmNpYlNvNFkzZENOQkw2N0RCeUdWcHI0a3MwRE54WUp4RU1VczMrdDRiL0hG?=
 =?utf-8?B?WVVZaExZaHg1RGthdURKb2VSWVBBaTlabWVvVDBhTVNVZWl6d0Z4ekd6RGh0?=
 =?utf-8?B?KzJlZWdDNmpQSkhJWUZ0Sy9temJMMUVURFJCR3ptek9jeFhteSt4bUFRZVBt?=
 =?utf-8?B?aWpqUWk5KzlCcE01RWt1QmwxbUMxYWNoSDh3RHRDSUZRMkZSdXJnSTAyUDhk?=
 =?utf-8?B?bFZ1SzNubUIrREpuT1dmQmhvWlNBcm1ha1NQVnA0MDVnMjlRTHpOYTlMa0Fk?=
 =?utf-8?B?czBWZGQwUlUwNkcrd0tRdkQ1KzNEbTRDTWlWUHN6MmVpampqODlFVHdVUEtx?=
 =?utf-8?B?YUMwWEZ0azBraks4UjNsblBXN0FJRS9jeWFrWmNlWG5UVnU4L0x1NGRVTmdB?=
 =?utf-8?B?WFFyamxhY3dmRXBnK1QrQnIxMEM0UDMzRlk0TlUyYlROQXB6dkpZdmpLcER1?=
 =?utf-8?B?dzIxdkhjck5QZ1N3UjFjOHJkbWNHRUU5endmZDhzN1h1VVZVdkxvSlRVbTNm?=
 =?utf-8?B?Q3ROVzBSZkFMMlRvek9mc1ZKZjZLTEpOVkZXbHJCWnlEeU44WnlOUG9kYStK?=
 =?utf-8?B?d3dlclF2dStZUTd6Mm5Kc3c1RWN0UGg2QnRpd3A0d2hZQ3lTYy9vUFN1RUlF?=
 =?utf-8?B?eWxRdThxY1lmNjQzTzJ5b0RvcVgzbEtZR0RaOVUyUnNRZlpTc3BHSDNjekpC?=
 =?utf-8?B?S1FudFFMMlhaWitGbEs5elRRbTVrVzR0RitIbVEwRyt4VGxYc1BlU0tTdjh0?=
 =?utf-8?B?bFhPVEh1YTNiRDFBUGovN1JTY0ZSVklNb1E3b0k3RytSbEhuV2gxOExjMVoz?=
 =?utf-8?B?WnIzRmRKVm4rSlR0Q3JrUFhYSFRHMXliekdGTjBpVFdsS2htcEFhb0VmcGdJ?=
 =?utf-8?B?WlpEZGJSaVlRWU9OSVhaK2RRRS93VWlHdzAvQmlqa1k5ZGI5NnNmTEZnRzBX?=
 =?utf-8?B?YVNTbTlOUWV6YUZ6UmRyL2h4NVBqTElXY3pFRVNtRTlEc0M4SlhLMWprY21z?=
 =?utf-8?B?NGh6TUFyTEJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8327.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2JDMFhzeGJTMkd4a2s2SzdwQnc2NG5HMVFMck1nN2c0QWsybWZEd21sSHRZ?=
 =?utf-8?B?eFVKUnZCLytwOXJWV0g0OWFBT0pkMldKbkdyREx2bGFnQ2lCUFZrZG9HWkVZ?=
 =?utf-8?B?QVl2S0lCdVFETTUrOEE0VlU5bnBaN1NhMytpTjVBK1R1YjVqWW9mem9JOHZu?=
 =?utf-8?B?dXBPbW53MDhnczgzODVJRTlvNFpUNnF0MHNaTHBaU0o4MkJrelhQQmhFK3cw?=
 =?utf-8?B?eVNsQkZOOENoTktncm1RZVdCM3ZLckQybDB6NnRvdmtnT1NRR0p4KzB2SXc4?=
 =?utf-8?B?aDFyS1BobWZZNmlacnUvMUlrR2tvR2N0azVlKzBNcXhEalJDbEhsY2xmbVJk?=
 =?utf-8?B?NCthTUZjazArSW9jZnNzL1VyMHdTRUxIOHp2Y0hXWUhYaCt5VGZEL1lLUVlG?=
 =?utf-8?B?Z1FsWkxSbHRmZVE5Qm1aYmZOczFIbzhoWVB4THBVcjRXa0pNNVBiSjd4Z2R0?=
 =?utf-8?B?OEpBYjdCVUhCVVgveDlPMWJzcVhldFpWRVNoTHI4YXRDSHF2dTJVWjVEaytm?=
 =?utf-8?B?V05DaUZNd0RMR2lVWldlWkZST3NXcVlGOHNDZlZVNXA5c1BZSis4Q1pTSmR6?=
 =?utf-8?B?OExnZDUxNk5URkRJaHBKZUpjYldPeXE2cS9iYzB2RmFMWHhNbE5BSUE0Nks3?=
 =?utf-8?B?WHpqWndXL3QrU0xTWjZvZ1VHbzNaOW1DQjNFbE12ZktsRHk2L0ZCL2s2MjFk?=
 =?utf-8?B?SjRYZzVFanFGY0xMRS9ISTB1Z2NVZVMraDJrcVR2NVRrSGNnaVdNUkhqeGov?=
 =?utf-8?B?WXdJc1c1b3BmSlB2TlpZWWhVNWpKMzVLMWFrQUlxaWdoampzR083cEN1UWlu?=
 =?utf-8?B?aXI0dEIvWGZlOWlyTEV5d1QrZzNsZXI3NzRRYjBoWkpoZXc0UlBUMjVIT0Vv?=
 =?utf-8?B?dTI3RHFJaXd6eVNRR2ZwR1JYc3d5a1dGNUhaZSs3NFNyVzl3Uk9JVHp6UTRF?=
 =?utf-8?B?a25YQTJnaVdnaXZJMWxvaGpKdUMxTHpVQllNZ3NNRzRYUlVSME5US0RwWlo1?=
 =?utf-8?B?NDVLMHN0dzBsYUtNbisySXVKeEt5OFZvMzR6Z2txd3V4aDVobnNZdVBidVFv?=
 =?utf-8?B?ZkNIYWZTUGFHWkh0QndYckoyM0lzcXBZa0VUWjhBTWdXbHRITnBZZEkzWC8v?=
 =?utf-8?B?Y0c2VEozY1F6THA5Z2VyTkpteTZVZTJEc1ora09ySW53QWE0cnppNVF3T3Ux?=
 =?utf-8?B?b3BPcDZCV3B2b0lGSi9aRGxZNDkzeHhTUjIvNjV1aXBmM2VZejVlbnpvc2Yx?=
 =?utf-8?B?ME1GMjl5NDEzQTRmOXMrSXpneUZoUE9SdDAxakdUb0orOWw2R0tEWTIzMVYw?=
 =?utf-8?B?eWZweWQ3NHVYbWRGM3had2dsdld6U1JKWldtdEtoejlwdE5VcWRZT1FJTzl1?=
 =?utf-8?B?V1hWRWY4RC9COUN5emJuOFU5TmJ1ZWgyUWtDOU5yWEhCYUZPbjF3RHZTUTA5?=
 =?utf-8?B?Mk82LzAxaXdMK1Fpdm5BNDlrMzdTM1VPbmkva3JIdHoyOWFRVFJlRElDZlRT?=
 =?utf-8?B?SFB5UjJKQzVOUnRBck4yMC9kTW54OHIyMHNQQXVIam1IdVp1eFBWM1U2eUR5?=
 =?utf-8?B?bjE5bWNFZGptWWxqcUpLeXgwWXJHbVNEK0cyTVE3Z29TajZpaWg4Y05LL0xk?=
 =?utf-8?B?V0VZci9XSjFNV2dMNUxsQUNhYW8zK0VCV2lYdlkrZmk0dmtpc1R2YzVhdzha?=
 =?utf-8?B?UDQ2TmF4SElKSFNhYXY3WDgxRjNjcEtsb1N0Vkx0MDB0SWc4M3BVVWpJWDRH?=
 =?utf-8?B?UVRWTTcyYlZmMDhubi9VeEpjYnMyY0V5UmpYT3E1dkwrdis4SHMvdllPa1E4?=
 =?utf-8?B?R013SU1adHA4ZUtGeW1oQXZuMTNVbGZnVzUzeHZFNU5LK3hVeUV6OFNmZndZ?=
 =?utf-8?B?c3Y4S0xEbWs2cFVibzBjaU5HVWlyS3hDODFkOGVoQXV6dFNmSk1aVVJWNWNY?=
 =?utf-8?B?TnZHd0dLeHMrT1JLS1BIb3lTWU9od2NONmFQc1RMWUJTcTVxMHNmSWRYWjVV?=
 =?utf-8?B?OG5YcU44eEdmbk9mWno5NXFyMFZ2Z0g1V1VTRUUvZ2VZL1h4QXhtOG80azI3?=
 =?utf-8?B?S0FzaFIxR2k1UUt4OTMxcUxSNXhybndBNGJYeTROYkZGUmpILzk3ZldzQlZj?=
 =?utf-8?B?b3Nud2g5MEpMb0lEbDg3a1NDdTdyV2ZwdnQyUzhSUWpJMndhajh5K29pRERP?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFA5A50A7828354EA54C54E355CC5CC7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8327.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7be0d02-7207-462e-5fb4-08dde6f1a9f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 11:46:16.8694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aW4+F7vCuMUzJIW9hZGesKiwy0IhHnODmFNb/Ud3TKhMCEFfM4h1mY9eetLOmJRglgDW6hFI0QgEYzHfIriZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7892

SGkgSnVsaWVuLCBNaWNoYWwNCg0KT24gMjguMDguMjUgMDA6NDIsIEp1bGllbiBHcmFsbCB3cm90
ZToNCj4gSGkgTWljaGFsLA0KPg0KPiBPbiAyNi8wOC8yMDI1IDEyOjQ0LCBPcnplbCwgTWljaGFs
IHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAyNi8wOC8yMDI1IDEyOjQ4LCBKdWxpZW4gR3JhbGwgd3Jv
dGU6DQo+Pj4gSGksDQo+Pj4NCj4+PiBPbiAyNi8wOC8yMDI1IDEwOjQ3LCBEbXl0cm8gRmlyc292
IHdyb3RlOg0KPj4+PiBPbiAyMi4wOC4yNSAxMToxMiwgT3J6ZWwsIE1pY2hhbCB3cm90ZToNCj4+
Pj4NCj4+Pj4gVGhlcmUgYXJlIGFscmVhZHkgYSBmZXcgcGxhY2VzIGFkdmVydGlzaW5nIHRoZSBT
TU1VIGNvaGVyZW5jeToNCj4+Pj4gMSkgc21tdS0+ZmVhdHVyZXMNCj4+Pj4gMikgZC0+aW9tbXUt
PmZlYXR1cmVzDQo+Pj4+IDMpIHBsYXRmb3JtX2ZlYXR1cmVzDQo+Pj4+DQo+Pj4+IEFsbCBvZiB0
aGVtIGFyZSBiZXR0ZXIgcGxhY2VzIHRoYW4gcXVldWUgc3RydWN0ICh0aGF0IGFzIHlvdSANCj4+
Pj4gcG9pbnRlZCBvdXQgaXMgbm90DQo+Pj4+IHNwZWNpZmljIHRvIGNvaGVyZW5jeSkuIEknZCBz
dWdnZXN0IG1heWJlIHRvIHVzZSAzKSBhbmQgcmVtb3ZpbmcgDQo+Pj4+IHJvX2FmdGVyX2luaXQN
Cj4+Pj4gaWYgeW91IGRvbid0IGhhdmUgYWNjZXNzIHRvIDEpIGFuZCAyKS4gQWxsIGluIGFsbCwg
cHJvdmlkaW5nIHlldCANCj4+Pj4gYW5vdGhlciBwbGFjZQ0KPj4+PiBmb3IgY29oZXJlbmN5IGZs
YWcgc2VlbXMgYSBiaXQgdG9vIG11Y2guDQo+Pj4gwqAgPiA+DQo+Pj4+IEZpcnN0IG9mIGFsbCwg
dGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgcmV2aWV3ISBJIHdpbGwgY29uc2lkZXIgdXNpbmcNCj4+
Pj4gInBsYXRmb3JtX2ZlYXR1cmVzIiBpbiBuZXh0IHBhdGNoIHZlcnNpb24sIGl0IGxvb2tzIG1v
cmUgDQo+Pj4+IGFwcHJvcHJpYXRlIGFuZA0KPj4+PiBzaG91bGQgYmUgYXZhaWxhYmxlIHdpdGhp
biB0aGUgd2hvbGUgZHJpdmVyLiBBbHNvLCBJIGJlbGlldmUgDQo+Pj4+ICJyb19hZnRlcl9pbml0
Ig0KPj4+PiBpcyBhbHNvIE9LLCBzaW5jZSBJIGhhdmUgbm8gbmVlZCB0byBjaGFuZ2UgaXQgKG9u
bHkgY2hlY2sgaWYgY2FjaGUNCj4+Pj4gbWFpbnRlbmFuY2Ugc2hvdWxkIGJlIHBlcmZvcm1lZCku
DQo+Pj4NCj4+PiBJIGhhdmUgdG8gZGlzYWdyZWUgd2l0aCB1c2luZyAicGxhdGZvcm1fZmVhdHVy
ZXMiLiBGbHVzaGluZyB0aGUgDQo+Pj4gcXVldWUgaXMNCj4+PiBhIHBlci1TTU1VIGRlY2lzaW9u
LiBCdXQgbG9va2luZyBhdCB0aGUgY29kZSwgSSB0aGluayBwYXNzaW5nIHRoZSBTTU1VDQo+Pj4g
dG8gdGhlIGNhbGxlciB3b3VsZCBsb29rIHdyb25nICh3aGF0IGlmIHlvdSBtaXN0YWtlbmx5IHBh
c3MgdGhlIHdyb25nDQo+Pj4gU01NVT8pLiBTbyBJIHRoaW5rIGEgYm9vbGVhbiBwZXIgcXVldWUg
aXMgdGhlIHJpZ2h0IGFwcHJhb2NoLg0KPj4gRm9yIG15IG93biB1bmRlcnN0YW5kaW5nOiBkb24n
dCB3ZSBjb25zaWRlciBTTU1VIGNvaGVyZW5jeSBnbG9iYWxseSwgDQo+PiBub3QgcGVyDQo+PiBT
TU1VIChoZW5jZSB3aHkgSSBzdWdnZXN0ZWQgcmUtdXNpbmcgdGhlIGdsb2JhbCBmbGFnKT8NCj4g
PiBXZSBzZXQgdGhlIGNvaGVyZW5jeT4gZmVhdHVyZSBpbiB0aGUgZmxhZ3MgaWYgYWxsIFNNTVVz
IHN1cHBvcnQgaXQuIA0KPiBEbyB3ZSB3YW50IHRvIGRpdmVyZ2Ugbm93IGFuZCBkbw0KPj4gdGhl
IGZsdXNoaW5nIHBlciBTTU1VPw0KPg0KPiBUaGUgdHdvIGNvbnRleHRzIGFyZSBxdWl0ZSBkaWZm
ZXJlbnQuDQo+DQo+IFdlIG5lZWQgdGhlIGdsb2JhbCBmbGFnIHdoZW4gY2xlYW5pbmcgdGhlIHN0
YWdlLTIgcGFnZS10YWJsZXMgYmVjYXVzZSANCj4gd2UgZG9uJ3QgYWx3YXlzIGtub3cgYXQgYm9v
dCB3aGljaCBTTU1VcyB3aWxsIGJlIHVzZWQgZm9yIHRoZSBkZXZpY2VzIA0KPiBhdHRhY2hlZCAo
dGhpbmsgUENJIGhvdHBsdWcpLg0KPg0KPiBJbiB0aGUgY29udGV4dCBvZiB0aGlzIHBhdGNoLCB3
ZSBrbm93IHRoZSBxdWV1ZSBpcyBvbmx5IHVzZWQgYnkgYSANCj4gZ2l2ZW4gU01NVS4gU28gaSB0
aXMgYmV0dGVyIHRvIHRha2UgdGhpcyBkZWNpc2lvbiBwZXItU01NVS9xdWV1ZSB0byANCj4gcmVk
dWNlIHRoZSBudW1iZXIgb2YgY2FjaGUgZmx1c2guIFRoaXMgd2lsbCBiZSBwYXJ0aWN1bGFybHkg
aW1wb3J0YW50IA0KPiBmb3IgdGhlIDItc3RhZ2UgU01NVSB3b3JrIGJlY2F1c2UgdGhlcmUgd2ls
bCBiZSBhIGxvdCBvZiBjb21tYW5kcyBzZW50IA0KPiBvbiBiZWhhbGYgb2YgdGhlIGd1ZXN0IChl
dmVyeSBUTEIgZmx1c2hlcyB3aWxsIGJlIGNvbW1hbmQpLg0KPg0KPiBDaGVlcnMsDQpUaGFuayB5
b3UgZm9yIHRoZSByZXZpZXcgYW5kIGNvbW1lbnRzLg0KDQpJIHdhbnRlZCB0byBmb2xsb3cgdXAg
b24gdGhlIGRpc2N1c3Npb24uIE1pY2hhbCwgSSBzdGlsbCBuZWVkIHRvIA0KY2xhcmlmeTogZG8g
eW91IGFncmVlIHdpdGggdGhlIHBlci1xdWV1ZSBmbGFnIGFwcHJvYWNoPw0KSWYgc28sIEkgd2ls
bCBzaW1wbGlmeSB0aGUgaGVhZGVyIGNvbW1lbnQgdG8gIklzIG1lbW9yeSBhY2Nlc3MgDQpjb2hl
cmVudD8iLCBhZGQgSnVsaWVuJ3MgUkIgdGFnLCBhbmQgcG9zdCB2Mi4NCg0KDQpBbHNvLCB0aGFu
ayB5b3UsIE15a29sYSwgZm9yIHRoZSB0ZXN0aW5nIGFuZCBUQiB0YWcuDQoNCi0tLQ0KDQpCUiwN
Cg0KRG15dHJvLg0K

