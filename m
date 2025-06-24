Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F0AE5F17
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023326.1399286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyyy-00072K-Pe; Tue, 24 Jun 2025 08:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023326.1399286; Tue, 24 Jun 2025 08:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyyy-000703-Mp; Tue, 24 Jun 2025 08:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1023326;
 Tue, 24 Jun 2025 08:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTyyx-0006zx-0k
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:26:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55ff4ee-50d4-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:26:17 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH0PR12MB8821.namprd12.prod.outlook.com (2603:10b6:510:28d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 08:26:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 08:26:13 +0000
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
X-Inumbo-ID: e55ff4ee-50d4-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTTVOSHgMwvsQXr0Z08MbG7pvezw1xPqnd+6I/ngXH7pbYwyoIhhJDqKfjtx413uuipElVZiCh7Tt8socCgyUT3jyu1lISmjRHrv2l+SRN2sm0j04FfukpCivrcR7+l1SgAA5/5XDY+XhcVsixs3q+FZcLte4upodfCyj34s1fLZfbWHCt+DfQovmU+iSUAnlRlPPCX2KwtRwXVh4lqXhJwkit4iRRwimHeWDCU2xw9HIoXX33/PChCIBwUy5yJs4Kmwl4xaDAYmBgHgxvMR48UiHOqRSNqjtG1HHeqdGE049r7FfUkQI23UEI3NxkeRba3Ib7HfL7WxaVrsz2tzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anfg4A4LmDbPyHGb92dMccahIpthqHOWJucw9sU+Ka4=;
 b=i3t7rc0sl4LYSKwCaPjvCDjcQyh6lIoh7n106Q5DOJWxH1pR1vMi2ba7B7Ld4dMhsD2EkajfMthHDLEdJagHxm9YQJiAxLNGFSDTl/HrTiin6WTikeDWwdFw27Ne0XLWNfi0vbT2jpF3RWee4FmIEe/rYBp9zIRXsJFmZomaZ+d5wO2PC/BHSSSbz/8Qd9VP1DV+ATA+2vw3XyRHnE2WlitanZ3O4YU/P0uD16aRpp2QE3j8wnGl8/6TemAH6YQGZ79Fe+VN2ofm4vbUT+DXkLOgD5ZaiosxnKMSxRbzpyeTzPjUZDb/rlqKlPZEr6O8yGUSXX/I/xvBPFIrUtMaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anfg4A4LmDbPyHGb92dMccahIpthqHOWJucw9sU+Ka4=;
 b=1zsPshMjQ4LN5480ZAacCKe2LXuoQ85F7xV0Tx0zDk5bZFBCQFIBI1JubuC+F/z1hiqZ7ou/qrhD5QaXv2fZPjZ4fw2lfyfNHR3qI0CKaXmmMi9ZWBf3Tn9GSYohxKJsW3/3LAn3R2ssZHVTOWRpW1OubHKZkBO6iPBouNDOwdY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QJBRKAgAGLVICAARN8gIAG6YaA//98XQCAAIcUAA==
Date: Tue, 24 Jun 2025 08:26:13 +0000
Message-ID:
 <BL1PR12MB5849672813202821C57EAD5CE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
 <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cf4679d-ee86-4666-adae-63a3f9b9b8f7@suse.com>
In-Reply-To: <0cf4679d-ee86-4666-adae-63a3f9b9b8f7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH0PR12MB8821:EE_
x-ms-office365-filtering-correlation-id: d3209c1c-b68f-4a9e-9959-08ddb2f8c80e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VSs3UmJvcXpQZ3VvR3NUWjhxTHdld3U5SUM4YUxpdGdFQWhmYUFkQjIrSFIw?=
 =?utf-8?B?Tm5BbG1SenVibkh0QUJNNlpTTE16Q0FxYitWbHVzUnBTSmJkNnVPSUlHbXg4?=
 =?utf-8?B?eWt4VmdycHdUZEU1QWFrZlJmWWdCU0haYk90cWp2L3VsYmxMOFVnbE1NTlo5?=
 =?utf-8?B?VDhoS3pCVmZLc0lCZEJ1YUQ5WitLSit2Sk5lWjhtdHFFOGNIeGlZZ2ZPZFJi?=
 =?utf-8?B?ZG1saXhqQjlTK1c0R2xZeHpncVFJdkwyUVZBZVJhd2Yzb20vNEM4c0hycG4w?=
 =?utf-8?B?ektPR0htVDNMN1k5dUVROGN4UkFoakdNSXhKbmgzcjMxV1Z4ZjloUDhJNXo0?=
 =?utf-8?B?YW5LUmNTYjE1T2tyUFcvZlk4RE9iVklzYmxSRTNhcWZ2Wk1pUDhYa2pOUXdI?=
 =?utf-8?B?SDFNOWt4RmZtQ3lybVpTMlh2cWVTdEFYTnJVOVk5TDBXbG1TOHRrWmVoM2ln?=
 =?utf-8?B?cldYU2xtQm1jZHRZQ3NuRWRtUVNHWC9zR3l6dFYyc3RhZWxOSjkzUkRyeXpu?=
 =?utf-8?B?RVJydE9PSmlCMXhqUlVpbEFOVFJTTTF3dyttRUdNdmlVVHdHOUNHdGZWZito?=
 =?utf-8?B?RkJ6bnR5d0hGQkFFT1hUUi9LcHZSUEdVT1BPYXZ5dktZdkNqRkFQRGV5SHFU?=
 =?utf-8?B?dGd2OWYvd3Vvb210WTd1RXBxQ1QyckloVnRmQTNHS3pWaG1NS1JudTVGZUNs?=
 =?utf-8?B?NXFTWFZZR1h6NExqVFlZdnRWK0ZZNUN1QVF5V0Y2eU4zaExIZmNKNzhDSU5i?=
 =?utf-8?B?eWtFOGdlSm1uTTFkVDI4MWtDZnVVelIvUmRzdHIxVlgrTVR2aDNZL0ZNVTFx?=
 =?utf-8?B?SWFtSjRrUlFRa2dPdFNWM1hsVldMUkdpdkRCb0NPaU94d3VjUklWQ1VFbE5n?=
 =?utf-8?B?TmN4NU5RS2pUUFpXcFBuM3ZoNFZKMzdBRFd6bVIzM0lnalJOVE1HeGVxYXZr?=
 =?utf-8?B?c29VRVdxemc4QktsQW14dzVHTW5YNjNpa0tsVEpJdDVnRTNpRlJQeVJJbkFa?=
 =?utf-8?B?a0RRWTJYbkFJa0s2TWVzWTUwT05jZjgyRSs0bWNRQzRwSlZyaDY4dDJNU05v?=
 =?utf-8?B?cXN1ZTE3ekwxZHF5UTVGYVpaVytnN1hnK2x6YTEzOXdmOFZ3TXNzOUF6aEN1?=
 =?utf-8?B?dE42K1p4WDJzNnUrbHZHNko4L3lqMXZyWDFKVmdPZG44QkR3Y3FiLzRxbzJs?=
 =?utf-8?B?YTdtRkdHZUhGcUNBaWNpRzMxMDdhVjQ0UmZQSW83NWplSWJUUmlDR3o0T2VR?=
 =?utf-8?B?M2lOT1RmR003VVNqSTRpTkxjamJPTWk1V1phQlB5aFJxVVRoWFFOQ1BsbHBw?=
 =?utf-8?B?aGxFSGp1TXo2TWlkck45bzF5SURQNkliVER1ZXB4YXEzN0tPS1VJR0luUXNx?=
 =?utf-8?B?bGRSdElNbHdINkdWWmdrRE1YQ0FZV0pHdlJDQWRJU1VkeVRSMm5lU2FhRDZq?=
 =?utf-8?B?b1pDaEtzTjViRkVTb1djTDNMRWs2RmhUQ1VBTW5ZUDM5RlI5THA5SDhRSU9N?=
 =?utf-8?B?T0YrcUxwcjhpVXdDQzNtb1crUHJ5Q1dUNlY2aTVvSmJOZlErLzZ2Zk50SHFZ?=
 =?utf-8?B?ZUxjSWt5MmlyVGxrQ1BnS0YxOUtJTkVWd3A5U3JHU3hXdzZEc2JFcXhIc2th?=
 =?utf-8?B?RUhQUnNnQkJkV3BWajlvMDhBWmxURnI0RzZLeU1CSEpXNTdFUDA4Y1NOYVJW?=
 =?utf-8?B?SVRGditvbzFYY2VDL1llSEptR294aUlXVC9XWlh6d0xUeFBvM0lVSEZVTmpi?=
 =?utf-8?B?Y25lRnl5K1dBaC9PZFpxakc1U2xRUEpGcFhlYklUM1lXOS8weHRWNmpxVUty?=
 =?utf-8?B?SjI2L0VZTCtpNDhuOFUzeGVPSE1YcW02MldJS1U0MHA4VCtBVDhyUXpvb2Q1?=
 =?utf-8?B?NmhYU0FsQlBWMTFvNEVkMHRKUi9xRmF1aUpzN1dxRS9TTEQzRHRVSXRBVk9L?=
 =?utf-8?B?c0RBUGlzbVhNRFV3WVJmS2czcXVRWktSampwQnoyVzZ6QndMcUI2QjRDeCtH?=
 =?utf-8?Q?6ZIMEjhjQgoeulTRoMgJhfYXhnzmVg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0ZHVC9sREY1QlEwUmlMdUFWZThPUWlNd1FBZU5kQ1dZMlEzTXhsdis2SDRk?=
 =?utf-8?B?OXppS2lGYXZ3NGFSbGN4SWlXZExBNkpnbW1LaXRBMEhUWGhBb3VUWU1IK2s2?=
 =?utf-8?B?WEdnSnpRN0hIZWhsVjUrRE1ha2ZlcmpTZDZueEhVUXQwQUYwSENEUlBSSHFG?=
 =?utf-8?B?WFhFbTJuSFNBb2NjOEVkVDVuVitRSU1wNlZidU1xdE5GRjdFcWhRUU85d2Y5?=
 =?utf-8?B?aEhLV0FHZ2MrU21tdjlqZnhlRE5QWHpMOEdCbWtiNXpONkIrdXllTGlneVk3?=
 =?utf-8?B?MCtBTmtUTi84bFNnZkx0UG9CYnVsUkZWalF6eTZualJQcDJiVHRDbUJXbXFy?=
 =?utf-8?B?Vk9CcUFrZmdWWHNoeHdveGYrVVZ6VzZpOUw5TjY5T2Q5WnVKdGJIdEI0YXcx?=
 =?utf-8?B?S08yVy9xTlhJUG1aQ1pBSkdNZFhWRnd3bUZXNzVsckZlTFZleEgwSU1NaWFJ?=
 =?utf-8?B?Z1JBUUw0M3VkUDU2TXU1am12TzUrZzBySmtFWDU4VWtoS1Y2ZEtjNkdpeFJQ?=
 =?utf-8?B?UFZxS3psMGxjUEtpb0J3ODJRU3E1N25xTVJkUFB0aVRPb210RTZ0YW9jWFpt?=
 =?utf-8?B?dnZTdXNxVXlHZ0NtSU80R2R4WndOWklTWXFsWEdOTGpjZ2tZOVVCS3BzK3Vm?=
 =?utf-8?B?Qm9rWGt2TzJCNTZ4SndCRWVVYlh5a2xGYzJoNkRuOG9UV3Q0Z3FGUjRtVVJo?=
 =?utf-8?B?eEExZFlFQkxwaWEyRHVCQXEyaGZjNHF1OUd4TWtMZVIrOTl1RUhXSDVNMXBV?=
 =?utf-8?B?K0dnYUhTTlorQndYNnBIdHRha2djRTNoQnBiZGo1RkNBbGVid3VrMUtkMzA3?=
 =?utf-8?B?eXZQZnlGTE5WN3NiZyttVlRCelMvZEJUR1lxQ0F0cVdjMzRxOHlGcVR2TDVI?=
 =?utf-8?B?OG1uZjI3dnNOd3cvOFRqbGJ6TEwvdUc0SjM3bUhMR09BaUkvUnNMa3JreStP?=
 =?utf-8?B?TFY2T2NxWjRzMFBRdjBHeC94Y2w2Y3hCNWF4anVGUy9tckZicHRxc0haRWtv?=
 =?utf-8?B?YTFSVHp5S2xsQVRGZGh0ZEhxVklJc252VzkzT3FHVjhBVVJPMlVPN1RKUHVG?=
 =?utf-8?B?eTJqbFFOSW5RbXBIS1hadGRwMllVRjJwUG9VdHdPQzRjVzI0MGx0eGtBci9X?=
 =?utf-8?B?MEFoR1p5U0dFc01DYUNwNnByNTJLS0N1bG82MWQ0SGZHdmt3ZmZhVWZQa0x0?=
 =?utf-8?B?UFZ6dnJSaEVDOWJUTjhidUxtTk9pVkhOM25vTGEyOXRENkp6MmxrNGxmQTlY?=
 =?utf-8?B?NUViT3YxaDIvN1ZLOEsrREhXZE1DdlRRMkVOSXAxUG9pOS9aVXhhTVBJNzI0?=
 =?utf-8?B?aHhpSjl3ZG8valVwZFdtUkNOdlRXRjcvYUM2SDVHbzkrWTFqQzBOcGY2VEo1?=
 =?utf-8?B?eEtOL3hPcmhybHhLSHZJQnp0clJaazk2UUYrSVgxbEp0Vkl0eUtZN3B0YlZo?=
 =?utf-8?B?WmJCVS9aN1FacUhYOVVBZFQwNHdzQjAvNlVrQmxtRUkwMWptNEZsaVpQZjRx?=
 =?utf-8?B?ZUhPUEZvdGNFTFc4Mjd3eVROU2paZHlsUUNpOURWK3hMVWJEWnplYVRPQkY5?=
 =?utf-8?B?Y0hDd21JeGszR1R3YVphMkp2UnlhVG5VUDdOS3FOdkQwZWV2bW1wOW1DNDdz?=
 =?utf-8?B?VXNsUEF5ZHRtU3o2MnZkNkNOTXRKWnVIdG52UTVPTElaK09CRk9NRjd1c3ZK?=
 =?utf-8?B?YlZ0Vy9ZVnVndGRZcWxPdW9kd1AvODBaZnRqaENSSU81eUVPWW5UYlBCVVo0?=
 =?utf-8?B?dG5nc2xmaGQrK0Z0SjhKV21aQ1dGbzIyRXRUWGdaR3dDTWZhUWwrMFM5QnhW?=
 =?utf-8?B?UDgzTit5ZGRlOWtHQ3VFTmJEc1J0R3JCVG5Qd0VwU1VkRFAzVS8ybk9ZcCtr?=
 =?utf-8?B?RlMzSXhYa21QU2lsWEROY3d1ZVd5bHhvYVhrMURyM2JlOGVNblRiRDhPMHZl?=
 =?utf-8?B?V2FsRHQrMjhBMEZ3ZldYaGNDMTZqL0FYd0g0SXI4R2VUMTBURmh0WGgzWEVV?=
 =?utf-8?B?TzlZbk9TS1lkeDBLYVN4VDNiLzdLQndLdThSV1FGL0MxR3RlZFh2cjVkajZ0?=
 =?utf-8?B?b0R3UEVrdGg4U0lFTzRaMWdrYzZuRGIrTzUyMnp2MysxWWhXK3dKaytycEFR?=
 =?utf-8?Q?R1ag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE15F6575E972E4494D97FC3562D17B4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3209c1c-b68f-4a9e-9959-08ddb2f8c80e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:26:13.4203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CK8q9z8R9IQfnf3msEVTsazdVHGQidAshuZD8A7AYBqJ0pNu1vLGryCqQTbF9VlegIQLb9/tziYzoL89Fsyimg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8821

T24gMjAyNS82LzI0IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAyNSAx
MDoxMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzIwIDE0OjM0LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wNi4yMDI1IDA4OjE0LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8xOCAyMjozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Mi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vdnBjaS5oDQo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4+
Pj4+IEBAIC0xMywxMSArMTMsMTIgQEAgdHlwZWRlZiB1aW50MzJfdCB2cGNpX3JlYWRfdChjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+PiAgdHlwZWRl
ZiB2b2lkIHZwY2lfd3JpdGVfdChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQg
aW50IHJlZywNCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWws
IHZvaWQgKmRhdGEpOw0KPj4+Pj4+ICANCj4+Pj4+PiAtdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rl
cl9pbml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+Pj4+Pj4gLQ0KPj4+Pj4+IC0jZGVmaW5l
IFZQQ0lfUFJJT1JJVFlfSElHSCAgICAgICIxIg0KPj4+Pj4+IC0jZGVmaW5lIFZQQ0lfUFJJT1JJ
VFlfTUlERExFICAgICI1Ig0KPj4+Pj4+IC0jZGVmaW5lIFZQQ0lfUFJJT1JJVFlfTE9XICAgICAg
ICI5Ig0KPj4+Pj4+ICt0eXBlZGVmIHN0cnVjdCB7DQo+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQg
aWQ7DQo+Pj4+Pj4gKyAgICBib29sIGlzX2V4dDsNCj4+Pj4+PiArICAgIGludCAoKmluaXQpKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4+PiArICAgIGludCAoKmNsZWFudXApKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KTsNCj4+Pj4+DQo+Pj4+PiBJcyBjb25zdCByZWFsbHkgbm90IHBvc3NpYmxl
IHRvIGFkZCB0byBhdCBsZWFzdCBvbmUgb2YgdGhlc2UgdHdvPw0KPj4+PiBXaWxsIGNoYW5nZSB0
byBiZSA6DQo+Pj4+DQo+Pj4+IHR5cGVkZWYgc3RydWN0IHsNCj4+Pj4gICAgIHVuc2lnbmVkIGlu
dCBpZDsNCj4+Pj4gICAgIGJvb2wgaXNfZXh0Ow0KPj4+PiAgICAgaW50ICgqIGNvbnN0IGluaXQp
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4gICAgIGludCAoKiBjb25zdCBjbGVhbnVwKShz
dHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+Pj4+IH0gdnBjaV9jYXBhYmlsaXR5X3Q7DQo+Pj4NCj4+
PiBFaG0sIG5vLiBUaGUgcXVlc3Rpb24gd2FzIGZvciB0aGUgdHdvIGZ1bmN0aW9uIChwb2ludGVy
KSBwYXJhbWV0ZXJzLiAiY29uc3QiDQo+Pj4gb24gc3RydWN0IGZpZWxkcyB0aGVtc2VsdmVzIGNh
biBiZSB1c2VmdWwsIHRvbywgYnV0IGZvciBhbiBlbnRpcmVseSBkaWZmZXJlbnQNCj4+PiBwdXJw
b3NlLg0KPj4gT0ssIHdpbGwgYWRkIGNvbnN0IGJvdGggZm9yIHRoZSBzdHJ1Y3QgZmllbGQgYW5k
IHRoZSBmdW5jdGlvbiBwYXJhbWV0ZXJzLg0KPiANCj4gSWYgeW91IGFkZCAob3IgcmF0aGVyIGtl
ZXApIGNvbnN0IGZvciB0aGUgc3RydWN0IGZpZWxkLCB0aGUgbmV4dCBxdWVzdGlvbiBpcw0KPiBn
b2luZyB0byBiZSB3aHkgdGhlIG90aGVyIGZpZWxkcyBkb24ndCBoYXZlIGNvbnN0LiBJbW8gaXQn
cyBvbmx5IHRoZSBmdW5jdGlvbg0KPiBwYXJhbWV0ZXJzIHdoaWNoIHdhbnQgaXQuDQpPSywgZ290
IGl0LCBqdXN0IHRoZSBmdW5jdGlvbiBwYXJhbWV0ZXJzLg0KDQo+IA0KPj4+Pj4+ICt9IHZwY2lf
Y2FwYWJpbGl0eV90Ow0KPj4+Pj4NCj4+Pj4+IEFzIHlvdSBoYXZlIGl0IGhlcmUsIC4uLg0KPj4+
Pj4NCj4+Pj4+PiBAQCAtMjksOSArMzAsMjIgQEAgdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9p
bml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+Pj4+Pj4gICAqLw0KPj4+Pj4+ICAjZGVmaW5l
IFZQQ0lfTUFYX1ZJUlRfREVWICAgICAgIChQQ0lfU0xPVCh+MCkgKyAxKQ0KPj4+Pj4+ICANCj4+
Pj4+PiAtI2RlZmluZSBSRUdJU1RFUl9WUENJX0lOSVQoeCwgcCkgICAgICAgICAgICAgICAgXA0K
Pj4+Pj4+IC0gIHN0YXRpYyB2cGNpX3JlZ2lzdGVyX2luaXRfdCAqY29uc3QgeCMjX2VudHJ5ICBc
DQo+Pj4+Pj4gLSAgICAgICAgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpLiIgcCkg
PSAoeCkNCj4+Pj4+PiArI2RlZmluZSBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkoY2FwLCBmaW5p
dCwgZmNsZWFuLCBleHQpIFwNCj4+Pj4+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxp
dHlfdCBmaW5pdCMjX3QgPSB7IFwNCj4+Pj4+DQo+Pj4+PiAuLi4gX3Qgc3VmZml4ZXMgZ2VuZXJh
bGx5IGRlc2lnbmF0ZSB0eXBlcy4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgYWJ1c2UNCj4+Pj4+
IHRoYXQgc3VmZml4IGZvciBhbiBpZGVudGlmaWVyIG9mIGEgdmFyaWFibGUuDQo+Pj4+IFdoYXQg
ZG8geW91IHRoaW5rIEkgc2hvdWxkIGNoYW5nZSB0bz8NCj4+Pg0KPj4+IFdlbGwsIGlmIHlvdSB0
YWtlIG15IG90aGVyIGFkdmljZSwgdGhpcyBxdWVzdGlvbiB3b24ndCBuZWVkIGFuc3dlcmluZywg
YXMNCj4+PiB0aGVuIHlvdSBvbmx5IG5lZWQgdGhlIC4uLl9lbnRyeSBvbmUuDQo+Pj4NCj4+PiBC
dHcsIG5vdGljaW5nIG9ubHkgbm93IC0gd2h5IGlzIGl0IGZpbml0IHRoYXQncyB1c2VkIHRvIGRl
cml2ZSB0aGUgaWRlbnRpZmllcj8NCj4+PiBXaXRoIHRoYXQsIGl0IGNvdWxkIGFzIHdlbGwgYmUg
ZmNsZWFuIChsZWF2aW5nIGFzaWRlIHRoZSBmYWN0IHRoYXQgdGhhdCdzDQo+Pj4gb3B0aW9uYWwp
LiBJbW8gdGhlIG5hbWUgd291bGQgYmV0dGVyIGJlIGRlcml2ZWQgZnJvbSBjYXAsIGFuZCBpdCB3
b3VsZCBiZXR0ZXINCj4+PiBhbHNvIHJlZmxlY3QgdGhlIHB1cnBvc2Ugb2YgdGhlIHZhcmlhYmxl
Lg0KPj4gSSBjb25zaWRlcmVkIHRoaXMuDQo+PiBJIHRoaW5rIGl0IGlzIGVhc2llciB0byB1c2Ug
ZmluaXQsIGFuZCBmaW5pdCBjb250YWlucyB0aGUgY2FwIHR5cGUsIGFuZCB0aGUgbWFpbiBwdXJw
b3NlIG9mIHRoaXMgc3RydWN0IGlzIHRvIGluaXRpYWxpemUgdGhlIGNhcC4NCj4gDQo+IFlldCBp
ZGVudGlmaWVyIG5hbWVzIHNob3VsZCBtYWtlIHNlbnNlIGZvciB0aGUgb2JqZWN0IHRoZXkgbmFt
ZS4NCk9LLiBXaGF0J3MgeW91ciBzdWdnZXN0aW9uIGFib3V0IG5hbWluZyB0aGUgZW50cnk/DQpX
aGF0IEkgY2FuIHRoaW5rIG9mLCBpdCBzZWVtcyB0byBuZWVkIG1vcmUgd29yayB0byBkZXJpdmVk
IGZyb20gY2FwIGFuZCB3aWxsIGJlIG1vcmUgY29tcGxleC4NCg0KPiANCj4gSmFuDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

