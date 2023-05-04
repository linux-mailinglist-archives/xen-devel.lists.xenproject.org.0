Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150716F70D0
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 19:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529856.824746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puch9-0006qa-J6; Thu, 04 May 2023 17:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529856.824746; Thu, 04 May 2023 17:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puch9-0006oR-GL; Thu, 04 May 2023 17:24:43 +0000
Received: by outflank-mailman (input) for mailman id 529856;
 Thu, 04 May 2023 17:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puch7-0006oK-Rj
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 17:24:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a6031ec-eaa0-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 19:24:40 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 13:24:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5154.namprd03.prod.outlook.com (2603:10b6:a03:22f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 17:24:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 17:24:09 +0000
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
X-Inumbo-ID: 8a6031ec-eaa0-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683221080;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tmg3PgyDemi8W5IKw2e27HHKjzkW0qEODkFlV4QFPwM=;
  b=LVVqwZ/kCjhnfk9yOJBfegrxXnY3QF1jVlZdE8OaPZtmYdcSKGy5fKH+
   5EP6l9kleLvSXYlrnfOhZQrQvVJCxa6kjxJ4JQgvFVRqYcCDaslyJW71X
   VXpymGH/FHwPQTSJmpzTvi7m4eSZe6/EvibRfceDOT7ql41B1i1ZQTB7/
   Q=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 106659110
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Aenu8aDqpp8gJRVW/33jw5YqxClBgxIJ4kV8jS/XYbTApD0m3zdTm
 2oZXjzVM6zeZ2H2edh/b9nipElTsZLVx4A3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwOpGH2Jny
 qQkKB8NMRnA1viq/+ilRbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXw32mCdtLTNVU8NYxsmK52F5QFCQTRAeQs6OTsne4eOBQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750NisoM27S+7ErwiTumrZjUTSY4/gzSGGmi62tRboO/e5ah71Sd6P9aNZuYVXGIp
 n1CkM+bhMgECpuHhSGWQOEAGbivz/mAOTzYx1VoGvEJ/jCs4GKqfJoW7it3IkxoKe4bdTSva
 0jW0Sta45lVO3mmZLF2eKq+Ds0rye7rEtGNaxzPRt9HY5w0cRDd+ihrPBaUxzq0yBlqlrwjM
 5CGd8rqFWwdFals0DuxQaEazKMvwSc9g2jUQPgX0iia7FZXX1bNIZ9tDbdERrlnhE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:9YcdCq9gXQLyrNZh2c5uk+DEI+orL9Y04lQ7vn2ZKCYlEPBx9a
 iV9sjzsCWYtN9/Yh0dcLy7V5VoIkmslqKdg7NxAV7KZmCP01dASrsN0WKI+V3dJxE=
X-Talos-CUID: =?us-ascii?q?9a23=3Aet5+OGuaK/ORl3zCUVHbtCLR6IsffkzDz17ve3O?=
 =?us-ascii?q?4JmY2Qf7EU0Ovor1rxp8=3D?=
X-Talos-MUID: 9a23:0jFzvARk0ci6Em2QRXS3tg5IKvUr/52rGRwmg88sg/CCFh5/bmI=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="106659110"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+xUITIv/b/7R2/rcYufXXmyS0zOOPnkqUV8J4K48Nj+wCXxSS0oo3vV7/6J+33k/pTmwjysqXT1PbxwHMp3mlFvZW4qioW1IFdgiFDEYL3b1CPzxfysnBQDhYv1IWlKUaW4iwOv4vOoW0GUmWOc/diUt/9sBZmpzEyD+6CO2OcAPz0HVlV0s2g1R91jfFzo/rHwvkyA2MBpvvxAkv9AGzT37P+ryFMlH8YvrmNIB5bpBsBVoLLb9wr3m4eF0xkaZabOgZu0kk1P4ZdxTO9Zh5dBornXIk/ldhWEabsbxsNNiph0NYhwzJCxrtsDBsKf4FGmlUgpxCZeTX0q5nr/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7kpFIEGXAL2jxrg3WLBllXm2JX23q3dB1NJO/X8Mnc=;
 b=jlEL/uwZ4VptMluEOGnyn2xRwyQj/3Lps9kDuWM+yVduNAYZs7dQNOB3HrRA3Rd7wuTfNw/VDdoFfHw9CIIZsenb7REqxueJhPl9bnjoMCRt8+G1SDBKqDnIFjIIrhBwXxbsWGeID4w+EtkkXblKovuTi8UsiyXxAfDBikMCSbvrksg9lrJcWgtKeu57o+/9w0iJDSzfxdelTj5WFD+rLhzdzUkF2len1peE82yCgHMmop3d+fKrbdmr6bvCuY4XHBwIv0gzohR3Kr/lZHLkNPQYxNmMzp14L5VNa1+wY7ed0/FFvZ2EFwcFvNomwziY5Lwx39+1ydwy2VDMguafBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7kpFIEGXAL2jxrg3WLBllXm2JX23q3dB1NJO/X8Mnc=;
 b=a9bNWB0czrULeACNYufAhbB0njSuB7G7WhlEQnbCqxRzMmCNgm8AQl3fQK2NFs50/T1virNX2tohHikbKVOgl6DtCNDsVxbJOgBx9zWwdw98M6G4G0eKwgQVkjAemrbyNrogbu92aRdCBBw0eb1gqq71HJC+CeBMgkswSOlecCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ca02ea8b-d196-8d2c-bd63-b5ab5f379bc7@citrix.com>
Date: Thu, 4 May 2023 18:24:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] build: shorten macro references
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <95467f2c-09ed-d34f-feef-5cd55c60f628@suse.com>
In-Reply-To: <95467f2c-09ed-d34f-feef-5cd55c60f628@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fd23aa-bf9c-4d7b-3be5-08db4cc45ee9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KkCr7y8gikwIUmV7PH6AhySvaN+dlksWHARQPZp1I8sOeSTz9qh6jUVPhol6YYpDlMi8Zl7Zqsmh3ovnC5cJahob+MsdBwcMNtFBUYlUGhE/MuTYX5OLA90zhweJmX9QUBcMYTy8iU5n0eNYuji9wXdmRg77wHaACsui9/mfya9HBcINxGLNJ+uCcmjtTiNd4qEihDQre/G0DDVkagzaI5fHoEa4e2Fy9oe1+B4xkTwp6qf91kuYwSq/InhK9RDQOBYF3x0vcPhIr8S/+OBNzKScPOmjAPXKIrLr8gPtHd1yp81J8mxyskbSChxUVQHetfK+UvA2bJKcf8DDoBlDyLwCGM4D8IZ2g/CmNsQ1ea+i+oY27w3nhDkuQMPASB1oiTMouo6AzCSKiqUodOSUQ3F5uBVhtxiS7gldhxla12j2mF/i28wE5A7lkutFs6eUFuEs/BzC+0Jht3aQAafUGcXbXntfbUv8+dcF+HytZo/VYN580520pY/uVq1Y1xy/k+NxNqPk2lfOJXDthnbNGt1riWkggWYnnOtTbLyWIYMlGUlcU/AgenAk8JKGq7iMKANYbwnhdQ2P1kAVhjIMSjAcjFFdE8HZz6YX6gRLt4VUetp7ip81W+K/LrRXvmnfm0SdGShlvCU4fE0t8G6GOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(86362001)(31696002)(36756003)(6666004)(6486002)(54906003)(316002)(110136005)(4326008)(66946007)(66556008)(478600001)(66476007)(8936002)(5660300002)(41300700001)(2906002)(7416002)(8676002)(82960400001)(2616005)(186003)(38100700002)(53546011)(26005)(6512007)(6506007)(107886003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3Rpa2tZT3NnYXhDU05YTDJ1N2o1Z2FSSDc1dEdSb054dkl3bzdWWEhPZXN0?=
 =?utf-8?B?TFFia2Rmd1dhMGhSblU0V3JjemRDOFlYU1paSEpDMEt2UEtHcEJWcFlVVjV3?=
 =?utf-8?B?SUY0RE5vZG4vR0VZWE1VeHA3KzQ4aEFQaTI5a1hWZDg5aFpzcExaVk1MVVJD?=
 =?utf-8?B?b3BKQTZBUVVUaElYQ3V3aCs5ZFdZb1RYVTluV01ndW5iMkFwWnAwdGFjN2lw?=
 =?utf-8?B?SG5JbEhvc1g3dXdnODBhTGIvSitFRmtvelYyOUh6MUphQzM3UXM2aEFnV2Ew?=
 =?utf-8?B?V0lQYVFIb3BrcFhzODIrQkd0QnJBUzRpUjdlVXQvaGJQeHVSQ2NQMlhUblMr?=
 =?utf-8?B?VGloaGVKRUhEREdPZW9QV1RQZFJJSG9zcTgvQTQzbXpUd1Znc2xPbjRqZktJ?=
 =?utf-8?B?U3N5amVScDQzREZjQXU0cjBsQjgzMnFSdndrb0V2Mkd4MkRpNHF5MDdHU2dp?=
 =?utf-8?B?TDJCbW1TcFFFQkQ0N0pCbmNuWHJ3Uk45RVR3djcwbElGaWtGVEpTMjczbGs2?=
 =?utf-8?B?dTNyY3J5ZFBHcFEzNmpMWWltZVUrNEZRYko1eDhsY3Z2anpkL1JDWjlqMTVO?=
 =?utf-8?B?ZkE5dTA2cTN0OCtLdlBaY1VPRS94MEpuQmhmMjVKTmE2SzN6a3gwR1ZzYkZY?=
 =?utf-8?B?VFpQTlVuNmd6TUp4U1NwUGl3SlNabHdoR2pHakdIYitvTUFNZUR4dmxlbWs2?=
 =?utf-8?B?NWg1aitqQkZTbFl2V29OemFLSEt2Zk9EZmFueDdJSjRQNGhsL2ltTDNFRlp3?=
 =?utf-8?B?RktzWDVra3F5a1ppdWlpK3FUejlSaXVZRXdEbk5BdXZ6M0wyUkkzMm9TWm5F?=
 =?utf-8?B?TDBNWVJtbkFsazlEZk0xVDhHSnhPTURqVGg3dEFNVWQxSzF3b2tmWE9SRlVF?=
 =?utf-8?B?a1lLT2tpTW9qRHJ3VXllUjZkL2Y2bENoSm8rMEhQak9wNG5wZy9hci9PL0w4?=
 =?utf-8?B?WUh5WDZZS2RpRGJIY3ovL1JqaFBkcEgvaFJIZGJOY2ZZVlZWakMvelB3WnUw?=
 =?utf-8?B?bXBBRTJxZERBVlllRGJMT283QzNlL1p2MzFiNDBIN09jK0dBVjQ3RUNRZ1JJ?=
 =?utf-8?B?R3Z5WjQ1bW56N3M2Qi93MGU5YURQS0dwbGZvTGVrREpXcFYyRDFLM0hIMXFu?=
 =?utf-8?B?RjRoSmxoc3U2cnc2OEovWUhVZmNiTEZhNkd1QnZCWFIwdEtobndtY1lDUkh5?=
 =?utf-8?B?RUlvN1k1Y3pwWXRhdE5UZGorTHFyMXgxUEFaSEw5TDZ0Umw1SkQwM3pmb2gv?=
 =?utf-8?B?d1ZIR0dXM0o5a2RTTUloV2JWeThUTnZJd2FaRWdkYlkySFpLSmt1SVdVcFBs?=
 =?utf-8?B?Z08xbXcyaEtidVpDcnVudlFuKy9xYUtHbEo5NUJITjhDall3b3RDSTMxM0xL?=
 =?utf-8?B?NER0My9jRzFOUVNiK3JmM0w1c09Ed3FMZkNmSS91V0lxSmQ4cmxkM0ZwVGRX?=
 =?utf-8?B?Nlpka2JPNFdOcHFTYWFwS2dpZ0lVK1NIdk5BdFlLMUE3NXA3aTVBeEk4ZHhC?=
 =?utf-8?B?M1VxZElzZUQ1NXF1NFhpL0cyclVvcXpEQWRjSXF2MnJYY1ZGRDhudVU5UnM5?=
 =?utf-8?B?QWpsUFhPbVJmNVFRTjByNk95M1dOUG1yQndkcnA4enlaREVUVmZuMy9TdUlZ?=
 =?utf-8?B?bmhER2NPbXRVQVNtZEpuN0tUOTZ3eENBTzYyTXI0SGlGY0dVa3hrNW1WWHJx?=
 =?utf-8?B?VGdQVzJsYkgyWU1OM3IzcG9ESXhLWmpCajlhbWlMZjJvaEE5VkNaRmJiRXN4?=
 =?utf-8?B?T2Yvd0JoSTQydlNEUTNSVmZ1N3ptcEZDNmZqc2xsK1ZLUTlkRjZJT2xJVnIw?=
 =?utf-8?B?U25aanR5NDVCVjY4NkpqSjQ2TWtkNkxQMnUrbzdjTWxISUZxQS80NGY4dDNk?=
 =?utf-8?B?dEZBRGxKV2NEUS9RZGYzSnhCWjlTWjBOaUkranFsQ0gxaEp1UjlxeVNsaXRn?=
 =?utf-8?B?NlI0S3RMK00vdUNiMGM1ZXJ5aHlWb1RTMFdQdHQyUm43UVFBVmdLWHZyalJ3?=
 =?utf-8?B?ck5jcVRXUjNhdEw5aVBlUDZiOUFDeDhldE9iMUJ1NVBxRWZpanYvNGFKaUQ3?=
 =?utf-8?B?OE5uV25idThRRVNnMDdkc2xoVWVCZUF5ZWRyOUt1NzFxcFlBSFpiUzR3TEwv?=
 =?utf-8?B?OVhDVHhFTHF0QWE3SWJtZWdONm4zTTdBWDMzRER4Tk9WTjVoUktoajBsZDh2?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?WnFKQ09ma1hSVWZUN2hrTkg1UGVrN0hYQnZTUWR2aTlZWlByVVo2b1pMcHRS?=
 =?utf-8?B?SE92UEVQYmNPQzFQUC9meDNPQlR0eERQemRoZTUydjByZ0piVVZOcGtwZzNP?=
 =?utf-8?B?Sk5HeWw2azlYL0ZobXlBbkE4WEk2bkpybXFnMHplSnUrcmNCVkY3amN0VzNN?=
 =?utf-8?B?YnZQTEF0dVVRSmx6cDZvSWhUeTllL3FIYm4zVVFhN3paeU9SdzNaSVdUd09B?=
 =?utf-8?B?Y2t2RTI3MGxVODIxUmh2eW14SzBJbjhaSW54WS9QaHYrNkV3S2JQbUZxMXBX?=
 =?utf-8?B?RGNmeXBlWU1tWUpBZ3BIV21NSXFwdzB6MUw2ZUUzdnB2WHlaUGorK2gwaS9E?=
 =?utf-8?B?QUp2czhWQnJaTDUvellFVlp3blNGYTFBYk1VeEZId3ozUFRrbXNHQmNDQVpr?=
 =?utf-8?B?Ty9qQVIzSzgwT3V4aWpWYjVvU25OZWtHbnNPVkN4bVZFaVUrVjNLZXZEbHZJ?=
 =?utf-8?B?cncrUnZDV0FmSkQ2aGEvYkdEZVpTNFJYODBtaml6cXRGVmxkclZYWS92MGFS?=
 =?utf-8?B?QkZVcUFoYnhxb0ZGNnRnM0YrejJseXZ1cU9HcThpRG9OL0owaHJGRm9ZRmJC?=
 =?utf-8?B?dFQ4UnprUm13QU43STBvQ1dhaUpCdndqdlVJZmhRSGhieGg2RGc2enhvMXMy?=
 =?utf-8?B?SWlGVUVsUUhrZUY1dFQzcml0YTlyM1hGTFhaRUpXS1FvZlR6ZTViVkc1WnpV?=
 =?utf-8?B?bmVTb2xxOXg3TTF0VWc3YTgyVlpCbk5RMEZMZW0rUGJ2UWltaGQyanpvUmI5?=
 =?utf-8?B?V3UxM01abnlBckZobURSZ2JVZ0wwb0Q5TG9wOUFldjF2eTV3VTZCWWVEcVZa?=
 =?utf-8?B?TUU5M0RoMHQyMEtmV0JQZERsZ1JRV3d3SDU4SUl0QVI4aUp4clcwcmt3K0NT?=
 =?utf-8?B?Z3JBV1RJSmdXZFloWWZ4b0tkM2NDRHVid2RiSG5yWWhsQXVwaEwvM21zUTNj?=
 =?utf-8?B?U2VySW40bCtIdTZndVN3bXgrYVdyMzdYSFV1S3llYkxUazRnM29qWjcxOTEx?=
 =?utf-8?B?cTJJck1QZjIzZTZFTHdXVVh1b1pXTkY1dTdVRHhrSnRZL3o0R3ZPK1ZiWkZy?=
 =?utf-8?B?TDg1c3V5TzlYOWdzUXVDL0VqTVNTcUoreHFLQ01SQmcyMEtJNlI4RkZaMkFh?=
 =?utf-8?B?K1lWM0x3SEt6VEY1WTdwenIvRFh5bmdlRDMzOFhPOVdWcDBMWkFrQ040c3VN?=
 =?utf-8?B?dkhSOTBTWlpubDR1Z0NOUzZ1SFV0Szc3YXViWVIrN0pWUzQ0SjdhM0l3Q0dr?=
 =?utf-8?Q?1ZgW3GtibGCWZpJ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fd23aa-bf9c-4d7b-3be5-08db4cc45ee9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 17:24:09.7064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWVxmrHe7n4Q4UENgjtBsLadXRO5dADC2MT4BMDwlfuhZjMEvomMVedQbnW1gsBV0ffulx4irvdzUIesOMOJ3ZSzoWjTJvrlRcU9Rm5KLwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5154

On 04/05/2023 5:16 pm, Jan Beulich wrote:
> Presumably by copy-and-paste we've accumulated a number of instances of
> $(@D)/$(@F), which really is nothing else than $@. The split form only
> needs using when we want to e.g. insert a leading . at the beginning of
> the file name portion of the full name.

From the Kbuild work, we have $(dot-target) now which is marginally more
legible than $(@D)/.$(@F), and we ought to use it consistently.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...

>
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -104,9 +104,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>  	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>  	    $(@D)/.$(@F).1.o -o $@
> -	$(NM) -pa --format=sysv $(@D)/$(@F) \
> +	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> -		>$(@D)/$(@F).map
> +		>$@.map

... any chance we can get a space between > and $ like we do almost
everywhere else?

~Andrew

