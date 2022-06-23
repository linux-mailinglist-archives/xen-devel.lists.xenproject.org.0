Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F55574CC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354549.581705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Hp7-0001Mk-Bc; Thu, 23 Jun 2022 08:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354549.581705; Thu, 23 Jun 2022 08:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Hp7-0001Jp-8o; Thu, 23 Jun 2022 08:04:21 +0000
Received: by outflank-mailman (input) for mailman id 354549;
 Thu, 23 Jun 2022 08:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4Hp6-0001Jh-3i
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:04:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 136c193e-f2cb-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 10:04:18 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:04:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5038.namprd03.prod.outlook.com (2603:10b6:208:1b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:04:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:04:12 +0000
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
X-Inumbo-ID: 136c193e-f2cb-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655971458;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yAcNc111MiPw57/DXDo+Fck670VyWN/kQwVCmy9LFsQ=;
  b=BQklDJyIB4XDTE5AZVV5HmkpDf+7GNPFSIx/WO+lKS5UeKAif1UbXKAp
   L+bLerXPabELeKP2Cz0c3UrMBAzKOwHh4+ARF6Ohvb7xxAbp3qSEJP1jM
   FpGad7MNHFM5vVA0QjERwWtdAtLwTbnYWd4D2g9dSV/2JBthcFh5o5pIN
   M=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 74659738
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KUz7oKMcLYwFYZjvrR2QlsFynXyQoLVcMsEvi/4bfWQNrUonhTQDm
 2NLD2mCM/fZZmP0eYx+aIqz8xkC6J6BzYNlQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn2NQw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 cccm5eBRQYQJ7SL3+NFdjlKIjFOIvgTkFPHCSDXXc276WTjKiKp6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7EdaaHfWiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32ieiImID+Dp5o4I3s0bDkhNL94PND8CNUIC1GdtPtAGX8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZonVmSy2o7GBAQE1yhrpGRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQv3qsrhMaHd1KHIUS5A6Bx6XO6i6FF2MESXhHc9Vgu8goLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSfexloesR2G2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:9RrJJ6Bf7jM2IfflHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74659738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2qLIf4QNEVpt3av9wBf9YsPYhOdDfLiCKIXyDja/teX2gG7f8IB1fHaluGdxthxXtI7DrcFeTFMWlxznQD4PMTRWqZFIzR6aWqnRDXzax4b6u6o+r8OoRTioaYHCgrCo+fX0MEF9e8hxKTxOrKugkwex+Q9tx/wSfscbouEqCIb/fa3qwarVVjnk2kSfTXcfV3QWh0cy1a/q1nZiwEVC5oeOz4/GNId5GePA/5NY9voPI7EcECrvdMo2IA4aCvqZooit+h25dhvz3BFiKyq+j7sxQs8p/X1g7YlY3vFhDEgv7bHOQYTIcWpKGK9Ic5SPTxIsd2IhYwszMBudW9F5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mn2LLMLLFH6ai3I6fN26DatQk4F0Yn8dR80dp3oGOdc=;
 b=fwuPsd+58H1EU25sWymAoXaHg4IxHfOEcZ/CeN/vwrB9iMD00jAUcbSjThSoO6FJ5kRjAUgOdgtbV/NpEFak3y/Kz7G3uGcgN13DrmLvlvOMNAPxRKBQ6VSpGxjGzYVN/JbQXbKp4PPuHneJREN8ajyL07ZeVdyQlClgCD9eIg+2Jr7HgrqNHjYj8LYm0NQQVUv0QTihsHWu5SRjz0a/wkMMi4URYhLwfg2k4ybgf/Tx5DY53O2gMCYqh+dbWcpVW2HErBD1cJ+jMxSi3+aO22KBouNv1K4syqipVulURHEF2DXoctwbQ1lc0/Uv1XqUITDUOOkhGzwQmVI3e3N5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn2LLMLLFH6ai3I6fN26DatQk4F0Yn8dR80dp3oGOdc=;
 b=Dl9u58+QkpzighIJnDEYwDgERwspl1q/iGU63oORMVSmtbS70xgfzdDocE/bpTvbKC4EbbSRllQ7AB4Sj5Oy+KZ4tJF0kviny5Ulhz5c+WLLi15F2ZmUVHNpCoFbtAVusx4Mo2LEhd1WQbh43ZKCoxEiozAIWcKe99h84lV2Kok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Jun 2022 10:04:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Daniel de Graaf <dgdegra@tycho.nsa.gov>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] MAINTAINERS: drop XSM maintainer
Message-ID: <YrQeeHcHMhRB3g6C@Air-de-Roger>
References: <baa7d303-1fcc-cd59-0872-a930ea43734d@suse.com>
 <16b02586-43a5-0f67-5479-1d7b77aa892e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16b02586-43a5-0f67-5479-1d7b77aa892e@suse.com>
X-ClientProxiedBy: LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0f4018c-3ccd-4cec-f516-08da54eef545
X-MS-TrafficTypeDiagnostic: MN2PR03MB5038:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB503821EAB8547F742DA172618FB59@MN2PR03MB5038.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YO3jxg+P3EqEAXQq0tYFlwJyOZpKdzz4qgtA3pzbPAoyDCoMa5DR8dn2RRvPleeJMSOxfYyFtBjkvY8rbeUkkSXYaVFzY0AB9MZVlgZbU8MM++kTzHHPe+sbXa7ex0z23sy/9g7RKbOglpXbAmiEDcIEy4NsdiKE4jqBEEMzUs6n7hvE6PadE5qyYV1E6zowKPoPUlG7KdzGvnmrJh5pTSB3AM/iJS0Wi8B2yGxj970pAURELkmczA/5D1l6AF6UY50YK3TVE0F4vya2xugJuCzOj492vQEZVKa70rG1abU18KJsnD+qSunavUKb2g19zng3Etlp1EF0pmttSjsTaouaty2nTsumZvIE90jYGpEIahvZVog2cclNv6a6r6xbbLjQSAui0HHgCqCaf5BUmv/BtyXdDJEcHzwBc5NATuFL6lKDu6ccKDruM6ASEKC85e13MDR8b2/J1SMzlAOdNx8P4jQSwNncVyGEQ3pIhZ6M0MsNwKDDEyvzaW7KTsRnbPxpJ8H5t1zPkmT98Dz6ux1rjAW+ksdfTxIYGNn0dxb3HEuLvtzUdzzqhjFtUknrLks50sIMx9ZcIXgkF4k/n39JBQ9BzrQXZZ9JuEAwlVE248w2CSC5IE47FNpzYUHRZHEoJpD9zWrQ9HlFP+6pgi1t+ueBHpxxq3jC34A6cwpDiKNrAHhmDdldEAjHMhyiJRzSOzA15ETxeiMARLLEkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(5660300002)(6916009)(54906003)(6486002)(66556008)(82960400001)(4744005)(86362001)(8936002)(8676002)(478600001)(316002)(66476007)(66946007)(4326008)(6666004)(41300700001)(53546011)(85182001)(9686003)(2906002)(83380400001)(6512007)(6506007)(26005)(38100700002)(33716001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vys4eFdqTkZvTHZyYlNDejFQMGtvNEVxa2JpS0dTc2s1MzA3VGhCT2JSSDdl?=
 =?utf-8?B?aHFvaGladzA5bm5naGh4eThxMzBXenoxUVlWZktoWHBVNWF5ZDNCNitEWVZU?=
 =?utf-8?B?eWpVaFVVRzM3VmxoemFFMlRlRGQ4Smdac1ZjWnVzYStrOEZwY2FKZm41MlBN?=
 =?utf-8?B?a3Z1aXNnc0VIQ0U0TTdhMkJDZ1UwbEljWmhDWi84c0ZuRnVlNUFIVU51ZkF0?=
 =?utf-8?B?TVFsUVdiQjZQTWY2K0NLNDJ3Y3Y5M0VQc1Z1ME9lVWNrUmVqNi9aMXB2THli?=
 =?utf-8?B?VWNBZCtVbHBUL2xIZStnaEk1U0YrQ3hleHJjM3A3bzlwUVpqS05mdEhkQjZx?=
 =?utf-8?B?cG1XYWgyOCtTRzhqVW9RdFpYSFUxN0lORWRmeHJDS0tNckhZZHBSRmJMaUNL?=
 =?utf-8?B?dmFVdUVueEFISHNUS1BiMUNFQ2N1cmY2Z3IrUjF2b0Q3aHFzekpBMVltQkln?=
 =?utf-8?B?ZTFEN3h5K1VNQnV6Vm5ZZ2lxU2JIQXAxNExyMVFySndiK2hHYUV0bk04UUZi?=
 =?utf-8?B?N1FPQjNWVERrLzV2ZjY0WkFudDdCQUR4VytLbnljWUNlak1KMk1EQTZ3ajBT?=
 =?utf-8?B?YW9POC9wbU1KNDJuVWppdlhKTzRIeUE4QnZvNkFOdkltbkZibWsxeVZVekpW?=
 =?utf-8?B?Mm9pdHFUUVFnam5EUE93d20zNzg3SmlOZ2pJVmpURXlIMTZMTEM0c1ZPejQ0?=
 =?utf-8?B?L3pSK3Z2OVZYNHVjdG95c2psRHZGZ3VmcEQ2T2cxbkFSTnE5eFdQYnRsUHRj?=
 =?utf-8?B?ZjUveFl5ak9LWlk4MEEwSGlhbExreGJmQ01QeElZam5pZ2pzMGladFd6OHNJ?=
 =?utf-8?B?cU0vTU9MSTBEaWpmNWJLRDlyMkRLb1F5ZlVYMG1lRHRkc3VNOHljaDZidFpm?=
 =?utf-8?B?VXdLRGQ3ZWs3Y0J1Mkdjb0h6eHdXQkd1YU82TUdzMDBWdDh2SXk5YUI0dWlT?=
 =?utf-8?B?ZHpIN3BWMkJwVUNMQTFKejhZaTM4K2FEQ1hYeElXcVowZlJ2cDgyUDJlK0ZG?=
 =?utf-8?B?UGkxZVVEWUxoVWlWYXdmRENTdVhSNS9iOUJ0bzBsTGEwWHBPTkdBYnB0aUpL?=
 =?utf-8?B?WFNIMXlmcGhpSE1tM2J2ZFhKRTlFNDV3THAyY096Q1Z2NTUwbi8zcXdpQ1NL?=
 =?utf-8?B?ODg1YmViT3FLSzRkZmtnSDBOSC9yVmJ1TVFhRGJRYk4rOG5aQ2lWUkhST0ZI?=
 =?utf-8?B?QmthU1RQQmM1aWxKMnF4c1lwR0ZUT0h1eFpIemUyd0FEUG4zbjJIdjFCS2hD?=
 =?utf-8?B?TUxFT3g5Y045cXkxclRCQ1lQYWUvbVArTUZmalJmbStqN2ZnZ3V6Nlg0d3pL?=
 =?utf-8?B?cHNQNnY0YVROUURXN29jd2RKd3NJcW9HTWx6aDRRdzFYc0FndCtOUWNNSEFo?=
 =?utf-8?B?N3lMSUpTNHhZekk5bzQxTDhZMzUxcExSN2I1alp3dm5BbFp4ejVFcjQraGhH?=
 =?utf-8?B?c1N3bUhFa0QveG5LM1VaNExNeFV0NDNncHJpSzd3U2duaUh2NnlPc2pkM0Nw?=
 =?utf-8?B?VloxWTNmam1WQlJGei9tR0FSdzZUVXZnVTAzUnI2THVlSTVXQkEyVnAzNFZ5?=
 =?utf-8?B?R2d5SHVnK2YzT2RWVHdicWxxeUZETHplM0VuZHhmc1NmVFJXV1NCZTVJVE0z?=
 =?utf-8?B?dDdBN3JwcS9URkk0TWNacTRNejdJMWJIbCtobk56UFpMVnM0c3FFU2dwMHdG?=
 =?utf-8?B?T0UydDBIQnEzdTNMQ1pvY0RmZVB4SzRick81TU5xeHpSNVB6emw5NWl6VGtr?=
 =?utf-8?B?WDJuS3llbm1uRlJ3aTBmbFdZMm1OVE5GNkhFZ1ZFdnYwMkJ3SVJTSGhuK3FX?=
 =?utf-8?B?eXpMMHhLU25ML0EvMzAzMXJpYy9mY3ozR05XUmp3ekZSUlJOTG8xZ2lQMlhz?=
 =?utf-8?B?WjFxMVFMMjJya1A3S0xuZnZPYnFrazE2SGlacm9ZQ2VQcHcrcXpNWGFsNzRn?=
 =?utf-8?B?bVNkUlA2Y1ZxakltVHYvVVdUTjFGTUpvTk5DMEp5NHI3Mys4Vno5eit6S1V1?=
 =?utf-8?B?TWFOTlVOSThqOVppMlZFY3ExbHduL1RYSEdqaXZ6MnF5TzBUbE5JSmI1MFZB?=
 =?utf-8?B?b2lWTlVZbGx0NU5jS1dHUXVIZFNRbGFUTExuM3BNd2hjVFd5OFdqdXdVNTJj?=
 =?utf-8?Q?wdUmsbo2yBFGET6l+zG9O+a+z?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f4018c-3ccd-4cec-f516-08da54eef545
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:04:12.2798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VB+na/xj0Gb3FzU2sjStKeX3XykNoH8GK0ohwZYw9goctc2LSwHMAOV1p+B4ASd+C7me0Mp8npwA0GRMHjsOgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5038

On Thu, Jun 23, 2022 at 09:43:30AM +0200, Jan Beulich wrote:
> On 09.06.2022 17:33, Jan Beulich wrote:
> > While mail hasn't been bouncing, Daniel has not been responding to patch
> > submissions or otherwise interacting with the community for several
> > years. Move maintainership to THE REST in kind of an unusual way, with
> > the goal to avoid
> > - orphaning the component,
> > - repeating all THE REST members here,
> > - removing the entry altogether.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > We hope this to be transient, with a new maintainer to be established
> > rather sooner than later.
> > 
> > I realize the way I'm expressing this may upset scripts/*_maintainer*.pl,
> > so I'd welcome any better alternative suggestion.
> 
> Two weeks have passed. May I ask for an ack so this can go in?

I don't think mine suffices, but just in case:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

