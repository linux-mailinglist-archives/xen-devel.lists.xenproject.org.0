Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB7785090
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 08:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588927.920575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhFY-00041B-3I; Wed, 23 Aug 2023 06:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588927.920575; Wed, 23 Aug 2023 06:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhFX-0003yW-W8; Wed, 23 Aug 2023 06:21:51 +0000
Received: by outflank-mailman (input) for mailman id 588927;
 Wed, 23 Aug 2023 06:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhFW-0003yQ-Ac
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 06:21:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7d00::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 577183ed-417d-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 08:21:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 06:21:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:21:46 +0000
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
X-Inumbo-ID: 577183ed-417d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAVrEWrUWZsppHqnu+kfpd5ybnHTRAqrjU3LqJEW/ISlJwCs9M1FIsV7wYlElloTQmOkCrQ35sz85rXFfqyuIKBS7gJUD5oOFKSppbPnFd1TiBs5WNdj1jo5/681+FYofflLHt/mXL7Ep+R6s2fkwouVKmn7gLqiJgI7jqAMvk809hi8VGrHN+QoGrUu4tlIUj0VHTKGhJHCYq6GFjaknSe1gw7AD2hO7ik9jRV/trbK/TUyupSPsnimiNjLvy+FvOPBpgXQ0d1owdbXa2c82djA4njuCe/fH+7n/uux79fvodd94IpipWepcs6o2KJ3+xCR6CImAYW46DoC8EaJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyiwMAJTlgMP6fFouvJQ5uXVFFxVGZmBdQArCVEfQ8A=;
 b=JCAjQ8VEoJf0n+AwLjN+Qq5g3LGZwQQXBFU6sqCFXfZ3QMIbWN+uysuLLAfgMGMj0Q65jM471qEcE8Cn/vNgXT9pioLAAL416+ZaAphyLqlrp+CNR/QSZwQZUREECNoAV7rhxAwgsLKrMosI2x15lr5Q1s/osQ/b5n0N4pN5yMKDyXe1PE2X8T+ObyzJsZam8I0s2nsjvSaaf5ehv5SWfYXHpX3+KGekQu/eCsqzDQi1ybFS/UVpkHY82vFImD84D1ep58tRStR54J87XPIYWeIYJsbJtlKu9wTIvhobzi3Zd+D2Ldj9JOSeqsD1ajOeyTIcKFuzSEmNrOGmEKO/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyiwMAJTlgMP6fFouvJQ5uXVFFxVGZmBdQArCVEfQ8A=;
 b=kbkE+GdF0VudVSEOPpAIdK2diINtsJNM2GcJy+R+t9eZMtoN9J4+O9oljKyogo/1ahLqvFgygOXFxsG0hJaeVVCj6l3WHk6oAWB7fUWv3eZL07EW/ONRbOolp7Pl03jzB1rzb1dYfz/VyfQjFGbbhLcgEXS4RZTBnUGIGqQKrFZ5yusExtRoKGxQ6vAmALJOFzVknvfy4OpoxC0biFFuI+RAWRhY51iC+GBXbmPRUwrRDxftgwjpDTSoTIp0jL0T/v4RriZ/sA8ZtH5bZst0Vv52d9MyVKRCRhANBgjfYwy9A6nVnGMEWIox/P10vj5Jp9ven4hVR+3oZhaaZgm4bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d69f21a-2043-05f7-7f6e-7c368d975e94@suse.com>
Date: Wed, 23 Aug 2023 08:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/4] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-3-stewart.hildebrand@amd.com>
 <31d4ae2d-1b25-b272-a5c1-2fef3dffb7af@suse.com>
 <e5bedf64-aeeb-2e10-7684-7e46590e92e8@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5bedf64-aeeb-2e10-7684-7e46590e92e8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 5671ffc2-d5d2-4fec-0fb5-08dba3a139ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UmmWKt9R7z3JQSyDG+aSC1uUT+4pswn3ioHaNyFmlG/fPn9cue2h6NmlSKaRPurMWXPuN4qiw1X3izAm2HQHDSA0MyZJRkeR46zMlZSOfbVy1RD7nGcs8yjxcb7vlws/vHorG02dZtkmLUsXoTU8ZFi/FTe5vBWBZLNUjImmXozGljPsGqM/KYF6rseDXEP07LRbLMBCE6ozyW4s90WoY+Ufo9Qm2iLurro494MW9x60WrcOy3rQH0hsnI13S4E1VzwRav2qq7y2wK2HeZEyu4SAXHGGRxTLpIZy9KARPjjiqju3JitJ52lk5EjLT+DlV154oaWqS92n8XKoYzMnOgFhBX405DtGxtZL1zjRQQ4s2dms/52m+3zPgZMFlJSykfmD+6T3Tmrg2r2e1YRxbUgb96ksA0xZnfgxO+sFTsD+Kboo3amxT1IfantzCdWp907F7DyzyWBJbze9DlUdZsSeyL8LJ+9v6FlXcbvHvB+3QOucpVD/cYM9moMqiQdZh//lHe/52v+V2OajhLs0EtRh2VyI/xb7v7uRwl6HgK0BR1Of8BqxKdENIeRmx6QjxFXC4L0ERr9ZvK5H8NoqE9IHkhVpXK+yWaJBbnlmFCZ045BmcTEoBdJeamSiurd5tO3LrfW8BkCqJQtF6ZsrOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(2906002)(7416002)(38100700002)(6506007)(53546011)(6486002)(5660300002)(26005)(31686004)(31696002)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6916009)(54906003)(66556008)(66476007)(66899024)(478600001)(6666004)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzMyU003cGUwQ0FJSlJ1YzBpRC9JOGp1S2NTVkxxZDFZbWliclRrc2lINGds?=
 =?utf-8?B?NjduNFBwb0EraUsvV2grbzZCM1hKOWI1dTkza2Y4dU82VE85WVB4WG9LMzc5?=
 =?utf-8?B?akFrWjdBU2RjZXlyZkxDVmpJZGM4eml3UWZxamg0RkwrNjU5cW5pT3YvL21j?=
 =?utf-8?B?RWtmK2Z6OHpHeXNkdlo3NWI5TzhwOU1FUW85dFVDNEtuTjE0SGNXdWtEZ0hj?=
 =?utf-8?B?c09xNllIZDNrTFkvUjhURFkyMXIzUksrcWN4dm9rWGQybGI0QW1kNGw5Z0Vm?=
 =?utf-8?B?c1JVSXpFdnAvMmRiWExON0FhYXgvZUJ4U09ic2c5d1phNHdnckV3OWI0K3Bu?=
 =?utf-8?B?bXdpalc0ZTBBUlNWMTgyUEplOGwvR3o4K1Z0RVludjFQbzM4enRVaXI5dHZB?=
 =?utf-8?B?NUJleEduaUhFKzJ4RFArNVk5VE1QbkV0RUZ6V3lzdEEyWG4reWFJZVlpbjJR?=
 =?utf-8?B?dFFLYmw2Rm5wdDhIdGppWWlJYVdyMndqbHZRYmlqaVpGa2tyMHV4VGx5WlNE?=
 =?utf-8?B?KzhqQVcrcFdqb2paMHFOSDcrV0kxcUJLRkR1UlhIR2tucTJUOWdpWkQyQzBi?=
 =?utf-8?B?WlZweFhFRTA0QkIzVTBMclljWGs0Mm1BTzJLWkJMdEEvRHJDaEpOMzlXVzRC?=
 =?utf-8?B?aWtpeGoxakZ2NGdHNG8vcHRCcFAxSTJnc2ZMVXNMQmRBbFhiYjdpc3lFbWd0?=
 =?utf-8?B?ZmcrVmFMcHpTcnNDcTZDa05JN01JT2lGK2RlQ3VHRVdISWFrNkx3MHNaK0lk?=
 =?utf-8?B?eTJ4Wnc1MWtxL3F5VXQyWGZ3b2VPZlJpNC9vNDRMNll3akkwYmkzSjNibEFK?=
 =?utf-8?B?bGhKMGd1TWhocjhab1o5R0FXbVAvdjc0LzcvdmEwbkJHOUV0RHFLZWJPZW9Y?=
 =?utf-8?B?a0hqRlExZE0xVmNoRktoMjFSb2d2bnNhYzVRWkoydnAzS09xQ0xoNWd0MGph?=
 =?utf-8?B?a3hnM2ZBSzdTTHkzcysxMFpoN0kxSXk3QmFlVml3VWlYczF2MVI2TllDenJH?=
 =?utf-8?B?OWF1Q1M5cUgvbVRXMFF4VmJDczhUdldxcHA2ZlhMenRCc2xDUE1zT2xKeUFF?=
 =?utf-8?B?VURnbnpRSVFJNldDbjRNNVpjdVIvUG5kSFdDZDlwUjBkNjhMSElTYzY4NVRJ?=
 =?utf-8?B?dlpGOGw0Ym9Jd28vNXkvbzVFMmh2M0hoRUliVkkxRG9yMTJjb0JtOEYzcHRH?=
 =?utf-8?B?NGpPSy9VTmFUeVUybjhqQ0tZcTVGNjZnZUtpcnQ1Y1BtV2k0QS9aTnNhSVNh?=
 =?utf-8?B?d01hZGVhdGRkcmc4am5STHQwM3B6bCtrSG1zSGdiOFl6cllWT09hV3g1WVd5?=
 =?utf-8?B?azRpZmZDcnFiQ0FMQ0NpQWpwWjZJdGpYMWZUeTc0OFlrd01OQ0JNMlhkRmEz?=
 =?utf-8?B?SWJjRkJWTXRNTVk0TDA5SzJnYzdGa1U0ZEhObjd6RmR4K1pIQlo4NTYvWjFC?=
 =?utf-8?B?czIvZjBwblRCNzg4YUpnU2VETWxWVUd0UVFHK0ZJS3NEaXAvb3RTMnQxMnlu?=
 =?utf-8?B?Mk5MdG5veGQ5Nm43dWlibmRCRitqR2Y3eWxraCtkZmVQMUNPQld3VlNzY0Fz?=
 =?utf-8?B?WmMvdm5kSDNJNzZmWHc3UFM4VFYxcDNsUGp6QTRIYm1Dak9Kd3NudjdJSnMx?=
 =?utf-8?B?QmNTT3dBbDNFbGsxRU8vWWl6OXZGOWZaMUh5RVdrSEg1c1U5eFZnZ0dMaXRQ?=
 =?utf-8?B?bUVEa0d2b2hGWGRTWFR0UHN4UUtsWHJVNFRIdVVtRTVhV1Nxek9GVlUvSTEx?=
 =?utf-8?B?M2I0WDB2OW9RQklqeW1hUGh5ajFySnF5UE0zalhQSHo4cUErOUhRcko2Z0xR?=
 =?utf-8?B?M05QcERVQS9IMjRYKzkwWEdQTnlpd09UNVFra0VsYjRnWW1sVFluK2VaYm9H?=
 =?utf-8?B?T1VtbnE4T0dkL0FnLzFrQXFuT2J1MitlTmpKVGdMVHZOOGx3djY5d1AyaGh2?=
 =?utf-8?B?ZEdWa2k2R3N4V3JUOVhFVDM3dXc4TFFmV210bUI5NXdxRVJBRDJuUVRsYm03?=
 =?utf-8?B?NTZ4bGxFcGtqZ21QVllyWDBTSTArZDQyRDNvS3c2NnU5eW1oMFlGdk92S1dl?=
 =?utf-8?B?SUVSN0hrRERzcHVnQWtwdkkwN2JXamRXYzJNRnNjSDdHR3JqYlZ2cktOMlhZ?=
 =?utf-8?Q?Uc5KDXg/lVtQyJZrte53K+IR7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5671ffc2-d5d2-4fec-0fb5-08dba3a139ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:21:45.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWwXLTLYgqbTgBYpyb4+zwlSYKxVk8wjRfB/LCoVLVCJydkTsK5gzjw/OulsbRN2aFk/8ymaQleii5Ajp2HgIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178

On 23.08.2023 05:03, Stewart Hildebrand wrote:
> On 8/22/23 08:53, Jan Beulich wrote:
>> On 22.08.2023 03:29, Stewart Hildebrand wrote:
>>> --- a/xen/include/xen/pci.h
>>> +++ b/xen/include/xen/pci.h
>>> @@ -193,11 +193,10 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>>>                     unsigned int devfn, int reg, int len, u32 *value);
>>>  int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>>>                      unsigned int devfn, int reg, int len, u32 value);
>>> -int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
>>> -int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
>>> -int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
>>> -int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
>>> -                                 int cap);
>>> +int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap);
>>> +int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap);
>>> +int pci_find_ext_capability(pci_sbdf_t sbdf, int cap);
>>> +int pci_find_next_ext_capability(pci_sbdf_t sbdf, int start, int cap);
>>
>> The remaining types want converting, too: Neither fixed-width nor plain int
>> are appropriate here. (It's a few too many type adjustments to make, for me
>> to offer doing so while committing.)
> 
> Understood, I'm happy to make the change for v4. Is the following what you'd expect it to look like?
> 
> unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
> unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>                                unsigned int cap);
> unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
> unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
>                                           unsigned int cap);

Yes, this looks correct. Thanks.

Jan

