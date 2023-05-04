Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF36F6DA8
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529794.824592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZth-0004CB-3A; Thu, 04 May 2023 14:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529794.824592; Thu, 04 May 2023 14:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZtg-00049j-W9; Thu, 04 May 2023 14:25:28 +0000
Received: by outflank-mailman (input) for mailman id 529794;
 Thu, 04 May 2023 14:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puZtf-00049d-8g
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:25:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe12::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82f98000-ea87-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:25:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7047.eurprd04.prod.outlook.com (2603:10a6:20b:11b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 14:25:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 14:25:23 +0000
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
X-Inumbo-ID: 82f98000-ea87-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ8YIXYlv0wodUpb+Y9Lgyyk7KE8iGNoQGSNl0WW+vtahVOm3MsWnLvXqd2hggPMrGtFZNRTJ0PnGdJ/ndaa2ujXQ0Xn4GyUhJ5NfHw/STsO/9IXWIB1+ew+mYtnBjvAD5NfgUMZWDWXonyRGAC6EUi0yJvtjpBoJTLWvaUUCsR0286N6nPkXUDg0FQ9jTpGKrKeQmbHP33Q4fqq7nYfFnembPyyvH0WdHUrVgpVoGRZkPDiTSXwXl6O91Ho5P05ZmOZJiLZ6DuK0pLwKEhIDjnz78bRSHYPUjtvJ+Yo3+3WSpBaOg5M0Y89xHGam2hq1w58gGZMZQs2JM9bgEsHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lum0Eiv6pzZwVF+AjweRCSSqsAI33STHmq0Lr4LkbTY=;
 b=jGcuJwZeJJCZufQkMDR1D9RqJThgglAiWg+Y7NdVlNBN+5oTfMFrmLK7KuxTSN1aEdB4xeZ8IwH/RoHBSGDYKd9LoPT7ssCEMQOoOui5+ANAg9nPOkuRu2Xhtti+a4r9mXdu6kKWLYgB+aAC1T06l1hAHTg+XWyrj7AMfWaQeUYv8Lxnvhq6bdthTAYHzpyWcqytxeQLKurnHviBqRCZnx/uN+b+c28lySRcXW8pa8yCYi/9rVq7+nl5LafVhvSNrXfDPsF6Wm4Q6ciHQO0Ms8vlDKbZCkBPC7GYYdhHq+fCyRKPN5Dy4x2vkk/I0/AKqjhyuGV1e6bK/5EYISwQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lum0Eiv6pzZwVF+AjweRCSSqsAI33STHmq0Lr4LkbTY=;
 b=EZ+hZG1ckR2suYHDG761VvlEbzK6IZ2cCmBeWSdSj8fZlVAGYOm1024JTIzLgpA9VCYO5fLRVnhB2bFKNP5iI8ALDSKkejrPrYRo0TLXoD2DuxeZO/liSA6yxt/zG3lrtJUgKLuVrPUDIRVGN78TO+NPXyBLGaB/5CyaqNGIoBZNCV1IHW/dtoEWNv2zkvCeI6Lwa/Y3vuD5o/rYI0xB52OIAhIvhbgQbWNw4Y5KCa25A1AcnInNIFTfE/3VzRogzYyukOl4SSFA/KgeKwSUTSUlUcUz7Rc5Kr6LrbpcuysL6M2A2dutjB5Vb3fNUKNr2tUKng6hWsx19FqSgqxIRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2195b6f-a1ca-9a99-78d2-f5138c855f98@suse.com>
Date: Thu, 4 May 2023 16:25:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
 <CABfawhn4CRnctzV-17di4eYyNhSGTSMckZjgphS1Rg6HUGOtHw@mail.gmail.com>
 <c5f2ee35-0f5e-da04-9a28-aba49d2aba29@suse.com>
 <CABfawhnt=465mank4ye==5zbczcSeLWDSKjMoc6bxGTLqPqX-w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnt=465mank4ye==5zbczcSeLWDSKjMoc6bxGTLqPqX-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 2baf880f-0b94-43db-d672-08db4cab6586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m/c/58ZPd/5D9phK4KI3OS3cZOyTbjFjEYjCO7sWipHrEz12wBDhFElol1VucmV/hzVe0IxdXtJDzqqiqOD0q/ZFLk4eLsJ3P+eHtPPoo1jm6mELFjtBZyyrwq3eHX27vDaMCh4hE2xJ1oGUhDiKYoajuIB4t+si8p7h6ynOBgXAw7bGGYJuD7YK2Dih2GYM5Dgf9sghwvYyVzENqyRtanzAwLmKwaiO2TcHHgV41MYydGKETPn33jm93/p6/5mIvb1nCzgsw5DiJkiYx/MZbT2s2L/Pawu9av6yHwK74qN5HW/vNWfhcV1UcTA1oPiO/2+O3qNGy4oMxDJsNaO4TMI1YG/Lyl4shtc3ZMjGoEX3JDMiEobX2LcXYU4Vl67zMseHvJPI/PzEklAoFq2ZKUt3k1MhljcyNLNaWu7OF3yAqfJuSOoTlOjXxtni4GeEpq4pxgk54Khd4pMea6towk+h1IpX0OjNT1mKkz4e/V4Fn2a4DUJQqL28FRoAymJj9l78ze/dRuZGCrxZkcn9y6Hkw1No1FtlEEbCVQFelB/GbXvDs6h7+5UrK+62Z1lfzk5dlVJ/TXq19D81YpUiSKI5FWSXhcBdpVtOxnhDku9asybngqE58dmkywz3b/WYjXC9wyynMzlLoB1+ghLkcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(5660300002)(478600001)(38100700002)(8676002)(8936002)(54906003)(2616005)(86362001)(6512007)(6506007)(26005)(31686004)(31696002)(66476007)(66556008)(66946007)(6916009)(83380400001)(6486002)(4326008)(316002)(53546011)(2906002)(186003)(41300700001)(66899021)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UllPWTZ0SjFiNGR6T0RqY0VRQVpRUVZsV1piQW9LclBYUjNrenFxcG81enFU?=
 =?utf-8?B?R1lROEE1NjJET2hEbEVib2xpaXJsQ3pQTGR1aFBEdWQ5OFI0TExnT3VZOW85?=
 =?utf-8?B?ZTVNK1dWTG52RksyemhkNWZmS0x6SndycWdVY24wRXpYaFg1RzJtbVlaRmhk?=
 =?utf-8?B?dGdrclpWODRuNW8wdnlBdGFMK3gwOXQ4eWdHenlmUGNIVnNPeXVDdEhYRGE0?=
 =?utf-8?B?cytZVUhRQXE5VzRxaGZkSXdYVUpxOUNUZkF3ay9MbUY2ZVpjdGsybWRvZEdt?=
 =?utf-8?B?Wlg2ZHZ4ZFNNWndDLzZYcGQrN0sxSm00M2JCcElLZ1J4ZzJIdVdiSTYxdFhl?=
 =?utf-8?B?NllYaVRLazIvcnByL2kxaGc0SHB2MFM4TU5CSzVOQ3N2M0pobW5hR2dvOWNV?=
 =?utf-8?B?UmtuZlZWWWt2c1I5eUp1VnJkN2xHelRubHRpUUgwdHk2TVc1VlMxQmM3akp5?=
 =?utf-8?B?eEt1S3BBb25LL0JNWGsyQ2FpTFdMWlNqMVJ2K2gwMTZ4NkU4bTZxMXYvNUYr?=
 =?utf-8?B?YkZQY29kMWoxMkp4S1gzVjQybkc2anRnVklnL1hZdlBqQ0EzMWxleit6R0Y2?=
 =?utf-8?B?aFgwQWFMK1UwNlVUQm5yUFFrdElRbHlWUUpONVpwaVIwN2N1Y3BRdHNJM1ps?=
 =?utf-8?B?aFErK01CVzBTSmtubkJMTnI1QlN5YlFVWlpSWWtUYStEREs0VG5SSkVjMjhW?=
 =?utf-8?B?SllWbmdWMXBGSmxBejNzUHN1eHhoY28zMmVxcWJrMEFFaWg0M3B5cklnM0th?=
 =?utf-8?B?b0pzR3dWK2pvanZaK3N6SUtjclQ5TnpQWUR5ZDI3bmZNdmVHc1AxL0FIa0dw?=
 =?utf-8?B?SHFWZHhGaTZjcmlCU2YwK0M4a0FUMlN0QlhDMUJtL1poT2hQekxiUllOWld6?=
 =?utf-8?B?eVBnZUVhQnA0b2d5MkpjZUxMNVBjeVNxNnB3VkJpU1VxeVRnVFIrWGpFWGhq?=
 =?utf-8?B?bm5BandtaXhuSGx4TXJPUCtRU3l2YWVrM1o2RmdJanVOeUhmaWVMejNHMlNY?=
 =?utf-8?B?akFURlhMSzFOV0pzNENUZXM5bXJhNnQ4bUNuOEtqcHRoSlZqY2tycmJTRzNa?=
 =?utf-8?B?YzlUUXNYSWZiQXBmK0c2eVd2dVVLS2ZNMHJxZ3F0RlNkTGJuTEJyWnB4ZXhW?=
 =?utf-8?B?YmpReDM5U1BCNG40YU5sVlhZUnhwUkoxZWlYZFZQOE1jZnhnZ2ZCNDBFTHcv?=
 =?utf-8?B?NUF1N01DTzlHUWpTN3VBWVlUODIvYjRiN0Nkcm5QVllmVjVEMElVc2tnRkZV?=
 =?utf-8?B?Y1IxYzc3Yk9nMTNBeGd1YkZjeG9rWk8wMUhvd01wbEdlWmV4TDNMbHVjc09a?=
 =?utf-8?B?Sm9rL1hoZ0MyU01FU0lvV0swUlNiZ0VTVEtjZXZOblE1OXl0V21YTWZjTWp2?=
 =?utf-8?B?dXkybVpockUxVDlrSEYxWFd4SklYWDhlLzBvTzhLYzNBejhENVdOVGZ0UXlR?=
 =?utf-8?B?TUhkRE9qU21iWEZJU01MZCtXYjVjd084M1JtT3c5MUJiVnl0VHJUenFqNVNl?=
 =?utf-8?B?MUt1T3pxMmxabThEOGI0a0JmTHBsRmgyNFNlLzNDZnNoZzU1NVNBVFRuWlpv?=
 =?utf-8?B?cUFGbUkzUDIvOU1YUHgyUDNmSnBpZll1THFYMDZXUW9BaDlyTE1aWWlzall0?=
 =?utf-8?B?dUtibkM5UGk2Ulc4TVZlU2xxc0lUWFQrTVVHeDZQZVhtRzN2ZEVnQkZ3NXBl?=
 =?utf-8?B?SGlNK3pCd0Mya3FsSWsxcXBkZEVuN2hpb2hGbG1mTmZaRGRoM0gwV3c1aGFZ?=
 =?utf-8?B?eGRxSCtJOGMzVEs4Y0JERC9OK1RhOE5MRHZVQnoxb2NzVWJYcXhnS1orTUNR?=
 =?utf-8?B?TC8vZjBBOHZkQ0VRWmhGWTZ0bTFXeFlEZmpQdXlvaEpyeUdVamVHZWIxejl5?=
 =?utf-8?B?ZnZuUkNQc3U0ZHE2UjlQQXM2ek9GRnVqWUtOTlZoc0lTZ3NwcTlBNkNzVldl?=
 =?utf-8?B?MEhCdXFPZDY0ME8wNGgyeVRHSjkyU0JPNGRuUnVXM3YwYmhtRmx2a3RGQ25I?=
 =?utf-8?B?Y2wrQzZqeXlKVFhaRlpqU1Q3QzBEbFhzcVUwOFU1M0wzMERkaDVlL2xXZXVa?=
 =?utf-8?B?WTBVS1ByN2Z3VXpNNzFhRFVUalUxNEdqaVVPQWdrU0JlRU1kNDV3SVJOSkJS?=
 =?utf-8?Q?z5PfSyF8P8hD9glyefyuiwk4+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2baf880f-0b94-43db-d672-08db4cab6586
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:25:23.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtYWAvI2n6kyyxkItwRCq49qfgTeYr8NLP7WTfw0oa3ZVnw/Ef8BonQp5lWW09qMIYHo9cL2xM+pazDbbSSW0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7047

On 04.05.2023 14:50, Tamas K Lengyel wrote:
> On Thu, May 4, 2023 at 3:44 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.05.2023 19:14, Tamas K Lengyel wrote:
>>>> @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
>>>>
>>>>   state:
>>>>      if ( reset_state )
>>>> +    {
>>>>          rc = copy_settings(d, pd);
>>>> +        /* TBD: What to do here with -ERESTART? */
>>>
>>> Ideally we could avoid hitting code-paths that are restartable during
> fork
>>> reset since it gets called from vm_event replies that have no concept of
>>> handling errors. If we start having errors like this we would just have
> to
>>> drop the vm_event reply optimization and issue a standalone fork reset
>>> hypercall every time which isn't a big deal, it's just slower.
>>
>> I'm afraid I don't follow: We are in the process of fork-reset here. How
>> would issuing "a standalone fork reset hypercall every time" make this
>> any different? The possible need for a continuation here comes from a
>> failed spin_trylock() in map_guest_area(). That won't change the next
>> time round.
> 
> Why not? Who is holding the lock and why wouldn't it ever relinquish it?

What state is the fork in at that point in time? We're talking about the
fork's hypercall deadlock mutex here, after all. Hence if we knew the
fork is paused (just like the parent is), then I don't think -ERESTART
can be coming back. (To be precise, both paths leading here are of
interest, yet the state the fork is in may be different in both cases.)

> If
> that's really true then there is a larger issue then just not being able to
> report the error back to the user on vm_event_resume path and we need to
> devise a way of being able to copy this from the parent bypassing this
> lock.

The issue isn't that the lock will never become available. But we can't
predict how many attempts it'll take.

But my earlier question went in a different direction anyway: You did
suggest to replace a fork-reset by "a standalone fork reset hypercall
every time". I somehow don't get the difference (but it looks like some
of your further reply down from here addresses that).

> The parent is paused and its state should not be changing while forks
> are active, so if the lock was turned into an rwlock of some sort so we can
> acquire the read-lock would perhaps be a possible way out of this.

Given the specific lock we're talking about here, an rwlock is out of
question, I think.

>> But perhaps I should say that till now I didn't even pay much attention
>> to the 2nd use of the function by vm_event_resume(); I was mainly
>> focused on the one from XENMEM_sharing_op_fork_reset, where no
>> continuation handling exists. Yet perhaps your comment is mainly
>> related to that use?
>>
>> I actually notice that the comment ahead of the function already has a
>> continuation related TODO, just that there thought is only of larger
>> memory footprint.
> 
> With XENMEM_sharing_op_fork_reset the caller actually receives the error
> code and can decide what to do next. With vm_event_resume there is no path
> currently to notify the agent of an error. We could generate another
> vm_event to send such an error, but the expectation with fork_reset is that
> it will always work because the parent is paused, so not having that path
> for an error to get back to the agent isn't a big deal.
> 
> Now, if it becomes the case that due to this locking we can get an error
> even while the parent is paused, that will render the vm_event_resume path
> unreliably so we would just switch to using XENMEM_sharing_op_fork_reset so
> that at least it can re-try in case of an issue. Of course, only if a
> reissue of the hypercall has any reasonable chance of succeeding.

(I think this is the explanation for the "standalone reset hypercall.)

Jan

