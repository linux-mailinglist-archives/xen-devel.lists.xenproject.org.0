Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1B72DA03
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 08:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547804.855399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xi3-0002fo-Ng; Tue, 13 Jun 2023 06:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547804.855399; Tue, 13 Jun 2023 06:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xi3-0002dC-Jg; Tue, 13 Jun 2023 06:40:55 +0000
Received: by outflank-mailman (input) for mailman id 547804;
 Tue, 13 Jun 2023 06:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8xi2-0002d6-Er
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 06:40:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d4a3c8d-09b5-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 08:40:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8058.eurprd04.prod.outlook.com (2603:10a6:10:1e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Tue, 13 Jun
 2023 06:40:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 06:40:49 +0000
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
X-Inumbo-ID: 3d4a3c8d-09b5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZgnklRPt8D36LLGDkArjM+DiePgQLq8+Xbc/Oh96GEshJxAhicEzNT3wrZwM/Ca2p+13II0XI0cI9+R8L9g72QFOARwO5pfwBAykK1g0IcOotvQ2+4SBHep0FTBnlQthTPBNSOAt8ael9k2+fkDB+0BQlrrJ3q89In2L2CWvLrTPCS8a9VEeUsX90uEoh1fDkmX97/jIIbDSxy7BOq62wdJGxSr6hbagBobPX4+3Qjs+WGW3itTmzs02pRd3TAY0PYkAMkDrQkfqmvWgedf0DQPXn70birL0yfgWCw/p2gmm8ONQVQgGeJDK22ZTp2CmKpPp8nZuybF5CzViQAKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8rmfH8XWbpnCAIraSrFCNwK/fJUVmByhZJOTLmcmbw=;
 b=HBQEzZQnYCVeSuqklaDDcqbPuExlvLW3HGFVwCGj1sWlcrRPSlJZgy47iDlk88FHOR9EDxdscQV521EzrVOEbCRTrmpLo4zQoqKeSlv/ElvoGO3nalArAT74LC39YHIb/7t96uEds/CVfnjSYOZoGV6epH8/y3NCs8/JGlG3aeNs9+EkA8OYIzUkSCdClKPahETLEBpQJ2c7N6p/SxMnj4DaHLQ9qFtZw7dGhc5OjWMcf3Q+acvGTwEthG2LDBX5w3SwNt9fDDKRdq+fB8BgUCvAE4+aaOjJHXMOsOQuY0fOjMHKCR71klzJ4tVUMGDIDsvAqm09JWprqGbCPBKvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8rmfH8XWbpnCAIraSrFCNwK/fJUVmByhZJOTLmcmbw=;
 b=C3FeDSAS4c8ZYKS/RS7t/grbqI06QILPb5yyx8tlrkD6SrTA35qyBDkLBeVBp/K3pPo8u+lD0dU8BJA0LjK3hoyVvGnChlQmTzcolY3DG+Lj+7ZhdWtMnpIh9oyoYAWjYQUY+4YBFlUZnSOPAR8J+EAgjxnU1LhqFiUs0szHTHjvPML0oyJlhpxMwk1m7tay1Nmv3fo4xgUvtQTfxDWhMzJazA8qfaGtWRS0UiKu6fvTwuckc90ExRrDPLHUxSxlBt8poofcJ7+hauPmyiY1UN7zSLpMhW3GgP8cxbD9TLdgz74TXSSCKdN9eZiqCEXhXh5HNmmsqm+kOywKQmmRKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62192fa4-ca15-92d6-6b53-db81111545e4@suse.com>
Date: Tue, 13 Jun 2023 08:40:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/4] x86: Read MSR_ARCH_CAPS after
 early_microcode_init()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-3-alejandro.vallejo@cloud.com>
 <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>
 <f1c02253-5f49-eade-97f5-cdb188e3c327@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1c02253-5f49-eade-97f5-cdb188e3c327@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b693504-1c85-42a5-915b-08db6bd92030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D2ae6nrplC4XLuo/76CaIsdaPjh/+J5/tBP7xEyx032JdrAQ/WS8q1LVlIMfylm+JR1/Or1ruti95ZGZFcR3hawUt7Itya23oJJQnNAD6uQf51kemb7Xcux0fYgxXNCLxbXIvEDbku4R0tsk4DRQfNd1JUkf6XIikp7i1ZP8Iz0Iue0w3pAaCkU0vECjzRwpUwBqKzSkrExyQptObyne7H73KnwgegWdHHbZgm7GOC+RtblUvMU7IUo3vZWHU/tBdhFBqajEV+OE7iTKAYlrCb4DEZw5HRDzEfoArdDL0cNdqs/8xBtSZxoweR4/E1R8dY+At5YmHVJo02PF6Ic/AoYj1PHigctvRAbd4c27+G0y4pttY/W9euqz6KOk9PWCZH+IxviOjBFTtnns8TSKK8+kLYi17/layS074KwJ/Mt6CUUCcDwR/lVi19ezhOzBP7ZoNKvbtTq60pCJ8wwIXvbN6zIV+3wlsjjA4POl2UMhBsKjxwqf3yVeQV/e8tZDSWyW+VGMgDMLdXm6ptW0WGx+HMXRMTDShxFAzYj+Q4zthiTr7o1LY1yS+wBnrcxRcoEYY7zV7RY+1c5EkbnGm0EUGsCSeG7RLg2k4A3TGlp+6NelUYpNoNdxhj4sz/DdlUVjOC7/JhtwaxAwTA8IUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(6486002)(478600001)(6512007)(53546011)(26005)(83380400001)(6506007)(186003)(36756003)(31696002)(86362001)(38100700002)(2616005)(4326008)(66556008)(66476007)(66946007)(316002)(8936002)(8676002)(31686004)(5660300002)(41300700001)(2906002)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y011eCtHS3Nqd080RXpKRlZCVVp3b3VRL282REl0VzJNRDF2ZWpoY2NSTXdS?=
 =?utf-8?B?ekloK1AvcDdWcWFjQisxKzVXYkpBanlNVWhIV1hTOFJyVmFhVCtZdmltazl2?=
 =?utf-8?B?b0ZkSVdkSFlEdERwNkR3WmhQV2RvcVA1S2RXSGdyVjl4UGtUdUxGWkJKM0tD?=
 =?utf-8?B?WXNEUnhSazZMMXhyRHhnUlc0MXltSWF6ZGR3dE1lNHMvd0pESTAxVjhXOGw4?=
 =?utf-8?B?TjBKc2F4SDI3aFV4YTZ2MExrWkR4QjN0NGRjTGIwcnA4b2xhRHJrY3hSeWRO?=
 =?utf-8?B?Yk9nQW9YM3pDZE9vcWYyQ1o1cllTYXNrYkplYlJrZmw4VHlrTEVBeHptMGk5?=
 =?utf-8?B?MGpwdFZjQkszTi9neTBXSVVtZ1JlNzlGeTBiRGppc2E1Lzg2dk15MkdSclUx?=
 =?utf-8?B?dEJtaUdMaFR3OFhBd0VkcVd4TUQ1QVhSUmN6NFlTY0h4MnhvLzNudHoySG80?=
 =?utf-8?B?dWQvaFpkZDBJdW9XcHB0b2c0ckEwRG1WaTB6RWVCemJFVmpkY0ZzYk1mSVc1?=
 =?utf-8?B?RGZ6ZkNXU1BndmI1SjRGVFNrRlhFakZkbFBobVhWbjZOMUR0SVhXRVRjOW5h?=
 =?utf-8?B?UHNvRVBJRzZNWUliYUhySjdPd2xlc1ZaS3NFc1RMU29la3lMQ0hBR1BsOUht?=
 =?utf-8?B?VzBqKzlVRit3V1hKbDFFdUpYYlNjSUZwaXZiTkkxNHZleUF2NS9DVWEyUEds?=
 =?utf-8?B?RHVCaktDanRDcG1GVVp2bXB2OXBkU1FLUzVYa3FJRlgzS2lGTnBRSG93a1Ri?=
 =?utf-8?B?SXBRWE1JMS9uWlBrYWFRUjRKZjJPMmROazkydFBIWDl6dUsrak5TUXlpZFpl?=
 =?utf-8?B?OGV0MEU1TlBpVW5Kd3JDcWVYc2I5MThYVk1zdytLOXEvdS9Ld25ZZVdVbnFx?=
 =?utf-8?B?MVYyYmpvT3dGcHJpVkVPZHA0bjlwUFV3bDV4UFdPMlNsMktXYmk0NGMrNko5?=
 =?utf-8?B?RVN0WUNiUlcyRjh5Z25teWwzQU5SQ3I4Q2FVeVZiYXVlQ3N6WFlKSEJ5Vjg1?=
 =?utf-8?B?d1h3WHI4WC8zenAxZnNpcXVkWlFsU2pRbU1VUUFuNWZsbFErTW9SVktZUy84?=
 =?utf-8?B?cjIrR2xlU0x2K0trWm5GZnRiZFpRTnhwazNkVmZOdEEvaGhLdmVwTE9LQVhG?=
 =?utf-8?B?V0JnZGZUMVU0TUsxeG0wbXdQUG1ER0ZGZnBlMnh2eFFDeUhxeVZCSHlKRDNo?=
 =?utf-8?B?aU95UmgvVk1zVmdHeTZmeklzcEE0WTd5OERGNVozRUdqTXp1a1AwaTVPcVZh?=
 =?utf-8?B?S24xZXVvdzcramJLQWtBdG82bVNwcStlTVU4OTNMWDY0TzRwNDhBUi9SOUNW?=
 =?utf-8?B?bUIxVGpoUmdjWmVWYWJTdGtwR3EzTXpXT0FoMHRIVzBKK3NrbTZoRjdwMndu?=
 =?utf-8?B?N0hhU2piVXRKSzJ1dlJ2Z1JBMlFzL1F1emxLRmtZQVZTTys0ZWZISWdSR3RL?=
 =?utf-8?B?TG1udUtuQ0hQWGxVQ0RFUEx3NmJUY0xhTndTQmhDcXZMTy9xWE54QWJwTzg0?=
 =?utf-8?B?WmVRdy92Nm5pQzdBeFliOVZuOVl3NXo2R3dyU1RpRjc0N1FaZkZOUzZDZUVz?=
 =?utf-8?B?Tzc5Y1pSMUdyTm1nTzZ1OTNiVCtocnBkdkRWTURyNDN1bjFJYmpWVW16T0hW?=
 =?utf-8?B?Q0RwUHA0aEsvMjlGOXhNOVk5eTUvdnltSXpSNGxGb21ka3NaSmo2M3ZCNmZ5?=
 =?utf-8?B?ZWVYZGpoQWRLMHpvSC93blFLaGx4MTFsb3lDbC9BVFJaT3FKRHB2bE5IU2tz?=
 =?utf-8?B?Q0NFYXhYUE0zc2RDK1ZrdGNtSXFPNzNDbGFFblJPd0hpNnRlTnFxcytLeHZB?=
 =?utf-8?B?UnVJeThlV0RQTlZpVm5adVFTd015Nmk5TllLeUdVbWtONEZDZmpsRG8rdml1?=
 =?utf-8?B?OHlTL0xUc09XR3VnOTJXc0JzNTg0YUhHOFp5YmNMYzhtb2ljNUVRMzFJMXAx?=
 =?utf-8?B?MmsvR21nS3VLMGkxOGw2YUd6OWZmR3dWYk9KTTdNSjdpc0xzVnRqeXdzNTQw?=
 =?utf-8?B?S2xsNUZEaEJKNG9xRFRXMnp5WGk1SzZGM3lVeHlGMFpmMi9qaWJOT2gwalFz?=
 =?utf-8?B?WUo0Rzg2WUREZjB4SkEvZ0NGK3hvbEtJQS9yT1poREliS01BOUZjemh2am1O?=
 =?utf-8?Q?4FwE5Ay6Y7UuNPVUNgh909B4k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b693504-1c85-42a5-915b-08db6bd92030
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:40:49.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DiGfQS21yyHQZG+mZkdytfhsbqwEQTMHdn2dm8gc1pNJR8srJYTaXbp3q2xZiCcy15GoQHctK8WxO14pP8xaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8058

On 12.06.2023 20:25, Andrew Cooper wrote:
> On 12/06/2023 4:46 pm, Jan Beulich wrote:
>> On 05.06.2023 19:08, Alejandro Vallejo wrote:
>>> @@ -878,5 +887,17 @@ int __init early_microcode_init(unsigned long *module_map,
>>>      if ( ucode_mod.mod_end || ucode_blob.size )
>>>          rc = early_microcode_update_cpu();
>>>  
>>> +    early_read_cpuid_7d0();
>>> +
>>> +    /*
>>> +     * tsx_init() needs MSR_ARCH_CAPS, but it runs before identify_cpu()
>>> +     * populates boot_cpu_data, so we read it here to centralize early
>>> +     * CPUID/MSR reads in the same place.
>>> +     */
>>> +    if ( cpu_has_arch_caps )
>>> +        rdmsr(MSR_ARCH_CAPABILITIES,
>>> +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
>>> +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
>> ... "centralize" aspect goes away, and hence the comment needs adjusting.
> 
> I find it weird splitting apart the various reads into x86_capability[],
> but in light of the feedback, only the rdmsr() needs to stay.

Hmm, wait: When updating a CPU from a pre-arch-caps ucode level on one
that supports arch-caps, don't we need to re-read 7d0 here? (I.e. the
call to early_read_cpuid_7d0() needs to stay, but for a reason
different from the one presently stated in the description, and
possibly even worth a brief comment.)

Jan

