Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI2EJQ0U+2lLWQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:12:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798C4D92D6
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301510.1575790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZET-0000mg-04; Wed, 06 May 2026 10:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301510.1575790; Wed, 06 May 2026 10:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZES-0000ko-TH; Wed, 06 May 2026 10:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1301510;
 Wed, 06 May 2026 10:11:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKZER-0000ki-Ef
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:11:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZEP-00HJnu-Uo
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:11:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb13d3-bab6-0a2a0a5309dd-0a2a450ce2dc-48
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:11:53 +0200
Received: from [40.107.200.32]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb13e7-62f1-0a2a450c0019-286bc820f18d-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:11:53 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 6 May
 2026 10:11:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 10:11:50 +0000
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
 b=o2Ddkm35xUVbV1cEezkZk2JDTjueSUCpmx81slacIujj3yjz3sxlFoLHqZzDSOjHyhCsxsU7G6j3jvKOtzmWHf9DNPwmomnJ2FZQlLX5QYyWIbI87AxfwWP4XWTgnuBn/6aCqfleVQrj39bg67bw4NtHlrsIfNrTfNCxkeswcoPP24B+FXXlxyZ931LLZP0iC5t/5kfXB04CKmf+sp2OcwblVIPZuGQohhRyEs2eTfy8XPhvRFHco+JBepl9FcvCozsqmo3DXnRvGi47n+lBTpH8e7y8K/YR1D2NmM1LawV6zcHCey4LmAEvAnZ++51Oy/cl6XVuKlGgroyCxDFIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JPjBhYuXYBGTzDAqzgf7aEDpEvV6Ix7VLJvwuKMGag=;
 b=KVQ49K3yXK8qB9OOePWk9w8ayGbOYutihMJBqcRwTZQjM/PT9vGcJFUFZG71ILJQZwmy4goe2Ry1GF9WhfL3zsDPomDtZsK6KyyYclNNNU8uCwblI7+w85cpv/Vm9PLZaTEUzFWjo7H/8cOCtX/tWmXhU9OeIZfEMNqD0I+fE28pZwrggstcDoKtdWiFXIeDdhjBNsLjrGPFX19ehmwLm39f1bhcbovUEl2m1a8C08JaMTs3yuBNswm8UFFrx0etHnqtHmz8HzKhwiKfV+kZa56HmC/5B2FQwDbBOtM/tAjyfY7SAsQLik29Wp1MgpKa95y2Pkt+Dxh8eUJ+qkZN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JPjBhYuXYBGTzDAqzgf7aEDpEvV6Ix7VLJvwuKMGag=;
 b=lMRCijYI2wGYfguwL9FpUwxsV68Xrw6Hv3VSW5yrZxKF5YT0MxuBCVzzVg1bMbPkgYoc8iNGhu9IOC1Kg0QimQ37cAieakr5FgvV+5DB11dESDCTZGyKcUgN2kmeltnlZoSzKtET6ZkTt6WyVVvCRVnU6H9nxa5NUk2eZWHFLAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 12:11:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH RFC] x86/time: avoid early uses of NOW() to return zero
Message-ID: <afsT4gICSQ_LuJ-R@macbook.local>
References: <746ce9af-156b-4c16-8cc0-6e8d929107a0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <746ce9af-156b-4c16-8cc0-6e8d929107a0@suse.com>
X-ClientProxiedBy: MA2P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfdcafb-4ad6-4378-f4cc-08deab57e362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZMCRmKojP372AyKOMbkV7ddTpP0K1ZqYatRkAoUkUIF2UezUo4FmVZZ64UNO1QUQ7FUFHlcEVPCoVDTkgNsG8Is9MjZd5oaVxINXtwMmpnE988tydloJJBjaf4k2AldAmrGokbblNeek4SGGXeCA1aOLS//gPiRbqpNnalVyhQ4M2eGsQf11LgxWe89pt6OqMmNI5Z21OIl9io4cniwORd8MgGAJe4fdcW5dwg5e/sW602+dBNCvKArhNIKS6166Lu/bVgEvTHF5GXoBRDaz3oTCz28c/kEiSutHeZnQagp6c0bg+psCKZLs2N0rX/ps27hYFBnBY9S2zdm4U7cjHoFQpjSuSwF2COFeY35HGlLV240vIhQJmpMZNLz1eFWXDyYBDbzKa2mu5xLSN5rafREdHeA46LbTnrrajlF+akwgCQ0VaT7LmWIwqWcWNJIxvAKQrIh3/0uEzC1Bl6fbIfC5G/rr5Uw3NMLFembLE6NlrIFBQ/oU5elmRUQ+UROAnJXlz6vTXuoZpLZmnAC0phO92utvd2+cmiP1yOmmxeGXZyxlt4YNewIHrXfaUgJ9wQgxHTUv3dvXDuatEJVkjB8X7pPxYsGV0j//NDCBkaUdt/ZXz0zY4FA9VUzAxJ1xL3I3GF3mjiBfdO22rYSo5pooY4ooRlSp278oE3rZlW9F+Wd9JXsVC+wWUq0+SYQ4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anllck1oUDhjbGlDVlZ0ckhEMmJtcnVidWV4T2JlbzBsSFZ2WEFGTWtwS09n?=
 =?utf-8?B?WVVJcjJDTGFNelQrL1lWYjU5R0xpTnovTVpHNlR3MzNUazNuVm9vSlpaUWtr?=
 =?utf-8?B?Ti9NUFhaT29wQmhiK3lWZ2w4bDhUQ0Z6d2pObjkrL1dTbExPVE0vdlh2NEFI?=
 =?utf-8?B?YW1Sc1RnZGd1L0xyODkrUjNsd3ZFY0dNdVVWaFpVSjhvNkY2V3NJTG9LMU1s?=
 =?utf-8?B?VTBNR3g3MHUrM2M3c1FyQy9ucDR6U1ZIRXQvT0tpT0UrQ1AxUTFOc1l4ekVY?=
 =?utf-8?B?NGR0Z0hCR2xoVE1VSWRmc0hzNjBmV21hQ1VuM3lGdGlLSzlsdlBOck51b0N1?=
 =?utf-8?B?eEJIMXNCVmxyZHlOUTgrZXVncHdxQkZic3pNek1Xb2xaK2pPZTJyU21mYVFr?=
 =?utf-8?B?SGpiR3h4cFlkUVJjelFrZlgrQnlZOWRlNVlBREdlL3U0R2lra3NqTDhpclpq?=
 =?utf-8?B?SDRFWURRTXdGUDNNQzFwNWxQbEg2NWZVT2gvcnRrekNrcEorN3NkUkxqdkE4?=
 =?utf-8?B?WGVSUmtHWDByU29aK3FVVHVMRXpuck5qSnRMQzl2VFN1djF5QW1aWUZ3cGND?=
 =?utf-8?B?SXh2Yy9MTUoxeVNFZVp5Yi9ieG1Gdmg3bTRnVUdHbk91Qm5QYUIrQWpWWXRE?=
 =?utf-8?B?Q0lSRk5aMHlrYnVkNzJDdm1TSDdCTHJhcjhUL0JYSGxvYlpzV0Q4bEZqS2JX?=
 =?utf-8?B?S1JCUlZMa2ViMkF2dENZcldNcWRVcjh4WW9odXVLT2ZIRkxtNnZEM3MyRTh0?=
 =?utf-8?B?QlRxRTJIOWFTVWZhcjQwbjgyVzFCM0NRaTVYUU1uZHdpOWJ5dG80OUhLbUo1?=
 =?utf-8?B?ZG9RV0pwQkllV3ZXOWhwWXRudFdDSjE0K1ZoU05oRjZMaURsM0NzWlNXSHQz?=
 =?utf-8?B?eVovYmErQ2I0YUhBTmRNQ0F0SDdrZkxLcWFOc0NVaUIySnVtWUNVbERYMWJO?=
 =?utf-8?B?aHZUbnNQUlFjcWRGY2w3NTVxY21lNFRidWdhanVqT1RoVDRLZUEvVDNUL3Mw?=
 =?utf-8?B?bmVNeFkwL1IyK2MxMndVYVZXa0h1SGdVckN6ekxPR1BEMkZER2dVaWd4WlBi?=
 =?utf-8?B?TW5uN2haYXEyWkhjOVJ6M2VtaXpRMFA2L1BFSUdCam45cGQ5YVdkaFFHN0tR?=
 =?utf-8?B?MVdWM0dkVmRZVVBCUzZ3UC9YYW5uajV5OG1IMnlaWkU3ZkFycTllUDlGK0ZW?=
 =?utf-8?B?VEdCZ2M0c2hUeEZkam9RNVFwSzY4T0tRanlXNVcyQUZFMXVWbzJBRTgyTUF6?=
 =?utf-8?B?RWUwZ1J6RUJDZFFid3R4bmo5Wk5QR0tCRnBoaytBdHNVajk3MGtySDA3dUMz?=
 =?utf-8?B?UlVwQkN2WFBIQmNOSi9lZ0s5N3R0NkcrVnpsYTBmZkZkVkRFL2dEM1VaNGs3?=
 =?utf-8?B?Y2RLdUtTTnh0RmgyaUJuNnMyeDkzRWFUYjlnd21FU1N0cWw1RlVIOGQrSU1r?=
 =?utf-8?B?S0tHa3ZKaDYyRHF3K3hWMEpWL25uU0ZPRE9NNGRvVTg3Y21BUFNRcCtXUVh1?=
 =?utf-8?B?TFBmSHVKdmVRTmFWVzBvWXBrWjZYQnAxbW42QnphaThGNTgzTHRRMnpqc1hh?=
 =?utf-8?B?emFxTXlrc2ZoL1RaOEhqN2MvZjJaRlJSMngySFF3UFc0VFF0aktiQUUzbVZN?=
 =?utf-8?B?QytaTTVHS09SYVhVeWQ1WUtvRFBvVG01SUJmNTQyMzZRUWdYSm9uN1UrVVBt?=
 =?utf-8?B?S09ORDd5NTBLVlpTNmhaV1EyM055NmxNbGdsKytsYjdnazRlWWFFSUN3akN2?=
 =?utf-8?B?ckdzMmVxVHByS05VdXRKVEdWTTZJWnE3MnI1SFU0SGM5aHBUMVk0bzM4ckdN?=
 =?utf-8?B?bGMrbHlPUC9XYkYydjg0UEdaOEtUUmhucjh6YmJKY3NlakhQRHBSdUFLR2hX?=
 =?utf-8?B?VHRscmMra3RyaXY4NmpHQ3R3Um9yRGd2SGIrd2JSTWVnSysyb0I5a0JMSEMx?=
 =?utf-8?B?VjZpczNzS0RnTmlIKzE1dldPbVUyL3RVdU1NYjM0UldjQmoyNTRTdmZUWFk0?=
 =?utf-8?B?ODB2SEpzOFN2ZmtHekhlYnIwZisxTVFrOFI3UGRXS296SUdPVjY1U1RHMkQ0?=
 =?utf-8?B?Qzg0bU1nWklBU0l1bHQ4VVZzS0h1VnU2d3ZrTnhYRHFOeGxPQlpPQU9acWxT?=
 =?utf-8?B?SVB2Y1I4cDNjZThzeStnbnZBNlB5VXZuOEo4V0pTdmZtRkNiSVo4OTcvbisv?=
 =?utf-8?B?U1BvWmJNUEh5ZHlVZ1RRUHlHdzZOcjZyTGxsbGs1UDNKVExHb2hwcXJSSytX?=
 =?utf-8?B?Y0I4L1IwUTFqM0FkTis2T0FkSjNGZ1JWcHkwK1lTY043YXdJRGNNSHlXNmp3?=
 =?utf-8?B?QXZ1S3pvZEVxZS9CZW11UkF6VHl3a0tjdlRoeW9CYlJWeVh3cUwydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfdcafb-4ad6-4378-f4cc-08deab57e362
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:11:50.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvLA3mli3XslQaw5/9WSSQtDraYgLFlVBoScurPDb36VBJV1TP4WtChheN59mDzgxAOJ4FSwtFj6S4TTqwlrcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-purgate-ID: tlsNG-d25034/1778062313-DAB74CF5-52AB92D4/0/0
X-purgate-type: clean
X-purgate-size: 2820
X-Rspamd-Queue-Id: 0798C4D92D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 11:37:41AM +0200, Jan Beulich wrote:
> Waiting loops like the one in flush_command_buffer() will degenerate to
> infinite ones when used early enough for NOW() to still return constant
> zero. Make sure the returned value at least monotonically increases.
> 
> Do this only in get_s_time(), as producing a sane value in
> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
> 
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
>      checks for NOW() returning 0 (falling back to TSM_RAW in this case).
>      For now I have no idea how to avoid this, except that when CPUID leaf
>      0x15 is available we could leverage that to put in place at least an
>      approximate scale value. Doing so could, however, lead to a
>      discontinuity (returned value moving backwards) once the final scale
>      value was put in place. (Note, however, that such a discontinuity can
>      also result from init_percpu_time() using the BSP's scale value as
>      initial estimate for APs. Then again local_time_calibration() at
>      least makes an attempt at avoiding such.)

For the purposes of printk_start_of_line() we could unconditionally
use get_cycles() when system_state < SYS_STATE_smp_boot IMO.  Using
the frequency value from CPUID seems like a good approach also on
boxes that expose this information.

I wonder, we seem to unconditionally perform the TSC calibration
against a known frequency time source, wouldn't it be more reliable to
use the information from leaf 0x15 when available?

> 
> RFC: While generally the mentioned waiting loops will take longer to time
>      out, on a very fast CPU tight loops may time out too early.

I was wondering about that, increasing just a nano-second for each
call seems like it's going to make progress fairly slow?  Obviously
depends on how tights the calls to NOW() are in the outside loop.

Maybe when lacking frequency information from CPUID we could assume
something like 8GHz and scale the TSC based on that?  AFAICT it's
advisable to use a frequency greater than any CPU, as then we don't
risk NOW() running too fast.

> RFC: In get_s_time_fixed(), should we perhaps assert that the scale was
>      set?

Might be good, but I would like to see what explodes when doing
that...

> I don't think Fixes: tags should be put here. If we did, we'd have to
> enumerate all introductions of early uses of NOW() (or get_s_time()), with
> the exception of those dealing with getting back 0 (which I expect is only
> printk_start_of_line()).

I'm fine with no fixes tag, but we need to remember to backport this
one.

Thanks, Roger.

