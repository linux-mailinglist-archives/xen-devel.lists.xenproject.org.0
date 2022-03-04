Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5F4CCF2A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 08:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283983.483107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2X9-0001qF-SO; Fri, 04 Mar 2022 07:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283983.483107; Fri, 04 Mar 2022 07:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2X9-0001oF-Ov; Fri, 04 Mar 2022 07:39:27 +0000
Received: by outflank-mailman (input) for mailman id 283983;
 Fri, 04 Mar 2022 07:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ2X8-0001o9-38
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 07:39:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3605104c-9b8e-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 08:39:25 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-gCVkx7wRM5yuq9ynzDaISw-1; Fri, 04 Mar 2022 08:39:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4262.eurprd04.prod.outlook.com (2603:10a6:209:4a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 07:39:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 07:39:20 +0000
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
X-Inumbo-ID: 3605104c-9b8e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646379563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCSTnhtK73JG4Bm4Aiy6BExqm0UZpVdf+AjyBQJ4yAE=;
	b=ad4z0Y6+2T3TXLrbW09V5rpUz7p3SjwnFwiWVygUgcObIb5zQ3lMK9p899tJsB4Ln2vDUo
	s3g7g7cVPGcsV2s8GYyKqhVUMhqY2q8RSGFaggYljKY3giw9zal1vI6qH8c3dzrvqrgAJs
	bwtZcY3yc80rzdQYE+uXq07eVadoc/Q=
X-MC-Unique: gCVkx7wRM5yuq9ynzDaISw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtNAg8+GbvBTL1xc3XZcOLBDOnhCzpVElWbsPTrB6TlmwFx0TQMUY01eRSLnyejEixrhJeNgd+3fpxHJ7H+CNzKCUlMxNiWHg+LKjRc4KIPkU4lyd/1ZPM24S6Mg7AKqvK/tvYx7u7e7y7fZls7s0U7YdnyC28WEbvLntqNLSP2KyFDryLWYDIulPdk2bgUy3YIAMw8NDre+Fa/942GRj+uO7imA5TMvq+GHZjo3xgPaOO4b/wwsjEUeeUa8AFDHOC/62cvToEYNusn2KIKuPsq5mc89oOfIQ/puX0Hid7xfTTCl/3jA0VU2PJ/RDGMM8RaqRm4hYGFT0PrZYAqJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCSTnhtK73JG4Bm4Aiy6BExqm0UZpVdf+AjyBQJ4yAE=;
 b=F9t17rlfQ5E0C6KV3xlwZCF8CqyMrmAAORgo8bpO+yNYJn68bUOTDhndDzO6jsA7YNZDXQXW6UcA9ATzywk3SBSSMzwFmH7Os3dLuXn67VbHDISvZjOVndkgh8h+Wv1yPxG3cmKbk2No8RmgS4PMNMBBkh9XUyMInS7Ux87XWwpOV9NKOPwxlq1GkVkfQmr9T2WSJ7OsANDYTCUgGZISfqQfir4j4LHtixWgmFDYU5X433YPMBJWXJnekNBgD4COY3/4ApM/2TmD2w8dhZAyl4kZNHipvVdWVmAWx2XlP1BVtxXmzRTDD6svraqi8Re7T7jeJSiI7+ejyCUCv9Qspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7169f24-c5c5-fd74-7c8f-809482615a43@suse.com>
Date: Fri, 4 Mar 2022 08:39:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Regression] [PATCH] x86: fold sections in final binaries
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
 <85b6a876-ac8c-051f-5b61-23c58b29c1dc@citrix.com>
 <c85691b8-675a-7a7f-8c38-d224c88a9aaa@suse.com>
In-Reply-To: <c85691b8-675a-7a7f-8c38-d224c88a9aaa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82be941d-e6c8-4f3c-7451-08d9fdb2181e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4262:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4262C86F514BC8EBD7B7B85BB3059@AM6PR04MB4262.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gBnTMQD4SVbo0Cc6IxsXQvMjp4kWn57H/BOUChUQrJWa2ZLl1Ku0O7Jpk8v4p+X/Q6c8LajtNomJT7bBPkPUEo7tu1l04+OLQ6ksZT8tHF6EXTZYbssuaFlrPpYj/qy6yEaZZJ8INvL0QQQ0nBnfbAiJE9ba9O6z97ehxHHyMOm3QWKFWtAIMsMawa8nH1VYxmVauaWirbH23rRXTYJJWgHn3UBVNHaTk5cBJAW9xcn8S7gATAZpbja+HkNRewFHKa0lt9TiCMU+VGZd0AdOvc4hLte/JdcPYOkg08av+Y6W7J/03uanMLElg+JA9zOxiQJLCch7BCpI8EpArBnwQ1xA3p+dzB9TwREcqCo0xv3AnQoor62AraN6F5u1hqCbsrZetxV1Sv3XJOxf+477J8Dc6rBMBON91Dgfv5EBvzVMyk27cT4DokqRk5bAzIPAbiybnI8SDCeY1ayIbBXdqdv2LAgJarxisljCft5jcSm1quCAunzhyYKOyl9o5ixsSb4MHxZPpVt2sngr8gCO8IYYoMZMzA1JMUjSm2nFMXmh6iaBaYLXN3Lb71QoKVoDsWwzwzHSzNLaRA+2dlImPBXGNPK+3InMks7FZom9HUly/MqqR+jI8l5TJ4oBUcl4l9Vuq4Wkgyfm0JUTb6KTLJsheY2OIiTG2BJVW/atJFarUJHJ+LuGJKtrKnEqsI1f+1cGBggGI9lkvj41zzecBCe0BC+gvDxUqzntYqeH5xRDqxs3votyhJwzv+ESAm+ZGTqbDzNEQ7K/VpElTQh2Cjf+IJPRLA7UKqoHglYpu2LoiD0fQS8bmkwaKXiOhl6ohtbLNnSFz3uaF4IpQVtoww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2616005)(6512007)(53546011)(66556008)(6486002)(966005)(83380400001)(31696002)(66946007)(6506007)(8676002)(4326008)(66476007)(316002)(54906003)(36756003)(26005)(186003)(5660300002)(6916009)(2906002)(86362001)(508600001)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VitqaEpFR04xN1VkOXIvdU94bFhJUk81YTZQcmVMaWNTc0g5TWJBbWRwY3pn?=
 =?utf-8?B?TkpneUhtbHdWcDl6eGY0VUJlWWRENFFvZmtjYlpIUWFrd2p0YkVQbDlvZ2N6?=
 =?utf-8?B?NFdmWFMyT0NFRGNLVFBQR08xY2tYRGZSTnNPL1BRNFd4KytvNi9kRStDdkdR?=
 =?utf-8?B?Y3RMQ05MN0g2THlJSExNaWorUGw2SWpNNWpLdjl6Uys4TVJyKzl5dTRISTZV?=
 =?utf-8?B?NFBSWTJxRXdzTnpLUS9iU2NUMVc3OUl5Y0lYVFpYYzcrMjEwQ0VnU2hxYm91?=
 =?utf-8?B?WmY0ZlJ2czFRWGtNQ1Ria21CS3oycEJjYkJFV1hwbjQ2Sjdaa0grMGQxcVgy?=
 =?utf-8?B?bDNXVUtBMkNWL1pkcllXeEVOQVk2QjJ6bWN6cXQ1Z3lRVkI2R2NSL0ZqOFBq?=
 =?utf-8?B?cTVpekppczN3eXJ6WlFteEFybTBoTk03SEV5dDNGVzYrcFBkWDdSTVQwY3Rv?=
 =?utf-8?B?SURZcHUwZkh0eDk5V0NYTUptTnFwd1p3MThMdzFHSkxZSFREZTRnSHpPRGJz?=
 =?utf-8?B?amIvV3lpQjlnY1FLN3lybkVVREtxeGV2TjNvMk9vSCsyOC9VSmMyWVBNZHMy?=
 =?utf-8?B?dlBsYXF3TE5JWGY0bWMyMUloNkJaZmR1dGhNVllMMnNBdGZVdnp5Y3AxZSsr?=
 =?utf-8?B?Tnh0SUREU081NndyQlFVTEIvVThudEoybFBNaXpNOVVHYzFYK2JvcTFwVElP?=
 =?utf-8?B?Y3BQQTYyZFVJUlIrWTZKcVJZd3JDNmJYOUZGaDFHNDg0SVVzb1JNbGh3eW1h?=
 =?utf-8?B?OGhvNnowRDBGOXR4dEhKYVBwK0svWGRKeDBYbUtSS21jVlpCZjdaY09rUjNn?=
 =?utf-8?B?OFRRSGpKZ09aUWdHNmZOa0dvbWFvL2s5ek9BYUdMb3gzQXdacHMwVjN0cXNB?=
 =?utf-8?B?VGlXMWVwZ1c1KzBxbTc5RkxaL3o3clJ4Tkl2UXZhM1hwU1libTJTQzlkczdU?=
 =?utf-8?B?d1V4MStyZFhVaEtsdVJwNTliU2Z3RmZRS2lnK21sY2xGY3lER0wxU0dRZjZ1?=
 =?utf-8?B?OGtyVmhyV2Mxa250R3VkU1ZaTEEwK1RiTGc1dmlDbElDT2t4REtKZk5pVXYx?=
 =?utf-8?B?UUlsUWNyVU5CZStZR2xLZU8yRmtTY2NNTVdhSmJQRHd3dVVGWW9IY0RpTFRx?=
 =?utf-8?B?UktPbXg2eG9LcVlsbWQ1bTI4MDd1cDVnUEJ3UiswSGpZZDZidFBOUzMwV2FQ?=
 =?utf-8?B?Wm5vZ2lqK1duZGNZc0R6ejN6bEw0NXhXNWFINk8yNUYwTklsSnlKUDlwNmlm?=
 =?utf-8?B?eXhsRy9FUFE3R3hncUVqaVd3WitkRVRHTnFGc2RpdkRsbXNVQ1hwQTgwUWZt?=
 =?utf-8?B?N1JaMk5nV0hxeFQwbkV0QUJlbzBQMDdkNXhyWGNVQktieUpXcXRmT3ZQMXJ2?=
 =?utf-8?B?MGtRWHdPak1OMm5qRmxUMWJUdzAvMitSanVMRm9nbDU1a3RibTR5M2pxVW9n?=
 =?utf-8?B?QjhkN3VVRGxBdGxiSDM2STJKR0NBMzBkc2t4N3NBV3ZBa09iZlo4emdYV1Jl?=
 =?utf-8?B?WldZMXFYVEZzRGEvdzRaS1drZk9HbWxzTEt5SXpwMFZORzlYc3RFQXdHaEZE?=
 =?utf-8?B?MHZXUWNMNHNJUVcrY3FLdlFDbkkrcVpRdWpiOU9jdXpUQ1R3TWsyOWlBY1RB?=
 =?utf-8?B?NWZvWGZISFVOYTdlVnRwOHhlVGI3WTlkOUw3NmRnY2I4UlR1TzYxancrZ2Rh?=
 =?utf-8?B?ako5NzFSbnV6Nzl5Wmd2ZnVpdzBTbStWRnFCRGpXUDVzYUdKREtONGpnVE0y?=
 =?utf-8?B?YWVYS3V2NTBDVTg4WGd2ZG1XLzhIeE04TFF6UUFmUnhjNEJFU0xOQUVQc3BL?=
 =?utf-8?B?UzJnZklYa2VTK1ZXOFVoSjdiTlh4akpDUS9YQktLbERhNzRLVDZONUpYeHVK?=
 =?utf-8?B?OHJ3SFV2K0NSSzBHNXlhdW01em16MFlyRnNoMlAvclVDWCsxZU5oeE5XUE83?=
 =?utf-8?B?NnR0dHN2M3hyd0lzY01ib3IvVFdqMFplWHArN0I3dEFjNlZ6WllkQ0lIa1BL?=
 =?utf-8?B?Wm1QaDJRckQ1WVFxSFRqbEtzR0crZ0Qrbis3YVp4UnhlZEFyTEd5K2haQ25o?=
 =?utf-8?B?d1BZbVVBekc3QS9PVHVlczJpOGpKZ0J4alhLbmY5WFpKekhlVnpnek13TW4y?=
 =?utf-8?B?OU1HNjBLTUYrUjAwWU9Ja0JBSlg1T290VlJBV3VpMFcvM05kWHNiTUV1TjQ5?=
 =?utf-8?Q?ZI/bBH4U4/5t9lkF9DTRYqI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82be941d-e6c8-4f3c-7451-08d9fdb2181e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 07:39:20.1540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05cmNUCMdZfyNtJ39r0Fdn/mew2hZ+0fhjCd7PZsJAjVXzwVq/seqWiCpc/+UX3EdvTLX4jYxqwzR5jfAci08Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4262

On 04.03.2022 08:29, Jan Beulich wrote:
> On 03.03.2022 21:02, Andrew Cooper wrote:
>> On 01/03/2022 08:55, Jan Beulich wrote:
>>> Especially when linking a PE binary (xen.efi), standalone output
>>> sections are expensive: Often the linker will align the subsequent one
>>> on the section alignment boundary (2Mb) when the linker script doesn't
>>> otherwise place it. (I haven't been able to derive from observed
>>> behavior under what conditions it would not do so.)
>>>
>>> With gcov enabled (and with gcc11) I'm observing enough sections that,
>>> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
>>> failing the final ASSERT() in the linker script. (That assertion is
>>> slated to go away, but that's a separate change.)
>>>
>>> Any destructor related sections can be discarded, as we never "exit"
>>> the hypervisor. This includes .text.exit, which is referenced from
>>> .dtors.*. Constructor related sections need to all be taken care of, not
>>> just those with historically used names: .ctors.* and .text.startup is
>>> what gcc11 populates. While there re-arrange ordering / sorting to match
>>> that used by the linker provided scripts.
>>>
>>> Finally, for xen.efi only, also discard .note.gnu.*. These are
>>> meaningless in a PE binary. Quite likely, while not meaningless there,
>>> the section is also of no use in ELF, but keep it there for now.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
>>>      ld is quite clear that this is an a.out-only construct.
>>>      Implementation doesn't look to fully match this for ELF, but I'd
>>>      nevertheless be inclined to remove its use.
>>>
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -194,6 +194,7 @@ SECTIONS
>>>  #endif
>>>         _sinittext = .;
>>>         *(.init.text)
>>> +       *(.text.startup)
>>>         _einittext = .;
>>>         /*
>>>          * Here are the replacement instructions. The linker sticks them
>>> @@ -258,9 +259,10 @@ SECTIONS
>>>  
>>>         . = ALIGN(8);
>>>         __ctors_start = .;
>>> -       *(.ctors)
>>> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))
>>> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))
>>>         *(.init_array)
>>> -       *(SORT(.init_array.*))
>>> +       *(.ctors)
>>>         __ctors_end = .;
>>>    } PHDR(text)
>>>  
>>> @@ -404,16 +406,20 @@ SECTIONS
>>>  
>>>    /* Sections to be discarded */
>>>    /DISCARD/ : {
>>> +       *(.text.exit)
>>>         *(.exit.text)
>>>         *(.exit.data)
>>>         *(.exitcall.exit)
>>>         *(.discard)
>>>         *(.discard.*)
>>>         *(.eh_frame)
>>> +       *(.dtors)
>>> +       *(.dtors.*)
>>>  #ifdef EFI
>>>         *(.comment)
>>>         *(.comment.*)
>>>         *(.note.Xen)
>>> +       *(.note.gnu.*)
>>>  #endif
>>>    }
>>
>> This breaks reliably in Gitlab CI.
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/2159059956 (gcc 11)
> 
> Hmm, I wonder why I'm not seeing this locally. The lack of mentioning of
> .fini_array in the linker script struck me as odd already before. I can
> easily make a patch to add those sections to the script, but I'd first
> like to understand why I'm seeing gcc11 use .ctors / .dtors while here
> it's .init_array / .fini_array.

And it's as simple as this, seen in gcc's config.log:

configure:24049: checking for .preinit_array/.init_array/.fini_array support
configure:24214: checking cross compile... guessing
configure:24219: result: no

The mentioning of .preinit_array there of course makes me wonder whether
we need to also cater for that section. But with the orphan section
warning in place (hopefully soon), we'd at least be made aware by the
linker if such a section ever appears for whichever reason.

Jan


