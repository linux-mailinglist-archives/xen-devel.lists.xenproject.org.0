Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1201580B39
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375028.607294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDu3-0003lW-Ie; Tue, 26 Jul 2022 06:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375028.607294; Tue, 26 Jul 2022 06:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDu3-0003id-FU; Tue, 26 Jul 2022 06:18:47 +0000
Received: by outflank-mailman (input) for mailman id 375028;
 Tue, 26 Jul 2022 06:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGDu1-0003iQ-Uv
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:18:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd2b43eb-0caa-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 08:18:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5460.eurprd04.prod.outlook.com (2603:10a6:208:11c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 06:18:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 06:18:42 +0000
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
X-Inumbo-ID: cd2b43eb-0caa-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUbEgq+lrDm7rVqGNkVIwCJIMJnAcvd50zereRNB6k+bm9kMm4xMryedRN+EhpMg4zkVqYZ+/AzwJhPNkVKBd97JdQqEEJK/6QRlkLKe9YjnhW2owLqIRkxpMbxAqDG0ySYXjbzhn7dbPOTIUKEos08hO8U3d6YiZuvAC+Y/17zksyeomcNrLYsmRnL3q4/oCPHl64mQireqQHnCBHkwmzgPaHzXaot8t83BMho6gq5FhzS4KbXrK81XZ7kv4XXEofR5zhHMp7lGHatmFv+d31FjIDVioJqPqxCMNZncmcapaTG6pmwc7f5yylUxpnq9+AryOgaKDC1ujjvCfDfScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5RYujZgjFif6S3liLZhQ6lf2sa7uD/E+mHPZvCqGaw=;
 b=lto08I3xMkJ/LtBR/Y7B7VTs51JGuWH2PSzrR4DMaaRORyUp+BrA8XOZU2maOEC1d9vPqpoasbE32SNBO8gbljJdtu3r7ZbgTLiBcOBXN8Q+FMJM6B+2yvwLjPJ+EjeTiTleB/994pdegRaHm1UUuhtYNlM3FT+ZC1WGuMB10jf0TLPl0s1J8U7+0LB8PNVfiqHl71e4vW8wUhJX9NZgdjFVvcDyvu5YfJFyxb8XUhp7RvxoEHiw11GfygjVY7vPqNCuYqti1pVN5dlRUdqhS+CMdLGrkmVWx7XxJPbvB3agAnsDxemBFCwdaetdUrOsHR1HDbhbaCQ0HT+mVs0Rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5RYujZgjFif6S3liLZhQ6lf2sa7uD/E+mHPZvCqGaw=;
 b=H0ubM6jiwTeypbRY9l3rqG+3cvNJYT2ZTIp/Y+FYqbscwUfeHrcZie+GxiCNmhSidk5ZDOpAbtB+Ks9gZe454kLkSmBfnc6suoPDwoygsU/rWKPwBWHipMCZiMuj/sr14U0OFcZ7Pxurf/eTmtC0sECB9VT1pZwcxrEwLEP0iXlLbg0eaLGk4cdrRofmC4Yspx2ysZPRhw1AOebaNaZBZ/N39fpPir7bny5j1Iqsd/DHs+5LVZgktIE+VKHlU/X6+Z+3+rNiLKC5X5DTR1ZWayoFZ8MSp0pmB0HO01d0vXd0SBr7hQl6IVgJrPv/pWzSzW+2DtTFH5SWJ+oxHWZkkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49d7ee9e-effd-6385-c46d-2218f84e6ba3@suse.com>
Date: Tue, 26 Jul 2022 08:18:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/10] Add Xue - console over USB 3 Debug Capability
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bde011f3-772a-4b5d-935d-08da6eceb037
X-MS-TrafficTypeDiagnostic: AM0PR04MB5460:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LVdUBLfJ6KMgsdOwDUW5NqzPpkcZvebRXzVE0qWVJOB8WWrhPgRxOKabAlt5MOYDXDbsJT6h4myxlV5kEfbbnqgWm+G64+FCdrOVwRBh3ehuRwU/43Md3tGrvIMyZDReGNW/1UFY1cUdKuTA07RPiJnPi9kysvFJ2X2M55TXZhBP84F6lHC5D3/5L41km3x3tvw6CqJdGmKpmpmFvFDX9vbRrmacJlvPM10Br0dCAsPPUNnpgw6mXkcEIkXOpVogDCJpFP7/R14WcBvjsELgArVmxRob6O8js4GY7NBRf6WOJCDKEVGglkqzGW15u27m2592AN7zwLVa49Y7xZlPFrA5oUy04rZBdZBZV4LRL2pPyAvp660Tzu9jVCJAx1+nUjbR+bME+IxwXK2KzbqJ6fdMyYzdmotM78IF2TDF0ev24L24Y8c1l0HlcG3ybdZWw1VvOPQIqtzgqq/pgJw892kofFPmj8MUsWoiIfF488sHZWxVsrX4zJInZYmQOUkvIdydjd3RKSa1Q+Zb9Sb8qGQST3zhmYfoIPWMGSl2wMNUN26NS4WrUaJi82jTremuShlVfxvMyFg3J5G+ygYFOegPQ9v1x2LcOXip/WPSL90AJBMk/3yHTmxzg1m3+bN/SqtDc5hrkA5HYNLK/1lTnggCfSzas/UjRxUftg02GUKLUCO2lTp5TVT4v+eVyIOOYP9eYVIq+4Kqw+SVlKA30kBWPuDk4zlQstNBFjpSN69OlaX4lnK8DbglH8ZOUXu7qIJWRvdIB2ed1uydr1rkgBCVhMeRsMElrFXXx+3InKml6L0GHoJyYqanQrP9RfxYaHmL9pEhdaMHrg8vxO+kGyP29vLezhdUL1woWscNEdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(376002)(136003)(2616005)(66574015)(66476007)(316002)(41300700001)(66946007)(4326008)(8676002)(26005)(5660300002)(186003)(31696002)(86362001)(36756003)(31686004)(66556008)(6512007)(6506007)(53546011)(8936002)(7416002)(83380400001)(38100700002)(2906002)(478600001)(6486002)(966005)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dllDdjdSM1VyczFmTUUxdlFWVXBjaE5KNkd2WHpyL0hpdjIzdlVZdElxTW8w?=
 =?utf-8?B?a1d5Qm5UMVo5VUJyOGRvSmZKbEJoYWxQRU9XZkxEcnVUMG8rOGZmRG9DOWZE?=
 =?utf-8?B?bVRpMWEwdXdmYnYybnBCOVZjMk1PM2lWU0hBTm5tZmRJbTNGOVl3NE1DTmk2?=
 =?utf-8?B?dXlaekF4UDczMkM4R0lkOEdSc0Y0T05kazZOYlV3TDNETTQxditNbGk4Y21O?=
 =?utf-8?B?K3BqYnFPZDVOcWdvTVRONmtWWU9nOHI0UlI5UU51OW9QcmtaNzVsQnhOSFlx?=
 =?utf-8?B?bk8zTXUvTGQyMVBCR3NMUDlqUlpMUnBZWVM5RFZkSmZJWkR2M1lxVVYyRTZY?=
 =?utf-8?B?NzcwWnk1Y3dsYVZxTHpJQ3FCdUdyWjdma1dYZ2lLRUNaVE5WUmRSRTJabExT?=
 =?utf-8?B?akxrdlA4c0x2ckQrQWVONm5SRnF6MmRJbVk4bzJhUVk0SVEwVWdOUy9uZmE2?=
 =?utf-8?B?TUZtQVVTWGJPUWxjN3AzYmI2VjdicFU5VTZJUmFzclBMOUx5SHdzcXZ3STRx?=
 =?utf-8?B?Q08zbHZaNGZDdnlKMkRidlMwdE5xRU9SR1A0T0phKy91V0hDNkVTMThEL21r?=
 =?utf-8?B?aWhXeXZrdlc2eGxxeWtad0FkcjJmWkNTenR4UzBuOVloUWFIOE1jb1Z2SnBG?=
 =?utf-8?B?bHVCM3Rvczk0UGNGUG1VVlh0WHRSSFdjcjNsSmNWOGw2NjlMdDNQWEZySXh3?=
 =?utf-8?B?UTZ5NVl5UGhVWGViNTltc3pweWZJY1QxYlpsc0RyMUQzUjdxRklHNHdhSitF?=
 =?utf-8?B?RHZPWmIvMjZ1dUV0dERqdmNLRXJEdytYOUpGbElQTjFBejc1ZlJEUmYzbHAx?=
 =?utf-8?B?Zi9qZkVsdTdrOXFnWGtyaDJ1WHk5RUtud3Q2MFM2Ly8xUW1YUjM4Y045blU4?=
 =?utf-8?B?eUlSZE9aSm5DN0hwKzBRcGtMeThBTURXWEpnK0VUOXVkUGtYbHA4R3BHRitH?=
 =?utf-8?B?OERrSTl4Z1JvK0N2a2JBWkphMG9EODBwSk9UbmcxZWRSR0dHb1NWMy9KaSt4?=
 =?utf-8?B?bG9pcWhQek9rNzVRa1Ixdms1Q2FXVmlZSUpUWjRDTFphVENPWkNmbjE3QTdC?=
 =?utf-8?B?VjRJODU3ZnNqRTRUam9mRm9vL2JIWlNiN1V3OXdhdDhyOVpTQm80TXVPRTg5?=
 =?utf-8?B?MHNhYWx6VmFuTXZDV2NjaTIzVzVKYzZlYnQ3c2x2TDF1TFV0Q2N6TU1sVnBF?=
 =?utf-8?B?bkpPK056TkdJZEEzMGozVGZUdU44bC8wSzBRWjBWUVNubzloYVNpbE42a1VF?=
 =?utf-8?B?QlM2RGplNkM5YUJBQXRwMUNFS3BuaXgxT0ZxZUM5QkJlZlRGRGFLSTlOWnFL?=
 =?utf-8?B?bEF1c2Q0RWFHOHdDYzNZMEJteEpYZDNCaUVWSlA2bFdUUkRuNnQzYzdqa1lr?=
 =?utf-8?B?Wm83WDl6K0c2K000QW5ueThnN25DL3dic3h6bnZ0Q1BwdVVENWU0VVhRdFIy?=
 =?utf-8?B?UXVHRlpTRnRQLzFRdjFKMDJlWGRVK29UTW9aelVpaG5KbVZuMzhMN05PV2Jm?=
 =?utf-8?B?bExzQWNGYWRPTGFPbi93ajVHS3ZyYkxPcTBieXpyVXlKMFBLeThwMVBMWEpH?=
 =?utf-8?B?azJqeVZqQTRkSmtVdVhnS0NZenl1dnA2czVhYktINHdCRjFkZ1MyNC93dTNu?=
 =?utf-8?B?c1RwMnpONXRIRzl2N1pXZG1TenJRNjZ0VzI4UncyVDJ1MnJFRm5YTGdQWHVH?=
 =?utf-8?B?WVFKSUdoeHVrNFFDRlM3ei9uMmlzZjRqdytHVjlpZUFCZXVpL0ZZdmdaa2lr?=
 =?utf-8?B?QnZxbWFZRm94U2g1Y0NlSWZLblhic0VxZFFjZGljNlVIM1h5bm5odUZoN0N0?=
 =?utf-8?B?UWxhQUZrK2xPYndWQklkSlZWeVZVWngxM1Q5U2RmSHBqcmhYM0tBMVNaMlcz?=
 =?utf-8?B?bHVRQno2Zk5zNHlsSncyUWZwRUlpTEVyeFRZRGdIMmFBakhUMnB4VzU3SzhN?=
 =?utf-8?B?bFpvUUZiKzhaemNwTzdGek42VlhHQ1JZSXdrOHcweUk2TUxjdGRQbHJGWGds?=
 =?utf-8?B?bnRUUGVhNm1tVGhYbDdPYm5KVm9FVTQ5Njd1alk5NXVmY0F5OWUvdGRqZlJT?=
 =?utf-8?B?RXBManJXbndXUVNKV2tvcnB0cHFYQjkvcjQ1djhEVnd2YVUyR2NHWUxlbjJ1?=
 =?utf-8?Q?gz5fY7yZ2zxbvWdg2H2cVm+jU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde011f3-772a-4b5d-935d-08da6eceb037
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:18:42.6190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5ihkcC1xj7kcQGLnfdaV4EkQIARUVUjPmsSXkdZv68B3dZroJly7VclGiEi0EU7XANmZnOriIBl1GOkOcQPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5460

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> This is integration of https://github.com/connojd/xue into mainline Xen.
> This patch series includes several patches that I made in the process, some are
> very loosely related.
> 
> The driver developed by Connor supports console via USB3 debug capability. The
> capability is designed to operate mostly independently of normal XHCI driver,
> so this patch series allows dom0 to drive standard USB3 controller part, while
> Xen uses DbC for console output.
> 
> Changes since RFC:
>  - move the driver to xue.c, remove non-Xen parts, remove now unneeded abstraction
>  - adjust for Xen code style
>  - build for x86 only
>  - drop patch hidding the device from dom0
> Changes since v1:
>  - drop ehci patch - already applied
>  - adjust for review comments from Jan (see changelogs in individual patches)
> Changes since v2:
>  - add runtime option to share (or not) the controller with dom0 or other domains
>  - add RX support
>  - several smaller changes according to review comments
> 
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Connor Davis <connojdavis@gmail.com>
> 
> Connor Davis (1):
>   drivers/char: Add support for USB3 DbC debugger

I notice this patch was sent twice, about 4 min ahead of the full set.
I take it that the set having come close together is the definitive
one, and that one extra copy is the one to be ignored.

Jan

