Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CCdJze+smmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:23:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1607C27271F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252381.1549085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fzt-0001QR-QW; Thu, 12 Mar 2026 13:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252381.1549085; Thu, 12 Mar 2026 13:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fzt-0001Nx-NH; Thu, 12 Mar 2026 13:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1252381;
 Thu, 12 Mar 2026 13:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgz6=BM=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0fzr-0001Nr-Vg
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 13:22:39 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89ef8956-1e16-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 14:22:38 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6023.namprd03.prod.outlook.com (2603:10b6:208:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 13:22:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 13:22:33 +0000
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
X-Inumbo-ID: 89ef8956-1e16-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7+ugwDgoNY8AkRksLvZmi+o8hVv0liTjgOdetPOh/oNfJuDWnmk/B1CTxkcIRxeBRneKoEu+W1kvxj/Dd/XC2eOK7ibtebwx75voMmk+F1+/HO73jhyGNtsv3R70SJ0UWt9ZywmGtikpoFMy/vRY/mJfUASFi9mg8krecf21fMKQSKIkSNgZ+crpJvCQB5aTzASxfBEb+aHN55K0CcEWo12dr6zflcA16DTfIU64Uvb4kHTq00NPYsRY4nSezyWoBFKQ25J2sW8QJ9/X5WwHGOfBPgHcoLTodA8dk4ddFDmvVMVV1bhjZr+ZV0iDSuvVQsxmICX2ncKZeHdsC095g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V00vEOcDnCEcyt0UCegcczHt7TbBGG3md43HW5Fnsqw=;
 b=xNjaD3mcE2Uvus2ddfzWMdh2RdHM4ean+UovPmXgCKlODg1D5BCOjMg+gLTkX1ROPTyEP508marp0gD9VuihWirCB9wY0NKoyUsHRkWYIi3zMzgW7ZMBqaLwLkrKKSIGRJeol4n7X5xuxK2RsKBTs1XHBSjGZHiPhSI5aqU7eSWCW1EtoFILIqty2OUR5WGvwDh5bPPahICyG/5LhnPR1Myn1T2kxBsOW8DYmhwT7AsmRM69tedAyrWOLswsGtOTs/kK80v4eOcl0yU0hG0mrkW7t62hM0yA2RxtFKq6jdfXEoNs73vn9weLndKGzzPXGqTys1GlhYp4RqYUEln9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V00vEOcDnCEcyt0UCegcczHt7TbBGG3md43HW5Fnsqw=;
 b=YZySFWhf3cKK4FnqyChzm6zUNaUoegrl3pgcdmgfM0ftxn3VymKKdkqafyqOsklplFPW25/+FqTN+6VLRKYCT77fw6+RAsJUAIT7RgJ4XJPOCiz9US8SDvMQd6nhXkmRwjYfIfjOj/RllafnmM43RsN5ID3HGYGW6qfuNcF2Z1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>
Date: Thu, 12 Mar 2026 13:22:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 3/4] docs: add man page for xenstore-rm
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-4-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312122240.2784725-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0597.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: d11ea487-3ead-4677-46ef-08de803a6b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IYqZXn5853EumyVBdh26tddNlg62uzJc8mwMV1HrHaHD4TkpjIayTe04XjvANsrehLyTucau168+KT60fNr5aJD2Dj8OPuIegNJ1RrVnWzq0aDoFn4CN7Bz8FEBptfKMDg7Y+Z4tIZwzsSIwqW8RFQPA6m2GVcrkuKvwKtDfXvBQBrxLHyLb1MGVM4QnVYDSMpa2F6fKeN3Or3GapUXoRq0/62xLg1rS6DFwrevTgwRA3e5VTng9JTx6XQ80peJWlKhWb+9XH6Lsvw+bbrP4Q+qRHEBj/Z/vVD7pPRwF/Aa5AP7PGqbjwYfUHKO6d0tX8L4uQJJel2lYCHF5jBc9r3cotG1gxhq9z7II3olBoMTyQ/wDYldYOcujg3zN575oyvv+nKNqrKAtXtVjgIrzVhVGmtzahjFUKzEHwsROkPje2ICNowIF6f+fhstZNxv+W/yqAFP9ooXHBbsRe7yfCSbm+GMsiil6Ytha98/hpIGhvK0TDKCWjTHhtVXzsj4qA1t6OMWZECCHkvxKlKMUr5D0YFgobyngima7CfD+B0FZ6BlBB/Am87SBNJ9PRJV//HkU8HAu9HkUB/8pCR39t4JOmV3oVfvwaI5qRzSkC2Cr8Ong3UCFvo4MEZDq5Wc/kpbYDGgCHaHb56jtyLGBjxmbEzQZyrv3Z7ElFGxSRVaYrIBmszsON9t+zgT5XrAGnYP5YpUJnNf8jgHdURgIsRgHSWdl+szzB6uG8/oNHGhbc1DzXT/jZqSCjnDc8vzm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVVodFNZOVVubTRUL0VnT3BVUVRtR2tpY0FMQU5IT29maGRUM1NPTWl4VnNJ?=
 =?utf-8?B?azkrZmsvVGJ6M2I2cFYzMTRFb0VhempSc0xkdHFweU1Yc3kyTi9KTGhic1FB?=
 =?utf-8?B?bUx3Z3FGTTZTcVo4RDlYOTY3SGI5RnNSRWxWQ21mSlBYeDZXS3FQUmtJQlMw?=
 =?utf-8?B?Ym9ZOHlpVE1rRUhOVXdLemdPbHRITmlJVjV2YjU5U1BmdXppNngySG5YT1hP?=
 =?utf-8?B?c05LMGxnSWZvZ0VMUlRZdnRlM0hIM3Y3QkdLOXFBZ2JobVlFeGEvMjhDZmRT?=
 =?utf-8?B?ZDA2a1c1Rys1R21Qcm1sVithVVRmbStSNEVGWm1tdHFpQjNsU1k5SHhjTjVz?=
 =?utf-8?B?VTJBR0MzWTZXUGx4Mk1zS3FlNEZvTTRxSUoxUktpR0hPRStKQm8rMXc1dW80?=
 =?utf-8?B?Z2gzTmJuelJ3MmlWSEN3dDR1bU1oTUkyZkRmNkpvVHJvQkY2d2VmYk5XaEhL?=
 =?utf-8?B?K1A2RzAwUmJ5RitSczhZaUo0cFl4eUk1cHVoZCtkN2VuVktIS2V0UXJzVmdr?=
 =?utf-8?B?Q0NVTHRaYlhRQmxWQlUwK2NEUXc2bkxyWTY0T3dHVi9URTM3bExqZm5LY3ps?=
 =?utf-8?B?ckNicVA2SFpCZUdQeGg4N2RLWXlOSExuK2Z1VHN4aHVJY0lXZXorU0pqcG9E?=
 =?utf-8?B?QTVoMk1TSjRLOTR6QUM1Mlh3ZzZvWmRLd1pFUjNDMm5ZV1A1WmsxRmdaRWIz?=
 =?utf-8?B?NG9GUkJRNkJZQ1M2bDY2SXRFdXZ3VitTaFFEcWpOa0NYeWR5OGd3NE5MTWRS?=
 =?utf-8?B?NUphM3BiL0YyV1U0RURDYnZHVW03cG56TVY1RE1rOGJ2NFQybDh6WHNJdFl6?=
 =?utf-8?B?K3B1VVlZZ2szei9adUl2cjlDZFRXbmFET3k2WjhxaXZDcnluY3p2OWY1REpQ?=
 =?utf-8?B?NVl4NUdQNjkzUk1IUDdJd0xJVGl6TUdiSFlHOVVqTDRabXhhcmRZbUdBV3N4?=
 =?utf-8?B?dDdFUSs1UTZ3QzkrT0w0aTN3NDQzSGlXOUFtc1dseDhRaGYyb1RSODhNQVFv?=
 =?utf-8?B?MmQ1dkZWa0FnV01oWjUwM1hLTmFwOGtXSGFQeWQ4S2xObksxZktMdTRZOXF4?=
 =?utf-8?B?TytIRTBreUNGRlRCc3FVRVk2WGszQkFXWlVzbnBGQVdPUFJYRjU5cG9PbUtj?=
 =?utf-8?B?NVZURFNyNldnTzYwT0o2N2dzSndTQkhSN3hHR3hIYmErM0VVSTh4Tm5QMDZD?=
 =?utf-8?B?TGMwL3dQcmd3OXlLSDY5NXdxZFFyem52NFByS3AvckV3eUs2Tk1qUTFlVk5F?=
 =?utf-8?B?TjFXSHlTVHVzTW9acG0rL2cvc3c2OGJLM3J6M3BSVlkxNHJXVTR1NzdnNEt0?=
 =?utf-8?B?OFRPYm81OENwSVhaelBnWnNCeExEY3BMTGdjNjlaREZtbDlMbHJGQzBHRjNZ?=
 =?utf-8?B?b0ROMEVzMUU1OXg1YTRBYkcvcjFnSlFuR0QyL1ZpRVFWckFwMkh1YjFQb3NK?=
 =?utf-8?B?OTRmRXlNRmtoVFlnQjNVWnBSTE9nYllPREY5NVYyc3Q3TTZ6bmMwRWJReWhy?=
 =?utf-8?B?K0lUTkhKRWMyNUdad1dCZ3AvOW0wZUl2ekRDSTU5RGtSZDJERWtvZnMzQnh2?=
 =?utf-8?B?RTIzN3BndWVnUEthelBXaWQ4ZmdNcVRndEhUeXdOTUF0clZaNjJwTkZLSzVQ?=
 =?utf-8?B?YVdsN3B5VkdIWU5zekVQUU8vSWVYZG02S1d2a25DVURZY3ZRUlFTRmdNWk5P?=
 =?utf-8?B?U3RteW5UTzA1VURRSFVjaWZURUQ0UTlvaWVuRk9jUWs4VWJvQzRHdzh1c0J1?=
 =?utf-8?B?MC9ENFFYMlM2L09telhJVlRoSnVqWGlaVlE1U3NqanNhOHlYdGo0d29nak82?=
 =?utf-8?B?TTlmUHBvMmUvYVd5R1NzdnVKeEpQY0Jra25KQ01LZ2V2V2Q3enkyUUxreWl3?=
 =?utf-8?B?MXAvd0syRHpTNyt3T2NlUXczYnhYNEFSQm9NeDEyc1ZkYTRTTjM5ZENYMkJm?=
 =?utf-8?B?QWhEK09HUEdXS20wVDR3NmVHY2RnQkpFZllHcWtKVlBvaisyUTdjQmNmdjhG?=
 =?utf-8?B?UFFZeXgxWE4vV2NQeExHeWNjN05UTE84cXJTUWlGUkhCYTBraE1wWEh0ZVBT?=
 =?utf-8?B?eXJmNmNTS0lzZG9XdWh1dTRIMm1ybDRGK3lVWDF0Ry9xSWZSbU1OdTF0MXh0?=
 =?utf-8?B?NWx0TXJoNWdhQysvcUsvMUhhTDRyNFRnL1ByUEpWQnpIbFAxN3dDak02SG1Y?=
 =?utf-8?B?RUFJM3ZZcDUxMTlaM2JJeDhTdzJLRzNhSnFXMDhSVWxnWWNYT3JBT05nNnJY?=
 =?utf-8?B?OUQ0UE9IT0ZkaSszV3pkU3RNaGhjVGNOVGdYZktIbFZVZ0kwS3ZLZUlJY0xC?=
 =?utf-8?B?ek44alQ0aUpUR1RXejNkcS83a0Z1WjlCNy9qRmwrSGdrVXBMTmZjdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11ea487-3ead-4677-46ef-08de803a6b89
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:22:33.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbXVSTxDgsX/v7s0/QdoA2sVOmW3hszXTNepo9qxxyvwMNN31sSAlXctHAJqWs4zMrrx9OcU4MZY+0ICn7rK3EZ9SpY3xzZOfFEOrxy6N+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6023
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,xenproject.org:email,xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1607C27271F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 12:22 pm, Juergen Gross wrote:
> There is no man page for xenstore-rm, add it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/man/xenstore-rm.1.pod | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 docs/man/xenstore-rm.1.pod
>
> diff --git a/docs/man/xenstore-rm.1.pod b/docs/man/xenstore-rm.1.pod
> new file mode 100644
> index 0000000000..a85b971113
> --- /dev/null
> +++ b/docs/man/xenstore-rm.1.pod
> @@ -0,0 +1,24 @@
> +=head1 NAME
> +
> +xenstore-rm - remove Xenstore keys
> +
> +=head1 SYNOPSIS
> +
> +B<xenstore-rm> [I<OPTION>]... [I<PATH>]...
> +
> +=head1 DESCRIPTION
> +
> +Remove one or more Xenstore B<PATH>s.
> +
> +=over
> +
> +=item B<-t>
> +
> +Tidy up Xenstore keys which got all children removed.
> +
> +=back
> +
> +=head1 BUGS
> +
> +Send bugs to xen-devel@lists.xenproject.org, see
> +https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project on how to send bug reports.

# xenstore-rm
xenstore-rm: Usage: xenstore-rm [-h] [-t] key [...]

Looking at xenstore_client.c, this is common to all.  Shouldn't it be
included in the manpages ?

~Andrew

