Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B77183DA
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541833.844999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4MEy-0007G5-Mi; Wed, 31 May 2023 13:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541833.844999; Wed, 31 May 2023 13:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4MEy-0007Dl-Jr; Wed, 31 May 2023 13:51:52 +0000
Received: by outflank-mailman (input) for mailman id 541833;
 Wed, 31 May 2023 13:51:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EXUc=BU=citrix.com=prvs=508c705fb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4MEx-0007Df-2f
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:51:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49655887-ffba-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 15:51:49 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 09:51:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7526.namprd03.prod.outlook.com (2603:10b6:a03:555::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Wed, 31 May
 2023 13:51:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 13:51:43 +0000
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
X-Inumbo-ID: 49655887-ffba-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685541109;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2h4XlK8HYoaeCVaLrsxJv6og/ZR8/dUI48YNLG3/YTA=;
  b=Av95/6jcbnH28vb2+YeFD6HxbO72u3T6FLUaZGfmDa3B+1GUhpck5eJd
   Xlqb7aEOIaoMv6jOwMYSj14j/HZNeO+SdrzgzHz5r9wtORDokLiezU3o4
   qs7CKns2PtG35M6oSOHk85t03HW+i8qIpcOt7bot8+IaktZiqwHRH6Ev8
   o=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 111096515
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D2bshaxS4+tewy7dKIJ6t+f5xyrEfRIJ4+MujC+fZmUNrF6WrkUOn
 zcZX2nSafyMNDChLY0ibNiypkgGsMDWmoViSgQ4rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjPqkT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWREr
 t9beClRVEHd2Oz13J+VQfBXov12eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aWxXKlBdtPfFG+3vR73n2rxXBUM0wxX2q5oKCBo3+meM0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH+91aXhTup/8HNVlRsuFSRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:yTK8W6nZOnvR8SIgCNu9CdHzetPpDfIF3DAbv31ZSRFFG/Fwwf
 re5MjzsiWE7Ar5OUtQ/OxpWsG7K080kKQZ3WB/B9uftWXd11dAT7sSj7cKoQeBJ8SkzJ8l6U
 4IScEXY+EYa2IVsS+Q2njaLz9P+ri6GA/Dv5ak85/AJzsaDJ2JTm1Ce2CmLnE=
X-Talos-CUID: 9a23:e1tY1G7zBKVgiMHKo9ss8URPOYN1ayHnnSmPLQykJEhiUYaxcArF
X-Talos-MUID: 9a23:5toshAZg5LK/S+BTvS6ypAlhKIBTsoOkOUIMyK0vitGnKnkl
X-IronPort-AV: E=Sophos;i="6.00,207,1681185600"; 
   d="scan'208";a="111096515"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQpxFcasm35S5OEyvGJUSbimH3/YMLjQeQfYiS+7r+U7JKR07Y4trQdDo0SDa9SNUorj5vexZEx4dq1nQhuXIW/LQs+bbAFYsZ/ISMRrpyXTDotXsi5SDwXvrr+znuIX0s/DlpkWyb/kTkiXxSSMKvR/d6i8wWtXxmawKcEAX4h6sBzvvXGF1NXWjpFczckPpS376tM+Ttt9gXPCEB5nmC5V6hGHD35jADl9PjP6ZGOTyhz6puRejP7WBWW2a5ro3APs1hNlP8qfBOGI7VHgcLetYL7iEpyhFHM6yEe82siUwncKmY6208ATN1mXcqV5hICTSh9Olv8+dm9nB5g1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGzuwmUBRvw2x/Q4kARKrSHOknjdqB2m0jb6FtOd/jA=;
 b=XbtjlT7gwfgvp4RIRyQM6k0hN1SKoH5UcnTFwurdDSAZ+8oh/CipQp1yNERHArVfspvsu68YgAmNQCn/nP/R7AtMGhxmQSnq5VpL1QlRLeMGmoxuWex3tANV8e8W9G+//yof+l06XMIVKBfxH9cDdYG59zWwLLwXpJxLSAHAr5o79X1UfqLW/02XORZI70mD+XmNqKxCPCIfGoXdj8gsemEeelhY5qLIN7ZzB9zp68v1vKtEXLyhd/J2YZzW5X9SfsMrXOPKTvoRb9tBiQdgS6wVz/62tAhQXUqThhK+HMwBrMcQzEVqjYJgtcchT7MCZMMz92DSSgQa6vpDoF+gAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGzuwmUBRvw2x/Q4kARKrSHOknjdqB2m0jb6FtOd/jA=;
 b=uRB1qFeZVVx/S5Kx0pW7B+qBPPn8h9uV/5da7k1xd4hUtmRxXZNT1QdppDnlr1CUlGTePlKENLUHyDHhrbmiL5GFLIaDlsKTpJsllfpkJaHTOEa8AuhHf+wuS0d8qlw1tUmJGWImZMKac0+7mQYRd+wA2Z1o1RGas/+3Kipe0YE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 31 May 2023 15:51:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] vPCI: fix test harness build
Message-ID: <ZHdQ6Qw8vQIZ+s3c@Air-de-Roger>
References: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
 <838c09e5-97ce-2d23-9d42-645a8925217d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <838c09e5-97ce-2d23-9d42-645a8925217d@suse.com>
X-ClientProxiedBy: LO4P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a9653b-61a6-4d4e-c8d0-08db61de2afe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CAN//JaDVWNmCCTpYeyIKqIctYSMDg6lp+no65U60uqwmkBxeKC6rSxo4/HtfaNm6IACkLVWYnsYabqQmfE4lJJ4DvAMF1dR+mh9Uv/BOef/fFR7CNB7x7e0VmqzbOKxevvOWIF3SALT22xHlPZb/sKy+Tu38qnZggoCrv80ulxnu33mFeLC2EtkMfwCT9psBVccJFIigMU6FetrhWLz/3QrF74cK+McUFq+yHpkuSsGGwjz1Gdn+KM8S1clz3o14zouOwdO/UaQdsn9kzzQOam0ED1OIeGmu4pUNOKzmpoG1DXKpmvsLdqf8M/ruxd4QpWlyFfSOPaEn7pjbhuQLJapTP2Lq7LYs8SexjOj/JdbPGVzIkiruF4jZmgK66BtFuIW2zHMMYkHDXmaeZfvW/x+LofBs17lvkkEUeSHUmJVyyqG8irt3gTu9RmPGh0vusLVv3Uy+HafgkeaXj4R4Mxhl4UimSCnySXGYQ6+2udam0v+TCQwQApOx1tww8uV9BuTcoe/L2S/Yrjno/6nVhGBfWVw0xncrSkm8/MbYa+sfm12oFtFFyQGioE14noO1WILkDHJB/Z9/e78SDp4h3BZ0FhfImzov0AFHtZ5zOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(5660300002)(86362001)(83380400001)(33716001)(8936002)(8676002)(2906002)(4744005)(82960400001)(85182001)(38100700002)(6916009)(4326008)(66946007)(316002)(66556008)(66476007)(54906003)(186003)(478600001)(107886003)(9686003)(6506007)(6512007)(26005)(6666004)(41300700001)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aldrTjFmMWJyckVIREF0VGxkNnFvb3VVNyt3Nnhpckw5UWNheU91WkJ5VXdT?=
 =?utf-8?B?MnNLUXh2dzNNK3FpbXRZdkxCM2d5VjIyWmlOdlZCWWNwZlY2S1g1UjlkdU5R?=
 =?utf-8?B?clU3MGpyOGpjdTd5dU1uMmZUMVVtSEZpaWVNbktMUjUwSmpTL3FhR010WFpv?=
 =?utf-8?B?Z25UVmxndVNPWXVrNk12U3ZCN25Yb1pRejNvWmNNck12a1VudkF6YlNYVkRR?=
 =?utf-8?B?TUpqR3lwY2tWOTlDaXpZSWl5UXdEWnNhZmZFeURKeW12S01MVFMvOHRsWEM0?=
 =?utf-8?B?U0NjV2V3STJZRHl5VFVwMkh2M0RuUFJXZWNQU0NwL3VtbGlYcmEvSE5CZU1F?=
 =?utf-8?B?UWJkQ3plaVlBV2tyWEUyOWJnakV4bmd3TDVRUWdyZXRMU0MxdGsvejMrd3NS?=
 =?utf-8?B?UFo5UHpVM3d5VkVpYVNNeElrYUt1dW5ydVZ4dVZFWDZzZmRkMjBQc2pjL1RH?=
 =?utf-8?B?Tmo1dlhXeEhWbnBMT0c5dTkrcHdVVFB4c3d0NDhsTU8xeHc2bFZoSWlUZDZi?=
 =?utf-8?B?aUlHYzVNU29MN05GaFhjRXhiZmN2SHFVVDdiUWJ4N1FFYU1IK1hQYnFLSm0z?=
 =?utf-8?B?b2poUWhSWVc1d25DSjJ3cXR6REFCWUlxOC9TNy9NSkRSbUtud29MMDVmMEZY?=
 =?utf-8?B?MmFEMkNtSlJ0RHRHTWYyZE5Ra2I4VTlZNG8rdXV6eFhoNGd4Q2tGWEpxZzVX?=
 =?utf-8?B?ekVIN1dBVnFQSVl2aUNrSEswZUFnTXZLcGxxMTFHYUlNL3g5dUlCUmlaR2Ji?=
 =?utf-8?B?cjFKdHA1NVlSVWUxbjhmNzhHdGIvZEtvaE83ci83K3RGTXhSQUlRUmpGcVpE?=
 =?utf-8?B?WjI4cUpiblZ1VERUc0R1bmpJRWlOUjlpVExPR0JKVG9NRjcybUtUOTVvZlU3?=
 =?utf-8?B?QUJGYUwvOGg3TEMvOENwaTZxMVN0L3IxRVZxYnVYKzA5WEIxZThPaW9pd1VI?=
 =?utf-8?B?dWQ1SHNLTGlOamJpV1hSV1lTQW9Dc3QrWmQ2V3EvNlhTY2FIaHpxc0xWNU1S?=
 =?utf-8?B?VkJQcnFCRTV1VFJjTUg2SHZHcnQwTU9LU045NEw0QXNQeUwzb2IxQWN4RDBt?=
 =?utf-8?B?L24zLy9vUlJGR1hZME5ZbW9XbzZGbm44Z1J6alZlWjJBWEt3K0x4RHRMOThW?=
 =?utf-8?B?TXQ5NFNJTXRNYzNPQVJMQ2xMeGdQQVBGU2QzM3lpSmo0cE1NS05rODBOSmlO?=
 =?utf-8?B?WVg4Mmp4cTNSWjgzM1FtVitpUzQ0S3kvdDdTR2xGMEZQeU5VK0JkdSt2N1Vz?=
 =?utf-8?B?VlhnbmdOMFdrSlFsQnRpUlRBbE44QjM2OTZxMEp5WFNKV2U4ekR5TEtVaTVj?=
 =?utf-8?B?ZkZpOFlVcnhJSUR2bmU1YjdBWDBZbmZjOC8wODdKZy9KRDhlUUZqcy94dEE5?=
 =?utf-8?B?MXRUOTVTay9wUDZNSWYwSDNyaU43YXJFb3RRaHR2NTlOM0RqQXVDaXFFMW5S?=
 =?utf-8?B?Wk1qWCt5S1M3ZWc2cVVrZDNYMGFyaVlibXhLWkZGYkR4WlgvV0NCY3NoK2NU?=
 =?utf-8?B?azF1VXBkR3BzSGhMMDJGOEVPcm5jQWFHKzVNRlFLOG1RNjNGVkNTcXpWQlZz?=
 =?utf-8?B?bEV2NlFPc1R4Zlp5WGt3U2U1M3M5Nnc5WXpZRWMzUWVDQ0JWUTlKdnhqdDhD?=
 =?utf-8?B?NVZNd3gwU2d1bzJJeTMrUVc4eVozT3pwQjlYaFdpU3VqODhxWEE4clkyWmpm?=
 =?utf-8?B?aEgzamgzUmZhaitrNkFyL0VJRmlpS3lpdlRzd1plOUZHbHJxUlN2ZEl2K0c4?=
 =?utf-8?B?dXN3ZXpGVDZKZGI5S0YvTlN5SnVKZ3VhT0hNQ3NlcUI5eEV1SkI1TVVYMW5i?=
 =?utf-8?B?Y282UnJvS0o1eTJ5dDlHSStQKzBBRzU5VG9jRktnWVVhQzAvaElaK2toZzZt?=
 =?utf-8?B?T1dwQVBsSjhkUWhBdG9DYlljaDdmZXp1aHd5VVRIYStnU3pDeEhYaUlpZEY3?=
 =?utf-8?B?V3FsV2NSUXJMbzk3NVk1Tks1V0t4U2lxOGU1SGVXUkRrTTQyTHNaNGR1d1Ax?=
 =?utf-8?B?NysyZ1VIUnZ0MTNuYkdJUzBSaUVVNHJwUlNmSkZXMm5TVGtIOWtYVVpPTkV1?=
 =?utf-8?B?UkhvVDF2aGxkbXZ5VGlQMllWTlBBYjhZOUZESnZlYjBCaHFCdEJyMVYycHhV?=
 =?utf-8?B?UitRV3J1WUwyQnFiUkdxRGdUQlBZeDRKRUxnZ2RybDYrRzVFd0MzQ2FLQzE2?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3x6S+KUXsvEZmav4Je8nnCJU2gPhVlyzUVkQbrvQNBPcaVO0PMdzcDw/8hcfcDYqOhFnzSRrJaEPg92r2uBC5ow3dDdHUCtAzVgmYbepze/kPwGAfUIw9pRKqTZPiUldpFyZ/4QtwVvAuQWmUhJfnjD9WZqPtHn0kMb/ILhBKshAJIrjH1tya7fKgxpGIehbeYbrvpoU61xxvTZEzLW4RQiJvXN0xnZf94R+9wrg9pGjkUIvWZKYFqSggNm5r2KPh3JgiceJeyEKjgt8jHXOWDpuiOlNHjR1hoQOMYd1mxymqk/X5yg8IDJKRW7svsSqtjBORQBSiY3+cp5pIjyYUqT3iiuui5AsfZT37C+zXacYCqNcWhPj9yLPdjj1ijf8jsjA13SX2K5ouSBUiKkNW1Hch09QGFZEiRMf8QCgFC5Gv2LMvu8HBYSyAJWGd1nEIHG3hEVn4hYde/3XkR3VZiuaTqPkvDb9uSdFKENncm+l6ypfLdZeGPvpZtvl49ZL5nXB0vhdUFAEl6aY6JBluYnIZQXGnx49bUjYJQ8QU9PVEakgiqT1xHbstTyU6xy6zdCAEeepyRy02ztn3+TbjBfqZM1w1j/Bx+t74uvptMGVl9mgG1vfOhYHGRQ32IXWxt2d4KmYNHa991ZPbCSfEFZVW/e6pImFoKtMeJldGNB8S0CVEjBndV3Dii8iYq62yBmgUzSFJMAHEvRbOJoerVrUigpFGEOyFYxQYpKIEgTI89KD0j/BF0GwEmf96TPH9C8+6vPXy8aE6ikBY1jxulnlH3w/vShSQ/Aauufci90jJsA7ljWL60NK7IPl+Bmio64O5TvKfemZ8FxcxCemG0vsitRe/4EG3N6Oiubo+0I=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a9653b-61a6-4d4e-c8d0-08db61de2afe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:51:43.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqTyvEwSpQsSsHSrf8vV96ZQm8osUBpBJmPCf6/nL5NZ2d5eI/tmaCThtNqpj3UsCrzpNXHuF0zVapC5KyzomQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7526

On Wed, May 31, 2023 at 03:19:56PM +0200, Jan Beulich wrote:
> The earlier commit introduced two uses of is_hardware_domain().
> 
> Fixes: 465217b0f872 ("vPCI: account for hidden devices")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

We do rely on the compiler always removing the call to
pci_get_pdev(dom_xen, ...) or AFAICT that would also trigger an error
as there's no definition of dom_xen in this scope.

Thanks, Roger.

