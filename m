Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F6762F518
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445707.701020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0eq-00067r-10; Fri, 18 Nov 2022 12:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445707.701020; Fri, 18 Nov 2022 12:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0ep-00064R-TT; Fri, 18 Nov 2022 12:39:47 +0000
Received: by outflank-mailman (input) for mailman id 445707;
 Fri, 18 Nov 2022 12:39:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow0eo-00064J-Sr
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:39:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13e4cc9d-673e-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 13:39:45 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 07:39:38 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5615.namprd03.prod.outlook.com (2603:10b6:a03:27a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 12:39:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 12:39:36 +0000
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
X-Inumbo-ID: 13e4cc9d-673e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668775185;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=H7K4Aag3vTDVp4J51MMe8lRqvROnZ9FLKKtdV0iEWII=;
  b=dHHmHqI6caRZtSOgmDeoXwo1YEBwTDSrRohyC6fVNePW2ED5CtHWOBTB
   BfDqKrROVe0Td9oxdaUweZwWZkJfg3A8GBApaw7a7i2drEg1BbZk0sBIJ
   mpkJkmKaxlpVkwpxVEp4odx9eb9qsYasF1EioGPGYjGUkbjX8Q1WAyzi2
   c=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 84169468
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qI3Y/qz6lx11bg1l9LJ6t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 mIdDzqHb66NYWP3f9okaYuzo01XupWBy99rQFRrrSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV4R2
 qMWOBAjVTOoqd+qnYirS8J+htt2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rOWw3KnBtJ6+LuQ5udErHe87UovFSI1UWrlhOO/gWOxcocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICobFw0M5oC7pJlp10qfCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:dLVQa6kdwWYOotC6X7vYvZ+D2wLpDfNYiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhRYtKPTOWwVdASbsP0WKM+UyFJ8STzI5gPM
 RbAtVD4aPLfD9HZK/BiWHXcurIqOP3ipxA7t2uqkuFIzsaCJ2JuGxCe32m+wBNNX17LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGi8zXmIngaRsmAQdizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATtMr9xsBFDMmsjNFQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l4dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdpXf4u8T2SB8zFsIE3OtiA23kwntlmOs5/L
 NA3mqfuZYSJRTcnB7l79yNcx1xjEK7rVcrjOZWpX1CVok1bqNXsOUkjTRoOaZFOBi/xJEsEe
 FoAs2ZzPFKcWmCZ3SchWVryMzEZAVBIj62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 XtKM1T5f1zZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCE27RqqTw/K4+6IiRCdE1JaMJ6d
 r8uW5jxC8PkxqEM7zP4HQLyGGGfIyFZ0Wj9ikEjKIJ+YEVR9LQQF2+oR4V4omdSs4kc7Pmss
 aISe5r6sDYXBTT8P5yrmvDsrlpWAsjuZ4uy6MGcmPLhP73AavXkcGeWMrvBdPWYEcZsyXEcz
 A+YAQ=
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="84169468"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QseS7O1jqjNPJLVZXLx/1wgIgj55Vt8cphBoRnTn+tLzn4cT9BPhcvx9iiwRRJzt+VValYAl3cELn6E+iKnd0OPl0ni75Uz28JOswUrak+X9Eigbl4la3ua9RhHVZ3wbjrLaLH8mYHCtNZOlvVCxO2Kcg3terHqZGCPD+d6NK+z2i0n1/Glb0Phe0VsvDjgVC8oFxi/qktYYphwLP81dYWrKTjvcI1RIq50mBaARn1+b5tb9f33VWA8WnyKD66D781ti/IVt2MaQeFWdB7cLHGL6adTW5wAk4EOa8BkXSIHJMJ2RZtApJzh2dyGm2ELYA1iLixeo9gMAo0wLENV3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTllUH44jeX1Wx8iB86t1yMrqhZaOSZxHAOwvvW+GxA=;
 b=kKwKQ73yu+hoAiTpBRHIm26UbPLKJPc6zUwtrIuwM5k9javkJ6TG0V8yx1CClMArmi4nKWuCRD34RC7RCFi1N2Px+k69i8/h0ZEYkzcwHQuBWbwOPwbEDuUR7WkxVaa3OLh8eEIUzRljbJSmcm93326iEsJrPsmlEPKBHG+Z0OcMOqkIllkqyJrvCicSTFdTITx+zCWQ86agc3FmqusyPq62dK7JeDx0Y+dMZsA4L1tNU3SYFTtb0s8nihA+vwXjusgZeexv52p2NQZdtdFIDsZ1e6vWwzPJtRHoCNEPJG8HJEaL+NQ3H8313KpjnbHGp5vt92jTij5Ln2SsyEfbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTllUH44jeX1Wx8iB86t1yMrqhZaOSZxHAOwvvW+GxA=;
 b=wnYA3zZBsMrSPsMvbwCVEB94wnkEmECEQhV/U5sAKCFh2/eg1CEv8TSOoMmoa4qQUjAy6ZDtyJW5PfI69mWannMi9N+AAQZXPXFv4h8ZIOyXLrbgGOYWBMhmx4nRQop62uhHIxafvyZwqTJJpnmX9n4xFgS+9Rg4Q5AhBdo8vsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] efifb: ignore frame buffer with physical address 0
Date: Fri, 18 Nov 2022 13:39:25 +0100
Message-Id: <20221118123925.25363-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b68b86-f713-4901-de66-08dac961f30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QQ2d0SwFbeEBiTLW52+VOH4FktC7rqZCKOiwpu+5C01KqJpskVsy4notnwQ5FCepEDKwiOwIQ7nTfqoVXlq1UrD8aeyYHsKHabgDWXHjHK2T0BUVWx1ZIiew7dquRkBrOgTAekoKL+lREL4PaIuIZ+dVuFHppAsKVn9fWqywh0WQxFHBsbrfwdfN+F8QWcUxFOdvWPJVXq+sGgQqoyCvrfVBhJ9UVL5oshpDJVBx26L0R6Pdl5WMwfkEvQS+8FV1oH6Mh5sfP0py4WXl89GKfBsdOi5Cwdm8wZpM8kBjw4b1ulB3gfJodVfQ2Wqkxs9QexWZ1Kws0FltF5jxRFLTqn7cOOKxiFgyv7z64LeyalMXgohscqA7ijgA311XbLm+242zYGvjuGZM2T8z7zKGGkWjnZJovFmehAWvfzo1ZGN2hHY7E1uyysAmmeAADO7d3g2WTpNdtpOAeGfl6LK4nA0qFvSErzV2ANBdjjs+XWcZ9qGV1UjtHAq4iqhCbKtGrgqIRrIbGdy51oGQ1lYNs1+1lLWdkMkGA+2pvLuieHhS10tT1nnPbD/lFJoWCn4o22JfOtVwJ5gg6QBuLm39XZcp8T56Is/m/NsrTGxYD/Wj4Ie0OW59DwYYZbjDXkYGr28k11+k0gQyFK/NiFiZXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(6666004)(6506007)(6916009)(2906002)(54906003)(6512007)(26005)(66556008)(66476007)(66946007)(8676002)(41300700001)(186003)(1076003)(4326008)(2616005)(5660300002)(8936002)(6486002)(478600001)(83380400001)(86362001)(316002)(82960400001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzJLZE53Wjh6d0h4OFN1d0RmUVRiSFlaVk55ZFIxODVXYzk0Q0xIYmZCTUk4?=
 =?utf-8?B?OXlIV2dYUFVxR2pTNFNVSTh3VXhvVk9LSXI4UVJQWWJiQnZBMWhpLzBvNHZG?=
 =?utf-8?B?TC9FZmZSanM0Kzlub2ducHkxVHV5MHhzT1lmdzNwZTRLazJLSGVRbVk3ZXR4?=
 =?utf-8?B?VVYycjM1Vk5xaXNNYWl6S2lRbWNzTlBNWkhmSG5GbmlKZ0k3bmxQdE1KVncw?=
 =?utf-8?B?Z1NGNVZaTjJJd2VtdnZ6V1NEUkdUbUVUckkzYjdZRHNwaHV5U24waUtaRWU1?=
 =?utf-8?B?VVBxbnJ4M1VnN1hDd0VVekRGbm5KYnFWbHUwWnJUbXRPQ3JWY2N0YUFFOExD?=
 =?utf-8?B?MDZocm9LSi9oYXEwRmZnU2JyTlk3RVZQUjB0VUJyVUhwcUZwSnRXeEFuSmVx?=
 =?utf-8?B?RDltL2RheldjMFNkWXVwOHRlT2JLNnhySEVGbWFZSjlqdURDQnI5VFROWDJz?=
 =?utf-8?B?Wm9mVzNrZklMM21OdmlBZnI2VjkxSWt3YlRRMXVUekNrcTR5b21GTUZIUUY0?=
 =?utf-8?B?UytwdXJ5RXhnR1ZOTmIvSkFqY005QUR2RjQ2c3FFUTRzVlREVzAzZzlmcHZt?=
 =?utf-8?B?SnFOTkl1ZmRDMDhERy92eXRYdmc3UlVZanVidGEwUDYyMGMxMFV5WG92Yjd2?=
 =?utf-8?B?U2IrSm5MaFN6cUJqVW03OUpwWEFTcTdGNnhxbmV1dDJoT29QNmtpaWUveXZT?=
 =?utf-8?B?RVNLb3RhemFVSlN2OG9saUg1bFNGWmlKQWpQMkNCdjNjMkRqRSsrOGRaZFhX?=
 =?utf-8?B?cHNNMzlBL1FzY0RVMXFzVU5nQUdkQ1FoYkE3TGc1aHlleWNGOTQ0NlBES3NN?=
 =?utf-8?B?bEJEM0F2TmJIbVpGREltZEVCK3RiQjlkZWlKbERFT05YWitDVk5pQUkzaXUw?=
 =?utf-8?B?WVBkN1dkMmM2ZzdUT0pnQWhlZHBxRG42MW84citZM3kxZWk3SGx1YkZWejhI?=
 =?utf-8?B?VzlialA2UUhqYjltK0Y3SjU5Slc5S0ZVNUpOdnNpcnpxb1k2WFQ1UUpRZTYx?=
 =?utf-8?B?NHZsSTB1WFUzMmc4NGhiK0JKNFJJbm1IbjF4TUloN1I5N09BQmpLKzVNQzAv?=
 =?utf-8?B?bWhIZDUvMG1NMVRkWU9JSTlnYXYwc3RHZWgzdk1rU3I2YTlhQmZjTnlYNENo?=
 =?utf-8?B?U3FwamxkV2FjYzRzTWxEVUZXNlJkQWpBL0E1c0hDWThrUjIrM1RwL0tSVlBQ?=
 =?utf-8?B?b3N4YVRFc2FubzZ4STFYWUJ0QU4rU2tpL0E0bGVYdjZURXpIWi91YTh5Nmlj?=
 =?utf-8?B?a2x1RGhwMmgwMkFMM1E3UEVadFNBdXdxM1lvcDNoWnFqMUJJQVpHUjVjSkR5?=
 =?utf-8?B?TWNuZStSSDRyS0FjZ3E4S3R2ZHpDRG1kNE1xUnRQd2dMRW9sOWROT3BnR2l3?=
 =?utf-8?B?Mnk5a3c1WVJTL3BXaGFpUmNyVnBuSlpuL2Z4ZFhoRnZJUzVOWGU1cXBLSHBZ?=
 =?utf-8?B?TkNlLzlIUXhCbGh0eFgyYnU1eHdNZWhvQ0E3bTNMNU5GMDlKK3ZFbUk1RDlK?=
 =?utf-8?B?R1BkbEEzT0RyMGp5Q1RaMTlPU3VLZjRhZ1VKRlM5UDJwN3Y1M3FjR2JjUmVn?=
 =?utf-8?B?Um9SQVRKQkhNaExYZzBPQ21KSEFxODYwQlJUOVd3a0RwWDEyMGIrUWpZaDNT?=
 =?utf-8?B?L1BlcmMvQ2NvTzVERk94TTYxZTh3TWhiUzZjRnFlZHRnbStmRlZQemd5aFhG?=
 =?utf-8?B?Y0R6QWJkMTM4WFJiVE8wUHpxSzE3a0Y0S1k5R1B2dmhPWUVTdGQ2VGwxaTZp?=
 =?utf-8?B?T2YyMi9DVXBrcVByRWxzTVdleEpNYTJaclZjbDhpSXBpRTloUkQxaUM1bm5n?=
 =?utf-8?B?TFF3Q3N0WVJCWi85SHNkc28vSjhicFZuTWw1M2pIeTh4aXhiTWY0c2tPVHoz?=
 =?utf-8?B?V2ZWajZ5dDZpVWtBRGxOb09pM05xR2MvVDhEZGh2eDI4WjFCZFhKbzFaaWhk?=
 =?utf-8?B?ZWUvMm9KdEpCTU1xc2xLendWdnZESHlsTEpxQmF1aUY2ZUJ0Szc3cktIL1F3?=
 =?utf-8?B?SGxJNjRHdG5CU0YycHJJQ2M1c2J1WStEWVFHWjEzT2RhZEFIOW1ySHRpdDFm?=
 =?utf-8?B?cFFabWxpUkJUeUVzaVZPKzZuSGNGNzRwWWRMR2NFemRIeVJDKzlIaUJlZ0xQ?=
 =?utf-8?Q?c097H8FN0ZaGKARBz6nT/zGen?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y5PHSdeAPpH/DnzP3cr322OkoMa+UK40K3ddSg+KW5vdaOfeyVYT3zcg9B5HMmS8JxtnllzmtfXlDexugi9Vf0r08DmfU+BLmTeor61L7TJ4nv3g/VMBpeadSR83yW5Scsj8npd5JTpFaGUUnTtKlQ4q8W5SnV04lbDin0SMj9YZGE9ZPcbpIsZoag/FdVYzJagNRQpH716USWyR62XUJ/51ptXGMppSAABU5+gMM2fqvbZSnZl2gzZyGvCs8cPf6QBygokOOGU7yMYeimilKIkfuA7UWyFcw6Q1JnKyNaY3icELc+uav1nb5N/yFdu4i4cJ6AIvTENYIReDyjPEMSRAxz8UoXGQhpeF+So7wIkLD4nUO2fG3PpulVHun8ZG4zYS1ZRKhO6qeN3nUWiHa+zt0fe68spKf2o2796we8nMZ3CPsiRyEtZ/ps93bhrhLV3LTnjPGexrs44DTgsE+AOAaUViEbTqcW7MRQe5ZUeOtn4WpmxM4lmkL014aEOAkrY5iqtP6W/CU4INBJZVV2BrJ5q5NL6oCIY563qzxDjMlW0uVTZ9i+e9fSyoMiN2wo9MwCyqVCG1rum+RmHbOVCDjzRsYfkjxg4yCJAXTCBZP7cqdTYsbLSfaRlJiJDePyUyWVmeTflsXG7p5OHgjUCJYA/qQ4hYyMcHzpHPdRRJ2f8ZQnVzQRsAWF6xWVTPbZZCgO2elNCulPsYcxXaN64aLOB1o/4F3AuZSQVWHH923XUvDzYJ3P1m7mnjDlxVibj3fIOklZwaKEHb3wB/+A26VmaDlN8Ka/1cQ8pF0CE4k0A31onQ7e/ta5NhFWHfggYUt0cGiK9YcKRK5JlY3Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b68b86-f713-4901-de66-08dac961f30d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:39:36.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sfV7Ta31B3SIJEg698R67CkTY+b1FNrJbOYKyMzIql2VCoeXvwmdlNSGtx1V9gEEXDb8algHwLKKN2sHWhaOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5615

On one of my boxes when the HDMI cable is not plugged in the
FrameBufferBase of the EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE structure is
set to 0 by the firmware (while some of the other fields looking
plausible).

Such (bogus address) ends up mapped in vesa_init(), and since it
overlaps with a RAM region the whole system goes down pretty badly,
see:

(XEN) vesafb: framebuffer at 0x0000000000000000, mapped to 0xffff82c000201000, using 35209k, total 35209k
(XEN) vesafb: mode is 0x37557x32, linelength=960, font 8x16
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:0:8:16
(XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) �ERROR: Class:0; Subclass:0; Operation: 0
ERROR: No ConOut
ERROR: No ConIn

Do like Linux and prevent using the EFI Frame Buffer if the base
address is 0.  This is inline with the logic in Linuxes
fb_base_is_valid() function at drivers/video/fbdev/efifb.c v6.0.9.

See also Linux commit 133bb070e94ab41d750c6f2160c8843e46f11b78 for
further reference.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Other options would be doing the check in vesa_init(), but that would
also then apply to other framebuffers and won't be strictly limited to
the EFI fb.

We could also check in vesa_init() whether the framebuffer overlaps
with any RAM region, but I think that should be in addition to the
change done here.
---
 xen/arch/x86/efi/efi-boot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index e82ac9daa7..a68091d82a 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -552,7 +552,7 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
         bpp  = 0;
         break;
     }
-    if ( bpp > 0 )
+    if ( bpp > 0 && gop->Mode->FrameBufferBase )
     {
         vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
         vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
-- 
2.37.3


