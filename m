Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF690C415
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 08:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742730.1149580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSmh-0007AE-Kn; Tue, 18 Jun 2024 06:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742730.1149580; Tue, 18 Jun 2024 06:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSmh-00078B-Gk; Tue, 18 Jun 2024 06:57:39 +0000
Received: by outflank-mailman (input) for mailman id 742730;
 Tue, 18 Jun 2024 06:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZif=NU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJSmf-000785-Kk
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 06:57:37 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20615.outbound.protection.outlook.com
 [2a01:111:f403:2407::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a4f6130-2d40-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 08:57:35 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 06:57:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 06:57:31 +0000
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
X-Inumbo-ID: 0a4f6130-2d40-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTA25Hzd9l5Hx/6fi9sxYi5PEhiGWYMHqzL4HtUfvyCMKgdS1KMN+gPAZeaiUQYsZjenpIQDqOoGzNgcwKN517/hl+SW/8dr+yo1Ejp3VVXYIINlqpaw8TnNm29e+AmfvEC3jCrSsZyp/YJrTQlMRDZHrUpsw35RuZtu+d1K76ov7etBrpCd4wRKM5G6qITX4I1B1kMLHbY8VTpltQFNOtjEU3H3RCzdmvX0rPJJHylORsXf5ctjw1+ArI402RuZSGNzIsKe9QvbNoyStxgVrupgXaPWX0tivQe/fFhwgBYzXq3YInIPo2jMpep29QXPE2G4isGINwhPIhiXf43TRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uEM2O6gE80Wmbd/IF65Tij8x9OmILiYI9NuqFdZjSo=;
 b=eXabIw9wqdAEy6yg4R0PilguvIwt8dsdvxzAg8L/CpB7vDm4YaJRT5IZ9E6+LapiugZGGpFRv5njbD245DiB0wkL9usY83PKRW5u1rgHGFe0hwXm37RHzxFV0ctnQIBtHRrbr3gYKe55h6MGOPlqDDkjgLFD8dSkeyHiuwS6ks2+FajktlpRaDl0yVXwPQ0EmrLGPsDt3OFyODNREfyRHUkNOS9e2nT+W5YyndhotRB06sHVlZgXePFEloNTLqo9CkHo6dqpSgc+38ZlHa1TgT4oz69JEkCjHAHuTQNphjeL1IynvXJuTu7iIbte5t8kHxs7Jm1/r+hWoMhTqIOkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uEM2O6gE80Wmbd/IF65Tij8x9OmILiYI9NuqFdZjSo=;
 b=5PIhD/eg9e3He+s5V0hAtPuFxGV4vokVScoBsnJRbVzJ8kZLundclvMYSIcHf/zOsEf+3ty8Z57jvhD1oinvkS8DfugJydWRnRLjsUqlAX6nCg5/deQ7ug4mLdPdkNkSr8L2RAKaJXXuIU/MTxVgmrrnNrTDlTldbGCZ/Gz2wCQ=
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
Thread-Index: AQHawJTljFn+TFlFw0Cz/HTewbBwKbHMCqyAgAGSNQA=
Date: Tue, 18 Jun 2024 06:57:30 +0000
Message-ID:
 <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
 <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
In-Reply-To: <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA3PR12MB9090:EE_
x-ms-office365-filtering-correlation-id: da3f8d04-104d-4630-e25f-08dc8f63ec65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|7416011|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2JLWkdnTFN0MWk3QSt2cVZhM0x6MEdwNHdXcnFrVDFMNTIzK3FwTDA4bEM4?=
 =?utf-8?B?UG4yajBHSWxkNHQ0TEowa0h0ZFp1VGwwUGU3MkcwVHh4UFpTWitQUmhPKzU4?=
 =?utf-8?B?L2VSZUU0Qk52aTJuNWphRkkxRmtoOGFyWHN0bVVXOHdvcHhaL3dVRmdsbzVh?=
 =?utf-8?B?RTlsMEtQZUpnMkZITURRTzB4RnV3aFhHdUIrM3JQbnR6Yk5HRzNIeDNwNVBN?=
 =?utf-8?B?bFdkYlE3OHZCSzRtemJqOW9nRTFFRjBKUHFHM2svTzh2SDBqMU5za2V6Z1pj?=
 =?utf-8?B?elk5ZkdyM3dHNWhacVB2SmMxNnZVS3htdnU2d1hER1VNcUR3djhsQUZGdmYr?=
 =?utf-8?B?eDA3THhPQXcxa2x2S0pEWGVXUnhGNktpZUFHbEJlMTZBN2FtVDJ0YVB0WitO?=
 =?utf-8?B?YXVMYjNnN0ZkTnpOTmRKUldxei9QcmRaUC9IYXhkNjJWRTdDZ1lqVnRPMWZ3?=
 =?utf-8?B?OStkT0hEdXlseFNEbnpsVEZlTktVMm5qNVdmUHpWRVhqczBJeUU2V2h0S0p5?=
 =?utf-8?B?U0NhOEVYWWRNd1k3SkJGM3h3ZG5QamF0aGgxSEJtWkJYZnJQY21UMW8vY2tx?=
 =?utf-8?B?QnRITXVQSDI2REpLN0ZQbTZhR1JtSUVzVUxxdjU4WTdiVTdGRWNmd2ZVSm5z?=
 =?utf-8?B?ODRScDczRVkwcHQ3Um5qdzNSZGJIK0FSdkwrRzNwckxRcjAyTENPWnQ0MHhS?=
 =?utf-8?B?aHlEeGorTHdOQVFuczhNTVRZeEVxakdnK1p6UWJueDlROEhrK3ZQOEJoTzIv?=
 =?utf-8?B?L05lQjJuVzlJNHpUc1RMWVB2dWtqQ2NwLzNIK1piWlpmYk0rbUU2VVUwdjBQ?=
 =?utf-8?B?YitNbmN5OXFVdmlzY0c5cEtzdHJrdnBNK1UydjhtRmh4bmc2cktZaGI1MzVZ?=
 =?utf-8?B?SHdMaDZvYWVwaGZnQmlCdXhxVElCem5weGNia0FxZThxWWllUzQ4VWJJMGI3?=
 =?utf-8?B?bFBIQ0piM1J2M1ZIcDhxNjdlcVpCK0k5Q1Q5K0VJU1JXNDAwMEIrNGd2NmR5?=
 =?utf-8?B?aVpnR0ZWVlc0NHZBcjdYUXRQcEJ3citvYTV4eDlrS3g2Ny9adlY0SVkzOGp0?=
 =?utf-8?B?T1BURkVUZjM2MGc2aEEvVkRrT3luTzdLd3RTWWV3ZEJNaVhPRStUMnhEM0Ix?=
 =?utf-8?B?Rko5ZzR1OUg3RzMrbWNXaUF4RVA2WldQc2hmeW0wYVRPWEkrazhZbTJDTVNQ?=
 =?utf-8?B?NVJ5aHpQNklXNzZHQWQ3bUhBMS9mOEJyN01WZkhVN3VDZU50UjBjUU55cWp3?=
 =?utf-8?B?QmZ5RFVuMUQvSmt2a1BGbmcwM3VBeW5QZGovSW8rdG14YzVISFlSQ3FpM1dB?=
 =?utf-8?B?RzhaK3NidDVTY2tPY0hDUkdmTTBFdWRkS1RITC96WmRuQ1MwNStpeFZmY255?=
 =?utf-8?B?MkExUDVKQjB1aEFwSXptUHR3ZXFyS1ZNL3R0eFVKdFlEdFd6a1hUOVJuR2pn?=
 =?utf-8?B?L3NwbmIraHRQZ01DMjA2WTIxWTdFcFZKaWlpbVhXNkdiTWIwTTVNUGpaMDJq?=
 =?utf-8?B?bitFdWFzbVBSMHo5Z0dvSHhHamJFQXZSUkM4TWw4bGFieGVkYU95Z0FzTW1t?=
 =?utf-8?B?VnVaOGFZRk9pVXExUzcvUzBTQUFxS2s1NDgxUkFLSEdVa2Zuc2tOZHJETmx5?=
 =?utf-8?B?cGFxQ3ltUEoybkxzS0NkUUtYL3RwTXFsZ3k2UHFzaG5NdlRQTi9JZjhCMjR6?=
 =?utf-8?B?NzNXM1IwbkN6Y3g5d3R4Vm9RNTNuRVJsbW5PRkwzWCswWWNLbGFwK3VCQk1a?=
 =?utf-8?Q?tw3wKCjDoHJi67D7rKPg/U4C2SIWM3VpKYAf9S7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTBhTEwwMko0b1l5RGMzZDJ1Zi9kUHEycWIwTFMvcWVRbnA4b1BiNmo5TFZE?=
 =?utf-8?B?ZHBYcmV5MDFITVFtNE0rUUx3TVVkY29xZ1Vsam9vYVhEMDVjQWRIVGIyTllt?=
 =?utf-8?B?ZHl6YzZFQVV2ZUpGV2tidXo3OHdIWXltMUN4S044S0dYaU5IcExyV2dFL1g3?=
 =?utf-8?B?b1pzQVlQSExURXBjQWEvUGNiUXp2RzNQUXZobGNpWmVaQmVoMUx3SEgxZWs0?=
 =?utf-8?B?ZnIxeWVzMHEwdGpHcFZ5MWUyblh6REhvSU15dktEMmZFUm9ZVG5HRVZEREtL?=
 =?utf-8?B?d04zL1loMGV4YVUxbzFjWnlkcXdMdlljbW5ZOGZMaTRFSWdTc3h3bTNmOG5G?=
 =?utf-8?B?TEVvNGd1a29ZRUdqZVBDM0Z6cFI0c2JYUU9FY0pwVU1OSFl0SG5oUFlNVzha?=
 =?utf-8?B?MVRlbkVxUGpnWGV0Y0lucFRaRkdLcXdvVkZ2SWI4cnFlWWNpYUxNbUMvVHcz?=
 =?utf-8?B?NmhXWVVzZEpSRG4rUEdBa2Z5Skw2TjVEdUVRdnQ4MEM2eUYzNHowbWJKdTJh?=
 =?utf-8?B?blB1MzFSZ0VWa1IwVnphZDVJZFNlOTdDcFc3S1NaeFdNeHg4YkdmV2o4dmxZ?=
 =?utf-8?B?MGE5Vnd4eXI1K0hGdEtIenZBRzVCa0pWckZvYlQ4R1pvUUFZVnlXUEF2UHNN?=
 =?utf-8?B?VnVyT3BxemJwWS8vemtaUUdOVDh2VmRkcVhiUG5UVGRmNkdhbGVwaGUrSTQw?=
 =?utf-8?B?Z1dEL0IxZWZMZ2hFcmJ0c0lCbVhZcDlkbzVWQkJ6VUZ5MEhtV09CUThFWC8z?=
 =?utf-8?B?K2hMK1YrbTVXbmYyVVd4enlXRTdYLzNCUVp3aHZmaHNmN29GNXoyMFRwSSt1?=
 =?utf-8?B?QlZHUE9tV0tOM0tZTEliTGVNZWFHWXlvTlJkY1p4ZzdxRzBobWViUGpINnpj?=
 =?utf-8?B?K0tzeVpaMHN0LzRaRi9uUGtGSkwwSWJ1OEQ0NlpveXo4U0JkRG5jVCtpdWsw?=
 =?utf-8?B?bjdJMW8zWGFEcEREbkgwbjY3Q2QvNkJQV3BsaGMzZkxvSVBsT20xZjRBRW1W?=
 =?utf-8?B?NGllVVdybzV3eXM2UnZrRDUvWm5oOC9qTVlKMmQ2d0JvajNxVFJlZGNtUjE1?=
 =?utf-8?B?V0c2NldjMjhZMDZUT3BEVDk0bWw2T3V2TVlKYWFlMDg5WlkyVi8wSWRwYkd4?=
 =?utf-8?B?QWgzK1BFWWx4dzNIYjliUmtlWm9TL05XaHAzR0d3alVOVUt3dUduaW40eVQr?=
 =?utf-8?B?bHNXYzRNK2k2QTM1clRFM1ZlUkV6QTJ3cGlNRVFlZ01vLytCYVdFVnZZMk0y?=
 =?utf-8?B?eWNUV0hCVTlWbGdzcUFXVzBkU2daMEIvL0ZaWFc2QzRYdS9JOTdieFFDdGts?=
 =?utf-8?B?eVVXT3BKNWFEVE8zV285VnNkMXpURUtxZnZiK3gzK3B0bjl2RnFDaVh0SjJ6?=
 =?utf-8?B?d1E2L0hUb2w0MFJVTFc5SjVzOGE2VFRBaFJRenJDQTdpYTdrVVRWRi9sUHNF?=
 =?utf-8?B?dTVTSUdwQTNWUzh2a2Z2UFdrbHoyL3lkbGM5NGNyVklUM2pwcTE2aUZkM2s1?=
 =?utf-8?B?cEZkNzF1bWdWS3ZuazVIVWFCc1hoNTlUTG8zTGJFUmVYWTByWGp5bDFqWG9u?=
 =?utf-8?B?UDdSSGR4YVllK3duUzdzNktmWG9nVzZGN2hLZloycmh2R2hPckxaQ0tOOGdZ?=
 =?utf-8?B?V0I2TytscE90WkNicnBUTzdGV3JqMFV0bXJQVDVrOXVSbUxhSDE2OTNyVWFG?=
 =?utf-8?B?ZHRtdnJhVzl6ZDd3cFRQTmtSdFZwbTVtczdyb1RubEJpcFZoRjJLcjVKa3E0?=
 =?utf-8?B?OGlXWEFyKzJzVlcxclY5MzZhaTFyLzlpZkVjRytzTHFBdFRua1oxWHl0MEV5?=
 =?utf-8?B?dGlzbzA1V3NwcEVsdkVXRStud2FDQUxYRExYQndEaGJHVEs0clV3dWVMMHpn?=
 =?utf-8?B?cGRoNTFFMjFVUktteisyTkk3VjRybGxKQWFEcmp0UDg1VnNoeGVQeGJMWUVv?=
 =?utf-8?B?L2JyamVVZk5EaEplWVdoVXFqYVFDWVlQV0t0VWs1T0FvYzBFc1RvTDRVU2Zz?=
 =?utf-8?B?VDhvZlFtcDhLUHdhaUtvQ1A3QnNVY1lEbFVaY1BjVk1OYVRWclBPTGpUOGNw?=
 =?utf-8?B?akd6ajA0Vk1JVWFpNTBVUHRObVJnUno0SHRvbzVpMitSMFF3Q3NtWDlyN08r?=
 =?utf-8?Q?FTZE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2162767E76750F499F1961F560B50422@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3f8d04-104d-4630-e25f-08dc8f63ec65
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 06:57:31.0126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0WvbGT0cL7c+JHQOjBulLDmUDI+5DZHK7qg/Xlau9nxhN6OKNBBcp/lYz830faHIciecD9okJjanmA1q1ouWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090

T24gMjAyNC82LzE3IDIyOjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDYuMjAyNCAx
MTowMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBUaGUgZ3NpIG9mIGEgcGFzc3Rocm91Z2ggZGV2
aWNlIG11c3QgYmUgY29uZmlndXJlZCBmb3IgaXQgdG8gYmUNCj4+IGFibGUgdG8gYmUgbWFwcGVk
IGludG8gYSBodm0gZG9tVS4NCj4+IEJ1dCBXaGVuIGRvbTAgaXMgUFZILCB0aGUgZ3NpcyBkb24n
dCBnZXQgcmVnaXN0ZXJlZCwgaXQgY2F1c2VzDQo+PiB0aGUgaW5mbyBvZiBhcGljLCBwaW4gYW5k
IGlycSBub3QgYmUgYWRkZWQgaW50byBpcnFfMl9waW4gbGlzdCwNCj4+IGFuZCB0aGUgaGFuZGxl
ciBvZiBpcnFfZGVzYyBpcyBub3Qgc2V0LCB0aGVuIHdoZW4gcGFzc3Rocm91Z2ggYQ0KPj4gZGV2
aWNlLCBzZXR0aW5nIGlvYXBpYyBhZmZpbml0eSBhbmQgdmVjdG9yIHdpbGwgZmFpbC4NCj4+DQo+
PiBUbyBmaXggYWJvdmUgcHJvYmxlbSwgb24gTGludXgga2VybmVsIHNpZGUsIGEgbmV3IGNvZGUg
d2lsbA0KPj4gbmVlZCB0byBjYWxsIFBIWVNERVZPUF9zZXR1cF9nc2kgZm9yIHBhc3N0aHJvdWdo
IGRldmljZXMgdG8NCj4+IHJlZ2lzdGVyIGdzaSB3aGVuIGRvbTAgaXMgUFZILg0KPj4NCj4+IFNv
LCBhZGQgUEhZU0RFVk9QX3NldHVwX2dzaSBpbnRvIGh2bV9waHlzZGV2X29wIGZvciBhYm92ZQ0K
Pj4gcHVycG9zZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNo
ZW5AYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4N
Cj4+IC0tLQ0KPj4gVGhlIGNvZGUgbGluayB0aGF0IHdpbGwgY2FsbCB0aGlzIGh5cGVyY2FsbCBv
biBsaW51eCBrZXJuZWwgc2lkZSBpcyBhcyBmb2xsb3dzOg0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcveGVuLWRldmVsLzIwMjQwNjA3MDc1MTA5LjEyNjI3Ny0zLUppcWlhbi5DaGVuQGFtZC5j
b20vDQo+IA0KPiBPbmUgb2YgbXkgdjkgY29tbWVudHMgd2FzIGFkZHJlc3NlZCwgdGhhbmtzLiBS
ZXBlYXRpbmcgdGhlIG90aGVyLCB1bmFkZHJlc3NlZA0KPiBvbmUgaGVyZToNCj4gIkFzIHRvIEdT
SXMgbm90IGJlaW5nIHJlZ2lzdGVyZWQ6IElmIHRoYXQncyBub3QgYSBwcm9ibGVtIGZvciBEb20w
J3Mgb3duDQo+ICBvcGVyYXRpb24sIEkgdGhpbmsgaXQnbGwgYWxzbyB3YW50L25lZWQgZXhwbGFp
bmluZyB3aHkgd2hhdCBpcyBzdWZmaWNpZW50IGZvcg0KPiAgRG9tMCBhbG9uZSBpc24ndCBzdWZm
aWNpZW50IHdoZW4gcGFzcy10aHJvdWdoIGNvbWVzIGludG8gcGxheS4iDQpJIGhhdmUgbW9kaWZp
ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGRlc2NyaWJlIHdoeSBHU0lzIGFyZSBub3QgcmVnaXN0
ZXJlZCBjYW4gY2F1c2UgcGFzc3Rocm91Z2ggbm90IHdvcmssIGFjY29yZGluZyB0byB0aGlzIHY5
IGNvbW1lbnQuDQoiIGl0IGNhdXNlcyB0aGUgaW5mbyBvZiBhcGljLCBwaW4gYW5kIGlycSBub3Qg
YmUgYWRkZWQgaW50byBpcnFfMl9waW4gbGlzdCwgYW5kIHRoZSBoYW5kbGVyIG9mIGlycV9kZXNj
IGlzIG5vdCBzZXQsIHRoZW4gd2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZSwgc2V0dGluZyBpb2Fw
aWMgYWZmaW5pdHkgYW5kIHZlY3RvciB3aWxsIGZhaWwuIg0KV2hhdCBkZXNjcmlwdGlvbiBkbyB5
b3Ugd2FudCBtZSB0byBhZGQ/DQoNCj4gDQo+IEphbg0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpKaXFpYW4gQ2hlbi4NCg==

