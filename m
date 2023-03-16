Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F96BCA20
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510390.787965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjOC-0001hI-2n; Thu, 16 Mar 2023 08:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510390.787965; Thu, 16 Mar 2023 08:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjOB-0001em-VQ; Thu, 16 Mar 2023 08:55:11 +0000
Received: by outflank-mailman (input) for mailman id 510390;
 Thu, 16 Mar 2023 08:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcjOA-0001J2-DX
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:55:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 406b8827-c3d8-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 09:55:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9710.eurprd04.prod.outlook.com (2603:10a6:102:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 08:55:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 08:55:05 +0000
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
X-Inumbo-ID: 406b8827-c3d8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVNqRag2m9IvOk4nBQX16nNS0LjKtp7vuFZReQyMxEllsuMELYICdZ25/hxOB/s9VZyolBCNdYn7xgHIepirCH3ANMQ3IeZXFn8vmFfgc1AfQXXbewhE0dSG/1YIeKdGDwh0XERJ643D65HzmLXGPU5MxV3YcnKoic+FuJC7K6hbC70Rw88CjFrHMnABk1EXTwfVwjcjqwuUgIlrsT+BHvltbBBaYZg2HO14BazVlHmw2tcT3ddUXR7pi0P/+kJ1kkQ4IApn6QbW1LYxhDgv+f36vDjQe8+QqFVSidIIiSjyH+KLs2c7E0zajc2ml4IKEE2zPql4nzDGaj9VWiGUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnP6f4qBLSoWCMI3Gggld4XuqTz6qErZ7w6G3c++lj0=;
 b=bnKGVSHmT0d2vvGLevQ2LRc0Jhea0ppDvJqt6J5TEhE8bDjfuNDzAhgxuxtXwvMUhqn2/RRMABk9BRM0gA63iIRv3Qd7a20k8JQ5BuYx0/KzVclrWfwsD02fbX/+YGd/UmE215QbYSWReAU+dEM/NLwWqVr04Ii4SLR2jH29QBMfRvTqEtLgiSo4zJI2PLBb7w3gJQ9lVuapVMw8Ec+SyTMD9tSbja6V2UbbQXhgcadGZC/7IwpgAOrC1FzT69D5hz7hNJjHywqONB5g2gfucbJHrb4Jkqh2mRFkdYabbQCTpoTtBbBv+n71zTEBch3i4/7nMeTuYeIKYQnpa2Xyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnP6f4qBLSoWCMI3Gggld4XuqTz6qErZ7w6G3c++lj0=;
 b=4kYEa5v8COAUZ/B27fLAXUlHYeRSMOE2dSCVw6qxAVS2NL5tcBLTMOBHZ0P1NjtYC47K4MZWZeSrBGEEQtZiS57FsnY4RL0fd1x2yfANFEzjHj9cK3ezz+EKrcwV0tLT3riJStwcsV0AR2/KYuKSheZcBGvVSJRNAqeLajkZfF7qfW4U/1xxCqu54bqTp9Avt7Hdg0/HzYbLwdQHvG6sbr03fYR6A/JCxecNOYjJmsnv04cXGSbC0ix2t6/1tDD4xlTwu+Vr2x/7PMBe2Lo2kjNg3s8zZ3hRKYftuY/jK6pD8SOS+hZxE+HmH8hr42MtiSIBCl0PPxzLTI9OXUKrig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
Date: Thu, 16 Mar 2023 09:55:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df0511d-74e0-498f-a3c5-08db25fc2338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yxWsC6ccVY3Oqq1L6dju4AGQMKqCkSilyugJWnAqIBc7g8Xd5X+rocS44js5hX50JYvpGEnOe9PbMxTOTL4ksMdTcTWRN47d9rarTPCRZNBez9MfcYhKYOWUy6jV/Tbqwq1+xsUBVoiuKzryzT4DqvXGL1oiV+OHt0CLhRFgVAxmTRvbDJZ22tcFarQPVUSx2PSu84mdfBiiu7AOdWNaPBXn05fHgy1vdZqqFqwkAAFIN5o2DNHcxNxbe8K1zv3CPXDC15bFd4Dq79jpFD+itD0BLFA9y2EKyUszye76lEhxpbaTbf30zLa/knYPhubKeqW+Eich7+SWxFHPcpJe20d6vWJYdL/n+VZUu0Kvv7jICy9FrXaj7gwulFJe9/5z7mc+4IjxfiPzb2GONKo89owkCrn6bUpDKf4+jUwclJmrhV6bvK+RXn9n8o19GD5/TAKXoaCBOVNuSDEBoEeqlphdnfejFwciGN0TjozueWpkIhBTsFVc2qG9UDl1eNuBZRehboSvTBf85+rRn9zCklsxhBe/xQYLbjbrVyg081YfQWzIUi0dlMDp7D5lWuM/CFkGtkgUGz9OqFGO3lmHJo4RSx/M839zXlh0Z+nyILvGZNALf2jIg8itps0vrwTWCrziLD6wKUvrIY2zPreC8WCOx5q5UxmpDeJ/rEdKmQc1O2LD90VJmc2FzcID09Gz5Ic83kbxYDbQkVPAbYIPvFVyJf74C06jxNKFAMajQNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199018)(31686004)(36756003)(4326008)(7416002)(8936002)(41300700001)(5660300002)(2906002)(38100700002)(31696002)(86362001)(478600001)(66946007)(66476007)(66556008)(8676002)(6486002)(110136005)(54906003)(316002)(6506007)(186003)(53546011)(6512007)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkFYZk9BRnpLOFBaTXFVdW8zVUgzZUZueHZDYUxHYjBUOHh1SnJMZDJ2eEtJ?=
 =?utf-8?B?Wjc0UlJQTzY0dXNJQzM2czJzRmk3UTBhLy9wWHdMVWNVcVpRVWxOeDdSYjNX?=
 =?utf-8?B?bW12Z2w3dXl1UXQ1NVcrNEsxUGk1L1lwc2RxQWdXZUR4OUMxdWZrSFVYakpw?=
 =?utf-8?B?R09NOU91UGUySEh4Yk5ER3V0M2t2Y2tpNDYvTVI2MDQxS0tPcXJXQm9VVzVi?=
 =?utf-8?B?MkxneTZOZmRoT1FaNXU3UVVuRXdQTys4d0Y5emVubHovVWJBM2Rjc1czK0tZ?=
 =?utf-8?B?SlVoNHp2ZTl2OTdyU081YVhiSVdHakFUOGJ3ZUtGN2JlN3cvdUNxQXc5L29a?=
 =?utf-8?B?T0J5WDlZWi81Ny9kRTlQKyt2eW5mTlhjdEoyQnZsZVNqMDRwRUNyUklZYlBD?=
 =?utf-8?B?Q0tTYUVlVzN0VE9QWXZwTFM1bHVNdThLdTJhWGFJUHVsdXU3ZHJrTDNXMXRK?=
 =?utf-8?B?aW1Qa1RQZVRIenhsK0NxVitmeC9IeUUyRnorL09TVkZIMkZpWTRWMys0NUdX?=
 =?utf-8?B?SWczZStUWkp5OGUySWxQRm9pclA5dEc1NWhXYnN4cEEyaGF0akh2Sno3b0R2?=
 =?utf-8?B?cjUvUkc0RUlJT2Rqa3pVUHNEY2VUaGVwY0ZQY0FETlhXdm9RZkx1VldkZHZX?=
 =?utf-8?B?a01lUEFvVkRLSnpLbXBjN1BQcTY2cVRBTCtudHFUcE9KYXFHU3FtNFFBUk05?=
 =?utf-8?B?Q2VQdVFVUXl1RTUvNXY4d0lhR3Y5Y2c2VXJ0YklwbTlnODZpaDJLdEVHNEg4?=
 =?utf-8?B?UFVGUElveVBxZ1ZETTNkOVFleEN6SGFhVjFMVTNxYkQ1Q20vZlkvcFFsZ1VY?=
 =?utf-8?B?Nk91MWhJV2ZoMkh5VmJscU1YNlFJT2FsUkU2eUxNczRoVDBaRUNEQlUxdi8w?=
 =?utf-8?B?R2ViOXVzMmlxMDkzVjgzaDBJVE9JcDV3ODQyRDhIeGZGUjFPbnZ5Mkt6SW5u?=
 =?utf-8?B?Ry96Q0FHZkhjN21MKzRFeWgxakZieFpjZWdFOWFvMWhRS2hDN0swMHRUVEpp?=
 =?utf-8?B?SmliM3ROdDdUaUhkbUZtTkxoY1FFTXY3ZjVNY2hYc3RJZE0zKzlFdzJ2L2Y0?=
 =?utf-8?B?U1NYOXdkam0zL25TdFR5MjdsVjllOGk5aEtHZEhaQWJ4elVMRUlnS0xQVjVz?=
 =?utf-8?B?SmsyVW1ZTzZJd0VOZWJKNDdWVnBZbkZZUnZtcFRjZHZMckdFVS9iNEZ4WU11?=
 =?utf-8?B?cnhNa3pkQTl4TE05NnM5dTRKcUIwbUFGdi9JTkNkcktSNE5vRkpDWit2TzhH?=
 =?utf-8?B?a0dXMU9QSkNZMkMyakFpOVNOZnNyQ1YyNEk4cisrZUdoREcxckdWd1BpTWJG?=
 =?utf-8?B?dE5Qa3k3d0NndXZYWEZKZ2Era283SWJLYmVFUXpIVWs1Y1VzV1BqL09mUWNF?=
 =?utf-8?B?QTF0SjZ5Mm9XOGx5d242YnUvSnFIYkNqRlFxcFhkVWo5S1EzVHdXK2hHczNm?=
 =?utf-8?B?QlU2VDVyTlJDVVdLU1VEZHkxRGlISHZnVk1EUWVXdUJhK3lZM0NvVkl5Y2pH?=
 =?utf-8?B?YzdyRzZIT2NZY3JGTTlvSTl4V0JFaHM4ZnF3K0FBUCtscktMS1FESHZEYWVk?=
 =?utf-8?B?a0dXZVIzRTE1Z3NmK1U3WUFTcXFUMWo3a0VuWml6QUdLN1h2Wm9DOVh1SWk0?=
 =?utf-8?B?K2ZDTXRNbDBjZW0vTjJJajJ2SkdEZUc2Qmo1d05rdk55YytVNUkybGEvRkRJ?=
 =?utf-8?B?eUFoOHJucXI3MzNQVEYraHJvaUJVakNDaGZNcmNVMUZLY294RStwbUJySVpj?=
 =?utf-8?B?M3I2cFpnYUtsSVVlM2wzUVVYOFpuZ09aVERaZWJwUXdsNlBveFhaV0xwTktS?=
 =?utf-8?B?YSt2R2M1cWVBaTBSVTl0bTBRaHkrdVQyZDZ2MTR0dGtLZ1FDa0ZOVnp1WWh3?=
 =?utf-8?B?UEhONks2MG42Q25mSTlBekQ5UmtySHVLQ25WbWNOdjlTMi9LU3RIejd1b0d5?=
 =?utf-8?B?OW14aU5VY0dML2dxNHRHekYzUE5UOUNTK29PcTU0VVhFWFU1KzRXTU40aFNi?=
 =?utf-8?B?ck5qY3JiNktRSDIzTHYzNzdGVEhMcHBoL1RZWHJJbXdSVWJUT3FHeFgwNTRT?=
 =?utf-8?B?bE1RQWRhYkZvM3RTNG1mbVFBT0pMaUozSmp3cjVRMHFyNUI5SHF3VUZrcjdC?=
 =?utf-8?Q?ngpdTpRwAxWngtp/2JKuNFN2P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df0511d-74e0-498f-a3c5-08db25fc2338
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:55:05.7364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfLNmGy0kAK8XtcivhW/yOrqwTdr3jrv3rDoPpiqKu3LCTbo0I3EzNEzX7JPnUObt51OjUe7yTGBWxu6a/WepA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9710

On 16.03.2023 01:44, Stefano Stabellini wrote:
> On Wed, 15 Mar 2023, Roger Pau Monné wrote:
>> On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
>>>
>>> Use new xc_physdev_gsi_from_irq to get the GSI number
>>>
>>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>  tools/libs/light/libxl_pci.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>>> index f4c4f17545..47cf2799bf 100644
>>> --- a/tools/libs/light/libxl_pci.c
>>> +++ b/tools/libs/light/libxl_pci.c
>>> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>          goto out_no_irq;
>>>      }
>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>>> +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
>>
>> This is just a shot in the dark, because I don't really have enough
>> context to understand what's going on here, but see below.
>>
>> I've taken a look at this on my box, and it seems like on
>> dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
>> very consistent.
>>
>> If devices are in use by a driver the irq sysfs node reports either
>> the GSI irq or the MSI IRQ (in case a single MSI interrupt is
>> setup).
>>
>> It seems like pciback in Linux does something to report the correct
>> value:
>>
>> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
>> 74
>> root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
>> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
>> 16
>>
>> As you can see, making the device assignable changed the value
>> reported by the irq node to be the GSI instead of the MSI IRQ, I would
>> think you are missing something similar in the PVH setup (some pciback
>> magic)?
>>
>> Albeit I have no idea why you would need to translate from IRQ to GSI
>> in the way you do in this and related patches, because I'm missing the
>> context.
> 
> As I mention in another email, also keep in mind that we need QEMU to
> work and QEMU calls:
> 1) xc_physdev_map_pirq (this is also called from libxl)
> 2) xc_domain_bind_pt_pci_irq
> 
> 
> In this case IRQ != GSI (IRQ == 112, GSI == 28). Sysfs returns the IRQ
> in Linux (112), but actually xc_physdev_map_pirq expects the GSI, not
> the IRQ. If you look at the implementation of xc_physdev_map_pirq,
> you'll the type is "MAP_PIRQ_TYPE_GSI" and also see the check in Xen
> xen/arch/x86/irq.c:allocate_and_map_gsi_pirq:
> 
>     if ( index < 0 || index >= nr_irqs_gsi )
>     {
>         dprintk(XENLOG_G_ERR, "dom%d: map invalid irq %d\n", d->domain_id,
>                 index);
>         return -EINVAL;
>     }
> 
> nr_irqs_gsi < 112, and the check will fail.
> 
> So we need to pass the GSI to xc_physdev_map_pirq. To do that, we need
> to discover the GSI number corresponding to the IRQ number.

That's one possible approach. Another could be (making a lot of assumptions)
that a PVH Dom0 would pass in the IRQ it knows for this interrupt and Xen
then translates that to GSI, knowing that PVH doesn't have (host) GSIs
exposed to it.

Jan

