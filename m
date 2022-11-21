Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128EC6329CC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 17:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446788.702596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9qb-0006Im-KB; Mon, 21 Nov 2022 16:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446788.702596; Mon, 21 Nov 2022 16:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9qb-0006G2-HQ; Mon, 21 Nov 2022 16:40:41 +0000
Received: by outflank-mailman (input) for mailman id 446788;
 Mon, 21 Nov 2022 16:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox9qa-0006Fw-32
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 16:40:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f251b03-69bb-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 17:40:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8383.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 16:40:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 16:40:17 +0000
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
X-Inumbo-ID: 2f251b03-69bb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ks9eTSKH/yTsHTFmwW2TQ9W42ta4+y34Slr/0glkj84coLlBGlmm+qT/xITAy6ZCnQI89XF/sm2afnv3Ocj35KBzFf5tCMHwWZ06lYXxcQcBgux8u7dm6dCDCKXiaowhAcGKxw2h2p2TUcxK7Dgru3u/xryyUtc9jAW8SNbnQXBBymejj4eTFe8IOfVv5uExsikejQS14/0GvlBca5bPwvBFDiIykAAj18kXcPHXkJyZi4747VNUAUStLrEnwMtkcmDc5lUxyIsW9/vQ6xqSSya/CfanodNjluLAsnkN7DBTWV0ZHinvF7h7U7+D4LAi9mMNzOuxXmhABifg0fW5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpXqnltry/DVMttgSGxzUaNst09c34V5O+Xj2fwDYdk=;
 b=fQiPvkNhMV8fPDtUfwn14cU7pfPh/34+ltqAjNzxxnz/+MB5nZuRG/KtatUW1x2WbK6PceQDlDay1tiANp48tPyAim/mlOq0O/4fIBORqqTv2zGh8sJ9nMMLsV0FZFpSm3CKUB3CKJa0N3FKPpDkyAyETrGNmELJXf9XKOeEOw2DQSJ5ExX3B6CdnLJZ1ysnuncaSnDywnVxwLQHy98IWahC1kfpYm8srElbSOq1v51sxymS3G8yAdoePQ6w6Cykeg4rxot5Ks+RhkLRogGQWWriISK270xFzo2z3JlaZAs+QIUa9KVNapNU+xEXcIC7fCHobUcHvA8X4i5RroYqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpXqnltry/DVMttgSGxzUaNst09c34V5O+Xj2fwDYdk=;
 b=353c3JuPoopbemwO3m1H/hztousC5lfUF+vOYpkQbr34bsqlXYts1jKv92SZglxyQ3GjY1Jt6/8xo5xEK+Tnvx8/rHwt2xeXa2NRE5Y7AvWaHntVuMS7YHOfvKHQhpBew4OaTRCypRr9gPwz4aPZjRkGT9PKMXYXOQwWyPYzmyN4no0EitHuiSgY3CH5PwlUNzA+LMv+2zyCQKlK/+o076inxI2HOFP0vNCORBOF69V6Cbr89qIY3TJi5PpwtaTGbMcYrcsh57YvVEB5sqXAgQrO+YOjXu2xmg0btQECgg0hts99ooZfbJNdyuEndY58weBMD11tirorbQSjmDoEjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c07cdfc-888a-45bb-2077-528a809a62f4@suse.com>
Date: Mon, 21 Nov 2022 17:40:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-3-carlo.nonato@minervasys.tech>
 <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
 <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
 <CAG+AhRUEoJQGSw2qJmE1JFTuCMa_0sUR2+M2Zd8pkd+dgf2wPg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRUEoJQGSw2qJmE1JFTuCMa_0sUR2+M2Zd8pkd+dgf2wPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8fce05-1f91-46d2-e646-08dacbdf1238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j3Xr7b2+/ZKOwkZEDjESp2FJjbr7eRMFFKkebD8ARjv2W71hoOozX41u+l7kIZu14JNF2975WlKeyf3TrglP8wOf9iU2lnvADRAXknEGUFEpHGySasOuLZz7xtmXD9hRdlKuXW0pn7l1V6wy+/nYbH85w/OlBOCXtIx2ymwvYD3qoDvu4RshBc6i1U0h9CO7e5o2IbBPgXY6p4BsbSYY4S2CW8KQmB8eWSMaaiO9JY4LTOCu1yAu/hRarWNIZlLGz/nyWl4ypDmxHkbjc1o0m/iiwdiOkGhypa2v06fR5XiAIGWSSrLHHmzP5wdQCCfDzXh3W4+pVmcqS2OBZlBagaaga9g4frqKWcyfrAQ0m2kfYB/LC9XrrgUhFLZ6eGztzo+Opzz3ol+/DhP2vQkgCOjg3BKUVsXwfCVSK8/544URLAptZPrmv+rR0v1qTNvb+LD4HncF2XOeEnE8KPBoAsVcpHaGyhVU7oEFPPXXvSepf3prtVaD32K6EuArrJPp1Dr7ADCY/HgXLbgdjbPHv6GHa6b3eraGcl9yqDlB66+hemXbh4+R0kvOif2FJoUuedUr9cHT7XRfJsNH7H5enT574bOaG9dMShaooMIULv1LHCJ1Ngktuz5p89ojTEsVjb08+HKcnmhWmRE+qKnY2Ei/zWaA98imEUn5bBAhAegObnLYEAUUG7TE/Sg7bPWZ1T2Ex3yc5rEN4vHyEzkiiMprqvsf5SnVMG9+lnbNX5+gTA/gy/FQ+HqyEi/KK7PPbI6+XjHKUyLe2b5kSFeH7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(36756003)(31696002)(86362001)(4326008)(53546011)(41300700001)(66946007)(2616005)(66556008)(66476007)(186003)(5660300002)(8676002)(8936002)(6486002)(966005)(6666004)(7416002)(478600001)(26005)(6512007)(316002)(38100700002)(6916009)(54906003)(6506007)(83380400001)(66899015)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3VocW9uUVgvTHVBNmhqYTRmNFpzaTd4VVZtOSs5TzhrT0FGdFlMbjE2NXc5?=
 =?utf-8?B?YlhrYWRtQXpoNG9Camp5OWtvMWxuZXVDdk9WYVhycktOQm0zbHI0YWlYSVMz?=
 =?utf-8?B?b2hldlBYN1YxYjhKZ1Y3YTRmbHFIMEJDUmVoOVhnaXl3RGlKWnhIVWp4MzM3?=
 =?utf-8?B?Z3lJbDdBeU00Tzg4L0l1aG9UMkFkWDBNREhsTm9sNnpvc0tUOHJWY2IzQ0Ju?=
 =?utf-8?B?dFNQSUt2VldaNjBLWkFoSFB2L1RYTnpWWkdPVzltWHZXMGpyekJQQkZ4ZW1I?=
 =?utf-8?B?STl3Zm12Rm1LbDl3cjc0OGVuK2xzY2Ixa0VOZi9SdUt4Y3l6blpmNnJOODlC?=
 =?utf-8?B?eklFUUFqSURydUNmaFQ2dU5FQTd4Vno3Snp1ck9aVERPY1Z2MmpCL0NtYVZG?=
 =?utf-8?B?M1k3YnFYT3o0ZTFlSWZvb05qeXROSjl2U1RGemovTjc0SllxdEt2UFA4MU9M?=
 =?utf-8?B?ZnRPMklSVjRmTXlHQytQekVJVGlaQjNUVVlpZUx2UTdLT25KSGhIQnFTa1p3?=
 =?utf-8?B?Uk4rZzdod0ZWSHAxMGZ4SkpFVDFrWDFUNW8rYk0xSXlMOE1oZWlmT1hra3k3?=
 =?utf-8?B?WUlPbVltWU9xV3BCWmtZVllxWWNQT0tWMWNKL0VQMWlhQ0xTMmJQNDVxcm44?=
 =?utf-8?B?NVFsOEpwUXR2OWpmNjVzSjNTc1hUZjNFd2psN3htQmIvWXhtYnlQTEsxTmtD?=
 =?utf-8?B?Y3IvK1ZEbE1TVi93RW1zcC8yZHJDREdIaENUNUZLZS9lQmhsV0ZyQUI2Q1Ar?=
 =?utf-8?B?R2Q4SmhCU01kN3dDK1NIdWVFL0cvaFhOTVRDbW5pSHErMklkNGNrY2MwMUp6?=
 =?utf-8?B?Y2hZU3V5NjNZZWVnMnA4VGlaYnBBdUdKSFp3VmJ4c3crYzVKR055MFlkR3Ez?=
 =?utf-8?B?UWsya0tmUFdOTjZHeFRNMWEzL2lYaHVDdGxaVnM5OHAzYVZMeVh3L2srSlpB?=
 =?utf-8?B?Y1R2MXl2YWNyQUpvVkw1RWd2RG10TzY3L3BzbUc2ZnJZOGE5ckdab0QweG53?=
 =?utf-8?B?OFgweS9nUDdIbGoxZHcySHk3NktGWjcvK2poWG4yNnVBQk5WN2FZRUZlUnJG?=
 =?utf-8?B?bXNMRjZMTWFIM25hMldBWDNhcDVlQVNKRnhta05QL0lSWTcxZ1NqR2NIZmhN?=
 =?utf-8?B?TTgrMThEK25TNlhGcjNCeFFSVS9IVnV6Zk5zaW00T2swOTRudXJZdzBmbEo2?=
 =?utf-8?B?aVQ4VktiN2lDSGlWTkIvbTR4N04yVWtXbnM3UkgzOTd0alFaeEkyQ0VjZ2hy?=
 =?utf-8?B?YnUrZ3ByZ2dzWmZqUktjMTFPckoxODRvb01ydllKejZjUzhZbktHM0t5VTc0?=
 =?utf-8?B?VmVUVTRrd2FWSnZpdEIxaG9QSkY4eTJjbmwzLzJpSVdkZjFORGdnRXFuRmRr?=
 =?utf-8?B?dURFUldsak1Sa3cxbVZqODBaTUdOMldQd3Q0bWlnanJNR0hSUDVZU3FjRTly?=
 =?utf-8?B?REYyTGx6Y0M3QUFBNnhGN0N5ckJBdXVraExVajdEZmZCWWFZWFA4a0YrR0Yv?=
 =?utf-8?B?MWxLYkdjMURqenRRdS9ZNWFtaUQrZjJkU3gvQTYwUHFVSVdvREFESjcwd3pu?=
 =?utf-8?B?L2trcmtxWk1SMHd4RzlZQnFSRERuVS9NRWtkazYzM1Vxd1VTUkI4RGhpV0NN?=
 =?utf-8?B?N3dOTWMya1crNzZDK3d5N3lkRmJpN3V0VEZOMVZIenkyeGw5UXUvRkowa1Fh?=
 =?utf-8?B?SVFCTGJkMlQyOURyUktXY2x6UDkrSXVIQTVXczI0UzVib0M0b1pKcWhhY2ox?=
 =?utf-8?B?MEQ0K2NCWFVFWGZNc0kxeVRpR3lxNWJNSWYyYk43VktKbTl5TG84Y3NsVlM0?=
 =?utf-8?B?ajd1blJ6VjFpWktWN1JmRHlHeWhkSlNmZlBoZW1KRllTN1gzUlNUeDhkSTds?=
 =?utf-8?B?Y0d0VUVKc1lpdFQ1SnpRLytMM1RHc1VpK2x1aWJBMDZHVHF5LzVyWk11TWYv?=
 =?utf-8?B?dFZMZm9tTTdjbldoaEEweUNKdFhiL2hHbmZJQURpTFI0UFB6eXR2YjZIYjJI?=
 =?utf-8?B?cmF0OHp0ZWFPZTVmbTByQllNeFJUVjQyRTNOYjJGOUhMOThaRUQ5Ymh0Nmh6?=
 =?utf-8?B?bHhKN0F0NjlsNkRtTmwxVUJmaDB3YTBsRHdFeUFaTHlab1RMalRhWTVNQTQ5?=
 =?utf-8?Q?hqCZyUbanbADg0Cx8znR5/M3V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8fce05-1f91-46d2-e646-08dacbdf1238
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 16:40:17.1304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqmm1RDr9BhoHdEBrCne2zK2kGkiNh+9lFLk4U6Iy1DsHeyQ2hFXe90+3EKrBywuISqKqfQCK3Ep2AS+y7DJyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8383

On 21.11.2022 17:23, Carlo Nonato wrote:
> On Mon, Nov 21, 2022 at 4:14 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 21.11.2022 15:50, Carlo Nonato wrote:
>>> I want to ask you some questions about this patch because in the previous
>>> version me and Julien have discussed how cache colors should be passed in
>>> domain creation. You should be able to read that discussion, anyway here is
>>> a link to it
>>>
>>> https://marc.info/?l=xen-devel&m=166151802002263
>>
>> I've looked at the first few entries, without finding an answer to ...
>>
>>> In short, using struct xen_arch_domainconfig works fine only when domctl
>>> hypercall is issued. That struct contains a XEN_GUEST_HANDLE so it
>>> should point to guest memory and must not be used when creating a domain
>>> from Xen itself (i.e. dom0 or dom0less domains). The easy way to go is then
>>> changing the domain_create() signature to require also a color array and its
>>> length to be passed in for these latter cases.
>>> Are you ok with that? See below for more comments.
>>
>> ... my immediate question: Does supplying the colors necessarily need to
>> done right at domain creation? Wouldn't it suffice to be done before first
>> allocating memory to the new domain, i.e. via a separate domctl (and then
>> for Xen-created domains via a separate Xen-internal function, which the
>> new domctl handling would also call)? Or do colors also affect the
>> allocation of struct domain itself (and pointers hanging off of it)?
> 
> This would be really good. The only problem I can see is the p2m allocation
> which is done during domain creation. With the current set of patches it
> results in a "Failed to allocate P2M pages" since we want to have p2m tables
> allocated with the same color of the domain and a null page is returned
> because we have no colors.

Hmm, I see. It would seem to me that this p2m init really is happening
too early. Ideally domain_create would merely mean creating a largely
empty container, with stuff being populated subsequently as necessary.
But I guess this is too much of a re-work to be done in the context
here, plus of course I may be overlooking something which actually
makes it necessary for domain creation to be structured the way it is
right now. (Imo the reason for the early minimal population of the p2m,
added only quite recently, wasn't a good one, and the vGIC init would
better be deferred. Yet once again I may lack details on why that's not
possible.)

Jan

