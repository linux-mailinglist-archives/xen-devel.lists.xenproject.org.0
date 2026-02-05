Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMB0FXCkhGmI3wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:08:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9432F3C9E
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222005.1530087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo02C-0004RX-AW; Thu, 05 Feb 2026 14:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222005.1530087; Thu, 05 Feb 2026 14:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo02C-0004Pn-7F; Thu, 05 Feb 2026 14:08:40 +0000
Received: by outflank-mailman (input) for mailman id 1222005;
 Thu, 05 Feb 2026 14:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqXU=AJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vo02A-00046Y-Pd
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 14:08:38 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a242d1d-029c-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 15:08:38 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS1PR03MB7823.namprd03.prod.outlook.com (2603:10b6:8:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 14:08:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:08:32 +0000
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
X-Inumbo-ID: 2a242d1d-029c-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbPvlR6uQmWHlWmMFJvXoZM2Z6rn6cUUGgk5kXlkGWmu0Ys8RBZQ7IViI0Z/OEExezim7UVvEw5JTKlp7BGElEmSffPYvBcKCd/9778Ae4sZoUuXpyinppwfQqTvOqphLsSi4LstmXy2irN7zZqDlp1WZSs+NOHs02fSlI0ZMmYYTE9Aqskr62lK8t5fjk4mXfI4iKLNAaM9YHM98OWYvElwzji6C5u8n0h4jC6G3L8KfU3bFcMS66ECpV46LBEfB6o+mVaGQsVS2YZX626zVz3kNX9Q+nERVahCYTTz5zsS6Mz7ALdn+otDuZxUpu4I7i/tPDhN7YNpn+kyqme5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEScy6YTAF/WDEzKaM9B99PZ3QvZ8ya0NLitb9w4QPU=;
 b=vsDQFyXaGS/Z1s+OJoJXzxX+6OqnvKX6tRJrTzNBMiz0mK7j/jS0gu+SaX6Hw7yyJh4zzt2fFzTINqtElXL3WaajIFijZd6UU4PJohQH6bJKoPuSxEl4xP+BmIcGlRCadGdgB6/CoyTXJowPWkFhw/7paHiBIXJncqhetLjoT0kgdr6tqCdYzuVG4sjUOfjiybLtV/hBi/g/mLbMIFSpxemprN70whqG02yabafW9DfkFRgUnjHy85lQS2f+L4Jnruje61Oiwe1JfGnS38ZFm929c1r3xt/v2dn9eD10xCW5Q7eRcf+ibnCfsuELxr5LTMy+mvRVccOmGZCAgD3PXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEScy6YTAF/WDEzKaM9B99PZ3QvZ8ya0NLitb9w4QPU=;
 b=F0T7Cujya5fqxABHwX1gjpav8LAZVGMXhbnLNuQoMip9uC9uBTyhlixIOHitdIzPcWLlg1TVzT/n21pxTNCcnrIRZZEW0rk/+xpJHANR5cfcBvy7lv99krAQ1H5llC7yvESCkyBTuL3i64s26tIDLSV+HuNXMLDPwJ0TULbT4+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Feb 2026 15:08:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYSkXX9TDoY0KUNz@Mac.lan>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com>
 <aYNdJ6sb4GPaSEyY@Mac.lan>
 <3f9b4337-3e0a-4693-b97f-46505bc1349a@suse.com>
 <aYN30KD0jsJ2_H_z@Mac.lan>
 <5bd55bef-f30c-475d-9831-382406f699fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bd55bef-f30c-475d-9831-382406f699fb@suse.com>
X-ClientProxiedBy: MR1P264CA0211.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS1PR03MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 267c0a47-25f6-42a6-6c57-08de64c00b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXZSbkp5aWJJVnZKamZGK3N0QVRST3VQYjFVd2wvU1RvaHJ5N0U2R2JMeHd2?=
 =?utf-8?B?amx0UFJ1UjRwNE5VS3NsVTZiTnhtVEU5QmgrWVNsNlhXMWg5RjFmY1lNWGZV?=
 =?utf-8?B?NVEwL1p6V04zVnJrUkRsTk1rLzM0K3VJblRPQ3R1MkZtWU4rT0dsbWRndURx?=
 =?utf-8?B?dnFyc0d4NjBDTjFjV3gzbitENEtQYzRVNDUvb21BcEU5dlhrMEVDSFUxSVE2?=
 =?utf-8?B?Mk5Jam5INHlCNUIwSUVjeVhVa25VRURUUmtnQldHaW9tOTAvYW52UlFzcXpH?=
 =?utf-8?B?VURQWGpzWE53dGlIeHI5bEtJeFFSaWszZWJGYm96YlA5WTFJemgzZjhRUkdY?=
 =?utf-8?B?WWEzWmljVmJpeVdNSFN5TlFtMEVFcWlBMm9qbElIRXJ0QmlGUXZHNS9oNk1Z?=
 =?utf-8?B?YzFWNG9HZ0NqN1hCeW9LUmZMM25TakNFdzBxSHBNajFxUjMxMlIybjB3TWlv?=
 =?utf-8?B?K1dpd2VEUmc1WlU0VmxWZmpaRXlqdmsrOForVDN2aEJpbnNhMW9SZjdrdEty?=
 =?utf-8?B?VXUxSjk2SVJOQ1lZbmtBd3U4U0tUbm9kZHM0cklyc3p2MnpXS1pNU2JGUVVE?=
 =?utf-8?B?UTJEN3JBb25DSHhOQmtDSVkzd2pocEtvTFh3MElPOCtEWERDWFMwczRoNEpO?=
 =?utf-8?B?YmhFU3M1dDlnOHRtcHE1SWlOelJGMStJN0JYSW8xTFI0RmdaSFdWb1FsSzhY?=
 =?utf-8?B?am1XMUVHSmVrT3pQRHkyaTJmQVBVYy94S1FKZ2Nab1d1S1MvMEZuYVZxTVpD?=
 =?utf-8?B?cTlYVHEwRFJGd3ZEeG9CZ0tCa1ZkaFZ6aW9oYzdYdmVneGJYS1F0dUdLUC9o?=
 =?utf-8?B?Z3I5Mlk2d1R0MjlnOVBDMml0T3dYSHppdW9QTnNpVEZaU1BMSmtzRHdPSk9G?=
 =?utf-8?B?N2RHNzNTbDhrekh6NHpWTENSRjRaeit4MTdBUjN5NmJQUVBxaVdPeGRVcnc1?=
 =?utf-8?B?Si90UGcrSThRWUlEN3NwSUxkcGtCV05lbWNNNXdXR1VCTjRPRGdlQzFaUDFC?=
 =?utf-8?B?dHd6Wmx0QUY2cGJpZ0RBVXBGQVVSaEQ3TmlicUtPdmcwNU9FbWpjNDgvNzUy?=
 =?utf-8?B?dDhVMjAxUU10NkRnS0ZRdnIyWjJXbWhWdzNjUGpoRmRnWDFSUUxIcnp4QXJE?=
 =?utf-8?B?VE9yQVdRcnRIQkxTTjVXSFlYNy84VzROaENDdjRFeFlkTTQ0cUo2WmxvMDBQ?=
 =?utf-8?B?Y0lZYjBzMlcxbVMrTWFPWURnR2RjYk9DZUNsTFhXWnE0VlhZbHFXemk3TXg3?=
 =?utf-8?B?SWpZRGlocUN6ck0xMTRQQ24wdzZDMklnYTNSNklnM1o5NVRkY0l2YllYS09G?=
 =?utf-8?B?R1FhY3JOeHUvVzhMMkFzWlFlaWx0d1gxcjdYRDhYNE9rcG8xZWNpek9LczBE?=
 =?utf-8?B?RS9sNllaQTRXcUFMcjlzR3RkT0t5MDJCV0VVYlZxZUlyQVVmM2xKanIvUGha?=
 =?utf-8?B?LzZQZ0VhL1ZkMFkwSDFuNTN3YWgxK2FiR1hmcGxaWWRGNjhTN0ZMMitQVGg5?=
 =?utf-8?B?bzBIUThpK3VEVk5aYU5OZVZsMmdOMlhuR2ZhWERiSzFkSUJZVXh2MW5Ld2tm?=
 =?utf-8?B?d3ByL255MVJqSjJIMFNYM3YvOW1JTm1SRHlBVGUzbkJrNFFiMFp1anl1SjIy?=
 =?utf-8?B?bk85VC90c3VqcjRocjNMZ1NLYnhwOVE4d1NrZXZhbFJJMlVSMzViay9UcUFL?=
 =?utf-8?B?cklab0lmQW9KeUdiRzlHMHhDQWVzdHFSSVpTQXF0TWo1ajg4cmJMQ1FUYVlr?=
 =?utf-8?B?ZnQrRFJnZW13OTlwdUdpRVJzeTcvelQvUk9NcXdjRk8zUklBMGdkTTQ4TTZP?=
 =?utf-8?B?Z1N5NEhWdSs5VzRDMTJQbWxlSWRyM3AreFFwaTBSNHpuOHFGS3FLTkpaRml5?=
 =?utf-8?B?eVpEMHp4SU1Vc2QyU1h5d0I4VXBCbThpV2lxUDhRcFlMRGI0NEN3SUFEVG9C?=
 =?utf-8?B?SmFiZ0hSTjZOUUhXZnI5bVJaQjBMczhXL1ZYZm5HcGJ0VFhseUpZNVRCUXEz?=
 =?utf-8?B?eE8vdW9ObmJHOVYwRXJEU2JxMjF6WGlSaEwwbEhjM0NjcjVUU3dBUHQ1b2Z4?=
 =?utf-8?B?OXZxYkJzWDNXTjJhaXZwT0NYMnM5UG5pS2V4QWRoZjJwRkJocWwyeDRaczAv?=
 =?utf-8?Q?Pyo8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em8wUGgxNkVCK3pHaGVxUXF2Vzh3WU1vbkt0dDNXbTE4dTFtYUxoR09WVWgv?=
 =?utf-8?B?K0sxT3RnT2dRdGdFNFB3czRiT1pCOVJ5cWpDWG1kTnlIWU8yR0JFdktURElu?=
 =?utf-8?B?aFRsNGNid1RqbE5IUW4zZExocVVISVJxRGllQTdyVnduUDg5TmtrTlJJQ29P?=
 =?utf-8?B?bG5UOVFDOW4wanhNbzQrNmY3WmV6K1FoTklleHBFaktKRUx4aGp6eEJURWVy?=
 =?utf-8?B?MXFkTU5WMytmWWUvNXc0LzJ6Vi84NnM5SGloWjlGSlMwR2RqZ3FrRWNGZXVz?=
 =?utf-8?B?Y1RxMjdPdGdSWkdVd0Zaa2VwQ0xCeHcxSUVZQWFzQUdTWmYzMU15a2VheTNN?=
 =?utf-8?B?UWE1RlJXcTVndFJjNTAyMjNnRk1BaHYwczUrU0ZVYnl5UGtjMHl5STNVVDQr?=
 =?utf-8?B?VnpaVFByekh5ZXN5SWE3YlZ2Q3JIZENiemVYcUYrMStrbnNzSWdZbEZMaEQ0?=
 =?utf-8?B?WjJwbWpTU3dWMW56UjFHN2txOXNJK3NsbXVhR3JvYUNyMWR0dXhvM29HMG5n?=
 =?utf-8?B?Qkx0MGlJb0FROG9FN0d1c3h4SmJOOGxNOVZMMzJNUkNiVVZzVjFOUkp0aTdn?=
 =?utf-8?B?NnJGVmIvQXEzOW02d0dTUVJRRnM0Z1M1TU9RdlpLUHVzMjA5NG9QdDQ3bHhv?=
 =?utf-8?B?bDZoeWl0dUcyZmZyZ0krRDY3NmZCU2dzVmZUYXhtS1ZtTU8rNG04ZmhiSFNo?=
 =?utf-8?B?SHl4b3BqWnNVM08waEVpak8xVXJhR2F0YVh1a0YraGF0cDVCdk9UaVVEL25F?=
 =?utf-8?B?OVhhSkJwbm9RMVQxbitHMG5sWUxYT1VpWlVlMlJJSDdhS2lCYjJXbi9Qd2k2?=
 =?utf-8?B?MGw3MzIxK0RSTm1wai8wcERRMndoc3N4MFhqUVA2akY5SDlYblNWNXNrQ21y?=
 =?utf-8?B?bnYwclU0bktVWmlMT1ZsRnJZbzF1RzgxNFFvd0lueDhsNzlVUWRrdFg1S21H?=
 =?utf-8?B?SDZtdlRTb0V2ZUhzc1ZPQTRIclU0R2FUM2hZUHNVSDRrTUd5eEFRTFFLMGND?=
 =?utf-8?B?K3BvZ1JHTFQ2blkwWDMxZTFMYzlmNVl5Y1RlaGJ1RXBCTVhoQW5QTmRNOEZY?=
 =?utf-8?B?a2JyVEJlSnZmY0pWOFh1ZmkwUXpTNm9jcHlzakFLeXVSOUNLMTl4d0tMOGs1?=
 =?utf-8?B?UjlDcGR1NklkeXZLTmtjeEl1T3pGTWQ4MmVXeHRqdCtWRmZRQUR1bElyZ2tO?=
 =?utf-8?B?c25vL2hpaE9kYmJ1cExDK0o2ZXlXaEdjVjVqajQySlJiNUpEYVM0Z0xQcU96?=
 =?utf-8?B?N3AreU1SckxuMlliZzNGMG0weVJXYVFuc0RVVUJWaG1CeDR6cUhSVSsyNmsx?=
 =?utf-8?B?ZmtXa3Rka1lrTk1oOHRtaUozUnRHZ21ublhrMEZmdUQ2WENuWHpEcU5zZTB3?=
 =?utf-8?B?bWFWTnVmRG13RnVNR3lYanZKM25CSVB0ei9SMldDWnR4SEpJVi8yTlQwU2E0?=
 =?utf-8?B?YW9HeXltUVFFcjd6WkVEMklRRkV2UGxteUl0NUl5Q1FtcDVWZXFhalQxeExU?=
 =?utf-8?B?M29wS2FvWjc1cHBJekgyRXlWMlk4ZXVhQ25jT29zQmo1elBBK1dsMWNqQlkw?=
 =?utf-8?B?Q3ZNTnM4VEFEMGh4aWltZEcxUUtrVmlaMDBrb29sbUYvSlF4b2UxTGtCa2xp?=
 =?utf-8?B?cDBiazRmVjl5T0daTW0rNHBIUjErS0ZIc282dEszRmF1YWI2VkM0cGU1ZEd6?=
 =?utf-8?B?Yi9ReEtPWXdMVTRZdFZFT3RsV1U4SHNVaEtlcEgrNEVhaUtMVHNSTnY5OUYz?=
 =?utf-8?B?eWd2MHg0UnZ6ejdFTitZS3JWeDdqZXVFOUEzVFd3OWY3Qlpoc2lHWkltcHNL?=
 =?utf-8?B?RXE0SHAxK0hmTkJMSS9FbmlsYms1bCtIWXVacWNOdjBPREpITi9vaHJISnQ0?=
 =?utf-8?B?TTVkUGc2SGloc054b3hhSFFBb0ZhdUNxWkdZU0FhQzBGZk5OcjlGNndhVUlE?=
 =?utf-8?B?MHhQTlBjSG5IV29BZnN5Q1RQUUkzOWpORHc3cC9uUkRSMEQrNFlQMENzMWFG?=
 =?utf-8?B?VW80Z1hZYWwvYnNqL0I3SzJyUEZ2aWM2RWhtV0RVM3VZTG4zcC9HclRVeXAw?=
 =?utf-8?B?VFprV2hMdXo2NWd2TXY2UHdaZlU0ejlGb253VHgwZnZuMVZYemhqZWZPaE1Z?=
 =?utf-8?B?Wnl3YXBPSmZ0SndqVi8xNVRWWE91ZkpZSWkzOG1SN1greENraVIxd0Zhd2ho?=
 =?utf-8?B?bklWNUh4VjVTVSszUHN2blo0YjlFbkFMdjNjMXJnZEdXNXlrT1pZSFJHb3lL?=
 =?utf-8?B?dVRzUFpxTGpreGc1ck0ybzJBbW52a0s0dFZPenBPbUxXdkFIcTFzYXVjUmt6?=
 =?utf-8?B?bmFpMit1Mm9wUTBhQ01UU0J2ZTdkbGhIZDhSdXFnbmRkc1R6ejVqQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267c0a47-25f6-42a6-6c57-08de64c00b8c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:08:32.5964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5of4crkI9ht8DpVNYIat8H7NHNTTGURYl9O8BmaGdSdShL76eOOJWloMK0O/Fo6VsTCkZ12amzs/jd1+TrHbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7823
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B9432F3C9E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 09:29:53AM +0100, Jan Beulich wrote:
> On 04.02.2026 17:46, Roger Pau Monné wrote:
> > On Wed, Feb 04, 2026 at 04:08:21PM +0100, Jan Beulich wrote:
> >> On 04.02.2026 15:52, Roger Pau Monné wrote:
> >>> On Wed, Feb 04, 2026 at 03:06:52PM +0100, Jan Beulich wrote:
> >>>> On 04.02.2026 13:25, Roger Pau Monne wrote:
> >>>>> The limitation of shared_info being allocated below 4G to fit in the
> >>>>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> >>>>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
> >>>>>
> >>>>> Drop the restriction in arch_domain_create() and instead free and
> >>>>> re-allocate the page from memory below 4G if needed in switch_compat(),
> >>>>> when the guest is set to run in 32bit PV mode.
> >>>>>
> >>>>> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> >>>>
> >>>> The tag is here because there is the (largely theoretical?) possibility for
> >>>> a system to have no memory at all left below 4Gb, in which case creation of
> >>>> a PV64 or non-shadow HVM guest would needlessly fail?
> >>>
> >>> It's kid of an issue we discovered when using strict domain NUMA node
> >>> placement.  At that point the toolstack would exhaust all memory on
> >>> node 0 and by doing that inadvertently consume all memory below 4G.
> >>
> >> Right, and hence also my "memory: arrange to conserve on DMA reservation",
> >> where I'm still fighting with myself as to what to do with the comments you
> >> gave there.
> > 
> > Better fighting with yourself rather than fighting with me I guess ;).
> > 
> > That change would be controversial with what we currently do on
> > XenServer, because we don't (yet) special case the memory below 4G to
> > not account for it in the per node free amount of memory.
> > 
> > What would happen when you append the MEMF_no_dma flag as proposed in
> > your commit, but the caller is also passing MEMF_exact_node with
> > target node 0?  AFAICT the allocation would still refuse to use the
> > low 4G pool.
> 
> Yes, DMA-ability is intended to take higher priority than exact-node
> requests. Another node would then need choosing by the toolstack.
> 
> > Also, your commit should also be expanded to avoid staking claims that
> > would drain the DMA pool, as then populate_physmap() won't be able to
> > allocate from there?
> 
> Except that upstream claims aren't node-specific, yet, so could be
> fulfilled my taking memory from other nodes?

That's likely to change at some point, but yes, they are not node
specific yet.

> Aiui the problem would
> only occur if that DAM-able memory was the only memory left in the
> system.

Indeed, in that scenario toolstack will be allowed to make claims that
cover that DMA memory, yet populate physmap won't be able to consume
those claims.

I think there are two item that need to be done for us to append
MEMF_no_dma to populate physmap allocations:

 * DMA memory is not reachable by claims.
 * DMA memory must be reported to the toolstack, so it can account for
   it separately from free memory.

Last point could also be solved by subtracting the DMA memory from the
`free_pages` value returned to the toolstack.

Thanks, Roger.

