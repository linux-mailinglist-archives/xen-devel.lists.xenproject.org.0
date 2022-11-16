Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FBD62BD97
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 13:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444287.699325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovHQ8-0004Zk-7h; Wed, 16 Nov 2022 12:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444287.699325; Wed, 16 Nov 2022 12:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovHQ8-0004XF-4w; Wed, 16 Nov 2022 12:21:36 +0000
Received: by outflank-mailman (input) for mailman id 444287;
 Wed, 16 Nov 2022 12:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NgR=3Q=citrix.com=prvs=31293058e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ovHQ6-0004X9-Cv
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 12:21:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3347b39c-65a9-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 13:21:32 +0100 (CET)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 07:21:29 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6922.namprd03.prod.outlook.com (2603:10b6:303:1b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 12:21:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 12:21:24 +0000
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
X-Inumbo-ID: 3347b39c-65a9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668601292;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=gbJg46Owb4LRu9L8x32QNFnfvyM2Z6HugNVpo+DEoLg=;
  b=cqBR4ccPuIgX1DVSoHyqwwKrG1YcjZbo31NPHz8GsUMxjMog6S6GIU8n
   RXziDRjJyiY6zSIRXNJBxIE8NtaijTWggdnJsxMrdUEF9bImd5kpOqiT9
   1WDPB35BX8MxX92DErvcGNX5xbNeVZHffYagu9XOSHOb6YyZSjF1Uao6j
   c=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 84932978
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jmMVCaihVsOWwgiDdFuueSUGX161RBEKZh0ujC45NGQN5FlHY01je
 htvUGzXPvbcMGr2Ko9xPI61pEtX6pPVzNZlGVY9+yo9Fngb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QaAzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQbEBERSUzY2t6L/6Obe8BO2u4AIJDSadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+qA9hDS+3QGvhCnmOiyXEzVxcvf2C2iKa2l3SkfPEOJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhpigqVFooyVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:bHo+jatDTlA9N5prwtnE9VpO7skCAoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPEs1NaZLXDbUQ6TQL2KgrGSpwEIdxefygc/79
 YcT0EBMqyWMbESt6+TjmiF+r4bsaO6GcuT9ILjJhlWPGJXg/YK1XYDNu/XKDwDeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iEnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjXuVm2Hqr8DVTC8zT5Mpv/MuTjLpr24b+P1s2q
 NC2GyU87JREBP7hSz4o/zFTQtjmEaYqWcr1cQTk3tce40Db6I5l/1pwGplVLM7WA7q4oEuF+
 djSOna+fZtaFufK0vUu2F+qebcLUgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4REz/
 6sCNUlqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnP2rYLt6rld3pDmRHUx9up9pH
 39aiIYiYZrEHieSfFmnac7uCwleV/NEggEkapllttEUr6VfsuaDcTMciFtryKamYRgPiTqYY
 fOBHtoOY6dEYKXI/cu4+TfYeghFZBMarxhhv8LH3Szn+nsFqrG8sTmTde7HsudLd9jYBK1Pk
 c+
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84932978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpBVgqQwULCPefJ5P29hQi8rbPHtR1TV+ZCVgNrhCSK92hWuMIE2Jhz7FzncSXyEi8matPwS93g7AqI5UTwGuElt22Agd81yVctbGwsMx+OyB2oWOMP5dW0INeV3cYsgjFX7/CmDwM5QNRXHWnq+ACH8zgFHI7szG2IXMpg5MUzJ5KOCVnjKHzxerpsVIpIz/LDc6XeBQgt7RY6ssKmHyDf2xyF85Z8MwNqwHbt4BTEKNza97I++k1s9Wqb4Hm261W1fvyorlWMZBT9fTrN9U6zaI0t1iRIp3MTUNSPPsEgFCJgHYOycnjlIUytm7D9bp7QOD2RB1w2H+3dNkYT+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0GHGNTLWnzPh0GtHLDMx3fr+H1OyOCnHcmXOA+Mh5Y=;
 b=cDiKXgfdmo5pR0gAPQkuHxXqvCvgAEk7TEskk2X5EIFgaHEV1PTBkKrKGxBMQcq/SCf+4JzYpgHW1c8DDyWP3pWXTfWcm5luZK/xCE2HmCVn4ytR7MWG9RHJVytzyU5ZKdgrTBlrLhqA1yPy3avLK7XGiMDpSjLo5gXpIL8oNCxt1w7fiaKjaMNuEBv90ojaB0ppnu0S1K1Jus7COMoyedil3i27JB2QrlTn7SGGDrJvpHSK0UqqwLl81olHIbnLU9mKTpe2EPRDemRRqhsBNKoNc+drxEQ7I1yZ2e8rAOt3vAWRFsjxDbs2e1QI+guimOuyg02YQhg4Hf/58M4E4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0GHGNTLWnzPh0GtHLDMx3fr+H1OyOCnHcmXOA+Mh5Y=;
 b=bWxgeg2HBeH1f7Mji9u5W5mCKbQjC2GdO3bzmJV2Gj+RCZC/90wA8rpYsdT7l0kXp3xM/FZhN927LSfkMcr+HYOAELPefBU7ARSo+WGG0uktVGg0P5hp0AdVEISDXdLmpiymC3hxw8jf1DiAqg/cto0os6jFGbvWLzJw802cc+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/irq: do not release irq until all cleanup is done
Date: Wed, 16 Nov 2022 13:21:14 +0100
Message-Id: <20221116122114.5260-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0531.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 3229656e-1a59-4a20-288e-08dac7cd1334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKMbAZ5V/dmwuSBPKw4r7Ktm2JygOEBg2WeHjjgpndmKv+F/xg4V2KmTv8mviPZMi1WUIQbPFBmT8vWQUwMmIajMwSx9zv7oqBo+dUBvlAmyVI+0ysv/pLqyBiqak2mCuU3UOkD4Y4uXFlVhS1lx3KJnb/ZUjgrmJHM0Et3K8zIZ++7Rkgq92TdVIff191AZe1o47BWZf6eMnc8aWyQhYEnToJMam0SGUilmZ9BLppezVeAHeJYc4PpkELSJ637v2G/wTptU84WlFDV5Hs5xCeufcF0PUSO/YyLbkBiwobfExxmFSD6oO6aIosmNPFJZ0ZYOGYBdous+hJIhmsE0Mq5lxJH6LEv0j/eH12pfOp+IuAQZ05g5F3CBn7QHNQ1in0ZOL60c6A9lkhjZ0bmA78pFmDbKuDw6/cSXev2GxFjmUdTDc+/uA4ClxDy2kXFt42rlTfz4YoRU5hdFjVhmRV1boIJ3ZKzpKa4uljM9qMm/QhMaD7S2IqAhaG8l7D/N3i/vCNDvj32H72AQ7CZmVU3UMxlQEQQzZPOphdva1/9aiJMwOiuoEtoo9hY+zovya3Ce6uhTXZ8RFAA9OINKZ1JqxWvKE2yfnOnAzwDPvimeI/bUjRNA4QvlMJiivEDCOYVVYukxCV4DwF7IjnabLN9Fwe9GrZr/+zqpHXuNlV9rpo7aMByIqwYRZkrps2i4ZUzTmjyWdTnYOxKspsHXlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(6486002)(478600001)(6666004)(6506007)(6916009)(54906003)(66946007)(66556008)(66476007)(26005)(316002)(6512007)(8676002)(4326008)(8936002)(36756003)(2616005)(186003)(1076003)(5660300002)(2906002)(83380400001)(38100700002)(82960400001)(86362001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NGeVF5NWs2WVhlNXJTVE1yUEUzNEZ3VWkxcG54aFpUZUptbnp4eDhPcFoz?=
 =?utf-8?B?NEp4aEd3UWNVSlV2MVc0UjByWm0wekFMRk8rcStBeS80bXl2V0o0RlpBOTg4?=
 =?utf-8?B?ekp0UnhjMXBZQWU1dmlPQlpmSEJpaGFMWmxpUDRtbTFBQ3U2bmFMbUQ1OEVQ?=
 =?utf-8?B?cURiL0x5SXJQYlhYNUJDNnNpallMWWErdk1aQVBrbnBYRUNMRDlEM1dQL2ZB?=
 =?utf-8?B?U3hNQTJjc2NwSzNBcms2azBLL3NSMjhPOU5TdVI2TUI3QkxpWjE3VG1STklI?=
 =?utf-8?B?QmlzYTJRYVZvU3BiSXh2TWlXNVZ1UTR0dnVneFJuVW9UUkVDS0trQkNlUXNv?=
 =?utf-8?B?RHdzOWJsbUZpblhEaHJOQnZ2dFdDSmlKblBTSjZxcDNheWxtZjlEaDFGaUtI?=
 =?utf-8?B?eldTUG5yNlNoSjBYTTRtK1UydCt6emlLU3hud2JXbmxmNW4wSmVxaGxjTVFn?=
 =?utf-8?B?V3BqSlEyaG5KZzNIeWk1V0drQjVhYnBuMDhiNWNBZFE2V0pKQUNJZDlGYXAv?=
 =?utf-8?B?YnFLYzRFWUJrUGd5Z2RIS2J3b2l2dWFtY1M1VUtLNjNQZmpuUlRPY2dHeXNm?=
 =?utf-8?B?eXVpM1FvZnhzYmRaczBJbzFwaGRKT0ZnaHp5aVFtd1dXQ25yci9RdHVHZ3B3?=
 =?utf-8?B?VU51OC9xandCTHlYS3o1aEtaR3ZZN2NLR0RZMzZnNElvVThxVkhTVUpSMDlB?=
 =?utf-8?B?WXVyTWlXMmJNRERuYlgyNjBXNU5iNFpGL0tZL2dwQ204ME9ucHI4NHNOckpt?=
 =?utf-8?B?WGRyc0FLeWQrSlpYL1lPSmNDVmlHcnJwenJkWFVZcE51aU5DLzdWWjlFNXlv?=
 =?utf-8?B?Sm5OUG9rUmFRZlV5WTEwOXkyam9pMXYvWWJOR1Q0RjNsVWgxTWljYzl1SkJt?=
 =?utf-8?B?Q0FJUElkb0tRMUoxODBmd0dLajJVQTFrV09tRkxCZFdSVGFBb0dZb1U4VnVy?=
 =?utf-8?B?QWxCVHdhck1EU29GcEZYRGtYYmY2dUc3R01EODhTaE1oYXY4S0JycUdOS1FV?=
 =?utf-8?B?MEtRMk14Ri9GWFZuSzExL0ZSeE5nSXJ4Z3luYUdEeVFGeHQ4MXVhOWFURnJP?=
 =?utf-8?B?U0Ryek1YV3NzVnZZR0l1VjdhVExKb2FpV3l6cjE1Ylc3Y0NUMUZaeFhNRmVw?=
 =?utf-8?B?YTVDclBkaDR6MVgvNmd1Uk1RQ1F3T2pybFRvUS9SaEN1ZXFYeUtQblp1Ly9u?=
 =?utf-8?B?TW5LemZERVVaQUJyeWZBV0ozMmN5S3c4YkNKV2NjckE5bkxpcmduV0l3eUFV?=
 =?utf-8?B?OFJkTWdKS2R6V01wUDZGVVRHd244cllna2RheUdUcWtHZlNDRWlGMHM2cXNz?=
 =?utf-8?B?ZlNtenFhUjZYYnZpMDR4bTFGYlJNcy9xUDJ0TjR1bzZ1b1V4VVZZOG5ITHMy?=
 =?utf-8?B?SWFKeGVMV3RPM21rYTlVYWlkTXFNWUtVbVJPUGNkcG40N2pKMFZxR25aSGgy?=
 =?utf-8?B?RVl0SUlmWnhjNFM5WGh0TW9HcUF0ZzVsMGlDUmhHeXRKNFNqdkgwTXp4RHVs?=
 =?utf-8?B?Z2gzVDRhOTl5bkV5QVVEM0ZtRUlXeWdCYndjNG1kMWtFQ05xSUZiS1hQUlM0?=
 =?utf-8?B?ek1jN1RraCt0ZUJaRU5aT1VvQjdRNnd0aS9rTnRuSmt3YTRIWTJzSWhSNzJY?=
 =?utf-8?B?RnE1ODBob1p1MHZneEVqcUU2NWZwQWNRU2tHZjVicjRicUROVXRPOG1FNTNz?=
 =?utf-8?B?SjhuQ3VWMCs5UVo0eXhNekVuZk5PUHV5OWN1THpnbndhbThxaGk3ZVV0ekU5?=
 =?utf-8?B?RXAxWlltaWtxanE3eFozblZLRk1DQVBiai9tL2xxVXVBTmlMNmZEMUpmcVVh?=
 =?utf-8?B?MkNLYk1LQzlENlZLYytMeThpMWVFNlhna3BKaUVMMzNDRXV2YjV5bzU3RGFi?=
 =?utf-8?B?dmkza0s0djM2YzBwNXhsWmhIa1JLTWkxdy9GZTNRQ2FsL0tkNnV6SG93WjIy?=
 =?utf-8?B?SFRzV0xYS2NtTXdSN2szYVlHUFRKZmRBc3hvazg0L0JoVGZxTHZlM1Z6OXFS?=
 =?utf-8?B?YldRZWh3N1NUZG1FdkJNbCtQV2hrc2UxeHR3cUNNaDdtaFBwVGptTGpoODIr?=
 =?utf-8?B?NG9ocE16WXd3UlNxMzg5TnQrRTQ4aUJuUEs4YTQwazNoSm5INVhGMHc3aTZx?=
 =?utf-8?Q?kfkEj0+Y3ROWlw+ZB0EAQ9mCu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nYg5Jq2xTiuBB/yNEzBd1gcg6HpeO3+ZmnVBsVtDZzcidbPmteiX510gsz/NlNAnwAD89aMTXOL8cly64O0dVdLXMxFj7G8TAXnQiT+rtamZJRUX2ttsolFLdfgkOVVKPnlnqurit2Cr5/SfKrh0RgF0fp6iCqztI+ml0EvzQ1KezyVYjz8/iIaNQgqrwXMIPukceePD3tRt+ngI78TvHgHmBtt8NIGX98tBRnRjhJnv/cDTlDX42GbH4vMBrtXtMojogsKWomh7n6Oi1WA45ZtEST44/yRbPimFzC7t1t0kJYbxexGarF4j+9lXNoeE9iaZJHX0BWKagZL3k05BgDsCIJ0T8dlo0Gk/hnAhwAG7vW3GET9KDURdcnDl17HdkKMsTiQOK7ub2P+TIL3AdiFBS20PIcT3zUpTx/cwsTovyYrW7RedsiAjCsb3r4g6GqsALKMKQwrVi/NxGUSmTK18FM8M9hny44X5wHF89dmTp7ywtm4ch4WKP4nCxVUSU71osKZJGNUBPm29xfkPFX+FG5QV7yHmn5FRIpDEQ0hIw9Ienph8nBuI2Xc3K7IaTEjrKevb1tJgacBR4/KaRVmiZPvqHTvRTsmnB6LvvLfCv0CkaQrja3qulqedvvLqgY7GUvGwvV03hRP5ag/N4wbCIMrxNhNdmyzxQdg4IKxCYIIGsAqjrYNabU110An22qSW9khqGBjbMS4flJIjDDfCK0CgMl3xrPEyxtmX2CXbYHEOBfQ3H7tieRGJGtccp6q/nb+ixd1beeLzuhVFzHSz6TSHS8uDxAjS9C3i2xX5t87NFy+GNI4d/cAVwlTu+DKo1wq1oNfz+xq9KVRRrQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3229656e-1a59-4a20-288e-08dac7cd1334
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:21:24.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JslXGUR3i9xfST9+MWoG7w9YUWXSaMtauytY1RAhylHLKihjVSmALqfXVuKo7INcmiB8aXNbpWUvqoHNh5zZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6922

Current code in _clear_irq_vector() will mark the irq as unused before
doing the cleanup required when move_in_progress is true.

This can lead to races in create_irq() if the function picks an irq
desc that's been marked as unused but has move_in_progress set, as the
call to assign_irq_vector() in that function can then fail with
-EAGAIN.

Prevent that by only marking irq descs as unused when all the cleanup
has been done.  While there also use write_atomic() when setting
IRQ_UNUSED in _clear_irq_vector() and add a barrier in order to
prevent the setting of IRQ_UNUSED getting reordered by the compiler.

The check for move_in_progress cannot be removed from
_assign_irq_vector(), as other users (io_apic_set_pci_routing() and
ioapic_guest_write()) can still pass active irq descs to
assign_irq_vector().

Note the trace point is not moved and is now set before the irq is
marked as unused.  This is done so that the CPU mask provided in the
trace point is the one belonging to the current vector, not the old
one.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Leave the trace point at the same place (before freeing old
   vector).
 - Add a (write) barrier before the IRQ_UNUSED write.
---
I've only observed this race when using vPCI with a PVH dom0, so I
assume other users of _{clear,assign}_irq_vector() are likely to
already be mutually exclusive by means of other external locks.

The path that triggered this race is using
allocate_and_map_msi_pirq(), which will sadly drop the returned error
code from create_irq() and just return EINVAL, that makes figuring out
the issue more complicated, but fixing that error path should be
done in a separate commit.
---
 xen/arch/x86/irq.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index cd0c8a30a8..20150b1c7f 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -220,27 +220,28 @@ static void _clear_irq_vector(struct irq_desc *desc)
         clear_bit(vector, desc->arch.used_vectors);
     }
 
-    desc->arch.used = IRQ_UNUSED;
-
     trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);
 
-    if ( likely(!desc->arch.move_in_progress) )
-        return;
+    if ( unlikely(desc->arch.move_in_progress) )
+    {
+        /* If we were in motion, also clear desc->arch.old_vector */
+        old_vector = desc->arch.old_vector;
+        cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
 
-    /* If we were in motion, also clear desc->arch.old_vector */
-    old_vector = desc->arch.old_vector;
-    cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
+        for_each_cpu(cpu, tmp_mask)
+        {
+            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
+            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
+            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+        }
 
-    for_each_cpu(cpu, tmp_mask)
-    {
-        ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
-        TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
-        per_cpu(vector_irq, cpu)[old_vector] = ~irq;
-    }
+        release_old_vec(desc);
 
-    release_old_vec(desc);
+        desc->arch.move_in_progress = 0;
+    }
 
-    desc->arch.move_in_progress = 0;
+    smp_wmb();
+    write_atomic(&desc->arch.used, IRQ_UNUSED);
 }
 
 void __init clear_irq_vector(int irq)
-- 
2.37.3


