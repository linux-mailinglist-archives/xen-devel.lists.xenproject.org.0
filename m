Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3902FA5F1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69872.125219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XHb-0001ym-7r; Mon, 18 Jan 2021 16:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69872.125219; Mon, 18 Jan 2021 16:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XHb-0001yN-3R; Mon, 18 Jan 2021 16:21:35 +0000
Received: by outflank-mailman (input) for mailman id 69872;
 Mon, 18 Jan 2021 16:21:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1XHZ-0001yF-1H
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:21:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb520848-f151-40fb-9017-131c38d866f0;
 Mon, 18 Jan 2021 16:21:31 +0000 (UTC)
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
X-Inumbo-ID: cb520848-f151-40fb-9017-131c38d866f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610986891;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mQml/D+M4+pXOEsa+oBOma++l7MivT0QxyH2+FK0ZVY=;
  b=PNit8di2NJSJIITVeDXbjv3B4lFAK/EVynad21ddukaAiOTGrqe6rVcK
   yp33FeqvSJWAPjqNMyspoH1lPaI3jrCZkcnNrGwXmDWIo+6XhVe7+mGBV
   XtvJviUspYqI4v2NudipGhXPTu/ZIjq2GokA+fqFVP+/CHPwkprmmkA7T
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9H0UqI1NVOtx9dWOeGjOFJHweE9HpCr8J4LPDqBCk+spLkw3438hpCO6rvw9BKQGnrZX2VBsjT
 zLQOJNo9Stp9kDKDovq6K7ph/ZkqOtvaV8fBDIOYyFUhXeo9zoOJ0vJKyeLPhkz8osloTQZUpz
 u+PN/jhE4iKfq0QKN0/6NbFw03jiG9uD5il/ZGsPqtSUoRQgY8fltERB/VOkNVo+pJJRXSvNLu
 L0URzE69KtfeX8kAF8K7847G2cyFnGEtNdpqUSgdcGnKtVp3mhNv/IBN+w2b7Uc8NNQ5smanWW
 iNM=
X-SBRS: 5.2
X-MesageID: 35529685
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35529685"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqdZ/tFtc6v6wy2rvfC9wWFUeytS8MgOeiN60U5E2VqLSEnG4FvEOqqRN6aTm7y8ak8WJIexwDHCCh1T2BiVgFqZ1yicB6kL6bhU6JRiU6YXP32g6DhpreV9QrGoKSpl0crU/T0OG2r5aJmx8yTfm6iunoR4r1HYeyS86r8jcYuRK78Was5t8Q7hCGynzu7r2bDISuWNLs5PRbC+j2IXX0ifBk9Xd9qT5Qq1hF/tt6UwsZGgPVIHsGcqSdqGVx+w8wFnCZ0wr1oOPkvAOrmnn6cQJrL9K/SUbjGddxcgG1UWif4yXfedJpsdWoMSpruohaBHEIFmpJ12UP8M8vmMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUE5KSfQ1D9QkJttZtVwfLYaRSpznM56rnpe/sFqHkI=;
 b=NM+yyEtCBV1G1EAH10FyHKU3HPlAQEAjwbAxhhlOPGEGFSOdkjau8INaUAE3EZuZW22WcyNp0pwnnN4hrNHtXclGOZoNe15EEztFX/2Fs4D0bfpkpzbi4W9icm6xtSIwDQK4vZMiHn5ys7t8p4E7zev+SCiAuPfmwLeK8eTmEK8zeMz3NVjitBNZfhRHtEi1FQfqCfjJsmlDRPGR/90O9YDt1gTUn1IOhBL3b0tXbHUyCx+tYxWN+iq8troO0JhLEICOy6PMN9JuwcXrrXVFdqxHdlmMwVYuvy/GbxKCGm+1egCJynbXhINhnGC/w1+z0rftDVK9Qs4149PnFHN8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUE5KSfQ1D9QkJttZtVwfLYaRSpznM56rnpe/sFqHkI=;
 b=IjVHXmiB98/zjTVRFhEQVg7JhWxxiQ5h8ZZcPWrVJqrArYi1slffm9k2xSnJJGA8aNVO3dGQ37SJLHSK6gBvc4cDlrr8wUL6pyVRvaPgSwqel0+AsO5l5NFhJgTS+66uxS9m4DEBeB0oCtEMNvlbaTE+E4BqN9zELgX05U43Y6o=
Subject: Re: [PATCH] xen/xsm: Improve alloc/free of evtchn buckets
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210118150623.29550-1-andrew.cooper3@citrix.com>
 <21a82f0c-2267-0891-0f4a-0fdd9feec42c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e584b28d-a438-fd1d-d908-3b70ffab9309@citrix.com>
Date: Mon, 18 Jan 2021 16:21:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <21a82f0c-2267-0891-0f4a-0fdd9feec42c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d61598ac-a21f-4af8-3083-08d8bbcd1b96
X-MS-TrafficTypeDiagnostic: BYAPR03MB4055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4055EBBBAEC0450ED2C33EEDBAA40@BYAPR03MB4055.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cupDpGY98czm1pdmPnXhw36dxM+PMLdNZB5c95rOgvXgAjPS8Zh2L/0BCmCixwKLGRZ1rL+8WLmoLdBZTPHgn0dL1R4rT2sR0mNxAO9Np3j3vOK8eBScMCIB5596UhyjyBINJt/0HFyoZUc3vOBj/HklFwVuLdXOj1lVUvE3GO3aKBy6icNgLp4CNjdn/79vAck40JOoE280m00IGnhQXldAdjWU8JhbS4qBpiOGU+FUcoCQdCUeZ7orlnfDUxgoPCIOSz5elCo0IPzRJnRS8ZX85msb0zZjwho2kxvGkERBT8b2C5oHHIIPMcsgqrdraAmpBOTEVlTX7jvKBQXfynUWZOprooAm0O58ZSYI+NJzScr9eOgXAFET+hUc+lEoG/HDDqGqYazMKkb2952rh8cINl1r0dfAHGkejf1agkjaAPnS/w0sIFUlNKEEeGOmFcgszhjVih8siqub1HfSvwZsJ9C1bLbvGMBf7597d14=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(26005)(6666004)(66476007)(186003)(316002)(2906002)(66556008)(2616005)(8676002)(478600001)(16526019)(54906003)(66946007)(16576012)(36756003)(5660300002)(6486002)(956004)(31696002)(83380400001)(53546011)(31686004)(8936002)(86362001)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VThIR2JWWXpMK3pWTlZHM0hTN0ZmU3ArcTNBUVpPcDJ3VVNkbDR1b2RqWnN6?=
 =?utf-8?B?eDRBZ2d1TWFhdU96VVR0YStJaStIMmdheEJOZm5xQkFESU84SW1lL3czN0RQ?=
 =?utf-8?B?emhlWVgyRnJwZXgrVDNyUE9WampNMXFtWHR0QWdweGhxdkx0RHB3dGlhdThE?=
 =?utf-8?B?ZDFqY1prK0F1QlVJTWw5ODF4dTU3M21SRDFVZjdTZElmQ3IwVm54T1J1S3M4?=
 =?utf-8?B?TGNXUTRMaGJYSFYyeHJ0eTFUL045ZFVXcGNtQkVFd1hvKzFud2RuN3JGcUtm?=
 =?utf-8?B?dHptcUZ4MGdOYW4vTUhvYU5mUS8zem0zblVnbk5xUDBiUVBVbTd5b3Z6WXgy?=
 =?utf-8?B?aDczQlZGQmRZN3FSZ2EvYnZHVk1McTcwdWZjYlhia3BKWnQ2M2dBZVNPejZW?=
 =?utf-8?B?ZmhSMWtHa3pxYUJTQitOM252UjZrRUFCRWxiSFNXRmFzWHVpNTM4STZ4ZDc3?=
 =?utf-8?B?bFZ2QW85VGFXbzBNTDkyaCt4SjBzNE5PdURiU2tUMThVRzhVb241NFZRTUI1?=
 =?utf-8?B?VjNHNGpqVHc4cXJ5dFhRcFY3TnloYlJQY2lSNzJZT2grcGhhQmVKVVhmZ3dz?=
 =?utf-8?B?MXVsRXdJMzlmQkh4LzBnQTFVbjViTEk1QlVMZTNFclJHMlVNYjhaS2JsZXVo?=
 =?utf-8?B?czA1aFQ5Q1YzcVloY3NscjBRNzZELys1cDlmQmRKeEthemVmQ1dTaHNuWVlj?=
 =?utf-8?B?dWU1QnN2ZUpDZndYbFJKWTJwWW1VK0tXZ3ZiV2U0aTZZT2hVVFZ6eW5SaDhB?=
 =?utf-8?B?ZUg4K2crYTZuWHl4L1hUUFBGeWlvKzZDMUVFUHRQdXVMUzlEV2h5RmZJMlVt?=
 =?utf-8?B?T2ZXMi9JdVQyYmlOR3dGZmZ3TEhLdnI5N3pESEVuVHFRTzRkVCs1Z3BCQmQ4?=
 =?utf-8?B?NTlMK2hKOVRhRHhxakJDb2xKV2dRdktaMEovRjIwU0I2a0MvWjdEVitpQ3VO?=
 =?utf-8?B?S3JSME54YUY2VG44cnpsRFZIYS8zMkFSbjZXS0FKcDdDVi9Sb3MwRWV5VVht?=
 =?utf-8?B?V2JZOVVIMHA1M3IzSmJET3VDd1lWZVgxRWFUVVJhMDh6Z0VUQ0htVWYwbTY1?=
 =?utf-8?B?a0FLcEJsUzJDVm8wZ01rdEdNQ2gwUEcxNzhpSk4wQThWckt6Wnc1R2hXaTZl?=
 =?utf-8?B?RHFXMCtyK3VFRlBtSitCdHpaQW1pWnpMZk1BQ3dzcy9yRk5jSmx5MXBLeCtZ?=
 =?utf-8?B?bmE2aFk1cjFsUzRaRVpOUUZzN0UvRk11ZzNzVkhXT2IwOGprcHlaaUNxb0xT?=
 =?utf-8?B?c21Ha3p6TVdPNWNmeXJUMExhaXRDVnk1dFYzVzZqVWFSUy90K0lpL1FzZ3JE?=
 =?utf-8?Q?dIFXZe+lu+EdTM/WRxDRt572yBby8xhFdd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d61598ac-a21f-4af8-3083-08d8bbcd1b96
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 16:21:28.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np1Qgrc0WpGvuFEcvmne2VHiqB4+q703H1EAFNOSGJuFdF39g/aAvRIwQRdDZYSJwbdJYTAEJCVry1xc6K44RJF2YPdl5K4PQAKWxgOViVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4055
X-OriginatorOrg: citrix.com

On 18/01/2021 15:31, Jan Beulich wrote:
> On 18.01.2021 16:06, Andrew Cooper wrote:
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -147,6 +147,14 @@ static bool virq_is_global(unsigned int virq)
>>      return true;
>>  }
>>  
>> +static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket)
>> +{
>> +    if ( !bucket )
>> +        return;
> You could avoid this since flask_free_security_evtchns() has
> a similar check. Alternatively it could be dropped from there.

I considered altering both.  However, all functions like this really
should be idempotent.

For this case, the compiler can drop the check from both callsites, and
its safer if the structure of the callers change in the future.

> But even if you want to keep the duplication
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> One further aspect to consider though:
>
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -309,12 +309,12 @@ static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct
>>      return xsm_default_action(action, d1, d2);
>>  }
>>  
>> -static XSM_INLINE int xsm_alloc_security_evtchn(struct evtchn *chn)
>> +static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn *chn, unsigned int nr)
> I wonder whether we wouldn't better identify the difference
> between pointer (to individual element) and array by writing
> this (and others below) as
>
> static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn chn[], unsigned int nr)

In which case want we want is (unsigned int nr, struct evtchn chn[nr])
which I think is the C99 way of writing this to help static analysis.

>
> I think we've done so in a few places already, but of course it
> would be a long way to get the entire code base consistent in
> this regard. Plus of course while this works fine in function
> declarations / definitions, it won't be possible to use for
> struct / union fields.
>
> Also it looks like this and further lines have become overly long.

Everything is long lines in this area of code.  Its all due an overhaul.

~Andrew

