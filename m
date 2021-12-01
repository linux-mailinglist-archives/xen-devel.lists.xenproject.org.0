Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C0464980
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235646.408758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKqm-0002TA-D9; Wed, 01 Dec 2021 08:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235646.408758; Wed, 01 Dec 2021 08:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKqm-0002QL-9Z; Wed, 01 Dec 2021 08:20:24 +0000
Received: by outflank-mailman (input) for mailman id 235646;
 Wed, 01 Dec 2021 08:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msKqk-0002QF-Iz
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:20:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8626caf5-527f-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 09:20:21 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-WdHZ0cu4OnymedHa8VfZkg-1; Wed, 01 Dec 2021 09:20:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 08:20:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:20:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 08:20:17 +0000
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
X-Inumbo-ID: 8626caf5-527f-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638346820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H317x/T4Cc0g5g3uVWK8laNIQpUCohRc7S+MiQ6t0H0=;
	b=JiAs5Gy/XI52a3hcohpwjU1BdALTf8pCRHikKer/pcrSeOdDMwvrL0qTOG+fgGc9EtGyDO
	YWFATPVGTHN3azNV2nRaNqpWL9WHoiMkQdn5YpCGVfQV8KX4u1vjWx84jZat/1GXNARTXL
	Aiwzpw2GlWtdV2aoZQdso9OmX2yUwUY=
X-MC-Unique: WdHZ0cu4OnymedHa8VfZkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkFKdRV+b5t0e/+wtbvX1jnlysqSOtGtR9qIiaQlfkKTy3xCXw+9yfuEulEWhOo/MS+KsYHLA1IF3iFkLL3z9II7lYLJsDTEEIgfQ5tSKNdkwa2rxTcIaXzu8bKtrEItO9MTj8aXQcUrI0sMl+MkluXWGAh61Z4MI4bDSMTgqmnY360lEqICHDcHI80vYtKmG7EnSWmWJ2jaA8cCR0NbpTtzFsy/f9PiXE+ISytiHg3Re+I2F5UEU4uyesPhaBY9/DvmTWEcU5VkOy5Pc43Sd0GvkReDf+FiSy0KNLlYisC/7pVdOmWrbaurQlfMNxZkSwO3ONo+6D97vrKCo1qwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H317x/T4Cc0g5g3uVWK8laNIQpUCohRc7S+MiQ6t0H0=;
 b=NHYjnUUoD1WsTMxAGNzI70D0yOkDb+KnzusZQmcmqnNoh0sn3PXOR9h2ky3HYbe565/gZbmbGaajUcsJfXyu3QAqngxziqTXMe76A9i4xe67Z541NlqhWoOZldPSiX6XV1p4zldOo9IRpyZ9NcZCDeM30G7kXyfx6kihOxRpxpowx+hawOXzdW33NVWBCjZnl01UTc9oA8NOp976oNGojF4FEYupysJD42TtP6Uq6nPDatIkP7nV5BcxiqJxgO/rhRcj02UmV1d2IalTaTV4kfsFJba6YvnRKdhEExZgLLFmpc4sX1clHFx1qvzvn/NWebMVw2zDfsFu6qHtN+kSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ca82514-2adf-2445-04d1-0020dde16019@suse.com>
Date: Wed, 1 Dec 2021 09:20:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] x86/altcall: Optimise away endbr64 instruction where
 possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126212258.7550-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5502ca59-693e-44a5-c6f8-08d9b4a368cf
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63023F979067FE93457A420DB3689@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pTSXvS9GJvdpWxHT4o1bVUcWWmLeJMuRNWHtDp0nOqrGrlgDtR+Bh1a2CKn5S031zuByuIoZjhPtPycyUfiDp5cUVg1bgWI0+Tu6QPWOW07y3g9ydYsAIeZ5xGzqscICgbzSrDBHdeTBLZ4OX46raF+IQOHIuvAhJqFqT77s+4vQo0Z/G0QQz2uBiCxHRqQpMzIbqJBMXRw8O8bO7BYlIIpkaAVtGInWvDRBxWuzbuqT3PEk5aHNjICwBh60k/6uSGGA4VibRBAIBgk8YlS3CD/Pk9tNigyJ/drY3RLwM5Gmx4ovRRf9ahRaqZxK6YiW5/PIN05U6aDlSnE+iD4fj8OAWmZqI3OKNAmHcX4mOskyb6uxN4CSjcTU09q4veEl4aJUp60a6SNkKCoydberU7P+r3j9P1fkrclMAUvZOv5oYz2ggO8SLqIEsL/4LAMGJIHhi4gQs9uYRPYqY1U0Zao3LZc41Bj4+Ls7DvNKec1dp0AC97QFXtznhqabRPvw1tcuGA9Xy/Umaya6eKgmcBDJdLuM5FvP1ZL+VqXc0azimCRX+lEKDf7dCIs7z7aJTj9m3HyCta5uh6aJ9G9JkrMy29wV1HiEmvTov/xQuHl5czUzh5v0lV6kYL1EWmaDwlzoeyYdJvbS4KBjSQSKCSbQ3WuKXA4JbS+1vKu+iBbX8qH0GF4Kf5O77gRN/8K27AWOjC7rmK1j6zJiSGCDkBT6x9T6ivyuSIT8LRle33c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(54906003)(6486002)(66476007)(186003)(6916009)(83380400001)(31696002)(8676002)(2616005)(956004)(2906002)(8936002)(5660300002)(16576012)(31686004)(38100700002)(26005)(86362001)(316002)(508600001)(53546011)(66556008)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmViSTlYTVZ5L3I1aW9waFhKTnFpY1A4cDlSTkI4VkU2ODloQkk1dFVOWkZC?=
 =?utf-8?B?U2kvUGNLLzJSbmNBYmNwUzRoUXpnRWFJSFlLOEt6OEF5V1lLUVNuTEdXR3Iv?=
 =?utf-8?B?d3J3OE5SOTF0M29xamx6bUVLOFdYbzRRVFBPOXFCZVZQTEZLNStqZlFDUWln?=
 =?utf-8?B?NVRwZ0NRZG9TbE9CQ1RUVkZmT3JZczJrVmlUZmtSVEh0eUMwZ2JDeW1NOHpZ?=
 =?utf-8?B?S2dSbFczM3RpMkV6VDgzUjNwSHJHVFBnRTJNR3FBNEoxcXRtWW1kbkRMcmlZ?=
 =?utf-8?B?SVM3ZTNRSHRHbjFiS3RXMUJTYUxVNWk1VC95TzN5VHRSd3NWZFUyZG44eURr?=
 =?utf-8?B?Z1liMXhqeXpjQnlQQnFMK0FmU1d5Y1U5SWZBLysxNlRjT1ROR0E4cld4T2xi?=
 =?utf-8?B?T2hvaTUvM3VsV3d6T3pkVlpEZjRGUWFDVVdxVERzMFpLN2NEbFBod0hHOWp4?=
 =?utf-8?B?OXd0cVdFSjFxcjdKekJZSG1EeXNvbFhVMjg1VlJEUURPMTdWS1EycTZ0S1hq?=
 =?utf-8?B?cGFkTmVMVjJydWlyZTBaSjZ2QWh1ZjVZS2xWeFNxVTZDSWI1M2lmR1o2a2Z2?=
 =?utf-8?B?NXRlZy9IUmdXbjl5MDR2ZkJ5eGUzY0xJRllpQ3Y5cVZaSG5qSzZDb0N3KzJw?=
 =?utf-8?B?WDFwQndhcS9CRE9vazF2ck5IWFdIL0Z3clJheHVSOWZVb3JjMXA5RzVVU1hQ?=
 =?utf-8?B?OTFUdEwyWW04N1BwT1I4THRZcWs1Q2Z4RHJwZUN2SXFyK3IzL295dkI4OGx1?=
 =?utf-8?B?YlIyQnVkOHNFZUlZbDhnQkRuSjU4djYvenpvRml0OGNoek5ibU5BRUhQaEZO?=
 =?utf-8?B?cWtoZWlHaW5OZzZnUC9vZk02bk1ITzBPdWp5ZTZieTBtL04zSFhFdnBIMFFl?=
 =?utf-8?B?RUNXUzRORkNJcXVUb0hxY0JYSXpaYnlidXFham9xSUs5Ujd3bG9CSlpGUHpT?=
 =?utf-8?B?RW9JWTBiU0FGaHdmNFVsQXFvTXc1bGRLZ1NQZ1N0em11ekpPU2IrZnNxZ2Jt?=
 =?utf-8?B?NTFUeU1QZEx2R2NJaElORTZOUjFiVnp6aVRoR1hWU3g1OUVzWTloZEpJMDN4?=
 =?utf-8?B?dy9HQnE4WVloTVZYTWYwOENETjJHUWpTU0k1VVhGcGVnTFBxNHBrZklyTzc5?=
 =?utf-8?B?ZXk5cm54c3R6YjNqeHZVN1hSMGd0cFdkbXhoYnI5cVpCQlJvU0xMTkVBVjZ3?=
 =?utf-8?B?R0hkRGVkZXV6VDZGTXJlNzVBUnNoUDY1ZmRQYjd1dk96WGtZZ3BEUW9JcFVo?=
 =?utf-8?B?RWlKRldqQmJ5U2dDMnlMNjFxdXNmNWl3UyttNzM2ZVFOcnZqRXdodEdFeU9M?=
 =?utf-8?B?b1FmaXM3NTZkT0VBNTJFTmcvTUdjZk43QW4wUEtsdXB5MlJQWjU3V3lyL3h0?=
 =?utf-8?B?eHZZSUYzR0RLakFwRGlnT3VDTUNLbTEvUFdKVjM4eFg4c3hrYU45WlgyMUhV?=
 =?utf-8?B?dUsrKzRyY2ZGb21KeUxQQjZ2SzFzT3dNWlBFUDJKRXdSLzBZRDhVVU5Vc1kv?=
 =?utf-8?B?MVphMWJFSVAxSTIxNC9QdUdSS3A2M2lLdnMyY3lXRjVJZ2JqZnd4aTZyVkIr?=
 =?utf-8?B?bzV6OEg1TkMyWVhyVU1ITEZDdHd2NHNUcDRHUFZFYm8wYkFiYWF4SndlRzF0?=
 =?utf-8?B?ZDVMbysvNzNxOTF5K1B1Z2VQYXBnaDRvbWxhZHI2Skl1S1AxVU9ZTlJTd3FD?=
 =?utf-8?B?aE1vUTVHY0FjVzJWUk55MzVna013YjZTWkVoM0RSSFZtbTdqRlBMWUFxaUlm?=
 =?utf-8?B?S2ZVU0JodW9EaGdqazlCbU43SnRLTVFCdTBtL1piNUFKUnRlSU1rbGZSczAz?=
 =?utf-8?B?NDZnY1RDd0sreEJKT3Y4Y0YxZGhUTmppNjdSVzlqVkpaaG0yTlF3QW4wY1Zz?=
 =?utf-8?B?MzJaK2prMUFpS25BZGlnZUFMbDVWMU5YSTNCb0FuTmlUTVJUTWhYTmZHRE45?=
 =?utf-8?B?T3JzUEZpM0VrQzRXTnZ2dHZuc0s1eFdBU0hYQjA2YUU1eUVKU3JzVUJ4Zzdq?=
 =?utf-8?B?QXYwYWl6NVozVXdqWGVSZEN1QWRMWWJ5eWlIeExpL3JKSmpLZHJZK1NVM1My?=
 =?utf-8?B?MUxlNnh0bCsrd1NIRk82V0xzUFVuYSs0NEw0c0M3dXJhVFhzTTByV1p0Vk9z?=
 =?utf-8?B?bVg5eFBIVHI4bklHYjNvTTZQelBBT244Y0F4MnJjNzhXcHBBK2hSaENIT0tR?=
 =?utf-8?Q?4ToSRM/OFpM1i7mkdVsBR0Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5502ca59-693e-44a5-c6f8-08d9b4a368cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:20:18.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZJWjYHl1ufKg/kCc53I6AdFCVhlPHg/eGYSChLGCMaUy3aCAs54nELgN1ttf+whURmlAD+AjtQSZyfml45/5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 26.11.2021 22:22, Andrew Cooper wrote:
> With altcall, we convert indirect branches into direct ones.  With that
> complete, none of the potential targets need an endbr64 instruction.

Assuming that no other hooks remain which re-use the same function. I
think this constraint wants at least mentioning explicitly.

> Furthermore, removing the endbr64 instructions is a security defence-in-depth
> improvement, because it limits the options available to an attacker who has
> managed to hijack a function pointer.
> 
> Introduce a new .init.data.cf_clobber section.  Have _apply_alternatives()
> walk over the entire section, looking for any pointers into .text, and clobber
> an endbr64 instruction if found.  This is some minor structure (ab)use but it
> works alarmingly well.

Iirc you've said more than once that non-function-pointer data in
those structures is fine; I'm not convinced. What if a sequence of
sub-pointer-size fields has a value looking like a pointer into
.text? This may not be very likely, but would result in corruption
that may be hard to associate with anything. Of course, with the
is_endbr64() check and with a build time check of there not being
any stray ENDBR64 patterns in .text, that issue would disappear.
But we aren't quite there yet.

> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -173,6 +173,9 @@ text_poke(void *addr, const void *opcode, size_t len)
>      return memcpy(addr, opcode, len);
>  }
>  
> +extern unsigned long __initdata_cf_clobber_start[];
> +extern unsigned long __initdata_cf_clobber_end[];

const please. I also would find it quite a bit better if these
were suitably typed such that ...

> @@ -329,6 +332,41 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>          text_poke(orig, buf, total_len);
>      }
> +
> +    /*
> +     * Clobber endbr64 instructions now that altcall has finished optimised
> +     * all indirect branches to direct ones.
> +     */
> +    if ( force && cpu_has_xen_ibt )
> +    {
> +        unsigned long *val;
> +        unsigned int clobbered = 0;
> +
> +        /*
> +         * This is some minor structure (ab)use.  We walk the entire contents
> +         * of .init.data.cf_clobber as if it were an array of pointers.
> +         *
> +         * If the pointer points into .text, and has an endbr64 instruction,
> +         * nop out the endbr64.  This causes the pointer to no longer be a
> +         * legal indirect branch target under CET-IBT.  This is a
> +         * defence-in-depth measure, to reduce the options available to an
> +         * adversary who has managed to hijack a function pointer.
> +         */
> +        for ( val = __initdata_cf_clobber_start;
> +              val < __initdata_cf_clobber_end;
> +              val++ )
> +        {
> +            void *ptr = (void *)*val;

... no cast was needed here.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -214,6 +214,11 @@ SECTIONS
>         *(.initcall1.init)
>         __initcall_end = .;
>  
> +       . = ALIGN(POINTER_ALIGN);
> +        __initdata_cf_clobber_start = .;
> +	*(.init.data.cf_clobber)

Nit: hard tab slipped in here.

> --- a/xen/include/xen/init.h
> +++ b/xen/include/xen/init.h
> @@ -18,6 +18,8 @@
>  #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
>  #define __exit_call       __used_section(".exitcall.exit")
>  
> +#define __initdata_cf_clobber __section(".init.data.cf_clobber")

Just to repeat what I've said elsewhere: I think we want a const
version of this as well.

Jan


