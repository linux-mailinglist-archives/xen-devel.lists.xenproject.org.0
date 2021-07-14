Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF33C7E8E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 08:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155936.287806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3YPx-0003rr-Ni; Wed, 14 Jul 2021 06:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155936.287806; Wed, 14 Jul 2021 06:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3YPx-0003oc-Jp; Wed, 14 Jul 2021 06:30:49 +0000
Received: by outflank-mailman (input) for mailman id 155936;
 Wed, 14 Jul 2021 06:30:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3YPv-0003oU-Cs
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 06:30:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 052d0fb6-e46d-11eb-87d0-12813bfff9fa;
 Wed, 14 Jul 2021 06:30:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-wi9RKlApPLGS6pGoswfJkA-1; Wed, 14 Jul 2021 08:30:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 06:30:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 06:30:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Wed, 14 Jul 2021 06:30:42 +0000
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
X-Inumbo-ID: 052d0fb6-e46d-11eb-87d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626244245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PiuDjLX2tINXktLSjRM7OutzrwBcGfmB1V6mt1Y6zhY=;
	b=aCwfqkm1yXKhnHn3SYDdEltReOLLVX3QzCezstIYC25IAEjZib0hvLglvgGjNeRCpZvLbM
	esoykvbNp3vGBcPnhOVGy/UFz3z7037s2RnbXEgiEvIxI6n7ZhYGToepvNBvzTRrA5ruqN
	2K3Ysbh3NebXRNWXyu+FQfNIYuFi18A=
X-MC-Unique: wi9RKlApPLGS6pGoswfJkA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjnuCqB933axmMkWLI+P7nmaKjqNEuTmxGk6L5t5LO4z6IOBMyXS5Z17cfunMeNqQWW+dtJkq35NGm02TsQy8P8DyzR7R6hZfovEBbAZcx+2e8wc7IEQPBnCjy2CPZCgng2T7WLfHi8jU9LwuSGfSLDPCYQ6vEi1+RY6cyFXGHPtRF/e1rGnAnpa2xkSRxbNBaiGLCLcb0p+A00IKjsO4liL0ZBfqzgdTqyr5vVpdDdSG3nZeA9C418+OV1q1MbOQeKI8sZkhXYlxxSXZfNgy0DCSUBiX2FUyp14K/if1NF5EsEhtQoteYcdvVLATEp1fuXT/PMUUy3iLS1PJFc+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiuDjLX2tINXktLSjRM7OutzrwBcGfmB1V6mt1Y6zhY=;
 b=MJlbCfvftxaJMKX/pxoYVwfia2D0Du9z6i3qey4aJxfUB9RzJmZSUWBOFVZPLmhiX0RKVOIxSJ4yYD3qWPpbN4kNpfb/7wirJ10fkEE4WMNUocH70gVuXYlfv72OxMWdh7zxu4jIop49aPSm3iSxsyzjS2RFPwIsS9avmIhua99PZ6P1cmfIprxZQCbbBQR5EphvVKZe9758O8vAlKHCW7+g8GFjHNSXAnD4eC7yb2agB3kyAYl1jyXIy1og0I39hFvI3aEyaQ0kRbyQFm1sYsUnge6dzvbFsGOczVQm+/zvrvn4UU3/QM+bnwXFlmPkHiL4oM+FEwDiv/5HftUSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH][XTF] XSA-286: fix PAE variant of test
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6f4bfd1-791f-8191-5cce-6c98977a5175@suse.com>
Message-ID: <ae282966-4e78-e63f-4c47-c32eb5c56720@suse.com>
Date: Wed, 14 Jul 2021 08:30:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d6f4bfd1-791f-8191-5cce-6c98977a5175@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f17934-3c38-4003-2d19-08d94690e783
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41896B0412AD4B32AA97A113B3139@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3HKWTtm4Rw84I0vwbkxhYgAhydTXgyoHBvfpDqJV1NCsJQiVO9HR6RsYvlfUlq0vFCplKxZe67caVGEQ6S6AW1pQqi2Rf4dnB5rux8gll+rCielaFr2ps4wvJy/Aywq3gbM/CUqTu15pEC3Kuv+NjMMObE4PI7UYY7r70JdjP6vHEftxKu4D+Qcs8ICu1RKSXeosQX7xX40aLABfA+ylS6MuNbesFBAiEvL7m5RoftoUTTHY0RJ/cbVsSBQlQQXnJu3v2nK85Yc3xxNntWoWl7pn00V9QGpasoeRFajWf8/T7W0Pms5KZrdpXvWXkXOlVDBRQq7dxvy3P4qyTw6Y4PP4l3rWF/zpt9J+EiI4nuFX9t+Ge+NhmY3nY3EO3tKXGFfKVMrgx2exlr5KM9p6uysT3eMm8ixINgggQEbo697OXgqWSmtT+TuH78NAS5Ee7lWy6AhQCudKmGTXClV/xw4Sj4nH7o0oWi3ohLBe2/VwSuyVAZ7F0kXs7ImlfnAh/NER2yhOGUD3utj+PjL++Vzpud4tO0FrWQdqfBiYtS+zOn2CqTfeez3g1PslCxZrH884iTqDToW0BBvRWjMg+rbtoFKl0v0Ra4Nv5OubFn5Eiuj8aQj3od3FHtr5/Scw/KJbVP/UK3k3gi/oCEqJSr+nKyJ2yIcfcP5lApR5pZj/VNu3YGIDgHFHXSpJPjD+K8zH0/+8F7rLvCYjd7bu6oQ7rt3zyaD3iGKpk0i/qSarwJbtdiyU2KIndg3x6i0f2PxsZ64gpGwdLsHGxnNAWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(39860400002)(366004)(83380400001)(4326008)(186003)(53546011)(5660300002)(6486002)(478600001)(86362001)(6916009)(36756003)(2906002)(66476007)(26005)(2616005)(31686004)(316002)(16576012)(8936002)(38100700002)(66946007)(8676002)(31696002)(66556008)(956004)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2ZCbHVwM2ZaM3c2TWxkcHNJTzR1ZzR0VVR2aEdKekVDQ2xHcllIVGR4WjFM?=
 =?utf-8?B?YXdsYWtTYzhUS3dwR25PNnpQS2t1bCsvTzZpK2E0NzAvdjRIT1Voc1NOeVBX?=
 =?utf-8?B?N2tPK0lwUWF0MGZGb3d0MEtYZ2JGOHdsMUt4V0NMQ3NaeEdNaEUrVnp0cE14?=
 =?utf-8?B?VXJ3akxSODgzOWtXNm5QaVNVWGh0azVraWhLWjlHT1crUXN2amN6Y09tQWJP?=
 =?utf-8?B?UWxyMmZ4OFpRd1A0NEFIZEEyQWNsdzdWQnpKS0JJaEl3WERETGtlTUt5UTha?=
 =?utf-8?B?enZZWDVZRHJ1SFNQSHJZeldMaW41dWFybHNCRy9vcEZjZCttOUloNlZjWVBO?=
 =?utf-8?B?eDk2UkZOR28wRVd3cUFVQ2s2Z1JianFoQXF5bXd4WE9rVzlGeE9VWDhSZzl5?=
 =?utf-8?B?Tm1CZGVoQzBYeUQxdnB0aU83ZzlpZEVMcTVtVDFsSzZIeU1iUDU4RGdvSnN0?=
 =?utf-8?B?LzR0K0Qyc3RtNyttOXAraGZuWDVPMjBTWUl1VXNRR2FzTFZLYXViY3NPY0E5?=
 =?utf-8?B?ay8vNkpVNW56T3BUcmlZVk9YTy9GRmkvb2VJYVNoSjZNY2Z0VnN5aTZWeHN3?=
 =?utf-8?B?TVNSL0JQYVpUSmlaRDNwaVRYZFo4Q1FwR0lSdTE2SjViVWdiTTAzMTBjWG5x?=
 =?utf-8?B?RVdRWjJMdytQWHZiZWE1bnNYNi91S0pPakUyaGI5OVpTTmFHbHNsalZqd3E3?=
 =?utf-8?B?eXhjejg0MU03aWdISEV1ZndSbzdWSStKYVN5RGpwWjFwd0dsZVdjbXF5NERH?=
 =?utf-8?B?VVNLMndudnB1U0lWTFJBcGtGaFlpTThZaE16SWpzanpBMHRMcWwzZFIxZWly?=
 =?utf-8?B?ekhXYm1jZ3AyM3drMUhvS2NWVnNZcWtmcGlSbWJVZ2ZSM1JGMVlhREQyMVIz?=
 =?utf-8?B?NXZLK2E5SzZ5UkMzMTB2MnNFY3N3cjhhY1NtSjEyWjhFc0JOVEtkV1RJU0Vw?=
 =?utf-8?B?SGUyOCs4bG80T2F1RjFEeEQ4dUhzaEpZZG5WcXZtMkJnek1uME5ncVVtZFJR?=
 =?utf-8?B?WDFySVYrdWVqSVZhYThRRiswL1ArR3E2SWorYm1OY0QvMDVwUGw5dVB2Qm5p?=
 =?utf-8?B?SkYyWWRmdEFsZE9kV1Z2SFM4SGkxb3g3akpYN1VQUHJ2MGhwMjRNYVkzTEhQ?=
 =?utf-8?B?Vy9mN2xUTjFKTWRCNks1MWFxdDBmZ2tYVjRDWXB5Q0orRFliZ0ZJTUwxSEZ2?=
 =?utf-8?B?d2dnVnVtbWlSY2hENUxsN2x0cVJlVVFuaGxiTWNrTmpoRG5tM3B0aVpmS2t4?=
 =?utf-8?B?cFBmeGhhcUhtbTI0emFkcmgvYjZoN3RiSnloNldnMFE3TU8rdHJ6a2RlM085?=
 =?utf-8?B?Y0VDNmJxWWFVVUFwTEJGd1ErNWxjWURoaG5acTdRaDhuWGFVVEQyMnAwTlRh?=
 =?utf-8?B?MDhWVUNQaTJTQ3FYak1jbGpqaHFPdVZXaEMrdmRycDR6ckdPS2lSc0Y2V2ds?=
 =?utf-8?B?eHVKcDVaM0NPRFpPWmFMcVVESzUwSXhHYUNqUzd0WXpKbHJyMzVLUFJTMTI5?=
 =?utf-8?B?QnVkN1MrTzcxdGVyZTJ2TmxsZkFFck1iak5hV1VqREdnV0szcUpsa0JLWUtG?=
 =?utf-8?B?V2NYa1FLV2RJNDlWbU1uUWJ6b2g4eW81ekxucG1sdjRUNjlicVJIdVlTdkRU?=
 =?utf-8?B?RmMwQURrNDJQaFZ2UFVCcFErS0FUU1pQNkVJcDdSWEtjVkZpS2hJWW03bkFH?=
 =?utf-8?B?SFh4VVFOQUtmWVBvZWVuMXlnWXNsUmVEenFOMytOa21vQ0hyU2h6TjJLekdS?=
 =?utf-8?Q?AKjxzbkLLE2IBPyAdCFfqbTlixvXiBDGRrznCMv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f17934-3c38-4003-2d19-08d94690e783
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 06:30:42.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/bygouKb9k9C0LasnfMTVFFlgBAvgwpgjurKTUnP7l+MSMITbEK8ZcfDdZrMuKE/rVBVJ5bws8bWVOQtJbZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 17.05.2021 15:22, Jan Beulich wrote:
> L3 entry updates aren't specified to take immediate effect in PAE mode:
> On bare metal, only the next CR3 load actually loads the PDPTEs, and a
> 32-bit Xen also wouldn't immediately propagate new entries into the
> PDPTEs. Them taking immediate effect (leaving aside the need to flush
> the TLB) on 64-bit Xen is merely to not complicate the hypervisor
> implementation more than necessary. Guests cannot depend on such
> behavior, and hence this test shouldn't either.
> 
> Insert the hypercall equivalent of a CR3 reload into the multicall.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> With this, cb199cc7de98 ('Revert "x86/PV32: avoid TLB flushing after
> mod_l3_entry()" and "x86/PV: restrict TLB flushing after
> mod_l[234]_entry()"') should imo be reverted from the Xen tree. The
> claim was wrong that the test was correct and hypervisor code flawed.

Ping?

I know you've expressed your disagreement with things stated above,
but I'm afraid you're still on the hook to actually prove some of
the claims you've made.

Thanks, Jan

> --- a/tests/xsa-286/main.c
> +++ b/tests/xsa-286/main.c
> @@ -128,9 +128,18 @@ void test_main(void)
>           *
>           * - update_va_mapping(addr, 0, INLVPG)
>           * - mmu_update(&l3t[slot], l2t2)
> +         * - (PAE only) new_baseptr(cr3)
>           * - update_va_mapping(addr, gfn0 | AD|WR|P, INLVPG)
>           */
>          mu[0].val = pte_from_virt(l2t2, PF_SYM(AD, RW, P));
> +#ifdef __i386__
> +        mmuext_op_t mx[] = {
> +            {
> +                .cmd = MMUEXT_NEW_BASEPTR,
> +                .arg1.mfn = read_cr3() >> PAGE_SHIFT,
> +            },
> +        };
> +#endif
>          intpte_t nl1e = pte_from_gfn(pfn_to_mfn(0), PF_SYM(AD, RW, P));
>          multicall_entry_t multi[] = {
>              {
> @@ -153,6 +162,17 @@ void test_main(void)
>                      DOMID_SELF,
>                  },
>              },
> +#ifdef __i386__
> +            {
> +                .op = __HYPERVISOR_mmuext_op,
> +                .args = {
> +                    _u(mx),
> +                    ARRAY_SIZE(mx),
> +                    _u(NULL),
> +                    DOMID_SELF,
> +                },
> +            },
> +#endif
>              {
>                  .op = __HYPERVISOR_update_va_mapping,
>                  .args = {
> 


