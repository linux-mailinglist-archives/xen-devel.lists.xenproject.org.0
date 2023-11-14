Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569657EAC15
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 09:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632198.986329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2p9Y-00063m-DF; Tue, 14 Nov 2023 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632198.986329; Tue, 14 Nov 2023 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2p9Y-00060y-9z; Tue, 14 Nov 2023 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 632198;
 Tue, 14 Nov 2023 08:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2p9W-00060s-Hw
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 08:52:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 180c1084-82cb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 09:52:09 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8712.eurprd04.prod.outlook.com (2603:10a6:10:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 08:52:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 08:52:05 +0000
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
X-Inumbo-ID: 180c1084-82cb-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm7u4sH2oxBudxaUy31nODwOEuigwlGG393Ks9vXqRqnhrHEJzbHqRO3gC5Q4d5zoeEjr8RD130LOh5Qn/nA5GljWFLa/kNo9mZqooXbqDCBL8zXsuEUMgwIn04dU7zSSD84xifb81qD4+YidAV6z6v0qhibCsKQ1pxhqvT7tueTtefn4ecb3BNNY+vLmERr+bdv2XBelidp0QvIFrL13BAQnt2HJPv3v3ILFYY4idTKKlcA8ChV/5ZLG2+4v81umguYpsRQHGykCeURq/WRvixgrp5iZ1xqZ/KcYG7fXy5ZiN3ogD+wiv75OynwzJk0pBugl8Tz99Mitkm9EVN/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oL4MjhIFJtwdvKlPXsM2OsDrtIScYZA6tXGeEbxWq0=;
 b=OL1dIdHTGnw8AM9Y12gyiM7pnp/Qax2T4QlVzNNAa1ccRSHrmJLEm/lZtMRQoH4sJ7ztHYOF6vJdG7n8QlDvZwwMgb9pvD74w+hS42FJTNHx172vkYSNGa6nfAngcW3XYsckqqIzwb2im2hW+9Q3AhR9ioZV2dyKXNQ++tdGQPL2btGZMYKSuzpvFDcaalTl3bscyRP4/rDcgAqQsHRyu7UtXNKv5UMx2i1L6NJxBugGwwLeQoGYgtFRTQHwAtqltVXWjQm1nG5JGiOegjGS9sTmbWd2C/+QPUDGHqClWxm5f5bIiG405IOOzlu6xFwnkgCkUE/I48zmD1rNqeOEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oL4MjhIFJtwdvKlPXsM2OsDrtIScYZA6tXGeEbxWq0=;
 b=dOucyjpttjy6C0n5fHua9PIlZUlOGJtHIbyrxOCS4Jy+9ThjpOUyMzyH3xa5ywxdXVlBiQuFCusqQYSxc6VCF97XYCrCz/njDkgDMBOeT+wnIMr3cq9Rl1getUQeCLYKrOIOrTPYWtXAEH5wm/iaQMPzUQ6AdQPpxh1oohT9EqbJu8h0v95aX/G3ezsaj6/1k4ZjNejLCklRDBThzhcC9xgEYTcy/eIGxn66ksX1zKoDRSwDjfX2a0IB65vryyxvS1CneQ9hbaecYZruG+xxWsg4x5QlgP1QRZjBZpEIxyHohwIKpMxHB0aKlEyJHj7MyZheQklJNdRZ0mSQ7nGmwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d470af1-9b80-4f20-679a-f063a2f9e617@suse.com>
Date: Tue, 14 Nov 2023 09:52:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Christian Lindig <christian.lindig@cloud.com>, xen-devel@lists.xenproject.org
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
 <20231102195938.1254489-3-stewart.hildebrand@amd.com>
 <3f949fae-da52-7a8d-ad87-8fe84eeba8a2@suse.com>
 <8fdb7e15-d5a7-46c9-bcde-53e4adac1ade@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8fdb7e15-d5a7-46c9-bcde-53e4adac1ade@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: b60454ee-d285-4f19-1e8d-08dbe4eefa07
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JfMlk0rFpDzOw/j3iXKK381xgBYR1kRQsfmqm/JYUASylKht2JxIPzNUb3i6kDD0J3IYeNVDl51DtGApUDm46C/LmUBLoDgH6furT0mvyQ+V4FtMZ0whw/LNfNQ5yDt1M4wXwbCBpa7+FG74o33GHw0xbw90M/qsSBEkPPY+iwXikrzE/q5iIdXavfkGbhJukhD5TAqMzAbi41vhrnqQR9hrcdALnN4yHygTR+e8U4FgesZ3WwqvHobXrhcgte0H8LbnYbPnfb/z7/xetDnU7++BuZ9QB2n31DDamlQSbQ18PJFl6KnH2Hl+Pizsns+5GRN2M1sCQmqKIEP+xv5dlSBpRFx+AY1WE3EJKhFqKG6CBlk6RSAoMrRMk59Hw41vsh6k/Z4LQh5zAlfxByV63QLdz8oU/54ggYA3Hodc1QPzJwSk5e3KqBm6GHnvNv2IlaSBEld9FlCHSF2SW9gsWLo6zD0j7+F/IUF+E387svIB81xOV7OCvSsB7mjukWicRA/jLFkv2QM40Pif5Sp0Jzbmi2ZCyWiT3zwRsjqgiNltFTDaG/YIoecFkrc4Bm/QEOZkGq4YHKjr7klqV+hqWx/fqHoA0KTJyFRXA/mdxbAUVCAexOIEqEU7vFQ27FLPzX6fWqEYg2iskuJX5OxzvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(2906002)(6666004)(966005)(6486002)(38100700002)(86362001)(31696002)(478600001)(6916009)(54906003)(41300700001)(316002)(66476007)(66556008)(36756003)(66946007)(8676002)(8936002)(4326008)(2616005)(5660300002)(7416002)(31686004)(6506007)(53546011)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QitFSTVmRTJtSTlCUU5yb0RiZjZtZk9ZcU9hL3c5clJ3NnNNY2k3ZmJia3VE?=
 =?utf-8?B?UWxWRitEcjRtNWI5WEV0Y041QzVjQ21TdFI2K3BMSjAwOXVjUTl4d0hJYTdD?=
 =?utf-8?B?T1IzT3hrYzhrVGM0cGlWenQ4NmF6LzdCMzJ4azRZd1ZHdlRIUWVFQ0o3Um13?=
 =?utf-8?B?UXRoaHEwb0VEZXVpMFpJbGxTVVhzL3Jpd0pjWlNzNCtwc3h6cm1rRkFwbytD?=
 =?utf-8?B?b0Z0bmZGa3Q5Wmptek9nQ0R3ZWFCdDhBZUo4VFNlTm5BUEZKaktod0tKSHM2?=
 =?utf-8?B?QWZuaDBHRm1DK2NWTGtOd2M2Z2F5NzF4WEZnV2R2T0k0VU1Scmg3Y3l1azZn?=
 =?utf-8?B?ZE5XTnFybHN6SzlhZTBxa3BOZnNSeGdKaWEvQUJwaGQ3Z1dGeVdyL2FmNDFR?=
 =?utf-8?B?dTUzalljMWVLcFo3RnRqQS93Sk5HdFlnTDVxcXF6YUVtTkcxZUFPZE5LS2g3?=
 =?utf-8?B?WVBBUGFuQzVCNlRpZGl0cG5OSHQ3REJpZTFyVUtJTmZ3NGkyK0VQY0lFUStl?=
 =?utf-8?B?U1Vack53M3cxUDlSN0RrVXRDNGloSW83K21tbS82VmJ6Q0NTbjlmeDA2L1JO?=
 =?utf-8?B?c2dESUt4N2N6b29xZGM2dHRRaXAxRlV1YkErcW9DenBnVGFMLyt3Y2taNGFq?=
 =?utf-8?B?Y1N4TVhtTVpSaElPcXl2Z1FxOWtCeWkxZDdMREpMZ2FFVFoxRi9KQmhmYVlh?=
 =?utf-8?B?MnJUdGpmSWhwcjhDNGR2MUZmTDlXR2pWa25xUk9wOFlYQ21pMTRJbGlvTFFU?=
 =?utf-8?B?Rnd0cW5GTitOSFRIYXpIYjlxUFdlMUdqaXBBQUF2L2JtSkVSV1RjMVFEeXVa?=
 =?utf-8?B?MGRJV3R6bjc5LzIzMncyNDJXQWhIMTNXbDFTUlFTQlQ5WHB3c1VRUEZzNVEx?=
 =?utf-8?B?QmhIN2lNNWlUZXhGbVk5ZkVCQjlHTlNmMjQ1Z015Q0hYQXVMbzRvR2wzcVNi?=
 =?utf-8?B?NHRKZVZTN0xuQkZPNFNTeDlIaHZSUm85TkpZSmZGOWxjTUlwUUlHOG5MN2kz?=
 =?utf-8?B?UVFJR2tHMW44djNYTFh4UUxVSWNCM1ZjV2g3SDV0cDdxVGJQWllkK3pHMy9y?=
 =?utf-8?B?Q0Y0bzVKQXQxYU5RTjNKakdja2JpNzd2NXp5TWFUQWhKMVZlZEVGQTVWazRU?=
 =?utf-8?B?akZYSVFpclp6NVJsejBRSm5yTnp6SGpGMnFjNlJaZVdiczBCckxWa2Y5UVRw?=
 =?utf-8?B?ZEIrV3cwbHprUitIdko1eDJFL29oSkgxQytERlNkbnhzUkQ3ZHQzRWR6MlJy?=
 =?utf-8?B?aFJTdDdwSkZOcVE1NDVHaFd2NllTWDlZbnFMSUNaZ3o2VHdJVUh3Rk1pWlJw?=
 =?utf-8?B?VXkrd2o5YnBUMDFnUG1mOVRhWUFjNWNCZFRVVU4rVDdtSlRoeFo2SmI5VElW?=
 =?utf-8?B?ZkdTUGJJWkp2cHlMeDFWYm9LMS8zMm96SHhZMmVOTG1YeFVwUDdVemtIS3Bk?=
 =?utf-8?B?eGxmNHFZZnpEbU5yQ1pVZThQSmlsMEVJRzFrNm9zdG5xQ21CWjZrRXhjRXVN?=
 =?utf-8?B?cHNQbFFKVEEyQWplWWhpS3A3aUxQT1I5Q0pxSXg2bGpWTFN2Yy84OVcwWExU?=
 =?utf-8?B?dXhEL1pHYkIwdUhaWGloY1JNWU0zTXdrMjJkQnVHaGoycWZRVzY2WGJEK2dj?=
 =?utf-8?B?TU01ZUIzNGtMSm91YmNIdUZMNHJob05IYis0NHV6dnNwV3ZYU21KUkZuallE?=
 =?utf-8?B?Q3FZSTBQMzF4ZmRCV2xMQjRTMXRQRW9YaGYxOEVRWnJMWjcwc1RrZUpjL0U2?=
 =?utf-8?B?L2hWdUU2d0lQUnNOK1cxL25JSTM1RGZkR3JrQ3VDUHlKVkFYN2pTUTNValgv?=
 =?utf-8?B?elVCL01lcVJqQzA4N0VSMktzMzFWQk16dHRCR2cwTnBGcGRETXFLU25XR0FH?=
 =?utf-8?B?SXF0VG1TQm1abHVKSHN4d1U3eE9OTWtQMWRlWE50enlWMzdMSERxMktQWkRB?=
 =?utf-8?B?SE1sa042K1BzZGJVTnA0U3NJbTFldWpYOGlrWHM2dEVUamxnVHFXK1VnMTRN?=
 =?utf-8?B?aDBMb3laWHJnLytPYzZHcVFLQXlzS0hxQXZHTkk0Qmgrc05KK0N6MXUxVk9C?=
 =?utf-8?B?cWx6NGhIMGhKZHhkaUsycmx6WGNsR0J0MXZqaDIvbnNpaVFnUTFHeVpKK1Mv?=
 =?utf-8?Q?0deuWaCrWQ9xHBc0GD58k8w+Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60454ee-d285-4f19-1e8d-08dbe4eefa07
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 08:52:05.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntXkORqPE8fqClIF+3KNfYoOpdCc4aSXhox9TMBHt6eNF+D9lWrlbAmW23iO8KLxhAZBRnvL6Qqy0n2DpBeuCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8712

On 13.11.2023 20:05, Stewart Hildebrand wrote:
> On 11/13/23 08:26, Jan Beulich wrote:
>> On 02.11.2023 20:59, Stewart Hildebrand wrote:
>>> @@ -575,6 +577,18 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    if ( vpci && !hvm )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( vpci && !IS_ENABLED(CONFIG_HAS_VPCI) )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "vPCI requested but not enabled\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> Maybe flip the order of these checks? But I'm uncertain about the first
>> one anyway: Isn't this something that needs deciding per-arch?
> 
> In v4, the equivalent of the ( vpci && !hvm ) check was indeed in xen/arch/x86/domain.c:emulation_flags_ok(), but it seemed there was a suggestion that it be moved to common code... See discussion at [1]. How about putting it back into xen/arch/x86/domain.c, in arch_sanitise_domain_config(), not emulation_flags_ok()?

Actually no, I take back that part of the comment. I think I mistakenly
considered PVH as "non-HVM" (as the log message has it).

Jan

> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02345.html


