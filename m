Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800067CD7A3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 11:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618459.962124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt2eD-0002ou-GN; Wed, 18 Oct 2023 09:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618459.962124; Wed, 18 Oct 2023 09:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt2eD-0002m7-DM; Wed, 18 Oct 2023 09:15:25 +0000
Received: by outflank-mailman (input) for mailman id 618459;
 Wed, 18 Oct 2023 09:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt2eB-0002lr-8b
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 09:15:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc8e32f7-6d96-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 11:15:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 09:14:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 09:14:51 +0000
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
X-Inumbo-ID: dc8e32f7-6d96-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrqYr3QRDC+NqcKXfmmXX8QOjHfla2xfuZCj5yTjtwrIiswUp1C4Zb0ZRerNX1qtlWxL7TxPM+wvV1XcAfNOEgEPawNgC4b+NKl3taVq8LwhxrccTQPwhlHf+mVo2aewkmpCtF3eBe4l0yzXNRj8eI+Fc51yfEKIROATNZXqGJKI+xjAIH0qIfW3obJMCK16vIG5PXwOyUbVCjj9PkPiy6OjwORZHHBg8/oYOuEqhivVfTN1oxyHDJePArivrDwMC8RTzuMpW9NRj609BuJDqnHmAF58TFT3uEzz3OUA49DPyrFdFS9FWMMWo7yYZ7MDSnXc76my70IxUelvNNJIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/d9klQd5LsNya+up6vzr0ff+wdYeA6/XnAet6JRZuk=;
 b=dhxhS1p4MqzWAXWxh0I4pRkYl8qHxg7kc0MNXhSZP1oRAAVdbUJviL4xR+O2nXbWTTbvki++/hA2Z46vOsZcfihMs3rRo5cm6Pp2vPPFODTaTo/bVCEifPjjO2Qltu9HYCUDkXZN5x1HqPdu80REDw1h8qtTYIg2axM2JuEaQrsMAVX9fCYsjUp9EtD02G3PtIQ1O7y4J00B3XmzOQkOGtxtj59Z10LpsYP+E4627yvK6kj7WxwVwTLVQ3fJuaf51koVvlFYzizvh6bcRhvWc5NrtWcHqKEUIb0CDDDzRMeCiA7U0OP2Usf9djsEzVmhXl8XzbwFQeTE9gDp1ziyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/d9klQd5LsNya+up6vzr0ff+wdYeA6/XnAet6JRZuk=;
 b=MMdKbN1c4aw/gLscFuBDJRtPbohhwmotAW3wklfDNnHb8AnTyMw+xzgQ4PKtDcJbThgPYswV219Y6glWBvV9neuK4OxG1oZfHZeGVnskPCzfwowuVV42H4wKwH1pWNsMUUoZlqp3NHYXunm/imciH7TvwEhIxPDUOUEn6wDD8mnSsf47XyafmGEyx5r6QkVzjV5ofrq92c8Nkc0dtTg8VA1p9DAzaeRgEHEetDTvhwOAsB9umTWwGAq11Jm4ZhmyQf1n8k+ww0ptMKUg4Bvou7bmOLCZoSexkuR7gWlBGYMBmefJ0tvi729FZ7lYfVhyLv9xZYGdQ+rCzVia5g5grw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16f079c9-4da0-8cc9-b7da-2c00995ab34b@suse.com>
Date: Wed, 18 Oct 2023 11:14:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] iommu/vt-d: use max supported AGAW
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
References: <20231017130943.18111-1-roger.pau@citrix.com>
 <c6e38ef6-87ef-d1f0-720f-4db6d307f667@suse.com> <ZS-dM2TFYefJ272h@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS-dM2TFYefJ272h@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: e514c96a-7557-46bd-fc60-08dbcfbaaf66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8SKSKuKrZItTqbqee1tn4q/r44E6R5p3jDHMMhflJoLFRz8BmtLWQCKWU9KGKxkcN4jgoVcDwBMAJR8L5PlPRZRRvV7hV1nE+Xd7vnSrSu7E6Qd6VmHeKAKy1l6TeK0rPWderl0tBeEmwS67tFLCPrCgTg6jUyMjmKbWR8QgSMmgFGi+at0akfNbRfxDryZB72iKG39F1ul+0CcEaZicYJnarsBMb13xR1AFciCvrFX3qYUWUacK83yKandozo8oY8jzBJMaZkCjGW6xwtBmeODxU3z5UrNx8daoEvzCLKCWiOEF7TU0dsOS7GkkEKXinJu1IWI23dOEA1SrMDGFf3CttHhnArFxy8bDdSg+0h8IcrTTwexGEIFUzB1wtsJraSBeYmbbj5YdlrsAxIT9dRa4TgqsQt33LGvSKnwVQ3iUW0hYHO32m8I1QaPx1/22jQkiKXtQdjMJn9SnW/NwoR4j5688Dc/e+W1oeDqKPdTMy+1h2wAQfCO6/tnyLnrmNuwNyrcrfUraV9nye//MHNYYLBZ8AxVk69Y0j+ICDcVcgpu9x+pQWFLPm/+wre7KFwGqDwbXbapFVVYDc1eYKYLw/PXRv5ZwMYLCm6NuH3DFC4hb9R+jyWUZp31n2GPi+XPl66ofh/Npru2iVvOHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(66899024)(8936002)(5660300002)(4326008)(31696002)(41300700001)(2906002)(86362001)(36756003)(26005)(38100700002)(6506007)(2616005)(478600001)(83380400001)(6512007)(53546011)(31686004)(66946007)(54906003)(66556008)(6486002)(66476007)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WksrNHVtNm5USldjVUxCcVdxeVQ2K3JOZ1JwUzNrWXVzZXQyM0FIVVRFUzdV?=
 =?utf-8?B?Y2tzM0t3QWNLUjMrcjVZeFZYNlRZcS9MZFNvb3pBdlk4djk1eFpXMGhuMU83?=
 =?utf-8?B?Ymp3Ly85OGFDRjhCOXl4UWY1dmwvOVFTV0FZWnMzK2lrVzZudWJDSzlobXlN?=
 =?utf-8?B?K3o1NTBaeHRhcFdEc2NNTm00SGZXazJ3SW5PdkFjZ2UyRUhlUHphd01RZWUz?=
 =?utf-8?B?ejQ3VzVhaEtvdkpoTU1UcWNaUmtTZi9tbzlRbzZzSlM0KzF5VjdiNEM0WFNn?=
 =?utf-8?B?aXVabytLcUp0OEZjMkk4YS9rUEFLeEhpVGQ0VFg1WHpyZmhKRXpHNHpRNWcw?=
 =?utf-8?B?bEFYeFAwRGlta1M1OC9YdVViTkFZcklnalFhS1E2QW92Tzk3TXRsMmQ4UVhs?=
 =?utf-8?B?ZFBqZk9yNWRsREpvZ0FteE9pTWpoclpZUUJydWdKZ0RqcVZJMEY2NUtYQXNH?=
 =?utf-8?B?TjdkM1J2Vk11S1VCUG1kaGc1WlFhZytJODlCaElPSVBpMWZXWWJlalhTVG1u?=
 =?utf-8?B?bCs0czhmOHZFdUVtbEUxZFM2YjV3QzQyN0hKRFFMb0U3TDBrVURkOXY3bTVl?=
 =?utf-8?B?aklINVQ2dnN2YWhQN2lreVRiUjhWZU1rZGM0L2ZNWlNwLzJhcmZGcFF1cjBz?=
 =?utf-8?B?QnNrcDZndGFHL1ZpVmVyZkxra0lwNkFHOVJhNGg1akgxLzNEV3RqMzF0dXBW?=
 =?utf-8?B?cDZrazdZNHM1cm1qcXZLSzRzYUNPUFlkNWpselhGUVdUQkNFL01oVG95UVhK?=
 =?utf-8?B?OG1nSHJEbmdSMnNldUZYR3RpYUltRng0TUh1cW5tUGVNQnVvWkw3cWdkdzFW?=
 =?utf-8?B?RGtwbXQ0amphNng4cyszWlpmR1ZTcUsxS3JUaGE2RzJpZ0doUUFWMXRlMFdL?=
 =?utf-8?B?cnpkUzNOVmJCZWI3RVBUU3hUN1VrT0tTcUJOdlBTaTNvcTV4MCtiem9wazlB?=
 =?utf-8?B?MnpVWjZwVTIxRVh0MkhYYlNkamtVc1hyc2ZMVG5yeEZUQ1hzS2l5eFVzVFcw?=
 =?utf-8?B?ME5HdlR1Y21xMHV2eGRrcHk4bHFTL2RsNG1pWDZ5c0o3VjJodVZHUnBpTzlM?=
 =?utf-8?B?RUtnN0E2aFhyMEwrZkhWZWxLTVVJaklreGJCSlI5VERFanQ3bWtwNzByOHBZ?=
 =?utf-8?B?TGpXUGJVMXpTRzFEWGF4THlEdUVZcCttY3g2UWVOejZuTi8vMGpLbjN6em5h?=
 =?utf-8?B?Z1diVUpwTkVzS1FIMnh6dktVbERodDF4NXdPaDNrVzFQaVF5ZGRLNXVPakN0?=
 =?utf-8?B?Szg2SnB2N0laU3RYOU82c3YwM3l2azZ0K3dRSlU5OExBYXFvZWxmT3hHQUg3?=
 =?utf-8?B?c2dwbkp5dEg3dWgzS2pIN0o4KzZ1QTJmQUxwazk1eklGODkrM1ZDalE5dnR0?=
 =?utf-8?B?Z0RITjl3dHRxWU45Kys5SFJLVWYveTk5NTFGa0c1Z29PS1ZJYzhMWGZheVpr?=
 =?utf-8?B?alZCOGJVVklHMnVNdWV3dGFVcnE0UGRZN2NXUlRjRHdpWDlTejNaQ1BpRGFG?=
 =?utf-8?B?OHlVY1djQnlNYXJ5UUEyeEtVSnpLaHJZaXVOalZ1UmZ6UDJjcjQxcERTK1ZH?=
 =?utf-8?B?Ny91d1p1blBoMnAvcVRyMHVRWU1jTmNYa0FjN0tPakR0WFJKd2wzYWlwUUIy?=
 =?utf-8?B?ajBDdW92NnhBMnhDUUd6SENGVE1jdjErZ0hzTDBwTVlVbCthVVp0QWlYb1Jr?=
 =?utf-8?B?N1VxOXZjTllSWm1DVFdYMnAyNFdQKzJPR0N4eWJqdUdrbFpXVVBwTmU4a3M2?=
 =?utf-8?B?cllldUMrZmUzT1BhNXhEQnE2bFo2bnllbmpQajMrQ3FEMHpFZUVQWDJZWnhN?=
 =?utf-8?B?OHB3MWJvV3BXQVNzWTVSd1FTWTFWeFRLanFRbFhEZWI5VkVRRHRMZHlrakta?=
 =?utf-8?B?cDdBVjFDV1NuOVVnWjBOeVpGc0laeVVVQ0w1WDMxT2lUZ1VZaVAwM1BrSTl4?=
 =?utf-8?B?aU9uYUpkcmRFd2xtaFlhdWcrdzNwVTYxRFRwWFZvblltNXQ4Wm1NcXd5WmhG?=
 =?utf-8?B?emNxdkdwbWF2UktoR3hEU2VSTktJWkFwSGJKZG5rQXRUZVFHK2ZzS0ZtV2pV?=
 =?utf-8?B?aXVQY1k3VjhaeSs3M0JSOWtodjJrT2VKLzY1amwzUmlCZzN4a0hLZ2xOR3Nu?=
 =?utf-8?Q?f5i8g51NSBD2TcNs0So+F6f2i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e514c96a-7557-46bd-fc60-08dbcfbaaf66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 09:14:51.7854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys/XCH1q5PSYE+nXDDeQ1+iitQ68D4zRowbJ6XewzQuE/AwxUClRwzEa5h6ej7DsZFs699D2V95Hibs9S0bR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

On 18.10.2023 10:54, Roger Pau Monné wrote:
> On Wed, Oct 18, 2023 at 09:54:15AM +0200, Jan Beulich wrote:
>> Taking together perhaps:
>> - nr_pt_levels needs setting to the larger of 3 and 4, depending on what
>>   hardware supports, for use in non-pass-through entries,
>> - a new max_pt_levels field needs setting to what would result from your
>>   code change above, for use in pass-through entries,
> 
> It needs to be a per-IOMMU field, as I would assume IOMMUs can have
> different page table level support on the same system?

Right, hence why I also said "field".

>> - min_pt_levels could then remain as is,
>> - for the moment we ignore the forward-compatibility aspect, until the
>>   underlying principle has been clarified by Intel.
>>
>> A possible further complication then is that we will end up switching
>> context entries between different AW values. That's not an issue when
>> we use CMPXCHG16B or transiently clear the present bit, but our best
>> effort fallback would likely be of security concern then.
> 
> We would need to update the AW context entry field unconditionally in
> domain_context_mapping_one().

Plus (just so it's not missed) purge the corresponding assertion.

> Hm, it's likely more change than what I was expecting to perform at
> this point in the release, but I guess we cannot ignore the fact that
> SAGAW might now have bit 3 set and hence passthrough mode is broken on
> such systems.

Ideally yes. Of course for the immediate purpose we might go with the
smaller change, but then with the description mentioning (and
justifying) the omission. If there are 5-level IOMMUs in the wild, I'm
afraid that wouldn't be a (good) option though. Otoh people shouldn't
be using hwdom-pass-through mode in the first place ...

Jan

