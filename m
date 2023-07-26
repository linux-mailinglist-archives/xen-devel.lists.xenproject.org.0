Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDC763B22
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570550.892421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgUj-0002os-G5; Wed, 26 Jul 2023 15:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570550.892421; Wed, 26 Jul 2023 15:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgUj-0002m3-Cm; Wed, 26 Jul 2023 15:32:09 +0000
Received: by outflank-mailman (input) for mailman id 570550;
 Wed, 26 Jul 2023 15:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOgUi-0002lx-ET
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:32:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93b07a7d-2bc9-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 17:32:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8361.eurprd04.prod.outlook.com (2603:10a6:10:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 15:32:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:32:04 +0000
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
X-Inumbo-ID: 93b07a7d-2bc9-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KArKxr1HL3kau/2MquWtbpDr1IKwnD298WBQSEWJzniCvLyw2gV4oGebfJwJv357tz9RzSBRY9u6oOAtXjJZynYLL9AE9Sdi08xw1QYicpbyo2TVJdWmDHkvpMiESD984NHMZm940O8uSFcguIKR1fCvBOxkW3+RBrLwH39qQUe+kDfNUPxluks27Gg+g/AOEp/DfbKP4f0SurXIBHWXeAiwTSY/dpvFiy8WXMF7ymb4aVbzbUODTHNsRsuzzq2gd3CbnFS32hrU6kkhXD0BgQxTxx05BFLtijc82VRjtAR2+HZ9NFrrbYVFZ3khac8QsC+Jg00S350fbUer45tDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APNkYEc1Pe7otDgPHN053skWp7ycJiqiy0FuABNe7ds=;
 b=NTSk5k7Ouso3UgrvIckMsRED5ITrNKiEavJuKfMuCJbpKEprnhKpWKaQGgbqKfJP28JZq9lmADGsX2RKssC0wf8Dz6RmjhWnJAiXFY3mxzzY/fu+S0HTRbDAuJXBj2XSElRWwlVTtsrGEQPOxT/CuVVsUjl5LgjcVTWhsLpuvxqK8a/iO3VdyHQufWcABGk76HtsGk7MS1jkY3gA58jeYUxDsOK1E+GA3eHjq7yU/d+mHTyUwFy+df4F79SXqm6gkg0bR7XCNd431Io2nYZQzgawtJqNtiUpuRezkvCVQmxtcnZU7CNqwyQUsuBvHcZTI1Cnu+hZzMqW/1HTA3fgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APNkYEc1Pe7otDgPHN053skWp7ycJiqiy0FuABNe7ds=;
 b=AEpYUiu+cTvxX79nHPMAY5O4AqlpFgOLfQqOIpp6vKDUJ+ppfVDiHM/Ropj0++9QAgm1PG0Qlcurf/7wDid/hGQY4UeJ/XX+qmPj4C9DlMJnmPxQnaR1Zfgzov7hcN1Z16OP+NcL7ZWdkkTN13ZmARTCdtRAmz8KYYqq5TyCoackCm4QoPqnllB2jMOpXJ6R572WqCo4gYMGlx6AGcudmA3MXSIrxjDAo1eG8PGBMUyc2qSUxxr4VXoOMTi0ATW3vUSK8kPylK6sEP+d4r6jylceFXtn/dSRdTkqQpXfKVpcXaAF4/4jfHKUC5hqDa4Widi9xSSn4F32fXNcQWUVWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab870428-fbce-240a-d4c7-4298fbed4050@suse.com>
Date: Wed, 26 Jul 2023 17:32:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
 <019914c7-c6ca-70b9-6c90-e1891f4201c4@suse.com>
 <cf7e418f-763a-6f27-d498-c88b19c8a9eb@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf7e418f-763a-6f27-d498-c88b19c8a9eb@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 35241951-eaf3-4726-17af-08db8ded76ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HgsV9T+IrYC7g1RVPCR0or0YcSFkMOameu8D1IGzQ4dfsZIpr8t231dC60ncf8dqGPVI4hV4AJezTZ1IVUtrQHQ4Yc3Lr8PU79rV409fwFhZKMg7S7TlZMchlSOKxsERgI1AHhQo4+erlhOX9oCpQ4iEcAmpJBEF04HYswhxnqHnECHYPp4biAODIqEHKN+k6dDg/5R0QX3poFEApUdrk0uS5RGo425GMnhaLpGtmh+D+YAWQq4Cl5V8d0u23Sb6racLcb8zp3lzq3a3Od1bpwFN5EbPvi/U5jaPWGtCLmLyxg5RqcmMCz/d3F6Y/tdZLQ9caGlCzsXme7vPvIfrJBurYRgE4cl1LS6xwXkjuZI7MkkO4UIUGmrZW+3COhakafCJYUp2NE5lEKceaUVxaDIArgdDDXSZsFJlr0Xnj2BBCXMHF0RsNmU8BVLqK/TOeiIX9li93j3xqkViEspiCp2wDmgJ9/aG8jfxdXg6lrUKwRNcaJTZEnu7hqhjS2pobB8sLqqI4P9IWq4idU/4apkw4L8VhHiyqB1QymxNusWgJPNzXI+W/Rw1L5FPsXwGvkQxp4lDdjN3SfUPPDxS/rg5hSr5+1qKq+wVUGAKcUp029rJhOm+EtAnZXx7T5oYhBxqd1nms8sj+rTr6BbG2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(478600001)(31696002)(54906003)(38100700002)(86362001)(6916009)(4326008)(316002)(66476007)(66556008)(66946007)(6506007)(186003)(6512007)(6486002)(26005)(53546011)(5660300002)(8676002)(8936002)(41300700001)(2906002)(2616005)(36756003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFTQ3hlVWpwY1VYRU9yU3NzbkUxcE1lNW1QY0dubjVpNC9zVlphSS9sQXVm?=
 =?utf-8?B?OEl4THVNNlJHZmc4V0xMV0VWVnVDZnhqZHFWSUVyd0FBbEREbTUzTTA3eGdG?=
 =?utf-8?B?aGd1bE0ybXp2eVdNcFFOMGs1cHZHOWJCK09hM1p6STdGL3NKQmhxK0NwZlJz?=
 =?utf-8?B?WmM1NzJWUmprOWhEb1dOTDZYNWNEc3dwNE9MQXNsQytiSmZKRDdEVTNtS1pr?=
 =?utf-8?B?OHl0MTBrQUE1RHZpYlAvdHdnSHY5Nm5IWHBZQklVVUE2TnZwZk1VWVltWEdX?=
 =?utf-8?B?KzZFelgydnI3RW1OYjk3cmZxS1kvRVl5TGNVZ2ZaQzRXaVg5UDRTUnVNa3Jo?=
 =?utf-8?B?ZDV5cnhGVmtvNEhCbW9kU1hFK3IrVTUxd1hTZGRBS2RiUkdkNkloUWlxUU4w?=
 =?utf-8?B?dm1SRDIrZjVUaXhrdmcra1U5VUlqZVRqVnJBdU9WT2oxSnZkdnRQaldpKzAz?=
 =?utf-8?B?MmxQbUo2aGZrclBKSjJmM3lVQlFKTXNoMHFQSUU2VFVjT0FnNW1XY1ExNzZa?=
 =?utf-8?B?azEzU0N4QUNFZW1idEcwd0ZVeTJmTnE4UWhvUG8wQmtFZkl3S0k0Z3dxSlJz?=
 =?utf-8?B?V3FEQ0VKenRSR1RQYlcrV2FSbXB0L1Z6QkRvQnpVRmU5MUlHVFZ6M1Vpa0tM?=
 =?utf-8?B?VGdkb2oraWUrTkxIS2pBQjlVb0RuQmJVcVFYMmNSSmtSdUhrcXF5Wk94OWw4?=
 =?utf-8?B?TW02NVhYQ0NCcFA2alo3bFBjSkJwUmxtVUFFNk8zSUdrZ1RKbm1nRlZUSTg3?=
 =?utf-8?B?aGVKZmNVeEczSzZxdW5MYWd1a1J3SUxtcEdyeU5SSWpwMXM3VDBucWFIcE9j?=
 =?utf-8?B?M0lNZnFXSlhPSGVqR2VDU0lBRkdaZ2llS1hZUVM0dzNEOUNCVm5sV1VSa0s1?=
 =?utf-8?B?MklmamdPM3k2OFNVWmFxZDh4cTR4VDh4UVFFWGhSVi9LZkcvR0w1RUY5TUMw?=
 =?utf-8?B?Y3oyaEVoK3ZlQk5MQmJFdUZZa3NjZmFkQm9MQVFGV0pvWlpkenYwV1YvYUQ3?=
 =?utf-8?B?WG9MRXJxNUlMWExhVFRidDFBQ25DRkUyTXJjM0hHWmVHYVRzclVTTEVYbGNL?=
 =?utf-8?B?VmlCUHFGTk1lZHcxcWVYM0ZRSmU0dW5SUG5uS2d5UnJKaFRMRzdxZysrS2lp?=
 =?utf-8?B?Z0FQOVlBTEVVdEY1TVlXS2FOcnNKMFprQWlKMnRHc2NENnAvTU1BRzhob25K?=
 =?utf-8?B?eDV2dXlUSWZ3c1VPYzBnRllYMiszMnE5TEx0ckpNK1dkaEJJUW5abW04VlJN?=
 =?utf-8?B?WXRnZlBqSWxwVXUvMUhUR0w5WFY3K1AxRUthV05mV1B2dFBKSUR5MWlpdVo2?=
 =?utf-8?B?SGtjZHFYT3VicENOa1krOWFmRzdwcEFnTlNEdDVlK0p3bms0T1ZWQSt2dWV0?=
 =?utf-8?B?N0lkL3VHZE1jdjg5aldKd3g2cHRwRitWdFNwUkUyclNmMHhqYUhJVGtVblR1?=
 =?utf-8?B?Y2VxbTc4WE9maTFVWjR6RktqV2JxR2VSQWJRcHZvK0RLcGl5UXd4N1Vydm10?=
 =?utf-8?B?UmlOazhrYVFsdFhOOG5VYWtONktUMHlCMlVsbmlQVFpzUGVwU1VBL21WZ1kw?=
 =?utf-8?B?RVNsUjMxUnFvTkRpYkRLckxwOU9CUXd0dmxnaEtFL01HOGYwcCtGS3VPeHoz?=
 =?utf-8?B?WEJhY2RZcmUvNTVrMW9KUXk1ZTVrQWlpWTB5K3dmSU9ZNEVNUVhlendWSUhu?=
 =?utf-8?B?ZVh1TjlyN2pieEpXaS80ZkVjb0ltTDRicHYwS21lVGRGN0lOczk1NXNEY3V3?=
 =?utf-8?B?OVRDbmFYQUNYNnI3eGpkR282czh0eitNTVliT3JJd0tuMEVyUkF2VlRmOFk0?=
 =?utf-8?B?ZXNxRVBVSmh4MUx6UVExd2llZmFBeUJLeVpsNjBhZXU3TTBXNG9sVmFhamN2?=
 =?utf-8?B?cWJzL3hMVkVtOHZwaGdIUmxkZklVY0UweWdwTHhpWldOK1FhR3hOVWMrbTN5?=
 =?utf-8?B?NUg5QWVGbUVvWmh1Zk9INUVvYytsYVpEeDBoRFNkMkRYQnpZeG1xQlNjam9h?=
 =?utf-8?B?K1lKbFdKSUJ0YlJwNDBRaWpDRVhhNlk0dmQ4NGdjY3J2eGxwaExDa05RVVNE?=
 =?utf-8?B?VG9DVVpQeG90Um83RmMwd2JGSG9WSjdTVFV2VVpBRDRtMXA1RmpaZ1FLVnNp?=
 =?utf-8?Q?sfMo+RVpn/bIzb73MzkkGy/Qp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35241951-eaf3-4726-17af-08db8ded76ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:32:04.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP74jqyXoWVtOSfQMC7eaig5dLjz5iFevzeVIF594VkmslWxL2nM1RGcQuhP8Ng+A3IU8stUFv8uTi9pHxpqeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361

On 24.07.2023 17:06, Shawn Anastasio wrote:
> On 7/24/23 7:40 AM, Jan Beulich wrote:
>> On 21.07.2023 19:02, Shawn Anastasio wrote:
>>> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
>>> including an early serial console are provided by Open Firmware.
>>> Implement the required interfaces to call into Open Firmware and write
>>> to the serial console.
>>>
>>> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
>>> 64-bit Little Endian mode, a thunk is required to save/restore
>>> any potentially-clobbered registers as well as to perform the
>>> required endianness switch. Thankfully, linux already has such
>>> a routine, which was imported into ppc64/of-call.S.
>>>
>>> Support for bare metal (PowerNV) will be implemented in a future
>>> patch.
>>>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> While I've committed the earlier two patches, I had to back out this
>> one. In my environment (gcc13) the build fails due an unresolved
>> reference to memset() out of boot-of.c (supposedly from of_call()).
> 
> Does removing the `{ 0 }` initializer to `struct of_service s` on line
> 43 resolve this?

Yes, that's what's causing the call (and removing, whether or not correct,
helps).

Jan

