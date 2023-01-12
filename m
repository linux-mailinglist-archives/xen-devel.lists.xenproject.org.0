Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C5666E4D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475914.737817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtwM-0007vc-Sv; Thu, 12 Jan 2023 09:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475914.737817; Thu, 12 Jan 2023 09:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtwM-0007sv-Pp; Thu, 12 Jan 2023 09:32:06 +0000
Received: by outflank-mailman (input) for mailman id 475914;
 Thu, 12 Jan 2023 09:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFtwK-0007sp-N2
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:32:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2073.outbound.protection.outlook.com [40.107.241.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8d2a825-925b-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 10:32:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:32:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 09:32:00 +0000
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
X-Inumbo-ID: f8d2a825-925b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Osx8vA9Bp1r+tE6tz+0TdmGvg5XsdRLiLM9wbstZX6/CGJkv10ocZPySuEks4YnaxEpbTx06gOAK4zJZU5dDRNeWbv/oPb+5pXNsM/krSnsDwQNYc8SoWK6PuFwTvQRFDhBybTKMGns4zgEC/cF/mGEKMrlzHX54wewSvgQUHIrxhf4v5UmHtU0ZQ70gvL2rI2fi7axesvCvnDnjlSVGARUh4hgPMrEwuBILVXarO4/4BHvx1t6iNMpYcXv2icqAwhidALw0VEPxi9C1V+wljFmF/+mPC1nRt21kzis3nyrN7RE7VKLKwNOqJ+FcRsBfJ/ih+IJ97pP+s8SjmFZ0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9pvGAc+QyvPB3mISkj/GXnby0SbnQtT1mzcmSy/Roo=;
 b=U5eCemof/9B3Df1+yB+bkhRbtam2OXSweaSmtraTj3suPmtkH/D9+eEgvBWXqxPpl64piVvaZiPgeEkMBXCgVQ4P91MPZnBRkuknsfG4PbvjbHfNj5bER78+BuIgNaGdCHHJGhSRp1kbu3Pff6dg2bpU+lWDZRZei7h+YF/7FekpSUxirlOjrYTj1P7/uGLV/0DUrjQjViL+NqhIOmO1hssgfxioR5mCAhw3bND7Mc5NIx7Ob+KuPOO9VABsw9YSsfe426C75rzYMSmS3ve8etdmZK3mM/7oAgpoF0606StzQvFVWliWXXkah0iUGU3VDMvnrtZhqykYS4TBN2S2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9pvGAc+QyvPB3mISkj/GXnby0SbnQtT1mzcmSy/Roo=;
 b=xtIWqTdFGU3XPw+lsFwpgzqmGEu9rCFFT5YA60NeNYzLKF94ayQ2TLYLiId99sz4jWciaXfyxxXnLr4wPAJjDjfkHB2+5o9jLH7wMH5q0ecIH32/H2An2DJjV3v3YajV0Zniu8w/ggji2uV7i2oK6KKdVlmvEGpHBAuBBWWzzRfdZbR6qmVdbfAjCWxG1GQW7s379fvMh9hlkNsVM6F/zHe437BrWPHwmjKy5/minAxmGekojzvAaw3Tsq9yceqNKdL+eER/ZXYc3FemmKGa0bRz1krDADp9qe0P7jPQqNfWLiN8c5sMxrmsqNKORlTvFOZImzEa3XKmlW+IRzmIWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50fd3ca1-c1ca-a21e-8211-ed1ce3353555@suse.com>
Date: Thu, 12 Jan 2023 10:31:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/9] x86/shadow: reduce effort of hash calculation
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <4785b34b-2672-e3a8-8096-df1365b6b7b8@suse.com>
 <28488645-1cf7-cb9b-ca03-f060f7947156@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28488645-1cf7-cb9b-ca03-f060f7947156@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9a9789-1d0f-4309-3f66-08daf47fdafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O/wwbJFK3v9k1U7JCriZLHB0BZxvkbTZmJymKB7nKfJ3EMTZXGyjPAZbzGgrA4ePmkDWI2CRlmNnwoClKoAa/7ps3GXQXfiEkj3moF5zRpy7oicGV+ctE18h3XE2gZgz5M4A8p5DBeLyBV3uLps3qXJV5tu9qNRDb9BmykBLwWeYTyIWJGlgkY/LtBbV5QLuQt0Uq+xQDerT0NjvCnYluS93/OyDRtTAHsdT9iE4cRtzrAVDnjcIKuN/b0+M5iqy0O+wBwQKGv8hHBZgcactFT4IiSpsSRg/LixYv3xgvvc9LARetdpkrZpntzTyKHleQMqOk0HXxNVLomD38ux0q/pZqiai0q42/Tfg8o6/RoZAQRdE7lMlPdEfAN84Sa5MvNIW4KH4iK+CR90d5VM+zpx1ZiqHGkUr0opt2JmPLg1tv3q75iBtSyq4PCipU++U4g6PpClk8SZ9PzJ6ZNklhqBzeus9S+1eTG2TnL4VduHu01h49FNCz3GzStYS7iTlcfQ/JZR4e87oVX61TF4yCMnbuKxTeYBtSV7Ki551MjUqiAbbSkIk7bzaAbGCyDPahzKfbXwpU6fEIoqu/oRQ75XjzgFNn0KCd5xuUQIDZGtvve4Kv8QSSOEzJIM29Bfgc1O/+/gi5h1TV3acUMn5lUsx4FVMJxRmrBkHHwJfF9FzuLYkMnMwoFR+kMvPq8pIoqC6QL63nP/rt0busSl69qUEkdmGHAOlHKCzDwCvuTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(36756003)(2906002)(5660300002)(8936002)(41300700001)(31696002)(66556008)(86362001)(66946007)(54906003)(38100700002)(31686004)(6506007)(8676002)(53546011)(6486002)(186003)(316002)(478600001)(26005)(4326008)(6512007)(2616005)(66476007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnhhQk0yeC9CZDdVOEdhSzBrUUNwSTFuUG5YS3JsUE5BalFLcmdGMjFsMUZv?=
 =?utf-8?B?V0pWZ0RBNWpmbTBzNjhJVlAyUmxmV0Jwc1JKRGJydGQ1RTZGUDR5L2VySjVk?=
 =?utf-8?B?L1FtalNSclYwZEovUEhZcHhJRkw5NHNET21yVVFJWHJncTUyOTVYaHRsU2lr?=
 =?utf-8?B?Z0huTDlSVVJQNDg3cjl6dkUybXgrdXFjQTVKK3FtOWFjbmR6bUZGR1RWT1Rh?=
 =?utf-8?B?QWxzWFdFSmVrZ0tobHdieVVWQWlUZFgzNHk4dWFrUnBQUnc1NndTYWpoVXN3?=
 =?utf-8?B?Y3dmNStKY1VOSWNvcEdFNGR4Vm04OERBLzdtaUpqZ2RRU2poTzJKb2VIN0Qr?=
 =?utf-8?B?ZGRYRmxNNjRhWG1vRnlqZldZVURhWTBKMzdQKzJIWHd5OXVoRGRHTGpZMEtG?=
 =?utf-8?B?VU00c3BFMmh1UFdvYW5RcU9NS3UraVVlek1HYkE5cGt4OW9Nbm1VckxpZkI1?=
 =?utf-8?B?Sm82K2ZoZmQxMzRDMTgvbGJoMnZVT2FDV3pjU1RWd1Z3Sjhabm5lNTM3dlcx?=
 =?utf-8?B?VDVwNjlPemhObXg2ZVljNlRRU0tUeEVOeERGTkJSdHlLUWwraVVvRWQ4QWxo?=
 =?utf-8?B?MFBaY2tEMmg2YzMyS3VpYTA0S01DRzdzcTRibkFJbkQrVWh0Z3hHTHlGSnRI?=
 =?utf-8?B?bXFKQXNheHRjZWd3amd3RUU5NUxlNFh0cjNRMGJDSVR5cXJDUEJYaGVpWHEv?=
 =?utf-8?B?d2xZbE1VTVdnZ2Q3Z1pFMFJ3cWFIaFk2YUF1akdYU3JhM0VRaE1Mc1ltaU5J?=
 =?utf-8?B?UkJQazZEN2RNcWxQSjdkcHlCUGFBc2JCSDlJN1lwY0k1YmZkVU1Uc21xd25T?=
 =?utf-8?B?a1Vzdzk3b1FHQ1dCSzhId052M0g0cGJvUTlPck1DV2xqdVcreGRVdTdrK2ZG?=
 =?utf-8?B?SHp2eEpkVVNMS3hpWVlpSEJGWGxtZmRlSzM2OHJLeGljVVVOWi9FVkFlZDlD?=
 =?utf-8?B?SDF3RDdPZ2hueGNFZDJpSVRiQXg5R2R4VTVTMkZLeWg1R3V5QUpHZldLamh0?=
 =?utf-8?B?ZjBTZHdaUTJXNFlHbDFNMFNLY1FuU1RjTlRsVHVXUXk0K3AreTVsazdIMkU4?=
 =?utf-8?B?aXQ0N2dscXhKRFUrVXBaclJ2dnIyMDNLd1VNaGE2YWNBOW13aTV4aG5RakxO?=
 =?utf-8?B?ZjdUbUgyRmd5VUd2c1lNN3g2cTFibkIxbDZXWWhwSWs1SFBCVFhiMFc5c0dk?=
 =?utf-8?B?TmpKUC9PejRqS091aldvbmROT0RTN1BaSUtocTFoalBnemVLYlAwK1NibmtI?=
 =?utf-8?B?Sk1UUGRlYUc0ZW55L3lKdGh2bWs0ZkE5WVIxUUFVYkJtR2NYSVlkbXJka1Qr?=
 =?utf-8?B?MzZaUG5ubnRSTXJKVEpyNUtGR0JHNjZ5T3hjYVROZ0ZPOTNVOHVNR3ZwZ0U4?=
 =?utf-8?B?NVFZV2ZnY3hIY2NJZmcyMGhSTzFXTnI3NGdIelhNWk9VZ2UwWnhjaVZrbFZu?=
 =?utf-8?B?WWdOSHFpWHp3RmNUU2toRFY5YnBsdWVoTC9ZY3gvZEExRUxUdzhWVkc0UUor?=
 =?utf-8?B?TS9hRlJtVnpJLzZveEI5bUcyVW5LSXBxM2VlRnJqTDJjdVVRTndnT05idUNa?=
 =?utf-8?B?R0xiQmkxMUx0dW5GRGVCTlVDazEzcyt0OExEekNqbitPb0QrTUQ0M2laOGc2?=
 =?utf-8?B?U3BtT3FHUytHWkphN1daNmtMMFBQSWZ1TEc4ZjVhZFI5OWVnalZwQS9HZWV6?=
 =?utf-8?B?Zjk4SG56YXZGQW9CRFVjd3pNSnl6bHNhelJEd0YyNjVPMzc2RllTbjFLUXJL?=
 =?utf-8?B?d0xIZkEyTkozYjFQSUJpS3RUYW8yVEx5M1RTRURZTTJoV1VOTnlYRnc1SHFE?=
 =?utf-8?B?NEczc0t0aDFUcWNrVVJqaEZNVCttM1YyZzhXYkdBLzB4Y0lrN3lRdy80ZS9W?=
 =?utf-8?B?ZUozN2dvSWNlR1ZMcWNuK0piMXNpNVRqK0ErekVOTm44UzVuc2REbXhQLzNa?=
 =?utf-8?B?UHlTTkFDL25tWUZrMUQ3WkkxNTU4b2tOelhJMUltT1Q4cGtocC9la1FwNUdH?=
 =?utf-8?B?VjFxM1Rjd1JJZlgzYUJiRFBrRDExSHpTYTFmUldnWHVWcGdxQlVRVzZFajBD?=
 =?utf-8?B?d3pxQjZKaDRyRGkwN2dJWUVycWEyY3JBWElJVDFyNjdqOEVnR2wzNUVkVEVl?=
 =?utf-8?Q?8HYlddyd3xC7vjvmmxCEajNIu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9a9789-1d0f-4309-3f66-08daf47fdafe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:32:00.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpVy93hjgUXwJFNGQ+vGTHM1zU6pPlOzvZXLWjnrioqm3o8RUSpZ0iAj5paKlmMJom24CzP5NPuWK4/nV+Tf1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

On 12.01.2023 01:02, Andrew Cooper wrote:
> On 11/01/2023 1:56 pm, Jan Beulich wrote:
>> The "n" input is a GFN/MFN value and hence bounded by the physical
>> address bits in use on a system. The hash quality won't improve by also
>> including the upper always-zero bits in the calculation. To keep things
>> as compile-time-constant as they were before, use PADDR_BITS (not
>> paddr_bits) for loop bounding. This reduces loop iterations from 8 to 5.
>>
>> While there also drop the unnecessary conversion to an array of unsigned
>> char, moving the value off the stack altogether (at least with
>> optimization enabled).
> 
> I'm not sure this final bit in brackets is relevant.  It wouldn't be on
> the stack without optimisations either, because ABI-wise, it will be in
> %rsi.

Without optimization whether an inline function is actually inlined is
unclear. When it is, what register (or stack slot) an argument is in is
simply unknown. When it is made an out-of-line function, a compiler may
very well spill register arguments to the stack first thing, just to
make all arguments (whatsoever, i.e. not just in this function) be
consistently in memory.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

