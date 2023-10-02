Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66A7B5618
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611611.951145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaa-0001MR-Kc; Mon, 02 Oct 2023 15:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611611.951145; Mon, 02 Oct 2023 15:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaa-0001Jy-Gy; Mon, 02 Oct 2023 15:12:04 +0000
Received: by outflank-mailman (input) for mailman id 611611;
 Mon, 02 Oct 2023 15:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKaY-0000iK-CI
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08f340da-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:12:01 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:11:52 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 15:11:50 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:11:50 +0000
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
X-Inumbo-ID: 08f340da-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=89MbL0AA6pA3j09tSq3RGefrgIUOeZgIRdfPXOZeMoQ=;
  b=fNwCJUxZJpTBtSlXMzbrvhaTiMDWFWgLY0eauyYRFL0xcfMkiZcV/hKX
   smYxAu4ndBnfA8IULRABVyW+68yw3cTyW9JI/Gy0PM2wG4qPMb7SLTDL4
   j5CGXcLc0Xx/wxaAL7i90AO/ziiTNvL3dEb3gc5yOAtCbIRuDttFN/pEz
   4=;
X-CSE-ConnectionGUID: 8zczh8/BSZCOU1bS3+9qSw==
X-CSE-MsgGUID: sXuusDf5S2ahrPxYFbt2kA==
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 123016509
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:TnjRJKyOvtTJXgsFAxF6t+f+xyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 2ccWGvSa6mIN2LyKI9/a9yy8RhU7JPWn4NqGVRkpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPaoT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTFc/
 u4YeHcnVSKooN/vyongCbh1vdt2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WUxXqlBdpDfFG+3uVanUCI6mJOM0cfVUGDsciXgFLkWPsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZBZdo8pYkpTDol/
 laTmpXiAjkHmKGcTHuG3quXqT60NjkYKSkJYipsZQkP7sTnoYozpgnSVdslG6mw5vXqHRngz
 jbMqzIx74j/luYO3qS/uFzC3TSlo8GQShZvv1qIGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWH6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:xqpZz6FN9m1+7GGxpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3AuiUQq2iuPK0dRwSV2fbqE7/omzJuIm/W3neAZGW?=
 =?us-ascii?q?DO01OdeSfcgTTqbpfjJ87?=
X-Talos-MUID: 9a23:Kso7RwSNqkqkvpGiRXT3tCx/L+tmvp/0AUAXqYU3lcOYby9ZbmI=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="123016509"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lilj1/5dN+dgDy3LLIVwcnFp/soHhLmWTGnXbItjcHR9dZZfHYrajoXWn6K1UfBIBZl3rEhxwh3E2ZZaJCJPllHQ+IfwTu1Sv2GIpOXf3KOM5V+UC5/eGc0He5dw4r3VYlGgIklxFQhmjoG1U9qLH7ZBpNXvZ0qxUp1nbgGHypzrde9gBvFoZIfVS1xaRpeTYdMkNyeFY1sHYirJ0zK3VYnp/0P34HyRbZGCpff3IyAwq3CC/1603zRos8NVsuZ7L7E+NTTzupBnwyhlKGJ61BE7FH1ZOsJOad+5ivPAzRWANp9Qp07PWVE82Tgc6+9KY7nCaOowXwQg120uJwzGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCapLEs8x3+5/GTRGxm23TN+ireMD0Zi0vUFCTJ5I3w=;
 b=l7h3pI3JIvJiXdbeigx0e4H9hGp/8wxEaCAutFBjgXLIVAg31fSEcvg/e4BLPXhrOp4vmqfcP8te/y+9MapuaTTPpZtGytfrnrpKkYyPbi1lFWP/IBf7vP16akdg1Oos4k9XKdACSHnf2bNcVG/Zhaq/TU7HNtROiMqw4QOLok737SfSdv63usZhoBGzBXU7t6dZ1A4ssSEHM9bP8ANbaKJbF38YNask0bGtaS0kiI9TZHPaLZuAGqwczVDRkANV9Hi7TQH72wh07WY2LJqh+gVyJ/3PlYkm/oihADekZYK1oYbaVca01WJTfhOSmYYeR5Uoizno4+Hue1cCW846tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCapLEs8x3+5/GTRGxm23TN+ireMD0Zi0vUFCTJ5I3w=;
 b=TTBoomylDiI/fZoE5pbgZ+A6AtXnIAM1f0y5I95S+WzR0V6q+CQT81tRutr52tW9a5BnzOIld3OZ9RXN9X4i0GupGkaFUWUlK2H+LbywoWkvg3NTiWDUWCclA1fAff72968IZWgj9jJ4QB9X7pHn/2uyPNTTViE0EayO1Y5DrAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate vcpu_info page
Date: Mon,  2 Oct 2023 17:11:18 +0200
Message-ID: <20231002151127.71020-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 652424a6-046c-4c49-46cd-08dbc359e6f9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y7NaQNpjzivMG6j90Zl8dW4H/K9jcMDso9EbdxuyowDBovEM39UeSEnm+xLM4H+Yw4SnHrkrnvlcs32Z+xzCLXFCA08XCHSZJheI/Pqcfsog/uFCaqHzsZYueeNUETHcpNGen7fKZzStEFRQi1lWCtSYc3vQCIIBnV2kAcinEb7D3qF9xN8wl9d230H+Q/OWN1K89Kq39VKLtDrI4RBPgKIjqgF7MZt2zaw4n8EfCgZH9aNFYgEHErVlf3LxAWoFyNttO4zJjghkW/bcsKSgmdAzl9C0Lxcyx/8FuY9hc9h/z/9hnMT8VMCkXJ/pPoStQxvbXVnzTQJAtNIlmFu9gLP9g/q/r1dIJFAZQHm4op71M2CKEaXKSfRjOfwg/79zIfooEKqIZXQhJQtmUDn1I1vHtfwuk1PQbkRnqFkpupnZ4i4blZV7ph92GLfC0WrNLZ+CZ7W+Iiva88UQcHeAfwvv0xrpI6G0lCUQPCjCfzJzaSHOVNk29dco7iBW3CZiwR7YYItjXBXQOpqqj87UOxyzb3qtTagT1f99ATt6A9kpZ6ZWfGN8S8YPsb9A612M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4326008)(8676002)(5660300002)(8936002)(6512007)(478600001)(6666004)(6486002)(2906002)(6506007)(26005)(1076003)(83380400001)(2616005)(66476007)(66556008)(54906003)(316002)(36756003)(41300700001)(86362001)(82960400001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDBpR3VaMkNJSGNXZytSb3lZc2JsSktXMmxuWkN6eE1HK2NWaVRHSHBxdkFt?=
 =?utf-8?B?ZnJuVmhyK0hYUWszOUNGTm1MbWVHa1dKd3JHQWV2Tm9lN2pNakw2SThBMnJ4?=
 =?utf-8?B?SkZ6UkwyQkErSnNEZUowQTVEbjRzNWxnYVgzSXZjK3ZhWXVTWHJFM3pKbUli?=
 =?utf-8?B?SGdNbldzOWZNM25ZL1NZL2NuNVBJKy9WR1JtbXdKbVUzTzU4RHU3VWNKenVM?=
 =?utf-8?B?RktIaFg5VEY4b0F1NVlKTnlxRGxueVNZLzNaYkVqR0pKQnpyNmllTm9wQ1I3?=
 =?utf-8?B?Um1nL29xMUVkTzN1UEtjdVM0TXYrbmZ6c0gvZFZuWUhLT0tocTFkOGN5KzVK?=
 =?utf-8?B?djhOM1E3MXNKdXJ5dWlEcUc1dGpNNFQ4MTZUZXFaakRYZkNEYUdMUW43cnhH?=
 =?utf-8?B?Nyt5aXcybTB5bUdiNlpUaDY5R01DaXVDTDNnbCtuRTBEQStlWEZKR1gxYWVx?=
 =?utf-8?B?Rlc2aG04dU4zWmdLdFMxMmRVU01PYnlnSjY4dEJkZjhsUVMwcXFSOUZMS3Fh?=
 =?utf-8?B?Z2lGS2RIS04xWVU5SXNyaERRUHR5N1ZnUlJlRjNzYVY5VlA5cnRhdjIvYkhJ?=
 =?utf-8?B?eXAzWFJKOWkyZkVjMDZST2M5U2p4RXRldmJKa3hwVTlUVW1zY1lrbUVPcVM2?=
 =?utf-8?B?NjdRSWdKeEdtSVV5Zk9GU1lFQ1lEMUlhY2RNUnpycXplRG0yemp3b1gzWVVZ?=
 =?utf-8?B?ZTVLc0FuSDBtdGZ2MURmSDExZk1UaENQTzhhVXZOSlpFV2pTdXBSY3l0cUNC?=
 =?utf-8?B?aWZqbEFWUG9lbncyS1BZTmllMjFsQmZrVHJtUEJFRmFTY0xxVTRJMEM1Z1hX?=
 =?utf-8?B?cHVMTGJ0ZjNXbW5QZTFOSGtkcHdVTTBxcWhXWTVCdDNqcmZTcVlIYUp1THEy?=
 =?utf-8?B?MXNMS0NPRkhRRFdROGRQZEp2QlZGcFpYR0M1UkdPV1RnbStTV0hDSlhpU1NQ?=
 =?utf-8?B?NUxHblcxVmdKQjdrRDlXTUM0T1ZvTDNIN3IrSXFYQ1dhVG9QYk8xN3BXcWov?=
 =?utf-8?B?eHlWUHRRNG1jSkNlbjQ5c0xWSE5ibWlKai9NaUkySTRGYUJSKzIvaDlCRzRB?=
 =?utf-8?B?QlR1Nmp1RDR6NnZGOEsvVUE2TlA2VEEyOFhBc1gwMFBDZXVoTWxVWTExQ0U0?=
 =?utf-8?B?bHI1eEJrY051QmwyR2VtdkZKYUlIek5MMmljcjlLcnFRUG1leXppWnFFRmJM?=
 =?utf-8?B?MDZ4MFBkNHNaR0JpaHREQVBNTWV5RjVKczVRRmsxVnd1MUVBWmtGcFNjMmdL?=
 =?utf-8?B?YTZOZWZRVnlaem9xc21ZamZ1MUdxWXpURHczaUtnR2trL2dFSzVvQlNLaVY5?=
 =?utf-8?B?SEZjT1ovUC9PL3FUV2ZUbnlBOHhwc1hRVmJ5dFVDMEZRazdPalUxcVU1MGhs?=
 =?utf-8?B?YmxKLzc5aisyRzhkTFVTejk0MWtYOUNRcmpvcjVUUkhVVHNsVndpaVpVd0VZ?=
 =?utf-8?B?M3BaazBMazU4RW93UFFOeklFMUM0dHZuTDlmRU1YWUxmeFIvUm1nOFJZY0FS?=
 =?utf-8?B?akZHdVM2ZXE2UXo1YWRrZDRjbjRsaG1DdEhBMXVPdm5meisxZlIra2gvQ085?=
 =?utf-8?B?MDB0WU1JTHBVcm9kNWdLZ3FzWUtnOWtqMXRSTVYrUWtNZnlBemY5YWtURllr?=
 =?utf-8?B?SzNQUGgxZ0NQSlZhRkgzNFRqejBhOWovQjlzdldMci8xeGVoR0JLcmNRb3ph?=
 =?utf-8?B?ZGkyZUthQ0JkR1I0SGZKbDJyNmRMVndaekVCdWR3RGYvazNrbi9NRk9CdmN4?=
 =?utf-8?B?VUZGTnNKNDNHUmNVZGRwRnJkbVZ0ZG1vU2JDNFg3TmVBTHFpYndwNjlMeFd2?=
 =?utf-8?B?RWFRN1NuTU1ZT0tFcW1GcWNCeVROQ1RQcjRtNDNtQXd0bFFSK01IZzNpa0tD?=
 =?utf-8?B?MUFMK0NoVmoxaFhPZnVYMWUzWkUxQmhVNXA4OHZ5WXRWZGwzbnYrSS9ELy9w?=
 =?utf-8?B?NitKbEhrOFU1bUhJemMyQ0JtZk8rdzE1dVZCK2RHeTdDS2ZhMjBUbmZFMXpm?=
 =?utf-8?B?cUJ2NmU1UkRXWW9PS1pjcERWc0dYb1lvcFNWaUtzcG5sT0NqdWlIQ3ZaYnVS?=
 =?utf-8?B?ZloyNFYvdWE2bUJGMkJSWjhLcm1ucTZEU3FnUEFwaitjSG4vV3oxT0R0VGMz?=
 =?utf-8?B?aWJPSHFsWGc2Rk9qeURybjRWL1FCVngvNmh1T0laZWhkSUJEYUJ5eEVKZm5i?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0MemQD8/KLfsONCJ+T3kPjM+e5sVzpL1OWHXPAfiq5dDRywNSEIv4tWzriZ42c02JJh3EUyPrUYJiLQt2JKiBzvK69D70ycwOt9ZLmUzCH2Ohj6ndOyAuccRwsYoutCvFKK0Uhg0/kLiSnyHbnifZrJKX6UMmoRqzMOlcZ4ZsQRq10g778TrJermljOkmWX8umbjH8q6cJ3pQisWmrecvCszKm+XJiANEpvReJCCkFOcBSiB2gcI3t5oG+KZ4NyBTJR8n080y2QXUkbVPeKxEQS8EcpcbLNr0SLSLb1etUYmbl8Ql5wX+pUUjs6QgNpxG8wS9qalgU+jg86WR09mjnypzux350N17gVWGK8W/2A0nMm//o4LkHCDgT4xvdBSHycaAMnBASFv3PxyD8COp/vQHSfBRq3cW0ujUR6+es2rhIh1kjycN7WUf7dOn9O+z3Dx5EcSIKW2Ex34r+mIvZUx4DR588dMsBr03JpcYvmykY5PTPOGhW8a9rbljjYDbPAQRiGmXbHb5NL4evlBJ/3FyjtBviC1SiQqi8A1RAHIgr3FQp9Wyvsbd1IUrGg+LPh27d9MGrREZ8DMZu6S8KR/bKPYk/XpC9ofBF6OfEDBOVr8sSqfBLp37+6q/mTNCi6HmdGTuvdTx+ip2IxoMoThbHd9pUeXOo9CXXA4OwLci2H+eWrlbS61WgcOqbYrHXGp2DCDoOh1oZkhnKl0XqxNXNWty3E1P4w0UuKOSJ5rDhPHm0ChiFlhcvScsRniDq67lhqBfSqcKYZ3+iP50rDBgt36iOza7TrgYsOGsp36NaNKKEgKDOQvr5QttI4qdEsThNC9SbwJmn2uuPgpm8d0AqSMbgfWFnRxXHSRI+kfpFPGo6IjNTwqLOL62fSL
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652424a6-046c-4c49-46cd-08dbc359e6f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:11:50.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTBb32C7GRXYlmq9+USVN3xLKRzT3rl1vBZMqbxMtTQ6WZ3J+X3xLstaNGV8fI45dt6a0uzJZmv/4lz0quWzyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

Instead let map_vcpu_info() and it's call to get_page_from_gfn()
populate the page in the child as needed.  Also remove the bogus
copy_domain_page(): should be placed before the call to map_vcpu_info(),
as the later can update the contents of the vcpu_info page.

Note that this eliminates a bug in copy_vcpu_settings(): The function did
allocate a new page regardless of the GFN already having a mapping, thus in
particular breaking the case of two vCPU-s having their info areas on the same
page.

Fixes: 41548c5472a3 ('mem_sharing: VM forking')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Only build tested.
---
Changes since v4:
 - New in this version.
---
 xen/arch/x86/mm/mem_sharing.c | 36 ++++++-----------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index ae5366d4476e..5f8f1fb4d871 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1689,48 +1689,24 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
     unsigned int i;
     struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     int ret = -EINVAL;
+    mfn_t vcpu_info_mfn;
 
     for ( i = 0; i < cd->max_vcpus; i++ )
     {
         struct vcpu *d_vcpu = d->vcpu[i];
         struct vcpu *cd_vcpu = cd->vcpu[i];
-        mfn_t vcpu_info_mfn;
 
         if ( !d_vcpu || !cd_vcpu )
             continue;
 
-        /* Copy & map in the vcpu_info page if the guest uses one */
+        /* Map in the vcpu_info page if the guest uses one */
         vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
         if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
         {
-            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
-
-            /* Allocate & map the page for it if it hasn't been already */
-            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
-            {
-                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
-                unsigned long gfn_l = gfn_x(gfn);
-                struct page_info *page;
-
-                if ( !(page = alloc_domheap_page(cd, 0)) )
-                    return -ENOMEM;
-
-                new_vcpu_info_mfn = page_to_mfn(page);
-                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
-
-                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
-                                     PAGE_ORDER_4K, p2m_ram_rw,
-                                     p2m->default_access, -1);
-                if ( ret )
-                    return ret;
-
-                ret = map_vcpu_info(cd_vcpu, gfn_l,
-                                    PAGE_OFFSET(d_vcpu->vcpu_info));
-                if ( ret )
-                    return ret;
-            }
-
-            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
+            ret = map_vcpu_info(cd_vcpu, mfn_to_gfn(d, vcpu_info_mfn),
+                                PAGE_OFFSET(d_vcpu->vcpu_info));
+            if ( ret )
+                return ret;
         }
 
         ret = copy_vpmu(d_vcpu, cd_vcpu);
-- 
2.42.0


