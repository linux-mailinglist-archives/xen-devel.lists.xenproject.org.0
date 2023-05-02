Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDB6F42CA
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528536.821838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoAl-0008Tv-1H; Tue, 02 May 2023 11:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528536.821838; Tue, 02 May 2023 11:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoAk-0008QX-TW; Tue, 02 May 2023 11:27:54 +0000
Received: by outflank-mailman (input) for mailman id 528536;
 Tue, 02 May 2023 11:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptoAi-0008QR-Nk
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:27:52 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe12::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dd3c46a-e8dc-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:27:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Tue, 2 May
 2023 11:27:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 11:27:46 +0000
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
X-Inumbo-ID: 5dd3c46a-e8dc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4BbJ2WtFMlwH/xIgqBUosHoNGpHeN4SOvdzvm+y1aqyNI1svP2fkQMVP+ciD9y/MUuADR4cRgTQCzafMKGeAHjWMnAjlKtClFB41q5hpOwQEsVfL89zLFb48IGnHiAlU9Sa+csrGCTho1/vug2JY1GI0BUUzcP1eku0tHHEdSEiTpHcrI6oBLO80zeHCve8r4bR5PMRrYgyzzhBe83iAo7gGMJE+nXDujcvNaMvzj6PIRInR5GsjjervXSJFes1776p+FYz03ZdVO0/SX7/QVkPdHeiqKo5oCs799b9R/AHuUh/YchqNj9igKuyQXvwFWvLNla0XhEp26o5ZAeHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB9bahqQeSO9ULtaIOJCrZaIgtCz4kfEoGdjEEz10DY=;
 b=KJb1NTkiWAfURYKljwQO68ZOOLqd49eSDsjp9w3/WXAW8k6B1hf74xacLa24VO5mHM3oWZfNNukTlFcRFGUFmtGQTWPLRWc9RzFNex0zvI6VBqdz+NOS3GRORsMeNZVNE1iM6rQf2Aaks/5pHPy7xEGTNGLuRc1YIYKpp4LOr3YUqA3l/gJvNd1fGCmYklZEXLvv5IB0sXpVp6Dwz3+u4IuNwWrlUtFF7/VDbiUEkYnJHWnYTc6JUAdx/xUxW7fO0uwKY7eYAkF3jUOGyaTR+63+vRw7RgVxQ/F2tbUay5tJ/eGwxc1LeBLINS3uZ3nz1XGHkEIOuyYSMC5FUwGAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB9bahqQeSO9ULtaIOJCrZaIgtCz4kfEoGdjEEz10DY=;
 b=Ywgki5ZhGPL4/Jowj+sKehesK0CYRq+EjpOAgpyeuqW7uQKUtiZOmeuyEVecAOCiOPujEM1GQOhtBafO+Xc5jf/f3anVAGaCBXo8R66umTCUblME5bXYaqiF4EOfABQumzhSeM2USnUzS3THtz+OX5AzhLQAVQro/XMtRt9qDnr9vB30YdW/yGkeMC2KSZviXamFdvhkklJaxmiluwFX2g1QFSblpVlMF2+PDeCobOURAPBgSgtaQgl4eJcof4nTll+1836MskNjMuY3IiRQoPMITtXGTvEum3DR0oxQxl5Z2ekJzDihIitLhNWpzpyClswIFuleSf7GMEH120C5vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3485b49a-08ad-157e-f47e-1a6826339cfa@suse.com>
Date: Tue, 2 May 2023 13:27:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC] SUPPORT.md: Make all security support explicit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper@cloud.com>,
 Roger Pau Monne <roger.pau@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230428081231.2464275-1-george.dunlap@cloud.com>
 <CA+zSX=Z3Sr+OOoM3V-oVG6ooGFG7zmpqnAEdBC4q8pnmgfx7JA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=Z3Sr+OOoM3V-oVG6ooGFG7zmpqnAEdBC4q8pnmgfx7JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 882adbc0-b881-4fea-9b6a-08db4b004084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZR6Yx1YAg7XrqPIEDOb8l4oag5brQp8Ee+49AJe6gO9X4D9XsR8+f/aNAECHWUOzlq5D3/h3az7BKSgahJEkTmF7jCZiExvofAOHoUpaTccp1TH/IfPhpuNzd7ZIGMWwXBJRGFNf4WWZRm5t0i5rWz8l/o7zwcl4utoYxSkG5Jk3YirVe144jiT5m9+F2GT6ky2sscI58EfxqwaVTwsHAI6ze4W0+8ait7qkKHPsI/cmZ3+jXCfSeVLGbMzS3h3elnG1fQff1D/dszALEqg0WHc8u0AiOf/+Z2HenNS8RPlTCHPuhgoUyx3CAK9LVD2vU48wIicGP1LRCs1f46Majsil1RimXUd6+4BPlbeVM4Vi2KQfZ7QJgah6eGHyJgky8f+oW/Xgep49XNuTlzTU1MOk+N7+n6K8JuYLNDoYs0lcqTvgoyTiHlQ1vgc+Ahniomrtr1Ue0LJOa3PEbuxkMt8+bIcC9Z9iK3QpqKpKF4YAVxOGoq3tvQYCsqezHeFTlWvuZ4fw0yUGeDbEUHbO5SkWSXWwa1vFGqDVtkJ+yPYfUGZGJHE2OnONV/l6Cib8Ol4TF1+vC574jfBDizZ/GqcpvmNJVX88Xh5rTc94qzGH64hE0yrfjaOB/CS9H4tW1xhLNVHwZ7xoh8WdgWTBHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39850400004)(396003)(376002)(451199021)(2616005)(83380400001)(478600001)(31686004)(186003)(54906003)(4326008)(6916009)(66476007)(66556008)(66946007)(53546011)(6486002)(6512007)(6506007)(26005)(316002)(8936002)(8676002)(5660300002)(41300700001)(2906002)(15650500001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVU1Q1NZMHVidWFqR1lnWHJRN2NDcjlmaHIxS0xOYTVNeDZQcGRvdDBBSXJp?=
 =?utf-8?B?Ujd4b1VOTllNRktTZC9XT0ZQbHVvSXd2aDRlN2FkU1U4azVUMk1DVFN1VUJs?=
 =?utf-8?B?cGZwd2lYSTZ0U0ZTNCtnV3YveVlyQkZWYS83dFl5ZmNqSktWRmxId3NDYURs?=
 =?utf-8?B?U0tPUmNsUWl2NXNnZ2QzZnpvazVXQ2hyekNyeXlSSmt2eWVRV3VBeHB2S011?=
 =?utf-8?B?RVdxMEMza0JJUmkzSmVHZmlXZ0pZWDdwd01ST0Y3d1dUVkUwNjJoOEQ2SjRS?=
 =?utf-8?B?R3hLbWI2MEpaVm1mYi9FQ0Flb3JPWEkrWmJ2Y0lWUjc5eDM2Sm12Z1BlU3hu?=
 =?utf-8?B?V05sOFZvejVvTUxVbWJ5eWluUEFCdmJpTERCUDFoakYyaGEvaSt1Y2E5SlBV?=
 =?utf-8?B?MktLMS80Sm0wV0NTZTVzck9tOU4wdW1vUWZGdHlDWWRKVVVON3VOd1NCRXgx?=
 =?utf-8?B?V2c1Q1ZySjdRR3FQcGk4YlQ3WldUc0JjL0VmenZhVFNYTFFFT09OMFFmV1dU?=
 =?utf-8?B?NFJNZnpFU29mMmFmSnIrNWo3aWNRTUN2aHAxZ0VNbE1Zak9oemkyZkh1WnNP?=
 =?utf-8?B?UHFzY3VtdGFJNUtpYnJPNk1qR2VUTWNFMFNyWGR6ZFkvQzAzWWU1WE5XSC8r?=
 =?utf-8?B?V2kzbzhyY0hGK2xuVEkrYXNxSjRDZnU3c1VTRlVtK2ZHeGFWZU9udkdxZ1lw?=
 =?utf-8?B?WFE4aWVoQlQ3TEJKNEQxS1luWXp1b1RUb0UzTzJ4RDdJYWJoaGZhVENTeGdT?=
 =?utf-8?B?eEtLZjdKZUhqV01OSGtNRHVCakk1NmpFdnQ2cHlHSHRoUUo5RS9MSEVZc3BO?=
 =?utf-8?B?WUhDTmdHYjZmL3FjMksrUUgwR1Z1bW50Y2M5bkJxS2RhOHJwUzJxTllYUE1s?=
 =?utf-8?B?SVdlNjZjSTNhRjQ0Vk55cEVVbW5mMVloMkhBcUZWb2VmaHJucEtyK2dBeFp5?=
 =?utf-8?B?b0sybEJDOVlFWW5KakprV2ZkYndsb25pakJhMzRjWWdCa2hZb2ttbFVQUGNv?=
 =?utf-8?B?SnVNUDhNOUp6c2ZDeUtrS0p3bEprajRLTDdIY1E1c3RlaERFemtZMXBpUy9H?=
 =?utf-8?B?K2ZwUEIwU0VDQVFTMnROZk1waXFvdzNwb2tyQjllWjNTQVZ1SEFCdmFHbmV4?=
 =?utf-8?B?NGE0cjV1OGZDMVRibTJRZXl5TU9EQkNFb1A2RllFMHlud0FLNCtFM3Y0dTJj?=
 =?utf-8?B?NFJrcnhseFhENThuTnFNZTlQM3VsNERNaFJXVmFEcTJaeDh6K3dHYW5RVGI4?=
 =?utf-8?B?REpqNWsxSmNuYTJ0Vjh4eG9ZcGJnY05UWTRFT0pSY1lJOWZ0MC9neCt6ZUpK?=
 =?utf-8?B?aUdZOGRRQy9UbG80Wm9kdU14ekUvL2dXbFVNUHZrbGNQSWwyMUJjbmZWQzd2?=
 =?utf-8?B?eExmK0ZOT1l0YlNDbThORXB6MzFKZ0tTQlJvL2RlYXd6aEluTGJTTzNyWkJv?=
 =?utf-8?B?NlpRc1ROdFJ4S0p0NjdSN2lXcnRQc0trRnNiSjlmNVdvcnQ1dTRUSVM4anpl?=
 =?utf-8?B?Zjd4eVNPSkZyaU8vcVFNS00wUmV1UjliUmQrSXN5WkxjWmoxalZKem5Ia2V4?=
 =?utf-8?B?NHFoQzdRU1BvN2hqODFoOTVSdEpkTmZZRlgwbzd3VnZ6dnQ1K05EczNJOEVK?=
 =?utf-8?B?Q2M3Nm9pMmpJTFJqUmh0REZmbDJOc1RXR2JMSWFKSThlem5UeE0yL0ljRTUv?=
 =?utf-8?B?N1NvYTdBbmduZmxwVjBtU0FNYjVqdm1rS2E5NEhEZ3JMdW1ld0x6VVRVelRj?=
 =?utf-8?B?U1BJenVGMHc4cXhQUkk3dlBydmt1a1ZVUjNDTzlGMEtiODYzOGpMWUVMUHA2?=
 =?utf-8?B?MDF4RHN6ZHFyQlptNHJucHBwbjJ1NnRYZjVnK3VzWCtQMVlFU1VERG1XNEcx?=
 =?utf-8?B?cTBNdDdqMDFrbmJuTW0wTGlyc1JPTU5JMzFsbDNtbUhyNnRZY0pXUlpNUWVj?=
 =?utf-8?B?aDlnYytvUzVDRFdja1BHbnUvNEk3KzdObjQ5cUdmUmgvS3hJcUtkSWFKOTkx?=
 =?utf-8?B?eG9iNFZjR0pzVkhMcFRBcjZmS3N2RjJjeUNFRGR5UVNQUjhGLzh0QVR4VHNw?=
 =?utf-8?B?UDdOWlo2OE9XQnkrQkl3a2VHNEcxYUYyU2RldGJvSURGQ0lVZEpPeFg4M3dO?=
 =?utf-8?Q?xhvXEgi1ATgcd6sG0CstCjqBD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882adbc0-b881-4fea-9b6a-08db4b004084
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:27:45.9082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UM2yYJ7gwFaho+fziHmSjd44KeljhOHh4D5OWU1Ko3K/ytlDkZ6Of5lpTk9dZuOvc8UU30Scku8GAEx5D1t0FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

On 28.04.2023 10:14, George Dunlap wrote:
> On Fri, Apr 28, 2023 at 9:12 AM George Dunlap <george.dunlap@cloud.com> wrote:
> It occurred to me that in many (most? all?) cases it would be more
> effective to define the security support parameters in the
> documentation itself.

I think I agree; the alternative of needing to look in two places (one
telling the syntax, the other telling whether it's "legitimate" to use)
would be prone to people omitting the 2nd step. And this isn't going to
be meaningfully more work right now: Any option we don't mean to
security-support won't need annotating, i.e. like in SUPPORT.md absence
of an explicit statement would mean "not supported".

While in the examples you list only command line options, I guess the
same could apply to xl.cfg / xl.conf ones? Albeit I notice xl.cfg.5.pod.in
in its title specifically says "syntax" right now, which then may want
changing.

For Kconfig items it's not as clear, because I wouldn't consider the
various Kconfig files "documentation", yet I guess we shouldn't require
people to look at source code.

Jan

