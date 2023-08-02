Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F260476C776
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574768.900354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6eA-0002in-BT; Wed, 02 Aug 2023 07:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574768.900354; Wed, 02 Aug 2023 07:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6eA-0002g2-8b; Wed, 02 Aug 2023 07:51:54 +0000
Received: by outflank-mailman (input) for mailman id 574768;
 Wed, 02 Aug 2023 07:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR6e8-0002fw-MY
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:51:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7032f187-3109-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 09:51:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB10029.eurprd04.prod.outlook.com (2603:10a6:102:380::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:51:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:51:48 +0000
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
X-Inumbo-ID: 7032f187-3109-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3+wVmf6SfmAmmR3fI0jrPiCZbuj0jdtvIkTNMMDjm8mUE52/8wQIeJhTk5bLuqXa1SSEkStE7K7mo+7G5KfHQWCLEETQAUCuYiUXWXtyym9iXqx/acGJAEOmmtDElXIpld9KjK/ue33vUyo00Hmk9WMcXTPxjRKLzrrouMNvI1P4NbLdu3GdxsE1QRoSICUYZygXcU3PzmX7JPfSVV+I4siTMIWiDgx0VjcEK94Mfwv+liJ7fFkIk7zRdFka+wW+Y2xVVmUemGJf6poFZKKFuxM23PGfS2AJxl/XBx9w+PCZpiSKwXc2NXS844nFws1o9r0aSzaMpHtUiUJmXFUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo1KwlTLRh23X2gWkgL4nTGICIXqpMUpvj9JprEOskg=;
 b=XXh2kJGWpegQPtfnVVoY2kLgzwHhAIxDc4iBOIZhT1KWzDhoxZXQEwHmRC8Ws4feVCBhH42dFxiZ+35ATPUZnXGYLEeemxcYpdunq0kghEdCKg+/d8+bKOcEqHm75oux+JpPu8RGKj0IojCUTzsDzvVZLEqr89nME2Q1DE2D5fMp/yYaR008FsHiPJ0wSmLryikNmRV9/SX9b20buasWi0suJxc8Y1IEop11LwDU14qOKtmeFasgGbsIryguKRrP0tZO/UomsbEktPg56KzjSGIqpbkfBIgvs2LWeCgMZnycHuoidhMRQjAV9YUIbASliUVMvZHU86oFQch6wLHFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo1KwlTLRh23X2gWkgL4nTGICIXqpMUpvj9JprEOskg=;
 b=DsPKxtXP9SfXndTz0V3FUxdcUgLDByBix9Jmy2mnKn6qLgymKc1yrimKzl317jJ0SbumJafddDS85zFLAWoBBN5eNCVg2FIUoQDunmauxn62WlH4XHJmW0QrNAht3KnvtOjCRiKSDLJCnxGGF+3BLjwzEH66Rah+gNbMg7OBsJ3V0CALVPG7cDnnj48ftrocL6l95LcWZ+xSR3/E8b/r2K/CVw2eUpXQkcCPqgQTvCeVSkQkb71GqjICXgfRkBHHNa153YpHeVPg2t3+5DQLne3mwvmEaf5+JYqVnLEiGxO1uyCk9gL1emUTpp06VPOxJGOCzbmu6zikW68RMGkRQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b64e236b-e9c3-2036-e43e-93b456e44ff9@suse.com>
Date: Wed, 2 Aug 2023 09:51:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801202006.20322-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB10029:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f52f26-0b0c-44bb-ff63-08db932d534a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i2nh6mNS7nec8lc3Z7ZabGa9gdasLIt/BJFj/FOUJ4m8zKLzW9NQmJy3cms/b4+9nbARceEw2MPIlwgPtgsmA1YlfWPDTMYMIlLVKFOY3H3+aJgTr+hnEZUfT+eDJMrN6TBUN3jLQkPHsvSFx8RhkN9zQrRcp+qN09WesrgNGEZcr/+WXDbyIlyFsBxIZILr/n0t5RrfclBAco6kEbQDEYhTBzu+Gqcd0yqueL6m7FSUUo6egE8aS9PHR9ere6i1qq+uf4AA8mVqKK3oc5/2/SxwlkytPGhUwRVPtePRHEXC5nF8x9w8+fdS9EYvb1+wPi+FWd9hHqSUDNsJmAufriMaZknR2dZ00J+ksnvwTLadCQkqG45bh9vOm2kYFT3u5yJ2LwZXB6iOD7fnXbNXGSft5Rd7nw4BgBKyt++sXw4LNkxgaCPsa5ljoX6QKojrOC6/KCWM7tSu0NTl8VdcDttiPCGKB3NTiHzZn1bt9E5DGCUisteyPeDd1kTdc102aEyNOrEx/5ePebCj4kCKirhKHEuwvpcoHY79TyJ1Q5oryFRFshlqQf7EeKhZgvjbi4cZx85KhY6GArIiNNNaXed0V1uFpuD6Txu/VKIljdHKLnapLtU9szyPTYzx0vp94TEbuawVUIPxdUioEpcBXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(66946007)(86362001)(31696002)(6916009)(66476007)(66556008)(6486002)(6512007)(2906002)(31686004)(4326008)(54906003)(36756003)(478600001)(83380400001)(41300700001)(38100700002)(2616005)(7416002)(5660300002)(8676002)(8936002)(26005)(53546011)(6506007)(316002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1BsbTY4NXdUOFlKZWd3RUFReDAzc0tsNGtPRDlMNkx1UTBsR3F6WXNZN0Nj?=
 =?utf-8?B?b1UwRUxXT1ovN3JLQmpFMUgwb3dsQzhHSGFiNjlGNllEbFdJeVptZFNoODNa?=
 =?utf-8?B?ZWdESkNrVVZvMUQxd1ErdERWaHl6WWFpczZUdkhYZTl0OW5yWEk5ZGJuRzI0?=
 =?utf-8?B?Q09PR1Y0ZDNacGM3MVQ0OXFSMFpmWnNqTDMyUlRTbWovUitqZnpRZVUwUUNi?=
 =?utf-8?B?ZjN3Z3pHOExBTE9IUXdyUkJRMlluQnBod2RLYVhsSXducVVNQ24xK09ENGpR?=
 =?utf-8?B?L3BudUpKc3R1SEdHb3lCOUlOdUd1UDkyaERXbVF2RHJFSEY4cEN0RUttaEFw?=
 =?utf-8?B?Mis3cmlRNEVheml0M3F6Q0hpRDE5cWNPVW1kSHJLcEw5QmU0ZTdLdHIxblZG?=
 =?utf-8?B?ODEwK1Y4RFRXck13TlhpN0dJbGJyaUtGSk1tWU9HRTBqazNkbXdJVXNTdWJM?=
 =?utf-8?B?SFlaUjl2bGJ2R1EvbFRxWjQvUHExTWtCUnIvajZ5azdQZDQ1QXpub1pZdUF6?=
 =?utf-8?B?bmY0L09vMitWbm1vczh2V2ViZC9NZ3Nlc0k1Q3lMUGlxaTFqTU9yNk9UWU5H?=
 =?utf-8?B?ZC90ZkNYWjFBWXdWY3RSSzhZQ091aExuaTNnZDR3b1pWQ2F3L0lkVm9GNDV3?=
 =?utf-8?B?K2QvSHVYSDdsT2E4ZHlRS0dBVW41WVFQa0d6MmJ1b2c1aWpIRnl5NHRzVElq?=
 =?utf-8?B?am1HY1FXbVhtNG8wQWNRSnZ2ZWFFRHIwOGRQYTUydmRER2RocXQ3VVlFOHZY?=
 =?utf-8?B?ejZXbWU5ZDhmbno3RytZQXY4OE9BamZXWXUxZDRuYi9hUEQ5NHgxd3NpL3Nx?=
 =?utf-8?B?WmdiQ2c4RFZYQmJZMVVaTjNOTGNKQmFCWThZUmVxeVBYV01ieXZZa05RZlU2?=
 =?utf-8?B?UXJsOWgwSVRFbGdEYjV4SFRKclVrTDI0Q3dlODEyd2FrdXpzcjVXUFFQT2gr?=
 =?utf-8?B?MloyN2JyclR1YkJOeWhKdFNrMzYvV1I3enc1QjNKTVl4UTI3M01vZ3NZT3lW?=
 =?utf-8?B?b3R3MzhZVm9zZ1NLTDZ2Slc1WTBJVWhsb3F0L0kvK282MjRHbDZndWVta0pM?=
 =?utf-8?B?bEdKMzNxWUxTTGdyRkNNZEN5c1pEUGxIV1VKTWxKTkpyeExsSEUyTzk1eDJT?=
 =?utf-8?B?OW9aZnN1aUJnYUp4YUpqeUNrTTAxTEVOTjQwckxvbk94ZTJpU1RpbnhHWDhI?=
 =?utf-8?B?LzM0TWtMTFBTNEFySlZ0UUdrY0RlVzk1SXF6ZDg1TnQrelNzcUgwSVR0dzhs?=
 =?utf-8?B?M2YrTTRHamE0eURLQzROMVAvM0FLaXNHdThVcjBUUndlYXVQNjNOREhYM0s1?=
 =?utf-8?B?aTZKT29ISzFKaGFkOWpoMnBvc1lIa05LVCtLcXRKTmU4QUJzZmJrUnZPMUw0?=
 =?utf-8?B?SnlGQnBCc2RCam5uT3diMi9PYTQ5cXFydTJrUkRWWTBUYkl4aUZaL0FLamxw?=
 =?utf-8?B?VFFFa3loWWY4eEFLMU1td0xISE9KL0h1bnBXVmxDbmtVbE41aDVGbzl1dWZs?=
 =?utf-8?B?UFBoS0MxNi9mTTdxNEJiRllCUEEydThRbERjWmxmSlpLdGlZdTZoZ01hUFlI?=
 =?utf-8?B?OUdmejlZRnU5Ym9KZ0RDY1A2LzlTNTBGcGovcXlGay9HWlJXSkswNnN5NG54?=
 =?utf-8?B?TjVWMlQzOHZOS2JTL2VVR0UxK3lSZGtSYWtvVXJOYXdVY0RmYWJiZjd4djN5?=
 =?utf-8?B?eUpCR2kzODVUUzJVTzAxWmpYYmxMdEpqVmkwZmMwSE1LeUdBVWU0OU5zNGE2?=
 =?utf-8?B?SHlBcGRsV2M2b01JbEg5U0IyY0NRbThuRkNRUkxVZXExS0hVNmd3NEFGSXRH?=
 =?utf-8?B?Rk5reDY2aHFkNmZINUVZejBDZ0FwYVpPbFJVbjdBMkZvcWhJalcxUEVQL3dr?=
 =?utf-8?B?b2NRYnlySzgxRVhNenNRdHlZdXRxem9vOGhIYU9COHlRVGN0ekVCMGJJdExn?=
 =?utf-8?B?OTlwekFibUJreXFlSUZ1UGExa1VzQ1EyeGlZUkUvUmVQMkl2Sjdzb3Q3TXhK?=
 =?utf-8?B?U1puS1NrRm1CdzNOb3poT2JqNGg0Sit5c1hFMHQwN0o2SmdvWVAzNXl4dXp5?=
 =?utf-8?B?TVpjK2c1Z1NualJwbXVPR2MrL2g0VVM2ajEveWI2TEw1bWM5TVh0Y2I5NGsx?=
 =?utf-8?Q?7nlrM6FjPUnHOnYYtM6dJQhaK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f52f26-0b0c-44bb-ff63-08db932d534a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:51:48.4784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNayUwo8wcUANXhdVOuQAe6sTsAePiTOyEl3jZHeA7nXCBefBdtI+qr5OwlQ8YceICrSk9U9VkJGU6DSvEm5Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10029

On 01.08.2023 22:20, Daniel P. Smith wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
>      setup_io_bitmap(dom0);
>  #endif
>  
> +    /*
> +     * "dom0" may have been created under the unbounded role, demote it from
> +     * that role, reducing it to the control domain role and any other roles it
> +     * may have been given.
> +     */
> +    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);

This doesn't look to remove anything, when taking into account ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -467,8 +467,10 @@ struct domain
>  #endif
>      /* is node-affinity automatically computed? */
>      bool             auto_node_affinity;
> -    /* Is this guest fully privileged (aka dom0)? */
> -    bool             is_privileged;
> +#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
> +#define ROLE_CONTROL_DOMAIN    (1U<<1)
> +#define ROLE_HARDWARE_DOMAIN   (1U<<2)

... that each of the constants has just a single bit set. Seeing the
& there I was expecting something like

#define ROLE_UNBOUNDED_DOMAIN  (ROLE_CONTROL_DOMAIN | ROLE_HARDWARE_DOMAIN)

instead.

Jan

