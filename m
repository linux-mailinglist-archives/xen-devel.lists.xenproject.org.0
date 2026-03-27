Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKplNDTBxmm8OQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 18:41:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECD348857
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 18:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1266103.1556699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6BAD-0003Gp-UA; Fri, 27 Mar 2026 17:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1266103.1556699; Fri, 27 Mar 2026 17:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6BAD-0003DP-R7; Fri, 27 Mar 2026 17:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1266103;
 Fri, 27 Mar 2026 17:40:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w6BAC-0002wf-JY
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 17:40:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6BAB-00DPeo-KX
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 18:40:03 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c6c0be-e002-0a2a0a5209dd-0a2a4505d7f0-28
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 18:40:03 +0100
Received: from [40.107.200.45]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c6c0f2-5aeb-0a2a45050019-286bc82d140b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 18:40:03 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6624.namprd03.prod.outlook.com (2603:10b6:510:b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 17:39:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 17:39:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ER8Rp+GtITfOdd0/iV9a5T+Cs3NIpdk3+T3nuaHY9rcND6uejP8I/cZSphJ2sRZU1UnoBB2c577KuKZDYW2+Ku9XbTQ0CYqOwUZI27TR++mrQRG0WbNJteYyc7mHMXc4Zs9nGHEUKiB4xkGSCPBB0PqvvUTPkQyw1WltnLj3Qn6sV47xu/ZUCHKkfMfMByFSoWlB/nxqAcsoHQjTXdkrCJJtuXPgFvQvQMARUEoIHHuFag/+eIvE3mM9rRi/kEw3nR+AGY9IBAGVZUtLBRrXQib+hAoygTe99SddfdQ6ex4yrkczKlJ/GRafMd0vm3UcEnWOGEH+jup9T60HaDbA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyVfYYJLsIfQu6nRJym6crqaewUS2jJ6hc07Vn7P8g4=;
 b=PW9/xZuj6AV1w7GY0/bZ2SSf5QYp4CHM89BNh2dTXhKouGVKtFDuYa0m3l50IZDZwt2prgdJ2Yu2zF2VVLAs7Mcl3zXCuYDYIrmrQXq/2kWuxTFiy6LN1gScHcustmRh0cQ+UFj84W2OWJFcVwdmZwa5XWGPleQa8Fs3dhb+G4wKA4nlIgmUdkTcqOL+aMKHjwdF7J7EEZjafWo1YqEIbogINj4X8TUMktjqIfMTg76D35U3amtavuwbbF6PkKN061QKeNZ6/1qjtpn45O7BcCiwe/7nzUCuivyJdDPgDIl3xt/cuTRlQPHlOACU7nmNgSrnHxi8nd4rKv4t9s/Z/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyVfYYJLsIfQu6nRJym6crqaewUS2jJ6hc07Vn7P8g4=;
 b=hT7BVjr97pFkn1YLpUGQKZwHMRMWQnbYvjQiITu5tbSr3m+R5tgZYwnP748QSBO2d3nvbsC1KSO724YZaMrnDqa37+ZbJWm5EtesdrlMhU5SRJsL1luz39l4ixgvE4p0bsmqeeUpDOoNea5QU2/fAjnAG+/GwmoF6YEHGfhb9v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <49a3c6fe-db8a-4814-8638-6242dfee495d@citrix.com>
Date: Fri, 27 Mar 2026 17:39:55 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH] CHANGELOG: add xenstore quota support
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260327152103.438997-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260327152103.438997-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b59bd93-bec6-4524-6cb5-08de8c27dd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UelrBUr4HkC0zrqVEyzav2ni+XfOEa2/udWsitPXP+V9BiVScDrPAHmlYWJCrvJt3riOTsO4CUDjiODrfGePGK3kBgmS+qsB29ZvbaPjJlN4XfYPEwayPm2WpyyF/0ktRyJBqH0lZD+quuYoXS2qyy/GA2brVYgo7FBkZvZ8zU/Rz79ZwAGYrh5h/rZS2dA+rQVci71u3JInOAs9oO+tM3LhCjpFmbTMmQCiOBbfCmDJgwy8uG019p1hkaQPk/2wU3dlVsztB324mT5BdlxZR5fkTNevYfvmVTBu+m4Ff8WPWtGYEPUuLpduYgLNMWext5dj74ATT3WxYGl62AuFNt5cNxMgnm1qOyIE4RnUvuH68JHMETwBboAbHdQBhtdRxCI82H6R4qFXUv/xejLEbzeUnHmOhqTFpYPYdZNbt5hP7kgOlK9VHAaAfyaVZwyWep96nCRMD7G1SJxBeEjDcMixbMFSL/N7JaVlRSJLe5ENpo6JS+eAdaHZ0FjZHDGx/k2s/v6uAW015MxKPDr5TeqLbLNdT/8fc1NUdhJepgnSolImvZzA0LvuWFZBa1j1vyTfeQUE5RX/ANQFXAbV0CPeFK5xlbzTscd8WicFPNAeBtodFaYxUlnYve4sS+0q8URvzBtulkp7iJu+YP7z03184VAjFXl/8cx2/85jGxeMuKQzUBCsMEd/2rMNtSfy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFRKa3pBKzVQWTF0UU11N2N2aUUzOTZLZWcxdnlNVFhjdVBTdlV2MTllekov?=
 =?utf-8?B?M0JMdy9Gdkh4VHhzUkxYT1NxdVNpMWpjN0ltV2Qyakp1NVRWOHBoS041MGw3?=
 =?utf-8?B?THZIMDdUK2Y3c25UOEdPb29tRzdoa1lzbTRGUmRvK1UwZlpaWVRzNWc5WEFj?=
 =?utf-8?B?YmZ2UDhOa2xBbWpSenN4b0RHZ1lwcWJlRlRvNkhNckMwNTJ0b3MxR2xwNjg1?=
 =?utf-8?B?UXNrdmxrRnNsQm9rNXZtQUs0ZHRUOVJjNlpYNnRZRjFMNmZrVytjeFBGcjVx?=
 =?utf-8?B?aGFETGl1am1mNk1KTGFjZlF0NlROZzVyRWpaWGFaU0hxVlFXQS9IOGphNGNi?=
 =?utf-8?B?Ym8vMDVOeE9QUTNPMllleHVPUFFjUllJa1JMaEdzQVFDcmVXVFJPenRzYm9v?=
 =?utf-8?B?NUpiNE1yZVQ0ZWFwU0xaQjB0MDMxSG5YSkJhTzZLMWIzZVBCZ0ZkaVNHSThY?=
 =?utf-8?B?bGp1eGZDMkVncWtSd0doVUNLV3pKdW8xSWJLdjJrNDlMLzQ3Vm0zZmt5UUhU?=
 =?utf-8?B?Y1g3WlBxUXgyaUNzbFBSM0lGeThsR2JhM3RHSHpwUDRYendPVytOYlZabEsx?=
 =?utf-8?B?dXZIVnRrdTY4YlZtd0dSSDJoOVJ0TTJEV2U2NGFqazBpdVR5UVM1VmJPdm5M?=
 =?utf-8?B?QXZBSWsvNTMzaUpSMDRtQzhlc212Ni9JWWZRbGFZZUNLRGNsZHd2QzF4TnNS?=
 =?utf-8?B?eFJVOG0rQU45NnlhUjZzL002c3dqOEZmZDNYbnZJQ0Q4aEo0TjhTSUtPTmNx?=
 =?utf-8?B?dE13RDZRNVRlRkkyNVc2N0N4eEl4cjk1dnFkN1pEUTdVZG1wd1FYY2dKN0xy?=
 =?utf-8?B?ME5oZXRQYjU3eVJZRUJuTUZOdXZ2anZOcGlxYmVsajRnamJxd2ZhR24ydTFV?=
 =?utf-8?B?ekd1cWY5ZUV1Z1JlOGFpanFFd1NWQzFKOUh5UWtIb1FHS1JJdldoS3VtcWls?=
 =?utf-8?B?NlNNbVNTYjZyQ2JlcjRXQTJFa05OeEZlajYxbmdrK2szSHdiRm14bjRNTGlj?=
 =?utf-8?B?NHhGWlkxWm90YXVTZHR1NkhHL05iTTZjbFMrQzRtU01oOGY5WHhPVlF6amUx?=
 =?utf-8?B?b3JmZk9SaGpJYm9xVnE5NXpwb0wvWkxzVVcvUGxJLzZyaTFOenlKUzUyQlhk?=
 =?utf-8?B?MFBaeTRaaWhrUEhnMm9QTDdOVkpnOG5lb1ZBQWJrQXNwOGlSZkhMajBZSkJx?=
 =?utf-8?B?d3k1aUlNbEpwMGZpZVBra0RscVRmZzNub1ZDSFZOcUNpRWRrVDVuVkp1b0dh?=
 =?utf-8?B?UHB4bURmbjE0NjNpR1BxWFlMNzBMUklxRExCMzV0cVZwZkFCbW1qbURveDk3?=
 =?utf-8?B?eUwzNnArSjlJeGNsZHF3SnZ4eVkrWGRySmVpSVdOWTlUNExqSlZtREhGVTVE?=
 =?utf-8?B?RHAvWGFZUGJaM3JBNUZOUXlwZGw5NGdickJzMFQ3cnc3RVFxU0pvY3JKTEpB?=
 =?utf-8?B?N3Q2UDVpdDAyUSt6VnBMd2RyTFdrNnUxQy84dllPeUpDUGw3bzlTUzI1dzVv?=
 =?utf-8?B?dUJHSFYyazJmQm5SUWxWblk5UEc5M0dkZk1tNXY3aFBDTHJkNUR5QmJCSjNi?=
 =?utf-8?B?M2tac09VYUJzc2FlN092OUZveXJUNkhaRWpzeHVhWmhPdTlXWnlqY2J3VEVs?=
 =?utf-8?B?R3MzNld1NDdpbVlLQ0w3WHRiN1ZNQ2hpbGhDRmM5aVlpQTVQQmtjUzduMW1n?=
 =?utf-8?B?MVZNd2xNd0xrazFMS0JnVHo3Yzg4UzRTU0xuemRkVHpLL3d5TDRqM01OYTRJ?=
 =?utf-8?B?MHFsei9ZaHdPQkVXRzMra1lFVUpYL0k5VXZpOTJMMEx2K1hydUp0YWg4eE1H?=
 =?utf-8?B?a2lFVWFIRDhUTXRPeWxpTXNwZUtBNU94QlhOaGNibkFGR0UxWlRMeStlRFEz?=
 =?utf-8?B?MkVIV2h3a0liV3V3b1pSWmhDakFRN0d2dXUwTytpWWhPdXJhb3lTODNvdjN0?=
 =?utf-8?B?aEJwRm1rTlgxMGJBcVBPWlRKbUNEb3luR0RTQmU4R0p3K2hBSC9qQjF2U2Na?=
 =?utf-8?B?RFpmOHd1bE01bzNhZUVnVkpsd0oyQmNzSU52VzZCcGpzOGdlZG55aitLcnpq?=
 =?utf-8?B?UEs5VEdkUEpNeFRKUmhlWUR4NFI2enBrSEFxcFBLNXUxZ2lZLzlHUGNnNDRx?=
 =?utf-8?B?NXRlQ0VmWkcvdXhsYnJIcXZLb2krdldNUjNEcW95bHZlZ2d1K2RMWmZ0YTI1?=
 =?utf-8?B?enV2T055TWpQdytEaVZycmVZTzVKYTkvTDVUd2NMZGdwTUpOVGphblhHVHd0?=
 =?utf-8?B?SzZuTE1VbXMyd2w4QzJRYlJ0ZWJ4eHh1ckZaYUtESXVQc1BtMUlML0N6QVJJ?=
 =?utf-8?B?QzdoY0c3WHdocUI2bXVjSytqUzZvSzhCaUxQL0lqN2tuanFmSUlRcFhKTTF3?=
 =?utf-8?Q?7Ugvmu16Tkc1rRIU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b59bd93-bec6-4524-6cb5-08de8c27dd6c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 17:39:58.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Z81coJ5do7Nzi9CPHAw7EXYCdZYpy6uGFbCheUJKqpFCjsXNbQPy6zBDLGLx1IAX1E1qzah1SoZcRkEQzKiDyK/WJCAnjfCOBOHGKp3zUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6624
X-purgate-ID: tlsNG-c201ff/1774633203-20A97488-669EBD59/0/0
X-purgate-type: clean
X-purgate-size: 694
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.945];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 31ECD348857
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 3:21 pm, Juergen Gross wrote:
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  CHANGELOG.md | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c191e504ab..566fe510c5 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>  
>  ### Added
> + - Support of per-domain Xenstore quota in C xenstored (includes
> +   xenstore-stubdom), libxl and xl.

A minor point, but "Support for", mainly for consistency with the rest
of the section.

~Andrew

