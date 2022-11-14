Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984362774D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443168.697657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUg3-0003Nc-EU; Mon, 14 Nov 2022 08:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443168.697657; Mon, 14 Nov 2022 08:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUg3-0003LG-BH; Mon, 14 Nov 2022 08:18:47 +0000
Received: by outflank-mailman (input) for mailman id 443168;
 Mon, 14 Nov 2022 08:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouUg1-0003L6-8O
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 08:18:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f40f67e6-63f4-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 09:18:44 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8374.eurprd04.prod.outlook.com (2603:10a6:102:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 08:18:41 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 08:18:41 +0000
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
X-Inumbo-ID: f40f67e6-63f4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD2Wmj8q4q55KKs9yMQscN35ILy2wKfKSkNOmZA3pUA4FDY2jybSGBip8uXhl3eb/nn8M0f/Q71z0jJHoTVzAHAMKQUyvxVBbByxDiwV9EiLMHyRyw5UYguSzHAsy7jR9kvFd3OPCpfHoivm6BfUJVF829AjMMvVGhbn4y9l22Khb7Xa0/M5ja0g1F46Mrpt2Lp2FPexfIzv9dm9gC9I9Oc2FHqrALRO7b1GfZRpVTfJjKAFBnKhomumTUKpe20ffZyII1Z55F/26INMhnR2p3EhIDdIDg4UTMBph1Tz0Qabx3B7zsM0ZAoyCU1/njPS5aFZXXaogI1R0RnI7wEeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXFe90L2XRJ0XtiplkbFA/f+LUhTE/ryZkdQXNNeaUc=;
 b=VDra0JVDrWbfmHaPIXvU7x6MmcQfiFX2M71wbvsXOmvKjyF7ffyk/H1sqtSwY6Ex1vGYPglJJQDm7rod/yh5S01AVQL2c6XlLzKOfUeGGLA7jUQuqHEH+wt2N7Uz4nn63IjeJ27AqdqamNOWhOWZ23pfNO5nbQY3vVm9+7mEzC2UVMd8S4q7I5+lDMrqWdmRsQbUTD3fFTMQOMHhabmHTCrSQ5wVJmHVFIGWcdSy5HKlhozGIW0APG5/zhKeXOVq7V71V0+bnArS1c+a5mQ0HuRRvGvxJFihrkrqdgIP2zXDVFrm0GwPnhHa4fg/PW4F6b5lcZjFRFjyF3rdT+qEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXFe90L2XRJ0XtiplkbFA/f+LUhTE/ryZkdQXNNeaUc=;
 b=MnyXDaH5bbHdFAkYXVn8LNUZux++ttB8eJlvxIufPCNR2EWFVPQN9a+SwvtEvcpYypp0myNUm69HwGMxCPIgkvzVBULps09i1zqz5p8KX33aK1An3+YbC2JmLdlx2IVAlxZSY4s+G9RtUZC48IHj+4j8hbx6zEqdtfzK9ZdTuAipq6dT7kHOpiAGT0H90OdGaQlY85BQ58RyRHu7VXqASBiiiklYiG0CEI6QntSnL3FPYbfyRaP7c9hlHbiWDGgps3+LzO9UrETSBuZNsnnuMVK52xswrWob6eu4EJCDBHxqpTfSc+uPuQC4Zl0zit7rC9EoV97+LZuOg9ulCY746Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
Date: Mon, 14 Nov 2022 09:18:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: vnuma_nodes missing pnode 0
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jim Fehlig <jfehlig@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac044ba-00c4-46ba-cc65-08dac618d6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73uJzBY1aoNc6QgByVzYhfDdqBwMatQQW9avhvnnlFqEMMJ53CRECUuKMBI/U8RCIFvpqLCXSHL+JcaslJIZp4h37MDtdWJwlGxGKLwqNVgX4q0XMrSgjUPCIKxnY+Jd9Ov3flSiCHPp4uAZSBx4DtYv4ZGmkr1z3atYESCYe3D/U/6zY26hWfmaz/cs2vqP8LyP4a6+He+ntnQc9CM0FAW2YCdrADKiVpqcvKIJGWr9xHM9OzR0UEdCF3oP02OAxpIwrunZ6c2gb14W3t9IhAOtmYdeE1I9KEm3qGdiU4t2RmQwL1qP30CO4boXIDp1AbT+QHz4MTGPdP6kLl6ecOAT158iSFWxupE+9xEDjguNIMcUPsqkj52WgG0G0AjVuZW18U0qH4ipiyK1/o+gX7+yFzZ7EYw1/aCXqXqdG8wP5WfvHRY8bUDUQ1pvbM3mX3yn7yx/komSeBpeLTovz2Lw0nhk56wdzAnS4UVn8gvLoAqpyuC6j6bQSO1+unf2OUADcZlZGTQhVR0Rros2/QdmqFxhZz5Fv+PvBS83nRitgFR+STnI49k7owQy2k+btXQ3gEFRFwfBTTW8s1iQicbLiwSPGpn7qkOuKYKXIRHC2o+Js43Wa0mwyoaYLIuAgLZ3Fqrg4e8l9vOdbfL70/9RhERbhcksOaH80LJVVXftCEkKr5e9wMBZKVhP6qa0hN0OZ6QWLUUHvPBGEVgbZdtppV8TYeV/H67rEjAfdzKS0AWgpgtq63ccCdurIWlHMfC0/smkBVxulSKnDgl2tisOhOikDUiIcNfgg3ISS/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199015)(38100700002)(31696002)(86362001)(41300700001)(6486002)(478600001)(5660300002)(8936002)(7116003)(4744005)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(110136005)(54906003)(2616005)(186003)(83380400001)(2906002)(6506007)(53546011)(26005)(6512007)(31686004)(36756003)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVd1akJicmtpWm1wWW0rNzd4MDZZS29ZTkgydTlYSUFub1p6ZWF5aTF6bTB0?=
 =?utf-8?B?YXh4dTBISGFVTlh1VGRQUjFBczNWbmxoTk1qTS90VUdrU01qRWhDTWhhUUxq?=
 =?utf-8?B?cm12Smk4d29aSFhSVGdaNzVVa0U1d1Y2bGE5Ri9pb1psdU5OVzFCSm5GKzZ6?=
 =?utf-8?B?cXQ2ZmRsYzBBMmREbENoY2xGdEl1amFRMVZUc0o5RE0yd3NQRVZMbCs4MjlL?=
 =?utf-8?B?dDRuUnU1K242L1kxZTRibGhubit4YnBkclhNY0M4UTMzeldsVVdKOEEwQVRo?=
 =?utf-8?B?bXNHbXp1aUVtK2NLL3JnTXg2bVlLZmxxcmR0QzRGSmp4MGpEWlRpYUVzb0di?=
 =?utf-8?B?d0JEcG96QStqLytRRkFMTUR4TmdnaVR1VEtlbGNucWNkaEtFQXhyeTRFQVNI?=
 =?utf-8?B?aHJHOHNTU2ZEUytyOFJ6NXM0elgxVWlrZkhPUWhaWmo1MFN6d2hQZjBkbVhq?=
 =?utf-8?B?eXF5VnFNTlBxc28rMWVCbTlZbTlVZ1ZDd0RPb1BUeXJ1cFBSOU5DYVZrdFpj?=
 =?utf-8?B?VHhCY0ErMGVtSTJuc1pvUmpzNTU1aXFueDcrYUV3QVd1dmVNemc2NWRwZlFC?=
 =?utf-8?B?VkxWRmN4dDRqdjJGdUJsZko3eEZLOGJRWTJabkRXQndqU2lUTGFJWVMrVHdw?=
 =?utf-8?B?M051YmQycUlWeXZNRUNiTWlXNUVCakF5MXRIbUphNGdzSVNsWEZiVE9kSmFO?=
 =?utf-8?B?anNaQUc1V3dhbVpuNC84SHZ3alVIRklGVTJITHQ4aWhUOHVWWnkrQUZ1RXhM?=
 =?utf-8?B?RWgxMlNqUWdEYUxPTnIwQ3U2Qk1qTFl3QXhJZEtHdzhldlNoK2IzUGhXL01a?=
 =?utf-8?B?dU54WU1qd0Q1UCthUGs5elUvTVR4THE0OENmUVc2elllaXpvNHhyNko1UFBU?=
 =?utf-8?B?SmlaU1hpRzk2S1pNa3pRbmFWWDR4SnBRcE51YTM2cWt4cC9QYWpkdmJmRVVR?=
 =?utf-8?B?Si9xZmFQMG42SHF6bkFnSHBnS2VhZlhNdzNhRU5neGdPKysyVWJ2YjZZREtw?=
 =?utf-8?B?eUZDTXFJZkpHMEwxYXZYM3dtRk8vcTkxM0Z3Y2FDMlkyeWd3OTBiTDEyYWQ1?=
 =?utf-8?B?bitxMzBSM1lJTVhHNGZ3VUdySS8xdklWVDVFZDB3cjNjcmFQVDhpS2NjWXh4?=
 =?utf-8?B?aFUxdTl2cy9Cc1BsYmFvMEhka285aWdMcXpKQTJGL2xCQnRCNVlMNmE2UGR5?=
 =?utf-8?B?OUQrTHBYOFkwWEtXc25xNDZwdzRVS0d6WUgvUnZFTEZLN05TSlMzUCtqQURz?=
 =?utf-8?B?WWcyS0xuMFcxWU9GTW9CeEJYZDJhSHpmV1R6Y2d5ZGMrQ1JKTTBHWTV0Y0tz?=
 =?utf-8?B?NnlTRlpKVnZPTktYSGx3TFZkL09qNE1leUdjckNteU9oZzVYdE5EV1huL3JX?=
 =?utf-8?B?ODVWdVpIN0Y0MzdweENxbTFCN1Jvc0RTbEJ5akJyd0VQMGl2eDJTMFNCbVFN?=
 =?utf-8?B?Zlh6MXYxaTRER0tFN0dEQ2ZuTG9QVy9wbDYzYmQ4QW1XVHhIOG1wajE3cjU5?=
 =?utf-8?B?c2lpaHRaUVIvZjNJOWZZWUlLM01tZUJzcmR6Yml6aGxFYlU1b2NHbzRQT0pt?=
 =?utf-8?B?SncvTUJCYXBqWWxvNzh5STlJMTZmT1htbGlHQjhsRGQyZVB0QVZQSnNTbzZs?=
 =?utf-8?B?Q01JSnNhUTZaQ284VXNESmJlbDRtTktrOTYzQ2ZQUVl5dmhOa0NPSUgyNTR0?=
 =?utf-8?B?cW9VY3g2VGE1c3RyZzcyMi9kejJUMFRNdjkwVGxWbDZqNER3anc3M0ZjQWZB?=
 =?utf-8?B?a2o1NTBId1FwWEtKNE5FL0Z6ZEMyVDRTbXcreTZvSHF0WFdXR3VNWkc2MFhU?=
 =?utf-8?B?Z202MDRlN0ZYbWp5N2ZBd01EbC8vRFhZMnc0aU0xM1ZrSDlGOCtRN3NpWjB0?=
 =?utf-8?B?TXVHSkJ6MDFQaTBSbFF4eUF3UXNhSkFXRFpSSUJKanlibjVvWHBBTXNUT1gr?=
 =?utf-8?B?dlJOVGp4eFNUNlZ4bUlTblRKMCt2aXRBajM4Rmt1cmNwN1I2WWh1NTU3VFRY?=
 =?utf-8?B?c1paRTA4dWVlcEd2YjY0aGRjY3FaWFJvcDdENlo1VTEwRWo3djVSaWc3T0tn?=
 =?utf-8?B?REUrdTlzUFAxbmFWSWE2UndjcDdmN0d1SldENGo3UCtsYXRrQ2tZTzZpNXFo?=
 =?utf-8?Q?iGpwXAhrL9UxScDDFfd0RjN3g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac044ba-00c4-46ba-cc65-08dac618d6f2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:18:41.5659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZLiuoXcPbqsaMvoBHjmDEURGziw3+eld/sotp+eQVUs1UbrNfJbPGWX9gFi2Iqkl1l9hSl8ll15zjibh0GiUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8374

On 14.11.2022 07:43, Henry Wang wrote:
> Sorry, missed Anthony (The toolstack maintainer). Also added him
> to this thread.

Indeed there's nothing x86-ish in here, it's all about data representation.
It merely happens to be (for now) x86-specific data which is being dealt
with.

Internally I indicated to Jim that the way the code presently is generated
it looks to me as if 0 was simply taken as the default for "pnode". What I
don't know at all is whether the concept of any kind of default is actually
valid in json representation of guest configs.

Jan

>> (Add x86 maintainers for more visibility)
>>
>> Hi x86 maintainers,
>>
>> Since this report might be related with the release, if you have time,
>> please have a look. Thank you very much.
>>
>> Kind regards,
>> Henry


