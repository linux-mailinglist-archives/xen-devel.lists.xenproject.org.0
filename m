Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF8580B6C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375041.607316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDwA-0005ns-CK; Tue, 26 Jul 2022 06:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375041.607316; Tue, 26 Jul 2022 06:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDwA-0005l8-8Y; Tue, 26 Jul 2022 06:20:58 +0000
Received: by outflank-mailman (input) for mailman id 375041;
 Tue, 26 Jul 2022 06:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGDw8-0005kx-EO
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:20:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60089.outbound.protection.outlook.com [40.107.6.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1add2c31-0cab-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 08:20:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5460.eurprd04.prod.outlook.com (2603:10a6:208:11c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 06:20:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 06:20:53 +0000
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
X-Inumbo-ID: 1add2c31-0cab-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPJ+BEggYo2WWKrZPemFUHLfWoF7swOVavXzWKzQefRSWPozQPInCAe+sNUekyzTyhiwnAZlOlPtzYogGXMO5mAtDW+BP4SUD319j0x9KkkX4vQKHGN+xd5/52qRfGS5PFvT0LtGfuYCsO033WKMNwLWZvhZ+ViOGsSH+mqz66h20mFdIJuK8t9NwRyeKboHxIRzgGDHlBfWyLyxRlrgec/AyEf+zaYtt85zfiQkl9UIk8ZIArs0aIidQwPY8a1H1kzUKXUelHSufcLHTzdrRZbmRgPM6jssd8w/xLMWw3SHrVOxebNJlvSlBI5EBfoF0E1JAkf7+U5nXWFC+XC/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cSomQr0M0vcuHInCIZf9QLKEYZyHCRGUQzSUs+uKhk=;
 b=Aate6pkoahVO2eiY9FPNQ+kTr0t2HPgxwt89RBkbzDRDud9r4D8uDkZRoyFhDM4COq3xds3NJn3T3U6JUtlLwLmpClBPnvx5+xuhaZ56cB/QINSmyNRjqutp8CgTzEb9WC1OziVneC84xcBc/Mxdk0iOaxLVuYAGweyHp7xt7mQp8oFFop2DHIqgeCaJew/BN8+ROgRY7zoGSU4j6OKiTkQfd5cCaSMf3WVdOruxf1zEhqne+Q8q0szBiyDo7XRzXKULiq+Cv4jT6wGIWCaTjbxopC+VQlLMTmTl9OAlpWxllusSMyH336aB2iHVskFuI6BfAK68fefHWSxTaI10nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cSomQr0M0vcuHInCIZf9QLKEYZyHCRGUQzSUs+uKhk=;
 b=WhemY3stSxn8kaT89T2dwBnRzmB5c1XTch2x0IB/wuOz4BF1sa0NNXf9Wj7Tw+3Yh9ENUGzQVgfRDBUAryFghcuxl4WcJTVUBjhLLQYwyiaCqO5JQt0JNDBVBgwwaU+QOO8EN7hUQR1OwbWgZC+Ir04mEtKRaOveTcpXwlzf1O7hCy1XZxm3gU9VgKrL68Y3LpqMYIIFdVXPoFHyyko3R3HzgijDgnFdv9C7Q0pBe8XOiDU8TrCRVlMBbGusrly+23XWnW22hiRGDonh80nulB9pyLpn0se/mAUw2bVNuvW8wYDcs7hi0ZGa4hreniyogRhMoGB4r/Zo+eMmUjD6mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <981e2fb9-6f99-2113-86ab-f3da860b74b9@suse.com>
Date: Tue, 26 Jul 2022 08:20:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
 <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
 <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
 <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com>
 <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
 <alpine.DEB.2.22.394.2207251727470.4648@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2207251727470.4648@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca16422d-ea22-47ef-54d2-08da6ecefe0d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5460:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9mUfRmUd6K4+pxWIaqHoWmZh0ab7cwJ7zJUBmIXbNpwQ0mfNin5ii0XRjNimc7KEiiinI61sxe4rEMi5TuA7CNvVi8YjdbyWOxJ241WF6ngOuI9BF7ZmxrHP06g8oyDfSmVK2MmcDNjBeHJJOWjpImjhq2miotUJYnwXwge93PAnhTf7WU8hGgBsYHkIT7lwjuWQwm94s3X2FsOJWPS83189dA6a3DiGx3zer8TEDIM7rtxyf1yZQM85OANrLKSGTmd2gr3jBnGtTT/YqiPNvLY/lJY/V5Dloq3OSSLXutctcHQnenuCWmxdAgBAQ47k6hTMLiRVqg1L2KoTwinbUsJPiDpTbWLl9AN9A74JF6Z+bVHdGBK+k5n2DALfWxEoTnuyW+FPH0mzGhNqhfGa5If30nINiearoclJrnfXmtDoyihWU6k0meCjkTOGp+ruLB5ENoceucTDiPsfn4+a0lH5PpEQ2UbDfK+OAi6Egi6xcoZlP1y9Ma2q7MkOB2ky0NvC2t332ehekusf8+Zx/zpIfmIjDTM1z+RFGGX9264V12uEfY4Clrxs+w83l2Hci80+o7WZnnNatL3VPFsERfiMxg27Wz6gyKywJ1diyQrDZZZlCK94A0ykMJ1eLZ9eDhR9ESyt9PtMTApfB8tpIlMX3lj79V6gQnXHyIf/5qFgEDg7MhEsQDXOpAasSzl7psplqgkyZKqmBWkXWe5NTkY/fUqmOXvVrqHacXPlmK33Kp2a4BFVB2kUOXzmaG9N0EclfG+EAcrKOibWX49i8OTspcylwEoKtgNCVgnX5k2d0j8rodXz8j9XVCsxgNlC30TIxDETGXzGb4vEcrznEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(376002)(136003)(2616005)(66476007)(316002)(41300700001)(66946007)(4326008)(8676002)(26005)(5660300002)(186003)(31696002)(86362001)(36756003)(31686004)(66556008)(6512007)(6506007)(53546011)(8936002)(83380400001)(38100700002)(2906002)(478600001)(6486002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck01VmtQQ2k4TW9CUE5hNjRzVGZ4TDhJdU0rblQ4ZE5HcDNKcWx5TUR0ek5o?=
 =?utf-8?B?STRKcG5DQnFwbkk4Ny90SjJ5TmZScFVQbzdWOTMzcHUwTzVaOGlwRFVML3Mv?=
 =?utf-8?B?YTdwcitiUit0a285dmU1b2dXWURUYmxNdzlabmE2QlczMkdLM3dUSVpTc09H?=
 =?utf-8?B?eGNITlZMd2dEa0hPNnRsNHRBWmRGYzdrQjF1Z2ZWTUlrQm5yVnlhZ2JLSVVL?=
 =?utf-8?B?RSt1TEFqTG1XRjlaazdzSGZBVmpNY042TmhMT1o0cmRUbjVEeDFkaGtlMzdN?=
 =?utf-8?B?M2tXM0VZWGFvRzdvSm9UNTU4Mkp5d0xuK0orb3k1ZjRSMmNFME1HeUwzdmV0?=
 =?utf-8?B?cDQzYm9ueStVV0N4eklLQTdEbU5HQTdtMW8zMC9obDZNYlNzamhoTTlncFJC?=
 =?utf-8?B?dnA2bFErWTEyeFowUHd2WmZZdDNNdHdvTkJUUktJd21adXpOTkF0N0UwT0lp?=
 =?utf-8?B?SHhNRjladXAxRFlQQk5oWDdqaXJ2Q3N2WVc0WDZuUVBYaHkxRmdRNFV2UHFo?=
 =?utf-8?B?YlNOMU9hRUtwZGREMU5RVElnVDJGb1ZONnZKaVI4OWlvSks2dEpoY29ieWd1?=
 =?utf-8?B?bDhiWDNXdzJtc0RQQUdBaTUySmt1MnM2ZkZCeG9MYUJGdlJUb0IvY0xKTHJB?=
 =?utf-8?B?RnI4dFVmTW0zNGlpTDJ5cmdxYnhjTWYyb0xBdkxlak1XUHhpNVQ4VXVtTEJY?=
 =?utf-8?B?Q1Q3MUVnSnFUT3pUWkFvMlZ1WGJxVk5UOEE5NmpKZ0FYYUNzaXZhUVRWakZS?=
 =?utf-8?B?SUQxUTJuaTlvaWEvVFdDQlIvTDRjazFpa1YrNmE3U1Jjc3IrRDZSaHEwSU90?=
 =?utf-8?B?c3JGdHJJcThDYUJxdkpIVGV1YmExaXdJK0hJbGlYU1JEQ0UzVXZIWmNEaVV3?=
 =?utf-8?B?NlV3enpkakJhMUxTWkl4bThOUXNxWGtiWGVGeHgxYmpjaXpOemRhbS9hMTFa?=
 =?utf-8?B?Z0d6NG1Ua09aQWs4TW9Lem1GUUkveWJITU4xVEtVL1o4cU5NNVBrOWs1QlBy?=
 =?utf-8?B?dVNnRnErQng0MTJCOVFtc1o5OW8wTU82RjRHMVZKV1pMNFI2RndVRmF5a1Jp?=
 =?utf-8?B?U1NjQ2szT2w3cXpvZ1dTYjJQNWlNMXFlZlVtdWJQRHJxUXVjRDJIcEU2eEs1?=
 =?utf-8?B?VEg1V3dmbmpyZVBOejBqbS9RcktabTl0VWk4UjZwS2FDekpIOUc1VGVTRGVL?=
 =?utf-8?B?NmRqckhnZWVTN3pndGRyVzlRLzlKOVhqQmRwYndNUWlVcTFxOHJSU2k5dHZG?=
 =?utf-8?B?VUJxeGRZeHRZRlNxZEg5MTF6OThNSjJqUUxvMUttOGpXU1RqZjgzeUZEVm9x?=
 =?utf-8?B?MGl1ZFdNdm5LeEEzWUNUY05rK24rMWFPNFhzMDNDdFpxbFBwVHZpaEVYZ0Js?=
 =?utf-8?B?VFZmSk5SN1ZIMmU2Z0g0MlpQYS8xZ0VHY04vcEx6WFFvMy9YajF2QmdSVGpO?=
 =?utf-8?B?dlJPVDNCeVIxOXlkMk8wMnpTS2FuZmwxaDJDcmh2bFJGYng2MmRHVGNvRW95?=
 =?utf-8?B?bTYwakJrdEpTVHY5TDVSRVJtUVhReVlGS2hNdGpUWUVYSnh1NDBRK0FRcEtG?=
 =?utf-8?B?SlMzT0J4WlQzSVFpMlo4ZTNlR3p1MDZ1RFpuR3A3dTMvN2xFbHBDQ1o2R1kw?=
 =?utf-8?B?dnQyelc2alF4cDJoZDBOOGxaZDVKN3p4dGt3QnBoclRiNkJVZWh5S3RaSS9n?=
 =?utf-8?B?bXJGekQrRGhaaFQ0NWlyOXcxY0lQbWlJa0VzN05FZUx4NlZUR3htRThROW1x?=
 =?utf-8?B?UU41M3FCcHJTT2dxOXpHNU45a1J6bjlJVkQ1amtkcXRSSk1nak9ldmNoZmJx?=
 =?utf-8?B?SWQ5bHVJVzNwMm5SalZ0VXg5cVNsKzlYeXhkT1BKeDJ5MlFCeXVxcENvd3NH?=
 =?utf-8?B?Sk53TGJKTFNWcldKb2g0SWUwS2tzOGdkbXhjYzVwUXFTOWdpV21VR21FWGZE?=
 =?utf-8?B?L2pwTWYzNkhhenhLL3dEWU1wQS8xNGFxTmg1aDdiWEpWRS9lZWoxVUJpcEFw?=
 =?utf-8?B?aUdqMUFBK201UmFmdEpNdW93UHdBVEZUdWhJanlnbVc2VDY5SFdDS1pyVHFk?=
 =?utf-8?B?MHlWVE9CQUpySXhtNkpxVURvWCsxcWdMWEZiQ0VZTWJucjgzQlQ3QjhWTkx6?=
 =?utf-8?Q?aZH/Sy/ZCHgAUbacctf4QLAmn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca16422d-ea22-47ef-54d2-08da6ecefe0d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:20:53.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sPQ1b4qMUbRn6NLHtnk8vqmzADAg/tinduNSJ+sw44hbZQjsGiqjT1+3Yp5j8DQuL+bDTJA3RH2lIhXNCPeow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5460

On 26.07.2022 02:33, Stefano Stabellini wrote:
> On Mon, 25 Jul 2022, Xenia Ragiadakou wrote:
>> On 7/25/22 09:32, Jan Beulich wrote:
>>> On 24.07.2022 19:20, Xenia Ragiadakou wrote:
>>>> On 7/7/22 10:55, Jan Beulich wrote:
>>>>> On 07.07.2022 09:27, Xenia Ragiadakou wrote:
>>>>>> On 7/6/22 11:51, Jan Beulich wrote:
>>>>>>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>>>>>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>>>>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>>>>>>> The function idle_loop() is referenced only in domain.c.
>>>>>>>>>> Change its linkage from external to internal by adding the
>>>>>>>>>> storage-class
>>>>>>>>>> specifier static to its definitions.
>>>>>>>>>>
>>>>>>>>>> Since idle_loop() is referenced only in inline assembly, add
>>>>>>>>>> the 'used'
>>>>>>>>>> attribute to suppress unused-function compiler warning.
>>>>>>>>>
>>>>>>>>> While I see that Julien has already acked the patch, I'd like to
>>>>>>>>> point
>>>>>>>>> out that using __used here is somewhat bogus. Imo the better
>>>>>>>>> approach
>>>>>>>>> is to properly make visible to the compiler that the symbol is
>>>>>>>>> used by
>>>>>>>>> the asm(), by adding a fake(?) input.
>>>>>>>>
>>>>>>>> I 'm afraid I do not understand what do you mean by "adding a
>>>>>>>> fake(?)
>>>>>>>> input". Can you please elaborate a little on your suggestion?
>>>>>>>
>>>>>>> Once the asm() in question takes the function as an input, the
>>>>>>> compiler
>>>>>>> will know that the function has a user (unless, of course, it finds
>>>>>>> a
>>>>>>> way to elide the asm() itself). The "fake(?)" was because I'm not
>>>>>>> deeply
>>>>>>> enough into Arm inline assembly to know whether the input could then
>>>>>>> also be used as an instruction operand (which imo would be
>>>>>>> preferable) -
>>>>>>> if it can't (e.g. because there's no suitable constraint or operand
>>>>>>> modifier), it still can be an input just to inform the compiler.
>>>>>>
>>>>>> According to the following statement, your approach is the recommended
>>>>>> one:
>>>>>> "To prevent the compiler from removing global data or functions which
>>>>>> are referenced from inline assembly statements, you can:
>>>>>> -use __attribute__((used)) with the global data or functions.
>>>>>> -pass the reference to global data or functions as operands to inline
>>>>>> assembly statements.
>>>>>> Arm recommends passing the reference to global data or functions as
>>>>>> operands to inline assembly statements so that if the final image does
>>>>>> not require the inline assembly statements and the referenced global
>>>>>> data or function, then they can be removed."
>>>>>>
>>>>>> IIUC, you are suggesting to change
>>>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
>>>>>> into
>>>>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory"
>>>>>> );
>>>>>
>>>>> Yes, except that I can't judge about the "S" constraint.
>>>>>
>>>>
>>>> This constraint does not work for arm32. Any other thoughts?
>>>>
>>>> Another way, as Jan suggested, is to pass the function as a 'fake'
>>>> (unused) input.
>>>> I 'm suspecting something like the following could work
>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) :
>>>> "memory")
>>>> What do you think?
>>>
>>> Well, yes, X should always be a fallback option. But I said already when
>>> you suggested S that I can't judge about its use, so I guess I'm the
>>> wrong one to ask. Even more so that you only say "does not work", without
>>> any details ...
>>>
>>
>> The question is addressed to anyone familiar with arm inline assembly.
>> I added the arm maintainers as primary recipients to this email to make this
>> perfectly clear.
>>
>> When cross-compiling Xen on x86 for arm32 with
>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
>> compilation fails with the error: impossible constraint in ‘asm'
> 
> Unfortunately looking at the GCC manual pages [1], it doesn't seem to be
> possible. The problem is that the definition of "S" changes between
> aarch64 and arm (the 32-bit version).
> 
> For aarch64:
> 
> S   An absolute symbolic address or a label reference
> 
> This is what we want. For arm instead:
> 
> S   A symbol in the text segment of the current file
> 
> This is not useful for what we need to do here. As far as I can tell,
> there is no other way in GCC assembly inline for arm to do this.
> 
> So we have 2 choices: we use the __used keyword as Xenia did in this
> patch. Or we move the implementation of switch_stack_and_jump in
> assembly. I attempted a prototype of the latter to see how it would come
> out, see below.
> 
> I don't like it very much. I prefer the version with __used that Xenia
> had in this patch. But I am OK either way.

You forgot the imo better intermediate option of using the "X" constraint.

Jan

