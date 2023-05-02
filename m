Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF116F4039
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528406.821507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmOj-0003mG-6L; Tue, 02 May 2023 09:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528406.821507; Tue, 02 May 2023 09:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmOj-0003ji-3N; Tue, 02 May 2023 09:34:13 +0000
Received: by outflank-mailman (input) for mailman id 528406;
 Tue, 02 May 2023 09:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptmOh-0003jc-0u
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:34:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b9d8f3a-e8cc-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 11:34:08 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:33:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6699.namprd03.prod.outlook.com (2603:10b6:a03:402::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Tue, 2 May
 2023 09:33:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:33:49 +0000
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
X-Inumbo-ID: 7b9d8f3a-e8cc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683020048;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5zgyUxEJbKeos8eY1I65h8nPBR26M0j8HASaCCtmj70=;
  b=AZuZ+YpcTh9NN5CyPoHbAVLTYxhGwg7OBZnh8WiREthyII0ubqjg695c
   x61AEckVECsyAJmvKHNg8ZGLoPxh64KUQ3BctumkpPM/SCWUP6RIC7EwY
   u4ASybAJ098C4C9GbFSmtz81BxAGYBOdoVTUSMLZYdNnIilY/OFtPsKZc
   o=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 106876281
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NFR6KKtMPNC8Jxl52KHjje4gwOfnVMhfMUV32f8akzHdYApBsoF/q
 tZmKW7UPPyNYmSgfdsga42//RsC6pXXyd9hTANprnpjFywV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGzSFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIhENQgC6ltCMwbu6ZvFDvPYqM+/AM9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIW9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANxCS+PipqcCbFu7gW85LhBOan6AjPSHkGjuWPYHL
 WIZw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqYj272g+FHbgxqlvpXTUhMu/QLTQ36k6QViIoWiYuSA4FzW7/9GIJyeCEeIu
 HwJmc+25+QJEJ3LnyuIKM0PFbel/eeYMxXThFduG98q8DHFxpK4VYVZ4TU7LkE2NM8BIGfte
 BWK4VwX44JPNny3a6Mxe5i2F8kh0annE5LiS+zQad1NJJN2cWdr4R1TWKJZ5Ei1+GBErE31E
 czFGSpwJR720Zha8Qc=
IronPort-HdrOrdr: A9a23:2dq8gqnZ5yTu4rDB8A7xG4tKd27pDfNLiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42G7j5vZZmxm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjsOTj9Vxr8m0G
 7d1yj0/L+qvf2XwgLVkza71eUapPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+Bwlve21714usd
 /U5zMtJd565X/9dny85THtxw7j+jAz7GKK8y7TvVLT5ejCAB4qActIgoxUNjPf9kobpdl5lI
 ZGxXiQuZZ7BQ7J2H2V3amCazha0m6P5VYym+8aiHJSFaMYdb9qtIQauGdYCo0JEi7W4J0uVM
 NuEMbfzvBLdk7yVQGQgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i3AVwcQO901wgK4Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWnKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGCfIyEZ0Wv9ihi3ek6hlWlL4CbdBFrCWpe3PdIms9vQvEyAJ
 2ISdZr6/yKFxqaJW8G5Xy4Z3BoEwhvbCQkgKdEZ7uwmLO7FmTLjJ2tTB+BHsuaLR8UHkXCP1
 AkYB/fYO1902HDYA6LvPGWYQKgRnDC
X-Talos-CUID: =?us-ascii?q?9a23=3ALt1GG2lER5FR9/1sUbCYvYG/ZyLXOXf8zFvAGl6?=
 =?us-ascii?q?KM2dgSZGNZmWi8bxCuMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUseKYA7vvXeEuzPpWbDaxIQixowv4I6IBRgytK4?=
 =?us-ascii?q?rtveeE3xzH2+bojmOF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="106876281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKsJ/lwyG/cnje+UkX+EaqMpAqUk47BzH7r0qc+CaPRmUnoQkJcowC/jxLG7R41dUHkpjvIAwfrFaskj06niaZgXgAlHwAR0h+zN4sC2VWFKhlc0COIMEUpuZMYZfcdGZem56ze7m5mwWNeMqESmVLN0mzZt/uDD1vT8jDb+OhgFAgYO/46+WVoWti7P4sOB/og93cyngNrS1cI8ZmXDzXZDtQ2ivmZKCQW2ugKeYSlFi1xpqp+72Z8Jjws+sfU0AujIPyRo7cUCNttgKR6oKKgwky0FobzU3ldq8BzLkQJ0dXgo4nJFe15bX02hq+sqyeb4uhgRveu+A5oLYghJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUuP+RCufEMSUbnrdI5OJ9jcsu8ig30o9+L3OWAOM7A=;
 b=YSPvJzlE0s+Fl8UQ3xg+wo+p6/0lmcovkxuEPwGW9UGY/6GZ0YfWraoASzSiW72sEOZcTyBdLZbslrclDMcikp56P3tNvVT+1IjE8wkWE9S88UILh5pY/lsDf7y+t4y/zZegSIqrSHaETM8sgctOvzJeWQoRq7ObD0Cte1HzvSjFrAz+l9tiAuB+Ba0WPDx1HFBm3ybMQtTcYmeTjPU4SgWCQ/VZd+ELeQP4Nb77js7822CwC+cFFHr1UE9ZNvAkMQxPR6lOx/Qu3yP19lOG3BWtL+EyD4Ebo1eOvMZjuLjH2xEZaY0tMSBRgm3UDCG4Qr6xNz7WAtydYKkALOLrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUuP+RCufEMSUbnrdI5OJ9jcsu8ig30o9+L3OWAOM7A=;
 b=JcGOBb1p1ufJ1DKTVJKYEgieJUCt85GzN+rW8GnpB30cHzv7beviAej0GP+FADneESLRAgBOtsp9dtQIeUx2oreV2h5N6GjHe2aOctJsq1V4pUeifg/I/KDr+ZuNslmuo7M2lgG120TSWa7ceK2E/3JwbgQiZ9YEPfpbTYc0oKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 11:33:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Message-ID: <ZFDY9/mXw1gr5HgI@Air-de-Roger>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <afc999f3-fbe0-3b52-2f8a-b8b5a36eda87@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afc999f3-fbe0-3b52-2f8a-b8b5a36eda87@citrix.com>
X-ClientProxiedBy: LO4P123CA0544.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fd9326-0936-44c2-3e11-08db4af0556e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k3oP4ioLuhF2xjUm0z2TpuchLI80y3ZAxw84I6USw5c6SDmIj60TuuwnhbloG9u5QC/Hk2YtUZj7LZf+1Hek7AEeE0JafMW56JN3PI8HYbmyyh6efQDMGtoLtncals79k54G2aDCAnBkk9zVCvY5UEB65j6PA4K6AYWLcQv50eQh13wq2HIn4FMmGsI5KKCG6UHZePYD/tYcGTXp2K402g+1Q0pHrk6lq6zfU2WbSSmFtsVckeBZ17h+wdVJ+TKa2AAIsBEpbfBtgdHJMbYzw3nHBy9+gmspxDShoMn5j06ZnuniCm++GgpIO4lq3W2z/ta8XK/OHPH+oj7nizcIDMIfgpjAQQvoDxynYXABwP7w9G1itWn+29mDF0fsw9MuS57caH5TDHaGeHm0XHEZhFZ87sO2TRic0JrWN46WV7fu4w27CQb96MD9g29KLDiPASRW8AT4bQ2hazDxBDTVTkM5Ms6tUW0XAKnRkw2OmZ08bHnTZAOau1hGrMATsKWQ2JXkVNBcdefIrxfUaPyXitv2kaGBs4L+QUdSujueB/rZuVXXdiUzKV0uwI9wt5sg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(66476007)(316002)(66556008)(41300700001)(66946007)(8936002)(7416002)(8676002)(5660300002)(6862004)(4326008)(86362001)(33716001)(2906002)(85182001)(6512007)(186003)(478600001)(38100700002)(53546011)(9686003)(6506007)(26005)(6486002)(6666004)(54906003)(82960400001)(6636002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODFmUGg1c2VzNnBIZHVHYTFsRno1VjFRRW1HenFjSjltd1hWR0hOamVnYnlt?=
 =?utf-8?B?eW5MZHFqcGsvVWQyRThlVDRkSGx0NTNtazJOZGhZUXNRSVB6VzYvdHBqLzNE?=
 =?utf-8?B?QkFzYWVmaitRNDVtNjFsZHUyRW1Dd29kSHFBSjlaUmhRSHhFM0VxNHlIRllL?=
 =?utf-8?B?NTBWblJ6NUMwd3Z0VFdCcmwvNFNrbUNjWWpUYzAwbGZzNExYaDVKOGpud2Er?=
 =?utf-8?B?OEpTbFJBRVRidXEwdCswaWxyMm1oMTl0NkdMdU5IcWZ2aWhMM3JrdjZWZ2Ji?=
 =?utf-8?B?R3RPUUU4bXFXa0F2UTBoM2lnU1dYV05ob1BjcExKY0lMVWltY2wyOTkwd2Zp?=
 =?utf-8?B?bzE3allCZlNKeUNDYUN3cERJbWZWTEdvMXFWWVZjOGNnVzB0QmdKU2RGSXRL?=
 =?utf-8?B?a3B4TFh4UnZMaUU3RDRqLzBYL2twcTQyNmxKemFBVHkza2NIejhLb09NYmgz?=
 =?utf-8?B?N0ZmRkZaT2tQSTZWMHFFSHg1TjJuMk1yTzllc1FGd1JKV3N0VStBeGhIVHhp?=
 =?utf-8?B?ajVpN2ZDZ1E5YjEva09rU1lOQmxoMnJSZ2lPUHJXZXNPOENjL1dScWNRWEVK?=
 =?utf-8?B?QnU4QTYxMDViL3ZNR2J1b2VFNmQ3cmZHdW1WWFk2OS9LOG5zSEZFYjg0VmtZ?=
 =?utf-8?B?bDNZQitOK3VpZmdjakFzN0o1TGpCM0xnVFZNbDN1Q3g3QlFyRmh3UUZncDRG?=
 =?utf-8?B?TkVXSGdmRFhvVE9Jak1McVFKNTI5N2xOUFlkQWpuNDFXTE1xOVVEbXE1NDE2?=
 =?utf-8?B?V1U0blY5aUVMQjRCeWFjOTk4UlhNZkEySE9lM2REVktjd1Mzbnp3RjVjUHNH?=
 =?utf-8?B?SXZOOUZMb2pldFZ0OHNCMTJPbE5kRmJ5azg1dThHdElCaVpJT3M0UFE3eEJL?=
 =?utf-8?B?aVNOaGhHbnkyUURabm9RMTVBRzEza1h2bS9aU2p4YmgweXFidWg0MWZhb2ZX?=
 =?utf-8?B?cjBDcUZKdEZHVmZES3dEOC9oVkJaaXl4WjF4L0g0KzByUVM5eFhCbGxtYnVH?=
 =?utf-8?B?QVRMdU52Q2FQQmJFNGc5ckN2T1pvVnh6QWZZRkZTdnpaUkYrYlV0aFhiTW95?=
 =?utf-8?B?aWNmb29pR2xGdDc1MU1ydTdSUk5iRVVlZjBoTzh3bUJWOVhTcS9tVjc1c0c3?=
 =?utf-8?B?L1VIbTFlRGRhYUJPK1owR3pQajR5aGtwWTduODU2bzRhd2VDNnI5bmE1WnVp?=
 =?utf-8?B?ckZoa2xUREszL1Y1WFpIeUlzdzRleHpxTDR0ZHdBOCtqcWM2eUVMMzUwZysz?=
 =?utf-8?B?UDlLYlFub3JJd1Z3Tk9QUVZ3d005ZmpaNk5NRHU4UlJuTzhIanZTUjJDNWdF?=
 =?utf-8?B?R1lEamEzT0RlbnV4U2pZSnpDNXVqbEJiZ0tra0x2YUJMMWNOb3Y4dkRjQ2pU?=
 =?utf-8?B?UGNQQ21TdlJicVgzaTI0NEJTNkZqdjdRVHAvMkIwbmNBYnN3RENabTBPZk8w?=
 =?utf-8?B?citzNHhzK1l6N1FqaXVMeHVLNGMrTGNmN3pLZDRrZWozZlBFbFIxWFp4NGl6?=
 =?utf-8?B?Y0k5cFc3eC9Nekd6TWlZUmc4aUhPQ05MY0hZS0dla1VxQytKc0ZyS3BJLy94?=
 =?utf-8?B?WGdNR0lDUWxza3ZOVUZhQ1BxV1d5aEc1YWRIWlNwWVBrcC85a3BZbzhjTzJX?=
 =?utf-8?B?aU5iaW5aUTNwdktyQ3BKQTYzV2JUdlk2eUxNV3A2Zzh4bm96Z2VtUTRxUEdH?=
 =?utf-8?B?anNmMks4SVZGSlB4ajN4YTJXUUVKMks2Wjl1WGZBZ0c4di9pcnZpWFhZb21L?=
 =?utf-8?B?dCtiL05iM3V0eGlmaTB4UWJjU25vWEE2bG9yeE80Ylp4d0hzVW41bFpTY1hR?=
 =?utf-8?B?OElKYVRJV0hDaytZVEsvN040bDM5VnE5VUl2ZENZOStBb09BbExDL2VVU3hW?=
 =?utf-8?B?amVtbUwyM2NPNlR5VU9qZFBhRkdEdVhmQUV1L2NFVXZROEgrTHdJVVd3a2hF?=
 =?utf-8?B?YXVHSlYxZk82aUI4ai9QczdjNTdOYXBjMWlDZmZoL1BuVXhHdWtLTHI2dk5V?=
 =?utf-8?B?NnF5NThtY1FTU3JnR3BKZndYL2w2WjhNeUxaVkRBR1BXNmlWL2hmZEhNRDJo?=
 =?utf-8?B?YmVrK2tMYVd4Y2NlNERzaEdRWFNVQytaYXM4NmFHb0J5YWc0UDAwT2FFMkVp?=
 =?utf-8?Q?qH1f+Tnyy+eC/Lise1iUC5EpR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UlZBU3hFUk1ucHF6dXMvSE9kOUJtZmNSdTF3WFByUzU0MENWV3dtRkFVYzRF?=
 =?utf-8?B?azVCT2xPNzhZK1AzYlhLdHZ2bDdMNGhFcS9QcERYSHE5bHRTeVJOK0g3NHB1?=
 =?utf-8?B?bng4M1B1NktNeXFKb1grUVUrUzBreW5PaDBzVXI1OWFJTngyY3FmU0kvdm9H?=
 =?utf-8?B?MUdpTWo3d3o3L3VyMlVubmhGRkEwTWZPUnFNdlk0cU4vU05HbDlVYjFNTW5O?=
 =?utf-8?B?b0R1ZTF6b3g4V0NwMDFWRyt6NFk3VndDMGFoRDJrK25OaytiT0NiTmN4ZVg4?=
 =?utf-8?B?RG5MVEx5SWFwSStGSXVwM05FOVVxRDczb05HcUhZeGtEMVZFb2FBYzFtZDlJ?=
 =?utf-8?B?Nm1rQ0l4T2J5WUNsZWw0bVFXTDNMdWNKSnJxSnRzRlVocG1uQmlmS2xPczhS?=
 =?utf-8?B?MThKQ25UR1J1S2NRQUI3bmd3OWJsU0VjRDVNdWUxbmZxZm9QWUlJVExRVFRm?=
 =?utf-8?B?NlR4QUV6SzltNnFwMFFidm5lMnBWSS92azMrVk41cE5VdnB1SStqaGFxK3Ey?=
 =?utf-8?B?MnRtK3JUNjJ0VmhiZXRWL2pHY3JHcFBoc2g5aDVYL0Y2TlVJZVVUMjJ4MXdT?=
 =?utf-8?B?WE5OK2pUelR6c2tscVVFRjJQTmsrNDJFZ0NRbkpmQnZ3RUtpTTJYbWtIeEc3?=
 =?utf-8?B?dDRNK3NGZE9aR0M4VHJJeHppeGZXUHEzc25QT3pkQmN6a3BlRnRFVVgzTTJ1?=
 =?utf-8?B?R1BWTGw3T0g1dWdHSjRBVUpRSHplempmWTBzZ0lIMXlDQ01tNEx3ZllZUENV?=
 =?utf-8?B?bi80bG42dnRoTTV3YTFKZlBzQXZJNDQ4TkcwbC9JT2NvLzBvQnRBNlhvNDE1?=
 =?utf-8?B?eXVOLytKYnlldEZhSkQweE1xRTNadStwcHVlWkNaK0dMdEpHbUFuU2R0eEhQ?=
 =?utf-8?B?Zjh3UHZ3K2taSWtjc0RRa1NWSFltWDd3UUdmSmwvSE1yL2wvZlhuVkpiWmcz?=
 =?utf-8?B?THIvWXphRnhUdnltUnE1Q29zWjREeGZhWDVqekxiSnZ2SVJ5OEJ2dFJ0RlBY?=
 =?utf-8?B?SEV1TEdrb1NCZTZOYlZ1WFIxYnNwK0FHaXRRMTE0YmFyOUZJMmtJY3lpM1VF?=
 =?utf-8?B?OXpQUzZGeEdSTEczNDFoOU9XR3JpRE9VUmFJMXh1UWQ2RzZ2a3Vlc0NJT1FJ?=
 =?utf-8?B?dlV2SklHWksvNjdCckRPNXhKSmhmTzIxejlZeCtBTzZjdCtaSVdKM2lrMjha?=
 =?utf-8?B?U1pabjhoTXdPdnJtaTNkK21uTTl4MEZrWEhicUVvb0FURHFpRFlkWXZxQjF6?=
 =?utf-8?B?eFBjRzEvWE12L2JndDVTRndxUFVRSThPZkhFdDk2RElWTll4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fd9326-0936-44c2-3e11-08db4af0556e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:33:49.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84z/nnPzj03z73/Cj6ojODkpleCNuLwgg/njzSEDetBbU8X7vNiwZ5kJhyFCP3mTSHOBUQevpv3cNKGOhhLZBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6699

On Tue, May 02, 2023 at 10:27:39AM +0100, Andrew Cooper wrote:
> On 02/05/2023 8:17 am, Jan Beulich wrote:
> > The hook being able to deny access to data for certain domains means
> > that no caller can assume to have a system-wide picture when holding the
> > results.
> >
> > Wouldn't it make sense to permit the function to merely "count" domains?
> > While racy in general (including in its present, "normal" mode of
> > operation), within a tool stack this could be used as long as creation
> > of new domains is suppressed between obtaining the count and then using
> > it.
> 
> This would not be the first example of the XSM hooks being tantamount to
> useless.  I doubt it will be the last either.
> 
> With the rest of Alejandro's series in place, all requests for a single
> domid's worth of info use the domctl, and all requests for all domains
> use the systctl.
> 
> 
> As a result, we can retrofit some sanity and change the meaning of the
> XSM hook here for the sysctl, to mean "can see a systemwide view" (or
> not).  This moves the check out of the loop, and fixes the behaviour.

Don't we still need some kind of loop, as the current getdomaininfo()
XSM hook expects a domain parameter in order to check whether the
caller has permissions over it?

Or we plan to introduce a new hook that reports whether a caller has
permissions over all domains?

Thanks, Roger.

