Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD25965DA12
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 17:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471322.731128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6oe-0002gp-9I; Wed, 04 Jan 2023 16:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471322.731128; Wed, 04 Jan 2023 16:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6oe-0002eO-6I; Wed, 04 Jan 2023 16:40:36 +0000
Received: by outflank-mailman (input) for mailman id 471322;
 Wed, 04 Jan 2023 16:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD6oc-0002eI-91
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 16:40:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80205dd2-8c4e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 17:40:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9276.eurprd04.prod.outlook.com (2603:10a6:10:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:40:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 16:40:25 +0000
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
X-Inumbo-ID: 80205dd2-8c4e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbS+078ChGzJD9HY8Atp8m+3h4fMzx/IBArexLeGwSiT9RKtdrhdLTsGaOkbkjwkR9Vr6CBF4uRNnLKnHYgCWfF9Tcf6eRyeKpcdg8X96yKDNA+W+pGfmceQfVpYy8jTbZLkKnGNXKS/Zn3WaUQz4Ln2t7c29totqTFlZxNn3w+wcRjGCRsjepsQbeoQ1QclaB6Eb2RnKPh8K8Hec2OXhPQrHtfoG3rJMByxNyZybG4lS42FUUiD+5ED908VZ7AbzLwi/jLRHQENWKutr4dk4c9YiYddDj3fKXZX3FYKJ6MyEgnixTOy9hVW/TKqueakIaFl13Bk9soaEe3khq0GoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tbsBPvURDFJUYLUmdtEznWOuWGi2HvZk8KWkzCBso8=;
 b=m8jhjXYThJHIWQ/6JWfhYofPvDT5sDEBbSbQvB459zjHg+W+psov+1cntd42j2Om2Z3UzUXe1Wj2SEQOwLKsNWiTK2uluTd4piz7kj+HsFz7Y5Xzrvt6bBgiYBSTSOgh85zjGnYqu4qFTIckMlEN4SBZeS+SaEfg1p/VzW/LuWZxmunM+VqFhIjih0CEiYJh69ECfRR11Ebf8K1wYvOme8L4MyrRXR7LlreNtUfE3/lTUwhweU/FzwsNG6ZxA8iGzi/h+auu5KimrCRM54WJXxZOZBeS2tYlaX6lTcXegSuZvdGka0ncIz0c+ksANKMyMD5E1bVZSjKNtLWBFdmYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tbsBPvURDFJUYLUmdtEznWOuWGi2HvZk8KWkzCBso8=;
 b=nq5bovy61x9fgha32KEREBG3yELEVDwjWbAm3/4yKDU3s/2QJAF9K3R9VWJfnUUUAjyC7HLXJ5AKNemRRcjrWhwYMWV8Yxj7hGQVgmCUbO53uBQUrYLBveoQcz84W5qjy3DmWCnsLNg1uS4iuIO/FjlMxG9bH1P7tb1XQjVk7Mxy1TujrpTfT7d2NJsxEqZJ/yd7VdJKBFOViCpCg0sHAgvjhk9UWBiI3sSx67DGJlWlGnmkK9ega7VpNcr19111KMFYWOH7iAbN3+m0t6/Vs+oedl6VGLg7Lt7xmQNgBdo9BrKcISLXXvgDwYRgn4CZetL7JGreeGM0WEQrhZCi/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
Date: Wed, 4 Jan 2023 17:40:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230103200943.5801-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: a1583721-fa72-41db-f6b3-08daee72616e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IkFOcWrpdQZ0jBKljvo8ge51neTRuvFh4rdMveWjAXaH+Nl0z7AAj9/DzZFiTtskRye3wLYTsXFDN/8eiaoOZnjKBxYeG1TYsp1vchJf1QeK6rbUt+eEKTl7+ZadvAoynsTHNzh54dv8uEKWJO8DAesvj3tdLI6WUSI836du4S5JwZHeKpo1TmuqU7OKo7BFvh5LcDFoPXQtrxa8i3T+zPRuw14ztkxy2n2JUPOH7Nogb/C/CON4A4xTwkL3K7wvbiL3QR8J0Oz8pumfrDuOjLcIcD5sT3Do5tQbIfXBOG82CrhONyWQGywhZTlQ7+6aeuldqGPLHFaBPBXGeIIwjsCj4D7L1DHNR0aR1GUwkT1BkYUOQE58sTzESZv1evw07RGTQ5aTqBlV48i3M1lerHFOlyvK9Z2ftDLNFrRM0F6aklHSa0IAuoHbgvIIlhkzPAY94eD1QaQ4OmjuAHgr1ER1A7NILEFBV1fwATAir4iS7EN/AfWBoBXndW2ptXD+qWjufTU2HW2VvKVheyI3Dd8csT9TmJzx8CdP5kOp+xKaW/cdv2/pLMM4f/lF3PBAFDMghpeLyq3Ba5sk6En6UDe6pjCJUenTSs/fJKx7rG4dFB37g2RAfPhExftDPomwqwP4eqAH2IPYiToCUSVshp+hT8KIwnH075EmTvyZ9c5a0tlM/5iTCzLF4f/p7MXGcUB6pxXxSPz3KA/gX6dmBx/Uo1HL+eXJ2qqjvoLPI8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199015)(31686004)(36756003)(4326008)(8676002)(66556008)(66946007)(66476007)(8936002)(5660300002)(2906002)(38100700002)(86362001)(31696002)(478600001)(316002)(54906003)(6916009)(6486002)(2616005)(41300700001)(53546011)(6512007)(26005)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0t2ak9TR2ZpU25ybWNVRmIrVDAxeVA1cHU3SHFPdmttZUx1N1hVdCt3cCtj?=
 =?utf-8?B?T1hQa2JSZHRhdzhhdGxoZVFoTlhaelVpWlhCUHllWUc5QUdPK1hvc3VvYWw4?=
 =?utf-8?B?OXlIdHNORXdPOGRnamNHek9YbW4wWGhiUXE1bEc5NWJPaGRQblhVT1JFYWZK?=
 =?utf-8?B?SnFRZ0o3cm5tN3JDMDdRTnBZSDlTMVVHTmJvT2Q0c25XY2szd2tvWS83a3FF?=
 =?utf-8?B?RDRsYmdsbFVPVTNuTGpFMC9SSWtDSXVtYWhPNXBmSnlBR1JmdkNRUmplMnJy?=
 =?utf-8?B?ZmJCNHlmbmhzRmxsTXpKWmpnSGRNU1o2VERYd2JtdzNIUW9xcVNpVVlWVnRK?=
 =?utf-8?B?VThOWDZPckJYc3dWMkdDZW9kdkxZV095NUJ0NmtxYnRGRy9KaFUzQXMrT0kv?=
 =?utf-8?B?NUt1bFUwem1ZT1hRQi9XcVArdUVqZDV2VFQzc2NTUittbWxaREZmSVErZDFW?=
 =?utf-8?B?cmRWd1pZK0JQdG1SQ0RzU2dUUW40VGJ0OGVNV1FhWGpobTc1MWkyQlBuQXpl?=
 =?utf-8?B?bXp5Vlo5SEN1b0tiUTRGVGE2Q25pVUNuaG9VUk5RcUhFd1l4MlNIazlXSlRT?=
 =?utf-8?B?Q3lJV2Q2ajI2bklkZWFMcDViaGFOMzIzVk50dGJlaFdsMWhWOTNqL3RCWGtn?=
 =?utf-8?B?Tys0Ymh4a0dsVy8zWlZibjJIc1dSUW1uYXZsNlVnSjNZRGIxai9FSXJJRjJF?=
 =?utf-8?B?aEZiQk80akFuQ0pIc1ZiM0lQazJVdTNOVmlpZko4TFlxdUUyZkxTNTZvQlR1?=
 =?utf-8?B?R2wyeTNpRFQ2K1VhOU5FTk9nSU9mYXlUZUNVR3UvdDM3RFdOU09zcG0yakg3?=
 =?utf-8?B?ZGUyN3RvVFVzV05GMTJNdmtVRnpQWHJnb01WSkFuRWhwUVA4bmRmbS9ReDBH?=
 =?utf-8?B?c0p3VHpVNHVlT3hBaEI5ZVdScG1UbkcrTHBQTXNLSExXd2Y0SWtndEx6M0d2?=
 =?utf-8?B?QUxjNWFFVzFwMlVGTmhlVEpnUnNMenRvSXhNRVY1QXJxNjRJRDNHRm1IZkhn?=
 =?utf-8?B?Y1VrWlQySjg1MDZJNlNldm80V2NFYUpiVGtEOHpsQlFjVHdjWjZHc05YdFlt?=
 =?utf-8?B?bVQvZ3p2SGZCbStFWDZBL3AzZk9CVzhBajNQbFRWeEF3MFdzdmVDZUZvY21h?=
 =?utf-8?B?WW9IOTFwbU5wSENLWnBnTU5LTzRGNkFsQk03RGF6eXUrNmZ3RDF3bmFLdHFO?=
 =?utf-8?B?SVZZa2pBOStIek8vdlpGNWJlaWFJQlgvaXIxS1djaGZCaVR6Lyt3RlF6Y1hZ?=
 =?utf-8?B?c0JlVkJ1N2xkZzF4UlFXaFBtaTNGeDdOR0VRSVFnYi9RRm1qSUNYTitudEpZ?=
 =?utf-8?B?Z2dZRGdWSTk3L25UQ2N5Q1FPMTdnQlp2RGFObzhkclRFaDJDOVBPSFlEK3pm?=
 =?utf-8?B?SGFaNDhiKzVQMW53WGM0RlpDOEZZT08vWWw3SlZyS3ZwM2RuTnFNSUIwNXJ6?=
 =?utf-8?B?c2FicE1aQ3Myekl0d1MwQStlQWhNWVc5L0x5dWp3Rk5zRXRkZXlEQ1QwMmdw?=
 =?utf-8?B?bW5BbzlCVTNJVnhjU081TEpFUTgzYWFmWUV0RWdsOHFZNFp5TXUxZDdaQjVs?=
 =?utf-8?B?VXlkdXN2SUtKRUxjNWk0aTUvdU0reXNVMHZlVkRtbTFONEZUeWY5U3pzRVVl?=
 =?utf-8?B?a3NYSitPYXBEa0luTUM5dnhwaThrRHo3SnZ2VXh3UTN2ZzZoNWRwQUVwSDQw?=
 =?utf-8?B?OUloQTdVbERVQ1hxemdBMTZYMGNqLzhGY3Z4ZFk0K25oK0gzaEZ0V1Z1RnZE?=
 =?utf-8?B?dWswTHhDODYwSWZGNjVWcEJKczdDREE1NE94ZWlEZVZMNGloZTk0b0wxTFRX?=
 =?utf-8?B?YjkvZElLVExCQk02SjQ3WXFIbzg1aVoyTVByZWVoT2xCbmM4bG15aE9qeWxB?=
 =?utf-8?B?UGdYYTBEOVZSTVFSNytFd09WTmZCTjQ0Y3lhWmdDbHVndDdZZy93b1EwSTdR?=
 =?utf-8?B?cGoyM0lZQmFuNlBvMUhTRytjOEtMcUZlNXFGTkRzbEszK3pmNVo1TTZzeElI?=
 =?utf-8?B?UWRqTW1jb2hCalBnN2RUbENsaHlPd1duVFpvam9tWkZyc2QyTlY0VHk1NUtx?=
 =?utf-8?B?SlZBRlFLbVJOQ2dCMFR5SWxuelNiSkVOdVpmcjNMQXdZek9jdHNWRU5NWmFa?=
 =?utf-8?Q?3g6emGOQvN+76XKEWyK5nUOty?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1583721-fa72-41db-f6b3-08daee72616e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:40:25.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVJ1jqjeYhj2j+7eV+yygH6TWdEzF3LMr8stwGj7e6AFfVE0Zj/M3DqDcSvPuxjhd1vwX9LJ6z7UcH94Yf18sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9276

On 03.01.2023 21:09, Andrew Cooper wrote:
> A split in virtual address space is only applicable for x86 PV guests.
> Furthermore, the information returned for x86 64bit PV guests is wrong.
> 
> Explain the problem in version.h, stating the other information that PV guests
> need to know.
> 
> For 64bit PV guests, and all non-x86-PV guests, return 0, which is strictly
> less wrong than the values currently returned.

I disagree for the 64-bit part of this. Seeing Linux'es exposure of the
value in sysfs I even wonder whether we can change this like you do for
HVM. Who knows what is being inferred from the value, and by whom.

> --- a/xen/include/public/version.h
> +++ b/xen/include/public/version.h
> @@ -42,6 +42,26 @@ typedef char xen_capabilities_info_t[1024];
>  typedef char xen_changeset_info_t[64];
>  #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
>  
> +/*
> + * This API is problematic.
> + *
> + * It is only applicable to guests which share pagetables with Xen (x86 PV
> + * guests), and is supposed to identify the virtual address split between
> + * guest kernel and Xen.
> + *
> + * For 32bit PV guests, it mostly does this, but the caller needs to know that
> + * Xen lives between the split and 4G.
> + *
> + * For 64bit PV guests, Xen lives at the bottom of the upper canonical range.
> + * This previously returned the start of the upper canonical range (which is
> + * the userspace/Xen split), not the Xen/kernel split (which is 8TB further
> + * on).  This now returns 0 because the old number wasn't correct, and
> + * changing it to anything else would be even worse.

Whether the guest runs user mode code in the low or high half (or in yet
another way of splitting) isn't really dictated by the PV ABI, is it? So
whether the value is "wrong" is entirely unclear. Instead ...

> + * For all guest types using hardware virt extentions, Xen is not mapped into
> + * the guest kernel virtual address space.  This now return 0, where it
> + * previously returned unrelated data.
> + */
>  #define XENVER_platform_parameters 5
>  struct xen_platform_parameters {
>      xen_ulong_t virt_start;

... the field name tells me that all that is being conveyed is the virtual
address of where the hypervisor area starts.

Jan

