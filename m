Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160642B64E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 08:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207874.363823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXMK-00087x-VW; Wed, 13 Oct 2021 06:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207874.363823; Wed, 13 Oct 2021 06:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXMK-00085V-S7; Wed, 13 Oct 2021 06:03:24 +0000
Received: by outflank-mailman (input) for mailman id 207874;
 Wed, 13 Oct 2021 06:03:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maXMJ-00085P-64
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 06:03:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8969714-e079-4361-ab7c-1bd9c387001b;
 Wed, 13 Oct 2021 06:03:22 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-lh6TXUGeNJ-h6LtxJU51eQ-1; Wed, 13 Oct 2021 08:03:19 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7827.eurprd04.prod.outlook.com (2603:10a6:20b:247::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 06:03:18 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::79a1:1c43:93d3:d136]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::79a1:1c43:93d3:d136%6]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 06:03:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0045.eurprd05.prod.outlook.com (2603:10a6:20b:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 06:03:17 +0000
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
X-Inumbo-ID: c8969714-e079-4361-ab7c-1bd9c387001b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634105000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u4pG7VayPm+u5jMzBACF1Bm/9rJgUS4ItFuoNWrmdhY=;
	b=Dc7SLlYz22Oi4ZhKuZZa8n4GTa/tniU5bimT3mqhIXtgdHu7YrW1Sb+SSFitJcMn3XBZnl
	+YgtxyYdyvKPmeh1dhBROoVuKfKpho6HkDDxT4OvchzLQYbKqTwFt4UtHzZ+LzLaY3L/7w
	/k6euBwXQo4p+f+8Kz28tx4s3V5U9uU=
X-MC-Unique: lh6TXUGeNJ-h6LtxJU51eQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExC+72lwj2KESJRAySfbV6fFmrVEJRSHGcs1ig/BSkzjUIr2CsA28jTogXdEpcwCMu5A5GMslWMNTcBRu2foar7fbUtlzoXCNRZW84BYh3w+8CSC6/v47zeRKgqR9tiDwEiBcindflpqL1ZGnDk7kOzBd+Jy4f64L5+zkGR+IGNgwcVLmVurcOa7A/jPerwoJtgXygTg51eVJEd0KX41NXtP+QaEfzKK2DNZiGNgGoTFwItFl+nfDnCyy9E4/TNRadcyGU7nF/0Jehvea8+SG6yZ1QvaCpFRnmX5GEpXNiT5Kf2E5RvRwRPb0cDGXGNZgAVj4ARWUC6RB7Or42tUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4pG7VayPm+u5jMzBACF1Bm/9rJgUS4ItFuoNWrmdhY=;
 b=Z08FmuNkp7deKuUwnsfeQAcQaHwXQgXwjiQ3zzaV28BIhGlAqyQtZDKazATfDMq2k1lvuSE7Wu7R58hgGDrAdjXuyFodvHpz0D8ARobfmwgYW2J6hF7znY0eYejVA63VHWgopT1x2N+I3J6xaPFcu00390FXS0Oq3GbjmAwW13iDoQLMACDWUALTmCdmJuDZvvbQIHgpl57nbKxdpMzqLtsfefnGaWshG0x/FPYtuWe5ZQBygDwsZxucoQNbB3EgOVslhwBS0nLmbVDTY6MO88U/rBS0hErgFZx4rck05QabCLk+2Yr0RPBRXvQy2YglsS2koJIGIX9K2gxvUEXcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH xen 2/2] xen: update system time immediately when
 VCPUOP_register_vcpu_info
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com, xen-devel@lists.xenproject.org
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-3-dongli.zhang@oracle.com>
 <317163fa-f736-ccfe-40d4-b918ce2834f9@suse.com>
 <3e16648f-088d-5f62-03d7-ca744e913cbb@oracle.com>
 <8b31045b-dbb0-3ca1-074e-a12107b09159@suse.com>
 <b9599319-0bbf-94b9-2a0a-405cd9a225a6@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <228730b4-cb49-25b2-0c87-7943f2f5a6de@suse.com>
Date: Wed, 13 Oct 2021 08:03:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b9599319-0bbf-94b9-2a0a-405cd9a225a6@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::22) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2689f4fc-053a-44a0-c2ee-08d98e0f2706
X-MS-TrafficTypeDiagnostic: AM8PR04MB7827:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB78270D0FECDE0D6BBC12E238B3B79@AM8PR04MB7827.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OdoeIYOfO9xzQ676cwiCz2owdMKABs+0rC4pVxC/F3MeyuM2sPjbS4B727rPLEdnv9uzQzvDzbdIhBMnPDeiPpmKEMWRzJgzbn/6HNP/M5styDv9e3PVmggoqS1obun/t2T+OTqnQ6N7Q+ZUXT8EyNmn5mia2KS+Dygo/BIFRr7k/t4HgbMhYkc22IeRvsD+k8IWCwAyHR05MpT0CsmFz8LcjjqaC+QfTbSbgBzza9SQCnnkgI6wRSQ9aPvnNCBuLRNXlIx/vJ1Litq3xKCOFuATyH4egQyCV+XoaZExG2qEBvWxP2Avs6bm2xcyOyQN3rJ/vW1xsvuAcx3MXD4m/I8uzWMbxTIJDK6r58v41rZ2bhartxqaQGLSJ1Vs0q4AR6A5oT6HhHYvn3SpGfqTZ58UeLqXjyYSjyPA9IStIlqnBbAM3oA+6CRWVYLVckNsHUKYZSliSEK5wBMPCakNEQldhpdqUEXJmJ+ffmixHyhJPOCMEbWoCSpKe/uvlLwfaZmHUk/tsAQkYLt04ZVK4dKOtswvoCN5YDXxtw5K3DgVt1rScswNM/rh9lDihJGXVlQ0q5Ch+pKnhs08i4/E+qXaZ9V2B4dVLD8GH8LLfhRJM/teMyvDa4X3p0cPDjChqStImbq6JsvVR52typyuyhJIlRbb0ZSHYkXdzi5M1Z5FIf4uoJZsZ+HH9nFFi+uLdeRUEJwqWvaMK1Yp0gR6Rt7Tkqz75jy4P9IS4j0R/SKi1SgnXbjxcnCZ1SIvh0YqtvnurYfNYB5zyiGBno7EVBTEecsPyJUpamNHgWcDxY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(36756003)(38100700002)(5660300002)(66556008)(6916009)(66476007)(66946007)(86362001)(316002)(31696002)(508600001)(2906002)(4326008)(2616005)(53546011)(16576012)(186003)(6486002)(956004)(83380400001)(8936002)(15650500001)(26005)(8676002)(14773001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkVnNUVyQnZrdzJjejJ6WHVjM0tpWENwdExERXY5VE1BWDFIYjhMby9aenF2?=
 =?utf-8?B?SmlsMTRFaEpETjkxaFJncnkzY2tyNVNOZCtHRVR5Zk9FbzVualNFMnYwREpm?=
 =?utf-8?B?OEhRR1IxNWN5YzZJemQ4cllxS0l1cy9qTERERVNxQlZySzhvUEVUTWlnM2wr?=
 =?utf-8?B?M2w1N1JKM3hhRkRXNUFtZVRmZDRyTGpSSHkvc0FWeFBRMmh4QngrYUJMMDQ4?=
 =?utf-8?B?NWhrR21CbEZnalZqYnhFdk1nUWZXSCt4dEg5VHZ4d2JrMzE2ampBS0pTMWFC?=
 =?utf-8?B?RG4zeFNncW9mR2I1NXduNnJXNGkxSzlOMGsxVlprNVYxV2xoWnBSdnhRTjZu?=
 =?utf-8?B?bUFocW5mTkN6ZXJDcEYzV01veHh0VVZEUlh5WnROTzVmMnhEY2prMGE2Wndy?=
 =?utf-8?B?U2FlV1QxYUthT2xlTUE0S1VvUjhFd2dWUncwa0dJUDdMQkNmTmxYK05wTlpW?=
 =?utf-8?B?UVA1VnhZQ1ZnYnFzQ0NqYkx4RVBWY3dxMlJWRWNQN2g2bjYrdnRqcWRrTHpq?=
 =?utf-8?B?V3dENmY0SjdVbFloWTA0UTIrTE9kT2hUNkkxaWh4bHI5QkVvc1kwMlFjSE1S?=
 =?utf-8?B?RVd2ZnE5WG5sUVlpWE5YNmdYcUxhK2R0TWVLQjUyYXBkV3hvVEY2WmhoS0R0?=
 =?utf-8?B?TzZqUW5QMDFSMWwzMG9lNDU4b242eHRYSHVXdWdrVDR6SEZVZDVpWkFkN2RM?=
 =?utf-8?B?WTlSaHhVZzVxYk5kZlBWTDNTVXBjY0FrZDVja0Z3MnlpbWw0VlVtWXB5aWZz?=
 =?utf-8?B?UVN4cUdKVVlTZU95Wlg3ZGZPamN0VWNzM1loTXNGVVBFdjFNVGFsU0l1aUE0?=
 =?utf-8?B?LytLOU5XZmxnYWxoMU9Vd2tYSjhQNjBHNmROaEd5VTBzbzAyZjBhMTE3NEsr?=
 =?utf-8?B?QTdGb21VUTZMaEhiS25YL1pnWnFlMWZRbzVJRllrSGtTeVJpSjVaRDBLU3Rn?=
 =?utf-8?B?MDRnWHRtcUhiODFGUWxEdXEwQlVyWTBGeFZyTDB3Mk43aFJsQTd2TUZNMHBJ?=
 =?utf-8?B?elNZYTR3dXlaY0dxdUtGWFRUSEVrWVp2c1hWeXoyeVRLWjJkYW9QamdvWC9o?=
 =?utf-8?B?aVd6cGJXVmxXUWNKY1Jlc2dUWC9SMzdEZlZUU2ZERGd5Z0tNa21zMjFWL3N2?=
 =?utf-8?B?UDRzWWcxRVFHZ1NOOGVoSkJwZG1LTm4xZXdnN1hJK001QW5NREVyNkNXeDk1?=
 =?utf-8?B?d2J4WG9JT04wVGZFNzljc1ZkajJMK2hKVjZ4NVgwU3VhZjJGY0Naa053WHpS?=
 =?utf-8?B?SllLNXlwT0srdkpyM3hneFRXZE5YeTZsMTY0dmxNeWZ3NW9UVzl1N29lWjNM?=
 =?utf-8?B?eGlrUW50Y1dWSW1sMW9CT01OR3E1di93UFkxNWNkS2NBWkhFSUJ0cDVqU0h4?=
 =?utf-8?B?T1dXM0tWVHhlWHR5dngvSnQ5MWRMbW5zVTNKWWc3aGg0Uk9Md3JLa29BOXZG?=
 =?utf-8?B?a3RKSmhFVkc2SndRUnBwNXh2cnJJK0tIblkrRU03OTgrSHlIYUMwZm5JbE5K?=
 =?utf-8?B?WnliaElaMGkvMm1zY2lyY3BrM3d4ODRncWpCVmtuWlh0RldEWjI0S1YwVFpu?=
 =?utf-8?B?YkhhQ2JaZWgxL2tOMkY4QU5jOXpGR3RqSHBUbDhac3ZTTTVvTFRsYnEybEpP?=
 =?utf-8?B?b05UNHROYSt5SThUdytBNlR1akEvS0IvK3k0TEJUSGdkS3VmR2wzRzgrbWtj?=
 =?utf-8?B?MXl0and4UnZGVldnOGdRekNZSllCaWNaZlRkSFpZZ1QrVHB0SExmZklXZFdo?=
 =?utf-8?Q?xJfG8KkD9wHtsbYT8dUwjokHS1V70UOu8WyJsRy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2689f4fc-053a-44a0-c2ee-08d98e0f2706
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 06:03:18.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF3zEkQzMRxpAC1T7qHo6ZGI60ktxZfskNynzE0f42FFDhM+7m+Fb/WNlS86+gvoQIFVO0t7YCFgytlS9ZP0RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7827

On 12.10.2021 18:15, Dongli Zhang wrote:
> Hi Jan,
> 
> On 10/12/21 8:49 AM, Jan Beulich wrote:
>> On 12.10.2021 17:43, Dongli Zhang wrote:
>>> Hi Jan,
>>>
>>> On 10/12/21 1:40 AM, Jan Beulich wrote:
>>>> On 12.10.2021 09:24, Dongli Zhang wrote:
>>>>> The guest may access the pv vcpu_time_info immediately after
>>>>> VCPUOP_register_vcpu_info. This is to borrow the idea of
>>>>> VCPUOP_register_vcpu_time_memory_area, where the
>>>>> force_update_vcpu_system_time() is called immediately when the new memory
>>>>> area is registered.
>>>>>
>>>>> Otherwise, we may observe clock drift at the VM side if the VM accesses
>>>>> the clocksource immediately after VCPUOP_register_vcpu_info().
>>>>>
>>>>> Cc: Joe Jin <joe.jin@oracle.com>
>>>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>>>
>>>> While I agree with the change in principle, ...
>>>>
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -1695,6 +1695,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>          rc = map_vcpu_info(v, info.mfn, info.offset);
>>>>>          domain_unlock(d);
>>>>>  
>>>>> +        force_update_vcpu_system_time(v);
>>>>
>>>> ... I'm afraid you're breaking the Arm build here. Arm will first need
>>>> to gain this function.
>>>>
>>>
>>> Since I am not familiar with the Xen ARM, would you please let me your
>>> suggestion if I just leave ARM as TODO to the ARM developers to verify
>>> and implement force_update_vcpu_system_time()?
>>
>> I'd much prefer to avoid this. I don't think the function can be that
>> difficult to introduce. And I'm sure the Arm maintainers will apply
>> extra care during review if you point out that you weren't able to
>> actually test this.
>>
> 
> I do not see pvclock used by arm/arm64 in linux kernel for xen.
> 
> In addition, the implementation at xen hypervisor side is empty.
> 
> 348 /* VCPU PV clock. */
> 349 void update_vcpu_system_time(struct vcpu *v)
> 350 {
> 351     /* XXX update shared_info->wc_* */
> 352 }
> 
> I will add a wrapper for it.
> 
> The bad thing is I see riscv is supported by xen and we may need to add the
> function for riscv as well.

There's not really any code for RISC-V yet, so that'll be of concern to
those who are working on adding actual code later on. I'm actually
wondering about the status of that effort - after the initial bits were
added over 3 months ago, no further activity has been visible.

Jan


