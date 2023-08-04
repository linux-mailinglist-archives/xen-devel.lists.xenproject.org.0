Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935DF76FB8F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 10:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576957.903681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpjY-0006Mv-59; Fri, 04 Aug 2023 08:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576957.903681; Fri, 04 Aug 2023 08:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpjY-0006LN-1Q; Fri, 04 Aug 2023 08:00:28 +0000
Received: by outflank-mailman (input) for mailman id 576957;
 Fri, 04 Aug 2023 08:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRpjV-0006IU-VB
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 08:00:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6ec0d1d-329c-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 10:00:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9768.eurprd04.prod.outlook.com (2603:10a6:102:381::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 07:59:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 07:59:54 +0000
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
X-Inumbo-ID: f6ec0d1d-329c-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRap6Gi6gERzyP80a0wc6QLEd9hnZyuEFCKlrh3AA9X0GO3u8gE0qLIZS9SrVKjQN86qno5kcv9XVE6+tbR2EEKjvQzDlm5G6CrL4iAbKQV/ZPpWmblfqIFmw0PB6A+AiTNUSR72+3/Iru19P78JVOMIKboIB+ieiGfNjwfRdKFUmiQpSgmyNVltOYuY9NVEqVw+OKVdSUu6LnKT5OV0456ckUGCpFCQdCyf6lA/gOytNddP4PKaUN+tig+pxKJEcXIjU5JY2OTcJqFQAKMBXu1n3dp4Du/PMDts3rZQa58/mvK2kbdZX+A9K6uIgVBqt9CmRDqsE+RJINQ9KGxHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg6HVn7meBYbQ4DOJLd/KhIV5BbPWOw/1QsnOWVKGoU=;
 b=XrCfjDvehkn22Q3t4sUVSmdVUrfT56oQxdZVQYhr944ODwhrH4rZqhmAaQe33UICE0zRoB41F11RiZCbVvOVdzHX3kIJnUe9l2LBKE7xW8PAH4CjP8Gl81lHnbwD4azV56yQRaWDrG1TgLFqfEIddjt3CmbtdPNzB0cUPNobrGFzgCUmegvr7th2P7Ae8qW/bOJGfnxPwExAoXnnxFqkhlhVQhE3AeaQQm/BrYRAhA8eYaWrQmegtH98oofutl1bHp4Q24lp3psT+UuRGu2vcF3QZH7pFOJvWwHvhNqirZUJ4KevJoXYC4EPKvNZrvoJ3tRTcA0937L2rh1i3yrNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jg6HVn7meBYbQ4DOJLd/KhIV5BbPWOw/1QsnOWVKGoU=;
 b=sJ87tt4tP+eTV33rl4usYCpSJas0TxMCXNmj24FMVD7jCEm+OwpvbFWPv3uVOQOStHDMbskvIv02brmzRqka5WD7jTsu554YuNmqbg+LIwsa31NJioghVEz/3sbfnC52kJtOrg2wBroHvgrLys9IJj6lTlyFNAy5AI0KvRuGWh9O+RGd/tnK8zxRbbq0m4j199E4oGF5Yv5MnN5dHfdEU5Yd1uEZfBdDFfx+cpSFXiBoWv4fzpl/AbVyoXvFlubDBe6Ofl63yFZ97CxULt+VBcbwhIUiH33Ls+D/VK98pFEvwDIyV9oe7ilElNIqfgeGvJCa+PPS0EenHjAXh3xNjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82f93d14-fd6e-417c-a970-645fd0719d3a@suse.com>
Date: Fri, 4 Aug 2023 09:59:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
 <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com>
 <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org>
 <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
 <1e2d06ab-ad3a-4e5a-ac78-d20bad28bb20@xen.org>
 <alpine.DEB.2.22.394.2308031226010.2127516@ubuntu-linux-20-04-desktop>
 <49fc793e-d0a3-7d9b-b501-d7a72dd9c736@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <49fc793e-d0a3-7d9b-b501-d7a72dd9c736@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be34a50-2115-4396-c794-08db94c0c9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xLBp3p0bQ7ulutZi9SrFEwRNTECXAbjlcnEvFuXr5XQzP0T/gBq5rJr/ae9Ut5eP5Y58yart1FugV4iUY0g5hwTDUKXoFrHxgaaX99salRqNdLR+uREBADheEThXOMbHZKlzj2RSNSJ5THmVDsxWLsuQwQ3SxeDic45GBYplv58ePFu2qcStHCmnqLefa3CDhToAA5QoKZaeuMDp0hrS9jHvkxvmH44SE+DBDQ6v/ZNW9DVcmyl6I5p9nsjGr8Ov7NU/W9PRGtcaHHhx7zj66EGEhHYVYYfQjcFHHj8O1LkoWZaF0JIoBOdOF8xF8NglDgNAVr+XuG3jkAagjlDPEqNBrjSQOyObGbK7AhLZOfm4Fuy2eVbnw/88jrjJHM2sYy5HWECgGuOo1rL3pWnxEEYQMZo8NEPjAY3y59xhmH/kl8r+tMEyg7O8oYcwNQrUw5a1TvT+X3iqNpaJpkANjb2f0G8R5/utvv6n3i8EfvdoliIjaV1wYq8i0VUdAMlmi2fL99+/PSAiUDc2Mulw7MOnmv6jk49EEG/5YdLI+8OISvntzUT2RJkmKTDbg6IR4KA1akVzQ3zTKg3JZ1Jh+jkYuKPtW4ju1f7wyrlr3H5mabjOgAM4PNzwJsPpzhvxTZdJ8sJrPkXypDC/qG5h6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(1800799003)(186006)(41300700001)(8936002)(8676002)(83380400001)(53546011)(26005)(6506007)(38100700002)(2616005)(31696002)(86362001)(316002)(110136005)(478600001)(6486002)(6512007)(54906003)(66556008)(66476007)(36756003)(4326008)(6666004)(31686004)(2906002)(5660300002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW1hM0dkOTNSWmNxZWp1dFBGYmM1TFhPblk2UWFERk12Mmd3L3RMaGk5TEVM?=
 =?utf-8?B?Y1lLdzRJSGxwQXdGSTVlRjFPOE1hN2FYZTZDNzUxTDM1RWpmeDNpaFRybytS?=
 =?utf-8?B?ZlhHc1NmbTdmZDBPUGNQakJwR3dacUc2L0xuU3IrN1VDV3hrSXlmMHlubWhD?=
 =?utf-8?B?UURDd29mSkFzaXZTUHdDejBKRTU5WE1uTHdZT1lEMG0vRkdHQlorakdKTHoy?=
 =?utf-8?B?SXIzTDNwUzhJM21iTVJXeHFpdHJ1cURycGxCL20wM3k0emtWcTdMNGlQSkNE?=
 =?utf-8?B?M2tMcVdtYURURTNjZXZqQTdGKzJEVmJuWGVOTm1sMXg5MmxHdlE3S3JlUjU3?=
 =?utf-8?B?TFh1Q2ttaDBsRldaRWd0dW4wQmh4S0V2b3A1eDExeTdzcG5qNkZpaUU1dzlz?=
 =?utf-8?B?MWkyL0RjNmdRQ0EzUVlmaFR1OGFFYWdPNk5hcFR3VGlPeS9oeXNOcjZ1YVBO?=
 =?utf-8?B?Tk9nYTFNaFIxM3lzKzBwV0RQZ1Zob2JrazBFai93d2VtK0VYbTlmK2lhMys2?=
 =?utf-8?B?eWVibm9zcCt2K1RZVmZNZFZZaFdtYjROMlpGb2VFNmlTZElVVHkreHp2amVU?=
 =?utf-8?B?K3hiaCs4SmFFNWp6MGw2dmVRR2hqNGZYNy9qb0xpZFJkQzdBWktkbmJBRm91?=
 =?utf-8?B?UWZIbGE3RGpYMDlZWWRTOG5QUW9WNm45ZEs2YXp0NFp1SnVPMlNFczZQQnE0?=
 =?utf-8?B?T05wWVVyeCszVFZiRDFHR1BLVlFINGZIc1dtdGdjZnB1OGNLUlNDQ1p6TWtK?=
 =?utf-8?B?dExETzdDY2VWd05Iak9DZVdXWSt1TGlxMWJHbGFqYzlQVmJxMlJNZ1c2YVpE?=
 =?utf-8?B?b2FKYkFVTms1c0RjSm9XSFdCYlVMVERYcC90dmdLcldyWXV1ZkZLRGEyLzBl?=
 =?utf-8?B?SEQ4RU5JdEtVRk5COXRiV28zQTY3elVQVDc4ajdrYW5mUEhyK0dDcnNMWitn?=
 =?utf-8?B?dE9KZ1FUSk5zMkJaKzIya0VqSHFMcTVvOTdFbUZQbEtMMmFEZ3lnanZJMlRG?=
 =?utf-8?B?T3JqU0pmR2VZYUhsNzdNRWU2bExTQnlTRCt2NEsvMnIyV0VZV29nVDg1VXBL?=
 =?utf-8?B?N2VQRGxYUDhjL2lSRTRxZkhRZmpYcHcrSlExUmRKMWJydUdnWjBJWldzMzJR?=
 =?utf-8?B?bEtwTzIrMkFIUHRCa3dLVGFpRTR5alBWMzhRYVA2MWpSZEw1ZjFYcjZaS3Fu?=
 =?utf-8?B?cjF3NkJUMlB6cFJkdzBXZ2UwUFJEaFU4Sm8rdnhIRm1mNkRtT2twcEYyczBX?=
 =?utf-8?B?ZjkzdWozc1hDRGRmSTNSY2R4MnNnVGdFaUU1SDc2RTVBMnhKY2hYRGxjNTFo?=
 =?utf-8?B?REI5aDRpRUEyRnBOajh4Si9pVlhjVTZ0OHdNTmJtVjBKWWxlQWVsZ0hLZDFv?=
 =?utf-8?B?WVpBNGdlVUVIaU1LTFpOK3ZETXNmY3F4dElFeFREME9kNkVlR25vNVhBLzJV?=
 =?utf-8?B?Y2NsWkIxVHFiT0RVdDN4L3F4eHZQWkhqVTBnOGVvZDh6eEVBMWF2UVBFQ0NV?=
 =?utf-8?B?WXpacXphNSs3WGQyZG5qUnVVZDRvckJ0OTNhWEt2cS9EeWtxT2pyY1p6NmdL?=
 =?utf-8?B?cFlTeFZyLzVHcThMQ0czWDRkTm51Slk5ZUVjTGRQaS90Z1BjbVUvZEY5cXpq?=
 =?utf-8?B?UUh5cGRsTDBxdVppaHNVZ0tXRHRsZnArU2hDcVRTV2hpcW1CS25QUmdMYzFs?=
 =?utf-8?B?Qmw3UmlDSzJwc2ZUU2c5RVVxL09VSW9taE8vRWd6MFRqVmJuRitzanVyZFdV?=
 =?utf-8?B?OGh4bFYzNDl6OWs4VkJHdC93Z0ZUaW1UV3c0NGs2dzQwcVYzdm9RN0dUOC80?=
 =?utf-8?B?YWRsZWJnRmRSSGpvWlA2cmFKRkY0dDdjZWxCNmRXaGcva0QrV0c1cTZNT0JQ?=
 =?utf-8?B?Nzk5bkRYV2pGM3hYVk5HMDFtNHhtRHFNckgvc3JnUlk1RzdhV0hLNExvczZH?=
 =?utf-8?B?SVhjT2ZzdDZKSmEvOTd4Zkg4TlE2eUU2bEVsY3FlQ1ArbElQemlSMzM4SkxL?=
 =?utf-8?B?aTN2WGNSL2hsaTAwYjJ4azU0M1VYK3VrVHcxb1dNNWZBdGtRT2VyUEhXQ2Z6?=
 =?utf-8?B?VmN5K3h1WjdOUk4rUVBzOGZoWjRkbnlQaXNPYjJsalliUUNRSldEWDc3NEFs?=
 =?utf-8?Q?kkCAzujaofr7PBb+H9eT3LISJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be34a50-2115-4396-c794-08db94c0c9b8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:59:54.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dcx6I8v/KEeMTPhXkejnw2gynvGfataK2ebnvgrYhSrUMf676EUR9GQmIzfDcBWdsbH5C/wwV4BEsujr3QmxCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9768

On 04.08.2023 09:55, Federico Serafini wrote:
> On 03/08/23 21:26, Stefano Stabellini wrote:
>> On Thu, 3 Aug 2023, Julien Grall wrote:
>>> On 03/08/2023 12:52, Luca Fancellu wrote:
>>>>> On 3 Aug 2023, at 12:46, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> On 03/08/2023 11:28, Luca Fancellu wrote:
>>>>>>> On 3 Aug 2023, at 09:26, Federico Serafini
>>>>>>> <federico.serafini@bugseng.com> wrote:
>>>>>>>
>>>>>>> Add missing parameter names to address violation of MISRA C:2012
>>>>>>> rule 8.2 ("Function types shall be in prototype form with named
>>>>>>> parameters").
>>>>>>>
>>>>>>> No functional changes.
>>>>>>>
>>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>>    - memset() adjusted.
>>>>>>> ---
>>>>>>> xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
>>>>>>> 1 file changed, 21 insertions(+), 21 deletions(-)
>>>>>>>
>>>>>>> +void *memset(void *s, int c, size_t count);
>>>>>>> +void *memcpy(void *dest, const void *src, size_t count);
>>>>>> There is a comment in arch/arm/rm32/lib/memcpy.S with this:
>>>>>> /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
>>>>>>> +void *memmove(void *dest, const void *src, size_t count);
>>>>>> There is a comment in arch/arm/rm32/lib/memmove.S with this:
>>>>>>    * Prototype: void *memmove(void *dest, const void *src, size_t n);
>>>>>>> +int memcmp(const void *cs, const void *ct, size_t count);
>>>>>>> +void *memchr(const void *s, int c, size_t n);
>>>>>>> +void *memchr_inv(const void *s, int c, size_t n);
>>>>>> @Stefano: would it make sense to remove it as part of this patch or
>>>>>> maybe not?
>>>>>
>>>>> They are a verbatim copy of the Linux code. So I would rather no touch it.
>>>>
>>>> Oh I see! Thank you for pointing that out, then I’m wondering if it’s there
>>>> a reason why we
>>>> are using ‘count’ instead of ’n’ as third parameter name, I know Stefano
>>>> suggested that, so
>>>> It’s just a curiosity. Maybe it’s for clarity?
>>>
>>> I guess because the generic implementation of memset (see xen/lib/memset.c) is
>>> using 'count' rather than 'n'.
>>
>> Yep
>>
>>
>>> Given what Andrew said, I would say we should rename the parameter to 'n'.
>>
>> Yes, either way works. I was only trying to be consistent with
>> xen/lib/memset.c. It is also fine to change xen/lib/memset.c instead.
> 
> If you want to be consistent compared to the C99 Standard,
> then other parameter names need to be changed, for example all the `cs`
> and `ct` should become `s1` and `s2`, respectively.
> The same goes for `dest` and `src`.
> If you agree, I can propose a v3 that takes care of that.

Personally I'd prefer if we could limit code churn. Functions that need
touching anyway can certainly be brought in line with names the standard
uses (albeit I don't see a strong need for this). But function which
won't otherwise be touched could easily be left alone.

Jan

