Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F663DBC1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450066.707220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qg5-0000Fv-6F; Wed, 30 Nov 2022 17:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450066.707220; Wed, 30 Nov 2022 17:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qg5-0000DV-2q; Wed, 30 Nov 2022 17:15:21 +0000
Received: by outflank-mailman (input) for mailman id 450066;
 Wed, 30 Nov 2022 17:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qg4-0008H3-09
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:15:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f8d631f-70d2-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:15:18 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Nov 2022 12:15:16 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by PH0PR03MB6771.namprd03.prod.outlook.com (2603:10b6:510:122::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 17:15:14 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 17:15:14 +0000
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
X-Inumbo-ID: 8f8d631f-70d2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669828518;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OXe9CxqgeX86lv66pzeEKIeBDPTOOvbZh4zRdLyGH+4=;
  b=hR/cEiu/HfZkERNNo9edE2zjBxa0dlCYJQTsQsLGyacL0Y9k8wTWGwFg
   4E28bavoMmpZxPnHMeASyErtNxlC1uYdJ8U6ioMC2zTi7lfjrRScEVVJO
   KBM4mvmsLi4724B/u+mFaN/jlfGfL7Id7xJ/17D2shky1IMwJSE9b3H6J
   o=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 86309945
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:C6b9Dql3PmHbj8Hp966MBYbo5gySJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJWDuBb/eCYzfyL95xOoi/px5Q75WGz4UyT1Q5/Hw1FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5weGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fMfKh8IfzDZvMSV8rvnR+RomvU4fca+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieewWDbWUoXiqcF9k0qGp
 2SA42PjBRIyP92D0zuVtHmrg4cjmAurBtlKRezkq5aGhnWOzXcQNh4pe2G7rOG1iBCVUoIHK
 RQbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2IB5UlqY/7aQ6D+3Zy4cKDZbYTdeFFRYpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:fS6bPa3vTjozxwh/sKajuAqjBWlxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6Ky90KnpewK5yXcH2/hvAV7CZnirhILMFupfBOTZskXd8kHFh4xgPO
 JbAtVD4b7LfBdHZKTBkXKF+r8bqbHozEnrv5al854Ed3AwV0gK1XYfNu/vKDwOeOAwP+teKH
 Pz3Lsjm9J9EU5nM/hTAENrYwE5nbD2fWjdCyIuNloG8w+IlDWy9frQFRWJ5BcMX1p0rYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/M28ZOH8uFj+kSM3HJhhyzbIpsdrWetHRtydvfqWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HID+mLv0liRhFrkuIjcSCghA8RMqIpFel/y6lYmvvt7zK
 VXtljp+aZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRhZZ3xjIULL4wWAbBrKw3Gu
 hnC8/RoNxMd0mBUnzftm5zhPSxQ3UIGAucSERqgL3X79EWpgE686Ir/r1aop4yzuN7d3CC3Z
 WDDk1crsAKcibRV9MlOA5Oe7ruNoWHe2OzDIvbGyWXKEhAAQOWl3e/2sRE2Mi6PJMP15c8g5
 LHTRdRsnMzYVvnDYmU0IRM6Q2lehT3Yd1D8LAr23FVgMy0eFPQC1zKdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFJR9gKd3Z3ue5sbQboH6vO3Sd/jeYLLrDDY/Q2v6Rn
 8ORiL6KslM5l2iHnX4nB/SUXXwfVGXx+M7LIHKu+wIjIQdPIxFtQYYzVy/+8GQMDVH9rc7eU
 NvSYmX5J9TZVPGilogw18ZTya1VHwlk4kIe0k61zM3Dw==
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="86309945"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgZuTdmwe3UP+X3W6UXpQSK7+Guj2hyBgumWG957OvnaIUlvtnVcDzyhiHz/guhg0Vz1LBrdruqM+y8QfQGlwe2RZgFEgkbnllQDjjuJctqmsJJlNZVricj0tuwYLxAyoJvdK1RGFwboaQFFq7+T5L4WacOlWNKm4xl0aoiTpPHIWGulspud2mfAj4BMpQRok7Q3MTY023xgRRIfhjKtZ0xz0e36+kz2/0UGsuiLdc7Ug8QRirjk5vApOKG3lHymFWTXyWKl+pdLnF8kpiR0lFtpN5nWTPy7J7yuqI3rPyR8rgCq6R/Bd0VwdjNoNDp2g0Je9N0NwdkHBwTwsGFNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXe9CxqgeX86lv66pzeEKIeBDPTOOvbZh4zRdLyGH+4=;
 b=kDONjoVCNm1vchVKqEBKne7XTr6fvNBAr8zOlSN/BwWTFcdiVhvA1Qrl2DTWkAGcLvXqjIiHUbmvLWvjIoXr2p0wv2JBU875u6mmueJrMQiPJWv7CQhGxBXZWwmHYNNolqqsBU00o58eCoWFcjpZG4Dm5cEjxZWDxRKHCBhbgo4irQKKU2M73xoL2CVr0A5IsxGdoymtlX4SfxLFgtd/mAmkJLpgIXMcH3BDwl/SfCmMAQVTLWJsb3XCMkRyGbLh0dB1kNw+6GREgd52Wi6T94h+YEar5ZVBEnezVXuyfITMv9ZmrcPtjgLozyi2OI2sug6tQE9a9CTasbC3S49z6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXe9CxqgeX86lv66pzeEKIeBDPTOOvbZh4zRdLyGH+4=;
 b=rS9NVVyATolfXEvWxtunhdh5JWfms+WaCHuixdz4BKDnrorzAS/aBVmYWUA23GDpwbUU4EGZI5MKN8TFWtNxPJ26d34PBXv2MWL9+jXk90AYJo/i92jlh7bkNiR+kwY8+ivyiRgIvgqnAQtO8xLxm25ynfSftU0IjictnF5qnnA=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Topic: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Index: AQHZBNyC07UMyecyUU6qY7XFpbA+Qq5XtNiA
Date: Wed, 30 Nov 2022 17:15:14 +0000
Message-ID: <13A3294D-DF32-4F51-81B0-C92DFBF8977E@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-5-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|PH0PR03MB6771:EE_
x-ms-office365-filtering-correlation-id: 90b9935d-660e-48f8-cdfe-08dad2f67203
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rK3sOq86G+HcywCdj2yyqTpfy+RZ/H+ObAtMD0Q3Dns/Pa8L1IqYRaVDENqB1uyNrVFtrNie8YE1TAUS4OWbK9AOzDQsUNrxXjF6f+jxlQB24jOsrwtsVIPH/oBM6q7GoVaTVpYd1ywzwBONBNtvQNr8/0I5KjdskTrYXx4EzZa252SIFvS/jWgQOjBRZdVH7H6aQX6z5v4UdfhpP8XtGgoTfs1vRxY28pHkg/tlwUP58uszeIzQwArfoLcWKXfSoACBCUSU9O5KQL2242tnizcKsxk+w6/43otyi4UdiDAWkaHr624dw7zs8wAYylOedHs/MfRIMsDqzPDMafA42oWKL2kvxrIfrB+xmaOBceyvXvft14nLWaa1MtDdTMGA/CmyTyczPsIk+yl1ay2JksNjSVxsDD02xwmjvsWGkXF7xU4nSaoEt2AzrPujZBigwI1EzWzUAJ/THhTKgdKHqH6g0QTob6FGk8+NZeh5jTm1ZWSs/nTk8ZeSoBSCnCn9JgoKoxUeU8nT4aDwviYhT/+6vz5LH5lR7bBkVE4bO4LjBJ/Ry9F2G984NtF3ZZ8TauajLc33qu9isLlSLcoEnpeEGbgzUdvaY9kVb3jK4lB9rBJhVADZ3ZFsSSzmg3T+2c5umiOsfmhb3kQcQ4G+7V2QAI26ROR2DgFKFDAiLUV/URQ6XRhNCxhydw4nQ71tZzj7f0tbP6a2EWhFLiyR7f+J7U3DhkAmGXdsNezwbnw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(478600001)(83380400001)(6486002)(2906002)(53546011)(82960400001)(71200400001)(107886003)(6636002)(37006003)(54906003)(38100700002)(5660300002)(66574015)(38070700005)(122000001)(66946007)(6862004)(41300700001)(26005)(36756003)(8936002)(2616005)(66476007)(66556008)(64756008)(4326008)(86362001)(66446008)(6506007)(8676002)(6512007)(91956017)(186003)(33656002)(316002)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDdEZzJwTWh6NlMwdmh5aVZqV0VuQTh0SXRTTU5CQXg2L1A1aUZUU3ZHM1ZP?=
 =?utf-8?B?WnNkM29SY3BsY2x0dlNhSksydjdrQW04eHdQbVFjVXhvQUFsVU5pMzZpWnJ6?=
 =?utf-8?B?TG03VG8wU1dMYTViZVRrNUNUUlBWc1dNK3JmKzJBUktpSitzWE8zN0RxRnJv?=
 =?utf-8?B?TXB6VHAxN0txMTBKR0M1YU1nZjg0U1ZqM3pRUTYxWHZraWFNQzd5K092b1dT?=
 =?utf-8?B?Y3NUOHRtZDRraFpGZTAvSnNVWHR6UW1OZzRlT0Y1Umw4NmZnQytCZmpyUXpL?=
 =?utf-8?B?SVlNZVAxWCtLM014a3NnRzhaMmFLYVhadEJYOWZ1Q2paZldQd2o0dnBtU1hp?=
 =?utf-8?B?N3JieGtuMUI1RURxS2I0YmNHTWNFcHpZYUNhbnk0MmpPOUJwZHpiMURkczZo?=
 =?utf-8?B?WWxhSjFHcUk2ZFdOKzVXQ0h6UzlOMjVUc1ErNTI4K1FXNzVUMG1wcE4xWm9p?=
 =?utf-8?B?MUF6RjNEMjFSYW4xOGlLMm5GTEdCNXdyVHRCOFlVTzVubHJ6MkVJbC8wLzRm?=
 =?utf-8?B?dzF2WFJBVWkzWGNTMnNRT2hyVGR4V0d3Qzh2eHJRelRLdi8xcEwxVTk0M0N5?=
 =?utf-8?B?aDZ3cnd0MnBPT1orcUlMWHozMW5hbXJOOWt0WEphVXVaOUhMSDd5c05FSDhx?=
 =?utf-8?B?R0s0V0NoSi8vdGIyZ3pJZDYrQ0IxZDZUWTRSQVg3RlpHaWNSbGZiRWpjSi9i?=
 =?utf-8?B?NC9IR3diSGxhVy8vc1VpV3owTDZ2bUNNbERBSUxSQUphbjBpTkpNKytCNklu?=
 =?utf-8?B?bzYzSGNlMS9GUXVldktpMFlRKzFMaGhYYVlYTE93bmgvOWg0YTA1eXlISVdu?=
 =?utf-8?B?Z2dTYm1mbUJrS2gzc2MvTmVscnU0ZW1tb2V2NjNwZ2N5elE0aUFjQng4RU0x?=
 =?utf-8?B?NzNYY2pJN3RJVWd2a003V0FwTXU5QWN0TG9SWHA0QTlJaFJHSzU1YnJWa3o0?=
 =?utf-8?B?Wk9JQkdvUTk5dUsyZWdSUkg1VDFCY2FjU2g5dkhjNEl6aFk2eDRWMmtrMWI4?=
 =?utf-8?B?ei9VZkRQZEtLQmE3YXJzczgyU2ZXOWlqVFFDMjlIOE5mT0hXR09EclVKUXRQ?=
 =?utf-8?B?VG9yelU5YWlMYjBnaUxuM3JpaklCc09lNTg5MnpqV1NhNU1aY0R0Y2JSRXlx?=
 =?utf-8?B?R3piUmtlSjh1ZnRQcXhVWmd0SHE1TzBRNTJHUHh6WXlIbGdVa2lCUmcxaTkw?=
 =?utf-8?B?cnJWTFhpQUs1M2duNHdqQ3Ztcys0NFpaZXg1WU9RTWRuQ0k1YS9BMDlvZFJt?=
 =?utf-8?B?TVVLMDVuQjIwMXRpRmVwU1RxeWdzbFdTdkhvODZTNU5IM05jUndRMnRBUWlp?=
 =?utf-8?B?R1c1M0hKcmFZajdvM0pFM3doZG1oMFNodGVMMVo2SWd3SEhlTmxlL3dwYmFy?=
 =?utf-8?B?YTYrM2FOb29aYlRURWkwSUtQakdWUDNMdm1FODZIcXdLT05RTllYSUhTTE9k?=
 =?utf-8?B?ZXJ5blI1eEtjSkI4ZHZWYXl1eXJFTkpaUGVTeFlpSVRnWGpoUGdjemt6bmpU?=
 =?utf-8?B?UmtQalMvdHgrd1UvYmk4QTdmb2ViaC9pQXFIQ1RHS3FTYm9KQzlBL21wNmRx?=
 =?utf-8?B?enkzeG1pRkExQXBvc0d0eC9HNDJRTzUzMU1KUnhqYTNQWll4cGVkY0N4aVpD?=
 =?utf-8?B?V3VTekR2Q05SdEhJTGNhQmtOc2FrbkI2UGYrWFFicWUzU0VGT1NaTmowRnVU?=
 =?utf-8?B?VXhqK1RSRUFscnY1NWVMdlNnR1R4ckFPNWMxRERsWll1bDdWU0ZTdFlZVndp?=
 =?utf-8?B?VC9IdUdnYjAvcjVVem9tN01JZmhTY1Z2Y2t5alJFaWJyOVdZTlBvRkU4NS9u?=
 =?utf-8?B?OXJXTVc2bzJYc1haOHUrUkhWNjJTNXpoVG1uK2Fob21zMExlQ0hicUR2d1py?=
 =?utf-8?B?ZE5rQkVINFZOK1hucGFFYWI0SFlmK2t4VHJabkVLc3ZGelJqQ0RQTkVDSEh2?=
 =?utf-8?B?QjM2Zjd2NTNNcForSG5WR2pjQytoYlhwK05heGZTbkVWK1JtT1hMSWVZWXV3?=
 =?utf-8?B?TWkvVGwvbncyekFQa2RPRkFEaGNuTGxKVFpZRDJiUFhaSFNZQ3VoQ2k0M0hC?=
 =?utf-8?B?emhoRXl6VmdXb20waDVvTlh2YmRqbXcreWI4b1JHWmxGWFE1SERjcG96REFw?=
 =?utf-8?B?c2JGUThTbTI1UHNiOTRBMDFhNEFVZjJVTTRGSnlHSkRlOXZ6alNFQWhKby9s?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A22FB006742B3D4488685613820281B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JIEbq+NVRWetLuFllSb9sIQnsgFY55ZuZALjQLWMcKzaR3Td7SMp6HgjQ3OlN/39Voe/9tHXulpTNA1eF1Iu9vkCRgL9xax+FBZ+2GF68pTnOgYiS9RdLnazH2rYiiRgzwPno2Ldg+lh9dmt2/zLnKnVBpVpGIVbCe5j33oJZzGBHrQCCGtdwj8j01tVQLdNyflJY4D+BwBWnKrUZlQ/S/HkzJVxCzOMA+OZSp56gC9nSVJGDACmELhrDOw2yp/lEdUqJX+kDRtARd5Qj9/kScC+1/ZmunTknbYy8JDMO3N/9ZvevWOzdOyfYsOg1+tXb7cu6WuTmZ3trA6/Nl9TGH1w4YvJMnafxQzyAj1a4fvjrTzJ+Oe1NOBcBe55ORa1WnkxahLhZysIgaXEBVOQlvCcC+w0Jx2NIbf59LCfVN3A+44VJe1o0qdKWqEeBkKAhnbCxSsqf8sDkc2jVL7SRUWCnkbioG+doDpBFHUTMnMKlT4slRKm4tzYcQIk12gBpyu4uO7Drxo3OtaJWbFg6Q9WQ8jr8pSSFfb0PbopbeiYQcpU2Gd/FP5gV6wPcw4Vg6EayGnivvYYmS79pZS8x0UjR2ZfrrIMlsLIKChmw1YqFCCvBczs3RXR956LOkGQxdj61vBXBzCe/3bSPPAPcBK6fIicKq5WvtNe0qqjWOLccwUnr+Bg1Ronr6qV9GG7jz5CMDAeWXWrubu+mgZTHQeVgKuNlwEP1YrLiFHUUfTmu0W2vtoe2KE3xynE4FbTFvaDl2bYDLDO6lLhNweoCnz5g8XFR0JmBf96HVYGJNuOVxZWjf1/hceqF9MWBrES
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b9935d-660e-48f8-cdfe-08dad2f67203
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 17:15:14.2361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HtSOeQy7KFdxnAyRkfUN997gvBHyehdRfJCNeWHzf/tRjiZNAoS2kx5cV+T1WfnaJ88g1Ik0qQHRbmFAoPMXeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6771

DQoNCj4gT24gMzAgTm92IDIwMjIsIGF0IDE2OjU0LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEdlbmVyYWxseSBzcGVha2luZywgdGhlIGV2
ZW50IGNoYW5uZWwgbG9jYWwvcmVtb3RlIHBvcnQgaXMgZml4ZWQgZm9yIHRoZQ0KPiBsaWZldGlt
ZSBvZiB0aGUgYXNzb2NpYXRlZCBkb21haW4gb2JqZWN0LiAgVGhlIGV4Y2VwdGlvbiB0byB0aGlz
IGlzIGENCj4gc2Vjb25kYXJ5IFhTX0lOVFJPRFVDRSAoZGVmaW5lZCB0byByZS1iaW5kIHRvIGEg
bmV3IGV2ZW50IGNoYW5uZWwpIHdoaWNoIHBva2VzDQo+IGFyb3VuZCBhdCB0aGUgZG9tYWluIG9i
amVjdCdzIGludGVybmFsIHN0YXRlLg0KPiANCj4gV2UgbmVlZCB0byByZWZhY3RvciB0aGUgZXZ0
Y2huIGhhbmRsaW5nIHRvIHN1cHBvcnQgbGl2ZSB1cGRhdGUsIHNvIHN0YXJ0IGJ5DQo+IG1vdmlu
ZyB0aGUgcmVsZXZhbnQgbWFuaXB1bGF0aW9uIGludG8gRG9tYWluLg0KPiANCj4gTm8gcHJhY3Rp
Y2FsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPiBDQzogRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9y
Zz4NCj4gQ0M6IEVkd2luIFRvcm9rIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiBDQzogUm9i
IEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+DQo+IA0KPiBOb3RlOiBUaGlzIGNoYW5nZSBkZWxp
YmVyYXRlbHkgZG9lc24ndCByZXVzZSBEb21haW4uYmluZF9pbnRlcmRvbWFpbiwgd2hpY2ggaXMN
Cj4gcmVtb3ZlZCBieSB0aGUgZW5kIG9mIHRoZSByZWZhY3RvcmluZy4NCg0KDQpSZXZpZXdlZC1i
eTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCg0KPiANCj4gdjI6DQo+
ICogTmV3Lg0KPiAtLS0NCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbi5tbCAgfCAxMiAr
KysrKysrKysrKysNCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwgfCAgNiArKy0t
LS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwgYi90b29s
cy9vY2FtbC94ZW5zdG9yZWQvZG9tYWluLm1sDQo+IGluZGV4IGFiMDhkY2YzN2Y2Mi4uZDU5YTk0
MDFlMjExIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWluLm1sDQo+
ICsrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwNCj4gQEAgLTYzLDYgKzYzLDE4
IEBAIGxldCBzdHJpbmdfb2ZfcG9ydCA9IGZ1bmN0aW9uDQo+IGxldCBkdW1wIGQgY2hhbiA9DQo+
IGZwcmludGYgY2hhbiAiZG9tLCVkLCVuZCwlZFxuIiBkLmlkIGQubWZuIGQucmVtb3RlX3BvcnQN
Cj4gDQo+ICtsZXQgcmViaW5kX2V2dGNobiBkIHJlbW90ZV9wb3J0ID0NCj4gKyBiZWdpbiBtYXRj
aCBkLnBvcnQgd2l0aA0KPiArIHwgTm9uZSAtPiAoKQ0KPiArIHwgU29tZSBwIC0+IEV2ZW50LnVu
YmluZCBkLmV2ZW50Y2huIHANCj4gKyBlbmQ7DQo+ICsgbGV0IGxvY2FsID0gRXZlbnQuYmluZF9p
bnRlcmRvbWFpbiBkLmV2ZW50Y2huIGQuaWQgcmVtb3RlX3BvcnQgaW4NCj4gKyBkZWJ1ZyAiZG9t
YWluICVkIHJlYmluZCAobCAlcywgciAlZCkgPT4gKGwgJWQsIHIgJWQpIg0KPiArICAgICAgZC5p
ZCAoc3RyaW5nX29mX3BvcnQgZC5wb3J0KSBkLnJlbW90ZV9wb3J0DQo+ICsgICAgICAoWGVuZXZl
bnRjaG4udG9faW50IGxvY2FsKSByZW1vdGVfcG9ydDsNCj4gKyBkLnJlbW90ZV9wb3J0IDwtIHJl
bW90ZV9wb3J0Ow0KPiArIGQucG9ydCA8LSBTb21lIChsb2NhbCkNCj4gKw0KPiBsZXQgbm90aWZ5
IGRvbSA9DQo+IG1hdGNoIGRvbS5wb3J0IHdpdGgNCj4gfCBOb25lIC0+IHdhcm4gImRvbWFpbiAl
ZDogYXR0ZW1wdCB0byBub3RpZnkgb24gdW5rbm93biBwb3J0IiBkb20uaWQNCj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sIGIvdG9vbHMvb2NhbWwveGVuc3Rv
cmVkL3Byb2Nlc3MubWwNCj4gaW5kZXggYjI5NzNhY2EyYTgyLi4yZWE5NDBkN2UyZDUgMTAwNjQ0
DQo+IC0tLSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sDQo+ICsrKyBiL3Rvb2xz
L29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sDQo+IEBAIC01NjcsMTEgKzU2Nyw5IEBAIGxldCBk
b19pbnRyb2R1Y2UgY29uIHQgZG9tYWlucyBjb25zIGRhdGEgPQ0KPiBsZXQgZG9tID0NCj4gaWYg
RG9tYWlucy5leGlzdCBkb21haW5zIGRvbWlkIHRoZW4NCj4gbGV0IGVkb20gPSBEb21haW5zLmZp
bmQgZG9tYWlucyBkb21pZCBpbg0KPiAtIGlmIChEb21haW4uZ2V0X21mbiBlZG9tKSA9IG1mbiAm
JiAoQ29ubmVjdGlvbnMuZmluZF9kb21haW4gY29ucyBkb21pZCkgIT0gY29uIHRoZW4gYmVnaW4N
Cj4gKyBpZiAoRG9tYWluLmdldF9tZm4gZWRvbSkgPSBtZm4gJiYgKENvbm5lY3Rpb25zLmZpbmRf
ZG9tYWluIGNvbnMgZG9taWQpICE9IGNvbiB0aGVuDQo+ICgqIFVzZSBYU19JTlRST0RVQ0UgZm9y
IHJlY3JlYXRpbmcgdGhlIHhlbmJ1cyBldmVudC1jaGFubmVsLiAqKQ0KPiAtIGVkb20ucmVtb3Rl
X3BvcnQgPC0gcmVtb3RlX3BvcnQ7DQo+IC0gRG9tYWluLmJpbmRfaW50ZXJkb21haW4gZWRvbTsN
Cj4gLSBlbmQ7DQo+ICsgRG9tYWluLnJlYmluZF9ldnRjaG4gZWRvbSByZW1vdGVfcG9ydDsNCj4g
ZWRvbQ0KPiBlbHNlIHRyeQ0KPiBsZXQgbmRvbSA9IERvbWFpbnMuY3JlYXRlIGRvbWFpbnMgZG9t
aWQgbWZuIHJlbW90ZV9wb3J0IGluDQo+IC0tIA0KPiAyLjExLjANCj4gDQoNCg==

