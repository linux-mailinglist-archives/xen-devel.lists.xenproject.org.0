Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A915FDC67
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 16:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422233.668110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizEU-0001cZ-H2; Thu, 13 Oct 2022 14:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422233.668110; Thu, 13 Oct 2022 14:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizEU-0001aG-EB; Thu, 13 Oct 2022 14:30:46 +0000
Received: by outflank-mailman (input) for mailman id 422233;
 Thu, 13 Oct 2022 14:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzGh=2O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oizET-0001aA-Ke
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 14:30:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfedffc-4b03-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 16:30:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 14:30:40 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836%6]) with mapi id 15.20.5709.019; Thu, 13 Oct 2022
 14:30:38 +0000
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
X-Inumbo-ID: 9dfedffc-4b03-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3UsbTqQZlizYhwp3NU6kZ6J84qPMqjPw5J3M1K3u9aYkghrSpXzEeG1IORfL6cSgXuJNpvC5xJrxfZIsYidNlNXtflw/W4MvRNiYK0KeGwqc1ZH6rblZXf9530bjRYPDe3x1DkdCJvcDlonOgY/MSRW2rYlo2cep0vQr2RrGExVfkmtCnwgQjBmEA06lu6Iywo3DSR0B7CYJn5m/m6IUduBD95kDhV+KgugC9yK5dT0tH88HLvObx41kRk7zyqLsZ0VSo027E4JWEWfIQxYMvFHwRi4RrZM/4Q1DlXkvb96tIR1kJ55sTdMYfb5eURPEni9PT+QPXuuAjb9pQ1bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs1zAxQw8tKNOBH5t0SuT4gu1Cpm9Fc5tTfY/cvB80o=;
 b=n9k4Mp8uQEZI+AyKQhza7pBu5sQvjAjN/XjOfyorkPp9lid5KnX6IDXl58qb+c6dHcn1Fa9xbPU6nYBdPfVgAM1MiJ38vGJXg7QprQDxMJRbCRbr+raOU4Pqvfynk09wjE3DpgfmZDWWXqYpNuZGDpw93om+oySUwuT1vJ6854of4l4nFSMc8w/Vl/g/bVFHbaZHHUrABq9DvZbRvr3csBcoyi/VIZBBL/PxqHbhEscEcpAZqdxg+uLj58w2rGZ/GR4D/yHNiN0Els3paBKUZgg3bPNiHN5/B8j700i7H4zySeigSCUosePEZ9KhtgqN8c7TvCimZyFhwkl/KG0+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fs1zAxQw8tKNOBH5t0SuT4gu1Cpm9Fc5tTfY/cvB80o=;
 b=Ip5b/sFgXXbVuGG9Qh54fDQwc8MhmEpzVfwXcqO9qX67zv2ikM0jNaODDj3KT1ij6NPH2jpSLzNsFE3hrQN97bg535i8GVFEGG9yqforyOWC+Jm3burHFrVPwNPJQqT5hUaw0tG/ucJBCYUoMbdFnYgDQOmXyQfKVHqoJ1Z4lYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e94b7c65-1c38-024f-6a91-16098045574a@amd.com>
Date: Thu, 13 Oct 2022 15:30:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
To: Julien Grall <julien@xen.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fd8bd4-3f3d-497a-753e-08daad277fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XviIFpF3DTYrwfph2rOqUoZ/VvFoIoi0mSg77j0kb9O5uWas/sKk4ekV1/BboMgRShBgWyJcr/shwwjiLToqoQ76rLv29dAGS4lPRsWMmXuaqz2ev9RPeAsH5Y6riIV0bjHhgdteEvp190bBNdPcq1wuPPw0664Ry2Se+Ta5I6GoP0JB+8xNIihiJf9RJsj7cWAr8Z4FqBeKHN8hYK0u+rgSWKGclLm8DGs8+YcEj95A3HMvOFZYCVswCQvQEVBKOqIGwq1OBjOsiuT88+b/U/asRMNJmwyrUbDtoFzQfz2xErVVc5IsWG3QuLKCDCz+9J5YJaHoo1gBkzYionFafXHxiabKMKHi/e5kDWNGXBO5IK/MLZIGV2+hOgKo+/tuy+0IvP2JEasbQylqKRbmhPqiNDgfPkqw17c7wJnbp59k9+JaoIeIVs1VVNnkx/A8MEGhJvDAla7d8T8aA9PjBXsmJJMCarkqMMbrwokxpnOERIVd4G1V0TSl4varAk+XhqxPqXJcnH+UgTky2joYcZAC9uaD8rf6YobsUMIrPALopswJL1rOykOLadneMXhlSkmMPbGYBSt+UQv4+QhJ1+gfG67ul1XbOWu/MqDUQVvui9tSlR1wIDMGmRDyOclyXR3R2kgQsImnYDBUKX9CMla/VqRt0c4M9WPCJJEgDU90v0yVe8BO0quIIboj890AddBJiWRf2IpMR2VjkRRthrvLg5NvYC9q+N3HxFzZBCzdpGYLdqwI/EpnESc1jg7TqfU1pYQiEX+0ErTvr2kcwYdQ23vgAnCHg9/L5w4dM0ab/2nOJZNG3CIjFcpTgzaP/iSsTu4UZ+3+lF2/uqd5JQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(31686004)(36756003)(41300700001)(5660300002)(8936002)(66476007)(6512007)(2906002)(4326008)(8676002)(31696002)(66946007)(38100700002)(478600001)(54906003)(83380400001)(66556008)(6506007)(6666004)(316002)(186003)(110136005)(2616005)(26005)(53546011)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGtwQWZzbVZwNmtDWnpUM1VJVnFIWTN2VC9MSUFRdUhIY2NvVTg5RzFROUlY?=
 =?utf-8?B?UXVkKytPanVIQXQxUUh6K2FXRzVjUGRQc1JSQmYzdVpwYmcvdUhMTDlHZXpZ?=
 =?utf-8?B?MlJpc2tLc3kweis1Ry93bTIyeEx0V0pkNDYwYWlFVHJYUGdKRzdmWkpBN0JP?=
 =?utf-8?B?eUlMWjJOSmFCZFg5MW14a2QyLzdtM3YvUE92R1paMUhzMVplMEhFb0hVT1lE?=
 =?utf-8?B?SG56WFhiTC9YajlqRmlkdUpiaFExVkFwbXJYYnJyODdya2ZORm1Za3RCN09R?=
 =?utf-8?B?Y2Z0aEpaTWR6U3pkY1JPcjk0TWhnd0pZNFVjMUZjRExHR1I4TklPc3RuZU5M?=
 =?utf-8?B?bEsvOFBuMEV1TmRQMDhaRlljaU5NNzZIWExxTnkzSHNuVDNHTkxSTk9wblBV?=
 =?utf-8?B?NzJ0dXRlY081bW5XN1ZkZU8wNlFDN1B3Mm5IdExTRUYvajhCbDFzWUc4dG5z?=
 =?utf-8?B?YkRsL1VIa2dOejUvc0ZrblkrVGdMay92bnhaWHE1bDVRTjYvN1pVQ0JsTUZK?=
 =?utf-8?B?d25KY0hQQXlBOEYybFYvR3NTTld3RDE3MitxWEtlY0dyMnE1c3lsWlZGbVcy?=
 =?utf-8?B?YXJVQ0xPVzVhaXVBQ2N3aSs4QVZPRGVMZ2lwTTJaVUJodzhEbUtSVEZGV2xw?=
 =?utf-8?B?NTdmaHNualVFOVBmT1poZHFLZWtnMkVBN3h1QnJZY1d0SGlFc09PMjUrNUEy?=
 =?utf-8?B?YjFtRDRrRE5XMzBHbEQ3eEJDdHpZTUlNZi9SQjBDMTI1L21jYTRZeHh1Ulhm?=
 =?utf-8?B?YmdmcU1wRTZteFpWU3NUcGtJdElxU2FBMWFRT3RDY1JPaXlmNW80OXV1d2lS?=
 =?utf-8?B?NlRRL2NpdUFBTk5lUlhOdFJoRUFwaVBHVHJZeGNiWnpDdG1jVktsUUpQRDd5?=
 =?utf-8?B?bmwyMnlXNi9pOGVlekg0cG81aG1uUmtwaGJwenBkelQ3OWoxYnhoaElqZHdy?=
 =?utf-8?B?SVYyclpqR2RMemhESXhYTFhSa243V0tqek5xeTZDWEZJeVVuWm9SMzJaQWR2?=
 =?utf-8?B?dURWbVFadGdsdkYrdWs0WTc0elVvTDZSbDFaN0lzdHh3eTZuRThUSm4wdmJG?=
 =?utf-8?B?YUtlVnlEMVNlaDdPbXp5OFR3eTF5QjBnYnRSZUZidmRaSWdCaXpQMkhzeWV1?=
 =?utf-8?B?bkwrMTR4NDNUZjgwLzVFMGxNRjd2eTViSXduSUxaYnVaOWRpMzZsY0d3Qnk4?=
 =?utf-8?B?WG41NFJWVEZNK0VDOHAxdkdVOWh1RlNRbVF0R01pL2RucXBWbU1JakdJTFpI?=
 =?utf-8?B?RmVITExWbFB5emprMDVEVTJpVkZHZHJudmJFMmJEN1l4U2szQkpqQXVZcXAx?=
 =?utf-8?B?M1pkRVJpRHg3VTQ4YnpCVExMWFJNK3ZuWkNnTDJCSlNYSHc3RGRpZldsQ0s0?=
 =?utf-8?B?aVYxcm1HRFB0V3NMdWxTTlVrQmZFNkZUWW9Sb2Y4d0JtaTdYbXpJRldNTXdJ?=
 =?utf-8?B?clppb2MweVFFeU8zV0JhdjRsWllDeUI5Um1hVWI4WVNjSWlTczFaV3NvOHd2?=
 =?utf-8?B?RWcwa0ZsamY4b2Z4ZHVMdHpmQ0lBM0hla2ZIc1NJYTJ4N0ZrZFdJL2dYY3dF?=
 =?utf-8?B?dVVwbzRJbmpWcGxCREt6VDBNNlZQSEk1OU81b3ZKUXFlSW0vL29yR3N0eW5r?=
 =?utf-8?B?YktTUHBXSjNWNUozMVRQKytyVVVQSmZtdXFOWVMwT3c2QXpIMno2cm56N1Ry?=
 =?utf-8?B?TmswQll4dmx6M2xTLzdKTFlneWYyUERvU3hwUEEvRjN3cUlpSWE0dWtXU0sz?=
 =?utf-8?B?aWNEMmNNYUZVdzdEbFd4N3NFZ0lLWmlGS2cyZG9XMWl3aTlkR0tYb2VGenUz?=
 =?utf-8?B?ZkVyMHZVVFVaUmlqMzZxcW9QZUs3NHY0WXVlTjR4YXlWZ3VsWUtSRmdwOHA5?=
 =?utf-8?B?L1d3OGVKNk41aVZSU1J1STI0eWZTbVREckhrekFMdi9XVjdkMHlVMTAxTDdm?=
 =?utf-8?B?em5jYnNYZERMYjVod1U3ZldDd21BYnJzUmV4dXh5enZGU1V1NndsYVZTTnhT?=
 =?utf-8?B?b0ZsSlBES1ZWRm5UNzJHMXZiVjJSQ1hqQ1k1Ymk5aUhrUmFITkp3Ty85T2RF?=
 =?utf-8?B?dm5KQWxHbE1jSXdYelFFK1UyZmRSY0FxMW50TElvZkZPVFVsVGRQbkxMbmdQ?=
 =?utf-8?Q?w+/cG2dR8UbNnN68Pc6si8jPe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fd8bd4-3f3d-497a-753e-08daad277fcd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:30:38.8503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l10edV9pv8LQsw2UQCtd3bwZOmosiozYUhnvpUSQrpDruOAd0U4IWW3P/eJfKIoRRkkpO+g8WpcJ+wqGsvriOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899


On 13/10/2022 14:20, Julien Grall wrote:
> On 13/10/2022 12:47, Ayan Kumar Halder wrote:
>> Hi Arm mantainers/Folks,
>
> Hello,

Hi Julien,

Appreciate your help as always. :)

>
>> Please refer to the discussion 
>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>
>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed 
>> virtual platform.
>>
>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using 
>> ldrd instruction.
>>
>> As GICR is emulated by Xen, so this instruction gets trapped with HSR 
>> = 0x9200000c.
>>
>> As ISV is 0, so Xen cannot emulate this instruction.
>>
>> The proposed solution is to use two sys_read32() on GICR_TYPER to 
>> return the lower and upper 32 bits.
>>
>> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
>>
>> Now, for Xen to emulate this read, I have proposed the modifications 
>> (in my last comment).
>
> I am confused. Looking at the emulation of GICR_TYPER in Xen 
> (arch/arm/vgic-v3.c), the code should already be able to handle 32-bit 
> access.

When I compile Xen for arm32, vreg_reg64_extract() definitions do not exist.

The reason being 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/include/asm/vreg.h;h=f26a70d024e2d1f933ea66793ea6e42f81c7a8cf;hb=9029bc265cdf2bd63376dde9fdd91db4ce9c0586#l189 
, BITS_PER_LONG is 32 (Refer xen/arch/arm/include/asm/config.h).

.Thus, the guest need to invoke sys_read32() twice (GICR_TYPER and 
GICR_TYPER+4).


>
> I doesn't look like we need to modify Xen. What did I miss?
>
> Cheers,
>

