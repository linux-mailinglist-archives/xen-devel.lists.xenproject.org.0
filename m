Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA6495B38
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 08:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259256.447337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAokd-0003fL-Ei; Fri, 21 Jan 2022 07:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259256.447337; Fri, 21 Jan 2022 07:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAokd-0003cI-Bd; Fri, 21 Jan 2022 07:54:27 +0000
Received: by outflank-mailman (input) for mailman id 259256;
 Fri, 21 Jan 2022 07:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAokc-0003cC-K4
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 07:54:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a36661d-7a8f-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 08:54:25 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-UFWtaAi5P_aAABi_69Y0CA-2; Fri, 21 Jan 2022 08:54:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6485.eurprd04.prod.outlook.com (2603:10a6:20b:f2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 07:54:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 07:54:22 +0000
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
X-Inumbo-ID: 5a36661d-7a8f-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642751665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/YxFbJOqOGjBrvKZtKIrXEe9U90/x9aVgN+PChM5yL8=;
	b=e35vos9ROcMnhHWJSojc8jhSrubEiFlIxQDjZg8GmGX1wL0Vj+w8dW5I+aI/3C+4aX5ItM
	5tzAxk+SzbxnyZ75tQcEBrDob/grmyUPLvaK27sBCECBh/AVAhiWcyT6kA/CJTGviWOjD7
	Moz3rr3iw0EhUjTA5w1UEEkK8tvT8gk=
X-MC-Unique: UFWtaAi5P_aAABi_69Y0CA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUUv0sRTFfGufTexP+MC6ohhH0vjcC+bbcJudBX3Fj71jNwqukvU0RNwqJMC8r6iqoaqjEz3+aREVeiPjctX5k44azNo7zhfJRHSB8L9g+7mOTp0OmyA3lMHf+MwUmWTTqsb+oe3AFNEdsFAMBNn81WEysGcQ8eE9xODfZIWNCSEjiq4h5j/Ot8acjRJt/fX3WXZk/cXIwKPs+UKsk8zdm8ufIfEWsFkO3E7q3RkxjuNvjWTKROhmcXDfXrFpf8HCS1WsekDr5zy252imRFSqnoiQDT/xjdCxeuguCkAySnaw/5M4lOJ9BajB8Eo8rf9mq/oAPkY6mFMtHPPkBz7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YxFbJOqOGjBrvKZtKIrXEe9U90/x9aVgN+PChM5yL8=;
 b=od21kf1GxQaX0AJu6RC+c1AbyXInuegWcwa26GO7rIQGuPVD6ZIkLvxzrr8uQr9uwcF1HwzXB0bv0Kl/KOvA1DBey8PBGYI9Up4xZQZ1CK3rltgAODaiocukxLNrGobnmDGpieMW2bjiIXqNVN463s+c5tf9stj5vPW4UwOHUo9mEupr64GUjC4aK7kb8JHpKjGY90mFpxFMlXLsQlHAkXF0HO+A80R6U3IRMJFgz80uriOiRkrj2AM8igrLkPvdIc1cJLTRCbN8SOGz2XRr4qg+aSwwKnNWwvr0aUguhKcxrnWTCBnSEDs93HHQH9rYucsMQttNeiTiTh09rnuz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6804ecd-84d2-6c2b-3172-af3a4a3b5c2a@suse.com>
Date: Fri, 21 Jan 2022 08:54:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <E1nAklO-0000wM-3M@osstest.test-lab.xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E1nAklO-0000wM-3M@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4abdb108-896e-4d7f-5e7b-08d9dcb33c53
X-MS-TrafficTypeDiagnostic: AM6PR04MB6485:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB64855000AC7ED4F3FF5E6066B35B9@AM6PR04MB6485.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FiJlDmogg/NcHF+0ttww17DNM7MOsuyrOTmdfaeN9VjQ+3DBpiKFqxSpZf86iJHcl7fAKfvDdy+hbBVdK4wAxwz4pFJobrzP/FoTFcoNYlbqJPyhcvZBA9al2g5bCQBCWV3w/fuX9z+yVRPlz9iic2pwpljTVWw5rkPBVRUXU6ovDZQjHmQmBzJmkBE+a4yhKA8Zdc1y1T42OCD0nAFE2jQcF6okJKf1e4kk1SU9FQ02Nik0Co7VlXHTworvT2x/hkh1kMwCgDM7EaQO0nIQcjN0hXiifuRNeXlFQbeG7S33aDLbrf1OM1lenzF6RKdBpT+lfR2+/SRcPJ8tEczi4SyohA+k8nm3sFNeovfQCo9wee258S2+FUQkvU8dKNicnbzdHtRULO2JIei88bcmPe8uNvhjZZ4naxGqcoTO1MMWwoD+bJZwBr3ittvjtEqns5uQVfpU3koY5+40KSf85vva/UCL6sCfCHCFoukgY1qr3L0diGX6E3U2CPmfwkIzZCZC27Vffdt20a63K9FmfT6ljwYyhnePJy5zp1U/5t4T/xi3aUKRde54z65rsgsM9k0W5UHk/qZfsG1Butat0LV/mebZjyWmHpYiTs6eZ1B5F4Iodhslb3Q8Omyr27VyPfVIGGAyld6vqVEKAuz4aCHvSfUMbf06fOcFqVX+zO4ktxV7iZRVYimSm3PXQBrLHrAkRbcV80CPj5+34UTg8ZoDvyE35b8N1KFDHw6TpqNEoHvbkI464eidc1hFDXuw+dl94WPUPP0tEOD5c69MWlj0U1VGbb3INjPK3dyKrr0J5auLupRkJdOudRovib3clCoMHgZimelHw9nsosp+5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(36756003)(86362001)(66946007)(4326008)(66476007)(66556008)(53546011)(6506007)(31696002)(38100700002)(5660300002)(966005)(2906002)(2616005)(6916009)(6486002)(31686004)(6512007)(316002)(26005)(8676002)(186003)(8936002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmVBdTd6VEVEc1hFeFpsQ09FaEdsTmh3QzBOc2NZRnVYTmN3bVVsbGxTOENY?=
 =?utf-8?B?UHRJdEZ0bndWTU4wM0tWMjBZMmUvVmRMZW1lYk8zNUdiV3FQNHRESHhmclpm?=
 =?utf-8?B?MFZxbTFVK0N0SmF3QSt5UXNsZkRuaXF4NFQ2b0pReTdlN0MyMFNRRFkwV3hJ?=
 =?utf-8?B?UllFOWxwOHlxSnFNM0tBM0g4blFFSGVaNG5ZUjB6TEY0djJlS1ZjbllxSjFF?=
 =?utf-8?B?NnlTNmR3T3ZmcjRCclZLOEpjaUNSYmtPRTNieWdKd3BxMkNyVUY3ajNZL2wx?=
 =?utf-8?B?R09qWnJ2cnJWTEVuWmZIY0cwcjlvR09FamlmQnN2NFkzN3YxY1UzMW9URDVG?=
 =?utf-8?B?N051TWM3YXRDSTBKSU5JYkxtektwNVcvdjhOTjZUZXdXMnMzay8ycS9oNCtE?=
 =?utf-8?B?RkxnQzJsM0NOUUNacFFpazVmd2ZycldBS2piSDBQVndTSXZqMnJFUHcrV0RG?=
 =?utf-8?B?bjNqd3pLaUhSOVRjakJ5a1pLRnJqT05LTjdwQ1RqbG0xMEhhd0UvZVVHWjYv?=
 =?utf-8?B?MGt3bFY3QkNzTStRNytSczdOOGZKQU9ONk1iNWFSYzcwa1dzaUN3ZHVvZzRF?=
 =?utf-8?B?MmpROVZwUEI4VklweFNBcE9HN21iZEdDdG8yWUNrSXZuZVhSc1dmRy8yMmRs?=
 =?utf-8?B?YWZOaFE0K3NyMHJRQkRqYWZmMHBxRkN1Wm0vZVJ6VEs3OVNQQ3hGTWhPUm5k?=
 =?utf-8?B?M0hLMGJqV241TXI2WUExdllkU3loWjRMejhLeHo2d242QTZtcW4xQ0NWVXc0?=
 =?utf-8?B?U0lxb1JhS0VqbVJMRkNSWWZsWEhlNmkwVkFyOHExZkt4eHkwOExvZWNZU2ky?=
 =?utf-8?B?QU5SM044Um1kRFQ3NnFOdllzbEhZS1J5eUlhTjVWUHBHWEJEMGR3b0E2ZFpP?=
 =?utf-8?B?MHdieFNaYkpZVjJyRWFRTENVR1U2aURabjluVUcwSjdvVXI3VVdoVm5tUXY2?=
 =?utf-8?B?Wm12cnQ5UzN6aGQ0WTdFaEo0NUJGOWVZekplVUltZTI5cHJUSUFldkpQRHZn?=
 =?utf-8?B?R2RZS2hRTXVEL2kzaXFVZFRUck9ZZFp1Y0F2RmtWOW9tZnZ3R2lJMG9uV2xr?=
 =?utf-8?B?bEw1Ri94bldXOVFaWU5xL0RhZ25JZlpvWTRrTk4xcGlJMEZLNHhaSlNlTnhY?=
 =?utf-8?B?ZjE4QktCWE5zRERONHpmTzBWcWFyUUFIb0VvUDBBWjZ4ZFR0dm02RG43dlNZ?=
 =?utf-8?B?TlFCb2VvcFU3TnFKVjBYOXF4YVB0c01pWTA1L2p0VzNCaTV6VWFrc3ByRVFU?=
 =?utf-8?B?N0ZjekVJR1JNRDVQWlRGZXNEalNvMmtoK3dqSm9YdWcwb2FKUkhhK2FJRld5?=
 =?utf-8?B?U3dIMnplcWZWc3V0bEs1LzFYSGJ2alVGMFp4M1lEZVlUQi9CVGlUcVRGT2t0?=
 =?utf-8?B?ZU8rL3NGQkVBcHlxV2Q0bmVGVzh6VDRYQmJuTFZxZ0sxNzBrd0drd1VSeUNo?=
 =?utf-8?B?cHdKMVNFQXhWd3BnRFpHc0JyUVVxUkdvenJsclJDTXhhS3BETXpVMnlPazAr?=
 =?utf-8?B?eEtxM0Z0eWM5cm9ud3hnTW5LMjJ2clBodWFoM2NHWTFVc25PSGpHUlhUUFFW?=
 =?utf-8?B?cDl2ci9TTFhSWGU0c0pPY1BTWTYxUjVobVNzV1JrZ2doUkJMVXROUWZhUjVa?=
 =?utf-8?B?Vm9pLzg4TnpBaTY4Q3gvLzV0cVVrbEdwaWJoYkFKb0JzMW9McUpqNkpLcmFs?=
 =?utf-8?B?d1FaUzRHVWNuNVdEWFI4aklpdWRuQXJQK09vYkdMUDhmOUREaURvbFNrRGkx?=
 =?utf-8?B?a0ZxM214S0hmdllkQXJBdFFVYkFEZG10T25RZjVnVER3Rnp4dEE1SjZiT0xj?=
 =?utf-8?B?L2hCR050OEUzRTZHbjNYL1JjV1MxSkQzRWxSUCtibUVTUytPeHhUbjFtZkhS?=
 =?utf-8?B?bjdKVHBmNFgvMTlpcndvREFvcXNiemUvTDNscTA5TjZlUzN4ZFRiNmFxYWN1?=
 =?utf-8?B?MVBhZ3ZkY3d1SlB2QzU4Y2FUYlZnb0VlanI3VGt3WjYrdVlNdlVtYzdjRzZK?=
 =?utf-8?B?RUNFbnErTXdNcFR4WDdyUjdCbHJvUlJKZUFaUlJ5bm9qUmJUSThRNkVKV0RW?=
 =?utf-8?B?SGE0SXQ3SzJBcWJXazZ2WG8rYkE1eWhMNFJ2N0plUGFrVGZVN2FNK0YyU1Mz?=
 =?utf-8?B?MDNpa3h0TERJZW42cERhNzEzam4yS2NVV0VKdTVJWUppZ01xc1Izd0hKUXpw?=
 =?utf-8?Q?dMe1vx84L+PNwS6fabfGtjo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abdb108-896e-4d7f-5e7b-08d9dcb33c53
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:54:22.0648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LybI9M2G0WR+2xrdNNGCtzuAMMUhR8ttT2EqMky/j+tz8vbGjhhTJynC+8SVxf+l522VTIbN+fBArukeoz/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6485

On 21.01.2022 04:38, osstest service owner wrote:
> branch xen-unstable-smoke
> xenbranch xen-unstable-smoke
> job build-amd64
> testid xen-build
> 
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  6536688439dbca1d08fd6db5be29c39e3917fb2f
>   Bug not present: 88d3ff7ab15da277a85b39735797293fb541c718
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167778/
> 
> 
>   commit 6536688439dbca1d08fd6db5be29c39e3917fb2f
>   Author: Andrew Cooper <andrew.cooper3@citrix.com>
>   Date:   Wed Jan 12 13:52:47 2022 +0000
>   
>       x86/msr: Split MSR_SPEC_CTRL handling
>       
>       In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
>       MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
>       
>       Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
>       The SVM path is currently unreachable because of the CPUID policy.
>       
>       No functional change.
>       
>       Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>       Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hmm, looks like you decided to drop the inline stubs, yet now in the
shim build we get

msr.c: In function 'guest_rdmsr':
msr.c:431:16: error: implicit declaration of function 'hvm_get_reg'; did you mean 'pv_get_reg'? [-Werror=implicit-function-declaration]
         *val = hvm_get_reg(v, msr);
                ^~~~~~~~~~~
                pv_get_reg
msr.c:431:16: error: nested extern declaration of 'hvm_get_reg' [-Werror=nested-externs]
msr.c: In function 'guest_wrmsr':
msr.c:675:9: error: implicit declaration of function 'hvm_set_reg'; did you mean 'pv_set_reg'? [-Werror=implicit-function-declaration]
         hvm_set_reg(v, msr, val);
         ^~~~~~~~~~~
         pv_set_reg
msr.c:675:9: error: nested extern declaration of 'hvm_set_reg' [-Werror=nested-externs]
cc1: all warnings being treated as errors

Jan


