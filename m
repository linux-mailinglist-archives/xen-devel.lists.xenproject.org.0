Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484B6AE208
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507436.780921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZY9Q-0002Wb-Jt; Tue, 07 Mar 2023 14:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507436.780921; Tue, 07 Mar 2023 14:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZY9Q-0002UG-HD; Tue, 07 Mar 2023 14:18:48 +0000
Received: by outflank-mailman (input) for mailman id 507436;
 Tue, 07 Mar 2023 14:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZY9P-0002HE-BQ
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:18:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f852eb09-bcf2-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:18:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7962.eurprd04.prod.outlook.com (2603:10a6:10:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 14:18:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 14:18:43 +0000
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
X-Inumbo-ID: f852eb09-bcf2-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrHfbkIQ8kuXswAIPOwXSo+SU8Fm/0l+boi+Oc8s1YWEjYO8+KsqyvFjkBQKNZ86bGniXzn7YltJcc5wPwT3g9H827w1YQdPt8E1GYv2xdN3Fa/soyVZxHAIiV0n3lGl+xQhW5cTRxJeGs4hAZFVBYa0vxpOVKMJTJv7pWjo6PrJwtRaGk8WSY75fGuOJ/8JyyhZBW65byc6V+BOACRsn4f3X+uDNjH9CqkFWaj7wqBFRmX4CR+yVMzvis0H0BOGZp/WhdApm/KhQHo2flRKEXg+kKt5Se2f1zWXSx4MTdjxaw6DO5dBEKhQujqflR07To1MDRvj046ZTTfqfGTGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNBXG18Uz8BkwbiBLxHtqKffUuQw5MlNCR2mFiJJPAo=;
 b=W6U6fmLS+SODtZIhXpsOTcjpS3mR/ypo8/CXSDLMEk1fndWtsUseWbw7vQ6tNfRi/P8V4A1r3SHqNJESddlywAWeelak0e+iuaBhbkLzthtl+V6DIsldkBF4nePiofaOq9u9B6uOINdPDFDU9pIaZSerGdjKF7XxD1KM8ZWf+ImZj9P33tHROQwOVS0UuEmTWlaWiGRdObZVsjg/9rZqlJZz6UTuOmW+wS50geeIdpQ+SHsziiZQ2Nj/7bK/AGhRWViJMgot0MWHChxY0BiM5IrYxJAe2tGCkn0uwNwnCcUami55KMURQ60clXQPJ/IDxE8p3AoaYs+q5+WFMGntkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNBXG18Uz8BkwbiBLxHtqKffUuQw5MlNCR2mFiJJPAo=;
 b=1e6rfRUQQxMGNk3vkZbi35NXrWrDhFFYOJI+BOPREZVZmsxP8xiu4euPjOmzDTfG8g2HEbdAkbYFGuu/V5gbZR3er191FGHwdWkasinM8F5QtqEcf5SFm6BMY1eKjjOE2DkwZ7+L/AWzkjV9V6+miXLporFGLQmwVAEHw3YWI5yQvzVijV7Qujf4JWCuGmlKAKwyV0dK/7atnOuBvm1nHWZwpLcU69CDl58noZsfIaZ/82hXe1L9qwnJMg7ZnrZIoTFSnfKWNiVF0fLrBXVHmvj2QKDPUv8+nce2i5WgTazTAHqe8P6hFr+fwdZ/ZxaCj/VvnJz4qW9Rgy3HpBRCDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
Date: Tue, 7 Mar 2023 15:18:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e4d39b-b388-49c8-47b1-08db1f16db52
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5puQENxTcpDhDVG+Z4hPeBeiekD6FIHeY7vF8J/u7Josz/RExFIUCJqOaRsrb0HuMxD4H8Dh8j3uet40Yjvxk8fk2ZZ8/ebD/122xdAtHevQzasJm1hQBLT++WhunJJ7z6vm83fybqmDkxMlMh38aeIdmcEqYGvV8Qlu4hoGIF5A6O3qAr8FwVayVpU+VVUUvU9O/TbOHAe8sfHMYpivekpCVDZwGnSDdz6PP8cwxHxQxRS8tWda9XOO5ZdylN0ZpblSogtJMBsmS7D0o35y92wRUW5WVOV6WbuB1QnY6e5BC/QralpzCRtQO/yhIKZyCSAOJUfhwXLmxBFtKn72Tp+Yrk/it962TrLek9dvAMOmr5Vqfj8/lZNa8iS/UbwAqaHFnp+VsonT6uFFpPe2IN1vkDIu7LsPd6JRja7EkbV1RQLgz7pFTRB7vTe6U+kMqReEYdC3SGuqr2JdI0LmO3yeqn7v5Wm2w3Jt6f0QSwgcDx1aUHfG52WBL45jGNgM7wCmcTjo6gDJ7oiy2fuojevfgxEIPXyJAGBZv92ZK4VASOKLHXFkNyiT+WPMkDBGBQl3BlYdfWYJtawlyjXZxieqhMAI66mDtj0+z/MVK9A0B2rQlBhaa55Wr0+AKD9VnN2rC+mdzGnUwvXIEshk/H9omxbmYe5sHSe6setu0W517BXgnDMkwtwl73zWrZmSiJhXGASNrxz24vLrWE95mzzsirdW5HPJdHXfL+FiVmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(31686004)(8676002)(36756003)(4326008)(6862004)(66946007)(41300700001)(8936002)(6506007)(5660300002)(2906002)(38100700002)(86362001)(31696002)(66556008)(66476007)(6486002)(26005)(54906003)(316002)(478600001)(6512007)(6636002)(37006003)(2616005)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WERVUm1zQU9FR2JtNEIrejk4Z1VCTTlxYjNBY2ZOaHBRTnNyaC9iMFNzNUVz?=
 =?utf-8?B?eDltSkk1MEQzU2xCMkFMZU0rZHFEM1FWMGd1RjU2ZHFucE9XMnhBSTZVSmtK?=
 =?utf-8?B?aGloTERqOXNNRit6TWtHUzZ2VEVJR0RNbDdpV0RqcFpVeGo5WEM2dnlUTTdL?=
 =?utf-8?B?ZDZmb0U4eUNWNkRFWUtZMDFQWEtlVjdRcXJGNFIwRm1mTU01NzFDRHpaOEp5?=
 =?utf-8?B?MGVVZUwzSjBlSmNxVkh4L0NBMzNaWUxkYWVSN3U2U1JhK2Z0SHVyUTJuTVpX?=
 =?utf-8?B?cU0vYmVPbzZObWtEMWZFaEJ4UytMRFM5UXJoem9xaXl3dUlNMVlFOGo0MVI2?=
 =?utf-8?B?RVhtZGZVSEpTMWlFcWpOZWRTT3k1THJPdlFaejR4QVdHdytRU2lEdDhTTnpL?=
 =?utf-8?B?dUNnaW44dFBKTnlMRm1YQzFJUm9zR010QkQzcU1xUjJORklSR2JiSnp4ampx?=
 =?utf-8?B?ZnFsOE1Ga2Z6L3JuWG9qaHo1bHRnOVhWTzRQaDJXRVRQcnJFOXNSOTVSZG1N?=
 =?utf-8?B?M0Jvdnh6eGJhckkxWTUzNVNySHFJeEs4SVJFVjBjb3h6M2g3N0pENkZlWnlT?=
 =?utf-8?B?R1ErUkFoeW5FMzZwakp6Y2h4RmNoaU5xTWszR0p4OEJ5dDIxcVBDTXZEZWNo?=
 =?utf-8?B?OUZ1UFRBQS92SWF3TW1sVm9XY3ZtR3FBSStKb2JuTkpESER2bTZjOC9iY1R4?=
 =?utf-8?B?ZHRqZEtJblFSNEZlMDF1RGZjMllFbExSbjNYYjRDbWFzenZxMzdZcHZTYzBv?=
 =?utf-8?B?Rld5aWdjdnF6UWI5SHF1SG1NZEVIWERjTFpYVHI1U1JodFlrS0FIYzVmdzRv?=
 =?utf-8?B?VFVPczVpdFZPMWlHK3BXdkVqSlBoSUlSZDFkZUNYS1hoQnZmYzc5ajFyU083?=
 =?utf-8?B?YVpVWW5ObXBNUW5QMzJrTFUwdWdHVEtScWViM1d6UzdFZjFYYVBzQ0p3eFg3?=
 =?utf-8?B?cWNLM2ozWVBEUHExdlpBY2d1NEV5Sld4dnNxMVc3M3dzTWtnVi90c21qUDNq?=
 =?utf-8?B?M1ZsUm1kUXZUUjNyT0xxdWJmY2d4Z3o2b0dyUTZ5dlRwSWVoeHZRNnlIWFk5?=
 =?utf-8?B?aE5TWlhtTjZnblFSRC83Yk9HbDNnZGRlRjBPSW9qMWR3YzhDaTFNSWNqd0g0?=
 =?utf-8?B?WWwybVhqVGROZnZ6SDlrNTRKY0x3bGxsYktwQit5Q1JPSzFkaFRGYm80VWto?=
 =?utf-8?B?bmcxSE1pd2dkS1VDZlhIREFrdzVtRGNubVZETTBCeHhuMGhXQTE5RkNGSVlS?=
 =?utf-8?B?VXY1RS9WODBBZ2JiSjQyNmljdVNlMzlRYk10b3JDdmxFcDArWnViLzg4d0k4?=
 =?utf-8?B?N1M5dFg2Vm1pUENnRXZEd2d5OUduaHRUelpvcVI3WUt4ejh1WVhjK3MxS2lP?=
 =?utf-8?B?UnhoQVJmS1NCUUtRcElyRGcvb3EyRlZzcnlLSmE0N28wdUM0WkJPZnMwaGtG?=
 =?utf-8?B?eGV0V0ZONkZleFZxSk12U1ZyUWlGd1RISSswcmZ2a3ZpSGI3cVUybTk1S2pF?=
 =?utf-8?B?a1BNeVdDUzIvQy9SR2gyNUpsdW1DOFFwcWsxdkVxUDM5dHVWaWZVa2VDcGVt?=
 =?utf-8?B?Vkk4aHRTVFFHaThDcHl3YlY3THJ6aFY0Y3k2N0oweW5sOGQyZEhuUnkwR2Fl?=
 =?utf-8?B?dFhIYlJGSkVUUjM4c1Z1UXcxUjc2NFpNOXhoUzgrWm85alEzZUkwZk0xNzc3?=
 =?utf-8?B?NkJXQ0xDWHVQbmYwRnJNeFFybmNaZW1uWFhXaGRUVUVGY0xVSnE4VitFVnZr?=
 =?utf-8?B?Q3pOUmNqTTJ0L2N3T2EwR3FLcnlOQmhBVGMyYzR5bmJTbkxnREUwNHpqRnZi?=
 =?utf-8?B?OS9nRnd5S21hd3AwWjZZNU5xaStCTWhrMHFKV1VqaURLYlhRRm51eE5tWlNU?=
 =?utf-8?B?YkJ2RUp2RWFSMHhQN3Y2VWUzOXdsVGxNaHV0ZFZveFJCSGM4UytPN0VCMnVs?=
 =?utf-8?B?SGU3YUY3TWk4NThiV0VKNzVxNkU3bUY0aVdHQkpPRGtmeDBPREZFRWRUd0g3?=
 =?utf-8?B?dXRNSEg1b1VKOFlUNlFxbWs2WkdZbWJ1QTRKbFZlNTc2NXlhcUptU05IVmow?=
 =?utf-8?B?cjJxQ2Z2OWtNY3hCZnJ2VjBTMFV5NXBuelhKcnJhY2lLdjlmTDYxeU1seStU?=
 =?utf-8?Q?bQuLljmw27iG9aGAPbxwJyOMd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e4d39b-b388-49c8-47b1-08db1f16db52
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 14:18:43.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+qDehsuCr+hVqH1cqHIpz8ddH++eKOJzXjSCW+ZvXMnskZvc8dlDJzsCoxDs5+qjyV3LWxnZ/+rrCxqzCJs6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7962

On 07.03.2023 15:04, Juergen Gross wrote:
> On 07.03.23 11:41, Jan Beulich wrote:
>> On 07.03.2023 07:32, Juergen Gross wrote:
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -15,8 +15,11 @@ config DEBUG_INFO
>>>   	bool "Compile Xen with debug info"
>>>   	default DEBUG
>>>   	---help---
>>> -	  If you say Y here the resulting Xen will include debugging info
>>> -	  resulting in a larger binary image.
>>> +	  Say Y here if you want to build Xen with debug information. This
>>> +	  information is needed e.g. for doing crash dump analysis of the
>>> +	  hypervisor via the "crash" tool.
>>> +	  Saying Y will increase the size of xen-syms and the built EFI
>>> +	  binary.
>>
>> Largely fine with me, just one question: Why do you mention xen-syms by
>> name, but then verbally describe xen.efi? And since, unlike for xen-syms,
> 
> For xen-syms I couldn't find an easily understandable wording. I'd be fine
> with just saying "xen.efi".
> 
>> this affects the installed binary actually used for booting (which may
>> be placed on a space constrained partition), it may be prudent to
>> mention INSTALL_EFI_STRIP here (as a way to reduce the binary size of
>> what ends up on the EFI partition, even if that wouldn't affect the
>> "normal" way of putting the binary on the EFI partition - people would
>> still need to take care of that in their distros).
> 
> What about adding a related Kconfig option instead?

How would a Kconfig option possibly affect this? You want debug info
in the xen.efi in its standard install location (outside of the EFI
partition); or else if you don't want it there why would you want it
in xen-syms? It is the step of populating the EFI partition from the
standard install location where some equivalent of INSTALL_EFI_STRIP
would come into play. That step is done outside of Xen's build
system and hence outside of any Kconfig control.

Jan

> I'd be fine with a textual mentioning of INSTALL_EFI_STRIP, too.
> 
>> I guess this size aspect wrt the EFI partition is actually something
>> that should also be mentioned in patch 1, because this can be an argument
>> against exposure of the option (precisely because it requires extra
>> activity to prevent the EFI partition running out of space).
> 
> This might be another reason to make it easily configurable.
> 
> 
> Juergen


