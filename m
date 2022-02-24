Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282434C3106
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278451.475708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGi4-0001mF-E9; Thu, 24 Feb 2022 16:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278451.475708; Thu, 24 Feb 2022 16:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGi4-0001kE-AK; Thu, 24 Feb 2022 16:11:16 +0000
Received: by outflank-mailman (input) for mailman id 278451;
 Thu, 24 Feb 2022 16:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNGi3-0001k8-Hc
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:11:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63971f72-958c-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 17:11:14 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-VZb2S2PqOaWZHsZMRFk3xA-1; Thu, 24 Feb 2022 17:11:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB7009.eurprd04.prod.outlook.com (2603:10a6:208:19b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 16:11:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 16:11:07 +0000
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
X-Inumbo-ID: 63971f72-958c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645719074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DbGOzmSn+1hs/xlf3H8j1wvPbL6MWHAaVHEbBRxUdn0=;
	b=ZeGU5JuN5N0t+WSBAbVTkPBO4APCS19mokrawOnM87/RRn0rU/YJ8t9A4f33uofV9/bxMp
	zLgPnaLmFF/1uVSaCrza+u1K8G5s7D9oX1jMe6jDRCbpW5w8nwsOLp3L0AuuYk/38nR7kz
	6c/ApYh3HVVp7n3Ik8PeJFD+6YxuQ+s=
X-MC-Unique: VZb2S2PqOaWZHsZMRFk3xA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gklaYfKXougR3U17BnOJl5tQo04d8wp1n1W0UD8OxYUlI5KF1hUKgtxY/RI6jxmBvT/JvWlJ+jpjiA5LtYG264541Pz8aUVEcVI2GrOUG0msUAvt7bh+YOaGdnt7hu0yIILU7IIKsh7ZioBR7+pl3uN/lVoPgym9FDmJTuOUxHHsnqYrdVLAqJmDuAyHNaT3dSGkJfRY33V2TAYfWDlkYYkOnbkkrhVRHoiXVVZY54E5mns+HvoLOOL0zrfg6zTrfkUgLQRj/8WH0fwb1rim25HWj+R+6kYWIkHqJBkCAS03YpO0jLWlExRhvYlZ2388S73k9UkrXHHNKVppSyaBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbGOzmSn+1hs/xlf3H8j1wvPbL6MWHAaVHEbBRxUdn0=;
 b=R2Q325Ii6lpCXnGWZITP1NPgpoY9TdSV7KPA5Zi1qPkNx7lb4AjmjdMSGrUlGoVcENVVjx/J5U5vTx5kjng2Yiap9ek/DkelvpP2UF9CtRqGckUztGOxB9csbdhTeHAgVTgrfw6g2OMs3ERdwRdyIBn3dHyPh7skthRJpnaH5ZwuDC/3zrGH5JK5/z8jnTx2NfZxU44kXCFjrI3a2FZAQSjILXT3e7jOGfx502n+dlHki2oPw5hA/PCMWw23SynJlDdz4q2XV9+P2Zlhtgf47VARu2Mqe/StoBbnjqFCWgwilE1mIwHAlUh9U0XM3BRZycpATc3D7erHzDx5KrwnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
Date: Thu, 24 Feb 2022 17:11:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224105436.1480-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cefad1f4-8362-4320-b51f-08d9f7b04390
X-MS-TrafficTypeDiagnostic: AM0PR04MB7009:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB70098185D83BC8A68666783FB33D9@AM0PR04MB7009.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nlG6zNZe/AGAidw//G9XBSBoCLxA2SVEeywMjWFGcnqVNJxcOK2QQ7O/gwAzZnuklpAXby1m0Ffiw0AyXpT0HoRn40nce8lqANdoUXFTtaFYfpknw0Fqs6xjzdYnQvxs+UPx6krtT6o7iTThlh4KjnScaeGIwqS7FwnT09dwrkuX8tCvBy2Mhv0MS3n+9R9ZVOrEO+fs/+nU2yEC1n3/5o6fX78ABNm0Z+woiOayWXOIi3KW4ZO5WVFyUqxbXFdCIda3nxQx90+7JjDwHBvb5lCqpke+2N9ff1p5NmogU834tEE2i9fnnz21EHhO5K/16E8bHram9mUawtijlii3TBjhLay+oYjptobA5paqY/qrVKsJgrQ5RHXpRn8OhlRlZa6LOBcpmDH2osJ1zTOKmypIvATyYu6TSUmaGovR/mcq87liEiBHhzdp8XzdIuToY1P+d9eqDcBIgRU7URMJuzlT/ueSaro5vl5ZxVTBp5TkCss7LfmAZjBZuFhTDTzKkYP03QufkjaP8HQ/mwJLxFHktKITS3LQbXlXCse8Gt9kRbX9Zc3lGCf62Ud2w10q8Q5V50p+m5fR5++7mh9Yu7GY/nTnPnNvpGNzODsVjmDfVNLlN9qA4Ig5l+7ZLZV7wi+afyDDsClHJDK+3uTa6xl+VXWSrxB2czFKRg0Lfuayw8LXwPpZy1kOgOpV1KOQN4L5cztAfW0KYWSJS8+JQObyoQ+pS1PH3aEmK3/ssSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(26005)(2616005)(53546011)(186003)(6506007)(6512007)(36756003)(5660300002)(54906003)(316002)(31696002)(6636002)(37006003)(86362001)(66476007)(66946007)(4326008)(508600001)(6862004)(2906002)(38100700002)(31686004)(8936002)(66556008)(8676002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zks4azQ0N1czZGlqdXN3bDQ4Vjc3eWJIRkx2TFNKOU9Gd1FtN2FiZVU5aFhF?=
 =?utf-8?B?WkFyanBPRXRVd3hjbkpaaVpvQnBkc0V1UUk2ZS94UElyQSt3aFMzbzdadlFt?=
 =?utf-8?B?Umd0c2ZTem1EYWVSdVluYzgyL09wYW1aNnZha21iaDRNZURnbzVxcmhUL2g2?=
 =?utf-8?B?bGRZdS83aGVNY1JQTWFKNkQwSno4TkgvaHJkaEJqUmluT3p4ZTNuM21EaTVG?=
 =?utf-8?B?VlZsZWd3aVV2QW4zSmw2dldwVkRFZXp2b0dMcFJibTROUkNhWjlIZEdVUWFM?=
 =?utf-8?B?TFF0TEQraUF1QVpKOHVFRk5qVHhrMHZrY0xNQ2pKNTRrQitzTTA5dXAwMWhW?=
 =?utf-8?B?OFpSV0w2UTlIbjBrVnhUTFVlRVRzTC9zZmdMcERGM3lSR29GOE1qeDI0Mmxw?=
 =?utf-8?B?c29uUnVVV1VrSGMvSzZhdFBaSWptYmp3Z0JRMTNIZzEvb2lpNXFrTnZsUTY2?=
 =?utf-8?B?L2tJZnBreDU2Q2wvTnFQaFNKK3FvUGxzdTc0dC93ajIydUx2anV4RXJ4Q3Vn?=
 =?utf-8?B?NW8vREVQRzNmSGIzMHdmRE5KSUkyRTJJTDFnNFRwY0M0aXdONXB0aWJjTi8r?=
 =?utf-8?B?dVNZayt2TTNyY01TQUJRbFFyTGViTWZzbjczUVNaNUNYV2NHNmhFZlpyNEQy?=
 =?utf-8?B?V043dUJ1aU52NmJ0dUF2V2N3QWVyakVlclNpZXI2M3p0bitoNUlja0JMVFNM?=
 =?utf-8?B?OUZEWWpJQW81N1pONVNxK2EvM0xjTmQyVDdUYWhSWldWL1czUForZVpLNXYw?=
 =?utf-8?B?SjRSWkpjcm02cEdYQWNOMEFPUFZWOHVtKzFHSGM4UGlhdVNwTGxYMVl4SmZX?=
 =?utf-8?B?THJPYlo0L2tMaDExR1g0MFpQbHU3WGVONVlNYWZDSllIbGp1NGFzWFRRemR3?=
 =?utf-8?B?ZWtWTkZlVGd2N1gwbUV6U0p6dm5ESnJtdCtZV0lBWStBeEVpb2J3WXVvVXh1?=
 =?utf-8?B?bERzVGpxUFgwSWZFbTNJb3N1M1ZyVXhzQkN0OERNcDcveEpRbFhyQktFd0tn?=
 =?utf-8?B?T1dvYmduK1JIUTlTUHJEcWdSS21YZzk0VUluRm5RQzI4SHVMYytra1lQQWtu?=
 =?utf-8?B?WjQwNGdyWVBwOWluZnI5SzAyQ1U1SWtYRzg0QmxvUHQxOFFWRE56REloME9V?=
 =?utf-8?B?L1FvUjh2YjJGOGY3ZTFKYkVoZ1NYbkJVV09xMmxvZFpRSS96cEdUVHBJQlFn?=
 =?utf-8?B?VXZ6dm14dXZTQ2FoaGs4VWFyMldFbUZ2SVFwdWlKR3N3WTJSUThVZ2hyNHpK?=
 =?utf-8?B?cE5Jd29kTFZOc1FIbHRHd3ZZZ054OWsxMVJJd3ltL2VXYnBJRHVIZUxtS3Bz?=
 =?utf-8?B?Q1ZLRy9tOHNZblFaTHl6U2RNS3VIK09Sa0ExZEsxdngxc1d6dHpXR1pRRnNG?=
 =?utf-8?B?MWdNWWVLcXdTa0tabnM0a0RCTUYxTkl0K2xkV09Kb1JLYi9wcHFnN1g2dVdN?=
 =?utf-8?B?V0NhaVBwdldaVHc2bXExUUhTN1NQMk4zTXBiNURaZXlNdS9tR01GMEczM2ov?=
 =?utf-8?B?NFZHVDRWZUtOdjJMNUh2djRwVTJmOEFFUy9TTkViR2VwdE10WElvZG40Sml1?=
 =?utf-8?B?bDR2dU1YeGFqbHVLczdVUXN2MlBlZm5Hc2xCVjZUaDN0VUlQbk5LOU1jeTFI?=
 =?utf-8?B?TUdxTVQyekFqcHdXZmdNZHluOThDYzYzdTZOcDV3ZEdEYjI1bS9KenhBdEFG?=
 =?utf-8?B?bWlMb0JUUTZPMDFMUk5ROTNpWmk5Sy82c1JGTUVqTDZ2MkIyRll1VEJkRXZX?=
 =?utf-8?B?Mklkc2pIZ3c0UDgxMnVqWmh1UmZ3ck1vTTFvek1GR2J6RDcxZTBCa004am4y?=
 =?utf-8?B?RnlVQVY2djdwMVVockhHMmJVMDJxNTkrV0pqMmNGdnUrS2ZoWlc1djVXdVky?=
 =?utf-8?B?ckk1Vmhjd3NwSVVBcWk4SUdZc0FvMkE2YStLRS9RRmNIL3pyd1lGOGNIR3Rv?=
 =?utf-8?B?eWJGMVkwSFgwVjRaWkE2OHN0N0NsTGNPejFHSTVxNVB0Rmt1eU84YkVhaUlY?=
 =?utf-8?B?TUJYVkNKNlA3TzFHUDkwT3YzWStLSDBwblFPTjF4Z2g3dkRzUlBWWGViLzJY?=
 =?utf-8?B?cnZjV3NEUnRpb053akQzQkFOOHpWVnJBTG15N3FSdlVMaGxyNFRTNkVPeTFk?=
 =?utf-8?B?QTV2cVRYV1NjU3NBaU90S3hGbG5WUWhRL2s5LzhrcmJZRXMyQkMvUlZuRUdn?=
 =?utf-8?Q?ejnUQY1DULk4XWsc91/QU3M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefad1f4-8362-4320-b51f-08d9f7b04390
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:11:07.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0zrQX0BnjQNBULQDVXii8W5DgpbRklKzz1BzlT5o2vXifOdIgWMQAkqaT6856vCd5PHXqihSV8k3f7XRWU3PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7009

On 24.02.2022 11:54, Juergen Gross wrote:
> --- a/xen/arch/x86/mm/mm-locks.h
> +++ b/xen/arch/x86/mm/mm-locks.h
> @@ -42,7 +42,7 @@ static inline void mm_lock_init(mm_lock_t *l)
>  
>  static inline bool mm_locked_by_me(const mm_lock_t *l)
>  {
> -    return (l->lock.recurse_cpu == current->processor);
> +    return (l->lock.data.cpu == current->processor);
>  }

I see a fair risk with this: Behavior will now differ between debug and
non-debug builds. E.g. a livelock because of trying to acquire the same
lock again would not be noticed in a debug build if the acquire is
conditional upon this function's return value. I think this is the main
reason behind having two separate field, despite the apparent redundancy.

Nevertheless a few more comments in case I'm missing something.

> @@ -81,19 +79,19 @@ static void check_barrier(spinlock_t *lock)
>       * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
>       * is clearly wrong, for the same reason outlined in check_lock() above.
>       */
> -    BUG_ON(!local_irq_is_enabled() && !lock->debug.irq_safe);
> +    BUG_ON(!local_irq_is_enabled() && !lock->data.irq_safe);
>  }
>  
>  static void got_lock(spinlock_t *lock)
>  {
> -    lock->debug.cpu = smp_processor_id();
> +    lock->data.cpu = smp_processor_id();

This assignment breaks ...

> @@ -230,9 +228,9 @@ int _spin_is_locked(spinlock_t *lock)
>       * "false" here, making this function suitable only for use in
>       * ASSERT()s and alike.
>       */
> -    return lock->recurse_cpu == SPINLOCK_NO_CPU
> +    return lock->data.cpu == SPINLOCK_NO_CPU

... the use of this field to distinguish recursively locked locks
from "simple" ones. At the very least the comment needs updating,
but ...

>             ? lock->tickets.head != lock->tickets.tail

... in how far this is still a sensible check in debug builds is
also questionable. The effect here certainly also deserves pointing
out in the description.

> -           : lock->recurse_cpu == smp_processor_id();
> +           : lock->data.cpu == smp_processor_id();
>  }
>  
>  int _spin_trylock(spinlock_t *lock)
> @@ -296,22 +294,24 @@ int _spin_trylock_recursive(spinlock_t *lock)
>  {
>      unsigned int cpu = smp_processor_id();
>  
> -    /* Don't allow overflow of recurse_cpu field. */
> +    /* Don't allow overflow of cpu field. */
>      BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
>      BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
>  
>      check_lock(lock, true);
>  
> -    if ( likely(lock->recurse_cpu != cpu) )
> +    if ( likely(lock->data.cpu != cpu) )
>      {
>          if ( !spin_trylock(lock) )
>              return 0;
> -        lock->recurse_cpu = cpu;
> +#ifndef CONFIG_DEBUG_LOCKS
> +        lock->data.cpu = cpu;
> +#endif

Maybe worth an ASSERT() in the #else case (and elsewhere as applicable)?

> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -6,26 +6,34 @@
>  #include <asm/spinlock.h>
>  #include <asm/types.h>
>  
> -#define SPINLOCK_CPU_BITS  12
> +#define SPINLOCK_CPU_BITS      12
> +#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
> +#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
> +#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
> +#define SPINLOCK_PAD_BITS      (30 - SPINLOCK_CPU_BITS - SPINLOCK_RECURSE_BITS)
>  
> -#ifdef CONFIG_DEBUG_LOCKS
> -union lock_debug {
> -    uint16_t val;
> -#define LOCK_DEBUG_INITVAL 0xffff
> +typedef union {
> +    u32 val;
>      struct {
> -        uint16_t cpu:SPINLOCK_CPU_BITS;
> -#define LOCK_DEBUG_PAD_BITS (14 - SPINLOCK_CPU_BITS)
> -        uint16_t :LOCK_DEBUG_PAD_BITS;
> +        u32 cpu:SPINLOCK_CPU_BITS;
> +        u32 recurse_cnt:SPINLOCK_RECURSE_BITS;
> +        u32 pad:SPINLOCK_PAD_BITS;
> +#ifdef CONFIG_DEBUG_LOCKS
>          bool irq_safe:1;
>          bool unseen:1;
> +#define SPINLOCK_DEBUG_INITVAL 0xc0000000
> +#else
> +        u32 debug_pad:2;

Prior to your change we had two well-formed uint16_t. You replace them by
five new instances of the being-phased-out u32?

Also - do the two padding fields really need names?

Jan


