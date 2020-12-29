Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8472E6FF6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59829.104905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDBr-0002jV-4g; Tue, 29 Dec 2020 11:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59829.104905; Tue, 29 Dec 2020 11:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDBr-0002j6-1O; Tue, 29 Dec 2020 11:29:23 +0000
Received: by outflank-mailman (input) for mailman id 59829;
 Tue, 29 Dec 2020 11:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuDBp-0002j0-A1
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:29:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 099a4efd-01cb-4ac8-bff5-e0e7c5d9e988;
 Tue, 29 Dec 2020 11:29:20 +0000 (UTC)
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
X-Inumbo-ID: 099a4efd-01cb-4ac8-bff5-e0e7c5d9e988
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609241360;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=a8Ztkz1UMWCZmzS61OzW+QNF9alrjdw8n54XBEYSpuE=;
  b=RiWmYWdcesbyG9bWjvMR96rXdAT4bVm5bu2AkylKSaj8sNIx8EdE8XAs
   lzNH4VvJU7250c4S5wwBCMHKx+FpJYhzL5ahCYFytAyuPPrYUAlGZzGLj
   FbPQbAmDb0pzWt+lEkfe1QirbGYAjfgZNHX0As3oN+3D5iCkjwrgVqSqu
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AWrU4gucyRXPfYMFKxFUt6VzKCsSxD95JZ9SRL0PDhA1MXBRi5IlY7H+2XGYT8glSBVVmvb1jY
 S7V4biJ/ueVjDftBT6nA1h/0f7ytyxpd0H0onGriCgXL9RplCgbSnkTTcYeqrROb21HYl7hblD
 LbtZceC76PzNm7yDJ7c4scEiBgUdPq48zltSsnOjMjsuGi+Rif2N23j7mxcwhfFbNNuKdZDn9P
 sfjDoTH56YpMjncF40J0Gil6mInbRqJADBUF+YDlA8qXcYll6BB9L0XLWN7628sN4mUdX2Z+Xc
 2PM=
X-SBRS: 5.2
X-MesageID: 34317430
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34317430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmVLPEuxXrARCumGYLXRyhIINntzSjEHfWbG5XxcfMK7/4M28sBTi7EKtQEs6w3a9DmNYCoY5O4h5Kgx3/TVMq4RH6Hd+0WUysmwR5pcf/sSMcYJR9MLuoQ1EvlKQgFDc5KlYnNmsl6yte4IIYd9TP5l8ylk6HnHo6MIOA9Q4rlS6YnlDxu3S3oNBaAYStrJF0WduiQheuO6Q8ibKOLENZpMVfE1RlCNpujU/vUqdYJVPa1/x35tO0n3Pgx6JijXWIoFZlNgt6uxqLKSPW0W/GnsHS7toMNJ52Ovzl/v+NIIlspwKGH1etHgwT8fLfUOFey47q3xDwNWs89av1AHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgca5Fza70s/EspM7qClainEzlG2M9d2xMJMtTqb8zg=;
 b=P0Q9YNvpo6y1GyV/e39s605g1oKRWkCMgd03D0i0cV6mv6JdxTmnVv0wdCLLZbiEBDHetAt0rLwpaCKEU2sTOp1z+Nr66Tybp7bKJzxHNxE9bNhiEwX4IH0i6kBkaGrNOtXYPdd3LqPRCX/DaA3Z+Z6zbbCT2exWsHyGgb3+bbhRmLewy1LhTYSj+FHDZJ6E64RZDepHpes0ziaOVkT0cQsd5b71R7S0BMzu5dUv0Ws3Hx2GDSgPzjED1vBBTa/8O7oBUZs3SnTkjBaSydj80Zxs6RMlCti4nTRdLf1vfazCs2AwGKOBfGREW7bvLS4lzs0yXKIpOCwNjy6jhb1xaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgca5Fza70s/EspM7qClainEzlG2M9d2xMJMtTqb8zg=;
 b=YDKonI0z/h3J0ggCfZpz98TBp4gM7NTpszLWxWLBT3k04/ySZXdzFwSEk5HPQ7H6IeyU2SibB6dPx46TbTwLkNFwWozLG3eULk+iR3WXh7ylLggsgDfNYTqYOuJn0WNeXU/4nOwsQGaNT1WIEfiKOGeCuGCfUuFSbc0To99uGb8=
Date: Tue, 29 Dec 2020 12:29:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
Message-ID: <20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-6-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-6-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c70ef843-7227-4f77-08f2-08d8abecf900
X-MS-TrafficTypeDiagnostic: DM6PR03MB4761:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4761BF5E9A7E1304F6F4CEB18FD80@DM6PR03MB4761.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mO4K0ZeZYa01Textb7AMR7EPnruSdHvubFaOJjOB22leDgdfbpVgdarFjiKf32N+lXqxYh0SthvKdBLU/3yhpo56q6mDZtnRYJOYKiGxkl0cPgKWR4MCqAu9MIT24NC/qcQTwk0+qwxM2bebBsYqmMnYxuNOQqwS6axiTAt/jf7mxU7xVGKOKQzuwZFgm67bfp7eowFI20LwY2V3IYGL83NmS+Y0cYgRW+H/yLU6KJidzWq++J8eiiOnPXiY+5hbNyMBA2k2XpPWNdCBecEommWDVhiFshalm4leV3yfV5Q4ZMQscrhDm9zd2b3JCc1679qDwss3USlCNM7H/PnH6XgV8447U9z+cTANrNyzpaLNbAgbPk9gaAc6LswNav8HoGGEkBc8xAQw4k1bVtlrrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(346002)(39860400002)(376002)(366004)(8676002)(5660300002)(478600001)(6496006)(66556008)(33716001)(8936002)(6916009)(316002)(83380400001)(2906002)(186003)(16526019)(4326008)(26005)(1076003)(956004)(107886003)(6486002)(9686003)(66476007)(6666004)(86362001)(66946007)(85182001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2xPZld1V3N3RHBHaUY4UXRSa2lydGtwaUJURUR1UmtpbkN2b3BPTk5pRzZm?=
 =?utf-8?B?K25PT29FdysyNktiM2NIM2ZPWUljckgyNWF1V2F4RzRlOWpJU3N0MXdubW4x?=
 =?utf-8?B?V3E1bW1yTGNEclcrL2ZhRFhneW9VWW5FRVo1WUNDVUI3anRIRDBlb1lUK0tt?=
 =?utf-8?B?NDVTaFNFY2VCQ3l2WFBxTXlEUHFsVWV6Zk5Fb2ZUSDdRN2hOUU1TSktlaWZu?=
 =?utf-8?B?a1JKMEg2MWh6L3FlcUFDWTJ5NEN2Zjl4K0x1QW1kMjRYNW1YdG9sYXQ0cmxk?=
 =?utf-8?B?WnRwUmZMVVFUR3QyWGFOL0pESjNaaDQ3VzlqUDdXdXBxdmRGcGdTb3E4Qklu?=
 =?utf-8?B?UnRqdENtTUE0T3ExTGZRdU1aclRraEJtVUdpRFJnenhacm80OGk5KzRBYitE?=
 =?utf-8?B?NEEzd3BvWUV6RFAwSi9kTnRkaFdqTERXWVpySU0rUTVQTUdXdGZvSm9DWnZ2?=
 =?utf-8?B?K1FBZGErdGE1N3pUeGljalMrOUdkWHB0RThSSmM4TitmSGhkeS8vcU5ONkdp?=
 =?utf-8?B?Ylp1cWt3aDNJeklJMHZhV3o2bWplN1djWmJ5L3VZdXd3bGZ4SFhjcUFnR2kz?=
 =?utf-8?B?YnZqOVFaVUZTb1dCSjk2d0NmT0hNWEVpcVU4TFhPaEdHaFRVbFhLMXJVTW1w?=
 =?utf-8?B?RmdXV2ZEY20vQnorWGZnam5aTGVTSlpBdzJwNmtFSEV2Skl3c1lwanZMQUYr?=
 =?utf-8?B?QXNwS3VYT1BSWnhBY3JoR2RXTjhQWDBNY0dRNm9IaDZmRFpZM0dNT1hQVnRU?=
 =?utf-8?B?ZkRNeFZFVHlNd000bFMwdnlWVGU5TEZjZmdXaGV2cEY5UFJhMkxCa0hNNm9h?=
 =?utf-8?B?V29KQnRUb2dOTHp0ZlB2SEd6eFplaHhKK0Q4bUFZOXMzT29UNW1TNFlkVDI2?=
 =?utf-8?B?WG1qcjVNYjFZNlQzUDJwUE9GbCs3M1FxcEd1RkFpZW9SQWxBVURxdjQrUUxW?=
 =?utf-8?B?Rlh2QWIrQ2NQOERHZzFpMG5YZEUyZExTK3hGcmljeEQvY2ZMTVV0OGdOdEhh?=
 =?utf-8?B?N0QwSGNGMUN2ZWZ6elY4VUFIdGNrTzR0S1ExZEtkdzJUcjY1bS9xeDd2Yk81?=
 =?utf-8?B?TmdtNVpzNVVGTkd5VWNEMnlFVG50R2lxRkdoY1ZzZ2hJWUphMko1ZEFBL0ZX?=
 =?utf-8?B?MHBjempHWXpaTFVOZm1NK2tYVVd1dHZSV0JsV0Rvb1NHTmg2QnhZZkRpclcx?=
 =?utf-8?B?ZU1DcDZzMC90WkpxYWtpSk1TL2hQVXkvdUc3RGZoNkE4Zmc4aGxrbHdKb1pB?=
 =?utf-8?B?V09rb2g4Z3pQMHpHMFdaWFFSdUdLNkVnS1ZXdTFSTTlycHJpSUN6T044OXln?=
 =?utf-8?Q?WMEpGMJRZGS5RTezdsruiFRCU80AnpyZkO?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:29:14.9841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: c70ef843-7227-4f77-08f2-08d8abecf900
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0iv+zim3jpfcrcV/JVC3jzWBzifmrzirrqf5/S1gc0NkgZSZr0+PWy6uCX9eHNVZmNapV98tWSnISfjUzl5FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4761
X-OriginatorOrg: citrix.com

I think you want tot CC the tools dev on this one, specially Ian who
knows how the Linux one is implemented and can likely give valuable
input.

On Mon, Dec 14, 2020 at 05:36:04PM +0100, Manuel Bouyer wrote:
> ---
>  tools/hotplug/NetBSD/Makefile   |  1 +
>  tools/hotplug/NetBSD/block      |  5 ++-
>  tools/hotplug/NetBSD/locking.sh | 72 +++++++++++++++++++++++++++++++++

Seeing the file itself, I don't think there's any NetBSD specific
stuff, so we might want to consider putting it in BSD/ instead, so it
can be used by FreeBSD also?

I'm also not sure if it would be useful to Linux folks?

Thanks, Roger.

