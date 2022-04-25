Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A050DF0D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312817.530200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nix5x-0007hG-Ew; Mon, 25 Apr 2022 11:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312817.530200; Mon, 25 Apr 2022 11:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nix5x-0007e3-BV; Mon, 25 Apr 2022 11:41:33 +0000
Received: by outflank-mailman (input) for mailman id 312817;
 Mon, 25 Apr 2022 11:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nix5w-0007dx-3t
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:41:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a64d1cb6-c48c-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 13:41:30 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-yDH57CbtPc-o-Iyj1wIjbQ-1; Mon, 25 Apr 2022 13:41:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4468.eurprd04.prod.outlook.com (2603:10a6:208:6c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 11:41:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:41:27 +0000
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
X-Inumbo-ID: a64d1cb6-c48c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650886890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xGJB3x6bOt4UkRisDTcheFJuZGP02K2KtsvDqZG4Tk=;
	b=hNP6b2uwBUklkgEMgEhDbIp5oDSKbbIT54yHnQ6eGlkmE2h+D4rzbtptZ5PxhPx1v/QhF/
	wAp7B2BqFydDsDvm2hIEiB/lxenwedGS+E3tJK7sA47LoX2k3vxGUF38rH7SPd/+5DTQwK
	Pljhr7o1aA5VIg0pXdF4XXit30Ikbrc=
X-MC-Unique: yDH57CbtPc-o-Iyj1wIjbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmUpvrUGu03NWH9cOFoa1IWFyW14wg4GhEgEFlQXPV3qWt5NocWtJFIh5ibr0hpFdGXBj4UCrMxCM3hmMxagsO2mSBNU1MpGUpHUvb8nF0jfv5zBueDc+ziCrEl1X7ReceEXm7O8YQC7rT0yx9CHXMjiiGPtbbPyK32CVQDIBxh4yWLhTxLI3kUjhIByHieDJXtuaiLIsVzIyicxWKyX0RRscQz//mKRbGcEGzzb0cOAlb5GYfHOYQ4BNRhDpE/OUwppj5n/WTVlzMjmxRc3Te+HXotyiSaSSNneLBlmGkZFyjcgiijvCNSHS4GoR2wYfC/Bq/upEIeDlzCJ1SQYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xGJB3x6bOt4UkRisDTcheFJuZGP02K2KtsvDqZG4Tk=;
 b=kiWd0DyHrFurKjGbkiHalw1EVg9jFoYOy2SsyqpQTLVGJ0Kf6xA7NNDNO4nE+4fgbjMrEVMDEgqeCcjIaXu5dh+PJOQ8KJSUUvkltBEx+6q1UoKimC4ppFjWx88VxIcbOI9EtnXwsHg9RU+tDZ3SZ6KK5OwCnycuU4yFCloU91nz72XFfSoNSZNsd+3jITiL9m9PrACzfmnL8bWARmjdyKMM2Mr/jP41FrO2OgMMOj3vgw022br3cyp8oBDAvFUz44IWoAb2W7VTPB4W/GbciH6KRgmCodXlfw02Ugz4OaHDNUgrQipvz3ZptQZEWbRQ/SKUjMmu6RAJcc6dUTv/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5050d2c3-4053-2d83-1a6d-9ed468ed2492@suse.com>
Date: Mon, 25 Apr 2022 13:41:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
 <310ab91a-60bd-f4fa-aeee-28aab43aabbe@suse.com>
 <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0321.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69a9873-8e85-43c0-4c1f-08da26b08879
X-MS-TrafficTypeDiagnostic: AM0PR04MB4468:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB446830E4638465DD188D6752B3F89@AM0PR04MB4468.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dTIQ74rJDuDCjTE81UlKUZG9XcebZN6W4sguEjNXwFBmUjGSOaa0+rAT64yVn84tMr7b/oqQbLnFqTt7o0jwB+8vw067be5DuZ4qfwB52eGuRl8iyOg2zjWIVdgH5bT7UJqgLOsQBFhzA25zDr6ZHdHyi+d7iS2FCAx/XdM1cQ4ShQT6LyxhLLizNP5pP5a3VXT7yslY0ytnV/LBbImwKCPm77VafVCpoF/cl+XxJxYJibPyujzZbSyi6l0uHMGn8WJLt/jZFqOV27UUsg/uZ17N+d4Z3O3O4Ey8EsuWB3sg99pgCNbfT56E871lzXyU2rZ5eUWf/X3OuxEeOWWJgpUBFAe6hSq4BX15IdE+5LL0MP+B91iXIRbu4AZEBL1m3sRgZs/g+UhEM383o+DtxdVRdQckYF6aTGIQyaKMXhfbwAsUc3jOvxadgKgeEkoP9W2bYFWgPJIFZQY+F6257Rg/pcLst6F9hXPT8mjbI8QY/aa8+4Mkh3gHRiZUUqV0l+ki0toWOs+xOtYH9uMEfgBQAhHbqxy33yW10nRe5lg3pIe0vlKRxvrtTxh9vOusI7W31r93XJlWX+LFxLjB8lLJriAurVdUt/V4zGMwtxt6YX3thlNwfPnsOLcWR6/AOsnDJjSc6Z23lgUmXcl0Rf4oA4wf80GPJUl+9maKK6XojjhqxY1V59/MbV6YdQkAtgotvp3tr1gdtsWMSLxE7eR1OtnPcW0uzBhPQBzrwnU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(4326008)(86362001)(66946007)(66556008)(66476007)(8676002)(31696002)(186003)(6512007)(6506007)(53546011)(2906002)(6666004)(6486002)(38100700002)(2616005)(5660300002)(36756003)(83380400001)(508600001)(8936002)(7416002)(316002)(31686004)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCtKbmZ4Qm9WRDNlcll5aUEvVmQrOWc4QWFPUUFFOVA3QUJod1ZCZXlKek5U?=
 =?utf-8?B?Z0tvVFVaTmlTMWlhVDVHeHptNkt4ZUZJRFpZVHpxMFVEQ3oyMmlpR0FoTXVV?=
 =?utf-8?B?YXBHSUgyV09JZW02NmdpWStMOTNxSVhDcTY2UnFBQTArY3VJWWpvTzlrYXJr?=
 =?utf-8?B?VUJjcTExMm9PVmZWQ3VxeitQVDBmNWpUb0lCaHloT0NTV2Y5bTZraUxyMVJ1?=
 =?utf-8?B?Ri9vVXl0YkhSQVZFdjd4TWFJWkJnSDI0UjEzR0dFQXBESVBQTWp3NE10ZmRI?=
 =?utf-8?B?TS8rdGVLM1AvS01adlUyV0g1R21sR3RuUENIL3gyUlFzYzB5YWhvaWhGREpM?=
 =?utf-8?B?K3NVeXpKRlZWN1dhbllmSDBIM2U0RG5MT1hiWTFnT1ZRRW1XdUtvRG1kaTdt?=
 =?utf-8?B?RUdXVVJBcldZbk1JTkdXOVpaUG9pM1liKzZLNVFuM0xNTUYwdkpZVy9BMFE4?=
 =?utf-8?B?ejdteWxwMG5nOUkzSm9aSXo0UHE2TEFJQjhZdzMweWRDR082VEJhQXB1NUUz?=
 =?utf-8?B?NVA2TTR4RmI4WDA5UTVZQzYrMkh0ZXBBMlBVRmVvNGRxRzJtaDY1VGdDQTZx?=
 =?utf-8?B?alNsTzdQVGc0ZDhNRmdFYmVYNEN6bkdva2VXTGxqT054cGIveEhuc1pydHlN?=
 =?utf-8?B?SHNPcGtjMTNydnQvT080Z1ZpSFRKT3lVUlZ0aCttaGZBWlVOeWdmakFaNVlG?=
 =?utf-8?B?dGEvVFNJK0ZEU0Voay9pVlcwczRXWE8zN0FRZW96RW1ObFZQcTZXTGtIS2sx?=
 =?utf-8?B?c3NhcjBxOTh4K212QXJrczNidWFMaWJuUm1MbTVuSFZMcVlrc2pnYWV2QzVG?=
 =?utf-8?B?SHhObm5md2ExdHQ5NDVZVGYxM1JQVnFqRXdIcDVGZVpYZUVGRWppbk93b3lT?=
 =?utf-8?B?VCtkSlUvT3lKNnFNV0xQYm9kN0NOdEVFY3RIbVRFUEF1cUpaZnEvOW05UHV6?=
 =?utf-8?B?SkZTbEZsMDl3R3VaMEZVM2V6dmlKc1l5VlpTTlAxVStLdVZDc2dYVWNQVFRH?=
 =?utf-8?B?eHl0bVJOOWExOXEzYThPcFJLd21lUXVleDhidkg3ejcxUHZJaUZHUElsWlJm?=
 =?utf-8?B?ZkxTenlhWHVYTlpuZjYxeVUzMjlBSkhTMmFGM0QzS05jenprVi9tSjNKcExR?=
 =?utf-8?B?OXR6YVEvMDk0QWlvT09tLzNFRzJpSmtGQXJLM3o5ZjhUMkZFVXBlU3A5ZVpE?=
 =?utf-8?B?R3FsL0tBSnZYcVpGVG5VWmx5YlZoNzRJM09CdzZsUnhBSUhhVmFPTWl2anRS?=
 =?utf-8?B?a1JaZ0Z4bmNnWGEvdk16eTRVdUNzcFBjYk5zL0lqUU9aallzVlFEUEtQektN?=
 =?utf-8?B?cGg1MHIvSUNDV3AxT3A0ek1xY1M3TWZzam1EemdkYmhiTTJZNDVVdG51VnlD?=
 =?utf-8?B?VGhIRTNzUkZsRm9TV280a0Yrb1BDQXV2anVaUjBiT1JyYVo3VDRzS2VqamM1?=
 =?utf-8?B?d0lUSnlRUDVqMXpJN0tyNnRsbHUxWXoyR0wzMDNGdWVCZ1pDL2RMU3A5TVpC?=
 =?utf-8?B?N0pzR0tUR05mZzB4cVBjOHRWZVpWaUFDTWs3UklCaGNCUHNOVmZERXVHSEpo?=
 =?utf-8?B?TUlyQ2IrV0VPblRKNGdZcUpUR3VtdHRoUnFsWkNwZ1QrVCtIZEVKRWYwbFNP?=
 =?utf-8?B?ZU9OaVZ3Q2NaRFJxMVpXendIN1JPZ051WjNUc3JieGp5Rk5IbWx1anZyQjFC?=
 =?utf-8?B?TXBDR0JjNXJVRnhkL1FOUndtcU9HSjZ2ZG5XNFVrRU85Q0YrZGhBQldITWd0?=
 =?utf-8?B?Smp4VzZRQ0UvbDdRd2MyVkZhYkNFNlI4V0ZQMFg3Z0QwOElCTVl4NTc4L3o5?=
 =?utf-8?B?ZEJpSkhIMjVXdDN0NFl6bVA4OStiNjV3bUNPcGZyYUNBaFFNYzR5L0EyV1gz?=
 =?utf-8?B?YlFaMUFuYUVXUUFSR2hpeTdBblZncmRTbUE1V1pXdHNsQXZsWU5VZkI5SUwv?=
 =?utf-8?B?YXFQdzk5YURwb2pGdFZmWDd6SXQ5VVdsZmc4SEZ0MTFOZDdHb1BPRGlQbnhm?=
 =?utf-8?B?VThtUTJ6ZUNnb1V5d1FxTmlYUXIzN2VFU2VDVkU0NnRTYmxSb09UL1V1MUFs?=
 =?utf-8?B?ejlmVlRPYlBpcjh1NXBVdnZtOVhRbWZMOVpiTS9sNkpIWDFldVBaYWY3WjA4?=
 =?utf-8?B?aFM2OHExVE4zRDRPOTdnVFRYS21HZEVqNzZvMDUvakUyYk11ZXpPczFDRWd3?=
 =?utf-8?B?OWNSWDY0QUhpVGhoZXNDVGJPVDFWck5xeEFBS2NmdWJ0TmFBOGlLNDAwN2U0?=
 =?utf-8?B?dUtlVXMxUTlZRng5T3RCdU0xUjI5cjVQNWFvVnJWTkpVcVA1STJDRmVVVTVX?=
 =?utf-8?B?aDBkMlBDYWUvcTNXbFkvZkFDWmdveDgydDNaN085RFFCeHI1THJ0UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69a9873-8e85-43c0-4c1f-08da26b08879
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:41:27.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooZ83FOwhXBHZuhMRJdfXhLDaDSfKCMvmbZhRkDOnXCCiQoWzN5P+abnSLiQ84T8VU+JR3z9pCYmryJZPlzVVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4468

On 25.04.2022 13:29, Tamas K Lengyel wrote:
> On Mon, Apr 25, 2022, 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 22.04.2022 16:07, Tamas K Lengyel wrote:
>>> On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <tamas.lengyel@intel.com>
>> wrote:
>>>>
>>>> Allow specify distinct parts of the fork VM to be reset. This is useful
>> when a
>>>> fuzzing operation involves mapping in only a handful of pages that are
>> known
>>>> ahead of time. Throwing these pages away just to be re-copied
>> immediately is
>>>> expensive, thus allowing to specify partial resets can speed things up.
>>>>
>>>> Also allow resetting to be initiated from vm_event responses as an
>>>> optimization.
>>>>
>>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>>
>>> Patch ping. Could I get a Reviewed-by if there are no objections?
>>
>> Hmm, this is a little difficult. I'd be willing to give an ack, but that's
>> meaningless for most of the code here. Besides a stylistic issue I did
>> point out which I'm not happy with, I'm afraid I'm not good enough at
>> mem-sharing and forking. Therefore I wouldn't want to offer an R-b.
>> Considering the VM event interaction, maybe the BitDefender guys could
>> take a stab?
>>
>> Of course you'd then still need a tool stack side ack.
>>
> 
> So my take is that noone cares about mem_sharing, which is fine, its an
> obscure experiment subsystem. But the only path I see as maintainer to get
> anything in-tree is if I hand the task of writing the patch to a coworker
> who then sends it in so that I can ack it. This is clearly disfunctional
> and is to the detriment of the project overall. We need to get some rules
> in place to avoid situations like this that clearly lead to no development
> and no improvement and a huge incentive to forgot about upstreaming. With
> no substantive objections but no acks a maintainer should be able to get
> changes in-tree. That's part of what I would consider maintaining a
> codebase to be!

I certainly understand your frustration, the more that I'm similarly
affected with a much larger pile of patches. The check-in policy (see
./MAINTAINERS) is - I'm tempted to say "unfortunately" - quite clear
about there being a need for a 2nd party to be involved. In this case
though I've pointed out a possible route to unblock these two patches
- let's give Petre and Alexandru at least a few days to possibly
react to the ping. Apart from this I can only suggest to put this on
the agenda of the next Community Call; I'm afraid I won't myself, as
I've had this topic there already way too often.

Jan


