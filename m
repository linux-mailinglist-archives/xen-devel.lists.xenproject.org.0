Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7490E650
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 10:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743546.1150461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJr2Y-0005B5-BR; Wed, 19 Jun 2024 08:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743546.1150461; Wed, 19 Jun 2024 08:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJr2Y-00058d-80; Wed, 19 Jun 2024 08:51:38 +0000
Received: by outflank-mailman (input) for mailman id 743546;
 Wed, 19 Jun 2024 08:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeeD=NV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJr2X-00058X-48
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 08:51:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20182000-2e19-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 10:51:33 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Wed, 19 Jun 2024 08:51:29 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 08:51:29 +0000
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
X-Inumbo-ID: 20182000-2e19-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncQGy5IJ2lv4/cGeJnyDXdvhZS/0I7DWC98gQLDiBZF1ae5gjBAwteudkXUEdAR3u0tbBw5o5TjvVSwNOnVBRvgW8+0wciJnvt/tcajvHrI2JOF6a3ZaFdaRH2sjaUX8lRbALiukLYPM8qMtVvhvUk/gxxLslQo2BhSXtY8QKP7OsbLGe1aR7x41G5A4iQTFp6ZMTst9gFxCTnhr0vK8Cuuw17ZCEnemg649djZyTfKAbO2Z1CWsa8OvpinuNIYu8PGWGwHfGxEHSfhqoJ/DlZe3fTuTWPiJoQYXN5E0WvcBUWK1//fueccvkEtJfd8WpWj9jAzUfPD9bv7QxxKN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltP34zi2iMUPd73dc8bcCNS1bU6oRElESZnrL+pukuo=;
 b=Cq4/tNWQC9jmEw6EIqBsMSZpx25AteBtA3Wl9/oNOB+VfXWIMKeWPEZ+drd4T5PCOVAw2AfhnAIAMqEivKtKgedyuul/ut1YymI9Daqv0lKs2lDp+EGMDaU7IVy3dtvE8oJz118NMgfS3dEmut4JoehiSisiiloS5kxPqI/N5z/NOxFf00FsvCkCS8vYuVpuoLJVvjtAV0y4m+vJiwrTuzwTeG8sZAIEiT8xdWwD8vpYDdi45JDg13RO+6nVHwORJCRM9YCTWr8qnesMdrn32DKQfwk9Kker56pL3WeeGSWuv+zaagLJKyK7nDvAyH3bLFwDG2YvKiwEztsBCKnFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltP34zi2iMUPd73dc8bcCNS1bU6oRElESZnrL+pukuo=;
 b=ARBFveaN/GWIjkxoGa1dGuuIVN3wgOey+IxwsQZw71ISE+UZm1vUsM9GLP7OoSFToycLUrIungiIav2vqfT8JYqJFGhmZgWIelI4JtDUJmRtyQ2KcMSJHK/3OzZW3R5avs9a2W6qBj6WNkbSeOCqVM7GkVxqR45HhrLwR5EJo88=
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
 AQHawJTljFn+TFlFw0Cz/HTewbBwKbHMCqyAgAGSNQD//5yWgIAB+7GA//+I/4CAAJBIgA==
Date: Wed, 19 Jun 2024 08:51:29 +0000
Message-ID:
 <BL1PR12MB58498905D185C6A720276D1BE7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
 <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
 <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b923a32e-3c22-4e7a-8844-b33322ef8ad1@suse.com>
 <BL1PR12MB5849861E424724C6E9DE3859E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ff66c7aa-585f-4d30-9f4f-e520226825bc@suse.com>
In-Reply-To: <ff66c7aa-585f-4d30-9f4f-e520226825bc@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6615:EE_
x-ms-office365-filtering-correlation-id: a35af60c-f4ed-4b05-58ec-08dc903d02ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|7416011|376011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3dtaWR3bFExL2xPYmhqSHhTalNFTytpZmZZR2I0aG9sK3R4S3c3aStmcnlP?=
 =?utf-8?B?ZFgyYXR3V1JGWVNKdU9FVlFESytmQ0g5UDVxNXNVZE1LcS9OdlBZWWlTZ2ww?=
 =?utf-8?B?bWd0aENiYTJIN3pBMmF5VlZoQXM0ZGx2aWV5eUIrUnh6emlrQ0trMnRoeGVr?=
 =?utf-8?B?V21aeDVoNmRQYUR3UG5wd0l6SXdtSWUwRThheEVCMWE2N0hnRVpTWC9uUVQ1?=
 =?utf-8?B?NGUwL1VkN08rcmpucWo5ZFh3dXVJRmk3Y3NzUlljZDk3RW9SeHVGWVRSanpJ?=
 =?utf-8?B?ZW5HWC9zY0lLWHIwVnQxa0FxSHI2cTRZQzhyZmdCZTJyT1pjNU9xT283a2dv?=
 =?utf-8?B?ek1PMzN4L3o4MWNFTlMweHhkTjl1aUxyT09ZcVBZOWxIQW9ZNTRzYVBMZW5W?=
 =?utf-8?B?M1o0SDhac09vdG1oai9Vb21OREhRL2tONFEwTWc1dGF3M1FNVGhRS0JNWTM2?=
 =?utf-8?B?VTczVEpGeDMvUklYOXRtakVRYllWejhnVFc0YVk0cFJWcDk2YnJPcDhKNTlT?=
 =?utf-8?B?TW5NSG9GNWNrOFRoZTF3VWMwMDF5Mkdvc1JwaXJrQlN2MXUvWW05WWRSZEcz?=
 =?utf-8?B?T0FhNXVmV3ppVVZpbTdCNmozQXFOUTN5dHNKMzJYR0EzVHNJUlJVdVkxUWxF?=
 =?utf-8?B?cW10N1FSS2lrOXJVQXJoUklXbUVMcW9rcmplbTFIT3dpTkdxMEtKZ3lRVDdq?=
 =?utf-8?B?TE1YRDZxMEM3REh0MkVHT3I4YkQzVlpreThBTStBaGtFaG5sQWd5TUtwWG96?=
 =?utf-8?B?MURqdjhSbTlLR3lMdTFsMkhWWHczangzVFcwY0Z3Sng2WWJvNUh0ZzJzOXZL?=
 =?utf-8?B?cGtrS21xaWVHRWhIa2piYTJXT2hoTmhtcFVmU0F2UFFnNTRsdHpaUjhkTjNS?=
 =?utf-8?B?aXcrZUVOZ3NaN28xY2RlcVJxVkZBQmMwQVVPV0E2Wm9kNXdiZ2VlbjVtVnJU?=
 =?utf-8?B?TzZ1Y1dvd3AyeHRqQmtHNkxCNzRhVXNZVVFsZEhzODIrMCtiaTc1UHZNWUty?=
 =?utf-8?B?V0RTenFjK2d0S3I5bUlkNHU1cytrNml5Ujc1dkdGUkRPLzF2ODZHdnRSNkUr?=
 =?utf-8?B?M014TG5ObFlQOEhhSjM3c3FKcDdJR015NUs4TEIrYnJhUHRWZVZNZ3JpS3NQ?=
 =?utf-8?B?cXk5emFUWXJTQTVhbGU4c3htRDFNbWdBdzRMVjJuOWVmRlpBN05aWXJCb3Nn?=
 =?utf-8?B?YkVOUFpDU0RWZzVPK1pab1hkMHNhSXpKL3ZmclBJdnRyZTRId2d0VUtwckVV?=
 =?utf-8?B?UUUyaFR1K3M1eGJJTUVXcW5oZDhKTTAxRVZ5OGZ5TjhnRzlMMzAxUDFhOUtO?=
 =?utf-8?B?WjVNajd2NWZKTlNkS0I2MjE4aG1GRC9ucmNSVXJUQ0dMRFFmbitJcnd1bldz?=
 =?utf-8?B?YWFnSCt6T282dXl6YVFjZVVnUmZYNVlpeldMaUp4WnpuWDlaZ3R4RHNNQjNF?=
 =?utf-8?B?U1Nzc1Byai9TbzdtMi9NV1RVb2VVKzNoeXg2TDVFOFZXM1hOZ3F5U1hGNGZw?=
 =?utf-8?B?dkFZMFpTTVlQY2RPbk9QNFF1MXlkdDJHWlBsTkRXcXdoYTgrcFFVMXFFQlBT?=
 =?utf-8?B?b0U5Uk10TDBEcVJNRndpVzFqM0V6Yy9MVnlUaTAyamllaTh2YmE5eXlPV1lD?=
 =?utf-8?B?aWZ3WlZodjhtdUtwT1poQXlTUEJQVTNXU2VDckpTUnZqWXBEaEtZZ1V4QkNU?=
 =?utf-8?B?bXpRMUZ6VmxBRTJjbUN4TTJjMXBoNFhMVHRCbVhjZEFHZmhjTTA1R0svdlFL?=
 =?utf-8?Q?yCQ8n3b6U4u/rA4oa/yw2PvWs/Ji4iEs0K9BcFh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjV6R3UzOHVkN3RHcVY1d2g5bGsxNk96d0sra0RHQ0MrQVhWeFBKV0Z5aCtC?=
 =?utf-8?B?VzR3Y0Mwc0dvZjFoSVRHNXpReTFiLzRaMUV3Vjh4Q05DRE0xb3NseWVOSm5l?=
 =?utf-8?B?VmcvTkxuaWlXM0JyS1RFS0szd0o3TFc4RGtNQ1hIQWgwR0NxVXpBRTlYckYr?=
 =?utf-8?B?dk5hd25KU3R6L0NTT0VhTkRtV3dNL1dZeVlKOUFzc3gyWUlZQXRWWVA0Z2hh?=
 =?utf-8?B?R1F1bHJocDd5NWpvRkNydUF4YkhkejZicFpOdGgxWEp5cU5JZ1hUMzE3OVY0?=
 =?utf-8?B?OWpOQzVYRlN5RFZwRFRKZWRsOHFUcVRRblVZSjlOcW9vWnlaU2ZQY2FSL0NF?=
 =?utf-8?B?ZEZ3V05ERlRwZXBtVDRubFJxQkFnendkcUxJeCtyUXhDb2FVR0d6ZFlZRjZF?=
 =?utf-8?B?eFpQZG1IUXVSeHhRSDNmeVc5bVNVS2YvM0h4UmhuN2lzbm1PWVJ6N2ZIOFZy?=
 =?utf-8?B?NThaNi80aTlMbjg3Ky9JRjFKQ3Vaa0huUTBtbFJWWVpONi83SFl2dloycldN?=
 =?utf-8?B?dUcrbHY4UW8yT0tUWElrWTAyRE53R1piT0NkTFgyWW1nZzR0RXZlcVhzbTNB?=
 =?utf-8?B?YmovYVZtWitrNTh4bWZXWk5XckZaZUNqOWJyR0dWclVPOXVaZm40Si8rTHVB?=
 =?utf-8?B?b2ZBMGx2MlRRUkVwaGtXQWhhRytFZ0J4cHhlV09vVDhwckpkQ1N0Q1pXWDNo?=
 =?utf-8?B?b2h3S0hhcHM3UjRrL1FCRzJSYWZTZHBwYlNZRWNvYUdYT2JrQmZ5QTYvbENz?=
 =?utf-8?B?eVJibTdjUW5hckdIazc4UFVpdkdZUnZzZ012dU1MemR4QnpIeEVwWWJxaTg1?=
 =?utf-8?B?Z2JKRFl3UTg1VndQVDkzN1YyeG5xdkIxdEgwblR5UXlxZlFLRC9ndmxQZmNN?=
 =?utf-8?B?UTRuc2JQbjgvQWJ1UDc2NnRYWkFtdy9Ici9iM0ZmRFVpK01yek9ESGc1NGZr?=
 =?utf-8?B?SGF5eXIybEhoTThHeldLSWJkSm9JMEZFL2ZFUytMN2NVQUoycTdpMnFCWG16?=
 =?utf-8?B?Tm9CS0U0bk5mOGNhVHNRTUl4dFk1SFRaUXVXa3ZjbWJ2cmRpRUFCTU1jR003?=
 =?utf-8?B?OG5hRHhCVW0zN29pR3RWQU9pL3hlK05CUkdlN0pZclFXRHR4bkdQSVhPc1RP?=
 =?utf-8?B?cHBLeFNCbjRQVEI1TFUycGhLT0UwSVBxWnlOQ0ZqTU51QU9XdTVXRzI1TlNP?=
 =?utf-8?B?MlIvaGVNRXZ2UHluc0N3NTU0bExpZEF0aWo4am9INWl0VDVJRkZSUmVnNS9E?=
 =?utf-8?B?K0YrcEQ1WVZESnZmT202NkVkZHRWNi8vckxSUjNMbytYUkxydVJmcG41c0I2?=
 =?utf-8?B?YncwODJFZ1JuUURuMEo2cEdlUXRvd2JOakNCZDNMMTBXYnpDWVNKU1FZcDhX?=
 =?utf-8?B?TzF3dmpiWDE0TEhKTVFLcWJQRGxPMkRBQmp3UTkyQWVPWHZ2b0ZFN3dnMEVV?=
 =?utf-8?B?a2lRdDdwb3c4Q2lHZWlsOUoyZ0dnN1pvVUExdWNBSGJSRmhnZ0tpa2tQWkRX?=
 =?utf-8?B?T1gwRW9iZVRPMHh0NjdCcjhDSUxveWdTNHhhWTRrVzhpbFZRbkkwTllMZjlC?=
 =?utf-8?B?OTlHNzBjS3BXSFRMb0NIMmszNXplVEFybzhEcm9QVTg5dmJPS1E5UEczWFNk?=
 =?utf-8?B?TnlIaHFJKzh5b1NSSGljSVJxc0ZpTWZsbW5mc2d3V0h0UzJtZ1cyd25SRWhT?=
 =?utf-8?B?dDFXS1p5U2tpT1diSHVqV0J0UE5QWVlDalRydVp6aHBYZklPZWtPbjIvTHUv?=
 =?utf-8?B?K0d1UWcyc0JuM3dLa0c2MHc3SmxxVHZnWW9DQU1EODNnR0REbWtjaUdrcjlp?=
 =?utf-8?B?SW9WQ3Q5NGRHYTM3a0crajJXSUFVUVhMNDROc2lCenp1aW85OGtER0EvWFpG?=
 =?utf-8?B?akFqeDhGMXNuWVovNGViam44dXZPL3lTUkl2aHd5ZFF1bEduNW9CNTFhVTZC?=
 =?utf-8?B?NDUydzI1cG4rdWhyYUZHYTJtNnUxVStKMFAva2hPMlg5bjB3K2VNdjh0NXBC?=
 =?utf-8?B?bjRwMFFkTHppT1l1M2FCWGEzY0ZsYWpqZUJHbU4wVklwdmhxZWUydVV2ZGV4?=
 =?utf-8?B?UmE4UEZNZTg3dHdVb1FlRnpOTmtFSzRSSzNMUzJ4OG9CbUFVQWNrUUV5UkdF?=
 =?utf-8?Q?ZmwA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8167D8BAD87C5540A296A3A650962898@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35af60c-f4ed-4b05-58ec-08dc903d02ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 08:51:29.1927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9yvRmcV5F3ajqzKElrBaR2+C2VTIxnHe9Ar6lSLLbdJnV0YIsps/UIgCWsP6kQhtnv4KSCG4l1BruZF45gjIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615

T24gMjAyNC82LzE5IDE2OjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAyNCAw
OTo1MywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE4IDE2OjU1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOC4wNi4yMDI0IDA4OjU3LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNi8xNyAyMjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Ny4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiBUaGUgZ3NpIG9mIGEg
cGFzc3Rocm91Z2ggZGV2aWNlIG11c3QgYmUgY29uZmlndXJlZCBmb3IgaXQgdG8gYmUNCj4+Pj4+
PiBhYmxlIHRvIGJlIG1hcHBlZCBpbnRvIGEgaHZtIGRvbVUuDQo+Pj4+Pj4gQnV0IFdoZW4gZG9t
MCBpcyBQVkgsIHRoZSBnc2lzIGRvbid0IGdldCByZWdpc3RlcmVkLCBpdCBjYXVzZXMNCj4+Pj4+
PiB0aGUgaW5mbyBvZiBhcGljLCBwaW4gYW5kIGlycSBub3QgYmUgYWRkZWQgaW50byBpcnFfMl9w
aW4gbGlzdCwNCj4+Pj4+PiBhbmQgdGhlIGhhbmRsZXIgb2YgaXJxX2Rlc2MgaXMgbm90IHNldCwg
dGhlbiB3aGVuIHBhc3N0aHJvdWdoIGENCj4+Pj4+PiBkZXZpY2UsIHNldHRpbmcgaW9hcGljIGFm
ZmluaXR5IGFuZCB2ZWN0b3Igd2lsbCBmYWlsLg0KPj4+Pj4+DQo+Pj4+Pj4gVG8gZml4IGFib3Zl
IHByb2JsZW0sIG9uIExpbnV4IGtlcm5lbCBzaWRlLCBhIG5ldyBjb2RlIHdpbGwNCj4+Pj4+PiBu
ZWVkIHRvIGNhbGwgUEhZU0RFVk9QX3NldHVwX2dzaSBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlcyB0
bw0KPj4+Pj4+IHJlZ2lzdGVyIGdzaSB3aGVuIGRvbTAgaXMgUFZILg0KPj4+Pj4+DQo+Pj4+Pj4g
U28sIGFkZCBQSFlTREVWT1Bfc2V0dXBfZ3NpIGludG8gaHZtX3BoeXNkZXZfb3AgZm9yIGFib3Zl
DQo+Pj4+Pj4gcHVycG9zZS4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBD
aGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4g
PEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gVGhlIGNvZGUgbGluayB0
aGF0IHdpbGwgY2FsbCB0aGlzIGh5cGVyY2FsbCBvbiBsaW51eCBrZXJuZWwgc2lkZSBpcyBhcyBm
b2xsb3dzOg0KPj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDI0MDYw
NzA3NTEwOS4xMjYyNzctMy1KaXFpYW4uQ2hlbkBhbWQuY29tLw0KPj4+Pj4NCj4+Pj4+IE9uZSBv
ZiBteSB2OSBjb21tZW50cyB3YXMgYWRkcmVzc2VkLCB0aGFua3MuIFJlcGVhdGluZyB0aGUgb3Ro
ZXIsIHVuYWRkcmVzc2VkDQo+Pj4+PiBvbmUgaGVyZToNCj4+Pj4+ICJBcyB0byBHU0lzIG5vdCBi
ZWluZyByZWdpc3RlcmVkOiBJZiB0aGF0J3Mgbm90IGEgcHJvYmxlbSBmb3IgRG9tMCdzIG93bg0K
Pj4+Pj4gIG9wZXJhdGlvbiwgSSB0aGluayBpdCdsbCBhbHNvIHdhbnQvbmVlZCBleHBsYWluaW5n
IHdoeSB3aGF0IGlzIHN1ZmZpY2llbnQgZm9yDQo+Pj4+PiAgRG9tMCBhbG9uZSBpc24ndCBzdWZm
aWNpZW50IHdoZW4gcGFzcy10aHJvdWdoIGNvbWVzIGludG8gcGxheS4iDQo+Pj4+IEkgaGF2ZSBt
b2RpZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gZGVzY3JpYmUgd2h5IEdTSXMgYXJlIG5vdCBy
ZWdpc3RlcmVkIGNhbiBjYXVzZSBwYXNzdGhyb3VnaCBub3Qgd29yaywgYWNjb3JkaW5nIHRvIHRo
aXMgdjkgY29tbWVudC4NCj4+Pj4gIiBpdCBjYXVzZXMgdGhlIGluZm8gb2YgYXBpYywgcGluIGFu
ZCBpcnEgbm90IGJlIGFkZGVkIGludG8gaXJxXzJfcGluIGxpc3QsIGFuZCB0aGUgaGFuZGxlciBv
ZiBpcnFfZGVzYyBpcyBub3Qgc2V0LCB0aGVuIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UsIHNl
dHRpbmcgaW9hcGljIGFmZmluaXR5IGFuZCB2ZWN0b3Igd2lsbCBmYWlsLiINCj4+Pj4gV2hhdCBk
ZXNjcmlwdGlvbiBkbyB5b3Ugd2FudCBtZSB0byBhZGQ/DQo+Pj4NCj4+PiBXaGF0IEknZCBmaXJz
dCBsaWtlIHRvIGhhdmUgY2xhcmlmaWNhdGlvbiBvbiAoaS5lLiBiZWZvcmUgcHV0dGluZyBpdCBp
bg0KPj4+IHRoZSBkZXNjcmlwdGlvbiBvbmUgd2F5IG9yIGFub3RoZXIpOiBIb3cgY29tZSBEb20w
IGFsb25lIGdldHMgYXdheSBmaW5lDQo+Pj4gd2l0aG91dCBtYWtpbmcgdGhlIGNhbGwsIHlldCBm
b3IgcGFzc3Rocm91Z2gtdG8tRG9tVSBpdCdzIG5lZWRlZD8gSXMgaXQNCj4+PiBwZXJoYXBzIHRo
YXQgaXQganVzdCBzbyBoYXBwZW5lZCB0aGF0IGZvciBEb20wIHRoaW5ncyBoYXZlIGJlZW4gd29y
a2luZw0KPj4+IG9uIHN5c3RlbXMgd2hlcmUgaXQgd2FzIHRlc3RlZCwgYnV0IHRoZSBjYWxsIHNo
b3VsZCBpbiBwcmluY2lwbGUgaGF2ZSBiZWVuDQo+Pj4gdGhlcmUgaW4gdGhpcyBjYXNlLCB0b28g
WzFdPyBUaGF0ICh0byBtZSBhdCBsZWFzdCkgd291bGQgbWFrZSBxdWl0ZSBhDQo+Pj4gZGlmZmVy
ZW5jZSBmb3IgYm90aCB0aGlzIHBhdGNoJ3MgZGVzY3JpcHRpb24gYW5kIHVzIGFjY2VwdGluZyBp
dC4NCj4+IE9oLCBJIHRoaW5rIEkga25vdyB3aGF0J3MgeW91ciBjb25jZXJuIG5vdy4gVGhhbmtz
Lg0KPj4gRmlyc3QgcXVlc3Rpb24sIHdoeSBnc2kgb2YgZGV2aWNlIGNhbiB3b3JrIG9uIFBWSCBk
b20wOg0KPj4gQmVjYXVzZSB3aGVuIHByb2JlIGEgZHJpdmVyIHRvIGEgbm9ybWFsIGRldmljZSwg
aXQgd2lsbCBjYWxsIGxpbnV4IGtlcm5lbCBzaWRlOnBjaV9kZXZpY2VfcHJvYmUtPiByZXF1ZXN0
X3RocmVhZGVkX2lycS0+IGlycV9zdGFydHVwLT4gX191bm1hc2tfaW9hcGljLT4gaW9fYXBpY193
cml0ZSwgdGhlbiB0cmFwIGludG8geGVuIHNpZGUgaHZtZW11bF9kb19pby0+IGh2bV9pb19pbnRl
cmNlcHQtPiBodm1fcHJvY2Vzc19pb19pbnRlcmNlcHQtPiB2aW9hcGljX3dyaXRlX2luZGlyZWN0
LT4gdmlvYXBpY19od2RvbV9tYXBfZ3NpLT4gbXBfcmVnaXN0ZXJfZ3NpLiBTbyB0aGF0IHRoZSBn
c2kgY2FuIGJlIHJlZ2lzdGVyZWQuDQo+PiBTZWNvbmQgcXVlc3Rpb24sIHdoeSBnc2kgb2YgcGFz
c3Rocm91Z2ggY2FuJ3Qgd29yayBvbiBQVkggZG9tMDoNCj4+IEJlY2F1c2Ugd2hlbiBhc3NpZ24g
YSBkZXZpY2UgdG8gYmUgcGFzc3Rocm91Z2gsIGl0IHVzZXMgcGNpYmFjayB0byBwcm9iZSB0aGUg
ZGV2aWNlLCBhbmQgaXQgY2FsbHMgcGNpc3R1Yl9wcm9iZSwgYnV0IGluIGFsbCBjYWxsc3RhY2sg
b2YgcGNpc3R1Yl9wcm9iZSwgaXQgZG9lc24ndCB1bm1hc2sgdGhlIGdzaSwgYW5kIHdlIGNhbiBz
ZWUgb24gWGVuIHNpZGUsIHRoZSBmdW5jdGlvbiB2aW9hcGljX2h3ZG9tX21hcF9nc2ktPiBtcF9y
ZWdpc3Rlcl9nc2kgd2lsbCBiZSBjYWxsZWQgb25seSB3aGVuIHRoZSBnc2kgaXMgdW5tYXNrZWQs
IHNvIHRoYXQgdGhlIGdzaSBjYW4ndCB3b3JrIGZvciBwYXNzdGhyb3VnaCBkZXZpY2UuDQo+IA0K
PiBBbmQgd2h5IGV4YWN0bHkgd291bGQgdGhlIGZha2UgSVJRIGhhbmRsZXIgbm90IGJlIHNldCB1
cCBieSBwY2liYWNrPyBJdHMNCj4gc2V0dGluZyB1cCBvdWdodCB0byBsZWFkIHRvIHRob3NlIHNh
bWUgSU8tQVBJQyBSVEUgd3JpdGVzIHRoYXQgWGVuDQo+IGludGVyY2VwdHMuDQpCZWNhdXNlIGlz
cl9vbiBpcyBub3Qgc2V0LCB3aGVuIHhlbl9wY2lia19jb250cm9sX2lzciBpcyBjYWxsZWQsIGl0
IHdpbGwgcmV0dXJuIGR1ZSB0byAiICFkZXZfZGF0YS0+aXNyX29uIi4gU28gdGhhdCBmYWtlIElS
USBoYW5kbGVyIGFyZW4ndCBpbnN0YWxsZWQuDQpBbmQgaXQgc2VlbXMgaXNyX29uIGlzIHNldCB0
aHJvdWdoIGRyaXZlciBzeXNmcyAiIGlycV9oYW5kbGVyX3N0YXRlIiBmb3IgYSBsZXZlbCBkZXZp
Y2UgdGhhdCBpcyB0byBiZSBzaGFyZWQgd2l0aCBndWVzdCBhbmQgdGhlIElSUSBpcyBzaGFyZWQg
d2l0aCB0aGUgaW5pdGlhbCBkb21haW4uDQoNCj4gDQo+IEluIGFueSBldmVudCwgaW1vIGEgc3Vt
bWFyeSBvZiB0aGUgYWJvdmUgd2FudHMgdG8gYmUgcGFydCBvZiB0aGUgcGF0Y2gNCj4gZGVzY3Jp
cHRpb24uDQpPSywgd2lsbCBhZGQgaW50byB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gbmV4dCB2ZXJz
aW9uLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

