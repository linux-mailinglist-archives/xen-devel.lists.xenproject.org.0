Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D612FB506
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 10:42:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70222.125962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nX3-0002gD-Uj; Tue, 19 Jan 2021 09:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70222.125962; Tue, 19 Jan 2021 09:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nX3-0002fn-RS; Tue, 19 Jan 2021 09:42:37 +0000
Received: by outflank-mailman (input) for mailman id 70222;
 Tue, 19 Jan 2021 09:42:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1nX2-0002fg-C1
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 09:42:36 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab3da6d4-a08d-4440-83e9-11d9260167fd;
 Tue, 19 Jan 2021 09:42:35 +0000 (UTC)
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
X-Inumbo-ID: ab3da6d4-a08d-4440-83e9-11d9260167fd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611049354;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lnGU3Tbz1qdaGZPwF0w+jlFaDdyGH5IBCIwSfHdtOdk=;
  b=HoeKhhPOJuN6uj1TLFC1scZV4ufSrDqR/57VPPE6YduJBXUlpmTQmi4x
   ycNEGBUsZ+2eLTD52zcF6y65p1fKdlU7fab1ws/dvcyq15SoxCW16pfK6
   0HsE7HlMoV5xQlN84+g0rJC5ShUHV3YPte8JpmiAVAlwfRc1ZF4vLWuhf
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dc85SSn6/FyTf/g1sOYR4xwvuk7gdWDa2QICxAC2a/ybbFI0FXtPmULvwXoROgwJURipULLRr2
 tZjKdhC1ddZezKpwDFpter+shDZRU+Zv6MnqqZvwOJXPW51Ql8N3U/jtS+5bikcnNEUuw5yoX6
 79/Jc0PkwBwFEICjWFsBW/hIa1Ip1sUXqEX5r2ZxbqCWJbghXYv3XxSf+pgNT54QIAEdBLTp3X
 shbc13wY52qnb79K8VfWVIGAnuKjOoqUrbdmPQ7unN/qTjpUxTfa7NTtJ5XJy1QUZG4dwqijbV
 gYo=
X-SBRS: 5.2
X-MesageID: 36647850
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="36647850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/PaD4Q0gvPpiiWFSI91YfJR2VCsPiDb9YjrNRrGGSvTt4NjV/Mz8kBBrXhu4pvpSostz2ryS/FlLh45q79OlTrZ6u5KFWC10cEsgEesVIK2R3ohz6xo2JwZe2eqKsCVnO0hpMHK9N57MP19RfD26DJNGSpZVcPE0jXXhmyqQXl4n33tXjEDEUIg/Yhr7xq+MDn2fppFZWHsKTlSZZfl5vsNvcyWGcKGma7wf7G4HRL1z4xpAbj+Uvfl3S/dO+kwqOf/s+y5FZFnZm9XjGHwFVBHBFKvKD4yf/shcdzclk9HlSlPEGsaGYPosMdkGhtBf0pf7W1t4XBx7f/PhIzIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/F2mlz5qFbwo/bUppGNnDTcJLEGO5d1XGku7syRmjk=;
 b=Oo5gy8EqEkiTK9TO9zzDgV1S7At3uxvkmtVPofyEGZQhbPssVkQqS42Ei5cFvlrk70YaVcSzQ17ssj4LKm2M3gsg+1dlJqdXbLD807lbRdFwmAOb/E7khydX0BhMpWVvHKgA68lypQuVnCraxe8nFOWaBHC1f3GS2hpt2sWebWMSQRgkl5h3P2xQxvqJTa4l5GQlDWPas0jT0HaiOceYaKSRUUmOvuXXYfAi9FjHLrSS2SPRXL3Av1IuULDGuXLUAxQ7aFYedFsGmKNLTaGjaBtsSS1oDuTdu4olOJn5VVzzCflOtRRFmyL8+iHHe9t2LMhQhY68vPZ/Vyn4SJYiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/F2mlz5qFbwo/bUppGNnDTcJLEGO5d1XGku7syRmjk=;
 b=fcLMsG4YorZ2rNgAPf/IcmAj6W+2u2nigb939dD4qylXzEEeG/juAMqPM/n9uoRDAtoz4Im5kpNz2Zm7uTbkJYA0ulsrbeNSVQv9Lb476dPMvkE4fYCg34gtkzE7XFacYN4is0WMI5UaW0RQWN64i7T2mTNrm4fUEqToQc48QuI=
Subject: Re: [PATCH] xen/domain: Introduce vcpu_teardown()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210119003206.2255-1-andrew.cooper3@citrix.com>
 <e12e7387-0020-6085-a048-4c253808af48@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <54d3a4ff-9366-6a55-2f81-a2754a1bc6ff@citrix.com>
Date: Tue, 19 Jan 2021 09:42:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <e12e7387-0020-6085-a048-4c253808af48@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 639b30a4-d7cc-4e87-25c3-08d8bc5e8a21
X-MS-TrafficTypeDiagnostic: BYAPR03MB4661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB466122912A6EDE9DE4A40735BAA30@BYAPR03MB4661.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsKAdduIE2siTdmBtVo3CR3qBn7qGgxkR59bheUAsl8FR2BoL7vUkrM0Phqj8st3qvkO1u4RKeDG4/hFswSJXBjGEHUDgqzG7I5nCsFYCrcyNF3OJR+VkzsOiF17wu9R36evEGxlc+aC5od+QixriTHdQiyO4Mynu0dTGkfcdkKar483emwXAm49UFSV0MDy+WD9prE448SASwC8l/pGyjeYaE8FxPl/5D0foq9tjk943X0r7kntB8hmM3JM2BswoeTMRMKtH23ZzrzAkt/3HMWSJxe1cq7Xj2sab7MW2gJqC4W75qGpkQUAlDBRI36MMJIVEjqVftOiRkqTb42Y3/MnwETGVbpAuNBax+9RSW3EdH/Zevtj9IaI7DjsoveIbezyGgX9MTBxK32RzAoMOvxTj+hjUlM55zAs4HtGPkZRZxZyhofJUYf5UFxFHsk3IKwwdxV0X1SMIpl6sRyRDJqBnb3NFFhOejijzlBY2kU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(6916009)(53546011)(66946007)(86362001)(66476007)(36756003)(31686004)(6666004)(5660300002)(31696002)(66556008)(478600001)(8936002)(956004)(6486002)(8676002)(2906002)(26005)(316002)(2616005)(16526019)(186003)(54906003)(16576012)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U280MGg3L3JicTBXdGN6Nnd6Mk4vN0FraUZRc1BPYWY4ZGxWa3orQU9rYVJ2?=
 =?utf-8?B?YkxMZy92TG1jMjlBME5obGhJYXNOaCtiTmNYUEtKR1RqMHUrQm9lTC9KdWpy?=
 =?utf-8?B?QjhuSjJnM0N0ZDE5b1B4WUplT2t3V1ROTFozbFpoanMzYnBlazJJaTZUVTlF?=
 =?utf-8?B?dzBFWDNCKzVvMlVabVJqWnpXalh3YkgwREZNS3FCVUlrY1hndUZqWVRRVUIw?=
 =?utf-8?B?TXNIVE1DcjBBUWgxd3QzY2FDTGJ2R2FYVU9WSE5qemRJZlV3SzNGYitiNFVF?=
 =?utf-8?B?L25JZVN0TDZSZ0o1MmZDQUU3YTdteFFjWmN2ekQrbmQ1WjZSc2R0NlRBQkpw?=
 =?utf-8?B?bTROYnNtbENGWml6cmllaXpjdityMS95eGpNd212dWR3dE55V0tmZGV0akZ2?=
 =?utf-8?B?b2hGbnVqTXhmeHhnRnI4MXBWSjlHUkFBY09sS2N5aWVKMGdSWk9UN0MrMmUw?=
 =?utf-8?B?Qjl4MUhGbWpzNHRIdjRxTnlFRzJ0bjdndmJWRXZSUjg5Q1RxU3ZOdVYvZlFM?=
 =?utf-8?B?UER0QnFsbEc5cGo0U3JNeUlVSzhpTlNPcW0zVFBZRFUrS3Vob0gxWTJXcHN1?=
 =?utf-8?B?RzdoMG9qQnYrQXp3SWFwaWtiS2VkUGlQa01HeWtEUFIzcjBDK0Vhc0tGN1hp?=
 =?utf-8?B?d2svWFpNa1FHRG5UOUZOenpvN2NoOGF6aSsvODdMVlh2UkZpR0lRem5uUHlE?=
 =?utf-8?B?RGw2bDgzSUpCMjRxSFZkWDhlZFo5NWp2Q3pPdnVvMFNIYTgzeUZMY2hlYmxG?=
 =?utf-8?B?MU14SEhoS3BuZS9uSlJHTGdkdXJCRlZURi9BN25vWGxtUnhiYzIrT041R3Bo?=
 =?utf-8?B?TjF4cHFCcFF1YVI3alJMVWZaLy9yWCt6WWh5cGpVUmRWRmJQWC9vQjRkaFpZ?=
 =?utf-8?B?ZTI2K29EWHpQWGNpaUhOYWZmYzRDQmY2MVdqZEdBWXY1R3F1djJybW0wOHky?=
 =?utf-8?B?Vm5sNkVlNStIUnlSODBocGJWYzg3bGFpLzVraTFFT01ZOUkzV0VtM1pCT3Rj?=
 =?utf-8?B?bWZodnRLSXpEOHJDbDhHN0tvWk95UTRUa3JiSDZnMGhuSnI5aTdxRGgwTTlF?=
 =?utf-8?B?Z2pYVjY3NW0vOFEydkgrbXNZeTdJNlQ0Tnp1UlZXSVE2UlNYbUlhN3c1Rm85?=
 =?utf-8?B?a3lYZVBnMU4zNS8xOFFpS3JSelRDN05NM3o1a1FQNjR3NSsydldBTnVnaEdk?=
 =?utf-8?B?a1d2ODZWbHByQ3QwZjB0ZEV3ditFZWh1NWJnQ25oWEhsMzVkckM5K3Y0UTBi?=
 =?utf-8?B?MzN4OGpOaWNOQ3FWckNYRUdyc0tCRGphUVJmSnhoNDZqbmZZbm5wdDQ3bFNx?=
 =?utf-8?Q?cLokKwCxeptNZwHqTFXOQ7fniZUBVdSGmQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 639b30a4-d7cc-4e87-25c3-08d8bc5e8a21
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:42:30.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJe3RHklAuTgYxHJD06FYWcO6FxGt2St8DCckGz9oj0+ePQdysq3F71V6Slww8b7Yns1jQxo39tblyyhU2bRfiALByk/kcOT/k0uSZ5AFaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4661
X-OriginatorOrg: citrix.com

On 19/01/2021 09:14, Jan Beulich wrote:
> On 19.01.2021 01:32, Andrew Cooper wrote:
>> Similarly to c/s 98d4d6d8a6 "xen/domain: Introduce domain_teardown()",
>> introduce a common mechanism for restartable per-vcpu teardown logic.
>>
>> Extend the PROGRESS() mechanism to support saving and restoring the vcpu loop
>> variable across hypercalls.
>>
>> This will eventually supersede domain_reliquish_resources(), and reduce the
>> quantity of redundant logic performed.
>>
>> No functional change (yet).
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit perhaps with a name or type change:
>
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -532,6 +532,7 @@ struct domain
>>       */
>>      struct {
>>          unsigned int val;
>> +        struct vcpu *ptr;
>>      } teardown;
> I think the field either wants to be generic (and then of type void *)
> or specific (and then be named "vcpu"). Which one is better certainly
> depends on possibly anticipated future usage.

I think I'll rename to vcpu for now.  I don't anticipate this being
usable for anything else safely.

~Andrew

