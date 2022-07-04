Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB356569F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 15:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360366.589723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Lpl-0003Vv-5m; Mon, 04 Jul 2022 13:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360366.589723; Mon, 04 Jul 2022 13:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Lpl-0003ST-2R; Mon, 04 Jul 2022 13:09:49 +0000
Received: by outflank-mailman (input) for mailman id 360366;
 Mon, 04 Jul 2022 13:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8Lpj-0003SN-Dt
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 13:09:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 891c407e-fb9a-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 15:09:30 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 09:09:42 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM4PR03MB6933.namprd03.prod.outlook.com (2603:10b6:8:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 13:09:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 13:09:40 +0000
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
X-Inumbo-ID: 891c407e-fb9a-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656940185;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=I970Hla0hSh0E2q2eJmtVXp1MOX68i9tdiwcKyQtzSo=;
  b=Js/LwoRCNvhqy8MpUb5Wzy78iUBm28MydB+aS36tkmSQnBMvjzai6hd6
   PXnzWgQFXO9coQdZ+kdwe1N4uZFZ3J45ZuUzAz/d5Hx/zJuIszwv6YpDF
   AenQtpF0tluanU5dAwhn2QkxhUu3+NeCovKaJ/lBSWjSB67rsjrP0S9VZ
   w=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 75462015
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2nXymKo5vShPAPqIlLw15kOPykBeBmJwZBIvgKrLsJaIsI4StFCzt
 garIBmHMvaMMWHxc9AiYY7loE9XscfTzoNkSVRv+StmFXhE9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvS4
 Yiq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHajHhO85WVpkOHt6O6pa35/MO2iYiJnGp6HGWyOEL/RGKmgTZNVd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp3pom8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK+PZpuTCKkWSd1pDBO+DMS/iYTv50pX2kh
 3rf5WjgACAFYYn3JT2ttyjEavX0tS36Qo8XGaG18eRCnUae3HdVExoLT1C2r/6jhUP4Xd9DQ
 2QE9yxroaUs+UiDStjmQwb+sHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFjpZMoV+7okxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:tF1WoK0niToOLs9wurRwIgqjBSlyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQD0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6d2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCqlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXd
 WGNPusqsq+TGnqLkww5gJUsZyRtzUIb127q3E5y4OoO2M8pgE786MarPZv7EvouqhNCaWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHflAlEii8R166EBDAKJwtHU7rhtre3IgVjdvaC6DgiqFC06
 j8bA==
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="75462015"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJZGgzNnmrulkXhCu/2ijFaKTyyBS0HxObnkdDLSiPtR03fMMaMyUKw3P57RuJy1O0VVdq9WORRLItk/1HIb7jOR1sO9aovqr4Ruf7aHgP8xUPS/MMhwy8G94oWB10cvp/Il8Go2wzA4ndfdntiI3HA9WqnhXDgT2S/HzE/fEQ5gzp+ClY8N+9/sMony4xWQFXFod++pbzTMndDR9suSl3Nnz8Fdztbj7wzMcEVq0w2NZfjvveaG5TilIgYdCFuJta5Cq00x2lc0nOBCOyRhf5RxmXXY96XX6SzhJnwFV8hVSVJ3XtQQEEtS5ePOqrLL98SWJAeruypbWH2+/4HpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0ynZzdQN8+GSTjnahH/t9Lmr/67CYkpge7ymDD0ixA=;
 b=gCs4rsjVGwjLi9S/sCSDRmSDczv8naL0vXFJSEVbh+o/OFlauWvTFs+h1+z/xq7j99stdyY0dzKvHnnTKSQh+eDwty5sv6CTq/xdFSNANu3gczbvMdVvs5Erno8v+TYlF4+Vi4IbkP/YfcTV3IXmkLrSolzfP7XnK5C4dAjtRIpU/a22gdKo9m31uhRnc5g7HM5R20AOLcyak3UZlNyu6l/Cd+lGgAcMs3OM6a5kVloSP/dvyIyhhSlKRasC/31CY26tMQ+I2aFrAZE2HQ2EAdzlPLeiq7g3MapbMtCyxKqkpW6aArOt9egCvmKylc78fJ3OOFn4LqiJ83DtClb8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0ynZzdQN8+GSTjnahH/t9Lmr/67CYkpge7ymDD0ixA=;
 b=Rn7gEESHuC3Xarmcop8SV6MX+Qo4UluJPFTrip7pZCZ5PhxvXRiCFmFM58+jmT2E8DNPDIAITW78y4XihqXuC2FeI9gVk5b875n+1OxiWoQ+dKna9pFrxTC8G1FE5CFL9O8aHo87wyH+Qu+LMxop1IwRQ1rnVBsY7uo2PkwCZfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 15:09:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Message-ID: <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1218ce0-1bc1-4672-7ea0-08da5dbe7425
X-MS-TrafficTypeDiagnostic: DM4PR03MB6933:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uDAXYt3vYsmTLxApRD0s06EkvNfskNHaaQYFN5MVpnQBFpf4tuw91vSsASMoRdC6rSTGgK370hPDwHIpNP1bcG+Aw/kCPqOfFSc1d2/zvqNL10xxwMsbWa98+up7xpsutMKQTsz42SbNLUZD0MRjzpdQaTzbxBdU+thRRqiZs3WGwn90TRBDCwvwNm9xGzd2ZdANjS86lMBZSz3X7KSMTp3gr464Bit+AtzGerBNOoy9Nc9Q3L8llavRE6ZbQI27+2GIZznvIJQkU+axcGEzc0xdjb4XXWrF8iE1a7mqbuUoHgXpvwhbeQJw+PwGqUXc5o9i2avTjz+4Elei5+R0ScigkOx9gE/5NfqvreeW1s1wOP3j9f6Zl0kP89WNgJTweECAfsg8Tam9MfPjs0RCtWUq9bjOBubw1NA3JjJPtq5BfZC0hvgu0iqdmaovbAbgooa91qERikMjKTy3/rQwBdYyatCNgroxjUKKKDpvr7t7Te/shOZ45V79VboJMvaLQ0vZYqa7Qcp72pm4wm5iuBk6arVwzV5OBa28Ozz4gP+kszpnT/lq62BPpPogZctxeg+QkCj2NlWoPU7bFY6qhGu8gQpJZEyYGAXPEgrfXpNNwFGECsqLc1HJ3pNrnC4MROp3iJm7ZTQHSmw0dY+6fVuvuxstOTp0D1Ui4rdIID+mZy6UDd3cZT3GmXdbAmBWcIGqimweKmTSYOR0btX+XFVujZD/3suXT8qP+xngLvYMFpD7bRbNeVl7exLl2hk8JNPS8RydLu3qS1ptgrJaoagosBkb1SXYgN0gxAxrAbXvJgdb7hxaSeT5xGkwvYbY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(38100700002)(6486002)(2906002)(478600001)(41300700001)(30864003)(5660300002)(8936002)(186003)(86362001)(83380400001)(6506007)(6512007)(9686003)(6916009)(26005)(316002)(66946007)(82960400001)(66476007)(66556008)(4326008)(8676002)(19627235002)(53546011)(85182001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1Vua0JBd2dNMDFWN2hncnFnaWJRUnVJeWhpNUNRTWNMb0VuZHc3OWhXbld6?=
 =?utf-8?B?TzhVZGJGMlljVk5sYTJrWm8rRGF5NHZTaUh0ZUZJdXVaZlpua1R6dEx2WVhL?=
 =?utf-8?B?clBpYzVoYUhnb2lud3JmMzBUZnZTSWwyL1FnV1pDK004SXVJTExySngyczE4?=
 =?utf-8?B?eEVMelVmS21lVU95MEFJMnNCTHM0UnBHeU8yNDlMQy9UK0tja25lNjdVTDJR?=
 =?utf-8?B?REFFL1E2UWxBZ0JlTnRQZXBnVEVUWFlWVkZCY1FlYlZtM1R1a0U4ODE3WnVi?=
 =?utf-8?B?VHhMejZ2eDBTNUZqOTJnV0RDM2JpbVNrWEFYdDNxcG9yZHdBWFN3WjFXMnRw?=
 =?utf-8?B?a3B2QU04cjBQdGZZNmJsUnJoa0lyZW1iNXFJdHQrQnVhMGQwS1VuK1NOQXFY?=
 =?utf-8?B?SWZxUTNuZEJHeml0Q1NWU0s4UkVPQmp2WTF6VWhDaDdOMDhwNnkySFovcVVO?=
 =?utf-8?B?NUtQN1FpWC94VzkyUTY5Mll5cmtJYk1JU3RNYnA3L0QxWCtLaGs0WkpJVVlH?=
 =?utf-8?B?VXM4dk0wU2hSNE53a2ROY0RxTTZ2S1pYZGpKYytEVEduTHEvYXprcG9rVndy?=
 =?utf-8?B?SWQxK3EyRWlOYnd5OVdCd2RqQWxwTzVpOFByTEhJOGl2cGtjRnNsVWs4VC9W?=
 =?utf-8?B?cXlrREgwaTRLYVlDVklaT2J0U3F6SlQ1UWx6MGhxdXdXaUpzVWN3VWhJZDd3?=
 =?utf-8?B?eEZ3dVYwS0FwSXJjbEhwZU5rbnd0RTVsc01sTVJnNWtrcVdPQVc2S0tPdkxC?=
 =?utf-8?B?T3VEWkxZZDlYYVF3dmZSczI5ODBSTXhwN01FdXBXSDViTHkzQk1YNm0xeFd0?=
 =?utf-8?B?cis4eGx1TUdnVnljMWlNeEhIS3FNbFVDSUpGZHh3Vy9rZnhxblIvUVExWS9n?=
 =?utf-8?B?dzJzTUNJTFV2NEZFaXdoWE9ESEZFbXUyR1VSbnpBK2lLdnYwSU5uM251Zkkz?=
 =?utf-8?B?MHpzTGJndGJhMmdYbmFlaDZ5TTdEclR1R3VCV0ZWZ3RmRE1wTENIOVZ4ZDlK?=
 =?utf-8?B?VlhRbzdmaEwzS3UvR0xmYWtMQnhmOWJrNG1uSVNaTElQK09uTFk4NFhQT2ts?=
 =?utf-8?B?enVCOFRUUDJxNGtWQklWNE0vb0RrbGo1dUFSTnYvOUlobmUwMmhWU0s4OGJn?=
 =?utf-8?B?U0piS1ZNUVVMYXhodHluenh5czA3RDJLZ2hOYjJvMVF0d1lCWUlqdjlTdWhY?=
 =?utf-8?B?Mk1OOG5MRXRiYXFqaEtrSXljY0RKdmMxMmNmV0NBRkZuNFczaUpVQURpZWhq?=
 =?utf-8?B?OHd5L2NYSjVVVlNudzhyV01JYnN1T1V0SHVReUN4TGQ3eVBpd2dHRWw0ZnNo?=
 =?utf-8?B?QW1JNTMyZjQ0NDFoV2JoTVJJY1lkTnZoZTVXbXdTZFB1U01rcHNsRk83SUtD?=
 =?utf-8?B?bExNcmxPaGxFZU1vaWV0UUhUeGNhUlRkbnZZTjBoeTIrcTNpMkMxT0FyRGht?=
 =?utf-8?B?OCtuanBTQmpTeEpmNDBtVWF5aFJrR29FbDJ3aHdNTHNEeUNxTTdydUhKOUZy?=
 =?utf-8?B?YVI0d1lFNHNHdVFydzlCeTI1eVRKS1ZsRE5TdmRFR3dYZEFKNlhlQlZGOEpp?=
 =?utf-8?B?OVJmWEhkU2ZzOFVGdWRHaElhMS9tM0Fsd3B0dkdCWFhMMWhXQ2FsaXpoN2c1?=
 =?utf-8?B?Z2pUYlJlSFdTMmU2UE1keVBteER3bGkvT3lwVXVtVHpSWWVkYUF6U09ZdlhB?=
 =?utf-8?B?OFV4bUQwR3JGZTU2UmxFbXBQdEJKbWFvdTlId1NlRGN1Rnh4WGdHcHY4SVdu?=
 =?utf-8?B?QTR1TXV0SjRSTzdRSDVXb2xPSVpXQ1RraUxYTE94WGlGK25obXlmQTVuUDZ0?=
 =?utf-8?B?ZUVaMC9KUEtSR09ubC9iV2NzOEt3QkdGMGpucVpFQTI0aHBneGhpWCtxcXM0?=
 =?utf-8?B?N0RiVjgxWjdOay8zeG1Lakx4ME9nam14R09rVWlnNUpMaHRFMkM1clFXaytN?=
 =?utf-8?B?b2djMUJKWTlYZ0VXK053d3NYNTFScFN5YU41ZmlhMlVFclFRVFFxS1pIQ2F1?=
 =?utf-8?B?TDBxS1hEamFFZ0tubW0wRzJ5M2tSQ05ud3l1c3lyTklzaEw0UHgvSjR3eGtL?=
 =?utf-8?B?eWM2dFV4WVdieG5WTXNyNm0wSnNqOXNYaHNFc1VNdnB2REprK1o4RTZPaXlE?=
 =?utf-8?B?eVBsUDMvYVVqQlJVb0V5V292Q0VncXVuUW5aS0ZkMmJ5S2VOWUJvWjR1ejhN?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1218ce0-1bc1-4672-7ea0-08da5dbe7425
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:09:40.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxTEHaJR3k/hiqSSdOji0gHXTfwvb6d3kQy0WOqjdpmEoh9uo7kkpediSn4Sk1BCEmXl+fqxVk4Rx+hHsta/Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6933

On Mon, Jul 04, 2022 at 07:34:47PM +0800, G.R. wrote:
> On Mon, Jul 4, 2022 at 5:53 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Sun, Jul 03, 2022 at 01:43:11AM +0800, G.R. wrote:
> > > Hi everybody,
> > >
> > > I run into problems passing through a SN570 NVME SSD to a HVM guest.
> > > So far I have no idea if the problem is with this specific SSD or with
> > > the CPU + motherboard combination or the SW stack.
> > > Looking for some suggestions on troubleshooting.
> > >
> > > List of build info:
> > > CPU+motherboard: E-2146G + Gigabyte C246N-WU2
> > > XEN version: 4.14.3
> >
> > Are you using a debug build of Xen? (if not it would be helpful to do
> > so).
> It's a release version at this moment. I can switch to a debug version
> later when I get my hands free.
> BTW, I got a DEBUG build of the xen_pciback driver to see how it plays
> with 'xl pci-assignable-xxx' commands.
> You can find this in my 2nd email in the chain.
> 
> >
> > > Dom0: Linux Kernel 5.10 (built from Debian 11.2 kernel source package)
> > > The SN570 SSD sits here in the PCI tree:
> > >            +-1d.0-[05]----00.0  Sandisk Corp Device 501a
> >
> > Could be helpful to post the output with -vvv so we can see the
> > capabilities of the device.
> Sure, please find the -vvv output from the attachment.
> This one is just to indicate the connection in the PCI tree.
> I.e. 05:00.0 is attached under 00:1d.0.
> 
> >
> > > Syndromes observed:
> > > With ASPM enabled, pciback has problem seizing the device.
> > >
> > > Jul  2 00:36:54 gaia kernel: [    1.648270] pciback 0000:05:00.0:
> > > xen_pciback: seizing device
> > > ...
> > > Jul  2 00:36:54 gaia kernel: [    1.768646] pcieport 0000:00:1d.0:
> > > AER: enabled with IRQ 150
> > > Jul  2 00:36:54 gaia kernel: [    1.768716] pcieport 0000:00:1d.0:
> > > DPC: enabled with IRQ 150
> > > Jul  2 00:36:54 gaia kernel: [    1.768717] pcieport 0000:00:1d.0:
> > > DPC: error containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+
> > > SwTrigger+ RP PIO Log 4, DL_ActiveErr+
> >
> > Is there a device reset involved here?  It's possible the device
> > doesn't reset properly and hence the Uncorrectable Error Status
> > Register ends up with inconsistent bits set.
> 
> xen_pciback appears to force a FLR whenever it attempts to seize a
> capable device.
> As shown in pciback_dbg_xl-pci_assignable_XXX.log attached in my 2nd mail.
> [  323.448115] xen_pciback: wants to seize 0000:05:00.0
> [  323.448136] pciback 0000:05:00.0: xen_pciback: probing...
> [  323.448137] pciback 0000:05:00.0: xen_pciback: seizing device
> [  323.448162] pciback 0000:05:00.0: xen_pciback: pcistub_device_alloc
> [  323.448162] pciback 0000:05:00.0: xen_pciback: initializing...
> [  323.448163] pciback 0000:05:00.0: xen_pciback: initializing config
> [  323.448344] pciback 0000:05:00.0: xen_pciback: enabling device
> [  323.448425] xen: registering gsi 16 triggering 0 polarity 1
> [  323.448428] Already setup the GSI :16
> [  323.448497] pciback 0000:05:00.0: xen_pciback: save state of device
> [  323.448642] pciback 0000:05:00.0: xen_pciback: resetting (FLR, D3,
> etc) the device
> [  323.448707] pcieport 0000:00:1d.0: DPC: containment event,
> status:0x1f11 source:0x0000
> [  323.448730] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
> [  323.448760] pcieport 0000:00:1d.0: PCIe Bus Error:
> severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver
> ID)
> [  323.448786] pcieport 0000:00:1d.0:   device [8086:a330] error
> status/mask=00200000/00010000
> [  323.448813] pcieport 0000:00:1d.0:    [21] ACSViol                (First)
> [  324.690979] pciback 0000:05:00.0: not ready 1023ms after FLR;
> waiting  <============ HERE
> [  325.730706] pciback 0000:05:00.0: not ready 2047ms after FLR; waiting
> [  327.997638] pciback 0000:05:00.0: not ready 4095ms after FLR; waiting
> [  332.264251] pciback 0000:05:00.0: not ready 8191ms after FLR; waiting
> [  340.584320] pciback 0000:05:00.0: not ready 16383ms after FLR;
> waiting
> [  357.010896] pciback 0000:05:00.0: not ready 32767ms after FLR; waiting
> [  391.143951] pciback 0000:05:00.0: not ready 65535ms after FLR; giving up
> [  392.249252] pciback 0000:05:00.0: xen_pciback: reset device
> [  392.249392] pciback 0000:05:00.0: xen_pciback:
> xen_pcibk_error_detected(bus:5,devfn:0)
> [  392.249393] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
> [  392.397074] pciback 0000:05:00.0: xen_pciback:
> xen_pcibk_error_resume(bus:5,devfn:0)
> [  392.397080] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
> [  392.397284] pcieport 0000:00:1d.0: AER: device recovery successful
> Note, I only see this in FLR action the 1st attempt.
> And my SATA controller which doesn't support FLR appears to pass
> through just fine...
> 
> >
> > > ...
> > > Jul  2 00:36:54 gaia kernel: [    1.770039] xen: registering gsi 16
> > > triggering 0 polarity 1
> > > Jul  2 00:36:54 gaia kernel: [    1.770041] Already setup the GSI :16
> > > Jul  2 00:36:54 gaia kernel: [    1.770314] pcieport 0000:00:1d.0:
> > > DPC: containment event, status:0x1f11 source:0x0000
> > > Jul  2 00:36:54 gaia kernel: [    1.770315] pcieport 0000:00:1d.0:
> > > DPC: unmasked uncorrectable error detected
> > > Jul  2 00:36:54 gaia kernel: [    1.770320] pcieport 0000:00:1d.0:
> > > PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction
> > > Layer, (Receiver ID)
> > > Jul  2 00:36:54 gaia kernel: [    1.770371] pcieport 0000:00:1d.0:
> > > device [8086:a330] error status/mask=00200000/00010000
> > > Jul  2 00:36:54 gaia kernel: [    1.770413] pcieport 0000:00:1d.0:
> > > [21] ACSViol                (First)
> > > Jul  2 00:36:54 gaia kernel: [    1.770466] pciback 0000:05:00.0:
> > > xen_pciback: device is not found/assigned
> > > Jul  2 00:36:54 gaia kernel: [    1.920195] pciback 0000:05:00.0:
> > > xen_pciback: device is not found/assigned
> > > Jul  2 00:36:54 gaia kernel: [    1.920260] pcieport 0000:00:1d.0:
> > > AER: device recovery successful
> > > Jul  2 00:36:54 gaia kernel: [    1.920263] pcieport 0000:00:1d.0:
> > > DPC: containment event, status:0x1f01 source:0x0000
> > > Jul  2 00:36:54 gaia kernel: [    1.920264] pcieport 0000:00:1d.0:
> > > DPC: unmasked uncorrectable error detected
> > > Jul  2 00:36:54 gaia kernel: [    1.920267] pciback 0000:05:00.0:
> > > xen_pciback: device is not found/assigned
> >
> > That's from a different device (05:00.0).
> 00:1d.0 is the bridge port that 05:00.0 attaches to.
> 
> 
> > >
> > > After the 'xl pci-assignable-list' appears to be self-consistent,
> > > creating VM with the SSD assigned still leads to a guest crash:
> > > From qemu log:
> > > [00:06.0] xen_pt_region_update: Error: create new mem mapping failed! (err: 1)
> > > qemu-system-i386: terminating on signal 1 from pid 1192 (xl)
> > >
> > > From the 'xl dmesg' output:
> > > (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
> >
> > Seems like QEMU is attempting to remap a p2m_mmio_direct region.
> >
> > Can you paste the full output of `xl dmesg`? (as that will contain the
> > memory map).
> Attached.
> 
> >
> > Would also be helpful if you could get the RMRR regions from that
> > box. Booting with `iommu=verbose` on the Xen command line should print
> > those.
> Coming in my next reply...

> 00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port #9 (rev f0) (prog-if 00 [Normal decode])
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 126
> 	IOMMU group: 10
> 	Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
> 	I/O behind bridge: 0000f000-00000fff [disabled]
> 	Memory behind bridge: a2600000-a26fffff [size=1M]
> 	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
> 		DevCap:	MaxPayload 256 bytes, PhantFunc 0
> 			ExtTag- RBE+
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 256 bytes, MaxReadReq 128 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #9, Speed 8GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <16us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 8GT/s (ok), Width x4 (ok)
> 			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
> 		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
> 			Slot #12, PowerLimit 25.000W; Interlock- NoCompl+
> 		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> 			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
> 		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
> 			Changed: MRL- PresDet- LinkState+
> 		RootCap: CRSVisible-
> 		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
> 		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> 		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
> 			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled, ARIFwd-
> 			 AtomicOpsCtl: ReqEn- EgressBlck-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance De-emphasis: -6dB
> 		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported
> 	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
> 		Address: fee002b8  Data: 0000
> 	Capabilities: [90] Subsystem: Gigabyte Technology Co., Ltd Cannon Lake PCH PCI Express Root Port
> 	Capabilities: [a0] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [100 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
> 		UESvrt:	DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 		RootCmd: CERptEn+ NFERptEn+ FERptEn+
> 		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
> 			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
> 		ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
> 	Capabilities: [140 v1] Access Control Services
> 		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
> 		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
> 	Capabilities: [150 v1] Precision Time Measurement
> 		PTMCap: Requester:- Responder:+ Root:+
> 		PTMClockGranularity: 4ns
> 		PTMControl: Enabled:+ RootSelected:+
> 		PTMEffectiveGranularity: Unknown
> 	Capabilities: [200 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=40us PortTPowerOnTime=44us
> 		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1- ASPM_L1.2+ ASPM_L1.1-
> 			   T_CommonMode=40us LTR1.2_Threshold=65536ns
> 		L1SubCtl2: T_PwrOn=44us
> 	Capabilities: [220 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [250 v1] Downstream Port Containment
> 		DpcCap:	INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
> 		DpcCtl:	Trigger:1 Cmpl- INT+ ErrCor- PoisonedTLP- SwTrigger- DL_ActiveErr-
> 		DpcSta:	Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO ErrPtr:1f
> 		Source:	0000
> 	Kernel driver in use: pcieport
> 
> 05:00.0 Non-Volatile memory controller: Sandisk Corp Device 501a (prog-if 02 [NVM Express])
> 	Subsystem: Sandisk Corp Device 501a
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 16
> 	NUMA node: 0
> 	IOMMU group: 13
> 	Region 0: Memory at a2600000 (64-bit, non-prefetchable) [size=16K]
> 	Region 4: Memory at a2604000 (64-bit, non-prefetchable) [size=256]

I think I'm slightly confused, the overlapping happens at:

(XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted

So it's MFNs 0xa2616 and 0xa2504, yet none of those are in the BAR
ranges of this device.

Can you paste the lspci -vvv output for any other device you are also
passing through to this guest?

Thanks, Roger.

