Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87697653DBD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468345.727422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IBO-0001KQ-0n; Thu, 22 Dec 2022 09:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468345.727422; Thu, 22 Dec 2022 09:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IBN-0001HD-Te; Thu, 22 Dec 2022 09:48:09 +0000
Received: by outflank-mailman (input) for mailman id 468345;
 Thu, 22 Dec 2022 09:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8IBM-0001H7-Vr
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:48:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb7926de-81dd-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 10:48:05 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 09:48:04 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 09:48:04 +0000
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
X-Inumbo-ID: bb7926de-81dd-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzR6vkq/IXCtQhuFKYg4uzUyQtwyAbW3JUHFdf/BILj63sy01qePoEGsH7raNsguEt0KhOeNqtT9qxrmZr/hVlcBuAF/wOPPybgD8epXsnODzt/spyNpPsdnruGt6GU/dcAUgij21CoiHIAMS4ARRx72HBsJoB2hzaqXyWRfNh3vuqZzFVslyy2whiiuAWWJ5BTYg1215ADREzzUKLVqRNEKXdzMmBaBwgQVwZqQpeY0/9c3nK5XCk9v3eZ9p6vZbBUqb7jb1N0ECtJztdVXbym1ZRFdFJQrFOH2tHG7VYetgI4ABNrdF/enpSHCl+2Ofp+0f7AzrnnklAWMFMQuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2Dnmj2ede293bKV9+YmA9k6BsZjsAX014k6k4a6u0A=;
 b=O8GYxMBWhkZjM9EFIwAM/NIzTHUj/lGCzHemAvLIcu9qOjMn9Ur5dWRph0qmlSb36nUFzT9dWDzXUeKS1PZww0Ms0rIYy9lAZNcSLaY8hQiGRDqaN1HEG7QFpq9GnNktPn+M/ObYJKO4Vgfihd/6zsIygAuyZhOzdVmFhfYfxD9BgOHQjdo2TG3AvxirE0ylChtjeFneZo4ERBvVTwjbV28GaXfSLjofId5ma3o0KkYSTx5O1NlTvJ/XehnyjRGbcvbG8vr+fnNagXTG8sffN4+No8l9Ii5UOWVrDwvia9e7PZQxoOXlMTmLabsgUi1UHqDgHvC9w6HhGXUC8YwH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Dnmj2ede293bKV9+YmA9k6BsZjsAX014k6k4a6u0A=;
 b=OE4KITFd2T7DcdnjaWy/TViLlYN5Q8QGayJ4eON4tOobCP1C2LgT+7Y2vkDze3+P7Z6SMeZV9siK3NKYuAb2MSLeJFVFp81AFBaj7G2UOrxtMq2JsfSO9bwureRKTMIL6g5/hahH402TJXqFn7iB9nsJ0wuTPIrSApGYkwTYYQ6UH7Lwl4/c0uCXMszA7WuoShulI+iVOpau7TMFuYudiC4PrC8xH7fGFCZvOsPqqjqEXHjGryMmZ4gxW7mTCG+yXnKuj3HiLrxB6uGOsufiFYNWiRnmienheFtnqM4WBVLoe8Fk4tyAVmmir6gP8guZLpnZyoiuMYNo49PoGt++UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a73a6829-5924-a98a-704b-c0111c16a3f1@suse.com>
Date: Thu, 22 Dec 2022 10:48:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 09/10] x86/mm: Reject invalid cacheability in PV guests
 by default
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <64d81a49e5e00527ae01b707080f6f0e14ee667c.1671497984.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64d81a49e5e00527ae01b707080f6f0e14ee667c.1671497984.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: a56e8230-3ab9-4b7e-580e-08dae4019f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8+3X+x6jLRcRgdLRTrHxMvbLwzH4nXi1DvCfiHJTnpDFg2Dn0SMaPaSRkZhWggfaO01MH406FQbn9tkbZx7cxseYkYpJNj6kmToMkOjvAMlHLfOfq5oIXU2qS0ImXuYnP8yvMHd7i+6iq77PDXz9aOPWJ8/UT3DOoR69VLlCfIDEMbhCYW2G5/iMnDW8Z36zLw+LV37jfy62lDxoMYr8YbmMPqP5VzoCUZeNHHM9pqjJV6mQxaTWO6PQEnSpmZ22r2WZDwbDG3gjf3c8NB2IiZFkKTB5xEeqVasv+c5vkXQt/fDrhAUko5TUO1HgU42KLncVd956EWVRCpXbVK9+wDTI3qu/Cd+VMzvNdIDUWcSD+emjqmPhiFiEzdKOWtGSOpURQA8CJs1medFvhpeAWqdMwBvKDJf0+0dwt88o/kc74VIuUdP0910zFC2NKCwe96edkXwF5inOFCrSl2HNRmC5xQQivZjM/0I452rxGxwBlvDOztlWJTVC9/fcbBuiTc2lYckduzPU1ELWYOpV1bpdHboFEnfDfPlDY6sLq5GElIHplvChPxvVi47Cgu20RsdaCzGIproL1wyhWhJg/Y7BSUawXyrCjADmDCRL7/YVyz9tXouNA1qDsrsxhhdZaSm5Te/ZpGsIqsvyNiWMzwBechPXV+SzVw0aMk0rAwhw0SijSsBbMrenQKqWS6oe26+ukS9tJ815NUaK1SCcZVNRBwTMiq+pMv8ooM9Aetw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199015)(5660300002)(2906002)(8936002)(83380400001)(31686004)(6512007)(26005)(186003)(41300700001)(6486002)(36756003)(53546011)(6506007)(478600001)(316002)(66946007)(54906003)(8676002)(6916009)(2616005)(7416002)(4326008)(66556008)(66476007)(86362001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzBRcUo2WmhVWlNtbXZVV1FaMHROTlVWOXp1MU9DNFJQK01nOEE4N1JUNlFn?=
 =?utf-8?B?d2lFbHk5SFhkZHpOdnRxMExkU2xjZ1RFc2ZtSjBGTG40dWxIY3ZqZHhOdDNt?=
 =?utf-8?B?Vnk0OWgvaGlsTTVLdFhuNEdRaTc0MkNQY3FXbmJZbVpCbFFqTnhjdW1wdVVr?=
 =?utf-8?B?endjYzU5TjVoLzIyN3JhaXloak1BMUlJNTNDUGlZbytnNWZuNjAyUmtmVlFr?=
 =?utf-8?B?R0JGZlVsTWs1NVJtR21iWUlNOWhMT240dlc5c29jT2JMT0JURWx2RkhSNEJk?=
 =?utf-8?B?VEc4cEMwbUtjbHhhbTBiNk5WK2FVRFpJRTlGenRtMUZRalhZbHZJK05QMW84?=
 =?utf-8?B?RkNsTHhLUitrVFhrc1dpQXl3dUNSZDhveWpOb1ZacjI0eWRCaXgwMzFWcmxK?=
 =?utf-8?B?TXZPdnFrSE8xK241Z0FYSjUzZ04rVXM3Y2YreGxBZEs2dXloSzVYMkFyQmk0?=
 =?utf-8?B?U0NSREVWZ1E0WXJTTlp2cUpuRnVyaDYyb3NBUDU3bXUvRWpjNWNaUWxMcFpW?=
 =?utf-8?B?QjlaS0tVWmhvLzRFaDk5eEJCM2VhNkNvSUFRMlRpQlprUCt5V2diUExEb25p?=
 =?utf-8?B?R281NmlxWkV3UFdOeDZVZ1M2eDJEL3V4T0x6aE5mVEtQSDJBMUttQW42SnRV?=
 =?utf-8?B?ZjFGL25DSm1zSEFnMHhNT3VjTmx3eUM5YngyeTYzcndjZ0VVdEl4cTJDV0pJ?=
 =?utf-8?B?TENiZXFZR1NqUFF4d2hZVWVLeU13QzNxbnJPWDlydDJCT1Zzc1JCcUgyMy9j?=
 =?utf-8?B?VnZ3ZUxQc3VycGc2dmQ1Uzc3RzlKekcvNC9PT2doMWUwRmhvVDFxaVRZQSt5?=
 =?utf-8?B?NG1teFBQRmNHYzJJU0pwajZDS2hwZ2tBT2J0TmZoeDBBVnVYMS8vZ0M2UHh1?=
 =?utf-8?B?ZTRRT1dqMjBDbHVueUk0UnRGRmxGMzRlSzJ3WDdSRGdoWE8zSFZ0VXd1OHZG?=
 =?utf-8?B?ZnQ2WUNCRkxwMkFvUTEveDVvRXp6a0NOcW15bFduZnhEajZ1VExqWWlPSHhV?=
 =?utf-8?B?Z0dHem9CQWtCU2ZUOGhaQTFvaXdKZXZPSDZWUnVoYS9meWNJRmQ4MG4rUDhO?=
 =?utf-8?B?K0wzd28zckovS1AvS2NKOENrdXpHa2ZQS2NrNk9rbG0rQlo2aDkzUm5BSmt2?=
 =?utf-8?B?di9IK01RRWRsZmFueHExT244NFlmTEZPZFhjZTFiU2NhSFJXNlRTZ2M0OXRF?=
 =?utf-8?B?OGxSeWVnRXlXc2xUbEFEOTl5ZTJqTHhOVjFwSEhKL24xOGw0Y0Z6U3VRb3JJ?=
 =?utf-8?B?SDc1aGJIUStIYzBNTlVnUXRGdCtTaFFVWmNaUmpJdHRSSUVDUURUdjJCQ0Fh?=
 =?utf-8?B?Q3JXQTYycGtnSmh2MHZCRGV3eFN2YVBVUWZ4TXJYTFJRVTROc2pueVV4RjQ0?=
 =?utf-8?B?ZWVKVWplaWlkN3pCZU1MMVMyUFdwMmQ3eWg5QXBZcWJFNnIwSHQvUDlJdHVB?=
 =?utf-8?B?c2dHSFJuSFdzVnloSUNPeGF2aktCQWJoaURaLzZrc3Q2bTloeWU4bjYxS09U?=
 =?utf-8?B?bld6MGF4amt3akRtT3RscmdzQnNvLzRBNVZFeWxuLzBuZU9iemxNeHhFekw5?=
 =?utf-8?B?VFFuQ1hHa2MxeThGZUpIUkM4NEg5bVFnZmdCL3FKY1J3YU1YNjhFNkdpRW9x?=
 =?utf-8?B?RkxuU1pEWTlYdmwyQ0N3dTB3cWg3aW5SMXd3UnZHcXc5Z3RyeVJNd04wR0VC?=
 =?utf-8?B?S09JS0VrSzhQS3FYcWhFK0lERzIzWXBBSE5zVEZVOG4yM212WGJRQVJaRXFo?=
 =?utf-8?B?SlNNaVNUeFBwd2d0QjRWalNUNkpuQVU3L3dhSXpodVE5d09OLzhJeXBxUFk2?=
 =?utf-8?B?UDlaNW9rckpKeWE5U2VDNER3MG40cUw3NDZpZllkYzhxWlRZRnlZVjU4WnN6?=
 =?utf-8?B?R0NsWmRSZ0ttTm9Wdm5oWFpxaGFCZ0pKMlp2Smw5ek9qcG8rSzBwVno1RElm?=
 =?utf-8?B?N3grR1RVcjE3QVJkVFdvdHVmc2FiS1ZDaHVadFVudndCbkRkR1NsUXNtcWVJ?=
 =?utf-8?B?eDMrajA5VkV1bjRMU2JlWGRkMjMxRDhDM1Nra2x5RUdJbWRSVjlsQmFnZlZZ?=
 =?utf-8?B?bHNwbzVMdmV5Nm9HaUY3bk5vendWNys3TWkrTFVUemJxTVAraGlveWpSMllQ?=
 =?utf-8?Q?paTs/ERN6Nx4Q+kjXuzawIGmP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56e8230-3ab9-4b7e-580e-08dae4019f06
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 09:48:04.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MK4cccHeCJCpf6avyULyBMYiokvrFcEF1f2ypSWvJ9HHG8AWcCHS5MMmkQA4hFurG/YeMICQktj7wzPvgESqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001

On 20.12.2022 02:07, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -145,6 +145,8 @@
>  
>  #ifdef CONFIG_PV
>  #include "pv/mm.h"
> +bool allow_invalid_cacheability;

static and __ro_after_init please (the former not the least with Misra
in mind).

> +boolean_param("allow_invalid_cacheability", allow_invalid_cacheability);
>  #endif

Any new command line option will need to come with an entry in
docs/misc/xen-command-line.pandoc. Furthermore we're trying to avoid
underscores in command line option names, when dashes serve the
purpose quite fine.

Also please add a blank line at least between #include and your
addition. Personally I would find it more natural if such a single-use
control was defined next to the place it is used, i.e. 

> @@ -1343,7 +1345,33 @@ static int promote_l1_table(struct page_info *page)
>          }
>          else
>          {

... here.

> -            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
> +            l1_pgentry_t l1e = pl1e[i];
> +
> +            if ( !allow_invalid_cacheability )
> +            {
> +                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
> +                {
> +                case _PAGE_WB:
> +                case _PAGE_UC:
> +                case _PAGE_UCM:
> +                case _PAGE_WC:
> +                case _PAGE_WT:
> +                case _PAGE_WP:
> +                    break;
> +                default:

Nit (style): Blank line please between non-fall-through case blocks.

> +                    /*
> +                     * If we get here, a PV guest tried to use one of the
> +                     * reserved values in Xen's PAT.  This indicates a bug in
> +                     * the guest, so inject #GP to cause the guest to log a
> +                     * stack trace.
> +                     */

And likely make it die. Which, yes, ...

> +                    pv_inject_hw_exception(TRAP_gp_fault, 0);
> +                    ret = -EINVAL;

... also may or may not be the result of returning failure here (if the
guest "checks" for errors by using a BUG()-like construct), but that's
then more of its own fault than not coping with a non-architectural #GP.

Also wasn't there talk of having this behavior in debug hypervisors
only? Without that restriction I'm yet less happy with the change ...

Jan

