Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8AB72DFCC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548049.855839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Qr-0000wK-BB; Tue, 13 Jun 2023 10:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548049.855839; Tue, 13 Jun 2023 10:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Qr-0000u2-89; Tue, 13 Jun 2023 10:39:25 +0000
Received: by outflank-mailman (input) for mailman id 548049;
 Tue, 13 Jun 2023 10:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qeg=CB=citrix.com=prvs=521ad94c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q91LA-0001im-B6
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:33:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc71a49e-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:33:30 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2023 06:33:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6266.namprd03.prod.outlook.com (2603:10b6:510:e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 10:33:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529%6]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 10:33:13 +0000
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
X-Inumbo-ID: bc71a49e-09d5-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686652410;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K8kwdqFYjB+C+SDMEq8w/k4i2u604oboWdpP7mXttLs=;
  b=FE3vncvVXeG1AH9vcs8Va4YxPjRlnEKr4ylnSKk6zJxc5Apojf0ejvGB
   KI4+b6mLRTIjp0QPh4nhPEWieH3OdaoijJ1mkmEFU3k6LX30yAiUeI88f
   Cj2UUbysvvBks0PEkBbN4MiLLJRR2qV7/EFVxWt+2IyHcDyTmQROikpmO
   I=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 112605362
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OBU4bquLAzbIg7bL2N8mp/i5pefnVEtfMUV32f8akzHdYApBsoF/q
 tZmKWzTbP2NNjb2etFxat+/9k4FsMWHzd41TlZuryAxFSwQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMjdWKSqvps6M3LeCRtt03cUNPs3sM9ZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4C9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdhMTODjqKQCbFu7y2MRDCMRD0OC//y2gUmHR/xxc
 kcs0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCMSdGkLYHZdSRNfuoa55oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr7tmuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:Jtvk5apb24h+BSTLY68hnoEaV5oReYIsimQD101hICG9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhP1ICPgqXYtKNTOO0AHEEGgI1/qB/9SPIVyYysdtkY
 tmbqhiGJnRIDFB/KDHCdCDYrMdKQ+8gcSVuds=
X-Talos-CUID: 9a23:65rCJmPq5E8DWu5DQi48s3Q4O+wfbnjkwEXIeE6WG2JuR+jA
X-Talos-MUID: 9a23:Jdrb2QQlpVbIhQwPRXThizNmCsAy+53wDU8GlqwalefdPhRZbmI=
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="112605362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K330O3M9cvvR7UAVA7IypVJIDxuGBQeJNinMw2HrOtm5jX3xbWiwc5UjfuITO66bxcY66fE3cSCxYtSDM3402VYPtJsdeRytVPyOAC59tsvs2iRwLQL246tcev7DAVfywKQ0AQ+3MQJgCgbmrM4KbSNsk8pKLsLQuNjdwtbMHXJ1OyeAgNVea+QSOrNRgu4NAbznfpK8ok+1eHSLJP3/OTI2URht69LF6+v1xdMwvUHS5SCYvUQvkQ1qI9uYdJHrPkCIHiesUt346EBKdC0IH3ZYhawPOlhB/ROkd7j06Tolw0EgQxRHERr5bd53YhuIhQPFJZ8DajPST2QQw8HC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xcr/+OpieiydOSz09MoTu/6UtJ5G0GtWOcbANOB2+JU=;
 b=C2G7it6Lkw1E1W0AvVEve11N5pI7iMoljEIB+xaBzT2+L8u8WkdZodUT+zjbtNiscWIAhFMIo8Fv1a7Nla4N+qHPPJ4UFMb0TNsXJgkc8pC7EBFnXdoOwS4a7Pei6eIUTkmIpn8D4VmHOrtoDptFnV6vsmXBF/+MMs0xcKpwmwJypwuQPWcALCdvUVao3ZQ7lneEVyyUBi3NxtovVDT+NPZO80F6hYC3VkFGjZcyPhNhctr1f9BrvZsKbYEhyE7kzgAzjIUnUavLr192R5E4SXd0vnl13/DDY8JHD6g37tD4TxzbbNO75mfxCzECKm6oQvqXAsTsuOjnwGBvJVfI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xcr/+OpieiydOSz09MoTu/6UtJ5G0GtWOcbANOB2+JU=;
 b=SJF0UZYNtjv4vw/5Lsyut4Su+nSVPIezpH5fclQGJ36caobqGmbprjkNmLAVD0Swqxx9hv1/WfaX5WdmUL+ERFHs7rWbm6L/f7oESB7rve3XE1W7MLGdnh8gqJ8v0MCHYvkJ01qj5jqEGBZFop679lWzWSthPbdWfI9udsdgOpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jun 2023 12:33:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: fix checking for Invalidate All support in
 amd_iommu_resume()
Message-ID: <ZIhF5MmSY0oEVm5t@Air-de-Roger>
References: <20230613101313.51326-1-roger.pau@citrix.com>
 <1c8bf2cc-4c91-6db6-edf7-81472ee107ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c8bf2cc-4c91-6db6-edf7-81472ee107ba@suse.com>
X-ClientProxiedBy: LO2P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: d16bf6b1-5da6-40e8-b54f-08db6bf99773
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sYOuynKckvt6vR7eTpAj3O7nUwvkY7T+b9gvWN6YS2FjfNkyiPgVENgvh5v0ahoZTW/c2cSJmxhxeqdRsZ+2olzoWyoT8tG6LAKVRDFeTTorVPnJlh7PpEXZeAPSQB4kvUxUx3/uOijMEHKEqjOyclrphGwkQbS5xm69IeyEi4OmAleP0x1jLnnHX6DNbi1ME6+dUju4kcjKIXZid14Y2WRUFOl8iWwxQ5BKo5/poCUcidIPFzNJqNTtWTk7OX92/i9WZPEH9LFY0YriVF4xwEbET0SbrsZePmXbDx3v5vY2GXiKpOW9tjK0vezE+26/Ma+yxcdW+8lvCeMxLp4R5s9Ehsi1oq2lFJsQFiDRt0cGLKwTkb0m1LYOLRwFNeW+1aGKluFg3SkMEeV86i0KsLuYzj8FbVsQ+S8+xxcznn/KLzX5fJUfY5rDfgk3oT0fShBh71LrMhhXQyrSvXKbY6RPvjOJqFAL0ihyWafeNa6MqsfgJaFeZCuIrD+tBDMzGvG7nYClHIKIYftewOVEcXvawywRb/uKC4RBXkq9RZDTpvHc14Iq0AeJGHL4PNYR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(86362001)(6486002)(316002)(8676002)(33716001)(41300700001)(82960400001)(5660300002)(83380400001)(26005)(6512007)(85182001)(38100700002)(53546011)(6506007)(6666004)(8936002)(9686003)(66476007)(66556008)(66946007)(6916009)(4326008)(478600001)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1E5cllXUXBIMzBDY0VXcjBwL0JMYTNsUzFERHBWR3VaQ0c4a0Q1WC95Mmo2?=
 =?utf-8?B?THprWTUxS01LYTRwRHYrS01veTVUZjFUMXBnUWRNTExQVGltZEJZNVE3ZkN1?=
 =?utf-8?B?a2RkNXY3amZ6bGk0MU53aWtXaXdFRm5takVEOURITHY0ZXlQRHpCL0pXckZl?=
 =?utf-8?B?cGYrZHUyQTVRK0RHK2JpRE5COWVJcG14by81NDYwVFZCWUN5VWZJRTh6a2xh?=
 =?utf-8?B?VWNRY1RkL2VFcHlQU3piN01LWmhPTmpaWHlOMUhyL1gzWFhrQzczYlhLVXFC?=
 =?utf-8?B?aDR0V3VqMmpaZjB3WjdnUlJxOXZHWGJ2ZDR5ZERNTzZ5amd0MU9WbGxJZ1BD?=
 =?utf-8?B?NVlCMDg1VDUwVDMrNmpUdWpDQjViQjJJSHRNL3lhMzdBQ2pPR2RkaC9Td0pD?=
 =?utf-8?B?RmNKdndoTTlRTjlvUzltc1pnM3lkQ25aa0dvZkJkYVEyYnN6Z2tXcGdEalVQ?=
 =?utf-8?B?WEVqY05RUC9zVzN6Kys4cFNxcGorZjRUMnpodVVrL21IN3NHM292a1RYMlJB?=
 =?utf-8?B?c3R1ajVmYkVsNTRjSkd5VklkcVdubUpJTU9mcDcxaGF4TzU4RXZRcUppRlZn?=
 =?utf-8?B?NkIxeHRuTm8zUC91d0dkTHozUkM3aFdaUzF1NkN2V0Y5bEpaa1hhcjBrRTNh?=
 =?utf-8?B?cE1lTlQ0WFZNWmwzMWZhR1V2WHJuajVCTG41TEdKa05FcWZGTVZKeEZVVVZ5?=
 =?utf-8?B?ckZHRXJnbEpRUlJVTEhtZy92REVKS3ZUYXdMT2w1eHAxc3pnRDhrZ3pzazky?=
 =?utf-8?B?eUlqNXJYaXFZUHBSek93SHFyeElQMkJkOU5zTjA1cDVPU0pMcHFwRkdPb2lG?=
 =?utf-8?B?Z1lFeVBvMEJVVGkxdzdTU2xycDZuTERjcEhIV0RsTktKTnl1QXVRK2lQR25r?=
 =?utf-8?B?ZFpET2lpQVovaFprNksxOVNOeDZ6MWZ0TXpUYnY2US9sVjJDaFM2MFIwWHZX?=
 =?utf-8?B?a2VNZjY5c1ozcGxseEo3SWExd1VYOGpIQ0dualBCMjI5Qk5WSWs4YktJY1Nm?=
 =?utf-8?B?MVl0SVBLRmZNWHNJVGFSNG5FNVdZT2YxRXUzeStsVzZVV2oybldZMlpzblk3?=
 =?utf-8?B?eXVzZzZBTFNOWE1jWUQ1ekRzb2pnT0FTZjNZWnZjTG16VVZlMDIrRDJRL0Uv?=
 =?utf-8?B?djE3NXBjOUcxYjN5MU5qcmp0ZWN4NkZuMVdCSHN4dWpNRmY2RDdZbzc5TWJJ?=
 =?utf-8?B?cHhWM1VNMVgwaDlFT2JIRGxWbC8rNGc2cmFMSHNtU2NjMHFRdXh4SXl5T2ZV?=
 =?utf-8?B?RGJ1SHluMmgxWmd2WGZnVEREb3BUVmlucGNGajBrSm16ekdkRmpGZGVCYkd3?=
 =?utf-8?B?WEpnM3R4dG9MQzZyZkdRU1I2UEZnZVREZ0FzdGNNK2NQdU5rRGdZd3pkVEFU?=
 =?utf-8?B?b3JxbVd3NHQvSXRYWkJuMEZ0ZXBxZis2Qjh2OVVNT25Rd1pRNmN4WHpuVW5i?=
 =?utf-8?B?d3NFTFZPYWw5aUl4bGtDdjJ5UmxRTWtZR1k0dE4yK2NlTk40TThJbFVlcVE2?=
 =?utf-8?B?S1M3blR2YnBJVW1ZNkp2dzNrVDRnNU90RDBKK0xxOHllRWl0VzhENXFxQlRr?=
 =?utf-8?B?ZzJTSDM3OVd0Q0IwdlplaGxNTEx0eG5MdGR3ejAvQWdkZHdEblBMMTRZL3E3?=
 =?utf-8?B?d2JVRnZXQTJYY3hhSWM2eEdrM1NXUVN3YS9YL0toNWlSalBsZzVDQk0wR2pD?=
 =?utf-8?B?RkMvWWh4NHQ3ZGR6U2JIM1lwNmNtTmp4d0V6V3NmVW5MTWU5L3pHSzlIQUlu?=
 =?utf-8?B?V2sxMTJqYndCelBHTmRZUk95dE80SGsxRWQvdEtQRnJILzNCWVpHcExjdkNa?=
 =?utf-8?B?aXhJd1hMYXd0c3VUcFBuRGxnTnlVTExvd2ptaCtPN3RHamdnQ2RUMDlSZ3Y4?=
 =?utf-8?B?dVZEMTNMN2p3RXIrVlBHS09RazF5dzlRZURRSnpkTGFxc3hFeGNlZmtMRjJZ?=
 =?utf-8?B?Vm1BbkFhYU5pVGVSZUFmeXhDcHdEYXoxQ2ZvcXZOWXo4c0U1LzJDdW5KdHg5?=
 =?utf-8?B?U01hR3k4QnEwQ3ZmU3Zob1Y1ZjdSM3lxOHFodVNDMGVhZ2U0eGR2MUJyMUxI?=
 =?utf-8?B?eVEzYldqU3ZveWpCcVNLZEJVZmN4Szh2M1lRQ3ZmNjlEeE55U2lRL0hYZ2ZH?=
 =?utf-8?Q?TQTvHwiZlG47IEexib3rA8Y4A?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E57kt3VCrWJ8JtqL9W64MdaLAVkKNiYdEigqef0YwmjYBRFLprQ3S9f5Zhpvhj5S+Rf0xYs5u855wPrXHKykz4tIfIYMRWGJ59964hWsx8EjOujKlOMLMD8nakXmxWhhPA/XW+6vGcFXzxfzv+4IAjgnY/Y1n2htRoRIiH9/VaBBdNL1czN397SG7lHtAFRWItx90CamZAHiALYyUJM+44ys7oRLEHNsFE7wGxo1ICfhZpml8QbGZnY/u4M3BpvoXqruMVtpq7gS0jjVv2GmlS6FE75XdhLPcCOtFWrXkmWXhYl6ii7CSJE6xzh2mJV7Hyzvh8C3qwByE0oPwixZGQs/FNfvfVIg811Vzzg5+c2JsFhfqRZE7e8LWv271bqEAr0/R6LfqsikEp/MZTOnpkQdSRwlab0w7IKarDyDudTaIySC0xojqq65k3oAyi3ipoUz1va/SzjN6Vwg82/6/i/dC8LUfwJzGuHlPU2Jtygie/D4bTCQacJ/ZCn+t9ZbpE1flFj4s/JDX/+81FclRMOJp6/qZ9NqW5pbhXU7cJ6Ur0l8fkdaGhXFAy+eFKYhv7xQnHnqy8+aA/Ofxn14UWsuBDQJFyVEws9yPmZ5VKfOBPF6/c1B18+fj/kZ18KYKvn1rOdLqPZj9sq7neJ3qZ++p9o4VeUeGqcuIfYylLfv+YgX8UcuBh9NaZu/s6YHyfTMvxuzxE5IMBnyFWCtkQhxRcDJEkkUMKyD0N2/KiEeLnRJYmQdkatKL8n6iqAAFYJ2jzscoR5A62VelG1/+PjZXcRXJasxx5MWrAsb6Yfb6QBe/B63FwuX9NqyznK8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16bf6b1-5da6-40e8-b54f-08db6bf99773
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:33:13.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcW5SuM/w2qg2Y6utBoeZyWUA21hALddroLalCwxvNZRRI272JaHPzDYEJI02Hz/u2Q144py/2FmI3szhd+1MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6266

On Tue, Jun 13, 2023 at 12:23:37PM +0200, Jan Beulich wrote:
> On 13.06.2023 12:13, Roger Pau Monne wrote:
> > Do not rely on iommu local variable pointing to a valid amd_iommu
> 
> "Do not rely" sounds like we might, but we choose not to. But we may
> not rely on this, as the pointer simply isn't valid to deref past
> the loop. Hence perhaps better "We cannot rely ..." or even "The
> iommu local variable does not point to ..."?

"Xen cannot rely ..." doesn't modify the sentence too much and could
likely be adjusted at commit if you agree?

Otherwise your last suggestion would also be OK by me.

> > element after the call to for_each_amd_iommu().  Instead check whether
> > any IOMMU on the system doesn't support Invalidate All in order to
> > perform the per-domain and per-device flushes.
> > 
> > Fixes: 9c46139de889 ('amd iommu: Support INVALIDATE_IOMMU_ALL command.')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I don't have a way to test host suspend/resume, so the patch is only
> > build tested.
> > ---
> >  xen/drivers/passthrough/amd/iommu_init.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> > index 9773ccfcb41f..4facff93d68b 100644
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > @@ -1580,6 +1580,7 @@ void cf_check amd_iommu_crash_shutdown(void)
> >  void cf_check amd_iommu_resume(void)
> >  {
> >      struct amd_iommu *iommu;
> > +    bool invalidate_all = true;
> >  
> >      for_each_amd_iommu ( iommu )
> >      {
> > @@ -1589,10 +1590,12 @@ void cf_check amd_iommu_resume(void)
> >          */
> >          disable_iommu(iommu);
> >          enable_iommu(iommu);
> > +        if ( !iommu->features.flds.ia_sup && invalidate_all )
> 
> You don't really need the right hand part of the condition, do you?
> 
> Preferably with the adjustments (which I'd be happy to do while
> committing, as long as you agree)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Wanted to avoid repeatedly setting `invalidate_all = false` if all the
IOMMUs on the system don't support Invalidate All.

I don't have a strong opinion, my first (local) version didn't have
the right hand side of the condition, but then I realized that setting
this for every IOMMU on the system could be wasteful.

Thanks, Roger.

