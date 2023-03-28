Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06AD6CBC9F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515640.798721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6hZ-0000CB-U2; Tue, 28 Mar 2023 10:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515640.798721; Tue, 28 Mar 2023 10:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6hZ-00008r-QU; Tue, 28 Mar 2023 10:37:17 +0000
Received: by outflank-mailman (input) for mailman id 515640;
 Tue, 28 Mar 2023 10:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph6hY-00008l-Al
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:37:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81868380-cd54-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:37:15 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB8PR04MB7017.eurprd04.prod.outlook.com (2603:10a6:10:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 10:37:14 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 10:37:14 +0000
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
X-Inumbo-ID: 81868380-cd54-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meESlKgkTSyNeuCJGZ335sg2W8Vsza3CIpAZjDge56F/opSBwWMiJ5ztDhZ5ksWtv4tsYfmmcrY6hfW5EMTlAM/ShXiEVw/d6qXK/j49jUuvWov2gfH2zpcYWBltLVncBh22R+DPOZ+MoSDSytL1r0RhBOC7I30VLQ0903D1DmgZdfYyLZf8varuSDINUC2wMXVI8cFR6c2Snt/qoGZwp9nySOq/rTo1Q+tINsGKKdfMf6+weFVVoZzYz28gg+ykfyeArpVN+OXBG7iYs01poZA8V8M2NX2VgoRWmYwpa4ctIIx4xdkjnTxouxioJtH7q9JUZaQw2UmqQ3pl7BvSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbCZuIqNlPg+SwxFcp0FIazRUetdLwA6oZtyUR36JnM=;
 b=Gb1YTzLVcry66CR16WPyL+RaaFbjOZXJGSpawf7vSSwhAy2wzn2cWmKDEa3RABupOZFayuRWMfPSaYCYW1SqP5rd9TT9IzEKakuvpzWSxxSRuRr+FS7OXEa+1Xnt/x8iSGW3LGC01r/NNysrBmvzLJDPuX1XEAFVMvSK4tUKWCwLXSKeoMHjxjQOPGpve1TPX+fAo9Gy5TMZr+NaivA7yB1Q4nXXe3xInTnh6ofdgFffwUaaPaAlpm1jmur5Xl9+A8QWX+24y8LKYweUJ63gf6KGUVJIkWpTvyzp6peBrhbuEZoSwZmpElqvcWClvVToKr59jf874Mq3XkcPpF/Giw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbCZuIqNlPg+SwxFcp0FIazRUetdLwA6oZtyUR36JnM=;
 b=VhYqhDlJGnrC/5FeNpwSjyh5w7JxW7EWyvuGbEmyRAbnGP2xqcIQvmFZ/On/Anc9UU0d6dd8s7oKR4IqXmBin093rab5JVckwsmEPnA2spDaSYYBN3m8kPco2hhZBO8iyUV+zxoL1bRUxsSRGDEuevjAb4pwzBuIbmuWEVX7YWA/5DJt4WSnPN7G9kbjapvfheI+fGI9KAJLz8MuE0aWhEnFszQEEihaUoYLpwxkmGKOLtT6qzfNzTOE8XL08tYy4AKxn1Ve0CUgQmIMBdLNH07rUKGBwwyVpOmSHx+o3tZm639GzbMWmEPqUaMNb3+HvoHKK2AqvJkxJrYCA+GARw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <324a10c7-92f6-d636-ee3b-da9858399d34@suse.com>
Date: Tue, 28 Mar 2023 12:37:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/16] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Content-Language: en-US
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
 <20230327153922.GA96023@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230327153922.GA96023@deinos.phlegethon.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB8PR04MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: cf970407-54b0-483e-a34f-08db2f7864f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tq1LzTvDTuHF71uQ5kug1lgHaHtl3l2ysj5ALbjvV4NHcIntNissc8VcYLyI+cMy/PaF7ljFzPOd6FAr7aIrr1WXkqt0TPUjo1KKcYsHLon+oYCz6lCbIIJtqXAz2n5vWmjDfSpQ572ASmNtz990z0/ZephBMWSoB79DjBH2fr2CS63NRVKuoBs3z81vFz9gvUlc4b3X8a3e6Cm57DMXT8EtxveZzY+iHfwvvXQHQfb7jeNVQ5d+PYD92K214fQ0Kd/UzeyLPC7iAfYvuLjfYvVIwYoolbL9vpkJyv6Kuu1pBst4BTyFsA6b724UpGk26PEj6iXUMv9lJGlxmYwWhL7VN3ev+fC+MzTWcwJqgU/TqRoxvL3qLXSjSHvyV++D3oh1W79W3skTljIdiDREM/l+MCRazOKTH3ASXqomEjivkJnaprdMnydJ1ChnneZYsjXsSr5LLUiOnVRtMQFh7HdHyTY7vUGGHObV9Puf7tzxyucolfBJSEl1fBdSHS2k6unTWxd6cfvO9lZDu4b6YAhB9DKCyiDxJ4Z5vMGbWx+RSNIExZYVGSp2tNF7gTUu5SeP9aHxNsdTRseBbBEqIzDTYOSdDdR9XwkavMavppcASAmGGa6V0RXH1HBImdFstLgJKaB3282wktSGCCBS4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(36756003)(31686004)(31696002)(86362001)(6506007)(26005)(186003)(53546011)(2616005)(83380400001)(6512007)(8936002)(5660300002)(41300700001)(6486002)(6916009)(4326008)(8676002)(54906003)(2906002)(38100700002)(66946007)(316002)(66556008)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkFyMlE4b0NzYXJCYzk4NGlNOHlRK202eEpNdlJaeFUydXVpTGJzeVNYZ3o5?=
 =?utf-8?B?cHR6V2ZqbFM0bFFJaHV3V0IxamdpWDU5TXdsVi9XUzFraXRUV1cxMU1VZGJi?=
 =?utf-8?B?eTFMSVozYnI5ejFqM01ENmlzQzVEdXppYm00RzVLR01SejE3eit0OTZGaVVY?=
 =?utf-8?B?Q1MzMmFYOGIxR3ZXQmpLNXBKYWJEM0VzTTZ0cWtJbGZSejdXdlY3cGxOSHNy?=
 =?utf-8?B?K1R6VW9NV3VBK3pBNWMyTGRYcHoybWdTRlArUGdPdUdsSWJBaGlIQlZVL3lu?=
 =?utf-8?B?R3RnSlducWJleG0zck1JWW9OanJyMTBsNVY4NjAzLzNpcUxwdHN4RThWQXA4?=
 =?utf-8?B?alBuYUdkMGlNR0k4OGwrNkxUbkFFRXBVSGh6UGF5TWhJdHV1WWVwRUNseVBu?=
 =?utf-8?B?VTR1Q3YzY2lGZ3V5MWdpSVRGUUdsMXBSaHZ2dHBwQkRIZUhHOWZYRzM4bjBq?=
 =?utf-8?B?b2ZPekFETXdxMFlEaEFjOE5ZUVo2QThQYUtZeDdsUVZmUnJWTm0zREdxUTBh?=
 =?utf-8?B?eVZnZWNqaWxsN3BoRGRMNW42SFpXcFBJcklaZEc3RDMzQVR3L2d3OS9XNFdl?=
 =?utf-8?B?Y1huTWpzRXBKK3A4THdNc08yZ1pTQnhGK2VXV0ZpN05scER2bGdEK0UwTkth?=
 =?utf-8?B?elhaaE5CQjEwK1AxSVNWWEhoT21oQjNaVEd2M05sMWx1VmZEOEw4WW5IckEw?=
 =?utf-8?B?VERSUzBaNzNwcVA0UldOZ2luZXhkdkRlWWJlWUNZUDhVTWlTS29mbjhvS3lU?=
 =?utf-8?B?cWpPbGF6cmY5WVpzVE5ObWZ3YjYyWjlZRk8rZ1JuT1ZiVU50K1prcjljdzIx?=
 =?utf-8?B?VGNMT3ZpeURZUkFFREU4SHE0ODd1MXJUWTBwRXdnZ2w4WThRSU9WQmJ5TmFB?=
 =?utf-8?B?V0t6SkJUZElqYjVVM3JheEJLWVJrL0I5VTh3UU9FS3pqUERPWUdvQ2t4RUxx?=
 =?utf-8?B?RmV0SnQ4RWZqdjB2N1JDVFZldmJjR2twcU5IbjBPNmMzOUc4d3hTWWlHQmIv?=
 =?utf-8?B?Wk9CNXNUZUZLYjUvcURGQjQvd0ZTQ1dIclY1dWM4ZFVhWTI1QUNGZTZGV2w2?=
 =?utf-8?B?UUhnSmowRUJTbUpWQkh3eDFLQjdmM1ViTThhWUhtT2IreDdZeGFqR2g5VWZt?=
 =?utf-8?B?bmRCSHJCNVRvblRhSFJIK2lOclE5d3NuTWFrdGRwS1FtaUh4eUNKYTJ6MjJ5?=
 =?utf-8?B?ZVVWbUt4WWZmMy9FaHN2NUdhUWtnZ2dpdHhRN1hKWGd1Tnd6ay9KeHFjWDVL?=
 =?utf-8?B?dDRyL3NEWk5xZ0VtaWtRbzJDZnpZTDRVR29CUGRGeDIrM2tPRENwOVZFbXNw?=
 =?utf-8?B?WXVPTXhTYkViWTJNTjNuUUlJV1VKelNlcmFHS3F3eGNxSWtYZDdra2dDSjZH?=
 =?utf-8?B?bStLZnl5TmlpclI3dTFXOUU3eSs4bFdKRlJReGt1ZmhIZ3RCVTVGV1VtbDV5?=
 =?utf-8?B?akY3aVNHS1p1ZUhNb0NNcHhRUWhWdHVpeTI4MCsxd05DZHRVWHRrdXJkVFFH?=
 =?utf-8?B?blVma1NqNCtpUU52akFiYXhydllOMEV1bkFPcWlINVVWSU5ldElBNmpCdzZJ?=
 =?utf-8?B?M2RHRHFTcXpGbDBCUTFxMk1rdG5iUnBYcTBWK1JsSFdxMmJCSE95L1VONmdY?=
 =?utf-8?B?N2F5K1hEN2tHMk5DekY5RDkrOGxHOU5ibnllZnU2TU1JZHovV3lNazd0cTg1?=
 =?utf-8?B?c0FQdnBVRjFIZUs2Ri9CbXJoMDRuaEE3L2lMWkVhK3VCQ3lVaWUxVURrRmdE?=
 =?utf-8?B?MlQrSlZPNG9iUGx5NldJWTIxSmE2T205MWFxVmdzVkk0TjZwa2dFT1ZvaVlO?=
 =?utf-8?B?dkdSK2lET0NhZmtQbmthNVNhNEZBUU5yMkFUVVozNG5sU0F2RENEK2pIZDhH?=
 =?utf-8?B?QzFncFZGMUhGYmVxeG9aQzNMcUcyQXlaa2ZUZi9uRFVIbm1uU1VEL3RSblZu?=
 =?utf-8?B?YXpXM1J3SFpsREdRRWZFNWkxczdwUzlLQnUreWVuR1FQbGNPeXV6dTZQY203?=
 =?utf-8?B?Q1YxWUpuclkrSEVsYjd1eXl0ck15cTV2MHIxOG5HY3N0bXRCZlhoSzR0bkxE?=
 =?utf-8?B?NHNBdEdvaEFCZitaTHBBaGhpSU5nMGFTWkE3K2hYdjdRa1YzUGM2eXFnUkJU?=
 =?utf-8?Q?08OV1oMAA/+TNG7AwOYSbp3Ry?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf970407-54b0-483e-a34f-08db2f7864f9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:37:14.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0Y7hONFrw56v+DpU7+VNCKAYXr8n4XM2bq3V2ixQYHIrw0i04Qg9j6xMLPKxbcESzlMHTbBHmrk03qKgYFxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7017

On 27.03.2023 17:39, Tim Deegan wrote:
> At 10:33 +0100 on 22 Mar (1679481226), Jan Beulich wrote:
>> There's no need for an indirect call here, as the mode is invariant
>> throughout the entire paging-locked region. All it takes to avoid it is
>> to have a forward declaration of sh_update_cr3() in place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I find this and the respective Win7 related comment suspicious: If we
>> really need to "fix up" L3 entries "on demand", wouldn't we better retry
>> the shadow_get_and_create_l1e() rather than exit? The spurious page
>> fault that the guest observes can, after all, not be known to be non-
>> fatal inside the guest. That's purely an OS policy.
> 
> I think it has to be non-fatal because it can happen on real hardware,
> even if the hardware *does* fill the TLB here (which it is not
> required to).

But if hardware filled the TLB, it won't raise #PF. If it didn't fill
the TLB (e.g. because of not even doing a walk when a PDPTE is non-
present), a #PF would be legitimate, and the handler would then need
to reload CR3. But such a #PF is what, according to the comment, Win7
chokes on. So it can only be the former case, yet what we do here is
fill the (virtual) TLB _and_ raise #PF. Win7 apparently ignores this
as spurious, but that's not required behavior for an OS afaik.

> Filling just one sl3e sounds plausible, though we don't want to go
> back to the idea of having L3 shadows on PAE!

Of course.

>> Furthermore the sh_update_cr3() will also invalidate L3 entries which
>> were loaded successfully before, but invalidated by the guest
>> afterwards. I strongly suspect that the described hardware behavior is
>> _only_ to load previously not-present entries from the PDPT, but not
>> purge ones already marked present.
> 
> Very likely, but we *are* allowed to forget old entries whenever we
> want to, so this is at worst a performance problem.

That depends on the model, I think: In the original Intel model PDPTEs
cannot be "forgotten". In some AMD variants, where L3 is walked normally,
they of course can be.

>> IOW I think sh_update_cr3() would
>> need calling in an "incremental" mode here.
> 
> This would be the best way of updating just the one entry - but as far
> as I can tell the existing code is correct so I wouldn't add any more
> complexity unless we know that this path is causing perf problems.

If it was/is just performance - sure.

>> In any event emitting a TRC_SHADOW_DOMF_DYING trace record in this case
>> looks wrong.
> 
> Yep.

Will add another patch to the series then.

>> Beyond the "on demand" L3 entry creation I also can't see what guest
>> actions could lead to the ASSERT() being inapplicable in the PAE case.
>> The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
>> PDPTEs, and all other logic is similar to that for other modes.
> 
> The assert's not true here because the guest can push us down this
> path by doing exactly what Win 7 does here - loading CR3 with a
> missing L3E, then filling the L3E and causing a page fault that uses
> the now-filled L3E.  (Or maybe that's not true any more; my mental
> model of the pagetable walker code might be out of date)

Well, I specifically started the paragraph with 'Beyond the "on demand"
L3 entry creation'. IOW the assertion would look applicable to me if
we, as suggested higher up, retried shadow_get_and_create_l1e() and it
failed again. As the comment there says, "we know the guest entries are
OK", so the missing L3 entry must have appeared.

Jan

