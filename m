Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8AB4C489E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279379.477100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcO3-00005p-L6; Fri, 25 Feb 2022 15:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279379.477100; Fri, 25 Feb 2022 15:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcO3-0008Sw-G8; Fri, 25 Feb 2022 15:20:03 +0000
Received: by outflank-mailman (input) for mailman id 279379;
 Fri, 25 Feb 2022 15:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNcO1-0007u5-8P
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:20:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f864d4-964e-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:20:00 +0100 (CET)
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
X-Inumbo-ID: 64f864d4-964e-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7JLwmDLnPplfo5EXV+kV2lfB8peL6ufTDYH7Y6eoats=;
  b=KmIIQzLpR3+p89Fyw7ip7iixKuycs1fpiiwdhwOa06L4IbgFiTKbBirX
   C7GVm9sFtnjdIs5ZEMBs3koyiQ0Pf5ZZz1X6jvxclsKlBIBBIKFebVNF3
   XcMXExrGR6uW6JWmGD8pEfInEqFWlIuN5fjlxOsymcB5+aWFmLUmzHLPA
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64998962
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qYkdqqKvAQIQa2h7FE+R75UlxSXFcZb7ZxGr2PjKsXjdYENS0GNRm
 GsbCjqFa6qPZmX1eYh1bISy/EoOv8fTz4RiGwRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JJwuMGpcgVxBfznle0ACUV/CGY9JIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls15EeTKiED
 yYfQWRQQT7sMx5ABhQOEbIAmuLriFzAXQQN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S31j6t4n+qwOjVkkvTWp8WFbC+3u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonSJoxodUNp4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LXtSveCMcnDFzea/oDqvY3QyNihBfAZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2KBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBu6ft3N702wcH83wdG9KFoS/LkWd4umwWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5C6+IN4YTOsApLGdrGR2Cg2bKjggBd2B2zMkC1
 WqzK57wXR7294w9pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+x/UFzrqTp
 yrlMqKaoXKm7UD6xcyxQikLQJvkXIplrGJ9OiopPF2y3GMkb5rp56AaH6bbt5F+nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:O0hgnqoYywXifAftIrZS13UaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998962"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4p00J74PvYcXoqXJrFE1wlWVQb5r+BcXoG+V58L6yWxCodQgCHcRcJP6V0Je/mTVFz0HsPPZHb3QqxL/3dAmjSq5WxG3jY7rf1W11jBJXbywH598JpmHN7WSf1Ma4MYUvlTiCRaD6URnkHPrEmkwye6Ux8NHbiIaXrNp5XpqM0pUT9QUO7LuDZfm1FyC59L2uby5Iy0sf0ILfemlN3kDIEQeIbwC7K0VvRfoVjI74PYudxsNVgKotr64Q9hpMYpdcA7xG6eSNmg1eI3LvpOg0nnojbr56hbJsz8TueRykyidTEUOSXtE1dKARkfqRdu35PDEHFGTyjwM3oERkrYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lewhc8J3qtovseDH6VSo3lWF3jCtfrt5D8YHKkcpQFU=;
 b=aZetWlHAY6f98Rodk8tfeSjp8QM59B1n3O2jcyKaj3pIJY2n1VxujCBIPJMMwWrnuvm8zS4OnC3GOkA/utCwtRde/RzGIDgpz5JyjgHmGkiRyIuSbIgtovB0vSXah+E7v1bZoolYzrfE/c/ZKI0B/g9B4Z5sNGwI3F2/UN1rZN7OptKTSEDQ6tvjvf+MzqBzW31ou7toTo8fVfDVfiTV9nVCCDimrmAC4E8FGmrYcEsovG7Xy0UmEvJY7ScIaDJESHw1jWyxFuW43sYtShb35S+zAxgL+rn1GdoYlu2UA/QL7n7gD93ksabUBri5DHQfjyHnC+nd+tyvoh6XG2++Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lewhc8J3qtovseDH6VSo3lWF3jCtfrt5D8YHKkcpQFU=;
 b=intvuDKGAXota+nJWPVRtB/fjjI0QrbjIOKWihWvtpSDzZtHTeUko+me7JIC/5VJ1deyTLoc30SXvGiqTM7CnneaK2OFAv01NotbpzM+tnkFz7uvdHI3NnqDKrRGmAA5dmJQAgvRdGl+dUugn9yqCXdpy//3ccCd6ZDXlbXkmL0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] codeql: add support for analyzing C, Python and Go
Date: Fri, 25 Feb 2022 16:19:30 +0100
Message-ID: <20220225151931.99848-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225151931.99848-1-roger.pau@citrix.com>
References: <20220225151931.99848-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a901d43a-3096-43eb-0ce7-08d9f8724681
X-MS-TrafficTypeDiagnostic: CY4PR03MB3063:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3063C00D5A6E035FADA2B38E8F3E9@CY4PR03MB3063.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SjXeFW3PKWGD5U8MYgaXvLJn0vxAbSyDTR/ysMEG7xoIG/Scm5pMwpdKSvCC4UUrF4RyzTukCWFLizv15EKfvIedxs8WQOBs8MO1gnq2JG8LKjKIMTrQ2gsu3FkDN4d9jHkyh0FuvN1X2aycwL+hCuLaulv4oIxkycEXfBooPgmZhmKToIamWo4KtsinMT9qRrcS7a+9ljLbJ+uie1TfQRdv1S958G8+hPAntr2Q6YnQNkZMS1sXTkXiC4Y1cgqfWsxx89+C3Os123foum8WmqplvJK2R+aRKn/t7KuBPJAyr8wvMyQ08sLM0DmuQ3c9ewAA24m9HO1UiNjdTn2HGJ+gbFp+eWu/42GZZrzpYcniPB9CoFI4hbrrrPKDO7ECDYMrT2ARCG+e2pzkTzsUzH6IUX6JuXva4rSG+1tKgZ7m7XvGjEVOD33aiI/MublMw6AyS1/xdz/ffVw128S5b4YkUqm8jfErzmrAqyKhIR8s+oBnP122BgucXTcL6RKrwM9xqxxkdvz88ukn3vy9RiHKCUaqHzipaBblFBBs2uCnMup0KRiOToqXXtZkDdRRgHX8GrtPRm5dFdcKF8HqFDm+5KBdUdrG+ezZ1WFk/2JgGCZGgmRPoJ6fc7PdK+lnkUdhysHRerFhTQtPbz/7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(6512007)(6486002)(26005)(8676002)(66476007)(5660300002)(6666004)(4326008)(6506007)(6916009)(316002)(66946007)(86362001)(54906003)(83380400001)(186003)(1076003)(2616005)(82960400001)(36756003)(38100700002)(2906002)(508600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVNTSnVTVE52WEttUkM1QlRER21kd2c2UFlXNlBPQ2psZUJPQlpPcy9iRC9W?=
 =?utf-8?B?aWxXSEd1UzZYN3RONkQ0WmtZMGtXL3FLQVdyK0U1eGNzUXcwUStwN0QzTHI3?=
 =?utf-8?B?VCtGakRzMHVidjV5UWwvaGU4QU90QUxmNGw0ZGlwZW9aVnd2aS9ObUJWK000?=
 =?utf-8?B?dVZHNFNDcWFpV3h2YmxIS0kvZUpGWC9LZDBCS3VBbGt6dGdtVzI3cnJOUlBR?=
 =?utf-8?B?ZzJ0SmpSSzR1VEViZnBwOVpsRFpjRGVXZnZrbFdhbHlROVZhWUtONjhDTWtT?=
 =?utf-8?B?TzZ6c3BPejFJR1B3Z3IrZDFmbFRTblNqaDk3TFVtSVBQbWczUitBUVhDRE52?=
 =?utf-8?B?VFVoTTVBdnoxd0trZ1pMa29pTUZJUk9hbnZ0QVBRczJJZmg1SEFrS0J2UXA4?=
 =?utf-8?B?WjFzaXhYNHp4cDFWcGltbHVuME5sUkhvaU8xcENUSEhLREpzd0xBOWdqZVdP?=
 =?utf-8?B?bzZUWTVsZkhLK2R6N3J1eUNxREtCWWRCTSszUloreFFOUmZUeUpTUmkrdTIw?=
 =?utf-8?B?cFQ4NFZseGluVjRRbVY2NXNrbXlJd2ttZEJJZlBkelB4K0RxUmVadFRqeUNn?=
 =?utf-8?B?ekZiMFl4QXB2ekdlM2xwWllSQVhZNWR5U25lR2VscGwrbFZoWU9INGR2eVJF?=
 =?utf-8?B?d3Q5WERGUHlDeXQxZWFTb0g5Y0JNVy9iRUFoalBISlJicFNMSVhjb1BYWDBL?=
 =?utf-8?B?WkRIU0lWSVBqaUpiYm5wL3FtSTdlUGxuRGRpUTFFRFFIcjdDanI4aWloQ2Ft?=
 =?utf-8?B?SzN2M09yaUthdWlPc29pbHhrcW5HS0lkbUFlZDdqK1p1c2tJY1VKQkhUZUt0?=
 =?utf-8?B?a2RZK2h2Zzhoa3BVLzRJZ3c5M3hKdjdWb2NzdnJKZll6bzJNMHlkRGdYMFZK?=
 =?utf-8?B?aE1EK2pvOHV6dHZTTm8rVTNWczIyOTZoTkkxYzAwRWp0U2g4ck5oTWQrQUN2?=
 =?utf-8?B?aThqclBvK0dXclM2dVp1a3o1NXNGcWFpN2pkRUpGQ2thdXdxOU8wWDR3V0Vu?=
 =?utf-8?B?SHR4aUo2UW05Z29ZUUx6TkErUG8wMmZOdTkxZW5DNlllSmx0VGtsdDVWekFF?=
 =?utf-8?B?QlJGRVlkdHNkYjhuRVpncm5FL3pWcG5lVDRaUE5ab05nZTY1QWR6Q3ZyQzd4?=
 =?utf-8?B?Mk9nWUduRTJmZ1RiSmh3ZnlQMjREaGJyNk93OHJaTVlJQmRXWGRPN3YycWU4?=
 =?utf-8?B?VlJ5WTVrQmc0THIzczEzbU5LR1lXbTBpWlRoWVNyVXY5a3hxYllNSTFjWmRX?=
 =?utf-8?B?QXlQM293WTdiYkpPVWIwL3Q1QnBJVDZDZFZ5eWFydy9kOW9EMDJmV1hjY0hH?=
 =?utf-8?B?YjlXdE1NcEVJRUR5eG9nVGhWd3ltWFVWLzEwTEZTbkx1VHk4ZStlcldsQnhp?=
 =?utf-8?B?bWxmR216cm1PWnpXREJYVCtWK2lBRzV6dWpSZDY2Q25JNUUvaHhtM0Yrc1BK?=
 =?utf-8?B?c0FhTkxFVUlmMXMwL0VsTGZOM0RiZWRXSzRmYWg3L0Z6TEZheWh2cTBNbmhV?=
 =?utf-8?B?MjlGMG1DYWd3ODZ1MXBVc0hWaHp4WkIzdEZSVkVnQm9WMzE1OXhhU29jUlcr?=
 =?utf-8?B?MExUV0xwSi80aEhPVitYSDd0N2dYalZCT0FrYmtiUnU4OXk0azNrcGM2b3Iz?=
 =?utf-8?B?a2pjb0VDNFhmYWF0alBkL3ZTWVRaWDhMa0JiYVdaL0hXV3UyVVRNSys2WWNC?=
 =?utf-8?B?cjRleXdWK25zd2w0TEQ2V3FZRHNTOXNEdzl5VUNwUXduRGtsMHhlSXJSZmI0?=
 =?utf-8?B?TjlRc1dQei81SkRLN1NqRHZJSU40RTNaQ1JvNzNGZ0hnTmNyQ3hrRmF3UFNz?=
 =?utf-8?B?Y2c3YTREdDA4a2lVbXJSaDBJeTNGWHZuZHhHZVRuQkhyTi85ZU5uT0ZOQzRS?=
 =?utf-8?B?bzlEN0xpT2taL0h3SGtVRnFaQWd6SjBGZDduczhES1VNa2l0dngyQkRrQVhN?=
 =?utf-8?B?TFF5L2o5MjNBTktWSFNGaUlFNCtrRjlaYzZWRU03a000aVNmeXJ4UDVNSEho?=
 =?utf-8?B?bTJjYUJRZmkxcjQwWUZ4WDJjSEtIRm1OQTRZWFcyQit3RlZTQksrdVo0ZHlL?=
 =?utf-8?B?WkZqVnBKRXRmY3I0cWhZaWpCaHBRK0lwQzBIaHJMSThoblliclRBdjNVMm0v?=
 =?utf-8?B?K05qMzZaU3FweUp3YVZBcDZ5QVpDeDJqK2kvRUZtQllyQm4wNk42a0REOUw3?=
 =?utf-8?Q?s4wBOUdrk8hkqz2Rmr7CGwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a901d43a-3096-43eb-0ce7-08d9f8724681
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:19:54.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eAF5d+XKTKpG3dINyfc7kOC9IfjpqR9uIvFwGjx6vOHGiPu77lkArEKFZ8hN8QwFY1E2f2ikJaKWIS09MBnvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3063
X-OriginatorOrg: citrix.com

Introduce CodeQL support for Xen and analyze the C, Python and Go
files.

Note than when analyzing Python or Go we avoid building the hypervisor
and only build the tools.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
TBD: there's no limit in the number of scans here unlike Coverity, but
each takes github minutes and we are limited to 2000 per month IIRC.
We might want to not perform a scan for each push.

TBD: should we also disable the shim build? I'm not sure there's much
value in analyzing it.
---
 .github/workflows/codeql.yml | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 .github/workflows/codeql.yml

diff --git a/.github/workflows/codeql.yml b/.github/workflows/codeql.yml
new file mode 100644
index 0000000000..5bfe478983
--- /dev/null
+++ b/.github/workflows/codeql.yml
@@ -0,0 +1,59 @@
+name: CodeQL
+
+on:
+  workflow_dispatch:
+  push:
+    branches: [staging]
+  schedule:
+    - cron: '18 10 * * WED,SUN' # Bi-weekly at 10:18 UTC
+
+jobs:
+  analyse:
+
+    strategy:
+      matrix:
+        language: [ 'cpp', 'python', 'go' ]
+
+    runs-on: ubuntu-latest
+
+    steps:
+    - name: Install build dependencies
+      run: |
+        sudo apt-get install -y wget git \
+          libbz2-dev build-essential \
+          zlib1g-dev libncurses5-dev iasl \
+          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
+          autoconf libtool liblzma-dev \
+          python3-dev golang python-dev libsystemd-dev
+
+    - uses: actions/checkout@v2
+      with:
+        ref: staging
+
+    - name: Configure Xen
+      run: |
+        ./configure --with-system-qemu=/bin/true \
+                    --with-system-seabios=/bin/true \
+                    --with-system-ovmf=/bin/true
+
+    - name: Pre build stuff
+      run: |
+        make -j`nproc` mini-os-dir
+
+    - uses: github/codeql-action/init@v1
+      with:
+        languages: ${{matrix.language}}
+        queries: security-and-quality
+
+    - if: matrix.language == 'cpp'
+      name: Full Build
+      run: |
+        make -j`nproc` build-xen build-tools
+        make -j`nproc` -C extras/mini-os/
+
+    - if: matrix.language == 'python' || matrix.language == 'go'
+      name: Tools Build
+      run: |
+        make -j`nproc` build-tools
+
+    - uses: github/codeql-action/analyze@v1
-- 
2.34.1


