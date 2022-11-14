Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA06287E0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 19:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443504.698052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oudsm-0006ou-Bo; Mon, 14 Nov 2022 18:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443504.698052; Mon, 14 Nov 2022 18:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oudsm-0006mb-8m; Mon, 14 Nov 2022 18:08:32 +0000
Received: by outflank-mailman (input) for mailman id 443504;
 Mon, 14 Nov 2022 18:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l1QY=3O=suse.com=jfehlig@srs-se1.protection.inumbo.net>)
 id 1oudsk-0006mV-GV
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 18:08:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 573063cc-6447-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 19:08:29 +0100 (CET)
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com (2603:10a6:208:c5::16)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 18:08:27 +0000
Received: from AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::3342:8b15:bc9b:3d47]) by AM0PR04MB4899.eurprd04.prod.outlook.com
 ([fe80::3342:8b15:bc9b:3d47%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 18:08:27 +0000
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
X-Inumbo-ID: 573063cc-6447-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMfhQ1BmCK8116ABR2FKuIJ2OLYAkNRBp3sH3BO1S8wCDyE4NVOTw5NpkQ8aPMtmXk8PJjvv3BT6yjlS7x7F6wrcCh2AyrmE6SHkqmiI9A48zhFxvC8pJg8q0N69DFljkzKKZWs7EYUt3rYIR5onVUvP5MVEvycDz21MaBm3tcHdsVf48CoQ5QWa0ZlkviBm+QqmFm/uJ0Mf10n1ahizkYN/q+ETHtxKvSHLJCkUgVP3tJ4PxQY5wmuzfszAtoqpR/JKNOWplqZrGcmnNZJ7sNeCg3Fcx0pAC/IePGUFYbwqb10nPJMp2Eu2m0y54cJMx/AlJCyWYeFDDPpa7hqPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWpWVQrC1DQaGImjsJWLYcGICoBgwfl7WlYrSk/35nc=;
 b=DhY4Iyr1t0jdDz2CYfAxMZViC6IkUQP3w6WRgegcmBCnUe3WF5cBFsz9+h7Lqi4DABT/Fa0R3VTm/eSw4mNtwwwnwiR0eHkJYff1XhOisKzmzrArV6woD5L6Iz7mJ6PBC1x+vzL90kK3seMhePF4g5cAPSfvX9qbqJY5XQzB54yHrz+azxJMUG962MD2UgR+dVj8vPnA6clDIgauhEcVeZc/+jMJDdDOCJJpQrpsX5g7TeG17dqAcC8HvdVE/bCSumvN8puaP+5ywf61nahfIn/Ann6MJEjIb1PCuKpi6SKzsS28AdQuZs7Bqj4iPI9oeZGAm29x6YY53+hlmc7AvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWpWVQrC1DQaGImjsJWLYcGICoBgwfl7WlYrSk/35nc=;
 b=j4kWV3L12BvyKauq1h2qi1vLYytSKaMetGx7TRtUuI+nMgtjgLDWrwARADu96N8HnI+/yb7zOTwZy477f6A/2F1dhSxl/nLS/OQ1Wm0betkNjQs4PG9tqCLExfpACiLdiLBkKv/AJawkIsmgBDoWqTOq2yKkEakj/fB6h1zlzqzkf8t4m5XEMTtB4yFo+bcU+2KHVXaoAoyn1idcO0unL0C5T9vU5maNYCM11qhE5YqAYu5+x5dm7nS8vcRu3uzaeCYv5RqfV/Grt9Ju7rvzmT+AeLi6+vC9GkScC3IVWhNYHcEPxpNwtM1H6VXMRQ2wRHGlA6UR3Tmuu0f/Y8FSXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08424b48-3ce1-3e3a-857e-1a6d3cae3a1c@suse.com>
Date: Mon, 14 Nov 2022 11:08:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: vnuma_nodes missing pnode 0
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <d3697867-7df2-0a1e-2485-18957b3b94a2@suse.com>
 <fb2f034c-9e65-ea64-6e54-71301497b37a@suse.com>
 <Y3KBNpszKjG76PAA@perard.uk.xensource.com>
From: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <Y3KBNpszKjG76PAA@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To AM0PR04MB4899.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4899:EE_|DB8PR04MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e69bc4-bfb3-4e26-0187-08dac66b3a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P2zNJ8Fxslw/omSXdsMWwfSbcmwbMKNing9GIzrA7oIxwor7XqQ2bZZRwuQW9vVK1WzND/Owhzp2tkG/rIzCBEKZNo1Ff9BdE8RWvVW55jlzziJ7FaS96cbGbq4y3MYtHQcLmc8+nL9nH1OOMsnblqJyIKzK9T21AZlH6uMm25EnCC2nbLGRgc4Kws3eFA1CLxSqgV4c/u+YFs0sdvgURdhbxCvJBcOrLfzoYm7q1eeKc9fo5ZGeepxynBggSAMJTBVQuQV3w0W9tymfi1EzDTv0+JNY+BivrTwi+UTP8qnJHcAbEVCw1U5af2gK2OjTuHT2zUVt+QofFXROsW6A6cX7CUwifxOCFU9oUyjUIPA05eDmQs9bHFAMCoECwl9VLA93A/lYOq7NpMAhVVClLc7W5VU39WhmW1wcxZftZE1TXwYYCdXymA4IsT3/09rbnRnDn7z7C3OFQGgaO8Zv3MopQR0k6Kfwx2uvXH5zT/aYgBVKJlpT4976K/nLgRnlbKBAIbhE5pT+DFwTMYa/4IO5VAwE/LEN7ekNaH6ujVYshyxXq9dffjC4Fsg/EDmQEAr4dpkdqvFb9Y1XOThx/HmVF8Qea85na9TU1LJjkNoKmKQvFEiJEkPsS8IDFc5uZ3QsQDP7sd/bqB/WmHtdPpdN2V7/e2qwXndGxnSnYFtk1zskJtQ843scrr91GsvT+kStd7Lfdc7jBIg9hopeADce12ADomm1LJySFezB7pWk5IW31IeKZvT59NRKQevNE0Ra6csZzZBJii5hp8kZ9r1Tw1+E+aAS46H8c8bPu6ZrSdZFsbNc1KDtFHJyNOP0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4899.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(83380400001)(53546011)(316002)(186003)(7116003)(41300700001)(31696002)(36756003)(8936002)(5660300002)(2616005)(2906002)(4326008)(26005)(8676002)(86362001)(6512007)(66476007)(66556008)(66946007)(38100700002)(31686004)(6506007)(66899015)(478600001)(966005)(6486002)(6666004)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWJVK3NRWG8zWmlpcE1DYzk4Z3ZiV1lqeldjNDhXSUhuVWQ4bkRWakN6MUFC?=
 =?utf-8?B?K2g4TjRBMkYvUE9tYmRSZmJneDVDSHVqeFJEVC90MXhoK2Y2UjE0Vys4VWY2?=
 =?utf-8?B?ZCtlaWh0MTg3eW9aQmJ0V0JKY1RtRTF4SHIrMFd1S1ZSNUZWYlpjcG1NcHRJ?=
 =?utf-8?B?TmJBNW90NFF5YlJIRVRYU0pOcm0rMXVjN1pkU1hndlppR3Z0S3BqZ3dNTkZS?=
 =?utf-8?B?cEVZZVY2UHN1bHdGbHFlTnNmRTBEMkgrMDhzWm1TL3FDUEY5T29Qbmo2UjB1?=
 =?utf-8?B?R2sxOTRmNGdOQjBYRCtpQzYrb3Q3SkhxRzY1dTJQTmY4NGVKZXZ0UytFYzEw?=
 =?utf-8?B?aFZCbFdQQS9ta0tQRVFMQWFGckVJcjVadmFRTjJvUU15KzZMb3NTaWRteGo5?=
 =?utf-8?B?RUlnVjBhZzB5STRrQlo0ekdoWlh4Nk9wWXdUMjI3Z0IyemFJZDRDdFJxemd6?=
 =?utf-8?B?bGo4eElHazRLTnh5Nnd5V25UZ0kxWHBJNUV1VnNTVng0c29ncU1QNGFjblpL?=
 =?utf-8?B?VnZEb2M1SWNnRzZZc0VMYzg1MVhQSVl0SEJ5ZGhxbHdlQXp3Y3djcTQrc3pi?=
 =?utf-8?B?MlNjTDdReVdjZVVlc1Vad3RNdmNsSWI1NzNFYmwzNGtXdEwrVG96TVRmdHh2?=
 =?utf-8?B?YXRwZXJNVGRTYlpzRWdBL0ZHbmNUOS9QMEs5NEQ3SmsyQytpNnBCQzd3eHlO?=
 =?utf-8?B?R0dhWW5NU1A0ZDMzbStIVHlLdVVqMHdtVnlkK1ZxOGw5ZUhMSFJZQ09mQ0Jk?=
 =?utf-8?B?a0FNbDJrMG9lUlhRMjlSd2F4cFdLMFM3SUt4eGpMRlJVY2dwRnFhQWU4MEFz?=
 =?utf-8?B?OGRuQ2thTkVlemFJdzhMcXdtYWVJRWhXbGVkVHpsQ1F5L0pHYXZvR1FRTXJq?=
 =?utf-8?B?UEpQbERoc2xFM1JvREQzdENadnhTR3REVHl6VVhydy8yMHkzVzNYREN2aDgx?=
 =?utf-8?B?Vm8wWkFhY1k1clhCVnhrZ01lSDRnZmgrZUdJSHFqTElSVzRkS3UwTURnVUVP?=
 =?utf-8?B?OTdiUzV1V2tGYTVsSHdPVVFKWjc1WGRoT2JUekVENmo5TkhYLzgrTW5NbFQ4?=
 =?utf-8?B?SExQd1J0K0NleFB2d3B2enRYVFR1YTFaUCtJOWsrZXdzOGIvd29GNFNpdkpu?=
 =?utf-8?B?VEh5NVByR1Fzclk0cE0rTlY2dWdBbmo5YjB1NGlLTVgzemhWWkovR3FmcEpr?=
 =?utf-8?B?NlFJRzV5cmtnR3hmYXhiU0JxV2ZRelhibmVvVU5TcEZ0RjBLWW1GRldzc2Yz?=
 =?utf-8?B?R2VMblN1Yyt4bVVTR3RGdndSTnhDbjJOM2crQ1JIRTAyMEJVNjJlSC8vbkVo?=
 =?utf-8?B?TXRRdlB3YTU2T085aVpIVVd2NUF0TVBxRDZ0WFVwZXZwTVcwUDVXQTVwRSt2?=
 =?utf-8?B?M2hUVWt2OWwrejk4UDVkUERWNDlTbHpXN1BBYXllczAwRUNrcXlnSHNleFZa?=
 =?utf-8?B?OFkySXI3Z3BtY0tRWGVMMVNqRWJhSEljaElvSlN2L0c5V1oycWlYRmNzOXNJ?=
 =?utf-8?B?MGpxakw4Y3pWanhzMHlud1dTMm1tcml2ZGt3dzlXQ3JKeUdRWGhReXpucjRI?=
 =?utf-8?B?MHVneVBsQUI5M2RnczgwbnJMcnFRMGF1WDRGMXZYc0JhMFlCcVFiUEJNWFlH?=
 =?utf-8?B?SlBtWVBZYWl2bXExMk5QQlVQaWdDUU56ZURScGs3RkdOZHZjN0F6Sm1Daks5?=
 =?utf-8?B?c29UU0hXa1VBckVwakhZVFZ5K2tLcXNhUmRhb05pZWJRQ1pkYW15dlRjc0JY?=
 =?utf-8?B?WTl6R1ZObFkvUzZuaC9zdnhnZ21LdFVQMm1SMmR2UjVOMFl2ZmN1ckJCdGxo?=
 =?utf-8?B?Y3FxUzV5NkFKek1qZEFTVEZLeDl5bGZESUIzb3lUa0xZQncybDhoYnJ0WjhI?=
 =?utf-8?B?Z213RTN0ODNYM2dxckFrNlZoUWRhU0o2MThndkcrTkpSbTlRN0NVcThSenBJ?=
 =?utf-8?B?bHdYQ1c5aXdQbmowS2cwT1d1eWZFTkk0Z0NBQnh2ZFZRcXVoa0xNY1FFbVVm?=
 =?utf-8?B?VUZ3RHJ1SUdvQjgvNUM2Ni90emRWRHFjZkIvM0hQaHNwQVVlRU5IQkZmblN5?=
 =?utf-8?B?U1g0R2dTRXhGakYzZ2xFMmNUUkRUTVJ0a2NleTdNN2IxY04wYmxTTW9hb3ZR?=
 =?utf-8?Q?t279hm9d2+mDunepsbfVit8XT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e69bc4-bfb3-4e26-0187-08dac66b3a38
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4899.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 18:08:27.4395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4Teua3yCcV5kprelZLp+rrA7NluL9YXRCGUc1dlkdY1Pj76UjEhpF/AptACF1/vrxkhl9cpN5Cvuyy4z1wh4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827

On 11/14/22 10:56, Anthony PERARD wrote:
> On Mon, Nov 14, 2022 at 08:53:17AM -0700, Jim Fehlig wrote:
>> On 11/14/22 01:18, Jan Beulich wrote:
>>> On 14.11.2022 07:43, Henry Wang wrote:
>>>> Sorry, missed Anthony (The toolstack maintainer). Also added him
>>>> to this thread.
>>>
>>> Indeed there's nothing x86-ish in here, it's all about data representation.
>>> It merely happens to be (for now) x86-specific data which is being dealt
>>> with.
>>>
>>> Internally I indicated to Jim that the way the code presently is generated
>>> it looks to me as if 0 was simply taken as the default for "pnode". What I
>>> don't know at all is whether the concept of any kind of default is actually
>>> valid in json representation of guest configs.
>>
>> 0 is definitely ignored in the generated libxl_vnode_info_gen_json()
>> function, which essentially has
>>
>> if (p->pnode)
>>    format-json
>>
>> I took a quick peek at the generator, but being totally unfamiliar could not
>> spot a fix. I'm also not sure how such a fix could be detected for testing
>> purposes by libxl users like libvirt. I.e. how to detect a libxl that emits
>> `"pnode:" 0` in the json representation of libxl_domain_config object and
>> one that does not.
> 
> Well, the missing "pnode: 0' in json isn't exactly a bug, it's been done
> on purpose, see https://xenbits.xen.org/gitweb/?p=xen.git;h=731233d64f6a7602c1ca297f7b67ec254
> 
> When the JSON is been reloaded into it's original struct,
> libxl_vnode_info, pnode will have the expected value, that is 0, because
> libxl_vnode_info_init() would have reset this field to 0.
> 
> I don't think it's possible to change the generator to just have it
> generate '"pnode": 0', as if we make a change, it would have to be for
> all unsigned it, I think.

Which would likely cause lots of libvirt libxlxml2domconfig test failures.

> Is it actually wanted to have all those in json, or is it just a case of
> looking like there's missing part?

The latter. ATM, libvirt only uses the json in its unit tests. No functionality 
is affected. I'm fine with the status quo if you are :-).

Thanks,
Jim

