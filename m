Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAC2F6A96
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 20:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67507.120554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l081K-0005Cp-LM; Thu, 14 Jan 2021 19:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67507.120554; Thu, 14 Jan 2021 19:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l081K-0005CQ-IK; Thu, 14 Jan 2021 19:10:58 +0000
Received: by outflank-mailman (input) for mailman id 67507;
 Thu, 14 Jan 2021 19:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l081J-0005CL-5t
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 19:10:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be163d42-f1a4-4bc0-aaf0-0682e806c93c;
 Thu, 14 Jan 2021 19:10:55 +0000 (UTC)
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
X-Inumbo-ID: be163d42-f1a4-4bc0-aaf0-0682e806c93c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610651455;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4aSSm4g/Pny+Yw63E1Bno8jWZ52ruC3UElyPceZEdiI=;
  b=CyIzGrnwovbxnvSioJgkxGM64tfC1aWAdmd9WSOetCqSmhKqvdwu4zut
   QBWOMLkgqzveGbeRNCRGc9r/XlocJzVb8SGRQJQT+tAOqnBiOrZQMb1zT
   63J7XOPzz72eCpMo4SBjHJFYXYpW6/h/kFQXfwLwbi55Lm8Nf87YJ1KbI
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TJN8mYHoisxlTFZTYTQuLJGJj58fcwKPRPkwwTbXPKTqGkr+iUxuaQ83J1KCjREsHDHfdrH7EL
 Cfg8rk7/i2CaMj5r2DdLrbClw3gK/RfVZXXkXUUvABmGfFm6u1bSnCJ6Ben5nLT/W7Sw60yh1B
 wVk0Oe8X7QlmaNAy2EEtOvIypCFUnnKq3PXwo0ziv2GjXJFep2Djf2UZXXmMysASyh+/zSx7T7
 MIm7sqqqxwbIfVO+Hw9VH3GbwS7qGgoYf5ymHXn+2gT3MLJqIZlmHwuNu/NorYlxJ2LqJ+4QO2
 vBQ=
X-SBRS: 5.2
X-MesageID: 35489900
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35489900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaDsncxCQJnoOYZ327S1GbTBvADlaAQoGXjV5gROhEjy2LNpto33AirNeig6eTxYMy0T4KKkhXHQ63vpoV162NP2kCwwsvit3zJu4QIq/62QRRCNPZ8pbXKC3UrP8cWokalMSs2UQl8QTZoDa6azUsiBE9Y539e9/fY8SBm+Bgic2JKBNM/hq1Ejr/ks0OhO1zCj24aEUR3REjIUnuOHYdPytFeaC97lNEAI8Ino2ETN4nfoD6Q0HLQh72V5i/oGLmlCuFsIPEeLoEWmuwA2HFdyVEOYD+d2p7cM+IspR5CDaDFtDvMtkerE9qFNUnxp625wZM1dKvo7tjmCRHZzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqAl7d6g7y7Mrlwhag1CctonKBE2hPKLD9s1DJ5q7Z4=;
 b=jYLIld628zxDqxs1lpPDnaRs4xSKqvVywZ45n674NhiDMmVL2Xv/KcoAbI1o8+skkFNJ5p/8ZCJpnDShP4EPHBmfDdx66s/IT96/Pwjy7X4M9abL8LYebPbHE2gA1t01Ui+2mR5vGosCZ58nWFd0C0AFKzrmq0KrFwiB1Wil3ABDCHSot/fiQYB7q3cJsv8iKy6JBVm9uCKcMpH5dp2WUeYaMBKQV8cF8GQGh6vQ/iwbe+urYhbP1xAh+s8zG/MemXUfYYTO0jG3V4ZJI4gJPEoabpC+Z5mxgrq5uBT9aJJAWk9w8Rdp2NV6YwdIMVb5Vw+HLyCTf55X6KIhoR4xAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqAl7d6g7y7Mrlwhag1CctonKBE2hPKLD9s1DJ5q7Z4=;
 b=oR46W+3pBrIRHzx6ZSJwEQAYS679DN9B31iyjDcfcFRhFkY1cEt0gzHYXaPAPdh2S5XVgMcBFU0sSPq/GA8zbRP4ZNEViZGBUOooV7egqxTKNT/B7yzY2NSmjbUL7eqoMjbabjQ92f098Z5u6NnWURSKflrh5Ko/O64soI7ELZY=
Subject: Re: [PATCH v11 01/27] tools/libxenevtchn: switch to standard xen
 coding style
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-2-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5f282314-d07f-33eb-1e5b-118ce4de3687@citrix.com>
Date: Thu, 14 Jan 2021 19:07:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114153803.2591-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::17) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e206008-2059-4279-ea62-08d8b8bfb5d9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4837:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4837EA082824D0C9F1EAEF96BAA80@BYAPR03MB4837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5ViW3dGvhff/pl39AH+uddj+lePQhNrPnNk3DphItA9+xuZhjG+QcTJVg68j4aqE2lj8SC8f3llRYhmc8Pb0JepzeVJ4UayvjhbphdMU6X41nr6xe2JMP97SgQZcVPdkUlxGuqIFEu3m6i0Byg3AWoTCtuyLJe0esj8VbudHSU4X/jJdF4bAqmbJQc8zpwkZbekbyunY3b6nqWBpHMfSynTnkaL+qsXcKNRHYtQWc4Aleqhrt0FIVuIu/ayUbRBu1bHSDD9AKmEaMFTwR8POjqEijUZkU4XJlBPLOrYaU5rL19NR1jbohFfrqBfd0/9cABaOpM6rPCI7/wFvtMd7L2SvHqSSYnQF1/lCOSH59g44ityef0a1J1IZbpf2syOKNkl5AWePnm5RPZCvsFQAeg/5av/rwN9vhUfWj6Fy/jgq3othtXRpPgxRyHPE952Oav6Gj9AGOy3kQRDNROZ5O1WbwOEBAubU7ThcH7rK00=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(6666004)(36756003)(53546011)(2616005)(66946007)(86362001)(16526019)(66476007)(31686004)(4326008)(478600001)(26005)(16576012)(186003)(31696002)(316002)(54906003)(66556008)(6486002)(8676002)(8936002)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUd1VTVCY3gzeEd6QmNYT1llaDZ3SVpnWFVLNGUvYUhrYkpjak00d1BUYW9u?=
 =?utf-8?B?eDl5ZlRCTVRkSHI5NDYvaGJTMVNkdXFOS2dnbVBScERSNStGa0RKRW5LNG0v?=
 =?utf-8?B?MjNYa3JnZmlVQ3c3UjMwV1l5SGxtT3kxV0p3bHE5VDdHVll6cVhXQjRmYWlv?=
 =?utf-8?B?VzFPd2xVK2NvUVlRQ3BQN0Fya21JNGRFaTM1VHcyZXkrYXlXbGxhTG45K1pH?=
 =?utf-8?B?eTdBK2svM1BkNHk5aXFOSmZVaVE5UWNxZWZ3a1RpR2tnN1kyMkhqOHpSR2sy?=
 =?utf-8?B?SUxVTkhBRVJBdUxUL1kwaDNtOUhkMUt2bGRzWHpNQXpCREkvenc3UWFvVDNH?=
 =?utf-8?B?MnFWK0EzUWoyZ2hiWSsyWjh1NFR4T1YxWTJ6NGY4endWKzNON1IxNFhsamlU?=
 =?utf-8?B?SVZ1NG5EZ09SSStzRTBrUGdsUk5ZL0lEcDNDMTVWMTgrODc2ZzVNc3pxYlJL?=
 =?utf-8?B?UEZMTjhzdkh2Y0xoTkM0S3oyNTVHTWxHV0Q1QnkrTUdsZ2lYV2lZbHE1ZHl6?=
 =?utf-8?B?cFFZSDZlL0wwMlV5bGtkVDdMcmhoMWpSbGRxT1hCT3V6emRla0hVNUhTRC9F?=
 =?utf-8?B?cmlobWdNRnNGV1o4cWpIYW1RVGpCUmMzT1BjcElXdlVkMDVzNSswNGhLcDF3?=
 =?utf-8?B?NXFTcyt5OE1GUkRuYWM4WTFUdkRYMHZNRDQzWWJYTFpFVHR0bmVRM0VZMDNy?=
 =?utf-8?B?RUlHZFRFNVJJQ0RHRUo2MkNsWXhzZHdweGhKdmZWNE1nWWpnVllDZy9qdFV3?=
 =?utf-8?B?czhHbVRKa0kvZ2JtTVlKVzh4U3UrVHdZRDJPMWV0cTQ5RjQ0b0x5cjBYT3RQ?=
 =?utf-8?B?eGhLbXd2QVQrV3R4ZGNkeTZUQk1Ra3UzdU9aWFBITG9mRmxDMG1zVzlmRUdl?=
 =?utf-8?B?S2lhS3ZPWmNYYXRQSTZNdTA4NmNVM1dJdE51azROR1p1eXAxQWlEQXUvd1VI?=
 =?utf-8?B?RDZTcDQ0R0xFMG1IUkFvQzhWRFM3VXRobjNuSUpEYk5HMmxXYi8yWE0xYUYv?=
 =?utf-8?B?bGlDVnNSdzNuMUxUUDlma2FKc1ErZjl1SXJLN2dEeGR2UkpNRTVwczdIbEFZ?=
 =?utf-8?B?WkN2cVNkbFFYc282bEtnYjJjRERMekcyWHg3M2NKWVc5NWlHUk8zci9na0ln?=
 =?utf-8?B?alBlVFFhNlE0QlBOdkhxUndjTUZCa0dwK2lvTDAwc25pMlZVZXdobDIvRHBk?=
 =?utf-8?B?c3g0S1lTOTgvcWFYbkVsdnNST053Z3JQSzRXNW9nb2pUUlhnRXVnNVVJMERi?=
 =?utf-8?B?MHV2Wkk5Mm1rWlUzQ2U1VG5JdlNST0kxUVlhL0NLNEFDamQ3OTRzTW8xallE?=
 =?utf-8?Q?zBmoS1X2pHdRaVVhJZvIpaS5O8GKSzdGI8?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 19:08:00.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e206008-2059-4279-ea62-08d8b8bfb5d9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO/pz2smAoQGhMN61YiKMV+0cE2hKKpMY/FrcF2sjJ2iMX4dIyj9CaSv3i1i7cYpQNv5etL49m0RYzRKuUv977DmwFgZR+MUlbu/sXFFxfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4837
X-OriginatorOrg: citrix.com

On 14/01/2021 15:37, Juergen Gross wrote:
> There is a mixture of different styles in libxenevtchn. Use the
> standard xen style only.
>
> No functional change.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although if whoever
commits could fix these as well, that would be great.

> diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
> index aff6ecfaa0..5008810f4f 100644
> --- a/tools/libs/evtchn/core.c
> +++ b/tools/libs/evtchn/core.c
> @@ -42,23 +44,26 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
>      xce->tc_ah.restrict_callback = all_restrict_cb;
>      xentoolcore__register_active_handle(&xce->tc_ah);
>  
> -    if (!xce->logger) {
> -        xce->logger = xce->logger_tofree =
> -            (xentoollog_logger*)
> +    if ( !xce->logger )
> +    {
> +        xce->logger = xce->logger_tofree = (xentoollog_logger *)
>              xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!xce->logger) goto err;
> +        if ( !xce->logger )
> +            goto err;
>      }
>  
>      rc = osdep_evtchn_open(xce);
> -    if ( rc  < 0 ) goto err;
> +    if ( rc  < 0 )
> +        goto err;

Double Space.

> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
> index 9cd7636fc5..8e9f77bb6b 100644
> --- a/tools/libs/evtchn/minios.c
> +++ b/tools/libs/evtchn/minios.c
> @@ -108,10 +119,12 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
>  
>      ret = notify_remote_via_evtchn(port);
>  
> -    if (ret < 0) {
> +    if (ret < 0)
> +    {

Lack of spaces.

~Andrew

