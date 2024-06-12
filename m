Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DA7904EC2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739019.1145916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJxM-0008IV-Sj; Wed, 12 Jun 2024 09:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739019.1145916; Wed, 12 Jun 2024 09:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJxM-0008GO-PT; Wed, 12 Jun 2024 09:07:48 +0000
Received: by outflank-mailman (input) for mailman id 739019;
 Wed, 12 Jun 2024 09:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAc7=NO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHJxL-0008GG-B1
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:07:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a9ce332-289b-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 11:07:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 09:07:41 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 09:07:41 +0000
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
X-Inumbo-ID: 3a9ce332-289b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNg0Y8iq3ODO4GlZX3SO84IEVp/tJyJvHJeI8Y0HPubc1i2hL9HSvDRDb1m1K/VLRJVpChiqV4GKsNHYTeR5uBf9LsrOXDjd5odUfXr4mIv2xG6aya3dh0jHjYF/306jjnnXmCH00hZylpCy/zyLtrXWGjuKlA904DoUNhdreqgADsIvI60CZsHyhAlyLLbLd6FMT6BwvuOZgOtMVOo5YGjj7V+PlQhIE8OjwOq5z0mdCFMkAjwIHzseh8FnWye6iZSLGP4hQd+8KdV4f6Sc4iHwxAWy/sRBKfO3ErOvqx2QVR5T4/9bhmk24VTE640ukD/Y5nedu9z8UGvtAOBoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU2ATdsX0Yzo7wY8o3X6Dp8VNRgdUums5xFQ35452tE=;
 b=WK/QszVatm5jV/I5+ISwmHRS4Wbll7tFC50tV5vP+8ITMp/HBK0VBc53eOt3F/X8FEAri26GG6r7btZf91xqZwpAZCt+fIMSK0k5FYCePrJlseiF9IJzGpQV0fiqQ6evkrYvFKU062+xMdQUJZ0dcpAmwLIVwbddalniyNms0vYwHoyQr/ujGVYd+oxAubMT6qKX7vSQSoTs3OLq+sY/tGxpeyRJCdJe+Ng4uMY5aeIVH22JuTEUcUDsLB4IeFmYja8X2v4NPxoDlR1memnPBov0DUq1fyXN9+wHZ1MC1BrvQmuXO9DzfXNu79ygkiPNHV9YCbJiIPonTDFFeNvsrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU2ATdsX0Yzo7wY8o3X6Dp8VNRgdUums5xFQ35452tE=;
 b=OFow5uJiGNsuEUD0tUfC1Z1X3l/Pnlb+scWgVdbqwQId9RikTOoauQmDb7yQ/PZ+7lpJ7zwv/E1VNepNo+AuIYWnLIsztNHbpmSVpYmCndTiZ5cHvjFEc53PHDsMvy89eiEzqyI6Sdgc2JghOi21nSwmsDzXX2YwG0d03Nbs2kM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHauLJgk79xZtykz0GMHuXNeMsUFbHBLLUAgALK4YD//+MLAIAAiCyA
Date: Wed, 12 Jun 2024 09:07:40 +0000
Message-ID:
 <BL1PR12MB58493C065A5CA4FF2A9C03B6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-3-Jiqian.Chen@amd.com>
 <efc35614-561c-4baa-9d94-d17ecb528a4b@suse.com>
 <BL1PR12MB5849B1B536BAD641C37A4308E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <41905257-e2e6-4bce-b723-516916448dfd@suse.com>
In-Reply-To: <41905257-e2e6-4bce-b723-516916448dfd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7537:EE_
x-ms-office365-filtering-correlation-id: f93d5200-bb91-4881-935d-08dc8abf1d25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|376006|7416006|1800799016|366008|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?anRjbVZ2SWJDUTJLZUE0WGY3T3ZGdUlpV29zSStoZElXNmZuQWhuTzJpVjVR?=
 =?utf-8?B?WGowUmJLNlRKdGlpK04xREcwdVRRVWJwdFpJTmt4RGprSlh3Q20yQlpnUVg0?=
 =?utf-8?B?TUhuSk1jM2xhT1dtTUpsbG43NGlRWFVtYUlPalltWkZZS0FHd1l2NVJWdjVs?=
 =?utf-8?B?Y1d5ZDZVdGhCQWNnMXVCZkc1VkQxV0hVQmZwK1IxNmJNcjhHN1VSMFJpa2Zn?=
 =?utf-8?B?Wi81ODZzMVMyOG1Ga1Rxd2FPT2RXdkU4VkwwUjI2ejNNNS9WazdyWlNUcHlZ?=
 =?utf-8?B?YWRibEVtd3R4VzNvdEV5anQ2YUZCUVZ0eTIrY29KUmVUZmpHS0dNeGc4b0lD?=
 =?utf-8?B?UTFPdmhkb3NxbDB6d0ZHYkJzVXZvOTJVUzJOQklCQ3BBb015L0xTUzRJczR1?=
 =?utf-8?B?VldoSFdZcFdlUjZrT0lpMTNnekl6bm5BeHdLamZ4Mnk1ZTdSTU52VGxKUnVk?=
 =?utf-8?B?ZW1qUVZwY0xtYy9iTGRkRnpIQ0xzNDlodWtROXhDL3RzUU1pM3R0eEVHd3F6?=
 =?utf-8?B?ZTZKZXhnaEpFRmRTdUdkZG9kS3dsRE5jMkxLWElUY1F1VVFEV1l2c1djd2Zk?=
 =?utf-8?B?aGpYRXRGVUtraVlrN2d2bUVIKzRZTVJRcEx1TTlqRkFYN0tjQUxxNTRBcE94?=
 =?utf-8?B?NHF1dk05NlZPS05yQ3FHTE9hUXd3WFpRY1EzNVp6WTRJOEJxb3Q3Sm84b25R?=
 =?utf-8?B?NW54QXo4WXhBWVJsd2V0NGx5b0JKUDhPcU5NRWluOHFOSmRJOUMxZmdGTGZO?=
 =?utf-8?B?M1FQZXo1UHRacStRdGwyR0dRUUU0RGRCL1QxaVl4ZDZQSW9HdFhoeXJzVDhj?=
 =?utf-8?B?bW5xc0NEOE5NZStFSFpvVTM2YXFrSWczZHZ2N0FaZS9ua0k2WGFlYkZKWWU5?=
 =?utf-8?B?QytBd3dTSWtTRlB5cnZNUzNiMlFkcmREbFF6bVM3VEhTVi9ibGZtcmhENGh5?=
 =?utf-8?B?ejNneFZtbG5aTXMrOER1eDlHdG1SU2xGdVFwd3hOaUFDaHBrSkVUYkl2cnox?=
 =?utf-8?B?R1ZhSkx2NGR4QkhaSHVpMzIyRndUYm52MHBxZ2ZFUHVDbnpMV0VNRitvVTUv?=
 =?utf-8?B?TGZVa2E2V2Z6Z3RjY2RNVmRkUEFEQWdKcGFDdi9PN3RnbVY2T2NubVNyeUFu?=
 =?utf-8?B?MlVlSzZhcVYwYUlET2R6STBYOU15bnFvVkx0Q3pGLzlBZjhmRlFrazE4UGVM?=
 =?utf-8?B?S2Uzb2Z6SFBOdUpPUG9yZzBBUE45TGpGSDBXNjc5YWxUUzlYZnA0NUxTOFBl?=
 =?utf-8?B?aWJMemM3Sm9BWVNJSVlsVDJxUHQ1NmcwVzVyb1g3WWhTOWNIWXNJRkFwTkRo?=
 =?utf-8?B?ckEvSW00dnJvU2RuY05ya0czNW42ZzRleE5HVWJZbGx2Wk5laUpVd2FYNENk?=
 =?utf-8?B?WlVkeWo2VmtRekMweU0zRDRRWTRqV2U3c0NiS0RIQ0hFZ0pzbC9WemF0QjVa?=
 =?utf-8?B?SXl3eStVUEZYNnFZQm1EMXA3WnFTQ2NPa3JBMm9DUmtsT0lxZlBlR0RtemVD?=
 =?utf-8?B?eUcvZklQczZRRGpnM1lGcVNBZDdlRTBacEJ5ZG5YQVFiSGhpTWpLc3poZFM1?=
 =?utf-8?B?RmlmQkQ4UGtoZ3h5VWJGZi9lZkN1SHhwMjczRC9nZWI0WmppNEV6cVBFdVd1?=
 =?utf-8?B?YUp6RjRpb1NOamMwOGd6YitMQXhqRDFLVFdab3ZjRWZZV3dSaG5VckVnWmlX?=
 =?utf-8?B?NlkyTjlOSXFGb2c3bmFTZG85Wjl1U0tUNGt4UmVNbHd5MjcvMmgzR1R2Mnln?=
 =?utf-8?Q?kmQcvSm8Y7+9NTlUdaZNd+FbPg+ncMM43w0TxQI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(1800799016)(366008)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGRFVTU5NzMwd2FwNVNpUkM2bThtSytpS2NkVjBGTkd4KzAyQThwSGp4bHBU?=
 =?utf-8?B?MDZSZXN1dmFSOFNSUXc1bmo4V3hTUkd3SkpYbFp2SnBqN3RDYmo1ZmpmeDNM?=
 =?utf-8?B?NmVRS2dWNTRlNXhLS0IxdXR4WG5HcDExSjhMWXh6UlNqQ0ZzZ3ZiNERVREMy?=
 =?utf-8?B?cHJhV3lPejBHWmtUaVhiME93UDU0R243eFNzSTVON0JEQloveVg2ek5Ed2hD?=
 =?utf-8?B?djl3MHNTYzk0RnNDK0RLNXhpTU1EREJrbTByVHU2dCs2eVpJWU9FWmlGbVlo?=
 =?utf-8?B?dGIyZDh4NWZqcmZEZDdiTlVhcE9wcVVqeG9ZY05MV1RJeVJCNDRNNERTMTBx?=
 =?utf-8?B?ZE50ckFoVDU4a1pGeWpJbnk4TDh4RXpuUEZpbDRYeHU3U3MwWmtrK0FMdGcv?=
 =?utf-8?B?Q0UrbUtLbkRRRWFPMEdHejE4WUxRTUQ2eEhieGk5dVoxRExJaXdTbXg1R2Q2?=
 =?utf-8?B?OFMxMklMMFh6Y0tLVVNxM0wyVE9Ha3VWTG9Iak5HMnRWTytXV1RxTFQ5V0JL?=
 =?utf-8?B?d2FMSllETlJZQkVoWlRyNkhLeTJSMU1MSHlwVU8xN1kzYmRLa2ZZM2RFNUli?=
 =?utf-8?B?Q0lWUStmSGcrWkdqbnV6OGNtdmJNWjllT0poU3Fnc1BKblFIY3VESmp1R0Y4?=
 =?utf-8?B?OThQVHp3UlFqTUlvYlZ3RmUxbFBrcTYzN1FKK2hyMEQvYlQyM3FuOHBQSDdD?=
 =?utf-8?B?dGRVWm1lVHE1eHEyZ0VJLzd1UlRWaW5zMHo1YWhYWlU1SGxQR0pGTVdna2Z0?=
 =?utf-8?B?SmtWN2dlQ2FmOHhhOGlpT3lyRkRQRFR6Y0ZST005Ujh2UVJ3QWhWOGFMd0g3?=
 =?utf-8?B?WUxtTUxjQmZaVm9RNFdwVDZBZzdFNW9EdXJPYTkrSmkyZm5FYXVYc29tL1M5?=
 =?utf-8?B?THFMeGhQRCs3ZVlpOXhRbXgzZDZpdVAwdXFrRTlmbmUvdkhHUHM3OEVRNity?=
 =?utf-8?B?ZHNiVkRRVWo0eWxKTkdMd2xQbURsKzFwTWxIWE9xa2N1VFpHYTRmU2JxM0Nq?=
 =?utf-8?B?dzByTGx3VTc1T0NFTWlHc1lSeVNxS3VXZmNlMWVncGxlWnUrc293TStLT1Bk?=
 =?utf-8?B?VGdxaWVUV2g5cGpVT3lQMXNVRVZxL3IwVyt2Y3E5VE1QNVBLUjVSWng2cUs3?=
 =?utf-8?B?Qm9wWmVaTXJFWXk3VG9xUEVRNHA4OUFUd3Z2STQ5bDhzNjYrUENwcHFnR0g0?=
 =?utf-8?B?MWZsVVdxanliNnhlY3VDR0JjSFNuVlpjVUlmOFBFZUQvVGl5ZDFvOEZGT3Jp?=
 =?utf-8?B?VHJRTDVZR0g5b0pOUjhveUsrYTcxaXA0VXBqdWRUUEZVSjlrV1psNjdlWGw3?=
 =?utf-8?B?bTJNWXpXRXQ1ekE3c25sU3o0a0p4NFBISWl1NlRzK2ZVN3l1dzF5VkJDWnZE?=
 =?utf-8?B?V1l4U2VkMlB5VDVPZmFuYkdzeXYvMFdhdnFYYWlaSGJ6WWJXVjRCTlp5M1JT?=
 =?utf-8?B?di9qaTd5ZzJKbmp1TTYyVGI1VSs0ZEdkdVRlY1VKaEJ1TXA0dkdsYm5CUnZn?=
 =?utf-8?B?YWRYV1E3dlZScUozYWkzRjA0cHRGTXlUV29MazFIRWpGOFRJLzFIYUpOY2Nn?=
 =?utf-8?B?SHVqNTNVdXliYWpqem9UaUZ5aTlBcjZKSmxPSXVIT3JGU3JrYTQrU2dTMENE?=
 =?utf-8?B?VTNnc0hUZDBzRGlZZDF4T3VLUHBwVTdaazZnRUJzZlFZKzlhWXhEMUV2ZTZu?=
 =?utf-8?B?U3FiZ1YyQW9rOXhCYjlDaHFOZXZxYUsyeFI3K1k5ZlBtTnAvSnRYMXkzaTF1?=
 =?utf-8?B?ZnRKRnR4M09ZZlF5dlptdkN0QkE1SGJZVGMxcFc0aUVhM00rTDBRcnRSSFp0?=
 =?utf-8?B?ZlNTS2Q3TnlHMnBHTEU0MzNINUhCR3p3SWJWZ0lJZHZlMURaUWJ1WlBpbEFD?=
 =?utf-8?B?Uk5hcStPeWpCNGhxYzZ3Tk1aeG9QZzBxbVFuNkFQZGgxcXdrZlVqR2h4bVRa?=
 =?utf-8?B?U0hlN3pVMDhESUJrZmpmdE5rWis4enZFT3I2WE9TNDJsWXI3T2M3S0MyZ1NJ?=
 =?utf-8?B?cnU4WGRxb09FOFpBbzJlbjZuT3Y2Nmc0Y1VnZFJ4Vm1oeGIrWG1ncFRsdk1C?=
 =?utf-8?B?QlpwN1NXaWdiVWdUaktDMFVWY1ZrSkl2ZWhlUnovU3VKWnhYOHM4SVBiNmZD?=
 =?utf-8?Q?7a5s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF85F22B7C44B74983628958B67ABB6F@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93d5200-bb91-4881-935d-08dc8abf1d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 09:07:40.9567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZWfhax2XgtFrKsSavsfrG2dJdNpsRwUtEDwKIG2qrtkZlVE9Jydq+3A8HyhYnw3cD5CQZ8eMeLQ3gB76D73yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537

T24gMjAyNC82LzEyIDE2OjUzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNCAw
NDo0MywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzEwIDIzOjU4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAwNy4wNi4yMDI0IDEwOjExLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gSWYgcnVuIFhlbiB3aXRoIFBWSCBkb20wIGFuZCBodm0gZG9tVSwgaHZtIHdpbGwgbWFw
IGEgcGlycSBmb3INCj4+Pj4gYSBwYXNzdGhyb3VnaCBkZXZpY2UgYnkgdXNpbmcgZ3NpLCBzZWUg
cWVtdSBjb2RlDQo+Pj4+IHhlbl9wdF9yZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxIGFuZCBs
aWJ4bCBjb2RlDQo+Pj4+IHBjaV9hZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycS4gVGhl
biB4Y19waHlzZGV2X21hcF9waXJxDQo+Pj4+IHdpbGwgY2FsbCBpbnRvIFhlbiwgYnV0IGluIGh2
bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+Pj4gaXMgbm90IGFsbG93ZWQgYmVj
YXVzZSBjdXJyZCBpcyBQVkggZG9tMCBhbmQgUFZIIGhhcyBubw0KPj4+PiBYODZfRU1VX1VTRV9Q
SVJRIGZsYWcsIGl0IHdpbGwgZmFpbCBhdCBoYXNfcGlycSBjaGVjay4NCj4+Pj4NCj4+Pj4gU28s
IGFsbG93IFBIWVNERVZPUF9tYXBfcGlycSB3aGVuIGRvbTAgaXMgUFZIIGFuZCBhbHNvIGFsbG93
DQo+Pj4+IFBIWVNERVZPUF91bm1hcF9waXJxIGZvciB0aGUgZmFpbGVkIHBhdGggdG8gdW5tYXAg
cGlycS4gQW5kDQo+Pj4+IGFkZCBhIG5ldyBjaGVjayB0byBwcmV2ZW50IHNlbGYgbWFwIHdoZW4g
c3ViamVjdCBkb21haW4gaGFzIG5vDQo+Pj4+IFBJUlEgZmxhZy4NCj4+Pj4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4NCj4+PiBXaGF0
J3MgaW1vIG1pc3NpbmcgaW4gdGhlIGRlc2NyaXB0aW9uIGlzIGEgY2xhcmlmaWNhdGlvbiAvIGp1
c3RpZmljYXRpb24gb2YNCj4+PiB3aHkgaXQgaXMgZ29pbmcgdG8gYmUgYSBnb29kIGlkZWEgKG9y
IGF0IGxlYXN0IGFuIGFjY2VwdGFibGUgb25lKSB0byBleHBvc2UNCj4+PiB0aGUgY29uY2VwdCBv
ZiBQSVJRcyB0byBQVkguIElmIEknbSBub3QgbWlzdGFrZW4gdGhhdCBjb25jZXB0IHNvIGZhciBo
YXMNCj4+PiBiZWVuIGVudGlyZWx5IGEgUFYgb25lLg0KPj4gSSBkaWRuJ3Qgd2FudCB0byBleHBv
c2UgdGhlIGNvbmNlcHQgb2YgUElSUXMgdG8gUFZILg0KPj4gSSBkaWQgdGhpcyBwYXRjaCBpcyBm
b3IgSFZNIHRoYXQgdXNlIFBJUlFzLCB3aGF0IEkgc2FpZCBpbiBjb21taXQgbWVzc2FnZSBpcyBI
Vk0gd2lsbCBtYXAgYSBwaXJxIGZvciBnc2ksIG5vdCBQVkguDQo+PiBGb3IgdGhlIG9yaWdpbmFs
IGNvZGUsIGl0IGNoZWNrcyAiICFoYXNfcGlycShjdXJyZCkiLCBidXQgY3VycmQgaXMgUFZIIGRv
bTAsIHNvIGl0IGZhaWxlZC4gU28gSSBuZWVkIHRvIGFsbG93IFBIWVNERVZPUF9tYXBfcGlycQ0K
Pj4gZXZlbiBjdXJyZCBoYXMgbm8gUElSUXMsIGJ1dCB0aGUgc3ViamVjdCBkb21haW4gaGFzLg0K
PiANCj4gQnV0IHRoYXQncyBub3Qgd2hhdCB5b3UncmUgZW5mb3JjaW5nIGluIGRvX3BoeXNkZXZf
b3AoKS4gVGhlcmUgeW91IG9ubHkNCj4gcHJldmVudCBzZWxmLW1hcHBpbmcuIElmIEknbSBub3Qg
bWlzdGFrZW4gYWxsIHlvdSBuZWVkIHRvIGRvIGlzIGRyb3AgdGhlDQo+ICJkID09IGN1cnJlbnQt
PmRvbWFpbiIgY2hlY2tzIGZyb20gdGhvc2UgY29uZGl0aW9uYWxzLg0KV2hhdCBJIHdhbnQgaXMg
dG8gYWxsb3cgUEhZU0RFVk9QX21hcF9waXJxIHdoZW4gY3VycmQgZG9lc24ndCBoYXZlIFBJUlFz
LCBidXQgc3ViamVjdCBkb21haW4gaGFzLg0KVGhlbiBJIGp1c3QgYWRkICJicmVhayIgaW4gaHZt
X3BoeXNkZXZfb3Agd2l0aG91dCBhbnkgY2hlY2tzLCB0aGF0IHdpbGwgY2F1c2Ugc2VsZi1tYXBw
aW5nIHByb2JsZW1zLg0KQW5kIGluIHByZXZpb3VzIG1haWwgdGhyZWFkLCB5b3Ugc3VnZ2VzdGVk
IG1lIHRvIHByZXZlbnQgc2VsZi1tYXBwaW5nIHdoZW4gc3ViamVjdCBkb21haW4gZG9lc24ndCBo
YXZlIFBJUlFzLg0KU28gSSBhZGRlZCBjaGVja3MgaW4gZG9fcGh5c2Rldl9vcC4NCg0KPiANCj4g
RnVydGhlciBzZWUgYWxzbw0KPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAyNC0wNi9tc2cwMDU0MC5odG1sLg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

