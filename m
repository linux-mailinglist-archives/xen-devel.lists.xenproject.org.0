Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8245A6ECA88
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 12:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525286.816396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqthB-00085I-53; Mon, 24 Apr 2023 10:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525286.816396; Mon, 24 Apr 2023 10:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqthB-00083C-18; Mon, 24 Apr 2023 10:45:21 +0000
Received: by outflank-mailman (input) for mailman id 525286;
 Mon, 24 Apr 2023 10:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqth9-000835-Jk
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 10:45:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a647f71-e28d-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 12:45:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 10:45:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 10:45:16 +0000
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
X-Inumbo-ID: 1a647f71-e28d-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbOcbxh5pYT2gBuKKFol6E5fbwXQE4KLQKejHhYBDhA+tWDybCvBXeCIhGRmAakJx4DJzdKfcnXNYy1QUefFJYNIherrrM1PAu027ty/Wvphp1HNKUNHA1VNtFuBMKY+ptyg0xpM7hRl+TJr5maTDAGPGG6DcOt0UCqN/Ychep32qIOLZrKkIs3K5GR652mCuYt/MoInLpZfZiLaDkDwDTqtOyKMj7IIIlIRiojzwv6ak0rr5p0tofC9jN8eYjNY1+4/c7qarn7+tvvQ1S6+MREiASIqt96OXQo8UkDdy1C+tKIBZggwSYetraMwdFOYMaKwiA3+bA679y7vfGsfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/n9s3tD3SDmkTWBtMPmGUBXIMQOeezjCi9pYjmZXqk=;
 b=bLhTyt3zynj7sODffmaz/CcSWqZO280zkZXe/rupvWN7vpq/A9VKbNd59h1j32jeu8KbTHQLn2sM5x50/nM2yLW9eOLQTEN6bIMykG1DAAknsDgujLcIyuzprs+RQi0SWNqggQd5HMTBOLycDXtSGY2eZFDbhvv8firDv2koA+z2XUHdYQ00Pu3UmyEy6c12UNLYbyI2Un6nGsuAECRgmJ845aR6bIMLHjShea2GC4peryZSTwZrB4k1tJO5mqZmaMWQJa9034k40zgvMMd55DyIKgsSZZQOFPCRptGsioHZPJxPNfsD1Dhl2hFmJnkGNay9WkuY8AllCgLQfS5nrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/n9s3tD3SDmkTWBtMPmGUBXIMQOeezjCi9pYjmZXqk=;
 b=WrHD/RDG8qD3GOEROu7wf/K88Pu4Vhz0Y/p0xyWy3BGmNISkLpGwFFbl5IzBiWFL5eJaw4y/wI25nbg4z6QpK9GJT89teW79fGtdkgaAotd9cOmyu6xWXqGQm3nz3OWBe3rMWfcMc3G/QwJF8eFuHUYn/q/whWLCD7W80gZqjoWWUUaBGeknSjpioCKuN8f+7zLvZh+u+PMjCetz/PTCP+y+Jhp3qA6a254YrmnOjW04HWNUhGAiKGaNNBa5uf9/47euOdvusb2qKVTTmJvjHrZRWay6Kk1wXSS+oDjzsDptu2qjKUj6m4eC6TobRDXcb++lkzKkWWX7RBtIpeGaUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d157b1e2-cfc5-f7b7-9443-16d1db9a4311@suse.com>
Date: Mon, 24 Apr 2023 12:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
 <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
 <db3a9b3b-63db-89d1-5386-57eb7044b317@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db3a9b3b-63db-89d1-5386-57eb7044b317@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: a2286f2a-30ad-4ac1-dd59-08db44b0fdbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OR1v2+zlzU5CU8LKpVjL6FGBbNFEzb1grtyFgx01QPNyy4/QgKeVfLElPvccMJjrQVuFnpehL/+AEf/toSnXna0dwopdkO43ZcF+IJnq9TE21+miu1oebczkM02YvFNZjMkq+g/HsiLjKbOqsz9831VhvpUzbZmww0bdH8WjT0uSF+BC3p98HBI9FifT5da0bGPcwNHvyBlT94w8/J8Ijs3yZqfA3YoKOYpzDae4+bBV/POuNtmmkPiP22PQIfdmGwQg8w1Z+Jd5GwxPHpxF7Is7b05nDZGr2QQ9noH5jdjOlfdMwGHwmX3VZIKlikNNzDgAx5nSHRJgu7b0Q1VMog5Mi0vG8zsSnP7762JVcYQMKvdeXG/8WC/hs/RDUTaAYkblErjw98Leza8hE7wg12sZxCn4bkJiyd8JK5HZeP1c/WbrPPzL0Bwsc9bbo7nunZMTLlM/QfMVwxWYWweZwmeK+WjloKbhIXWJn1zr/ZtpnWLq4Y7TuaYQMEpvV+d3+nWnbOismj+Lb3NhgiJjr05I14dea5doqGW9KdU+W95FlqsdVQVjZ9hyP/tHmJ6mGn3ZvinWWK9fB31a29WF34nd02SLuAhMwHapuRBcl1uPo00/fD4wRz0MDmbwyeAgfUFUKbhUb89C4cTmWUx6Aw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(36756003)(54906003)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(31686004)(6506007)(6512007)(53546011)(31696002)(6486002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjExY3UwTUVJYnVmY0M4RnN0ZWwxSGtUSXZWREFmNy9GYXE2dXR6UXFPallM?=
 =?utf-8?B?ZEZqbU92K0ZQV2xuSTVEY0ZJNGlhUDZuMDAzTGFIMUdHV1ZPcjBWWUVsZ1Z4?=
 =?utf-8?B?cjkybHgxVnFZWWJBRjVDUVY0cWxpT3laUDl3T0ZaU29MN05EWDFINlpiTDVk?=
 =?utf-8?B?cjI4bGM1UTZaMkgxdGRJSHRZY0RrTXp2c3ZTU0Zka1lnZWtkLzlCZ1hvYVFx?=
 =?utf-8?B?M0c2cGRQTHR3QkJZT3lZelVRMVhBZEFGZk54bjRjSVpHN1ZzMkVaNU83bHNE?=
 =?utf-8?B?N2puajZUVTFCeXhHbmtqRFo5eitZaWVXcFdKcmViVjZGVEFBZkdzekx1a0xT?=
 =?utf-8?B?YzFRc0VHdHJsT0dsWHhLeUdxeGNhSVkyVk1iNUsvdmNMbFVpcjVvN1V1ZG4z?=
 =?utf-8?B?TGJuN2pjNVduL1c0VE5zZEh2ampBVkVRZVpqM21UVG9ydUNIeWl6ZTVEay9O?=
 =?utf-8?B?RThyUVBpdmN5RDVyR09QR1FoZjVLNGozQlZKb0lRRTNUajgrNjN4dHFleVlm?=
 =?utf-8?B?N3lQdnhJRDRWQ3k3ZlJKbEVCODQyWkpsY2tNQk4zR05TSUxmbCtNdzdqeTB6?=
 =?utf-8?B?OVE1QXZPSDhrVkh0bTV3RFpRZG1OUTk4MWxTVmFlRGk2dlpRTFE0VzlhOUxU?=
 =?utf-8?B?RkdYZ09kVzZ5NGZzNHJUTFV1UVlzdFd2R2FZcytOVEVQTzcvUkV6UTNpcjZq?=
 =?utf-8?B?SHFVREU2Rk56dUt4VGZlNmFUMUtkNU9nWXNTNFJZcUVCaDEzZmJTODkvd29U?=
 =?utf-8?B?U0pOUUF6cjJIUGhuNytyOW92enptZW8vRTBwYm5DMSs3VENWeitiQkZ5RCtU?=
 =?utf-8?B?Yzh0MzQ4MUFHWDM1WWVEOTlLS2ZYeDZtYWxqdjh6UUVQa3J5dU1pV0ltRE5N?=
 =?utf-8?B?N0VzZTRCSlg0ZkNNVmJsNUliVmJXZFJWdjN4UXRVaDBuZ1A2TFN5a0Vha0p0?=
 =?utf-8?B?WDQ2dGN0ampYSGluKzJnekZiaDJEcDJuYUd4bGVEWFc4bXhwTTB2STR1WUMw?=
 =?utf-8?B?OVBrWEFEVTZ5ajVXVEhhRlFKd1BrN1h0TVFBcXRkQnczM2dsekppRUFFMjkr?=
 =?utf-8?B?Nko0cGZCaEtLZ2JFQU1tUUQzMHRyUVlnczg0UG9TekFZRmdWUHFGV0ExTUVL?=
 =?utf-8?B?K1hXbUl4a1FFSndmeHU3TXhWakdFdmxQakZ4VXp0bzUvVU5tOVJDMUl4am1m?=
 =?utf-8?B?ekdWOUhDYnU2VFpSRmpobkhUaFFMSkRNY3hJdnI2Z2FUc1QvLzgvUkNCVWor?=
 =?utf-8?B?STdmNWRWMGkwS1QrbHVvVzNBRzRXMGRDTmk4ZFhGM1BJLzkzMXQ5VnN0TWJH?=
 =?utf-8?B?dHZRTnJUMU9WTm81a0xTWVJsY2JkUW1PWU1ybHIwclFPNlpjR2dQd3d3NzI4?=
 =?utf-8?B?bGM0U0c2bzZPVmQxNXZ4MmR6S3VaQTJETUg2Wk1MOXpOaForNmtOZ2hFKzdt?=
 =?utf-8?B?end0cUZJaDlNL2hlOUdQdE9wc2lCUGM4TGlJVzBFOHlCbm5LWkcwSWZSYTRZ?=
 =?utf-8?B?T1pwUy96R296aG1BaFMzWUx6UW5aN04rTzZQdmNoZmw5WW5xYXlDRFF6T0lS?=
 =?utf-8?B?dEJ5VU1UK1pNMDdZVTVtYjM5czdNZXlGL2ZLaEIzbTZuSkpQbnRvSjJvOThD?=
 =?utf-8?B?L2ZTVXlwb3lYSy8xQ3B6MWJsUnJkd3BTejY5bndtT1JsbWFDZjFOWCtkTDcx?=
 =?utf-8?B?NzNEVUtoalM4eEViblhiTWpTZEdTLzNJZU9pTHFXUDcwY0RVMUhkUjdLNTlP?=
 =?utf-8?B?TnozbGNOWUFxUEJpZ3d6NS9xaEtRQVJCUXFjeEl2KzJpb0xnSHNVZktRQ0wz?=
 =?utf-8?B?eHVPSFcyZFEvMlI4UDNFUWFnalJNVElyODc1OTFoU2xvYjBWaVVKOXFpMVhW?=
 =?utf-8?B?eFF3NTRzYUlGallYQ2pNUXBUcUw5aTdoSzd2ZUllY3ZVZFZCaUdpQXloTWJl?=
 =?utf-8?B?SFRFYnBlbXFUS082TFZlRDNlcm84eDRtalA3TU15UUlSaGlaMHZ1YkhBZldR?=
 =?utf-8?B?a3NJckE3UkF3VmtQakJvRGVKamlTczBHNEx2SkVJRTN6UWdMRjJGcDhlVEp3?=
 =?utf-8?B?bG02RGZiZU5zUnhoMTBwWS81MWlZbWw0WWppa0owTnJkc1M1U0RDQU81ZVQ1?=
 =?utf-8?Q?Fw0MNB5IkcrpIaHu/Ud8cc7ky?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2286f2a-30ad-4ac1-dd59-08db44b0fdbc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 10:45:16.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qhs4nibFkaC9hd6nf9LX0zv9Kls5BvG6dRvWl1XMUEN3+isFRaCJF96QD4MCMLeENh/B2KcRUek9a52uZjgQ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

On 24.04.2023 12:22, Julien Grall wrote:
> Hi,
> 
> On 24/04/2023 10:33, Jan Beulich wrote:
>> On 21.04.2023 16:41, Oleksii wrote:
>>> On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
>>>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>>>> + *
>>>>> ===================================================================
>>>>> =========
>>>>> + *    Start addr    |   End addr        |  Size  | VM area
>>>>> description
>>>>> + *
>>>>> ===================================================================
>>>>> =========
>>>>> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
>>>>> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
>>>>> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap
>>>>
>>>> These are all L2 slot 511 aiui, which may be worth mentioning
>>>> especially since
>>>> the top bits don't match the top bits further down in the table
>>>> (because of the
>>>> aliasing).
>>>
>>> Than I'll add one more column where I'll put slot number
>>>
>>>>
>>>>> + *     .................. unused ..................
>>>>
>>>> This is covering slot 510, which again may be worth mentioning.
>>>>
>>>>> + * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2
>>>>> slot: 200-509)
>>>>> + * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2
>>>>> slot: 196-197)
>>>>
>>>> 1Gb is, if I'm not mistaken, a single L2 slot.
>>> Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
>>> included. I'll update the table.
>>>
>>>>
>>>> Also assuming a 32-byte struct page_info (I don't think you'll get
>>>> away with
>>>> less than that, when even Arm32 requires this much), there's a
>>>> mismatch
>>>> between direct map and frame table size: With 4k pages, the scaling
>>>> factor
>>>> would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here
>>>> to
>>>> cover for (slightly more than) the 331Gb of memory you mean to be
>>>> able to
>>>> map?
>>> For RV64 page_info size will be 56-byte and 32-byte for RV32 but you
>>> are right it should 3 Gb in that case what will be enough ( taking into
>>> account both available sizes of page_info structure ).
>>
>> As to the plan to it being 56 bytes (i.e. like on Arm): Arm forever has
>> had a 64-bit padding field at the end. My best guess is that the field
>> was introduced to have a 32-byte struct on Arm32. 
> 
> I can't exactly remember. But I would like to rework the struct 
> page_info on Arm64 because...
> 
> But then why
>> artificially increase the struct from 48 to 56 bytes on Arm64? And hence
>> why have the same oddity on RV64?
> 
> 
> ... with 56 bytes, some struct page_info may cross a cache boundary.

I guess that's going to be challenging, unless you mean to go further up
to 64 bytes?

> For 
> RISC-V, I would recommend to make sure the struct page_info will never 
> cross a cache boundary.

Since going up to 64 bytes is wasteful, and going down to 32 bytes likely
isn't going to be easy, sticking to 48 bytes for now would seem reasonable
to me.

Jan

