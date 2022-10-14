Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3785FEC99
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422703.668917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHz9-0005pG-Rx; Fri, 14 Oct 2022 10:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422703.668917; Fri, 14 Oct 2022 10:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHz9-0005o7-N9; Fri, 14 Oct 2022 10:32:11 +0000
Received: by outflank-mailman (input) for mailman id 422703;
 Fri, 14 Oct 2022 10:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojHz8-0005nv-BH
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:32:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 739f56a0-4bab-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:32:08 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 06:32:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5366.namprd03.prod.outlook.com (2603:10b6:610:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:31:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:31:48 +0000
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
X-Inumbo-ID: 739f56a0-4bab-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665743528;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PE86i4T4FUCEJzA1ciNQcL/ZBkq9E4Hd28jjXeVn9ZY=;
  b=ST5R4B1wDcNQjQXfSsqPQ6GxbNABAO82sVGuHFBmfPbRqs5tkHFrTEpq
   qIrjQrASwLI9kWRb00NGReJ6WHWgN+vklnxCDlUUFWOvQMIuBFdUGF3c7
   9FoXr0F9Yk2o8FbevLhuU0CP4MAtidZA6NVQO/n+n836Vkkpcg62UwdP5
   4=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 83153999
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9EcmFKyg2w/FXndpvFd6t+cqxyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 jNLWTiAa/uMNmejftt/atjk8kgPuZLcy9AxSlFp+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtB4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw895cBX186
 sAhJnMpfx+nqcWT+KuKY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+UxH6gCdNDfFG+3s9wpgaw/3NQNAE5fEOnp/+9sV7gGN0Kf
 iT4/QJr98De7neDbtT7RQz+n3eCsTYVQd8WGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYXeU97PRpzXiPyEQdDUGfXVdE1pD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zl6/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:Ukf8ka4Lbgav9wgNAAPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="83153999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On+jnMSuSWwtIrh+kLDEvKZKK+H0mI0vMjDS/FqV6ly6ybAogsN1NuH6QUEba3/qaDr8Jdor4JDKpA2JW5USJguio4Mdbg05et9OdSj62INx1s1x0HanCZ8ssolI4K05K9LBySgRluB4A36pfyFm4IpJyNLNg7YZAIfAx/Zg9aEPAlgNN/bIb5tb5PbMfE6zlnQ3GDP3+LyuzKfgcRWJF5idSagkMBP5SXeqD/UfoLcDZo8ho8nfSPjbfNFh7KxZtxYNW+p/fsvNxD7XcrYjj4iuJRkg+qFkrp0F7xW8WX6SB0n5YL2hsGIkTLNhHx2NNq7iR9GhcSXM7un9DzmPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE86i4T4FUCEJzA1ciNQcL/ZBkq9E4Hd28jjXeVn9ZY=;
 b=b4Vz5nTntq2ipw2tFTynenDCQUrYd8ZlO7P71AGhNDZzfKa88tb11V/Spc6qtORFIZtl2w93yAzwc2DHvPJ7ABZh4B7nNX73onmuYDu8sWzC95+wug0319oZwBRdIPH8iW96yzMNtaSIxigNwXt+eafLg7R91b3McoL1NRIFVRmAwnIW/rXH3bloz3mguNAGQA51lXLKdrO1LGd3f1A70UvaAEiOxtcV4QtQAwkHbUkNPw0ZRPt+Hm7MaDbqJ+ia6maskdHFyqxCvRIM1dbry/BkQLtCUw/TN0DD72sa70mqozegjv+cs/Al9actQV04I7LCsZDWJfWCZHrQM0qwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE86i4T4FUCEJzA1ciNQcL/ZBkq9E4Hd28jjXeVn9ZY=;
 b=mb2k1iyZPchAXaVwaNIFtk3l+GmR/gN7FT1haQkqCIStWsC2ooAJ0KoeNRD8JnWtNOlplz2jDE6Knkj6nU038ESP4T665MeIG6hHg2FYKdaW4RTaCuake+hC05fus0TFzyoB3rbUqRe2AriR3JQD+Rzp3j7ga+GFQGYr2EdJYd8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement,
 toward non-recursive makefiles
Thread-Topic: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Thread-Index: AQHY3wR19l5fPoXHX0uqLO79kk12za4MneoAgADPvoCAAD+0gIAABO8A
Date: Fri, 14 Oct 2022 10:31:48 +0000
Message-ID: <0faa9a33-e3a2-1a8b-b0a5-581a14175c2e@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
 <AS8PR08MB79916265D28F1533ECC538F992249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <Y0k2cQu8a3sHKSkf@perard.uk.xensource.com>
In-Reply-To: <Y0k2cQu8a3sHKSkf@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5366:EE_
x-ms-office365-filtering-correlation-id: 46444bf2-fe6a-496a-70af-08daadcf4d07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vNJmc7CJGrBwoiom0eNeLUqN1f74XJbznHOtf8r3DWUgMUjDOnPQDBj0iEtzeneJgeT4oZKiSua/EMYeLwxuYqd6QOwg1VHrHYmyzq0aJTJ2qUq60/mtpFAMVEfmsJ3K6xrr3tq9nVLUeQFxAUsXSHwYzYvumn7ezMa8J+mwgVIXmjzoYFS/RHvWBwo1DqOhIADnspE38kWRA4RaLejnYTUdWRQ0Tu5VxC6QrXRPFC4idUsM3Cu5ST2UTFQA5FOXcuwPM6NyADUBsrD+aK/ERsXGVu6UeG1mP8Jow8Ko4LuYin6uc8xXr4y7fWRBQ4XP6hbcnV3XoOafqCG6qdx3/nYyxwYpHHpeY3ufnO7k/22sI/87sA8OEeqv9D06fK1DzEEFkteMfBJkJN3qTZ08VL04u7WElK9cWt29FzgrfeIKjVZSlSR4k3KiYwXzImTU8Q/frvEJQIAdtY50tGWfOJ8iyifzoEyNbf2A+ahnHBD6IdB2XIub73UqT8q1pw5vqiDVCrXqQXsBzA8AMAK/PV0VjlNGLArD5RyUW6UxtvFGKzQqdHZliI7sshERcwxFblYgxM7RtiDEGo/0Ki4Ys7t4jhfZ6YlWHafe7GwPRL2dL+Vi1IbY1k3b8qEDYoU+gLWGF7kDITWCgjBfyNz65cISWF7Wp+Usde46OJVMO/1XW1em7gSC5iGkM+ixMZ6GzZXHnif/HS+Uxf7at8QDGS0YkV8RTy9SB5799o9rAKq4qST97onwQeUGQ31wztigT8akNi9U2zsaYJKP8OT9BKAGNV8XYimbYwFa9cY1AuYTfCGAApwaoKdFmnijvCmyLhf9pwdlOqjtt66OGEqv9PCtnKfOllHdv3f3yibT/WQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(110136005)(316002)(76116006)(4326008)(66476007)(66556008)(66446008)(66946007)(8676002)(64756008)(91956017)(6486002)(966005)(31686004)(478600001)(71200400001)(6512007)(26005)(53546011)(41300700001)(8936002)(6506007)(5660300002)(186003)(2906002)(2616005)(38070700005)(36756003)(83380400001)(38100700002)(82960400001)(86362001)(122000001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUhQZ1lHcE1tZlpWaXJ5aVAzMVlxZnVnMG1JQm85dVlnMmk2Vnp2YUVMdmxO?=
 =?utf-8?B?OEsrZ3RJTGFDTkptb0dlWEkvbGNDMFBINVh6eG9ybGxBNlFUOG5XTUhOczFI?=
 =?utf-8?B?ZnhRRW1Ra29kNTUxZEZXdHFqOUtsKzd3Uk9xU0twcTRZUG5ZVTFYOVlVd3Zl?=
 =?utf-8?B?QXpYaGYxWElpajBQUE9nQVo2bFQvSFlnbnQvNHhJcVJlSmRTOVZyUEVoRit1?=
 =?utf-8?B?WEtUVDZ2M2dZWDVGbFVKYWZCU0FhM0tucDVlbnNmVHZCanVDUENDcnR6U0FV?=
 =?utf-8?B?SEs5NGoyd2ZtQkord3dRcTBxN3V5S0FCV2FPT0tQN3BMbTNnMFlxM1ZHa2tM?=
 =?utf-8?B?OGZUVjgwbDNmbW1YMXZybDN5S2JWTmZKY1FaV244akIxL1d3VkJDVit3bmJ1?=
 =?utf-8?B?ejJ2dGtWZlZYNmtqR1MxYnlQd1l0T2hSN2tLN1g1V29uUk5iY3E0enExeDFy?=
 =?utf-8?B?dHVmUGs1emNyT2pwTENPVjJHZHByZzZ5S3RKUVRTd1Y3WkcwaEQ5T3FpcWpk?=
 =?utf-8?B?UVJyZ1VPNEk2UE5aR0wvNlY1L3lReGEwSk1DTkhPQ2Qvc29LbFBpc2ZkQVRl?=
 =?utf-8?B?dXprdk1VNkpUcWlGRUp6SHVtSXd6SVA3encyQ2pHK1BrcTYweTdCTWdTZVVp?=
 =?utf-8?B?U2k0TlVMU0d1ODlTNE1vTGJtZG52VWJCMWZaYmowODFSd1o0VE9pRmpPVUlt?=
 =?utf-8?B?SEFKb2ZTdjZmeUg5WndqVnVKUzl3UlRZZ01pK2UvcE9qLzd4cCtQdjIvYmRu?=
 =?utf-8?B?eWFEbksyVGR0TzltMEFYdVp0eXZIV25IZUhNR2xKT25oK3NIUjdtb1E0S3c0?=
 =?utf-8?B?eXVvNzZWaUxVQlcrTEhNbWI2dVdGV3JMbm9neEZneUh0U3RaKzBxVmg0a3Q3?=
 =?utf-8?B?Y3JYRnZJZTlhdzRmTzdzOUxibXdwVlE3KzZScmZkUXhNMTFrM24vMzhpb3dU?=
 =?utf-8?B?Wmc4ejBDQ0hxTVl2MlVoWnRVUHRnYmlsQXpEcXB1Vko2Y0UxQ3dqMUljUlVw?=
 =?utf-8?B?Qm9xRjRaQkhLSzhQV0FwNjlYMUpDS3ZCV1pSajdlRmNEMk9xeWJ3RlJNdTlF?=
 =?utf-8?B?Q0xwZktWcVVKRE5GS200aUYvOE8vSnFyWFhVVzhmT1RRdThpQTlhSWNYMkVa?=
 =?utf-8?B?OVFEUldhSnVRUXlyK0Vya2l3ZFRnQTRMbnZUdndRalM0Z29jQmVvdzJRSkkx?=
 =?utf-8?B?K2Y0UC9Nck5BeXppQXg2MStodSsyNVBnaGRDaVlhVVNaVmwvQ2llcHVLcDRE?=
 =?utf-8?B?dWIwTnc2S3Vqb1J3dkZ1ek1zbkx1dHFwQWl3dG5lcWwwSzJIUVZVcmdTZVp3?=
 =?utf-8?B?bUQzS0o0NlRPUnllZVF6dDkxQTJjTk94cEVKdnVNd1hKMzBvK1FpdzFrWTJo?=
 =?utf-8?B?REp5Vm5Wb2JWRXU1Z0pKTWczNzcvYWpVQzZTMVd2K0ZKZUhQNHloQS9uM0x2?=
 =?utf-8?B?enZwSEpKck43aSt2YjF5Q1NManJZZzJoWXhmVjk5alcxdG5aM0VnWkFHNUVY?=
 =?utf-8?B?d1orWW02YVYyT0RTcU8rRjNYN1lxUCs0MVByaEF3T1dKbk9ZZEJnRDhUMFM2?=
 =?utf-8?B?akY0Y1RYZWxRelMwaFBCV1gxWjA3SFBpbnc1MGJ1Mlc5djhzb3libGk2cHJW?=
 =?utf-8?B?U3hhQkdPTXg2UklhMjdvdlR3N3h4US9QVzhaODFhWldwbTNNcHRDeGFxYWli?=
 =?utf-8?B?QnowNEhLa2E4TzZ4UWtUNjVPNUV4cHZHUkdYVjRReHJadURJQlVsWEkvTUZ4?=
 =?utf-8?B?SkhLRVBMMVZiWnVNMDdtNWxjZzVORFplTytQMDlMR2J1TXJMQW04ejNOMDh5?=
 =?utf-8?B?VDd5VW8ybEkwVElaWWFkNXV3MVBqc3NWa0RDWDA3c3FqRStHOW4wNEpyNFFu?=
 =?utf-8?B?MHlBYkEwWjNOSllnT3lvQWVyTVNJTGVvdVFCLzNucjQ4MnpTNVRaa3M0eDFN?=
 =?utf-8?B?T0xhdllaL2ZWVTlEZnJPMFA0ZVQ2K3E4SlBHeHlrRUdIN1BHM3dDeTEveFpn?=
 =?utf-8?B?eGZNUDZXNDgvNUVNN0RsaXRzTzFZQnRGazAyaUptdlJwdUlnbWxhMUNvdUwv?=
 =?utf-8?B?V3Z2cjVSSXFMTG12WU5jU05zNmNHaW1kU1QwMTZabGxHQ0gwZFc5U09lZ0dl?=
 =?utf-8?Q?BKzp1w5VQw0K4UzJ6TVAj4iKB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <390DF663F318ED4781E294322F0B732B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46444bf2-fe6a-496a-70af-08daadcf4d07
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 10:31:48.8359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZwBjewd2P4IahzjyC6qFbK9jwuceif70Ap1AkpcSxmftoTem2eoRnke2LEIQG63D39A3vi0d943OM1znfeIkaZuirSrEFTgYzDTCGBnZARg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5366

T24gMTQvMTAvMjAyMiAxMToxNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIEZyaSwgT2N0
IDE0LCAyMDIyIGF0IDA2OjI2OjA5QU0gKzAwMDAsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPg0KPj4+IFN1YmplY3Q6IFJlOiBbWEVOIFBBVENIIGZvci00LjE3
IHY1IDAwLzE3XSBUb29sc3RhY2sgYnVpbGQgc3lzdGVtDQo+Pj4gaW1wcm92ZW1lbnQsIHRvd2Fy
ZCBub24tcmVjdXJzaXZlIG1ha2VmaWxlcw0KPj4+DQo+Pj4gT24gMTMvMTAvMjAyMiAxNDowNCwg
QW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+Pj4+IFBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhp
cyBnaXQgYnJhbmNoOg0KPj4+PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9w
bGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0DQo+Pj4gYnIudG9vbHN0YWNrLWJ1aWxkLXN5c3Rl
bS12NQ0KPj4+DQo+Pj4gSSd2ZSBkb25lIGEgZnVsbCByZWJ1aWxkIG9mIHRoaXMgKHdpdGggdGhl
IDIgbm90ZWQgZml4ZXMpIHdpdGggWGFwaSwgYW5kDQo+Pj4gaXQgZG9lcyByZXNvbHZlIHRoZSBP
Y2FtbCBsaWJyYXJ5IGxpbmtpbmcgaXNzdWVzLsKgIFRoYW5rcy4NCj4+Pg0KPj4+IFNvIFQtYnku
wqAgSWYgYW4gYWxsb3dhbmNlIGZvciA0LjE3IGFwcGVhcnMsIEkgY2FuIHNlZSBhYm91dCBnZXR0
aW5nIHNvbWUNCj4+PiBvZiB0aGUgbW9yZSBvYnZpb3VzbHktdHJpdmlhbCBhcmVhcyByZXZpZXdl
ZCBhbmQgY29tbWl0dGVkLg0KPj4gUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnku
V2FuZ0Bhcm0uY29tPg0KPiBUaGFua3MuDQo+DQo+PiBTaW5jZSB0aGlzIHNlcmllcyBpcyBxdWl0
ZSBsYXJnZSBhbmQganVzdCBvdXQgb2YgY3VyaW9zaXR5LCBkbyB3ZSBoYXZlIGENCj4+IHBpcGVs
aW5lIG9yIENJIGpvYnMgdG8gdGVzdCBhbGwgdGhlIG1vZHVsZXMgdGhhdCBhZmZlY3RlZCBieSB0
aGUgbWFrZWZpbGUNCj4+IHRvdWNoZWQgYnkgdGhpcyBzZXJpZXM/IFdvdWxkIGJlIGdvb2QgdG8g
aGF2ZSBzb21lIHRlc3QgcmVzdWx0cyB0bw0KPj4gYm9vc3Qgb3VyIGNvbmZpZGVuY2Ugb2YgY29t
bWl0dGluZyB0aGUgc2VyaWVzLg0KPiBJIGRpZCBwdXNoIG15IGJyYW5jaCB0byBHaXRsYWIsIGFu
ZCB0aGF0IHRoZSBwaXBlbGluZToNCj4gICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVj
dC9wZW9wbGUvYW50aG9ueXBlci94ZW4vLS9waXBlbGluZXMvNjY1OTg3MDgzDQo+ICAgICAocHJp
dmF0ZSB0byB4ZW4tcHJvamVjdCBtZW1iZXJzKQ0KPiBPbmx5IGZhaWx1cmVzIGFyZSBJIHRoaW5r
IHRoZSBzYW1lIG9uZSBhcyBvbiBzdGFnaW5nLCB0ZXN0IGZhaWx1cmUgb24NCj4gYXJtLCBidXQg
bm8gYnVpbGQgaXNzdWVzLg0KPg0KPiBJJ20gbm90IHN1cmUgdGhhdCBldmVyeXRoaW5nIGlzIHRl
c3RlZCwgYnV0IG1vc3Qgb2YgaXQgaXMuDQoNClRoZSBYZW5TZXJ2ZXIgc3BlY2ZpbGUgbGlzdHMg
YWxsIGJ1aWxkIGFydGVmYWN0cyBzcGVjaWZpY2FsbHksIGJlY2F1c2UNCndlJ3ZlIGhhZCB0b28g
bWFueSBidWdzIHdoZXJlIHRoaW5ncyBoYXZlIHNpbGVudGx5IGRpc2FwcGVhcmVkLg0KDQpNeSB0
ZXN0aW5nIGNvbmZpcm1zIHRoYXQgbm90aGluZyBoYXMgYXBwZWFyZWQgb3IgZGlzYXBwZWFyZWQg
YXMgYSByZXN1bHQNCm9mIHRoZXNlIGNoYW5nZXMsIGFuZCB0aGUgZnVuY3Rpb25hbCBsb29rcyBw
cmV0dHkgZ29vZC7CoCAoZXhjZXB0IGZvciB0aGUNCmxhdGVzdCBzaGFkb3cgYXNzZXJ0aW9uIGZv
dW5kLCB3aGljaCB3YXMgYSByZWdyZXNzaW9uIGluIFhTQS00MTAuwqAgRml4DQppcyBpbiByZXZp
ZXcgZWxzZXdoZXJlLikNCg0KfkFuZHJldw0K

