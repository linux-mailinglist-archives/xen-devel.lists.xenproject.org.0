Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D897D7D55
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623514.971413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuSe-0000nf-Cj; Thu, 26 Oct 2023 07:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623514.971413; Thu, 26 Oct 2023 07:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuSe-0000ll-8G; Thu, 26 Oct 2023 07:07:20 +0000
Received: by outflank-mailman (input) for mailman id 623514;
 Thu, 26 Oct 2023 07:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvuSc-0000lf-HR
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:07:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b6828a5-73ce-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 09:07:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8; Thu, 26 Oct
 2023 07:07:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 07:07:13 +0000
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
X-Inumbo-ID: 4b6828a5-73ce-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKm6SHmFajk4NlGOUZVURElxWvS+2hV1qYDmb6IP5NlGrkNgbcZmReXUqv1c3dI7wZ//ampFDrcWLGYGtIUPud3fvTpJ45XBFPXk03M7pHdexkDzSj5OUZ1khpRb4RPntScnxV35dGt30213s1VobzO2LY0N6uF/xUflHAndNZTShSmuyAIQj+9bEgGr2MIHODfme/skvowtZy9HrwXgOvr/KQoU7B52OXxqsnu+t+vQMrvz6d+ANxEwLO25qiCNbWEhHLxE+urBRwq9qrYmYKTobuuSWasDMOV6uBma2z1DxZTFkodS4VKkr1LLMzc29+VKBO37HcnoZur+YsJ2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBRVz6NEhbBr4JvDnQvORl+zXPCbp9Jtnxwu6amglvI=;
 b=ALnzgBQERiX2Syo16i1QzZj9T5A99ctO1k4jW87KrrGNUp2hsRybC0m8NsHAPpPzjrOpQIqQ+3jM3Dsz+EAxi1v4PI1zX2MtWrFSargZvIPMA0wpQ9qCvHUhNMt2+eia3TylBi/fRMD/LQMIwPkDBPFvkfqpZsPqRXtDRyH97nAniq3bqoniD/pEug8MJOyt6FmjOE6zgG6HFuSZJ32O7bvOJETegAZSCGMtLp9HOq5bR7ZIKPS1ME3HPrvbJTCEj4l1TwqreEgWRqwGQDonUDVYrADEiH71eqHK8wi9X0qvvGrQDuPtGHft54vYjL5aA0UbIW4KJVVS/XXziFPzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBRVz6NEhbBr4JvDnQvORl+zXPCbp9Jtnxwu6amglvI=;
 b=g7xYnQ1oXDGox6aVAZGbmN+IC5pNSlUkIhnCkWLLLirYGwr77lwPViz6p4AEetcdeI4fD95DSaVk5NLtEgyWMa5QsOZxHi1cRmYO1x0XLhvy+7e/pj7lNvyAIe6gMEr/9pZTKZLgcqqx9QEDQ5RLNiGXdM3k6NG2eGYe4GqxrCnqYQ3Q9G1E3rkkYaL1TGSsLo+lR07Xi7/7tvzPbYrrSDIWfrdpTUdv3PLdEJmVjusugl1pUdXt6zUpuXnaZZFiqyuqKzMvZFBO2vjLjd/dIxdGVXSBDASum6HMHQ3OGvqDXDQEo9JPnHvmPi3T1M8M0NBj1w3c3r8D7RZ6XcxQEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ec482ba-e334-3120-dbe5-fc1e5a29f9fe@suse.com>
Date: Thu, 26 Oct 2023 09:07:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
 <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
 <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
 <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
 <c1fa350f-6f49-e2b1-0cda-dec99df415ae@suse.com>
 <alpine.DEB.2.22.394.2310241254480.271731@ubuntu-linux-20-04-desktop>
 <f546b8dc-baa8-c178-12be-70f7c1a8fec8@suse.com>
 <50b3a500-aa7d-4d3d-8bcf-220f8ee69b0e@xen.org>
 <f6b207c6-4bc2-e172-428c-a2e3294cc490@suse.com>
 <1fc2c191-79b7-43fc-9068-5605e741c243@xen.org>
 <alpine.DEB.2.22.394.2310251408030.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310251408030.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ab8f44-0d76-433c-76bd-08dbd5f22dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RkI1eVBJXITRyti4hRYuxtX47B/LP4oKXktTx+yDiJpcJF+OylN6qP4h9O5evunpwiwoahGKsm49fJNgXC+247pXwuqoCVLSTM+67uZdykNwpA2DdqRPnkRicc/HQdSo8Qzg9b7l+BzADmvIgxLolhDp4dXhIfd7UBbClgIGWlZcbg0QGOg/wtAPOl2PZfzlPd5xAxqvgUYkZ848QiiSzM0T1jrmJugdIoPSjKvvLuXTBcE7SgUPKyKMrgTywM8TmfCyT8m5cAq6vE19OC6mSr+M5zWdohNLleKzd4gsMBYJG9LYyaJD6Nz9aqZtAvIcOv+2Zs6uNjmKidPiam5GvEz9gs/iYsifWmFloOY3p+rU77bF3m+6/zyBVSYk/NjtFJmf9/TY/E0jic2L6NPh71lIr4zeauwI74nfdhL6J9TvkhDwgUi2G3LbFzIVNZdlDf3APFcfNgy4IYNLSooUI2j7IQo7jGry+F+PjJeWtN9mBO7UlwabLZ/lTKAkOViwB7u3wOzM2t3285ECkudwfDWAMmMTq7TYP6tu0vz10+SHJOhLdiYk69pkq+4Nh5YTvFWYMzhVdkrFRvaXJ3efwAU3zbYy61C4rvxiMtY3Uwi1EfcejsADfPJ2DO9BhtXLyYGJzcKK5/s/MESVMM9SOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(83380400001)(2616005)(26005)(38100700002)(41300700001)(36756003)(5660300002)(6486002)(2906002)(7416002)(86362001)(31696002)(478600001)(53546011)(8936002)(8676002)(4326008)(31686004)(66476007)(54906003)(316002)(66556008)(6916009)(6512007)(6506007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGhsTG9mREswWTFrQ2xvRXM0WG5GL1NNeTFySisySjZHV2RJcEJKVUdjSXZz?=
 =?utf-8?B?TnE5T0xHa0FLMkFXejVOU3BqbTUwRlhwUFVGcFhObVhXZ3BOVGZrN1drVmo0?=
 =?utf-8?B?VjFjV2NPaG9vL2pwTlI1KzRnYUZENFg5NU1GSkJDMndIckZ6VTV3Ri8vZHlh?=
 =?utf-8?B?MTZYZmRleFpoZk5sTHVldHc0OWl1YXdMcEZ2QkQvUnNVUjAzNzRFTXNhcUdI?=
 =?utf-8?B?cXJtcUY2Y1RyaStqMUNOUHk4QkkveUxnUXpWUk5uZjdDRWx4TEMydkVQRXhP?=
 =?utf-8?B?YkZLQXVJb3hrQkdrbUhIZ3R3enk0N3QrMzhaaGpITGNKVkdLclFTU2Fta1RE?=
 =?utf-8?B?MTBCOU9MYW43RFYyZUxBallNU2F2c0xlbVlFSHcvc0RjNzRtSGUwYVBwa1hB?=
 =?utf-8?B?ME1tbSsvcjllNmJHSjlIZlNoWlFLNXBWQnVTdUFCYXNROGwwK0V0MlE2cnI3?=
 =?utf-8?B?dWRsNlJLNXdOSEVDTHJmS29nTXlWSEc1MWwxRzh2TVZlQ2RGSnRER1BhbGFS?=
 =?utf-8?B?Y0NOemFTQy9yQmNONmVnTUQ4bUFGT1Fkb1JadEwrOHNBYU9FaGppaGRDc054?=
 =?utf-8?B?NmltRnJDRVI1dGMxOTk2RW54M1RRcEZvTmVVL3hjWVdaa250QjdBMG95SWox?=
 =?utf-8?B?YlhUK0N3a01KS1hzeVlEOUkvZExGQ1BqclJXZ0dHaEVzSmMyWnZaNENOTndu?=
 =?utf-8?B?ZWRJTGRsTFd6MnZHZmtJTzhuUUNFenB3VTczMGpJbk90RzlTQTJjMndQN3FB?=
 =?utf-8?B?eWVDT29TZFAwZkxGalNQRCtWVzdMM3hoQVRjZUtzTzlMR3R1ZlVmK0IxaXpM?=
 =?utf-8?B?d3Z4K1p0M3c1d0VHWm50ZCtDVzN1aHZ5Y01IZ0tpd3oydmxDUERUTHdSUHl4?=
 =?utf-8?B?Y3pMcnFwaFREZ3d1SFpWMzkva2hWaTNZaTJ3S2VNSEh3ZVhETXZTalBUcmVJ?=
 =?utf-8?B?eFpCempQT0dSWjYyMWdYRUt2UXkrRXRmTnNXNk53VzNva0djRjE1V0pmTFU4?=
 =?utf-8?B?Ujl0YkJxSUg3NXdvK3JFVUlXV29sQjQ5RGhzdlRtYU1kaGFPWlFGd1l6OFNN?=
 =?utf-8?B?bDc5d29RK1RRbTVRL252Rm5wdzZYRnRYMGxHYjVMbFNTQ1djanc0ajFrYzlV?=
 =?utf-8?B?WmpuaXUyY1pBUXk5ZlJLb2VmWU5Pc3cwVm1iaFYwZ3lqMFNGV2dtaTBIZlpt?=
 =?utf-8?B?OEtnajVHN3FsRU8rdjFUWjZPc2hxRURzcExCaDFKYWxiaXVON3FscjhmZG1i?=
 =?utf-8?B?NEhCZnBIM2M4c2JtaXluSWpoRlVBbzU3bnZUc1VkYXo5Q2NOaVhiSjlQMmhX?=
 =?utf-8?B?a2N4Z3pnL3c1ZXhza3FKQThHc3VlLzMxZCtpWWd2cXJIeEZYMGIvVWRNdWtp?=
 =?utf-8?B?SVl0aCtEbmtXNnQ4K3o1eEJCdEJpc28zRWFIU2ttNHBXQWkvWDRrYjJqcUdq?=
 =?utf-8?B?OUlqaURLcGtuVXEva2h6RTB3NzYxR1IyeHdtVndBUjFDaENlcjBidVZ3VnRT?=
 =?utf-8?B?UG8zdDlXQjdmN3BOOEdzSlNjRHAyajJWOVZ0YW80OFRwc1BqeHFxYmZrSFp1?=
 =?utf-8?B?QmF4bStuWFFTbFJKS3hycllyZGpDTU9zL2FkSVkrdksyek82QkVXa0UvRFJz?=
 =?utf-8?B?RTdRQy9sYmJHbU04WjB2Tk5OOWtiMkpXMS9Uak5hbXkvM1B5REVPTE1yV2Fx?=
 =?utf-8?B?UGViRXRPNDM1NUI1aktLQkcvTnNiaG9FZWxEYU1nTTVZaGhaeW43NVRsM2Zu?=
 =?utf-8?B?SklpMTcvamdvVXdxMzNwM1o2UGZpMklvdU1iam9Fd3lNNG4vYVorTmkwM3RS?=
 =?utf-8?B?YlM0cFh2bmNXK2F5WFVXdkRQbE5COUpNeDY0eHgrOEFDZ21Db3djVmxyTURu?=
 =?utf-8?B?TVJFQVpCaGJ0dVAxRkx6b1ZwZzMvbDZ0K2xVbjgxOXlVdGRjd1E3TzZPcHdP?=
 =?utf-8?B?dks3QnJGbisyb3pRdXZpMWJyU0ROMDc5WFZYMHJrdFZIUktRSFBWVEdneSt4?=
 =?utf-8?B?bXhId2ZTMVFkZ2IyWDl4RHp6VEhpYjBCeFc0bEJNN29UR25HaFkzMGxFVlNH?=
 =?utf-8?B?VW9Odmg3dzRtRWJjanMwSDJxT1hXTy8vSHQ0Y1F1d01POEVabzZvS0tKQllq?=
 =?utf-8?Q?WgBoGgYvzlHOEFwGMkhlqbWgQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ab8f44-0d76-433c-76bd-08dbd5f22dfa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:07:13.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOSQtYsPdsyJY1o2XEzEvj6N/jsLBs6V4QI1yL/NwYJRbGhY/NCR+chKjea8kA5GhoLoatPKhrHlsq4nnf+O/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8774

On 25.10.2023 23:12, Stefano Stabellini wrote:
> On Wed, 25 Oct 2023, Julien Grall wrote:
>> On 25/10/2023 17:01, Jan Beulich wrote:
>>> On 25.10.2023 17:58, Julien Grall wrote:
>>>> On 25/10/2023 09:18, Jan Beulich wrote:
>>>>> On 24.10.2023 21:59, Stefano Stabellini wrote:
>>>>>> If I understood correctly I am fine with that. To make sure we are all
>>>>>> on the same page, can you provide a couple of samples?
>>>>>
>>>>> Taking the earlier example, instead of DRIVERS_PASSTHROUGH_VTD_DMAR_H it
>>>>> would then be VTD_DMAR_H. arch/x86/pv/mm.h would use PV_MM_H, but then
>>>>> you can already see that a hypothetical arch/x86/mm.h would use
>>>>> X86_MM_H,
>>>>> thus colliding with what your proposal would also yield for
>>>>> arch/x86/include/asm/mm.h. So maybe private header guards should come
>>>>> with e.g. a trailing underscore? Or double underscores as component
>>>>> separators, where .../include/... use only single underscores? Or
>>>>> headers in arch/*/include/asm/ use ASM_<name>_H (i.e. not making the
>>>>> architecture explicit in the guard name, on the grounds that headers
>>>>> from multiple architectures shouldn't be included at the same time)?
>>>> Thanks for providing some details.  The proposal for private headers
>>>> make sense. For arch/.../include/asm/ headers, I would strongly prefer
>>>> if we use prefix them with ASM_*.
>>>>
>>>> As a side note, I am guessing for asm-generic, we would want to use
>>>> ASM_GENERIC_* for the guard prefix. Is that correct?
>>>
>>> That was an assumption I was working from, yes. Could also be just
>>> GENERIC_ afaic.
>>
>> Thanks for the confirmation. I am fine with either GENERIC_ or ASM_GENERIC_.
> 
> OK. So in summary:
> - arch/.../include/asm/ headers would use ASM_<filename>_H
> - private headers would use <dir>_<filename>_H
> - asm-generic headers would use ASM_GENERIC_<filename>_H
> 
> If that's agreed, we can move forward with the patch following this
> scheme.

FTAOD - just as long as <dir> is clarified to mean only the leaf-most
directory component (assuming we're still talking about the most
recently proposed scheme and we deem the risk of collisions low enough
there).

Jan

