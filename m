Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLCAAWxYqWkh5wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:18:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7520F92D
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246407.1545595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5mG-0007rv-6f; Thu, 05 Mar 2026 10:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246407.1545595; Thu, 05 Mar 2026 10:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5mG-0007pQ-3r; Thu, 05 Mar 2026 10:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1246407;
 Thu, 05 Mar 2026 10:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy5mE-0007pJ-SO
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 10:17:54 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92715f5a-187c-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 11:17:53 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5751.namprd03.prod.outlook.com (2603:10b6:510:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:17:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:17:49 +0000
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
X-Inumbo-ID: 92715f5a-187c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iveqgx+reBQU8LR3yWdSYQnB2SpR9n8WxyYXrahwyCvxlfs0cGdrg1Gx+m90QF5FiQz9gbsO6QHflHIWklyjxUFIhJM7REDLdzKLdOmSRFEVlAiiUzhLRyXVBTezoKeI47pvfSNBy8SXXQZdHJbmqwgglQDqHbPhrOUThB+ulC8UpSMoJQFBgpAemMI13uQhFXwV/X4Nk/U9kcN4Gw31fjg+FH350nvQylH0T1vBuM4KAiFTp3Iy/91ssQ9NiK+kdbpbxXTAUp6jbzl+KX1/rTFCCmketMVpSiyi4rA/vecUItoPSMPoBqd6QR8FzL0OMZ1EEkDwnExCaFDWyOUpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yb2AtnC2c0l2A3eDXawoWOYwxLc4Uvk1WfvhikYEUXo=;
 b=KGXDRPwTyMjS7dlG4eWoPyvPZhbgUCGSh5w/naL+o3cx7jNS9Fq/KflVPiCwiF1OHXAXk9954YZIWZ8sseFPE6O+hVVBxv1fXS/EjNjVwyPNnUa01AZeKjBI6XH2OR2p/RSUSQLUS1+edjhCHTH6hCfXy63bSoWgfdf0hhCIQBYVWzeJnFAtuYcUFM0AKQR1MuWUHeeNhxx5+dJYWYjaPRXt+1rcCn7Q239lx4q7w12EE7DgZDVhwzceNlJPwXFLQl3HqXS3bYSHAeY6Ji1UZh8n2ylo5FmDs8fobCyMlNkjYItvOInjW/r2FUBJBsjl75Bztie7IpJblwqViAsz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb2AtnC2c0l2A3eDXawoWOYwxLc4Uvk1WfvhikYEUXo=;
 b=QGQB2LL8i0/2EmQceE+7jNcWPdlF5yCJvOBRiIEIjO8zuB66EoNCx31Ax6uudd3qPwVvap9SQgBMgcOG3wtJUuTwxfbij+hZTbyG+Bom2TpLLTfOrsPwc4peFrrouc2BhGO6tHwBH4Z2ltOj96lJTSERRNVy4UO6Bw2451jLMuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 11:17:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
Message-ID: <aalYScWQQx_vMqII@macbook.local>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
 <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
 <aalD5VRBBuM16pxN@macbook.local>
 <73dd0000-4044-486a-915d-6381d0820cf6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73dd0000-4044-486a-915d-6381d0820cf6@suse.com>
X-ClientProxiedBy: MR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c12a01f-bc69-4f46-2548-08de7aa07428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	3sLo5tt0lGLeeVvqk+Qb2ULjuR1bj/tDFURXEi+EsYd6AOxmVLNXA6vEa6XLIDF0Gv+NctcjB/+yV62lH086ZPzDl+sTs/6gvohyvv0iOkuYkU+D2/QJrjM0GwFzCl2IM0PFprRXrRsm6CxcfOnPJwrODqthRQQZ1v42K5N1Qr/j4hrwepKkppMvt2ZuPEA5x3UOcCk2FjF9G+4GNBFTV0BUTlizovhyC1tuBpAEoTjuzeXYQkVMTtSOjEc7CkQUW30SABfGthfwFfsgBtTEKUvbBQEKfYhxgQYRg6wHG5H/dkmBXtkgrGxLgUGrVju98H1F9xU2uzFJ6OkTRhdUotv8zi1Jaarr2XrX6H0ZY81QCgQ4G7VFMYXj2jsEJtmYzaWjFTKfN5KAK3HT0PrlntNf6AwOH4xmPeg1lGF043nVJo2Y4Daz5vRh4RTiiZxNgpf27xY8Di+/tytrxIrlUKxNwzkkV7eYsKBf13XF0MeVF5dmto7D1dY6lhHyVQKX/1k4bRwmDqZMUjlgYsRr7QPTwX0q3di/MOxblz0A2XTloYG2xtQJqoGfWE9LoNQwbrZ+NdL/yC0yK3CpengAjrC3wfkPnoPAB5vXp6E/DlmWAyRFSjevIcgTp3b7XrB657mk4gxMgCO3WBmHfHKx9zp5/5qwpxXyB0d44Ey0xUQT3vNaq7Ox5uFuKhP0TRF+D1GiwvkVWws3zf3IW/60uEQT9cvgPN3ac423RbVCmwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WllROHRWeSt0Yy9QdnJZN1R0MEwxK2NzTmdlUERjMEt0VXI0bzVaZElPNk1q?=
 =?utf-8?B?dFVuelJZSzh0VDF5VTBXQ29FZjM5WU9rVVpLUUg2VGtKOUFaVzA4NzhxS0lV?=
 =?utf-8?B?UTNHdFRjaTh0V2ZicFNtMDRHN21QTHdXRVpmL0szZzlwQ3JyVUw0VDFWL05Q?=
 =?utf-8?B?TzBFcllnV2tVanR1RFQ3Nms4SXBvNU0ySGpRMG05eURXRWhOWFJqV1VkdWox?=
 =?utf-8?B?Y1pKc0FVR29DL2dUcE9leHVvbVArYXhPbUlaSlhpYjNzajBLUU5QQjNmQlRY?=
 =?utf-8?B?dThjM212WW4xYzJhUEhsb0JWVHU0aUlDV09lczZ4T1VTaFZpeXFjaUUweStR?=
 =?utf-8?B?bGw1M3JuVjRRbTRZc2hvZE1mK0k0bXlnaUl1Ykp3a2xUdGh3WXlTTEdwekFV?=
 =?utf-8?B?clpqWkxBdk5nRWVZU3dpem5yQWtZMS9oeXliUUtnZEFOS3lGNXFQZzhhOGNF?=
 =?utf-8?B?QmV3VjZ0Q0hGWVB4NFdtMy9NbGVuRnNXeGJqUmlNbWVTNTF0cUNUa3BMOXBn?=
 =?utf-8?B?K0dndjUvcWEyUzFrK0xxNTRqZ05SaHlIRVkxUUp3ZjhTZm5waG5OZjNDWDYz?=
 =?utf-8?B?KzIyV0lwcHZzU0l3NmJjdC9DM1U3anh0eGZUcjBRTHozVFU4MVVPanZ0ZzNK?=
 =?utf-8?B?RTlxR20yME5GOTNJQysrdEhIem4xRzJQa3RKVlMxN0t6by9TMW5aalF5MmNJ?=
 =?utf-8?B?eDNkMityaXZxZzMrcEQ0VHMvdVVZMm1XS2c1NWxZQ2xscFVRdzZoM2pob0Fq?=
 =?utf-8?B?MVRKQkRXSmJITTlJZ1FxZENSbnZKZ2RoM1BuWi9VSWJTTTBKVWdXVlRzMlhy?=
 =?utf-8?B?TGhNZGdUK2lSYWRYb215NzBrZ2lyU2Q2T2o1OUVwWGgvUjlyRWZyVWRpV1JL?=
 =?utf-8?B?TXhBUnphb21DTDBxVnl0ZW40Zko0VHU3di95eWJuZ3ZjK0d6R2lod29EMXhp?=
 =?utf-8?B?WUVGSEErUlRadExYKytPR2xvZkRhandOVFRVNWU1UEtiaUJLQ2ZSdlhRRTA0?=
 =?utf-8?B?V0tXM3gzaWEzR2JnN1BlMHBGd2xWdWtYNHdhbnFHekJ3ZkMxNEdFelBRYUN3?=
 =?utf-8?B?aWs5UUNabGYrbktsNjJHcEk4SkUvN1Nqd0JoYWV1OW9mQXlzbWNLb3VyR3lU?=
 =?utf-8?B?azdzODAxbGd6RDFIczV5a0VCUGR4T3lXQVhaSDhveVpKeEdJWlhSZ2F2ZEJs?=
 =?utf-8?B?M0xjOVp6UW10ZUY4QWFUV0FQSVhUVnMzMUphK1BTcWVCTktVMHFxZnlIdmZO?=
 =?utf-8?B?S0pSRkZ5RUtkT1RIMllJcUN3U2QrOER1Y01rcEFaemVQK3poTWY5UzR5djZv?=
 =?utf-8?B?QmYxMGhHZ3BZQUxDRFBreGZMcmxJVFFJd0VUdUZITXQxSHNwVGc5RFpERkF4?=
 =?utf-8?B?di9nYzdJUmdlQnpSSldKSTNERWNBZ0wxblNJYXFMeUdmYnZJU1JPb0Z6K1dk?=
 =?utf-8?B?ajB2cnFMUmRvMHo2ZGpHUG1sVlowbEhnRUU0eGpxbWVYRVE2RTErVDVVWXBD?=
 =?utf-8?B?NTRKU25lN2tHdkdsbUoySmZqZnovTExhZ2xmVnAzNmdhN29HREJ6NW1pS3ZG?=
 =?utf-8?B?L0ZmT0d2NFdSclRvS1djd1A1N2dWM05ZRGJJU28wN0U0Ym1abHhPdVh2M3pz?=
 =?utf-8?B?N2JMSnRvWGVna2tLcm1heVdCQncrbU9valYwZm5WbnN5R3RmYiszZld4VzZk?=
 =?utf-8?B?UHYwQlFsSFQzL3JiRjFYRTlwZ1gxd0I1WWNtSnVza0hnTVBMajRhVW5weFlL?=
 =?utf-8?B?TVV3KzZNTDNxU2hyNVZkUVhsNzUyOGZtczlZSFJINGhBaEhWd1dYMnpvWWJW?=
 =?utf-8?B?NUZHck9IM1RCN1EzUkg0SmVyNlE2MC85UjNZUjBmWmNIeHNTRUNUR25iZXQx?=
 =?utf-8?B?OVJuWmU1c00ySGpLbURXV3FHMlorck5rUGkveCtpYlF4cXFlZHloNW1EUytG?=
 =?utf-8?B?MG9DbmsrVFNzWDJSRFpIWEgrVlVoejdjZjd3Z0w0SkY5eFNBcVc3RkVqVlNn?=
 =?utf-8?B?SW5GTUN3NEQyTlczUkRrWDBacmhpZHh2UnUrUWZCb2dEVVpidUNaUnYwbVlv?=
 =?utf-8?B?elUxK3NLd1ZZdXJBYWhDWjF4ZXdKa2dFUUhNbW9jeWx6VlBJbjQ2Z041a3Fl?=
 =?utf-8?B?NDBoQzBBOUlsUjU4TVRuWEpQZzFJb3JITFI1bUQ2RVF6UDM1ZzE5UGJYbFE1?=
 =?utf-8?B?SHV2bzVHby9wTHJSRy9STWt4dzg0Tzc4cWt1NXFWb3hmQnJlbWtWanVUZjBs?=
 =?utf-8?B?WTJXVHYwUXpKS3h6TTlSeDZnYTRjdTFsV3UyNStYVVY4TXJNZDJhOEJYZFhG?=
 =?utf-8?B?R3QvK29RbzJyOVFaL1lrbkV0b3VBOE5GZDRuMy80QmxHOU03SW9Jdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c12a01f-bc69-4f46-2548-08de7aa07428
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:17:49.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFpvwPipZipAkb0uwRquqQOv0l/S4C8+PlR4tPkq6rwjJARH9F4OmU68gXFOOQHsygpklOdlFbBPnXAS54yL9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5751
X-Rspamd-Queue-Id: 58F7520F92D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:20:02AM +0100, Jan Beulich wrote:
> On 05.03.2026 09:50, Roger Pau Monné wrote:
> > On Thu, Mar 05, 2026 at 09:17:23AM +0100, Jan Beulich wrote:
> >> On 04.03.2026 17:36, Roger Pau Monné wrote:
> >>> On Wed, Mar 04, 2026 at 03:37:25PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/drivers/cpufreq/cpufreq.c
> >>>> +++ b/xen/drivers/cpufreq/cpufreq.c
> >>>> @@ -694,14 +694,23 @@ int acpi_set_pdc_bits(unsigned int acpi_
> >>>>      {
> >>>>          uint32_t mask = 0;
> >>>>  
> >>>> +        /*
> >>>> +         * Accumulate all the bits under Xen's control, to mask them off, for
> >>>> +         * arch_acpi_set_pdc_bits() to then set those we want set.
> >>>> +         */
> >>>>          if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
> >>>>              mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
> >>>> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
> >>>> +
> >>>> +        if ( xen_processor_pmbits &
> >>>> +             (XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC) )
> >>>
> >>> Currently the CPPC driver is AMD only, and hence when using it we
> >>> don't care about filtering the _PDC bits, because the ones Xen knows
> >>> about are Intel-only?
> >>>
> >>> As you say, we likely need some clarification about whether there's
> >>> _PDC bits AMD care about?
> >>>
> >>> Linux seems to unconditionally set bits in _PDC, so some of those
> >>> might actually be parsed by AMD.
> >>
> >> Or it setting whatever it wants is meaningless on AMD systems. Where I
> >> have extracted ACPI tables readily to hand, there's no _PDC there.
> > 
> > Oh, interesting, so there's no method to start with.  Is there an _OSC
> > method however for processor objects?  _PDC is deprecated, and maybe
> > AMD systems only expose the equivalent non-deprecated _OSC?
> 
> There is, yes.

Hm, then an OS would use the Xen _PDC adjusted buffer with the _OSC
Processor object method I think, and we are back to the position of
not having an AMD specification for those bits.

> 
> >>> I think we might want to split the setting of XEN_PROCESSOR_PM_CPPC
> >>> here from the addition of ACPI_PDC_CPPC_NATIVE_INTR into
> >>> ACPI_PDC_P_MASK.  The latter we can possibly untie from the questions
> >>> we have about AMD usage of _PDC.
> >>
> >> Hmm, yes, I can certainly split the patch. I'm looking at it a little
> >> differently, though: Us leaving any P-state related bits in place when
> >> cpufreq handling is done in Xen has been a mistake anyway.
> > 
> > Yes, TBH I even wondered whether we might just wipe whatever the OS
> > sets in the _PDC bits and completely fill it from Xen (unless for the
> > weird/broken case where dom0 is driving cpufreq?).
> > 
> > This is kind of what Xen already does now.
> 
> Indeed (except for the T-state ones, as support for that was never added
> to Xen).
> 
> >  However see below.
> > 
> >> What's
> >> unclear is solely whether because of us driving things some bits need
> >> setting (likely none if AMD systems indeed don't surface _PDC in the
> >> first place).
> > 
> > Since we have the parsing of the ACPI related data done from dom0 it's
> > not only Xen that needs to support the feature, but dom0 also needs to
> > know how to parse it.  Or we just assume the driver in dom0 must
> > strictly know how to parse data from the features enabled by Xen.
> > 
> > Maybe Xen supported bits should be & with the dom0 ones?  So dom0
> > would set what it can parse, and Xen would AND that with what the
> > cpufreq drivers support?  However that would be an ABI change.
> 
> What cpufreq drivers are you talking about here?

I was talking about the Xen cpufreq driver, sorry the context was
confusing.

> When Xen handles P-
> state transitions, the drivers in Dom0 would preferably not even be
> loaded. That's what the forward-port did. Upstream they may be loaded,
> but they then can't actually do anything (and they may exit early).

Well, yes, on FreeBSD I simply overtake the native ACPI Processor
driver with a Xen specific one that has higher priority.  So the
native ACPI Processor driver doesn't even attach.  I think Linux is
slightly different in that it allows the native driver to do the
fetching of the information, and then the Xen driver only does the
uploading.

> Coordination is necessary only with the ACPI driver(s), and that's what
> this function is about.

I think Xen also needs coordination with the driver in dom0 that
fetches the information from ACPI?  It's not only Xen that needs to
report what the cpufreq driver support, but also dom0 would need to
expose what it can correctly parse.

Thanks, Roger.

