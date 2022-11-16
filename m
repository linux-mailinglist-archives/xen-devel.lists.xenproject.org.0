Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9962B0BF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 02:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444123.698985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov7XY-0004YW-A0; Wed, 16 Nov 2022 01:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444123.698985; Wed, 16 Nov 2022 01:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov7XY-0004W4-6y; Wed, 16 Nov 2022 01:48:36 +0000
Received: by outflank-mailman (input) for mailman id 444123;
 Wed, 16 Nov 2022 01:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ov7XW-0004Vw-Et
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 01:48:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c602a7de-6550-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 02:48:32 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 20:48:24 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 01:48:17 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 01:48:17 +0000
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
X-Inumbo-ID: c602a7de-6550-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668563312;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z5mgmGSt1k6ofONfwu+a//Yc5uKeib2zz9aLXoaAEkA=;
  b=Q9mnzJ3KDXtyQM2hLdBhBHDreFPQh9SwL5PfROwdMRcFViCfxAc18tdi
   A42fSfq6IluJwTtbYHTswkRNGBnrDGLiWIWI9ywC8RfV89RUaQp0I8xKZ
   O3NA10BAvzB8gBm958J/d4E5q6y3dgELslmg5ScLarS1xDkBk+bjpeF47
   k=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 84491436
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2dCvaa9YSw5IqW8BDt3qDrUDLn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GccWzyCM/mIMWfwct1/OY23o0kFvsDcxoIwSFNrrSg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKkW5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklR5
 fU1Lj40RyuNqKHp5a2+Fdhni80seZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN5OReTkraACbFu79148DhJHTXCA/9KzrRWyQOAYd
 0wG9X97xUQ13AnxJjXnZDWju2KNtBMYX9tWEsU55RuLx66S5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSi/MjUPLHMTTT8JS00C+daLiKMZgw/LT91jOLWoldCzEjb1q
 xiVqAAuirNVitQEv4254FTGjjSEtpXPCAkv6W3/YGWh6Q9oYZ+/UKah41Pb8PVoIZ6QSx+Ku
 31ss8KT9vwUBJeB0imEWvwQHaqB7uyAdjbbhDZHP5Qn7SXrxHelcqhZ+jQ4L0BsWvvoYhfsa
 U7X/AlXtJlaOSLwabctOt3sTcM30aLnCNLpEOjOacZDaYRwcwnB+zxyYUmX3Cbml01EfbwDB
 Kp3uP2EVR4yYZmLBhLsLwvB+dfHHhwD+F4=
IronPort-HdrOrdr: A9a23:50n9YqudRdGCr5MuW++Cq8xL7skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84491436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/yE3yFyF3OhC988IJ6lLfl5uTEbPTV74+EBzdNaPoVRjMO5+LjOD08pV5k7y6FD9U2fvIxlLnU5gv8c5i31vpEETyeB+ZIs569MXy9LcjUTm84Ig7bWhiAguOyxnfGz5zDQY10X/Ihvoc/YIPLrSh5Lz1pbs6VYnYHSLe7ZiWf78ejaRAV0cvxazbUwYMmsgfcm4B5nluFaHLp0MLEYuC35wCla0HjdAYntn8oyPoCPijSmHhR6hlNqtbjG+DYQFAiwflHbWjmNU+Ouuurjblje+bIim1c/SrFfzvkZbEEKoik7VRIanlFB38ePcwnZ72W+9dI8H/539AK8n3VN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5mgmGSt1k6ofONfwu+a//Yc5uKeib2zz9aLXoaAEkA=;
 b=lmweX52P5NegXgdsLXBKMGs2VHt3jToh9HKsCqducfMS0yhOZcWuTPYFzXIUFHCmXH+Ytn6iqIJYhbIFuMJfJzGtTJgHRk03PTq0vQhCuylgHi4atr2wD4SWsT7Qi1cuCLTsVUfgWe714VZs1ka31BIvq0dOdkeSikehm7j23KyUIgE3Q2SXmSt7jVcI1tQOONu9hzlhH605UG/eIG/hYNK0MHupJ0210V5QnDzWnd4hnzLizOdHYNGhFncOgfJHQyq/u4BpER6nEU3SuruI6IqxNDrK9EmfxbSZZ+8qal7MKcvP7P5MzLCAUMKfrug1sz1Riu8QIUdWVG1yuDv8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5mgmGSt1k6ofONfwu+a//Yc5uKeib2zz9aLXoaAEkA=;
 b=Wrjx3I0z75bE7foiMgeuBCkq6EYF5HzM58XjfnlNjCdbRlNLKBKlxJ+IW56e7cDazbY2ynnIQquboHDF5lGCzlBlSCJURF1kb0uGw7mlA9OnA3DV9Z4xomWp4rair0KeCOyVRYNpIX8adlTp/5Hr/H/qhV86p0MSa6wXBFKj7so=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Topic: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Index: AQHY6SSlXP4isouqyE+BbtcNRl5Xnq5A5cGAgAAC9IA=
Date: Wed, 16 Nov 2022 01:48:17 +0000
Message-ID: <c0ba7b0f-d91f-74f2-be4a-3cb944392c95@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|CH0PR03MB5988:EE_
x-ms-office365-filtering-correlation-id: d63dbe5d-9a19-442a-ff4a-08dac774a22c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 U/5X/PNaKpSptF1t5ZxlVxj1oRHvIAe2JJ2B7YygxDUZGDlmh8qdLO02IL3Fg5khqtyLlqljSnDO9qMAOp2f0SBHQHYyvSP4xaF/azXBTXb40uhQT7tPkXf21KhKHXfLc0DNdLKhNksdDzbSxTpVsj4pgsUKHZT2dbyrg2Lbkz//VDKga0RixXe9e825YEW6xXGmUw5AXIThP+DRqlx/LO7FXiu4TKHT9a/UlVkJ2dFx+QcN3Uobe3m64fouXntD1OQMqOTVuHj6rR96etfFemprGJY+qhAY8f+vn9oF3QRk+9z0gOcr9m5h6E73qhoHI4wSyWx9FaWnAZog8sxE5sydAC7mRs3XR519zfIUlA4leSzYGMbEBGul6ksW3ghOUmNWjQBwDlfDWMMqMg+HqC5Pteuv1P0Bh7ufaXx5Yzvldk8WJte8WbUjY4gP+NpGzSLv5acUNJKWh0i8Zsh3p7lidI47rv4jX6de2h+L/0D/k3mYCfWnQd98k6beUMMGEXn7n/o0UN77Oe+WQHeZg7gbtnB8bwZt1EYELOThBzXSFeQsDT/IddzpUBIte4eNLQbZMnWMyuObRlyv5hvGl24UN24OX5njJ8lFsW1c/t4qMdTnCi+jnsDtIh5jGIDB0QQnxSu2CtPbYU0ZLnzpRLIrxDJHHleKWRNsJRxZu71+ZpWrx4KeKyC447gynUU3CEDBXlRN7KCJaqKNubK2u48AslV0621/XnVClipfRKki17dzSiph6hBG1+rX7ZsjiTSC5fGGsaizQqWCE+pFVHHzrlTfwS/NaIVcolfHrv8jn9AbNxMSYxRNEXE2msQuI82isGspYALWmMCGt0JaIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(71200400001)(478600001)(122000001)(6486002)(31686004)(107886003)(66899015)(54906003)(36756003)(4326008)(26005)(53546011)(316002)(6512007)(6916009)(186003)(64756008)(66476007)(66556008)(66946007)(2616005)(76116006)(8676002)(66446008)(91956017)(8936002)(41300700001)(38070700005)(38100700002)(82960400001)(5660300002)(31696002)(6506007)(83380400001)(86362001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUttNFpCSEozT0JHL0Rqd1llclBTZkV4TW1aV2o1T2NJRFliQk5rTjZxNzNU?=
 =?utf-8?B?RjZwMWVZcEhQTWJoRjV0ZnkrYjFTd0RTcWdVL3o5emtqMVVEbytTSDZRWGFT?=
 =?utf-8?B?bXlFTitkZ21SZXZuUlNXOHk0MDArVnVXK1V4TEhiek5FSEhZMlZiLy82UC9Q?=
 =?utf-8?B?Q3hqT1M1ZTZLYXZuOE9lTVhPY3ozalpIV3B2ZitLREczdSs3YmpWa3hhQXdZ?=
 =?utf-8?B?SVZuMllabjVLcVo3Z2l5WUVwaXVJMW8rdUJzQXdKLzFwaWxsT3VsREZZZWRh?=
 =?utf-8?B?V1BhcmlZNEl1dWhaeTFvU2pkMXBSWUtyNlovQVhmd3lvK3ZVcXY3c2ozaE9t?=
 =?utf-8?B?ZFg3TDl1SGJIQUZrWWJkenBoWmZha1VMMjlpQ0pTN1RzRnJaOHVRdGdwTjJR?=
 =?utf-8?B?eFVQVVBXVUdWYmVSdFc2WTl2K1ROZ0tHTWkvMVFJaGZaSE5Cdjg3bUFPL1ZC?=
 =?utf-8?B?WHdEdkhWYmNmVFVsUGxGc21IV2tHMDM3eU9iNWoyS3VNV0dCU2s0akkvemEx?=
 =?utf-8?B?VEpoREhVdFF6elY5cm4va3duMTNNUlNPUktFRFNqYnhjNmpaMUM2T0loSzR0?=
 =?utf-8?B?UnBVc2I2Q1lkVFNkMnduSDhSUWdQQ0N3SWdUWE9UdnhTeTY4b3NXYjJZckR1?=
 =?utf-8?B?R0p0S2ovMnFORnorbVhrQWFPN21OQm9JdGptNjZKbUdiNldybVJKZGQrNkFh?=
 =?utf-8?B?dzVIRWlBTkM4Q21MYlBtdkx0alBnS21RUEptQXJOeWFRV2xEeHhwS0dLUFph?=
 =?utf-8?B?N1BNeEZSR0k5OC82WFRGUjg2aWluZkxUUm5SQUcweTBrRTFjMHRURHMzckJa?=
 =?utf-8?B?UEVFbGNPYlBlYjZxc1ovVVRRem9EUHdVZG1iaCs5VENTd05UYkl2ejg5MGFr?=
 =?utf-8?B?a1UzT3ZkZm1EMG5YWklrWXZkM0hIU0RNcG9YcGRndk5IaUdSR01POE03NlhN?=
 =?utf-8?B?dS9vcktIaU1aQnIwYXVmWTU5NldxblhpTjhMQ2Z6ZXpWS05qTXNweWV4djdt?=
 =?utf-8?B?dEl1MmxTbHllSnJMM3psZ0lGUHBPSlZ6a0dPZmlPeWtEN2FqbUFCVSt3eHdV?=
 =?utf-8?B?S0hQVnYzK0U1b3ZWdWJBY3JRbDN3N2pGV1hZL0NhUFhUaFFjeDREbHp0dzg0?=
 =?utf-8?B?ZlhSQkZaa2R2UnhMKys4YUJFRlZaKzZhd1Fxalp6aHZPbEtuenorTGh6WU5M?=
 =?utf-8?B?ZUlXUXVUNVptbUZGVzhSSVNwU2VtWFowY2gvTTNjQXFlMjJEcm51OWw5dUph?=
 =?utf-8?B?MTVyQnhpZUpBS0NvczhycmtENzBDd0dsNkkveW1VU2lXd1Z6RjZaVDM4dkxC?=
 =?utf-8?B?UTZ4NGlnWEVHMGVpMFJFTGxtSW5QQUdJQlBhdkQyVmhrNFVnZnhCUXZLM28y?=
 =?utf-8?B?MmptZzZiM2dNSGtXN09tVVdJcGpabFo0cUMwZlR4aHFiTXFUVW5tZmpsUWcz?=
 =?utf-8?B?eG9MelNZK0taT3kxTHVueUc5cGZXa01YS3gyY0lqT0Y5OGVyTkM2NGhXODZv?=
 =?utf-8?B?ZEF2bDNCcmhHdTVPYkIyK2VsejVxM2ExQWFSUGI3cExHMzlxeGVMejhhVG51?=
 =?utf-8?B?RkV1VzdDdU90MzI3eGZ6NTlkblFOTzBPclRnVU9MOTJ5NXFrQmZ3M3V6SXdH?=
 =?utf-8?B?UTJwVnJMSzRZZVdOVzNQRXU0L0g4QVRWNUdzenVQYStvcjNrR0xkTGFRaUVT?=
 =?utf-8?B?VXBSdlR3Z0hyV0NQRFJWREhqOGhkWS84Nko2SFVXT05OUkpabFQyOE42dEtM?=
 =?utf-8?B?Z1NtbHlZWCsxRlZ1QjYwdFZkYytIcGY5RE1naTNuVWkxZk5tLzFVa2xiUDJQ?=
 =?utf-8?B?MmhCS21FdXhvd3N3SmlGbUJpNks2QjdqdWVkVUI0bS93dlBsZ05hNmlMZHlB?=
 =?utf-8?B?Q1NXdk1lcStNakh2SzNvZ3dsTDZXd29WRkE0M3Q4TmppcjFlTEVlUVB4cm0v?=
 =?utf-8?B?WVNWaldqNEhLNjJOeEk5cCtFWEY2cld4ZTEvNnhEclNlSnhRK2ZYTmxubDkx?=
 =?utf-8?B?SER0Q3FySmpNMXE5VWpaSGxLZnR0SFAxd3BycDNLVWFnZjdQOEdwNVVyUGR6?=
 =?utf-8?B?SldnRTBmcFBqSHJ0N3JPbldWT0twNFpnTjZSQWpGNUdDMXZiK1RzUWRKcTEz?=
 =?utf-8?Q?Rv4DGYhDDbI7qnQJp2DGF30uF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E8DC918A532FE41905C7100D6C44D1C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?eklnbkpFaXZOTlhLWXVhMkJxVU1LZjJJenBuZVlqV1lwNW5qdUEvUnFtcTkr?=
 =?utf-8?B?NCtVQ25KWldEWUFYTFBrK2trRFBINS9jRDdhMHdtK3lrNTBpSkYvS0dteTFo?=
 =?utf-8?B?cjgvNktieDEwSUJVOW1GRXcraHcwR0ROR2thbG8rNytzTWVjTERpVnJkcmlm?=
 =?utf-8?B?ZXVNUzhaV04yeHE4RmVleEdFMFpkM3d3Z1l0NUxzVXRlVzFUTFFqSEdKbmND?=
 =?utf-8?B?Y3lwSTBZeTRkK3pCVnJvMitMVE5BdEJEeU5HaHhnNEcwZldIdTdXZytCUWN5?=
 =?utf-8?B?YVkydFNPODR4QU1ENkhGdlZIc1M1Q0c3RVF2MExnRnllbDl0SmYyOElzZ1ZZ?=
 =?utf-8?B?NkgrUjJISERGckZ1M1NiZVFBYTVPS0xPR3FSV2JodFUxSnB0S3pjT3pyKzJi?=
 =?utf-8?B?WUM2bzRzZnRMYVphd3A0QnZPSlkySkczVHA1aVh4bXd0Q3pqTmlZRjh1Sk9u?=
 =?utf-8?B?UjBRN1RUaTdMaEZpYWZJa0xrc3YzWEJzbytiUys3OEFTN0ZVWmJyV1c4Y3pM?=
 =?utf-8?B?OGVJdWd0RTB2b0NLSUJuemZKOTZvS1diUGZuSDhyL1pBbGtRdGlEVktBeE9z?=
 =?utf-8?B?SmNzcjk2cmRtOUV6VnM5MW9kTllSNjFEbW02eTNTdHlLNU1Ed1k4VXdaMW5E?=
 =?utf-8?B?cEowQ1RpWkk1QTN0VTM1cUg2blBkN21iVEFGcWN1bkdVQ1ZQSWJVdFVTcVZN?=
 =?utf-8?B?bGlBZjcyZ3c5aW5HNmhuVGxFdzNiU285YWlSa0FJUHZwSVczd0JtYkx3Y3Fu?=
 =?utf-8?B?aFlOT0JFbW5QMTlYUXVDZTk5Z2xabzk3TEx0Q3ZCSDByNnpLL3lzWThtQWxi?=
 =?utf-8?B?b3FsVzFnNEdUajZGVjJzb3ZDeUZRSGVLWkxoT3BoZlQ5U1FERk52Mk94eHRY?=
 =?utf-8?B?bk4yb0x3VGRHanAveEpCMzdTc1prWks2OUFEU21kSXZEUjN1cWZDRzFDM24r?=
 =?utf-8?B?dGY3eWFuWUZpWUZkQ2FoSWJoMTM3OS8rSUp5ckh3RTQ1QVdoUmRWVGlodG1T?=
 =?utf-8?B?YWlXMXBybm1DOGVRbmpoKytoOXJtbjcxNDFZeGhCUmpyUDdOb3ZpUStzM2JK?=
 =?utf-8?B?b24zSVBnOWRUQWIzYldwS3VEdmVDMnk5NjgweDNSMlNpZmY2TVpHcGk2cVgz?=
 =?utf-8?B?UzJYbTlsR3hFakM1VUt6NDE0RWU5aklEdVhobzRVWUxaOHBlejlsQ2FMRDhp?=
 =?utf-8?B?MGt2UlUxYmRVcFlPSmY5WGJBeEJUSmtudW5tOTFkME9PQlA3ODhEaDVvMVZn?=
 =?utf-8?B?SnJNYXNHVDB4Tlh5TS9IQnhLdlBNZDhQNWVJVEpGQXhIcnlCUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63dbe5d-9a19-442a-ff4a-08dac774a22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 01:48:17.6713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbEgVPObb0EZGOK1ei2rZrOjjYuWaJ0SRB08ydMxq+KPKeGqT+mnxqi6pi7LfbzWcsoYDTYIPtO5SRap9EX/vIly49YL7s8zG/055jKgGeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988

T24gMTYvMTEvMjAyMiAwMTozNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBXZWQs
IDI2IE9jdCAyMDIyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gVGhpcyByZXZlcnRzIG1vc3Qg
b2YgY29tbWl0IGNmMmE2OGQyZmZiYzNjZTk1ZTAxNDQ5ZDQ2MTgwYmRkYjEwZDI0YTAsIGFuZCBi
aXRzDQo+PiBvZiBjYmVhNWExMTQ5Y2E3ZmQ0YjdjZGJmYTNlYzJlNGYxMDliNjAxZmY3Lg0KPj4N
Cj4+IEZpcnN0IG9mIGFsbCwgd2l0aCBBUk0gYm9ycm93aW5nIHg4NidzIGltcGxlbWVudGF0aW9u
LCB0aGUgbG9naWMgdG8gc2V0IHRoZQ0KPj4gcG9vbCBzaXplIHNob3VsZCBoYXZlIGJlZW4gY29t
bW9uLCBub3QgZHVwbGljYXRlZC4gIEludHJvZHVjZQ0KPj4gbGlieGxfX2RvbWFpbl9zZXRfcDJt
X3Bvb2xfc2l6ZSgpIGFzIGEgc2hhcmVkIGltcGxlbWVudGF0aW9uLCBhbmQgdXNlIGl0IGZyb20N
Cj4+IHRoZSBBUk0gYW5kIHg4NiBwYXRocy4gIEl0IGlzIGxlZnQgYXMgYW4gZXhlcmNpc2UgdG8g
dGhlIHJlYWRlciB0byBqdWRnZSBob3cNCj4+IGxpYnhsL3hsIGNhbiByZWFzb25hYmx5IGZ1bmN0
aW9uIHdpdGhvdXQgdGhlIGFiaWxpdHkgdG8gcXVlcnkgdGhlIHBvb2wgc2l6ZS4uLg0KPj4NCj4+
IFJlbW92ZSBBUk0ncyBwMm1fZG9tY3RsKCkgaW5mcmFzdHJ1Y3R1cmUgbm93IHRoZSBmdW5jdGlv
YW5saXR5IGhhcyBiZWVuDQo+PiByZXBsYWNlZCB3aXRoIGEgd29ya2luZyBhbmQgdW5pdCB0ZXN0
ZWQgaW50ZXJmYWNlLg0KPj4NCj4+IFRoaXMgaXMgcGFydCBvZiBYU0EtNDA5IC8gQ1ZFLTIwMjIt
MzM3NDcuDQo+IEdlbnVpbmUgcXVlc3Rpb246IEkgY2FuIHNlZSB0aGlzIHBhdGNoIHJlbW92ZXMg
dGhlIGltcGxlbWVudGF0aW9uIG9mDQo+IFhFTl9ET01DVExfU0hBRE9XX09QX1NFVF9BTExPQ0FU
SU9OIG9uIEFSTS4gSXQgYWxzbyBzd2l0Y2hlcyBsaWJ4bCAoYm90aA0KPiBBUk0gYW5kIHg4Nikg
dG8gdGhlIG5ldyBoeXBlcmNhbGwuDQo+DQo+IFdoeSBrZWVwIHRoZSBvbGQgaHlwZXJjYWxsIChY
RU5fRE9NQ1RMX3NoYWRvd19vcCBhbmQNCj4gWEVOX0RPTUNUTF9TSEFET1dfT1BfU0VUX0FMTE9D
QVRJT04pIGltcGxlbWVudGF0aW9uIG9uIHg4NiAobm90IG9uIEFSTSk/DQo+DQo+IElzIHRoYXQg
YmVjYXVzZSBpdCB3YXMgb25seSByZWNlbnRseSBpbXBsZW1lbnRlZD8gQW5kIG5vdCBhY3R1YWxs
eQ0KPiBwcmVzZW50IGluIGFueSBwYXN0IFhlbiByZWxlYXNlPw0KPg0KPiBJZiBzbywgcGxlYXNl
IGFkZCBhIG5vdGUgYWJvdXQgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEFsc28sIGlmIHRo
YXQNCj4gaXMgdGhlIGNhc2UsIEkgdGhpbmsgdGhpcyBwYXRjaCBzZXJpZXMgc2hvdWxkIGdvIGlu
IDQuMTcuIElmIGl0IGlzIHRvbw0KPiBsYXRlIHRvIGdldCBpdCBpbiBiZWZvcmUgdGhlIHJlbGVh
c2UsIHRoZW4gd2Ugc2hvdWxkIGJhY2twb3J0IGl0IHRvIDQuMTcNCj4gYXMgc29vbiBhcyBwb3Nz
aWJsZS4gVGhhdCdzIGJlY2F1c2UgaWRlYWxseSB3ZSB3YW50IHRvIGtlZXAgdGhlDQo+IGh5cGVy
Y2FsbCBpbnRlcmZhY2UgY2hhbmdlcyBkb3duIHRvIGEgbWluaW11bS4NCg0KT24gQVJNLCB0aGUg
aHlwZXJjYWxsIGhhcyBleGlzdGVkIGZvciBhIGxpdHRsZSBvdmVyIDQgd2Vla3MsIGFuZCBpc24n
dA0KaW4gYW55IHJlbGVhc2VkIHZlcnNpb24gb2YgWGVuICh5ZXQpLg0KDQpPbiB4ODYsIHRoZSBo
eXBlcmNhbGwgaGFzIGV4aXN0ZWQgZm9yIG1vcmUgdGhhbiBhIGRlY2FkZSwgYW5kIGhhcyBrbm93
bg0Kb3V0LW9mLXRyZWUgdXNlcnMuwqAgSXQgbmVlZHMgdG8gYmUgZGVwcmVjYXRlZCBwcm9wZXJs
eSwgd2hpY2ggaW4gdGhpcw0KY2FzZSBtZWFucyAicGhhc2VkIG91dCBpbiB0aGUgNC4xOCBjeWNs
ZSBvbmNlIGtub3duIGNhbGxlcnMgaGF2ZSBiZWVuDQphZGFwdGVkIHRvIHRoZSBuZXcgaHlwZXJj
YWxsIi4NCg0KfkFuZHJldw0K

