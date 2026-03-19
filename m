Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCMcIO8CvGmurAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 15:06:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEB32CC630
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 15:06:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257253.1551687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3E0y-0001Uc-Ai; Thu, 19 Mar 2026 14:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257253.1551687; Thu, 19 Mar 2026 14:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3E0y-0001SM-6I; Thu, 19 Mar 2026 14:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1257253;
 Thu, 19 Mar 2026 14:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbsH=BT=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w3E0w-0001SG-Gt
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 14:06:18 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8efa7aa-239c-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 15:06:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5095.namprd03.prod.outlook.com (2603:10b6:a03:1ee::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:05:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 14:06:07 +0000
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
X-Inumbo-ID: c8efa7aa-239c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S71+cuuewWiUtWepsN0nouiGNiNiFFcie/41StyvWnJiy6HZfvXVErjZHRVQeq7a0nadVOjZnuXLpWpH3oHHtvX3Lm57bTfSSzX4Y5y36FkBpTAMceXDyrmG/v5XRatY4oFZlfTiHjXbg9KYCOK1TySca6KT0kBK0IJNLEvflk6jD8cshfTawQtdywCxphCYX6T3yc4ZReY0L0sTBPy2eb2F1zCF/XOpGk6nY4Md7P2N0bLhHO6NJ08HFy+CumlDEe66AcAEqpwf5Jy7hzjycbJd7mYbB1LPPswR9Ga0XmCG3u/p8n/Qnn25gOjoQKRzGDxfDw8mpStTAqXa6zBc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rGKl0+Sfh9bPj0Veprpia7WYOYAqSDoin6XvLcuVN0=;
 b=Y+Tj9ZutI+cxSeRjelNvHiEgCSrR2pJLSdSL+v7ZeMGRXsRZ2eZYiXD/ag+77wN77/uCYoCne3g5Tfmqq1sHilAcMOw+ch2YUailERY1IUlvWLyMFOZgDwihS1PQMnJW8AgRPmQcLvsbf7D6VSaTUBfJR8Enm88oKsP5JSJxIS7gX+LNLCROZ0/L7+GbRQA1r1VDi7CiUPncN8qfObaai62xjjVaL+drISOH+JDBVgQ6hyWJCrBxXKOYlvFeXd03IjQBSsB9wRyLAz2jKkAJfhngwb5P+3ClnbSaV6hYorie/1Quw450GepB1+xSO631CekiZBZM3NvK0ij7uBuoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rGKl0+Sfh9bPj0Veprpia7WYOYAqSDoin6XvLcuVN0=;
 b=sjHt0InZxtw+rEkbCozim9jUhtm9XmcG5rLsJAiVcCSuZb2q0piNGX6nB146MJfg6x4Vyf8+v2wg5Y6qxFCZF/V5bgoaZWigvLjtFP5vu5CawQqZ2+VZvwCRGxvWHXb+0s0BPfLYyDzUEJ604cpX46FRgjrftPLReqml8m/uUYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 Mar 2026 15:06:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hap: Defer NPT P2M TLB flushes
Message-ID: <abwCyyhBusfh5Qvu@macbook.local>
References: <20260319114041.1455593-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319114041.1455593-1-ross.lagerwall@citrix.com>
X-ClientProxiedBy: MR1P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f9333c-a0d9-4265-c89d-08de85c0aa1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3+7wP71+ij0XRzyELECW/snQIiJQ0eYfZukEvyYf4CaIab7MSE65q+S/LC2JjeUA6q3yBTqJFWq8pAk7Tsd5Pjn5zTT0o2Jl9OsZWUodkz6hnODRomyK2XAdsz/J2yrMngGx8vrySV5WQy4rs3/LXsnnRoTDPGQuJxZFXiu9fNosH3AHUB7VlST5xUoUuiktY5UbX6IBd8h6FmNvU6N1LnorZkA2JiekbMhblEKNby00uimYVAcKsUCvedItkNR68x7H0B4T4ttMiegGX2ZZCv821I+LT1KXfZToLyM5oFSro/KXbVc0ttNZ3K5oPs0LpgNFbicn6qbRbAPLTC5qlVPQAHF9wx8o47JodJJsfgS+Gg+Z7/bY/d1t/m1BB5rP3roykj0MXuDqknWxzBFKzvxjTFJT7d4d+pUYAP/XJMIVCI0tRR+XYlHVopJr6sWjXZjbDTtwWB2jQAFTGj+I26pIn8oQWtW117gnJy8ALM7cS8W/3gFSzex6Sg2nNw1zr/CLzXSxocSGohuqxnnbPlgD7UMvPZEMeLKKqltnqV7uzDnovZPtR8LB4NCNrATaW/962HeiYPdAAwH3DEmzDh5qI3VdfeVB9qalrLxuzknyFROdWscO2d261roTug3+INtPzh4FbFvOxtqnVPAXL0wPvP2v3OJ0cqvWjbi0G+cIBqDJ5KFMQfvS+WBwKmhIok+R/7VWHP4Kq67DgxcJqbScLIIW+NM5Gv596SGukjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJzY29aNmc3UHFOaVh0bStOOWlMa2sxQ1kwODBsT01Ba3FqN210V01yKytJ?=
 =?utf-8?B?VFlobmlhNDRDWFBkSldiVTk3NjNENER5RzJNYWdBbTNVWmE0aVVmbnVtdnNh?=
 =?utf-8?B?RXNwYzdvbTdJVVluenN1M21oMlYyeXVpT3JIVkNyS1VyZ3g0RTRnUXpDL1FS?=
 =?utf-8?B?VDAzVmFINmJGb005Z21TOTlFS3ZPWHovbkc2MDJ3QjU0UlhCNm1jWEVYWkpu?=
 =?utf-8?B?dGt2NDhXYjExUm9oVXNxMTNUSm95VVhqTjNIWlZBMmtXU0pDSVI3MldUaUp2?=
 =?utf-8?B?ZU5rajZIbXdJZVVmMXp5NUJsc0ttUVR1M0pMZEY1Wjk5d0s4endtQTZqY0ZQ?=
 =?utf-8?B?dytmZTBnRXc0VDg2dldtNFFSeis3bEVRQ2kyNlkzK2E2NW1WNG5TQnhBb21V?=
 =?utf-8?B?bm53SC9aUGplcUJjRWVWYlkyUkpoaWI1Nm90ZlI3VERhVjI5NU9ydGhMOGNT?=
 =?utf-8?B?Y3p1VXgrQ0oxN1VrdTVyVmhoMmxHZTB3RTJyMXhVc1kyWHVlT2lleDhvMEln?=
 =?utf-8?B?VUlLb0tHMWlVMGNyRHliYXYrVjVBb3REcHB6bktYQlB3YWN6TVFUK3JWeFVI?=
 =?utf-8?B?VFhENy83dnUwZENObWRFVTcraFI3WW5ZRm9RNCt0MWJEeUg3NVBCaDhsNk1i?=
 =?utf-8?B?djRWZXoreDBmOE5XWjVWMkxoblZtdUR0QXpaREpGRkdKVDU1VVdwNm1ZSHpw?=
 =?utf-8?B?NmZsb1NxUWt5cEtob29QUCtrN21vRjdrU0FVMnlxbDZIdE5kUm0yNXk1Y2t2?=
 =?utf-8?B?WjlEWmQxSFgxZVFFOXgzVFpMSlpSQkJCZ0hJclR5OUlCUUQ0bGxQR3JiRGhu?=
 =?utf-8?B?bVNSRnphM1diZWpzUU1nMlpkUVpSU2p5TXJxTFkvWEpxVm11QUFqOEJLSGhw?=
 =?utf-8?B?VGliYnNxNW50ZjZOeXV1TXd0OXdva2NZcHFCSi9sZWMwMmpPZzZzKzNjODRG?=
 =?utf-8?B?YXNiaGZnUDVoYXV0QzNVRzI1K0hNcjZ5R1NYUFBRMktDN24vMGZmQi9MbUd2?=
 =?utf-8?B?OWxFMjdQdWxHZWtLeU9qZmNmVWl5VkkxbGI4c3ViVVBaVW1HOWN1RkJHNEdJ?=
 =?utf-8?B?UTVnUXJ5VTFpNlo1TU9pT0t1NS8rSmhnWTZNV01lTjM5dHpOdmVWeVhMRzBD?=
 =?utf-8?B?UGNBS1g5RWFoeFFOUmFGbU5DR094eE4rSnhRNS8rci9zcEg4U1Q0WC9oVVV1?=
 =?utf-8?B?d0lPUG9mdUlzbG9GRHNxWmoxSVBVeTdGMWMxb3RJNDNKZVkwdkVFeExackN1?=
 =?utf-8?B?aHVGek5zTjRYdEQvREFPYzgrOSt6dlVuUmsvdnhZM0pqMGo0M1ZTTVl5WVpu?=
 =?utf-8?B?MXgyaFhGNHBmRExmSDJoSDJKZXlkWWtFOUZZUWF0NmlseTMzY2FMS0NoV29H?=
 =?utf-8?B?bjhGQU8rS0p1L0xLajRBR3I5RVZVaWlXMXlwbnZuT2VXY0JhNVNnODRteHc1?=
 =?utf-8?B?aDhYSDBPWk9HVTlHZnB5QmI5ZThzLytySGdEM2QxSGVaRXdpYzV4aDNkYVFC?=
 =?utf-8?B?OUQ3Z2pOWHFKT0RTbk5lMlRIT0w5QWNFOUxyeStOMS9rS05EL05GaUVnWWhl?=
 =?utf-8?B?Mmc2Z3hJTG1GQWtIbTAzdVVwZ2ZBTU84aGJQZDk1QXcyMDNlZEhTMFBaY0Ry?=
 =?utf-8?B?WGdsWkJSTUtBVzVVRzQ4aWNzT00zTWdjZG5JVHByeit3Tk96QmQ5Q3pYdGtG?=
 =?utf-8?B?UXg2MzRZaUZuSDVFSTg5SDJyTzFNVU5QOW53UDhvb21XTUwwZWFGVVdYY1Bx?=
 =?utf-8?B?Rll4SGNEYWR5VlBabnR1K3p1MEx1R2h6cWtHMW9MRndnemFRMlYreDlyNHV3?=
 =?utf-8?B?Y0NMWEJwZWJIQllnaFpGNGFmZnhVY0NzYklNRnlzOWNRa0xtTEs0dGRDcHhK?=
 =?utf-8?B?cGpKZUFJME5jSFM4ekN3b1VJZW5yOUFWeGt0S0JZLzdlTVZuTVV3Qk0yRXFr?=
 =?utf-8?B?MkVFRmlUeFZoMTUvYTVJaWRxZlo1cjRrZ1Z2NnV6UG1yTFN1Sm12RXVWSW5F?=
 =?utf-8?B?OS8rSms0NllOVC82R29qQTF0NkQ3NDRJRkw5dGthWWJGd3ZLNU43bDIyZjdY?=
 =?utf-8?B?V0RYdFdyZEN3aFlwSEFmUU9oL284bEFmekFmZ3BtY090OTdBcW54MEZvcXBM?=
 =?utf-8?B?NGRhN0xVOFZ2SXYxT0lmRmpyUWtWdXgzRGpBNWtrQS8xTGl6L3ZJMGY2YUFT?=
 =?utf-8?B?QkNWZkJrMmFWd0JDTE43Z1preUFEUzFxNkQyRUJqQjJtZXI0eTl5Z1ZlU09Q?=
 =?utf-8?B?V1I1dUZWSHNobmVMclpjVjFZVUQ3b2RsWG1vS3Q5dkUxVml1L2FsU0pnSFpl?=
 =?utf-8?B?THpseVBzYUJVamhrcDFPNEc4NjdZam5YeUtCajdvcHYzZUNlSDg2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f9333c-a0d9-4265-c89d-08de85c0aa1d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:06:07.0101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe5999ULmNn90ibn0qV9JlDHlecP8iRRzkTGWYfSQy5sZPNggctNgPPwWIvCPlk2686SAnCL4HWd2LhkIXKUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5095
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CFEB32CC630
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:40:41AM +0000, Ross Lagerwall wrote:
> Like the EPT code, defer TLB flushes for NPT to reduce the number of
> flushes and avoid holding the P2M lock while flushing. This can
> substantially improve performance in some scenarios.
> 
> The cases where the TLB needs to be flushed without deferring are
> already handled by the call to p2m_tlb_flush_sync() in p2m_free_ptp().
> 
> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> In v2:
> * Tweak commit message.
> * Call guest_flush_tlb_mask() if the assertion fails.
> 
>  xen/arch/x86/mm/hap/hap.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index a337752bf488..67137611d9db 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -814,15 +814,33 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
>  static void cf_check
>  hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
>  {
> -    struct domain *d = p2m->domain;
> +    if ( !(oflags & _PAGE_PRESENT) )
> +        return;
> +
> +    if ( unlikely(!p2m->defer_flush) )
> +    {
> +        struct domain *d = p2m->domain;

As you are moving this around, and seeing that guest_flush_tlb_mask()
takes a const domain parameter, I think you could make this local
variable const.  Possibly the same below with the other d local
variable.

With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

