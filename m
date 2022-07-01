Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FC563438
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 15:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359012.588424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWl-00023U-Hl; Fri, 01 Jul 2022 13:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359012.588424; Fri, 01 Jul 2022 13:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWl-0001to-BL; Fri, 01 Jul 2022 13:17:43 +0000
Received: by outflank-mailman (input) for mailman id 359012;
 Fri, 01 Jul 2022 13:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ipL=XG=citrix.com=prvs=17451e3f9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o7GWj-0001Gx-Pd
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 13:17:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ee0522d-f940-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 15:17:40 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2022 09:17:34 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5693.namprd03.prod.outlook.com (2603:10b6:a03:2de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 13:17:32 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 13:17:32 +0000
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
X-Inumbo-ID: 2ee0522d-f940-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656681460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0omOUGZG0MPXdSjwuGFLu8AUGMlZjA/7LbWh/A0gnYs=;
  b=OBsnOxy2BZwCQRF1QNOlvP6drVTgjF1GcDN/hREOaRWrLXSYgsKGytXg
   f+3dxDCENKipAMbTy9SI556Ej4iEf09Ib4ytRskzFXJ8E2dxHODbz97tz
   0FJId7+k3iN8mwCjw6w2l8BZNIsZFXAgt0pqxNwLe33P8HyoYhrixsC6n
   Q=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 77459749
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eioNzaMsIKVO8RzvrR1nlsFynXyQoLVcMsEvi/4bfWQNrUp0gmcHm
 GAeXWzXbPjZMTb2f9pzaNjk9koBvMTXzNYySwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZm2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 vEXuKO6eQwVGYrpwe4sdid8KGJ+IvgTkFPHCSDXXc276WTjKiGp6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaHPqiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32SWiImIE+Tp5o4Iy41n8xTxX/YT0c+rRSueWQdVErmWx8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3E62StjwWTWorXjCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OcpQRQ62
 1nPmMnmbRRtrbvTT3ue/7WVqDqaOC4JIGtEbigBJSMG7sfipscvjxvJZtdlDKOxyNbyHFnNL
 yuiqSE/g/AZi54N3qDip1Tf2Wvz+d7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:EvGlgqzjy0qrT6tycEF2KrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vU2iIBzADQCkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpOfHHbFAlYSi8R156cm6XYp0vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.92,237,1650945600"; 
   d="scan'208";a="77459749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReuKeZRBt7O51zsw0jC4DY6aYrdLzVVyOFeZcUe0aVcCpP+92In5t/rJJ8MHkdwwq4gHYyTCg1/ENAFoLDq4rf3eqbY6xcYoLkZyN2DzgEQkqBQ7tt8EAPMZcACRg/ynAq+ubW98r7AoyTqsBnSNuoP04gonvTkfOMVqxVyUb+K9XhCQ1BCxV2gRgH9RVj8Y7yuF4J39QSkJaYUDhVKiZb15RcLYGwaFXnZLYQiUnS+MHIpUELFGbW+MAfmCpGzAyswJji167uV/SYKlHqTuIAJAQdQhNlOfpfpBs4E7sXhUGiTPNRldjyUMyO4s7vGmaWT3CxADrPgIYcZEnzTCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CW6nJ57YZtfgzGmlQ9Sx8B8maYRi3jIQc6etWHDX3v8=;
 b=Efuhz+vHf/TpmtG5wNfgSzjAZbM8eDqnkCB4B2sFXEO0ENtr/upFTN+lQc70jh1oUqGMTaWYAzLQQzEI07d3kY/DHPL+bVx+rcmgA0Kdz9qnKEGXSRxCw8mDj/iJAn3jA+Ak0wBI7Qif6/bwoGMorulZZc+y4+K5eRcx87lE+Ac2XTdS1uAf4CtK7l/gdgrbybsVRIPIgAyMmFAa9sEv9AI2mn7IHYBARRPNmwmZk7mYvoS6UpAyd6a595NtEsqd9wWJDSgZWjUenudhYsG8sdfTaeKjUue+hxwoXkE07UxkiW57XYLpzrPzDg8hB874gW4A4gYA7NKdUw528cVXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW6nJ57YZtfgzGmlQ9Sx8B8maYRi3jIQc6etWHDX3v8=;
 b=nmc2bpWvaYHT1kc3k7SJjBkIrNxdOJhZaVtZ1PBr1MDy1STVa94SPt10Q6ZZw9d3CamOyeqjMmgGzhpf4nVsS0V2rypaMtr04U7y9YTeZ0JDwNOOFgc6FisL+s9SFRL7jhTUtwvdA7U12OB1rKWX6dwzZBzp0P2ckPL6elmfCDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 3/3] x86/vmx: implement Notify VM Exit
Date: Fri,  1 Jul 2022 15:16:48 +0200
Message-Id: <20220701131648.34292-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701131648.34292-1-roger.pau@citrix.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a35f3e4-1e7c-4350-ecf6-08da5b640e83
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RWt29pNxJ9ZULGWZkskAAV/0k7Q+RsllYmmuFOhsietYK0vhhzActlB82iwEBbCj8YZ3f/InLJuJ7/qv5rYNCrNyQch0N7gMnTvHAPGFf26g2GsRTMWALwhRxs6YZfWtiisv0QSoeBkWqkODUG5QXw6gY0rC46W1M4y8rvP0Y8uP9/yZiPRaPTl+i5ldKfHK1yhEskTvGRaSRL+++nZA3tLt3M4s2KzDHDnR33uDkm85D8+RFC3Yn7Ic98Ski6p6RAbyIuZNCxOH5a6Qi3iQ1ODQdBFN16tWj5Acmo160hk+ibsGEeGz0rl+zDkkK0ZukCoxD5Gec6iuqw4gbQs3konQrYabFnNw7Mp5mdIf4CVfIEDVM9jwxK8Cm4RlgZlyIVwWgLbxE9YEnxFW9znGAlA7uGh9srJNijTMa6ZiLSe33LGRR6C9uOMTnXyG5d6dkyT6nerP15nrLYIWk3MVafUmRoctb6cUZwH/7hc4/1U3AVLCo5FO78CRjlTyLXl3ROsCz0/Ner5tkhu0/ecTmj0xiVn+rXfrciF7rbDOLgxKiNgyNGlXBBT7FTK9QmJlbz8J89qFDyNzzoKpLD0fGn4/iCtx4MKpFygioXR3PhN3Ch99xte8I3GvFYCXMDdt3hnLqyky2Yx6zVabHL9ZDAqI2EU3yX8/7wvalcr6rmAcjjrWsvhgKcxnW+s5UxmEgWF4zfLcsPu5L989A8BK3jtf4sickkGDh1dYb20f3Jn28iV5bK+hTPYejdxKiJ7DKFhrmkFu1KP7T/6PCEKSfubY4dvoDiY7DSj5eZl1KOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(38100700002)(66476007)(316002)(82960400001)(54906003)(6916009)(8676002)(66946007)(4326008)(66556008)(2906002)(478600001)(6512007)(186003)(41300700001)(6486002)(1076003)(6666004)(26005)(966005)(36756003)(86362001)(8936002)(83380400001)(2616005)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YThYcDY3VUxML3NCTHhIMXlPK1NMc3hETHlCQ2Q2bVRUT2ltQ3piZm5xUEs4?=
 =?utf-8?B?RGlEaHQzQTJYMmduUldERnZJU3lXVjFlNTJOaE1QUXlKMWRMbnllYW0zZDcw?=
 =?utf-8?B?UGtBdk5LMWZVVHlDVi9iREtyTndLbHptR0FRT3BlM3RCMVVPSGxQTndCeWg4?=
 =?utf-8?B?bXhYUWlnNlRGeHEya3hpYXlZRUJmREVIS01WVi9CWmNzeEVaQTJMdzVRblZ2?=
 =?utf-8?B?QUpwV3dkREtDdWh3L0hRUkJueE5DOEtiVGNmNjRjeEsrN21XbFlGZGduZ0cx?=
 =?utf-8?B?OUk4TnpyWEhiRjdPYXVMTVZlRzZtUVlld09tT0ozUG9MTHU0TEliemxVVGow?=
 =?utf-8?B?R1NKekx4L3FPVkhzMjdSMkpkbEdwVktUMmp0YXFHdTlNa0tmOWltYW1waTRu?=
 =?utf-8?B?eXhaR1pxMlB2QTRkTitaZ1p2a0VXU25MSmVGZlg2U3VZL0xpQWRJQ3hwV0Yx?=
 =?utf-8?B?UGxJWmZCeGVkYlhwNkRYdmh6VDBrazhXTldXajdpUHlxS1ZJL0k2eHFRU2RQ?=
 =?utf-8?B?akZ0ZUlmQXhtVVppVU1KbG5vcnZFUk9xd0pPSGw3aEY1cHoyUUIzeTBwNjV0?=
 =?utf-8?B?ZnhKaFlmKy90MUE1Ukx6TnlIa0JCNDUweDA3eDdLSlNZcW91amFGcDNHUzdC?=
 =?utf-8?B?SGhWbk1rYThub0JmUjB6djFsaHppVURhQlpMRmtPZ1lOeXhYTzVYaGxWczRP?=
 =?utf-8?B?aWhGYW50cTM0RllRRW51TE03NUZNWXVWQTFkKzZ2ci9xcnBRK3VmY1liV1pC?=
 =?utf-8?B?WUFVbjgwTkhPTjN6eUhCUnV5UHZmRVU3T1hlTHF1OUVWbm8vd2VYVVdpVnd2?=
 =?utf-8?B?QkF4cmp1TDRQMStMNEJGZXpkNDhXZS9wR1hjd2xteThxdzZNSElkRFNxSjQr?=
 =?utf-8?B?UkZMZGsxOUk2OEZPR00vS1dxZWJ4Y1d2TGV2NmxkcXZpUHhNbWhJS0h0NmFs?=
 =?utf-8?B?dUp4VUtQYU1QZ2s1K2tZbXNxcWlWZjZYZWlOTVkrRVJoMUhHVmlWOEhOMklB?=
 =?utf-8?B?dU0wM3ZMMTNNbEpMRVBGNVRidTdSZlJDaVhsQVdEM1ZoZVdhTnNUTEJneWEz?=
 =?utf-8?B?ektjN1UzQ1NnUjZ5WjJ4cm5IcmhRdVpsTTcxMXJZcGJINFkrZkx3WEdZK1RH?=
 =?utf-8?B?azNTY2pjeE5KQU5kbnI5QjBvYXZ2QVIySndqSDhSZnBPRmVRQ3loQkNPanMz?=
 =?utf-8?B?YzlzNWg0UTZ5SldKKzhvcUYxR0gwV01JR2lGRmk2bnYydktmVWNBeFJqZGw0?=
 =?utf-8?B?MUNFWWc2ckNObkJncFkzY0kreE85NCtTL0RUQ1RRWTNFb1hlS3UyaGhNME5J?=
 =?utf-8?B?d21SaThzTFNEL0Q1bGpadmpMeVZzc1Y2TjdMZE80cXhkZXVkejJpcHNoTHFL?=
 =?utf-8?B?bUNlQ2cwYmtYdmFGSVRxK0VzOUhlUGNiZUozenlqQUpWR1RBZEpjbUIxU1M1?=
 =?utf-8?B?bmtCam1qOXZuc3ZNaFdiSGRVYUxBVHZBc1l6SGJTb0RhajlIYm1DN0ljYUta?=
 =?utf-8?B?S1k2YnlsK3Ntb20ybjJxMFdDWjZjSHA1bHNoTWdMMTRwZURLa3dLcTBHNTBp?=
 =?utf-8?B?bnU2QThpVUdydEhEZ0psdll3dWFPYnJTZ2x4QjdNdFdWV0pLekdZZkNZK21F?=
 =?utf-8?B?YjZaMFhIV1hDVFMzaWwrWS9XNVlWeEtQVlFZakMwZXduNHVleHg3blc3K2pj?=
 =?utf-8?B?Z1Q2SkNoWVM1VWxrWllJTjVEdzR0ZGdzTlFwd000OE1VWGhXT3ZJVTR0QWpw?=
 =?utf-8?B?bE56ejgvWVhJSkRoQ241N2dHaVliT2JFc3JMdWo2MDN2Rm94WXFXbFZQRjVs?=
 =?utf-8?B?c01FT0JqWkgrL2Z0K29NR1p1WUJuc01uTTQ3Um5mMW1ZRloxa2pLNlgwdWNZ?=
 =?utf-8?B?MVpZYlNtQVl4b0xyWGoweTdDVFJUYWRXamVVZk1QeGlUM0JoeWVMLzZub3VQ?=
 =?utf-8?B?V256Ymp3ZkoxcmNCc3FOaHpmMmtKK2ZBZWNLdi9Jc3F6R2dyWEFXcDF4R1VU?=
 =?utf-8?B?ZHZaWkJjMUphR3Z4WURreTlVVllGbjNyLzd5Q05xc3N0dGhoOVQzNXQyOVU1?=
 =?utf-8?B?RUZGWFVhN1dZb2t0VXEvWGlGMGMxV0N1Mno1Z09VU01TeWVUM2tBNVpNcjBM?=
 =?utf-8?B?L2UwdFBQakZSb2RKVXNUN1NRZy9OZTRqYXZabHBpczNIYWtVRHdQMS81ejk0?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a35f3e4-1e7c-4350-ecf6-08da5b640e83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 13:17:32.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FU+6KrV1rwQlJOb5Hglg6UCBvWrXcCUL4oE+nHAfdI/n8ED3UYOIjt6gBz4FSgJ3zXERu81zN6meCRVL8EDbMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693

Under certain conditions guests can get the CPU stuck in an unbounded
loop without the possibility of an interrupt window to occur on
instruction boundary.  This was the case with the scenarios described
in XSA-156.

Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
if no interrupt window occurs for a specified amount of time.  Note
that using the Notify VM Exit avoids having to trap #AC and #DB
exceptions, as Xen is guaranteed to get a VM Exit even if the guest
puts the CPU in a loop without an interrupt window, as such disable
the intercepts if the feature is available and enabled.

Setting the notify VM exit window to 0 is safe because there's a
threshold added by the hardware in order to have a sane window value.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Move up the logic to set the exception bitmap in construct_vmcs().
 - Change perfcounter description.

Changes since v1:
 - Properly update debug state when using notify VM exit.
 - Reword commit message.
---
Intel is working on getting the ISE updated to note that 0 is always a
safe value to use because the hardware will add an internal threshold
to assert so:

https://lore.kernel.org/xen-devel/3c64db19-00fe-05bf-ac4d-6ef4201b6aa0@intel.com/
---
 docs/misc/xen-command-line.pandoc       | 11 +++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 17 +++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c              | 32 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  6 +++++
 xen/arch/x86/include/asm/perfc_defn.h   |  3 ++-
 6 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index da18172e50..272be0e79f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2566,6 +2566,17 @@ guest will notify Xen that it has failed to acquire a spinlock.
 <major>, <minor> and <build> must be integers. The values will be
 encoded in guest CPUID 0x40000002 if viridian enlightenments are enabled.
 
+### vm-notify-window (Intel)
+> `= <integer>`
+
+> Default: `0`
+
+Specify the value of the VM Notify window used to detect locked VMs. Set to -1
+to disable the feature.  Value is in units of crystal clock cycles.
+
+Note the hardware might add a threshold to the provided value in order to make
+it safe, and hence using 0 is fine.
+
 ### vpid (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index d388e6729c..4985d25b85 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
 static unsigned int __read_mostly ple_window = 4096;
 integer_param("ple_window", ple_window);
 
+static unsigned int __ro_after_init vm_notify_window;
+integer_param("vm-notify-window", vm_notify_window);
+
 static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
@@ -210,6 +213,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
+    P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
 #undef P
 
     if ( !printed )
@@ -329,6 +333,8 @@ static int vmx_init_vmcs_config(bool bsp)
             opt |= SECONDARY_EXEC_UNRESTRICTED_GUEST;
         if ( opt_ept_pml )
             opt |= SECONDARY_EXEC_ENABLE_PML;
+        if ( vm_notify_window != ~0u )
+            opt |= SECONDARY_EXEC_NOTIFY_VM_EXITING;
 
         /*
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
@@ -1290,6 +1296,17 @@ static int construct_vmcs(struct vcpu *v)
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
               | (paging_mode_hap(d) ? 0 : (1U << TRAP_page_fault))
               | (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
+    if ( cpu_has_vmx_notify_vm_exiting )
+    {
+        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
+        /*
+         * Disable #AC and #DB interception: by using VM Notify Xen is
+         * guaranteed to get a VM exit even if the guest manages to lock the
+         * CPU.
+         */
+        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
+                                              (1U << TRAP_alignment_check));
+    }
     vmx_update_exception_bitmap(v);
 
     v->arch.hvm.guest_cr[0] = X86_CR0_PE | X86_CR0_ET;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d69c02b00a..b372cde33e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1419,10 +1419,19 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
 
 void vmx_update_debug_state(struct vcpu *v)
 {
+    unsigned int mask = 1u << TRAP_int3;
+
+    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
+        /*
+         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
+         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
+         */
+        mask |= 1u << TRAP_debug;
+
     if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
+        v->arch.hvm.vmx.exception_bitmap |= mask;
     else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+        v->arch.hvm.vmx.exception_bitmap &= ~mask;
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
@@ -4150,6 +4159,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( vector )
         {
         case TRAP_debug:
+            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
+                goto exit_and_crash;
+
             /*
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
@@ -4589,6 +4601,22 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
          */
         break;
 
+    case EXIT_REASON_NOTIFY:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
+        {
+            perfc_incr(vmnotify_crash);
+            gprintk(XENLOG_ERR, "invalid VM context after notify vmexit\n");
+            domain_crash(v->domain);
+            break;
+        }
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) )
+            undo_nmis_unblocked_by_iret();
+
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 5d3edc1642..0961eabf3f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
+#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -348,6 +349,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+#define cpu_has_vmx_notify_vm_exiting \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
@@ -455,6 +458,7 @@ enum vmcs_field {
     SECONDARY_VM_EXEC_CONTROL       = 0x0000401e,
     PLE_GAP                         = 0x00004020,
     PLE_WINDOW                      = 0x00004022,
+    NOTIFY_WINDOW                   = 0x00004024,
     VM_INSTRUCTION_ERROR            = 0x00004400,
     VM_EXIT_REASON                  = 0x00004402,
     VM_EXIT_INTR_INFO               = 0x00004404,
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index bc0caad6fb..e429de8541 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -221,6 +221,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
+#define EXIT_REASON_NOTIFY              75
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -236,6 +237,11 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
 #define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
 
+/*
+ * Exit Qualifications for NOTIFY VM EXIT
+ */
+#define NOTIFY_VM_CONTEXT_INVALID       1u
+
 /*
  * Exit Qualifications for MOV for Control Register Access
  */
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index d6eb661940..a710fba8a8 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 75
+#define VMX_PERF_EXIT_REASON_SIZE 76
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -126,5 +126,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
 PERFCOUNTER(buslock, "Bus Locks Detected")
+PERFCOUNTER(vmnotify_crash, "domain crashes by Notify VM Exit")
 
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.37.0


