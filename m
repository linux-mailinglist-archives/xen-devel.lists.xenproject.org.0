Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D7605202
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 23:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426033.674221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olGen-0003UK-IO; Wed, 19 Oct 2022 21:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426033.674221; Wed, 19 Oct 2022 21:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olGen-0003RE-FE; Wed, 19 Oct 2022 21:31:21 +0000
Received: by outflank-mailman (input) for mailman id 426033;
 Wed, 19 Oct 2022 21:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rl4W=2U=citrix.com=prvs=284ee54c8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olGel-0003R7-JN
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 21:31:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c964278-4ff5-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 23:31:17 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2022 17:30:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 21:30:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 21:30:51 +0000
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
X-Inumbo-ID: 5c964278-4ff5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666215077;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Yv/QVJRsUp/yPss4XDO2uyARKytCTQ2rbplWR1kFyvM=;
  b=E/WoKZHDqC8Fl8pwH+sxZd0sePkT+yRseupUT7YC4IkYMV688slgi5q/
   B69LwVWs1ll5gGycAP4DXM2b1er2O1VEJ8wv0g+b1e70+La9mlw0wD8KV
   kl697oJzw6LJjepaAQN5nPyChlzRUxcy/qkuBd7x1W6eoTGSF8PTZVQKt
   4=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 82738378
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HfJLD6MSN8QuKcbvrR1WlsFynXyQoLVcMsEvi/4bfWQNrUoj1WEEm
 2dKCD3UPv2NYDP2Ktp+atu+oEwEv5SAxtFkHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr6WtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eN4EK6vhSKEt30
 flIJjwXXBvT17yP3+fuIgVsrpxLwMjDGqo64isl9heASPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9xTJ/8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toijz3b+UwnOTtIQ6L761xKNaoGSpyEMIFEEvUgGhkNiDsxvrMz5YA
 wlOksY0loAw6UiqQ9/VTxC+5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 nepktXzFHpQubuaYXuH8/GfqjbaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOJCyitr5CDTh2
 QegpSI1h6gQpcMT3qD99lfC6xqmq4LVVAcz6kPSV3i88wJiTIe/Ysqj7l2z0BpbBIOQT13Ep
 35dks6X6bhUCYnXzHDXBuIQALuu+vCJdiXGhkJiFIUg8DLr/GO/eYdX43d1I0IB3ts4RAIFq
 XT74Wt5jKK/9lPzBUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:W9/dJKkwzdx9jNSywvWKQbc2aNrpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.95,196,1661832000"; 
   d="scan'208";a="82738378"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0atHUHmgsqhzOJd3nDnPiNuhRCixflxSAlx7b5WACmIeMyUJEJn+8WjG7vE29BOrtQW44idq2Ng+QIQvhHnvBztRtD33rJqIyc5Dq4CHvRn54jyUN/xAcEGF3uSYEThi7JcGu9SkhFCm3ey3PCt1YTyzZ/XZHM7A7byfhAPoe9NXAVWnSoVKL3IH3lPjT1ZuexFVRqYfifut7PBHsbnQdiY/DKUc2UZg9Z6WAd/vKIZSGrxZVgI/Vu8Vvo3CczYzrZc6j1UsFa118JV8oW+cAwCtMpn8GQmD24pYVn1Hq3mhYCakCjR1ogXIGH6WGDb6cX3GtB6sYKbCNbOgB1h9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv/QVJRsUp/yPss4XDO2uyARKytCTQ2rbplWR1kFyvM=;
 b=gRhj6KrINKmF6Qmke7lIsRSAsjSVJkrlKT2C3jWqprSvLVXLd5XtoKX4+L0NI8VSzd2lXRAaIEnbr+AKZlGlaT5qd6iZhbo0ecmGpapd5+bhRg+VlB/u4cLWpfueLzxKj7ywmKlTFBSntr2PLkgt6BTFC0iLol6WOngkOcxJafnm5t18XwgcPDR74KrZrwj7G1KLKZxLqVYycNnLtrxfuMFZpMZGDXf3us/u5zJXRejkcpMWlhFbM8EituPbFailPutF1pATrwiWrn4x+uSgQo3b4iwtWU8baPx+zumBMw3vLq+9xpzweLN6QAVGelRhhtiVz6dGr7yNq6k6YDo2yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv/QVJRsUp/yPss4XDO2uyARKytCTQ2rbplWR1kFyvM=;
 b=V3CkOAKJyYZIiSXT6ElKXM2IlKMh0OKtwADkQp+FoiX2P66AcB6edMG9h1LMZCIfqkwX37wqSzqutyxoOsOYq9ljhd3Se9F9MsMWWfLe2JfKI4N3/d6d0yAMc+0fX/NECVl2K0JM4avdUOJdB45MozoY5xsusQsfew2JEOSby1Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4lyBiWnfx+vnUkmAUdSmWjh5Xq4TC2qAgAAU4ACAABPHgIADC1WA
Date: Wed, 19 Oct 2022 21:30:51 +0000
Message-ID: <dffdc951-91fd-2659-ec7f-5c213138d785@citrix.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
 <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
 <cadcee69-e51b-99af-78c3-ab4a0e2e42d9@citrix.com>
 <5587f5bd-1694-a843-9e80-ad477527a576@xen.org>
In-Reply-To: <5587f5bd-1694-a843-9e80-ad477527a576@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6588:EE_
x-ms-office365-filtering-correlation-id: 57ee49a3-10bc-47ba-94ba-08dab2193271
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3wsBPKkn/aOMwDRtMjmWnbaAvIAlvb5iOwtKs2GjONb9u6IiroyactEH18F4MPZWO+XJPYBI/l/hJR2MDiOINPiJjFPwE74TjfqGonHkDFySQ2tsc4yxrOyIr7M+nEjkmnemd9yUoAlZC3/tZxLEGKuopqG8GEFZk9EVLQLxfRd/KJ5eVcWXwNSpm2NxIxvLWK5Ab20P7BFarq9n7r8rqmYAoUMcmE0uR1Teq7GXnVrCRXZ+yJORbUjeVZlT0Z7c0egzKXS8NaWyBbJbwwo2kK/oB1MMgK/2vBdsSlAQs7q8ZzVQnm6CWpQZO9txlzQQcvHIgvDRug/qbFDzy9gH1sBcLkkHXnsBL5Pa9LIDGstvp91ZLg6PPqCZKT0xg8SBjTTec4cYqOXqGdAT/dHS/lOHmZjFD+Qm0NlZPF3OHq/Y3n3EAMTsOrbLpH+hIUWjfrm9zufe84JiBnD5ovKSI5XsIK8n5bF5Zj4cMBiswX7J4vhhedGmy9SsqLuTnCo/T2FHY2lN8YHSEJCmQidti3txS5rbfQHVS4zzurCKYY+MxFO+5bh0VqFqfwrW0TcLsM56wsGoBSnM421QZY6OV4Tw6vQ8GV71vtXPjxX7SSNykgG+IPfbs3mDUeLCM7GTVVViOJq3pm5QCZDV4Sip3ayXkelMCLin5MS1ol9WQmgCyKM6Bt03lWYiBO+366iHvIcdQ9M88xRrbHAWOTKRCWkrm4YmxXVyZSSnzfhbPD9t09Yi7nD6hmNNKGqOjjrfI0krxNalYD0DtSaG9KcKmAf7aFnxXgxJPDSZkvcOlxCvHhKqKwiW4vUPpKQY2gPdNWgNNgrBbccSFFTWzL2B6Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(36756003)(122000001)(66476007)(82960400001)(8676002)(66556008)(86362001)(31696002)(66446008)(38100700002)(64756008)(66946007)(38070700005)(91956017)(76116006)(2906002)(54906003)(110136005)(478600001)(2616005)(4326008)(316002)(41300700001)(8936002)(5660300002)(186003)(26005)(83380400001)(6486002)(71200400001)(53546011)(6506007)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDVhL0JEajFKL3pHa1dyYkE4Y05rd2VwWWg0bUM1NVllSlhwTTl0QXdlTVd1?=
 =?utf-8?B?b3JlaWlFelZxMndta1lucXVHdjcxWVdyZ3RyY05GWnp5VkZ0c1NJQW90SUl6?=
 =?utf-8?B?MU1rbmtoZUNJcXgvbU56eXNoYUJMMEsrRU5OdG1BRDJxL0orK2RjckE5QkVW?=
 =?utf-8?B?ZVFSK09jamVnRXAyVGdoK1ZJcDBjL1VLZjhFSG1OcFFNd2tJcHo3NFpjVVV4?=
 =?utf-8?B?QWZkdEpQcy9EblpoQmdkTlN0QWMzbjBDWk94KzM0enM2Y05KSVMrTFg4QzFI?=
 =?utf-8?B?bmNGRVZENHV3RDlCTWswb3BZZGFFYkZ4L3dEalFMZEk4ejc1T2RrQzJGZnVz?=
 =?utf-8?B?RXRLelpSQk1zOEVkWUVRRUdzTmtSWWtJdjFDK3BQNHpBVWFYWkhrS2k1SldW?=
 =?utf-8?B?bFRBdTlBT3VvbnY1U2p6Z2RFOWtBVnhROHdTRTJiTnZhQXlJZWE0eWRmSmNC?=
 =?utf-8?B?U2JBaDB6MXY3S25yNUxXd1VMWm9kazJCQ0JHclZ2MzhJaVJENXQraWJJNG11?=
 =?utf-8?B?NHdpSU5kMVFMcUQvd1hrcUM5eTdhUVRvTTNGT0tDUTVHVVhWUTFlcjk0a1p3?=
 =?utf-8?B?d2ZyMUhUZThEcEFQQWZIQjRXYjc2WXRsTGtsWkdMeEMvdWJCYVdpanNLVi9i?=
 =?utf-8?B?b2Q0VzRwRmJ5V0x6akY1NDNUd3JOeWw4RGNTYlVBOGJhTlJtOGt0b2pYY0lR?=
 =?utf-8?B?dDJxZ0ZXeVJ6RTZXK0tqckJ2YjI2VExhMXc4ZFJTb2hMVzJwZ1E5Q1RUN3FL?=
 =?utf-8?B?aFlWTTBFTDRKVXJzYldSQ0U4Y3o0Yit4L1dOb2puM0lGL0hsU2l2TjFhRjZ6?=
 =?utf-8?B?S08ybXduUHJXSTJQZXZVc1FrZGVkMWpwZ0VtaEE1OVAvbVJFbFllaC82aEZ3?=
 =?utf-8?B?N3plVDQxN3cwOXI4STNLcXhEcVpxL2VHbVl0NEFGOVpEREJCb0d3Nm9XRHJu?=
 =?utf-8?B?SURRNW56YWNUeVVzak41WTg1bnVkTlFHNU51WW1heGxsUVVib0RQc1l0N083?=
 =?utf-8?B?bjFKVFl2R0hPWGlFY016RUc0ODBnVE9keWY0N0o5LzVvMHRyNkpNZHFWclJi?=
 =?utf-8?B?UVVqbnp1ajFvM0RGNFIrZDRScW1FaGsyeVNZc2owNElLUmZFcG0xKzF1QnBh?=
 =?utf-8?B?bXlmNFlCdmRxa0hYaGtXR3RmMGI0eld1UmJyQkc4KzVGZDU5QzFBV0VoU2Qx?=
 =?utf-8?B?NG5XKzUveU5mRjVXWUlmMitzNE1GYzZqZ2lkYVo4ZnBjTUg0bFR2VjFTN29s?=
 =?utf-8?B?aE5jdU5qSHNBOHh2VFhTbko2ZVlVR1RBa0VxL24vcTgycENGQUEybXRPemdV?=
 =?utf-8?B?TzBBbXEwZU9sVk43MUJVOURaOElMaGYzRXRHVTFHRXJscnpkbE1LM1ZxYmo0?=
 =?utf-8?B?ZVdja2w3WTc2cFhiUDMwUnRBV1JFTXlIN3d5VkVsTU5TK1h6eVAxTEs2WjNv?=
 =?utf-8?B?ckVDNUxxclZPTVVKbDk3OVdRdjduNXI2Y2NEMGYwdWRxUzhxMUFLVldKT1Z0?=
 =?utf-8?B?MFJLK25TMitVaFpWRFJKNlMwc3I3cXRJcXJMekZVVHRBL2pQc0V2clVpZ2pO?=
 =?utf-8?B?WVR6bS9mYkxsL0NaVGM2ZUJwRTNIOWU3VlFQYm02RW9jdi9Bdm81cWw3VjRS?=
 =?utf-8?B?QTc5ODFyLzlESExtWitYZnc4cTdSbE9hclJTQVpLbXFYZHpBdFg5TVNjUmtz?=
 =?utf-8?B?dm5scGpIemV0Nmk1RHV5eXlwZ2oyb21VVlZsZkdpTGRzbUk3OXp5VEdyVkZW?=
 =?utf-8?B?QzJ6c0l6OUtlSmJDMmxNRy9IbnBEdTl1cUEzVUU1dUR2bzBJNlF6MDZBajND?=
 =?utf-8?B?UFltb3ZNUjhmRmt4MnFQbFZUUFdZTmJOcy9ENTVUOVpYYmt4eDRXYnRMVlpi?=
 =?utf-8?B?SjgyYWRueGpOUG1wT1NPZFJ5d0RqVWJTSUN4ZTVlcnorQVhnQkErYklVT2dn?=
 =?utf-8?B?TmEyQWJoYzBXZlpqakZ6NGVSclBnKzNKVUswNVQwTVFsdDJnWGdJQ3NrdVRZ?=
 =?utf-8?B?OHVTdUp2U3JDeG1YM254bjNBbGRxd0NGSnc1NTIxSmFXbGRZV3UweTcvN1l4?=
 =?utf-8?B?L3lJM2p3UktsZHNNRFZEOGFjNm9LZG1uc1FBWmxreGIwR1VXVU1nYmdCTENv?=
 =?utf-8?Q?tixrkhslhVKCDVrvv2wl/ATVw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E468536F0EFDB94D94AF488B7C1B0446@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ee49a3-10bc-47ba-94ba-08dab2193271
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 21:30:51.5952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36KfVs0JLuN0UucPwAPbnirbPonm4YHcaa6mxHKULHtzVgpk2lxw/rdcuyYmB7FghdqNLqUahkBvRwq4bNXyUHttbycyS6uelSRpW1QmGjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6588

T24gMTgvMTAvMjAyMiAwMDowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4+IC0tLQ0KPj4+
PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4+PiBD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4+Pj4gQ0M6IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4+Pj4gQ0M6IEJlcnRyYW5kIE1hcnF1
aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4gQ0M6IEhlbnJ5IFdhbmcgPEhlbnJ5
LldhbmdAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgeGVuL2FyY2gvYXJtL3AybS5jIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4+PiDCoMKg
IDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pg0K
Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5j
DQo+Pj4+IGluZGV4IDY4MjZmNjMxNTA4MC4uNzZhMGUzMWM2YzhjIDEwMDY0NA0KPj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vcDJtLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3AybS5jDQo+Pj4+
IEBAIC0xNzM2LDggKzE3MzYsMzYgQEAgdm9pZCBwMm1fZmluYWxfdGVhcmRvd24oc3RydWN0IGRv
bWFpbiAqZCkNCj4+Pj4gwqDCoMKgwqDCoMKgIGlmICggIXAybS0+ZG9tYWluICkNCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+PiDCoMKgIC3CoMKgwqAgQVNTRVJUKHBhZ2Vf
bGlzdF9lbXB0eSgmcDJtLT5wYWdlcykpOw0KPj4+PiAtwqDCoMKgIEFTU0VSVChwYWdlX2xpc3Rf
ZW1wdHkoJmQtPmFyY2gucGFnaW5nLnAybV9mcmVlbGlzdCkpOw0KPj4+PiArwqDCoMKgIC8qDQo+
Pj4+ICvCoMKgwqDCoCAqIE9uIHRoZSBkb21haW5fY3JlYXRlKCkgZXJyb3IgcGF0aCBvbmx5LCB3
ZSBjYW4gZW5kIHVwIGhlcmUNCj4+Pj4gd2l0aCBhDQo+Pj4+ICvCoMKgwqDCoCAqIG5vbi16ZXJv
IFAyTSBwb29sLg0KPj4+PiArwqDCoMKgwqAgKg0KPj4+PiArwqDCoMKgwqAgKiBBdCBwcmVzZW50
LCB0aGlzIGlzIGEgbWF4aW11bSBvZiAxNiBwYWdlcywgc3ByZWFkIGJldHdlZW4NCj4+Pj4gcDJt
LT5wYWdlcw0KPj4+PiArwqDCoMKgwqAgKiBhbmQgdGhlIGZyZWUgbGlzdC7CoCBUaGUgZG9tYWlu
IGhhcyBuZXZlciBiZWVuIHNjaGVkdWxlZCAoaXQNCj4+Pj4gaGFzIG5vDQo+Pj4+ICvCoMKgwqDC
oCAqIHZjcHVzKSwgc28gdGhlcmUgaXMgVExCIG1haW50ZW5hbmNlIHRvIHBlcmZvcm07IGp1c3Qg
ZnJlZQ0KPj4+PiBldmVyeXRoaW5nLg0KPj4+PiArwqDCoMKgwqAgKi8NCj4+Pj4gK8KgwqDCoCBp
ZiAoICFwYWdlX2xpc3RfZW1wdHkoJnAybS0+cGFnZXMpIHx8DQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgICFwYWdlX2xpc3RfZW1wdHkoJmQtPmFyY2gucGFnaW5nLnAybV9mcmVlbGlzdCkgKQ0KPj4+
PiArwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlX2luZm8gKnBnOw0K
Pj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKg0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IFRoZXJlJ3Mgbm8gc2Vuc2libGUgImluIHRoZSBkb21haW5fY3JlYXRlKCkgZXJyb3IgcGF0aCIN
Cj4+Pj4gcHJlZGljYXRlLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHNvIHNpbXBseSBzYW5p
dHkgY2hlY2sgdGhhdCB3ZSBkb24ndCBoYXZlIHVuZXhwZWN0ZWQgd29yaw0KPj4+PiB0byBkby4N
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIEFTU0VSVChk
LT5hcmNoLnBhZ2luZy5wMm1fdG90YWxfcGFnZXMgPD0gMTYpOw0KPj4+PiArDQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBzcGluX2xvY2soJmQtPmFyY2gucGFnaW5nLmxvY2spOw0KPj4+PiArDQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB3aGlsZSAoIChwZyA9IHBhZ2VfbGlzdF9yZW1vdmVfaGVhZCgmcDJt
LT5wYWdlcykpICkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZV9kb21oZWFwX3Bh
Z2UocGcpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgd2hpbGUgKCAocGcgPQ0KPj4+PiBwYWdlX2xp
c3RfcmVtb3ZlX2hlYWQoJmQtPmFyY2gucGFnaW5nLnAybV9mcmVlbGlzdCkpICkNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZV9kb21oZWFwX3BhZ2UocGcpOw0KPj4+PiArDQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBkLT5hcmNoLnBhZ2luZy5wMm1fdG90YWxfcGFnZXMgPSAwOw0KPj4+
PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmZC0+YXJjaC5wYWdpbmcubG9j
ayk7DQo+Pj4+ICvCoMKgwqAgfQ0KPj4+DQo+Pj4gLi4uIHlvdSBhcmUgaGFyZGNvZGluZyBib3Ro
IHAybV90ZWFyZG93bigpIGFuZCBwMm1fc2V0X2FsbG9jYXRpb24oKS4NCj4+PiBJTU8gdGhpcyBp
cyBub3QgYW4gaW1wcm92ZW1lbnQgYXQgYWxsLiBJdCBpcyBqdXN0IG1ha2luZyB0aGUgY29kZSBt
b3JlDQo+Pj4gY29tcGxleCB0aGFuIG5lY2Vzc2FyeSBhbmQgbGFjayBhbGwgdGhlIGV4cGxhbmF0
aW9uIG9uIHRoZSBhc3N1bXB0aW9ucy4NCj4+Pg0KPj4+IFNvIHdoaWxlIEkgYW0gZmluZSB3aXRo
IHlvdXIgcGF0Y2ggIzEgKGFscmVhZHkgcmV2aWV3ZWQgaXQpLCB0aGVyZSBpcw0KPj4+IGEgYmV0
dGVyIHBhdGNoIGZyb20gSGVucnkgb24gdGhlIE1MLiBTbyB3ZSBzaG91bGQgdGFrZSBoaXMgKHJl
YmFzZWQpDQo+Pj4gaW5zdGVhZCBvZiB5b3Vycy4NCj4+DQo+PiBJZiBieSBiZXR0ZXIsIHlvdSBt
ZWFuIHNvbWV0aGluZyB0aGF0IHN0aWxsIGhhcyBlcnJvcnMsIHRoZW4gc3VyZS4NCj4+DQo+PiBU
aGVyZSdzIGEgcmVhbGx5IGdvb2QgcmVhc29uIHdoeSB5b3UgY2Fubm90IHNhZmVseSByZXB1cnBv
c2UNCj4+IHAybV90ZWFyZG93bigpLsKgIEl0J3Mgd3JpdHRlbiBleHBlY3RpbmcgYSBmdWxseSBj
b25zdHJ1Y3RlZCBkb21haW4gLQ0KPj4gd2hpY2ggaXMgZmluZSBiZWNhdXNlIHRoYXQncyBob3cg
aXQgaXMgdXNlZC7CoCBJdCBkb2Vzbid0IGNvcGUgc2FmZWx5DQo+PiB3aXRoIGFuIHBhcnRpYWxs
eSBjb25zdHJ1Y3RlZCBkb21haW4uDQo+DQo+IEl0IGlzIG5vdCAxMDAlIGNsZWFyIHdoYXQgaXMg
dGhlIGlzc3VlIHlvdSBhcmUgcmVmZXJyaW5nIHRvIGFzIHRoZQ0KPiBWTUlEIGlzIHZhbGlkIGF0
IHRoaXMgcG9pbnQuIFNvIHdoYXQgcGFydCB3b3VsZCBiZSB3cm9uZz8NCg0KRmFsbGluZyBvdmVy
IGEgYmFkIHJvb3QgcG9pbnRlciBmcm9tIGFuIGVhcmx5IGNvbnN0cnVjdGlvbiBleGl0Lg0KDQo+
IEJ1dCBpZiB0aGVyZSBhcmUgcGFydCBvZiBwMm1fdGVhcmRvd24oKSB0aGF0IGFyZSBub3Qgc2Fm
ZSBmb3INCj4gcGFydGlhbGx5IGNvbnN0cnVjdGVkIGRvbWFpbiwgdGhlbiB3ZSBzaG91bGQgc3Bs
aXQgdGhlIGNvZGUuIFRoaXMNCj4gd291bGQgYmUgbXVjaCBiZXR0ZXIgdGhhdCB0aGUgZHVwbGlj
YXRpb24geW91IGFyZSBwcm9wb3NpbmcuDQoNCllvdSBoYXZlIHR3byB0b3RhbGx5IGRpZmZlcmVu
dCBjb250ZXh0cyB3aXRoIGRpZmZlcmVudCBzYWZldHkNCnJlcXVpcmVtZW50cy7CoCBjL3MgNTU5
MTRmN2ZjOSBpcyBhIHJlYXNvbmFibHkgZ29vZCBhbmQgY2xlYW4gc2VwYXJhdGlvbg0KYmV0d2Vl
biBwcmVlbXB0aWJsZSBhbmQgbm9uLXByZWVtcHRpYmxlIGNsZWFudXBbMV0uDQoNCllvdSd2ZSBh
Z3JlZWQgdGhhdCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBub24tcHJlZW1wdGlibGUgcGF0aCB0
byB0aGUNCnByZWVtcHRpYmxlIHBhdGggaXMgYSBoYWNrIGFuZCBsYXllcmluZyB2aW9sYXRpb24s
IGFuZCB3aWxsIG5lZWQgdW5kb2luZw0KbGF0ZXIuwqAgT3RoZXJzIGhhdmUgcmFpc2VkIHRoaXMg
Y29uY2VybiB0b28uDQoNCk5vdyBjb25zaWRlciB0aGF0IHdlJ3JlIHRha2luZyB0aGUgZXJyb3Ig
cGF0aCB3aXRob3V0IGFuY2lsbGFyeQ0KY29sbGF0ZXJhbCBkYW1hZ2UuwqAgSXQ6DQoxKSBaZXJv
cyBhbGwgdGhlIHJvb3QgZnJhbWVzDQoyKSBTd2l0Y2hlcyB0byBhIHJlbW90ZSBWTUlEIGluIG9y
ZGVyIHRvIGZsdXNoIHRoZSBUTEJzLCBub3QgdGhhdCB0aGV5DQpuZWVkIGZsdXNoaW5nIGluIHRo
ZSBmaXJzdCBwbGFjZQ0KMykgRm9yIGFsbG9jYXRlZCBQMk0gcGFnZXMsIG1vdmVzIHRoZW0gb25l
IGF0IGEgdGltZSBvbnRvIHRoZSBmcmVlIGxpc3QsDQp0YWtpbmcgdGhlIHBhZ2luZyBsb2NrIGZv
ciBlYWNoIGZyYW1lDQo0KSAod3JhcHBpbmcgdGhlIHByZWVtcHRpYmxlIGhlbHBlciB3aXRoIGFu
IGlnbm9yZSBsb29wKSBmaW5hbGx5IGZyZWUNCnRoZSBjb21wbGV0ZSBwb29sLg0KDQouLi4gaW4g
YSBjYXNlIHdoZXJlIDE2IGlzIHRoZSBjaG9zZW4gdmFsdWUgYmVjYXVzZSB5b3UncmUgYWxyZWFk
eQ0KY29uY2VybmVkIGFib3V0IHRoZSBoeXBlcmNhbGwgdGFraW5nIHRvbyBsb25nLg0KDQpJcyB0
aGF0IHNhZmU/IFBvc3NpYmx5LsKgIElzIGl0IHdpc2U/wqAgbm8uDQoNCllvdSBjYW4ndCB0ZXN0
IHRoZSBlcnJvciBwYXRoIGluIHF1ZXN0aW9uIGhlcmUgKGJlY2F1c2UgbXkgZmF1bHRfdHRsDQpw
YXRjaGVzIGFyZSBzdGlsbCBwZW5kaW5nKS7CoCAiQ29ycmVjdG5lc3MiIGlzIGFsbW9zdCBleGNs
dXNpdmVseSBieSBjb2RlDQppbnNwZWN0aW9uLg0KDQpBbHNvIHJlYWxpc2UgdGhhdCB5b3UndmUg
bm93IHNwbGl0IHRoZSBoZWxwZXIgYmV0d2VlbiByZWd1bGFyIGh5cGVyY2FsbA0KY29udGV4dCwg
YW5kIFJDVSBjb250ZXh0LCBhbmQgcmVjYWxsIHdoYXQgaGFwcGVuZWQgd2hlbiB3ZSBmaW5hbGx5
DQpzdGFydGVkIGFzc2VydGluZyB0aGF0IG1lbW9yeSBjb3VsZG4ndCBiZSBhbGxvY2F0ZWQgaW4g
c3RvcC1tYWNoaW5lIGNvbnRleHQuDQoNCkhvdyBjZXJ0YWluIGFyZSB5b3UgdGhhdCB0aGUgc2Fm
ZXR5IGlzIHRoZSBzYW1lIG9uIGVhcmxpZXIgdmVyc2lvbnMgb2YNClhlbj/CoCBXaGF0IGlzIHRo
ZSBsaWtlbGlob29kIHRoYXQgYWxsIG9mIHRoZXNlIGFjdGlvbnMgd2lsbCByZW1haW4gc2FmZQ0K
Z2l2ZW4gZnV0dXJlIGRldmVsb3BtZW50Pw0KDQoNCkRlc3BpdGUgd2hhdCBpcyBiZWluZyBjbGFp
bWVkLCB0aGUgYXR0ZW1wdCB0byBzaGFyZSBjbGVhbnVwIGxvZ2ljIGlzDQppbnRyb2R1Y2luZyBm
cmFnaWxpdHkgYW5kIHJpc2ssIG5vdCByZW1vdmluZyBpdC7CoCBUaGlzIGlzIGEgYnVnZml4IGZv
cg0KdG8gYSBzZWN1cml0eSBmaXggaXNzdWUgd2hpY2ggaXMgdG90YWxseSBkZWFkIG9uIGFycml2
YWw7IG5ldCBzYWZldHksDQplc3BlY2lhbGx5IGluIG9sZGVyIHZlcnNpb25zIG9mIHRoZSBYZW4s
IGlzICp0aGUgaGlnaGVzdCBwcmlvcml0eSouDQoNClRoZXNlIHR3byBkaWZmZXJlbnQgY29udGV4
dHMgZG9uJ3Qgc2hhcmUgYW55IGNvbW1vbiBwcm9wZXJ0aWVzIG9mIGhvdyB0bw0KY2xlYW4gdXAg
dGhlIHBvb2wsIHNhdmUgZnJlZWluZyB0aGUgZnJhbWVzIGJhY2sgdG8gdGhlIG1lbW9yeQ0KYWxs
b2NhdG9yLsKgIEluIGEgcHJvcGVyIGRlc2lnbiwgdGhpcyBpcyB0aGUgaGludCB0aGF0IHRoZXkg
c2hvdWxkbid0DQpzaGFyZSBsb2dpYyBlaXRoZXIuDQoNCg0KR2l2ZW4gdGhhdCB5b3UgZG8gZXhw
ZWN0IHNvbWVvbmUgdG8gc3BlbmQgeWV0LW1vcmUgdGltZSZlZmZvcnQgdG8gdW5kbw0KdGhlIHNo
b3J0IHRlcm0gaGFjayBjdXJyZW50bHkgYmVpbmcgcHJvcG9zZWQsIGhvdyBkbyB5b3UgZW52aXNh
Z2UgdGhlDQplbmQgcmVzdWx0IGxvb2tpbmc/DQoNCn5BbmRyZXcNCg0KWzFdIEFsdGhvdWdoIHRo
ZSBvcmRlciBvZiBhY3Rpb25zIGluIHAybV90ZWFyZG93bigpIGZvciB0aGUgY29tbW9uIGNhc2UN
CmlzIHBvb3IuwqAgVGhlIHJvb3QgcGFnZXRhYmxlcyBzaG91bGQgYmUgY2xlYW5lZCBhbmQgZnJl
ZWQgZmlyc3Qgc28gc3RlcHMNCjEgYW5kIDIgb2YgdGhlIGxpc3QgYWJvdmUgYXJlIG5vdCByZXBl
YXRlZCBmb3IgZXZlcnkgY29udGludWF0aW9uLg0K

