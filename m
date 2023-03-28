Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6BC6CC116
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515848.799113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9U9-0006Ds-I4; Tue, 28 Mar 2023 13:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515848.799113; Tue, 28 Mar 2023 13:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9U9-0006BE-Ee; Tue, 28 Mar 2023 13:35:37 +0000
Received: by outflank-mailman (input) for mailman id 515848;
 Tue, 28 Mar 2023 13:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9U7-0006B8-7N
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:35:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ae960b-cd6d-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:35:32 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB7074.eurprd04.prod.outlook.com (2603:10a6:208:196::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Tue, 28 Mar
 2023 13:35:31 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:35:31 +0000
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
X-Inumbo-ID: 69ae960b-cd6d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnY1UUJx3cmNB69DF/Z2njbH1TRFlqy4/ovVeVKgkjsoi/ofGCfvKvTIISORsf3db9WTl+NOhu6CCz7QmTPINXvQB49uzd6NLgepGcfZsKxXfBPWQVtckZ81EK4URx6RtzW0HouwnOmZC2okOfPiDBT8dekTSzVIEhBdEpEAH8rwJzQQyi2vWvK6AXoNvsHE0jOaeMrMDLbupN7e8sdqzbNUqxL5pG3Z7VgS1ShnX5zOfxnYw3hyT0azLIiq1JcNNJgH41W3mWQMEDHOmDWt+p1HSpTwikBVCzF6nV2Ie63gFlzhHqDB7DyAjJH2/r+r69EwqnDuqCina6/rBZfr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvhSuuHQXIffvgOGKvC6ChQtpU69/lQ5A3cB1jJ1rQA=;
 b=TPTlHo6PD8PJYgrAomhAjwYURcyx1YlOrDTa3oZrZ7VrApWtCt+A7hLluBpmr9G1/hEij1ka50/VnUYZScWZ+xEXSE7VkUh24s+Iy6XEUEe24SbOUYk6foSNRmCAePI60m2iodNssmOnAa7ayp9dSMzmI7r9wGE8dB9Vuxjf+61838IBzzM737oyT3BBv04b7yYVp312635+fm7q1p8AdAHh5jzm6zigb6Orr4W/fNb6jjqUKCJQG0F/wYmmXPdTH2lbgueLjz6yd91FvSKVrws7PuyE5/5mu2uU/aVc7MfRCOW93qM0PlZOGS8DZ/26wdE+IPIFKnOftGDNGf4gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvhSuuHQXIffvgOGKvC6ChQtpU69/lQ5A3cB1jJ1rQA=;
 b=UX/b9khWFKLjACqagdrikzoHjeuxZbYuJ4tsK57KWZ1D9G/XESwPAKCp8r1J5PJjGjO8VXQG+QA7HglZ2gAyYfksUAVfs3TDkIr3sviTNidUH5Uz4drz9dfmMnEkXq2qdPHtw6q2g1ZPrcfdSve+4veq4c0K9jAC4FYjpI2x0/k+mRWYaC8bF1/Je8q3tW3/0ZcY4mVYPbepvbLhIi+R7JMCW6m0U0L9gBGWsPX2dFQ4TyPpykqlxg3ayKyO8k2PpGlJ37Be1mLA9VB2siC7tnTBl9P/xnaSAKBIJTw4LnGK7OoatWmfrfldwoz/lrz0c8GZWxI4ISfHiDrGnEqtRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d4c11c3-31f1-48bc-b7b6-0ad0b73fc09c@suse.com>
Date: Tue, 28 Mar 2023 15:35:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com> <ZCLl3ePLgrmFTViV@mail-itl>
 <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
 <ZCLrX2TmYlg2kMxL@Air-de-Roger>
 <CAKf6xptXovH5-OwuuJ4cNz4JxG-mw3mcwRBJf4PuTwjBA12fSA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptXovH5-OwuuJ4cNz4JxG-mw3mcwRBJf4PuTwjBA12fSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM0PR04MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afec9a6-811d-4aa4-1293-08db2f914d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrswTEMOZeJXpjEXSYatJ/fIV86WAEx8hSy2oWtgdvGCdB/SuJiYW53PXsAqEsGJLHdXuKQrMBCSIodYpileudBNIhPQFmfvPqOKW95pA4vywUO+mOsENpk5DTZ5WlW7kaqNUu/or+t7vwEG1LW5dzTDTiiKtj362btCWYQX7W5tH+pSolbeO6+dLcyZ3LdZtsuR6QqXzPRmDxIbhfMdNnzN61x6Hy2fzaSg4qYups2lsd9seRJf/ngwtIkuPprYqGtwbV3P9gU+CsIBTBjwwGwSCHPoCZfoxo8zImpc35zBLEvoT0ga95hEmOOGzyMh7nRzgNDGDuTa8w8KDZAdH3OyRJpWghP3mjcDFYdM7ozoPOHmAB8hPZwWRFb4rYwufV78szAndqcLiw1+kd0YsBIs1ApN4N4KyhIuVPJz+BjMLGdfJfEXkN/9sF1QRInSeV9UYrtFr9uHsD3k0zHmYBCqQOPrMqFsRVAr5GszC60czjHTZEclrBgIcbiXCIYwwy/vl2hlHaCcHatR4wuAWUxF3GiB9dyMRMe1dfcKjqblZWlTmA2Ho11plJO3IS/qXCD7XNR4CXjgZbSxy+UEdKvNfSpbwWU42JS8p2kG37Epl7VQ2ugZkHjjtXcZGGgMBfF3MLLaXnuI9YhmcI9EFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(66574015)(2616005)(83380400001)(2906002)(8676002)(6916009)(66556008)(66946007)(4326008)(66476007)(6512007)(478600001)(966005)(54906003)(53546011)(316002)(26005)(186003)(6506007)(36756003)(86362001)(41300700001)(31696002)(8936002)(6486002)(38100700002)(5660300002)(66899021)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDF4TEE5RVRvTXRTaytYWjBuTUZ4SUtlUXd3NjNqbHJ0K3g4VWR4Y2lqZjE4?=
 =?utf-8?B?OGpsSzJ4R3ptZm0yNENPMWkrNlI4MGRqM1EzeXRIT1lna29UVTE4WUpmQTh1?=
 =?utf-8?B?WWVMWDQ3NzFibWIrbkhqSVZjY2FkczFieENvTEoxTjRjMm5icGp3endEekVs?=
 =?utf-8?B?MFo5SU8vNG04a2ovc0JSL2NzZmZDcTJGUU1wazMwMTdPNXNyTkcyd1BsSTBx?=
 =?utf-8?B?bS92Z3pEVEdSKzhFalVoUWgxZDdWMU54a0VNQUxaQVp6NHhmcCtOUGVTbDNK?=
 =?utf-8?B?cTJENTY2YjdaWE1laDZLL1h4UkpaOGhQbXl4aVRRSlpjaDhVOW5zSHZ3WFV3?=
 =?utf-8?B?cDQzcTlBOWtoRENudXR4eXlSNDluUlg0VUt2UHRDMkVCTUJ6Vy91bmpFbkEw?=
 =?utf-8?B?RlM5K0RIMkFtVG12VUJWQURPaE5YWnRXZFRRK0o2d2JNbG1FYzJLREdDaUdr?=
 =?utf-8?B?U3FsMzNEM3k3MUlqdWY1RENuYXh0NlIzTUdBQ2NraUVRL2tSWTEydWY1Q0oz?=
 =?utf-8?B?OHVJZ2ZrMlRNNWZZdVRsc0pmdFV6aXZLclVNVXluc09SekdFWnkyaEFxekU0?=
 =?utf-8?B?aTJrQk1LZTZVRkhaMDB4QXM3cEdXQm9NRWQvVDRJQlVpR2RIb1Q3SnM2UURE?=
 =?utf-8?B?YzlxZGwwRklKZlNDSlEzK0h4bnpkOW1MMS81Yk9qeTZUaHVOajh2d0ovTllk?=
 =?utf-8?B?bEhVeXoyc04vcGtqVDFobVl5V2kveHIrK0hSWFNGdFBCRloxUjdLREUwVWl2?=
 =?utf-8?B?YXhGWGxPaTZlRXN6ZVlyTDFnQ2gvQzRhUlJidTQ1ZlBuMmQyMjgvS1lyT1ZE?=
 =?utf-8?B?NkNUQjNMNGZsUjNJY1pvKzhHL2M5QWV6S2NUWWtnRGh0c1V1YVc4QklFMUdG?=
 =?utf-8?B?R0kvMXBocHNGbUxoZjVtKytiQUpjNVBoalQyaThkaWhhTkN4UFFMRnUvb1M5?=
 =?utf-8?B?SFFJemdXd1pURzJLejVVY0JPb0lGeHFjdEVoNDZlTjhBaGU4eExGano0Ri9l?=
 =?utf-8?B?VWV2TitMdWFnYmlaTmdRWjZnbjZLc1Y3bmp4ZGp6aExYYmVsTFZsYlJRaUJK?=
 =?utf-8?B?MzBBcWQ0ZVpCR2krQThyT2xKK0NwQlh0Z1dkcWt0UjU4ZlBMcUhFT2FKTk5U?=
 =?utf-8?B?RFB3czB5QnAyM0l0MFdlbHQ0djdNNWZwemhxcldQcE5nRXE2eE5QdUxnQlB2?=
 =?utf-8?B?NUYxeVNxK2RKQmFSdHlKMFhjbDJpSHFTaUxKYjdoY001V0VIaEhDWDdqZTVG?=
 =?utf-8?B?N3NwSS9INkQyMjgxbERjQm95dWtwYytCbGErSkh0YTFHdlE2b2toRExZZlVs?=
 =?utf-8?B?Z2RnZ04zemFvKzV0TXNSOHM2RFhNVFE2UlJ6cFdieFNwWE9sakJTM1VITHU5?=
 =?utf-8?B?U0RjWUtwclFZSFh4cHI0VTRWMlk0YnFEK0JMd3RteVc0Qit6WnRqL04xN0g2?=
 =?utf-8?B?Ykg3L2VvVUdWVWtZaFh3UWlxczdRaDNZSVRFSU5mUWFEWkdJNmZsUFhkdjZN?=
 =?utf-8?B?aWFUTzhjeVBCWHp5TDJOUHlDUTBQQTJabHhZQzNSRmFzUjZlaE1mT1IrUVQy?=
 =?utf-8?B?QWhKZjR1RnVIemVsWS9NZkdyUEYrNE5VamNTQXNWSjNOcTNnQzR6OGtUYVdU?=
 =?utf-8?B?ZDAvUXhDTmp5SjJOOVFudC9OR0ZPcXpTdStFendNNWwyeWRkSU16bGhBUnND?=
 =?utf-8?B?K2FSOUUxajdLandxTDRYTnBocDh0NGw1eVp2UHVWUDZrL2k1ZEF6eXVYK1V2?=
 =?utf-8?B?U28yOHlUVUhvalhTemRscTN1L3MxMTI5MU80L3R6SkluUzRlL0tIYUUzWFF2?=
 =?utf-8?B?ejNlUHZISnUxZERTRjZVNGM4ZG5FNTZVK1pmZXQwakhCb0syZEdOWlJKd1Zz?=
 =?utf-8?B?ckhpWUhhQThKbmxINDJEM1k1NzhZaHNhQ3U3SFdEcm8wcW1GN1dFaGtMZkJE?=
 =?utf-8?B?ZUdwNTRyWWZhRGhkNndocVJ4SVFaUGc5SU9wMk1wektKYWN1V29kNEpWNUtk?=
 =?utf-8?B?RWJXNHF1NmRGd3E5K0RjbXZKZDREQXhjb2p3VXBybkY4eTllYUxmQXhudThV?=
 =?utf-8?B?dmdIUXBrSGtwTXRIUUNPK0RoWWZsbzVudFlPRzVwS0FKdG5mWkw4elpMMSsv?=
 =?utf-8?Q?VGmPNh3997dKe2ZAIGiGwuQ7m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afec9a6-811d-4aa4-1293-08db2f914d05
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:35:31.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW2Fc/pSrcAV3G73HaaQkke8vIYBPJZHEaPt/M0y/2YW7r6mFesEkCHxv49gOhkk9eVA9eCS4D/Ts8ReaDzMOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7074

On 28.03.2023 15:32, Jason Andryuk wrote:
> On Tue, Mar 28, 2023 at 9:28 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
>>> On 28.03.2023 15:04, Marek Marczykowski-Górecki wrote:
>>>> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
>>>>> On 25.03.2023 03:49, Marek Marczykowski-Górecki wrote:
>>>>>> Some firmware/devices are found to not reset MSI-X properly, leaving
>>>>>> MASKALL set. Xen relies on initial state being both disabled.
>>>>>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
>>>>>> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
>>>>>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
>>>>>
>>>>> But pci_reset_msix_state() comes into play only when assigning a device
>>>>> to a DomU. If the tool stack doing a reset doesn't properly clear the
>>>>> bit, how would it be cleared the next time round (i.e. after the guest
>>>>> stopped and then possibly was started again)? It feels like the issue
>>>>> wants dealing with elsewhere, possibly in the tool stack.
>>>>
>>>> I may be misremembering some details, but AFAIR Xen intercepts
>>>> toolstack's (or more generally: accesses from dom0) attempt to clean
>>>> this up and once it enters an inconsistent state (or rather: starts with
>>>> such at the start of the day), there was no way to clean it up.
>>>
>>> Iirc Roger and you already discussed that there needs to be an
>>> indication of device reset having happened, so that Xen can resync
>>> from this "behind its back" operation. That would look to be the
>>> point/place where such inconsistencies should be eliminated.
>>
>> I think that was a different conversation with Huang Rui related to
>> the AMD GPU work, see:
>>
>> https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/
>>
>> I understood the problem Marek was trying to solve was that some
>> devices where initialized with the MASKALL bit set (likely by the
>> firmware?) and that prevented Xen from using them.  But now seeing the
>> further replies on this patch I'm unsure whether that's the case.
> 
> In my case, Xen's setting of MASKALL persists through a warm reboot,

And does this get in the way of Dom0 using the device? (Before a DomU
gets to use it, things should be properly reset anyway.)

Jan

> so Xen sees it set when booting.  On a cold boot, MASKALL is not set.
> 
> Regards,
> Jason


