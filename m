Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EBD719F35
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542522.846472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4ixd-0001yI-3S; Thu, 01 Jun 2023 14:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542522.846472; Thu, 01 Jun 2023 14:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4ixd-0001vh-0e; Thu, 01 Jun 2023 14:07:29 +0000
Received: by outflank-mailman (input) for mailman id 542522;
 Thu, 01 Jun 2023 14:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4ixc-0001vZ-Ce
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:07:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d80785-0085-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:07:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 14:06:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 14:06:54 +0000
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
X-Inumbo-ID: a1d80785-0085-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPyib4fYgA8fSBaimWVBuU9a8MTxAtDdqHTpmIElQiFL2OWJF93AJsRumpU76qt9lchu28J40XvHpYuNo2xMX5CJ48CuTN1OHVvh4MC+3ZjJUHzgdGglqf8qyL9WhhYWU5YePAVvvBn7oL6ofGP0opoko3HafQekyzbYNRn0gzp6Ef30+fIC4vbplpJAvY7OobC8kEW9v9DjL8QeNoIhTBaapuemwIGgvOXSSoV/gxe0Dhrt7Rdm+Ak+b1u+xKurIqgNJYU+DmeQh9KmKBG0VUi9wGOrCpCIf8+GQF203Ctv1QbHlVVYhrqBUeNyhWBPgJ+gCviLpBlwEyt8CRAlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cag0FQovFb8An+lX5p2ZebBddZmR0g8ibj2elL7Tss8=;
 b=jU3hkya6qVVY8aKfykcWlhlXo/1fOGZVluRi8tkBj/epVkxixPSWbfWD/wqEW2pH7Aq5nexXPdQgoeR0utpWnuZ6oQtMwsY4RAJcL7kfP03tV1l0wtAq5MHZjN7iFTNmaNxe645CGhcHE4r4Ge2lprX5+3ttF2xzlXrvbTjxZFzqFTxxMwAp8DkAlWQYjNJXtuM4GsfP4TcCcAWIf80z5V9/FwzdCacbPGSdt9f3AK06OgalVyGEgKK91D2TuXQDdh5khle9cNnTK0mFG9FD4xjnDOSL0t4gm+BP+3enlzkZqjfA8G3snWOry/rg/JCPCn11D8o/MtGqPl80SHfvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cag0FQovFb8An+lX5p2ZebBddZmR0g8ibj2elL7Tss8=;
 b=DTikRPm5XSOrXrV0RV98YBAl1uzGrVFzmgjgauwe8EgBz8VVh06qzSWyARyB9vD6TcAht6CZHlS1JJWOh+EWc3GwSspNJ75u8oLMdMnC38rF6XkG6Hxx7g9ef2H3/vrhjS3sGJXz31MlFatQJl8g7FcNWM5sF9LBr66FlCj1EeYh7ZTm226aAW2K5vaJYP3ev1AAhFaE+2GMaFHfHqfmBXUm5NHT8S2BtXzFp+bktIzPQalMkCLfMDB1ENT+qGjUSHwXq5umy9TKllp+GtThw7EzSEdW19fpt9b9wd+BjpVvqVuZKylCETCUM+QXfZMCNC1Jj9VqnlcH+tUy04SA/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc87aac7-87aa-2efa-662e-f8d3628ddaab@suse.com>
Date: Thu, 1 Jun 2023 16:06:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] x86/vPIT: re-order functions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <b6cbf871-53a6-15ee-99d5-0ad2ab9c8b80@suse.com>
 <ZHhiLgI0oL7jvKNc@Air-de-Roger>
 <cf17abea-0ca2-5794-aa29-3d9c91355d4f@suse.com>
 <ZHiGCblQD42qfoY8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHiGCblQD42qfoY8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 808d2d10-6e3c-442c-e649-08db62a9745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q3xudIi0J9izKpk/MXporLBYNVkB2swmNnm0OkD3MLvuhn2SXXleYPnnv5q6cwFC5Ia5tcGSNrT8tvvIB199yYPX/K5sqIqqTsLdz5QY471nwHr8bZXKXsOWwS6tzF++HyfCtRnzSh33zmMpo8Rv/UNdAVCU2yG7q/ESFPN/HZDBqxcACmOET3yD/9eODMKqR7TRd41zqa0/8Ej65Xhg30uPy0J3uqHhw9jCd91UJ4GKZiGGy7dwhFXpb+tLd1v8ie8+j7YsNk23rv65yP2nGe0jxGllchrRIPVlzoBOceIvQWI8cVnw6dOmh3u37hzS9ooilyh5TMxMKN+BFKkPomH9qD25gtRiye91ZyQhSXaTr4JFbEr913Z84k+ayfEbY6Y0DEiqhlgeVx+wjHQMv9IJGfcOtKKTpjmqBf6GJHmsbkatOy0FabG3AD8lN6yGbWkJWVidyOJTtm0jyu5PHnKy4TyZwTtohg3xTPhbIUI4e8E4Mkm8gFRYAAbTpk0vJ5HVZOPioW+JJUcEGZ0ADhSbYyWGMZeExMgSCNRqkUFvwG+VqguX4/V46C/HGuUeIpmPOWaV8hg2jc4ccMmvJShzHQBFqvl11PC4x9gEl6jWik984f51GjqL0eYIwCW76txrgzTtlNPXlN1ElGxySMaxR29dfTUTcEA5VKcoCs7adGjAVpBbY3FiMp25hDyz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(2906002)(6506007)(2616005)(54906003)(186003)(6486002)(86362001)(36756003)(31696002)(6512007)(26005)(53546011)(478600001)(4326008)(6916009)(5660300002)(8676002)(8936002)(66476007)(83380400001)(316002)(66946007)(41300700001)(66556008)(31686004)(38100700002)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFmUW9RODlVTmhud0NtS3lGYzhjaDdLS2tTZmxjU0NTNWNuRTFzU2FBeGND?=
 =?utf-8?B?clNrMTdJcFRMU09jaEhvMXZyWnlXWkQwaWV3V2VCVUYzMlREbE9keGVKWmEy?=
 =?utf-8?B?ejlWT2ZGTE1kR1RRQmZjQ3pmdU5kU3Q0TEJ5UVhoMDV2WHRsUWtxb2NhUHFW?=
 =?utf-8?B?a0tTS0d6UGZoSzRWT2ZXSFd2NWtqcGhOTU9NSVBHUmh6TEpLV0xTZm45VExp?=
 =?utf-8?B?N2Z1ZHBEODFFU1hJSzNZeWY1T3REVXFiY0UyYTVXbzZvRmhacHR2cjZoWHRT?=
 =?utf-8?B?Z1B0eHFmL0JyY0JSaDNSVFFhY04rTldUYXFtUFBkU3IyUHlMK3VoTjJ4d3NG?=
 =?utf-8?B?WEFSb2YrMDdRTWwwZ0VFTjNCZHBtTDRPZkg5M1JSQlE2SnBrZldhTWVSQi92?=
 =?utf-8?B?YTJwdHQweTI3VXUxQldFYVlDRVBKcCs4MWUxeHI3Tjd3TVV6VDg0emk1ZDA2?=
 =?utf-8?B?czZCQVBzbEE2MUlsemcxRkliUDRyV0hJdkJ5K2l4VGNVdjZKZWN0V2I4bnhs?=
 =?utf-8?B?azUrMjhmVmUwVWw4NmtGY05hYm1JMlo3ZURhaW41SnQ4SzRuc3R5eUtlZERB?=
 =?utf-8?B?WVgvL0xlRWdqYVBabUVCSTVrdGZWbmVJWXFxY0V3SURnckZyd0hRSEFKazdO?=
 =?utf-8?B?MjU2WUUxb1FpNVJHajR1KzRRKzBJUUtFakhKOHB6OUxlOVVBS3lVUUoxc3V1?=
 =?utf-8?B?S1lLS2plZmpoMmpqK0tkNmlhVWZULzIxRDNCRmRkdDhUbkRCSXY1SlBScUtX?=
 =?utf-8?B?eWZtdmNEejgzT2pYVzE4YmNpdDVhVFY5OFNSaXhSWTZYZ0sxN2luakMwMlJw?=
 =?utf-8?B?cTdLUll0bjl1aFJoQmhLZWdYc2h0djErSHBhWEVMc2tyN1ovTnlKMG8xTmZi?=
 =?utf-8?B?a3hsQWZUUDdMQlllUHUvamRyUm1jd3ZNeG13UHcvUnd3NnUrY3JJTTFzVW4z?=
 =?utf-8?B?TWk2a0MrOFpSK2M1c1hMSlROckdJZWh3SWVEWFdFR3RHT0RXeWQ0SXpWck5t?=
 =?utf-8?B?cTQrZFJEVXVsYU1GQUhmamEyOWErTXNBd3pRSDVHcDVrRlMrL2k5QysrQW5D?=
 =?utf-8?B?VDlwemJwb1NKdkJ1b3pWa00yaXhuRDk2QkthL0tWNUFYNEo1bi84NWR5WG1L?=
 =?utf-8?B?b2FkVXFLQ2d6Rm9aOUpJNjM0SEVYUityYkQ4aFNvQnk3R0UzMkdudDJ6VVBr?=
 =?utf-8?B?ekhDU2xEZDJ1UmF6TEhiTXpTaDNCVHZxakx5elAvclhmUTBwQWlJMG02aDBL?=
 =?utf-8?B?dG5LNXdyTlR4enRIWGxUZUNXRDBFdVJMSk1pN2pvZmttbVdDTGcvKzhaeEVC?=
 =?utf-8?B?UWgyK2Urbmt5MTBJSGdBVWhML3ZKY0g1cHNHcDFKUDJ6Q0M0Y1RIdS9xaE5E?=
 =?utf-8?B?amhSQ2RHRytMR3FMY2V4Z05yUzZpVUpaYkVpalpuOExreWFnWHhBMUZWOTlR?=
 =?utf-8?B?eWFWSkFzZFFaRVdSNDYrbkxQY01LbzNIQlNtZWhTaE1yVEFDSkxOU3FRMTFE?=
 =?utf-8?B?WS9OcXRXWDFCZnowL2hXQm4rZVdCSTlYQnBGRFlGZGlVcGVudVRiOGtLR0c1?=
 =?utf-8?B?eGE2WTdDRGh4NGVOd1NxODY5OHpPNDl3MDZnR25Eb0JZanlxS1RLN3lVL2tY?=
 =?utf-8?B?YzNMNCtKTENwY2tjenZFU2hZQ3FBU3M4UTNrdDVtOFFwYjBYMnZrUU9Vb0NY?=
 =?utf-8?B?ZzZQWFNaSW5wWkpvL251OElhR3o5UThrZXRuUm1VZHdSOG83c0s3azFiOHk0?=
 =?utf-8?B?WVpJNklDcmkzTTg0RmQvUjYxNWtnUkJyRkxkc2NSWlp1OEduMTlEY1YzNjRp?=
 =?utf-8?B?ZnRSa2ZlTjFYMlZYZWlHM3E1M3BTOFI5ekZqWWYyT0JCRG44M2drcURJMGpx?=
 =?utf-8?B?bUNGaEVEU0t2cUdQM0hiclc3TUhoblBEelA3QkFZK0pGaC80bW5EbkhCMzVW?=
 =?utf-8?B?bWVFRDJZZlIweGs5djJ6ZTJVVHYyQ1BNRVRXM2srSjFNamhsZWtGWlBQNSty?=
 =?utf-8?B?SU9SdnZ4RUNHc2F2ampnTEhDOURxVnJNaUZmaUpwaFRCL0RTVFY1dmd6a0c4?=
 =?utf-8?B?Y05yeTZOM0pXcmZ0U2d3cHhPTUw4R3BYM2pTRGduQ09KM2JWVXA0bzRzakRB?=
 =?utf-8?Q?amdEI3rN18mKDlK7J+pxqes7O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808d2d10-6e3c-442c-e649-08db62a9745d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:06:54.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PrGEu1SfNLPO2m9TeQwvYzrhS0O1XwhFiYVwL0faHi643icttl9lSaVr+mzbeT/ZyG02feYyhUIXju91uPleQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7300

On 01.06.2023 13:50, Roger Pau Monné wrote:
> On Thu, Jun 01, 2023 at 11:56:12AM +0200, Jan Beulich wrote:
>> On 01.06.2023 11:17, Roger Pau Monné wrote:
>>> On Tue, May 30, 2023 at 05:30:02PM +0200, Jan Beulich wrote:
>>>> To avoid the need for a forward declaration of pit_load_count() in a
>>>> subsequent change, move it earlier in the file (along with its helper
>>>> callback).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> Just a couple of nits, which you might also noticed but decided to not
>>> fix given this is just code movement.
>>
>> Indeed, I meant this to be pure code movement. Nevertheless I'd be happy
>> to take care of style issues, if that's deemed okay in a "pure code
>> movement" patch. However, ...
> 
> It's just small style issues, so it would be OK for me.

So I've done the obvious ones. There's a further signed/unsigned issue
which isn't quite as clear whether to take care of "on the fly": The
function's 2nd and 3rd parameters both ought to be unsigned, yet
throughout the full file the same issue exists many more times. So I
guess I'll leave those untouched for now.

Jan

