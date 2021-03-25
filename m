Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B2348D18
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101354.193804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMRL-0001zJ-0Z; Thu, 25 Mar 2021 09:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101354.193804; Thu, 25 Mar 2021 09:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMRK-0001yu-Sd; Thu, 25 Mar 2021 09:38:06 +0000
Received: by outflank-mailman (input) for mailman id 101354;
 Thu, 25 Mar 2021 09:38:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPMRI-0001yp-Vg
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:38:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea890625-9993-4787-962b-eda054820ece;
 Thu, 25 Mar 2021 09:38:03 +0000 (UTC)
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
X-Inumbo-ID: ea890625-9993-4787-962b-eda054820ece
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616665082;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=klRwwvaU4ed9LSX3x/sDurJfniZrtF+mckI2Ix2cBoo=;
  b=EDkOo+cnXutpgtzsrgLl/4jsWoRFIkNiHzhdh0y9x0gPBWV5Y0AOewZ1
   r7EVMJnzxCmHsYbLo0iM9QOT/JKXy3tCPTYCrlT7eQ9VNrYbAd1IywzBU
   jwtSb7kglbD3XTdPnXv3CM/bmDBBsAl1bKLlFkFnG6oyiQupnT/cmwEkw
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +B2WYDj8ONp6sU2d2uoX4dzhMYd59EnqZ4rXC4br6jVzdinxzBmAFIIsVnTekYN5rbPnJKekZM
 aaFLj3udsNEhQ4Eo6NPA6OM/eoCQMwYyVIYoJeaM0HeaVD76xbP4W4PbzTsSThOlignzTCE+wR
 JgqpLUgJRDuIIACsouWcSqbDnSlVFO+0sSjeYx2S/ArHqAJyOpJlHPwitRU13Vx2PbNlxPKuzY
 WP6uPiFW3kRHzpAvsiX51ExpmrHX10X5wR5amTxSL+tTOxXv7mIn1EBZqXgqs96IRGMEfR4jW4
 iZI=
X-SBRS: 5.2
X-MesageID: 40085357
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6E/966PtQlrhrMBcTxv155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEq+GXH/a6NpJ8ZAcVI3SOTXOlUmJCMVZ7YXkyyD9ACGWzIRg/I
 ppbqQWMrLNJHdgi8KS2meFOvIB5PXCz6yyn+fZyB5WPGNXQoVt9R1wBAreMmAefml7LKE0Hp
 ad+cZLzgDIERgqR/+2G2UfWKz7r8DL/aiMXTc9GxUl5AOS5AnYi4LSLh7w5HYjegIK+5gO2y
 zvkwv15qKs2svLsCP05ivowLl93PfkwttHLsSQhsYSMSWEsHfUWK1RH4eskRpwjOaz6Es7sN
 SkmWZdA+1Dr0n/U0vwgRzx1xLu2DwjgkWStmOwsD/YjuHSABcZYvAx4b5xQ1/ixGcL+OxY6u
 Zt2VmUspJGZCmw5BjV1pzzeDxB0navrWFKq591s1VvFbEwRZV2toIl8EZcAP47bVnHwbFiKu
 VoAc3GjcwmF2+yXjTctmlr9tSmQm4+KBeAWlQDocyYyVFt7QlE83c=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40085357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx9FBVvJ6AgCdGqZ1xrVCHfD/0J1VjzfvUgm+/RhNuLPbtzq+9NKgn1p5lUg9SRnGenZ/8ET9SAG2w7UaogaFWbPmu2UTLlMC8pEau0KvkrHfwxneW3r9ki5wf0sq58zFjOk3moEOcWHrscO1SvINhVfCYD2Rtp3Tsw6tbmi8dSfS7nkthjHq6D/iWmainEcP0YYXS6n4WQUR6nI5gIpCydGdYHP7Ur0If7Y0b8nsu57aL44qqTmZhdD/L1vU5HliOuFOq8yIw79XXd9lahiwuo58jZowJJQtxjZx0jthoXC/i/YKfeFcEdk6KtRYNEKcFUYGPUnYDozWMQOq7IpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w/a6QIOvJdqHc/an9cDyck3WaAGeZtdwdvZrCvYneI=;
 b=Gev5jvarq8zPC9UJR//g+bTPRiImKgadARWe4stzNezYH3crrpP4re4x0XV7qh6VR9pIeLNk2ILL2yYto+khwDfzmD+ErCYa5jLbDjH0oGRQ7Q2IGZensW62wEUxeorFPCIC840RIkoJ2IFsJptZSerr1teunirCtJqASVu2xkK0JalffJURRNNgkH1UAAivWNN+lEGwIkTW9vnIKx07kdT7+t4hoK12dORgYUQL8ssMDNcYD51gYNfxWI9xx8g3AoxA4mtVPFQ6vD7ZB39ZWOXq3ZV3+GmxoYck1C+66Lcpceru94ZAFEwP1VtJ2rB4H5gOPP629LtH4eA8rCs2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w/a6QIOvJdqHc/an9cDyck3WaAGeZtdwdvZrCvYneI=;
 b=cZJVf/DiliJwDOiApOHe2o9PrI0sqqOhro39qpvdddS1/GiRxazFnsb0+0GdHfWkzZsb9obK5TF1lFEs3YX50hBr2/u3hyn2Gvz4N39zSCv3+rumPZPgf1are2+7DpOaFq5vB9l5WvYyAAwQ8csLHcPGx57izb+XYVd9FKNt8P8=
Subject: Re: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
To: <xen-devel@lists.xenproject.org>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-5-george.dunlap@citrix.com>
 <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
 <0A187740-DB6E-486C-8B10-5207CE6A5D72@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7407cac8-c55d-0372-123b-39c9949e6ca5@citrix.com>
Date: Thu, 25 Mar 2021 09:37:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <0A187740-DB6E-486C-8B10-5207CE6A5D72@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34230015-e584-4cad-a67b-08d8ef71acbf
X-MS-TrafficTypeDiagnostic: BN7PR03MB3732:
X-Microsoft-Antispam-PRVS: <BN7PR03MB3732EA70A30A409BD66B8D8BBA629@BN7PR03MB3732.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qoxmkc397On6QRqWY9eBLcvRGkaWOvEqO4Y1s0NOF/DxrfGSRpbifBX76DfPimLGtu1YTqZfv1wsfLURj7ur9z05M/jftXlcs/GFQjazJrGecQAMc5bjoiA5Wf82tKej8phb2wqEGOesDUbUl05Vgwd1AebZPD6J773xM8O8fDXYWR1r0Boyk29Kpdm3ENQmu1TiXF8479RdH11KjWHPFy71GYpCzTrWMS2KOxBe587oQ9VNb/KObJbEbUOcO55Ktba8dxtfaKArevI+dPiwr6xep+nLYEe9Y14nfPDDKTPDZGbnbeTRFS5+snIKJf7ngzovyW81eZBkqx8TML5RUOdx7vR2LrvEBrj7dEmi7/n/wWVCSPtbqL+fpecRLyt7pYYAr6dXMgXGFVoYwJWCtELCsfTRvVSkyBo/AiE0b0E9TbiGrlFgP0+a+XKL6CVNFTetJ6kRqVH47CvTCM2IOIrGOPe0RdMPz/Rzd4oP7Qh1yKDXWspMJYIveKY991RNIn75eGEbNvLvsHIAYzRrDcwf0HtNOInImg6CIIKAvHfeCM3H5dNaF3reCUItWgabaV91RI3pqdvZpjHlqKqZhRiYH42TaYDsadet885eIqJZSd9DQkC8hRgDBusGEqBkfo0OD3Xql0/yKle0C6SHTTPN+MPhlD4g75rUT8GPIezt1l8ijIxHh6c11oX31FtjEj23sckPQ3h8lg6gJ0FaocBIIm5J4Ydqz/UIKpmzTytYelH4Rq5HzfT5DHsT8dqXgR/bPnjybd8wEns2wM3bnfZ1ecOOapBzAxT4g34VEb2ntNDDcQ7lfHPQxGtG8hZlYjIuJKg6/bN6BWQGdigAhHmwaR+EX6r/NC3m7tz48feeiAJf3TWDxWkvp3urFWAU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(6916009)(66946007)(316002)(31686004)(478600001)(16526019)(8936002)(6666004)(8676002)(956004)(186003)(5660300002)(16576012)(66476007)(86362001)(2906002)(36756003)(38100700001)(66556008)(31696002)(6486002)(53546011)(26005)(2616005)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2lpYVhhRmhMRjNXWkliZEE5elJYRlM3RXdwVjBsdE1YTFhoeXlHVnFtYzZF?=
 =?utf-8?B?WWJkSSsvdWhiQXdFdTFncFlpd04wR2x0dnB1SzByTkhmQWFnS28zZkRNZTVL?=
 =?utf-8?B?bWFaU25NNG1yVlAzK1pvdXphVFdaWmRnQzF2aHMzR1NUUWdZdzdhZFMyRS9H?=
 =?utf-8?B?aU9mbGQrVi9xcHExTFpmeEpKVU53NVFFZDZNcWV5NlVsVjFhZVJsZ0ZMdkhR?=
 =?utf-8?B?bEJIaXpEa2xyNWVtMUkrR3BTVGJBcWNId0ZtS1djS25lclNrSE9CSXZ4WFd6?=
 =?utf-8?B?NDJnV0JGUGZvYmhtNnZaM1daK3NoaFkwNytib3JPOVUxUHY1TFA1TE9UNTVE?=
 =?utf-8?B?eHdFUHRJbFVwbFY5bGRGclRSOFN6MElIUFdvUTA2alVidm9ieEtyWVNEZGRl?=
 =?utf-8?B?Y1R4TUxqeWhzbWl5L0doVjVRT2d3ZVdmc016MEgwaGJ4VWdXR2tWdW1namhE?=
 =?utf-8?B?dnduMjV0dXZsemhZVlh1enVveCtpNVdpamNxaFBnRFVsdStYSi9BaEdVOURS?=
 =?utf-8?B?by9FUVhmdWMzNWlWYnl3bG5KTWloZWlFVldZQi82aHdxeGZuTkZHY3ZCNFB3?=
 =?utf-8?B?bmVOOVFEV3BRQnFaWndYU2dDQjlHQWwyQmYwOTlYOUs0Z1p3VTYvVFgrbTQx?=
 =?utf-8?B?RWJ1REdPaXlXYjB4Tk1nak04ZXZhYndHN25aSm12Z2Y2MGcvSlpzc2ZQM3Fw?=
 =?utf-8?B?QTAzYytpOFowREE2M0ozV2JEd1kzSHZaYnBFNDNrOUxoMXhTbzdXdm8vaGNl?=
 =?utf-8?B?M1VWL3RITExwSVhQSkREYlB6TnZ5eUJnMjVJWUhETzE2N2YzdytuYWIrYU93?=
 =?utf-8?B?cXIwRGw4NXFjSFZxVDBCM3RQcU5pVklseUhSQ1haZzNkeEIzck9kc1dVYWVq?=
 =?utf-8?B?QWd4blVEMEMvQ1ZPRHhhaW9TNXJsWC9CTWl2aFcxaG9sQXJEQ0h4eGRza01u?=
 =?utf-8?B?a0gwZmt2aGx1U2NZZVR1Q0k0eS9uQTY0SzJ0RXIxSEhTcitkNS9rMWx4NFNm?=
 =?utf-8?B?dnFTcDNPNUZVcnQvVUwzMVM3Rmt0cWxnWHRIT1Vndmx6V0NvWTNmR1YxdmpU?=
 =?utf-8?B?N1dxTi9rOEYyRFVEMndNQUJRRS9jRTFQdDZKNXJSOXRFSDRiN3NFMDVIT1o4?=
 =?utf-8?B?bFFVQ1BHR2I5NUhlY2dXMXp6c01uaWgyVVpWV0NCdTh3YnpEZGZiQmNHdDBS?=
 =?utf-8?B?MGlhUjRxN2tMVjNUdmN3ZjlKV1JtaDJPUDRCejhhMFBobVFHOUJqZi9TSk9a?=
 =?utf-8?B?cExJUFBsU0oyclhYZ1hwdG5QQkhWcFEyK1d3UVlRWnU5VFFLeG12OXYxL2VT?=
 =?utf-8?B?VmpReEwrN00zZGpGeGEwWDlqeFE0ZW1rVlovYjBYbnEzV1Q5ZTMzNGNxaFZG?=
 =?utf-8?B?OW9nQmRsaHp2aDBlZnFDckU3ekZyd2VnRFRzajJPZFhiUjNPSkg3SzU1QVB0?=
 =?utf-8?B?dmVMbkk2TGV0NmthbUd1OUZ5WWJldDFicUsrTUJBNDhkTitEMVZVRWN4MGE3?=
 =?utf-8?B?clU4YW1CSTJJRURrWkM5bUlDRzB0RXlSYzUvc1J1SWduRlBsUVRtUC9CRlBZ?=
 =?utf-8?B?K3pMeExCMVFqWkZ6aEtWRlUyUkVHR0xDd0tsY3F3NnRpcW92U2dHRGhBTTI1?=
 =?utf-8?B?SDQ5TGMyZFJ6OVc4cVlUbEpwWllEMW1mRG1IK1c4Vm1UZzQzSXpRbEVJOGwr?=
 =?utf-8?B?bXZGakpaZkN0cmdmSFZyQXVoM0w2Rng5ZDJPM2tFdThtbUMvZ1NUUXpUV2t5?=
 =?utf-8?Q?tVT7uHlHsSwYOhwo+2tQRem0DAOw2RyS0oDuOyT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34230015-e584-4cad-a67b-08d8ef71acbf
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:37:58.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYfBv4f/qrn4z7EzmeKCJutSb+NNlPmxPMjBiyqYA6pKm+FPca2PBYE1xMmBW4ugZ3BJ1kzlNhRqBeZdBHJnZQg5teqfEHmpo8jQPKeNtqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3732
X-OriginatorOrg: citrix.com

On 25/03/2021 09:04, George Dunlap wrote:
>
>> On Mar 25, 2021, at 7:57 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.03.2021 17:44, George Dunlap wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>  - Named PCI devices for xl/libxl
>>>  - Support for zstd-compressed dom0 kernels
>>>  - Library improvements from NetBSD ports upstreamed
>>> + - x86_emulate: Support AVX-VNNI instructions
>>> + - x86_emulate: Expanded testing for several instruction classes
>> TBH both seem too minor to me to be mentioned here. If I was to pick
>> just one, I'd keep the former and drop the latter.
> It’s always quite difficult in these releases to help express to people exactly what’s happened.  We’ve got over 1000 changesets — what have we been doing?  If my star chart is correct, the latter represents nearly 1700 extra lines of codes in tools/tests/x86_emulator/predicates.c.  It’s actually a reasonable chunk of code churn, which I think is worth highlighting.

I agree with Jan.  New concrete instruction groups are useful for an end
user to read.  "We refactored some internal of a test harness" isn't,
especially when it would most likely be repeated every release.

I'd drop the latter line and just keep the former.

~Andrew

