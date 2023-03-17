Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD846BEBA7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 15:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511133.790016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBLb-0001LQ-R3; Fri, 17 Mar 2023 14:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511133.790016; Fri, 17 Mar 2023 14:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBLb-0001J8-Mw; Fri, 17 Mar 2023 14:46:23 +0000
Received: by outflank-mailman (input) for mailman id 511133;
 Fri, 17 Mar 2023 14:46:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pdBLZ-0000w3-U1
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:46:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a493506-c4d2-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 15:46:20 +0100 (CET)
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com (2603:10a6:10:10a::28)
 by AM9PR04MB8424.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 14:46:17 +0000
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498]) by DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:46:17 +0000
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
X-Inumbo-ID: 7a493506-c4d2-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyXj/hnm9ZwY3kwNuQDjIzvH3ci+f+ID3Mo5UkbFSd+KSK/kohZkViJoC18LfV6c5eGMR7BXVA4trA+8zyqdpWPeLQXeaZFyF2dSw2FayAoZWBQNO7AytqHzsqAd3k3tzXnzFed4JL8deK2nOX+WlWRutqo8zO/pujGUfdv9GLcZdrWP16VgY89zc5GFmBcvpRrhaztHnK1xHMwRCqYXeucINCQe4TlpTRgl47FgodKO7D293eJO1lhpyEfYdu+p8R3NXdygdV5FgwuPpSArkECO3PyFZsOf6HJ79cmKxjmntfFOouzF9FhJ3ok432CRcg1ejOn/lqoHzpK1TBRbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0PAxUohAInL4ozQC8nVKLmfRg7BMPInBq6Q9Qwt/mc=;
 b=n4xRRpjw6cVg/9QCj9RID+gKhF8n99li+vAxbTcZlU0RSPVa2LezdIUeLPoheQ/wDiIjbScc0kW6nXIHGrPhMD/5TszjOJ9hAQz1mpaEgeOHXZEp2LEBWWpd1EtjpoBP5Qk5n/nFqAvfQKIWtypbCY8z8ueGVsSuMLANbGJEBRjc8LQKLfTjVAG6RDsUEHsS8O0ojr883eaqXrrJKVYrBnub78P8xlCN7kiJV9mZesbFVWiHCfgmlsd95Ha02VgquKVdOuG4n1OMUy/SqorebJMHCSknl/C0/EI8Xvzw+TbWhGDQTtncQlratYeZVYqQ0eQ4vbwGP8py9iom49VQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0PAxUohAInL4ozQC8nVKLmfRg7BMPInBq6Q9Qwt/mc=;
 b=SRsvZXzy2+1itr/gAyKWzGS4QJMIQ3Soe7pQ+dJE6nHB8S00Dsmf/hlwfhplJsZXFfu+srFPzUbLvOs0wVWEpBV/u+VBOAzTwk+kxET3VZSReKFg/8avFhmY0h2RumLwvoRZGS4GTHgffwW//djQZC3NzzOfT2w3z1uMe9+uXr6tll0cBqSgoxYQv44BpMlrJPapQzJQ2ASbiTcwYkxjZNMqJphhcwd4DeIn/ZSEC69+GMq90iP0WP5LnSQ6EcpEEauV2y9Xd4BWIj17Ur+R4S3lD7KB46vmmV0Rk3r258mFBVA7CzUIjfpF//KaaNMdqdqWdDFW2uL2OKMBhpIt/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59f6fa7c-309b-051c-8fdb-614ef7e92233@suse.com>
Date: Fri, 17 Mar 2023 15:46:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
 <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
 <ZBNGO7/NY0VQQM/f@Air-de-Roger>
 <8331a0c4-07fa-0340-20bf-77a5c8661aa1@suse.com>
 <ZBNIbhW3Eu07aj8I@Air-de-Roger>
 <9693e011-a0df-4b18-fc49-fe8f46d97d9f@suse.com>
 <ZBQ7bMo8JRsBUVmN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBQ7bMo8JRsBUVmN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To DB8PR04MB6554.eurprd04.prod.outlook.com
 (2603:10a6:10:10a::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6554:EE_|AM9PR04MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: d965ff0a-b8c8-4984-bba0-08db26f65ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n2IYewnwG+aWO8E2j8YDfNOH5XyqcuG3CVLw+DdvfbiHWwP+rLoskdQWjpqvWTkPESXLz0YR5/TcLYuPetXaMaK/jhlVUT4cyBwFlAdieuSYOOmC7fwgTrJupEGmwP3T+Nb1pZaSX/ivsp22JLlpPF0Re7zDhKGAzU0rtFTpKx1AOqZ+nBRFjtJzv+dbW8WO5o/UIcIyvxkyTOl0xO5VPCsfyZZvMJ9xFKk2THhRILDt31AueeJgZLGkukjRiBJa9CthsdA3Aq/kRBxPi/FefLeDyszcgUoTS0v5qznVP3YTbRW5SqJ32I/p6lVEDk7JQryKXaNtAzWD2nmLvHKsuhURVATeQubGQjwTAk93xzSbvElMLPsZv/3FYdABOW4ADFaCGIK0aZbekjMC4f1tDxfOPat3QaP4z/WXes0Kksx2X3bAIQj87z+RPGblpDZllPX7IGyr9jpt6Tw7dQS/lkBnFgJthWLefo+tlQOjKye0RzPC00Mmkmlg7FvRam/B3Etdj23RpoH2JGu/aZbD6fnSErXiCpLA2lcjQEjAlekmpXJ5QBrKW+PhrW3ibgfNWqI5GhuKXEcdzY9jjrF52ZCNdd1KSe0V7UMweNC9v9fxUWcjN8xfAh71x7EP9y5m4Z+j08H17NlnFNRMU4Hx/FGgfYa7zjj2ou1dz6UAJkjuS5mx6Mam+4u54oUlTJgo0Xh3wNCj8pa6TEOD62GNq8N1dWGjRQY3BsqyNKOGL/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6554.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(31686004)(5660300002)(41300700001)(2906002)(38100700002)(36756003)(31696002)(86362001)(478600001)(8936002)(8676002)(66946007)(6486002)(6666004)(66556008)(6916009)(66476007)(83380400001)(4326008)(316002)(54906003)(2616005)(186003)(6506007)(6512007)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNaUFlTQjJXbUd3eVFTdzJONGN1NHdxMEMzWDNTOXNOY1drS2c2WGhnQ0JH?=
 =?utf-8?B?bUFFcURkUDlrdUY2VlNuSFZrUDd6MVBXd0ZJbVNqdkxHOU5KVlk1c2RxT3BI?=
 =?utf-8?B?YlRnZXc1TzdQUm95M0dCZzEvbnpsRU9zS0gvS2dJYXpBbkl1TlZNWk9FT0FO?=
 =?utf-8?B?VGZSc2xTSmhIQXl4YUtidWtNR1NpMDVpZXVCdTh1RnBERzZ6cnFLMWpkZGFq?=
 =?utf-8?B?QXd2NjIrNzd6VGtPaDNkZ0xPamRiV1E0SXk5Y2NMakpmVW8vb1ByaG8rTHRS?=
 =?utf-8?B?cXpjSlFZOVdRMEdxVjdtU1ZEZlhZQzBWa21FdTgwTlIzVnZtbXJIejI0WlMv?=
 =?utf-8?B?Q29CSzdFV0F5SmR6Q0NpVGdJeFNJTnlRM05yUkJXUnJpRWxtT2c0OXIrWUZB?=
 =?utf-8?B?K1IxYlhlTW00RElNc2JOTmNES1lVLzRFdWdZSFQ3RW05MVg4Y2FrVWEwcjRH?=
 =?utf-8?B?TmRJM0hTdDB5eXFZWW1GNG40QnA4dnRaWWphUDNEZUFmK2tsRGZ2L2g0SWdt?=
 =?utf-8?B?SjlaU1k0TjdxMzlqUjh1dFpESE4ySUEySDRwT3VFSDVrKzVuTzNodUZpYlJG?=
 =?utf-8?B?dGJPUWxNZm1tWGYvUHlaMVdKYlNTbmNwTnJCZEU3VU80aENnYjFBaWtraXcv?=
 =?utf-8?B?aksxZDRJRENjQ2NZbCtLVmg2WWdLeXVtWlE4Y2o1S2NIZWVkM0NQZDlSenQy?=
 =?utf-8?B?dkgzcE13dFhNNEtkb0NkOWpjazZkdFlYdTFDbzRhYlNLdS9NcGpjT3BSa3dC?=
 =?utf-8?B?aFYvUC92SFZsczJWb2hhTi9rR0puRmxZRGdqNGNRYjZVYi83dHNOR2p5emp2?=
 =?utf-8?B?QWNLOUJtTExBNy9panlWWmlQVklBaGd0alp5ckFneWlBc2dNMFFpRzBKbE1m?=
 =?utf-8?B?dTNKTlRBTDNGUEUvbGI1NGxnd0tsUEVvcUpMWno5QmZOWHVyQWVjRUtKQkhG?=
 =?utf-8?B?bUl6TDA1N1Z2Y1pRZTl0elhGSHpPMFJYcThKbFgybjUyOVhEdmRRQU15RXNH?=
 =?utf-8?B?VnFtMzlBcGxTU1pDekhqeUp0T29VclJlS3V4bVpoMDVqQzlqYUtDYnJHMndZ?=
 =?utf-8?B?VFlrYWRrN2hyaW9JTldwa2xoYUZGMy9TbFlSOGd0RVFqTnUwK01pMFhWYmwv?=
 =?utf-8?B?TWROTmxQSU5qQkxsM3p5VUIreEVpSlNUTC93SktLemYxYlJMdGRDcTdVdDFK?=
 =?utf-8?B?VHBtV1huZS9CV24zNTk3RVJLM1pRWWtXNGgvZWJFUXE5dDJma0dHU05RTktU?=
 =?utf-8?B?UGMyMVFtU3UwYVQwU2pUcUJRdkpvRFBFbDl3eThwazRMdUJCcE44UVdnMHJW?=
 =?utf-8?B?b1pwcDJEd3I5cXNsVkpKWDhEL2hMNGxwTHNBVHZrZGZ1SmUvWGVlSnBqSlIr?=
 =?utf-8?B?TEZXYzBBRERialFmNXo5dnJUSFU3V1pYelZpVHRRakJoU05obFhOSDhtdkNz?=
 =?utf-8?B?NXpaQ1o5TGpSNG01enJVeGtOVXRVbUowaXFBdGhabFMyd05WSzFKNmZxZDVX?=
 =?utf-8?B?aVF0SVhXMG8zL0FnTk1JOWVWMk5IVVRZYUFnTU02NEZiSDRaQ0lxRU55a1ZK?=
 =?utf-8?B?cVpTdE1xL0dRdnhHNEV1WWlXSm1KVkQ1QmhVQ3BxN3FQSXVyTDBScXdMMUVn?=
 =?utf-8?B?R3IzaGU4YW00UGJWdkwvY0N2ak5mWDFKamR5TkhtV3Q4UjBFVEZEWk00andM?=
 =?utf-8?B?ZThZRENPQ3BXOHZXU0k1RHA3WXZOU1RlemxHbmFrS2pod3JTZUNmMVF6a0xa?=
 =?utf-8?B?N3E4cHNZOG5uclFKbS93bVVBWmhGdXp6cEZkd1lFWDA4eDJSaHU3QmgwS3o3?=
 =?utf-8?B?dkNjdVpnVURmN1NiK0JIcndtMjQySFZjejdOUzVoOEd5c2cvVW91NlJWYzlE?=
 =?utf-8?B?bmM5ZVNNV2Y3V24yNXJOV1lyZXd6Y2VRVDNVaXArcUF3NEZ6NkhZRWVUTysz?=
 =?utf-8?B?VmFvdmlWQW1OaHZNa0hIVzNFeVVQQ2pXdFVaOFZPelBHTzZGM096enk3dklQ?=
 =?utf-8?B?cEl3dTVONlpOYytJdmFFQlhWbHpPNFFsUzNsODV1YUZoRzYxQUVwVDNpQjMx?=
 =?utf-8?B?RGFucmhHN3BFRXc1TUR4NkZZWit4K2xzdGRGa09mSWhycUdRRVVzbHFiKzl5?=
 =?utf-8?Q?F283/nXSWpEXzVzl/v/OyP6gi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d965ff0a-b8c8-4984-bba0-08db26f65ccd
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6554.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 14:46:16.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IBxm0NcFSXT4nVcUJOn/uLZz0vEagfdwGxbVW68pqPX3WL7EH2NQZS/CdwLXkx4+qviKQDzVqyVrywV9r89Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8424

On 17.03.2023 11:05, Roger Pau Monné wrote:
> On Thu, Mar 16, 2023 at 05:56:00PM +0100, Jan Beulich wrote:
>> On 16.03.2023 17:48, Roger Pau Monné wrote:
>>> On Thu, Mar 16, 2023 at 05:43:18PM +0100, Jan Beulich wrote:
>>>> On 16.03.2023 17:39, Roger Pau Monné wrote:
>>>>> On Thu, Mar 16, 2023 at 05:32:38PM +0100, Jan Beulich wrote:
>>>>>> On 16.03.2023 17:19, Roger Pau Monné wrote:
>>>>>>> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>>>>>>>> +static inline void refcnt_get(refcnt_t *refcnt)
>>>>>>>> +{
>>>>>>>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
>>>>>>>
>>>>>>> Occurred to me while looking at the next patch:
>>>>>>>
>>>>>>> Don't you also need to print a warning (and saturate the counter
>>>>>>> maybe?) if old == 0, as that would imply the caller is attempting
>>>>>>> to take a reference of an object that should be destroyed? IOW: it
>>>>>>> would point to some kind of memory leak.
>>>>>>
>>>>>> Hmm, I notice the function presently returns void. I think what to do
>>>>>> when the counter is zero needs leaving to the caller. See e.g.
>>>>>> get_page() which will simply indicate failure to the caller in case
>>>>>> the refcnt is zero. (There overflow handling also is left to the
>>>>>> caller ... All that matters is whether a ref can be acquired.)
>>>>>
>>>>> Hm, likely.  I guess pages never go away even when it's refcount
>>>>> reaches 0.
>>>>>
>>>>> For the pdev case attempting to take a refcount on an object that has
>>>>> 0 refcounts implies that the caller is using leaked memory, as the
>>>>> point an object reaches 0 it supposed to be destroyed.
>>>>
>>>> Hmm, my thinking was that a device would remain at refcnt 0 until it is
>>>> actually removed, i.e. refcnt == 0 being a prereq for pci_remove_device()
>>>> to be willing to do anything at all. But maybe that's not a viable model.
>>>
>>> Right, I think the intention was for pci_remove_device() to drop the
>>> refcount to 0 and do the removal, so the refcount should be 1 when
>>> calling pci_remove_device().  But none of this is written down, so
>>> it's mostly my assumptions from looking at the code.
>>
>> Could such work at all? The function can't safely drop a reference
>> and _then_ check whether it was the last one. The function either has
>> to take refcnt == 0 as prereq, or it needs to be the destructor
>> function that refcnt_put() calls.
> 
> But then you also get in the trouble of asserting that refcnt == 0
> doesn't change between evaluation and actual removal of the structure.
> 
> Should all refcounts to pdev be taken and dropped while holding the
> pcidevs lock?
> 
> I there an email (outside of this series) that contains a description
> of how the refcounting is to be used with pdevs?

I'm not aware of one. The intentions indeed need outlining somewhere.

Jan

