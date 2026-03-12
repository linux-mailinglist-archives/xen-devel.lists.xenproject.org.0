Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NaZAFCysmmYOwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:32:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66151271D06
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 13:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252314.1549039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fCr-0001AG-4O; Thu, 12 Mar 2026 12:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252314.1549039; Thu, 12 Mar 2026 12:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fCr-00018p-1k; Thu, 12 Mar 2026 12:32:01 +0000
Received: by outflank-mailman (input) for mailman id 1252314;
 Thu, 12 Mar 2026 12:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0fCp-00018j-PX
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:31:59 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73af60e3-1e0f-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 13:31:54 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7210.namprd03.prod.outlook.com (2603:10b6:806:2fa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:31:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:31:49 +0000
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
X-Inumbo-ID: 73af60e3-1e0f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhJ0TqJTVfcfluv1ZeIpcKIxyS23KwJgaX0JFKPIsk0588JLT2HtG355L87a5gWLCw5Il0UFDZYOUW5Y3K6JO6rOiE/kMxBgN8gn6FmXDJUTlGTQgINsTBcKIjV4WiFv37dbi3TJ9uv/rZMy0TP0MJhEHxr2tIygMqJ1+he7Xa1ND30+5Ze5STIrMYIVMDVNi1wz+RboXN6rZZ5796zh2GeORkZ9EUqI7mbzDHKUmfIG6z+hW4pNR8t4+77x+tItSnW1N2Lz4V40dhCaRGXR5E58RLEVxHKAfS5A80lli73duxs2ESPuCFcceZGHZFUjXGkaZ3w6jnufaKXNGO0XoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgMUXblSAtUGxPyjoxrcj+GszBtDksuPpbNI4IWo2j8=;
 b=vDU01SRkqWt2WyKrfrDb9wv/l5USJ7LuYIW31YV24UifOGdTktA0NlVFNv+d8ghWAC+DD+uGqZAPtokhYCsZnjP0P0UF/nrN4628jXJk013VZ9IXgLW74C7zKYhYQ5zj2yAsS4VUABHuVm/a1PtY2h0HQeKSelJMsxNsv3fx4M9KT5pOiGWn9t0NvOz2phwkauim4HdUIhuT59kaXWn9XCe6irzh22IcvTbJB637VkmoOqt8LuFm1V3KauN+v+4yKMhHjeseqc5C/GgLnvBEcVppoLXkGBmIfCpDsOExexl+J44MMS5dtgaMZW/HerGakdsSPjTVWl4O3o63zhIK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgMUXblSAtUGxPyjoxrcj+GszBtDksuPpbNI4IWo2j8=;
 b=l9OBLf8QRrwQIt0ObhH0r1N9UwcT3+YtsOGK9w/dNZtqPYL0phIg5Airc6mqGRHyEnECZj0ehWBP7BzztcXDSLcnGdGe2/7aWa9gwajf3J3qIEGwRUf99yObrUedhJ6MnZmor+REjV7fCiHagU7q2pSiKXGiCiAadXHMCuNbS68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9e209a46-0896-4ebe-a366-4638b562778f@citrix.com>
Date: Thu, 12 Mar 2026 12:31:46 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 1/4] docs: add man page for xenstore-exists
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312122240.2784725-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: c56266b2-7884-48ae-ec24-08de80335529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	fhjwMwfyo3lGEbjn4mdwdAIxQOB6WBOvDuPoF442DJTRp1sBrQ6QkW4nJh8aJNB3AGn8V+MRInvc6o+RiJWUfYKdkIkQ15HN046l4LGNnYKDQiKVmmCC3zCFL7NuZK/G+IZUY+BUhltpiIixDx5mp8G4qHS17dDbZJyLNMYpBXx2CfhPwN9MjeVwTVRByVBwXrbKthvzGKyiAm/0Mtn+B+X1MVSt3CU3RalwnyjHt7iDdZnoWi8Ox79kJd2yIvVqPFp0uWkCkfS377EfmRWFVaQuVKZ5IkoxwZuCv8aHPfHt1HVUwd9hEqnvLtGHkB11RmbF6stu6DSbEb38fG81R6HvTlYsQMPHL350TrCVb+lg2D4EpJ2Oxl1ARqD+1gyY4o4OTmFbw/goz6tdFE5NmbvdrSTDd8PnZaxnjkbjz2QCyjvsoR9gi4n4DVguaPbeLWc+IOtRS52WarWPLdkVIBGhWwr2Wb5CC8RWGaen+ZuCWANaZflywd9sydrsfIXxwG4d3ioXr+d43Tl9BAxTOJvjpwd9v2mKeRAFTZPF5MBXnjYjx/P+ZJt2KM6qKHIY1U/iMxNZn0kzDK9KGvxmHwjfEdUdaDRz1v6o7IpCfGyDRbV6399/79sBlUvPmJ4ix70sVR2kX8BtfyXsQoTzocluzsL8MSCYk8+XuC6pqF9dlnaK/BztFBiR/OmHnh0PyUikeM1PfnHnqgvGoE7IgGpjYQbCuzwsSxVvC0Q3nUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0Q4MGJhNUt1VEVRaGxpa3RWOFE1THA0bUJ4WTRaaXFVcEdrUlBoZ1JvRDB4?=
 =?utf-8?B?bmJOSkYzcUNVdVluYnFuSDUwZ3g1empLYW1uZkhwaEdWSzlOdFpXU2N6MkRJ?=
 =?utf-8?B?OUdkUVpSd2FESTJHUEo1R3ltYlcwOXVNeDNtUURYNTVnTi9nTVJuamNIdHk5?=
 =?utf-8?B?c01BRC9ZeHZkSjNqZXJISlBheHIzRFhxS3NTVUpYZXRVSWtlME5NWTk2YjFM?=
 =?utf-8?B?Tlk2VkNxTkQ4RUh1eThUZzFiTjYzWGlhbXVrK0Fuc25zbVdxbTlLREZ3QU40?=
 =?utf-8?B?bmxDQ2ZCdlJEaVpJM0ZJZ2JzUGVUVTBkbm9XblZjUmtKVllhYXdyZGQ1NnZD?=
 =?utf-8?B?bTJqMEVabWtyVzk4bHBUaStVSit0U2JnUDY5OVNsbC9sbnpmTnRXTTVKN2wr?=
 =?utf-8?B?WGVOUExvR0EvdGlzUmFTNmxrYm0zUy9UQmFNdHlIeXZzczBVUDJhUmRUWXdT?=
 =?utf-8?B?elZTdlpiZk16UVNCcmNlUUhIa2xtRUh5SVUxeTVlU25LdFI5dVpGcFZML1Ix?=
 =?utf-8?B?OG5YUnl3Vjc5ZUptOXpCRXhmTkpEazdScGdUWHhzaFNzZ3F4WTk0NHV2U21M?=
 =?utf-8?B?T2NWTTA4OHNJeFdYYnNVSjY2cFNQRStkMlJlMFdhdnRrbGVodlhJK0wyblZV?=
 =?utf-8?B?WlkxSDBUKzFMUWZ4WDZtUzI3ODBwVXVidit3Ym1obEV1bTJvV09zZkh1dEFP?=
 =?utf-8?B?aXoyZC9OUFlTVWN5SjNTYlZYbXBkNUxESXB3ZU9uWnpRbHA1ZE40dXdDc0Za?=
 =?utf-8?B?c0Nmc09qRjRidWVkN0tOK1FtUkQvTlMzZC9MSnB4VXZ6REFidWU1TUlkSkl5?=
 =?utf-8?B?QU1QdFkyZ1pWazU5TnpwU1BDZGRWUVpYT2t3TkFnaDJQYTJVS2ozM2Y2dmdk?=
 =?utf-8?B?eC9sVE1xOHdHVmNOTTBWOU0xMGxUSFJNdzhZbFI0cW9YZW5Fb1JML0hvVUpj?=
 =?utf-8?B?MmhKMEI2ZkxLNmtaSGRDTU5zUDROeWxHUVRULytXTTQ5VXVHOU91Y2lOL0or?=
 =?utf-8?B?bjV2MGVvTzlwZ2RKZ3VBbENnY2g5alRjRWhvNE1nTnNBNU1mWlVrWXljRC9l?=
 =?utf-8?B?Tkx6RUlOY0NCbWFxQ1JTL3lrcnh4VkpJRUo5WStqYmNYR2FZcFFndnJYV2Vl?=
 =?utf-8?B?Q3kwNzJaQkR5U3VURzNMdHVGMXcxSHhQNVNLc29uOTNYZGx5TVFhVkh1emc0?=
 =?utf-8?B?QjNlWTBHaDJ2R3NpNFZQYVgrSWNyYXRsRVViMnQxN2FXWUY2KytkcWg4QlB5?=
 =?utf-8?B?aEZvRlVEakI3TXcrNEZHZGVHTm9yMEI0cUZSWHFTMDZic3BoVjhDaDRDdXUw?=
 =?utf-8?B?d21HQ3N1NXpNcDRFWWNDOUF2OE1QTDVpYVI0amFtR0FSTU9wdGJUbmljak41?=
 =?utf-8?B?UG9kU1dwWlhUUkZjSlQxYjY5TXdCRmRvNG1UMzBybHNkQWpocUZPZnV6NlB6?=
 =?utf-8?B?b3FvcnN5YjJSdHlkRmlSVEhBL1hsZDI5NUlUQ2ptOS9qU3dReVZxSGFjcGE2?=
 =?utf-8?B?bTVwK1dna1BoRytISmNUTjNvOUNFNStJaUMzc0pCVnZBZ2QxQlB0T2t5bklO?=
 =?utf-8?B?Z1F0cmNFdXdSMlVjQUV3VlJPWjFzYk1iajlMTnY5dlBueDNDTnZWVjZWcXM2?=
 =?utf-8?B?TXlzUUJHdVJxYWF6Wksxd0xXUUV5bW9pa3V0M2VnNDZaV3oxREpXaUZ6Ny9N?=
 =?utf-8?B?NEdoNFUrN3h6ZW9Xbjd1dUdRZjdxdjM3NlhjcUFjMUdXaFNrNVhUUURZN2hX?=
 =?utf-8?B?UVZvK0toRjRtM0RsMlhDMTdSMTY1RGZoL1RhZnZVYTJlMXVPK3k3aEtsZFlM?=
 =?utf-8?B?T1orMUswcjRGVFRqUzJHRnRYa2RwNExTWTUxUE9WalRWNlQ2TXJqb01OQTdo?=
 =?utf-8?B?TlNMZ2FITmRrWVhjRXUxUGFlMmZhMWk0bzVIdFJQaGh3WitRWndreTZuWkZR?=
 =?utf-8?B?ZUNYcjQyb2kxdktsTXl4ZVpKeE51ellQaDkySEVFb0JRTURDSnljUkYwTDlx?=
 =?utf-8?B?ajQ3NHR4eGl0QjQzSnZQUE00aUlTdFJHVjZSTnUvSm9wKzVKMUYrU3dCVDlF?=
 =?utf-8?B?TEFKTGVFQUxzUi84Q3dCSjFsVWRaQjd5d2dLT1ZyTGpYMVdFMUx0Nko4RkFs?=
 =?utf-8?B?c2lONHVIVFNmT3pBeDdsYTRkR2h2YTJOamJIVWgxcjVCanpnSCtWaWJ3a1Zl?=
 =?utf-8?B?dFAweHU0WXVCYUFkSXRPWVVKcHpQWTJGZThNWWwvYVQvR2pPZmNuNUtpQml0?=
 =?utf-8?B?UzZHZTVoQ0ZzbFZhYnEySWlFU085aTBiUFV5RkJtQmd1amlvbUNPZXBhL292?=
 =?utf-8?B?aUZlK20ybmQ5ZStXRzFRbndKNDZjaU5pU2laOFhYdTBCRVZZY2puZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56266b2-7884-48ae-ec24-08de80335529
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:31:49.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZusL9i+pqR5kGZu4pViaCVdmPF6wPS2HQwKcevgYqKNOfSOLymvFE83dLgEJC8BRV85GskiHEI7eJF3xe9dprBuh5EmGyPBtF6uomffgbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7210
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 66151271D06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 12:22 pm, Juergen Gross wrote:
> There is no man page for xenstore-exists, add it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/man/xenstore-exists.1.pod | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 docs/man/xenstore-exists.1.pod
>
> diff --git a/docs/man/xenstore-exists.1.pod b/docs/man/xenstore-exists.1.pod
> new file mode 100644
> index 0000000000..c4d9eeecaf
> --- /dev/null
> +++ b/docs/man/xenstore-exists.1.pod
> @@ -0,0 +1,17 @@
> +=head1 NAME
> +
> +xenstore-exists - test Xenstore key to exist

This is awkward grammar.

I suggest "test whether a Xenstore key exists"

~Andrew

