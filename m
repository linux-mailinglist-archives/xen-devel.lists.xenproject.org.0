Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA25FD9FC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422088.667947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixyp-0001wE-W3; Thu, 13 Oct 2022 13:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422088.667947; Thu, 13 Oct 2022 13:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixyp-0001sq-SR; Thu, 13 Oct 2022 13:10:31 +0000
Received: by outflank-mailman (input) for mailman id 422088;
 Thu, 13 Oct 2022 13:10:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oixyn-0001sk-Qe
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:10:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6779ff06-4af8-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:10:28 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 09:10:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5381.namprd03.prod.outlook.com (2603:10b6:5:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 13:10:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 13:10:22 +0000
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
X-Inumbo-ID: 6779ff06-4af8-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666628;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y2WOxBk8zlh1ofY51AiW8FfxbydOkZfhVILfV+N02YY=;
  b=fTS11eNwuxcyfHQqY4MsyivxkQDpVuotl5rAHL3WiQSvtcH6hN2AHG92
   uo0P2AEoKWpmSpO/FM5k1dD7irLh3COkUvi+Gxn5VqFpVboRWEBe4ex7k
   3fbnf/ds5oQcOYas9WDKKPclYeXxhK8aC83Gn7p4bs5L/X2fAnnRVgFiB
   A=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 85174332
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NCrQgKM1Y1CrLefvrR2+lsFynXyQoLVcMsEvi/4bfWQNrUok0GMBy
 jQdWTiDM63eNzD3eo0jPoSw9xsO6p7Vm9BlQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr42tB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ebLQ4y7h8CE910
 +0/GG5ScheOpMDr6efuIgVsrpxLwMjDGqo64ysl5xeJSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9RTM+vRfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPlGParin33IcjmwvjAYEAFrSa/8RRkXuLz1UdODwVVkGk9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 kCNt8PkA3poqrL9dJ6G3rKdrDf3My5FK2YHPHUAVVFcvIelp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjnNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:PwktUKwQc/WQeF7izleAKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="85174332"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWiAuTw88XCfU2n1LVu3wtzR+AYv/SnFnjY7SKKdYd8YgClwLpGcneo6SjUNuGCiqZ+xR2TEdz5xsiaoCt7mQL6y3ro/x7EmDT7DzItfxYUzTgo8UQdCGjOo+3Y14esZTJyMhJEVj3BUlzHF/MBM+b/Y+MyOwpMuEbehLKt50ObYnEt0rm3FhE0Rr985OVm+6DUfl9JJXiG3n+v0hPVfCYsHqDI6CcSh5x8/P+18/+qQ+LmJeSwA/CVQBEmBJpp/b3BSvsYIfMiL0ofRo5SSNGGbVuE00KgI++8Io9W6KswiI8b74Fg01bEBfNat2yYtcyAS/tdWprun2RMkfOXgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDqh2Rf1Yz6c8xWjGs5H/0qgjIMDyFMeIaVeWoElRLM=;
 b=PsU7RSLiu56UPdBqd00GnL+4ukr5VLDAYdJ7j5sk4mkuNmqLtufCdN5OiRzYq2iLgT3Gh8Muc/ms3XfNSctPaNRFI26PVYvVJgnjFMV/PpiJHOrq1A43TXgnBjCp0KPN7DA+mTKodKfUK6D+wpsEb71s/ROifnonCIbAYtytF0f5ZbBptABGzUQ8hwuU48wjIkrpTGH3JZZuSwJvD2ApJJ9bqSXj12dCmG2BqcMQqWTHFMp1fMal8AkTfkdiLDGI7dt4q3E7DFeS51dQ48ihxgzhymKKDpDd3rrKc8B155sa17JqV3MExBublnikfjDxF+NAHZ7TaqajiJ5nR1J4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDqh2Rf1Yz6c8xWjGs5H/0qgjIMDyFMeIaVeWoElRLM=;
 b=fPY8Eu2eSkd1MiimUfGsTJUbsaKQs9TKtZiFNga1I73mIHxEUuigDcwg9BSTZp5yU0Yb1lVVXxdsTBwGLaQBg4ghlKBHHPa7y0DWLBiYt7kJi9hJgadOMF33hOyXxeyom0Ang8aTwC2tUEu2zm9gYD2aE7z6ZD3LtGzD/3Fj6zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 15:10:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Message-ID: <Y0gOOcbw2bebsKAJ@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
 <Y0f+gL1PfB5lzlDj@Air-de-Roger>
 <1867142e-ee46-daa7-c05c-04045460ba52@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1867142e-ee46-daa7-c05c-04045460ba52@suse.com>
X-ClientProxiedBy: MR1P264CA0172.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e2f975-9223-4f79-0686-08daad1c4936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rlzMTFE6hGyCmVMmuYYyuml6HaVlH1Z7OUSjf6VFEq3hxsuP5q4thG7qipfxNDgBGlOgsBU6rsoOUql6VRl/og8GsWp0aAQBBbjQMuCeybG3DFOeibziSUcFopH+q7Dl/ZsFvg7MMfcBATWoR8iUurD6x2vbA9LDRl53Bltzrp+9brjhZU1adZtTsrs9A+rWvyFEYBl1b3iju97q5BlPviM9WViIFeRSH9UuWtuhu5ZzuZ8n9zgN2SAGzCBR/XahdXAHHsLJgsoAuVWDMZ/jA9bPB6/VUfcGEF+0HNoK1MJaF659HRKJ27DFSvg0lPXPJRVwtOI+xozkUSpf6rLxNTFqSa6iAeySkhT6QdtQzsXfp2xSBl9oCiDVdGagxL/0dOqUhkEXD8bXD+lt21y0JluVn8mRBQEjpXtfV0DxBBDWVgmn/BSZdKPgQTeXNDuJY2pwYUdCDv34idIeJ1VXkdmWudQB2MZYwpHosOWOpCv4E9LNqEzDWfQ22CROXD3+HvPda63w/yWDSdWWBDlqxhe0x77XTXC4ev6tG8OdUCd9+4gLym0QJTflZ82N2Lw3ym8jhcGb3OeJoUDCQALnMmbSYLHe0O5ooppk7Xu1AnTs8Jr01O019tH1k/2pHeK5yoPmb0GPM9+OicBWh9h1d1MeSTZevdRUOOUfbTPuID4F5CBIe1sNmXFiy3pUjZj1Gmd4e9OWvR/fhU6vfpfqLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(186003)(8676002)(83380400001)(82960400001)(5660300002)(38100700002)(9686003)(33716001)(41300700001)(4326008)(6512007)(26005)(6916009)(6506007)(316002)(53546011)(6486002)(54906003)(6666004)(2906002)(478600001)(66946007)(66476007)(66556008)(8936002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dys1NDBhUEkveEE4dy9EZ25MNk0rT3hvZmI3amV6KzdxYzdSamdrQksxL0w2?=
 =?utf-8?B?emNDM0dTdFBNTUI1WWVBWkltaWd0TVdkNlNTTmNpWVJZVmp4VTFjN2Vrdmwz?=
 =?utf-8?B?UUhtZXNTSUVUNFlzQkcvME8xdklVMmIrNW9vQVphREVpY2t3eExLRmlqOGdq?=
 =?utf-8?B?Q0ttekttTE8vOHRMdmtwbERGWkpuZHJUaFJjekpXbVdOSENGU3VYamRGZzdi?=
 =?utf-8?B?M3hWak9QdVh6U1hCYmIrbGw0Q1h3YXJhenRId2FTMVF1QjFPNnRZYWUzeXpS?=
 =?utf-8?B?bUhVV3M2QjBwSXhOTU1MS3k4RUJNK0h3c2RSWnAwQkYrMGNoem1VeEpJOWsw?=
 =?utf-8?B?ck1jZTlZQXJIcmljcnQvVnhVYmhnNlNLaWhtc2FWeFYrcjBXVTcrTElBRUlW?=
 =?utf-8?B?cGhRNWxQdm1nUzRZdllFeXhTK1BleFhjWjBVN1dCYmlkMytvUUp3S2JKV0xY?=
 =?utf-8?B?S0k1Rit4Z0k5Q0REZm5iWWV0c0J6ZnVueEVsRVcvTWF2bE9BQnFrM1BuZnVZ?=
 =?utf-8?B?UmpTVU1vUkc2S1Jqb3kxdk91TEVkRFRHVlNOcnBmOWRZZ0NJWlNTdlcrUVEx?=
 =?utf-8?B?OHphQjB5SjNHMVdWRmduVk9PbDVPaDExMnZPempOcEpNaExvS0FNTlI0alVU?=
 =?utf-8?B?SXEvUm1OVDJkQnFCdDRmLzZsT0xTYjhUeEVzcVk2N3FGS1BydVhLNlU1bHhm?=
 =?utf-8?B?ZTJndzNBWEpTK1NnOXJaUk1sbldyYUlYYXZKK3loNURpcWIxcmt0QW9BY1Vs?=
 =?utf-8?B?QmEzYXF6WjRrMHJyTWw1VEk2dDg5VVA1bW9RSmQ4WVQ2T3N4aXFFa1FiS25i?=
 =?utf-8?B?d1VnSkl4ZlRwV25yVGlSdGVUeWJiK3k1Tng5TWNUWFJvQmtuRHZCTldQeVI2?=
 =?utf-8?B?UVQxTlBLTnVwNlYvN2ZmQXJiUEtnZjk1d2UvOXJ6U1RCaDdpWVMzRTFyRGJq?=
 =?utf-8?B?amVXZmJVWVBmVTVuTmJkMHNHUXM2ZDlxSGNFbHdNODdKaTRSQmRhVDhLU1FE?=
 =?utf-8?B?cUprbCt0d3F3OFdZeEc4dElpeFRONkE1R3Y2YnNqWEh5d1pwUkRIWS9JQ3hl?=
 =?utf-8?B?R0lQRGdPMU50RUJsWVhzZmFHalFiTEwwcnM0NVlGc1FoZktaSzF2OXFLOU1G?=
 =?utf-8?B?RzVlZXJPZzdwU2FmbDE4TDlGMFAyM1FxNW9XSlpXLzN5b1NkazNFbjJSaUZC?=
 =?utf-8?B?Vk1rTHUwaWZEeWN4SlNSU0E5aDVYOWhkdC9QeHEvM25HeG96MDRLNm8zZjVN?=
 =?utf-8?B?UTlpSzZRb3FLdy9FQUNnOFRVNE5EenZqc1hCL2VxWThxMzYrTDFyLzJHalo3?=
 =?utf-8?B?ZmZ4M2tRNnNiWVViUjRDdmd3ZmpxTWZVVFNKWWk0dmFMaXVBQ3ZMajVGK3Fo?=
 =?utf-8?B?c24wL3p1MWMvcFNENjc2Q1QvTExuSmw3WEFhSktZdW5zd1RDcGtUNTZYZldZ?=
 =?utf-8?B?WHZBeFh5eCt6dFh6SDFkaGpnVFY5TkFvMkNHR09La0pnbEJmcmg1MmhrWWtQ?=
 =?utf-8?B?RlpyZEZKQ0d3WkJQK1hqdmFsbjNQdE5CVS9mZHpnY2R6ejZ1YVh5NEU4VVM0?=
 =?utf-8?B?cnExUDRHSzJPc2d4a2NtNFRGWnBiN1NzaWM0YjR1cTY1bzc4Tmh5Vjkza2tT?=
 =?utf-8?B?a0dmYmdtVUxiVFRoUVVPc1Z6ZlRyc0U0bERmOGFvckkySEFKK09VMDZkZWkr?=
 =?utf-8?B?Uko1NFNXNjJxOWpNRzBGL0dRRUJBZzh6ZG5NajRGOUxsblBlUG91Q3o1dzV5?=
 =?utf-8?B?aWIzVFhNSC9XKzlrMjYraE9jMmxSS3R0UzJJSlVtcmVIRHVtcWNGSmNPVnM4?=
 =?utf-8?B?LzZVMk82enl3cWxKVk5wTjJ3UjhiSmRuMjU3WkM1b0kvN1poM2puSFNuYmps?=
 =?utf-8?B?OFZZS1M4ZXV0MnluMFNuT2ovRzRxQXNKT1pKLzl1U1pkcEUyZEJtSGFqbkwx?=
 =?utf-8?B?SzRaMDdyZnZ1cWR2SGlUNUVxQkx2VzFGQXVoaHg1Q3hCSHp4cUN2a3didUM0?=
 =?utf-8?B?amk0SzVoSjhTZEJYbkUwSWREVksyUnAxV01GSjNQZ0J5STdxd3pMbEdJNjFY?=
 =?utf-8?B?eW5oS0lLL0EzWHBHT1VSdEcxQWdWWDFaWUFCS0kyNmxlT1Q1V3Vxb3BHQTNu?=
 =?utf-8?Q?luvtLgsrJpPc2Bt3s89/LAmjJ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e2f975-9223-4f79-0686-08daad1c4936
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 13:10:22.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7fr07QynhlDsUR+cYU0Fg1ddnPSUVTMqjSSnx0tal+kiD7LotmRhUk3gtefo/2wAb6EQDS8qSFohfTX9qnC/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5381

On Thu, Oct 13, 2022 at 02:17:54PM +0200, Jan Beulich wrote:
> On 13.10.2022 14:03, Roger Pau Monné wrote:
> > On Thu, Aug 18, 2022 at 03:04:51PM +0200, Jan Beulich wrote:
> >> From: Peter Zijlstra <peterz@infradead.org>
> >>
> >> Having IBRS enabled while the SMT sibling is idle unnecessarily slows
> >> down the running sibling. OTOH, disabling IBRS around idle takes two
> >> MSR writes, which will increase the idle latency.
> >>
> >> Therefore, only disable IBRS around deeper idle states. Shallow idle
> >> states are bounded by the tick in duration, since NOHZ is not allowed
> >> for them by virtue of their short target residency.
> >>
> >> Only do this for mwait-driven idle, since that keeps interrupts disabled
> >> across idle, which makes disabling IBRS vs IRQ-entry a non-issue.
> >>
> >> Note: C6 is a random threshold, most importantly C1 probably shouldn't
> >> disable IBRS, benchmarking needed.
> >>
> >> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> >> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >> Signed-off-by: Borislav Petkov <bp@suse.de>
> >> Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
> >> Signed-off-by: Borislav Petkov <bp@suse.de>
> >> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > One unrelated comment below.
> > [...]
> >> @@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
> >>  			pm_idle_save();
> >>  		else
> >>  		{
> >> -			struct cpu_info *info = get_cpu_info();
> >> -
> >>  			spec_ctrl_enter_idle(info);
> >>  			safe_halt();
> >>  			spec_ctrl_exit_idle(info);
> > 
> > Do we need to disable speculation just for the hlt if there's no
> > C state change?
> > 
> > It would seem to me like the MSR writes could add a lot of latency
> > when there's no C state change.
> 
> HLT enters (at least) C1, so is a C-state change to me as well. Plus
> we may remain there for a while, and during that time we'd like to
> not unduly impact the other thread.

OK, but it's not a "deeper C state" as mentioned in the commit
message.

Thanks, Roger.

