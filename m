Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B46E5FF4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 13:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522778.812366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojcX-0007oW-7R; Tue, 18 Apr 2023 11:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522778.812366; Tue, 18 Apr 2023 11:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojcX-0007mM-3i; Tue, 18 Apr 2023 11:35:37 +0000
Received: by outflank-mailman (input) for mailman id 522778;
 Tue, 18 Apr 2023 11:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pojcV-0007mF-Jb
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 11:35:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ab7977-dddd-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 13:35:33 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 07:35:30 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7294.namprd03.prod.outlook.com (2603:10b6:806:2e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 11:35:28 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 11:35:28 +0000
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
X-Inumbo-ID: 20ab7977-dddd-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681817734;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dtjuvncMCJvRtsnOhde/xYDOFU1OLrPXR4zvd2rBA9Y=;
  b=JHSBFz2zjxZS7ALtPlA4TMBWnGny/4rIVOmQqOHr297QRYVTXnx/iYUx
   aviY2w+NbWt/WT6fP9rU+JsbOrW3LpsPLhIVyDYroxeTgaipXmRQk/0UX
   O8yQa66tbS3ZY2BtCvIdCImDUt7JCa3gbpNVfmNseYX0PeshaJQ3ipL+K
   s=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 105842517
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RsxJkaBOmwKWHBVW/x3iw5YqxClBgxIJ4kV8jS/XYbTApGx00zZRm
 jQWDGmDP6qIajSjfoh0PImz/U1XuJfVm4Q1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxt1bLmAf3
 tojAT08dxml29OW5a64Y7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi/82rWSxHyTtIQ6T5bh3dEwhVmvl0s0VyQ5Tn2qruiXlRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vxDCFrmK2YTzSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2hBSfSN9mSfSxloesRmu2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:YohI+6N+lChwP8BcTv6jsMiBIKoaSvp037Dk7TEJdfU1SL3hqy
 nKpp4mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozJyV
X-Talos-CUID: =?us-ascii?q?9a23=3Abzx/NGq+L/xi7Yic2Xt/CP7mUfweXlLcnVz2GGa?=
 =?us-ascii?q?1OH9gbuGkaXqM+4oxxg=3D=3D?=
X-Talos-MUID: 9a23:sj1LNwVyVmag9rTq/GTH3RpNbsJs3/WJLx80vo4gqsaVGzMlbg==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105842517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvIRL90vYBgqZnuhb0wAZLI+byhgGfUmrkmOvs4tLF9wq4Fw1yKrt+dgOFQRIeUxnKhrWefX599i/t3Zypan4XYQ/b8crlQ5IdUTgFe5WoYVK07xITcSIgFhgEAFQBe8MAke/k+Ce/lnl9wkhzLcGn3M4Af6AiY0znB+SmFEsmVV36DGXkgsvoEeDI7DwE+oT1pAXoOgBumdiH9bxlZ6u3LV3C1ZEeEHN7qY3DMgQufGCYU8rv8DSUoDDYKc2J7ikjXGAC+JLF8TdwU/zjGBWuHg8CGWoOlKNvj5HEW10Ps90Z3pwL6BGivLGwhP8Sm9YqTLBwcF7WhCDAOo7YGhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zizeZKoON3GYLMqE9PBEpuYhnikQDbSQHcw9iMR0o0U=;
 b=D3L9qWbb1c0b5Df+Ynxup2rvxOzUWqcxGtVs87oU5ykC3KCf4svPV5O5BCEJAN/gBQC+xQ8VhlmWMjorgVf08ncyJ37OxqDbg3f8IPKQkuj4bOdXv5r101Rq54jRmSZWQeVT6HQCm4Tp66Vas2SZpLXGPZhfs6v2Ipt09cOmcJ5DeacvI1dID5NkQRCAhwc/eLDlAbujlm2gEaEXK6/MKe6mDzUBK0cIpVgKeUUsK7YmdPn8hbsEbK29CXrSC8DFb+YZ4EmrB4JbvFIyzuTvmLmOCFCpkq3vsOLgBa9i0UR5+OUnLVrhHBi72sCI0Vlsu/jzn6aMjhTeVSNZfOOd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zizeZKoON3GYLMqE9PBEpuYhnikQDbSQHcw9iMR0o0U=;
 b=RLdjTwOn2A702kaUMSldA1rC5LJS7236rXI0zbxsXmiiwO33Tz/64cqxjAeEnN5YMDAaGPqxZMjUS10ioXgNrzhQlEGtaxtYPzmSgLpZIrQrzJM3RLLItN/fCs/amF3Wd1TOp3N2bSIC5j4vLmz/Qb7ptmd7WY6zY48S5beK7cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 13:35:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZD6AejXJxQxAyrx1@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
X-ClientProxiedBy: LO2P265CA0243.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee8327a-386b-443f-644a-08db40010210
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycYcvMSfaryZjkLRagzdCOYnMoBs5nc5ciEuB5bWkiUfjYY7l9OpKCjmtk57hXVDVlkC4kBq/zwga65VymhclZaaySCcLF9lchDBkuvYJhkvLSNYPjbzQPj7cybXMWnc1HJfW9X8a85G1rZo5A2twqjpLEBoxK0yQOFDBaJx7+4r65kKgBgHev2KAoSAodkOV88fFvUiJ8oLEkgYc+Gjb826QHMz2DVdlib8gxvR1tUW3yvMfVSgzwQgmKCbPDINIDEzDpVkL64jFjHfu+S1nbYfAd3dx1K46XrWIB8XdsEmHO1RipYUPryUifxccxZkVj4xvhn8Ka/gg8h1hTUnXtFRcUTzI4fZh6XmSTRiitGBF6lnFrDUDmjHXjgSu35k0GfK1w10uyjzaMhb8mJ7cVEcOGJJX0EJ3n5SJx/1bjNi6jVGRZ5tpKzawSqWDdUJw09U6w3YxV5cB+DU+tXiFojq/1azYubXRChdgoViD5+/PhzljcVy92kiv5Az2A+CS4lP3GACX+wJGCzuKQtWlpfoF77xM4x+u3ipo6khDGh1wyAL39khMRlq4n4QpPW8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(85182001)(2906002)(5660300002)(8936002)(8676002)(41300700001)(86362001)(38100700002)(33716001)(478600001)(26005)(6506007)(6512007)(9686003)(54906003)(186003)(6666004)(6486002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(83380400001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHIzSlFvUjBuS3Z1UXpkNXk3SXZBOHc5VGo0bFo4UkNtN25KTE8reUxvUEpJ?=
 =?utf-8?B?SVpGVC9BT0R6VlVTNmRtbkRVUjZqM0xsR3p0bnZlQXMwS0ZMcWx5b0RVMUh6?=
 =?utf-8?B?NWZLUUJJT3JHY3YwUVFRM3FhYUwzQjE1LzNYZ2ZQZ0M3Z2lHZUgydFloVGNL?=
 =?utf-8?B?MUY0azdXYkpySUFJZTV1TFc0bm5IZmRxNzZON1hyVHgwc1hnRFJ1d0tmUVh4?=
 =?utf-8?B?eEl1RFVZdG9vRE4xRWxHcEo5M3B3UVNzc3lTcGdEVTh2aDdvN0F6SzErbFhv?=
 =?utf-8?B?S3JhQ2t6SEQ4MnhSamxYRDBpeWdrQ2QxTHY5KytOd3MyYTN2K2VCM2QrRHFN?=
 =?utf-8?B?T0plQ3lkS1pnV3pxOGlwSFBmVUNGOW9EMU94K2h3bjd3c2pWZUduQjV3MUdu?=
 =?utf-8?B?RUw0eDRCMy93VGQ4bzAzZGpKd2hGLzNWSEhCNkpVSFJPVzZKNDZNSjFsdU9T?=
 =?utf-8?B?TXJYYnE2cTcyMjY1QmF5aVBDVkV1MUdBOHQrMXE3NWhxc0hhWFlWdGVKZTE0?=
 =?utf-8?B?VVBWNFFab1hScElkOVhxRVVqdTVlNjhRc3FwZGZuTmpLM0FLWHBCK3oxNVpR?=
 =?utf-8?B?T1hGL3pxWnBtSVJCWTk0RjloUEJRV2FjUGV5ZkFubHYzWmh4MG9OL3hKaFZj?=
 =?utf-8?B?OHg4N2JRcUdOVElleWgvaUlJSEx6VjJhTmVOeE5QYWlKQmxKMXRDb1VLSnVG?=
 =?utf-8?B?Ull2WERiYmpXdTUwS1VVWmcrVDRHRmRtTVc2cG9SZ0ZnK0YwbzRHVzBURG9K?=
 =?utf-8?B?ZEV6VmFOZThPVmlhYUJmdXo4aGxaTURZWWxaYnBhYm84Yk1YbDgyOE5FcGJI?=
 =?utf-8?B?YkVVeVlwdWp5dDlGMGJzTStPZkFwSWxJRjZEMEZxR1RGdW43ZS96WUp3aVgz?=
 =?utf-8?B?WnNVcWYrU2t5bmdrcGkwdEdjd3NBQ1F4bWtBRC9TU3NNK0wvbThCcXdNaTBR?=
 =?utf-8?B?TzJYU1hkT2FxZmlFQWhuYXhmaVUyRmZEeUNhTUJMNitYUktyK3hKN2NHUFNL?=
 =?utf-8?B?VEtZSE9GTHpHRjVzUk95cmdYUnJlNEtPSC8yekhidlNIQStGblFuc21jTlpP?=
 =?utf-8?B?VHJNdnBVK1lKWUlmQTgvMlBQNDI4K25yN3ZObTNwdHlldmNoVktxNG5tQWEv?=
 =?utf-8?B?M2xkdVZQM2diQXpWS013OXlqS2tIVFA1M1BNN0U1YTlPN1lack5wOHV0Yzlu?=
 =?utf-8?B?NWs0RzZZSjBBZ3BNdTVNa2srL3VIWDdTeE5SOHdsMUhsUkhlUStMbW1xNmtN?=
 =?utf-8?B?b2JOYWF1c0kvWlVDYmFJUTFwSWZSQTU1VkRzV3N0MDFWYndHaWVrbzNXREc0?=
 =?utf-8?B?MjFRSkp4YkdqeC9vc0xnaWxWY25lZFVpWkpxTFB4RTRYSUM0ZEQ0OUNuLy9X?=
 =?utf-8?B?NS9IZW4zVDZXRXhxQU9zaUMrQWxNMG9YU2pZQ2hIdkovVmtydnNoMDBPU1Bn?=
 =?utf-8?B?cWZVMUJaVk5UNy9OSGZ2TEhrOUxibGlDTGE4N0JPWCtjdlRHMGluSzJWQnJI?=
 =?utf-8?B?VWdDOW9DWjFrZG5TYTRNNElTbkxqc1l5TUtLeEFTaVR4S3dFa3liN3ordEYr?=
 =?utf-8?B?WUxYeEpKdjdKSE94MTE3N2xGRmVvSmZqTmRkaFE5UEJvK2NXV0JkNEMwNFB4?=
 =?utf-8?B?c0NLbkFGdWZRZFFRWnJETElUYWR4cGthdnRnOVZleng0OWFwcjRIS1hHZkY1?=
 =?utf-8?B?a3drNnd5NDRnc0NMYWFnN3B6dnQ4cmp6bk5HdmZLU1FWczB3MVN5S0RxRlpZ?=
 =?utf-8?B?WVYrZ01UUGJvU0Y4NldWc25XZnU4SEN4S3RaMU5sU2wyL1VSNjVaQXJEUjV3?=
 =?utf-8?B?WFZocU5rekhMVTI5WnZZYlFkYnBQOUlKc3loLzFRZnBQSDJMZFV3cXBWcnJv?=
 =?utf-8?B?eGhQd2o3V09CQkJ4M1FoUUZhSG5VallUYzk5bmo2N1haS252RElaVlB4aFJo?=
 =?utf-8?B?SnhlM2tzeHpJMC9EaEZFR0xxMFkySUFWcnM1R2REQks3ZWVFSHNvZmJDenNp?=
 =?utf-8?B?Ynd2REthdktXaDlDSnBOcWMxYVh0amk3c2svSlhraXIzMm1BMnAyUHQ1ZDBT?=
 =?utf-8?B?S3U0SHlXYWEvRzU3R3lGMFd4OGQ4QUNIWlp5Q2swNzR6VXFLWUpZZFpmNTBM?=
 =?utf-8?Q?RXBAbAD3V2MKM7u1Oq8F/+TEv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0vwOr8UO+Ys77JPVCQQyWAic8fafosG5W7zyOwxTWckSo1ULsTA3KAEW/l4SxpM13rbZ0QvsVzJKh6SJI5C82oj3dkaQtwtSZln2mBCO2jhRCZEBBdqjpq3x9t1FG66kLT6CzOAQGCPGoCVPrpD3GsGIpSoG6QnGxx5ZWOW2jWZ2+rlJUC0ZtErMdC/0/qShm2S+VKsp4waeppfA/ZQFDYgVaRFrMTgXd/bJJc/W2JVWf5dZnUnXrCyRNp7A8Lfrt8erLNsR3fU6EyDmZeJumz7p1BNeiOi0NULG+fQ6Axw8iX+BhFakyhk6ruJ8bcj2hcsn3qcIX6G//vXsviZ/8JU3eaRbYSoN20JRZ0nnzreoDJ0F72gRMCYsuyDMYC0e7K5ZxHFpjO0R+VvA6MjZs+TvCDdSNVDQmuaFgm6i5p+Eks9M/MuHmk+ApMmGzN7Gp857EfnLHU3TXNoGG4P/SOs3/uAi1CdNVaDeNaeLLEZadAJaUgICdt7jAaJ8pZfQwrhm04QHtCLqztEkOjYFsuKx8YLw0uhkWL9popd71NQSymdQMLgsj7tSFzTS06F4aPf3hW50ZjzKwVVefnFpDaT/k4FwNAnvcQ3TmwJ6E7aQchtclX8FJjczy4ti9+JGP2UFzYE6UFfxUYYDr8CvAqHTC1n4UEP4S+KbqB3UnXjQj9vUmP+dU7Bt/B948w1IcWs2rhJO2BAhNJISTy4nEXDJ0JoBWKFOiKiy/avYfN4AM0O3ZJSEzMGrjGIk3Q4rimFAvH167eu+/3TKLadGj8RXuLiDo72bnA5yJCT+ZwlWs+J639lmESgpWTU2CL6fxFKIrwxolvwOm6cWeKkp+w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee8327a-386b-443f-644a-08db40010210
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 11:35:28.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8uES4anZQPes61FGotcyqG46LHpHRE3pOMjH/6+lyX/ro8fiVtL4bQiFqYe/K9qzVsf+dxG53JSRn5/yQJW5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7294

On Tue, Apr 18, 2023 at 11:24:19AM +0200, Jan Beulich wrote:
> ... in order to also intercept Dom0 accesses through the alias ports.
> 
> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> use the CMOS RTC, because of there being none.
> 
> Note that rtc_init() deliberately uses 16 as the upper loop bound,
> despite probe_cmos_alias() using 8: The higher bound is benign now, but
> would save us touching the code (or, worse, missing to touch it) in case
> the lower one was doubled.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v6: Restore lost "return" in rtc_init(). Convert printk() to dprintk()
>     in probe_cmos_alias(). Correct is_cmos_port() for hwdom.
> v5: Simplify logic in is_cmos_port(). Limit the scope of a local
>     variable. Adjust a comment that's being moved.
> v4: Also conditionally mask top bit for guest index port accesses. Add
>     missing adjustments to rtc_init(). Re-work to avoid recursive
>     read_lock(). Also adjust guest_io_{read,write}(). Re-base.
> v3: Re-base over change to earlier patch.
> v2: Re-base.
> 
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -27,7 +27,7 @@
>  #include <asm/hvm/vpt.h>
>  #include <asm/hvm/io.h>
>  #include <asm/hvm/save.h>
> -#include <asm/current.h>
> +#include <asm/iocap.h>
>  #include <xen/trace.h>
>  #include <public/hvm/params.h>
>  
> @@ -836,9 +836,19 @@ void rtc_init(struct domain *d)
>  
>      if ( !has_vrtc(d) )
>      {
> -        if ( is_hardware_domain(d) )
> -            /* Hardware domain gets mediated access to the physical RTC. */
> -            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> +        unsigned int port;
> +
> +        if ( !is_hardware_domain(d) )
> +            return;
> +
> +        /*
> +         * Hardware domain gets mediated access to the physical RTC/CMOS (of
> +         * course unless we don't use it ourselves, for there being none).
> +         */
> +        for ( port = RTC_PORT(0); port < RTC_PORT(0) + 0x10; port += 2 )
> +            if ( is_cmos_port(port, 2, d) )
> +                register_portio_handler(d, port, 2, hw_rtc_io);
> +
>          return;
>      }
>  
> --- a/xen/arch/x86/include/asm/mc146818rtc.h
> +++ b/xen/arch/x86/include/asm/mc146818rtc.h
> @@ -9,6 +9,10 @@
>  
>  extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
>  
> +struct domain;
> +bool is_cmos_port(unsigned int port, unsigned int bytes,
> +                  const struct domain *d);
> +
>  /**********************************************************************
>   * register summary
>   **********************************************************************/
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -208,7 +208,7 @@ static bool admin_io_okay(unsigned int p
>          return false;
>  
>      /* We also never permit direct access to the RTC/CMOS registers. */

Hm, it's unclear to me whether the comment above would need updating:
we don't allow direct access to the RTC/CMOS registers, but we allow
direct access to the RTC/CMOS ports if there's no device behind.

Thanks, Roger.

