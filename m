Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D88771DAC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577950.905094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx1J-0004uv-Fb; Mon, 07 Aug 2023 09:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577950.905094; Mon, 07 Aug 2023 09:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx1J-0004sQ-By; Mon, 07 Aug 2023 09:59:25 +0000
Received: by outflank-mailman (input) for mailman id 577950;
 Mon, 07 Aug 2023 09:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSx1I-0004s1-IZ
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:59:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15b30b57-3509-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:59:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8831.eurprd04.prod.outlook.com (2603:10a6:102:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 09:59:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 09:59:20 +0000
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
X-Inumbo-ID: 15b30b57-3509-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsUB3c+QvrNE2qKQS3ceNVeBVEGIhTieTN3B+GmxNwdzVbeaujMrPpqQm6jAnot+8UMOKkMzTbAxneKtzdYsqaSL0j7ywZIEEjm1Y+rd9ukLrP2l8pKI3t5x8ss+hJiZuTwF9b/aNIdAkG+gZVSW9I6RKh5w+61SOhFN1c+tXbEnFNRiFTQJzv4Or/F6rBLMPwnCwnlCj47Pxa5XAiDJzkY61cbPVGz0NX9hqGgvXXmRrHq/Y4Qj5DYI4o+wwGrEKXJW9kAd7iXq+C+o7awjDCAjL1kC4DY8zEowKFzGZk/WjCo7yqCVpFrqRj6KiEFFo6gKOhisUgeV7K9tKbaNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYk04VqF6SMS20j6DS9Kk5uPePKrMrEqgZXcw7Zbbz8=;
 b=BIUPH1yuzZapqFZpp+C4bfgFtnlOWa7XnZ7TpZ4s98I4iENZU/+y/a1XYUjg8Pl0+RAj1c9THLvr1NLquhzxbFkJn4lYjM4pTRV8ORsa+izO1piUJQSYbtOvz1vXzKSK9mnAjZhpm93OkoxQQrBqnwwzgldvB4RbX16YwXgzNuzvAXwtFz4oLKiN7ztS659h+4fciCFBxCm6SCAIKU0Obd+dk8EmAcvTCtBUl2Vru5RzrA4hWjU8Zy2FarR5S3n1l9GNKDorOjxi6RvrcC6PkomLENAJDZZhvoPcgoaXjGzXO6g2m/T0bL5WJqNuxcP4/LdAfMn5IKznSi/IzsnM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYk04VqF6SMS20j6DS9Kk5uPePKrMrEqgZXcw7Zbbz8=;
 b=Ws6YXCnkCexI7hQYwsYfC8JsfjzrSZGsTJtn6upNJ0ShljotzMktYcvTJXf4gaP6vRDQ8a1suJASMFH9/MC1slYS5NxMn+jVrhDkNkT4k8qcxNyDB9NEo8LaV0/BssPwafQp0fSbFZF2Yyp7bqpckBrdyHGgTIqjjuuwwnfZU7kfTOvzPNfNeVXbr1mmGgmnr7+hBZ/lhRTywpwl3aV+SMW5UV/dwehQUv0y+jJEp8EqIfjWo2kanb9uki1+aMlhiXAGFrGSZoaWvWBXMMqU/9auZq1DqORQ1Jt1Ha+cfteKBgmRvnLJqsCrnIRheDBs9im3tFbrvFXXyoiiiR3G8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7313b0fe-140c-f17b-a2ec-8b5a943eb0a9@suse.com>
Date: Mon, 7 Aug 2023 11:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] x86/hpet: Disable legacy replacement mode after
 IRQ test
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
 <8757d4b8-7765-e50f-73d2-34c7c34acaa5@suse.com>
 <16d5ea81-b12d-df4c-bbbb-0d9cdc2df8f0@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <16d5ea81-b12d-df4c-bbbb-0d9cdc2df8f0@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 13be70cb-4252-410f-aa0c-08db972cf812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s3xuj7SV79liwdzYxFPZ6HUvFyedJb8dWUoOsQBFGUSkQyffrkR5jBwpjL2DQqnH/fBCHX/YPMiEpxcDHfSl5dBbae+6oeJjt5hBwt78CoOtOindSbpxiP2KrjsS73vbj+Z3YD5y2TlJ0xGJHA6EsrAkVAVpAeUdJKNZnGCqZ3T7lPgCp9w1jIP+CIAWEV7DPcPLJZKk5XbFmp6yhcSgTg9MFw7/UZPQZ9VMOrcp3IDZYsyEQNlVMYDr+q5brjRxiZf6Bj9t+d82qiny07dtW/PCiNfSkdhoT2ZVLs3cV2YTBZyZy3IiuMmK5/c9wsdywSY69/uMXdPPvRiAlRLvFOIMub5ECudZ07+r8WLbsXgjgZXGXX8soviyLkHgHbATYgsm+QIHFM1sB14K1o2q6qnVTr9yLWRnx3pbx6EJF897DsUbHDyayoGpK0ZDLGsO6FRe0tFcHIzyokD6nHWKuWTPqfVKT+TvcXOh6eY+n0HOeGKpJaJ0i+OM6jrY5eJPkzng3KFA6d27uqteYrtxbzXhN7l1fDvAO43FPdzuIZrrB6Y9fdWiOt+DCK2YfTq65L73jTV9uh80To6QYYHk/j0selE4/Ew6UHdy8lSaXp9gDfClhXfn/jh2VhoD5BdxxuKohRGH52hKmDwkZjZk2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(53546011)(6506007)(8676002)(8936002)(26005)(38100700002)(6486002)(2616005)(4744005)(5660300002)(83380400001)(36756003)(2906002)(54906003)(31686004)(316002)(66556008)(66476007)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNiKzhyN0RDUU9zVU04OFJGeGNjbVU0RFYvTW11ek05UDdwMjV4QlFrWUdl?=
 =?utf-8?B?OUVyWGlsSTNaRloyT0lrY2ZDOHB2T3p1TVRNN2dsT25CMUE3aythaVFKR2Fa?=
 =?utf-8?B?VTNaTldBZTNJWGNJSVl0VHFUZnc3SXFKMVRiODBpcU9zYzNxMk5wcmJyOTlz?=
 =?utf-8?B?MEE0dUZXWVljSzF1SUU3ZWN1K3o4TmxnbmFCM2s3bWpaTU9nN3pTbldyTEN0?=
 =?utf-8?B?dFVLbVMxY1ErV0xpUERZS0wyRDNyZnRNUEp2TWtFdWozYmVickZJRUtBV3gr?=
 =?utf-8?B?RlBuR09WRTIvMVRRTWhNaFcxditubmZ5eW4vN0k3QjdzLzdmVlNrcUMzYm43?=
 =?utf-8?B?bWxONXlMUDBTMzV4aE1LYlRRaHFwblloN01ZRGJFOWRGS1lIU25mZCs2bGFj?=
 =?utf-8?B?NXRvdU0weFNsNmRaWlNvRXYyZE16UzBrdkhlY1dSRXk2MldUOTU5cFdWMytT?=
 =?utf-8?B?V0hyK3pEeW5tdWNPK3FLYTFZVkxZdk9idHY4UDZYcFpFTTY1S1JCUitERktx?=
 =?utf-8?B?M3p4aEdIY1g3N2Vwd1JYSnB1ZUVKdWY5UU03aklMNXBYZ0lCdzJJRXlHMWoy?=
 =?utf-8?B?WUc3UytZajlLeTdzNm1qYjZjemNsWWN2LzVvWm5vTFJKS2hXR3RtWnBGQnlZ?=
 =?utf-8?B?SDEvUjR1WkRqZS9kaFd2blJUdlBOSGZKY3lRYy92aTRXRXFCL29UdHF0SFBs?=
 =?utf-8?B?SjU1azBHWDZZNU1iOEJGN2tQS1I5T3d2SEFnL09tR0VFUWFCMjZzMzJjbzZl?=
 =?utf-8?B?QUhwWUJtOW9OT2ZWZUhDM3NGdXJJaWkxRHUwSjdqMlR0Rk5PbExWWUNQQzl2?=
 =?utf-8?B?TVJnS0hIZk11K2s5eWdqYW1VY3RyY1BKc2huVG13Q1hrRlRwWVNqNVA4bitZ?=
 =?utf-8?B?M0lxM1gvdWdGb3RMZEZ3emVUd1liM3VuckxoVjBrNS9zM3drTGQ5QzJMdWZx?=
 =?utf-8?B?cXhPb1FVeTNveEVmb3VkWU9kUkJDVFpVUXcwV1pEMTYyaHo3TUdUT2tWbTFD?=
 =?utf-8?B?WXZ5NGJLSExQVTh0eW1CWW5FTVlNdG9tVVZBcXE5ekt5Y0owd1NpVXpnSXFD?=
 =?utf-8?B?ZGtwRkZPMU5RVTdYWHBRUDMwQ2RodnJqbDB0a2hWbXZsSzJtUGpHWU1UVXdE?=
 =?utf-8?B?RlRmL0xsa1NSUFFjZGw1VXQ1YWF3dVdIMWtYT1FlWktmNVVIS3FIZXdPdnNZ?=
 =?utf-8?B?S0NJV2w1U2JyOXhVbHNoRjcya1NwQndPb2tmbVYyV0Q0ZUhSYWtJYWpETDlo?=
 =?utf-8?B?SktZY2QyeTN3TjV2azFDWmxCTVF1YzFVRmFyTlhzdzNOOUl5TVZ4Q2FsdTBq?=
 =?utf-8?B?ZENRbHAzd3hUTmM3NVBrZlRLQ1Z5V0lPZmg2UWNQb29CVlNOZmdZcHE0Lzdl?=
 =?utf-8?B?dkVOM3A4Y3p6N2ZqNFdoT1A2eUgrenZ5aGM2Um9DN2JGbFJHMU5pZHgyNkJz?=
 =?utf-8?B?T05OSVJncXlRVjZwT0tvQ1ZNSmFMQTl2dFF3WnM1d3p6OHJCU3lDRjR0czk4?=
 =?utf-8?B?QndxYjRlRFkrczJaN290Nlh1ZjBSUktBcFFoTy9LUHpsdk05ZW52cVpJNERh?=
 =?utf-8?B?SXpPc0dOaURaemdyMytSQjJtR3JKcXMwWkR6S01IcEUyOE1tR25KbEprc0hN?=
 =?utf-8?B?aWpraVVwYk5QQTR3SDZaUG1hSUNZWUZpUjhNdjFqMHhxVXRtc2tZN2ZzdkR1?=
 =?utf-8?B?YjNXUXhrYkhkaStDY1JxbGJjWVZSQW1zQTZOLzRJSnVnVnd3WmExOHZteGxy?=
 =?utf-8?B?TndweDRQUXdaUmFCRVdWMVdhZUNlTVpLa1VCN0NEa2Vkb3F5QndlbklQQmZX?=
 =?utf-8?B?R3l5VlBaU2xpbUJuVnlqQmtuaytWZ3I1dXE0aFlzWGxZSU9kTHpoZTVPRmw0?=
 =?utf-8?B?eUl6U21uUTRYUFkzM21SelU5Z1hITnFTekVnQjBveXpZaUpnTHNuSUI2b0xT?=
 =?utf-8?B?REZhUlZKRWFpTkQydmZod1MwV0RVNS9DOXJnS2dtSGo5SXBYa0sxVVpDRG9D?=
 =?utf-8?B?azlVMzdxUjdOZ05UcHBsT3lLWVNjbUtjVk9ybFlwdUZyQ05kWWU4eCtZWTZC?=
 =?utf-8?B?cXo0aUdyMHNYYndzWlhpdWgydndONEx0UmM5TVhsNW5wd05TNzBKMDdLeHVo?=
 =?utf-8?Q?MqfwayiSjHKuETWLptW7e58hy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13be70cb-4252-410f-aa0c-08db972cf812
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 09:59:20.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy9x7S4nju5ubNzJbpDJbP6N7H8gTSdwBn/0iERzMApR5oQKTXzD9DK6/AzE4w71cOGMDUTZZnXIc3FOywA6/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8831

On 07.08.2023 11:47, Simon Gaiser wrote:
> Jan Beulich:
>> On 31.07.2023 12:32, Simon Gaiser wrote:
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -1967,6 +1967,8 @@ static void __init check_timer(void)
>>>  
>>>              if ( timer_irq_works() )
>>>              {
>>> +                printk(XENLOG_INFO "IRQ test with HPET Legacy Replacement Mode worked. Disabling it again.\n");
>>> +                hpet_disable_legacy_replacement_mode();
>>>                  local_irq_restore(flags);
>>>                  return;
>>>              }
>>
>> I'm not sure of the value of the log message. Furthermore, considering
>> plans to make XENLOG_INFO visible by default in release builds, when
>> not purely a debugging message. I'm curious what other x86 maintainers
>> think ...
> 
> As far as I can see nobody has so far voiced an opinion. How about you
> tell me the level and message you would prefer and I send a new version
> of the patch with it.

XENLOG_DEBUG or even dprintk(). Also note that generally we avoid full
stops in log messages.

Jan

