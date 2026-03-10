Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLSCE9jqr2nkdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:56:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C4248EDE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249928.1547294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztpB-0007UB-E1; Tue, 10 Mar 2026 09:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249928.1547294; Tue, 10 Mar 2026 09:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztpB-0007S8-Af; Tue, 10 Mar 2026 09:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1249928;
 Tue, 10 Mar 2026 09:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDYK=BK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vztp9-0007S2-Qr
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 09:56:23 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c549e5-1c67-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 10:56:18 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SJ0PR03MB5533.namprd03.prod.outlook.com (2603:10b6:a03:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 10 Mar
 2026 09:56:14 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%4]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 09:56:14 +0000
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
X-Inumbo-ID: 61c549e5-1c67-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASc4FhDSWb36YGyDh8oet+7fcVfQQvpDA4JoAbPzTnwSJJgAAMBAheiM7beMvjPlHERnzOWkefgxk0w9ZhcsNUKdzl+URzJY+4OgPlz//j20NjQp4fixFl/30vCFh8TFTK26HXwXl3XRc6ZYloulZDdHPOK6WnFHKUcEUGACEu8Ru1ZTeJB0cCKtNANAb3UgKBykwaqVWzyI76Ml0qrYsdaS0AcFFWFH8ej93xsCw7DfFt82ntHaU738hPSqa6bNove0iIKNAZ9A0PE9++lGfyAiP69yBdP6FWt550X80mi5lCpe43g7RLWnQH1uEYHbxlvlI52IIHj8jP4vgUeqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEbQUuU1SGwprGIKvAjqcdRp4avOR0fy/79RpehbaYk=;
 b=xDBx3du19HL1q1jq4MpDv570OJK6+iDT3nS4tbGLxQkqhhfGnWIV4ao3nH7wHoPFwKW49SRgcQWSfmbmQ9g6lpEuTgpZenI78UpUSirCGKwrv4X7Cje/5ou0raYY1/TrCeHoFXk3Xup0zBQW4QgeMwoWDSce8j2+4cQVpGQKvo/+0xJWPiamFabkesdHzz7UZ2QaLKXZemS2bGhBHF6a9UV/vTKcf3mp957wRaKHowO8rrWfJJY8f5YUhnNPcX6Ss6KDseE/5OS0RGlYTzvRqzt7EKV6/9ohTmrp1+QrW8fiBZbMsqzn4x4EHlY18Ha24HsueLBij6R2yQCfExB5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEbQUuU1SGwprGIKvAjqcdRp4avOR0fy/79RpehbaYk=;
 b=l/Wck4KrtG8teaLBZdYB3PhMp5NBrzSRfs+cKJ6cI8hRa1AdiY8ytOqotZxBQVUWoh/nOl9oQk020Y2mECXWPm6lrpm6dTVTvRdTPVG7ZiA1+0bkPStTkxewdK30y2AxEhTHpzddj3yMpaWeAiZwGBrYxMljDATM0Sh0WodWtmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Mar 2026 10:56:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] core-parking: shrink core_parking_cpunum[]
Message-ID: <aa_quhtlfKwozTQC@macbook.local>
References: <29922662-8b95-4a69-9401-11480df59cdf@suse.com>
 <aa_fUpLqaPDal_-l@macbook.local>
 <fdd0ab2a-54f7-4f80-a896-c6c21e3ad5ad@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdd0ab2a-54f7-4f80-a896-c6c21e3ad5ad@suse.com>
X-ClientProxiedBy: MA3P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::6) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SJ0PR03MB5533:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be3b59d-df4e-4095-81b5-08de7e8b4423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	s/yFDkKabxeewcx9yi69GEQFgVQI6Tdn6/KwIHpm8K7jrhpeStPBfRTe9DldwvNi1NEgFTcqJ+w+tBEMkNodrsEqt+vr4lhSJ1edQrmfNR2ZMIkLdhr/E7vphe+j5qSW3k3CoE9KE92I5Jkx1txoMEoUQ4O17uYtg2rS5QFZPKu9DqnHtl631BCcigqyxTHFYnxdwGbffEXBzipKhNjwKCC7Cfyg7pFy78SANQ3nzAhzeeHuf1zEhzJrh5bcss/ynkBFqIeznEEnGJGpr639GPMxkAdUbOlc/Hv/XE3Cn8AjJBXAFGwkpg9GtbBPGZ+PO6Pq7dO52XJHkx8Nv1HhKceBfyzzWdvwjUYSfL7m0phosPjCrFJ6Yx88/4AkKkyzZupgF2CliDzMZFVoZAEABoUOr8cg1a9/j35pvOcz1GtouQ+XZ+mk0IbAJScbRT+PjFLEvPBb1huEZAjHa9TfRQAGC7+kX2L9xEuVnRxoQGNcqaDQ9wOfQlVj5358Tewfz3TUvz26/bd4by6SMYw4vs8wEyZ/ma3K0hbGJW1p1tOWMl6k420vQ1H5oFadI3HRricVSLD4zKcLXeEKRci9I5ns7BwK+H+TsGhCkmvd3z2ZYsE1ogtkZ8aE1x02MrYwizpYstjhRX/KMrHlu07pgLcBeS4AqVrI1fEC8w/cAqlFFYYTyYUw1m6kuBAfZ/k57oG+5Zx03a+wrhNgPJQ2eQ0+RhoRkVFR7SZLC5uhb9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckxxampnRlJoSnNyTzF0SnpyNSszNVhwNWd6YjJ4WFlySWZ5UFI1T2ZsSEdt?=
 =?utf-8?B?QzZLZlVua1N0NzN0SG9rS1k5Z2l0UlVKd1RmUlVrMk0rUFNSNnJrSWhoeVhZ?=
 =?utf-8?B?enFQTHpQWk0rNXI4dE8wTzhWQkdDcTJ4R0hTYTRUSENGVUQvYzNyT1pWU2Uy?=
 =?utf-8?B?TE8wMXlDYWpCK1hhVVBQZ2RoWmZDQms5TWIwRG5RTnV1SFlkSFZ1V0xnT3BN?=
 =?utf-8?B?c21DWlk3NWh3b0FCcmxvbU05d3pJbFhZZzdzUDVGcEF1MllSSUVHaGdrUGty?=
 =?utf-8?B?cGhYdWVwa2NWcHZKc0U3NGFsbG9FVGZpQ1VuaVF0LzB6TTU3djZUT3Z6Smx0?=
 =?utf-8?B?YzhRSFFDdHQyNUFET2drdEdrMWUzRFRvSzN0MWlIVEhwRjRvOVMrcncrMGNV?=
 =?utf-8?B?UmluZjBiMVA5RmdNTUlwWG1XcUZidUtvOFB3Q0NrMmZEZDBYZ0cxNHFPT3RS?=
 =?utf-8?B?Q3M3UkxJUEVJUUlmQmlxZXdyV3ZRaTFWK2VKcHdyT0x0d1JmaVZtcEd6dlBv?=
 =?utf-8?B?Zm9LN1A4Y0cvT1oraitKUEw1MXVldW43bFdFTVJSR2szdjNqbXk1Z25tUXZJ?=
 =?utf-8?B?MkZsVlJWMmozSFhxaUswWDk0ZWpGNG1iV0JwN21ObnJSYjU4M0VDYXh0MWdz?=
 =?utf-8?B?QWFyczNlRDhaK28ydE1iRFRabzZaNmhSUmUwcTZlWCtXeUlGY1doSGxhZ2tP?=
 =?utf-8?B?TmM5ZlRvM3o3dHFLa0hpSjhuS0ZaajhIUmxVbmVWVjRqVUl1VkUyVkxlMXF0?=
 =?utf-8?B?WlMzdjMwekxza09HUlpKTzBHdktTUFB3MlpKRytSSjRacnZBQTFXY2RmekZr?=
 =?utf-8?B?dzl2ckdHMjRITG5nV3NxQlR4YzRIVlBEUFE4M091TjIvNzlhUW5FOXRnY3Aw?=
 =?utf-8?B?Q0JqYjlMZUZ3NjRnRDFwaWhoSXhkZjdlTmtIQVNCdlptVmVGUW9oTjdqMCtL?=
 =?utf-8?B?YXN0cGVRWGQwWngyOWlmOWhXVkVUbHRqWGRwU3FXOVN2TUt3NHFEQWxvanNF?=
 =?utf-8?B?amdXRGMyTUVrN1g3L0h3TkM1bHhSMUx0MldQaUhOSyt0V0Y3cnRZbkQrS1pp?=
 =?utf-8?B?TGw4Tmo2L1NUWCtqc1o4bHljR01ra0RBMlNBS0pZQWFlQUllZWFMS2NuaTRB?=
 =?utf-8?B?UTRLSHdESzhNZ2hPc2Vpb09xaGd3MlVlQUtaOExhdlROcCswSlh5djlZSjA1?=
 =?utf-8?B?MHVEMTVVbm5iZ1BSaDB6RUZvUml4SVJiaUFEZVRCOGdsbjRNYTI2b0R4b1FD?=
 =?utf-8?B?bm16WmtTT1FxNWJxMk1hSTlvMUtZNU53V2pBajlRZGxpUzl6dU10S0FBSE5T?=
 =?utf-8?B?R0lDYi81a2NueVdVUHhhaUtnWWwwWmJYYkdVS2tRUENxeTJYWi93WHlleEJS?=
 =?utf-8?B?bGk1YnpKY0JhS0V5QWFBU0I0aDJ6YWJNREFyZ0Jhd1E1S3JMQi9vQVljc3pD?=
 =?utf-8?B?ekNhRDhSNXgwcWF0MlhORCtOS0htZjdORjN3RTdKbTlRMWdiaENWYkVlMkJS?=
 =?utf-8?B?d2crVWNNalM1MjJYUDVteHN2ekJXWjMzWFJJb1kyOVVJbWNrZ2REVm1xS1NX?=
 =?utf-8?B?Y05yWENLd29MMmlMRVdwZ1AzTllXQkRuUERMUDl6aU0yWjJJNVJ1bVFXMlZs?=
 =?utf-8?B?TEVydHhHWDJ4MW81RlJSYURabzhocTZ4ekV1R0tSSnhVaCt2akVpTEwwZEFz?=
 =?utf-8?B?MkcvS2k1dWhGRzhmTForMzJmUlFtSzVKRFk4OXVIYmtITFkxNi8rL0dSOEdt?=
 =?utf-8?B?SFhqamVEVzdWWFo5RGxtZ3dQTUxnLy84ZWl6bEZjb0tneGZacW5qVW1NNVpD?=
 =?utf-8?B?YTNVVlgyOUxnRjRZZnl3Q3NhdU9OUXhMdGFQcXNBRGkySk9nUW4wRjVXYnFI?=
 =?utf-8?B?NDdCV2xjL0cwc1hJa3V4STV6bmxOVE9Sd24vMWhKeCt5ZTlVNlJkRHNjY1Vy?=
 =?utf-8?B?bGxBYTUralcwV0ovaHRkTFZ2aTFZVG54L2xDcDZJeVY5K2dsUExZeTUyZlZq?=
 =?utf-8?B?cHpWOTdmemNVelJ1SHVFVGZwSldVMzB1TXZGaS9MenBFa2ljVW1jR1ZCS3BL?=
 =?utf-8?B?cWk1dkx4Q3dPMG5wbUFmdFVJbTAvNEcxVWloVTRubWNzQ3F0alV4dnNobzd2?=
 =?utf-8?B?cmFtYy9PTENpRUFmQTI5b1lkaCtKTFc2NFdmdWtDcnF5Q0FvREQxOGs1dVpk?=
 =?utf-8?B?WlkzUW9TSE42TlZ6V2xlbFJTWHZ0UDRDM21NZFpkd2l5RU9iTWppNXlwYWJm?=
 =?utf-8?B?V0pOcVJjNFJ6ZVNYSHBNbHUyRDBzMnBQb1pjSFdOdEljLzM4eGMrcjd1YklY?=
 =?utf-8?B?bUpjU3ZncUk4Y3NIeWJTZXRLMUFHalVGbHNWdFFiVVZSRjVuWlFhQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be3b59d-df4e-4095-81b5-08de7e8b4423
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:56:14.3733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMrFqNpV3PZP+yHQx+I1/wmxvpebgszODQElbJuQ+1ey0DTZwtwyL3siVu90yDs77zHj3+FHhcsry+ObsuVoOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5533
X-Rspamd-Queue-Id: B14C4248EDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:20:53AM +0100, Jan Beulich wrote:
> On 10.03.2026 10:07, Roger Pau Monné wrote:
> > You possibly want to adjust the subject, instead of shrink I would use
> > "dynamically allocate" or similar.
> 
> I've changed it, albeit the goal really is the shrinking.
> 
> > On Mon, Mar 09, 2026 at 04:35:34PM +0100, Jan Beulich wrote:
> >> --- a/xen/common/core_parking.c
> >> +++ b/xen/common/core_parking.c
> >> @@ -20,6 +20,7 @@
> >>  #include <xen/cpumask.h>
> >>  #include <xen/init.h>
> >>  #include <xen/param.h>
> >> +#include <xen/xvmalloc.h>
> >>  
> >>  #include <asm/smp.h>
> >>  
> >> @@ -27,8 +28,8 @@
> >>  #define CORE_PARKING_DECREMENT 2
> >>  
> >>  static DEFINE_SPINLOCK(accounting_lock);
> >> -static uint32_t cur_idle_nums;
> >> -static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
> >> +static unsigned int cur_idle_nums;
> >> +static unsigned int *__ro_after_init core_parking_cpunum;
> > 
> > Don't you need some kind of check in core_parking_remove() to prevent a
> > NULL pointer dereference if core_parking_cpunum hasn't been allocated?
> > 
> > Callers of XEN_SYSCTL_cpu_hotplug can set fn = smt_up_down_helper, and
> > that would call core_parking_remove().  core_parking_helper() already
> > contains a check that prevents accessing core_parking_cpunum if no
> > policy has been registered.
> 
> Because of this check, cur_idle_nums can never become non-zero when the
> array couldn't be allocated. Hence core_parking_remove() will be a
> somewhat expensive no-op in that case, with no deref of core_parking_cpunum.

Oh, I see, both loops in core_parking_remove() are bounded to
cur_idle_nums.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

