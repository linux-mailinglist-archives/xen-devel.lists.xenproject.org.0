Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C002D765798
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571194.894474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2tf-0005xt-GH; Thu, 27 Jul 2023 15:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571194.894474; Thu, 27 Jul 2023 15:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2tf-0005vl-Db; Thu, 27 Jul 2023 15:27:23 +0000
Received: by outflank-mailman (input) for mailman id 571194;
 Thu, 27 Jul 2023 15:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhFg=DN=citrix.com=prvs=5656f8b89=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qP2te-0005vb-02
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:27:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e53497-2c92-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:27:20 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2023 11:27:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5833.namprd03.prod.outlook.com (2603:10b6:806:114::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:27:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 15:27:11 +0000
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
X-Inumbo-ID: 12e53497-2c92-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690471640;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0DEsu9ew33VMzjUsHwNJnHOtsQNWIctiYtV4TzYL8X4=;
  b=EvSTfcC/ThJi0esc/Cc+4SLH6onN4lExLEtXskOFUbjUaEI+ycgEuSwt
   yN7xJBbYFAQpKn5lmzU47IfsZe0WBzYFMbaLjGLrPY/1PdbnHO3G1ZB6s
   LGKepD+SkrP3WzjwEG60dAPqWOESWbNBy0NWS89cRUkJ0r8Kys6YPiKpR
   U=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 120294871
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SNM8+Kk3+xBi7cStbdAnrb7o5gxCJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbD2HXM6mNM2r2fItwPI60/E9U757Wz4RqQFA+qCFnEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5gCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c4XDykidSCfvs+zzbWEFNJdqu5/F9a+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03ieexWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuXip6I63wT7Kmo7CyRLTXiCpN2FzW3id+ltB
 Xc20TUnlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+MpC62ETgYKykFfyBsZQ0E6N7nqcctgw7VT9BiOKSogcb4Hz62y
 DePxBXSnJ0WhM8Pkqm+o1bOhmv2ooCTF1FpoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7fWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:dhsCDqB1tj/LNYrlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AUGem9Wu9/Lugbd4meG39q1qC6IsXfVrE42zgP3a?=
 =?us-ascii?q?VDGtud+OueHO6pJh7xp8=3D?=
X-Talos-MUID: 9a23:tPhXYQQqhUKpf8ciRXTvvWx6F/5tx5jpKxwhqqcogOuvKiVJbmI=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="120294871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLtiVSzbP8sS35xO5Tyv5MXfJnpr4tMAafOtvHfuz7Lciv03NxwPROej6zjY+ZQgwFEx36GQVlGV9QZZx2yhUNWr/uCQrVxILH22D8VrJq2YKjyno5a5FDTH/NHkzQFLvDfhYz+BlLXxJh5kNXlJACzh64472LNb9ZmgOhwHZchWsFMS60gdYnuWzqbo7+TN2dYvpBbDM1Q/4CU+XZWCn7bg12NZSBh5sMbB3f+UDeXxnkZ/6QzahxqWmAYprKTEieSPNPRcw50PN7S6Pj2HHm7DFoqYZ2Cz0TWEK2XCPOe69HYQbwJTDS9E9j5JvdXFFDAcbBXkhIXLjIeH4ue/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DEsu9ew33VMzjUsHwNJnHOtsQNWIctiYtV4TzYL8X4=;
 b=oeMXfXVVK9vJIzKuGhyW/QHiZLjsoPdOj84ZOkNCDXBGDLqhyjXrBFGseiwYHObFFXXzsEAyeYcwMk+kZ4tPG6/db4/5Dgsy1XV/Eqc03+dDNrntBEVnX4ym0gIhsjFfAmkfha3hCqKXfn34Gc7zs2NnAG9TnoMqe/rqCNg3WCEbC8NdpnDO2DSH+x2P59no5a8MzNleJxX6yS0dX4UxV24O+r+ublS5jpVuInOPi7mgJ9fh5EfSW4WQsm3zQq2u1nucC6bAd+Ot2Hq0eHo3JQyXvujqwTegO/YFqBpSl2frFSLXIH94ruy7A/GgSZilHDaYcWemuZFisIxzZ0dS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DEsu9ew33VMzjUsHwNJnHOtsQNWIctiYtV4TzYL8X4=;
 b=g8obaqySkcMia733M8kXP1mvYQvLnQ/BLVJuB9SdsHeH0asFSeXK8d6Opru6uksNibBadkkSeufjCH/m95lALKJQvWDrEtxl3XYw1JfLIU90KfrAxhDz/69T/3p76N7Vc3eyDNV8vXsQwMY+mxqjGZ6EoKkEcNuY0iPrHve34AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8bfa8f7d-b2a7-02ac-5fa0-109aa1e8584c@citrix.com>
Date: Thu, 27 Jul 2023 16:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/HVM: drop dead assignments from
 hvmemul_rep_{movs,stos}()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cc95e2-2fc9-473f-e45d-08db8eb5f2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	twQDJ9Hc8Bm2Sy2uoaEpspCiGEXhF7EbF7xCstj6fIDfQJygBr4gVjUjtyn28pheiplNx5E3HIb5tnUyfwN08OEEi3XYgeJZfZ8NSQr5jxEwIRE6kTpkDQDbSK1+YEJO+pZ7/7G9fyYCOxUmuaFYlAO6XF498Ojmja5JepDYZ04/pP1bUXKeM1Bjyn4yqfY6qpO0vEYpEUPO6rFNlAKC9OgUp1wg3g1wa9r1ogXLJf0jAtiLRerWjirDlYnq8TlfFwEseZozxpECHewuywVQMAYuug5Cdh33hwNJYUx4OTS2A1sJf181zW6pEkva2cGK/yYkZWQAXby6Ya246NZxDeV1LXM+lKuD4403S43Ntg1gPZtCgXuLCdiChnf057lu0dcVx6bLLlBXBSXv9ilgT/3eGLMU39PEXzjlDkl6jBJmUY++QWzyMUuPAKPBrxnnGtB14EWvLjiMEo7eUei4XYmHVenzFNKEOWnCFkuXhicCBaciKj7/HSajz7q6G3yDvRy/76QyE9GlTiH2RgZ/XKhgGsmpeJFPurwv1u+YC+3xfT4TCva5XYcD2KRB6Q2YIv1q0HmYAeYJUZEI4/dpV6rIFSgIe/qygIWp70D5vt5pDoueRaCNHQddDIs0wdzE2SiUPGvaYfL/ba2YVXcIgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(4744005)(2906002)(26005)(186003)(6506007)(4326008)(38100700002)(86362001)(2616005)(316002)(53546011)(41300700001)(5660300002)(66946007)(66556008)(66476007)(36756003)(8936002)(8676002)(31696002)(82960400001)(6512007)(54906003)(478600001)(6486002)(6666004)(110136005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRpRXRVcTJOV05YZWdBd1pXOExUdFZpQ3ZDK2hMekhhaUljVXVsakEwbmYv?=
 =?utf-8?B?b014RnNNUTEvRTVuZVFnM3hwWWlzcndKMXdKS3diZVJrdU1aRGp3dG9uVHpN?=
 =?utf-8?B?UWt1a1N0bUw1eld5UFRGVHNlREhNd2tBOCtlcHZjd2M3c2VIOFdWS0s3Z2o0?=
 =?utf-8?B?eXRXeVU5cHgrdEJjVFlOTXdGdVVTQjUydFNsUEhJSWtHeG5GdVZ3SkpGbmtC?=
 =?utf-8?B?dlRMWFNBSzlIWXN0SGMrNkM1VkNzOGw4VlZDNVdySGFnMld6eGZqKytPWjhZ?=
 =?utf-8?B?NFRmS1BPWFRMSkNJaHZjVUlORDIzRE5GS2tBaHJwbjhsYzVhaERRSTc4eTV3?=
 =?utf-8?B?VlpHMHFQVk02bVlzbjY0MkFkMklwdWIramxwRDNwTldFa2tjMGZxaFVGdDRw?=
 =?utf-8?B?ZEtjNzQ1MXFQMzJLbUxsdFIxMkpjNjMxcDE4S3RNZHZWd0NEK3hLcGhQa2FX?=
 =?utf-8?B?MFYzVjJsRTB5VzJ4WmJwNXRDVzJMQ0EzNG5pZURjczlrZXg5UmRRdVYxckx4?=
 =?utf-8?B?NU02NzdIY0d6ZGRVZFJ6QWlpVm53c2pZeVZua3V4MjFvNWgwa1NKNlVHcEhw?=
 =?utf-8?B?UTk1aElqcTE3WFJtUkU3QzQwdUg5Zklpb2pWQ2c3WHdhc1RTRm0yZEhZVitj?=
 =?utf-8?B?VlRwQkpnUmxZUUxrZ0tMc25yWlg0WW0wNnNSSG5vYVpWWVZFTTJvTHBrN1ow?=
 =?utf-8?B?Q2hHK3pINGxBeWFlRGxJYlJhWEF0cVQ5VXE1WGx3UGJkTlhlelFZMUoyTlI5?=
 =?utf-8?B?V1BpNG9seXEzZnZpZ1NLejBrQkNQUExmVEtSQ1lNRlVJVEExZDA3MkRDd2U5?=
 =?utf-8?B?cDZ0aXhkcUNycWF4dGp6ZnBmOCttQ3pyWjEzeEVtYThEYWJjN2dGbmxkNTRh?=
 =?utf-8?B?K2N0cEhuZ3pjZmVRSlVxWmxITGkvajF4WmRHc01sQ2RPc1lhZmprMi9XN0ll?=
 =?utf-8?B?YVFvejhVbmMyazdQNHl3NnR1UUFLUERWc2hVTVFQaEd4a0t2WTF5Sk9lb0FY?=
 =?utf-8?B?cUVSUHlnSUoxYTdLVVp6Rkt5UXJ1OGwwZVlvbnFqcDZNNU0wVGt2NmhvNGF1?=
 =?utf-8?B?MHRqcy9zU0wzRHlhOFFnNm0za2ZqenB4UGdrZkh6L1F6QWU4VnRsVVgxWVh5?=
 =?utf-8?B?KzFWaE02SHAxRk1xL1N6bCtzcVhJR0hSR0RXUURxTDV4WFFOWE5KTFhlcDNQ?=
 =?utf-8?B?UkV3bzBhWEdnM3kyRlg2Z09jMGx1WmdIWExYWmhFTDdFNXI5OThyQUR5VjVh?=
 =?utf-8?B?Skl1OTdtYTU1dExkcUZUd0tSSzBRUXJSMlhvWXpidzZ6UnpvVUpRQ0R1Tjcx?=
 =?utf-8?B?TWtrTzZ1aXlTcExGNlpBZTBpd01jQk5wRmhQRURLaWNXR1pkVGpwejhkdzdw?=
 =?utf-8?B?eG5oN0ErMlFYaVJvQ0Y4enlrNDQ1OE9CTGZzM2Zja09tR2E0SEZMRFpGaGZw?=
 =?utf-8?B?OFhjOGtLSlp1L09hT1d6QXRRVVBCbGlFcnFtMkU5cE5lbm9xOVVwQ3M5MmpP?=
 =?utf-8?B?WEx3cVRDcjNQM2RkbndGQ0c3OGdBMTNmM2E2emYvd1drK1hOdEdPaFI0U25B?=
 =?utf-8?B?UkdiTFpxT2cwNEQzTGtqWk5uQVd1OVZYeTlaeFBRbEZmakptbGNnRzBHK1Zt?=
 =?utf-8?B?TDRFdmIwUkFja2FETGtvMFlqajJLaEI5N2ZMRHQ3M000dGRFTFZUZ29FL2R5?=
 =?utf-8?B?WWZuS1M5WHJwc05RNVR5ell6OXNydjVqakdud2pjNU4zeE00U0podkdoSmxI?=
 =?utf-8?B?MG41eGgwaHcwbm56d3NkVlhIVGVSZDI2aHFZTE1la1FyME93OE1UQmpJWnln?=
 =?utf-8?B?T3k5MlVuWm1aUFZ4dTFCYTVxRFdjVFdPTURzcjdSYlFVUUVLNmdJRThuZ09W?=
 =?utf-8?B?eGtBODVRZGl5YVlYUGRuelBNVUpXUEIvVy9meWlVMno3bnZDL3E2SGFSZkZX?=
 =?utf-8?B?R1Z1N09lN3cxSzU3cS82WnA0TzhEbFprMjAwMHZKS2JyMXNzWUlNWFNnM3Js?=
 =?utf-8?B?cUZ5VkxibVRYaytYVUZBTjB4UmZmZTdDRzJnUWozdGVOWU85dXpSSm1qdlF3?=
 =?utf-8?B?b25XMlFRNDJqem9Fdm1za3dMaUtpMDF2T1loZ0xPWkpGenVwRS9odUs5TFk3?=
 =?utf-8?B?K1VPTEFkbitiSTZjem1Cc2g3eUtSKzdZSTJwdXZOVW5OaWVkU0swU1Jmc3dO?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	51bmfhkuibT2krvsqwBze0HTj3EvnHsWlP8EQ/QQbXec5NvPjfTYMdq1zSYFltx1Cd+J19QaaWHKnRk9LN5qK7Ch0nXhWHcxWVPsM6fpYJ81zKpAlgBuqJgenYUP37XFtCSTv7HkCeKIekcQHvdtSqBz04cbUuru4p4hv7q45wy3CZjShjVOHjEpjao4ICQpChBAAaM4a9kbpE9acWDENW/kDkUPc9KyfsRcXTqlKwEqGto0YT97/hZPiXNkfuwtmPz1qB7a0TyG7EiUDQjySDabo34CsI4WDbscmx3+rfvy1IKGBqVAhbk/1+WQHfJB8H8DA6Uc8H8EL9sDye8R6bIAzcLbIn2kCOnUkMj6OsbB8J0Ki2XKCMjS47t7Et067M6OTQ91ACk666hOy1CDVY3S+NyZ0YwQxzsr1Nyx24YKwfRX9L+YFEEwFSPE5lcnGaXcXFE4YU5jwtIeXk7tQkR7QXdJE0d03PR7ptceMJKuV4FdPpW/W+mEZtvPQJtpDPFTXNw3I7dO+YxOTfJilnjq2ydrnqKmGS/Ark/xtBI/ntMM8a3Bms5nN4codUgdSsqjQnvEoC5WNrTf0glJonqriK72/inBuOdgpRAGWCBgXfOmwnxgUP4KhwFyOAaZXpxz9l88+N8zrFzdxJB4WJqFSw/Y+LUZWBuDgAVdkcEJWZ1ZeeLzRSnF/WCD+xoDgYvVDeWeIoa0g1Ik7pcWtYW1ozk6xX0nc+JzKSpugQl4p2N5/YvzP/I8MlG0i1yBOeCFO6Yvfklqs5uh9ar5zqnt6yZMut8Jbxdtxsnorh7iP6rEuo4vfj58zMi0WPT4tEAqX4BsK7NQsEO0Qg1VbKbzftrbJXq3l+4CNM6FhUA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cc95e2-2fc9-473f-e45d-08db8eb5f2b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:27:11.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yl1nIY1t9tQrjbs53ueUU2SacZToTiIWbLhTS5FtABTR1ffrTKhiw5Vh+hgFPeERIUgLWyE6a5y3D72tSGQE1bVOarnF9Sa+oEDnoq03QMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5833

On 27/07/2023 4:25 pm, Jan Beulich wrote:
> In the latter case the variable altogether is then unused and hence gets
> dropped, eliminating a Misra Rule 5.3 violation. I'm afraid I mistakenly
> introduced both assignments in 57a57465daaf ("x86/HVM: use available
> linear->phys translations in REP MOVS/STOS handling"), likely as a
> result of some re-work on the patch.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

