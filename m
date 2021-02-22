Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A635E321B4A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 16:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88164.165658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lED2d-00080V-2R; Mon, 22 Feb 2021 15:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88164.165658; Mon, 22 Feb 2021 15:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lED2c-000806-V5; Mon, 22 Feb 2021 15:22:30 +0000
Received: by outflank-mailman (input) for mailman id 88164;
 Mon, 22 Feb 2021 15:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lED2b-000801-S7
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 15:22:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 802bd940-40de-47d5-b4f3-f8dfe30ea5e1;
 Mon, 22 Feb 2021 15:22:28 +0000 (UTC)
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
X-Inumbo-ID: 802bd940-40de-47d5-b4f3-f8dfe30ea5e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614007348;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tiJbYi+Z9kjuAue+Z3yJp6ppWlwGZlFE3MLCTrWV82M=;
  b=TP/CREkW4N0RWCtRgxmnDKWo1oBDTX2dcSJpmdHOOpSS3TM4G7FYgHMP
   JTiVBkspZOsoix2w0asrVc8xF9p5+YZm5b8U484scrm6kQ+tjin5/j9Ss
   Wmfx6UX2Mf5/Wqmcw6kDync680nlMzPFhZ5p8rjx8bqsaNGhReYErAs8R
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: t6YlYs5JoAZcO1ro8uMyUdM0EMee4fGViNRX/+U5BHuBfFXGUFxXClIf7hJ/9uj8etPE6aexhY
 99A/KKS8ESkAzRJYXM+D0Xl+wUsriXaqbfgbTwEbNSA2I3vsk+krPETioLWj+VsfavNEZ/WWgn
 VDORDpuQIWkDH9x7IqLfjDNUBhhmicj/yGlZubq7WCOL6oyvQ2gwh5i+Df1JPjIxjjmjjDdkum
 UGUvZVNg5Ksa0KWSe8FmOFu5ySeIuVVK6Q6U9O/cPI5URHAld2DdzhebRDMAsP68xPoTlXN7/M
 5TM=
X-SBRS: 5.2
X-MesageID: 39125711
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="39125711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0bGO1cUl3FvqeVyp44Uyj6UEJb5IrAl1GToCUMRwiyqYZQrnm2yETttehI+xafeEhhfW6QUfxf7pJ0HgqegwdVU3vAhYpOYOeIuMYiFPgCoH3NkjCAEY5imTxrVT211C8YC53fIjZrKSWDRMRhrwoVqATO398wXByaqSHYybKGndLQobe+29httyMQZ9Dm9GMSkHj+AbtBvw1OrOcPbJO+K04wZvMFtl/jlfKFgKrPpQMG+jEcWv4A+J3jVvBNE9Keo3JfM87ysOv6dVhAyMgzEwmmsYswMf+r7wCWVp4knNGqR+ix7ihgD7eCoS7VDmajquINg3EH9o9l+WVlE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ2mo0putVkxA0MxiPFuXaEymxeMLUUbkm7kAvDUQCI=;
 b=LrxqfNxQhiAX3DwbBZ/vSMhbjKqiR1VYix+MU3hYhksVTOZVVVjP31TIArWprUd2IhjG5HY1FROaPE21MmnnJFvjeuIbtcdQK7bmLC1Hcx+NTX0hN6DR74J8UPs/dAucJxgE/ychvqkEqU7Pz3hC8PYUP0pR/KAwxejikbLPyeg80wngqyLAAL2mnvnYY5yJHj+0Id4SWqG4t1jaQ+K0jxauMlE76m+1QYuWye6OMk855bvrtmLuJNobr/nNwq6vPll/WhxuPDqJ4R/KnrECzS+oobf7uITFWm6S31BGyF2VkRyhHnSGsawHaof1JAsAtTITXZh4HcbE9anJlg1o6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ2mo0putVkxA0MxiPFuXaEymxeMLUUbkm7kAvDUQCI=;
 b=U636ZyIh6TFyHqUztwOnb/PAnYlHmaNw0iHgpy8Y/mVk1Z7VkaXEUKVV5rTt7J71+gehUDEedy5iMZR0e9GsG0J7TUTFN0ZgZpkyKp8ytN2B68S6jB/vsBiHF4ouzVGvy6EzFy6PiXOMQgbg0eYI8ScWGP6rcFx4SekWjXqN0iQ=
Date: Mon, 22 Feb 2021 16:22:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 4/8] x86: rename {get,put}_user() to {get,put}_guest()
Message-ID: <YDPMJp731Zt+Vx0J@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <369ae5ec-ee2a-78d4-438f-b18d04c81c4c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <369ae5ec-ee2a-78d4-438f-b18d04c81c4c@suse.com>
X-ClientProxiedBy: MRXP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b90a34b-3f34-49f9-c2e8-08d8d745a566
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB421835BA00B26FBACC1034B18F819@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeyccdzvJ0aQcj+CpnO0/k4xfliHsqxt32aDv7YbVDFhlZmejdqhZQ68ySAF6Xqs8WlkG7LwyA63fdVUiOthitTPwzGEXNYe744COli7KgWMkJoegQh1Dn1sAxs0hliP3OMphcrcddVjSZOHJACyPT6NWu5lQeVni53ATMZ1gnuTbksyI3ECOJ+y1gS+m6x2U7dN+DyugipbIhUOoH2ESrQeJZ6rqHc81A1wj4SBY2oxX0HGbLbw0lb8EWn/aHaMzwdd9kE/pDiZ9EeTNi6YXlji1WW4dx2izL9H6eNb68kYX6y0qSBEfDp9N8BUW8lboikIkZN7vpJlwmzHzvvkcy+LbewVeshaXCL9i/qV/UUi/GXP0mMhCoHE9oelcVBWhQyExPYLdDJdMypzpZEYGXq35SAkxHjjk1lEk6zPcn162s6PLfseS1JknN7XTiey+mh/HcOPy1PXLG4N4WJMv1zgqa8gCaUroouJTebORGX2z9rvq70nN0BPgg/V9DbVzN1s7ggJOF6Lv+JyPUl4il/AA8KUhBCFmvb4XW2RGXUsPtTPEK+U5W4HTHcpFO7/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(366004)(396003)(346002)(136003)(186003)(2906002)(86362001)(26005)(85182001)(5660300002)(6496006)(478600001)(66556008)(66946007)(4326008)(8936002)(8676002)(54906003)(316002)(9686003)(6666004)(956004)(33716001)(16526019)(6486002)(6916009)(66476007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TGR5TnN4ZTUxSGt5VlEvOEp1MWMvellFNG9aVWEzbnAxNVhMcllJV255WVVU?=
 =?utf-8?B?MTZZSjdWTEFIVnhCaHJOVG50RUpnOWRzNjhkMUNkUTNWUUduVmVJTUZlYXVV?=
 =?utf-8?B?QjRQakh1K3pXZkhQeEx5M0FBQlk2eDE3L2lpdGJnYm81RTBWRlhlWm1wVTJC?=
 =?utf-8?B?Sy9JWGlycDBSUFdacUIzS2JDaDZkZ2pXcDYxdVkydS8rZk8zTG4wbEp4SGk3?=
 =?utf-8?B?VlFSSXJ4WG02NDZYcFUrVUk0bkk1alBDR2dXRG82MFh0elhtMTcvY3pmOGhH?=
 =?utf-8?B?VVpaR0hOVlJyTGxNWk1SWUdIYnkrcnNMWGdINklTd1dlR1ZyNkFVV1Q4UHpy?=
 =?utf-8?B?bHArR1dFN2ZEVENyVk5GZDNVMnlGZjRYT1djbWxwSGhtNzZCdFRDUjVhSnNB?=
 =?utf-8?B?d3Y1UlIzRTRNR2Nkc2YxMlZMSVI3ME8ySUw0Nm91S3hFMzYzVWdwcXgvbWJ5?=
 =?utf-8?B?bHhsbVRZbjBjZGFodEoyalJOSE9DUmVobDkrNWUrdE5va0lRWE1jOFhDVXNN?=
 =?utf-8?B?UXdtd2hHTSt5Zzg4ckhrRWdSdWFWSk5WbU8zNXNNQk9scFBpT3pnclZwZTZR?=
 =?utf-8?B?VllDL3JPZy9TOGY3UVNpZ1o1MTFwUlA1TUxMM0htaFhsV1B1OXBDY2laV2NJ?=
 =?utf-8?B?dG5PSHdrUFJpNjBIcFR3RGI2YmNyN3haZ1piUkhhcDBTL2RBcERuTk91T1ZO?=
 =?utf-8?B?ak9sU0dKS2FJdkhrZEZUcWNPblhKZVkvTndtWkNwL2lkVG5xT0lhRStkOWMx?=
 =?utf-8?B?aWdLR1NwUDVnQlRiMUZnWkVkMGJVRUw3MlArYTExWDhxMm5iQmxrM0djU203?=
 =?utf-8?B?aFhpaDVwV0hWTnlldDF4TG9iTmdUdHhiNUlBd2V5Z0xhb1orZ0dRYkFsbk5U?=
 =?utf-8?B?MFVGcktKaHYxMG0vbERkRkdvbVpkaVlSUVo0SFowRjJQaE5MUFgxc2JqMy9D?=
 =?utf-8?B?ZzM2cGlhWFlqY0FrVFZvVEk2MVZOdkU4K2VUd3FxWG84bTFyd1FrVXVpNC9t?=
 =?utf-8?B?czRtNGpLRTBPcEJoN2tuQnRNWGU1SXNGdWhCNXlOWjJ4aWlPeDgvRFlhbTZX?=
 =?utf-8?B?WHBuMUdWRHkxSTFZVktsVU1Od2tLM3BQZm9LTmt5UGwzQ1lZelJqdFM2WEFn?=
 =?utf-8?B?QkdIOStHNXNjYTNCeDF6aVhHQmtBTEh5SlJhc2lBSWNxakxhSHJ5M1o3Z203?=
 =?utf-8?B?alExQUtuZG9ZbGYwSzdkS3grcUlITnBXOTZQdWtNeGVKOXV0dm9hbStOWXhM?=
 =?utf-8?B?cFhRai8yQWpldjBkbnYxY1ZtcWd2UkxtZ054YVluZEdnZmhzRXdOOURXeXZh?=
 =?utf-8?B?V2o4Q3YrZm1pbXVDRzJKT09WSDd5QmhPOUxtQm1abVlRRE1UZ0xpYkRQTGFo?=
 =?utf-8?B?QWowNzU0dUNQYVJ5QkN5QzBQcUVVTC9US0ZyVWtJZkZpUWp5eitIcC9rU2t6?=
 =?utf-8?B?ZldGUlJNMUVLaGRsdGhCYzJXalBPWjUwUGhFTENVdE9WY0JzL3prNFV4TDlN?=
 =?utf-8?B?c3V1emZZT1IyY0NON2RHYU5GdzNwaFlyNzlQNjluMlFWd1cxSlh1cFJVTytN?=
 =?utf-8?B?aXpSYjFxR1FLbjBiandZMmRGSFlaaktjV2pIZmhMVFh5SzhQRC9uaDluTC9F?=
 =?utf-8?B?RkYzcEd2VFE5WENnb2J4ZUV6ZmVUSEZKaFFNS1pUQlVUeEtlR3F5QU5PbGlj?=
 =?utf-8?B?OVUxSnJqTVU4d3hnUXBLdUsxT2F5TkVOeVVHWTBISjFpR2lYL2lnVU9HTDFa?=
 =?utf-8?Q?BsX8oF1Pr8wIj0XX4V6LIG9QSzWJ5i1yWkWsW/u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b90a34b-3f34-49f9-c2e8-08d8d745a566
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 15:22:20.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpjaSLgOUj7oXCHWNFlQBMuResxw8ZKs/lVYqMKB52m0kzsRAmuImXd4v00tkXF1K2GESohyTU/1C1ERvHD07Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

On Wed, Feb 17, 2021 at 09:21:05AM +0100, Jan Beulich wrote:
> Bring them (back) in line with __{get,put}_guest().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1649,19 +1649,19 @@ static void load_segments(struct vcpu *n
>  
>              if ( !ring_1(regs) )
>              {
> -                ret  = put_user(regs->ss,       esp-1);
> -                ret |= put_user(regs->esp,      esp-2);
> +                ret  = put_guest(regs->ss,  esp - 1);
> +                ret |= put_guest(regs->esp, esp - 2);
>                  esp -= 2;
>              }
>  
>              if ( ret |
> -                 put_user(rflags,              esp-1) |
> -                 put_user(cs_and_mask,         esp-2) |
> -                 put_user(regs->eip,           esp-3) |
> -                 put_user(uregs->gs,           esp-4) |
> -                 put_user(uregs->fs,           esp-5) |
> -                 put_user(uregs->es,           esp-6) |
> -                 put_user(uregs->ds,           esp-7) )
> +                 put_guest(rflags,      esp - 1) |
> +                 put_guest(cs_and_mask, esp - 2) |
> +                 put_guest(regs->eip,   esp - 3) |
> +                 put_guest(uregs->gs,   esp - 4) |
> +                 put_guest(uregs->fs,   esp - 5) |
> +                 put_guest(uregs->es,   esp - 6) |
> +                 put_guest(uregs->ds,   esp - 7) )

I wonder whether we could use put_unsafe here, but I assume there's
some kind of speculation attack also against stores?

Thanks, Roger.

