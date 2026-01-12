Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325BD151FE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 20:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200901.1516702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfNtX-0003lC-HF; Mon, 12 Jan 2026 19:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200901.1516702; Mon, 12 Jan 2026 19:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfNtX-0003i5-Dv; Mon, 12 Jan 2026 19:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1200901;
 Mon, 12 Jan 2026 19:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfNtW-0003hu-LX
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 19:48:06 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b67c63e-efef-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 20:48:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5006.namprd03.prod.outlook.com (2603:10b6:208:1a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 19:48:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 19:48:00 +0000
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
X-Inumbo-ID: 9b67c63e-efef-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDst3h3+Z/h9LsRy2Efz2d8g4v+5iKvziF91uw4ycCpMo2nf8eeGBSzil3Jf6JTvcHgYg1Ow+Kmw/6qB2s02XOLV4mgmUxJAZGbnVsSHFM5kdZhB2MATQ8E+Ag2aZrtClrwhT1LL/S+qVACQyQs8P5p4SlxHuTP+a3UMJhON6ZMCvxg9gB6yfdD3y6qsnmXloeBq/7O+ULB2BQ1McHukuCH/lZuFX4NZC4hmfbDPA3p47BcFANudTwf1dlyqUqSwgNbAmTZJVzW7K7Za/c3i5WSj1tlXa1PNNW8d21iBXatWxNKIxDF0rjgRlh7R26eZ+iXt+DlcFCRbQSDzTbjC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGFSLgufLfE9CX6u8fKiIHw+tYINxDcfnClVxMxGJFQ=;
 b=CrItimKwODd+aHnoiR5vSBJWKRzvbLnacMq/1jakaW0Ce6ZnXZcVb3pxhhVX6olf/qhzcp1tiQRt6PDPOEYDBFen8ir8a6GidX5D56l8U6Nm+1367lu8WcV1dTXWSbdL9TPcNNQE2Wcw9QZGbYe+ZROUoz5m0b9SGlb4H9GMpbY6aQMCw3tNzn9qBOIgm4vmU5iQMptyeO2rg5LRZQlkmG9Ds7/UbWOEHhF0l8DSiDiargtvJdaaKhcXd88Y6yojbnIbdLdJOmLtBYUEj+BXH9c98nchuptAAYCy4PMr7wSWnYm/mS4t3Dm0QmBGTZER8pWe9wJ6PMQ556nckBqUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGFSLgufLfE9CX6u8fKiIHw+tYINxDcfnClVxMxGJFQ=;
 b=xZ82i1dzHy9+J7mrAeQdmvGCbNx0rye+RfVh9IL3HvN6W0HiTrr6B9WUfS0hjOn91H0bO4zqYx3iPXOE3is9712vjDLGSkgMnydZNxS3XLLE3XBELxC85T1KLXfuTjZpc+WXWPp4KxQOfafxk7shWDA7l9BkVj/dRhOg9MhL7lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5fb97540-0b29-40b9-ac9b-039a41e30add@citrix.com>
Date: Mon, 12 Jan 2026 19:47:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
 <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a5f03c-79af-4ecb-2fc9-08de52137e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFpIeHo0TnVVZTRxeFFvL2RzSFNaWGtDMm9kbVR2UHRpbmNoVDZJR21FNUtK?=
 =?utf-8?B?Q0FZUlBwYzJRL2dTNG5KSHV0VThqSThHOE9LYUpaRjhHTVJsT0pQUk5Qdi96?=
 =?utf-8?B?ZXZ2ektOdEdOYnExYXl3WVo3b3VlcThPMFcyb3NRWUM4YVM4eUpLenVydmdo?=
 =?utf-8?B?aHc2MUhVRzdZd3k1eWNVbTFYbFplcEsvMHBhR1lJOHowaUNpK0w2U2Q4SHlW?=
 =?utf-8?B?Wmt6R1BPaER0TURMbDNaWWpKblRoSEJOZGo1V2hXVFAwODdNSzRxRXNrcURk?=
 =?utf-8?B?bTlveEFZQVhsYVN1ckRhZlBKZTRsY1B4Y04vR2VRMTVBQ0x3WGZQUWZBUStJ?=
 =?utf-8?B?eWxGRFp0UTIvL2lTRWxZMmdtQkhJczZpRW1zQ1h5eVM3ZTIzY3c0eWRjdFNn?=
 =?utf-8?B?eXEvL0Y3bXhBcmJNTkhLM0RDdEduVVI5TmZsVkJ0czB1UGh2ZXR2TzRmcHNq?=
 =?utf-8?B?QUVIY09EUDNDRVU5ZUxlbW1xZ2hzOHI4OXBhNHBYZzlzRUxxTjViUlRkL2tV?=
 =?utf-8?B?amcrc3RBYzZiWXBrUnpqNStmS2pxTS9uelNybWdrR2kyQ0xHMkpXNzZVTkpI?=
 =?utf-8?B?OWYwZWh3eldEc0hoYnBmSnkzd096WG5tOTN6eExtOEQwNEErVXJkYVBzTEJO?=
 =?utf-8?B?U0hvc1JEc21sd0FPTlJmQThYTXB1SjliekpUdGRrOU9DTmZneHkxbis5VjAy?=
 =?utf-8?B?Tld5QmJZNU1qaFExU1dhVDRZWjVkV1Q1UkVGblhDVUE1c1FCS1hlWlVYRVFI?=
 =?utf-8?B?akVsSDQzeVk2TFN5cjlwb3YwY1FhYXYxQWRTN0lWRVc4SFRTS0Qzb29MNGpq?=
 =?utf-8?B?NnJWOERTdzRMejlwanQyRUgweVZqLzBRWTFiODF5TTU1enUvWjNTVWxHbXJS?=
 =?utf-8?B?ZHdBYW9leVQyWUJwT3dQMVU0M0kwZjNITjdiYmE4RDlSdVgzWHpZZ3h1WmlM?=
 =?utf-8?B?ckpsQi84a3huVXYxSXV1eW55NmY1S0tudDVnL2tVTm93OUE4QW5FUVZQMWUz?=
 =?utf-8?B?eXpTMWVlenNmSzVlZzFKMk5hSklBUmhHcHJUUUZ6SHkzanh0dVFEUVd1QUVr?=
 =?utf-8?B?anhUV0djOW5DdHhUdUhpL2ZtSC9QcHFJakx2N2E2RHNOU0RzOXNnRU5yMHdo?=
 =?utf-8?B?OFA5a0tGUzVFdUZvNVBTc3BkYmp6cmNhMitNSng1T3lESXduZUxUTk1pSldG?=
 =?utf-8?B?NUJvVElQM2RCRUZvS2IyemNobzlRckdCM1lwUHlpb2g1TjdRZUpPYXh3RVdv?=
 =?utf-8?B?UnVPNWQ1RVByblV0SEVPeWFOSDdKZEd4WTdjazFkNWtpaDdxaTgzaFc0dVBV?=
 =?utf-8?B?UTVEQTdVVUFDZXc0eDRldW5uOUVQTkNhM3dZWEhHZWcrbXlyOWppaDQwc1JL?=
 =?utf-8?B?OFNlUTR2RElaUmdYOTRwSXI3OVVEVWcxVndTbkVKcGlMWkd2N3VzdHAveW9U?=
 =?utf-8?B?RC8raXMrY0ovMEFPUXlTaUNPeVR4cC83Vmd4N3U4QXV2NWFCMHZFVC9xNkUv?=
 =?utf-8?B?bjB5N3FsWDBLNXRnamhQVnlpc3pZZktxbnQ0SVZId084ZHRWZ2MyeHBkSGZC?=
 =?utf-8?B?bGlyaVhwR2tBQTJ5VzA0YlU2eHowTE55KzNoRlc4NUZjcXFlZUFucTZMUkZH?=
 =?utf-8?B?ZFArV25ORUdSQzFRWWcyellrRGZCa2tmSDJPbjdVcVhGbG8yYW9VN21QTkZU?=
 =?utf-8?B?ZnVQQzN5Z1kzM2gvODFqNVNPU3ZMRmhNN2liSTVzZzJzcVNlY1JQa3JVTG9G?=
 =?utf-8?B?anU4TzdWR0VlMjVLVTFjUklPMElET3NOYTRYT2xxMjdYcnB2V09Ic0Voa3R2?=
 =?utf-8?B?S1gxcHUwN2JabmFzZEZ0VjkzR3dXVkVyK3JyNitPKzR1UTJPOXpJSEF2a0sy?=
 =?utf-8?B?SXhLVml5aEthR3NPczQ1RVhGOHhWeWJ6MjdTU3ZzUXF2UktMeW1adjNrNXVT?=
 =?utf-8?Q?Ki2dNo75OUv/+yDEXFPmifI2bP0Zopqt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djU4NjQ5NWZSWVhxNkY0VHJFdG9VTlVaUkczNnRGRm5rZkd5SkVaeDdyS2p1?=
 =?utf-8?B?UCswUm9jVG5jS201UVZqY0J2Zyszcmw3R1lyVThQWWhMc0hiQnJYcjllN1FC?=
 =?utf-8?B?bnhJR2JrOVRKN0l5eEcyNjBPTFQvM3BxQUUwNWhRVHlkcWlGY2ViQmcvT3I3?=
 =?utf-8?B?Z08wOHJQbHRHQ3MrdG9BemxtMHFYN1lkWUJJVzQ1NENjc2Y1REw5eHFIRHBQ?=
 =?utf-8?B?Qk1KbVNIck1PWVozaEVsT3h4bjRiSEZsT2wxRnMvZlRyS2o5cW9BRW9mSkZt?=
 =?utf-8?B?bTJUWS9wdEV2Z3JaNHczZGJ2M0ZkcTFZSzB2a1dSSTF2bVBtZmQrK09NZkdW?=
 =?utf-8?B?LzJLbTc4Nks3anp1WTlMdldIeUxUa29ETHNRbDhZMmZVMGNUc3hXSkFYalpQ?=
 =?utf-8?B?WXB6bmpFMzI3VmdBcHFKT0RCeVZmdFlaUFNocmYxVldXL0gyMGVPcTFZTXAw?=
 =?utf-8?B?ZWExTUo0eHovN2cvbkkwODNlS09DeFFWaCtVS1Q4WVBLQVBFdjNVNmxvb1RT?=
 =?utf-8?B?Zk9WMGRGYmJ3cU9ENGlKbmh2MGFPeXU0UWlLNm54cWtGVWZIZTUzRS9lczkw?=
 =?utf-8?B?R21EVFFyZW1NTXlNZXVQcmkzci9FcHpzOWVDOCsramtwUFpESnM2L0hZVFNs?=
 =?utf-8?B?ZVU0Yks3bW9sNUpNeVl4WVM2NnhCV1FiNGwvcnpiU2NWVk8rNlF5bXRBVmhq?=
 =?utf-8?B?dUZ6MWl5aGpyandBVUhmNURud2h5TlE0U0F5SFNlZDdBRmhBS1dwUlFIVG43?=
 =?utf-8?B?TjRYMHdGWjdjTEdsSDRDN3I3Ungyd1Y5TVA1RDNiZWpsVzhvWjhxUmovaEdL?=
 =?utf-8?B?NjZyRXdSZ2xZd0prVVo2elp6SnRhRnMyUm9kcmRENjRCNnVKZDR3UnZZSzBu?=
 =?utf-8?B?STlWSUJwdkxKZ1ZFVGg1U09SVDB6dDQ5SG9uREIvQUkxOVJ6amhzcXBNQlZX?=
 =?utf-8?B?a09TS0Q1VHU4dm9kVUx6U1ptaG14TjdFL29wekNrcXAyZWlFL1M2WFd5ZlhP?=
 =?utf-8?B?cFA2SWRmQTJGR0ZlTGRadDQvbUF0dkFtVm1HTWtHK3JCYi92L1BXeWp1eTlr?=
 =?utf-8?B?UjhMRTBHZUoxNE9lRlRDRndxRVgzQStaUSsvUmk2YjgrOXQ5MkpjQW8wVnlq?=
 =?utf-8?B?UDlYNkIyTGg5c2NxY0V0R2pQa0QrT1NBMmczeUVGcER0ZzhGSjVTaUZuMi9K?=
 =?utf-8?B?eXFqMytWWEgwUUVjTHIyR2hnU25UK2ZxdjNIOGNOUVVLaXFWdHRuM3lNRmxD?=
 =?utf-8?B?c0lBaDFkTXFSRDI3d3BjVDkyQStVSG1hVkVsRlJ5NjlyRDFWZCt2OVFvVmFC?=
 =?utf-8?B?RmM3TUFvWTlTcngyYmhPYnJNZytXVlA4QXhvc21HT3IwRWJlWldUcjl0Tmo0?=
 =?utf-8?B?dmpISEc1U1RJQ0FLajZkOTJEZ01mR2pCTFlyUHZHRXZEVnVWMHhyZkl5Wi9p?=
 =?utf-8?B?L0QydU9mQ25TblBOR1F0dm5qYnRUcTBLNFJ4eW11UUV0NER2ZGlyNFNjZ0sw?=
 =?utf-8?B?amt0Vnl2N1p4bjRldzE3ZDQ4OHNUNmJGMzVYVlg2NFVzellKcUF1aWYyakZ4?=
 =?utf-8?B?Y3dCV3pJZjBZaFdzc05KVXNETHhOcytlQytsakNjMy9iVHhWclI2K2FpOVl2?=
 =?utf-8?B?Rkx3QjZtdjRqNGE2N2VCbzRpY3JaeHRjd25pVEFQdStaRWVYVjc2a05uVWdr?=
 =?utf-8?B?U1YrakJKaDhhS0dOd1Uvd0pGSytUTHFhczFNeXFWSm1UL2JtRERSQWZtNzhD?=
 =?utf-8?B?aVRZT1YveEJCUEZLMVhkbHlsQWpseFk4M0UvL2ZDSHpFQ2xPaEd6R2hRa0xq?=
 =?utf-8?B?TFhuWkJVVzNTOFFQWmFiN083RTBUa0JqZFhwUXMwQ1FLcjVGK3FYQ2QrODdt?=
 =?utf-8?B?UjYzNXowTDBaeURLQ2s4NXF3R1BMb3hJUEppMG5ZdDVDZVVPS2ppMzVnclVE?=
 =?utf-8?B?b3U0QytUelp4cDV2U2xSQzVtSmg0a2VvU1JsbUcxWU00RFBWS01YUzRQR0Iy?=
 =?utf-8?B?QVJFQStLRXV3QzIvZzFPYW8yZ1EzQTIrQlBHVzU4em91cUVIZzJqSEtueHhn?=
 =?utf-8?B?WHVnNXc1am5iWXFKNmM5d1dIOXAyRTdNVVB4QUxJQ25WWWpOOG9GeWEzOTNi?=
 =?utf-8?B?WGQ4ZEFLU2NOYlhmZ2lFVE1vRnkxTkUzWVoxdHlrY2JiTUFBeXBzd1d4dXZu?=
 =?utf-8?B?eHJzd214cm5NaWRjZ2NDNjdpT3RMUzFhZlZpa2h3bXhhRW5hTTR0QnhjR0NT?=
 =?utf-8?B?azVGeEMyRlNEbnlPU2IwdHA0UzBrYmZFSG9qSFVHa2VSWmg3SVcyaGJ5ZEJu?=
 =?utf-8?B?M0xtWG9EUDA4S0srYzVFSThSdC9aRFlaQ2c0RDB3cnFrY0VWdlc5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a5f03c-79af-4ecb-2fc9-08de52137e1a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 19:48:00.7665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VKPUbuMwMcVo8wr8TLDt5DRAc1wBLfu2xew+P0u6YUeF3R8bXpAcwsqusAjkwXfGtUkivJfdDC3hmcgRAa+EAaq/kRdBYAPcN0Gnao7Mh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5006

On 12/01/2026 6:47 pm, Alejandro Vallejo wrote:
> On Mon Jan 12, 2026 at 6:15 PM CET, Andrew Cooper wrote:
>> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
>>> index 281993e725..d9895018b4 100644
>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>> @@ -404,21 +404,23 @@ static bool __init can_load_microcode(void)
>>>      return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
>>>  }
>>>  
>>> -static const char __initconst intel_cpio_path[] =
>>> +static const char __initconst __maybe_unused intel_cpio_path[] =
>>>      "kernel/x86/microcode/GenuineIntel.bin";
>>>  
>>>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
>>> -    .cpu_request_microcode            = cpu_request_microcode,
>>>      .collect_cpu_info                 = collect_cpu_info,
>>> +#ifdef CONFIG_MICROCODE_LOADING
>>> +    .cpu_request_microcode            = cpu_request_microcode,
>>>      .apply_microcode                  = apply_microcode,
>>>      .compare                          = intel_compare,
>>>      .cpio_path                        = intel_cpio_path,
>>> +#endif /* CONFIG_MICROCODE_LOADING */
>>>  };
>>>  
>>>  void __init ucode_probe_intel(struct microcode_ops *ops)
>>>  {
>>>      *ops = intel_ucode_ops;
>>>  
>>> -    if ( !can_load_microcode() )
>>> +    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) && !can_load_microcode() )
>>>          ops->apply_microcode = NULL;
>>>  }
>> ! ||, surely?
> When !CONFIG_MICROCODE_LOADING apply_microcode is already NULL. It's a needless
> assignment. This is strictly so the compiler can avoid assigning anything.
>
> Functionally it's irrelevant.

Oh, that's subtle.

As can_load_microcode() is a local static function anyway, it might be
better to have an early return false in there.

That will get the same DCE, but be easier to follow.


>
>>
>>> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
>>> index 79bb99e0b6..5e83965d21 100644
>>> --- a/xen/arch/x86/platform_hypercall.c
>>> +++ b/xen/arch/x86/platform_hypercall.c
>>> @@ -307,6 +307,7 @@ ret_t do_platform_op(
>>>          break;
>>>      }
>>>  
>>> +#ifdef CONFIG_MICROCODE_LOADING
>>>      case XENPF_microcode_update:
>>>      {
>>>          XEN_GUEST_HANDLE(const_void) data;
>>> @@ -327,6 +328,7 @@ ret_t do_platform_op(
>>>                                   op->u.microcode2.flags);
>>>          break;
>>>      }
>>> +#endif /* CONFIG_MICROCODE_LOADING */
>> You mustn't #ifdef out a case like this, because it causes the op to
>> fall into the default case, and some of the default chains go a long way
>> and make unwise assumptions, like hitting a BUG().
> It's normally more convenient for us (AMD) to physically remove code where
> possible for coverage reasons, but in this case it probably doesn't matter.
>
> That said, I think we can both agree if dom0 can crash the hypervisor requesting
> a non existing op the bug is probably in such a BUG() statement and not
> elsewhere. Note CONFIG_VIDEO already removes an op in this way in this very
> file. The default case returns with ENOSYS, with BUG() being in helpers for
> other data, as far as I can see.

The existing bad practice are the ones I haven't had time to fix yet.

As I recall, we did have a guest reachable BUG_ON() at one point caused
by this pattern, hence the "never again" position.


>>>  
>>>      case XENPF_platform_quirk:
>>>      {
>>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>>> index 92c97d641e..1e6c92e554 100644
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -65,7 +65,8 @@ obj-y += wait.o
>>>  obj-bin-y += warning.init.o
>>>  obj-y += xmalloc_tlsf.o
>>>  
>>> -obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>>> +obj-bin-$(CONFIG_MICROCODE_LOADING) += earlycpio.init.o
>>> +obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
>>>  
>>>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>>>  
>> In a prereq patch, please move earlycpio out of common/ into xen/lib/. 
>> It shouldn't be tied to CONFIG_MICROCODE_LOADING like this, and it can
>> simply be discarded at link time when it's librified and unreferenced.
>>
>> ~Andrew
> That would preclude having it in the init section though, AIUI.

There's already lib stuff placed in init.  It works fine.

(What does get complicated is conditionally-init, conditionally-not, but
that's complicated irrespective of lib/)

~Andrew

