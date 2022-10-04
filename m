Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A515F42A0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415477.660061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgha-0002u0-Ad; Tue, 04 Oct 2022 12:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415477.660061; Tue, 04 Oct 2022 12:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgha-0002qn-7O; Tue, 04 Oct 2022 12:07:10 +0000
Received: by outflank-mailman (input) for mailman id 415477;
 Tue, 04 Oct 2022 12:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofghY-0002qh-Jr
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:07:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ccd52d9-43dd-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 14:07:06 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 08:06:53 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5593.namprd03.prod.outlook.com (2603:10b6:806:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 12:06:50 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:06:49 +0000
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
X-Inumbo-ID: 0ccd52d9-43dd-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664885225;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Uc9nxCDazcXQT9eB7t1L6/2bXfrac5yeEEi2OyTHOeI=;
  b=Qhz2M/NQIxaVWgks6MjAOH1mp9S6JOlqpe1lSxcqRODxHCfv8bU8M70r
   mbuRcfu8F44T0mU9q47+HKwE0hwUDfM7mLUd8qPzgCd+JV/NjiMEtYqtk
   Te7pPBDf8H8DmdJYfMEGeCXmu31m25UI1oGciyRs2Sc+VamGaYqfIMTCr
   s=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 81925127
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eIwL7Ks8jGNaUPu0gaH6gCClxOfnVGBfMUV32f8akzHdYApBsoF/q
 tZmKWvSbv6DMDP9c91/aYWw/E4A65LVzt5mHlFt+XowRSsX+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI01BjOkGlA5AZnPagX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklO8
 PYbeT8iPivdnsmsyuulUvQ9n8oKeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+WzHmmAdhNfFG+3sNPj0C9+2JDMhBVTWSBuMK0tmyead0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaGSUTN35EWiYCQiMM+dylq4Y25i8jVf5mGa+xy9fzSTf5x
 mnTqDBk3utDy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHs4ji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:GaxI+aMCINTtSsBcTyT155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2cqYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+c/DqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0GnQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloAS+0koJjHfw//Zv70voxKhNNKWs2N
 60TJiAtIs+O/P+PpgNcNspcI+QNlHnZy7qHSa7HWnHfZt3S04l7aSHqIkI2A==
X-IronPort-AV: E=Sophos;i="5.93,157,1654574400"; 
   d="scan'208";a="81925127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6rwlMLp/kbN8OWP9SCX8+0Go+OrPwmLE5fryBH7eo3KQkFxqtMc4AUiL6h2IAbtbCJytTwNdNbAScwWTZKSJf9XuePcv34lYOOJo4wbpKkYxClb1H9r4LjqtEVJjqu4ZR0wI+Wde0fn/vHTig4+YUitQZ3rvFTVliPpC3p+IaSEJTm9rIHC8wEMLFGTMcvk813RAP9TOzgWGDZb5cWR+8Z3diblM06EZoGcbde2ZWRch39yT/YXhEd3JMJCPWvc91+6+nBT8s9KTIA6V4ZBKDfK1VAFFBGhcj9wKED5kTZI4Hj7XS+1mw0p8Po/vR3t5v5p3uiwF+5KcQSuI/5tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4iIA9BwVLc9QXtOKtR22v1ZaR9jnj1A2ju7nql2yZs=;
 b=l4ApXTXskdKROFPLSkNnQuNJSuyRBChiJuEoYHZICzOi//PSeb92Ivz+mOBb7nhzci1FIbqd7sUpb2ld16CVXzc2iUPWN76ki7k1vHyPP8RyfrXaUx1AKlRjRBYtNAfY1a8+ufVt/VQi1mZnOhHEIKgTWO2pXCnw1z/4XQjACMyGexLjot36Vo8cbjeJ0heLI/qxmMyBd+GU9dqGdCJ7GBS9gaix9/nDyOxLoACO+W+UtqI4aB64DXyP4CydmXVfjtFwhwNtGLFitjcaj7NgWhbXzjn8tgpRk1a+9k99W9P1g8YGWnc6mKX7XRSXbyKaQhefEfRtlg+aa1DJc44tQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4iIA9BwVLc9QXtOKtR22v1ZaR9jnj1A2ju7nql2yZs=;
 b=tF0ADMxjBsT+YOXhwB4bSsYY2H49fBeOubtK6PuMaNMlfTEuTarT3sNJqRbTuh4tqnFqO4x/gOQr5Jh8v1IxnYobNHEurPalkumoXvIgJomjMM7U0HHQscrgCJFlluZ7+L5n/tGwZKm56TpW6WnliRWS6D7x9YKwVETAGPykXY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 14:06:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] x86/NUMA: correct off-by-1 in node map population
Message-ID: <Yzwh1OxOTZrSypbV@MacBook-Air-de-Roger.local>
References: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b810cdce-00aa-6cf5-05a9-acc7f3dbb8b6@suse.com>
X-ClientProxiedBy: LO4P265CA0262.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: f2569e3b-fbe6-484c-15cc-08daa600eace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FyKFkKPHAXGC3zfi09Zkx8LyKa2ePXc9CV08FSdaxbTnTagcVcUn+F9uEr7wZto1JtAfT/3qY4aCfHiKVtvFB8mvuptXVZIkesJaeWd+f6n8zMU6d+zyQS5UoWSad3qcl0NtSQ4GI2EdHgKU0veLncXJeKs48AcOFb8WRyRXCO+7HV+u6MykHXlTdaxHvYWarl9614VQ0y+FKomEjw1Fy1X+77PuJ89zGUZBvtBVmh306uwNzoMO3+Clh9Ssh5Xsi2f8VvyRZtiRMUagY4Qf6IyND0Jx6UQ2LKVhsimazkVxxsJDADhK7j1bhW8eCTzFnjbY+XtvXoS57JUZYcBp8H2zZ8CS97bh2a1+q+NXZl/pOgMN/fG24vbYz7vmh1EGAAA9gyjT2b0E/tcL2lHFI8mHEt+8QuedEJ1EAF8YGE61T06zozSzI9cYzReJuRkU7jY5QrNQkgvWcV65ZbsK9J+zVQtfLIPp50orfVJGMbD7EQB7Kc4AnQRg7WCoFUJ758Zxm4UF5ylYOD305dzZ5TEFmSWg/UloeHqcb4QHXAxZ1brbCFXEiLemprwGlbBWusR7Z5Iq6+n1wrmjwsu4NhIvIY/SynPZDQUBpGWbh35EStUiGkhFyS1Q2fY4VkqAXo2xUYMgzLdTiqf3keuCoWsMgAQUtYHo2czug2tm5W/CjuvPcV24YzNh4/EpmrjSs2v7JXokjfoa8YFjg1MC7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199015)(6486002)(478600001)(186003)(2906002)(85182001)(8936002)(5660300002)(54906003)(4326008)(8676002)(66556008)(66476007)(6666004)(66946007)(26005)(6506007)(6512007)(6916009)(9686003)(316002)(82960400001)(86362001)(83380400001)(38100700002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTFJMkZDR3ZGVjVIZWN0bzM3SzJ4Z1A3cXROSk5MdXlMZGxLTlZtUWc0N2pz?=
 =?utf-8?B?YjA4QkYwYmdRQms5N2FkMDlIeERYZXNtUytldWFtbkVkY20ya1ROS3VSMU9T?=
 =?utf-8?B?NFAvWTN5ZGMwbXFMcXhIYzZkb3Y4WTgyb0I3UHVKazFrMXoyM0hkaVc2ZUhY?=
 =?utf-8?B?RHJ6dm1OTDdpeWgxNFhocFNTb3E4bGFqOGFyZ3dJU0U2LzltZFpxZ1REQTlH?=
 =?utf-8?B?dzRzc0xVaEdSUGQ0dFBpNzZJTmhQU3ZsZmtMc2NJR0M0RENuN2JmM2lpcUNt?=
 =?utf-8?B?aUt1V1J6SjdvWlBlNXAvZzlVRW51NWNmYzdhaGxvYmhXd0ZvOWJReVQyMTFQ?=
 =?utf-8?B?UnM4bjhuR3dIeEhMaG9rZWFlbkd6eEVyUi9QNWFNNlNDaEFsak1wU3ZHbXJU?=
 =?utf-8?B?MmRkcG5tT2RlaGo4S2p1dVpkVGxnbGtIOWNneUNmSkVubFo1c3JNRGtpN3Zp?=
 =?utf-8?B?K0ZZb0V6QWdJTWdleXJOK1VnSEpEVW5RZVNiczA1a0MrZTlwSGhDejk2Z2tO?=
 =?utf-8?B?R2FjKzc5ODhBN2YydVhoOFFFc1RiejNFUGdHaUxJanlKZzQvVGk0ajV2QUVM?=
 =?utf-8?B?Rkw0c1lUeUl2aVEyZnZhTFFlUXpEamx1UldzbGh4TzZRYmx1QndvU2FneGNF?=
 =?utf-8?B?Mk81bE11RVFwZVViajJZek9RdVFGUldQVWtoRkNrQjdidEFYbTNTL2JSQm44?=
 =?utf-8?B?bU5xWWdORHVYTm5vMkxmdW5sdDRLSDFQUFRlc2I2S2lBKzZWV0MrbXZWOVB3?=
 =?utf-8?B?REltMmdpWTNlekdTWTJ3ZkFmQ09iWTZYWFdncjlESnQ4YVg0OGljT0dSL3l6?=
 =?utf-8?B?SE5WT2NqNDRjMEhQYjZYM2gzWTRLMXQvK3dMQ0NQMW9EcGlKeXcveDhobzFi?=
 =?utf-8?B?N0VTSE8zWUNjVzU0NkJteGRqU3J3eFNxSjJhZHZkeC9rVXc1cDFNa2N0L3Qx?=
 =?utf-8?B?TDZtdkVteUprVUZVZXlEVkZMait2Um56QXFkNWw5dlk4cmNhK0x4WDcwNFFh?=
 =?utf-8?B?bE9DUGhBUklSakJHekZDYnAwdVU5UHp1di9KaUxoMkhSbkhsVzJDSU0yY0hn?=
 =?utf-8?B?c09xYzJBU0hRdDEwRzhLdms0V1AyakdLZ1lBV1RMTnJZNkNsZ1BFeGhJRlZ4?=
 =?utf-8?B?SEYrM1pLaFRsMHFqNHhPeTRaKzRuejRLNE1aQ1dEQWwrbWJzMkg2Mk1vckZl?=
 =?utf-8?B?YTZjYmhtMDlPY05NNTJZRHRZSXhQYnhLMUhpcEQ4UFVPYitLd2JrUkNIRTJC?=
 =?utf-8?B?RkZEUVJOQ0pzUThETjJFem8vQ2ZYSlJTdzViRVc4RTNlMUZISm51YXZ2RmpM?=
 =?utf-8?B?NVNvWDhZcUVJK3ZvY0xpNHZQM3VBYmRpcHg1elUvK2w3NWxXblFqVzZMNEo2?=
 =?utf-8?B?b2VRd1QxQjgxWitlalU4ME9XVDhOY0FyaDZ2MVljalZCcGFka1F2Zm5iem54?=
 =?utf-8?B?aThUekwyNXR4Z1YzU3dXNkZ5R1NiQXFsRHk1Tk5rRkJ3S0RiTVp1Tlpxdlpx?=
 =?utf-8?B?c0ZNWGtHVWdpOElTMDZEbjJQdzFHMUdlR1NDNm9HM0ZpMUZ2ZjlJUlUxQmhG?=
 =?utf-8?B?WUEyeTBPNDkvUTBRaTNaOXlhZUozY2VDT3l4L3hQemN1Z2RlSENYUzR2d0dv?=
 =?utf-8?B?OW9FLzJMVWl1WFV4ZXYvdzJyTU1MUkE2YVB1L1Fld0krVnc0SGdxYWh6UlY1?=
 =?utf-8?B?K3NtRzhmV0hEbzBLWm41UkVhTTZEeEVtMUZLMHFOZnRnaThieG8wMjdNb2Va?=
 =?utf-8?B?eldrQWR3M2tBSVRvcFZVWko4U216TzZPdzhRSTlNNVhuQlVrOE9pM3BJd0gw?=
 =?utf-8?B?enQ5aSs5OGR3djBTOG0rTnczcVB0RGNWK3VUWkNaTDN0TE1XKzdZZzQ0K0FP?=
 =?utf-8?B?WWI2cDA4c3RMY0xtcWxWSVMwZ0xEVmk5MGdpazB5QUFONFp5ZS9pUkZ2QUZG?=
 =?utf-8?B?OThnMkZVL1l6WlVFQVdQT3NkQVc3cWZQQjM4RUdsTGhhSkxQSDQvVkJTbDli?=
 =?utf-8?B?REFrWGszbndGZXpkL2Z0NVZrOHI0bTF2bWcvMkRKWmRsWTBZM2g4MmRXL3Er?=
 =?utf-8?B?dThVeTlmalQ5S2VhVHppankyWFRMV0JMUFdEUEs3N2Z5RHkrUk16cDVwMjBU?=
 =?utf-8?B?akcyYmh2aGlpdUcrMFZHOEpzRnNsbTRKY3RiUUZQNTdEQm4rVFhqWWlzODhh?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2569e3b-fbe6-484c-15cc-08daa600eace
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:06:49.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaJEylFHygfnGqNtEKXgW8zZV1kKmb/twC39thZz1nXGq5T4VPoOorcc5Dh+O6KKT6l/pVmS3sNl9XblONtzvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5593

On Tue, Oct 04, 2022 at 12:13:49PM +0200, Jan Beulich wrote:
> As it turns out populate_memnodemap() so far "relied" on
> extract_lsb_from_nodes() setting memnodemapsize one too high in edge
> cases. Correct the issue there as well, by changing "epdx" to be an
> inclusive PDX and adjusting the respective relational operators.
> 
> While there also limit the scope of both related variables.
> 
> Fixes: b1f4b45d02ca ("x86/NUMA: correct off-by-1 in node map size calculation")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With this fix sabro boxes now report:

Oct  4 12:05:25.087462 (XEN) System RAM: 32429MB (33208204kB)
Oct  4 12:05:25.087482 (XEN) SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
Oct  4 12:05:25.171468 (XEN) SRAT: Node 0 PXM 0 [0000000100000000, 000000047fffffff]
Oct  4 12:05:25.171489 (XEN) SRAT: Node 1 PXM 1 [0000000480000000, 000000087fffffff]
Oct  4 12:05:25.183432 (XEN) NUMA: Using 19 for the hash shift.
Oct  4 12:05:25.183453 (XEN) Domain heap initialised DMA width 32 bits

Thanks, Roger.

