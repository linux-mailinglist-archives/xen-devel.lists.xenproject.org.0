Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EA360C27
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111327.212931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3Hu-00030V-Ie; Thu, 15 Apr 2021 14:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111327.212931; Thu, 15 Apr 2021 14:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3Hu-000304-F1; Thu, 15 Apr 2021 14:48:10 +0000
Received: by outflank-mailman (input) for mailman id 111327;
 Thu, 15 Apr 2021 14:48:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX3Hs-0002zw-N2
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:48:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f933612-cdc0-48d4-8bec-85f2f644acf2;
 Thu, 15 Apr 2021 14:48:07 +0000 (UTC)
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
X-Inumbo-ID: 3f933612-cdc0-48d4-8bec-85f2f644acf2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618498087;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=faeL7iddZjGiUuXtncg8AcnuzvRxtBBFJDXiAyWZ/fY=;
  b=LnPnzo9WfKsXGM7O6yqz/ieDHOuoP3IcFBru6xCu7jERUDwph6sHnIzO
   NH54BY+Mszc7Ysogftgf6NEyo3yoDFE55IXbmKMgzGBvjBvBEJCTtffVD
   qKzNFXla3xQ/4pEoCM65KaNRXTW9SumcOSKC1RS37JJ9mRBRULjomk5A7
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DRdExUtJcUY0SpYEBuKp+xlgyMDwGarvJIm3pxcWxWC5xQXbLUDzsX+cb8ah8ziHgKqPTUiq69
 Nnsfr+VpVr4cAZ48+BjYlqC1jl8WJgZgtMR2eGeL/DH6FWmw1icW9FGioYcX5ScqQo445MnvD5
 x5sYCVuY1gvhXj+qAzAS+CNvm0L1Z6hSVIoi2Mcb8SWYBoAU1b12yEfeyIOvd99QStcsPq2yEl
 Sh3JaLOlCgShgebopULtGW9HL0M2OC+jJowBwNrZFWjYd9mb8NTxTe6qyU02g7de08R3BUzRZr
 1WI=
X-SBRS: 5.2
X-MesageID: 43163646
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9hJLqq/+DLfNbamCN0duk+E+cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2GmO2dxQxRLAod8KY
 GV4dBJqyHlVXMcaMm6AXdtZZm/m/TgkpX6bRkaQyM28QXmt0LT1JfWMTi9mi0fXTRG3Ks4/Q
 H+8jDRy62/v5iAu2bh/kDJ6ZA+oqqF9vJmJOihzvcYMS/tjAHAXvURZ5SnsCouqO+irHYG+e
 O82ysIBMh453PPcmzdm3KEsGOMoVVeiQ6Q9XaijWb+usu8fTomCqN69PxkWyHE4EkttswU6t
 Ms40ulsfNsfHf9tRW4zd3JWxZ2r1GzsHovnMUC5kYvLrc2Wft/q5cS81hSF4pFNCXm6Jo/GO
 0rN83E4u1KGGnqIkzxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRcw1EDzMISs38c/PsGOtV5zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIHz8fZt3ek7lmtrS2vEY9euqcJsHwN8Zg5
 LaSm5VsmY0ZgbHFdCO5ptW6RrAKV/NEwjF+4V73dxUq7f8TL3kPWmoU1Y1ifatpP0ZH4n1QP
 C2FJVKA+LyDGfnFIpTtjeOGKV6GD07aok4q9w7U1WBrobgMYvxrNHWd/7VOf7MHF8fKyHCK0
 pGeAK2CNRL70itVHO9qgPWQWnRdkv2+o81NKDb+uMU2bUcL4EkiHlRtX2JouWwbRFSuK0/e0
 VzZJn9lLmgmGWw9WHUq0JkJwRaFUQQxLn7SXtFqUsrPirPAPk+kuTaXVoX8GqMJxd5Qc+TOh
 VYvU5L9aW+KIHV4zsjBdKhOmezlGASu3qOcpcZlsS4lIfYU6J9KqxjdL16FA3NGRAwsx1tsn
 1/ZAgNQVKaKinjkpy/jJsfBPjWcv51hAvDG78RlVvv8WGn4e0/THoSWDCjFeqamxwnSTZvil
 ptyKMHm7ablTGzKWwwvfQgPDR3GRSqKYMDKD7ASJRfm7jtdg01d2uMiDCAozwYe2bh9Swp9y
 TcBBzRXcuOLktWu3he3KqvzUh9cX+FeVlsLlpgt5dmKGjAsnFv8OOCa6apyVGNYl8azux1Ck
 CDXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfANdarQ1n7FEvz+qYg2W9tvuLBrO9DlvrVVDa
 axewqJICj5DO1s8QqPvXohMDR1rn5hsf6A4myR0EGImFoERdzVKxBaYpteBfe2xW3tXeyJ35
 V0lshdh5r4DkzBLvq9jZjKZDtCIC7JqWG4T+sUuYlZ1JhCxodbLt3+a3/0z3lJ0xU1EdfsmG
 4fSKp95qrdOoUHRb1nRwtpun4glNGCNyIQw3fLK957WVEmlHnAOdyVp5LOtLo0G0WEzTGAcm
 W3wml4//3fWTGE2qNfI6UsIX5OYEx5zHh55uuNe8nxDwqtHtsztmaSAzuYcLVHTrKCFqhVhh
 Fm48uQl+vSThHG4mnrzE1GC5ML1X2mT8O0CB+NHuAN0+XSAyXxvoKapOipjDn2TjOnbV8/no
 MtTz1XUvh+
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="43163646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfm+8u4tfJ3YSPyuXoJvFsdLLfUyWQB2lXjT8tMuBSanqUJGIpaG/vBIB41YKXXNr1DCxkT8zAbNryfiI8kLoeAX63KywQZEpmX25cKqk3NGmjwLbOOJ16tqMGmEQPKZ4gB/YssKT4b88XY6BoGQcDrjeATh+YczQzUsKuOAHV5GOlAwvNIcAdFVN8KaNaSExsqbVru4E6SgnGJhnIqXsrI/3sUganlk6/swXTQDQ49iuPKG1xj8tv2mhWCKq9xoJfeQfoTsSaIyRKyO4Lq/U5yBuwU+pMFBiOhEap0oyAM70dHgKcAXtsoUKAvBZC+gIGwDW9ynZNLX54AhvBrSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMDcqqnOZfcCV9m8aPgUdHoikxshxCw4e5B1OOrT0OM=;
 b=acb/FDL3Ch2M6A4xJxTBQDHalRkAFIoYOWD3P8yv1cn3jAPY4YcCGJqw69biQIGvtegw8jGiD2LdK2yZc+zTVZnvTFQtiY20yI7HWb7f4xTzMXUkYBrFhpmhpMMBGg5/GYmWP0R+nbUQh+vxwyKf5cgAwUWefwze1EuIOr7uZgQtZpVteCC96IVyysnFdmE0IIeI10H532HEcwU5cOQBRW7nOZg3pE0xEReQ/gKznai3UFkhuWR/kKpijfbGh5Q1RPdZVjrf+OdvjcraMYuZ8aPXfqVDnC+T/BnWtVeeqw9h5WSuZ0Xfsh0Nj9WXouleyK1RD/cha4EKzxcHMfxD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMDcqqnOZfcCV9m8aPgUdHoikxshxCw4e5B1OOrT0OM=;
 b=tSnFXlH+IcQQ4aZTGk7dtdvGJusIKr5LFek51gWD4kOjpcFHmjNJd7u9IErETrIh6ymqY8BFipSXCdJrffGeomTZPB1/zfDHGNMOFh0ejmi5cVgJDx9VxkmdbWKcJ/bKJMMMC0Bq+McxgdoXSX3KNuln+2RIKgWum3yNDtxI1Qg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/2] x86/amd: LFENCE always serializing CPUID bit
Date: Thu, 15 Apr 2021 16:47:29 +0200
Message-ID: <20210415144731.3356-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8378e9e1-48b9-477d-c17c-08d9001d794d
X-MS-TrafficTypeDiagnostic: DM5PR03MB2843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB284368D0A4D36197D5A43E928F4D9@DM5PR03MB2843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JWRvlCyRUOP41CRUy8oO2uMLs1390bmC/mHjXDRo9nZT9wrZWoVWEHwoWGvqBG0FWZ6tY9QAoJ7d8MXEVCW4RwenMd3DJk6x2mr3GJw26kXB5/ukSauvE18sxvtDm3OiWDAUFBOLGebdXAIq50dDA79EHIDDeljkvReHURnDGTczaXWRkhM5UcC9EFNdKclJiTiOixbOhL3tJK072Bwc6EY2/yfitN/OREmltzHuvn4bMrLXfrNBRylRVoFkn6BNClsuNlNf8TGPsyoIxI6DEv9v9lTWbISep7t1cWCaySIYPRIuT8bZOHGYp0S6cEvpdo1HkSTP6NR5QyVaXsa3IU8a430kFcbnoFibRbjEJM7AiIuLCNq4kzaeA1JLQqeCuo7+31bR3Aofr6bPeV/JooqlHyhslopnlGttKb9zTXdW+y34y8bQpEoGYudA4MdvXzM/rBb+pS3bL6Gqou7/Woka0BGNx0aP2j2JEY4pdOQy0yrlaXFXMDFkl8kMkVxryn5sJhKqNZr+ujIupBlz2cDbyFICCoDAVZ1pmq11/nn56w3raSVWV5R0xvkMqLAgp7gqKO60U9YTV/Qd5wvSE4Qx/wwe06QpdcnXSAl/xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(956004)(478600001)(38100700002)(8676002)(6666004)(5660300002)(1076003)(8936002)(66946007)(2616005)(66476007)(66556008)(26005)(2906002)(6496006)(6916009)(6486002)(107886003)(83380400001)(36756003)(4326008)(86362001)(316002)(54906003)(16526019)(186003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VldSeGRxTktnamdmOUl3L1h4dyt6NFZJNzhhd0xyRGo3d3NyaysyR0NzcUtU?=
 =?utf-8?B?UDFnZklqWXRTYXphQ2FUeVhjb1hCTko4VEdNYjNHN3J5a3dSS2dWMHdQY2FP?=
 =?utf-8?B?UVlCZGlhSUtFWXRNQ0haMGlpMkthcWRSNFh0aTM1WkdiNTc0OUNkMy9OVStp?=
 =?utf-8?B?Z0RBbFNGSzNtZC9UV3p4a2x3eDdzRHh3RkNGb052SUpob2l2VGFmZndROHhS?=
 =?utf-8?B?Ymx0Y2F6U2FBaHhycmVSMVhDbW9oWk9mdVRaL1YrcmhxeGY1NHhMYUg0VTJy?=
 =?utf-8?B?UktHK2IvSDZxVkpjY0J5cGpuSjloR1QyL1VEdEhFVmFhanJKVXpjS2EwSWFC?=
 =?utf-8?B?TyszaStFUWZXWXFwVmorTWRCNjRTTmwvVjBNMStKdFdRVWlad0FKWEV4L0Yy?=
 =?utf-8?B?Mm0vTHkzTDhJRnBOdXBmWms5VGd1UEwvSHlFd2dpUHM4S3RXOUhMeGV5Yjln?=
 =?utf-8?B?S3k2ZHhObm1IRWNYc2JhM0gxTFN2bnd4TWRPbVdOK3MrRCszUVNCR3U5ZjBw?=
 =?utf-8?B?ZWwzNDhJcU1qOUFzOGVmZklFS1dCL3JURHcxMnFoRmFDNFdjM0t1elB0K1lq?=
 =?utf-8?B?UEE0YTV1UkNhMnF2Rm5tZysvWkpuZFNtYThkOEpPWHN5ZG9FamFURTVmc1lz?=
 =?utf-8?B?MkdrSHZCZ2xxOHlIMHA3WThQZUlKdnI5YVlPbGhNK0JtYVZ2NU9LUHhWKy9X?=
 =?utf-8?B?VThlcE1pVzZkeTZwTjR3WEZ4QWRuVzF4TEVyUnlxQkxzcXBMTDJWL2pTdTFw?=
 =?utf-8?B?Q01GZ2p3YUFVTjg2bEhUVzZiZjNUb0JQcWlPS0xJRXE1Z0JPdWlYQnBFWHVj?=
 =?utf-8?B?RHg2T2VVTjNMbDJJK0pVWWNqeXFBZGgyKzRTU3NpY3RtLy9rcHR5c09BVXAw?=
 =?utf-8?B?VUJQZTRYTVVIVEZ5VHlLS2U2akNBT29QVmIvOFlSNGIvUTRRMFl4L1dZaWZ5?=
 =?utf-8?B?Q3p2STNwRTRuVEkzYVVRTU9OcFJlcVMwK2E5allUREtzNmRKczFHL05nU2Nr?=
 =?utf-8?B?UjhXRGE2U1pEcS9KNEpSUkpEU2hHTEFGOUg5cUN2SVJZVWVuZVhUczZ4SkEy?=
 =?utf-8?B?U1dYRGpaZVgzZUc0bUpHMExuRUZoVkJnWnAzR01ZUkVzMXc4TDc2dnVGODlY?=
 =?utf-8?B?NEVHbURFTndiVlkxNVlzb29MdlR5RXZMcitGZlN0M1pRSnlQRWRHV0JxRnRV?=
 =?utf-8?B?dzFzbFJhTTRjeHYzVUcwbjA2YUlRdXNWeGhSUXVXQUpRbmF4ODFaa3Zra05r?=
 =?utf-8?B?VGsvdER1MXEwV1JIbVIwbXRoWVJ6VllzbEdJZVF3dnNZMDl2aXlxSkNEbFZr?=
 =?utf-8?B?blBEWHBBY1d2ai9qb0ZDenc0Y2pnaXFFazd2dFpYbDNLY0N3T1hEcFMxZFQv?=
 =?utf-8?B?b1RlMTlPalZZRS9NS3VCVW1zT3U4Nnd0R3NySy9PdnlUWnJEeHMzdzZPWmEz?=
 =?utf-8?B?d3NjaWdHS2V3Wk5iOC9uMDZzeFhKZTBheG52eWsxcEErWis2YTBtRkU5NFJY?=
 =?utf-8?B?L3lna1h4THJMdkJKYUEva1ZsTHNYR3JhZkFMdGp2L3BVYnZld2FRa1V6Wjh2?=
 =?utf-8?B?Y09xNytmcmZQK3lGemxNUDF2ZXdsWnlleThsYWU4QXdwWVQwRmtkNmlSTHZ6?=
 =?utf-8?B?VE9QdXhYUGlFS1pNeXBoVHpXQzA0Q1c1ZWFpRHdKYmdXMDBPdXhPaTJPcGgw?=
 =?utf-8?B?a2ZNcVlvK0lhVUw4eW9sTjBuVUd5bGRIZ3NscFBtdU5YL2l2STZTK1pOOHN0?=
 =?utf-8?B?RE5PbmdyTS9TQ3ZKVjQ3NzFxNExLQVZybm91N1dTU0YycmlRWGtqY1picm9x?=
 =?utf-8?B?SmxJSldJWnByZU1JZEVZZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8378e9e1-48b9-477d-c17c-08d9001d794d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 14:48:04.0036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5e7iP75opToByPDp+QXnppM5NXz7GsyBKjpoNl2jZSrMFutVq0K2zGH3n9L12agG83lsm2IKTS2F4eEqyGWCOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2843
X-OriginatorOrg: citrix.com

Hello,

The following patches aim to add support for the LFENCE always
serializing CPUID bit found in leaf 80000021.eax. In order to do that
the featureset needs to be expanded to support leaf 80000021.eax.

Thanks, Roger.

Roger Pau Monne (2):
  x86/amd: split LFENCE dispatch serializing setup logic into helper
  x86/cpuid: support LFENCE always serializing CPUID bit

 tools/libs/light/libxl_cpuid.c              |  2 +
 tools/misc/xen-cpuid.c                      |  6 ++
 xen/arch/x86/cpu/amd.c                      | 69 ++++++++++++---------
 xen/arch/x86/cpu/common.c                   |  3 +
 xen/arch/x86/cpu/cpu.h                      |  1 +
 xen/arch/x86/cpu/hygon.c                    | 27 +-------
 xen/include/asm-x86/cpufeatures.h           |  2 +-
 xen/include/public/arch-x86/cpufeatureset.h |  3 +
 xen/include/xen/lib/x86/cpuid.h             | 37 ++++++++++-
 9 files changed, 94 insertions(+), 56 deletions(-)

-- 
2.30.1


