Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7430447BCC4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 10:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250245.431031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbK6-00078M-IP; Tue, 21 Dec 2021 09:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250245.431031; Tue, 21 Dec 2021 09:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbK6-00075e-Eg; Tue, 21 Dec 2021 09:20:42 +0000
Received: by outflank-mailman (input) for mailman id 250245;
 Tue, 21 Dec 2021 09:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzbK4-00075Y-TC
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:20:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43387681-623f-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 10:20:39 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-kL73CBeIO4uiCvfE5zKFqA-2; Tue, 21 Dec 2021 10:20:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 09:20:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 09:20:35 +0000
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
X-Inumbo-ID: 43387681-623f-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640078439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aLE9fdf9dWfUlU6DfzmijN1/DEkeGK+E8OdRzu6QV8=;
	b=NCCrUbhfjpKpVvDnVLqs46isegzKQeKS7smF4pBqRmLHrc8pjPBiq1klgePTYHswcnzkpY
	33MObfTcfB3akS3EZpURD5YB7p10s2zDj4wRDxHvNGvMCb6tfI9kLvn3bt19tSrNtwNit2
	eXhfdvQmbFOMoz9suHoiMz+M4duPvMg=
X-MC-Unique: kL73CBeIO4uiCvfE5zKFqA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAoRFjw2wcWtng5vALPm2I0QnWXJOEywYNXpEYgv6hCZVTe+CRh8hp7bSTg+NguT5hr4lySZSoGV6fXnQLYjrHYmByOihbY//MvKZDi1MSG+hZUqEMXEI9l/fUlT88jGJtUog6vuYD3XYPAq/6u2paLlipsI9vgBVqB5mctTtLnL+MaViltu0jeF9bIvSfiCrS1G51USYu2BO3cFg9ws/i4ohb5hjuZyp+5Znv0awk1UUZ9i8/By6WC/Clg6ink6OeqmWVGbKKxtadPJDXDaBvo3YvKxd5995LdiMKj5C6mWYcZECv8NDfz+C3fHGuXkHbR3TeJjoIkupjOg+eAA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aLE9fdf9dWfUlU6DfzmijN1/DEkeGK+E8OdRzu6QV8=;
 b=FUehrQooL5Pphe1/fypFuvMbHFFAsy/4/6tM1pUkX0iaDkfp1q8vBIU9ws+7op7u6bCooExGr8nl8nTeFNhIg+JXQKxEmmaMhg4jv2RwKEOzJhWOu/vhsEOv0sRUOLKAKdxMzCRQvaTfmnfUacMXaIcy39/5prlstKLwtx4MmgPYAgbhLgn5PHA/cu2codWTLb9QJQaEXC3LmrouZb4RZTYQHaiFTkR7jv3QUCjTCAoW4woYzAvAmxeuykEJUPIFyuddPoQlOdJQBKrZ0DH72oX2YT8KHbYd+rb0Tq1AHkZRWm+kvrPPXRNzPLvJJJu0vEkGEO8XglYjWWedvVaYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb60f20a-a75f-3b81-e528-7643d47996aa@suse.com>
Date: Tue, 21 Dec 2021 10:20:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3] is_system_domain: replace open-coded instances
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20211220162853.10603-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211220162853.10603-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0110.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f87357d0-619e-4a25-cc6c-08d9c46324d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55983FC2E150A946A3F0C7E9B37C9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eoTM5Kzmoe8BI5c1UQkYdChslVmf0qJuYcS0N1Tp3T9P03QIRpeSxDRzOyYUDj3U0WGK0GwJrI8Ty1skvLKGqVBFhJiWm2apqzMPKU1y1C9DNudWk834IJEjvol0U6XywS57oPRCncnOfdUomr4l97HSmLkyn6MZLo9M0HywujArq7Sq/NgJp29R3AI5vDp7hDG/5VogTby8O3nViV+zAXfG/R3EvGbjG5rq4phgvjK5hOLU0Sbil7pj0lmMPrAUXpIrNHU7smxHBIENQ5WUnwleqHJOucAOn6djMZdritF6rzayOK4zl5lc/09UXtnIt211Kc1hUpdPTmnZi8EXZV+zWDzfCT9GtJ8uCZVEnSP/ygYsJOYEqteOoGFUZUTh7WpZSBsoh3uAvO6ZxLX2I4aI5xtlS3waqn//YuW5td6jJ+cdJjQ7vyObHoBtt0WHZb3rS1PbE3Tae4ShkB6cnu+nJ2k/0PV48p/Pv+M0u52veVJOEQ/pdj/8zk+L0kNRdrKYd1Tq0CMUjXpsp5eC/ky2bu29JBnBX6rXXJRrSXasnenAyuui7RsU7wThX1NUvxnSzlk6smcAsCMbt8tkHYhBX3yrQHWXOVV4k5K7ZMdCGdm3fQSfNPHukqgyImXHAiufsRVQAPVmaX64FYWtspK4n+FPTURBPGAswZChdAbNIl8nNGm0OM375ha9VrVeyIxQKkg6aBxW9dJl+QHQruCbiEyalTXtiuPRlrvLAmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(31686004)(8676002)(38100700002)(8936002)(66946007)(26005)(6512007)(5660300002)(66556008)(66476007)(36756003)(508600001)(6486002)(316002)(53546011)(6506007)(86362001)(31696002)(2616005)(2906002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEJoangxZElKK1JtVy9pSXpadkJLNys1cWZ4UjB6TkFmMXFzR1lTSXFCRG5W?=
 =?utf-8?B?aXZvZXg0WisyZFB3UVlUVUpENTRsQ2V2cXVWcHVSeHVpaDhVMTQ0UzU4UHQr?=
 =?utf-8?B?MGVJN2JieWhXVzFwdmFPMFNGeWZmd2daanhiNXNzL0RoMHRyNk5VNnRvVklO?=
 =?utf-8?B?eVRVOFVFOFA5blF5TGNpbExxQWNhMHBXNlJDRnl6eWJJMVdKdmc2clJ6V1lQ?=
 =?utf-8?B?OGd3YW9icndicjhhRU80cHRQc0lsem5CZG52alZzazFmTUJkamJRZFpscTZQ?=
 =?utf-8?B?Z1ZmM2xQREdWVHl5UmZHMThwcFFmQlhuZVByeGJaT0pnTi9xcUNVVG9XYlRO?=
 =?utf-8?B?UkJ0RHpTY09PMzNNT21WK1ZCbER1Um40SkdFZDJQdWNtUzBDRHl0V0I4eFhG?=
 =?utf-8?B?M2s5MFdzeXFuMDNSNm5WKzhvU2N4SnRnWk9qQ2tOVGdiSHI0MUV0RnFUN2p4?=
 =?utf-8?B?YXVIZVgzWjcxa2l2bGljMFpKZG9ibGhXWGFwS2l2TDdmb3RlSzFNcTduTXI0?=
 =?utf-8?B?VE5JWTN6Qi90RWk3SzN6eW8xdjlNTkdKT2cvMVhiTk1sdXJIbjBBUzVEd1pu?=
 =?utf-8?B?aHVreWZWYm1FYVdFODd2T2ROMDRIbWNGYm9CTUN1SXVtMk45bGJ5ZUtvVjhy?=
 =?utf-8?B?VEFwbTZzNnI4S3d2dlh2akJiQUxscEg3U1lYMGlwYjRJbmtINXl3dzh5WkRQ?=
 =?utf-8?B?S0FEOGp0Z0poWFJzcVliRUtNSGpUcis4aE1KVVdqbzB1emJCdmtwMlk2VzVG?=
 =?utf-8?B?TEgwaVBBNUY2YkFUenVwemdOdjlvN1FxWTdpR04rTkltOW84Q0VsbTFLOGJv?=
 =?utf-8?B?N2s4S0VmNXQ2MVA1N0pLcGZWLzNUb1AxTkRIZVBkRGx1V0pLb0RxR2tQUHV3?=
 =?utf-8?B?T0tOMHB1N0E2RUpabnR1NW1SbU1sbVg4R2I3K0hicEJRc09oK1dhcU8vZVdD?=
 =?utf-8?B?dXdaVlA0bm5Ld1JYTml3RWZYT3VsWVNFS2NNazN6aEltMERtTTYrdWV2SXlK?=
 =?utf-8?B?VnAvc29ObzJBTTgwYzY2UkkxYUxJQmRkSmYzbU41SThlbHQrK2kvTzBBVkti?=
 =?utf-8?B?WGx0RWtJREpWZE1BVUhzQ0NGR3FxRS80TG9vSHdXUjMyNHlUVkFhQzhTWkRU?=
 =?utf-8?B?S3E3WHdTMEd3RitWT2tpc3IyWTByekt4c3FWOFFSS0VjYyt3ZkZxQzdUWHFG?=
 =?utf-8?B?MGNuMTN5R0xnalBCaFpReUc1SmRZakd3WEdSMXBXN1J6dHhybnRXeThmbmlG?=
 =?utf-8?B?SEtrOGwxQ1dGakhXQTZLZFZuWHJSY0VmcEZId0VQTG4wSXJvL0J6dWcxcUo5?=
 =?utf-8?B?alI3UjZ5cytwRUpRb3RGUU9Od2FDbFR5UzRBcnl4S2hwZEtJL215T0ErTXBQ?=
 =?utf-8?B?S20reFpqUGlOb3hIYUFORnZRekp6Q0NRZDBZbm1saVcxWkJuZkdVSkhaY0hP?=
 =?utf-8?B?blczQlRDUDhPMUtaRkYzM2dCZVB5cmpQbHVXOW5PcEtxTnFUUUVjWHByaFo3?=
 =?utf-8?B?Nng4TDN0dEJxVEpOc1psTmt0NEdLK0VaYmVkVS8rblBUQ2Q0emsyNFFycXdr?=
 =?utf-8?B?RWkxNk1oSzVKVEhuVGczaGVzVHczMUJ3OEJmZ21OU2FCeDROUW1FTkc1ZjZS?=
 =?utf-8?B?ajBUdGhUUUsyUmlTclJxK2ErZVYwaUtOblBKV29hWlBpMWlacGxJalRCRXl4?=
 =?utf-8?B?WlhPUXJsRENTNEJKVUh5eFcvVlh0d3NxV0NpYXJWZnE4cFZ4R1NNVWoyRDUr?=
 =?utf-8?B?UWNnOGFiQWdHQm5HZzlPczI1TGtKd3E3RitmdHFnTFhUcGVBaW1lMVdUQ2Ro?=
 =?utf-8?B?U25PVUdMTU9MOG9wZEdLYm1oWHRlOFllQTRhaDIvOHlkVlByUTR0N1MxSlBF?=
 =?utf-8?B?STB3V0t6d3NiVnRFdTJIYXg1ZmZPLzdDTmQzYkhWV0hFSDFCMGwzSjlVbVVB?=
 =?utf-8?B?ejUzL1NaTFY1dTByalQrUVovanQ2UVp3cW1CdXkrR0xNcWV5YzIwcXpJRzNO?=
 =?utf-8?B?eEpFdmw1UU83K3lwdGVNc1hkazBDYUlkTkJRNzlDZWpSN2IwbTNFYUtKSVRs?=
 =?utf-8?B?TWRxV285b2pIZDhPb29jdFNyVlhIakZMMDJhWXg3ekFHQ3hYWGVIVXh5dG5v?=
 =?utf-8?B?djh3R0JYSnlVSExrWXg2eCtlbStBamZvV3ZOT285NWhFU3MrREpJbGJDWnJp?=
 =?utf-8?Q?T2/ih45Fw+BJ+CeLHuHMwV8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87357d0-619e-4a25-cc6c-08d9c46324d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:20:34.9620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjsRR09+6iA670v+WKBbNVIFrEu8BsOqj00F/LmWainNix12C1JO1Io9JHC4kZdPEY3aXo9L1vNPGdyLH/pSOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 20.12.2021 17:28, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> This is a split out of the hyperlaunch dom0 series.
> 
> There were several instances of open-coded domid range checking. This commit
> replaces those with the is_system_domain or is_system_domid inline function.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Acked-by: Dario Faggioli <dfaggioli@suse.com>

While I'm not outright opposed, I'd still like to raise the question whether
we really want to intermix "is system domain" and "is in-range domain ID"
predicates. Personally I'd prefer the latter to remain open-coded range
checks.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -613,9 +613,14 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
>  #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
>  #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
>  
> +static inline bool is_system_domid(domid_t id)
> +{
> +    return (id >= DOMID_FIRST_RESERVED);

Nit: Generally we omit parentheses in cases like this, ...

> +}
> +
>  static inline bool is_system_domain(const struct domain *d)
>  {
> -    return d->domain_id >= DOMID_FIRST_RESERVED;

... just like was the case here.

Jan


