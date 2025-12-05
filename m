Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A8CA602C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 04:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178429.1502247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRMV7-0007CF-1s; Fri, 05 Dec 2025 03:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178429.1502247; Fri, 05 Dec 2025 03:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRMV6-00079F-V6; Fri, 05 Dec 2025 03:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1178429;
 Fri, 05 Dec 2025 03:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgFP=6L=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vRMV5-000799-AM
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 03:28:55 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849e004e-d18a-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 04:28:52 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 03:28:47 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 03:28:47 +0000
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
X-Inumbo-ID: 849e004e-d18a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yN18kjsptYLDCpLbKmOYa/6z90NZCeJ6amSqfz/sJdAjZBS5F7WQC6ZR3FAUyqjb0pwkuwBzGSYkAIjXCbbnUOMk6jEziQD2mm042o9kuW49jxw17rBdrLhcuNXJoLDEE5gr7Lv+9MJ5/7bP4XCpfla5uChoE8fj5EZJO8dhSp8mbAT7fGKshg5GSnoAbmjHqSHPgGqTAe9BCSoxn7Nm8GzjyJx0Ho+jAMkMsEyCGyjXEN0ACgRrRcBNwh1vMAPiHC58sRTm3/uW4A1e4oDYOnxPCEc45a6JHZBoQQd3MZYJzLN5QtoCPjSQowYw1Tx92lvL0MRz+Ogi6ypO1qfA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzHSDnqBA5f5qQl6YX3o5GWe8g11pWZatzOFeuY0zYc=;
 b=N40Y+4otSYV7l78vPRnXxNuUGxkmyUg66tgdx2QvsPCi/+MLNUHvG1YP5x0aGO4w4P05cjNIMrlRDbzqYOlOvXQf/TIU0yUPaztavauD6NYvO+64ZwUIbA0fQMLne+CMkJgI0v1TYof/UJNNuZFUo/tMxqFAFm4xdqwajtfOlEj6VlxSLu44iEYTLL63GsOrLqbBHyfGQPqp5doehIs9nMpjZcy3mq3xQUCGpu7RdDvNAdeZj3mbimsoXBvc0mxFHkiPLG0KCrQZEgEK/vENbIvvcgMIRkAGQvjBPTmviIGRpvnjAzUE9stXTyRVmeyaHbTHQwIidCBTLSPnwYYUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzHSDnqBA5f5qQl6YX3o5GWe8g11pWZatzOFeuY0zYc=;
 b=XOGNnnKpr+FZb8MwzYB2hgVJ+uTVBN4VZdWmKC4HkT5meClCr7jdWsumLZ3VbhSCopkAfrJE4ZuzsRw3O/Vg6E/PHahkbGokStw8EHfd35bVrRJ2v6YG0wlLaL29Nz4aaP3sq7ciwdWvAlPwUjbKWHilb1sJGdmAn0VFWrtnrEk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v4 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcWtXmS51F6WJwgE2h9vzl8XgXOrUDpDaAgA1N7rCAAFxegIABIoIw
Date: Fri, 5 Dec 2025 03:28:47 +0000
Message-ID:
 <DM4PR12MB8451F190E0AA787B9DAA7A6AE1A7A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-21-Penny.Zheng@amd.com>
 <de34ea34-1558-46b3-b5a6-79edd60ad45f@suse.com>
 <DM4PR12MB84519D61527BF82117F65CAEE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <57dea7ef-9bbe-44f8-a0dc-c933a6235c05@suse.com>
In-Reply-To: <57dea7ef-9bbe-44f8-a0dc-c933a6235c05@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-05T03:28:38.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4100:EE_
x-ms-office365-filtering-correlation-id: 76f8d65f-21d6-4f27-d66d-08de33ae6687
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3hNK2U3UERkalFLMVRNQWtxM0FMWnNxV3lTTVMxNGtCZ3I5Vy9WTWVUNXgx?=
 =?utf-8?B?bUhhNmZwQXFldzliMGZSb013bHU3ODZTQlpDYkNZdjQvVlRUSHA3a0tYbVRS?=
 =?utf-8?B?TjAwRmExeEcxTUVCeXJ0RUtWTzFFUXhTZUxtbkxySktERTdydXFrMWhsQUx1?=
 =?utf-8?B?dXJ5SHExbTErMTJZS1JxMSs1TWJvTXV1UEcwOWk5cXNLZFR1YmtPM2lrZVlh?=
 =?utf-8?B?eTJ5UzJid2phYUExT1pvSlpQV2lmVHh3NWpsaWUwUlhGTUJyMGlJVzh6UERh?=
 =?utf-8?B?aThiUk01NERxK2tvUi9vQWEwWFROQ0xHUUNFbHlndkhkdXhTNHhyZURiQ0d6?=
 =?utf-8?B?MWM2L0piWG1hMHdiNXV2K1UvUGljc3c0MVpNTTVHZUZnWk9TVm9ONTcyU25E?=
 =?utf-8?B?RDdhRWtUSHRucmpWWm55N0hrOG16V2svTXU2NDRvcW5MMTlJVWkwNi9JczNp?=
 =?utf-8?B?d2NJY1Q2SWk3K3B5ZUc3VkJLMWlBZDBWTVhzbkhwVXl5bWZRL2FDR2lNRjMw?=
 =?utf-8?B?QmpCME05M3RVZlhtY1ZIMGFXVHl3OXFuL0ZVemVmTG9XUHRPRGVlMlpvaXp5?=
 =?utf-8?B?WWdMRkRJRFE5VWRLMjhQRFVidmFEZW1QYzhLOVEyTkhGR1BRdU9lYnFXZEpy?=
 =?utf-8?B?WVVCMjJZaTE4WTU2UkdwM0xyc1NLUFFHUWtpRlB4QWo5anpPV0NlU29icnRT?=
 =?utf-8?B?VWhKUlV5VmZKRXh2WmlNemJRQ2c0RDdySVYyblk1VnpwVUVJU2JOTTl1bXli?=
 =?utf-8?B?YW85OG9xMUNWbEd1cko5YTFDZnErMDVnOXRpWHY4cHRkZ0RlV09YYkpTSlNX?=
 =?utf-8?B?ZmdIRDEzR0d5SVloTHRNZEI5aGNldGdOQVJiSWRSZmhUS3RmekNPdDNTc1J2?=
 =?utf-8?B?RlllSHJzSWlndnl2WmtnR0ZDZlFIUDZmSC81bTJNVWNOUWVGM0pBcHB5WFI5?=
 =?utf-8?B?aVVCbjRGcGFHMk4zMlhyU3JqaVJPdkZFT2RBcUljSWpnbGNTancxRzBHU1Rv?=
 =?utf-8?B?UHRxVFdpVG54NE44YXc5OC9wSHYzWjh6aG9qSGtGMFdQZFpvcjlSNmExTy94?=
 =?utf-8?B?UUUyV3IreFd1Sm9razNzQk13Q2krWlV2VzE2aTJMcDdJYmpTbW0xRVg1bUxK?=
 =?utf-8?B?K3M5Wnhvem5VNWtmTW9RUUh2Skh0SG5iQjhkbHZUcnovZ01LOE1ZYk1tby9l?=
 =?utf-8?B?VlFHWnlabEZmRXQyRXBIbU5FZTNpcHl2c2VNcmVwczdvQmd6eXI3SzV5T2xw?=
 =?utf-8?B?NEs3amR4T05Cdm9qZjM2RUJHZDNjSEVRMjRNWFQ4WlRobWhndkVRWGdVSFJP?=
 =?utf-8?B?Qmd1bDl1S3FMZTNhd1d6NVgrendyZG9MMmRBQUZMeVZPWDZmc0Y5eHF0MVB4?=
 =?utf-8?B?STZ2UFhQcWhiNVY3bm9GbExmL3QvaG9GVCtxWVlyMm13QU5scTRBUzllSnNO?=
 =?utf-8?B?Tmh5MGdPYXBOZ2h1N3FZaGJKTlVaZGlqbDhDSVV4QW9YTnNoMmthK0lWREZx?=
 =?utf-8?B?djRtOVlycmNPUi9iak9QcUJYdXBPbk4ydjlVeHNhWlpkZHJhdnlQUWtud2hx?=
 =?utf-8?B?c1pJb005RmwvcWxsYzFPR0JyUEpTWGFJL0hiYXhUbThwaU9XRHdYdHhGaEl2?=
 =?utf-8?B?RGhBempWUnhPYWUxNXdzNGxvTjNOQ2ZETUFLSytUZ0wwRTZMRytDSU94TmFE?=
 =?utf-8?B?bGlURk1mWE01ZTUwODJQeitaMmY1LzhONzdwczNtV21FU3BhMlN5VUlzL2JN?=
 =?utf-8?B?aDhqQUZicnc4U2xLT09XM1lIUzhGSjQvbTJlVERGSGk3dEt5WmRXd3BHOXAx?=
 =?utf-8?B?QURHRHVXTG1iOHBDUytiYTZNNUFtZWo4N0svZjlMYWRsak1RMjBZNVJ3ZTU0?=
 =?utf-8?B?RXJUTmNBY0JrNGxYYVhwdUE0Ky9UQ0M4alhrbytVMjRNaXZqbUU3alF2OGpX?=
 =?utf-8?B?WDlCS0MySFZvb25yZzBnMTdUUG9hWkpoNTM4dW56QlRYdlZXT1JuNElsNUQ2?=
 =?utf-8?B?eWY5bEt0N0kwS3JQaWNwQTFtVEJRWTBHWWljSjFQOUZLdHNqUkNrbHNpbkMv?=
 =?utf-8?Q?+Ct8qp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N25TS1hSV05aSmxvZGdYK3I1SGIySCtXWkU3b0E0bDdsb2x3ZGpIdVZTejFB?=
 =?utf-8?B?U0tTOGlRSDFyT1kxVU1lS05nU2RUdXhudGtNYmhWdmxJMWJrbTBEeDZ6VjJ0?=
 =?utf-8?B?TTd3Q1RJNGZMRGVTb1ErSFN5MWdWNHdWOUt5N1htYy8ySWhXTDg2SFBCTnY2?=
 =?utf-8?B?QW5BcFZablZWa3RqSzE4Yzk1alQrWXdsVmZqQ05oQWQyR1JpL3Z6S290c3FS?=
 =?utf-8?B?eUxBSS9KTFB5S1E0Z1Y3RDBrSDVKR2ZvTEhqNGVZOVl5TlRqeHE1dUtGR09I?=
 =?utf-8?B?RHZzVFA3anNxWEVPdVhuMEpnZ1Bpby9TQUpSalZmZkE2NCtmSnU4RFNodllr?=
 =?utf-8?B?elNQemx4Yjd6SjFUdno0bk1FUlNpbklaWHVuQUZiS0hIUnJocE1YMHlRRlhi?=
 =?utf-8?B?T094ZExTY1J5d1JNOWsyU2hHVHlWbEVCNjQrVjNnaEwrSm9KNmxQL0RoalNv?=
 =?utf-8?B?c1FwUU5PWHVjVlVmSTQwMUR5N2xXckxrbUtFcDVJRnliU1F2cU1ZWUZsbmFL?=
 =?utf-8?B?Y1FzQy94cVNHRTFUSTg3eXFWSDcwcC9pM043clh2TU9aZ1FiQTBhRit0aFpC?=
 =?utf-8?B?eXpTNk5YSHpXOGZjOTVVY0ZwZm94VDZZcUhqUnNTY3J0aUEveGlNckFVNlJn?=
 =?utf-8?B?K1RJbDB2TDNYR0hTTmwxTEQ2NUVtanZ6aUpkM05HT2FqNjZsUytzeWJxWTc2?=
 =?utf-8?B?U2srUjJvemhyczZqVk1BcDJVVzVHaU1iMllLQ1hNM1BmM1RPQ0grdThTYmsv?=
 =?utf-8?B?VUYrZ2pDQWVQd0VtdXlUNXRJQVEyZTVFOTVhUFpoMy9lRTZSRGVCZHE1MU5h?=
 =?utf-8?B?OTFKeWMwcExlRFdZTGt4bi9VQUNHSE1jeXVmK3dEWmhSL3FYdmJIdXR2ZzZT?=
 =?utf-8?B?cjJrZkd1UzBkQ3RhUWttTmtvdGwrYzZWZ1lBS1RKVW1sUWdEOHZwbXZsK1pB?=
 =?utf-8?B?NEdrdTY0MkI5YUFtclBpSXZhSDdXOE84ZENybmVVUkNHbWUxcUFnSis5a1E1?=
 =?utf-8?B?MTc3ZGZlTnFWU3QvMlI2UHJEOFMySFMzTE05RzJnSlI4akYxc2h5ejBtV3Np?=
 =?utf-8?B?L0tCRVpsWU1Pd2JPdk1QNkZtdDlDNXRzV3M1V0VGNmt0VVRHY1pYQXNKNkJ5?=
 =?utf-8?B?YjBudFhOeG1lZmdWYnJyV2M0T09VcDAxRUEvSDVZNkVFMWF5aFI3dngyQXIr?=
 =?utf-8?B?YjNybmRxR1BweW5sWWRaTnMvU2lEeXgwNUxSWW5aRmVwWFEwZXcrY2hmc053?=
 =?utf-8?B?a25WNFVHZHhrd1prTnp0aldQa2h1WnAyYzdPdlBrVWprY3k2MitHa2QwSloy?=
 =?utf-8?B?SnYvNlZ5WjdocEs3c01xZU1tL1grb01XRmxaTTVWTmdmdWVCelBxVXA4T29W?=
 =?utf-8?B?N0NIZi94U3ArM25KOSttYnJteEd2QmdvOEthWDF1VU5WTGoxbEZsUjFJR25G?=
 =?utf-8?B?aWZMRDlCU0RYeDJpakNySUQ2OHl6RGJkWFl5Smltd3B1SzJ1V0pZNUorbisv?=
 =?utf-8?B?Mys4RUg3R2s3SXArNGE5WGx4aHVDM0lpWXJyK0ptTk14b3h4T01WS3cwdkQ1?=
 =?utf-8?B?MDcrajhlRWwzU0NxaXF0aTVmaGNYb1hxVG0zZmV1OC9hdmNEUTcyUUtaQ2N6?=
 =?utf-8?B?NFpabE56c2k1dGJxSGNUaXRBVEFIdFc3bmswcHJFaHI1T2xMdC8yS2Z4L25I?=
 =?utf-8?B?Q1pTbzhvcU5ValRVaXpteW9FZ3hHN3BwS2VnL1lnZFVUL0poUU1LRzZrODBJ?=
 =?utf-8?B?TnBYMS94b1FleUFENVVoZDRPdGZIUEptMVhwRUlGeUlRc2UvdXpQUkw4V3Rq?=
 =?utf-8?B?RzFGUUZWSGlTV1VuOG11MVJReFVDcTY5anB1c1htWDUwYVM5SndIKzFHZkp1?=
 =?utf-8?B?T0FtWUI4aUZVdUREcGlvWDIzc1oyeGRqdTJCQkhHeUZSdlpKT3QyMkZpaUtO?=
 =?utf-8?B?QlNMcGxYN1o0Ui9qT3BJeUM0bjJ4UlBGS2RVT2Q2K01KZTVteGlpOWhaL2M4?=
 =?utf-8?B?Y3dwcGpYWDJrbzNSQkYvTXhOa2ZrNXlHQTdyVDR4RTJEck43ZUxvcUxzQzY4?=
 =?utf-8?B?dFZaOE83UG9hRDlRVTUzenpVZ2pyTjZFdDVyM0h0TmNKU3hkZDA0TVgxSk55?=
 =?utf-8?Q?OD9A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f8d65f-21d6-4f27-d66d-08de33ae6687
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 03:28:47.0622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PpEnslyxtaY1vAYETFycJIK2UjA/vp3xwSezH5rPHY2iTf5zM76FHQ07mG1RKmQoQc5yIp/V3NQzNWLpy7+RkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciA0LCAy
MDI1IDU6NDEgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgZ3J5Z29yaWlfc3RyYXNoa29AZXBh
bS5jb207IEFuZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRo
b255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwg
PE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubw0KPiBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgRGFuaWVsIFAuIFNtaXRoDQo+IDxkcHNt
aXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMjAvMjRdIHhlbi94ODY6IHdyYXAgeDg2LXNwZWNp
ZmljIGRvbWN0bC1vcCB3aXRoDQo+IENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4NCj4gT24gMDQu
MTIuMjAyNSAwNToyMywgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+IFtQdWJsaWNdDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI2LCAyMDI1
IDE6MDAgQU0NCj4gPj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Pj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgZ3J5Z29yaWlfc3RyYXNoa29A
ZXBhbS5jb207DQo+ID4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBBbnRob255IFBFUkFSRA0KPiA+PiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVs
LCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gPj4gSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gPj4gRGFu
aWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsNCj4gPj4geGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMjAv
MjRdIHhlbi94ODY6IHdyYXAgeDg2LXNwZWNpZmljIGRvbWN0bC1vcA0KPiA+PiB3aXRoIENPTkZJ
R19NR01UX0hZUEVSQ0FMTFMNCj4gPj4NCj4gPj4gT24gMjEuMTEuMjAyNSAxMTo1NywgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZw0KPiA+Pj4gKysr
IGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4gPj4+IEBAIC0yOSw3ICsyOSw3IEBAIGNvbmZpZyBY
ODYNCj4gPj4+ICAgICBzZWxlY3QgSEFTX1BDSV9NU0kNCj4gPj4+ICAgICBzZWxlY3QgSEFTX1BJ
UlENCj4gPj4+ICAgICBzZWxlY3QgSEFTX1NDSEVEX0dSQU5VTEFSSVRZDQo+ID4+PiAtICAgaW1w
bHkgSEFTX1NPRlRfUkVTRVQNCj4gPj4+ICsgICBzZWxlY3QgSEFTX1NPRlRfUkVTRVQgaWYgTUdN
VF9IWVBFUkNBTExTDQo+ID4+DQo+ID4+IFdoeSB3b3VsZCB5b3UgdW5kbyBhbiAiaW1wbHkiLCB3
aGVuIHJlYWxseSB3ZSBzaG91bGQgdXNlIGl0IG1vcmU/IE9uZQ0KPiA+PiBvZiBpdHMgcHVycG9z
ZXMgaXMgc28gdGhhdCB5b3UgY2FuIGFkZCAiZGVwZW5kcyBvbiBNR01UX0hZUEVSQ0FMTFMiDQo+
ID4+IHRoZXJlLCBhbmQgaXQgdGhlbiB3b24ndCBiZSBhdXRvLWVuYWJsZWQgaWYgdGhhdCBkZXBl
bmRlbmN5IGlzbid0IGZ1bGZpbGxlZC4NCj4gPj4NCj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9wYWdpbmcuaA0KPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BhZ2luZy5oDQo+ID4+PiBAQCAtNTUsNyArNTUsNyBAQA0KPiA+Pj4gICNkZWZpbmUgUEdfdHJh
bnNsYXRlICAgMA0KPiA+Pj4gICNkZWZpbmUgUEdfZXh0ZXJuYWwgICAgMA0KPiA+Pj4gICNlbmRp
Zg0KPiA+Pj4gLSNpZiBkZWZpbmVkKENPTkZJR19QQUdJTkcpICYmICFkZWZpbmVkKENPTkZJR19Q
Vl9TSElNX0VYQ0xVU0lWRSkNCj4gPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfUEFHSU5HKQ0KPiAm
JiAhZGVmaW5lZChDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUpDQo+ID4+ICYmDQo+ID4+PiArZGVm
aW5lZChDT05GSUdfTUdNVF9IWVBFUkNBTExTKQ0KPiA+Pg0KPiA+PiBUaGlzIGxpbmUgaXMgdG9v
IGxvbmcgbm93Lg0KPiA+DQo+ID4gSG1tLCBob3cgYWJvdXQgSSBpbnRyb2R1Y2UgYSBuZXcgS2Nv
bmZpZywgc29tZXRoaW5nIGxpa2U6DQo+ID4gYGBgDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcgaW5kZXgNCj4gPiBjODA4Yzk4OWZj
Li5lYzhmNTFiMGIxIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+ID4g
KysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4gPiBAQCAtMTY2LDYgKzE2Niw5IEBAIGNvbmZp
ZyBTSEFET1dfUEFHSU5HICBjb25maWcgUEFHSU5HDQo+ID4gICAgICAgICBkZWZfYm9vbCBIVk0g
fHwgU0hBRE9XX1BBR0lORw0KPiA+DQo+ID4gK2NvbmZpZyBQQUdJTkdfTE9HX0RJUlRZDQo+ID4g
KyAgICAgICBkZWZfYm9vbCBQQUdJTkcNCj4gPiArDQo+ID4gIGNvbmZpZyBCSUdNRU0NCj4gPiAg
ICAgICAgIGJvb2wgImJpZyBtZW1vcnkgc3VwcG9ydCINCj4gPiAgICAgICAgIGRlZmF1bHQgbg0K
PiA+IGBgYA0KPiA+IFRoZW4sIGxhdGVyIGZ1dHVyZSBkZXBlbmRlbmN5IGNvdWxkIGJlIGFkZGVk
IHRvIFBBR0lOR19MT0dfRElSVFkNCj4NCj4gSSBmZWFyIEkgZG9uJ3Qgc2VlIGhvdyBoYXZpbmcg
YW4gb3B0aW9uIG1lcmVseSBhbGlhc2luZyBhbm90aGVyIG9wdGlvbiB3b3VsZCBoZWxwIHRoZQ0K
PiBsaW5lIGxlbmd0aCBpc3N1ZS4gSSBtYXkgc2ltcGx5IGJlIG1pc3Npbmcgc29tZSBjb250ZXh0
IC4uLg0KDQpMYXRlciB3aGVuIE1HTVRfSFlQRVJDQ0FMTFMga2lja3MgaW4sIHdlIGNvdWxkIGhh
dmUgdG8gYXZvaWQgb3ZlcmxvbmcgI2lmZGVmOg0KYGBgDQojaWYgZGVmaW5lZChDT05GSUdfUEFH
SU5HX0xPR19ESVJUWSkgJiYgIWRlZmluZWQoQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFKQ0KI2Rl
ZmluZSBQR19sb2dfZGlydHkgICAoWEVOX0RPTUNUTF9TSEFET1dfRU5BQkxFX0xPR19ESVJUWSA8
PCBQR19tb2RlX3NoaWZ0KQ0KLi4uDQpgYGANClRoZSBhZGRpdGlvbiBvZiBNR01UX0hZUEVSQ0NB
TExTIGRlcGVuZGVuY3kgY291bGQgYmUgYWRkZWQgdG8gUEFHSU5HX0xPR19ESVJUWSBrY29uZmln
DQpgYGANCmNvbmZpZyBQQUdJTkdfTE9HX0RJUlRZDQogICAgICAgIGRlZl9ib29sIFBBR0lORyAm
JiBNR01UX0hZUEVSQ0FMTFMNCmBgYA0KDQo+DQo+IEphbg0K

