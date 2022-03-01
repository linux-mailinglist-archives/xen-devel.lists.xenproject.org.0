Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE84C8D4B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281492.479846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP39B-0001Mo-TE; Tue, 01 Mar 2022 14:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281492.479846; Tue, 01 Mar 2022 14:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP39B-0001KV-PM; Tue, 01 Mar 2022 14:06:37 +0000
Received: by outflank-mailman (input) for mailman id 281492;
 Tue, 01 Mar 2022 14:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP39A-0001KP-1C
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:06:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8b59cb-9968-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:06:34 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-DMjONFKaOcOvCB0lcOniTw-1; Tue, 01 Mar 2022 15:06:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7427.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:06:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:06:32 +0000
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
X-Inumbo-ID: cd8b59cb-9968-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646143594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NH789zOs3WNiySRoMVWAKpB8KEacNg1hBBr3qGOdNCo=;
	b=Zg+nJjrokMmhbtPzuWvNkJZLZPTcx2nwwTeiKYSEgsE+Qct/8AFbnbrE4BScRZyz6U+tu8
	5fHf73yW3cWNU/K88locRmXUbC4jjEkLHfsbyIGxofD01v4yQS8IAMgFgHIgcFlz0BMIa6
	ctd57sWJvHd2dzjNinseN3Mt50PlZvQ=
X-MC-Unique: DMjONFKaOcOvCB0lcOniTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/xaQ/5fLvveAxVIaaUNTZk/7aIO8bb+YK/tm1JKY4D+0XkvX8aqYoPpYC/40vt8Dz8FwiAVqXlLgr7FbRC5XVpRKYbDRrv2fH50JHZWWYNcDCOESd87qCqY0A52hnPUtu8OcwzQbCMQ5nKGHtOGfWJgW5IZoA53Wk/JKGArtH1ztOcFcFnnSqUaiWAVHWQDvViR0PhinLRTVa/q0NnutR/IbzSANtHqS9U6fAfLx+tHjFh68Mtr3AEx85RbcRF/k2pje7IdO5//XInNfXgFMInJXn7NrzlnfZ5uTFS69MWmK/M7wMCyzCeRXvZFh9323x0zP2xhJ9MBXFZMs9U7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hORdoKxuHhXm3Z9OxT65NOFrf0TCcz7XNSLSOaspVgQ=;
 b=hyRQ9KOszQLLT/nDhzeA6m+ACOvRL4rdiclDFPPKNmZQVFsDeZa8k8nFKF9X/1K3I1mHnRcoCstVYI/jw+z6lfpJlK1xSIHr3UucmfGF5X5ssv6X6UZ8I8yxAFiXFNafmRVHGE3rvcH93L0p4pYFyNi3fjqamAfuWKQxDDAJ3KCmrdmF9NmkSZHTFzEedxoCcAL7yxVMEOXr10I/LJedXK9GMujHZasJsnF7HdqWhm4aj07pHGOFmSFVIZIdVfkmPCFeyol7unN9JUgDNchmycdwm45L0u7/c/Z8XNI4K5yR2ddvbHFp3S+UmHCyjupTFzKn/haXqXxNwyk+SqATsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ed7482b-c445-92f2-66df-a075f571bbf0@suse.com>
Date: Tue, 1 Mar 2022 15:06:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: fold sections in final binaries
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
 <Yh4i/QPAggI3AVpC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yh4i/QPAggI3AVpC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0065.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e58866a-c092-403f-1275-08d9fb8cb02d
X-MS-TrafficTypeDiagnostic: AM8PR04MB7427:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB742744614DABBD635F2A26E7B3029@AM8PR04MB7427.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zz5ZdheiO4bdfx2D08LbkisQPCeqTA1KuBCH7SvsJA23zpR5qEwwAuDgqYgdWqQ6CIF/g0XaVMdbz8mC1tp7HZ9y/ivnkXguA3JDNCE/7P3dUBF8qGv3s9S3SSD3tPZZxCz8hLa3m5Dtoj9b/IlFqglEeR25SuA05ic593E/CbWZDqlISKduC1AkpRtzYza0G3Ruy74BL55dCFDXCcjiD5MxpFxXdCegdkB2PdURO3/kJEb0f44YJAW5dD8+9FWM+uh/JptDCfUOhzad9BaQ2K+Chnqgoh9IsFXv7+IYnSaFGt7TShAijINtgLERIh7REMDT8sEQ94kQ8fu/2lEM2jcltkxxKU5Hf3aeIGBKz6M0Jh/fwqQQojb7u52WXfiIfT8B7wxEdpemPNR/c14Rf7GGGb27nFZSng20Jp6P9lXKkcrQigc8HfIdE5qNO3jVjBFZy2TQYMR5w4mUuLnfWvkrXqIqLOetgZ52jfJmelY7SzTBitdDg+N2TThWHh4gBjhvNgRIe+tqp0J7sJPax0+i47ZLi8D8wvaibH9W5yqSgqgQsRt8vTMWNVc0KgoKWKzxIXWhpDFieiMRkWzX4cbLgewqZ3YHI9PU7PQTCvSzMKh7Xvui3xQFRzbQSgrQprLivCwdN4CitqW4oYe62W96MeFNo4V3kHSdjlaQC0rsdps2CFw8H9sWwMJjAkNjjTUEeZyyuQb9NewcWjNFVJ0rJnIHgEBrbwv9gAsyCvLL/rmwDS6B60zHtILCDu0d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(186003)(66476007)(66946007)(2906002)(83380400001)(26005)(2616005)(8676002)(508600001)(4326008)(6486002)(31696002)(5660300002)(8936002)(66556008)(31686004)(316002)(38100700002)(6916009)(53546011)(86362001)(6512007)(6506007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?22Q3oX6OFi1jR8xQT+J05ImjXG9E9E+8wRf6u17EtaS6z4Ck0PoQ3xwKaFxr?=
 =?us-ascii?Q?zhPMH7ZREhkrjHpbNwAUjm2b1HUy2jihA0l0C4HuAFoelI1l5xgXc2QwiqCE?=
 =?us-ascii?Q?knbtcfKqyqhMQ9siYOzmTAA5ByLPGRGe4qeKpHb2h9shWr10PYzGW+o3kqeo?=
 =?us-ascii?Q?PwSF0rXenzcA05SY++HpwipFOQ1KZKfUlqGcRc2z5+DvrgHNpQsoLNvvwCxI?=
 =?us-ascii?Q?WUp5efKOzKiMi9kMWL2TQDc3hea38R0mYO80/VsKrd3tf9+6pZp4rerABO9i?=
 =?us-ascii?Q?kcvNu/sUlI7Crh5xydXPF1guHYJGmVwve7DtmXZVNWoaXp0Lvn16T0gSr1qT?=
 =?us-ascii?Q?oYeFFX2Krbm+Z2LCZU7UbXTZzAX+tjSTAS8xh7su6GOfBtrqeWA5wOdB4dvd?=
 =?us-ascii?Q?MN8vmD1jmp1D2RhNRNBtf/OytSXw0IiYqRpgAH8ed/q21UUkfI8ziP/BSR9F?=
 =?us-ascii?Q?0bJ2XyXWDKeTObM66bkCwqAF+c3KbOBTEPvK6EniBaOxA6ig3GvUlk1PuiEd?=
 =?us-ascii?Q?DcMd7XrMd2gwMYmPtd1ejcPFrOx6BSCkTneTVexPpGEenLiEB9utVW9p2Gg8?=
 =?us-ascii?Q?5fpfp9ndhMHP5gPFONaVoheihtIZnSa6xeo8Q4nep9qhELtM4l2Pox8RHDQ1?=
 =?us-ascii?Q?G45s/YwWiELcOFjnoO/gLXQZQmnc5w8ZqIyH8xcrxwlcolAKb6pdLSvPCDug?=
 =?us-ascii?Q?dLPPOhFJCzuGxdqeBw1BH5WHvqd1TIlZfit0GwR7tXqDKgbosCpetV9u3FtT?=
 =?us-ascii?Q?hVeBOtReCDnZubtNHK05vCbv8IzGy5S2kdDGDYegmXqcFNigdpW+MXexSP3K?=
 =?us-ascii?Q?Afyutvi7ERRj54e0X/7cX9FuckgdBnlg73geLu+Wh367liMtAkPOl+HCOC8H?=
 =?us-ascii?Q?BfZgqXT2yWTtJmxtlMpbyreCdrFOBvpyAmpEVv2rA3orldGwn0lQCJX4z103?=
 =?us-ascii?Q?HWl77QN/XIxHxk58MlQnzWjOa8kRzS3+JMZJGYWqHnPzOEZO1UIfzrPfo9hm?=
 =?us-ascii?Q?5YyOXfDCPCT8/MKRjql1XdY2VvrdVdrVfOTB5biVZEy32SxKHqQm6NQ1ErXZ?=
 =?us-ascii?Q?s1LghgZlssDBQTVvEZ7dEL+C7RV6gIMBDmG88NKJqX4kn46w058Iff1EK6vE?=
 =?us-ascii?Q?XyARj6qJmHg3JSbRoKpxbpFEhVL5jYu12KHVvWqhRyYzmurGDebYfifjLPGs?=
 =?us-ascii?Q?hprVUTWKEBYw98e7s2VZFzDX/drZZL8xHe0VJZl/XDtjhVxqX0pg0gR/Y7dc?=
 =?us-ascii?Q?t7b8MK0hnYcOhhrUFi5kTwy5cN3178Q2e8+MorxxzOq/lgSmgGqHwGtdQBWD?=
 =?us-ascii?Q?QjuESRQRuS6kQIvltZhbbpP2fuBu5zJqNjQ7SY0h4CTH/gm95GPTZOFBOcyU?=
 =?us-ascii?Q?GHwRjx641mEaNmF07R4LwZjGavNYmDuZcLi9Yhgz8xlr6R9ERSHCnbXsyoyZ?=
 =?us-ascii?Q?jKyv7zgQk3XGH0SddoZXAJHurSKuPpHiyFmzYi/P+UbyNQpF2RnMrPRk08j0?=
 =?us-ascii?Q?GO7N1PhYBjRHh5KQmXkpta+QPhmBOGHSk7IhvUho3jqGADBqCud8QwOpx3Of?=
 =?us-ascii?Q?0K5eMWv7Ryfxaz0rJ0ay8y7CFUb+v/25rOHqcwXuqEpbnrmlLcNDbzpw9NQF?=
 =?us-ascii?Q?yhG/wFaAbUtxgy7xgC4OV+I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e58866a-c092-403f-1275-08d9fb8cb02d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:06:32.0935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yNnGiWXE5nNbB5c8Gq2ZeTEaEczB3PVFvsvXdHZ4MTzc1O/apis+RKlPH8ibQ2FU3SYv6MMlhsKuWIF+VQ0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7427

On 01.03.2022 14:43, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 01, 2022 at 09:55:32AM +0100, Jan Beulich wrote:
>> Especially when linking a PE binary (xen.efi), standalone output
>> sections are expensive: Often the linker will align the subsequent one
>> on the section alignment boundary (2Mb) when the linker script doesn't
>> otherwise place it. (I haven't been able to derive from observed
>> behavior under what conditions it would not do so.)
>>
>> With gcov enabled (and with gcc11) I'm observing enough sections that,
>> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
>> failing the final ASSERT() in the linker script. (That assertion is
>> slated to go away, but that's a separate change.)
>>
>> Any destructor related sections can be discarded, as we never "exit"
>> the hypervisor. This includes .text.exit, which is referenced from
>> .dtors.*. Constructor related sections need to all be taken care of, not
>> just those with historically used names: .ctors.* and .text.startup is
>> what gcc11 populates. While there re-arrange ordering / sorting to match
>> that used by the linker provided scripts.
>>
>> Finally, for xen.efi only, also discard .note.gnu.*. These are
>> meaningless in a PE binary. Quite likely, while not meaningless there,
>> the section is also of no use in ELF, but keep it there for now.
>=20
> Should we also use --orphan-handling=3Dwarn as to recognize orphaned
> sections and attempt place them? We have now detected this because of
> the 16Mb limit, but if we remove that check that we could end up
> carrying a non-trivial amount of 2Mb aligned unhandled regions.

Yes, I guess we should use this option. See below.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
>>      ld is quite clear that this is an a.out-only construct.
>=20
> I've found some (old) documentation where it does also mention ECOFF
> and XCOFF apart from a.out:
>=20
> "When linking object file formats which do not support arbitrary
> sections, such as ECOFF and XCOFF, the linker will automatically
> recognize C++ global constructors and destructors by name. For these
> object file formats, the CONSTRUCTORS command tells the linker where
> this information should be placed."
>=20
> I guess we can get rid of it.

I've taken note to make yet another patch.

> The patch LGTM:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> With the possible addition of --orphan-handling=3Dwarn.

As above: I agree we should make use of the option, but I don't think
this should be squashed in here. The option appeared in 2.26, so with
the current documented binutils baseline we'll need to probe for its
availability. I'd therefore prefer to make this a separate change,
and I've taken respective note as well.

Jan


