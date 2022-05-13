Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BF525FB4
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 12:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328387.551402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSeA-0002fl-36; Fri, 13 May 2022 10:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328387.551402; Fri, 13 May 2022 10:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSeA-0002co-04; Fri, 13 May 2022 10:35:46 +0000
Received: by outflank-mailman (input) for mailman id 328387;
 Fri, 13 May 2022 10:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npSe9-00025y-3k
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 10:35:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70feef92-d2a8-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 12:35:43 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 06:35:42 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2819.namprd03.prod.outlook.com (2603:10b6:404:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 10:35:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 10:35:40 +0000
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
X-Inumbo-ID: 70feef92-d2a8-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652438143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=EX8DjO3x+uES7GMB/ApBUCFKRspkwrUVu39cOAc3Ito=;
  b=dIBbWAEazl1gZHuOjK00O+yvokLm8zxVKj3S6JQW0SJllVS1fT6Svg8l
   4b9ZSvlUZwqnswMLAxa+ENpYNl3707EXzb7nRqFVpDWURPqKqiXtoipm6
   64gTUAuI9ngJVn+FyskvkimHHdvOkz8B/L+t7gECQGSnPRkBtQmXqA2J0
   A=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 71235120
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kMtb1a5s7PuMHHtROlF3EgxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 jQYXGHXPfaMZTD0eoxwat/g8h4OupfSnIM1TgppqyA9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSRW1wsNbCLyd8MSjt9SDhbOfFLwL3+dC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YGjF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IB8gnI/PBvi4TV5CV0j7LcG8LJQf6PfYZVjEuz/
 2D+rmusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFDpZMoV45IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:xxzw7qvzHZ/3HnGxNaIBl+RY7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUsEPpZmfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71235120"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctqs3a4ifXq1KPAcbzNjOkFU7dx7UEAJGAN5MLhX/TwFFhGljgYFRqoxBZod1Y38vv1SMtHijxLBogHzVQGGMMicPKF74x+Ys0qyiu3r1/AVneG5PvTnZgKJv3w3Dh8SM9jo8XX1SEgXjrrbv21trTuLRy1D52iJHcINZkDtS2BMpQDXSFwTDCuoX3cf1q9ZNIIMVYmtsID5gxJVz+o0DQuEEKeABxBNen2lAP/SxxnQ6dTv1p8ESyuB3GeRDh/Cr2WsG0IWsLlJlhdRmqjEqeSorLGA6qOgcUlcwABpV0wRxJhZeMFXYCytZKbZbfgKF2EST6uTtLAiGX2tuE/Chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnAVvmktKCaV9DrPCyu46JyVh4QfkUF3mikDDEyic9U=;
 b=l16zDjWeG9Cm0gMVAtrHUInUcOKnlo9axOI68UKB6yzmkPUJbvWJyBPYpBmfPNpoDZCwlPfjs7XyazGhJnQjCK3gtHUi1SzKkQ+gxpBeaz3I+EwXwYUeTY1WHuSzu4WrWnLrWEyHuZdyRzH51IcGomFVLeaH90iuvVhzS9qZmZgp6hYCUFURUluZkOuu6AtJ6PWZDYA1ho01ywTXaBZFjnU2qaL6GwUZ2V347WWREHH9Mlb/ZKQOAjVot7o0C1ClFsDktWpKlwyadWPDr7buh8hllGsg15lXK9usUTZLU88SI8o0hyZ+/YcGnzf270kqtRY7ED8tfU1l/Zq6E4sx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnAVvmktKCaV9DrPCyu46JyVh4QfkUF3mikDDEyic9U=;
 b=T2KeTVIKMzU3wWmII1o2zdRcgAY4ZwMyT0/xby8YZtyoHb5fWfTzqx0rB+6fT9MTMGjVLaZ2AnZcrHR5IKi9LvhzU+n8UzFCuBSt9Q8Vt01zsyKOqKLX15oj79N2wrrXU5EaBjh69Te+oPkC0kS6knBo0MQnhJvz8MwcR1qDKxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/cpuid: set MCDT_NO for non-affected models
Date: Fri, 13 May 2022 12:35:00 +0200
Message-Id: <20220513103500.3671-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220513103500.3671-1-roger.pau@citrix.com>
References: <20220513103500.3671-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 219da0fc-074d-4881-6af1-08da34cc5394
X-MS-TrafficTypeDiagnostic: BN6PR03MB2819:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB28193B86A063EFD5C56A10A78FCA9@BN6PR03MB2819.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K99q5Wn4884eSMyR5rWfx1+tuOTCbfinK5gGYOMdn8DKqyhKZhk+XTAlmJiIiWL0VRO3sSp1aVLmGGMR4GhjgsniswIN42ExQhjuHT4nzyp+yzAjTW0zMLwmXrxKe8rR3ibwhOejGUe1QKbSSelKHoWO+3VTMm3/GQ2N6JkLasYexV3kmdXRSOlDBNOCz1l6GAxYZVVAgqqCgS8XnEqRHAzOXhmW4Cl+B80eaPM0Aw2LhBO7mJ58i047jPcD8RO7UT/ialVKDNbyQjY423NC74NI0rk4aTZKBKShpIizQ5BzPrpe7dM8MSCEGGNmBCPLvezVTJ1AxoRQUTYYD6oCUGXrdte2m6+q/IBnj90m9WzRaAJsJzRMBU99Mu3bKUkizj6F3FeiRSIoiRDXLs0H0p4Dor/caIsK2meJLZiMStNXJgwzU0ePbtJXlYweNraD0nNtcUpwysPel7kQysKfBnr8AyhkAO8zYiIIeTISZnz9VIxLJdDyYg33nv+H8ZBwAOG+7bw/hPfywp5GD/dcHtYUVH/7SURBM5zw7Z2EnxmCAHFKVKUGN6Uaeid+X7GoVQZaZNyAKty1RUeevpvtaxCp4sGiDvhFgiAZMSce8x92kMxPVYCb36M0t2YkcQa18m1GGhN2sYzZwuji3b5nAtOdM730rOz9CZYC9zzdeYYs9DSw+DHoFPpBj14Rq/QD5NRegk8O+wjvBnCLK6hB3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(5660300002)(1076003)(186003)(316002)(6512007)(66476007)(54906003)(82960400001)(2616005)(6506007)(38100700002)(86362001)(66946007)(66556008)(6486002)(4326008)(6666004)(8676002)(36756003)(8936002)(508600001)(2906002)(83380400001)(6916009)(170073001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGQ3SGE5dVZYc243SjYxZE9xay9VZEl4MlE3RVh5c0JkRFpHTnNDRytIMHF6?=
 =?utf-8?B?N0Jlb1FXRzQyTlZ4ZEhaTlRxayt4OXFCQlhtN1RkV0t0TFV0ZVU4dytUbzIw?=
 =?utf-8?B?OTFvbkJ1Q3RxWHpxTjhtbXlCQ00yQUJ0YzNYN2c2VUhaK0JDZTh5bzJuOEM0?=
 =?utf-8?B?RDRleFRUbzdqU2g1TUp0alI3T2JwRFpxU0s1VTFOWXFyaXFFZG1tMEhUeVpa?=
 =?utf-8?B?YjB4c0Vzb05lQnpLaWZoYVR6UXNKSDFWS1lha0llZWVmOHozZWJDOENScVlk?=
 =?utf-8?B?dUhDSUVmVzVXNzVnTHhoSHcwM0VWSElZdnlWdUhad1VWWDNBR2pSMGFicTcz?=
 =?utf-8?B?YmhaTUFGeTBEOFRraHMrTTJqbXpNMHJOUUZRS2JYZGJ6T1krUHFwNmZsdEFu?=
 =?utf-8?B?SVYwRWZ0R3grbVJiTzlBNlhFSmNQY2Q2dlpKbEg3K05zdUlNYVVxaUlQWGZH?=
 =?utf-8?B?VUt2OUpXRWg0U2twR0pqL29yREx6ZFpuamp5S0dzVjM2R0daRTRMcHJsTmRo?=
 =?utf-8?B?OEk1RWtaeXJOZHRSQjljR2d2R2NKemQwQVdpR3hBTDgzbm11VFo3aEZxQ0NZ?=
 =?utf-8?B?bk9KMkpwVGt5Vm9uanB1SVhVNTM2dFE1S3RpLzFNYzdRdnZUMXpHNWswenQ3?=
 =?utf-8?B?aVJwdnBDRy9ZUWo4Qk4wV3JCeDhudVhzTDZ6K1J1YSt3UGxTL241eTIxKzBW?=
 =?utf-8?B?bDR6aVZYTUxQN3k4bWJubTQxN3JNdEpFZVJ6OWRmS2RxdENJYTJsK3JTOXI0?=
 =?utf-8?B?cnVQS09xZW53dG5IaTF1YXpHekxuN3M1QUNDYVNPSnYxbmNKSjZPbVhyYWJ5?=
 =?utf-8?B?Q3BSdlhvWkRuUlE1ZEF1VmlPTis1SStEeVp5N3duTXE4ZGUwR2RtamxCTjk2?=
 =?utf-8?B?MDVYdFAyMGVXOUl1R1Iwcm96cUlzZXJYejNvWnB0MDdaMlhyWnhuUkR1UjlM?=
 =?utf-8?B?Yk9nSzc0SVdSWmtSQzhxVndJZ2JiN2ZueEM1V3lBdnVuMWk5M0NJZEN3WlZa?=
 =?utf-8?B?aFMyejBSY095TWZabFlzT0JyVVJjZDdXR25HYURLRFIxd1ozVEFRNTUvOWZW?=
 =?utf-8?B?bG5seGVBUmFMWXREbnhGVk4vS2h4akN3UGh3bmtkNlFwRGlkVTBKWDJpK1Zs?=
 =?utf-8?B?UFNaNHNFUkRia0hOeVRBMXFCQU15Q25VcmoxL2wvVU5aOVlCbGRXZldLMUdC?=
 =?utf-8?B?U2dvKzEveHhQWmU1TFhGQS9sc1cxTFVndnNBL0t4NitUR29xaU9YeUNiaEU3?=
 =?utf-8?B?NldHZXlIeWpVTmdTb2VzcEdMQTlhQ1B5ZGlyazBUWUQ4OW92Zm40TTh4OHRO?=
 =?utf-8?B?V3RiVjE4ZnV3SlFEMFdwVkZxWnFLZis4ODJLSStuZXZSbzdDcU9uaFNPWHJN?=
 =?utf-8?B?TWR3Z2FERHRxZjEwanM4MCtWZHRScXcvMWZXZEZ3dkxhVkovV0RxQldMVFN6?=
 =?utf-8?B?M05nWGNvWmQrOVcxTGR0Nng1OHpOVHlPdUZtbFlhNGRmUUVrbEVIZnk4RVc1?=
 =?utf-8?B?MGtpU0dqc29QLyttRDJlc1BkQkE5QlBielNlVVhnMW1UbG5jNDlrSzg0ZG9O?=
 =?utf-8?B?eUJYZEtYMDFIenNGcDFqNm9oWGxLRzhucmE2V0FKUlVvamMxU2lwS2s3MFNQ?=
 =?utf-8?B?c2NrbG85cWZmQWp1ci9CQWVJTXBtTWt5QXFIY0Fhc0JGb2dqK2RDajVWR0h1?=
 =?utf-8?B?cjRyV05JMWdabXdndHZYQmVFOSsxa3lnWWdVVjR5dThVQzY3N0FuRXNkZkU3?=
 =?utf-8?B?YVNVbUJMMnlsblZDVTl3Y1Q2M3hLa201aU5Ta3pWRkswMTNiN1ZTS0V2elpJ?=
 =?utf-8?B?RHpGdm9XRkR3REI2THdtbkU5WnNac1QyTXA0YnBzam1uNHpFNmNJMFNveFd1?=
 =?utf-8?B?YlphQWUwb2lWWkV4V0Z0Nkl5QmRXc2YxVEFMdWdKN2lDcGFuWDczejlBVzNG?=
 =?utf-8?B?Sk5SLzRRR0dvdnhQU3FkYkVHVHpkblA1OWJWaU5wMzArSVl3cDBnOXZwKzN3?=
 =?utf-8?B?SDN0UjE2VW13cU1oU0JiaWtDQmhHa2lUelh2UXNOeStZVktGNDE5cnNOT0dB?=
 =?utf-8?B?dW9vZGpWKzVIbUZpcDd0QmRkN08wWFVjS1BpaWFBVzRudXFsR01ZRURPdUVx?=
 =?utf-8?B?VTkrQ3V1eUh6TVRFUlYvUlhwTXRESGdIM0NRam5Zb2NjeW0wTVJTaFhUMy8w?=
 =?utf-8?B?dGRrekRQbGsxNktKYURUdVVBazBZblFubnptckhkbGhCSDZCVDJLM3h2Z3pL?=
 =?utf-8?B?K29YUkhBSFZHbzM4NnZoN0ljb2dKZjF2K016WWZLRnJiT2tTWHBLTzdMOE9x?=
 =?utf-8?B?QlkvN2ZXRk10bEZ0Z3F6a2FVWE1pa0RSV3Y0akFyREQ3R1JPUEtMWkxZbmJ5?=
 =?utf-8?Q?NvgQ5uRqOmBqACwQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219da0fc-074d-4881-6af1-08da34cc5394
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 10:35:40.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciPZTdK/kbBdDd8bPKZCn/W54S3eawlDeHP5uRQ1hRNoiGFTOqckFJMQ6Nr7JKIOfEI5kgs9R1kAzzcKMQ6H9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2819

Some CPU models don't exhibit MCDT behavior, but also don't expose
MCDT_NO.  Set the MCDT_NO bit for CPUs known to not exhibit the
behavior, so guests can get this information, as using
family/model/stepping detection when running virtualized is not to be
relied.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/intel.c | 70 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/cpuid.c     | 10 ++++++
 2 files changed, 80 insertions(+)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index dc6a0c7807..d821f460ae 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -518,6 +518,73 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
     printk("%u MHz\n", (factor * max_ratio + 50) / 100);
 }
 
+void update_mcdt_no(struct cpuinfo_x86 *c)
+{
+#define FAM6_MODEL(m, s, c) { 6, m, s, c }
+    /*
+     * List of models that do not exhibit MCDT behavior, but might not
+     * advertise MCDT_NO on CPUID.
+     */
+    static const struct {
+        uint8_t family;
+        uint8_t model;
+        uint8_t stepping;
+        bool check_stepping;
+    } mcdt_no[] = {
+        /* Haswell Server EP, EP4S. */
+        FAM6_MODEL(0x3f, 2, true),
+        /* Elkhart Lake. */
+        FAM6_MODEL(0x3f, 4, true),
+        /* Cherryview. */
+        FAM6_MODEL(0x4c, 0, false),
+        /* Broadwell Server E, EP, EP4S, EX. */
+        FAM6_MODEL(0x4f, 0, false),
+        /* Broadwell DE V2, V3. */
+        FAM6_MODEL(0x56, 3, true),
+        /* Broadwell DE Y0. */
+        FAM6_MODEL(0x56, 4, true),
+        /* Broadwell DE A1, Hewitt Lake. */
+        FAM6_MODEL(0x56, 5, true),
+        /* Anniedale. */
+        FAM6_MODEL(0x5a, 0, false),
+        /* Apollo Lake. */
+        FAM6_MODEL(0x5c, 9, true),
+        FAM6_MODEL(0x5c, 0xa, true),
+        /* Denverton. */
+        FAM6_MODEL(0x5f, 1, true),
+        /* XMM7272. */
+        FAM6_MODEL(0x65, 0, false),
+        /* Cougar Mountain. */
+        FAM6_MODEL(0x6e, 0, false),
+        /* Butter. */
+        FAM6_MODEL(0x75, 0, false),
+        /* Gemini Lake. */
+        FAM6_MODEL(0x7a, 1, true),
+        FAM6_MODEL(0x7a, 8, true),
+        /* Snowridge. */
+        FAM6_MODEL(0x86, 4, true),
+        FAM6_MODEL(0x86, 5, true),
+        FAM6_MODEL(0x86, 7, true),
+        /* Lakefield B-step. */
+        FAM6_MODEL(0x8a, 1, true),
+        /* Elkhart Lake. */
+        FAM6_MODEL(0x96, 1, true),
+        /* Jasper Lake. */
+        FAM6_MODEL(0x9c, 0, true),
+        { }
+    };
+#undef FAM6_MODEL
+    const typeof(mcdt_no[0]) *m;
+
+    for (m = mcdt_no; m->family | m->model | m->stepping; m++)
+        if ( c->x86 == m->family && c->x86_model == m->model &&
+             (!m->check_stepping || c->x86_mask == m->stepping) )
+        {
+            __set_bit(X86_FEATURE_MCDT_NO, c->x86_capability);
+            break;
+        }
+}
+
 static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
 	/* Detect the extended topology information if available */
@@ -556,6 +623,9 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	if ((opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
 	    c == &boot_cpu_data )
 		intel_log_freq(c);
+
+	if (!cpu_has(c, X86_FEATURE_MCDT_NO))
+		update_mcdt_no(c);
 }
 
 const struct cpu_dev intel_cpu_dev = {
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 66be1a8015..ca2ed44149 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -360,6 +360,16 @@ static void __init calculate_host_policy(void)
 
     p->basic.max_leaf =
         min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
+
+    /*
+     * For Intel hardware MCDT_NO might be set by Xen for models that don't
+     * exhibit MCDT behavior but also don't have the MCDT_NO bit set in
+     * CPUID.  Extend feat.max_subleaf beyond what hardware supports to include
+     * the feature leaf containing this information.
+     */
+    if ( boot_cpu_has(X86_FEATURE_MCDT_NO) )
+        p->feat.max_subleaf = max(p->feat.max_subleaf, 2u);
+
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
 
-- 
2.36.0


