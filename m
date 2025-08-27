Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9534B37FD8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 12:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095878.1450733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urDLk-0001LP-Ip; Wed, 27 Aug 2025 10:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095878.1450733; Wed, 27 Aug 2025 10:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urDLk-0001Is-Fy; Wed, 27 Aug 2025 10:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1095878;
 Wed, 27 Aug 2025 10:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urDLi-0001Im-7I
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 10:25:50 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31fa5ea4-8330-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 12:25:47 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB10346.eurprd03.prod.outlook.com (2603:10a6:150:169::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 10:25:39 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 10:25:38 +0000
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
X-Inumbo-ID: 31fa5ea4-8330-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxvgzzvlQSrCapQR7NiKf8NfZ5cwMIBhzR/dDO8RWfiqExp8kcllI72qgJ/qwrOUwTb5wDjCLORkHSpRkqYFl06EbBFc3uxX3SNbAzvqLbl6cV/SZ7Xe+yQpcYa9WzRUzWaFqOMuAOPHUuutRuTrHIUurPkqlaqpiWkfP/v6Z1Nq8ckOCUcfvshjLn0FbWxNnWhYpq3UOU6S+HzeaMahLgYl04eqRGNvdWUvk/kKbuJlA/BLOwtac8LKDc6wD9nfkrWoJj6Ork0BCZgTUZ3x53CWjL6ABr9mIAvcYcZwSvMDKplMJpTFTaGQuk2A8zGI5Ns8cAuBN3DsS+zwK7cpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVz+9kCFzzk9AbpzYHg+0RLhZCP55dxFvbNML80AX9c=;
 b=kb1kv4lvuK514oajtnkbwDyTg8Zp/C8bn29jcA2NqVqfaOuhPpc9quPqV+iXgiPrpy2zJRmQQrDuLx9tGnCWTl7ITwAr6Q58yqDpsRgr23gPW6j9SiuUSqWCtMyvnZLsI7DaMZYbsPYEISQdfafsZc7Nn3/6UI+DD61zdVXVUn+hXoZ6LyHvNu9khYoxWPx4M50t9Lh/t7AYZot3kiWE/OHrNgiMxhwkXdmmk2iEng9Vi/u+/4AUpRAA6ajE6E3frrdl+i9A0MM8UMFqlxmOVCynYmqBfAgh++7uE28z3QdnMoamC62tJGABN1RvHz2DnyBOhB4PAviGXmjZApm1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVz+9kCFzzk9AbpzYHg+0RLhZCP55dxFvbNML80AX9c=;
 b=iLEi7JGCf2+OU86I9IyMYoMAupTo4S4KKfML1rqKY5esjWbdRnsSfmO10prUXq7hz2oqSfhPZjGdNVPpqpP0WThzNkEtIUJ5th7bK0LGoAQYFway0rMjwnxTOD9gYs5gOHhyFnMdfDtIbgxXqEgQ1r5K22wYzAM2K29LbSYeCe4KSEaR1v+39GBP6mk8wF+XUkW3rxsKwPzk4G+PuxlHknYPCjsqIwfIqvjyF+XSoBh0i1hWs5LFI1Up7IwkLersA+/0v5vgGALXE4aBXl2lRb7XGeoGs85dqlHPvMKzCCYe/G1nAFRcXT6Rre83FKXEkEe6dwJ3I2hjM+7guGWQqQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Topic: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcFpKAZWUsU5Sz9EWrJGvlceTbI7R2TLcA
Date: Wed, 27 Aug 2025 10:25:38 +0000
Message-ID: <1cf0a662-b717-458c-8174-6b03187b4b6c@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <bff3d1c4302e8780771abed42f624cafe76776cd.1756216943.git.leonid_komarianskyi@epam.com>
 <874itt4r5t.fsf@epam.com>
In-Reply-To: <874itt4r5t.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB10346:EE_
x-ms-office365-filtering-correlation-id: d7759ffe-bb39-4d68-4e84-08dde5541156
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YlJLb0h2Y0dGRTJZSy9XWnFLL3B6V0x0cW9ubjFuSld6Z2d5MzBPemplOHhI?=
 =?utf-8?B?UEpadTI0aTBkQm4weUZiNCtnNnNnY2VRSVNrMEVDN3VsbG85NkI1eW5YRi93?=
 =?utf-8?B?eEdyMHR1UkRvUm1pelMzcmlQUlk3aVo3bGdiektJOHBkWDJHcWxER1RSV2o2?=
 =?utf-8?B?cUxORmJ5L0V5eHBkb2NTaFlLOHhrRmducVZpUHdxeThuc1ZTOWZZNmF6YVV6?=
 =?utf-8?B?MjBUY1h1ellJQjVjUzFTMm9tUnpSY2N3a1dvMEJkWGpERld2UVZUa2VNOUtT?=
 =?utf-8?B?VHcrMkhZdm8zSC82c2RxbUF2SFhIN2tWL0NvK1A3OWptYXd0M0ZBQUptYTJx?=
 =?utf-8?B?dzZrNlUxSlhjQjA4N3hsZGtndUlOQjZjUDdTdURiYUtuYWJTcG01MkZmOFla?=
 =?utf-8?B?amtqd0dqWU5rQUt5a3dMNG5uQXNYQ3QwTzN3ZXlpcEhpL3M5RTAzeXZDdmlj?=
 =?utf-8?B?cHlnYWxydFkzbEZIODc2UXJIQ3NxaGNIVVhQOXdWZWhTQzdCYUxVTmRBaFNZ?=
 =?utf-8?B?WStkaHJUQ1JNK0g5aG0xK2xhTENocnVmc2NUQU5lYW9HT3NpV1FyaHUyK0FK?=
 =?utf-8?B?QmFHbmpja1J2WmRPOVFsb2FYblJSbTh2a09wc1dsSHVPT1VHcCtYWHlUSmVr?=
 =?utf-8?B?QVN1YzF2SGltazl5eUpvRDEvS2s2eFgxeUpMcHdDTjBQSVVmRk1XU2pHdWlJ?=
 =?utf-8?B?U1ZmUDQ0QzI2Zm1qMmtnVVhRUTNzZFVJa05OeDFzQk5NS0FMQVZZRlAwTmpa?=
 =?utf-8?B?VEo1YXlsa1NzNnlXSWt4L21qRDh6WEJNMG51b3gyMjYvbGExa3JsN3ZOdGda?=
 =?utf-8?B?azdWcmFhZWRKN0VGcXVLNzlPUG5kTkdIeUttV2hyaks2NTlLYUQ1bjJ5YmtY?=
 =?utf-8?B?N29VYXlJczhQdjV1SU56ckJDb0d5MkhXTjlSR3R4a0ZtUHZzRDI5MjdzQkpi?=
 =?utf-8?B?QnRvYkErNXdMQnBLYlh3endHeUJqSE01K2RzVTI1UXY2ckpSQXRkNytlRWhY?=
 =?utf-8?B?NUd4dUwwN21YdnNET3RXeDVadW82TzI3dDdxK05Ua0g2N080aG5uYUJnWDVH?=
 =?utf-8?B?a0pud0tzUmlYMzA3RWxpTXl2RjAxZzJHVGNZMFIrQWlEZnJ1Rmo0QjFtd0JS?=
 =?utf-8?B?WVNCa2o2RmFhZkQzVndwL29nQWpBRnNyVXlKa2JKZExnQzlEc0NhOHkwamcx?=
 =?utf-8?B?MFdDb25iR09pZFd5dnVLOVZMOURwWHVobzhpeXBjMDQ3ZDhZRTJ3NmoxS3Zl?=
 =?utf-8?B?d1VYclZrR0lRMyt6eDk2UC81aTVHMUFoU0pySWpuMlhnbUw1ZW1kTFZVTlZD?=
 =?utf-8?B?bDh5QXl3aDZPNUdUanZ3eUZReHlkSmpCVnJRaWoxUDFGc1I4TUllREJ4bk5a?=
 =?utf-8?B?TFNJQjBFM0x4dWNZNnFBb01GYkhzcW1oZUF4dzI5VVlDL0VIVnl4SjRENldY?=
 =?utf-8?B?WEoyQXMxMEs5cHNvaGlyQjVGYUdydFFuVjlreFVXTEh0N1g3aklPU3VGSTg3?=
 =?utf-8?B?OVdpaERuMEs4SEJBRmZPVkRrWjZvd20xVHAzbDhUSDNDVVNBZnNWNU1VMkxo?=
 =?utf-8?B?VnhVTUVwVW1LL1Z6b1VnQ2F0MFFuWGQ4akFibmM3MmRYVzlHVTM1ZG9NTG9L?=
 =?utf-8?B?Q3drOG9vcE1KSHJ0V0czelJPMEYrbzBWSVdTS3NjL2JTTXVqdjhqZ0xtVjJl?=
 =?utf-8?B?OFhrUVQzMklxb3RwbVVLeThRZGV0eGQ3ZDRCSndWdmVzemRuaElUckd5bkhw?=
 =?utf-8?B?YWQ5ajlsY21jQXYvRWJsc3o5VUVIUzB0R3V4ZlV6VUtRT2RQQ01NWGE1Qkhn?=
 =?utf-8?B?N3RJUHJGMm8zMXNic3c1aFEzK1NYeXBwZ0hpL25ZcUsxUEYvcWtiMEJmUUpR?=
 =?utf-8?B?Vi9QcFhZS3FEWG82MEx4L2lJcUxldm9LMXBWNVpFMDROendJOGdJZEVNTUVk?=
 =?utf-8?B?NDBBb21oMEJSaE52Y05QaXlOZ1NxTjhBNUszNjRQQk9NMUZJQkJJSFZTeUFu?=
 =?utf-8?B?RmxQeDhRaklnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUNUZ0tuWEtTSVZhTEk2QWdTaTR6MVdmbE1neTdReWZONGpDbUV5eXpUTmpX?=
 =?utf-8?B?ajNXN2RrbVZxdnQwNHFSUmdhNU1rMzhqdmpwMXhsSi9UOFA0dWxCcmpPSmN0?=
 =?utf-8?B?SnBJRjdiYWJmUlRjdDhjZjFvczh5TjlucllTQ3FpZ21la250U1BkZkhsWlV5?=
 =?utf-8?B?VnZQeGtucFFpUUx0bFZSazAzbkdYaERhM0lMOXhUUm43V3ByWjJxOCthVjFM?=
 =?utf-8?B?V25rQWF3QVBCcXB6cy9MN2VaUkN5NzdKZWh3SnhlbUd3eEFCWTFCWlpvaDZE?=
 =?utf-8?B?UUdBM2ZwcmxVMmFWRmV6cE81L1Bia2NSYXd3ZUxiMXFhZk9ya01YS1BUQjhV?=
 =?utf-8?B?ZmYwc1V5MFZLSnNIOHBvSWxSVFBWdy9SNmtpVzhRdE0zNENvQkNIQU9xQWIy?=
 =?utf-8?B?TDlsb1QrWXJVZVFxbm1Wdk9scXcrelhSa1JES1RtZ2NiOWlmR1ZCRHJHWTV3?=
 =?utf-8?B?QjRZQ0FZaUQ1dHdJSlhXeXYwQXZSVnZ4bmhNTGRQNnJ4dUJtOHREN2ZmTzU2?=
 =?utf-8?B?b0NGNDJHR0lNd283LzZqYS9TbGpqeDl6QmlObGxkN3FFUElDNXZ2MVpDR1FN?=
 =?utf-8?B?RXRzVFU2SjNYRU9DZ1dPZXBrQ3F4Z3hiaTVveDZwNmNZZkszU1JEMnZUeXpJ?=
 =?utf-8?B?NnF2cHZ4WG81SUY5OU4rdkd2VXh3TGtVbUhXenpSVU14cWlOUU82eTBtckRn?=
 =?utf-8?B?UHM5VEhCZzdyK3pYdzBKUWZ5RzRPeHpjbVpqMEQ4bm5MbDVIVlh3NWdUQjZJ?=
 =?utf-8?B?bzR3Znp2UzF2Y1pGczdCTnN0d2MwYTd3UFJyY1J4STFsdnVMaUwyektyaS84?=
 =?utf-8?B?ZnYxTVMwY0JpL1ZhcGxjQjRIU1FkN3duMzd1MlJ1VHhFSHlzdnp0aGZHQUFM?=
 =?utf-8?B?azFhOXFxZmQ3K3VjbnQvS2ZIYkZiNm1ZeG1IcFZuOFl1ZDlRaFlzR1JrRDdq?=
 =?utf-8?B?dnVPVm9Lbm9hWDNseEQ2bm9vNSt3MmxCSUhPbzBiQ0h3YTVRRCtoWWRrSDdC?=
 =?utf-8?B?OFByanRxanM5bDNGM3Uwa1h5SmwrK0lUaC84VVRCTzcrOWJVSU83dzhBOEpr?=
 =?utf-8?B?Uis0Q2wxVTE3YlluSmpwS3NkUHUyUkVsSUoveXpKKzcxN2hrVi8xR1dNSmVZ?=
 =?utf-8?B?bTFRbkR2RVI4UEhWcUFsZkpIZkhlSUcyNzFSb1ZIR3I0MTRHYlZpSlZtUksz?=
 =?utf-8?B?c01zR1VsVlNyRXVhWkh6WlB0S2NhK2trYmRSQUMrdkx0N2JHczRaSjRsaUxK?=
 =?utf-8?B?REVpeTdjUTRqc0NDRFIwSDA3elltRDBPeGFmQjVHUEYwbjkxMkJRZmg5dURC?=
 =?utf-8?B?cGc5S3pjdWd2dTlMc3BqYnBJUEc0cmtBNi9ZSkRJMzBFSmV6K2ZaZ0p5azdT?=
 =?utf-8?B?VmY0RktWK2FNbjVlSzVhb2czcEYrZGxwVlEwZHVsUEY3QnZIaEgzN0ZqVGV0?=
 =?utf-8?B?NTY5c2hydUF4ZW83MDllbUk5ZEo0YUVXaEtVczdzbzRGMVh6RmZlSTBmOVdY?=
 =?utf-8?B?WXk2M0h4Mk5vcVpoUUltUThZTjdKZERwZXBqT3BaSzV1YWxSOE9lRlpvNVA3?=
 =?utf-8?B?U253a0wrK3Y3RWVJeWx2RDZNVTlRWTNvSVJiZW1pM25zaGNsMDZXZVNWVU9N?=
 =?utf-8?B?VHFMVE1Tc09EcGNMYWRkZjZJQ29PVk9ZWnRYUngxUDdMQTFicUhhdG9rOUp6?=
 =?utf-8?B?Qit1NW1kbHhMaDRmVkZOeEJ6Q041bE81ZjdtWnhIVkdtWS8rNWlqNUJaOHVo?=
 =?utf-8?B?czB3RUhSTTUrWThOdUVIbEhXSSt6ZUFCZ0tsZXBmTGM5OXZwMlFvNWwxUnpM?=
 =?utf-8?B?NXRrL3JPWmN0WmNCY1lYZWdmbzhlL05xR1IwVFZJd3M0Y2pDZHRMdEZBODBK?=
 =?utf-8?B?dDV0ZmxTTTF3cEg0WFpqYzdYekJiSjBEb1VhN24vSFRvZUxuQ0NYcUwwN2FP?=
 =?utf-8?B?U2puS282c3JRdTZNbUVuYWRCZ2NqSmpmTUhYT3RGR1pVajRMR1MxVXFLYWpz?=
 =?utf-8?B?cmx6LzZZVVNtY0tjTEhOTlM3aWR5TnB4c3FBK1o3eGNYZkloZDhUeDVpejE3?=
 =?utf-8?B?Z2l2eU1kZlRRZm5LTmorT2w1OFBpM2IwdDhiQXJRUkFueHFWZVpQbVBjYTRv?=
 =?utf-8?B?MXlnMFF1eXErc0pEbGVrRldVaVR5bWxabVJBQWQrejIyTjV1ZzdwY0hXQi8v?=
 =?utf-8?Q?eB0nXwsSmsysLEQPWSPoqho=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F869E94F552A646820D45692049AF53@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7759ffe-bb39-4d68-4e84-08dde5541156
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 10:25:38.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4W0ilGX41DOuVJfUFPlTloq0zjGq0r59jmEfkheTKCpDO3m/XXtE8TqH8Ky8pi90cCTJnjvEyLwaN21Dr61lauL47xCLoL/i3aghDcQnFjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10346

SGVsbG8gVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KT24g
MjcuMDguMjUgMDI6MDgsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiBIaSBMZW9uaWQsDQo+
IA0KPiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRfS29tYXJpYW5za3lpQGVwYW0uY29tPiB3
cml0ZXM6DQo+IA0KPj4gVGhlIERvbTAgYW5kIERvbVVzIGxvZ2ljIGZvciB0aGUgZG9tMGxlc3Mg
Y29uZmlndXJhdGlvbiBpbiBjcmVhdGVfZG9tMCgpDQo+PiBhbmQgYXJjaF9jcmVhdGVfZG9tVXMo
KSBoYXMgYmVlbiB1cGRhdGVkIHRvIGFjY291bnQgZm9yIGV4dGVuZGVkIFNQSXMNCj4+IHdoZW4g
c3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZSBhbmQgZW5hYmxlZCB3aXRoIENPTkZJR19HSUNWM19F
U1BJLiBUaGVzZQ0KPj4gY2hhbmdlcyBlbnN1cmUgdGhlIHByb3BlciBjYWxjdWxhdGlvbiBvZiB0
aGUgbWF4aW11bSBudW1iZXIgb2YgU1BJcyBhbmQNCj4+IGVTUElzIGF2YWlsYWJsZSB0byBEb20w
IGFuZCBEb21VcyBpbiBkb20wbGVzcyBzZXR1cHMuDQo+Pg0KPj4gV2hlbiBlU1BJcyBhcmUgc3Vw
cG9ydGVkIGJ5IHRoZSBoYXJkd2FyZSBhbmQgQ09ORklHX0dJQ1YzX0VTUEkgaXMNCj4+IGVuYWJs
ZWQsIHRoZSBtYXhpbXVtIG51bWJlciBvZiBlU1BJIGludGVycnVwdHMgaXMgY2FsY3VsYXRlZCB1
c2luZyB0aGUNCj4+IEVTUElfQkFTRV9JTlRJRCBvZmZzZXQgKDQwOTYpIGFuZCBpcyBsaW1pdGVk
IHRvIDEwMjQsIHdpdGggMzIgSVJRcw0KPj4gc3VidHJhY3RlZC4gVG8gZW5zdXJlIGNvbXBhdGli
aWxpdHkgd2l0aCBEb21VcyAoRG9tMCBzZXR1cHMpIGRvbWFpbnMsDQo+PiB3aGVyZSB0aGlzIGFk
anVzdG1lbnQgaXMgYXBwbGllZCBieSB0aGUgdG9vbHN0YWNrIGR1cmluZyBkb21haW4NCj4+IGNy
ZWF0aW9uLCB3aGlsZSBmb3IgRG9tMCBvciBEb21VcyBpbiBEb20wLCBpdCBpcyBoYW5kbGVkIGRp
cmVjdGx5IGR1cmluZw0KPj4gVkdJQyBpbml0aWFsaXphdGlvbi4gSWYgZVNQSXMgYXJlIG5vdCBz
dXBwb3J0ZWQsIHRoZSBjYWxjdWxhdGlvbg0KPj4gZGVmYXVsdHMgdG8gdXNpbmcgdGhlIHN0YW5k
YXJkIFNQSSByYW5nZSwgd2l0aCBhIG1heGltdW0gdmFsdWUgb2YNCj4+IDk2MCBpbnRlcnJ1cHQg
bGluZXMsIGFzIGl0IHdvcmtzIGN1cnJlbnRseS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMZW9u
aWQgS29tYXJpYW5za3lpIDxsZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29tPg0KPj4NCj4+IC0t
LQ0KPj4gQ2hhbmdlcyBpbiBWMjoNCj4+IC0gbm8gY2hhbmdlcw0KPj4NCj4+IENoYW5nZXMgaW4g
VjM6DQo+PiAtIHJlbmFtZWQgbWFjcm8gVkdJQ19ERUZfTlJfRVNQSVMgdG8gbW9yZSBhcHByb3By
aWF0ZSBWR0lDX0RFRl9NQVhfU1BJDQo+IA0KPiBXaWxsIFZHSUNfREVGX01BWF9FU1BJIGJlIGJl
dHRlcj8gV2hlbiBvdGhlciBjb2RlIHJlZmVyIHRvICJTUEkiIGl0IG1lYW4NCj4gImNvbW1vbiBT
UEkiIChsZXNzIHRoYW4gMTAyMiksIHdoaWxlIEVTUEkgaXMgdXNlZCBmb3IgZXh0ZW5kZWQgU1BJ
LiBTbywNCj4gbmF0dXJhbGx5IGl0IGZlZWxzIHRoYXQgVkdJQ19ERUZfTUFYX1NQSSBzaG91bGQg
YmUgZXF1YWwgdG8gMTAyMi4uLg0KPiANCg0KWWVzLCBJIGFncmVlIHdpdGggdGhhdCAtIFZHSUNf
REVGX01BWF9FU1BJIHNvdW5kcyBtb3JlIGFwcHJvcHJpYXRlIGluIA0KdGhpcyBjYXNlLiBJIHdp
bGwgcmVuYW1lIGl0IGluIFY0Lg0KDQo+PiAtIGFkZGVkIGVTUEkgaW5pdGlhbGl6YXRpb24gZm9y
IGRvbTBsZXNzIHNldHVwcw0KPj4gLSBmaXhlZCBjb21tZW50IHdpdGggbWVudGlvbnMgYWJvdXQg
ZG9tMGxlc3MgYnVpbGRzDQo+PiAtIGZpeGVkIGZvcm1hdHRpbmcgZm9yIGxpbmVzIHdpdGggbW9y
ZSB0aGFuIDgwIHN5bWJvbHMNCj4+IC0gdXBkYXRlZCBjb21taXQgbWVzc2FnZQ0KPj4gLS0tDQo+
PiAgIHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAgfCAxMiArKysrKysrKysrKysNCj4+
ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICB8IDExICsrKysrKysrKysrDQo+PiAg
IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmggfCAxNCArKysrKysrKysrKysrKw0KPj4g
ICAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbTBsZXNzLWJ1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVp
bGQuYw0KPj4gaW5kZXggNjliOWVhMjJjZS4uZjRmOTA3N2RiNSAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tMGxl
c3MtYnVpbGQuYw0KPj4gQEAgLTI4Niw2ICsyODYsMTggQEAgdm9pZCBfX2luaXQgYXJjaF9jcmVh
dGVfZG9tVXMoc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlLA0KPj4gICAgICAgICAgIGludCB2
cGwwMTFfdmlycSA9IEdVRVNUX1ZQTDAxMV9TUEk7DQo+PiAgIA0KPj4gICAgICAgICAgIGRfY2Zn
LT5hcmNoLm5yX3NwaXMgPSBWR0lDX0RFRl9OUl9TUElTOw0KPj4gKyNpZmRlZiBDT05GSUdfR0lD
VjNfRVNQSQ0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIENoZWNrIGlmIHRoZSBoYXJk
d2FyZSBzdXBwb3J0cyBleHRlbmRlZCBTUElzIChldmVuIGlmIHRoZQ0KPj4gKyAgICAgICAgICog
YXBwcm9wcmlhdGUgY29uZmlnIGlzIHNldCkuIElmIG5vdCwgdGhlIGNvbW1vbiBTUEkgcmFuZ2UN
Cj4+ICsgICAgICAgICAqIHdpbGwgYmUgdXNlZC4gT3RoZXJ3aXNlIG92ZXJ3cml0ZSB0aGUgbnJf
c3BpcyB3aXRoIHRoZSBtYXhpbXVtDQo+PiArICAgICAgICAgKiBhdmFpbGFibGUgSU5USUQgZnJv
bSBlU1BJIHJhbmdlLiBJbiB0aGF0IGNhc2UsIHRoZSBudW1iZXIgb2YNCj4+ICsgICAgICAgICAq
IHJlZ3VsYXIgU1BJcyB3aWxsIGJlIGFkanVzdGVkIHRvIHRoZSBtYXhpbXVtIHZhbHVlIGR1cmlu
ZyB2R0lDDQo+PiArICAgICAgICAgKiBpbml0aWFsaXphdGlvbi4NCj4+ICsgICAgICAgICAqLw0K
Pj4gKyAgICAgICAgaWYgKCBnaWNfbnVtYmVyX2VzcGlzKCkgPiAwICkNCj4+ICsgICAgICAgICAg
ICBkX2NmZy0+YXJjaC5ucl9zcGlzID0gVkdJQ19ERUZfTUFYX1NQSTsNCj4+ICsjZW5kaWYNCj4+
ICAgDQo+PiAgICAgICAgICAgLyoNCj4+ICAgICAgICAgICAgKiBUaGUgVlBMMDExIHZpcnEgaXMg
R1VFU1RfVlBMMDExX1NQSSwgdW5sZXNzIGRpcmVjdC1tYXAgaXMNCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMN
Cj4+IGluZGV4IGQ5MWE3MWFjZmQuLjE0OGE4YmRiNjAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Yw0KPj4gQEAgLTIwNTUsNiArMjA1NSwxNyBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tMCh2b2lk
KQ0KPj4gICAgICAgLyogVGhlIHZHSUMgZm9yIERPTTAgaXMgZXhhY3RseSBlbXVsYXRpbmcgdGhl
IGhhcmR3YXJlIEdJQyAqLw0KPj4gICAgICAgZG9tMF9jZmcuYXJjaC5naWNfdmVyc2lvbiA9IFhF
Tl9ET01DVExfQ09ORklHX0dJQ19OQVRJVkU7DQo+PiAgICAgICBkb20wX2NmZy5hcmNoLm5yX3Nw
aXMgPSBWR0lDX0RFRl9OUl9TUElTOw0KPj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4g
KyAgICAvKg0KPj4gKyAgICAgKiBDaGVjayBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgZXh0ZW5k
ZWQgU1BJcyAoZXZlbiBpZiB0aGUgYXBwcm9wcmlhdGUNCj4+ICsgICAgICogY29uZmlnIGlzIHNl
dCkuIElmIG5vdCwgdGhlIGNvbW1vbiBTUEkgcmFuZ2Ugd2lsbCBiZSB1c2VkLiBPdGhlcndpc2UN
Cj4+ICsgICAgICogb3ZlcndyaXRlIHRoZSBucl9zcGlzIHdpdGggdGhlIG1heGltdW0gYXZhaWxh
YmxlIElOVElEIGZyb20gZVNQSSByYW5nZS4NCj4+ICsgICAgICogSW4gdGhhdCBjYXNlLCB0aGUg
bnVtYmVyIG9mIHJlZ3VsYXIgU1BJcyB3aWxsIGJlIGFkanVzdGVkIHRvIHRoZSBtYXhpbXVtDQo+
PiArICAgICAqIHZhbHVlIGR1cmluZyB2R0lDIGluaXRpYWxpemF0aW9uLg0KPj4gKyAgICAgKi8N
Cj4+ICsgICAgaWYgKCBnaWNfbnVtYmVyX2VzcGlzKCkgPiAwICkNCj4+ICsgICAgICAgIGRvbTBf
Y2ZnLmFyY2gubnJfc3BpcyA9IFZHSUNfREVGX01BWF9TUEk7DQo+PiArI2VuZGlmDQo+PiAgICAg
ICBkb20wX2NmZy5hcmNoLnRlZV90eXBlID0gdGVlX2dldF90eXBlKCk7DQo+PiAgICAgICBkb20w
X2NmZy5tYXhfdmNwdXMgPSBkb20wX21heF92Y3B1cygpOw0KPj4gICANCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmdpYy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL3ZnaWMuaA0KPj4gaW5kZXggMjQ4YjU4NjllMS4uMGJiMDI1ZjVkNSAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+IEBAIC0zNTMsNiArMzUzLDIwIEBAIGV4dGVybiB2b2lk
IHZnaWNfY2hlY2tfaW5mbGlnaHRfaXJxc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2LA0KPj4gICAv
KiBEZWZhdWx0IG51bWJlciBvZiB2R0lDIFNQSXMuIDMyIGFyZSBzdWJzdHJhY3RlZCB0byBjb3Zl
ciBsb2NhbCBJUlFzLiAqLw0KPj4gICAjZGVmaW5lIFZHSUNfREVGX05SX1NQSVMgKG1pbihnaWNf
bnVtYmVyX2xpbmVzKCksIFZHSUNfTUFYX0lSUVMpIC0gMzIpDQo+PiAgIA0KPj4gKyNpZmRlZiBD
T05GSUdfR0lDVjNfRVNQSQ0KPj4gKy8qDQo+PiArICogUmV0dXJucyB0aGUgbWF4aW11bSBlU1BJ
IElOVElELCBzdXBwb3J0ZWQgYnkgSFcgR0lDLCBzdWJ0cmFjdGVkIGJ5IDMyLiBGb3INCj4+ICsg
KiBub24tRG9tMCBkb21haW5zLCB0aGUgdG9vbHN0YWNrIG9yIGFyY2hfY3JlYXRlX2RvbVVzIGZ1
bmN0aW9uIGFwcGxpZXMgdGhlDQo+PiArICogc2FtZSBhZGp1c3RtZW50IHRvIGNvdmVyIGxvY2Fs
IElSUXMgKHBsZWFzZSwgc2VlIGNvbW1lbnQgZm9yIG1hY3JvIHRoYXQgaXMNCj4+ICsgKiB1c2Vk
IGZvciByZWd1bGFyIFNQSXMgLSBWR0lDX0RFRl9OUl9TUElTKS4gV2Ugd2lsbCBhZGQgYmFjayB0
aGlzIHZhbHVlDQo+PiArICogZHVyaW5nIFZHSUMgaW5pdGlhbGl6YXRpb24uIFRoaXMgZW5zdXJl
cyBjb25zaXN0ZW50IGhhbmRsaW5nIGZvciBEb20wIGFuZA0KPj4gKyAqIG90aGVyIGRvbWFpbnMu
IEZvciB0aGUgcmVndWxhciBTUEkgcmFuZ2UgaW50ZXJydXB0cyBpbiB0aGlzIGNhc2UsIHRoZQ0K
Pj4gKyAqIG1heGltdW0gdmFsdWUgb2YgVkdJQ19ERUZfTlJfU1BJUyB3aWxsIGJlIHVzZWQuDQo+
PiArICovDQo+PiArI2RlZmluZSBWR0lDX0RFRl9NQVhfU1BJIChFU1BJX0JBU0VfSU5USUQgKyBc
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBtaW4oZ2ljX251bWJlcl9lc3BpcygpLCAx
MDI0VSkgLSAzMikNCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICAgZXh0ZXJuIGJvb2wgdmdpY19pc192
YWxpZF9saW5lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB2aXJxKTsNCj4+ICAgDQo+
PiAgIHN0YXRpYyBpbmxpbmUgYm9vbCB2Z2ljX2lzX3NwaShzdHJ1Y3QgZG9tYWluICpkLCB1bnNp
Z25lZCBpbnQgdmlycSkNCj4gDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA0K

