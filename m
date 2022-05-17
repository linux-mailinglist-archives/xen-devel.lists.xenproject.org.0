Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F552A69D
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331094.554573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAr-00061B-Q7; Tue, 17 May 2022 15:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331094.554573; Tue, 17 May 2022 15:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAr-0005yB-KJ; Tue, 17 May 2022 15:31:49 +0000
Received: by outflank-mailman (input) for mailman id 331094;
 Tue, 17 May 2022 15:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqzAp-0005fb-K5
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:31:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c812ec-d5f6-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:31:45 +0200 (CEST)
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 11:31:44 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4662.namprd03.prod.outlook.com (2603:10b6:a03:138::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:31:42 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:31:42 +0000
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
X-Inumbo-ID: 75c812ec-d5f6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652801505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/Pb4PtMbn80iE/cJjzQcmJPSFXHeH+Bckcrs+eHVMPg=;
  b=MLi1E5fjmFjZC3WWYVs0TY89eLM29YFYxcEzsBuVnCjYdxYt38Wtnl0D
   lqXucVzEYuvOsImIJs7gfqTdaptQplu5Bd7u7I2MNsPrUvyrz3So92MAC
   TuYPZqzgDQpg5xfORT+LD3Adlrooza6LwCpnhbCqUEpJEJrhv4XNCKb85
   8=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 71519888
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eAaCYq7/m/PZdAMnZ3VTugxRtE3GchMFZxGqfqrLsTDasY5as4F+v
 mccX2iHPvqKNjP2KdBxOYq+8hgPsMTXyYBnSgJv+y88Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgXFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSdRjYJY7/Ok9gMSjdzAiB/Ybx86a3IdC3XXcy7lyUqclPK6tA2UAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfqRo4MBtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGQF8QPF9fpfD277kBwr2uTjCefvXIKqXsxJvkWIl
 0z+1jGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvHiWzWorXjCuQQTM+e8CMU/4QCJj6bRvQCQAzBUSiYbMIB/8sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:oK1+jqHE/eUXviSXpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+txKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+wLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfhWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrzXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MF40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIYLH45JlO61GkbKp
 gvMCmFj8wmMm9yLkqp81WH+ebcEEjaRXy9Mwo/Us/86UkioJk29Tpc+CUlpAZwyHsMceg72w
 36CNUZqFg3dL5xUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71519888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7/ZcZR3ZZg02XHwTDOJVLVufYN84HYhWhZb7wIbHKec9ZwlWfURDl0YLujOoPdDdUMfR4kGSVAifR+st3QIXTx9KuO7V6krDtuPDLbcwOSrZiUcoZAZxWaagAHk4pGWHZdRnCBZxNQLeJhG6BC8o2LNMeolXasD+QaEwy/vWCN10xc2uRTUXZ/iLpSGCXwPp8Rb3vJs+AB38h3mSnRp2gngQtREIN7CCiGdw5fuHGZIQC43glmGER07beatM3buaHQIDHuH7rK0OMF1g3+JFjKst/Lk/KOCkaVATTaqTMKnH/VjbKk4xY9CgIXfh6ZhZ+BpJKNJUusr7O9ZU+9s5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxGtLGB+qBMQmowNUxyabNIKT+0uN2seU/MaxvqgRh0=;
 b=imoxos4EN7rOUJb9BiUkwIkXdZUTRAWTXPWHztwGRzWOV3fDnSJ7guPTk9Qv2TX3c78Z7mbBB3gv/HkGebB4ok6m/E6A2d+6WhQqk30HIcibRONKUid51zT8LVP3qthMIy+42rSoYV86vcJCs9dS0OeSem1lYcizhfyR3RZcf2oTrwaeLjuBFMG9e0YCQXmY1RuRHYkpCaxQMNCh3N1qslYZEGV2FOfsann3rmxNTIUBKfnNfzRrV95cgl6pSemvlK9PgOaHUecel2ODO38x+wpTxVbzsmWnS4PfZY+3wnNuQXA0z+s/eA8HpEIwAadvrvhFH4mDaqNaPF5p8ywagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxGtLGB+qBMQmowNUxyabNIKT+0uN2seU/MaxvqgRh0=;
 b=MbrnFGfTk7Kvxi53z7tsegmrXGRAITRaesh3R0O7SEdLOPUOUBJ50D41neYTt1HUxoPxXXa89nloRz/KEh5i8DQ0stYuidM2iiA1Pqu84vtdjXzKmPYO0hv6GDC0XCdl+Z8Js3tMbd29fEQbVHgtygPO2Cfklqy1dVyREJZp/EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
Date: Tue, 17 May 2022 17:31:26 +0200
Message-Id: <20220517153127.40276-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517153127.40276-1-roger.pau@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148d567b-bcd2-4a17-4eb4-08da381a582f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4662:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4662AEA99613999EFB81BAC48FCE9@BYAPR03MB4662.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UF3XLor2UABqBubKjKbAyhsTKBJe3N+ZvHwPleFbrv034dHicPsMqki7ifKj5ulwczTyQeijvHPiEDey2N11RoJkpQ3IhR3KUw883wj41ZprwINbWo5elVkh4xCVQDxaaWQEuX75jzKYAM7DFw0VJAYq0CInyEOYGNfCPjGdT9HYN/qxirLwJk/EXoALZsTJvRcUCJpnKNugPwb5ECH8zFSVv8M6SFLrf2XrEPoLuSsQKfaTp2MuxuHbRv3c0i5Tl2awv+sWQStzV1AkenN3c1WLerDITlTxFh367LMcaNa9gVVd8bQnD8z6pkhdejAJJvSZaAJSQ6ynDzSS16oCfqoBiXgGUvKWvkxY9CX+jyYG2hP2lJUGyfYmz89NEWHYsUbRdILSjRvp+iwxwuXS6XeVbuzg+2LCwM9EGR3x6JB29cqwuIBqR6kX/0dOGucPRF4sO/0hDQIujunAnTnLzQjCqtGweDHFTBAEEzhSH0EXz9ilfa2ZPHbjNouJU5hHOH/1hQIkypR/mCpeG+zp3vR/EIhQKsnVHe+VtvUV8p8bDvW2EadHrnEQ1t9vn1UZBcv80Q5JaYbV1cwUep9uEeZ40B8gNpnabWTIMzyofKDbzg3SQiFmDmYYJSj2OO7i8EBJmw4sD1aySuUMI+WwJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(186003)(82960400001)(1076003)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(2906002)(66946007)(66476007)(8676002)(4326008)(66556008)(6666004)(2616005)(5660300002)(8936002)(83380400001)(316002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtHbWtFOXA3NHhvRmpwRmlEVGlhcTVUSUZoSm5jdjViMVNhazdaa1M0TGVk?=
 =?utf-8?B?TlNGUjBVOVVSalJOeGhveWRBRHN0T284VEtkdFNqb0s0czMrd0QreXFkTGNB?=
 =?utf-8?B?bWtQUE5WSzdoaTB3R2JIZEVxMVZQUXdFNmYwWDVXRG8zaDd4bk5QRUlPTjl0?=
 =?utf-8?B?RUo4czNtaW1jd0YvWTVjdmpIanRiMFhMbitzTlVLcGJOWTNCS1hBY2w0UGt0?=
 =?utf-8?B?dkhsWCtWSVpoMXV1b2FHTFBmVzA4cGNjUzkzaERZY3g1VjlhTVVRZ3pKU2pp?=
 =?utf-8?B?OWhvNlJvOEtvcVd1SnZyYXQwQkJPeXpCOTdBVGJwZFo1UGVpNnozRVE4Q2dh?=
 =?utf-8?B?OU0zWEsyUHVKWWxUVDcxNGd4UTdVYjV0N2VtckFnRXZsVVRlNzNxVURQN2VS?=
 =?utf-8?B?akxjQ2FZbXNHMFZpMFduUFpkZ202b3g4UlJNQWhPZWJsRjVQZExVNm96OWJp?=
 =?utf-8?B?RzJQSUx0MTdRMldqQ1BhQW1FVDc4LzQwZUNUY2UxNzFSbE5IaFNUQzgwVGtu?=
 =?utf-8?B?dkRxcHJHYWRDRFJqM0k2Y1RnMWhWOWxBZGhDbWhzcmk4Vm9KWGdQMUVpL0pK?=
 =?utf-8?B?cmhacTFadndmKzdmVDdYS0Y5M2VGM0RXTC9HUWlMSmljRlowM2h4T05DUmxT?=
 =?utf-8?B?SEdMcjNUbHJZd1Z4dVUraWtVNHFLdFg4M3lnSzZ6b3N6eWZZakVCdDBpQXBV?=
 =?utf-8?B?NE1KWjNFN2IxcUMxcHNhTzArVCs0bzFWd2RpdGVnVk1Gank5aFd2UC9JczJm?=
 =?utf-8?B?T2dONzRHRTBzZStIWVNseENuWTJtc3QrcDE3bk9jd3Z1YTl6S1o3eVMxdnhw?=
 =?utf-8?B?NHBrVE1ZUGp5QU80S1RENFVrOC9ZcTR2UkF2dTVnZ09IRnZ4MEVEMmFTRDZz?=
 =?utf-8?B?ZUNJUHdGYXEweUZNVzNDYmRoTFN5bkdXeURXUXNLNjJKZS9aeVFaOW9FakZp?=
 =?utf-8?B?ZFZ4K2dHVUJYT1lFeWxxWWk0c0JvQzBMWlFYU1dNZXo5MEJWTUU0ODFxZ3hX?=
 =?utf-8?B?N0Y0NEEvTDZXRitDTTVHbWlXZ1p6TnhrcUpMWnpxM29XS1MraWRWQlRUWkNw?=
 =?utf-8?B?bTNnTzBGSUczcC9HNHA5Qm5yQWl1aTBzWFZGTWUrWEo5Qi9Wdm9PYnNzclF6?=
 =?utf-8?B?dUhEUW5mYmVUYW5wRmMwekRzdWJ6WWorWjJsM1VJSGtsM2p1cThxQmRrT3Ir?=
 =?utf-8?B?TkI1ckFUN0hSTERQb1F6Yy9CR1Z2U0xYWHlXUDJPTUlTYnFxL21MbjMyMnB5?=
 =?utf-8?B?L0Q2SkRKT3I0cVFKOFA1bWVpajlLTWhBbVFRQnpFc2tMK0xialdLYWtoQjgr?=
 =?utf-8?B?cWYzY1BXRlQ0ZWRlbjJuM0ZFUkJDWk95L2hoRnV5d0t3Q3Bsdmh0NzJydDg0?=
 =?utf-8?B?NFBXS1J6RUl4NUZoSEYvUXRoVnRoWGxzanFqNWtwdVVuVnZVbmlwMGtKUU5O?=
 =?utf-8?B?WXJmK0N1SnVxMmRNY1RWOTNRV3gvck01QU5SdE9EUTl3S2c2aTRWRmxrUUx0?=
 =?utf-8?B?ZnhpTWRBQ1kvYVFZQkV0WS9hSEI5dWdxQUM5YTh2NmtsNk13TnpNbGhBVHFi?=
 =?utf-8?B?Q3FSclIvVDRmVWhBSERtUzRhUjVTeDhNYVNpMmVFUkRPSlBadEFFYUhFUkQy?=
 =?utf-8?B?MnVlbFJqQXNVZng2cE0vOW50Yk9GR3BZQXA0UFVWWUtMSDJTSU93RnB2TEZh?=
 =?utf-8?B?ZlhBR0tXUTBGemJOUDJEZFJQM3FqVmxzV216Tk1iQWFBWFhZMWpTQ2xMRkRO?=
 =?utf-8?B?aXM5ZmdmdUhYZGxCUkIrUmhkbjRSYTUwc3VFYzRTM0tveDc2ZU5wRWtXQ2Rw?=
 =?utf-8?B?WnNVa0J3NkdMVjFvT1p1NUk4eUZpNWxvR014M2YvRHZGUzBpbEo2OVQ1ZDdT?=
 =?utf-8?B?SjhGN2JMeVN3RTkyRTF0R0h0cDZkMU1OQWVnN2IybGZtZjB5TmNoYUhsM2J0?=
 =?utf-8?B?QjB1QUFhWHlRcEJ1M0RiSzBQZjI3emVSdkcxUmJLMjd0TjM5WkxWemJWeEFM?=
 =?utf-8?B?QUhqRE0xbzNLc1A2akR3TnI1RzlWOW9QTUlmU3hKMDlxYlpFeTFqMTk3ektL?=
 =?utf-8?B?OS9mZUF5UEJaNFp2NHhZdW9URFl1aG0xd1pJOUE5dHRyM01YaFl4M1JWRzl0?=
 =?utf-8?B?dVd1aENGSHR6WEJ4dU92MzJ2WjVZcllHSUhvRXFhendxME9maFZlZ1N3QS9L?=
 =?utf-8?B?QWFGazJIeWViRStLZGFTL1pjS1FKb0E3a2RSMzN3MmV5U0VwcTMxemphU1ZW?=
 =?utf-8?B?VmJNUlRsZk5UUDFSNy9Henc4WFpxY3NxT0ozQmFHUmZQZzlOZmpsZFZDS3Ez?=
 =?utf-8?B?MWNyWmZpc1ovekRSR2dhVi8wS0s5YXhUTzFvaXBsTGVJY2F3Vllla2Z5bUJj?=
 =?utf-8?Q?mhgfeJVvOVgRfG84=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148d567b-bcd2-4a17-4eb4-08da381a582f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:31:42.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsK8HTOPgYuuLkwSnSdGvvmYlDCmhgDJrVkF+3RfwTKqmZQONgH7AzrhpPq+ymBogEPzYCTahhz5Tks/7oGqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4662

Allow HVM guests access to MSR_VIRT_SPEC_CTRL if the platform Xen is
running on has support for it.  This requires adding logic in the
vm{entry,exit} paths for SVM in order to context switch between the
hypervisor value and the guest one.  The added handlers for context
switch will also be used for the legacy SSBD support.

Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
to signal whether VIRT_SPEC_CTRL needs to be handled on guest
vm{entry,exit}.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Add comment regarding VIRT_SSBD exposure.
 - Store guest value in 'val' local variable in
   vmentry_virt_spec_ctrl.

Changes since v4:
 - Fix exposing in the max policy.

Changes since v3:
 - Always trap write accesses to VIRT_SPEC_CTRL in order to cache the
   guest setting.
 - Do not use the 'S' annotation for the VIRT_SSBD feature.

Changes since v2:
 - Reword part of the commit message regarding annotation change.
 - Fix MSR intercept.
 - Add handling of VIRT_SPEC_CTRL to guest_{rd,wr}msr when using
   VIRT_SSBD also.

Changes since v1:
 - Introduce virt_spec_ctrl vCPU field.
 - Context switch VIRT_SPEC_CTRL on vmentry/vmexit separately from
   SPEC_CTRL.
---
 xen/arch/x86/cpuid.c                   | 14 +++++++++++
 xen/arch/x86/hvm/svm/entry.S           |  8 ++++++
 xen/arch/x86/hvm/svm/svm.c             | 35 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/msr.h         | 10 ++++++++
 xen/arch/x86/msr.c                     | 16 +++++++++---
 xen/arch/x86/spec_ctrl.c               |  9 ++++++-
 7 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 979dcf8164..a4a366ad84 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -541,6 +541,13 @@ static void __init calculate_hvm_max_policy(void)
          raw_cpuid_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
+    /*
+     * VIRT_SSBD is exposed in the default policy as a result of
+     * VIRT_SC_MSR_HVM being set, it also needs exposing in the max policy.
+     */
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
      * availability, or admin choice), hide the feature.
@@ -597,6 +604,13 @@ static void __init calculate_hvm_def_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
+    /*
+     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
+     * VIRT_SC_MSR_HVM is set.
+     */
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 4ae55a2ef6..2f63a2e3c6 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -19,6 +19,8 @@
 
         .file "svm/entry.S"
 
+#include <xen/lib.h>
+
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
@@ -57,6 +59,9 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -114,6 +119,9 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         stgi
 GLOBAL(svm_stgi_label)
         mov  %rsp,%rdi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2455835eda..c4bdeaff52 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -52,6 +52,7 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/spec_ctrl.h>
 #include <asm/x86_emulate.h>
 #include <public/sched.h>
 #include <asm/hvm/vpt.h>
@@ -610,6 +611,16 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     svm_intercept_msr(v, MSR_SPEC_CTRL,
                       cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
 
+    /*
+     * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
+     * setting and avoid having to perform a rdmsr on vmexit to get the guest
+     * setting even if VIRT_SSBD is offered to Xen itself.
+     */
+    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
+                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
+                      !cpu_has_amd_ssbd ?
+                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
@@ -3105,6 +3116,30 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
+        return;
+
+    if ( cpu_has_virt_ssbd )
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+}
+
+/* Called with GIF=0. */
+void vmentry_virt_spec_ctrl(void)
+{
+    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
+
+    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
+        return;
+
+    if ( cpu_has_virt_ssbd )
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 7413febd7a..2240547b64 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -40,6 +40,7 @@ XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
+XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(28)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ab6fbb5051..de18e90b2e 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -375,6 +375,16 @@ struct vcpu_msrs
      */
     uint32_t tsc_aux;
 
+    /*
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
+     *
+     * AMD only. Guest selected value, context switched on guest VM
+     * entry/exit.
+     */
+    struct {
+        uint32_t raw;
+    } virt_spec_ctrl;
+
     /*
      * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
      *
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 72c175fd8b..a1e268eea9 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -385,7 +385,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
 
-        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+            *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        else
+            *val = msrs->virt_spec_ctrl.raw;
         break;
 
     case MSR_AMD64_DE_CFG:
@@ -678,10 +681,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             goto gp_fault;
 
         /* Only supports SSBD bit, the rest are ignored. */
-        if ( val & SPEC_CTRL_SSBD )
-            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+        {
+            if ( val & SPEC_CTRL_SSBD )
+                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+            else
+                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        }
         else
-            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
         break;
 
     case MSR_AMD64_DE_CFG:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f338bfe292..0d5ec877d1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -406,9 +406,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
+           (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
+                                                       : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
@@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
+    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
-- 
2.36.0


