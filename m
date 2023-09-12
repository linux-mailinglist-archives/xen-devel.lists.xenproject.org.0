Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4B79CA05
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 10:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600100.935689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfyq6-0003TR-FT; Tue, 12 Sep 2023 08:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600100.935689; Tue, 12 Sep 2023 08:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfyq6-0003RH-Ck; Tue, 12 Sep 2023 08:33:42 +0000
Received: by outflank-mailman (input) for mailman id 600100;
 Tue, 12 Sep 2023 08:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfyq4-0003RB-U9
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 08:33:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12a607e7-5147-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 10:33:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8627.eurprd04.prod.outlook.com (2603:10a6:20b:42a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 08:33:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:33:36 +0000
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
X-Inumbo-ID: 12a607e7-5147-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lz0QsBbjoVBqGpZql5gpbeNJCKh4dynBAFa3OiQ4XJhGc97xUdrxIfK3jKU/NZ26JGaZm5++5iET8nQ6S6qzfH6idPmxaSL5K4g4SBY97u1wH/AbjKObbMlN5Dr5hwn3Yv9W7crutSYoVUcrLhVGs2dpp3/132wcVvVjaW9/52ts3Kb5aEcNZDpy+IoBo9AE0WRy1KhmCD4ZN5kq1kGYUIaHLwhFkVtAQy5d1AvHiQeV0C8/0YeglicDO7YomOctTHePhtnG3GSvIA3I8jIKeIGjwv0N0nPLIj24wGENmrzJZCptMcb20AxgGV38mDOxN9kndQ5CE6Xj+6IbxME4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UokJTPFJDF8NF2pA7Gm5c1cWeSkZTZ607iT3LpOYlMw=;
 b=NmNABSgyuLC5RpvBMOISRs15+kGyk9KECGGdHJwmSjXY2KHPyNoBGS68/MC1Sw0zNOyTBlI6QeiKpTVRXpB1FIPsLzsBMrcgqzixaL4EVV+UPV84o5oi7HnX0rReceYGAQ9q2g9sRGLP2KZfLINvLbuocMF6r7pc/uY85wm7bargedz+EP1PYT37WwSUzVwxtFjA/bQujx1w99ciEM5LIZ/VaQtVxKUWUyeuUiIiBE+WhZOkyxJsULiOO9+7MSQ2VJIHg7BSg0R69jF1uTZuFxOKK8tLELeRBnGNIRFOH7QLv5cLfPPcUAXyV2biavOSrNgEftL1jr6R0JTBvFsUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UokJTPFJDF8NF2pA7Gm5c1cWeSkZTZ607iT3LpOYlMw=;
 b=49oK+RszwcLfu0FcsPvm6ocvGCeOms73DJV+luqD6xlMfuB3vyQZsxUimsjoVBhW6M8w6Z3P8V5jLv6Y/U1MC48qvb+o14PImGw29naNa8Qa66iwna/A0aEGNCy9Bsfc2NUSe44C/FptEwKKkqV7jU+3FE/kPnRDO9PhshIVULBic9IYcuB/RBUZmzvOmNevNVc72NqMR2oiqykW1GLXubCo2qXfs0u+KvSImOGP1G+TrgvcSQn5MjGzKPUe1q1JvI5qyVq3iluWI7Sikxm8AJ+FpHPX/Bg9FCGrXliRIM25TYQUAxD7/kXnu5QwH4begK5WIp/bWB2ESTXDiUJHng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b08b8f05-afa5-4999-139f-dd7837db12ab@suse.com>
Date: Tue, 12 Sep 2023 10:33:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8627:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ea3dd8-0cad-4b53-2426-08dbb36af4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bs0KT5/Dg+vCEcdI1Y0v4UJcQIZ29ORMAC2pYAMQo7AMCB5HNvzy21j4bwKYQhwxmGxxp9jxk/7FRaB4BcjFO8z6305Z9fTVt3dILMRD0b8/Mu/CznwnGL6dRVV3NnZS0/eh/+BCTaP87pp1222dp1mHjpiW+i4LMPUF8QFzmE58VInsP6cvUHjzFPkz4Jv5hKO52emU75jBDOjbPiKllBjCuf34a1nBCkM0+zvPXTw5tsnYy2X6d5wbjwZS3tWYBCx8Byyi1k0rUyTht6s1A2hgAzP3+Ef94ygbBlcZ6Fe7WUy1BatnGELHeV2xF0Tnt3aROCXw+voE6540bBsUNhmp6yjDmNtySaz22lXGaT3xTtjoT5c+bH0yD+QlAmCwJSHYu6at7JXOVpyKmvGpnc150g1JhUbjQKpl85gVHVbveKQfFjlfBFUgyhT/aj8iEYZDsb4Qh05bn+lmq9aL5lpNk/VKDn0bF8WI31rhFIg5I28rmhG+NSDiPvYoyz/+uDoxODM1m+v6IGfWPFttIPASdjqo1PyGCqcuWm7Fa+M/+gzueowsLDFDw60j6JS3ixXBRxkduzaGNdt+9MfPoTwIx1tUhvyASlgk5DdMHXaVNgr2q8HcfvLzs0JiCVsM3h+7ufWlt1RbkdA0EA0hnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199024)(186009)(1800799009)(31696002)(66899024)(86362001)(5660300002)(8936002)(8676002)(2906002)(4326008)(36756003)(26005)(53546011)(6512007)(6486002)(6506007)(6666004)(2616005)(478600001)(38100700002)(966005)(31686004)(83380400001)(66556008)(41300700001)(66946007)(66476007)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVIMTRQbE1nZHZHMDBBZW1CMFU3MW1xcEJYNXRnRGtKYkZXK05wYk03eVZo?=
 =?utf-8?B?b05zYUZtUmZxbFhpUXZ1c3MzL1ZwSVppWjVTYkNPamRiZ0YxYWpqZkdtbkN3?=
 =?utf-8?B?dCtmd1UrbUVyVUVISTBQQUt6R2t0eGpQOUp5emtxVFoybmMrNmZScm4yYWJ5?=
 =?utf-8?B?WGppcU42dVpTRWNQWlhNYUJ6WEVhcEZ6YWt4OXZtV2lYVGFtLzBxNmY3bHAy?=
 =?utf-8?B?L0FhbUcyYmtsclNjNWR3UmxxNW12cmp5aE0rOU81YUMwdWsxclg4Y3h5NW9j?=
 =?utf-8?B?YnJLeGgvL0t6NDcwbDlYQmRGTS9HTlNQY0FDcy81c3pMdHRtcURUdHc3b0h6?=
 =?utf-8?B?OUNkSHlocW00N1d0ZVlNZldsR2dTQVduSG5xdEkvSEpxUTh0QnhKeTBPdUpV?=
 =?utf-8?B?NmhzNVQzV09sMnlrb2sreCt5SWhJSjlKMmRMZFVtRDU5TnVHSi9pbkI1czM2?=
 =?utf-8?B?d1lKL0pJTXdBVU9qdm1jeGxYbUV1dzB2UjllR3h4NHBtcXMza0RjMDNqYmtY?=
 =?utf-8?B?dzgvTWRIYjlVNkxWODNQU0hndFp5OGRSUjZKNEh1K2hTOUQ4WFUwakIrcnZZ?=
 =?utf-8?B?bkdvZGZmZ1pHdEdEV2RobG5BWkJMc1VhQWZSQU5YUFFUdDRPall4TThVa2NS?=
 =?utf-8?B?M216c3dvQjN4enJIR3YyeGhURit6VTZnZDlNYmRGY1dvZXFQRWMwVERBSGds?=
 =?utf-8?B?OEFxV0QwczNLZ3RON3hQU2pKNUprTWVMMkx1QXdzaGd6YWVqT0x6VStOUU9a?=
 =?utf-8?B?UVJzU2dtRmhGZGw4eXljN2xNTjl5dmNtWkgyaWZuZjRFUEVZanZQQS91WmFW?=
 =?utf-8?B?a2lhY1R6LzJ1aFR5S3FCNG8xTWZjc0Y5VVlvNmlpZ0RzdUdBVTMrOVRrbmUr?=
 =?utf-8?B?K00ybTVHZUVHUjR5ZmtSb2VEUTZ5c01GY3dETXNzbTRFRGpTYTJVWjNLUFAw?=
 =?utf-8?B?QWNzUTYvM0hhOUtQRE9CRU5mR2xKMWduTUlxTXl0Y2dJNEIyV1RhNTBMeHQx?=
 =?utf-8?B?QTNSeE9peitpR3R2NkdvY1I2N0JsOThuRktPc2xzcHpFR1pKSzNHd0V0R3Bk?=
 =?utf-8?B?eFpTU0lndS9SSk4wOXhIYWVvSVZ1aUo5azJDT0ltbUE3a1BONHFUUld1SWln?=
 =?utf-8?B?bVhkeFVMZGd4eEdGS3FteUFBZEZKaHEzZERLaFRJeXhORkRhZ0E4czRveThj?=
 =?utf-8?B?WmVYQlFnNDJlMmdub1FTREliRGxoOE5QMmtSby9aNGFJL3NmblpZNUgrTDFx?=
 =?utf-8?B?RWF4UTNSVGdpeDZ1cW9mRWJjSG9tRnZrdENaaXRlMU9paHNCZUZIdHFoZVlx?=
 =?utf-8?B?V29sbnBBWFRqMC9CZnhMeGdmWVE2dWwzY0lSNWdjRTdPN1RMVDVSWmlsd2dk?=
 =?utf-8?B?ZFVYd1lQTVN4WnR0d3lJbGJuVlJmNE9NaHRhQnh4aEZvVW5oNmJYM1NTcmpo?=
 =?utf-8?B?Z0JaaFdFQ2hndkNHYThBTS9Hem51M2JQTjl0ci92cDJZZUc2VnBBeGYvV1Fz?=
 =?utf-8?B?MXhOZitkZHVIYlRNZlcxTGZQZ1lkYndraGt6YVhQNmRaMW1qellpVjZObHpo?=
 =?utf-8?B?dzVqTUVFZlVBOG1wYlpEdURISkRTNEkxUjZ2TWFKY255Z3B2ZEEwQkJQVmNJ?=
 =?utf-8?B?ZndOeFExL1owNzR1SUJwTVFCM2kwL3Y5SUJ3Mm1kWS9pdUlGMmFOb0Fycm5Z?=
 =?utf-8?B?dHgxQlR3QnIxOUJ6Y0JSU2JMbzFmWnI3ajZHOGhpd0pQQTBiVncvZXcrUWlT?=
 =?utf-8?B?M1lQVlhsZHdrczRydlliV2xYSXpMbko5QmNESnJnMTQ0SFBBL3M1OXQyZHB2?=
 =?utf-8?B?MCtUa3JJdWNtbjJ4NURMRVlzVFp1QmxwTm9hMzN5TXEveTRhcERhMnoxdXgv?=
 =?utf-8?B?Yy9wYlBxb0dTNW1xTmdkNDRyeTdUZU9oa2FsSTZTQ2tmOE1kM01YWFhUc3M3?=
 =?utf-8?B?eUdDRzlnc0FKbEx3VkJxS3dPam9TVStOc2FZbU5wSzVhQzFWbHdvVU5mb0dx?=
 =?utf-8?B?bEJpbWhSUEk3VzhUK1Z2UDNMUHl2ZzM4MlEvZEtETjNEUDlITWVyZnNIMFp5?=
 =?utf-8?B?d3Nka1o4OUUycGp6VGJQaGlrZktxRlR2cDgvZVo2ZkN5bFB5a3ZwaUhJV1h1?=
 =?utf-8?Q?6GTUhPU2dnI3ine3AyKsFzuzi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ea3dd8-0cad-4b53-2426-08dbb36af4fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:33:36.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vMoqFcikwJ+Dlclus9pjP8Qzj4vVqOeUjW6zGW0uWJw12lRTfoaAgUOLZRmx5vMukJ0fCf8FpgVFIVZNJtYHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8627

On 11.09.2023 20:24, Andrew Cooper wrote:
> On 06/09/2023 9:49 pm, Stefano Stabellini wrote:
>> On Fri, 1 Sep 2023, Jan Beulich wrote:
>>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>>> 0xff. Linux already has code to handle those cases both in
>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>>> same check to Xen.
>>>>
>>>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
>>>> entries with a valid APIC ID. Linux would still ignore those because
>>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>>>> this check is only active for madt_revision >= 5. But since this version
>>>> check seems to be intentionally I leave that alone.
>>>>
>>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>>> This patch was committed with unaddressed review comments.
> 
> Count the number of x86 maintainer tags on the patch, and see that they
> were given after discussion, not before.
> 
> You're outvoted 2:1 by Xen x86 maintainers alone, and more than 2:1 if
> you include the x86 maintainers from other projects who participated in
> the discussion.

I wasn't aware that ./MAINTAINERS having

4. There must be no "open" objections.

was possible to overrule by any number of acks.

>>>  The normal action
>>> in such a case would be to revert, expecting a v2 to arrive. One alternative
>>> here would be a timely incremental patch submission. Another alternative,
>>> considering in particular Thomas's most recent reply, would be to properly
>>> downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry in
>>> CHANGELOG.md).
>> I am in favor of downgrading physical CPU hotplug support in
>> SUPPORT.md.
> 
> SUPPORT.md does look bogus and wants correcting, but it is laughable to
> claim that this ever worked, let alone that it's supported.
> 
> Intel got half way through specifying ACPI CPU Hotplug, and abandoned it
> as a technology because they couldn't get it to work.  Hence the feature
> has never been tested.
> 
> Furthermore, cursory testing that Thomas did for the Linux topology work
> demonstrates that it is broken anyway for reasons unrelated to ACPI parsing.
> 
> Even furthermore, it's an area of the Xen / dom0 boundary which is
> fundamentally broken for non-PV cases, and undocumented for the PV case,
> hence why it's broken in Linux.
> 
> 
> Physical CPU Hotplug does not pass the bar for being anything more than
> experimental.  It's absolutely not tech-preview level because the only
> demo it has had in an environment (admittedly virtual) which does
> implement the spec in a usable way demonstrates that it doesn't function.
> 
> The fact no-one has noticed until now shows that the feature isn't used,
> which comes back around full circle to the fact that Intel never made it
> work and never shipped it.

And note how I offered a compromise by someone (Simon, you, Roger, or yet
someone else) sending a patch against SUPPORT.md. Yet that hasn't happened.
I therefore continue to be of the opinion that I can rightfully revert the
patch, based on process not having been followed and alternative actions
not having been taken.

Jan

