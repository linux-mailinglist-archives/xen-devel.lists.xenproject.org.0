Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896F72FBA2C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70445.126421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sQ3-0001YO-81; Tue, 19 Jan 2021 14:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70445.126421; Tue, 19 Jan 2021 14:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sQ3-0001Xz-4c; Tue, 19 Jan 2021 14:55:43 +0000
Received: by outflank-mailman (input) for mailman id 70445;
 Tue, 19 Jan 2021 14:55:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1sQ2-0001Xs-9k
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:55:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbc771ea-dd54-4cc6-b534-3065389a40d0;
 Tue, 19 Jan 2021 14:55:40 +0000 (UTC)
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
X-Inumbo-ID: fbc771ea-dd54-4cc6-b534-3065389a40d0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611068140;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r9cFKvJ78oVh4kHZ5tedj6SJAi/L4+bZV3xpFWGs80s=;
  b=L9KJ7aderpC3wKGSpmfHgxkqXX8Mp5B06FpKtJS3zLGk1xWOcmRANDMX
   Aiqy6bWi9/CrN5onOZXxOvS9hLaEXfWFEqvfjnqMXKba2VTxdsaj/I7AO
   9FvB+N7KTk0wNhG/Qa64HR/0A7F79pmiIHo3nLjxrpqmNxhB9xizZBeAV
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hFrJPRHN9y6oGFcWxFmEaiA/CUiSm/xxXQ94HJxBUSNxQICPlDWXH9rk8yAyjodzc4KLE/nSe7
 WGp9H0zPlg+39uHg27gFRjY52vwhU9YF7CYU2Gn1yDTTvIlRnIjepCBuxiF6Ls60/BZCBEKA3T
 r6lV6HJ2ajFHo1+Zv6ShL5Z/MX8bNgms2G1oAPeR5pT4mv/QWxNKm5Ym4ym/3GKI2HWLpsnqEM
 9Sw2L8mO90zDnrrw8VQtiHDf0Hgn00NTCeZ3+38J65rmvSqPby8UiJXJl4muGy2lcqx+kHP5R6
 gQA=
X-SBRS: 5.2
X-MesageID: 35365666
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35365666"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXFenhgUDy4TOhCm8J4bXMdVOf0n/oCh1AZ894J/eYLiifeNTtSjxVSGouF9d2rLMPkKS2hfexi3vsTC9DgifGxX6qoFXPMz1PwU/PsAQ9H0+hQmy8lNpyayD1bQQudfXtCBOJqUonwxvbSdqUDkab961nYu3jH4fkZ+5RP8G0ZvgxpSuegi7YRUhSymg5HYH44GCDpN5MmJLL8E9EI6ye44UT0Fh7LatCPmLZ77SGU4u66w13maWH2Vi5nPe+582kyKk0ao6Q00q1MRL3qGZ2vblXcFwX0UbadETmr/UG2TZpSII7pEbMbgRM7A6ilB9asCWcgDimngd17xm4V9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZA8qkJKQq4jQtEtdpZCmsdJcQhmWp2s/10KBfKZOw0=;
 b=XFF6ONRFiJoUXuEf9N7kG6XV52vOqU2jHx48i6KK+m+AQAl73Xq/wti4dnln8YKO610Wwxl3ggVN3JqOij4QkwwTaRHMGWeufNCa90ieUQKflNytY/lo3tA0RcNPbnJWw0/bNaZjpxxOrCsZEVJT1sWQmE9w0sJF7fxob9aAVmIq5f2en1cH454bzCr/YjD/UKipciFNNCB5gIcmulkz/08Q8bvnaHBYGhn/YwVJ0q3tRpBt4E/OzSrOjrwJtuPo9KZxRzKJ3TUWq7cctVAJWseaX1L13SROhhCpBEutwKG1aZ6aPfZXObNNrM1nlHWGZYs/gNmSszhjzGQrBP8ebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZA8qkJKQq4jQtEtdpZCmsdJcQhmWp2s/10KBfKZOw0=;
 b=PDZgXSkIskYDR9orbFDKH86ytrvixhtJkc0N6upr+bj1IU9OvfsdFPPw5whafbkDGT5zyqwFGgWFBHuzyJzwfBMuATmcWO4jx93zUmOIqpxA1V0jfM8MpygsSXpn4mT3wTwRqPV869KYTibq/7r0N73jRcprYM4rNcI5GCTd4SY=
Subject: Re: [PATCH 1/3] x86/smpboot: Re-position the call to tboot_wake_ap()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, =?UTF-8?Q?Norbert_Kami=c5=84ski?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-2-andrew.cooper3@citrix.com>
 <20210119143814.xtijb2ggz5yz5xvj@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <46b505b8-7dbc-35da-f8e7-3329f0b69a44@citrix.com>
Date: Tue, 19 Jan 2021 14:55:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119143814.xtijb2ggz5yz5xvj@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26abcb2a-c811-41be-7760-08d8bc8a46a2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54228BA513E9A2616511A9D7BAA30@SJ0PR03MB5422.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MLwAajLWkw2llFLKO7saFP1hRaQ6NvIERTqwua/xM5/ceYYVMlQUSjBx8Oi24CEug3/P5uKId4kbqmVTDgUUk+JzZf93v5nvcwlb7gD2uVxgIi3uAqParaj44jK72kl24uJA2DgMa26rrQKRzS+MNFglcUjAWFzVB/jiWMD2+6eg6DieUnnwR5Apw9nm8kNoHqPL+3LVTts/dJR6DLUjAHHQ7v9idpPf90xPa5dirnesRAZAi+9B17ElhCLJTRvC8iL9i+cb3ZtDMbb/jIGUlAubtvoRavsDanACM4YTFBu1IFYyWDPHetTniVNqUD68xYDCXWTpzTN1wqU2MDlAkdc3eCSCV3Z3+Z1Ahm+zAzuW/Wng09SO6E53O6x4n6Iy3WNn/2mE67SKhaTJPnPuLF86FTDwVxz7ubQYicZ2fFhdMdBDRbp5ujv//cmH3s4+qmktxCF/YSKDbf0oY29yoFQVqJeFwQ30ikg4iCkrmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(83380400001)(26005)(16526019)(6636002)(316002)(86362001)(5660300002)(6666004)(7416002)(53546011)(36756003)(6862004)(4326008)(8936002)(186003)(2906002)(54906003)(66556008)(956004)(8676002)(31696002)(31686004)(16576012)(37006003)(66946007)(66476007)(6486002)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFE3dGVDZENXR01jRkVXWUthdnVKYkdrTkxiSmZ4cksrbUZIMFBkcldwR2cz?=
 =?utf-8?B?U1JqcjQwcmJ4aUl5ZzdCYVJvK2pyRVJGZHVTWWM4YmlCVzZBcEtnWE4zUTcv?=
 =?utf-8?B?SnJjNXZReXJjNWdINU1va01GaENyQ2lQVzgvUHE0eUdyOGZhWmZYUjZMWldD?=
 =?utf-8?B?WThTVzZ3UjNNSjJ0RHNYUXV3ZkZNY0duRjlxS3ZWUEFhQUhnaTFTWXZsZ0pp?=
 =?utf-8?B?OW4vdUhuTXpjR212bGdZcVRCUlVtWGUzVkNJRk9kVmtvM1hjUDY5VjM4aEpy?=
 =?utf-8?B?djBUQS9VTy9yZVlaNnUyaVFwMjVKM0tzNDhMbUpxQ08vVlRMdlB6d0Mxd01z?=
 =?utf-8?B?ME52NzViY1pDdko1Q1BabXdCa0xJTFVUcm1SdFN3SkRoOVVxbjAwNHNPWjJq?=
 =?utf-8?B?T09rbm1XRHZVTjgrZW00SVV2N3pld3h4Y0h6REpiMkJLaVdkOU92R1F0eE95?=
 =?utf-8?B?S2JhZS9Lbm9KSkNXbWtwVE1NL0FHNlIwRC9qY25VZ0NIendydnFrclUxMGRQ?=
 =?utf-8?B?cSthbHJ5c3lGaGZYOFByOEZ1MnVFSnB3ZDJST29hbHh6aUZmZDlEVVBZMFBi?=
 =?utf-8?B?a2Q3bUJMVTZOQmxrbXdIM3REVitzOGF0VTJqa0RDQ1l6RGtyUW1pcHVyNzBj?=
 =?utf-8?B?OTg2RkVUdS9LYTRoUk1wdGFqRzd2T2owa1I1dGxUb1JQbDBWQUNRQktLL21h?=
 =?utf-8?B?Sk1IUC83V3E5WWNnbmJaVE5BdmRvMW11VENiNnE0S2g4b29EQlBxSVBBK2VQ?=
 =?utf-8?B?YWc5SG1lNC95ZGNEUEsxZ2w5WlNmbFJxZ2dTbzNhMXNPVWRjUHFCWXZQbW5T?=
 =?utf-8?B?WERybjJ3SlF0S2FwWjVwaWJ3Y3dFT3UvMWJaOWQ0NFdTMGdNbXB3T2JqMzRi?=
 =?utf-8?B?NVNjTzdMZDdzNTkzQllBbkFzNk9yMTExbzVjK3NWbURYV0tqeDlHQnJ1dXM4?=
 =?utf-8?B?Y2VwdnFqbXU4RGxzT1ltbWpjYTAzM2xaMUFrb3JNR2kxdDFjQyt0UGQ5NDBv?=
 =?utf-8?B?L0g4L1RPb3dRaTVheTlRRHA0emFKbFdTWHc0QWtibVZ2TFl4bDNhcTZ4OFZm?=
 =?utf-8?B?MnlTY0NSMHJwR05KK2ZaamppVmNVdmNEWkpVNlNDQ292UG5YQ0xMbEpJL3ZQ?=
 =?utf-8?B?Ly96aWVpZmZjK0RnWGVnM3JWWFNKZXZXK25vNktYdUd1d2ZxcVpuZVZ1UUor?=
 =?utf-8?B?N2VFYTZyVFJxTWFrTSs1QWZ5ako0VnVHbFlRLzRialVnajA5TmczaFdvazdW?=
 =?utf-8?B?U2VydnA3R3B2eGlUNnFNVldCOXAxZnByWlloeFdCaEx1OExON0s0N2VDenlE?=
 =?utf-8?Q?NXdVc1Eq7e8USPn0Ya6sKTpCVyCRAuyRcs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26abcb2a-c811-41be-7760-08d8bc8a46a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:55:35.2594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZztAj0awQJSf5WOuOl/ayl3aqzHaxc/ScmjMULHrkLAPe3nhPbtOEeA3VrF41ZHzJfhsk3Ydx+MKRZF5UrzDqLzrRtZqaZf56f7lp/Rx38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5422
X-OriginatorOrg: citrix.com

On 19/01/2021 14:38, Roger Pau Monné wrote:
> On Fri, Jan 15, 2021 at 11:10:44PM +0000, Andrew Cooper wrote:
>> So all the moving parts are in one function.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
>> CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
>> CC: Michal Zygowski <michal.zygowski@3mdeb.com>
>> CC: Piotr Krol <piotr.krol@3mdeb.co>
>> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>> CC: Rich Persaud <persaur@gmail.com>
>> CC: Christopher Clark <christopher.w.clark@gmail.com>
>> ---
>>  xen/arch/x86/smpboot.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>> index 67e727cebd..9eca452ce1 100644
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -426,6 +426,13 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>      int maxlvt, timeout, i;
>>  
>>      /*
>> +     * Some versions of tboot might be able to handle the entire wake sequence
>> +     * on our behalf.
>> +     */
>> +    if ( tboot_in_measured_env() && tboot_wake_ap(phys_apicid, start_eip) )
> I think you are missing a ! in front of tboot_wake_ap?

Oh - so I am.  That function is totally backwards.

Fixed.

~Andrew

