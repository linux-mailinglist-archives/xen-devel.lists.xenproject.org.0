Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A1475544
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 10:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247284.426384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQgv-0005g4-P6; Wed, 15 Dec 2021 09:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247284.426384; Wed, 15 Dec 2021 09:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxQgv-0005cz-Ky; Wed, 15 Dec 2021 09:35:17 +0000
Received: by outflank-mailman (input) for mailman id 247284;
 Wed, 15 Dec 2021 09:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxQgu-0005ct-64
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 09:35:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e061dbf-5d8a-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 10:35:14 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-CshbxS03OxKBEdvM7iIo_Q-1; Wed, 15 Dec 2021 10:35:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 09:35:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 09:35:10 +0000
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
X-Inumbo-ID: 4e061dbf-5d8a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639560913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiWYUneSy5SMM7B4blqAl0KhY4d7zmQhARRK4bkn8Qs=;
	b=X8hyjeLQeF5pUeE0LMHoZMswF4invV5u6QH8C9T54wPWqY7pj6nCuViSJeCNeTZ2Yh/ru6
	yxh7dUvL7iYIIJlpIM1o4wOmHVd9A3pCeLuJfL5qLfAWhwz4y6f15dDhCUgjO2ed9+fhqA
	C+1JWXTUaRoPnbRcIV6cQX64DlhxY7U=
X-MC-Unique: CshbxS03OxKBEdvM7iIo_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aolIeHx9lwJgi3SHVMVAQvnXoHjbJq1qLZpwK+n9CPfkQRdRGcr2RBLheu8utag9z7WDNp3TZQlSd+iAevcFMZF3wZXP9qszypTeyapb4yFzKwUri2dHuYk7AwFidb6hojaKi+GbnnWsC3xSPwlDUHAzsS0KGSauiQubKUQ9bWfda3PhOqtQqcfdYz/O41WOZehEMgGuokRi8e2TWaW1PI8KUOo4C69uXlupxEqFitoimmzxSPKAxxqKx2N/GIYpbUM7xJQgoe17SKsJYC3+FuvIvYinVjnvZWnhmGFN5MQRnINSiWNZZjWnBFrba39fODhERlNNvWL2RYGvFuXF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiWYUneSy5SMM7B4blqAl0KhY4d7zmQhARRK4bkn8Qs=;
 b=QG5QvYSl1qwTnPbw9QgznyxbcqzcuyCUZ9Ge2REcdsVbVUgu2ppw1nStdXFJj1Zg0VgwNh+hhIM0h6dkP4wL5Ar3845efoQM70sPaJrrRexV5rEZkw90Ba8LozwjTY6mVgsEsrrXX0mpJ2sj2R0/CRxKU9TDTZz+ylalkxvLRm1z+HeM2ts7N8yUPOS7tpWC4DO0e4k8NFfB1gJZPhiAfVunR2vR1qaYlT6kcAC/FHrBt+jnWjfrdTDtT/kzPlnHR/eKbo3HsEUeK2/vnGi+kN+VCiPY9eM2atRKokBLPxQqf/t1NSlgiwliYVeYn3LFcQIVEN5R5B4My3Aspb6wZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82557218-539b-204a-a1a7-7c796a2baa8a@suse.com>
Date: Wed, 15 Dec 2021 10:35:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
 <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
 <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
 <1fcc18d4-70ce-12d1-6d54-ae82e511a4d7@xen.org>
 <040a1871-08ee-00e9-b46f-ca4854e8a541@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <040a1871-08ee-00e9-b46f-ca4854e8a541@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0098.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5ff4b0-9788-4dea-c352-08d9bfae2fef
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4846D7666F76C256B429516FB3769@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sbr0nuFvwVUU1ZQpixtKOJ2c80ipjhNR1WaAjPFCGLv3qQSqo70o/JFt40Myvoz6i01PLdQRqXAyBs+HTUStG75bQfOlWyVV2U5Q/IlT6hPxTaDlSO8rKkBtH9Z0guKok+fXdbb1NF9k4Ql2Dc++Id3XcGzV85DKGYSGyCYWhslvb4XvJWaMt5fXxgF1ez0JPAf1H7bHOKytkTdSQ/cRB93u+hEkyRMH7KLA19Xw5LkjYBcsf9jyuDH3OUDbQAqDla8DIxjyoB9p8qMMvidJeuXhZa/vUT3eEhyfo87ZyzSrZsaC2msubDOeMtN7ovrRwfnGGcYcm0tQJGEawSXh/RFx6DGaBiOkF046GO4jbPrDCSd9eGu/Kdwd+aLY2JKrD4A188MFpY1GgECv8w17RuTUVs13Ya5j/weJNxbSrEzLY/OfNiKOCTtQ4Uz0d5mOKa41BpKdT3kcnxulB9B1hlgD135DS/DjOZXuvZdKsAvzUmZhktt4ZN7R6Cw6Gf4CQtFlRtfu4/5H6pCNt0H4I2vL0QDdSEd/+w+lOc1FjLq+f82/FEhM/ME1t/UI3itDtZyC6YKmeEuPiJgT6mcncmabVxsS83y2xHSuulJgFaHWyK7XgEWrB2mivpWh2mQwgdG/Xq3kM4PkHGnBVG7v1YzvfPJOQ8RK0gl7Vi1a1c7O2tNj1YpLhPBSogiu+9RcFVwPxYaBvaXmqF19gwDBXj6PIwN4JMRToVKucI+yP7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(36756003)(53546011)(6486002)(54906003)(31686004)(316002)(6916009)(26005)(8936002)(6512007)(186003)(8676002)(5660300002)(508600001)(31696002)(2906002)(2616005)(6666004)(4326008)(38100700002)(83380400001)(86362001)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTB4S0ZZRm53QjFoYVYxc1lZekl6RU4ybEwvaVR2SDVrWklJUlBYaEMvWStk?=
 =?utf-8?B?MytXT3NWYUwza0hjK3N4NzVsWEhBOENZNjZSdWJwMC92MDF2SE11N1grSWp2?=
 =?utf-8?B?OXJ1MTZDd290c0Foc0Q2bStJY2xXU3lYOTVaa2tEMjdRcTRIMTVkblROVDBu?=
 =?utf-8?B?SzFaVFp4elhGS3FDOW9vd25QM1lKMm5ya08yRXFPYWNYMmVvemRJZ01RNUxH?=
 =?utf-8?B?NmRTUktCdis1a3dHanZHNTNBRDBmenFxQ2dCL0t5LzRJdmh3eCtiOUY2ei9T?=
 =?utf-8?B?N1BVVnJRWkM4aGVlc0R5TWNmT1QwajZ4OUd5UkY4V01lcDgreW5oNEFLK1A2?=
 =?utf-8?B?WCtUQkZpbHBOK001QVpWWUEvbnQ1OVpsZy96Y3N5bXhRWFNsc2NoY1gyZWRG?=
 =?utf-8?B?eVd1b01rMjhFTkkrc3kwNTZlQzN6b1QwVW1LQloxd0h5aFV1T3Y5eXU3b2hI?=
 =?utf-8?B?NTYxM09wam1CczFrWkpsN2dPalQvUWdYK3ozOW5NZUdmb0FXcHI5UUpIaThI?=
 =?utf-8?B?WnRDOTNtM3dpWXpYZ0pZVEJBeDVINEpLWGRvcEdtekdWT3Y3WWdTTG8vVWFk?=
 =?utf-8?B?SFZoR0FFTno5QkM3SURraGRuUVd0UEZVdkdscUFaSnhOeFRiOVp0TytsTzVO?=
 =?utf-8?B?bzBZb3NicC90b0NWOFFQVFVqa0dKNjJpUGxrUnRyc2I3WlNxZFBwdCsxYnJI?=
 =?utf-8?B?WkRFV2FrVWxOMlBTTFpSdlQwVGlxcnc1emdZMlJkKzh2MVMzNjhWUXZBOERs?=
 =?utf-8?B?amNkdTZKV2JMbXZJL0tyeWxaQnlKRkQxYnhyNVNFUitzU3lmTW5JWlZIK24x?=
 =?utf-8?B?NWdNNENzc0V3a1ZGeFNyNU9GVk80UXc5OTRZa2g1bXZNQUx5ZExJb2Y5WkRQ?=
 =?utf-8?B?NjZlSXlHVmFsSHVVZTIvaFFMblBSeGV2TEdyT1pxYktsbUlCcytOTHVWKzVE?=
 =?utf-8?B?RzVhVDIxdVBkdFZBdkcyUWtDQjAvMmF2dUU2YVpSL0Z6MURTLzY3VkNzOHV2?=
 =?utf-8?B?ajkvT1BqRGlUK1NEeFk3ZSs2dlkydHRVZ1lQYVNzSDkvejlxcCtjc2M5dEtU?=
 =?utf-8?B?bFhYY3ZQcWpBRnEyMzcyL2ZkQVpOeVlaQ2NSM0dTcDdMTlk4eFd5Mi8yZjcr?=
 =?utf-8?B?ajBuY08vNnNZZXdSZ1lFendUaWdMYXljQ01aR1RRVVkvN3JJWE5QbzBPRHRu?=
 =?utf-8?B?Y0NRaHRXVEVwWnJHNzcwSDJtZWpEV0crQkxwSHl5ekJ4Y3Yzbi9VUW9JMjc0?=
 =?utf-8?B?ZTFqbGtJUFFCdFNtbnZBZTNXZ2grdjRXZ0N0TmpFZHRqMGprd3ZVN041Yjk4?=
 =?utf-8?B?SzcxVnRiYU41Y1B2ems3R2sxZlF3aUkvMUNiUkdEM1lHR0prcWpYZWQ3ZlZh?=
 =?utf-8?B?SFg3cHZXQThiUSsrYW5CWlJiN05xOHpCMlRuWjYzTzN2Rm9oWWpEZHdveTNQ?=
 =?utf-8?B?eU8xc1pqUUxIRGlwTU1mbi9NUzluV0t5Z042YmRCR1JNOHlqMDJhbjRDa1Rp?=
 =?utf-8?B?VncyQ1BLcVZaZ0FzemE4S0lGMHRlV2NxdGtac29Hcno0b3BRaUNkc1kyaXRC?=
 =?utf-8?B?STlGR2VTWm9ZRWIrM1hhNUNGMXZoOENjQVVtOG1iTkc4eFp0YStJQmVKUFUx?=
 =?utf-8?B?c1NyMXJzWmF6VktBQ3BhZzl4OHNuYkFRSmp3UXlXcmFoeFlZajBSUlJJais3?=
 =?utf-8?B?dUtDdFc2Y1hVZ3pHWnRVc2tPS0djc1RtZ1l1dU4vQlBaMjRyQll1V1RWdWhD?=
 =?utf-8?B?V2JmTDJjUnkycjZTUUZaM3dLVGpsdmtkZUVSZkIrUXhJSXdJZkFyYTE3Q3dN?=
 =?utf-8?B?ZUdFSVhrN05USGhaZ3luOTJMYmhaVjFhWEpRNFZTbEdIa2NabHFQYURMWk1m?=
 =?utf-8?B?NzUzaVA4OWd3c01xZUtaL2k0TXVvVWZRazF3dEFMdEZvSHh4ejdXRHJhcEJX?=
 =?utf-8?B?elo0Y0pXelY5VXA3cWFJUGE5ZTBZM0VPZnpMR2NkOHppRUYvRzVqN2ptODlB?=
 =?utf-8?B?M0k1cnQ2bW14TWFNSzd2WG1MdG5KRGZ4N3hxM2RPMkJzdk1IUUVBR0JhelFV?=
 =?utf-8?B?cHQvRGsxSDFRWnJuWTIzN25GZDVnREREODlaSmQ4cjJhalMvS20wMXA2Mlkr?=
 =?utf-8?B?aDRyTDNiK0NGN2lNYzVYT1Z3TWZKRzJQcDZVZ2g1RGpuOU4xL1BjOFhBcWN4?=
 =?utf-8?Q?rzEgGMWnXnGlebdPM76y2B8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5ff4b0-9788-4dea-c352-08d9bfae2fef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 09:35:10.0801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t80zkGj0LGvsIM7AZ76hAOTZqe3djwMGBxZH27xBYjU2gm0jrNRTmHdDYFWSWne55CXOamG2AL0SBJEmYhMmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 15.12.2021 10:27, Michal Orzel wrote:
> Replying to both Julien and Jan,
> 
> On 14.12.2021 12:30, Julien Grall wrote:
>>
>>
>> On 14/12/2021 11:01, Julien Grall wrote:
>>> Hi,
>>>
>>> Replying in one e-mail the comments from Jan and Michal.
>>>
>>> On 14/12/2021 10:01, Jan Beulich wrote:
>>>> On 14.12.2021 10:51, Michal Orzel wrote:
>>>>> Hi Julien,
>>>>>
>>>>> On 14.12.2021 10:33, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> On 14/12/2021 09:17, Michal Orzel wrote:
>>>>>>> Hi Julien, Jan
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>>> On 08.12.2021 10:55, Julien Grall wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 08/12/2021 07:20, Jan Beulich wrote:
>>>>>>>>> On 07.12.2021 20:11, Julien Grall wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 07/12/2021 08:37, Michal Orzel wrote:
>>>>>>>>>>> Hi Julien,
>>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>>> On 06.12.2021 16:29, Julien Grall wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>>>>>>>>>>> to hypervisor when switching to AArch32 state.
>>>>>>>>>>>>>
>>>>>>>>>>> I will change to "from AArch32 state".
>>>>>>>>>>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>>>>>>>>>>> "If the general-purpose register was accessible from AArch32 state the
>>>>>>>>>>>>> upper 32 bits either become zero, or hold the value that the same
>>>>>>>>>>>>> architectural register held before any AArch32 execution.
>>>>>>>>>>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>>>>>>>>>>
>>>>>>>>>>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>>>>>>>>>>
>>>>>>>>>>> Ok.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>>>>>>>>>>> needs to be fixed.
>>>>>>>>>>>>
>>>>>>>>>>>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>>>>>>>>>>>
>>>>>>>>>>> I would say:
>>>>>>>>>>> "
>>>>>>>>>>> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
>>>>>>>>>>> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
>>>>>>>>>>> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
>>>>>>>>>>> if the command passed as the first argument was clobbered,
>>>>>>>>>>> "
>>>>>>>>>>>>>
>>>>>>>>>>>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>>>>>>>>>>>> entry to hypervisor when switching to AArch32 state.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>>>>>>>>>>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>>>>>>>>>>>> when not passed.
>>>>>>>>>>>>
>>>>>>>>>>>> Which error do you see otherwise? Is it a compilation error?
>>>>>>>>>>>>
>>>>>>>>>>> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
>>>>>>>>>>> So basically in all the places where entry is called with hyp=1.
>>>>>>>>>>> When taking the current patch and removing default value for compat you will get:
>>>>>>>>>>> ```
>>>>>>>>>>> entry.S:254: Error: ".endif" without ".if"
>>>>>>>>>>> entry.S:258: Error: symbol `.if' is already defined
>>>>>>>>>>> entry.S:258: Error: ".endif" without ".if"
>>>>>>>>>>> entry.S:262: Error: symbol `.if' is already defined
>>>>>>>>>>> entry.S:262: Error: ".endif" without ".if"
>>>>>>>>>>> entry.S:266: Error: symbol `.if' is already defined
>>>>>>>>>>> entry.S:266: Error: ".endif" without ".if"
>>>>>>>>>>> entry.S:278: Error: symbol `.if' is already defined
>>>>>>>>>>> entry.S:278: Error: ".endif" without ".if"
>>>>>>>>>>> entry.S:292: Error: symbol `.if' is already defined
>>>>>>>>>>> entry.S:292: Error: ".endif" without ".if"
>>>>>>>>>>> entry.S:317: Error: symbol `.if' is already defined
>>>>>>>>>>> entry.S:317: Error: ".endif" without ".if"
>>>>>>>>>>> ```
>>>>>>>>>>
>>>>>>>>>> Thanks for input. I am concerned with your suggested approach (or using
>>>>>>>>>> .if 0\compat as suggested by Jan) because they allow the caller to not
>>>>>>>>>> properly specify compat when hyp=0. The risk here is we may generate the
>>>>>>>>>> wrong entry.
>>>>>>>>>>
>>>>>>>>>> compat should need to be specified when hyp=1 as we will always run in
>>>>>>>>>> aarch64 mode. So could we protect this code with hyp=0?
>>>>>>>>>
>>>>>>>>> Since my suggestion was only to avoid the need for specifying a default
>>>>>>>>> for the parameter (which you didn't seem to be happy about), it would
>>>>>>>>> then merely extend to
>>>>>>>>>
>>>>>>>>> .if !0\hyp && 0\compat
>>>>>>>> Isn't it effectively the same as setting a default value?
>>>>>>>>
>>>>>>>> The reason we seem to get away is because other part of the macro (e.g. entry_guest) will need compat to be valid.
>>>>>>>>
>>>>>>>> But that seems pretty fragile to me. So I would prefer if the new code it added within a macro that is only called when hyp==0.
>>>>>>>>
>>>>>>> So you would like to have a macro that is called if hyp=0 (which means compat had to be passed) and inside this macro additional check if compat is 1?
>>>>>>
>>>>>> Yes. This is the only way I could think to avoid making 'compat'optional.
>>>>>>
>>>>>>>> Cheers,
>>>>>>>>
>>>>>>>>>
>>>>>>>>> or something along those lines.
>>>>>>>>>
>>>>>>>>> Jan
>>>>>>>>>
>>>>>>>>
>>>>>>> So when it comes to zeroing the top 32bits by pushing zero to higher halves of stack slots I would do in a loop:
>>>>>>> stp wzr, wzr, [sp #8 * 0]
>>>>>>> stp wzr, wzr, [sp #8 * 1]
>>>>>>> ...
>>>>>>
>>>>>> I don't think you can use stp here because this would store two 32-bit values consecutively. Instead, you would need to use ldr to store one 32-bit value at the time.
>>>>>>
>>>>> I hope you meant str and not ldr.
>>>
>>> Yes. I am not sure why I wrote ldr.
>>>
>>>>> So a loop would look like that:
>>>>> str wzr, [sp, #8 * 1]
>>>>> str wzr, [sp, #8 * 3]
>>>>> ...
>>>>
>>>> Why "a loop" and why #8 (I'd have expected #4)?
>>>>
>>>> There's another oddity which I'm noticing only now, but which also
>>>> may look odd to me only because I lack sufficient Arm details: On
>>>> x86, it would not be advisable to store anything below the stack
>>>> pointer (like is done here when storing x0 and x1 early), unless
>>>> it's absolutely certain that no further interruptions could clobber
>>>> that part of the stack.
>>>
>>> We are entering the hypervisor with both Interrupts and SErrors masked. They will only be unmasked after the guest registers have been saved on the stack.
>>>
>>> You may still receive a Data Abort before the macro 'entry' has completed. But this is going to result to an hypervisor crash because they are not meant to happen in those paths.
>>>
>>> So I believe, we are safe to modify sp before.
>>
>> Hmmm... I meant to write on the stack before sp is modified.
>>
>> Cheers,
>>
> 
> I would like to summarize what we discussed before pushing v2.
> Changes since v1:
> -update commit message adding information why do we need to zero top 32bits
> -zero corresponding stack slots instead of zeroing directly gp registers
> -create a macro called by entry, protected by if hyp=0. In macro add if compat=1
> 
> Now when it comes to implementation.
> 
> 1. Regarding save_x0_x1, it is 0 only for guest_sync_slowpath, which is called by guest_sync.
> So as we are dealing only with compat=1, save_x0_x1 cannot be 0.
> The conclusion is that we do not need to worry about it.

Oh, good point. I guess you may want to add a build time check to
avoid silently introducing a user of the macro violating that
assumption.

> 2. Regarding clearing high halves of stack slots.

I don't think I understood earlier responses that way. I think
fiddling with the stack was meant solely for x0 and x1 when they
were saved earlier on (i.e. instead of re-loading, zero-extending,
and then storing them back). That's also why ...

> The new macro (called zero_stack_top_halves) will be called in entry before the first instruction sub sp,sp.
> To avoid saving sp position/moving it, the simplest would be to execute 30 times:
> str wzr, [sp, #-(UREGS_kernel_sizeof - 4)]
> str wzr, [sp, #-(UREGS_kernel_sizeof - 12)]
> ...
> I could also use .irp loop like (.irp n,1,3,5,7,...) and then:
> str wzr, [sp, #-(UREGS_kernel_sizeof - (4 * n))]
> but FWIK Jan does not like loops :)

... in an earlier reply I expressed my surprise of you mentioning
loops - I simply didn't see how a loop would come into play when
dealing with just x0 and x1.

Jan


