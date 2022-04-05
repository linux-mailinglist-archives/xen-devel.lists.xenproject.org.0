Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603E4F2986
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 11:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298667.508870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfbW-0007bo-5B; Tue, 05 Apr 2022 09:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298667.508870; Tue, 05 Apr 2022 09:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfbW-0007ZX-1Z; Tue, 05 Apr 2022 09:36:02 +0000
Received: by outflank-mailman (input) for mailman id 298667;
 Tue, 05 Apr 2022 09:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbfbV-0007ZR-2u
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 09:36:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb2bb46-b4c3-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 11:35:58 +0200 (CEST)
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
X-Inumbo-ID: cbb2bb46-b4c3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649151358;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QYeXGIMqwk9MI+YJ690RQcK58EgjBMpoOw/bL5EjbuY=;
  b=QDf/6G1e/vVXApcTDwm13aCgV5aZyyLGfSJdNzNv/J2zYIWKFfsX3QRM
   wxEo1yOVJIaEHUrgdYamnpXRB41ryCzZfSSxo552PNdVwwxlo1OCzpdhV
   c13OFNgpTcSF4zvVolLWZznBroJgqpGhiBcfq78o3zA220lRw4y3/KyoW
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67452992
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JVXVNKPMVBpuzVHvrR2al8FynXyQoLVcMsEvi/4bfWQNrUomgmQHx
 jMeUDrUOamPYmGkKt1wO4i19xlUsMfUzd43Swto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 YwRjLipTF0VDJbdn9oCT0EBCSxwFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmhs25ofTKy2i
 8wxZAZoU1eHcyZ0YEZGB68/hb/whXzGSmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BKGUziZmMTCihxIyFqg2tJXBMN2IMTHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOzyjxpmGGeF6bKKI3XH327wk5JEVdoNiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SYW9DKiIM4YVPsQZmOq7EMdGPxP4M4fFyhZErE3CE
 c3DLZbE4YgyV8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJINU/xfkKz7uWp
 RlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJ9HLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:W/ZaZKDLZNbv6iTlHel155DYdb4zR+YMi2TDtnoBLSC9F/byqy
 nApoV46TbZsgs4ZV0Ftfe8fIG4eFPwnKQa3aA8B4qLYSXDlEyUaKVP1qHC6xrcIWnb2tRm/Y
 lNU4UWMrHN5DRB7foS7TPULz9C+ri6Gd6T79s2pk0FJT2CDZsO0+4TMHf/LqQZfngkOaYE
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="67452992"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhr9EUe2eYsw5nVmmcKyGTnBrC++HBZaBzj6p8LrpfHqUnwWbOf9nNgi3pOXEbEUacs9TNwlfHm9o2pgBVzoRFx6YUoRgqZA6EyJKFdSi5Kq0E6iITBLq/XB0w8FLazNldVBlGmvw34vT62Vq6me0j05b0zHT0L9MRVHva7WltbjJiOpRmSjuPL1PKT3Oz0wVOtFDZfqE6pot9H1y3itFPjCa6f4ZRNMqzndDuQ765wUngaUb1dV2OU22GZc/8eIVIFzoRzdac+cm6SVw773NNr8GZaSgcja3h6I3HBscM6RSgnimAXrCjZVjdRrU5xz9b4NhGzxMpnpLOJV/rnOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HX/TJLCYLW9dTB+WjH29x1zFlAqewdfsUyrqLUdUHc=;
 b=hQ4yD4xcfKFZf2GkORB7WU4y2IY7obVlwixXYgbxpT7/asjnGSJSsUsGMyOkjrn8GoNBGHcmnQGj88EOnxkiFfPclWDwFV4rglAwwWLRuNF7WADXqiDFngyx4JeNHSWmdIudaLBd8AQMX2RfaiBJKzJ7KYd2fR8jt4pTzhwOLJWk0ZDM5g2pqz5Cc3UacSS4oWAdt3XBJHxwORRsu4TJd8I1eOpOBTJiVDMDNeawK7Aj0UQndoPF51M79TSiN0EWa76qrdNyUWcTquU7AHu37Gg20UhMkpuTX8H1npX5Ypqz+kEqACwuZRd576KOc8ujcJAhBw4OQof8L1cX4YVOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HX/TJLCYLW9dTB+WjH29x1zFlAqewdfsUyrqLUdUHc=;
 b=CfcKayFfSW4tLz8IfxAdoiM9syrCH/YDApG3ti/dUYAvBU9u9Vb0eoXG2/js5nwaaJz1r9+/PRGAA3n7wDDvKf1JKnkkbO1KC7M5zcNZhKxoZk9xb8d1rCUqGxAFUduqVthtPMUx4eca6Hz0P/rfaEgy1wqh8pAp+G6VVbXsJqo=
Date: Tue, 5 Apr 2022 11:35:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/8] x86/boot: obtain video info from boot loader
Message-ID: <YkwNbi3lTNJbWVNC@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <6fc25224-7985-73a6-8877-bc209f64bf8c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fc25224-7985-73a6-8877-bc209f64bf8c@suse.com>
X-ClientProxiedBy: LO2P265CA0328.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 640fe846-6487-4d93-85e7-08da16e7a96b
X-MS-TrafficTypeDiagnostic: BN7PR03MB3651:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB365107B2504D94ECD47F9E448FE49@BN7PR03MB3651.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: If3pDtPp9ePOeJ47iokriyTC9zZDaqmpUmCWYZ4hYa0PCI3D1khsn8ffxarKbE1k+KJMqjcW9qdhhCR7XNtUUUiMY5L5XVlUk3LAW4IhRP+J1Jy4GgZKgi8HYEn6Nv5SkluqnxKy/T08SGdu1EGkKa0yLmWqkKrSmmr014PqQnQoQdKHCrWVs4+PDJxueMmHIReSvyapObwW4Ffqe2/p9qKXS3raQnh5G9ph5mwbSXhx8XuVM8lJs99CCUwexc+4ifjseIg7/kv+eMsmJq9xODv9TtadOX78cWIKz67UY1+aWjANPMUlkvaFQUBBqbun9SbinlAQivwRYknQ6ca0PRM5gywg3vsWfunBLggIMFnt7E+jjus+Ds854eBqV8c9CSsVzaiXth2vGgNi0ue5tUhhtFJSup/JBlCzbmPFWK+aCa9NDl08cKOjb5al6YXzeJ7U8jP5m7/F2FFjoK97noD4XlUDbMm3rV19Lxckh1DwZyrj78XX/DFEEWFeTYA0V8+8SfuwcYMR3i0RLFnSqWIBIqPOesYOnCFLCcEoJKKcj+25PXZFkJa8jGXN7WVGd3ht+vwYKdPt6+leGD3+Z2r/WGkPxc4ki47Cro1qFRIKoLt2ASmFFOCe1JETkh1NrkZM/+lPDQw2Wjm5WPapaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(4326008)(66556008)(8676002)(66476007)(2906002)(66946007)(38100700002)(9686003)(6506007)(6512007)(6666004)(82960400001)(5660300002)(8936002)(316002)(186003)(26005)(6916009)(33716001)(54906003)(85182001)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3dPeWJtUTFjcmpiMzVtNC84L0w4amFWWUlkRGRqQ3VhWm93TkdSaS96UVl6?=
 =?utf-8?B?UDdESWgyNlVVNkNlMlRFNlR1NnpaclFIZmdGd1dHRGtOK3VvSktCRXVyYTZT?=
 =?utf-8?B?SWVzN1Y3UklJbjlxdk9kSFRVR2Zmc0tWRjN5eVhNSlVHOVBJY3MrNmpvTzli?=
 =?utf-8?B?QVhyVWZxcWU4QW1NN2tpamdhNDlIYWI4aTBLSlQrbWtseUQwUFI0ekR1NktX?=
 =?utf-8?B?d0RIZEhGbkZYbzRnSXlUN1lJMlhiVy9kdWNxemFYMXgrb05ZYkZ6THQveW40?=
 =?utf-8?B?enJ3VlZ2YkxZK1c5RHg1dEM5WHpMckRpZWpuRXhZclU4b2t2aFlsbXcxc0ZK?=
 =?utf-8?B?R1dsNnRuTW9ycGVXVWdFZFRRWUQxVmxpVEVJWGN4TFVsQ0FVcllaWE8zUkZa?=
 =?utf-8?B?Y3FlWFRsaWZHc0NwMTJaSDlublJOdnhUN0JDdzVhUW5rUENYb2p1MzhiYXJa?=
 =?utf-8?B?amJHR0d2SURxZnZ3Uk9oZ2VhTVprcnk2UU5OSXNpVzU1NHY2RjlFU2lGZURp?=
 =?utf-8?B?L2QrMGprVnREUGhXQlpGL2hxdTNtamRaQkQ2disxTTA3VkRCRnhOM3ZTbHZl?=
 =?utf-8?B?RkpqbFRxbnBSQWJvL2VCci9mdnJ3bWZ4MHRyRVc3bEM5RnhNTEI0eWZIYmF4?=
 =?utf-8?B?Q2RSMjRhZ2pJclBaUG95dE5TMklZaDRoSno2YnkwZ0hUQ1RyRGh2MzliZ3M3?=
 =?utf-8?B?eERTb1AxOVJLcFIrdzlBSzZJVmhiR3haMmNwVW9lTmFuWEZrZjc0VlI3MGk3?=
 =?utf-8?B?QVFVdUtWcEhmYWtoUnRubEd2Qy85UitwSEdrUUlJMUplMXVBT3p5VGkxU2NM?=
 =?utf-8?B?bGt5QXRZN0tsOTFhc0N1dnFRWkFSUUo1a29qRGVhZXpRVTRxeElldkYvVFdP?=
 =?utf-8?B?U05OaWQ5d2YrK3BxcFduSlR0ZGRCWGpJMk9HM2lVdGpQckVHWjdaaGc0ZmI2?=
 =?utf-8?B?aTVMaXNwUVJNejNJWW8rNUxuem5FekgzcUJPZzhBRGdVMG1QdW9rRWR0VzN6?=
 =?utf-8?B?QzhzV09waE1GTmkrM1NvVnc3R0RrMEY5VnFGUkE4WFg0SzNXMjc2eGoyUk1u?=
 =?utf-8?B?RHNHUVlnUUZaUUY4bzYvWk8yUGZETXphSzQxY1RyVFduUnZqMjQ2YVJuR3Vs?=
 =?utf-8?B?ck8yV3NhZ0V2dVpOdlBpbmJwZzlXa1dEbzNrUXBuemIvQXl6Wk1hdG83M1hT?=
 =?utf-8?B?cWZFOXNGRzRDREpmUEcrV0NvR2FRWVgzd01sOXE4TzVSN3lwOFFDb2N0U3BG?=
 =?utf-8?B?ZXpLWWVRbnl5VmFUZFR0dUhuYVpNOThQWkdXcFRxQng1NWppL1lJZmh5Y2lt?=
 =?utf-8?B?eCszcUVDa1ZpMWtLYzgrSHRabXROcTl6S3VEZ3lncWREbXl6RGZPRHB4cE04?=
 =?utf-8?B?c2Q4ZmZ6dG4ya292N214djhwQk80VW5jL2VnZnZkOGsyYitWSDZxdHppZ1hQ?=
 =?utf-8?B?ZWJidHMreFhCbC9wU0ZZMk5RN1o4UWEvWlpKQTZ4TWJlL05rN1EvUXpJUWZ2?=
 =?utf-8?B?N01GL3ZaWmlPSnFERmdXbFQwSnhZTnFBVi9VSlJObFlxMFNzeHdGOXh6b3Iy?=
 =?utf-8?B?dmJrZngzK0JUTnk5dlMxVUlGZTV6Rk03SVNjTWtXYnlEU3NwZ21zV21tMGlz?=
 =?utf-8?B?UllWNFlyT1VYY1hlU2RQd3NzVENWckgzV1UwSm0rY3ZNa2NkQmZnSlU0OUN0?=
 =?utf-8?B?c2lkT0NxZ3hCR1AvclpLTFJiRjVOMWNyTlpnRm9HMnl1Rm5YSW5aeld6U1Vn?=
 =?utf-8?B?RnRpOExkMFVGVVdPR0Z5VDhtTUhsd21VNUJHUTA0Qkg4Wm92bklFelQ0djh6?=
 =?utf-8?B?NTdzV0FKa1l3TURMR1RaYVBOYkVkM0FkWElmUE40cW4vdkxJQWZ6cWUrdG1J?=
 =?utf-8?B?RFJIdlUvK21qVENoeTlDaWdIeFg1aWZINy93OU5RVG1RNnZJQlk0dVd4OWlq?=
 =?utf-8?B?NG5oaHBqai9JaS9TWUJzN3JVK2h1amczRVdkY01nRVgvVTlZb2JrMi9RbjRX?=
 =?utf-8?B?bUFCNkFuSUNFZUpORGlUNzhzYWd0ZS95S1doNjF4ZzR4OGhJc29lZ2I0bCsv?=
 =?utf-8?B?bGp4Ukh5aUZVSkduay91R2IwQ2p1VlBKaU0vbjNUdHJGa3dSQ3c0aWRoaGRY?=
 =?utf-8?B?QnE2cDg2QmVpeVg4b0pBbWNlU1JpYVQzQnV5U1BqYVpYa0ZRMDlYOFJ2UXI0?=
 =?utf-8?B?cDJwU2Z2c0RSRXFmM1AzV0NGWUxudmE1eHFnVmVJSkd0TTRpZXVsSG13b2ph?=
 =?utf-8?B?ZXd0Vk5ua3NFTnJCbDdHUkZvaDZCWEl3QWZIczV2T1A4NnJTTTJDaVo1RGh5?=
 =?utf-8?B?YnFEYTZPZGdlT0JqdWlYNTdEK1hsOVJkd2dEUURINEw1Yy9MNnU2WEtyOEpu?=
 =?utf-8?Q?3ducvO8ZAq/KWiW4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640fe846-6487-4d93-85e7-08da16e7a96b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 09:35:46.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mFwD4yAFV5euqZ9ALxhvHCgTkv0GD3A5igHG6ATzyyAZ3OSEkjWwiE5SEt+Loy36nimqbLnIK/ueHy6xoOiOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3651
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:45:02AM +0200, Jan Beulich wrote:
> With MB2 the boot loader may provide this information, allowing us to
> obtain it without needing to enter real mode (assuming we don't need to
> set a new mode from "vga=", but can instead inherit the one the
> bootloader may have established).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: Re-base.
> v3: Re-base.
> v2: New.
> 
> --- a/xen/arch/x86/boot/defs.h
> +++ b/xen/arch/x86/boot/defs.h
> @@ -53,6 +53,7 @@ typedef unsigned int u32;
>  typedef unsigned long long u64;
>  typedef unsigned int size_t;
>  typedef u8 uint8_t;
> +typedef u16 uint16_t;
>  typedef u32 uint32_t;
>  typedef u64 uint64_t;
>  
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -562,12 +562,18 @@ trampoline_setup:
>          mov     %esi, sym_esi(xen_phys_start)
>          mov     %esi, sym_esi(trampoline_xen_phys_start)
>  
> -        mov     sym_esi(trampoline_phys), %ecx
> -
>          /* Get bottom-most low-memory stack address. */
> +        mov     sym_esi(trampoline_phys), %ecx
>          add     $TRAMPOLINE_SPACE,%ecx

Just for my understanding, since you are already touching the
instruction, why not switch it to a lea like you do below?

Is that because you would also like to take the opportunity to fold
the add into the lea and that would be too much of a change?

>  
> +#ifdef CONFIG_VIDEO
> +        lea     sym_esi(boot_vid_info), %edx
> +#else
> +        xor     %edx, %edx
> +#endif
> +
>          /* Save Multiboot / PVH info struct (after relocation) for later use. */
> +        push    %edx                /* Boot video info to be filled from MB2. */
>          push    %ecx                /* Bottom-most low-memory stack address. */
>          push    %ebx                /* Multiboot / PVH information address. */
>          push    %eax                /* Magic number. */
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -14,9 +14,10 @@
>  
>  /*
>   * This entry point is entered from xen/arch/x86/boot/head.S with:
> - *   - 0x4(%esp) = MAGIC,
> - *   - 0x8(%esp) = INFORMATION_ADDRESS,
> - *   - 0xc(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
> + *   - 0x04(%esp) = MAGIC,
> + *   - 0x08(%esp) = INFORMATION_ADDRESS,
> + *   - 0x0c(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
> + *   - 0x10(%esp) = BOOT_VIDEO_INFO_ADDRESS.
>   */
>  asm (
>      "    .text                         \n"
> @@ -32,6 +33,39 @@ asm (
>  #include "../../../include/xen/kconfig.h"
>  #include <public/arch-x86/hvm/start_info.h>
>  
> +#ifdef CONFIG_VIDEO
> +# include "video.h"
> +
> +/* VESA control information */
> +struct __packed vesa_ctrl_info {
> +    uint8_t signature[4];
> +    uint16_t version;
> +    uint32_t oem_name;
> +    uint32_t capabilities;
> +    uint32_t mode_list;
> +    uint16_t mem_size;
> +    /* We don't use any further fields. */
> +};
> +
> +/* VESA 2.0 mode information */
> +struct vesa_mode_info {

Should we add __packed here just in case further added fields are no
longer naturally aligned? (AFAICT all field right now are aligned to
it's size so there's no need for it).

> +    uint16_t attrib;
> +    uint8_t window[14]; /* We don't use the individual fields. */
> +    uint16_t bytes_per_line;
> +    uint16_t width;
> +    uint16_t height;
> +    uint8_t cell_width;
> +    uint8_t cell_height;
> +    uint8_t nr_planes;
> +    uint8_t depth;
> +    uint8_t memory[5]; /* We don't use the individual fields. */
> +    struct boot_video_colors colors;
> +    uint8_t direct_color;
> +    uint32_t base;
> +    /* We don't use any further fields. */
> +};

Would it make sense to put those struct definitions in boot/video.h
like you do for boot_video_info?

I also wonder whether you could then hide the #ifdef CONFIG_VIDEO
check inside of the header itself.

> +#endif /* CONFIG_VIDEO */
> +
>  #define get_mb2_data(tag, type, member)   (((multiboot2_tag_##type##_t *)(tag))->member)
>  #define get_mb2_string(tag, type, member) ((u32)get_mb2_data(tag, type, member))
>  
> @@ -146,7 +180,7 @@ static multiboot_info_t *mbi_reloc(u32 m
>      return mbi_out;
>  }
>  
> -static multiboot_info_t *mbi2_reloc(u32 mbi_in)
> +static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
>  {
>      const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
>      const multiboot2_memory_map_t *mmap_src;
> @@ -154,6 +188,9 @@ static multiboot_info_t *mbi2_reloc(u32
>      module_t *mbi_out_mods = NULL;
>      memory_map_t *mmap_dst;
>      multiboot_info_t *mbi_out;
> +#ifdef CONFIG_VIDEO
> +    struct boot_video_info *video = NULL;
> +#endif
>      u32 ptr;
>      unsigned int i, mod_idx = 0;
>  
> @@ -254,17 +291,64 @@ static multiboot_info_t *mbi2_reloc(u32
>              ++mod_idx;
>              break;
>  
> +#ifdef CONFIG_VIDEO
> +        case MULTIBOOT2_TAG_TYPE_VBE:
> +            if ( video_out )
> +            {
> +                const struct vesa_ctrl_info *ci;
> +                const struct vesa_mode_info *mi;
> +
> +                video = _p(video_out);
> +                ci = (void *)get_mb2_data(tag, vbe, vbe_control_info);
> +                mi = (void *)get_mb2_data(tag, vbe, vbe_mode_info);
> +
> +                if ( ci->version >= 0x0200 && (mi->attrib & 0x9b) == 0x9b )
> +                {
> +                    video->capabilities = ci->capabilities;
> +                    video->lfb_linelength = mi->bytes_per_line;
> +                    video->lfb_width = mi->width;
> +                    video->lfb_height = mi->height;
> +                    video->lfb_depth = mi->depth;
> +                    video->lfb_base = mi->base;
> +                    video->lfb_size = ci->mem_size;
> +                    video->colors = mi->colors;
> +                    video->vesa_attrib = mi->attrib;
> +                }
> +
> +                video->vesapm.seg = get_mb2_data(tag, vbe, vbe_interface_seg);
> +                video->vesapm.off = get_mb2_data(tag, vbe, vbe_interface_off);
> +            }
> +            break;
> +
> +        case MULTIBOOT2_TAG_TYPE_FRAMEBUFFER:
> +            if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
> +                  MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
> +            {
> +                video_out = 0;
> +                video = NULL;
> +            }

I'm confused, don't you need to store the information in the
framebuffer tag for use after relocation?

> +            break;
> +#endif /* CONFIG_VIDEO */
> +
>          case MULTIBOOT2_TAG_TYPE_END:
> -            return mbi_out;
> +            goto end; /* Cannot "break;" here. */
>  
>          default:
>              break;
>          }
>  
> + end:
> +
> +#ifdef CONFIG_VIDEO
> +    if ( video )
> +        video->orig_video_isVGA = 0x23;

I see we use this elsewhere, what's the meaning of this (magic) 0x23?

Thanks, Roger.

