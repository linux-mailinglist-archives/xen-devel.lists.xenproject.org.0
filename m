Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1B4BFA07
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 14:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276783.473071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVer-0001Fd-SW; Tue, 22 Feb 2022 13:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276783.473071; Tue, 22 Feb 2022 13:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVer-0001CZ-PE; Tue, 22 Feb 2022 13:56:49 +0000
Received: by outflank-mailman (input) for mailman id 276783;
 Tue, 22 Feb 2022 13:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CiU=TF=citrix.com=prvs=045c9559e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nMVep-0001CS-T8
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 13:56:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b084b6-93e7-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 14:56:45 +0100 (CET)
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
X-Inumbo-ID: 44b084b6-93e7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645538205;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=MYRtT8uT8744+VKmxHIq/+avEby5jH4sm0atqcMiDUo=;
  b=eD0XLCwGGP96NzUABm0osiTo3K+gRAeJEpJ7X2P5HPXzGmP/YKDVtTdh
   5K2kT2TNl9Z6bKxZqKvCypbudfJdbrg/jJeLmugzVNbzMSKyKRMoBK4Gx
   6eKtbjP8ScKRl+80864lWhQEEwNoDXHyOy2u+gJkA19Zw+NsZvoaSBnYJ
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64723452
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:onZ+gKL21i660CYmFE+R7pUlxSXFcZb7ZxGr2PjKsXjdYENShmdTz
 2cWDW2EOv6CMWb1Ld5zPI3n8x8HvcTRm4VnHQdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NNyr5q9ZgEVBbLrsrgfaDJHGgBVZbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls2ZoVQauED
 yYfQRlDRxrySh5UBkweK4gkpd6ZgFjeSgQN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S31j6t4n+qwOjVkkvTWp8WFbC+3u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonSJoxodUNp4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTpQqruYZnShzaizh2+wAgMKJE4pPTBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2KBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9KFoSXLkWd4umwWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5C6yKP4cTOMQoLGdrGR2Cg2bKhAgBd2B2zMkC1
 WqzK57wXR7294w9pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ/wfwOz7+Qp
 ivVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:1JRBiKsXCy1g3uTvJv3TJrP87skCgIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hqAV7CZnichILMFu9fBOTZslvd8kHFh4xgPM
 RbAtdD4b/LfCFHZK/BiWHSebZQo+VvmJrY+ds2pE0dKj2CBZsQijuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuokprdT5CvgglLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P7crhIJGdZM8qJiMexvwqSylChPgHb2gLtBEB07w
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64723452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5HPiAO8iVnuJlCZjy3m31OlVOMw0fLpKXQai2cks6KCFGBfNzoxFrGo7bCdhxj4tmymRF90pfHKZS1vy4meIIRKnfhYiP/khIc7IHb76qXepmd+23hHTQ7MPzGSRfsj2eUUhtbbWOHfwaQBqXVuWN4Jjt7hOjDSsPVAHAmeYCu8UMyMh2Ou+yL7NnHJ9smDv939m4pYb55LRhu9uVaazT8hgrMpNn9aEZC/NCLrJDEoBpOKVoNRNfDcVYlKR1ly7fsptLxfvVHtT1dRjkSfoa70x3UZZrcR74CjHeqKCOqI+G156E9shkoUbDfkDyb17HcxScS2AlyLRyUhkw2U+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXgZLc8DG7SimeaGHF3QjfgAel9eg/yXjacOv/wVI3g=;
 b=JvJwAcguLxUpl+SSrgiGud2vLLW3SrsTi7s+eyqNfuAJk/1oEEfXDGgdw5ZAkrkL5YKcNC0aS4KLxOezbBJBZEYX2hxtqqh9Q/tdOCyIGy83u1YEHHK2wi3KBX2uFLVlbIzTAPZN0nkkv5cO9wMTgm3vMaHfrTMXr4B1B65z5Y/PDtwwWufUr0BqfKxMJLPi2v+eBfgF0QPTGsD7RaS96t76gOIRe2rfDYQWA+NKgmQmIaH07/RP4BSJi8h1E99CVp5vBsPwMxY+EnoUjQjW/OSz6H4xs085Pt+oMJlpEgjDpkvXAMKNthIBsr7L+r0ORv850jN4KUYyWP2//ZkrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXgZLc8DG7SimeaGHF3QjfgAel9eg/yXjacOv/wVI3g=;
 b=dlWpI/jyJEGm7hlTG1SMQjetwTpTV+fARugwQkwax8YtfI+rmOz3OW8Th9b2jvHl+2Liy6Dm4ALPvoNM+v4PfuvnxPNyIUztCkN8VPOuhr1SfdDsAEHrkL7TG3/x5vIGnk/Y+oBZ24QP3sltUltQ5lGcPi6w/UaIXhXB+6sdHxI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] cirrus: update FreeBSD to 12.3
Date: Tue, 22 Feb 2022 14:56:29 +0100
Message-ID: <20220222135629.68769-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ffb4936-069e-441a-ebee-08d9f60b26f3
X-MS-TrafficTypeDiagnostic: DS7PR03MB5381:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB538198C3E0CB3C8C578214E78F3B9@DS7PR03MB5381.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SARGb4ffxTayYeetzkorDpw2w9HSEWZGzZTXDg/Nr+LE3xJmRgI7ygP3+UBIkyavjDB3nCPtwS8T9Jbv/zQ5p3/SFEuTuOdED2xqlGy3wFGmXyavoTX8EX2G+7nOvqcAB9l4Oe/Gc0cAo0NhkInQ9F5j05ViT0Q+/c4KMdm8sCC2YX8Gfs8bTIUFaP3VzTlAdebNhPj6HPwh8FEROtJSlIJVeqg0n6ZMjimnMYXWH6V7WT9Jo0AFXsyXtmkqUmyH/r4V07YbY0zPzCK4v1X9JP98hYI9kpfuiMa860/bo0Yiei9buPw8S/txBludGXHh+bhei1UAXcP+EAuFIXiYAMsrxeD9vbIdIVY2USm+JP/6VsJc3DE68n9GIy7c5GUdDHTMdCl4F/onQDvZkxXOLg9SU23Nb3/VrULJ2YZDzERS/nuOhGK+fbInOijIQlhLIAXt5h+SUt73/34obSW77BwDQRzzBXoVC23806W2AkJWONt2XPhWo6D3LaSe2GlzqxE/kcgTGtGdRqY6c57VE2pB7DwfKD7sMfKViudSpYTygdemJe8DbrcWG7t6lOybI2CzQmaZDlOdp+aZ0TOTpNqQwIPM7/56dN103C6pc4R3Ot2zggPwtBvf++p7UrEAR7oxTOcn7efcxRy23e38Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(1076003)(316002)(82960400001)(2906002)(6506007)(4326008)(8676002)(66946007)(66476007)(66556008)(36756003)(6666004)(26005)(83380400001)(54906003)(8936002)(6916009)(2616005)(5660300002)(6486002)(508600001)(86362001)(4744005)(38100700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnFtQnlUYUFaN1RFRzJCdER5RERoN3JVYXI0bjhpS1ZTakNJc2JmbFB4Q09r?=
 =?utf-8?B?bnJuRE43WStBcStwbEtPYVEzY2l4WFZXM1YyZHRFczR2QTU3eDZudzNBeHdq?=
 =?utf-8?B?TzkxTWxGMHJ0ZU1YQUVyVERHZlg3Nk9UWk9jUVgzVDJ0dThBWDBXUGVoSlNJ?=
 =?utf-8?B?Y3lrb0Uva09nSXZnWXhvTndsR0lPTTRGeVJzNTAxWDlJMmhtaE0wMWRKNzFC?=
 =?utf-8?B?d1k3RWNiZ3d0VlpZU3NHd0xZZzMxNkg5Mlh6WGJ1V2xkS05YcEpNc0hkaTJR?=
 =?utf-8?B?TGdPWCtYYjRhekwvL0NFcWpkcU02YSs3YzFBeVVWaGR6NndBMDJkRzZIZ1lN?=
 =?utf-8?B?bExrM29XYnR6emRROVFmQlNqR3NRbzRHN1hFdnVtTVJYVlR2dUdHYjhhVXYw?=
 =?utf-8?B?Mk5rY0hxQVNqWGhONXIzNm42UjBEdUt3VDdPUW5BR1Y2YnhULzVUUEk1bXd2?=
 =?utf-8?B?dEhkbVZ4alRBRWI5eFZnQzdOODloQU15VHBIQkhKa1pyYXJ4L0FsdU9KeFI4?=
 =?utf-8?B?bTRpaWtqTGlNbDI2MGdwZlVDQk13dU9YZEM4WkJLdjl2UjRiamovUGcrenZP?=
 =?utf-8?B?R2w3Z004MHdVSWdJcCsrTWRDVHBrckZLVWRVMmNKekNUYnlldkRxcmg3NjM3?=
 =?utf-8?B?cWs1bTB1RE56NWxjV1pUaGdwSXd1Q3lMMEVWK0ZlVDBvYWY0WitEbmROZ3F0?=
 =?utf-8?B?TXArd3ZCMnZqMU5zTnprNmdTdGRxZ2E4NXlhZkRrSXRhVUJVSHpxT3cyK1pp?=
 =?utf-8?B?bkYxd1llbG80Kzg5SlVaZUxjZHdxSmdOSy9wREluU1NFVm1PUVhhVTRKYzd2?=
 =?utf-8?B?Mjl1TnFOSXBjS3g0Y0J0QnAxMkVhS1dOMWJyd0EybTVRQ1hER1FlRXlrYTMw?=
 =?utf-8?B?aG1xbXpCUzhnaExQVnBSdzBrV3ByS0F3bUozRXdrenRnMlVtWDk3VWkvMXlp?=
 =?utf-8?B?cmt3am40Q1ltbHB3QWZHTTIrTk5ROUpodDV1aW5MWHdMMUZXS3MxTG92WUEx?=
 =?utf-8?B?VWRWL0x1amRBaVZyQ3ZaeXIvQzhxcGdSUlBRWFNQb0ZDRVZ3L1daZ094Wldk?=
 =?utf-8?B?ZVMxWHRTT0x1RzdVK1FBUGlMblVXZXR1TnorZzZHNkpYUk9JRFhMV2JDcEto?=
 =?utf-8?B?aDlHZll6bVdHdmJmRE1XZ0JQN3htMk1TcUNCWUxUTG9XV2YzVnpWNnJzYnJ6?=
 =?utf-8?B?anBiYUFFQjRsUG1qT0d5T0l2dlBsOEZjVWpab3NKWFFZbmVDTldJL0tSVUpx?=
 =?utf-8?B?NFZXekYyVmFHR2FMeFFFUFE2ZjhaRFp3dzU1SzQ2akt6RWoxdktkRzAzaGJ1?=
 =?utf-8?B?ZWdzM1VzbkRHTDV6Z0RIM2FEcHlEQ0VURzNKb2IrTXRHbkQyS211aEt3Uk5L?=
 =?utf-8?B?NG80ZGVnZ2drejdkWUY4MmFidnZLelY1dTFuT0FRaDVjTTc0MUdyVDZZR01C?=
 =?utf-8?B?YzNaQ0lQT2ozbGpoU0FYWGRVbDJGSmc3R04xRGdFd2swSWMvbWJPWVlhZERR?=
 =?utf-8?B?OWlpS3oxQkNDTHJHZVJSaWl2d1RDaEo2SjVUbC84ODJiS1FuUVQ4aGVLMkJk?=
 =?utf-8?B?MHhUbDk3ZncweExyb0FKVTJjUEtWNjd4REh2K0FIczdITnV2N2tkQ3dpQnli?=
 =?utf-8?B?RDR5bVVVUDREa3prV0lUQk1KSDdSeFJ2MENwZTZXSVBhVnQxVC9kZVh1WFRs?=
 =?utf-8?B?OHFRZ3BRTFFrcWR5a0tyWHl1T3RzL0duc3RySUxYM1VRNEFCL3M0c1BaQzRl?=
 =?utf-8?B?VzV4aHdVYlg5L0hPU0tjUGlJUnFCVmxiWEJsbi9EZGJxM0hUTHJ5MXlCU044?=
 =?utf-8?B?djR3NmEvSG52S2lJQ2hjNGdQbmJYdDgwQ0EzRXFNUlh4ZUlDUDJvMS9mTUhi?=
 =?utf-8?B?M0NuVzhpMmU1eUIyUnM0MktxRzlhb21yWHFRTEhMajBHcjZiZFYrakQwWUhT?=
 =?utf-8?B?ZFV3d0h5M2NSUi9yRTdDVW0yMTZENnpvd3Q4ckFhK2lsTVhwQThVNktuWnF3?=
 =?utf-8?B?dm1oWW9Gb0o0SVJCWk91K1h3UUo3RFlqMzVEY2Y1OUpjaER2VjVuWVdxNXI2?=
 =?utf-8?B?b1pCWXovdXNHVGdwRDE3V0lMcTBpNXJjRmdsa0habHgwQ1g0MlYzTkdGNENu?=
 =?utf-8?B?Z1pwNjA5bUc3RVN6V2hYSytMUWJoVG8rc0FTZlppRjVEdzh5SzhoWFMzVitw?=
 =?utf-8?Q?Bcj9ZoX1c91UQ1uljtqkgDc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffb4936-069e-441a-ebee-08d9f60b26f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 13:56:41.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LhV7Ca3DBRHRZlxuunUUWm/1Xb7y6A+/7mYjetHkiGFz0FMrBZXjZaPXfP0pi4pHluiamwIdw8BavaTdWBd7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5381
X-OriginatorOrg: citrix.com

Switch from using a FreeBSD 12.2 to a 12.3 image.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index b17f0b6369..4ae719136e 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -16,7 +16,7 @@ freebsd_template: &FREEBSD_TEMPLATE
 task:
   name: 'FreeBSD 12'
   freebsd_instance:
-    image_family: freebsd-12-2
+    image_family: freebsd-12-3
   << : *FREEBSD_TEMPLATE
 
 task:
-- 
2.34.1


