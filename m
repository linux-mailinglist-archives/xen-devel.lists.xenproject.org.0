Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35502CF50FA
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 18:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195697.1513620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcoeQ-00008K-OY; Mon, 05 Jan 2026 17:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195697.1513620; Mon, 05 Jan 2026 17:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcoeQ-00005g-KY; Mon, 05 Jan 2026 17:45:54 +0000
Received: by outflank-mailman (input) for mailman id 1195697;
 Mon, 05 Jan 2026 17:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcoeP-00005a-Aw
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 17:45:53 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 602629aa-ea5e-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 18:45:51 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5844.namprd03.prod.outlook.com (2603:10b6:303:9c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:45:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:45:49 +0000
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
X-Inumbo-ID: 602629aa-ea5e-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6FvwfDoU6vR1xcGUoitD4IagM1c56hPyDvf3jyxUOVDT/+SuewNkVmr0qWUC4imIKpoPCF09IaLeTYSix0a+RdWb+keBHFOkKPoqF+iCFq2SyXxRVK1Y34j5kP+wt1gi3WHa6k1XMoL1Vsud+OT32TKBlv+LgJy3PrVFiM9wuWR17UjYpBs5TD1wUK6fg9bnPm9A29mlUmLolG1juLDpoNpfj37QCEAiCFUum0YvpYEO+2kFITbZKTamuIjcKagppkexRHPEWohvXYf7Wf/aiSgqPArdUdJ6dzCmwXZUA6HTBbauwIatv0+SRdIR/L2xdr66hZ5sObi1gkKugO3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRHMEVjAlxGKe8YdkGQSjyT4a7TtDFmNvYQTsDv1AKo=;
 b=t4ONbqDwMQusWtWL1UKbXlduJLHCfKKVSowGhnY+HofhQl7uey/WlHr+9aWUF5+MqQRJYjTJAVB2XWjpZrf4k0e3dZo897DA2gRCqE9UJWPfW20FSPdhdBv+jPkFTmj4iYqJW0HQx2Wg7Sq63iKVirjPW6WiE2PtVjGOgha2HG3VBjA68ZlzjbGGG25GUqt4Yx2IwwATuxUAg55raMN3fr0VC73MUA2p2d9Bfp9HOyMLWBOHsEJ/zhLx/tRJIRLOdsiv/z2leqSW/Md7e3nKIGgNOrPUIdc7W8HWHk+fLT/N8bIhJJy9CACw5qyM3iBYsD8n0VTPCz76k5oS/rhleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRHMEVjAlxGKe8YdkGQSjyT4a7TtDFmNvYQTsDv1AKo=;
 b=Y/Wo6pBzToCuGf+ccGnnaP/rqZOPz4IFNL25jwfLQB+6w3pRM9UiXwbHS1s3OynwfTt3jmP71fOgW/+yJfn2VkTvi2FzHT9zZ+BbiC3u3KvbrWL/JdJPX1eUJ0Ycq6dCOIZmigQDTDIcJfkPfPh6Vmul6J4UJ21baEU9yxAoTto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e34ecbe6-5b74-451f-8540-037966f1be21@citrix.com>
Date: Mon, 5 Jan 2026 17:45:46 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Jan Beulich <jbeulich@suse.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <4b051e1f-0d99-4637-b433-bade93e67e0a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4b051e1f-0d99-4637-b433-bade93e67e0a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7f8ada-6f68-42be-21e7-08de4c824330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDB4bVd4bTIwV2xVV3RUZmVyVVNTWlE2V1prUjV2QzVsa1VWNmdoNnMwcnpP?=
 =?utf-8?B?UXkzdThhallQQk42Y0xNbVRURUlXVFhZOHBCc0pBSEZHeTduc0dwUWsyQjNP?=
 =?utf-8?B?cVRyVkNmalF5aTlvcGN3NDdGTXJHdHR0UzRpMElNNUhLd3FMMjZGZERZczFM?=
 =?utf-8?B?NjN1WTBhS0s5NDIxVDdBd1JNL1I4VWdTZnVNS2FLRkZ5VDltRTNuTlV4UmNE?=
 =?utf-8?B?WTlQT1ZEYit5anpWdko5Q1UyUTF1ejFXN3M0VUJNQ2d1R3M4RnBFckxUcWcv?=
 =?utf-8?B?YUE2NDF5eTcyUFNIQmI1bGJBOXhmM0IxTk9ONFEvcG9BMkdZUnpkMVBtdUxQ?=
 =?utf-8?B?ZWkxN2V3TWxFY1dHc0JTV092eno0QnBxTHdBMWJNOEZ2Rm0rc01UZy9nNFFW?=
 =?utf-8?B?bFMwTTVlMkdYOUxMSkF2UXNiSk9NTUs3bnVoSVpTUkdlajQxT0srOWk2aC9M?=
 =?utf-8?B?R0cwK1MrbklWVzRNb01UNHRHYjNGaW82TGRLTGIyT0w3VFU3VnZPUkt3V0Jo?=
 =?utf-8?B?MGl4QjZIdGxpb0tGQ2NhZThYNnhiWndxc2xWb01LNHBTYnd2SUFyR0laKys1?=
 =?utf-8?B?dk1HTjJ4SzVzcXo1bGpkUGMvRUptNW5SK3pFQTJYWFg1MithU1duWXZCZjQ3?=
 =?utf-8?B?YzZPQm5Gc05CTGU4ck03dEU0MERGa0lpTG9sZ0FoMHNRb2s4MDdBSnlvcGYz?=
 =?utf-8?B?cnZiNnBBOVBFbEpIQjZwWDRWVmpESlE5VmpEeE1TT0Z4OE5KYU5VSzN2SGpQ?=
 =?utf-8?B?cFQ5WFlsYmFBWHp1dXd4UC8yenJOSGFvQ1NLTlhMWnIzNU44VVM0WkJKblZD?=
 =?utf-8?B?dDF2L0lZVHdDeWtMTHRoOHBDa2c5MU96U09VdXVzbmg1SndFNFRQZHlSNkt1?=
 =?utf-8?B?OWYyRjRqblp3SndRb3RaZmE4dENCWk13aXJjSXBBU1ZEeHl4L3M2d0JCL0Rp?=
 =?utf-8?B?WmxYdG9nNEQwcWx1dDlJRk13WURXRUhjcWV1cDVmUDlNZkpoRjNWVUI5ZkFR?=
 =?utf-8?B?cDVLLzcwOXFwdU9rendFNVVKSUJIZDBRbUhKaXZ4bzk4MmxsU0hlcVNKRkV5?=
 =?utf-8?B?ajlKRHNTMUo3bERRQlRhaWdhcnNpQWRWS2EzN3N3WmxNcEFEd3A3Tllqak5u?=
 =?utf-8?B?M2FiVllidDJoUU40cmFZMTR1R3JkVXdwem1ycllSelk1N21TRGpNK3U4M1cr?=
 =?utf-8?B?NEtLOEJ0SXhUcXpJUnpXcmxDRzVDOHZ3S3ZzQ3p4L3FHQlVXY0I0ZWJCR25M?=
 =?utf-8?B?UStGdlgrZnZCb2FkZ2JHaTJpeTlHWmVxQzFQZElwbUdQeS82dkxKc1g5WUFr?=
 =?utf-8?B?SERlRS9uVmNseGRFWjhEM08rZ1BCeklJSEE0dXRiRDkxTVVnczJxcEFEUCtk?=
 =?utf-8?B?OWtUWjJpV3BsNWpSSjM0VC9oVjBuQThndHE1bzFUY1h5RXZwcjNFUnFBcmln?=
 =?utf-8?B?U3dRUElXM3JJb3NLMGV4QzNKSWdPQ3FYaGMzQklVS2RJSzVXSllMcjkrcnBs?=
 =?utf-8?B?bitXN25nUTZQeERxenZsOFlBWHJvSVY4TnFzMERYVGNwb0x2OEZVWWp1Qmdx?=
 =?utf-8?B?OSt4UUsvcWIrQUFEbHhqclJ4dXA0aEs0T3JJZ0V3dksyZHpwUXR2YTI1a2dy?=
 =?utf-8?B?elJUczV2Q2pNaU5Bd1lLWHRETmQrUTJ3aW9LTE1zRE14ZjE3TTg3VFQ0Z1pP?=
 =?utf-8?B?bHdKN3EyajFPWUx6aTVhMmVUVThzVnd1SG1PTVZPSndSZURzMzFScWtzQnAx?=
 =?utf-8?B?VWpqOUpuK3VHWVNiRUkwTE5rOThvYXN0cHhsQWt2WFFnTmMwTytVRndhRG9r?=
 =?utf-8?B?aE9mUUxsaENyMEpNUlpmeGY2R1dNcHRlUmljRGZ0VUcrWmc0bzF2V3U2Z0Ju?=
 =?utf-8?B?SjdEcm1Sd3Rwb01UaUlCYTVrQU4yc2ZvTXVGQk5EdVh4aEFOWFVabG81TUpB?=
 =?utf-8?Q?2WSmF5a0Ht8nJrIjAknvc3dLuUuuT0bC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW1jQUd1bkIxTzNPbStacWhNQmFuRWZrTm5yNTZLT1R1bnFYWkR2YUFlZGhN?=
 =?utf-8?B?Qzd0M0JmUmFtTFMwdUhocExJOGJPdEFzd0p0QTlnLzlKaTF0U3IwNkF4c0wv?=
 =?utf-8?B?eCtoeUJYckZxRmdRUU5wMmRZL1JjT3lFZEFrUTlZd2RGdktaZk5rQWJhTU5x?=
 =?utf-8?B?MGhXcWJhL0JqY1UycVBNbjRCWVpuL1FXeTY4eHNCZU9tS0Y4NDg4K3hka0xJ?=
 =?utf-8?B?a2Z6R2pKTG9WSUg0WVg5VU03UVk5OTRJQ0luWXpUREFtNnZ4WkN5NGJYZTVO?=
 =?utf-8?B?c1loQlRPWkpadlBNOGhiWHd0RUpYNGdyaE93bG0xSXhWWGQxL1lkR0RXKzlW?=
 =?utf-8?B?T1NudlYrUnh5cE41WlBlUE5FakdTNEIvV3VDQ2VBU1VZMHVLWDlTN1ZONEFE?=
 =?utf-8?B?c2hCdkY4ejE1Z1pCeEdLYnpZYm9pazhUaTQrOTd1WktUT1h1K0xzRTExRzBD?=
 =?utf-8?B?YmZ1RVltT2Jpd1JLZ1RwdjUyQnJXTXhnT3hwMWNOa2t4SE9jQVhEbjRHOEdM?=
 =?utf-8?B?NkdEU29hc3BCOVRaOFNEZXpLb1Vxblo4bkVaWHpFeFY3SVpabTFhQVNXUkZt?=
 =?utf-8?B?VlJnS2pVZUYzVmhyYVFzZVZrNElVNG1WZnlIRlRBZ3BTZ2lEbVU2a3NJclNo?=
 =?utf-8?B?K3UwcTZYNUJWejJnN1U0Vk5jYkUzMTFwVE8yUlo2dGo5SktYcGVLdjVqVHk0?=
 =?utf-8?B?ay80aVVkdVllNG5CYWtoQW5OdEJSWXVYZ200SldOcDROK1RBUUxzYkpZcEpa?=
 =?utf-8?B?RjlGRjBrWHBmemdPYTA4eE5RK2pkV3BqYVREa2JBS0wvY0FQMk1INTVRT2tV?=
 =?utf-8?B?dWJiQ0NEZjFYbDgrTGdRY0VITnZwWlhMdWpzNXpNTmJValBwSU5WQUhHUXZI?=
 =?utf-8?B?NTBrTEs4MjFTNGxNazd1Mzh1OXZUM3E3T0lOYmcyM0ZLNitwbktFWVJEY1d2?=
 =?utf-8?B?OVZDSjY4SkdlNks4WjVjNjZ5ZjRFblpaRkFVT0pPc1FGeVRjL3cxMk5WMUZj?=
 =?utf-8?B?WGgxMDlIUU1RQXlJYXo0M09nZU1TVlJjZnFlblFVMGl3RnIvakRrU2VTM0t1?=
 =?utf-8?B?NWllRDJZWFdtdHdkUm9acW5yVkpMZjNndUV6UCtOWDdOeUdZNmZzM3hFT05p?=
 =?utf-8?B?VXR3VGk3eVA0RTFvSTR5bjVjMmVIdk85VTNBNkM5K1hrUDhOQ0c4YVQ2bzFw?=
 =?utf-8?B?d0I2L20zNDJlMzNMNFNJVnU4Qk1UOFlMS00zQTdneURtci9FNWJxSlNuRFhk?=
 =?utf-8?B?QjZ0Z1NxeXZEUHdLMTkva2hVc2lXVmVheHovT0drMkV2dmd0OGcvbEo4T1I2?=
 =?utf-8?B?TUZqYzZqdE4waWNwSU1uTS9WYWhYRHFabkFvZ1lDTktxUnFBK1NEekk2T1Mv?=
 =?utf-8?B?dmVNL01MOVBXNGZTQjNPMjUwUExTOERGQWg5akZIODdVUGhFUTVYVENYVk8y?=
 =?utf-8?B?SXRlS2xjakhMYmdpMm1RUGx6cEtCcmQrQmpOZ0p5Nm9Cb1h1TVRnMGpoL0NO?=
 =?utf-8?B?Q1RQNkVNOUlONEg1TFA0eVJ1UEJ6V01DajErcHZZNFl3VW9LSDNKUmVkQUdR?=
 =?utf-8?B?N2t5V0N1TVBsVTBRM2cvYVFET0YyNzdOckhNdU5tc1dhRVhtMy90c0llREpp?=
 =?utf-8?B?U0tnRGlldC8vZTBLeTMrSENub0ljTzMvV1hOOWFrNUdYaHU4SXA3cEo4MTRL?=
 =?utf-8?B?T05vb1NqQUhvb1RsdDRibS9oNmJFQXU4N25FZE9KeW5MenFPWS90akFhTzFn?=
 =?utf-8?B?MGZ0K2p0ZmtJSzJZT3g4TGR3V3lneWlOdkgvKytxa04vV0poaXhwUmp4T1pO?=
 =?utf-8?B?Y3p0ZmV0REtKRThLZTgwSUM2T09YWUo1bVdRRUc4K0tLbzdwSjZaZTExK3BR?=
 =?utf-8?B?bEI3Zjg0S0duM0NYMFl5NW5JTm1JZFBSZkVSQlg5UFZnbU5BUjdyeTYvVDl5?=
 =?utf-8?B?bEtnU2pNdmJLUW5ZdnFocnlyYjE0RGxMMjVPaitUYjZxY01HcCtDeFR4dCto?=
 =?utf-8?B?SklpU3VnZHRVMnFFTWVLa3diOVBEelhGU3NhM1dWWlBmVnFkRkRDdmJaeHpq?=
 =?utf-8?B?a0dvSmhJOERhUHBtTlZMNm5zdWI2bVRkWmlNQVRXb2lUcVBNK244Szl0bk5T?=
 =?utf-8?B?RjRJVllBUkVTQkMycnAwazJpUjkvOXlvektIUnN5U1dqM0l0cnhsRVBTWXdR?=
 =?utf-8?B?WWViNU1JdDlhSFl4SlBOLzhTdEtJRXZ4VDl6S0p0SWFwZE1pc01YWHJPNGJi?=
 =?utf-8?B?Z25LUW8xVXEvYVJyTER5VUFqeUZ5c2RBMFIydXVKS21FeDMvbnNtRkNzNjdt?=
 =?utf-8?B?ZW9jVS9BSitXVDRUeUw0cnU1K3MzM0JRTzI4SjBVZzBkMHZuNmJpZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7f8ada-6f68-42be-21e7-08de4c824330
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:45:49.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkwbYi6iWE2edbbLs2ezvJGHtq9N+qRXLOGdJhl8jI8IC/sMQYG4GNvVmBnJSS6nd6WqCT0gO3vcS5mdS7J3Ils92z4aXQePbRKdSOljv0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5844

On 05/01/2026 3:46 pm, Jan Beulich wrote:
> On 30.12.2025 14:54, Andrew Cooper wrote:
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>>      uint32_t hmask = mask >> 32;
>>      uint32_t lmask = mask;
>>      unsigned int fip_width = v->domain->arch.x87_fip_width;
>> -#define XSAVE(pfx) \
>> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
>> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
>> -                           : "=m" (*ptr) \
>> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
>> -        else \
>> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
>> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
>> -                           X86_FEATURE_XSAVEOPT, \
>> -                           "=m" (*ptr), \
>> -                           "a" (lmask), "d" (hmask), "D" (ptr))
>> +
>> +#define XSAVE(pfx)                                                      \
>> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
>> +        asm volatile ( "xsaves %0"                                      \
>> +                       : "=m" (*ptr)                                    \
>> +                       : "a" (lmask), "d" (hmask) );                    \
>> +    else                                                                \
>> +        alternative_io("xsave %0",                                      \
>> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
>> +                       "=m" (*ptr),                                     \
>> +                       "a" (lmask), "d" (hmask))
> While no doubt neater to read this way, there's a subtle latent issue here:
> "m" doesn't exclude RIP-relative addressing, yet that addressing form can't
> be used in replacement code (up and until we leverage your decode-lite to
> actually be able to fix up the displacement).

I guess I'll fix that first.

I'm not interested in trying to keep playing games to work around
deficiencies in our alternatives infrastructure.

>  Sadly "o" as a constraint
> doesn't look to be any different in this regard (I think it should be, as
> adding a "small integer" may already bring the displacement beyond the
> permitted range, but their definition of "offsettable" allows this).
>
> This issue is latent until such time that (a) a caller appears passing in
> the address of a Xen-internal variable and (b) we make LTO work again.
> Since the breakage would be impossible to notice at build time, I think we
> would be better off if we avoided it from the beginning. Which may mean
> sacrificing on code gen, by using "r" and then "(%0)" as the insn operand.

Even with LTO, I don't see any plausible case where we have build-time
struct vcpu's to pass in.

>
>> @@ -489,17 +484,17 @@ void xrstor(struct vcpu *v, uint64_t mask)
>>              ptr->xsave_hdr.xcomp_bv = 0;
>>          }
>>          memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
>> -        continue;
>> +        goto retry;
>>  
>>      case 2: /* Stage 2: Reset all state. */
>>          ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
>>          ptr->xsave_hdr.xstate_bv = 0;
>>          ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
>>              ? XSTATE_COMPACTION_ENABLED : 0;
>> -        continue;
>> -    }
>> +        goto retry;
>>  
>> -        domain_crash(current->domain);
>> +    default: /* Stage 3: Nothing else to do. */
>> +        domain_crash(v->domain, "Uncorrectable XRSTOR fault\n");
>>          return;
> There's an unexplained change here as to which domain is being crashed.
> You switch to crashing the subject domain, yet if that's not also the
> requester, it isn't "guilty" in causing the observed fault.

So dom0 should be crashed because there bad data in the migration stream?

v is always curr.  XRSTOR can't be used correctly outside of the subject
context, and indeed the Stage 2 logic above is definitely buggy when v
!= curr.

~Andrew

