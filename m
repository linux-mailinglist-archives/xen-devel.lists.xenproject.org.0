Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B39631AEE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 09:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446410.701972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox1mt-0006jv-2U; Mon, 21 Nov 2022 08:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446410.701972; Mon, 21 Nov 2022 08:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox1ms-0006hF-Vn; Mon, 21 Nov 2022 08:04:18 +0000
Received: by outflank-mailman (input) for mailman id 446410;
 Mon, 21 Nov 2022 08:04:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox1mr-0006h9-Bi
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 08:04:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1632c0e8-6973-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 09:04:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8105.eurprd04.prod.outlook.com (2603:10a6:10:24a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 08:04:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 08:04:11 +0000
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
X-Inumbo-ID: 1632c0e8-6973-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxLp5rc3Ly1vkn3CLW0R2PvgflnK4Jgy/93aiHg625VBVP6pam6T+3gghhMgAnvpj2z+RiFGLWq5WJrq6N6wZcLIwRI+dDYcuprzp3LEKVcEG8On/wet9daogvtZq0kA8jvt2ZIzkd/aNB4K2ZyB43Xl3q8cm2dW9wLxqQLFr+US0gkfaB+XsPIw/pz237/sPhF/5iUye1eLaeigIV6ypXj+eZtfcGuuyKnLM/BiYlSfBbfns7xx/Vm0fdNUHQgR/ouSzOPYLdcVY/qYrdA5TKz3xKCLZvrnAFy9YB6w8BkCYJ6hbyTUcXQc5q0qORAE+ILIBL8k6VOTLzTefpvIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1oerJ/CYyTjY9T3AnzNTNUOt+7S9HlMFlNCOHSnzcQ=;
 b=eSSHDLlf79wH7+N3a55MW0JvDEH/EdPI7CF1jq72om0uwBgkArfFsjx/G4hVuNFsKg8HHnlbJN3l7b7bxhHjLLqihzkP58/Px/A00bqGKixE73kee6qRBYn4k2/zcDi8fBX8iaEHe2fLidrZOgdooUFpb+j+wAMMUOAjFwIMVDJDejINi0Xww7Hg3E8bIp1qOdpg/yprkeCVwEfncHAROZGHmJNW7R9R0UmBdswqgxJ/7oWuSt/ZgEo3gt/zGfAYxKiprWMoaRfmeuZqPztFMNJW5l7eswCG6aWmamm5i/EgmUTF77oOBzUX4OA7hd9v1bZP+RTNp0jxQHfk6mqiPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1oerJ/CYyTjY9T3AnzNTNUOt+7S9HlMFlNCOHSnzcQ=;
 b=gG2i3nbmjOTamQIypdBl4SYqrwh0rg5W7x20iMMuBVGz4JIy9Euxw644knkXtgp15Q9W9AUGvlT4Ew+WD08KoSI8UPFfctl1J8x1/qY1Se40xMqDwkETkjL+v+p2ZZ3yzHG0UTDzABq+s4h9kMqaAiCieInXWs1S7iRiKPgKIFkR7tWyII1bcyyrgPElCWmzkQdFo1niWXzHKdfUbuYpFi0Uz4RAx2LngIqJZ7AWm1bQG9Aawt0OqERWNpEl2elSuQlhE5yFyC08NHioxgUOCzktu48+nw4XOVmzKnmPnwf6PQpxNSJl8ennwVOteX+SV27pGEeh7gE/UddoIvEs6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08577045-517d-3566-9931-dcc1df6c2cb6@suse.com>
Date: Mon, 21 Nov 2022 09:04:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <osstest-174809-mainreport@xen.org>
 <Y3eZOcmOYkNLdeGe@Air-de-Roger>
 <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
 <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
 <d367e187-015b-5aca-92eb-ccb8fead208d@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d367e187-015b-5aca-92eb-ccb8fead208d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 05034cd2-6e06-496a-f089-08dacb96f95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fk1qPCIL4u5jovmitytYXMrug7/a9rN7amb8C6IcQTu6efDgiHw5OHUInzVqJRmNP6ZWJMd+FtKEmKDBa/V+KPq6915JS6P0CLRVUTuWufzhN6ooLcmuPabUHIEoo5A6/vOszN+sLeua3YElXq51cr9jzpuze2CcjjCYlhZZ6edWCJHhJ1yfiuBMMvo7Sv7gBNvQPggA8kDPaOxVc8qaH7k/QItA+zDhXZyv19H11GpOWrMP7viDHssfwjuTvfRgCdsC/nCKfOa+q/d4E4KpdNPrpBUGe/oddyO0GfkGftU4ZI5ZIVtKM/5XeQuiBCDtrgeist7n9SamSigFNVAx49cLtvp9+qyIAjOuvKDxp1/TacqzAuE+JK1YZBBGGq8P5zj1ZZq8AVKxTK1Nfu9KQm9B5oh1pcI8vOj6TuiqgBZRCxO0KC2DLKcAayeWUZYFyqmGCXE2k8XKGvjaKpcN4RO475Uq5xcindqSmIAhiBQ6fS+w/ayA8VMEBRfeb0WiSWbQdd3ebnHsg0p8Pd+9eLe4LGZJChNQ2OY9093qhuOXUnQTvh7Z7dfo3QvaFyffdajIFUA5Xza1TZTASpVtunsIqNqheHdlD9++Qii5Bp575kA2j1+XOW/BiKn2pG7e8GN/k0xVQAR7fC06a8XqbEGS8OlF/4FoIy70y4mR7rPP5uuohSYG/Z+VmUyVbf6FDk/eRudofFh0ZIBw5UbY+ahUKRDaLR4v/oWD0sTTRms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(26005)(38100700002)(54906003)(86362001)(31696002)(478600001)(6506007)(5660300002)(53546011)(8936002)(6486002)(66946007)(4326008)(8676002)(66476007)(316002)(41300700001)(66556008)(6916009)(186003)(2906002)(2616005)(83380400001)(6512007)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0VqRWpVT25ZWGdheEZwSVBkMVpoOTdsbVpNZ05xdHRjc2FqaVFNekRjSVZj?=
 =?utf-8?B?NitLSjhTZi9RbSt1ZmhLY2wxUGFkQ3E1RDZ4eVpoQkxZUm9veko5eTF6eWtw?=
 =?utf-8?B?eDRwNktCNW4vUkZnOEFPKzk0NGpCRkE2ekEvMm5MNVpudDNQeVNNcFkvQUI4?=
 =?utf-8?B?WGFBaDQ1dFdLWHNMY1VMYjBTaGM0RmN5cEpNdHQrVU1wUVhsUzV6dWVsaUN4?=
 =?utf-8?B?YzlhTVFjVnpxbmxVaXZYc3IzTmdDdUtzck1zcVFNTUExd1h0MWV1ZWhCTjlQ?=
 =?utf-8?B?bVoxcDV4bmlqcHNJOWExaXNVZVlxNjA4N05idnFvZjJteWt3NmFVNXQ2RkZh?=
 =?utf-8?B?eC9RQW5uR0YzQTZHQ3JjU1hPM1FKcVdlbndoZHZOdTJZOEFiVC9IVTVRdENZ?=
 =?utf-8?B?R2xqZWNya3FEQ1phWXlDcXpzNHhSMXowS3NES2RPQWRsak5NdFUvQ2FQVkdU?=
 =?utf-8?B?Rm9ieTVBQWRWcjd4dENiZ3NFOFpYM0wxcGJMMWxnNzVUc2pjU3Q4RTdoM0Jk?=
 =?utf-8?B?SW0xdUF0N3pKcENaa3orS1JtSm5Zdnpsb05UN09CU2dTZlpuV0sySXl2VXhR?=
 =?utf-8?B?S2x3emI3UFdyd3ZZcEtHOGJDaVFRS2FxZUwvL0xQRTBRVjBWdkloai8rNmpn?=
 =?utf-8?B?QXhLUmZzK0pNU3ZNZXZaaDFPN1RWNktPbERJZUdReVA0dU4yNFNTb0t3bDBQ?=
 =?utf-8?B?cFZ6dFo0TmIyTXI2Mkd6TXJNeFFtRHZ6bjJDOG1Bc0ZDZDdIeVVIN3BpemJF?=
 =?utf-8?B?ZGNGbWt3QWFFamNQM0h0Ykc2VWdRREFuaFlXa2RaaFpmV3lKS2V1RS8yNEg5?=
 =?utf-8?B?ZTIrSVJmc093dVJTYi84a0FBVzBQWXpSTUoyUWxVN1g5dE9rKzI4SlB3dThh?=
 =?utf-8?B?ZERXUkR4KzRRaFdnemtkclI5djNGV2kxeFdoa0lmNjFtbm5qQ2NSaTBxZ2t4?=
 =?utf-8?B?QTJITDFNYnBzU3pnVUlTM0hocXlFZGNrQVBBUzlaakVRTWNicURMc0Vzc014?=
 =?utf-8?B?RTd0dVRrcDV5R2lpZ1NxVi9JM1kvR1h2S3RCZ0toWFJReElpVXhOQjJiYUJM?=
 =?utf-8?B?VjM4aE5WZTFsbTRBMmp3cXhuNlc4d1pzb09ydWdidVBpSE0wSlVSSkpVWStv?=
 =?utf-8?B?cUlQZktseGl1ZGptNjRKUDlSMjJOb2FSY3dHbzQreEdDZDcrQXRCS2NwUktz?=
 =?utf-8?B?Z2hmdzY2SW0ra0UwaVEvVUZZK3JlYU5FYnVjMnh3TTJKOVVMelN3RDNhS3k3?=
 =?utf-8?B?LzJXREVSMzZveG5HaXVuUnRwdUhQVGNZV2hNVjFmQmpuWjVheDJGTjAyeTJv?=
 =?utf-8?B?dE9reEFQYi9LaEI2eUJQeC90OUFBRC9ONWNPN0RKcUo3M28wODl2UUEwUUhh?=
 =?utf-8?B?SHFvWU5wWUZqL3F0YUhWd2ZibHZYTHRJVHhPaVJDTkczWE9DVkljL1JxTGh1?=
 =?utf-8?B?SHQzbWhIUSticm5MLzM2TEM4dGE1SmQ2UmMzUmVMTUdRbnZjRGFXSlAvSnNV?=
 =?utf-8?B?ajFuZG1PcjhuQTZzT0pKRmNpY2RBTHJRVjE5UEVUQVVucUo5Wk9IK1FicWRL?=
 =?utf-8?B?aHg3YkZ6dTlIYW9qUVcvdS9hTjVhYW9LQzVWanV2OUdzWmFtVXFwRmJlVEcv?=
 =?utf-8?B?a2VoVUtPMGZma2hrcnRNUlNxdEZuNmZLQlVxcndSMmRoNitZQ2ZhNjR4dmdN?=
 =?utf-8?B?KzNUYnhhNklsNEtLRHZnbEFNMHkvbVVOdktIU25ySjBqa3ZKQ3hBVGI5SnlH?=
 =?utf-8?B?YjFQL2xibnpjWkswbStjNkVVR3FwMW1VYklybVY2RUxaTUpQaUxja2w1Nmx1?=
 =?utf-8?B?OTRxL2lOSmtmVlVNR0xubXJReER3TnJkenMxdUZKZzJMUkwwdFhYK01YMk5P?=
 =?utf-8?B?Ynh4UUFSb3VSSXpBRkY2eUNZeGNsaHRZbGlRWStxYUxjYndENllLcTlXZ2U0?=
 =?utf-8?B?cG92cy9UUGpTZUhsR2ZpVHJLaE9YT3UyYjZXVmVPeGZTU3Z4NnlqangzNFdL?=
 =?utf-8?B?WTAvYnd0d3RFR3BwU2ZQTmovT2k0c0F0MHM0ZXIzdW5MYm1uOXpUUWlTZUIz?=
 =?utf-8?B?ZVB4RG03azNyQ0ZiMkx4cGU5Q29MR1Q4R3BBRUxVUmdlcTE1UldpMDNDV3ZP?=
 =?utf-8?Q?gImsWnMPNPPChupEL4Q/vo2SM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05034cd2-6e06-496a-f089-08dacb96f95d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 08:04:11.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qghO3wFoUQtuUDaLFW7W8QDXZN3hBNeaNS6MIBvUZnLNvm+VOenQMgU9t+5x0hn9JKih8mi1qLVoLUSUQHgPWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8105

On 20.11.2022 12:08, Daniel P. Smith wrote:
> On 11/18/22 16:10, Jason Andryuk wrote:
>> On Fri, Nov 18, 2022 at 12:22 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>> For Flask, we need new access vectors because this is a common
>>> hypercall, but I'm unsure how to interlink it with x86's shadow
>>> control.  This will require a bit of pondering, but it is probably
>>> easier to just leave them unlinked.
>>
>> It sort of seems like it could go under domain2 since domain/domain2
>> have most of the memory stuff, but it is non-PV.  shadow has its own
>> set of hooks.  It could go in hvm which already has some memory stuff.
> 
> Since the new hypercall is for managing a memory pool for any domain, 
> though HVM is the only one supported today, imho it belongs under 
> domain/domain2.
> 
> Something to consider is that there is another guest memory pool that is 
> managed, the PoD pool, which has a dedicated privilege for it. This 
> leads me to the question of whether access to manage the PoD pool and 
> the paging pool size should be separate accesses or whether they should 
> be under the same access. IMHO I believe it should be the latter as I 
> can see no benefit in disaggregating access to the PoD pool and the 
> paging pool. In fact I find myself thinking in terms of should the 
> managing domain have control over the size of any backing memory pools 
> for the target domain. I am not seeing any benefit to discriminating 
> between which backing memory pool a managing domain should be able to 
> manage. With that said, I am open to being convinced otherwise.

Yet the two pools are of quite different nature: The PoD pool is memory
the domain itself gets to use (more precisely it is memory temporarily
"stolen" from the domain). The paging pool, otoh, is memory we need to
make the domain actually function, without the guest having access to
that memory.

Jan

