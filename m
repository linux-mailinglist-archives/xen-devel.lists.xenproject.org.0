Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859044D0375
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286201.485617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFf0-0002R9-Fn; Mon, 07 Mar 2022 15:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286201.485617; Mon, 07 Mar 2022 15:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFf0-0002P0-CS; Mon, 07 Mar 2022 15:52:34 +0000
Received: by outflank-mailman (input) for mailman id 286201;
 Mon, 07 Mar 2022 15:52:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRFey-0002Oo-4X
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:52:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95742cfd-9e2e-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 16:52:27 +0100 (CET)
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
X-Inumbo-ID: 95742cfd-9e2e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646668347;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2GhFWeqpdrnH3T41BDnyJsD/fccv7Z0QAi8At7DLRQs=;
  b=RACiA2tuCzm46n+nYsvfhfDRNsDZGqty+9b701OJM4ouLzLCSJeH5mdq
   fG/lGrvNCbuIrw3lt9xTgNMSWWXD23S7AzOa41ie13JW9cNBGItF3T1Zy
   SNfCguMHKFYEYxm2hq6KxXmwRx0hua+KQYrH2Q9ZS28H2lXcnTz5mRMUY
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65557446
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qqhgB69BDYIxn/GknqAXDrUDiX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zMcWW2OO6neZ2Xxf9sjOdi/8UhUu8eExocyGlc5/n08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbmCVywmEI+SpMM+C0h4GSE9HYBE1paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4TQKuBO
 5ZHAdZpRC7xQxd0E2tQMYk3x8uXqV6hKgFGk2vA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0fuhOOOIUyl+x7YmMsiaTBiskYzxvQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHb4
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL9INEOuG4ldBc1WirhRdMOS
 BWP0T69GbcJZCf6BUOJS9jZ5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPlWPmL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bJPbm00CC7SlOkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:LARgWazX6V0aerCAim/iKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65557446"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id3G5g5l4bKcIFjJEDtw8PbR6M6QEo9c+CzwL3TNgKtbE00sZlr759ZBT7fc1Y3DqVt7jr+emPOVTxBYL2FpaH+iTTG+dwdCHbx1tj4aL0e6jvcjtRd7pAye00DHRIOVz3yW++WKhlqIs9+sLJvlcB074PnJOU388/ATl/EAsseMExoZ6yZcc2MoxmVDWi5XqkkFzVFdglqGI4abJtl7CR9vV7aCQH3SOobt2YOa6WjVZO6JGgSXZ3qCVO/q2fCTGBzVgdGh7Au3vhD2ec2yFEr7AHB40cNcEmIozufc6wypNitUwvU0l/GbqKg+sv/OSuqC1tbPheX9dS5Urp5/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5a4fuJ+lqzAwiO6udmAJaIeSMCHy74RsE6eVuysi7Q=;
 b=gpuOka2GvqYAxZ2Z6t8S9XNo0Hr7J79v6L1syzC8XYMwGiS2Y8q+vVWVw6MGrz4vfyWAiy4ZzfJivFIfHlYN2Q7KFWy5Vq3/gnNiNORaMsta7XaQGzQa3ZXl8LEOR8oTHVLYR/+R1WtHg9YZtdd2ewH/qVoEs0G/pPKHGcvzwxgQgMKjXjti8fnoJYGlbATKhv4hCK13fcgK6dX/QB6mBCT6KDTkyWbwWlhtFfGXjOYajI76QViJFZbZmyJzrCs/fQwHQm2o0Q6fN2qt2D+RkjKzjo4c1aYK/nlOXVxQ07CyIpayeYcCpCWNYM0VzzyZB9Rl8VNXaWK+4zIRCQUW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5a4fuJ+lqzAwiO6udmAJaIeSMCHy74RsE6eVuysi7Q=;
 b=wxe3CQYwwYKY4ibGxgNgJKxOnDCo9ldOrPMIh+vCoXg/YoAi7Q+6ti9J+CIF/hwA1bniHLYjT/a4wzouf6oxjojcYBgNcCO62XeZNGxadQyiH5FhQTsdSAQB+ilNhuS2VMjiVve8doY4gaY64qhc3QzjBGuSsY57VYBtB64Umsk=
Date: Mon, 7 Mar 2022 16:52:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <YiYqLtozm4/2Ibu0@Air-de-Roger>
References: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
 <YiYfVmW3iQ4wA5k/@Air-de-Roger>
 <ca144758-da48-00a1-1e76-872c3455c335@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca144758-da48-00a1-1e76-872c3455c335@suse.com>
X-ClientProxiedBy: LO4P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f14085b5-0599-43cb-bc39-08da00527674
X-MS-TrafficTypeDiagnostic: BYAPR03MB4664:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4664121E8E7765147078FE6B8F089@BYAPR03MB4664.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4b8vhmUmCEMDPU0dW5RzX7vfm0HRhhqWuJcuO98KCemK65RWXOEb7FG/001lHyaliywad7K4xZXXw+ezZw/y3uFVFyaHi7mVL6cIBNfK3YhodaiGwISd4bQjPnt8B595pfPYyuBZEwMUyVn9F5qOBZnrsxWYpApYYFE4p26IOIuMnicJD0/X1+gbksi7BFqXKjqimCgkpiyXmzSGJKk7q86FWs+qWPobp4fx8LhDAzm3OQFCVf/pOUZKB5yFOko4s8cuw71CAdBeA1dtPNSn4+tRftEQNJ8FhYP4KHbW6aK7fs5o/9DV8SVeSva+LtC16p/mH7KsAZWplQkMYlzBRzl83hbHESdbsiJBDxExWKvTrpRtBXOzj5KBSym47mVWCaIA1M03eU4JBxKeObJduiL+1YAqlAV8NScbIynLPWBQTZ1lkDJxcwvDhNz3wqLI7XDm897vOpgpuSJHUQRXX9j1AIGnfL7CeQBmeVzCEsaA/yEb4ppew3jLoLXOSKY7wK9O1/1w8ZeYjMBR+Gwyxa8RYmjbOkERp3hHWJ2gUFfwFjv/k/FxIXKlzFDpeKcAp0Dxk9mAXUl3m6r0PUGgizCKuI8ccSNzCIxsh5et9cI65DF+ahlVjKbwCrwX61l8YoXMlYKwrJIj698HO8x+RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(508600001)(6666004)(9686003)(186003)(6512007)(53546011)(86362001)(6486002)(82960400001)(6506007)(38100700002)(8936002)(5660300002)(8676002)(4326008)(66946007)(66556008)(66476007)(33716001)(85182001)(2906002)(54906003)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTZNNzNDemtWUjZEYVpCYVhZRVg3N2M3K2J0MjF4bDhzSmJYa1RCZkhleC96?=
 =?utf-8?B?bkVvV1c4cDdkWEo3b1U3ZlcrWWsrRUloZE9IU3pBNmJZcEE2REVQenZWS21x?=
 =?utf-8?B?VWpudXM2MDVhWjdWQm81cEx5dXdMb3VudmlDS0xTa3dWNytCWjlqTWR5eC9h?=
 =?utf-8?B?UXJtVzVtYVZuVnlySU4xN0hDVlVFNGFUYy92bnV2UllqaVVwMVdHZUJYclF4?=
 =?utf-8?B?UGd5a0syU2ZqRkNZdFR2NStjYVMza25ic0MzVkVRVGdqUFZjMVVYdFdyWUN4?=
 =?utf-8?B?RGFvNHVyRGd5N3FhTG0rNUVwVXVBWVpEcFg4NnpyRXVPTzE3OCtoSFlCOTVi?=
 =?utf-8?B?WDdieTc2dW03NE9xWkg4bnVZb3BHV1YrU0w4L1lDQ2RWOGtCL2tGbzhoL3NB?=
 =?utf-8?B?K3ZPY080d1BkZkcxeEdXWlc5cStEeVNmT1FpV2k4UFlnYVF3RnlmNHQ5ZDZZ?=
 =?utf-8?B?bUxjbzhpaXB1V053Qlc1cXA5VjR0K0JqOVFUZWd6aGFxVEROMVFQR2FEL2ZU?=
 =?utf-8?B?WEtjM3RkWkM2QTVSaTVHYWU1V3pzNlVIeHRoT1Q4U216dTZGTXZMTXZvdkw4?=
 =?utf-8?B?YUtVNTMrMlFySkJ6MENTT0RZeXFmNktKY2JseE1tMmRXQTFwOURPRmU4ZlBh?=
 =?utf-8?B?RUs2WW5RdXZwalhsbkZ3S3Nid1RoS1VtWVVUNFhnMDd0QlcxOFI4VDRQbWN3?=
 =?utf-8?B?WWVzWFVmbGlLTEJadTBQK2I4aWRKODZHUnk3RXZrNHRpQ3pEMEIvU0pWUjZa?=
 =?utf-8?B?a0xHVndmRzgwbUE1eHpaRDZ6ejdHWXNoS0Y0UjZ3eENYK084czZmRFZXaHJo?=
 =?utf-8?B?Rk5YdmR5dml3WHhtM25US1FXWEd2ZzBwQXhOY1NoMlRRVTJTNjJ3eVdNZ1Yr?=
 =?utf-8?B?ajRqc2FaYnZqOWZCaitPRDlmUS9udm1FU2N6SGxRTEI0WU1XeURXVXlMZDhI?=
 =?utf-8?B?SnJQekUreUI4VzE0K2JqZk5uQmZFSGJiTUpWWjRFblBqV281UndJV28vUk1K?=
 =?utf-8?B?QmR5Yjk2dmdVVlBRYjNBSGdZKytUSWphNEJmV2pEanQ5K0xMdmJNU1V4Z1pH?=
 =?utf-8?B?cGUyelRiREZwSXRPcENDa0VmYTZpVDFkdWxIZG5WMUM5Yk5QbThZV015dTVn?=
 =?utf-8?B?UFltMHV5QWovT0NuMHM3akY2OFF2R1BqNGZUWm81c3pDUkhiUFhVSUI5VmVE?=
 =?utf-8?B?ZVlJKzFmeU9SMW50azdERzNpOFZmakdmQWR3T2RrV1BpakpPQkJzUlpIek1l?=
 =?utf-8?B?T01Sb3BJb2o3VzlsMmw0VTVZbWZ3Q2FTU1JuN0lvRDVQTFg1V0VoNngzaWJU?=
 =?utf-8?B?czE3eWxyNGt0WXZZVlBqNGprUmh5RnZhYW0zTWhmM2tSRGdWLzliZ2U4cGw0?=
 =?utf-8?B?ZVV3TEdBYkx0UnYzN1pZRDNmWE55VW4rUE12a25iOUIrcmpZSTlhUE5ZZUJo?=
 =?utf-8?B?VkpHVjdjeVFYbFNHM1NQL1pjcEl5aW52c3ZXVXV1UDBMdDBtWHBpQ2NRWHBW?=
 =?utf-8?B?alFoNEwzdjN0eW0zV3M2SHNtTHA0Q0g3V3Z3aGJiQlZOaWY5cVF2c0V5akZ3?=
 =?utf-8?B?ZCtSNjZBbXQraXh1KzJtZTRTbGR2SW0vN0Z4am1qbzhzdTlnaXZNQlRoMlhK?=
 =?utf-8?B?ai9leWZEYWcycXJzMWlCMjAyVURYamRXcFdVWU0vNnR1TUNLUjhObWJPcWM0?=
 =?utf-8?B?Uk1RYnJlaTZnWTFrT3YyUDhzUEUxeUF4YTVXYjlqaVp1UmlXcjBzb0ljbngr?=
 =?utf-8?B?VWNwcE5aMFN4eUtCVXFERllzZXdnOFQ1NWkxWExaa3NaNnFhMHo4aWVIN29H?=
 =?utf-8?B?VnJ0SGJTajlwN1QyTUh1VXByMnhDaTdIcjNXQVlMSEpXSHA0VlBsUGJPOTR3?=
 =?utf-8?B?aUpLQ2doRG1GT1NDVzJBTmdYbnhPaWd1WVVSdUN6YmJDdnU2RWJYN1FVZmEr?=
 =?utf-8?B?d2R6d1BJVFRPaU5WNkd0ZmxUUUpKVU1FNE9SVE5IelZydC9wTXBGSmFKaHhp?=
 =?utf-8?B?TFJaYmRYalB5N0hhS0RWVC9IUzlSTm41NWgyNUR5TUdHZ3lEVjUxQU9vbmZY?=
 =?utf-8?B?Y0pueXBEWDg1d3pkQzE3RkNkNzRKQ3hDcXcyaERoOUsvVG9Rbk1pSDRIdmxF?=
 =?utf-8?B?RkFQU1RPNW04S1p3R0FvYjhjS2VMaXZCQm9ZZ0UwZjlzSkhtTEx4WmluZzRu?=
 =?utf-8?Q?8BwivxO6VuRb7EMBauutuiU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f14085b5-0599-43cb-bc39-08da00527674
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 15:52:20.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDwQ9CcbWPIYkc4KWq1ZCCtcGThIs48x4t3u1+x2E3QCsSaSr2MhOfrRFkOhflu83C0wrskJI97J0iJMjDRg9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4664
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 04:29:22PM +0100, Jan Beulich wrote:
> On 07.03.2022 16:05, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 02:49:32PM +0100, Jan Beulich wrote:
> >> Support for this construct was added in 2.22 only. Avoid the need to
> >> introduce logic to probe for linker script capabilities by (ab)using the
> >> probe for a command line option having appeared at about the same time.
> >>
> >> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Obviously this doesn't take care of old LLVM ld yet, if any care is
> >> needed there in the first place.
> >>
> >> --- a/xen/arch/x86/arch.mk
> >> +++ b/xen/arch/x86/arch.mk
> >> @@ -70,6 +70,11 @@ ifeq ($(CONFIG_UBSAN),y)
> >>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
> >>  endif
> >>  
> >> +# While not much better than going by raw GNU ld version, utilize that the
> >> +# feature we're after has appeared in the same release as the
> >> +# --print-output-format command line option.
> >> +AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
> > 
> > LLVM ld doesn't have --print-output-format:
> > 
> > % ld --print-output-format
> > ld: error: unknown argument '--print-output-format'
> > 
> > So it would be always defaulting to SORT. I'm not sure what to
> > recommend.
> 
> Do you know if all versions we support know of SORT_BY_INIT_PRIORITY?

Hm, I don't think we can assume that we support LLVM LD in 3.5. I'm
not even sure if LLVM 3.5 had LLD in the first place.

The first version that we care about and that we test is LLVM LD 6,
anything below that version is of unknown state.

I've tested you change with SORT_BY_INIT_PRIORITY on it and it seems
to be fine. This was on FreeBSD 12.3 version of LLD, not sure how
many changes have been backported from newer versions there.

Thanks, Roger.

