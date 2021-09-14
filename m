Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A32540A96D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 10:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186303.335023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3yH-0003Q5-Lj; Tue, 14 Sep 2021 08:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186303.335023; Tue, 14 Sep 2021 08:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3yH-0003OI-IC; Tue, 14 Sep 2021 08:39:17 +0000
Received: by outflank-mailman (input) for mailman id 186303;
 Tue, 14 Sep 2021 08:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ3yG-0003O9-6f
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 08:39:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dcb82d0-1537-11ec-b404-12813bfff9fa;
 Tue, 14 Sep 2021 08:39:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-7ixzqw4GPyKPIDlMrlTjbw-1; Tue, 14 Sep 2021 10:39:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 08:39:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 08:39:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0032.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 08:39:10 +0000
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
X-Inumbo-ID: 3dcb82d0-1537-11ec-b404-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631608754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrAVZXNh4bCJ752ooATAW733Fmm6XrzqI9uo9s4JpAY=;
	b=KXV1i/JNzBT2p6pgz49dz8z7kyJ4rq6JudwwXTDFPWG/HqmWT0Fm/vSlxvRxnW7PlVHjJP
	EsovSeCW3CK8GVF6E6Y97YsyntabioTzNtD6Fl4yhc7XEz7DANZ1NLpaitHrhfZEW/V5rz
	AEZJxY1x8mmvJPbebM720GA65C5R3bI=
X-MC-Unique: 7ixzqw4GPyKPIDlMrlTjbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ybu5fnseQZNF/MCFwuOkw2QhBRdjHeK1S4D4DR/PBfTSOADFAMR6AsXkJBVfHR2MwBrL9Vf25VSSb9yI28vRT3CxdPymhIEdvknl6/bxwttzXj26jQFKVav+Bog+Pt5VKiBN5yqkHCOuGW41y2ewkHF6Kh5PkMG8btGkjTMsVPtxHVQGQORwlKQC9T/4fxszq8LcUErRu71DkwBUjneiRUuCa2iZnMmpKypjya7WFGfDFT4oxKB8tub4otXxhTavQO2Sn7NHbK4VaEt2xHkjTPs2o25EIsdoliUAUdcvWpU6+nwGbQgHEpqCtmxHzK5+krH6KqBBcf2p/QdDYB6sGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+wuUFNJGxVbJ34h7Y6G7CvvRLqWX2FD6F/vSJ208lEc=;
 b=R7mHUVaxYDwN3++87QHu35r26yNwg/grJNfBZD0D1yx+VwHgH7mO/pKTE5NLDAMtOqaiypbdEBy900bEgidhWWOUyXIxZahQRsf+KLd3/ZbCHmLhGy176gqffvCfEhmQG+UQyo+/oSg7vXTIL7GbbnMWiIyh6xxLPNmntMrtOJzsHExtqn4tIwo95p+Zs8pFPnVnCw6ecQ8N1yh3UnvHMH+RuHkjFpxiKraSK2NpCJd2B0C0SyNXf7mgCKUuRxBk807/2lcsNo0YyDQMaDcYs5Q0YEDpvF4UZ/yt21SFHT77c2FJbVdNI04UXcEVmrhFmAb2q4pjl09Iro3/A3evPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading
 related?)
To: Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
CC: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>,
 Mike Rapoport <rppt@linux.ibm.com>
References: <YT9I+Xs9wOPVCIVd@mail-itl>
 <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed6b9999-7a7b-31db-9e88-efdeecefa45b@suse.com>
Date: Tue, 14 Sep 2021 10:39:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f5a466-d40c-4cc4-d809-08d9775b201d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445AD25DD0FD06D6BD1A9D9B3DA9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fIMuygzkZvvBzjuC6V3opgqW0OLrFnwpTOAZNc3tCSJgq7LK8XimuGxm2+Yav8SetnKFs/9ccsWiCZQUsaLJZ6ohvof20ZhPrU4JJ1AJulGRW+EyFc51IytCZv8ivOwyHl54tfDjphFljPouSDyG/SBwBho7kKM7RHrd+JUxOQF2+aw1xbWiVIwYRk01J6mzcJ6cg9+Ry0LVuVHHlQn/KkU14P4BQIAFXOGDMr2/XUrI6RvvXpvmvS3KpnPhsi9+6o3YZGrXPSYWnWa65K6xfk9U/XrNZpPKw6xEUruJNj6SEuuej9hRF+lg4Pbb3DI3scNZb2dcaIuv/OurYseW60Agicn9OvUW3iqDyBRroBFWZWRj6om804Mv71klNEk7SY0OY+hu/PI9U0Not/5t6fBEC0qmGC43Ey/jYwmfyNjvMmB3Qb2bMT4i2u/ZupLQQ+hpCob5yhTdKd0E9zc+f/DSdisJQjXFiNDb55VCSjWEmdRkp5Iil+EDxwXK8x3URNsGnujQoVuzscIemkp1xX4TZq7SQoIw+y5rJ6ygFzewB9XXyT2Ayip+8NZ02CZIXzXy4k1Z+kpYEGpdzVUY35oqYcoOdGUvn/Fi7Jir5/ZuVQBez3MGqRC0jN916i9PMeJD658CnOBjPtJ7Bkma0iGI6WcwsKWwqiCLUNP2dFA1R3syBzQhyBhjangkA8ipssOr3QbbWHBvQwPFhvfym3iEjv+4jeCvb4twFm+KZYk/AHnHC/1eUHjNWWZ2CkrEXEztUaiaWZiuGWuzbjfI5CYTkllYXYSV0cXd2iNRvU4UPP5arDhHZzdO/txBIREV8zl4HWsYr8kt2PczZB0hOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(396003)(136003)(346002)(36756003)(66574015)(31686004)(5660300002)(66946007)(2906002)(66556008)(38100700002)(2616005)(956004)(66476007)(6486002)(86362001)(4326008)(16576012)(54906003)(31696002)(110136005)(8936002)(316002)(83380400001)(26005)(478600001)(966005)(186003)(8676002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U1mDhRc7AJe8ZyO5FYxNVDTmpq9GrqbhAxz0gdmhyfZ8V5U9L95Ph6jOW4KL?=
 =?us-ascii?Q?nt9VchFIgWoV71E2bFpZ8OYp2teLCVuTsZsfotDf5/dmtdSnzQGmB1mib+yr?=
 =?us-ascii?Q?7Kmoa7Foa/6Dx14xaiaPnCnxOUZADwCnk5isVqAWA3rGlZFCQ0c8U2Du1a+5?=
 =?us-ascii?Q?DVnYz1xHSH18bVOQUuIzcuMu2RkA0Ya5PXqIN0N9+h9h0+JlQtXm4RZlY0qS?=
 =?us-ascii?Q?goeTsDYDj6KrbuXP0Kis7LhlKstJPjcNmBNycr34Brg20lZgHg/livu6mZYD?=
 =?us-ascii?Q?87jeKremBrks9lPOzZvRfb/z4O8N1BCPVAV8KcaciG5v+AKYB7jVmMShpbgk?=
 =?us-ascii?Q?zwsWKmkTV51PtTEIKfVLLUONtZ33qcWuTSP9PV4bmuNh32KCOVuzaOYrjTVS?=
 =?us-ascii?Q?wPLH99ih6I+zYV/C/CPVaq8LDJ0Bhl06jvGj8yhpuhSybLTx8m4VkXVuwRt6?=
 =?us-ascii?Q?i1iy+3IH4sKSRa3pbi1DzTvYHoh4l02YfPHDYk15uEsI7gV2Ig+dhShyH1RK?=
 =?us-ascii?Q?cnqPI4RXlGQ4//p5etMvJIKtCs80v/pZukzzPlp6ZJ9ASbE5KIoDdhZTXLaS?=
 =?us-ascii?Q?OzyWeJDsbQG2MWgH0nbS7B02K5ghS/DthP/twv2WJpNLTor6H7eKOEjGZYIY?=
 =?us-ascii?Q?mw8nQPBveo5O5zMLjETfzGApcG5qn5Fdlg84cb+qj5xQzrjjE/mn1tovga8I?=
 =?us-ascii?Q?UnS52hXiKzQtJA9Q7hWq0tUpiuOxtKJqdY3/3RgS4gL2i7CUWWaw5eUrOy8e?=
 =?us-ascii?Q?on73FKfD9y6SnWMnqyEFz3+CRKRf5svBuP07CJRhjCRunO62en+kgVwaKvWY?=
 =?us-ascii?Q?ojUpEpQLHtsjANg9TGVza5dQDSHxYmjuUMuPr9+zHW5oOAjsROu97KS661Lm?=
 =?us-ascii?Q?0inBr9mb3NSWYPYtESuSfzcuovUEvnZ0FJeiLH1J/SoLWPaGcFnVh2uBh9Su?=
 =?us-ascii?Q?0ae55jNYH8C5fpz7cnJHLx6i0zGDhDME1HrTtX2vdlwnmbLqo7QDlcAnOzBo?=
 =?us-ascii?Q?t6AyF3NdnZVL+9s/X5kEG21PVejPxeS3GXFONwjxczZrWPXM6ESFMSXZwRM4?=
 =?us-ascii?Q?XOckGQcLCGNclZOGpauLeAub2XETxpY322fIkCiIPzOiwvKVhFyrQ173pUks?=
 =?us-ascii?Q?4GgCQEvkOM/kQKIanpYb/2CWPIBS+42Dnc23W5Q0zkszbEslhTu+SAp4nMSB?=
 =?us-ascii?Q?aO9W4kpVYS4FAKtF03Lo4J8NRCFXP+bUqeqVaQ1/5Bm8BwtCMnwMM6/J0VuE?=
 =?us-ascii?Q?2c2376FYvR7guIVcHBPC93o8wk461smNz900Onuum+d1eWr+sbSyS74gDk8b?=
 =?us-ascii?Q?fgBvGlO6XnuYw0Q3r8cTPLy8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f5a466-d40c-4cc4-d809-08d9775b201d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:39:11.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rppAkQOdYwbrLgt5z44IKy/+xDDqo9HUhN1BzUtbU6t+AOonysvbBoBE0FODIQuijbWedt3PZcz6WYEwR4ZwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 14.09.2021 09:14, Juergen Gross wrote:
> On 13.09.21 14:50, Marek Marczykowski-G=C3=B3recki wrote:
>> Hi,
>>
>> Since 5.13, the Xen (PV) dom0 crashes on boot, before even printing the
>> kernel version.
>> Test environment:
>>   - Xen 4.14.2
>>   - AMD Ryzen 5 4500U (reported also on AMD Ryzen 7 4750U)
>>   - Linux 5.13.13, confirmed also on 5.14
>>
>> The crash happens only if the initramfs has earlycpio with microcode.
>> I don't have a serial console, but I've got a photo with crash message
>> (from Xen, Linux doesn't managed to print anything):
>> https://user-images.githubusercontent.com/726704/133084966-5038f37e-001b=
-4688-9f90-83d09be3dc2d.jpg
>>
>> Transcription of some of it:
>>
>>      mapping kernel into physical memory
>>      about to get started
>>      (XEN) Pagetable walk from ffffffff82810888:
>>      (XEN)  L4[0x1ff] =3D 0000000332815067 0000000000002815
>>      (XEN)  L3[0x1fe] =3D 0000000332816067 0000000000002816
>>      (XEN)  L2[0x014] =3D 0000000334018067 0000000000004018
>>      (XEN)  L1[0x010] =3D 0000000332810067 0000000000002810
>>      (XEN) domain_crash_sync called from entry.S: fault at ffff82d04033e=
790 x86_64/entry.S#domain_crash_page_fault
>>      (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
>>      (XEN) ----[ Xen-4.14.2  x86_64  debug=3Dn  Not tainted ]----
>>      (XEN) CPU:    0
>>      (XEN) RIP:    e033:[<0000000000000000>]
>=20
> The domain's run state seems to be completely clobbered.
>=20
> Did you try to boot the kernel with "earlyprintk=3Dxen" to get some idea
> how far it progressed?

I guess without my "xen/x86: allow "earlyprintk=3Dxen" to work for PV Dom0"
"earlyprintk=3Dxen" would need to be accompanied by "console=3Dxenboot". I
have not tried whether this helps, this is merely a guess from having
looked at the code relatively recently.

Jan


