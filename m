Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E40B17933
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 00:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066546.1431728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhc8z-0005Rv-Ec; Thu, 31 Jul 2025 22:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066546.1431728; Thu, 31 Jul 2025 22:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhc8z-0005Pz-B7; Thu, 31 Jul 2025 22:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1066546;
 Thu, 31 Jul 2025 22:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7hc=2M=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1uhc8x-0005Ps-5k
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 22:52:59 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1624e2b6-6e61-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 00:52:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56VMqniU028629; Thu, 31 Jul 2025 18:52:49 -0400
Received: from XCH16-09-11.nos.boeing.com (xch16-09-11.nos.boeing.com
 [144.115.66.160])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56VMqdkd028518
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 31 Jul 2025 18:52:39 -0400
Received: from XCH16-07-10.nos.boeing.com (144.115.66.112) by
 XCH16-09-11.nos.boeing.com (144.115.66.160) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 31 Jul 2025 15:52:38 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-07-10.nos.boeing.com (144.115.66.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Thu, 31 Jul 2025 15:52:38 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.146)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 31 Jul
 2025 15:52:35 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by BN0P110MB1913.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.28; Thu, 31 Jul
 2025 22:52:34 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%4]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 22:52:34 +0000
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
X-Inumbo-ID: 1624e2b6-6e61-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1754002369;
	bh=Imnr+bExWcEYsGtcs8NnabGIosZKPSk6m4iqNnRFPXA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=C/cZBa/JZCWGytRMCaURnzlETdLo/w2K31yp/bx+MIWqnEAC1PA7bI8O9HUP2jQr9
	 je7FJ6xucSBFJn8d95YQJYvtTOH2iBdbaxF8oQ0yoK2EAKhaHGlUJZ9Xtdf9yXsBaW
	 mlDt0/Ig8+GGh4xlnQi+bkWqUO/dZ9D7PorK8Wg7Bjltulxhxc/e92w/fhfaEDIdB+
	 0fBFzgIJbVjyG8JjdfCcc5NRP6sVPCxHkGRQS06/eBL6vGHlbhY5ZETIBlCOYEiu7G
	 FRlbupfYyouJZIvytv4cXFW5+hDR3OVYiJqsL6WKw2QPNl776sPSBIyfMhDxWcVjmA
	 naue5liUBnzAQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=PVbD4t22tq24a2QiruuuOFislR6C2bq11ZPSOvxiHpYROUcHK0FdgDSh38TZv8wh++7u/XbV1ylZByDyonFPFuswXtynNhEC0oZKoIUHqSUX6L0iAntdBsK+Tw0Vl7t3Xmq7WxD5IopepydDMw4/cpHLXxu4I9qzEUphdfnZjU5hiVv4hy4KDrf+vMJLofwqTbbr4X7Z6DdUD6/tvpfUQJT0kaH4VJOLfK93OzyLrOHhfMpxXhDOydUMOUqWhYmCaLX3IcF7D0Kzfo21Eha06/D7sOyz8p1BghCY60XUCTug8F4UOWoz8WCwI/N0wN/xZuiUapg9rRiE8q30mme4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Imnr+bExWcEYsGtcs8NnabGIosZKPSk6m4iqNnRFPXA=;
 b=ClCSkLsHHYsCFexhvt72oiuEGdmioFzDp29q7ypW1ndGLH5YHJbWtHJdeDT4WrTIoC/m+WTkCB+KJmtg6Keu1nQKJRthuqPCZnapQdcusIEhYBSwxdH04U2igmg0og+Ab1uqVeBTS+foOVgOynCs5fP+A7UiYRa49hMJpT9hXrKZu0bdIePvJn4oB1XfAOBTMDyr1ZFFKK+3Ocy7Ds6gQuNb04NMPUop2ZL//lYqPm+tWwhg1pDLOM+yoIa5tNb2FqGh2ppaKFWxssK5NgiadiN77m4xIe9nKRkumCSIBllJDWoWJyq97BD3eBZDblUt6I5wQzQxqekl02qV514Alg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imnr+bExWcEYsGtcs8NnabGIosZKPSk6m4iqNnRFPXA=;
 b=GoUuRFh1Yx/70wQHEwvJieEv6S0SadlUsd3k/noIE3rs6FyL6HOOAncyEXbfVJzjk4dURELsFIy8p/1r6SEKbse/4VfPxpBPtUJAB1Pr6Gd+fCJtpm56ezGcrrv+XAUtkn+duakECmfmkvHuLrBBzK+ZpjRBL9ypY31WWmUZNy4=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Dario Faggioli <dfaggioli@suse.com>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
        "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>,
        Nathan Studer
	<nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>, Juergen Gross <jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>,
        "xen-devel@dornerworks.com" <xen-devel@dornerworks.com>
Subject: RE: [XEN PATCH v4] xen/arinc653: fix delay in the start of major
 frame
Thread-Topic: [XEN PATCH v4] xen/arinc653: fix delay in the start of major
 frame
Thread-Index: AQHb/bnIPb194HVr+k6yT2nNqi2v3rRM33fg
Date: Thu, 31 Jul 2025 22:52:34 +0000
Message-ID: <BN0P110MB2148F944A565E5031260501E9027A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <88a17c994f85270982e03912c9c9db916ca69d4e.1753395268.git.anderson.choi@boeing.com>
	 <69b04328-59a1-4186-837e-19d608054aa7@amd.com>
 <c6ef1aa7fbb4a9e92896f4454682ba0d7bf9cfb3.camel@suse.com>
In-Reply-To: <c6ef1aa7fbb4a9e92896f4454682ba0d7bf9cfb3.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|BN0P110MB1913:EE_
x-ms-office365-filtering-correlation-id: 83434418-288a-4a93-7d6f-08ddd084f08d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RVdxWTB5d2ZvWUMvQUdVblB3ZXU0SUR1K3hQMzV6b0UvZDRqaG8wclltSkJN?=
 =?utf-8?B?eURGS1Y1MUlPNTBDbHpwMk1UdXRscWpDMk85bUpkbDhOYVJyK0dYSXQvY2lH?=
 =?utf-8?B?Z1VjUGdldjB2aW1QajV0eTdWblVyMDFjSlA2WmNJbmFBT2JueDl0YjAzMElT?=
 =?utf-8?B?TjVpbkRpY044am9NR1RqazhKb1NIZGU3TEdvNUpiWFBvR09MR2lUSythQjhn?=
 =?utf-8?B?UU12RnJqSVpwdFNObnhudVNCQ3pUc2E5QmdtSEpJQk5Kbko0Vm96TDBOaTVC?=
 =?utf-8?B?a1VPaGFiODVteHhrNDJrT2pPRmw0K0lDS1c5TWp4Z1kycGJUdlpOcnZNSlBT?=
 =?utf-8?B?RGZ2TXlvSHFTbmZPczAvenE1YkExR2s0NnFMQ3VuNktCY3pFRThSaHB2YmNK?=
 =?utf-8?B?ZXBqdjNCbmxRcmFDWUpKd1FNZUF1NnpTRTgrRjBDa0dvZWpqUG04QnEyTDlS?=
 =?utf-8?B?Y1hTTEhGditXWWJQTVBlV1g4MitwcmJSck9pdVNKTzV3ajB3dzBSUG1rMjRY?=
 =?utf-8?B?anQvWW5icE5CSXBxWFFjRHRvNE56V2ZmYmkwOHAwUEFqaXpHWXdhb1pzUWQ2?=
 =?utf-8?B?SlBEaWk3M0o5QTlKUnF6TnhGbmd2VlZ6Ym4va2kreXB4M3VoUlpYUUViOXdF?=
 =?utf-8?B?a0xBVjQ1QTlFRE1kUkl3Yk8zY0pSS2xNWkt1OHozZEI1REVHU1hGd203ZWFh?=
 =?utf-8?B?MGw0bWpLS1JPNGNGUCtZemw3NXRtRzZJalVVQ05XeWgxQUYzSE1NUmV2Qmpk?=
 =?utf-8?B?TEdDZnQ5WEFjazhYTTVCOGFsck80RDcrNlJOU0FyMXJuSTA5dVpiUGhZK3k1?=
 =?utf-8?B?NkpqK2lvSlRHL21hSFhQL0VRc3FJdFhDTlNnRVZaWXpkNTJIQUxsL2pIL3VW?=
 =?utf-8?B?aGcyencxUHYvU2lrNU5mYXZSdmRHcGxuVnQ0Ym9IY2dVTWtzWHlwbGZOQXRr?=
 =?utf-8?B?S3NFQW1ZRElZQzM4R3JZMjJHNGpCVWtZSHFZODRVaWUxRm9YUzVLUmhLQnNi?=
 =?utf-8?B?MjgxWnM2ZGRiVFNOZGdBdzZGeW5DYmNRMitybGVINis3eHpqL2NvUTN2NDdB?=
 =?utf-8?B?WXljT09ZQUdaMHhGUnlFZDdPRU1wa1p1NHNJSzh4R0VGYitlVGkyTE1ZWWZr?=
 =?utf-8?B?NlJwWlV6OS9iYW9IVW1XZlVCekY1YzI0aVlhUFVvMkJReWFjalJHbXhsODJZ?=
 =?utf-8?B?c3VsN2hsR1UzWU83N1BzbHRSQnkwUzVVOEt6WlVBdmh6NXJZOXBWaWRZK2lI?=
 =?utf-8?B?eFoyaVFaLzhqNnhIWGpDbVkvMCsxRHpBV3E4Y3RqaTExZG5kTkZwcUQ3SGs2?=
 =?utf-8?B?ZFBVbnRMU2lkVDdNeFQvdEhKRC9PRzZZeE54YjYwd3pwUyswZmU2VDl5VnBG?=
 =?utf-8?B?VzNaSG9JdDlwWFJ3YVA1c0dJNk1KWm9pL0R5VVZ5WE5MQTF2Wkk5NXF1OGcr?=
 =?utf-8?B?NWQ1bEYwSnRPUVBmUXRVbHd1eE92WmNwRWNRb1NaSXY4Ky8yVVJ1V0tCRytz?=
 =?utf-8?B?aTBNWkhZbmg5OWpvaWNqMHlqZkNJMmRpRHhjbmVma1RjeVRoY1M5a090dFZF?=
 =?utf-8?B?enRuSDA0cFI4UlRHd2hWVHZ1YTJaTEFiTzg0WVFONXZ2N3BmWFNlZitWNkhK?=
 =?utf-8?B?ZHFYOWF3czExWDJEbCtjZVJzMGdiNTN2L2xRM3Fvamt2cXN2QkZGOCtyRm8r?=
 =?utf-8?B?YzhETWlTZkR6RThna3lyTXdwUHh6UXJNcDRtUEhWRDRMbWgxTWcxM3cvOGVW?=
 =?utf-8?B?R210c2pWTEVGOXM4eUkvSWo4ajRab1MyRnRURG5mTWZHbzg1WUdUdnIwbFZH?=
 =?utf-8?B?K2RiQXo5TVlRTnlNK0tzR3E1US9ReFJhOG9sRGR3RmlwV1B2QnpjSGI5YWs0?=
 =?utf-8?B?dm1wbVNGMk56MDA3QUVTTlcwTFhWZHZqeFhqZzRLdVc0dUUrZzBKNzlxdnpV?=
 =?utf-8?B?ZTA1elgrT3Z1U2l4b0hRMElESVdWeUpqL243UHRFNCtKdXE0Y043TGZUMTBt?=
 =?utf-8?B?SlRoRnJGcFB3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGFJVncyV2p5dXpla3NwSENPV1NMSU9GVmhwOEFTblp4YUdUeTJWWnFyWjcz?=
 =?utf-8?B?b0tydHRnUjlKNGRPR2s3T3VSWCtLSmxwUGt2ZkhTMHhxbkZUQzEvYWk3ZDN4?=
 =?utf-8?B?YmJTNTdqMkVhSjZOMzR1RGhlZGdxSzRrMTJWTEtKMGlpVXBrZFYwcGd5QUlS?=
 =?utf-8?B?dWpud2VDRCtmUU1kK1ozRUdBYktnOWNCckErcEJLZEF6cnpZaGFNSEcvRWF2?=
 =?utf-8?B?OStnU1hkOHFZZ3BmZnNsSEltMndHY0Z6a1Y1YmQwaVZTOHE4R3FnN05HNGdi?=
 =?utf-8?B?bEZ1anpZV0U5cVFHZnY1K0pwaXphOGx2QmtzNUV2a01iVWRmVWhGU3NmWlFa?=
 =?utf-8?B?WkdZTEZTVWFRMDc1SEI0MnVwSFNYNEpUWktianh5Ym9VeE03OUJTY0tNYUF5?=
 =?utf-8?B?MmN0QjRZM2tMQlowd0FmTW5QdEZkcE1nY2lQdlNRcHA1V01yem81dExIRUFp?=
 =?utf-8?B?RGE3b3VLYitPZEd0d2IxR1d6NVB5MnVxSmdyWlg4YVprb0Z4Mmw4ZGsycjlp?=
 =?utf-8?B?cFpuaHdnT2JWQ2JIV3ZNVkptTHBBNzM1OUt4UGJUdnRPSS9OMEZVV2xKQUk3?=
 =?utf-8?B?V2U2ZjdaNFJheTdpVkRaSnF3RnFJNG1VTHZENlgvalNDMWdnQjBzeUVCQmdu?=
 =?utf-8?B?Q3g1dnd3T2RMLzJ0aVJUa3RMVmIzTlpFakNvNU5EZ0hvUHpSN3ZGMTlJMHBl?=
 =?utf-8?B?SUg4aVVqZkc4eE1uQ0RBZW1BYTM3SHlITFAyT3YreUljNXB4M0E1MVdNcCs4?=
 =?utf-8?B?R0RDdmlxWmovbDRWOExobk9rbVRDRHZOMW9JMm9YUW1EbWk2NGJuZnBkUzhr?=
 =?utf-8?B?TzNtdjhsM2o2UUVjWWJ6UU8zU3NGcnJCZ1FmeDN2YkZSeTBqVjZSTmdMT3pI?=
 =?utf-8?B?d3FhWWJPVDNNaVlJSW0xVm5xVmx4RytvamlaVms5RTZUWFZLN3hYVkI5NCtM?=
 =?utf-8?B?ekFXMGNwbmNlZktadEsyMi9SejFxSlpTT2dOc2t3WU5WSFd0dnBCanBZWUt3?=
 =?utf-8?B?WXNGMmpSN05hSHhZckdvRDVjU0ZJc3pncTVIclpIUUUzQW5Ub1lxWGNPQ1Ay?=
 =?utf-8?B?cGs5OFloMnJYTDVzdVlLNTVrSEdLZklQL01sYkRVY2M2d1ltb0dzSXE1dTgv?=
 =?utf-8?B?V1Znb293cDgrbG9uVUk4VEdsSWhqVjRSRC9aSjIwdXBLbVZaNml2c3dkSnBa?=
 =?utf-8?B?eUVNQ2dPbDhyaVJmSjduQlp5NENCWmt6cEN5UzVyWEkvdndLZXdTTnlIL0l3?=
 =?utf-8?B?RkQyZlVWSWFMY0VYQUxKbjR1RFFoK3FBVUg3QUFrbDltVWhWL1lKRDlLYTd5?=
 =?utf-8?B?T1puUlhlRDJGVGg2enhUQStVbEViNHZLN1EvVkdLdDZWQ0NmVTY1dlpYeURP?=
 =?utf-8?B?U0Q3V1N0K3liSFhxRnc3NUFBVmgvTTdPS2NFV2QyUFBDYTBYZG1MWVR2VkpN?=
 =?utf-8?B?ajRpVmMycG9wb1ZzejFKTUhYMXZpQWFXR0EyUUdtUU5lczRPNDh1MzFEZWtr?=
 =?utf-8?B?QU5DY2NXRWlvNFhHSTBsM2JzZDhDTnU0eXBaQjhNQ25iemhidGc1WlU5cjM1?=
 =?utf-8?B?bW9WUzlRSGdaN0xLamFCUVIwbmNzblFuc29lckF2VFNmbktVWmNaQm9KNHdG?=
 =?utf-8?B?V1hNUFNhV1R6UWliSUVhV1lobmFHRWFPYStPY0lOeGZzTFFZRkhveXFWVmF6?=
 =?utf-8?B?UXE5R1RVR2hsNHNOcEFyd1lDbUpOSmRIQUMyeUZvT1JJRnUxdnIveHFrM3hS?=
 =?utf-8?B?SlZnK3JqNnAvVzRocm0rWVNzQlhlR2VmN2dvTytoRDZYL0xFdzB5VUx5SVQz?=
 =?utf-8?B?QTB6L2lhOWNxaytiT2xleGFWK3UvclpUV08xMUNVY0cwc3NXTE1zS1Z5RHNm?=
 =?utf-8?B?RHNwYmx1VlhuZ1UvNDFDSTJaanZ5TWUxSHExRTk3MVYwODZVc3J3RHNDcXly?=
 =?utf-8?B?ZHkrSTdXUjhYZGh4U05KRmZkVmIrOFY2ZkV4UjlUL21hK2FZaTN4cXV2VjFL?=
 =?utf-8?B?TFZxRUFvRERJMTJrZDhrbUduSjZjT3pkRDY0Z1VrQ0xNbDYzNEpEN0Z2TjZw?=
 =?utf-8?Q?5gBVLT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 83434418-288a-4a93-7d6f-08ddd084f08d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 22:52:34.6259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1913
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

RGFyaW8sDQoNCj4gT24gVGh1LCAyMDI1LTA3LTI0IGF0IDIxOjI4IC0wNDAwLCBTdGV3YXJ0IEhp
bGRlYnJhbmQgd3JvdGU6DQo+PiBPbiA3LzI0LzI1IDE4OjMzLCBBbmRlcnNvbiBDaG9pIHdyb3Rl
Og0KPj4+IA0KPj4+IEZpeGVzOiAyMjc4N2YyZTEwN2MgKCJBUklOQyA2NTMgc2NoZWR1bGVyIikN
Cj4+PiBTdWdnZXN0ZWQtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5k
QGFtZC5jb20+DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBOYXRoYW4gU3R1ZGVyIDxuYXRoYW4uc3R1ZGVy
QGRvcm5lcndvcmtzLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnNvbiBDaG9pIDxhbmRl
cnNvbi5jaG9pQGJvZWluZy5jb20+DQo+PiANCj4+IFJldmlld2VkLWJ5OiBTdGV3YXJ0IEhpbGRl
YnJhbmQgPHN0ZXdhcnRAc3Rldy5kaz4NCj4+IA0KPiBPaywgY29vbCwgdGhlcmUgd2VyZSB2ZXJz
aW9ucyBvZiB0aGVzZSBzZXJpZXMgdGhhdCBteSBmaWx0ZXJzIGRpZCANCj4gbWlzcywgYW5kIHRo
YXQncyB3aHkgSSByZXBsaWVkIHRvIHYxLiA6LS8NCj4gDQo+IFdlbGwsIHNjcmF0Y2ggdGhhdCBl
bWFpbCwgYW5kIHNvcnJ5IGZvciB0aGUgbm9pc2UuDQo+IA0KPiBSZWdhcmRzLA0KDQpJIGFwcHJl
Y2lhdGUgeW91ciBmZWVkYmFjay4NCg0KQ291bGQgSSBnZXQgeW91ciBBQ0sgZm9yIHY0IHBhdGNo
IGFzIHdlbGwgYXMgZm9yIHYxPw0KDQpUaGFua3MsDQpBbmRlcnNvbg0KDQoNCg==

