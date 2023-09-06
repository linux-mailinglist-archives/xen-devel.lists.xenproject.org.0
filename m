Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A99793C78
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596542.930467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrTU-0000cM-Ft; Wed, 06 Sep 2023 12:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596542.930467; Wed, 06 Sep 2023 12:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrTU-0000a0-Cq; Wed, 06 Sep 2023 12:17:36 +0000
Received: by outflank-mailman (input) for mailman id 596542;
 Wed, 06 Sep 2023 12:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdrTS-0000Zu-WC
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:17:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a7e47ec-4caf-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 14:17:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9592.eurprd04.prod.outlook.com (2603:10a6:102:271::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 12:17:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 12:16:59 +0000
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
X-Inumbo-ID: 5a7e47ec-4caf-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eka45vijPt0kpDhxMnPA6E+KgA0H/TapKNCcY89tbO6QaPYB9yWBXOIhHnv99d9EB+nIHBQocg9P3Sb+qQBRaJaR+kebxkFqWsFmnZhtuXMdAR8N0vilSTHK6C7UKvMPeoYWL3vefo7Q/sgWrVhbFqHuSfvkOiXq9ic+BbU0NDV0BgsUwDU/KefTkmLT6aFJ9mMwkh1A9WnyN5kW80AqVMpFpyI84/kMgIIEPYXMoCvYCjoZHW8axZ+nSxK0K+AURdrtXQZirE1kvrXd5LvbsLzBQY1q/BbzYL1Qpje/C/o7Dgq4EAd/0+aC9XvINtgUCOOMZLP2DVbCZGCI2Kb3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7UDn+dimNEBgHL8FiTYLskYxVWJJaEICEuZRKCFwsU=;
 b=AnJij7T/nf0+gIKCvSoi8wKO84jydCk/AA8xHL+jdAJ6rnKfn2aC5Lc7o+0n4ek1TfN2YH7xsrjU4Y0zq5JjUqPOE/SHBNXaPmnx+988rOzpmk+iUQqbboPpaAjBiA5ooVAJAPaF26+SQ+LuMaqTmRyX3bD+21Xp4A9WMHF/vyaowREZ1/S7AHAc82DGbbvl/VykQb/xSc8QAnoJxv+2ufDaHh8vyXJ77A+rdrvJ2bloNXz2UaHK60xJh/JinX+Va1cutEUfqoIlE3rZl32UA2rfdfnollNqRSXbMHC45ONYLo9yPYiidkTAOGhdLnRRu+vOxQ5KIlgJACEEXXJ0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7UDn+dimNEBgHL8FiTYLskYxVWJJaEICEuZRKCFwsU=;
 b=WeLAkJa/7kHqJEvuQw8padWZWIh3ik0dQsgBjXrIFqbODABUk9/ONdcrRJt52FGf/3u4CRr9aVvD9GG317DJ/n6muWzi1ROWxpV8G36z7aF4TqCOrQSR2RX8J5/SxhU+Yo4TNxRdEHbq4YM3WFF+HFlneL2TUzfmHNqexW4KOl7+YLbbyceu/xk7F0/bazYqZpooQp7fNBOLY/ErTvbharqQMkg5qk8gTe+Ool5llK2oJnxbiG+7/Dtzxd3D8DgjEcns5JNo8Py6aT5mFrrMKVsc3hKW9NBHa3f/yIbJQFLC3yLMYVcn3HhduRTg6Woh1c35kZSpHAKZ4n9+4QBOgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <731b436d-748c-092d-0bec-dcea5bdaed29@suse.com>
Date: Wed, 6 Sep 2023 14:16:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c49ec2-2f4c-46c5-64bd-08dbaed32b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XPOC8gcpwbMyTEHN9Xy7cbWTySM6d5SNvoNezagNxNrFLOHgZDrix4YU+PbTtL5T3sI/XzQqrGrOKKdqVpni+1cv4S8bEq4fluBpibMRhIDA8TDs8UXpf7YSgMg/xW2xRxVniG2kxDUgoLveHS639FcQd2kOSC0Aw6+kDH2hl+hnLA5W4CimIZBzrM+D8l+WAPeUGrN073bVsCt/5vJ4hCSnqFhEaFp5oY+D6pgGoLHEZ+9Rwvl7dVrDYsvHrdrj47/MKqnPRgN9Qq7Vqs+MYBniDT5ry0a26prFu3LA4oWQsSwUi5Ev0vhXerLtaXM+rvCM92AzfMNxdy59W/L3BB7LPl1rajVaNbagSkRWbtfscjtAL1t1p8ZEY/pi5BGPLvKJ4bfe/oV9b1oAP/xPAXYBgmdYOerdpfHEKEK6kvVtXiStiArlWYPRIThke01lTNMTqw/86kuhVOkDUqDPTvVSChX7KQD3FRQUjpDqPEN4S6S9uPkLtMygmTyXr4O8fbYR6gKW9vAmJW9cozqeFh8Tnt9lk8ZdtI7clf+6P0uBAVmW3AxmJi4z9jlqJ/hzEmdn6ASE2N4YqMLHRqEDncvHrXRNQgAVWaEaD/vDMt2kbi2dbYrQ41zJrrcfTjmCbznkFL0MggVsTLflnKkuPp85RC7w1GygGJ8DJbcPq3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(1800799009)(451199024)(186009)(41300700001)(7416002)(53546011)(478600001)(31696002)(86362001)(38100700002)(6666004)(2616005)(6512007)(26005)(6506007)(6486002)(2906002)(66476007)(36756003)(6916009)(54906003)(66556008)(66946007)(316002)(8936002)(5660300002)(31686004)(4326008)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFiUTdja0ZIbU9NellzQWVMb2lCTXE3Q2t1eFlUaWJJSlpjNGdRUGNSWDdo?=
 =?utf-8?B?VDB2V3lFWU9oQk5Da0pEcU1mWlRXQTFpVXZYWkZzbzZjaFFLUXlUUmFWNWlm?=
 =?utf-8?B?RU5Td083MnV6Ymx2QzlwY3RzS2NuZllvNUdlUGxTMUZHQnAyeTMvK3pUMlpL?=
 =?utf-8?B?dFY1Mm5LeHBNRHY3NkJ1akFqbXlBcU45UGpwdlpyYmcxcis2QVBXZk9wbEFF?=
 =?utf-8?B?WWdmekJnTHRVaEQ3MHRSK1J5WURjK3E1QXZhRTlId1JEVDlWNHVJaUIwTzUx?=
 =?utf-8?B?TkI2TkRYTXQxWVQ4SkJuUVhBTVM0bDhVcXp1WmJ0YlNYRlIwQ0poOXNpWVE1?=
 =?utf-8?B?aWxRTFlBOVRXZHkrbzJYVEhsWDRJV0E5SGVMMysrYW5HK2hDWE0zeWc0azFG?=
 =?utf-8?B?UHBkenRXN3Fydi90dXIxL2MrK2Joa3h2aGRNWkMwaFhQWitPYnBoVXJ4WTJT?=
 =?utf-8?B?dms1WVovQStZR0p6TjVWRE5wbmJwQVpMNzQzeURUQWdjKzRLdTBJWFFkK21J?=
 =?utf-8?B?ZWhNMjlWdjZielczUmYxTGZ6UVJ3YUNYaHJsT1F4Ty83eFR3Z2FNMm1qb2N1?=
 =?utf-8?B?c2RzYUd2MldzQkZZaEJ0clhlOWs0SndWeEM0enR5T1FaTzBwdUlxMnlNVVZo?=
 =?utf-8?B?RHpxbWZLVjZVTG95MlZhRG9DMUgrV3F5SXlqTm5CV1UxVWlLWXo1RTBOanF3?=
 =?utf-8?B?US9TR2dTSUFraDFhaGdlblBUVEFvemhrYVpuQ0F0ZjY2NEJLOG1lME9DUWtD?=
 =?utf-8?B?czZ5cFRmQWlYUVA1RnZudENCYXZwOUFHT0ZFZHJHMnJNSStJS05KWEZtZXox?=
 =?utf-8?B?dXY5OHNGZHNjek03YnJrNXpXRGgzU1JpMG5xUEMwbUdsSEp2MzJHNzF5MCtj?=
 =?utf-8?B?SDNkNFBadHlZU2ZwMUlITm56NzJlNjRyQ0FDYUU3VGdPRUJwSm1LY3A3UkRh?=
 =?utf-8?B?aDlNNURDaElvcno3SkxyRlVCaEo3OGNCY0lQM2ZPeWpjUHdTa29aTFYrT2V2?=
 =?utf-8?B?RW4yekRyLzNDbis5bEtsNHpZSjI2aG8vUWZTNEs5QnlHZGVOdGc0QysxSnIx?=
 =?utf-8?B?NWtuK0NWVE4vZHVZOFpMNVlSejFJdEtRMlIxVHpJRHN3S2lHbjZUZjBPWkVh?=
 =?utf-8?B?V2IvYkVjYUZPdXJGOUg3VUFTNzYvaTU2Q2lRazRGOUxqTlU1c3p1NlBPU2JP?=
 =?utf-8?B?SENVSDhDL2F0UDVXL0dJMXYyQVhFRU9uUGp1a0liajl4SkI1NFpEYUhaU2ph?=
 =?utf-8?B?eUpsWk5HUHZNM3lDeEpEWWRENXNsK3N5YnI1TEZpSlc2VTRxV1NmVjgxak53?=
 =?utf-8?B?VHkrYXFXZnRmY011N3JiUUViNFFwaW16cmVuSklZMmYzYlpwbEV6TzE3cHhF?=
 =?utf-8?B?RW9Nb054MGF6Ylh0R2xDVHdOMHEwbGUySGFGRWJqWkpuNm9ScnpmbDcyOWVa?=
 =?utf-8?B?WklwNG01clk5SHlaYWppVDlmdkc3VXkyNjFQaXcvRmJGc3hIL2xqYWFaSlJV?=
 =?utf-8?B?WDFET3VjbzhMRkhKVkhseEFxMEtoc3VyZ2FkaDdlNEZVRGx6ZUh2Rks0UERa?=
 =?utf-8?B?bEcxVEJuR25zVHVOelc4MWRZOVJOMW9yT2xNVmNGQW9adnQzRlNaMlJNSDMw?=
 =?utf-8?B?bVBuR3JRSlh3UlVtQXR0K1JwSGZVSDZNVFJGZkFscVl3QkgxNXZ1V0ZxU2NQ?=
 =?utf-8?B?azlabHU2SHk5c3BDclBkRGUzaEVxUkxDOFp5eWV0eTlZZ1FoQUsvOG13TW9B?=
 =?utf-8?B?akJESGV3R010SnU5TjhIUDh3UFRIVDY4YkRYc3VFYUFnWHhoNG5Gcy9NQUhs?=
 =?utf-8?B?d1NlTmRWOXF0TCt4UDNTQktLWGo0a2VnS2pkWDFGN2ZEcW50TWk4TWJvSmQ3?=
 =?utf-8?B?eEZnOFREQkNYVW4vWGFNaXlsRVd0ck1VTElaZ3N0anlIS1FXa3lSa1pWTWkr?=
 =?utf-8?B?VithSlJCTitOd1p4KzY3T3FvZGdURVFSQXdwUzZKVXlBNjlHbzd6OHFaNEhF?=
 =?utf-8?B?M0l3ajA2bStrRExsc0JpY0UxVXJUVXIyWTJOcjM4dWtrRlNXZU02VTBjcDh0?=
 =?utf-8?B?aGh5T0hUb3JpZmtTemFYMmpTV0l4MHdINDk4aXV1ZzIrdWtvZEdrYUpWNk5G?=
 =?utf-8?Q?Zo6fBolGnjk/45JF4H0aQT2QL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c49ec2-2f4c-46c5-64bd-08dbaed32b9a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 12:16:59.7797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdZR4cbvZfo8kOzSvE48aD36/cpWYPGbdNlrhcnPvcbAzd5jJp/59XmYXSsQpKmO7IfD5wulctC20LKeiuhcuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9592

On 01.09.2023 18:02, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0

While this is what the Linux file presently says, you still want to add
"-only", which is merely the newer name for the same thing.

> +# include/asm-generic contains a lot of files that are used
> +# verbatim by several architectures.
> +#
> +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
> +# and for each file listed in this file with generic-y creates
> +# a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/asm)
> +
> +kbuild-file := $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> +include $(kbuild-file)
> +
> +include scripts/Kbuild.include
> +
> +# Create output directory if not already present
> +_dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
> +
> +quiet_cmd_wrap = WRAP    $@
> +cmd_wrap = echo "\#include <asm-generic/$*.h>" >$@
> +
> +all: $(patsubst %, $(obj)/%, $(generic-y))
> +
> +$(obj)/%.h:
> +	$(call cmd,wrap)

You've removed quite a bit of functionality, comparing with the Linux
original. May I ask why that is? What they have all makes sense to me,
and looks to be useful down the road.

Jan

