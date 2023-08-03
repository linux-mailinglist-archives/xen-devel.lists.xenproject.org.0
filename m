Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D776E8CD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576342.902361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXnp-0004LI-C6; Thu, 03 Aug 2023 12:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576342.902361; Thu, 03 Aug 2023 12:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXnp-0004JU-8M; Thu, 03 Aug 2023 12:51:41 +0000
Received: by outflank-mailman (input) for mailman id 576342;
 Thu, 03 Aug 2023 12:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1P5=DU=citrix.com=prvs=57264c000=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRXnn-0004JM-BN
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:51:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aefd3bb-31fc-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 14:51:37 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2023 08:51:31 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6093.namprd03.prod.outlook.com (2603:10b6:5:394::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 12:51:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Thu, 3 Aug 2023
 12:51:27 +0000
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
X-Inumbo-ID: 7aefd3bb-31fc-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691067097;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=adqGrAGCprXngJsaMYxsvJRmFQlWxll518DzORMmq+Q=;
  b=FnMr6v7mDqUgmg/AEcImhaKtjrc+rqbCB/Y72iHPGsDqJNrl4MlWAp3Z
   FaASwGK3K/K9dfPWzn9ntWvkL1r3t/hxcrTVVo0ZUq7g8o8awMa9+yyCO
   13JkhGJSR+CHOSq3c5innBIZ2MsADi43JLIHK9Yb3i2+V7adC1krj5xEB
   Q=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 117065075
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SgTkLKid4bZWQAs1IcwpVwUjX161tREKZh0ujC45NGQN5FlHY01je
 htvWTuGP/eIMWD9fNsiO9i0oUhSvJGHyt9jSgJo+Sg0Qigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AeFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQYF3cWVCKipNmv7+q5Utlop8YlNpDSadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTnrqA32ALOroAVIEMcBHG5m7qWs0OFYNVTO
 kwPpy5xkpFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLmUIUT9HLsAhrsg1bTcu0
 UKF2djuAFRHvLSLRFqH+7yTrDf0PjIaRUcdYQcUQA1D5MPsyKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarTwLzcqzelp5yMRAhl4AzSBzuh9lkgOt/jYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:E8+enauQsbxWodBuh8sM23ZW7skDctV00zEX/kB9WHVpm5qj5q
 STdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bGYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIOb+EZoTJB/KXHCKjTKadD/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3ACVqaxWlXstoH/jr1bYmY3CxFcB3XOX3ii2zqEW6?=
 =?us-ascii?q?bMn9GEL+NeVux+qV+yvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ASLNk/Q7be0waWcSs8bqZekAbxow26fWECnpOvqw?=
 =?us-ascii?q?LgPKDOT1wIGqZ0wuOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,252,1684814400"; 
   d="scan'208";a="117065075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMl8J6+rmgJOM+vwXFvNL/nqhnNxIbosCWwQhzZ/SZuRUaJ/eOrC4mvt8Ko1OO7eIGEp2D+3qUtKxOIaX0uRvJ+Q76vmfp8XrX9xWm/UDOZIAY14WS96/QUl4HppQ2TMvh5Kag6OHSg1nqdrMsZiARByvUZHEtH9T1LQmYfgcuBBYgckyzYYuj2rwR4HvmADvh3PdW6cluFtUlrXniL1xc4zM0IM488U4veKidU9XftkKpgNMwGAMNJ1whz+55nGb8reBiOS6NSs8orHI9eJbB+v1LF16K5UxRzYfGR/cBTPGNTF0xT277dcezowzQyx7Ys7YGUtE0OrBPALSPYVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw34/tIROxtCDfAjyyNkLhBW3hDuKbFih0AXS74ocU4=;
 b=Idu4DWiD7r7BJ5xrijCTobw+0tgvyx10qx+YrqlRWPpPnGK2fxpbUp5zCS8kTQqhOT7s7Gvq9DHbKItjIXdLoIPIbYEfL3Ccu5cEeN0TpF6MU+jlE379jTTYLsohcEpYQDJnxk5xwXDNKDO2LIhcS7Q8anoH1NNYvvB686W2MuEWsRRs1G/pKr+iz+k+u3pyIVUl/+FlRXHoHkuXP056kANkZP18ly5ikpur3o2iDbWnpWLhNfoW8NtePGyx+67IGgb97JjYFQAZWlWpV9yXvhs5fuU8LJgNtgLPPMGAi72dikYNY8MISkGS70Fxc/cGlOOxZg51IbRIp+K+Qqbd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw34/tIROxtCDfAjyyNkLhBW3hDuKbFih0AXS74ocU4=;
 b=B2rvw1WK4OtW3dhtMnjBjpT7jfKjLxId7FkLPZ7XbTN6ASMPM7q5FIJbNdninSDIGltmND0zI5Hbu8O4/5PtEbzFnBTnxFoadCehLKppEddDP+QQrOYg4seq6QGFt+fOm2xqHmS3T1CoRNW03lnGUKgg7dqJ5qiKLxqlPxxoFTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ad50c7bd-e51b-d0a0-7f6c-46092cd8a2fa@citrix.com>
Date: Thu, 3 Aug 2023 13:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xenctrl_stubs.c: fix NULL dereference
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edvin.torok@citrix.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <3b6374c44ae7e4afce427a9ea852d8d1ebbb42b3.1689236671.git.edwin.torok@cloud.com>
 <99d89bce-42ff-f6e5-090b-3b9f8e130e66@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <99d89bce-42ff-f6e5-090b-3b9f8e130e66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: d0050bda-eb27-4438-b192-08db942059c6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3da4OCLChehWo14Oi6S8MmYDLhhyHXlgg3iWZlpGmay2v2n5PNvE8faQTPF5Mof4gSljMATilRARCM6j5zrET84W+n/qJZosayyi5rcW9hSKs27ztd5jBYukhCshgMEovHUeaagiqdiCUlL3z1S/wWEJw9mrg2wHf6FjUHZ8UHD0L0IWHYWfhmodEH9NvkFle8pphpNCig3v4ZK5HqtKIs+/UgF7j9unkEIebXTAqqEp73Hrf7eL3fjxz3LjXvDrtp7OSJ5Ci9RbPJRTz8j3PuFtjpPJoZPrNERcHqIvBmA2lH2FtVOgEWZ5di9wj07r4hlM6z+4o/+1MwGiL1TigCHivBR2VPd2nCOeUqGQ5BxERmT8xFc0dyhjD+3o54pMQtVq91ks/wHx1XCQIM7jHg866FqW2Rwda7I5CpeYPGpckOSEuro81yxQZ8nQfnOWJPNTfWXzSLaszlgamopn7NiMnC25NCDMu0IS+Y5mnxmYooGYIbAXOOILlrdd8PHfCWV+lfT4srh08PuJG0LEa3PgFzeZEsayeVso3KQEK4ignoaJO99bZ367zsZcYoxotN63LCnIT6XeTsSUhpR/hb5PoWE8eVF+Xlq9VBDW01S2cCC7E0ckBCoIDOKGTURPJ+fehQUH5187pRYG/c35dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(41300700001)(8936002)(8676002)(53546011)(186003)(6506007)(26005)(86362001)(31696002)(2616005)(38100700002)(82960400001)(316002)(6486002)(6666004)(478600001)(6512007)(110136005)(54906003)(36756003)(66556008)(66476007)(6636002)(4326008)(66946007)(31686004)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXM1Q1pyYTB4anpaK2s2aC9pa041MmJ1WHc0UUdsMG90NE1EcVBLcTJ3ZnJu?=
 =?utf-8?B?YTNHeTNPNmJWNWhnYTZPMHh2QVJIQVJBS0hEWis5NzM3QzE3aXowc1hjR1lo?=
 =?utf-8?B?ZS9CV2FEUXNBNUtsenJ5bFJla05Fa0hyNmd4YURLSERianVlTGxIMU9hd2Z6?=
 =?utf-8?B?ak94NmlOdnVHeEE0S3ZZYWJZTlVxVlRRSGpBMUNqWGhWbXV4WXNPRldXWjEx?=
 =?utf-8?B?Y1RCdXFycjdTaDE1K2lPMWVIbC92R0V3c28yTEorelYwNkpDOFF4cm11K3Nm?=
 =?utf-8?B?Y2JJVFZJSnBvRDA1SE41bXJMT1loUnRRSUIzNzN5b0ZDY0lrUXhBaWFYVFpJ?=
 =?utf-8?B?M1dMaEZnN1RCQVQvMkkvRHR4MkVIZlcrTVI2V3lrbGJUWnV4SW1qSUpwQUZ5?=
 =?utf-8?B?c2ZtVzVIWGtaYy9Yc0tJODhYdmU4WUIyTEFPSklsL0dzVTU0YU44KzE1d1V6?=
 =?utf-8?B?UGhRUUdrSFJleGlkOWdhZ1BhUW1hdFVRdE1IUUdXcktCZC9JUVhkcVdlZ2l3?=
 =?utf-8?B?SGMyKzlNS2kvYkJkQUpDZ0lGVEtjekJBazVxbWFPdmU1bUNabUtvZkswUlk4?=
 =?utf-8?B?cHd2WlYvSHdwUTlWbjBYTW9tWXZlaE82Kzh1VnBEdG1DVzR3Vk1uU1U1bitM?=
 =?utf-8?B?dkZ2eUUvelFGTjhOQi9KZUJoeVpUS2k1NnNZT0F1WWloaVYraGg2ME5zWGx3?=
 =?utf-8?B?TnpZa3Joa2xzUCtvaGNCdmJ2RTZ5STE0REtCUjloZ2pWcG9SYno4TFk4Wkxa?=
 =?utf-8?B?b0loSVU1aEFRbDRxR1RYL2c5ZFVrcnNBT3Z1R21YTWVvSUdMbHZqNnRXb3Rx?=
 =?utf-8?B?bUZlVkt2RmdhbjVLbTQ5bFZrVFA5NXRnVEcvMTlyV0FWRzl0L0M1RFI2R2J5?=
 =?utf-8?B?bkgyVWVTTjNNK3QzZE9JZWM4RW01RUpydE42aFdIQlcrbGx5UmVmd1FYczZy?=
 =?utf-8?B?ZlJqeU1ZQm8ra3JuYjJIa1lEZ0VzK2h0bVRqcFNKNDFoYjBkWm5pWlVIemti?=
 =?utf-8?B?TXRiTGkxRi9BREdaNWZDeUNKUXduMXRKV1paZVQ2a25aM3F4R0ZsMFQ4ajlN?=
 =?utf-8?B?WDlpZTRnbnIvWTBNTzVlRnl4ZVlWaDRqLy8xSk1QYlc5UVZ4UFdqdDBBYmhp?=
 =?utf-8?B?VVpWdVRGSzdraEp0WDVIUkFOYUJXYnR2Rzk2TWdmeTJxblRTVmd1YnhhT3o4?=
 =?utf-8?B?N2R0K3VHR0hHa3UxSmZYTHZLQUV6cFhhbHJRd2JRUko5NDlSQ21GZ0FoY0Jm?=
 =?utf-8?B?dFlKT29KNjJ2T3l4d28yaWV4N1BDbVZ5M2RucjM5OWsra29GK1pTTERpL3Bk?=
 =?utf-8?B?c0NRQ2c3Q3Y0VkhJdWU3bVRBSmxDSitQUXZhdGRoeUtmWHJYZDA0QXhZK1FJ?=
 =?utf-8?B?TTV2Tm1ISTlLdUI4QXdoWTFiYUQ0Tkhma1RtbWV4bjVIQU5NYzZsNXNnTm5J?=
 =?utf-8?B?aE83a21Ka3A5Wk9FYzVsME1TYWJNb2tLRHlXdTZwdDI2YlMrYUF2MnZlV0dJ?=
 =?utf-8?B?aXpCQ3dDelpYNFFrT1oySit3dWRhZHlPOGhFUWhvcFNPcE9Hcjc0a3NWbTU3?=
 =?utf-8?B?QlpBVEYzZElGN3lNR2d4dnJ0cWdvMmR1NWhCUStqQmpBR2FDUDluWElnb2xS?=
 =?utf-8?B?TUplMGdDWXVHNU1ySlI0L0hOYUY5MVhRRTAxd1RORlhyTElneTc3d3ZIU1FT?=
 =?utf-8?B?SWVJYzFySm5oQ0Qza213UVN5aXpwOWJzSFdyZUVxTlVUSXhmanFJM0d2Y1NW?=
 =?utf-8?B?aVNoVUNobnI2UEtjQlBhVFRrSjZQcWpDcVlveDM1dFNWdnpSS0d4VUYrSWxQ?=
 =?utf-8?B?cjhLVnpZWlZLQ01wNlM2ZnB2OElZeGdYaXhWdnpTV250cURjVTJBWXNRYlkz?=
 =?utf-8?B?VDZ3OUpnZm1TWitSU29iZzdQVVYrMzZQbkFKejBZVm9HdFQrcForTWhRTHZT?=
 =?utf-8?B?NGMreW0rTE0zanpybXQ3QlFObURxbkhFNjg4dWVCWXNWYlpPaDVlcU43cjJu?=
 =?utf-8?B?aEd0cHd6c2piNG5NUWsxWUVhYUw5YmJNdUdPSlFNblcyR0RMUHROWUZIcHRy?=
 =?utf-8?B?aEh1WHFzK2pMT1BzQUFvd3pad0ExRlBPSUFiRUQ3VWR5Q25zems4eDZucnI2?=
 =?utf-8?B?RDkxeVFPa0p1VUlYOHpzYUo3aWo0M2NUMW5iT2MrK3d2WnZzUVFWTXlTRzdn?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hoPQnJJ67WjNY4QKBS8JiF79hGnPdmL+c5LXO6EM2BGTNHEe5y13T0N6Wiudy7K+OKhACZi8VZOo+KWa14ZgC9mXCs+QVB9riSVR209i7e0L4X5DVfykxsJygx5yZDdZFOZCYE+QbrEjekh80cHzTMHgIuimdaQXxlIFWz0LkjI5b7pRNmMV3MPurRRQWV/Gx9AomZ9ST1g0k+I3w+4E/4jCfZjOJGXNi/VDqxNRAndbo9I+oLxRBkR2Oe3Gg0eLuL35uMTylALkKLN7FlqENtzaCAssAargEWlsLV5X7AQpnjmqjOUmkaDbuGxWtu6M2IvbV/zQhte4lhGdSQYSWv0u1p6NgXFlEhRStFJecpA+byLoRYMfEbKCg0Qnqg/5xIoW+uAI0tOcTvEvAjYZZBQjv7Ntk6mz5eH8807L1xFOebUBjuE/XpdCBCTB1KdUYIRYqLasLevEYSjn3/nInq6+tlPMu2BgUOuhmoaZI+M/g/J5hsDt0crHKpBzZ9Tb+kToQlSsvoBS7pumJQ1em++nRd01v46jrsK4P2sgN8wrpmXqmza1QGMmpuunvY31R3/9KlFvUgxGLavrt6LNKwhKOhBMGLAas510ExixoSJXQcLIdHGA8z5VpXBGvZ+K/tpCisYDRm5PONFRTlmaeyElU2eElOfHZuPTKv2m2F9pTA8x0U9AwhDtXq20oV9YUBiNqtA8gZLpThXrc8rFyisqU8BY4UEajhT9e1reaEmo1b57LGZt4yKGAQAdcS4rE1r0UJfdOuh/7R6ldR70budh6H8WJ2LRQfyMqnGuTtaQhSFP88o9buRkjcJnG56N5nWqZlQrbRq6DXE4sboh1etCDiqsHp5McLpLyMgaoiIURs3GrhuVLkrmqVP31F0E
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0050bda-eb27-4438-b192-08db942059c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 12:51:27.2214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blHg4m2M0BuBj4STHRyA2Dc+amuROE9V0VYwBnwQ0usKGtBW9r9zHdzGyIcVt4nP5rIqT2eSf+mKmFs2ckxR+0F5Aoi4Q/YN5UE6HzpYYf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6093

On 03/08/2023 11:15 am, Jan Beulich wrote:
> On 13.07.2023 10:30, Edwin Török wrote:
>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> @@ -832,7 +832,7 @@ CAMLprim value physinfo_arch_caps(const xc_physinfo_t *info)
>>  
>>  	tag = 1; /* tag x86 */
>>  
>> -	arch_obj = Tag_cons;
>> +	arch_obj = Val_emptylist;
>>  
>>  #endif
>>  
> Since, aiui, this also affects 4.17, but the patch as is doesn't apply
> there, could you please provide a suitable backport of what went onto
> the master branch?

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c
b/tools/ocaml/libs/xc/xenctrl_stubs.c
index facb5615776b..7de2ff544428 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -748,7 +748,7 @@ CAMLprim value stub_xc_physinfo(value xch)
        Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
 
 #if defined(__i386__) || defined(__x86_64__)
-       arch_cap_list = Tag_cons;
+       arch_cap_list = Val_emptylist;
 
        arch_cap_flags_tag = 1; /* tag x86 */
 #else


This logic got factored out of stub_xc_physinfo() into the new
physinfo_arch_caps() as part of the ARM SVE work in 4.18.

~Andrew

