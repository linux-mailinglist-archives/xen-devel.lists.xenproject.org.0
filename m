Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGWdJQ5hnWkDPAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74F183AA8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239519.1540919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunlQ-0005Ru-VG; Tue, 24 Feb 2026 08:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239519.1540919; Tue, 24 Feb 2026 08:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunlQ-0005Pk-SJ; Tue, 24 Feb 2026 08:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1239519;
 Tue, 24 Feb 2026 08:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vunlP-0005Nl-US
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:27:28 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37bf218-115a-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 09:27:22 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8324.namprd03.prod.outlook.com (2603:10b6:610:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:27:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:27:19 +0000
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
X-Inumbo-ID: a37bf218-115a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSFvDzf3mHe5NRdmGMFcwvmOL9B02gALiwfpQlnoU2k7wTL27P2OqTukXYMCvToT4mlkNmEh/ClXXw676v1W/VomyeHcjYTXzROgdeXmn4sk1/m5lM06u4RibivEDU4ELl/3krrEt2amO/i4z8FiWLaGZwuPBr+j91Ndtuku6h2YrKjwQDJRIqiypL4f1ITc+zMBXnMukqDsro+L9btWbAk8H9q0Ue0CZTcWQjler8AXvTnMVmYY0/4kq6/EAMnZ+6MiFTnrpfQA609Efj1901tXoY6IYQUTnPJDlmjzk4qtEN6QtkfKb5MGsQzS//lfS0HBB7Xg0HWNTnYJMOElqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSl9sjk8HIvJOLdERy/twc/I9+KzzpsWBWor+ZEU1tM=;
 b=C1GtEnKKPq3hm3QFyNYlQpVC3ocRE3a3z8m7mi8fCNF0EUlJU7ajIIsnxh+UhlKVKBKgpXsLFlaZ/F6E4z5cx9QsFRBH5UyJtCzqvbv7MTsg8XwJLxXHP1vVOq5S1gmATOZtPEGFv/4WIcfHL5aJR8zTF28Z6CMBSRrLxPz+xTRUehL9srBC8UtFlra7QT3JlouRKosm41kKA2VZ5Ke5n7RPg9UIriygP7xYlDzDfs3A0MCB+VtVIEWOc/ykQL1BrfKicrWgiOrD9/NV09H13kimLa42c7KKcvRvtmfBPF+rSCJ9ujoR3rfmcLHDiJ26cK24zNkpHFkhe/HiHXrtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSl9sjk8HIvJOLdERy/twc/I9+KzzpsWBWor+ZEU1tM=;
 b=Iq/0ubU2ntnrDBJQpt7TMnfj7eM+gljTpbJY29gudSnzoaAJjcHrIDYRXwUdnpk4v32GAyi6qAoJrVGYqiOqXoH/T/yiEBIgpQbFFqGU+fxpXRaQM+PVnWmGJ7652nrFV0OAtfSEfMhyrGbAeq1EGJYqsDgPZVeXVF0XA6vT/gQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 09:27:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vpci/msix: fix typo
Message-ID: <aZ1g4ymRDo0CXqGR@macbook.local>
References: <20260224030519.27104-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224030519.27104-1-stewart.hildebrand@amd.com>
X-ClientProxiedBy: MR1P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 27390ae3-9a6a-4c49-7cf7-08de737e86b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWtzQ0Y5YzUrN21nZGJlWDNWdlZVSE5jbkx1QW5LYjFmRlgrQlhuRHhSQW9t?=
 =?utf-8?B?Q0dEWktMM1VSbTBRVEdWUWpwNjZQOEMrdUt5aU90ZmVrdHk2TUNPWEJUR25w?=
 =?utf-8?B?M0liZ1g0cG9PNHpFWmlIOG91Mk9CNm9uVXd3VGpQOUd3ZlUxcU9qaFZ5Vk12?=
 =?utf-8?B?Zkg2Vlo4L0FQSjVSUHNqbGRwaUVRSTNvMCtrc1QydjI5bjA3MWRnZHBsWnd6?=
 =?utf-8?B?cjVNdnV6MTN4ZGpwcWlHSTJBaGtkbmczY3owV3ZKb1lPaXFVd0RZNlk3UlZG?=
 =?utf-8?B?MFNCWXFJdk1XY0N0aEh3N04vS2Z5b2FRck8xNkEvK1NLTkFZeHloQURsUVJX?=
 =?utf-8?B?Nng2emVSV1JZOGhyRTAxZEs5N0EyeDVxTEVkbCtSL25Oangwa1RPZGdXdnVP?=
 =?utf-8?B?VlN2L2lZNXFLOVZ1c1hkRjhRUVhBcllqaHBsbThYN2w4Y1djcmo4a0FERkg3?=
 =?utf-8?B?UGROOHZIbnBQNklIQjBiZmZqM3ZRN0diaVB1ZnBUYjVjNFZIZUFqMTA2M3FY?=
 =?utf-8?B?VWJMT1pVSXR4MjBVT0lwQzczcU5acVM1WUhWWlB2UlVhelNwRk50N3hveDVs?=
 =?utf-8?B?Mnl1R2ZVOEhQUC9uQk1CRER4KzZsdE5kRm0yRnRncVFMcGRUbXBoV29OeXd2?=
 =?utf-8?B?Z1VwTWo0ZUFTaTlZZTY4dU9MY1o0d0F2N0pZTEI3a0hQbFhGVVJ3UTNiSVcr?=
 =?utf-8?B?RjFlSjQyeXVsQmh2ZjNaWlJoSkRsRDJNWEkrSUdFNUFSeW00Y1ovTHdzTTJN?=
 =?utf-8?B?Wkhyc1lmZUNtTDlTR2c1SjVtVlhHQjZFWmdxL2w3YnFTUlJIcElVaWF3Q0hZ?=
 =?utf-8?B?cFprYy9BL3UySmVWT3hmQ3pKWk5JRUpUWUtYUFZkSlpvQ0FqMUkwbnFjMXpC?=
 =?utf-8?B?OEM2Sk5hRE1kR1Y0ZC85cG5BZWlIYUdPYjhLYVVMeG05ZW05c3JYYWlGWU5z?=
 =?utf-8?B?Z2tQUjVCbVFHYnhCVC9LOHIrTHQwbVBLelhrU2s1MkhzNzREaTBsLzJzTmlO?=
 =?utf-8?B?YlhDVkdBVnJQeENvMGRmQ1ZGREVQVEFCaDUzT3F0ZTE2Rmw0bS83UFVnTUVB?=
 =?utf-8?B?NTIzWDZwWmZrd2VlbFlCRENvd3I5M3RsbkJOQmlXWHNjU3MxVExHMGlQTVpY?=
 =?utf-8?B?cWFYQWM5Z1pmenVBV0lVVER5bWZvaFFnYVJOSmxWZ2xhUlhubVFJZ0dCVC9I?=
 =?utf-8?B?T0tIS3pFanBSSlJjSzcvYjQ4dGxGK1pYdE43TTB2d0NPUW9tK0J0ZVMwREpQ?=
 =?utf-8?B?YjRXZEtWU29lRjJUcFM5YXBkZEdhcW1TcjJ1SUhIYlJEVWtydzVUaytoLzNL?=
 =?utf-8?B?SjFOMDNIT2FxMEp1Mk5Ld2MyVEdSMDZUQWhFZ000dDMvZXU5QmxJR09iQVc0?=
 =?utf-8?B?cU95RExSbU9abzY4cy93TEp0YXNMc3c4Skw5elljN2JmZW82S0xYWVZhcUYw?=
 =?utf-8?B?NDZPTGFlNUlwYjZWTllwdGEvbk03dGZnVU5wQ28xU2ZBTlh4N3ZMWlRBNklF?=
 =?utf-8?B?ZWZMMUtrQUg5Vnh5dHRPQVRIc3lvVENsQ1VJc3JvaGZXbThMeHEyOEkyZTFW?=
 =?utf-8?B?MFViWDFZdW11TkhjTlJjcG5jYnhsZzZjZWZ3eXNIUVBrTmdNOVVVblZlWmwv?=
 =?utf-8?B?V3JzUEVNWXk5N3VDSnVrbmxhbkZvQkxiM3BGT3AzelErWlBMT0lwVzVGRWc5?=
 =?utf-8?B?Z2dYM2tQdi9OSXBZdzBBdms1QjQ4Tys4c1Ewb2tMVWVJd25HdGlNSll5Sjcz?=
 =?utf-8?B?WWZuUldJTTB2QnhWL2hYQnUvQ2NkVmhwME9vYU1yUnZFTEhTaFkvZGVucFRG?=
 =?utf-8?B?bW9oSGIwT3dXT3hsQnNTYmJNWEFSWEVtcFhIcXdpdlM1K1hWRUMzQndEamFQ?=
 =?utf-8?B?MTF6ODhQT1c3UkhlSDV4V1JEY2dyT2pRQkgxSWMwN1RzcXY5VW9kWVgzcFJs?=
 =?utf-8?B?dXJLK0xDOFh1OWJUZnJBRTJhYmNYOStZSVRzRFN4Lyt2T1AvSnE4SnNpbmxl?=
 =?utf-8?B?c0xBbGdDVngrTnR2U2wzWU40eVZ6NVpxRy9ST3o2QzI4andmd3ZwTXdrbnJ6?=
 =?utf-8?B?bFlTZ1hYV2EzMVoxSk1sZmRMMlJvQWlhOS9EWFN6STF3VzM4dmR4TzNYR2pa?=
 =?utf-8?Q?wxE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGFxQUI4a1hGM2pOKzJwM3lUa3VZa1NSek5LT2R4Qndvay9jQnFHcTNoM1V5?=
 =?utf-8?B?NmN4bUdmMHJoOHNoeTdHdGE3Y3FWYjJETDlscytINXhSSzlHMUpaZ3NQbjZv?=
 =?utf-8?B?a1FQaGhZckZwYWd0cXR2RHRlSGt0NmRQemxzQ1NiRk1ZT1J5M2NDQUNwK0lN?=
 =?utf-8?B?ajZJSWhGSHZVcWNHSS9rUmhRMlZNb2Z1MFFZRFR2OTVOT2lMb3M1QW0zczRD?=
 =?utf-8?B?d3VsMVFvWGl1cjdiaHFRazhzNXdLcWVKMVludVBGdU5Icnh2QjZkLzh4U05q?=
 =?utf-8?B?ZXQrYVV0U3RYZ3VjT3R3V0lSNnhDaHJiWDdCemQ0anlwVS80WVdFUko4TTAw?=
 =?utf-8?B?LzlLaHB1QXRpZ1J6Um9RbkhvaEx6T1N1d204ZUZGZUtCamNOMkE4VUhFZnh0?=
 =?utf-8?B?UDBFNFFoQ2dONitSSHJTZW1venBMK1Z4REYwTDBEd0JYS3Y2QjFMMEw3SnFP?=
 =?utf-8?B?ZzFiNURXc01iV0hlYnRPMkJIOVgwQ2d2S0g4MCt1dE1VSExEVy9EQzQySzUz?=
 =?utf-8?B?Y2FDL05heGpMZ2JkcDVERDZYRk5pcTRqVkp3UzNUMWcxL09kYVZ5aDB0c1Vl?=
 =?utf-8?B?TE4vY3k5bEVXYnlQRWIxYjVEUGVnZzlHVkVHdHRqSU4xU0tHamh2bHpmQVo4?=
 =?utf-8?B?cFRQSE9tbHh6aU5qeGJPWnZoREVGUHlIYTczNXFMQXA2S3FPYmpKMWd4MlI5?=
 =?utf-8?B?RVVhZDBWZXVHTFVla3JMNFVXNmsyZVlnUHFOcGxaajg4TEV6QVhWaUxxMkZl?=
 =?utf-8?B?ZW5ianhUMS93YzNvdkdzWVlrdVBnZWpYTUw0OWU5aW5xS0VQb1FMQUZSTEVP?=
 =?utf-8?B?R2JJVzVHNzkwQTY0dDdzVXBhU3RTNVVJb3Yzb0tML1lpT1JtNEF6NUZnaWpY?=
 =?utf-8?B?c3pqWTNTMzE0cUNpdzRYNGh4TWxQZ3hHb2t6bXpqM3NxbnU1LzlXWVlVZzJr?=
 =?utf-8?B?cGRJa2M3T2xkaXhTV1VobE43d3I2bGt4WThyamVNcEpKR0I1ZFZaNzR6OEdl?=
 =?utf-8?B?SE8rWkRGM1lCditiaTNtRk9wK2JHMGRjRGluNkZJYlhuRjBNSlFPbU11YlRq?=
 =?utf-8?B?UTVMZ0tGVHM5QnlnaFFyQzIvRW0vZ0h5RklTME0zQUVMcjJicFhVNllJTDlF?=
 =?utf-8?B?SHNsc01qUGd1MGxEc1E2MnFuQWs2VXJuSXg1WlJCOUhvdjV1ZjZRcE5VaXNo?=
 =?utf-8?B?bmlBRW83eG53a3pGdXhadHcvK2w4emdWbk10ZDZWRW40RnIyOTNUcHgzSE5I?=
 =?utf-8?B?djJXbTI0QS9qRDFBVFNhdDV1TXJiV0hEWFlQdlFhb25hckpBS3N2SWFCOUJ2?=
 =?utf-8?B?eVNqZUhtYmVZM3IwMlI0a3pqWU5sTVFlLzQzREtqWkRRMmJEbklDUHhoRVhO?=
 =?utf-8?B?QVVsQkFPWWNTb3BrZ0VjVWJTTzlaNG5NWGZnWHBQTVBWVGttMUpRN0JObG5l?=
 =?utf-8?B?eEYyY1ZpUmsxcFlBZ2RJd3c3V2t6aTVLV29MQlNxOVltUHo0UjNrYlRYR3cw?=
 =?utf-8?B?SGJ1MDM5NFgzOXAyQWMyZ1lXaVd1bXh3b3RZUU5LWU54K2lyRFd1NnZ6ajhF?=
 =?utf-8?B?ZlZvUDBrbjVTMGZEZ29PeUFHNXplVU5zb0Z2bjdkOTRmS2xWU1hwL3JkdHRu?=
 =?utf-8?B?c2I3WFlOVjBkOXY3V1hIQURHOHBrbXN5Z2czSEhhc2J2Z1JnaWcvbndta1ZP?=
 =?utf-8?B?M3BDSC9TdkN2Sjk1eHRMRlZ5RlpxMFpuUlVaYVdKNllTQktNNTQ5ZDFsb3ZT?=
 =?utf-8?B?ejF6SFk1a1l3NytxS3BhM1FBejh5YnhMYUpMQXRmRmN3NjhnNHFPTWFISjFZ?=
 =?utf-8?B?UURnNnJTSXA0Y0tjR1NZRUd2M3cwRWdPbGpFREhtYmpoNHNOODcxR2EwZGZN?=
 =?utf-8?B?Y2RWSHU5ME5vQ3VPYllmdjdYdEx1Rm8rWHorSE5kUk1TLzBUTSt6ZFluNEVv?=
 =?utf-8?B?NTkvSGtLUkcxNFFJM1g5eTFuWkU3a0tFblhVelZ2UlR1ZG1ZZ240dmVyUVU5?=
 =?utf-8?B?cTJYK0IxQXRjVVUwUjdkQnlNUU5JaXRIY3FtLys5allEYUx2UldlL1Z6UHd4?=
 =?utf-8?B?Q25hbFFqYlNJV1RMZTBWdzVkT3J3ZkJ3L3NXQ1RtQ092Q2hndFRXMXROM2dx?=
 =?utf-8?B?cDZHKy9SdHBmR2VGSWJWbzlFUHQ5VTNOeWVrUlIwWDE4em10ZHNISW51STVV?=
 =?utf-8?B?M3ZGSDNuUStlU3N2aHhJNGhpZVplY216TGZFTC9ZT1BzaEVvMy83RTViU1Bj?=
 =?utf-8?B?KzNhdUJlRERZQUx1a28vM1VrQUo0S2Y4VlRYdFh0RHRYbTFBUWhIU2V3ZHh5?=
 =?utf-8?B?WUllUE92cVZWL2xqdHQxVG5STVZFMnBtTzc0UTc1RVlWbCtvSi95QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27390ae3-9a6a-4c49-7cf7-08de737e86b1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:27:19.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SSzfTPPQii6Fuw6oLvOzxsf3zMBr27U55o1TBr+ttJbVqyke00Z7nNQw7pif+jIx3cHMr1AtLdq9CoW/r+DTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8324
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0A74F183AA8
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:05:15PM -0500, Stewart Hildebrand wrote:
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I'm happy if you want to fold this kind of typo fixes together with
other changes, if you are already doing other fixes/modifications to
the MSIX code.

Thanks, Roger.

