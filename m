Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A793B235F5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 20:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079067.1440053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluA1-0005eR-RU; Tue, 12 Aug 2025 18:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079067.1440053; Tue, 12 Aug 2025 18:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluA1-0005bK-OP; Tue, 12 Aug 2025 18:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1079067;
 Tue, 12 Aug 2025 18:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWaV=2Y=oracle.com=lorenzo.stoakes@srs-se1.protection.inumbo.net>)
 id 1uluA0-0005ay-2o
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 18:55:48 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3670e05-77ad-11f0-a328-13f23c93f187;
 Tue, 12 Aug 2025 20:55:46 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDC2om007903;
 Tue, 12 Aug 2025 18:55:05 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvwwar8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Aug 2025 18:55:05 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57CITnFQ030176; Tue, 12 Aug 2025 18:55:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48dvsac76a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Aug 2025 18:55:04 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN2PR10MB4176.namprd10.prod.outlook.com (2603:10b6:208:1da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Tue, 12 Aug
 2025 18:55:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 18:55:01 +0000
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
X-Inumbo-ID: f3670e05-77ad-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9o3m+hDy0jvSeDexqUnfcW6wRIyfFj/0HFoaSWjr8UI=; b=
	kZvhc13/LiAwfmo3Ki2Zx5RG3EV8vREsUritDTL5NTf1RjAPlBrAYjGN4NL4Ns6H
	NG8T/IA/5ktGm5vvRn4FooGjQJ/lwIygG1z7i2NyjoAac8KUa4y74Do/N6h9GCZm
	nJgWSPNhdUqIGYRL2n6TLHfZbJch1zU4xOlAWLlh9xllnWMMMHId9Lre8w1HzovI
	qNn1msDySxhSAujHth/4C8hOP3eAYYqEGuV12fvrYFGOAxd0xXuq0H0JTBaeojS1
	My6UR1F82RuWLl82zkDYoZExN2OyLeHrGTtR04hQepuqlbKBLv+kY+LfeP0p/wmH
	0UYc1RsdFy6rQdU8hfCvjQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FD8VMbbenjEOIvYKnCNt3dodOeacLN8NgeUv1JWedgSpc95HAuevkRlutm2BE/o7X+Cxj/D0Z9ERPu7bVJxVcc7Nzigy8neyqJIgK+lNyN459zm05eO1Wj735UrnhQ10oaDLzgVt58vHQUveTx+HBgEWBH1BKKXwo07NCPnozY8/LmNVWpPoyi4Icoxy5mWeLnqD9WYX5tag34zK8WKArl2JiiBCbAl8YPTWjxXQmd8aS1MU+EKrGLEnTQl3nWTjUhknQ3Kk1JIaZtUzb/IW2mM9lcL99mL17+BPiwjs9veq0QWpLZwz7QP1A8+Ho9iLEu73ZsuoIofY52JMfdcJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+gJFQiZ+E5RnyBSVn0fN31nmEjigwLfNZqWfQFLN9g=;
 b=Cnz5TtWdRgZGDrgJe/CEK9neIqTZhT9xn9r+Lug8WMq97FvWSwsL/vtqyWohvlO4xALPw5p/ojIeLkCjyY3nKo8lx6otd7RonO4WVPNZEO8msr+Njlp8Rv03KC6Yu7ihwb+Z0cBdKkKFNaaDzzBY9SGBSRevPTKn/x27UC1YkZX99U7eqYCBxJ+Iu1DAqGTx5DLfkM7A+6xLdwX/seTthVhwzDKQnARpE4KgJh1WquHh2sf+6c3vGFvTtmM88hNCTa6+r5VqaO88dqTxBi0rSmePjLx2zL/pg2im2+idV3YFMnjpiCbkWL1O6pIA4QGr0bx1DmdDtpHLK1e8tdnyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+gJFQiZ+E5RnyBSVn0fN31nmEjigwLfNZqWfQFLN9g=;
 b=aPm3POkbg6sq+wIRgx1p3xwePpKyGFmsh6abPpRYWiZgIzufJ1Yg/aXXPC4r6d3hHjHtZK5U0o9gT3b0E8D1m8HoMBXdaMh5u/U94M/zCN41GXzeJwnS34xuPZ5vp4jsS1ZToXzd6q2hi+nW3vNepKNYwhQX28n4RpcS6pe0728=
Date: Tue, 12 Aug 2025 19:54:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, xen-devel@lists.xenproject.org,
        linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
        Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level"
 to "struct ptdump_pglevel"
Message-ID: <e97675f8-ba69-464e-982c-8a8bdfbb2547@lucifer.local>
References: <20250811112631.759341-1-david@redhat.com>
 <20250811112631.759341-7-david@redhat.com>
 <dac9e243-33ce-4203-a598-2877cf908cad@lucifer.local>
 <1cc6f739-3891-4cc7-84ac-676fef62c445@csgroup.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cc6f739-3891-4cc7-84ac-676fef62c445@csgroup.eu>
X-ClientProxiedBy: GVZP280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN2PR10MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db15002-cd01-44cb-2479-08ddd9d1bdc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?pK/F8d04J4pXDpnnzFKY3g6RtVFsTagmFg6sjag5QFRWAQtGCNl7XhX/Ao?=
 =?iso-8859-1?Q?AeXyfQvVasbXyy1lCIIw2vxIG9WxTmh1xqrVxq3LF1sOjPCZBFeXrM5oQF?=
 =?iso-8859-1?Q?XYyorhDFCncaU4/a+aDlj2Hd6U2XRWlgYNHChFtKg41rDR6GFHmPPXAPXH?=
 =?iso-8859-1?Q?WqRCtSuLmUfXcHL7yyfhrcB9qoolaWjcte3whOwGe8ymuiUpRsrwU4msMo?=
 =?iso-8859-1?Q?cboX5cP5IJD0XVctI/J5fYoUxFi45A/XUkwlM/RVKM0/kGqBq7lQQWpXbT?=
 =?iso-8859-1?Q?0WkGE65V4siXxe57e7dCk2ike7MGtrbz/oN7vUnVxofXJE09Rwv6pK9bZR?=
 =?iso-8859-1?Q?gR4s9IGJLtfbY6DR9jTxnR2wGO15SwlMBcj95hf7mpih9DG86uLc5zK/70?=
 =?iso-8859-1?Q?Gei00F86yx6Oi5vb2mn4rEZm/Z8uxmZAt/l1Mf2WmV/5k9P0rYhjdVk+N3?=
 =?iso-8859-1?Q?XKlkSrNccMqNfPZlab+t3udFr+QuYOpixAe50hyxktIQDdCFljySga+gZj?=
 =?iso-8859-1?Q?2uDxdIWsUugHatAHtgBTA3KVfXfInEK4PRI8eoVoe0Rx+1RI2HLaS69ZNV?=
 =?iso-8859-1?Q?ocsR92Ygp1LjmVRNJW8Pq8T8bxsPGYwbtPWzRQU/e1XtT6b/qkEF5KimyK?=
 =?iso-8859-1?Q?74QEuxyyugfcdEoq8gxm7BMPqNmGtBRSdxXObXm3bCaPjOXsMT0fvyOZgT?=
 =?iso-8859-1?Q?QmmhyuC+VGfShipcmTfJXH3W7U2kxtthqEwdBnASEbpYNGkUC6yVTXiNF1?=
 =?iso-8859-1?Q?j7gLHxqdqIol1NxsPkPefsX+PaApZnnvdUYbFIzwMCmDms5ohsEVj6UJch?=
 =?iso-8859-1?Q?9IkxxLSjsgB1Mqw4DQC6+iVpVFf5WSUk0tn8QCIIEv/zKKvjblFAq7EqEy?=
 =?iso-8859-1?Q?Tl0pfrpJ80ddMhszThG8mg6vDgKRAzEbO2L4s1kK7imuL0/JLfXf0eDum6?=
 =?iso-8859-1?Q?gVf4P6GSHUS9REvubd6PCReZNKrj4KQNGBzxUNuCSEHzGerha3WiUY1PEI?=
 =?iso-8859-1?Q?MbDzLH4/kqCVnViEZoY0WISGvRJqQRA610G78hMZSkljgMB71BHqiAQyXt?=
 =?iso-8859-1?Q?Yqovp9tciOktou0pFo5ezKXkQyAlJStYF/Z+RBACe4RM+lFZ2eURInRrZ8?=
 =?iso-8859-1?Q?yAF+KAKsE94tmKwraggtEHGS2rom2JsMxeJWXm67QiHWrsS9zxuW9s/U3Q?=
 =?iso-8859-1?Q?BAZ6/cTCB5zpryfRjMTXYxKs23+HUafNNftoP2GUbUDw3Bg4F0byFFANQD?=
 =?iso-8859-1?Q?zDUZktktPm1RYQLaNNURwk3Kkho03gclCk+haKwi88I8xhp/bf+3rDPrcM?=
 =?iso-8859-1?Q?bFJXx/+RdYpQJJDyrpmCbJRjguJGqmAYK2CFFyOBBDHsBWyzALw0c9PjP7?=
 =?iso-8859-1?Q?EdHCsYsjUiK6O3/p5A95AeebxymQxSTJKfNFUcbdTblQc1RaXvUM8eQ+OY?=
 =?iso-8859-1?Q?7RIqGq29obmzz5O9ykLS/Ozrol94pNjhO4ZkKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5ri0WIV4MVYcthf2b/aH56YkU61zs4uXplbtqAk2X2bo0mDr/xxYvciwBA?=
 =?iso-8859-1?Q?K88N0MFUTtU59VTkR/Fm1Sw8Tpl502JonKCa3V4QIxfyjani+r1tRvSqP1?=
 =?iso-8859-1?Q?jPiPZVoWS/hFnm2Oi//1FC2VkiEC6PUOgcxJOECk9xvMziGX5TsdaQitZu?=
 =?iso-8859-1?Q?vnq6QrFyKZhCk511fGrEbWyhD8Q5RUdJ08DfC0+RPVBalmDATATCrW4t/t?=
 =?iso-8859-1?Q?72zqPB3SoljM+5grI9a8mmsuJcLDPdq1WfmQET/4egzpwrczHrsyszySBu?=
 =?iso-8859-1?Q?x/EvZwI/sVjspUTS2UI6g9f5QD5Ne2GwpF4cmF7yfFeFCxeGgRouhrCudO?=
 =?iso-8859-1?Q?Ev45kTbDYnYvlfNaKAXjz53Xajir6Md6BbipsHWNn4nxdCh6Y3nTEuQFkk?=
 =?iso-8859-1?Q?PnE9ArjalvnpKwqxcTg0iWKz0v3T+tionxDhrFdgju+9rWG0OhWZJApc5L?=
 =?iso-8859-1?Q?hHOu2museWR73tVIHtZo/727ClFTuFd22W/Bth8OkdjYGxeCtyKNOE8AEG?=
 =?iso-8859-1?Q?co8JYwaJR6lRDIYB7HC3bBsPO3OCyCqUn/mgF97Pi79B5p/tWPSwPpiVs5?=
 =?iso-8859-1?Q?NqpCy0Pi4pZQGxDIXptDw6ITdY7qgXb1FNAf+zO7LVA+gEE4uJyiRhivkC?=
 =?iso-8859-1?Q?awpBv7B0itAT6VPp1ONZIntOAOKiztUjeicKMbvaVu2JSKzm0v+ba/nmif?=
 =?iso-8859-1?Q?DStGAbrDiCgNHUw+eYLR6OdBdH/dltpuBqO3kTHzUXpr2xx7osDkh2WM7Z?=
 =?iso-8859-1?Q?pCziaeoULFvSjus6gpzmi9+yDijhkRe8brjbCgpghv/oMEJF+/bOvzJSbr?=
 =?iso-8859-1?Q?K1cjMET/QKwYj9nbyWEr8iO6qALPzLk4H1R6CsRs4J5mNRgVP48vQuMqMY?=
 =?iso-8859-1?Q?WIPWORO/H7kxws2yVs4Hr6YKP/s9AIrsgSRsA82FzWlDBM/MkSo7vb//jb?=
 =?iso-8859-1?Q?/qNzj18aqZ4CfgP1tChcJRyv8Y3EgVA2QJGt3NGqtAM6yS1Orkcpket8Vc?=
 =?iso-8859-1?Q?c6NFfJoTKV9FIgRiAMquRl4y657xoy7b3dVSoCg7WI6wPYON2d5pPwzzzu?=
 =?iso-8859-1?Q?EUeeF03Q4KEh17oqVbuUJjBjVxoh9L35F2fPQWzzlvGf4/8kFT+9yx957D?=
 =?iso-8859-1?Q?E7PixK59tP7shrvUQVd3Bat2cP9ro+xEBmTy0c01KcCX1UAHIMH4f559FC?=
 =?iso-8859-1?Q?Guo0wyRObkuLwYO250Bhfk7y/agwMuF3wJTuQqH8AWHqAu5D29ij4tkasG?=
 =?iso-8859-1?Q?nzEoIF0iqmsUV3VQVuh0xQGyT3U9z0TGMDe726Z+cf18WM5Xk4MVLwOwTl?=
 =?iso-8859-1?Q?Ya02muE8q1wrzZERNtvNCuqiVLA/dR3R/455Z4/oqzTdnQXioeA+2EHF4H?=
 =?iso-8859-1?Q?stvY9GfZocDwu/kGmU4d5h/v2bpPxiQqE5xmX0wqhtd6S4o+OC/WMQfnOp?=
 =?iso-8859-1?Q?bjGlIOkd9UdtPuu2uD9DBUrwwPA+PIPzAyyr3vdVwD9Tfe5bICP8+/FlWP?=
 =?iso-8859-1?Q?K6DXVwdSy937tj6rlT+T6iGqJSje+ME7c5oC7u7l8G41FwrE2WkhG5ppr2?=
 =?iso-8859-1?Q?pSY/YxYY+eAdJzxDiuo46fKtYnvp1OgHjM4ox+8uXPGbV+pL5xnlLw9hZc?=
 =?iso-8859-1?Q?yxiydrIcLNWBBGNuV7wH5/dhpflLOGNnpk26aAlKTLWk5Y8TcAUbTEMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YkOp6p7oMQHjGxG26Mj7aJJ5JTKFW8/2i08RgX0+Nyql8ugJKUFXOaM7gHDHSLVgyykkVf4vKX7cmq+YPQ/47xvPwXa6IWME7W0pI7G/jp0NVzfKLVfh+nUJSHf1URBXHS64NiAodKtmN6g9uhyDs3ggV84iV3gJjtgb7q7J6SRnEVv52FsLPxqOos0Be3kyWxeML82jYWCCKRFlkOYKj/Al55xEAnM5fa4J1gDYZSJHtYHnUkN6aaFNaJQpFjgGwuY03BUXz07W+OGCaVqrn8iUedOgNkz2B2F9nZXXt7+tfs9jDsmC56+CFg6WXNlJrFwLdNyi7tqqc+HLVwBrgd81jnnIOjJGFd3f5cPRvhyCigeVp5WkxpPiumkOX4UgNSF6XGB/otB68wZIkyaNEQQzCZX3KZIS+GhepMZEBC2HwtfbTv12LwE84fqmgaTtqCrqEwBZL8KMeo94v4YYO1Icj+jcOKBHAZbuZVgWW6iceICBCYdpOUBwTHlFkl3EOh/jSnVrtW51O9Q1K6QEijsgSpTzGijyW89k4LVYYr7TUFCfyEz/oBeg3caRG1Tbmg9xASplGFflriWTCiI7/W7Y2HVO8fsXNhBKrhfk4v8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db15002-cd01-44cb-2479-08ddd9d1bdc3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 18:55:01.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCMTOVh0DzMg0apyLK4qYpTXueijZOe8mWb0S9OeFFQhbFZmWm9GL5tdkBpVybDomoCbhl1BPYrhLO3mazzgYjRVEbW9+4T3es3n4sNbFaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120182
X-Proofpoint-GUID: jtbapDGhe7kBe2UIJYykSJmOg6RqggDR
X-Proofpoint-ORIG-GUID: jtbapDGhe7kBe2UIJYykSJmOg6RqggDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE4MSBTYWx0ZWRfXzFpIVB0Xlasv
 r2194optkhSnGj5dNEbtuw0a/BzsM6yLsdkIDxBVgB0E8MwP0VUQCzty6xALZSWkjSa4SII+DwT
 014edRTSUPfCWwrcDZ54wd6LZRVVTo0yau9KpPB4n+floRtcAi8BoybSQnvvWLchODK0GSbLb/k
 S9l7JaJ++8DfJhuCOx051oNTxmQZNZFPAEOC4HaaDIce3j7EWBOVp9mT6VyV98UqDx/6htJOP1b
 PGRNfGayOXVg7+CcTW6xaed3+vHFMEPXufULEx3diVZYCcPZypOuZFibYRHKejcVPfVrpuxU/3z
 jDUl6sS4pa3sSEwUE0y2vdC16MHUezFkeXfT3T6VhXvbwAFcwTwA9Jo+2kkY55wBCvc9Nl1wRpw
 Q17bHsU49D3Q/4PRrNyksuwKOOu9OT9ApXUSLVtCu74bknFB+ixpdy585wAeSBSJplcD3adH
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689b8e09 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=3WaMMtSQ3YATO-fFicEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Tue, Aug 12, 2025 at 08:39:36PM +0200, Christophe Leroy wrote:
> Hi Lorenzo,
>
> Le 12/08/2025 à 20:23, Lorenzo Stoakes a écrit :
> > On Mon, Aug 11, 2025 at 01:26:26PM +0200, David Hildenbrand wrote:
> > > We want to make use of "pgtable_level" for an enum in core-mm. Other
> > > architectures seem to call "struct pgtable_level" either:
> > > * "struct pg_level" when not exposed in a header (riscv, arm)
> > > * "struct ptdump_pg_level" when expose in a header (arm64)
> > >
> > > So let's follow what arm64 does.
> > >
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > This LGTM, but I'm super confused what these are for, they don't seem to be
> > used anywhere? Maybe I'm missing some macro madness, but it seems like dead
> > code anyway?
>
> pg_level[] are used several times in arch/powerpc/mm/ptdump/ptdump.c, for
> instance here:
>
> static void note_page_update_state(struct pg_state *st, unsigned long addr,
> int level, u64 val)
> {
> 	u64 flag = level >= 0 ? val & pg_level[level].mask : 0;
> 	u64 pa = val & PTE_RPN_MASK;
>
> 	st->level = level;
> 	st->current_flags = flag;
> 	st->start_address = addr;
> 	st->start_pa = pa;
>
> 	while (addr >= st->marker[1].start_address) {
> 		st->marker++;
> 		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
> 	}
> }
>

Ahhhh ok so you're _always_ happening to reference a field in the global value,
thereby not referencing the _type_ anywhere but referencing fields of the
global.

Thanks, that clears that up! :)

