Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGRyOHKHBWr5XwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 10:27:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49653F4F2
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 10:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308728.1580101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNROr-0005PW-QU; Thu, 14 May 2026 08:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308728.1580101; Thu, 14 May 2026 08:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNROr-0005Md-LU; Thu, 14 May 2026 08:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1308728;
 Thu, 14 May 2026 08:26:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNROp-0005MX-Sc
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 08:26:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNROo-00FaSD-Op
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 10:26:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0586e7-bab6-0a2a0a5309dd-0a2a45038bbc-44
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 10:26:30 +0200
Received: from [52.101.61.65]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a058735-672d-0a2a45030019-34653d413bce-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 10:26:30 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5447.namprd03.prod.outlook.com (2603:10b6:5:2c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 08:26:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 08:26:27 +0000
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
 b=QIEO/Rlckm/N/aqvY5pU3+9CserO23BXZiLPT3uTuSj/Cw91kD8UJLhTnLr3lsZE5eZWY5kY+k64wlt11w7R/o4j9CL8XwWJytwfE+vMod2C1bM0g8axe7YaUPR0g3tdzQ9kcS3faeNJVe+j10MqFupM/AM/FPD7FXq9JnibZlOV2poJkvPy54gXD2McDTzTc4qofN7LozI9gdlCBAtQ1PwPXub++WiOrwapWLIR7tu76z5M/dx7+Odfb2iIJsivR0F6BlpPVJfmx8rlodBP0zHF3N7vI8pHqo84+tQ+qtcpGwByvH3BlH3OtnTrBI+zFlJGZcW22q16XZS46UtJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yarz+iCBQ6fwySuMnC6plDb2Fr9B9vp4POLRhIBt/8=;
 b=PCn+5KYdwHi27x4WNhE8U9CKq0owXHzd7tIAkfK2LTKsuAqYAoI/oeBHCPaHcqUF0dAe88vl2laB3mx7uyCKlVHM7B7pITLd49pbNRSMhrKpK8M18ww99ZcmYS/nqSI35kzmviipvCDZI0AqQbkvJIPc0wPaiI+A8yMq2jekimrz4N2+KzfktuH3RcwiHeWdVa4zBOaifIYYaq4GYxZk1jfLzI4r/XrjG1u4wI+oefLIvf/mN1Vd1hjUTr4JEmU9uwACzRW/bIAzuce8Cud0t+YSHBSDB12kMHIaZJymMYP3WFf3Iqk/w2kRlvgjcrgv7ZIkhV+RAmDbox3kKaBA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yarz+iCBQ6fwySuMnC6plDb2Fr9B9vp4POLRhIBt/8=;
 b=R+4g2+M9HVNtjlfZ3vY1cO649rgstqRhyt2jiisfb/6km8bFyuSfyG5lxlim5AVeGTnmTNt6mYIkXn04WtuNKeOaS6qXWLABih+dq20TAc++HTU+pDwZQZOW/VI1WxYQXLPrmAZjRCs/rUA/643I6HtdtYsLEZVZGqW1/kjc+O4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 May 2026 10:26:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: map_domain_pirq(): pirq already mapped?
Message-ID: <agWHLHzvhKCLQMI1@macbook.local>
References: <700f3bd5-2887-4f30-95b2-5dd19fb91abe@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <700f3bd5-2887-4f30-95b2-5dd19fb91abe@amd.com>
X-ClientProxiedBy: MR1P264CA0177.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: e961a39c-a332-4917-dc53-08deb1927dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aXDr6unMIbXUFf30/soGEhu8raTSnwo3SEfODCvfyvepx4sP4lJ1BiaFXy902bvj24X+U6WTReqzZB7M97Xmilty1yh6CzTNz2mcQ6RNAGGVOQZ0BiWmH+4rfYOwVVjlAWYdRq/Ak6s8J51jdDPmOHwicuEG+hNLwtNk/gFOhpK/6f541HCJ0r/xflUmOeHo8ItpeDVUa0KgB5S960TQRZ9zmmwcwl2xCcxvt6z0ixU1ykZU1P39djw5VktMBjv1qhlubXfQxlylhLzzbyIB46yeHaMEqdM2u4fQI9+qtzceO2DWmbSAqdZlm7GbXajHOSNATaXVc4ZlICrAbNlbhyBu4YxB0VJNXbs5sQOwL5gLRvTjrd3gdjOnXFsMx9ksgLlX7a3My0y9TbQPHs8Fi7j63rJdJzaGd5xKnr9KnyNXalPTq3CqtO7uh3kTfPXvk3aLNqJoXetq32qrQze+xoyXpfdgdz9JNmsd43eiHONJI98oXUoGmzQVR2rI729V+HMeDGckOOnhPzsFOZ4lsk14FzlZPNFPQAQkZPCZAHwzHxWyoGNzi6zKAHCRUPMO8aNOKJ7DWDTZWnzBQ0AOO3QHzBxsj/8jxBUCv/3fRslWWU5GrD1MfwfarUTTwNRhwEgbRKOwXVNTjonddnaA7X2Ecqcwu0nTuzjozGX/fFULk/T7HDqgNJDoxGrI3Qtw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm11enlnVEZwV0NIcTdUWmNOcGQyOHp5RGNwSUg5V2RwaGkrbzBHWSs3Z1dP?=
 =?utf-8?B?eE5wbkJSc1U5V3hJZnRSbEZyZUZrcWxkclA0blo3L2t3Z2hOMFkyVk5DTGNa?=
 =?utf-8?B?dXB6bFJFcnQrdDc4WU5ZalkyQ2ZWTWJTVDgvcFFPRWltM05tTnhKSm9UbGNV?=
 =?utf-8?B?V0dRN1FCTHllSThqSDZvdldkTDNKMlQzVEsrR21WcGMvRkloSUhVRGl1bytZ?=
 =?utf-8?B?bk1KSGl2Y3J2UlRhcGJYT3E5TDZuVGRyZnBUN2VHblVoc24zZGlOSU05dFlG?=
 =?utf-8?B?TU1JeGdFaHBpdmNocHB2amg2bGt3b2lJY0IvUFpNdHlGMGo2STRXV3NmRE5t?=
 =?utf-8?B?RjlOWGs3eVpGeWVYa0p3U3hkd00wWmJGdEEzdENGYk00ZlEvSGRwZGlIdC9Z?=
 =?utf-8?B?VExDcjJmaU9GeGowYkxjZGViS1ppU2ZBVzgwWlhvOVhTcWM0MWh4NUtIK3py?=
 =?utf-8?B?d00zaGU3czF1dGduT2VRQVRyRmQ0bm85emZ6N2g1WW91Wmgvd1oxYkRVOG1u?=
 =?utf-8?B?dDY2UGtaaFVtdXpBRFhObnp3d3huRUVET0VtVXNobWNZV0Zsc2lxaFNkWU5T?=
 =?utf-8?B?MG41YnVZQ0RSdGpWem9XSW1oSm1TSUJSVTdDVEZFTDdPVFFDSlpvQ21WaU1t?=
 =?utf-8?B?cWlGV1JNZktYU0lnRVpNOXJJak9BL25qcE9wS1BNbzVJTjdhMjF1bUNLY1Ev?=
 =?utf-8?B?V0p5YzV3c3FtYVR2K1FtR1NIWGtzZU95MXBlSElZRDRrU0ZaeHJSeDdXMlIz?=
 =?utf-8?B?SjJhbUhWWDlDMVhWWTJVS0o3SEZ0ZGJUS0c4bkJ5MnNEdTdEajRpdUUyeEUz?=
 =?utf-8?B?TWUwMk9zSkxMa0w0cXpkbDhzZTMwVDV0akNTUHBydSswK2FoNThVOVVJWDdG?=
 =?utf-8?B?ZHdqRVIxdWpUMWQ1MUFpV3ZWU1BDS2p1TGJkSG5jWE12TGVSdlU5bFIyZ0dk?=
 =?utf-8?B?R1dNbG5SaEpkeHRlUFVrK0F6bENOdGVLditGVTl1U1Y4M2dPN3V6NHpzRVNp?=
 =?utf-8?B?UkVsREpNcG40MGZadGkySzVVeENuUGhOTnFaTnc4dmZmY2g1Y3RJNVdUUTFh?=
 =?utf-8?B?bDlLZmx3Mk5WOVVEWGZpL29qWkNJYzVsdUZXaStQMDJ3eHR0Y1R3SmVqTWZs?=
 =?utf-8?B?K0dhMjZJR05tYjJJaGxFSWVqaHdZNXk2VDNaWnV0bnpsRXYwRzFuQkJHd1dm?=
 =?utf-8?B?MXJ2VFg3MWZMUXpZd2sxVElNYytiYmxyWXFNUjVRQTJNaldCWUVUWXRkc2l6?=
 =?utf-8?B?M1pWUXdkRDg4MUNJbVluN0xOcTdSbmdYQUpwNmhDS2JjRkp5VXJpRldadnZG?=
 =?utf-8?B?cWI4RHArSEZldzNRWFBqeXBJL1U2aXJwemZrNXZJRVU4RnFWN0F3anp3OXJO?=
 =?utf-8?B?MDd5WGJ6c1VCZ2hteVJEUGhYUE9OZWZ4TlpvLytPd1U1ZzBLRlBZQ2dsUkUw?=
 =?utf-8?B?SjV2Q24zSmd1ZmtCN05rQnZTazVJaFdzOHJ3cEY4SGRyOEYyY2dWSG5Wd1Er?=
 =?utf-8?B?WHBDY1V2KzV4S0ZWcmxNSHJtNGxwNllWUDM3MTNQMU12bDA5MEI5RXdVM3pM?=
 =?utf-8?B?aWJHZUpxWElCcTk1SktTUGdVU3JyUEtWaVZHSmRNQ2pLSHVZSi81VEFxMS83?=
 =?utf-8?B?eWxSYzFxN1ZVUzFiR2JIMXk4cndDc3Q0UXJRdGdDTzV2MThaaytlT3dPamFa?=
 =?utf-8?B?bkVIOGxkS3Q3bmRtYmtjRTFBSldCekZmZ0NvQ25NQkhHQjJ5VzN6U3kyajUz?=
 =?utf-8?B?UTAyWUlPTlBtODVXN1dvUjkrekNadlhPWHY5UlVYSHJPbXc1UFBXWEUxMXRL?=
 =?utf-8?B?YjZLRjFJSU41Kys1YUJQRmg2M1JoZUhnL3NFTGcxNXA0YjI4UjhUbURQdlU1?=
 =?utf-8?B?WGxPTXBhdzZ2d0NSZldVMGFmRW1zdFhVWGVOeW5rSU8ybkxrMmN2TVBPbWxT?=
 =?utf-8?B?K2xzcElCV1c1VlpFdzU1VWpLSWVBem5KZVIxanVRcmkwUVUyRzhXZnlxRitL?=
 =?utf-8?B?YjVSZGs0MmdxT200V2FpWGpNSWVOaWZ5RmlCYVpYd3N5VXM2WEViVnp3ZXl0?=
 =?utf-8?B?aDRoRExmazVhTHpadS9ELzUrN1NGUW1ESVVzZ3hJZnVyYzNLaUEvT0Vjc3Jj?=
 =?utf-8?B?bkFjSWpPaHRTaEp5VWl6U0UyWURXQXBZbFJUdnNQYUJBME8vdm5LMGR3RXVx?=
 =?utf-8?B?aFB4akpEOTI0NG5rOHZGRVFBTWlRbTdhK2hqTFl2dktLUkdCTldRNjdLUzRH?=
 =?utf-8?B?aDRsOGtWK2Q5UFcwekpLaHJ0K1UwN2lYbEpvOGE5L20zb1BJRW1UOEtaZEc4?=
 =?utf-8?B?T1Z0UjlSWmU2V1pVRUxMQ0toYVF0bitNL0xsd045Vnl2OGNrb2Jmdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e961a39c-a332-4917-dc53-08deb1927dc3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:26:27.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMbhmEZD4pgCRbjwIiVQfoCVPVT0EKL/uanPN43gs6ryw2dCuionXnREvdo8y1i+NIwMLoOSyZg7Ieym7ozRCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5447
X-purgate-ID: tlsNG-33051d/1778747190-38577938-FAA2A475/0/0
X-purgate-type: clean
X-purgate-size: 2641
X-Rspamd-Queue-Id: 3A49653F4F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.63 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 09:18:46PM -0400, Jason Andryuk wrote:
> Hi,
> 
> Early in map_domain_pirq(), we have this block:
> 
>     old_irq = domain_pirq_to_irq(d, pirq);
>     old_pirq = domain_irq_to_pirq(d, irq);
> 
>     if ( (old_irq > 0 && (old_irq != irq) ) ||
>          (old_pirq && (old_pirq != pirq)) )
>     {
>         dprintk(XENLOG_G_WARNING,
>                 "dom%d: pirq %d or irq %d already mapped (%d,%d)\n",
>                 d->domain_id, pirq, irq, old_pirq, old_irq);
>         return 0;
>     }
> 
> Why do we return 0 instead of -EEXIST?  Since the pirq is not updated, the
> caller doesn't know that pirq won't fire - only old_pirq.  For
> allocate_and_map_gsi_pirq(), the new pirq is still returned to the caller.
> I would expect old_pirq to be returned so the caller knows what to use.  Am
> I missing something?

Looking at bfc341a65cfb2 it seems like this might have been an attempt
to keep the previous logic in ioapic_guest_write() that didn't return
an error when attempting to add/move an in use IRQ, while switching
ioapic_guest_write() to use map_domain_pirq()?

The commit description is not very helpful sadly.  I think the mention
of "And this patch also makes broken NetBSD dom0 work again." is
relevant. AFAICT NetBSD will do PHYSDEVOP_apic_read -> modify RTE (ie:
set mask bit for example) -> PHYSDEVOP_apic_write.  However the
semantics of those hypercalls is not symmetric.  PHYSDEVOP_apic_read
will return the vector used by Xen in the RTE, while
PHYSDEVOP_apic_write expects the vector field of the RTE to contain
the pIRQ.  I think this is why map_domain_pirq() was adjusted in such
a weird way, to ignore requests with bogus pIRQs and still succeed, so
that PHYSDEVOP_apic_write would also succeed.  Ideally the interface
should have been adjusted so that read/modify/write cycles using
PHYSDEVOP_apic_{read,write} would work as expected (iow:
PHYSDEVOP_apic_read should have returned the pIRQ in the vector
field).

In the context of GSIs, I think we aim for Xen to always identity map
them (so IRQ == pIRQ), but there might be (or might have been)
hypercalls that could allow you to create non-identity mappings
between GSIs and pIRQs.

Explicitly looking at allocate_and_map_gsi_pirq() do you know what
causes the domain_irq_to_pirq() in allocate_pirq() to not return the
already allocated pIRQ that matches the passed IRQ?

Overall we should likely adjust map_domain_pirq() to return -EEIXST,
and then fix ioapic_guest_write() to shallow such error so we can keep
the current behavior for that specific interface.

Regards, Roger.

