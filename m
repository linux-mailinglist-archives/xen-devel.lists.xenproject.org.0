Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC103039C0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 11:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74797.134458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4LD0-0003Qq-Pl; Tue, 26 Jan 2021 10:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74797.134458; Tue, 26 Jan 2021 10:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4LD0-0003QU-Md; Tue, 26 Jan 2021 10:04:26 +0000
Received: by outflank-mailman (input) for mailman id 74797;
 Tue, 26 Jan 2021 10:04:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjTf=G5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4LCz-0003QP-2U
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 10:04:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3c2af9f-b5cb-44e8-8c66-a2e0b5b5af17;
 Tue, 26 Jan 2021 10:04:23 +0000 (UTC)
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
X-Inumbo-ID: a3c2af9f-b5cb-44e8-8c66-a2e0b5b5af17
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611655463;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DLGcEW6CZ7Aft66sgUX0yiTFzwsLTm6o9IsLYrwG0zs=;
  b=UyXH0ZQEJUJmCHdxBU0OtzlYGy+83QkKf7wI7jT0jDy550jxFeAFtsK9
   zouWjPIYGF887rwAgIvSGd2Lf+PO88e5ixjVV0p62AFQJCZ/jbJBCAlNm
   akYoOrSjPpTTxM9cQ18mQFs+090suV/AisZTvDYVpKAisaB/ca0hdJmFg
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: miUaTISfMnSxmRXDNlbIHUwYqsTkK0I2/UHUXCwk7+zK3ctN5JvLv2UM6Nmpv37aS3hK4nbP8B
 /7cbkMMubugH1eKQUFq6GKq46QNNmw5F4+JCvf0zpOVDtuf6b9ZwhzQ6S6t+CPd4HKdBQcyQj0
 lznJlcycDUd2fE5ihlRz8miWAq7c0XNS6aQ2vp7PuUL6alP+FLv+5yhSpw/hZOUsZY/tGn0lw7
 9V/coFsouCXiFyQ7hGfwo+x1IS+bEaz6Q3qjl6oputWD3x4t4djbW9AlwHBE3x7YiLAny6NMJk
 bGM=
X-SBRS: 5.2
X-MesageID: 35820504
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35820504"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJGUFzKQDTNwTMS9a+nysNkMqBOPbiwCRf5WyJcQyhDEtq+WE+3ld5h5Vw16L3OmDNPb+VR9kTzgZEAm5iu27deRWmPRCR/wp50ZnN++GeJlAK1bZ4SnViGRQCHCD76Uc0w1t03MntKrvV7wp4XYuv38dMAAU/mb2rYlhjXc1ru8SBmm1B3LwVWbn/zFovHGDKoG7tECZZOxwd6dwdoB0Fe5lypGdfa8uVXjqNRA+Dto01oUaJnxVw8J7NdUhv/FowqDd9BNiZr2lkgglhU+tQZCVlje+tb6nbFLCa7llj2hER2mkkWg20EvNW1VqmgDhVMZFWnsLMnVxyrU5OcVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLGcEW6CZ7Aft66sgUX0yiTFzwsLTm6o9IsLYrwG0zs=;
 b=JTHGkr0daXE397se72BJK7U/aSRMHStQe+N8FOS5/7qdoCK0jMv1TiV5lGe3qGOBoAvKo4yulO66feWX41lPxXEMNQ3dtBPTJxh97/hOnJuzqEeAe9FyJK9F5od5E+y4HpvHppLUISjpqjtEiSiRO0pP11lhzQ7luzM826iARQMY0uUz+Z/ho+x7Ri0rJgKzMfHiV7hdVftXKoZOpHzYLrLUSS6D+w4CHoyvgCUv10qdUGANBkd3lZCgQlf9F9PtJBHQYlMhRUI8bukBQ3SKEpD1RhcMZWdwrZUGmcSLtgBpsiHYSxZziFEeE8O5m8Y0sza/y4OA4pTgqcm3PcTAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLGcEW6CZ7Aft66sgUX0yiTFzwsLTm6o9IsLYrwG0zs=;
 b=OGVV5miQWWicAzidF1aQYFMNisEGYEwsWVs+InUDJlfVGprBZAn7lz8/wQPStaZyfvUSOhe19sziTFmF3iIMaPW22zmutHlw6EZ4HQrCuwq2WuCCTLUO2l8ss9J/uljlderGeVkLXsaX5nPqOX27NZ4yyGSd67hSWUsawL4ccrc=
Subject: Re: [PATCH v7 01/10] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-2-andrew.cooper3@citrix.com>
 <bd8061a1-70ae-13bd-906f-e4a180f394a9@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f765204b-807b-6186-dec5-eeb39004f5ea@citrix.com>
Date: Tue, 26 Jan 2021 10:04:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <bd8061a1-70ae-13bd-906f-e4a180f394a9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ef56005-0f13-4d68-2d36-08d8c1e1bf35
X-MS-TrafficTypeDiagnostic: BYAPR03MB4725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4725F18D6F2B117621728AFABABC9@BYAPR03MB4725.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpKq15iQQFxQshqRXv7PNYoxcwS8DGDCHGFdGwR1TGQjdGXBJFDNKFXLBcVbpxBvTMofY/gKSg9XxWw4qg0i9BGACMDxKy762OrPCPBoiK3e38YXd2WYmkA0sPTh5Y7wX09xTqWRL2SRIbym692s+FtzSRc7MJtwSNqBWJmFvbxom1DHsA0ui55ZegGpol4bUcYYc8WuTG5qIvl2IYSmy81MxXe34uLAF9Z5T8QWZbRXWoe89nPERp5iVzZmLk/U6hbCrVWXJinMsr50KDMcwbWUTUGNUeEHk6tWsrnY6epe1YQfxq5KUYreMrSoQ6rllwfdjXcIGLbVc3/OWBmeEay+U5YCrtbt96hnTeBj3MWzJxSXYB/4YnxsD1mHvxksQoA4RzCnMzpjZl/j5GWgnErDR65iyPaFxHWXr0SK/tQb9/hFwJUeeeyzQs2bkRXwe3L0B+z+gIzT6eR1Z716LHUTugZ8giNlLyb5o3gKZ6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(956004)(2616005)(8936002)(54906003)(316002)(6486002)(5660300002)(6666004)(4326008)(110136005)(31696002)(2906002)(86362001)(16576012)(478600001)(53546011)(36756003)(16526019)(66946007)(66476007)(66556008)(8676002)(26005)(31686004)(4744005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWU0djkzRW8vVFROK2JYTmVnNHE4RXFBVWxCZ0R5eG9HTm1QVmlLNFNlNS9H?=
 =?utf-8?B?SlROWHJNRnQrNU1UVW40a0RrUkQ5Z0E2VjZCWDZDYSt4TW04Zkg1ckhLYmQv?=
 =?utf-8?B?dnQ3cHVDWGwxSzl0ZzF2UFlCQmR6WGc5MnNFVEZqMDZmYUNaZCs1ODRBVzNR?=
 =?utf-8?B?Z3ZmamRuM003SWsxN05LTUhCT2RiaXRaMnZMSHMxZ1Uxa0xrbVpyeVZjQWF1?=
 =?utf-8?B?V08zNy80NmUwa1VFZ0Y1OHZHRGZ4emNIU1ozL29wVmhSeUZXNXNiL1dmYlVx?=
 =?utf-8?B?NmNyYlAvbjgyY0hhbHhRU2RMNnh6SkVWK285aWRyQUxqQUVQYUlRRlNKQzZW?=
 =?utf-8?B?Ykh0NmFkMEdrZmRYUG9oeUY1VEJQVVAxSC93Y3FHNXZobkxkcG9zVXk3YTBP?=
 =?utf-8?B?NEZSdXU3RERzNURwV1cxUnFmdUluZnVZVGRWb0loTmFydmdOdy9MNGdOd1l3?=
 =?utf-8?B?aCtDbmVXK1IrUTF6c09OYWpOZ2xkQlZ3aGU4QjUrNXhUR3B3bWNSL3M4VVZu?=
 =?utf-8?B?ZUtuRTZmQ1RpSko0Z0FMTHQ0UEM5UDVWS0pGOSt3WnM4Mm5ZbHdiRUxTVkk5?=
 =?utf-8?B?c1hmR2o2SlFISDRLdFZramY2U3NvcDJSVHYyTjJxSjU4TEpDZ2ZSdWNnVytp?=
 =?utf-8?B?RXhOUFFXYVZQQ1h2SEhvMkFzekdNRjJDbkdPRVY5UTE2TWFnUXl6MWFkZVBS?=
 =?utf-8?B?ZnlLZDVWSkxlN0xjbTVNMGNmNmZQeVA3enNyeWYyMkNTaTJuaFBKZHA5QU9p?=
 =?utf-8?B?M0loVnFvNncyU05ibjdwbVRzaG90d09qanh0NjBkSnhJTjRoM0NZVitjK2h2?=
 =?utf-8?B?SHFnbVF3Zm1XT1RtZ0JETGd3cWwrR295UDhnbERGcXk0RTQ3c291d1ZXYVJP?=
 =?utf-8?B?YVNSUXV6clZ2N1dwbHgzdFZPL3FXSnRGdVRzL01hT0oxNUlsbStiT21kTGtT?=
 =?utf-8?B?VXJGaUgreVlmTkZYUjFHVDNOS0hFMVdjdTRkRno5TWlwakFBL2ZYUFpMamNn?=
 =?utf-8?B?eGVsUUtUaGc5dU1YbEE3Z0R0MEQ4cHV2ZnR4b3VVTzErSUk4dlZYdDNWQmRv?=
 =?utf-8?B?U3VtcjZDcytYaENuUlIzcGpDSy9CUmcrL1pLaTZSZ1ZKZFlGM25sYWFXOVl6?=
 =?utf-8?B?dXJ5aS8rU25NZXQ1NmtKQ2IyQ3pMU2tVYkF0dUtZNG4zeTJrS2wzeWJlU1VD?=
 =?utf-8?B?NWxwUHE2MUE1TmhYLyt4WlNDR0Z4am1uMzhXMnRJeEd0b29PcENFUHR2SkFE?=
 =?utf-8?B?NW96ZmRDZDdYdCtQcERyd0d6TU83TFNsT2RuaW90UGR5akJwRTFGWWFBd1JR?=
 =?utf-8?B?YzVvYVVVb20yUnVOUWNGZ0JGS3ZSMC9pdzd3ZkJYT3UwRzdrK2R1S3hlT2g5?=
 =?utf-8?B?UDVubnM3NzNaZVE2NmJKcVRlOFY2Tks5TTNMNXNON0MvT1hiczJDWWpZbjV5?=
 =?utf-8?Q?Wxdeeg0U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef56005-0f13-4d68-2d36-08d8c1e1bf35
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:04:19.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPeXNlW+CkmxoPaYW18Iab+GbOI2fweR1tvoT7dqz27/F4hETyosUUKUN8nLRTj6r5aSds9SIG1hkB06zCybxbA5wMKM2AvigY4uaNuZp0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4725
X-OriginatorOrg: citrix.com

On 26/01/2021 08:58, Julien Grall wrote:
> Hi Andrew,
>
> On 21/01/2021 21:27, Andrew Cooper wrote:
>> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
>> index a073647117..d4453d2eab 100644
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -100,6 +100,7 @@ struct xen_sysctl_tbuf_op {
>>   #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
>>   #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>>       (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
>> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
>>     /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
>>   #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share
>
> XEN_SYSCTL_PHYSCAP_MAX needs to be bumped.

Right you are... Why didn't the build break on me...

~Andrew

