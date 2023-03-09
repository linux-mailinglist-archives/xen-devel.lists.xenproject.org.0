Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20966B2B58
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 17:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508339.782944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paJbH-0002Pr-0a; Thu, 09 Mar 2023 16:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508339.782944; Thu, 09 Mar 2023 16:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paJbG-0002NT-U0; Thu, 09 Mar 2023 16:58:42 +0000
Received: by outflank-mailman (input) for mailman id 508339;
 Thu, 09 Mar 2023 16:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3aQQ=7B=citrix.com=prvs=4252f21a9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1paJbG-0002NN-4s
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 16:58:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a15e4169-be9b-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 17:58:38 +0100 (CET)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Mar 2023 11:58:25 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ2PR03MB7139.namprd03.prod.outlook.com (2603:10b6:a03:4f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 16:58:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 16:58:22 +0000
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
X-Inumbo-ID: a15e4169-be9b-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678381118;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ObuqeZICaigPS5SumpsstAZ2paEcuG/UW2ho5Wqi+A8=;
  b=LOM6P/nlyN3yS/gzlTsr7aIud99EAvdx6auX75dOQlbulIWzetaGSowC
   +8IrNIHWf+LiXf7W3TfvUXlZl05i/7FTDMNhaCoRBwWvJC/Pu6dbQ2MZn
   m3Bs2l0ORrl0Yc01keG+knyD88pP0nHMTnW+mFFf/lD7oD8OreOGbiDRO
   k=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 102619478
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nt5bgq2sSpzZjF3phPbD5cZwkn2cJEfYwER7XKvMYLTBsI5bpzQHy
 DAZC27VM//fYmvxfYt3aIW+8k4D6pXWx4BmTQtrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdmNKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXDEQ/
 KMxdj0xdyub19228peBZfRBiZF2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFcZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rWRxHKnB9J6+LuQrfFpp0fI4HMqAzZIEku2+emg0H+0cocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC6
 7OSt9bgBDgqvLjLT3uYr++QtWnrYXNTKnIebygZSwdD+8PkvIw4khPISJBkDbKxidr2Xzr3x
 lhmsRQDulnatuZTv43TwLwNq2nESkThJuLt2jjqYw==
IronPort-HdrOrdr: A9a23:eNR8A6PxF1GSHMBcT4D155DYdb4zR+YMi2TDGXoBMyC9E/bo6v
 xG+c516faaskd2ZJgfo6HMBEDtewK6yXcx2/h0AV9NNDOW8VdBAulZnMDfKhfbalrDHtc079
 YpT0CVYOeAR2SS9PyKljVQcOxQouVvkprY/Ns2lE0dOT2CApsIh2wSZ2qm/1VNNXV77NgCZf
 +hD+V81nadkB8sH7yG7xc+LpP+TxyiruOVXffEPX8aAcu14w9AJISbL/AWti1uJg+nCI1Skl
 TtokjC/62mhfmw1x/b0Abonudrseqk8MJKAPqGgtN9EEScti+YIL55U7m1pzwtpvqzgWxa4O
 XkklMbJsx23WnaeHq4yCGdpTXI4XIV8nfn/0WTh2Dul8z/WVsBerV8ub4=
X-IronPort-AV: E=Sophos;i="5.98,247,1673931600"; 
   d="scan'208";a="102619478"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4xLNReKfA0OkpVWGxzsFE8BaHwm8DMRFeEDuUjdMqmmdsC/udo29Qs4XdF6HjeSQDONO2bvuqnANqQtmP/m664NICGvghwUE6uxe116L3D9THFQ2rHYCeZYPFtNM0ceUrNULRnB4GmEIy6T+i8gA7uRs3j1AEs5Tm4dq1+LPx7vASw2qKPQLQ0zYdZtjIx6923xRpoRiCC+V/cNStxJYATUlF48X3KuXY4zfnI6FMRD6hGH6SxWtfmURf2PUBJ/y+Ztn3J9DAkcrbV3AobQoYq75Ul/R7eZZVkOFG6IWKwHddB06LMUhqZJmTjgWIaLRyblaIyurfGTUu4w+kPR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNHbpjp0Ld0UShtinjWl6AvB/2PZfWRDtntaADSGqqE=;
 b=G2gUS4EJNDwVbjLoznXet3fIwd/YsbDYoSa3KDSMy8cPiJAJvLC+ggCJW7ftRi50jkYNv4xpvkZAdrY4fOiPp/sdH8TSzoaFVb0k8UFQS5VJkzSa2R2qRXbTD+6IlzxniNAKJJj9arKNh5hHfD6mGSQXTEYt8V+6FcHoJmzQrZbesWfNwTaW0BK7YR0maVTaKTTTNADHMbSzjrLB/u0n4ozsr0ETXuXJDqCmPocFo2NVmTNwjin3QmY4iKjCkLPWrcG+5GGzVcr7Q4yfihsp0xPNtpud1uwuMZ4ED6ACA0WeH+bk7xP+BF81rDrJXloKY24CBz+QwYGOQSSg3O3zEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNHbpjp0Ld0UShtinjWl6AvB/2PZfWRDtntaADSGqqE=;
 b=e4B2tfEfwkv6aIMXBSbxtQ/RmJKM3ofb0JeQx2hfvtE6rYBKk2hcEQvUn85o+5SaqVL4Rx5Nq60G5kE6ppyxNlqM5wX3kWDNvC50CvmZZq8GKyi8n+qOSVZ6LcD1Bm/dorcACCFWUwg5LBsqNIt1FMcQCtVHq+goCix7moDgOFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tests/vpci: install test
Date: Thu,  9 Mar 2023 17:58:12 +0100
Message-Id: <20230309165812.33918-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ2PR03MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 944e9d62-1fe0-4dce-ee94-08db20bf7d47
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5A5H93R+Elu5lALWsuILbuPAjkEUI2e5m9YEMiMrd91N8Ghferdc31u9EJmBzRD4+KvzVFtTI2w4ZYw4dIokvV7l+c5uxrB4DFJs5Ods/wNMXB0HKu4wfzZP53bdJwLpEVIljM9xIyBRx5AsgKuMGz3bWTZPed7OkzMsNJCHf+BMU2iPl8rK9bGugqvSHc6ks9005+7AxUhQ2XaQ6BL4cxYQPY76JqipVLggwvGK80vw+2UrkHkbtcVePKEETk7AC0PYrRqSo02lxXT/q72l1ilmzndnMEVrJKLXnU3EzktvKxuu5Adz+vDKIVTnzKFvDO3WY6ep+wJ69nglPe0PrKgW9o+9CpykOXAzIRdBfL1q2YFxazXo5/p1P337mbpw6YaNUh4n90qzEyxF6nFyggkolqSpmNh76DjqmyL7JWV9zaOBTVDgLECBYv+CC3XRH+8acUiKIuWZC8OJjJhCTzI+1D35CwthafBebWiNy3qM6K7xfQW2y0FzqzvzBhmuoxoCPXIA5CD6gHtZyTKNt/wAVju9xvTjzt73Q+nSXlDWgLyYpUzNdV23zghREFgjAPo7s6PAVOoEbK5LVNBqZrn9NfwZYlrI0m/IMPEruDOgQNO+qjaqgKNLMLv+QNbW1U7MuCEkHPvlYLoP5aLj4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(316002)(66899018)(54906003)(478600001)(82960400001)(6486002)(38100700002)(6512007)(186003)(1076003)(26005)(66476007)(6506007)(66556008)(4326008)(6916009)(8676002)(66946007)(107886003)(6666004)(2906002)(86362001)(41300700001)(36756003)(2616005)(8936002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?allCKzZ6dk1aSTJGcnU5VEVhcVhOcEplazg4WmE5dGY4aGc0TE00THhjdkQ2?=
 =?utf-8?B?WmJERmZGcTYydm9ONjA3WmtKcGxjOHUzQUNDb3BmQS9POG9HYVprcFJUVUo0?=
 =?utf-8?B?TStXeXczZjU1Mld3TzJ2V2F6bHFPbzV1SjR5TzdTRFY3UXZEY29iMk1LSVN2?=
 =?utf-8?B?cENiaC9vRjN6V2NkbmI1WXlmNUZuS0VCdk9mWXFmS1dkeXpIakNERjlSUzJB?=
 =?utf-8?B?UmRDZnBTVXh6NDFXcVNUaW54VDZSdHVTTjB2b0htaEFLSk53TlllMHNWTzgx?=
 =?utf-8?B?bG1sM29GS3FYdkhzSU40ZUd1QXl1L3RHMHVXMmxIZjBSdXBxVEQ1MkQ1bWE1?=
 =?utf-8?B?aG5vdytSZG9IRG5IOHp6bjNUaXRXZU5wK28vK3RHZTFuYzd3MlI1UjRnQUh2?=
 =?utf-8?B?WEkyb21pSFV5ZzVVRUQ3QVg5NXUvUWdKbkRMaitESHVkSGlsSGQwSzRKRzNl?=
 =?utf-8?B?RzdCZ3RtRnlucklPQ0N3RmRkTnpqTi9leGhoaGVQZ0FXa2xGZWpMTk85bDFT?=
 =?utf-8?B?cHhxV1ZVcWVIdnFyall0bXZ2K2poV09ib1VBN0p2VnRSeGhlNkRJMmxhN1dS?=
 =?utf-8?B?SlJ6U0VodFErZitheDFVeU1RY0s3KzM2cHcxK0d1WHloaGh3OGYzUTZDWTEv?=
 =?utf-8?B?UlRUdFAzU0tWdTRJQnVVSkxGVm9UdjFSeDdiR2dOZmhOcFFmYTltZ0tJa3Vu?=
 =?utf-8?B?RW15ZVlnQTIvUG5tSUJoNzAvUzVKN2J1Q0ZyYXFURzhiL2p3MlhIQVhqcTNy?=
 =?utf-8?B?MVZuR281aUo1OWVqbWp0bkdvNnJUaDRZdDllMnB0M1VBeFkxbFlVUWdvMzJQ?=
 =?utf-8?B?azJqdzBoRW9uOXlRdzNmZjNZcVV3c3N4RjJqRFJLRmJtSXhKMFRCaUNQd2ZQ?=
 =?utf-8?B?UWZtU1lUNkFLNmJ4SzZ1dnFvd1YzdU16ZlhvRXE5Q0ZWaXJqZVdJQ1NJc21Y?=
 =?utf-8?B?cUt3TnprUVZ6RjFxU3p5czlWbnhBYVhMVHpYUmNha21paTUvcDRuaGR4V0Jh?=
 =?utf-8?B?WmZ5eEhaWHJTWFJMZk8wTmtyMXZ6ZUtzUXFIcEMvQ3I5QktKMGpFNVJsVDd3?=
 =?utf-8?B?eW1XV2R5Q09xODBDcUNXOGxzeEtGcWZkc3FuTTI1UGNIL01iTlB1Z1FXanZF?=
 =?utf-8?B?SWMvZnZHYmhTSTlZUnNYSUcwMzA1RXBXZnNXSGdJUmNFcDg1VWMrUUdtR1cr?=
 =?utf-8?B?YTd4Y3dFcUkrUjg2eVpDdkdWR2drWU1UaEMzNEZVNWJzYUJMVk91U2JENG8z?=
 =?utf-8?B?Q2VkbFdweFVibDhjVXRvSXZGdXByRUswdjUyS080UXh6VGF2MmtBRy9uangy?=
 =?utf-8?B?YmkzVmdNVDd2Z01oWWVibHR5NHl1MlZ6SlNPTlB3Q2xLeFF3UzVCOFQyYkV0?=
 =?utf-8?B?R0FRdi9ma0FnNi9hUSsyRzlRNGVONlQvalNLVER4eUtGZjdvd0JnWmRxOHF1?=
 =?utf-8?B?Ry91bU9ycHFBZ0VGVFVBWmgrakswcHV2YWhsVE9JZXVUUVNUR0FHcFdhcUFZ?=
 =?utf-8?B?ZlR1TlAzMkZlWXBPTGxqcTVVWlBLdGVnTHNKVzJXalVjV0M4TWR6RVFjUTFv?=
 =?utf-8?B?eDk1Z08vMWlNVGxRNXFtd0hWTEluUjZZV2dlNzVOZDJxNlorbzBlYUh0bEhk?=
 =?utf-8?B?eFg0bUpsOStHYlNTRHk1NGQ3ak42a1NobkpDdmRlZkNWRVZPY3lGOXFvcmQ2?=
 =?utf-8?B?dXg3MlA0UENkeFhwaWplSGd6NnY4SWlqWmtuejcyRzNIUWNCUDNPZStkd1FM?=
 =?utf-8?B?NlFKbjlTdlA2b3A3VUh3MWdlWXpMY2d2TkpPMVc3MDlpY3pxVlZpM0xQZldy?=
 =?utf-8?B?RFJpR0lJa3RCbUlVZEFONTQ0bXp2SWI1Nm84bEFaR3Q0NWh4NEFmT0JpWGVW?=
 =?utf-8?B?dURLZTd0TFMwNS8za21aUWlZSnN6bXBGdFB4b1E5cy9yam9MV3IxMGFkemhl?=
 =?utf-8?B?QkpNdHRFRjZvZGFDbVhmS1BMdXFUOWhhUjFseS94MDNGMjhkYnVJdlNhZTZ0?=
 =?utf-8?B?TGVXZGlNSW1CNTkrK0xjS0NQR0ZxTGpsc28rdHZZTVAycXViS3U0ZDJHSTBZ?=
 =?utf-8?B?Z2hUV2FXRkJaZ2tmN0VrVWQ3SjBXUmFZWnV4NWZkL0Y2UnpZM2FIdDR5STYv?=
 =?utf-8?Q?ib0eFIRZrM+JZ52xniYxy+thI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7bJY+TC4ONwaLz07CZT54F3HBGFWiHURRPtnFyWXz9bpLMQs3dq1Gae3/BCR4dSMaxrSsdCWy/FBfa6qvrDdVmrIvGdDRIEEnCDHH54oXWnFDxE8UD4JknidynJ+Hv7V7YPwiD3ptHqi5z90E8Q+vvGWJ6AtXeQGFdu6YUQgBVdsc/jyvDA/5Lhu50B4e6CCcZZgvgd0JUnoMUQ6sBNzPI8Tii0p5D1+FpgAAHPrgID01MLuMzx0wTjasDSh524FJL/U/ERJK9Jklm0qH4OWx9EYQUwW8i9s1wGBN0O/n84DbcPWrb5tKwSg4Hhps2/yRRHhN5jHtCb52w4NVJPlmB8EAJwxQIPyftOMt8MNCANEZsL+owqU6j3wp3tBs/NX4iHJf2H1yFfPCjvOS+Ogt7AhKdWKXaVwznoQGg0kgWqm5EjP4kUGgtQIKeqSBUtOkrl4Q+T5THCYXmtK4e6YEUOI5N89AqULLi5a4dvB1topzuZ6Y3bt2cKo6FK9WVGAc33kIrQO3/JKYT5CS68QpewaucZ5RgzVEM0SeSrvwQFbVoB180VvGHEP2VJD87fL6k6UVLoVx1o1qvFJAeL2ymeIGqvQyMkqJpO6YdBX806lzaih90shS7FT0IsFYzL6z8uA5ZEdBXmPkwTa0kp5y0RujWHkiPC6YoJi8wF0sXRYtM3ZxWHP52SFus9eiFqNMLpzdEzddU0HtCANHAX/aty330292HjXqawb3kYKLvupzgOkUjwtswzANcp+W341JLlIQQw5CkubCb0zEf3K6IuQdnZzBF3ubBp82eleNoc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944e9d62-1fe0-4dce-ee94-08db20bf7d47
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:58:21.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzJ/nbrfhDmK4DBmqk53iyyuXbLAn26NlLTqPUr4zskQOpCocd/0tASi3njUQ8EgHYJPF/jF9m0nO4XRND7eeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7139

Introduce an install target, like it's used by other tests.  This
allows running the test on the installed systems, which is easier than
running it during the build phase when dealing with automated testing.
Strictly speaking the vpci test doesn't require to be run on a Xen
host currently, but that allows easier integration with logic that
runs the rest of the tests.

While there also adjust the makefile to use $(RM), and rename the
resulting binary to use a dash instead of an underscore (again to
match the rest of the tests).

Since the resulting test binary is now part of the distribution CC
must be used instead of HOSTCC.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
XenRT has recently gained the ability to run the tests in tools/tests
that are installed, so the install target is needed for that use-case.
---
 tools/tests/vpci/Makefile | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 5075bc2be2..3b85b689d3 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGET := test_vpci
+TARGET := test-vpci
 
 .PHONY: all
 all: $(TARGET)
@@ -11,17 +11,23 @@ run: $(TARGET)
 	./$(TARGET)
 
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(HOSTCC) -g -o $@ vpci.c main.c
+	$(CC) -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
+	$(RM) -- $(TARGET) *.o *~ vpci.h vpci.c list.h
 
 .PHONY: distclean
 distclean: clean
 
 .PHONY: install
-install:
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
 
 vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
 	# Remove includes and add the test harness header
-- 
2.39.0


