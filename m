Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEEYObDj12mzUQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 19:36:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E23CE358
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 19:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278046.1563065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAtJ1-0000CC-EY; Thu, 09 Apr 2026 17:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278046.1563065; Thu, 09 Apr 2026 17:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAtJ1-00009g-BW; Thu, 09 Apr 2026 17:36:39 +0000
Received: by outflank-mailman (input) for mailman id 1278046;
 Thu, 09 Apr 2026 17:36:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wAtJ0-00009a-I5
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:36:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAtIz-0028Pp-UQ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 19:36:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d7e38d-e002-0a2a0a5209dd-0a2a45048e82-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 19:36:37 +0200
Received: from [52.101.61.35]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d7e3a4-bb33-0a2a45040019-34653d2371f8-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 19:36:37 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB8208.namprd03.prod.outlook.com (2603:10b6:806:464::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 17:36:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 17:36:34 +0000
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
 b=HZj+AhYvueHcOtoL5ybuRMxm8lGub9YzYrN+Zeb3PwsaOt+7OFnI815Zss6fmo7RdGvs69t8q//KZ4UZnOQoC0kOV/EARBqj4JHMBt471LK/IliNmkEec+j24I077h/uHJT4taVCHjRvJTaxT3NwEVbt+HfUqeXrL4goBUFlteEeLLFCkn8O1eiksI6olh//cFj4cau0uEtOhQtk/rfhLoDxHnGaT+YpqmMlnyaG5fEUDMY2W7zXy/XKMXwMp/Cw2Tq/qHT3I3nEkNJalyjAYnjuTIAlIhliKjIn3q4sUiNASJzk0OvbFXSshG4Fc/amJBDVz36QlKZJE4D2FzSwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHdPM72qPxAnbDAsGFPnhI/+0aVo8errphOdlGj59p4=;
 b=N1+Z88o44ky3x7PV2cCO2cg7tjhZFPvFYsgL/10ArByBr3tq4+FG/rEd7dmgviVexCAY0hHDT9ORMuhnwPpXAfQoiRozJAFJWLnkPzlHQaA64zWWYsaiMWsUu95sMCgY3WZCVQTA7T4HSsXH/PyuiYT9SkxVIxR9GuH9lIrtnz1qktJXGzgdfdp8YIqBKa6THe2Ep28UQTTXPQ1oRCBNNcBzo83S1pumii5r5fETm8w8AUxTctTvRzaSGRCuUjkbEm+89bAQJKeOS19fDY9bkcqsC4ph+XLoG4vHOuB968gPTr26OreN2SS6/SRbUqRRJJVgh00YgX5rnp1kOvf3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHdPM72qPxAnbDAsGFPnhI/+0aVo8errphOdlGj59p4=;
 b=YtkK2VvnmVNWxrv3FBTSUcIko7LysztH1JHkmq4iCBEhMaKtN4E5917yO/OdZ3CmcRuvPtunH4orXCbnvLh1u9HabogiqZM27b/DdIwGjtKX4xoy9hcu4nXmwJUIGN+aBpAR1FEPbe4IALujtqgfLlkUQXxBzyMb2pyb26+cTsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Apr 2026 19:36:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: avoid multi-message-MSI check for HPET
Message-ID: <adfjn296dde_RQYE@macbook.local>
References: <1903a57a-524e-4e6d-bd47-a87fadda4aa0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1903a57a-524e-4e6d-bd47-a87fadda4aa0@suse.com>
X-ClientProxiedBy: MR1P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 666738dc-e952-401b-e6e3-08de965e8b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	STj4b63y2/aj0o9s93sfo8EiDE/WCk3iogse8fDsJwxSppf66GzQ5PPsM4U3ruYkfLlJWWOBh1jpChY7fry4GK553jIlQ1v2FeYR5JPS5wkM1rb0aQVXGxfuBlKY7UCMSXKb+Pvmy2BOBXI68qCgZSEpHW/SpyMP9r3Z1x81o4od/2zqWJKLNmSseyZRdijcd6cQ2Fucpk0drQtM9v6j+xoIQ9qHRuLA2hSmnlbC93i3SRvb/fLkn8h5xYFi4G5DeRpsv6rDW8ISfyFjLblEC+T0Q35srG6k3ZISzyry6Z/5dA08SI5CYx9XSsFYUZKd4sdv8p9TV0hALERCsjkc1XRJsMZogLeDI897RWxilfKQPdEpjAwsm+UwgqQh2gp+KEGiexja597oAYGtCF9AA90B7yDOSln7kVweaycZRtG5+UJx73QOsE0lhG2tq+TpVEq3g6rF2pAd8hD+ZLxLk5okmlYWDNGl4CDWyHlSRnSTKrGvVKWCyW8s/FRVkFSfG7elU8jzyLQwrAjDgnan3/mzDHUCNYRJWBBiWGU5X7iKYZYttbntTbtkQc1d9meDwg3LaGUPBOuJp4ftZzwG/6588H9aXG2VQu5nyASp9t8awTAqjDmegT+To6Y4s5QinpClUmIMaYC1SQ9BsMYKERm09aHURX3hXrq57B/sgx+RU5JgshQ8vacuwVuSJQgx/X/XFzZL3klOBAfdf4PwmIsgKOOZOcgesNnmP7k4PLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1BQnFwbkpBbjZab1JhSEorR3pvTU5zQWJuUVNqb0lMZXJZZWJ5SFp2a3BU?=
 =?utf-8?B?YjI1Yk1iK2JjdUZzZGJzUkRJWFgxUndndWpvSStIbGxMNlZrYkxDNGgzcDky?=
 =?utf-8?B?SWduam9DMGJic1dqbFBYTUZMR0Qvano4VkMrMk9LeVdzdmVNaWdyUXphT1FO?=
 =?utf-8?B?VmMxdkRGbzBJYW4rNk41U1VkT3BWK2FuZnZZZW5GL2dkdm9TdlBmSDFiNTdx?=
 =?utf-8?B?NFlicURwa25VbzI3aDdGUGVqRi9qanMxTnhyUVNwdkswWUpNN3FUWVpWczNL?=
 =?utf-8?B?dGhBRjJRL3duZHFUQVNVT3ZFdUVvbWpJQzQvK1F5L0xDOVE4dmpXNmQyd2RK?=
 =?utf-8?B?ZmxRcnJkKzNkVFJsc1F3Y2kwc1pQc0FocnNnN3RKSitSYkpZc1lSUG0rdFVz?=
 =?utf-8?B?aXJkS2ZkaG12K1F6bTZTTFRyLzBadU9hc0dVY2pPY2oranE5aEhpcGUxd2hX?=
 =?utf-8?B?dHJlV2FGMmV5eDNzZUpyMmV1WndBWStsRXpkY0R4ZXczSk9KQTYxN0dPM0tp?=
 =?utf-8?B?Z1poSHR0ZStsMERQY3R5OVg5ZnY4ZVB0ZXNEQW5PTU03Z0dNZ1QyVDFISlM0?=
 =?utf-8?B?RG54WUFBeUV1Unl6Z2F3YXdUeURVVFZsVE93OUdGZ3hBZzRQeGk5MC8vWEVF?=
 =?utf-8?B?QVFrL3FsYzlRUzBCeDkwdkR4L01uTzNjQ0ZnVHhnemVRZ0xaZitPMmNia1pv?=
 =?utf-8?B?cW8relFxenVYN3ZuNk1lYkkwVU82Z2ZYR3hoTDVNMUczdnArTDNJa0VyRnl1?=
 =?utf-8?B?Z2FYMUpvKzJhUyt5cXQvS2dnMXFuTjR3WENCVUg3OUhscUZxNFdoNzdnSGtw?=
 =?utf-8?B?bFZuYjRsY2xCSU5neVZjQzdaYmtoMzBhODdpUStNRE84RUsrWmNYRlVabm9X?=
 =?utf-8?B?V1loSzVWNmxGeDU5czFTMVR3dE4zZy9IV05GZnRnb2xRbEwwelZXTUtIRUZt?=
 =?utf-8?B?Uit5TlNTcWRDcUtwWk9BaWU1cDdwd3JuajNWVGFGc2NVRFhSaWpmYzRyaFo3?=
 =?utf-8?B?cldOdThob0lSTkhXZWJXVzdaSVNqSlRMRnJFakRPelNDdk9iOWtNbXBFbGM5?=
 =?utf-8?B?UmFMSHF4eTdXS2RGSjdEemIrWVhrWFkvYjhRUFlGeS84NXl1QjcxZWM3Z3Nu?=
 =?utf-8?B?YnAvNkREMGxoWCticDF2d2hRRWdCRGFHNG56ZUpvYkYrNlhrZXMrOHhDdmp3?=
 =?utf-8?B?Rk03MHM3R0R0OXlNZFYrNEJ2UzNGTktmcm54dU1aeHhCR3h2VVhSREkxVW9j?=
 =?utf-8?B?ZzFjVVM2ZFZXRjRWMU1mVFVFcHFrb1M2VytkY01KVk1yZzI4VmRkRi9QV2JZ?=
 =?utf-8?B?aGdsTFZBUm1GeGhqNlRkUVFuMXNDdUlMcExGSjlLeEhEU3pqZkdPUk5lVTIx?=
 =?utf-8?B?NFFmYVVYVzJ4bE01NmVzcHJQZy9hVjdLK1Q5YUhNSndkRHBzMVNKQVBNMUdr?=
 =?utf-8?B?OHNpNHBwRncxeEJkVlg5VUNyZ3RPajFERTIzL29CUzhESG9GMllCK1EyNjQ1?=
 =?utf-8?B?U3p2NjdFWWZYbE5mM0o2N28xeWY1TnI1elhPOXpRRVVqTDZnVVJWcElaSkJV?=
 =?utf-8?B?V1R4WlYzTWRxM0Y1cnk4bWw4dU4rM29Cb2NqRGZaK3FEd0hwN1E1R0ZHRlFP?=
 =?utf-8?B?NXl4Y0JMN2w3TUE0dXZkN0VwTGhXWG5jbFV4dGpIMXczRExOUmNROHBKUHhP?=
 =?utf-8?B?MkRhcXp3SHdOVHF6YkF1MldUQ2loUEtVbEFLY2gxS3RyUU8yQ0RSa21IWUZF?=
 =?utf-8?B?ZTNMZmR6Zjd1bmNoaURWdi9ab2h2dzVhc0tNZGljeDFCSjl0b3RIMmJZNFBJ?=
 =?utf-8?B?bko3Qit1ZnNXUUg2YklnUDBUV3ZxZ1Z5S01QQWxXbmhBa3V5RkxQMUtVVXJa?=
 =?utf-8?B?b1UrdDZ2b0pUQWpNdDMwN3VORDV1cUpkUjhxUmcwZ3VaMWNTRUduNGhEdmFY?=
 =?utf-8?B?M25Jd2dwTnZEd2F5b3VHNlRkOVBISlBadG1tR3BoZTBIaU5xSmNMQ0krSlNx?=
 =?utf-8?B?RmpNL1BsQTkwdElHUUdjNzdPMVp3b1N2WS84WmVJSVNYRUpBM0RvaWhJWUln?=
 =?utf-8?B?L21DNU5UM09vU0tzd1lDajArQWpwVDE3N21QT08zczNVMXJJaGMyeGpyMHE1?=
 =?utf-8?B?eGxwQXR5UTIyNmhOYzdKOEx0TkZJUlg4c1prQm5xVk9TZmxJTEo0WmZSbkFK?=
 =?utf-8?B?SFc5QVZUNTM2K1ViTDEyb2VCclVnZHFGdWI1dHA5YUg3ODVWMTd0bkhCenVk?=
 =?utf-8?B?MzFsVGtwSm5TZVoyQ3VOQTNFSktkSytWM1lrS3QybDJLSVJsRkx2RDZwZ0pW?=
 =?utf-8?B?Q0tSdzRSSytTWVRMZVU5bUdIU3FBaGIzRy9IcDVSQWtwU0xSSGRnQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666738dc-e952-401b-e6e3-08de965e8b78
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 17:36:34.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5g3oCeWI7XxojqV2TdESStJzIXWS8czoxlpQwBhzBcMUUgs+YEx35/G3NCxDS3yrRXLeQk4iR5QQpUsFhGES3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8208
X-purgate-ID: tlsNG-ebf023/1775756197-B1B2051B-6A1688A8/0/0
X-purgate-type: clean
X-purgate-size: 916
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5E3E23CE358
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:47:48PM +0200, Jan Beulich wrote:
> Having this immediately below a PCI-dev vs HPET conditional is (mildly)
> confusing. Move that if() into the body of the earlier one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -513,13 +513,13 @@ static int msi_msg_to_remap_entry(
>  
>          if ( rc )
>              return rc;
> +
> +        if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> +            nr = msi_desc->msi.nvec;
>      }
>      else
>          set_hpet_source_id(msi_desc->hpet_id, &new_ire);
>  
> -    if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
> -        nr = msi_desc->msi.nvec;
> -

I'm not fully opposed to this, but maybe it would be good to add a
small comment to note that HPET never use multi-vector MSI?

Thanks, Roger.

