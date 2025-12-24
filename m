Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53379CDD0D7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 20:41:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193147.1512139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYUj8-00086g-58; Wed, 24 Dec 2025 19:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193147.1512139; Wed, 24 Dec 2025 19:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYUj8-00084H-1F; Wed, 24 Dec 2025 19:40:54 +0000
Received: by outflank-mailman (input) for mailman id 1193147;
 Wed, 24 Dec 2025 19:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdbR=66=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vYUj7-0007pC-66
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 19:40:53 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73eadf0a-e100-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 20:40:51 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8045.namprd03.prod.outlook.com (2603:10b6:208:595::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 19:40:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 19:40:49 +0000
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
X-Inumbo-ID: 73eadf0a-e100-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNYSBPm5XghbdV784WDNnxii09yXwxm4RkNLg0anI/GC0D6nHWLePAvJMxlwGqledod6qNM2LhVdnb+E2Mb2pgIISrQRQiMWTed4E2UiHqnEwuPOp9Ivz/xeiswAiPkrXvEye254DcdHMGbhpnAl5CH8XWYGb25OmvHXO8ofoWRpFrF9H/9MtcDnGYzQb895DS598y/A9KkLcvzdbcgmOhp1xgBuqARdwThOGXJtVQ9Sq35JDocOzeFrE+5/yNwAUNQaTrZghdXHtvr4K1wWgix/cHoc0SWC8yWWIZ7PjS18EKI5nUg1DXiWpUpk9YyJBMRaIsD1zffYevNKmzA+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibB7GBK4esDTfWKH202Z+KOXHrBuNaaGhAz82G4CK3I=;
 b=WT4Ec+09QQLEZ8+MvDNWT0DAU3awFSGLSn2osx5JElnTYh8Wr2DwVazNtVjzLENQMdWh4vq6+KhWRkb6HStbSyf2WJXOKw7pCJVu3NUvxhIJGVMMCMsXDxH2QiRm4mXf/O/1iwLGzJiRSHmvURSDpgpgD961oY1Vhlo2DgHpqDehASp4awOl1vqOkXJ0OHOrNhPB8GfrXuwtW46MBPXk20He7lzMYNMN7iJfxBJy+sOurhQak7vNP2NtI7vB9liAYaUCCcwudlNeIXRoENBAMK9+hNVKaas7VjcoBpITfKVNSbIKia/pPGYm9VYfwDXEVg+WnFojd21yNAIOAb9jFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibB7GBK4esDTfWKH202Z+KOXHrBuNaaGhAz82G4CK3I=;
 b=smo1jFD6gl7LJuxiNQpAi/JjBTH4XMallSQBPqNhfinQW9HLhOYcmHBDlCHGy/XTN5salp+duWlwft1675Au2kbKIfkiwoB9Wl+/1KSkKCcOvnQrDn33f3PsGNT36Qq4vIykpbZBJCw3jqHg5yKl7SRr5swA9CHywiYsVba6yqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] xen/mm: reject XENMEM_claim_pages when using LLC coloring
Date: Wed, 24 Dec 2025 20:40:35 +0100
Message-ID: <20251224194035.60173-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224194035.60173-1-roger.pau@citrix.com>
References: <20251224194035.60173-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1e600b-fdaf-403f-ed99-08de4324575e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWRhSVJNQlBOTmo4V3lZWEtINWVEbERXc1V5VUJ6NjN6TTd3bzBEMHNObk1K?=
 =?utf-8?B?SU5nMDBvMU9lSUplOTVUa09mb21kd2kvSFplaVMzU2pGZzdqWVBrSnU2eWF6?=
 =?utf-8?B?UklwTnRTanZNNTgvclAzM3lrOVBmR2dsU3lMUXh3aEFSS0ptWkk2NERnQVIz?=
 =?utf-8?B?YTQrc01lZ3NNeGNTYm9lUnQ3UTc3L20zNmoySmNHbVpLM2pFUS8xNVlyanM1?=
 =?utf-8?B?VlVOallXRGU3dHlucGpCN3E5clRBNG1JOTRBMzBYM0JSWnc5WEJIczB6elNW?=
 =?utf-8?B?QmZFWHZ2dEpHVjRMRlgxUXdTalpmWHkxTVNTMk9LemtzOVdZQ3JXMW5aSXFR?=
 =?utf-8?B?Q0piczI5cjFSMVRoaXZwSmZMU0w1dkovZGJQQTE4L0QzL2E1OE9SdUd3Zjd6?=
 =?utf-8?B?RlpEV2R2NTdiYS9LNnFmejBPWW42TFljdDNzcFk3cG10V2xqMUROVm12Mm5a?=
 =?utf-8?B?aDY3ODVvSUtIaStscmd2aEZhVDRDU29GTGsra3JoR044aEdXa1BhOHRhUG5V?=
 =?utf-8?B?bGl2VEZCdGtydC9Cd1hDcW1NSWpNdVJDUjVWSTZDVDhBTGhPcFNOM2lXaDRD?=
 =?utf-8?B?Wmk3VlN4SXFaMHEwbkdLVXMyMDFuaHZ4a3JsYmtBR05HNi9kZTkwbjcvS0xu?=
 =?utf-8?B?c24rNHc5RjYxdmdKV2E5NzdjV2dHaFZOQ0ZNMyt1UzNob2VxU3plckVQL2Mr?=
 =?utf-8?B?TlY0YzF0NnNrQk1lK05Sd0NaeDMwSGZHUEZyU0k4VEtKalJRai91K2Jxdnh6?=
 =?utf-8?B?S0FiNzZBZzBjbGxDSU14OWtKelJzQ1BiN3NWZ2V2ZExjTS9tK2lpc3Z1UXBI?=
 =?utf-8?B?VGhWNGI3eGpteC9rVzZhcUd4NnJ4Ym1JNWoyZCsrQ0N4ZXU3NXV3VHFhT0ZB?=
 =?utf-8?B?ZnM1MlQzdEJERnhML29xa0hvdlhkTkhUSTMvSE13dEFFcnBMb3pib1RvSUNE?=
 =?utf-8?B?TlcxK1FIN1JjM0xJMnFSbUEvaXBjODdOSWVnMldOUTYyZ1l2MFBMOFRESGVp?=
 =?utf-8?B?UFFSVTFRV2Ria1NpdFh1WThjMUFvY2VPVnVoZXdLczJCTGc3UEI2QjVpaTRz?=
 =?utf-8?B?QmQrTm5OWVBhYnN4cGhFL2gxWExkOE8vN2dCcGpyRC9yVWxvY2pUZDdvck85?=
 =?utf-8?B?Y293dFBNcE1GdUNLTGk2eG9VQ0o0a3FHUGJZa1hRMVlzOFh1R2tpNzVHSlVE?=
 =?utf-8?B?OVQzTDAvSFN2L29NUkFZaURmVW50THFSNlN1ei9SVUllamxPR21iU25keVVm?=
 =?utf-8?B?elMxNUlaZDZITWNPVWxhT3Y5bXVtaVltTXZaZjMydWNGNzFJa05hYnNrenBm?=
 =?utf-8?B?ekp4ZzFqdjBoZWpyQ2c4eEY5VERUcGZLbjBUZllXMlE3VWRIUWYvSTQ2M1Rn?=
 =?utf-8?B?UzFoS3pobC9WTUl6UjhFbDdmZVpNUmdpeU1YUmNxMmxXbFZoNlQ1emJlRlNY?=
 =?utf-8?B?NFJqUVhtWnJQVzlWVHBLdGJCbnRHaldGbzVoMG4xZE04QldsQjRiUk13aDRn?=
 =?utf-8?B?U0VyVnlieDhuZ3ZDR3RiTXRhMG9SUlhaV0o0VEwxYmRPQ0hTd2ZyM1hydWwx?=
 =?utf-8?B?cmliOGYxZVBDUTJBTHVYMk1QZ2JSb0hyL2Y1M2dzOUFSWCttQ0t0ZmtjMHBx?=
 =?utf-8?B?ZExiZnpBd1N4UGhjRXZIZ21ldE5LOTJSUzBhVFAzMUpxMVpCNDRoMGJwbzJS?=
 =?utf-8?B?blp6Qmt6VHZJVnd5SU9IeHFXbzBveENjRDdpZGRydzlaYi9TNVNpQU8vRTRQ?=
 =?utf-8?B?UWw2K3Rtc0dJSHhLTUIzSkhMVi9iYUxyd0FTWnRXeEtaZUFjTDhrUDRGSThL?=
 =?utf-8?B?bCtYaDNpenMvSEVoRS9SY1NqVEFDRVB4bmwzd205S1MwWncwZk4zQmdpdlQr?=
 =?utf-8?B?VGpxRUh4Uk1vU08wM01PNG1kSVBBYnZaOS9WRFp6RXNlS0t0ai9jTGs0dEJP?=
 =?utf-8?Q?1BIcQKz16C8WxtVZreAncO/seJnxU5vW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0l6TDRiUXlQUU5KcytSYTRvbkkvVmpXbGFCSk02MTIxWlZ1djEvY3dzYmRy?=
 =?utf-8?B?cmw4SkNqclR0SWtJaHJYVHRZSWlZOGgxRzVMT3pPWFBhZy9VakJoYkExWTlL?=
 =?utf-8?B?UjZLQkhlMTJ0ZWxZd3RtRnhXeDJNMVBneTJvYVBmT1ZzYWZmRVBNdFlaMXFK?=
 =?utf-8?B?dFVRYzFEd2lpVEpNQm5MUTczTTJmb2dvb0I1ZDI3YUMyazlvZGs0VWREVVlS?=
 =?utf-8?B?aVVRWi9yZDVORlZ6ODJsTmo0ZmhTNFkrV1hFeHpneko5NjRpTXppT1ZtNkJo?=
 =?utf-8?B?NFNpZDh4aE5NYTJKNzhGNEpBUjErQ1BmZEJCeHRrRUpUS2Vqd2p1UlBKRllY?=
 =?utf-8?B?bXVLSkFlY3N4anVUZHhhK3JmT24vdTNkalREMmpMeGZnR1BQS0lDN3lZKzho?=
 =?utf-8?B?MFpSdFZkWUQ4QkYwY3YwdTZkOWJJN3pZU3BLRmxvRzMrd215bjEwQXlFNjJV?=
 =?utf-8?B?NnRiL0E5UjlBelR0OEs5QW1zRzdQcFZ2ZjhVeGFWTUViOW5SLzVlNVRsd1Z4?=
 =?utf-8?B?Y2djc2R3UmRYWDUyMklLeEVqaiszWlVnNTY0TkpqZXcxNFZ1Vmc3K3FIci9z?=
 =?utf-8?B?cDBmaVpOaEhBUytZd2FHN0pQZmliTVVnZjdUdUNIZk9EZi9ydU9ob253WkNP?=
 =?utf-8?B?d2t3NnJYbGxLNDRmQkdkaVpnMEdjanRhNVlRNEY0RDVQSXNGT3VDUkdwcmVT?=
 =?utf-8?B?TWZIU1d3SEJnMU9URXNsOENRdnZmekgybTg2eEhycmdPR3V4bWptYnFZZEZ4?=
 =?utf-8?B?VjZHS2hiOGlMSzhzM0dGb0piMWQvcjZEK3QvTVBWSXRVYi9aY0RPTGtLSEFn?=
 =?utf-8?B?STJLQnhwMndiRnZKaDhOK3Fuek0yV0trc21Fa1haSW12L3lGaVNRN21jc1c1?=
 =?utf-8?B?QVF3Si9ZYnhiZERONnowK3UrTlN0TDU4NnVlbkx6SmRWTGw5czJZQ04wMXFs?=
 =?utf-8?B?a25TRUExc1RJT2VlT2hiZHdJcXFTc1Vsb0Z4cnJYL1BQVWRGZ3p1c0tzNE5v?=
 =?utf-8?B?QlNnamt1SWdCc0phczNSckU1WlZkelRhYjdpbVljcVhIaW42ZW1mWnIvMnJl?=
 =?utf-8?B?VUdFcG0xZ1oxN2dHdU9Nbk5XanNQdzFuSXBQcGNwRk1EcTc1aHVTeC9YTTZ2?=
 =?utf-8?B?QUF5NmVkcXJnRDNNVlByblBwRDZ6b2Zoenk5Rm9XS3BYcmduWEZPb25iVmpa?=
 =?utf-8?B?a1ZRNzZneVRrTzVKRFAwcTE4SG1zUEdTeEdEZDl0bkVZempjNmdZVnVFeEg2?=
 =?utf-8?B?T0prOGRWdDR2bHNMNUVLRm1GMGpoQjBrNGlMdEk2bzNlSEdJdFN2UW9MZGFC?=
 =?utf-8?B?RU9hS3gyRUhBcHY2VGJleXc5SzEzbzlhZ0xBMXcwbFZaNmNDODMzR0doQUQr?=
 =?utf-8?B?NkJRWnhOVERnYzhUdFFqZWtDaW5OSmh6cU0wVTJQWGhWSW51UTNDN3dqNU55?=
 =?utf-8?B?RmRqRVRPd3NBcXE3UlkyR0NKK0N6bDB0T2RUZUdrNXlUZGhVK01sREhjaEV3?=
 =?utf-8?B?ZnlUei9BelpIb1BXdWNaYlhqRmFxQkVFTVY5cGpYQUVPWDg1RzU2MnZsUkdr?=
 =?utf-8?B?WGtpMHFZNzhKcGRTY1dSYnpYVjdNVUg2TjVUMkJhK0dJSytMTDZrUFFsK2t6?=
 =?utf-8?B?OU9kL08zYWRPQXZ5MU5FNE82VmRYc0hDSGM0cHVRSjhHQUZVZHFSSU03Qmto?=
 =?utf-8?B?ajFRd2tPd1VUdHFlZ3hyUEVJYlRFLzQ5WUt6SndwYXZzb09SMDZTSk1DSEln?=
 =?utf-8?B?SVZyRzZCZUY4emF3NzRjZ2o5RTlWK1RRaTMzT0ovdW5VZmtwT0MrY3pBWS9t?=
 =?utf-8?B?RDNGMHJ3Q0JrZVBUcVdiSGJTSER1NzZmNFArTE5uWktYbDlHOGp6NUtsMWU4?=
 =?utf-8?B?dSt6cGhvTklibEZyTE14SUJ1ZU5LUlI3QnRCQWFCUGNSTWg4YnY2V3Y2blRp?=
 =?utf-8?B?ZGx1RVEwbUxxVXR0SGJZVnptYjNndE91S0c5YkZvN3lpU0ZYakdCZ3VUdUx2?=
 =?utf-8?B?anJYbVptY2tGdU5WdlBqb3l4QXc0L2U1QWdZTXltN2oyZmJYMk1ZYzJna0xZ?=
 =?utf-8?B?azFDSzJZb3ZUQ0NRRCs2dEtEdjM1aFA3K1doTHlFcVR1TjU1d09kT3FQZ2FS?=
 =?utf-8?B?WC84VkZrSklrUHZpcWgvOU0zTGZ0MjZuZFBXb3dmeHFTNUtKUGE2VDlSMEFZ?=
 =?utf-8?B?L00yS1R4c0VVWllLSzBQTTQ1SzRNck9aMDY2cGZiQjJnQi9WZ2VRcHVXR2V3?=
 =?utf-8?B?STRiemVJanVNc1ZicXN0MCtaV0tZdFRaczFjek5RWDlOaHZaZlhGd3FVaFdt?=
 =?utf-8?B?SU1NVk1QMkdvMmMwNzc0dytPREwrODBKeW5hU3JjNWhWUTZjQ3dxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1e600b-fdaf-403f-ed99-08de4324575e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 19:40:49.7646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5su6wauNT2RJg3wNk948VCiSjISZFhLhIHEmIS9uYKkA+HW/WS4TSFJf5ceZosPGCaFaSkPQEEqBsEI4PaZnGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8045

The coloring allocator ignores claims, reject the usage of the hypercall if
LLC coloring is enabled.  Note that the usage of alloc_color_heap_page() is
selected at boot time, and it's a system wide decision.  Once enabled all
domains will use alloc_color_heap_page() for allocations, which ignores any
outstanding claims.

The hypercall can be enabled if/when LLC coloring is adjusted to support
claims.

Fixes: 95debe51a936 ("xen: add cache coloring allocator for domains")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index ae805ccbe4d1..3d978227276a 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1660,6 +1660,9 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
 
     case XENMEM_claim_pages:
+        if ( llc_coloring_enabled )
+            return -EOPNOTSUPP;
+
         if ( unlikely(start_extent) )
             return -EINVAL;
 
-- 
2.51.0


