Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5652ED4C
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334169.558199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pr-0006vm-5b; Fri, 20 May 2022 13:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334169.558199; Fri, 20 May 2022 13:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pr-0006ta-0T; Fri, 20 May 2022 13:38:31 +0000
Received: by outflank-mailman (input) for mailman id 334169;
 Fri, 20 May 2022 13:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2pq-00056k-3C
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:38:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20a5a0bc-d842-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:38:28 +0200 (CEST)
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:38:24 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 13:38:22 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:38:22 +0000
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
X-Inumbo-ID: 20a5a0bc-d842-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653053908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6MXC9SRRU9edsk/Euin3gOSSBFKjI554IJeuGPPnKKw=;
  b=iKQ324taiG3eWLF8KXpBmv+UZBgPmtKyTuVBr4frB9UXA5a+/9gYeRuF
   4nxVxZiGjq7N1N2ZdoDNUMFnpAvAGCOyI7Kp4YRW2YqKOAZyyJsy5paHI
   YcdQ5ke2zJ34XSg8DkY9b3k0B8pnWa7qjenkOkZeSNvLmW7qW6gkJgL9g
   I=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 71798641
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vYCrhq6u2r8WZK7sAVPZGwxRtCLGchMFZxGqfqrLsTDasY5as4F+v
 jAXXWGGPfiNNDaneN5za9vi9EhX7JTXn9JgSFA9riAwHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjW1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSwE10JOqrigtgZDRd6MQouMpNM/ebudC3XXcy7lyUqclPK6tA2VgQNG9Rd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiVo4MFtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGQH+QLL+fNfD277lk9ozrrBHcvpe83TYdkPo2O+h
 VOf4DGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRokyjXZRZI
 k8d+CsrpIAz8lCmSp/2WBjQiH2JoB8aHcZRGusS6QeRx66S6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoZY3YNSwIAu4PnuNtr0k+JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:rHK3U65DWLTvpPMUMwPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKnyXcV2/hrAV7GZmXbUQSTXeVfBOfZowEIXheOj9K1tp
 0QDJSWdueAamSS5PySiGfYLz9j+qj+zEnBv5aj854Hd3AOV0gP1XYbNu7NeXcGOTWuSKBJXa
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWCSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLLhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqn3d+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXKvoJBiKqbzPLd
 MeTP01vJ1tABCnhjHizyRSKeWXLzoO9kzseDlBhiSXuwIm6UyRgXFogfD3pU1wha7Ve6M0md
 gsDZ4Y5I2mNvVmC56VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71798641"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/BVOxJw9h2Kg1Su+/KWbU1sThMnPC9hnj21grXqKWkYqaMwVzlQVN/GqoNQyvTuruOH1PUMtJj+NerKyTvoGEM6sLaB0xTXuJVc6X5MKJCllq3IshpEOY+6aGkwHiIErvJ2WNcEACGLKzpqlqpqYjDlj5ghMtK8IUH1ax0/1rfLyN8NinRp2hNYmmiRJXKuN78X9G+blM1V2pxQLfvijCQlXCp4Z25BBvSySDWI9O0UcACbnzms7YJDvjJG1wWD7Ojl3GAZBXzQ5l/f5q+/BOpUscQ09Lkh8RWhctmlIHhIHR2DNdxu9VQGbV+Ho6mkFCDhDI2CcZ89tokNx1SQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wQyHDBl72WDDVIoX0a3nPky6wCNM1VhocR08J8m0p4=;
 b=IJ0hAbQg/sdSVg3apMfR56SEMRILCiDFr5ZCSfKB1zOxlLrSMzR70PvOFwm6hmrgblRY0o1l3l2ycluBZwC2oOu/jwCCNG3b+dSxMhKNTXD2jpZQWNWqSp9PkR8YUgpLlOucdK+Gpcu7y8+ZJ0WPSsaophsJbDz+tTDuqp0RS08K5C1hYs7VFKd6QSkw6MGmGfDT0ZEVvB7hLR1umvqUXRv+9G2O9Ph/BzK6JqA5QCMeDFnBs4eXEQYNjMDpxljuZ5Ff2Vta++z751Wtu1lEm4dUp8BvqY1AaHR4QEUK2W2HpqLZeyN6MKcDak1/flvsU3X0XdleDQ8JACgcVv6wRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wQyHDBl72WDDVIoX0a3nPky6wCNM1VhocR08J8m0p4=;
 b=n0hJmV6yFBrG6SVj6wyPmNRmnbRsBQNpE+ErEvlLkKO6f5Jz6B/Z4U6Gn4naeUP7r3DABNrv6wAiDkDZ0LCPgl9T6jvWo3+Rk/7SqsmZd+srTCIYh31fPchLZM0pf9fEfvxeRuUU28UgJwJWEeCl+gy69TkqGNUcvH9kTHm1A7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86/vmx: fix indentation of LBR
Date: Fri, 20 May 2022 15:37:46 +0200
Message-Id: <20220520133746.66142-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0506.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d15561-4d60-4ccd-99f7-08da3a6601d5
X-MS-TrafficTypeDiagnostic: SA2PR03MB5755:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB57558B3834BAC798A98E25B68FD39@SA2PR03MB5755.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	obKYK02mWqQIX8OvM7VWRnzHlkaarh90WEPFVIcutC9qCHupeOPdIGYWJDEE9a3m17xXmJQzDZ5w/O6VWS0H83+rjh2c31aNNkbAdoGndiGfFdxbaWc3O6zkH3+4uVS930xQ/BrO5M1gryOjLIwJfFk5oD4exhgvtZ02oTVpR9tX9Fr5QZ7awLRdq/y8G40vmFCKrjO6vw1XM+RCoSxW0lkC05gvGAq5f+DaRP1O23vt/ZD9o3rEfu4M9f/FMotfkzARrXvTvajxOomp0nyFNWckJl9Ou181qn4/mkG1/wR/IVkL75kbGIRgcmTUE9aLKAU5Do7M0io6aG5W+9oLpE0Q6qyZ3FcfM2mUJwj+cLYJDJPWM7Gl/3OT6IBmjReAM/xFFK6t7UeLLoMWLqtJOMK8i3OiS4hpsZ/tj+V/m9kQ/+w6yvTY8AYqZwkkEAnHwXFOObMpee/BdHcMigm86grdJcHVh2t86pooX/7C8vuQHaa2ur2rUxvxTY5N6iKJQNQJ1WQjn0cUGoKkfdK7f8NHHMapGqdYEvWzDmZuAf/wOReJ4N+5nIUhNgUYoMc9YJ+vpPQfCU9zdzoi8jQSSXNuyidC6f8uEPRpWU+jPaRmHTUVLU5eEeiJ5hU64uyOeKzxl9UeVghn1xUy5jmD8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(6486002)(83380400001)(6512007)(26005)(2906002)(6506007)(508600001)(1076003)(38100700002)(2616005)(82960400001)(6666004)(36756003)(5660300002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aExWcTJxTUk0a0R5anhJNyt5S2o1dVU5aDFOQnVWczl6ZDJSZVhKcUJBNU9u?=
 =?utf-8?B?N0t0c0MzS0Z3ZHQwUFZaOFRRWXJtT0oyUVRjdGd4S0F4REZYMHVIelgydkVR?=
 =?utf-8?B?ZlB0RVlSVkdZSG03dE03S0tpbFVISEJLeHk2bHkyUHQxSnVaYjVzUDVFWndB?=
 =?utf-8?B?bmdVdWVkdjBPWlVuK3I2R0QwWHRJd3BieVBmc01BMEg2YU1NajNBTml2L3NV?=
 =?utf-8?B?ZWNqVUtNY0JCM3BhSUZYTUZZZzVQVTZ3ejgzZ1RMWXlCYUkyeWFRRStobWdy?=
 =?utf-8?B?ckFLNDFvM0NHc0o5RFg2QlZ3VWR1UzZ1RVdyWU8rS2NGY3hxZUNLNldxUFZm?=
 =?utf-8?B?MWtqZEhHTzUzV2w1OENWeXk5cHJuV1BxM0xUQjNmUENNZStWMzVwTGRxSXhQ?=
 =?utf-8?B?REpGR3dpWDA2WUtxRGZ4enZuaWZRRi82U1RncmVCR0FRK3VBdFp6cDNJZXhz?=
 =?utf-8?B?N3Yyb053NkRCNk0zUkRWZkxkcTJ3Qmk5OFgrV1VDa0kzb0pzRW1wemYzNHhK?=
 =?utf-8?B?TENpbi8zbWFxdE9yRnFORjR2UVk4RGM0NzRNWFdSYzU5dXdQb282Sk5WZkRV?=
 =?utf-8?B?UnBsTDkwcjRseHVYazJCL0xOVUw1NlFENUpIdkJpV0N6V1lUd2tjWDhQLzZr?=
 =?utf-8?B?ZUZNN1E2T29qTXIreXVUWTBpdENVeUptbWF0OUVRV2l0YXlkYXI1WUVyY0M2?=
 =?utf-8?B?Q1MwZHgwVGtJY0lkY0RMM3JVek10MUp0MDhZZmJ6OEVJdkRvUTFjYVgwaTNv?=
 =?utf-8?B?QW8rRkc0VUxEK3FPM0hwL1dReXNGVndJdzRGSTFRdUxkSG9oajFrVkRpaGVI?=
 =?utf-8?B?THArWlRwZE02NU5kaHE4VkhGNmxXNUM0UGMydDNWeTlwcGhZc2J5VWhIMkRG?=
 =?utf-8?B?YkdjVXNnSnhYaWo4bkg0T0ZPL1lqbjdBSkphNlMycUxDT1c5am9zY1l5WmZR?=
 =?utf-8?B?UUdNL3B0Qmsra3k3YUV0cktwcFN1VDB3RElmb0U3d2twTmUzUmpma05oL0dT?=
 =?utf-8?B?MkxBcG5MUXZzK01GenluWnBXbmZKcDVEMWdLOHFzUVdIR3QxbDZzNWdwRUlk?=
 =?utf-8?B?U2hhUjdqZ3V4RFZ0NGE3ODBxM3NHaGoyL3JYTnFkdWVZNi8xSkY2K1BYdG8r?=
 =?utf-8?B?OHZSM09nMXU2a1dhMFJMeHRqbkJ3VXM0TFNmdnFKa1g3WkJza1dRUnFSc0dr?=
 =?utf-8?B?ODRMeWhhejBpdlV4OHQyR1ozdklGalBHNVZaN3R0YWloU2pzR3pZVzJ3dmQx?=
 =?utf-8?B?UVIvUC9zWXpHbmNwYTNWMjR0TXRBQkhLMTVEOVJiYUN0eHpuZXJIcTNzcWI0?=
 =?utf-8?B?ZUlUTnBHNHpvWk1zQU12aVJBRVFlSEhvVEQ3RTI3eUZVM0pDK2xXRHF3dXp1?=
 =?utf-8?B?SXlTNVcxUUR3OUtwNzIzbm1RWitZNlo2eFJ3djNOYUdkQkdyR01pblVFMzhv?=
 =?utf-8?B?T3N3c2hib0IzV3pWclgwUHJSa0YvRjcwRzBUeDEwNWhHaXQ0OTlPYnVXZlBt?=
 =?utf-8?B?V1BEVENJMER6ZFFzdk5ERThLalN4RzJjV2F5dmhRYldSb3pjMkpDeVdjeW0y?=
 =?utf-8?B?YitmWng1RnJ6eGo0RTByczdjcjFUZWVCaXZ4cmJqa3IycGN3eFJ3RllUV0xJ?=
 =?utf-8?B?V3hIQzBGZ0l4KzhtTGN5RTI2Qk9wem1McG9zMmt3bHRIYVpuTE0zNklIOUVN?=
 =?utf-8?B?NjlvWTZZWkFhb0xySlFleWgvV1Y5OGc3S0RIUGkwYUNHUmFkNCtDbTlhS1Nv?=
 =?utf-8?B?Z2dxbjZFQ1NCenpVUUwwVVBnbzltL2hxckJZd20zL0pldS9sdGRtRkdjaUJi?=
 =?utf-8?B?TG14MGFxbEdLRzJ5VmlERTIzeXRHNkc1Nm4zWEw4am5aaWc4M3BsRTVsMnMz?=
 =?utf-8?B?Vy90T2tHRGJjZVBQQWNQb0NMcW9PZFZnQUVub1BVTmVsZDZkMnNpdjBONE5Y?=
 =?utf-8?B?YTJEZjViLzJPQTNTVkhnVmhNWHdERnliU1ZSaDhBQ1BLcXZFOVBzdFFIMHdJ?=
 =?utf-8?B?c1VrK0N6Wk5uKzVXQWV1NGNXU2Q1R0RHa1RGcTFBd08xakpoTkJVbDVGOWts?=
 =?utf-8?B?clV5ZG4xcnVFZWYzQWJGdW5SYS9YS3FYWnl2UzQrMzc4bTVDb3pZQm04RUty?=
 =?utf-8?B?blN1SmNhdlNCQ2IreWdCZnRSUHpIKytxTjNRaVBxVVliVkdOTUpORWpKdnh0?=
 =?utf-8?B?aEk5WWJTTWJMaVBWMUJWL3ZFdHhRNktSNWU3bGZHdGhxN1VENFlXMmFRaGdl?=
 =?utf-8?B?UWZxYTZSckdiNGVvQkh0Z1J2NTliTW9lQXhpNTBrME5sZFFseEExaEs1cUNR?=
 =?utf-8?B?elovTzVLSm1XUmJIaW8yUGtzbkgwZDB1amZxQ0dwVjJtOHcwNklzU2V1bUN5?=
 =?utf-8?Q?dLIoj9LMs/N4xARs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d15561-4d60-4ccd-99f7-08da3a6601d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:38:22.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXTi61gzez7fZ9dwJV+CsE/tW6po5vCmcFfePspzrazRDNaZAlC+JiihDCUc4/lODvKFL45/SsMMwI8ESuvg9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

Properly indent the handling of LBR enable in MSR_IA32_DEBUGCTLMSR
vmx_msr_write_intercept().

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Feel free to squash onto the previous patch, did separately to aid the
readability of the previous change.
---
 xen/arch/x86/hvm/vmx/vmx.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3f45ac05c6..ff10b293a4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3540,31 +3540,31 @@ static int cf_check vmx_msr_write_intercept(
 
             if ( lbr->count )
             {
-            for ( ; lbr->count; lbr++ )
-            {
-                unsigned int i;
-
-                for ( i = 0; i < lbr->count; i++ )
+                for ( ; lbr->count; lbr++ )
                 {
-                    int rc = vmx_add_guest_msr(v, lbr->base + i, 0);
+                    unsigned int i;
 
-                    if ( unlikely(rc) )
+                    for ( i = 0; i < lbr->count; i++ )
                     {
-                        gprintk(XENLOG_ERR,
-                                "Guest load/save list error %d\n", rc);
-                        domain_crash(v->domain);
-                        return X86EMUL_OKAY;
-                    }
+                        int rc = vmx_add_guest_msr(v, lbr->base + i, 0);
 
-                    vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
+                        if ( unlikely(rc) )
+                        {
+                            gprintk(XENLOG_ERR,
+                                    "Guest load/save list error %d\n", rc);
+                            domain_crash(v->domain);
+                            return X86EMUL_OKAY;
+                        }
+
+                        vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
+                    }
                 }
-            }
 
-            v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
-            if ( lbr_tsx_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
-            if ( ler_to_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
+                v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
+                if ( lbr_tsx_fixup_needed )
+                    v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
+                if ( ler_to_fixup_needed )
+                    v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
             }
             else
                 /* No model specific LBRs, ignore DEBUGCTLMSR.LBR. */
-- 
2.36.0


