Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65578240C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 08:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587295.918634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXynI-0002WH-Fb; Mon, 21 Aug 2023 06:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587295.918634; Mon, 21 Aug 2023 06:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXynI-0002UC-C1; Mon, 21 Aug 2023 06:53:44 +0000
Received: by outflank-mailman (input) for mailman id 587295;
 Mon, 21 Aug 2023 06:53:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=phPX=EG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qXynH-0002U6-4t
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 06:53:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76d0bdec-3fef-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 08:53:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9776.eurprd04.prod.outlook.com (2603:10a6:10:4f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:53:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 06:53:40 +0000
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
X-Inumbo-ID: 76d0bdec-3fef-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5RiF6LWgsiiK9M7ECvxVWRsXHcTa2s19F0sr8o+cdKWSf5cVzcA7N9eJcohdlZ+eHiZgTxyFwiPDHkN+937mklA4sVPNCJde6CZn7U9xpL15tFuY8dm3OCtX04udTF2sBtEg695O3hqYjczUhC8oo0RkenOVCyRsQkOxnLfxiA7Zs4fBMz7VfFVrU/CaeweD8HTr3hegvF+VUE1rJD47hecEd7qkSOURbW9EA1800rD4I7F1csiwMWsjSLnD5ogAynqIqW9Ge4b2ve+Mxks5/ojwWjCks/kB2Iy123+Xb/x8xWm8I6X7kFIlI0kcKHV0uqjvSDdH482PMJ2oHgeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fa3FFB2fxkJ8H/dRpscRsqwJrWv1X8/QKjQcXgE4Ues=;
 b=K5A6dHGmxttic9yMFFFCfTpwt/TgpaRAzIIETK10sUUM5fsGgpWWU/UlEHxkzs9/qRVV8qyHL+52hEG++T0qnGPkn+p+cJ0n4N9nJi6LHg0xdX/kcO4OPpkJXYiGdYU3XaV3l8bpDc6bzutS35T+WP9fEpcmWcSAM6UAywfmR3XLAA5lR4YdiqZSdMT2YJd7wjrH+GsjsKI+YWLVzteLOzezUbivRdFmUbkbA+wfrEjJbKYeUjDNPMg6KYEF4UvhBpYoEoKQD4Xs+dcC1EtecLgrR/psYY/cVOgKzg3B0/6FwpsPOj1QBub3TgNZtjCCu+Offh2i48tUpRLKDpEbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa3FFB2fxkJ8H/dRpscRsqwJrWv1X8/QKjQcXgE4Ues=;
 b=334FjRBnPeBM+p8viDwgwpXRv3ybiokhe0lxYFX9fb5sRcpiDhY9aZ0YHO8Eo7xnlYiNfyWCrOuhUZOVelbCkmwIKjgWp5TmUKqgLwJ1I011XY5HS5ljdYKbF1WRjvHcs2sQVgAA5CNzevO2IK6MZ67cWwV+B/4doIRb9kTAGe3PNj5K8cj/7nk5kvvnPwJ3XxulDELTZ3HKZRcI2vdtkGHlJrKCUsw2FTnibJqt97we/GxfxrZlpuFsBhde6x9V0sZGZBo3znZOBIHRwmi/cw6bhlb6RZYZA/AHmtoWnLU/VjPYjfKeu8hThnRp7iO5dJyc3kkpLevgHl+TwR9RyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86717900-39cf-c95c-46ce-f567abda00cc@suse.com>
Date: Mon, 21 Aug 2023 08:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v9 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-10-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230819002850.32349-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: d455bc47-8cca-4fd5-11da-08dba21359b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TqxuKcrDmUQasasuooQD1GdHt0WwOCe5moxt0xXurraY0elDL844MlXEBJ2+52iTOb6TVRtUyaJ22i4VmRjRvxbYrpGxEovRVhaOD6/ENwIJwhJIQ086xgIWrorUAJtC1pPV4/hGjsT0TlaBCqgbQNb4Qr8eaESVeymXyIOTIRlFfbCG4aBKJSLPO+tM0QUD5PX+4y9rbNtRoqynQXykJZXrISdELDzfUxMAMSiaKBaU/RfdJx6C/8JzSAUD3w/yiPNI0INXFJ0hmBXfG+D5Az0jVoUahElLu6JBlFoZQVpSijypc+s+kCF5ET/qwrV1SidTl8C2kXdzipC2DcCD77FU8P7o+PWUACE93PSo55OvcYdmEJQBissuwIVkHZZyrQFG9t5QVfnnrdoX9LSyNzIa+V3f25k/nu+g66P8DMmlad+aWBN/jws3J98+0iYZ4Ux0sLHuNEcYVjWThtwynXYkm7wPXCSC4elRRM0qwkxX1pkLG/hSbEH6QpWZRSHExw8bzvSVPUf9PuNM8WxyA5lgtLI0FRXyyAPFjlF1LFcC76blzYKXECGaTL6kt5DvaJXuoFtr2z0KTz3e0Zz3CK3Ck6mKsuJUxVzI2XxoEmRaUFFW0ryBX1KIaCLbJO0vZwwgjubfv7cRlcWfkBA4Lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199024)(186009)(1800799009)(2906002)(83380400001)(53546011)(38100700002)(6506007)(6486002)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(66946007)(316002)(6512007)(6916009)(54906003)(66556008)(66476007)(478600001)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEdVZWhNcHB1SFBUQ1pycmVBTk1ockkxRWVCcnN3MHpOMGNrRlFYTm9JMGxk?=
 =?utf-8?B?TnlaTkk0Um85ZmlNaWdhaUxvR3BHSFd5Z2tqSmt4US9RTGMxU0JxY0ZDS0tC?=
 =?utf-8?B?R1p4bnRIYzBPU2ZmN0VodTVzREE4OUZRRCtGMVNMcFZ5cjdvMW42OVZJL2hE?=
 =?utf-8?B?UW9oUWFFMHB3WVRKMW5EKzJUc2JteHBybmpFTXdPK0FiQTgydjBVUmlLcEQ5?=
 =?utf-8?B?N1JrZnVmK1ZTdnpBSnlQaGg1bUNDRlpFamZKUzdwcGVyTndLeG92eDVJUm1y?=
 =?utf-8?B?N3RvbTVmUWkzQnJPcjB3WjJqMzFaYmJLaFNuR1ZhRWlKcnZ5d25MS0ZmWDY3?=
 =?utf-8?B?ZUJxQ2M4cjdNaEdSZTk2ek91VmVrQW1selhxTUxGYXVYTTNWdWplT1BQVkVT?=
 =?utf-8?B?TUszbWNrSVhyS2JwQ3BXRWtuQU1zRjhKVzdUTC9Ub0FoYjlIYW9HTmZaVlY4?=
 =?utf-8?B?Mm5KSzAyeDN5T21KQ3pMbGo1TVZ4d0lIenphSXlyK2lhU01uMlVHYVRFUkU2?=
 =?utf-8?B?RU1CRUgxcnFzRnFhZ0o0RWZXQ1lFTDRyelFSSzR5MjYrVXdnb0pkU0QrZEth?=
 =?utf-8?B?NFk4UWlvdzdwUGlKRVVDUlFXMjZtek9QRjNCNlZuRzlMd0dMR01jbDJaL3Bo?=
 =?utf-8?B?NzRQUTJrc0QwVVk3UXY5ZFA5a05rMFdtTDZZcWtBNXc4MUtMTXF6R3RiNnYz?=
 =?utf-8?B?K24zaUVpOUlOV3o3NWF6ZWdjTTBrSFVKQXVPMlprbUh1aHhldEFib2UyNk9K?=
 =?utf-8?B?SnJMZlAzWnNOcWVkbzBNNUVuRlpyVk1HYmU3dWUrSDMrVUZ0OXFuNUZIRlFQ?=
 =?utf-8?B?OGFQQ1hvN0JrL2s5bmV1TGtod2RpTk15TnY5YzBYTDdsUEJLcFhHVFArTzAy?=
 =?utf-8?B?L1RVZDdkMkhRTEJ1Vnl4aGZCK2xxSFc1Q2VJb05raVZXRlVYY3ExSkViSWdT?=
 =?utf-8?B?R0lEenA1ZDk2QlRkZ1IrWUh0WHZSck94R0Z3eVpkbTdkSFdnVmJtMmpTZU9O?=
 =?utf-8?B?N2VIKzBETTdBdWhyVEcvWUFmcjB3NWdqS2F2OThlMFNhK3ZneFlJTVlQelg0?=
 =?utf-8?B?QU54Z3c4amtEMTZPSkhjSXZxWlc2Q3YzMlFLUWErVThvaEpOZlNaNW8yMUVN?=
 =?utf-8?B?MExucVlrdlpJQmtkMHhZUkpQR3gvMXc2OUxBK2NzN20xUkEyWUMxN1dtZ2Mw?=
 =?utf-8?B?Ujd0UmRBK1BTb1ZES01iNURoY1prQitWbEdKKzFTRUpkdUNISm9sRzI4cHlz?=
 =?utf-8?B?VUlNSGhid1lQSkZjYmZTdXNnVjR5REo1aGJMdWdJb3NnUndHVjJxdmVYU2hz?=
 =?utf-8?B?Vi9CekdqRENnVktVWVlSTGhsU2JEaXpHTG9zT2p2UVg4QllhNU5KcTQrb29R?=
 =?utf-8?B?VVJCS1VXZ3BLRmVXQXVzdmJQdVdyTkd2YUI2TE9PMFdaMmFQZWNGT21DZ1pZ?=
 =?utf-8?B?Y05Ia01YTUl1SEtZOGVJRVA0SWJ4YjUzOHhPMzZQbExBL3ZTK0ZTZ3E1YklT?=
 =?utf-8?B?aHBOOHNkQnhRc0NOOG85c3N5T3NRb3c1bUpHY3FFVHNkaXZmd3dyNGdIbzg3?=
 =?utf-8?B?NWh6aGUwRW9jRFhQbENOQnp1K0ZXa05sdmxOQ2tJa2toWG95WFV5dFBVL1F1?=
 =?utf-8?B?NkZpYlpJSmMzczNwMndJdlJOQ1F1N3oya1lRayt6ZVRPNUJsT1RxaHF3a2ht?=
 =?utf-8?B?R1lUeEZZT0hWMStGUnVNYVdIUDR5MkllUHdZWnVQK0FZOEFFZXJ2MFNGYzJR?=
 =?utf-8?B?WFpOWXFWdHBLclFlcElhZHRMa3ZWZU5mOU42bVlkSjc0djJOM2xWZkpUcVps?=
 =?utf-8?B?QmdyNGltTW1tMjh4V2lHaHM2eGx4cVoycGFoT2hMZ0QrODVSS1p3cm54RW5t?=
 =?utf-8?B?Sm9MTWlwQ2RYSnRNU2VWeWgzU2tsQzgrZ0VuMEF5cmE5dTZidERDdVVXODJj?=
 =?utf-8?B?ckNRdE5Rbk5HYkpsNzBzV2tzMUtCMTA5OCtKa2MxdThCN0dsS29BRVY4Q1JN?=
 =?utf-8?B?STJZRlh4YnVsMXdsTHJWa0s0dkdmaHZTaG5wYysveit2WUR5emV6d2RzL1pt?=
 =?utf-8?B?U3ZYQmQ3TDJQOEl4NWJXUEZZdzk5eEUrSnZjdm9aMWE0SGNSMmpmY2RHS2Zy?=
 =?utf-8?Q?1PPz4qQr2tFRf/xCTwWOZU8IR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d455bc47-8cca-4fd5-11da-08dba21359b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:53:40.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SRh947Y3wKIWL5F6PHOV2g3YpZb7cTvQ+PmO5eBeMp8GARHbho0wf1kvwa7bcuTlmuu8ngkdIzO696sv1/1Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9776

On 19.08.2023 02:28, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> Remove static type so this can also be used by SMMU drivers to check if the
> device is being used before removing.
> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> patches in this series introduces node add/remove feature.
> 
> Also, caller is required hold the correct lock so moved the function prototype
> to a private header.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v7:
>     Update commit message.
>     Add ASSERT().
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 26 +++++++++++++++++++++----
>  xen/include/xen/iommu-private.h       | 28 +++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 4 deletions(-)
>  create mode 100644 xen/include/xen/iommu-private.h

I find it odd for new versions to be sent when discussion on the prior
version hasn't settled yet, and when you then also don't incorporate
the feedback given. I also find it odd to now be Cc-ed on the entire
series. Imo instead of that patches which aren't self-explanatory /
self-consistent simply need their descriptions improved (in the case
here to mention what further use of a function is intended). Yet
better would be to add declarations (and remove static) only at the
point that's actually needed. This then eliminates the risk of
subsequent changes in response to feedback (like Julien's here)
resulting in the declaration no longer being needed, thus leading to
a Misra violation (besides the general tidiness aspect).

Jan

