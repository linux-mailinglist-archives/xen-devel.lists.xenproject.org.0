Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E66AACDC
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505499.779545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwZ-00015C-JT; Sat, 04 Mar 2023 22:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505499.779545; Sat, 04 Mar 2023 22:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwZ-0000sC-Dj; Sat, 04 Mar 2023 22:01:31 +0000
Received: by outflank-mailman (input) for mailman id 505499;
 Fri, 03 Mar 2023 00:53:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqmn=63=wdc.com=prvs=4197e97ac=wilfred.mallawa@srs-se1.protection.inumbo.net>)
 id 1pXtfd-0002dr-FJ
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 00:53:13 +0000
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4d76820-b95d-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 01:53:12 +0100 (CET)
Received: from mail-dm3nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.47])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 08:53:02 +0800
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BYAPR04MB4934.namprd04.prod.outlook.com (2603:10b6:a03:4f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 00:53:00 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:52:59 +0000
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
X-Inumbo-ID: c4d76820-b95d-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677804792; x=1709340792;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RdEnAj8UoXYRnVydHlqn5l7u5rhG827S1lOVlOavNO8=;
  b=Dh6ZKE5oaVGvAuouX+ZqMiGUCHF/LnU53WP6dQzkjiwKDH8SXJzLQFEB
   foS7HEszXEaOUsg9vxwFd8BUpkSwRzg1aJHesOB/M/peReE8TDRmN6WcR
   L3apZyBEOliZdqvAsmUz2vXOD4IOc9Z2UKn+KCCvuMsccBs2EsB3QZ9ef
   endFBA/tu9S3tbjT1MOdqisXCuHBfjmDSJMqddExwk33N8BzmGZgQY5lY
   mEUFo4z4CMnLzqhdZRn86GHWmQVOZjQriC5mX9RmqvnoJ4tlje947MLKQ
   yZQw+0ggNxe+HAN39+ttxDDolgYULYZbqPlhN/QFK5dQTK2mdA6+nM12j
   g==;
X-IronPort-AV: E=Sophos;i="5.98,229,1673884800"; 
   d="scan'208";a="224680772"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWdBM76EzF/+EQEhPxkOKZk2UdMRQ4zNrY6soxQrcNVVQ1lG+sY+52KgdGqaHatDUgf6FUjZgWD69QtqKTRqlAnLyRrnbi4718RgqEaE+oaOpOJDDuW8HSlxINQ8MW2KXO5X9xdL877ESW0WFTVOgq1lTND4ICBCOpe++Sg2VxehdTu89Eaj6439GfouOWbYdnsF4C3+yxeH4tfP0Xstu6wOzjUfKuvkfB7jYmDTHQQqAV8SRUDyah2WZJatJuBvnA8wMf3h9fYl/WNhzlGDA9oa+DfstjgQoEzIGgth735R/vXvDwGW/o2/6p8L2RPW3q/0J2n7rrbYa4C7EI7R4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdEnAj8UoXYRnVydHlqn5l7u5rhG827S1lOVlOavNO8=;
 b=Kk4/7ftZrZMTJ5sMjbLgHmtO/KC2rs/px2tNtzOBNdeRVgP1bW7Lw8qFr+NMzeqrlApec8nsG0cDCOp3ShOsF/JCIips0lV2XtIGrMRq9lVVRN+pkbuz+9OkiWVD6FMQmJf2BaAVhrnhpjkRcTrh2UuZTn44hM2Gst7io+ldu9cbO0A4XyVsq7prvcKmUcnEx+vCMHKkKSSubn9wnOEf3iE2ZcTZAj+yIp5aLkghhp87aU3B1+rpRVQj5BvocqISwQMensF9JS2YnXebm0e4YHZqphOk9ReFN/zMlFCMVBSK5S1q11Io2J95CiuPfUuV2FGc2vkYl4+IP9H62uaRdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdEnAj8UoXYRnVydHlqn5l7u5rhG827S1lOVlOavNO8=;
 b=ck2dNH+E1ikJWf3U/BTc14ITC13CBbnp4YvQ/O4zKHpDPAC0eoj5gpK3EzSRNHuamwmzKOv+9ClNnaFk8SO0+jZ80lA633HluZTLvx0DnZU1INftRNxPXv/j8UJ6XkS9D1yJcIX3EbE6rlR2OHGkQyFxxDLcb7wgaE/iwqKf5tk=
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "berrange@redhat.com" <berrange@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "armbru@redhat.com"
	<armbru@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>, "reinoud@netbsd.org"
	<reinoud@netbsd.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 2/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Thread-Topic: [PATCH v2 2/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Thread-Index: AQHZTSSkBgIBlH/SBE65azPCvJVeaK7oOrIA
Date: Fri, 3 Mar 2023 00:52:59 +0000
Message-ID: <6642cd48a3f64a682f3edb47de7b50f6136d6289.camel@wdc.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <20230302163106.465559-3-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-3-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BYAPR04MB4934:EE_
x-ms-office365-filtering-correlation-id: 20576cfa-e94f-437e-35e9-08db1b81a28c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MoCu28zNq6VdHsIRv2cPKf6o77Pg6IWAXAvimYsxsAvE4k9VBBV+glW1Cy/il1jhflqshGs8ut3AIkc4GQloNRoKQOMHFzQhdJGL9Pf5Jv1Vh/tV7DCdkcaeQAl4vOo1cbKlOccDLGqRcBSaGvOblH5IlhUT3mSIaSAkCrXiHNfrc7BNyg377WPavxQD/sjLCE2kBsqPiSKruE23vKEmvQZu1mcFcVd2E809BpNoncn+r/Bres82TgIFdpNlRwQ1fqGBuEhVEl88IWIv0J1hLkleZlmv8INpJXzp4JqKAmTYCNXxOArNdsJoSqyvkq0WUoCmzJiAFmooyaeJs/ncy99TFBdux922uhrf40fVRIcJK5zE6eAD4zmjcfviO+t3rk8qRf5ULT7SPm6lewlpWiDcYxZXkVakBYBjR4zNp4rWrzSGHgQBV9/jyB2iyVmANyYAy3gaqqtx2skkwl7JXOqBYHKWJfE1oc9KkOyuffxmi7q7tO80t/2zMu2OfECwh8vt1qGKRpW1/XcXtg7z+mUHaG932T0wD4AJd2TxYYaz+4JxFY4DFzJPPcj1RLER/h6bUw0oi0edCOjOd9SOUBrfWKwLvhH+FIC/3E2Isa1HIZ1NALiq5xV/2bTOL+m3SbWkgyn/GHgGUQb3Mx95RVyXy9d1OcgmX3my5t0y7/0SpvyPvrUaBC8pD2R1OqOujkCf5K21kwOiASAcJX7P+w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0963.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199018)(4326008)(86362001)(8936002)(36756003)(66946007)(41300700001)(66476007)(64756008)(7416002)(8676002)(66556008)(66446008)(2906002)(5660300002)(44832011)(82960400001)(38070700005)(122000001)(38100700002)(71200400001)(91956017)(478600001)(54906003)(6486002)(316002)(2616005)(76116006)(6512007)(110136005)(83380400001)(26005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkR2TFZOZ0xZV1VoeXB2U0RXaFpqSmJ3WEdUZ3RQL0IzcVU4RllrT0dzM3Mz?=
 =?utf-8?B?TWg4NENSMzBuUTdOY0ZzRmQrR3U4b3pscmRsRDRrdWplbkJFMDlLOHVHVWM5?=
 =?utf-8?B?dmhvS0ZXSUIyZis2eklQL3hRbnpTRFNLaUJDcGdYMThGT2dGd2E1Q3lvWEMv?=
 =?utf-8?B?WFFHQ25yT0s0ZlkrYTkya2NaUHRpb3ZWWWJab1NOVEtFUm9DTkJ4bnI3d1Zm?=
 =?utf-8?B?MWJOU2sxbWdZQ1RSdXd3aFpxM0QwUGRCN2JkTkNwUm5oNUpBRGFqblVWRllP?=
 =?utf-8?B?NUZJZStiUElRWHNrdFJDNWMreis0b3VsS1RSK1VHbjVlU004cUdNTExpTW4w?=
 =?utf-8?B?YUkvWXhKRGQ1dlBrSHZwMnVkSkxzV1Y0WVg1eUp5YlVDZlRramNTckRkR3p2?=
 =?utf-8?B?NmpnczlMMmpUdSs3NEhQNFdES1dWeVZoUDRPeGNOWjRSUGxld0lUQlRGUklF?=
 =?utf-8?B?cDAwRGxLcmtVQzV0bTNZTmVHTDl4RUVtS0FVNFNGYmZhcEV4aHAwSVczaHE3?=
 =?utf-8?B?d0FyajJPbENrckdDZTh2TU9iUXVreENvWGxUaGs1WEd4SmNNam9qNGV3YStk?=
 =?utf-8?B?U0MvTWw5bWwxUnZXVW40UXM2STlWclkrT1FJRklYTmdYVGlEcENmLzYrdE12?=
 =?utf-8?B?RnJsdGRlaXZ0cjVBRW5IcndGR2xUaGRTYitSVnkxMXMwcHBMK3dIZkxsMGlQ?=
 =?utf-8?B?QjVoU0plSHRLOFhyVDFTTjBBTGM0cjNPbUhhNjJ0MHUzVGJnMXB5bkNUSERk?=
 =?utf-8?B?M05kU3RtM1Y5NDJwa3hhU2dUR2dadXUvR2drblRXNDFpVkdQREdGbmNyVlZV?=
 =?utf-8?B?K0w4YTRFV2R4MmR5QVRHRSsvbWNVWUkyN2pEK0ZkdGpYUWlnVmJ5UUxSKzRl?=
 =?utf-8?B?QkdTVXYzRkxVUGhoTkRQQTVmTno3NUtobERxbVZXS0VEdW1kU3dFUXJmazla?=
 =?utf-8?B?dWJyVjBFSTMyOEUydHdIeGFrUzN0dm0yMHRiK1o3Ny91Nm9ET1BOdUN1bmNF?=
 =?utf-8?B?Vktzb05WMnhOS3pzWW8yRDZ0a3ZnMDJKR2U5Tm1VdDhqQWhWZUtORGtQL3JL?=
 =?utf-8?B?cDU2R3ZJcFlrQ3l5SXBUSzdPM1NLU080S216Vld0UnlCS1ZkWisxRldHekUz?=
 =?utf-8?B?RW0wUk1TVm5tWWRpVExmbGFZemZ0TlhWWFFxbTNRNisxMlhsdnA4am9yNGJ6?=
 =?utf-8?B?cFFxR0hOczY0cVJteHBTMDRvbUFkaXo1WHhpeHdOd3o2Y0duSU1jSEEzLzZk?=
 =?utf-8?B?QkJRd0VJT1duRFhVcU9mNkZma1g4TmkxQTd3dFJXRmdOTzA5ZUhJaHF2aFFr?=
 =?utf-8?B?b3FRWElPUXBHMnQ5a2dMRVZya2lPV2hTN3g4VzVkZzZSaUpkQ3RTalBOZFVJ?=
 =?utf-8?B?amk3OXFxWmFiUW9tTnY5a281blFtYVBUd3BHL29kVkJ0a0daN1BVTzYvU1l0?=
 =?utf-8?B?VEdhNk12ZUtvRTdCUGZaVGJheWlHbkRiaW9idTBvMHozeW85QjJyZytheDIy?=
 =?utf-8?B?ekhCK1VMNXNhelNJZlE4cGtKZG01VjB4ZHpMSmlNRDVoSTNDK09xQWJuRklV?=
 =?utf-8?B?dk1jR0ovUTB0UVdVbFhnQzBvWWJDTEd5cjB5MXVjbUR6aVk5QjRKUjJLbTFS?=
 =?utf-8?B?Vk8zOXd5UnM2WG9aa3ZianNsMW1USlYrdE1WVmM1RlBldnhvWlFiUnRwMm1Q?=
 =?utf-8?B?Tm1NalZCemIxL25JTlF4bEtMTk5JcDRsd3JUYzYvMmxSUUZzMTNuYm1pSUJt?=
 =?utf-8?B?dkR4ckdDQUhxZFRmT3oxMlQ3RmYzdWo4RTBMY2FrNTQxcmIxVXFUbUxUY01t?=
 =?utf-8?B?TVhlblpkMStGb3Q3UW9ycFFpKy9YRjdWUllseUFPVjFpRVFCRVdHbUVSclhi?=
 =?utf-8?B?L1Zsam0ySXg4ZnBid3lBWDBwL1lNb1k2dlVIZDVFaEg1U3VKSkVrUEhBaGt5?=
 =?utf-8?B?b0wxT20zcE5xWWNSMzA2MUFVSEVpS3NBY2FMcVU2d2EwOEdINW1qMC9vVzBI?=
 =?utf-8?B?cy81OS9iTzU4ZEVmTHNtTWZ2cVBaVW1rclB6WHZZK3RVYXMwRWtrMVJISllm?=
 =?utf-8?B?dVpBOTVoa1Y2UlNyTG1TUFh0YWI1WTdrcnhoSzBEMFBNVnlMbmlMZHp4azdp?=
 =?utf-8?B?MDZ3Ui8wSnMzN3FUbnJlMjIxTTlNc1F5RU51RVRhYTRTZjRhY3AwT3VxRU0w?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59D3A895B68CE44E8E6CDC239A25E20E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5xTvr0K4l9OGGlyognto9ZQ0d38oqMnjtkgTng/gghdrR6pZl8akZV+jNUrQqk9rvI1UDn8Dlc78I+SJnNa9YOEo//eQdSISJV1XQn4jtgAWGUcDHGYZHWNbw3+H17/GGT8iu+rIEBtYDmo8S0+68mlG70sjrPNtatDPtHggJhk9xlhT2M9nNS8wNKACNDQFIhREXxxjna0hX4r2ZN85+wBQLDwZKfogOvghVnpA7Uy6vnU4kXaQrGQoRrH4FhtOc5gJWs7Xd6drSgOGmC9ykpQW7in6owKs4KqmiaSSB8y9fK+E6THB2OMP/YBw8x9LnJ8lBxyIhcBT51sVK3Qv/oYcbqH3kNJNMO9vx0GtcHXQ49WjRk0VXN3MqF0asYwem83L+VA76c2OBf3XhpeIv4CqGfct5S4Nsn7H9zobzGqc9bun45W/DK//XmNmrngVcxKt8Xp9Y1tRVzre9cKC++ASIWfKTeEWjkAHs4EbkqkvcquUoO8hiYINvLUV0fDptlzJdOzE0LZcvIvYAUGFUihFVySyzlwu9/FbGPMoprK0QhqrZJe7rLZwI+iZzD3+8Qbr35lNKbb2mZibc0KqEkuxOotcHxH5aeEv3zDvACb3QWjJ2VfaCygXt0ji8cZz3q5wS5rvhb9jpzcjP4YqHdT8N2Jq2woku1MbLVPSOENS+DNGe8T2RHTf/hJOiJxNGopZIJAhlfNP6m+VR6NnsPpLNHAnGn7gx/WAuxbMAKyvrJXPRu7J2/wkLcVjVgPUQCjZIlNvtBZ3Iw6OFRiHMwlvclocppejw5uMTUgGEfKQetzE7zvY8J23W4UnX3XF5w8I55TqE97lM4fH3GZlzTqr56R9CxQ/sFqAUjyEzMsyONVWGhwx9VXXYxiz1QYDzJYvoyLRidxB4j45yLBoJkWUIuS59rhjN/ksR/zULGw=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20576cfa-e94f-437e-35e9-08db1b81a28c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:52:59.4261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6qj2mnRq9FFdHq2ji4twGVQ+sycXdp720qRxJy01Hp8plknPG7SXARcF0YJ5CmYhFoe0INM/lZoQsuPHmm/L5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4934

T24gVGh1LCAyMDIzLTAzLTAyIGF0IDE3OjMxICswMTAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
SGFyZGx5IGFueWJvZHkgc3RpbGwgdXNlcyAzMi1iaXQgeDg2IGhvc3RzIHRvZGF5LCBzbyB3ZSBz
aG91bGQgc3RhcnQNCj4gZGVwcmVjYXRpbmcgdGhlbSB0byBzdG9wIHdhc3Rpbmcgb3VyIHRpbWUg
YW5kIENJIG1pbnV0ZXMgaGVyZS4NCj4gRm9yIGV4YW1wbGUsIHRoZXJlIGFyZSBhbHNvIHN0aWxs
IHNvbWUgdW5yZXNvbHZlZCBwcm9ibGVtcyB3aXRoDQo+IHRoZXNlOg0KPiBXaGVuIGVtdWxhdGlu
ZyA2NC1iaXQgYmluYXJpZXMgaW4gdXNlciBtb2RlLCBUQ0cgZG9lcyBub3QgaG9ub3INCj4gYXRv
bWljaXR5DQo+IGZvciA2NC1iaXQgYWNjZXNzZXMsIHdoaWNoIGlzICJwZXJoYXBzIHdvcnNlIHRo
YW4gbm90IHdvcmtpbmcgYXQgYWxsIg0KPiAocXVvdGluZyBSaWNoYXJkKS4gTGV0J3Mgc2ltcGx5
IG1ha2UgaXQgY2xlYXIgdGhhdCBwZW9wbGUgc2hvdWxkIHVzZQ0KPiA2NC1iaXQgeDg2IGhvc3Rz
IG5vd2FkYXlzIGFuZCB3ZSBkbyBub3QgaW50ZW5kIHRvIGZpeC9tYWludGFpbiB0aGUNCj4gb2xk
DQo+IDMyLWJpdCBzdHVmZi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0aHV0
aEByZWRoYXQuY29tPg0KPiAtLS0NCj4gwqBkb2NzL2Fib3V0L2RlcHJlY2F0ZWQucnN0IHwgMTIg
KysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNClJldmll
d2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QgYi9kb2NzL2Fib3V0L2RlcHJl
Y2F0ZWQucnN0DQo+IGluZGV4IDExNzAwYWRhYzkuLmEzMGFhOGRmZGYgMTAwNjQ0DQo+IC0tLSBh
L2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QNCj4gKysrIGIvZG9jcy9hYm91dC9kZXByZWNhdGVk
LnJzdA0KPiBAQCAtMjA4LDYgKzIwOCwxOCBAQCBDSSBjb3ZlcmFnZSBzdXBwb3J0IG1heSBiaXRy
b3QgYXdheSBiZWZvcmUgdGhlDQo+IGRlcHJlY2F0aW9uIHByb2Nlc3MNCj4gwqBjb21wbGV0ZXMu
IFRoZSBsaXR0bGUgZW5kaWFuIHZhcmlhbnRzIG9mIE1JUFMgKGJvdGggMzIgYW5kIDY0IGJpdCkN
Cj4gYXJlDQo+IMKgc3RpbGwgYSBzdXBwb3J0ZWQgaG9zdCBhcmNoaXRlY3R1cmUuDQo+IMKgDQo+
ICszMi1iaXQgeDg2IGhvc3RzIChzaW5jZSA4LjApDQo+ICsnJycnJycnJycnJycnJycnJycnJycn
JycnJycnDQo+ICsNCj4gK1N1cHBvcnQgZm9yIDMyLWJpdCB4ODYgaG9zdCBkZXBsb3ltZW50cyBp
cyBpbmNyZWFzaW5nbHkgdW5jb21tb24gaW4NCj4gK21haW5zdHJlYW0gT1MgZGlzdHJpYnV0aW9u
cyBnaXZlbiB0aGUgd2lkZXNwcmVhZCBhdmFpbGFiaWxpdHkgb2YgNjQtDQo+IGJpdA0KPiAreDg2
IGhhcmR3YXJlLiBUaGUgUUVNVSBwcm9qZWN0IG5vIGxvbmdlciBjb25zaWRlcnMgMzItYml0IHg4
Ng0KPiBzdXBwb3J0DQo+ICt0byBiZSBhbiBlZmZlY3RpdmUgdXNlIG9mIGl0cyBsaW1pdGVkIHJl
c291cmNlcywgYW5kIHRodXMgaW50ZW5kcyB0bw0KPiArZGlzY29udGludWUgaXQuIFNpbmNlIGFs
bCByZWNlbnQgeDg2IGhhcmR3YXJlIGZyb20gdGhlIHBhc3QgPjEwDQo+IHllYXJzDQo+ICtpcyBj
YXBhYmxlIG9mIHRoZSA2NC1iaXQgeDg2IGV4dGVuc2lvbnMsIGEgY29ycmVzcG9uZGluZyA2NC1i
aXQgT1MNCj4gK3Nob3VsZCBiZSB1c2VkIGluc3RlYWQuDQo+ICsNCj4gKw0KPiDCoFFFTVUgQVBJ
IChRQVBJKSBldmVudHMNCj4gwqAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IMKgDQoNCg==

