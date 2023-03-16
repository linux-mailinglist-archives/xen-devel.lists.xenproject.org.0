Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AB6BC9E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510385.787944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjKa-0000gI-6D; Thu, 16 Mar 2023 08:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510385.787944; Thu, 16 Mar 2023 08:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjKa-0000eA-3P; Thu, 16 Mar 2023 08:51:28 +0000
Received: by outflank-mailman (input) for mailman id 510385;
 Thu, 16 Mar 2023 08:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcjKY-0000e1-Qv
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:51:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb9bf7f8-c3d7-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 09:51:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 08:51:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 08:51:23 +0000
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
X-Inumbo-ID: bb9bf7f8-c3d7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgZnhibQxfJ9YrpJWORFG3buO96NsYMF988cDWZUl8bzsTGta8aAoFw0CLt71BmlbPguK0x3hfr81ucUC0/eraQMnaJ0aj20d/6l1UbqPUE8r1nyrbVZrZBAunO5/F8/SaxQz8FfmoIwDV6ZNEWKBHhbBviNECQ2g4kH0WK+maiuXPEGpIgolgAB6DJz3itF+ZlC+IVnQdXvYQnBylagoj9FieKz7xj0Pr+3NpWvAhWXnbNd0q4OzPYFrcCb9my9ZeXlK+/vQdZVfA0yuoYU4jN+vlIu6kSadRe5Oc/14XtLl4GFulbdcu+Z0B0eObxMVArKNRv96+/epjTnZIA4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bMf0nSAryeiy40tM2oOV5O3DbwL13Jwkscwmpft8J8=;
 b=Dx2pYn0Pe1gAbS+xt/GFpQMDlQqOi33q7Kf5j2cVoLGsVUQRNcyHU+F1NhaZ6SkXcD16TD1PHLS0jEmRIHYy37BVpmYbKviT0Kd3F1RyhjKOQidFdZnkBq9pqEKtfHpgY01oyi8hHzlGCTPYx+qDa4dYvivOasH9T/YAs2CuB4U+joZdR+pGwZ5m5jYTx8SaN+atunx+2f4byc8wgq3D1d4HBjfQCBCWMeaCGUmMNAJhZ/yU0eDyiNHm+UfKGBRZ32ASIX8ZAJbInnGmGVXtw44MjnSyEiH05QMxz0hQRFykbhKmAUrQuBO8mQkLQ2BFY7FPE2h28Hg5PHi7StLPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bMf0nSAryeiy40tM2oOV5O3DbwL13Jwkscwmpft8J8=;
 b=tHbPrO35tOKTCNLA3xZbtfajjtMIgt34i7lQcxE5BWCF0xYQOEfwKlrfwuy2yLj/UDhlAPR0CYIAYJvUCMD2QIdvz4WwEmoj/go4n9toqIjYYpPgZPJ4ujo4/2DkIdfQwaRe1bgHMJ82vwO8/YGDoPB8kjgjtzfnPNVbgeLDeV8PEIN4zwplYGXj2WOQCzkvhBec+mVXeHnkkmxROg5HAal5H5QzUIM6r1Nyb6RTM2n5K+o8TSLN2lXaeZIUmDYM+Bj3q2xx6IKiui6dXx7sHBtSwimVa0xWuRNywLLUPjIxTbapYKvG9L5CP62Gatu7AYx67HNaPzB37G2tp40i6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e493e2e-8cca-2b7e-e6b5-d4413c54a866@suse.com>
Date: Thu, 16 Mar 2023 09:51:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
 <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
 <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
 <alpine.DEB.2.22.394.2303151723190.3462@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303151723190.3462@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: b35d3a52-73da-482a-8246-08db25fb9ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	msfJenPv39xa/j2z33WofvWyXVu/8TZ9jajTqdXuhED272aaEtpIXHSuKIE+prG5MeyoBDyCTnZz/z7AeFCM1SDA08DBEcrA3nVfGOPbqmwFPEoNmhTV4aK9O6aTiumcofcDyfmlYxtnJgjnySLjkJTHK9XQ+gOxnkBiveiYbG3J/KECpk9JCnWmY2J5Y3m7qO8F/ToJzdHiBgiKxs53zcyYnYQ8xD4kPdgh7RoLLrBvwDI0WwsDZFLPH6RyX21sKV9PTtyQ1GxunA617wggyZ+IbpLx7JYH74NGM2p3Ek+XAoeC6jpYeomJnxkg55uS9elpeBbtmQZ2LtU9St6xoeys3BF7IAdviT+Gdpfvz44NW7pUXOc8BLFuJ+cs3orjCIMDZqJJfDFwXax0SQB1P7qEKs9hSJ3Wm4LvDw/0HyYZnbIxLtBWFvwcnhbMUulsatfcn/3mKe+vzZ5spYZXTIQPetWRZi01YwMw7rOpCbiGMDaWop/m0ywPe8uhVJHBmh4ZJX5kH2Rur9aoHsNDwaLgFb9DzmjdmqUxm87HvUgziWnkZKDNqxaLGlW0mxkN2T9PqbB1tqW9DmQ+q4T4QRJpWoI8jwFMr4WlOsYmx8mBRZJXjqX/pzHkVV5pOq88I1EYFoRbXc1g7YQrnsYtYPOla22M8D74jHPe8k34khOBW+8LGJzyh1Exmltp38r36GUkdezy584y23K0GkOX58bxO7nm5RKIagOwoR/sslU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(136003)(376002)(39850400004)(451199018)(83380400001)(31686004)(2616005)(186003)(7416002)(5660300002)(66946007)(8676002)(66556008)(66476007)(41300700001)(2906002)(38100700002)(36756003)(53546011)(6506007)(6512007)(26005)(8936002)(6916009)(478600001)(31696002)(4326008)(54906003)(6486002)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG9LWjRlZXNKQUpQcStQaDZtVTR0M1BuN2RoWmFEUlJwSlRZaXIzL1lyMURq?=
 =?utf-8?B?QU1ReVo3QVg1VmJqdkxMUFhFTWxuL21TZXJmZ2xVblJoODYzV0xkSVZ5MFFY?=
 =?utf-8?B?RXdSMmFrRUV2dDFIWlViYkRjQzVnVENJNHBOZmdnRml6WlRmbmJ4RjJYYkFM?=
 =?utf-8?B?Mk1GQ25EWnpCZzkxUGpQWVlMaUFJTm02Rjl2dlFzQ3JKQmxuT3FjRFlKYmRQ?=
 =?utf-8?B?dXlGcStpN3lRcmFzaDhXaUxyVzZFVzZRc3pEeEtSMFNtM25aRFljZ08veS9z?=
 =?utf-8?B?SGdDZkVTNVRjdElkRCt2b2JVNTdzU3NzQXVDeXlNdkR5M1hacUlhUTVsOHRr?=
 =?utf-8?B?ZW9XZGJkWURhRVZ6MFhtTlRLR2RKVUpmWDg4SUpHc3plbUMwQlBoZWRPSERD?=
 =?utf-8?B?Mlc5R21zVFZVWmZ0RVJaK29temljZ2kwTThOUWQrZnp6WEpGblF3M3FtMFkv?=
 =?utf-8?B?RVFqbFVBS0dzRUxIcllTdy9hVmZIK3R1dVlObDE1bm96anNiSzJRMmtBMnYv?=
 =?utf-8?B?dGk3TU5XdzF1blcrUHR0QXNid1dSbWZRUHVwUmNmKytGTzBzcytHd2MwZFBZ?=
 =?utf-8?B?d2J3aGRWT1p1Z1poSlFKWDNiWnZwc1NReEpsMXljNE12UFNPOHBRWTZiK0Zv?=
 =?utf-8?B?amVzdUpmejg4QWNMbFU3QXNyd1F6RzltY1hoS2FXd25VSERvS2xyZGhrajhE?=
 =?utf-8?B?NFFVTitBUTljN2hYQ0o3aGY4WVRIQ3BsV3Fsb1hrVFY1NHROZHlUQXRmODJx?=
 =?utf-8?B?RjJwczJYVmZoU3h1cGZoSWZLTjZ6TXhKZXhWZFdjRkJUQ2hvMmRqZzZRYlB5?=
 =?utf-8?B?eW5ZZSt2bmMwUDBzRngyNEJwZTF0RXEydHpaT2R0eVNzSjZoQ1psckVsQmlM?=
 =?utf-8?B?NTVQdTlUTnJ4cDc5RXhYZUJCRHJPcWoyOU10ditDRUVkNDV5enIwTDgvTUZa?=
 =?utf-8?B?MjUxTEJYSStXcVVWUmN1K1lCNHFXMW90TnhBeko2MXU4MS95S0tFNnhYUEJI?=
 =?utf-8?B?K29EU0FKZVd5M281N1BaV0xJbWxTdWYzbjZsOEc2TTBMTHNSZGNQSmJCK0Zp?=
 =?utf-8?B?bUFKQ0MrQUE5bjA0QTBPWlZLSjRicERzWlQvdUREMndDTjJ5MlkyN0J0anRs?=
 =?utf-8?B?Yk9Nby9zZzBnT05KMkxjV1Jib0RlVnZHWTQxaU1yQmJ5cDd1L0dXRk9ONlc0?=
 =?utf-8?B?VUZ6ZlhEeHA2bDRzR3lJeVVyd3hBSThnRjBtd1ZvRkdMWEpZeWEzZWl4ZkN4?=
 =?utf-8?B?VzNrdnJpZGtRTENaTzUyemxSRXJHMXIwYmh2NlhmU0dMSXdwZnlrcVlGeGNL?=
 =?utf-8?B?OFVabnR1REVKTGJXd09rOVlpRDhGUzNmaW9lVlhuK2ZhRmlGQk5FeEZDeXpK?=
 =?utf-8?B?NmU2QjJhd1lIYzIvRHpSMHpvTHRSUzUvazRRZ1hvVlpWNjEzRExaQlRZR2Zi?=
 =?utf-8?B?dU51UGpEdGZIY2E5RjBWakM5QXVXais2clV3Qlo0L3J3OTFoWHNxanVZdHlh?=
 =?utf-8?B?d2JhemlMN3BuM0loN0lKSlk3UVJFaUNjRUJGTW0zY2NKMXp6YTFvclBIWWI2?=
 =?utf-8?B?UVFaRlBLQm1EREdja040VXpqZ1ZRVy9PSkVxd0Z2Yzh1aWdvdHlIemVta1lQ?=
 =?utf-8?B?bmx5Z3dvamRmNTJDUjk5ck0rNkg2Yk5jOWpkK3J6cjNsSEk4bGMvbndUVFJ0?=
 =?utf-8?B?cmJxMUsrMEd6SXc1UUpwVGFUSTQzWVcrMktoOUxaU1Q3TjVNQUNtTzVMMU1Y?=
 =?utf-8?B?WVhCT0k0UTVDYThGYW82OHdFVUR0WThkSDNCTFZOeFdlSFB0aTljT05hdkwy?=
 =?utf-8?B?eFlUVmJQVzY2RzB1NGlCZm14YmltTFB0SDI3YnByS3ZUMTcza1FkemlzU1Er?=
 =?utf-8?B?MVRyc2NDcDNqc05lQzRRbGRSTlRSVnBOQkxzVjlreEI0eG5wRmUyaFRUdkth?=
 =?utf-8?B?OTloU1JxWFhLcktydU15bmxhdWVmRUkyRTZ3MDFKbi8reTRDcXBhd29tNHFs?=
 =?utf-8?B?MG50aWtSQUc4YjRJWVA5aE9vazN6WjA5M3dkSy9PRTJyNVhvSjNGQ1Y3dXBW?=
 =?utf-8?B?cG5TSTJUbE0yUml4RERsQ0xiLzFWVEQzdlJSRGJtMzI5U3dWMjFkc2VtOUVS?=
 =?utf-8?Q?OjpThwlSybQw8BkUBp6Ymp6e4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35d3a52-73da-482a-8246-08db25fb9ec4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:51:23.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+hmYaXk02nx283eZGqcBddZ0/hrmmkxyyp0FnIbQP9uMyjL8uf5/HO/MI+zTvY7ZLMY1XTx7kDFSKX6DDGvmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416

On 16.03.2023 01:26, Stefano Stabellini wrote:
> On Wed, 15 Mar 2023, Andrew Cooper wrote:
>> On 14/03/2023 4:30 pm, Jan Beulich wrote:
>>> On 12.03.2023 08:54, Huang Rui wrote:
>>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
>>> An empty description won't do here. First of all you need to address the Why?
>>> As already hinted at in the reply to the earlier patch, it looks like you're
>>> breaking the intended IRQ model for PVH.
>>
>> I think this is rather unfair.
>>
>> Until you can point to the document which describes how IRQs are
>> intended to work in PVH, I'd say this series is pretty damn good attempt
>> to make something that functions, in the absence of any guidance.
> 
> And to make things more confusing those calls are not needed for PVH
> itself, those calls are needed so that we can run QEMU to support
> regular HVM guests on PVH Dom0 (I'll let Ray confirm.)

Ah, but that wasn't said anywhere, was it? In which case ...

> So technically, this is not breaking the PVH IRQ model.

... I of course agree here. But then I guess we may want to reject
attempts for a domain to do any of this to itself.

Jan

