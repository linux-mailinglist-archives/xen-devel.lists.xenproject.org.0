Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490AC578E1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161421.1489374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJX3J-0002IR-VT; Thu, 13 Nov 2025 13:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161421.1489374; Thu, 13 Nov 2025 13:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJX3J-0002G2-So; Thu, 13 Nov 2025 13:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1161421;
 Thu, 13 Nov 2025 13:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJX3I-0002FU-8n
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:07:52 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c241e3f5-c091-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:07:51 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6272.eurprd03.prod.outlook.com (2603:10a6:800:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:07:47 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:07:47 +0000
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
X-Inumbo-ID: c241e3f5-c091-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0QngciImuDokVHLlADAk/d69qypSWbz/L1j6ddfIYAzgP1oQvqd6kecXeWFsFM8uCZ6xl4uvY1GCiNt9Ms+z+PB97us1ZXD+gFOTmh79pyfS3E28UO36bzfGBQcoTp+MXsn5MyHJwuuh0LYLL9/617UOcSbnWQIMmvAsdtUV8AqzEjDCnil1SXV36693u1FL0qcCu7Y0nnSs3H3A71Q43nADdnAF53ioqlXkNNZLxQW95tRUgzAviuKzSBENiyFM85HnCdXwLiVRihRQy/0jjb1Xna2lRXeJVXQdeBLLHNduzQcqLSv4/GzyarMpwKqol5R3RO3iS0aDuzs9dZuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzy8FownzoRAvU99db6E6GX1e7LSO8GhdaElH9T9Me8=;
 b=aqIrAMv8mGb4P5j5Iirmbl93XYGlIjjMgc5Nm6DKzvBrjVcZxVK/tClf1e+h+mxSGITatR1I/9DSM7cFlANAP7zs8u2lpXDTKvguIvF1MiUh1VYXvoTleinaBQibTSzTPOAGiujf2Z2fDysh1sD+WOxAlBjvYVqYsVuuCPE5oeIq5P1Jp01o2OdsSSyQNQUn1bcnzBakwhvqoU1WXkAhNTjyF1o5ThLGdgtVY6BrfQEiRczZ9kGynX+GL7naeB0wheIIG/gCv649+RvdVaoSHGiFzffoovdIn4ZgvoUjoxJDB4vIRcz9F917hdA9TdfmWCX1PEu/Q0GaBeUt3d1EXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzy8FownzoRAvU99db6E6GX1e7LSO8GhdaElH9T9Me8=;
 b=saOQeYDUhCTQfa9MYHx81VROOP1nKShTk/Hsss/OJs7LoxBeAqifPqoRrByRAGpIplDzsZZk0jM+fu7nq+/Y8Ru1GPKzaiKDn8tMu8lXSmPKSI3VBVQcIl5pQCJcfUYdrZqNvPIPHWCbIaUOKW0r2gBzcmMXmqL8w0q34AnNS8FDjxrwxroEiPVp99jffmNQfi+tf91tsHodpkFW3VqSt6y5ZtNmA/rgkne7K+tLRUGGt/DqkkfjfuVdtVS2MjXe/NvMpYhzkuPpxUT9ezA30l9FQ5Qs+xSy+fYgydiZsjSTzBJM6fDo8Uk7KA9nuJbzSgBH0O1waTPoA1azhYJt5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f929a081-4f8a-489f-935c-4ed0656095f0@epam.com>
Date: Thu, 13 Nov 2025 15:07:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/5] x86: hvm: compat: introduce
 vcpu_is_hcall_compat() helper
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-3-grygorii_strashko@epam.com>
 <da0d003e-a593-4b40-ac79-c889a6be683f@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <da0d003e-a593-4b40-ac79-c889a6be683f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI1PR03MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 282ec25e-f60e-4377-1826-08de22b5a409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnNwcGFJRHV5WkppUjdJYi8zRFZ2ejRSVWl2TUUwVmk1WW5URWwxRkxvRzA1?=
 =?utf-8?B?SCt0WFZYb05SZkxrd0xvemllVzFZRXNxMFZxRkRpUm1mMEVucTFRT1ZnbUtl?=
 =?utf-8?B?TWVZV0JPQnJseE5zekRDMEJmUm5DcHhpbGJmR3kwYnlPZVA5T2JMMm9rL2xm?=
 =?utf-8?B?N3kweG15SUlxbE5mdVYreGJPd3R4VmEyOG9xTkpXSGs5VVV4K2lGcU1PUEpM?=
 =?utf-8?B?Q1J5YThmZjRmd2d1TSsyelRhRlBLYkVWV1pJaGVwS0ZENGk4aHc3bEx0bUdm?=
 =?utf-8?B?RXE4Uk1UakNBeFZpUTl5RzIyZjh0dE9ydjNFbkU2bXR5RUQwU1BXalJUUDdw?=
 =?utf-8?B?R0tML1dtcWRVVHJiY3BKYzVoNC92bUc1V3lFZk1pSkx0YWNNUUdkdzFBcXN0?=
 =?utf-8?B?enhmSVZBZEJ4eXl4dmt3VEY3WHd5SlpYa0ZkM0tnUERleHBheVJmVDMvVUNS?=
 =?utf-8?B?VVc3aTZlTG11N3RrSWRzZTEwQlA0TDIyTy9ZVXFWMGpYTkMvdE5ub2ZrKy8w?=
 =?utf-8?B?TGx4WlNWdktDMDJPallqcjlQYzU4b24zWWtkWVhOanhtMXgrY3l6R1d5U1Bo?=
 =?utf-8?B?ZnI5TTM0NDNNWGRQV2VMdE4vMUY1S2FwMXNaaW0rZWJ4VlhhY3o1TTdFM0gv?=
 =?utf-8?B?RWM0cEk2L0RJTkd2MHJJSDBmWXFqb2orYUp1Y2k2SjZOQTVsLzRoc1dTOFU5?=
 =?utf-8?B?YytwbzhoM3pCVUdNd0xtU0dVUFFmMHRUZitGRmFWZzdBT01OUU54T2pUYWFZ?=
 =?utf-8?B?T2xjUGprZUVCVHZRNXNZWGtGOTYraDJlSThvTzEvTWJodHNTcUcvT29oQTZu?=
 =?utf-8?B?aVQxZ3BjMDQ4Z3YxUVZjUnRPZ2hnY0VlMFBxSWlOOVgxQ1JuQjYxcVl5azYy?=
 =?utf-8?B?QVV2R2Z3bnhkUjdSblBHRkg0S2VPVjJXVzJVdmpDdEpoUDVVdlplVUNZRkNn?=
 =?utf-8?B?MWs3Nzh3TzJkWDJHaTQxbUhsT0d3YkJmRG1JejdGTjRxS1VFdkFXd1BLRW80?=
 =?utf-8?B?R0NUak44KzUrWjlyZ2FpRFFvcmd0ay8xVHRnOFdhQk1yZGdCcEMyYVdoU201?=
 =?utf-8?B?ajNDelBxQ2d4ZHk4ZzdrdzB6NzQyKzhBcG1XZEVPbFpaMlduK1pQQW43Wkt4?=
 =?utf-8?B?SzhSUzkwYjU5TjVaUVhxZzIrdElEeFJNakpTZDFmc1VuUGpWd0Y3eE5IeHU1?=
 =?utf-8?B?NGo0eWRuY2owaU45aVZRMlhEa1ZNLzYrN2lPTDhldTlCZG9kRzlLdkZoMndv?=
 =?utf-8?B?Q1RIZm5tOTFXeFZsSFM4K3dLRE1wSGs5U3VncG00dUJYOUlyTnp1VFJpWXU1?=
 =?utf-8?B?K2tlVisxUkYxL2tzQUtVY0xwUXVOMFhqc3FGbVZNTlNQeHVTT3IxWitYNUh5?=
 =?utf-8?B?cmRlUVI3YlBVMHNVVVlLdjBHNkRlemFCSzVBb0lTbjhqRWhHS1FNb3Y2REpt?=
 =?utf-8?B?YllXVjUyVC9qdnV5SnpLOGpqQ2ZsNUtSSHRjd2g0bDhvN0hKM1pIbWk1NGFB?=
 =?utf-8?B?MjlVS2JBYnkrQXhwTmF3UkVGb2s1RW5BYVBmSW43cW1kdEpVMU5WQkkrRVA0?=
 =?utf-8?B?NFE4MjROZFRLbi93WjFUZVA0dEJydEdjVXNPejlRazc1KzEwQWI0aVNxVmJv?=
 =?utf-8?B?Z3hZL0tJVHphZzdkcUJnN1BOUExmYWQwSmsvTmROZlNMKytKQStDbDhhQTRV?=
 =?utf-8?B?Vm52YVRDQUsraEFvOVdiU2svM2s1aVBlZXVMdDRJUVJiaS83RDNwY1oyVzhU?=
 =?utf-8?B?ellHcXhBNXhHQ2JnNVR2cVR0OGxFdE82NHJTNStXY1pzL1Ercnl6aDJtdFYy?=
 =?utf-8?B?QTBWbDJTMno2YVlMZG4yZUsyTHRiSXhSUVRQV1JtbEZIRlVSV2MzTjFYdXNa?=
 =?utf-8?B?YnNOL0pKWWVuNGxabk9YNEZPY0NUOHlNcXplS3BEOWJ6QUZjUmF6cXZlUWF5?=
 =?utf-8?Q?CP/k4Jent3ivUO8LvKhvhxB2gOLY8q2k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0ZHckhwQS9NUUt0VEU2b0ZlVWdJUDlUU2RvMitHTndzNG5NRkJkZk9NQW9h?=
 =?utf-8?B?VXFNZEZKbE9MT2VLR0o2cWpKTVNNWXpWclFtRk1tUWZtZG41TjJVYjF5a1VU?=
 =?utf-8?B?ZDlBTVYrT0thTTVwWi9hbnNWSk13YnB0Rkx4K1lkb093bWU5RkMrdi9aWWp5?=
 =?utf-8?B?MTMvMitTc0l4OEgxQnk4Z3RMS3V5K204VUxzVDhGcWRhZ3RtNmlHMVduRVlI?=
 =?utf-8?B?MjVVTGpxOXZNUkhETHlMWFJhOFUxdkd6VjcrMlh6VDlvQlV2aGVacWlwRVQ5?=
 =?utf-8?B?V2pzc2JIQVRkd1NaL1dFN2JDemtVT2ppMXg0WUJGYjBHbzBBazRVajdDc1Yz?=
 =?utf-8?B?eitUUWE0TkpJUmUzZVJwZVd5YVJ5aVEyMEYxSjNMOEdHYU5BWTVaM3VJbkU1?=
 =?utf-8?B?RjdNeldHZEcrRmJxNm5aOEZVcnhVZTJhMVYvTXlQVXllUU1xRjNVaHYvYk0w?=
 =?utf-8?B?ZG1yc1ZqbGpFOElGTHlUcWFuZjFrb05rdmFwcFVsajM0UlF0Q2xZRWdkeFlO?=
 =?utf-8?B?QkFYL0ZpTTcyMG5KQk5rb1JzaUdYdnQvelFXTDVrQzV5Z0NoaWZxV3VHNk1o?=
 =?utf-8?B?YXhGVmMxM1FZV0xUNW5XdEtLblpScnJQcTdNQ00raXpEZm9NUCtVMTJCVEtI?=
 =?utf-8?B?eW5RK0pmNHNuQjU3QVU2Y2pqdHB4Nk5tSmhwSVlFY2dGaEFzQ1cvNnhUNEFr?=
 =?utf-8?B?Y2xmSEM5cDlHdzI2akN5a09KMkNBRGxySkllc3o0K25kNCtkQ3RtMjBlczFk?=
 =?utf-8?B?T3pkRElhTStOdkZ2OUxiSVJiRHZ3NXZyZkh5RkJnRGtoQXo0RFRBZmQ0ZHhB?=
 =?utf-8?B?RnBMN1NMVUo2WWJXTDFpemN4cXBCeU55TFRaWWI4VU5La2p1SXhuTUhLRUdY?=
 =?utf-8?B?R2dNaFRhd3ZJSXI3NXJON3ZKblBnU05HeHhCRnVKU1JwQXpzSnpmbjdtQ1lj?=
 =?utf-8?B?bHc3NjFnNHBiUlZ4Rk16Nms2RjZLMEF2bFM1c2x0RmpGTmVEeWwvTkUzcVB4?=
 =?utf-8?B?QUx1YjZFWHJpR2pGaDlYU2JkdGQ0TWVhM3JxVXh1MG1oSm9nb0ZtY1pIN0hI?=
 =?utf-8?B?bXRtVmZCc0lIUGZqbzFwQXhwZFMwOERQQ0hBc2pBRkdLY1dCdE9DWkdRL1I0?=
 =?utf-8?B?NTVUMXV2V0dXcHZOY3Bzb2ladml0b2ZFZmpjbGU4dVh2ZHFzaStsZDZ1aVh6?=
 =?utf-8?B?NjNldHFpQU54THNsQ2l2M1dLcjdVUjErSFJRcit3bVhWNWlnWFBMWkVLditZ?=
 =?utf-8?B?OFl6Z0cwdXhkQjZNa05pMFllbGZFNTZRVTl2cUUyQzhJL25hN0pOVjg0TFZM?=
 =?utf-8?B?a2hRdit0U0FxWlErTG5RMTdzU2Q0elo3eUJCQTZJZ1dyM3RjOVpUc1FiOWhE?=
 =?utf-8?B?TVhhVXVTWEU4YkVEcTNyaFY5RWhBZXg2KzdLQ29jeE5CV0tIODI5YUFPcVlv?=
 =?utf-8?B?QjE1M2JMTUhnMXdkQnRTcU1XSHdld0lDcU9TdEY0WDNYODZCd3hyU0VrVzY0?=
 =?utf-8?B?aktiL3FJSU9oSkk1bi91YVlWMGsxc2tkOFpmQW9HZm1SeXhTOXFBM1VVNjNO?=
 =?utf-8?B?V0V4NHl4RlBuY0l3SHdaS1VETy9vOTdiWEt3cWtZOG8vTXJYR0twWXhBSG5r?=
 =?utf-8?B?em0rcSttb0MzOGNUMW5pRU5Qei9vbHphK29MTFBpZWJWMVRhZDNFRFBaYUtL?=
 =?utf-8?B?dzFTRG9yREoyaGNKeUdNTTJ1WkNLSjhhK2RrTG85WUNYbVUwQVR5VktSWWlR?=
 =?utf-8?B?Tk5xNCs0T1duSDczNDNCRkRpbUhMNStnSjFUVGFCdTRsOGduTDN4QmdTaE93?=
 =?utf-8?B?SWwvRGdZK3lsRnhJckViMXhsUjdLNnhEM2VkWVpreStMVHV1dGlFby9zTlBx?=
 =?utf-8?B?ckQ1QnZqSjJzeFBXSndSNEx0cnE0Sk1TQXJld0NUU2FySVE0VmtyUnhXMUdR?=
 =?utf-8?B?a3FiUHJVODlJQTZQK201NXB5dGlzelNzd09EZnlOd1ZTY3UwazhKWHFpcnpP?=
 =?utf-8?B?U0krWkVORXVaT0wrYnlwdGp6ejFKeFdncDk3dlNIOEpkZ0dFOWdaMTV3MFBY?=
 =?utf-8?B?cGNoS24rMUpvTFI5cHF2Z25pM1lpMUliRGpzNmFwWGlKWE51MlUvK0FIdTNW?=
 =?utf-8?B?K1hRWG9oT0VvNXlXUXdlUW9xTk9hQlpzNTk4S1c0M1Q3WlZvcmk1WEd4MHFE?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282ec25e-f60e-4377-1826-08de22b5a409
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:07:47.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6s3kTw6bRwRsZD/CWJUq50a3Q2pxQ/A1YzbDZwOJSyvWYAxNI5wWqkbbXS3yusbBCSGEVIkv1hjaZdvHiZBURKvvWZDK+1/KrzA9IfotkrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6272



On 13.11.25 14:22, Jan Beulich wrote:
> On 11.11.2025 18:54, Grygorii Strashko wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -311,6 +311,15 @@ struct vcpu
>>   #endif
>>   };
>>   
>> +static inline bool vcpu_is_hcall_compat(const struct vcpu *v)
> 
> Does the vcpu_ prefix really buy us much here? The per-vCPU aspect is already
> conveyed by the function parameter, I'd say.

Such annotation makes it clear that operation is performed on struct vcpu object,
which improves readability and code analyze (might help also if somebody will ever
try split sched.h).

For example:

is_hcall_compat(curr) in the code doesn't say too much - need parse code
(or have modern editor which can parse and highlight parameter type for us,
  still need some mouse manipulations:))

vcpu_is_hcall_compat(curr) - is kinda absolutely clear from the first look.
  
> 
> Actually - is a parameter in fact needed? It's always current afaics. (Then,
> if the parameter was to stay for some reason, it would want naming "curr".)

"curr" it be

> 
>> +{
>> +#ifdef CONFIG_COMPAT
>> +    return v->hcall_compat;
> 
> As long as you don't remove the struct field, ...

It is already under
#ifdef CONFIG_COMPAT
     /* A hypercall is using the compat ABI? */
     bool             hcall_compat;
     /* Physical runstate area registered via compat ABI? */
     bool             runstate_guest_area_compat;
#endif

which is the main reason for vcpu_is_hcall_compat() introduction.

> 
>> +#else
>> +    return false;
>> +#endif /* CONFIG_COMPAT */
> 
> ... why not
> 
>      return IS_ENABLED(CONFIG_COMPAT) && v->hcall_compat;


-- 
Best regards,
-grygorii


