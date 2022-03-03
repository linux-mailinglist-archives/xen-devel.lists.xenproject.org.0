Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840664CBB67
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282989.481877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPijz-0002ul-Go; Thu, 03 Mar 2022 10:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282989.481877; Thu, 03 Mar 2022 10:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPijz-0002qT-DD; Thu, 03 Mar 2022 10:31:23 +0000
Received: by outflank-mailman (input) for mailman id 282989;
 Thu, 03 Mar 2022 10:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPijy-0002Y7-0r
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:31:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b0f3fb7-9add-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:31:12 +0100 (CET)
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
X-Inumbo-ID: 0b0f3fb7-9add-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646303480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=j4w1mHcyoEPKLLf5z/FbIGVgRFeXPbopcH1SycomTrg=;
  b=XLXlOoBaLSMk7gIgP2Opt1/xpQA41D5QYSJzHK2sjQF+jG5CxSLiIyWT
   Z3mTjA0lYVI9AQLCb6nwMCcMxCAp0+TpaAjwRY0HN0T203ecS4YK+xIQG
   eWlvYZZlWhbuei5HuEjdHolalwX9vlXATMkBcWs+I6giCXGZypitu3FZ6
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64842697
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4gsIPaNfR309yBXvrR2bl8FynXyQoLVcMsEvi/4bfWQNrUol3zBTy
 TNNWWnQbPqMajb3fdxyPYu18hgFu5OBzdJnSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 v8Ksp2TQwcVBpLgoM4vDxB4MDl3FPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmtg2poQTKm2i
 8wxKghzURXDYAJ0Og00EYxigNW5i1C8bGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW6qnOZuh8XW/JLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BXxYot7y2Q3Khzoi4lRmAZSE1DncLTHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3oRZPmqgKvVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i7DKyKMosVPcUoHONiwM2ITRTKt4wKuBJx+ZzTx
 L/BKZr8ZZrkIf4PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9c9zvQNy7yRp
 SnVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:JW54S6j3z5WFYSXHK3RSXe/9THBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhQYtKPTOWxVdASbsN0WKM+UyHJ8STzJ8+6U
 4kSdkENDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHtXgslbnnlE422gYypLrWd9dP8E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSLOMB20ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="64842697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvbsshMeA32FOsDuLEdH8TdnLsT6voYgbc92js4/WoHCsfwFVsXLGn1T0HwP/jrvSVKKg5ZQUoL/4utZorcOCH2yjClmls1rrSdicLJPTUuyHAEIvdwnb8zPfaaRZ0tdpNuN+XSogU2dNpQk5627OaJLT9jg5aM/9XbismCx7Qmyzr1i9UwCkf0RZ2zfbKiBGpr+bP2R3a/PEqw9CcxqxlyvFyTXYp+WJha+KSWVgd8erKBTZkdIb+R5oau9Je7Sey093JW9Tp/M9R1YAUqzHO7yjKvbc/r6t8L4cX5r8tRL+T8FFHo9PPOxgoPC8mKhbal2kIZvZ2iVIOITw12dWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6pl1w/5dSZ6eQnP2uJiXcsjx4tDubo9dhwsrhwqdHk=;
 b=luM2nQxTpwX96D3hNxm55iI4xnoWxe3nVnBOewqSgjSMecvccfwFb5GsW3GcMT7gdkPdghmyMOENPQ3moXQeLQBRy/MY/IncscvisK/aC5bDksdXkrOMJ/cOrTTW8l8zRyDIshFyMyISCuuONAK6bNt1RwkruX06CKQHvU46VFy2tT4CgRCwyFVC0vdy2Lw60yf1xX1AQ9rYTdVxxzbOsIovbN3uct7qwB+mFrticH/EfQMXwAS1j24BR8VyJaW++s6wPwxRlQl+YNZxxINQycup5SmO+aoLnwIpsAhW9OITWV39r383KVs4FoR2lIZU74teq+ZV8jmsTyDzBhyX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6pl1w/5dSZ6eQnP2uJiXcsjx4tDubo9dhwsrhwqdHk=;
 b=OIhItNfOaxeAC1vn6B2apHP0uAiieuFXrzgVGi9x+EAfwCCCcYsxK11K6dO2VZ62zSK33SmLH3zfeUGCWXHkBHC4KOvF5zA5BtJyLDRcM7kxYitX9yxTIASYQx4SgFO6Gqy9dfvogetTTv3RleCiNEMP2qLRTXkIqBjmTAtSCYc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] evtchn/hvm: do not allow binding PIRQs unless supported
Date: Thu,  3 Mar 2022 11:30:55 +0100
Message-ID: <20220303103057.49181-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303103057.49181-1-roger.pau@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0bc253a-840d-4dd2-0571-08d9fd00f240
X-MS-TrafficTypeDiagnostic: SN6PR03MB4464:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB44644A90D5CC1A206C475FCF8F049@SN6PR03MB4464.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FAncAYXKM4YXj77FS7jN6dgvIbrh9AD/VLG4zVzvFnBYJrYuuEWkVXcyGnmP3E6tUWkTx2uTp8JYnc3vIDbagAvFAftrKH1Ysw4PFZiFLxlDxM2RgxbgLDaTWb6fkMutv/ecQnm3zLXHiny5MoevT0a3u0Os6jo7NUmwRXtGSzn0E6zim96kcHgoi94rQYrfmDxM71vObeZI36HYozv+F1xQkQkuDsiVPuvfPp+/wz/fyh4f+GhI6HkkLMOKqekskKOLlUPr23bX/2TOe6hgZDf1EOLzI/fQXDpxkCdSRsp02gKNJgov4mFD0EjMk/jWK9qbWKk52DIaehnjIdM5UHZWqAPB26GyQzHJmgTftfxTexWs1tUziu3cY/lkmV6Lc8qQDDbFz1TFCOhanD/pRbJARcz0i+I5GgN8XBTpBKAheCMnryJiteJy51NGoT+Bt8Xy2WX6Gpm2Mri4CRClvMm76yadlnKl2XgBbZLDP2pR7mn3GTbhrXKTR4MmiYszsgcSuPGgVFgO0euSf1Py+8pvnU2IaxFRgwsnBU3FEgAO82sH9divLxS4xFU8sARrfndJ8RFA5CO3ZBf2T4RqRpNfvmK1cnSeZcRQb5OwcRL3zfZASLcPsLEAe2Fnn8Pum6O/9MTBSEp2DkT2VMp9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66476007)(8676002)(4326008)(86362001)(4744005)(8936002)(5660300002)(82960400001)(38100700002)(2906002)(26005)(186003)(1076003)(2616005)(6486002)(6506007)(6512007)(6666004)(508600001)(6916009)(54906003)(316002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1pxSHFocjVWaFhHY3RoNm1PNkxJRkZSNlBySlljME55WVk5M1ZVWERuY1FQ?=
 =?utf-8?B?a1g4OUEwWHppR2V5QUFaZnlsSmxHd1I4Z0cwZ0NKblUyMzQ4Nkp5MXlqVWQz?=
 =?utf-8?B?bFNxYW9ZZ0U2WmVTSjJRdEV0Q1k3UmttUkZJZ3RBd2RGQU9IaFpMNDNGT1VH?=
 =?utf-8?B?Q2xZeWRUUThOVzcwdmN4Y1ZiakxOVzFoOUtSZ1hMOW9BdXF1UkJjc1ZIZlVv?=
 =?utf-8?B?aXJ2T2NZMy9Wb0VKekQ0UW1Bb3NYVTlPSWpPS3UvUHJHWms4Vkd3K25iaGZD?=
 =?utf-8?B?aDRwZDRGdUlncWh0T255cFU3eWNQSmJnZnpKcDBQcU05OUlFVVZSd2NicFNq?=
 =?utf-8?B?ZzFpOU5BWm5xcUU2a05tZFdQYURyMGozaGx3UHRZeTFndkkzN1JNc1kxOVgw?=
 =?utf-8?B?N2l2cWtSSHp1Z1krZEp6b3FYV1UzZDRIYVNiQndYbEVmQkIwNXJ0RzU5d05R?=
 =?utf-8?B?OUtMZ2Zpa2J4MFBRZ1JCbzY5OWZ2Z3VQdXZYMUtMZmJDakRNdlpUVGVaTE5u?=
 =?utf-8?B?YTNTajFod1pJdXRpdDZSZE9SUGZQT01RcUJMdUp6NWZwMHA4OW9wa3RhWnZS?=
 =?utf-8?B?dENDQXBxUGVmY2ErdWlCRzVabkg2WkFyS3JENG02a2phUGluSUIyOE5oR1R5?=
 =?utf-8?B?WkxTcUdlR0dRN2gwNCszcjM3N1Z4TWs0ZXFBa2IzZ1Jmbjg2OGRFTkoxMW11?=
 =?utf-8?B?THBvbjdhRFFtWVF3b3hkYnpFQWd0WjRRRTJZR0oyZWdMKzlrMTYxVVpZSks2?=
 =?utf-8?B?QXNGN0xhZk4vRVNaODcxUkIxZ2R5RTcyeHVzcW90OWQzQlhKTlBMRU9IakNG?=
 =?utf-8?B?SGpocUVNaFJIcFRheGd1SnNWUkFLRUNlbUVNY0RKS2hWZkNIM3RyNytqS0Mr?=
 =?utf-8?B?a3Q0Q3lqYUpQVUhIV3dzZmN4eVdmS281bTBqMEF5cEErNDhYU3dHTGttRUd1?=
 =?utf-8?B?V0JzYmZlaGgvRCtiY3YyQjZ2YWJLcnhsd3hiWi81dzNsL3Z5MkpyU3VRb2RW?=
 =?utf-8?B?OWhPb21lMGRpMkhrYVF4L2JOSEtEN2QzSllCR1ZlWHNXNC9ETkU2ZEtrWkd3?=
 =?utf-8?B?cm9aYlRTNEo3cWhzNHdpU2JqdVVXWk41M2pQbUphZ1ZHMTE1Y2VPMUZoUTI5?=
 =?utf-8?B?ZHhEclE3MTNSbmpQNlJLZ1NSZndhT3VDM08zeGVKU0I5MjZtaGpKVFNVd3JS?=
 =?utf-8?B?aExaODJUN3Z3dUYxQ1R1dHZFMXJHbEU4SmRBMzAvU3NDNlZJM3o3aDFkbkpV?=
 =?utf-8?B?YjRCcGQwV3Y1RmQrRUw3R0x1ZEhrUThqcnh6SzB4N043VUZra2JmSmxNdjlu?=
 =?utf-8?B?NXQrQWk5MWdqcmp6WHA0bGNOQWFwWWw2Y0U0UnBsSjhES2JGamVDaWRZbS9F?=
 =?utf-8?B?akNGWW54aC9aQ3NJeHJFeWJ4VkN1UVBKMG9Xdjlqb2JFUVMybzFsdFNiTU05?=
 =?utf-8?B?dlpqZXpFMzRST1RCK0pVc2x4TExwd2ZZazdGTUFLREFuZjdOWmNPZkswZm1O?=
 =?utf-8?B?VjJCNGhkeWdkbkh5RUorSThUMXZSbG5lK2xnS1p6WG1BRkRvdUdSY3FFZTFm?=
 =?utf-8?B?WUtxRUxWWjZrVWFTYllqWXFJczZiclN1aVMxQnZuQ3pLL3JtS1lxUGR0aGVj?=
 =?utf-8?B?dVo3THhXTk90cTVteWdhaUpUMDlvSE9YUDRQZWVRT2YzRmU3MDVDVUMwOGZJ?=
 =?utf-8?B?VTMzb3lVWG5uNUJVMHJ6aTZJWHpRNHBRajNJdE5ra2ZPbGQ3VFMrNmV0K3B2?=
 =?utf-8?B?YUE3aU03N1JtRk84aCtaUlhrZitYUlhJb3FCV2pUWWczS1ZYMVQxWWwvQi82?=
 =?utf-8?B?TGJPU2w2ckxEblU3MDRiTnV6Vk55eDBpM3lYVXFmQlp6amRjZ20yVTZIc1JC?=
 =?utf-8?B?eExFRXRwbVc5a2lVVkFIVWUwRkQrZE5JVDRBMGVQWFNmY0x6dVZjRVZGUlkv?=
 =?utf-8?B?eWV0Zm9xNHhINHJtVFZpalUycm11S2tBUTNUaURpSUVaUGJXY3dSTkhoMHN6?=
 =?utf-8?B?aHpOQ0xKMWNrcVB0N3JYOXd2Q1d6YWhoSGdFdDJvYXE1aWxVRFNqa09WTXA2?=
 =?utf-8?B?UU9IRWVWaUVacnJ6dWJjaUhtN0VXMlZ2SlpHK3BLc2ZybUF0enowd0pHZklZ?=
 =?utf-8?B?QWJVWVNOUVJYSUNrMmZXOGw2b2JmeXd1dEhkdER1VEl3aFR5OElJSHJ1UmNt?=
 =?utf-8?Q?veAhJsy8HOWqFoiLapMDv8s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bc253a-840d-4dd2-0571-08d9fd00f240
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:31:15.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL6gh1YGB8/ZLGkmbTlJYdfNWX6b3X2jvPkSI4shp5vhyaqoz7kVrufXHuczds685wEVrewMFMz6Le5VGFe1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4464
X-OriginatorOrg: citrix.com

HVM (or PVH) domain not having PIRQ support won't be allowed to map PIRQs in
the first place, but would still be allowed usage of
EVTCHNOP_bind_pirq. Such hypercall won't have any practical effect on
the domain, as the event channels would never be bound to PIRQs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/event_channel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index ffb042a241..bc4985706a 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -556,6 +556,9 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
     int            port = 0, rc;
     unsigned int   pirq = bind->pirq;
 
+    if ( is_hvm_domain(d) && !has_pirq(d) )
+        return -ENOSYS;
+
     if ( pirq >= d->nr_pirqs )
         return -EINVAL;
 
-- 
2.34.1


