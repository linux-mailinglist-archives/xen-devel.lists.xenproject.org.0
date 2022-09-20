Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4D5BE965
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 16:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409482.652435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaedm-0005nG-Tg; Tue, 20 Sep 2022 14:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409482.652435; Tue, 20 Sep 2022 14:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaedm-0005ky-Q1; Tue, 20 Sep 2022 14:54:26 +0000
Received: by outflank-mailman (input) for mailman id 409482;
 Tue, 20 Sep 2022 14:54:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaedk-0005ks-Nn
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 14:54:24 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00075.outbound.protection.outlook.com [40.107.0.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cbf556c-38f4-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 16:54:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8877.eurprd04.prod.outlook.com (2603:10a6:102:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 14:54:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 14:54:20 +0000
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
X-Inumbo-ID: 1cbf556c-38f4-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN6fe6fZgaoWMS+LJGKZq6J/biEArqyL91s5ZsFf5dRMGW3l9dfFf62CYyYkjo23RDfLCYBosDtWb2XoCsx0UOADZorB5Qb9w18BqThz5uhtj1v0InvkvhmQGkQXagGEna/v8LS5hSdM6/tcZEhQB9C8aXxLop7PaFd4qJ6BABzgBLZtciZMJH7HrkjNVOSMCyduzh2NlJC6JEYElwOM/ItnothEZbdX49kPiVpuKX3Em4IadRNuM2qpuU6xuXtZOpDujOF9RTQ2tBuCqoyoRw5kfQeZzd23k2OoFwcKkQGeKD32bGlBEEMBfItmfMVNWPV2T1V6ZoBHVXtzvheqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G3yEysKcWHvEt7Q1nMK+ZOn5DTuf/Y+ezBhyIf1GT8=;
 b=M3gJ41A18mvAquCflCmdSYGsnUUVXUkvAe+8MNHCduBSzbIBdJj2lrg8bscSvyQ2r5pr4xJvet/+nxLDSvp/ir7RsrTMCnT0LDyZ62LAisASIz3vMPhuVgno8kNq3hJwDU5PLzxJb/AE/DA+0Kt/PcKGIafK/zsrM8kosqmuk8PB8L27SZiLLWsTUuZgtYrIVqh/3Sz5pk1J9ebAFLWhHiH3V4LLiyk5rxRNSHfpAOuGKG8sWbUGUBMuVeUmulLzMg0qDiFhIpnMXOL1e6oaNnzyyZvjZh08Kc5KqZ6oOSt8lT3R+48MgoNpoXrSy4tsJ/WuBdRiNbSoG7vte2qvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6G3yEysKcWHvEt7Q1nMK+ZOn5DTuf/Y+ezBhyIf1GT8=;
 b=JEku5JykSEzfphTWZ9S5trBo+9+WWr9fI2mIaMWnIHdgCUqM7W+LkKM5a3nPX/8cUtaEz0GVaZybdjK3nm2d0+ttMqPlRZKpq4RgCy38G0qf79agnN7kgraywRBi2Rrs0NIFuan2T+oKKTEpWbQUtvhHo1sepuWEcyRLu2dsQvdfV3KB8xUOSGLGDn2JQ58bTyLWshij+9GGdcTFrjgse/Ahv39sp41+kQV40UuU8RyrLj6jJY9CGEB+ah3gyHDdHLfkQ+HVxjfGjKhdnkTvwGy2W15oT0nbWmMsOl0nwoMWruSoM48w/M4P/SllfnymE1Co7zxeFfRA5M9QlGwJsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a895f8ef-1135-7a44-07db-3c2f3d685a1a@suse.com>
Date: Tue, 20 Sep 2022 16:54:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
 <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
 <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
 <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
 <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com>
 <ffc59d24-7862-b7fb-e11e-b5f773129b0c@oracle.com>
 <8c0c9e20-f3d5-86fc-647f-ee89d63f2118@suse.com>
 <4d317c1e-3481-6d9e-c5ab-dfd9c559d89d@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d317c1e-3481-6d9e-c5ab-dfd9c559d89d@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e819a6-1460-471c-e34b-08da9b17ffc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BS7C8GUXzEQEKPY9JEhL9sNHr1aA4F5iB8watfR4+CyRlU3TjL1s8uPSkFqw5efa4IqM4DIR3p0GR623Dmjp+rN3llpgo2G9S+mTMko+YICpFwK0M897pXYggp9aF/r9egxoO2k8cLaPdjlnJ9KFJcjxuJKK3A98Yd6dnxFOF9i/I5HOpXi4qL+cefph4IXQWoWOmRToAt+m5ojcBg/qccWbs7hPm9Lem0FI/gYEd1l2TK1+qBHAMnj5Or5m/2OpV4LcN1w2cPJoYKXzmofAVIQnShmMrNj0AhjMN2FWZho2mGiNazIKrEKGclquTLKjMtOWFRc5FlaOGfvHgkpCdeHK8UE9KQZMVxNvSguYUZ2IPlpW8XOhbGL4hnOF48WeJ86P8lMJyGQV46+oIBUZHG25Pnc4CzsdvzheHURU7FI5KKHpG5XbcTDKLLMAu8jt6+3bwx32NGfEBZLDNt6f1nz8aXRepuN0k4qtHU37Jnkle4KxZls8Vq54O3I5nFbBG4SoQy1/51SJ+be/hSo24jrkLMog0RlXMu9/cO62MV1SV6yfMi+poyoSQrx0+imFIyr31FQDNURIqxQ5BVAQVc3CEo5xcdrkiwhhgN1xaFwPt4XtIcoFQpLFxm9LMnwC78GOnPA6XM9vb+qtuzvwMcNQ/ZeoK5XWommSqiRFF4QjwNtQ9kAx6AMk+FZ8kqIkd9oZkm0clbXHzOQF3ojifYt+c20N19Kn5WiKHoMPFin3zdioBNbUZAjpdtQPyRnDQ+DD4AUAvGWfgtdPr2ENZiLxrh/yQHypd0IVsOwsUzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(31686004)(36756003)(2906002)(54906003)(316002)(8676002)(38100700002)(4326008)(66476007)(5660300002)(66556008)(66946007)(31696002)(6916009)(8936002)(86362001)(186003)(478600001)(2616005)(26005)(6512007)(6506007)(41300700001)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjkwbXd4NTV2ZVN1aE5pQ29mVUQxa3JPWTg0OEpXY0h0a0hjRWdnUkpLcks1?=
 =?utf-8?B?dFkzdTBMbkZTSWsydjcrc3lwbktDVXpnV1ozRHc0RVRkOUR0aGMzMzh0TFdi?=
 =?utf-8?B?MXlPOXhLTjdJdEl2WFI1QUZiYUdJZHJxUnZGVFpBelVCQzRjRWFYNmJ0ak0v?=
 =?utf-8?B?SFRISGtXYklNOHZJRnM0S2tNMTY4WlNwWnBHZjhJN2Voa3Y5dEpJcTU1aFMw?=
 =?utf-8?B?K3RZSjQyVHI3VlJ1NVRZUWdhTHplVmJ4cEw1K2dRdjFxVk4yTG52K3VsbFUv?=
 =?utf-8?B?b29rOE9FQ2Y1azFQUVFqN1NkVTFmcStyaytLM2J1TzJIUWlsMmxQTmh4TVg1?=
 =?utf-8?B?czJ0enVRdG5XZEVsa05uQkVjVnRlc20rd1YyNWMzMUxzWmlGdkZPU0o4TGRP?=
 =?utf-8?B?TG9KTFBRMi9ZSDkvOWM2ZnpROTlZSFBmbzB1RVJSVFZ2QzdFL01HaUE5dHhh?=
 =?utf-8?B?OFhBSVNDR2xvbTl1QVJzTzNIWEZlNk9nK3B4VUgxWE1VMHFOWGlLd092bGdC?=
 =?utf-8?B?dVo0cjFoaG1LMnU5dWE3VXZHYlVNZ0ppTTNBekswOFpCODk1MDNsQ1NrZG1J?=
 =?utf-8?B?MEdkeGtobXgyclorekVzY3l2djRlOVQzVHFSR3pPTVh6dGZpTGs2d2VoWk1a?=
 =?utf-8?B?anBoVVJZSjZYamp2RTFubUZoakt3amRxL0dYTUJqUTVwUG9obUp4NktqR3Vr?=
 =?utf-8?B?bmlZKzJTWU5tOVVKZnVhTmh6T2MzNHZjUFdoK0RtQUlHNzdxc3FxY2E1YUJ4?=
 =?utf-8?B?b3NENk9IUThoTzFNdk5MRUdSOXprNjZ1b084NVlzS3lnaklaRVpsTHJ1bi84?=
 =?utf-8?B?elZkbWF5NjFwR0xjcExIYmJDTkh2VkFqVmZlNFRveGVpS3NHMVZ3aGdQdFlN?=
 =?utf-8?B?L3hUSTBSY2NUcFoyeWhxT1lHd1NVVC84VGpZdkVBR0VqeGJzTENDaVJvZmMz?=
 =?utf-8?B?dlVhbWpnSC9FcVM5QkFLVlUwazFGcy82Z0w2aTNwLzI5K3hmVVcyV1NsNXZ1?=
 =?utf-8?B?dTNkeEFMNTI2YWJXUHJyaHBkSnl2bTNCdy9EZHZITHI5Rjdab0txUnVQeTlk?=
 =?utf-8?B?b2RPTk9vbExueDBTdnV2cGkwaC9uV1Q0V1RJOGhhU1NYc1BVSUkyY0ZZM1pJ?=
 =?utf-8?B?MXd1b0JGSFFyQm5TS0xKM0p1R1d0cndVbi9QeHZmLzBPeTFZK01wTzR4clAy?=
 =?utf-8?B?Q3B4ajlpZVlXTzFhZUIzUjZoVndRV1UvOXRwVVhkN2Jmc3NNMmk3dWUyUWZm?=
 =?utf-8?B?MWxiMFVnQUFIOXZhWnl5am13RTNrcUdObVUxZXBPZW82SVFodE9YWlhFVDNT?=
 =?utf-8?B?VlVDbjdCb3oyWTFCekgvM3JKTlhEYzl6Mnd5ME5aR3NLaXdEdkQxTUVEQUMy?=
 =?utf-8?B?eU9FUkp0d3RneThzRnd1MDhKT2FqaEkvdlN1a0RhbHloamVUTEFUeTBJWXV3?=
 =?utf-8?B?WWJiWS9TaGIzQUlnRGx0Ykh3dUlpa0lodTVhamJ4SU5JcnlpY2FTZDllNmM2?=
 =?utf-8?B?WDhicXA1WkkvT01uVEhBVkNCa2J2T25aUmJmbVU4elBWN1c2YUhiTU1EY1V2?=
 =?utf-8?B?SGpZRzRFMXZLN01hUE5RRW50ZTRsSFdlMEEvVzczWGtQbWt6MEFTemtmNG9n?=
 =?utf-8?B?aWFBcnFnbHRSQ0NZeGJtUUw2cVdHRnM5YThmQUtUckFYYTZKYkJhc2RRUG01?=
 =?utf-8?B?a3huemVJcnJNNVh3WC85K3RZT3N6WEhtUXdadnF2ZE1yQ1NTRi9TVGY5Vklt?=
 =?utf-8?B?RXV1Z0pqTTRCdHFwRXU0MGtrM3lMdCtLYjZ6WUJaQ3JSUlNRc0JuMGRPQUFy?=
 =?utf-8?B?VWQ2bmhEWlNoTGF3REU3UEZFTkxzN2I1ZW5TMjV1akpodzM2WlpNM0xyWUVH?=
 =?utf-8?B?S2RPYVowUU1INTRGWExadWRkNkQwTU4rWXpqV3RMc0pxSmhRd3V5TDBNdk5E?=
 =?utf-8?B?T1hmVDY1dXdKLy9rbzN0NVJOTFI5SzlmNGYvRmEycE9hc2YybVFpT0x2K3JP?=
 =?utf-8?B?b1dBMzdJVWhVYXA2SW0rZmJmS0lwWSs2dkxCVGhVY1ZobjA5MGpVVXU1T3B2?=
 =?utf-8?B?NWdDUERyTUJzZ3hWb2xOVVRiTlQ5dWtJSytuc1o5aDVOYUIxVWhVbnNnTGRO?=
 =?utf-8?Q?fPB/30k6Es962hGYeLKvVsjRS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e819a6-1460-471c-e34b-08da9b17ffc9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 14:54:20.5726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPmatO2HdF/eOODYLvdSTjwyhMpUzhFO9oftHuCXurY59mQu0f6dGIcCqBJpqo0Hln0PsSJrBNuntr7EvnPHXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8877

On 20.09.2022 16:26, Boris Ostrovsky wrote:
> On 9/20/22 4:01 AM, Jan Beulich wrote:
>> On 20.09.2022 00:42, Boris Ostrovsky wrote:
>>> It is saving vpmu data from current pcpu's MSRs for a remote vcpu so @v
>>> in vmx_find_msr() is not @current:
>>>
>>>        vpmu_load()
>>>            ...
>>>            prev = per_cpu(last_vcpu, pcpu);
>>>            vpmu_save_force(prev)
>>>                core2_vpmu_save()
>>>                    __core2_vpmu_save()
>>>                        vmx_read_guest_msr()
>>>                            vmx_find_msr()
>>>
>>>
>>> The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder though whether
>>> this call is needed when code path above is executed (i.e. when we are saving
>>> remove vcpu)
>>
>> How could it not be needed? We need to obtain the guest value. The
>> thing I don't understand is why this forced saving is necessary,
>> when context_switch() unconditionally calls vpmu_switch_from().
> 
> 
> IIRC the logic is:
> 
> 1. vcpuA runs on pcpu0
> 2. vcpuA is de-scheduled and is selected to run on pcpu1. It has not yet called vpmu_load() from pcpu1

The calling of vpmu_load() shouldn't matter here. What does matter is
that vpmu_save() was necessarily called already. Therefore I'm having
trouble seeing why ...

> 3. vcpuB is ready to run on pcpu0, calls vpmu_load()
> 4. vcpuB discovers that pcpu0's MSRs are still holding values from vcpuA
> 5. vcpuB calls vpmu_force_save(vcpuA) which stashes pcpu0's MSRs into vcpuA's vpmu context.

... forced saving would be necessary here. What's necessary at this
point is only the loading of vcpuB's MSR values.

Jan

