Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BB305767
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75897.136828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hVU-000094-Ic; Wed, 27 Jan 2021 09:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75897.136828; Wed, 27 Jan 2021 09:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hVU-00008f-F6; Wed, 27 Jan 2021 09:53:00 +0000
Received: by outflank-mailman (input) for mailman id 75897;
 Wed, 27 Jan 2021 09:52:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4hVT-00008Z-1B
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:52:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 036521c8-8bc3-4b3e-a626-f5f2a57555b3;
 Wed, 27 Jan 2021 09:52:57 +0000 (UTC)
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
X-Inumbo-ID: 036521c8-8bc3-4b3e-a626-f5f2a57555b3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611741177;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UUOO7r4KSw1dHBai0CTbhk+J3ApP8OTY7x00BwsZKc0=;
  b=ITcIpxCSjSQ44riuXpFnqKyvk9vTv6m3Dq+xq3Fvfw6qBhfPGE34Spvg
   78+w3SP7H96k0z0shf7PnyiZyFDvfv6+4fxmQ4ouCJE46Iw2uAmxru9N4
   tfHjTOmaptNUQJC/YNfonhCIfVgIpGd+CuRmi/0/fcnbgdRMN3MnopA2b
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WNnyHO0GA4mqs1fHgYqmkrx0uxKq38XQlLOe3Bv3HTujlCYbuEk3DbwPhY+KGXkMnYldF0F7Uj
 vhB5CtW5mITfnf5L7xUsYm6TmwOXpMRlLoposO7Oj7vWNASP44EaDEW5Ftz0fi4v4yvBYqnrKr
 sG830eaRccL20hxv0bZq4ozUw+mudJs7PPStroSTXPkowUlkFTZ9iA5N9txSfbeYTRl09s8voH
 FC/qf5Mmg7XuzYjTxu4/xaMHhfTHGDboWP9h5+wUHUojiZqsSNAvOBFQdCq1b6pbKapWpYLWjq
 06A=
X-SBRS: 5.2
X-MesageID: 35991041
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="35991041"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX8WIucfafdNagfXznqX8XTsGkaRRmbpQKFLgEOhvi6DPUbVC/YExHUKAaN0dJWZtStsehJ6ykDSP8JdHzKZ27fbg88WOxqurbZBNu9jQt/EfdPIo3NXozvW1tdafzujRsjxfokKsT5clPmjkDuKbdny/qP71NbID348+m6z3T7TjPgaf3gpvVAqEICbr3GHgtK0CDMK8xYjTpA0r3eVTrePoikJUcLxjgoxzFIiSdhZM0tzM52JeWIepxSZt9uMulst6y4zErGoIg/+OazaF3wm6KBOcqtYd3llZTEZCRKgdwNDkOautni7Rvo2hNBl3Y2/Y3zGlNDCexpA72yvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQCeBU9boMi4jqUhbe+m+AZns815cl+uib/M+8ATwzI=;
 b=RAP/h8VazBOCIPB6cPRMsNAkOPfo7jpe8k3MWgHYgGUV8DkyiU55X0DIYfwbZBMjMy5+9SG140YLl2wB0NaZoXlbjPka3l83Q1OT+yH69Ozt009wd4xJ5JujwyUehvMAPrxSgcB3snhB8dgdwXjKjcFGfjGzPeyn53FV1sHwyeNgv8QJHmS2I9BEbNxMlOrPKhBuntTfibpHDE/pz46dNev1fRi2p2SU3sRlY7FC33Dm4WTStyiaVJo6p0TqYjqofty9U2O50sMElKxs5JlGrabWj2/Nnc9MyXRD14oJ8nl/edKO74Ix64G+rWtYjpjmJkB4/stxhkZMlw2lUB/uWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQCeBU9boMi4jqUhbe+m+AZns815cl+uib/M+8ATwzI=;
 b=rj9a7/Nn9Ev0aHGldRky9cbT/vBd5PxOiYRCtvS7F42dJ4oimptvE+IgGrMOaNdzMAJ4Yo9jfj4EfsfMVJXGdWv+EQ4ORG9/SvvXm+CkrLpRF04CTkBK06pEmmfo8C/urU49pB2N8AMUDgFLkNS1sbkTC86rL3oKInl/H0erQCk=
Subject: Re: [PATCH v3] x86/intel: insert Ice Lake-X (server) and Ice Lake-D
 model numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>
References: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2da9c816-fbca-d486-b602-a31e6bb97e38@citrix.com>
Date: Wed, 27 Jan 2021 09:52:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0407.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::35) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df56340e-1aee-4680-bcfd-08d8c2a948a1
X-MS-TrafficTypeDiagnostic: BYAPR03MB4342:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4342511841CE11C78D6937F6BABB9@BYAPR03MB4342.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ghxoDZX3dJCuHqrJRykyhyppFLrgRolV18ABeqXDMURDb6ffKZMadZoonNepcLb2jdru6K2w5ua1+owhQRURGfjVcFl9Xms1v8zfaP/ye13y7msikGeK34bbx97NY56b1oBr5rF1vxRTnvRPoRCJ6uZG7VoGtWUUK6Af30zXByhzgKrMXwd0fK6SqJeoqYRNDmNxCSO+E04UObBZWyKacA2HM4X9+pN1eEL4jCsuvuWoo2+lTAtYuwxUPLopuOxd8aKPRYfkPq9pryD0uo9vEyxckkVc0nnAy2pYiAU/79MXN4pR5Tl5t0reQFppleG5cQriItEU3iuNSYxsgjStfJIXMuNwooSTDNHTH6SHCwMjiL7FmicYql2F+uQt6VxxG9s5JX2Ro+aB3a+do/PQBCswoXyGXMTVJyZ4iV9/DyZhAwaelHQAo0KVWOA12Pk1OUARew0Av0qhOTgdCrrsCs9NPY8hBEJtWF/aNCfRno=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(4326008)(31696002)(2906002)(6666004)(83380400001)(31686004)(316002)(956004)(86362001)(2616005)(5660300002)(16576012)(8936002)(26005)(53546011)(478600001)(6486002)(66946007)(66476007)(36756003)(66556008)(16526019)(8676002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2ZWaWR5SG9UKzNuTnA2TXEyYmlCTlFPT25PMGZGZEk5MDB3QVpwRE94YW5N?=
 =?utf-8?B?UHl6T3ptWGRCaTlpRFp0dzUzNnJiRlN6SkUxb0JOa1lmRGNwU3BwUmJuN2NM?=
 =?utf-8?B?RkZ2bmlzT0NMOHM4K2EzZUxlRnBsUTIvUkVzanRGUzlGd2l4RG1FdkZOd2lO?=
 =?utf-8?B?MWQ3cXVyWkhvUmFYQVRLMXArQTZHbHdyTS9keGlscm9RN0FTMFlJZW8wbm5G?=
 =?utf-8?B?MEdjOThYKzhGUmZ4RU9EeWVVeDVsby9zN3p1WFQvcWo5amQwdWo1Y1E4eXdV?=
 =?utf-8?B?cDNSZ0l0QlFnVEpEVGVqVG9MRjdjQTBDK1I1L09Db09yQlRmK0pXVVFJZ0h4?=
 =?utf-8?B?blNQNEdzZkVNUEhGdU1RcVNOdVVzeUs5UHkzVGdzYU9SSTd3V2J2MWVKRzMx?=
 =?utf-8?B?dUdubFNxZnRVZzV3MkNFdkNqNkpINTN6N3A5eWtMaUFEaGxyQnR6TTNFZmQx?=
 =?utf-8?B?TFpNNlI5dFp1SkdIcWR6cERtMW9qNG5xMmdmbkhiVERYUkVTYTA3blc5YkhH?=
 =?utf-8?B?V1RuSjVJMVBlN01NanRwelVLSk1sSjl0Ungzc291RENiVnQ1WFpJem5VZkEx?=
 =?utf-8?B?WmRoUWRlSVh2OTQ5ajkrdTZCSGNQSjNxdUV2Tm1BNmxEemxzUjA0ZVorWlBI?=
 =?utf-8?B?Sk5BVDFCVnJhUzZqQklRU1hYb2VMNjczVkJtSDA0eVUvNW1QVlNrSkRpRWI5?=
 =?utf-8?B?aXhkajQyS2p6blhzcE1XSU92d291U2xNS3Y2RGNxOFc5WHdrZW5PcEMxcmlH?=
 =?utf-8?B?OUVpbmhHUzlBUWg0WHhxckhRRXdGSzFqVjAzMDd0bnBybUwySnJLRUxIMGR6?=
 =?utf-8?B?WFZydTEvLzR6alk4bEtiMTM1VjE1ZDRCMUJ2Rjl0OGVzTmg0aDZnUFYrQmp0?=
 =?utf-8?B?VEgxZm1YcmIyOGthTSsxbElrbkFJaUZTSG5jRjZhaFptVFpIZWVvelJ3czF5?=
 =?utf-8?B?YjN2YjlML2t2cjlBcFJMV0dlSU5mZmVVcEg2R2xqSHBLQldsR0YwczVHTStz?=
 =?utf-8?B?MGZ3TVA4QmVwTUtHSjFoRDJ0Y21TVU9hanVpY25iYnFoM3JwN2RUWmFlQjYv?=
 =?utf-8?B?bTVKN09NcXhVT0ZUUHRHdE5NaDlkcmxzNE13KzNoMjYvSTZ6S29DcEl1Z3pL?=
 =?utf-8?B?ZDJINmswSHQ0eVZJME9JdStSRzVkdm9qRER0Z2x4YXVNUEk5TnVYUk1vcVFC?=
 =?utf-8?B?R0VVN0owajBtcVZFbmd3U29UZUtHdnQzRENsaDZYK3dvbUJ0ZHZyaHp0WjhT?=
 =?utf-8?B?cm11dkFseExrRW9Sa3gxd0ZmTk92SzR4OXlMNVRFb2xNaGRVNWJXM25xcVV0?=
 =?utf-8?B?Umx4WmxtNVVESUUrTVBIM3ZmeUE4by8zaU9DRHZ6ZXNNcThMVGlDelNaMmhW?=
 =?utf-8?B?MHNiT3ZsZ05XTzJwVXVwMjhvemJjY1ZPT3pDVklQaFJyTUxrS3Bsbk4yZDBs?=
 =?utf-8?Q?9Op6ygRO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df56340e-1aee-4680-bcfd-08d8c2a948a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:52:39.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBMiwYXMwLt78PULGA1nSlbejIjJq8Z3Udao26nJN8/JvfYvEAJSYuwgFafGAEAknI+xAg92wMFKsDXDRHJB9sKlTqskwhw/AMnt5TYw92I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4342
X-OriginatorOrg: citrix.com

On 23/12/2020 20:32, Igor Druzhinin wrote:
> LBR, C-state MSRs should correspond to Ice Lake desktop according to
> External Design Specification vol.2 for both models.
>
> Ice Lake-X is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
> (confirmed on Whitley SDP) which means the erratum is fixed in hardware for
> that model and therefore it shouldn't be present in has_if_pschange_mc list.
> Provisionally assume the same to be the case for Ice Lake-D.
>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> Changes in v3:
> - Add Ice Lake-D model numbers
> - Drop has_if_pschange_mc hunk following Tiger Lake related discussion -
>   IF_PSCHANGE_MC_NO is confimed to be exposed on Whitley SDP
>
> ---
>  xen/arch/x86/acpi/cpu_idle.c | 2 ++
>  xen/arch/x86/hvm/vmx/vmx.c   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index c092086..d788c8b 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -181,6 +181,8 @@ static void do_get_hw_residencies(void *arg)
>      case 0x55:
>      case 0x5E:
>      /* Ice Lake */
> +    case 0x6A:
> +    case 0x6C:
>      case 0x7D:
>      case 0x7E:
>      /* Tiger Lake */

So I think these changes are correct.  TGL definitely has deeper
core/package states than this interface enumerates, but I can't locate
extra MSRs.

> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 2d4475e..bff5979 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2775,7 +2775,7 @@ static const struct lbr_info *last_branch_msr_get(void)
>          /* Goldmont Plus */
>          case 0x7a:
>          /* Ice Lake */
> -        case 0x7d: case 0x7e:
> +        case 0x6a: case 0x6c: case 0x7d: case 0x7e:

IceLake Server has what appear to be new aspects to LBR.  I can't find
LAST_INT_INFO (0x1e0) existing in any previous generation.

However, my investigation also found LBR_SELECT which has been around
since Nehalem, which we don't handle, and Linux *does* use.

This logic is in a terrible state.  It's no surprise it is always the
first thing to break in the field.

~Andrew

