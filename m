Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E524D08EEE
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 12:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198595.1515487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAkz-0005LZ-0E; Fri, 09 Jan 2026 11:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198595.1515487; Fri, 09 Jan 2026 11:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAky-0005Iz-Sj; Fri, 09 Jan 2026 11:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1198595;
 Fri, 09 Jan 2026 11:34:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fL6=7O=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1veAkx-0005Io-E3
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 11:34:15 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dafc9e5-ed4f-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 12:34:11 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7937.namprd03.prod.outlook.com (2603:10b6:303:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 11:34:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 11:34:07 +0000
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
X-Inumbo-ID: 1dafc9e5-ed4f-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnWr5zvdbQj6q+JBBELphB5gyyrDg0BZgbKWcB57j1ADGR0+X4cOlrInbGkCiRSOdJZvFI37SpFab9m8/dG97cp5xzgssx1W6HIEJvE4lkT8JhA+5+hzyiA6K8P94HY4wzfYIrSMZguPwLbKDxqj9PClc3/y1jVp1ydAsKkWqgSX0r0BJyCIBO0V7M86s3NZJRsYYNrnotTRdlA4SCve5y0Z4DdlrbTxpz8Rs6Zj7S5AShwLHiaaH96ALBtD1Elobq+KFdFXdjlzx0cAflop9J3fkPQwIVmx0cxVCOIO1KFBoaqJXU61rB7RMATHD2+Xu10bHOYwFaDIasKy6Tc0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYMZS1jSI7kWhIw2bjOJeE1P8/Xrc98hT2g4wcaNCMc=;
 b=YVVzKWIBi0VfH/sYPiHQN+YxmiBZjeGuDNy2oxroXDCn/SjxTmpuw48+Hr+OfuxXACagWvvL2euEu27Uq/K32+1sKDPqkOu2N+2A43nRGwTQklImiI0XAgbp20BKWJ+O857FHLMJljmFi8VkkhmZ5PVne0E+RrbOGEhTQynO112Ex5JObASEQsVcCqC9gKRCHc7aitaLl46CSHbu8nSeM+gi+w+dvAyRbX70oEkJ9vwWP0uNo9+3JAwoian+taucGaRZr1iXVEmt/ey/0oLCwlMNZnB+AWaNhaDYBcenzyUavCU7wQHAkx67jiWbnQwUC85nV+ihdbcolLj4cem3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYMZS1jSI7kWhIw2bjOJeE1P8/Xrc98hT2g4wcaNCMc=;
 b=XaRL76Gm4lA8gcqADkCOyWmYUtMxY0l2IsVIxCY0k64Ba00yzE7fTnxUj7NWIUhrJBSDcOz6VBDRw3gkgNf58C5RVm7qM2LxoTY5DDUwm0lXKYK6JtEq2BgkW7ozVWwJ9ozCxEZaQi4zm5soINJplxmbl20jFTbVJEaF4HwYW1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c64549ee-cd83-4e46-8754-ef99de1f2c9a@citrix.com>
Date: Fri, 9 Jan 2026 11:34:03 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] xen/mm: limit in-place scrubbing
To: Jan Beulich <jbeulich@suse.com>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <6b4c352b-f4fd-4b81-84ac-41b7d3e04f92@suse.com>
 <b6befa76-c80c-43d1-bda3-e60e1217fa80@citrix.com>
 <1c4592d7-6f3e-4c47-8678-ae47249deab0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1c4592d7-6f3e-4c47-8678-ae47249deab0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0014.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: cb049e2a-8269-4781-03de-08de4f73000f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2hEakJKaVltdDBGeWJDSnM1Nld5aTlCUlFLYjRCZDNOUkRZenBiRnhPS0FO?=
 =?utf-8?B?VUlNYWN2TGc1RUcwYlJrRXJkalBjTUhhb0txajc0YzVKd1NDeVVWTmhxNGw3?=
 =?utf-8?B?WHhSaU8wNjZhc3FwbjVpVzVQckZPcUREck5CemhpbEd3SE8xR2F2ckV0UDZE?=
 =?utf-8?B?Q0FoR3hCektxSzgwU1kyODhZVmxtK2VPTWdEYXdnU29mQjByeXI1WGtCWXpy?=
 =?utf-8?B?V3lZQ09yWUxNcVlKdHVoZWU1ZG9HVFI2NXpVWThQVGMvU0ZiU0o2Z200SFNu?=
 =?utf-8?B?OGtkUnVMSXBKNU5zL0FFcnd3aGRPWXh3Tm8wOHM4U3hyZlUvdWtiRmJ2S2t6?=
 =?utf-8?B?Q0Q0c3AzVmNjMTY3RWc1M2xCb0hTT25SZHJLK01HRlo3dzg4cmM4ZVhMNmZl?=
 =?utf-8?B?MEVKR2xFMFRRRVd2S2RLK1h5WEJDbldiZGNObUJ1ekJPNUIxcEpoVStKZXJP?=
 =?utf-8?B?SzF4Q2E3ZG94MjlDSE9JNWU3NzJ6Vi92dER3dFJFTUtVS2srdXgwdU4zT1RI?=
 =?utf-8?B?aVUzU3FURnZwQ2I1WVVBTmk2eEI4YXlTdDExQXd3eFY4ZjN1T1VGS3hveGZi?=
 =?utf-8?B?b1FyRmdlbWpRUldMQ2V3RTJCSTI0eUM1STlIa212MUhGbWtBeHczeDRTMCtR?=
 =?utf-8?B?bU9CZHIxM0c2MHBPbXpaNDhDSHFyQnBjbjcrVklBTEVXWTBSd1BhTnprUXNs?=
 =?utf-8?B?dUJMQ3hTRXJDTzNxNEh2cVlwQkVFdWx3em9aakFwc2NSU1NiVjNxWSttdXFV?=
 =?utf-8?B?TzJ1aXVtTnhvSUZXZ1Vscis4Z2dvZ2JjNWlDaTQyVVc1TEQwZmhzN1p4RGUw?=
 =?utf-8?B?b0c3cFJlWVY0VU9Nd2pKVGU5Rk9aM2dmUkp5ZlRWRjQ3Szh4NVJRdnJUNDRj?=
 =?utf-8?B?SGZRL3MxTGJVWGcvUFE3SmNZUXhFWUZNNWwza1BFaHVMbjNNSVFZcGoxWDZF?=
 =?utf-8?B?R2JjVXgzZ0kzd2JtS1VpQmt2UHd1QXBNYkpEaU5vcURWTm1sY29RTzcxckc2?=
 =?utf-8?B?MHZrclVnZ1NtSEhGaEd3ZkhLL1FiNFUrMXRiUzJ3NjljL0Q1NkZHaDl6T0FJ?=
 =?utf-8?B?eFNRS0o0eDNMMXlKNjZKcW5nZzU1eVFwQTJNSklXNVhqWktpZ2NHMTE3WVo1?=
 =?utf-8?B?OGRNK2FTRHY4eDZPZmU5ZVdoc2R1aHJncFZ5aWZCRXRiOXV2YTdJa1NxTkUw?=
 =?utf-8?B?cjJnbjdVT0VzR0pmUEdvaU9TT3I5N3Y4aVRQSnpXbXpEM3E5Z3QxcjdMMEVE?=
 =?utf-8?B?SWVTUTBhWEl5TW9GTE5yTlhiby8vQ1RlQVZMSFQ2RmFwRmxsanZkQUVCSFFt?=
 =?utf-8?B?VHB5N1FOZmNLWm1Yd3BqelBJRU5LWk43a2lHeFlkSTNxK0JYU3BYQnl1b2RX?=
 =?utf-8?B?cXA1TkpaWVZWcHRIK243WnJCZmc5ZnkzZU94SS90MW9DWHR1Y3h3Z0dGSXQv?=
 =?utf-8?B?QUg0VExKSG1tWkd3cEhEZjB6VHJYY2VLaXN6VDhJM2toTWlhZ3pXMmt5QkdJ?=
 =?utf-8?B?VlRkVEpxajFmbjZjaE10b2VEWkMzNERzOGxxVnl0RXR4SzZBNVZ5N3pVUzNM?=
 =?utf-8?B?UzhWdko3MWoxdVZOTHpOY1ZQWTVvWlNZOXQ5Wkx3Rmt6SXBnelBqTCtleUhN?=
 =?utf-8?B?SklqdUExUG9SMVZ2dFVURVh2dlRjOGtHY05MbFp1M1hOZ1NLb3FabWp4VlJ0?=
 =?utf-8?B?NEJUZUtEQWhqQWJuSUVubVZPYURkYlFmejYxUjQ3ZFhYN0ZGSitQc1ZMdmRi?=
 =?utf-8?B?WjdEaXJ3a2RQVGtQQVlKL2FLeGZnNUkvU1NQb1B3RjJ3eHVVbUpzaCtXL3Zw?=
 =?utf-8?B?aTdEdVJyQU1ad2EvK0FkeEFRSVg5aXNMdjJCYUl3V1JyT3BFNnliU0dIeXI0?=
 =?utf-8?B?WmlSRW5Eb1BEWkJCZG5PNUxkUVFhditySW1WVlZ6MExlMnJDNFFJQTU5WTdI?=
 =?utf-8?Q?xrlMXB+rNumpA/sK0b1dp+41yCfEFyb/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW8waXVwUWpGaXpSaVBlbEJSUnY3bTY4YjJZMVVDbXNoRExscEY2Q0FQNDFp?=
 =?utf-8?B?UEhMM3NVK1k3d2RqYUgzblNpNTBDVEV2cEZXZXVIVERQOVVDci8rbWJnUVU1?=
 =?utf-8?B?SE5ad1dBQjZyK1FPeUF0TndhcVVpaTRhb0k0eG5sWFkxVDB4bDB4WFI2ZXRE?=
 =?utf-8?B?dC9SUWR4bWVqY20zYmZFdUpnc0NQN2VPc0ozL2ZvZngza0hDSFBLenhlK1lW?=
 =?utf-8?B?WVlYN1RUYmlORHN4eWkvY1JVa09GUk5JNXNoeHBmV1NxSXNmZ2ZZTzdvcHhI?=
 =?utf-8?B?aWlObXRuQ2hmdTJ5bHFnMUlvNWtoQ3h1dmdlcjJ6Q0tVaVZ0MlA2KzY1dFhp?=
 =?utf-8?B?ek41NUY3ZktSbDdETE5HOENSd0czMExLZ3BSSEFZNHo1S3dISnlIVXd5aGRO?=
 =?utf-8?B?SnVWbHRpM0VrYStid0kvVG9zdlhKUTV2QmdETytrU1VsT3JmN1pweVA1ditJ?=
 =?utf-8?B?NTJ0MU42ZkxEMDZGR21FUlVkUjk2R0NnaGJVYlVqQm80WEpjdDV4VFhMVWtJ?=
 =?utf-8?B?aVJtUVJBdHdmMzhTWDNzVnZHd3lzdHd6OUhyaitPT0ZndGw1SlZQWUtUd0Vk?=
 =?utf-8?B?eUhZSy96NE91TXFlTk5tZWZyWE9qRVBwdTFZN29Vd1d4ZnBJYVNIemdHbnpp?=
 =?utf-8?B?MWVOb1VTKzB4dXBiODVkSmJpMUo3dUt1ejdoL2ZuNmZVVkJ3QlY0M3pjMGp1?=
 =?utf-8?B?OElGMjR3ZXdTZi9JOE1NeFU4K01JUW5aRDJKNWcwQVBMSkxsRFJpVzRoKzdw?=
 =?utf-8?B?ejdkNS9Rdml0Vk40Uno2Z2tDd2ZvUEZVQWZOMHUrcHh2L0JtRXA2cC9xRFVn?=
 =?utf-8?B?VG5RMHBCY0VpTzVpMDNhUW9UM0FoQ0IxWElhNndRM256TWI2QmNXVXlRYys2?=
 =?utf-8?B?R2FmWGJjZFdPMXJiZXl0T1lWQXdtZnoxc0E0MWVGaFVCUjlzNElEcWRFOUkr?=
 =?utf-8?B?bnBZNlFZQUxzdkxLYTNmSVA3VnYzU3pHK2N0Qm9PT0N6WFk0WEtlUTNMcmRB?=
 =?utf-8?B?a1k1TExuSkM4cEswc0dUTnlRVjdGSUpmeUFaazUwOXJlN2Z1Qno0RlJNQXpS?=
 =?utf-8?B?ajUvY1RzNXA1RWRMSlQ5NVJ5aG8zSnBCRlJYWVZCbjRkUmI4NHVueGRhSCs0?=
 =?utf-8?B?aVptYzdDWlpkQSt5U2dUQ1dmaXRCUjdhVlhZYjl0bG4yRGVxQUQ1eGpuYSs3?=
 =?utf-8?B?UmdmNHBObDBuYnhoS2xicTdNdHRvSHRoY1Z5dGNHVG0xaEpkNGZYNWl4RVQv?=
 =?utf-8?B?UkF4Zyt6THVzZU5yZStQQ3JnRkhmYnVXQXNRZ3UwUXhLRk9CSi92d2Z5VGdQ?=
 =?utf-8?B?MDJrZkw2MnZLRkJFSnlGdmhpOU5hd0Q1c2FXbGs2UnpPaWlrVkZsZGkrNXI5?=
 =?utf-8?B?b1VhL2RzZEQ0OWxmSXpmNlNpbmk3UTJVY1k1VFdmeDdDeDF2Wno1VDQwbEZz?=
 =?utf-8?B?TkZIMHpPZjMrZ2R2YjJGcmcxY1JyOXZYWEFoM2dVMG5iZGRPaWtKM1A1WUlp?=
 =?utf-8?B?MkZUMEZjOUpXRnhGTXRPU2p4dXNEaEpCb1ZEL09kdG5oMlZPS2NmcW9QSDJZ?=
 =?utf-8?B?dWVESHlFVVdwNE9EY3dveGZaSndjY3gvNlEwcFc3d1pyZk9rcUVaMmcwMFl6?=
 =?utf-8?B?eFMzdExVZ0NELzJiN1loVkRqV1ZJczBWVUZTYU5DdkVOR1h0SkdNenhTMUVl?=
 =?utf-8?B?cHRUK0pva0hYMHJXODBLa05MaEo4V0U2dFl6aWtSL3YzSFVFdkVjTmFNNDFx?=
 =?utf-8?B?VTRUelZ1RHpSM0VzYkFuek43YVFON3czZW9TREhBUkZSd1ZpRXQydUFsbFZQ?=
 =?utf-8?B?QmhiNWIvLytzdkhvL3lvc1J4QncwemdvNXZsSHVjNjFQcmdNdjIwU0RneDhK?=
 =?utf-8?B?cHhYMVR5NWtXc2o5M3BpM24ybG1EWVFFMXdhS0dmOTcreTVDTjI2Z2dkUTlt?=
 =?utf-8?B?ZUR1bWVUQ0pYdVZmeTFKSEtuRXYzWXRyT2t6TFQ2WTZOLzBCTXVKd0hYSlU4?=
 =?utf-8?B?VEREbEVPWWFONFNHcU15cmd0ckpPY1ovemFOT1Nqa0Vic3d0RkhOMDFqRGx4?=
 =?utf-8?B?bHdmU3VLQnU4UVV0cUhaNGk2b280R3RUV0tBbWgrQkhEZXYzeTQ5a3dJNDND?=
 =?utf-8?B?N2xGTEh1U292U0lxc0NpWm5rejQ1UzdDY3g3dmFtSHNNamo4WkRncXFsc2Fi?=
 =?utf-8?B?dk9ROFMvb0MzdzNVVU9FV0NVVjFNRiszWnlRQXpjakIwMGZ6NTlwei8veXNm?=
 =?utf-8?B?b1NGVjVtMTYzQVk1blZSMHJkbURmU0tleGZTNmFRK2VkSDR5ZHBSNG81NEhv?=
 =?utf-8?B?WXVTZTdLQTVJVWpQT1Q2SmZmS0dnNnRhd0Y5L1E3RFdIWklQK0FiOGxvUEpP?=
 =?utf-8?Q?8Rauqd8Ye7UEFJ2s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb049e2a-8269-4781-03de-08de4f73000f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:34:07.5522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOptvuum4rCjqCd5FWsa5t4UbPESeS4cNj7/WwCbYWO8M/yUvYzAgXrJZxaCpEECVgUGgmZeBuik9Hrn8eLd5v2+WnES+pDoh0PkMJo4k3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7937

On 09/01/2026 11:32 am, Jan Beulich wrote:
>>> Or is this when very many CPUs
>>> try to do the same in parallel?
>> The scenario is reboot of a VM when Xapi is doing NUMA placement using
>> per-node claims.
>>
>> In this case, even with sufficient scrubbed RAM on other nodes, you need
>> to take from the node you claimed on which might need scrubbing.
> Much like if there was an exact-node request without involving claims.
>
>> The underlying problem is the need to do a long running operation in a
>> context where you cannot continue, and cannot (reasonably) fail.
> Right.

Yeah - I think this is a scenario that could happen without NUMA
aspects, if the system is almost full.  I suspect we've just made it
easier to hit, or we've got better testing.  Hard to say.

~Andrew

