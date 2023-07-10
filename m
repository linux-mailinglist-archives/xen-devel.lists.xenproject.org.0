Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8E74D09B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561084.877385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImb4-0004pR-K5; Mon, 10 Jul 2023 08:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561084.877385; Mon, 10 Jul 2023 08:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImb4-0004m6-Gm; Mon, 10 Jul 2023 08:50:18 +0000
Received: by outflank-mailman (input) for mailman id 561084;
 Mon, 10 Jul 2023 08:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImb2-0004lj-6s
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:50:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9815b39-1efe-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:50:15 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:50:12 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:50:12 +0000
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
X-Inumbo-ID: c9815b39-1efe-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaO1xj4JoHLku5CYQbUS123Ny7IqPD2UHr6tBo4c/mYDzYnJEY5/0BLJmLcOi/bjv1EYOXLjpmYuVU9vpkw+bxc+oh0bpfX9GM3bwtuUzrOhIrk8z8GRkVJiHytcEjlqBs8lijIMOrgOBhWwlcPMcvzn6MwAvYYNa2AaLV0G+AEizk7yuxoo+tvT4D+G0/r1j4Yj9nNnZ8htVmSRpyqb6VSmMHfXkvVmFYxDhneah1kifEhldf3Hr4W4P1Xy8O9zI1i8W+3WpRdUXCoCmKgTs8xj0tUciZ54dxf+QWiWge4/LFhHgM9ISQ+QqG0RJt0kXzmOTIj2UKaUst8yUiaKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxmprdSxQ7NzIrnBHDl/E2ygyuGSmIFpCgkPRy/wVPs=;
 b=ocdOS/mYJydWNbpgmhvToUx0WOHSZBkOWEHTfwB0zCfsi0m/yo0ZmWUgUS8U4l5pwE6qd31/SmL+imjc/u0V5vXmY9HCZiRqPruiiBXSqNZnxfswAWFjdyw66vuI1TUeQfh5MD/lSax8lAatzRkGjAjxmqSGB7Qt7ryzXR0TTDTE+64GTlX2WR9UQ7XucD5SDsuJNAk4N3UBdv1dg3nWVgitDiQLVkia7QO8F1OhhhlpPS+nDy7ztRFJDDpw1BSqswq/fPpqUtWV6tBzJXDgcSPGsk/QBzWhN62ky6nbPYR1xEpuoQ5nKF5br+LSbQ1oHtiy+NfkzWM8j6C8XAlrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxmprdSxQ7NzIrnBHDl/E2ygyuGSmIFpCgkPRy/wVPs=;
 b=V7YLnALy+5m1in+N7mYRbH6pX0N//s1jUEza6vpl65mJ8C7JjD8cjq445eUnaa29mb7sM4n04LIIzzjU5qWW5YN3KqV/tS8p2ce75fqDLpTMqNotWDlDncIM0yi2YPEDyYm8egADF6qMd2wxY/QZVh/7Qj22BcAfpCSFFhazn47kKZrO85wyPBj+13VKxKR7OkeU/GOmx+qcdHmmPkMNPvsn80UuxwTzCEi8m9QIA0CEr3QvhulGyFbjnFG1DbB0U22xzB6oE9M3eaiCobNGK3BR3sqMwORO/86HyiIF/enishXs4CEhxxiSCiUhomaOOIRahZKkot/vT+EcTT33yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Date: Mon, 10 Jul 2023 10:50:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/8] annotate entry points with type and size
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Language: en-US
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: e984f691-b1b4-4e21-4402-08db8122ac09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWCqke3SW9FeyZrW2mtp0wRG8E5/TP5sKLS0Nszo3oa92EZhi7GkiTBR8pakxPzWjpOxHad4C3M+2jOYUMlfykHqGEPN8LxfQc6DBlgI0aevkaecqqlPGYXT02QYqQCAqJ877Ltx++0fm4fxFDUFwUPcPnh6j/kJepGm/dyh9V3xsDYUa40k1mSt1v6kBYLxB4qXRKae+DifId1nPZ194qsiuMcDxD/CMxGLPQBqonqEM1vXMFHxt4ojDtr4GDnsEi88/orzRRbci2ZYq7QcdeA7+VkHqIf9PWKEXdb5ZxjSmKLs4N4ZP8tHEW9OYvsQWdYMoEE/BaG5KwSDW0sKpIORPkSPLOxSc+htRxM7Q96XW7gjZ9wq5Dn4qVubeDPbHwhusL0Cyj0K7f9Hbr+R97MtdU/tjuCnHOP8/rSmwB/2UjB5vVJ99HiWyd/VxfSdARqehMerKyd70S5qeuIcCboiG/sNoePEoKpVsF9yUyhsx0+hEb/r1gdp7LfHwvYQCdUdVBYd3MMxF9bcut52NLEhj+9gV/soM1BAagMiNPVxMdEMaWhmcOfEz4x2XCajCV7lWcRSMZeOuzMJBlj6Djj4zITC7fZZefC3pkUANjFKzVx6QdiIPEOrjWlJMQ2AnSpKmJ4pPsK08WS9QOflMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(41300700001)(4326008)(6916009)(4744005)(2906002)(66556008)(316002)(7416002)(5660300002)(66476007)(8676002)(8936002)(478600001)(66946007)(6486002)(54906003)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1ibDcza1dpVE9UTHZJNUVEMUFxR2ZZM0taUzhHUUNyNnFOL3gwWXJzMXhC?=
 =?utf-8?B?dG5FMEhpYnRmQzBQejFTNmZmTklkWFNoaXlGNjRIcWRoT0lmTlk1ZnRvZUI0?=
 =?utf-8?B?QUF2cHZUd1NuMzk3eUNZenFqMitRZGRhMTc3NGZDclAySVpaWWpBWFIxUUZj?=
 =?utf-8?B?TVBuVk1LeGhFQlNxUVhobnZxVEVONzVTVXhlaXRZTzRhOVc1dm9PMjdONW53?=
 =?utf-8?B?VUQxSm9LZjhLQVVCcGUxWUV4NU1IbGFEdmc5SEMzQWVDVDc0ZG1rTElvRWlr?=
 =?utf-8?B?NDJZdXp0TTVHMjFDVlQyNzlXNzk3aEtsVVB4OUEyOERKVlREMUJ4cTVLTUlF?=
 =?utf-8?B?d20waDBIdERFVjRrdUdDZnFPUEpkWlJpM0VsUU5NUlpZcklGZXFQT2g1Zm9Z?=
 =?utf-8?B?T2R1MVhPTG5GUG9aUVpua1cyM1BtQ1hQbVBOOEpnaVB5N0djT2IrNjRrMldp?=
 =?utf-8?B?SEp3Q1BOdmN2NjJPckppaklGcFovQ04wbFpNL2hMYzdMcHNkbm9VSloyMnFy?=
 =?utf-8?B?a3ExZ0svMm0xcGh4L3J3UzR2QXZ1d0ZkekdCRks5RWFidDNJNVgzbTg4Tm1V?=
 =?utf-8?B?QW94ME5GNlQyR1gyMllHR2ZsZlZ2K1NYd0xraThqV29WbTlrNkpqN1BBMTFE?=
 =?utf-8?B?VmNqQmNSN0x5K3o1YXJGdmloOS91ZDJBUU1icTdSMTkwWmdsbkRpaFhZTUlm?=
 =?utf-8?B?bEMydUx3QjEvb0FCMk5yaERyQWVwOVo4cmFoaGk5c0cwU1gxNXJ2Wm9ML2V1?=
 =?utf-8?B?ejY2VUE4TTJDOFdKMDA5cWxFZVkveTJKQzFiZHhrZzU1QXN2TUNRd05nMjcx?=
 =?utf-8?B?dXFGcHBvRlNiNlZmOHNXSUxxdW1JYzdUTnFDcUMvNHM4eFlweC9uK1VSeFhz?=
 =?utf-8?B?OVYwdjhicXYyOGxBM0hUdDU0YWhWcFdzcDhTRGNmTzJMQ3l1WlVRZXVpVlZl?=
 =?utf-8?B?akk4V0JDRlpFUFcxMThIcFl1aXR0czB5WGE4R3VxN3JtSE1MRk5HdEttR0xx?=
 =?utf-8?B?L0hXMFh2TGxReVljMEJIZ1hWbmVPVXgzTHFac3JQZnRoTjlPWFAwMU1sT1Bu?=
 =?utf-8?B?Z2J0MXV2QUdyaWNjWFUrd0lNSkp2eGRRZ1RIOVc5Vkxad05pK2NabUxzS0ky?=
 =?utf-8?B?STlwYjBGbkdlUTdkQmdzRzVxczNPVGYrejJPZHJuU0psOHJXUC9yUmJlUHpy?=
 =?utf-8?B?L0FtTEVMVndDRHAwN2JsQTNOQndsYzJEOGUvdndpOElZdXlxbGJ5ZzR3aTV5?=
 =?utf-8?B?cjM2NVBZN3VKaWlSRGRZWVBtZmhWU0dpNjEzcXE1K1F4SE1zWU1NbkdYWWh0?=
 =?utf-8?B?KzhTWkJlMFZITllGQ2YyZ0RCc09pd05jZnRpbXpkc1BYRXVDRVg3Q3A2THZr?=
 =?utf-8?B?MzVmN2c0UVBOQ3NuM0VYNko4ckY2NzYzUGFvZ1M2NlppZ3NpcXcvL2RJc09Q?=
 =?utf-8?B?SWdRYkR2UzNEcHozc2dpVWtXNW0yVXhpL3hpSlg4ZmhLS3hDdk9XK25TSEo2?=
 =?utf-8?B?dTlaWExJZGRRWjZ0ektvQlFXaFdBQlRvVTl4bFROQXAvL0xrNkkvbFZxS1Bs?=
 =?utf-8?B?OXRFT3psdkZ5bzAyUWNIYlhVdXpQZnZZbWZNbUdMQlJWVmNXMmFUL05Makxt?=
 =?utf-8?B?QXNtOUQwT3BCMlQ5Szc3NVpzRW5xcFE1V0oyWDF0L0kwek1xa281bDZPaXlM?=
 =?utf-8?B?R2JiTGQyekRLLy90bnkycnZES3BBekpHY25XMXVNN01jTkJEOGNtMi9Vekl0?=
 =?utf-8?B?MFB1amN5OHVmNUtDMmZzeXFFNkdqS3hGelVsM1BNREtRaW8vZEl1aUwxb0pk?=
 =?utf-8?B?OUJ0bFhqNm43NFlFcUJLZDBPa1hqOVVmMmRiUnJJeUo5YnJFRUR5K2phNlYx?=
 =?utf-8?B?eEF5TElIMHZsbFdZbzlZdlFyRS9YUlB5aHhMN2R3ZG9KRXg1azlrWHZ5aWVB?=
 =?utf-8?B?VFpJWVpIcFRWeFBNL2VpUjNGa0N1RGNEc1c4NUJUZEg0M2R1RTRmREVmRXZ1?=
 =?utf-8?B?SktRVUhCZ0lVeXlMRjBwNGgrS0h1Mm5RZlpMMmFlT2JSd0hyL3JDOUlhUHZ3?=
 =?utf-8?B?dTRiSnBoaWtlcHNGOHdGcUFzN2lmZS9JbjY2ZzhubHhFVlkzYldJYmszMXZm?=
 =?utf-8?Q?msUyYbW34FGbIL2X9gCzfEb0m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e984f691-b1b4-4e21-4402-08db8122ac09
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:50:11.9994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JnsAA/h9D/ui3wAYLIgX3PL/kX6DE7ZsGOo/leoKBl9vhC15fcY6F9ZZ+yxyyih+Vt619pGqvSUuCi9vzbghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051

The model introduced in patch 2 is now arch-agnostic, and all arch-es
are being switched at least partly (to at least give examples of how
things will look like).

1: common: move a few macros out of xen/lib.h
2: common: assembly entry point type/size annotations
3: x86: annotate entry points with type and size
4: x86: also mark assembler globals hidden
5: Arm: annotate entry points with type and size
6: RISC-V: annotate entry points with type and size
7: PPC: switch entry point annotations to common model
8: tools/binfile: switch to common annotations model

Jan

