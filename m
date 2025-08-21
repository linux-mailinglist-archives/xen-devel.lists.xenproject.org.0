Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD22B2FD53
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088787.1446514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6dO-0000jZ-Da; Thu, 21 Aug 2025 14:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088787.1446514; Thu, 21 Aug 2025 14:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6dO-0000hc-A1; Thu, 21 Aug 2025 14:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1088787;
 Thu, 21 Aug 2025 14:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDER=3B=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1up6dM-0000hW-SD
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:51:20 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b964b12-7e9e-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 16:51:18 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA6PR03MB10435.eurprd03.prod.outlook.com (2603:10a6:102:3ce::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 14:51:16 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:51:16 +0000
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
X-Inumbo-ID: 4b964b12-7e9e-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3XhbENF1hlNOkxxgxzp0pMIYV5JRmUkEh9YWunpxE2wrXoVT3BuMMYW8nadoljif2TMjbH0g6sJTsHBZRMPxbr8jt/GYt9A1VE+/zyt4dtiuDLRXJXR4MzC/zJMNynBW4Tmw0ZescQ/0kYc/gLw/POOBvHG+0HSc5A3v/jvfCcGQOs14S76cFxNS6X+ntWv1+MEvPxb1O4R+73oRW9Y3rEagJydlywugzR7iNz7OsdFG6m5lMCS2rgZ/yTy09x4wKpWi5otiXb21ZfvNlJ6XKyAgY8UK5nfjOu8JhAZVDSrw3W+Xi0jIqnIL6Ju0Ii77MD3ndCNed4hrgcSYf42oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ0kaPsKO3Ml3Z9weND2aI5Cmr/DJI0HseFxS2Ej6qo=;
 b=urLiEhEMa3Kh1FiGHUw3Rs9YoCpjJZKNQZyAC3AwuCoa9GLrCvUtlgrrRYAECfPcN62AM0AD3I355a5tiFLOiBcRs4yBAr5ayWrHbyDikQGW29wxm3aTk/dPSmPzhNnQgOMRqeqKZDpbRFoOkiDeuDtYqvBDNslzKqutwVKPvBE9UYzz/b8Lsmby2btOiL7fLWeAHIfVxO1Gi06xYHFpeGcgrDph8F4CXJCLnHN5WD/AQOZc/Gel64X82m5ESHkSkzigY6Yn26vrcKcgu+ic5MjzILShf1rWTB+FKojfXiVkA2iJQjsIkITYQu4Ku3fdIVgrLZJiDkUJ4pcj7O0HpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ0kaPsKO3Ml3Z9weND2aI5Cmr/DJI0HseFxS2Ej6qo=;
 b=DfN7dHRtpAeYHGONBKrv2Jibim0POw4i034kGyH3GA5qXxVsKShCwRgv30qY+F2dBa0cvkoWTkCMIdFv+4ApyDSRSgWoWzr/ICcEkbtFWt5JJZM/o8ScoqpaaQlESFkp1am6LC31BjIu4xUgni+W/YYX8P+2w5VWL/mEAPvkfas1T2vJfkEu2FKbrNgsK3WcR0A7zNCFx6EztksVB2goNF/ODympE9YYLenQAe51Z6eHjMHmsu5xRdn2MLpW8RN1laECNV9LDMc7S/WZA+lmmwNzcmpXwZtYHbKrriiCQzxofx1HD789xqTiTRdjv75LKMiYfAOWaRNsb3APt582gA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Topic: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Index: AQHcEaKMMDydbZiTjE+UNGKddouDNbRs1fAAgABSSoCAAAVDgIAABVUA
Date: Thu, 21 Aug 2025 14:51:16 +0000
Message-ID: <cf6dc9bc-443e-4b6a-a2a9-affce315e219@epam.com>
References:
 <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
 <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
 <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
 <ad40448c-499a-4d85-920b-a95bdeb67d9d@suse.com>
In-Reply-To: <ad40448c-499a-4d85-920b-a95bdeb67d9d@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA6PR03MB10435:EE_
x-ms-office365-filtering-correlation-id: 9903597d-5b73-4c20-e48d-08dde0c22ea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGtjSGdnMjYvdmlYT3pUelZtRUF4OSt0QW50THc4Y3RleVkwRE9rZUMvQUNz?=
 =?utf-8?B?OFRmOHNMakhUREZ2bDZDWGVWM0RNM2wrSldLQWpFOUpHcWNCR2V3dzF2NVZ4?=
 =?utf-8?B?MTdyU3N0cFFleENBMEozY3U4TjJNSnBMZU5rM2I3aUFvQVVSM1p6anpIQmhI?=
 =?utf-8?B?ZmhTcFg3Y3NtTXcwUDZNbTE4dVNvYnRZVzhwOFhIaWZCV1JsMnJQUVNYWU55?=
 =?utf-8?B?SC80eFB1cFNzNjlxbFRVR1RsSU9MTVM4NDZwTE02TFVMMUtnYklwdnNSWitP?=
 =?utf-8?B?ZEZwSmIyY252d2hWeFMzclprSE9NWUNEZ2paRVdoWDJZakZNN2NodFlJSlFH?=
 =?utf-8?B?UnE0ZlBtVDBDMnRtWWdXZG13NGsyTU1wRXoyQzYzaTFvRkdpWWc3Z0FvM2JK?=
 =?utf-8?B?Z0dhOFpla2ZiNmNXRlk4ZlI3OEh3ZVU4MlBjbFZEbkVXZDNFTEsvOGhRaWtS?=
 =?utf-8?B?Z3FncnZ5ajlydUd4TGVhUDNjYWMyc0poV2NzTm9QazBJZ1g4MkhwaXhQbVJW?=
 =?utf-8?B?R2pXK2g2WFdxZGlqZkVGV09wS0NaTm1ZeUc4TjhZWHdnUUJWNGpDNG1xR1RY?=
 =?utf-8?B?Y3Q5VkdXMW1jZVR0R3dsRlliL1Y2TkhkdzFYV3VaS0Q1T2s1WFJnVTk2TXZs?=
 =?utf-8?B?UG1SNk1kVDRLaGdoK0R4SmdJZ3loNlBJQm1oVDR6NE9BaTM5ZC9yblNlamxY?=
 =?utf-8?B?WElDNG5UeG5pYWp6d1RSK0FZT0IyeHRST0dYQ1F5T0x0bGpkYlkrWjRRUTho?=
 =?utf-8?B?NTZrUUo4UVlMa1RDZ2RIZjR2bGRFM1BLbjNmeGRCc050NG12b0M3cTF0Tm5R?=
 =?utf-8?B?bGZVaElCcDhtR3BDeFdZWUJHRC9mcVMxUVkrUXRFOU9rNGwwa29lbm5uak5p?=
 =?utf-8?B?eHZTSW1lQjgxQTRuWWVCaklhVGFMS2daY2VXS2F2eVI4TzVkU2lNU1c0djBM?=
 =?utf-8?B?VXZJYW9ORDAycG9EeklUUTBCRTdORm01MnF2UUJDQzI3L3dCTzQ4bWRYZFFY?=
 =?utf-8?B?NGJoeXBxV0lETHJiUHFHU1FoeDhCWGEySXRzUzRJdTRIaU9EakI4cFk2TTRL?=
 =?utf-8?B?TVBuN1VSZmlsMTU3SUtRMHZHdnJFdmdZYWE1SEt2b2NwWklkRjNiYXBEdndy?=
 =?utf-8?B?MjBpeFBaNG8yeFVKSDJyZnRiZmZHcXBFMm1yL29wbkV2Mm9YdWlWTWcrQW5V?=
 =?utf-8?B?R3FIb1lVRGNoWHJ0WlhyQStZY3krN1JKNWgzaTN6WDZ4Wk5tT2R0SW9ncG1x?=
 =?utf-8?B?dm5xaU9xOXVWK3l1VGlXYXJCNzlmRHZBZUtUdXFaR0xUbTNkdmVuZ3NrbnFS?=
 =?utf-8?B?OVhCQUF5ZHlZZjgyOHcrU3Rnc1NiQ0xFR3M4S2hwRWhOTFhJY2dMV0p3TkJ4?=
 =?utf-8?B?WFpEd1pPejZob1VzMnE1Yk1tSmFiaUZqL0JjWVBmSEUrUWM5cnNTNGVLVVox?=
 =?utf-8?B?cnRmWjlxaFh0bU5tSDlNS01ZOFpWQkRRWFlIMys5MXBVTndjV1VsUFp6SDJ0?=
 =?utf-8?B?U1dXQkF2Y0syT1pjZTg0NlVWSGxUMGM2VDJFVTFYOVpDOGkxNWJ6ellLMkQx?=
 =?utf-8?B?NndIUjA4MmVaNWJKY04yOFBpblVLcDBXQk9WVlhnbVg1eWc2RTJmb0RMdmkz?=
 =?utf-8?B?OU0vL3RtSnRucUlJMDBFa0V6aVFQaTd4RG9IejFqQ3hqa1VCT2F0ZU11dTBo?=
 =?utf-8?B?V3c0T0NVTTY3SGxhWkRja2JmT2RiMW5kZ1V6MVZMUFpnN09ZaU9SMi9zRmRV?=
 =?utf-8?B?cDhYN3NwMk4xaGJXc20wWXZHblFweVVrUFNmcHl4REUxNjB4ZUQrdE1jWnZ3?=
 =?utf-8?B?cWF3UzBCWWhVSGlWUzJPZXNvMnBDMC9EK0VCTklzOWRKME1rWmlTM0tmM3lw?=
 =?utf-8?B?YXdtOXlOZWs3ZmFoTDUyRDM1MmRUQ1V6dk52VzM4Y1NZVUZRSktjL21lUXRX?=
 =?utf-8?B?NFNQY1hEbStWNGlzSWgyNFZwSk9jREEzNmFLVW5BYmkyZkE3SldVeFpSeHlh?=
 =?utf-8?B?U2g4NzlNSVhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUdyUW1paGZwNFRiQmJnd3F0SlpuOHZCVEMwdzAxY3NyNW0zb2RHaHJkWjB0?=
 =?utf-8?B?K25Pc2M3VWk0aWdlMkZ3TzFXMUJkWWVzaWQ1b3l3WjRVQ0Rva3FMQjdlR3Nt?=
 =?utf-8?B?WDVFZ2JZZnRqTnl3OEtoNGlxQm16NFNBYVVncmVzZEtvNGJzaG5DTlBzL3Ez?=
 =?utf-8?B?R2NiOUEwVWduaHFwUW9YeGVxbWJoekRGa0dyWUJYN3E4WU1xblhmZXQ1bGFX?=
 =?utf-8?B?dDFJMW50SVlPQk10KzNXeWFxakszNHdhazZzaGdyR3FWWUkycTR0S2VuNEpq?=
 =?utf-8?B?TzkzcG4zbWNtVCtsSWhITUxRN09wSUtPQkhpd0JCOGNLbVNEZmlMRVFOWmtl?=
 =?utf-8?B?QmdvM1dFbzFybUsydk1yMXBGczRLdkVkaDY4cUtZQjllK0tMZEJMeHZHUzFa?=
 =?utf-8?B?S3M2bkZ1SHkrelNyV1AzSmk4am1OaW5BejdLaGJvK3R5QzFVc1Y1VElhdHlh?=
 =?utf-8?B?UnJOemdKb1VURjcwRTNncVloUGM2VmU0QVNNZVFxdllyR2NDcnNKTGtBRFlW?=
 =?utf-8?B?ZHMwdGZhV2g1enl2RVJmemticUYwYnl2QU1oWXZRSDZuemtoUmkzcDFZNE1p?=
 =?utf-8?B?MEJ1WnJDMkJnaktCNWZ4eGJTU1doVysxSXJHUWhrWEZwRUljOEdJYU9oTVpo?=
 =?utf-8?B?WU9XeEM2R1FGdC95N0hldGh1N2dYdDd1TENHb1Z2c096T0wxaWFDTTd0d3lu?=
 =?utf-8?B?dk1VVkplU0NET3dZMjlTS2x5L1dhbGJZOTg1OC82K01xMlJ4dzdHNTB2VlZr?=
 =?utf-8?B?UFBST1lqK0NDbVB5N2g0Q0lNenZXaGJodG03SVJDS0RGVU1kb1l1dlNKYTda?=
 =?utf-8?B?NjZIWEh4VVMzYVdzWkJuamZhMnZjV1Z6enV2bW9xenU2dkFnZTF1azM2TVps?=
 =?utf-8?B?dDFzSzV1TU95Z1FpRVZ1ZjJvUDZoSGlFaXorczV5amF5Q0VuMVhTajdLMDIy?=
 =?utf-8?B?eldsRTZpaWg0V0JYUkJrVExPdk1RYkNYcnZDVVM1b2poSkJzellIejNvVUZO?=
 =?utf-8?B?Q0lqdEVhakl5YjR0c08yTC8yekRKOUxOeElTM1hFNVpxaWtncll4LzB0cXlJ?=
 =?utf-8?B?Um1qVDgvOVlwZ3BtVnNBcCswOUtvd2dWV1I1ODJOSW9hajA3MmM0WE85dG40?=
 =?utf-8?B?d25HSFBTandsb3ZQaEZrMVM0TTN6eEJwbTNLZjRLQjZOQnZuWGUxZ25KM0s1?=
 =?utf-8?B?YTZUWk9TMkpTSFlhTFVyYmJwR1RGTXVqY1VZTEZyVVUxd2NNeEEzODdFNGdK?=
 =?utf-8?B?ZG5FVUV0MzhMN3dFR2tQMEY4QUVWV0pucmx5K3JHNFZMb1lxYktiakhnRmpQ?=
 =?utf-8?B?OVNEU09RaGdvd1FEY3l0b1RpY3J2R2FyTXBjMDVna1JEK25pQitLbjFIdk4z?=
 =?utf-8?B?cE5Db2F0QVYyYmYxU1d0NFpPK28veEpSRGR2SVNDN2wxYWZhNDJ4eDNqZkcw?=
 =?utf-8?B?c2J6Ui9Ia25pZHgrT1UzQUV6OXNGVG15YTYrV2VJUlRsNDRPalRBL01XejU4?=
 =?utf-8?B?OVhERVRBNjRISWFCNXJXRm5uWmppR00xT3lPNEo2K0wxK3ZLZ1UyV1hPZWs4?=
 =?utf-8?B?eE9ocVNKTDhsZG9RQkx1Y2VaM1Z1U3BOQktzNE1iR0V6enE1MmtFOGlRK1BL?=
 =?utf-8?B?YStaaVR4YlZUclpuTXpXQVhIRnB5NFJmV0VnYkhucGNBdCs0KzhtVHpvcVZQ?=
 =?utf-8?B?VUppM01QczFSUG8ybFM4aURYSzN0cm1UVU1kd3ZEV01ZaXlPbkpEb0J0M2Ix?=
 =?utf-8?B?SFVrcWJ2Y2o3VzNnVnZ2bk9yN25ySkZ0MEJLb1l4UmZNejdlbjRlSXRDcytw?=
 =?utf-8?B?MTNnRndaZWJGcVlEMXJ5RHVaR0QyWXFISGdZVkdJMldTVndoc1BtTlU2ak9W?=
 =?utf-8?B?MkJJdWQ0VXdUNmFEZE9WQUl2dFEzaUlYRGRJYVdTdjczNDZZNnJDcU9GWTRM?=
 =?utf-8?B?YkFlaWVuQnBZbzhrMnZTYmNyVGp4NUNPc1hySGpjR2E1bk5TRXcvV1RkOFJE?=
 =?utf-8?B?UmJXcmxtTHc4MnQ1Y2VQeUYxeW56WmozRlUzWi9raUFOY2NJUkpyNVBQaVor?=
 =?utf-8?B?MTU2OXAzaHQ4eXVFQmpDa3BaM0tiMk9JVHNrYVJJdHdmY2E0cmU5RUpUSjBX?=
 =?utf-8?B?WVVVZTNkbnNZRE5TRGVNTEVJWUNGTlVaVG5rQ24wYVBpZGRyMW1aYWoyaitl?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6E754405C1B7C42A3ACD49207F46D0F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9903597d-5b73-4c20-e48d-08dde0c22ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 14:51:16.6699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSfvjeHetuAxlia8AajaAT+yAhKxp+0iqWz6xzaWbqIbG7n/+dDMOkKxFFlJEFZ1mClvUx0+ib10N5ZobG6G4Snc7MjkBFTS2I2SQ1ZdL2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10435

DQoNCk9uIDgvMjEvMjUgMTc6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wOC4yMDI1
IDE2OjEzLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBPbiA4LzIxLzI1IDEyOjE4LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMC4wOC4yMDI1IDA5OjE3LCBEbXl0cm8gUHJva29w
Y2h1azEgd3JvdGU6DQo+Pj4+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJ
Ui9tb25pdG9yZWQuZWNsDQo+Pj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VD
TEFJUi9tb25pdG9yZWQuZWNsDQo+Pj4+IEBAIC00NSw2ICs0NSw3IEBADQo+Pj4+ICAgIC1lbmFi
bGU9TUMzQTIuUjEwLjINCj4+Pj4gICAgLWVuYWJsZT1NQzNBMi5SMTEuMQ0KPj4+PiAgICAtZW5h
YmxlPU1DM0EyLlIxMS4yDQo+Pj4+ICstZW5hYmxlPU1DM0EyLlIxMS4zDQo+Pj4NCj4+PiBXaGls
ZSB0aGUgZGVzY3JpcHRpb24gbWVudGlvbnMgdGhpcyBjaGFuZ2UsIGl0IGRvZXNuJ3Qgc2F5IHdo
eSAoZS5nLiAibm8NCj4+PiB2aW9sYXRpb25zIGxlZnQiIG9yICJvbmx5IHRoaXMgYW5kIHRoYXQg
dmlvbGF0aW9uIGxlZnQiIG9yIHNvbWUgc3VjaCkuDQo+PiBBUk06ICA4MTNWIC0+ICAgMTZWDQo+
PiBYODY6IDE0MjJWIC0+IDEwMzVWDQo+Pg0KPj4gTG9va3MgT0sgZm9yIEFSTSAodG8gYmUgYWRk
ZWQgaW4gdGhlIG1vbml0b3JpbmcgbGlzdCksIGJ1dCBYODYuLi4NCj4+IEFueXdheSB0aGUgbnVt
YmVyIG9mIHJlcG9ydGVkIGVycm9ycyBoYXMgbm8gc2lkZSBlZmZlY3QuDQo+IA0KPiBEb2VzIGl0
IG5vdCwgaS5lLiBub3QgZXZlbiBvbiB0aGUgdGltZSBpdCB0YWtlcyBFY2xhaXIgdG8gZG8gYSBm
dWxsIHJ1bj8NCg0KWWVzLCBzY2FuIHRpbWUgZGVwZW5kcyBvbiBudW1iZXIgb2YgZW5hYmxlZCBy
dWxlcy4NCkJ1dCBJIGRvbid0IGtub3cgdGhlIHRpbWUgdmFsdWVzLg0KDQpEbXl0cm8uDQoNCj4g
DQo+PiBKYW4sIGRlY2lzaW9uIHVwIHRvIHlvdSAoaW5jbHVkZSBpbnRvIG1vbml0b3JlZC5lY2wg
b3Igbm90KS4NCj4gDQo+IEZvciB4ODYgSSB0aGluayB0aGUgY291bnQgaXMgc3RpbGwgdG9vIGhp
Z2guIEFuZCBubywgaXQncyBub3Qgc29sZWx5IG15DQo+IGRlY2lzaW9uLg0KPiANCj4gSmFuDQo=

