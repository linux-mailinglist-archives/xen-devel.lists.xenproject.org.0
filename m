Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30D717BCB
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541685.844666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4I3C-0005fp-Iu; Wed, 31 May 2023 09:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541685.844666; Wed, 31 May 2023 09:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4I3C-0005dy-F8; Wed, 31 May 2023 09:23:26 +0000
Received: by outflank-mailman (input) for mailman id 541685;
 Wed, 31 May 2023 09:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4I3A-0005dr-OO
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:23:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca48e8ac-ff94-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 11:23:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9941.eurprd04.prod.outlook.com (2603:10a6:20b:67c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 09:23:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 09:23:21 +0000
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
X-Inumbo-ID: ca48e8ac-ff94-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwLGCtfT25j+5g2UYpqMCwkQ2TUy+r90fMDcmO81j4/OQhOCDhaqusM6grnr4oGBX1mVw/QvBBCWcv/SQDSQ5P/QkVICj0PLkBIiZKghObzjXdbmZimi9e3Tb5xGeSnNJx9BuNrHNdRBBDHnD6SO9C930qIYCu/VK2DrfHRjX3GmS7ctcMF6nTSaowNOfwYMaQQUxazUxCcfCpC7awriL4vJr8oidrO/kD3vofh6JrYKh4wN5xghDCFEUNwS4VATVLARx6iBbPQgZ7kNE/hYy5AaCUluqLDRUTFLGmY7fuRZDPw0sPjBrcDStxgq1H849gZ/3KfUO4eKrCxtpwGYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hALktanoGsL6JZON8Cfeg+lJxFL1p7XSykSevalN+k=;
 b=C8xjnYDh91HOTP4XU+8mQEiAqklOCf/v3jLLeN6FS5d1rqQ/gpApdEu+CODSxxhhIJtYJPI39XxiyxGWoK4ulK0VUiMItVbTTULwD/KQLjpKsU6zE/Np0yZhMEOGcoAzRO5KgxRXLrS5RjTLhnA2QQVFX64TK9/NEjn3JegRvTzThV5Ax5nAXwIsIAETeHXRqpraamt5SW3X5qINtCQ3/TiwVpwteqmspTdIRFZ/ZkM+mP2GcuhpFTDm6Mm36fNwdojR32t8BhswvHM8p0pykD/dWq3cVKu6pfUDUns5aBIYkc6ploD+vnX/ak0ypu2l1eDmemWT4eDhzSP52ve12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hALktanoGsL6JZON8Cfeg+lJxFL1p7XSykSevalN+k=;
 b=XnJOTPXfBA1O8mmNU9vFBHDdUdp3JS/476gBD06SWTvzFEz9g/i42pFyzfqHOVEJ8suIZcBzLnp0vT52VZwdPCxXnh2qYoMZSqjgVnUENwPOJ/89fAJJwFklGtEnAGkI5hu/JmgOd20YAd9kqNTa6JbpoJMh+5DJphjnsygBIAJkJ+Xis7SJEFa4GUM7YN6G0OBosLdjDpff4D5Gf4/Yh78N3cGESRaGqjvqWRkkwDA/NuQb0fkGYqafs8AuWHNsO1YSyehuy7DwSIgND379C00RL+DJlTgw1M9iULGOpjwFqKEw43CQh7+CImAYQY0J4013qvaHunRXHauoOL7uiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a97829cc-727a-aa27-b00b-d92afb0f8863@suse.com>
Date: Wed, 31 May 2023 11:23:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
 <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
 <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
 <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop>
 <22f1e765-891d-ef2d-01b5-e9dfe6ca895b@suse.com>
 <alpine.DEB.2.22.394.2305301529090.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305301529090.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc82581-3eb0-430d-5974-08db61b8ad25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lu12WjQmbUdDbL2+8EojFknwYBIOK4BBAximYF6Qi4pbX/B0ru93UNoMIX/NZFxpfUyHA4bQCDvI6RGCqfrIOEyHp6t9kMvSOjgtnZNir8znhKuKnqf6pYTVTJPTQVZeJUo9Bnhc7tQ7UjnxKF+4zPYYUh0lczKcKKt4xNwFgaTCHW7oDG8Vm1nqkwXJj1SCSTmwX5N73zoulg+9k7I9AUpYmR0XJNk0pXcQXG5titqJl++V4ZqgDLtdUG7/xzKDv2TsA1O3X7z6HCL321ZPBnAIjifHT/vwF6n6Uua0Q2oGoh8blNYmU/KcuHwJsD7GdZH2AT9lNkLkl8BQAN0qV4VTT4pWgnxDukd741JQuHZ+ltEF5/Iaq6RWRY/ezTnWuS/22UKwdsgafxJz4oVNf6Cl7gmXSchEXhtDP42XtDImKgBeYZwDoABFsFJocfGIB4AczbnkXwt2s6AyceDuH1ftCBaxgcJ1er1I8YsBla7a1dqEMGo4l/gbceBoXlQbgUfqk/Nea1t9w5IyWUldSxot/WEkqVw14OBrJKbvjCubm1Odg7bC+pjuy86eVX1j8iWtGXjUSF57m3gqXq6lvbR6m5OtvxZxucvA85ilytZLIH482+zE8SQlHKHrqvPWHF59WQBm5BsmX1sWI/oBYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(186003)(2616005)(38100700002)(41300700001)(31686004)(83380400001)(6512007)(53546011)(26005)(6506007)(6486002)(478600001)(66899021)(54906003)(66476007)(6916009)(66556008)(66946007)(4326008)(316002)(8676002)(8936002)(5660300002)(86362001)(31696002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE5KTjMzb3FyeVB2QUljTDBiZUd4UTljUDBhaXFIRVFIUXF2OTIrUk44SUpu?=
 =?utf-8?B?dHQ1UFJzMStKZzlSK1ZFa1BWbHRMRUVQcUxQNHZxV28ybmRrVHJRaXVuckxU?=
 =?utf-8?B?ZTZHTmE5RGwvTjMvWi9ReVFXcUQ4M3VLd3FIdHlLQXdOQ3V2N2V4NGRKTHI2?=
 =?utf-8?B?U0ZqdXNKaVlNSHZkLzIzMWxLeldmazdWcE4wWEJaSGI3RktPeUcyTEJkNmhM?=
 =?utf-8?B?MnN1a2lqREFib0dEY3AyMkhQVE1udVQ5M3lzSXFjQ3F5c3hzc1BYWDhpbCtv?=
 =?utf-8?B?ZXpUdlJxRlhpb2hsNHArajhiam1ucDlBTDFlU0JUaDh5SUR6YUZJRE5wZ3BO?=
 =?utf-8?B?T3QwL0N1Um5wcmpEWmk2MTk1blJZaVVvTXlhSWJESkZIU2hqczZrOHlCNWdz?=
 =?utf-8?B?ejB0R1lQY1pDZmRhZDBaUkNjdWxPTWRJRzR4ZDBDU2tQblBlTjFwbFplUkFL?=
 =?utf-8?B?cE1MaE1XdlVrZ2o2cmhjVFQzNVJ2UDBNSUp3OGlsakdKUDRraWd3SFp6ekYx?=
 =?utf-8?B?ZTJueDBSNFptQkVPZnhxS2NZaHVLMFkxNlYzclRQOU1IenZCMlE3SDl1VDFs?=
 =?utf-8?B?YzlqaXZZNGo2citwaS9XcGQ4a2VZTmNFb2REYVVqM01hby93Nmk1QlhCQ0s1?=
 =?utf-8?B?cSs4YnEwd2R6Z1plTXdSODh6UWFpWTRhLzhpMTVseEZPbkJzMGNaYWllbUs0?=
 =?utf-8?B?dysrd0szTkk1VUFJWWN0c01KUnBadFpkbHdkcFpaNkpjcnE0UDRTSWR3dXZK?=
 =?utf-8?B?d3BUaC9mZ0dsdVQ1VGlSbG90a2VNQ1czb2N1RTg0MVFueVlSckJEbk1xRHB1?=
 =?utf-8?B?Kys4UjIveTZZcU9tMFlXU0w4RklEa012akFEZkRPUVNlUnBUU2M0Skd3YTdU?=
 =?utf-8?B?VkhyS2VFd0hCQTJmZUxjY3YxNzJBcVJkY1hvd3pKeGJ3WG5vdmh3QWJCcTZO?=
 =?utf-8?B?MWNRc0I0bCsvVDdDOHVuUlZxR2pLT3hrSFBVekwzbFJxdjNNUEFyQlc2NzZ6?=
 =?utf-8?B?TFNYWU5jUWhHQWwySEcxRlAwNDVsUm16S1Y0Q29iNnl2M25GT1cwRmJUZ0JB?=
 =?utf-8?B?NS8wYVlHYXBiUGRQT2QxK3dIVVpCOHYwVWhDRzhvb0lzSUtXS2NRSzU4ZXFK?=
 =?utf-8?B?U1gvMEhBaUZ2Q2RQRExvRzQ3VmxlMS9id29mdWMvVUU1S3FWU1dlSmN0WVFE?=
 =?utf-8?B?blpXWS9xZWE3ZWxQRkJlQmx3NXk4cW9wT3ZPRGNNSEZlQ2gwcXhnMmNURjY2?=
 =?utf-8?B?bEVQU2NuWlZBbzBxN0FuOEZ6aWV2QWgrNVRQOGtXREpub003eWhZR2hpYXFs?=
 =?utf-8?B?eFMwQkliSU4waWlxUGhTWk9yUUFSUm5sSk10OUlCaFBEd3dMYXI3dUxDSjZC?=
 =?utf-8?B?cXdpeFVSQ0RMd05xRmtSSWVhV0tINFVVR0x1TU0zdDkvNktpSFhNRXpOaEFL?=
 =?utf-8?B?eUIrcVpKMzZqSkxQNFVmSnFWTVgxbXRUTlZaeXhJc1NlQk1RUzVoVXpPdlh5?=
 =?utf-8?B?d0cya2Z3b2M3WHdRUk0welBEMHZUUndyQU5xZXlQcUdFUC95dThGUzlwMUN3?=
 =?utf-8?B?MGx5V0EwQllOZHhyODhmTUxvZEJ5SlhmK043RE1Fd1NuTGtHcElXTWJPN1Iw?=
 =?utf-8?B?cEkyMWptcEdtSDR3eVBBT0t6Y3VXQkFoZ3BZQ08wMFRUMjlrUCtuZ2pVakxE?=
 =?utf-8?B?cDdsMFJnWFBXQmY2dDlvejZka1hBT3AwbFo2bUpTQkxpLzBuMHNoZVBzdG5K?=
 =?utf-8?B?eDFUVDduRkNRRlhON3ZWZEVCbExtU00wQmJNcjc3SXRqWHlTbW5sMDNFQkJs?=
 =?utf-8?B?SzdOL09DY3pXeWswZ0YzK1B3YlRiWUUxMHlSbERVWlR2cUJRY1NZWDVqWWRL?=
 =?utf-8?B?RzJ6L08wekw5TzEzWFBoTXh3cnFoU0FXRUNoWldjMEs2NFo5c21lb1lTTHJL?=
 =?utf-8?B?ZWlQNnlRUjdJYW1ISi93M1RldjdKUWNZQWJCTXNSRnk3WUtONE9kMkQvZEI1?=
 =?utf-8?B?YnkrQys4VkIrWGJXY1RaSDk1ZGJ1M3ZNTFd0aGxvdWJuZU5yQUhTQWtUblVV?=
 =?utf-8?B?MVoyN0hPc3JaNHJ3Mm51NnpHVWZGdG9HcGxFMVR3TXlDdmpudDdMcGhoaTFM?=
 =?utf-8?Q?0XRyCnx7UbPSPsmhRhNYKe8mu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc82581-3eb0-430d-5974-08db61b8ad25
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:23:21.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0aEkdEx8zunMPfiSegAPuQ0/aTUKwm2OM5TS1k97dD8ax19365j+40tAMOvW+rRL7sawxWFkjRQYuzTaMGwlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9941

On 31.05.2023 00:38, Stefano Stabellini wrote:
> On Fri, 26 May 2023, Jan Beulich wrote:
>> On 25.05.2023 21:24, Stefano Stabellini wrote:
>>> On Thu, 25 May 2023, Jan Beulich wrote:
>>>> On 25.05.2023 01:37, Stefano Stabellini wrote:
>>>>> On Wed, 24 May 2023, Jan Beulich wrote:
>>>>>>>> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
>>>>>>>>      modify_bars() to consistently respect BARs of hidden devices while
>>>>>>>>      setting up "normal" ones (i.e. to avoid as much as possible the
>>>>>>>>      "continue" path introduced here), setting up of the former may want
>>>>>>>>      doing first.
>>>>>>>
>>>>>>> But BARs of hidden devices should be mapped into dom0 physmap?
>>>>>>
>>>>>> Yes.
>>>>>
>>>>> The BARs would be mapped read-only (not read-write), right? Otherwise we
>>>>> let dom0 access devices that belong to Xen, which doesn't seem like a
>>>>> good idea.
>>>>>
>>>>> But even if we map the BARs read-only, what is the benefit of mapping
>>>>> them to Dom0? If Dom0 loads a driver for it and the driver wants to
>>>>> initialize the device, the driver will crash because the MMIO region is
>>>>> read-only instead of read-write, right?
>>>>>
>>>>> How does this device hiding work for dom0? How does dom0 know not to
>>>>> access a device that is present on the PCI bus but is used by Xen?
>>>>
>>>> None of these are new questions - this has all been this way for PV Dom0,
>>>> and so far we've limped along quite okay. That's not to say that we
>>>> shouldn't improve things if we can, but that first requires ideas as to
>>>> how.
>>>
>>> For PV, that was OK because PV requires extensive guest modifications
>>> anyway. We only run Linux and few BSDs as Dom0. So, making the interface
>>> cleaner and reducing guest changes is nice-to-have but not critical.
>>>
>>> For PVH, this is different. One of the top reasons for AMD to work on
>>> PVH is to enable arbitrary non-Linux OSes as Dom0 (when paired with
>>> dom0less/hyperlaunch). It could be anything from Zephyr to a
>>> proprietary RTOS like VxWorks. Minimal guest changes for advanced
>>> features (e.g. Dom0 S3) might be OK but in general I think we should aim
>>> at (almost) zero guest changes. On ARM, it is already the case (with some
>>> non-upstream patches for dom0less PCI.)
>>>
>>> For this specific patch, which is necessary to enable PVH on AMD x86 in
>>> gitlab-ci, we can do anything we want to make it move faster. But
>>> medium/long term I think we should try to make non-Xen-aware PVH Dom0
>>> possible.
>>
>> I don't think Linux could boot as PVH Dom0 without any awareness. Hence
>> I guess it's not easy to see how other OSes might. What you're after
>> looks rather like a HVM Dom0 to me, with it being unclear where the
>> external emulator then would run (in a stubdom maybe, which might be
>> possible to arrange for via the dom0less way of creating boot time
>> DomU-s) and how it would get any necessary xenstore based information.
> 
> I know that Linux has lots of Xen awareness scattered everywhere so it
> is difficult to tell what's what. Leaving the PVH entry point aside for
> this discussion, what else is really needed for a Linux without
> CONFIG_XEN to boot as PVH Dom0?
> 
> Same question from a different angle: let's say that we boot Zephyr or
> another RTOS as HVM Dom0, what is really required for the emulator to
> emulate? I am hoping that the answer is "nothing" except for maybe a
> UART.
> 
> It comes down to how much legacy stuff the guest OS expects to find.
> Legacy stuff that would normally be emulated by QEMU. I am counting on
> the fact that a modern OS doesn't expect any of the legacy stuff (e.g.
> PIIX3/Q35/E1000) if it is not advertised in the firmware tables.

And that's where I expect the problems start: We don't really alter
things like the DSDT and SSDTs, and we also don't parse them. So we
won't know what firmware describes there. Hence we have to expect that
any legacy device might be present in the underlying platform, and
hence would also need offering either by passing through or by
emulation. Yet we can't sensibly emulate everything in Xen itself.

> If
> there is no need for QEMU, I don't know if I would call it PVH or HVM
> but either way we are good. 
> 
> Same for xenstore: there should be no need for xenstore without
> CONFIG_XEN.

Right, it may be possible to get away without xenstore.

Jan

