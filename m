Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC165EA9A1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411929.655065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocphf-0007ty-Lm; Mon, 26 Sep 2022 15:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411929.655065; Mon, 26 Sep 2022 15:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocphf-0007qs-IB; Mon, 26 Sep 2022 15:07:27 +0000
Received: by outflank-mailman (input) for mailman id 411929;
 Mon, 26 Sep 2022 15:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0pF=Z5=citrix.com=prvs=2617546cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ocphd-0007qm-Ro
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:07:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec6f9b89-3dac-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 17:07:24 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 11:07:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5029.namprd03.prod.outlook.com (2603:10b6:a03:1e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 15:07:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 15:07:11 +0000
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
X-Inumbo-ID: ec6f9b89-3dac-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664204844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=d/TUs7nhFi9e6U9lHfFx63WCFDYA++mTFdSPxCHi0lg=;
  b=GxeFUBfrVCqiQhRC8XBGiFolgthLoU4gPYzAEO6RD4q18PS3m5FT/R5s
   8uEu3F+oASVjyAvTfc78ji5OxGqEhpfQTNuyUC4fHOrN69MaQOR2UFYYS
   KeB29ebKHgU8ZHp69i3OptH0fq8RlOl57w1oQQh9KKdVm34DLdH87Moic
   A=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 81017798
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iK1P8KJZIbATWyL9FE+RCJQlxSXFcZb7ZxGr2PjKsXjdYENShGBRx
 zYcWDuDbPmDY2T8KYokPI+29kkD7JOEmIRgHFdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/PZ9ks21BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEmeRrM3EHBtQj99lKA3kVr
 NgCCTcsV0XW7w626OrTpuhEoO0GdZGuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11j+mK2UwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIzGkWParSP87gPJtS/xYYkLN7iFzeE0mQK44kBQEwAYD2Lu9JFVjWb7AbqzM
 Xc83jclpO4c/UqgQ935QjWxunvCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht/HDCCFrsbaVYWmA7brSpjS3UQAQJHUHbDUJTiME5cfiu4A5ih/TTtdlH7Wxh9ezEjb1q
 xiqoS4klvMshMgE/6yh+BbMhDfEm3TSZgs85wGSUmf76Ap8Pdahf9bxsQCd6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVds4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:mCuSnak99XUjk8lU0doJxwArJ4vpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81017798"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWZdoRaT491vAVoQK9DZwWVynJj/NxC7LitUfhQs+GP8luLIDs3DxF2NowBRaXPXdu3fDrzbO/X4MZuZo7efkoB7CPmgfSFJtq/dD1N72o8dKy9/9yIt9lnsdH97r3UVyeil/2hZzHV6Rl6qxKQC/yi+P6f193yRZaV7vrP8Nbjl5IRqsBIRFGJOk/2VlQm9ZGMipWS3PU3Sml6HKRj6y5O/Ml6wAp+1UL2If0MGKV6uZV/ZeenH7Gvnc9W6Y4wQXBI+rFZx537qTgajmEQK4uLpgXu7RWXQ9NFXwACnYg1pEMFc+V7L6YpTfbApliQGA/UKc4TZWZWL+nSiNEefOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/TUs7nhFi9e6U9lHfFx63WCFDYA++mTFdSPxCHi0lg=;
 b=Ka1BHyXcoeQcVJh9Ls2uxoP5WJXDxrYRhu0z3AVx4fKkRqFb8NvxyqJuWLV3NvgZyv1ZZz37WGLdKbPwlOXQXOAo8E1TS4isz5M4z059/XK1wuArMEuLxvbqyjHISIa+28U7mrDYFU7ReKYcpPLSRgI5Qo15EUMPLLGASJetQVgwSmaY2hexkrWny+E6rroOyzvQfRh23fZLIv/qpQLLOa5xKXzzJ9qDhCSR3tcrvBJxOTRKFOD2zfTpuYQ1ik+qstqW9GDWK8R8Y8aQ6BdYKO1plGImzM2YIWqpIieLZC0XaMf0u8dkPpaWOpiJfeFm8r3+kYLzmlE0/6/OIuETiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/TUs7nhFi9e6U9lHfFx63WCFDYA++mTFdSPxCHi0lg=;
 b=vRzCA+XTkxo3ODWB2742QLczAjSSv4XZslIXkj6fLVKm2ZVSrOpdnW9kqkJ7zOygdR2wscTs228+shRt65p/ROwizfJkmlXdFDlYNaqtGoV98eMquShXxtEk0FapPWjuKwi/eF3GAhPf5JgNqHbBb+gVsLuhEoj1fK6Htn+sxVc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Topic: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Thread-Index: AQHY0ZgJqCa/HgBJ80OfcMoFcfGuLq3xnoGAgAAxnYA=
Date: Mon, 26 Sep 2022 15:07:11 +0000
Message-ID: <d7aa4122-d91d-a1a2-c5ef-def70521e94d@citrix.com>
References: <20220926110547.21287-1-andrew.cooper3@citrix.com>
 <6E84757B-2CE2-4C48-AA20-C5D172E4848A@arm.com>
In-Reply-To: <6E84757B-2CE2-4C48-AA20-C5D172E4848A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5029:EE_
x-ms-office365-filtering-correlation-id: 5c0860c1-dcfb-448a-5654-08da9fd0c9f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1vnJ9IAW4QuN0WXWvw7eQ+56X1UkNKkmxjMnJKXDecBsWXPk2o21WWOiutLBubl8tf0CCZHwtQ+wtN7YiOCKGByFVEZfKoRVtU5MCHVQ7pg9HajV98z4pQRbaqAmyxE26tI4fsDts0OB5PU4uhzDRn9ba+RPEh4Y/mL1E4gqQudyf3GdmB+Z+9TP1sRn7zoHCTjfrH6tahfYrMWUE0B7vWdQQx7hdYymQIwg1tHsEXEjW4kmg5CFq5gjTPU6wolMYdC78o/sHr4DLmID0/HN8D3fH1GeMXYgEmMOouon1WByMcxMtiYa/oLcAeoP56c+zSfCqsUnmfDlBeer2yvC9C5EUmKJVCAaMJq4dcOVCqQEFEvKd+mtRHfd67G44bIG4j3f3BPcsUQHuFjLlxiuYaoDPvP2DGw31DCZ2zmqGSTFtpGXA3ogMZDbU9S/awwmTzCk2mAUybikXZqvDwYHLFgH8WQLnHVR8VThGs9MQv0a+cSsyiCI6QX0aaPdLPluSxYrsxc/mCSItzJzbrBIhA8ZOt3PAkS7JjNM11k9156eLPPbuyGjyaWUsje2zwaNiKbryWcLP0a8FnxLYQyfSxrMbYkm5H4oXyHBOWTC2iqm4XK+W+j76WbD0SBsZvzFu2zi6GvLhdW1vsKAulTI79BYiIk+7S3rWxJoZxCtopEJYrSUjgdLiYP4MtXxrQDWu4lVH3fOPKJA8Ux54UsWXnyuGHAhVwzl9YYzxPwWXyJexB59FDOzH3EE4HXtrjRilyppvO4dbeW3bH6F1WEeOlQfT9IE3L5BsGm9Ln+H3vCyRmdXPUexh7Utc+ixcdR+fmPyXwIdvVSvMyOwKRWtQWkfFTSuGxdvk1mUbBjwE1M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39850400004)(451199015)(558084003)(36756003)(38070700005)(31696002)(86362001)(38100700002)(122000001)(82960400001)(2906002)(5660300002)(478600001)(6486002)(71200400001)(91956017)(4326008)(8676002)(76116006)(66446008)(64756008)(66946007)(66476007)(66556008)(54906003)(316002)(8936002)(6916009)(186003)(83380400001)(41300700001)(966005)(2616005)(6512007)(6506007)(26005)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amdKeTNHMThYaWVhMGhHTW5hSlZhbGVsRUFVa3FSQkcxWVJPc3ZQUGxUMjVZ?=
 =?utf-8?B?SGZ4SW9HeCs3YnplcC9ybjF6dWtESzc4QVhyUC8yL0xvZnhib1ZhVmtqWWcr?=
 =?utf-8?B?Snd1TkhaZW1IMUFXV2FJdzZyc040VmZIRm8yUDhqelBVTnhsTFFSTENEaEc1?=
 =?utf-8?B?aXJKT2ZHMUhiWjR2N2ZucWVybVo0Zkg2SWU5eElPcVpkM2dEamlxQmxhbytq?=
 =?utf-8?B?aHp5U3hmcE4yQU90Vy91MkkxNXpXNVUzaG5WUHlhbE5sN2pEbUdlK2hpdVE3?=
 =?utf-8?B?clJtTDd2aWdZVDVnZzdYbHRRdjV6bCtDNjhHZXlybWM1S1VPRzdsUmFJMUIv?=
 =?utf-8?B?dkhrcXR2dW9sbmllajlvT2p3anIzVW00eWVMSzBuOGdlSVl4SzF2ZW1Gbk04?=
 =?utf-8?B?TlhVYktvalR0WU1RSHlObFhES2N1UWsvTEc2NHhNcDJHcit1OGkrQXVxQlkz?=
 =?utf-8?B?dDhVaEFlTUVvbkhxTGJYb25oYmI5bmRocytKR3VZakd0TlpLZGtKY0FDTDVF?=
 =?utf-8?B?K2ZUdXVnQUtiZHRveUVaUHBKb0ZWa0FMcHgyS0c2V2VaczYxTTE4VUJsYW9s?=
 =?utf-8?B?Wjk4a3llUVlzeWU4Wm1BeDZGdzZVbEMxdldEeTJkWWJtRXBGQWlINiswUHNE?=
 =?utf-8?B?ZytqNkhmZUpkeWkyb0lwa1F4WWt3NWZRR3djUi9VL0lCSGhYY20rMGNYZkxB?=
 =?utf-8?B?ZmZhRHMwOEtoL3U1eDZsUE04UGRFbWE4ZHhUOGVNTjNXeEtjdlNmYjQ4L2Zm?=
 =?utf-8?B?K0d6Rk10ZW9QWnA5QUR5VHY2dUxJWnpkVmU5Y0swYXVBNnZmQ2Q1OG9aMkJ1?=
 =?utf-8?B?V1J4RWhIT1dXSlJhakttQjJpYmkzOFhyQXVhNjJrWHVmWVFSTjJWWDNVQXJi?=
 =?utf-8?B?K0EzREkwZDBVeGs5M0Juc1lSOWYva0k1SVpWbmo0VkdMcmRLaFBKWGEvS1FC?=
 =?utf-8?B?K1g0MEFBMHMyNTEzc3ZHRlFHakkxMlVudHgzN0pMemNnbVE0cG14eEl5RjVH?=
 =?utf-8?B?dUxCZ2RBNENYN3UrL3gyTnA3cE5NNjQ3c1dsMVJxaUFUL0w0blJScXh3MnJl?=
 =?utf-8?B?ZHBLMHJMNkpBWFd2U3h6RytGcVpwYWM3eEVSd3FnYTZ2aGlzMjV4d04rTi9n?=
 =?utf-8?B?YXBLTDZ2NmFzRHBZbTIvbS9nMm9BSlZ6WGIvK3lEUzRkZ0NMNk1rYnRqUUkr?=
 =?utf-8?B?SEZJc2pYOERnajRqSUdOS0x4QkxNS0Zmd1lzdHBtSE40bjBGNStvMFVBQ1A2?=
 =?utf-8?B?YzA2RzZabGxaV011QmsxaWFYTjJWaVY0TjBHby9vTWRFNnlIcGxOWFdRcUZq?=
 =?utf-8?B?aFFWOFlCSUExUERZVldMSTNUb3VoUjJxVU05dDFCU1NaRGtNYkVaM3Q5QjdR?=
 =?utf-8?B?RUdGek1qdmg0WFhaSVpGeG9EUFBXRFdJNFozWW9yWTBQMlVLTWp3QURNWlIv?=
 =?utf-8?B?V3B5czFBZ2hBR2Z3K2J2ZnhjSUdZcUVRa0pyVFdmakVIVE9PbjhITGVNMFFT?=
 =?utf-8?B?Q2tyanhwSzZibVF5clRYdXhvZkd6Yk96ZC9BWGt6b0ZBcjA3NTlaTk1pOWI0?=
 =?utf-8?B?Z3Y5djYwUExtdk5VYjFNdWdGVE43dW9yTjdrNlBVQVl2bjV1YkEwcEdiUjZz?=
 =?utf-8?B?eW5nU2NVOW1DZnFDbDljd0c0c21mbjZFL0xndTl3bWZtcCtPbHJiMHZ1Z29l?=
 =?utf-8?B?UFB6cmFPWm1jSkkzdWRhV3dUV0piWTY4aUs0MWN4cVJqYXhUYnQyT1JGK2lv?=
 =?utf-8?B?WUF5L2Y5YzhLVmoxYVV3K0pPTUo3d1VpemJVMnN2aFpRa0xZczJZdHl4K0Ez?=
 =?utf-8?B?RzVRTnZVakFMQ3pSbDdiZzN4QU9UbFpDV3NTRGpuZndDL1owaDdiVzV0eWVP?=
 =?utf-8?B?UHVTU2ZCbHpRMXhyelFlaW0xQmt5bTVNQ1I5dk9Mbzc3d2NRSy9nV2w4WUJl?=
 =?utf-8?B?aWplWG9mSXU3a3J4VmxCc0FTRkhlMWFVQXV5UmR1K2h6cDZkbGR1Zy9xamZ6?=
 =?utf-8?B?SDRQMVNRZzdad1NablhJcGJKZUZPZjZrcXJNQ3V1UzA3S2tLOVkyR1psa1Ir?=
 =?utf-8?B?cFBrWHdTWTZ1M1JBOXNyM0g1RzBCTWNhU0hEakMrU3p2OU5GYzUrbE9EdDNy?=
 =?utf-8?Q?FqEJ7JfuwtBytlF+snGdgN0vb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C4A16131DB1DF428FEA2C1F68988E98@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0860c1-dcfb-448a-5654-08da9fd0c9f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 15:07:11.6215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+1uaKQ8c7K7KHvZP7vFtJGZhXkHYBesao/+j6h1pZFeJaz2equb+xOdMsf5ho+HUwYMDmE52VBmYrXHPryDY9AutZwe3bEjZF8LL+N1mmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5029

T24gMjYvMDkvMjAyMiAxMzowOSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4NCj4+IE9uIDI2IFNl
cCAyMDIyLCBhdCAxMjowNSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6DQo+Pg0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL2pv
YnMvMzA4MzA2ODk1MCNMMTc2Mw0KPiBJcyB0aGlzIGxpbmsgcGVybWFuZW50PyBPdGhlcndpc2Ug
SSB0aGluayB3ZSBzaG91bGQgcHV0IGp1c3QgdGhlIHJlYXNvbiBvZiBmYWlsdXJlDQo+IGFzIGNv
bW1pdCBtZXNzYWdlLg0KDQpUaGUgbGluayBpcyBzdGFibGUsIHllcy4NCg0KfkFuZHJldw0K

