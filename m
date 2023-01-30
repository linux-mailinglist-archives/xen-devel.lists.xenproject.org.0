Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F53680F8E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 14:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487008.754490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUc6-0006SR-J6; Mon, 30 Jan 2023 13:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487008.754490; Mon, 30 Jan 2023 13:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUc6-0006Pg-FG; Mon, 30 Jan 2023 13:54:26 +0000
Received: by outflank-mailman (input) for mailman id 487008;
 Mon, 30 Jan 2023 13:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMUc4-0006Pa-8w
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 13:54:24 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9938863a-a0a5-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 14:54:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 13:54:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:54:20 +0000
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
X-Inumbo-ID: 9938863a-a0a5-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWQlktb9H1v90w7ST5vBLzYz2JMrRSxpXIHQKah/B5xzTGT70F+x4q8l11zHrhCCN5cWxsjdWM0le4hV6lSc7nbj5WkPeBg1wvM5WoVnANnsHd7DDOjmf1FfL7S9L5/bshwBEBORlrDv2RBT8PbTtJiYbROmLDsO2tZ3TRFkZWv42u5QNMqdcOSrHM3DqNzDdLVaQp6OEDJx33ncHZLvEFZtgQUp10VSyih5vSM99uSx1imheKp5KBFayRt2ixIMrjKl8f9N1xGnPwqCviGyDo4U9aUJp4aXTOXi4zIa3/BlfQvZt6GKUPV+FxxRU6irIFphxMg3yVzG3fyf52H7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqxiTy4sto+kgAfSlVrCbTFXexPFYV6JU8DMt4QBwp0=;
 b=OoUu16/QkqNaaZYIFx3cdV35ZS4Ba9hG9QUbK54a/TUCCLtnQfNpQYODq/wyXbOIOT22A3RAr/Moepsq8DRtPQcQqJQVuIzjvnuKCwkMGUMJs6XVzFpYZ7Cl9tu0sv8aOgvmRYgGZxy0CC1eLVi1PiecIHTD5vE05CEEXhiK5Xsqsiw2KjjpwluwNmhz/tSpZkNcTJqjpi013fgsxcY+ZgkLq4ngGwdkPFplC0v+7hF73zwrEvwidQhHmEITb7Dhwet/rb7o1YLw/x9nF1BwfiKqrBew45lu5hmZm9fplA3cOBXXijKV5/OI73wkhuXIOYMyGhnxSAxQPioHWkCf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqxiTy4sto+kgAfSlVrCbTFXexPFYV6JU8DMt4QBwp0=;
 b=RSATZmgmpTcAZo32zi37e2s5lSl6zyIC+CEkXsYHRbB+q8D8b+kbH7q1TYghNaHu/m9u10VTlIcJrAl1eD+YinxAeAXnODBJYVhUF3pvEp2wt5v3uOpe+TrU7Wx+7Bq0JUpdlmaibDafpfDoha+KNPEQXhMnDzHxubqfB8sGCFDOu7o+WoTFGF/uqjLe0gGdCzRe9w3obVXsc17OMq4Rhs9feto9PCl/gjuuB7R3tZalTrkMdHhgo2hYmi7sP+KplAgQZPKynZVE0wszdbFldv0SK+/UEPiN057j9+ZalNh2yYuGbiqje/7AVB1o2wPBRV/umaZ40F3YJ4konLL/6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d03a5bc-f02b-fdb0-e9b1-d6e9055cadf4@suse.com>
Date: Mon, 30 Jan 2023 14:54:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Proposal for consistent Kconfig usage by the hypervisor build
 system
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d77c1a7a-9d15-491d-38fa-99739f20bebd@suse.com>
 <5a53d16a-8842-457b-612a-a3623a3a98ed@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a53d16a-8842-457b-612a-a3623a3a98ed@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2230bd-cca1-4477-8aa1-08db02c97c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VLHy98JMdzjGNgMuIUtZuR+Xpr+JKE+f5EFuU4OpRJQHVBvEkMpAdFOv5PqcPM+5gDDF0vFkiGFHaOUun6rqZPFnTZrr374qL0rdf0bSYqkAVR37OGAp3XhCBCxigKGe1y6oag15qHp4KwmVjT/s0kZ0orz3eGloBi+3359i0MfFdtAugUGiVxyS4qVUOnne87ylFTIsevYBxPEIXcOFzHSrQUd0oBtWJeFGKHXyx4/gJ/fgMxEuQeKd099vY5PDxuhNK03zJpKbrCvOLasiB9O/C3l96bNVtmzr+gDguTOUtl0FRTni36bc5PJRf8F5bzQfFot/AR/QTQj8rcQt9dvDm6XwyuF4W3mWusiT3fSWyePPb9V4vp5XNW45NADq1HTbAWH23qiqbMxhquNhd2yBsbubyNQkr4QKxvMxDKyekwkW2w8ICntT1BYL6o2TX4uDEXMLPPqkCsFyEWX+jbzNSpkjrf7W6d2aogvSkvtpf6tWfofR1RdxOz5mGNZxp0xTRZiOhr1yWnFesxFP6OOZTMFbAEdu739Zk2FCU2zKUCNh2ODMkklHG4OrP1JIJDFM1qaLj+k2UOnGdFUVdTlwmhqPW64BNF8mvrEGIyYhK3G9PxP70eiNUUigwj3a1hnMiLVrIdUKN1wUlfL5Avc81Az9JC8j3qQj7Fh5OK7T4ENPlCyCthsTMtlFvXpSq3zX8rK2moYbPX/kS/v0AVIRWQew+9mCH8/hkc1PivM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199018)(31686004)(2906002)(5660300002)(41300700001)(86362001)(8936002)(66946007)(6506007)(2616005)(53546011)(4326008)(54906003)(36756003)(66476007)(66556008)(478600001)(6512007)(186003)(6486002)(26005)(6916009)(83380400001)(38100700002)(31696002)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVJCV01VUTNrcUg2SEo5QnUrU29TOFZhYm1xdnF0bkRpSkU3cmxBcEFTVVdq?=
 =?utf-8?B?VkRzZC90enk5ZG1LVEo5dDBDTWlRdXJKRGtXTngvWk1Zb2wxeWJlVUQvV2R0?=
 =?utf-8?B?ajVOcFExbGRiUjBXa2VYVjdVcnVQelhWeGg4SUNDSDBWclpkYVI5K3pRNGNR?=
 =?utf-8?B?disyeit4YzcwU1R2c3VIS1U2SGhPV2RKWXpCaXVKZnBMaWRmVGFzUkdBUk53?=
 =?utf-8?B?S3F4RzVtZWNlZGJkVGwyVnhHak0xTDNCYlcyL2ExcGJ5SU5jUk1OcjJiRm92?=
 =?utf-8?B?a3crMlBOTGYvL2RoOTd3eERzWlVFZ2JxVndWcHNyRG02ZTJxb1N1bHNWQU41?=
 =?utf-8?B?WEo5dzc4anNMUURGMnovblY5U0NETERiVGdwcUtYUGh5SWJNVDkzYmhPa1lt?=
 =?utf-8?B?N09xS2gwd2VweURSMTZsd21tNVUzUnJBMXc2R0pTaEVQbGdscXhzZitSL3JZ?=
 =?utf-8?B?OXVSWUlMbDBhQkhVeFlRM2Q2YjQyMjVjYTM5eE1ZbW52Z2RaWS9HSEpONHdK?=
 =?utf-8?B?UFVXWFVyejR6N1RqelZNcWZtNlRVT1hidDl3Z3NKZzVXRnBOSHhVN0oxNFkz?=
 =?utf-8?B?YTY4YlM1bmhyQ1c1Q2VBUFpBd1JNMUl3dThDNTA5aDdlRnEwcmNLRzdkTnFX?=
 =?utf-8?B?Qmo1d0N5STJDdFNGdXVrWVJFWjBUQlNoeXAzUWRZSmkzRFF4czFTSWxOYnJw?=
 =?utf-8?B?d1prbHFQSjkxc2RBNkNYVE1tK3NzOThYVlc5bmVhbmsxbVF4Y1RnY1VzY0w4?=
 =?utf-8?B?aUdDRm0xZ0h6QjdDcEVFV0JzeHNZdVA4bk5GeFFLdXlkdGF4MG1QcnpKMHJk?=
 =?utf-8?B?OWFqeU9CZDNFOEdiZEVScFVBZVFQREU1c3RGMjdZRnZkam1PRzJxQTk1ZXh2?=
 =?utf-8?B?REJFUGw1R2x5OThrRjhDWlhYbGxPMmxaS3FjRVEvYTJqTTlPVlU3eExPdGlm?=
 =?utf-8?B?bDNjVVA5d0QvRWdpdzFkZzRNWE1ITENYeFdVNVV2RWR5YWVFZkZMTmZBcE1p?=
 =?utf-8?B?MVpEdWtIUU9RbWZybDJuUmJBczV5YlBHdUlXN1RUZGlUWFUxdlA5UlViL3Rv?=
 =?utf-8?B?S1IzSkxDenpPMlpnTTFTcjdEWUNLZHc5MkxsemVtV1FpaFRoRmpUdlIzN3U3?=
 =?utf-8?B?T0kyenZTZWw1bmZwcDZ3OUZPbnI2eFU5b1NZZUhTWVJHQzUwUjdTRnh3K3I3?=
 =?utf-8?B?eVE0bm1jQlhNYS9iaTlhaFgwakZqNncwMUpGaUlOSVAyc3h0N2hiV3VBNEhj?=
 =?utf-8?B?ek51ZDZ1NVZtZTl3ZUpENFVnOTdrVnhnNlVHcWRIYmhSOFQvVlBhUlhTdWli?=
 =?utf-8?B?VU02YzBNbWVwdUdiMHdEZzJYMm9FaDd3MnI0dzR5cElLSGVnei9heVYwT2Fh?=
 =?utf-8?B?S2VYWUZ3b1FEd0hZYlFnOGh4MFQ1SWlRZnFiQU5ibnNlenJvMEhqcEFkM3R3?=
 =?utf-8?B?MjhLNHhoTTlzektMazg4NysyZWJRbEgzWENDTXRKa3NoRnJaVTdSQkQ5Nnpl?=
 =?utf-8?B?RWVLSTVGeUcwMTIvSHV4dHVOZzdLcitSTVgxV2t3Mnh6end1OG01SDk3UUIw?=
 =?utf-8?B?VU9UVndROThPbEYvWmYrTEFPTGdia1I3T2pSeDg3L25FQzdjSTVsMzF2MVhv?=
 =?utf-8?B?Q1lpbHNPVEhxYzEzc1NXeG1tUnM1ektVcHdxaHFJa3kweTZIRndPRERySDhu?=
 =?utf-8?B?R1A3R2RFLzNuRnNLdENVcUJpUmJoUERmbnRrOHE3ZXJQaDNYcm55d1dqN3dV?=
 =?utf-8?B?eXBrNWlLMmZNQlBHNSs4RkhYQVp2eU1mWW5ob1ZWNTU3QnhtaXpjWGU5U2JN?=
 =?utf-8?B?MmZ3enRGaWRIZTl3MHE1M2t2eUl3anhiWXM1RVNXWmMremlObFdwMGM4ZWJI?=
 =?utf-8?B?cHRkNVNtYnExOG81UTBONytQak9Ec1RRQUQ5UytWU1hDcTJlTHpkQ3dJb3pV?=
 =?utf-8?B?S2ROUmtZbG9nYTZOVkV1RXJDNzFLQWQzNzFTMkkzZXF2d0ZSRUVJa0JpMXA2?=
 =?utf-8?B?QWlUYldKaCs0NEFLR2xvZ1lsWFZ0NXc2dmtpdzFST25yOHJhUVppTERlTE91?=
 =?utf-8?B?Vk9xZE02bDZlTHVpdnU3WDNNeHlpell2N1JyWk1BdjRxN0F1YlpWbE9hTkF0?=
 =?utf-8?Q?AqmX59SSNLGTRUJatM8C/mz5d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2230bd-cca1-4477-8aa1-08db02c97c88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:54:20.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVWmEyt5HXc5A+LGMTjQaNEchnyyFl3zKn61cl06pQ5gnR5jZscp2fJNJB09w0aC7c/nD45wVckYXuycV8y/0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636

On 30.01.2023 13:27, Julien Grall wrote:
> On 12/01/2023 16:52, Jan Beulich wrote:
>> It was additionally suggested that, for a better user experience, unmet
>> dependencies which are known to result in build failures (which at times may be
>> hard to associate back with the original cause) would be re-checked by Makefile
>> based logic, leading to an early build failure with a comprehensible error
>> message.  Personally I'd prefer this to be just warnings (first and foremost to
>> avoid failing the build just because of a broken or stale check), but I can see
>> that they might be overlooked when there's a lot of other output. 
> 
> If we wanted the Makefile to check the available features, then I would 
> prefer an early error rather than warning. That said...
> 
>> In any event
>> we may want to try to figure an approach which would make sufficiently sure that
>> Makefile and Kconfig checks don't go out of sync.
> 
> ... this is indeed a concern. How incomprehensible would the error be if 
> we don't check it in the Makefile?

That'll depend on the particular feature / functionality, and might range from
very obvious and easy to very well obfuscated.

Jan

