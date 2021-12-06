Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C9469803
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239030.414286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEeI-0001Kj-0i; Mon, 06 Dec 2021 14:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239030.414286; Mon, 06 Dec 2021 14:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEeH-0001Hs-TW; Mon, 06 Dec 2021 14:07:21 +0000
Received: by outflank-mailman (input) for mailman id 239030;
 Mon, 06 Dec 2021 14:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEeG-0001F4-D5
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:07:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2fb0414-569d-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:07:19 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-R_wCW8EgMJ6k0W8l_kMYLQ-1; Mon, 06 Dec 2021 15:07:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:07:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:07:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 14:07:15 +0000
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
X-Inumbo-ID: d2fb0414-569d-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638799639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy7Bvu/V1pNuLdYx0BstD1vAemGMPJL9FALhPZsZ+HA=;
	b=dEFdkG1TvJMEiaC59q7IVfdrNhm2I+bSDLzGKCNdGH5njSNuJaHSRzmdcMT1LpIXDom8+D
	qmyFCmMPZ8QnJSvdSWrrGBUQvSlQnK2rxHmvHf7NCAScGZRp7UEUbSNfd6n4p/VZpELi4Y
	MlaiT7A27/vnZoTCKJus4Vou9y74qC8=
X-MC-Unique: R_wCW8EgMJ6k0W8l_kMYLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYr6YGJ2S0m/vPxn1hY2OrPy19kMnw33YEX6woQxu+DB+BORfyIXRMWSQI1K3YCGcZX8yCAb2iuz5MBepDknzYkAG/DOTfU8/8/g+RviUnC0rhjRb+q5mm72BjgFzW0Pvd4x9Eh+mMp0gf/lMojdmRv4RTrjgCI/e4bRKRCCYmM4+eez4tdlbHBt4A5/GliBroWsI9XeW4W/ipgkfmbCyBARk4iNHvPz/CjSvWnzcXfI81gu4n1hxbNVa4IzAHdCnbrjIpNLUExt/vYwcSu/pqUEo1yiTiPrdtUy1BjvhptJbYxJBF9HAfb/jDOX3/Iu00UHeuVVibRCONHjDYYq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/ijlGOwIXpRo8SfXahGIkGaSLFMOXDD/vSOr8ascyo=;
 b=RjbkohPMXwBrkl3tFfGTRYs2E0GKCF4IO94/rEGj3UrsbwGqNtW7wUK9B8SH+JzLHrYvIQ1tkKB+wlH35PqIcE0FlFelGRdt9YObceyG7q22EOjhxkvIGuHDcwCNVJKoE1CrnnOZK+2zjatKwwCXeDJIWfjCu20AFZ2IThMQWpjxL6CuyqJ7sj7miNVpon4InHaYsp7GWe573hk1cFcQpzJ+e5uz/UVlz3RwmZD2+M6tFWD0kchFm7ZcV1n5lv72Bh77mAPtafXVnw2LjKgo5jf725H0kUw0moHsbQoY/riHZpUyZDhrArFT8IZG6UssFnHy5HzWAan4Nu6B85Hojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1884c09b-2583-efd7-bcfa-8413865c53b6@suse.com>
Date: Mon, 6 Dec 2021 15:07:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/irq: Improve local_irq_restore() code generation and
 performance
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206133828.8811-1-andrew.cooper3@citrix.com>
 <b7c3525e-9acb-cef8-56b6-894975eeb530@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7c3525e-9acb-cef8-56b6-894975eeb530@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d80f5b-2447-4f60-a951-08d9b8c1b578
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039D23A7E2E3074F14D498AB36D9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	md2MSLrp0wU0qpiecDeBrjEb7nsSAnxuD/4ISm8GW0ohx6cXznDWurm9kabl6hrDDZDMJVMHBqxcwtEtZySurJAtj24y/0P2B3ejKwf+RC8XV3I0ogXzwQBoIO8ry8l/lsLOnKcrFOnKb6p6A4FWT7iQGoe979oww5YCF0Rm8VksXQNFZYa/6Kab82LFD06YXY9rXewlwTa0Xkrz+V9/CSbiE5mtW3qCKncFors/AOdwVCCXYs7ITM5sOwGDGKYEPFogTP5ny7wOs+RvB82/2uG0zfp+c/PTiXGdfgJI6fFiNDy+PtT9C57Cmd7QatYNwrrh+Rgl0hS1VgCGEr4KlbvsdclgOTXnP9ODCfNuIl5u2dtKLZFkZX0x0HHb1DDKFAvBcjWugD28BmLdBkkP+arFMGCcQ6SzNxaQquWl351o2ZgOy8pBLc41goskKpp5JeRQA8PMwSNfr2KQnc3fAqIjPlkNvSgcjeZX/BzMft8xRmPdmrROsDutB9bTZQXjLjNh4O6wcCiFd21E8Xw+QjWqFS+x6EVaEaGx1VTbC8ZwXm/X1ZwAi0l7t6zXcT8nMlTZgz7oDLWmkdKPoSpSWcjeoM6SSIBuod0SWybFYrv1wBHn8ZEXAZPydnPpyNlYazOUJ3f+TaJ/joTPPzZ9uq4sOrPpzzbKfIeFgJrGCts4vqZKN3ziUsvKo/EftCVvPfTUXiiEEVm7TsFAR5z+fsbYwS80gttrO4VN50BuB4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(38100700002)(4326008)(31686004)(6486002)(5660300002)(26005)(36756003)(186003)(31696002)(83380400001)(2616005)(53546011)(8676002)(66946007)(316002)(54906003)(66476007)(110136005)(8936002)(66556008)(86362001)(508600001)(2906002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U0koKfBb0Z3u2+T0XZd/nS1cEKMbror7Lh2KiP81WJNn9WqFMYh1omO+R7ru?=
 =?us-ascii?Q?XZrt6PZlTr9/NCiqIJ5auoZcFK9CeL0SEQVBSrHY8Mvp0DAb6759DTpTWkJW?=
 =?us-ascii?Q?UvJgRSLF9AndL0Gy4PgPOqzcibMln+8tDVWWD0oY9TXM/nHKlUqR+unzAK1Y?=
 =?us-ascii?Q?AArp90eR3M0i8avIxjdyqkR4loVZKr9oZ/8mr+Mx7CJclzKRrwpWkIh5EyU5?=
 =?us-ascii?Q?zWEkx18OqIVqb68YWwEHZW9s0zXCZw+9QYznYTtUmAhqFnUx8PvoNNY6Wi1u?=
 =?us-ascii?Q?0o6fEhoxowsE23Jau6RNAOXmG9tLOCBt7o7ey6jVHSqZld+X51CdACTCOUBN?=
 =?us-ascii?Q?Voywv1AGL7ZSsoULSisG2CXG0D9T1hWxykz6WJoocEIr7LMjaccHmmWGyRkT?=
 =?us-ascii?Q?TsZBji1wtqanovnpzNw/3xjbETSIltVXBA9Ym4tdQTipPi+iPlHQKLd50kiJ?=
 =?us-ascii?Q?Hfw1kWDBYb8QR3ye7DMTRZu9bgcXUozLCpqg8PQ+1R5nLi7AD6PMtUSQua+C?=
 =?us-ascii?Q?zbKKsRRyhuaB4OTLpFGGnp5Ujs+YLuzYPj6oU8tESonZltmst6Xtpez0qBYT?=
 =?us-ascii?Q?uFkrouaNaNTCCq2Z75Hqc3ZwxR0U8AkX0i/UgruzMQIAOOX6odCbiIn7KGlT?=
 =?us-ascii?Q?H5qtInVwEaiKfM147ovDC6DqdCwN3Xf4+rBc6KOFy+1yCRNQJ9jNYBEPQ0yI?=
 =?us-ascii?Q?dIG8BBsGA/SQd0sgCtJTTa4N/V4NV0SaXvDXh8vfDm+UBvix80+OhSCKj+9x?=
 =?us-ascii?Q?/3G1J4fVtSOw7RE48+MPEMA4bWSZ4ajNGsnItGR28jvdeZMfJ1HBfZkzEcoh?=
 =?us-ascii?Q?u1fRY/lrQ9PbSmS/+3I1LTPfezbF+Wo0yhDu1zNmKk7LCreJgUK3OwMiCaKj?=
 =?us-ascii?Q?RbHQyHK+8Q6+Fn+74LMkweVbAJJ1l/pqNCnFbV4kSRa0lN6xjsx0OfUY3UBF?=
 =?us-ascii?Q?Sv6bGW/Ij4zpeIK7aZw7pNl61l6q5AUoU10Smid1Lb4JQIvjKJ6vGlFNNBaO?=
 =?us-ascii?Q?gHr4tYs7ynkt3yUXYAMhs0Tfh/itBmI0v6mKhCVrHsLq4/mA7Mko2GPeh6nO?=
 =?us-ascii?Q?CPtyC5IrW6VePAOSbGV//bmzWUNi46nfUBfwY+UZSIvWb5KsjVE5pQD78JrD?=
 =?us-ascii?Q?VJhdqZpkFwIBqKFJ02oTt1bcorSXMeeBmn/MKG5LOX6RPCL0nRSuBOn+Ntso?=
 =?us-ascii?Q?mnNIKOxRcNY2aSHMNT+vUmGNZG8E33vs62BADTZgk8mKJTh99S5Na0dLtLkx?=
 =?us-ascii?Q?/eBsNgAB+KrcgNaVjd6DggXNz9lXLILK1DMH1E5UztcffNx9YBtv9kRbP6VI?=
 =?us-ascii?Q?06BxXIeq9f880NdtN5w7ZfQJWE/HpGTZ5rYv0SH7cB/YA8U3CcbSwb+Q7VZu?=
 =?us-ascii?Q?BWWbhMmsVhNm4wmvjpXsJTuB/iR9DTP9u2abu9JZDm9mDRB7zxNbgE/OO+Uk?=
 =?us-ascii?Q?QalberDXDFsUxiR4SSXQ4R7y6dMWm0A2RFWDHoJFWCH6g+f13zbjYNH8Spn0?=
 =?us-ascii?Q?VYEWJhQOMNSoNSTXTSlsOrEzNAq/drTsQGRwUN0piZvBSI85jXuZA+bTp/CX?=
 =?us-ascii?Q?MGdxsiTR4orblt80ul4tU3Euud1J1LUijK8U4rS3Yo3LREf8vlJk1A7SL+pm?=
 =?us-ascii?Q?Mj/pfWYYXrTTV5NR5yXFgCE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d80f5b-2447-4f60-a951-08d9b8c1b578
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:07:16.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0bBMsoWOq1oDOMoLg7RcXCQv57lhK0Ye90KzcXd4Lvdta84VeKnvAW1bvvcanBAm4xw6Q/d7TUo4Ge8NV12BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 06.12.2021 14:55, Andrew Cooper wrote:
> On 06/12/2021 13:38, Andrew Cooper wrote:
>> popf is a horribly expensive instruction, while sti is an optimised fast=
path.
>> Switching popf for a conditional branch and sti caused an 8% perf improv=
ement
>> in various linux measurements.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/include/asm-x86/system.h | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system.h
>> index 65e63de69a67..4be235472ecd 100644
>> --- a/xen/include/asm-x86/system.h
>> +++ b/xen/include/asm-x86/system.h
>> @@ -267,13 +267,8 @@ static inline unsigned long array_index_mask_nospec=
(unsigned long index,
>>  })
>>  #define local_irq_restore(x)                                     \
>>  ({                                                               \
>> -    BUILD_BUG_ON(sizeof(x) !=3D sizeof(long));                     \
>> -    asm volatile ( "pushfq\n\t"                                  \
>> -                   "andq %0, (%%rsp)\n\t"                        \
>> -                   "orq  %1, (%%rsp)\n\t"                        \
>> -                   "popfq"                                       \
>> -                   : : "i?r" ( ~X86_EFLAGS_IF ),                 \
>> -                       "ri" ( (x) & X86_EFLAGS_IF ) );           \
>> +    if ( (x) & X86_EFLAGS_IF )                                   \
>> +        local_irq_enable();                                      \
>>  })
>=20
> Bah.=C2=A0 There's still the one total abuse of local_irq_restore() to
> disable interrupts.

Question is whether that's really to be considered an abuse: To me
"restore" doesn't mean only "maybe re-enable", but also "maybe
re-disable". And a conditional STI-or-CLI is likely still be better
than POPF.

Jan


