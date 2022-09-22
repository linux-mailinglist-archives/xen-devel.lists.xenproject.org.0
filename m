Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6205E6B6D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 21:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410445.653432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obRUw-0002mo-Qm; Thu, 22 Sep 2022 19:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410445.653432; Thu, 22 Sep 2022 19:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obRUw-0002kR-O3; Thu, 22 Sep 2022 19:04:34 +0000
Received: by outflank-mailman (input) for mailman id 410445;
 Thu, 22 Sep 2022 19:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1obRUv-0002kL-AN
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 19:04:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150080.outbound.protection.outlook.com [40.107.15.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6373864e-3aa9-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 21:04:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8356.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 19:04:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 19:04:28 +0000
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
X-Inumbo-ID: 6373864e-3aa9-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRgA3DxGaHcHWPfTMDXNJaWAdZRfPXqdoJsiyVdKqMSdKQ2Q5dz46nM6+cE+lBcJ99TReZtormqdsf/5rAOIFmBI90HS23GaMbIBFml7e66XECjJJ6PybuwIAmJZP4N/FkK0wU0a9P/GLHC1vFbf2AFvQaujMJANBAla1mzVtnMCsLqz0cWd2m7J6KvAo5ZppiPUSRSeVZLX3okbEc1lQOTnGS0w1OEY5fvEuox/Y3V4kh0OdLxn81B/vO+oWO6VbzNbV+mMB4d0PvMY61f04fhQ77KD0mRlbT5oLHrsCIS3vMtPqkfXc0g5smUdB/1oyjqdTNIe/U4Zb6PjNHErdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7BfsUw+a5lOMLH2sO+hvWRdQWp1CO3DAftSk/q1PBY=;
 b=V5OR1Q5z/0DZyPcIEKmfvgIpoJG9eWywZKcNRZlIl1kEIyHJtEFpRemowPXrgnFw6Qg+7Z1ot9ezK+laXBwo7upsd8/RzShaFvMG689cM9XGt9QAFUOQ1cZ2FPvsU4Tiwg4McUvP/8hom7Q0P9npQd44akQfqwFJSvwXCPzdWoZv3CVnTjNQtxPm+aQt3AEND0Ak8ksFbj1hBzoe7i1IO42YBLgGQRHXm3V2DqrONppDNU8G4clrwD4gz3IcFJlP4sct4kALY3TllV32o/R3yc3EfSBC3liR0sxJHm3g/Z9hfq1hzTxrQyN6TWxqAKCVvjVhYR6Oyif98Kl8hCvATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7BfsUw+a5lOMLH2sO+hvWRdQWp1CO3DAftSk/q1PBY=;
 b=pSRDx7EfUO0oETPpSK8monZKQgqB5IYXPxTYZ5SmLbzwsHkKoo6QsxgXQ5dpNl0+an5LqbmqBkFdexN1EexgxDMLIFSceSUFRrOvwnM+Ck1FES1AP39b4OCFI3taFm/8P8WDBnsx3uCpF9xk8niYUaeer/yGfjtw8DyplHDu2l4jbWRR1lyCrLPcj4VJ7EzH3W4mhXPKnXrAqIZjZgZaNIchmanXkHR2AM811Oki5PRHTkljMIwGxD5KueyKF+4yxPc7+m0Ycgt7z6/0xAw5Yd+qrmqF1ZDz7gcfgdaoWjdge7scvUIPSkJ51lhV6wPfxzrUi4JXbO4PVeWze8Nljw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa9fbcae-8bce-41b3-7910-1991269d77c6@suse.com>
Date: Thu, 22 Sep 2022 21:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
 <a895f8ef-1135-7a44-07db-3c2f3d685a1a@suse.com>
 <2c0e506a-e494-68d5-f4d0-1b54cca2b970@oracle.com>
 <CABfawh=2tgzwjYw52fWdZQLmpFAUVOWJ=KMTb4hfVno2UCSaDg@mail.gmail.com>
 <CABfawhmS9680zPu55y6BeVzJTjuhcgpx6nLU7N7MtLHGhWWmDw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmS9680zPu55y6BeVzJTjuhcgpx6nLU7N7MtLHGhWWmDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: ca28658b-7a3a-4fa3-afd1-08da9ccd4644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BbTmQECdVkXoP+6IvCxXA2seALwKnCjP927yABsUEzIZO4nmK3rYso27pjoxrin0UJH1NKUWJWAQ91cSLf+VWp9wocZcmav5krehrpLSHQBrIDpQZ1n+3SUQfRlNC3aJGOGNMPd7wdxMNVVbPOlW1c6jrN1sajsYUm2/b4x/9mX+Pa99IjaOeqPsxjmBlaQwiBCZoNduKU48qGkn6Am9/Q81vGdhYel6mKBtFjQTqWLjMxAm9aayv4WZ3jsNGNcjP+UNR/3c7cREuFA5vWpSUkG+V9GHY1XIGgsYZEeI/xAD1hx7sEyDGEhhMfzihC6WMscEPDZEAVtJGuXUpkFIM5gm/18LkG8aPOfPjEFpVDQ61ASULfM11iAfDR1amRLIb3je5IFbAcC3gUi2DDTi8l1/7SC9OPVFy35SubnnGx6ixjS76oWwm6spBdotRNMMElMMzwFPaIDmy+SVQ9TrNT+f3vOVALIojcnMhSHTBc3WcUm28I/E9w4tm6a6Y5HuqRjw3zSHMkU1uNOo+bjICEo4MmJtsMJuNeAnn5aC5FjZYyNmjeQITqx3aot8Wn1yAh3OdS4R437Hvh8PyNPQ/AKtDc+eOLwew6j2mXLW86J2PjlXMBbmkrMF4LU6dagT0ne7iX9NMn0y6y0gfziz5YNnsQkE15QH+0hnGFtaJBzb8iNyuxaXVItCzMfLBXqpxp210GajUDhaiFy+JMlnmFSnQaTG57O591ASyPiPfkve13QIXb9gWiAcDSq/+EoB4VrNHgGGXYsfAfNglyayjnlS25mr31Rb0CAgkSJaexQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199015)(2906002)(6666004)(41300700001)(31686004)(186003)(26005)(5660300002)(53546011)(83380400001)(6506007)(2616005)(36756003)(6486002)(54906003)(6916009)(316002)(8936002)(8676002)(4326008)(6512007)(38100700002)(478600001)(86362001)(66476007)(66946007)(31696002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmpnSjV0WEJCdDltSGltUzBPemFXOXhSSndjbjN1WWJTZDZLenFnT05iamsx?=
 =?utf-8?B?Y2t1eDhtMFp5Q1pac3hhWURoTEhqMjVyN2g2empIZkdVYkNCQUUzSkcrQ3Ns?=
 =?utf-8?B?dWhrMXQrRG1OejBWcFVkdVVhSXM5SWRTQ2lqWlI0QWlPRllMV1pOZXVWb2lN?=
 =?utf-8?B?ZUZVeTZnc0kvS1NMRUdWNVJhZnhRNmtKV2Z4R3NoQ1FZSUxOdjE3SnM2dys4?=
 =?utf-8?B?UWY5Znk3QUxXNXVFVXdRU0pMZnBJOVNyZERaY3FiT2JpOW9RRGx5eURTREVN?=
 =?utf-8?B?VzNJTlhnNHhXMElhbXA3RlBmNGpNYi9jbXFHUUtiM09QS1ViMFYrL2duY2Vj?=
 =?utf-8?B?Rk9sajlKWmpNdE93a29FZlpPQ2JON1c3aE1Nb1dhcW1Vd2hnbVV0czRDcDcz?=
 =?utf-8?B?OCsxWnhaZXQ1TzRCVm81R1VYWTMrdEpqSTNzMVZQZkJ5U09GakN4NHpickFG?=
 =?utf-8?B?aW5sSkFrbDIrUXZmVE40bWFXTkdnTlVtUGtISjNjSlhXcU9KQWczLzJocWpz?=
 =?utf-8?B?L2FWN1BGNGwwVTVrNkpseEU3ZTZHb3o1ZFc5NGlOYWYxMG56WHNkbmttZWRY?=
 =?utf-8?B?K0VXb1JvY0RRcUlMUEhQVmZ0ZWhpMmN5T25nV0FGeGtXL2d1YUhvOUxOc0dT?=
 =?utf-8?B?clp0b3V2a2FJelh0R0tJSmx0NjNTdXpKTEdoZHZSWm1TOFpXNERmdVFNRnZW?=
 =?utf-8?B?TFZIKzQrdGx6TlN4bTIvL1JtakZyeVlxYWU4TEFTUjRoUmRweWR6Ui9NeHMw?=
 =?utf-8?B?ZkhCM0tZbWtIODJxWmtHeWxCbnM1WVhwa1hhTWNMZmdVQXdtZWdWRU01Nkpp?=
 =?utf-8?B?T0RGUmNEdlN4N2Zadm9vV2h6ckdMaDh2bUFvdlZ5N3NQczhuV3FSaStYVVJV?=
 =?utf-8?B?Y01yYUNydzBwSlpJM3lSL2RsalpNUmZsRDlYajg1MndYbzZod1FOUEVMZ2ZN?=
 =?utf-8?B?c0lBV1Z4dHM5VjJHS2pLNXd0OU04MGs3RTRKMk40a01Ja3FIUGF3NWp0K2dS?=
 =?utf-8?B?czJiSUNXd0tlNVVId0tKNE9hNlRZU2ZuVG5pdGtHSzg4K1Y4NXlpR3k4YTVO?=
 =?utf-8?B?TWJxeTE3RVVoQUtEdVBTMUoxaTlvOERpZUtxNVhyelZ1b1hySVIzekluOVVo?=
 =?utf-8?B?RmpSWEttUktRY2txOWhkNW1BenMxdnpzS0NDNWlsUnpxa3I5S2F2YUtFMmJ1?=
 =?utf-8?B?NkNOQkVPWk4yQ0dBRit5T010K3FScTBkTDBmUnlBMVVjQit5YlZuNitrMTNr?=
 =?utf-8?B?czhuTVoxcXNHWkFSZHNKSWl4VDZLbVFWS1hnVlVFSXp2NUV2OWVIaEJXUUxO?=
 =?utf-8?B?RWNETzd5eGhCNWJSYVBJeU9FVm9TK1EvS2FTa2d4WnhBS200R0ZYQ0VvRVhE?=
 =?utf-8?B?YXlqZTJ6YUxHcDFhU0VaNWFENkVFOGh0N3VXNllmODJwUTNMeFNEN01sc1Nn?=
 =?utf-8?B?VXZzNnRkemkyOUQveXQ2cHZXem5Lb0FuRTF6bjg5d3dQUkFBVWtVNDJHaUc1?=
 =?utf-8?B?bjBGQlgyWVBZN0ZnQUU3Nk5vUVZ4NEx0TVU3Z09jUm8yWWtnY1NadENPZ0pO?=
 =?utf-8?B?T01rOS92N2M1ODNSbHZCQVBOQ3JyQUl1ZnkxOWpBOFRtUE4wdzZ0LzBlTzFP?=
 =?utf-8?B?K294V0g2c0F1UkhlRFZweWlJTGx2NWR6SENKZnBJc2JRQWcwd3U2WUFzdUcy?=
 =?utf-8?B?Ty9pMFZhZ0tDNFRTSWM1U0s1MGV6bmE5SCt4SnRjUEFPU1FsdDc1SmtLT0Yz?=
 =?utf-8?B?Q2RBejdYc1ZYZ3R2dXo5SERFazRqb0RSMlpjQjFYRzJzbWFOd09NSVJRdGcv?=
 =?utf-8?B?RkVGMnJaaldxZGdJTk1HM3FHQ0FYekpXNVVLQ3V4SXkyb1hZUE1rNUh4elNF?=
 =?utf-8?B?cHFENVhTaEN3ZWRsSXA4WGUxczF4VnI0eGpPTXlLMlhhODRnckdzYzc0RElR?=
 =?utf-8?B?TWJuaW5iRllvdytkaGFtUXhrU3JUcXN1dWJONWQ3SHNHY2poZnBmY1NNS3BL?=
 =?utf-8?B?T0ZWUlJvcHI3TmJOQWthazExcGRtNkJZQmJUaE9LRXAzc01TdGhabG9JTUJU?=
 =?utf-8?B?bjFzRG8ycXk5ckpTLzU0N3FVT3doNGRDUWN0VEExeElmNlZqcE1yVEdpbHE0?=
 =?utf-8?Q?vbMIrr6DtXRFond+iG+K1tqOU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca28658b-7a3a-4fa3-afd1-08da9ccd4644
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 19:04:28.9200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8LVgBpUtYjWJgsPlcw1CtbBRG0H2yyPZin5yapEalsJj++LWR4c0bCrIf7af+cRzL2BnRjzrtIJYunpa4TOCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8356

On 22.09.2022 15:35, Tamas K Lengyel wrote:
> On Tue, Sep 20, 2022 at 2:27 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
> wrote:
> 
>>
>>
>> On Tue, Sep 20, 2022 at 2:12 PM Boris Ostrovsky <
>> boris.ostrovsky@oracle.com> wrote:
>>
>>>
>>> On 9/20/22 10:54 AM, Jan Beulich wrote:
>>>> On 20.09.2022 16:26, Boris Ostrovsky wrote:
>>>>> On 9/20/22 4:01 AM, Jan Beulich wrote:
>>>>>> On 20.09.2022 00:42, Boris Ostrovsky wrote:
>>>>>>> It is saving vpmu data from current pcpu's MSRs for a remote vcpu so
>>> @v
>>>>>>> in vmx_find_msr() is not @current:
>>>>>>>
>>>>>>>         vpmu_load()
>>>>>>>             ...
>>>>>>>             prev = per_cpu(last_vcpu, pcpu);
>>>>>>>             vpmu_save_force(prev)
>>>>>>>                 core2_vpmu_save()
>>>>>>>                     __core2_vpmu_save()
>>>>>>>                         vmx_read_guest_msr()
>>>>>>>                             vmx_find_msr()
>>>>>>>
>>>>>>>
>>>>>>> The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder
>>> though whether
>>>>>>> this call is needed when code path above is executed (i.e. when we
>>> are saving
>>>>>>> remove vcpu)
>>>>>> How could it not be needed? We need to obtain the guest value. The
>>>>>> thing I don't understand is why this forced saving is necessary,
>>>>>> when context_switch() unconditionally calls vpmu_switch_from().
>>>>>
>>>>> IIRC the logic is:
>>>>>
>>>>> 1. vcpuA runs on pcpu0
>>>>> 2. vcpuA is de-scheduled and is selected to run on pcpu1. It has not
>>> yet called vpmu_load() from pcpu1
>>>> The calling of vpmu_load() shouldn't matter here. What does matter is
>>>> that vpmu_save() was necessarily called already.
>>>
>>>
>>> I thought we don't always save MSRs on context switch because we optimize
>>> for case when the same vcpu gets scheduled again. But I am not sure I see
>>> this now that I am looking at the code.
>>>
>>
>> I see context_switch calling vpmu_save_from before __context_switch, but
>> if that did actually save the vPMU state it would have reset
>> VPMU_CONTEXT_LOADED, so by the time vpmu_load calls vpmu_save_force it
>> would have just bailed before hitting the ASSERT failure in vmx_find_msrs.
>> The context must still be loaded at that point (I'm trying to verify right
>> now by adding some printks).
>>
> 
> OK, Boris was correct above, MSRs are not saved on context switch
> automatically because of that optimization. VPMU_CONTEXT_SAVE isn't set, so
> the only thing vpmu_switch_from does is set global control to 0 in case it
> was a PV vCPU (see core2_vpmu_save checks for both VPMU_CONTEXT_SAVE and
> VPMU_CONTEXT_LOADED) and vpmu_switch_from doesn't set VPMU_CONTEXT_SAVE. So
> for HVM vCPUs it does nothing, that's why we still see the context still
> loaded when we get to vpmu_load.
> 
> It would be a simple enough change to make vpmu_switch_from always save the
> context and then we could get rid of vpmu_load trying to do it later and
> getting into that ASSERT failure. Thoughts?

I'd much prefer that over e.g. the vCPU-pausing approach. I also think
vpmu_save() is misnamed if it might not really save anything.

Jan

