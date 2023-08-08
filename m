Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85817773AFA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580055.908327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOZm-0007pO-3i; Tue, 08 Aug 2023 15:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580055.908327; Tue, 08 Aug 2023 15:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOZm-0007nG-12; Tue, 08 Aug 2023 15:24:50 +0000
Received: by outflank-mailman (input) for mailman id 580055;
 Tue, 08 Aug 2023 15:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTOZk-0007nA-MT
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:24:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b575a587-35ff-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:24:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9677.eurprd04.prod.outlook.com (2603:10a6:102:24f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:24:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 15:24:38 +0000
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
X-Inumbo-ID: b575a587-35ff-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZiIfzy1WNlAn3kC2JdN7yNJIZ2QbtdYw3IRa4k/BFJrMMzWoJGqi+/RtAp/8kiWXx4M3uUVtLAy7C+LCWfK2jsdQguR3/xl1avq70KU0QfPmLEQVd1OsxqLHPilo0uOWMcMT5uI+ESo0Zm7YJNMx1ontHi/Q7IDEK4UQA/p/4x1NfthtWm0Ncbtk/U8dRZlwmWC5pOqJwxH9DEhjR6JRJXeMvyo87Ij4G2wdTGBYZKKfmAJDNLOjok0wyDMhV8V1/INNRsh8EqY7rSgShcHEGmFJSrxEftIWKIcY6dBo+bhFcXyQfBs7HiI/4G4vG1J8/r4dIbH3NPY6Mt7DuolfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iac+cMqKUP/CLiNKEpV07tq09X8Swz8dmGF7ta92L0U=;
 b=aFqQzBHoCgmMyvV+04Ta2YOtWiLwMySaBfbcKU6iXqYrm4rFDAggn+6BOLL+k7ifyF+2slV6VxNc6Ik8lN73clToOxwsqWvf1j8mch8YVCzkizAbtYqiOM+4LqSz1ibB1N7u232ubwg3K2TA12rc5OLF8hMpH14mJMOnDboWfjiilyefxoIL8pe0NiixaVdGiPpwgI9i47m9geqVw8xDT7CUBP7GaXmeirZmZIMoGmI178TRaMerEBaGmE+nhcvTPQtYCqQ90BSkyBClSKEw8v7c3+PXL00cozhsOioGcHhmijzNklSjiKRoQssQg7l3126xfk59XFHPeK47EyyHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iac+cMqKUP/CLiNKEpV07tq09X8Swz8dmGF7ta92L0U=;
 b=ibJmsgdUUqSvATGYc1eoMEhArsqRrTmnEyJiWyN+q5Vw6sOiLz2zxmdLMiIzEPCxsQGGEt7bz/movFBL+QYnmEODqMxnfq43XGI7tu3ZZFMlEryLefiwOxP27dsDEeJMAAr6K2qbg2+CmI5AU+VGeVnQ/cr+E0p9gTCJxJBPjJ5AKkPFwO4uppJnujwtdRnvujWR+S3T7SlaZ+KPQk+7APduSnpNuHJZB1d37Pwsdr4lijgMJgt1au0KxuMO86DUXMcF55q7zVR1J6ZHLjloXXwodqHHXOMUE98Mm4JGG3n8Ml6TwPjBYaVih6zhZffX4bFmZhpAuoxNC+nBwNFJnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72f6cdbb-44a0-d821-1b7a-607e031cde99@suse.com>
Date: Tue, 8 Aug 2023 17:24:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801202006.20322-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 8698ef4b-dca1-40fe-179c-08db982394a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vg8iDqUa3s7aCqOzjxtjGMRLKk8/CfVxF/hmjS/B3QL83X/r5+ibp9shni0FSVSv5CZimVsKe32P75rxW89+Gib6df96KckGtnYtO43OJ99tzlVfrXLzXy/AJyOZAfnMjH07xGa99wtgAL2sccspnfo01d+f/BMgGn12qATGYjcSBjKiF7MeVF/0wzjhUPs4jvphLSE/Ic4ui5calkN8XmEhOR6LClTAtdahx9fxpwBbXtRhRlJGyiqyXCjBexu88TPN3+Rqpa6pO/5HayMikhymENaQesBLKSHXs+MLekKaLHtIN6JXIJo50oypihwpYAp1hf7Nf0Npfq/08gzWybU8DaLlvg519wrq8QPGLiKHOJC2pYOCsAAhvIjHlEEjec7DaABcl6TexB8EcnOUA/pLfmKAHnwrre68+nm5w1ZXhpPf5PhGbv3QamEH0SBjSgidrbk6Q+3H+c+DKJU6TXHBscI9S+3t5HaO7H3gi9T2uWbSJ1q7b8dcChJcvEy3R7IoLhwgoDs9uDfzxC4aau4oPktoxs2h1/SrgcWO3Tj+RIYwvALI9RgrcSYtVIAojWT56XX6tQBvaNWGuz2micSPogJ0ST0iNJZkSbv8NCcZyUpJPJYEl5hE6Vi18EA9+m09nbf9Ak9DdrgxbCTozg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(1800799003)(186006)(478600001)(54906003)(83380400001)(31696002)(86362001)(53546011)(26005)(2616005)(6506007)(38100700002)(6486002)(6512007)(36756003)(4326008)(6916009)(66476007)(66946007)(5660300002)(8676002)(8936002)(316002)(41300700001)(31686004)(66556008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWY1ejdnb2NDQzhlWGw5UmN0eG1telRiWnc1bzRxUWtIQ0RrbmhEMjlvdHdW?=
 =?utf-8?B?UEZJSGpLM29FU2l6OVhmc3ZOTkFYTFZ0b1htVXM5bjcrSVV0Y2k0VG9QSEJn?=
 =?utf-8?B?L2cwYytuNUhWeWdDMGVVQ0xPVEN5ZnFGM1J5QmROd0JKMzc3Rno4czU3b2Z6?=
 =?utf-8?B?dk94SG53dHhMTGNxM2xodndKci95SzlJZm52MnJCM2tqdlFNUjl2WUZXNExX?=
 =?utf-8?B?S2VLamZMdHdROFlXeitMS3EwOHhIR2FGOFdCNXZ0SmdwQXBSdTBwbHZSVWNz?=
 =?utf-8?B?NjNVb0FkYk1BbDB2MDNYc2pIVHFyVUNZNDRmQzhkbkZCYTdtUlBoK003ckVT?=
 =?utf-8?B?M3BKNTIwbzE4NkxrOE5DSlN5dCs3OTV4Q0FQVXREL240OElIQVlLOEJScWli?=
 =?utf-8?B?cXdwN0NJQlgwZ1hpVUNjOS9qUUw4MWNUVllUVXpzTm5GLzJiTUdnSUxya3h4?=
 =?utf-8?B?TFRYRmFhL1hOUk5Sb1J1OW8rbWI0bzJwQ2NHWXM4WGpYR2dYaVQrMjJKWEVl?=
 =?utf-8?B?cHlJYjV4M3pMa3R0TkN6SHBkRjgyUXdVLzZaOExoNjl3Z0tIdEx0WjhKNUFC?=
 =?utf-8?B?aDkrQ0p6d3J3VmxMTGpXa01MOGJEdVN4OW53eEJDSUFJdEtMakdxWGhSdkJ1?=
 =?utf-8?B?N3cwekV6dTZ4VkxYWUY2ZUhibkVLWlRVWTVRYzViMnBqMFJKSUNTR3dtSGEx?=
 =?utf-8?B?OE1sSUdjaDhYelFwVHZBRlNlaU1SUjV0b1p4Vjh4eDJiWlNWK09FVTZWWjQw?=
 =?utf-8?B?cjQzcVhPaGRHMW9aajhYQngwVjg3RG1OdVoxRysyc3UxK1FhYkJ2Z0RCdWpn?=
 =?utf-8?B?NW1lRTVvY0dTRTdhMlczS3ZFQnN5eVMyOStDY2ljV0x4K2o5YVJUZEZRb3dP?=
 =?utf-8?B?SjhGZHdWZHVZcDJKVmNVclFEWWN1Z0NDUDZmZTdwcWhkbi8yN0c4ZnFlOUZh?=
 =?utf-8?B?SHNGaEpFaitkVXV2ZXNVMjdURCt4MWNyY09iRCtTaWFnclgvWHVSS1hqSERs?=
 =?utf-8?B?YzY0Yk9mVlQwQmE1UzNIM3BtbmpLQ2ZlYWJpVzJoUXBXT2hxZ2poTkJkUXg3?=
 =?utf-8?B?czJCbWNlMnliQlAyRm1zSHJOeTlZeDFWU3EzKzlyQVR0dUNpL205eExtZC9P?=
 =?utf-8?B?RUNkR0xjd0loR2h3dlVTcWZFMmtLU1lpRVNzWEtZeU9xNmRGOGNkdjRzdEto?=
 =?utf-8?B?L3JETG1kZUhpREgxeTBCdTRGdGY2SmVHS21SZWozR29QNkZWVXVacTY4M3Zr?=
 =?utf-8?B?cUNQOE1EMktqMFVzVXBiVk1WTXpZaGtEZG1XN29DOVNFeEFMdWhxbmV3NDZo?=
 =?utf-8?B?Z2tBM3FaRFg3UytTaU5JN29WTlJYSTlvaXM5U1N1RC9zMFdCbmJqMTNOM3Qr?=
 =?utf-8?B?ZGN2Q2E3b0UxQk1ZR1FBWkx5ZkgrMCthUjV2QlMwR3BybndLUTd3dEN4VHp5?=
 =?utf-8?B?UldsRXMxWDdlaWpHVllJY3B0Q1JEN3NId2JNQndYT3BDSENlaGZHRWF4ZWxm?=
 =?utf-8?B?YTJySmNCOS9pbWpHWFUwRjdVSjk4SC9CRFdHOCtuZGY3Skh0SXZVbkJzUUkx?=
 =?utf-8?B?aHU3NTI4MGd4ZGUrVlNLSkdvQ1MzaXVDdnA1c0x5K0R4cm9YVDJGYlR2d0xm?=
 =?utf-8?B?L0dJKzc3Y0prQm5jU1NSUHMyZmFYbWl6WG9TMmJydUR2U0RUNXdkS1AvTm9Q?=
 =?utf-8?B?eU9yeXpxZVFrekJmMWtkNDgzZEJ0eG0zZ3pUdjZiS1EvRUFtYVhBckVSTGdI?=
 =?utf-8?B?UXc4MFNYUWFkT3gwbDAvRUw3MG9KZ2pqNmFBYW1RMS9ZSW9vUmhkWkpEVkNi?=
 =?utf-8?B?Z0srVjRCVjVwd1lkL0VrR2JoWFZLWUw4dURrdVBOR1hYRS9aZjBWeUtpNWd4?=
 =?utf-8?B?dnhHcWc1TFRhUmcyT2xQTDdIWU9KNHdkK0ExVzRsMmtIenJ3OFF2Z1BSdThh?=
 =?utf-8?B?UUNDYkx6WElUTGppOEtuNHRpazBpajhIQ3N4aDZCL29taHNKRDZkNmhMSlpT?=
 =?utf-8?B?L3FWV3RhQW4zaGw3NDlZZEdnMHN2akRXS05scDRmWUcxdlJJRDgxaWZPUW5h?=
 =?utf-8?B?R1dIRzZ0RGxETjczbkpSTGFDcEtZK1BrMjdqR2V6TjNMOWwyNCtOdGJqd2Ro?=
 =?utf-8?Q?QsmgHbapy0I6Nmcz4RJlqUO3s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8698ef4b-dca1-40fe-179c-08db982394a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:24:38.9468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJ12R0ZmOgZVboXjQMPmgxgqj7JirTa3hdthTWkNBRF+Zi7OvAcqsxHADfHDQ1ggP9QorP6mh76npD1C92Cy2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9677

On 01.08.2023 22:20, Daniel P. Smith wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -472,8 +472,8 @@ struct domain
>  #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>  #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>      uint8_t          role;
> -    /* Can this guest access the Xen console? */
> -    bool             is_console;
> +#define CAP_CONSOLE_IO  (1U<<0)
> +    uint8_t          capabilities;
>      /* Is this guest being debugged by dom0? */
>      bool             debugger_attached;
>      /*
> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>      return is_hvm_domain(v->domain);
>  }
>  
> +static always_inline bool domain_has_cap(
> +    const struct domain *d, uint8_t cap)
> +{
> +    return d->capabilities & cap;
> +}

What you implement here is effectively domain_has_any_cap(), which I
don't think is of much use. At the very least you want to assert that
cap is a power of two. But perhaps you rather want the caller to pass
in a bit number, not a mask, such that it's obvious that only one
thing can be checked at a time.

> +static always_inline bool domain_set_cap(
> +    struct domain *d, uint8_t cap)
> +{
> +    switch ( cap )
> +    {
> +    case CAP_CONSOLE_IO:
> +        d->capabilities |= cap;
> +        break;
> +    default:
> +        return false;
> +    }
> +
> +    return domain_has_cap(d, cap);
> +}

The "set" operation doesn't need to be an inline function, does it?

Jan

