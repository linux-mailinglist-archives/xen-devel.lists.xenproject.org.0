Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67DB3AE393
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 08:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145349.267428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDtF-0000yn-E4; Mon, 21 Jun 2021 06:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145349.267428; Mon, 21 Jun 2021 06:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDtF-0000w5-An; Mon, 21 Jun 2021 06:58:37 +0000
Received: by outflank-mailman (input) for mailman id 145349;
 Mon, 21 Jun 2021 06:58:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDtD-0000vz-Of
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 06:58:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cb8bbda-a48a-4ec0-854b-43e9b8323ec8;
 Mon, 21 Jun 2021 06:58:33 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-d4H7NInUOAaDJvPTnhUSzw-1; Mon, 21 Jun 2021 08:58:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 06:58:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:58:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Mon, 21 Jun 2021 06:58:27 +0000
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
X-Inumbo-ID: 6cb8bbda-a48a-4ec0-854b-43e9b8323ec8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624258712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cA9dvG83fpTvhDA2rrO+6pXu9a135jKxNSZBk3jSpaU=;
	b=KfuAIwiAepsmkvmXDU27SjYqPPGCOOhnttU1iRt/LMhUHKEyne4Y6oDi6x6xoyUWil0Fpz
	86toNupT+hnzhfPW+Xb/t9jSM4/t3d12S07nfehBrO7VWf97hpSBSjfEERR4BSkVH5D39W
	ew9NpNY0kR7P/sfHXmab5GLr5O1YYTU=
X-MC-Unique: d4H7NInUOAaDJvPTnhUSzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N07Q2kdx0KqrRXFzh5fUMRq6PlWdoGZlyuElE9Z0oGAHn2w4eUQkCdI1NVeE+oVNAl72ASKAqu2f9uyjj9XnxCoqA1eoPKegSqYG9twwp4sDsI/kW5niauz/S333+PMRF2SUQNr6rhAcNKZG53WuvtZ/LB/i/X194jRp02RPLvyVhUdfbD/3o00+9zYEPVvhPZWvrEiZBWdp3wWIbOTmHqDuPyGGknw0jGjoCrnn3FbePhG1J+gEPQ0dB7KuHynecR0ILP5kFV7sCMAw5c7yioAmdPH0Ye+JcAVd8Mv/Z1hcTn8Y1611YIP6iCC1Qi6wRC6KhdnwzKjsu/9kVg0GmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA9dvG83fpTvhDA2rrO+6pXu9a135jKxNSZBk3jSpaU=;
 b=aVMn+aIi0GDKEcncMQmyVnfD2z1ONeDGCQLrqCU52ZINpJRbkqAlQ75bJm7j2aY3RrOG4w8Z4gkUCiwuYTLHDKxhJGQmwen3ifTqNfqMQMZvt3dlBcLPGAaava+KifH36ypkWQ+qgbmtUv+N34INM01Ton2oON412uPghxCS/o9Yny6Z1/I4Gf2DwpyZmRC4cApazaFUztMETisuSsEZ+u+3VL0q3LpHYSgx3JqKTNMc3kCLC1toNhlgAXd3PRh+JxABYjpqM+DKdS+kB0x5AhQu8e4sQBxpTlC9Q6qtLcFGy/kpvWn/TOE/ysz0TFZ4/ZhOJZTxG4ofCgplJ/Wk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
 <ff0c9f42-f45e-e78e-35b9-c030011eed8f@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d50efc1-6c13-1481-b70c-0abfa99aa610@suse.com>
Date: Mon, 21 Jun 2021 08:58:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ff0c9f42-f45e-e78e-35b9-c030011eed8f@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16227cd3-0513-41de-fe31-08d93481f8f9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392B37CCA097718FC016E57B30A9@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HsSclYk4vqkAejJQRNnwodiWnQIMfhqoMNiZUpLX7QPNaFkZtsAmZrtu1mYR+5B2JbNKKNXj4TY9qSiLAO78rKrPdTuUlZDvjGjngSHaQVL2HpeMuV685owYJJFcFS+peqPhPK+f7j+C8rLDjNExjKR0UUEprHIJ4YV3xRRK53FufNw/+xD+xWfRTXJpnhq7WFmARdUq3nB2DMoVAUDMm3656WupXUssolG5Qi9P/j2QW0F8WKYx4onU+8zBS9WNhYDMfATnqcjKwjXTce13K+vJRYznnW8gCKfEjPD/bVDjT5dBCPsD675AdvPgabkkEWi9LkQbkKUBosAaz5c6Fe4yHxYxcXq3T3xUSingjQ+cO+YhvBziBmM/XwlIOxGOFC/yoKDWuh8JI4R2jcSCnV+io9uV41qcIneduAiXgzvFAd6h0sYM4V3HjohwmGX3c6ySmE2rI3CZdVDkXp4DrBwMsIljzXYgA4+H4qkdaZSYYRxDeRU++pcVjH1J3S+HmPOq3U3SJbaM37qzaYp693ycPfdi5YtuSZlGhyrzTjHacIAksZv/HWg/a90icwrGbwoOxZiKWYHTo0LMSAXxeO+WF/d2EldyJSEacSVBTGTLvJgNLMYU22tRqGfU6ToTREB/ZWyLnpk/QNlFLMZ1td9zV+6/u7rqXaaSQb9eFZXuIf/+l90Sf6ACrSxE0o/b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(366004)(39860400002)(36756003)(956004)(4326008)(53546011)(83380400001)(31686004)(66946007)(5660300002)(26005)(66476007)(8936002)(186003)(8676002)(66556008)(38100700002)(16526019)(54906003)(16576012)(2616005)(478600001)(31696002)(316002)(86362001)(6916009)(2906002)(6486002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2tjWXVsQXlaT0VHYXZ0UzdmWlBjZmRTenBOQ2xRdkQ2cjZMS2MyZGJQR0ZK?=
 =?utf-8?B?MFJHUTZKLzN2c0c5Z20rQW1BcUFydU1qNkJGeUFsVGFxRUoyTVFoTGdzVkNs?=
 =?utf-8?B?KzFRWFh0T2QzcU00cXMzVFdiSU1FdXpQUWt3WjVjOEVqNVZDT2xtWEhjbzZB?=
 =?utf-8?B?KzBaOHVNTEtIeFRHelEyRjhOL1FvMkg1a2xGRHdJNWpCZVFSKzBBVGNVNjdY?=
 =?utf-8?B?MXp5SG5kbjdDOSs2YVY2SHRtYU90d0RlSDh2a2hseG1CU0UxaEhnWmd0NGF4?=
 =?utf-8?B?MDJWSUhVZW0wOVRubDlXeHJXdUFWb29sckN6T0pGWE0yQ0xQTzNQVmZ4N1Rk?=
 =?utf-8?B?VitOMGxhSHVVZzZDc3NKSmJ1RzBXQk9LUmM0UEdVWmZ6WDNEUlBWUHhOVnZl?=
 =?utf-8?B?OGxtVnU5OEw1Vyt3ajFnR1NNQjN6WmZzbExwdUdWSjBBVktOMTgxZlhWeE4r?=
 =?utf-8?B?ejNNYUhvMW9jTGJoODgwYkxtUnhWUDE1aWhlUSsyS1BzTWRURHFvd0ZhMDRo?=
 =?utf-8?B?dXgzUEFGcUxFZndqM0M0VisxbHdrdmt1SEhYUFpaWDV4eHhQMkdmR29XMUMz?=
 =?utf-8?B?QWZYeW5jMEQ3VVUwaVIzT2U4bzZ2VVQvVEo3WTcwT1orR3hiK0pqQTM0bUFO?=
 =?utf-8?B?TXhQdkZVVGVPWE9RMmtqRjVCZnEzeko5Q0ZQb3B3WE1GeDkxOWNUbWtLOXRC?=
 =?utf-8?B?ZzEyUERlbUlVWk0rUGh0MGVOcE1TSTFueUtKTGVOaEhWTlA5VU5DKzVBampW?=
 =?utf-8?B?RVU5YXFjQ0x6RmZ0OUZFb3BtQVZLUkRka1o4a1V2dEVPcEVGZm1XWnh0ck1p?=
 =?utf-8?B?R1VuYWtzbzdocHlUc1pWY09XM3pURXdTZU5acmR6S1FoZUt1TDNwWEJpVXZU?=
 =?utf-8?B?bkV2RW1yVFhsOFkrM2pWaE5LVXFRNmRINkdYejJOOUNjbFUvQWRmNHhoS0lH?=
 =?utf-8?B?eE5WNVEzSm82azFsUEtDWWpNUHQ4Y3VZNTJ1cCs0UGVlRlJPV0Nzb2tGSEdx?=
 =?utf-8?B?cnh1WGY0WWdPc1V2ckQydXhpT2dQZ2p0Z2tCNGY3azBHemFzZXM1dzg5T2dl?=
 =?utf-8?B?TjJmcWU1QzFMYTRsZ2FtQXRXSS9mckdkNW95a0ZaYnNYSnFxZmllaEFUdU5F?=
 =?utf-8?B?MTNwQjk2ekREWW5LTUJxdng2VDZZc3dWL1FwWnFGUTl3Ni9kTmxUQWVIQmQw?=
 =?utf-8?B?WmI1S1p5eDIyZFBQSXNPcnpKK0tTNmR4cUE1VmoxYzkvQnpyVXV1dTUxd24y?=
 =?utf-8?B?U2hNY2VxWXU3TlJmRWsxQzArRGtaWHdsaGRKRmNUL29oUkJ2VVU2bUh4cDdC?=
 =?utf-8?B?Y3RCbTQralIxSGd2VDByQ0xyRUVydlZrdWJrS3JwSUZlMW9kMFVNa0d6d3Ns?=
 =?utf-8?B?T0wyTWpWVDZwZS84ak5OcUNFTU5GUTA5dldJYTIwTTlLWjdHWmlOZGxFN0lw?=
 =?utf-8?B?ZExOZi9SUWtGclJRb1pMZ1Y4bFBsdnFyUUk0T1dlWmRNN09yR3U1WlUyK0ZN?=
 =?utf-8?B?a1pVTHFQVkZ6TFE5VTI4bDd0Q0h0SkplbTJlTXphRk5Ib1pIcFNxLzBSRjc5?=
 =?utf-8?B?WG13K2RFbHlaanN1U0x4aFhRMGJhaXlPd2JqZkxad1JvUFlwR0FCZGtTRytB?=
 =?utf-8?B?eCtwak40QlI3a29jL3JMZ1pNVVRITkFtK0NlN2RZTXJhOFUyQTMxNmVHNEVR?=
 =?utf-8?B?dGwwTlloa0ViWDJRdllSYzF2TGY4REVwLzlPSmtiTE1BeUVzVHVNS3h4RGRV?=
 =?utf-8?Q?CA5gCQbaGsiO9bXpKf1vCdG1DU7DhSBQx8h/WL9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16227cd3-0513-41de-fe31-08d93481f8f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:58:28.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bizV+fQPHYeHyibzHQDTtuR2PFaNG0hG9VooyVk2v/kRqc+MUyLmqS0FycRrRR69MiFdqO6VBKLTDOnRdRLkYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 18.06.2021 22:27, Daniel P. Smith wrote:
> On 6/18/21 8:26 AM, Jan Beulich wrote:
>> On 18.06.2021 01:39, Daniel P. Smith wrote:
>>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_SILO and !CONFIG_XSM_FLASK
>>> is whether the XSM hooks in dummy.h are called as static inline functions or as function
>>> pointers to static functions. As such this commit,
>>>  * eliminates CONFIG_XSM
>>
>> Following from what Andrew has said (including him mentioning your
>> changing of certain Kconfig option defaults), I'm not convinced this is
>> a good move. This still ought to serve as the overall XSM-yes-or-no
>> setting. If internally you make said two variants match in behavior,
>> that's a different thing.
> 
> Apologies that I did not express this clearly. What I was attempting to
> say is the fact of the matter is that there is no logical behavior
> difference between "XSM no" and "XSM yes with dummy policy". The only
> difference is the mechanics of how the dummy functions get called.
> Specifically via macro magic the dummy functions are either flipped into
> static inline declarations that are then included into the code where
> they are invoked or the macro magic has them ending up in the dummy.c
> XSM module where they are wrapped in macro generated functions that are
> set as the functions in the dummy xsm_ops structure. Thus it is always
> the same logic being invoked, it is just mechanics of how you get to the
> logic.

That's what I understood, really. What I dislike is the inline functions
going away in what we currently call !XSM.

>>>  * introduces CONFIG_XSM_EVTCHN_LABELING as replacement for enabling event channel labels
>>
>> Is this mode needed as separate functionality at all? Nothing defines
>> XSM_NEED_GENERIC_EVTCHN_SSID anywhere. _If_ XSM went away as a separate
>> setting, then imo this one should go away as well.
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -197,22 +197,33 @@ config XENOPROF
>>>  
>>>  	  If unsure, say Y.
>>>  
>>> -config XSM
>>> -	bool "Xen Security Modules support"
>>> -	default ARM
>>> -	---help---
>>> -	  Enables the security framework known as Xen Security Modules which
>>> -	  allows administrators fine-grained control over a Xen domain and
>>> -	  its capabilities by defining permissible interactions between domains,
>>> -	  the hypervisor itself, and related resources such as memory and
>>> -	  devices.
>>> +menu "Xen Security Modules"
>>>  
>>> -	  If unsure, say N.
>>> +choice
>>> +	prompt "Default XSM module"
>>> +	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>>> +	default XSM_FLASK_DEFAULT if XSM_FLASK
>>> +	default XSM_SILO_DEFAULT if XSM_SILO
>>> +	default XSM_DUMMY_DEFAULT
>>> +	config XSM_DUMMY_DEFAULT
>>> +		bool "Match non-XSM behavior"
>>> +	config XSM_FLASK_DEFAULT
>>> +		bool "FLux Advanced Security Kernel" if XSM_FLASK
>>> +	config XSM_SILO_DEFAULT
>>> +		bool "SILO" if XSM_SILO
>>> +endchoice
>>
>> This did live after the individual options it depends on for a reason,
>> and you don't say anywhere why you need to move it up. The way you
>> have it, with the default command line kconfig tool, users will be
>> presented with dependent options before having chosen the settings of
>> the dependency ones. That's because this tool, to a degree, moves
>> linearly through the options it has parsed.
> 
> Yes, this is specifically why I moved it up. Clearly we have different
> approaches to how we like to interact with configurations, which is not
> bad thing. I personally found it awkward the other way but can easily
> move it back.

I'm having a hard time seeing how presenting dependent options ahead
of their dependencies can be a good thing: The user will have made
their "choice" here, while the availability of the individual settings
then may change in case the depended upon options change from their
defaults upon the user reacting to those prompts.

>>> @@ -261,25 +271,12 @@ config XSM_SILO
>>>  
>>>  	  If unsure, say Y.
>>>  
>>> -choice
>>> -	prompt "Default XSM implementation"
>>> -	depends on XSM
>>> -	default XSM_SILO_DEFAULT if XSM_SILO && ARM
>>> -	default XSM_FLASK_DEFAULT if XSM_FLASK
>>> -	default XSM_SILO_DEFAULT if XSM_SILO
>>> -	default XSM_DUMMY_DEFAULT
>>> -	config XSM_DUMMY_DEFAULT
>>> -		bool "Match non-XSM behavior"
>>> -	config XSM_FLASK_DEFAULT
>>> -		bool "FLux Advanced Security Kernel" if XSM_FLASK
>>> -	config XSM_SILO_DEFAULT
>>> -		bool "SILO" if XSM_SILO
>>> -endchoice
>>> +endmenu
>>>  
>>>  config LATE_HWDOM
>>>  	bool "Dedicated hardware domain"
>>>  	default n
>>> -	depends on XSM && X86
>>> +	depends on XSM_FLASK && X86
>>
>> I don't think this is a compatible change. I'm not going to exclude that
>> this is how it was meant, but as it stands LATE_HWDOM right now doesn't
>> really require FLASK, and could e.g. also go with SILO or dummy. If you
>> _mean_ to change this, then your description needs to say so (and ideally
>> it would then be split out, so - if this is actually a bug - it could
>> also be backported).
> 
> Actually this is the root cause that started all of this work. If you
> want to get technical, LATE_HWDOM does not rely on XSM at all. The issue
> is that you cannot use it as it was originally intended, to run Xen
> without a classic dom0 while still having all existing capabilities.
> Specifically the hardware domain does not have the ability to assign the
> pass-through devices for which it is in control. This is were Flask
> comes in to enable assigning specific privileges to labels and then
> constructing domains with those labels, In particular it grants the
> ability to do pass-through assignment to the label assigned to the
> hardware domain. With the upcoming XSM-Roles patch set, these privileges
> are assigned to roles and it becomes possible to assign the necessary
> roles to the hardware domain.

In which case this needs spelling out in the description, to justify 
the change in behavior (which I'm not sure I really follow / agree with
just yet).

Jan


