Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFDF30DF1D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80963.148618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Ke1-0006Yg-4i; Wed, 03 Feb 2021 16:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80963.148618; Wed, 03 Feb 2021 16:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Ke1-0006YH-1O; Wed, 03 Feb 2021 16:04:41 +0000
Received: by outflank-mailman (input) for mailman id 80963;
 Wed, 03 Feb 2021 16:04:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7Kdz-0006YC-4E
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:04:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39dc6382-7a7c-49bb-86e3-06bf20dd01c7;
 Wed, 03 Feb 2021 16:04:38 +0000 (UTC)
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
X-Inumbo-ID: 39dc6382-7a7c-49bb-86e3-06bf20dd01c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612368278;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KwQBzrQCXw9TmyahieNF9pmX/f7wCZrpvVl8XueVxPs=;
  b=GPx0QFN+1i76066gOfsjawBINqgWcIiIUFZGynnUt8FLdFysP/zAhJCC
   rCwpG8qWUPY+2NakSH0sjzG2BPZIDKAowTk2HAqXmhwSyIPGlbdW5n6Fe
   hn6jYFPfFVy6hfmEYnx+2niLJwidCXBlgkp5wdTdIdGI0b0Qz1bjwrEw1
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: defHSGZdOoBab3I5xd7Y1qr6iEjMatyV/109R3K1Rq2KZlsQiM81fQGT5QaFXIWyN6BLhk2wSd
 e5vHGZmCp5nEYFNW92XGf2Z0dawrbyjYTjso1djNwzChfZ632cgrTC2cTp8kMQA8HuAnCen14T
 Ay1OnYRxH95OE7/pQ6euQI+ihesxIKf6giXwj/azVsx+0F8056CCYj2ec0PxD0Xx5xzDGsHZi3
 JNHTHSUxRJuz9kaug6YaYLhVRv1YPLSMI0CFx8HTJdtH0f0UDeqopB5x1w03WXWF+Vy1J9gcoT
 DkI=
X-SBRS: 5.2
X-MesageID: 36425584
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,398,1602561600"; 
   d="scan'208";a="36425584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNkHpSWjkdNixoav69+gmC5t+ehHL4MFV0feZedkiR+HU1q6UQo5LYZbpmMuw/sYWXYyD2mTSpSK3lVZOmDsTUjlhO1MaBRT5GzjQxSV1AZGKvlZOook/8e3yMvTyij82b9X7N8V0BKJIa943fTRVXTr+8xHoEEEHFBSwudPDV/avp/22OFzJ5UJLO0mehFMKfi+BlB9C7q1MSit4QR6wrMImHIfele0HHml4pYNqMd0bthwRT7e3wDKJVXxnkXHtrPmQWeAVUoQer1mEeHVcScwhifKxak16PY3vn0HAe5fwqk7y/50PhYqo6FS96SZHzr3rmLcdEQ6kLB8NjC9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO+KDfaUir45msS+7YB6vlvOLGHOXRxWbwqCsjofHBI=;
 b=K1quyAiQPoKRzyQTqCxNf/2vCYnEpKJaENNG6DG7ACUQnBlqnTBKB3H9xCkN27OfSVXmR0AttzubrcpYQD2kpIdiuNQrbebmdupaoQJtlH61AFBx9BeoLmFMeqXZLS4uvxo3zQvMAm2MVPP2U6tYoExqpIRmovTZKOEK1mZncuv4niebn/757IWunxYAkDHdZz5uV/XmxuRngfQnRUs3F8cv6ONJFJaDhTCvJU7Wcsa+/T4aNys1UdiB2g1wl7b5QMJp+/E6fPCT2SuzanaOYHVEfUFnb/LKn/hG7xDEXclDrip6vdgJfPX1XDeRkTyZ08leTpSM23FK9yOsvQBFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO+KDfaUir45msS+7YB6vlvOLGHOXRxWbwqCsjofHBI=;
 b=e7atVh2VmEPqklCsLnSdDjjgleoc5G9YGknqARPo1z9jM4WeEQBT3g0NfvM7aLDR72uHUqUIM0xgynR+hH16yh3x4fzykZLMP8HQAEqZXTGbITz/lN7nQjjJc72bGOLMDHYZ1xv04n6bD+d0GlU1vh7sL8cf4yIpLWGK1LPeFUQ=
Subject: Re: [PATCH v9 02/11] xen/domain: Add vmtrace_size domain creation
 parameter
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
 <20210201232703.29275-3-andrew.cooper3@citrix.com>
 <7a27c313-2c7c-8394-3749-e2f4d671fdab@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c6762201-eceb-39c1-fa2a-4bf2af5e0758@citrix.com>
Date: Wed, 3 Feb 2021 16:04:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <7a27c313-2c7c-8394-3749-e2f4d671fdab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ed44add-0c0b-4d4e-fd06-08d8c85d6542
X-MS-TrafficTypeDiagnostic: BY5PR03MB5125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5125D2E53693102E89C57710BAB49@BY5PR03MB5125.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QUv354zA6Dff/ktP86uKZPXqVWTW7Wg116NX97ZZ/mRr4ZETi616Po55oDIUFluLpBkoMZRGjBbYptAWuJjSPJdIGhUH8f00Lr6wOSsryswfTZB5YCiBcHnhXoGm/Aug+WhX+I217+Hlo46E97ZsKnIGXf0LG0Ku7i0bsfTJU/BVI5YNWkdEOxGLXcrWQh3EOuf5sg4BpLf66YU+D2P1q0V8ZsLDq+eCMPPX0hYRRby+1NPNr1SUzM76cbTmqPV8pq8qmG+Q6lxJY6iMa7GDebIjWh5OBVgYkQtEIopfDT8NewyD4M8/5Qs0l6Fs8I1/SBp897sLM12WJHrSvRlXussUWW6o5LclxbU58lTpDCCTeRQeyA2W42B8sfxrmTO1eDV6MWLzGkpvAD46RdR46MYh2VSqfk3Go8WjfX9FpFmRqLa2Rl51WRHVcA0srhdPapcM5RbVvz3kySyzacE8P0mUD23aVcFCLRPApj/wjgWINuXPco+0YQLTuPS1vpHEfMZAEQAOZQL9Rg8EhxWvdAp7Ga8RnmfEzfF/Nu2kLWQ/sirg/wVJpmp4Ld/INdNtTmSGestbIuAmKO5Ja1HY0rP9M9SKyRuUJcaVOvyts8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(2906002)(8676002)(5660300002)(16526019)(54906003)(6486002)(26005)(36756003)(53546011)(478600001)(316002)(66476007)(2616005)(6666004)(4326008)(31686004)(31696002)(83380400001)(66946007)(6916009)(8936002)(66556008)(16576012)(86362001)(956004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFpybkk3TlM5czFXM1RhTnZibE4rcXA2ZytRc0RTVm1jYnhIUCtlSkREaytR?=
 =?utf-8?B?OWhyR2UrOE9KMHpzaEhtQlVRUEdaaURNTUZGRWxnRzYwSGNzV3RKYmhWdlhT?=
 =?utf-8?B?L2g5ZHQ0YTM3OHYyRmdTUWlkSWg0elRVcnZJdVJRMzdhUFpObGFDaW5jNHNj?=
 =?utf-8?B?amdQbDNjRGUreTlGaEl0b0FFS2lCcFJtVTRIMVp0a3F5YXgxeXpQcnRpS01B?=
 =?utf-8?B?QTdRL01lNEhqNVlZOHpUSFVWRnZNMllER3J2VTlPU1ptczY2MDkvNkhJSTQ1?=
 =?utf-8?B?Y2NoQkJBRStGMEFsTTllc1FRU1BpT01td2Z1dFZlREozZi9QamhZTXFodjBI?=
 =?utf-8?B?VVl4RXlCYTNmVi9hVnFnNDlHWmhCVE9QOVJUMVlVSGkySGhpd0p1Q25kVndn?=
 =?utf-8?B?LzRNckpDN0NndWVSUkxxYk1Fa2MvN1o2S0JJd3B0NzdlNHdXNFB4aG1IQlFI?=
 =?utf-8?B?dzJTMlJJbnZncFVxWWdlVHFzYXU3VEJwR3U5NFQ4UTB1Mzd5MlJvUkhKb2xh?=
 =?utf-8?B?ZFR6Rzk0Wi9ST1JkdlFmSGM4dDBUYjUxelJ1aE1Tb1Avc242akVJZVRXbWN3?=
 =?utf-8?B?MzRIcjdqdjVhRW8vZkp3TFMvTlUrbm5TV3Z2NlNONHdIbGdzNmN6dVZtSExC?=
 =?utf-8?B?cGlha3R2U25HNVI2T20zLy80UDVIeGk2K2UyaGEyNmt1dzRDUnF1cjY3ZzRS?=
 =?utf-8?B?YTE2QkZ6MlhPME9FdVl0bkVzSXo3UFpBVFhNcXgrNWI1OTkzWDNCK2xBNkNz?=
 =?utf-8?B?aWk1K2FBNXNjWEhPSVNNcU4zTThEeWNzckV4bmlaTVoyQVZKRC9Fa000dnlj?=
 =?utf-8?B?RDBqOWtpcHNucVliamVhV011RnFmYnhwdm1pUlNmcC9iRlZDcmhYVDZ2ODNy?=
 =?utf-8?B?RytiWmVETGlPaENHc1Z4RTIyUTN5Zk9NYTlrUmsxemFuZ1F3TlpwbVJOcHNa?=
 =?utf-8?B?RE9DaVlYaDJ5bm9xbU9MOWFNREpNellJTDFWbVd3bk1QWCtiL1dnVkIzUkVw?=
 =?utf-8?B?a3lCbjZzNHpXYklZdzlZKzllMDlmV0FuT0JDbWQ4NlJMaEVrV0tqTCs5Rld4?=
 =?utf-8?B?SzJHQjNuYmtudmFCOVBJNEtzcnF5Y3hrQVZ2bTJKUjFFZFRwSENKVXZBMllv?=
 =?utf-8?B?MitMdkY4dFVEMWlsTURlTG9EZHhtZmRxYnZ0Z1dKQ0MrbzBOWG4zSHh1bDJv?=
 =?utf-8?B?Z0FnR3oyaitndVJ0NHZWY0xzUjVxaEFaS05vVHpuVFVWb1Y3Vm5DN0gyUTh6?=
 =?utf-8?B?YWdDejdxWU1YRHJXUnEyaEs3ZmNNZ3kzbkcxNEpoR1Q4NlR2TDVKOTJPKzda?=
 =?utf-8?B?azNMWEpHR2pyeG9aRWhjRjNSRlFxSEQ5OXo3c3B0bEdyMVZaaFU4K0RPM1Fk?=
 =?utf-8?B?NEVRQzdOR0p2UGhOVTJHUUlJSzdnS0ljMkl4V2hWQk5uc2EwWk92MXN6cHdu?=
 =?utf-8?Q?IxH3zpfK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed44add-0c0b-4d4e-fd06-08d8c85d6542
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 16:04:33.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLQwmJJrNwsnLwKIRhKJfkiPi55n92zAoahBsEbDyxnKkWopJ/5YpmnsWDOprsMYPuUCBdA38a04BAAnWp0tt065RbJUU+vPNHJhC5yT67I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125
X-OriginatorOrg: citrix.com

On 02/02/2021 09:04, Jan Beulich wrote:
> On 02.02.2021 00:26, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -132,6 +132,56 @@ static void vcpu_info_reset(struct vcpu *v)
>>      v->vcpu_info_mfn = INVALID_MFN;
>>  }
>>  
>> +static void vmtrace_free_buffer(struct vcpu *v)
>> +{
>> +    const struct domain *d = v->domain;
>> +    struct page_info *pg = v->vmtrace.pg;
>> +    unsigned int i;
>> +
>> +    if ( !pg )
>> +        return;
>> +
>> +    v->vmtrace.pg = NULL;
>> +
>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>> +    {
>> +        put_page_alloc_ref(&pg[i]);
>> +        put_page_and_type(&pg[i]);
>> +    }
>> +}
>> +
>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct page_info *pg;
>> +    unsigned int i;
>> +
>> +    if ( !d->vmtrace_size )
>> +        return 0;
>> +
>> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
>> +                             MEMF_no_refcount);
>> +    if ( !pg )
>> +        return -ENOMEM;
>> +
>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
>> +            goto refcnt_err;
>> +
>> +    /*
>> +     * We must only let vmtrace_free_buffer() take any action in the success
>> +     * case when we've taken all the refs it intends to drop.
>> +     */
>> +    v->vmtrace.pg = pg;
>> +    return 0;
>> +
>> + refcnt_err:
>> +    while ( i-- )
>> +        put_page_and_type(&pg[i]);
>> +
>> +    return -ENODATA;
> Would you mind at least logging how many pages may be leaked
> here? I also don't understand why you don't call
> put_page_alloc_ref() in the loop - that's fine to do prior to
> the put_page_and_type(), and will at least limit the leak.
> The buffer size here typically isn't insignificant, and it
> may be helpful to not unnecessarily defer the freeing to
> relinquish_resources() (assuming we will make that one also
> traverse the list of "extra" pages, but I understand that's
> not going to happen for 4.15 anymore anyway).
>
> Additionally, while I understand you're not in favor of the
> comments we have on all three similar code paths, I think
> replicating their comments here would help easily spotting
> (by grep-ing e.g. for "fishy") all instances that will need
> adjusting once we have figured a better overall solution.

How is:

    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
            /*
             * The domain can't possibly know about this page yet, so
failure
             * here is a clear indication of something fishy going on.
             */
            goto refcnt_err;

    /*
     * We must only let vmtrace_free_buffer() take any action in the success
     * case when we've taken all the refs it intends to drop.
     */
    v->vmtrace.pg = pg;
    return 0;

 refcnt_err:
    /*
     * We can theoretically reach this point if someone has taken 2^43
refs on
     * the frames in the time the above loop takes to execute, or
someone has
     * made a blind decrease reservation hypercall and managed to pick the
     * right mfn.  Free the memory we safely can, and leak the rest.
     */
    while ( i-- )
    {
        put_page_alloc_ref(&pg[i]);
        put_page_and_type(&pg[i]);
    }

    return -ENODATA;

this?

~Andrew

