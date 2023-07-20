Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D375B205
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566651.885761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVFD-0003LN-1m; Thu, 20 Jul 2023 15:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566651.885761; Thu, 20 Jul 2023 15:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVFC-0003I4-Ub; Thu, 20 Jul 2023 15:07:06 +0000
Received: by outflank-mailman (input) for mailman id 566651;
 Thu, 20 Jul 2023 15:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMVFB-0003Hw-IN
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:07:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b3b6bd-270f-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 17:07:03 +0200 (CEST)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 11:07:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7254.namprd03.prod.outlook.com (2603:10b6:806:2fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 15:06:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 15:06:57 +0000
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
X-Inumbo-ID: 14b3b6bd-270f-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689865623;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PsbIXgUX3ivx4jE5Al41Xywzw2tIU05AMuEAaJFV6BQ=;
  b=h9yk8LgGE5nXaJWYjnzpytm6eNAoGpwshmagjP02qNc/mfcePQpL/Tgg
   WD+Vq1RoBNMmQmjzGVcqwG5MLwsXcqaoQBcPV9zy+bKqpiJTC5T6sGANX
   HCGW9apeXCdjd5wS83XU/O7x9BFmeE5TiGdcXZ044OAwiXUJf0+84wvl0
   I=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 116758001
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/wPkz64v1ZxjZE0Sm3q2ogxRtIHGchMFZxGqfqrLsTDasY5as4F+v
 mtKW2CAafmMMTT8LdB+YYrk/RlQuJ6DzdIyQApp/39kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 /8mBDUtLTu/gMWY+634b7hMvN8GFZy+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otj9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWw3ymCNpKTdVU8NZo33DL1GM3ViEHTEu0gMPhrW+0ftF2f
 hl8Fi0G6PJaGFaQZtfwUxCioXWD+AURQdNeEus7wAuQxbHZ5QnfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESMSK3QfYTMFSwQt6cTsu4w1gVTESdMLOKy/g8DxGDrw6
 yuXtyV4jLIW5eYU042r8FaBhCijzrDSVRI87AjTWmOj7yt6aZSjaoju7kLUhd5FLY2ZR13Hu
 2IWlsy25eUCS5qKkUSlUOgLHbjv/f+KMTTQiF1oArEo8jjr8HmmFahZ8Th4YkR0N88ePz/gZ
 EPeoytY4ZMVN3yvBZKbeKq0AsUuiKTlS9LsU6iIasIUOsQuMgia4CtpeEicmXj3l1Qhmr0+P
 pHddtuwCXEdCuJsyz/eq/oh7ILHDxsWnQv7La0XBTz6uVZCTBZ5kYs4DWY=
IronPort-HdrOrdr: A9a23:WiWYIa8BuzeDgI+wC7duk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3AImgzsmkyLIPW8MAY7TVkfx7n6GrXOVve8lvVAwy?=
 =?us-ascii?q?TNWFOZoaKCnrB2Jl/tvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Acs7DHQ71gB6WIBGz0/ktyMDyxoxqvIn2Gk8pz6k?=
 =?us-ascii?q?XotmLFBYoHBaXqTeeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,219,1684814400"; 
   d="scan'208";a="116758001"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfUAlCSEdM1pt7J6ZCB1CUAd8N0wqN5u2s0GO4+caRkyJy6/Hgs0mNobBGsBkkUWQLyJajqiRV5Fc6zUjfb1p/kZSULZqaPMXZoKkPdSZAF50D/sM1AHZCZ9leMKJ/n8zKVr1IK8XpQlLqsYFf3dtl+fGmoyb3vSc9IyrnCHTeD5CYoAobV95cV6GxA3PJfS7kRi2UmMj0BJCc5kqaVuZ5jFe9ZRCk29j0ivwVW+t4pRHgf4OUU9nBf7tEfRQ1dxznvodlTCnW0T/rh/TCVT/PgvclT2/jj/VtfW34C6PE7MssG6r3girK0Oh9br07APOOECX7KMGs/gOXZ3T6dm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kehxbsp7ss62gce3UPTNassI+MHKU6cxMtnPTeORNgo=;
 b=mWzszUzboHVf7CINq8gDaA+6zpS1/t26LjtU4J8c6m+KZ+hjz2E8/VJgQwwVNktY3VNGTqdkPDwUQ/9NG0qp7Qvyhz9cw9/RF7FdlxIJ81GSd6mFBCqCKU3XVH/UlTGiuvlemkG3WbiT+kUP9upZ2s2ospot/9lpSroC8pDEiHxZh7baUUGnt/zuMjdrBMK/0f8NBnJWAxMtjzAh9ZVDNKqB7zHu4Hz0WF3GAuR1tOkuJNbkV6V/5PuDHoRw+CZYdjIBUKBns2qYaxlcpavbzrjOBzmxhcVyJ5Q4OSgrSQM/BqVTbFOhVpLpOQUZhkHX4v5UEwpZgINO7ykjTEEeUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kehxbsp7ss62gce3UPTNassI+MHKU6cxMtnPTeORNgo=;
 b=oayYr6kVR0Tky08PPat+6X4alqU72UE/nXZqAQKOYHPG0yEwHHUOxuSpArOuxOTtcTKVuNnN0SBohmqCkFSN4pVHVLF7UGIc8ytm9vgdOa+kjoVTG+KZjVpO/+nN/e9UnRUt7kZ4LXtDZGGwN/6TBBDIQYjAuiwdKR9C1wfb7GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 17:06:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2] x86/mtrr: address violations of MISRA C:2012 Rule
 8.3 on parameter types
Message-ID: <ZLlNjebB1LITaAWW@MacBook-Air-de-Roger.local>
References: <514c6dbe4ccfa1fdd66f80a0f8c8e248886bdc4e.1689856301.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <514c6dbe4ccfa1fdd66f80a0f8c8e248886bdc4e.1689856301.git.federico.serafini@bugseng.com>
X-ClientProxiedBy: LO4P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e24f80-a485-4322-ad76-08db8932f625
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wz4qur/YdaYCU8q8AEyxAj7xJjLqGS2WRtPujw1o6p0LfuYxITfoW4o+N7ws/9GTvoXCPgarmDNe2U9neZVmg0o00vJQ8FvRXt0tFU+S0oguSE08WDT+lEvs8MoEo0DWrEItsn+MZeqqzMaxaF76r4kyk5TwdFay6dJqNyaBs+B0la4+5AP4OqNJPQLM5/6onkHFm1ydsm5LSQ4XG7PcGoPscWmDI4ufGBK/KZRRxxfoZTcQ3sxr5sma4FRqDickEw7QVNYd644h2n0Pit+wWC0htMlmO9fiCHvffle5AJCxg1b7+ClTfOcLzANvPcyEsWlE2Gq/PCMe4tYD5xbxdhGzmHjISVi6WemAWGDOh4PkjAxRHFutt6JtIgVMtiYiMRbO71Pe8dkQ2NlNULdqhRGNRsgVwPOzk22OWJo+FlBsRP3G98LV/lzZcyzt+BNN3bHK0joBTFVOjT+4iWXZ0lZyH27mhc1Y4oh6Rgg9NZDBLCdRjXNWtIzJFzTFKv64ZsfL4890uL6jDpcFalb7sSgqgM41J/n0Fn+Bi+NxxOGC+++z1q6a1257mFr2NT07
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199021)(186003)(85182001)(86362001)(82960400001)(26005)(38100700002)(2906002)(478600001)(54906003)(4744005)(6506007)(7416002)(8936002)(66556008)(8676002)(6512007)(41300700001)(66476007)(5660300002)(6486002)(4326008)(6916009)(316002)(66946007)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWN5dnJhSlNlOWYzZ2NoMHFtakhvMHRqdFdlREdFdWZNUm9VSUtMOXZ0WUNY?=
 =?utf-8?B?ZWNGTlQrMlRzL0tmaFFRNWJ6SlV3TS9pRkh0UU9LWjRWZFRqak94UHlvTThZ?=
 =?utf-8?B?Qi9IdXhQRisvUysxTW5ncnFoamFjYmIvMWRvU2ZaRm1ZZ05kbGkvTFpBSFky?=
 =?utf-8?B?R2pKdGdXWk12RmxSM09vNE9IQUR1enpnNWFWakFRWjdoZlF1WlJ6MHZRdmVT?=
 =?utf-8?B?RDNXVFBqR1Y1SkpaemJxUGVacStrN0FWcXpHZjIrZHU4dzM5UUk2Ymt6ZHUr?=
 =?utf-8?B?RHIwNUhXRG1zVm5TOWp1d2NGOXNabVFEMURjRGc2Sm9NQWZTU2hMbEtjaDRP?=
 =?utf-8?B?V2NBWm40VFRkaFRBRzNsKzdSL0QwSUl3ZUEzZSt1U0cwQ3VhNFA4SzdHWlg0?=
 =?utf-8?B?WWRFQUxiSlBDcWoyR3ZycXB1bVBUOTNjZ0RuZHhzNW1ZR2xNUC9kNytwMGRJ?=
 =?utf-8?B?SS9VQk1UbmN2UDNTb252YklnV0RyelF5cGQ0VG1id2oxdFViWHBaek5ublN0?=
 =?utf-8?B?Z2pacnE3bWpSRDdCOXF0MU4rZDNxZFM3ZmRLTUZGWmZMNkdLcHZXT3hvcWZM?=
 =?utf-8?B?WmFMeVJPS2FPNHZxVXcrb1hmY3FZa1JsOVArclJSRzBQUHloTVYzbmlJbTg1?=
 =?utf-8?B?SEZRUGtvVGJBN0Y0UGxWYkMyMFBPWmpWRDcrdkJiOHZQa3JxeUZTc0xTaUdh?=
 =?utf-8?B?VFhwYlFYWFBTWk9iU0Z5NmVUSkxhU1d0L3dLT0VGR1hhTmxiY3pTb2xjUTJK?=
 =?utf-8?B?VDZkVXVscVkvUmsxZVFoWmlZUFBsR0xRQU4wTEUyK0JIdFJadkZxQkk0ZVBT?=
 =?utf-8?B?NGpZQmI5NDdxbzJIK0EvcVoveDVnbVc4bm8zRlkvbGxSNGNQRWd0ZUpmbDVY?=
 =?utf-8?B?U0lPcUdWZjNDMzVGZnVtU2tnVDVrK1NXN2xrZmNId1NPNVRWWEk5VFVvTHQ0?=
 =?utf-8?B?eVZlTVJBYW8vbTBkNllpUllEamFHb2JNNDlNS0E0TkpmcDRwYU5BemFPMW01?=
 =?utf-8?B?eXJZMWRmZDNnbEFNMU40bjRsbSsrWnFIcUE4Ulh1aEd4bWhya2pZK0FHbXhF?=
 =?utf-8?B?RWtmZ2wzK05RdVYzOWtKTkp1WWtVaXJEN2pUNnUrSi94Uk52bEJ4elN2RkFU?=
 =?utf-8?B?SGR5dVMwWnFuck42Q0MxR1BRMW5QQ25SSHFYOFFxWE9oL0h0ak1VNnFlYnJM?=
 =?utf-8?B?endCWGVWQU5IVEJsNmRQcG50SDV0aVFUdnl3RzZQMDYzRUMvWmVjNko0UHpr?=
 =?utf-8?B?ZlpIYmYwYzdkS3NWUzMvdU50cFhrWlBON0dlSlM4Z2Q2b014R1ZYV1VrVzFY?=
 =?utf-8?B?NVhJL2xiVG9iZ09jR1c4akczMFZqc3VnSUdSbjFaSzZadytScmdjZFlkcmdi?=
 =?utf-8?B?L1NmYmtySTdWTW5xNldtSnVVaVZicS9EdXd3cnRIMFdOLzV1Y1JYUTJZa1VR?=
 =?utf-8?B?aVlVSDAyR05MVi9KZ1ZPY3Q0Q1FHd1FKUTBpYW9WSWJCaFBpNjRZRDVaS0l4?=
 =?utf-8?B?NUNZdU1LbFgyRjBleG5nUGJyT1RnNWEyMnBPdTBSaUwwMUZUTXZmNHo5YzZ4?=
 =?utf-8?B?VU0rNHJVd3lINTA1WmVYb2FGYk5vbU5PRUU0cHJYMlRGMEJ5VWJaTngwemdm?=
 =?utf-8?B?dmxYR2RuUGttNGhPODlzWnpuSWVUTDFuN0U5WnVtRm5hK0JzOS9pRzJLU0da?=
 =?utf-8?B?c3ZQY25SMUw4K09hdkhUSkVmdFM2Mi83ejJtK1FXZVM2YkZQVEFkTlFMWFUw?=
 =?utf-8?B?V0xHT0NmR3B0RE1oOHY4akZWTmJuU1dKbGxBa0RIMnhwZStCSzlQV2pYb1Ja?=
 =?utf-8?B?Z2c3ejVsckFPTlpvazJyOHZKckZpNEpMVTlYOVNSaE9mY1NpTHdtWlZCU0Fq?=
 =?utf-8?B?NDNZQ2pMMVYxVHphdmcxQmZFVnZwWWVJUmlZTkd0dzRTNVpXUXJmVnIzR3ND?=
 =?utf-8?B?dGwxOGJVb2U5Z3hMRXVRMXNHZ3RwOW9GUFZXZExUSWdKU0l3OHEwRjc1Rlcr?=
 =?utf-8?B?ckhXZDZmYm42QUJCYktWZ011cStrckR6cVRTSkltSlFmOU5HaXg2Njh6RVB3?=
 =?utf-8?B?VFBFb2hwcStlQUdDczF5SVBBb2sxazV4ZnIxeGU4YktoNGtxVENKekM3dEFL?=
 =?utf-8?B?V1NFZ2EyR2NzR0VsNVRFdXEzc05nRDhzaVJqYnhCL0tpbU1Rd0hpYTNIcEJJ?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x0xnRquwMN13Y1eur+MxaI/7OpRo0YK3fxa64TGJBr87jcjUsXXp2FenQZB6JEfyfW6WXyX12YyQqMLeJYzQhQiv4Y+lOsbejVuxFfgzk6yQ/SeD+mfYV7lv3tGf3nQR6rZGB71LSgaAl/eBpsYT3hdKetZqSbQUaSZR7lKPf6NgvvaNVCZQQGQN08FEaoBAR/jVzRAbpSUji7TZbaoceU9cO4ghOzTSG8vNEn9y9ZW4gifw8kiTNXlLIkxg0n/2lT7xSX3olknaD8DmsMfwvyo0Ufbs8oAVlaclWVYdm0S4LkXQT4bA+njq/52HHvcPvrZtDOGD7gWZwjlARXNojKoRWL0eYPC6NNPUGApoy4Y+GIxJjGVkjHKc2dETympxJUupNtn8xFcVaH5tSXhT0fHct0st7sroDFovJwOaKZXaMarAp5LiA0yo+V0weGBxtaczLVNlCGkL57tJ+r6iticImivmL/+SE8ZJPt3cX1s0hk40oN8RyvA09FSC0lAG18GDA+GxGuk2fPXD5u7uuRIqjZ6mdFbv+yhoTG6avmhpWoCuIsgXXzKKkMbMVF/8y9cLNLp0H2oMb+++yuJY76xnWCQebXMnymUgTmB0IHhxDV+RaTELTLNUsHmMAbnBl+b9FdOEdL0Fl2pPlV3I/IOgZYhu/7jM5V+0knMa+P/P5sQ7rficrCR1vUpvpH1iksuUr6JCdlqoQ7/LsQsv6gVqQpj8APDhvvlEMcRy4PLSLR1zNoaaQsiUY9qpSKwm1JhU3I3+M+kSZJ5auC3GaUPOz11QfR8B6YnY35Q9QBNiN3CKslI/IAmXg1jLEdJcXty4M4QzNoJwng/72sCm21awOuVKfJOukWcP/nkksYn4xuQE9+wQgejW/Sz2dHOWQsxEKF2ZvM/NIT7n9zEkOg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e24f80-a485-4322-ad76-08db8932f625
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:06:57.6249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj4ruKahL+OptGNAwgMNn5pXG7ObINbLJS72Q6D2s2NvQgdY8qZ/gcg/XAzI4TDQdDGUOCCpu/WMkUAgaiURDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7254

On Thu, Jul 20, 2023 at 02:33:34PM +0200, Federico Serafini wrote:
> Change parameter types of function declarations to be consistent with
> the ones used in the corresponding definitions,
> thus addressing violations of MISRA C:2012 Rule 8.3 ("All declarations
> of an object or function shall use the same names and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

