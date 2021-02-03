Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB830E0FC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80990.148786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LwO-0007Nk-3S; Wed, 03 Feb 2021 17:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80990.148786; Wed, 03 Feb 2021 17:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LwO-0007NL-06; Wed, 03 Feb 2021 17:27:44 +0000
Received: by outflank-mailman (input) for mailman id 80990;
 Wed, 03 Feb 2021 17:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7LwN-0007NF-3k
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:27:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 649045c1-783e-4110-a551-7e53b0df63d7;
 Wed, 03 Feb 2021 17:27:41 +0000 (UTC)
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
X-Inumbo-ID: 649045c1-783e-4110-a551-7e53b0df63d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612373261;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NjYpEzNQazpJGj4a3dfpfbot4Kja9+8s7lhf+XKS/zY=;
  b=cXuNMZF75TYNbLQZys17ZnCpE6t9iaMLLGP3NroL2Gf1Kr1FBIMVg6q9
   dJF8JRA0UEhZ1AAXU4kJ96SJomquXZD3szJpukjXb9h1ULycmDuZ6QRFY
   2eB+jnVie+gLQkuUsYVSjinXz5E9GPYNAlSRHChBAPO3Mf/KixGuaiX90
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uQqKJc+TQayzNJHo8/PCrIwLEsdjrYb/PfC6PZA9BUNiw1x5/GCiSlo7KmvQNaFKMNuRboZwvS
 mfGpl5KkMyjCHJoVIlrtE0QIJG9eFa50i1CXrXf71zfedKBAbkUe3FtVG5wESUzKMQUTnZqKJI
 uufGXDVBJGvLyD4TG2Wvo9y1m2CTXc9OBWAdvBnzph37m1rA5n522JUBrnPHqATFTQ7ODiQJ/E
 xTj5zL7RFuUnTMYXnTFWk6kw20S3bCZ9NIt6CBEP6SiWbbOC2ABTJ5Ysjk29iiEdvhh2ywUwpy
 Ajg=
X-SBRS: 5.2
X-MesageID: 36482864
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36482864"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEDqIKplDlH+FvFgVMaU5pVF/Yb4uVIUjwX5+zBuIvvtN3m42xCrT1BN5Ws4JTR0KWfKUDhZ7UrRw3+jir8y+3WoF1u9TVgZPoz5KvXG3FM6fw5lYzcWcFtICRg562cAaIOTk+Nv8qtPuhVMEZXY8Vj2t4y+YOYy/71j+iz/RwJDLEWoVYk4jqfcPOxgag4lYV4eXQTVSTbsdjsxGcHteP6Q6Bfl0zEbR3Rk+Y6twby2ZgXOqCthQu3aPdX9s1qTklreyvPJnOxqWBd5ob3TkIcdB8LV12b4AfHyxvx65n7nxLiK+ceVX50CcbxoFIRlEuORccBumO7ZSj3kfs4XqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EkyiE2hrhjR80MlJZncWxzBHVWtp46zqd3s+A0L+Y0=;
 b=NNiLHwqGjEZ4RWcy0hOvwFKGnwWJ4aysePF/hwTXJe+61m3rYJvjwPtt509zkT/bGD+S10SJCOm0PU/3P0lT/F+rjCvSni2PSFcObAG8RtKEzZq9p65p4dgHYjzVeL+fndUQi2S6sta5VXw11mmnvEgKoY38aCiORWrdPMI4Ge7MvXGee3X97QwL3s87z/K5dx2dKUV6NnyGcps3JqZksk+lTENBJ07mFqWv5Ffd97FzPc1DNPlf+o8ZIj8kQs+NupxX8hd94KBqZ9k3s40CbOzDe+1CYpDOEFYh4njoJtdrHXQAg144xnuQdvaOPH+iH53me3naGy42BJSBtO1Qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EkyiE2hrhjR80MlJZncWxzBHVWtp46zqd3s+A0L+Y0=;
 b=X/LvIBLRUNRivrZvLH78f0jzh9ElMW072tZoqAyVA6J22ERbuQ7hd8iOhWhMxP8RO87Hf4J94uediMo5BAS+8j+Fa4pE3UsottMKCt3TsGSZ+XF7/vXeo2F5HKiJXVbn+VXyghzdpVmriUEWSah+iy42jCkyq/O3kdg+ps8c6wg=
Subject: Re: [PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling
 for map_resource
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
 <20210203163750.7564-2-andrew.cooper3@citrix.com>
 <24602.56036.522316.35851@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2a895f2c-76ec-4636-9a99-20ad3522936e@citrix.com>
Date: Wed, 3 Feb 2021 17:27:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24602.56036.522316.35851@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2ea18bb-d9ba-4bd9-ace3-08d8c868ee73
X-MS-TrafficTypeDiagnostic: BY5PR03MB5061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5061383ABD49641EFC9141B1BAB49@BY5PR03MB5061.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeI2bV97lg5CAuBXflePzHz2Keygzc4RLzsLsEqKpaTDeXqFozY8KS09NLG9BqM6T4wfB1wVxcS9jJg31DWUOYrlvcKMsHdoi4MHD+gavc/hVWQqHjOP6x4Kf+VZ4fBPZHJSXEqlV+L9Td8fePk1ANVRdf2HW0pGCs1ZTWhNfKMlXb2359vA+fNDIYx4eWuW9ImNqH2LsfHWVGBwu8h/ITEa2leE45EyVPiuW3FLPueGyez+PwdJCMA/4jKkGPir/Tx/mhuLcvMEuuYnQy3z0jvTS7/oFrRSrQ4TmsbOJxiS9TlM+q3SMg7WojhOW9FzUBGtwaawhkaLaY3XjHlI12FLOEzUWq+RY2abMrKVxjZ5eJHmrEJyK8TkxDxD9BhpUZZ9s7H/+yZugvN+5tJN1rUsLWCkGF44QhqUIR+tB9PCXENESQbN1xJoLGrtJit3yq4OOW2Ve9z2Mw/IPAPZd8sM1c9Dd1Az5vC1BNfF9msAmFXXVm2RFu4a23fsqIrICAekw9Halg9aeZG8H2+c0VrbH2gYYcePa89m21SEGXur6KddHU0csq9hfvthRGmLqT6dHlvSVPvF+/nmJyU2gFttM15eC/kbecIRYX992uk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(6666004)(316002)(54906003)(36756003)(31686004)(16526019)(26005)(2906002)(8936002)(83380400001)(6486002)(8676002)(16576012)(5660300002)(31696002)(86362001)(478600001)(6916009)(53546011)(4326008)(956004)(66476007)(66556008)(186003)(2616005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YTdjMWdGWmU1djBHeXZjWXdiNGw5UWx4dG1ReFZRZFNyV002dlpPakEraHNS?=
 =?utf-8?B?N2JnWmEvek9tS3d4VHVlS3VLUlYvM2cwMFZ3anFrQXZYWmYxN2NTOE5WRmFJ?=
 =?utf-8?B?SllUQk5oMHYrbzZzVko0cE1BYUpBb2F2OEJrYjlVOHVRZHZ0VlZkN3VxMVhm?=
 =?utf-8?B?R1J6NWNOeXYxK2JJOC90L002RzFIWFNGL0VOSXZoU1hyN3NiczJmelN0bnV6?=
 =?utf-8?B?azk5UHRVL0FTTW4zSnNFNkRzWE1OMVFDckU3bE5EcGYxbXhrSmdKUUFWN0p5?=
 =?utf-8?B?bTNMRzNjVVh3SndvcTYyeFdVbFNaUVpZS0RhRHM5YktoT2tjU3QvK1JSRWpn?=
 =?utf-8?B?WS9xaWNtOXpPV0svUWU5RmVOeVM5R0lWcEl3RDkyRHBmVnZZNVZFdG0yUFRI?=
 =?utf-8?B?OU8xeWpzNTQ2SVl5azVkMUhwOGNGckVKV3RWN2sxY0pXMUowSjRsd2x3VFo0?=
 =?utf-8?B?bzduNGtaTjRucVdVUjVFb1lsbHhYNGFWd3lhTDZVSDFxcTVQTTIydDk1WWlY?=
 =?utf-8?B?M1FpMXRrN3BSZ1FKYWo0V1BMTmx4U0sxazBtOVdZRXNxeTVxRHRuT1ZUZzF3?=
 =?utf-8?B?TmVrWWlwNmlLaWhpVFVGM1ZSdlpYUWVOWnJ5bFpwc2t6bUVvb1p1ZkVXS0FP?=
 =?utf-8?B?T1Y2MkFsVGw4MWhjVVlOdWF3aEMyODlJSjdUUkVoZGFPTkVHTjlKQmMzNHUr?=
 =?utf-8?B?aFZ2U09ySGl1bnBTYlB1T3FiaGVSOE56YWhqT3NqOFkzWWFJQmxmMTJTOEY1?=
 =?utf-8?B?Q3FWc0w0eDlCbEtQMTVmNXhtNnpmTFU0N0hRS05jdFVLNVl5T1hxUWZ2czI4?=
 =?utf-8?B?cDZSNXdLNHBFWlR2VEhQOHIvTUU5b0ozWXN0Qk1BZVcrcDNSTnJQZUcxTDBz?=
 =?utf-8?B?ZzVHdllNbHZYaGJYMUp5R1MwNXlIbi9BQlRMYk04SkEyWk5PYzhyUFdyZVRZ?=
 =?utf-8?B?azYrYjVSdkdXQmMzcEdGQTB0b25vd0plZHZrLzdXZ3Nqa3gxR2o5WEhmVHpp?=
 =?utf-8?B?U05kTjdHdHpqODA2eCtxblBwSnhNVUxuZkoyRHM0eU56RllDK1BXVXJoM0py?=
 =?utf-8?B?OGxtcDVCWTZwYzltZVNwUUw4VitaN3FTRklKR3k5VkREZEFXeUdaUW85VGtK?=
 =?utf-8?B?UHFHMExuRC9iN0JxWEZvQjRaRFFmVHFEWmZGS3VFeDQ2eWRPdzNPRGpPemVz?=
 =?utf-8?B?NElsRUk5ckhCOVVwbmViR2lsYUE3RFZIV0g0NXAyamhWQ01YUEc1eEg0M3Bk?=
 =?utf-8?B?eWxxSEFLMDVJRXk1bkhvMFZEY0ExcTZhS0hVZWxTczVsQ05adVh5VjBOREcx?=
 =?utf-8?B?M0JxbkY0eDBJUUhFZEh3cVNTQVc1emJDQkptb2MxRUI1K1hHTFpGMzNGakdR?=
 =?utf-8?B?WEpBV1FodU1zSnJ5YTdhYlZnUUEwNjQ4Q2tYWVJyUWRTWjZzWDlmUUgzeXAx?=
 =?utf-8?Q?BJDVw2Ow?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ea18bb-d9ba-4bd9-ace3-08d8c868ee73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 17:27:07.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cd6wZUx+o/h6E5RYoMxNbaIN/jj60DRIQf5K/ACTDWmlF+PAUVDSg1bhh+5PytwMUD+SEER3cxvzXCI1/jHbpxIBX4iFp6TfU2O2retFJbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061
X-OriginatorOrg: citrix.com

On 03/02/2021 17:18, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource"):
>> Simplify the FreeBSD logic, and duplicate it for NetBSD as the userpace ABI
>> appears to be to consistently provide EOPNOTSUPP for missing Xen/Kernel
>> support.
>>
>> The Linux logic was contorted in what appears to be a deliberate attempt to
>> skip the now-deleted logic for the EOPNOTSUPP case.  Simplify it.
> AFAICT this is a mixture of cleanup/refactoring, and bugfix.  Is that
> correct ?
>
>> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
>> index 565682e064..c0b1b8f79d 100644
>> --- a/tools/libs/foreignmemory/netbsd.c
>> +++ b/tools/libs/foreignmemory/netbsd.c
>> @@ -147,6 +147,9 @@ int osdep_xenforeignmemory_map_resource(
>>      rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
>>      if ( rc )
>>      {
>> +        if ( errno == ENOSYS )
>> +            errno = EOPNOTSUPP;
>> +
>>          if ( fres->addr )
>>          {
>>              int saved_errno = errno;
> Specifically, I guess this is the bugfix ?

It is a bugfix on NetBSD (for brand new functionality), and cleanup on
FreeBSD/Linux specifically split out of the previous patch.

~Andrew

