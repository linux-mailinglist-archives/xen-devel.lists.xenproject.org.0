Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D129163F300
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450814.708278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kh4-0005zu-6A; Thu, 01 Dec 2022 14:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450814.708278; Thu, 01 Dec 2022 14:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kh4-0005xN-2x; Thu, 01 Dec 2022 14:37:42 +0000
Received: by outflank-mailman (input) for mailman id 450814;
 Thu, 01 Dec 2022 14:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0kh2-0005xH-C1
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:37:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b317a99c-7185-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 15:37:38 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 09:37:35 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by DS7PR03MB5541.namprd03.prod.outlook.com (2603:10b6:5:2ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 14:37:33 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:37:33 +0000
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
X-Inumbo-ID: b317a99c-7185-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669905458;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2a6X1odYGz18AIWN2ze9NBqfaMB0fs6Us7TSZizNaN0=;
  b=aHICUH2sroi2wzkWKdf2cwxKYV4YUJjWEN7smBAzA8TgckSLLWxuP658
   k4UPc2GWfgREIwZT0PPZEz5Y/dWeCE8kz1Z7Zj5JNuoVTNXDM6A8GL0zZ
   s/eTao9KyenZhbJJ+MpKVAQSMdnXHky5itKOukmKa6BLf9JCzHEG73mzf
   s=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 86484686
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ilCFkK9ODQPLyyLT6NPDDrUDp3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GBKD22HMquJNzT9Koxxaonn8BgD6MDcy9M2HlRu/Co8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6gS5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklTq
 9EoBjoVZCnTmrvv66zmSrFUiPwKeZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpjNABM/KMEjCObchZgEee4
 H7B5WP6KhobKMae2XyO9XfEaurnzX2nCN5MROPQGvhCmXCQwGNQNiQvZWCF8cedyU6fHPRPN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNAvqsIeXzEh0
 V6N2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoOS1QD6ty6+IUr1EuXEpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPORENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:+1tNeaBm9+3ttzjlHem755DYdb4zR+YMi2TDsHoQdfU1SKGlfq
 WV954mPHDP+VUssQ4b6LW90cW7LU80lqQFg7X5X43CYOCOggLBEGgI1+XfKlPbdBEW/9QtsZ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86484686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ+GcINoH8ENHYYLTTw3NQD6d2b6dkMAgvkVfevHPIankqbObTm0E6yrTPbDbOCYquJylRlYVpG2MeufcRx69wgM4t30FYH63nsoPAN5IShuBXjwavDN/mD4PZve6GVaWa4mRBgBsybqihc+A3Y20e05dUu7MTqsZjPqW6RVBAZiIFPGMFZIFx+pdyDY1r0TfVlajlrt7FTlNI7dc23f7mzftXKBKr+nPS6XNGVzCAHt4RYewuiU9cNlRfZlS2SjZLxF1tKwP4lmLLeyiA+OcomcryFFgo2N5HX2pWkcqCYB9DwRuuYeYMUY3laio93EqA+EtPGOTNoA1XwJIaytrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2a6X1odYGz18AIWN2ze9NBqfaMB0fs6Us7TSZizNaN0=;
 b=GsSy5qysnERGZr1okTV4d7aEwte+QOUdYFI/I+XCtiMt3/Z+Fwfw6162r4sdZAAWop0KpPl2tscv/MuuPXoy8crbX8qRpYJ9o9BgS7oVWPyT/m6QnWlyx+mlQ0zwmVUCKMx8gKuEW2JIP7LPWDpk8behvCb+NCVFUtIKeuIUAJahjBoILosZefUQc1732fxA2hVPNCA/muxvrQVArIieW6oZ0vTMtB/YQJ9M1TtH9S3kPJL9n5vpMVDyCvpMGoDdpQiWYBvX/dpU7pzxIkLwSdbhqvSA8cow9XSbSFdpmTsCA8d0iLZHe4rJT57opZEWN+yCxIciSaWEyDTDNm7lAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2a6X1odYGz18AIWN2ze9NBqfaMB0fs6Us7TSZizNaN0=;
 b=bdCz4n0pY/pCOTV6s6otjZFc67xYNehFv3m48mX1n1x/5jGusjtMq2oTeNKnBWttgnLRXXLvC4bWtVtNlqXkNnTo1y020fT0y6pcBLmmc8sU3ozn1yApcjo5D770L4dSjx+NGZgiHXy/3kHOuEIVimRVCXtKDxvlRVMotsWa1a4=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Topic: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Index: AQHZBOHW/H7dZ4yOzkGdiH1xKACrBq5Y590AgAAh0QCAAAbXgIAACo8A
Date: Thu, 1 Dec 2022 14:37:33 +0000
Message-ID: <CB818025-8988-47F6-81D9-94618C498DC7@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <4daa8daa6398774e5cb0a90c30648c970faed6af.1669829264.git.edvin.torok@citrix.com>
 <71ff1c99-4006-dd28-e01a-4c2946798f78@citrix.com>
 <EEEF329C-788A-41A0-BDC5-9E42ED07416B@citrix.com>
 <f32ccd3c-0a68-ef39-296f-8071aed12453@citrix.com>
In-Reply-To: <f32ccd3c-0a68-ef39-296f-8071aed12453@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|DS7PR03MB5541:EE_
x-ms-office365-filtering-correlation-id: b78f925c-48a6-4839-a3b1-08dad3a9953a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +1VQx2XFEkCTdifmKD4Sx3peHRBN+slbPYdQ30P70DCV5jwBc6OO/NwsRNgWrUOoZWwPCtsWvUnO+2O6F7DGt6GGaBRg775cjINvAZqqAEohA3IPyobOzEzvcHani7Y1kFNwm9ywIhSZfWiCly70xPvSr8izUrH+ws4LIqIIs0fcfeIt/cl91PHToHLCu0bgXmSFGN+Qe7JicdAtaCwzjPMp/DUbexayksLghyC28xi0r9yZCHYmvJwnmTXX+7TzHw1L9pDLJRgTpzM1bW1apc2wg8vvTD8+deyMeTpBtt0w3HILKfR4J8e8bXFhqJ/STZHpOO/q773RQYJekZtQ6y0L0jim/JGl3681fxFlA0ywwyHDZZPw/GbjGk0GchCAgygxkFaVPaMrmJNBR7Aivv1xfAy5iktHKT753OnR3RsKeiip8ylCI7C/+8bnK8taOfY3DTN1itDu1i1WDqrR3ojUTHuq5Nc+ZdLh2pCnACsCKtJQQGEvaFVYYHcWC9gmsLox//yh5+wafSD9HaWCUEZkliW/cXTfG7A3iwFiFMOOX1qvSHHQaZk+6ks+pOk5ne/a9+NlXrFUN3AgvGXzChcUMovucCY8QmrsZmC0Nw+pNCT5mvWYf4pF5txj2JTGsZUzyKh8fdo00XwndFQ/DQtt4zmGtuizc8deV5Zvr133dORKDk1Ov3LmTrxs7V0dhPqxLuzOcgJLGCoSn2sctdNlQIc464JkbPjz3DikMcY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(478600001)(38100700002)(8936002)(53546011)(6862004)(64756008)(86362001)(6512007)(5660300002)(36756003)(122000001)(6486002)(6506007)(82960400001)(8676002)(66446008)(26005)(66476007)(66946007)(38070700005)(66556008)(33656002)(316002)(2906002)(91956017)(4326008)(71200400001)(37006003)(83380400001)(6636002)(76116006)(41300700001)(54906003)(66574015)(2616005)(186003)(107886003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGV1UWVYb0ZhTUJHTEhQOGQwVHpURW5nRWFDVTJDNzh4MGN2cW8rVkVLQVQw?=
 =?utf-8?B?NHVTNmF1THc2eDk0QWtqVlg5djVVMHp0VzdNLytrT3B2cTFKRi9FMWVld0tp?=
 =?utf-8?B?Uzg4anZmcFV3OFZYMDI1ZTdNMzYxd1FtK1Y3RUpZeGVHUmZJTzhWMnNtSmV6?=
 =?utf-8?B?bkZDSjF5MisrMkNOSGVxS2trR05ybUV0a0JBU2JHalNpamIzTGNzT2VmS1BI?=
 =?utf-8?B?NXZWRWUrVjNYNXZ3WUMyUFZROVFCQkgwdU5kMFdKMklvV1Nic3Z2RzlVWmpj?=
 =?utf-8?B?WGp0UmVSWEhiQnZ3MWpCYmdsUVB4cytXdE5iYmVtdEdMMU42cjA2a1RQdE1u?=
 =?utf-8?B?citNWDk3QTBuVjhwQlc1U0hHSmlvdmcxT2lRZjZUTU9vSnVjcUZDQ0tuU0h6?=
 =?utf-8?B?eU1nT1pITWVkQnp4T0xVYkpDNTArbjJZekQxZndWRi9pend3U0M2K2Jpbm5H?=
 =?utf-8?B?dFpQOWdkcllVTW8wVlM0SGpJMkZVeWNYL0R4anFFOXVtWkU5OExiRkFpZ0Ra?=
 =?utf-8?B?aFYwck8vRW1aN1V6dG55Q0RIV1FIUDllaHJheGZFaCtJajdGZUdxSTFQdm5X?=
 =?utf-8?B?S05TbGZMMGVWd3hBUk9ZR3pQVEZLNDZBMkRNcXJGcE9ZWCsvK2l1WVEyZEZx?=
 =?utf-8?B?b1l3VzNDaFJ2NG03NUd1KzZiNkpyS2ZwRTVLSy9mVlhzSk1nQ3R1SGt6L2VY?=
 =?utf-8?B?djVZRWN5OTVUSlVIWjJIWDZ6ZG9pVnoyUFdqYzdLTWJXWlMvUmh3WWlmZXJ2?=
 =?utf-8?B?NEFPR2dQak1NTGd2ODZKejBTcloxS1EwTkdqTG1tVlJ5M2xLRzhKY1lSNlFJ?=
 =?utf-8?B?RElqR095VHQ1Slk1eGM1NWlUT21vbEE1dk15VU5sS0VRQlpUWlFmd1FhdEVJ?=
 =?utf-8?B?VmwxUllMRmVBbG5ielhlTWxMQlR6ZFcvaUZiR3pPRGhCaGZCUzNaZVFqcmFj?=
 =?utf-8?B?Ujc4OEhISTI5ZWxvclg5dUNWNmpEelYvWmRGZ2tyZ0tKcVE4VTc1UWhnblB5?=
 =?utf-8?B?RWhJOTFMUit2anI4QVRFN1ExTDVKOXkzMGhzTm9CWXYyRFlRbVZKck8rd0o5?=
 =?utf-8?B?T1A3SVZkSnpIbUhmNjZsZUhWVStURUV2Lzg2QnB3NGQyVXpkUWZEck05RmR6?=
 =?utf-8?B?MnRsNmUvUVl0RmlhVS9NbWNUb29TeWpMTGdpQjlvUDduZkg3ZUkrb044OHBh?=
 =?utf-8?B?bTVXYXFZOXN1V0pKRUZFaEtTNzVOOTZGeWtWeUlQL2dlQmRFRFo5bGJtZVVx?=
 =?utf-8?B?c3ZheFd0Wk5pOVB2aTVLdXo2ditha1hXWHlKUW4xRE44bWNseUdsRXRrd2pl?=
 =?utf-8?B?aTArK0FnelZyOU1QOUtVYnZtdjRvMEpsRGlmeE9zc0ZwVDIwWkdjOGQ4aWw2?=
 =?utf-8?B?VTRtYzNsaHZNU0RHdEN3eEhEMWk1SW1KUVBnZmdvYlpWTnlCdjZDSVNIZStD?=
 =?utf-8?B?eURhZXZlZGRXZVBKN2xNWmtHR0Fzank5S1QxSVR3WjJGWTRHekhwWmUxU0o3?=
 =?utf-8?B?NHlRVjIxM0pTM3ZFSzFwUWtkTjF6TlhXQTFFVVpia2RuOWloQTc1ZHBQNlNG?=
 =?utf-8?B?YXNqQnExUXhua2ZtVDNqU2JNa3c4VE50T3piUXdRSk44TWxjaUZ3ajM4dktN?=
 =?utf-8?B?Tm1veXovUDNYN3NWUTNuV0t6TjhDOStBa3E0bWlWK2hrRjRFcVdCcDg0K1Ev?=
 =?utf-8?B?dFMrLzFjV05FL2Y5YU9wMUhxZjlBSVVJUGVHc3Q0Q3pXZVZzM1VYbGROKzla?=
 =?utf-8?B?amppYnI0MHJycCtzTUJsbjRWMXcvaU5HNFBjSnhlVWhKK213a3luVDFWRnZJ?=
 =?utf-8?B?dGU4ZDY0NTNzMFZZdXFZUWhGSkk2a3loa3M0M3FsQWFYc3FnbHhzWW1pZGhi?=
 =?utf-8?B?QTVZbkxoNDY0NmJPQ2VUT3o1THpUQ1QwNHBFUmFOcTVIcGxCc29kSyt2TU1q?=
 =?utf-8?B?VkViM0lBNHFHNnBPYmtoUmJEV2pVSndGRHE1N3A0eU1qOUxjZTVka2pHMC9z?=
 =?utf-8?B?dDhuMXBDWGEyVmRjUXVQSkxSejh6aUZHZHo3NjFmaWUzeFd5TG9qYnkvSmFs?=
 =?utf-8?B?QUp3clVqQ3kzMWZqMjVPOTdHVFJUMk9kdE5NOERoeFI4UnJyZFV1VWJNWEVv?=
 =?utf-8?B?U3BNdkVJVk5WTUp6TXRLdStLd0RTMW9ZaVRPMkE5T0Z5UjFZRzFBMkRoNGUy?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D810BF4D4D09A4E96883BCE250B28F2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1W/dLnEuD8RWTcHXUZmCJgzTnZvFiqhE2T3+lnC3UeLG8O4vnDJjtiNUZ0JV68Ap86BaKKXAJ8mbk6lHK9yxpRDne+87Snktk6M4XyfbLWf0Nqfuswb9G7vURqo4JmV4MYmeYKGd2EgYLTz8rEZD/xRxOEfJk4kt+hAd/weJuDFx1aPR1z3OlyAUCZoVM7RLxJCpO0BqpydGF4qLfb4kegkquxFX4sx5s+WNCIChMvAFMuXMyprnGz1Y/iwlBEVRRlOgMqrXnUzoO2xvnysQs/jlYz3lrOP3Sfw6kt/4FdS/Ppx9tdFVNWMg8gaZT/+cYb541jzjgSRP48dO6YBjAt6qAP7p7l9FnMjQ5IafiIOtIqrTmMmhnMJz38rh4S8BAnKieg/pvUW/DtotowVqtOoZZezxGTCofD6/Vybcq4KzhNKipypzCp8BeAbZ1UUGrc28CLjpVnoPKW3KlxYmF7YJDkRMbiq7r8zoXW3yLvFR4JvnJzqX1iNhKTrYvp4k275zuupmWbNt3BJ+cJX8CVQH/8xa7Q5s5S9nZI5HhyBbAAHC+sIHp0STx4T9c6OlEpMztCjPhpikZ8LTDpfZSaWvXRe9WJXwEaVZHU8yOD/XIENHHqYqIWsXmm5NEQCB4da2B7XK3nzjsXZQyp6EVbVW8tPN63s7ZX23kAv+3sLLwc0dTGQJVSGLG5jQJ8igUkfmiV47qJRo2jbCZ8U4Fsjas4n9YSgDJlmy7Ee/ndziFhq6ooZBUhKoudKkmBV96ehD3edysboKijDPIzOD5qrKVu7ZjWGUFe53fFz3uGmhr8L66n291/0LpQ6eRJkyw3SUbE/W4vPn1SEMk+w0KA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78f925c-48a6-4839-a3b1-08dad3a9953a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 14:37:33.2459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVSH9OCbd2aWfSGirbNeqrwTjnZU1j+rDP1wPv8EqPlgTSNqhgdlJr9053GUbvzc0yvgpVP5mtJknwmmo+pfPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5541

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTM6NTksIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDEvMTIvMjAyMiAxMzozNSwgRWR3aW4g
VG9yb2sgd3JvdGU6DQo+Pj4gT24gMSBEZWMgMjAyMiwgYXQgMTE6MzQsIEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDMwLzExLzIw
MjIgMTc6MzIsIEVkd2luIFTDtnLDtmsgd3JvdGU6DQo+Pj4+ICsNCj4+Pj4gKyAgICBjYW1sX2Vu
dGVyX2Jsb2NraW5nX3NlY3Rpb24oKTsNCj4+Pj4gKyAgICByYyA9IHhjX2V2dGNobl9zdGF0dXMo
X0goeGNoKSwgJnN0YXR1cyk7DQo+Pj4+ICsgICAgY2FtbF9sZWF2ZV9ibG9ja2luZ19zZWN0aW9u
KCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIHJjIDwgMCApDQo+Pj4+ICsgICAgICAgIGZhaWx3
aXRoX3hjKF9IKHhjaCkpOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCBzdGF0dXMuc3RhdHVzID09
IEVWVENITlNUQVRfY2xvc2VkICkNCj4+Pj4gKyAgICAgICAgcmVzdWx0ID0gVmFsX25vbmU7DQo+
Pj4+ICsgICAgZWxzZQ0KPj4+PiArICAgIHsNCj4+PiBUaGlzIGlzIGFjdHVhbGx5IG9uZSBleGFt
cGxlIHdoZXJlIHVzaW5nIGEgc2Vjb25kIENBTUxyZXR1cm4gd291bGQNCj4+PiBzaW1wbHkgdGhp
bmdzIHN1YnN0YW50aWFsbHkuDQo+Pj4gDQo+Pj4gc3dpdGNoICggc3RhdHVzLnN0YXR1cyApDQo+
Pj4gew0KPj4+IGNhc2UgRVZUQ0hOU1RBVF9jbG9zZWQ6DQo+Pj4gICAgQ0FNTHJldHVybihWYWxf
bm9uZSk7DQo+Pj4gDQo+Pj4gY2FzZSBFVlRDSE5TVEFUX3VuYm91bmQ6DQo+Pj4gICAgLi4uDQo+
Pj4gDQo+Pj4gV291bGQgcmVtb3ZlIHRoZSBuZWVkIGZvciB0aGUgb3V0ZXIgaWYvZWxzZS4NCj4+
IA0KPj4gQ0FNTHJldHVybiBoYXMgc29tZSBtYWNybyBtYWdpYyB0byBlbnN1cmUgaXQgZ2V0cyBw
YWlyZWQgd2l0aCB0aGUgdG9wbGV2ZWwgQ0FNTHBhcmFtIGNvcnJlY3RseSAob25lIG9mIHRoZW0g
b3BlbnMgYSB7IHNjb3BlIGFuZCB0aGUgb3RoZXIgY2xvc2VzIGl0LCBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0KSwNCj4+IHNvIEknZCBhdm9pZCBwdXR0aW5nIGl0IGludG8gdGhlIG1pZGRsZSBvZiBv
dGhlciBzeW50YWN0aWMgZWxlbWVudHMsIGl0IG1pZ2h0IGp1c3QgY2F1c2UgdGhlIGJ1aWxkIHRv
IGZhaWwgKGVpdGhlciBub3cgb3IgaW4gdGhlIGZ1dHVyZSkuDQo+IA0KPiBGcm9tIHRoZSBtYW51
YWw6DQo+IA0KPiAiVGhlIG1hY3JvcyBDQU1McmV0dXJuLCBDQU1McmV0dXJuMCwgYW5kIENBTUxy
ZXR1cm5UIGFyZSB1c2VkIHRvIHJlcGxhY2UNCj4gdGhlIEMga2V5d29yZCByZXR1cm4uIEV2ZXJ5
IG9jY3VycmVuY2Ugb2YgcmV0dXJuIHggbXVzdCBiZSByZXBsYWNlZCBieSAuLi4iDQo+IA0KPiBJ
dCBpcyBjb21tb24gaW4gQyB0byBoYXZlIG11bHRpcGxlIHJldHVybnMsIGFuZCB0aGUgbWFudWFs
IGRvZXMgc2F5DQo+ICJFdmVyeSBvY2N1cnJlbmNlIiB3aXRob3V0IHN0YXRpbmcgYW55IHJlcXVp
cmVtZW50IGZvciB0aGVyZSB0byBiZSBhDQo+IHNpbmdsZSBvY2N1cnJlbmNlLg0KPiANCj4gQ0FN
THJldHVybiBjYW4ndCBzeW50YWN0aWNhbGx5IHdvcmsgc3BsaXR0aW5nIGEgc2NvcGUgd2l0aCBD
QU1McGFyYW0sDQo+IGJlY2F1c2UgdGhlbiB0aGlzIHdvdWxkbid0IGNvbXBpbGU6DQo+IA0KPiBD
QU1McHJpbSB2YWx1ZSBzdHViX3hjX2V2dGNobl9zdGF0dXModmFsdWUgZm9vKQ0KPiB7DQo+ICAg
ICBDQU1McGFyYW0xKGZvbyk7DQo+ICAgICBpbnQgYmFyID0gMDsNCj4gDQo+IHJldHJ5Og0KPiAg
ICAgaWYgKCBiYXIgKQ0KPiAgICAgICAgIENBTUxyZXR1cm4oZm9vKTsNCj4gDQo+ICAgICBiYXIr
Kw0KPiAgICAgZ290byByZXRyeTsNCj4gfQ0KPiANCg0KDQpJIHdvdWxkbid0IGV4cGVjdCBpdCB0
bywgb3IgYXQgbGVhc3QgSSd2ZSBuZXZlciBzZWVuIGEgQyBiaW5kaW5nIHdyaXR0ZW4gdGhhdCB3
YXkgKHdpdGggQ0FNTHJldHVybiBub3QgYXMgbGFzdCBzdGF0ZW1lbnQpLA0KYnV0IGluZGVlZCBu
b3RoaW5nIGluIHRoZSBtYW51YWwgc3RhdGVzIHRoYXQgaXQgd291bGRuJ3Qgd29yay4NCg0KPiBD
QU1McmV0dXJuIGRvZXMgdXNlIGEgbm9ybWFsICJkbyB7IC4uLiB9IHdoaWxlICgwKSIgY29uc3Ry
dWN0IHNpbXBseSBmb3INCj4gYmVpbmcgYSBtYWNybywgYW5kIGZvcmNlcyBwYXJpbmcgd2l0aCBD
QU1McGFyYW1YIGJ5IHJlZmVyZW5jaW5nIHRoZQ0KPiBjYW1sX19mcmFtZSBsb2NhbCB2YXJpYWJs
ZSBieSBuYW1lLg0KPiANCj4gDQo+IFNvIEkgcmVhbGx5IGRvIHRoaW5rIHRoYXQgbXVsdGlwbGUg
Q0FNTHJldHVybnMgYXJlIGZpbmUgYW5kIGNhbm5vdA0KPiByZWFzb25hYmx5IGJlIGJyb2tlbiBp
biB0aGUgZnV0dXJlLg0KPiANCj4gQnV0IGlmIHdlIGRvIHJlYWxseSBzdGlsbCB3YW50IHRvIGtl
ZXAgYSBzaW5nbGUgcmV0dXJuLCB0aGVuIGEgImdvdG8NCj4gZG9uZSIgd291bGQgYmUgYWNjZXB0
YWJsZSBoZXJlIGFuZCBzdGlsbCBiZXR0ZXIgdGhhbiB0aGUgaWYvZWxzZS4NCg0KSSBhbG1vc3Qg
YWx3YXlzIHVzZWQgdG8gdXNlIGRvL3doaWxlKDApIGFuZCBicmVhayBldmVuIGluIEMgYXMgYSBy
ZXBsYWNlbWVudCBmb3IgJ2dvdG8nLA0KZXNwZWNpYWxseSBpZiB0aGVyZSBhcmUgbXVsdGlwbGUg
bmVzdGVkIHJlc291cmNlcyB0aGF0IG5lZWQgY2xlYW5pbmcgdXAsIGRvL3doaWxlIGVuc3VyZXMg
eW91DQp1bndpbmQgdGhlbSBpbiB0aGUgY29ycmVjdCBvcmRlciBhbmQgZG9uJ3QgYWNjaWRlbnRh
bGx5IHNraXAgb25lLg0KSSB0aGluayBtb3N0IGNvZGUgdGhhdCBpcyB3cml0dGVuIHVzaW5nICdn
b3RvJyBjYW4gYmUgcmV3cml0dGVuIG5vdCB0byB1c2UgaXQsIGFuZCBtaWdodCBhdm9pZCBzb21l
IGJ1Z3MgaW4gdGhlIHByb2Nlc3MNCihlLmcuIHVzaW5nIGdvdG8gbWlnaHQgbGVhdmUgc29tZSBs
b2NhbCB2YXJpYWJsZXMgdW5pbml0aWFsaXNlZCkuDQpJJ20gcmVsdWN0YW50IHRvIGludHJvZHVj
ZSBhIGdvdG8ganVzdCB0byBkZWNyZWFzZSBuZXN0aW5nIGxldmVsLg0KDQpUaGVyZSBtaWdodCBi
ZSBhbm90aGVyIHdheSB0byByZXdyaXRlIHRoZSBjb2RlOg0KYGBgDQpzd2l0Y2goc3RhdHVzLnN0
YXR1cykNCnsNCmNhc2UgRVZUQ0hOU1RBVF9jbG9zZWQ6DQogc3RhdCA9IFZhbF9ub25lOw0KIGJy
ZWFrOw0KLi4uIG90aGVyIGNvZGUgdGhhdCBhc3NpZ25zIHRvIHN0YXQgc29tZXRoaW5nIG90aGVy
IHRoYW4gTm9uZSAuLi4NCn0NCg0KaWYgKFZhbF9ub25lID09IHN0YXQpIHsNCiAgIHJlc3VsdCA9
IFZhbF9ub25lOw0KfSBlbHNlIHsNCiAgIC4uIGNvZGUgYXMgaXQgd2FzIGJlZm9yZSB0byBjb25z
dHJ1Y3QgYSBzb21lIC4uLg0KfQ0KDQpDQU1McmV0dXJuKHJlc3VsdCk7DQpgYGANCg0KVGhpcyB3
b3VsZCB0aGVuIGZvbGxvdyB0aGUgbG9naWNhbCBvcmRlciBvZiBob3cgdGhlIHZhbHVlcyBhcmUg
Y29uc3RydWN0ZWQsIGFuZCBhdm9pZHMgdGhlIGRlZXAgbmVzdGluZyBvZiB0aGUgc3dpdGNoLg0K
KHJlYWRpbmcgdGhlIGNvZGUgYmFja3dhcmRzIGZyb20gZXhpdCB3aWxsIHNob3cgeW91IGhvdyBl
YWNoIHBpZWNlIGlzIG5lc3RlZC9jb25zdHJ1Y3RlZCB3aXRob3V0IGp1bXBzIHRoYXQgYWx0ZXIg
Y29udHJvbCBmbG93KQ0KDQpWYWxfbm9uZSA9PSBpcyB1c2VkIGluc3RlYWQgb2YgPT0gVmFsX25v
bmUgdG8gY2F0Y2ggYSB0eXBvIHdoZXJlIHN0YXQgPSBWYWxfbm9uZSB3b3VsZCBjaGFuZ2Ugc3Rh
dCwgd2hlcmVhcyBWYWxfbm9uZSA9IHN0YXQgd291bGQgYmUgYSBjb21waWxlIGVycm9yLg0KDQpX
aGF0IGRvIHlvdSB0aGluaz8NCg0KKG1pZ2h0IGJlIHNsaWdodGx5IGxlc3MgZWZmaWNpZW50IHRo
YW4gdGhlIG9yaWdpbmFsIHZlcnNpb24sIGJ1dCBhIHJlYXNvbmFibGUgQyBjb21waWxlciBzaG91
bGQgcHJvZHVjZSBhbG1vc3QgZXF1YWwgb3B0aW1pemVkIGNvZGUgZm9yIGJvdGgpLg0KDQo+IA0K
Pj4+IGNhbWxfYWxsb2Nfc29tZSgpIGlzIHBlcmhhcHMgbGVzcyBpbnRlcmVzdGluZyBhcyBpdCBv
bmx5IGFwcGVhcmVkIGluDQo+Pj4gT2NhbWwgNC4xMiBBRkFJQ1QsIGJ1dCB3ZSBjb3VsZCBhbHNv
IGhhdmUgc29tZSBpZmRlZmFyeSBmb3IgdGhhdCBhdCB0aGUNCj4+PiB0b3Agb2YgdGhlIGZpbGUu
DQo+Pj4gDQo+Pj4gSSBkb24ndCBrbm93IHdoZXRoZXIgd2UgaGF2ZSBvcGVuY29kZWQgb3B0aW9u
cyBlbHNld2hlcmUgaW4gdGhlDQo+Pj4gYmluZGluZ3MsIGJ1dCBpdCBjZXJ0YWlubHkgd291bGQg
YmUgcmVkdWNlIHRoZSBhbW91bnQgb3BlbmNvZGluZyB0aGF0DQo+Pj4gZXhpc3RzIGZvciBzdGFu
ZGFyZCBwYXR0ZXJucy4NCj4+IA0KPj4gcGVyaGFwcyB3ZSBjYW4gbG9vayBpbnRvIGRvaW5nIHRo
YXQgY2xlYW51cCBhcyBhIHNlcGFyYXRlIHBhdGNoLg0KPiANCj4gUHJvYmFibHkgYmVzdCwgeWVz
Lg0KPiANCj4gfkFuZHJldw0KDQo=

