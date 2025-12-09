Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC506CB072E
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181903.1504877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzwE-0004wM-9J; Tue, 09 Dec 2025 15:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181903.1504877; Tue, 09 Dec 2025 15:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzwE-0004tN-68; Tue, 09 Dec 2025 15:47:42 +0000
Received: by outflank-mailman (input) for mailman id 1181903;
 Tue, 09 Dec 2025 15:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vSzwC-0004s4-QE
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:47:40 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 633888af-d516-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:47:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7393.namprd03.prod.outlook.com (2603:10b6:806:39d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 15:47:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 15:47:35 +0000
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
X-Inumbo-ID: 633888af-d516-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLm88EZqEY21T7WcWSNOiyb5uuRvUHdb1kRQtZAXIYseRAMN+vkjq5nw0fcsVG9ZD61kQWlx91mxYvKyxXRvJEnCSxngSBIEfIVsuR01jnT19rkT90Zqf1QPyu5gsIe1OkCaC/p/ZWNdIIDmDjlVy/+NEBqKkehZDe/93e0dd/Lf6pkwbBcTXJhgnnWVzYbGdwIABF6Ac802EPTvRiWzlyOJoQiedNhT8uYgGEH0CfgjibxCT1TV5iycMizFgMwlKx3DSBwwIJrPDTci6ab5G4iJ5+0WZmUwqccEX2h6u9zW+x5/kW2lU/jce8ARj63zm/DSUA531eFqOBJ1twWmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfMnt7+9v5hOVqLIpJoRtouYdb8Lvr1eafLMbiVt9xU=;
 b=Y+K3xp97GNoibL5z6b5msBcJyKVnWo8+1wmWbfAjk+d0n+XmxS21WUpY7UKLzW7BCy9Lts8z5EcdFgKYJMLQhWd0dWd/q25FTXR5v5f0jMu2e8F1NLe1i8JpctU0MX1K6SF7LJYM1zxg/kiXpYQDwRvXcgXsPaLlhYIpVAmZR/5QmbevFAttxzw0x6PhMx1QzKbLxxu+q8H4EaEgk6+jT+xOpubEn36lB01xzsCwrUPn+S0OeKK0qG3AZhmfW3GayoypOIwVcmeGSUywVuHG2msVIyA4hD4RwgYKIWTxnY0oeHfCwf39s9wyuwGXvzxIhpBYOWfqzm1Wm5LI0VtvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfMnt7+9v5hOVqLIpJoRtouYdb8Lvr1eafLMbiVt9xU=;
 b=eUppv/hRSbdU/3KgDCui8RmAhQGqLKKtl6xxkT5Hwg9dGwHJpklvwHNbvXldijtgkdO/swlqwsSrIXboLyAN/JyUQWAxxnKt4sYpT5tBqKFEUdZFSdTHAlnGK036ddU5OV2afp7Y/qij6InOzedbThrp3UF8wLqIo8nWvoDqT9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6de92bf6-297e-4496-bcd8-f789bd7f8aa4@citrix.com>
Date: Tue, 9 Dec 2025 15:47:31 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] x86: move arch_generic_hweightl() to arch-specific
 library
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
 <45eb7fb7-a899-4d64-a031-f6188146e238@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <45eb7fb7-a899-4d64-a031-f6188146e238@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0641.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d41fa5e-1fb5-441f-804e-08de373a45b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlMrVFdkdzBzVXNGajh4Q0JYcHg2WTFMU21yTmp0UC8zbituWFBWbFpNTGFt?=
 =?utf-8?B?MTFON25MTFN6b29PWURXZVdObm8vaXpXK2xzZmN2MHlCMWJCVDdaZ3ZsSkEz?=
 =?utf-8?B?V094R1NMOHBtaUhQUERVRjg0dVNTU3A4RGZxQmwwVityNTNYcmhOT2lCOUl3?=
 =?utf-8?B?ZmlLcjd5QXRydmw0aGVhbnVoQ0p1dDJpQWdncmpISG5FQ1d4MkxROGp3WDhS?=
 =?utf-8?B?QkcrOXExVlc2WHFEMHBOMFF1NSs4c1F6bTA2bTdNbjlmT091YkFsMEdTdUo0?=
 =?utf-8?B?SUxHaUMxcENHOCs0ekpkd1BITDBLZlA4ZWpvRy9acVpocmwyNXNrcU5YaDVB?=
 =?utf-8?B?L2JLb29WNjNOQXprTjJvK29WN2l5dFhiZjBxcWRxUjRXNStoRUpqY2hhMEI0?=
 =?utf-8?B?Q3JFeHlhQ3A0ZzNHZkh3cHB5Qnc2R0hmVzRwN2R3QjNhOTIzU29sUDBRSktx?=
 =?utf-8?B?MUtDQmZmcDZTQ0piZlU4TTFWelp2T3lhUzQ0RktOUnlTRzBNc3I4UFVnaFFO?=
 =?utf-8?B?VjAyaFNTd0gwUUJqT0x0bWFDZzM5OHN3S2ZNWGxCZTBPeFJHWE90TE9Rck9s?=
 =?utf-8?B?VFRvZkFGWHJ3aVA4a1dJaVJPWlp0cGFBdFY3WnozSTZyVjNlRk1vbktaaURv?=
 =?utf-8?B?Qm9GQ0ZNSWRhN2RsL0tjYy9GOGo4SXJXQXBwbVhFOHJSWWhKMlNWVWxDa2Yx?=
 =?utf-8?B?T1pxc3k3MFkva00vVmIvejd4aGgwaUg3K3d6bVpiSFc1WThvYnJmU21yY0o0?=
 =?utf-8?B?dUtkTmtqVE4vNk5BdldveGFYdjh0YS9hYlNVT21ndnIvb2t5UkVISHEwQ3BI?=
 =?utf-8?B?Y085emNjMTcwUE9CbFRZTCtXQ2l6Q2dDQVlnZUVReXk1aVhlYXo3cDJlYTF5?=
 =?utf-8?B?L2h1aTdkWDlhdjIxQithYXJnZkVmMjJRZ1FIa1VweWZwSWc3aEd1TGxnbWpW?=
 =?utf-8?B?aHZUMjhsNzZVQ1VOTjdGd0ZOUmFXU0M5ZVRDWjdTa0REdzNGcVRZVFc5YUpr?=
 =?utf-8?B?Qk1UcURKMEJpQXlmWWF2L05BWHNheWJNMVJUSUFDTjkvQ21FVmR3akU4Mndk?=
 =?utf-8?B?UC9kQ0FRaXVjOExFU3JBZkpQaDRud0JYVEhVNGE0b1J6UWxxcE1lR01pa2tl?=
 =?utf-8?B?VWExdVdkN09oazZQcTQ5QUVuTHozdm14cXlWbE1ad1JTMTl5RlhBaHVZQmdG?=
 =?utf-8?B?Y1c4TzVCZG1OQTA1Y2ZPZU5ndUhOZDlLWnp6YnE2bnk4QTlqN0Fpbzdqb1hT?=
 =?utf-8?B?Yktjc1llMVd2NmJ6R05oK2ZwaWdYUUhpQklQb1JwZXJ2MWZ6MTBvM294OU9u?=
 =?utf-8?B?OTcxWElZVkVaWHJaYTFjS0RiK0NpQ0tqNjZYWkFSbTlBN0lITCtwMHNJc3N5?=
 =?utf-8?B?NUJ0SFZBWkQ1UWthQjlFdXN6eDFaWFc3OHVjRUc0Njg1Y1R0akc1WllXUmJ0?=
 =?utf-8?B?TUUwaW5tUCtrVDJHMm5MWlBKZUpzRVcrdTkxMUU5MHNtK3RvaVAwbFpxWGhL?=
 =?utf-8?B?U1lTcFZtZkZXV2RDN2JMcnpJZnFuMmFSR0wvRm5VNkVSbFlDN3BZcjJ4ZGYy?=
 =?utf-8?B?SmNrbmROalJSejBmRFFFL00rNGRMcFJQbi9GUzgveEZzbU55NzJHVlRjN3kx?=
 =?utf-8?B?eHNBVEduNHVrUlpCbUxkcUtQZlFaR1lHWnRUa085ZzRNMHJucFdrUW1BNUlv?=
 =?utf-8?B?UGxOTi9odTFuSXAvYllya2ZTQ1pIQk5vTVFXTkExT21qMnZJMjRvZThiMW4z?=
 =?utf-8?B?d2w0Z3lYZklMMW05TWxwVGY4UjNPcmpseDljQmx0OHdGemNCOVkxRGllVU5s?=
 =?utf-8?B?b1M5V2ZUTFZNZjZIRnpCMEx2d3paMUFCc25iTWhlUTVrQkxqdjM1SlVuWjR3?=
 =?utf-8?B?M1pMd25kMzZrT2RBdWplK3dUT0xrelA4UDVVYUc3MUYrR1dGejlYY0FNNk1q?=
 =?utf-8?Q?sKIpTMp44hE9gIxoUj/T3/M76/TjnG+Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1J0enArK3JaejVta0dOTUZTODFHZkYvdXcwdyswZHdaTHZwdXVGd2NXTkls?=
 =?utf-8?B?K1hxM1FGYTFSKy8rUEptbVNGeHVXQkJocnNQQlpVSTU4UzJUejY5U3lic05O?=
 =?utf-8?B?c1UxS2l0SzN1d1Y3YWRPRWtaWnJWWHkzRUR0NHg5Z3pPRnRFWjUreVpPL3h6?=
 =?utf-8?B?U0FHNktJOUJsZEZWakFVaGlsb2kzM0tUYThQblF4QTRFS3I5UVJPRGVIL28x?=
 =?utf-8?B?UCs3UVR0eTczWFZJOUs1b255aUxoM3R3NjFHR3RvY08xYitZMVVVazNmWFZE?=
 =?utf-8?B?TzNPc1U2U3ZsMGQveDBrY0dTWjBRaXZoRkxoTUEvWnhNWUlERFNoR0RQMXNw?=
 =?utf-8?B?eFltcmNoK3hYaW9IZXVqaDV2dVhVdXYweHo0Rk12WnBobUhKMVI4QjlsTEw5?=
 =?utf-8?B?Tmg5TllQUGtLOUYwSnRBVlpRQklqcGZQVVR2UU5oNENHOVhLdldxaEw0YlJD?=
 =?utf-8?B?WWVMdW1OQjJ1ZmFUa2pQUThZRXdZNi95RFA1eUdZSjBJbVFURi83Ty92Vm9K?=
 =?utf-8?B?SDJLbnhWcmNnbXNtU2toNXRCTWVIQkt3U05qb1BFaDZ1dmxId01mcVkzUG5I?=
 =?utf-8?B?amRvR0l5Z0xhSkIxVHRIRllrWWxXRFJ2ejRQN3c4aGFqYytXU1RUQlFLdXdB?=
 =?utf-8?B?enk1aE45MFF6bjZuOU9PN0Y0WFhQRzJxZ29uSjhhallkVlEzYUl4eTZucXE3?=
 =?utf-8?B?YTg4TUM0NVUzbzFBZk1WUENrd3VreEJITmdpNUR3Slo4enNZYnRZSkNwYXJj?=
 =?utf-8?B?SHNPNk1wSVNXTml6RXJmWXVqcmxUODJvNFd1MHJTMERvS0luZ1NRWm9wOXBo?=
 =?utf-8?B?N0JLYXY0bE1XMm9JU3JNNHdIaG1oWVdkMllyYTlQaHlYM25QVFNNUS83MlVy?=
 =?utf-8?B?Z0VMVkhYOU53Qkc2RUpzWVJsVDhjVGtvZHBhaW1OQWRPWFU3YktRUDc1MTBl?=
 =?utf-8?B?K2wvZk9FZ2NqRWhwSHh1OUI0clhpNTRSK2lWU2JSZ3FNa244Rmk3RGdVTTli?=
 =?utf-8?B?c2FKTFJGajVSV0tpNnVUVmpHU3NDZGZKMlpVd1hTVGowVFVpUzhJejUyWW1U?=
 =?utf-8?B?cUxEZGJDQnV4ejF2aEYza21RSE5hZWppcCtsM2hIaFBmSjI5dmNtb2lEa1RE?=
 =?utf-8?B?Qmd0Q0lQT3hvYnRWSmx1SlZ4OVY4ZDQwMDFGUnFtaDkwWWR1VmtDbTVNOVBX?=
 =?utf-8?B?aFAzTFJmb0FndE4veTZYOEVOWjFLRDk5NEc4bnhEYWU1eEJab2IyUXpkVTJn?=
 =?utf-8?B?eFFwd1hKa0l5Z3N0aGJ4ODVpcm5DUE5HaFM0M0Y0YkxKajFFNlFVQkRDL2Rp?=
 =?utf-8?B?Y2pxeWNsWDFHQ3NKeE1UWHl2M2xhQW1SVTMxT2dDaDZCeDF4UjJRekxmaDFW?=
 =?utf-8?B?bW96M3FRNWcvbXFPZEtCSDZTZ0hnTzFoR1RFZ0ovNkxwYmJiLzJqdDhGYVJQ?=
 =?utf-8?B?ZTUzVStnaTNPTGkzNytvMUcwSGFMSitlWmxTUzhEanlPRTJDdExjN3hYbmdz?=
 =?utf-8?B?Mzh5V0hhMjFtd21HQnJtN1B5QktsTDRTR2xNdC8wMG10ZE44NFdrektNTi9l?=
 =?utf-8?B?Q0Y0M1g2Y2doaWdha2c5S1I2NTVkdnlCMXk2T1FCT2xzcG0rcDhjbU84SU94?=
 =?utf-8?B?dUFKNWh5RHVPQU5EZXZFQ01sOEtNejhjNXVwck8xRzlhVm1ZV01mNTlTYXBv?=
 =?utf-8?B?VDYrNFJ6UGdvb20xcHN1ZDY5MWpQKzNEUFExZUVNTldlMUNFNHpTM0hOd0VR?=
 =?utf-8?B?OS9pNFV3VlFxQ2hSalNiM1ovQ1lpNmZvNHdFUVV2Q2htZ0p0MnNaeU4vdHc4?=
 =?utf-8?B?RGJNai9mcDNBVElsanFwbTdCQlZxSG5EeC9Ma2Z5dzVucytsUXBmM2JScVdl?=
 =?utf-8?B?WjdHTWVNa0c1SHJubXdrTDN3U1NwYWhoRm1jeVNNUE1TZDlUR2p0Tk45Rm0v?=
 =?utf-8?B?cElEaEJLNk1vS0owZGhZSUR0am9FOUhncTduM0NqeHgxZDJxNVp3ay9DZzJK?=
 =?utf-8?B?ZGU5dldKY29sMFV3QXp4Z245SDVzOFErMUoxdWl0VU54enFDZE40YUJ0N3Iz?=
 =?utf-8?B?aTE2VHJUNFBha1BXcHhTREd0UnJDNFlQMXRqUy9qVWVMTjNBbXNSYTBRazFo?=
 =?utf-8?B?aGNGeFlYL3ZjTnFYK3lVRTJpSGN1MjNPUnYvUXh2bmlnVWdhYnRQaFQ4VjFV?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d41fa5e-1fb5-441f-804e-08de373a45b6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:47:35.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wufmpNQPTQfDVPKH7ej5CNAcZ2K+YscqYL4guS47FHuPIGvZ6EfRDeQnJIIm7Q1d+p1wXiE6LpX/lkleYwgBMUS7p+w+ttbpH9wPkeHYpHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7393

On 08/12/2025 12:04 pm, Jan Beulich wrote:
> Introduce arch/x86/lib/, and make it the home for the somewhat misplaced
> x86-specific file that lived in the arch-independent lib/.
>
> Introduce ARCH_LIBS-y as a make variable, to arrange for arch-specific
> libraries to (generally) come ahead of generic one(s) when linking. Should
> any library be intended to come after the generic one(s), it can be
> appended to $(ALL_LIBS-y).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

