Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA96F5A42
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529249.823430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDdO-0000ZA-MH; Wed, 03 May 2023 14:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529249.823430; Wed, 03 May 2023 14:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDdO-0000Vi-J5; Wed, 03 May 2023 14:39:10 +0000
Received: by outflank-mailman (input) for mailman id 529249;
 Wed, 03 May 2023 14:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puDdM-0000S9-61
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:39:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fdcec86-e9c0-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 16:39:05 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 10:39:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5540.namprd03.prod.outlook.com (2603:10b6:208:296::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 14:38:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 14:38:59 +0000
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
X-Inumbo-ID: 3fdcec86-e9c0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683124744;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7nnX6IZ8Z2sVLN67lMjh6GA1f0VbnRwRssrhiTdYdV8=;
  b=dZg7uYWWyt2Oc62X6T3jC/X5OkWfdln9/sK/SnXtaP1Ur080td3HbezU
   8bfsg5kYjEnbStD7rzj59QFA3HhhzJMqJ6DA93YbP6Fz/yCZ17JspUoZB
   h97j3Zm+QIhaxDGSR+EX6l1rcLUYaXlCXpOnL0kJs0wvoENdAdnrYR+zU
   0=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 108134434
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jB6Si6BxslovwBVW/5Diw5YqxClBgxIJ4kV8jS/XYbTApDsm0j1Uz
 GNNXz+DOP+LMzf1eN9zadizo08H6pTUyIU2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3LknUFNcx
 9cidT0yfz6krdu54LCDRbw57igjBJGD0II3nFhFlWucIdN9BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xrvwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37efxHinBNlOfFG+3qZPhVuYmEESNDQTWXu28d60l0CyWOsKf
 iT4/QJr98De7neDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL86gKUBGECQiRGLsIvsMs7RzsC3
 VuOgt+vDjtq2JWeTneY96uIoCmpETgYK3cYYi0JRhdD5MPsyKk2jxnPR9IlF7Sng9ndEDT8h
 TuNqUAWl7gVyMIGyai/1VTGmC634IjESBYv4QfaVX7j6Rl2DKanaJah7Vzz5PNJPoGfCFKGu
 RAsmceE6/sVJYqQjyHLS+IIdJmr7fuYNDzXgXZ0AoIssT+q/haLcIxP4Tc4OEBzNcUscjvuf
 UOVsgRUjKK/J1OvZK5zJo60UMIjyPC6Ecy/DqyIKN1TfpJ2aQmLujl0YlKd1Hzsl05qlrwjP
 ZCccoCnCnNy5blb8Qdajtw1idcDrh3SD0uKLXwn53xLCYajWUM=
IronPort-HdrOrdr: A9a23:oHQ0WKzeNJf0CXoN5o9oKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:lMuyV2yUe+BVnTAysBylBgUyRZB0QG/v502NLnCpJ0FDcbK1S2efrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AfZpUQQxhj3AEIfhT2uPYrXxQGNuaqPyLDUYGz7g?=
 =?us-ascii?q?Hh+CBOQx9axCQkTq7QbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="108134434"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFn9piLntcqBiRDvDM20tk2/H+fLr0BlyqpfCdVjWUaTUjRslxU+qN7Gj3RJ/VZaJ5VZjlsrm+cBgXItwfqr2HpXGkXv+AXYq1voLGD/6EeL6z1bVi8vbG2xMNY3wN043zYoeC1AxAR7hnkZCClub1aTtrOaqgaKBxz5d5Ely2zobuJsvXy7d7N5Cm2V0MmUmD9KsjsaSj27swaXmjYLsrM3BZxq6yPOMMrdbW9nI/wiLXEsarammGIawpMrgHM/aDHNZ8jZmemh/5GjEameLVRkWEAa4lUTfoqlOV1xnQ28QaqgRerowXtdui3nFJITc/YMybF+Gw98ll6StyOlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nnX6IZ8Z2sVLN67lMjh6GA1f0VbnRwRssrhiTdYdV8=;
 b=jPqSbxkcszKui9XpuUGIhSTwL7eEIkvGlBFz8jOveArwmBoM+FWoWFM5TuNn/o0BusAEtz8PXOMkm0OCeNQEHpcCYol+whc37vHcQWIb2pU9BR+QmcrE7z4lx42P05KGTbBd3W64x6mKEV5mxg3mxKPIT9V/fnk740G1SDYxdrZe7TGfohOibOKnIDOdWgeUOBN8GE/pz6gAml9cv1BPrw73IUgAzX1SNvzAzxk14H0aeE06qCxUaiE0uIkEAc5Z2ux42LWt+2WGdTyDMIQbXITLxqExDl6SGoLXp9mQyEfo/v25Q7c0aNoGQ5LrRhjTrLCzabKm9tZrNw6sv7eZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nnX6IZ8Z2sVLN67lMjh6GA1f0VbnRwRssrhiTdYdV8=;
 b=gzYsfQbwmpw16HGqUOUv8XyT7do433Tg+SHcNIBIrlFPvByE+3HE2V1OOrk6orX5gGn4Vn9mblSxqkMasmR0VUsxi83t5mff0A+FDunaAch/dmQXY2vkjVEDY3oB+nGDERM325Cx+vNMP34WBnfIK48UEZJrESVXuj86++acYWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
Date: Wed, 3 May 2023 15:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: andrew.cooper3@citrix.com
Subject: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com
Cc: committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ab658a-78d1-4323-ae00-08db4be42136
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrGujqyEYLe/9uiW/wNnNr9FkT5l5Ub4V2JEwdyZg+lgH0VhIS7s2GTZC/aqcMELFTazl03Sfr037TQtt6sfwyEUsE/jxCJk5++Jdd2x+mlhLEwbcc+bQq1TQEmiv6qK2bk/vUl6A4/dqw2VQYkESFqJtd2t3/f7LN1GYd5f3z70WNvAOmy/PhOd1RINLdGW5II/Rv0ybFNwPabCpbGIaQFKmti5XCZSqJHPjBz6oa16Idh7ov8zJQpF7TzE67R41uXrHerDyudz5ZoEfv/qjsb4NupivK9lyrZj6crkGHOM/rjuhUZcitXTVprmzNyITQ/bmdNPnNpvYHfs1pPtfak+MKhQQpzDPalRW2mQtsc15Ps+4IEKdzGhvmxX8Cqm1GBALeUytNL/KKOlKOaaeJDPax4Q5NUeEwz0gHQ84fMxJnJyjBTaWMWO2owbaRINK26u07ZKzYuyafn1iaX/nVkEds1vE0+QOxfhHsmutm3YzleFqEs0Oei74qU6eXlY1QW1eTsIPpEMlgSTusD3ozikCfTAeegk0MOQar2wkQZE2LvIgSu7oUMDLyYACzYv08Nn645nfhD4SX3choMVaHb+tSrWZmb9PZyahe6ocKyLeV47Y25s4IwZN4y4Prcl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199021)(6666004)(6486002)(83380400001)(2906002)(6512007)(9686003)(26005)(6506007)(966005)(186003)(478600001)(31686004)(36756003)(2616005)(54906003)(41300700001)(66476007)(66556008)(66946007)(82960400001)(38100700002)(316002)(8676002)(8936002)(7416002)(86362001)(5660300002)(4326008)(31696002)(32563001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2xaM1lId3RrcUpiSitnb2ptN0dZemJYRCtjTU9CWW05ZXh5N0wzNzNIUzBi?=
 =?utf-8?B?bjQ1aEd3Wm9zb1RoZ2NBOENnaEtSRWpmcHRocnhlVW02elhBcXRQclJkYXdW?=
 =?utf-8?B?VENzVUNNQVRrRDhuLzd6QSt0cDR4ZlRPWHZTbUJYZmJTTTNpOTdOUXE5T2Mw?=
 =?utf-8?B?dVc2NXNLVEt0Kzg3WFBLeEZRaEZNL3VYOU1BWXVhcHc5THBMV1AvM3dsU3h2?=
 =?utf-8?B?ZENmeWg2WVlUN2w4a3RjZ0tibDEzeDFiZnJ6b0NDaE5pRDZjNXFvVDF3T3FL?=
 =?utf-8?B?c25DM0ErakRuOGE0clR5OURYYXNwaVJQREVQK0J0SFlPemxXL0dDQnRsWitF?=
 =?utf-8?B?WVZma0NSNnBxU3hxSkdaQjVMbzZOWnJoaTI1Y3V4UVlIdnNpUktUdWQ5eFFS?=
 =?utf-8?B?VjNOY1N0RVJ3dnhQTVBaTDBybWJ4UlBoeitJdENLbjFrRmdaU2xhWm5iOHlC?=
 =?utf-8?B?MkJ6TC9NaEJscjRDSkR5eUNGbFVFWVhpRDIxZTR6SndVYU1qT3FMMmZyQXNE?=
 =?utf-8?B?NVg1bHk5UTJmUGNaclVpSTNMbU80OXNNdU9xbldoTzBSdU84WUxUSHlMNGVM?=
 =?utf-8?B?NVY5VWx6UDZralZHWG5pcG40WkJYSlVFWXJESHQxOTU4T3Z6Z2hIRDVLZFFD?=
 =?utf-8?B?MFF2N1VXNzF4WTY5Z2RtakVxYmd5K3ZNMElrRjVGQmlpVnBKdFcvOGtadmk3?=
 =?utf-8?B?ZDBBdVJQYUd4MDZ4Q0pNOWgvTWlsSXAyQWh1VXNLbmx2TVlISFJXTWhvNXB3?=
 =?utf-8?B?UzI5WDVoMGtQNjhLcVU2aW5uMlhUSmpWaWZLT1h4d0h5V3VGMk1vM3E1cnc1?=
 =?utf-8?B?RElnMHptOHVIZktnN0g5cE93elM3bjRNdUtsWHdjbDBmeEJLWkNVazUwQk1V?=
 =?utf-8?B?YkNyU1NTQ2E2MGd2bE00a3o0dlMvT3RWVVdwZ3RxcVFaVW4wL0RmZFlOVGxP?=
 =?utf-8?B?SHk4cE1tWFE0clRsTitNcGc0UVNpZjBUMzh3eGptZnJxbjVORjhXT3pSNm41?=
 =?utf-8?B?NnBTYkU1eVVHWVU3WmpsQXlFaHNDUEpKeXd6Q1RDcXFXSkRMKzl6dTZBcHc5?=
 =?utf-8?B?L3YvQUZqQ01xbncxZzhvbzNwR3M4SUt4WTRwendENGN6RGFsVnFiaUdJSU1j?=
 =?utf-8?B?SStUZCtlRHBHMG85Q1dDeFl5eTY4bHI5bG8xVWQ0SFVVb0hZYXEwUWJtbWV0?=
 =?utf-8?B?cW9qUTROejVUUzN3NjNTeVNnSTNnb3VqNFZpVlA4MlY2Wm8zSktjZjhlcFk2?=
 =?utf-8?B?b0M3d1FFSzhHM2drNDJoWlZqeXJDa1JLSUxJL0VBcVBUN09PZENJS2dMdmJM?=
 =?utf-8?B?QU9STUpwaS9DYXIrbHNMalljbzJSS01OL1dGS05EZkVlV2h1cG1kU1RIOTQr?=
 =?utf-8?B?djZENnRqQkt5OFI3Sm5ZU0ZwRFBkcUQ4YTAxblZFcGFxbWM5MU9ZRndjZmxj?=
 =?utf-8?B?V2J6VEF2SDJ6VUtxRFFaMVR6N3hXTEV2VzVLbGMxZW1TU2g4Q1N2K3pMdVJ5?=
 =?utf-8?B?R1FFSGxoUFZQWFFSbyszVElHT0RzN3NlaGxIcEg4aGN3U1BSaFl0dHU3Q08x?=
 =?utf-8?B?c3I0aXFCZXdSK01heWxDdTZWa2doSGVhT1FhRHZVMWkxOVBCV1dDTktSRUFx?=
 =?utf-8?B?U3pkWnByQXVyNlRwQU1xQ0V3blFvMWx2dTNZUTVYVFRMQXpxb3N1NThGeC9k?=
 =?utf-8?B?eTRyS0NYTy9kMGdrVXJ1M0NNN0xtMVYxanZTWW54bFpXbTEvWm8vemJuamdM?=
 =?utf-8?B?cTNyZ3VhblRqTEdqaUdkVjdkZW1hTlFZdVhlYWVMOExEQ29HNUtvRUdKVGMz?=
 =?utf-8?B?L0JQK1ZEYy9PUjVHdWZ4Q3pXMFoyczhYMTltYTFtQWN4czFTbkJsNjVCWkFq?=
 =?utf-8?B?VGJCdmxsaU5RaEdwZkpFMERnc2pqdTNqTXRhSGx3aEFCVEtSOFd6cXF4RXZD?=
 =?utf-8?B?ZEZSNU5hdGtoYlNYb2V3UGU3TG9QaDRibDZ5ekFmaVBIUWN5clRrenVXTXQ2?=
 =?utf-8?B?YU40WERsTEpxSzBwQTFCVWF0a201RUduK3hTcGdMK3ZLMlFXRkc3NDVIZFRL?=
 =?utf-8?B?Qm5meHp5U1Y1U0FCN2lMY2tabmN1Z0dzT0RxUFZ4SFQyVk9kN2NMTGtiWlI4?=
 =?utf-8?B?SnczamI2ZTAyY0pKQUlrTDRjR3Bsa0ZqYWdENHpkbEhFdDBmbUFhekRYZUlV?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?QXNSalNvSHRYNVhUSnpyd1QrT2M1emlKOXliK2p1UW9tQjNWQXlNMHY3eUJk?=
 =?utf-8?B?MVdlWjdRQ2hUcTc0OEJvMTk2eEdvRksvTGNGTHhyc3hHZGg0eWo5VURlQTdU?=
 =?utf-8?B?Umd1UzZGc0F0bVNzUUtYdCtqYy8xZ3lpN1ZlcTQ1d0NRd0todXhuNUxXa1ZL?=
 =?utf-8?B?V3BkVExablRiQzd2QUJsSWxlTFdNcWh3UkJ2WXllRGlLbkxya3I4amRNMyt1?=
 =?utf-8?B?ZHpUaWE4THAvR3MrOURRWnNOSU01WGhIZXMxNFlqR1dXeEM2dTVyMnI1bVc3?=
 =?utf-8?B?VTJmQ3BPQmk4dHFaOGgrTDVjYkIzenRzeFQ3NXZOcmVSekdTa1NKT2hkMERR?=
 =?utf-8?B?cFVyWTcyR0VHak9PZ3lqQXZPTXVVMGtTV3gzTWh2bWptS0JJaTI4d1dncVJV?=
 =?utf-8?B?aGg2WGRONGlJS1dKbGZOckJSOXNaQjM4Sk5Ocm55VlYzQzI2NDU1blV3R3Zr?=
 =?utf-8?B?aUdZNTRlVkptN1VqVjNXdjZ1ZGdFU09tdU9xZEJERWhDZXlhZTJOSjlibGRq?=
 =?utf-8?B?dnh2SDJsZDUvTDEwKzdjT3ZCZWpxMk5Qd0UrK1dvL0tLUDVvWU5iM2xNUTg2?=
 =?utf-8?B?UXNqN3k3UFFSaGxDQnRPa3Z2andsdkN1eExhcUF0MGlCS1ZFTkxKRE43RThu?=
 =?utf-8?B?UktkazhzQzN6a0t1RkJOSmQ2ZGgvWlovZVBhME5WUHI3dys2N1h4TENKMDBS?=
 =?utf-8?B?RHlqUnNSL1VwbTBJSjhwc2QwRkMzSnZYSUlLN09rMXpBL0xFTUgwaGc2R3d0?=
 =?utf-8?B?WTduWXhFbjJaZXpScnVCd0RqYzNBTEtRaG1qNDNUdVMvR3VzNVZIMTdCVmxN?=
 =?utf-8?B?Wk1kSkZsRHFqOVF2RlRscTJMSWM3YlU0enlNVllKZ2pjcmc5TVgzQjFUWGM2?=
 =?utf-8?B?aFZRQVgvb2Q5b0xMVFhhUGJCNS91b3VTdGg2VXBYRE0ySndsa1JTNnNNVjFP?=
 =?utf-8?B?Wmg5cm9WTElrNnNMVW9lVWdxOVJ1eHBZNml3bzJjOENJUFRJam0vbWJQN2pI?=
 =?utf-8?B?SmZGUkt3UStrckxNK3F5ZFI0MVRlZWpkTmY4VEdxVDBCRXVkejBhRkVrQ0xZ?=
 =?utf-8?B?UlJQNlE4ajlQZ1ZWR0xoMlF3VmllT3pVSFlVZUo0Z3c2QWtJWmN1eXBGYUhU?=
 =?utf-8?B?WGZvYTc5OUVHMGo0TDFHNU5UQW5hQmtPM2RVRm9ZZEZZNHZocDJkdmwyRlFP?=
 =?utf-8?B?VHBpQ0NnN01YakdMKy9tT1REeXV1V3VJcTluSjJxSm9waUphQmM2OGd3dlhr?=
 =?utf-8?Q?fJBimSaZlby3L6T?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ab658a-78d1-4323-ae00-08db4be42136
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 14:38:58.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLQMm52kx4Mj1zuwWhofrXQ4WgiMJxOneYJkNfWPOAH5xtYsc/NTsSrHyJnIYeSHIhyYtEizNdUmwYaa03JuMUQH2Y3LakW9UoD8xg0qDG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5540

Hello,

After what seems like an unreasonable amount of debugging, we've tracked
down exactly what is going wrong here.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4219721944

Of note is the smoke.serial log around:

io: IN 0xffff90fec250 d0 20230503 14:20:42 INTRODUCE (1 233473 1 )
obj: CREATE connection 0xffff90fff1f0
*** d1 CONN RESET req_cons 00000000, req_prod 0000003a rsp_cons
00000000, rsp_prod 00000000
io: OUT 0xffff9105cef0 d0 20230503 14:20:42 WATCH_EVENT
(@introduceDomain domlist )

XS_INTRODUCE (in C xenstored at least, not checked O yet) always
clobbers the ring pointers.  The added pressure on dom0 that the
xensconsoled adds with it's 4M hypercall bounce buffer occasionally
defers xenstored long enough that the XS_INTRODUCE clobbers the first
message that dom1 wrote into the ring.

The other behaviour seen was xenstored observing a header looking like this:

*** d1 HDR { ty 0x746e6f63, rqid 0x2f6c6f72, txid 0x74616c70, len
0x6d726f66 }

which was rejected as being too long.  That's "control/platform" in
ASCII, so the XS_INTRODUCE intersected dom1 between writing the header
and writing the payload.


Anyway, it is buggy for XS_INTRODUCE to be called on a live an
unsuspecting connection.  It is ultimately init-dom0less's fault for
telling dom1 it's good to go before having waited for XS_INTRODUCE to
complete.

I am going to start by correcting the documentation to make these
details clear, and then figure out what is the best set of steps to
unbreak this.

~Andrew

