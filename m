Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B654AB77
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 10:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348608.574825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o11cp-0005DO-Tc; Tue, 14 Jun 2022 08:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348608.574825; Tue, 14 Jun 2022 08:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o11cp-0005B5-Pf; Tue, 14 Jun 2022 08:10:11 +0000
Received: by outflank-mailman (input) for mailman id 348608;
 Tue, 14 Jun 2022 08:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o11cn-0005Az-HQ
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 08:10:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f2c273-ebb9-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 10:10:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4415.eurprd04.prod.outlook.com (2603:10a6:803:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 08:10:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 08:10:05 +0000
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
X-Inumbo-ID: 66f2c273-ebb9-11ec-8901-93a377f238d6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jstJh/97nYdnKUX4XbY6vH6FeSt3our6p5UG26gLYexX7IvU8nLszroAyVcCJAgf+Mf5sE1uTVQkecvXtJN4JawXtUw4mrnZ3hCWDUQhEWznSLgELSTZLq6A+3nuizo/Rkw6nD61Xe2BRWacO5c6X0URJ6x6s+eq9ZTzslb7DacEzyW2MsKL7TMb3J5qrQCPLfbnW+fbYnUQmQxcjjJcjDcCc78rfJRYtZ2+vBSyMVarWjeWlZq9XoYSJflRXKHGodXAhp4JxWgUsHSedH6GisOrEPiEH6w44f6owkujkGXwlRrb5m5UWpbYKUV2gGxiIb8n0wfKuHQnWDgi8fQu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNsz0ZbxPMJJJQzDn/8BrlIDSUIOr4kHw73iGfX2QRY=;
 b=cyBdY0p+jR6Gmc0e5Br5DWsi+ib39VCK76BptA17spjDOWp3QXhJyIi8iErRao4x7cAmw9lcksQlcvuHENNTrTP7A8+pfVTkrYAccWUV/t8tBFMobl29foTnEYlpk5vp62+SkHVKYAc1ap+kp7zXNoMGt9aUvTHsOQP7Qd0IspRiXEm8uowUBfCpRRqfSwobxnkTugkJHIdgINlm2yOoKtk++082wl53UhcqfqTFMEio0mNeP7cOzFkmwLSEQ0AB69JatZf0iucIeol/HDHFncTogfCvlN268o4VIZi06sKd9QR/d8e7obR9DfzpmpdGrIWrJeIqYyyHJEqM11pkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNsz0ZbxPMJJJQzDn/8BrlIDSUIOr4kHw73iGfX2QRY=;
 b=nDEgBEDCQGEoGpEsEtl+M/QMSKNKtAll0yhiWEzjbHpDsoNhOXgeXydMQer9HUpAGq5B9gC1mhjFqDkgKOrzKAGzRDAlDdc7swDiZolmXPxrT29Wdtlzr8a6UwNHdvEucMaOGUx1R/0U4QC+7NYn5HAicQvMXMQVYm05hOMW2zHw3Hog9XjjORYvwq05bo5maBGz3LZ5DJ0P8anIFPayIGhjwP7+RN+vQBezuy9GTZYajUitfqLUN7n7y8jbBNPBzZ5OPi+UwvIcdYnEU6m8TsLGg8C2wKOyilUAT73W2bv2kzg6aQN//fgE+7uwjEHHZPZkEv1NOJVH78QRtuKNZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
Date: Tue, 14 Jun 2022 10:10:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqgwNu3QSpPcZjnU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::43) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9459092-458f-4a45-b444-08da4ddd49e1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4415:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44157091629EAB735C156345B3AA9@VI1PR04MB4415.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LLxHfkmMK4TNySRvqMJXqMGn349KuY9MFxtgmEbX/nq29CCICpgXgW1Z/iV6SOij1FC4b/L1JN/2JPbNlcrUXyU4ZSQwg5gktJPPohhP6dsJRG3FjlCI9Udb5kDLCXFlP/aqunjHdelTRDwUO9RtY5jj2csT3HVJY3qeLskwxYASa4Q9hQTLXHMEB+NvPOLUbp2oCmS791Evvkg7GlwkYSOiJYkeM+syDKGwdTOUGgelsuYnnASelWkzNqKmbgDj4tdzZYCoVMPoQY4P58FYGbJuJCup/MQdht1VZjXAL9cP1wwtnfVeMETi8ah+Qss52LZVUO1TakkzxH30AyXNIutoGT0SKv5OqTzGnc3O3f7RWl2nQzYOX0FQ1TjWnu4u1OBwHiZjrAAkAMmNo7/KrbbFy0/9uZsAnDa+LLHGhxnC5E7kmAVsT5D7HRHyw002fK/sw1me4u3Fw3awZDPEgLx3bKTVwA6nVBRwsk57zwJ7MKxEP+/Q9WLzSSR4neq1GcYZu8jG4zEtiylYxTEg68WEF4T4KUVTFtCX8znYNnYf0/jsEO6SKPF+VPyDK27czMBGT7sfK2mstKJr+bk97m6H1/BCvCpzypU6NocegjreLCYUa6EzmUGiIyMX3fduvyUbe/UYbsEBSVfPDGEO+A/aVHyxXCCGckXyEfIjURJYzLov43My1Ys4CSyVW+ebFOYFltvvWMyAW8VDxMYUXu2MnPXMtSe0kDhpz1LrJLsau0U5I5WCiIerMIAp2/Sg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6916009)(54906003)(8936002)(4326008)(2616005)(8676002)(86362001)(316002)(66476007)(31696002)(38100700002)(66946007)(6512007)(6506007)(26005)(53546011)(66556008)(31686004)(6486002)(508600001)(83380400001)(2906002)(36756003)(186003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUUxSlN3eTE1OFJDcHNEWVhxeC9URVlUT0pGTnNnQkFhZkYxaEs5N0ZDYXFF?=
 =?utf-8?B?Z01YcWFYMkU1aUxPdkF6SDArNXEyU0RSdkVkbUZQOWF2M2x5d2xWdWcxVk92?=
 =?utf-8?B?cmc1NWNBMmZOWjZWQks0OFRMSkRyS2habFRINXo2TEZqdW5Lc1dxTlU1VW9z?=
 =?utf-8?B?S2V0eElsVU1tVHpzMUlRK0JiVDFDU1NSaURqa0pWNE5oMUVmVHE1YTVyWGxn?=
 =?utf-8?B?RUwvaklteUUvV1VhRnllcmVRblVuQTRiYzVhdUI1Rm9yQzZTcGlud3lKckp5?=
 =?utf-8?B?Rk9BN2VWSWpwRkw4bWNEci9PRmwxSlZRbVBaVGJubFdRaTMzZlNUMitvQXBx?=
 =?utf-8?B?VXlIU1REOWUwbFlPcXNLSUdCeGhNalJnSFZsRTk3MGNhMlIxaGtjb25tTlpO?=
 =?utf-8?B?dW51bExJUzlHVjUwdXpzM0xGZlhJMEJVNzhoQ1VHVTEwQkhicFgzZXBFc3Fz?=
 =?utf-8?B?WUFFNGZUNC9BTkhWU0E4U1Vpemw2b3FvUGQrNjdyNnZldXF1NXVuamVCT2pT?=
 =?utf-8?B?OExBT3J5cXFPOHA4WUhEc3BFbUlQRCtqb283UjNYcnhOSGRrTmN3MlZxVFR0?=
 =?utf-8?B?ajY1NUd1VEFtc1YrUHZBR1Z6bXhSL3AycUVDMnNWSWJ6UkxZeHkxeU1Cd3o5?=
 =?utf-8?B?OVpMbEx1RmdwRWY3cG5TRHlmYjNjWEdxOXJvSGJtL1VBUTFDTkZSMDZiRUI2?=
 =?utf-8?B?NkFLblFUQk81NlNlMmF3ZWFwVTRCOFd6SzdhMXRIMEJWTFNRTlpmUE5rNG5Q?=
 =?utf-8?B?eTlOQU41a0VMS1NtM3htakp4RUdrY3ZITGdqUUFDa1ZCeTFSaHkxcG5Nb1du?=
 =?utf-8?B?RkY5TlpoS1paMDNJblc4ZTZKMHg4M2FLOFhiRUdsL0tQcVpwblhSTVBBTjl6?=
 =?utf-8?B?L1JqU1gvSW9CTUlWQ2tHREtVMGIrRmE4K1R5K3BTbk95R0V4WHhKM2NRSC90?=
 =?utf-8?B?VFBMcE16Z3ZORzJ2YndXdElDTmo0aklLRngrM2VCWVYwTjVkQi9CM1VldmRN?=
 =?utf-8?B?Z2hqa0Y4WGc5a2ZBSGcxVGdWRzlDQ0k4NElxNExIOENLOHV2aHNlajVJTitG?=
 =?utf-8?B?cVRBRVROandCSFhtRXNqbGFhb0RDUGpIZWlibmhmdUpiNWY1bklCTXVxM1JV?=
 =?utf-8?B?U0p4V2pSWTdJNnRIMU5uS0lOTjhHaEdlak1vRTcrN04xQUd6WUNyTkZKemwr?=
 =?utf-8?B?Vjk3YlFza0JhVklRL0p4WjltejZIaEFwcDNqaUh5Zzk2NkJTemFseFpRb2FZ?=
 =?utf-8?B?RzBmZExiT2htNXhzUFUxOGVJNUdxVlVNdk80QlF2K0M3L2IzN0J2U3pldGQw?=
 =?utf-8?B?YlZsS0FzWlhFS2dlT0pyRHhUbk9NZkwrbkpPc3o3RGUvWEJGbnA0Qml4WG5S?=
 =?utf-8?B?R3FWb09UY3NPcWpnTUJzVDI4UDJBR1VjM3paMjR0OE4zWjlXVlRSV3RCNTF5?=
 =?utf-8?B?MDBWYm9EOFJCOFd5aTRtU0lIUFpVTlN0Y2JzTUtYMmgycU1xdUp1WVJnMlNu?=
 =?utf-8?B?ckF5MStpdlJnRkJxT0ZCaWY3ak0xMm5HcURsTE1hS2xkSDVMY0dERWgxZ2h2?=
 =?utf-8?B?cHhWYUZoTU1kaVBOMDhJSU5pRWIzY3FlR3pSR3czUkNTd0NQNDd0ZnBWMEg3?=
 =?utf-8?B?TFgwNVozU05PdDZSWWdvUDU5Y2dITmc1VDdqVXRXbFVRTkdxd2ptMUVkYjFE?=
 =?utf-8?B?VFp2aklzUDUybWRMUDFVY0EzZE1rQVNOeFM0MlB1L2JHV3dWakZieG04SzNm?=
 =?utf-8?B?VmYyYlEyVjJIY2VCNVhxUXdEaFJJc0FVV2I1OUk1RDVqQWxrSXdZR0YxckZO?=
 =?utf-8?B?aWhyOHlCMVJvbDZ3M2s2SlNDb1JSVkhRaGFsR3hzUWhSMWN6WmUyOTkxZWcx?=
 =?utf-8?B?SWkxVzV6U3dKWXgzUytmaWxaVjBHMWxvYW5scitzV3FmQzdTUE55ZWphRktk?=
 =?utf-8?B?YnNLWUNmaWMyRUxodUN3Z3FrdHMwR0FuRUpzd3dGOHIyZVVELzlXV2orcDY4?=
 =?utf-8?B?eXEzTE93YTFtZWY5a2J5NHRtd0ZQSTdTYWd6RFpDTHVSWjYwaHhmSzh2WXdt?=
 =?utf-8?B?Y3lyOTVqUk4xb0RaajZwSnNrcm5velMrUy9xUnZyRjNkbEVQUjc0ckRUMit1?=
 =?utf-8?B?ZnRtdjJnSWtQSmltMmNpcUtsYlQ1TXlLTGxldGh0b3o5N0ExNUhTYjAyLzhQ?=
 =?utf-8?B?cFZZSmR0Mll1NElEQlhvcGIxSVdYM2xpRzc3QWZFZ0dnU1VYVTIxQ1hlZEsv?=
 =?utf-8?B?SytNQjhUZjh4SFpxVUt3VE9ROUNCTGFLTjM4dFVQbWRwVE9SWDlrbGJ5Q0JN?=
 =?utf-8?B?S29XR2tQeHNPL1BWRTBSb2g1ZzdFeTA1OWpZZTZ1Vjkrbk1QVFpkdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9459092-458f-4a45-b444-08da4ddd49e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 08:10:05.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTmEbGUrd+QrF170+VHOkheXab+Y1ss7IFGG/YkE1//WTT6qkv7TmoLah+Q4LNYI/UaXCEzs8YHSAiuceYsA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4415

On 14.06.2022 08:52, Roger Pau Monné wrote:
> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
>> On 13.06.2022 14:32, Roger Pau Monné wrote:
>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>>>>>> likely important to have all the output if the boot fails without
>>>>>>>>> having to resort to sync_console (which also affects the output from
>>>>>>>>> other guests).
>>>>>>>>>
>>>>>>>>> Do so by pairing the console_serial_puts() with
>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>>>>>
>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>>>>>> not convinced we'd want to let through everything, but perhaps just
>>>>>>>> Dom0's kernel messages?
>>>>>>>
>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>>>>>> this request is something that come up internally.
>>>>>>>
>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
>>>>>>> limiting based on log levels I was assuming that non-ratelimited
>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>>>>>> triggered) output shouldn't be rate limited either.
>>>>>>
>>>>>> Which would raise the question of why we have log levels for non-guest
>>>>>> messages.
>>>>>
>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
>>>>> levels and rate limiting.  If I set log level to WARNING I would
>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
>>>>> above.  It's still useful to have log levels for non-guest messages,
>>>>> since user might want to filter out DEBUG non-guest messages for
>>>>> example.
>>>>
>>>> It was me who was confused, because of the two log-everything variants
>>>> we have (console and serial). You're right that your change is unrelated
>>>> to log levels. However, when there are e.g. many warnings or when an
>>>> admin has lowered the log level, what you (would) do is effectively
>>>> force sync_console mode transiently (for a subset of messages, but
>>>> that's secondary, especially because the "forced" output would still
>>>> be waiting for earlier output to make it out).
>>>
>>> Right, it would have to wait for any previous output on the buffer to
>>> go out first.  In any case we can guarantee that no more output will
>>> be added to the buffer while Xen waits for it to be flushed.
>>>
>>> So for the hardware domain it might make sense to wait for the TX
>>> buffers to be half empty (the current tx_quench logic) by preempting
>>> the hypercall.  That however could cause issues if guests manage to
>>> keep filling the buffer while the hardware domain is being preempted.
>>>
>>> Alternatively we could always reserve half of the buffer for the
>>> hardware domain, and allow it to be preempted while waiting for space
>>> (since it's guaranteed non hardware domains won't be able to steal the
>>> allocation from the hardware domain).
>>
>> Getting complicated it seems. I have to admit that I wonder whether we
>> wouldn't be better off leaving the current logic as is.
> 
> Another possible solution (more like a band aid) is to increase the
> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> fine with the high throughput of boot messages.

You mean the buffer whose size is controlled by serial_tx_buffer? On
large systems one may want to simply make use of the command line
option then; I don't think the built-in default needs changing. Or
if so, then perhaps not statically at build time, but taking into
account system properties (like CPU count).

Jan

