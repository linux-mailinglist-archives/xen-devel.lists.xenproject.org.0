Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422E579F95
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 15:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370653.602515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDnEp-0002Z7-MU; Tue, 19 Jul 2022 13:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370653.602515; Tue, 19 Jul 2022 13:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDnEp-0002WY-Jc; Tue, 19 Jul 2022 13:26:11 +0000
Received: by outflank-mailman (input) for mailman id 370653;
 Tue, 19 Jul 2022 13:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDnEn-0002WS-Al
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 13:26:09 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50085.outbound.protection.outlook.com [40.107.5.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58984a6c-0766-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 15:26:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 13:26:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 13:26:05 +0000
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
X-Inumbo-ID: 58984a6c-0766-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxHLJI5p02RgEhRbeS8hKbu42u6njeyo/N8Muz02p6myhfzjMMFr2U7BYx0ZuGojGKM2IpnlpSVyN/Pn/oBcBpVCxWFDJLU3JgHfpxH7sFDUXu8W2q4sQxSnmt8/ouPt8hCV47zSZ3wpqzHGfL8rOZq79xQ4WQKAqDqJ4nnrwuuZJVKLxwuhvR0eSheFz5vV1sZ1OmqZ2lv2PAyp3B/AD4rXF2sX93kh5dg4YryDN6/QBSabGFP/P4DpU5NBrPKkK1go8GOIsQg/Ebus8lN8to0VOmzx0VGUFVRQpjKOY8rVAwJBb/LY+oQhxruHtB5rAOmmXHBTPLjS2RCIg4OzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++1L7owZW5MTQlMNcXjYhazYBSWrdakj9jpM3QNOotc=;
 b=Qvgjm51Fo2epIAtyhyfXUKAcbUNvFdJGvKObIsqu7FYc37jTMydjK5/Y5r8S//0dNwp64ZzSxqsPRqh4LcpiOcaHvFYvcgAFl4/GTckh51EXhUFccO27I+GWP8uWXWecrzdEcVVxB2Y6PIQ0tF50HdsemNhjrcFeXTsXHcPuWPFZAGOo6xTp5EwS1YhJ344JtmQQpqUEWWLvx/RYUtcQBAYnci21uOszIExq730DTkxDCVRavs5Kl/8Fiv2aZQBIvev+PAnOc+x9vuKiQt/DRZxlwS+rrlzrZ3qio4sp2/b510LLS4nrAQI/HXwb/IdEdyyAP2rychycrZRnt3yZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++1L7owZW5MTQlMNcXjYhazYBSWrdakj9jpM3QNOotc=;
 b=plpn30I33YjTwMK4i/a3JInCC2Tcmwvy+Vq4HwcSr1fkyBDwA6QbzP5fsle8pnXdNrmmi+TVd8ArEBtq1nE9J+TpdJeVWGlhgfhyIuwK9NI0IwetWMi0X7zqKNiLlpL5/IIVwUPmncTxSX0NCaRSkIgRT1xSueFs3RpNK796A+qbAAb0BUa1cYIJujlceZ8Amr/wXejLiyLsFqe7AOhMI3Mpozh2BIY8gLe6GMDjt4V5i56VklbB0s1Khxby19ZItUoQPExVhQ3WepECHjCZ8QXcfq0OHhiCvzcyX/0Jgm5pG9M2ZMoThcIU2IwogABucvfkNoO7+t/ffUef70oJSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <681d9e71-f618-ff33-59c4-bc7f793d45c7@suse.com>
Date: Tue, 19 Jul 2022 15:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 05/18] x86: refactor xen cmdline into general framework
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-6-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3dc7bca-776b-41b6-eb52-08da698a3b90
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OCvw2MxdI/GyYUhkblePwLqa8xTRpPWOF0KZjvJvo1na2Su4esOyOY5fbifylJj9bJrvjICQfQ5XBE+Fh5ir3f/ha3hzAmaWypwkSPsnc0jvQKe5eCDJj1BYbQLnJg23H3Uav1fs3lZlBqMlRaamgRLaWiT0KdhBs8xdRb4vprCYjMesFotBl/hVJv1BFqfGjvYr/MIEf48SonbGyThM0o4/wLW/yrCUtbByQXkfyENQvZhPoWjL6Eg9/9laPKYbb245N7Nl3vjMWn1eKoOLlppyTPJjGyycXGIdDqqdD0RfyjcL0sbvihA4c1Fjws2L9dTkSB6OFGNCrxEriFIdHLQMmhaJvPDUKDuBd7F39kZs8dDsip3Ku0tI3EltcPwUL74qcXaSRYxCWvF4aOHmYnOi7Mc5UAMp0ccEaGAiKZ++u2mhUPrt3oN0JGNLC3cqnOFLnmDf78TC4kMNDJtZGbv5SorbNP/keNkI64aY0d8Qk9xO/MpsmD69pxx5hxtljn85lGSe75lrQquWtT1DyAw6lJTwZktFHn3LZENO2osE56NuJyLVCuPIfeoVc+mg0AhLGv6wdd+AYPgtE0kp9yZ26AokcN7bZ6F44rvHfT/aSxlzCl3jcRgGuZ03zOWNj0G3lmTJ8UjbnJiE/rPyrfSjHIcP4qDBVNqZkNcWtDJQoxOF4uh7R+u479xsvhCVKuCrnXxTTgGfN11Kf54YJzRfDD7w1Lxb0exRLD3kl4LXXtvrsVcaDNLN7P5aXVV1bM5YrZ+dyrlKN3JJLD/lXEaQUWXNAW1cryOR+2BxGy+t0Umeyyc+yMXqLCe43jvY21CGAVtmw0iWyyX5t001cw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(346002)(39860400002)(396003)(83380400001)(6512007)(478600001)(53546011)(6486002)(2616005)(31686004)(6506007)(6916009)(36756003)(316002)(38100700002)(186003)(66946007)(54906003)(66556008)(4326008)(86362001)(8936002)(4744005)(7416002)(5660300002)(66476007)(41300700001)(8676002)(2906002)(31696002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNDS2Z0bUFIUmQyMVNURHJTOGx0VllwMkFvVC85WVVnenRTaWVFOEMzNm1Z?=
 =?utf-8?B?QmJVcVJWRmdaQUZLbVpYSkMvVWExZ2w4M1hUY0xEMzJYYklpZTUyMVJSbU9G?=
 =?utf-8?B?STNnRGxrTkVvUGt4ckpCUU1kTFk4NnVlcnZFUEc5aWwxQVhKc0lHcGtJaXJ0?=
 =?utf-8?B?S1R2Kzg4TnFZa0RSd2R5MFU0UkRhL1FJeE9CWHprRzlaelpranNCczh4RDRF?=
 =?utf-8?B?ak5rbGhEdTVVekkwMkFzZWR2c1NDeHhTTFovbHpabUs2bGZLaHQxQW40MTZr?=
 =?utf-8?B?Ny9mdG4vSFY3b2lQRy9jM2xvN2xSK0laOGxDbHN6VVhaWnJaTzh1eUtFakZa?=
 =?utf-8?B?NmlGK1N1TGxzOGlsNVJXMS83S3E0ZlVmTmlyZk4wYXJhTFhNQmV1RHQ4T3Vm?=
 =?utf-8?B?SWEzejVQRmk0Q0ZMaG5aUWhJOXh4cXRwYjVDU0JKR09zOEEyaTdQTW1kMmVs?=
 =?utf-8?B?YXgxdFBtSUVvQnRuTzBFU21aM0FPblc1RG1NVFRxSWYxMFRlUVFCWU50cmI1?=
 =?utf-8?B?QkNmY2NpbnRBOXJld2Y0OThTdGNXc0dDeXRhYk9FMlUrb1FtSVpVUWVwV3lC?=
 =?utf-8?B?SU1xQ3hDcTJxSXV0VnBGeE5qVG82SlluN09RVGpwWnpRcWFZWWJ0MnVLZjdZ?=
 =?utf-8?B?WjlNYjVMdlcvekZlbTlJSjJzR0FxdThacWF3OFVISFNLYUFUZURRZVlNOFJv?=
 =?utf-8?B?SGUvKzVIMWRDMGxVejNnUzJscmJlWEFaUGZxaTM2WWlHT2pnWEN6bXN2OUkw?=
 =?utf-8?B?dzRTWTlZYUdOZEQreTNmVTRueThmM2dzZ2ZhYlpIR3RzanJ1a3ByemlvRFZ3?=
 =?utf-8?B?OHBLMjRkOWlLRlFucEV5ZnhxY200cmdUamdoamZUR2YxV2JOZzhqVDFtRnFQ?=
 =?utf-8?B?RVVPTnhLOHlJVXpiTERTUFhRQ1dHQWEvVFM2cm1SZjlzVXRVWFBhbWdTRGdG?=
 =?utf-8?B?dTVmRTBkWHpKY3FiV1p3MUwxOFNXMlFuRzNvcTZKcm9NekhTTCtGWm5Ldncz?=
 =?utf-8?B?dUtUaFRNWE9CRzVEY29KbkR5d09GaUhHcW9vTXRjRXhwS2xPb3pMcTNQTjBD?=
 =?utf-8?B?U1YySDlDeXQ5WEwxZDJrYmNuckdoenV0amNvdFJSWEpPclFMd1BQQWJFRlJN?=
 =?utf-8?B?WEVmQlQ0MTBYckpqZUFpWTkyT1Y3WnZkOXJMSmZhY0diclBySHVPYW5NRUFZ?=
 =?utf-8?B?MjlId2pyd2JPcTBLR0I0QjlIUVRObTJUT0g5VWJuaTBqcmphWG13aHRtTXI1?=
 =?utf-8?B?ZnM5bTRPZVRDQkpmc3hLaWx2SklyV1pWQVQraHhIOEJjWHN6Z1FKeGdxc3dx?=
 =?utf-8?B?SFNRQnVVT3pTVGJoWCtsd09KakkyeUJTSEZ4RDRUSTJwQUlEU1JGUnJnR1pT?=
 =?utf-8?B?Mi9jVytxb1RJamp0aE5LTzJRR25oVTZFTkYvdVpiU2NVN1pIdWdPdHpybjls?=
 =?utf-8?B?SG85Q0MyQmhxMXlDVWRGVVhxbFF6cjNvTHJxdjRpQkdYTldkOVVweWQ1NjFy?=
 =?utf-8?B?OGs5ak92WmdoMUo2eVR4UlJsdmVZODIyTGU4MVFxR1VjREFEWGxQUmlaNjB3?=
 =?utf-8?B?c1FvaittWEVpcTF5elBCUTZFQnZMY3JZZldPM29qaCtXcTlROHRYRDBUVEZP?=
 =?utf-8?B?UTgxV0prNFQ3WWI5VE9XazBXSkRuL2lCU1kxM3FQSXA2bnNsQlg2MHd0QW1l?=
 =?utf-8?B?TUVvTHFHUk50bEFaTWRCbjRTRTF4NlBjdEsrTDZVajdscG5TRzNpSkErTmxm?=
 =?utf-8?B?Zk02dHhtKzNZV2VCK0QyVnBWWFg1VVlnWkRGQ05IM2lMR0Z0WXkwUjhpY0pu?=
 =?utf-8?B?NDVhY2Yvb09HSHZ3a1kwaXd6MXhXQk1wN1ZCVWZuNVZyejBTWVI2U1ZhU0lX?=
 =?utf-8?B?QW12NGlCbUdWODN6S3hjU3hpb3YxTzgyZTc4MnhYWlJHK1p2Tnc0bHhqdERH?=
 =?utf-8?B?L1RlUnRnUXlNS2FoOC9hZW1iN0t3TWh0TFI4b0k0SjhtWFNVUjg1czJJbUI0?=
 =?utf-8?B?Um0vc3ZkN3RWMlRsaGFvNUEvdkY0UjBRaEpGa21PMmN3UEJHd243bTFtRmpJ?=
 =?utf-8?B?Z1Q3MVpjU3R1dHNTbURiQS9xeU44UnJKUkxaV1g5Z1MydVRyU1hVSkY1YmEv?=
 =?utf-8?Q?faDgQefSchYFluP0Rdgwuw9Ew?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dc7bca-776b-41b6-eb52-08da698a3b90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 13:26:05.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoUUI2nflpnI7CPyfXGmSnblI06/fMr5ePjzTGxcH1Bm84YmypNnT3aTfmiysrVyBhhs1lNSs0TwwtN9LpiSSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -53,6 +53,17 @@ struct __packed boot_info {
>  
>  extern struct boot_info *boot_info;
>  
> +static inline char *bootinfo_prepare_cmdline(struct boot_info *bi)
> +{
> +    bi->cmdline = arch_bootinfo_prepare_cmdline(bi->cmdline, bi->arch);
> +
> +    if ( *bi->cmdline == ' ' )
> +        printk(XENLOG_WARNING "%s: leading whitespace left on cmdline\n",
> +               __func__);

Just a remark and a question on this one: I don't view the use of
__func__ here (and in fact in many other cases as well) as very
useful. And why do we need such a warning all of the sudden in the
first place?

Jan

