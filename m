Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467FD30A337
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 09:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79603.144925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6UTI-0007VF-Eh; Mon, 01 Feb 2021 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79603.144925; Mon, 01 Feb 2021 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6UTI-0007Uq-Bd; Mon, 01 Feb 2021 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 79603;
 Mon, 01 Feb 2021 08:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6UTH-0007Ul-KO
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 08:22:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e734a841-f2c7-4f8c-ad5c-b90579097e3e;
 Mon, 01 Feb 2021 08:22:06 +0000 (UTC)
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
X-Inumbo-ID: e734a841-f2c7-4f8c-ad5c-b90579097e3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612167726;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8maoQfuMHAQoyFK0g/YC9hiRf2n9XZ8hLxdhV0HI+1w=;
  b=KUDUUys5t/YsQ0l09dm5MiLwtvHWMOkNM3GacRphchwMzfjlSPKrKqu9
   0qFUnyDwpWV9mhhpMlDLOcNBrMnuwjuPy5DeCETvcu2iekPzv875W/Bvd
   KTXykD8phwq1HoUmevqXKyKeRrpKtRG6aX0bGhKGMW/Rqx9xr1JJslZA0
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 85RMr02dFZ0aJKRfviJzq3Tn9ZttArdUDlyl/baJgWAHJ6E+cJaMav1gZ3LZl1LWo+AWyjKD4s
 xHj9lgw4Tl/1C5Cr2UdgdBqi/EhbNkxsv1G4nNfj6coXiodrYQAmMRsgQPgOxDtRBTlikZEX4C
 K4afBcxFg3l04uAmmiWa7jYmJR6vlJLatXdqinTEiUdzu+XKigCoe5kIeZxVVKZIYN1tOeUQo4
 84FeOa+m7dVLPBDlZ94oNxDknEJXgI8+9BKiyhxDsHOoB6RQRYzDde/Zm/BT3swnV70sv/0nxn
 Jvg=
X-SBRS: 5.2
X-MesageID: 36295820
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,391,1602561600"; 
   d="scan'208";a="36295820"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGyYJyJ8kM68BglVySDey41oIvYFsJ2SPUErF7VwJ1LbK0teN5fxJDkUBuut+iyaCwqQyAsNYwH0kRZJiMfKEtugIkRj/hgG+HixynxRHLwIXI9UzHEYM9u5kt4vGy2BjXldupHHqMPN/CoOo2I9WaqBqmBQUT1lB57J8ujvvZ6W/OYACXTa4rv+AGTfIIc45fobDx/DuiI4cYLpTQJV0y6BJlmJsHl9aS2zmCY1tU6KpYX40H3gndVFBLekReeSLTu6LPByOBtRY+4A44ogakzNytLt67rY9bYdu346kL+TGuABp52dAV3wX7hz/nbD7mnchIW97dCdX9G/5AT5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s8Sdi+pp7MYe1YNRzd2LwR5pm5wnR6nkgEQQIRj1lI=;
 b=K5aEdlwi2zn1zHqzsKr1t/M945cnAGRomaue51aKFkY1qhgc2enz02/2iBQzCN4LApsyp/2A4X2uqmLU9JcoDkUG00kpLONP+ds5BeBlcVyA6Xyd4R7p1wdgnIfKTf0TNcsl9biSL0B9uj3AYeWldr1y4JtfeJ6i8JnRW58orbE/+n2RYs1EXfsZxTrF2SvUy0ZxjqQqFXxj9Xhk09jQG9Nmry0t3N+L279/dnghh2cIu6TQp0aSK8veSmwhQwPpDh8Ujk5NxBFbMoJNxQXcopHWkhlI1jfB0vJAtsILrL6v9PrqMqFSpYHcTjodv7qLeT6gHL8hevBBvwKp9TfS/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s8Sdi+pp7MYe1YNRzd2LwR5pm5wnR6nkgEQQIRj1lI=;
 b=ud6b9ryNMTlgTuaCjucIHWdHIF9D0IZaca+FxFtXiPPwEUzG++WtSKpyKlbBS6WgiKp1G6cM35cEF/UnBVmhCllglCltgkNBr8QldgGBgB3lqG2fDXbQ+wmIT4SYlCQSYV9nhZAHcWfQO3oAC7utFYvcyFlWAHYvfMnqOkSqS+g=
Date: Mon, 1 Feb 2021 09:21:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] Document qemu-ifup on NetBSD
Message-ID: <YBe6JpR6jOLvYDz6@Air-de-Roger>
References: <20210130230300.11664-1-bouyer@netbsd.org>
 <20210130230300.11664-2-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210130230300.11664-2-bouyer@netbsd.org>
X-ClientProxiedBy: PR0P264CA0201.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c787ab0c-71bf-455c-4ec6-08d8c68a7421
X-MS-TrafficTypeDiagnostic: DM6PR03MB5083:
X-Microsoft-Antispam-PRVS: <DM6PR03MB508384617AA0862F145AF06F8FB69@DM6PR03MB5083.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XxAjIENoGaXXEmsNqp65oGLMI1v9480N//bD6QvzmsUCZP+r1U7PlFeuZFwAh3dwPNo16QCiIG55CwbklS5eYO8t4Cu6x3JgwKV6GalSmF/qlym7gISoJCMFKlCxva/pLYFln3TwarKL1h1KlwJzNNqB5+BmSh7m6hlJ648i8CWp1szpaNvc1dAAMCI+vEcrQD8kXNYZY2MqyNmgfuv/R+M3zxgRTKti7g6vcMlV20ZjiKeJliAuCjpe9qGSRG3uT6BHkUtVdxDtAy23J1Ova4LOePLmdHd14HHtPXdl2UO3HkEt7ME0w+jyb20nERLvEykqjp7QT2ccxUmlCMMEwaXnZxDbXJcJysfJFbWiMZ76upL7IyDpZN5WthtvnIlWwXWbP+kGrStFTW9+kNL9SrfMD/S/Pr+0VqGK5UdZcuTmY9irUEAtSjzJ7vssEnFTYlXS+46ODXzhCRgzNWeypw9UWA/bltIXiCNe3HEfHywlZ8rWavhPJxVCJRpJwRBOw6L1Hb+d9HsXd4sK4kWaXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(39850400004)(346002)(376002)(366004)(86362001)(4326008)(186003)(16526019)(85182001)(6496006)(956004)(33716001)(8936002)(66946007)(54906003)(316002)(66476007)(66556008)(6666004)(5660300002)(6916009)(8676002)(9686003)(478600001)(26005)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDN2cUI5d0JkYys0WUhKUXprcVR6SmZMR2lUeEpqTGFqSm8xT3MwLzFQeGsx?=
 =?utf-8?B?dnEvSTZ2OGdGSTdHZnRSZExsL1pNV29NV1lQY05aWWtEOUtvc0d1cFRxNVk0?=
 =?utf-8?B?V1FMN0xXVU5icXVGYUE4VTc1NFNGcGh1RElVcW1MMzhjOFpSUkxFUWFJdmZE?=
 =?utf-8?B?eHlGWWRSKzNrTkVrS0FtdkhkVnRqU013cmo0d0hIallGSjU4VUFXeFRrWUE1?=
 =?utf-8?B?TytHNk4zRmlMOHBhZW1LWVU2MHI2ZmdwSGUveFZ6VEo2bDBGRDBnaS9ldExq?=
 =?utf-8?B?blljcmVJZGc5bGNINHVpdW5GZVVSdFBuVXhJbWg0TllpOU1YSzY3T3Bucmhp?=
 =?utf-8?B?V2JwWWcrT3RXcUVvWm1OUjZZTURqZ2RUOVdBZTBtS0hYUFF6TGh4L2U1Sm5J?=
 =?utf-8?B?R1ZJVmcrU0dIN1c5cldoSnFHMnBFVU1wcHZDY0lhOUxRN1JMTFQ2TzRkczRi?=
 =?utf-8?B?c0pJTXlNcm9NdVc2VE5na1NWd05YSjZYMFdNTkZmU1BPRXlJeFhRWGFlQlJF?=
 =?utf-8?B?WUpXdnhxam9IdXF3alE1R3ZCZkhWWWJsQUxmTWNvelpSWmN3Z29FTitGNFNt?=
 =?utf-8?B?QmY0NjJZU2FhbUMzWGtwN0pScFBscFNaajgxS0lNNlp3QUxBbWNXRnR6dGZz?=
 =?utf-8?B?YlAvWGsxM3hmMUJGbVBVUmN0Nlora2EwazY4bnc3TTc1RjgzeXo1TDRlTGI1?=
 =?utf-8?B?U096eEowWlYwanNzYUNMVzNVNE1aVkJrMnFIbWlKeVVTZkhRaTVkQzZLNjhs?=
 =?utf-8?B?RVF5UzU4VHlzODlFaDNpMVdjVmpLOTN6R25nTmQ1NG5HYnh2dzFEZ2xEQktv?=
 =?utf-8?B?RkM2NmJjNGM5TjNYMjJseEc0Q1pOVnh0dmlIQUNZdlg5L25zS1R4RGQ4Rlh1?=
 =?utf-8?B?VzNMQks2N3pFQ2NvWjRNNktERDBZNG0ySEtDWFdSb2xPbnZTTitsV2dzaHRx?=
 =?utf-8?B?Ny8xekZBQnJJQURvRnN3TnlaUGptNCtRWFNjS0lGc1AzMlZQRHBCMVlqd0E5?=
 =?utf-8?B?WGdOK1VjMlg0WFN6Y0txZ0N0SFV1ZndGWUkveWNIYXoycE52WGtRTmNhbXRi?=
 =?utf-8?B?dWh4eUVicStvR1Iyc3dYb0d2UkNmU0RwaEY0d0FEMm16UE1DSFhTZTZLWFpE?=
 =?utf-8?B?ZTVRWWNaQVErMTRwdnBOeU53cFY3MjRrSlk5RGFXM1UvU0hlb1BtbWZBSEhp?=
 =?utf-8?B?YWFFR2lBTmU0SFdjREdYUElpaGFoZ1lETkVmK2hDZkdIVDN6Q0s0bmlDV2tu?=
 =?utf-8?B?TWJDK2p5Szh6Y21JdkJvQlZ6a3BKSURyeXE5WEI0T3dOdWxNNXdWZ0oyWnMr?=
 =?utf-8?B?ckdNSmVVM3FZU0hvdG1JWXg2RCswN2gyRE1GZmlBT0tiSEZFaTNZUU40U2JV?=
 =?utf-8?B?QlM3ZXR1RjN1b2xKaGJqeGxNZk1tbzJlUGJXbFh4Z0Mwa3p5YkNCSkMyWFVj?=
 =?utf-8?B?RGVZVUU5VElaM0JWRHo4eWpIZzRTK2NRck4rSHdBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c787ab0c-71bf-455c-4ec6-08d8c68a7421
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 08:22:03.1331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PXHQk1HNU8KLQa9RK+8R4MpVKtSNquTqr5skQ7D/ZK6iZ0pJCn5GuMmEacDhTfLHfBu+J5h3KN9wEmKO7mSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5083
X-OriginatorOrg: citrix.com

On Sun, Jan 31, 2021 at 12:03:00AM +0100, Manuel Bouyer wrote:
> Document that on NetBSD, the tap interface will be configured by the
> qemu-ifup script. Document the arguments, and XEN_DOMAIN_ID environnement
> variable.

You are missing a Signed-off-by tag here ;).

> ---
>  docs/man/xl-network-configuration.5.pod | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod
> index af058d4d3c..f6eb6c31fc 100644
> --- a/docs/man/xl-network-configuration.5.pod
> +++ b/docs/man/xl-network-configuration.5.pod
> @@ -172,6 +172,10 @@ add it to the relevant bridge). Defaults to
>  C<XEN_SCRIPT_DIR/vif-bridge> but can be set to any script. Some example
>  scripts are installed in C<XEN_SCRIPT_DIR>.
>  
> +On NetBSD, HVM guests will always use
> +C<XEN_SCRIPT_DIR/qemu-ifup> to configure the tap interface. The first argument
> +is the tap interface, the second is the bridge name. the environnement variable
> +C<XEN_DOMAIN_ID> contains the domU's ID.

LGTM, but I would make it even less technical and more user focused:

Note on NetBSD HVM guests will ignore the script option for tap
(emulated) interfaces and always use C<XEN_SCRIPT_DIR/qemu-ifup> to
configure the interface in bridged mode.

Thanks, Roger.

