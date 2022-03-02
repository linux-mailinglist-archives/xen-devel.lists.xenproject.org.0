Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CA4CA9A7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282404.481102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRGP-0003Uy-5A; Wed, 02 Mar 2022 15:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282404.481102; Wed, 02 Mar 2022 15:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRGP-0003T8-19; Wed, 02 Mar 2022 15:51:41 +0000
Received: by outflank-mailman (input) for mailman id 282404;
 Wed, 02 Mar 2022 15:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPRGN-0003T1-81
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:51:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fed988-9a40-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 16:51:37 +0100 (CET)
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
X-Inumbo-ID: a3fed988-9a40-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646236297;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/YOCe5K3tQIXUPWQ1qMihfC3Au6yPpUOdn+IZy8nftQ=;
  b=Zw/7aCffPIgEJuEDyhMvdF8JtqDNtpw9vx9S305YbdZolF+MFFIJVx6p
   UwSjmpElC3ejQJpqkwyeRgog0JONAo/SXoF7Xi34mGWecGeYstDW0np8M
   CYkOFetRCRDHcyrjFIbhElF6BhdDptGbiUMKdffYvG5sAOoZ17jT8F8uy
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64772009
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CdZL5qKna0rAAFe0FE+R+pUlxSXFcZb7ZxGr2PjKsXjdYENS0GEBn
 2NLDDvUbKuONDemf4gjOdjkoU1UsZ+BztBmHQNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dYy2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Md0vrC9VSw7Bb3Nl9sESCt/PgNAPJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls2Z8URa6PD
 yYfQSEzYAyHIABpBmg8N80R3/vxg1/kaTIN/Tp5ooJoujOOnWSdyoPFM93TYNWGA9pUmkWwo
 XjP9GD0RBodMbS3yyeB83+qrv/Cm2X8Qo16PLG/+/RnhHWaw2UBDxtQWVbTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOpvY9aTE2/
 U2yj9LmOiV0gpq4a0ycz+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Q2f21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVflhdwTXGY3h+Y1FAd7falUwZnY1QvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MpOtzpU5V0lPm6fTgAahwyRoAUCnSWXFXalByCmGbKhzy9+KTSuftX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClE+STF5VqSImutJlk4Mt/09q9okN
 0qVAydw4FH+mWfGOUONbHViY6noRpFxsTQwOilEALpi8yVLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:yh+3Fav2Fve8YyUn2nYyJQUC7skDWNV00zEX/kB9WHVpm5Sj5q
 STdYcgpHjJYVcqKQsdcL+7WJVoLUmwyXcx2/h1AV7AZniahILLFvAA0WKK+VSJcEfDH6xmpM
 VdmsNFZ+EYeGIasS+M2meF+rgbrOVvu5rY49s2h00dND2Dfclbnn9E4yigYzZLeDU=
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="64772009"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6xHYHx/g3ewSPetgZBV9FMuMwvaSUG8PON+ltxmPypusIeiq+fly8gkKYT2YUur5R/4GoSLj5gCTCDT4S4oL0YGOj8Qcy+8FZothtnLRc8I2ZH/7GZiWk2AHwQ0K53Gf1q6gVj1WzGTDKunnijta7jWi8fiQNcEfnsb8j2YWy3uHUvSzHY2Ex+yBtOVd4qDsKMB4DyHkbJjKfAaJdKheu+e3G7fKAEhXPsTqLo5OLG6jMmS2juBl95nsEupWbTWYH3y2eQa9ye1e96VSkME2ArbMd6/Md4aIBTKttZ0QeTxh5Tu6ccWg1bOmvTJv2uv469sb6681+NwzEJbEZO36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp7BP6YDX7sYiHsbnawkPE+zGuVmcllsQOjveyqMa0o=;
 b=OvIfXr7ckNPIByUqtrqveMg/UUOezTSE/2CmCzHr1WPshxC6g32uXANl8GidgFQhNo9Snn180IDTfpTyc1zCgCeQAjk+3CutRTDE8Jn/y/21okobe0NtGDPq0S7ayd/ScNYpi9KYctqF/P4Ompxgb4Ti5Zay1JqMp8kopUkqDeo90BDk2ofo+z9coJCBLpPyTEMAMNTrlGhJaiy+IMH2aq/1ZlHzjvsNrDTf5h9ae2XfiSYiWbxlrNS9y7uSVF614q7d8vpLfZeREdpYpEvvK3UhXfYXzxxL2YM9+osmO//4xLd8P/t3mLbjCQQx7iv+Hb27cTFfsSuhDSsR5sfPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp7BP6YDX7sYiHsbnawkPE+zGuVmcllsQOjveyqMa0o=;
 b=QPuRQoiGwtIBV1ItBzusaCifrBFVUda5RfWnD4g1T2fAA5S1CkLjxYKx5RhcBjAOgfWeFEWObqrF5Na7vGuBTBAGQe5WtuV1vOuoF2Hn0Ld0fHBasST1aA7tbku715YfKtQFUiT3aQXZHFidy1NlEwet45uodiaOtnBgmrHRpfo=
Date: Wed, 2 Mar 2022 16:51:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Doebel, Bjoern" <doebel@amazon.de>
CC: <xen-devel@lists.xenproject.org>, <ross.lagerwall@citrix.com>,
	<konrad.wilk@oracle.com>, <julien@xen.org>, <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Message-ID: <Yh+SgYboLD1u8U0Q@Air-de-Roger>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
 <459241b5-d412-d2e3-0f23-6094db87535a@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <459241b5-d412-d2e3-0f23-6094db87535a@amazon.de>
X-ClientProxiedBy: LO4P123CA0311.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4af408f1-ac5f-49f0-7c88-08d9fc648655
X-MS-TrafficTypeDiagnostic: SA1PR03MB6451:EE_
X-Microsoft-Antispam-PRVS: <SA1PR03MB64516D2FDEA972DB4F1156918F039@SA1PR03MB6451.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wW6nBEZIjwUf0ZGua8N10ehIVXWgb/yuXYhOdJcSWhkT0HhlT1HV62dTBZWIjJbHjMRI4Uxz/I6cpDA8lPV8uk43zptVXw6IcRoYgBbkQe9aQBmjZZqp8LKSzixPeZ7R0EwvPccMpTjnNQr7vMorLu/zpZjibgbewqX84In9vLEKLPviIJw41CqFQLw/WvvVJOcrfYjwqiJfGJQ5C4H4jieyhlpaIM5spNnsV/RuKvPZLJzgcIYmFEXW1BHa9OGyTtnNYgFI/qGoTGzDMbh9KFVgwXdp26deVZA0jLe9VX5nMRwdhI7wDZOjsRkALx67KNFSFcqFMCuF8X/ZgRS38PHeB16aBEKUvGr22QZJYwyxG0+wk931stAYRoqG5g0MYNB5ApJ2JG+R+dVnOmJYdI6Z5UCvHT1FVUmmRR1biUtFGE72Kiw/jQN7+VROFsDGticI7tELBUonQORtVf+cxMmgb3Ug9f/On2p6dSZhbwO7vKF3dvqJWONgymXZgKMTw9S2bGqz2QVxEEXvrCS7ZHyRR/HOS6XkDDPwDcxVik5YQecWHxU/9nOHaHu5HfCraqoWVFW1CDB6irGw5wc33ZxCeJ1rWLMLH2hZNi2HA8ZKHXwFjqOocNEmMSXzAqYHswgwB7EFRIdMBUOcBwPFf8BfngVQ1AR9zT9eUDDZ5hORschkqRTNOQN0SxPJfGNkSdVmVv8khKY1tg5mqsMiVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(6506007)(6666004)(53546011)(186003)(26005)(107886003)(83380400001)(9686003)(6512007)(33716001)(85182001)(86362001)(66476007)(66946007)(66556008)(8936002)(8676002)(4326008)(5660300002)(38100700002)(316002)(6916009)(2906002)(6486002)(508600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXJoOWJqNHo3R3dPb2cwbm9wcS9rUE10TGU2UmtoY2pJY0paZ1lRVCt1c0Vw?=
 =?utf-8?B?bGlUTWdLMTJEWWtZZjZoc2dFUU5jYmMyQjZVZCtZS1kxYVVSaEFYYytHSEtU?=
 =?utf-8?B?aVh0cTZTTENOL3VCTzhOVWRDVDN4VzJRSHN5NEEyMUlXTHZQbjltckphZjQ4?=
 =?utf-8?B?QUc4TDhobGVIZ0YrTXdJSGl6ZFZuRVlQTXl6L2hvblUxZUFDdkxDcE1YamND?=
 =?utf-8?B?WnpCbHlMbDQ2YXdRY3pkMllMZ0tkMHdkM2d3VWN4dFd4R0U1MkJJOWZWY09S?=
 =?utf-8?B?M3pwbm5rNTBaQzdvVDhJVXljVHBZVTd2QTdFeHMyaTBNSGxpaklrMXFrKzQ1?=
 =?utf-8?B?VzE1VG1VUUxTY2d0UW1NMkMrMDVGZDZmSkxUZm1jQnVzeEVvQlBOUTJpQ0k1?=
 =?utf-8?B?TGptVlg3aWxvSG0rdWdSMkhPRHdzeHVya2ozS2hOMlZEWmRZb1o5Y2RTVVdK?=
 =?utf-8?B?MmlXdWFSTzhCamdxVU1TVSswalc1VllpdXFCVlh4K05hSWFaWTBITW5XU2Zr?=
 =?utf-8?B?RHBMTTVmY3htc2l5WUVpVjluWGNRM0Z1WjRYbVF6Qnc3SVlNdFhLRDFubStz?=
 =?utf-8?B?Sk14YVpweXc1Y2dkUUdIQ3NYY3JXMFBzcVBrS3lnVnpsS3ZwTEpxdVYrdVo1?=
 =?utf-8?B?ckx0dU4wUFpzMHREN2ZVNkFFUFZOMDNBZk5jcERyQ1RraW1EUEpEeTF2eHVP?=
 =?utf-8?B?ajZGNkJkTzY0ZVFmVTVVRmEwY2VyVTdSbnV5K1B4RTBlYStrQU04YklmUEFo?=
 =?utf-8?B?cGFYTXlMVTRCSS9VMFdRUmw2UU56bTRMaUNLOWR4dk5DL1NtL2VjaFVTdXF5?=
 =?utf-8?B?U1N2ZWdyR3daQlVhK25yMVozSWRxb3ZFSFNEWDJLWGxMOTl4bG9lYWljNVBw?=
 =?utf-8?B?QnA5bXMzVkYrUkFkdUl2YWxPci93TFl0R3hoNFZHLzhrQVhFVGUxZ1B3ZXZZ?=
 =?utf-8?B?b3pPNmJsSllRMW1IQzd5d3ZHcnYxSTRudm96M2hmMVkwcmpWYzI0RGF0TzUy?=
 =?utf-8?B?VlYvUXEzL0VabjlzMmZvUURod0ZrRnZRelo4NDEzWXVMRld3TGZ6RHViUXBu?=
 =?utf-8?B?ZG1LUVkzZ1p6RTQ2QmxtOWMxU252b2o2RWJIeElGalNseUtxUmQyS1FLRzdo?=
 =?utf-8?B?WUNBczdJWG9DaTVMNDlRU0dNNlo5RG02WTdRTGxBbEJMQ0hLRXR0MG5Ycld6?=
 =?utf-8?B?Q01kMkg3OXlKNDExN2FtK3UyeHFBZUtoeXNWTVNRMGIzckdWamhwN1RMeE5V?=
 =?utf-8?B?cEE2U2kvckNhOGttVktHK2Q2RnpXNDRIaU82bllCQnBvT1hKYnhud2FLMWJp?=
 =?utf-8?B?NW5tS2Rxb25lUlEvb1ZUcGZGckUrZUIwNUpIcEdTVkJXRnYvOFcyNjZNUEdq?=
 =?utf-8?B?bTdzRDhrUzYxb3NPbDZGSmVDRW02Rkt6T2NzZlRDamk3QmtFdDRxR29MVm5O?=
 =?utf-8?B?M1hHOWY2UXVid25qdU9vcERSNUtlWGh6N1BpZlczUVhOMU1UNmZPVC9tVTUv?=
 =?utf-8?B?Z2prejBZRGFMNXBTbnBmL05qRUhuQzR4dUlnVVdNeDRtcTZ5L0lhZDNrNWtC?=
 =?utf-8?B?ejBzNnpaMHhnVUFoRDZDb05USmVRWE51Mmk4L3pGWmdTM3luRnFaYTVCRjF6?=
 =?utf-8?B?dTYzTVZXcFdFK2M5a05VcldTTmxWelRxMHN5d1pVM1N4OFhUUWlDTHJoUi9B?=
 =?utf-8?B?eld5ZlZKcXhsenAvRVIrejZEUk9HbHNjRWRqQjNuMlIzM1JnS2t0aXdKeVp5?=
 =?utf-8?B?ZG5qOFlOczUxZm8rWmtOZWlaVWI2VkhxcUY5Ulc4VFhGN2tIREdvZHVsYlNL?=
 =?utf-8?B?YnlTbm5rSDZ1Y29XYXAzOURaaFhlb3JYWkdWc2g0Z3F1RDl3QVJqWmlab3NQ?=
 =?utf-8?B?T0x0bFM1NGp1T0NkNUpXS3YveTZsUDBvYUx3SnhacXIxVHNWMjJiMEhKRStT?=
 =?utf-8?B?Q1Q5elA3QVZvNHNMc3RXN3N0WWV4QnhRRmx6bmJYQ0owd3NpQkRienRSWk0w?=
 =?utf-8?B?R1VBVTBVOXhRc2JIc0IwcEVsL1lCamdFVXVwcVYzVTc2UDZhT0lLdHp0WjV4?=
 =?utf-8?B?cU1kZ3E2WlRiQjdWaG9RZ0EwZk5yakVSRFc3Nk9MQWpCN25pcVBQQzZ0c0Mz?=
 =?utf-8?B?Z3pJZ3p1Vk9DdWJmd2pZV2pwVXhZc0dIQWVXbDQ0anhWQWtyVVVaYjJtZzlV?=
 =?utf-8?Q?y0feLbD2FEo8yDGM0ymp1fg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af408f1-ac5f-49f0-7c88-08d9fc648655
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 15:51:33.2501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: latmaGpQ2V01dB+qWsXKBi0StrcArP0Lmc8rb2RTblbUwVICkmwMtKehN9zHeTiCYNXjmhDA7eEfk2ALX7h69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6451
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 04:41:36PM +0100, Doebel, Bjoern wrote:
> On 02.03.22 15:27, Roger Pau Monne wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > Do not attempt to modify the build system if CFLAGS are not set in
> > Rules.mk, and instead rely on CONFIG_LIVEPATCH already setting
> > -f{function,data}-sections.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > This depends on getting the patch to add -f{function,data}-sections
> > when using CONFIG_LIVEPATCH accepted.
> > ---
> >   livepatch-build | 22 ++++++++++++++--------
> >   1 file changed, 14 insertions(+), 8 deletions(-)
> > 
> > diff --git a/livepatch-build b/livepatch-build
> > index 38a92be..656cdac 100755
> > --- a/livepatch-build
> > +++ b/livepatch-build
> > @@ -98,14 +98,20 @@ function build_special()
> > 
> >       # Build with special GCC flags
> >       cd "${SRCDIR}/xen" || die
> > -    sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> > -    cp -p arch/x86/Makefile arch/x86/Makefile.bak
> > -    sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> > -    # Restore timestamps to prevent spurious rebuilding
> > -    touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> > -    make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > -    sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> > -    mv -f arch/x86/Makefile.bak arch/x86/Makefile
> > +    if grep -q 'nostdinc' Rules.mk; then
> 
> This means we are still breaking livepatch builds for all Xen versions
> between your recent patch and the original patch that moved CFLAGS to
> xen/Makefile (commit 2740d96efdd3009f8adb40aacdbcf05cfe8d1bbb, Fri Apr 24
> 14:57:10 2020 +0200).
> 
> Is this acceptable? (I mean, no one seems to have noticed...)

I've also wondered. I think a reasonable approach would be for
interested parties (ie: using livepatch) to backport the commit that
sets -f{function,data}-sections in their Xen build for that broken
window.

I think we could also consider it as a candidate for backport to
stable branches, but that won't fix versions we have already
shipped.

Thanks, Roger.

