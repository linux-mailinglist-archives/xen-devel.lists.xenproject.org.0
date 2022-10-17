Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B56012A9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 17:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424467.671905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okRvx-0006sP-QD; Mon, 17 Oct 2022 15:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424467.671905; Mon, 17 Oct 2022 15:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okRvx-0006pm-NE; Mon, 17 Oct 2022 15:21:41 +0000
Received: by outflank-mailman (input) for mailman id 424467;
 Mon, 17 Oct 2022 15:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okRvv-0006pg-Kh
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 15:21:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6287fee4-4e2f-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 17:21:36 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 11:21:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5658.namprd03.prod.outlook.com (2603:10b6:806:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 15:21:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 15:21:21 +0000
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
X-Inumbo-ID: 6287fee4-4e2f-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666020095;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0IcUiJORuMDR/agsdZ1gz2t5aO2YlUAO+ABXp8idr2g=;
  b=BXWA5YTobYAZJo6gkxI7k3Yk0TTBdWnplljorzoez4K7FJo5N+9a1qZL
   l6VoZxBkDlj3AUPkgjawRm2uXwefMqKQumgr/5A90f4IuByPmylpGxxz0
   2j+09bPYMRnhNXS1rf1zMqDIDrw0Lee67CBi+wOip7LDTYpzbG/KybZpG
   I=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 85438512
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GDaHWaCYlbsbBRVW/6Tiw5YqxClBgxIJ4kV8jS/XYbTApDMn0jAEx
 2QeXWGOa67YYjHwc4gjPIm/9R4F6J+ExoJnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2t4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kONKkV2rgpBFhFt
 t4dJGFKSQ+7u7KPlefTpulE3qzPLeHNFaZG4jRF8mucCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAF7gvN/cLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toi/w3b+SxHmTtIQ6BZ+k36A2gGWpmUMQCF47aXGds+mpoxvrMz5YA
 wlOksY0loAS+UqxX5/CVhu3iHeeu1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsTxYB4tTliJE+iFTIVNkLOKS4lMHvEDf8h
 TWDtjEjhq47hNQOka68+DjvnD+t4JPJQwgd7x/SGGmi62tRWomhYIC57EnB2txJJo2ZU1qps
 WANno6V6+VmMH2WvCmEQeFIGa7z4f+AaWXYmQQ2R8Fn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqm8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:I/973aGpXB3HFi4spLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.95,191,1661832000"; 
   d="scan'208";a="85438512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbLKSRKFY1FEJvA4IM1rPrNDZ44MRWUe0ibr0Tyn9IkZXZ8o1jxW0VNxZzYBeSaB1+cb5R2uPwvrPRdJX+RVqeooiMcqikoUB7OEM5JQVJzWyLb18A6Exn+XaiZDiCnUkuiuutxdCog4Mtj9p37KfRHM3C5TIzcSGSgN+CsgSHqXaDX8OZ8hyvyG3pyS7fsZtyRo7k0rsY2k+s+QoM5Krt1SFNe0Ex6ItZlA2tIDCegP4dCs2wWu1rTiei/4yDC2KEI1A4KuvWZAglEVWhF/2nQiFdaI34QzjmKQPnHPMIJg8vHnrPU4O2KOQsVF9Q8KQ3GehGYwyKr+LlRpLNq3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IcUiJORuMDR/agsdZ1gz2t5aO2YlUAO+ABXp8idr2g=;
 b=LFc04CgiWX6KhauzfRDBhByPfxYyoOxrkImxZTRd3OPXsZiTrMQTuUe8piIPL6Y7J7AsxDGOreH1XyqCt1Yn3Kedzi2ZUhGq/P8Pu4OMTIJsLSJ0LdCFqtAT+kUWLlJ7wVtQ2w94VUR443sfMtCCFHgKlvufMknEX/VFMmnI1FJrmTsg2Nfy8c4W2dcFhgn2uUEQitWeIRzyfkO5FB67nE39jbHha4cjzNkUqXuVFBbMivpUxkivaIuupedCqddlQzKbjEqNNhXTXjTCffJQTdTFy8lOINa8/QzRbIoiYewSFC6ugHzxaYdIi6XInhqY6HdhAe6ADoEye1wEiBUEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IcUiJORuMDR/agsdZ1gz2t5aO2YlUAO+ABXp8idr2g=;
 b=JLfXXjIgIOGta8IAuknTNOjOySRYofJeE5ekajLpD+lsyOAGhOTdwfQGgfTOGT2cOygxNn+L5X/EqIupqON9VZ3nUtHF9RmL+hdOlkTEhVl2U/weNKCsoY+zBOei+6dqe4DnrX6ZaINmkvBX/DsGbMG/CZqDqdnD6MoWDFBMf8Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4fyisutH9MvwK0CzzXPj4djvUK4StD+A
Date: Mon, 17 Oct 2022 15:21:21 +0000
Message-ID: <394c1a33-9549-77b2-6981-65e69c292954@citrix.com>
References: <20221017074618.36818-1-Henry.Wang@arm.com>
In-Reply-To: <20221017074618.36818-1-Henry.Wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5658:EE_
x-ms-office365-filtering-correlation-id: ff414571-4771-40a4-28d9-08dab0533f25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TaQh1AyBxwaad1t6ZBWjYFoDimTqfXCMD+FLMjXOmuctmDQHZ5ZwClXw0on+CgR99abQEAN1wcc7x7BZFZo88VYKzmtAJt0O48lmmLoE3nflIm5mE2T1Rmn91S+2l4+6yVAo+L3/aJUrQzjMdQqzaJJcrWWH1s3MILaRl8e0/8hAY7IMetnCFeeaGASYDPfNsewPKMROcFWGfTVSNt/DigaLnP+Hx3J5vS4C/qEYu6ySGDdZViuzrIJiWM2qWKWvQhx0rqLOALerSXYq2L2mZE7vBG1BCbjrYKCOAGGOuNyCgbyFMfZ0rclfMzOttPV7DmYGfwGcb7jopLXR8xB+LS22fd7/PVRZHjIK7CVToVO4b14SowVbjykeu2txaK0E0lU7vjfWNfVHy+IRf2Uh3U0+nmjeIse02urgp7F7wsxitSXKz5qJNH7UlhXlErd75yJHW1dma5nlInUFUJ7TEhhAkgdtePtiPvupH7BtdNIa7wFcI3EUvoZ61ZtQLnszZJW0dVW8X/mvb+g9WOAwown5BgmE79ub5dlln4D5gQxw/6wFauzn2wDtD77zDiuvUrAed2MER1bFfclxkDRoLhuj+9TPqJgoqQF6jNri+PuSsPEKuHQxmIZ/d84lujG700SK78t6YldMOzeXKQep0oiCNFVEEEGRbvs9V83eLlVcjBQU1MJjgEQAyFpcZtyoADlB0Tf886YMtmBD58aKtcrSeCFPC6VZ6hbhdVWDpz0Ane1+jDG1/pTeK8DcP4VaD3kVMjpjQNNEKmurC7QqM/URCy5sWhEnm6W9NxqMLceoI3UFYmf3Q6C4b7S/af25gp+lOIBggd9XhtNNAheLgA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(8676002)(91956017)(316002)(8936002)(66556008)(66946007)(4326008)(110136005)(41300700001)(66476007)(76116006)(31686004)(54906003)(64756008)(66446008)(5660300002)(38100700002)(2906002)(122000001)(71200400001)(38070700005)(6506007)(53546011)(6512007)(36756003)(31696002)(2616005)(82960400001)(26005)(86362001)(83380400001)(6486002)(478600001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUNkcVBzUmJ1d1lpQVl5RC90V0tVQUJZWjh6V1RidDJlV0JQbFFabGRyZkRO?=
 =?utf-8?B?MlFIU1NFZTMva1l1QUF0bWh2UEdCaFVxTk5DOGZDTVNZbGpMeFFlZzdMQ2t4?=
 =?utf-8?B?eVpkUkNIdHNTN1haZGN3UGJrNStoN3FodTQzU1Y2ZXhKMHI1THg5Q1JMemFJ?=
 =?utf-8?B?WDFHSTZiSlF2L0U3djVmMlM2cTF6OUF1SDNXelNhT3p4RzdUald5elhYY1VT?=
 =?utf-8?B?VFdKU0xVTEptTE80UUNCdjMzSjFSckhlSVl3S01YWmlGbldtY1hxZDhuMExa?=
 =?utf-8?B?Rml1bXdYcEVqSkdUZ2F6RGZ1T3VPeFJZbUNmeTI0NWtoTkxuQjhzNGlrYlFV?=
 =?utf-8?B?eTBzdzZQbFY4cjlYRmRld003L1RwYTRBejR4RVpqUDZCMDRlT2RJWjEwRVBD?=
 =?utf-8?B?bXFpUHUvNkJMYXpRb0kyWWtueTZTaXNnUThTWGd6QXVXYkcvWXN0ZTRHQkxO?=
 =?utf-8?B?WFM1cG5UWHNYQk8vU2hOWGFwUGJuckdvN0R1ZFZuYnRBUjFhSVBQeE9DejJw?=
 =?utf-8?B?OHU4Y3VicDdZWjgwYnFyYnhJTDlnRHI2NHYrNXF2d3RqSEd3Zkxtc3NDeXNn?=
 =?utf-8?B?TFBaR3NIamJaTGU2cXFPcy9Vd0FpYk4xNnFlRXFEbUt3Wnc2c1dwaFRWdDAv?=
 =?utf-8?B?VVRJK1JIa2ZOU0l0dy83b2svclBobm44dHgxdUhkMkE1bzRBMjBHTm5WVUtT?=
 =?utf-8?B?d3dTK3MwQjJobTFmQmhlUWQ0cEs5MldtZC9IbFpWV1RlK3pneXczNGhKNUNm?=
 =?utf-8?B?WU9pbWExSFVSVUpBWUw1d2tab2dPbjZNMVZKZmtHY1E0YmxtUW5TbTRTYlQ4?=
 =?utf-8?B?MkZsU3MxU0h2RDhyY20zSW5ONkg4YjRmUTJmcFhhaXdLMHM0MkI5WjM3ODB5?=
 =?utf-8?B?Y0tRVmF0N0ZWS3J0TGdCZGgrcmJaR01aZDB0bWJlZ0pjcHFtdkJKQ1MzbWtl?=
 =?utf-8?B?ZjVkQ2lNM3NoeW5zdzFrdXFoWndIY282SU82U3M2djVMT0syYVc0UVErMEdL?=
 =?utf-8?B?YkV4SUpia3c3NmROSGRqRjNSRGdxK2hkWFFNaVNNQkJIcHN3UEZFaml2MWZu?=
 =?utf-8?B?Nld6MGE3YlZzWWgvSnQ3N0I5bzd0ZU0xZUIrVzVCWUV4dzlwTVZuYk01MkFt?=
 =?utf-8?B?UU4zSGM0YnI1OGJKTHJQS2gxUmt4TFk1RkFKU2dyajhvMXpNdlBNc3lObDAw?=
 =?utf-8?B?Mk5sdEY2czZkNDZNRCtsZWUwNFhhZ29tNm5mS25FUzFGNCtWbVFoNmtjRHk5?=
 =?utf-8?B?ajBicUhoV3pNdlVtbEE2ODk3VURnOWMrWGFIM1Mwc0duZVE4eHVkUC9Nanc5?=
 =?utf-8?B?VW8rMk9iV1o5UXlCWnIxVkU3U04wbW13UGlVZ0F0ZERqT2dlL28zcXIyVlhU?=
 =?utf-8?B?WGZCWGlRWUQ1bWlxMGNtYWJXS0ZYc2V5RTVIMWppZ2RIdk0ra1kxa2dqRlhW?=
 =?utf-8?B?OUFUakpnNjJjZGljNnVENmhleGJjL2VVU0pwR2dEQncvNm9rQWlmWWt5Kzds?=
 =?utf-8?B?YXZiYWRidGo3bThXZHp0K2ZQY3dTUVc5MEIraVM3bVdna0srU09mQ1dDUHBC?=
 =?utf-8?B?ZHVSVVVWbzhpRVcydVcrTitRMUZJRTZwcDlhUlE0VTdiZUlwYzhVWncvWjNT?=
 =?utf-8?B?MGt1UWluUTZ6bC9TMm41ZjFMSEVvRTFSZysrV2pVWlBQYzVpOVVZVlhiRjZN?=
 =?utf-8?B?QTFSQkYyZFJObWRWdFV1RHZSbmt5OWNlazBhMW4xMnBuUHRoeFBSK1VrK1dK?=
 =?utf-8?B?Y1Vtd0c4cElTbGpUTWlMMzhlZVZFY3Q0d0ZQVTdndzBIWm81NUFwK0JVU2c1?=
 =?utf-8?B?ZEFrTjI3YW0yOE5VZUtKTzROa2RsR2RjdFBaY1NvQXovYklDZWl2bVJUaWJG?=
 =?utf-8?B?T2Nxdy9mNEVrOVg3RktndzUvNHpqaVJlZDVMQ1B0NUxSaHBRMEN5ZVZKTWZD?=
 =?utf-8?B?eEoxZVhDc2FwRWovMVdSclczVTRLZTcybVdJbmpqczJMeXJDV0pmZDJ1RXF6?=
 =?utf-8?B?M2dpL0dMYVZjdVpkU0hydUdoekpNeXE1SDhiRHdJa1Niek04eXl2MUZuUFVI?=
 =?utf-8?B?ajFaQ0xRK0xidC9IM2lLd2JFR3c3ZWg1NFpsanlVMm9PMkVYOUpHeW9yNGdP?=
 =?utf-8?Q?PULAY6JaWQDtAPlN4MG5ICNkV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4330D1ABC1093146BD282BC3EBF9B305@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff414571-4771-40a4-28d9-08dab0533f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 15:21:21.3895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vObA4/AhNqfNgm8+jHsE+/Rs1vlonPz5MCvS4jyjTICCSFrz0SGwHcVVwl49sHiCQtHcE/njNivWZqhUkj249AUX02Vz6F7n/5HTVQHymPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5658

T24gMTcvMTAvMjAyMiAwODo0NiwgSGVucnkgV2FuZyB3cm90ZToNCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPiBpbmRleCBmMTc1MDBkZGYz
Li44YzlkZGY1OGUxIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMNCj4gKysrIGIv
eGVuL2FyY2gvYXJtL3AybS5jDQo+IEBAIC0xNzM2LDcgKzE3MzksMjAgQEAgdm9pZCBwMm1fZmlu
YWxfdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkNCj4gICAgICBpZiAoICFwMm0tPmRvbWFpbiAp
DQo+ICAgICAgICAgIHJldHVybjsNCj4gIA0KDQpFdmVyeXRoaW5nIGJlbG93IGhlcmUgaXMgImRl
YWQiIGNvZGUsIGJlY2F1c2UuLi4NCg0KDQo+ICsgICAgLyoNCj4gKyAgICAgKiBObyBuZWVkIHRv
IGNhbGwgcmVsaW5xdWlzaF9wMm1fbWFwcGluZygpIGhlcmUgYmVjYXVzZQ0KPiArICAgICAqIHAy
bV9maW5hbF90ZWFyZG93bigpIGlzIGNhbGxlZCBlaXRoZXIgYWZ0ZXIgZG9tYWluX3JlbGlucXVp
c2hfcmVzb3VyY2VzKCkNCj4gKyAgICAgKiB3aGVyZSByZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkg
aGFzIGJlZW4gY2FsbGVkLCBvciBmcm9tIGZhaWx1cmUgcGF0aCBvZg0KPiArICAgICAqIGRvbWFp
bl9jcmVhdGUoKS9hcmNoX2RvbWFpbl9jcmVhdGUoKSB3aGVyZSBtYXBwaW5ncyB0aGF0IHJlcXVp
cmUNCj4gKyAgICAgKiBwMm1fcHV0X2wzX3BhZ2UoKSBzaG91bGQgbmV2ZXIgYmUgY3JlYXRlZC4g
Rm9yIHRoZSBsYXR0ZXIgY2FzZSwgYWxzbyBzZWUNCj4gKyAgICAgKiBjb21tZW50IG9uIHRvcCBv
ZiB0aGUgcDJtX3NldF9lbnRyeSgpIGZvciBtb3JlIGluZm8uDQo+ICsgICAgICovDQo+ICsNCj4g
KyAgICBCVUdfT04ocDJtX3RlYXJkb3duKGQsIGZhbHNlKSk7DQo+ICAgICAgQVNTRVJUKHBhZ2Vf
bGlzdF9lbXB0eSgmcDJtLT5wYWdlcykpOw0KPiArDQo+ICsgICAgd2hpbGUgKCBwMm1fdGVhcmRv
d25fYWxsb2NhdGlvbihkKSA9PSAtRVJFU1RBUlQgKQ0KPiArICAgICAgICBjb250aW51ZTsgLyog
Tm8gcHJlZW1wdGlvbiBzdXBwb3J0IGhlcmUgKi8NCj4gICAgICBBU1NFUlQocGFnZV9saXN0X2Vt
cHR5KCZkLT5hcmNoLnBhZ2luZy5wMm1fZnJlZWxpc3QpKTsNCj4gIA0KPiAgICAgIGlmICggcDJt
LT5yb290ICkNCj4gQEAgLTE3NjIsNiArMTc3OCwyMCBAQCBpbnQgcDJtX2luaXQoc3RydWN0IGRv
bWFpbiAqZCkNCj4gICAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZwMm0tPnBhZ2VzKTsNCj4gICAg
ICBJTklUX1BBR0VfTElTVF9IRUFEKCZkLT5hcmNoLnBhZ2luZy5wMm1fZnJlZWxpc3QpOw0KPiAg
DQo+ICsgICAgLyoNCj4gKyAgICAgKiBIYXJkd2FyZSB1c2luZyBHSUN2MiBuZWVkcyB0byBjcmVh
dGUgYSBQMk0gbWFwcGluZyBvZiA4S0IgR0lDdjIgYXJlYQ0KPiArICAgICAqIHdoZW4gdGhlIGRv
bWFpbiBpcyBjcmVhdGVkLiBDb25zaWRlcmluZyB0aGUgd29yc3QgY2FzZSBmb3IgcGFnZQ0KPiAr
ICAgICAqIHRhYmxlcyBhbmQga2VlcCBhIGJ1ZmZlciwgcG9wdWxhdGUgMTYgcGFnZXMgdG8gdGhl
IFAyTSBwYWdlcyBwb29sIGhlcmUuDQo+ICsgICAgICogRm9yIEdJQ3YzLCB0aGUgYWJvdmUtbWVu
dGlvbmVkIFAyTSBtYXBwaW5nIGlzIG5vdCBuZWNlc3NhcnksIGJ1dCBzaW5jZQ0KPiArICAgICAq
IHRoZSBhbGxvY2F0ZWQgMTYgcGFnZXMgaGVyZSB3b3VsZCBub3QgYmUgbG9zdCwgaGVuY2UgcG9w
dWxhdGUgdGhlc2UNCj4gKyAgICAgKiBwYWdlcyB1bmNvbmRpdGlvbmFsbHkuDQo+ICsgICAgICov
DQo+ICsgICAgc3Bpbl9sb2NrKCZkLT5hcmNoLnBhZ2luZy5sb2NrKTsNCj4gKyAgICByYyA9IHAy
bV9zZXRfYWxsb2NhdGlvbihkLCAxNiwgTlVMTCk7DQo+ICsgICAgc3Bpbl91bmxvY2soJmQtPmFy
Y2gucGFnaW5nLmxvY2spOw0KPiArICAgIGlmICggcmMgIT0gMCApDQo+ICsgICAgICAgIHJldHVy
biByYzsNCg0KLi4uIHRoaXMgZWFybHkgZXhpdCBpcyBhaGVhZCBvZiBwMm1faW5pdCgpIHNldHRp
bmdzIHAybS0+ZG9tYWluID0gZC4NCg0KSW4gcGFydGljdWxhciwgeW91IGludHJvZHVjZSBhIGJ1
ZyB3aGVyZWJ5IC4uLg0KDQo+ICsNCj4gICAgICBwMm0tPnZtaWQgPSBJTlZBTElEX1ZNSUQ7DQo+
ICANCj4gICAgICByYyA9IHAybV9hbGxvY192bWlkKGQpOw0KDQouLi4gdGhpcyBlcnJvciBwYXRo
IG5vdyBsZWFrcyB0aGUgMTYgcGFnZSBwMm0gYWxsb2NhdGlvbi4NCg0KDQpUaGlzIGNoYW5nZSBp
cyBvdmVybHkgY29tcGxleC7CoCBZb3UgYWRkIGEgc2V0X2FsbG9jYXRpb24oMTYpIHBhdGggaW4N
CnAybV9pbml0KCksIHNvIHNob3VsZCBvbmx5IGJlIGFkZGluZyBhIHNpbmdsZSBzZXRfYWxsb2Nh
dGlvbigwKSB0bw0KY29tcGVuc2F0ZS4NCg0KVGhlIGB3aGlsZSAoIHAybV90ZWFyZG93bl9hbGxv
Y2F0aW9uKGQpID09IC1FUkVTVEFSVCApIGNvbnRpbnVlO2AgaXMNCmVzcGVjaWFsbHkgc2lsbHkg
YmVjYXVzZSB5b3UncmUgc3BlY2lmaWNhbGx5IHdhc3RpbmcgdGltZSBpZ25vcmluZyB0aGUNCnBy
ZWVtcHRpb24gd3JhcHBlciBhcm91bmQgdGhlIG5vbi1wcmVlbXB0aWJsZSBmdW5jdGlvbiB0aGF0
IHlvdSBhY3R1YWxseQ0Kd2FudCB0byB1c2UuDQoNCkxvb2tpbmcgYXQgYmV0d2VlbiA0LjEzIGFu
ZCBzdGFnaW5nLCB5b3Ugd2FudCB0byBiZSBjYWxsaW5nDQpzZXRfYWxsb2NhdGlvbigwKSBpbiBw
Mm1fZmluYWxfdGVhcmRvd24oKSBhaGVhZCBvZiBvZiB0aGUgcC0+ZG9tYWluDQpjaGVjay7CoCBF
eGNlcHQgaWRlbXBvdGVuY3kgd2hpY2ggaXMgZ29pbmcgdG8gYmUgaXJyaXRhdGluZyBoZXJlLg0K
DQpJdCB3aWxsIGJlIGEgbm8tb3AgZnJvbSB0aGUgbm9ybWFsIGRvbWFpbiBkZXN0cm95IHBhdGgg
KGFzIHJlbGlucXVpc2gNCnJlc291cmNlIHdpbGwgaGF2ZSBlbXB0aWVkIHRoZSB3aG9sZSBwb29s
KSwgd2hpbGUgaW4gZG9tYWluX2NyZWF0ZSBlcnJvcg0KcGF0aCwgaXQgaGFzIGEgbWF4aW11bSBv
ZiAxNiBwYWdlcyB0byByZWxlYXNlLg0KDQpJJ2xsIGRyYWZ0IGEgcGF0Y2guDQoNCn5BbmRyZXcN
Cg==

