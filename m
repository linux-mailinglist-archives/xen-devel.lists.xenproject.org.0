Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C495B3839F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096028.1450844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urG6V-0002KO-OV; Wed, 27 Aug 2025 13:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096028.1450844; Wed, 27 Aug 2025 13:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urG6V-0002Hs-LZ; Wed, 27 Aug 2025 13:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1096028;
 Wed, 27 Aug 2025 13:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urG6U-0002Hm-Ih
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:22:18 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da39dbcf-8348-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:22:17 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU0PR03MB8670.eurprd03.prod.outlook.com (2603:10a6:10:3ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 27 Aug
 2025 13:22:14 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 13:22:14 +0000
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
X-Inumbo-ID: da39dbcf-8348-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vba37Uk/1hQMb5voSJTIGInXQfF/uirv2QNX6SgRTOzhObd+5blLfL74xEAYnZEdmOKu+00v2DN986TfU+wWaXU8c9Nu598uc5R9e+XiH5NTxDBoBfwI4B/ZtiMhwAnp7V6Eoc9pWiOlSPYxWk39kBJAJUfysm4wAG0v0w5lRzr78wobOcV/Smus7ISwnX3FIw3VK+rUTamtYhN3j7QV9xhc5t8CTgGqbJdiZxCo2EQcJTfFj0IkNGcDshTZ1vT0lyA9aeaGlk6D2vrbypGS2OohLUXdSS/iMCIQ3JSfypchfA14UgwSQcT2NERFwtAxSm4qyNOLBAB2ayAQh7/fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UMzgQsEmCHV6Uq+B6EH0fbibamMVFBenlnQ6uAobVM=;
 b=DQUyFu/Qm+/gDVJ02BCK7muptJkG+blKjQ2igR4p7cr7JeXMH8Co1OKcYMJ2ALwzp4fJ0ZWlK7V3amCiYj65cqgMkVjuvN0bB8+UVa3fjPYuO+JIRLVvCgfIxnN4sXXOGq/vMNOGRfZc4hHfq+ADoPMIZFuXYCI1wSg5gonbzavTPE5iOuMovPwkrinfcwYmi8Y/yneo8YkdHjvfWpO9GsYEODC5TwAikMBjIwcaRlkAuO9ukewt6wIjrdBua1C/yjHAH1tOh/z5E20DhacpDKJZ06+3tTi31DloyBuZUhnTdbq7A8uzBNNj5ibI4rHFKx1CiXzdO8klNY9Qmrs6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UMzgQsEmCHV6Uq+B6EH0fbibamMVFBenlnQ6uAobVM=;
 b=Gk5dxpr+EZr/dfrlkF/JOnl6II6rwTsf8Fbm+KSGnkEjwSiTgcpVMM9J4KcbL8RfrXdmPa9hZnpJq4iz0rKTCDyzkcU1SRtUTksR1FO9g7mVYoTpeSgdIJa8AV7X15ndYNz57I5fxnRJK3RTexJGC3kvJSco41oAdW/Wy7fuGJADNlN3yJ3wbXoickhhM8Bs4ZJHn1JhEW5mGr+UOiixX9SKGlJ2llcOH3d97WN6OJjUkQ2+2pVKrfdpsw+yb25PpZB6UXakQVmBvXe85X9I7mu0lrE0TkzepB15M4jfq4PmEiNSrXW4QktTp97MPQkfIJH1cnS2Qwqpw8E2gzjxqA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcFpJ/t39ssss6a0y8SPAQeD5PELR2DE4AgABxwIA=
Date: Wed, 27 Aug 2025 13:22:13 +0000
Message-ID: <1d26daaf-f50d-4199-8c98-520f9828e26e@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <8b42416d779537d6a0ac4902cabc549253b9da9d.1756216943.git.leonid_komarianskyi@epam.com>
 <54db12d6-cee3-4e5a-8fc7-d7686dc52d9d@gmail.com>
In-Reply-To: <54db12d6-cee3-4e5a-8fc7-d7686dc52d9d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU0PR03MB8670:EE_
x-ms-office365-filtering-correlation-id: bf44ed59-26ff-4e11-f648-08dde56cbc97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDdUSjB6UGkzK1dMdmFVbFc3ZUV1RXZwR3JYVlMrN1lBTU1XNFc1RHMrVkFN?=
 =?utf-8?B?Q2ZZOTVsd3ZNYzhUNmlkSC9lNExjVFI1MEo2T1pMSHBrb2tpRGNQZ2gzKzN2?=
 =?utf-8?B?eDVYSHRyRWFNVTFpTDVKMFRjZDBLZkM0MGRSWWUzV05MRVhLL3F0OG1IaW9T?=
 =?utf-8?B?MkppS3dUbXhVakF3NmpUbmZXM2dBcXF1djRabWM4TUkrejJMelo5REhBMXIx?=
 =?utf-8?B?QWxiM1FyRUgxN3doRHRLVGd3NDhSenBEd0hGRis2NUtFSWRhQXBRTENGQWo0?=
 =?utf-8?B?dXNlank2OUxwanVOMnVka2JUdmNkL0loL25DcnVGZkRkRElUTDRpL2JvNml6?=
 =?utf-8?B?UytsbmVERjRwVnlJMzIvWWw1YXovVUtJNzZkb0FzMERlajREWjE0d0tVaTZ0?=
 =?utf-8?B?YWZjL2xKRUFDMTI5VWhDeWlZMXhITSt1VWxoRzdIWThyaDdodTNwdVhGUlcw?=
 =?utf-8?B?ZFJzMW1FS01ka2RWR2NYR0VYM2pjUVJzdWdqRW40dlRRSGpXVmowZVh3SytW?=
 =?utf-8?B?Sm5tdFovcHBQWVNiN3lISWk1S1I4ZGU3Q25XR2dTRVFUcm5IUkRRRFBxM0dN?=
 =?utf-8?B?M2tUSjdXcitaUnByRXVTZFlwYTZtZFhxdS83WGNFdEJIZmdKOXJvbkZqTmw5?=
 =?utf-8?B?Z21hN1NDVENjdS9mdWVIeDJEajVvTjBhVlk0Uk1YcnprbjZKanlhWmhBVzFD?=
 =?utf-8?B?QU1XUFdaSUZ1UUc0bUYzbVpIZHRBZmhyK2ZNMEpaQWtWRWtFYVF6dFMyWkcy?=
 =?utf-8?B?U0c3OXk5S2Z5TTVWWnMrVTQ1NVo3TlB0MUFBWVhYSmVQd2FTNXVoMERLL052?=
 =?utf-8?B?eGNDd0dkVUlZS21BMkZhNUhKcjR5cE5hVlZ3OGptaWttb1NsOVJ2YlFobTg3?=
 =?utf-8?B?cU03cjAybFI5RnNkYlg3WnZXdFk2YnRsWjFMcUxjS1J5QXBFRTRGYkZwQzVQ?=
 =?utf-8?B?OUdackRhdm1qMmNoOVlhK29FWVp1THpSQTZsaXN6alJjWFVTcFkzOGhqMjhl?=
 =?utf-8?B?emdNOTU0MzJ4cEE4dDAzOVlKajZaampyOVRGVmc5WVJYMUlGbDU4aUpUNHov?=
 =?utf-8?B?dmwrRHRxYUpXSEhSRGFScytMMnhCRS9qc2ZHZXljOG8xRDFsUDlsK2pWd21W?=
 =?utf-8?B?SVoxWHoyTy8wRDBtenFDTDdwY2ZIbFY0UkVBeGpGUmJpbzZKRnlpdFdnVWRJ?=
 =?utf-8?B?STJJYlMwZUV4WFJNaElzVk5KZ0xDRHdoN2NNdklLaVRzbldQdFAxSnJDV255?=
 =?utf-8?B?dkhyeGZId1NqVVo4RWFIUWdySnNOcnQ2MUozZWJCNFprMk5xYXdaUVo4UnVQ?=
 =?utf-8?B?a3B6SmdvNWl2NTNvNEJGdHFNcnI5RDYxeVQ2TENCYzhaUjhHVzB4US9uY1JT?=
 =?utf-8?B?RmY4ODEwOXRYMHBwK3RUWUVxa2tYaFNvWGtheFo5Sm9FQjVqTndHYjVFOUg0?=
 =?utf-8?B?QS9HNnZqLzlVeG1SZEVvYTRUSWREdGlQN2FTMzlOcjhQWVFiTEQ5NGNsdTFF?=
 =?utf-8?B?T2NoQ0F6YjF0anpxUlBFZVNVZXJ5cDJvZkNuT0lyK2RaMU9xNTBmTENvOEdr?=
 =?utf-8?B?TXpaR2QwUklabDJoNGFkNU5UUThrRkg4TndyOGlyUUlsSytYdFdSUC9CVDhs?=
 =?utf-8?B?dmU3bWdVbWI1d2hIdjZjdkNDZ1JOdXU4MXJqTUQxWmIwb1lQTkxYZUQwalYv?=
 =?utf-8?B?dmlpWUpER0FEQUhKTlpwcWF1dnNJMHBhL1BtOUZvcmJnSXMxK0k5WjQydzdM?=
 =?utf-8?B?bUU4WGowb1FHRG1IUlJneGVwWEJqeTBPVHdld3VBUG11dWZrVy85K3IxclZG?=
 =?utf-8?B?T3ZYMEZxV0JBeVhNaE5ZR3lqUFlUYWlmekw4YXFac0lrVDJoNkNvODA2UWlV?=
 =?utf-8?B?a1FQczFacy9abDZFVEhNd1Q2TU11Q0NXV3BPQnZlbTdyQ3p0UXpCSzByN1cy?=
 =?utf-8?B?M0NER2h3c2wwcGdEbk90MGdkWml4THNzakhNWjlkdkpmNW41VGVIS2VYUExE?=
 =?utf-8?B?eWdVRjc2Z1pnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEI5VUQ2eEo0MGhiWjdxME5WMDE2Q04xNWQ3bUYrcWgvMjQ4ZzAxSFo5Vmxl?=
 =?utf-8?B?dVc2UVBPRnVpMUMvZWIvWUlNbDhvUk9YaEsrZUhvalZRTmxjVHoyZStsdGZ6?=
 =?utf-8?B?RU14Q3F4YTM4TWNOaUo2UnphK2UzQkdoWkQ1QTFBWEJyLzJVN01hMmdEN2JL?=
 =?utf-8?B?ZUtqRXFleFBzL2h2QnUzaGZrdnNLTVNTelNzUFBRdXpmYlpSa295ei9hWFVy?=
 =?utf-8?B?N0tMZWVkMWJ1WUFURzdLelhmKzgzNmE3Q0Q0YkkzaS9JZGZjWG5QRFhRV2Jh?=
 =?utf-8?B?Yk9VNVNpYlRNTzQvY1ZYUGpUaEJyWE5iSkNwSFZXRDF3Ri96SEdNUk12YVNr?=
 =?utf-8?B?bEZBQlVIc2hNQW12aDJMcUtGTVVwdXBhUmdRbGlFdm11VHRYQ3U5eERlcHlS?=
 =?utf-8?B?T0M3K2RHeHB1aUZHamhIeFB4RGtlQnk1ZTl0RG5VcGFTN1Q5cWt3S3F5TlBG?=
 =?utf-8?B?U0xSNFNFVm95Y0x2bmRXakU4M2kra08rV2NBNTkzTkhhK0U1OVI3RlBtZXA0?=
 =?utf-8?B?Nm5IazJVeTRpTld3WlIxUExCalpDWkM1d2lIWTJjQ2V5bGZXMWRnZERJNE45?=
 =?utf-8?B?Vk5JSHZhYXdTY0NaSXkxWVJNTE1LZVdxMGRiZDV6dThrcWRVUjZmWG1UUlB3?=
 =?utf-8?B?MGhucktXZkdNTHAvR3FNcXhTc3lxZlNDL0Nqa0xKMHFzVUdueDVSUW1sYitK?=
 =?utf-8?B?OW1zMDV1NFpqZFplSlBHMnhyQ2RES2twaWJ2T3FYU0lzTVhzUDRCSzJ1UGxO?=
 =?utf-8?B?Q0J3aTdobzFZc1Y3SjROVG8xOHp4aitSTEk0cHd3LzhwVlowejU3ajdmN1I5?=
 =?utf-8?B?d3dOc1NGaWluQm1lVzkvbU1FNWs4RUNFTldKQUQ2RVJtOXBRL3FTRGd1WDc5?=
 =?utf-8?B?RkRtbGJ1bElaUTJabG9WSDkwU0t6aGpIZmU2K0tHcUpCSFNIdjBxZWFNVmFZ?=
 =?utf-8?B?NmdhWThxL2xZNDVHK2xUaGFJbU0wWFA0enEweEppaWM5OG1DeUhvV2x2ZzJq?=
 =?utf-8?B?MEhMbVowUXR2bjlHTjRaS0psamt6dU9IR0hsR2FhdmRwUWdvYmd4aWdwWll3?=
 =?utf-8?B?TUtlbElnQUJHSU5JdzNuSXd6YjcxTkUzdUJGTmU5eHpoNHJIWHJjM0tSTDZv?=
 =?utf-8?B?YUxyWUFrdHpCYmZiMWFmZVBkU3h5NGtIUlVTZWc0QWRlQlVLQVJ2TXZzMDUv?=
 =?utf-8?B?S0ZnNEZhUW5QMHlrdFJRSXQzVXVCZXV6S01yTnBKdndBdHRJUkdHTkVuWHZY?=
 =?utf-8?B?bzl4TzFCOXpUMjlRK2VJYVlhV09XUUN1QUExeW55VEJvUHk1T3ZBdXVCRnhG?=
 =?utf-8?B?L2p0WjdkaTE0V0cvbHh1UUpielQ1NG9lK041TGF3RlZvVFREb2NoYi9uL3Za?=
 =?utf-8?B?R1dPc3Rmcy8rdTlFaEprS1U1WVgrUm5JQ3ZYRFV1Wk90eUNVTXJwWGJWZFJ5?=
 =?utf-8?B?ZVdvRzYzQkVPVWV0YTdYUVUwMXFiK2dsM2RSdFlpK2dXaDdUUG9TeStJT1FO?=
 =?utf-8?B?Y1NzQmdxSWwzOGJBTnJmSTV0WHJpNUZ4bEs2NXdWeTJyRjRWZUp4RWM5c09T?=
 =?utf-8?B?OFRZeEtOR0ZXNlRqRU5LYlYxUkNkMXl0UWYyUzBXNG8wYW1BNmRQampqRjRL?=
 =?utf-8?B?VU9FcndQTTF5Qnk1QzNjVWtrVEg4aDhyVnQvaURwcFNoemlkWFJnbHJCcFhm?=
 =?utf-8?B?aWIrZ2MrcXY2YWVZc1lSZ09OVUVSUnA5YlEzMXVNTm9Yc2lhdC95WEZQbkU1?=
 =?utf-8?B?emNobzNXRmxGUTBIY0lQRVVGdmV6WHJoZ2ZBczREbi95a2tNQUdldGxlVWI3?=
 =?utf-8?B?VVJLZFUyVEh1ZVorTktCNURQQlg5Qzc4RThYOGlLc1BkR21pNmkxLzdSeDh3?=
 =?utf-8?B?bmc1OUtHVWw1OFpyMXRQMW11WmJQRllta2tLVU95NHh4bUVHdnpMWk16UVJa?=
 =?utf-8?B?Tlo0V0ZGbWM4UngwRkUxUDA0ZEllTHA4bFNmMW56U0NtWWFEU3FZTDBDeEsv?=
 =?utf-8?B?dmZNZHFNVFpMeE9Uc2x4UWZIZTArRklwQkJGK2xSSmpTZmlGM2xhSmN3VXdh?=
 =?utf-8?B?MHdsdk9KZERUUGdBYlh2UUd2T1hkZXZjbFEvTjlRK0ZDNE9paGhUOXlkOFVa?=
 =?utf-8?B?SzBuUURYZUwyZzd5VWs5MHlOV1pFMm53bGU0ekJFTEowYXhWZ2tJaUhZUnNH?=
 =?utf-8?Q?VzTWBcLNHsX1Sgc31XfFjoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8D696E2A642314E917E66735EA25CDC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf44ed59-26ff-4e11-f648-08dde56cbc97
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 13:22:13.9644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPs/YRittKq+vpUWndoiv3krfzU2Nd6LUeQdNOjS8KHBXEqEQEtivocBnUfcwFZ9wln5vbaTy6dxop3d7A3vOVtJkEi5wQG38NkOoSPKWQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8670

SGVsbG8gT2xla3NhbmRyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAyNy4w
OC4yNSAwOTozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+IA0KPiANCj4gT24gMjYu
MDguMjUgMTc6MDUsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6DQo+IA0KPiBIZWxsbyBMZW9u
aWQNCj4gDQo+IA0KPj4gQ3VycmVudGx5LCBYZW4gZG9lcyBub3Qgc3VwcG9ydCBlU1BJIGludGVy
cnVwdHMsIGxlYWRpbmcNCj4+IHRvIGEgZGF0YSBhYm9ydCB3aGVuIHN1Y2ggaW50ZXJydXB0cyBh
cmUgZGVmaW5lZCBpbiB0aGUgRFRTLg0KPj4NCj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHNl
cGFyYXRlIGFycmF5IHRvIGluaXRpYWxpemUgdXAgdG8NCj4+IDEwMjQgaW50ZXJydXB0IGRlc2Ny
aXB0b3JzIGluIHRoZSBlU1BJIHJhbmdlIGFuZCBhZGRzIHRoZQ0KPj4gbmVjZXNzYXJ5IGRlZmlu
ZXMgYW5kIGhlbHBlciBmdW5jdGlvbi4gVGhlc2UgY2hhbmdlcyBsYXkgdGhlDQo+PiBncm91bmR3
b3JrIGZvciBmdXR1cmUgaW1wbGVtZW50YXRpb24gb2YgZnVsbCBlU1BJIGludGVycnVwdA0KPj4g
c3VwcG9ydC4gQXMgdGhpcyBHSUN2My4xIGZlYXR1cmUgaXMgbm90IHJlcXVpcmVkIGJ5IGFsbCB2
ZW5kb3JzLA0KPj4gYWxsIGNoYW5nZXMgYXJlIGd1YXJkZWQgYnkgaWZkZWZzLCBkZXBlbmRpbmcg
b24gdGhlIGNvcnJlc3BvbmRpbmcNCj4+IEtjb25maWcgb3B0aW9uLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNreWlAZXBhbS5jb20+
DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSB1c2UgKEVTUElfTUFYX0lOVElE
ICsgMSkgaW5zdGVhZCBvZiAoRVNQSV9CQVNFX0lOVElEICsgTlJfSVJRUykNCj4+IC0gcmVtb3Zl
IHVubmVjZXNzYXJ5IGNvbW1lbnQgZm9yIG5yX2lycXMgaW5pdGlhbGl6YXRpb24NCj4+DQo+PiBD
aGFuZ2VzIGluIFYzOg0KPj4gLSBpbnRyb2R1Y2VkIGEgbmV3IGRlZmluZSBOUl9FU1BJX0lSUVMg
dG8gYXZvaWQgY29uZnVzaW9uLCBsaWtlIGluIHRoZQ0KPj4gwqDCoCBjYXNlIG9mIHVzaW5nIE5S
X0lSUVMgZm9yIGVzcGlfZGVzYyBhcnJheQ0KPj4gLSBpbXBsZW1lbnRlZCBoZWxwZXIgZnVuY3Rp
b25zIGVzcGlfdG9fZGVzYyBhbmQgaW5pdF9lc3BpX2RhdGEgdG8gbWFrZQ0KPj4gwqDCoCBpdCBw
b3NzaWJsZSB0byBhZGQgc3R1YnMgd2l0aCB0aGUgc2FtZSBuYW1lLCBhbmQgYXMgYSByZXN1bHQs
IHJlZHVjZQ0KPj4gwqDCoCB0aGUgbnVtYmVyIG9mICNpZmRlZnMNCj4+IC0gY2hhbmdlIENPTkZJ
R19HSUNWM19FU1BJIGRlZmF1bHQgdmFsdWUgdG8gbg0KPj4gLS0tDQo+PiDCoCB4ZW4vYXJjaC9h
cm0vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKw0KPj4gwqAgeGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2lycS5oIHwgMjYgKysrKysrKysrKysrKysrKysNCj4+IMKgIHhl
bi9hcmNoL2FybS9pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDUyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
S2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+PiBpbmRleCAxN2RmMTQ3YjI1Li41ODEz
ZTViMjY3IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9LY29uZmlnDQo+PiBAQCAtMTM1LDYgKzEzNSwxNSBAQCBjb25maWcgR0lDVjMN
Cj4+IMKgwqDCoMKgwqDCoMKgIERyaXZlciBmb3IgdGhlIEFSTSBHZW5lcmljIEludGVycnVwdCBD
b250cm9sbGVyIHYzLg0KPj4gwqDCoMKgwqDCoMKgwqAgSWYgdW5zdXJlLCB1c2UgdGhlIGRlZmF1
bHQgc2V0dGluZy4NCj4+ICtjb25maWcgR0lDVjNfRVNQSQ0KPj4gK8KgwqDCoCBib29sICJFeHRl
bmRlZCBTUEkgcmFuZ2Ugc3VwcG9ydCINCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBHSUNWMyAmJiAh
TkVXX1ZHSUMNCj4+ICvCoMKgwqAgZGVmYXVsdCBuDQo+IA0KPiBQbGVhc2Ugb21pdCByZWR1bmRh
bnQgbGluZQ0KPiANCg0KT2theSwgSSB3aWxsIHJlbW92ZSBpdCBpbiBWNCBhcyBpdCB3aWxsIGJl
IGRpc2FibGVkIGJ5IGRlZmF1bHQsIHdpdGhvdXQgDQpleHBsaWNpdCBzcGVjaWZpY2F0aW9uLg0K
DQo+PiArwqDCoMKgIGhlbHANCj4+ICvCoMKgwqDCoMKgIEFsbG93IFhlbiBhbmQgZG9tYWlucyB0
byB1c2UgaW50ZXJydXB0IG51bWJlcnMgZnJvbSB0aGUgDQo+PiBleHRlbmRlZCBTUEkNCj4+ICvC
oMKgwqDCoMKgIHJhbmdlLCBmcm9tIDQwOTYgdG8gNTExOS4gVGhpcyBmZWF0dXJlIGlzIGludHJv
ZHVjZWQgaW4gR0lDdjMuMQ0KPj4gK8KgwqDCoMKgwqAgYXJjaGl0ZWN0dXJlLg0KPj4gKw0KPiAN
Cj4gW3NuaXBdDQo+IA0KPiANCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkDQo=

