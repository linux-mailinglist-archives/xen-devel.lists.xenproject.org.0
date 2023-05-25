Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172C2710B91
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 13:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539539.840520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29aZ-0002O5-KU; Thu, 25 May 2023 11:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539539.840520; Thu, 25 May 2023 11:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29aZ-0002Lj-Hn; Thu, 25 May 2023 11:57:03 +0000
Received: by outflank-mailman (input) for mailman id 539539;
 Thu, 25 May 2023 11:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q29aY-0002Lb-3S
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 11:57:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc65663-faf3-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 13:56:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 11:56:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 11:56:55 +0000
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
X-Inumbo-ID: 3fc65663-faf3-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoBEpURevyiRtGI33kqGWUt+V/AMQeSgcFTzZGmz3lzZz8ITOu3zFPRvaTHMaPVBmxlvhpeC5u9K4G6mxMaOpfnP0Za6OUGWJrPxlMqugzwZcr5R0LrNhoZzIqkhbGSCWt1xc2NJyNkFUNPM1IvOIUmWj5Bvl7r89W8KVF6A+/KGL25GVcO7fTvsrQuPGJgGjKPxl5w3wSvGKsOAW0GP7f/jYgLoBFGpMbi8mUENSk9YwcnQN5ElyYIK3SlU229rAdLCsfWeM+HQB+AnxM7eexIhN27puBaPskB/6yyLr/RQ73YHDbbhA3Oh/ppSlkN9uIKBEzZ24Y0CfgjMG1Qdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mVQ1Wdu+XW6QNw/E/Hho87SBUc3tt0I9Q5fw0s8mF8=;
 b=eN/JwXWwSayYoNraaA+dl5v09VLOXrnlfty3u3gMwmsg8G0aSHa6UnNcJAw5JhHstcTAqZfNn314z1OiApWDO7dSSso69tvjCHB13a6APZR93bHnNNgVNOlr5wEdBJRjNRLFdgLG3qFLjXvP1S2pI5GYRgeCQxJVbktg9q0OcoFBeitDqJaLs2BEIfciFXN7quDMBJvLqy6x1InNEG+POTPQNHGPV5GHZpW9vdeMN8Z7T+Bn9Q8Wv00zfqHKu588DJRJ9tI3SppvL52g+dejyWEa6L48//mhLggSLwdlwEBpTehyPbdBSc6FiyfN166SsBuGIj+z6snrwFqMIvx/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mVQ1Wdu+XW6QNw/E/Hho87SBUc3tt0I9Q5fw0s8mF8=;
 b=ouHa3bxAqCKcUlx8L7tK6IFkNAa2ObPXwL07jbK2PH9qsHdc0kEWijxDlK2cVfJeKvfigEGnpUbnrVAll8sRmd40aTsQaAwUjYXhpN7JUgHiZITkH09p3VFAY1/bYRYsFlHklxVmbSNNDN6I8U42D4GUseIIKhpkExNdUs4SEEWNxGmwFdEZJ7w1S72EYzA36VdQxgLugBQ0PtZdgC6PYSr7jIq8CTdZIj7Rxz3HK3AD8ONOOrbn8PgM/uyudWjiusp6nD/yQctTIXz++4vVaWyw5eIqTuL+viSXzzShlTUQgvrF73EUphji4t5Z8eBm4Wze6DItVI2sGGNBYKCVBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9528ea84-9f10-d10a-b2cf-798434d48a59@suse.com>
Date: Thu, 25 May 2023 13:56:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 07/15] build: move XEN_HAS_BUILD_ID out of Config.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-8-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b0e497-f8b2-4666-9de7-08db5d1722be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qmu/QAqDrB6Jz3dwp5z9F0n36Y3iu47MomdcKmMSAqUP6wWLogEInb3OGHhM9Z1jmHJPTC53jIWlEx9PciGwXVTAmTY8QKcBz+nTamaQVdAdBIxY7kCBmuQ1TJX978KfQYNmKfnJ1tkJsOOsqUFsArmwZI0TOiWPjQ2nPebdtSyABhTziyE/0LaX6uSE8aqro4uTJfQniqsbes79HOa8nqXKtih0+WWfdwtLixa4lBTrIZMvZvwjr6EjT/4JKUiOQ4ysqQGfrz+qMpfXHmhtTb1bofUTpCFHD+ZUlOp1FX+w7g1Mbg/Fr2m4anhTGlICJSJDRuzlVQZuGILZiJfWmLnBW1FQaNMaomlX+7YKEKqIA96ZzNbCB8JkE2YqjEfNEBf02F5ICWqrOk2C5OUhxTq7iWi86+RV/8Qb2HCdifusvSMlBi34g9kclB1XtEEQZ6WW+3FVaUQRUp+3uJuFhvjpxFgvhy9NVSDvmdyr5CQAp0UXLvEIrBjRNM+8ys4q6unzpD0QZ83kTjOO5nZ1ZlNuH8OJtZHasgHcLpdVj7w+MYSoP1Owncy9agJKrMbY1mM+7b2ccHUTYwa6Bh8826/290GnIoocR+LvHJA75tR5ARXSIWtKbx6eKK9JGDZOVotmdLEU+5AFN2Rnkhj/8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(31696002)(86362001)(38100700002)(36756003)(6512007)(26005)(6506007)(7416002)(186003)(53546011)(5660300002)(83380400001)(2906002)(2616005)(478600001)(66946007)(54906003)(8676002)(8936002)(6486002)(4326008)(6916009)(66556008)(66476007)(41300700001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjZ1SS84V1JDNU9nbWhuSmpDZ2tvWVFuaElETThNQXFEWHhQMHNMTVN6RnB0?=
 =?utf-8?B?YW44N2ZGcCs2WTFSaGRma1doWm9ib1doNU9HZ0ZvRkdWcW80MmdpWkRTdzRh?=
 =?utf-8?B?RDc2TU5LYmE3WEptbis0ajJOTnNpMU9kNGJQa2ZkM1gvUnJpVWxYZTdpcExo?=
 =?utf-8?B?VGdVRDdoV3RPclZkZWVmSXVFS0YvTnhaYUJEWXgyNWkvb3ZwL1JaQXRkQnl1?=
 =?utf-8?B?dTJzVldLRDRWU1VVT1JQVzZKNUVoQjdibHNXanBzeTZJbVZJcUZxNThCQkdQ?=
 =?utf-8?B?ZG1pK2FFTWJMYytSbFU1d3FzVDBkelZINnRGZlBmNGJKaWpwN0F0eWdRWFRD?=
 =?utf-8?B?UjVyak1mM2tsaUhyRFltWEJhTEJKSzN4Zm5DeWF5RDhQUzBra0RiV25jakt1?=
 =?utf-8?B?NjFwTE9rcTBYNDJMZS9TVHJJZnRXS2lMS3NSRHU2QzFsVWJmZXljUGUyVi9h?=
 =?utf-8?B?V1ZxclZkdnFWUlEycXc1akZRcmpxWW9FTitxWG5qb0duVXpVWmJwNkZWS1Q0?=
 =?utf-8?B?enhES3Q0d1hHT3BWOVBNRXE4YmV1dXBBSEVGZ3NPTUpQdzRmejhqQWhxNXZJ?=
 =?utf-8?B?cXVIRHdoTlN1Y3hXWjlXVERRQlpjNFJuV0djRU1oQjF2K0svQ2dva1RISitV?=
 =?utf-8?B?UVFFcmlqNmV3TjVOWlp5ZzhLcU4ySHVxU012TkE5dEkrNThEQTZiR3dTMjI3?=
 =?utf-8?B?ZVNscHJNMExmQWh5RndlRE1hZllpK3dnZFVLSnNSek81ZjFiekl5VUE3ZkJW?=
 =?utf-8?B?Mm1IRjFJRGQ1T1FWOG5UZTQ5eWVDckRFRTRDdkFPazFwZ3EyRW4zQldaeE5K?=
 =?utf-8?B?Tjc0OEEvVkFNanhtdXBMQUx5Kzlpd0RMdVlUeHl5UW44MDd6T0hxc3gwL3Uv?=
 =?utf-8?B?NWNqNVRTT3Y0Y1VsQmFGc3FPQ3l4cG80TEFhbUlTaloxMnViVFpFSTd0S3F0?=
 =?utf-8?B?UmdRODhHWnJyMlNkZ1pmQ2dqS2NPMHJvRlpqRzdoL0JGTXRNcFVYOER4UVB6?=
 =?utf-8?B?MjF1UWZJblVabmZuV3Rucnc2RTNSQ09IcEJKWUo5MS9IWTZtMlEyQUo1UndM?=
 =?utf-8?B?bHUwQ3BFcXNqem5Zd3ZGdExBQ3duRXZYL0ZhVXlhY0dVVTdOSG5CcUlMaEJS?=
 =?utf-8?B?SXh2NE1lREdpaG9OY0lJZStLb3RWcGhoREZmTWtobXhDSWZSU0k4NENQV3p4?=
 =?utf-8?B?UzFocVlVR3YvSlVhVEg2eEJNY3lQRkh4cEF0OThFV1JzbVVoVDh6NjgvV2h2?=
 =?utf-8?B?QytCY0VabkJaWHh4Tjcya0ZxOGFiMVh6dG0rWW5nREdWcjZib1Z2SU5GWk1h?=
 =?utf-8?B?ZC9ER2VrRFhWVlV2dU5BTjI2VzFQM00rVW1vMmx1TzljVWoxajMxSmhEcmZm?=
 =?utf-8?B?eDB1RTlsRXFXZktBWkMwOU5NeWo3RnduY3MrYUtOSFRTa2Z5YndPN3JwaFNX?=
 =?utf-8?B?N2tBdFJBcytYMjFSbzFsNjk3YjduYUxOWWdKQ3ZxUmFBZlM0K0plYUFGRlZZ?=
 =?utf-8?B?U0UwbG55RVNkQkF2K0ZDSDd4cVZsbnFnTGxLdzFnb1NnblM0VWVsVWdMQ2Jy?=
 =?utf-8?B?YW5lSDR3OEJlRDQwL092bnFFcExaYjZuZkVJeHNUZzg0amFrNWJEa1VwUEVH?=
 =?utf-8?B?WGw4MEI1c0VkdHZiVStTanpCSXRzYkF1RFlNNWNzYVRxaTI2NlNCcFE0OUU3?=
 =?utf-8?B?b0h6RUNGSFZNcmliRWkzQ3pCVFh2Q053WlRsYmVpeWRaVWQ5ZDV6bElzSitO?=
 =?utf-8?B?R09EbmJ5WnE2OVljS01rRXl5ZjZ5a01vVDdlWE9kclJtZVU5bklMdjVaY1pT?=
 =?utf-8?B?eFgxNWRNcnRWRkMvR3l1QzRZUExpb2N2NVZTWTJMWTRLZFoxZUxqc29GZWRy?=
 =?utf-8?B?anBpMVRpYlBPV1BOV2F6c2c3NC9QWXd0Q1kwcEFIcEpTcUpnMTAvclNmaFhs?=
 =?utf-8?B?WFR0V2RZSC9pWGttSHAvbTZRN0ZybDJLbTdEckQ5THdXOXpUcVVWRURJRnIy?=
 =?utf-8?B?cTlHMnBwbjBmMEw3NVNIcmpLT3pTK2RZbTd1TWg4ZmZVbkd2WXRLTzdhREx2?=
 =?utf-8?B?c2g5VVgvOFFZQ3Z4TkVaZVJ4cS9FbUdhR0R3OXB3TG00OUEzUW9BekZJRytU?=
 =?utf-8?Q?2BbzvIuuXbJf6D++AaRzE0hTP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b0e497-f8b2-4666-9de7-08db5d1722be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:56:55.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EF9oUs00MdVTemF/Muvy+TKYozwdvcFMKhF3Y1CzPD/Vu3ZvtAP51TkQ9lrg7y9X8OLBhYTud2WZBo1JWXULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

On 23.05.2023 18:38, Anthony PERARD wrote:
> Whether or not the linker can do build id is only used by the
> hypervisor build, so move that there.
> 
> Rename $(build_id_linker) to $(XEN_LDFLAGS_BUILD_ID) as this is a
> better name to be exported as to use the "XEN_*" namespace.
> 
> Also update XEN_TREEWIDE_CFLAGS so flags can be used for
> arch/x86/boot/ CFLAGS_x86_32
> 
> Beside a reordering of the command line where CFLAGS is used, there
> shouldn't be any other changes.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -91,6 +91,9 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
>  
>  clang-ifversion = $(shell [ $(CONFIG_CLANG_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
>  
> +ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
> +					grep -q build-id && echo n || echo y)

I realize you only move this line, but I think we want indentation here
to improve at this occasion:

ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
                          grep -q build-id && echo n || echo y)

I'll be happy to adjust while committing. Which raises the question: Is
there any dependency here on earlier patches in the series? It doesn't
look so to me, but I may easily be overlooking something. (Of course
first further arch maintainer acks would be needed.)

> --- a/xen/test/livepatch/Makefile
> +++ b/xen/test/livepatch/Makefile
> @@ -37,7 +37,7 @@ $(obj)/modinfo.o:
>  
>  #
>  # This target is only accessible if CONFIG_LIVEPATCH is defined, which
> -# depends on $(build_id_linker) being available. Hence we do not
> +# depends on $(XEN_LDFLAGS_BUILD_ID) being available. Hence we do not
>  # need any checks.

As an aside, I'm a little confused by "is only accessible" here. I don't
see how CONFIG_LIVEPATCH controls reachability. At the very least the
parent dir's Makefile doesn't use CONFIG_LIVEPATCH at all.

Jan

