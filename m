Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F633AE30D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 08:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145322.267373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDGd-0002us-7P; Mon, 21 Jun 2021 06:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145322.267373; Mon, 21 Jun 2021 06:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDGd-0002sN-4K; Mon, 21 Jun 2021 06:18:43 +0000
Received: by outflank-mailman (input) for mailman id 145322;
 Mon, 21 Jun 2021 06:18:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDGc-0002sH-8q
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 06:18:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0ffcd80-629c-42c7-b8da-f4cc5f666608;
 Mon, 21 Jun 2021 06:18:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-dysjftUcPm-Z3ApCW7QsZg-1; Mon, 21 Jun 2021 08:18:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 06:18:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:18:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0061.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 06:18:35 +0000
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
X-Inumbo-ID: c0ffcd80-629c-42c7-b8da-f4cc5f666608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624256318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bK/ws4KH/gYxybM6pzTLKMKor186mLSooFL+vjHghz0=;
	b=DuwkRqWNqyIKRwETJzP50X4v1h83r19E1TJouhs85dFpNAFTJ6HnRHxTz2xt6sqm7PztSR
	VwXEmj1oMB4sFWPEG6n1kRSd2Um+MwEzDaFYR/RPCzH9QY2Lkqc2PYL+54dOxeBKF+jXZh
	fXjJZjBXCyFdbYuZUxBDCKtLCHm+LCw=
X-MC-Unique: dysjftUcPm-Z3ApCW7QsZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyyMR3E7w6gkWAms95h5uW9WNpq3q4whQ0l6qCcIC2m1riijgx6sUlsGlZWAbDA2oSbsM7KFrZRO3s/PW3gVEez/Em0F/WRoIuO3PE0xnG6bKP/Jn4UTxT8rDh2N9bUwfWkVAYKwt365XJYhKlnRdQl4CadMgfgufdgvehK1dzzWQBFaXnXYUgwxYmGS5NAw37MjheV0a70O3Fmpu6llEZeWRG/niMBMsZSHkDu8OeQE/a4RB90sw+yWCzkrJ+dIIh1HzfZTLnAatvYogPpnSuaTKF7cP0i0kHMyybOrtO8j/GMsg84u3SypjfkMyY+RvR7KBTIbYy8ej8C9RNLbjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kltkVFRlB8kDK0sQj9Q8oAUvfPDsLIYipRkAA2WSHZc=;
 b=iQJ+rpHFIudDxv7oZycBGxaOUPRJhD6BdzwhqMigDZ7jWR4fp+5wGhJogP3/7FqR+wtU5g5WjpbdgzmpeJ7VRn1YWAtWuAuqfGbY9uCL9Q2S3SlgxHwY1KkcH4bBmJqCCdLb8GMGKaYAN6F1JWmGPkWxlYAMAQYfGmU9TGoUwHWWSG+9eT15nBj76IXjUg5vfwPmlRpv/XgFiP84t0ZUUPBhd3mDl7Ea/D5TL+3vbjS/5q2vSJC8xjk6ic0UQQ6jSPRxZ8jGDGQxU4U8DnXAhCUeUPOZ0HxvUYqLYLUKhb2z7e/4TMefG+XaP093mIApxby0WbjlEgCiYGWxMHSiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
 <9fdd9760-6de7-be4c-a75b-0d3b1cc10a38@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee781cf2-47c2-0b5c-4f21-37ceaed283af@suse.com>
Date: Mon, 21 Jun 2021 08:18:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9fdd9760-6de7-be4c-a75b-0d3b1cc10a38@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0061.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecfe30d7-3835-4b5d-1ff2-08d9347c66f1
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375491AC7DCBC6E5B6350C0B30A9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gmL26AYMYIUa6R0LDlf9I8262upnRNLo2Z9RJqkij+RqEhkVEWtbBjKe4ItbW+RI7U2uUHykCydQ0g+IQA6KR3WnsHlE2y8B0dJM0Hk6bDu9A9vswXL6KxE01Jq81XXePvfLRJLnkDnn4CfwI9bALgoDFCGOWvqa3FePCIrLJAJ27OopmjVVF6CPGYGFbpsfrq/NthVn+F7Kqnep+TSOMyzCtNyoceK51cIsmPRiMR4LiaMwGUh7JdD3nVjjPbF9Q/EpEkW904FfxRqLlfL1LnmCCMCJOtKgYnvapibV9hmQaqJ/7R6lqxCCCzCtpToQQ8v3jW60yXLFg0J9ivYI3Yi+xuxyfhYzux9JxpTzoYWrBNCvS0GX8XA3DUWJgC/EQq5S1BepTB1hGIrCBoX+D5fBTtT/QSHDXnq4N9EDb69AMIMC8imJq2TVeUEDYRPBJUYEDdMLVgFIyTsVzsisofu7Whi4ei9itwHskCTZkN47zOhfR8yRTcG16L09CcowcsidI1nK8LpmS7pyftS/hKrVeVI1agUDj5JlzxUlGPlfCpfBegGIQpZypvkteHSPgrP+si4XVSndfv4V+fvIXj9mJTQHisHJoWSheeur5RMItvWGwkSlTTfcGgcYbUngi1v4pOH+fH1Upr2zTyz16go03NG1AhHOg+k956MzpZMT03BzcZ5rz78YY8biPWtc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(346002)(366004)(136003)(396003)(6486002)(2616005)(956004)(4326008)(66556008)(66476007)(5660300002)(6916009)(38100700002)(8676002)(36756003)(53546011)(16526019)(54906003)(2906002)(83380400001)(31696002)(186003)(26005)(66946007)(31686004)(316002)(8936002)(478600001)(86362001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TUJ9cVfpsClveCJnoSGsm8OvgRvPQqJhDiQ9KCYrPpX2w1eXJEeHi7In+wuX?=
 =?us-ascii?Q?bFRxkPZ4/6skHT5hsT3X2LbzioKlWSGbRMC9c8hmJu9AXPSApmXJFbSbS7mv?=
 =?us-ascii?Q?mMCPpm8Sj9l2hVtEytLkf5pQvwoLEVtYlrFYjPcDulBxpQLCXV3BPLaVtZFj?=
 =?us-ascii?Q?+IAQKF3U7/A9SzDYJL9iZuq1RKBkFJ0K0wwfmKuy3Eba4O1x/llRpa1A4m5K?=
 =?us-ascii?Q?f4yZRFFr00lLDo1An94zo1WMpG8IgxE2W9FfxWPCOQuZCqhKneOWPQ48Zasy?=
 =?us-ascii?Q?sO/bQNja9LZQlTMnGuata2jvHUiqlRGlJlk6dBBcbGmdwk4Hw6awLijBjAYC?=
 =?us-ascii?Q?sVvPgykDkW/5hg6JzLeY9NJHcOH8umK50vEYDkLM16PYFUVz3AjdJeUj7cdk?=
 =?us-ascii?Q?TTL1gGcPbRBbcOxjX9FUfH+uc4sdEWGtV4+DHCesNjfol+C84wkJSVSAQKQ1?=
 =?us-ascii?Q?iLAE6I5fTJ/HKrWVo7suh+C62FrG9QrwOSOj/wQCjhGPPcmo4LC94X4K1QnE?=
 =?us-ascii?Q?TsaASprP5a7paRqHjJZXa0kjCi82QeDKWO/sNLwGtx4zkDn+c5pE7eQEWd3M?=
 =?us-ascii?Q?eQTPxBmQenhsL1cs0Wg6vWexw9lUXl4rydonSW9e6astz+lCFezARJ+N5eoJ?=
 =?us-ascii?Q?q/0xD3icZkkSbYxSD6WS28kzZd+EBDvwuRHEeNsrCcetyIpEUAMUePOlfP0H?=
 =?us-ascii?Q?sDVy1RMSjb0eDIBqBFiH6nGoq7hDk0sA+ik7MSuD5Yzgj/KBQ8a9FGGoSNu4?=
 =?us-ascii?Q?aCT2LH8seJTnWIMhhNqiPICkobceCBT7TW+8mwFewWtZE9FAIhs9JyMYynjM?=
 =?us-ascii?Q?h1IB4IM6TuSsHZ174jXlM9k+Z5+NuHC/06x9IWJfyuyKkLZiAUMgp31KSB/i?=
 =?us-ascii?Q?qoX0gBxNHbOHc3NvrbBgwYocoxmSnKh2kKu6ysZLzYllbJwT4SQX+LoDoPL6?=
 =?us-ascii?Q?/TFAIm90b2WokTl2/mm3iIbmfxibcwemLAI1ldbbA0ZxynyROiQyrYYVXPCz?=
 =?us-ascii?Q?4nO3h2zgB9dkimXnN8+EYIp25L8BfpJrIvSQ3QPhR8AbNfg8LXal9R+4FBx0?=
 =?us-ascii?Q?+Pyhb/KU5OeEvy7mhmv/4MRjl0p0Ht+FD8aqxqxCbqpEAngM5QXgGRsWvtLw?=
 =?us-ascii?Q?WuDIeq1YHM2HjEn5CKWD72ZHwKSz8qtzN4s0z0ssKwFXGABKvzgp6/sXBjhT?=
 =?us-ascii?Q?AmI5yPs07+7QD+ut9FDyYenAkY9vybGiRPDNRWM06vmXKqhbAqHBMruImR0y?=
 =?us-ascii?Q?P56o7WCgQzrt8bXWYqyS2tVspo8KVQAiJUkEUET5gvtQr+kN7KGHGv2jGFBV?=
 =?us-ascii?Q?ANQbQeXaWS99Bhnc/y0pmDB1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfe30d7-3835-4b5d-1ff2-08d9347c66f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:18:35.8512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VB3e8aOGLo8APMG7ytqA9OdMCRx8S7Ik+n05/D9c1rGZVt6Spq9+dugBqQax5TglTZENYOF4UoKLGy8/B7Qqhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 18.06.2021 18:32, Andrew Cooper wrote:
> On 18/06/2021 17:00, Jan Beulich wrote:
>> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
>> address range") documentation correctly stated that the range was
>> completely fixed. For Fam17 and newer, it lives at the top of physical
>> address space, though.
>>
>> To correctly determine the top of physical address space, we need to
>> account for their physical address reduction, hence the calculation of
>> paddr_bits also gets adjusted.
>>
>> While for paddr_bits < 40 the HT range is completely hidden, there's no
>> need to suppress the range insertion in that case: It'll just have no
>> real meaning.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Really, this ought to be reported by Igor.=C2=A0 He did all the hard work=
.

Sure, changed.

>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -349,13 +349,17 @@ void __init early_cpu_init(void)
>> =20
>>  	eax =3D cpuid_eax(0x80000000);
>>  	if ((eax >> 16) =3D=3D 0x8000 && eax >=3D 0x80000008) {
>> +		ebx =3D eax >=3D 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>>  		eax =3D cpuid_eax(0x80000008);
>> -		paddr_bits =3D eax & 0xff;
>> +
>> +		paddr_bits =3D (eax & 0xff) - ((ebx >> 6) & 0x3f);
>=20
> While I can see the attraction of editing paddr_bits, I think it will
> break the emulated pagewalk (at least).
>=20
> With SME active, the address space reduction is only physical addresses
> only, not guest physical.=C2=A0 An HVM guest still needs to see the origi=
nal
> paddr_bits, and the emulated pagewalk needs to use this for reserved bit
> calculations.
>=20
> i.e. under NPT, you can still have a working 2^48 guest physical address
> space despite the host physical address space is limited to 2^43 by
> encryption being active.

Which means we may need to split the variable into paddr_bits
(calculated as above) and gaddr_bits (left at what paddr_bits has
been so far). However, isn't that what hap_paddr_bits is already
for, while for shadow mode it still needs to be the "adjusted" way?
We'd then simply not fall back to the "adjusted" paddr_bits, but to
the original one.

Another aspect I was wondering about is whether

 		if (paddr_bits > PADDR_BITS)
 			paddr_bits =3D PADDR_BITS;

should apply before or after subtracting the value from
80000008.EBX. I was first inclined to make it the more relaxed
way (applying before reduction), but then thought I'd first leave
it as is now, on the basis that the PTE layout doesn't change, and
hence 52 remains the limit for the full address.

Jan


