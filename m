Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323BA44AACF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 10:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223836.386752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNjB-00029R-E9; Tue, 09 Nov 2021 09:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223836.386752; Tue, 09 Nov 2021 09:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNjB-00026h-Ae; Tue, 09 Nov 2021 09:47:41 +0000
Received: by outflank-mailman (input) for mailman id 223836;
 Tue, 09 Nov 2021 09:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azzv=P4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mkNj9-00026b-W1
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 09:47:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 119e4767-4142-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 10:47:37 +0100 (CET)
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
X-Inumbo-ID: 119e4767-4142-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636451257;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=okxqYjJoIPhDb7qPYkRrE58KXKpnf3p4OmPG4Q8TWKo=;
  b=J4UXw0r423mor4/D/iAK9LXMHsTmRjzaaq/nW5FUnl/RmDT3f+G05qgs
   NmlZJDyO8+H241oICQPn8j/zHHtYqccmDarg+wdnv/pHH0Kf6RbZ8bId4
   7J5h5aoLsXyy04xGf1lyZG+v49P5pgl7cm9xDv1/zPmbPIVtkthiudFIP
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: t/XEZCLxOoIU/P+8BrG220NJ1VNDdfhJeks9zohWooaxKqH1v93Ay5AazHIveR2Nw53dSW0uQ6
 RNGCehqWNXdAfUabvWVdyvBo8KYCNmRssUMsD4SHQonLFOC5AoM1i5VN6NSoozQuC2BwskyNKK
 x703p8wnRELdyBFjrUi8XQiSyr84H/BFlwcs8TJaiPg09wV9kUexh/hKa3XGCM0HSBhpdw6bC7
 3v0TDrUvXbOiKbc25MvKdxhzkcXmtGiaxHnhCCFcAk90Rz6Hspv0HuV0h60L8kgh+ZP6uQkpcn
 OYFbk0vo9AOkLxb8ETTpF9rw
X-SBRS: 5.1
X-MesageID: 57354191
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Wb0YM6AhfprHHRVW//Dkw5YqxClBgxIJ4kV8jS/XYbTApG920zBWy
 2ZMD27VOKuOYTTzeN5/YYnjpkkGusWAx4UyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540UM7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2hK2v4tc7
 c10hKPhEiRxNZbDgOJAXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqRuIMBjW5YasZmPdDYW
 s0YYhRVYhH/Z0UIFwwOIsNmg7L97pX4W2IB8w/EzUYt2EDS0w5ZwLXrKMDSeNGBWYNShEnwj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVDjqHgCWpmwYlauUBSM5i4zqC0qyJ7FPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNhr1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/Aj3NAuBRPtfNi2mUBb7zt6sowGGxFAjpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmr2pSXyI9ELu28kfS+F1/ronxezP
 Sc/XisLtfdu0IaCN/crM+pd9exzlcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5HXlk4BCbKmOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:NSNnHKuKcHGFEhxVBGNvCmjc7skCv4Aji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H6BEGBKUmskKKdkrNhR4tKPTOW9ldASbsJ0WKM+UyYJ8STzJ8/6U
 4CSdk+NDSTNykDsS+S2mDReLtAoOVvm5rY4ds2uk0dKz2CHJsQiDuRZDzrcHFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29EOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6Q030Woqql9jJwPr3KtiEnEESrtu9uXvU5Z1S2hkFwnAho0idzrD
 CDmWZ6Ay050QKtQoj8m2qQ5+Cn6kdv11bSjWaCh33tuMr4Qy9/JfZgqOtiA0bkwntlhcp71q
 1T2WKfqt5wNjPv2ArAx/WgbWAxqqKTyUBSztL7S0YvDbf2IYUh07A37QdbFowNEzn9751iGO
 5yDNvE7PITal+CaWvF11MfiuCETzAwBR+IX0kPusuHlz5LgXt+00wUrfZv6kvo2ahNA6Ws3d
 60eZiAVYs+O/M+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUCN2jWo5D67b0p7KXyEaZ4gKcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmlLYCbfhGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7Z7HCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8VHscmKofla68YN7EaDc8eRWwoAJOopAuhNQk1ij5s2QbT1EqLE/e0
 FzZLPr+5nL1VVf1g7znhRU09pmfzBoCZnbIgB3TD4xQjTJmOw4yqqikEhprQm6GiM=
X-IronPort-AV: E=Sophos;i="5.87,219,1631592000"; 
   d="scan'208";a="57354191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4ZfVSN+SPpcUklbez+xALbi9kVFR4oyPivKBybOcJs4+PoEOXNzs2Lk0SveZ/aBiinQzm6IB+F8F0/fX1fxM1l+zIN76PqlGS8UBrKIgNikvgEXxHY1zvZqaFhAeNtPqDK/a5pd5bET3EXOM0SeIdLWJD0CMRwmRa2kE+6UlP43AfYdn41NkIovaUD5pDpmF4rIcyQ8YnID1OZ5jgMTsTvb0xL1f2BA61DD0bbIiPaRzf1+noMcCDMWWwpklHxOH82rtXzWiCBPHYDbfMskDkUGtpHK6z0R4K/NevdV1Rnk/m5Lj4cIOySazypf9BNN+P1NYKFrtkVq8Px3rZCRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UGp35n62W09+BRbImWVllLPgSe870xztQmojpqzhAM=;
 b=Amz2jfSr/Tsgyraff7RmUWxINGkm6MRk22r1JBuClALmAKmHZiqTj/Bd51UPy/FJx4MEY75IMy5pMpXEjNLajRUCTAIREPwfqjkdvkUVnBJVOCPTBZK8hsJdwOVw4Ibw+YJgdtT3LmeSG++skZoq5efM/+23KamF3g99ESeOSEj0LJ5raEUtybQhWmF+RLZ3Jbhs0Bm2Wiqg2oK51UGyFMY6tEOHXy0+yo8uAs9Ul61EBnzfbEiyTKkyA1UFI+V4fQhaIsvE8Xz1GoTRO/PG7YKgFqtYDD/c+fbMVD39WVdUTmg+ecFAVsH+8R+EudQT76gUDAEa95vlLpg0q4ye9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UGp35n62W09+BRbImWVllLPgSe870xztQmojpqzhAM=;
 b=X9r/PYuXIG58pc3/DxRTLM1O4lR0jLH8mMH23q3Ui6UX2TVlh5yo0UHDk9iou15nlHl3qdqAIZ0vU44jVg7T935oTIpjhJzm3NZHfRNbiK61kquVjGaS3X5kA21VdB7NGHK2EbdY1ME2CzHlK1pa3iSSpzxoT0A5ok0qDXWr528=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16] tools/configure: make iPXE dependent on QEMU traditional
Date: Tue,  9 Nov 2021 10:47:21 +0100
Message-ID: <20211109094721.53346-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0bd175d-5f16-4dbb-a0b3-08d9a365f3c5
X-MS-TrafficTypeDiagnostic: DM6PR03MB3674:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3674E528E4B731D5975549198F929@DM6PR03MB3674.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s5QYwsuzZq+IHQZ7eWKxBRwZMRidDRbKNVc4rm6h7HxyRAfhgF8K/+xDGPu8odzChw46EKsN+3/0X5oefI05eBpD1pBnhM+tx+sFu7JEZ6ADJopb2xu+sCU/hwyggPm20KNMYzl+FpKXA1HTzIfU7VQ3ZEyLUzImOk1ttexz87pWexRvmTzuQ9iJMcpuKXlYlzjiCRSUvlCs7HDg+1v7qfnJGXFTsC5+XzVqGjY2ZbyyFcC4Qn/iWgIvEslLcfAy82TTvQjkDBwoXv8EP50W5bcpMKhCbd7UNmRRnFJkb5bnYuUx7PCYFR6rycYWKWuuZFPkkSrZXWi+y+NrC9r9F9iKDO5oO73F3WnbSEQojvFR8XMRPrKq/MSpGsYId0Tqe1XSIEDykLZcH0BvBdqbB7/81vS0qZ9ytL+pnPB3Y3qZWhZAj9574ZnoS5dbEF6ZF6uMVWwde6YorPkiA+x/+DDamvK/actE9T6KPPBN5qa1LEXjxO+2uo9/2ODuhjb7NCJA+qPieYZIMyMp/F9MWsiRkH7gfRzQMp1ZNNcjFulsC2DAlvqWL9uMG03YZTBb9MV4M8CXrzPSLSyAZHxoynYDx+/qV8ucVg6nWfcIPHLxYtFi2bHIhRn06mPqBHcMzJDzaCMh5yrrd+r7YJQhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(2616005)(83380400001)(66476007)(36756003)(54906003)(316002)(4326008)(6666004)(508600001)(956004)(6486002)(66946007)(38100700002)(82960400001)(186003)(6496006)(26005)(8676002)(1076003)(2906002)(5660300002)(6916009)(8936002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmpjMExIK1dtZWVad0x0OVlDZHNFOFdvSnJTaElGTlpKODk3RlNUa3NPd1F2?=
 =?utf-8?B?VC9tUlpCQTRZR0dJaGRIYUFLdS96cmtnUXRkM091KzRyS3BOc0VUemd5MFMy?=
 =?utf-8?B?VUMrbEsyaHR4WEx4bWFpWERxNWM5WHA5QTQ0VW9LdE9NWnJWWEhObTQrb1ZL?=
 =?utf-8?B?eGhhRC9qVktVOUd4ZFBQd1hsSWM2NnhtLzZ1K1lUOFJkTDFOWHVvYzA1ZWor?=
 =?utf-8?B?TTU0ZEVZY1R1blQ2cXljNWVJdkpZMTdaVU4xcDM2TWl5OUdPRytWcHlwaXNS?=
 =?utf-8?B?R3pSSjBFTDh1UjdrRUowY3ZhdkdUR3l1ME14NG1ReXpqekpXUXo3YXRLbkUy?=
 =?utf-8?B?SVlHdUdydEZQd0k2QnZ1Ukp6d1Y3b0tCRmlDbmxLbTVLOWJjS21tbzQwTnJp?=
 =?utf-8?B?Q3JBRUhTT1loK2ZEL3NydUxxWHM4alh2VjVGdGFPRk1sQ3FJQnozb3RxWCtK?=
 =?utf-8?B?dTVqNlhsR2E1dUZnVnU0UUFxbW5JS05idjRBeWdsaWtzVjhZa00xbVNKcjQ0?=
 =?utf-8?B?cFZON3kyajA2eDBSYk9YZW9wSUNqRTNkNGxpaUNXWUIvVGdFZzdSNnlKTEdz?=
 =?utf-8?B?YldkUHp5MHpvQ3ZvSUd5aEt2QmNUTnpoWkE5WnZGUzdVSC8zcEhIMXk5RjJp?=
 =?utf-8?B?UzhTSlJkc1NPVEx3UFo0bkg2aHozbDJ1WGM3NjQ4amYyNmVhOXpQakVDZ2Js?=
 =?utf-8?B?TGN1N1RHWnJXZ1hiVEdqa0R2eStib2t1Qk5LZ0ZEbHAzSGVLVXFkTTRUTm9r?=
 =?utf-8?B?UUtkcnFHdXlzUmR5emxrUWJHQ0ZvZHJWb3laOEdreUhObi8xUDhGRm80bDI3?=
 =?utf-8?B?MnF0eVdoc3ZLU0dmT3VncFJ3ZkZ5OGtvS3Byb1dVek9qMC9iZUVsd0ROUXE5?=
 =?utf-8?B?S0MxL1c2U0NRTkpzU0lPdE1qSHYvSHo2UFBZZE51QXJhL1NrdXJnS29jemlK?=
 =?utf-8?B?QnV3dVN3ekJsdTNzdXJCb05ZQ1lqNVVjcHpvOGZoVGhZWTNHQVAyWG9NQ2lE?=
 =?utf-8?B?dnY0dWkvYUNOcmJGY2k4WjdIRm4yc2tYM2dqaTByRGlwZ25ROEx6TEdoeVh1?=
 =?utf-8?B?dzhCU1RVQWxPMVBxbXA2ajlvQ2NEbDQ2Ukp0alRIUSs1TVhWS1JRbzhiUXZN?=
 =?utf-8?B?T3IyUlRDVlN0YmVJOHRzMnBmeTAwbGNrWHp4MzZ0NzhtVlNxTWoxaW1qbG1N?=
 =?utf-8?B?MzAyVHI3eUFYVk80NnRRTHd0N1Y4RGxpQkxUZjhhUDVEK3FFSjAwejRJS3Yv?=
 =?utf-8?B?cjkwYmFnblZCcW1iTFRBZGpkZ0M4WStvL28xSlhxK0RyMDB4dFo0dysycmcz?=
 =?utf-8?B?TGJHNDRydmJhOXFOcm1CdjhYenIxQ1g2NVlMbW5WSXR3VHlsUlFVUS95WDZ6?=
 =?utf-8?B?UE10dnFwVEdsY0NEQ2ZNNzJuMzJYQW80YURWNFM3UzdxVU9XUmFiZkRBd0R6?=
 =?utf-8?B?SWdqQkNIUkE4NnBuTW5jVDdEK2lmbVBnTkZvSGVjajVwYllFTGtWc2dyN3Rn?=
 =?utf-8?B?VzN5bFlyTUpMcWN3RkluSVpCcHhuemRjMVU5ZkFTbUNrUFNpWWkwSTZVU0tB?=
 =?utf-8?B?czFWc2xEazNNV0lnNkFjQytoUmRWUkhHRnRYZGlHa3JrdHB1MXRQeE9EQ3lS?=
 =?utf-8?B?aUJVNlloUUQ4Y3JiYWNEMXNnQWdrSmpuQTJSRkJGY0xEUStxQ1JaajArODVy?=
 =?utf-8?B?WDJsR0tjTmMrV043VUNqY3J5TEVrTWxFL0tOU2QxT1BsYTFNQmFNakVIbVRh?=
 =?utf-8?B?S1hXZUJtNEVJNFdXcnc0S0xpWktnTk1TeS91SzZPWWRSZi9EQlBHUDdnd3FG?=
 =?utf-8?B?RzhUSVdmY2dNMS9lTmhrTkZPVzVsbEVQNWJpSVZiL0tvRjhGM1hBWnRRVXVs?=
 =?utf-8?B?K0hSbmV1Qk8zTXMxSTFKL1EvWUo3TDJkZGVpVG92WFVEenFZNG9yMUFXbEpR?=
 =?utf-8?B?SVRHczgyOHo2ZXBBekZMei9TWEVEdTdFVWJsV3hVOWdKUzM5aG85b1N3MXFU?=
 =?utf-8?B?NWw4NEt3eHUzSjRTZCsvSTdVcTNnSys0UEp3dTl4Qk4zdDUyaFNqRVRML3l4?=
 =?utf-8?B?VWt1d1ZTNVBSZzBzdVljRFNYYXZMSGtaekJJSlphSXBzUDkvU2RVZUs1aVV5?=
 =?utf-8?B?QXZITGhtNmN6TXdvQXYybjJ0bEJ5a2pCTlJMT21JQlI4czhwcUZ1NGV6UkZB?=
 =?utf-8?Q?sTuL1GihpSweVIUwUFzuBeY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bd175d-5f16-4dbb-a0b3-08d9a365f3c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:47:32.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR2CgryM7PWCvaPQvNchtRzkHhlRTPUlIXgxCVdjsfQpg2fWBzKoTVJQa4uUHuBFLeNQQDNjv732HQCX8qjgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3674
X-OriginatorOrg: citrix.com

iPXE is only used by QEMU traditional, so make it off by default
unless QEMU traditional is enabled.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: bcf77ce510 ('configure: modify default of building rombios')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Please run autoconf before commit.

Without this patch FreeBSD build is broken, as iPXE won't build. The
main risk would be getting the configure script runes wrong, but I
think that's fairly easy to check as it will either work on not. It's
a change in the defaults, but it basically restores the behavior
previous to disabling qemu-trad on Linux.
---
 tools/configure.ac | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/configure.ac b/tools/configure.ac
index 03eb7cf146..3ac62626a5 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -130,13 +130,13 @@ AC_SUBST(qemu_traditional)
 
 AC_ARG_ENABLE([ipxe],
     AS_HELP_STRING([--enable-ipxe],
-                   [Enable in-tree IPXE, (DEFAULT is on for x86,
-                    otherwise off, see also --with-system-ipxe)]),,[
-    case "$host_cpu" in
-        i[[3456]]86|x86_64)
-           enable_ipxe="yes";;
-        *) enable_ipxe="no";;
-    esac
+                   [Enable in-tree IPXE,
+                    (DEFAULT is off, see also --with-system-ipxe)]),,[
+    AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
+        enable_ipxe="yes"
+    ], [
+        enable_ipxe="no"
+    ])
 ])
 AS_IF([test "x$enable_ipxe" = "xno"], [ipxe=n], [ipxe=y])
 AC_ARG_WITH([system-ipxe],
-- 
2.33.0


