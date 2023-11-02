Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694D7DF3BC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 14:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626903.977598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXjW-00032R-8L; Thu, 02 Nov 2023 13:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626903.977598; Thu, 02 Nov 2023 13:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXjW-0002zY-5d; Thu, 02 Nov 2023 13:27:38 +0000
Received: by outflank-mailman (input) for mailman id 626903;
 Thu, 02 Nov 2023 13:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyXjU-0002zP-GI
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 13:27:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95758272-7983-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 14:27:35 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8443.eurprd04.prod.outlook.com (2603:10a6:102:1da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 13:27:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 13:27:33 +0000
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
X-Inumbo-ID: 95758272-7983-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYvX+/gzK+APhROE7OBTedZxCL+V+slcL42/NpK41dDdCJkA6gTx1jdrDPteFxXJmKEGjyODY6l5tr+J/9f2mdpfLM1HqlajLpiBGyNZNmxXVdope9mweRxfMK20jnvO6zUjivzMHw3tkTMiTFLVLlCtfoqF1E0BmqdBK2KI0MVAWkWrHD6/JKKHLYvPT7nKvMGyjbqeJAEXSil1MEKmB3oOTJDJujg9QlRY5W8kFstr4y7f+xZOiPxPMo2N2IzSeo5TvqgJVFPsSAhoaDtcLgzDl1iOZzYE1qpQ2WUwhMJmw6Rb/mymclf28spt+PiRAHd1cUFilm4jWq3XbtgJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajsHny3y5i9coSLg7K60qJWyHmWCIPz1/9pdrtL8pAs=;
 b=CHCRFD2D9nEpXEhME/3Q0emZe+DIK89fkLxh+f8FibFuN59GZ19xUU0AcBHJO1fh1e6EQv7IbHY3j0V9JvIkcJJ7tUHbA1V8ZE0MmkQ5y5Oy8CQ6H1KGKFys8CIz8Jzte3HQddIi064xiHLxQFecyQWy80ySXHpHT5vcEaaXuiuv39lSrpCniUmc2/kWNab4YeQPcTvwCETnUYj/psX5ex6z4qG7LoLVq/peF7ZO4l6/091j9uuoZ70J6Yl1i0OaKFeHmNx6+VJ1q4PJvaeUSEO5bh4bFkP3Jb8xZ2MzN+soPZxKz56qSRT9VwsGgIfHK6nv2DAHVLh9M1SQjmLhNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajsHny3y5i9coSLg7K60qJWyHmWCIPz1/9pdrtL8pAs=;
 b=cNyrlKvT1629owj38CM2nsF7BNXbe+5+CtFoqfDMG712C0odT/3bXBL1cCZjyuwvFfyzPjbwLGqfwpCFB4I8yj8farRx3TP09trKm/iaExP8m2kP6SjpyxxVRGNoWGpROI+t/bUrfd+gA6uPxp1hhylDnRV7eaKCMPFVD6tnp+5JOiL7VhUkETuybtI6/JaHnVjiPYquJRfgiE4HUwKQ5blhkbGAUcW5/5H7CLvvzb4ouKZW8WkbPJFvJuN4yVFHsXrEBtyB5ZmW0ninO7tdSWQU18w/o+TvXBCIVLo20JpcaiDTs7OTmMoWb862s3jeGmsyNBTS4meqgRHx5lNbgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d7cd892-f814-50cb-b296-69b957128508@suse.com>
Date: Thu, 2 Nov 2023 14:27:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v6 2/8] x86: add deviation for asm-only
 functions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
 <a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311011609360.2125691@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2311011609360.2125691@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d79b99-bc9d-4184-3e60-08dbdba77887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VRB4lmQ7q8uEBZcN/M/2vGjg0Fbl7GO5Dm1sswtRi69i0k+K5mzOolAXDoF6T2JQ+i3n/DbKa0DuH3Cyq4gjFtHVWmlWbmiHh+FMQbCNxzvHmvn6Vklgz1GglBRxB9DlBusvrCX6+8y7O4m0Ojh18jG47p9RFPZ9MKn5KIjy+L6AviKLfvyzfp0CZYG54o6d/4RKvRfTmp39l7BRnSQCyqJsWZ4bPZzr+vVeyQlvFp0HN8lrDhEi5TeMif4ro3+8nlUNw2mdgBid4z69slzJSEmLJyBXHPsIwWYezbRZSN/U/Eaez8kkgvDEUw7bTLoBIXf5ernokQg8bt34fEopuJNq9nMbz/tjBOszf27F2IahUomCk9+5sMyDZ9bD2SGIsofFXKoAxSv3DulvH9KIjUiOBpeNgdnegvcVwM+1EP9kueTYLs/kS5OQUTK2nj5vjSpq/TgPfX7k59z7cTSuQ8l52O5m8d3X9mgxvu2XWNs4MjfEqlfiNjvdwLtzhRHBPbywucmyFzsFAfzHJw1+6D12zavVEnrdmQcEywJMltxYz6sIE8H90J1cQh6e3YutGTAqDB5La6mb9HryG0aZc0e4fuxVAUFTjfhLt7gWGOULpB2BekCsBu4Bu9HugX9h1aJUbXkek4C6GD9rzHFHTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(2616005)(6512007)(478600001)(53546011)(6506007)(2906002)(83380400001)(8676002)(5660300002)(41300700001)(110136005)(66946007)(66556008)(8936002)(316002)(4326008)(6486002)(54906003)(66476007)(38100700002)(31696002)(36756003)(86362001)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hpSjBuWndQaUtoaklpcDloZ3VabXF4ZytoSkdORHc5OWcxTm9DQXUrdmIy?=
 =?utf-8?B?bzFXaGxTL24vY1NlNjRERDhjL2FQWGRxUm93RWFkY29VdTVCcE94N1dUNy81?=
 =?utf-8?B?VjJiMmdxcEx6OHZDcXVqYW1BTWxuV3VFK0FkREloTFVtamJvbUtwb0FHOVZD?=
 =?utf-8?B?dlpUcEpxdHNZNThTNWFMVWdJcmlhSnVmb2VUQTZWdDAxb0swbjZyeGlpSnFO?=
 =?utf-8?B?ZmFRd2VTUjVpRk1XMFVycE81Y1l6TjZrbUxhUW55bks5TGh5ZmYyMm53Z29a?=
 =?utf-8?B?R2IvazY1QjhzRGhZbDVyZGEwVVFtYkt3QnAzRitxc2FBTlRuNWV1ODY5WXp1?=
 =?utf-8?B?TVFjMlRQc2xldWp2aUJSUTB5SE1iUWpmT1g1RXYrTlFTRkxra1kxMmk3cTlP?=
 =?utf-8?B?TVc3WVJDQjNBRG1mNjY4Yi9Fd2ZZQWJxaWJ6SDBoYVk0UE5zZVV0K3FtZFll?=
 =?utf-8?B?TjVoOU9idTFPOHlBSUFTODEwM0pqem53YUNqQVBZdW9rdkxIdDhBa2pmTFFH?=
 =?utf-8?B?cExBWHczRWFzb2hsbUwra2FKWUFnME9GUWpiZS9ubWVCTXd3VTBiMGhBb3Fv?=
 =?utf-8?B?Q0FpWElkUFc0eG94TnhSalZrNE9vQWROL2UvRVlNaFU1ZCsxMjNIT2lqUmNT?=
 =?utf-8?B?OFU2T3cwSmpqbCtqNG9CRFAyRWZETjJJU0gvaGJQTmhVR2pLRlIvVEZUWlJL?=
 =?utf-8?B?VFhPSVUwQ0wzWjVyTHpZNWVxMHFnSXpUdE0yeGx4YlNJbDRSOVRiczNMcERu?=
 =?utf-8?B?ek9HVmE3TzB0YjZKaVFqYWdnYlYrS1BFaVpOc1hudjNlRERYckFtVldwSEg0?=
 =?utf-8?B?Uzd0clBGTlMxQkRScklVUnBpSlNpbk1pTDBXaVJGdTVyWW5DaUlXVG9wMG5z?=
 =?utf-8?B?cmc3N0pBNTFqZnZud1VPWTgyU3B0b09lNUJPU1hOK0xDa0RVNm9XZitsdlJs?=
 =?utf-8?B?OFZxaktWaG51YWkzWk55RGhsTUNEd3VickJaM09jaE9hU1pVMDZwZFkxaTd6?=
 =?utf-8?B?WjZieU5jZ1RDNWZCck9ZODVKR1pVT2M3Mm1qU2V2RU9lV1hyTjlsbFNSeGhj?=
 =?utf-8?B?L3lpb3NLUGJBdCtjUmcxSk5PalgzK2x4ZU1XVUN4VUcwNEFlaHlNMXZsU0p0?=
 =?utf-8?B?ZDdXQ0RTWjdWRFkvR0N2MnFacTNwVlhhOFMxMFNlTlk2dDUwTysvOFBWSFZG?=
 =?utf-8?B?VVhzeHkydytITnBLdVdqYTdneDZtVGxTTnNYdUFYOS9RNmJaUkFxc3FTV3Fz?=
 =?utf-8?B?QmdrQTFpQmVDWnJiZUQ5bG5YRC8vdkpMeEt0WE5rdXZsazBMMWVTa0UyckZa?=
 =?utf-8?B?blV4Z2xGR3M3SXdCeEMyUk1td0pLNnc0cmNMMGlXVmxTaGZyS3h1bEFIME5K?=
 =?utf-8?B?M29QQzJ3cmtCQ1JiZWI5V0ZjUCtqWGtTbFVDeWQraHArdXNSd3hGeEVITi9p?=
 =?utf-8?B?WjZ3czBpdERJcUVqQnIwNENBR1d4ak9wVkVwUkxUbnFMT2FiaFRCbkIrRERs?=
 =?utf-8?B?d21KU1MvSHlpYktZK2p3akQrOGpSNXFlczNSRmNjcXg2SDhIM3JYZEgySTRC?=
 =?utf-8?B?eEYvd3FyV2JSNmFQd09iZU9yOWNRaGpkV1p4amVIU2dvV2VJUHVZWmpMaUJZ?=
 =?utf-8?B?ZkRPWk9kMG12SlhGM0RCVmZpbmsxcGxFRGQ5S2psYzR3bHVOU3dlVHVYQ0x0?=
 =?utf-8?B?MitGUXBMQ1JhL0pkZU9xdFhzMmtrVmdoV2R0NmRiQUpNL2pnTFk4NWhoeUtN?=
 =?utf-8?B?M2FCUHVYQlYyb29YVFR1clFDT1h1VnhoSjB5TkN1Zk0yK1JhZWwycWk4RjRu?=
 =?utf-8?B?dUlOVk11YmZhMFRTaXhLRkVZYTcwczdVL0lSc09RTUpobUZ3aW1xRW40eTBy?=
 =?utf-8?B?ZXVmZWx2ZnovaERFY05OVDAwRVlDeHFKbnRObmpyRVNjODh6aGdDMDlPb1RF?=
 =?utf-8?B?bEN5VnpNTVpJYndnUXJtK2pCSlVIY3ArQktpVU5hdTI0TXZETkU4Mys4Wjc5?=
 =?utf-8?B?WXJKcysyZGJvK0hrTWZCU29zQ3prOXB0QVYybHFBNk1OUmY0alBqRk96UzEv?=
 =?utf-8?B?YmF6V3I2dGxFOTY2aWRrSnh4WTkxTkZxa2tiWE9VNEFwdlJ2QnZuZEVuQmln?=
 =?utf-8?Q?Q0F4sNcqEXRlAD61EfSrs8/Sj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d79b99-bc9d-4184-3e60-08dbdba77887
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:27:33.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYwIJR+UkTulETIoM5lsAD9JwqbIr/0RnXpfwYMcVD/f1dFkz/2maTC5ywdBPlrApD1vyjc90BYavuWxfoVXAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8443

On 02.11.2023 00:10, Stefano Stabellini wrote:
> On Wed, 1 Nov 2023, Nicola Vetrini wrote:
>> As stated in rules.rst, functions used only in asm modules
>> are allowed to have no prior declaration visible when being
>> defined, hence these functions are marked with an
>> 'asmlinkage' macro, which is then deviated for MISRA C:2012
>> Rule 8.4.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v3:
>> - added SAF deviations for vmx counterparts to svm functions.
>> Changes in v5:
>> - drop SAF deviations in favour of the pseudo-attribute asmlinkage
>> Changes in v6:
>> - conditioned asmlinkage definition to make it overridable;
>> - move the pseudo-attribute after the return type
>> ---
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
>>  docs/misra/deviations.rst                        | 6 ++++++
>>  xen/arch/x86/hvm/svm/intr.c                      | 2 +-
>>  xen/arch/x86/hvm/svm/nestedsvm.c                 | 2 +-
>>  xen/arch/x86/hvm/svm/svm.c                       | 4 ++--
>>  xen/arch/x86/hvm/vmx/intr.c                      | 2 +-
>>  xen/arch/x86/hvm/vmx/vmx.c                       | 4 ++--
>>  xen/arch/x86/hvm/vmx/vvmx.c                      | 2 +-
>>  xen/arch/x86/traps.c                             | 2 +-
>>  xen/arch/x86/x86_64/traps.c                      | 2 +-
>>  xen/include/xen/compiler.h                       | 5 +++++
>>  11 files changed, 30 insertions(+), 10 deletions(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index fa56e5c00a27..06619ecf7e8d 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is safe."
>>  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
>>  -doc_end
>>  
>> +-doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
>> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
>> +-config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
>> +-doc_end
>> +
>> +-doc_begin="asmlinkage is a marker to indicate that the function is only used to interface with asm modules."
>> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
>> +-doc_end
>> +
>>  -doc_begin="The following variables are compiled in multiple translation units
>>  belonging to different executables and therefore are safe."
>>  -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 8511a189253b..d468da2f5ce9 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -133,6 +133,12 @@ Deviations related to MISRA C:2012 Rules:
>>         configuration. Therefore, the absence of prior declarations is safe.
>>       - Tagged as `safe` for ECLAIR.
>>  
>> +   * - R8.4
>> +     - Functions and variables used only by asm modules are either marked with
>> +       the `asmlinkage` macro or with a SAF-1-safe textual deviation
>> +       (see safe.json).
>> +     - Tagged as `safe` for ECLAIR.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> If Julien prefers a different wording I could modify on commit as needed

... wording clarified along the lines of his subsequent reply. Yet better
would be, as also suggested by him, to accompany this with a 2nd patch
replacing the now deprecated SAF-* comments.

Jan

