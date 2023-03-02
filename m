Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7764F6A7DAD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504795.777168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfI0-0005AT-U3; Thu, 02 Mar 2023 09:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504795.777168; Thu, 02 Mar 2023 09:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfI0-000573-Ph; Thu, 02 Mar 2023 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 504795;
 Thu, 02 Mar 2023 09:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXfHz-00056v-Fg
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:31:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e7a800b-b8dd-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 10:31:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8478.eurprd04.prod.outlook.com (2603:10a6:10:2c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Thu, 2 Mar
 2023 09:31:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:31:45 +0000
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
X-Inumbo-ID: 0e7a800b-b8dd-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad1BWbcNoW2rWRWibZIRGxoF04cxNSnbJM/dR4vbQUnzSjx/EYJg4usmU0tWY9Iy5Wm8obMp1UIkF8FemccjYv2M37uL/Eor+lV8Xys2vUwmHYLWuqhmTjeZghVh0o2wvEnyHWKIDfsB8lS2XxlNj2Xwu7aFWhfW2Mj4dsThq7a2BD+93q7rvid1ctaChAtwYbyvct6GpS+SbYQxINFaWmv2gr/PbWC9JXJKKu62LY+/qsVnO/HCf9tI2SQeswPt9HHxxeb/cAbYoF+NpxSTc+51Hlc+neoIruZXIRz0TODZGxNYol7ZPxbgOy87qwjXR01aVhU8OqEZnsN3A70Z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TT3i/n3hKwgXET+xG1lzhqRgoYk9dOxxsMk3LZZnuM=;
 b=OLeLG3M+q6FH2EcnDwQ/urc8pCBLnZbXVeUYNzAFSSDpo8iJYkyyHWLdj2Vd1XFXv6FQK7OmI5/8ZYpU7Gayex1vl6h2IJSmTsvR45x56x2aGHEk9n1AvGeFQoTxKjWOPB2NqTVAaMLOiZqHkVSO/XySQADxxrTgWkKrLqUM735RbL5+snlydLhNsXh8MQyU+iS2lcYbp+PsbtM2bbYeAUSMMUFhr9WrASGKYh3vBQupxhjk0jQC9M5xV5xmcGcZjoJKTLD95corTT9YtWKeH9v9b0x9o3KqIGqK4MwFZ8zVEbBJz9ID9VjUUUMCCMQuNssA4zOhuceofxOWVmLFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TT3i/n3hKwgXET+xG1lzhqRgoYk9dOxxsMk3LZZnuM=;
 b=YoHAf9JZixs1nAVZ/MnYLuTgp5PjI6HcrxOTqt9bNx3NFdYXJW4nQdqinArw87yTz8jovmbN7nZaI30tKU1DPiOkyNiaU8x1LFoTT69O/38ESgGNc2Oi4zbW4599SFAjaV1dAEP2PXlZxd6a2YKC8IvAMByx4+v+RXSGuQ6Fo8oIukadO5bUcsqv55Rg6oaB9EnYOO0Na3y81MGd/iV5cr/WPTejoEMk6gLqvPqvd8Uz+9z4AcoVm/no/aK3WFUYvK/8LV9hLe8nymfXldsVFOZ2B8wzhq/RXVAVq9Oxe1H1g8FR6YyYw33lYonigA7oNGfuiw4UaGAE0Yt8rsdmxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50bb46ef-6c0b-99b4-939e-06ee788c56dc@suse.com>
Date: Thu, 2 Mar 2023 10:31:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@cloud.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
 <20230228173932.28510-4-sergey.dyasli@citrix.com>
 <4fee8e81-79d3-eafc-b806-ea061216e072@suse.com>
 <CAPRVcufSx6PTGKaycZBj2j-92zRYnHqx=8YPH5EOnWf9ujwAaA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAPRVcufSx6PTGKaycZBj2j-92zRYnHqx=8YPH5EOnWf9ujwAaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: d896a6a9-11ae-469a-aa3d-08db1b00f022
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsFiB0lX7XMjcZmPWuV933+ksxLd4g61uPanF5jmBR5dYXo3sjXEvHx4pNloCvmG7HPG7RgKaR3Xlsmk2GbUUlEWDIBLtWnlWrk37Bs1VbjHU0o8s4JoexlSaVGayiMy6xDAzB3Mm4KRxDJITpOpJpl7BILkgxxp5Rjo6TLeCcPahCRJa9t2p7ZEePcOdmUU1H/WBV5nqbHE0yyNGDuqyXmSTduY9XP3pVHcIK1mWm8VnK1a2HIG1WIcZCkHNDNI6AWtJ0Gs0pzRVdIkdCZw2X5MHIP48yw5oKwThXz7vZNg4V3zBw6Xcb6lTpAeCZdchG9US3qRZ1xXQQw1DrdCfYNT7S/42ivVdPM/u4EETybi/aJnlNuAIklJeS06HGkp1dqu9vA0OQ+yP0CJUHAzLWvzruHmngfBULB8mWGzq/aJ+Tuxv82I7RQwxb9lKjNmKcP1IU/1NwKm5i197kulFNbc9USP6USQyyiSABW4bd/8iCRWvdUFU7ySBgZ6Ly1FGoLQrO6cZVftSs/fuwZ8epyrWL262ip/RmZqWKlzlLTL6gJ+by9/wqrY4BSWVA3CpEkhRRGCsh+ekPqfwo7uGs4TxxZk4gu1whBkG1AGNZmF+9tpHqOUJA+DZIzYinEoRgOWEJUB8fL3A4daBRsYNzCp8jqXtydswFGlTspApIjiY+nmSzbJv4UUP05H3VkArp7TqQnlsf8PtTfuGgs54i1Q5Zsn2TD+LvMaz48PIqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199018)(478600001)(6486002)(2616005)(6512007)(6506007)(6666004)(54906003)(31686004)(66899018)(53546011)(26005)(186003)(316002)(66476007)(8676002)(83380400001)(66556008)(66946007)(4326008)(6916009)(41300700001)(36756003)(8936002)(7416002)(5660300002)(38100700002)(31696002)(2906002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFFud0VCUDQ0TUFmM0lMMXNvYXYyL3kvNml2UG40TWFObUVlRDVvSUN1VVJM?=
 =?utf-8?B?aVZDYndKRSsyQTdQR1NvT0Iwbk94Y20xSmN5QnRNb3RrS0xyaWIwZ3FLZmNL?=
 =?utf-8?B?UDBGMGRkOHlEQWF0emZJeVFLZTdESHQzYjI4QXJQc25MVTBGSW1OdkJDdnVj?=
 =?utf-8?B?RUtMVUZ1WlBaaDZBN2p2bmkyNkhhMFZuNWtvK0o5d1ZmRFNUWTJSbXJaYVJq?=
 =?utf-8?B?eUplL3NodU0rcjZ2SlRKaHVFbkpVQzFVNnhTOCtVbmwwZjVzNEx4TmxwWHVa?=
 =?utf-8?B?Y2x6NzRhRDJKUDNSSmRsMEErT3gzeloyb3ZmRlNva203ekk2dzh3UzBpbUQ3?=
 =?utf-8?B?R3p0V2xTdlpMUEtaeTBjRDBjK3BwN2hSZExJODFJdkU4b1FuVWZOd1l2MmZm?=
 =?utf-8?B?Z1ljcFRDRDZIVytoM3RzZEJjbGc5WkxHK0lGcTVqbEVlOEMzRVFUZTI3dkdJ?=
 =?utf-8?B?RGYxMm1hOWJvNWRPaFFOVjQ4eU95UEpDRTdOcDBvMUtleGUxcFNUOUJ1TW9H?=
 =?utf-8?B?aGxzT2JFazFIR2VzOVlMZGF6MXBYV0cwaERyeFAydm9Ld3NJU1hiNHdyai9L?=
 =?utf-8?B?cFdndC9FZFEyMmwwaFc0K2xZSThLam43U21WS0I3R2VlNHdKaHBoS2lTRmlT?=
 =?utf-8?B?a2VQdUtQVXBGQzJqOVNjWUlJUk5INXNja1ZiSTBTSnU1TlJKMFNGQWVSbVYx?=
 =?utf-8?B?dlYwK1Q3VDhWUGc2R2dETWZxNWw5MU5QQU4wbkUwbDdvVlRpSVlsQkxsQSs1?=
 =?utf-8?B?Q28zWjhmOUJYVWVwWUZSYUhTOEtZOGppTmliZ2M0QnppU0x5eDJYbHlRQnRF?=
 =?utf-8?B?Zk1sQVd0aDM1VHVUSENzMzlqV1FTRjN1TnpzTC9aaXZEV0xnL2ZDQko0bENp?=
 =?utf-8?B?cE5zWDhTUGxDY01iNTVlYlpHOVFNaHpyVklsLy80L1F2QkZWN1R2TEhlUkFr?=
 =?utf-8?B?VGV3ZElvbU9YQnRxYk8vUGZYd1FtU0doOGVHNkJjMFlXRnZRZWw2NHVYVm1D?=
 =?utf-8?B?LzFENThoUVZCZForZW9TSmRsUVJvcERPOUx1dXFNUEx1eG05dmVaUlIzRUhB?=
 =?utf-8?B?empwemM1Lzc2QlE0TGtLbVRZcUs3dVRSVjA3akRESnVRUlg2WkVDNk81Y0gy?=
 =?utf-8?B?UHBPVUt6K0ZrbFZQNDhmWTJzM1VJakxiYVZTR3FtaXVSOE1yVWwyYjl5OXRv?=
 =?utf-8?B?QXd2QityYUdRWXlTZTJDSmF4TFpjWGR3VldoTzNUOXQ1WmN2NEZ6TFVGeVh3?=
 =?utf-8?B?eGRldFEyRSt1L05NTzJpVDlRMmE5Rmtrb2dsbXlFN3hVY1JabndLeXFYVVVZ?=
 =?utf-8?B?djNwald2Zjd5d3lVb3FLU1BxWGw0V29RbTZTSm9WR2QyZWlKZFBJaGZLSFQr?=
 =?utf-8?B?NU0rQitGSysxYnY3cjRUYVRtMFM3Rms5SkdKVTF3SEFXODVDUGVacHJGbVpE?=
 =?utf-8?B?emo3LzZ2VjdRYkRyVktCblZFTGlSdE5KSFlvZDBqSUhuRDA3K1lzYWdLK2E3?=
 =?utf-8?B?L01kc1JRbzB6c1JPeFJCcUdxTTg0Z2xOUUIvamVwaWxNYk1CN1pMOEV6N0tE?=
 =?utf-8?B?dnBaSnpNTFE1eC9CWTRaMUppdXZnL2NYQTNpZ0VKTkVxcDI0QzlpWlNsb1pH?=
 =?utf-8?B?bzF4Zk54emxEbWU4TWw4bmdCeFZ6Qm03aVpQamVYQUNOaWpSSGNUWGkzT21I?=
 =?utf-8?B?amIzWU02Z0hhK1dXRnk3SVpRc0tKSzdRZHdWL1BWaHNtNFdFaWVlRDZnRnIz?=
 =?utf-8?B?VzdmUVpPeEpTSGxwUmJzQ0s2TTBnQjhhQ0xLTGlSVHdGTkdEbHNpR3QxdCtN?=
 =?utf-8?B?S0FlZkJsa3B2SFNQS3hwb0tXcGJ4eExlbTNyYXdJdUtXUkVFQ0JXK3dTZ0Ja?=
 =?utf-8?B?Z1ZTeDZIVDFTQ295eW16WU1CSnd4Ry82S1NsR1ZBcHh0TkpMYXA3QUp4SVha?=
 =?utf-8?B?bi9tSEpZY3BpQWg2VXArSTlFYVY3V3NwTU9ZRGdZd1k3QlN0UVF4ekJvY3Z5?=
 =?utf-8?B?dGMxOUpRc1Z0ZW9ORXVkbUZaQ2FWc3Ria2VXQWxKdGczYVk0VjZmWk1EekdF?=
 =?utf-8?B?VWFJNFRKeDB0NEZ1RXFwNGtBbjNjbmM4RFBVaFUrWDdpNm1wc1ByL1BVUGRl?=
 =?utf-8?Q?lOWuAVQ+szWkOQXcjpzpcqP/+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d896a6a9-11ae-469a-aa3d-08db1b00f022
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:31:44.9248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 408xvnZ2TEkzkoJo4NaxFgeuwn6e78DBOW9HX/AYgHit7xMl/+Q9t0RMAXwMhrTlA5kptIoG7KQ0hcdMAff5kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8478

On 01.03.2023 19:01, Sergey Dyasli wrote:
> On Wed, Mar 1, 2023 at 11:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 28.02.2023 18:39, Sergey Dyasli wrote:
>>> Add an option to xen-ucode tool to print the currently loaded ucode
>>> version and also print it during usage info.  Print CPU signature and
>>> processor flags as well.  The raw data comes from cpuinfo directory in
>>> xenhypfs and from XENPF_get_cpu_version platform op.
>>
>> While I don't mind the use of the platform-op, I'm little puzzled by the
>> mix. If CPU information is to be exposed in hypfs, can't we expose there
>> everything that's needed here?
>>
>> Then again, perhaps in a different context, Andrew pointed out that hypfs
>> is an optional component, so relying on its presence in the underlying
>> hypervisor will need weighing against the alternative of adding a new
>> platform-op for the ucode-related data (as you had it in v1). Since I'm
>> unaware of a request to switch, are there specific reasons you did?
> 
> Ideal situation would be microcode information in Dom0's /proc/cpuinfo
> updated after late load, since that file already has most of the
> information about the cpu.

If that was to represent host-wide information, Dom0 would need to gain
a parallel mechanism (e.g. /proc/pcpuinfo) covering pCPU-s instead of
the vCPU-s it has got.

> And the closest thing to /proc is xenhypfs.
> It allows the user to query information directly, e.g.
> 
>     # xenhypfs cat /cpuinfo/microcode-revision
>     33554509
> 
> Which could be used manually or in scripts, instead of relying on
> xen-ucode utility. Though printing the value in hex would be nicer.
> That was my motivation to go hypfs route. In general it feels like cpu
> information is a good fit for hypfs, but agreement on its format and
> exposed values is needed.
> I can always switch back to a platform op if that would be the preference.

I agree exposing a certain amount of per-CPU information in hypfs is
desirable. But whether that is to be the source for a tool like
xen-ucode is a separate question. If Andrew doesn't respond to this
aspect here, you may want to talk to him directly.

>>> --- a/tools/misc/xen-ucode.c
>>> +++ b/tools/misc/xen-ucode.c
>>> @@ -11,6 +11,96 @@
>>>  #include <sys/stat.h>
>>>  #include <fcntl.h>
>>>  #include <xenctrl.h>
>>> +#include <xenhypfs.h>
>>> +
>>> +static const char intel_id[] = "GenuineIntel";
>>> +static const char   amd_id[] = "AuthenticAMD";
>>> +
>>> +static const char sig_path[] = "/cpuinfo/cpu-signature";
>>> +static const char rev_path[] = "/cpuinfo/microcode-revision";
>>> +static const char  pf_path[] = "/cpuinfo/processor-flags";
>>
>> Together with the use below I conclude (without having looked at patch 1
>> yet) that you only expose perhaps the BSP's data, rather than such for
>> all CPUs. (And I was actually going to put up the question whether data
>> like the one presented here might not also be of interest for parked
>> CPUs.)
> 
> Yes, that comes from the BSP. Xen must make sure that all CPUs have
> the same ucode revision for the system to work correctly.

Yet Xen may not be in the position to do so, and representing the "may
not work correctly" case may be helpful in diagnosing problem reports.

Jan

