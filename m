Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104772DEF9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547980.855679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9147-0006VG-PP; Tue, 13 Jun 2023 10:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547980.855679; Tue, 13 Jun 2023 10:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9147-0006SZ-Lw; Tue, 13 Jun 2023 10:15:55 +0000
Received: by outflank-mailman (input) for mailman id 547980;
 Tue, 13 Jun 2023 10:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9146-0006SG-7z
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:15:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe12::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ebe236-09d3-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:15:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7660.eurprd04.prod.outlook.com (2603:10a6:10:20f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 10:15:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 10:15:49 +0000
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
X-Inumbo-ID: 46ebe236-09d3-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdrtaB1xvF+eAy3DD3h1dpz+MUUE+51tMIB8jthIQcjjXQgw0FVvttDq3Q5YEOINPWT4OXvWle6At8AyPtydHAdBQh/HKeDHNRHbqs5Q2adUvrvd4yoKiTH/16QKPDo43pKXEJtXO2DHfzozg8s7INOacvfdsUvFOkaCHsbkud1QCWJq0yVBgW7ypP+Pli0m+nktBGIk3J/ihVbfV2pGf89i+6G3CVO3Vcqu56tvm9NkAmRMy8i8jIp1VpS/q1RN1C2TxJm8SiF4DLI5Bg0EPp9YrDA1urIqop7zvtq7uzID9K/UzTEzWztQLMtuFXkkE3Z9qwu6Jh0pZcwfHeNGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZWQ0CHVy2ARRI1RVegdVoQ24Ymxtmh701JK/9ZAcoc=;
 b=YUWfYq9KvYG3Q4KkwiMxjmdlSeoSiaAZPDT8/Z8M+7fH1U4qZGdPICJHWKj1hyFOa8zGatotnNkiaNhAd6SAK0JSGbc6Hntw8/Fo1MqhkYsnoeVzLB30omKN0GVCAABLLKdtU07ENvuA/66WEBrE9W1O9lKDKR7HwKEgSFJw3v3iT0IiQspSxXQQLXTLhJarVJ1tmrtoKlZejR0ZByUc33IsSRqU21FB2ewUIUAckYj9r0gTTGbC1TVyvc/661x154WdmjzCPVUocm5T3djgOxk2oZUneMtqU0eVnN0OaBpdIVaqRL3MzEFnoSv/Do0uNfmxDVbjBiaw7QTYBZNHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZWQ0CHVy2ARRI1RVegdVoQ24Ymxtmh701JK/9ZAcoc=;
 b=htJrIkAtvvQQlX2PiZO/2ZVadAmAaBJE5BBfi3fobedOIhcEajTyL37aYbAzylXBPIWuPzxms3C+eZ5Y2SeNRdTnlhLjcWNQbXP1v1rDk8d7RhOnoLuU8cwpn07Qz6cuUuS5uSiNmBa5zmwMW4PgsHP/O97iRwdysy8LvqBl6+XhD9r6/mnfXs2o96c7D5X4wh3wVBkda2GhLYpG8bIRjXkcRKGnTCWpFy0uQN1Epy9PY/azvyny9PdWdeyk0HXaCCvO7K+D7nrU4JFIPHzZFeNRBVb/9Vpp5ltFdp7LnkSCKQwQosw3LWXhRVyRPfoHE3A3fPQGV57zFBG3gmo88Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec8776dd-9a3d-7529-2614-754ed2879e55@suse.com>
Date: Tue, 13 Jun 2023 12:15:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
 <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
 <a3c7752e-cd99-d90b-376d-bbc60cf4a967@apertussolutions.com>
 <10f2d41f-b34f-207e-eb73-d53f31385d8e@suse.com>
 <70622b39-cf85-49f4-69a7-b8039baa07f4@apertussolutions.com>
 <f00fde6f-4dcb-45a3-5b6d-5f1704ecacbc@suse.com>
 <f5315788-a8c4-e92b-de7b-7eb9f3c0753b@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5315788-a8c4-e92b-de7b-7eb9f3c0753b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3d5766-e0f9-4b80-2e68-08db6bf7294a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4PntT3hisn2YerNdNqCnubR8TYj+YiPCWr9BEL3w9noirM3uB7ADsMd6Cu9x286KotJ3oB1QWA611DoXgs7YDUo2d9T56J28xq/bxWD8af9QVkRib7JAwpivf5ktiW6cSdlpFQfv73gibtoULXlMfAxflm/O8oDWT/CwzmrMKL4IzchZw7/QB2mkBbAwGBJPxs/pu8JuGE2KIZXR/a7Qogtbk6cbqKJGhQxh1Q1KjBZNVoPNm4Qgw2HXkx8P/K7hJ11Hu8i9WivXeGLM8CGICMLLweIpl3/wOwSN0wZRzXaM6qcAG6x2nTCE8ecbAXjY4tf25mvTUT1Xo8NtkgoeiAkFIGXEEBRQrqvbmksW/y5/tAH7YKpO9ZmlN0j5722NbFrWRZn2XUFYHVc+6gqHByJIExFG0fJlcfb84iB/BzoaqT7Cqu/9XQgTZIHZD4zx6BBCilb/j5oeH/n2Pi/EMh93nU+Yph+LlIqeGallcxe5NFwhz61WlrSmEbzALdcoW5uGietxuFVd6eejo4MTC6DUR++Zz3Gv/RvIXMzRBTC0E8M2gzvuJw0fKiBJiilq6Thde54FFuFNiTAwCKv2um7LOS0SK9zQR2/SkvyUCp/VwItFiBNcedEbZnygeYAtVYuGcb9kdACfWJiByrV5oWCJWIRaViLz6uvn4Bct3DGYcJ2eMm6thKy6qqt965T0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(6486002)(36756003)(83380400001)(2616005)(38100700002)(31696002)(86362001)(53546011)(6512007)(26005)(6506007)(186003)(2906002)(54906003)(66476007)(6916009)(8936002)(4326008)(316002)(66946007)(66556008)(31686004)(41300700001)(5660300002)(478600001)(8676002)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1gvalZoNDJwWXczNmdLa0MvOUp2U3dNZnJpM1pPZDY2OWVPMEdKY1NWSjB2?=
 =?utf-8?B?Q2RZVURvcGdOckxxL1NMUU5LOWVHeUtDRytsN0p5OUQyTDJJUUZtcW9Lb0c4?=
 =?utf-8?B?TXF3UE1Yb1dFVnNFMnMxS3Y2L2RWZUZ4YitUQXdiKzU5YUxIS09sRnNtS2tE?=
 =?utf-8?B?WGs4d3FjTG5aT0pNRS9LWVllaERXMUtoRTJsbnlhS2VBS29Qa1pGRFpTUlZm?=
 =?utf-8?B?dm5KQ0xtS09lZzZxcitidFAyU2RDVXJLalBNVXAvcXhWMGNxK29XOEV1cTFM?=
 =?utf-8?B?anE3QkxDS0lZQXdvck9jN0dGQXUwL0U4U3FQcjZzdklFeDc0aDlVdnBIUllq?=
 =?utf-8?B?eDZmTHNIeW9yaW5FVjgreWF1QnRISkVsK21RblczN3BlZU1WWmQ5T1BqVTBK?=
 =?utf-8?B?MzNZR3VrVnFBdzZ4alFLYVRLWE9kOFB5QlY0a3FTQktOZ3VoNWRxcEIyY2tr?=
 =?utf-8?B?alk5dStvK2FoWVNFNVM2WEY2OTN0SW1HcXhrV0tMWDhTYWhYUGtDcnJ3M2tz?=
 =?utf-8?B?VmFEZ1FYYUFlb2Z6NFllNGpkRFRhbCtiU3gzQmxBajgyajlmWVZEUE1OQmFW?=
 =?utf-8?B?ZTFmZFF4cHFYWUVYcExORWtQMnI1emZObm1uRFU1NnlFWW5Ld04wTU04cDRC?=
 =?utf-8?B?dzU2blFFQ3RhSkxQdU8vVHlTRkxRa0tsdHNPRTV1L2xaVlVsRmJKRU1KbWp1?=
 =?utf-8?B?WWJYMSszenlacWN1eXIvTG1SMVA1azg2NlVEV05jcVdKYXI5MXMyc1plOXho?=
 =?utf-8?B?VjFJL3Y1UC9mcU5sYjFkVGVvWVhsU2paZjVXYnRiaE1QbnVISzBUMlBnQm1G?=
 =?utf-8?B?TkU2UGZsZDQ4Ny9MbHdBNFVETVBjcm1DbmFRQ1BOeUhhVGVyNGVZRHltRDl5?=
 =?utf-8?B?cU03Q1J3b0RoK1BiN3o3bm5kTEZIWWV6Ui9rVkszWTJxK3Rjbnh4ZzcvWjJh?=
 =?utf-8?B?T1ZTTzJTZzFmbHkraG1RMTlpWHdtaXkzS1h1R1hqK010UXVkYmtSVTZEN0Fu?=
 =?utf-8?B?cEVndS8rMkNFbkt5VnRZMkJyUk1WdFVKMVhKR01MOFpHTWhjblFhd2pQNXlB?=
 =?utf-8?B?SENSemk3WStHUm9ic3g5UktDeXNnZ1JhSHYvZy9YYUxwa2diSXc2dm9XTFdr?=
 =?utf-8?B?S0MvRWNaQmQxL3pLK0NKY2xoUUZ0cTIwWjB0ZjBXYW01UmIvUlBZbkFwdjhi?=
 =?utf-8?B?MU13cWc5RFJRU1J5RVdnUSs3KzlxQTBVZTJYZ1lIaVFKNjdTY3Q0UkpHaGY4?=
 =?utf-8?B?ZW9pdjcxaEtPU1lmbi9OTEhWTUpOQmZGRUE3Z2FVYTR4WlNJK01wUzNhaVhT?=
 =?utf-8?B?emNOeUJNRTdSc1podGR6WFRpcHNKemRJZzNhbDYzRmwrSS9tNkExL0FVTWhP?=
 =?utf-8?B?TFA1cVY1Z2FmQUIrMGVwVEFsSUNSeFlELzdwV0hGZHIyYzBqazlmaU94b1dV?=
 =?utf-8?B?ZDJKeElWR0ZsME1uY3VBVTVUdjk1S1JGRyt4UmExREU2K3YrWG9GVW9nWWZi?=
 =?utf-8?B?QXpDNkg4clg4ZXQ2SGlyV1dWZFMrMzg3eGoraVRtT2J5dC9ITStmVVE1ckNk?=
 =?utf-8?B?cWcvMFBkcVZSaWltZU5FMUFmdDg4K05EVTVPZURTVzQvRTFsblU3TVRYV1lT?=
 =?utf-8?B?WEY4LzlGZXRxbUFDVkRZTEs5M2lWYVQvbGN2NHhqaGJneTN0cjg2WEJWczRU?=
 =?utf-8?B?MFBwNHBkdzBtYXgraTI2dCtzWi9QdVRlN0JJenlRSmU4QmtMQWpjeXE2Q2hG?=
 =?utf-8?B?Sm93eWtDb0dkWGVIZmFaeUdHQkc5WEtneUp1ZTlTRG5wYmtUNndRa2p6MG1z?=
 =?utf-8?B?TVE5d0kxMFFNbFBqWmhCS3dEOHFMYjJsT3lOZ2lGaG9obnpoRUFKNmlBd3Ry?=
 =?utf-8?B?OVdyU1k1OEFWcjk2T1NqMlk0QWtrSHB4ZTEzeXBWQjA0VlVWSXdSeUxCaHRw?=
 =?utf-8?B?bHlSZEFEaDFRYnVEZE5salNWT0JheUVQblp3U01vdzB0dWUrOUlKemEzMUdW?=
 =?utf-8?B?YXNXc3MrU0Z5REJ6N3RsYmVzODFRSVI2QmwvemlXU2ttVWJ4TkJOL2hTVzZ6?=
 =?utf-8?B?eW9ZRU1LNk9CMnl3a3p2L0NQbkhOUWtzTkNvZU45NlBZb0J5SElaZzQvODho?=
 =?utf-8?Q?VaBvO+88tHXD/4LhZUhKX1gG8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3d5766-e0f9-4b80-2e68-08db6bf7294a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:15:49.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xThfD4VxF7dN8bdIF2cEeKnP8w6cO82SzGDMWl6zAk+xgKvXqjIqTYeftJRmw/46yTUeYSHrjOFzu59ZmSuJww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7660

On 13.06.2023 11:57, Daniel P. Smith wrote:
> On 6/13/23 05:40, Jan Beulich wrote:
>> On 13.06.2023 11:21, Daniel P. Smith wrote:
>>> On 6/13/23 02:33, Jan Beulich wrote:
>>>> On 12.06.2023 22:21, Daniel P. Smith wrote:
>>>>> On 6/12/23 15:44, Daniel P. Smith wrote:
>>>>>> On 6/12/23 07:46, Jan Beulich wrote:
>>>>>>> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
>>>>>>> if the 1st yielded ENOSYS?
>>>>>>
>>>>>> Would you be okay with the calls staying if instead on the first
>>>>>> invocation of any libxl_flask_* method, flask status was checked and
>>>>>> stored in a variable that would then be checked by any subsequent calls
>>>>>> and immediately returned if flask was not enabled?
>>>>
>>>> I'm wary of global variables in shared libraries.
>>>>
>>>
>>> I agree with that sentiment, but I would distinguish global state from a
>>> global variable. I would take the approach of,
>>>
>>> static boot is_flask_enabled(void)
>>> {
>>>       /* 0 unchecked, 1 checked but disabled, 2 enabled */
>>>       static int state = 0;
>>>
>>>       if ( state == 0 )
>>> 	state = check_flask_state(); /* pseudo call for real logic */
>>>
>>>       return (state < 2 ? false : true);
>>> }
>>>
>>> Then all the libxl_flask_* methods would is_flask_enabled(). This would
>>> not expose a global variable that could be manipulated by users of the
>>> library.
>>
>> Well, I certainly did assume the variable wouldn't be widely exposed.
>> And the library also clearly is far from free of r/w data. But still.
>>
>> That aspect aside - wouldn't such a basic state determination better
>> belong in libxc then? (There's far less contents in .data / .bss
>> there.)
> 
> Not opposed at all, so a series with a patch to libxc paired and a new 
> sub-op/sysctl as discussed below would be acceptable?

I can only say yes here for the hypervisor side; I'm not a maintainer
of any significant part of the tool stack.

>>>> Since in the specific case here it looks like the intention really is
>>>> to carry out Flask-specific operations, a means to check for Flask
>>>> specifically might indeed be appropriate. If not a new sub-op of
>>>> xsm_op, a new sysctl might be another option.
>>>
>>> I am actually split on whether this should be an sub-op of xsm op or if
>>> this should be exposed via hyperfs. I did not consider a sysctl, though
>>> I guess an argument could be constructed for it.
>>
>> Please don't forget that hypfs, unlike sysctl, is an optional thing,
>> so you can't use it for decision taking (but only for informational
>> purposes).
> 
> Good point regarding hypfs, the check mentioned above is expected to 
> always work, thus an optional feature probably is not best.
> 
> The next question is, should it be sysctl or xsm-op. I am leaning 
> towards xsm-op because as much as I believe XSM should be consider core 
> to Xen, the XSM logic should remain contained. Adding it to sysctl would 
> mean having to expose XSM state outside of XSM code and would make 
> sysctl logic have to be aware of XSM state query functions.

Well, you seemed hesitant towards an xsm-sub-op, so I suggested sysctl
as a possible alternative. One possible issue with an xsm-op is that at
the public interface level (public headers), besides __HYPERVISOR_xsm_op
there's no notion of xsm-op. And it was pointed out before that by kind
of blindly wiring xsm_op through to flask_op, adding XSM-module-
independent ops and/or ops for some future non-Flask module is going to
be a little, well, bumpy.

Jan

