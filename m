Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB596CC6BA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515962.799383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBQK-0000ZS-Jj; Tue, 28 Mar 2023 15:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515962.799383; Tue, 28 Mar 2023 15:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBQK-0000Xk-Gp; Tue, 28 Mar 2023 15:39:48 +0000
Received: by outflank-mailman (input) for mailman id 515962;
 Tue, 28 Mar 2023 15:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phBQJ-0000XY-A9
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:39:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c38ed5c6-cd7e-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 17:39:45 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VE1PR04MB7309.eurprd04.prod.outlook.com (2603:10a6:800:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:39:43 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:39:43 +0000
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
X-Inumbo-ID: c38ed5c6-cd7e-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR0aGa7wPqGArllZSiThJCS8sHIdIPTBEm9Nj/NMYB0c/Ady5tEOkylL7G8Nlz28aNJepPuzc10G7Z6DCpbIHw0V5AifEFp5rMATd5cr7XydNQQFPAtp4/Cypgd6btKNm3XIb0ytNeF3bst1D/iuLgqFmnls86Z2lXsOQwCRJW2vADeVuIR8e95JaXDdsgnupuU+QlkHRFzt/m5R78x++RnqVIMxAbpj4thMSuJgmVI6NYWF6V5i4JDziflgKvoAlWMEC22NymOXuhFRykx8CUzvZFYe+dMA6AMXCJcDirFcu+NGYTKLWGXGDtItS4VTCK9dD8Ru48qA9R9m7eqMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/7DDeknrat4TsFHcxmfgsUOcXcBNhgyUmTnCQ460w4=;
 b=l+tAWVpj94zKo9TzkC4bXQxn7HiGujfRNh4BdI1OnX+uUe2ZauKCBCDu5UP5quVaIi5kJaZjQl5IBTN9gW7MY+IOI/06pbO3tuKmYibB2HOOiNBIWI32xJMdG79gMTkwL2WFapu7wUBfLvCqVBC2Oau5qHWBRLdeF9rNKChIokZAftMwhMZ//ifLnjWQ4lybPs9L5D/txlZt0K32v/MOIBgoc5DU7PME31zZlw5yxafeDKYqr9Zi24JNz6oXCbpttHZoeLlIy5iKTTphSLmxnD0xWRJIHTMAz14zjkjl2gqRTNOIK+cKZYu/vhqQy38ecwqSzJAYnEbkpYzifCVC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/7DDeknrat4TsFHcxmfgsUOcXcBNhgyUmTnCQ460w4=;
 b=4TkOC8ACvWMc6spHOnRkCywMzgFYEqVtXnyfDWrKpAazHEmCzY7Gnd3vOymrj1KtwkOOuS7T/qeptc9vsBy2IRdjoqhYx86T+XSw82ubO7WZE+JlNBtAnDdhQXRnVXE1K5APE6VeY8U/9xBpZBfz7b/Ia3QejgyPHNVjnf7K2RL8SEdNd75EjgKHZkcle1oHJ7XAIhCdxASnCBPAWw6c4thJAoaQpNF6P7d0E8OkINbgeAMfvem86sdorl7YCEHTNLRV+TT2Lk9avwTVYP3087cxVs58Qt632sniK0dLvO7nMY/4oQlCPNpiwWupwU8HGzDlWwNOhCTrgYypMVD/Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77dd812a-eb8a-c86b-a3e7-f87d03ece346@suse.com>
Date: Tue, 28 Mar 2023 17:39:41 +0200
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
 <6d4c11c3-31f1-48bc-b7b6-0ad0b73fc09c@suse.com>
 <CAKf6xptkHRcda5DPs4e2+7sgq8ck4-wKZhTHNC+43XWHZy_2TQ@mail.gmail.com>
 <dcba169e-9243-3e7c-f1fa-400af444f158@suse.com>
 <CAKf6xpu1DriHyknidr=o3YqWBQFEDjMndUYKpF1iW4BAhTmHNA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpu1DriHyknidr=o3YqWBQFEDjMndUYKpF1iW4BAhTmHNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VE1PR04MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5c1e0c-1b52-48bf-e1bf-08db2fa2a6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rVwqgFsZZLueCIkpXovNQXNTWlNvrkU9/LCh1hIxVwHiZ0MRqn4kOivTNN/cVL9PCEFnrNXAaSX6I5pwcV8FubV3G8nQyRRVzJhkgPgFS79tzaTSEmumnNhxFklwZ5vIS2F6bB6VgUE8TJLB7lFF88RIHOElDqyciTED+iRrT6jHjfOiBkEmc7+C+drczYSRXMwTxzmy4eH5Y1vJkLyz3r+ESf9Z1BZ0BcA2PfcckqK+6jSJyQFZLg0PNlGWzmat6sc189hOZU7LdEfqTByyyU7YwvIVz35sUP9kxpXbiR8Pq14NXirtWSq5jRJPR/Wjh1pWL815WFgeDiVK5xNbBg0dLHXCTuuoEdhVasUchRC+R0w/htIplgF0mpFySoMHTS8dFgPGM7LnvrLUQKWPsE0biXbGeZMxU9xg9VEyMyHTBw993k1fXfM37t1p9qsFsuEYBw/4Ht1Z6olbQbyHDoT6TEIizTrY72vGqiEAyX84JSpljBeQqtxYt8LOwFUUfUC7HpDWUNMv4Rk0QbhZXodDxARK3Eaw2CEjqzdx5TY6JR5tF4Z3EWeqUVHysvmokraRJw6Zlot8QVrb+LjuKjm9E2J3KYR4eP5/x7a/4QJPGDkbbViD11VgtOnO+t4sQwGvWY/QD7KGJh2OqbKU3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199021)(2906002)(38100700002)(478600001)(86362001)(31696002)(966005)(6486002)(54906003)(316002)(5660300002)(66556008)(8676002)(4326008)(66476007)(6916009)(66946007)(8936002)(186003)(36756003)(6506007)(53546011)(6512007)(66574015)(41300700001)(26005)(31686004)(83380400001)(2616005)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm9JZG8ySXFnMnJ0S3JHamJOZWJZM1lWNUJSNTYzVUs3Wi9jWEV3L0tldWUy?=
 =?utf-8?B?TmZsVDY1R0J6VlNHR2NKSTZFcXZ5NzkxT2ZLQWI0VVJSMUE4V3pGZTlxWjY4?=
 =?utf-8?B?MkZzOGFtQVlQeUxqSXZaMEpaZzFiT2x3UnRjeUtzeVV5dXdtQjVia1hHZWQ2?=
 =?utf-8?B?bWZOWHRidUg5ZHg2YWtjZ1hkd0Jzbi8zS21IMnA3SHB5bStaeFR3M1UyVVJw?=
 =?utf-8?B?UkJuR1A1V3JtbXhQb01uUjJVT2haS2RpK1RDbEVYR2RYTlFPOUY3eEM4ZlBj?=
 =?utf-8?B?WlZxTmx6QVNmZGJpenU2VlFUYm11U3BYVnNlUytsS1Exdk1INkZsSkFCckVs?=
 =?utf-8?B?eVJJck1sb3FtaWxneHJoS0pNMlprRVg5UnVvaTlZb3N3MnVnc3ExRFBHRDhH?=
 =?utf-8?B?MmQwbXl5ckZ0cVRCM3N1bEZhMDVra0pEYkxnVG1KMGxGdFdCR29JQ0RaKy9s?=
 =?utf-8?B?LzQ2N1lJQzRqNXB4Vlg3VGVVejh6TWFLcjh4ektreEhpOWdqZUZqeEU1aGIv?=
 =?utf-8?B?cmdhRmxYK0tJM1I0bml4NXJTQ08vR3pxN2tya3NKTFFPbHJ0V3ROZG5NRUxF?=
 =?utf-8?B?VUFubVlvK25KRkRiZGd5Q3FEQ2ZlV0pEUjFKM1MvN3FidkN5WHlNQkQzVGNw?=
 =?utf-8?B?WGc0KzcwZ0RkbWJlamtPK0JFeE1ib1lhNUJTV2JSSWZzYWZPTGZxUmRUcGUy?=
 =?utf-8?B?aGlHbVcxWHBvWlRRc2szUWhEQWNJUi92Nk5HY2RXYXhGd3FETlRrOEtGU3ha?=
 =?utf-8?B?eUhHMGxESDZTSWNXdVZ5UC8zb2pSZHd1akJNdnF5YWwzUThaYmFZNCtGRzE5?=
 =?utf-8?B?TFd5L0pJSHpYUzdmNTVwMUlRS21hU0VkRkpPYUdSVzNEdThtWUYrcHJ1OGRh?=
 =?utf-8?B?b2VzRU03cHU2S2NpZlhVK1NxWFU3ZENYbllYRmpkK3Rhby96MmxvR1F5aGtS?=
 =?utf-8?B?UTZ1SFMrb0gvN3ZwNmw2RGJ5K1JQcEkzZWFLUjBWZFVSTzA5Um5sNmtiMWRt?=
 =?utf-8?B?dnlDbk5SQzFEWnNLK3NPTDZjUWU0TzVBaWpTQ1hMb3Nza0FMRWFhNEM5QXUy?=
 =?utf-8?B?WU5SanlOdTJmejJnRW9Ba1k1WHhHT0dZRVNZR0FWeURhMTA0OThzR3pRQXVH?=
 =?utf-8?B?NzBwRVc4eUl2WVVvcHpEK2J5aWZheUkzOHd0aWVVK0RWNEZGQTk5TVRPQ3Uw?=
 =?utf-8?B?Vm5GeHlDSHdubVJ4Um9tbk52L0JBdWxjTlh0Ky9WMzB3enc2WlVSa01YQXgx?=
 =?utf-8?B?YURTU2NTUEtMZUR2bkJvdjBlL2ViUUFsUU81WG5VR0dxc3RCTE9lUngzQWo0?=
 =?utf-8?B?Sm54eEJqeUsxd2NYS0dEakR1QUMwUENVZTBzR3U5MDVOUklaY1dMN1pwNlds?=
 =?utf-8?B?c09xYjJuTDZ1d3BCUDByakRndFBUVzlzUDVnZUtCSVFDdEVqVnI5VGdUTjQ1?=
 =?utf-8?B?R0NpMGFjZFJLVVFva3hVTzJ5TlhTdWdpTXYrYWcxUVg1UVMwVGVGaVRRVy84?=
 =?utf-8?B?SjBhUmlGZWZmQWxteVFrWXV0RjdhZ1d1L1RKaFNrbGlVOEVtU0t6VGtYSFMv?=
 =?utf-8?B?THZtUGpFZzRVblRjcm5FZFQ5NFNZcTRQcEFRS28zNENsa1FSZUdUSitvMmFv?=
 =?utf-8?B?VHNOTzZjMDdMcWMyYWR0Sm55dFlnKy9QRTVEVTloY0pjdUZtMWhFQWtQVlBo?=
 =?utf-8?B?RTlMOG1xMmJoSnlMc1FUbi8vNjlKS3hsNlpoUE0zUDllcDl2ak1rMVI0ZHVm?=
 =?utf-8?B?KzdDRUpFbzJaR0cycjk4Rm5WRm0vMEhMbEV2WGJLRWN4emdNVS9mNk5nZU1P?=
 =?utf-8?B?WlVhRnMxUGtFV1FWQldsNUwxTG5wTURSaHgyaWh3MXZUaFZaZCttS1Z4SHQ4?=
 =?utf-8?B?QkVFc2VoYitFNXhtdU5veUF1Z0NCcndlUW1vNUs1K3ZKbkVsbnV5bjdqUGZp?=
 =?utf-8?B?TThzVW1NZ0tQemJHb2p0Z0hab2haOXM0WEY4Zy9laERtMkJCaVFycFFHY0h1?=
 =?utf-8?B?VGprZ2FaWGdBVWRnQ09zRHZJcG03SzVTTlJjczlmcmVlK1pqcUtqNVllcm8y?=
 =?utf-8?B?dnM1dXZualFMeHQrWjExeUo2RkRtSDlHd3VBMm40VEpIK1phVC9USmtTK1Jz?=
 =?utf-8?Q?+DdzYmFhZawQl5rQTNOnOizGk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5c1e0c-1b52-48bf-e1bf-08db2fa2a6b7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:39:43.2556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2fnJqitbK1PrRNTCJ5kkObKbxnC1ztRr+X+0GZMa7K/qkW65QL+rwlGYT2kN9pKtv3n/CQz8X0SD5gH/AEfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7309

On 28.03.2023 17:08, Jason Andryuk wrote:
> On Tue, Mar 28, 2023 at 9:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.03.2023 15:43, Jason Andryuk wrote:
>>> On Tue, Mar 28, 2023 at 9:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 28.03.2023 15:32, Jason Andryuk wrote:
>>>>> On Tue, Mar 28, 2023 at 9:28 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>> On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
>>>>>>> On 28.03.2023 15:04, Marek Marczykowski-Górecki wrote:
>>>>>>>> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
>>>>>>>>> On 25.03.2023 03:49, Marek Marczykowski-Górecki wrote:
>>>>>>>>>> Some firmware/devices are found to not reset MSI-X properly, leaving
>>>>>>>>>> MASKALL set. Xen relies on initial state being both disabled.
>>>>>>>>>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
>>>>>>>>>> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
>>>>>>>>>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
>>>>>>>>>
>>>>>>>>> But pci_reset_msix_state() comes into play only when assigning a device
>>>>>>>>> to a DomU. If the tool stack doing a reset doesn't properly clear the
>>>>>>>>> bit, how would it be cleared the next time round (i.e. after the guest
>>>>>>>>> stopped and then possibly was started again)? It feels like the issue
>>>>>>>>> wants dealing with elsewhere, possibly in the tool stack.
>>>>>>>>
>>>>>>>> I may be misremembering some details, but AFAIR Xen intercepts
>>>>>>>> toolstack's (or more generally: accesses from dom0) attempt to clean
>>>>>>>> this up and once it enters an inconsistent state (or rather: starts with
>>>>>>>> such at the start of the day), there was no way to clean it up.
>>>>>>>
>>>>>>> Iirc Roger and you already discussed that there needs to be an
>>>>>>> indication of device reset having happened, so that Xen can resync
>>>>>>> from this "behind its back" operation. That would look to be the
>>>>>>> point/place where such inconsistencies should be eliminated.
>>>>>>
>>>>>> I think that was a different conversation with Huang Rui related to
>>>>>> the AMD GPU work, see:
>>>>>>
>>>>>> https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/
>>>>>>
>>>>>> I understood the problem Marek was trying to solve was that some
>>>>>> devices where initialized with the MASKALL bit set (likely by the
>>>>>> firmware?) and that prevented Xen from using them.  But now seeing the
>>>>>> further replies on this patch I'm unsure whether that's the case.
>>>>>
>>>>> In my case, Xen's setting of MASKALL persists through a warm reboot,
>>>>
>>>> And does this get in the way of Dom0 using the device? (Before a DomU
>>>> gets to use it, things should be properly reset anyway.)
>>>
>>> Dom0 doesn't have drivers for the device, so I am not sure.  I don't
>>> seem to have the logs around, but I believe when MASKALL is set, the
>>> initial quarantine of the device fails.  Yes, some notes I have
>>> mention:
>>>
>>> It's getting -EBUSY from pdev_msix_assign() which means
>>> pci_reset_msix_state() is failing:
>>>     if ( pci_conf_read16(pdev->sbdf, msix_control_reg(pos)) &
>>>          PCI_MSIX_FLAGS_MASKALL )
>>>         return -EBUSY;
>>
>> Arguably this check may want skipping when moving to quarantine. I'd
>> still be curious to know whether the device works in Dom0, and
>> confirmation of device reset's effect on the bit would also be helpful.
> 
> echo 1 > /sys/.../reset does not clear MASKALL.

Well, I think that - as proposed elsewhere - we need the kernel to tell
us about resets, and then we could clear the bit from there. (I didn't
check whether the spec permits the bit to remain set, or whether this
is a device erratum.)

Jan

