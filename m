Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77ED2FA7DC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69929.125364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ye9-0002QJ-PE; Mon, 18 Jan 2021 17:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69929.125364; Mon, 18 Jan 2021 17:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ye9-0002Pu-Ll; Mon, 18 Jan 2021 17:48:57 +0000
Received: by outflank-mailman (input) for mailman id 69929;
 Mon, 18 Jan 2021 17:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1Ye7-0002Pp-PR
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:48:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a81b9bdb-8d93-4ee1-8266-bc584fd744ab;
 Mon, 18 Jan 2021 17:48:54 +0000 (UTC)
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
X-Inumbo-ID: a81b9bdb-8d93-4ee1-8266-bc584fd744ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610992134;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p7YXtLc8GUmN7+veLz7D7wVYbkmwArrKGn6VZAw50d0=;
  b=PbAKxgMe0Qp4UtamSazlTn1JKzhd2VYzbMww7a12AGVdVmxQcOSMYVND
   VPiQ3y8pjaLHZTy6vrQPKOvwEb+vfUexRWb6V9NZ6ARpGqQBXUQ2qSEoR
   FQM2pA1G5wqtxnPM1DG4sSA3ojHTzOTz/7+M8cDR/1S63UbNqPV207Jre
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i6JFGPTksSGaCaSNHfEzI59E2xPXqSvvIyzOqQGnh5QJGBAwwzkjoHro39wz66CkyKqrXkzOAo
 uGwPoP4jUhxbmo5YXzKUw+dOzSXu08LmzhJM+JGv0TNIdqKf349sQArr+1ZGd/Jd9JqhfhMP/R
 smAlRhYmgllUBXsyXot9/6JGNuVJlO+vEW+NT0/YdzSYPJ1L9CGlgfZ/Y7AvFzxBJfbuCKcCQP
 jPvVanO5FfMy6RSGD2V/+NI1eVL5hoJOKbheOy7NdIHL+U6JNpdwYwpqGxP90XORGIxbYVdvkE
 s/c=
X-SBRS: 5.2
X-MesageID: 35694545
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35694545"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmC7JF9OMrXekcdpAkRwsgwsDlVm/FFxFktkO7qPVNCKeQe+bUunE6aQOqwIQqNd759RHAY5EoSFXQxMUXeeDps+QzlY/9zTl2j7ptUvAkH5zrgaDm5LgF5Nx3tBwQQ1juXrY2FHVxt+sNPDdBP9BuECDYzOp1xej8dnBp8WLOXjL4Kz6Ds2oYJUbfcysZg7Fpd9KTWtoH6yrflpZDZStDnRAMutFbNPNmJv05hxykRxzmpIOv02wPBjYXrGb+FiDlZDKuaQId1nEiHHRre29lOpDz8LDO/eUdFxHS9t47Tb53KPx+onyF4f2LsZTsqgaGqjklhdOQbVn9QvBcfAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM55XNUnDFYW7D4RFM5GQMMHi1vq3xGtmoO6SUQuCCM=;
 b=K2JeEVOWUYrnO4OAcHe8+iJMrZlZjGc+/vHBKPbFHN5pTXLaKODhyQdzl1kGE9Nc655zrglpHn3z34h0z9Capta7872XuwMZ2/pB/IiVWI+JdrrNInUtA3Qmrpp9mZtrssBrs4EvkodeftHVNZsIsCGeQc+oAwDxfHW9gjWE+FLPJM6sRFULdw5AEflNFNEgGHx26yTkyWTwChvs5gAz5F3/Vg1yl0FgSSuXLgBS0yaTM18fJ4RdPJecd/0nEY0gH1s/UzDdI3p944IhsHT7xSSoI4+CehlpV/CtpVoBNpazbdVfXi3/vyMLIUZywmnr+uoJsIosoVLMP2nQMSw0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UM55XNUnDFYW7D4RFM5GQMMHi1vq3xGtmoO6SUQuCCM=;
 b=uNVOI564QsXDogDm7QAae0PxgNab0wttE40vvZ1HhYiPM4iDZ4nREOIVQ9/y8D7DRPsFlLTDfToO75dhKYzubGwTULE2ht2vjIZHsQCu6TYRd5XLHjR9sS8F2oh30VxobdhpHi6My9q4/ApkEKu1rkDBj7DJwUdFnkkGTTQb8AY=
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
 <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
 <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <071f8921-d0c4-6907-697f-25a4d905fe2e@citrix.com>
Date: Mon, 18 Jan 2021 17:48:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118171040.6ube5htw5lk4hifc@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd69d1b4-f0cd-40e3-3070-08d8bbd95070
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5886328F52AC1B11E108B8A0BAA40@SJ0PR03MB5886.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3WzCVWCfp8QWmTGPYDegyLtXDVfoeHDkqvBYfCEiK3+c+p8E6mg85NpknQ1BvSWlMEOHcW1HkWsZJLIAwU0IICnmbGbcFC4klLEKlgduaFBSpscl5FiYJRJbqz/KkohVkzFRlqGDXl6ZF3pSi0+Wf6iNXASpNS7+q232+bIrUt32iPMuQH3Ln2bLYQRnbrwoFQjbqOMga83WqDAEdxrST+emPS0lCk4M566Qqfm6Twc4E0cQGPKI7L5m7TH5pGq+hIayhYh+suk2bvUq07dKmQG9guznHmUATzMLdIXM0+Z2bxUIa7h753tMGEejAsXnKC230ItFUxl712FPixPrampRXOnLkLf7l+aO5e0zI70AEgAXJcigCXLCloO56KbZL/1IUMbizNweQNQhRmq3L6U8PLtiiVndOWr1TQC82TGH5jLKlGVyrdAVquCxmICNwKF0CbakaPjgO/9rP8jsbFcGw4UZPg2DF8qhQDf7ReJGeCQ8YZqtSTzy8iYo5AFg5KN1mU2+7kAgY1Wb4apscPdXFZlJjK9rc3qsnt4JoNMdDQJTb6NR4RB5F1bjPYd8eCH6It39ErTd4/JaESaedIIIhYuUCzjYEzCDirIoCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(4326008)(31686004)(478600001)(6666004)(316002)(86362001)(31696002)(956004)(2616005)(83380400001)(66556008)(66476007)(186003)(36756003)(8676002)(8936002)(16526019)(16576012)(2906002)(26005)(53546011)(66946007)(110136005)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mm8wUE1jUEhOMERCY3BVM2RYMmFkVm1EWDVWdDBwSjBmYXBlZHVEVTRjM2Fj?=
 =?utf-8?B?aUV6azhNdUx0aGJ1bUovQjdWTmhtZmwvMnRQS2MzV1Npakc4MFBlQUJEOUF5?=
 =?utf-8?B?L216U0tjbWNGNTUvVjNCaldnRWJ3Tlo0WlRMVlFNUXVzOU1KblRnUFJLMXVr?=
 =?utf-8?B?aFB2R1hJQ2VLRFE2N29oamwvVmM0RmRjVzNVVllPYVM1SWZIdGtVck4zWlhO?=
 =?utf-8?B?U2VnTG5mSTVzUHVSOWpxRDBqOENxV0tFYmhsYjRYbER2bnJSTXJuRWVUNk1W?=
 =?utf-8?B?VVBveGx4b0ZVa040NjlVN0dGWnRYU2JzRUQ0UW43Y1VaUXArL0ZHNWovQnVG?=
 =?utf-8?B?eFhRR3M4dWNpQTFKQ0dReStOVFVvamQ3QXZMaVBydTQ1TUFXZmo4Z3JJME1q?=
 =?utf-8?B?aTgwR1FPU3hDYlBKMnVyck1Gcnkyc0x1dzM1YlpNdnk1YnlBVmVWbUVZa3dp?=
 =?utf-8?B?bmk0MDNXWFZ0bFNMcUd6RGJ1ZVFRdnhaMC9KLzRKU1FHT2hiVStVcTNEVmps?=
 =?utf-8?B?ZzdNNlc5NmUyT1ZRMHJlQUlwTVNYU2s0cWpFdDJqK1c1UEoxcU53bVlEUDRs?=
 =?utf-8?B?clkvOHRiUWw0QXB5aU5MUks3RzR1MUFXQnI3YjJ5cUJ1V1R3UlJ4NlZZQ09u?=
 =?utf-8?B?RWRqQ0poZXRtdWxvb1JoWEs2elVmWWo4MndTRW5uS2FwclNMZXc4S1VLUVFz?=
 =?utf-8?B?a2U2RXJXWXdXN3V3Tmo0N0xTd01iMVAyejU3ckpRcEV1d3hySkQrWEJzTmc1?=
 =?utf-8?B?dnQ2YzI5aWJxM2hoTDZYRk5FTEMzbE05b3R2eTNoZ1ZtY1RhQTQ5Y1dscjlH?=
 =?utf-8?B?Tm1Kc0NpUXcvbGtuOTRsaTRGT0lpUXlBeWJ1UzVva2kvb2JFcDBEcTVkZjB6?=
 =?utf-8?B?UmtGbUJvOTZxSmV3WnZQUmwvVHJ5M1dMVzBqKy9vZnFDdzRZdzJTQ0t1S2tp?=
 =?utf-8?B?UzcwcHFQTzR1VS9qMWt1RXh1bklFWnhjRDFtcFBxMCsxZ2NqcCtrbjNBc3dM?=
 =?utf-8?B?d1p6eFRPU1FMVGs4TENaK09DenJNaGhhTC8xSW5sRS8vcElnaDVmNmt3czYw?=
 =?utf-8?B?blRJZjlmZnBPTVlQdzVPYWlZcFJyN0ZxSTVsVlJPSWtYcU5UNFZBb0VZekZL?=
 =?utf-8?B?UHRZQ0VRYmFucWxXNVNNMjA2QytsYmU5QzUrMVhpZjBIU1p1Tm9pZEprblBI?=
 =?utf-8?B?ZlhPczJzVWFTUksxcWIxWFovWDZYUEhvamoyMHNnVkJtT1BITCtLaFp1c2Zk?=
 =?utf-8?B?VU1mRlkwR0VCWC9UTGU1WGlPT0JMWTExNEFSUnlnNGdWbnF2YkRpcEJDekcx?=
 =?utf-8?Q?BlshkUZd4QzV89TcqQtNZ1TvRYKl523Riy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd69d1b4-f0cd-40e3-3070-08d8bbd95070
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:48:50.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0gC76eEcvbMkCLGFnJ9O9XeBlVa4NV91T+nKUVO16IQWqeCzA5QZmW5ppFEE79mhepucIUC8p1xfUnaBJISx7HNUSOnOPpT0vsXd5VnCPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5886
X-OriginatorOrg: citrix.com

On 18/01/2021 17:10, Roger Pau Monné wrote:
> On Mon, Jan 18, 2021 at 05:04:19PM +0100, Jan Beulich wrote:
>> On 18.01.2021 16:54, Roger Pau Monné wrote:
>>> On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
>>>> On 15.01.2021 16:01, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/traps.c
>>>>> +++ b/xen/arch/x86/traps.c
>>>>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>>>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
>>>>>  
>>>>>          /*
>>>>> -         * Indicate that memory mapped from other domains (either grants or
>>>>> -         * foreign pages) has valid IOMMU entries.
>>>>> +         * Unconditionally set the flag to indicate this version of Xen has
>>>>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
>>>>>           */
>>>>> -        if ( is_iommu_enabled(d) )
>>>>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>>>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>>> ... try to clarify the "Unconditionally" here?
>>> I guess Unconditionally doesn't make much sense, so would be better to
>>> start the sentence with 'Set ...' instead?
>> Hmm, this would further move us away from the goal of the comment
>> making sufficiently clear that a conditional shouldn't be (re-)
>> introduced here, I would think. Since I can't seem to think of a
>> good way to express this more briefly than in the description,
>> and if maybe you can't either, perhaps there's no choice then to
>> leave it as is, hoping that people would look at the commit before
>> proposing a further change here.
> /*
>  * Unconditionally set the flag to indicate this version of Xen has
>  * been fixed to create IOMMU mappings for grant/foreign maps.
>  *
>  * NB: this flag shouldn't be made conditional on IOMMU presence, as
>  * it could force guests to resort to using bounce buffers when using
>  * grant/foreign maps with devices.
>  */
>
> Would be better? (albeit too verbose maybe).

The comment should be rather more direct.

1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
mapping, and forgot to honour the guest's request.
2) 4.11 (and presumably backports) fixed the bug, so the map hypercall
actually did what the guest asked.
3) To work around the bug, guests must bounce buffer all DMA, because it
doesn't know whether the DMA is originating from an emulated or a real
device.
4) This flag tells guests it is safe not to bounce-buffer all DMA to
work around the bug.

~Andrew

