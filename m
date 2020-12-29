Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709202E7172
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59948.105109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuG9Q-0004SJ-Qd; Tue, 29 Dec 2020 14:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59948.105109; Tue, 29 Dec 2020 14:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuG9Q-0004Ru-NG; Tue, 29 Dec 2020 14:39:04 +0000
Received: by outflank-mailman (input) for mailman id 59948;
 Tue, 29 Dec 2020 14:39:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuG9P-0004Ro-60
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:39:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97e85082-6abf-4025-960c-c4ae3571b933;
 Tue, 29 Dec 2020 14:39:01 +0000 (UTC)
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
X-Inumbo-ID: 97e85082-6abf-4025-960c-c4ae3571b933
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609252740;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Jpkvvpr4UbjBSUX1inlCeEdCLXhgBN/uebvLKKmOLTE=;
  b=QC9r8oYyI3zIYITKtU6Yukgao7w4RiBQuxuFVIe6Z25xvcVA35Kp3jFd
   ryqlBaAriiB8x9upeNUKZTBgpraYE36u+I+63yTf9U3IR/xsk87t/Hrem
   qquE434qerY6vrl02uV1puMsRNrI157xYJcL04egeeFTWuH/ms2USJFFq
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VKXMCre+LlgVv0A37TuQSpkqWPSNxPFPrn3oVYNaIM6YshKhdvUiWcAnouao2/1tX2gjcz8OT/
 CyPno8ubjrRzat7c4VWoYaxu+jkrSiPIYWkPsh+UJYf7fyiuGMaKXQ/FI3/YdALNyWOugdHM0Y
 lKdikBDBqiu2oYEAUK/8YsI/70y+OWeTAduLN/2WDzRs3RQFpFZnhp7FvWDDTTQWcOwD2QiRzX
 GZ4WUYuCUF3LDXUk/ZB6WqgUpmwp3H/4n6xSyRowQBKVZoIQah3zCrYotnY+pUGcjEXi0+5AGL
 Mdw=
X-SBRS: 5.2
X-MesageID: 34128732
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34128732"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJiWc/ipKCpVzoeNK2NYBOLWUAOc6GkLlFDzyxuC9Qep7HcWuVFwI/0YV/LYTThNH8TEZEzUoKxUnjzoiRxTYIWqMxKwhA/7Itage1mU+YIxbKq+J3uIbakAGpst87IRwDYtqRo7nYEZKsLTAXuwj3SyxCrxDv7KTIf+hFGCqzOJHNkNM4FoR6OyTHnKLkMdjyiAdKlKqHgGvghSx7i9UZpWYtrMnxAJvWdWKYBwxI67e0/sTGCEZDik3u4SQYgDuaw2syIV9rMPo/ozeOcBJm0EMjBjFWhCaBxXF/znAAz4jCh/74TOgIUwR+N/dGtDbntFXgVSfraE6XSsM0yNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brc3dBMjzeYf2pITdRlp4aYD72Io64fv2Yz3H0YC2dQ=;
 b=lj3y+w+EzzjncSvPrAGNC0W99aHx1uATWgLDYhcH9g40pF8/2nhShiSHziWJj490/o/tmfoDQJFQGu0Ouf3BKzANx0ssa98/oDMTQOMzrfIsrib3bFj6YwCtwkKNc6cgMcwv641ReXxiLkkMNTE+FkSWEA6HXzWdIyi4fmIH/KkQDu2XlgXI5IsOW4UAB3wdWKcVgyp7MtHTsNgrrq633ZNWQmKAKQzoaW6CyvfnzlLDCnDp6lOMO+JUD/4qqlrA6qct6ccpkEIEkr5q6Xb7XD1xTJBc8Sm1nPUnjabQRQvItDf+FGl0JzD3frZssn7Gk8NxtOFUErgO5+kuRkALVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brc3dBMjzeYf2pITdRlp4aYD72Io64fv2Yz3H0YC2dQ=;
 b=NBcL/9BVRsnss80dppMXcJPkRtsiQVlfosCm+WpndBqCbG3UmRuqCk5ZJv5JTiXNiWV6qwJ86mkXVjxTuwiLSRflpVLJlJEJTwz9UVLSEn6so5EHnYyMq8wGvyoIZIQHFzYRplc83NdNKXAM2nSeBPO/4SZATtODPPcovWc9DU4=
Date: Tue, 29 Dec 2020 15:38:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 19/24] errno may not be a gobal R/W variable, use a local
 variable instead (fix build on NetBSD)
Message-ID: <20201229143853.gikc7xqeqw6jjlvy@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-20-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-20-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1638882e-cb55-4b35-5a77-08d8ac077979
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3483F491B97736183A6CAD4D8FD80@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bLgVgVnuhXGDv0zBUD9MfGtoTK6U9GTUmJwr8QDm4QphAs4kv02aPoxYrnVFthXhLLr+sub86QyrcaIikfNkxrLVPegyhSkQT4ody4gTJEayE9lVLCb31kBVKA/NeUg1Zb7pE1DJp7TIQbtPCVgyi3bz8+eshv1DBKJfe0YdMJ5luIKxQpZTe39BiYFni5AB+sxlr/6W1SmOq3BwjIqcABNMGkggo7SiJkS/GxUy7c57HSnPkulS8LGnpnTtQCQBmM0TEry3hhbeMz/3+U0O+0jgndKvIe7eKuJRvU6y5B/5A9nMmo7+Zzkj/h++TXIJQL1GaJ5b9+2mamsF78gkqOqGsxaW7oMPI4pDJ3c9xTBxWEwb192L9gnLa+jYh3iyF6p/JAREOdi57/7/WI6fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(6666004)(86362001)(83380400001)(2906002)(956004)(8676002)(6486002)(85182001)(6496006)(5660300002)(9686003)(33716001)(316002)(1076003)(478600001)(6916009)(8936002)(186003)(66946007)(4326008)(26005)(16526019)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eXgxVVVVU29KekQvYldMbC9DcmE1NUhmOVRxRmFDVDNBOXozOE5CYWV1Y0dU?=
 =?utf-8?B?OXJFY0htdGxEZ044bWZrTXhxalViU0tpa3V1bkEvL2pSaEVYZ0NxUkdHWFBj?=
 =?utf-8?B?NUZEb01qQmFvL0YyRzlWN0FPZ01EVy9BUTVKY2tLY3h0UlhHUytvK3daaUM0?=
 =?utf-8?B?S2NRZkdQY29Rc3o2S3pvZDFzeEt1NHRub1pOMVVPajJIVEFmdFczMXc4d0l0?=
 =?utf-8?B?N0c5WHlTY1JyYlFUZTBURy9xNUtHYy9ocC9haEFMbDBRMTFlTloyaGpGK2Qy?=
 =?utf-8?B?ckwwTTlEUkRKQWMwaWdNSnlybUVMRHM1LzBMVWxHTDQwSytSb3lOdnNLTTlH?=
 =?utf-8?B?TkxWeDRkdkxOd0c3bVpkUUxvcnJYVVJiYnIyQWxDMjlqcjEwNmhUeGFJaWxN?=
 =?utf-8?B?dWcvbWkra3Y2SnRIejRhRmRZL3lsWndBT0prbXZPdk5XVjdlWmZSZkJSOVN6?=
 =?utf-8?B?V1MvOENpcHR5Y2kvMW9kUzdhbFdqSlQxeG44eXA5OVc5TVl4RmJjOUk0VHJj?=
 =?utf-8?B?UnVXd2tEc3BVL3F4dVM4RCtpSS94SVRreWxiYmd6T0ZZQk95VmVHY3d3TjNm?=
 =?utf-8?B?NWhyUE4yL0p6bE93TUVyQW01MFJnU3NsaE9PUWpQVHY4UmE0RWtUZGlnSXFP?=
 =?utf-8?B?bnNjZXZ4cU5Cc2tIVzdpK2Q5NDRuWTVVSWsvUEJGWkV4VnZlRlNNaVF3VXFG?=
 =?utf-8?B?cGtKYVR3TGdnaExReXdESnp4c2tzREVyTTBnMkx2c1FOYzFKYWtYQnFGRGRS?=
 =?utf-8?B?VVJ5QTlSNXBZMjFtU2xzWnpUQk9IL1EySThWUUFvU1E5UFZQVGlrOVIwczF1?=
 =?utf-8?B?Ymk0aXdXZ2ZyUWlDeWFWM2JpL2dmeWl2bHRjTmpFMEwvREFSTVg1MzZLOVRn?=
 =?utf-8?B?Mk5zcEhOUExYbUlMUS9zN2tHWDBFVU0rbWswTkk3SmhxdEJaRFRXWkZHQmlt?=
 =?utf-8?B?ME1HK1VtUHoyRTdKSDFMYngxMUhRTXhTM05GUzFYZUpUaGQrVi9RTTNKRkRr?=
 =?utf-8?B?MWp6L3VFRWI1clRhbS9LOVpkSXBING9ZQnExVW9oVFpsMTJGcE9heUt6N1ZI?=
 =?utf-8?B?MzhYOXNxZityNnFIeGYzRXlHc04vZVd3NmVaMGdUcHJ4R05VUVdoeEY0aC9W?=
 =?utf-8?B?NGJoVFlpdVV6dTlaWWVuL3psYW96cjdib3RXekVwNGFVVEJnODZ4MXpTUHlU?=
 =?utf-8?B?WkFubyt4bTVBZlU3NXJrWit3SVJWdmd0TXVZQmVVZG9RSE42NlllbFl1cFNJ?=
 =?utf-8?B?QjhlYW5MVnprc0JKKzBCeXFVamhtcU1EcW14dWpTcXVHeVpDaitaQ2FkbkVQ?=
 =?utf-8?Q?BlNFNyPmgi6MD5Z+zuafMQ/sRG4BCtRJ74?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:38:57.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 1638882e-cb55-4b35-5a77-08d8ac077979
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgGZ5Y/twJJjXaMrjKoOGo/3yXQWSequBbwBisymn5jc+XkOjd1mgnndOTvg69DJezBom3Tssr1KBwRYz6FyAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:18PM +0100, Manuel Bouyer wrote:
> ---
>  tools/xenpaging/xenpaging.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
> index 33098046c2..39c8c83b4b 100644
> --- a/tools/xenpaging/xenpaging.c
> +++ b/tools/xenpaging/xenpaging.c
> @@ -180,10 +180,11 @@ static int xenpaging_get_tot_pages(struct xenpaging *paging)
>  static void *init_page(void)
>  {
>      void *buffer;
> +    int rc;
>  
>      /* Allocated page memory */
> -    errno = posix_memalign(&buffer, XC_PAGE_SIZE, XC_PAGE_SIZE);
> -    if ( errno != 0 )
> +    rc = posix_memalign(&buffer, XC_PAGE_SIZE, XC_PAGE_SIZE);
> +    if ( rc != 0 )

I think the point of setting errno here is because posix_memalign
doesn't set it and instead returns an error code. The caller of
init_page uses PERROR in order to print the error which his expected to
be in errno.

I don't think this is the only place in Xen code that errno is set, why
are the others fine but not this instance?

Thanks, Roger.

