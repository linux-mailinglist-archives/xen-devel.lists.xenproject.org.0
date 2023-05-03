Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17B6F53EB
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529039.822949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu8MU-00014L-6b; Wed, 03 May 2023 09:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529039.822949; Wed, 03 May 2023 09:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu8MU-00011f-3T; Wed, 03 May 2023 09:01:22 +0000
Received: by outflank-mailman (input) for mailman id 529039;
 Wed, 03 May 2023 09:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tguP=AY=citrix.com=prvs=48085cdab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pu8MR-00011Z-Rt
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:01:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0edab7a3-e991-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 11:01:17 +0200 (CEST)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 05:01:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6478.namprd03.prod.outlook.com (2603:10b6:510:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Wed, 3 May
 2023 09:01:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:01:07 +0000
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
X-Inumbo-ID: 0edab7a3-e991-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683104477;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uHpfFcdAXwIgkMT8P5xBrItPuaNsQy8c7pMU+K0M+mk=;
  b=YIU6XQ8HcgJ/bVSiK0R2x6c3e3ZMRDVvLNU6L6wjh70rEhZ2+FQBiIzW
   7bwmDCqpbGKicp8EsVvZhvQUY9JYcjPii15a4hdXksVMGeMoDWsiZ5Gik
   8qY+fEZmalxtTVHm9uIlmzNzMyP4HOSzARH6+D8nLpuGViE5MK/8wHe9K
   M=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 107704670
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jdsSyKBRX+LTXBVW/9Xiw5YqxClBgxIJ4kV8jS/XYbTApGh20WRVx
 mRNWzyPbveIZTfwe9siaoq39RgD6seDzdNkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0+11IFwf+
 6YkNz1Qchuqt8mUzLy8Vbw57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xrvgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPdrS302rGQxUsXXqpCMbO31vNBgGSv/W8PKlpGTla4+aeQ3xvWt9V3b
 hZ8FjAVha077kmiVNT+dxy+vn+fvxQYVsZQEus18wWEwOzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLiJ43pgLCSJBkCqHdpt/oHTD9x
 RiaoS54gK8c5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhithbZOhT5yl7x7c9/koEWqCZlyIv
 XxBl83F6ukLVcuJjHbVHLhLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfIfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:0BOv2q8laMStvgsvEXBuk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdkTN9VLXJOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyPZ3BjEwhhbCQrgKdLZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:sOS36WwxDsCyMdlTexHZBgU9EcIETyzTlkvPLhKkAk9ZY5+ZR1iPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AfgNDAQ4WeAJZMqELBVPbVwtKxow4xqqhKE0mkaw?=
 =?us-ascii?q?6gMqYF2sgIDqe1GqeF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,246,1677560400"; 
   d="scan'208";a="107704670"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a04QjF8cUxkfO3hpRqGr6wKBWdSA9N+NibetoKJimr0CJPRKJPnZqafsCkjNvnpdaANPPSrc9Qa1hI501i0eyrXR0eLDRI9IDY6x/AZJasF77hXh0KW63Jr4Kndm2DRHUZw5hWRy8ZAaluXOdf1cifP2MYTTU5jEdEgnzWvlnpPRgUMi3ft7bUqrUrn1X9uuMNpKyv2Ql8y0NE21yU8NpFqqdCGnpGIRdtZfkJgpaLbZBID1OhsLXbN/2p2UYJHJTAEizWEje1PUk7aRVlpu5oGfU+mkDsSJFocrUCTBqstt1vkN+hecn9ZyIUcuNpcxdIqMKJtWb9BNTks9F/B8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9zylJ9wiT91cpmea72jc3/pwcQNSdq+sLu8ekS/W6k=;
 b=UiqI3sJueayFAY5WTMRufMa7nKI72KuykVgQVzUDZtZFagmAG0/SFLwBL5hGZYbz7GfKiQeFtPdb7jeSx56kjiLU2wrRYTx1Pli1r7TJpoJxtbhsewvMUklqUcBcySqAj6G9tDJ/Eh+e1OmexAoZNS6ME9G9myDF27VAMMPjCEIG6DS5Q1PhzWxU0dHRXCoGaMdgo/nCT+gp97fXRTACYBuPAtwME/CDPPfseaEJ3CAMBu2+KrY+RkdP5QaE69vuEg+3HOfvCZHeEW5i5V7Uc4nA8tiZsTfXJ2hQQefmrUtTnKcGhSL9Q3/fTsBVvN2SPSBS1LkQSGc83Js1Ct6/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9zylJ9wiT91cpmea72jc3/pwcQNSdq+sLu8ekS/W6k=;
 b=vzZ/OWxPi6N0TdAfRPzfyC2P1tYFwtyvTXKzisAstgzd5fEKpWxq9AyQyTuIHGBFoO5FYoUHg5pFBJAl3gHWBq9/DYuhk6O608Y8v0klN88/U+Jfd6r4MFjycmeVWAT95gvQosNUB+WN33UOHliCY8IQkE5E6wSpqeLPUjPkYtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 3 May 2023 11:01:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 1/4] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZFIizbiltUCtz4Po@Air-de-Roger>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <f799fdc6b6899fa65a07eae0d6401753f7d61ef2.1680752649.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f799fdc6b6899fa65a07eae0d6401753f7d61ef2.1680752649.git-series.marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc9a1a0-45d1-4b0b-3ae3-08db4bb4ee8b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6OPqI/Kux9wUr+CKQ3nLOHe5ODt5ftQUkFh+Pb8IeIqjZ4wiPHhFQLpNuMW4nAMzFeDLpHZsPzI9fNRLmIx9io/dK22SQJGV+X3xOhxhoDaT1Pu3JGxm320dW20MjI4WfH4BucSca8SwFcR5PsrgLuc53FnRGEEnPFl0Ht/R3SV+0JVHBgjjDekshnQGbLPGIGwtNKA++DINRqpRTUboycfszynXMEWxem/t2bxW4je2nfRo5z2O9HhyTH7fpXiKo0AFJeAq7ILv0QkZtFBZ4BUuFU/b/WW/2LGbXeAwLYPzbAzQt/ZyG6+vDdAFuwNxKc2Wy8pJtuw/m+l0+jGkCpsAypeA0b29r4Ac9ah/lder8jI0mUM7PM6dLWpZcrm0fDnI0+O9D0SiIB4wtxYZgfnHksfW35EPGoo6EhXUsNj9Jl9l6cLqE+b4cbxPRmAW4hVYCwPqwTCNms5ZAwLaxf5j8VjtrFNx6x0lNgmVttqsKSHy//SbumEbAMzSnd1ZvdigaRwn0Ghcmqggs6iV0KgKPgJR+QpfTzBQ/2p5uzRZ1V8gD7rcgyN86C9vhLHB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(6916009)(5660300002)(8676002)(86362001)(6512007)(83380400001)(9686003)(26005)(66574015)(186003)(33716001)(82960400001)(6506007)(38100700002)(8936002)(316002)(6486002)(54906003)(85182001)(41300700001)(478600001)(6666004)(4326008)(66946007)(66476007)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUQ1YUN2Ty80WXA5TEZwZm15UzVnaUlndUtmUFlSZXhOcHZSMGdGZ2M1N25k?=
 =?utf-8?B?Z3R2YmRMaWFKNHRRcXptSGtQeXZnUTIxR2dzZ253TnBOL0UwdEhVOFhveFYw?=
 =?utf-8?B?QmdhSDkyeEE0ZmZxcHA0UjJVQnNpdkxreTVXdzd2d29PM3ZxSFpmVDhHTGdY?=
 =?utf-8?B?QjgzQXA5TVlWeWVobXZIaVg3VEk4eDc2Q3UxaDl6QytjZzZYMGFVdWV5bnFW?=
 =?utf-8?B?ZVduUHpSRndxY0tCeUhvTXloM25RSjBRcFRpOE9aWUhJNW4rK0FLMXEvaU1N?=
 =?utf-8?B?SW5XNlRESjlHN3FjejBYNlJFMksxK0F4bGhwbHJGM1A5Qzlza2RPWld6blE4?=
 =?utf-8?B?THowbW15a1RKZTZSd2V6M2NHOGRYSno4Q3d0aiswRjV2bVRHNFZ2c0JQWnRi?=
 =?utf-8?B?bWJXcXVIbUM0KzRCanRNaFcvUWJsQWQzWHlZa3VJbTlsbXNzcEd6TmJlUGpK?=
 =?utf-8?B?aHBXeDFoL3cva2VnWWI1QU5XOURnNG1GWis0N2JPby9BUHdjbGtpTjYyeFhN?=
 =?utf-8?B?dDRNZXZ2M241VjlYRHNzdTE0S3NINGIxa3RJUThFOGZBN2JHOGFrV2p4OXd0?=
 =?utf-8?B?MzEwQWRLMm1rcXBNeXpnUVFyTjhhbnBsVGxoeUxaUlVNa0cxOEpVMFFwQmps?=
 =?utf-8?B?VzQvcXg4SWN0VWtYanhVWFFnMWJ3VHFJQUpkWmt1OUJweGZobm0rVFpTK2tR?=
 =?utf-8?B?aHp5ZExaNUdIVXoxZEQ0MDY0cEJZRGs5d0ltT2E4czZ0MDBXeFF3aTdreGlE?=
 =?utf-8?B?M1hkNjNMZlpzVGlzNU5ld3plUlNQaWNSdkJHZGR2Z0trbk0rcWdTbFNhdHla?=
 =?utf-8?B?N2xLOE5iTUdUWnMwTUw4ZXFHUnJ5a0haa25NZkZsTnRTcVZneDVoVWw0NElQ?=
 =?utf-8?B?amV0ZWhwRXJVd1BZT0o4RmVBTUF5NStjMElFSi9JWldIQlpwUGQ4RnFMSjZk?=
 =?utf-8?B?NmIwVEdyNzgvejdWZU9ROTBrSjVUQUUvOWNTUGxKYUhnYTZZZEJiQUM2N09v?=
 =?utf-8?B?YmFXNEsvdWtLcHV5QWFtMUJ0djJLczRnRFBjenhjK29HQkRneDJQa21wb3dW?=
 =?utf-8?B?TStSUjFKZ0pYNGFRS3YyM2w0N2gvdUh4R3JUdzNUaG5LQnRHSzFseFpaQTE4?=
 =?utf-8?B?VG10ZVp0V09VTTVnamxrQkdPMHArWmM2K1diQS82QTd2SjZEQlJBemFLWmo0?=
 =?utf-8?B?eGp0KzNuRXlPS0huLzBpYVE5SUViRnViL2F5R2ZXeUhLYWNjanFXODVlM3JV?=
 =?utf-8?B?N0JFT1Z5OTI2Q1dTc0tpL0F2VUQzcFd0VVFCRG14d2h1WVpFaEMvSm9qZEtn?=
 =?utf-8?B?cXpXRStuMDI0aXQxVXpvS0hncEdNbC93R0dSUlkxN2M2MG5LZ1dJVkNpcTND?=
 =?utf-8?B?VjNkdU8rMVlFMEdNc01mUk5zRVRreHFpN3pCOC9RbFUxWnFKd2xtQVZTaWpB?=
 =?utf-8?B?SGlNaksxY1BobmNDcXB6MDJNSnBpMDZMeDE0Ym5iVFZManFRK21zRW5MZmFo?=
 =?utf-8?B?a2dBOW9LV29HY20xQlJwQ0FIVjZDbzF2N3pkQUJJQW9UTVN3N3A3L2JOSVlZ?=
 =?utf-8?B?bmdSRzdiNzBwY3R1VEYvNHJDUGpnKzlPNEZTeFNuVXpmODlmQ2laOEJKM1ZU?=
 =?utf-8?B?bVNBVGlOTmQwbkNZMnFXUk9rem1aaHVMU3l4dW5FRlZBS1FTR3l3N2RLbHFo?=
 =?utf-8?B?cDI1SXl4dEk4N0wzVEtoa2I5aFcvaHRoaVFsUXFUWVhvSUl0WlpKT09mUitm?=
 =?utf-8?B?c01iQjhaZDdYSnRtSDJDVjJiOFd5dFEyM0FyeXFrWUt1TElxck1WZ0hsVktF?=
 =?utf-8?B?VG1zUmpOL3VxY3JiT1Rya0l0ck9IcTV3NTVJS3MwSmUxWWNPbUhwcTc1NmxH?=
 =?utf-8?B?MXpFdGhrNHhoN203OEt4N3AvOUs3TklnOEtrbFBIMEx4Zzkyd3FQSFdabk8y?=
 =?utf-8?B?OXIrbzJ2TEFqUnF1Ty8rMDBtZHkydEduS1hrTnpPRC9xSjN4R2dQbHU5eTgx?=
 =?utf-8?B?NUt2dzZya1RwVHlzWVRpcnRjV3d1TThJbDA5dmZYbXdOVUVBM1FUZXo5QW42?=
 =?utf-8?B?d2NIbU5yM2pDQkN0SGtjR3drL1FrTjI2cTJ3Wmh5bFFxV0RCeGZjSzhKTUl2?=
 =?utf-8?B?VXhLbHJramtIZDQybWxOWWNEWWFwbTR3YmpUTjZkYXJjK0RFb25vMWNDdW0y?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HJC4Qw2E+uy3KMPfGkCmiLojakkcS/9hCju5rNr985KLEGZ8+GK1DkjFQtWmUXW8aK0FbP/fYTBvGrI6Yzp3IzmSvuImLbFMZBtxl83UGLXK98CjmZNkXKwtN1RWg2RJtKuDWlXeYPOySD6Ey0s4pFMLOBhH3FHkIzYneBsV0WbqZyvTWu565AHwhn/hhsRStz+j1GzVmx9VGnpqfVY69vcQ9F/kHfaYN6uLv2tAIzwWQbJr1wKRWfh94j0uz6RzgPGdfU0L6NCOiCUGGBPSFXbLGjOGM81qq9GP/f7DQ9BhBGFh/FxkmtU6sJp4a8KsmLnUWYEZV7sLtnR0ZMYENp4JPUjlgj+cB7RB7xIurQXkqoK1jwnA41++0EAjcdaGqVqTqrvhiqTNGt/vkHtfbjXBu8Su60WTGRdntgva2up/p1jBPIuzO3PsgiYvOktiTuuPRFq3bcXKBKqdADL/xm24ufNxWSaPaf/8mBPUAul+WBZLq85oICpZIqi9sXPXB+xF7Kg3LHCtSHVyZXVk3GCPWYifS5aM6Lio5CdGcIrDRPwk7tQxxPs+KBdnDt6EGbc0BDJpu/8zy5X9CY+0HxAmR1XFN6AVThqV4PkQGzV/Eed1nQfbe1ShdHIt1MOA8r1ob/KmLiUJYFZvKaBTwiIrSQ6YGhbFZozsuSBq7lqmuIRBHk2fCjcFliAGgBgzq8i1DgUFCIj/gyWsjRJyjEb/qW7bgATrGFqibed5fDgcSU855ueZUMlU0lCjo/fpvi3ujmOod4yPod/UpYRhOCkm9LIS5V0ehfxcOwCkFBV2ZfarCvEAhfH38YfhOEJn4i18AzNgnm/yrSZPcaTRIJSe6RQQ289KNVv38YXBWpqMotZBXtm9oBG+GE2C8wITwbsHgX0Jiw+ZFnBElTFtvJPn8xsjcE1+alJm+xjw2O0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc9a1a0-45d1-4b0b-3ae3-08db4bb4ee8b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:01:07.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFgL2LF1+GL4tWZDI5M9FWLaeFkFilc/uVeeTX3cKPKmZ7TFX3u97zZbsllIh9cO9gT4DVZYUIusUHy3EuPK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6478

On Thu, Apr 06, 2023 at 05:57:23AM +0200, Marek Marczykowski-Górecki wrote:
> QEMU needs to know whether clearing maskbit of a vector is really
> clearing, or was already cleared before. Currently Xen sends only
> clearing that bit to the device model, but not setting it, so QEMU
> cannot detect it. Because of that, QEMU is working this around by
> checking via /dev/mem, but that isn't the proper approach. It's just a
> workaround which in fact is racy.
> 
> Give all necessary information to QEMU by passing all ctrl writes,
> including masking a vector.
> 
> While this commit doesn't move the whole maskbit handling to QEMU (as
> discussed on xen-devel as one of the possibilities), it is a necessary
> first step anyway. Including telling QEMU it will get all the required
> information to do so. The actual implementation would need to include:
>  - a hypercall for QEMU to control just maskbit (without (re)binding the
>    interrupt again
>  - a methor for QEMU to tell Xen it will actually do the work
> Those are not part of this series.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> v3:
>  - advertise changed behavior in XEN_DMOP_get_ioreq_server_info - make
>    "flags" parameter IN/OUT
>  - move len check back to msixtbl_write() - will be needed there anyway
>    in a later patch
> v2:
>  - passthrough quad writes to emulator too (Jan)
>  - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
>    #define for this magic value
> 
> Should flags on output include only "out" values (current version), or
> also include those passed in by the caller unchanged?
> ---
>  xen/arch/x86/hvm/vmsi.c        | 18 ++++++++++++++----
>  xen/common/ioreq.c             |  9 +++++++--
>  xen/include/public/hvm/dm_op.h | 12 ++++++++----
>  3 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 3cd4923060c8..231253a2cbd4 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -272,6 +272,15 @@ out:
>      return r;
>  }
>  
> +/*
> + * This function returns X86EMUL_UNHANDLEABLE even if write is properly
> + * handled, to propagate it to the device model (so it can keep its internal
> + * state in sync).
> + * len==0 means really len==4, but as a write completion that will return
> + * X86EMUL_OKAY on successful processing. Use WRITE_LEN4_COMPLETION to make it
> + * less confusing.

Isn't it fine to just forward every (valid) write to the dm, and so
not introduce WRITE_LEN4_COMPLETION? (see my comment about
_msixtbl_write()).

> + */
> +#define WRITE_LEN4_COMPLETION 0
>  static int msixtbl_write(struct vcpu *v, unsigned long address,
>                           unsigned int len, unsigned long val)
>  {
> @@ -283,8 +292,9 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>      unsigned long flags;
>      struct irq_desc *desc;
>  
> -    if ( (len != 4 && len != 8) || (address & (len - 1)) )
> -        return r;
> +    if ( (len != 4 && len != 8 && len != WRITE_LEN4_COMPLETION) ||
> +         (len && (address & (len - 1))) )
> +        return X86EMUL_UNHANDLEABLE;

I think you want to just return X86EMUL_OKAY here, and ignore the
access since it's not properly sized or aligned?

>  
>      rcu_read_lock(&msixtbl_rcu_lock);
>  
> @@ -345,7 +355,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>  
>  unlock:
>      spin_unlock_irqrestore(&desc->lock, flags);
> -    if ( len == 4 )
> +    if ( len == WRITE_LEN4_COMPLETION )
>          r = X86EMUL_OKAY;
>  
>  out:
> @@ -635,7 +645,7 @@ void msix_write_completion(struct vcpu *v)
>          return;
>  
>      v->arch.hvm.hvm_io.msix_unmask_address = 0;
> -    if ( msixtbl_write(v, ctrl_address, 4, 0) != X86EMUL_OKAY )
> +    if ( msixtbl_write(v, ctrl_address, WRITE_LEN4_COMPLETION, 0) != X86EMUL_OKAY )
>          gdprintk(XENLOG_WARNING, "MSI-X write completion failure\n");

Would it be possible to always return X86EMUL_UNHANDLEABLE from
_msixtbl_write() and keep the return values of msixtbl_write()
as-is?

>  }
>  
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index ecb8f545e1c4..bd6f074c1e85 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -743,7 +743,8 @@ static int ioreq_server_destroy(struct domain *d, ioservid_t id)
>  static int ioreq_server_get_info(struct domain *d, ioservid_t id,
>                                   unsigned long *ioreq_gfn,
>                                   unsigned long *bufioreq_gfn,
> -                                 evtchn_port_t *bufioreq_port)
> +                                 evtchn_port_t *bufioreq_port,
> +                                 uint16_t *flags)
>  {
>      struct ioreq_server *s;
>      int rc;
> @@ -779,6 +780,9 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
>              *bufioreq_port = s->bufioreq_evtchn;
>      }
>  
> +    /* Advertise supported features/behaviors. */
> +    *flags = XEN_DMOP_all_msix_writes;
> +
>      rc = 0;
>  
>   out:
> @@ -1374,7 +1378,8 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
>                                     NULL : (unsigned long *)&data->ioreq_gfn,
>                                     (data->flags & XEN_DMOP_no_gfns) ?
>                                     NULL : (unsigned long *)&data->bufioreq_gfn,
> -                                   &data->bufioreq_port);
> +                                   &data->bufioreq_port, &data->flags);
> +
>          break;
>      }
>  
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index acdf91693d0b..490b151c5dd7 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -70,7 +70,9 @@ typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
>   * not contain XEN_DMOP_no_gfns then these pages will be made available and
>   * the frame numbers passed back in gfns <ioreq_gfn> and <bufioreq_gfn>
>   * respectively. (If the IOREQ Server is not handling buffered emulation
> - * only <ioreq_gfn> will be valid).
> + * only <ioreq_gfn> will be valid). When Xen returns XEN_DMOP_all_msix_writes
> + * flag set, it will notify the IOREQ server about all writes to MSI-X table
> + * (if it's handled by this IOREQ server), not only those clearing a mask bit.
>   *
>   * NOTE: To access the synchronous ioreq structures and buffered ioreq
>   *       ring, it is preferable to use the XENMEM_acquire_resource memory
> @@ -81,11 +83,13 @@ typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
>  struct xen_dm_op_get_ioreq_server_info {
>      /* IN - server id */
>      ioservid_t id;
> -    /* IN - flags */
> +    /* IN/OUT - flags */
>      uint16_t flags;
>  
> -#define _XEN_DMOP_no_gfns 0
> -#define XEN_DMOP_no_gfns (1u << _XEN_DMOP_no_gfns)
> +#define _XEN_DMOP_no_gfns         0  /* IN */
> +#define _XEN_DMOP_all_msix_writes 1  /* OUT */
> +#define XEN_DMOP_no_gfns         (1u << _XEN_DMOP_no_gfns)
> +#define XEN_DMOP_all_msix_writes (1u << _XEN_DMOP_all_msix_writes)

FWIW, we usually interleave _XEN_DMOP_no_gfns and XEN_DMOP_no_gfns,
ie:

#define _XEN_DMOP_no_gfns         0  /* IN */
#define XEN_DMOP_no_gfns          (1u << _XEN_DMOP_no_gfns)
#define _XEN_DMOP_all_msix_writes 1  /* OUT */
#define XEN_DMOP_all_msix_writes  (1u << _XEN_DMOP_all_msix_writes)

I wonder whether XEN_DMOP_all_msix_writes should be a feature
requested by the dm, as to not change the existing behaviour of how
MSIX writes are handled (which might work for QEMU, but could cause
issues with other out of tree users of ioreqs)?

That would turn XEN_DMOP_all_msix_writes into an IN flag also.

Thanks, Roger.

