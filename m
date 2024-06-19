Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09090E7F0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 12:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743612.1150530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJsHA-0002lV-3g; Wed, 19 Jun 2024 10:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743612.1150530; Wed, 19 Jun 2024 10:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJsHA-0002j7-0b; Wed, 19 Jun 2024 10:10:48 +0000
Received: by outflank-mailman (input) for mailman id 743612;
 Wed, 19 Jun 2024 10:10:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeeD=NV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJsH8-0002iv-IX
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 10:10:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3070454c-2e24-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 12:10:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 10:10:41 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 10:10:41 +0000
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
X-Inumbo-ID: 3070454c-2e24-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1GnRDn0aMS+dNaWBkKrUhExfMQPlN0fPjf9zLtonvtg7ZREsY7DjET//nf34ZrB28+YI3i80wdJjOqk8w740OgxjJgVRiaAEp/mrQ3nFhVH834PAlWSbOqlJpnR99B6C6gx1a+fMFfMi9u1/hwBq95XMwRCJySzDSNWmeNVYtCu7b5KZZNpMURyxaQGhJBK+Q/bQcEXDOXX/znepCiO8ZX0GO7dL3R8Tx257GY8/wZUAI5D8Fu6klDQnMGZM9XC+fTTqVehIwbqqXkX/9B2NKUaJgDkRZZGbCc0yvSGo5dIjVhM5TJGAoE2BsvRzvxEkRatEuR7Od6LDAIaqRmBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAFaY3835/5VXsvcwiLyNxPzUKU3mPun3ddUNNa43as=;
 b=nMqLytwbzGDzG/LyQdh1RtdKPSVe47BlK8oHM2Ickh/rkOnxpQzjJQY9sFMZN8B3/ApI4jqNqhxZwfs2V2Nc5zpP/EzlrglN7Zg2WCymKB0SpOUlunEMMuT3KqKpRzH7LLgHKmcjBqCPmMKwpPEb+DQ+FQZpZ8tnh8gkjbrVFDutixvJvMxSud9b5S/TGlAE7+6uOF04wPTvH6C4wCbKZCoip8HIUTRxbVyVJQ4H1rFTz33/MkMcAWD9BEvC2YgrfURVO4MzFxOjRs994bB+cZ9UcuivdhYrPMq1nkHeqK2pQpRF1+u5ngIUlwY2PwwPTjceDwxAf8grLKshUvSUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAFaY3835/5VXsvcwiLyNxPzUKU3mPun3ddUNNa43as=;
 b=kEpa8QFzphoOakGvgragKVQNHR5gBA0S+qE4Jc30Mb0TiixkXnE7WTKnd9mpyofp6N2FjVoSwFnTpU7i+dvgs2LVpYgRXXYgU3vPz4OXI7e/N0GQkpTrfUJ1FZSDreOaarOmleyHzl8sTruKfQIHMooST2bldHFNHVgEHrlAvWI=
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
Subject: Re: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index:
 AQHawJTljFn+TFlFw0Cz/HTewbBwKbHMCqyAgAGSNQD//5yWgIAB+7GA//+I/4CAAJBIgP//jEaAABEfFIA=
Date: Wed, 19 Jun 2024 10:10:41 +0000
Message-ID:
 <BL1PR12MB58497CC7608B40987BB63C77E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
 <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
 <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b923a32e-3c22-4e7a-8844-b33322ef8ad1@suse.com>
 <BL1PR12MB5849861E424724C6E9DE3859E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ff66c7aa-585f-4d30-9f4f-e520226825bc@suse.com>
 <BL1PR12MB58498905D185C6A720276D1BE7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c83474d9-8c72-412a-92eb-222088a0bf3a@suse.com>
In-Reply-To: <c83474d9-8c72-412a-92eb-222088a0bf3a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7193:EE_
x-ms-office365-filtering-correlation-id: f8783d6f-26d7-40d1-2b35-08dc90481311
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|366013|7416011|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?MjFKNlJBMk4wRnRDSGlvc0MrYVd2clBLenR6UmNVdmdWNUdVZVM0TkhaV3B4?=
 =?utf-8?B?a3dRTHU2eWJGZjA3VGtEbmQzVDd0bWszaHoraDZJVGJaSEFQbFJzclF3RFJx?=
 =?utf-8?B?Q1ZyajU3TWpPZHhLSGk3OUtHV2wrKzh2enMxc3dlbkt4a3FPZkpMVXZwWTVz?=
 =?utf-8?B?dmtnV2hlOWhFZkVnK3hxSWJoZC9SOEVyMXhZaGpyb0pFOC81Q0pkUzBYTi9l?=
 =?utf-8?B?Zy9MdHJVRGZySjRaeHhOdzljYlVpSEV6ckxENmx0czRpVFY4UVExeHljOU5Q?=
 =?utf-8?B?QkJ5dk9Pd2RHSXZUamdVYUtsZXpYbFU3YWcwenpGR1hKTGJrc1czQUNXUHJ4?=
 =?utf-8?B?M3QzbnFXMUhPeFZ5SGtOWmI1ZGtNdE83WDJUM2FOM2kyYVkxN3RYdlVVZktx?=
 =?utf-8?B?THJ2MS9aNTZMTXNEWEQ5aEhBRG14V3BFWjJHc1YyUnpkT3ZEcmtzcjUxN0Z3?=
 =?utf-8?B?Q2NaQ3dma3FOUHo1YUc3Y2FZZEcvNnJPMjBsUGlhVDdOaElsVHF5d2t2SXNC?=
 =?utf-8?B?ak5wc1J2T1Z5TEpjM2Nrb1NRc0k1bjhQVDNYaGRNL0ExWFFWRC94Wkc2dnpY?=
 =?utf-8?B?UkdibVp0TnhWRW1CNCt0T1c3SWhBMFdiTlBsc2pJZFBMd0RwblpuYjh5Q0Y5?=
 =?utf-8?B?R2FQSDJPWXQ5UlZleUdjOVFlcUR4aC95T3pXT2RBWGNpTzlua21obGhUVGdl?=
 =?utf-8?B?cTFWazhPR3NFQjN6bmdYY2RVWmVVckoyRE5pL3Qrbis0Z2duNU10Wmw1UjFY?=
 =?utf-8?B?MVFkSDlzVmpxM2JXbHl5SWVlbWF1c3RTcHJvcVRlUTZWTFBzYlU2THJMTFM0?=
 =?utf-8?B?TGg2ak42a2xWa0M2bTRiQm1TTGVyeCtnZjBuaVhJTm04V1QwYnZNZUVuTE5G?=
 =?utf-8?B?MzAvRG5IRExGSDdWamtZazllSlZENzQ5VXJHUEduQkNSUkxBWnVYYjJTQ1VF?=
 =?utf-8?B?Y2JhNGZzTDdXRDdkbzlySVBBUnhrUmx4RUU2U2RVWHpVSWQyeGZESldNK0JF?=
 =?utf-8?B?b3pqWk45SDdHNE54V0gzUHFHTllDRmpvSmpMWm5OdFVmY1VLYXlKaW9XMVN5?=
 =?utf-8?B?TExWZU91UHBRR0tjcmNPU3orNEhrZDhpaVo5a2JwbngzMkN1ZURSSGZaS1hV?=
 =?utf-8?B?MFpPd3kwMkFJRUVvUnllUzdDOVNzTXlFbjNUVVZKVmROb1lqSkc3dkNidUZ6?=
 =?utf-8?B?b3ozdUFRMmdOOE9PV3IwWTV0QzdTNWloYVVjOGlUZkttMGoxMEtqZUxObUp5?=
 =?utf-8?B?ZDkrNWFkbzJMTkJIT1hSTEJOS0ZKN1lnQXpuLzQ5NFRPMzVzNDJhTEdHNkM3?=
 =?utf-8?B?STU4U21wb2I0M2s1b0QwMDdkWFNpcHArQ3pQb3ZtRE9iSk5lalhLT3FHc0Z6?=
 =?utf-8?B?dWxGSVZJaW5JZUZ5U0w4OE95ZWRmNFYzM0U3V3B1OXNJSjFjY0liTnA3ekJx?=
 =?utf-8?B?OVFJTW1WRjU1UGdiSGdwQVpaRjBmWC9nZjI2NHBOcEx4TWE0Q2hOZzVXUGEy?=
 =?utf-8?B?Wi9WTVkzeittMGJaY25wVzNSVVZmVzBwMkZ4cVNJZWQ5eDJ3L2dSUElZb2Fr?=
 =?utf-8?B?ZjA4Wlh5VmtUVXF5dzNZL1BOZDZhTHNZQ0VjcFFXVzRzTG1tdGIxQk5MeUMv?=
 =?utf-8?B?Unc5djl4NHRmaWMxeWhwVUNNTGtVUWFSd3BVZTFuZzdkZUtEcExtK1ZaUVdG?=
 =?utf-8?B?VkFEd2xKTmZuTTQ4VjZxUEI1SUZJbEthM3JWKzVWQ3VibVAwR3RtbFVhcE0y?=
 =?utf-8?Q?LdkON1U0V1Q/7Jw51ngSjvwIZi1bfYcd8g+feR6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVlTTGg0aHZqWTNhcitJL3owalVmck1XUStyRGl3OGhjeHlPdjlWMjdaUjNj?=
 =?utf-8?B?NzF3UkZzQW1sTHZYN3BMcTQ4L1R2TmlqZmg5U1pzMFRvMmdrTHpWT1hmdG0y?=
 =?utf-8?B?d1BxMU1MU25aRFUyK2ZWY25WRDZRVnM4Q2hjNkxXRmM0bnBJM2RoKzJBN1BJ?=
 =?utf-8?B?QW1SbUV3clFXS1JGRktyRGRYRTFUSW9ObTN5MGtrdkltbEZhMUc0emkwMlBn?=
 =?utf-8?B?Y1FGWldobU9kSGJRZGsrd2oxcCsya2EvZFFvc1ZsOEM1TVFmdDhZRkh6eUtK?=
 =?utf-8?B?cHU3QjVwU0MwNndWS2ZZejQ5UWg1QjE5NG5hSVU5YWUxSThlNGRGUWJxY29i?=
 =?utf-8?B?dDJhYVVVLzhVUlhGWXJPQWJOemxJZlZOeFFFeC9ZM0RvdHF6Z3JXcTRnUXJu?=
 =?utf-8?B?VTFrMjJLQnZhNHdGQUIxRWhhbm5sR25DZWFSSVoxL2h4NzJOeG9TTUNYNUsw?=
 =?utf-8?B?b0p2WXZSZklTTjloTzlkSXpDR2VDRnBuVVEwQUxwbVVzUmxuVGkzSURtSjNP?=
 =?utf-8?B?b1JKL1NwbkFwY3NiTXlQdDdqdlFobUM4SzcxZXA2a3B4emwvVmVaY0phL1JF?=
 =?utf-8?B?ajl5RHdWemJZbkhvclhMdHBnbHpSWGovekNyTThpYlVaTDBXY2k5ZlNQQjV1?=
 =?utf-8?B?MGdMaGhvaExzNWM2akgwRmkxYy84ZTVlVWY2TEhPVFdodlY3UUtVckRrQ1J3?=
 =?utf-8?B?WFhoTFhXRklQcy9xMFJmcXg4V0hQTFhLaGdia3ZGVVhvNTc4ZVEvWU8vMkdu?=
 =?utf-8?B?eW5UOUR1QWZxdnBQcWxaTzdhS0l0alJadW9UZWllVmRUWmVKeWhSMkVOODZF?=
 =?utf-8?B?SFpaU203dlJXZmxGSlg4dFpGVkJJaHBUNk40WjEzVFE2bWZKd2cvUXlXN0Ri?=
 =?utf-8?B?dVdGOHZNN0U3SkRhOWZMZUFsTC9LZlJ6Yk03MDFUZkNGRXRySUdlcDJZUXVj?=
 =?utf-8?B?S2lUV0hsLzB5ZTZFOW1JRldGQnpiblBuUDJLTU9HM3dRb0d6a2NEVGtuS2RS?=
 =?utf-8?B?U0FuTFF6Q0p5M0ZDdUhhMHU3bGh3MWpNcHFqRnNjWWNOM1pFME45UmR1ZDhQ?=
 =?utf-8?B?bXh3eGhiY1J3OXdlQXRqVXBRTHVBMkd6RVQ5Nk12SlFwV05mZ2hVd0FxdU9L?=
 =?utf-8?B?VUtwU2E4NVhsV0IySndSUGZULzdnSE83WmVaNTkvV3BaRHlSVnhYT2htMmkz?=
 =?utf-8?B?cTBSWi9xVDRpTUhuWm5oMlk1b1ozT2toelNCWEl0bVUvbGtPU0t1MDEvM2lU?=
 =?utf-8?B?Z0piZ05vVERvYjB2c2tYWmdHREVwYnZvRzJ4UUgxeVpiMHRTejQrT3d0SFpH?=
 =?utf-8?B?MHVOdm05cGpZZGMvYW56ZHBVRk9rcjJ4Q2NVenlrUFZvTU82TzlmRnBsQzNl?=
 =?utf-8?B?UEMwcTBhR2tHdmh2VSsvMUN3c2xlT3VUQVUwdG1QNXpmNUV2R0hiTUtVTUth?=
 =?utf-8?B?aFd0TWM2OVFrRXlwMzFVOXg3K1lyYmRzejFTMFpyMWFpSEVvTzZIQ0JIYkZh?=
 =?utf-8?B?TXB4TzlJOXpzUkJsSGQyYmdRM2xNbmVXT0k5RVlQZDY4TzZNa3psdXlJWEdR?=
 =?utf-8?B?WDBwdWdmalZBci83REdrSnVXa3JTVzFHdTA2Z2hZTkpoejVhSUpCU3NzeTRq?=
 =?utf-8?B?T0RybTI1cFBXc2JxZTZBR1lsVjdpbUp0aC8vMm5MKzc1OGFZamJmLzBraEE0?=
 =?utf-8?B?MHVDWjBUdTRYSFUzTWRmVTJOUHNwOGVGc0d6dXZKYW9JZlFVZ0MzZTJqVjJx?=
 =?utf-8?B?Q0s1VlpUL09HbXhnL1JKelVscjhFdmFXMVNqdzdNUkNpTlp3RVlhK29WTEp6?=
 =?utf-8?B?cXUybmF6M1VlbGdxOHltYXJjb05HaDJTNThoSzkzRHkwS2NsSUU4ZmRtc2h5?=
 =?utf-8?B?eTNac0Q2M1lRc3d1eUhJUEtXNXBwSGFjNnVPdjNHdjdaT0ZiWU05MFFRYURv?=
 =?utf-8?B?c1MrMmNYS01aVE8zTys2bWNtUUs2dXlSdTYzcEQ3ZUdxZ0dDcFk0QktwbzNl?=
 =?utf-8?B?cGEyMlpIVEt5MGFLdjUxV2ROclhiUUMreU5KT045WUlnZDh6V0Y0ZkZBZnNX?=
 =?utf-8?B?RjlWbGQ2ZVhBNWJnTFdhaCtOczhmOC93VWN4Zkt6TEtKd3AxMWVqaGVHU0Y4?=
 =?utf-8?Q?TSMU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EE31C53AE922149B7E4BFD61410E4E9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8783d6f-26d7-40d1-2b35-08dc90481311
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 10:10:41.1174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+oiYMScLW9Ld/aHg+y5t8Jz7uV+9YF6CyZ83HPUe1XmCFe0mIYTNuJ5Ze5Hq0TELVSSi1cjWGfpFUvRteuEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193

T24gMjAyNC82LzE5IDE3OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAyNCAx
MDo1MSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE5IDE2OjA2LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wNi4yMDI0IDA5OjUzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNi8xOCAxNjo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
OC4wNi4yMDI0IDA4OjU3LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNC82LzE3
IDIyOjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTcuMDYuMjAyNCAxMTowMCwg
SmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiBUaGUgZ3NpIG9mIGEgcGFzc3Rocm91Z2ggZGV2
aWNlIG11c3QgYmUgY29uZmlndXJlZCBmb3IgaXQgdG8gYmUNCj4+Pj4+Pj4+IGFibGUgdG8gYmUg
bWFwcGVkIGludG8gYSBodm0gZG9tVS4NCj4+Pj4+Pj4+IEJ1dCBXaGVuIGRvbTAgaXMgUFZILCB0
aGUgZ3NpcyBkb24ndCBnZXQgcmVnaXN0ZXJlZCwgaXQgY2F1c2VzDQo+Pj4+Pj4+PiB0aGUgaW5m
byBvZiBhcGljLCBwaW4gYW5kIGlycSBub3QgYmUgYWRkZWQgaW50byBpcnFfMl9waW4gbGlzdCwN
Cj4+Pj4+Pj4+IGFuZCB0aGUgaGFuZGxlciBvZiBpcnFfZGVzYyBpcyBub3Qgc2V0LCB0aGVuIHdo
ZW4gcGFzc3Rocm91Z2ggYQ0KPj4+Pj4+Pj4gZGV2aWNlLCBzZXR0aW5nIGlvYXBpYyBhZmZpbml0
eSBhbmQgdmVjdG9yIHdpbGwgZmFpbC4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUbyBmaXggYWJvdmUg
cHJvYmxlbSwgb24gTGludXgga2VybmVsIHNpZGUsIGEgbmV3IGNvZGUgd2lsbA0KPj4+Pj4+Pj4g
bmVlZCB0byBjYWxsIFBIWVNERVZPUF9zZXR1cF9nc2kgZm9yIHBhc3N0aHJvdWdoIGRldmljZXMg
dG8NCj4+Pj4+Pj4+IHJlZ2lzdGVyIGdzaSB3aGVuIGRvbTAgaXMgUFZILg0KPj4+Pj4+Pj4NCj4+
Pj4+Pj4+IFNvLCBhZGQgUEhZU0RFVk9QX3NldHVwX2dzaSBpbnRvIGh2bV9waHlzZGV2X29wIGZv
ciBhYm92ZQ0KPj4+Pj4+Pj4gcHVycG9zZS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pj4+Pj4+IC0tLQ0KPj4+
Pj4+Pj4gVGhlIGNvZGUgbGluayB0aGF0IHdpbGwgY2FsbCB0aGlzIGh5cGVyY2FsbCBvbiBsaW51
eCBrZXJuZWwgc2lkZSBpcyBhcyBmb2xsb3dzOg0KPj4+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcveGVuLWRldmVsLzIwMjQwNjA3MDc1MTA5LjEyNjI3Ny0zLUppcWlhbi5DaGVuQGFtZC5j
b20vDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uZSBvZiBteSB2OSBjb21tZW50cyB3YXMgYWRkcmVzc2Vk
LCB0aGFua3MuIFJlcGVhdGluZyB0aGUgb3RoZXIsIHVuYWRkcmVzc2VkDQo+Pj4+Pj4+IG9uZSBo
ZXJlOg0KPj4+Pj4+PiAiQXMgdG8gR1NJcyBub3QgYmVpbmcgcmVnaXN0ZXJlZDogSWYgdGhhdCdz
IG5vdCBhIHByb2JsZW0gZm9yIERvbTAncyBvd24NCj4+Pj4+Pj4gIG9wZXJhdGlvbiwgSSB0aGlu
ayBpdCdsbCBhbHNvIHdhbnQvbmVlZCBleHBsYWluaW5nIHdoeSB3aGF0IGlzIHN1ZmZpY2llbnQg
Zm9yDQo+Pj4+Pj4+ICBEb20wIGFsb25lIGlzbid0IHN1ZmZpY2llbnQgd2hlbiBwYXNzLXRocm91
Z2ggY29tZXMgaW50byBwbGF5LiINCj4+Pj4+PiBJIGhhdmUgbW9kaWZpZWQgdGhlIGNvbW1pdCBt
ZXNzYWdlIHRvIGRlc2NyaWJlIHdoeSBHU0lzIGFyZSBub3QgcmVnaXN0ZXJlZCBjYW4gY2F1c2Ug
cGFzc3Rocm91Z2ggbm90IHdvcmssIGFjY29yZGluZyB0byB0aGlzIHY5IGNvbW1lbnQuDQo+Pj4+
Pj4gIiBpdCBjYXVzZXMgdGhlIGluZm8gb2YgYXBpYywgcGluIGFuZCBpcnEgbm90IGJlIGFkZGVk
IGludG8gaXJxXzJfcGluIGxpc3QsIGFuZCB0aGUgaGFuZGxlciBvZiBpcnFfZGVzYyBpcyBub3Qg
c2V0LCB0aGVuIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UsIHNldHRpbmcgaW9hcGljIGFmZmlu
aXR5IGFuZCB2ZWN0b3Igd2lsbCBmYWlsLiINCj4+Pj4+PiBXaGF0IGRlc2NyaXB0aW9uIGRvIHlv
dSB3YW50IG1lIHRvIGFkZD8NCj4+Pj4+DQo+Pj4+PiBXaGF0IEknZCBmaXJzdCBsaWtlIHRvIGhh
dmUgY2xhcmlmaWNhdGlvbiBvbiAoaS5lLiBiZWZvcmUgcHV0dGluZyBpdCBpbg0KPj4+Pj4gdGhl
IGRlc2NyaXB0aW9uIG9uZSB3YXkgb3IgYW5vdGhlcik6IEhvdyBjb21lIERvbTAgYWxvbmUgZ2V0
cyBhd2F5IGZpbmUNCj4+Pj4+IHdpdGhvdXQgbWFraW5nIHRoZSBjYWxsLCB5ZXQgZm9yIHBhc3N0
aHJvdWdoLXRvLURvbVUgaXQncyBuZWVkZWQ/IElzIGl0DQo+Pj4+PiBwZXJoYXBzIHRoYXQgaXQg
anVzdCBzbyBoYXBwZW5lZCB0aGF0IGZvciBEb20wIHRoaW5ncyBoYXZlIGJlZW4gd29ya2luZw0K
Pj4+Pj4gb24gc3lzdGVtcyB3aGVyZSBpdCB3YXMgdGVzdGVkLCBidXQgdGhlIGNhbGwgc2hvdWxk
IGluIHByaW5jaXBsZSBoYXZlIGJlZW4NCj4+Pj4+IHRoZXJlIGluIHRoaXMgY2FzZSwgdG9vIFsx
XT8gVGhhdCAodG8gbWUgYXQgbGVhc3QpIHdvdWxkIG1ha2UgcXVpdGUgYQ0KPj4+Pj4gZGlmZmVy
ZW5jZSBmb3IgYm90aCB0aGlzIHBhdGNoJ3MgZGVzY3JpcHRpb24gYW5kIHVzIGFjY2VwdGluZyBp
dC4NCj4+Pj4gT2gsIEkgdGhpbmsgSSBrbm93IHdoYXQncyB5b3VyIGNvbmNlcm4gbm93LiBUaGFu
a3MuDQo+Pj4+IEZpcnN0IHF1ZXN0aW9uLCB3aHkgZ3NpIG9mIGRldmljZSBjYW4gd29yayBvbiBQ
VkggZG9tMDoNCj4+Pj4gQmVjYXVzZSB3aGVuIHByb2JlIGEgZHJpdmVyIHRvIGEgbm9ybWFsIGRl
dmljZSwgaXQgd2lsbCBjYWxsIGxpbnV4IGtlcm5lbCBzaWRlOnBjaV9kZXZpY2VfcHJvYmUtPiBy
ZXF1ZXN0X3RocmVhZGVkX2lycS0+IGlycV9zdGFydHVwLT4gX191bm1hc2tfaW9hcGljLT4gaW9f
YXBpY193cml0ZSwgdGhlbiB0cmFwIGludG8geGVuIHNpZGUgaHZtZW11bF9kb19pby0+IGh2bV9p
b19pbnRlcmNlcHQtPiBodm1fcHJvY2Vzc19pb19pbnRlcmNlcHQtPiB2aW9hcGljX3dyaXRlX2lu
ZGlyZWN0LT4gdmlvYXBpY19od2RvbV9tYXBfZ3NpLT4gbXBfcmVnaXN0ZXJfZ3NpLiBTbyB0aGF0
IHRoZSBnc2kgY2FuIGJlIHJlZ2lzdGVyZWQuDQo+Pj4+IFNlY29uZCBxdWVzdGlvbiwgd2h5IGdz
aSBvZiBwYXNzdGhyb3VnaCBjYW4ndCB3b3JrIG9uIFBWSCBkb20wOg0KPj4+PiBCZWNhdXNlIHdo
ZW4gYXNzaWduIGEgZGV2aWNlIHRvIGJlIHBhc3N0aHJvdWdoLCBpdCB1c2VzIHBjaWJhY2sgdG8g
cHJvYmUgdGhlIGRldmljZSwgYW5kIGl0IGNhbGxzIHBjaXN0dWJfcHJvYmUsIGJ1dCBpbiBhbGwg
Y2FsbHN0YWNrIG9mIHBjaXN0dWJfcHJvYmUsIGl0IGRvZXNuJ3QgdW5tYXNrIHRoZSBnc2ksIGFu
ZCB3ZSBjYW4gc2VlIG9uIFhlbiBzaWRlLCB0aGUgZnVuY3Rpb24gdmlvYXBpY19od2RvbV9tYXBf
Z3NpLT4gbXBfcmVnaXN0ZXJfZ3NpIHdpbGwgYmUgY2FsbGVkIG9ubHkgd2hlbiB0aGUgZ3NpIGlz
IHVubWFza2VkLCBzbyB0aGF0IHRoZSBnc2kgY2FuJ3Qgd29yayBmb3IgcGFzc3Rocm91Z2ggZGV2
aWNlLg0KPj4+DQo+Pj4gQW5kIHdoeSBleGFjdGx5IHdvdWxkIHRoZSBmYWtlIElSUSBoYW5kbGVy
IG5vdCBiZSBzZXQgdXAgYnkgcGNpYmFjaz8gSXRzDQo+Pj4gc2V0dGluZyB1cCBvdWdodCB0byBs
ZWFkIHRvIHRob3NlIHNhbWUgSU8tQVBJQyBSVEUgd3JpdGVzIHRoYXQgWGVuDQo+Pj4gaW50ZXJj
ZXB0cy4NCj4+IEJlY2F1c2UgaXNyX29uIGlzIG5vdCBzZXQsIHdoZW4geGVuX3BjaWJrX2NvbnRy
b2xfaXNyIGlzIGNhbGxlZCwgaXQgd2lsbCByZXR1cm4gZHVlIHRvICIgIWRldl9kYXRhLT5pc3Jf
b24iLiBTbyB0aGF0IGZha2UgSVJRIGhhbmRsZXIgYXJlbid0IGluc3RhbGxlZC4NCj4gDQo+IEkn
bSBhZnJhaWQgSSBkb24ndCBmb2xsb3cgeW91IGhlcmUuIFF1b3RpbmcgZnJvbSB0aGUgZnVuY3Rp
b246DQo+IA0KPiAJZW5hYmxlID0gIGRldl9kYXRhLT5lbmFibGVfaW50eDsNCj4gDQo+IAkvKiBB
c2tlZCB0byBkaXNhYmxlLCBidXQgSVNSIGlzbid0IHJ1bm5pZyAqLw0KPiAJaWYgKCFlbmFibGUg
JiYgIWRldl9kYXRhLT5pc3Jfb24pDQo+IAkJcmV0dXJuOw0KPiANCj4gSS5lLiB3ZSBiYWlsIGlm
IHRoZSByZXF1ZXN0IHdhcyB0byBfZGlzYWJsZV8gYW5kIHRoZXJlIGlzIG5vIElTUi4NCkkgbWVh
biwgYWZ0ZXIgZGVidWdnaW5nIHRoZSBwY2lzdHViX3Byb2JlIGNhbGxzdGFjazoNCnBjaXN0dWJf
c2VpemUtPiBwY2lzdHViX2luaXRfZGV2aWNlLT4geGVuX3BjaWJrX3Jlc2V0X2RldmljZS0+IHhl
bl9wY2lia19jb250cm9sX2lzcihkZXYsIDEgLypyZXNldCBkZXZpY2UqLykNCmFuZCBpbiB4ZW5f
cGNpYmtfY29udHJvbF9pc3IgY29kZToNCglpZiAocmVzZXQpIHsNCgkJZGV2X2RhdGEtPmVuYWJs
ZV9pbnR4ID0gMDsNCgkJZGV2X2RhdGEtPmFja19pbnRyID0gMDsNCgl9DQoJZW5hYmxlID0gIGRl
dl9kYXRhLT5lbmFibGVfaW50eDsNCg0KCS8qIEFza2VkIHRvIGRpc2FibGUsIGJ1dCBJU1IgaXNu
J3QgcnVubmlnICovDQoJaWYgKCFlbmFibGUgJiYgIWRldl9kYXRhLT5pc3Jfb24pDQoJCXJldHVy
bjsNCiJyZXNldCIgaXMgMSwgc28gImRldl9kYXRlLT5lbmFibGVfaW50eCIgaXMgc2V0IDAsIHRo
ZW4gImVuYWJsZSIgaXMgMCwgYW5kIHRoZW4gYXJyaXZlIHRoZSBzZWNvbmQgImlmIiBjaGVjaywg
ImVuYWJsZSIgaXMgMCBhbmQgImRldl9kYXRlLT5pc3Jfb24iIGlzIGFsc28gMCwgc28gaXQgcmV0
dXJuIGhlcmUuDQpJdCBjYW4ndCByZWFjaCBmb2xsb3dpbmcgY29kZSB0byBpbnN0YWxsIGlycSBo
YW5kbGUuDQoNCj4gDQo+IEkgY2FuJ3QgZXhjbHVkZSB0aG91Z2ggdGhhdCBjb21tYW5kX3dyaXRl
KCkncyBsb2dpYyB0byBzZXQgLT5lbmFibGVfaW50eA0KPiBpcyBpbnN1ZmZpY2llbnQuIEJ1dCBp
biB0aGUgY29tbW9uIGNhc2Ugb25lIHdvdWxkIHN1cmVseSBleHBlY3QgYXQgbGVhc3QNCj4gb25l
IG9mIFBDSV9DT01NQU5EX01FTU9SWSBhbmQgUENJX0NPTU1BTkRfSU8gdG8gYmUgc2V0IGZpcnN0
IGJ5IGEgZ3Vlc3QuDQo+IElPVyBhdCBzb21lIHBvaW50IEknZCBleHBlY3QgeGVuX3BjaWJrX2Nv
bnRyb2xfaXNyKCkgdG8gYmUgY2FsbGVkIHdpdGgNCj4gdGhlIHNlY29uZCBhcmd1bWVudCAwIGFu
ZCB3aXRoIC0+ZW5hYmxlX2ludHggc2V0Lg0KSSBvbmx5IHNlZSB4ZW5fcGNpYmtfY29udHJvbF9p
c3IoZGV2LCAwKSBpcyBjYWxsZWQgaW4geGVuX3BjaWJrX2RvX29uZV9vcCwgYnV0IHhlbl9wY2li
a19kb19vbmVfb3AgaXMgbm90IGNhbGxlZCBkdXJpbmcgYXNzaWduaW5nIGEgZGV2aWNlIHRvIGJl
IHBhc3N0aHJvdWdoLg0KDQo+IA0KPj4gQW5kIGl0IHNlZW1zIGlzcl9vbiBpcyBzZXQgdGhyb3Vn
aCBkcml2ZXIgc3lzZnMgIiBpcnFfaGFuZGxlcl9zdGF0ZSIgZm9yIGEgbGV2ZWwgZGV2aWNlIHRo
YXQgaXMgdG8gYmUgc2hhcmVkIHdpdGggZ3Vlc3QgYW5kIHRoZSBJUlEgaXMgc2hhcmVkIHdpdGgg
dGhlIGluaXRpYWwgZG9tYWluLg0KPiANCj4gVGhlIHN5c2ZzIGludGVyZmFjZSBpcywgYWNjb3Jk
aW5nIHRvIG15IHJlYWRpbmcgb2YgdGhlIGRlc2NyaXB0aW9uDQo+IG9mIHRoZSBjb21taXQgaW50
cm9kdWNpbmcgaXQsIG1lcmVseSBmb3IgZGVidWdnaW5nIC8gcmVjb3ZlcnkgcHVycG9zZXMuDQo+
IChJdCBhbHNvIGxvb2tzIHRvIG1lIGFzIGlmIHRoaXMgd2FzIHBhcnRseSBicm9rZW46IElmIG9u
ZSB3b3VsZCB1c2UgaXQsDQo+IHRodXMgY2xlYXJpbmcgLT5pc3Jfb24sIGEgc3Vic2VxdWVudCBk
aXNhYmxlIHJlcXVlc3Qgd291bGQgdGFrZSBleGFjdGx5DQo+IHRoYXQgZWFybHkgYmFpbGluZyBw
YXRoIHF1b3RlZCBhYm92ZSwgd2l0aCBub3RoaW5nIHJlbW92aW5nIHRoZSBJUlENCj4gaGFuZGxl
ci4pDQo+IA0KPiBUaGF0IGRlc2NyaXB0aW9uIGFsc28gdGFsa3MgYWJvdXQgYm90aCBhbiBlZGdl
IHZzIGxldmVsIGRpc3RpbmN0aW9uIGluDQo+IGJlaGF2aW9yIGFuZCBvbmUgZm9yIHNoYXJlZCB2
cyBub24tc2hhcmVkLCBidXQgbmVpdGhlciBpbiB0aGF0IGNvbW1pdA0KPiBub3IgaW4gcHJlc2Vu
dCBjb2RlIEkgY2FuIHNwb3QgYW55IHJlc3BlY3RpdmUgY2hlY2tzLiBPdGhlcndpc2UgSSBjb3Vs
ZA0KPiB1bmRlcnN0YW5kIHRoYXQgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIHRoZSBuZWNlc3Nhcnkg
aW5mb3JtYXRpb24gaXNuJ3QNCj4gcHJvcGFnYXRlZCB0byBYZW4uDQo+IA0KPiBKYW4NCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

