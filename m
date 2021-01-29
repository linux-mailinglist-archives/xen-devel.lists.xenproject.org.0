Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22F3089BE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 16:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78227.142225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VP8-0006p5-HP; Fri, 29 Jan 2021 15:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78227.142225; Fri, 29 Jan 2021 15:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VP8-0006oi-E7; Fri, 29 Jan 2021 15:09:46 +0000
Received: by outflank-mailman (input) for mailman id 78227;
 Fri, 29 Jan 2021 15:09:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5VP6-0006od-CH
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 15:09:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c73ef387-11e1-4020-af1d-65a719bb985b;
 Fri, 29 Jan 2021 15:09:43 +0000 (UTC)
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
X-Inumbo-ID: c73ef387-11e1-4020-af1d-65a719bb985b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611932983;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rLHwhUfFOWfpLzwu0gr1ja8p48B3Xi1ZZKsCbOk5k0A=;
  b=ej4aopur5S7oZvVrytvQSigv6MN0h9CTVOxF6B4S69PQbvuQZnkITrxl
   oRR2Ii93Yl2lMZCwOMj+qrBGKj0DxKU2TlL1AVT7NYQuuCJlBHG3T0Cp2
   wOEiO9LOWa428E+yMfC9P0SC7Po3IlkEIdejx5AGzs1q46/1QnqoMs0/S
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ltInfohRekBYcDTzpVhjnlAPEOefnF5EVhOLoT05upoxp2mDcn3f89S9Mgb1WI8qU+VtCdUJdF
 pEhn3FwKyE493XLi2lyWTOL/uO+lOCs3m3BN7orq2IkR09boDOmOLPDoiRyQvwcs7smUgT46kc
 FrwqiyC4HtBUGmcrpTo7kLrjudJNAInqssukeVO3xjFYvfFW6pKDiMax4q6VoU2VT+vsou1fsY
 R+cUGJXjNwNt9AsdaczYjA+Vi7PaiDzIzSmujawFH9HNdmHByp70rRRsyr50SAJzlpC29deDxZ
 5ro=
X-SBRS: 5.2
X-MesageID: 36197834
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36197834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBsFR498jLROs+DpT+Q6eH70ar9HNrw5+jdOvcV/q99p8e5rGZ2FVIllf+VXgSDb7wUf+r+PyKHaTdpmOOWsQ3Wtz6GeHIrOtugYcoYjzb6NHuWpSxPK3cwtYrux/Ayrte2wCRHM5aJwAFPubRgVkC49jPXA65nijsTCjw9WyWDSpqQbFWqijkYKi1s2GkK7Klx2zMcbCWYWxvRjUaqHCAC2BT1tyuCfK+w2KYRRIyZXzeSx2ArTg0+NMFgrKk3KoSm2Wju4Ia2SQo7gADOPMsPbaxWMm97OxlWIDhfwnkCaqR2LAJ63mE5yUSttqTMh1ZPMbEDBziuqC4jmQTDTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO1cC5UEnPKjemPeyqdDt6wCHnHrCs9VqH2wl+jbuOg=;
 b=QTT+ARbCakOlypyCjOoGXJSV00bNepoHdsv/2Wxw7bJJx4EgxF2BWSOPE9/1DoUXo5ir9kcqG2DC0TcCe8Z806r2lpqTOIpLKkKR2USQT3pUXvsPG3k6znfiDivm38VBCfvk8k0edIFdA8NObKEYv+FPrUkeRrOEwcafRLcOMwLCSuSbkBtuhKoPDs25NDMtGkvi7qXOnHPXshKKZWXsFTS0eEbsD/zus1NvrCGUSBIXyRQ8ZKvcu7koxh/4pTa8uokH4E8i3Y/+nwaICgS/AkIaIC6P9dxqyDyDFElpTu061l/mJ3+KOc991wEBuuIHNawMvzcFMuq03sf5v6LDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO1cC5UEnPKjemPeyqdDt6wCHnHrCs9VqH2wl+jbuOg=;
 b=hBLbrsMjEOs+1pkbUdpkLpuL/a2xuHx/ulbDJH+WwrBq29NWnOC1iao5bKLiqbLZ91iqgr3h9zUstYWNefnDezhU91TBeWU1b+QslzvfSGqv8XE5axL5J/pYM5G1CS024jT15l6EovcPOi4+YKIzlxqYerCqfzYFkx/PIN6Dx3c=
Subject: Re: [PATCH v4] tools/foreignmem: Support querying the size of a
 resource
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@antioche.eu.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>, Ian Jackson
	<iwj@xenproject.org>, Micha? Leszczy?ski <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210128120152.9908-1-andrew.cooper3@citrix.com>
 <20210129103843.GC2015@antioche.eu.org> <YBQi5IAUK47GvTmG@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <61ab107e-70e0-0445-bf4a-6c7031cff949@citrix.com>
Date: Fri, 29 Jan 2021 15:09:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBQi5IAUK47GvTmG@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3486f3a5-aaf8-4515-eeaa-08d8c467e56d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3413692D020639852794DA29BAB99@BYAPR03MB3413.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDcZ6xwnvmHC2XybLCAlhP/oneuybrSTWKt72QkGe40Uir6szxynRGoYCi8spJkGJNtSl+724kWwCceOEZYmAQAmrWN7hQ84OZhb6hj6M2ZAZBxh3Vk9VLiTjcUw5LJGFIMw1mlwiAAqerpYTzwjBuVVSjP7vXFgyZngBRBlmjdNZXUIrrqIzj+ZOGpdG8iQq7Xfzx2uCWmzCln2z+TR3Ijl7PvglkVfPbe7vE97OPCLjhYcMnZL0BYK9Ft2B/Izwlh8xqOPD9XDR7fpe0N8Ob+hcyur4VIlumTFgLoZcQQfPUo7DZnJsSHtaImInACuTYr2oiUEoVXf8H3Ma50H8PJhVRAkwePxgh43bAfPc2Qe2sA7QQcR0mWhhhK+9YzcDW1J2j4WKyP8qoXk7/vVNeUffJII4psIJDAGOvM5C6li7hGPHYlvOlgYsOQhsliWbLK6v/s5U8NKQIDICXnYrqX0VBouxuTlcm5IL1eiQ7JDd9T0RjfEaJF8fCMrmOEccDRA0ZoLnWvd/bp+x/QgEKmYmhKA/MYKbaKicrWRHMaUEGdPSsR7+O/Ug/4M4EgUh5VznzRzhAP6smv9tG4/TmH1BnjO5RMGeOuoGpUHFNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(16526019)(31686004)(36756003)(83380400001)(8936002)(16576012)(2616005)(31696002)(478600001)(53546011)(26005)(54906003)(110136005)(316002)(8676002)(5660300002)(186003)(66946007)(66476007)(6666004)(2906002)(66556008)(4326008)(956004)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0FVQVd2ZXg4My8yMzNMU1Fmd3dWNlBQU25PVmJBaWxjVDVqdFRoRWJCTHNr?=
 =?utf-8?B?aHpyUHRYTFBqNi81R1dlM29ha0wzeTlLODE3ckRCb01Wb2xqUjlyT0JDaFc3?=
 =?utf-8?B?cWRKUWFmQmVta0NQQVhwaVJFZFlrNUZNcTJKYVkzWVhzMlEzS1JxK2U3UnpM?=
 =?utf-8?B?WDBXQTJUejlvSHFHekx0bFkvT3NIK3l0aW9rZURjdXVCT1VwSmM5T2M3OVZN?=
 =?utf-8?B?aWpPa2FnSzZRZC9hTHRrTTUzYTBQeE9Qc0dHVUxEOXR3VlNWeXhqSDJjeVVO?=
 =?utf-8?B?a24rYmtybEVyV1NqbGwvamJmbGN0RjhrY2dRZjZyY1BGQlVUWFQzaDBGcTEy?=
 =?utf-8?B?b0xNcXpkZ3prVkc0TjRnV1B5aitjS2FTUy9Ick5KMGhCSGN4aElIMkR0VnpK?=
 =?utf-8?B?RHBmU1hlTUxjQ2w0NVdLUmFJMkxub2dmZTVweVVzbVFoSHJVSmZPM09KSkZ2?=
 =?utf-8?B?N3doOFJSSmhIb0ZWSENGMk4wemtKRnArQ1pBY1NWMlBqMnVpMStidXk1VFk1?=
 =?utf-8?B?UmFtUGpSb2JST3NKeTlUUDhBRHp3TzcwQThqRjIzOU9vdWNucHNwWmR5WEY1?=
 =?utf-8?B?dDFFbG5FNlFScU9jT1BqMGlCcWczYURhZmcwT0xNTHhRdDFPcUZ0REYvWDBl?=
 =?utf-8?B?SVpiRDFWc3lyaHhjYlh6dHVZdW01c3FlVnZSMG9aYS9NRVFob09NQzI2b2Ni?=
 =?utf-8?B?dTMzZEUzZlBHY2NXVVM4OVFsTStsamtadmZFUm1Nc09XNW1SWERVRk5VWmM5?=
 =?utf-8?B?bUtrelpUOXdsNnM2SFcrOHZOaXE4Q1B2QjVZTXlQVDZjT0FJN1M5YUl6bE1O?=
 =?utf-8?B?bUkvZmUxMmM3RWdCdnFTR21Ub01aMENmT0JhWktrdDU1QitYTU00WjEzc2Nh?=
 =?utf-8?B?empZV0Y4WFAveDdGNDVJbW4wK1ZPWlFzNlpQUTV6UEVWemE2ZjIzcEZ3QTJH?=
 =?utf-8?B?c2IyY0NTK2NnbXFqYjRVTm80UXRTYzJnam0xYWpidDhFY2tBRThId1NwcXh5?=
 =?utf-8?B?VVNvT0k0TlRyY2MzUXBpNEs3eExyblpxbm02VEdVWnZRWGFuSkU4SHNqMHFL?=
 =?utf-8?B?a0doRHNrU21aVUVrTmY4MWw4ZFRxcmI4V21BaWsvT1BwMUNMeWJMV0hZTEhO?=
 =?utf-8?B?bWJYSHd2NGltalpDK1RsWHdFUHFvSHNNbGlMaVZkQUtWbEI0K3IwTDl4akZr?=
 =?utf-8?B?QmMvSzhDTW5YTGd3UzcvTjlGWmJuRmNtc3F2NGpqQ21TbFJ5dHdxVjJ0eS96?=
 =?utf-8?B?eFIzMk05OVpvUnBpdjVianB0dmxSZ1FQNXR2QmJJM0ZoUVN1MlRWYUVDb242?=
 =?utf-8?B?dXE4NGxscHVERnd1TnI2NnA1b0hacFZUYWFwT2Zhd21LTzBPWXFlczljc1E2?=
 =?utf-8?B?ckZlaHF2S1JCbWZrai9xTk04MnpHL1N0RlVCTS80Q1ZUMHp2cHpXbnJFeVpm?=
 =?utf-8?Q?rTSEbs9L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3486f3a5-aaf8-4515-eeaa-08d8c467e56d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 15:09:38.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA9axTL52QgwpcXPAx2q+gFLuSfXVKykT+3Tnly7FYn8jE/ZfGtHosHkT2ffkDKq5OzE75Js7ZdKRTAPgXFpx3X3btERHvXm2a6r+SeJjhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3413
X-OriginatorOrg: citrix.com

On 29/01/2021 14:59, Roger Pau Monné wrote:
> On Fri, Jan 29, 2021 at 11:38:43AM +0100, Manuel Bouyer wrote:
>> On Thu, Jan 28, 2021 at 12:01:52PM +0000, Andrew Cooper wrote:
>>> With the Xen side of this interface (soon to be) fixed to return real sizes,
>>> userspace needs to be able to make the query.
>>>
>>> Introduce xenforeignmemory_resource_size() for the purpose, bumping the
>>> library minor version.
>>>
>>> Update both all osdep_xenforeignmemory_map_resource() implementations to
>>> understand size requests, skip the mmap() operation, and copy back the
>>> nr_frames field.
>>>
>>> For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
>>> overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".
>>> [....]
>>> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
>>> index d26566f601..4ae60aafdd 100644
>>> --- a/tools/libs/foreignmemory/netbsd.c
>>> +++ b/tools/libs/foreignmemory/netbsd.c
>>> @@ -132,6 +132,10 @@ int osdep_xenforeignmemory_map_resource(
>>>      };
>>>      int rc;
>>>  
>>> +    if ( !fres->addr && !fres->nr_frames )
>>> +        /* Request for resource size.  Skip mmap(). */
>>> +        goto skip_mmap;
>>> +
>>>      fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
>>>                        fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
>> What happens if fres->addr is not NULL and nr_frames is 0 ?
> mmap would return MAP_FAILED and errno == EINVAL in that case AFAICT
> on Linux and FreeBSD. NetBSD mmap man page doesn't seem to mention
> what happens in that case, so the comments below apply to Linux and
> FreeBSD. Maybe we need to handle this differently for NetBSD?
>
>> Is it supposed to happen ?
> I think that's fine. Calling osdep_xenforeignmemory_map_resource with
> nr_frames == 0 is pointing to a bug in the caller, so returning error
> should be fine.
>
>> Should we assert that fres->addr is NULL when
>> nr_frames is 0 ? Or force fres->addr to NULL when nr_frames is 0 ?
> Doesn't really matter, mmap will return EINVAL if nr_frames == 0
> regardless of the value of addr.

mmap() of 0 is an unconditional failure.  So sayeth POSIX.

For the size request, we don't mmap(), and a pointer of 0 is the signal
to Xen.

For the regular mapping, we support both NULL (let the kernel choose),
and non-NULL (I want my mapping here please), just like regular mmap().

~Andrew

