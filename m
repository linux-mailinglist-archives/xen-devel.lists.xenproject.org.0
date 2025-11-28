Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9FC92E8A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 19:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175073.1499982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3DM-0003ee-WC; Fri, 28 Nov 2025 18:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175073.1499982; Fri, 28 Nov 2025 18:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3DM-0003cA-Sr; Fri, 28 Nov 2025 18:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1175073;
 Fri, 28 Nov 2025 18:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8i5=6E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vP3DL-0003c4-3S
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 18:29:03 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b11f926-cc88-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 19:29:00 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 18:22:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 18:22:18 +0000
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
X-Inumbo-ID: 1b11f926-cc88-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELBDc1vkraVrF1LdakwX4BfneT13B3fyODlqQ7AW5U3JQ2qh3NmsTY+/i7BChNLKeXBoH+XH1GVNyhG2nKefisaCUo2RErqvygKf4Y+Vkn9/f7x4pfbSzdKKnQ66hT0Jy8vxNVlrQMyFfIv0AdPvi1x+pkdAupmYQJrhSifhQO6CdjZLC4UfwlMSYfE3wAxUjV4THTW1V75Kz1b+tDrrGFVjJJFVoloXhgmVlBA9Vis6O5VZR5VBTmqGJhBOmNOf2KoiAV546mJdqIHfrLP+qYMQl4X5tzY7SVgnJi8+NdQlqg7ybIY8AWXCwqJFqahCbTsWQNPqPIJur/iuSipQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCwmK6/kJwXrl662bA8QzX2oJgJ/nrJw66NPqrjLiro=;
 b=KS6cPTYslaMx82V8CVclr5usUelgVDybX3tw1mZOYf1/Dz4ZdEhvuJjTWvNOk6Sm1lqngarBRtu2BelEneudBlXOgbbSfgpoZKM/CUQMqV6CaDXIHcXnmcWNWH73JDo9NBwLb89y7F3+K9af3XxPCSDv15yx/vPKwz7eF+G5qD2cq+ZgzBLnjwY++mfneIN6rgvN5yq3C8rC+tQod57lTx91sq+hoa4Cbl1qCNs/5BFTREV1Cn4+5UCneKIW+9nA7Z5pB6b7APc7lK0vgA9JQW9X3u4TMBBh8BIwNVyArYobj/SyjUCQHI2HdX8J9+Rpq229uUJ+0966/lbCfik41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCwmK6/kJwXrl662bA8QzX2oJgJ/nrJw66NPqrjLiro=;
 b=ZTI/J7nFKwXPFmkp9SZ+yvWVxhf7x9EVfnczHQBTZDDcz65OZjFNsYlSPZityFdDM3wNT7FAYZnyV8MLnMGx1na5OUJV35lmyvWLQjYqOYCA5CP1XfvfxKg4TRiiGHdnYPV+939hx1xzIev3SFViJ4sakiKbjAtarXG2RASkAbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac7c40e6-70d9-4141-bcb3-407e531d17ee@citrix.com>
Date: Fri, 28 Nov 2025 18:22:15 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/efi: Remove NX check from efi-boot.h
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20251127143136.1598354-1-julian.vetter@vates.tech>
 <3653404b-0428-4dae-912f-18c4f8e74853@citrix.com>
 <83850159-6b76-4127-a689-e83a84c71e4f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <83850159-6b76-4127-a689-e83a84c71e4f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: a65105fd-c5d6-4fbc-ad4a-08de2eab10ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDg3UDUwQlZGZkErVGttVEdvb2FIbm5jQytCOENvQXlXUXhZbTN4YUJhenJh?=
 =?utf-8?B?SGpkK1h2TGx5cEF0UmJrRkFjN3dTcm9hUWF0VUxSdWQ1TFdueXo0TjZxbmUv?=
 =?utf-8?B?N050TVRGZG5xK0EyOWtmd1E5QTh5dm0wMTR1cUg5YTFzOHRkZHJVeHE5OWRF?=
 =?utf-8?B?OGVERXJXY0Y1RFUrOW10ZDRNeUgycWIvWVRSVkY2NXkyVDJzOGVROGZxVUlY?=
 =?utf-8?B?eW9seGE4U1pwSEpkRU44UW1WUm1wd3NsWFhaMDlFdy9NLzQzWXIvK0QvVzZ5?=
 =?utf-8?B?b3FvblEzMWR2L25EZEJERTFwcXVOaHBXUWo0eVA4eGlRTHgzSzFMYXc3OE84?=
 =?utf-8?B?NWx2K1YyOUdidVFON2xZYzluanhhRmFobjNSOHlKSEhhc05pM0ZqakIzRy84?=
 =?utf-8?B?NHZFM3FOUTZuZUZnakttU2JLV3l0dWpjN0txY284Yk9nRXdBUndndDF5Zzll?=
 =?utf-8?B?dkJSRGQrSzdMbG9IMFFSdzdkdndCYXNmRUtKaFRWcXJkN3g5K1Q0SC8wWmd2?=
 =?utf-8?B?WFo1MVorbmlmQWx5VkVSeEdvL24rckFMa0hoTVZKdHppMjBncTlhbXVTQjdk?=
 =?utf-8?B?UlZhOEl0Wlg1dnVNTnNISW1KRFk4RzZ6c2R6NGxyKzFTekRxZ1c0SFl4a2l4?=
 =?utf-8?B?bnRWT1VjQlErMWR0L0JKOGNGWklFNndocVBpT2NySmhpSXpWdGp4L1VjTHhw?=
 =?utf-8?B?VjJSS2liYXFYRVZvVUF1dHlOa21uN1FVVlRwWnNMS3JtSHBEU21Bc1NMRzlL?=
 =?utf-8?B?OHVXN2ZIM1lLcS94TFZDN2lFWkNGeFZvb3R4c1RTam1kNW9SanV3YWVVY1FX?=
 =?utf-8?B?K3M3cG03Q2dxSHh4TDVhUHc0cmJlczFsV0lsN3d2dXYzb0hoQ0xid0lJeTQw?=
 =?utf-8?B?ZUxnbzRPSUpZM3VHRVVxdlQzeWhycFd1dThkZkFFUDRQSHVySEpCWGFPUnVX?=
 =?utf-8?B?MldtcnFpRkdnTG9HbmpseHNpTnFhcHU0TmJEUzl2Sm5wbm1xZktXZGd3bGtn?=
 =?utf-8?B?aGprTnRpaCt2YjcxOS9nbS9tcGdFRFh2UXk3WHphVXRFa1JuQzdYRTB6REc3?=
 =?utf-8?B?endQUmJ1WU5DMFhJT3NQRUVOYmtXUm1QcXIwUHZJVVJEbUdVazBmWmxQTEF6?=
 =?utf-8?B?V3FkN0lyamRGK0Q1YzRBcU9Wazd2cDYwVXh0YXhDejFDSjl1V2krcGkyUXJt?=
 =?utf-8?B?czdhWkN3L0gxMDRBbGN0MmlFRmlGY0FQbnRZaGhvUUpsWmdqR2FTL1NqTGpn?=
 =?utf-8?B?Q2lVanF3RGZYVnBKSVV0SkhvS2d0QTB0WU1VRUdaZW1iZWVmZEFVcS9KemxC?=
 =?utf-8?B?dkFyWU8wS3BLMTVWQWtvb3B6L1ZUV1hLQjNaWm4zZi9veWY3TDc2TEFEUy8z?=
 =?utf-8?B?TXlBYnZwd0pxeHY4bXMwZUJ0UEVPdjRrNFVsMjdkYk5XQWc5RFJ1QUFTMVJn?=
 =?utf-8?B?N3ZnY0duRzNSUGNWWlZMemQ2aGs1bHVXU0ZLcmhHT0VHNDBtdlkzdmZ1aUYw?=
 =?utf-8?B?UnhqWDRLbHVuczhJOUVRc21ZZVdTbjljQzhZUStnd3JCNjI5VmJabUpHZE1E?=
 =?utf-8?B?cFk3ZmpSQXVxeWFCNFJOaElvZEEySUc1a3JERnFoN3IvVEdYSVFDZUlXN0Z5?=
 =?utf-8?B?OHpRaXFWMitBTE1FeWZrWlViRC96RWZnamp1Z0Q4ZEVjN3RwM3prM0pGQWo4?=
 =?utf-8?B?NmozSXh4OFMvRjNCOWhFbEtRYUhHb3JJR2llU0tDcDFPMGJPZk5NWlQ5QWpI?=
 =?utf-8?B?UGl6MkM4ZFlJMEpCa0NTWWFjOFJqM25CMVFaWStVVHB2NDJaN0NsN0twOEFz?=
 =?utf-8?B?RkwwRjBwMzZrM3Q2aHNpaTEyS2JRbUtwV0ZOeWtUdGxuNVV5ZkFDVkxMZ2Zr?=
 =?utf-8?B?U00rVmVuQVYzQzBtR0RicEtua3NXeDhwdVNvby9YQWdJNkhGSlNCaUI0WHlt?=
 =?utf-8?B?TGorWWpIUk5QOU40QW9XMVY5SjFhL3F4dEFZL3FQdXQ1bEt0bWErSUV0M2pQ?=
 =?utf-8?B?OXNNL0hBSVVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTl4SGJsMU9jTUhnaC85cjZJdzNwQ1prMGgvQ1Y0ZHlGVEsxS3NwQVhYWmxl?=
 =?utf-8?B?NmxNdlJvL1FwV0VrVHZtN3Ezc0UvTDFQZUYzbTh3OUNIU1hhQW55Rzh4eWZj?=
 =?utf-8?B?UHUvRXJ3bEx3NXU1MktOd3NBQjZQSm9WVHB2RDZzVldzWmV4amhDbUQ3bFRL?=
 =?utf-8?B?TEtoeHlZdEsrVHJCRytycHZuZkZiSXBhckZ0Si9JSlQyOXNyeFc1c293MnhP?=
 =?utf-8?B?RUpQY3R6cUVzRVVFZUxvdFBoellWR1dKS05DWjR4TjdWQlJCMzBmQlZUbmJR?=
 =?utf-8?B?aEFHeWJ0NWFvQmQ4RFhITm96VExyNWRBa3l0NEhDazZjWDVFSTVaaldSRk1x?=
 =?utf-8?B?WHZoMXlzZlE2dTVpaFBkVURRekhtUHVOcDczYVIxNTZMdUpFOGZtb1JJZHVW?=
 =?utf-8?B?WFlJMHY0UGpIdjhpQ29EdXB0NTNSQjR1dGsyRXVuUGhseWZIa2JyQUVMUTZ0?=
 =?utf-8?B?NS9ObFNOeVBLMEhXU2F4VnIydUpSV2ZWMGNWYjNidlZ6SExWYVFzVUNzbDFI?=
 =?utf-8?B?ZUw4cXFQT2tKRHJKUUZrODNoM2k5eDJoYks2SWRhSTVNM2R6c2J6b3lUZysr?=
 =?utf-8?B?aGZtMTU5YjV6c0lOWlRWV2YvaFJlSk1IWEpQcDNjNE9DeGlFYkd4WTI0YUZZ?=
 =?utf-8?B?djVOSjlkcEFHdWxpMW10TkVzM0JzenJaQjdhSENZNEJuSjNHbk1kQXk4NUt1?=
 =?utf-8?B?ZGZtazA4ZHpZRXVIOENLUkFLcGxvTzlrb0hwLzZETnZVZ2RnaE9wWFZycFcx?=
 =?utf-8?B?eFhJMmhsOXpYSUNBYS9EbmpMN2l6VGZPTDk1R2dUekR5VXBKek5NY1h5ZWdo?=
 =?utf-8?B?Q290VHdCK1l1YThZTlNzWUI5eUpiem0zL3h6TUFqVTB5ZFFiWE9kYS90d2w4?=
 =?utf-8?B?dGZjT1RtNThmdnArdGM1QWNZaGppY0VCNjNLVHlYQVFHYVRrV25IOUpVWlhj?=
 =?utf-8?B?b21VNzFlMytPaVc4dFJSbWk0RTg2Vjg0ZVZKQ005MStWT1NuVEJyeVpQL2Nu?=
 =?utf-8?B?aHRtR1J0TU1VNm5Ic3dsc0xEMDQ0a1FOV0sraVhuejE0QnlYNnRqSVNCTzYr?=
 =?utf-8?B?UExINVM5VEVvLzNObU5CNWwvdG91QnQvNGRPMXVnUlhxdVluNi9MVVE2VjNO?=
 =?utf-8?B?M29VV3hJZVNNQWRtMGZjek1uaWVPN1E2cXl3Wk1yZThhZkd6bFhEdHFzMGZ5?=
 =?utf-8?B?UDFrYW9UR0ZycFdIaVI3dnp6YTduVjhxNEJUVCs1eGtMSmVjS1hIL2hsNmZM?=
 =?utf-8?B?RE1GSVp6TFpOTFh6WUc1V0VkUXdOVEovVVMycjVtRmw3eWlyMDVldmdua1hR?=
 =?utf-8?B?YnRpNDVRb0NTSXJyQUZjT01XakVUdk9mb21CZGt1WHRnamJJVWFja21jSTl0?=
 =?utf-8?B?TUplcDVMcTdNOXQ3NUZWcGVWQmR3TlZxOGdQL1I3d28zZnUwaGZxY2pLK24x?=
 =?utf-8?B?Zm0ySjN6NnEvMUhqQktVS0ZacGF3OG1iMmM0aXpXUG5Qd0RPRVplZ04xN2pZ?=
 =?utf-8?B?YWFjYmVTVjYwZ3BOeXVuM05xR2pzcWg2YjZETUN0UVAzYU5jK040dkZkMjFD?=
 =?utf-8?B?VmpkZi90SHExMW5mRVlhWDN1UlBKUFV5V2xDbHNMVXUyT3JEWGhFYnM5VFFs?=
 =?utf-8?B?VWhST1ZjaGFlcGNsSU1Cajk1Vm5lVjlMdFVrNVZmekE3N2ovS3V3OUZ6cHZm?=
 =?utf-8?B?czIxbSt3VTZXKzI2R01SY3g4dmh2VkswQXJ6UFhNQlBPUEVWTVpsY2phc2Yz?=
 =?utf-8?B?VnNlK3ZFOG05aUhmU1Z6OU1MZ0ZJQ1ZmQzk4Y1BSbW9ESXUyaGRmNEY0OENh?=
 =?utf-8?B?RzhDZHZzQ0RQcnhnNkdBY2dqQXVYVmFHVHBXdlY4bmlyZHI4QzhCdzV6aWpZ?=
 =?utf-8?B?UDR2djZmZkxaOWZNeEJZT1NQSitUbVZBbXdTVDFmQjV2SWdObXRCRkZuZHRH?=
 =?utf-8?B?WHNMOGZjMkVhUEpoeXAzOTJmdk5BZ05waDFsbVIvdGtPUFB1OTA5VFRSRkFK?=
 =?utf-8?B?Z0RQTFFsOVdwSzZhTnhoRm9uaEZ0WHNnL2pJYy8za2EwcjF0N0Y2aGdQVDJ3?=
 =?utf-8?B?dUZNczZSSWg1K1ltUW52OEZnYmtEa2JCQVlvY1FiTktRZXFmajZ3WFVaTjBU?=
 =?utf-8?B?QlhFNG1tSXh0eU4vMVByV0hqaEhKUXcyMk55a0szNU5YS1NGOGptRTNyQmJR?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65105fd-c5d6-4fbc-ad4a-08de2eab10ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 18:22:18.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0UKBenWdjdB0qp4EUA6CYSR8DLZ/cbKp56BQCL0PVAJx5H0Z9x+iSZqaBkWuRw3Q2O8zV0GG3Ja289hGx2tCKLDxsW1GO27vrsZtiW5OYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289

On 28/11/2025 1:19 pm, Julian Vetter wrote:
> On 11/27/25 16:20, Andrew Cooper wrote:
>> On 27/11/2025 2:31 pm, Julian Vetter wrote:
>>> Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabled
>>> and the 'CONFIG_REQUIRE_NX=y' fail to boot, because this check is
>>> performed before trampoline_setup is called, which determines if NX is
>>> supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] = 1' (if so,
>>> re-enables NX).
>>>
>>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> Lovely...  This isn't the only bug; there's another one from the Vates
>> forums about AMD CPUs which I haven't gotten around to fixing yet.
>>
> Thank you. I will have a look. I haven't seen this thread.

https://xcp-ng.org/forum/post/80714

But the tl;dr is that AMD have introduced a firmware option to disable
NX.  Unlike Intel, there's no positive way to know you've reactivated it.

A conversation with AMD has revealed that there's no capability to
prevent setting EFER.NXE, and that NX is always available in practice. 
I'm pretty sure the firmware is just clearing NX in the CPUID Override MSR.

However, to reactivate this safely, we need to do a wrmsr_safe(), which
means we need to delay setting NXE until exception handling is available
which is rather later on boot.  There's also a tangle with the
order-of-initialisation of the CPUID Override MSRs which I found
recently while doing something else.

The other observation is that, even on a STRICT_NX build of Xen, we can
boot into __start_xen() because we can't insert NX into the pagetables
that early.  In fact it's quite late that we lock down permissions; see
the calls to modify_xen_mappings() in __start_xen().

Given that we need to be this late for AMD, we can also move the Intel
logic later (effectively reverts part of the original work; sorry
Alejandro) which means we can also use safe accessors, and we don't need
to worry about the divergent early paths.

>
>> Do you have any more information about which system looks like this?
>>
> I'm not sure if I understand your question correctly, but I was just 
> booting an Intel based machine newer than ~2012. I have tested this on 4 
> different machines, on which 3 hit this code path. One was a HPE 
> ProLiant m510 Server with a XEON CPU

Broadwell.

> , second was a Mini PC with Celeron CPU,

Sorry, not enough information here to figure out the microarchitecture.

> and third was an old Intel NUC DCCP847DYE also with a Celeron CPU. 

Sandy Bridge.

> The only system where I couldn't reproduce the issue was an old 
> workstation with a Gigabyte mainboard. It has the flag in the Bios to 
> set MSR_IA32_MISC_ENABLE, but I'm not sure if it was actually booting 
> via UEFI.

Same, not enough information here.

But, it's clear that Intel's XD-disable is still honoured in EFI mode on
a wide range of systems, and that we need a fix for UEFI.

>  I will verify this on monday. I booted all the 3 other systems 
> via UEFI -> Grub -> multiboot2. My grub entry looks like this:
>
> multiboot2 /boot/xen.gz dom0_mem=2656M,max:2656M watchdog ucode=scan 
> dom0_max_vcpus=1-8 crashkernel=256M,below=4G console=vga vga=mode-0x0311
> module2 boot/vmlinuz console=hvc0 console=tty0 init=/bin/sh
> module2 boot/initrd-dom0
>
>> trampoline_setup isn't executed on all EFI boots.  I had a different fix
>> in mind, but it's a little more complicated.
> Aha. yes, I didn't thought about other code paths.

https://xenbits.xen.org/docs/latest/hypervisor-guide/x86/how-xen-boots.html

Here's something I put together to cover some of these details.  But,
most of the detail is in the source only.

~Andrew

