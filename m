Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993ED33929
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 17:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206852.1520107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgmzu-0001Nr-Oq; Fri, 16 Jan 2026 16:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206852.1520107; Fri, 16 Jan 2026 16:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgmzu-0001Kj-Ln; Fri, 16 Jan 2026 16:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1206852;
 Fri, 16 Jan 2026 16:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ss+l=7V=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vgmzs-0001Kd-Nt
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 16:48:28 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d69ea1c-f2fb-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 17:48:26 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7908.eurprd03.prod.outlook.com (2603:10a6:20b:423::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 16:48:22 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:48:21 +0000
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
X-Inumbo-ID: 2d69ea1c-f2fb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usf+GHsGG3N0Tg+yeKkGrQzJPwQeloqAWw5GVyn5aeS0FBS9YUc7qx6tPieH8dBGstqelQHwYV1RXFni9zIRu8aXApE6YvNlho4tRvA8os6SqSbgFHNyvamjPqOZwoXQFeA70hQ7mSvdnNyKDI4qmMvB8TZepqca3b75aBiHsLUAeW0Ae0RHy4l1CPzAkmoluTxJ1Xca3XnwGYnht1F0N3RXdeeuUORSR9cVd1nm1ENa0in5Ye+/ttfwdfXFO03kipD+m2gQ+OpZmkp8xbZoaStpGYoXm/f9uxPwtjXW95JbzZUO27fwiDRfx7gOI8vN+oCvYyyBSwCzDO3kfLQ9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It20i3rhZ/8FmuH9XLH2uRdbx5EC01CNmV2DeU3GCcg=;
 b=w7ia9SMTqG93SwBnVO96BOLKkUI5HSGthiNMWfyD/scyioQOP9ieWhD5QxUFODY81Q+I8ACf9MFww/Ex8kksv/t7S1f4obVooJPWxbZEjrpTngto7LQqk+tIoyOQt64BU9az/bXtfS7I9bcs/egd3sVzfY8EfhBCBxpcAP4q1/25bd49qf2VH3cDMdvTjrUmWC1U9GV5PODyfyL8SoVpFaE70GEvi1LJVKPLbmqfaVWND1hJJXRLwBAmOJc6ROYHvSnpPxzN51DZvXDiylz+WYLchFa7Eh0dZZ9fA4KqnPeAa84BQ2PCgx+j6dwY1QtpTG27SeHEGIoBRtulw+yw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It20i3rhZ/8FmuH9XLH2uRdbx5EC01CNmV2DeU3GCcg=;
 b=IkWBZ/iWQ/ombq6oCRoCmh6+j3DrrK8IlwKpMpjZl7z1tpfnsbgdEmPSNzbMnKKUwRCEgy8aH29mEC8E0fvrlUumrQkfKZ7VCxrhyjNMYb+2b0iJaxVy7VPF2AuCeAVKOuxVDm8FvlHIGwgW7qyJ5Zlo2139yNLNdUILt4KROKF1gK1Bl3uDc11Ic/PQoFtv8bfDngKu9M5+AqNevKqfuBaKdzLqE4ak3qUAG3lyIlqZQD9S0GehI5HDc/3ELkbYElqNNA81eRUYbINE5HA+8KD+Leh6cARE3NDdou0xelZn2O9j/5SQozedkiPn+Zv2+fzoMVbmKDRye0/V5w+HFQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Topic: [PATCH v7 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Index: AQHchYPEY703sAu32kaCSJHhjFUjhrVS+QWAgAILygA=
Date: Fri, 16 Jan 2026 16:48:21 +0000
Message-ID: <a5d6caa8-d49f-4fce-a27f-d9097a8447ef@epam.com>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com>
 <29c2d1dc-23fb-403e-bb03-d8c2f32424e6@suse.com>
In-Reply-To: <29c2d1dc-23fb-403e-bb03-d8c2f32424e6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7908:EE_
x-ms-office365-filtering-correlation-id: 50f9d6d0-2092-4c4e-4949-08de551f0e9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFUyb2JjMEhXQXJyRFdqdHBOdWtZcXU1V1YzdDNGaGtlcGgvaWdLbXc4dy9k?=
 =?utf-8?B?VFNIa3AyNEt2UWNBeHMxVEVROWNvMGowUXFoeXRnR0grREtmL0o3QUJyNjZH?=
 =?utf-8?B?VGtEVWJDcmlHNmswQko4cUpML1RDT3E1cnp4TEplVzNqemY1bzlVbzBpbmxi?=
 =?utf-8?B?QkM3Smw4Tlg5aDhBN0FTcWs2alo1SFA2NFhiNmtSdzZUNHYvcEsxUkQ4alU5?=
 =?utf-8?B?RHdiNlpJeVFNV3lEd2lTeEpSc3RQVGl1UjZsMTBrUVJKQTNsQ2RlM0Y1V3U0?=
 =?utf-8?B?SjljOEwvNDhiZ0VzYjRidWYxM3JkSkNUbURDWEYrUmN5eEpWOUtBV0dwb0Rj?=
 =?utf-8?B?RWNnaVVOZXdkUUtDc0M5UDhuUHp1QzFCLzJmMUN3VmdnZzJabzVtS3BhY2k0?=
 =?utf-8?B?ZlBsNEFham13OGk3ZTNJZHlsaVlDUldiMVZBNnFuR1pELzRoTW1BbW1XSzNw?=
 =?utf-8?B?dlUxNUNjbHNMT1JFS2YyRVdZd1dNYXdwZTU0UHdYRVd1dWJoU1N3VjVialNp?=
 =?utf-8?B?YmV2Vjd2TGhialdxM21adm1XcDB2NU9qUm93VFg1U3FsL2EzRUg5RC8yK0JZ?=
 =?utf-8?B?T1hxOHR4aW1TZUx4SlJHQ3l6YS93UGIwRk1Nbm1ST0p2R2VqaGw5YTlrYVMv?=
 =?utf-8?B?eFlaZ1dSVlk5MlIyeWhSalMrbmxLMjZNdkNZRVFodENPQWxtUWwrajdlTGxo?=
 =?utf-8?B?eVNONUdqSzA4aVhjcDJsZHE3TGxqK2ZqSEdrRTNXQ1ZhRHV3WmxkV3hCUHZY?=
 =?utf-8?B?Uko0cE0reEl4dVBaZ2Z5T1VYMVNCTmgvL0NqMEtIRUhYeFFCWm1VMXErMkhN?=
 =?utf-8?B?YThCNjhwMTZZdUpLRjFNWDROWk0zS0pWaVZKdFdsTTZnL0ZvUnE2azJWeEFl?=
 =?utf-8?B?OUw3MnlkeW5jQmhzTzhqVERTUlhNd3YzZDdXZ09tRTg5dlhiWGxIT3VTcVFu?=
 =?utf-8?B?Sms4UEFNQjhtdzc2MjRwcEl1NTNneU9pbGtjQ2FGY2ZhZVVpNklhQ2Q4c1p0?=
 =?utf-8?B?NGZJZVQxWGVpRXcxZFJ4Nms5YkZEMWIyc3RRY3FDbmljTEFpeVNYRUVtbmRl?=
 =?utf-8?B?d1laRktxN2ljQVg0ZklabnpLN253Q2VDWFJZUy8vVFM3MDVIS01yOFpHZE9S?=
 =?utf-8?B?a3BUSlNtcEx3dGhnbFpvbGNqZnRNTVY2SzB3OHdVQkFXbTQyRmtKRVBXN1FH?=
 =?utf-8?B?M2tFU2orcDVMa3dJNEpQMFRSV2pqNTJBL1RXZE1sdEVqMm05R0hweHU0bjBn?=
 =?utf-8?B?SDRkNUhMbHRoNjBwQ25nR3ZXcTExaU4vTHkxUXBTemIyWFZIQ1VZblRDQUlT?=
 =?utf-8?B?MFJsSGsrNWpBMDVlczB1bjNNSitGY1VUbmtFK3lUdkY0b3dKNXNnWkUzbHhp?=
 =?utf-8?B?SWc5VVM4aHJtUEpRazhJcDlCLzc2YTE2b2U3ODlWVjVTTGxySGpCVHlXSlF3?=
 =?utf-8?B?WXdIelROK3dYZ2NMUGtRRlk0dHVUVW0rcHdNZlBINnR4YzBOMDFBdzhnUjZ0?=
 =?utf-8?B?VXUxcDF1d1U1WHRmZlR1VVFEODRoSHc2dEN3cDZYaDFFbGpVYm9UelZuQXNm?=
 =?utf-8?B?TUt4Rk94b2Jla0ZCMWlTOUFqMDBIMURVbFhCNGwvMmF0czRvUkVCai8yZ3k0?=
 =?utf-8?B?ZHdpQ1ZtZ3FGU1VyVGFLdjFseXh2MUZsS0ZJK0dHZFpNa3dya3luRWRFeDlp?=
 =?utf-8?B?MDQvOUp3VFhNcGFqcGNYTFA4L0pXMStlcG1EbmRuRWpFL3pjWEVMajNxZTFS?=
 =?utf-8?B?aVc5dUI2SDNncVhBTnRMRjAyZFR3ZHovSjg3dkhwRkNzaUs4ODBoR1NnN0NK?=
 =?utf-8?B?eVlER0FrRkM2d3c4djJ2djRFWmJ3dlc0dUoxZUtRWlIybkpEVFNwOHNKWURF?=
 =?utf-8?B?aWx2ZHkxay9kYWxsb3ZCMERrVmdHbklTRURUdUU2ZjNuekkrbU9SMjF0WEpB?=
 =?utf-8?B?aENnOTVSVkNRL0dCTU8xWFpaOHlkeFVmWXhRdExVcnMyaS9XQUZuSjNSL3B2?=
 =?utf-8?B?bVJQNHlEZkhIaFJybGhpUFNacEhoNDc4Vm5ZVDdMMXBYSEt5Q1V6OVl3Y0Ur?=
 =?utf-8?B?cjhsNU8zZ1ZPRnZlb3JjTklOR1RhbG9NWUkrdGw4eHhkVWtOU3JsTmNNUmg2?=
 =?utf-8?B?VHVFSXkxUEF6RGpiVTd3b0dBTmdnUTdsc2UvQ255Y2h5TDRiL1NsNEZzT2oy?=
 =?utf-8?Q?1uKadJXim6oFAEmx9G1tnyI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDV0Tm5NNXQxakJFVXcxcEp3Z3FDbnBjalZXRnVFSXpvblArNGhacEVRVXFN?=
 =?utf-8?B?Wm82RFh0K0VnUFUyWlN3a1I4QzU1bXlLcHpGcXEvZmRaajhENHhsdVNoTEd2?=
 =?utf-8?B?Zjd4SGNDUENhVzQrQ1UwbGl1TGh0ZG9xMG9BeFFRc25VMjVFSndkeFpsTGg2?=
 =?utf-8?B?RVdIVllkTnY2Y0RNN1RkeUxEOEpLeXhNVnRJN0lLNWhjaTNrR0JabllHU2Rx?=
 =?utf-8?B?VVBhQTM3ZmxCL2Nqb0pXYVRvMDZpL3NIcUxNWThxa01kTDErdENIQlpmNHgr?=
 =?utf-8?B?WUdlVmF1QU9OUmFMeDVGRjR0YVcyWmprZU5teXRMK1ZTL215ZWlNRHpzTGQ3?=
 =?utf-8?B?d1hQcWRuYUhheEdEK3VXUnlPNldHRmcvS1lJTkJHeVJZeUd5ZGpJZ29YdjlQ?=
 =?utf-8?B?cUpOK2xNdHBiVU1JWGFzU0s5ZEc1R211dlYyeW10cndhRHgxYjFUM1FCbXVI?=
 =?utf-8?B?Mm9LNjVrYlZBKy9KTEcvWFVnQWl6eG51QUxzTHFkR0hlQUd3MmhkaW42T3o3?=
 =?utf-8?B?eEdOMVk3U25TazF2UUpoM1BOQ2MvK1FGdWh2b04zYSswQlhWUEw4YnQrbk1a?=
 =?utf-8?B?WHhuL092ZG95am9TYys3VUFvaHhEdGlySzFuTndMQ2h5UlJvWnZqd2FhVHcv?=
 =?utf-8?B?MVhVbWhvSDdkZUI2VHF6TktrMWl3SWZKZis0bnJFcnBBT2lsemxmeVg2UThJ?=
 =?utf-8?B?VW01bWJGQUxFUWxtdHV3aVk1VHIyekVSWTg1U3F0SGNsQXc2c2R3ZXFJc2Ux?=
 =?utf-8?B?RERGeHJQaFExaGgyQzcwYktZNlh3QU5CTUZtYVpkUGxvOHJwSVhlWnQwYjFw?=
 =?utf-8?B?SW4yV1o3SU8ra0FQSWVOb3hTc0pxNWNTMXR0RHo2OW43ZGZkUEhMV0Rsb2RV?=
 =?utf-8?B?UkVCL0gzTW94RWdLNU14K1dsNnAvL25CU09odWdISmlseVJLeVpwN3FVczNx?=
 =?utf-8?B?VVp6WS9ZdXp2S3ZKYktMcTBJYXh2YlNTYWVzbGJ0b2JRejV6OTBKUnVjL2RU?=
 =?utf-8?B?UGpaSzNJVTZ1cXgvcldtZ1ZxY0tQQUVzcTc4M05TblJPOXY4MGQvZTBYQ212?=
 =?utf-8?B?WGZmR21jdXlzN2RVSkwyQUhFbW1Ea2tDR1I5OXdta3NGWVZDcnpQbE1jWkZY?=
 =?utf-8?B?eEM3WjFxcHB4UHFqVitleGtnQkYwdUYvbWo0c2hyeVNVaklzbG1MeTNvL3k5?=
 =?utf-8?B?V3BzSXZvazdhUTk5ZEYxTzJ1Uy9CUGZudzhaZEZpRnAyMmk0WExjWHk0UURi?=
 =?utf-8?B?ZnRDZ3F5YXZHZm1XNVVYTEZlVW1sMGRIZkdhSGVVYTlTd3BUT0diZEJVOGlF?=
 =?utf-8?B?RHVNUzMxRW5VbG5FbytUaU8ySSswNktnakx2eFc5ZENJSzZKTXlWMG9TZmZO?=
 =?utf-8?B?eG9oc2grd2czN1RFelpBMzErbUtmR09QZHFGWkRLaFAwMS9ZUk8rUitXSHJL?=
 =?utf-8?B?VXh0aDZmbzhsV1M1VmI2RU44alVxWTFJVjFiQTJldVhiTWFaQXVnblptL0sr?=
 =?utf-8?B?aXU5QThpNjAyODJRS3VzL21UbWN6M2NPQi8wVUcvZWorN2hmcmlrZXllSFZ2?=
 =?utf-8?B?QVRYWmg4UjlacGRuaGpSalNBM2JVVzlzWG1UUmx4N3Z0YjZDbTQ1V2w4TVA3?=
 =?utf-8?B?Y25BNXE3U2pGZEs1Y042WFI1TDJ2K08wSzl1M3J1STk0RFRDZWZYbFRrZGc4?=
 =?utf-8?B?d0JLNGdJTXMzZU5tYndiekNqcWQ0eXNocXh6RmhzUTZvV2FFWlpmNlRZZS92?=
 =?utf-8?B?TEljSXZuM2d1R3pKTzl5bE9ENTFWcTNpSWJCbWZxTFkyTVFldHdWazc3SGV2?=
 =?utf-8?B?eVF6WnphU1dTbTBJVjVNak1pL0duVVdhcXdRRGtCWGl0STNGNGNtUXh1cGpa?=
 =?utf-8?B?TU5UaGxXQWluR2o3ejFVRjFvemhtV2NwdjFsUjRrZHI1cG9CdHYvV3RKYm5m?=
 =?utf-8?B?K3dBWFhQTVk4Qnk3M3BJdVc1MzFUZGI2Z1RrVllZWlY5VDZRWm54YkRkL3Bz?=
 =?utf-8?B?RU1lOFVsQmp4RWxObUYzRHdSRkVxOVNMRjkxKysvd2Nxd1I3RUhBc0hWdDVY?=
 =?utf-8?B?eDVBcnB0RUxyRW53N1JiYkFNNDlRR3VXNGg2aXYzb2dONG9BKzlVR3l6NVQ0?=
 =?utf-8?B?RTBBamlrWUp0TnBIS3F0YUErNktFMEdQbG9Xd2pKYXZ6cy96akQyQVcrZXIz?=
 =?utf-8?B?ZjFXRzVZMXA1UjRENWJPNEJDNHN6ZXBneHhHMmxObC8yZ2FNdVQxK1NoMHVX?=
 =?utf-8?B?RnlHa0QxTCtPUEZmV3I2ejloMVFiMFFHUzZoOG1sWXV5QWNTQzM1T2psNC8w?=
 =?utf-8?B?N1l4RmN2aDI0WEVQUk9URnRCSWE2czJZWWl2N0VNd01ZV242ZWdNVi9FTzZB?=
 =?utf-8?Q?KqXF2GwdDgXtPGw4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE057790A04BA342BAE75E8B702B5242@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f9d6d0-2092-4c4e-4949-08de551f0e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 16:48:21.0198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UF+vPfYR6WG6JgQlTradLkF6DfiKH8PaNTVQ97fjTxJ6v+g21S6sxcD908YHoWsoasKBfcmIq24Wmf82zadopwcrVOvjW+OH7wGtjnqtHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7908

DQoNCk9uIDE1LzAxLzIwMjYgMTE6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4wMS4y
MDI2IDE5OjI5LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IEBAIC0xMTA3LDYgKzExMTUs
MTUgQEAgYWZmaW5pdGllcyB0byBwcmVmZXIgYnV0IGJlIG5vdCBsaW1pdGVkIHRvIHRoZSBzcGVj
aWZpZWQgbm9kZShzKS4NCj4+ICAgDQo+PiAgIFBpbiBkb20wIHZjcHVzIHRvIHRoZWlyIHJlc3Bl
Y3RpdmUgcGNwdXMNCj4+ICAgDQo+PiArIyMjIHNjbWktc21jLXBhc3N0aHJvdWdoIChBUk0pDQo+
PiArPiBgPSA8Ym9vbGVhbj5gDQo+PiArDQo+PiArVGhlIG9wdGlvbiBpcyBhdmFpbGFibGUgd2hl
biBgQ09ORklHX1NDTUlfU01DYCBpcyBjb21waWxlZCBpbiwgYW5kIGFsbG93cyB0bw0KPj4gK2Vu
YWJsZSBTQ01JIFNNQyBzaW5nbGUgYWdlbnQgaW50ZXJmYWNlIGZvciBhbnksIGJ1dCBvbmx5IG9u
ZSBndWVzdCBkb21haW4sDQo+PiArd2hpY2ggc2VydmVzIGFzIERyaXZlciBkb21haW4uIFRoZSBT
Q01JIHdpbGwgYmUgZGlzYWJsZWQgZm9yIERvbTAvaHdkb20gYW5kDQo+PiArU0NNSSBub2RlcyBy
ZW1vdmVkIGZyb20gRG9tMC9od2RvbSBkZXZpY2UgdHJlZS4NCj4+ICsoZm9yIGV4YW1wbGUsIHRo
aW4gRG9tMCB3aXRoIERyaXZlciBkb21haW4gdXNlLWNhc2UpLg0KPj4gKw0KPj4gICAjIyMgZHR1
YXJ0IChBUk0pDQo+PiAgID4gYD0gcGF0aCBbOm9wdGlvbnNdYA0KPiBJIGFwcHJlY2lhdGUgbWlz
c2luZyBkb2MgZm9yIGEgcHJlLWV4aXN0aW5nIGNtZGxpbmUgb3B0aW9uIHRvIGJlIGludHJvZHVj
ZWQsDQo+IGJ1dDogV2h5IGhlcmUgKGluIHR3byB3YXlzKT8gRmlyc3QsIHdoeSBpbiB0aGlzIHBh
dGNoLCB3aXRob3V0IGl0IGV2ZW4gYmVpbmcNCj4gbWVudGlvbmVkIGluIHRoZSBkZXNjcmlwdGlv
bj8gQW5kIHdoeSBpbiB0aGUgbWlkZGxlIG9mIG9wdGlvbnMgc3RhcnRpbmcgd2l0aA0KPiAnZCcs
IHdoZW4gdGhlIGVudGlyZSBmaWxlIG1lYW5zIHRvIGJlIHNvcnRlZD8NCj4NCj4gSmFuDQpIaSBK
YW4sDQoNClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuDQpJIHdpbGwgYWRkIHRoZSBm
b2xsb3dpbmcgbm90ZSB0byB0aGUgY29tbWl0IGRlc2NyaXB0aW9uOg0KDQoiDQpBZGRpdGlvbmFs
bHksIHRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIGZvciB0aGUgcHJlLWV4aXN0aW5nDQpz
Y21pLXNtYy1wYXNzdGhyb3VnaCBjb21tYW5kIGxpbmUgb3B0aW9uLCB3aGljaCB3YXMgcHJldmlv
dXNseQ0KdW5kb2N1bWVudGVkLg0KIg0KRG9lcyB0aGlzIGxvb2sgZ29vZCB0byB5b3U/DQoNCkJS
LA0KT2xla3NpaQ==

