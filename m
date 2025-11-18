Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74DC67C27
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164395.1491368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFQq-0006kQ-TK; Tue, 18 Nov 2025 06:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164395.1491368; Tue, 18 Nov 2025 06:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFQq-0006hm-QQ; Tue, 18 Nov 2025 06:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1164395;
 Tue, 18 Nov 2025 06:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+ix=52=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLFQo-0006hg-TO
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:43:14 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9725c79-c449-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 07:43:11 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:43:07 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 06:43:07 +0000
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
X-Inumbo-ID: d9725c79-c449-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIoZXvQ66N538pjU3a/rhQAtAzP7Lq5hDMeTryHVHERnnfI9xOkK2ArvCmp+qB/W17JiSrnPHJBQA3gM2ZHPmScHdQfp3nRTLfrAh6jjBey0Waa/yu3Q3Wt7cerrByqki4vXHqezPivWfQAcTnBB6NR8V3/Ue+dZ9rNiL7Mqsy0KalH8MiIRzqIuGeLfiwZOVSNScfTUTvbQFK1U/y2JGgwKJbz/31EDgF1S79lDffYLKkMlM25CxYwEbrneBcWYNt9e413dJI8MAR+zb+G7wNpo49dEcj4znx8Qz+69O15kRf/XxzEsC/distLhSS9e2YjgHNd4U8iypeGrIFMfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+8L3sl5/RFhUXG/epjIno9MG232mVLOlRSRsgxm9wE=;
 b=s2gXgVXKZPmg/Uh4lro+rCY3dYnwq3cc4HQgxX4PSHrb0yVMpQHlq9H1CNDsIBbtwPLTHGMtm2XoY9kbX/CMX34xo6p7P1RykMbZz9BR89ZO+vGCVz20Wc5juJ5C1t+pCWeNoSwpiM+byrWC3HPEcjfYGXXxddou5oIeSSFdl7tADGplYBW43B1WRfp4zkK435v28mGl0FQd0gxXmeAEVcmUEUuTF0p1WtxUoPKyDecRCwsVrJfXsTbSi6vCvTNQUHj4wj4KGJclbH3yz6AuIJbjlTZsYlpUgEEO4eUlmxH1nfgF2OoFTpqbLwxpL9yrAHTuM+BikHG6M4EAEfBRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+8L3sl5/RFhUXG/epjIno9MG232mVLOlRSRsgxm9wE=;
 b=svoSy1TdspRdWgveFEdhsXwHEhgiY0+W9ZQ0ASiT6WeWo95/JN+Rqjk5RzVx/A3YQwgo3Ff/rZgfk6WlrDNepv98t/N7n9kKNm19J0jZJWfWZ6QiiTcTH8TKsebB/DXXa+mNHezJf8uIY1twv3cCDIaajmuVh12sNWy07HCcpgs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqhC21cJdWa5E25eCgk7enLhrTazScAgB1fVEA=
Date: Tue, 18 Nov 2025 06:43:07 +0000
Message-ID:
 <DM4PR12MB84511357C8F6FB1976244CA0E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-29-Penny.Zheng@amd.com>
 <c18cdb1c-f2b3-4eeb-b064-670c86e19e67@suse.com>
In-Reply-To: <c18cdb1c-f2b3-4eeb-b064-670c86e19e67@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-18T06:29:50.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA0PR12MB7002:EE_
x-ms-office365-filtering-correlation-id: 9849d099-cd6e-43a3-48e5-08de266dbbae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUF2bmdqRnVaU2pGS1B2amhJNE5kTXJyem1qaG8xWkVDcFdYRXNYRytyTHp3?=
 =?utf-8?B?N256RFBySkh2ZklRNDN1RnEzWTluSWNsQmxuMjhsTGNYeGhIaTV6ek1WMzMx?=
 =?utf-8?B?ZzFUNktCS3A2U29DTWZjODhkNi9nTVJwTFNsNW5wMzhxS21VVmZ1dXEweGJQ?=
 =?utf-8?B?dXB0ZUxvS3Ywd2JXUUlDUmtGbGZ3eXBwaGhhcTFHQ250SGhoQlNoUFFndGxQ?=
 =?utf-8?B?eloySlFLWVRRT0wyK2FzYWtrWE5kbGRBM3NIZnhtTkhPSDRnTkt1YjBzVGlT?=
 =?utf-8?B?OVliL2Y0L2J4MVNqZ1JSS3I2S28rdDMzeDNqV0plVnQ2TXdJWURIbWpCbVhV?=
 =?utf-8?B?bHRwa2ZPSHkzU3dRUmFCOFNMc1ZhdU9RYXFudTFycGVrSlcxUFZ6MW5ZdE1O?=
 =?utf-8?B?TmpJZ0VDcWZsZDJIaEFZMWdXK1pHdXNkTUFMeDYweGJFQ240WDliSUpVRU4y?=
 =?utf-8?B?V1pZKzI5ME9RZjVCZm13d2htRHU2V1k2ZUtnUlZ4ZFFkdGFmMnExOTJsUXFJ?=
 =?utf-8?B?NzhOQXVKeVR0Q1A5TzQ3Um5mb05IUGtaMmxlV3NSMkh1L0lUUnI4QUJRWUxT?=
 =?utf-8?B?dmFjWmZTaWdxYmtzOGxBeTNSQUIwZlUzK0J1RXVKME1ucERwMWx3WlNWai9w?=
 =?utf-8?B?S0ZIaWFVRmp6OXhBaHNSYnVDcVNNQWZ4UTZiSk1IVjRSYVF3eXZmWVA0TWRy?=
 =?utf-8?B?NDdIWFZPWjVDKytvbWxyeWVqbU1hcGpnZEpoaml3MUdWRVNJYmxvTnU3Yklm?=
 =?utf-8?B?eHoxT0phZmdzRFhzcnVaU1hDUGFTdk9wV2RNOG55dXkyRGF6eHlpSnV2Z0RZ?=
 =?utf-8?B?UWRFc0NSMkxjTFJzMHAzWno0RTVsNWs3SnNhNXJpc3laYWVyOUpGSGVlRlBX?=
 =?utf-8?B?NmVvUHZ5Ly9tSTVTdTNHS0k4cGhIdkZPM3RaMFFKSitRUEVQQU1BS3A5ZVlp?=
 =?utf-8?B?YTA0UGdkaXZPVEZEK0tTcFVGZ3hueFloZExWOXZJdk8xUTN0VGFsV00wSllx?=
 =?utf-8?B?VWl2ZlNHMlZjVzdSYjZOcS9oYjRRd0IvVXlONjBWYmF6ZVVQZE9RMUpiK3ls?=
 =?utf-8?B?czF0T1VVTTZ3amdpZWtMWnV4TUdGaldrWUtLK2pUQVduZlNzSFdkaHVmU0xP?=
 =?utf-8?B?cXI0NWJlMmFSV2hVREpMSENxWUhZY3dLeEU3SXlTUTVnN1pLOWtvQU95MFR6?=
 =?utf-8?B?Y01vMjZVL0NkNUNwQ0w3Ymt5cFpYcDdibnVIcWJKaU9tOWFraCt1ajVkWmJJ?=
 =?utf-8?B?U2R2L0Q1cnBCK3ozWER4ekMyZ0dkQ242MEdhSUgva2FheHpUMlB0M1NHbmhL?=
 =?utf-8?B?TkdnRXZ4ekh4ekxkSWJjalR5Ny9qVWhra2owaFRVVDA4UmVhNDkzaDl0eUkr?=
 =?utf-8?B?NE9tM0Mxb01DM3Nxb0NCVldORXUzaHU3cGlNMzFSRmIxL3ViMXplNHFEMVJn?=
 =?utf-8?B?T28yMEpzVmYwNW1GemRyNTlRT0d0VmJYQzZYRzJpTHBrVXd6ekRLSytOd1E0?=
 =?utf-8?B?QmQwbEVxYzRpdUFUa1kxa05iVUZXL2dMYVJqYWFTOHFpakI0YTZWOXkwYU03?=
 =?utf-8?B?YjM1SExCU1FGcHpMQkZwbmExSFFVSGN6NmVnK2hLVGZwa250LzFYT3lKajFT?=
 =?utf-8?B?STNyVS85bnh1OElDS0NFaHQ3czl5bTBSdGdVYmpmRzBtYzlnaVhHeXpCcHFT?=
 =?utf-8?B?eFdNWTFoRjJvVzUzSjMzLzQvZXpUdEVnd2ltczgzaEN0RFkzVS9SaWdKZVlR?=
 =?utf-8?B?UHovRGRtdlZFLzRMdHhXTDdqZW9WM3lCcmpyY2I1M09wSktZRFpQR0pNQTZo?=
 =?utf-8?B?UlBDakdCQTJoeGt2RXk0YUkycnZ2MWZiVmFUWXRBOXRmQlRsZy9YSjJsSzc3?=
 =?utf-8?B?ai8zSHMwdWVNby9QOHVyaHNvcWVxbE5RUjRkckVXMnFVeG9MNjc2TE9sYjJI?=
 =?utf-8?B?d3hpRjNHVjJCanRwcWtHQlhqcHVBaGZ4dEVLamd1QTBneUlHUjVQdENMSHd4?=
 =?utf-8?B?bGZET0lSTXdvdWsybG03aTBLVFh4K1BzNkNaenhldm9MYkovUHRiWSs4UHdk?=
 =?utf-8?Q?H7zcnE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXdpVU9vR0RlSUlCYys3ekRYdVBTMCtTRkY2dmpiQm1rTG9IcUY3MDBCM2k0?=
 =?utf-8?B?WGxOWXJUM1NsUVBCNXZQWSt3dWdMNTRpVStRdUxmWjlDYzhPTlUwOTRRVkVa?=
 =?utf-8?B?aG1WZm9nTVdIQTZ1K2lxek1YNWQvOTg2OXF2VFFHc3R6YzVEa0xicXdUREhV?=
 =?utf-8?B?cG1JSHJrUkZRV1JTaFlDVGVXUkVtVkFRWFhBdTJIbE5hTHFSNVl1dlVjdjBk?=
 =?utf-8?B?WDN0VklicnRGdURNVVRRUkdTREFVVCtZKzF4TW5pOXNLOFEzNnR6NDdpLzZ2?=
 =?utf-8?B?WWNnYklPbnJzKzhlUndFaTBOWVMyVm8xem9XQjd1WTZpT2RxeWZVUkxhRHcz?=
 =?utf-8?B?Tzl2Mi9SUk5WbXlvMjR4OG1qb1YxK3JydXB4VGJKVnVzVDR0RXRmdXhEamcy?=
 =?utf-8?B?U1JhMitDMjY1NEEzR1VFSGNZMkVXdDZQaXpSMnNHZElEZzN3S3ViQ0dEZjQv?=
 =?utf-8?B?LzBOQWZkak96WUxZbmxQMkNqY1NWbC82cmVBcXJONE1MVU5XRWMxT1VuNTBR?=
 =?utf-8?B?cFZsR3o5cTAyUlMxVEdmNjE3NUpGZDducFlvWXZwcjZBV29YTCt5VS81eEx6?=
 =?utf-8?B?MEJoSklxczl2ZWFUOUtLZDM0RGNmaXNSWTFvaU51YW1nOUlnSW9McVc4Q2dC?=
 =?utf-8?B?OFZVVlpENlBpdnYwY2tzYWhGY2NoN0xrdmV4bUZEVEdOYXNLam5RaXpxNzJU?=
 =?utf-8?B?eStMWmZLQ1BVa2hBNnNBVnVWd01KVUFwVkpNM2t0VXJJOWZaOUJaQVY4dTg1?=
 =?utf-8?B?OUZhUndpaVlNTXd0WmRGRWFhTmZ6NjJ0TVU2U25zYTdCUThPTE9RbXJFV3Zw?=
 =?utf-8?B?QVg1RDZJZmk2aG95OEV5RWlML21Lb1FnZjNibUF3QXVLUnFWVm5qKzFYWGtl?=
 =?utf-8?B?V0V1ZkhQMlVMY3JXbFFYd2NuMnMwMnUzVTFGRE9HK1VTSkNqK1NzUDdLeHIv?=
 =?utf-8?B?anMvcVdiaFFVTU5venNqb0RDc0ExOTNESzlEY3lHZE1sOHpqZ3ZHRUdaUzhJ?=
 =?utf-8?B?NDdRSXB0aXdyL05UUFdVZGxud2JqYVNnODd1QnVEZnY0d1FENGFpRzBtL0I0?=
 =?utf-8?B?Rm9wTGlncStDdlpmS3lpb25xRFhKSXA4TXVoOVllaXpHZVJMS0h3Ykcyd0ZY?=
 =?utf-8?B?UWU0OVcxNzl2MjlsN214cHgwS0V0Zk5Ka2pLRG1PaThoaHRHU1R1Y2RXa3ox?=
 =?utf-8?B?dUs0ajhFb3JDbG42QWd5dk12YUtwS250aXJMYjU1bERtV1FHaTNqM3hBR0Zs?=
 =?utf-8?B?TGRJMjhoUzR3ZEI0M0c0Mm1iZzZzRUt3OG9RbDcvcmRRakthcUg0bjhKanNY?=
 =?utf-8?B?RWlDMDR6NTAzZDRXNFdQN3BRU3lUVzZoNkdrOUd4RkJldTQrUWg1bTY4a0xh?=
 =?utf-8?B?amk2OTAya1FpUGdyeVNhRlB3ZDJ1Qm9iNEt0UXhXRnpHRnRsbzVHNjMzRUk3?=
 =?utf-8?B?NDYzTFp3QzV2OFlhT1ZPYXhZR0YxRzVPclQ4bldWTkF4VWRjTU56TGh3TENL?=
 =?utf-8?B?QVpQNjdwejFpTzBQck5iSUJ0UWRQQnEwcmlKUUlSMFl6K2IvcmFJY3pTTmIr?=
 =?utf-8?B?MDBuTDdDUlNFY0V6akUzY204a0NZTmEvMmFMUndsMEFVRUpsZFU4RmYwRyti?=
 =?utf-8?B?SHFhK0VMWEtWSmwxbmtFSlBRVXFBWTZsa2JuaXFGN0srMTRCTUlxQmxDYjNw?=
 =?utf-8?B?OGQzWjBtUkRGV0ZmNjRtamIzTGdsQkRvSU1aYmRuWkIvNmZkWm5OVThBSzZi?=
 =?utf-8?B?c2cvMDhTdmk4b09sak0xejhNUWE5bys5OFczYUNPdFl0NEMvNE8rS0lRRFRY?=
 =?utf-8?B?dys4L1M4NkdIemMrQU5BbWZBdXZ1NzI1SnJnVUNBZTZnM3JEd1FiSEsvRFg0?=
 =?utf-8?B?SVYreTNIVFQvbVMwSTBCMHFtRm5ESWdhTFBlcW1HbWd5dmRiL084VTNTWVY2?=
 =?utf-8?B?dHN4dG1wTDh1UFp1VTF2djNWVkFYY1diMHRicTdFYkRRVTlxU00vWVhKdHJE?=
 =?utf-8?B?c29yck1tYmVmbjc5bk5rY096bUVyRVdFelFmNmo0MUlNemJ6SmNEK3NvVWtm?=
 =?utf-8?B?UldqS3ROcFRGdHA3TFRpY2pPM1pEYm1xc0s2Y21ZR1ZnbjRMdWRqMVZkNUwy?=
 =?utf-8?Q?d8VQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9849d099-cd6e-43a3-48e5-08de266dbbae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:43:07.4505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgK12LqMFZwn1H/lFRRiSOWnEDPAsHxM1UHNjubYPB5QVo1W3M5Y0k1Gr2xfPo/8P7PD3jR8ah7LC/BzBs9u/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMwLCAy
MDI1IDk6NDAgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb207IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRo
b255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwg
PE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubw0KPiBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMjgvMjhdIHhlbi9kb21jdGw6IHdyYXAg
Y29tbW9uL2RvbWN0bC5jIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBPbiAx
My4xMC4yMDI1IDEyOjE1LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29tbW9u
L0tjb25maWcNCj4gPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gPiBAQCAtNjQ2LDExICs2
NDYsMTMgQEAgY29uZmlnIFNZU1RFTV9TVVNQRU5EDQo+ID4gICAgICAgSWYgdW5zdXJlLCBzYXkg
Ti4NCj4gPg0KPiA+ICBjb25maWcgTUdNVF9IWVBFUkNBTExTDQo+ID4gLSAgIGRlZl9ib29sIHkN
Cj4gPiArICAgYm9vbCAiRW5hYmxlIHByaXZpbGVnZWQgaHlwZXJjYWxscyBmb3Igc3lzdGVtIG1h
bmFnZW1lbnQiDQo+ID4gICAgIGhlbHANCj4gPiAgICAgICBUaGlzIG9wdGlvbiBzaGFsbCBvbmx5
IGJlIGRpc2FibGVkIG9uIHNvbWUgZG9tMGxlc3Mgc3lzdGVtcywgb3INCj4gPiAgICAgICBQViBz
aGltIG9uIHg4NiwgdG8gcmVkdWNlIFhlbiBmb290cHJpbnQgdmlhIG1hbmFnaW5nIHVubmVzc2Fy
eQ0KPiA+IC0gICAgIGh5cGVyY2FsbHMsIGxpa2Ugc3lzY3RsLCBldGMuDQo+ID4gKyAgICAgaHlw
ZXJjYWxscywgbGlrZSBzeXNjdGwsIGRvbWN0bCwgZXRjLg0KPiA+ICsgICAgIEJlIGNhdXRpb3Vz
IHRvIGRpc2FibGUgaXQsIGFzIHVzZXJzIHdpbGwgZmFjZSBtaXNzaW5nIGEgZmV3IGJhc2ljDQo+
ID4gKyAgICAgaHlwZXJjYWxscyBsaWtlIGxpc3Rkb21haW5zLCBnZXRkb21haW5pbmZvLCBldGMu
DQo+DQo+IFRoaXMgaXMgc3RpbGwgdG9vIGxpdHRsZSwgaW1vLiBGb3Igb25lIEknbSBub3Qgc3Vy
ZSAidXNlcnMiIGlzIHF1aXRlIHRoZSByaWdodCB0ZXJtLiBJJ2Qgc2F5DQo+IGl0J3MgbW9yZSAi
YWRtaW5zIi4gQW5kIHRoZW4sIGFzIG1lbnRpb25lZCwgdGhlcmUgYXJlIGEgZmV3IGRvbWN0bC1z
IHdoaWNoIGFyZQ0KPiB1c2FibGUgYnkgRE1zLiBBaXVpIGRldmljZSBwYXNzLXRocm91Z2ggbWF5
IGFsc28gYmUgaW1wYWN0ZWQsIHdoaWNoIGltbyB3aWxsDQo+IHdhbnQgbWVudGlvbmluZyBoZXJl
IGFzIHdlbGwuIE9yIGVsc2UsIGlmIHRoZXJlIGlzIGFuIGltcGxpY2F0aW9uIHRoYXQgRE1zIGFy
ZW4ndCB0bw0KPiBiZSB1c2VkIHdoZW4gTUdNVF9IWVBFUkNBTExTPW4sIHRoYXQgaXMgd2hhdCB3
b3VsZCB3YW50IGNhbGxpbmcgb3V0Lg0KPg0KDQpIb3cgYWJvdXQNCiINCiAgICAgICAgQmUgY2F1
dGlvdXMgdG8gZGlzYWJsZSBpdCwgYXMgYWRtaW5zIHdpbGwgZmFjZSBtaXNzaW5nIGEgZmV3IGJh
c2ljDQogICAgICAgIGh5cGVyY2FsbHMgbGlrZSBsaXN0ZG9tYWlucywgZ2V0ZG9tYWluaW5mbywg
ZXRjLCBoZW5jZSBsZWFkaW5nIHRvDQogICAgICAgIGhhdmUgYW4gaW1wYWN0IG9uIHhsLWRldmlj
ZS1wYXNzdGhyb3VnaCBhbmQgcmVzdHJpY3RlZCBETS4NCiINCg0KQW5vdGhlciBxdWVzdGlvbiBv
biBQVl9TSElNX0VYQ0xVU0lWRToNCkFmdGVyIFN0ZWZhbm8ncyAiIDZjODBmMGRkMWJiICB4ZW46
IGZpeCByYW5kY29uZmlnIGJ1aWxkIHByb2JsZW1zIGFmdGVyIGludHJvZHVjaW5nIFNZU0NUTCAi
IHJldmVyc2lvbiBwYXRjaCwgYW5kIHRvIGF2b2lkIGluY3VycmluZyByYW5kY29uZmlnIGZhaWx1
cmVzIHRpbGwgdGhlIGxhc3QsIG1heWJlIEkgc2hhbGwgY29tYmluZSBhbGwgUFZfU0hJTV9FWENM
VVNJVkUtcmVsYXRlZCBjaGFuZ2VzIGludG8gYSBuZXcgY29tbWl0IGFuZCBwdXQgaXQgaW4gdGhl
IGxhc3QsIGFmdGVyIG1ha2luZyBNR01UX0hZUEVSQ0FMTFMgb3B0aW9uYWwgYWdhaW4/DQoNCj4g
SmFuDQo=

