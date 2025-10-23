Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88333BFFF85
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 10:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148766.1480619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBqrD-0004xu-3A; Thu, 23 Oct 2025 08:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148766.1480619; Thu, 23 Oct 2025 08:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBqrD-0004up-00; Thu, 23 Oct 2025 08:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1148766;
 Thu, 23 Oct 2025 08:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oXKG=5A=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBqrB-0004uj-NO
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 08:39:37 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdec7b31-afeb-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 10:39:36 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ2PR03MB7527.namprd03.prod.outlook.com (2603:10b6:a03:559::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 08:39:31 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:39:31 +0000
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
X-Inumbo-ID: cdec7b31-afeb-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcCJ0MnotFlKRV8oyewUl+PmVPogLVH5DjC2UOkfjuB6X6udpeHlGRqFg/0z9dtU4KaI20FDfb8MdubCvj064b71xf9s6pOcmge3gxd/TC4rZQOWmFa5oT5eljRx/elP4MuU2ybGh1e+LuGG6QqYzQ973aoi5TdqhCYW3LYnaMlxcI4Gkk4dnnNceO3EbITeW1rsI4LoOUrGUsz38xCFxAoChqNjJGrkXEUqNHYY2VewW1nWQzwRqnSnKv2CsN5Laa9WKfAMq/wOpa4j/BAHa/Qlmj78zSQmOk/sc3OCUwuuJ6MRLe7vVAG9lXVHb3+PdYMKH1yGrQ3vxo4dAmT+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19eBYxrnfoAkcua0jE/me9wgh/Gl7m3Gny6ARk2Zz5U=;
 b=MH9EVcmEu/c0xB1aZ/BleZAmJWSWYJYoQxG4Gf7Sx/rF09zI/fR80Ok2yaDDb2sdEyv26BmNMtl09i+nUSItgco6ZcBb3fSnO3oWKwHNxQ0CpQHevIReuKB2kRMQrfYGiR7CFq66INL4IZifuWcGSbUHHn7qubcvDMJSg1QUVP1hpsfPjJjLW9WMciwIxeyolVtzhv+8iK6Hv22fJBIZ8J5+hiAiUCyWkOFxgY70XaTDqh94TRjR0CmT8fU5bld/NZJGf8s4zdOXODwM9NR1TrNTv2jmkccHwtlby/AZSYhRyPRKYT3eeNG2/pkw3TPwEx9s1RdXKZ1GWi9hkq1V6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19eBYxrnfoAkcua0jE/me9wgh/Gl7m3Gny6ARk2Zz5U=;
 b=TfKAlOPjvfSKvxSrYjTd6oB0MA40CeJLneJosHxe+3XW425oZqSRKJ4T7Ynb8JAHLxnVPaaang3QDfSMVbBdp0sJ7F+hTM2C3pYJr9ZbRnkZVn3LRtUuDXNbw1VvOE/31sISr9JKivIzVVFVmSw5LJjnFbqoKe0cbc9JdMwCLXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Oct 2025 10:39:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPnpvtXOoYSXXsT-@Mac.lan>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com>
 <aPZh3Y8W4QcV_oLs@Mac.lan>
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com>
 <aPePepQk3t6gxMR1@Mac.lan>
 <16d62ac6-6666-4bad-be59-324cec634a20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16d62ac6-6666-4bad-be59-324cec634a20@suse.com>
X-ClientProxiedBy: MA2P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::17) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ2PR03MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: cf202505-56ba-4451-cb5e-08de120faf30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1RUUU84cUhGTGdpUG9NQkpMc0FmOW5Sa013S2c3RlFYb25RU1VRR2w5OXpJ?=
 =?utf-8?B?cTYzV0tVVjVoNmZuc2NuTTRIc0xUd0NSQ1cxb2xlR3A4QTR6Q0pCek1iVVhI?=
 =?utf-8?B?ZXh5QldSZzJ3OWhjNk9xU2NOUjhaTXp6MDg3Zkx5dWs0WlI4UUpGdW5pdUFa?=
 =?utf-8?B?VFp6ZW11QjJ2dGlhWXlwZHFWRHNYZlVrSCsyREo5YzhWcW9hQjUrS1g5cjN0?=
 =?utf-8?B?b2RjV0N5ZkZGejFLOTg2UFMwczVmcVhIQmRmV2dqcGI4dzdmS2FaTGNaREVi?=
 =?utf-8?B?ZzIvSEdJN3p2M2dKV2lDcWdMc3ZDMHFHTWg0UlNSeDA1b1VZNXhOdXVqaFhk?=
 =?utf-8?B?SC9HV1RkZFErdFY5MXFFZVUybmJJZHdvcXNXeTd4UWwrR0p2dUJLRHVndUpr?=
 =?utf-8?B?ZlI3anVFSEVqaVZ0VWlBTmVhRmlaLy9tNnc4RitPUWQyQjVVZTRDM2pFQm0r?=
 =?utf-8?B?ZGx4Y1JVdkZBTFhuVXkwNlFHNDh3UUlQMytCWGlqQTBlTHBKQUNMR2JNQU13?=
 =?utf-8?B?dDY4SDJKbzlvek4vdElVYmI1UmRWd1lnWk1PdTU3c3ZlSG5YM25TUzNWUHRt?=
 =?utf-8?B?QXNLMFRkSmkreEZRL0xPVUFYOXFZUzAvbGgvTFZPWExnNzJsb0ZMNkZ1aTRT?=
 =?utf-8?B?ZUdvS0lNNWFEUWhWalI3VUdRWjF0ZExPOXhBVXFuU2tjRm5xMCtqV2EzMElL?=
 =?utf-8?B?RGxzSHYwNVU3eFhvYjcwUVFSZ0hkSGsralNRMkU3c1dwVEhnNDZQL01KR1RY?=
 =?utf-8?B?N0lpYmNLdjdWNDZ6UXBtVUpveDBiQ2FOSFNIcXIzL1QzNjl1R25CNVBjNlVp?=
 =?utf-8?B?TW50eFUxVUY0T0ZYRm5zWVlreHdqTm1zdnNLTmVxemtFUXNNNGVqdDBZcHJH?=
 =?utf-8?B?S0ZVbFRoOWJVUHhNQmdqOWNNdHFOVHJyL2VQQkpseHV0dGVDQjVlczRSc0Fm?=
 =?utf-8?B?V0RKSXoxTmplVExkdUkxV0FiVnJwNlZDODlzRWQzT3I0dVpJNWtGL21WUmRO?=
 =?utf-8?B?MkVGT2RVeUxncnFxNmVuQUtleVdsN0N4N0RpRGhrMjNZSzFhaE9aS3MwaFFo?=
 =?utf-8?B?TzBxcW1zY1pKejdxTFo5dEFDUElZNkpMWDNVRG5QSkIxS3NNdTRLdmFOVWQ1?=
 =?utf-8?B?RlBmeWkyZ2JRU3FPMGZSdFJlVGpSVUNGaTRPNHRHbmgwQ1FNRDVzUmloQXN0?=
 =?utf-8?B?TWZBUzE3eUR1RVpUL3RoTG1mVEI2NnJsbmNUd3pQMEJ4OU93M1FVZ2RQY2RT?=
 =?utf-8?B?c2VGakRRMUxMd1NvWEdjSFdET0hHRFVtWEI0NUoyc05mVG02akdJV0FkdThK?=
 =?utf-8?B?WFMrNWtsUFN6SlRwSlcrUHR2dkkyY2R5OUxLQ295MS85SExFdDgvMnYyc000?=
 =?utf-8?B?Zy90MFZHL3pkMVZpL3FMVXhtSkdVMHY3WUx1ZjBXTU5aNVd5OGVXbFN6SEpV?=
 =?utf-8?B?bVJpNFF0eStnUUl2dHFkRHQ2THc3WVJ4cTE0N3hFRkJaSGlxUGR3RHJpYzdQ?=
 =?utf-8?B?WVNBeXF3ZFh6Zll5cFVNMlp6N3VhVnhvblliU0p3TXFpS0pCSkpQMm9QbXEx?=
 =?utf-8?B?UndaMmxGbUpOR1NxOWpFT3gvdkFWUjhvWlhyZS9GU3BnUWhqaTNyMjc4V1Vw?=
 =?utf-8?B?dUg1NSs0a1R4N3diQXZOdTdNdkN6bzNCU2IxdzNFdFA2cTVFdmQ5clRJQkFV?=
 =?utf-8?B?UXplZjdWUHZxVjVRK29vN2tQckF2U2tMd2pTY08vdnZEN3RGVEMydnQydmNF?=
 =?utf-8?B?SEdFQmR5YTVlQUd6ekd0dlNwd0JEMEcwQ2ZOMG9MOVNYQXN5RzJKTXQvN1Y0?=
 =?utf-8?B?K3o2cDRVS09wUW80R00rcVBXMkI2clNEK1BxbzZ4bU4vQko1U3JBcFF2K1VJ?=
 =?utf-8?B?U1lUVFNRRnFCYnA2Y2I1TkExK3VyTEtIMmJEWkltV3VscHE0dXdzaUlHUFpj?=
 =?utf-8?B?NnlITk9PNDNLUVdNUkRXOVg5TzFRcktZOVZsOGFoQytDblFHdEM5YjNhQ1Q5?=
 =?utf-8?B?dmI5T3llTWRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0hwVVFxdDZLQVlYc2tZS2IyYW80YldNU1RpSXJQelhuaE4rY0pCQXc3R1lt?=
 =?utf-8?B?U1BQaWRHcDR6U2hnREZwb1lDN3REWkk5UW9WZG9tdGE0cVhKM21hV3pRS3pv?=
 =?utf-8?B?QjFMMzZpcEJOL015cUxISHYvYnAwQ2pCWFRRaWxwcitLSzZhL1dldG05WFZt?=
 =?utf-8?B?dENiSVFhT0FURzIxSjhLOFhyeDhFZnhGelBLdVMwd3EwbzdHOW4xTWlCdjY1?=
 =?utf-8?B?dGkzVWtPL3RYcm1FMzk5ckg2aER4cjQxT0ZrME40ZUhXUGVrUDF2cGYrelB3?=
 =?utf-8?B?U0labnlwSWZXQzR2MER4WUZCM3dyWmNWaDRlaW9XQlpYMFhZRUU3RFpJV2ZN?=
 =?utf-8?B?ak9qczU2ZkdLbEFHanVFWFNnRTBVK0txbWsydXJlUlBNdStQaU5BYXR1Qmxp?=
 =?utf-8?B?UVgwZmcvdWhoaUpPVmtsRE94dHhaN3JhSlpmVS9BT1pYSlVkUTFXN2tSNDhX?=
 =?utf-8?B?aktRbXVLN0VZK0pYOCtkejNETDA2R2N1Q0ljOFFVMFZoQ1JlZGZ4MFNkeEd5?=
 =?utf-8?B?Umo3Z09GQytwaU5mb2x6UFdBczR5Y2dLbE1ySHRFcDA2M09rRnk4TDg2STlG?=
 =?utf-8?B?M2lyZGV1eWNnaUtjR0hWcGwyNmZmNzdRUEIrQnp1WUJXSmwyeVh2N0tXcmVn?=
 =?utf-8?B?ZXlTT2pjR2lsVWZpcnVQemtSSHMvZzdDZkdyOHlzQW9UYVFKOWVKM2gxTkZP?=
 =?utf-8?B?SWtsdVYxTkVUUnpnbzU1bm9iTFBic2lERGJVeVVmSGxvSlpIc0FGZWJ1clc4?=
 =?utf-8?B?SkZyOXp0c0U0aEFmNHg4RkNSUkozWnlmTWVFS2p3R2F5S3E5bGJBSGk1bUhs?=
 =?utf-8?B?aWR1eHhvbkhmclhrTFFocDNNWWZHNWlCdHZKeVQ1cUpscWZhV0pBNFUxRmxp?=
 =?utf-8?B?Z09VT0FTMXVGNmozc2ZGQjNYcVYvN2xnQ0MwL1daM2ZueWt3UHRSb3BXdXE1?=
 =?utf-8?B?bHlaZXNDd1BxOVZ1WUUzbXhMbzBEdHBtbldsS2RVTWR3VzNCL0J2WGxUakhY?=
 =?utf-8?B?MnhteVg2cmg2VlJ2VkxoWHlkM0ljQnlzL05idXlCTmhKS084Q0dqY0pydWw1?=
 =?utf-8?B?TmUxMk5iZGVjdzNibkw3bkRiRXc4OGdidXVsbllyR25ibk0xaDQ4Q3pDbjVY?=
 =?utf-8?B?VVVyMGNPU3R4K21QVTczN04zcEwycWFuNlI5R0hlQmlKRnkybTVGeXdQdXJE?=
 =?utf-8?B?SzMzSm0xUTdQM1NXMWdjM3VwZWNsRzFHeGV5R1hoMTh0NWdHaXBqaGF5ZGUx?=
 =?utf-8?B?d0IxRVZLbjVpWmIwMU5XRW1kenZJb0dwYVdwM0lCbys0R2xMVXdqNVFUWFpm?=
 =?utf-8?B?d0JSc1pnNVZScGQ4T0ZqcmJneXRya09EczZPN3dEQUEzMjZDRjh5Z0dpSHJR?=
 =?utf-8?B?N2dLQ2NIQXNqUGNSUjFpcXp1TzA5YnhCZnc3bGtnSDhLK1lxZ2ZrQWRSeUVC?=
 =?utf-8?B?V1BRUHFDc29EQklmUGRNN0RnemwyZDBTT1VKai9BVHR3TVFTZGg3cGFrOEdY?=
 =?utf-8?B?dWIzTDBLTnV1a3psangveXNVYmJHOVNLL3QwMTl4NlNweXRrYi8reFphSG5t?=
 =?utf-8?B?NmVseTA2UzZlQU9yQ2JhTTAzSEplSjlpZ0hyN2UrbU1JMDVsdXBqRlRjZlA2?=
 =?utf-8?B?bE5TdWNGY0wxem50d2t2NW1oWlRhWVFsRTNHWWR5RVlFc1hRd0I1OHhyNE41?=
 =?utf-8?B?MFJqRjZJVk9Od0pmUVRnNjl1Y2JxUlhXK09BSCt5bzdOMzNSRkwzY1dNamMr?=
 =?utf-8?B?ZnJETXR6NU0yWlRLNUoyeG5YdXNIUmhQWjlFbW84MzRxcGtaTndkOEF2eFh5?=
 =?utf-8?B?NmorV2Y1NVpEcTd4Qm9mazBNZXBoRGg0WUp1ZGV4OUZWd3ZvT1VSUEhEOXRW?=
 =?utf-8?B?VWpUVnVHTWgwVHNiU1VWb0hoWC8rb2xCbC9OeERXRElsaVJJdkNwVHloNWpN?=
 =?utf-8?B?M041b3JPWU5NSXlLbUhRbUVLZDJYR2twR3owTWJydDY3RmJMMncyL1dHWVJv?=
 =?utf-8?B?MCs2NEFxZGFrYkpaRFV2RjBxSFlDOGNHZktXdnNSM241anppVC9SdUcybnln?=
 =?utf-8?B?RTQxWkRpNEN5UXdUSW1KVzNkNGw4VGIxazc0cVNYL3JLVUdZeGo2akZTUGVh?=
 =?utf-8?Q?HCJmznWDGo3UFnCw5LQ9ju8bi?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf202505-56ba-4451-cb5e-08de120faf30
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 08:39:31.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5gPFGy8hS4hTjU5S17nhMaxMdV1x8pkw1Y2djV+ahwfwZrlIYLnJDJid0MmTjZ6d/h/K5SOnmnNVjLFx3kVkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7527

On Wed, Oct 22, 2025 at 11:21:15AM +0200, Jan Beulich wrote:
> On 21.10.2025 15:49, Roger Pau Monné wrote:
> > On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
> >> On 20.10.2025 18:22, Roger Pau Monné wrote:
> >>> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
> >>>> Using dynamically allocated / maintained vectors has several downsides:
> >>>> - possible nesting of IRQs due to the effects of IRQ migration,
> >>>> - reduction of vectors available for devices,
> >>>> - IRQs not moving as intended if there's shortage of vectors,
> >>>> - higher runtime overhead.
> >>>>
> >>>> As the vector also doesn't need to be of any priority (first and foremost
> >>>> it really shouldn't be of higher or same priority as the timer IRQ, as
> >>>> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
> >>>> and use a vector from the 0x10...0x1f exception vector space. Exception vs
> >>>> interrupt can easily be distinguished by checking for the presence of an
> >>>> error code.
> >>>>
> >>>> With a fixed vector, less updating is now necessary in
> >>>> set_channel_irq_affinity(); in particular channels don't need transiently
> >>>> masking anymore, as the necessary update is now atomic. To fully leverage
> >>>> this, however, we want to stop using hpet_msi_set_affinity() there. With
> >>>> the transient masking dropped, we're no longer at risk of missing events.
> >>>>
> >>>> In principle a change to setup_vector_irq() would be necessary, but only
> >>>> if we used low-prio vectors as direct-APIC ones. Since the change would be
> >>>> at best benign here, it is being omitted.
> >>>>
> >>>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> >>>> ---
> >>>> This is an alternative proposal to
> >>>> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
> >>>>
> >>>> Should we keep hpet_msi_set_affinity() at all? We'd better not have the
> >>>> generic IRQ subsystem play with our IRQs' affinities ... (If so, this
> >>>> likely would want to be a separate patch, though.)
> >>>
> >>> I think that needs to become a no-op, with possibly an ASSERT?  Is it
> >>> possibly for dom0 to try to balance this IRQ?  I would think not.
> >>
> >> I'd consider it an error if that was possible. But then the same goes for
> >> other Xen-internal IRQs, like the IOMMU ones. They all implement a
> >> .set_affinity hook ...
> > 
> > We need such hook for fixup_irqs() at least, so that interrupts can be
> > evacuated when an AP goes offline.
> 
> Hmm, yes. Just not here.
> 
> >>>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
> >>>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
> >>>>  {
> >>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> >>>> +    struct msi_msg msg = ch->msi.msg;
> >>>>  
> >>>>      ASSERT(!local_irq_is_enabled());
> >>>>      spin_lock(&desc->lock);
> >>>> -    hpet_msi_mask(desc);
> >>>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >>>> -    hpet_msi_unmask(desc);
> >>>> +
> >>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> >>>> +
> >>>> +    /*
> >>>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
> >>>> +     * actual update below (either of the IRTE or of [just] message address;
> >>>> +     * with interrupt remapping message address/data don't change) now being
> >>>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
> >>>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
> >>>> +     * keeps setting the new deadline only afterwards).
> >>>> +     */
> >>>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
> >>>> +
> >>>>      spin_unlock(&desc->lock);
> >>>>  
> >>>> -    spin_unlock(&ch->lock);
> >>>> +    msg.dest32 = cpu_physical_id(ch->cpu);
> >>>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> >>>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> >>>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> >>>> +    {
> >>>> +        ch->msi.msg = msg;
> >>>> +
> >>>> +        if ( iommu_intremap != iommu_intremap_off )
> >>>> +        {
> >>>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
> >>>>  
> >>>> -    /* We may have missed an interrupt due to the temporary masking. */
> >>>> -    if ( ch->event_handler && ch->next_event < NOW() )
> >>>> -        ch->event_handler(ch);
> >>>> +            ASSERT(rc <= 0);
> >>>> +            if ( rc > 0 )
> >>>> +            {
> >>>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
> >>>> +                ASSERT(msg.address_lo ==
> >>>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
> >>>> +            }
> >>>
> >>> The sequence of asserts seem wrong here, the asserts inside of the rc
> >>>> 0 check will never trigger, because there's an ASSERT(rc <= 0)
> >>> ahead of them?
> >>
> >> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
> >> we ought to check (and presumably fail on) data or address having changed.
> > 
> > Right, but the ASSERT(rc <= 0) will prevent reaching any of the
> > followup ASSERTs if rc == 1?
> 
> Which is no problem, as we'd be dead already anyway if the first assertion
> triggered. Nevertheless I've switched the if() to >= 0 (which then pointed
> out a necessary change in AMD IOMMU code).

Right, so and adjusted if condition plus an ASSERT_UNREACHABLE() at
the end of the if code block?

> >  IOW, we possibly want:
> > 
> >             if ( rc > 0 )
> >             {
> >                 dprintk(XENLOG_ERR,
> >                         "Unexpected HPET MSI setup returned: data: %#x address: %#lx expected data %#x address %#lx\n",
> >                         msg.data, msg.address,
> >                         ch->msi.msg.data, ch->msi.msg.address);
> >                 ASSERT_UNREACHABLE();
> >                 hpet_msi_mask(desc);
> >                 hpet_write32(msg.data, HPET_Tn_ROUTE(ch->idx));
> >                 hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
> >                 hpet_msi_unmask(desc);
> >             }
> >             ASSERT(!rc);
> 
> To be honest, for my taste this goes too far as to what follows an
> ASSERT_UNREACHABLE().

I can understand that.  It's the best way I've come up with attempting
to recover from a possible error in the release case, but I don't
particularly like it either.

> > I'm unsure about attempting to propagate the returned values on release
> > builds, I guess it's slightly better than possibly using an outdated
> > RTE entry?  Albeit this should never happen.
> 
> Yes to the last remark; I don't actually see what you would want to do
> with the propagated return value.

OK, I can this this not being clear.  By propagate here I mean
propagate to the hardware registers, not to the function caller.

> > Also, should the desc->arch.cpu_mask update only be done after the MSI
> > fields have correctly updated, so that in case of failure of
> > iommu_update_ire_from_msi(9 we could return early form the function
> > and avoid changing desc->arch.cpu_mask?
> 
> Hmm, yes, I could do that, but then also in hpet_msi_set_affinity().
> However, as this needs doing under the IRQ descriptor lock, I'd have to
> either extend the locked region here (again), or re-acquire the lock
> later. Neither looks very attractive to me.

Hm, I guess given the point in the release we can leave it as-is.  It
would be nice, but this change is big enough as it is.

Thanks, Roger.

