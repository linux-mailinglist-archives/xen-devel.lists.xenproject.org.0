Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2A55755F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354577.581749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9M-0005XM-Sn; Thu, 23 Jun 2022 08:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354577.581749; Thu, 23 Jun 2022 08:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9M-0005Uw-PY; Thu, 23 Jun 2022 08:25:16 +0000
Received: by outflank-mailman (input) for mailman id 354577;
 Thu, 23 Jun 2022 08:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9K-0005Uq-MO
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fecc906a-f2cd-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:25:11 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:07 +0000
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
X-Inumbo-ID: fecc906a-f2cd-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972711;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IELzLEEcLQqTiUa/SGuozgRncB3NPp4bYarUlY1m4ko=;
  b=hiQFhmnP5gpWGy+3B2/9YVKNc+9EDFi+zLjIanvcbesdjSpCDWpoLa3n
   jm7RtQIczMNRH5zdfZBKjt1W5yVUR0M/4BzR/fS9+mL/mw8SWOAC7vpvV
   mDYN3C8jKKo9IldIEZsNe4vqrvA+H2X9QdHcxZz5yuvvZaxy8IBiPZ/vV
   E=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 74660987
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2Q9qqavYT/a7t/zlgeh5J2+PWOfnVEpfMUV32f8akzHdYApBsoF/q
 tZmKW3UOPeNa2fwfdolYdu2oxkBsJXUy981SQJkrywyES8X+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW13X4
 4uuyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8vNbLMvb05UyBIAn1PBKJd8qLaKCmW5Jn7I03uKxMAwt1IJWRvZ8g037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IJmm5v26iiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3J+/RvsjiMpOB3+Km1K8DecNCKftR6l2+Fp
 lCdpmnbHjhPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUS6hyJy6fSyxaUAC4DVDEpQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU331y1uPhTa7OCxQIWpcYyYBFFEB+4O6/9x1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:hVXLM6yeinh6Jb5fL3XUKrPxyuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4fSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHftLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+Ql0IRfLKqdHnnI/vJUduPW9v1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVk0XT85NVst38zcYrPr37tuElbhHXziq4boVoXLOP+BgzveGU8V4v1O
 LBph8xVv4DmU/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqV12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pVVFZol/1RwKppKuZPIMqjg7pXUd
 WGTfusr8q+SGnqI0ww5QJUsZyRtndaJGb0fqFNgL3X79FspgEH86Ip/r1iop4+zuNCd3A93Z
 WjDk1JrsA6ciZEV9MIOA8+KfHHe1DlcFbrDF+4B2jBOeUuB0/twqSHkIndotvaMKA18A==
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74660987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvE3DmcvBDlDk9MuabAx6sH76/26KnK2IUspBj7orUosy1SzrSl189Va8febC/IeQ1QZyRjMAnH5WZyG4JBvLHBYbJK1mPswkfJV0I9kglDRTF1xMFm+jtXQW4vDtPPi+zAZFVBrl0OH065Zdwln7r7HEuCqAJ3I5tIkmaTSbqtlS/UFmDJ+8l+ThmAILis/AheiJlOPTmOUUpmr3jYKKl4pPgH5Ve/pXopz7tArWyP8OWAldyAT3dDqFa6q4oKMoTsQCcg26fObgwMMuZQijJ5KV4QoRGuQ7dQmxh6iZmHz308ez800TGTdCX7hBf1RF95MAIheQ+vnYN8TLL9DxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34i3CXDk1TptQVT7grwKaTQ6s2KDkyL3tOrtsxFaFFw=;
 b=Mq62sujjvkZRNahYthFbP9vJzHSOGvN1tKPGIgKqg4fcW34SzBwAOvIr3Szdo8oOtxDE6O6DU5aIM7hZji2s+y+sxvAq0CKiyBDvvk4rDQk0kBCT6CJ2FAjtA3f2A0xYOYASr+X1CNNVJrW8A/wHfGJjdMQ2qRahR2dzBRDwmhonG5pRflAV2yqlg3kkeibs+g2Z4iSicf4QGN2LtIVxq8u41O+LjeZlShxnAqU9bQ6BYIabD1PiemzdCv57QRBGXcOMI5dJtyuAczXoX8zLjbwv+euPErK6IGorX+pQXNKq8QZAlVjiebv9e/WBknsupV97uPkPkpA11Ys8gp52Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34i3CXDk1TptQVT7grwKaTQ6s2KDkyL3tOrtsxFaFFw=;
 b=GR08wd7mV4EuXCa//wSGW/nPCgyLpLUSeHfAd4rqWbdI3mp6M9MFHK5OXmIFd2sxiMJ4NJ4MZD2fFvLZwv05+1zx0OxQnzmisOB0cyQX+Qa8FLmu2QV9abCi5i1o4aW5tGxQl6WycUxP1qSxiQeziTLj6U5ZPZn4aO/n9qgjTQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/6] x86/irq: switch x2APIC default destination mode
Date: Thu, 23 Jun 2022 10:24:22 +0200
Message-Id: <20220623082428.28038-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18bd3a84-fbba-42ab-c5e7-08da54f1e128
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5008308EDFEE8E9424D810928FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hlAvJu2liI56PiPhRK5SfZWomfv22P99aBjHTqPefT4qV6OQCySu6h6HS/BzVVxJ8FTXhuym47pPouBXc80lZFmVuiGSjQ6sblILrWHGsrGysA3JIneMHrCyyRh0mjdA3ehLmEbGNzG60FiGnVSVFJFZXc4kcTnb4ymAjFOZcYnWVci/i6pCDZxCQyE6dzpfJcPfXURvAdidG0tGTVgfzqoOlzUu8hX3Ep+ey50ZBU8kyvY7QDrPMWnOCQ9x9H6w6Oik68bPjs4m4pQhwZZjQa/JvqfsjXnuLRQ2bXoPrh22+G82qQbqA77J5LoRDVbD2hQ4J6CE3tzgGzie4vw0JxS8eMvaUZjvNiMxLcDfyhaVeI3mZ2iLpbQmq/zSje5WupQWYvdC+1MGnl/rMfNwoK/ggyu6BiS8/zLHq6v9J43cWZbF8X6AhsDJQsVhC9jWvGKOadZ66uy33r+AZj+Hc9oVqwfrRj209XMGSzeRJsPcqsI1pZCIeDDxG4EPr0fzXUnD1PTuO/k7QtsXGleu1/+mfZ8v0wKJ0eGrl6LV/V262FxzQEwuzp/Imd5v/pMDwKCSdpk6alCREWU0N+aaxqMT32T1oRg+1pd1HXUnnCWmJVx9GEgdY6MKSeQ0wnmfj40OlNTEorTfp1iwHVN3FS8mslaW5/hkgYzRkyRMSYVCIvb1lUPWyXyYJnz8a7mxE0rVJl7fxoSkBEidQAi1mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0FEeU0wYWU5ZHBNSUNOVjQ3WUJkWGtSQWV3L3BwMEpOd0dwaTFnTWxWY01o?=
 =?utf-8?B?SjBhTFZCWmJYMjBrQ2JOTDIwQjNHQmtyVkIyazZ2UVVaZmExLy81M2laWDg1?=
 =?utf-8?B?emdiZjBqTXB4UTVlQjJPTFZ0N3N5ODY5OXBFb2c4YmUzMXFwU0RPdlF1WFBo?=
 =?utf-8?B?SThFVlZRalNlQXN5K2dVaUdxVlBlM0c3T1pYODNLSUordndDV1lsQ0JBZWNl?=
 =?utf-8?B?OEJhU3cvMksyTHZEYkFZbE9uZUpzaVRyVDBiVklaUlN6VDdCdDc2bnpvRk96?=
 =?utf-8?B?T2tLVllyWlNpS0FRci93TkFISWtvbk1yeWkvdkoyWmNsUGZlRytRRnVheHZL?=
 =?utf-8?B?Q2NIQmlQMEY1UmNHT1VJRFV0T3NiRkpiZzZjMGhNYUtlU2dlSmRsZ29Mdkxw?=
 =?utf-8?B?ajdJak9Cc2pXaFpuWTBnZEdFSmI1RkhBaEhvTmJGdmNNYmhJeHFla1hTZU5T?=
 =?utf-8?B?QVFRazhRZlNxOUswOU1KSmxaVzJvTXRKM2ZBUVFoQnBBanNIa1NZQW1nUHJZ?=
 =?utf-8?B?ZnplRnExeGZuYm1wcCszVU8yMEZ5MmlrOXVNVlNzQklGblhjWDhreVpsMVdY?=
 =?utf-8?B?aCt5dk1LclBQaS9jWVlTbkVjeHpXNFNkeS9vOXpUUnVIUHFFMXZlSDgvd2pN?=
 =?utf-8?B?c21QUDlwbElmczR1aFo4b2Q1TGcxMjZDdWZodG1qK2xCa3ZzeEJ6QmozUmpr?=
 =?utf-8?B?OVBpL2RzSGdPeCtlSk9OKzc5bTJOWkt6Q3lOYytVQWt1dkcvTzN2UGl1Rlha?=
 =?utf-8?B?N05QRnY5ajlEeUVnTDZjMEFSUncxOTBLTmRYRk13MXNoU1BFSXVIUDkvTlNv?=
 =?utf-8?B?bkFaRXJJcW90dHVqTFRkdzlxNDZzZVZDTkxvZk52OWQzeWVDMEFVcGVvcHpG?=
 =?utf-8?B?ZmRIK2JjQ3RwOWl5V3V1MC9mQUNmK3R2WGtKcGtVdS9jOUJ5RmJ6WE03eTFn?=
 =?utf-8?B?azFuZlNaRE81T3hSS0RXbWVENmJTOXhsNWxrMkllTTgvdURkT25rQWN5OWNx?=
 =?utf-8?B?aHF6Q3duZ043OS9sdzNtMVlNcEtXWVJkVkdKZ3RPZ1V3SU5Da3Y5STlUV0tz?=
 =?utf-8?B?cXNYSGg5MXpNd1VYSGk3aEFsZGhpcmg2V0tvWXRlWERtT3JiejZoTVBEL2RR?=
 =?utf-8?B?Z1h4dWd6WGN1d3pnTGxCKzBEY0hHUi8rU1BCREFUQUtpSEJHZjIrK0VwWXMy?=
 =?utf-8?B?a0dGejdUbXZ0QkFFL3ZWdUs4SUhCT3N5U2c3MS9yTkQyMkJZcXR1UmJxT3ll?=
 =?utf-8?B?YjB0NXpzNnBpSkNFWmU4MXBWZlliT0lVbGJtM2JaQWZVc2xyUlowTXdGRURF?=
 =?utf-8?B?UndnZ2Y2ZHM5NjVRKzZZZHBoRE1qQlN3eGxvUzB1T3lnb000ZDRuc2MvUlZJ?=
 =?utf-8?B?WDRMQ0doOE9ENUNoK3kvYWFZS09JdmEyeVJ0aEFiZGNLdTQ3N1VtSW9nS3Bk?=
 =?utf-8?B?d1IyN2JQdnpJMmpOWkJOc1RRUThUclNlWmJXeHFUbGhVWHZyb3hsMlI1WXIy?=
 =?utf-8?B?aXRWRUI3OE5aWExZZUJPRk5BckJwYVc0VkhweUs5Q3lZampjRVFzY0tJVGVn?=
 =?utf-8?B?RlZoOFlLbTI5S0Q3Mi9RTTFhdWhoTTVlakh1V0lYZSt4MCtqODRPVnI1bTBz?=
 =?utf-8?B?MG5TZm5XRS81SzNNUVdmVWRucmlzQUZyM2t2MXZvQmNjNjRTbE4vS2FZeTlu?=
 =?utf-8?B?dVVPeUYrM3JoenNWV0R6MmJhbEpMM0lrVmdwanJWdFIyb0hja0NkYUpNSnlO?=
 =?utf-8?B?SVpjQTZGdWxPQ2hPWitwVC9sY0NaOUJOdXJtUHhTSC9Pc2crYm5iTXpaTUl6?=
 =?utf-8?B?UFljS3BVSENxQjE1WDRvYTFvcmFVZm9USHRqUldwVGhoblprTDNvdFh0UEE2?=
 =?utf-8?B?UGZ2a0dFWnlKMUJQNG02d2FyQkRSZ3VHalFiU015SmVZM2dCaW9yM1dPaEZH?=
 =?utf-8?B?cXJKRGIxY0lFRU1CMmZlTC8xemlWQWdBU0ZGZExVMFhDSmlZSEl5NFduUUJ6?=
 =?utf-8?B?MnEzNnpOVlU0NVJzZFd2bjZoSlpKdUNicE01S1JzWGxJbWxkTFhvSXlKb0E2?=
 =?utf-8?B?Zm5aTVRuNXhKYWUrcUhqeWJ1b3ZWM1BNUEFTVGI2eTgzMndZeHorZjVlRlEz?=
 =?utf-8?Q?/E0FxL7NbTUA5w9ugkPiEpRaa?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bd3a84-fbba-42ab-c5e7-08da54f1e128
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:06.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cp/tKhkMCM07vJGFSPR0m5qKnJzSu9ywzbipnVae1oOyaZr/aCV4hmsXl4s67HI1dFktJA9EVoZp9o51sPj8Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

Hello,

The following series aims to change the default x2APIC Destination mode
from Logical to Physical.  This is done in order to cope with boxes that
don't have a huge amount of CPUs, but do have a non trivial amount of
PCI devices using MSI(-X).

The default x2APIC destination mode can now be set from Kconfig, and
will default to phys in order to reliable boot on all boxes.

Further patches are a bit of cleanup related to the interrupt limits
reported at boot, and making those values more realistic.

Thanks, Roger.

Roger Pau Monne (6):
  x86/Kconfig: add selection of default x2APIC destination mode
  x86/x2apic: use physical destination mode by default
  x86/setup: init nr_irqs after having detected x2APIC support
  x86/irq: fix setting irq limits
  x86/irq: print nr_irqs as limit on the number of MSI(-X) interrupts
  x86/irq: do not set nr_irqs based on nr_irqs_gsi in APIC mode

 docs/misc/xen-command-line.pandoc |  5 ++---
 xen/arch/x86/Kconfig              | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/genapic/x2apic.c     |  6 ++++--
 xen/arch/x86/include/asm/apic.h   |  2 ++
 xen/arch/x86/io_apic.c            | 10 ----------
 xen/arch/x86/irq.c                | 15 +++++++++++++++
 xen/arch/x86/mpparse.c            |  5 +++++
 7 files changed, 57 insertions(+), 15 deletions(-)

-- 
2.36.1


