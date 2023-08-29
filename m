Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BABD78C401
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592137.924759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxc1-0003CH-1h; Tue, 29 Aug 2023 12:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592137.924759; Tue, 29 Aug 2023 12:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxc0-0003Ad-U1; Tue, 29 Aug 2023 12:14:24 +0000
Received: by outflank-mailman (input) for mailman id 592137;
 Tue, 29 Aug 2023 12:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaxbz-0003AX-4z
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:14:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2057.outbound.protection.outlook.com [40.107.13.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94eb0934-4665-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 14:14:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 12:13:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:13:51 +0000
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
X-Inumbo-ID: 94eb0934-4665-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1/31nC45pm6I4+bivvj1F3JKkXpCJkPrg4am+EuQ1dE0Xr6DiZPYzH2aHEGMS656MO7Xzyx6Ef7gwBAkS9/IMdephhhcMFP9hFy+Aspd9hoYzqY9gsbVY1db/hDjLgUnHdJ8wZAtvih0TWRbkXwdSlBFWwD8cWbpWctVoSww8K66ySEYjFBNdmOBMBrq/dbTz4oG/V32hkCLzt1G95CSQ+68beHJeL13NHt5pf1+fuHQykR965bVK/6nFbROuDCUeGYu9SRYHwGcoufrwcU2s3+Y2TFhlbrVW8zkzibUdeZp9hZA7UMeHERz1D/OGNrDpur9vUK0qIBYNrH5gsEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHtEMoVCZ5v+8B8iWjuyvcS8VOiZvV6x2G7sWSS2ChA=;
 b=XDgn/YAZyJI8IB6PaPaJHTgKUKgdJwG+cU7qsUo7BIVTfRNeyNG7ymTJnXa12usjQEbhWBcT+QHX3qhy/pekMHzyJ/uwL6JrgjoXpkRRnueNrNHjxxObwKysV0V5ZuqRztTqvrKZOZGSuLry7b0uaIoNJwwJssrI5BXgtXUhZ0rSlQTn3oHdaqcczZYFdVHwmkzxuQ9/6tf8IdQN3r2UY+AKus5YMbpgLQuezBqOyYoqF8KEla3s26+Ro1p7pj7j9AWUC2F1LXG0bO7QAJ4Iki4oUf4fDFIzL5EtczMwSB+eblsj3wRdak+vXH/JLE5Gjg+0UXtvKrnQRgG3TDt5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHtEMoVCZ5v+8B8iWjuyvcS8VOiZvV6x2G7sWSS2ChA=;
 b=YvZ39INUSUhcziNfVAFYB39ERwhfP/NUUQ935f4kKaOwFvWfFqwQtqit9THG3ZGOHy28OEZfSHTVfWOiBVvgV7h5KREeqecJW+jwOJceam0PD/tXa+gZLJPj9RieedlUWnWA9LOMmcpKDriU8JWBaNk6a+Qahi64T6grOvoTPv2JmuQXamDbVRUoRAWgSqu8sE2jIfSdzFR4S2gFgZ0YmnixTcmW/nNeOdPRIVkHVX0G/DrIxv7WzUrwaJU+n0UPXAnT9Gf3zpM8XjB8tlHNpv+L0kQ4GWrPm2ozPmM29j+tZLNBNy5ATHvT6Z7GU8OZaQn8+Ei+/5xjtnPoa6+2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <647aa53f-9b2f-df38-6de4-3e407f34f7f5@suse.com>
Date: Tue, 29 Aug 2023 14:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/cpu-policy: minor adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: b8391283-f3a5-476e-1e27-08dba8896839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uRDGu7UDUZXBoktZdjxwIMYPE2l4FcttYK98wGDsUUbJ4GNxK+pYS/oVpz7Ukf45Wwv/gNWPisVZmfLyCNEtrONlhmSyCG95UZp4LQ2hFaBO5EgoFzednTv1i44yI28TmqmImjBMopWzzRDfJuD96eSsdK1qleTmvEEFDrYZmGh00yFmQqi/XE5/2/9FSq821u03HdPpyrsAvGiuqi5HKSTsbYK5LcvJqA3I5N4SBnPHq3SZRZj/MThrOh5W/mQz9JbLsnqHPAr/P4cfUCd/zD2HYmzpGASzENN2Szgpo8OiGDjesLMUuvelAYgioBCWlKGuCYxDvZopujmTJKwxUd11Fzfpgsuz884D6cPzo01Prq9C8i2Apu2nF4KGOU0fFxIYcOakfBjAp8a8NWeN+66xlz2nP6JRx57YFNDrU4Y6A5Y3JW5fbCrdQ8GmLYJwJwn1aJCZ0PSWE+MOi9m9/0+J/FbguuEe1K87CIxecw0pdzJ6Ilk2KJgdETYRUaQDVClaLhb2E6P4XUaZNLxHm/X9xPUvjAoPDA8/TISjcuOWvXCZh4R3uujj1SzUtZKLgchzoU5djJloFPCfPrvGdekly2RpNtlGZLt/RubxCKiUjr+4oY+m/W7kUaMYzJXEhsOEgaOq6HEKzX7yxdzT9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(86362001)(31696002)(36756003)(26005)(2616005)(83380400001)(6512007)(558084003)(316002)(6916009)(5660300002)(66946007)(66556008)(41300700001)(66476007)(38100700002)(54906003)(31686004)(2906002)(478600001)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clp0MGxVaDRiNEUySk43NUh1MTBNL3p4cWloMG5nRXN6aHp4dUthZTVjS253?=
 =?utf-8?B?ZldyTzRaNDdTUzVKTUlyK1N5YStYZHVFc2ZkVlFYd3lIK2VQN2xyMFdGOTht?=
 =?utf-8?B?cjR5UkJleGpyZEdEQ3ZkTnBUUCtBSCtaYnhDSjV2Rk40STRISXV2a3JBUGRt?=
 =?utf-8?B?M0lZbDJFY2kzZGEvM3M2ZXp3NnJWbWZPdXVOYW5aSDJvVlU4OHlVS2ExVllt?=
 =?utf-8?B?UWhrTGl4ejl5SHRya2RLLzhoWEo2QXdEQlJqOFpPLzMvSkR3cUd2dU5RU3Y0?=
 =?utf-8?B?dzVOTHVBR09aUi8xbCtFRHYwMVNrUEZOejlpN2RqZU5WUTJVdWs0eDBXcUYw?=
 =?utf-8?B?RXk0R1NPVExkQ3hqR2lTTmVabmF4YUt2TnI5R3NtcUtVbUdTRUJ0cTJRSkhW?=
 =?utf-8?B?TlNyR0QreUMxcUQrc2FmY2Rqa1k1QVVoTW5pUUEwVDFlUU83SVk0ZFFFS0ln?=
 =?utf-8?B?Q3BNQll5RUdlRDhVR1JudkFmTk1WTXNOYkF3VUFkaHQ0bEY2T1o0ampwTWJJ?=
 =?utf-8?B?cVlvSjU4VHhvRmhHcUc1ejc1VlJCNVNhS3VVNWoxS1YyVkpGWUN0ZjNEbDJD?=
 =?utf-8?B?OFQrMFk5ZDVRMG5CN2NFT213R0hKQVQ0aXFQRE13SFpxaEZGOXh6cXRoemtT?=
 =?utf-8?B?d0hGWCszV1lBMUJ2cHBLcU5xZGNxem56RzFScTlqSGI5WEs3WnVublR1ZkxN?=
 =?utf-8?B?N0Q5V0hkWHNaT0czbDVXai80QjNwMURuN3FvWFVnN2N6MzM2ZjFzOGFXOTBV?=
 =?utf-8?B?OTFXUjkveTREZ2VjeE9kdlNOWG0vcUpUVS9ubVYzRWQwZkhDdGlqbUt0ZnNy?=
 =?utf-8?B?Z1VTZXJpUktnUlJoM1J2eFRYTlc1V0tMYUFZMUt6WWpJY0NYcTkraldzZnB1?=
 =?utf-8?B?SHQwT3dvNXFNOW9ocTltUzcyYTNWTlllMVcxTVNlbGFzbjBQQTVKOEU3NEh0?=
 =?utf-8?B?eWFhWm1IUEFYVzV3QXVlM0JIRHZJUmF1NzBacHBBUzdXdCtzUklXc0pEd0RJ?=
 =?utf-8?B?LzZuV3cwMUMrMXppVUdkVm5xNC9MTzZvZ3EvSUgzTlVMYWtJRUVESDg1OW9Z?=
 =?utf-8?B?d1lFRzYrWmc0V2pKSmlrN2x6aVBJWStBSGd3LzMraEtobmJmY0lrSmozWG1i?=
 =?utf-8?B?L1BDV2ROZU4reDR1VDNhVkdURHVzeXVwSGtIeDNGWUV6bzRqZGVLYVhmZmM1?=
 =?utf-8?B?U25rZzdJNkxHdmRVVHBmZVZ6d3UzVEF4TXhCcmZwWE84UkRlbzVkWGVkNUNl?=
 =?utf-8?B?ZVBndmRSNFVMQ1ZRUk5ZK0d4dkxaM2k2S0IzSGw3NFA4Nk9PZW1WTjV1TVF4?=
 =?utf-8?B?UkNqMkZLYTc2UEZyZXRIMFR1akJsUksyM0RoTDh5SlYrVFhqWlpzUmRXQ21v?=
 =?utf-8?B?TUVwUUFnb1JDL2c2aTBmc2VlM0x4dkFPYjl4VXdBYjFpazdDc3ZHNFRsMllZ?=
 =?utf-8?B?UmVkbE5zK0VtL05IM0h4R1d3RDM2QW0rVW9TVEswU3FVZFMxc00rOXM1K1FC?=
 =?utf-8?B?SDloQlNvTko1QUFLRHFiN3JEK215TkFSekd2V0dTam1HSTBIQTRSTitmOGI1?=
 =?utf-8?B?WmpsMWo3ZHF1QlY5R2Z3ZWdzRzBJeTY3bE16bGFYVTY2Mkp6NVNiSFY2bkpx?=
 =?utf-8?B?TlFMVFNsVzU1U25KckNsZjN0TFlZUUdnbVF1TTN2c3ZpZ0wwa01mOUlrSDRC?=
 =?utf-8?B?RmJwcklvUzVBNzI0eWkzanNrSUhFSy9KU3hmRC9WT0pxVVZGQzZpeFJTK3VP?=
 =?utf-8?B?ZklhTStsNGNoclk0S0lxN0RzMHdSSnpqRkx1YTdXUy9Sb3pGUG41UFNGQW50?=
 =?utf-8?B?c0ltTHZIbWF0RWR0dkpOUEpqeFR0Qzd1OVN2NkIwL3gxVXZnOENTb0ZISGQv?=
 =?utf-8?B?UTZBUURWOUU5MXRUakh2QTRKOEFmRzFxU1Rtamg5U2NxV1Z1SElqVWxkeVA1?=
 =?utf-8?B?eWtKdkoyY2xTWFpoZzNGNElSV3BHMEVxUVg2NEIveEFqMGMrRDZEQzBDQlky?=
 =?utf-8?B?Yy84RmErMG5hdVVvaFAyeVcyNUtybm05bVRJNSt0cW9nTzRpRERpWVNBUDhW?=
 =?utf-8?B?anl6SHgra2JkTVBEaE5Dc1k1WFcrbnladFZtaGt6cHdzSTFBUnNVbkZpVGth?=
 =?utf-8?Q?V5EUdJasiVHIhMNDksreuQHIW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8391283-f3a5-476e-1e27-08dba8896839
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:13:51.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpLppQ9Q+RHeuGaQDxIY8LI5H/gD6BUag8jpVU8W+3OCyc5hfcS9zc89sJ4+fhpZu6wlkauqWfm9srXLA24V+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

Two minor oddities I noticed while moving the XSA-435 prereqs back
to 4.11 (a 3rd one is mentioned in a remark in patch 1).

1: add (another) size check of deep_features[]
2: drop NR_DEEP_DEPS

Jan

