Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F34311CF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211758.369406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNeh-00060b-PB; Mon, 18 Oct 2021 08:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211758.369406; Mon, 18 Oct 2021 08:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNeh-0005xg-Lb; Mon, 18 Oct 2021 08:05:59 +0000
Received: by outflank-mailman (input) for mailman id 211758;
 Mon, 18 Oct 2021 08:05:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNeg-0005xa-AU
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:05:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ebc0e0-2fea-11ec-82ce-12813bfff9fa;
 Mon, 18 Oct 2021 08:05:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-4wy4WqCNO1CKlG3RFN-8FQ-1; Mon, 18 Oct 2021 10:05:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 08:05:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:05:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:f0::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Mon, 18 Oct 2021 08:05:52 +0000
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
X-Inumbo-ID: 38ebc0e0-2fea-11ec-82ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634544356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwUo7Lw7IfGtRWkL4PKNPB39NB8A/txOu8Lk2EVup0U=;
	b=HcAJWIKdTP46LTYvI7Amiv8ZHvXIAtl4snsb7utYB2qpCa8uTYGnCik3xZ5wJphQGmYNMA
	QxixuXawgiK+w2SLNYSviPQ/TjYoWELXHk93F2LCnKEPYS9ztQUjg8TzEUOa0yDZCjyjUV
	qyhuyAJdypHQ6a4dZnGU8iEQ/+irfpM=
X-MC-Unique: 4wy4WqCNO1CKlG3RFN-8FQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIe0vD0Qz2hlYPLXZY2ioFzAlJqSBZ6vDQr3Jhr8D3pZHChgtbpCmRjfoCrTf3apct9k2TqDt/vPTCY+khOkShMlPRtPn9uLV5wE/yvL54cUXp9EWYleu6cX3t3QZnisS52sjIUbULUvz6whgeeGah317ktFDnJk+n1kmgH4Ux5jNjO8BMOuCd4mJNmGVFBxomwiQnohVvm2Rvqu2PiQWN35dRVnURdjS6XY0vMRT3RdDAfVETZQnDgSAkng1B5WrSJxePYoR0oPM13M4PwsxOHnbW8s1cYsxDexvZUIlMGD0+0laO6BBQNHCce66DigpmquLyPy/+VXZNGjt/lcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwUo7Lw7IfGtRWkL4PKNPB39NB8A/txOu8Lk2EVup0U=;
 b=PCsE99MoeYTZ67yMB6KfHuL9wuHB9Prn19kFMcdQhJreEH9g6T1dt5JF4eKV9dkYskWzjs3CBCumtr2lEucU+vA7X0Bkn5LBwkRCn8DygLQvigVSDqvznhhSHKYTB6W5EuygP+9AhC8HyK4sYKLuzmIX/bynacMavq+MYbY0mrYFWmXdz2qCe2lBGivV1121tG5n3J8DSjG6qGoHG5anZMSgxBQrFlgnCVIo2NdrIIo/m4s9oY8/jLPVxKdm7RyC2eG0oacdO5UOXMOTr/lNk6CnT/96QfIM+RbmYXratkOIG3FserhwwmWDY13sQxDhGHJK6JYN7GGo2smnDukm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86/CPUID=3a_don=27t_shrink_hyp?=
 =?UTF-8?Q?ervisor_leaves?=
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
 <03f80bf0-047d-f940-72e7-7065e55d0d25@suse.com>
Message-ID: <d5a3a840-5095-25dd-a035-0f8cf745b861@suse.com>
Date: Mon, 18 Oct 2021 10:05:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <03f80bf0-047d-f940-72e7-7065e55d0d25@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8ca013-7f9c-4118-26f9-08d9920e1ae6
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942B7E4BEEBB21C34FED0A8B3BC9@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u5TlmON32fWmCgYb0r5ISBXnnCjWiWI7FMCQ2G2EbkrbD8cylFPLF+UGM/ly9lWGNoUQ9i/xQzmnWGfh+WdqQmueNnrG8jFnB44hKjESPQ0UcSRJ0wkmPLFXAhAeGcThsPVlO/oVrN2vBiRGW7ewTdM6cA0YrKzMrO6jvf88IUVl5zJtgHJsKNpdQFq4Ew7x3NWkFP3sFYeMRZQR1ehAV/yjg72uwxTl5zxra21wvBjky9X43EkaLx3cKmMewFklNYXfmbZhy1YcXn8cYKXQW5P0CNOqB/RQtal3ixX8+/fB9jGK1KF+3mDuTI//6Umt1/gszYI84bBBuy9hcLZIs73eBxSd3rkhSLZyYf6bQ211uhQm9L9GlLhJCP91WO7tuMi9wKEzsKbRrZR65oDV2esigWzcqxT0O5qfoGaQO+RzVb2Fuy7uyPaNQPZwLjBO8Ev/NVVzCGUEFuI/jWIYyaFb4grETulrgSUXSdEILSObBOgkINKv2MHpfQoYERRXm9BaYmvV/apRHZrN9mb8fo+wbSBkNugDxjXJCV7LjzfK1YNGUqbbHw+BvQJCrDEkU0quzQEis33icDEtfY80nd0/W/We7FI8bTiGWljCO2v7XZVbESg+5sNHOTq8p5ydWVC11vfNtBO0q0fNHK96JXofnVmQSVXsPyiFxSG4SQfwYXW1l6e9Jt55P0tyFVcHF9/6WOtpzZcgUboQhHAW/1bZRhiWUN/optqvpV3/TxiBvGOQ47czpgdzK5kpM7CCbgGNHrfaEC+Ch8OBP0PMtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(16576012)(956004)(66476007)(66556008)(508600001)(86362001)(66946007)(4326008)(186003)(6486002)(2616005)(8936002)(54906003)(53546011)(6916009)(83380400001)(26005)(316002)(5660300002)(2906002)(38100700002)(31686004)(31696002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1BWQVpRY2RGMEpNRmtleFZINkFNbGw0WmEzam5jdFhJSHZQRUZkcWV6RFhm?=
 =?utf-8?B?dG1HSG9YY3lxNzJrQUxYMkNwTGhKdVI1THMxOGs5eU9PSTl0dTRDTVYyQXJ3?=
 =?utf-8?B?QkFNdDRtOWo5em1JK1l3NDRJeVBHNU02UUVsS1dsTVR0RFlmd3UxTENSVU04?=
 =?utf-8?B?M3k4a0FrcjFsY1Y1aVNPOXNtRmVVQTc0Z3dyMGR0VTE3YzNVWlk3QVJwb1R6?=
 =?utf-8?B?M2pPMmVpazVuOVhLc21yUVlJa1VLZWQ5eVk1azVQcUgxUkh3c0xsc0lmRlND?=
 =?utf-8?B?VVB5RHMwTGdZR1J6QlgrdVZWeUluQXlpRDk5ZFVYdWlVbkttYTlnSSs1K1pQ?=
 =?utf-8?B?enhSZkdjT3dPUkZjMlJYZU1Dd3hrOTNnSFRLQjdBbUNvdmtZYk1MdHZLUHBx?=
 =?utf-8?B?czBlemZiRmRxdmtWS0pZeEJoaUVnR2cwaFNTdEYrUTZZcys5K3huV09qK08y?=
 =?utf-8?B?cVBRUnhGdzk5ZGlRNk1vaUtKdTdDeWdOMzBSL1NpSzBjQzBQVnJOWGtHWnAw?=
 =?utf-8?B?MWF3amh5NWxHQkpBeGptclY3M29YaDJqSnkxYVVMSGJuV09TSG9PdC9WZmpC?=
 =?utf-8?B?V0JwUDlJU0czOHB6WUtMRVlDQWxneC9aSWk1T0ZDMUN2TEsxRGxjSFk3MUZ0?=
 =?utf-8?B?Y25WMjdEYi9FVHdjbVNkcTBJei9VR1RkV1RkcGQ2WlJod1pyNXVPQWQ4cmlt?=
 =?utf-8?B?K3hQYkpiZG9OZVJ6RU1hMFJOMVlON0tnTHVTTEx2MFdkbjMxeFg4NG5yamJM?=
 =?utf-8?B?SlZVSmQwSVV0eWowWmhqL1ovMW5DV2VWcS9YRkRvb2VINExCVWhkTjIraldK?=
 =?utf-8?B?Rnp5SEc1Ry9WSXFJNFFKQzVUaE41Y2dZMUlRMEtEa2xaR3RWVkl4N2U5UVQ5?=
 =?utf-8?B?anZNWkpLb21QR0hCc1hsZENiVy9SSkhTNzhhTmJYSFhLc3FqRjcrRGhCcWJL?=
 =?utf-8?B?RURwZW1xaWVyR0tjcnZZV2VtbGluNXN1ZG5OYXVFYk1pU0lKSEdjT2JMQ2s5?=
 =?utf-8?B?U3d5ek5FV04vVkpaemFDTHUrMC8xeTRtWVdQaTNFN0xsaExqZzk4OWcxYVQy?=
 =?utf-8?B?UTJ4YUZjb0pudk14T3JCcndra2dNWno1dFBYYUVRV0V4aWxaK1IvL2R5dS9K?=
 =?utf-8?B?Y3JQcS91cWxqR1hHUVpFLy9rSlVwdmpMT25mRi95ZUtFNFhOWEM3RXlGcEcr?=
 =?utf-8?B?ejZOZ1k5ZWhobXpoaTAwZzBpN2xDYXd0UkVsNTNoQkxMczlPRllxUDJIS0xH?=
 =?utf-8?B?RTF4MXZ2QjdIUGFRUmJGTzJLRmw0ZlBZdy9WMVVwaXA1N0VQdWJhOExuY1h0?=
 =?utf-8?B?bVVZUDdSdEhZYkxScGN0LzdZcjF6V1pkL1VOb2p6L3E0V2Y3cUZBVkpqa2ln?=
 =?utf-8?B?N2kyaHVpdVBrSy9VRi9JdEg1SGwvV0hkWlVyNG84Wk1RWlJMeVAzVzZxR0dD?=
 =?utf-8?B?NEU5L1RIU1RpNndRZVlYRlpEbEVGdzNhcVpTc2ozbVBBbGt0bzBGRkgwM3cr?=
 =?utf-8?B?SFgvdmxSaE42SFlOdU5ZMU1ldS8yWmtEUVRGQitPWFBBLzBpVGlmRjQ0R0JP?=
 =?utf-8?B?TWZzZUtRQWVsZ1VqU0VmQyt4djVGRWEvNllRKytPT2pmdDVHNFUrK0JkT2xr?=
 =?utf-8?B?ZUNmVWM2d2lDS3VnamxnaUo2L0VtZ1B2TXNVNGttM1MzOVkvWGRxNUhVK1hN?=
 =?utf-8?B?akg2NXNKbHVWRTZwcU1zSVF3RVZCdVg1L3JicW8vOVB4dCtxV0czMkpqK3VG?=
 =?utf-8?Q?SvZkkO5XL+PNQ/dC7g6B9GUc77ds3VKzB66XUpa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8ca013-7f9c-4118-26f9-08d9920e1ae6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:05:52.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zn7wFz03YGWKprNUWBhY9k2dekPgSDXGPsj9DlMAFSV4y3b077n0OEOddwpWwoe53FX5XrPLbRKkfWBwq92MKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 06.07.2021 09:48, Jan Beulich wrote:
> Andrew,
> 
> On 07.05.2021 10:40, Jan Beulich wrote:
>> This is a partial revert of 540d911c2813 ("x86/CPUID: shrink
>> max_{,sub}leaf fields according to actual leaf contents"). Andrew points
>> out that XXX.
> 
> if you still think the original change was wrong, would you please take
> the time to fill in the XXX above. It was you who asked for the revert,
> so I hope you can explain the reasons (I'm sorry for not being able to
> deduce these from your [informal iirc] revert request), and I expect
> you can find this much of time when I've already taken care of
> everything else. If I don't hear back within a couple of days, I'll
> assume you've changed your mind, and I'd then drop this patch.
> 
> Thanks, Jan

I notice this still is pending, despite what I've said above, since it
seems unlikely to me that you've changed your mind and didn't care about
saying so. Could you please clarify things one way or another?

Jan

>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Obviously the XXX wants filling in. So far I did not really understand
>> what bad consequences there might be, but I can agree with the undoing
>> of this part of the original change along the lines of why the Viridian
>> side adjustment was also requested to be dropped (before the patch went
>> in).
>>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -964,15 +964,13 @@ void cpuid_hypervisor_leaves(const struc
>>      uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
>>      uint32_t idx  = leaf - base;
>>      unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
>> -    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
>> -                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
>>  
>>      if ( limit == 0 )
>>          /* Default number of leaves */
>> -        limit = dflt;
>> +        limit = XEN_CPUID_MAX_NUM_LEAVES;
>>      else
>>          /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
>> -        limit = min(max(limit, 2u), dflt);
>> +        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
>>  
>>      if ( idx > limit )
>>          return;
>> --- a/xen/include/public/arch-x86/cpuid.h
>> +++ b/xen/include/public/arch-x86/cpuid.h
>> @@ -113,10 +113,6 @@
>>  /* Max. address width in bits taking memory hotplug into account. */
>>  #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
>>  
>> -#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
>> -#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
>> -#define XEN_CPUID_MAX_NUM_LEAVES \
>> -    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
>> -     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
>> +#define XEN_CPUID_MAX_NUM_LEAVES 5
>>  
>>  #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
>>
> 


