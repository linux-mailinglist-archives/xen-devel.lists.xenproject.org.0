Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BFE43DC0A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 09:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217703.377842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzsw-00078e-6p; Thu, 28 Oct 2021 07:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217703.377842; Thu, 28 Oct 2021 07:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzsw-00076F-32; Thu, 28 Oct 2021 07:31:38 +0000
Received: by outflank-mailman (input) for mailman id 217703;
 Thu, 28 Oct 2021 07:31:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfzsu-000769-Lz
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 07:31:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b015873-6436-4dca-9a47-3b0071903eda;
 Thu, 28 Oct 2021 07:31:35 +0000 (UTC)
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
X-Inumbo-ID: 8b015873-6436-4dca-9a47-3b0071903eda
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635406295;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Igg5TvV0Krxv12+lr9LmMK5oWENoLKkAF6Ex2oIH7fo=;
  b=QZ3M3V5qY+h4jVB7X2AI+rFvmA4rGSme4CqRv1pdalSQH09iOl9aUdas
   lqlz4Mn1wh04SR1dcmiM1432P2YIw/aCdk3C/D+spdZJOTVqbfOzxChtn
   L8iyIduS/p07nkjRpxxjGxZiIxkVZ6Erq4WrM8WT//XedhJmAGsLcvU7D
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XRCSgrGeoXAi6NUaueYdd3aoBgTk5pTSYcD3kSHP0WUtKilbCfbz3mviN3eaQthCAI7vGbyzQo
 KbeZmHc8v7u2J3z2iodTyQQ2XMJHqvbOc/nOiomXpDb72XNadW2FjMTayk+3x0rulrVmk4mULd
 2GcfOjV4Sqiy89a2uiboAVMGR5eRDI3JIK8x0UkQRuEE8Cjmt0lxJjraIgk45YGVWGd1Qc2JRh
 SAG9ryWsLyBWzRdRYNdsu2GMHHD+3HYWdzxFC04IZy5M511MNsyDez+W2BNujBS4FaBNozAdpJ
 FwNgUup4WeK402FB9S4qXv6V
X-SBRS: 5.1
X-MesageID: 56918969
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uHQ4IaIlvqatxLKBFE+RJ5IlxSXFcZb7ZxGr2PjKsXjdYENS3mdRm
 zBLX27Sb67eambxc4glbIuzpk5T75CDytc3TVBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Ypf581
 tRHm6euWEQOGYHxgaMCXzJxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xu44BjGZu16iiG97RN
 o0VMz1FNC77YhtOYHYlLZUkjMa30yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibcRKnG6Iq
 2Te5WP7DxoGctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydGboEOjX9NUK
 2QP5zEj66M18SSWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8sjy3C3YFRBB6ds1lk+gaeCVty
 VOitoa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+95r0EqeJjp3OOvs1IetQGCvq
 9yfhHFm3+17sCId60msEbkraRqXrZ/VUhV92AzTWm+0hu+STN/4P9L2gbQ3APApEWp4crVjl
 CRb8yR9xLpXZX1oqMBraL5UdF1Oz63cWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8IIYiPwNvEmM97Z5yEWIU7ITo2Nuhf8NYMmX3SMXFXfoHEGibC4hjiFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5cGK7DZelA/RDFJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:zO0kvKAop3X1BiPlHehKsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHP9OkPMs1NKZPTUO11HYSb2KgbGSpwEIXheOitK1tp
 0QApSWaueAdWSS5PySiGLTfqdCsbv3gJxAx92utEuFJTsaFZ2IhD0JczpzfHcGIzWvUvECZe
 WhD4d81nCdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn9y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zX0IidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6q9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFL9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc4a+d
 FVfYLhDcttABGnhyizhBgr/DXsZAV9Iv6+eDlDhiTPuAIm2EyQzCMjtboidzk7hdUAoqJ/lp
 b525JT5cZzp/8tHNFA7dg6ML6K40z2MFrx2TGpUB/a/J9uAQO4l3ew2sRy2N2X
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56918969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPc35hQhDhXv+hTms8Xz/VfCGKe4qJgrYzRJBt+9UpZpgGqCE6iSPdJNouSVARx+RRRRyQJvsIGbL0YyL9UEgQ3H1+6x2lNnxGv8Agoiyv9le3xQxsQ6YrfwW6It7Gd0e4wgx7fFnzNDfFJYhPETrUv82ALl7BjZ81iU1tCriMIVDgTEXFHl9nTmepl//MmS6Bh6ZqawgeZ280MvEzfgf/mrw03T9xePxRFGmE7b+cYBkiYeMRPsUAEpwz8mZ0XGx4bViJnVVfeBWC/KZBTbQuRaoX/T9k8mU1x9ah/NtB8Tp5eVhOO+xniwAV/XZM0VyufwK3j5KaQQgo3RKUrhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXHP1hrv9uTrfHr1OoxQoKeUCSVR/pziD6tkAO1sNQw=;
 b=PWdAX4aytmqtt6t8rDrIDfrVBDQ2b/+jGnf8n7rtZYIF0zgH4DriuAPgeRwkBl0kQTqEVaeN598YN8EB4sc3qEMDO48pvyA0wWpAiuTQ+r1HZC+PhJfzofb6ESNa05bw2OE2fz2iYRFNZggSJsN0EMcKcdAbq3P/2T2Q0mpCiZNaaGPl+STLg/A6fB7VAd1B73WEpicBv7Tm5MuSZjSGfecB57Zjw7b2PHdmJkO71Qnk7XUDmVvlfPfVAkiMCrRZwxzSbr6PEU/A6ORL2MSvhY2nOJL0qqMrJPfBkqegyY5xwY//lUix+a/PNjK/AxUImixIfNNFtYKM3u+TU88Lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXHP1hrv9uTrfHr1OoxQoKeUCSVR/pziD6tkAO1sNQw=;
 b=PJ9kilD22I10NS0kYBOHbKGfzXlM7qSwzzBfSQd0sqsJIQQaXBu9qb5G+Y13yzwhsSp0fvCrNC9dBkB+8P258wrpI//nFUW68e1ZMXXdILcOEOzdI31YiAr9MjhJsIP22A59YKrvuBcV00CM+HskuRPctC29thJrNdsP/t5pAkg=
Date: Thu, 28 Oct 2021 09:31:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] x86/passthrough:  Fix hvm_gsi_eoi() build with GCC 12
Message-ID: <YXpRzHEawUZEU87h@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211027200713.22625-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01916b7c-87c4-48d0-a6b7-08d999e4f5e6
X-MS-TrafficTypeDiagnostic: DM6PR03MB3833:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3833C2D8C7466FE5624D9B528F869@DM6PR03MB3833.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DQYqtkvrGDmb2qERQr9qhZhq/UAhsVFlMMRdzRzQBCTK0ByeyflE1hQ7uEtuXmsDfOggd4q4S8qrYX0Puk1LcyRX4MT8bWXrVQubeZQeOw6gCauMZN3EXt81P1xAN7Z1tP8tlaCOORwPeTElcSeHyxb6fx2GghBb/4RxdXxndkHjd0IrJxAdjaX+l+KFjPIsumWfCRpFVYl4fO+M+jDt1Zo2dsu+HpSnX75tbSI2lDuhuwtHPCXdxxV+8ZcRsQSxgqpYPyt5M68m6SA82ZdzYQdtVNnqWhS0eTKP+gBYmyNAABCp7cSHLdIcP+haeMfwM19ZwPAZfHWkov+IdpBNuM9K2i+ybfHCgzPXrQdm+uxPgXVmmo3GRrMk41AFXpv2JdzosULLTqh4Vzftv4Qii5Q7y4QRyEOhoT71s7nO9yed2VnmcW55AAHRJtwv+TMpbpeFk3lwbNW6rkWX2nr4fpA26zM7yGM7pYH0rhRkypIpEuPE4DxdaeBkeg4AbthfuvKqmQ8/AK1+4TELlCgnU82Z+SZTE4C71hOtA/7a0YBdICg+KAbUuFVI3dwbrkq7MjEsVCJPyVnKwhpbRFEeHmVLW6agxSuYK6+RVL2Ef+3FsmlfHcPjewBkAiT71qebGjtH2HeUwpBj9iw3b9zAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(8936002)(33716001)(54906003)(6862004)(956004)(38100700002)(2906002)(82960400001)(6636002)(66556008)(26005)(85182001)(508600001)(186003)(5660300002)(8676002)(6486002)(6496006)(9686003)(4326008)(316002)(66946007)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di90czdnQUlaUCs1a3EwMWtJZ21SOE95dlQ0SlpvbWJVMnQvQlJoSlNxRGxu?=
 =?utf-8?B?UWl5US92N21KQVI3MGhOR0k2Wk1hS0VSNTFoUHdXQndEcFE4amZuTVpWbndQ?=
 =?utf-8?B?UTljZmxiWDNxcXZwSG9KSm9vN0FqRnNvM29rVzJOb21XS3l6M3QwaFdxWHB1?=
 =?utf-8?B?a3VmK3RRZ25uVzAyVlh2MC9KVll6OTI2RGxwTGlZWURFSy9WbTFQV1gxN2lK?=
 =?utf-8?B?b1QrbWhHU0RPRzVHbG9MTU5Bdk5VeWlyWTRKUU9KRmtMT2IzMTdFWVQwbTNt?=
 =?utf-8?B?VTJiNllML3ZJY1pURlJFVG82anBWZWkzUk9KODFCbmlMelFZUTFIa3U5d3du?=
 =?utf-8?B?QjlYd2VlMW9rc0pPcEZhdFJNMjRPVldBVXhRYVA5TDFoNWtXa2FQaVp3eDhs?=
 =?utf-8?B?bFdJbk9ZUXdJdGpJajVObU1UbFB5cnZydmZhWmRGdENqc1prRE02ajJmRnJj?=
 =?utf-8?B?R1NBWmN5R21uQk1NeUJoS3grUlQ4TCttaFNYY0FGZnJRTXRSTDgwRVo3bzY5?=
 =?utf-8?B?TzdUWWUwWlM1U1cySzczWHRENkRLK1I2ZEkrVDRDMWVuWXBucW96TW5TK3Vr?=
 =?utf-8?B?R2VOYkJ5d0VlSmZ0WlRwdEpHVk1XdGNLa1cyeEw0QWluRCtkc2dRdkh4WTdt?=
 =?utf-8?B?dmhlT1pyRWw5SlBhR2hqbDdKUkpuUklRaFRodTE3blFzTVloVDZZZ0xqeXNs?=
 =?utf-8?B?WXBibGtGWUVBV1c3ZE1zamkwL2hTa09QRUJEeGczU1poUFp0QmRxTk1MY2dS?=
 =?utf-8?B?Z05rU3ZXY3kxd09YQ3JJdHBhTmdRcWJDemJFK01hbkxaSE05RVkxV1QvdTAw?=
 =?utf-8?B?K1ZnWGNMZlJvenB5Vng0YnBzMWJWd3FvLzYvTTJNQW1HSkM2eUR6L0hjRmtk?=
 =?utf-8?B?aGJVam5mR2dZMHVKdnpnMDlHT0tOMTBsc1hyUGVuNW5sMjRNNnZqQlVzK0lO?=
 =?utf-8?B?Z25TRGFySGNoQ1M4dEl3aEM0L1dwdFpGMWZrbVFieGt5bzkrSnFVaG9vWXcz?=
 =?utf-8?B?Sk5zVHJaVEZ5UGVyQlg1SFkwNmFpZk1jL0wyNTNQYml0WGRab2IvYndQV3Nw?=
 =?utf-8?B?VUNwZWRaaFR1aVVMa1djREdLV052cGhXcHgrdVh5T09nN0hWa05MY2pCMmdq?=
 =?utf-8?B?RVJOVjFoSURxcnlWbXpLclVoK0xRMFl1bnNmZTlNd3JvNkpiUUJSeWdyZ0dl?=
 =?utf-8?B?Y1RnVWxycng3V0tpZUxFbkxmLy9iekd0V0cwOVM4eHNKNHlydDdJcmRtL2k3?=
 =?utf-8?B?NEswVFVoVVV2V1FBekFiWFpSNnpZd2VGdkhhWTVVTTlkeUwxeFNaR01CSWRU?=
 =?utf-8?B?UkVOMzhPRmRaa1k2bFVtd09veC9paVFSRk9WaUhRKzZ0NDlnOVRheFRJSDlp?=
 =?utf-8?B?ZlVWZ3VnMURka2ZaTlVLWnp6NDBTK0hGUXY3L2dmcXpRWUxBTGExdjRTd1lu?=
 =?utf-8?B?ZjRLRmVPdWZieERnTlZicm56Z1JOU0poMTBybjAvN2hjNVZWdVdOMWVvR0pQ?=
 =?utf-8?B?UU8xem1YS0NKY20yTU9sWExmNlduT3BCbUlKZ2pBZlhvMFU2QnhGUVdYUHcz?=
 =?utf-8?B?U0xDaE5mY0JPUll6eHZJTmNrdXdvOXA0Y0ZRaWJDUGxQSzNZSjRMNXdqMmNI?=
 =?utf-8?B?LyttcEZ3Ni9lNFJvdXJSeS9UcjhGY0JYYmUycFpHZ1dNMkV1NSt6VDBXZ0dp?=
 =?utf-8?B?dDNwNDhwWjREL2h4SThpOXBlalpCOUNuUi9GbFR2U1laNDNtZzNsYWEyNWtZ?=
 =?utf-8?B?bUxMelVFcGRxNFdtY2pnT3VmU1dBU3hxMjkzMjlEWlZvb0d0WVBjR3JrczQ5?=
 =?utf-8?B?RWF1MFl6YVRtSXJRN3dKcUQ5eG5vdWdmdU5hbFZSc0cvUG1sTHg3OXdUdE9l?=
 =?utf-8?B?Si9XT2JnMTA4aGFnNWl2YzltbkszUVlPM1RGNlFRdHpkRERiQ1JCTVh4K2N2?=
 =?utf-8?B?eXdkNmZEMHA3cUpLQlRtRmxGZDI5bWREVEVSNEZJR0d3MGU3SHpNMkExaUxP?=
 =?utf-8?B?cys4QUg4OGNXN05rcGVLRjZPZ0JBWHFnd3ZEL1NBbVA0d2FQY2Fxa2x6cHhj?=
 =?utf-8?B?aGJ4VnhEcGpSZVpCUjZ2WnpCb1VvclptaEtsV3VvRGZ3VVYvV0JTN1E4cUJy?=
 =?utf-8?B?LzYzL3JMb0lsWWM4SlBJSUhqVUxhZ1gxTFFES3EzK2VnWnFYNlkrbGNLSHgz?=
 =?utf-8?Q?AQWKlnV2TARyi5v2TSoahag=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01916b7c-87c4-48d0-a6b7-08d999e4f5e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 07:31:30.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6q4uLdd6/b11hQZmZ5L/ccBg/CUvZDQhRqC6t+qCaqLQxnLupFXfrTCUEt3tIoOQkQp0kV4LYt4X8tNwugvHqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3833
X-OriginatorOrg: citrix.com

On Wed, Oct 27, 2021 at 09:07:13PM +0100, Andrew Cooper wrote:
> GCC master (nearly version 12) complains:
> 
>   hvm.c: In function 'hvm_gsi_eoi':
>   hvm.c:905:10: error: the comparison will always evaluate as 'true' for the
>   address of 'dpci' will never be NULL [-Werror=address]
>     905 |     if ( !pirq_dpci(pirq) )
>         |          ^
>   In file included from /local/xen.git/xen/include/xen/irq.h:73,
>                    from /local/xen.git/xen/include/xen/pci.h:13,
>                    from /local/xen.git/xen/include/asm/hvm/io.h:22,
>                    from /local/xen.git/xen/include/asm/hvm/domain.h:27,
>                    from /local/xen.git/xen/include/asm/domain.h:7,
>                    from /local/xen.git/xen/include/xen/domain.h:8,
>                    from /local/xen.git/xen/include/xen/sched.h:11,
>                    from /local/xen.git/xen/include/xen/event.h:12,
>                    from hvm.c:20:
>   /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared here
>     140 |             struct hvm_pirq_dpci dpci;
>         |                                  ^~~~
> 
> The location marker is unhelpfully positioned and upstream may get around to
> fixing it.  The complaint is intended to be:
> 
>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
>                   ^~~~~~~~~~~~~~~~~~~~~~
> 
> which is a hint that the code is should be simplified to just:
> 
>   if ( !pirq )

I likely need more coffee, but doesn't this exploit how the macro
(pirq_dpci) is currently coded?

IOW we could change how pirq_dpci is implemented and then that
relation might no longer be true. What we care in hvm_gsi_eoi is not
only having a valid pirq, but also having a valid dpci struct which
will only be the case if the PIRQ is bound to an HVM domain, and that
is what the check tries to represent.

I know this is not how pirq_dpci is currently implemented, but I don't
see why it couldn't change in the future.

Thanks, Roger.

