Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4EC59FDF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 21:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162140.1489907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJe7J-0005ty-JH; Thu, 13 Nov 2025 20:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162140.1489907; Thu, 13 Nov 2025 20:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJe7J-0005qt-GZ; Thu, 13 Nov 2025 20:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1162140;
 Thu, 13 Nov 2025 20:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJe7H-0005ql-I5
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 20:40:27 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbefa002-c0d0-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 21:40:26 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB10062.eurprd03.prod.outlook.com (2603:10a6:800:1cd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 20:40:23 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:40:23 +0000
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
X-Inumbo-ID: fbefa002-c0d0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKOhSGYorot0Ajb9JiWaWhGkmiyArQFTFt7RQlwNL50xRt2mANQvML33aOSS7UcG9ka+pAIsU1Ixm+QuG59VGMmv/B2G9EFujNqeK15gr6luGceQo6VADkxNt1r5NaMhv9iZt5QzDOYCCPx/KBHKiFhFq/Fqqfjz38EqbCrSqJiU4EOVokxQ7Gw/xlmsVEGRXKkAACw61ZymGVrjS2i3eJyFcRwwXK8TWphuyjnacVnrV4wfnoz8js9/vVzUTQaZR30HWqmbUuYDAwJW9NVUmkXSwGmRCe3LMsjp1qCpA6cpusQs07LBIckj3S5PWLKLMmeWIXw/t2UyKajpgUsbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQzzAAYw9zTW2yfYSVKXWyR8tCZ+w6FInkL57yJpFYM=;
 b=klKOiS11Wm8u6P8xXku3ZhrHvVaBSfbL1bX43VIvXXG7HyZgUcfJSb4lKvJey0z8ANc3uHettYYbg9SEaVIJRNBNetPWbAJugXMck7qd6yLTJ/LD8rCXL/kiPYhtAVr4RzY2RMd5jkACpMfy57sraCjoj78f1SCdZ4kg23lwLIBI4pg4JrTUK3A4Oxy/qZDXaoS7yUISXJ+i5i4x03GAMs1+QhUMPHPqBNqaTVXII1PHAUcfdmPxmOO/hsnDGVfaon5WgDMStCy5e84T/YlkSD8TiyyXkHsgg4zdmjPlJFs/q36fdn8qt1nN+bfqg6IzrGyhhHVDTucHcXqaryh6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQzzAAYw9zTW2yfYSVKXWyR8tCZ+w6FInkL57yJpFYM=;
 b=YR2lsSOfXnMj/HtDdNkxON1oveZcj7z3RuKEO0x5tgfLSqIPRDKDnrRjPGTC7Qzoe+UazIzmZVrOdxhpv7KBBZ9cNj9grRAa6Tyo7025GRoZitrMVKgFhnbSCYwLlvZBu2P2R+LnQwUFSoCJPdYhVw7qHm5RmvGCdTLXViK8gP+gMbPkg3xW/JNl7IUduTgzVOwqD/MgZ7Sx/vBhp8PzxCbTbW3l35QslHS40Nv1WZDunsAw8rpRz2Y2t0rkuqy/XRyx0r6ylSgu/D2BvactECk039YnDtXWyQlvoQbFdJJr3vLAskUD7NK8znFgY2lpxwP7TWO6xkXBLVZAPO7H4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <cbffc389-a97c-4075-9106-b2a7a90b52cc@epam.com>
Date: Thu, 13 Nov 2025 22:40:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251112202442.3879997-1-grygorii_strashko@epam.com>
 <a634c192-9ea3-46d9-a087-f0f48a5c2494@suse.com>
 <9c4294ec-906d-4607-8f7d-b5b1bb7e74f2@epam.com>
 <71334f75-d50b-43f4-909b-a27b288ea1aa@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <71334f75-d50b-43f4-909b-a27b288ea1aa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI1PR03MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: f9eed0f6-b934-4616-2b37-08de22f4de66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajc1QTRDcGYrTUdPWENyeDAycEEzZ2dERWFmcTJJekR4M2ZDR2x0QmtoUG14?=
 =?utf-8?B?OXRka0lKTmpDa25zYWdEc0gwK0Mrc1ZydFY5ek5reU9kZmdDdVZsK05Hc1Vw?=
 =?utf-8?B?VUkzVlJjUFFRTjRNN3AzZHB6ZkJXU0hrYTVUN3NRWm1mN1VHWTdkY25la0ow?=
 =?utf-8?B?UjdmS1lhYzhnVmthTGt0TzVDTGQ1dXNObkZnMHZ3M29CaG1hV0lEMW5ndUxs?=
 =?utf-8?B?ajhCRkZCdXJpQ1lsaW9sUitBVC93ckNHQS84UHJDejlCTWRFQm0zbFoxY3Bw?=
 =?utf-8?B?WUlPajZpVXRBb0xhanRkeFZVcUtRV0dYYXNEWmlnOUhmTWdxZDFjM2RQMnJl?=
 =?utf-8?B?aU00QWdaOU5WbmRsMWlwanhBSGFYcGtFK0FyZU84ZFJLWXpTQVZRME14dXU1?=
 =?utf-8?B?YTA3MzdMSjFUOVo4MnlRcGdmb1hHOXFLVDdlYjA3OTZBaGFoeWdvejU2ZTRh?=
 =?utf-8?B?OFRqMHdGd2NRSVExRFJaZTlySEdUZmRGczgyZTRhb3dFSk56SVVIUGlwaHNy?=
 =?utf-8?B?UC9Xd1N4OG5ualNLakJYbG90ZFg4dWZML1BIajg2NldOV3o5SG5sUTM2SVJK?=
 =?utf-8?B?Tk01TVR1RXc3RmJIdEJSOW8wY05QWUJ2dVNxUndWR0dwNGFwMTZ0UEJieUNi?=
 =?utf-8?B?NTA0a1JWc3haWEtzSHJsSURLcVlMVXh5a21ocmg5UWVhTURITTAyQTA4UTZZ?=
 =?utf-8?B?UXNoWEUyeitZTFYrY3FLdzB1VktLT2VlSUl6TldOOFpnTnpnSk1BaC9NYnAw?=
 =?utf-8?B?MzkyKzdMOXdUNzU1ZmJJd001TXk0NFlVbS9NdEgwM2FpNjI1QjUzRTYrdjFT?=
 =?utf-8?B?VFV6K1ptTW9jZTEyeXFSdzVXN0x3S05mQTk5RUFtaWRvbFA4NGN4ZVhJb24z?=
 =?utf-8?B?S3JYMXBEaUpueFROTXFiZmM1elZkTHgrcUg3TDQyUHd6TlBWbEMweEh3Z3lI?=
 =?utf-8?B?RDI3RGhMekZkNlRpTkVGZkNkK2R1MGZGZlVXbnlCNVVIZndjaXJna0xjYjZC?=
 =?utf-8?B?ZUNFdEJsUTIxTXgvZ2xRckhPczNDcjFMSjI1b0lQRk5mVDlwLytlcCtWek9I?=
 =?utf-8?B?RTJ0VWhqN0FEdDYrN2tCSnhibE95TFpVcFl1YjBCSkg4SGVNRzhKTnRESnFw?=
 =?utf-8?B?eFI3dkVrZ2xVZjBEWUZsS0twWGYxMFlpRlo5dlA5WDVIaWIrd3Z5TXNMK1px?=
 =?utf-8?B?blJKWWQra3ZJNndodnRhckt6Z05CNmVFYkNaWVJGVm1HS2hSVEtNRTdNVklR?=
 =?utf-8?B?KzFmS3JZOVprd0R4UzdxeEg1MkJuQzQ4d1B4VGJaaDNFYmRFeTlvdVIxaHJj?=
 =?utf-8?B?UStiVTJEQnVEWnNrd0lJWFQvakI4R2lFb0dFQlBPMTZrbWtWQ09MZkhGdUtM?=
 =?utf-8?B?aWNzZnQrSUUweFd0WE1aUEF5dzNNSFpMZVlQTW1qTDMwVXdNY1A0YXl6N2Fv?=
 =?utf-8?B?UDFPK2hDK1JVVWxkV01KZE1kOFp5ZmZmQmdxblJNL0tmSEYrZTVBeDhENFp0?=
 =?utf-8?B?U1Y4SlRpTlNrSk5BNGVuOEtGUjI5YzBpREhlcFdMelVYbTF6cFBiR3JUbjI3?=
 =?utf-8?B?aTEvbVpnRlZtek5GK1FGR1JSMUtEa1A1Z0NENE0wTUFMZHhyYU5jK0dUdElL?=
 =?utf-8?B?SEc2WDlQS1AzSmlNamYrdnB3Qlp6M1dkYlAxMVQxV242VDRqeFdBWFE0T1FX?=
 =?utf-8?B?R1dTMXJlcUMxZ3cydWNLZ2FGWFZxOS9GbXFRa09jR0phY2xsbW5ESUdCWFJq?=
 =?utf-8?B?TFdoNm1rMmNLcTlWcWNmZGx4S3JMWVIzSVV1eUhXVWt4b2o1T1dmMDBMZ2Nm?=
 =?utf-8?B?MlllM1JLSlprNUw4UE5hb3BiYnRRdG1raHlIYzdkMW9nTFZGWEJteXVkT3dI?=
 =?utf-8?B?VzBJakxPTGdxNlhpK0lERlZiNmhCKzNLS3NHT2U4N2JaanBXbGplR0tvRG1Q?=
 =?utf-8?Q?gzZ5Y3abXkn+pPHeQKN9mRtoTCmDLFy4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWhYZEY4T2p1UFNjbE0zUUUzMlE0c2tPdVg0Z3RHMjZaQnBRWktLZmROa29F?=
 =?utf-8?B?NTJoTDVEOS94UXhLNEF2TjIrcUV0eEQxYmUwNkN1RnA0R2FQblZlNUJ3bnVh?=
 =?utf-8?B?MU1vMEtJWVhudG1veWx1bHBHaVJpamNETXp0aGpnaG9kdW5DTy9LVUI2Sk9w?=
 =?utf-8?B?OWlDMjBxTmZwNkZZajBNa1A2clZjbTZ1TmN4ZEZUSFM0cm02WGNPeE1VOHgz?=
 =?utf-8?B?RVpQdWdYK2VYenU5YVcvcG9ickRYUnhvWTQ5dEJGVlR5K0N4VVVnYU5iSWJo?=
 =?utf-8?B?cmZoR2JNK2txbjJYejlaMTh6LzlVaFVnNlpsZldIOG41aFc4NGY1STJMQmlq?=
 =?utf-8?B?WFBFYW5POUFSSTJWSjVzOTlvMmM5S3JKYStKMjVaQUtvT1RoQVFTVFBzN2tF?=
 =?utf-8?B?WkdRVHJzRFBPa0J0YmQ3V0ZDQ0FuVjN6ZnlZQWVXcjJEY0drK1B1Q1ljZFNH?=
 =?utf-8?B?MU1WL3AxKzU3Vno5SDNrOVNObk1ISU5JNE92WGtwUzRKZHVVckhpUEJjdmZ1?=
 =?utf-8?B?ekNYZjk5N3FEdE5IcmhuWGVNWk0vQ1JFdE4ySVNFck8zTnNoUVdKaWplYWZj?=
 =?utf-8?B?R1BpU0Z0Y2Y3SVFCRXBkdzJMUXQwS3M2a25MWlA5WjNsSVJUUEpMaENTcmRH?=
 =?utf-8?B?bnlyVmNGSUtqVXh0RVN3QXkwUEZkVVB5ZDArbVhiamE3STFFQ0tDeEFOTjR4?=
 =?utf-8?B?eS9EWU5Xd0RHZ2FuMmpsUllsd2lJUlNzL3BEYkVKUkJmc1dRQVVMT3h1dkJn?=
 =?utf-8?B?aEN0dWpIT21JWVllTVl4ODN2RmpEYWhkSUtrNU5QbVJEKzdtUFU5U1A1cVZ0?=
 =?utf-8?B?OGJaUS9xVTVkUU90c3VXODgzamNXdUN0ZzJIOHpEQlAwZlRHMnNESEhYUWZ1?=
 =?utf-8?B?eFhaYnBQYng1WUxxVm1OSW5TREx2ODFMNmF2cVdVei8vMndVSU9CK1o4R1R1?=
 =?utf-8?B?c1p5WGhjK2N4NnM0cGQ5NkxCZ2dyS0pUSmJ2Z1BBdTNOSDdOTG5rWGNjTGgw?=
 =?utf-8?B?RnFUcHdoTWRSUzdla2Z5dHd0STB3SEJCcFdjbHVjOXRMQUFkVWhTVXY3blFO?=
 =?utf-8?B?WDFhc2d1eEJKUzJKNE5NSGM3N0xiM1Fxc053WHVwU2tWcFRvVmlvc3pvNXdy?=
 =?utf-8?B?bDRja3gwUjYxYVZCckd2bGJIU3ZTNnFDZlVUaWxTZGtqa0FxOEorMVVxVHdJ?=
 =?utf-8?B?RGJwb3AxM0VjdkhtdENZS21SRVozN1cvcThDd0EvUlBWcGc3LzBPc2VQVlQv?=
 =?utf-8?B?Q1NRaHQxWG5KQUt1WGs0VkVod3c5dFZMb1BEWU1HbVIrRUFLVFNBa0VoY2Rn?=
 =?utf-8?B?aGo5WFJYMzBWMnJ2SGwrQnloYlRyVlZBWkkydTV2VTdtUU5jTUhWZ0ZOQUpD?=
 =?utf-8?B?Y1Q1ME5WQ2Q1eXY2dXpKVGJGVEM0am1nQm5hUlJ2WWRVZ1R6N2dwRGV5UGtN?=
 =?utf-8?B?ZkNUSS9hb0pDNEFLWFZQUHo1RTA3YzVrUW9EU2tMRCt5ZTAwWlVsUjFDcDNs?=
 =?utf-8?B?RDJJMlRadlVpL3lsajYzRi9SMFljOUphOTNsMXpmSGFYbmVEMDV0Um9wVWFo?=
 =?utf-8?B?TVBHZGYvNDJrVUpMWlJxQkt5WUNhYUg1NnJpK3RIdGFHNXM5ZkRMUDNOdi80?=
 =?utf-8?B?b091ZXd0WVdkbUdlZkJDMnNROFRBd0xNbzR3L1RyVFF2Ti95NzNla2FKRXgz?=
 =?utf-8?B?TTl2ME13c1hjT2p3Z3J5R0RITVBmOGwxc0tneGl2ZVJKRHJucDVaMkxhN2dP?=
 =?utf-8?B?c2xIZy9nU3dTcmN2ZTVhd0pjYmlsbE5pQlcyemYwdWp1bkZ3d1dJRFhoZ2V2?=
 =?utf-8?B?YkRINVNwVDRJMFdiYWxSY2lnUFpxL3ZzNDJWaE43RGRKU1hZNy9vS3pJYkVk?=
 =?utf-8?B?cllkWU5zb3NXMXpBRzVkK25QemhCTG5iczUvMUFBdDF2OEVPMjAvU3JmT1NE?=
 =?utf-8?B?WWZsVjJySHpEbFVidnQveVVOSWNBSTkrc1kvWFA0MlZpRk01V1c3V29vcDZ4?=
 =?utf-8?B?VTUxZmF5b2RBWXMzQURGNUxxMDhJRWU0K1RXR3h1cUU4UzN3OW4wVGx6eWJ3?=
 =?utf-8?B?bDNSejQ5dVhnYkdoRTA2SUQ2amVpVHlDclFuUVdseUNwdEhOV01ZeVBRcFFZ?=
 =?utf-8?B?eVgrT3V0Z2l4a3Jla3k5ZzRSdzVjUnU3U1F0OGc4ZFdFaU9HNUxkRWRkOW0w?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eed0f6-b934-4616-2b37-08de22f4de66
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:40:23.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cm0A/LE8bHLuMk5iqMZ41q82agGG0Ghplo1/Z9wuK6f8LU9XXEtTAXkn0eT3RI+fIQABPnEHOBUx3dcEt/7LTT1ut+PVu/4Tne5kb3HHOXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10062



On 13.11.25 14:58, Jan Beulich wrote:
> On 13.11.2025 13:53, Grygorii Strashko wrote:
>> On 13.11.25 10:36, Jan Beulich wrote:
>>> On 12.11.2025 21:24, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> @@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>>    
>>>>        /* Check whether IPT is supported in VMX operation. */
>>>> +#ifdef CONFIG_VMTRACE
>>>>        if ( bsp )
>>>>            vmtrace_available = cpu_has_proc_trace &&
>>>>                                (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
>>>> @@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>                   smp_processor_id());
>>>>            return -EINVAL;
>>>>        }
>>>> +#endif
>>>
>>> Initially I was inclined to ask for use of IS_ENABLED() here, but that wouldn't
>>> work since vmtrace_available isn't an lvalue when VMTRACE=n. Hence why generally
>>> I think it is better to check the particular identifier in such cases, rather
>>> than the original CONFIG_* (i.e. "#ifndef vmtrace_available" here). I'm not
>>> going to insist though, as I expect opinions may differ on this matter.
>>
>> Yep. assignment required ifdef wrapping.
>>
>> "#ifndef vmtrace_available" will not work out of the box as there are
>>
>> "if (vmtrace_available)" in code. So, can't just "not define"/undef "vmtrace_available".
> 
> I meant this just for the case here, though. Elsewhere you want to stick to
> checking CONFIG_VMTRACE.
> 

I'd prefer to keep this part as is. Please tell me if you insist.


-- 
Best regards,
-grygorii


