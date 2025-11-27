Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE77CC904A7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 23:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174466.1499415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkPM-0006Ep-Jz; Thu, 27 Nov 2025 22:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174466.1499415; Thu, 27 Nov 2025 22:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOkPM-0006CL-H9; Thu, 27 Nov 2025 22:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1174466;
 Thu, 27 Nov 2025 22:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOkPK-0006CF-T1
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 22:24:10 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b5e348-cbdf-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 23:24:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5330.namprd03.prod.outlook.com (2603:10b6:a03:22b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 22:24:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 22:24:05 +0000
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
X-Inumbo-ID: c9b5e348-cbdf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk6yL5w74g85dfbBdO4h8MFibYVZhj2EvXlgbgBik89V0Z/2O30xYiknLcr9imPgZVZ6EFO4gV/HNA24UsHagP2Dz0RPvRAS3qzRpEbRP4L3IGhPLxIv3aYs809JaB0j1qy+7JQNYYyy1c8N3euNDE91cQEz4JXhnOjGTZGlM2dSasAg5fCsrO3YCNgQIURZy2P8c8FFjPEYQOtW8Vt8y/5UAM4CZikZZ2iWUIRfMQb+/vVbQRh9mBxZgTImBhmfPkbkHz0EoPfbmOqYlaEwD/WHGs93SJVG+7KszqdXRwKntlmfpWiFMET1pEf3ibcoe2lLbL5ckEAhWUOPS7GMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPu3PEbV6cuSadulq44b4osCqOZ6CTryk1OM2RHyyrk=;
 b=TqMXpzWJy+m9JsTdTwZMVkgDwaY0X08nKOOERaFcfrKfg+1XeL735JjPwBCoI3vej7rW4D3IT2tOQzVpz5mgZThbwnpX+DMXgqT0s0/KuCjZC5l0BSq4vEtlQusnygLBTtaO1BZgIj9ax28if2iLHRFBiZ6sLC6MrHYk5APXLGbKSDptwFQ3F28NJ3E0q8YrjHjoVsoW0obRzfD9HAHnz3TCFE9MGDv0jI6jiyBxO0LmDl4/PIQSBRW9ytQhY+3YrGZo8xzY9P4JBMxz6RcIbrNoHtTecGrC8mmqUphntoagmjzgey0FvU5wW0P08lo6zjVKs9a0+O5DYi5Lyf3vjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPu3PEbV6cuSadulq44b4osCqOZ6CTryk1OM2RHyyrk=;
 b=lzwlvY4L6ena8LS7xYtNbT6X09OX324BESJGcbtgmCRLIcmjr4DI3Riw5bA1uBAMgNsKCHOuP0vhnSw5S7CRU+FVJHxwDGAmBIjeRfm2DRHSu65NdnZXSyhadI2fLwpGnD1ibh0KnsKQ6pvisG4hPNpy9M/1zVwb0vBiIjUwEfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <802d2971-4cc0-46c1-bc24-4ec15c712118@citrix.com>
Date: Thu, 27 Nov 2025 22:24:01 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 0/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251127221244.3747918-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f75f457-fa8d-4d70-2a41-08de2e03aca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1p2aGMzTENZYnl6RjlxNWNHdWNWb1YvNExqcTBIOFpGcWcwRThpSk9QOFJo?=
 =?utf-8?B?Z1d3ZjdJUE5Fb1FXMjQ3RGsyM1JVSlZxY0RDUjNNQnZZVUhhOXVUMjdCSVNr?=
 =?utf-8?B?VkVyMVQzSHVNTHlwcG1nN21abEkrSjZ3QlUzR3JsMk9hVzY0SnZtM3dHa0Fi?=
 =?utf-8?B?MTdNOVJjclp6bEpUa3AvOFU2bjFRZGFraVIvR2tyTkRmSFdwWDIva21CSzAw?=
 =?utf-8?B?Y1p3TjM2bkl6dEs5dVJHZXFSWDI0VUhvR2RiWUxQM0dUNmdGOXJXNTFsK2Vn?=
 =?utf-8?B?eDVobUNYTUpRdGRnMEEwdS9RRmwyUFl6WGtqeGRhWEtjamgxaTR0RlVVdmxD?=
 =?utf-8?B?NkZZby9LckEvN3pqenpnR2tBemZrNzZnbk1BZHJVTW8yS2lXQ3E5bis1Z0li?=
 =?utf-8?B?TzUzekFmMVJXSzZLcGpKcWYxSC9rR1RWTWRyZkh5MlpXa0diQjFLdUNsTkNp?=
 =?utf-8?B?elVpU1FJSlVpOTBXblJ6cUlsTWhpRS91VENEM3JiMmNHTlliYnUzSjU2U0gx?=
 =?utf-8?B?UUhsc1BVUVdqOUNyeXU2c3lwYUZtZGtWTGgyWUpqRUgxZjBFM3ZzUW1ScXRP?=
 =?utf-8?B?T3hYQ2RPZ0cyeXFpa0ltOW9vbU5ZYjVEeitEQ2xDSlZhQU1yN1F6MDVUeFdS?=
 =?utf-8?B?R0hBZ1lMNTRSQSs0QXRSN21pbXI3MjF1UVBnNmNtdEZVM2VpTjQwTUFPcW1I?=
 =?utf-8?B?WXUzUG10MzNpR3krblZHSWFFOVRCOWhmbENtSXJFdmg0OXdQU08vWGgrNHZu?=
 =?utf-8?B?SWxNZlNHdWtnL1BqNkJaZ1lsdkRsank5NjYyWUVCYTF0c280SjAwT3dYSWVS?=
 =?utf-8?B?WEF5cnpUOEJ1Z0RoUzNZUXRiTDE5R3R0bmJVdzJSVFZTcm4xN3NEbU96NndM?=
 =?utf-8?B?RUFhOEhWOW91akVFakRMVm95Z0c5TUM2Vmc2emg2OFp0ZnVCbENFRFNIeW5M?=
 =?utf-8?B?Ry81UmV3aU9NOUNCd0pUUkRjOTJaRUR3a09rdVN3b2E3c05kSXEwZXRBNmVL?=
 =?utf-8?B?KzNzMFNhY3lOT2ZFM0k1QVRUaVA1RmFrU1BtRytQY2VLMlg0d0Z0RmYrMHJJ?=
 =?utf-8?B?Q0NhaG8rdmkwck50d0VKV3AwZzNtZ21kR3NLSllEdVJqK0szMjJXOUh4N2dZ?=
 =?utf-8?B?VFV5K0R2b1hYWkxhc0ZscVlXVXVNakszMTRjL2pET3BJRXdnbnZicEQvazJk?=
 =?utf-8?B?cnhLOGMwVG5ETFIwS2VrYW1TU1NHd1ZJejU5a21WeUY4dGl2S3MyL0xla3Jj?=
 =?utf-8?B?OVhBYnBjMFNsdS9pbHZNdzRISlJ2eDBaSnJmdG4xSkxXWEMxNUhOWVJEWlp3?=
 =?utf-8?B?L3pKOVBhWmtwMzQydlhNK25VTHhhTzc3Y0xiL3c2aXI1L3V4cjlTZUlRek5S?=
 =?utf-8?B?RnREQzFya1hNWUliZk5tT0pyQWhIZjRuVlRjNzBvNTMzVEtwOTlpTzVhSnlT?=
 =?utf-8?B?QlNzcVllVzByM2hyZnBsdXJLbEI3T0pTcGVSZFFsaE9Jb2NVeDdTSkxzZnJL?=
 =?utf-8?B?MXJtL1lvQkNCY3lSZnpkd25kbzVyOWRMODYzaUtxQVByVXYyMjNwTXMxenRQ?=
 =?utf-8?B?dkxGUmZ2elhYeWNHdmpoMzZOelZTaHhDRXRHd0M0UnRkVkRTSjBhd3dMVXE3?=
 =?utf-8?B?cGRveW0wMnF1U25DdktsWlp2Q0NNUGlPZWY5eHpPY2ZDQjZSMXBaM3hjRUZD?=
 =?utf-8?B?blc0RUVQZEx1YzQrYzZObHAxRmtkUWUyMklLRUR3YnFtYzFVUmVjMmpqdmp6?=
 =?utf-8?B?ZFl0Y1gwZ2J4ZHMrcGMwaVlRU0htS0x4TzkvRkNSRi9WNTZDWGZmNFFqYjVT?=
 =?utf-8?B?Z0dWemZYUW1XekNMR1lRUTlkclB3aDhmdXNMelB5cnhZZnhJaFdOS25mYUdx?=
 =?utf-8?B?dDN0WkNKVTQwbTFDTm5KMzJYVkM5VXBKbUhWS3JrS21zc3pMbWJVTU1mdmc2?=
 =?utf-8?Q?FVJpsk6EqtkTLIbEUVk3iGm6OnQF2bbV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGo5eFNUZ2g0QnNuTFVLNTUxSzRVNEVuM2s3Rjd0RzU4M1dwYktqTElQb1o2?=
 =?utf-8?B?VXUrRG4rUVJpbG5JaFdUc0JtUC92T2xjMzFCVXRkenNpUDlNd29Ld1RzTUZX?=
 =?utf-8?B?YjRldTAzalZsT1lPZkxjQS9WcS9QODlhNldJaEdUUVZaWmU2T2VYYnZJVkJD?=
 =?utf-8?B?R3hmYmdSRFhtcmZKZXlxYUhydzlXTlVkNmRETngxM3VvU1NvZXJSbFpBeGw5?=
 =?utf-8?B?RDRzZmx4Y2E2ZGlTcktZZXlsVFhaVFluWWlxVG81R0w5VU9lRmwrb2NISUoz?=
 =?utf-8?B?SlE5WmJJMEN4QjUvb3V6WTJYYjBId2FNaTJyWk9SU000WmtzaWh1OVg5dkpr?=
 =?utf-8?B?R0hTM294b2RoMjUzbzJoVU1yZ2s3RHhEZVBkb0N6N284TlhWUnpobFFNWk1T?=
 =?utf-8?B?TGsvdzBWblBsTlRtT1FmWUZPRklMdy80NFY5aXF5dTYvK3NTZFc3WHRna0M5?=
 =?utf-8?B?TUlGWFpzaStyMVpQNGZOZEUxVWZWL2hJWTJMaGV4ZCtRSmhobnhsaVBjSHdy?=
 =?utf-8?B?MTFaWERtbXEyV2JTM3FJL3hEOTYzZVJXcUdFcGYxNGV1dDBvVG9wWXZqTkQ5?=
 =?utf-8?B?NmNvZkZobUd3YlVqT0ViVVF3bXFldEl0MG54VnhrMlNSSlVxN3F4UkozZTQ4?=
 =?utf-8?B?VWh6dmoweXBOa2ZxcEdnZk9PckhiYXBkVEFUYkY5bUIvZmpETmZxMUZwaHp5?=
 =?utf-8?B?SU00anl2aEZlSVBEYzliTHR2R0NITzR0eXBlQW9xSzJYTjk4eXloNjBmcWIy?=
 =?utf-8?B?S3hnWmw5RUdQVzVsaGtUaUE5YW90NFEvQld5bUpSUUd1YXJrMEdsWHg3NElT?=
 =?utf-8?B?bUdhcURQUmYxQitWam5FZnJnRnNPa055bDNVRGErV1VIbm9BM3grWlJRZW5U?=
 =?utf-8?B?NUo3dElmY2tqNlRaeFpBdEsxNFdsN1JJcko1dGVnWnpWcFVDZzFIdXVNR2Iy?=
 =?utf-8?B?L3dkajE0ZXFBYm1wQ21ITDVNckVnZWY3U3VYMVNFM1BLMUs0TVAxTVdobC9R?=
 =?utf-8?B?UlQ0WURvbklZUHJzcmFwL0prLzY3MUx2ZmpqZjV6NEhvRzMvNUJGM3NHeGJL?=
 =?utf-8?B?emZwclhEbm5oTmhVRkJWMXQyc3lHT1NFMWx5dWdGRUxkb1JBTU5uOVhDc1BP?=
 =?utf-8?B?bFY0OHpLUVBpdEs5aVdyb2s5UXdHdXdEVDNUN2d2Ny9PK2MvSWpTcU15MGx2?=
 =?utf-8?B?a29kd2N4aVZva3drWmZvSWZ3UmxIL1VmdkJmNkhrUVNaY1QwMWRzRkptQjFy?=
 =?utf-8?B?blEzZHphMkxDOWVLS0YyQTVFUVVjTVVPdWFTN2F0TmNyQlZoTEhHeDdwTTlh?=
 =?utf-8?B?MXE5cnZXVWlKZ090U3drKzFrUnl1MlBac3lNM1dNdjNwb0FMS0l2d2Z4LzQr?=
 =?utf-8?B?eWVDVnBEdGNna2wrQlZjQkVKQndjdU9VcmtzNFFpdTk4MnRNZ0k2K2VmdW53?=
 =?utf-8?B?dEdjZ003L2dMNFkvejlxc2dkYTRyL0plRk9CUS9IU2h6dWsrODZ2RFF4NnlT?=
 =?utf-8?B?UWdKUTlGQlFJN3c2V2FEZUxZVm9UZEdoY3psbURuaHh3Z05RZ0VITS9CMDJm?=
 =?utf-8?B?elRkS1VaVTRoSnV6VVZDUWNsY0JvQXcvQWVIQ0MxVjYwQW81OGpMS0xvSmI5?=
 =?utf-8?B?RXhnUG95NEV6VlEvbElSSzV4WG9haGpNWUw5SkJ6M05rQjNwWVZCMlFGaUxx?=
 =?utf-8?B?UnVUbkVHMXQ3cUM4L1FSUEtuUWE0UG1nMGNubmlkSW9FcHV3MTFZOXFVRjJm?=
 =?utf-8?B?ZjB2OFBHbmZ2dytTZkxOT2o3QVVyOTlmWnoyWWhWVW15K1RLdXpIL2NYQ3po?=
 =?utf-8?B?UFRTbDVtSHhUTUxNdGRoWFFLOW8wMW9JN01TSDJMdjRzdFZDMUFDVXl6SURL?=
 =?utf-8?B?ODd2ZnpMWDUvdWNEZW41S2V5MjlQRi81ZGVRV0I3ME1IaUVSWktYNmVnNjBD?=
 =?utf-8?B?bEpqUnhBNGkvVWp1SjdyYS9uYkZRaXhGbWdQbE1kVCt1cHZSeGZHUTRRa1oy?=
 =?utf-8?B?U1NWcEZmZlVjdHdUbHRuTUNmeE9DczNCb3h2Ujh2Z2FzNFVzck55TUVhVURV?=
 =?utf-8?B?d2k0eEhheXErb1Npc3BJSEwrSEltWEorcHMvTnVnRTdNOG04WHdGamdyR1Bj?=
 =?utf-8?B?WkFzNkNnTjNRWXFnQXVhV1FkbXhxL2doejJtY1RrVEJjK2xFa1prUDVxZVM1?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f75f457-fa8d-4d70-2a41-08de2e03aca9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 22:24:05.0256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m4afvLOxGCcYN3q8C40LEzbe4UtI6JfWd9WNYJN2osbwHfVsdmYuxZYvnKL55jg3wxi2hUKIS6+Qm491sdlOVEdT2py76NcygeP98GCLH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5330

On 27/11/2025 10:12 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> 1) arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
> 2) add generic domain_clamp_alloc_bitsize() macro and clean up !x86 arches
> 3) move d->arch.physaddr_bitsize field handling to pv32 code
>
> changes in v2:
> - split on 3 patches
> - move physaddr_bitsize in struct pv_domain
> - make minimal style adjustments as requested
>
> Grygorii Strashko (3):
>   arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
>   xen/mm: add generic domain_clamp_alloc_bitsize() macro

These two should be merged.  You also need to CC the ARM/PPC/RISC-V
maintainers.

~Andrew

