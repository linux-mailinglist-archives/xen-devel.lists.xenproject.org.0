Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D569A631
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 08:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496897.767840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSvL8-0002vA-P1; Fri, 17 Feb 2023 07:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496897.767840; Fri, 17 Feb 2023 07:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSvL8-0002rq-Lw; Fri, 17 Feb 2023 07:39:30 +0000
Received: by outflank-mailman (input) for mailman id 496897;
 Fri, 17 Feb 2023 07:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSvL7-0002rk-F5
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 07:39:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3537239e-ae96-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 08:39:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Fri, 17 Feb
 2023 07:39:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 07:39:26 +0000
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
X-Inumbo-ID: 3537239e-ae96-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ml9aIFRZw3pTJL2NrhAduroM9qMr1COUdOvdJJ+1SpLi2ZKYdcozSZjE1A/PO21tuiyGhZ2lVMmBotyA1Fc3IK5huJcs91xdUttj+RO/c4lqzFCIblg0gFtji7HP/CLSAMyr/Ku6MGfVsOQLccObjNmxIsJtRaW27SoZTnumSwa/SxCiHlBmcU1LAuCJNbuPlJRBE/V6MrX9qM+7emR7QyQHxWKH2URPc9+BiH8UkOl8To5zOzCBMVrYHzGJnCbV5VsBVgkGmLYQAMzG7Tpwvw7f/Dqc1T7XIkqG8RvKEfuSY6ybmAdlX29nBPkGH3iuzGpj+wjQOAXI1mydOnHaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vbg/P1bEEq+4IDR//iZ/hp61aCx0MKgYlmu4RpC9bWw=;
 b=hxs3irqWbna6ToMewCDB+xp+eSnxylP7+6eBMRJNzZc54hW4pK+l9J9vlohNnILb7uad4iTeTTTgSgLq1tOKcB3ujCZI5rvK1PskoLIo4gPz+EA0Cx0SProLsJVzQOPIERZ3Z8zHTzmkHe4wcyvTwYSXg5QWuhgZlzi3X9KBgzUZIq3lRjG6rzd/Z3P3cEDEwsUzqkdQPrjpXzO+cOibb3fefmwJeE2Xjy/tu33cr6wgsUOEdZQr31ZEU9Uv2uO/KqSvxCqKeHRCv6YS++t262NIW4QgZgjelN7IzWaDsrelLcpeiG6YpbJ9WiA05UTp0kk34mC1cTy9uclY3othjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbg/P1bEEq+4IDR//iZ/hp61aCx0MKgYlmu4RpC9bWw=;
 b=DzPbMIhZ4Z3jT9906CHETVYl7jvts6iv1AG3t4GjFL60wcUcZyqnbSM+0uXrUXUTJOqdHeaqo8PmTuubiCHBuPi/5PtYLaevC8A1agi5Oh//t/28lQgR4Dj7n1r6yGh5f4F1ExWa0zwxgmc+UUZnCjBvAdL0o3229rvGhVIAyObMFfTu+QYf77O0YxdyDlvZUM4kBTeqRo0dlc1JGM7vGsVjR3/jfb0sF4h3JWAIWblcC3uUzJTyyMNifE4I9xLlIbJVybTKNP9A7Uqpu38RbhZedBTHjF2qltFGrPvR1d9UttUTbGg7e9HBGQSmnYi3tyVBoVxF3vYEb2ziyeczuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92e8645c-d0d3-ea1c-1e69-04fc98a1bafe@suse.com>
Date: Fri, 17 Feb 2023 08:39:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-4-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261541420.1978264@ubuntu-linux-20-04-desktop>
 <97112cd2-d16e-6c9d-7c3d-a3fe5ab76125@suse.com> <875yc12ile.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <875yc12ile.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 63370a3a-94e5-4d17-983e-08db10ba186f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iR+jh17ON0gq+GNvjfXq1xC5s1O0Rg43CpeVMpPJjajcGRGjXENUF3mpoiC9G3K/XHDua68TBNq1MhKsynoUaadfzsmmJeDUCgRQmpfKmnC1jVE8umR8JEdUMAPX8usovY7MKNvvnqLBWFhwIJC5/AtBb01aGkWq3BIRCh5Va75e5GGhwJgOhxUGGvAYvj26jWVNZ9qZZlG7ZtFGnBiMhywqcBeScLvfCPw9n2WDjHF/OiD3CCBfwtCe67lVTHQYOEz/bAhYgewXan/1BvAua5XAtetqV0MCjsrWFsRuRzQXK0unbjFZOUJMpaXMAQtKYWbl1eXJeJYs4nwK8Hw049j8YmdWR94ZtxLkGWdTfYG/Ol753+UdIkox30jXmiHGTkQ6VcaU/5FYRnG8/mRRQlfzTtmyzIwxxPMs5UlklBqtFkuzPBUxVOxB3P00LtPwVUkxs6huPF7P2yX7E42JMbSLqdn7WNvCIyz3ffL0Hv/FWnkrbi+0z9NmUSATk4GHDE7UDbqkCJ56ioTokAd5CT0LhVxCR2FkEqvnJX2YooGFdymkfDXuGW1qdVoh7pflLjMZOuQRe5OJMRCw4J399fHl0kzt8kuXGf9XJu41m2SO6zB2hatL7FhaBTTUa41R7BXHZpgZf3GuO1/lh0X/WhcUKFmFQQ9MXDugQinosn0xIKmJtcu5MCJmBph+4Z+HuDK9EhWeUpuwWlYEkmDJzl9PUiqJ5U346II5udBk8no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199018)(86362001)(36756003)(31696002)(31686004)(316002)(83380400001)(66476007)(6666004)(6506007)(6486002)(54906003)(66556008)(186003)(53546011)(6512007)(2616005)(26005)(478600001)(66946007)(38100700002)(8936002)(5660300002)(4326008)(8676002)(41300700001)(6916009)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUdManlWRHRBY1pjM3ZzYngxMzVFZUVZNWtHdjZ4OXdUUmVBWjdWN1pHRi93?=
 =?utf-8?B?Y056WlRxLy8wSmtHeXE5c1E4cWN2MDM1Z3JWWjhWWnRad04wWHlkaWN3OEFX?=
 =?utf-8?B?Rk9uSndpTzhtZVorTUUrOE9hbm0yd2wydVdkU2FOQlA4OWlFTGVVMzNpVHIv?=
 =?utf-8?B?SEFRSWZ0MjBpTFZDZmtxWlAxbXlIV0t4L2lUVFJvRlRUSlpwbjNKUDhkS2Js?=
 =?utf-8?B?S3c2bkhFaDhyTktkY0Q1cHZ1R216aUNJWkxxazFNaE9XdFplZkpEakdlcXhp?=
 =?utf-8?B?cEJqb0FDaEd3RktPc1RITzI4Y2RnTHBXcDNheEttYXNPeVpzK0gwVmY5S2JQ?=
 =?utf-8?B?MEJ3clQ4eFljLzNYbHc5RzhXN1Rramo3K1VsRlN3c1NSUzhsckd6bGZUaFhW?=
 =?utf-8?B?MVNldFFpN0VjZ2dhU2xuY21hK0ZTdXBHZURHYWxXdFBwK0tVemtHTXh2ZTlD?=
 =?utf-8?B?YktTL044aXlSWlFNTDJDL0t3dHJ3ekorS1VqMk5uWE5QQWdtb2c3T0tYRkY0?=
 =?utf-8?B?T0p6MlRpL2pLWDF6K0JUMmNhd0RxSE40UU9ISmRSdksxTlNaQmZ0QlhieTBz?=
 =?utf-8?B?L043ZTcvd2NWZFhGeWdkdlpSM21uT3IycU4rTXZsM0d4Y3AxMUt3MEx3Ui81?=
 =?utf-8?B?VUZJK1pBSFpQUzJBWkJsaVUwL21DamFpQU5XRFFKOFJmRjJuK2NuQXZwdE5S?=
 =?utf-8?B?UjBzdlY3WHBvMkoycWJpNVp5VHp0UGYvMWR1ZUp1N2gyZXpOUjFIa244SnRV?=
 =?utf-8?B?eElkL1BQN2lUTU11SVBnNnJpM0RIZWFLMFlpYWdVamlnY1pxUGU5UXk5YkUz?=
 =?utf-8?B?UGdiSG5GandkeFFQVWVpLzczNzlBbDNaTXdaYm1OS2tqNHNqajA1UnRxWDBR?=
 =?utf-8?B?QTE3UVc3SmI2UVNxaUNaSDhuYnhncHcwL2ppT0V1OTdpU2JVK0VQWjUyd0lh?=
 =?utf-8?B?L01INXNFYm1tUm1LclBVcDRaL2EwaktrR1JSTjNUMFVYR0NKdlh6cVRWZngv?=
 =?utf-8?B?bGsyMFdXU2I4dUVwdTlMNmphSktvSzRFbko1MkZMeFhvSjR0ajVyODlMTlhL?=
 =?utf-8?B?ZmZlT2kzUlcwQ25BMjRCVjZPMmFCZEZQWmczUUF3b0FNVXVuakw3TEtSNVQv?=
 =?utf-8?B?Zm9QQTErWnVhUnFodENnU25JUnFZRWl2OUFqSHdSV3FVOG4wTjNHaWgwdVBE?=
 =?utf-8?B?Rkx6dzJXeEVFcFBrM2t1b2FxZy8rVHdJSUx0ZGI5cUd6b1k3UGxVQ1dUTjNY?=
 =?utf-8?B?c2xzZzFvdEsvVlZSL0NSZEFJT0d5anhKQy9tZFZFcGxGZnFkY0N0VlJBN1RM?=
 =?utf-8?B?emVZQzZRN21lRS9FZG5wRlJadTZaYjNPdXFnRDdTMHp5U1IxbS85eWc2akdu?=
 =?utf-8?B?bDFxWDhUdGJDWEIvdysvNjQ2OFliQmF3TTdsVmRVdjRmSVR2cDNrL0tkWjA2?=
 =?utf-8?B?UVVRRjQ1NnJOQzdKM2NWcm1FbTEvS0hnMmRYTlJBRnlJTlZtazhncVRWM081?=
 =?utf-8?B?MFZXdE81bU5CRk41QjBoL1FhbTRZb3EvdkR6YTVlUzIwMllrcjB5MGhZRVJ1?=
 =?utf-8?B?aE1VZzhuRHp6NGhuWFhvc0F6dWttdFN0dGhlSE90MlJJbXVhNzR2RnQrNGZu?=
 =?utf-8?B?SGg0R3F2bUdxaVpmS1Z3YURBMVdLbjZuR2p6SUVlczRRU3hpVURiWDhMSEVw?=
 =?utf-8?B?Y3hmNDZaR2UzbTZrWi9Ja05pa3U0MFRuNE00clEwaXR0VHpwSjk5OGNKcndj?=
 =?utf-8?B?RUFxK05HNnNBWkYrYzcxdGRmWldmMXNMQmRyYWFERXJlVlNOb3lPVjNIYWtZ?=
 =?utf-8?B?b2p5ZXM2WkxtVlljU1dESmVnRkN1cjVQNzZKekNEb1FPb1RlRlNCZnQyT1RY?=
 =?utf-8?B?RG5BV1pqVzM4YTAvbnkzOVNlMFdSRC9saFFqTWJFNFNKeDRITUtwZmpGaWJ5?=
 =?utf-8?B?ZkUyenMvQXF2WXViQzE5NXNROHlVSGZzTXEzUnJFakpURDRJK3JrUnUwRWln?=
 =?utf-8?B?T0tnYys0b0NycDQwQk95eVZYcXg3WFRVb21RNEtkSFpRcHZNNWtpVmhkcjFP?=
 =?utf-8?B?NXJWOTJIUW9FVnFHT3FheUlxVEt1NGNaK1oxWW5QN3FXNXBzRnh5L0pnbHAx?=
 =?utf-8?Q?JOIJD9ZB3duAiKKuF8UuRx56G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63370a3a-94e5-4d17-983e-08db10ba186f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 07:39:26.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQg/Gwe3vUfd5PgPfWVBxaJ5i7O2dL4Nj4iZJA/KSud3se6MzjWD+B16+9Dr/91nq+3KpLnk60UBUnZrXmb9Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644

On 17.02.2023 02:20, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 27.01.2023 00:56, Stefano Stabellini wrote:
>>> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -1641,6 +1641,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>>>>  {
>>>>      pcidevs_lock();
>>>>  
>>>> +    /* iommu->ats_list_lock is taken by the caller of this function */
>>>
>>> This is a locking inversion. In all other places we take pcidevs_lock
>>> first, then ats_list_lock lock. For instance look at
>>> xen/drivers/passthrough/pci.c:deassign_device that is called with
>>> pcidevs_locked and then calls iommu_call(... reassign_device ...) which
>>> ends up taking ats_list_lock.
>>>
>>> This is the only exception. I think we need to move the
>>> spin_lock(ats_list_lock) from qinval.c to here.
>>
>> First question here is what the lock is meant to protect: Just the list,
>> or also the ATS state change (i.e. serializing enable and disable against
>> one another). In the latter case the lock also wants naming differently.
> 
> My intention was to protect list only. But I believe you are right and
> we should protect the whole state. I'll rename the lock to ats_lock.
> 
>> Second question is who is to acquire the lock. Why isn't this done _in_
>> {en,dis}able_ats_device() themselves? That would then allow to further
>> reduce the locked range, because at least the pci_find_ext_capability()
>> call and the final logging can occur without the lock held.
> 
> You are right, I'll extended {en,dis}able_ats_device() API to pass
> pointer to the lock.

Hmm, that'll make for an odd interface. I was wondering in the past
already why we don't have a backref from the PCI dev to its controlling
IOMMU (might be ambiguous and hence better left unset for bridges,
especially host ones, but I think ATS is being fiddled with only for
leaf devices; would need double checking of course).

Jan

