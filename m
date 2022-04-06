Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506DD4F618E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299922.511264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6am-0004ps-Bo; Wed, 06 Apr 2022 14:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299922.511264; Wed, 06 Apr 2022 14:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6am-0004nQ-8q; Wed, 06 Apr 2022 14:25:04 +0000
Received: by outflank-mailman (input) for mailman id 299922;
 Wed, 06 Apr 2022 14:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc6al-0004nI-5S
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:25:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 587bd082-b5b5-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 16:25:02 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-D0x56RsFPK6kM6PU8f7h9w-1; Wed, 06 Apr 2022 16:24:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3823.eurprd04.prod.outlook.com (2603:10a6:803:19::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 14:24:54 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:24:54 +0000
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
X-Inumbo-ID: 587bd082-b5b5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649255101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQMGbuSph1mdv2l3vc6SQzTY0C5EJ114cvI25l2Z4uc=;
	b=gjOQkTQNSem5o7NmFz+/jk8E/aJ1uUO45clCkYI06Y8GV8fQDIW4c3xup+NRGLCfuobX6L
	DoK5XW0/MqH8FRtmLTgBpQyIONL7gdi2GtUsaN67pmf2ReINP7ZiVp256AYA+sgh2M9cYX
	BgWilxjr4BU/dEpvn13dKtF2YxNxbMc=
X-MC-Unique: D0x56RsFPK6kM6PU8f7h9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtQm/pg967C2++0701emy3QnC6nkbTAyqCv/oMNBo+no3tq8Wqwaom4OkFofu3bqm4Q3eVelZlR4yynNw6dDK24AZtb+yHgKqaXBRKQSEd6EUelsswqhb42k/M7TO/B3FZGD361CavqMH+Sc+Mpqs8A5fSaBUmjFj0aauAlAsVO9tldZzrP2Cy5XGN39HWHfyrndXult8PNFZTBSZ5kDFMU5aTCiwDuZWS7kaiBTQ5za+VSHeK+hfRQZL02HsejzCgKI51SJvSPDREXQYCCRTSk/e06AOIK7GMoXFxxHI3njAhY9Y/LSeU9O0UNw94lPGHit1jjqnEkHckCcONORPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQMGbuSph1mdv2l3vc6SQzTY0C5EJ114cvI25l2Z4uc=;
 b=P5S2Sz6HauJBS2urG2VEk5PoeO9WH5qmolAWTx0HkY+QI24KsNeSTPyfWMAmyZRLairCiXeaSKC9ICqzBaRYY+4BkyhrmlLrUMJy7wl7fcsckb4YYndoVd8IzlcdyNqHOhzDZvXn+v/0KtWdK/ggJILREhmhL3SM25nblQDeUsGC4LkcIOGEtgyXlUbQ9TECcoF7quhe+KB5lezDEAtrRPYAUSV9BkWx/majSmgrJW7k5+bGlGQWSkZEQG6UZgjvKqnGQAG/7BMo9e8PdMtAty27Q2yUqMcG38hD74LGftL0444okzicCe63xAtJsFnJ1TFjRWuSkaUXbhwLcxsvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b3c9ec9-48f3-4900-fb98-c09efdc67c40@suse.com>
Date: Wed, 6 Apr 2022 16:24:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
In-Reply-To: <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f5b415b-670f-4120-f1ef-08da17d937fb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3823:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3823C0B7C8ABECE2071F1202B3E79@VI1PR0402MB3823.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NYbjqaGrveqCKoBiEFaemnTqA3YUdevIPBDf0GrpwZAGV2t5szqiCHhv66AGqEifBFcNgHbWb+ezCmsrsSn0N/tKQA1D7/shVDUUPFBojOZ5zyCfEv6CZkPcmawon3sIoBGCf7jzesdGg/IByaek8bO+eZhA53gm891Gm38Ccbz93+S5HCCJyzSY6/CGtyw8hJMrjGLOAAzT91wzSd1+K8GQT53c2CyObguGBgdJah7hvBKVrtdWolbWPEcE2lfR7aE3NrGeVp0OrB/27OIpEZIw60MmtBQXYs2QA2pv9FJmz8A/TD/OtxGY9GW2T+yEq2+cwbues9W+qWDUr3GHD70VXvxAElGNMAG4JykvaAxve7G65BQhT2ts3BbTR1gIvDG4BpfFXl7cZCjjb1o76XglZX5Z6TzsmS7zclyifIPlmCNQRschEavideb3v2DfH+rM2dB1EYJDpvvB0U38rJWfRd3a/T8sHW/sU4HBbOXxxtArlwxqCJEQ/Klc2c2+pmoIq30QbhLdXpVVegws0ZeSv3Fs4zCEo1ecCsnPccIQH7sUgofGQT1iASJwGOkkjyN9oUpvziEu3U2l4j1ZYlFQwytu/oXV0497vLIokVs4H7x2EEWwvTBl5ihyf5WvSzxrmwAJ0KhJltUR8KM6iL3SkgejShZ74pBniN1rZVfZBtPnVLPgYmgqBpmZ6sNDdWgoe52VH4r03FTPYTFb8FNooeYo2UrdgL8y+/4zqUf0vqFmyl2sZVWaQtRbplcDw8MobsTD7jNA5JpG9L34iv31L8sh2gkXlGjqEiVBnj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(4326008)(66946007)(66556008)(8676002)(66476007)(316002)(31686004)(31696002)(54906003)(110136005)(36756003)(86362001)(38100700002)(2616005)(26005)(186003)(6512007)(508600001)(6506007)(53546011)(8936002)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnR1L05TNHpyVmNZazRlTEJwTDd4QlJKMnBqVEJHT0tZT0MrMk40bkg3cGtK?=
 =?utf-8?B?dmFlKzFSMGFHQ0JjdmxBKzljSXJBN2pTZHVIQnM2VG5URXhEeVlnVnB1M1lP?=
 =?utf-8?B?akJuc3NyZGRZc3h4MnR6V0djN2d3Z2o3Uk5TUmFsbDFUcjRsN1BGNmZrZ2RW?=
 =?utf-8?B?M0d2Uk52ZFhJZ3pLdERFdGM0VEpvT1BIV3BvUWVuMEhZb25GbUdEenZjN3Rm?=
 =?utf-8?B?dVdRZEpQSzVlSUV2alBsMU4xVDFUbEpadDZYODkraS9Sd216Lzcwb3FKMnBK?=
 =?utf-8?B?Uk1UaktjeWhDdUdMM0lRYytyd2IwNG9iU0ZXdHFVVVZjaDd4ekdzL3ZiQjRs?=
 =?utf-8?B?TDFOOS9yYjE0S0xlL0pyc1l5Q3hhT2xoWjBRLy8yVllGZGVtODZYVWdkQmlI?=
 =?utf-8?B?d2dEaXBTTnNXaFpubjFpZzc1UXB1QWZldXNKMGJVM3BTVTNqZk16VFpKK2Jt?=
 =?utf-8?B?U0Y2UXBRWFNGL3J2RGxwNm5ZVllKWjFGc2FuMk9iOXIraEFoTnAzV1QrTG1t?=
 =?utf-8?B?TnR3Sjk4R2hmcW9UTmRvNlQ4cTF5cVNrcmo0SGpadnJna2JORmRqTXNnTmNw?=
 =?utf-8?B?WVNWSVEzdU1zZGpiaDIvSmhwQjFjQzNlcDJUN051ZGc3UnNUTDNNVjhMNXdV?=
 =?utf-8?B?RUdVUlRkeFNSMktseDBLS2w3M2h1Mnh4M3V6NGw4NENQek9TUFpJQWJEb2xC?=
 =?utf-8?B?WXc5MnRqMEtGR29EWkMyL1NXZmEvS3FQNGdZTkFYa1F5cjhmVUZUZ2R6Yloy?=
 =?utf-8?B?S0VMSWZSMVlwOEhFUWpoaCsrVithZjFlTHFvWUN0OHRCUmQyM1RBQkZta2VC?=
 =?utf-8?B?QWRVVnRnaDJxQWo0Z3lnMDNvZG84ekd6Y1BoeGEyUHR1aElLZXZtMEF4Uytr?=
 =?utf-8?B?WlJWTWQ2OHZQK3UvcEZjaGxYSVFpUFNqcEJqSG1sdHpIQzRaUC9iVCtqT0pL?=
 =?utf-8?B?RzBkb2ZpNG1UeGEyV1RCN3Y3QUJGUy9kYjF4d3hvT2hHQXVOWjFzOVhid3hq?=
 =?utf-8?B?cndrdUgybWF2eDQ5ZVBadXVoR0NjMHRUcFlhV1dEdlpnTmd4V2xZa0dURG9s?=
 =?utf-8?B?aytBekxFNERtLzYxUjJWZjFJSW5BMjgwRGx2cHQ2Rnk4emhmWHh3YmxqVWgw?=
 =?utf-8?B?MkFLZUkya2t6aXRhQXlLQnMzbEk4V2N6S1NhRTFzZWpjcktTbWRHb2ZoWDIw?=
 =?utf-8?B?RzZscFVrZ2R3ZlNlTXZQVkNiUy81cDF3Z3NUUE5Ob1g3cUNodTdoQVhuL3p6?=
 =?utf-8?B?T3Y0ZWVPU2I2RFRjNHZnT2VFWW0rcFpkd2FVc3F3cWE0WkpOVEZrcWZwVU5l?=
 =?utf-8?B?eGFNeERaZjJseit0N1FhaHg3UkhMeVhPTWFIajlyZGlFYnkxbEc5UUJFSjcx?=
 =?utf-8?B?cTJ2VmYzOHVNaDAwVHdEQzhDSHBaQzdjaWNPaUwvQ293N3A3MGprYnZrYlA0?=
 =?utf-8?B?MVVnY0djQkxNWHFaZHRwWnlsdm96Q2EwWXN0L1hIZzVQMnlPQzBTSE95YWc3?=
 =?utf-8?B?L2dFTTJ3L1BRQnU2a1o5Z29VVHZqOFlhYTZGaU1qTkVPK0szK25Gb1NJc3FT?=
 =?utf-8?B?Ly9IaTlONitGSFNpWVFrSC9CMnFJK1hsUzNHZzhaNnpwRytOejdlS0owcGVs?=
 =?utf-8?B?WUlCWEVFaUJkb2dQMnljZWd6TmdqbjhYZjAvTTVnRFhmcXdmWTVEZFoyZ3RN?=
 =?utf-8?B?ejJkbWRhS1pvdmNObU9TYkl3YlQ5YUNoYW1UeVJZRkRnTlUyVFhIZVdrNk1S?=
 =?utf-8?B?dElJMDhYcFZSYXdjWFVHVW9MUVBONE9tVVJzdVRSdGE3bFVMWjNZVjZwR3p6?=
 =?utf-8?B?d3dFbVBRMmE5R1A2MFRWQXU3WjhoclhBTHJSY1BKSytDNk8wN2RXR3RTeVRN?=
 =?utf-8?B?MEsrYUV4WlFvOFAxckozTEMzNVFmTnM5aHBIbWxNdTFMNGJJQlA4YXFrWnNM?=
 =?utf-8?B?S1JwRGV1UjZVYmR3UnI3TFVqaCtOTlVwbTRqajVqM0xDQWNobTdGZ0djTisv?=
 =?utf-8?B?dG8zR1lEU01oOHNMb05iQ1FTU1RRZlE3L0VXaEdsMlRKeks1SkU0N1Jsamo2?=
 =?utf-8?B?RUtJZW1YNnBsM1g0Skc4cmdhMFZBaC9hQUtlR3J1bVdReXJPbTJuR0pVT2dM?=
 =?utf-8?B?MFRNL0tQVklYeU8wOEVMTzVtbGpNSFMyNEgxSWMzd2hsS09oU09kUHh2QjZo?=
 =?utf-8?B?cmhOY05nYmlyMlIrWE9lSHpnMVh0QnpuT0JkMlU1eElqTzh0U1dxcVJRTHpx?=
 =?utf-8?B?dytidmsycFI0UVI4V2cxcE9ZTUNSanZxSUZUbEplWDFRdnVBTjgzQ21uZ01a?=
 =?utf-8?B?TlYxSExDM0pPZ25IUHdHb1hPQThWNFA4aHM0ZjBGa0t0aFhBb2xWQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5b415b-670f-4120-f1ef-08da17d937fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:24:54.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsv9dxtgcJVoX37hvrVrnrYeQDgNmkihqss+en4f7Aj0NKkaO6fUmCrQuoj3DFroeyMYDn6PjVOTNxLkaljH0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3823

On 31.03.2022 11:45, Jan Beulich wrote:
> When booting directly from EFI, obtaining this information from EFI is
> the only possible way. And even when booting with a boot loader
> interposed, it's more clean not to use legacy BIOS calls for this
> purpose. (The downside being that there are no "capabilities" that we
> can retrieve the EFI way.)
> 
> To achieve this we need to propagate the handle used to obtain the
> EFI_GRAPHICS_OUTPUT_PROTOCOL instance for further obtaining an
> EFI_EDID_*_PROTOCOL instance, which has been part of the spec since 2.5.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Setting boot_edid_caps to zero isn't desirable, but arbitrarily setting
> one or both of the two low bits also doesn't seem appropriate.
> 
> GrUB also checks an "agp-internal-edid" variable. As I haven't been able
> to find any related documentation, and as GrUB being happy about the
> variable being any size (rather than at least / precisely 128 bytes),
> I didn't follow that route.
> ---
> v3: Re-base.
> v2: New.
> 
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -464,6 +464,10 @@ static void __init efi_arch_edd(void)
>  {
>  }
>  
> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
> +{
> +}
> +
>  static void __init efi_arch_memory_setup(void)
>  {
>  }

May I ask for an Arm side ack here, please?

Thanks, Jan


