Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027C71075B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539364.840161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26NS-0004CU-3t; Thu, 25 May 2023 08:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539364.840161; Thu, 25 May 2023 08:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26NS-00049a-0s; Thu, 25 May 2023 08:31:18 +0000
Received: by outflank-mailman (input) for mailman id 539364;
 Thu, 25 May 2023 08:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q26NQ-00049G-Vp
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:31:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f395b56-fad6-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:31:11 +0200 (CEST)
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 04:31:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5559.namprd03.prod.outlook.com (2603:10b6:5:2ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 08:31:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 08:31:01 +0000
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
X-Inumbo-ID: 7f395b56-fad6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685003473;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=7Etvq6HWq75pNMbdDFz1SgwhJaT/TYJZe0IHPAFYX24=;
  b=Mhip75Ekv/KhfPoWRDpJQ0S8cBIBR7KqtrU0fUTNWgMgIrKpa+HUmwMi
   ZOzq/Fp/lpKRy+K2QV4IUi10EI4uWWr6SoddB9UrdqQNTgIQg6Z4sgeV2
   Xr6r1ElLfS/duualMIhV80fK2C0pGqDorjCOOr1kEf2xgmBz9syKkGEha
   g=;
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 110222491
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R3gBlqshsvqz7BaQBirl2iI+L+fnVEVfMUV32f8akzHdYApBsoF/q
 tZmKWiCPK6JZzSnL9Enb4m09U0OvJHUyoQxTgJrrSxhHioW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKEyyFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKg5XYBmomuiMx5mFabltgPkbMo7PM9ZK0p1g5Wmx4fcOZ7nmG/mPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oujP6xabI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiANhITuHpr5aGhnWQ4l0qODQocGKSpP+fkHWhWY1+L
 WoLr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9dJ6G3rKdrDf3My5FK2YHPXMAVVFdv4Clp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjPNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:Lf6EtqtJ7XkPnYrFF+55ifPg7skDYdV00zEX/kB9WHVpm6uj9/
 xG/c576faQsl16ZJhOo6HjBED+ewK4yXcY2+Qs1NSZMjUO2lHYT72KhLGKqwEIcBeQygcy78
 tdmqFFebnNMWQ=
X-Talos-CUID: 9a23:MB179W2W8J7LqGZH9Nw8W7xfGP5/fHT20X3qJGSGKjZoToCtVxi09/Yx
X-Talos-MUID: 9a23:fUOYkAgc8iwSs7qwx8ZVoMMpN+NZ2pSHNmU0uJAAndO/Ki4vGjG7k2Hi
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="110222491"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKWy6pmni5ibF0o04yvQtkOUGcbQoTtPMg3c6/f+R5ymYeOvrfv0AUy2kcgYMC/h8c5G9qwwD8Qu6TNAKgAYRbw1HXYqxpu3zaW1WpzJ44bgF4nw8CO5oXypouWnKMWhrtMfZnEhiCygNwNjotbC3XfjsTn+LaU2nrdS7RUaU2MWGO69TT4eecjDRF+qvFmRs9M5WDKAJRUg4+c3GcX2opcyOFNU+NNJ+Phb6ztdnZi1OQDhfgS4d3G9nZ7vk/6hQWpiOUbImoBk/0sjHvHcB9gqj+cWuTmX4ikcEVnTYnYGaGHdpaYSBifl75U3raOGh+rv0PEFYa2NFstcsLG7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSg29f/N1YhWUe1oKVP2tfbEbXqkMVXNz0UXS8Yow8E=;
 b=L4kGga43soRYHgjRml9K3+jai22AWMMWuvacd00iVUgOFa3GXJ3aUkMX2TCbHr4qMc+eVg36Xo/sFaUYJ7Eul53TAG2wZYMHvxnCtGJU1O4W5UI5Ae8nBdbjcITKagU/IE71JYQNjVKdQaZd3J5niXGWDPu5GmvWm2I16/YcmY3IC8gAyTe7FyNIpX/fp2x9EgZIg6rqMIyQTZ68C2UzpEI1RrmSi3ltL4dRRibIBVeGhEU5c5a3afkOa6fNF99qM9ovC83GPnpFtqdXG0NCQQ/RZtsK4i7xS4spn6O4nBzZHfs5j4igEL8NL92ioVJqo8VqxfZsEwrhmCRzRdU+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSg29f/N1YhWUe1oKVP2tfbEbXqkMVXNz0UXS8Yow8E=;
 b=DvihjvBQGFAihhV/BVNAF6vKyHTZuTEiy9k3jJlvIzSjJUvY/SEGfbKkphwpyyh6BgvoTxHOG+q5f/OXOYrT0WajGSAUddGdhBTaUXg3Lc45b8Yv3h2zffIPBzLs4LXB46jXdByhnrporfmUJSVhcHg4jTGNeRl6zdg99Gn0UGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] vpci/header: cope with devices not having vpci allocated
Date: Thu, 25 May 2023 10:30:51 +0200
Message-Id: <20230525083051.30366-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: f7976430-eb58-4fe9-500e-08db5cfa5f79
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nmjRlqR4UVhMHf8a7PT1Jd4KR82T8fwvECPzEDKQ1eqd/LJthIUIfbHbaf8jizuI3O8hOD/oDkcXZ3yviGBfB4xufmmnGzXUarw3/QlM8VQkzmL+ikbkJd3BMW02+K5Nltg3cxQ8pWnhpYGYtRfRxLIjvTpxYuk5j7BFIdJcN6vGcgZVM5/vBHgiZWsbSvQCg1cLLH1Xd4zzzSb1zigcPvogIYeVhYqjdlA1hdwjz4ogAaqjYWDfvgBzuu7P0rh4MJ6EE3ykb3CrUO3Vw20OsqRou3q2v/Qntijpoo66kNQ4OdWO98YYjXYEbv1jCiVbXmgD2XElOsT7DayikoHZrFvAnrbbvbueBS75L/TbyKkipZ5aGrO/Or8TKlo2YZVhg5hHH0e5AN8q+pj7oznBUm8AsTALYCITiPTWH0waDOWN7xCPY1t/Balqdm/8n8YR6TVA+Fq8v7RJfVABdTM3c0V7VZc5xdan67hUKwny2p3/9tuY0qiju21FA2PCcUjZCtTDGiAPtYAoUdR4c1TqBKzLbNk9gEqVUSusV2CWhgfdn6Dn+Iw9tD1a1vQhkHvH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(36756003)(316002)(82960400001)(86362001)(38100700002)(8676002)(41300700001)(8936002)(66476007)(66556008)(66946007)(107886003)(6916009)(4326008)(2906002)(186003)(478600001)(6486002)(5660300002)(6666004)(6506007)(6512007)(1076003)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUlKOFBvcHZmUERrMmxxOTNSMkY1RzBxbHVxNmdVVWJiMitONHN3eEFoZk92?=
 =?utf-8?B?S3VsOThRWWQyY0tHS29ET0xLaVlxZ0Y2M2dnajhDdHJUT0VZNTJDRWJuMDdj?=
 =?utf-8?B?bm9OejUydVBnV2hEaWd6aGlnZ1ZMM1YxRnJQUWFCN3dCZEVFQWRpSytFcXlB?=
 =?utf-8?B?TlBtZ3FMY1ZUbThpVXg0RzJyUmE4dzIzRWZXTUpndVNkenNWYlN5Lzl3ODZ4?=
 =?utf-8?B?VEl2OXJVWFZZZTZrY3pjMTNKeUtiNFMvRVRtQkhDR2R4Z1EvaS9wZTZscmo1?=
 =?utf-8?B?Z2k4WWpBYVpldGhEakpEMEFuOWphdlRRWmorU2IwZHNBdzNha0ErNzJsWWpI?=
 =?utf-8?B?a0djUlhHTHV1MHRmMm5JVU5nK3A2K1NDbSszenZpL01vRGNob1VNeEV1YWcv?=
 =?utf-8?B?YjdHdzkvK094d1ArbFhvU1FzL2pFNDB1UUFjZmRvTGZuNk9tbVBOUWZMdDB4?=
 =?utf-8?B?RGdWbFVDN2R1eHpFNWl4YUhsaW8wbEE2aHRTMlQ4cjcrR0dQQTBpeHk3elU0?=
 =?utf-8?B?NmNTa2lYVVFrcmJYZks1cUVXMVhOVGM1M2V6R3pnNDhjWVFqOFhhUGJBbllQ?=
 =?utf-8?B?UlpxZkpPajJ4bGQ4YzhUWjZRcVNoSFUySWp1ZEVsOVZuYUZLTk1oN2N2SlN3?=
 =?utf-8?B?dWZISjN0azMrd0ZaUzVSWE9XU2VkRFU0R0V3T3JCT1FKcSthaC8vWDNxWFVJ?=
 =?utf-8?B?aEIyVGJGVmRmVEFLcmp2WGtoby8rYmdHNTMwUnR1TUd0ZGxpdXhLZUI3ZzZP?=
 =?utf-8?B?c2F6VEQyWVRzZEswYW5lN1ZISnN2U0c3L0cwbGczN1V3SkZDRGlTdzFPbjBk?=
 =?utf-8?B?dE9uZXcxRWtrQUlrYmtUTS85KzdWeGxjNEFveUlKZG9JRDVVaHJXMEpQUHN0?=
 =?utf-8?B?V294QkNxUU52NWlMa0FUc0FpN04wSzNicll1NjVsQUp1WmdhYUtkNnhVY1Y5?=
 =?utf-8?B?cmlaUDlxZjVJRGZrcDZwODg3dWgzY2VUL0hpVVo2M1JYNEo4MzVFaENzano3?=
 =?utf-8?B?aktpOUR0L3M3S0tEQkhyMmVCNzBBVWRhSC9GVFVraUpxOUZ6MWg1UnU5ODl0?=
 =?utf-8?B?SytreGQxYVFPUGhKc2RuUWtua3YxcmhHeGZZdnI5K05uU0dKalkrcUltT2RN?=
 =?utf-8?B?VmdCZzhoSDdSK1JiZ3VVZzdsb28rUkh5M095Q2ZXSlZnSVExVjFPUFE0K0th?=
 =?utf-8?B?MUZ1d2Q4Nm8rZER2a3FvRTR3c2xHVHoxUVEwVnpzNFQ5b1Z3U0l5cVBTdTlF?=
 =?utf-8?B?MUZXdFpsRmhDdWhtUklYRmtTUnkwY001dStwQUo0Vmorb3pkMTBKc2JtU3Vs?=
 =?utf-8?B?NjN3MFpDTG1ZUlNBK3BxaEY2L2ZiUXNJVFR0dTFYaHRObFFmMlJkMWc4QTgw?=
 =?utf-8?B?WGpwUlhqTG9RN2k5alNJY20yR0k5WGhhSUVCc3c1NDZaNmlCVjdnWGMzek53?=
 =?utf-8?B?UmF3SHZ1Snp6SkFXYmMvbFIwMkdVdFIzZVN5czhEbUlZc0Ura01POW9HU0da?=
 =?utf-8?B?dTJ0blZDcHNUMXhFaG1xbzJUSXVRR3F2S0dWTlBmZlJGUUcwTURYV250enZH?=
 =?utf-8?B?OXNvS0FKYytSRTZOMXJPSDBaU01wNFlFTlp3cUQvMyszRzhJTDRrd1p1SUg0?=
 =?utf-8?B?dTlScnUweVpuQUZRcGpUNml4TTFmc2NmdURTK3RHL3hEUStqdGkwM01kK0NH?=
 =?utf-8?B?M1BuSjdXbW1lRG1UWlA5bmRpMTBHRDF4UE9ESzVIRkU2aldEbkhPdW0vMlV6?=
 =?utf-8?B?UHJwd2VDcmdZemtGbktRWE1lb2pZbkpNQmxqY2hidWtOQzlWMHRjc2g2R2NC?=
 =?utf-8?B?RTAxN2VpTTJWTnlXZGhVb0d0dWdMQXg4NnFVZ0tyd0FLWHRkNFRPNW5UcmpY?=
 =?utf-8?B?VWlNcWZHODFBa1JBWFRlM1dVNWxJdHVlVFErNXV5S1UyaDhRUTZhNWNIdmQv?=
 =?utf-8?B?SXFFYUV2SnhHQ1JjVU0xeXUzYkZyd0ZSMFhTMkRabC9UK1NLU3FSWGlUSWtx?=
 =?utf-8?B?a29uZ1JJd2ZyNGNWdDl5Zm55WE1NOFlWUzY1NnNPaDYzMnk4SHFQLzdDWlBz?=
 =?utf-8?B?RjUxL0krd2RZTmM4Y1JQU2t4MWF1V3N4YllRcS9yZ3lYTUs1b3dGbWxIb1BZ?=
 =?utf-8?B?Z2dMT3ZRR1JaMFo2MEEwNTRTZU5wb1BSbndKUnVqRkJFd2QycFpqSUhmbjNE?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1DZvClAXp239OI6jRC1WTVdF3u2K57CGochlkSJN+NFjxJtWNiGNdS7xSIPZQQvaSVPKLtB5tDj/O9IR7nK1UMHGh6WEH88qcB7MYXqnKCIVJOayq9QuPksyyaeQ9f94nfp3ftMXkNra0m7Zrj8bcKYQFFDDIlOrNgg9vFWHlnNpV5nXMX+x7piOdayEyOPTNsOEAQV5EncFTpovJZaiOn3R2LHfdMGgdOz0xmk3P/wpu/R3krj5slWXydmyIoAevOp0qMLRyIuje0/BbEmdrf92wVbO1L4wm19iRFnwGlzJcCwS7JJIItueswmi07mE0TH5/FSCxC/ib4KgR2rL0DDVkjI3qtCl29mSVgpujkW/yr8QOFmU2ZSwFsL+Zq7SDiac4iA3m1zuSQ0G7R8R5XgFgH1Bj/ec9wiPzc7MdZnMBFsYEsuC5JpE8rb+WGMIkGhMbEBFmDzy4noqwi7lrJ8TaOfZ+4vzFsDGBzONGOYyuDF/EnOkaVe1YJSLRAeOLGSFu8sqqbpQf+cudqPvaEeSQD43BT7v9WKGYXNL9TGzQElfCGuRMqcv95aAEQ1RlV6IX0MJ9yKvh+3+smqmv0K3BIqvHQoA1qcIG9P6LRGDExi8N5/Dvn5KlciYWDuDCY0Dt3kx5FAeJ6Qb2ysLUs4k+Bz3sClnc7rezN0TPfy3c1ZAROBvt8+O6ib8KVXmEQPZJQK4wcQqjfI7VhoH1isGKNx43SvDBqQeGWbMQFyxf2d+JhSyh9a1a584i5TfX/y7Yfr0t2Wfxd2GbrWTnKM683+8gTow2OICW+WOPHY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7976430-eb58-4fe9-500e-08db5cfa5f79
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:31:01.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm2CmLV3RRe2ruM66e+Zx+Qg6RdDH49MhH0R7uSD2VMAcWRnKCkJSNMIHIgZuODZgms2/DFSoeTNWo8rNeGgiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5559

When traversing the list of pci devices assigned to a domain cope with
some of them not having the vpci struct allocated. It's possible for
the hardware domain to have read-only devices assigned that are not
handled by vPCI, or for unprivileged domains to have some devices
handled by an emulator different than vPCI.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec2e978a4e6b..3c1fcfb208cf 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -289,6 +289,20 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      */
     for_each_pdev ( pdev->domain, tmp )
     {
+        if ( !tmp->vpci )
+            /*
+             * For the hardware domain it's possible to have devices assigned
+             * to it that are not handled by vPCI, either because those are
+             * read-only devices, or because vPCI setup has failed.
+             *
+             * For unprivileged domains we should aim for passthrough devices
+             * to be capable of being handled by different emulators, and hence
+             * a domain could have some devices handled by vPCI and others by
+             * QEMU for example, and the later won't have pdev->vpci
+             * allocated.
+             */
+            continue;
+
         if ( tmp == pdev )
         {
             /*
-- 
2.40.0


