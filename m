Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DF7663E6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 08:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571332.894905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPGa2-0000Cq-0D; Fri, 28 Jul 2023 06:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571332.894905; Fri, 28 Jul 2023 06:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPGa1-00009g-Sm; Fri, 28 Jul 2023 06:04:01 +0000
Received: by outflank-mailman (input) for mailman id 571332;
 Fri, 28 Jul 2023 06:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wghk=DO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qPGa0-00009Z-8s
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 06:04:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898e31fa-2d0c-11ee-b24c-6b7b168915f2;
 Fri, 28 Jul 2023 08:03:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:03:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:03:54 +0000
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
X-Inumbo-ID: 898e31fa-2d0c-11ee-b24c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXR83kIDWg79YjN2+R8sQeBivMlIspA8nX35hc2n/xusXW5j1ZcH122isX7qr116kbbsBDVoTt2qLthcxY13VNExkKyiAlVIHJzH3DBqK+ZXesOyGx4GjcI4mEzoZ5y/Rkg/0PRe4RK4uUTj5ReKTp5ZYE3gFsOhImMfwemcLErNuvuk0FCqc9QnX9aLI9Nmv6L6v7KjTN1Sa8di2mR4Ni4TBu/bPpey5XaY6eI+x/YrGwAIK15+mYNNkI9WOTApDWR6eZQik/47mudeC0YTNMeJtKYHWO2QVLrYTmGd0M7b9pzISqYa0m6duP4jS+KFrxVZYM3jGLUvfHV5UMxGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y30qDAn36TIcQrYPU2uY4PmbPUt5j2OKG/yfJlDDEbc=;
 b=mnwvbdlHXsFi3L7/AvQuFiDDbJLKojzV01ig7onqvFOMqdFhQNYHyp+q95OPTwPjNMcxBBnXxwXuWQ8KNAYt+biitQAcfVefSrPckuAt5oBIRIPWZ6C9dw9jDqyiJt54/RYRkOehU+YdCsY/srBGgnjNdUh87g46a2E4P2s7fxYDchyMasEdVyjPeaRMBboqxIa0TfmbbGz0aXlzTaVpTJW/I1ihORVoLRG1ZiIsmjVZNxQM6uXJ4rVs2Y8Cjvdye1uy0kCOZoz2N4ByY4rc9Fj7BU01H+FXS1BwVh1kDlOr6tlVrTCOV4Pl361IVXLSw7RsLRZpX1Yu/cDJok7jvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y30qDAn36TIcQrYPU2uY4PmbPUt5j2OKG/yfJlDDEbc=;
 b=OL7RdEiJPpzP+KDf9JezmeIuXrWrs7BeZuu58KeHxAv9YXvGGtZckmHMjsTpDDTRXXyGvxYWudwDUD3yDgc/CkFC8qfOylpUyTi1dDrkgC82Q0A2czFnNWoO6WsuKBk6E1mlq2UyKdHcSY0aX7fR5rBXhjB5ysnzP2Mm0RnVJiEMvOjMq7nuiXPYBV3q0Zn3YrnBkGmyoDJM2dyl+DKnTHiILJGUfJgy3rXQV46y9Y4K2lJ094r5e6JRPSFZpqxnIZ9Ys0VcMrB1sOb1JD063vFmvBgCx5ajYbIGqB8JppLXHRIq3MxO3Hwgl1s6p84uHjXae30+q2xZzeAKcCe3ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44333683-0946-56fc-69ec-ce6b8dea36b4@suse.com>
Date: Fri, 28 Jul 2023 08:03:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
 <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
 <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com>
 <8914bf47-c4ca-4a14-6a92-b5b23ee739a0@suse.com>
 <alpine.DEB.2.22.394.2307261448010.3118466@ubuntu-linux-20-04-desktop>
 <d099b736-22cf-0502-df37-9ae7b14d048a@suse.com>
 <alpine.DEB.2.22.394.2307271233480.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307271233480.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8802e833-fbfd-41c1-7f79-08db8f306c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JnLR1wkdFdw5EaqYs2xBADJAheUKqyO78Mr1vk5qp31TLqpMJpuGzgyZnlDhwU7N40iUywjPh1deI22aIHywu49Rd3HFwmJfoTcTv+88oTz0ubj4Kr39jP7DwZOcYx7753oUwiOr9rwvn2txWd8INvLvfi6nx2/W8urDzULZN4jDPNOHaJGVCKqvqMr7IHMkifhREa1LClq7Uo/hUd8+JaS88nKtZtjwhG5LA6doYz0sHpapHkFq/YlX9ayKUDYILZ7YCF0ZvkLXpnEWxGj9+Dk1nOrqyvkQDci95D36+gQnQt2gySPWi0rot2vl0VLCKxvH4k5Pbd99rT+wV4a0amiAF/gTilPA+loiQbgunHpnwq9fXvBxwBUessijgm+OREOYrw3aa+8zp1PZZI0s+txIJ6NUJgtGz4on/MJP4AiDKzsR/RxH6KsFH80bZ/gGeVLTKJpls7cY6ERiQ8pbhD//kMW31rnaphIPxzes93V63gOZin8yK3O6sOGOLwIutr+Gt5ByZG2JJncuKy6hJHSCNYBQNZTxToHcO7/9S9GAgsmBg/nHu5FIYPiwtTGF150c8kouV7RsxfJ6hIMnQwu6ykOrnwKkvprHR/2zJALjE6tWr9WYyn8Ne6e8A0yBPzeDPQUm+6zMbgRi9JPLoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(2906002)(41300700001)(316002)(7416002)(5660300002)(8676002)(8936002)(36756003)(86362001)(31696002)(6512007)(53546011)(26005)(6506007)(478600001)(6486002)(6666004)(83380400001)(6916009)(186003)(31686004)(4326008)(2616005)(38100700002)(66476007)(66556008)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjRYSEM0QmFmRVBLejNjdWd2QTFPQkVPd2xDd1RySk1ORmpmSjVQai9VRk02?=
 =?utf-8?B?cEVhbEhiejRlc3gyNE5GQzU1OFV1ZjJMaDdpNjB6eWZOU1VRZmhmTEZDTGxY?=
 =?utf-8?B?bEcvNVA1dlZ0ajUvZncvU3oxaDc3R0VuMnhoYTJwMVFLbkxhOWFncU9Nc2dI?=
 =?utf-8?B?cEo0R1ozaXZlNVR5Ny9TWHduclJHUFNOVVdnZGhiWnpqTHZoZ3hMb3pWWlhY?=
 =?utf-8?B?MVN1ZWRUNHFrSytOQzY5K1RQZTQ4NEtwWHJ2bUhISFpPOTZMMENuN2dNbXBw?=
 =?utf-8?B?NThRRFNyVWtxUEFUUGxMMjcwQkpFdU15ek80RUYxZ1phNkdwU0kxdFBhcG1j?=
 =?utf-8?B?QVh4VEEwc3lncWJnN05kTzkwZHZHTjlFUkFIZ1VNLzdydkw4SENxR1p1Vnl5?=
 =?utf-8?B?L0lLWkZ3b0liKzdZOE4xcjNBVXpsWTQwT2ZuVGJmK0NTcHhOa1Y0SkNlVDV4?=
 =?utf-8?B?am1lYVd1VHdmWTJiWThDNlE0T1JxYkp3WEJ0emdQempvMThLTExOZTBvV1lj?=
 =?utf-8?B?VTgzQVBuWm9scjZSKytwL0dzL3F1Sk1aMkp4dGJmN0tzTXJhZlBOaWJvbjha?=
 =?utf-8?B?a1FYWEZzck9Idlk4Y2F4MU5MTXNuY2psMTY2UlJmVHdhK2NoVmNsVlk2TVlB?=
 =?utf-8?B?WDYxV09LV3NLUWZsVHBYaXdYYnQwTjNBNTlJT0lKeXhHaDJCM3N6dm8wSzNZ?=
 =?utf-8?B?YUpVakFlVmxvSURNbEdDWEJVL1lJcGFqN25HbkNzWkVFa0MvNG1CTUQwOVJX?=
 =?utf-8?B?c004Z2lHVnJxdlEwR3VVRXcrQ3dHQmhOSG9ZZ0w3ZEVlRldvZTZjWkFIRnpB?=
 =?utf-8?B?NU9ZWk10YjdicFJCckVhYWVsSFVEQ1g2aHVzUFRnSW5IRlZIVEZoTFEzOFVS?=
 =?utf-8?B?QiszdUlPRHgyc3ZtRkQ0OXRKeHpkS2dRUGJCYUh0cWJtd1Q4MVVZazVkY3Y5?=
 =?utf-8?B?ZkgrdTlFdWIyR0tkeDJUNUMzeWhoZzBWK3lPdmtyaTNMN2JEUGt2cjNOOUpo?=
 =?utf-8?B?VmZXWjViTjF5Y1c5R2JMQ3ZIei90ZVhzZmJkWUd4VWFheVFncG50STVzajcv?=
 =?utf-8?B?V01kT2h1QUtTWmN6VXQ1UFFlQkU4L2tqNng0dmtJQkVKRG16RGNjUTNVZWhL?=
 =?utf-8?B?UGFOUStiaEhSUjM0Wk9tZmtDTWdYemNlb1V2VDZKNDFnSGVCRnJOdEZPSElM?=
 =?utf-8?B?S1BwME5TM0hvUTg2QzVKNFlXSHVCT3MzeW05ZzlLTnRaSWowNmJGUjY0NnlE?=
 =?utf-8?B?ZythZ3dHaWd3VkZoeE10NGF2d2FJUElZU0wwbkVrdlRaZVNrWUJ2aElDVHJP?=
 =?utf-8?B?TzBBVVRBQmtJQ0tubVRlNTVpNTZKUnhtenNhaXY4THpZaVBtR0FXUXd1WU0x?=
 =?utf-8?B?UnhEMVBkOWVrUnNJL3dBcHdmbGNKb1U2OUhqMXhONFhIRjVZc0Y1N2RkRE5H?=
 =?utf-8?B?VHFQSFA3d2RVRHlCL2pYN2J3MmtEeDZXWDJTVUNBUU8yV043dVRlN05RVU56?=
 =?utf-8?B?MHBPUmZ1RC9OMkdBQXltRlRRWlBVeUNEOHFkS2UzTS9MUTdDT3dlNFpzUWpp?=
 =?utf-8?B?eXE4YnRRazdLaUJ3TWl5RUFJdEdKbHNLM3pqWGs1MW1nL1BsSXVzVG5RZ0VQ?=
 =?utf-8?B?eE1OWDRMSUU3R2ZlT1l0cXJxZkkwMGdFblA1N2dKaUM5OS9HR2h4OTJWZWc0?=
 =?utf-8?B?MzNiR2x4TEpJU3o4MjVGOERsWHJRWis0YWNKUG1kY2h3K0xJRDVkYmlzVVIz?=
 =?utf-8?B?TDdFWTFESllqMGJJUnRzdGxLSmowamtHWnpsRVNodUpsYkNnT29sMzlYWE1i?=
 =?utf-8?B?VER4SkJXYVYwdHBsWlZjVUpOeUtrV0d2R1pZZjNFRzhBeHJ3VWljd1ZzUnNx?=
 =?utf-8?B?UncwOHJFTUFYWUdRK1Vha3ZXalVOcjA4YW5wbUxtL0hOWkI1dlBkaTFrbzNR?=
 =?utf-8?B?YVY3UTBtNkpwd3RsVE1mUysyQ1ZmYkxHWEZyOGE0ZWZhR3J5ZEFtVHlWY0Zy?=
 =?utf-8?B?ZHVCSlcxcVcxNm5zd1NUVWNFSXFxL1habFZUR2lRdlFqcGFvUkNINkFscEFB?=
 =?utf-8?B?Q0xoWFB4QlB6WXRPR05sMjcwcHUzaHBMOWZSaEp4N1ZKem4wRnQxUXFFd0hT?=
 =?utf-8?Q?Xo5cUPV8ZafdKxz8qHl2tWBz3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8802e833-fbfd-41c1-7f79-08db8f306c41
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 06:03:54.1882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: id6dtABHzgAI4S2JeF//ts+27FYATvgltpKq87uMNruwsliGQ8H8FEM7iy+P7B6ujpsq6hkt1sPN8h0s7IEz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

On 27.07.2023 21:35, Stefano Stabellini wrote:
> On Thu, 27 Jul 2023, Jan Beulich wrote:
>> On 26.07.2023 23:49, Stefano Stabellini wrote:
>>> On Wed, 26 Jul 2023, Jan Beulich wrote:
>>>> On 26.07.2023 08:42, Nicola Vetrini wrote:
>>>>> On 26/07/23 08:34, Jan Beulich wrote:
>>>>>> On 25.07.2023 22:45, Nicola Vetrini wrote:
>>>>>>> Rule 5.3 has the following headline:
>>>>>>> "An identifier declared in an inner scope shall not hide an
>>>>>>> identifier declared in an outer scope"
>>>>>>>
>>>>>>> To avoid any confusion resulting from the parameter 'debug'
>>>>>>> hiding the homonymous function declared at
>>>>>>> 'xen/arch/x86/include/asm/processor.h:428'
>>>>>>> the rename of parameters s/debug/lkdbg/ is performed.
>>>>>>>
>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>> - s/dbg/lkdbg/
>>>>>>> Changes in v3:
>>>>>>> - Added missing renames for consistency
>>>>>>
>>>>>> Hmm, you asked whether to send v3, but then you didn't wait for an
>>>>>> answer. So to repeat what I said there: I'd prefer if we could first
>>>>>> settle whether to rename the conflicting x86 symbol.
>>>>>>
>>>>>
>>>>> Stefano replied asking for a v3 [1] before I had a chance to read your 
>>>>> message this morning.
>>>>
>>>> Right, sorry, I spotted his reply only after seeing the v3.
>>>
>>> For what is worth I prefer the current implementation compared to
>>> renaming debug()
>>
>> I don't. My replacement name suggestions were only "just in case"; I
>> don't really like them.
> 
> Understood :-)
> 
> How would you like to proceed?
> 
> 1. we commit this patch as is
> 2. we wait for a third opinion from another maintainer
> 3. we find a new name for the variable
> 4. we change debug() instead

4 is planned already anyway; actually a patch doing that (and quite a
few more things) was posted by Andrew a while back. We "just" need to
settle on the few open items there.

Jan

