Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF036BC7E2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510353.787858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciTT-0005SZ-Pj; Thu, 16 Mar 2023 07:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510353.787858; Thu, 16 Mar 2023 07:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciTT-0005QK-Mt; Thu, 16 Mar 2023 07:56:35 +0000
Received: by outflank-mailman (input) for mailman id 510353;
 Thu, 16 Mar 2023 07:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pciTR-0005QC-UC
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:56:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 106b6d44-c3d0-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 08:56:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8087.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 07:56:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:56:30 +0000
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
X-Inumbo-ID: 106b6d44-c3d0-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y45Mjyu7/MttK4wJFsStn8dLQcuPxMEgUipTAh8Qb0KQehTBKl7MyXTja4grLRSitIbrbwzL1OZPyxxSXA/FW7p0lAMCuHto+M4YIngFqT2WeQHw/1Igo9Y28hKyHiyn4Tv7YTZVXrTlcJDK0EdwUl9KgVL1Gtm2mx6bQNf2AUwW6Hn5JMb2vMgF+d/QvFLRqSbBfDy/XoFwkz01YvFV7KgV2RGB0/XPiMtAshPQXaGqzRolnt8LatpVIwFnXaFUFSitV0NhSysmCOg3U12Ll72dLZxR9lrEz9WKSUcqk/csssTmYOYbMI2DoLD80iiwGYC2QO/Hn16pGrZ/yGwYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrN16zHUp/ca8TcEfY5cP+meQmD3ID3XGsOPU5W0AkY=;
 b=U07R/JrD5waHBuNQBRHJjdesDdS9ZyGnyKHp+R+qrfcZQabwqw+XcQ5XWLtwUVwq493NriFXei8TtqVVaTGIqiuT5NYtJelpahczy8LiMbO5dJe9KM0F71gZACS+iDJqRTBf16rjInFIQEGJOPLFFn+GDgcO95QM566EQ/DIh7jjnz93jsO8NG4gL+BXBW4IMboDcOmc0yBBzbgQ5Meelivh8w55Czbas/+7vgsZXQPokWUe0hP7zmkSjNi0JlbXNEY+yrr1cYbIKLqtbcjFkw0DyU7X1WxcIMw6ULjpTr1A7sUXT7u6bJz/7GKDNfUUuwLM/ZiG/8uNjk62E7dDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrN16zHUp/ca8TcEfY5cP+meQmD3ID3XGsOPU5W0AkY=;
 b=HsZVagiBaSk+Eq7Aw9HeA6cWjbqBoXT6S8YIaCctMcE+SfCiZd9vv6wjMkt5UqkabxWah02o9/nDWG8dP3yFkrcT2hPQ+DY9ppTYwFQhrywCh8/SSQutWXpNisR0Boqg3G+nL2s2yTcb8nInA+dyA/JizX3lHPHBf8OQrm3W0KrMIF2gAJCTK6LlCFo8yrf+SPUHXBApxlK/U6QFYcLj6hbMVu4avnSdoG7KwVKAIw2ZiJGdSJ8PuADT3xVb0kTlN79XKkT3LYyCHly+K2YVFUdQDtjHSULmJ5eo0R/S43Il+2feodl7HY7kTjPXx8bojEcv3mkTJmVP9+PQ+I97Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <429cbb0c-64a3-aee9-9693-0d6ed4990601@suse.com>
Date: Thu, 16 Mar 2023 08:56:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230314142749.8845-1-michal.orzel@amd.com>
 <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
 <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
 <737fec84-42da-3b9b-6cb5-d18406925403@suse.com>
 <d67aeb95-1631-74c0-cefa-a0cc88512b84@amd.com>
 <alpine.DEB.2.22.394.2303151844530.3462@ubuntu-linux-20-04-desktop>
 <1c174a17-0860-358b-5593-a7d45cdad00f@suse.com>
 <848813fc-636f-ea9c-00a6-6b8b049f92d8@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <848813fc-636f-ea9c-00a6-6b8b049f92d8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ca788d-d8b1-4fad-dc6b-08db25f3f3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3CLSUEa9ayYwiTFy1rvHDS9iWTiFk2Jz8KT/XZJ+YYKSc5YiJ+Oh0OwDGhFkmivOgmq9b8gtXLa7hYY9mJseh2oN9v07GQVqHUFAldkyQZrBUmb/K/Eq2eWVZkkxF9Wa5Jdt1QlsnZN3T/IXhVsgk3jBZPJt8V+RcYZVbsnnSjYsC7wsqydk+6263bJW6fUr9uu5OcqT3wEXlkXKk35k7LJS5am9vdpCGcHR55s+G8GFunGftHVeKt/ro3L/0R+qSQrbKZ5yHq+vgxGip+UFCxnZAAInW07aBujSPYcLQ08OaTCuqoQRmS1SFZAmvLpjxf8Sx+LC/hzfudLvvFymCNE5StYoflYpCLz4TMaY3XfjVWfuEK3hLtFzJA9VCeBsgHjPay/HW0tCX1kWmHZ/kOHyorklQkzOi3i+j9NkZ9plrOi+StCiR9e1lgjlPFBq9XDw+5O+LLCOPiOfrzEI5vrB/UC28/g09efxdLiY8+n1Cx4uRs8KM5jRrgKhmZ+eg9HHdTZI12riFq2qqsR6k+R4ZRDbGfzfp9I0sxA+LtebY7a3dco/FNf1p1AjJ51z05D/kXiULIX5Ba8ASAY9Qi2KBhAeNXNlH/66wnD0iJcs2/P6KBwor2vdUxiiRsqTJC6xfNDJLYWGLpqxKhFxSzUzIYOJKD3TnCYzmhfNiw0arUtbdX3vg6rhoUeOajpeY3kr3r05bGn84kxn74OpjqNIT/f4HO5yocm2YOnGTlmOhnc+d3z0vtZdeYdELC3b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199018)(86362001)(38100700002)(31696002)(36756003)(2906002)(41300700001)(5660300002)(8936002)(4326008)(6512007)(6506007)(2616005)(26005)(186003)(53546011)(83380400001)(316002)(54906003)(110136005)(66556008)(66476007)(478600001)(6486002)(66946007)(8676002)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFZnUmNLLzNxWDBEUjZ1QmxsdHhxa3N1dU5qMllaWGU5WXNGZ1hPSkx0elNN?=
 =?utf-8?B?aldnTEh1bDNrZWpFMHJJc1d0QkNnY1lud0FGa2RUcHQvZU9CN1RhU0JXaXhO?=
 =?utf-8?B?SUcrdXRTREtGUnB6aStQYlR1Ymt1NlJHdWpvdndrMmFUdG1BcXpPSmJETVBJ?=
 =?utf-8?B?VFA3MkhjajZuenJPVWY2dVN1U0k3c2FqSkhVK2dxOUk2OXFGQUVOc3hqOWd1?=
 =?utf-8?B?OGltV3pyTVg2bU5wSUx6aTFVeGEzUW8xanJwWlpUSGFEUVZQSWNnVlhkUTA3?=
 =?utf-8?B?RUNDa3E5S0xGcGlMd0hodXlXcDJNNXJKVXdUSHZWRE5hWEhYRWozNFFuSzhJ?=
 =?utf-8?B?MWdWWXgxTGUxaCtSRE44akZFR3FwZytlbnc2aHYrOG91b054NmtBTldyemIr?=
 =?utf-8?B?cHFNMU8rclRBZUVQMVF6RGYyOEpUbVpCbzRUM2RLdlp3OGg4RGJoMW1LbXVQ?=
 =?utf-8?B?a0VTZVBqQkdyallXZDBqRjYwODRPbXE3ZnZONWQzVy9janM2enhEUEYwWEJO?=
 =?utf-8?B?QlVnSmRBTGdWSFB0aUVSRWxzbWlpSGdqeE5XcUlmeUtDYWxkaS8wbXk3UStG?=
 =?utf-8?B?QXJPWWtZeER1S0JsWEVGZ1RTWDl3Q0FDcXhxNnBMay9EZUtMMnF6c0t1YkVK?=
 =?utf-8?B?bEFselBSRjkwT1E5UkFKMFF0SEJNTkZ1djZSY1BRYWM0dDRmQTJOU0NrV2pV?=
 =?utf-8?B?L2Zmd2VrL3VGSmV6SVdwdjQxdTQ1dlVmbks5WmpvYzRWQlFtZkxGZjFZRGs4?=
 =?utf-8?B?ZmJiRFQ0SGUxQUZiTzFZdDNWSHdWdU00ZS9xREJ6UlFzQVhDdVhucDEzZkIx?=
 =?utf-8?B?a21CWklTYjRhVVIvSzRzS1F5RkdxVTFZeGs0VGV2dWNlc0d5b2JwWDQ5UjRT?=
 =?utf-8?B?ZVM3SGpWTnpSTlBjcGs4cUVyRWVXN3ByQ3RYbGhGaWRsMjRZajZaZ3d5ZHhW?=
 =?utf-8?B?Y1o3UUJnaWhJdWFqbkFsYjNIa3loajRtRFVoVVFTOVdKSkN0ek1FcTV1T1lS?=
 =?utf-8?B?VDYzaFNLWkZUTVNUeTMyVkVPc2NKbGR0bFMrRkJ0K3NDaVRaY1c1cDdoUXJH?=
 =?utf-8?B?RkZ6dEtnc04reUNNWmpEWEt3RFpxcVhtY3ozL0JWaUVPOGs5NzlITTBUNlNQ?=
 =?utf-8?B?OWlHdnh5T0d6bHVUemVXQ3VTdkVQMW1YMGtGUlIrUjdpWWNaSXQydTFiU1dL?=
 =?utf-8?B?MzBwMXFXMjEraDRqSFNjeXVSV3k4aDFaajYyL2c3TzFwY1hlb1lWalVyVUhh?=
 =?utf-8?B?UWJ4RzBjazFQekpXdi9DYkFCLy9sb21NN29pZGV1YXB6WlBKVUk5WlJoRU52?=
 =?utf-8?B?cVRmTHFpRnBWSjlHYTR3OTRRTFJUNG40UWhXZjZVVHhOdTlGWFc1Z0M0VGxk?=
 =?utf-8?B?RUZBTk5DMjlCT1dZanRFNEhTTDJPVTB5UFJ2WUs1eElwTmdwM21HS2h3K1px?=
 =?utf-8?B?Q3hJOC8xWW1PdFg0TGMwcndjTHdUb3ZCdTJ2bHRHR1ljejJmSXpPL3oyY1dh?=
 =?utf-8?B?UHNlcjVsVStKTFRkaktwckJYaHFvdVcrWXdCb2pHR2RiOEtSVW4xK0hlODZV?=
 =?utf-8?B?Nk5kL0xneHQ4NkFXTmNWYXl3ZnJaQnNqQU9LSW95bDVRSm45VSs2N1g3SXNJ?=
 =?utf-8?B?RnN0b1ptekg2L1M5bkdzOHFXRkgxc0luZXhqRU9uOHhrdnhsNUM1TWJ5ckxh?=
 =?utf-8?B?TXlzd0c0MWZHb1haRElRQlJ0bjFpNUNxWVMyNHUwMEQrVDBZZE9mN1d2RDl4?=
 =?utf-8?B?NDdJRnE2MFc5N09LWkJQZWVvOE5WVFgwaG1FL00rdStJa08ydnlPNFBlMWFV?=
 =?utf-8?B?RnJ4WmRrMUpkNXBaU2gxaHJUdUVKUDJCWjhIZDJxWm5NU29oWEU5YVVGSEdy?=
 =?utf-8?B?aDRXWll3dm5EQ21ZRkxMVDRrL0J3cXRla1FuaFNjcm93c2FJREFqNnNCYXlM?=
 =?utf-8?B?RWpiaFVBbmRHNjR6aXRRTUpIN2owNjd3TWdVbmN5ZEdIcCtXSUMraHNyQUZz?=
 =?utf-8?B?RXp3bFBkcnBGcDdSUlBFTktLcGk1a0VpYU5sb0FmNXRqN1M3RXMwSUlldUY3?=
 =?utf-8?B?Mnp2ZTJEbFNzR2xkcGVLWGozUExRTWM1dlFQTnY4b0YxejdhVFE3bDdoaXk5?=
 =?utf-8?Q?vY0LgMvY/Nxeh+TdNTFPsB0ri?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ca788d-d8b1-4fad-dc6b-08db25f3f3d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:56:30.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMmxSCdwkv9bdVJ+FOfZFJJGcw3tiRGHi06CUNbf6aOL+NGQITybjlztOaBwOv+sP6TilIacgUa4EmFEJhilTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8087

On 16.03.2023 08:51, Michal Orzel wrote:
> On 16/03/2023 08:24, Jan Beulich wrote:
>> On 16.03.2023 02:49, Stefano Stabellini wrote:
>>> On Wed, 15 Mar 2023, Michal Orzel wrote:
>>>> On 15/03/2023 14:11, Jan Beulich wrote:
>>>>> On 15.03.2023 13:34, Michal Orzel wrote:
>>>>>> On 14/03/2023 16:17, Jan Beulich wrote:
>>>>>>> On 14.03.2023 15:27, Michal Orzel wrote:
>>>>>>>> --- a/xen/drivers/char/console.c
>>>>>>>> +++ b/xen/drivers/char/console.c
>>>>>>>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>>>>>>>>      else
>>>>>>>>      {
>>>>>>>>          console_rx++;
>>>>>>>> +
>>>>>>>> +        /*
>>>>>>>> +         * Skip switching serial input to hardware domain if it does not exist
>>>>>>>> +         * (i.e. true dom0less mode).
>>>>>>>> +         */
>>>>>>>> +        if ( !hardware_domain && (console_rx == 1) )
>>>>>>>> +            console_rx++;
>>>>>>>
>>>>>>> The consumers of this variable aren't really serialized with this
>>>>>>> updating. That's probably okay-ish prior to your change, but now
>>>>>>> there can be two updates in rapid succession. I think it would be
>>>>>>> better if the variable was written only once here.
>>>>>> ok, makes sense.
>>>>>>
>>>>>>>
>>>>>>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>>>>>
>>>>>>> When invoked from console_endboot() this will now switch to Dom1,
>>>>>>> i.e. that domain becomes kind of "preferred", which I think is
>>>>>>> wrong. Instead I think in such a case we should direct input to
>>>>>>> Xen by default.
>>>>>> Switching serial input to the first usable domain is the major motivation behind this patch.
>>>>>> The number of times I got pinged by users with *apparent* Xen issue on true dom0less
>>>>>> just because input was directed to dom0 which was not there (not everyone seems to read the
>>>>>> boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
>>>>>> Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
>>>>>> to default serial input to Xen.
>>>>>> So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).
>>>>>
>>>>> Well, I'm not going to stand in the way, but if one of several supposedly
>>>>> equal domains is to be "preferred" in some way, then I for one would
>>>>> expect justification for doing so. If that's the route to go, then the
>>>>> patch snippet you provided looks good to me.
>>>> Well, the explanation is that we are directing input to the first existing domain
>>>> which also is the first domain created (this is what users expect at least by default).
>>>> This for now creates simplest/cleanest solution that matches the current behavior
>>>> with dom0 and solves the users inconveniences I mentioned earlier.
>>>> There is no other real preference apart from being first domain created and to help keep the order simple.
>>>
>>> My two cents. Given the feedback we are getting from users, I think it
>>> is important that the input goes to a real valid domain (not Xen, not
>>> Dom0 that doesn't exist). "Which dom0less domain?" is a valid question,
>>> and I don't know what would be the best answer. But any of those domains
>>> would be better than what we have today.
>>
>> Could boot time configuration perhaps indicate which domain to "prefer"?
>> Otherwise I'm pretty inclined to suggest to make it actually random ...
> Random is not great because in a system with e.g. 20 domUs and directing to e.g. 10th domU
> user would have to go through a lot of domains executing CTRL-AAA several times. Also, for me
> it would be difficult to reason about as such approach is definitely not something users expect.
> 
> May I ask so that we proceed with a patch I proposed to start from the first usable domain
> to match the current behavior and to help users?. In the meantime I will start working on
> a support for indicating which domain to prefer.

So long as the description states clearly that the choice is arbitrary, I
wouldn't (further) object to such a change.

> All in all, the new patch would touch console_endboot() and not switch_serial_input().

Of course.

Jan

