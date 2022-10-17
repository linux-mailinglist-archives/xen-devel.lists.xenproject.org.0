Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C036008EF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424174.671409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLil-0005cI-6y; Mon, 17 Oct 2022 08:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424174.671409; Mon, 17 Oct 2022 08:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLil-0005ZW-3u; Mon, 17 Oct 2022 08:43:39 +0000
Received: by outflank-mailman (input) for mailman id 424174;
 Mon, 17 Oct 2022 08:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okLik-0005ZQ-1F
 for xen-devel@lists.xen.org; Mon, 17 Oct 2022 08:43:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d107c3-4df7-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 10:43:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 08:43:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:43:34 +0000
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
X-Inumbo-ID: c9d107c3-4df7-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8avUDc30eKOL4QlEhe2aqH74Bbxm/pCUSUBgfcYoYjv9V3zx8XCsmnMtmONVPfPftzcTiLbQHK+4h95OP4AZsh8kEyXfchx2wahiyC2hmdSwYxfVW3kvDzJyL8QZCD2i+Voy19zoxWNcOgtdYu4+OKRWmnd8RhknyPvZ4QIVgdo5T+4pn0r1Fs6qc1vCTu55+83TsyzsvSCJwKQE+gq80/FChXvMubi89tYRxDe9qMoscyP4Kzxz7MHpRMuEcuDz2xG+RwHuOM4kDcBfvf2RnimAhCRn88iREJQtF8Ov5eJ85LF4nPKWS/yqFmus9sx+5zCCPRaVOrHv0tdl3klOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my6NE2jctkUT5juoBWQqP9FyXBIIo4bZ4t/oX3Q0Jxk=;
 b=DluDQJBP7AbnutYGmZCCwfUY3oZzI2PGDhVghB4Yez9O9eVkSH2OFXUa3MTfgFHLntQHXIrXvU1jdCG++zYlIrK+SWNFZgPTFhviverRu4QnBXeo/zMIekcgtjBldDNYnfER/GZMn2oBlBDmPA1RRqs+bUeGT+kA5+dnSE8tgedCXw7RJCS1mXUjrzkp+i0XfOA9ht4GTdDV8I+12O9K0KSWqyuwFiEvbXf+iZ052R3vWtYFOgVnO5oipkysOSddtD2K54Tn4jNWu0ZHG11zdg9+URL2rK/CXQ7I253cQIl0CvuNUKToSHEcXTCqk0IjogoJMRYbY9EBpcWuXNYwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my6NE2jctkUT5juoBWQqP9FyXBIIo4bZ4t/oX3Q0Jxk=;
 b=q4593l3bk27UeEu+9vqOtpaFAudM2PtfDzR3jTJLHXIgnoRbwCbpGjauz19rqTdNAS9efWU7nQ9G4r93MiTeE//8q3wHo4AgbmLZBe47TU1ZHhX1OIOy4tHwoOW5jvo4df1S3iHzaDF4GQ6+8xzJXA+aqKkum4SdQy9h/XSPjZv3YN7u6TaG27G6J2zsFIWLnf0ZG4NrsYrZoqGgsMYXhHgheMEZzQa0Hj+ENH2o3niSceTx4eDWSFaFon/dX1NxAMgIuyArmm9xSOThqvGUB8JkUFJ+EaE51XL3F/XcXujlVGBexu1Fo5Q4IHXLFturhgHvxVSB6VdW2s+oQvmPSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b3d21a2-9029-6f3a-0579-e08682814222@suse.com>
Date: Mon, 17 Oct 2022 10:43:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [BUG] Xen build error - undefined reference to
 bpf_program__set_socket_filter
Content-Language: en-US
To: Arthur Borsboom <arthurborsboom@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
Cc: xen-devel <xen-devel@lists.xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cff02f-076d-4810-69ad-08dab01bad7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hz7VQKp7kQd0K3jXNA9nHVGrzGKZOLUlDvqDIpfxe+qi71ahnwGyvuzGBIOnDTS2ZhZ6MHrZxBULycmBPsBWZ86+CNKMJo546VgurpTPxvQ1iohsL1MuO4RpblGDdhQyJdkmsVDGJX1nmmAJTGXiA8hJnIqp6BzJhUzZ+nB0CgoooYH+gAk4Y8xFkboKOWe4Rek2Hu3+tilkX6Tzc9BFyVMycnrJbcpXoMTgQhZmYbXRiiNmzkx3+G8/HBZmLweYcNYTzRbiSg743ArCXAQUMQPV/gYzBh3IUl7L48qo4gasIbKXFMBSbsJprjhIh4JNlSTSWGWylj85Etd4bQd1JNTDMY0X+Bn4l2wt/W/YsLoXmOk3l6K0HYS6NoJXbhR3yXG2IzfppXtVmRh63NihNRg1Ltgm07UI8M+fsM025RSt7LZ6VZtNodPCEu6+2ipMRqUfRKOG3zl9NGhxlhiglC+od2l84/O1rj8tWr9NPlysCVf2y10fQTgpShceb4meocjHjj05agaR8SmpShHbMokdYyX0bdJq3FLiP3X/jJQ6bD3qjzAYvv5okzl/E+yDsxHyL73OSinsWzlg/SX8TyRNQqh/2/Pbsh2D6VaIKBJ9+LqDtS8MsJXkGcNG+qgh/soJY2z0Hi7s2KF7IqPPFtFzXH4K7sF0x5KFML+3X7vNHz03nCUT+cvIoSiMgydg7BL16qXRRk1FHwmyMWxvqlgcOcTXA5b2BVobdFVYlFg7uZDva7aQqg24CGsbrcRbn7GIIrUJrWMAYVHc/2lPXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39850400004)(451199015)(53546011)(83380400001)(41300700001)(36756003)(8936002)(6506007)(5660300002)(2616005)(38100700002)(186003)(6512007)(2906002)(26005)(31696002)(31686004)(966005)(6486002)(478600001)(66556008)(66476007)(316002)(66946007)(4326008)(8676002)(86362001)(110136005)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVlbzlTR3JpT0dtSHNIM1VaR2NVMkJMWFlOWko0U2IwTWdRRitIV3pPamhP?=
 =?utf-8?B?THlwVFF3eVNYUUQxM1FxeFozMXZSRFBXU09QTkZaR0NpeVhiYzlSQ3Q5a01U?=
 =?utf-8?B?ZCtvVEJXMS9lMVlLRFV1TlpUMk5ReXhHSTVZOGFwQm5JQlN6RUpqK2FiMXh5?=
 =?utf-8?B?UDBndXE1bVZxTkR5aWtuTTlIZ0lDMUFSdlRocjZYMUwySktwMVFDQjYvNWxl?=
 =?utf-8?B?UE5ZbE5peE5zYlVqUGxLa2QzeEZkTkd1UUpwSWpxMGFoTjEya1lNL1Z3WkRC?=
 =?utf-8?B?L3NUT3VFZXN5U1Vzblg5akJHL21UNkorUXZtblZTOFNQN0xKK0xPVnlZN3Vt?=
 =?utf-8?B?MDNXbEcxcHFtRVN0bURiL2huNVVtY1FsRTUveWdrTWZra0p5aDVoSkVmRXNQ?=
 =?utf-8?B?azI1WVlCRnNtZjBsa3RNd2NmZFRjQUhUcjB3WW1iZUZ0eFBZUEFabjZremlu?=
 =?utf-8?B?ZGlaa2xhYmI1cFU5MHU0UW1YU2wwK0RWMTdjdkMrNnAvWG1Zd1V0dWUwTDBu?=
 =?utf-8?B?VDFSbEs0WmgvRUJXRjVxdklDOG1rMFhVV1FVSnFyWnF4MGp6OXQ0Rkp4RVR1?=
 =?utf-8?B?OHNaM1VlTzFPNzhMblViRlpKYk1yWkpkTnJ6OHBxNDZla0VrRnFkSzN5KytC?=
 =?utf-8?B?NTRxa0c2c2dRdnNjSHdtV09RVDlzYW5veXgyRW16TUsrTWRGaHZyWE5yYkha?=
 =?utf-8?B?dStWU0tCQkRkQ3NXdTFlMW1KY0pBYkdpUEx6NUtUK1VCblFWOTJpaWM5TGdN?=
 =?utf-8?B?QUordWJqMm1wcklURmVqbUtEeGwwRnNyam1maS9jeUl3azY1YlFlbHMzRGI1?=
 =?utf-8?B?OUk1dlZuTGZka3hzR203NWx0cmZuMW5iTjNucEV4cVRwMVp0UlRGTHh3OGZ3?=
 =?utf-8?B?UDRKUnA1elQwZzZrQmNNS1VOellveU01ZVpNTStpSjlSQVZGaXlCMjZubUUy?=
 =?utf-8?B?TkIzMVV5TVhlZGpzdUtodVhXK1JpQkRCVWIzRW9BckpGM0paZHhucGdXTkJy?=
 =?utf-8?B?cjlFK3JsTHdPU2RjeWdzQnVaVlBxSS9hWVZTYnBabTNkUTZEcnhNenhnYmR4?=
 =?utf-8?B?UFhSbnBYQ2NDUVQ1dUlRc1NhSWkzN0k0NFJWbkt2bkRWbTBzV2tDTG1Cd0RT?=
 =?utf-8?B?NnFXV2JrUzhFaXdyaXdWQ3FUcTgyYklWaU13clZQUkhjbjhhbmJJdTZrNVZW?=
 =?utf-8?B?RXgvR2R6SHpVbmpSaGw2N0tSSHVDakN5NTg3a3dFaDZ6UjZKZmd3Wm8xTHhy?=
 =?utf-8?B?ZEFMU3lyL2Z3d1FOQXFOTG0zeU5xNUwyaUY1YXMxTG54dHBXdjI2RWdhNzNp?=
 =?utf-8?B?OUZxc1prMWJUSml3YnBXUzNwMmRMem9nRFd0TFQ3NlkxKzU4VTk3K091T0p3?=
 =?utf-8?B?MnVRL0FWVklYcHRRdEw0M3pmZXg1OUwxMSsya2FBUm1RamhiVmxsRmxwajlE?=
 =?utf-8?B?R0p5ek45bGpybjQ2TUNpSmtqV1VIMG93Y0draHgyY3pjcmN4SEd6eHBVUy82?=
 =?utf-8?B?bFk5NkpBejJqamZzekxWMmErVGJSRU1JQ0FQL1Y4dm9OUFdhcnlLN3FqYndj?=
 =?utf-8?B?NjNzbmxiU1dWWFlsaWs2YWQzUWdMWWJEdlI0R0swdUZ3WGFRK0tkMkZaaGhQ?=
 =?utf-8?B?aGV4T2xsb1R6UnB0dlZBWWlHUk84SEJEaU1PSW83N0MxdUxuRmRKZUllV2gv?=
 =?utf-8?B?amd5K09LV0V4WVUydHhQSmJ1TFRRQXc4U3Y5WG5lQm90YkZvOEhJVXh1RTFt?=
 =?utf-8?B?alNVWlQ5c3o4OXFIQWs1allQYUs5Wlgzc0R0YWxJT3hGbnRVcitFK0NnOVhx?=
 =?utf-8?B?SGVzcjkrcTY1WG9CV1haeTJra1JBazNkT1NFUVNtT3hDUnNtbVFwcFQ2dDZn?=
 =?utf-8?B?TjEzeUNQcG9wdVhZQTZsSzhpcnEvMk1QcHE3M3hQamFrVkl6QXVmOVFLUHNT?=
 =?utf-8?B?OEpHZjE4cmVwZzg3blgzM0lpWWtPTXY4alRweHJYWFdEMG9TY2FEbWc3OUZj?=
 =?utf-8?B?R3MzYlZ2WVNBWjI4QUJwMnhkMnJML0h6ZDc3NU0vNWxoYjZjeE9YUElRbkt4?=
 =?utf-8?B?V0o0L1ZpVW8rMkFpcjJ0TzN6NUxJeFA5eDdaMnRXc0pUQ2YzNXVHMlZhVEpY?=
 =?utf-8?Q?J/t6tCzTKWeKjefCB12kFfkCh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cff02f-076d-4810-69ad-08dab01bad7c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:43:34.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bu9sZN2OIkvKGs58IguQlBxySAszoUQakjjWCo47nvCBV5qQl7idnZl8R89X97tPZqfYvAUDC3DDBC7oWXF4kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

On 17.10.2022 10:12, Arthur Borsboom wrote:
> Xen 4.16.1, 4.16.2 and 4.17.0-rc1 don't build anymore in Arch Linux.

That is, qemu doesn't build. That's something to be taken care of there,
not in Xen, I think.

Jan

> I believe it is caused by the missing function
> bpf_program__set_socket_filter provided by libbpf.
> This function has been deprecated in v0.8 and has been removed in v1.0.
> 
> Arch Linux uses libbpf v1.0.1 since October 2022.
> A downgrade to libbpf v0.8.1 fixes the Xen build problem.
> 
> Source about the deprecation:
> https://libbpf-test.readthedocs.io/en/latest/api.html
> 
> Build error:
> 
> /bin/ld: libcommon.fa.p/ebpf_ebpf_rss.c.o: in function `ebpf_rss_load':
> /home/arthur/.cache/yay/xen/src/xen-4.16.1/tools/qemu-xen-build/../qemu-xen/ebpf/ebpf_rss.c:52:
> undefined reference to `bpf_program__set_socket_filter'
> collect2: error: ld returned 1 exit status
> ...
> ...
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:156: run-ninja] Error 1
> make: Leaving directory
> '/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools/qemu-xen-build'
> make[3]: *** [Makefile:212: subdir-all-qemu-xen-dir] Error 2
> make[3]: Leaving directory
> '/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools'
> make[2]: ***
> [/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools/../tools/Rules.mk:161:
> subdirs-install] Error 2
> make[2]: Leaving directory
> '/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools'
> make[1]: *** [Makefile:66: install] Error 2
> make[1]: Leaving directory
> '/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools'
> make: *** [Makefile:140: install-tools] Error 2
> ==> ERROR: A failure occurred in build().
> Aborting...
> -> error making: xen
> 


