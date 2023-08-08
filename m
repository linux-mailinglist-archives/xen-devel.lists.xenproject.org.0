Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457FA77380A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 08:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579248.907145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTFkN-0002YA-GP; Tue, 08 Aug 2023 05:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579248.907145; Tue, 08 Aug 2023 05:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTFkN-0002Vc-CK; Tue, 08 Aug 2023 05:59:11 +0000
Received: by outflank-mailman (input) for mailman id 579248;
 Tue, 08 Aug 2023 05:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTFkM-0002VQ-0b
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 05:59:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeecbadc-35b0-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 07:59:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 05:59:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 05:59:04 +0000
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
X-Inumbo-ID: aeecbadc-35b0-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C29dsAKW34byNOvfiZG6+HMKlZEzQvwnbCHugjRvdZeZ8zTfRnWkt4eMnbAK9RysV4noNPKjTqXBOvkEBq2kmRHbTL4LY2tr5sz9PZlC3ojc2f36a4PJbZUTXBZskcFGKUhaE5YN5X6rRlv2AmunUf5ViwIVKvys+b1GQfoxrCb1A9JL0QzrUT4yn/1QYvXQ45ZjVdl4yloAcD0xu9Bnpu5cnJnyiLbjUn3qRyzWcUc+dFzbNfIqWLJNCn0eny0TdJHACp+l7JC3eW6qcicSoRUOOdMuHUV9Bp6hdGLCL4KaB4/EzWKPEP5QGiQMZNK0QTusat5aPKUythCKzDszUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m4ctNrmOfO/RfePvyQSK2MCUsiV+pzkfaZdvF5ctkM=;
 b=F/gADHFb6Cjti7y8cbW5kp66P5h1rxPOdDkD57JMYInY3E7N3vLtlFYM1YHdsEjrkQ6I9dlQpyH1/wvvjF7iDsoBZkte67at5//9XT8lIKRkllAvxaeP3/qBtjQAUp6fNWJgTRcLaM89dWyA57ZgMBzq/sYUOsITFpI+eCUJqFPmpgKq6RZ8bAvxQ/5bFonzKOL1mvtxJ9AWHt7sXCgqd6qTeaSwXdNWA5oanuGhAftJjhoqagKzgE30+nlHc2kA+GIUx4H2UVj3aeLq1KW8tr1A+o5nNVg1CSNmZlfvOo2Xsel3l9n9HwTRreaYqBCNFxj6k5pK8hOcxSuXqFKspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m4ctNrmOfO/RfePvyQSK2MCUsiV+pzkfaZdvF5ctkM=;
 b=aaRDP9J5p9a2P9qsxGOd66qPC78hF7Xd3Z+4CbGOVgKgh3VSU0HFRR1qU1pHR1y2uVNO8t4/0nFM8Qph9zBmswussjzTJtyvjZJZjyyK/bzQyqnOWfvk4feVFTIoMs717cOYftuUyI/p1C4wFURgyiSWm+/pu1+f81ViVPBPeldkfBL78ebzHU6W+R7/gY67Ni6kUwsUNv+gIjNLdTmDn8hXADq589Jq1MMzaaItHujhIo5dxeCWWLs1njkGeKn5NMJV3umOkLvf3ELAM2GngVhaXhhvtVWg/UEeyt7a3lsEy+YxLa4VJ9jlgkb6kag5wByY2OpVk04F+b+6QelTrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b60bde3d-0c7f-9ed0-3820-cb99b49da81b@suse.com>
Date: Tue, 8 Aug 2023 07:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/4] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <c72c242988295b665a8bd235a351806dc112ad01.1690934409.git.sanastasio@raptorengineering.com>
 <d3c5e9a2-918d-5b6c-b0bd-34b61d00c769@suse.com>
 <62c8859d-8904-ce30-019b-df976378256c@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <62c8859d-8904-ce30-019b-df976378256c@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ab680d-5d18-4810-0f1e-08db97d491c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	btg+o0QNExR+kIzFTWGQEjf6NL2j4ZVlFJkhO362hTlGlbv/R623kHaBbxIFBQAY6xK03Vuo3sqg5hjOKOszrPFWW4H0Zfpb1O7PTUkRJ0aiGtNW5eI5k+Q1mll25dJh2n/ZxGqBUYrPEC3av+WCiWxTMcvNxkNKssX4diO7lbSuxmKAQelNRuemTKjHq4EXaaAvZME3x6Kc6dq7FdczLkC1E3pUXLq8X3mbnMi1+Bcw/Q+lweQPoM9vRlcOofUbIkkN3MDYMz7w+XdJzjaeyFs+YI6hGFwOwNQmATn0dBBI4+BMvpdFzcvfTcNJk9QhdRieSAtl9f52Ht6wyUnyDQx/u07NTmze0fXvyQ618vuv2QHlmHcSzYQGygQr5fZr5In/n//iHvccbL4S2cQlGw945lmUmTUrVQTJ9dKOke+nZuRAyuQ1rL6hjM2Nzuh+4rv6LMNdpG4EipBPQclg6VjgyokssQ+SiP+al4LL2/u4t0za/+GyTNdjsjeWBj5q4Cu4Y1Wjhz9tP7wIUOOqrRFWqvA7moS8Rfdskc7/zonNYT1HETqjyWbiLnWakz+JTIJnP3PnSQ2k7TmyP26QYLZ40roXFF5dwLKSpruxlQIxqJiee/rEDNZ4Z+0zNXm9c1h7ithdze1FcLfJrlVcpK/1K7OA7fO3bawXHh6+xbtBj7c/d2mbqUZ1stxFbdi7l5eaiP7sus1w2cFVZrVp1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(90011799007)(90021799007)(1800799003)(186006)(8936002)(8676002)(5660300002)(6916009)(4326008)(41300700001)(316002)(86362001)(31696002)(2906002)(6512007)(6666004)(6486002)(2616005)(6506007)(53546011)(26005)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVuK2FDUU9XZGR0KzI2WkY1OERxd2J2N3hETDhiejR2b1BQcE1mY2RPVzF6?=
 =?utf-8?B?NDBzL1EwRjJkY092VFU5ZnNyS2hpc0hZaWtZZmdmTzdYb0djUjlUODlZTWF3?=
 =?utf-8?B?MEVNTFJsRXdHRnYwLytEZVk1b05QZzZSVTRsRFFPZGpwQjNkMTNSM21Ca2NK?=
 =?utf-8?B?UW8zT2tkbU41WXhDZ1MvOHBNMkVXWDB3SWovQ2pLanFxeG9nWUUzQXF2UGN6?=
 =?utf-8?B?Vm5vR0E2T0IyVWlGZG9wZEppWml4S3dTNHNkVUdjaDdzTURoL1F1TGJUMWYz?=
 =?utf-8?B?RC9ueXBvMkV0T1RLUnJCMDZLaGpiL2tVMDJxT3VIaUVENWFLQ1pWcWFZVGhS?=
 =?utf-8?B?eDcrVVVlUVloakpERVl4WHZEL0Zvd1BETDh1VXhCZUVlbWxLS2o3ajBRZHB1?=
 =?utf-8?B?UkVvbFZ1TTZlZWcxQVhucTVnZGI0cHptZ2dtQnZoMnJMUWo3Qko2dUI5cDEy?=
 =?utf-8?B?MXJGQ0NFRlJWd29LUlNZaFhGUmRYT0JabGsxd0xuWGhSazNNSmkvV0ZSd1Fz?=
 =?utf-8?B?bERydGlGdlBHSmU2Q2UxckxZb2l4Tk5BUGV3ajVIOXR1KzZpYy9mWkdTc2Fm?=
 =?utf-8?B?K2RMUm41dXRlL01Md1pEOW52MlZsaUlrY3ppTGlYVXg0bVE3VnhQYUZUOUtl?=
 =?utf-8?B?QXVZUytIcXJZT1Y1OTIyeEY1OHN5MDIwSmc1cEg0QnVaclJyOExjMnAvcFdS?=
 =?utf-8?B?bzhIU2hNN2NVaEkyaTd6ZElKeDM0OWR4SzFXYVFsaUlqckEwRFZOalkrSExU?=
 =?utf-8?B?UUFUdm1raXdpcW1BTWk4bGdCL0M2dGFUbDlnNmRzN3poQ2x6T1hoQTV2aHRk?=
 =?utf-8?B?akRvTDIvZ1JsVGlKQXNIUlNNU3YrSU11b3BPSk5NN2FpOE44elNkV2c4Nm1Z?=
 =?utf-8?B?by9QT3loekZtYzRja2IrY1ErU1Bidnd2eHJyUmpVdi9QMVk3cDE3Y3hkMXdy?=
 =?utf-8?B?S2hTcGxXSVNmc2JsTHZIdllmU3RTd0oxaGowSE0rRUZDK2ZWamFTdFdMb1h0?=
 =?utf-8?B?WWI1alB1ckpYM213OVROZjVxWTAzUU9icXZOVERXR1pzaVVVT2FWZ0N5ekJm?=
 =?utf-8?B?bmdybG16UlpEdGEramJadDNySjZnU1JSb3pGR3JnaU5mdlFoM1JVNDRDU2Ny?=
 =?utf-8?B?MnFVOVkvTXlETWhrQmJVUkx6dkoyWWZ3QU4wR3h1LzNtYUR1QVg1VmF4YitU?=
 =?utf-8?B?cUtrR0piUEQwd2NGS3hCakpYc1R3eWcrc3J3VTJudWFsN21Ba0N6QzNOcXk5?=
 =?utf-8?B?QWxmb3Brc0dLUWxmZnBCYTV3RkdwQ3dKUFRVZ2xZVkNnUzlKYmV4ZWZWb0Mv?=
 =?utf-8?B?b2hvMnpibTRLa1k1M3ZlTHZjVjhlYkN5bnJJcTR1WFhpcVdOYTNxeERzWldw?=
 =?utf-8?B?MXEvOGV1dGRHYkU3VUJPR015VWRTbjlaU2tyVStPdGgwYW9seWlqUkd6amVB?=
 =?utf-8?B?bHh2OHhPWUtyTlVTNGFJNWFRUm5tT2t3V2IrOWc2TFI5ZHJ3NUhxQmtabVlU?=
 =?utf-8?B?b0NLaTZIT1Q1eDg5T0NWVkI3aXZGMG1KenFEeU1IR1J1LzN3aU8zazRjdjV1?=
 =?utf-8?B?Qkg5bWZLajN5Y2RTZi9YT3BaK0hEeDZ3UXM5ZVRjVDUxbElvSnp2cU5YcUVB?=
 =?utf-8?B?dXBwTnF2em92TjZCUkJtSUFEaEhUTEdkNmdjV09CMDJZTzFRci9NRnFtMU9S?=
 =?utf-8?B?YUV0TkJZUEdVZzgrOVltbFB5MTVmdnl1aDRxRE5xRWJSV2RvakNueGJDaGs0?=
 =?utf-8?B?YnpucnNjRXNVSDFVQ3ZZRm5HVXZvaGdWRnZzeWhQVy9LQlBhVXVUcFhKd20z?=
 =?utf-8?B?QWNTMEM1UTBOQlhzWXdHS1c3elorZHdtWElpcnhGSHh0S3BzdytkU2ZhaFlM?=
 =?utf-8?B?YXoxR1dGV0tOSHZDaUJIRVRoK3V2VEpVb1VpbDM1QXlsRmdhR0kwSGNkZjJC?=
 =?utf-8?B?clAvWlBRcCsyM1I0T0drQ0cybHRTUmo1VUFGV09YcWVpR3JtYm51d05CaUVV?=
 =?utf-8?B?VDFOWEVhaWVTYklBUFpDWnZYVXZIUmhlQ1V3c2hxcU1GRjZKUW52TTlEeTNE?=
 =?utf-8?B?VnlxOWFxU3dyQ3lDNDhvRnVpNXpkNC9oOUpkQ3ZMZGRkdzNrdlo3a053NHov?=
 =?utf-8?Q?EeAEETEDU2TlLTGrObkdqOIY6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ab680d-5d18-4810-0f1e-08db97d491c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 05:59:04.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtoxgsTzZA7CGu9Sd/f9slrzegd8KSnwMsTngBfWjPVyrelFPxL+6YeZJEhCTz6Qiu8B2+ePNzwHAZio27+Hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065

On 07.08.2023 18:22, Shawn Anastasio wrote:
> On 8/2/23 2:16 AM, Jan Beulich wrote:
>> On 02.08.2023 02:11, Shawn Anastasio wrote:
>>> --- a/xen/arch/ppc/include/asm/asm-defns.h
>>> +++ b/xen/arch/ppc/include/asm/asm-defns.h
>>> @@ -16,6 +16,13 @@
>>>      lis reg, (val) @h;                                                       \
>>>      ori reg, reg, (val) @l;                                                  \
>>>
>>> +/*
>>> + * Load the address of a symbol from the TOC into the specified GPR.
>>> + */
>>> +#define LOAD_REG_ADDR(reg,name)                                              \
>>> +    addis reg,%r2,name@toc@ha;                                               \
>>> +    addi  reg,reg,name@toc@l
>>
>> Didn't you indicate you'd add blanks after the commas (also) here?
>>
>>> --- a/xen/arch/ppc/ppc64/head.S
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -1,6 +1,7 @@
>>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>>
>>>  #include <asm/asm-defns.h>
>>> +#include <asm/asm-offsets.h>
>>>
>>>      .section .text.header, "ax", %progbits
>>>
>>> @@ -11,16 +12,19 @@ ENTRY(start)
>>>      FIXUP_ENDIAN
>>>
>>>      /* set up the TOC pointer */
>>> -    LOAD_IMM32(%r2, .TOC.)
>>> +    bcl	    20, 31, 1f
>>
>> Hard tab slipped in.
>>
>> I'm happy to take care of both while committing; then:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks, Jan. Just to clarify, are there any outstanding comments that I
> need to address in this series, or are they all able to be handled by
> you during commit?

I intend to take care of the minor changes to the last two patches
during commit. The patch here has gone in already anyway.

Jan

