Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424B58EBD0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 14:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383581.618771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLkaH-0000Cl-QJ; Wed, 10 Aug 2022 12:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383581.618771; Wed, 10 Aug 2022 12:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLkaH-0000Ay-Nb; Wed, 10 Aug 2022 12:13:13 +0000
Received: by outflank-mailman (input) for mailman id 383581;
 Wed, 10 Aug 2022 12:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLkaF-0000As-Q7
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 12:13:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0ab447-18a5-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 14:13:09 +0200 (CEST)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 08:13:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5600.namprd03.prod.outlook.com (2603:10b6:a03:286::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 12:13:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 12:13:04 +0000
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
X-Inumbo-ID: cb0ab447-18a5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660133589;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=us74gs0zVWl2+1PrLlCRJesW7as0Tfs310n0PoQ/PMQ=;
  b=WuGwZP3cD3MqbZF9sHpB8OnklPyVHbDjqOX9QoGIn/qZQ/rh7EP1YQz2
   r95UIw1K6Q1WFcgSDliH5TuoINBpyil6xbX2XiU4UWkFpQilBhzvWPvZ+
   aw2h4LnlJtKQPgiChoPYzO7i6/N3+7o0VH8JZYILNnYfamKpdelyR3s2a
   Y=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 78209937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Dt/Miq02gjB2PZdiW/bD5ctwkn2cJEfYwER7XKvMYLTBsI5bpzRWx
 msdC2qFM6qKYTCmKYgjbIng8hxU6JOHy9U3SgFopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Us35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj689BMUYcMI5ExqVmB1hrp
 dECLDEyMznW0opawJrjIgVtruIKCZGxea864TRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ye5L2QwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPPk2LUoynz7gPJtRiqG5AoEpGoz6FvhXKo4nMBK0JLWETu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCz
 laUm/v5CDopt6eaIU9x7Z+RpDK2fCQQdmkLYHdeSRNfu4W65oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:xbe7Wa5JegNOdau2oAPXweCCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FXQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMk5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvvn+9Ua1wWR4S2rpXV9
 WGP/usosq+tmnqNkwxi1MfhOBEmE5DRituDHJy4fB9mAIm4UyRh3FouPD32E1wtK7VAqM0md
 gteM5T5c5zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCZgOlZaXkaYzve0PsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGa+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8XXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummkZ5osQD2LwXtdKtmrwwFI8vl9CmRliHlntX2poseWNDZFrqs6OE
 NjPbKPqNLImVWL
X-IronPort-AV: E=Sophos;i="5.93,227,1654574400"; 
   d="scan'208";a="78209937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMfAtpmth/uH/KA9iR2b0YJH0kZP68NHfCAE3jYHfCXeXE5YboCws4/T/ca/8sfhtCUzb8E70Bg/5pV6QmLNfqIOFZW91Hei5MvFyUHaOqv6GJhU7cAbvgVSLLool3i4L9xBUtqFFGyYrDBTmGsy94OfjZ2RTmCL5uGE/MZb8h58lkt9VaAOm0MiJ93opUI1lKdUKmM+e6hRemky1ZdDixwd5VIT8+hs+S9G909jLGrWXSJte4FSllr26BI+itEq7QMvPKqaHvPWmv/fGJsTQL63OyftACXOedXNqT9KlWPb0zYDbq64SfJLuj0oWzWGJ0sDTtJjWm8OqB/ysR7OLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us74gs0zVWl2+1PrLlCRJesW7as0Tfs310n0PoQ/PMQ=;
 b=kMrLKgR1ORDaHipOS7SR6LoFGJliUv9hvx0zMFNplp85alrq6Rr/sJp68PP+O0VaKuVD6cL0+3jGpJT/00Hwl+I+U7kb36yXP+WM39N5XGYfs71+Mf7OiWprqi1coqkYJK5go/T3hpbCLxaL6xvIgPj7N9Ql/d3aofbjSmeE6Z8ffJvyMMUS/c5AnNV6hP5s65XxOQOvRv8Jk4OINAc9d7GLgkQNxOp2mRx8f8NqUCNKeR//WgWMPEVaQYqFf2+PdojfySqMtQGl5AkG3c4C4TOAhxeq7w8uTujbVa1VXD0NUDb7fUNBaG6yuzoqng6WNSxyq01D7tXzV3g+w3tDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=us74gs0zVWl2+1PrLlCRJesW7as0Tfs310n0PoQ/PMQ=;
 b=CjlCsuJfR1v2D37lhiO9Fo1rSTv2kVBqCcriYIOPJIFrWhQ7SbWV88zRwO1BIHZzFnxs4zVE+ZkfLLyh5k+bOMHtbUpgf/rGCj0sRgj+yc1GDnO2mCosKoocsTD1vkqTyU6yOux7JFU5hgyOP6jy06GYqMvDEqEoO/Qqb2akAEM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] PCI: avoid bogus calls to get_pseg()
Thread-Topic: [PATCH] PCI: avoid bogus calls to get_pseg()
Thread-Index: AQHYrAfYR6vkCfF7n0qu0r3Ze+QmG62oDQUA
Date: Wed, 10 Aug 2022 12:13:04 +0000
Message-ID: <ab3f2c03-afa9-a109-7803-bdc23056b7bf@citrix.com>
References: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
In-Reply-To: <80fb0709-5a0d-a3a5-b2ea-dca089714ac2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f55b298-db3d-4ade-bd2f-08da7ac9adaa
x-ms-traffictypediagnostic: SJ0PR03MB5600:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 O1O6fuS+0k4kelGoOjCYfahgjEtGccfdCCeugd02MnHCeBkJMIE9MTQFRUEmx0z75g7addxMeUGASUZP9YX1Ov/49BG248ZX9bnNEWwt8BYZxBBZqyu4LBdk9PojCUgFsi4wPq9Ig4cSVzdWhiFartNTGLNAMWxBXNh2DiM3+R6yri66GLfYRpJINqjbeCs8dVUkm+1qKOjcIxWjomASJsOlxRsOg0hA0J3/AuHbE722k+GzpZQbv13pNrqgmephgu3Nwuuwu+Am4RJ19YTEe8V3hU68li2LPPvj5buvEstk2WKY9tpKSuGQWFCfRL/8wnwqwPVy48NWvExR6NOKEmr5SQYtFQH1D+BQ9jugkmYCzyodI/m8M2oOTG7PvdTMyhvXl/XMZoLw/Qnnx8MBiifsKMgObQBESKlJhxi4lnFh21SL/OHNE8PVlakGiDL9/5dRQUpp+QBzvxDFXhjiMvTbyjbUJybHxykIW0fbr/o2vU/y8PnDsJj1QmFabXkKOB19xI1wHc/0YkV3RCr7Uy9g17zwHxtjT5GHn6m9btPh/dOu6FTc/DEfIssz7NL1OR34aEpTeyZfiF1DkAujheVNzacxCy0+evztEwYISl32LfAU0MpIpTvQl0fktRKEuv4cDZ6ghptLbN7HsfYr958jVRHZHWxDQFUGd/hccR0Lt8g7iguilatKruY5f2SLkiMHMu1gHypXY/HpEVIssaqzaHxyUxKyf6CfK15fFU9WlSviSvEMlY3sXssLRr09AM1g4NdC/asVulpJF1PqMhHXnAyJOQ6rgqYnJss75ZsvNjV3K3NgqILWSp+tic28rNP270NadGR9AUHeLpDWrn4w1BBVS6EzmfAbkqgM/JQhOW07ifC+LrUaShVb8eq+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2906002)(478600001)(41300700001)(5660300002)(76116006)(91956017)(66446008)(66556008)(4326008)(8676002)(66946007)(66476007)(316002)(71200400001)(36756003)(6486002)(86362001)(31696002)(31686004)(26005)(6512007)(6506007)(54906003)(110136005)(53546011)(64756008)(122000001)(38070700005)(2616005)(186003)(82960400001)(83380400001)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlllMXJNc0xiVHdwNmVodzJLQ0xkOUl0eTIvaTZ3QXQ0ckFqZVNkeGlUYXZq?=
 =?utf-8?B?V3M3cjlXeWNFKy9UNU0xci9Wb3ZrNTdyWCtzNktTVEF4Y0pxRk9OR2MvamRI?=
 =?utf-8?B?OFJRQkNCR05QMmJCMk9mNFpjT2FQRlJuV1BrZmdmSWNvWHlkVGxBVkJjcnBZ?=
 =?utf-8?B?cEFGVWJIMXJiRE9jY2JxamlCUkNDNktqUjd5RnNZTWRwbkxwRDM1TVRZQUNX?=
 =?utf-8?B?WmlPblpCTWZvUUlBNVpQd3Azd2lkcVRBODRwUjk2VWtHUTJtcCtVQ2JTendB?=
 =?utf-8?B?aXVFcStWdTAwM2RhNEk0bE1PSGkrWnE2TzlTb3R3ejQ3b0R4R2JYR1VGM1VG?=
 =?utf-8?B?ZU9vMjAwY3U1VVJ3bFFKWmdCT2hQc2NnTE5zMk9BaUFMWEMzRWN3ZXFNb3ov?=
 =?utf-8?B?QWFZL29RRjdqbXhDL3FrQnZoaS9NRjlGdU1xUzNzYXBtaWJSclN4TGZyNlhI?=
 =?utf-8?B?VU1IWkI2V0NjTmk5UWNweDJjQm5xKzJuV0M1aUx2dUFwaUhHK2xaT0VndjdS?=
 =?utf-8?B?K3dDZS9lZmpGTno2bjhCNldaTzMyRDFic01PWWo4bXJ5dHFvYjRodFByNHlL?=
 =?utf-8?B?Mm5OYytzY2NLaEV1TzlaeG1oZUErY3hEaHA2eWE0aTJWQWFQNHRnajhEUFdN?=
 =?utf-8?B?SXFudStleEw3OU9zcmxZSUtuc1VseDdta01jYWNvNElrUkwyUkluZnFmZUFS?=
 =?utf-8?B?V3VsUGRFSWw5b3orZkRlTWFUb1VhRVhlelhNS3ptT3NXYWJ2ak93Y0tRRkhO?=
 =?utf-8?B?S1JRdGJOMmR6aHVWR3RrSlcvTXYxbmNGZjRSSWw4R1BBS2NhREVsSURycUNM?=
 =?utf-8?B?bjk1V0lRNmJFUGEybDRNc3NxNkFLZHQ1TFhjMUFJQTQzTVhpdFpSbWNPakkz?=
 =?utf-8?B?OE5qVU9jMmFlOThSWE5xYk9obFBCbU8zcG1QSFhFZ2kzRlR5NXdib2FjR1Rv?=
 =?utf-8?B?UDk5Z3ZlRko1dTRVRzQyQkNvVC8yeis0TWJpR205SkVKTTA0REo5K2tZWVJ3?=
 =?utf-8?B?QlArUzJzMFhyeGE2UGJBNFAvVEhxSGVGeURNcDBqL0lkbzFJRGdlNXFKWUth?=
 =?utf-8?B?T2NSMFdkOTQvTVRXY3o4RmlwU1hDalIrNURoV084VkhITUlVQVo1bDhBbm1W?=
 =?utf-8?B?bVkxZGU5UlZ4NTY0RlNSalQwYnp6eXBiTlFKN1BzejBjMXRFUmUvQk0wMXZ1?=
 =?utf-8?B?NkpNZmE1MVorTms2K3p4SEVjUXZqRXRwNGFPVFg5VktPb09aVzdiSFozQ0w2?=
 =?utf-8?B?dko2RG1EK0c3VDU2WHhHVFE4Zjdmajg5OExzR0FtbW5rUmYwMUtsQUdJTisz?=
 =?utf-8?B?MnZFVlEwdlNqRGNZTjdkQmlyQUVOSHBkSkg3Wm9rb0FMbVBkb0hPb2pJNjcr?=
 =?utf-8?B?SEg5V2NBT01oRkhOb2lrM0s0T3k3NEVNSEZkZmhNZ2F5bUdJNVlpTHZHdGJ4?=
 =?utf-8?B?b21yQS9BUnZ3NzhRNnZxYlBtVFJGRlRYajFXMS9Tc3FEb2VQOHU0bEFUWkVF?=
 =?utf-8?B?SnlQL3kzemNvNlEwRi9qNnJ2eFpvVUw1ekROU1lhOVdjbzFnTndnU1dSTFpD?=
 =?utf-8?B?dkV2SDMzbmdVRkRWQjhrTmY2dW9sanNoOERIMmZaTjNFNlhLZTA1WVNBSjhX?=
 =?utf-8?B?TTZMV2pWUlBZb2dqY01jMGV6SHMxYUl0cnU1L0F1R1pxN0R5cGdwanZLaEZl?=
 =?utf-8?B?YUZ1Y05PbndtKzNnNG43YXF6NGcyNlhvVDNZMS83VjhkWEZPb1djam1WVVUx?=
 =?utf-8?B?bTJORVV6WFptQTBYbmk0WklOeHJUcGJIUXRBTmxxZ054YlBwbmhGVW9MUjlQ?=
 =?utf-8?B?R3hjb21uc2tpakdMT1Y3ZFk2N3hiRTcwNTIxT3pkZzlCRldvQitDNzZOWlBE?=
 =?utf-8?B?R29oaUlENVpjMjJsdmNFdkJ3T2I4RU5FYU1seXVHa0t2OG1qc0hWbWJNUFdH?=
 =?utf-8?B?bllVNVU4RUFUUFBBRGZTSUVCanRtSVR1Rk5sSzdVMWlydWNmY1RZTzBDREhj?=
 =?utf-8?B?NUMyc0FtK2NSTzltTEhjOU45czBsUnFEb1RwbG1RdWo3NkFRbnc5SnhyVkwy?=
 =?utf-8?B?OXhLbWFYTEtRelArb290cmFHNWlXSFAzMktaZU9tOC9GYWRQWkVzOHpSYWg1?=
 =?utf-8?Q?34FZDQKKh3KeBG/LFVeOCDk79?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CE8B378A62FCB4CA5369DAAE2A58F84@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w9pG8qQx5x4e6h77suAW1vuIUj7opp17FEsfxXA2G4WIROPl/v6Pb1dWd6tZtBgbR+ygRzk0XU6b15F/tdpWRYgmEiHsQwHGXE/B5IA4iHWxNt9qODpj7cHC6om8vi819nda/N6olRXu8LKTQH2LaLj+UoG0EyAtkDY8/miIKgISzPdANzl8mrInjSB89DBVkbq2uywEdcJI4L/Lc+6YqvMEkc0esjHkQj4TTV3+Mbj3C6h9V2O8BGzGA+cB0O19JX/2LNRLx+ck4H/47K2uxSSheTkzOybozuGlmZje9EpQSJ8ndjAQ6LYU2uHdxbs+X8w57RrygJOr8sWv7DMeH+B0PGn+BFdkR1eXFLHB8tpsNWy2w6kWm+E8w4ke0SyrFdusQneDBcedA+DaDjNpvpc8yKtqBMu8j3qF/+bTPrFY1uMz57G/GyUqkcZxXC7Ah6yd7uaWInrc3ABaSN9iuuuI/ZrWb9gIHX+/gP3lyzQoQzl2H+aSlgha6NmYZFNIKDCUPybv6R7UPaVZs0g0mwJDaRp54W/bOC4wk3Mx0xKdumxpEb6yMqoNAhKAfAuFUAEHupE1czYH1Hjjy1uACoSsSf5BkjU9kKY0NdfR94wtDvogOSFcyfyk8x0njVDFGj+1NHyaISRjxZO6H/gbKu2BvvU1CT3HyUdOpgwvsS/OJ3nDg6+y2Cduf9bGdV9AFUzCFjxRaeH48ORXB7p+juZdBiYyFP8fFX6yTnqwC2P0En/7XiGDPo5NZ3fwbdYw7MKMDQ+AwoOPMW8rTe26mpzdb2JQy4fl7iXiTz4OYNEMmm2TI6lEe78xxb2CqGxS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f55b298-db3d-4ade-bd2f-08da7ac9adaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 12:13:04.6384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuNCqp89t0/A7xiattU+u3OXBE5SYy187+iWKZum55R/omZ0pxbxoah8z2r9HGmyTgXRmsXJbwSSbZXC/2v54qNuUJZEiHpcadGSVaT63Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5600

T24gMDkvMDgvMjAyMiAxNjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoZW4gcGFzc2VkIC0x
LCB0aGUgZnVuY3Rpb24gKHRha2luZyBhIHUxNikgd2lsbCBsb29rIGZvciBzZWdtZW50DQo+IDB4
ZmZmZiwgd2hpY2ggbWlnaHQgZXhpc3QuIElmIGl0IGV4aXN0cywgd2UgbWF5IGZpbmQgKHJldHVy
bikgdGhlIHdyb25nDQo+IGRldmljZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8g
ZGVjbGFyZSB0aGF0IGJvdGggZnVuY3Rpb25zIGNhbm5vdCBiZSBjYWxsZWQNCj4gd2l0aCAid2ls
ZGNhcmRzIiBhbnltb3JlLiBUaGUgbGFzdCBzdWNoIHVzZSB3ZW50IGF3YXkgd2l0aCBmNTkxNzU1
ODIzYTcNCj4gKCJJT01NVS9QQ0k6IGRvbid0IGxldCBkb21haW4gY2xlYW51cCBjb250aW51ZSB3
aGVuIGRldmljZSBkZS1hc3NpZ25tZW50DQo+IGZhaWxlZCIpIGFmYWljdC4NCg0KVGhlIHdheSB3
aWxkY2FyZHMgd2VyZSB1c2VkIGJlZm9yZSB3ZXJlIGFsd2F5cyBib2d1cyBJTU8uDQoNCkkgc3Vn
Z2VzdCB3ZSB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gcmVtb3ZlIHRoZSBhYmlsaXR5IHRvIHJl
LWludHJvZHVjZQ0KdGhhdCBhbnRpLXBhdHRlcm4uDQoNCj4gRWFjaCB0aW1lIEkgbG9vayBhdCB0
aGlzIHBhaXIgb2YgZnVuY3Rpb25zIEkgd29uZGVyIHdoeSB3ZSBoYXZlIHR3bw0KPiBjb3BpZXMg
b2YgYWxtb3N0IHRoZSBzYW1lIGNvZGUgKHdpdGggYSBjdXJpb3VzIGRpZmZlcmVuY2Ugb2Ygb25s
eSBvbmUNCj4gaGF2aW5nIEFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKSkuIEFueSBvcGluaW9ucyBv
biBkZWxldGluZyBlaXRoZXIgb25lLA0KPiBzdWJzdW1pbmcgaXRzIGZ1bmN0aW9uYWxpdHkgaW50
byB0aGUgb3RoZXIgb25lIGJ5IGFsbG93aW5nIHRoZSBkb21haW4NCj4gcG9pbnRlciB0byBiZSBO
VUxMIHRvIHNpZ25pZnkgImFueSI/DQoNCkknbSBpbiB0d28gbWluZHMgYWJvdXQgdGhpcy7CoCBC
ZWNhdXNlIHRoZXkgYXJlIHRoZSBzYW1lLCB0aGV5IG91Z2h0IHRvDQpiZSBkZWR1cGVkLg0KDQpF
eGNlcHQgdGhleSdyZSBib3RoIGluc2FuZSBhbmQgYm90aCB3YW50IGNoYW5naW5nIHRvIGEgbGVz
cyBzaWxseQ0KZGF0YXN0cnVjdHVyZSwgYXQgd2hpY2ggcG9pbnQgdGhleSB3aWxsIGJlIGRpZmZl
cmVudC4NCg0KSXQgaXMgYSB0b3RhbCB3YXN0ZSB0byBkbyBhbiBPKG4pIGxvb3Agb3ZlciBhbGwg
UENJIGRldmljZXMgaW4gdGhlDQpzeXN0ZW0gY2hlY2tpbmcgZm9yIGVxdWFsaXR5IHRvIHNpbmds
ZSBkZXZpY2UgKGFuZCBpbiB0aGUgZG9tYWluIGNhc2UsDQphc3NpZ25tZW50IHRvIHRoZSBkb21h
aW4pLsKgIFRoZSBkb21haW4gdmFyaWFudCBzaG91bGQgbG9vcCBvdmVyIHRoZSBwY2kNCmRldmlj
ZXMgaW4gdGhhdCBkb21haW4sIGJlY2F1c2UgaXQgaXMgZ3VhcmFudGVlZCB0byBiZSBhIHNob3J0
ZXIgbGlzdA0KdGhhbiBhbGwgZGV2aWNlcy4NCg0KVGhlIGdsb2JhbCBsb29rdXAgcHJvYmFibHkg
d2FudHMgdG8gaW52ZXN0aWdhdGUgYSBtb3JlIGVmZmljaWVudA0KZGF0YXN0cnVjdHVyZSBiZWNh
dXNlIEkgYmV0IHRoaXMgaXMgYSBob3RwYXRoLg0KDQp+QW5kcmV3DQo=

