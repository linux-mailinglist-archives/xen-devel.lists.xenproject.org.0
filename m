Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CA873D92
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689438.1074405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhv8z-0005tX-PT; Wed, 06 Mar 2024 17:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689438.1074405; Wed, 06 Mar 2024 17:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhv8z-0005rO-MM; Wed, 06 Mar 2024 17:33:29 +0000
Received: by outflank-mailman (input) for mailman id 689438;
 Wed, 06 Mar 2024 17:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYTB=KM=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rhv8y-0005rI-0H
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:33:28 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e59ba9-dbdf-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 18:33:26 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7730.namprd12.prod.outlook.com (2603:10b6:930:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Wed, 6 Mar
 2024 17:33:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 17:33:20 +0000
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
X-Inumbo-ID: a2e59ba9-dbdf-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw9V9IpULwYHSjD7nn46QrROZ2tl9Mm6dz2/PJKPrg2Jg04WcJdFOyv/sp9t9icrlltdYdlO3n2mWc2pP/di3xm6oocSJsMhGOmmVbpNBCg5tra2qgJIOHFg4t3Zr3Y6WiN/cqvFnUUlk0rcjN5u5HAs7cpwL+OY/p4NdTb70MijZX0lICZ4QDLS3FvQxpWOI0PQn1usrMckqfoMd1gxqN+lOmGRZhV145DU2ykMWJVu9v9Ajo3Yd8m6UawGoSeKeGFBm35jvqGDutfqpoDU2kno9ARG80uvD2Ycm95DQJ9e1sfSDWkJfSq5lEmlJyGEaDntUflx3es+LKfErCEouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SCUk1blSDm4CBP4y0a2QP95WF0lNlN6ALMTMkwD85c=;
 b=EwkaDBXQq2bdOW4+MfidivGB0xnOgEtlvfcuPKaJpZOGZuCJU6BPwKjGzgTNW00rh09ezxPyQ8gf+VWFb2lOe/nRZH7wI4YSLQvaZzOf/2EoSDszaGHe9GOdjwn1mYF0tlWpwRR78r5p0nKhcxkAnVk+95nwMfxNFJVmwnRQYo5Zvj/fzfAo3pvD9UwPFOR8UmJcQaZPNafJaeyBghWEUUTXx+7Hlvyt6wzpS1K6J0Ah7V1UHljJ5vWCWHgbUhhSKETKjsMArU0bblSrYtCKuyshrfkmvLrrDPXDe33nmb5tgAaXoycutBVygfoA/3HXIay13xjvki9GjaQTMXpiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SCUk1blSDm4CBP4y0a2QP95WF0lNlN6ALMTMkwD85c=;
 b=YZlgJT6QQw5yC9wWDeS2cN4G8jxijar4trUeO71X4MZIIw9lkisEOaxRHoI7Yq6hLkVqjpnry17OygnbCT9LBu8SPcBHAza+zBp8R73NifeYcO9eg7rz1kgVRRjRc+NOKEcjcoaX++U3tI4MAwszgST6eQ4tt5GXW1JAT7cLHOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
Date: Wed, 6 Mar 2024 11:33:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
 <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b3b19d-6ff5-48a7-cbab-08dc3e0383f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5nLoGjd/jTbvIwSi+Go/wI7vQtQKo1/P96ourzYkQhxD1qI8glzNrCAxx+RPeYTXfmbg+xZT9m1B94KNqEiXe9F1t25yNfXPR7O6YpU/qLpdjoodypdDVWq6kfSx97ymDqFy3Ai2a4R/a8t/bSWsAZ3bAIcS7zYAnGP9lkWfgJk3+vdfiewlRK0o3xyHSPnKGJKtANaczpj0UgzPFF57jI+G1t9g6PhRqy2KFeRvWBKUQDK2Bm50mqpPAv2M2B3JB1rPoo+6wrbOVfCFgBx9hA5KSF2z/klMKUPhK0YHlSG2qO8UvAutF9MM+pDdVba982wcpLEvDKGjahsiB0w3HFSRq+jTt5TeNZ3GLOojyiOUBYGGkOyZzRBcuiD9y+5R3DZIV624yvcRp1x7wJh0uNUJCCpZCmLBPXcbfIyqe6vTbJwwFA8jSRHCApObLpkBWcbxTWCWS90J90/HrOohawT+uUw4rupoF9VcNkUdd96tbE3sClPpDQKVoPJTF4tyUA6j16qYCMghi6Crha4bCylHbWVPgCPVavD/Gr9uLar5ItjEDSo036U1ON/zasncDY4WFvCLfnheaKXdDCnbf+NUBAFJ2pBVAA4vIz2C4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFpWYVVvZkdpaDB1V1Z6K3lNaE5ETFh6TTdCRVNiaWN2U3lnVmV5dXF3MnpL?=
 =?utf-8?B?RndKS3J2MnJuVEtMRTYwMVlnWGtpaFNzeUJmSFN1RFoxcitJUDRkaWN3Z3pP?=
 =?utf-8?B?YXRVQU1wMkJDTUhzR20yeXBiZGdkaXlxd3pYWVpWOExwTllCNDFhSXlJT1Bj?=
 =?utf-8?B?QWxFME56c2NhMlNpUkVucFl6V2tDS1lYWDRheTJFQXNmZWNENEVsaEhYOXF2?=
 =?utf-8?B?UW5jcGhKWG5pelpJZjdJdU9IKzgzV2FlQ2xGNFhUODB6TnNFVGo2Y0ZnYmI3?=
 =?utf-8?B?TFdCdlJvTkxxR2czZlh1M0dmVzBmV2hhamg2U3Y3LzJDUVBpM2pxcGMxOEhW?=
 =?utf-8?B?SUNjN2NOYUd3NVdNOFJkam1zM2VaSXZKY1N2NEowTlp2VlZWV0tveGZadFhM?=
 =?utf-8?B?a1RaNFpWLzNRL2ZoUEVkL3Jzcm9Fa0N0WThDRnllQkxVVjRDemV4RmRTSGVm?=
 =?utf-8?B?c1dBRkFjQ285bHhvcC80YVY5cDhBQk10SG01Mjljc1o5UDYrM2NQSjJZb0Va?=
 =?utf-8?B?L0JlOUtLU0k3eTIyVTc2TzNzQXhGczhNZjVHTllpZ0VxbWdicXhtUUN5L2ZJ?=
 =?utf-8?B?bkNTcGxOM1dPTTFZT216Y0h4and5bW5rM2JPemV3NHVjMUlSRlpZTTY0WDFS?=
 =?utf-8?B?bEJXRUJYa25nTGxZa1gzaEwrNFpDWFZyWi9SRG5OcUlidk10ZExOS1lyL0VR?=
 =?utf-8?B?WU5TQ25zQ2JhVmtJdVQ4RUxCTWpSMGdNUE9VUVh2S3ZVa3Y0a0JzRHc4V21w?=
 =?utf-8?B?RWt3aC9IOTJFK0lHS05uVU00RitYZFl6b3pCdnYvVTZvTXpjbXR3NXZ6UjZX?=
 =?utf-8?B?YTdyYU9kamN5ZlU0bTJ0eW50Tk8wZmE1eFlsdFpKeWZPTFhIb0RMZkFxMllL?=
 =?utf-8?B?SDF2Wm1TNnlGOVJhdndhWnR4VVk3QTZPZGRyb2NWUWM1WkphL0hBczAwL2Nn?=
 =?utf-8?B?clZnUE9IQS9CM3BqY2JHUm4wVkVlNEJXN0l2czVpcHliYThrZXh1a0ZvZUZE?=
 =?utf-8?B?bWwzb2p3dWUxZnVRUXBuN3NDUTE3b3pxOG9IUGF3NDZpZ0hHRGIvdXJzYTNL?=
 =?utf-8?B?anNzQkc3OG9LWHUrQ2VYV3habFcxaGFKc0dYKzdmSnIxN3dNNUZGTlpCbzhN?=
 =?utf-8?B?ckhzVC9BMzBRVWkrejExWlExZW9CV1dsc2NoNVh2WHB4VmQxMndNZ3JaKzBR?=
 =?utf-8?B?QWUzeVpjQXdMRmtlMmZQL1N5Y3UwcFl6TVV2L0IwcHI0aHp2Zk5pSUhpVGZS?=
 =?utf-8?B?MGt2Tlg0aS9FZU1MWWtlQ1gxYWx4Sk9CUEsvZCtwRVhGZ2t2TkNNL0k2Nldk?=
 =?utf-8?B?TUl6SXJWR3JtZ2xXMFNNYmhJS1ZwNkhzSzhveHNNUzlQWTIwSDJqa1NSSlpV?=
 =?utf-8?B?K1RxUjRUZTZ3RkpOZVlhMjhJbUtCQktjbCtGWU9EK1VVT2xPQ2N6WUR0dlpM?=
 =?utf-8?B?WkxHOVdzYUowZGJPemJKLzA3WWg1bmRwbHdKaXBuZllpdWNhc09iakZpMFNV?=
 =?utf-8?B?N1U4bkt2aDV6RW1EczQ5Yi9mczlXVnhuV2xub2dFdnBoTlhzb0ZnNk4xSnIw?=
 =?utf-8?B?R3dqMTRObzJVTGdPRGpwMXViZ0R1cFB2MGszV3d0ZHBjOGh3SVpNNlJTNE81?=
 =?utf-8?B?dnIrK2x6NkN6a1JGRFdWOFV3WFRCcGhvTDEzT2lyeURHNDM0T2dFUjVlRS96?=
 =?utf-8?B?QkEycCs4bUcxZlFTbGxqcHB6ZjdGdHV2aUo2Y2tXNkZReHRIelU3aU00dENi?=
 =?utf-8?B?UVZMWXpMNll4YkhCeGNqV2JkelVlalphdmxCcnFLLy9XSG5GZW1QQ3N2bzdu?=
 =?utf-8?B?M1BqRXFFV1JKYXNLSXlreDdNQVplUEFwd3ZzbUtUMGRUdHhWVUc3TWRQMU9r?=
 =?utf-8?B?dmJTUnN4TTVYNXVPc3RuM1U4WDVXb0lZVC9zS2d6M0VUVlU2dnkvWjAzOVIw?=
 =?utf-8?B?b2h4NTBmQ1JieVJXRUcwQVRWWTcxN09BTElES1RZUnJhRzZJZlJDcWFtbHJN?=
 =?utf-8?B?SDNaOWdQNkRDRHVYRlJYbGhIRjRyZVhnbWVwdVJuQjBhdlZIN2d5c0NEeTV1?=
 =?utf-8?B?YTBUWTErcENYTTVsdjFkTFB6T09EdUdjRS8vdlJuZ2xhNlRhYlNDMHZhTmUz?=
 =?utf-8?Q?X1fgk1huwZ972aFjX+BsCXfoa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b3b19d-6ff5-48a7-cbab-08dc3e0383f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:33:20.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7e4lblHMn13azAGEAX4Uh7DbuVv1Qazssf1LH5YAU5usc+CyDYNkMUcF1HoAghjOliF1T3SyT9JQwnnuyouJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7730

On 3/6/2024 11:28, Sébastien Chaumat wrote:
> 
> 
> 
> 
>     Reasoning backward  (using a  kernel without the pinctrl_amd driver
>     to ensure xen only is at stake) :
>       checking the diff in IOAPIC  between bare metal and xen  (IRQ7 is
>     on pin07 on APIC )
> 
>     using kernel argument : apic=debug
> 
>     bare metal :
>     [    0.715330] fedora kernel: ... APIC VERSION: 81050010
>     ...
>     [    0.715433] fedora kernel:  pin07, disabled, edge , high, V(00),
>     IRR(0), S(0), physical, D(0000), M(0)
> 
>     xen :
>     [    2.249582] fedora kernel: ... APIC VERSION: 00000014
>     ...
>     [    2.249730] fedora kernel:  pin07, disabled, level, low , V(60),
>     IRR(0), S(0), physical, D(0000), M(0)
> 
>     So the APIC table is not the same.
> 
>     As strange as it looks the  (IOAPIC 0) pin07 is correctly described
>     by the APIC in xen but yet differently than in baremetal.
>     But the APIC message comes long after the
>     [    1.833145] fedora kernel: xen: registering gsi 7 triggering 0
>     polarity 1
> 
>     so I wonder if the APIC pin07 info had any influence.
> 
> Finally found the fix : adding ioapic_ack=new to xen boot parameters.
> Not only the trackpad is now working but also the ACPI Embedded 
> Controller which is completely disabled.
> 
> Sébastien
> 
That's great news!  I'm personally totally unfamiliar with 
ioapic_ack=new, so I did a quick search and found out it's a Xen 
parameter (I came across
https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html).

This mentions that "new" should be the default, so why isn't it the case?

Also; I'd be really interested to hear what happens with s2idle with Xen 
now (if it works).

