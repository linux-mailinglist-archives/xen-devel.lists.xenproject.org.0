Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E22035F7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 13:44:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnKrb-0006Qt-7x; Mon, 22 Jun 2020 11:43:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnKra-0006Qm-3o
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 11:43:46 +0000
X-Inumbo-ID: a09dfd3c-b47d-11ea-bb8b-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a09dfd3c-b47d-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 11:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpvFXO74JMXGHYMRjs5mL/g2WH2Sqrl5I7dRyDqT3AXe221Z7P6w0/XQTE1b7N3mB02nBqnmprPrc3yBmK1IJO+5aTd1H25k8z5MyKEyJg/a0eVRN7funCQRyi+Hxk4CXmkf16CdmcIuHnHxywpMB25Cg8eA/Kst8klYEM1yH35osRBCAC5sDy2Tx9RMxx1F/2T66LuxkycD1RqM0QinswC2afonsS79/6MABcScIpQ1WonvBmKhSZALV1MpMXyS1nnBO7re+720gc+yM4BtdumLRTJWWgU05EPUbd2dAgO4EtNmdwyCsMd0DTT+QumCgY4tLfyYk9246DUyX3gHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SYjeg/ozQ31IKYOJt0B1R7JJDh2aIqKSbtZjFwpt24=;
 b=fEnuTK+Dje/VBvQueK+0Iquuus4Nwl62vV5+f9ktgLmxFZaX5fE26Avyq5lvrdQLMjED1mQINDRE7hMiaI+q20BKIcpc6TjYTCK6JrAYhjCamxY/4BQWSU26GDhwQcGqEleWYkoDS1uYtGsqprg0/eg4ec43Dyd4x1J6Nii/iC7NI63xHeXt65C8vBF+/L+/YM5GnJ0LWQwpSG0LcXsZ4gFnJBMrb0vdgJOS8R9HbLS5hmrcZdGvFKlLrZuVVoR3meh5Gb67rBMkIE7+zvlzgQpDEKQB+Y+RlYm5hXJdgSuhdXg6mRsPVUfjCiDdG7O5uHo6v1HWakWecDYYAjDRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SYjeg/ozQ31IKYOJt0B1R7JJDh2aIqKSbtZjFwpt24=;
 b=H5EYSKbNkJRca7QtTpmwFnj31jzcgu6lms0k8UPjmg8c9NMFtcPdnAhJJqwvCZUQVp69qSKK9KHNiWyLPX5lmCuNshBzwhTLWVg/T7iRWIuF7KPfLO+sX6RspKTYeWYOEkxNaxW/S6exD4eUrRUYT8J8Oec7Jk6w2QfgVvouOylLg9AY9BMA8UjxTnd7kpstF+98j5n0cYFJ+zHtSl1chiVZsacR7gSTlu+a6dbO0MmGhcOREs2k8hGMzdNvzDXuwDiEb0P70O7+z0BzML/F4GyIGcnJctR4Ntt7e/2wC1B7ef5TXmDyLT120Es3okqOgS22BSpXJ3E7G4xnMZNRGA==
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5936.eurprd04.prod.outlook.com (2603:10a6:803:e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 11:43:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 11:43:43 +0000
Subject: Re: [RFC XEN PATCH 22/23] riscv: Add sysctl.c
To: Bobby Eshleman <bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <7ebc34d888493f27302ed0a53e09216233cc9e7e.1579615303.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a50e318d-9e7b-955d-2daf-7bf5535c051c@suse.com>
Date: Mon, 22 Jun 2020 13:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <7ebc34d888493f27302ed0a53e09216233cc9e7e.1579615303.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM4PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:200:89::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 11:43:42 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 939db084-1a86-40a4-2275-08d816a18430
X-MS-TrafficTypeDiagnostic: VI1PR04MB5936:
X-Microsoft-Antispam-PRVS: <VI1PR04MB593613B3DE0C2C1FAB6EE19AB3970@VI1PR04MB5936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tk+lhjXS3YD21LtMV8KFDRIL983Jl+lreVSkwfE310nZCYFzNc+vIGlPfMBNLq9DgOoEeTp5MgiW70rK3gO+HGzZKvJOPTFpdbNKWdF/jT5/WAFDmoiucZFUaRGuukTHpp7cRYxXLN14WleEb3BRiYXDfudc9UqHnwuN3IxgY0qxjYOf1OHSpqCFXsgW+I05LeDb9hmGm/TTiTsBTzyzUsQSbkG9kuZceNN/gizD2y4WykCumttZOlphYrXnlcVcDdrJ9lKkUuCH36fS8AZCMQLw4TXVNkQGHkPjvwlleYZhbi1rYAxdrAp9ryM2nvO8oje6ehphzuAgpjeRJ2zfthH+Hx1V6z02NOHbCOunRZQgv9WNwqSo3+O7YNreuCKZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(39860400002)(396003)(366004)(136003)(86362001)(31686004)(16526019)(478600001)(186003)(7416002)(316002)(53546011)(6916009)(52116002)(26005)(16576012)(31696002)(54906003)(2616005)(956004)(6486002)(8936002)(5660300002)(66476007)(66946007)(36756003)(4744005)(2906002)(8676002)(66556008)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rL75Eio2v/tOinaoynee25FFjaWJnT6C1ZWCci9Q7zdMPzBhe2R0kLAO+czxAmavFEiBavt6vpU3Yy1qnt8wRDmBE+oXfCcLn5lPXCmhhtccK/vNpOU5aK/3OKXXoOajblh+Hc4HIA0LcCtKv8TivLzdo6AZlYPixAO9hLAiuc0CghRAKTZI7aU0tOmV8X9kzOPg0SBGsgTnyk/FrD0e4yJ+62QqZbFJnR304JC0KZ0ELjxs3E49gpy3wrnFg8AQtnoAy5ScDV7gh6/o3GW4DuZukO0qeNceK4aphWYDM2HYz6TPKCQwdl2I1vV+eOZ7IT0PoXDpLkXYowAWdMj/sCzQIGzQhUhRSL9BQBXcKakEzJ961mBWd5wdysjLtjI6H5v85Owo4i/gpfc5ydnQ757SafSubthK7gOvyb86RPy9drla8aWLX3Jm1ReO8eRCOpRqmDeL0hgrlW1oDGGCTH5xDs8e/L8FJFV9OkOn0y0=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939db084-1a86-40a4-2275-08d816a18430
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 11:43:43.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRe0E5axH25jWRBeJgK7OxlNonULkQSSFbYOJ7Hj7oQdHDDC5ZaFmVksT+6KaTfglF09SzIbljoVzj9RyuCeBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5936
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.01.2020 02:59, Bobby Eshleman wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/sysctl.c
> @@ -0,0 +1,31 @@
> +/******************************************************************************
> + * Arch-specific sysctl.c
> + *
> + * System management operations. For use by node control stack.
> + *
> + * Copyright (c) 2012, Citrix Systems
> + */
> +
> +#include <xen/types.h>
> +#include <xen/lib.h>
> +#include <xen/errno.h>
> +#include <xen/hypercall.h>
> +#include <public/sysctl.h>
> +
> +void arch_do_physinfo(struct xen_sysctl_physinfo *pi) { }
> +
> +long arch_do_sysctl(struct xen_sysctl *sysctl,
> +                    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> +{
> +    return -ENOSYS;

At the example of this (there may be more in this series) - -EOPNOTSUPP
please. Only top level hypercall handlers ought to produce -ENOSYS, for
major hypercall numbers with no handler.

Jan

