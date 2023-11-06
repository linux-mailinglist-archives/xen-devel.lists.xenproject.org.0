Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC57E1D32
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 10:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627840.978678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzvsc-0002BT-IC; Mon, 06 Nov 2023 09:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627840.978678; Mon, 06 Nov 2023 09:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzvsc-00029m-Dy; Mon, 06 Nov 2023 09:26:46 +0000
Received: by outflank-mailman (input) for mailman id 627840;
 Mon, 06 Nov 2023 09:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fhP7=GT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qzvsa-00029g-Sa
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 09:26:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 994be42d-7c86-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 10:26:43 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 09:26:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 09:26:40 +0000
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
X-Inumbo-ID: 994be42d-7c86-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+hhP/IwJA4L6TWf6wmCSJQgF5LKgn9yLKccza0ORFd05xZS9chSpPeLjKxYfmaeakYiDxcroYGAp3kkXGVpylPDEPbb5xRyoVCMFZ/d+2amGvlGd5huwRrqaNPzafOPBBz0rmcVH5yIG3yFA6CMdKqGjvw7kHLbDSuGPjFnj4rLyJABHjfPvozi4YFiyPoV6hGhEvGYc6CJs/17SMlxWTqLIrdmDpJe7v0A5JuxzkUAjsKBnUa/8warMWxRKIk4ONctheLuzX3lC6vAszcVrSC/uYqi0chEw/67XO2rqnAaTuX7JXZ7ruy83q2ffK6y++/XDEf8G7dKQNItEhESDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYN8ptyLz54paeRSlbGwEqaXGw/wC7h0IBeHgj9h1s4=;
 b=ho61lZ2wuidXz7G8eJlFWqqfECy/D6/YlywT/nNv84yBVsnWbAjD73fNkv1Ad2Pryu2bMLDmUtHS0ciBeaEfabz8OdP+3aC9PIHVkcIke10jQXHKshn15nvAzo1I5H998G3jsIShTowsW1MuZwnwQ7ihaFC3LEqNrn1X0RhB/NAmoXP+C90xWKNJU/3I3Mwp9uTqTBywHuvZKx0oFaYkWQQECGD0XsTwGs0yWR9IrLajobZ+yi3Uql6ikyC9m0hQOSLmfsJN+qrE1OchPgzgZwMMOp3CJ1ceh5HRNuP+WoKv7/4ssxhycCkNP1Tp2O0bhABOfLqSaJFjrwEaKlYYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYN8ptyLz54paeRSlbGwEqaXGw/wC7h0IBeHgj9h1s4=;
 b=AqRtSlst1GVcAniJahkhaV5ZOrq/Qp+AW9jV7IxQqdKtrwkkgvUYofW2ODDrAkB0JKT90v9PSFtrr9Ne6wliOcamRQOMFbJoZ0tb4ENKWGsSouDUHboeWknVLISM6Zr68HR4TjUDJhiL/586Y8Vu6Hkdywx9Q35w9nEaBy3XphEJx1t8ya+TZBZZvZZ4MyMPzUScKULA37mXYctN+zG+EIpJfitmpO7cW2g/4geRsSi+7ABQaj6GDf+Xhs4jmZ8ar9/qYsbw71ek5qTEd3fRRzUj6Ex/sb9or6T1s3JGAkzAffDgikyY1QeR7sjSlJMn6TVKFPQ9pHhcs3E/B8bHGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72bb9f75-66a2-1452-40af-a90430cf7eca@suse.com>
Date: Mon, 6 Nov 2023 10:26:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
 <20231102195938.1254489-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231102195938.1254489-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0345.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: a46ef933-c6f8-4335-5146-08dbdeaa7bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fdZ0WCG/M6QinZlRPtJo/nn2RZmaEa1cSDELQRScOmfTfX9m7DcOCokjor5xYQHNCskx8WTuyfw0kQzapziL26PxW4Sgv6283xibCUedszsaTCxzGH1aT/4Os82NRFh6QJJCEZDMd4Prp+afENsNWd+EOnryAAbNMxa3zFM3XWXOzrqVbjhzxV+kHAeq47emQ5W9+pWxAE9T48XWiQvCuO6S33GNmgnefxvkoG10+cnimk9lhgKiNr2vM1NCnrwZDFQI/kEQ3MqVabzFSFdjwzJlj2Gxo3QwyohUa2sqhZsuIA8vpBLPPMr4nlYbVR8ibeEN8J0tZ3pgZr6Xyb8+qthFtwu1JQWTomHPIP2Ng5dR1/NklIzupsYTv40B87ONS64OZBvjcEN8lBTXXp+9SyDyLGpzBd/yj7CqpOPQsv+U13bGysl5pEqXi8SGXp5TgmpNzN/cIk6B/pIwKdvj4rSxJk98RdYWYuiDHK5lDRwjNT09hazrY5fRjfwzcAmTxy6Su72wbbZ6JNUno8LLLCnBcUmFR70w9mhRDxxPZPKzbHwqhxY9pgDXk1idzfvsDdX+Ih0fjI0Sgc3oBim3soHFL8GqTmR3AieK/tK/BpSuL5RrUnjpmUJV3TA+Wx8a1Pwvqut8BbJ13LuBY1CvLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(6486002)(66476007)(6506007)(6512007)(66556008)(53546011)(478600001)(66946007)(36756003)(86362001)(31696002)(26005)(38100700002)(2616005)(83380400001)(8676002)(2906002)(7416002)(6916009)(316002)(41300700001)(5660300002)(54906003)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxsbnRxK05OeElSaXJ6Q1pYbjR0eEpRVkZSK0ZCbm1OdzA5RVEwNU9UYTRV?=
 =?utf-8?B?aFc5L3FKSHI1R3ZKUm15eGxOQWRrdFhUenNWMys5dmhXUnBic1drZTJSUFhL?=
 =?utf-8?B?SytHOTFyQ21oRnlIbDNKLytGWjlrdE9uVU40c0srNUI0aFNNL25aMWxZcEs2?=
 =?utf-8?B?c2x0YmE0cFFtNkRBcnRicTMwNUxqRWFTTTNJcjVnVzFJVDNEOEI5dG5zejRI?=
 =?utf-8?B?TnozdFJ5THpPUEgzSXMzZkQ2TjZmNWl3Rm9QaFU3ZGI5a0FITkJCd1JYK294?=
 =?utf-8?B?Sk9Jc3ljQTFkek92Zlh1WnE2VHpoSUxyYk5qalZ2clltcGtuWFBHR1I2ZDJ1?=
 =?utf-8?B?SnA2RlNVZXZMWVh3VENOUTBpU0oxN015dXFUNVNoclBDZHh3L2NsclQ4K1ds?=
 =?utf-8?B?YVdYdnc5N3BxTVR4c1dpUjFOWUVRN3RDRkJMWUJ6V1F3YkNNQkNxVkFRYVpO?=
 =?utf-8?B?bVBVWHNKQThVU1dmbWk0djYwc0NoQm5QMHpQQTRKakR0T2RudGFNMmxSWHNH?=
 =?utf-8?B?cUpGanVzSDV5QTFNdWl1VUNMY1J6alNxeDJJam1lZklOa1hhbDBCYkNJdG4y?=
 =?utf-8?B?Q0YrZVlQM2NBR2dOVU8wYkZVU3ZnZGZOUmpjRkYwZk9lVUhUNTlvMlB4YmRY?=
 =?utf-8?B?Rk10THhQUDdzRVdnUXdFYVNzSFFtTjBoRll2VnpNNlZLNlpXZng3WU1mands?=
 =?utf-8?B?amFjb2J1Y25XNHdDemdidHFBZEtGZGlEUDlQOWVvUUNwWFpQYkhwSENrWTZs?=
 =?utf-8?B?N0huNVlmZW8zdTFLcmxNcW0zUEdYbGVRbXJGSC80WXJwTjd1Qm41eUluMEo4?=
 =?utf-8?B?eVNIZjlIWGdJdHZmV3ovUnVsVHkweGJkUml0S05zM09BQVI5STB6SnBvNnVT?=
 =?utf-8?B?RDlZQUlib254akxTeWRyc2JJVmE2SlpZVXRKMU13WHdpQ3JhdFZMS1VBVUVD?=
 =?utf-8?B?Sy9ReFc0TjBST2UvWFJVRFVzUFViZXZ3YWhsVVdGS1BLdXpCQzRFZ2VUY0RN?=
 =?utf-8?B?ek8vK0svQVVxZ3F5UktPaC9QWWxwdHZMNzNrblZpZTQxZUcrRUNIcWkyZXkz?=
 =?utf-8?B?WnBBNDZDYXp1ZWxzTDE3emtpcjhDZWFyVlVTM3FTZ25RU0wySFNjSndhcENl?=
 =?utf-8?B?YWJoalhuVytQZTVyMWJOenFvajFhZ00zV2xrRjRzajlCdlI1WUxNM3dOV0Rk?=
 =?utf-8?B?ampjTDAyUnBiWDlLYWxSNGlqTExxT1dvYm9lT0JuRXhWdkZCM2VFb1JkYWxk?=
 =?utf-8?B?OWtpUXFTRXJaMkZpbkNWUHlrNW5icXkrVXZUUEJxYXlpQjRGYUxQZ2lveVor?=
 =?utf-8?B?cmRmWWkvSytrZXJzZ1Bpa1hvY25idnpLOFE1MnYvSUpLNThnT2QzYWc5WnZy?=
 =?utf-8?B?SjlFcVl2Y1NwaStqMTk3TFdtTEFpdDVzanJ0WVlEZDZsdUpjUlZRWDdzcUpO?=
 =?utf-8?B?blRRNCtmUEpmRzgyVkhtSHdOWmdJaWJ5emtZSGRTeElUNHkyRWhIQ2hMckNH?=
 =?utf-8?B?RDRObENZQi9yTlRHN2M0R1BwTmhjM1RLZ0hXRjY1RFdUQmpUSXdON1N4bUV0?=
 =?utf-8?B?aHlDOFlGWE0xeGxJU1RYTHEzMkZGb1BRRFdHcjBEL2g1NXVzMWxXTUl5bFpu?=
 =?utf-8?B?UG1EMFFSRWVXM0dFTlRWcS80VDFxTTlFVmx4ek1Ody9MTHlKU09PSkh3MzZG?=
 =?utf-8?B?dGJLZ21XQTdqdUJSWjcvUUlVQ2hhSnFXM2Znd0huL0xTS0o4QUtOKzczUjRi?=
 =?utf-8?B?UUZqNEtxR0J5QTQxUWtId1E1YVFNeWloV1Nua0p0Z0xGTHM0eEhaZWl6ZFhR?=
 =?utf-8?B?SDhmdFhwcFVTTzl1K1A1bG9WWVVrZHR5RklyNFRUVEpnM21uUXlCOXNWT2JU?=
 =?utf-8?B?Z1NRd256TjRUSFlPR2Vvb2ZvY21jRi9QZW9FbndPc1FBeWVSak45VmtuK2Zo?=
 =?utf-8?B?cmRMcXJlcWdFQTNnWFJSamxLYmNRd25VQUNsT2kvSTVNYmd6a2gyY1lLYXZz?=
 =?utf-8?B?RUl1YlNjbC81a1FVeU5WNWVlWWVZT2N2QTlpU2o5ZTlnN1dVQjJBaGNkQ0w1?=
 =?utf-8?B?R1hNMGF4b1Uwc3Y5NWRkVmc3aUZ2UmtTeXFFTkd1dGNFTjdWTkRJdytDSDdi?=
 =?utf-8?Q?70ZSZ5jdYcRulbldNz2mom8c3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46ef933-c6f8-4335-5146-08dbdeaa7bc9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 09:26:40.7680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30q0QXXWbxbK1owDIz7JP8epTXRFOvO+ILt/GJPr/9BAaJi4fT1Evpa3dMykTAMdgN7Mwk9YLhQQuhnM8XtB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106

On 02.11.2023 20:59, Stewart Hildebrand wrote:
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -503,6 +503,15 @@ struct arch_domain
>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>  
> +#define is_pvh_domain(d) ({                                  \
> +    unsigned int _emflags = (d)->arch.emulation_flags;       \
> +    IS_ENABLED(CONFIG_HVM) &&                                \
> +        ((_emflags == X86_EMU_LAPIC) ||                      \
> +         (_emflags == (X86_EMU_LAPIC | X86_EMU_IOAPIC))); })

I'm not convinced we want to re-introduce such a predicate; it'll be at
risk of going stale when the boundary between HVM and PVH becomes more
"fuzzy".

> +/* PCI passthrough may be backed by qemu for non-PVH domains */
> +#define arch_needs_vpci(d) is_pvh_domain(d)

Wouldn't we want to check for exactly what the comment alludes to then,
i.e. whether the domain has any (specific?) device model attached?

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -51,8 +51,17 @@ void arch_get_domain_info(const struct domain *d,
>  
>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>  
> -#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
> -                     IS_ENABLED(CONFIG_HAS_VPCI))
> +#define has_vpci(d) ({                                                        \
> +    const struct domain *_d = (d);                                            \
> +    bool _has_vpci = false;                                                   \
> +    if ( (_d->options & XEN_DOMCTL_CDF_vpci) && IS_ENABLED(CONFIG_HAS_VPCI) ) \
> +    {                                                                         \
> +        if ( is_hardware_domain(_d) )                                         \
> +            _has_vpci = true;                                                 \
> +        else if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )                 \
> +            _has_vpci = true;                                                 \
> +    }                                                                         \
> +    _has_vpci; })

This is a commonly executed check, and as such wants to remain as simple as
possible. Wouldn't it be better anyway to prevent XEN_DOMCTL_CDF_vpci getting
set for a domain which cannot possibly have vPCI?

Jan

