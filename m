Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D841C6D4451
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517412.802676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJEq-0000kS-8i; Mon, 03 Apr 2023 12:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517412.802676; Mon, 03 Apr 2023 12:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJEq-0000hc-5I; Mon, 03 Apr 2023 12:24:44 +0000
Received: by outflank-mailman (input) for mailman id 517412;
 Mon, 03 Apr 2023 12:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjJEp-0000hW-5q
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 12:24:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81ddb89d-d21a-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 14:24:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8230.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:24:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:24:39 +0000
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
X-Inumbo-ID: 81ddb89d-d21a-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFyhteW20r1iypmuiWClHRYR88XwsXiDbigY9APD1HbqI+7m1IM3m007KbvNZFprUN5UlgUJu59vamO6+c5HprTjANiKvCKv0oBBQ5iooIaRKJkTul64Wp5y7TjVBYj7her6Kd74Vr/17ryQ3zW52fXHgdQRcyQHSzpuacYg8+6u0w2aE1bouDX7DDQfR+8iHoZYHZSLDzjOecXg7SFBUYn8NVCYxLVVHBDS1L7mv21bTurQTaQLXR28bNwB1E8btqmztAu4VM75njArB4/V3SKR43nKlE8bi1hgP2sX4upmhsrMgc5v3L37+Y3QYLqBWdKH/MurXbyltFvEOvOVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p163uZDvV5ZjP7boHQvWgvCYdt+czz0NqgkwcVWTlAY=;
 b=FBGq86CwJCpX74g1kpGzX6VtTkqWbjHkvSa9d8sEDVewsmuzYyXYApYByPAdvB8QysZ7DYmspR2B45qlntTffbEY7f2liRwsoWYZk7sAWqqGi1yae7fzXEj+WX6KKcc9aBuUOYQ7vE8+P0FJmAvO7iq2i56QdD4W1BLkc1GJqoRxHQNwBK9WENPUIBMXstDPI89vXnzfZQPEUwSHE2we6hLWR1WLMBEXOn0LtMqe/PU+tGVpUvdETqqYJtg+xCcJMBH6ptkJezI6+IKqj8otF8+bJ8wHDjSIr05eb2BVrJ6+xEFBEO8AHDg0BMtODxGSdQM34vag7/NZpuzrmySR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p163uZDvV5ZjP7boHQvWgvCYdt+czz0NqgkwcVWTlAY=;
 b=pzcl+KShoODLAZSwAJ6HwjWdnzTLeP0cSKyN3msebJKvm1Us5kWNVgvcmchoaBeB6BLeJohV3V0oyBanwUdYrT33HbOeDkO5zzlIq3o8KCWw6C+IWnDNJo8on3gDCOxV3CbyQjwgZAeysV6YpFOiMDyAmSiOjsLPGuiT1yMnHvAxt2q+DRkPxzKtf1nHj/NozaSosOFcGGlp/BpDNdo52A1sER+6l+2FT13Oojt5f/xRvr6EMU3s+cCNTv1lbOJu8cPv/DnKP1qZtx/KtLi6p56E7aoqZcYiVP6xZtCvZwmITxeTH/pMsUQVacsQLNufTFVrpqNQKSWc6OBLv2us9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50420132-70e7-0cb5-6929-fda11b2cf05a@suse.com>
Date: Mon, 3 Apr 2023 14:24:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <8f2fa47d-89b7-b39c-e60f-edee1de5ca82@suse.com>
 <ZCqz0YCFUifIlthC@Air-de-Roger>
 <be49b5d2-f4a0-44f7-0f6e-56c0e63e9da0@suse.com>
 <ZCq8BQU3lqgxSp6Q@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCq8BQU3lqgxSp6Q@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d06588-79ee-46d5-9eaa-08db343e64d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YtvQJEj0l55q3gMd6RLs9NMxHJXDr4gC02q6Q9YO9L4zUg50OP2baTPJeB+Iz76M6hm1L3y7Yl94F7g0N2zKtRutJAHq8RLhuXTxmQWDbYtBSmLknqNr9Xku55jtRWU/f/oh6sfWgqlXHRuIVEZVNFdxhWCO+RYV7LGYeaqimJUVDYolL9/sLup5ju30oeCGQxjslu9VuDfT0Uo97uQOw+lrF3ao8Jg1wK6NDT34EmrPdhGzZQZcRxJmQ81tdaaR6wSETqcSZzeudc4TzQWlQSLYE8cNvTchme3b7L6+t9qoSc/p+89PJDkj+YOBga11QeOLPYdBU2yJNfm7ITsPioeRNlkTP0VALhhb3SC3bxzfi1isDEYDPzlbR1OqfZpz+F8ZDfXNeTwhQWns/d4ubSbjobIhwWhImGypkfwNNodN6x9bbjmynkO5XzGrjW3rrrDr1Hx9UnsIYPslRxOFp2jiZ0HezKqPDBYWrCGkEyzKIhC0A5ZNyKrbftqZ9kD5kW2OMs6JY9szMJ6teoW3gnOX718GJAUtxBXJeg7b+tLVxGd0blr8deDDOlYjgGUZ3UpQYb3tJsniKkytw9QY7i2Ie+unAxHDlWll8EWE2CZn96/vCVb4sp6A7xXrX+bPt4Pk8YCyq4MAGrRSB4cgyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(36756003)(6486002)(2906002)(31686004)(41300700001)(6916009)(4326008)(6506007)(6512007)(2616005)(26005)(186003)(66476007)(66556008)(66946007)(8676002)(8936002)(5660300002)(316002)(478600001)(54906003)(53546011)(83380400001)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZENytjVkZMRHMzSGdQYmFubHc0UEdtQlBwdVUvNzVXelJsdHNGRElBS2Nv?=
 =?utf-8?B?Q0kvTGsyZmd5czRQYmNoS2FCRmQrZVRuOTRtUmY4WVM1M29OR1B6bEVSbnZO?=
 =?utf-8?B?ZTdyNGJpTXF2Q05xQS8yelJtNitrOG5GRjJ3eXRMV3ozSnJHZzVPZjhoL1Zn?=
 =?utf-8?B?ZjZ1dnl3NUhwSlpyN2N1ekoxRlR0b3NNNWl1d3dNbEd5bXM2bk9rczN2OGp4?=
 =?utf-8?B?ZFBYYWpzU0ZPSlpWNzlyRmhtMGNEa1BYZC9nZVU4Vk02YWRVUXhFb1Iwc0Uz?=
 =?utf-8?B?U2tGZjdTWHp4M2VaUjlyRWNuekt6SEI1TTZEM1g2VHlEYUYyaTdDL1kyYTl6?=
 =?utf-8?B?VUFiQjBNSnBBa1RUR2pDeGVsS1haTFgwc2FBZG9acERFcEdYdDhQVEZXNDRL?=
 =?utf-8?B?M2x4bkNTcWhSTkhLcDEzLzBMVHN5V1ptMXhBTXg5SE9Nb0h2TmRGNDZtZVlJ?=
 =?utf-8?B?WCtTcEJTYzNoTzNQa0VWbFlmdVp2eHNPUXhXYjR3NWZ1N1NXYUNURUh3YnVJ?=
 =?utf-8?B?VEJUNmliZHgrTWJOYUgyREhMc3pyN3J4c3hhSnNOSFFQQ09VZnRTS2FyUjBo?=
 =?utf-8?B?b25zRWdtUURxaHFaYU5DZSt5aFhyNVFKR1E2d1Z5VEwrQ0I3UEZpald0UzVK?=
 =?utf-8?B?S200SGs1R1dlQmJTc1ppUk1jQnV5ajlDSXNtWElmazBLeVVMN0g3aEh6K24z?=
 =?utf-8?B?Z0ZHQ3RBamczMWxoVk42dC9mc3VBZ1VjSEpZTTNGb0QvR0hHMjR2YUtKd1J3?=
 =?utf-8?B?Ymh6c3Y3eUpUSzEvL0hGUS9CSGNIZGpPcmYzdXVWVFRsd1ZPTVBrcHJkL0Rm?=
 =?utf-8?B?UkhtZDg5QzdCZ000b0UvY0c3WW5NcXEzRk1jNXRjQ0luZUlwRTBTT3ZEQTNJ?=
 =?utf-8?B?UG9YK0MxWSt2aXBxa3JaZVpLdC83QzRzVFRmVFUzZXRkSXR2QjVIYmZkaFll?=
 =?utf-8?B?N3phWkpVWDk3VWZRRUlGMlErdHJmVGhEUnRoOTdoSnVxNUNjL0tWbEs5QkNa?=
 =?utf-8?B?MlVvUDYyNy9WdVF3c0dlaWxlR3JtWU9sM0JkRlMrTHdCNzU4bnBLSU9VRHVp?=
 =?utf-8?B?TnpRelBZZUhQbTJSdnRPK2JvbGNRR0lQQmhaUk9udEI0b2VYdDBRcW9mdnp2?=
 =?utf-8?B?eGZKajdqYWErNzdzOS9iTTR5M3ljTkZPa2tOVlppbXVkSlJPS2JhMEZVTUNx?=
 =?utf-8?B?STkrQTh4cUI4bXZuM2U4NWs4ZXZ6RjRwTkRuZVRKblVkcDBpV3NYUDNmOFVC?=
 =?utf-8?B?ZmE5UkdTR1B3bnFWVGdKeW5SYU5VcFRqK3V6NmQyT3RkZ2l3UytveXR0NHcy?=
 =?utf-8?B?Y1B3UnBsWFJvekFXS3BGUzNNUE1XRE1oWXQ4Zy9VY0kreC9VK3lBaEgyMkJq?=
 =?utf-8?B?dmE0cDlIMWZ6VHc2UTVJbnplQmhGbjlXYVZ2cFlpQk5DMVM3TjdLK3dNQ1c3?=
 =?utf-8?B?RGdkMnc3cDBoTjFDdWZFUkd5NDhuUXpXWjNjN09zdHc3cExreW93d3VNaUFR?=
 =?utf-8?B?UlNhamhDRk9vaXZtbklVSFhGbW1HMmVkaXhOb1d2TnlrZVFTZm9URkxMZEhN?=
 =?utf-8?B?bVNia2granFZSW0wTUMwYUFuaVZDcmhEOWluSExYK0VsaktRYUt0bDB3VVJ5?=
 =?utf-8?B?czJQVGdaWWVNZyt1TjZFSXR1ZFMxOWQ0Qk00Z1FRaE9MMGhTSHFnWE41YU5Z?=
 =?utf-8?B?MytjcTJEcGo1NjROemFvOWx2QlpzQ1hOaG9ZS3Yrb1pNYVVUUktHL21nSVpl?=
 =?utf-8?B?RU51UHhUcUJsSk95alBFd1NjMG5SRUU2QUlaYzNEYkxYdVBzeXJGbXdpcGEz?=
 =?utf-8?B?N1Z0UVdMNW1RTUxEeWcxeWVyVHZ3cm9ZODBOQ0hiYkJ3QWJ2TFA4SkRlT1c4?=
 =?utf-8?B?ODZZczVQcXpGQlJaVEU1Q3VkMnIzV1hEMmxBelpTZ2s4MkdIeG4xeDFmMkox?=
 =?utf-8?B?ZTNyeXFmT2N6TmU0aG5PZzQzQ2FQdHBVM1J0MU1zWjhKVm1NeWpGdTkrVCt6?=
 =?utf-8?B?VkpOaks1QnBvYmhyK3RKaTljcDRDRmptbXFSRkJmQ3JVMTZqaVYyNHRzT2Mw?=
 =?utf-8?B?akNvdWNDdGpIQ3QyZmpoaU1pZS9BMW5tTDA4SXVoZGFUSDR5U1pFbHlXMit3?=
 =?utf-8?Q?x+bNPShbSTQlaz1NSmQewHswa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d06588-79ee-46d5-9eaa-08db343e64d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:24:38.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tT09XN7bW4Zkhhfz6IDgwAuk34nkF+8E8nut/0KBO0kLXvyi8wSaPlm1r1dKsFP8uDIvsR1VfAbOnEvUCbJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8230

On 03.04.2023 13:44, Roger Pau Monné wrote:
> On Mon, Apr 03, 2023 at 01:26:41PM +0200, Jan Beulich wrote:
>> On 03.04.2023 13:09, Roger Pau Monné wrote:
>>> On Thu, Mar 30, 2023 at 12:40:38PM +0200, Jan Beulich wrote:
>>>> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
>>>> +{
>>>> +    unsigned int offs;
>>>> +
>>>> +    if ( !is_hardware_domain(d) ||
>>>> +         !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
>>>> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
>>>> +
>>>> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
>>>> +        return false;
>>>> +
>>>> +    for ( offs = 2; offs <= cmos_alias_mask; offs <<= 1 )
>>>> +    {
>>>> +        if ( !(offs & cmos_alias_mask) )
>>>> +            continue;
>>>> +        if ( port <= RTC_PORT(offs | 1) && port + bytes > RTC_PORT(offs) )
>>>> +            return true;
>>>> +    }
>>>
>>> Maybe I'm confused, but doesn't this loop start at RTC_PORT(2), and
>>> hence you need to check for the RTC_PORT(0,1) pair outside of the
>>> loop?
>>
>> The loop starts at offset 2, yes, but see the initial if() in the
>> function. Or at least I thought I got that right, but it looks like
>> I didn't (failed attempt to try to address a specific request of
>> yours, iirc).
> 
> Hm, doesn't that first if() cause that on all systems with an RTC only
> PORTS(0,1) are allowed?

Indeed, hence why I said "failed attempt". Looking at it now I really
don't know what I was thinking when writing it that way.

Jan

