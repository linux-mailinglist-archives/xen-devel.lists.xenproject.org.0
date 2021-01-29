Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A893309060
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78562.142965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5cmJ-0002J9-Fl; Fri, 29 Jan 2021 23:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78562.142965; Fri, 29 Jan 2021 23:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5cmJ-0002Ij-Cf; Fri, 29 Jan 2021 23:02:11 +0000
Received: by outflank-mailman (input) for mailman id 78562;
 Fri, 29 Jan 2021 23:02:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5cmH-0002Ic-NX
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:02:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ceaceb4-8130-44c7-8389-3872a3960b57;
 Fri, 29 Jan 2021 23:02:04 +0000 (UTC)
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
X-Inumbo-ID: 6ceaceb4-8130-44c7-8389-3872a3960b57
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611961324;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RtBdaOytzkn5QAEY161a5Cz7G+1743uz/s/LirWdrzc=;
  b=QUjCKGVuBQe8oquNk0s5S6XJS7C6h0H+sTBEoAxmBVswecO6kQJ8wEHl
   awgjJAr4sVqN0SMZGjn9Ke52CV4ObnDH1E9lsm7xw3DWiTOd4E+8Gu8mV
   OB9ESd4svCfiK+QPjk4qMJ0PimyISghzixfx6Ez+d47zoy2ABvEcpBJMW
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6aGTn40yE2fqDiQYdQFF8ucP4CDwI+SVAdSl+TIjCkz04/Pb7dMDi2hE5gJgSTEos8l0eN+3/Y
 oAFhSQSK+y+iH5d0ImyXwWZiNAZ/OIoIm5d4CBuVOe1Lk6Jyi/OD3duzKb8N1965/pD15HFaRL
 K+qU9nQFDImSV4tMB6IdNqrdbe81bB8x93Ic31vujHN9uOnc8kRUoE0Kf7zZVR6z14mltyFA9T
 0pwtG8yO1zLHB35knIpulIhh3CQhZ4846PHzA0pKaoH+vPgCJX+6VHyWkgsXlCXnj7s6jB/AP/
 BUY=
X-SBRS: 5.2
X-MesageID: 36393993
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="36393993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRKqjIQlxQIEnEIHXPWzX0b0Px9s+Mqme5zy4spFnYYO/JPxXfVgWUascUvC6NC5vHOt1y1A23DyOIzqHNmbhipSjKFX4fxXYZN48946r+OHrzcZjLNHDc2bp0Dle7oQDLrL6k5rGhwJQLtAMJuC52UOWZ18VXhL3Uy6x8TmHwBWjKUiSPs3hJQ850o+PPblGzmJqT+hw1Q9ybPV/FGeAq/JDs0EE1XXZcfk6/CD/m69B5gZM3SlmrKaUo7261d4Xi4vtjZEBXwpOY+zIxPbX4jKMXMiatoRZOEJXUE8ZKtf/e/iUZeALIQ4QANWZLMXT2uVqwEVDKgORmVew8xutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg2onkDMrLLRRUUJNjNhLzz+Riekt1UCT+ge9+sPAyw=;
 b=T50gfzr9FJCGen/eqMX1cghxvloTQ1eyqbPo4CZiKIMJ5RjCsrKmGQQwjv991GBgMHGjw71VVjXxWA/KJOGqFosaAX3t6CgepmVLBRbqyZlpKIUtiBhIbKm32fbNU72XQ65RkWpw57Kf+RI6t0TYqaifqLvhY03n2wxcMcmoi9MJpi8+uLMt2CdRNJs34xRnJMGwMqAwfwIr59dsIek9qDyS2v72KvgB/8eFs+uX/k9nDq4ZtYkSckAK0jM8oXBsJgXDyYGbWX/4NjGeOp6e2n0cWBoEhskoT4l7ibX/baZ1oBeQw1X0MjTPU38AmUQP7GoN5mPngcvHTlRSH1dfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg2onkDMrLLRRUUJNjNhLzz+Riekt1UCT+ge9+sPAyw=;
 b=gw09xN0n1xGo33CLF9TKIrjKVFPGvkUgjiUj5Ml1AopWojasHFXkauLzpeFqtvtaUGcl7RCoNjXxzbB/BEdx4HNRsp4DKe6QULGmI16SAxBW+cutyL613x2QDTQKSwqG/VSCmsVtS6VpTbiHpeQfbVeoF8qdeTPMV9iImMzVmh4=
Subject: Re: [PATCH v7 06/10] xen/domctl: Add XEN_DOMCTL_vmtrace_op
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-7-andrew.cooper3@citrix.com>
 <04f34381-92b4-7965-8c6f-76cfa2312f2a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e436a964-7cf4-0085-2939-358c2ffd3ca4@citrix.com>
Date: Fri, 29 Jan 2021 23:01:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <04f34381-92b4-7965-8c6f-76cfa2312f2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307e0900-bdfb-4401-7095-08d8c4a9e2c3
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5568:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5568EC2C62A8A9F96058E284BAB99@SJ0PR03MB5568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3IY31OB2jf5AckZopUqzWba7egbsVY+sY54YeAl5r+qpgJEeoT0NViOJ2VSjBlPXTE2KJu+361RCY8x0eRiCIHl78bQc/G58dyOy3tGXplNlosxL3H2TBr40OwBNpfvSgEl7ylN1HgCcBPk5SU12fcDC0wU9cmdDo3XVwdlC6esotFAdXTPouN6KrZFnau32E6O4kGLbydQjLQEBV99BY2N03RdzcEAJVDMvu7orePatxIwZIDi0Eqhgyc7QzupuyO2hpfzlTwuQSvsge2nz9fZpykUWnTBzymjwP/Hcag0ttNWfF+kKe7q2NXX9AFcDtYXVkCvTKgLoTvmN1mQYoZuZG+j24SPg6GxSxD/6i5jzHu5jF3Zzqfu4FxiE2kIWSGHmqDyJHdP5HWX/6oWlzERvnqyStmSS9YK61G49t+LEJKV6Q4soxhGlEs3O25KUfIOQVdkY7rsBKJoU75ZMEWXtHdNjbbmbVMcBiIqP9srfzVPZfpjaIWo+NA0AX4VEIVpbcHaBdmyO73giUl4vb4HIhoudxDjqEKXZ+XNFcCXBMHrd9WakmEgqMLTkzGs0lpsPJlHJQnrxePxBT3I8CxxJ9O3mo/1Bu8HSX/lx7nM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(4326008)(8936002)(8676002)(6666004)(36756003)(6486002)(83380400001)(956004)(31696002)(186003)(16526019)(31686004)(66556008)(66476007)(2906002)(478600001)(6916009)(5660300002)(53546011)(66946007)(26005)(86362001)(16576012)(54906003)(316002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlhVekhFbHJQbGNPSkhHVXp3dGErcGNhWFpZbHFiSWZqMllSTEpQTWQxZGo1?=
 =?utf-8?B?Vk9Lak9zVUtncmZCSWJXK2lYL0F6VU5KZXlnQWFNRExnS0dOcklmZkMwMisy?=
 =?utf-8?B?VlhsOFI5eVUzMU9qdkFXa0FVdDl6QTNJT0d3R1RhMW1ERFJvNjNtUDUxU1FR?=
 =?utf-8?B?NmRaRy9xc2pEWEJRQkhFQ2JMSks2cDdZTEtSVkx1dkpNcHBXeEgvQm13VDVv?=
 =?utf-8?B?andXRER1UXZTQk9FKzhBSVBLTEU2QTFvRGphRVBJc01ldTFsK0VFMk91Z1V1?=
 =?utf-8?B?UUQ4TnM0aDJsZlY3ME8rVS9FMTVLS3lTQ1Zia2pqVEZ5UlVmek1UMloybDQz?=
 =?utf-8?B?eE1aNW42RER3ZmdXNmtvNzlDemZ6VFcxWDNiQkxQZm14NlM0Z2lzTjZjVzMy?=
 =?utf-8?B?eElsMUduNFByL1o3dExkTDJ4K0hFL2ZERTV0UTJaUUZXK2JCeEtySVREUGNI?=
 =?utf-8?B?NkU2V1dIdXgxKzMxakxZdmZ1ME43c3ZpMVRtQythUDR0aVdMWDB0dUtQdER6?=
 =?utf-8?B?a2FEblhsSkNpRzA4Mnp0QkFmb2hjL2gzZUpyZWJad3hmOExGWGxiRkNYb2U5?=
 =?utf-8?B?Nm5zaEpBa0U2SU95VUJvb3Q3dFgvMXROTXRKc0ZEcDdoOEpRbDZZVU1iQ1oy?=
 =?utf-8?B?SFFCblJsZmVBT05NL2J0L2ZRZEVWR1RFWjVMcXlPUzJLVmV1b21LWS9CTlJj?=
 =?utf-8?B?dWJyalMyYzUwZmtCL202Vy82UXRJVFRQZ2hwSXEvUmtjYkVpNmkyYWNTeitC?=
 =?utf-8?B?d25RNDZUWU5KdEhieEJiaXVjeFZ5T1kvYVpKNFVHWGw2QkY2SVdDM3pML2t0?=
 =?utf-8?B?RmNPMTdpUzRBNkhUdm5ZdmM0ZXY3SUZaM0lVUFMvNG4waG1GbTFYcVQ0Lzkw?=
 =?utf-8?B?Tm9mb0pReFFRNVlXN0pTVFFTTCs1RjdWZEhoaEhkOE1lclNpYW81NURDN2Ri?=
 =?utf-8?B?STIyYlYrcnVFdytTTmZxY1ZFVDUvTUdaRy9uU2hsWFRORG1oV01PWFZrZ0w4?=
 =?utf-8?B?NUZkYXEzZUEydFhzVlpJRXIyYzlBc3BYd0ZvSGVrS2pXZktkdzFGbkN1T3p3?=
 =?utf-8?B?ak9BQ1FhVnBlVGFBdG9HT3BsaWpVV2MvRFdkWHhVZU1hY1Y2Y3FPNG9URjNv?=
 =?utf-8?B?R0x0czFYODNINnFHNE81dUxxTC94Uzlubmx5STNERzJTQXFVTXI3YnpQWTRT?=
 =?utf-8?B?OExsM0F5N3A1R3YrbEhYYnBlUmViK2pwR0FxZjZZaHR5bE1WcHY1aGwwNWFE?=
 =?utf-8?B?cjBVcmdoa29ieXk1eWE3N2doZi9reXFvaVc0b2ZWMXpLUi9XSm5ySDVOSVlD?=
 =?utf-8?B?cDhHL3c5cUJNeXhCUGJsNGh4QStpNmthbjhHQXdQRzFzcnM4SkNqYzRyZ3NX?=
 =?utf-8?B?UmRUSWxUZ0ZVMFNrdlRIRkQ5dkZKQzFzZzJML0ZMUUgzbjRPY2VGWGp5Rnpn?=
 =?utf-8?B?RU4vWVcxTDhKckRORHRJa2tFVm1MZjZhWVplMTh3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 307e0900-bdfb-4401-7095-08d8c4a9e2c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 23:02:00.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxTM5LIrMyWDv2EI3POFe9+b1PaijhbOp6BvltUuuP50bsGzNK+7BWjTHDmdv/RFJmtIv4oLGr9NUb/Pk6kLeagIJ6O9PSuUAqzsLFsXrjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5568
X-OriginatorOrg: citrix.com

On 26/01/2021 14:18, Jan Beulich wrote:
>> +static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
>> +{
>> +    struct vcpu_msrs *msrs = v->arch.msrs;
>> +    bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
>> +
>> +    switch ( key )
>> +    {
>> +    case MSR_RTIT_OUTPUT_MASK:
>> +        /*
>> +         * MSR_RTIT_OUTPUT_MASK, when using Single Output mode, has a limit
>> +         * field in the lower 32 bits, and an offset in the upper 32 bits.
>> +         *
>> +         * Limit is fixed by the vmtrace buffer size and must not be
>> +         * controlled by userspace, while offset must be within the limit.
>> +         *
>> +         * Drop writes to the limit field to simply userspace wanting to reset
>> +         * the offset by writing 0.
>> +         */
>> +        if ( (value >> 32) > msrs->rtit.output_limit )
>> +            return -EINVAL;
>> +        msrs->rtit.output_offset = value >> 32;
>> +        break;
>> +
>> +    case MSR_RTIT_CTL:
>> +        if ( value & ~RTIT_CTL_MASK )
>> +            return -EINVAL;
>> +
>> +        msrs->rtit.ctl &= ~RTIT_CTL_MASK;
>> +        msrs->rtit.ctl |= (value & RTIT_CTL_MASK);
>> +        break;
>> +
>> +    case MSR_RTIT_STATUS:
>> +        if ( value & ~RTIT_STATUS_MASK )
>> +            return -EINVAL;
>> +
>> +        msrs->rtit.status &= ~RTIT_STATUS_MASK;
>> +        msrs->rtit.status |= (value & RTIT_STATUS_MASK);
>> +        break;
>> +
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    new_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
>> +
>> +    /* ctl.trace_en changed => update MSR load/save lists appropriately. */
>> +    if ( !old_en && new_en )
>> +    {
>> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, msrs->rtit.ctl) ||
>> +             vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
>> +        {
>> +            /*
>> +             * The only failure cases here are failing the
>> +             * singleton-per-domain memory allocation, or exceeding the space
>> +             * in the allocation.  We could unwind in principle, but there is
>> +             * nothing userspace can usefully do to continue using this VM.
>> +             */
>> +            domain_crash(v->domain);
>> +            return -ENXIO;
> I don't think I fully agree with the 2nd half of the last
> sentence, but well, so be it then for the time being at least.
> Why could userspace not decide to continue running this VM
> with ipt disabled?

Technically speaking, it could.  That wouldn't malfunction.

However, it would be exceedingly poor behaviour.

One major limitation IPT has is that it cant pause on a full ring (or at
least, not in any shipping hardware yet, and this series works back to
Broadwell).  You can't just leave IPT enabled and let the VM run,
because the buffer will wrap and corrupt itself.

The driving usecase for adding IPT is introspection based.  Frequent
breaks, combined with massive trace buffers, is the best effort attempt
not to lose data.

IPT is a niche usecase - it does come with a substantial frequency hit,
and lots of userspace complexity to do anything interesting with. 
Anyone who turns it on to begin with has a usecase which totally depends
on it working.

>> +static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
>> +{
>> +    struct vcpu_msrs *msrs = v->arch.msrs;
>> +    uint64_t new_ctl;
>> +    int rc;
>> +
>> +    if ( v->arch.hvm.vmx.ipt_active == enable )
>> +        return -EINVAL;
> Why is XEN_DOMCTL_vmtrace_reset_and_enable not permitted
> when ipt_active is true?

Because absolutely nothing good can come of userspace and Xen getting
out of sync with their combined idea of whether IPT is active or not.

And I really don't feel like doing an ipt_pause reference count, because
there cannot plausibly be more than one entity handling the data.

>  And, considering ...
>
>> +    if ( reset )
>> +    {
>> +        msrs->rtit.status = 0;
>> +        msrs->rtit.output_offset = 0;
>> +    }
>> +
>> +    new_ctl = msrs->rtit.ctl & ~RTIT_CTL_TRACE_EN;
>> +    if ( enable )
>> +        new_ctl |= RTIT_CTL_TRACE_EN;
>> +
>> +    rc = vmtrace_set_option(v, MSR_RTIT_CTL, new_ctl);
> ... this is just a wrapper around a function directly
> reachable via XEN_DOMCTL_vmtrace_set_option, why any
> restriction at all?

This partial alias is a consequence of the split between the platform
neutral, and platform specific parts of the interface.

It is by no means certain that such an alias would exist on other
platforms, and passing TRACE_EN to set_option() falls firmly in the
"don't do that" category IMO.

~Andrew

