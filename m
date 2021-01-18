Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762892F9C42
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69537.124521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RdB-0002wP-E5; Mon, 18 Jan 2021 10:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69537.124521; Mon, 18 Jan 2021 10:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RdB-0002vo-8O; Mon, 18 Jan 2021 10:19:29 +0000
Received: by outflank-mailman (input) for mailman id 69537;
 Mon, 18 Jan 2021 10:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Rd9-0002vG-1y
 for xen-devel@lists.xen.org; Mon, 18 Jan 2021 10:19:27 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b2c6a7f-eaf2-4e63-9687-cbc8c0d44371;
 Mon, 18 Jan 2021 10:19:24 +0000 (UTC)
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
X-Inumbo-ID: 2b2c6a7f-eaf2-4e63-9687-cbc8c0d44371
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610965164;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FhC5GN32jDQ52C5SkK8vvu+ThytKy9a+6eesAy7sNLI=;
  b=d5ThLKwkhwrBci7oJInIGzjFh5HGkiTJNLnzBA+rWetqwUiTDMv4sxdG
   PmL9VTcyS63VO5hQmwSbDR2jjVhBbdVqBAnosiopaESbihXsbRN8FOcr0
   I9tX/3swBvndPLl+sMCYuKEhajb1dDh0a8psXnVpq5F11UCWy7HO3iXSI
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yi30PLAosbQ2ZldSMdp4EAKvb8s7al0bg+lXirBetw2PA1z9dkN4YvwXsJ6/QoVjtXp/XrSp+7
 Xs+nIb6/TrOlerAJ6TkeZIp31yRdquIyfIeZG46NRGniNGyraP5S0BZ0r70gb5RNXGiDF32QWv
 oxD22aSSD4GP32gFdXQNWUpCox18qTx3CzP//AO8WaroaQ6BdZNiXhYzrO9cF2+90xHWEBNwnp
 O/LIViXNDp1nnp2Q2fxdgvyR6lo99QtZ6NOA8tAoooWfUWdKic1q1/0KN5LkIu5FTEbGWsBhr5
 LKY=
X-SBRS: 5.2
X-MesageID: 35508056
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35508056"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzXbjF27IbLGcEZhVmCu07hxmp8BdE0VX4c5N7AfyAxkETT8KuQez7Uhc3NThMSCtnunt/feWU9yosqf5ejNPebZQqXQ4qrSE0lKt9DK3yLnBV9wevZxXXO0HGGX+/JEuaAjNiS1bnH+tmF+hfsKMJ1/blUFpxoW4BLSLJcCfABWaj+dL8v+pS/3+Ln7HBtAIrPY3FJSsiKSLlrw2C5K0IQsAqq0rWM/DXq3YwQg3Ojj3E3eexf8criniaykQB8Nwo1fF0uayoIaaf6fiJq8R9apGDJ9AOInoRzac+tWsLdWcW1D97hQNdv68m3xyyDDTP2IXSeZgrqynhUwa9wAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/ygDZen6ZKCMFshcru0CZjHem0w/NfIonG7sZroBXw=;
 b=kiPfTncOYAdu4HhtbE3NSS5/aFihUn7pUrpcSou51s0PgWSFfqMqpOKGfcd9l9msR0Qs5BIgCf3Qnsaoq1fYkUgKcXHOO/WvelRT+xAkQ3GB4cgXMiEPcY1PEmLgktft9LKFlJbtRpDS4GlVd9+v1k+hd2R5Kr5CIrEpDffKClgbCpkW8GA4M5pQrvpDzWsicHBpZ1XJ+jYlwC3wLqG/ur2tY0p3iA774utOM6zQ6jUG/QWSpwYEfqAL4d2x59U7RW2+aS1oD5FkZK+0w5GT9CcR1Zq1l2C9LuHCFa7xkI0lGX/l8Ljw340GuGUAcg1IlKEbUqUl56mLzQoSFsM/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/ygDZen6ZKCMFshcru0CZjHem0w/NfIonG7sZroBXw=;
 b=N2dNcXT57mByKyaIek4LubYmOCHQQoiBMWwgRdwjjHc5iihO/Csnkl3KZO/k0OeXmrA8z8IiX7bWj1cVx0zntUvR5TaSlHEmIGDqqoKs8SKIahTWFgDCPkh8b5qFuFnVC4TMoWpYS0+jrVrj8adn8UVsetxt+o59elRIkHlm3To=
Date: Mon, 18 Jan 2021 11:19:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Arthur Borsboom <arthurborsboom@gmail.com>
CC: <xen-devel@lists.xen.org>
Subject: Re: Xen VM call trace on fstrim: Error: discard_granularity is 0.
Message-ID: <20210118101915.phxn26c5spars6od@Air-de-Roger>
References: <CALUcmUnh_tos4BnXmrsudtD_Fyw53O7FceJ54xVOxjnfeQ_Qtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALUcmUnh_tos4BnXmrsudtD_Fyw53O7FceJ54xVOxjnfeQ_Qtw@mail.gmail.com>
X-ClientProxiedBy: PR3P193CA0054.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d8c612-ccd7-4460-9d6f-08d8bb9a850b
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-Microsoft-Antispam-PRVS: <DS7PR03MB552556CDAB2CB77BF10E855D8FA40@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TcjzCyISf/L9XquAKqAfAmSvJkcRUg3v8kfGbMwYD8QLMB3+/ucsaBJdLJ2PvkUqkUZHBP9Ujano5+psjQrcC6kXQR862s3uwxClth2xFq6ZA/oOTBjgGi7LZ4HKWyZ2tDEtqW4s5xs6AH4Huq6yb5XPTEntASHBVqaKWbW+ossXMHv+tCb9tOBpsuw53l9L4L685jYIQunR9OLxF4fWQollB6gjHynSpHvcv6Wv6OISXu2cHFE5gdShRsknyrKXuQFHSjNR01wFYo/hvfuPQxqdgXz4J7AwnQ5OmahnIUms+wYIQ3YP0maniWruyqqflZRA8HXt64dZE39Z9D/w+Fx13YlVPrt5+9pLtRgmVrUHIyFu9aPVUMjM7R9XcPRfkdXx+cTosah+1ZocVEFDlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(83380400001)(956004)(8676002)(85182001)(4326008)(8936002)(6916009)(6666004)(316002)(6496006)(4744005)(86362001)(66476007)(33716001)(478600001)(5660300002)(66556008)(66946007)(1076003)(186003)(16526019)(9686003)(26005)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXdCNENUZmRJbHpOYTRrc0srTU1HNXpDYTlFdzBMUC9VUnlLaGdrMFB2SDNh?=
 =?utf-8?B?ODlWN21IQTREV3lCajRpVWhtbmtTMEtmaTdWVlFIZkhwM2ZpNzFFNlBWR0Jz?=
 =?utf-8?B?ZGhveGgyaElydkJWM1JUVm5ra1g3S3BWZ04xZngrYUFpZnIvcldCemVTZVJ5?=
 =?utf-8?B?YURzVXVRMURRanRhYkM2MUY2OVh4MzlueS9ZVHVHcFlFdXBEZzQwT0w4NjNU?=
 =?utf-8?B?aXluQndkbEZHTXZDTUJkZnJsN0E0NDBFa3g4Z05PUjIwWlovekRCRVU3a1N0?=
 =?utf-8?B?OFFuTGlmS2hLbVdMUDNrWDh6dS9XYUUwYjJwUER1R2p3QkpiSW5acER1ZHdi?=
 =?utf-8?B?MTY5Z0RXekZJTEphSk41WWdrRzhxS1g0MWNUb3VGUUkyTlRFUlVPVHkzRFFx?=
 =?utf-8?B?UFMwcDRhVWgvZHZaVkd5MUxHMUtWRUhDUkFDVE5lUFJSZFNYYlRzL3hHVStR?=
 =?utf-8?B?aiswSWdVOU1iRy83R3BOalJqTW5NN0JJa1d2R0VsVWU1c0JkRjA2alRSclZC?=
 =?utf-8?B?TnJjTEpjcXZXYkRQRWp4UHJ2WSthMWRXMFh4TEZuRFUvOFo0TFRZMUlPTWQ0?=
 =?utf-8?B?YldaL1NrV2lZUG8wQzhhanRCcDFENkxjU1VKV2ptT0hxM0wzWEU5cjNXUlFO?=
 =?utf-8?B?b0g1TWlSL0NpenVYbWQ2U3kyWVhMSXNDZTZTdzh6NkVCK0hhZXVXS2N3ZGdx?=
 =?utf-8?B?bUw2bkZNbFVEeFN4cklqRHgxVTd3ZkJsOVdFTktLVThJblMwT01JNTBjOFlT?=
 =?utf-8?B?UmVFWnMwU0Fwc21MNGl5MGtxTk5UeE5yOUtQQzVhTUo0bkN6Y1RSdGZmTnoz?=
 =?utf-8?B?eWhmaWMxdTVXRDJYTEw2eUdWenpITDVWeWRHMGpMekJrZjlJSGFBWEh0NXox?=
 =?utf-8?B?d0ltOGE4WHNUcGhTU1hRQ1c4aG80MXF4ZEFleEFjcVoxM0QwUW51K285U1N4?=
 =?utf-8?B?QmRyTmtsTjgwZDJCWWhZSnM0U21maHVlaG1zZzRkd1BMcFRBNEg2U0ZOYVVs?=
 =?utf-8?B?ZHZSWnJ4QmxXWm1wWjVmQ1FBN1dhR1JwOU14RlpwTERkajJzMWtKRjJmbjVO?=
 =?utf-8?B?NHk2NjN6VnJISmZnOW1VMXlxMjJqUGxTM2xVZVpsTmpscDcxQ3EyaUV3eVBU?=
 =?utf-8?B?WW9Xc1ZJaFBmeDZaODNUcmNrbmpHTkRqOUtEVG11VExWT0dKbzZtZklVaFFs?=
 =?utf-8?B?ZVdYU0ZhakN3T1BqYXNSRml3SjBEb3VrRTgyY3hZbllscmplVzlwemplMUxt?=
 =?utf-8?B?QjVnZWRJemh5dDVuQXd6UlJPK2J4YTFtMm5jZEcvOFMyUTQ2aitxWW8yWXNl?=
 =?utf-8?Q?7diK60GcTVlFJas3FCNwoPV1q/n8waFff2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d8c612-ccd7-4460-9d6f-08d8bb9a850b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 10:19:20.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K7edxb76/dX2lDISWt2vOPtxsMSYrP7hANwafXZnygB3x9SUm30CtAx9C6c8ITQtP2MBDMUy7dOCaaS+NLeog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Wed, Jan 13, 2021 at 11:43:50AM +0100, Arthur Borsboom wrote:
> When performing the following command in a Xen VM the call trace below is
> generated.
> 
>     sudo fstrim -v /
> 
> Xen VM host: Xen 4.14.0
> Xen Dom0: Linux 4.19.14
> Xen DomX: Linux 5.10.6
> 
> The code in the kernel triggering this trace is the following.
> 
>         /* In case the discard granularity isn't set by buggy device driver
> */
>         if (WARN_ON_ONCE(!q->limits.discard_granularity)) {
>                 char dev_name[BDEVNAME_SIZE];
> 
>                 bdevname(bdev, dev_name);
>                 pr_err_ratelimited("%s: Error: discard_granularity is
> 0.\n", dev_name);
>                 return -EOPNOTSUPP;
>         }

So it seems like the underlying storage in dom0 doesn't support
discard, and hence the feature don't get setup on the frontend?

Can you print the output of `xenstore-ls -fp` executed from dom0 when
the guest is running? That way I could see which features the backend
is exposing.

Thanks, Roger.

