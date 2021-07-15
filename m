Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A53C9DDA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 13:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156565.288971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3zfq-00045E-Ic; Thu, 15 Jul 2021 11:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156565.288971; Thu, 15 Jul 2021 11:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3zfq-00042w-EX; Thu, 15 Jul 2021 11:37:02 +0000
Received: by outflank-mailman (input) for mailman id 156565;
 Thu, 15 Jul 2021 11:37:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3zfo-00042q-OX
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 11:37:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f69aca8e-e560-11eb-88ad-12813bfff9fa;
 Thu, 15 Jul 2021 11:36:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-eYCf1w8OO6KcaAEq077igA-1; Thu, 15 Jul 2021 13:36:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 11:36:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 11:36:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0072.eurprd07.prod.outlook.com (2603:10a6:207:4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Thu, 15 Jul 2021 11:36:54 +0000
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
X-Inumbo-ID: f69aca8e-e560-11eb-88ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626349018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWPl7HL8hsXIMXsxBBXNQAYPCWRWwR1wJwY6vqjfQgE=;
	b=gYoyyqZmVuNQ7GdtISOPhpRjzrzLxFU5HiaLp2Oln5Q8QWKM3u/tekIYBBdEBxLA43YgY5
	MYMd51UlMABjPNh/SAQ0FYrpKDtz1VLXsktEx5nxGk845NUwgC2Ma5F0ZkClawVsWDKAaF
	AMo5qjJYwEwcinCtFj9OjkBn3t/sMTQ=
X-MC-Unique: eYCf1w8OO6KcaAEq077igA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhAhaqm4hFq1OxH/MfG5K0SPBlPKFo1AAZFYrZoz3boVvyKBA7M0k3zclSDzB2+VNbFlIbLJ01xqZCupy+tks6rOVAkM+EUUpkYq3XvzK4LdVvLmcQCIaO6PkYNSXwJr7hTyDQQMbv7FFre/noOgShO5jT52EiUyUM2iAjPJMPXc1igRbPaDCuwxTekaX8BrDIXeI6NDjusdgWviu7Q6VKnEkM1DHMAFxxAnRoAGg05io4a0cgwqXWIbOW6J3yR3zHVHg3mPYkQA3grHFnjPQVOxkxvuFypZ9ohbKOE7JD2tJ0WP2jPNmF7b6lzclmTaQ8l2hHA58/rkWbnI3SIxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWPl7HL8hsXIMXsxBBXNQAYPCWRWwR1wJwY6vqjfQgE=;
 b=a5C0MWTxq72/SjSWp6HY5GLl0nNobRAyCb3rhnxmfphnVO/dW4VRXMhbUDLN/4S79yfaLc8rTn4aJr1Hdd/uTC1ttIIDiUpaLewcQLie+VTo5F/YJN272RqZaPp49E+XCH67PCKWTOB3X0C3/kA8/n5kcIr7tJE8vRPdjmpQCTYLnEYaZceMGP7vw9zsucNmy5tYEk15nOcGhOmcgzj3KYGJkuTUfgRy+F4XMipg64drmrPV2oyzgLK9ItyuTmmnZh1Fhfv6xVKcm5bxJA+zNZA+ueRcGPZqX1Q8Lq924Xzny6/PvXCDNb40KdJkb2iD87E7REPGRrpo46kUIN0DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 13/13] SUPPORT.md: write down restriction of 32-bit
 tool stacks
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
 <e12989f7-9217-e2b8-a17d-5c252dc89248@xen.org>
 <dfc17ae6-2100-cb27-9826-1f6001788707@suse.com>
 <870cae2b-5601-b10b-926b-0995e661ffc1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d91b5d10-03a1-14fd-0b92-0de5e4e8d482@suse.com>
Date: Thu, 15 Jul 2021 13:36:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <870cae2b-5601-b10b-926b-0995e661ffc1@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0072.eurprd07.prod.outlook.com
 (2603:10a6:207:4::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 788afb18-8dba-4907-a219-08d94784d90a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360C1143F49969986F4DD27B3129@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AjFkCZhY9fT1CDyOXn8fmhHMYGMZnkxfUZlh7xtSW8C197SnuJ25hp8i8eRC8cwDUwNysFYYUjElet6A+5DUlER88ErS3A4CQwQzBV3SVxESYWtSlU++nAdGsKOlhetnbuI0N4qnir0mAGOvoO3a6QSzRZUX4xMzupeX0reFcLDwPvt8touUyypkeD7X1Q63JbtGb2Suy5vtxRtWvz0qdHgtfB+j/jCHMN641Ys5AQpphB1bOEdjNqflz597TWG9oediAMq3oue7YzqyUUAjkSonjVnkJA27H+KXDLb2eqQ0AVeovMT1+hsI0lZ8mFKUafy0QXfJMtczjY0cr9WqWTjgP+UY1BvPP7vAVU8IH8s/8mPUn9McLYto9N3D5ITrS5DHMNnYHctq98rxkJYqz1jYo7ReQJs/Mfp+jMKFfFEg1vgq5AHN1m5IGE4+qCHar201fOAAaDTUaN14VAxS4NbAWKi65GJU3hYTPWrrox0s7E8fiKnGKMBEZwseecmm66IxXORYrVpnJDvMBYADc51XxwoO2UCgHxTYV1rZilOsStdtDc635lpAMCBahP2L2lgov33vdao0KAwPA8LJOmK7LAsuR5Ws3d+RNVM/3uc3pNUh/AdsKVPANFqP29q0CQRDUUPCLOODf6WewYdJIEFx/DG/dCYC1lRxG9dBWdeEkpVc23DvtMZE46MborTtCyN3WX1Ee+mvIPBEkbR1NlJ8pUHiLSSL0cwKUwEb+YA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(396003)(39860400002)(346002)(6486002)(8676002)(8936002)(31686004)(36756003)(38100700002)(956004)(16576012)(2616005)(6916009)(66946007)(5660300002)(66476007)(66556008)(53546011)(54906003)(2906002)(86362001)(83380400001)(31696002)(316002)(186003)(26005)(4326008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGwxSHEyTlNzT0VFeEhvUC9yKzdyUkhxK2lLc1I3RFNDTGUxVDVrR3NvVVFm?=
 =?utf-8?B?ME1MaHRIcVgvaWVQZzJlN0EyOW4yekNydGVLOTdIeWF4V240ZGVaVE5CK1k5?=
 =?utf-8?B?aFZxT1d3dTh3QWVaTVpjS3Q4NDdzWVJlQWFsaWVCc3dzZnR1Vnp2TzI5Mzgr?=
 =?utf-8?B?MzFwZlZZT0VpUVRPbVVscDQwUmljVEJ0MGZ5TExHOGdtR0tTeVBaQTJqZ2RN?=
 =?utf-8?B?TG5CL2s3QlVTV0xUVUsvOVZHa2JSMlFwUDU4cHRZeGJENGI0dVdJNEZ3UlFh?=
 =?utf-8?B?VjZMNXdDRGN1U08xSXdxOUdHWithOExXaCtzY1huSkZtZHliNnE1OHZHazNn?=
 =?utf-8?B?L1dmVnI3QXNkdnB3MGZjbUxudlIyeTMyYkw2U3R6cG1MZ0w3RW84czFYSjdp?=
 =?utf-8?B?WDFiQTU2WGhrSVRiT3NrbnA0bWMveUZ4SlNlSFZmUXN3QVpCckxUVFFXbFB3?=
 =?utf-8?B?ZkRXb0d0SXN3K01scEljTnVyV1I1UWVQUCtJTlJON1h2c2FzNlJhekwxN3JI?=
 =?utf-8?B?UXBNaFN2UzVZWTAvL1RHUDBBbXFZUWViTHY0NnVGVUR4bHA4b2NERy83YXE5?=
 =?utf-8?B?c282Vkc0WEJkbllWREU5R2JFS3Y3c1VFWlU4YzhiV1d1b09OTTdrRzlJK2I4?=
 =?utf-8?B?ODRRUDY3aUIvTzA5RGZuam42UFlkYTl3UXZIN09NTHF3S25GYnFSZHdUazZ2?=
 =?utf-8?B?TmhmUDYrSnFLMHp4U1hVVzdpOWl1TkhtWE0wRG1lcWR3eDd0aXhHMzh6bFdF?=
 =?utf-8?B?ZDR6WEhFZGZDQWlKSG5Pa0t4cDJ2NndJY0lUb29TNVM4VlcwZ2hzb0V1Tkxr?=
 =?utf-8?B?Y3lzRW83SXdvNFhvN0RybElmRGJ4dEl4WWxha1dKRW5iUk9jYVZmOUllTkk5?=
 =?utf-8?B?dWM1bjhTUnN2alV3N1BDS3dVd1RwOUdlY2l6YlE4UTBuTUhPRlhmVnM2UHBD?=
 =?utf-8?B?TWloa3pFbmJKRDUxa1RNVDBXbUdLaTBDNmk4OU9NVEowNFpZY1RsOFNNbldQ?=
 =?utf-8?B?dklQZUdFdkhvRFdyVzR5VFJPREZxYnlrQlFrYUNna1dJc3h6RzdUbjVIMWxZ?=
 =?utf-8?B?R3dLS0dKOVJ0SHdHZkZXVm1ybm1SYlhvZk0vL0pPYm0vM0syb0F5QW1Tb1Zo?=
 =?utf-8?B?d3hNdFZqckZ5QWlueDdyZU85WmVIWDVCdit4eU1TbGhaTmNWY2Q3UER6Qkhh?=
 =?utf-8?B?WElOdDJHVVNVNEVZb1hjd3EzekJ3K2pGQzlZS2E0WWw5dTVWNXFHRGl6N1lO?=
 =?utf-8?B?TmZLUTl0WTM5U2F1RUFQa1licnV6dHFzeXlTWUYzRzZ5cHZGMlhKZlJqcUF6?=
 =?utf-8?B?ODFUb21HVy9NMGpZZWFjakx0ei85WFRvcGV4bmxEZWwrQ05XeUNRZEZHYllR?=
 =?utf-8?B?YUlnRTA0RHNSK3dSWFg1ZndoNFhSOTA2anE4dloxdUVhUm9TeGIzNDJIUURP?=
 =?utf-8?B?cE8wK3p4eHlOb0VUUzQxSHIxKzNQVS9lT01iQURZc3daV2t0L0ZEOG5OeDRU?=
 =?utf-8?B?YlhyVmJXRkVDVlp0cGVlOVVBbmExZEJDeXdsaEREWkJsVzBMekIzOUdjTWdr?=
 =?utf-8?B?THIxbFFqQ0F6anZRQ3pTdEVUVmt1SlRVVFN4SmFJa0dUKzRrdmxQRDB6VmFs?=
 =?utf-8?B?aGJNV29yK2c2QmIxYTRKempPQWtNNHRNNVF2SWY2OXg1dkJsblVDN0FjRkJI?=
 =?utf-8?B?SzU1YjFtQmxMdEZmclFvaDAzYnlnbjh0SlFxWElDL29XYnNiMEVxWWpmNlpV?=
 =?utf-8?Q?0Y5EVd3i2q4wc7tCoT6AmjHwF0glB0Te2RPKxzJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788afb18-8dba-4907-a219-08d94784d90a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 11:36:55.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1O3PxaQMsKN/gsD93ZFRyhOQxkaR0D4dchrFAK6ocGIQCfnKfEZELAF3s/W+yP665T1+32b8cWovp/mwE5OIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 15.07.2021 11:05, Julien Grall wrote:
> On 15/07/2021 07:38, Jan Beulich wrote:
>> On 14.07.2021 20:16, Julien Grall wrote:
>>> On 05/07/2021 16:18, Jan Beulich wrote:
>>>> Let's try to avoid giving the impression that 32-bit tool stacks are as
>>>> capable as 64-bit ones.
>>>
>>> Would you be able to provide a few examples of the known issues in the
>>> commit message? This would be helpful for anyone to understand why we
>>> decided to drop the support.
>>
>> Not sure how useful this is going to be.
> 
> It would at least be useful to me, so I can make an informed decision. I 
> suspect it would also be for anyone reading it in the future. This is 
> rather frustrating to find commit message with barely any rationale and 
> no-one remembering why this was done...

Well, I've added "There are a number of cases there where 32-bit
types are used to hold e.g. frame numbers." Not sure whether you
consider this sufficient.

Problematic code may be primarily in areas Arm doesn't
care about (yet), like PCI pass-through or migration. But see e.g.
- xc_map_foreign_range()'s "mfn" and "size" parameters,
- xc_maximum_ram_page()'s "max_mfn" parameter,
- libxl_dom.c:hvm_build_set_params()'s "store_mfn" and "console_mfn"
  parameters,
- xs_introduce_domain()'s "mfn" parameter,
and quite a few more in particular in libxenguest.

And then there are also subtle oddities like xc_set_mem_access_multi()
having

    xen_mem_access_op_t mao =
    {
        .op       = XENMEM_access_op_set_access_multi,
        .domid    = domain_id,
        .access   = XENMEM_access_default + 1, /* Invalid value */
        .pfn      = ~0UL, /* Invalid GFN */
        .nr       = nr,
    };

Clearly ~0UL won't have the intended effect even for 32-bit guests,
when the field is uint64_t (we get away here because for whatever
reason the hypervisor doesn't check that the field indeed is ~0UL).
But I wouldn't be surprised to find uses where there would be a
difference. One of the main aspects certainly is ...

> I vaguely recall a discussion about 64-bit hypercall ([1]). I assume the 
> decision to drop support is related to it, but I have no way to prove it 
> from the commit message.

... this. Some XENMEM_* may return 64-bit values, yet the hypercall
interface is limited to "long" return types. Not even the multicall
approach taken to work around the restriction to "int" would help
here for x86-32, as struct multicall_entry also uses xen_ulong_t
for its "result" field.

> It is also not clear why adding the restriction is the way to go...
> 
>> This would be pointing at the
>> declarations / definitions of various tool stack internal variables or
>> structure fields. Which also is why ...
> 
> ... is this because such issues are too widespread in libxc/libxl to fix 
> it in long term?

Fixing is an option, but until it gets fixed (if anyone really cared
to do so), spelling out the restriction looks to be an appropriate
step to me (or else I wouldn't have followed the request and created
this patch). Once suitably audited, fixed, and tested, I wouldn't see
a reason not to remove the restriction again.

Jan


