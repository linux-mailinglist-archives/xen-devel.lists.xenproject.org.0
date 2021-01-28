Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2982307424
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76888.138947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54uz-0006dV-9H; Thu, 28 Jan 2021 10:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76888.138947; Thu, 28 Jan 2021 10:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54uz-0006cu-5S; Thu, 28 Jan 2021 10:52:53 +0000
Received: by outflank-mailman (input) for mailman id 76888;
 Thu, 28 Jan 2021 10:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l54uy-0006ZM-17
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:52:52 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 738cf2fe-ae5c-44a2-8684-d91c482eee77;
 Thu, 28 Jan 2021 10:52:51 +0000 (UTC)
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
X-Inumbo-ID: 738cf2fe-ae5c-44a2-8684-d91c482eee77
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611831170;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GSXRa5nkUSIuOlG/gHAZLz3cKrn1+toLPCv8N27KxjQ=;
  b=C+FmP2jevWJQQZrad+ulQGEVLBZD9dYu4eEAK43VUvyVYCZ5GPwULvYO
   btFiRI4KSr3VWYY8xsYMP2bimvZ8Y+/KIQXn5axEqARGktakGkyZ3RFeH
   pMuPGsaHZvIht6D+EbPNJHo0HBFNaGR+0oH4cippGlkjWnmb2bZZsq/4I
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MEvGA/AAhsr2tcG4lOJDhD9876rTDlU+rwqSruniW04S18qWGoG5jPYlZCX2Jmsa7GR9mX+0gu
 lg5MkUEriHJDGZyA//+4hAcce8IOvPEbi50X4qm5wvO5QIL4oBMtjbBR6/vF8GoVDdQcEoFz3c
 U1DMruTFNENdn+dfZpvpuxDU/liq2Sz3vn2uGlvqaXGy/2hUqGBl/mRjKs3j6vmnhHkOs35Vmd
 Foqc83+RUst67Qq8lGXrWpA6Vk9Y8bZzzgBLasDyUjKm0/7q4wR+ZZSH9gFw84ObyIFq0jjUpK
 oUg=
X-SBRS: 5.2
X-MesageID: 36011197
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36011197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wobd3wvW6P0g91yOXM7JpGMAXXYPUA8UzJkjTL1XuOZc9yYd8CwtaRnlLsR/tFx+3hIxPc7rMMSm8TQpDGPfV09KdlaR/TvPHrq4tCQZcbm7adwgNb2jLBpgUeZM7sOs5kxaSJxZv6HaW9ZvsBvc3ljgMY5iXuafmGiUFsnWwlLiXi5834imMCcscTa0KUK7/24DCC02CjYeVgja/0o5YSao1Aq8kTdF6h9T2y3QH+BeIrS8rV0vCO7sANnViqRYcHqAm4Zeie+6hUDwFyiRI1J5t8/ulf3YgmDsgTiw3JLDRi+D1Po1F0nQYgMmy9NDhPWflEMSYYgZP4Ohg4IRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZp6KBApJWLYiI/HO8K2wjBb0lBlTqCL0T9SoRbpcQA=;
 b=JXlu9vmcJAA0VrlROYYvNEPLRpLTc6mgMqiZbNKAW78LWDymlHuu0Yhk4puhPnscdbl44vmMR76aQZnfdBgHzUl7myI3Y1adiXYj69zELPd+X6N0LeyWfNCiLMfud2+GzrjugDclJjX6OIBojaZAxU6Otix5YPiiJJTakZT1BBY0Sfjx5nIrVEFoDFjRqSEAF/zDDSmiBHcd2QItNv573iQcBGZSxhv1NSdy/NZVs4F6ZwJUsLVHWnZhR7C6Rs+6t/xHH9Tgqi5+rQ1vSIeQorkR9xpMDvFw2et7+FfWz/0IVWd+E+63Arem2XoeTrkZoE9Yi8nLdSCwRtkKGsZdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZp6KBApJWLYiI/HO8K2wjBb0lBlTqCL0T9SoRbpcQA=;
 b=jB28MST65Zyea5EQvdtCPBCJYrhNySim5XVKbhAwmfmXJt5vv1+/zFlFDaOxsZejYCK9HcPWTv1pUwY9MDKd8pQMwgHcHrg3aGdNMmaRPZjwicL1MnDg9nkitNdVMMZZXwymVOO8sNxKfV06eLs5pnzzB/S1qUkz0FQzJpvN5wI=
Subject: Re: [PATCH v2] libs/foreignmemory: Implement on NetBSD
To: Manuel Bouyer <bouyer@netbsd.org>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-6-bouyer@netbsd.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6afef0da-ef83-15cf-1726-78ac16eb0799@citrix.com>
Date: Thu, 28 Jan 2021 10:52:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126224800.1246-6-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f2e2a59-efc7-4f3e-e8a7-08d8c37ad89c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5126:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5126BEFAB71EBEDDD767C31BBABA9@BY5PR03MB5126.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DKXdowjhmjvgsGbOdl2A5MXBgY0V/yp5MltgQhWnSdTv91zEAfOVFp5wLek3ijXgq8K1uTqY5mP99HK2ZS6iPOHMhtA3APpm7dYhiEBGiDVvOA18qx0s5wX87xa6ROkq9qTbEtAvjWmmsShTQQyKArY06RBjBpfoxZQpKInfSLZJHMP8gCI2yn5ujEa2Ezp7FgpjDzNIJUUE3xH9/PzRbf7lfyhzzB06lOYsuBHnP68maSIZR6nYBFlLAqXp/WXeVunyXJbue8lJTkvziJUHwIkNv+mMG5iIc3hcSLVu9XQkjd1ODqFx65m8rx8m2AJsRYMSoH6mkWMXmhNO+nF+RzaFNZyH49932EDIK1YKzPblCfMHBrVi3voLcmWaBD3iAY3DIgaleqzK1w4ntykHCYasAeQPlQXx9ERxLGXx1eTSQy2b2r24O1Ni2Y1An9INWJrP5uPihisfL2YHlwh47VYekOg6ekaZ2HdyNtkVpjk1JkrPATly4NoH31kNGcRWtq2DjGTQn0qbXpSqn5T64FFkhDcVhToyqHkDRr5Sj2V6p0Ws08nEtg0j7igo3HY7sXz6E5tvuXvRQ2Rh/ncmURm057azer8XY+CWd9BK/2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(16526019)(4326008)(186003)(31686004)(53546011)(6486002)(86362001)(2906002)(5660300002)(36756003)(478600001)(31696002)(66946007)(8676002)(2616005)(6666004)(26005)(8936002)(16576012)(66556008)(54906003)(316002)(66476007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3V5elVZYVFoZDJVQjFEMkkwcFBRS2R2NjlIU2lmRUtRc0F5QUtJQy9ITmpi?=
 =?utf-8?B?M3hpR2t3UWJvVUdrNkhvOTlJME8yaXh3SDJWUU1FTjVTVmFDOUV1OW50RWtx?=
 =?utf-8?B?TmhTRjNNS1BoL0c2TVpKeFg0UjZMK1hZT2FOQTNETUNsREJOakxEdUVuVitl?=
 =?utf-8?B?SVhxeGZNZ2dXRktERXBLejBuVHE4MjdpdlhTZERBTkMwTzc4QWplbVhSTTNq?=
 =?utf-8?B?ZjJ1eTQ1QlhKdjJhZkFEdTBpWFRyT2JONCtTTk4vaWxBSzhJVEh2V0VQVmRn?=
 =?utf-8?B?eVlzS3ZRL3RDOHROTXI3NjB1Qk9HSkl6cDlQY2Y1dDBsQVpVSU42K09MK0hC?=
 =?utf-8?B?QXRPQnYrdDVTMnBBWlYvT3h4S2F1TzNlQ2ZPUUorVTN3OURXd3dPcTMrNVlx?=
 =?utf-8?B?aHhnbFM4RTdUMHBENFU2cG11YUppYnMwRUtKVnd3dWZmem5yZnBFVnovOWdh?=
 =?utf-8?B?elhWUyttOTBvTzRuR2NMbDR3bXdiYmU4V1FieVFqa01IY09Gem5VZjY0RjJy?=
 =?utf-8?B?Z2xaamNRZWRheVpMRVo4Qy9zdVBZYXVNTFRwTlZtcjJUamYweDlNc3BDQ0pr?=
 =?utf-8?B?K3JoYStVblMzMlZVeE1Vamg5MmF4SFdMM0hFaVRoRysyK2pXZDk2Ti9UdUwx?=
 =?utf-8?B?Sk1pTVBxd0tHYlhzek5Eay9UV01RR1AyU0lwUUxCTlUwTkJXbUg4aW1uRWFr?=
 =?utf-8?B?RXRlZGo5cnBiZEUwcEpWRHdmdWt5TDhvZVpveDduQ3dreTYwb2dOSXRUQll3?=
 =?utf-8?B?VzVkWXlNTWtCbTNvN0FQdTU1RnFaSTRWNkpYbW5ycmZNc2xmR1dxVld5TVBX?=
 =?utf-8?B?dkdSc2gxdHVpTWprQXBZZHJzYjZJQ0h0OGU0enNEUlV4alJTcllsOUs0c01m?=
 =?utf-8?B?VElFaGZpaU1qS3JZd0VWLyt3VHZDRGRMSDgzOXlRcThZTEZBSWw2Y1V0Tk5I?=
 =?utf-8?B?elpPUDBVVSs5SnZWYk1nN2d4ZEptQXplTjZTVzVWSFpoazZTLzFDNUs0Sy9J?=
 =?utf-8?B?eVZPL0RMNVY4R2pmRGZteUdlbml4TkN1U1lkUVA4WksvdWJLQ003ZWh2Z1Fu?=
 =?utf-8?B?VmVEOGZqTGc4aGhrL2d6QkRyTTlwcnJMMWtwK3dseWthSXd2VGc4OXU3MWlT?=
 =?utf-8?B?YmdseTU5eVZvY1hnU3E0ejFLMlRjTVdOemt4QUlYTkF6eUIxck1PYVJmblA2?=
 =?utf-8?B?TE9KaldJckRqQ1B2bHVsTTNpVUE0OXNWaEJQUDFVM0lNZlJETjhnNmpid0NY?=
 =?utf-8?B?RDBQbTVWQnM2czQ3Wmd2S1RrLzlmQXN2MUhhMkMrSDJXRGNjTlgrYWQzOWZK?=
 =?utf-8?B?ZE94LzdqcDdDUnZWTSswcDczcVlBYy9pYWpxcmdwRlUzaEtpWWVLRWJpaG1l?=
 =?utf-8?B?cDl5bkRITGpIZXNWaEgvZktaQkNSVVdoTk9xWjdHaXdkNTBFSDdFdHl4WFNR?=
 =?utf-8?B?RXJkWldKMFFQUEN2VUl5Q0NQMFJsRDhPOEhHTjdRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2e2a59-efc7-4f3e-e8a7-08d8c37ad89c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:52:46.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOPpvshxxTu1WQqZNJ250TSPb0HsNMCMXZrIB63VigkCxyKJIohSxk0ZU0rLazemh5JIyfbjFVbvVoO9RdfSUk1sx1INNpAUJTa5WvXU02g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5126
X-OriginatorOrg: citrix.com

On 26/01/2021 22:47, Manuel Bouyer wrote:
> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
> index 54a418ebd6..a7e1d72ffc 100644
> --- a/tools/libs/foreignmemory/netbsd.c
> +++ b/tools/libs/foreignmemory/netbsd.c
> @@ -97,7 +102,48 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
>  int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
>                                   void *addr, size_t num)
>  {
> -    return munmap(addr, num*XC_PAGE_SIZE);
> +    return munmap(addr, num*PAGE_SIZE);
> +}
> +
> +int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
> +                                    domid_t domid)
> +{
> +    errno = EOPNOTSUPP;
> +    return -1;
> +}
> +
> +int osdep_xenforeignmemory_unmap_resource(
> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
> +{
> +    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
> +}
> +
> +int osdep_xenforeignmemory_map_resource(
> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
> +{
> +    privcmd_mmap_resource_t mr = {
> +        .dom = fres->domid,
> +        .type = fres->type,
> +        .id = fres->id,
> +        .idx = fres->frame,
> +        .num = fres->nr_frames,
> +    };
> +    int rc;
> +
> +    fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
> +                      fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
> +    if ( fres->addr == MAP_FAILED )
> +        return -1;
> +
> +    mr.addr = (uintptr_t)fres->addr;
> +
> +    rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
> +    if ( rc )
> +    {
> +        PERROR("ioctl failed");

return -1;

I was rebasing my resource_size fix over this patch.

It would be easiest for me if I fix up and commit this patch, if
everyone is happy with that.

~Andrew

