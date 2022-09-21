Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0345E546F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 22:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409886.652887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob6Bi-0001cQ-BF; Wed, 21 Sep 2022 20:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409886.652887; Wed, 21 Sep 2022 20:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob6Bi-0001a3-7J; Wed, 21 Sep 2022 20:19:18 +0000
Received: by outflank-mailman (input) for mailman id 409886;
 Wed, 21 Sep 2022 20:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ob6Bf-0001Zs-NR
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 20:19:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a865969b-39ea-11ed-9374-c1cf23e5d27e;
 Wed, 21 Sep 2022 22:19:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7788.eurprd04.prod.outlook.com (2603:10a6:10:1e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Wed, 21 Sep
 2022 20:19:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 20:19:10 +0000
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
X-Inumbo-ID: a865969b-39ea-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkdjXtIWCMEZTkRx8sQuqxlGAqq8QihihTCxUGwFltF3Wv+R2nxHBWOFyn/FMQsQ0jivI+I/VULkMbU49JAJuxRyqPjt1WbTDgaZsWGnu64U0dye7JzlsqXWL+PPCLVAXyJ7RKlpFNiTmspGn2TC/kf9Fh/i50isPU6EhoMp1Nszb6f37zO8T5PMLcAg6XyKj53v7Q55ntDilctCqxW/murRz2Ka+tDUOCs7ajCC2ZJMEbFMQk8VZ3gz5H4WYbwNFkp1iq+gOi7/Mx5Ws32d5e9Q6rtZtqLTQ6PcQIu53QYZGAuDp2ltVVavRrLl3y7fO1i/lKzhE9bqTfu2WwGZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JTEXtZ4eUxTaNfILWR9YdcZYL1ClHMAeGYP0olu6yI=;
 b=GyUQzDUQo4ETHQ7H+VfUavP4pPR/9I5yYb4QbbzLyLjAdIq4ro2369kwq3cj+Dx4ZidCHTEnNZs9wjZq7oirHYZHOG8PBMao/MF7W5IWHxnd6RXbSAo9HulttEYCgh2sq2lWIvpnviEn26x4ubZH6OO04vUrcSJ3grmjXO81ip6ETYNIpO8qhWbb3V8kacuDSt5FvoP/63tyQNdrjFPU9lRBKeYoFK1uWQ8K6iaUiSWgfF40L8yNv4u5CMKKfBNLkio4N0aVkcT5BeSa4lO0z7TMccrhmKUVa1uC2bsP9YXqZFX595S/AGsvW8rqT749AVhiCHZbZOfQBTG7zg4jhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JTEXtZ4eUxTaNfILWR9YdcZYL1ClHMAeGYP0olu6yI=;
 b=xtWe7JURghnK3WdJUL2J2kjT/Q5h0MjVfa4NWTG4lpiuO0ThMUkTMx06QZD9n0u8csMsIWEuNlbPbFRsVowQUSLxEwCvmyO8bvyYaE4RoIK+aysNvfgW04PmVPfbvFWmpNy5LUn9SCHGO5BIiBdelXZzdenwCWO4VsJdGcGy4rtw4guH21rqFlr67bmHDvaigImEXnwHMhekt+5IqMA0LIclSKSL3eS8JPGq7KsRsqYO/zGLgMtNsRW0JwuDg6hObHqKBqiWbLLdsc/mHJ6B5VySbDqthWAUVL1NRSg5Y8mgvke85Ia1WhBYdUEcSg1sUSjcbaeEpbkrBAglCKUz/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <404f9f21-f5df-2994-76a7-c660ac8b3aec@suse.com>
Date: Wed, 21 Sep 2022 22:19:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Design session "virtio"
To: xen-devel <xen-devel@lists.xenproject.org>
References: <YysZui79+X9myhFJ@mail-itl>
Content-Language: en-US
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YysZui79+X9myhFJ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bac184e-b832-4b77-285d-08da9c0e8b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I2pDLl5/o0gq2q3CCStPTkhHsNaRBNHtxy7JxrpJlO/5oJJxlb8i+ElDGuPGLYbJJOJdoWV5V4aAhchSXIP4jbFzlFY8KY0QuFvv5OxvNkO+sdgFRt/YzVa69WlKffrdtiN0/Q5cZ9/3qoL0UFYVt+ilwRVyw7PmRIMzbcA+3SKzIdBi6oB36GviUTXhb5eVhwgu17pDIzACbun/8gVIbFnxnMGWfQg0llAHLz5HjhuLTBq511g+Y/w5+RD3rK6K8AtH5iI4CYGuemyWW5YAsmU3gh2XhLL9+KI0j3Q+Bbw09wZkEIOC/HJ9wbOLFDGLWnauQizIFS24SwFC9N2NRewlpWSmlbwOFTnDE405m4g8C2AP+SKioDh2fwFPHJgGkNxBDT0G97ADi6PmtETZABgD9CK39WY318eHbDpDIy5XuyELIb7JoWQmfgS2lvwxEhiD1TIlrDtlSnG2n7hIgFDT+kTAHE1ox9bg6F4PNCyaNxDreXh3HU4W8wtK2hrdWK+gSC+fSk5+pBAt2tC+/dBGKZWuBFFDQuh8hg0HBngiF9pyRgB9nmb+lvfgHAmPEyVY+FW4eDBzXIBw1Q3LwkgSfvGSDDdm8Fmtaq6viJGWoxbTtbF0Dh7jx8NnlKLCgCp7Q1RYjwIStFQ4K5/Hm77U28rWCpaYfjq4AUdojANQJym5W5xZexiCrpiYWTcTydv6s/6MbWvTMieH+0Kp3j209bbxyV4qgXvfVZi5JJkWAZ9LIeqiHl6qGQXdVnAPBFX84luBRbnL3XqChBBuw2Pc81UFrV5j3ogehNSwG2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(5660300002)(38100700002)(83380400001)(8936002)(2906002)(186003)(316002)(2616005)(8676002)(4326008)(36756003)(6486002)(478600001)(53546011)(6916009)(26005)(6512007)(31686004)(41300700001)(66476007)(66946007)(66556008)(86362001)(6506007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRyY3BuSWlibDlZT0VyWFU3QnE5S2p3Njh5a2xvQmlObXhnZklpWlBMcEg0?=
 =?utf-8?B?S3hxbWxsZ1lQSEtnVjh5N0EwYkM0VXR0bUVCRnZobjVZMzFLdUs2NCs1aUpo?=
 =?utf-8?B?Vml0SXZEa3RCY0FGNHFKKzhjcnNheXhQci9Gcy9qSTNLVTZYTURyOS95Qmda?=
 =?utf-8?B?U3RkK1FZbzN0WVBkSkdnSWFPbDdEMWFydUUzdXJIOXdIVG9IWmYySHdwVXh3?=
 =?utf-8?B?OGxmSWFZclVyNUNSS2ZNR2RWT0pJbGFQb2FhRGVXZmF6b3ZFUUMwV0ZBd0dh?=
 =?utf-8?B?dW53NlVDdFZxUzR2bnFHYnRCSXp5bXg1L1kxcUhkdnlCZHRzMnFiU3AyYjlN?=
 =?utf-8?B?V0pMSzZVYTJTcUxJS1had1NQUTB6ZWNtNGd6bnV6eTFPQnpzYXBjaWNFQ29B?=
 =?utf-8?B?QXBSZ2VYTDNBQ0RoZTJBWlNhcmY0aG9NSkVtYmZwYVl1ZENJeHhyUTdNNUIr?=
 =?utf-8?B?OGJtM1pzS3FSK2VTaXBvR01RUXcybE5ML2h0THRtVStMeTZZeFN2M1NzZTVx?=
 =?utf-8?B?Z1hVWmE5NVFqQUQvakpyVEFhNXMyMUZDdzhneEMzd2Q4aDlEOVE1aVBtVUhU?=
 =?utf-8?B?cFdMcXQ2bmlmR05Ybi8wanFiN1dYUlVRMjduUUNGd2NQb2I3dWFGREp3WGZQ?=
 =?utf-8?B?eDdscXVhQjl0UjVRdFQ2RDZSTndxbVNCYlFrUWNSRWhuUlU2MURHN1QvODZK?=
 =?utf-8?B?NE83SUZWU1NjWmRseDBEU0IrQVNSYUpkTWxsUWhZNVZEMGlMZkpvVTBqam80?=
 =?utf-8?B?R2ZnN2FOOGxVZFpHWTltcnQrbDdDeXZ0TVN2Y282Vy9HVGZFdWN0RGpDZHBa?=
 =?utf-8?B?dUV4ZnBxYnRRckk1WnEwc1hBK2tFZ0E1L3ppYVFrdWlYaEk2YUsxOFB4T2tj?=
 =?utf-8?B?cGw4akdwNGlnNVBoU2NwdTZqekh2R20xSHFHK0grczBHSXJGTU5UckkycURk?=
 =?utf-8?B?TXE4dGlNbW14ZjNxTkVWemk3Z2pwand0VU5MQXhhZjU5OEFsdUY2MTAzZWU2?=
 =?utf-8?B?WHRRNWNxS3dqSlcyZHg2TStTSWdmeFpQTHl4Z2FVMzdqaTN0U3hCVXAxSVJK?=
 =?utf-8?B?cEtaQlpwMWxpaFUrUVdPSjQ5RlM2d0JxR3gxQU5BaU5IdEplQkhhNTd6ekJD?=
 =?utf-8?B?elpBNWxLNVRQbm9pSThHZG9uOER2R1FUbGNOekprM05mcURtS3QrbXc0YVkw?=
 =?utf-8?B?S3dKUncxZ1djZlJNaGx2NEY4NWF5U0pTMXQwVUYrenU0cVd3S245QW5wUXQ0?=
 =?utf-8?B?TjkvcDY2Ni9va3VIWEd0dWw3SXNpVVF0eVVWTXc0MFFkRXQ4QXhWR0xyaUFQ?=
 =?utf-8?B?T3l0YTVXcWRQT1FKTjFRSDd4R0tGcEo1ZFd5cElQNjlRcFFjMDJ0bUtxSTht?=
 =?utf-8?B?VlI3SFI2a3JoRGdYODl6WVJyT1FiNWNBd3NTVkZEVS93a3RITS9TQWExQ3hp?=
 =?utf-8?B?U2RPb2lWU1hObkcybVQ0TjhwdlBHK21hcmRjYVg1TUtNU3JMbG1FUVNOcGFq?=
 =?utf-8?B?b05NUnJzdVZOOVVlWitJN2dSeThGS09VQllYZi9xTmRSWFNvWGdOaVhHSG9s?=
 =?utf-8?B?Z3NKczh6d0UzTWkvTU5Ob0JJaFFSd3JxcFdMbit1cUc3Y0VzbGY1NGNTc3N2?=
 =?utf-8?B?WGtJU29mQmpUNVdFdE5zVnlIY1htQ3BYSEFtVVdKaUlWd3pUZlVHbWMvb08w?=
 =?utf-8?B?RlE5ZWZqaGRpUlpuS3JIMWlrdmg0Y0NDMit6cXNncitWSzBYZ3dLdU1CYnBW?=
 =?utf-8?B?dEZ4MVdCcUE5cThZTW5CcXpCM0h2TEtkNXYySUFRRlVQclBTSk1IQWdLTm43?=
 =?utf-8?B?bDEvNzZFOWxqSC9lcGxESVppREhGN1dkaVZtanhoTjM4SzNNRGhKRm44K3Qx?=
 =?utf-8?B?ak1KcTdnWXlZQlZJMk8yK1dYR1cvKzBaMzh5c2JSa2h3TDV5QjFlNXdSUU9z?=
 =?utf-8?B?OE5yK0d6TVJHcytzalcrS1BnUlp0SVhhR1VJb1NhTm56TDl5ZjB1TmhVWGNZ?=
 =?utf-8?B?elVmb2lqbWNxb2Q0b0J2SktVLzJFK3pUS3dIRDk5WW40MmlHQmk2OWZFejVV?=
 =?utf-8?B?ekNlU0RJNGZwcnNJTTI0OWtib1BJdElTVDA0Z1haV0xYcmtjNkFBMUwvOHpL?=
 =?utf-8?Q?MVVIGUORqj2juDynobRIp4Xxw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bac184e-b832-4b77-285d-08da9c0e8b46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 20:19:10.8014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbWWncWqbljziX1Tnp1x8TNF0FjDYevYvRw/vmbiTn05HtVlWVPM4qp6ZYSHomMf4VC54Ap4l5+uMT2V+fj4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7788

On 21.09.2022 16:03, Marek Marczykowski-Górecki wrote:
> Some sparse notes from the design session:
> 
> Passing backend domid ideas:
>  - via xenstore: good - can be done now; bad - requires xenstore even if
>    only virtio devices are used
>  - extend generic part of virtio spec: takes time, but otherwise
>    preferred
> 
> New "config" virtio device - for configuring backends
> 
> Hotplug:
>  - ACPI (for HVM at least)
>  - xenstore
> 
> 
> ACTION: Start the virtio spec change.
> 
> In the meantime, use xenstore(?)
> 
> qemu parameters are device-specific - adding backend id needs to be done for every device type - both at qemu side, and libxl side
> 
> Device endpoint ID are currently allocated by qemu - for driver domains that needs to be moved to the toolstack, to reserve space for devices running in other backends.

Thanks for the separate notes, which are certainly helpful on top of
the ones I took. Plus I'll admit I was struggling some with typing and
listening at the same time, so I surely missed pieces (besides
likely also having screwed up here and there). Corrections and alike
appreciated ...

Jürgen	- working: frontend/backend but no connecting
	- prototype using device tree
	- generic solution needed
	- ACPI (on x86 at least)? DT (dynamic)? Xenstore?
	- for frontends: limited but generic xs entries (central driver)
Marek	- Isn't there a virtio mechansim for figuring domid?
Jürgen	- would need extending virtio, also for hotplug
	- ACPI (for hotplug) not an option for PV guests
George	- concerns regarding the use of Xenstore
	- at least for static configs it would be nice to do without
Jürgen	- option: new virtio device type for passing config information
Marek	- Use PCI IDs or alike?
Jürgen	- potentially risky going forward (compatibility-wise)
	- (excurse to some KVM side aspects, which might also need e.g. such
	  a config device for certain purposes)
George	- Is there a config device already which we could extend?
Jürgen	- No, new type needed.
Roger	- vPCI usable (for its config space)?
Jürgen	- needs extending the virtio spec, preferably for all devices to
	  represent data consistently (which may take long)
Roger	- Use VPD?
Jürgen	- still in (global) config space, hence needs specifying
George	- Transitory alternative until virtio spec was updated?
Jürgen	- backend (ad ioreq server) params perhaps best over Xenstore
	- if PV, ioreq server would need hooking up (if to be used)
George	- PV requiring Xenstore?
Jürgen	- alternatives are (in theory) possible
	- Result: Aim at virtio spec change plus introduce config device
	- Intermediate: Xenstore?
Anthony	- Prototype?
Jürgen	- xl/libxl changes needed in addition
George	- 1) dom0-only + all grants (global), 2) xenstore (which would
	  want to continue to work, once 3) config device is there)
Anthony	- allocation of PCI IDs currently in qemu, want to move to tools
Marek	- How to launch backend in drvdom?
Jürgen	- one config device per backend domain

Jan


