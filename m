Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA37495CD
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 08:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559620.874748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIf2-0004ST-Gt; Thu, 06 Jul 2023 06:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559620.874748; Thu, 06 Jul 2023 06:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIf2-0004PT-D4; Thu, 06 Jul 2023 06:40:16 +0000
Received: by outflank-mailman (input) for mailman id 559620;
 Thu, 06 Jul 2023 06:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHIf0-0004PJ-Va
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 06:40:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b34cd5-1bc7-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 08:40:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7108.eurprd04.prod.outlook.com (2603:10a6:208:19e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:40:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 06:40:11 +0000
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
X-Inumbo-ID: f5b34cd5-1bc7-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drJ+2L/69BDEbUsgdqrqwhS0Roi8duIxv6n0r+tXhFqv6poxyKm5ULBqC6noV+SLleS2sWw2kgcOYFay3GZGCZQQlJ1NF6S+tko/E7AnCwQX6QxE3g+6rzoOFsx27dSlfJCW3iaA7KEcTbgzJ9wGBpeEaRw6kHHYqgvAWao83ZMlg/51XneFj2AFjNb3dgxfA0hAUIfS01RfMc2eI28gVNOrI2VEZItJ5YfMLdsqEuJPTOQo10692ILivme/EIql6F6Mz6DGl+RxMA1Lw8sc4mEJB+6Xehxxf7a6omvivYjttW97M7uLfikGWIBgvs+YVNquJ1SCcrU4N7sQIoGZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1bAXBIljCermuSp5k0xbELbiX6Vm0XgYNfSgB3Om90=;
 b=igwPotojeLX0fNKSOgkGdChXGrC6uFrOqJ9SWxRiXC1rQYTVYDp8icsVkoxlyr22Nmcw5w2XiqJii4RJWsFebRJzpM0lxBKWtMmsuU1XmnprJl+IOnyUHETKDqqghoVn2maacQjVexcaw+CUVoVfxAAxYvwU7KPNUDoHnv/eVPuvgTU3RH3NVBaMQX3Y3XBPMI6tzuqcVO/K0vmlUUNfehuaw3+pc70fzfwmxY/xnUjO+F08eOVTb5upXY/abVJUAY+bQF1Q4CNXOeaaOs8Q/iJ+mWAjhGvXOu3n9K4GUE2qL5dm5laWIMRoYEkVFE09tq7eMMdbGXRPqqbJOHzylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1bAXBIljCermuSp5k0xbELbiX6Vm0XgYNfSgB3Om90=;
 b=tvAzC7sw0whiSLH6M+4NbK1aP+vaxYAOpCa+o5C/8G5YKINJmNPp1uI2mkLZN9bjGAB0Cg9o5UteFK52bDFsdOLsBRx5tmwdRgtKH0u7QwtoQQbihMylaxKxIhflvR4Zdc7KflE2DOfw4OJMYDKHEwyTLHWm+rh04lXB2DhxEEx30NYRRzu5v35LBMqsFIHqWh+OJwY7nZlkL0r0+l3L3sJ4LV4YqRCvlilVsxu7cwNau2GYbAzpwY4IQvxWtAuKCllmDyVv8kM2cL7aPjWw3hOhhX3PRwYnoOIruxnAh8qL2UreT+uBp72mnJ4uCDm/zRZvCQa6aj39YzLV/oegAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2a52a88-a8bf-3e14-f3f5-616177c3d807@suse.com>
Date: Thu, 6 Jul 2023 08:40:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 4/5] x86/x86_emulate: change parameter name from 's'
 to 'state'
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <8c8bc96b96a1111a4651f970f506d304809ea40d.1688049495.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2306291230500.3936094@ubuntu-linux-20-04-desktop>
 <e7af3c85-92ec-7d0f-0e63-3a1e5d65877e@suse.com>
 <alpine.DEB.2.22.394.2307051544340.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051544340.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eac04e7-ed79-4062-7e86-08db7debd8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQYTD3iCsmmNWwunbIZwGgbEjacPl9w3JDo/Bjfm9BO1eAc3ZrhlmOmshyoVe98ViPrHyUME/WxGQjzw4zfx8vuNweMn9Rl206sqt5feffv2fRQsmyztsQ7lDtU9iHAX6IcQaJJmdC6j0psEDOh4MBM+QcwMk0rG5aFQspcan2iFyF0oMnoa470bs+KXbiqAJ+BFzuzyYuceUagoPgTN5HmbL9dUIsXTuTdj6H+dePWTlSdExpPD4/jGJClmatEuzqpTDgLClxcwQgEnZBBPINVdiA4GhMXona/FSqP1V1JURg/1obPeGJm7b38aAODU9c3YbyzAEOVxy7OK2oYjiQsmSBf49ZmJAK1Z/q0ZOm0XX1UaEjnBTXnFE3onC6uRTGnmdAixx8U2TQkwIAZBBjffeDevS6i+A+qtVgqq+hJx3ptBx7La/iIGGWv0wOKLdgmUPRxbbRBW+dM6MOoC3UZ1TUQ6Yau87AFplOl75cWD1QWnzegioeuj0lH+M6f7MWnckSNbDms4EaCWzhD4e4RjBNGOau2yD06q5ujDmbz2DqV+dCf/F95SEWOdL4HilpT3BsqomTmdJZWrtAA12rB7yscS3hKVuYqY8kmd6b5V2tcV+edL9tfGSYDEnhtH3aNgqjtpeV/9zSHkBQUN8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(2616005)(54906003)(38100700002)(66946007)(66476007)(66556008)(6916009)(4326008)(186003)(36756003)(6486002)(6512007)(6666004)(6506007)(26005)(53546011)(31696002)(478600001)(86362001)(41300700001)(8936002)(8676002)(5660300002)(7416002)(31686004)(316002)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm54aFlNOUFNSUZXU3F1WUtvVjFQR3ZuTGNKNlkraGovdWYwRytKVkJvbUNu?=
 =?utf-8?B?YXhyd2E5RGgrU2w2RGZUc0UzSm9FWWx0NlZ1WXpiVi9LN01RM1VaTm9EdU5B?=
 =?utf-8?B?YityODdRM3hkcnRSN0hIdVdYcGtDeGhIamloMHFnY3FodnEyWHRsWjlUQTRt?=
 =?utf-8?B?V2I4a0dQL3ZTMHRZd29Rak9aNk9sNmFEWjFWbk9xSXAvVVg2VkFqRmNMOVF0?=
 =?utf-8?B?bGFuMFpQR1NtUHZnQmZlK0xROStxRlpPQnVEUDR1K1RmSHJDUHIzdWN2bWxr?=
 =?utf-8?B?VkJRTnZOYzJZTFBoYXZaN3BvVVFtVWI1OXZtdkhocTNQeHZjaG9tdVFwVTla?=
 =?utf-8?B?RWREYkVncDc4T29KOGFCb2NhNmtjMnFDcjNQSkw0bm8xcDRDWUlkbndYUmZw?=
 =?utf-8?B?QllpVFd0STdHempCbjUxSVFLTGNzWllmcWs0OFB6K0JTaUxrM1Y4M2NOaDFC?=
 =?utf-8?B?ZFdBZW5rU3NXNU5OeGFpeDVLS2ZUOFhUVUNuVWNFK0tTT3JNb0JTS3hteGRr?=
 =?utf-8?B?Y1FtQkdwWDNoQTFHUitFYmFjbU5lQWRZVmxteE9aeHBHeWo4OE96aUFxU2Fm?=
 =?utf-8?B?b00xbFZkbGw3YU1NMjdnSEtVOW1qRnhDTGFCbUhia1QrajhNaTduVXhBVEhO?=
 =?utf-8?B?eWNibVZkMERVMXNMck81bGd4MUFVbDNkNmtBS1JMUVNTeU00dDh6UGVLZUVy?=
 =?utf-8?B?RW0zSHgrYTJjY2hucXNYamlJU1Q2aTN2Z0F5VFcxNVQ0R0E1RUgzMVlMZnBk?=
 =?utf-8?B?VnRaSGliZHJxbFZXMjl2RjExODA5aHg3NHp1cjFVdDIvVVVuQU93T0VOYjJr?=
 =?utf-8?B?dTFXb0hZK1JDek9HeENkUXFzN2s4bHVHU04yQXFHMnBPSVJsS01uQlVtSU5k?=
 =?utf-8?B?NE16RXZtOGlYRjRnK2htU3ZGRnkyL2xTZHpVbUNFZ0RYdHhPR3RJQWplTFNE?=
 =?utf-8?B?QVhjM096VHh6bmxDM3Bzc1dSaXlHR3RwV1VyeHhjZEwvMDBkWXZpNkxoa3la?=
 =?utf-8?B?aUJjZW9uVlhHV1JDU1RTcE5zZFJVRzd5R3R0N2xpOWVSYk51eW4yTkhBN2dY?=
 =?utf-8?B?eFBnc21ZQ3B1NTRiemxMdUg0QnZBenpsbmVsQlJaMnNROTg2Rk9NSUsxd3VR?=
 =?utf-8?B?V3FOSXEwQVVsUmpka3FoMmdKenJ5U0dwbng3OVpoK2VRUy9kdEx1WW1XMHIr?=
 =?utf-8?B?UFVhcnplVkNRMlZWcmgxQlI1QnBZM2txSTBzZGc4cktONjhSU25IU3JNdHBF?=
 =?utf-8?B?eGE1bVIrd3NONkt6K01PL3FVYmkzcGI0Ni9NSjYxWGhvSFRUeWh3T29Ecnhh?=
 =?utf-8?B?UGlscHMveHlIVW54dXlJbTNYcks2Z0pDZGR3VzJYMXI0VS91cDVHL25oNmVa?=
 =?utf-8?B?ZUJ1eGlvcXkydmQ4WG1ETCtNcHpXbzBxVVBVckxSNTJnY2tYYjc4K21rUm1S?=
 =?utf-8?B?eWxyS2EwRml2ZkZFUnBLM3VNVU1mZU5xMWZEWDhvSStmb2lpOUN6WmhKQ2RI?=
 =?utf-8?B?QUZwSThDcURZNWhPbERpWHRNL1IzVHAwc3lYR0tzbUhsZDI4WnFySHFFZ1Bx?=
 =?utf-8?B?M1kvUWozRWdTU01tM3FweTIrOGFENGJzb05aNDJiZmwxMWRzOEIxUURub2wy?=
 =?utf-8?B?T1dOempyb3Q4K0FqeVppYWRlL25FZHFlUHlYdUlkbDVwNkNEUWxab0w3NU9F?=
 =?utf-8?B?aWorNkl2cVBrZlpWMEpaSzhUVmpaTWp0MS82YjJ5MjdUU0JxYkx2cDBVd0wv?=
 =?utf-8?B?a2pQd1dBQUdGV2VjT1BPVnRiY0lZdFNBdkFZcmF2L1g2aklBVEdqdFBZU09i?=
 =?utf-8?B?L00zeXYxUFNGM0VSMDNKQUtOUXdnNjNzK0RvNnh6R016VTREN2o2bloxeWhI?=
 =?utf-8?B?akRwblNYczlnYmhkR3E0dXZUWGlJenkxeUxGVklqdytlRWVGTVNIT1Rva01w?=
 =?utf-8?B?SmxzVXlwaVFOeFpvM1JGcWJPNWpxUjdpSmc3Z1hLL3dvV3F0bHAwd0laZ3Z6?=
 =?utf-8?B?dGw4eExlMTc2LytlVHhaTFpZTmhzQis5aFYrd0QxWUhkZXlxVXRhem1JVm1h?=
 =?utf-8?B?L3FIaEwrWWRBVlJzWC80SWFvYmh4WitrRjh3eElWdzFxUFlaUXgxUWdlWTNt?=
 =?utf-8?Q?yLxyHthaCbvO2xTbI/Ck5OzR5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eac04e7-ed79-4062-7e86-08db7debd8b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:40:11.0664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUpdnUW5y5MZ2o5C5flPXKCdaPa35u9MV62pFdjxbCmAKzBNNCgmhLt0D4yH6eIsWckQvMpl05lbEayW0xdXrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7108

On 06.07.2023 00:49, Stefano Stabellini wrote:
> On Tue, 4 Jul 2023, Jan Beulich wrote:
>> On 29.06.2023 21:31, Stefano Stabellini wrote:
>>> On Thu, 29 Jun 2023, Federico Serafini wrote:
>>>> Change parameter name from 's' to 'state' in function definitions in
>>>> order to:
>>>> 1) keep consistency with the parameter names used in the corresponding
>>>>    declarations;
>>>> 2) keep consistency with parameter names used within x86_emulate.h;
>>>> 3) fix violations of MISRA C:2012 Rule 8.3.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>
>>> You could use x86emul: as tag in the title. I'll let Jan choose the tag
>>> he prefers.
>>
>> x86emul: or x86/emul: is what we commonly use. That said, I don't like
>> this change. The files touched are pretty new, and it was deliberate
>> that I used s, not state, for the names. This is shorthand much like
>> (globally) we use v (instead of vcpu) and d (instead of domain).
> 
> Are you suggesting that the functions changed in this patch should be
> adapted in the other direction instead?  Meaning that the declaration is
> changed to match the definition instead of the opposite?
> 
> If so, are you referring to all the functions changed in this patch? Or
> only some?

All of the files touched here are ones which were recently introduced,
and which are deliberately the way they are. This "deliberately" really
goes as far as declarations and definitions disagreeing in names: For
the former, what matters are adjacent declarations in the header. For
the latter what matters is code readability. I'm sorry, I think the
Misra rule simply gets in the way of the original intentions here (and
I continue to disagree with there being any confusion from name
mismatches between declarations and definitions, the more that in the
case here it would be easy to avoid by simply omitting names in
declarations, but that is violating yet another rule I don't fully
agree with either, as voiced when discussing it).

My preferred course of action here would be to simply drop the patch.
The least bad adjustment, if one is absolutely necessary, would be to
change the declarations, but then in a way that all adjacent ones
remain consistent (which may in turn require some _other_ definitions
to change). The mid- to long-term goal certainly is to use "s" more
where "state" may be used right now.

Jan

