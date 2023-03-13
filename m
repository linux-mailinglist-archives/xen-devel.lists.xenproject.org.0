Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72676B790C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509270.784738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiJ8-0005Ep-Ft; Mon, 13 Mar 2023 13:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509270.784738; Mon, 13 Mar 2023 13:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiJ8-0005CV-CM; Mon, 13 Mar 2023 13:33:46 +0000
Received: by outflank-mailman (input) for mailman id 509270;
 Mon, 13 Mar 2023 13:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbiJ5-0004ws-Sl
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:33:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ef4e5d-c194-11ed-b43d-930f4c7d94ae;
 Mon, 13 Mar 2023 12:42:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6932.eurprd04.prod.outlook.com (2603:10a6:208:182::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:54:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:54:59 +0000
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
X-Inumbo-ID: 25ef4e5d-c194-11ed-b43d-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tru9V345VGz6Gj5rhJuPSDi1JeIleVEU7KYTN26rM1QxaYmpvuX+Q90xRZ/3u6UtbrhKoGmti0FCONYzaO//Gx37echT/5EFqZjd/HZBWWKJuf5MSkmPw6bSkFuAi+n+xA+vfgWMcca6nkBRJP7wqG5CjC6SKUs3uH5IwMj5NuVQcq3GXkX48KIH9BjnAyPSH1g7WAWAPc9JpsYc1rXsFOlT+OA9akwtcmI82ztvFqaUEMYCzMzAZmLE1zZuu83PIXjRray3x5KTnsEFVWXWRqFajUHSmcNcEs6CVyOkbS/Ut4RDVOAyEPTpLthDQBqXLlbTQbqNH/BI30eQc2G/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXkyP10n4IbenPNnvXY9sYJ/Kl8cAA+tQlYWleIccZ0=;
 b=lfWhUZFc/RH2cJHo2pzuPPXtRM7EQGpHDD31l5Ex8uuGeCBe+S/rjQ3462RjGM/b5S//eizXkEwyCttCw+RcXaPYbmKVOXic8BxW4M35KjoC4CRZOPwcy6Xxmhaa3hDVlJJ1M6TUpxtwcsyVAAHafcmLbDPRHWkXDfVrrg2P1GO2Of7fRgMQ8SUVuXfUO9PwnZ4NphvYfgbJop/pDFRFEvVxP2zsUuwV1h4wMbEnPnvH19wf64oHDJgeX+lTfgAZwPiEXgboa8hvvbpKG/P4ZKrFb4ALSr43CDHMv3Gk5gHS9Out/GsIFG7MMspQxk0/BlcnS+/MEJ1hBPF71gADRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXkyP10n4IbenPNnvXY9sYJ/Kl8cAA+tQlYWleIccZ0=;
 b=RqZqIvLU5relgzcyfdr+jVGH/Ydx8nP2vCpC4JaHHjAHNomUlOKZDU33iEP7rFuPoJgtY2LKB1h7oYlARQVjyaT8ZECQo/ao9Uw42qWzlPPlrduEAGulxSLD9lazyM799AXG2a5E+laW9G9rl1lXAuZgojDX9/EI/ZvjRF3HHOy46pgUJOroo37DToMMNYaNAvmC3KnNIXbcR3rlZALZX922BmoQKcsJEIzuOgZWCAoMyI5nLxdMP0crYZsI5OaV6fKFHM1dw/DFrZq3rgz2J/5+I5b0ooftdVsHZwp7zFfA+DCAyw8EqpHF+Q4V12C2TNJI2izpnfEvBrV5K5JmQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a779fab-a410-c333-6a92-49d603647761@suse.com>
Date: Mon, 13 Mar 2023 12:54:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Denis <tachyon_gun@web.de>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <467bc1f9-6e14-cca9-159c-b40eb8327028@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <467bc1f9-6e14-cca9-159c-b40eb8327028@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9d6779-dafe-4894-404d-08db23b9c54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2xuSGCiojPiwWWSiX30kT7D404T4kw47mM9ICXgkslCAYtciryy357fvlL/l6PmvySQh/TdjDWy+D8xhqfjpisPrMk9PtOVMZSVmA91ETheVu3AH1jYpvrYqYPpsWSeNLE/gtAY3RUemR4fvhcOggLaVTQxQBebKKmF6SbV0dYS0/LHt16g8531hYzq8FDvlnOYYmbwzvmh1F6HfOliNz+hDUNwPjtG+lkFyClS6vOt3v2OXbMfTWXJFk6Hgki/luSoHsnItMstFO86PZlxYQVbYjccc7bAjb2yxlrLSqVN4IDnrw/x7FGyd8Jn22kDZyNOF3zjgwS41t/CzxcRSZLxtKx/UmuA7sNWVYfJ+LllFzDe6UqJYnbWMYiSjuHHKeagS1LKI4F6bnHCctIPK6n4lspULAgDwNp4Vu6Gicsuz/S5d/JWvuKt0flo0yG459CHLIflRzg7xWg9gCAz7LZZYiss2aWsFE52pw9MVKdqOACOLJWzfYyousDhb6dacasRPB3apSC7MPYhM+XDPFRf1Oba+Z78DlPd+WYgelZXdzBSgT9ivsvtGn2U61IkvMBt/sDCkSpkewLVr1Wmse58k1SMJZJytvLPRhynx2ZtBYa+dx2JK/VE5+YNy0I8A9iKtA4xESrzGMNTbR9YYvLDJP6sKehtOurg4onWtGAw08W+WolkOSEHZw3pwG8pi1DPGyQe51l11REY0fL8t/zEo5IbDb83C0l82oZgz0xm+U23ZZKt0HJwfbBDH268zASfXvp7BCQyxw2iCFsxg0aCksLbxeIKBrZWMUl0BBK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199018)(2906002)(41300700001)(66946007)(6916009)(66556008)(66476007)(8676002)(4326008)(316002)(478600001)(31696002)(36756003)(86362001)(54906003)(38100700002)(6486002)(5660300002)(26005)(6506007)(53546011)(6512007)(2616005)(31686004)(186003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDk1MVVCU1lJb1FkcXpoNjlaSU45NElGaWlMYkFPbTc0Z2Rta1k0Y0dkN3hy?=
 =?utf-8?B?VGNNVVhnU2czd1hMRSsyaHBLb2hhaTVEbjQrOUlzN0RRTmJmM3ZmeEJFRm5X?=
 =?utf-8?B?aGpIUlYzMDRESE44SUowQ3JrRVRjUklkcmxXSG5VWE1ON1JJdUFodEtoYVBs?=
 =?utf-8?B?ODI3STlFaXdrRnIzTzhPMUJoWXVZbTNidXJCWFBIR2UyZGI5anFPbkFYUm1r?=
 =?utf-8?B?czB2WExkTThnSGtEc2pMSTdzdHRGZXVvYUdKbExCUi9WYnJ6T3FncFdRcElQ?=
 =?utf-8?B?SGNHS091cUlNOXZxK211aElQOGhQckc0NXpHUklXS1NNaTNRWnhLbWFRQzN2?=
 =?utf-8?B?cFZoay94cEovblVrc2N0SUFIN1RkMXY1S2c0aEZjZGFiazE4WGxUdEZGZjVk?=
 =?utf-8?B?RGxwTWg1ck1HQ3N5SFpDOWtuVXpBZnFpc1Y4UGJKUmNNamZCYXplZGU5Y1pq?=
 =?utf-8?B?d3Z0MHdPMGREb3UrRHg4cHVSZWZzSEYzQmFibmhnWUwxVmppMmdQcHBoT1Y3?=
 =?utf-8?B?RUE0Ry9kWkJreThRT2Q1YjJXVjkwWUczWkFUUHQ2d2RiRDFYdzl4NHFLNldx?=
 =?utf-8?B?U3krLzdNeXBXclpiVnBLMVdPNGV1VFhBcVh4dHlDV0NGS0pBbnZtQnZ4YVhn?=
 =?utf-8?B?VFRsV1N1a0xDQWFVS2cyWENnOTFNS01PbzYwc0RQZkF5VVhENlhaYlo3d1Ju?=
 =?utf-8?B?VHBSd0lMdzlSM0hCYTNYejBPL2lnWFhLVGxkdDgwNHc4eUhpdVFtNGFEd25y?=
 =?utf-8?B?cHk1R3R1YUJ6ZTc0ZXkzWno1S29NQlZBTklIb3NaTzkvZ3dWT3hCdi9wbWUv?=
 =?utf-8?B?azZXVE5RNGxKTXBzbU9ycU5zbWxTYitWWXhNVkxkbUppMVh0MW5Qb2JYcHFs?=
 =?utf-8?B?djlpV2RoQlVRY1hjL2tteXBCWTZXZmZ4U2NCbVNkcitiZG5Ta0lISVA4Vy9s?=
 =?utf-8?B?QnpXMUpjMFFRQ1M3cXhVeVE2Y0ZCeldxZng5QTJweUxiSTh6eGpIQkhPSkJ1?=
 =?utf-8?B?OUxlaFJMV1M3aldiM29NTDRhVVEzSUZJQnhDbHpzYmZxd0tBTnBwamViQ2FD?=
 =?utf-8?B?TWxxRHlNbjlpcTFnQVBlc3d1LzVKeEt5ZFdoVlVwWUgvY2h0Q0p4TUdVZjJB?=
 =?utf-8?B?QVdmUENOalpJWXVLZEE0NVdEYXBkL0ltYzNEVWpBOGxKalNmM3RYdnRsSVh1?=
 =?utf-8?B?WURaRnJZNEo4LzNzUXpQZ3g1S291QWptK24zTUY5VnZtTmFETHUxVkd2aU96?=
 =?utf-8?B?MVRWNzkyNE5Wdmk2VC9QSXU0Y1VadUpPTVF3UkpvaG05aDhqckpXUTVydkJ0?=
 =?utf-8?B?K0hCV2tSVnEyK1lkbSsvUjdrUDNIMHRHVUx2RzJIOHY4OGgvaWVGdVJJczE2?=
 =?utf-8?B?TkFlS2IrWVg1cXJKN1lLV0QxT2FxNmR2a25sSmR1MXp0TytvdkVnNDZFeENG?=
 =?utf-8?B?V3JtYjVHUGtqelZWUEpKRmF2UHh0UkFZcGpCSUJjcnVxcGRieG9VMmpQbnp4?=
 =?utf-8?B?aGNROTNvdE5YT1UrWExMd0VnaVBabXBBT0hSZ3BjRW5ERTNVNjRUdmROaGE1?=
 =?utf-8?B?dkltVDEvbk9QVnhwQy9La2xucHB3Yk94NmVWbzQrdzZiRVJMd1JyVXFzWlI0?=
 =?utf-8?B?S1NrSW9LZmlYU2JYaTJTUFhkOUZlbkRLZ1YrdG1Pb0dHWmNzYm4yMXA1YjRp?=
 =?utf-8?B?dnJxWlRZSzVrVTVXb0JkbmZYR1Z3L1VHbUtONzBuUmFaWmRhTVF2RXBSYVgv?=
 =?utf-8?B?N1UrZHpadjQzMnRodnRBQ2puKzUvd1VCT0xlblJTK0d6S1dWdXJsNzZvK1Qz?=
 =?utf-8?B?RElIZ3RNTDBBMDVzejNycUtzVjJiVDFJRUp4MWtRMVVpZ1JoNkpYYXk4ek94?=
 =?utf-8?B?UkdwSllaaWFXd1Nsd3FhRUxuMCs5MmtRaFBhcmd3bjBSRE5TTHRwVDRyU0Zl?=
 =?utf-8?B?cCsvL1ZsUVBsS2pxV250aGFydWZRczV0ejZpMUFsMzA5VUN4MHN0TU0zcG5V?=
 =?utf-8?B?OU90dmRXRmgwRmMyb0hERHIzTUJKazlPREVsL3l0WUphcW40SDdqWXF3cXpD?=
 =?utf-8?B?b0s5cGhIR1NwKzh2K3pVaUZjUkFGb3BkU0tJNk9rM1BTSS9aQ1l0cjl3NVNY?=
 =?utf-8?Q?UJL5ERwPBQt5K2lWIFtPKOxZA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9d6779-dafe-4894-404d-08db23b9c54a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:54:59.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyCJTNQXu5o8tbqlcVcpPPmRO222gYLKlhB/7d168Fb9K3OcI+SQTIezWa2noU4BGPuu3+BYHEvCV/14vYaecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6932

On 13.03.2023 12:43, Andrew Cooper wrote:
> On 13/03/2023 9:36 am, Jan Beulich wrote:
>> On 10.03.2023 21:50, Denis wrote:
>>> On 10.03.2023 09:51, Jan Beulich wrote:
>>>> On 09.03.2023 21:37, Andrew Cooper wrote:
>>>>> On 09/03/2023 7:34 pm, tachyon_gun@web.de wrote:
>>>>>> A short snippet of what I see when invoking "xl dmesg":
>>>>>>  
>>>>>> (XEN) No southbridge IO-APIC found in IVRS table
>>>>>> (XEN) AMD-Vi: Error initialization
>>>>>> (XEN) I/O virtualisation disabled 
>>>>>>  
>>>>>> What I would like to see (taken from Xen 4.0.1 running on Debian
>>>>>> Squeeze, in use since 2011):
>>>>>>  
>>>>>> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
>>>>>> (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
>>>>>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
>>>>>> (XEN) Detected 2611.936 MHz processor.
>>>>>> (XEN) Initing memory sharing.
>>>>>> (XEN) HVM: ASIDs enabled.
>>>>>> (XEN) HVM: SVM enabled
>>>>>> (XEN) HVM: Hardware Assisted Paging detected.
>>>>>> (XEN) AMD-Vi: IOMMU 0 Enabled.
>>>>>> (XEN) I/O virtualisation enabled
>>>>>>  
>>>>>> My question would be if this is "normal" behaviour due to older hardware
>>>>>> being used with newer versions of Xen (compared to the old 4.0.1) or if
>>>>>> this is a bug.
>>>>>> If the latter, has this been addressed already in newer version (4.14+)?
>>>> No, the code there is still the same. The commit introducing the check
>>>> (06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"])
>>>> specifically provided for a workaround: "iommu=no-intremap" on the Xen
>>>> command line. Could you give this a try? (As per below this could be
>>>> what we want to do "automatically" in such a situation, i.e. without
>>>> the need for a command line option. But you then still would face a
>>>> perceived regression of interrupt remapping being disabled on such a
>>>> system.)
>>>>
>>>> The other possible workaround, "iommu=no-amd-iommu-perdev-intremap",
>>>> is something I rather wouldn't want to recommend, but you may still
>>>> want to give it a try.
>>>  
>>> Thanks for your reply.
>>>
>>> I added the lines you suggested and it seems that "AMD-Vi: IOMMU 0" and
>>> "I/O virtualisation" is enabled again.
>> Good - that'll have to do as a workaround for the time being.
> 
> Not really.  Booting this system with no-intremap is still a regression
> vs Xen 4.0.1

Well, "for the time being" meant untiol we figure out what exactly we can
do here.

> Disabling interrupt remapping on PCIe devices because we can't figure
> out interrupt handling around the PCI bridge is still bad behaviour.
> 
> 
> What we need to figure out here is how interrupts from the PCI bridge
> actually work.  The IVRS table does contain records covering the devices
> on the Southbridge, including the PCI bridge and it's entire subordinate
> range.
> 
> MSI/MSI-X interrupts from the PCI devices will work fine (they'll have a
> proper source id), so the only question is about line interrupts.  They
> ought to appear with the bridge's source id, and ought to be fine too.
> 
> 
> I see no evidence to suggest that the IVRS/MADT are incorrect or
> incomplete.  Xen's believe that there must be a southbridge IO-APIC
> special device seems to be the false entity here.

It may be possible to behave better here, but my reading of Linux sources
suggests that they would do exactly that on this system - disable
interrupt remapping (I had asked Denis for trying that out to double
check, but so far he provided back only hypervisor logs). Also my
understanding of the reason for the check is that for pin-based interrupts
of devices behind the southbridge there ought to be an I/O-APIC there. But
it may be one or both of my understanding and the (original) Linux change
(and thus ours) are wrong / misguided.

Do you have concrete suggestions towards logic which might eliminate the
need for the check for a present southbridge?

Jan

