Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82178D677
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592981.925855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbM4G-0006rr-2A; Wed, 30 Aug 2023 14:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592981.925855; Wed, 30 Aug 2023 14:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbM4F-0006pE-VQ; Wed, 30 Aug 2023 14:21:11 +0000
Received: by outflank-mailman (input) for mailman id 592981;
 Wed, 30 Aug 2023 14:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbM4E-0006lJ-2J
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:21:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74654cf7-4740-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 16:21:06 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 10:20:59 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by PH0PR03MB6692.namprd03.prod.outlook.com (2603:10b6:510:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 14:20:57 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 14:20:57 +0000
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
X-Inumbo-ID: 74654cf7-4740-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693405266;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2YFZ/Em2ZtvFgLjrGwSDE4nGbOZACtp6i2zVJkSYWR8=;
  b=JpW80QDtcuzJm1iwfhgsg0wSsSHkfxd2RVOGjf0PaZZBSUDiK560WnUt
   K8OfCVWQeAtElcWnnjEbbPr1moCKXFRjPZhcn8qyNcCaUk8+TE/n8VlFK
   svWihByhdNBI5M+FKEQ4vfEH0Ru6Z2fcap7EchUCH7czy+FQ4z2BQ+bWu
   k=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 123834626
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6rP+HqkZUCZkATieTSUn+Mvo5gzDJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXDvQa62DajOke990aYy/pkxXuZfSx4NiTgI9/Cg2RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K6aVA8w5ARkPqgb5weGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 exAERsVdhOou7mdzJjgUMxgpfotK/C+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iee3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuboraI02gP7Kmo7AwA0ZXHjqPqFjUvvfshwM
 3ML1DQQhP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xBGkCST4Ha9Ugu4k1XxQl0
 1aIm5XiAjkHmKKRYWKQ8PGTtzzaESoIKykEbCwNTwoA6vHipp0+ilTESdMLOK24kNzzXy3xy
 jairS4iirFVhskOv42n/FXvkz+q4J/TQWYd+gzSV3mN8gB9aYiqdoGsr1Pc6J5oJYeCR1iFt
 VAOmtSS4e4DC52AjmqGR+BlNKmx5uyOOTnVi0NHFZg9+zmj9nivcJoW6zZ7TG95P8BBdTL3b
 Uv7vQJK+IQVLHasdbVwYY+6F4It16eIKDj+fvXdb94LaJ4hcgaCpXtqfRTJgDqrl1Uwm6YiP
 5vdadyrEXsRFaVgynyxWvsZ1rgogCs5wAs/WKzG8vhu6pLGDFb9dFvPGAHTBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:6ebYDaiM4qIsmgiX2yziIqfhXXBQX8d23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewKkyXcH2/h3AV7EZniahILIFvAZ0WKG+VHd8kLFh41gPM
 tbAs1D4ZjLfCNHZKXBkXeF+rQboOVvmZrA7Ym+854ud3ATV0gJ1XYHNu/xKDwTeOApP+teKH
 PR3Lskm9L2Ek5nEvhTS0N1F9Qq4Lbw5eDbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK7aY+/X
 PDmwnZ4Lzml/2g0BfT20La8pwTwbLau5d+Lf3JrvJQBiTniw6uaogkc7qevAotqOXqxEc2nM
 LKqxIAOd02z3/KZGm6rTbkxgGl+jcz7H3Jz0OenBLY0IHEbQN/L/AEqZNScxPf5UZllNZg0J
 hT12bck5ZMFxvPkAn0+tCNDnhR5wCJiEtntdRWo21UUIMYZrMUhYsD/HlNGJNFOC7h8ogoHM
 RnEcmZzvdLdlGxaWzfowBUsZeRd0V2Oi3DblkJu8ST3TQTtHdlz3EAzMhapXsE/IJVcegy28
 30doBT0J1eRM4faqxwQM0bR9GsN2DLSRXQdEqPPFXODsg8SjLwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3adM7gvGTAyGLHXQI/llltpEU4DHNf/W2XXpciFrryLgmYRQPiTjYY
 fxBHoMaMWTalcHGu5yrnnDstdpWD8jufYuy6UGsmK107P2w7LRx5zmmdboVczQ+GUfKyrCK0
 pGegTPD+N9yW3uckPEoXHqKgbQkwrEjN1NLJQ=
X-Talos-CUID: 9a23:qoIH52+r33HFVVm6XbOVv15MI+s9an728Cz7L2XjE0Nla4ObTmbFrQ==
X-Talos-MUID: 9a23:pxbTlAW5HJIp9cnq/DTxpgFIbM5r36OrWWUXvo05pOeaCwUlbg==
X-IronPort-AV: E=Sophos;i="6.02,213,1688443200"; 
   d="scan'208";a="123834626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKN2ww5rrncrYoXi9eIu2kxRx7GeZwO3CBOp9fhgg6Xx0j8Ww93iLEHRWir37Yd0WYWy/lKx8mCclMFMz/8JFDERwzgs+s9plKggeP3drdYWk5oM3X78XwqERp439FJmcG8YtmOBEFKrps6qauGefsiVyjjPXoBMwtNZCHNoQrF9P51tw/Yb2PhqjOplbs/FxFo1vh+CZmxgruaYPItoghcE1kRxqfkw3nOOdxhptpQVvo8DDmcdueAVJfdSI/kWfSXJHCtHYTMuMuiQ4JHQ/W2IcQiK/tB1VoNLz/mXMF4hk5EwaPbvm/xs+IR4tkFNdNiOvb97XxRMONYqhMDqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KtYR028JlnltH1yWQiALBKl0G18xL6aSSyGD9asr1A=;
 b=CHzEHCfLADxP0OQwyMy+f3/PTdttXS4zUAKvrTiZcK4CIKthwjP0HcjpKgauc2xVgkHyO0QnLEzxJJqBQGxlM6BYqwdOX3nF7GbskR4G3awN6nGVS7CJmRwGe98/mlo8KtBoBh4hkieT8wcKQTy+qMuJAXsCnUwWWogQ6768SNrqgBwBOBKV9PKWjvbzTLXVqEAI0dGUGbQIBz9uoSqUl1Wqcx1m2KX2DDqJFOpHr7N9x0YpXgWy5E2Spo/iIK9ms8jd01HKG+oVzkLkESFufbUfyF9s44jUguY/uW4rUboUJtihQVGSBdBCXfwVl9fjsR15pFtCQI32P93ZzXDSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KtYR028JlnltH1yWQiALBKl0G18xL6aSSyGD9asr1A=;
 b=cB0ekdIPZ0A8gRf6+6/ivJEQuru43tMMGHnrINY7WiodUzhfNoePgi+jmeZxOXge6OYduTQmjE2Z+cQbmeGgiDDb2pQmspnbf0ex5y5v+vu0nLqFnCLqtqVsN1vB/BCXTAoD6t3ZEBHA5gMXxlPEgDQm5/6FojN+UgKbs9nn1wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2e7acb20-04e1-e69f-eb66-07bd8f9d8b22@citrix.com>
Date: Wed, 30 Aug 2023 15:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/8] x86/emul: Add pending_dbg field to x86_event
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <e01c71ad-cbc8-11c1-ce51-58931021193d@gmail.com>
 <badc045a-c16b-659e-ab3a-37830d1cb3d4@suse.com>
In-Reply-To: <badc045a-c16b-659e-ab3a-37830d1cb3d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|PH0PR03MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 682aa571-2e93-4492-4044-08dba964538e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nzueZP/udUfyOuZm2UubDvxxw+z49Yefp+Bi4VmYsqSpIRQeWybJC1KnKJcc+k7byhCFkTdhj9rY3NkCVwI0P3EtfYwRe/gmWFAuT/oiRlaTtuenA3BL9/LxMgrkDQwmr6clnIbNUicKy81tKmRscpa3yDnfBKdJO+6ik4XiFX1ohrpDU4MumTOzbH8GgjNFyseLI5FCEqeIlxvrj2m9s/jiBnnd+nz35eHn7NLZumi/67H7iv5RpVa/tlNkjRzwSlALvWLXTH1v7euDff1DNXoRZJhV4xU1Axkz6ePFvO2bZYBY/0hEqAaTKZod3dkod77wDcXICCMxyWgAiG5VXxdBvjsSzH8MOR1ZWxTE0AGQWaijdtw7IOG/Wz+txxIKaFy+f2rwQQUvA4g3qdDuLpehledYg3Z4M0AoPN4oz/2oAY4yvkAw9SAgM5M3Uh2d/tEiR7Jzqj1nUmjD18L06xBY/LobfL6jnXnXVHruMUKK5to07pyYNliiJDyeH33JEpYSTdbTJsqHsCXOfLwNYWeQ2M4mWFsof9NwZG3BYh1Xr5w45j+bzT9+bOu8aMnidseYcOeXeZEQDRStr74ei5Y2PSGDc4Nbh6KzJ6ENu8pQ6G1VL84Y2AFrMfZKtYzW8qwB9reYdUlUtFn9lsm5qA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(31686004)(478600001)(110136005)(53546011)(6506007)(66556008)(66476007)(54906003)(6486002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(5660300002)(8676002)(26005)(36756003)(31696002)(2906002)(83380400001)(2616005)(86362001)(7416002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZwWnBQMEx1dGI5anNoOC9BcE05bE1PK3VGM09yYmNpeTk1TldnZkEreWVY?=
 =?utf-8?B?N3dSQmlXSkVEQ0ZJTXVNeTh5UUVBSG8wQmI4NlNIY3FPK1VVRTZ4d0k3R25M?=
 =?utf-8?B?SmIxUVN4WFV3WmtKcjE5N2JmQU9JYmZkclprUllWbER4UmxXQzBwQVdTU0dw?=
 =?utf-8?B?Y3FVbm1kYjdmaERLamVNZjhSTHFGNFlwckc4d09OWUZRYTRoWVlnaUxwd3hQ?=
 =?utf-8?B?S2w5THJ0bjVtUHNDWUZRdk1GT0taQ3dyU3ViQ0JQTHBMczVNTUp5ekw0TXlv?=
 =?utf-8?B?bSszN3FVbHJib2JZWGlhRDVBRmI1VXF0a25lY2FSU2twbGNQelRyY2xlelNz?=
 =?utf-8?B?TXlOdzJqQkpwYkplRG9LYm5oNVhTdnBLcHhiSlNlTnNOT1hCWVM4OENBMGRJ?=
 =?utf-8?B?Nml6WFpJWmptVWtKRk1Hak5Ta3BoNnBHMnlTOGJOMW84Q1dIN2txeUdvc3pl?=
 =?utf-8?B?L2ZMUFNTUmlhQXpYZVFaYWc4ZHBPbmZkOEpLdUtmbUlSaldoL3J1NWE2MnhE?=
 =?utf-8?B?RXc4VVk3N1cxT1RwbHdPWnNVcFJqTGEzaWtBeHlicm9FaVNodzlQNlNCaEpl?=
 =?utf-8?B?WSthVndiUU9GYUw2OG11cDg0Vms4UDk5OTU4MkdJaGY4VGt3UGpBY1BTNHNH?=
 =?utf-8?B?dTFtaHpnZ0VoUWV0eklOZEZHUHJqZjVsVWJHTk5SdE1KUzVmQkhuWmQ2RWJ5?=
 =?utf-8?B?QnNzRTRlWG82WVFqbDMySnRjelpjek02UFBpOEhOZEpJZjU5Yyszb05MNjZE?=
 =?utf-8?B?ODFtMHFyOWlIcWtnMUdva0NvMDRtS1FqQjY0bjF5UVQ5Y1RmdTZ6WXNzZTgx?=
 =?utf-8?B?UFJicWtSakt6a0ZBMlg3aE9EcE5BbGhPRFJKK003WExMRzdSVUZqUmhOUmZS?=
 =?utf-8?B?d1NMZXJiYUhCQXRpZVNGSnNoLzBuS04xbnYybExadnRvL2RXZG9US1ZkcEtp?=
 =?utf-8?B?M0JjbDI0SGhhOHArU0YwRXdJNVpJU1I2bjZQN0FxWTlmZ1ZtSXc5eDN0U09o?=
 =?utf-8?B?b3Z3N0wrTWtXZllMa290YkJzckRML0sxNmhjWFM4K3NpTytoNEJSemkrRnV5?=
 =?utf-8?B?VmVacXVNT3hPeml5Y2VGNjY4bVdRbVNLN2JGK2h4QWdMbm5GZlBRaVpWVEdT?=
 =?utf-8?B?VGN6L2xJSFZoblUxRGJoUHR2YUFxcmZVN0V4amMxb25QYUVFQmErYlowREI3?=
 =?utf-8?B?ci9EbkMwdnh6RkRjQklvcnlVd2ZHZExxYitsZ2xiTUczSjZndlhDdm1BZHQ0?=
 =?utf-8?B?SEpRejFYdTZqL3hHSzlHZmF4NEpPNmdUckZZcEpEanFSQTl5OU5oN0NKK0wy?=
 =?utf-8?B?eDhJUkdkMGN5b2ZHREZHWEoyWnY1ZHp6alVOVTMzOHZESytST3NWMlpkSzdW?=
 =?utf-8?B?QXVnTSs4clNyU3lUbnFBdG8wcGlDQzNVWGtXdEI4MzNNelZBeUFSenJxNk0w?=
 =?utf-8?B?djlTNTFxNmtBeWlncEFXZ3QyU2VQNFNWVVZLbXo3V2hwV0tlMnBHaGlQS1V6?=
 =?utf-8?B?WGtTWWk2OUxjaElkSU56Y2xKZll5ZFZtSEtCSHI3TzRNWXZoT1pkS0pzelJk?=
 =?utf-8?B?Yytjb1hMNGR0ZVhpeVpucitqNUtWQ3ZxVnh5QUxLMTQ5eW5jcGhPRXBONjBj?=
 =?utf-8?B?dTdNZll1MDQ0Tk8wYUk5cEhoVCtrK1MvZnhpdXZ4MHdNWlNhT2pzbVhPYUNJ?=
 =?utf-8?B?cUdGdzZ0TDRKeWhueWRDaVEvYUxpSklKMW9JZlFhd0ZIaWRiQ1RwcGNLYlZz?=
 =?utf-8?B?SytlSE5TTEVVaWg1clRjL3pXUDMvelhKbTlURmRFeG1wMVgxTy8wZzZYcFFE?=
 =?utf-8?B?T29Qb0hjM0lVODlXWUZ0SG1FbTBpL3pNVVB3bUZhbGcvQzVZUFpmVmNDZ0xS?=
 =?utf-8?B?aFpyRVZCUDJXVTFHMXBKZWxDbjJuVGkyUFoyUi9qNUJQYU9qdFhuRkpXMW8w?=
 =?utf-8?B?Um9uOU5udHJOUW5jaHkwM08vRXVqejBjWEJDV3MydlF1QW00RDlvVU5mNmRQ?=
 =?utf-8?B?TmJwMkM1NTd2ZXVvMFFhSmdxaHlxS3lTanZ0eTVWSk9oRGhOYTZrVko5aFF2?=
 =?utf-8?B?Mjl3OXhFRGRaeW1ucVUwUnRmS3NUekkrRnJWcVkwT3NlaXcrdGRSeEFoZmRI?=
 =?utf-8?B?OVFvbXd0dXJBbFROQ3Z0T1FQNHZORW9LZGk4aEFXTjNtbHJXWnZDNFhLN1By?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?WVNiZERqMEVZOG96N1BUSjRLZFpDMWl2blNJYk10bFNRaFgyNnV5UUlNUTNr?=
 =?utf-8?B?M1F3U0FzTG5xRVdQekpJL09XNGdVeFdrd3IxSzZiVThnc3NaUTBMZTNwcmlu?=
 =?utf-8?B?OWE3TDdmYUUrbFd0YmkrYnBlK2RPRlArbC85a3V6Ym1laUVGc3dmU2M4eko2?=
 =?utf-8?B?NThIVnJPVkFpK1VUZGVmamNpWWQ3ZGJjcURkTzQ1Z3R4S3Y4SFNFZERURDRW?=
 =?utf-8?B?cGdwRGMvVlVHcEk4bVVZR2FkcGxxbndieVlqUnRndnNlTWMxZFVUQlAyTXoz?=
 =?utf-8?B?bVRtVjV6ajFhU084enRMRTExRFM0c0ZzVDlQNGkydXhSbUpzQUtXQmtZN0NZ?=
 =?utf-8?B?alE1RUVlTkdmVkJSdmEvb0dJUVkwSURlTDkwQWt2RERCOGZkUndGM1RmVU92?=
 =?utf-8?B?VzdGVDNVRHJydHZaR2xpakJuanFqSmNKbjRLSkZrdWNsYWk0MTVmeWJFd0xF?=
 =?utf-8?B?ZmNGQS83RzhxUzZEVFNNMUFIWUxaUVk4L013M1Vkak9iT1JsU3NndXRwSjUr?=
 =?utf-8?B?RFh5ZjJlVE5JTVZtZ3d0VDRqUEVOQndVSlk0YzlkWDlVNlQrM0F2NFpaaCtC?=
 =?utf-8?B?MjNpMWs1a1g2c25ucGpKWk9QcUhWT3RTeitoQzkyYUFpVEg1MTRmd3VJRzc0?=
 =?utf-8?B?aDlzeWVKY0wyYnNHS1NSbjNqRHV1VjU4eWh5N3pLajVWUTdzL2toeEJIMnpP?=
 =?utf-8?B?RStlWm1uN3lLOXpPKzlQeHd4cUZhRGpFa2RvalV4K0dUcjgyN3dqM0IvMDJq?=
 =?utf-8?B?aW5sSHNIaU5ybjBZY3FVay8va3YvZGJzWnZOd1ZWMGRRcHpNVk8vTzdyZkR3?=
 =?utf-8?B?dndmaGQ5NS96QjNlUWZqM2NOQmpVaWNHc1F6SlI4RVBObm1XL3dZayt2cEFT?=
 =?utf-8?B?VWZweFFIQWRIT1lBclNOa3B4YUdPR3VKdXdOTWpNSlk4dFNnc0Z4aFlFVTlu?=
 =?utf-8?B?dnh4OS9mMDhPY21rR3RYR09zUmFWYmdOdGRNdGNNQlpoZm9HaXBxQ2lFbEU2?=
 =?utf-8?B?WlVsWmFwQzFmZHpWS1lBNUJuc3RrWHhqTzJqRVJ2RFBVRHdlRzNDNEZOZWtl?=
 =?utf-8?B?UFpwNUd5c2hYSUlHcG9NTzlUcWI1Tk1iZDhRS09tSVpEMjltMTByeTM2Q0Rr?=
 =?utf-8?B?UUlzUDhqYmdOM1lSSXFVaTM4N2VGUnV2T3E2Tk11czU1cWpnVkkvcTRqMmcw?=
 =?utf-8?B?Q0RXWHZGYmtsME5sQmFZbWJnVStZeTNpWlBQdFRxUGtKWE04R0gvM3lNb3hW?=
 =?utf-8?B?ZEY3c3h5MU8vUEd2LzdLeUJyeWNPdmdCQ1pNaEEyTkpKZlFRdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682aa571-2e93-4492-4044-08dba964538e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 14:20:56.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87gZn+csXRHrQUmS4rAaTQDKdp+GAkuMr/kmRIOSSi3fKlip5itnoJQb0agK9ZixuAQ2ZLCWIQkOyyZpGApW4PtIUrsSbWbRbSbntF1CZko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6692

On 30/08/2023 2:39 pm, Jan Beulich wrote:
> On 24.08.2023 17:26, Jinoh Kang wrote:
>> @@ -62,9 +63,16 @@ void pv_inject_event(const struct x86_event *event)
>>              error_code |= PFEC_user_mode;
>>  
>>          trace_pv_page_fault(event->cr2, error_code);
>> -    }
>> -    else
>> +        break;
>> +
>> +    case X86_EXC_DB:
>> +        curr->arch.dr6 |= event->pending_dbg;
>> +        /* Fallthrough */
> I guess I have another question here, perhaps more to Andrew: How come
> this is just an OR? Not only with some of the bits having inverted sense
> and earlier logic being ...
>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1989,17 +1989,17 @@ void do_debug(struct cpu_user_regs *regs)
>>          return;
>>      }
>>  
>> -    /* Save debug status register where guest OS can peek at it */
>> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
>> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
> ... an OR and an AND, but also with ...
>
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -78,7 +78,10 @@ struct x86_event {
>>      uint8_t       type;         /* X86_EVENTTYPE_* */
>>      uint8_t       insn_len;     /* Instruction length */
>>      int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
>> -    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
>> +    union {
>> +        unsigned long cr2;         /* #PF */
>> +        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */

As a tangent, since I wrote the original series, there's #NM and
MSR_XFD_ERR which needs to fit into this union for AMX support.

Sadly, the only AMX hardware on the market right now has an errata where
XFD_ERR doesn't behave properly here.

> ... the comment here saying "positive polarity", which I understand
> to mean that inverted bits need inverting by the consumer of this
> field. If this is solely because none of the inverted bits are
> supported for PV, then I guess this wants a comment at the use site
> (not the least because it would need adjusting as soon as one such
> would become supported).

Part of this patch is (or was) introducing pending_dbg with no logical
change, but as I said, I don't think I had the original series split up
quite correctly either.


This field is more than just the inversion.  It needs to match the
semantics of the VMCS PENDING_DBG field, which is architectural but
otherwise hidden pipeline state, similar to the segment descriptor
cache.  The other necessary property is the (lack of) stickiness of bits
in the pending_dbg field.

All of that said, having talked to some pipeline people recent, I think
pending_dbg needs to be elsewhere.  Or perhaps a second copy elsewhere.

Some bits stay pending in pending_dbg across multiple instructions. 
This is how we get the MovSS-delays-breakpoints property that is a
security disaster elsewhere.

The problem with this is that we can't get at the pipeline pending_dbg
state for PV guests (where we've only got an architectural #DB to work
with) or for SVM guests (where this state isn't presented in the VMCB
despite existing internally).

~Andrew

