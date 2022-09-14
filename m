Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54E5B860B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 12:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406920.649334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYPP2-0007eT-5z; Wed, 14 Sep 2022 10:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406920.649334; Wed, 14 Sep 2022 10:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYPP2-0007cF-2T; Wed, 14 Sep 2022 10:13:56 +0000
Received: by outflank-mailman (input) for mailman id 406920;
 Wed, 14 Sep 2022 10:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYPP1-0007c9-3Q
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 10:13:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7b8b67-3415-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 12:13:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Wed, 14 Sep
 2022 10:13:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:13:51 +0000
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
X-Inumbo-ID: ef7b8b67-3415-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLFJJxH6iLNOhBfuiBf3GgjmJvt5qKD1cATBrNJ5YPaqmhbZXEPgT2QC980d5x51xMLUeelOEm8iW44Qk+48QgfcvQxACWNlL1fNBtr73jvSCD0UQqakwhq8U7l8BdRTNocrDZLcuuj05KPxmjlw97S5+uj9a212kKoX6WtatukZPJQE3C49PqqZSXeotmDbLyHw5gbRdD8XhKXlm3vFMMH49EPaRj1JCJUz/nXnpuwWc6/ACt3/5nlHF+hfycMub5dgS9H7gNRn3cSjdVTFlauVjpF8mujx6LUDMZAwvNAhH43GPdnPZWxqNy0RuWfsPXZYcuwItm7UC5XndWyVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHynH6+WXjduIMM1wGlno8nKFnn1GiKfGrZapeQUmzE=;
 b=NS9k5mzaMr1DHKpk2TSMfSTBbZE4x1IgmcuTMHMFunOhSIOZxRKGuXddXM2EaUhY4WixPRb0Pq87/75xoC+M/CpSS/zKHvzpvEc6yYu3s3k3Yb0oHofzeh1il91c5Ms2yisWOCuH5pxj7ROpF7SHw9SqShGxnlwvaeYCoYOsu0yyo9aQK+JC9cjPwXQWWzUQK8pkHVv9DZBSsGHHY+qW5l6jnZguNK4dhsYQV9pA00v25uoh07uGeBAO1UhQBkeCw95n6BNBW8UuZxSC5wzfy0Z7nMVu2DsMHDsArwoHQOWzCIDFlUVvrpdnrpkxo5JzyP7L9wDs5w6iYRIDEHCT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHynH6+WXjduIMM1wGlno8nKFnn1GiKfGrZapeQUmzE=;
 b=OrWcwHk9vEwzVoEXSV7nNZN62Y3ClatiI4GY9VIMuDsN+WE192fmlHwh7eJdSzqjLS2CiVPv/EFXt/1WjRyKuW4X1QX+iSgYfq4tD8YVUB8sTiyB3gsqyLByQOwh/wNaCHXrpdthL2HIhgRt1+1kKTitufLtp0W/mtbDKdL3uveVtukeyWtJUA/osDyfSygL13NqdsinwJZIA+9UjC5Dg73Ao7noVBY6EeiMaqX63SZPW6p6tEeyiRZ2vt5cDCDgU38uGcCV7aKJ+kLGYTDR1iGiFyivqmrXFjfbwaPq3RnfJS//NPy/YUkh6DIoksgIMYKO4aq6JD1CHbnP6IleQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d232013d-aa21-afe8-ae71-5580ff4d679d@suse.com>
Date: Wed, 14 Sep 2022 12:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
 <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
 <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
 <YyGbTIwaO+a2KVFW@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyGbTIwaO+a2KVFW@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 150b02fd-749f-4b44-8693-08da9639d263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CecQonKBZwmvrLz9SHhikLLakGLAK4diq4O9j2LeFzjkvHtmU/sw7ug6nrQB5/Do5ywWvuoE4wT96ZXRVIShOJFYfbh8J0TuZihZHzFTS0t9IVNHmRRmccAfe4UqIPY+VzKBcDfBP3LfkmAT2sr9F931YG9KABJ71pF8W/hWZhdJaVPvEdTSIUnOswXPGR3gz5biyiBbgySvqsLB4u6cvlbaGaZlhSO35JlNv2dssG0U3oiemwnxkadnQYB7op95Cez1ZDo2fWvTAi+EM4ZMz/7Tv2miQzm4RkEHfLMOeYCWSgnWhZwNTXgFUAbQiOOPVkhBcLd0GZ8lvWNjKFfMlLzRtMufS0y5z3lkPz3oV/tQd5clxmd39qtDRpUeS7ZLTFhvf39lk8Ji8onr1zvvXFTP7B6SOVYO1931XEt9uDU9U+YMGNG+SwJ8/KTzsfb01bL0CtAfALGCrDUDeWakKT81pjenV/31YQx8KTYhmaWcpXUeTpkrdu2ZM7FucB9sOCG2RFVyTdCcGWqxJGRE/17mNKZavxfutkJhpmatOsow9brfVUIce+dfd6PkSlWp6JPnfNiMssiK2skI7TjpTBFxJLzv8nhLd9rE1rZkQtY3t1rsA4SVMJM7VNOWCVBeFA7lwcSyZgr1m0Xm67uDWUDmdp8DesJF1cb8oHO05zwj9+eZx//scyCTF43yL4VTw9u0xEu6Cg5hS+pAGP5uueX4+c+rTGVQjsxIA97xEkHUny85rHKB/fSL4xI8qfNQsk5bHtxtFGmQcm92fwtc4+g4N01sx757E8wLgi9CBh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(36756003)(6506007)(6512007)(53546011)(186003)(2616005)(31696002)(38100700002)(86362001)(478600001)(6486002)(41300700001)(26005)(8936002)(5660300002)(8676002)(83380400001)(2906002)(66476007)(66946007)(6916009)(31686004)(54906003)(316002)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTQxS0M1MmcwbDBnbDNXaHMzc2lHalJHNTR1QUdpb0NKcXc1SWFlNy9sMzJ6?=
 =?utf-8?B?TDhnZC9MM3B5NGQ0aDJVN0Jod2ZkcmZadXowbXB1NzYvL01IK1o0dURtQmIr?=
 =?utf-8?B?QmhwMjFVSWRwZnRqZmUwdENybzkvNE9OT0JITWVvYTk0L3pWSGJQUVlKL3RH?=
 =?utf-8?B?RHpkdTdhVE9PN1ROSmRUZmp6RWdnTVBQcjFabFFTWFhnc0xJMlVpcDMxU01S?=
 =?utf-8?B?K3hvUnJsTHlGZzNoTVJJNlBNRkE4bkhhYWpzYzRZM1dNVTZpT3FvdVBqRHJw?=
 =?utf-8?B?TmpPQ2dEOUpubVpKQ2t5MjUzaFNEQlRTU3h5YktGU1VLZVZrS2t3TGVDZDIx?=
 =?utf-8?B?cWJXdTRRT25pTU9mQmN5aE8xVTVWWG1KcFhzRHdEclZYenR4cHJlQkJzREc5?=
 =?utf-8?B?SjNlaGI4R054NjhwRlI4TSttZGNBT0Q3allNeU9PUUgzQUdJZWREL1gyYStW?=
 =?utf-8?B?Nmo4UG9abkRCdUVzUHVYMVFGRFJ6UEt6azFXT3pPNnhod2kxdFg5ZzYreXhz?=
 =?utf-8?B?dXhacDRsNThNRlJLZzgrWHcwRkRicWdhTStCbEV3SmF4SmFmbTlWaCtGc1Fo?=
 =?utf-8?B?akkwZG90V1FBUUhUYk9pMFhLcldualFkWnREZkczS2VtdFUrVndkUkpiZ2tK?=
 =?utf-8?B?RW4rVXloVWdWUGN6OU5tQnEyVFF3RUJ2YVBRbmRtajJ6a0NBZTFmaGVXY3pv?=
 =?utf-8?B?TWZMQTk2VS81OG9HWHJ4WGZacHNCdmR0ejc2eTNWTjNOQlU0K2Nza2ZtUTZv?=
 =?utf-8?B?VU4wYVlzTXYwZXFtUndJWU5jaDZ4SDd0VFZBWTJ6R3MrZzBINUpleVluYUw1?=
 =?utf-8?B?UFJXc0FHRFU2NzJTK0pVMWtNZnY1Y25ZUjNlSWJxMWdDdmlRZlZ3bDFaYlRS?=
 =?utf-8?B?M3d4YzhnZTdtRm5mZnVnUkozSGg2NlpUcjFmbTUvYzVLTTVqSjY2ZElnWmoz?=
 =?utf-8?B?MFdNdm1ZU1VMWW9kNjhxU2h1alFhTkxNYlJvSlhTajhkL2pMQUFodXJIaFRu?=
 =?utf-8?B?aVd4aVNYWkt3RUZBZURLcGlESXJSTTFNajUvbTJaUHkzdjB2QWliRDZPUktN?=
 =?utf-8?B?Vm9lYlNCNUVIN0QxamxranBteXh4REtpS3BqNUZmcEkxdUFCOWl5YldaSFVv?=
 =?utf-8?B?YnFSZ1FIU21OSVRVY0xzWkZ3SDFPWWowNHBnNmFvNHIrVk84amNydW5iKytv?=
 =?utf-8?B?MkpTV1NqMUlJR0VJTk9ZMjVwbGhWTW1TOHc5aENHSUplMHRuVkRSVmxsdEtX?=
 =?utf-8?B?RXdTWk9KSFRzeTZBVjMwUDBQaHF6YTV5M3lMbERncmZvUVhDcmQ5dmZ5eFRt?=
 =?utf-8?B?MVpTSzZIRWF2aXpIbE9Od3MySytFZmpaTFNPV2NJUkxGd1JxM0dueTJqN3d3?=
 =?utf-8?B?d2ZBbWRtOUNET3UxTjJsQldVRDBBL0JUcXowbDlJYnJnT3ZRaXY0QnNpd3VO?=
 =?utf-8?B?dU1ER3RCYzUrL1NkQWN3VXdSbGZJMDVXZG0yRW9pWXVvYWhXem5JOEZNdnRU?=
 =?utf-8?B?a2VLVWtQY21wQmprSlEzNkhONDdKSGVmY2lUZktQVUtPek9jK1RQSUZYLytO?=
 =?utf-8?B?TTJqQkVSdmEwWm5kVmRIWmdLand6L0tsU2dXMW1WdlN2V1N6WVByUlhVZnZ5?=
 =?utf-8?B?RXBTanA3dXhzRlRKUzg1SHMySzdrSTBZc1AwbW5zRU1vZkdmQjNvUnJLN25v?=
 =?utf-8?B?Rkc4eERUc1pvNzgzRDZsNjgvSmQzbWRrZlEyTGhUL3l0M0QxSEo3VklRNUhv?=
 =?utf-8?B?T0IvL3p5Tk1JZEh3NXZhWnMvVFJvV1VBcitYWG5iNjZvVUFHZ1BSU2J6MXYz?=
 =?utf-8?B?S296VzRPeUxVM0dCVHBvczNzcURZWEFwVEs3eDVKeFhudVFuZ1QvWWlFNFNa?=
 =?utf-8?B?QXYrd2pDWE1nUmR4enNrcW50SWVUUExveklib0pMN0NtaTMvczVhSDE3ZUVy?=
 =?utf-8?B?blZ3cWlyT2xpQlhpY3pyUWs3clhOR1hoY041aWl5UURNK09zT1Z1MVlJSXZH?=
 =?utf-8?B?QVVmcFhIVVExOGJJS1hJRXVsMzJTZDlRTVV4R3Y0alZVTFBYUlF5WjM0cXpa?=
 =?utf-8?B?TTZndmVILzEydzErWHRhcnJoYkcva0c1eklBRUFlUnRYbE82YU5zYlNNM2Vz?=
 =?utf-8?Q?HARcEuE6HUUeGxNMSfj+HtgcV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150b02fd-749f-4b44-8693-08da9639d263
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:13:51.7761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CO4FuHXlV+thfHw8aVK2sEVs0GKyIXrQoe4bvcytWMTr2EMgG8i0qAFPebXaUYB750I7a62gn42phqLMj/7fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596

On 14.09.2022 11:13, Roger Pau Monné wrote:
> On Wed, Sep 14, 2022 at 10:31:34AM +0200, Jan Beulich wrote:
>> On 14.09.2022 10:14, Jan Beulich wrote:
>>> On 13.09.2022 16:50, Roger Pau Monné wrote:
>>>> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
>>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>>>> the consistency check in check_lock() for the p2m lock. To do so in
>>>>> spurious_interrupt() requires adding reentrancy protection / handling
>>>>> there.
>>>>
>>>> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
>>>> trigger when trying to acquire the p2m lock from spurious_interrupt()
>>>> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
>>>> percpu_write_lock().
>>>
>>> s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),
> 
> do_IRQ() does call irq_enter(), and that's the caller of
> spurious_interrupt() AFAICT.

Hmm, you're right. I was mislead by smp_call_function_interrupt()
explicitly using irq_{enter,exit}(). I guess that should have been
removed in b57458c1d02b ("x86: All vectored interrupts go through
do_IRQ()"). I guess I need to either open-code the variant of in_irq()
I'd need, or (perhaps better for overall state) explicitly irq_exit()
before the check and irq_enter() after the call. Thoughts?

>>> but yes - we could nest inside a lower priority interrupt. I'll make
>>> local_irq_enable() depend on !in_irq().
>>
>> Upon further thought I guess more precautions are necessary: We might
>> have interrupted code holding the P2M lock already, and we might also
>> have interrupted code holding another MM lock precluding acquiring of
>> the P2M lock. All of this probably plays into Andrew's concerns, yet
>> still I don't view it as a viable route to omit the stack dump for HVM
>> domains, and in particular for PVH Dom0. Sadly I can't think of any
>> better approach ...
> 
> Yes, I also had those concerns.  The mm locks are recursive, but
> spurious_interrupt() hitting in the middle of code already holding any
> mm lock is likely to end up triggering the mm lock order checker.

Guarding against this is possible, while ...

> One (likely very risky option ATM) is to introduce a per pCPU flag
> that when set will turn all mm locks into noops, and use it here in
> order to avoid any locking issues.  This could introduce two issues at
> least: first one is how resilient page walking routines are against
> page tables changing under their feet.  The second one is that any
> page table walker p2m helper should avoid doing modifications to the
> p2m, so no P2M_ALLOC or P2M_UNSHARE flags could be used.

... personally I view this as too risky.

Jan

