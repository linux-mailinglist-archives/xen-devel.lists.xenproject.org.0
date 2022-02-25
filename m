Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF34C4252
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 11:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278972.476468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNXsQ-0008CI-QQ; Fri, 25 Feb 2022 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278972.476468; Fri, 25 Feb 2022 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNXsQ-0008A9-Mx; Fri, 25 Feb 2022 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 278972;
 Fri, 25 Feb 2022 10:31:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNXsO-0008A3-Us
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 10:31:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07f2cf17-9626-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 11:31:03 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-DvPCMrKANoCMnmgTjAYG2Q-1; Fri, 25 Feb 2022 11:31:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5266.eurprd04.prod.outlook.com (2603:10a6:208:c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Fri, 25 Feb
 2022 10:31:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 10:31:00 +0000
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
X-Inumbo-ID: 07f2cf17-9626-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645785062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POXQsCTEhKU9rL1NFnJ4gkLf2nr1Wkc69qpMY9fYofg=;
	b=O7UHfGKGNAgQya5AbLuo975cgwUFGL4mHHXJrdsuQMi72aoIvypFJQr6N1s5nB1xXFWgiy
	RlBG44ekCQGbMcNoi/1hno7hQXrMlyNjEvikYberXVjjhaQUk4ePqT6LbpvMNW4c7pA+ud
	xI77Xc1TH2qcSm8p0uH2rh/ifJpYHD8=
X-MC-Unique: DvPCMrKANoCMnmgTjAYG2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlFtQYSrfYWaaBJpWIpLujZblclFGt0I/VPtLoF/JZ9bpEgxZEmXaBIM+uQgmMIThypZ9i/krpVDhjIW+UtA5RhjtgEg46oige28Ji9Dz1A7wtW7YxyrL+vdZ2L2jT7dg+eVMw7VDb9qUnY6lDBRzl4RuZMns1YB+bO64GXj65ca6YwPJyF0ZtoL/rnrioVaUTXKS3fSyY/DmEj2aq93U/sl3yV8DvchNSJ2mpAfDQlPaeSD6H0a07IC82sAhWyjQXo+1JBCK5kzbU2dOlhxUvZuwt7W6ZV/KKEpP3ajdkUlZyUkOYG2vp3tvloHhnPzXiPeIWWz/1C9jVLEPrh1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POXQsCTEhKU9rL1NFnJ4gkLf2nr1Wkc69qpMY9fYofg=;
 b=S0WKZMol6F4xlhM7fTzSa6WhxbO76o2yuCcDjtu6ZqjHPCKw78BptexMx8V3015zzR/MsygjUDcBpBXBZpCAKFmYcQIFotgVLY6pltyOijdGByXXfReuYwdtunKLHXCaf2ynX2qqdElMoJTatInUsBTNUVw7+tgTIdPvBc893j7oAZMZnUUd6+Srzh1U/hSwV7m7XvZ8pVl+NftEzoQdvjLyO5hBlB5AF4TEDhcLbqDJWIDT0w8mLG3Ji0rpbKzkxhVCE03aW21O4hViz4wtQd6Vkc8uFAjQeZ/uT3qgA+vedxDsZOgjTzKHK0fI74XVv2OkBGqfjBAHaia/nUPCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a27ff4b4-37ea-7bbc-eb43-6c4e6eb9277b@suse.com>
Date: Fri, 25 Feb 2022 11:30:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
 <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
 <cade3f06-4f25-07d6-3090-08a6487ba298@suse.com>
 <2295bb1c-6298-75b2-5f51-80bf114e365f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2295bb1c-6298-75b2-5f51-80bf114e365f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3fa4f27-70bb-430c-593d-08d9f849ea6b
X-MS-TrafficTypeDiagnostic: AM0PR04MB5266:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5266C2921BB73A8593FD4CB4B33E9@AM0PR04MB5266.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pQp7nxUkTRpea91TTGPvKWQBRUid8TMqKqSTpheoemGXC9CKwC6dxU7jtyePwDeqxg+3Wt09aWUfK/MJC9uUeeU6mKAiUcbFdaJIGVuK1zpOGzP6mfID0ZiaGSAY8GcshaWLXZiDX/wPMxBRPnw0x2Nr/4fWKpNZfc6dgy31k3SQLQW5pzG/HwHdzqBXYjL5M4zR0WnARQA368M2F9eupQNEAc5nahFLlQITJLmL3ZBprPewizKbX2AXvZLwW629QAN9iF+tBVPeUs4Jl9cbcSsJxxx7a3WGUvQTXUY6pa/2OJEnvpjtkft4BYyRR4eBalqT4kKrPprh9EO2a5kSdo3loKRlaE0kLC1HfBEGcA/FqwRmro9hBPpTkpsvK3OqOTm5OeeZwsgFYT5bBVeMx4NZyZsSNTBHVJjrUcndL56wKH7q89bOsfai5YjHJwZxVbi+5EYluLm3X8LQLEqYfQNzqlSxLKq2bYyvbsKWal989z9UMXlNSgvw/vV3/JDVg1ho3u8IgDT9bh7Z52Xp8v+aDh/PpNO8uJZX9RZ9zw4eo2gald1kCCSW7UCIQALlXVETjdY0VlE/IzcGjI0R9G9CCrQZ5r+i19Snk5s4jJRh+bUMjEmcEw9zfHRppRBb+GGPbGo5hHZ1Ew4fK9Sucv8bhyVjU1hEENDYO0btrVp8M/yeB1CPNKdVcNBF/Q7AZRie41qcHJOQk57DOCoyF1OENfLA9BXDc1Y5pE8idmKq/tOwFJ+KLRGYffF9MkZj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(8676002)(86362001)(26005)(8936002)(54906003)(2616005)(186003)(508600001)(4326008)(5660300002)(31696002)(66556008)(66476007)(6506007)(53546011)(83380400001)(6916009)(66946007)(38100700002)(31686004)(36756003)(107886003)(2906002)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpBd292VjBDaE9VM21vZGh1U01QVnJ3dzFMa3BDNCttdVNOeVVxMHNnZnI5?=
 =?utf-8?B?a0VhQTRxMU81Z2lSaEdwaGN3WnYvTE5JZ3dtbU9rWDdSR0x2S1BUT3llb0t0?=
 =?utf-8?B?TWV5SlJIZWdBaGlNNkplSkJIcHdDcUdRTy9pNDJtWEQyc3NFejZnRUN6YjAv?=
 =?utf-8?B?ZjA3ekNNVVRJOWlSck9DVzVJTk8ySTZTVzg4VE1uOHp4a2ZwNElmUFNDcmJ2?=
 =?utf-8?B?VXlUWVdyLy95cTh5UGh1YzZxZzZ2dUc1VjZFUVEreHpZaXlaK1ZGelJmd3RE?=
 =?utf-8?B?TUdYWVFVTHhCK3pmdmVsek9wQVVmZFVKMDRsNENYeW9ONGpEUHJxYVdpbkdX?=
 =?utf-8?B?bm1rZFIySDVLZ0cyK3hxdit1c1MzckkrdWZtRkRIcDhQbGQ0cmQxWE9WSWhM?=
 =?utf-8?B?VGxJcUFOR2tCUzJOU09lT1dWZk0wL2k2MUc5UmRMRUJxa0VBbEk1Ky9uRmJu?=
 =?utf-8?B?WHZwcUxIR1lSMmNMeDY3aHNvdEpKTWtFRGVLR0RCTmwyQmk1d0dzOVp2VHZp?=
 =?utf-8?B?TG9KZDhNZnlHS0ZFUWswRmsxQW9kelJiY2xLa3dOTFhqNzFoa013THFpVWsx?=
 =?utf-8?B?OWN2SjRzZlhKYXYrKzRJOUZWVnBjTlpDa3VZd3RSWkx4OHVud3psV1UycVpV?=
 =?utf-8?B?amZDaUxPb0Z6VUhkLzFrQXVPbnlETkxHSWNFaHE0dW04c2VUNmdRaDAxSUFw?=
 =?utf-8?B?M1ltSGRjZ084R25ZMDUwbWFudmk3RnF3SzJ1c0dkUXVLdUhsZEhTbnlHdzc3?=
 =?utf-8?B?VlAxVTVxb3Q5REl3MWJCRGtXUGdNU2szeitSd2RsOHBPRE8yN2NueHVlQllQ?=
 =?utf-8?B?MEhNN2Z0eEpxc3pMK3Mzb3NiZmFTNGtXQ1o4SldmWjF6SElhaVY5WTkrOGk0?=
 =?utf-8?B?VFM2YytaRHZVQmFqbzl1dk1zTm9KaDhIRWhPVFVTb3FoOE03R1ZzVnJxWThq?=
 =?utf-8?B?MWJITFRuUk51TVA0WTFTcFo4cklxbGZYNVorM2prU1hObXB5Mm5mcmpMcUNP?=
 =?utf-8?B?c3ZYTkowMlcvMTVIRVg2aGczekNiK05JM0w0L3c1MWt1NkVrWGNYdm52TUhU?=
 =?utf-8?B?SUdGRFRyVUM0a0RZd0UyaXFUYnM0aVBqMHE0cGdrM2FPVHA3NHU5V2F6d3dv?=
 =?utf-8?B?WVVzWVpKSUd5ZEIxa0lneUtFdkdZVW5OQjlkT2xKcSt1cExFMmMwb1BIU3F6?=
 =?utf-8?B?cmZwbUxyVWhIWkRMOWdCSHppVkRtQzY0WHIxcTM0RVFkMG85cXBHVUJUS08r?=
 =?utf-8?B?bnJrME05eWpkU0phN3dadDIvR2FyVnU0b3ZrbjFSc3pLS05xQU9YNDRLVzZI?=
 =?utf-8?B?L3hWSnBnRjZUVSt5b1hHSUpaVk5IZXRReEpKN2ZubndpYmtiaTV0ejFCcklz?=
 =?utf-8?B?YVdpOGd2MGZkQ1BBTjlWUU9EejBlQkFVM0ZJTW5OZzloeGRROFkwNkpvUXFv?=
 =?utf-8?B?RmFDc2J3YmY1Ky9ZMklGR3JuYU9LUmJRWHhibDFuV3BJWmw3Mlc5UWhVWDB2?=
 =?utf-8?B?dXg2dUc2cmVWcFFoa2d1dVE2b3phTFRsREtnVEJaVG84dGtyQWl1NEp0ZkM2?=
 =?utf-8?B?elZNSGtla2U2Z3FBS1BlUkRLSTZsZUlOeGw0TXRGdElpYkN4L3kwNEE5Ulpy?=
 =?utf-8?B?QnJLU1NkL0NwVVBzZTVxOUJnTXZmOXB5ODV3OW52Sll3bkJlMERCNTdEOHBu?=
 =?utf-8?B?MnBURFVVSnJQUnJyQTJtRWVKSVpjS0VTQXZIWFhLV25LNCthS2hDenlKSGxZ?=
 =?utf-8?B?WlFLalZFQzhMTGhWZHJENkpmbzdzaEVEUEtNZml1a04ySmVvRE1Nblh5UWhj?=
 =?utf-8?B?bFM5Qk9OVWRHVHdlVXk5bGwvNTh6ekVNQkhuYVhwbmpsTk4wRnd4SmtsUzJU?=
 =?utf-8?B?a1VMK3JJL0licXcwZUFqVUdHNFhYNzMxMGE4RGpudDJIbzhSSmIwYkJMRHRK?=
 =?utf-8?B?bTR1ZTRxYUlCaEo3SWgzK1FoYXpRVkdvN2ZrbWJDb2ZSejczNmV3cHRmeXVB?=
 =?utf-8?B?a0lweGF5cm4zWDRnYVFGV29KS2NjQzdHNmJJTU9RM1N1OHh0WXo2OW1SZGFs?=
 =?utf-8?B?MXZsZTM4ZEI1czBtSFprWWZHMXhBYjJDS3B6aFVPWUJRbUZpVnRic0tJNnRH?=
 =?utf-8?B?NWF0bnFnZC91dHpMeWxWR3Y5cmhVWDc5N0tjeFNyTnc0anJkMkNoQ2puR2Vz?=
 =?utf-8?Q?EFG2OJo5IZBx+Crnm0cK+tk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fa4f27-70bb-430c-593d-08d9f849ea6b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 10:31:00.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wn83+OthBFPaCtvIai62T3BeGkLJITUh91J0ESmPKLWBFmvpQO636prAkcsCOnU8cO/jRUt7Vziz2NcGhXf0NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5266

On 25.02.2022 11:24, Julien Grall wrote:
> On 25/02/2022 08:12, Jan Beulich wrote:
>> On 24.02.2022 23:55, Julien Grall wrote:
>>> On 16/02/2022 09:29, Jan Beulich wrote:
>>>> On 16.02.2022 08:20, Juergen Gross wrote:
>>>>> On 15.02.22 22:13, Julien Grall wrote:
>>>>>> As a side note, should we also update SUPPORT.md?
>>>>>
>>>>> Good question.
>>>>
>>>> I'm not sure here either - talking about individual hypercall sub-ops
>>>> seems overly small granularity to me for this kind of doc. Plus I
>>>> don't view deprecation and de-supporting as the same thing. The latter
>>>> would mean to render unsupported any old XenoLinux which may still be
>>>> in use, all of the sudden.
>>>
>>> I understand this would result to unsupport some old OSes (not clear how
>>> old). However, from what Juergen said this feature is untested.
>>>
>>> To me it sound like we are not confident that we could security support
>>> this feature.
>>>
>>> So I am not sure to understand why we only want to deprecate it.
>>
>> Not sure what to say: Rendering unsupported however old guests is not
>> a nice step. Hence my concern (which isn't an outright objection).
> 
> In the past we have removed support for feature we deemed unsafe to use 
> and it would require effort to secure it. This is despite the fact that 
> it may be used in production (e.g. PV devices, qemu trad...).
> 
> So I think the question here is really, do you think we can sensibly 
> security support GNTTABOP_transfer?

I don't think it's a question of "can", but of "are we willing to". It
would be "can" only if we learned of some seemingly very hard to solve
issue. From a workload perspective it would certainly be nice if we
didn't have to think about this anymore. Yet like in certain other
cases, besides the particular item here I'm also worried of setting
a precedent which may then be used to argue for the removal of support
for other operations, just to make our lives easier.

Jan


