Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3956BBA2656
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 06:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130971.1470240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v20Gs-00079w-RF; Fri, 26 Sep 2025 04:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130971.1470240; Fri, 26 Sep 2025 04:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v20Gs-00077r-KA; Fri, 26 Sep 2025 04:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1130971;
 Fri, 26 Sep 2025 04:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cR/D=4F=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v20Gr-00077l-9M
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 04:41:25 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b9bc330-9a93-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 06:41:19 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH8PR12MB9792.namprd12.prod.outlook.com (2603:10b6:610:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 04:41:15 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 04:41:15 +0000
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
X-Inumbo-ID: 0b9bc330-9a93-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP9FElv+5JI4EhHO2ki/+miGga52hkZ+RpshxyedmF0GcWZMmJ8gltLnNdFmy1zdNOZ+opTqgiG8Tk799EtmPf1KprfAvZchXFxrPbTEYkFlklXUgnqoaM/dGNQohzaFRMGio9HyVR6tJyk9+lKlX7b+Klk3R8ZYuVimN6UMN+3Lyee1MaSkVpoA5Wv3ebvbsYDKZE37fhSchpsQkE51NKeju2SWm4tDqSzQCjfzg1c1YG3lnG0dIiy7Yqzr2/aXDhLYXsmFVj7UvxHZSwh4vEldR63lgRmX9x6fnuX75q9SNobs7wbcAnQC4mwvvkEztThQGf/dHYTVVLuWuBU0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyDPKCJQwg4Wc2D17b+N6+AnfjJEfB6pNcUtvhh98FI=;
 b=rtvVmOv4WQMlQunVjF6LOC18+/jtOCR+OYIqZQ8B6WNBBe8rD005p3WjkPXmPErAefkA4toxHvau3J5FYn2yqlrUAM8pnYUXd3wjxCyIsWdrqzcVA7fHAYg/OHXbExFHez22z8zl+nUMpe446fmUSs6QIeka2cIW48+mXYfEC8GC06O3GWVETp2U9g64zB7muCq7gThBRh0PMvfjf0n6Ovr8hpAu9BMRFnZbMfFRcj0fF5zSLM9QffAVFP/pIsOFbte3BBYBvhqIqdMkNAD/gIiV8Gu0c1y5HQaJQYsX94AuTNkwhmBdwyNQTm49L2MykETfcpRnzorF7ffZR/lTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyDPKCJQwg4Wc2D17b+N6+AnfjJEfB6pNcUtvhh98FI=;
 b=zbpgPLvgeJKzy+7vuJyEsSmB3xyVJCEJ0xnZwtUy4qUJb/e2QQ95t+9PN0Mnw4iczt8J+53IR5frPu5kH3nAVBrxeysLS6XTNtqKEtkl6dgxuWLzvthnMMQfOocCZPPvBq7Tr2TNg4DyQKdhxXG+7P9NkpL8SA42OOK3japC6Vg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Andryuk, Jason" <Jason.Andryuk@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>
Subject: RE: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYYEaVyPVCsmkah0K573htVM7SN/BaAgBWuJICAAGLSAIAA6DCQ
Date: Fri, 26 Sep 2025 04:41:15 +0000
Message-ID:
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
In-Reply-To: <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-26T04:39:02.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH8PR12MB9792:EE_
x-ms-office365-filtering-correlation-id: b7ccaa0d-1bf7-4302-ecb9-08ddfcb6ed6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVFwSHE5eU4yNGk2QVFvM1p0ZTllQkQ3S0RrbVNncDhXb2Rvejh4bDBaQy8x?=
 =?utf-8?B?UFdWR2JiRlNURzFYY3I1Kzg4RVRNSU1TeTBiRWJDWlo4VnI3dkpPcEpLZEp4?=
 =?utf-8?B?d0xPMnJJUzhib1FUclR1RkhPMVZQSW9ROXNoNUVJTmN3Ly9MSkxnN1dLalN1?=
 =?utf-8?B?OTg1bXpTa1U3R0QxYjQ2YVNOYzBySG1IZUJQdEtDVGlIYjJ1TzZvVjFkc1J6?=
 =?utf-8?B?b1JKeXM1ak5NL2VBdmp1YW1VYnBuN0dpWjZXQ1dyaVE0c2VXZEdMWGxTWE05?=
 =?utf-8?B?WDN3eUI3YkxYalJQeGl2V3R4bGMveGZTb2ZkOEtxd2MwVEV0UXptYVRycWZM?=
 =?utf-8?B?Tk1vNGZWa0tObTMxNUZCa0VySzNRVkt2RTF5K2NXRFJIQlhab2RFREthQ0hS?=
 =?utf-8?B?TXg2Vi9kaW1weWxLMDZsblBScDNXR0J5WlVkeURBbUhTSGRldm9EZVFxcHp3?=
 =?utf-8?B?dmlOOXJ1UEViUFVFcXMvVjhRTkFnWFZxaVlwcFlBQ0d3OHplMHE1RFBLdGE2?=
 =?utf-8?B?aVhmQjF0RHY2WklGUTl3VG9aY3ZFYmlONURtUWJKKysxcG9JWXZJcm9mV0kw?=
 =?utf-8?B?dS92QjhuUzV0b0QzbnA1N0FZTFVQd0YrRDNiMzcxZDNJKy95amRZbHdGWS9W?=
 =?utf-8?B?MFA3WDdSdnpxTUgxQit3bkRWdTZNT09lSW9WdTJ5U3drTCtqWm10RmZ2ZnlX?=
 =?utf-8?B?VmV2S2VSVUpYUGdGeEdWdkw3cnZFVWNKK1lXZ1lXSDg3RlA0QmRiMlBwc0lW?=
 =?utf-8?B?cW9JbENKdXRJOUkxMHliT2xZUFNQczExZXRibTFyOUl5QnZiY3kxY2NQNGIv?=
 =?utf-8?B?bmJHT2hCOTBNVmliKzdpdUloM1VOY2I3bWptU1hsNUxBL293TVNUVGNkTGxL?=
 =?utf-8?B?OS92R1dZZi9sc09na2Q4LzZwWCttZkxDVVE1ejdNc3Eybk1pem41MVpqYUNW?=
 =?utf-8?B?b2ZNNitrTlZZWHU0cHB5UEp5V1E5dUc2ZkZxaG9vNC8wdnhrVHpDN3dnc3c3?=
 =?utf-8?B?VU8xRFlPSFFrSUd0MjVGRmkvaWtoRG1PYTl5ZUxmMnlQTXg5RzE4bmU1bWFi?=
 =?utf-8?B?U0JMc3JpUHQwalF5Vk9Bb3hVM3pSMUNkdHNYWHRlQTZrQWk2ZGt1VjkzN0Nr?=
 =?utf-8?B?bmJFa3VhNVZuQXNNWlMwTVlyUktxdi81M0pJaEZtUWQ3V2dUcDR0MFRKMkxP?=
 =?utf-8?B?Y1dPazRIWTBnOHVsdFlXdEVMQXZMK3ZQeWgrNDRYdjhBdHNmS1RNZU9FcFF2?=
 =?utf-8?B?b2M3cGRpWE53WnFjV3c1TUw4Tzh2YnZrV3B0V2xURGhaYzJHRkRYcVRTSytq?=
 =?utf-8?B?TFlpQmtNcGxDWmF2NzhtM2xkcjhCOHZWRitDZ0hQQ0tPdVhKQ0kyMW8rb1R5?=
 =?utf-8?B?VG5OY2xTTXdPc29OU210eUlFUDJxcHdLNm8zK1ludHhNN29jY0FIT040RHZF?=
 =?utf-8?B?NW02MWFCSURpN095bnpxN0dNOFpGRnpLMFgzN1NORlVoQnZuVnlzV3dUQjZF?=
 =?utf-8?B?RFcvTk5NMFVkamNuZHhZaEhaVWtpNTRYT0xMTHZZTXdLbmlCYlRkeG80NTY2?=
 =?utf-8?B?MW1uM3ZtRHNIeWFoeEY3UVRCZEpUczkxZUdiTnBtTS9vK3drSXg1Tm1zdkRV?=
 =?utf-8?B?Z1RabXNwYzc1b1RiY29PeTM2N09HMTNXV1hEazBMVkRsWjVLOGR2QkJLWUd0?=
 =?utf-8?B?bE1EWXNNTTRNUnNpeHRsS0IrdTlBQVU3SllhVDVqUG1vYjRGaDFMT242OVpK?=
 =?utf-8?B?Z1czL2ptQkw0eUJWOFJNZzR3aGYyc0pJdDNXL3NTbGE3SnFjcXRVZlRWNXZa?=
 =?utf-8?B?c0dHMEx3SFJsbjJyVzRyZS93QktIL2ZYN2FzQ0tnY3pEWlBZNVlVZ3F2UEE2?=
 =?utf-8?B?WWhjc0ExajN3UDFxSzdETnlrNy9Pa0ZGNXkrNmhFRllxYjBITEdTWVBFMmp1?=
 =?utf-8?B?ZFJxM0hLa3VuTEcwUFlGWWN3dnhhU1Z6TFdUNEN4dTU3VnhCa0RDSG01Y2gx?=
 =?utf-8?Q?RVtGVvte+8HDnEpddS0BMaTlOdhRpw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEpEV09aa2RlZWUwQlFwVkJtSE1mWktIVUhWZEhyM3VMU3Q1enlxVklQQ1J6?=
 =?utf-8?B?Sk1WVnl2UGRqTlZuVVFCVEp2eXBNaU1hOFlSbWVpdXFZTVEzNUpYWEFQMjBl?=
 =?utf-8?B?Si9Uak9qODBIcVVTRk8xcFlIQ1lvYnZURmtPSjlET1ZnaXE2OUpWZDBFOEVa?=
 =?utf-8?B?WFpZQVA2aHNFdUorci9WUHEwOWREL2hvTTJldkVGS2pMV2kxdnM0WWRBSEE4?=
 =?utf-8?B?M2J2OVFmYTZpQlV3d2YrQmxoQ212YzNHcmo3djNKY3lCRFJMcEpUeG9qUHBX?=
 =?utf-8?B?TjJ3VkJTVVk0UUZ6Yi9kSXFuaDd4YjVYam1XV29ITk44Vm5WcjJwaWRXTmdh?=
 =?utf-8?B?d0txOXc2Ty9qdWE2SmRCUytaN1BtamRQa01FQldsVEhXVllRanZmZFhmZFc4?=
 =?utf-8?B?UWZ1UERoMjlPN25UbVQvZXo0Y3JwL1pKWUE1M0dxQW9lRm9jMjNQOHBUbnhF?=
 =?utf-8?B?Y21FWTJhY2lBWmZrUklFZUZ4QVZsUjE1YzdEbGliQmtxNUREVkM4VXluV3VS?=
 =?utf-8?B?NEtzbXBhcXZiNEtxblU3QWpHekMxMmE2eHljSitReURuUVJBemdkekVTMXhw?=
 =?utf-8?B?eXpaTVh0VGFuQVE4RG14bTEwWlJDQ2tFdFdaVm9qNndPNHQ5VU5kLzB0NWlF?=
 =?utf-8?B?cDd5ZTFocFd4dTZJcUhwdURIR1RQNWhZVGlyN1luekR1L1ZOT2lOcFhSYTJJ?=
 =?utf-8?B?eFlmWDR6MjA0MjNXVkhTenU2UnJLd1FpTmQ0Yk1XMDNYem9IUTkrRTZhTkQ0?=
 =?utf-8?B?N0ZJT0Z4SEZhbVdOaFIyNFNQc2hkWDcrK2psWkRVYzdYbDNvM3lYdy9seVoz?=
 =?utf-8?B?RVl0YVZxRnJLdUgvSjl3V2VVM1lnWlh0SzRCNXEzSWR1SXJ5Yi9DT0p6SERG?=
 =?utf-8?B?SEJRQWNXV3BrVjlrWFlXK2JJMWIvdmYzanpla0RiRDNkTjNDNEVmMTdmbU04?=
 =?utf-8?B?amVWY3V6Y2NybGFzV2hGUjRpaGF2eTg4VVB1ZkkzdTMxQy9qRnlkZCttTjVi?=
 =?utf-8?B?VlllZzFCOUp0M01yenZ1RnpNUmJsNW5TczJWZFd0VW5UbVNLVWJrU2prWDF6?=
 =?utf-8?B?RDE3OCs1THJIZ2xIdm55M3RzUGp2Q2JEdUhZb0ZPZCt6L2tSY3JudzFtaHpZ?=
 =?utf-8?B?M1R6V1pVeHAwQmFjbWNJKzNKMDBuaVlUVGN5dWpneFBVQzBFb052bC82M0ds?=
 =?utf-8?B?VDQ1SEp2MEhISzhzZkwxQnNrZlNIWEU3c2FBVnBkYTdzUkZZWXFRZEdPU3Nx?=
 =?utf-8?B?KzdPbjZQYS9WMzFVcnd6Q1RlR0JuUzBVbUVvSXJZV3hTYnJ2SmI0NTM2N0pS?=
 =?utf-8?B?Q1JPWUQ2YW5FQ09NdTFDemFUR0lMZHFPamN4anFnU2MzVnpneGgzckhYbGNR?=
 =?utf-8?B?ak1wMGNocXdvYS8vQU91UUJCaWNsazF3ektRSWE3S2JnM05jOUdlV1VDTjV5?=
 =?utf-8?B?NTkvbFltNVV3NWFYQ2djUjVFbDJqa2pqY1RMV04xc3Y5Y1pIcy8zQmR6ZHlT?=
 =?utf-8?B?WmFpbXV2N3djbVhKYWJiZmlDanhvOFVDZ2hhTUE2WTc4MUtscStmMndvVm9i?=
 =?utf-8?B?UEd2VEZGU1I4ODJVemJDdWtvaE82WGE3c1dBTkI1MWJuaGN6Y21nUE90WWNX?=
 =?utf-8?B?d0VOaTVWUUs1eHdsS0tWTE1kQk9SYjVTcnNVb2VqV3pUbGdwNTVVMEM5WFY4?=
 =?utf-8?B?MUpPTDNHZjAvU3Vzc0swSlBtei93eHY5ellUS3p6ZUlsNWNuYVhIWHJNV1RG?=
 =?utf-8?B?VjNqR2FhTVYyZ0gyVzd6cjVXeDBaNVVQUjM2ZjNtTW1UVmZPdERvK1JucU9O?=
 =?utf-8?B?cCt2QXNxaTdCNW9zQlhia0tNZEFGTFkydFZzYitLZkZmQVNVVkdRK3VYMlEv?=
 =?utf-8?B?M1BEYXNQOEdsN3B0Q09hM3pBUUova2kvVjEzTTkxWkxzdS81TnMzVGdudExw?=
 =?utf-8?B?T3FmZ2FrMlpnSTV5ajJYSkJVUk42MnBvWVVSUXZjWWdGalJhdy9lQUFtWjE5?=
 =?utf-8?B?Zm5lRVFNVXFNL1g5d2srU2dNYnFzVVJwKzIzUVBzVHNuQzEzckJaeFRqQ0RU?=
 =?utf-8?B?Ym5Ic0pHcGkzMm1rS3RvOUNlOEttRWJ0K1cyS3pYVTk1cUFLdXU3U0RFcVBT?=
 =?utf-8?Q?gL1k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ccaa0d-1bf7-4302-ecb9-08ddfcb6ed6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 04:41:15.3742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTkSZKbvQ48dOhhEDgMgVBh0PrloG+C6EwKSjzabBJ7Xw7VFbZLADWWnkfer70L5hTTj0bq82y6r4x3wD/oRQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9792

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjUs
IDIwMjUgMTA6MjkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+
IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBBbmRyeXVrLCBKYXNvbg0KPiA8SmFzb24uQW5kcnl1a0BhbWQuY29tPjsgU3RhYmVs
bGluaSwgU3RlZmFubyA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMTgvMjZdIHhlbi9kb21jdGw6IHdyYXAgeHNtX2dldGRvbWFpbmluZm8oKSB3
aXRoDQo+IENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4NCj4gT24gMjUuMDkuMjAyNSAxMTo0MSwg
UGVubnksIFpoZW5nIHdyb3RlOg0KPiA+IFtQdWJsaWNdDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiA+PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDExLCAyMDI1IDk6MzAgUE0NCj4gPj4g
VG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gPj4gQ2M6IEh1YW5nLCBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+ID4+IDxkcHNtaXRoQGFw
ZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMTgvMjZdIHhlbi9kb21jdGw6IHdyYXAgeHNtX2dldGRv
bWFpbmluZm8oKQ0KPiA+PiB3aXRoIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4gPj4NCj4gPj4g
T24gMTAuMDkuMjAyNSAwOTozOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0gYS94ZW4v
aW5jbHVkZS94c20veHNtLmgNCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KPiA+
Pj4gQEAgLTU1LDggKzU1LDggQEAgc3RydWN0IHhzbV9vcHMgew0KPiA+Pj4gICAgICB2b2lkICgq
c2VjdXJpdHlfZG9tYWluaW5mbykoc3RydWN0IGRvbWFpbiAqZCwNCj4gPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8gKmlu
Zm8pOw0KPiA+Pj4gICAgICBpbnQgKCpkb21haW5fY3JlYXRlKShzdHJ1Y3QgZG9tYWluICpkLCB1
aW50MzJfdCBzc2lkcmVmKTsNCj4gPj4+IC0gICAgaW50ICgqZ2V0ZG9tYWluaW5mbykoc3RydWN0
IGRvbWFpbiAqZCk7DQo+ID4+PiAgI2lmZGVmIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4gPj4+
ICsgICAgaW50ICgqZ2V0ZG9tYWluaW5mbykoc3RydWN0IGRvbWFpbiAqZCk7DQo+ID4+PiAgICAg
IGludCAoKmRvbWN0bF9zY2hlZHVsZXJfb3ApKHN0cnVjdCBkb21haW4gKmQsIGludCBvcCk7DQo+
ID4+PiAgICAgIGludCAoKnN5c2N0bF9zY2hlZHVsZXJfb3ApKGludCBvcCk7DQo+ID4+PiAgICAg
IGludCAoKnNldF90YXJnZXQpKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmUpOyBA
QA0KPiA+Pj4gLTIzNCw3DQo+ID4+PiArMjM0LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9k
b21haW5fY3JlYXRlKA0KPiA+Pj4NCj4gPj4+ICBzdGF0aWMgaW5saW5lIGludCB4c21fZ2V0ZG9t
YWluaW5mbyh4c21fZGVmYXVsdF90IGRlZiwgc3RydWN0DQo+ID4+PiBkb21haW4NCj4gPj4+ICpk
KSAgew0KPiA+Pj4gKyNpZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4+PiAgICAgIHJl
dHVybiBhbHRlcm5hdGl2ZV9jYWxsKHhzbV9vcHMuZ2V0ZG9tYWluaW5mbywgZCk7DQo+ID4+PiAr
I2Vsc2UNCj4gPj4+ICsgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+Pj4gKyNlbmRpZg0KPiA+
Pj4gIH0NCj4gPj4NCj4gPj4gVGhpcyBpcyBpbiB1c2UgYnkgYSBYZW5zdG9yZSBzeXNjdGwgYW5k
IGEgWGVuc3RvcmUgZG9tY3RsLiBUaGUgc3lzY3RsDQo+ID4+IGlzIGhlbmNlIGFscmVhZHkgYnJv
a2VuIHdpdGggdGhlIGVhcmxpZXIgc2VyaWVzLiBOb3cgdGhlIGRvbWN0bCBpcw0KPiA+PiBhbHNv
IGJlaW5nIHNjcmV3ZWQgdXAuIEkgZG9uJ3QgdGhpbmsgTUdNVF9IWVBFUkNBTExTIHJlYWxseSBv
dWdodCB0bw0KPiA+PiBleHRlbmQgdG8gYW55IG9wZXJhdGlvbnMgYXZhaWxhYmxlIHRvIG90aGVy
IHRoYW4gdGhlIGNvcmUgdG9vbHN0YWNrLg0KPiA+PiBUaGF0J3MgdGhlIFhlbnN0b3JlIG9uZXMg
aGVyZSwgYnV0IGFsc28gdGhlIG9uZXMgdXNlZCBieSBxZW11ICh3aGV0aGVyIHJ1biBpbg0KPiBE
b20wIG9yIGEgc3R1YmRvbSkuDQo+ID4NCj4gPiBNYXliZSBub3Qgb25seSBsaW1pdGVkIHRvIHRo
ZSBjb3JlIHRvb2xzdGFjay4gSW4gZG9tMGxlc3MvaHlwZXJsYXVuY2hlZA0KPiBzY2VuYXJpb3Ms
IGh5cGVyY2FsbHMgYXJlIHN0cmljdGx5IGxpbWl0ZWQuIFFFTVUgaXMgYWxzbyBsaW1pdGVkIHRv
IHB2aCBtYWNoaW5lIHR5cGUNCj4gYW5kIHdpdGggdmVyeSByZXN0cmljdGVkIGZ1bmN0aW9uYWxp
dHkoLCBvbmx5IGFjdGluZyBhcyBhIGZldyB2aXJ0aW8tcGNpIGRldmljZXMNCj4gYmFja2VuZCku
IEBBbmRyeXVrLCBKYXNvbiBAU3RhYmVsbGluaSwgU3RlZmFubyBBbSBJIHVuZGVyc3RhbmRpbmcg
Y29ycmVjdGx5IGFuZA0KPiB0aG9yb3VnaGx5IGFib3V0IG91ciBzY2VuYXJpbyBoZXJlIGZvciB1
cHN0cmVhbT8NCj4gPiBUcmFja2luZyB0aGUgY29kZXMsIGlmIFhlbnN0b3JlIGlzIGNyZWF0ZWQg
YXMgYSBzdHViIGRvbWFpbiwgaXQgcmVxdWlyZXMNCj4gZ2V0ZG9tYWluaW5mby1kb21jdGwgdG8g
YWNxdWlyZSByZWxhdGVkIGluZm8uICBTb3JyeSwgSSBoYXZlbid0IGZvdW5kIGhvdyBpdCB3YXMN
Cj4gY2FsbGVkIGluIFFFTVUuLi4NCj4NCj4gSXQncyBub3QgIml0IjsgaXQncyBkaWZmZXJlbnQg
b25lcy4gRmlyc3QgYW5kIGZvcmVtb3N0IEkgd2FzIHRoaW5raW5nIG9mDQo+ICAqIFhFTl9ET01D
VExfaW9wb3J0X21hcHBpbmcNCj4gICogWEVOX0RPTUNUTF9tZW1vcnlfbWFwcGluZw0KPiAgKiBY
RU5fRE9NQ1RMX2JpbmRfcHRfaXJxDQo+ICAqIFhFTl9ET01DVExfdW5iaW5kX3B0X2lycQ0KPiBi
dXQgdGhlcmUgbWF5IGJlIG90aGVycyAoYWxiZWl0IHBlciB0aGUgZHVtbXkgeHNtX2RvbWN0bCgp
IHRoaXMgaXMgdGhlIGZ1bGwgc2V0KS4gQXMNCj4gYSBnZW5lcmFsIGNyaXRlcmlhLCBhbnl0aGlu
ZyB1c2luZyBYU01fRE1fUFJJViBjaGVja2luZyBjYW4gaW4gcHJpbmNpcGxlIGJlDQo+IGNhbGxl
ZCBieSBxZW11Lg0KPg0KDQpVbmRlcnN0b29kLg0KSSBhc3N1bWUgdGhhdCB0aGV5IGFyZSBhbGwg
Zm9yIGRldmljZSBwYXNzdGhyb3VnaC4gV2UgYXJlIG5vdCBhY2NlcHRpbmcgZGV2aWNlIHBhc3N0
aHJvdWdoIHZpYSBjb3JlIHRvb2xzdGFjayBpbiBkb20wbGVzcy9oeXBlcmxhdW5jaC1lZCBzY2Vu
YXJpb3MuIEphc29uIGhhcyBkZXZlbG9wZWQgZGV2aWNlIHBhc3N0aHJvdWdoIHRocm91Z2ggZGV2
aWNlIHRyZWUgdG8gb25seSBhY2NlcHQgInN0YXRpYyBjb25maWd1cmVkIiBwYXNzdGhyb3VnaCBp
biBkb20wbGVzcy9oeXBlcmxhdW5jaC1lZCBzY2VuYXJpbywgd2hpbGUgaXQgaXMgc3RpbGwgaW50
ZXJuYWwgLCBpdCBtYXkgYmUgdGhlIG9ubHkgYWNjZXB0IHdheSB0byBkbyBkZXZpY2UgcGFzc3Ro
cm91Z2ggaW4gZG9tMGxlc3MvaHlwZXJsYXVuY2gtZWQgc2NlbmFyaW8uDQpUaGUgbWFqb3Igcm9s
ZSBvZiBRRU1VIGluIGRvbTBsZXNzL2h5cGVybGF1bmNoLWVkIHNjZW5hcmlvIGlzIHRvIHByb3Zp
ZGUgbGltaXRlZCB2aXJ0aW8tcGNpIGRldmljZXMgYmFja2VuZC4gU28gd2UgbmVlZCBoeXBlcmNh
bGxzIG1ham9ybHkgaW52b2x2aW5nIGlvcmVxIHNlcnZlciwgZXZlbnQgY2hhbm5lbCwgdmlydHVh
bCBpbnRlcnJ1cHQgaW5qZWN0aW9uIGFuZCBmb3JlaWduIG1lbW9yeSBtYXBwaW5nLCB3aGljaCBz
aGFsbCBub3QgdXNlIFhTTV9ETV9QUklWKHhzbV9pb21lbV9wZXJtaXNzaW9uKCkveHNtX2lycV9w
ZXJtaXNzaW9uKCkveHNtX2lvbWVtX21hcHBpbmcoKSkgY2hlY2tpbmcsIEkgYXNzdW1lLg0KDQo+
IEphbg0K

