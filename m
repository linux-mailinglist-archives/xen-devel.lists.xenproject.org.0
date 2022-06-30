Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A165614E4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358299.587448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pSz-0000g1-QZ; Thu, 30 Jun 2022 08:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358299.587448; Thu, 30 Jun 2022 08:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pSz-0000d0-MK; Thu, 30 Jun 2022 08:24:01 +0000
Received: by outflank-mailman (input) for mailman id 358299;
 Thu, 30 Jun 2022 08:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pSx-0008UT-4L
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:23:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd90a7f-f84d-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 10:23:57 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:23:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5421.namprd03.prod.outlook.com (2603:10b6:a03:289::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 08:23:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:23:53 +0000
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
X-Inumbo-ID: fbd90a7f-f84d-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656577437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=z2tFs+C+vki8dV3dWic/vRVXguDBXQHxTduVL37e4ng=;
  b=B9QfIwgz4iXIrZYjwJDTdAApz6JR3XMH0NL9dZ54RM/b2ruQpatb4xLK
   PmnVNefIxmbZCDBRBbBUgHLR8h5i1CMswCntnm3NyTzUydhb5YTsAiFSu
   JVI5ny4Ru1mKhcTmTKotmZytKPJ37IF3AtU6nAgqQZq+AZeS1BN7tqI5L
   A=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 75193007
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xjf6Y6lvCemz2TCG+HBl2gHo5gycJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZWG6Dbq3cYzH8etAibt+18E9X6JGBm9A3Tldv+CBhRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWFvV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSjg2bpDNnPkkFEdXSwA9BfJNobD8Pi3q2SCT5xWun3rE5dxLVRtzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOUu5kEgV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IF8QPO/fJoi4TV5CZK1r73bP6MQNGPYO5SnGKkr
 VLF4HusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVXQC8oXOClg4RXZxXCeJSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 kCNt8PkA3poqrL9dJ6G3rKdrDf3PDdPK2YHPHUAVVFdv4Slp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjjNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:FUnsEqlHGoVPFfL13Dt9BJnpElbpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhR4tKPTOWw1dASbsP0WKM+UyFJ8STzI5gPO
 JbAtFD4b7LfCdHZLjBkW6F+r8bqbHokZxAx92ut0uFJTsaF52IhD0JbzpzfHcGJzWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 X525RT5c9zp/AtHNJA7Z86MK2K40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="75193007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/SVSQ2ceycmWN9p4hcHDX0G2FDAqcH25Fj5s7xzYz7QFAxcasikpwb7WTFBft4wVQmiRqMYeIchouH6q8CRbmJ77UsBGt2/diYqFSfHzyG0K7kTx4YqGrQya1fyQTn5TD3jYRrlYL3oRNN96wS2lE8RzTv+qI7TH/aog1rSBtAacUwcOAy+SGdSk9kcrZT/6cXYgUcmz92rYr7mfokr0lBJ6MZmjNpymfzeoyynrc7m3a1ZnceTuvjtk4sn0fyjmLI3p8mCNfzLISM51mpfaEXg6kVJRzzjYbILA0OdTg6y4KRaf1wzpDq13ob44AUQoSXC5xYDhzCQR+3iWGUKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXm89G8vAtrVKhjl6bu6e02BU+tlRuND+6XDnIkID2A=;
 b=Ip80s8+gaUfzYau+c45AZOSLE2mDDwCjztSnpPBiRPBkKvc0Wa2jWNwfm9NvPnInj3po/foh4pOn9/wGE9d95K/OEunLtX6dhLC6c6lVTWglrRNqTv+R7LG1KLw4S+LO6vDxEfmZRBzJcnIjaFEMSSdvS9Zr2heqw7TPA1mbV2fdBURERJFF3dU10lv+9zx1637+48lprF58Ul0NP++YJPp9GRkv0P0VJRzzHyUQOzzg4d0NQNYNVsEZjthXpUZ3m9UVZuMVbeE0UpdiUDz2mjiKH1xCy78Ns6x9aolAojGcUVgE9lK4P9rNbA0fB+PbkqmPN0kF190O94Kcba4xZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXm89G8vAtrVKhjl6bu6e02BU+tlRuND+6XDnIkID2A=;
 b=A8bZ1LL226036O3GFrBT6upp+Mg7OFJrEZqndJD3Sr6s+RJRKLWg4Mik/3aqDIdQSDIDgD40Kzbr7EtCwAQYMS6upkyIqj4lAFf9X416N6vkgmBPKjGzuBgoaTg28c3wvizdaY/la9tJgwZE3ib0RZlSanaiYCt5zQq8zaiHQoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] console/serial: bump buffer from 16K to 32K
Date: Thu, 30 Jun 2022 10:23:30 +0200
Message-Id: <20220630082330.82706-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630082330.82706-1-roger.pau@citrix.com>
References: <20220630082330.82706-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0555.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9969ede9-eb63-4543-25e8-08da5a71de61
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5421:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MFob2LEnNzxfGbYMRLYq4wKGIo1iurxim+j9xiOFX7M81Zlj7J9v8TmtdoWH6P6132HrYoiic8jSCa3dGnMoe/oYa/dU70iNrJtPUce18dBKh+/vmT5bvvGP31aTs1wII0hVG2Tsn9NolIpt9QF8eaY54fY0foyLpQ0ncJebVmv4wJ4ju7Kyr5if9gJ6duuBtcn/XnlIljSxAYtZoZIhS5gJXSmJdc7+oa+EaxJCDfoYhbMkhrzFkSbIb4n3fXGBvaY7rPYFLQWloiyk6XUhiILqQzE2UEs2DKjn1JdVxqa86FJIES/pe5cN50UdMtT8TnITK9i+raLG2kqhsUVYbMQEaQWoUcZ2C/A83oJlr4Zaeis/czo40pJTNrmO7lce2OuPr4YE7laUgIZq60gFjbSRfvDVca//jbLL2FO+Etyb4ooecGewMSNaCxUOhNQWP8IOWQh0bUQ9gg7vDiV4BlqBHAnBgELFBW6ycxYxAL5TazQPw8GvEJcTnEPV4qZeABRC87AbXo29YhPCavu4a1ibtvodYo3MatnyEZwAnAU0xY+R8ph9L5ixX61V+ycjjHcjIjMn9/A5pB8fXZlUtFM1as8KDDFbYRdDArTXu/Yxl0vvceIDiTBCMM9VtPUPc+Y5mknQVNR+pQ/BHwS7fl9wqp2xiuw16HDnNaHdVmDC6RkhnLrj9L+ZDGdba0m/XM5G3CLmvRiVEmh26GMmQqp5PqfG3DusY4ifQXXvnjA0dv+osfR0vFdhugjsXYIoEE072UTFqER8Om8Nm5v9bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(2906002)(86362001)(6666004)(478600001)(6506007)(2616005)(1076003)(5660300002)(8936002)(186003)(6916009)(82960400001)(38100700002)(6512007)(41300700001)(316002)(26005)(66946007)(6486002)(4326008)(36756003)(8676002)(66476007)(54906003)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlB3YXBXdVBhaSs4T2k1eGZxNElaNDVzRXUzYzNCY1FoSEV5RjVVYm1hWTVT?=
 =?utf-8?B?ZUdWZ2ppNkwvL2tFTm9aOEphMDZSTVVqMjVMaGk0Uk9YeGFNcU81c2pvcjMx?=
 =?utf-8?B?cGR5UW5FRG9hN0wzUTZuNmRnSmpvVjAza21OZW1RWHV3Q2FrbVpuUHRLL2FS?=
 =?utf-8?B?RFZRK2lTVWRLT0l5NXErUUF5dlZQeVJBR3ZmVG5MU3BEMndvQlNhNS9tOGQz?=
 =?utf-8?B?c0hhb2xTaGh6c3UyTDA4UGtwb01wVW1HR3JsN1RmUHlRY3poYXdQM0JGN0Jj?=
 =?utf-8?B?RStML1hKL1VFZXpUMWltSFpWNHhKSzh6VkxCWTlyWVJySVAvNTR4VkdEOFVy?=
 =?utf-8?B?Q0IwYmVnV1JIUG1LM2lraVNIeGdGRUNGSkozek1KbGY0N1M3bnNRUXhFVUxS?=
 =?utf-8?B?ZFJTRnpYL2RQdzZlUE1FZWZpaHU2MVd6bDBsVjM0SVFzNGg2aFo1R3pmcnpW?=
 =?utf-8?B?NURXVXUyVFFXb0sxZXFtVzd6SGVGRXRBWFlFZzFBemYzSytkTmxuZGdtRUwz?=
 =?utf-8?B?cjN6Y2lSdWNtZzNKMEtFd1VsVWw5MkhZMEFPMkc4RFdEc0VPOTQ1SXphcGRC?=
 =?utf-8?B?YWRsdUdFbU90SWJhcC9ZcDNvM3cvS2d4QWo4aGg3M29ZbStpdy9ycmhsbFQz?=
 =?utf-8?B?SmxpcXhDS20ycE5IZ1Q2dDFTMzhWcGpoSkE1VHlsYng2cHpaTFZGNWhkdzVC?=
 =?utf-8?B?YTdyVmlRZGhxQVk3WjBlZXQyWVpwNGdyNkIwamlraFVlbGRBOGE0K2U2Ylln?=
 =?utf-8?B?SG5QRW1mc1d6a05Ba2E4R0UvR2FZa0lGZktmNkw2U2hUa1dMY1Fha01XSFVh?=
 =?utf-8?B?MXdtM3o2bmR1bWxiM25MK3MrYnRBVTVPb2lsL2daQU1MbGxqQktFcmVSWStD?=
 =?utf-8?B?VTJLNlpXdjdiL2wvdERYY2RjWmNUYlp6djRLZk5HdFhDZi9jUW5OK2JjZkdo?=
 =?utf-8?B?dy9vZUdPd2YrUnRJS01KYnF3TE9YN25iOVN1Mit1UXpSMm1xaWRvYUNNZGNP?=
 =?utf-8?B?STlMWmh0dzd3N2RIVUxIMHRMd2NDSWpabTJlWDNhdk55aUZPWEM2ZHdCVStm?=
 =?utf-8?B?YXNrbWYyU3dybUpxZ3lTQkZ5QWhmREV6elR2NStuYU5Qb2FEWXhiWDdPak02?=
 =?utf-8?B?V1dvZEtQZjM1Y3ZId2tpYlRnWHdWM3NzUGd3SHhLQWJhWHJ5NS9FMENrZ084?=
 =?utf-8?B?SWU2Z0hJMXhuWGJybU1ZRzFxRmEyMzNVZktDTkFIa3ovSUxjYjU2c2VLclZF?=
 =?utf-8?B?NGYvTUxDdGdUaXdYdTZTMUh4NG8ybHZTR3M4L0NaTlE0VkoveXFnaWNUV3Jh?=
 =?utf-8?B?N0FSbVFmY3Z0MFdpQVhkNG9zREVPdENQNnlwNzZWZVRTdWtNejdnRi9xOU9S?=
 =?utf-8?B?c0FHNXQ5c21Ed09qMUk2THJFV0VJTlNGL3J2dTRrbEhiNkd6a2Foa0tQQk1D?=
 =?utf-8?B?Z1dhb0d2QUFYUG9vNFQ0RDFhT01VdGtjeGhIc0dSM2ZGNXlHTG5jb1ZQelJk?=
 =?utf-8?B?ZVJLWjc3SGIxdlV0VVdCcW56MmlwYk9tMjU2YytiMUVFRFhQRTVFRTBjZkhI?=
 =?utf-8?B?THdaMnpDRGVBOTRja3R6S0Zqd1ZwWTM0YXkwUGVCaU81Wk1HMzV1cUpWRTRH?=
 =?utf-8?B?TWt5UTVhUVFLQThpYVdEUDZSYkhISW1tUkFPYjRnMnIwOUViZlZUWUFQQmty?=
 =?utf-8?B?aENzZHZQY3FQTndpS0ZaYmFsTVEreitQelJmdEFGNDRqbkpjTVZkdGNCZnpa?=
 =?utf-8?B?a3dsQUc0TXFNVEJQTmxoNjJaRW1uRS9tTzZtMEltdWtvT05LT1dFckVxSDlW?=
 =?utf-8?B?cUFjNWhnenFsYmIvWWwwcCtLeUdTQlNUYklSRVF2aE05MGY4RW9qWVBLRFln?=
 =?utf-8?B?SnBJL3drdCs2ejVMYmNDWDVOdEp4NWF0QXlUSHM2VTlnOVNNSnhxMEtVT2Zu?=
 =?utf-8?B?UnBaYXlFdk1hU0xxWTcrT285Yk0yRUJEOHcyR0IwOU8zSGRRMTJFM1E0N2Vl?=
 =?utf-8?B?Ui9pR0ZXV0duS3B4NndVRmROR3hBOUhyVXQ1dW9LQWZSYkIwUzAveVNBeGtI?=
 =?utf-8?B?RTdybjFkZWNTL1F6UHFFM1RMeFBhU2NOM0t1TTZCZVdGM3VwUUJoTjl5bTRo?=
 =?utf-8?B?TVU5Mk1EM0pUV21kL0pDU3VDY1dkSHZ3SWd0SE9Hd1pZdmh5TDRZOXhtUTgy?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9969ede9-eb63-4543-25e8-08da5a71de61
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:23:53.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ2IanK843qJ6RlMPbQtqYTY9x+t9PMXV3O8dVojLvSX8d9xYv0uTVgMnQAp6iBl3hndMX6hVkl9bxoiwQOffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5421

Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
being filled halfway during dom0 boot, and thus a non-trivial chunk of
Linux boot messages are dropped.

Increasing the buffer to 32K does fix the issue and Linux boot
messages are no longer dropped.  There's no justification either on
why 16K was chosen, and hence bumping to 32K in order to cope with
current systems generating output faster does seem appropriate to have
a better user experience with the provided defaults.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index dec58bc993..294b3509c7 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -77,10 +77,10 @@ config HAS_EHCI
 
 config SERIAL_TX_BUFSIZE
 	int "Size of the transmit serial buffer"
-	default 16384
+	default 32768
 	help
 	  Controls the default size of the transmit buffer (in bytes) used by
 	  the serial driver.  Note the value provided will be rounded down to
 	  the nearest power of 2.
 
-	  Default value is 16384 (16kiB).
+	  Default value is 32768 (32kiB).
-- 
2.36.1


