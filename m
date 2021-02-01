Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28730A830
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 14:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79865.145562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yph-00066L-Ef; Mon, 01 Feb 2021 13:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79865.145562; Mon, 01 Feb 2021 13:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yph-000663-5o; Mon, 01 Feb 2021 13:01:33 +0000
Received: by outflank-mailman (input) for mailman id 79865;
 Mon, 01 Feb 2021 13:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6Ypf-00065x-P7
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:01:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9dd9674-1a73-480c-b1e5-e583ea8d4812;
 Mon, 01 Feb 2021 13:01:29 +0000 (UTC)
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
X-Inumbo-ID: a9dd9674-1a73-480c-b1e5-e583ea8d4812
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612184489;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jV5KbZdyslnUG1RIxoDjF1hQa8y8ZFNzUwOz54zRj1k=;
  b=U0QEAvzzoioXPtw0GlZRTv2dAerUAQDQDiDTjQuKHe0zKWk0fD8ZWzoF
   ppZPNKJERa/inJwl4Ri7n/XQEbFsFUEY9AUxjdwEKPYrb5CProNuYmEzQ
   uBN5aMPpGjPPyw2v2cW9f1AUPGCjXyZTkFYW3c25npPDNfEfMi6CjzSrW
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yAfHMaOzUlyVspQLwDXLD4V5TKdiDy4U4Trz1Pz1bcO3vtJUtJC6jpP6jLBOf8q8FnprQsNZkZ
 qvomp1IxyhyIgNyxzIpDrOuj222Ut1SmcTxZ2XRFfTLhLi91pam7JOwfXT+iVG2AKjELt37A6X
 Lo5Nz7P0sN/0xjmSVxqYyIIBBI1hd2kwGqYtuFW1GYkx+/J+Zlptyqkgzh0H3nzw/ZKtOSmPPr
 cixGBmYGLm7SGMEmIHOaYvMTzpX3ZJqUw0MMtGwOcpd/8s8ZJU0mWlXUyKCrX7fO89lYSujHYl
 BUQ=
X-SBRS: 5.2
X-MesageID: 36650823
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36650823"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgbK7UQYCjEsLTcKZ21s9QEnsRu+BLPv6ygoVD9Qf4hWaX0gPlDNk/zF/XaAYHyyY7bEi0UjT1LUnQuXjVc8tVbLB7bFqdacDPCnjZqT07jX00yXwhOxBY5ERzgPShTQ6UPjJsxMWAca22uPyoIhHsdTYH9eHNrTYlx7sLEIZXHHOgqo49yRnRVthmdUphFigYntPrN3u0JSSNwFOlh3kHsg8RHb5wqEvVDSy9TvytwOLoLhHa3/KLLrba8168S5exr8YReB79dTdaVKNbKck58MVnOI3IEIxkNZXhI3i8jtQrOMIcillg4t7kYQmr1xk+7hE1G5vALKJYOCS7OrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZp8HxNw9IQ8JWY9bpdc7k0Axvb7N23JXY6ItYc+ObE=;
 b=NZM9SdiQt0HhSRlkidDsZekPbc7ctyAKmnUYA+3gElx77pMFNb58jH8B/ZDE/lQ75b6Tf5ehnewaDc+pdsek8k7WZUOkRhJlOwFvO6uUyIA9P+gOG7S3qLUHNBuePmsNHd4ui5nlj2QSnyXPTvOWtRsSibSWa4U0mLO/tLD6yot1PxyBmM2fLxoCIttyBbHjHGXJluSjxQZZvTVusVpN2QlPlCOlp3lTLqLRdcCXLz6onSCin/CHZyC1X3J2msvlJ1CidsTN95bQPvfLpi/z55Psl9jp7pNqpZHV+UT4v0B6lAQPdrVIdjwMhSPG5rwycDchvV9K98tTnRq+LgrPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZp8HxNw9IQ8JWY9bpdc7k0Axvb7N23JXY6ItYc+ObE=;
 b=w7pAlCoHuC4DBdnFTZNGXWCeC1hD6+EWn/7AwqfpujZMSdNddfus4Ah6W4JNfVC14e4zpW1LI1Vt+7uHBU03rnwCG1dveqCAKFocXaCft4CcIwWEb18C3Y2zhFn+O5s2YIn+FRPLClQQAgS924YNTcdhIXJfof6zy43iPrnav90=
Subject: Re: [PATCH v8 12/16] xen/domctl: Add XEN_DOMCTL_vmtrace_op
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, "Jan
 Beulich" <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-13-andrew.cooper3@citrix.com>
 <YBftkqLHfwIzpaN9@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <316b907e-ff40-039c-374a-c07fbb33bbc2@citrix.com>
Date: Mon, 1 Feb 2021 13:00:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBftkqLHfwIzpaN9@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93636516-10b3-4523-69b0-08d8c6b169b0
X-MS-TrafficTypeDiagnostic: BY5PR03MB5171:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB517120AFBF085B56C3F2BDD1BAB69@BY5PR03MB5171.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkc6z/GuWbYNg0KO+2pS73gxt+kHyqYqAQTKsj1JMMaPvLa3UsirKIRW2AdxT1XFdHMQW1ehD3Uv4O2SWKoWDTFl5981UBsGRMurnKI4CTlnBB0Ro4Mjo/YxZ5q2qllRmnxYFp3CYgJgUOjhu69QUP8uVbuTHRqzKFCobG7Oa+c4saGLCzboWRP7wKyTbkocGDIGO58QrfQaUuTP7gT5N/hUnYnQ/n5A99VRh1NqREhOsVea/3Wt5PQPLI16edx8JdpEOsyRJG8psrU3p37HbxfVmbi3/AXwteQ+p2s71Zf5N8nW0KxXzNlgkYHMvT2Jf+JwDObXa/0rT0JF257jR2sAjbiNNcpXI3aqPif2gotJ5nVoNal5x/UNzmtM/cuseX+xdLXa79+GYGiDc89VlWIz/DwBMRa6EcEYksWV9MBluasOdpN60D3wb+UGX1ZuB2+D8AszXjclcxZts0kaV6U5q/Fm5hzGKQJiokgtnD8iid5RTf6blLjrPW4raBSnXDn3DBoOW0fOzmezKatGNjfN+DXRd7TIuXQOlYLTpytU7YsTtqtPne3imMyV5Xl+7rzKMJsACh5+CnHQfxVbHjuiA+eq4HpIDQlrfZgApJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(86362001)(26005)(8936002)(16526019)(6862004)(956004)(2906002)(6636002)(4326008)(186003)(31696002)(5660300002)(478600001)(2616005)(66946007)(8676002)(66476007)(66556008)(53546011)(316002)(36756003)(54906003)(37006003)(31686004)(83380400001)(16576012)(6666004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aW90UmFCVEZEbENTTmxQWFFZSmEwSThubzhGK0dmQjlyZmpZTzN6MHgzcHlO?=
 =?utf-8?B?VG5TdTgzREFYalZ3eTZLc2ZDOC9rb1NhaHJub0RlMkZKTXNkSVNhcE1NSndB?=
 =?utf-8?B?TzdDTldEUGR4VVZVaHREbGsrR1NOMkZGYmREeHFCVTRKQVNkdEJRZTJoUTJY?=
 =?utf-8?B?dm50cDZxUEp5ZFZVSGwxbXRCTmErQ3p1N3AvYWxzTWFETGNnU08yRk5aR1lP?=
 =?utf-8?B?MGpOblBQVzJIL2R1YVYydE4wVjZHbE84b1JyeGVDTnJVZ0xXZCtocHpUdnlp?=
 =?utf-8?B?RW9pZnB0bitSNy9yWVFLTVlkWHB2blBpV05WQ2JBNFZjV2pTRnhCRU5GMnFB?=
 =?utf-8?B?bUhGQmhnQkIvRTdGRVUwMk9aTkczajkvNUltVDNJdDJQRDl4M1Z6Sm5sajIr?=
 =?utf-8?B?YTAzS01aRXQ1ZTFZMVRwQzArM1Ywanhzem1Pa1Y0Y3hpTTV1WU91Q3ZCNlBE?=
 =?utf-8?B?UkVHNElnYjJ6T1RRTjNrWmhWeUpMZ1Ryb3hVQisrSkJtMEtvbURzV3diY1NE?=
 =?utf-8?B?ejhFSEdDTk5Kc1ZIQ2xVVHRmd3VNZnczdHU5d1Z4ZlFHSmZsbXNuMWxoRkpz?=
 =?utf-8?B?cEhtK05ZYnNqM3piUEdhbnhwSjhJRTlYcWQ0cmdSU1R3NzRuWVR0bnNhbUpo?=
 =?utf-8?B?eDNNaGpEbEpHQi9yajZnRHJvVkpOeHFFQ21OZ2FGbXFZWGV2aFdoOGl3ZWdF?=
 =?utf-8?B?ZFhBQ2dYdEdNbHdoeGNzaUxJb2FjdzY5cGd4ZkRxMy91U1IxM2MxcDZ6THlX?=
 =?utf-8?B?QXNNV3MySWw4OGJtVnJjRjBZNXRNS0F3ZkRPTlhMUGZrV2tURnVCbXhnbVRT?=
 =?utf-8?B?c0VhTGl6Mm50ai9QU3AvODQrOEp3MnowUXNGNW42NTNKdHROSzAzamZ5UWJD?=
 =?utf-8?B?N0didTdWSEEyK1BSK0pZRjkrc0NIejE4NjZHZVZrbk9RY0Z0WThFTVNkdEwv?=
 =?utf-8?B?TVEvUktUSTJXRDF0dndad1hhZ1hjYmQxbTNkWHpKZWY2b1RqQStIaWU4YjNw?=
 =?utf-8?B?MkI5Y3hDdWNjaGovYnc5NW4rTm14YW1qdGg1SjQ1K0M0eVBXL0pxVDE2ZlZQ?=
 =?utf-8?B?d2EvUS9aTVE3WXlXRldGclh4VlJGck9iMVhYclFMNzNQM0EyL2Urc2RHZmVF?=
 =?utf-8?B?QW9PeThkeGdkSitMUllNVk9CMmRTWWtKeXZEczNIMzkwMDNwbm1ZMGlMZWRy?=
 =?utf-8?B?MStHN0lRQXVmR3dCMmF6R2FKSXNONi9YbCtTSmtjQnN6L1ZrdjNQRVcrU1gw?=
 =?utf-8?B?YzZCbXc2QVVDQVBJQ3N0UFN2WS9tbXAveHdLbjVJZ3A0Y0EydkxrOVlMZW9Y?=
 =?utf-8?B?WWR5YTNGbFNZLy8wRHh4c216WHJqNy8zTGMyRlZKay9sOWs5TlpCVkNnN1RJ?=
 =?utf-8?B?RmtCcDg2aXdhdGpJS1dTd0V3QkJMZUgranZsNzBRQUNtZmhlaUhlV0MvaGFN?=
 =?utf-8?Q?PN3oYw9K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93636516-10b3-4523-69b0-08d8c6b169b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:00:56.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCNhi+F8EzbknVlpDZary7v8qn347XdzFQRP7FFgGPzN7zXYkuQfdNC+kLo6tUkY9/HhKvEK5IZuhHqqLB+QG/wa43epeua8Dv/Lecq5aHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5171
X-OriginatorOrg: citrix.com

On 01/02/2021 12:01, Roger Pau Monné wrote:
> On Sat, Jan 30, 2021 at 02:58:48AM +0000, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 12b961113e..a64c4e4177 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2261,6 +2261,157 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
>>      return true;
>>  }
>>  
>> +/*
>> + * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
>> + * These all pertain to data-emitted into the trace buffer(s).  Must not
>> + * include controls pertaining to the structure/position of the trace
>> + * buffer(s).
>> + */
>> +#define RTIT_CTL_MASK                                                   \
>> +    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
>> +     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
>> +
>> +/*
>> + * Status bits restricted to the first-gen subset (i.e. no further CPUID
>> + * requirements.)
>> + */
>> +#define RTIT_STATUS_MASK                                                \
>> +    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
>> +     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
>> +
>> +static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
>> +{
>> +    const struct vcpu_msrs *msrs = v->arch.msrs;
>> +
>> +    switch ( key )
>> +    {
>> +    case MSR_RTIT_OUTPUT_MASK:
> Is there any value in returning the raw value of this MSR instead of
> just using XEN_DOMCTL_vmtrace_output_position?

Yes, but for interface reasons.

There are deliberately some common interfaces (for the subset of options
expected to be useful), and some platform-specific ones (because there's
no possible way we encode all of the options in some "common" interface).

Yes - there is some overlap between the two sets - that is unavoidable
IMO.  A user of this interface already needs platform specific knowledge
because it has to interpret the contents of the trace buffer.

Future extensions to this interface would be setting up the CR3 filter
and range filters, which definitely shouldn't be common, and can be
added without new subops in the current model.

> The size of the buffer should be known to user-space, and then setting
> the offset could be done by adding a XEN_DOMCTL_vmtrace_set_output_position?
>
> Also the contents of this MSR depend on whether ToPA mode is used, and
> that's not under the control of the guest. So if Xen is switched to
> use ToPA mode at some point the value of this MSR might not be what a
> user of the interface expects.
>
> From an interface PoV it might be better to offer:
>
> XEN_DOMCTL_vmtrace_get_limit
> XEN_DOMCTL_vmtrace_get_output_position
> XEN_DOMCTL_vmtrace_set_output_position
>
> IMO, as that would be compatible with ToPA if we ever switch to it.

ToPA is definitely more complicated.  We'd need to stitch the disparate
buffers back together into one logical view, at which point
get_output_position becomes more complicated.

As for set_output_position, that's not useful.  You either want to keep
the position as-is, or reset back to 0, hence having a platform-neutral
reset option.

However, based on this reasoning, I think I should drop access to
MSR_RTIT_OUTPUT_MASK entirely.  Neither half is useful for userspace to
access in a platforms-specific way, and disallowing access entirely will
simplify adding ToPA support in the future.

~Andrew

