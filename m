Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490465BDF04
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 10:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409201.652151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaYBv-0001vG-Ql; Tue, 20 Sep 2022 08:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409201.652151; Tue, 20 Sep 2022 08:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaYBv-0001sH-NW; Tue, 20 Sep 2022 08:01:15 +0000
Received: by outflank-mailman (input) for mailman id 409201;
 Tue, 20 Sep 2022 08:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaYBu-0001sB-CG
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 08:01:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c84f80-38ba-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 10:01:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 08:01:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 08:01:10 +0000
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
X-Inumbo-ID: 64c84f80-38ba-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQr01c8i+RmBqil7veqyssJsLI/sJiR0FXpCJk4qZkFJ14nuIrcGPTwWwOSUYKU0/LyMuCjN3va0z2VfJb64jA7PeMHFtKwZ7TSypFNwErO9QF9SF/dHVFWVwysW0qrpcgG7e3eO+i1aXY+tatDpXi60aBZhzIAuqYovdW3/bw8kwXWGxrobGdkwpHvzA4rIS9W4BK3Ylsbpsh9bCOPbGgZFoxnvi4OuvDd8yhavNcb4l/XT18JgqCjQHslJJXNFwgPdVu9DB6Pbl3ApsUPAr1vColqtPmhgbadkRGa5kNhE2xtaZcI+1PzDsZUqVcl+ZaNiYr55STWv8Mb0odKTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGh7TJp3vd4Xz7oPly1MlJad6+tATQGi4gsDzYkglUw=;
 b=dF8fqDbCsInJdMCSVYBlq/a21zEcTDafX+MzBirXzWWoMrluZhYHY7QlKH4yB+HTJI7ar1HsA9U/Q2SsGeUhnqvZekzc/ivZJsAQJEvRoNpjTo3e0Ml91cPgbVIRJ1d3WeHPQaBlc6x/BBne0LRK67z/vYhYvX+II+QDHMWsGyII+mBJUp0I9ISUpVGPcb9biZogY7KOjJggANcGy1UjzI0dS38qaYK8pnUTHJwx4An/lS3rfcisAfiWsMX9kB1UBDHk4V4z1ZelnPdfAI3ZqUNK/egUQoLQjgmVO+LBWdldvz3Vcdu1C5vj0KdtXnfhUSLX00S0N0YmfIF1NYvrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGh7TJp3vd4Xz7oPly1MlJad6+tATQGi4gsDzYkglUw=;
 b=rKfecoa/tFGJNbqiu7JhnQsQ2lEKpNRa1zF6tioSfpzwdU39kGy2Y3cPuYtAzJ8ms/hNvbC5ytv+qr2m6lC3bvnIQd5XTT9Ob5zifhZkC6IT0i8tRh1IX1eSp7FoQ8fqpOHNQTuElhD88EyQzdrvwgVJEAWNb3xk8LlTKa9GsahMKqKFVna84ovzuCV7cMY4HEOrkPtahk8oMo3yJVUlEjO7L8PnB8jrPiXK7pW/hBeQ0qKkbv7fvUgm3grM+QZ5/J28P9Gn1pJVg3hEAu4iHOjyv1oRpoj/jmaxhE+GwwzjUrXdFFW64v7nzHylL5gQ/31nxna5nGU4HHfTypckVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c0c9e20-f3d5-86fc-647f-ee89d63f2118@suse.com>
Date: Tue, 20 Sep 2022 10:01:09 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ffc59d24-7862-b7fb-e11e-b5f773129b0c@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 790c895a-f2e9-49db-a189-08da9ade47fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RCSK0Z/5382RL5NTFNj/r5HfE1JcNxIVhPvoYFxkNjK9g9dYXLXPdLfSPbUeiG72eXKque7mgstZwnUlhkSyCBaVAyKVC968RKrU0DNe4mf+xVevQIFuHye+3/KoBm9DikY2dPQpauBw+BRkhBFxD9FRdxPQqUMeChjt8HUFDAPFoW6/CZLezaCfByB8TN79IrKRxIZU1tWBf634y2tUfVzCU3lU+cfuVkLX1GUoRFh6FrvY9MJlfz539PxiJMDyCLoVbxv7VQWOV5NBuh13CBwVzZuiwzy0Sr/UDxQ7dnZhBGhMR4ihzRvF4K/hdgtUWWUAXD4fKt2lcXF2CtECiYFp5ZrSm9PUWcEx8SfAU5Brr/ayWYAXEriRey5pqQCNy5PMJyeuejCM1a4yb1pVmxhAr+LPhj0QXM7nCj4WAqDNYOhr//T1ZwlsmGk06xK88CxO9oAP9NGBmYNQM3ROyimUXBOe3kcOskR6RNFMQlz7lHc5sZ4iLGXhy8RLQaPVWvVuJyPEA4YPbwHD1IXVlDRJKlp7mzpAxJBL8ouJL0OMscPK2u1zKULTDMvL/CkMtDyAJJi5elkeZen5pfvhW6ykTauRPDzqEcxVHItj0CJomsdTSF2ccHm15j+1TLQqUGdG172VuS2UizLri4zmDNAlrORqKodXkr6/5SJgf8Ewb+ztVbes5i59Ezide02RSNsEpQf8+iNJOd99/zbXx8I6Ewk1Npw7t5SCRqCEXfoWWGkl0ZqpwN5xq/l9g/J4bhpes830RXnTlPg0iFygn9eAsgyN6YDlN5JyFDKvqsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(6486002)(478600001)(31696002)(86362001)(8936002)(41300700001)(5660300002)(8676002)(316002)(54906003)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(2616005)(186003)(53546011)(6506007)(6512007)(26005)(66574015)(83380400001)(36756003)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFFMbW1RVFhrZ2ZDQUV1VmxnQW1sUmloNzJMRWtuMEUyWkRBMjJqc2hYSk96?=
 =?utf-8?B?S05lMXZkRG0xaHB1aE1yN1RVdnBySzh3UjNvOFlGMEMvZU0wdGFsNVNPZ2Y5?=
 =?utf-8?B?KzQ2bWMzeXVhWXFobXBQTW9Xb2lvbC9zSlJmTlhlcGV2ZDNWamovQndaNFhp?=
 =?utf-8?B?aG5yTDREQVRMdFVlYUk1OWg1VGQzT2JSaHZ2bW82V0pnRmozRW9GT1ZjeG15?=
 =?utf-8?B?aE1UenY5dGwxT0hnaTVsZUFVd2xDc243Sy9rdlBodzZMT3lHUytnSlFzbDhH?=
 =?utf-8?B?emtDa2RCRjFxbE9hZW5RVGJ4NDk0RW1sWnVoRzZYNnVMYVovWjNmK004ZVVH?=
 =?utf-8?B?c0p6VUg5Q1ZJcFVMcUh3SFBISnd5ZTgzQWxOVzRaVVgwNXNTL1NIOGFpcmtQ?=
 =?utf-8?B?OWwzZ3NCa3dkMFhmN2FuTkN6Wm9MZ29YZ251cjgzYithaTFxamZzbkFadzln?=
 =?utf-8?B?UnJxelF6bXplUmxob1I2NlMxU2pPazdEN2J4WWliMkVPS1hzK1dKOG5rT0NN?=
 =?utf-8?B?NlFlc21rVHAyNHJsTVRCZGlGdDRoNm81clNsM3NhNkJLK1dsbzNGYTBkUTFO?=
 =?utf-8?B?MDRuZTVzeEtFMkxPbjNySXg4NFJUWEJJRFV6NEc1dzVrV0FOTUNvUVBmMkU5?=
 =?utf-8?B?QmgxUWw4Y0NZb1NsaHdWTUp1V3lkZzlaVlVSSkdlMDBXUnVmK1JlZDN1dm1I?=
 =?utf-8?B?RGFVZHg0TXgzYlBnZm9Gd3Q0clcxUFRCTGYzMDJSOTN5K3Vib1FldnQ2MzFE?=
 =?utf-8?B?ZWV4Y3JFZW5HbTZhYzZaeU9iUFRTdVdXOXhvdmdwaGNobDZHUEhmMEowaERO?=
 =?utf-8?B?Vk9wNHVxdWZZVmxpZlFVdTVldmNrQVVDRGlDcjN3N3RWZ3lNQm5ERDJ5bWQ4?=
 =?utf-8?B?VHl6TWdSN0hqK09UQjZzZVo0R1dQQzBrMFVVU2hmQmhmY3lnbnl3enNwVlpu?=
 =?utf-8?B?dUp1bWJUaGlNVEF3VU5UdGcrVTdXcy9rQTZRbVZsWFhKYnhMVHhXS1JKdGlR?=
 =?utf-8?B?b3loS1ZYODFQN21kMXJWa28ydWMzQnJCbDhEalBPS2ZONlh2VWttMlA0d25L?=
 =?utf-8?B?M0IvR3hDYkp1NUw5N2hxT2FyWUlyRDVrY1lLYXArTi8xSnNLMHVUOVZ4NmRP?=
 =?utf-8?B?OFh6MkszcXNYTGVVblpXQkJCU1JObDRTaFc3WVZFeWFSMEtmaCtJUVp6UmRT?=
 =?utf-8?B?RjMyeE4vbnB5ejhtbDRrcUIzd2M5cFUrTnVzN2FGUzIza1M1SlI2ZzI4WW14?=
 =?utf-8?B?Nmk2TGYyeDNhblBYWmVEK2k0MEp2UTNySE5oL1JiNi90ODd2eXl0Z3dQSWVT?=
 =?utf-8?B?WUoxdExQTDA3QlFuUXIyQzhHNDhqMDY5RkRJUnl2bzJENHhyZndXTm11V0p4?=
 =?utf-8?B?dlR3am01N0VuSTc4SmJrcmhvd0R3RWY0WmplVnZjb1NIY25ycVBvdXFmUEVH?=
 =?utf-8?B?WEdrdFo2T1BTd2xaOC9SbEs3Q2FsUTZNa3g2eXJZMk1mdzFpUE9nVXE1cVBy?=
 =?utf-8?B?R0MxdzFmSWZ0aXVKS0dqMS9JNExROC85NjFGTHBneXZvYTRVbmZUU3hNNmd0?=
 =?utf-8?B?NTBzK1lIblBKQ0FJWnRleTlEOEsrNitpL0diMmFzb0lqR3VyTTFMckV3V2M0?=
 =?utf-8?B?bTY4andmcUt2VUNYWWZQZGVnZ1B4M09QWHdrbWxzNFFYcEd0bW5tdHVqREtL?=
 =?utf-8?B?YVlBb2V0RjE4Q2ptNFQ3dGVEQ2dVQmFRTHlaa0dPRXZ0S0pZczNFN2djekdn?=
 =?utf-8?B?NHNDTmwxZ056WU1QU2tPMkdMSlc0N29qb0lkRjU4cy8zUC9pN2Jyc3ZFTWx4?=
 =?utf-8?B?endwaktZRWF6OWhTbDhQejFEZ2hSYnRSQ2xQdm55SU54RkllUmVBVm5NQ0lH?=
 =?utf-8?B?bHhYVms0UU13M1htZlpZcGVFNjVvcjhIUnR6ekhjVUYzMWxOUzljMVlZWXk3?=
 =?utf-8?B?aDA5Mk1WVCt1eCtiMFZZSTJRWThWbmFWY0FyM2wyTmsrTDB6Q0U0ZSsyb1ZV?=
 =?utf-8?B?d1gzTHRjd3V3Y1V3R1dHYUROeVFNbGZ1VWFFL2xFMEx2TThFQWU2VFREL1Uw?=
 =?utf-8?B?TjBPWFd4OHFGWkpPeEIwb3dpRnZsRjJVYVRmbDd3T1hWYTZ5cWp5dDI5UG1B?=
 =?utf-8?Q?vdGwt6ylGWglMCEV9OEORZhhD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790c895a-f2e9-49db-a189-08da9ade47fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 08:01:10.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6YEjfg0NaWh5V44FnTsz8A+jJoFmfOBmLhTOCLp0BZ0ulX4CIOhyixySDOwcffMUGQPb1nGCRyN2oTtMsSlNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

On 20.09.2022 00:42, Boris Ostrovsky wrote:
> 
> 
> On 9/19/22 10:56 AM, Jan Beulich wrote:
>> On 19.09.2022 16:11, Tamas K Lengyel wrote:
>>> On Mon, Sep 19, 2022 at 9:58 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>>> On 19.09.2022 15:24, Tamas K Lengyel wrote:
>>>>> On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 19.09.2022 14:25, Tamas K Lengyel wrote:
>>>>>>> On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>
>>>>>>>> On 16.09.2022 23:35, Boris Ostrovsky wrote:
>>>>>>>>>
>>>>>>>>> On 9/16/22 8:52 AM, Jan Beulich wrote:
>>>>>>>>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>>>>>>>>>>> While experimenting with the vPMU subsystem an ASSERT failure was
>>>>>>>>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>>>>>>>>>>
>>>>>>>>>>> The root cause of the bug appears to be the fact that the vPMU
>>>> subsystem
>>>>>>>>>>> doesn't save its state on context_switch.
>>>>>>
>>>>>> For the further reply below - is this actually true? What is the
>>>>>> vpmu_switch_from() (resolving to vpmu_save()) doing then early
>>>>>> in context_switch()?
>>>>>>
>>>>>>>>>>> The vpmu_load function will attempt
>>>>>>>>>>> to gather the PMU state if its still loaded two different ways:
>>>>>>>>>>>       1. if the current pcpu is not where the vcpu ran before doing
>>>> a remote save
>>>>>>>>>>>       2. if the current pcpu had another vcpu active before doing a
>>>> local save
>>>>>>>>>>>
>>>>>>>>>>> However, in case the prev vcpu is being rescheduled on another
>>>> pcpu its state
>>>>>>>>>>> has already changed and vcpu_runnable is returning true, thus #2
>>>> will trip the
>>>>>>>>>>> ASSERT. The only way to avoid this race condition is to make sure
>>>> the
>>>>>>>>>>> prev vcpu is paused while being checked and its context saved.
>>>> Once the prev
>>>>>>>>>>> vcpu is resumed and does #1 it will find its state already saved.
>>>>>>>>>> While I consider this explanation plausible, I'm worried:
>>>>>>>>>>
>>>>>>>>>>> --- a/xen/arch/x86/cpu/vpmu.c
>>>>>>>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>>>>>>>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t
>>>> from_guest)
>>>>>>>>>>>            vpmu = vcpu_vpmu(prev);
>>>>>>>>>>>
>>>>>>>>>>>            /* Someone ran here before us */
>>>>>>>>>>> +        vcpu_pause(prev);
>>>>>>>>>>>            vpmu_save_force(prev);
>>>>>>>>>>>            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>>>>>>>> +        vcpu_unpause(prev);
>>>>>>>>>>>
>>>>>>>>>>>            vpmu = vcpu_vpmu(v);
>>>>>>>>>>>        }
>>>>>>>>>> We're running with IRQs off here, yet vcpu_pause() waits for the
>>>> vcpu
>>>>>>>>>> to actually be de-scheduled. Even with IRQs on this is already a
>>>>>>>>>> relatively heavy operation (also including its impact on the remote
>>>>>>>>>> side). Additionally the function is called from context_switch(),
>>>> and
>>>>>>>>>> I'm unsure of the usability of vcpu_pause() on such a path. In
>>>>>>>>>> particular: Is there a risk of two CPUs doing this mutually to one
>>>>>>>>>> another? If so, is deadlocking excluded?
>>>>>>>>>>
>>>>>>>>>> Hence at the very least I think the description wants extending, to
>>>>>>>>>> discuss the safety of the change.
>>>>>>>>>>
>>>>>>>>>> Boris - any chance you could comment here? Iirc that's code you did
>>>>>>>>>> introduce.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Is the assertion in vmx_find_msr() really needs to be for runnable
>>>> vcpu or can it be a check on whether vcpu is actually running (e.g.
>>>> RUNSTATE_running)?
>>>>>>>>
>>>>>>>> You cannot safely check for "running", as "runnable" may transition
>>>>>>>> to/from "running" behind your back.
>>>>>>>
>>>>>>> The more I look at this the more I think the only sensible solution is
>>>>>>> to have the vPMU state be saved on vmexit for all vCPUs.
>>>>>>
>>>>>> Do you really mean vmexit? It would suffice if state was reliably
>>>>>> saved during context-switch-out, wouldn't it? At that point the
>>>>>> vCPU can't be resumed on another pCPU, yet.
>>>>>>
>>>>>>> That way all
>>>>>>> this having to figure out where and when a context needs saving during
>>>>>>> scheduling goes away. Yes, it adds a bit of overhead for cases where
>>>>>>> the vCPU will resume on the same pCPU and that context saved could
>>>>>>> have been skipped,
>>>>>>
>>>>>> If you really mean vmexit, then I'm inclined to say that's more
>>>>>> than just "a bit of overhead". I'd agree if you really meant
>>>>>> context-switch-out, but as said further up it looks to me as if
>>>>>> that was already occurring. Apparently I'm overlooking something
>>>>>> crucial ...
>>>>>
>>>>> Yes, the current setup is doing exactly that, saving the vPMU context
>>>>> on context-switch-out, and that's where the ASSERT failure occurs
>>>>> because the vCPU it needs to save the context for is already runnable
>>>>> on another pCPU.
>>>>
>>>> Well, if that's the scenario (sorry for not understanding it that
>>>> way earlier on), then the assertion is too strict: While in context
>>>> switch, the vCPU may be runnable, but certainly won't actually run
>>>> anywhere. Therefore I'd be inclined to suggest to relax the
>>>> condition just enough to cover this case, without actually going to
>>>> checking for "running".
>>>>
>>>
>>> What ensures the vCPU won't actually run anywhere if it's in the runnable
>>> state?
>>
>> The fact that the vCPU is the subject of context_switch().
>>
>>> And how do I relax the condition just enough to cover just this case?
>>
>> That's the more difficult question. The immediate solution, passing a
>> boolean or flag to vpmu_switch_from(), may not be practical, as it
>> would likely mean passing this through many layers.
>>
>> Utilizing that I have Jürgen sitting next to me, I've discussed this
>> with him, and he suggested to simply check for v == current. And
>> indeed - set_current() in context_switch() happens a few lines after
>> vpmu_switch_from().
> 
> 
> 
> It is saving vpmu data from current pcpu's MSRs for a remote vcpu so @v
> in vmx_find_msr() is not @current:
> 
>       vpmu_load()
>           ...
>           prev = per_cpu(last_vcpu, pcpu);
>           vpmu_save_force(prev)
>               core2_vpmu_save()
>                   __core2_vpmu_save()
>                       vmx_read_guest_msr()
>                           vmx_find_msr()
> 
> 
> The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder though whether
> this call is needed when code path above is executed (i.e. when we are saving
> remove vcpu)

How could it not be needed? We need to obtain the guest value. The
thing I don't understand is why this forced saving is necessary,
when context_switch() unconditionally calls vpmu_switch_from().

Jan

