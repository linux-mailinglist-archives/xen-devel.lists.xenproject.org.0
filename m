Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C32E4A4B8D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 17:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263207.455840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZJ4-0003kQ-1z; Mon, 31 Jan 2022 16:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263207.455840; Mon, 31 Jan 2022 16:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZJ3-0003ib-UZ; Mon, 31 Jan 2022 16:13:29 +0000
Received: by outflank-mailman (input) for mailman id 263207;
 Mon, 31 Jan 2022 16:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEZJ2-0003iV-AV
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 16:13:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89d4c1c-82b0-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 17:13:26 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-ubqPFKwgOEqhvV-G7mZ5jg-1; Mon, 31 Jan 2022 17:13:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4952.eurprd04.prod.outlook.com (2603:10a6:20b:7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 16:13:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 16:13:22 +0000
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
X-Inumbo-ID: b89d4c1c-82b0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643645606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7agNBwAW35NCMmLxaJCuGiltg/y7cl+y+ySz9srLAY=;
	b=EC9egzWw8hV46z2f1LFdg/0gIK8cQTPQ2pOnWhi4DKVTkPym+IPJz2b1188vu1zvuQ60WG
	y0q0Y00k1q7ttHL+zISmQz84Y5ofEMzQAd0yYdpMXMMZeqLkeGGasM8/Rle2zvcCg89Jgb
	MqJ6J6vyznYLN3YmcwNLCcUGlvj2UbU=
X-MC-Unique: ubqPFKwgOEqhvV-G7mZ5jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuW55Q7ezPPGkhb5YEbl4USLrszxSOO6/ox2LRXo4/gpMYmYZXz1tAhi8hKizdZUaBLTF/LghWta6di69AJBLphi0onBRYkG2J7pYasTlOazL2uaP+Zya3Q1XcYCAyTPtMrPov0IofzdT408/BDpruJH11GeitUhCH9AZFYmPW75oj8Xai7CEFO4EXmVH6rIIcLW+l9oSEZpa9wYS2/UQ1LCOSCy0iF0f91tK4yH2bYUgewn6a7W1ih6RiqwSgOe6ZtF3zJQiuIacTJDv2gELnh9oVLkVJkDJBDCSDP5+HISnNIYeS/opLzazqwEDElY3beRclWeZvGcQfhIp8p+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7agNBwAW35NCMmLxaJCuGiltg/y7cl+y+ySz9srLAY=;
 b=lp717sMPWS5qK+eHh3gBEaUlC1qJtvyJxYZkT6AflxqRX5zkrLCdYg1ORBdswbM4f2vKe1oOz5OfFPXXV+xS/7M2lKdw7wb5D7Ah9cSZqxQTWu75lpQcYhbm2EkUsaimdmEq3PxzkqjWxPIfBstn37yIENKpEoXjPIx7EhkLaIzbkbOoVnsbD0lKBizBQkByZ0krhq1sT+/oSbfjhzV90ZmbT702LwG0N7zvxcb9jeoHtCKqqs1zACTnEU2JB/oVYyrdRpRzos6rRFWRa6d0RYk24P5E32oqBawcmbMoFpKEvhi3cp+mq/9VvmmSkg3k4XFRh8nE4ikLK8pEfumEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0d824fa-67ae-1d42-2f5b-9e900d861936@suse.com>
Date: Mon, 31 Jan 2022 17:13:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com> <YfgIrNqGzq7s3Cz0@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfgIrNqGzq7s3Cz0@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0017.eurprd07.prod.outlook.com
 (2603:10a6:203:51::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f78419c4-bcfc-484f-a1ba-08d9e4d49a7f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4952:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB49520EA18B073814691B8A73B3259@AM6PR04MB4952.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c36DdpERYc6wVegD2M4fZR8hG3mZ5LokxOqFY9FMLw6ve/CS6MC51aPPToT7RA+SDMHrvmuRoQaQqlPoG7Q1Y8iEHenxe/HFfNLmkgpAuwneyZdJlw9XICxz6EiDJl6O9RP9lBjPzLvRz/MYPbX8RKKOPZaTOilmxi1L09TC9kitvD9aoZTmMVJnAvdLkGBJHVN77CsuP6Xjey083iSbBksQFN75hW492dGafBONz5zPFteGpQyajjGQRZxKN05Zw3I+qqsd/t1LdiyydswrBeAafvquxfi8K24wIoKFIcyCKnz+GCVv8qToXDZyXI8Shs5FYb5wuapX0L53WNHCDxOEheo9YZqQf3zj+WvQHM/QYIu/cBoDORnlEGuSeORJtQf2W0x75JxwRmVi7Gz/mTvpl+8HRtbYuqTu5IOiH9hIyt+LCk66LMeBWSn0TRKrXFf0KJGUdVAQX4hYYHzfdIMAaVDz+QOSuLkl0pYnQORHI1mWnTeeCq3Mtz1WbGkrbIYE/f87ViFj9xyLvrnRLqFru8pK0vx4TJhZ8VldFzOgyueYng8wJh8+noEYrXJVJUJvy5caxRPLnTKjXgHTNMuenLUmN1j7XLobFue3AHn9iNgd+5qSiENpP33lT/gTIzK6JTpzrERvD9ul21gE2WjnTeBnUbW8YbfdoKw4NAG6u5DQDD/XDoqXOb9ZTg425nTgRuiaQCmbK2rAZbfUlQ0D3izFfaHY9rwW9gBAZoQWB4HCj2jYkSK3WoNDQWCt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(5660300002)(6512007)(36756003)(26005)(54906003)(6486002)(508600001)(31696002)(110136005)(31686004)(186003)(86362001)(53546011)(4326008)(38100700002)(2616005)(8936002)(8676002)(316002)(66476007)(83380400001)(6506007)(66946007)(66556008)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5CWlNKY052bTB5dmpPY21wckNzOWMwTENaRjdhbHhZOTljNFl6dEg0bERX?=
 =?utf-8?B?TUpTdGNHQUgvaWl0UVpIenZUckorTU1sSXpYVUhEdTVJNWtpd2I1bG9YdXVy?=
 =?utf-8?B?NHlVbFMxR3VOS3RIeFZhUW5qVlJlWXlidFh3Vmowa0dIZzZpSkpQL1ZyelFp?=
 =?utf-8?B?VkJ2UHpob3pNdG5HQ3JXT2t5S2Ryb1I4MHA0NkpSUDAvdWVROGR1dUVvZWVS?=
 =?utf-8?B?Ymt4MDdLVEY0L3FjNXYzbllUb1A4Z0cyOUtaM1Npdzk4Wk53NHYrWTBHSnQ0?=
 =?utf-8?B?UUUyZURGZ01mYml2L1ErYUdrWElJeXBpMzRUdjdRTDFpR2loZVpMTFdUREt3?=
 =?utf-8?B?dTJVTDhTcHYydzRBNTVyMTE2eGtqZTdTS2ExbnZleksvdFFkZG9MZ3JWNWF5?=
 =?utf-8?B?dXpoNHRMM3UxcjlGaW8zTWVHMVVUZER0TURhYTFqRURncVZjQWUvVVA2cUNm?=
 =?utf-8?B?emt5TTB0bEZWeVhXekIzcUE5TkxYcTR2VE9yR1I5NmJKZE5IOFZVUjNsQkNi?=
 =?utf-8?B?NW5DK0ZQeC8yeVZEeXhqdld4WFpiZVdZU1lodnh0eTAvUG55UVZ3eFpaRDhv?=
 =?utf-8?B?UjRpc0JnQ0RqUnZEZlk4TzhNQVZXbVFhTFFnVnZJK3dHR0tnd25WOW5ueEJU?=
 =?utf-8?B?QlFSQ1E1TEdvWGFCcXpDUXFMN0tUZlRoR0Y5SVJPbnpQQUJHemZZaTM4V0to?=
 =?utf-8?B?ck1ZaUV0MnZrUXVoTTRoaWRQbzJab0t4VWYzNXFVY1NNZXhRaTBPc21PSEN4?=
 =?utf-8?B?T0RJTU5BSVovNDQ2eEw3UkthTHZ4TUFZV29HNTZGUXZhcTNxZHN4R0t3eVVQ?=
 =?utf-8?B?Rm15ci9vR3JKYWxyV25XZGZlUnU4d0M5Uk5sdFpKTkhkV2wxWnZqbmRZRFBy?=
 =?utf-8?B?MFIyZXNqcE05a2FRRUxNckV6dHBTaTNXbHFaeGxnZlNJc09SaGpoM3J2MkdL?=
 =?utf-8?B?UE8yKzNSenFvUSt1K2VYVk9XNG5yNVBuZ1dxMWtNSDk0TmZpRUZjMVVFN04z?=
 =?utf-8?B?cWRHbmpKeCtBNzFNUUtqeGdFc1EwdDJoamh1enV0QmsyZGRna1Fua3VUcmo5?=
 =?utf-8?B?YmYwaDdIOEdzVHFKSHdZSXBZWVhDeks2SXF0TGhtM1NpRWlkSUtsaFBnT1Rt?=
 =?utf-8?B?dXJGK1NtUDd6amFYOVQ4aWJ5MmM1NngrK2tZNU1kbzlvVUMwdVF3YUdSRzl4?=
 =?utf-8?B?bXk1UFdFaC9TdytUUDFXSU91RUlhUk5iVnUyUzJxUjdXKzJBcEM2R1RrL3U5?=
 =?utf-8?B?cmx1RngxQlZsVzJmL3FZbE5zMTkxMDVCSUFLSmQ2Yi96L1RXNmVMR2NvS01k?=
 =?utf-8?B?cGwrdm5ybVZ4Mk5MMnFwdWxoM2VHK0dBdjh1bTU4R1gvN3E5cS93aTJKa0Yw?=
 =?utf-8?B?eElJcXBGb0RWM282OEsyYVpYQ1NTaFdsektqS1o2RzFxYTFMdkR5UENhN1Ra?=
 =?utf-8?B?N1N0NGoyNzlTa1lFWE9BbUxTL1MzU0J4Tnl5eTNwRzkvNFFYMFNDSkhVeHcw?=
 =?utf-8?B?NVA0TUVaL0tiRG9RWmluN3hGendQMmsxUXA0TENvcnhWOFd3UmJuUkFieGNr?=
 =?utf-8?B?VDU4UVpaM1BLRVUzb3Z0RllUVTRGZndOdnlNMklCWS9JVjNhOWdzMGNOaUkz?=
 =?utf-8?B?UWwwdWFJZWJ2ZTBRMDNCQ3Iyb3FyZHhUV20vbVRHNzVrV2szRGxDL1hUMHRp?=
 =?utf-8?B?WVBEelhNU0lmQ0t0RVZpc3Btcmx2NXBZVGQ4ZFBRT1VReS9iTUF4QzZCU0wz?=
 =?utf-8?B?bWRDZ1puaDZxOFdMVlJucVpWc2hEVmxTbW5Mb1kzRXQrbE9xNWNtSEJPaXp4?=
 =?utf-8?B?TERlM3dxOUVsL2FGM3VqRnI1SXFzbHM0NTV3TlJobTRXMGk2cDRwVUNvdjVo?=
 =?utf-8?B?VnFZM2RRenMvbGtPK2lxb3pUbHJhL1g4L25hQmhlZjJZUjBTZ0Q4ZkpGdEl5?=
 =?utf-8?B?YmFhS0ZUU3RmOHJaaExNYVhUWi9CWGpEUnlobTlQR0wwZ0NXYkV4d25TaUsv?=
 =?utf-8?B?TlZ1eWJxTnBNa1EwZVFDSFl3dGlGY2QvQjFLOXF6S3ROSlA1N0R4TExZd3h6?=
 =?utf-8?B?VFExRHdIcnl1V1NMUm8rU2JvMFZDelFNb1lZc1lSZmJ6K3JVd0lXWVl5cmlW?=
 =?utf-8?B?ZFdyRzltK2RKTDNuc2hYbkJVeWxuUjFWbkJiYnZ1ZlFBdi8vOHg4RExzMVYz?=
 =?utf-8?Q?Y6LUvayFhFwXl6cGW+JHEpc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78419c4-bcfc-484f-a1ba-08d9e4d49a7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 16:13:22.7922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSOXp9AFAOm+RuMpVTEyNWXWbfsPm5ZMSQH2sZK3WAMY+HuItyAvTgWzdl1w3dqOqE8Q4ttoFQxxuM/cbDjOAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4952

On 31.01.2022 17:05, Anthony PERARD wrote:
> On Thu, Jan 27, 2022 at 04:01:33PM +0000, Jane Malalane wrote:
>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c
>> @@ -819,11 +825,44 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>>  {
>>  }
>>  
>> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>> -                                              libxl_domain_build_info *b_info)
>> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>> +                                             libxl_domain_build_info *b_info,
>> +                                             const libxl_physinfo *physinfo)
>>  {
>> +    int rc;
>> +    bool assisted_xapic;
>> +    bool assisted_x2apic;
>> +
>>      libxl_defbool_setdefault(&b_info->acpi, true);
>>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
>> +
>> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic, false);
>> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic, false);
>> +
>> +    assisted_xapic = libxl_defbool_val(b_info->arch_x86.assisted_xapic);
>> +    assisted_x2apic = libxl_defbool_val(b_info->arch_x86.assisted_x2apic);
>> +
>> +    if ((assisted_xapic || assisted_x2apic) &&
>> +        b_info->type == LIBXL_DOMAIN_TYPE_PV)
>> +    {
>> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
>> +        rc = ERROR_INVAL;
>> +        goto out;
>> +    }
>> +
>> +    if ((assisted_xapic && !physinfo->cap_assisted_xapic) ||
>> +         (assisted_x2apic && !physinfo->cap_assisted_x2apic))
>> +    {
>> +        LOG(ERROR, "x%sAPIC hardware supported emulation not available",
>> +            assisted_xapic && !physinfo->cap_assisted_xapic ? "" : "2");
>> +        rc =  ERROR_INVAL;
>> +        goto out;
>> +    }
> 
> Would it make sens to enable assisted_xapic and assisted_x2apic by
> default based on hardware support? That way users of libxl could benefit
> from the upgrade without having to enable it.

I think that's the only sensible way - disabling by default would result
in perceived performance regressions, I suppose.

Jan


