Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDD77E890
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 20:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584845.915700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWL6B-0000GV-E5; Wed, 16 Aug 2023 18:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584845.915700; Wed, 16 Aug 2023 18:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWL6B-0000EH-AW; Wed, 16 Aug 2023 18:18:27 +0000
Received: by outflank-mailman (input) for mailman id 584845;
 Wed, 16 Aug 2023 18:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzLC=EB=citrix.com=prvs=585ac1913=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWL69-0000EA-NB
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 18:18:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 482058db-3c61-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 20:18:23 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2023 14:18:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 18:18:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 18:18:13 +0000
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
X-Inumbo-ID: 482058db-3c61-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692209903;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1I/oa+HA8alMNa5YamCPESHe8lAmuHeV1fV6o41DL1c=;
  b=F6jPcelPMwnVkLF68L09x2Qbozygl/mjfnNtApVFwPIq4rLb/wh57V8W
   tPZlrzqTCkc+Mfa6JhN+xyo5poKto+xistDuZCS80gn4NBc+G9qm71q2o
   +uqaYl0BxtauYS4qBWMj3FduhuCFwgUg3VT/O7ddGxQrbS41hVCf+m7Vk
   w=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 119561169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J99lgaOjaGmPIGDvrR2SlsFynXyQoLVcMsEvi/4bfWQNrUol0mAHz
 GVKD2vSOvrYMzf2fYt/Pork80IPvMXcmtc2HAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t5xICJS0
 KIyEgAIRzbfnd2O2pupQMA506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCIpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHKmBttLSuzQGvhCv1/Q734YGBovagGnpsOCgBfgY8J4N
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWWRGyc8PGIrDq0ESkTMWIGIyQDSGM4D8LLpYgyilfDS4hlGavs1tntQ2iom
 HaNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:SK2MWKA3fiof5LHlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-Talos-CUID: =?us-ascii?q?9a23=3AxJaIcmld0o3yQ7m/OK6rDb6PoHHXOUXb7TTMBhG?=
 =?us-ascii?q?SM1ZsYZvJU2Co4op2meM7zg=3D=3D?=
X-Talos-MUID: 9a23:PwtF/QobChhjlshMVYsezw5gd+566LSpMX9XjZI8gMPdaxRgHCjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,177,1684814400"; 
   d="scan'208";a="119561169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9xhnjlzjIjz0rao6r8/uG6bZy4T2qiMbPJkWjNYQtcRoBXpZCdIhnkbg4+a2CuVSAVoU+Lh9vH9KgpJ9TAbjalEdWtPd8YM490ArejBni3x1JGt/rsMX7AViLHX7YhPyvnWYcmkamm5BLDSrjHBHTKP6+knNABdByHfcznZ2IgZCXGEomfsPM1IJeVVilkOrwD65MaaDpvyyQbe5z1ZqerC6uq0mcDV/KYB0ht1eH1pDQKXcDXrGTKbtCV7MS/V8vOnzCNFlwylMjLjQIFCeyFpuM5bmYvzIN8EyX/S64XHFBO2tHzN9ogi4obTZngF++m3vGns94EgIME62McSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FS2bbKXyDp42lV0RI7bXU1c7JdM1KgxAv1nTGVl/wU=;
 b=ei88w6AT21xw3gKqm3viRG1DWVfljqk7D/j0EXLPl6NLofVkj+XUB538WlRmzNOm+QmEJXclkcekOphYmEHVnQ8KMEWMo+Kou8YFb6WucE2t8peciM096eiMpXDHM4jg2uAtZzww8QkP9gpUBGnymvuD8g/LxkNES/rIHRQvMnSWqoF7WInTAsYhxZ2yARaZnVYRWOoOY8vwXm5wtfIvXadvdE5p7AcxEAZ9H5kBahC+vNMBJ6Q0UoF+ZY7ihpYhMwqHKf1HKw4SV0zea/ul2uu69gtMEVyA8ydHfZl6kZjIRW+MDVzJgFUPQtw3J4C9bYxMiInnIZX4U3CY+XBsLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FS2bbKXyDp42lV0RI7bXU1c7JdM1KgxAv1nTGVl/wU=;
 b=dHsErc+UvNzyg38gEC9yWqgD7Fo1ig37K9UVY71o5JUpmT2OnDmHMkZEbMeQMDZRiQuyCa93cauX1qVTKvzkKgF/JVqmPFPtdZZ34P+O5A4mtK8YJxdhDEbsw+Hti0ihBqJk68SRnYYOosd1nQolHhslKecLPMDTSE1tf5UjJPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <95e791a5-104c-b966-b430-2de6079231be@citrix.com>
Date: Wed, 16 Aug 2023 19:18:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Content-Language: en-GB
In-Reply-To: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c7ce51-ec92-4b8d-71b3-08db9e852767
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FANcIx745PyUbguleozTgTPVsvJa/kCOUVo0Nc2qMMgp/sw1tK1hBQDb7VwTeJWW8sWSykUlgWNR/DlrEgL0Pmzgyg5GJBQn4U5xNTAj4L/gBURFhztxdvAicrAjUQ7Vnm/hgmCRipPK7fGP4HRKjcfYGlQyAovyG4x/p9dw50v6vy5zXHTKhNDn07lOX2VaCLcJn0uCy4Rt2FUNXKLQXgUBKAWtfJVHd0Qs49MmDpjiMVW76G1kyVKOoKiw3PCeSESCxgh8BQJbvv0y6z5N9C3DrieMiRM4Vhv5enZViJBUBktaAKOimt9sOE8OVvyfRAAs3u7ywRt/urePLV5ZVswR9tLpwg+cHD5YkQBGPrE11oEkYrdzYCp43EsPMz/KiK8mTU8W/+o+v0ttZshhIsrG6kb3b+vfAgs2NMdJQX4CIxgJxLNQSQ8M4Nq4mhjmHhncAIfTcvXDBI42RiskuBMaYgV50JV7/Ob1HB14DB159z8XTlgSe5HNNa3tFdagJr27PR7LuEx/5TL71uxHE35DiQ8pEn+ytvijBLkhnNQqmZ5b7iFIhZcrg7lwsuGi5fxZTjxE/kttiGrxVch7uixDEZZwjduKLTUB+rLWDS4XjvqP2gjhk1CCYHdFNKYnK/m7TuSBdmJUkD+AemY6Ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199024)(1800799009)(186009)(316002)(54906003)(66946007)(110136005)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(82960400001)(2906002)(4744005)(83380400001)(26005)(478600001)(86362001)(6512007)(53546011)(31696002)(107886003)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmxiS29BdTRtK2VOa1BwYXk2cXJhd2o4SGRCK3hhOW9aMVpBUVF3UHZsWHha?=
 =?utf-8?B?N2VrRStvdUI0M1UxaTlEdE51c1NENmF4aW11SFVaa0xzQWJNa3lNTVRJS0pM?=
 =?utf-8?B?TGpSVWc2RVhScC9iblFwQmdjQkRUTFBhUytKQWpXZHpFdXBCV0tkQkdHcGc2?=
 =?utf-8?B?NHZIUjhmdERmUm9uUWdNR1NXWDEyRjVtNTRza2YwVFhaVWpEY2VTM2JWWnNv?=
 =?utf-8?B?c0ZKOU1oaGZvako3TDdTODc3V2ttaGx3NXNzUEV3TFdIT2N1MkdkZnRBM2NH?=
 =?utf-8?B?M0VRTG1GQjd5dG01Q2JYcEpYbVlGSnRkWU5vdDBXT0tDWFIyanJJcG0rcHEx?=
 =?utf-8?B?bGRqZXpzOW9DUmN6U3JkZCtIMFVFOXlFNnYzZGJXci9uVzlpWUhkd0FFNmh0?=
 =?utf-8?B?dkQ0Q1ozVktKMittOHhSOWQvZWhhTHQ5bmk2VzlFZjNLVFNuRzROMGFiU1Jq?=
 =?utf-8?B?TXVnb3dqRTBHWkp0bTc4YkdLS05nenNFZlBkSEU0S25pZFJZM3Jkazh0b0R1?=
 =?utf-8?B?ZEhYK0JzengzYzFVVDZ2MmMvUzZCZkE0TVVEU0cyVzN3SjVHNjdocTRGYmZ2?=
 =?utf-8?B?ZFpmc1BTcXMzS0dWQkkxakdhOENadnZEdmp4MW11dEhRMFlIWXg3Smo3WU43?=
 =?utf-8?B?YzQzY0E4OFNEYzVTV0JleXYyUEJGMTZ3MGdzSkExOWxqOVZIV1c0YWhxVUpj?=
 =?utf-8?B?eHdWQWFmeUhPejkxdWVQcnlENncvMlA4dW9XQVR3S1BDRUxDVUZvYzVCTXVK?=
 =?utf-8?B?eTZIOTc2UElIa21UaEVWa2IrcGVTVzFKUUNxdUhRMkQvZW1FTWhSd1QzdDJv?=
 =?utf-8?B?d3k3OFpCVythb0w4UHp3TytBTFhacjJ1Rkg1Z2gzUDd1N1g2OGZ1dVJCaDRK?=
 =?utf-8?B?ci9GWkU4cVF2WkNGbEhKaDErbjhNZDUxY0VtdCt4SnF1em9SWmw1TXR3S05V?=
 =?utf-8?B?NlF1NTdJZk9zUGxEMHBJMk1jS2dFVVlvc3o1d0ZZaU0zZmdNSzdDYWZpTjlB?=
 =?utf-8?B?VFhGM1UyL0RDeXF5dUs5bXJYZEh2WkZzUlh6Y0haRDJvNCs0N2xDa2RwTit6?=
 =?utf-8?B?b3NOTWlSaVFHb2FmME5VaWIyRzFxbTB1aXNwOC9uZHVST0Y5SkE4YjJyTFkz?=
 =?utf-8?B?cmhMN1JFVmtoSm51TVBSTThsTWprOFFKdjF6M2x1Um4rNm1MTUF5SStSTngz?=
 =?utf-8?B?ZHZ5eFBmTW1zMWtBUVo1aE1GVm12V2NiV093VWlNbmkyZ1NPM1FJajV5VExH?=
 =?utf-8?B?aStXQlJWcXNORTRrNzYzaVpEdjBDRmZTOWtRejVaZkRyZjFrTE1SSWxxV1Br?=
 =?utf-8?B?VlU0emgyWElpc0F0MXZ4bkFrZEIyTXFoRDl2bTcrdnU4UUpuME1NeTI4OURY?=
 =?utf-8?B?a3o5MHZ6ZDdTRG14RnRKdWtWVVg1bFB0d1cxS3VDVEFvb1FPTTR6TlBsZDBZ?=
 =?utf-8?B?L09kMnVFVGF4Z3FTU0I3aGYxdFRtYnIwVDBFSitWRzgwK3BxeUpJRlVjSis1?=
 =?utf-8?B?aEZ5bWoxa2NTNnFUUWRiZUdVYlIxQW1HVFQyWUkwVDkxN2tzMlBhYzFpaUpE?=
 =?utf-8?B?eVU0bENrbmtDYjF3eGM5SWxrYkREZFpXT2laeEVhSlk5ZjZLOUMveXo4eGRz?=
 =?utf-8?B?Yzl1NUZIdHBaQXhZbFBzekZrREt6MGUxNWEwbXB4Z3k1QVlRME5UVTBPSllx?=
 =?utf-8?B?cVNzUnlBSTM3SDFJZFF0by9iZloyL0FXVVd3L0V1VUtpMGRHTEhpZER5U2s0?=
 =?utf-8?B?Qyt5RnlXd2xDa3d0bHpiMkU5VEtXSVF5Q0RNMmVaTTBTeWtNbHh3Q2JMY2NI?=
 =?utf-8?B?d0VrbGR4Y2E5RG5paysvc2prdjZDdUFNYWRWV1hhMnRiUTMwL0ZQOG9MZFpp?=
 =?utf-8?B?dTgxWFh6YkhqZ3RUdkcxMTRBREtMMEw3S1YwNjFTKzNsa2JqSTNtYUlhVFNZ?=
 =?utf-8?B?TlBRUjVzWjkyeUFtU0hOeGZOcEhobnFyWmNTUU9hVG82eFBmclJPWVlSUGFV?=
 =?utf-8?B?aDJxcEZGUU1QaFJwWUJvOE90N25kT2JTK20zK3FJZjNjYnJnbVVmWWJxVTh5?=
 =?utf-8?B?MzhVWlYreld4bWV5WlpURTNwVStuVmdLd2FpcHBERzdHR1F1TCtqRlQrTkpa?=
 =?utf-8?B?MzQ5QVpINmRVRUNvL0UxMkZZaTVQN243VEZPVW5aMzlTb3hlTU9VazZvT0s1?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cI+Njjf/3DE/+D6iKXbrsr2cd7ufr5Qc4mJQSlB9PJ6gloqdSi3v6I274l+M0S0SmYXJ3XrcVCZV4dzKQzWcU1Y4eM2HsaROlTZCvbd8luna6SU3Hlr7DBYVztEz9/xqdG+6srWA37y695ai2uguI8zxcgY0fN2u60Jl4L7P3Ao+NyYCbAMqT9MAjkkLaBAgFIo/9XvnjA5t5knoHfhEUp+CwYn7jB7yh+/sw7X0CGADlopIypBfPL7LWEKo4W+lCY5aPQ/e0/X7Iq84XNCvmU7IoDY6foIx155Qew9sQgDegduDvU/U36p0M5+m9HjnaOicZ3OLITUstU2DkbMLXY52EIkgLEAL+gwimOdBnukte5A8KoqGU0W5Tj/C5undKjWJKBjbNrFICFjSWwo4uI5lb5sBBgH6hXAR1xQaZYpXApMUee6x8Sjw1PzuyXLvva3MheP4mLpwyPIrXei5IYSaOZWfQ6/s4J/oCfdmcNPaKJB3PbF5U1E4VH2hhJJE3lVPH6z4EHq+4p9uMES90PeDFMShL7lFks9vspCGTVRhrfTHwGiU4tWcI6aPhqI1vDuXwwPT50vPYx79J5dPeuhIS2ggJ2Z4FujhEPWfBehV/VC4z3Y/dy3Myh2NXcTjeOqp0d2/mmD3IC21xkhj95cNqI7w0PJehTeWCPZNv2aaY5WNAgzL5B1lgqdqNLjUAsU0G3OkA8X2+A5WaawEX1ShWm5CB6DN2Jo4MUOHG1RlBlnT819VMQje1RnWDCP0O+xR3NVauakRcKieJ6blQh6Ol0IzEFvJaZKBsXYQ8W3G+bBj97uBKt0pMpJy+ecry04mo1FFwL82MLI5u+zDSA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c7ce51-ec92-4b8d-71b3-08db9e852767
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:18:13.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tozcg7BBMu4+h2LiNysPuq3HzRuFYNFo0cTKSAoXeGG+SEtx1c8e+8Ce/4EwFvzcvBW31LzoY4BrvcrO6UwaFp8HCI15fx6wlswkLUeCr+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6235

On 16/08/2023 10:51 am, Jan Beulich wrote:
> Old gcc won't cope with initializers involving unnamed struct/union
> fields.
>
> Fixes: 3e033172b025 ("x86/iommu: pass full IO-APIC RTE for remapping table update")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although

> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -432,8 +432,7 @@ unsigned int cf_check io_apic_read_remap
>  void cf_check io_apic_write_remap_rte(
>      unsigned int apic, unsigned int pin, uint64_t rte)
>  {
> -    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
> -    struct IO_xAPIC_route_entry old_rte = { };
> +    struct IO_xAPIC_route_entry old_rte = { }, new_rte;

Any chance we can make this = {} while at it?

~Andrew

