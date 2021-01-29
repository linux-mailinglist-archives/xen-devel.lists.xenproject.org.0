Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5A308C4A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 19:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78397.142647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5YML-0004a7-UF; Fri, 29 Jan 2021 18:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78397.142647; Fri, 29 Jan 2021 18:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5YML-0004Zi-Qd; Fri, 29 Jan 2021 18:19:05 +0000
Received: by outflank-mailman (input) for mailman id 78397;
 Fri, 29 Jan 2021 18:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5YMK-0004Zd-CZ
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 18:19:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89efead6-0b32-43f9-9a3d-f154c47c834f;
 Fri, 29 Jan 2021 18:19:03 +0000 (UTC)
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
X-Inumbo-ID: 89efead6-0b32-43f9-9a3d-f154c47c834f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611944343;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z4/dnV35HrrhaGFpCUCMxKDP/LijErxJkkGHk5G6OD4=;
  b=EfLYFhonr7KnVp2XB+mXRZjZU2QFkVdxo2W/NN5bCiVdkCT36Hot9vjW
   jmbrqo6Uak101RerpZyvrEA07MZN5U7+emKejhUIScmgg8SFIlujLeUkW
   gIups2xeKOwKP9XntSJ8i3Jg6X//dUTspjWi2LjjZaLjbjFGSA+DzTqQz
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d5ixRG3lYDwjtk3xDwaI++5ns/Ax0XwRSkZ6lwhnel1w7MEVTdBBw+PVRLrFQlJSj4KZEk+xkG
 4SO18esMifCvahAtY8lp+sioVnE7YjwpODBYKLjYmQCh9dqUK7nVcXrDdpKgjQ0OElMH1zsShp
 7CLAMTMpf4SiEqcvHJXmNy75b19kwFlV7TmVyfEKUqO+3QKw3cYhAYFT8FufWMfp4NKMbfVNd+
 V6ayBpzFqz843IcZyBg6MeyuVjASWw0mpMu60l+r04RWQd986XyOPqDB6Y5Oa0CDoQON6HJnSn
 as0=
X-SBRS: 5.2
X-MesageID: 36135400
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="36135400"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrGhoWcpeeKfEMDj6sN5rRjAjMVZHvtGCyyy02YgrbF5sWzO9pRGSpjCDRHnvcNq53gvgiNaHirp1NB1fLUxmn0b1A6LXG2GFnGwkQGH4r2ckKRE6syPsarXBDT8aIb027Mnn4xzTdk1h//yUkyk/ACks0eEhaamSUEILQ2HurHgvnPyeRpzz+Txiqwy/emIg+60NUVeytQjMwaf6S5XXdUk4L37PTYRFrG2aZXGWAKOCAIPTCucpdTr49191m6THZM5LDchsw0o7GpgEM0BwvvZSgznbKCv6BGZrhAKvnT6gHI1OtAL8ukNXt088WAEM+HNxhSki9BZZ7heF/FSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOQqzVNBjI5KMWusL5Z9o0Gp7YdRFB4swm2EAp3FDhc=;
 b=PhNROhD1HHj7lQ3LBJUMFNTODp8wccc+5CNenvuAhWixoZ1B5eMITCvnnwBB0uhg7QDladOkFQ1MDPJIbypY85Gx0X//BRrejhpe4JuFxm7UwhaTz47e2i/5Rr7C3uWDoFbNq+y4IDYQm2/5xpccQOsPIY7MKYNgpXjqkp3c/jOPyv/A1MpBW6XoYnozPq8VgXCOOKHrWsMkl0ZG45eQ4OOEzIGDs5d4w4hu0M+nlIXMYRaaZvax95fhxerrEIM+wZA1d7/yEtGcBf4AnIxMJ28felUnq9aNoXqvxSMQxcq3/xG66thlb4d8Qc10+03p67eMoHCjFhcB+u+dc6GDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOQqzVNBjI5KMWusL5Z9o0Gp7YdRFB4swm2EAp3FDhc=;
 b=IhG9TzihCoaffSkNGVypQQIQWwRJVHqnbzQ/F61w+/1dN6Xe8QUpUW+ZGRP2DHMRtQSAUY5r/9TNsI3iN1tOk9n3z1s9OYlh7kF72ey6DAewmE+6+AAXgm6dgESqAWgsp3O572sifnDUo0q1p5y0KiRGwT/Sfcr3Jf3vmwEUbRQ=
Subject: Re: [PATCH v3 7/7] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	"Hubert Jasudowicz" <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-8-andrew.cooper3@citrix.com>
 <65d256c1-e9c0-3859-b6fc-d3b7a41ef964@suse.com>
 <836bc7bf-7342-96b4-253c-dedb00da92f6@citrix.com>
 <46d73c0a-035c-db7f-3b1a-87ad88bc2518@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4024cc9e-8c9a-601a-8f9d-fa480c42d569@citrix.com>
Date: Fri, 29 Jan 2021 18:18:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <46d73c0a-035c-db7f-3b1a-87ad88bc2518@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b19a0dc-e411-4979-aa11-08d8c482583f
X-MS-TrafficTypeDiagnostic: BY5PR03MB5170:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5170432D64A3430992E18EBEBAB99@BY5PR03MB5170.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: skM4wqCSJ4rU+DKe2Qb0PWmMEdg12DtDKTXix07B/a5kESumsxYfMYEdL1u6MU3HqDOQymLnOx0Z9g/AnO2HQmLIxZPfsHo3TFUMpH9p9IUuT+3dincIktQRBhNnuyC9CX73A0XcudYHHMI4LB0aHvUqvcekIcRBBmQjNxjJQcBmrg7FoMTpiITPq0JhyJooFJGwvBMMnRw/WfwFyOJcv6Ivp8xJsySb0mlJz7lCDxVYWeLyx1D3OLvhxeEuhIFhUPaxAV8eDVasr3CqtLNL+YHSZoE8EEfSIkX6seHhqm8HcNgFyhymyLN2M6YWoouMPD0i/KlNqVjL0P4SWSy9j7D+ySs1xWJT54tPx7t30DWC7EC5Hs4fFg0RH5Ehxbec39nBRHhr3ukEU+w/DdKRJeigGHmXk83X8AtnVIFCQDJLjekImde8edNYav2zF2afpWgXx+I8qCQ8wjDrW77r4eFazl/kB8gBpe9+9w54u3XcGtuCVpuKjLsWgH7/nSYGvKPrOEJuo0IR1Ev5HRU0yVgRBbGeV9A7ysrw5Ti/vNN4PZeXjQklU7k1ER5DWSMmmf2GzJCiZ3CZyb1JDy0+jqf2XGiYKFITC+mJS07v+Z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(8936002)(54906003)(16576012)(36756003)(66946007)(66476007)(6666004)(5660300002)(478600001)(66556008)(4326008)(316002)(6916009)(7416002)(956004)(31686004)(2906002)(86362001)(53546011)(2616005)(8676002)(6486002)(16526019)(26005)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDN5a3NZZi9PR2lKSnZLRkxwRWJFdU0reHc5SUxDSUp3L1hma0ZPbjZpZmxh?=
 =?utf-8?B?cW1wSnJjMGlsNCtUUnlUSXBoZUFYL2hvTDM0TjBKaEU1N3VIMW5tZnVKc0h1?=
 =?utf-8?B?T1VYNmE0UWNBZUxKMnMrSG1tdFhtWlpWUXV0V1F6TXhMTEEvbHRCNGhMbHZN?=
 =?utf-8?B?dk5Iakl5ZGxzTGZydEJOdjErNVhSVXYxV2lqdElNTDRveERpYm1henh5Zm5m?=
 =?utf-8?B?UDQ2YjNrTm8zeXNEb25HZFVjempkb1AzWDVCNFl4ZTlqSVlwOXFSNEVLYWRR?=
 =?utf-8?B?dHFPaWh3SzFuNGlvNHBtSGo5dEhwdDFnVzJqSTNjTzNTYjVqV2xRTHV1M1Br?=
 =?utf-8?B?UWVVdHRhcHdPeW02NWhXNFB2UGRlUXhVaStGS2ZydE1INnh6RWVSRm5tWG4z?=
 =?utf-8?B?MVRzNEhtQ2JkV3Q1aUVzNEtmTFFTZ0Y0WGxrNVY1TXc3YW9KbVhBVUU3OHox?=
 =?utf-8?B?MjF5YzNZTVp5bkV2aC90bk42KzR6bCtMQVJqVkJFazdPdFluZ2kwdmhjaUlD?=
 =?utf-8?B?QjhTZFZ5TS9VYWJjNlVyOVFmYnR5amFheXlZV3B5RnQrT29OY2VSb1BiUVlv?=
 =?utf-8?B?OUZOM3l0Ym15eEZtVHd6VTNleEIwTitLdlBMK05vS3JPa0lYdmpTWVhTanly?=
 =?utf-8?B?bUJJNDc2TVViTWJPWWRtdzZCNnluSlFVTmkwdGJlaG1CVkVCQ3NEaFYzRWt2?=
 =?utf-8?B?by9aa2xMRmVaR0RDeUZyVi93L1dlQWVNV2lLTnF0TzgxMlNVL1ltL0hEaUJx?=
 =?utf-8?B?L3hsYm51Q05yd0FDRkZSMW8xR3ZzVjJKOW93QUJkZ1oxRHZ0UHBPQkJHME13?=
 =?utf-8?B?d1dMUWVFdENuR0JkWTJUejFsSWxaOXRXYkxFQ0tNbGxwcjdwMlF6czZrMVZk?=
 =?utf-8?B?cXJCTVRWUzJNRGV1MnovSXJRSGh3TjhwZDNlR05Od3VFWDU1dlFGejk3TG15?=
 =?utf-8?B?TG52NktleEVmVDhPWDNCekdHdCtNSTNpeFlSV2sxREtjMFlpZnREQUdidWhi?=
 =?utf-8?B?WUsyRFM5cWVMODE2YnhLdzZKOXNVMk04UVpNNEVlK0FrZkRILy9aZWsxZm9G?=
 =?utf-8?B?L21uNU0vTXZpZ3dkZC9GMzhmQk40MW9HaWlrbVVyZFJHREsxSjZ2dGVROEFP?=
 =?utf-8?B?bGJNdTBXZThHbW9CejllZjJUam12ci9FSXdZSmFEcnRJY1JiK0VVTVEwUlZa?=
 =?utf-8?B?Qm5KeC9kTHVuUjR1aEZyTXJha0VPSkU4clhhSWE4ZnBNZ0VDY2wwaXBMT0oz?=
 =?utf-8?B?aFVtQzRCQ0wvNHRqVDBFOFBUUmpEaUJxNkN3bmhHWnVCeUZZUVpTVWdMOHRO?=
 =?utf-8?B?N1piU0liSkRqeWJpcjBQU1g2djJTM2MwYk5rTzNyRFVNZCtUWHZhTldPSVZ6?=
 =?utf-8?B?S0czeVBBaTMvTjhoTGFOSWJmLytWOHNtcFBweEJzSWhzb08vcXYxTUpteWZh?=
 =?utf-8?Q?ZATYG+s7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b19a0dc-e411-4979-aa11-08d8c482583f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 18:18:58.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAX1Ur5ABVevXJE9U+9itaQsPDBnv8mNPNCqS238VSTwlwZQ4nH6fPNMWSpJuLWiydKiUHAW/fowQnPv5B5rYize7zR7sBuEQbsCcksdNxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5170
X-OriginatorOrg: citrix.com

On 29/01/2021 09:46, Jan Beulich wrote:
> On 29.01.2021 00:44, Andrew Cooper wrote:
>> On 15/01/2021 16:12, Jan Beulich wrote:
>>> On 12.01.2021 20:48, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -4628,7 +4628,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>>>          if ( id != (unsigned int)ioservid )
>>>>              break;
>>>>  
>>>> -        rc = 0;
>>>>          for ( i = 0; i < nr_frames; i++ )
>>>>          {
>>>>              mfn_t mfn;
>>> How "good" are our chances that older gcc won't recognize that
>>> without this initialization ...
>>>
>>>> @@ -4639,6 +4638,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>>>>  
>>>>              mfn_list[i] = mfn_x(mfn);
>>>>          }
>>>> +        if ( i == nr_frames )
>>>> +            /* Success.  Passed nr_frames back to the caller. */
>>>> +            rc = nr_frames;
>>> ... rc will nevertheless not remain uninitialized when nr_frames
>>> is zero?
>> I don't anticipate this function getting complicated enough for us to
>> need to rely on tricks like that to spot bugs.
>>
>> AFAICT, it would take a rather larger diffstat to make it "uninitialised
>> clean" again.
> Well, we'll see how it goes then. We still allow rather ancient
> gcc, and I will eventually run into a build issue here once
> having rebased accordingly, if such old gcc won't cope.

But those problematic compilers have problems spotting that a variable
is actually initialised on all paths.

This case is opposite.  It is unconditionally initialised to -EINVAL
(just outside of the context above), which breaks some "the compiler
would warn us about error paths" logic that we try to use.

~Andrew

