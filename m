Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CDB31E884
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 11:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86532.162578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCglS-0002Tv-Ti; Thu, 18 Feb 2021 10:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86532.162578; Thu, 18 Feb 2021 10:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCglS-0002TW-QX; Thu, 18 Feb 2021 10:42:30 +0000
Received: by outflank-mailman (input) for mailman id 86532;
 Thu, 18 Feb 2021 10:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lCglS-0002TP-5B
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 10:42:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60ba374a-ea8f-4079-94fe-1f3f604140fd;
 Thu, 18 Feb 2021 10:42:28 +0000 (UTC)
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
X-Inumbo-ID: 60ba374a-ea8f-4079-94fe-1f3f604140fd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613644948;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kBHOqF4mdLh2Vw0vTNHog/2fBR0VtFO3kawcyzOyAHU=;
  b=aznO5C+GYPXbWmR6MYSiy8xJmwu0d93BlpyWRlrV4+TQ4Y6lMY0cVn3o
   00ef5RopiNPm9HiSeelHzsksbxa0CSevmzIVkcd1FjJmpCyQP2XIKMr5R
   CIpStzNM5P3tJWOc6JUPSuz+BNbduy5WYGM+68BMHUP8uUGkPg+FJAUtP
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6wHRPfzgqt+zK8B9IwL02u7Uo3BxnG8WTIQRS8DwQnRYlxPLwvK1TE3BujlL+cUBxAeTxOWrHg
 vaCHp47I6KwHED3AXgH+aNLnEDae1qUOccSfqoI+EPqVK/TUkNhDe17rPICWnvrGYimQjqLOpU
 /6sveDOrgRdUlxCYAVsCcaUjkFVPdZA0WNzta4Yeh1PyR8zAT5AjkCSeW3lYdbavcKyweCGBZv
 pUg8GutSmplr0JjsnIGafTfHRIhACNeG8g593O3S3WIoyFgkvXLcXMntmAb5raV2STHg+OKkyI
 7dA=
X-SBRS: 5.2
X-MesageID: 37497121
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="37497121"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZQJHM6XRmcF6pJCAC/yJ7t87JzTmThXk1Q2BQodXSGNqFNZxDjhNWOgKY86LTvc1w2ttHL+l4DfnYAdCGGndxcltgEPeoaOIZ5JQj/es+2SMCLQNSSnhilACmapqlAUme6WfFlmI+yvLkjHKFV369uKtt0f1P7v9nA+TnYsZISatW2lX84YgMJ7LWAvfV+jEy/f5NLzE9UAioB0yMnSvBJhYRSoJX0SDAIe/MNoKe0hMdQsSNDCCy51KyRpdCJ+0TH9IyH3qDfgqZJH3Am9ldMn5SAib8pb5zoYg9VoDPZoHOHTgBYTOf7wQvACt5H327NpOMKIHOp30+axgqGtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tadfgq7x1Rhc5P1xiKE+Bs5UFp8iNQGJW6YmQvc1qxY=;
 b=Zef+NyeMfQPiLqMI6PXI2WUV7XGxPwZu2poDw7HQQ3Y/5qKAnqXWzOw4AQIVibK71cJS7a4unx912X+Y65CMFipLCeOsj2/AB7WUd0AUuBf54gDmmv0fTrBRr8P/Rwrv/BlbDTxnVH2E5IeC6LqbdqW46UZsdKO42Tdbb0zicSVDAdSUopjr8zNr06VC8HENM8xNTrnsLkS1tmqgrna5TKi0rtGkFdF/+Su7wof7aj1rzK8lS8bX6b/t6oC7lKhHiU2r3hflVDxlX4VobFjlFXCHWIajP5r17KSIWqj/ttpKsU9EIMSYgm6okv890XOp76pSv5sZg8z5zC1THw9eAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tadfgq7x1Rhc5P1xiKE+Bs5UFp8iNQGJW6YmQvc1qxY=;
 b=AoYN8TuLCYKODofFXwB6+QObk8/iMXkxN+zlC7IVCKyKrjnC2UQiqOg2i3li5a/R38jChn1Eem3NHCN16bDUkh8eOUELUF6Ucyg9JVvV1ykl0c+fi2K/EELULlXWGIOZ6Gof00OXSUMvSoq4Q+XXsqaUEJjf3oP+6feltEGG5R4=
Date: Thu, 18 Feb 2021 11:42:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
Message-ID: <YC5EitRCZB+VCeCC@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: PR0P264CA0091.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ea7325-2f5a-432c-f25f-08d8d3f9e06c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463003F70B0E153662243E58F859@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bJP7fypWMTAV19Iqr3qZm7uBiRHId7qtX3fmxtNCeQVd5Hrs2+0lM8Pgxw7SmofMPteQpRLnYogcTOUtlZlt8Vp5t6dXp/AJCMwh73g1q7WdtEyquX6nFjGi9tJA99/A0xJNYqINK7NBRnY4xnqxVaN8HOz4+SG6Sy2bhHLntjOIKcA1xp3RHMgm8RxxA9kJN09lo28RPk+l4pxsSWYhyigItqm0/WsFNJY8nu7OMseVZbYe+XlPBacfo3X5/qX4Gx2arcQ3WftaG6bw7rRAE6lLBxlV1eX5XMlVDnJXJSMZAfjatcewU/P4bnZ8YCMB11gi8hICmydStfF00CXMRU9XXs6HqZvtLemO3t9NmA9lHu4ojBwAM58MlLmppXmu3pS1vfcl9UNCWdJx+XnFD7sqRjEn4M2uNbqv8b9Fdz8T+l2SaJ6lUXoNltwX+qiA5vMl7zRzWGCFnToZ66O0sBYT2/2NDug57UHN2msGNEQVc8SOutzBxlmsrw+JrvOLnfCTjQ4Z9O9ljtLpT93bmNtpaD+UeECW/VlW0mWsnhPjze0IA/kr2Ni/oBZM4kGdfYQpaX6k4xCmE2gsQN33S2ptAw2cQ873sI0/tKjMDytSNMAfb/xcllEmo7MC9R2pfg3D97/0yAG0KD2ktzpCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(39850400004)(366004)(376002)(346002)(16526019)(316002)(83380400001)(86362001)(8676002)(186003)(478600001)(45080400002)(6666004)(2906002)(85182001)(8936002)(66556008)(6486002)(33716001)(66946007)(956004)(5660300002)(9686003)(6916009)(6496006)(66476007)(4326008)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWkxUWowR1E1cHVueGIxaWVqN2UvU2FzckhEcU9Gd1JKWnFXSHBsK0JCd0M4?=
 =?utf-8?B?bXF4M2N4UHpzRXVDWHUrSktsNzdKUnhoeUt1bW1Kd3pZRGJYVTZubkJ6SDJ5?=
 =?utf-8?B?ZU5KMTV2WHVibFlWWkM5aG9NVWN6alJoaHRqUTBhY0tCS29qd3NhN0d4bUVn?=
 =?utf-8?B?emI2VEdhRFE4cDNPamJCeFdhRGNuWmJOWGYvT2xEc29IeEl4Y3hmb3JndTJS?=
 =?utf-8?B?S0JpUVlLOHRuVytmK0ptSkdPQSt2N3lHM1BXZXYwdjY0RzdFQjRMSTdtSlQy?=
 =?utf-8?B?emorTHJBYnZPOWE5aXpkeUVFbkx3TG5nT0pCSUFNWkNRMGNkdFRCc2h4ZkQx?=
 =?utf-8?B?SzNsZjZHeWxEaFQvT2NKclBIeVRxbStuMUU2a21vVUV3SGtuSzRnYmEzTkJN?=
 =?utf-8?B?am9uTW95MFpLbHhoU3VYZ1Myanc1MnVNQlk2bkYxeGdmdUVzRHFiaW5lZWJP?=
 =?utf-8?B?UlhOQ0xIVHRGUjlkMy9USERBL3owRU1LN3o2RHUvbGJHT3QxUVFKL1dwcWo1?=
 =?utf-8?B?dVkvYTFGeURHdUF5dHlIK2RZU0pZcDVvcXNsYk02bnIveEpsNCtmdFh3RWpJ?=
 =?utf-8?B?YWhZQUdkRFZqeHlqaWc5aG5KSXF0OHBEazQvREU2SGFzUFJVUENWQVFKY01M?=
 =?utf-8?B?WFUraU9ETzdROVJ4c1BOUENvRHhSMlFWaXFzVUh2TzRaUnlaWGlQWXRKUGpG?=
 =?utf-8?B?bHFVRkc3M2JNTnhJZ2FQKzJaSU53YTFZKzNhc2xET3c4eG9HbVBoc0FVbis3?=
 =?utf-8?B?MWFDT09QdTNwK1BGVlFER3BjRVRMa29Bbmh6RUVGSVJnY2ovU0swS3NEUzVX?=
 =?utf-8?B?ZVlaeVUyUldYVUdFRDFXb1I1WFg2cm0wcVBQSUVXR3l6TDhRdnNSQzY0Rkdq?=
 =?utf-8?B?UnQ4OVlvMVdJVldCNVBNUFZZajYyOW9EV3ZiZ1BzQnpoNFYwL3ZxUjVJcXJv?=
 =?utf-8?B?MU5EOW9rS2w1ZlJIN1h3RzV5Qi9hcEF3TFFTNUEwUnV3VzI1b2RONmNUK0Mv?=
 =?utf-8?B?SDRjTmNKbmVlQ21ZaTJDVVBxTVp4d0VBYlFHSjdVNE5GeUc2V1VzeWNIZ0h6?=
 =?utf-8?B?NzdDYWN0OWFWa09VdE9mdTErTy9PSnNTZTZKTmVpaStGUk9zWHNIWkVaMUdz?=
 =?utf-8?B?dXI5Vy9UWHBxOCtyOHNuZVNXdmdSRk1HK0pIWnc5cS95SzJUeS9qQlZDV2sy?=
 =?utf-8?B?U0tsRWVxM0p6Y0V4OTdoR0ZaZGIybTFQMVByKy9OUHM0UDZ0SmJWQmY2cjdB?=
 =?utf-8?B?TTdCTVBRUmlIVlMzT1FhOUdZMm1zcHdlYnREaTdEYllxREhCVWdON25MVTVk?=
 =?utf-8?B?SVVLdnRIQ0gxa2tNcThEUGczbmg5c1NwQlNURCtxaEoyMHFjWDZ5VVR6RWgv?=
 =?utf-8?B?WHhrUnd6Q0NHOHNIMlRwYWFiN2YzYlJaVktIRkFwRHRmMTM3cnF2MmppTExi?=
 =?utf-8?B?aXkzb1JiTXRocHJaRTBod200a2s1VkF2VXFLd20xK2RkRUQvRFhpMDVEWjJy?=
 =?utf-8?B?cXVHSDlDaFFaa3RTNDRnR3p2UHBrcDVNR21JYzhMNE4wZHJRUnc2OUlUaGty?=
 =?utf-8?B?VE5DckxzTDRrSnBtYmFZUDBLK2YwTmVZbUhjbVRlMnpLSkZSbXdyang1WGpD?=
 =?utf-8?B?djgzZHllOTdZM1ZDNmc0VzVJZTFjUVZJRG1oNHJLR0hTK1RIR0dJWEVBVS9s?=
 =?utf-8?B?ek9WM3RYa0hiM2lGQnhQZUh5VlM4TklUWlZiMzJ5ckVKak9GK0tDZzFiZzBh?=
 =?utf-8?Q?8KmYju3+pqzqj2dF6KMjriP0lFEss5UisgfIQ96?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ea7325-2f5a-432c-f25f-08d8d3f9e06c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 10:42:24.0370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z74XfucidyWAISwMG9FjAnzwcggqs8i6RhskHKFyQGtMMVVf5qRorCONKTeyrKIcyRGotOM71itXcOsULQ7nRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Wed, Jan 20, 2021 at 05:49:09PM -0500, Boris Ostrovsky wrote:
> This option allows guest administrator specify what should happen when
> guest accesses an MSR which is not explicitly emulated by the hypervisor.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
>  docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>  tools/libs/light/libxl_types.idl |  7 +++++++
>  tools/xl/xl_parse.c              |  7 +++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index c8e017f950de..96ce97c42cab 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
>  See also "Virtual Machine Generation ID" by Microsoft:
>  L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
>  
> -=back 
> +=over
> +
> +=item B<ignore_msrs="STRING">
> +
> +Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
> +
> +=over 4
> +
> +=item B<never>
> +
> +Issue a warning to the log and #GP to the guest. This is default.
> +
> +=item B<silent>
> +
> +MSR reads return 0, MSR writes are ignored. No warnings to the log.
> +
> +=item B<verbose>
> +
> +Similar to B<silent> but a warning is written.

Would it make sense to allow for this option to be more fine-grained
in the future?

Not that you need to implement the full thing now, but maybe we could
have something like:

"
=item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>

Specify a list of MSR ranges that will be ignored by the hypervisor:
reads will return zeros and writes will be discarded without raising a
#GP.

Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
"

Then you can print the messages in the hypervisor using a guest log
level and modify it on demand in order to get more verbose output?

I don't think selecting whether the messages are printed or not from
xl is that helpful as the same could be achieved using guest_loglvl.

Also I think it will be fine to only implement:

ignore_msrs=[ "0-ffffffff" ]

Right now and return an error for any other combination, so that we
can get something in soon and expand it later.

Thanks, Roger.

