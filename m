Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B150052ED49
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334157.558146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pb-0005AO-8X; Fri, 20 May 2022 13:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334157.558146; Fri, 20 May 2022 13:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pb-00056q-4H; Fri, 20 May 2022 13:38:15 +0000
Received: by outflank-mailman (input) for mailman id 334157;
 Fri, 20 May 2022 13:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2pa-00056k-41
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:38:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16d66ef3-d842-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:38:12 +0200 (CEST)
Received: from mail-sn1anam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:38:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 13:38:04 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:38:04 +0000
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
X-Inumbo-ID: 16d66ef3-d842-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653053891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9yPdTOaoLfsg2kKEiAZjMTN90W25mzu1BXfoMHPOCt0=;
  b=B/Qk1a1+fA9n6ArJCcoHVkZqtVy4F2YKn55EYSavitqA8R5xylpRQMWu
   /45YIAVkU2VpJXeZdCKXUroaxD41RIF3Hr+GFKDVcLIrSR7+zC8MW/Cru
   dOL51sNpASUDia8j1STzSlw1mi5TU2tSN3bJ//EJ6rB4WB2ANWdK3/Wnk
   g=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 71163081
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L+Q26q1q7nW08TDvxPbD5adwkn2cJEfYwER7XKvMYLTBsI5bpzMGz
 2AYUWDQO/vYZDGnLdggPYS38EkFvpSGmNdjGlFkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0WhaeSTUAzAJTpnfwDSBRXSig5NqR/reqvzXiX6aR/zmXgWl60mbBVKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfmRjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SCmLWYA+Av9SawfsnX0nVco/IXWaoDzV8HSYcRIhHzCn
 zeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rRqLk6PS6gPBXGwcFGYdM5ohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnFL6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:MP0CcqBn/XsAAMvlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dNMEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfXHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+06VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qY5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 129lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ9o+a87bWPHAb0cYa
 lT5Jm23ocUTbraVQGVgoBX+q3jYpxpdS32AHTruaSuok1rdT5Cvg4lLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P6krhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71163081"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8wAQnRbO5PYkN+nnU056NpBA1bKKsgqlBuO1d9VV9s/tCiZvVpsNAZ7VdYLACekPMfUxud7vDnJStAU4OQlbqi+Q+BDQR02psM9Cet9tM4IgVUQVQpC3L0Tc01H2amvYZGQpfMfcPbW9jIQnwWu2Cj7hDJoZDgqhfxR0vQTrZPSkMbUYgLOZjQSYVTL5BOzz5pCoDlUHUVTChbP5x67zpMQOoFa6SsVeGXDwzHOuU67AdmJq8mmiZ1NcnevuF+ArxDOSnoWDi5W41X9Jc1CBSAk71FxNIrCMfbh3LcZAhzr1w3HhwBlM5Pbd38T8aeAexFz5wiLPM3Kd1mxo+Ec0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeoUp+iACJOfr/zDdBgUFwZ+3CraUjxfCVfwhWsGF5w=;
 b=hR+FOI5z3mqBS7y2bbPmrQ5gwJ8F5yGyJKu6N596j5BUJY8ZOYkEXBaZQTnGVXLCeCWbqPfGu3PIvYhhSfGk3cqtWEaNqxlHbNxAkbvqVb//OKxmElnzDZydHzXPoB2u3MVJXiHnm15T6Ce46QoT0NlGApvCb+Em6bp9L+5BYR5B8muSKRHymKCBn9qcMQI/3u4qpQOFdPrdR2XNyYCXMoNy/0p6atppZT+Kf9qNL5KzO60C8TZw53KhgDDjUoEXeVj9ijRYLzbqv+fVMYBFJvOf8qt2bktbHPILMLfkreZsDX4LN9y1rg3DykUv34zBK461BaxC6gTjqGU8rz/APw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeoUp+iACJOfr/zDdBgUFwZ+3CraUjxfCVfwhWsGF5w=;
 b=FJ6ckKoytv1ehaaIcvmQOs/xJiazeIp7zaYC6oQs+PIiUVgxr7mZgCHyDc0dk1wa1tfiBVX8aXKZe4W4pE6o3HkRhBGZ5kdc5XOUIy069BAw3nagpmvpP2ZHBrFy1R746Oleosu3O29s++FLNW9rVXMHkdVR27mMP3lt9kacSlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] x86/ler: use feature flag to check if option is enabled
Date: Fri, 20 May 2022 15:37:42 +0200
Message-Id: <20220520133746.66142-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fc9d0a5-a093-4d27-05f1-08da3a65f76a
X-MS-TrafficTypeDiagnostic: SA2PR03MB5755:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5755E377F379E58F1F42E2A88FD39@SA2PR03MB5755.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EG0BOY9EdM+aMoQ2GS867YNIlRaYl9ab7V0/s1F0BSALuSugKzSzxh5ul/fJaJOESuPFOOmx6h6kmGEf9lAsY9gXG4YN/3aO6mElsHDHYndemeUnlBH04ww943ZnF1Wmed616HhjtKZNq1p+TPdvyfRPBc6Je1jDP7HcIIj3UrR1Npr8AbMswOHONz4UHXDiEU/WIR+B/Uc5jU7n4LuzkDTi8yrH3ZiKpih+djmgNvSCo+Afvs/w2I8H+tgKz+P8HVKa1jqlVVzGXi3v2BHAaQupmb9EuAIRrUzRskPEPw1w41XEjfU/WDKYazVBgWgzUEg8vh8CwBw6slArY2OE9ErPE59lzAKvxAlnfBoCF0e9YFiwEqaqTnrLdaQ/+UwL2X6Ea3R42ciQjjabTY/gcl2+E5FFd7I144YKBvifRdAqrLr/8SmP3ZsDD6YxVTRhiLmlRarNCUmy8PaTxzd4vnUlUNBhzlxwTOWwe5DvMtiod8WATn+HahEj2GfgxlUPYgMKt3sgS5xihOVLo1hxgcTu5CRxJjEM7Cdt4ZwRPYA9V0SmT1g/9Qy0YWOBDMWiTAx1TWd+zvGzSJskV0hYnxa5nra1fmxuFaAtfh4Tkvmb1Am5X4QssjcbrWvGk4dcmLbm6PY590U2CfavPgirTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(6486002)(83380400001)(6512007)(26005)(2906002)(4744005)(6506007)(508600001)(1076003)(38100700002)(2616005)(82960400001)(6666004)(36756003)(5660300002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3ZXUFN1aXdTYWtFRlRxSnVsWiswNU0yTGJBaWFtMDVQTWpGZGlrTUdGRThT?=
 =?utf-8?B?TnUwOHAxRmVEU3FEQ0ZNbHdKWC9TSEFkMkFlRzhSQUxhZ2VEWEVaQll2OGsz?=
 =?utf-8?B?aEZiZkdiMHpBaWFZWklGYWd5Z1czbUdCcXVrMWNsdDEyVUowb1FyaEtFU0VK?=
 =?utf-8?B?djR2aWU0cWc2UHluYWJCS0xOUG8xMGt1Yi9KVENGS0dUWXExVno3RUlmOGVF?=
 =?utf-8?B?OXd0SVV4MytxYWlURlRlZEpRRjE5T1I5VWM3RFd2M1JFc0hHRlczc1BZamJ1?=
 =?utf-8?B?M3JoUWJxaE1FU3Uzc1VkdDY5NmMwRkxXNG1TczFVUEZ5SVRmclFmOGdvWXBC?=
 =?utf-8?B?NExsamR1NHRXbEx1ZjdtM1ZpY3Uxczc0YjJ2Znc1NlZUVGhPL1pGa3AxMUtK?=
 =?utf-8?B?OG92YTRrbGoyN3Zqa0FSSFAvZm5oc3lUN3AzYWY2bW9nM3NLMS9XUlVNaWEy?=
 =?utf-8?B?SmlRcmc2cWV2bXBxNDFwQ0pzOUphaVFZOUFBYlJubnYrU3d4bmRET0VkNXFI?=
 =?utf-8?B?bGhzeXgzQlE5V0JPNWtRUVFHdENUTlg3RVZ4WFdqM3I4OFAzcHFLemhJNzUv?=
 =?utf-8?B?cXZWVWtxZC9BWTJoeEJPN1JkNlIyRUVWTzNrN2UvUTFKTG1YalhMZkdMd3lI?=
 =?utf-8?B?cG56UGlUUk5WUnRxQS9pK0ZJU2ZNbVUwUEFFa3lrajYrU2JsS3JNZjJUdDNz?=
 =?utf-8?B?YURhdEt2WWhrdGFXRHdGb1plMlJkZzFlMGdROEcrbmErVGpsSnZtbFdpZWlJ?=
 =?utf-8?B?VDNCUU51SmYwcEl6YzJDUXZXekhUNCs1ZHVGRTRMamdpSlFzR29PeHdnRWoy?=
 =?utf-8?B?YnpoWmZKYWdYbytNUngwVy9GYk5iZVFXcTk1b3hiVjZoWVAwczJEZk5mV1p2?=
 =?utf-8?B?Nk9qN3VMTTVoY3g5M2IxaTh3QklZK3B5b1Y1YkQ2ZUpaQ3JwQW1FVVVDUkxU?=
 =?utf-8?B?ZnRQaHRES29vOXV0UzROeWhxMXhRdnhvRTRLdEUzMlAwZm5XS254b2FUSDJr?=
 =?utf-8?B?ZUFTQmQ4UjcvMllUcmlKY0RVOEVmSnAzNEJZOSt1aUgzNFdHSDhzMi9PaWVp?=
 =?utf-8?B?WmhqMElmWEM3VFp0cmZNSmdQeS9jUnJmSWNGc0I5ZGxWbmdFMzd5M3pYWDUx?=
 =?utf-8?B?bzd4czF4VThlOFJ5NVNlS2lXQytPUHFOYmZvS1E2TXFRUFhobWk2TXZad214?=
 =?utf-8?B?cXV3cTk4YlRYejdHMmtqTGpmY2FlSm9sVHN1Um45YSs2R3NMTVhwWXhkekJo?=
 =?utf-8?B?QTFYNHZWYmdnZGE4WGVuQlkyOUZnelhVakZoaks3M1ZOZW5iMGhiUkplT2ov?=
 =?utf-8?B?algvRWIwUktqQXhVeUxyb2w3T3Z5dUJKcGh6MFZzMHErVkJkOHYwYlZLUHpK?=
 =?utf-8?B?L0cxVHlnRCtXWHdMeVVKSTl6d09LYmYvdUZ5UEZ1UDM1Ty8yL0JKNHhsYVhm?=
 =?utf-8?B?aXQxMlNGbkxYYTJLalM2VVlROC8yMU9zVklNV2VRd2lOcFNvU0lmeW1aWVZE?=
 =?utf-8?B?Nm92LzRUaDhZbVB3b0tROG4zYlVLZXpqbVFUNkdFVVp0OS9ydmlLZ3lGWkZp?=
 =?utf-8?B?L093NmJGaytBT0JyMTRUNzlManRkc0NvdFFvMWVvLzJFaGl5WlVRQUZyM1FQ?=
 =?utf-8?B?THlBd1lCVGtDaHhzcS9EYThFbzI2bGcxVDVjb0g5bEpiQXA4eTZUOThIbkov?=
 =?utf-8?B?MnVxN1FlWEhWZ1NEbGxsY1NkWC94K0laQXN3MlZGVUFZYXFCR1dnbWFJRUV3?=
 =?utf-8?B?emVhZ2I2SkhqcXRHRGFFejk1TmowcERpYzI2RkxXUEpuUUl6YTR0RmYweDJR?=
 =?utf-8?B?Y2dUWW9rL0FKcWVLUk5TS0dTN1ZpTUR4N1R5MlE3WkVPVXVKUzVTUXNKd0ZO?=
 =?utf-8?B?dk5IejRFdDYyaWVVUU15ZTlIemRyQnFyTHozOFp2UTZELzVxYVNGM2J0c2tU?=
 =?utf-8?B?SUFBb1RYWW1rS2hDOW5NU3NVK2E5VU56SUZUK3ZYS2R0TXMvZE5FWXpYTk5N?=
 =?utf-8?B?R1dScFRxMlhDNHQ1R3BFQUJ0ZDJ3U2pQdmp5VWdHblplaHhIb0Z3YjZYbkNE?=
 =?utf-8?B?eXZRT2dqSHJiVERTUGxZTHBtTjN5TDNJSFFZQ1lJUFhGb3M2OFE0SWVTV1JC?=
 =?utf-8?B?UWVSRTJ6aTdJb2kzckUrSVhZSWI1RG55MEdUUEVxc1UzUU4rZTJvZ0hLY3E0?=
 =?utf-8?B?Ykttc21nU1NoSjgrTmN6SG9wa3BSQndoYUZOMUtYK255ak8rRzI1Q2ZDZHlj?=
 =?utf-8?B?UHBkTUFzQjV1Z0pPWFVtZW5wT0JKcWhrcmpHa0ZKbHRZeUZMdS9JNHQ2bENP?=
 =?utf-8?B?eUVBK09rTDdRbVBESEREZzNXZk5PY05tZG80emM4V3FYT3l0Q2QwMlg1dlJR?=
 =?utf-8?Q?Lfl+TusZK8arEYxM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc9d0a5-a093-4d27-05f1-08da3a65f76a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:38:04.3999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNxznAJlZO9sdE1t03X9vriuzzFFXfH2/uGRgqHyMfIgNKNJRTByxIafaWxdSR+QbyqxQjbDucpjdOPLjSAsrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

It's more consistent with the rest of the usages of cpu_has_xen_lbr.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 9d7f1f818b..24c5067ca2 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -156,7 +156,7 @@ void show_registers(const struct cpu_user_regs *regs)
     printk("CPU:    %d\n", smp_processor_id());
     _show_registers(&fault_regs, fault_crs, context, v);
 
-    if ( ler_msr && !guest_mode(regs) )
+    if ( cpu_has_xen_lbr && !guest_mode(regs) )
     {
         u64 from, to;
 
-- 
2.36.0


