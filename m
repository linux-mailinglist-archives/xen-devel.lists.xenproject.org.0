Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B71449740
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223410.386108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk62o-0003xx-KZ; Mon, 08 Nov 2021 14:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223410.386108; Mon, 08 Nov 2021 14:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk62o-0003vm-H1; Mon, 08 Nov 2021 14:54:46 +0000
Received: by outflank-mailman (input) for mailman id 223410;
 Mon, 08 Nov 2021 14:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk62m-0003vg-NV
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:54:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce916643-40a3-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 15:54:43 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-RHgqNzw7OyW9czlaT0cUeA-1;
 Mon, 08 Nov 2021 15:54:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 14:54:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 14:54:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 14:54:38 +0000
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
X-Inumbo-ID: ce916643-40a3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636383283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+K1CwSI3UjizQZfQfQcMR8jOCQ36LLX1IcuD+WYaFw=;
	b=LKLZJMcowkoSJGj9O65lCuPTMH/F279cJK657lg3qEHnufP78NvimCG92rqOfVIborBsuD
	GmfJMCCpZ7QhgSB/nmusLxJKTlsodHo7Y8MKaMVIH9ogtdOsDD70G4eIkez8EQkvTb71QH
	G4pnvsdNjOWrSu/4G6ERu7ZwCLlQJck=
X-MC-Unique: RHgqNzw7OyW9czlaT0cUeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+a3EZxO3DMiiLtFdInQwnHcLRLkNneFY4CIBiJ4ZGS9KS23AtO1MSY/bpJG5e4ctK5wMIijf1/zfCfbxxWo1s4ezkbOEuh5dcx0UiJpV3MHSWeSkM1gpSgWOeQyz2xEOVGXTbUlel5cb7fBSg8FhhxJ7njz5AonGmoOd3dcln8PekXxwNfxYUILImTHIEpVXQRXCNEXphdUonJ3suNRv1Ace+OzKS8T6t+y5S2c53XTCGxmnbI8P4bXSxjYCjdD4pmXmaLMPWftkYUlhJRfsLC5JELNZJBOyLsliADnLmFKePY/PtbnAayKR4VsDvonqXFmmP4xW+u2hWt8BQ+7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+K1CwSI3UjizQZfQfQcMR8jOCQ36LLX1IcuD+WYaFw=;
 b=JOZtnyN7brCn8ZvXwBdDb2o0cF4RhPN0CrByCE4hqB+H22YMf7Umlfre/cx5yoAcjHmA5L1CVADha/kfN0hKQsA3wQ3JpUNlPnCneVwKSAIQx0MgNBfvM/QHEjRLwRyH/+Ht/6VWBQmBj5PQnUZMHCnHEx/Oy+QIuaYCSw3jmtwlNo16Zc8Vzsn0lfP1lvuXJZj7Q1RgwZfBd23y7XluNVfeGGYvZHg+5EuIt2O/ex9EWbMhkHRavpgy+YI8iXydP5jlaEShiEu3ywaJVi5mr8yCP2MM0OnMuE6EGU2cNwdmFb35Vgi8C1ssbisAEaFZJKIIkIBepB7Haq0yvDU6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9945a0d8-d14e-e500-d37e-3397652fae01@suse.com>
Date: Mon, 8 Nov 2021 15:54:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211103102059.19621-1-jgross@suse.com>
 <613fa1c2-5292-43b8-0261-2b26d7f65cd8@suse.com>
 <d4fd17ef-1f33-8e7e-7aab-dff326062fd9@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d4fd17ef-1f33-8e7e-7aab-dff326062fd9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98bd1e19-f59f-437f-ad80-08d9a2c7b02f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23353E9F4054F9AF63C2098CB3919@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmTyDy5+08th/kZU3Z6G4guE9g4pO/drG7gtFga3+wqPlHYp/OTevRYN1zGaPl4CojzLLJdFyb/Vk91ax1eawdHJbqoMsLV47UNEh0K3IUv8g0L4BaA7i/uZQY8yZXEKb05ehVQaFgVLuEvRtmw/BGAQjlr0EJ3WDB8UPOTgiLmOxCfjj83gNFW5lJ764oSqXgBPA7tzPX8/6NP4LyGDqUBY0ysIzBY6s+KD7kq0p3fI+Mpf6f0pEaiVq6jl16flSzmMFQcY95ZzKJfT8QSN6PSsYzkgYI2VeSrFDq/nNA7/SNaiux20PX1k5bjWqXJTR+DdySAlqX/kfXkmFm9TNRuGvLtKc8d9Z/Hu5nmAZ7IUX/d5HmSHXWt9qD4fTCs2PEbSBK7sv188whSfoUfLe2GX8dqtawu8wI7W2CgCZjSEXbnqpWfDPvrfQbKmXq+4r7luH1eCze3jT2ouaoZ3iC9r7PE8aDt2B2IKdbYw9DmzkEbge8RGqVizluvbe+slBP3sUhF0EHU/wmAWa5fGGTfCfapxDyepUwLboO4k8v0JkC08DoJd0HCLNGMoTuE8nhnofFFDtUOZ9vilKTl929uyZfww9T9HloCU8j0ALQT2+tj2oNwW/UmWygeg1yxJSIHY6C6Vl5BuvGWW1bhlsZoBA6sMTsjiWqtc8V4BjpW8ZBLIF6zlGZL6oV48YCs33f6TzyD/Ki5tDEbbrD3h7i1wUh6nrs0vyko1GBFUISY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6486002)(8936002)(316002)(26005)(5660300002)(2616005)(4326008)(956004)(86362001)(2906002)(36756003)(38100700002)(186003)(16576012)(54906003)(6636002)(37006003)(53546011)(66476007)(66946007)(66556008)(6862004)(508600001)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SStxRnc4T2JHY2MxVC9nYndrZ3JHZHFnaEJRdE1zNTlwUlpncm5kRGt4VSt2?=
 =?utf-8?B?REtwcHdiQnhQSHZqeEg2L0VNZ0tzcWg0am9SWmdFZkJZMFJPRFAxSXFJWG56?=
 =?utf-8?B?VHExN2RMNG80blRIU1ZyYTYzZkQwWDlySG84Zm56bGdXZFl2UXQwN3RkSnZr?=
 =?utf-8?B?aThxcnRFNitsRE93S250aW9SK1ZHWXhGclpoTURwVDJNbGN6NHhsNVU3NHFu?=
 =?utf-8?B?dTFENjJwUFpOUTJTUWl1Mk1ORGJMclYvWmdocTFybm9GejZQcmFRRDJkZVp5?=
 =?utf-8?B?bFpCKzVJYnE1SmdMVzdhVEVBclI5RGRGYUZqRUhhN2RZT1dTZGdHd1VSQldz?=
 =?utf-8?B?UXhIV1ZEMHBYSVNxQzY4TEpXV1NsSWZrbjJXR3ZjUVZ6dnllbHFodHZhMXNm?=
 =?utf-8?B?ZW1uMUJSZkpkb2Q1UHZMTGdIY2pNaUNEU3pMK05OM0wxTFdTejd6eTFDWHBo?=
 =?utf-8?B?WU5mNjVpVlRhZm9WWnhmbjhWRHlsYzNBeWU0OVFQSEdOblZBS0VlLzdtMkRx?=
 =?utf-8?B?b3Z5NFpGODlQNnk2N0kwTGRySmNqdDNNZzBDaWtNdHRqbGFXMEdFdzdyc0Ni?=
 =?utf-8?B?OEVXNW1CcHA1NHcrd2JLWEM3TW8vNmNNSFBHS3c1bVJkLzhoNDZ2YjgzTlhY?=
 =?utf-8?B?L3hHQXhSUVdKdXpzK2dRT1AyMjZqTFZubDUvZk9nNGdxTjBrNndnNUpvSUhz?=
 =?utf-8?B?cWFBc2lBMXllN3ZvVUxoYW1sdFhoYURDbTM2Skt0YVpwbSsvbWhJM3kzaTZY?=
 =?utf-8?B?SHZZZG52ZTFqUHNLZzk0Y212SDQ0Zk04NDZOaUdpRENwNHhnTFhkSnFBZDJI?=
 =?utf-8?B?Y0pObkNOZEtmOWtJSmxNU2t6ZzdsUjdFbDl1TFpqSkt3YVhJeXVUU2VVdDQ4?=
 =?utf-8?B?RTkwWGYvanhkKzd6Y0RITHdPYmhVbEp0cFQ5NlBSbE5OcWo4akl4aFNQYlp0?=
 =?utf-8?B?bVNpK2ZrSzIvcXF1WmFhTGhkUTlEOEwxQnlWZzdRVEZ2SlpNdW85eGc2Mm5V?=
 =?utf-8?B?VWtKa2diZyt3M2J6c0g3ZU1wanVJYTBGczg3RjVEeld2eHNEOExWNkphZDBn?=
 =?utf-8?B?TENMY0ZZdTRseUo2V3R2bkpVU0FMbWJKUFBrdTJWcWllS0RmdkFKaVByTmYz?=
 =?utf-8?B?bVZUbHFnMzNYODRUR2hCMUl1S3hEbmszYWhZWElCc3hseERnZW1ja0NlTU1W?=
 =?utf-8?B?Nk1UdW5CaGl1djMyekx6QlQ0R1VyYklxbkZYK3RXd0YvWjdYbzBkbnphZlNW?=
 =?utf-8?B?TWltK2JyM0xweW1qRkdKbGREeGg4M0hFaGtQWEpuWnJueXVWNzZtdHJiQ2dF?=
 =?utf-8?B?YmhTMmdKZmR5bUJvMlQvSnlyUGpvbXlHSXplV0krazBodkJydWFHa1RkVXI1?=
 =?utf-8?B?eXphK3pNamxaZ2llN09YUWx6dWVNSE50VFVKaSt1Sk1idC9xS3E1RkQ1TmtT?=
 =?utf-8?B?YWF0WGk0V2JpdlM0eHpnUnBNUU4xOXd6eS9NQ1ZSbVVSMkVRN0ZWcDJ2emxD?=
 =?utf-8?B?QmIzZG00eUZaN1BjRUE5U1dJWXZMOGk1WkZoSWl0a3VkQU02V0VNK2VrL25P?=
 =?utf-8?B?K2Y1TWhxaGE5Ukpnb0hHWlIyRWtJNlNzSnNiNlBRcldtSGVDamNDWitGT0Yz?=
 =?utf-8?B?R3VEVDZSRHNpalZqZEVvSm8xdzBILy8xYUJyVjdNY2U2WlJoQU1RRGlRVGVK?=
 =?utf-8?B?TXN0azFqU3ZBeHhKcDF0SXVWLzhQNWhkNnloNkhNUDYzWXArV0ZnbFZJWGxG?=
 =?utf-8?B?ZXc5ZEV6NS9wdERGMUV5ZVNZUGlqM3JIdlNyeFVnTWlYNHFnSDg5bzRpTFRo?=
 =?utf-8?B?c2M3R0x4dG9QMmhXckdvZkVaay9SMlJHTFpYdlhoTWhaNFRTaG9sOG4yY0RL?=
 =?utf-8?B?cUlUSnJ2VzVvbXFDNWRoTHVVNm9reEtIYld2T1ZHT3k4MHU5UEd1dkN0dEJo?=
 =?utf-8?B?UUZPMVRYUGhidWovSG5RQ2pnVCs0dDhCak1RT04yNVRBQXNVd1FmMkNBalA1?=
 =?utf-8?B?N0ZLdW5JVWVnRzhldmhPalJUdGdqMGl3ZVJ0UUNpK1FiUExMdnRucmJldlRt?=
 =?utf-8?B?U1kxd283QjBaOThWOTdpUERRRjJvSUN4VG11VVlaMmFlVVJ6TXdGdEFTWHln?=
 =?utf-8?B?dmx6ZTc4dDV3dmRWWUg4Y2R5WlBvbEFqRkw4SUhoZHlPUVVSNlAwSVptYXNq?=
 =?utf-8?Q?L4JmGVonlIhTdKmcSX8ZkLE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bd1e19-f59f-437f-ad80-08d9a2c7b02f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 14:54:38.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1J2DQtfDGdpRgP4kKCL3FQgmHbj5AP3gViPmNtMzslF9l2bD6jO2c4/HErePGaEaoi43GY9+UsChxFeXuTrPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 08.11.2021 15:42, Juergen Gross wrote:
> On 03.11.21 16:42, Jan Beulich wrote:
>> On 03.11.2021 11:20, Juergen Gross wrote:
>>> +# Generate the output
>>> +END {
>>> +    # Verbatim generated lines
>>> +    for (i = 1; i <= e; i++)
>>> +        printf("%s\n", emit[i]);
>>> +    printf("\n");
>>> +    # Generate prototypes
>>> +    for (i = 1; i <= n; i++) {
>>> +        for (p = 1; p <= n_pre[i]; p++) {
>>> +            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i]);
>>> +            if (n_args[i] == 0)
>>> +                printf("void");
>>> +            else
>>> +                for (j = 1; j <= n_args[i]; j++) {
>>> +                    if (j > 1)
>>> +                        printf(", ");
>>> +                    if (ptr[i, j])
>>> +                        printf("XEN_GUEST_HANDLE_PARAM(%s)", typ[i, j]);
>>> +                    else
>>> +                        printf("%s", typ[i, j]);
>>> +                    printf(" %s", arg[i, j]);
>>> +                }
>>> +            printf(");\n");
>>> +        }
>>> +    }
>>> +    # Generate call sequences and args array contents
>>> +    for (ca in caller) {
>>> +        if (caller[ca] != 1)
>>> +            continue;
>>> +        need_mask = 0;
>>> +        for (pl = 1; pl <= n_prios[ca]; pl++) {
>>> +            for (pll = pl; pll > 1; pll--) {
>>> +                if (prio_list[ca, pl] > p_list[pll - 1])
>>> +                    break;
>>> +                else
>>> +                    p_list[pll] = p_list[pll - 1];
>>> +            }
>>> +            p_list[pll] = prio_list[ca, pl];
>>> +            # If any prio but the default one has more than 1 entry we need "mask"
>>> +            if (p_list[pll] != 100 && prios[ca, p_list[pll]] > 1)
>>> +                need_mask = 1;
>>> +        }
>>> +        printf("\n");
>>> +        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5) \\\n", ca);
>>> +        printf("{ \\\n");
>>> +        if (need_mask)
>>> +            printf("    uint64_t mask = 1ULL << num; \\\n");
>>> +        printf("    ");
>>> +        for (pl = 1; pl <= n_prios[ca]; pl++) {
>>> +            if (prios[ca, p_list[pl]] > 1) {
>>> +                if (pl < n_prios[ca]) {
>>> +                    printf("if ( likely(mask & (%s)) ) \\\n", prio_mask[ca, p_list[pl]]);
>>> +                    printf("    { \\\n");
>>> +                }
>>> +                if (prios[ca, p_list[pl]] == 2) {
>>> +                    fnd = 0;
>>> +                    for (i = 1; i <= nc; i++)
>>> +                        if (call[i] == ca && call_prio[i] == p_list[pl]) {
>>> +                            fnd++;
>>> +                            if (fnd == 1)
>>> +                                printf("        if ( num == __HYPERVISOR_%s ) \\\n", fn[call_fn[i]]);
>>> +                            else
>>> +                                printf("        else \\\n");
>>> +                            do_call(call_fn[i], call_p[i]);
>>> +                        }
>>> +                } else {
>>> +                    do_switch(ca, p_list[pl]);
>>> +                }
>>> +                if (pl < n_prios[ca])
>>> +                    printf("    } \\\n");
>>> +            } else {
>>> +                for (i = 1; i <= nc; i++)
>>> +                    if (call[i] == ca && call_prio[i] == p_list[pl]) {
>>> +                        printf("if ( likely(num == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
>>> +                        do_call(call_fn[i], call_p[i]);
>>> +                    }
>>> +            }
>>> +            if (pl < n_prios[ca] || prios[ca, p_list[pl]] <= 2)
>>> +                printf("    else ");
>>
>> I think there's a line continuation escape + newline missing here.
> 
> Yes and no.
> 
> This can either continue with another "if" clause not wanting a new
> line or with a final ending statement (either a "switch" or a
> "ret = -ENOSYS"), which probably would want the new line. Adding
> code for handling both cases is possible, but I'm not sure it is
> worth it. In case you are preferring an unconditional new line,
> this would be easy to arrange, of course.

I'm not going to insist; it merely looked odd to me, and I was
thinking that the alternative would overall look less odd.

Jan


