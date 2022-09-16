Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670F5BACA9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 13:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407960.650656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ9ly-0005OL-K3; Fri, 16 Sep 2022 11:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407960.650656; Fri, 16 Sep 2022 11:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ9ly-0005LK-H0; Fri, 16 Sep 2022 11:44:42 +0000
Received: by outflank-mailman (input) for mailman id 407960;
 Fri, 16 Sep 2022 11:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZ9lw-0005LE-Uz
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 11:44:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2212c97-35b4-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 13:44:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7888.eurprd04.prod.outlook.com (2603:10a6:102:b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 11:44:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 11:44:37 +0000
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
X-Inumbo-ID: f2212c97-35b4-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR1OywNfVElKmKGYNCpb71FUyYi4y61ZcVhGgwYVugjofHdxh3ezu9QgHxllMIFex8EJ2gPUqgwcQM/1VFre6PnD2WCKgTrF0kr239XYvEPnCbi9LaeA65eWtEwlB6+vzAb3YJ1pHsimeapG2knUSA9lUxyIJ4uwh+q/F99hyyWHKTk9ixDRlraHfhS1xlOAiX0q4aIDeopCqHURz1QDpow/GJci1T4+RLhWA+3KA2ng7utaW01qeKxW5kWrYyMsmA8BNXkIIeH5RAX4mH9/lq2Ree+9H469NkMrQctjWkLziS2I5+gGgSSFcb12K7BEV0I3UcCYYnsOCBpzLOWCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XllIYTTkFTYHUz4Udy1CQcJh8H9tgf+9m87/2Ua4Slc=;
 b=I0FH5RfYpI+b58UCnHsEPQQFgrnsv6RsLkhZRuSSXCrmUfOaPfIeGeS/Da6+ApS543+5Pic8rs8AbgHa4l2Kr2TjbI5WPgCol/+kvSxmD3r7N0QfG/ns+vjiw6JYHV1oXaCsI6kWlVUjBxvWKaLftkgd8IKlrXktH06Joky74Vf9ihTq8X6QNvNcKvXGNjk69GDHnwpqO+LcjlV78vTDObABz+RVN/aVIMFDVsoydnp8+gi5fjrdulQu1SQY/sDVv4eoehaJhaGy/OBFzpXwkTT/uBBlFAcPoRfRPXlIQdZjypWXU4bnGjDMUj5NzPsR7NBY5HVw9L8r13BVoqX1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XllIYTTkFTYHUz4Udy1CQcJh8H9tgf+9m87/2Ua4Slc=;
 b=v9DOm2aSTsm477wE7POansGi1KPwtiOWq2pOTi7UzcR7CS2xGAiurHCHt0wI6daw9wdf5kd6GJipGLEznzN/EHdGQqEXn954XdEnAKhocgT6EvYdDeRQJyONnnFOJKREnuk22Dx1/UKWdZli1r/1+vM616AQBKj/w96rzO/wT6INGO+pofEJ2Lbs6XnS99e3/7M4F+EU0//OZbEq1D4YvUjADkl8m49fvUnxadcphY2xkKjhGcia9E8h7hNg8vWpF2RkDi9MNNSBFKntpcs/h3PUfHSg9zkjfnsZpU4z+8PBQtzr9mviJtPZg5Y0NelB4/2V5vxoRm+fRosb8q41JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <951dd3b7-9489-a662-2252-baf6a5ceddfc@suse.com>
Date: Fri, 16 Sep 2022 13:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Default reboot method (was: Re: Console output stops on
 dbgp=xhci)
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
 <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
 <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com> <YyRHiV/HHisshYJl@mail-itl>
 <92a8ad2a-9b9c-b147-c175-0a9b4dab4821@suse.com> <YyRWCpM+s+JNNmbV@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyRWCpM+s+JNNmbV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: a151d5e8-88bc-4b0a-8c93-08da97d8d54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnU4PArXhBMfp0HvDO1M0nipr7aeSSQh1JH1CMwn7ecyjh6iKmbqFe9RMObNTWCSHNQDQ31EjpZbouVq/3AvfWwuNw8XKX9oyv4sCtO/tkU9bXsxKz8oaQW9F+4QIAAT298c4ObMLKnIhkDF6phDN6fl1rlbhegsZpWF03dgCQlvPU9iEsJSQ0T+ozSL/nxxP3wIMKDYlbyyGAvyePoKHN1rGvf9Ou3xWtXSNTnMhuwWRmdPR/ZJfJqUKdAB9JMrFrgTYIH9tPDpHCuwBxUku0Fs7czLVdJkksfQKiqPG9o1uQcrQpuqNNSsXAUiV6n+e7HjvSiRmajS2PZnkEj/IBFbOEVux3BRN+JlnWoL3HTvIzh7VM26Ixzz9hLkr/S4XvHzk4RDhLhk7hRUn7zVqx6eNa6c6Swhu2+c9ibROYgfXHFHDSnqkDjoFVvjYaiDWqH1WRjeEoVjjyOesadzZpDrg7ZOiLR/9C6w2NoefFxhzD0mFmVgxS3Hf8TqaiNXLJqpxVbpZwh2RAYBryUktfnKwfv3404Xuuc15aegrUyNjLt09Oj8S59Xc3tmlNsdqhc0OsYr+F24vPVsWRVAG8TtcnD0fL0P/m/nOQ81Fa/M0LBs6zYN1FjEifG5+NLOr5BlpEg5Usc//e5saSbNFNeC+40dyrYn4SkYeA8v47pjoX0RJkyy6ZA1rfO+VDCiDwPNO0LusCszOHQ6i2Y16gr86zhlYUL+s2L6EtYTwix+UDlPtLzEIWEsX98iTCoQ+U/52xI7kIEBiDOyBEheGTk+ELHbpQWWSSIw7NwtK74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(66574015)(2616005)(6486002)(186003)(6916009)(54906003)(26005)(6512007)(316002)(53546011)(6506007)(41300700001)(38100700002)(478600001)(31696002)(86362001)(31686004)(8936002)(2906002)(5660300002)(4326008)(8676002)(36756003)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJtc2dOOEl4TnNDZEdWek9FQXU3SldBc0hDdXhmTFZoeVB0NG1INCs0Qm5Q?=
 =?utf-8?B?d0NZOXFLMTRib3E0ZHpwcTdhMkpubkVqOEVQaWZyR0hDcXJSQVVyOG41WFl2?=
 =?utf-8?B?Snozd0N4N2d5cGUwdTUvRThIOU1wTlE5ZEFQZC9xVk5ST0NsUjc1NDRCZUw0?=
 =?utf-8?B?REVUOTJYSHl2aWNBTW1sdE5lbzVvQ1pQa0p1VHNycXZic0FNYmZxcmMrQ0Yv?=
 =?utf-8?B?cFgvNDNTYWp1N0QvakRnZnJ1bStGMWJ1RTBoNUpFN0FSbVhXYSs5SHR1MWpj?=
 =?utf-8?B?MG1qWWpsblg5dG1CNjdKbUhzMUNOVWdEYlZGajY0RkVac0tJSUl2WDdlZUpH?=
 =?utf-8?B?akhHR3B2Q0FpeDZ3ZkNPSjBudzhqVm1JKy95cDJhWVFkUWY1ZVRUKzBsbk83?=
 =?utf-8?B?dGEvSmlidzkyVnFQaDVxeXY0MDBtRVErZUdTWlk2U3FXb3hWTnN1VE9DbEln?=
 =?utf-8?B?ODNBbSs3b2ZWZ0ZPdTVyTy9Vc3gxQ1p1RTFTWlhnOXlDdnkrdHIxTVFQTmpZ?=
 =?utf-8?B?KzRnTVh3Z1A2M2VvZE9rRmErY25sckNCd0dIcFJzWVhUcGM4UXJCa0xtYnZl?=
 =?utf-8?B?ZmVxQ0NqalNkT2E5VlpXSVQwYXJBNFZzY3NRT0hqeGhFcVpkZTJMekNIckJJ?=
 =?utf-8?B?QlE4bmhWMm00THAvY0QrVUJTWGJsQ1dWOUhreEI1WjZ5N3dTNDhzQnJ1Y1JB?=
 =?utf-8?B?TmY3c3hJdXozZUVST0JWQm0xTnVNR0wyMFBiVE42QkhYaXp0dkdCOC9oejM3?=
 =?utf-8?B?RGtsUlp4b1I3SnNJSlUzNFl4VnQyU3FROU8zTzUzbC9ZVnR2UXk3VERmWmRO?=
 =?utf-8?B?ZDBGMWJkSkhNY2phdURBV1NjN0ZmWDJpR3d6RUxYN0ZteGFVUEVGUytTbEFK?=
 =?utf-8?B?dkZsTm51S08vMWlrWmNuR2xneVBDY0E3cUFNL3AwYTJycUJXMy9HaEtZYitF?=
 =?utf-8?B?QXJXYnppWkEvczR1a2Z3NW5RcGt1NENOaFhwdHRldjhma2VxdjZLWWp2VEtN?=
 =?utf-8?B?aGN3SFFzQlNQSWsvTGxBWi8xYVR2amFqeWJqRVNxTi83RWJqRWhMR2dBeUY5?=
 =?utf-8?B?VDk5amJ1eGtXVDRObERDUzYxaUp2ZGhWZ0xlVVhFVDRYUkQycU5saktiTzIy?=
 =?utf-8?B?VXlTRlVoWWRwRGxiQkNJcUUrak9GS1ViSi9UaHU5VWZEK2pDcDVkem1zaWpM?=
 =?utf-8?B?Rm9vRTQrWERLZFdVeGVJOWhtei9YajJGb2xWalRZUjMvSGRuL3FCOWpQbHV3?=
 =?utf-8?B?TnFlZ1krUzBwQTVFQWFTcFBZR0xpWHdLamkvYWppSGt2dE8xdUFyZkFlSll4?=
 =?utf-8?B?bnBSeCt2SW1sQmIwRXlnUWlYUm9uKys0U3lhRGVVVE9uUEhSSGNXYVc0SG9J?=
 =?utf-8?B?eURMQlRWY0VpM0dubWlhTzEvbGFueWxZM3FJVnp4NktzRis5aUZBY3V5d211?=
 =?utf-8?B?TFNvM0FFL2plUXJDT2pHb3lrZGZ6WkNlWFJoN1dqQ1Q1UXVzeVJ1cjNpVzVI?=
 =?utf-8?B?QjB4aGhUeDFLMkZTNWc4N0VJR3drWUdMc3VMSVlSV29JZnErUXFQYW9tMHV2?=
 =?utf-8?B?U1JNM3M5SVM2R2NSdmFtbkswRlBVVFVKbEJFbHo5b1pGVXQwMHk4UEkxRlRF?=
 =?utf-8?B?d0RRYWM0YkU5c3lBWmFzRmV6NHJkaEVjT0dKdzZWL016d2VsQTBmb2NNREdQ?=
 =?utf-8?B?WXVwYzVMVWdza1FaQ3dmTlBrVW9JY2tuMWJDSU05aCtjUk8rbjFMUHVXdWJC?=
 =?utf-8?B?SE5LelFvMjNQUVpQaVVMT0Y0WVhXa0hkeVFUb3dnQS9rbGViaVp2UE9GUEor?=
 =?utf-8?B?SmREa2kvU29SWHJVN2swcGdjaTkwMlZldmptRjV0a0grQWJYYWhDYldnUVFU?=
 =?utf-8?B?cVVqeXU3djFyNzdjeXAxTjVKY2lhaUlYRnRkWmJwRzNDNzlVNVhSZnFtb1NT?=
 =?utf-8?B?MjdreGYyOW11L3dDUExOUm1nKzlMTU53T2ZoT1Z5Y1ZNYmlnSHZzVGZhMkpz?=
 =?utf-8?B?dStWTHphNDJnOXFaV1hUS2pSdFkrdkJHM3g1VkphRzR2VWdJaVo3Tmx2d215?=
 =?utf-8?B?dTF2RDFOZzVzL1BLR0x3eGJ4MnIxVEpHRHBjdk9ncWN4dmc0dUd4M09Iaksw?=
 =?utf-8?Q?VVRWOdmIvWOMBeVB2DscppZoj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a151d5e8-88bc-4b0a-8c93-08da97d8d54f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 11:44:37.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rnl3NqTA03RPDmc2fJP7XNpbYTVlL+0a8UXVahZvVlo6YLeGPETnNFNjGkN6LyGAf+zH1MEK5wWK1/9n098Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7888

On 16.09.2022 12:55, Marek Marczykowski-Górecki wrote:
> On Fri, Sep 16, 2022 at 12:28:46PM +0200, Jan Beulich wrote:
>> On 16.09.2022 11:53, Marek Marczykowski-Górecki wrote:
>>> On Fri, Sep 16, 2022 at 07:57:59AM +0200, Jan Beulich wrote:
>>>> ... this leads to the crash, which effectively tells us that this is
>>>> likely yet another system where one needs to override the reboot
>>>> method (e.g. reboot=acpi).
>>>
>>> At least Linux, but also XenServer uses reboot=acpi by default (even on
>>> EFI systems), can we make it default in upstream Xen? Issues with
>>> reboot=efi are rather common, while reboot=acpi just works.
>>
>> But rebooting by means other than the EFI runtime service has always been
>> against the spirit of EFI.
> 
> I'm afraid firmware developers (apparently) haven't heard of it. Can we
> have "works by default" behaviour?

Just like with e.g. the RTC, assuming availability of ACPI reboot is
wrong under EFI. A fully conforming implementation may not support
the ACPI method, while supporting the EFI runtime service. It is such
a (well written) implementation where I want Xen to work correctly by
default.

Jan

