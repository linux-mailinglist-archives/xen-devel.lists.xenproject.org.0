Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD87574EA4C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561651.878132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9c8-0003vy-TF; Tue, 11 Jul 2023 09:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561651.878132; Tue, 11 Jul 2023 09:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9c8-0003t8-PA; Tue, 11 Jul 2023 09:24:56 +0000
Received: by outflank-mailman (input) for mailman id 561651;
 Tue, 11 Jul 2023 09:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9c6-0003sM-TD
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:24:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c953b4e2-1fcc-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:24:52 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:24:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5920.namprd03.prod.outlook.com (2603:10b6:a03:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:24:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:24:43 +0000
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
X-Inumbo-ID: c953b4e2-1fcc-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2zFSU1NQw4rgon58Pm5xe6yK2q9FL3yuwXrnL/1XCis=;
  b=M2Tkxq0eB/WXGc8sW4P22hWFOMY3nqgbCQTvpenIywr6PaWMDwo8mPxC
   YQYcFrYuTqUCZiNrbEvt6TAB2MXce88tOj0gW+k8SwW/E0VRyMn4LmwxE
   Q1vz0ustyUm4W0JOyPywbkxsfCp9gzFVebhQCMe3OGnJJcuWi0ZEmyJ23
   c=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 115102737
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K+OHratb5/WhONSHINQUDpcIYufnVHJfMUV32f8akzHdYApBsoF/q
 tZmKTuDM/yKYmfze4h/b4vn8h4Bv57Sz4NrGVc5/3xhFy8R+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACHziFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBQI8aky41v6P/7OhTMJvtPYYLNXXBdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAd9LTOfnraECbFu7/UBPVkJRFkCBhLqphF6DUNtce
 1Uqw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnNAybSwn0
 BmOhdyBLT5gqrqOUlqG66yZ6zi1PEAowXQqYCYFSU4A/IPlqYRq1hbXFI87SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:nOu3Hapr9mINGcOHHOIUrJ0aV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-Talos-CUID: 9a23:x/qSQWzN/qUMwajPHLeqBgU5KPEhLkaM0E7vIlW+ImVbeoaVVWOprfY=
X-Talos-MUID: 9a23:BNlR5wbIL1IWoeBTjBOw2m4ld9xSxue+BlAwmpwF69C6DHkl
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115102737"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcDb6quwfOHhdQ0scFD6XCzWRFoLrSYV8QN7s2Nu44SoWB1AYrTA80iRk1IP9LeJhyKVMvZO6DYGblUp7o16WRJR4DIiN/FFHcsIJ9tdP5uTpR2YPqGV1o0BNDzjmv/4UcMaudPdTbqpqMVcdV89PUoh8zARmruWTIAouynI1OQXvK09hrPfw9kbTFUa0lTYpqOopEWfJNXwQhOgnSCqUkOcPbYhArSCACy0D8LLk9SKipSc2qxonHQzQk8FLKAsbOvW+S0xYUk2nCoroCd+K2GgJmP+pMANVxcjVGhXvJyw6Do7+/zajgDygjYRgadKO6lERV8Brp1z/CF5fmMyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRL0W8aP44by/dndi4GGpftsE4Jc9SeBVmoFs1PldXY=;
 b=Wr7C7D/6tMPEeOKS/OdK803ypTQDor88I81a+KK/o7RY1NXMiNSKr2gLGT6uEIpRwWMHyYERiHlYb2DD0x3GgZu4bcywXYHEI+kZIZWA/cvysgVti8KJAwA2SiW/Kdnbzgv9e9wM3u+m0D8UtFLaxqIRtxrptFhXV18wnvTuXD0V8u4weDToRJtrSW+wQuOOkkbGtvfrTUTFsN1Bpy9wKekaI+TvK3kC27xl7MmJ6c9nzUfLnz/mvW0OiGRBm5v7/jNaWJ0BVHxrRBRCVLB9XxEgbkhIx2El6Mr61PXzcJG4uM8DdgswqmdROLosBqs7t5xsDFA8h3uOxZRwk5tulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRL0W8aP44by/dndi4GGpftsE4Jc9SeBVmoFs1PldXY=;
 b=auSghe+nd01hCKif3cAhNWyP9ZiMF0YWwuabA8AV55GrcrAKK3h/9nW4nkQ3JWol2bF7igw6wYdrDKW3pSr/Dk3s0GnzF/z6qGuY5UeAHL8u1velADvcONjcC2wHzm7DUgNjp1lSZLlTFky5sZGOKkMhfNDyQWqY/WBnt6PAWLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/6] libs/guest: introduce support for setting guest MSRs
Date: Tue, 11 Jul 2023 11:22:25 +0200
Message-ID: <20230711092230.15408-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711092230.15408-1-roger.pau@citrix.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0583.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9e8d34-5108-41d8-2cd5-08db81f0a91d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m7sWODGmuyAyrBI+qCnQhoLMMsS5/ULJk9z3KqzS/fZtLsXWEcYKRnLrHf3C/7rgpNQ/cnZy6fEp4rAkrM7lzKp2KPIPVxN3EQjHtXZ0V3NmiQ2oHA1KcCfDBWs3/sjRqbld3gyIEiH+JUC1fBuHTYZ0AA0QpU7SllhdQXDwZuhdlaysZ3iLbpywQd4WdXYlCLckeMoiV0HL6HAwIYBM4dPORpEKjkwWsQA1lv3SC6beZryn8ChJrOSiFZB5YzOJSzaGJ1s+ShzMct3P9mkla3aomjKUxgxMkz5+kiCVke3dJc9giNGAxqLIY7Mlle9zdMoAr7r4zVV69I1XEQRgXt2ucD4q2i630q5/l4xDcPtBgWkEFM4WvaxRiWBA6f+xfCXMsuDpYeF9yTPmlfxKJXUN5TMBZJC3qFGtHNvXnZoTp+limEp1a6+09ctVoEC+a90tg8tgooNWRCdQKHdwYufvznxqYnlLyZe7AJUjBsJujVGu8BbZtxWwp79VGgH4kyK/dXXSkwfUdI6IuhcQCMv2J8fm3ZnlvvJXA4ve2dgxVkOWPxLWZt/oNciscyrn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(54906003)(6486002)(6666004)(478600001)(26005)(6506007)(1076003)(6512007)(66946007)(186003)(2906002)(6916009)(66556008)(41300700001)(66476007)(5660300002)(316002)(4326008)(8936002)(8676002)(82960400001)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktVaFIxd1NSaThSK1NkMHNsVDlJeStFVkZndGJSOEhDOXR2VkVldWc4NCts?=
 =?utf-8?B?bVFsbjdGcVZRbW5EeDdUL2JScXBoYWtNRThkOHFpMGwzVktCWmZBL3ByVHVL?=
 =?utf-8?B?eFVMa09EQS8rMDZKK3dSV2lwN2JGdWx6ZHdHRUduaEFOelN3OWRpNW1tRW95?=
 =?utf-8?B?ZXh3RVB5Ym81eXV1RDVYRnRZR2UrbEQzUjNQMXpzNnhLbk0xbk9wVituOGhz?=
 =?utf-8?B?NS8xaVgzQUtjNStSZVIwOGhkRERqMkZNeitTblRrQzkrV2pEMDlPeENGWTMw?=
 =?utf-8?B?eERGL2MyT2l1cUJVbUNvQkg1UytJRG41YkxGeXZnZWlTQVA0M3gyd29qSFp3?=
 =?utf-8?B?d2N3bStHQVJod3MxYmp1QlBHSy9IUjZ1QXk4b2pnZ3lYWFRJQlA3TTM4YU9Y?=
 =?utf-8?B?eHNYUXdXUUkyL2QrNEpmWjhWQWV0Tzg1RnNMTVQxKzhRZDExMXZkN1h6amVM?=
 =?utf-8?B?aVMxcEJsaERZUkVTSW1kaTFaQlcwMmxaYmd3dkxhSkZiZEZUTFFoSkxQcFhL?=
 =?utf-8?B?YzdaaXRMais1eFhDNlZoS3g3ZVhkVE5maXJ2MEZ4NkxqbmFzZ2Y4R2Y4YWl6?=
 =?utf-8?B?dVRLZkNqR0g0ckp2bVp1c0FkaGN4eW0vbm0zUFZRdkVrcTFiRzRvbVhxczB4?=
 =?utf-8?B?SlU0T2h0RWc0ZlNPUlhkek8rK1FzL0g2eWxMNUNPeWd6b3Q5N1JsUnFaZUVv?=
 =?utf-8?B?a3lPaTFyVFRzam9lQngxN2NmWXk2OVYzWVlUdUhwbWMvaEV3T0NtZ29OdXky?=
 =?utf-8?B?S0ZESUQxTklYakppZlFnbzRmZUY1MmdCcHc3M0N6VENlQXBXRjNRTXZ4dG1P?=
 =?utf-8?B?V3dycTV1NU9iSE80UTBaUjZHb0tvUHppVCtLSG1UMzdTS0I1b3EwWDFSOHoy?=
 =?utf-8?B?TUZvdEszTXIvc0tDM0F1bk1IenpSaWpWc1c0NXhhOFphdXduUWVrWnJMc0Rj?=
 =?utf-8?B?bS83ZVFjWkNBeXVFZlhneVRCWWtPYVpUOG5RNUMvcFNFbGFKV0t1dlZtZGNm?=
 =?utf-8?B?V3JRVjl3TzdwaWdGM0NPV2JUd3hDcXdocjRyTUdSWVcvNWRQUi9ZcjMvWWd6?=
 =?utf-8?B?YVJaUzFiQzd1cnk1ZktYaStiUHhBVU9qbDRXamttSlEwdUVIU0VkK2hVVEJm?=
 =?utf-8?B?cnJUbXNUelJBYitTYUJQY1diOXVkSUFzUDBtaFFWMlhXcUJUM0pBVkgvb3dU?=
 =?utf-8?B?aUxVSFpkc0NTZXA1RUlIQUphZFZuOEZCSW83S2xQRFFDaHlwL0cvTUtxQ2lv?=
 =?utf-8?B?cHR4aDZFYmVsaUtKRHJHdlIyclRUcXNJNXVaMjVLQWlGWG80VGJXbjBZKyty?=
 =?utf-8?B?aEQ0YUg3MnNYVmhUeHZ2MzFYY1d4dlNOYkpVMEp6QXdJVnZjU0xmTDJVa1A2?=
 =?utf-8?B?eW95U1A2TVNvY3dWVFJQcnFpcnk0ckF6N0tHVEY5ZWVZRmNyMTBXRXFka1N6?=
 =?utf-8?B?OGxQN3lLY09wcmI5ajBjWWxKNkJLcUp6K1JLcTlsWG5Ycm00eVpTVmlKa0pR?=
 =?utf-8?B?YnFMc3dOQ3NHZzI0RkZQVENSR0RwSHVsMDJlU3pTTElneVlDSnUzUkIzL29h?=
 =?utf-8?B?RENLWnBRQWl0VDBuRUg5Yk1saXZqdW5pYUtCMGN6MnNFNCtBZ0tiZE5LQW9O?=
 =?utf-8?B?SzAvM09TWVY4YmZOQk9UZTJTV1psc3NralRnTjJ6aHplMCtNcjlaMWxEZVJu?=
 =?utf-8?B?VUtYeGdjUzdBTHJVMzRiUi8yNkpQeHFhakFHSjJ5QjBYQ0hNSWdDL0dsMmRD?=
 =?utf-8?B?eXB4a1g5QjRvR2ZFWGs3Mmdjb3NLWkpMQ0Z6YXExZFp5NmtaV3BUdHFRQnJ0?=
 =?utf-8?B?eDY3VG9rSEpLcDRuTENZWmliK1FzYWRaRE1tRFpqazNIUU5zMzhEY0pic0Vn?=
 =?utf-8?B?WWl2ZVJFVmtaVDZRdnZuOCszV0hNWVd0aTFJUkV5cUprYkZwSkRUM3VxV1BO?=
 =?utf-8?B?M1ZRRlN5eE9ldmY5cS8wdGF1YXI4Qi94RXZiUm16bTBFSk1SM1lLWjQwM0E4?=
 =?utf-8?B?QXZjTFc2Tm1iTDNoRmloVzgya1p3Y1g0eTEyOEJvemhkT2NPNVpQN2hQSWUr?=
 =?utf-8?B?T3VHQjAxS3RHcXVtY3Z1OVJJV1Bpemx5TUFqVHRZdEhyWFN3T3Q4RmxNeGI5?=
 =?utf-8?B?eGY5UHh4NTZwT2RDcm9oVlNhZU9ZWW13K0JobUFUUnhFdWplYTJ3eUprcVVV?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	STLjD/3PcuBaNZv03aVAx6fzCvk/GpK9axfLOQjkaUQaB4yQ57S5be95qKlfKQCzO5XoKASlrEZOqVedT1vQexDHO8guIA6qiAnCOvmLINA4xCVX47fLF+UQlUiBZdJMqLdiU/jJ2hIv9/GVD9kl0n25wPlWzUv/zu7nYa2f7iQP/BZtC6BhnyTNOnRYYfMXmgUiMfABikpLo5r/H/GOBbEEfTEKTIcCU11cADuR4NVrtweNt7/5f97Hj8LwEp5iNgbPeCmbbaBWKCp7kcqgFekQ0Kzx8SaL1E8/9rR8+aXvHCj6O6TdMoiH+/rcKrsN27iLlzVdHOpzsHNJwf8tBD+oc6Rc2dvo83KM7y8DZ7xdzUzRxepS6r2Cvlwb3hSmLgQJAn+auOyvhBMlZ6ywipg3XYgcMFgybm+apWEoUlw+f+TQj2Je/XL1FSYTH6CKA2R2Jzy7zxbK/M/is2x+o9P6J3t/uCIgp4phPtq2eBVkg9sU8vLxOkhbqRSczb/uKapgALLC5ER0nKVZxBZcYTbFG1eqebMLBAORZIlOop3gNNOyVnCfw5/1uDYlvLr32+5ovfZYOca3g//ykfg+pRraJhsoPwXejWfI4BDa/QmGyRC11mtELlsqevhUZZjLdGwrxLIGBZRmNE5kKq1Ou2SwQeXUXBM+j9HZ2w0H5EtpyIG6EUSE105pari8r5kEkT1+3vtsDDjn5gPrZQie4AAjtMFyEsi8iwmdY9LtLr1VjD9HdwPx93O5+2QU+VxbRRV2Kkw+GIEs/QR5l33DVLWY28gyp3317/P8o5ddCEqTaqYECwQP/ghk1YNsJcYs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9e8d34-5108-41d8-2cd5-08db81f0a91d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:24:43.4983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40qMHV5O72IwD+B6bOpV+id0VvT3LbEIil7uacVmxuwZ/AFWNKBXEvmUuqlM/k4hrloYsBh9FkAqFnH1vOd6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920

Like it's done with CPUID, introduce support for passing MSR values to
xc_cpuid_apply_policy().  The chosen format for expressing MSR policy
data matches the current one used for CPUID.  Note that existing
callers of xc_cpuid_apply_policy() can pass NULL as the value for the
newly introduced 'msr' parameter in order to preserve the same
functionality, and in fact that's done in libxl on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  21 +++-
 tools/libs/guest/xg_cpuid_x86.c | 168 +++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_cpuid.c  |   2 +-
 3 files changed, 187 insertions(+), 4 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index dba33d5d0f39..faec1dd82453 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1822,6 +1822,21 @@ struct xc_xend_cpuid {
     char *policy[4];
 };
 
+/*
+ * MSR policy data.
+ *
+ * The format of the policy string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ */
+struct xc_msr {
+    uint32_t index;
+    char policy[65];
+};
+#define XC_MSR_INPUT_UNUSED 0xffffffffu
+
 /*
  * Make adjustments to the CPUID settings for a domain.
  *
@@ -1833,13 +1848,15 @@ struct xc_xend_cpuid {
  * Either pass a full new @featureset (and @nr_features), or adjust individual
  * features (@pae, @itsc, @nested_virt).
  *
- * Then (optionally) apply legacy XEND overrides (@xend) to the result.
+ * Then (optionally) apply legacy XEND CPUID overrides (@xend) or MSR (@msr)
+ * to the result.
  */
 int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid, bool restore,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
+                          bool nested_virt, const struct xc_xend_cpuid *xend,
+                          const struct xc_msr *msr);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5b035223f4f5..5e5c8124dd74 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -423,10 +423,169 @@ static int xc_cpuid_xend_policy(
     return rc;
 }
 
+static int compare_msr(const void *l, const void *r)
+{
+    const xen_msr_entry_t *lhs = l;
+    const xen_msr_entry_t *rhs = r;
+
+    if ( lhs->idx == rhs->idx )
+        return 0;
+
+    return lhs->idx < rhs->idx ? -1 : 1;
+}
+
+static xen_msr_entry_t *find_msr(
+    xen_msr_entry_t *msrs, unsigned int nr_msrs,
+    uint32_t index)
+{
+    const xen_msr_entry_t key = { .idx = index };
+
+    return bsearch(&key, msrs, nr_msrs, sizeof(*msrs), compare_msr);
+}
+
+
+static int xc_msr_policy(xc_interface *xch, domid_t domid,
+                         const struct xc_msr *msr)
+{
+    int rc;
+    bool hvm;
+    xc_domaininfo_t di;
+    unsigned int nr_leaves, nr_msrs;
+    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    /*
+     * Three full policies.  The host, default for the domain type,
+     * and domain current.
+     */
+    xen_msr_entry_t *host = NULL, *def = NULL, *cur = NULL;
+    unsigned int nr_host, nr_def, nr_cur;
+
+    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
+    {
+        PERROR("Failed to obtain d%d info", domid);
+        rc = -errno;
+        goto fail;
+    }
+    hvm = di.flags & XEN_DOMINF_hvm_guest;
+
+    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        rc = -errno;
+        goto fail;
+    }
+
+    rc = -ENOMEM;
+    if ( (host = calloc(nr_msrs, sizeof(*host))) == NULL ||
+         (def  = calloc(nr_msrs, sizeof(*def)))  == NULL ||
+         (cur  = calloc(nr_msrs, sizeof(*cur)))  == NULL )
+    {
+        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
+        goto fail;
+    }
+
+    /* Get the domain's current policy. */
+    nr_leaves = 0;
+    nr_cur = nr_msrs;
+    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, NULL, &nr_cur, cur);
+    if ( rc )
+    {
+        PERROR("Failed to obtain d%d current policy", domid);
+        rc = -errno;
+        goto fail;
+    }
+
+    /* Get the domain type's default policy. */
+    nr_leaves = 0;
+    nr_def = nr_msrs;
+    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                        : XEN_SYSCTL_cpu_policy_pv_default,
+                               &nr_leaves, NULL, &nr_def, def);
+    if ( rc )
+    {
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        rc = -errno;
+        goto fail;
+    }
+
+    /* Get the host policy. */
+    nr_leaves = 0;
+    nr_host = nr_msrs;
+    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
+                               &nr_leaves, NULL, &nr_host, host);
+    if ( rc )
+    {
+        PERROR("Failed to obtain host policy");
+        rc = -errno;
+        goto fail;
+    }
+
+    for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
+    {
+        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
+        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
+        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
+        unsigned int i;
+
+        if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
+        {
+            ERROR("Missing MSR %#x", msr->index);
+            rc = -ENOENT;
+            goto fail;
+        }
+
+        for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
+        {
+            bool val;
+
+            if ( msr->policy[i] == '1' )
+                val = true;
+            else if ( msr->policy[i] == '0' )
+                val = false;
+            else if ( msr->policy[i] == 'x' )
+                val = test_bit(63 - i, &def_msr->val);
+            else if ( msr->policy[i] == 'k' )
+                val = test_bit(63 - i, &host_msr->val);
+            else
+            {
+                ERROR("Bad character '%c' in policy string '%s'",
+                      msr->policy[i], msr->policy);
+                rc = -EINVAL;
+                goto fail;
+            }
+
+            clear_bit(63 - i, &cur_msr->val);
+            if ( val )
+                set_bit(63 - i, &cur_msr->val);
+        }
+    }
+
+    /* Feed the transformed policy back up to Xen. */
+    rc = xc_set_domain_cpu_policy(xch, domid, 0, NULL, nr_cur, cur,
+                                  &err_leaf, &err_subleaf, &err_msr);
+    if ( rc )
+    {
+        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
+               domid, err_leaf, err_subleaf, err_msr);
+        rc = -errno;
+        goto fail;
+    }
+
+    /* Success! */
+
+ fail:
+    free(cur);
+    free(def);
+    free(host);
+
+    return rc;
+}
+
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *xend,
+                          const struct xc_msr *msr)
 {
     int rc;
     bool hvm;
@@ -663,6 +822,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
         goto out;
 
+    if ( msr )
+    {
+        rc = xc_msr_policy(xch, domid, msr);
+        if ( rc )
+            goto out;
+    }
+
     rc = 0;
 
 out:
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f5ce9f97959c..c96aeb3bce46 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -502,7 +502,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid);
+                              pae, itsc, nested_virt, info->cpuid, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
-- 
2.41.0


