Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE2vMAW0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50156481B6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209155.1521268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDjM-0001Z7-Qs; Tue, 20 Jan 2026 15:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209155.1521268; Tue, 20 Jan 2026 15:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDjM-0001Xg-O8; Tue, 20 Jan 2026 15:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1209155;
 Tue, 20 Jan 2026 15:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viDjL-0001Xa-5i
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:33:19 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 578db704-f615-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 16:33:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7058.namprd03.prod.outlook.com (2603:10b6:806:353::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:33:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Tue, 20 Jan 2026
 15:33:10 +0000
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
X-Inumbo-ID: 578db704-f615-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=achTzX66ko6AXWtAetp9orG8EnuuGZmRZsWhN9naL6ZX9wH52aPnhLfAioF29V2qt5w4pS6YzVknA5nPBxVshNVAil6EwNcQa0DC7ewQswNP9d9UWCXQSCVpF2xZNIFE1LO78lU0aMpunAffDcSckwtpZS0OyDATIYZKgDcwz74rZluxeUlHs6ktubJnJqdoBo0qlwmsXeiltfR8/UTDWjsGvtiFkdeo0tF17kIvktK1JoJL2SCAuzOm1F0DEhkVusxseastOmPFZmktEsE5MwxSqEGL3XGaTwVxIO7ojyCZdXx4/nkdHXOWlH6ovJpfFZ9ZQyrtGDq4dA0GvzSK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dy496zTH/Lr4IN5cUi/7GmFfoC/qmaNauHa9lWQdFw0=;
 b=phWZQY3SPcqi/iuz7yWSFiLwEcMqYBmACsQGsg3/se6w2VtV4liS0gvc2p+FBzCYMsbJldIVOY3NKfYRxWVgBKaASeNI6DTK5tsSAtuwZONAO8FVDcxEop9JfArgbPnRnAO/U2ygFMQd8+qyHFc3JYOEaWikJgC469ei5gjtWmmw/aMykaiDAH2KEVWrPF/2vs7gY/almFR+VG40s+SNEP3HcxB33WQYqdOfk/jZ2qAvAh7GOpkwwK7EWJ0i/BPtD+8oJTL61HiLQj65z1RvivnJnQtIAr2G7JV17KV1tgHyRQuhLd07kyxEJzvHw521AdxmYZj0JKWPrFQha9qWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dy496zTH/Lr4IN5cUi/7GmFfoC/qmaNauHa9lWQdFw0=;
 b=eKPhrHT7zImeIkg60+RP7GPOhEDCDWshKT3BY+r3WvZ3WkIsW6HIdFr7EqU9X+X0dBFvzv4D3E309Ediea5DtnDTWrSS37HbqOASLHBOtg4HLCLNVSE9G90xswx+3nRlLEuR2SjigO9JdVAb64GCnwuTfGWwOsE9xyUEMizKb3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 20 Jan 2026 16:33:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aW-gM1wyZSL7X23y@Mac.lan>
References: <20260120140648.25977-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120140648.25977-1-roger.pau@citrix.com>
X-ClientProxiedBy: MR1P264CA0218.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: d0295c90-99ac-4517-294d-08de583937d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sy9ZUHJNS1FreVRUbFJ5Q3JiQmtHUHRNekFJTUFxQWVBR21Ga2ZXVFNVRXBi?=
 =?utf-8?B?SSs0aEdFcHhQeXQwUU9talhReHZ0dmZsbWNlSnVFNGRXUHAzQmpDaUVUMGpE?=
 =?utf-8?B?MW9JbFVDZG9EYkthK0hQMzU4ZVB0ZUIrR1pGcFR2ejVjR1BMUTQ4U09qNE0z?=
 =?utf-8?B?bW9PWjVpRHhLY2N1Qm5nVjFUL0tKaUtsckxHZS9oYnRHQTZZbkNtbUJzb1pT?=
 =?utf-8?B?SGFQVlo1UkFoa0xGVWh3U1E1K216UnZyYXREazVpYmIvb1VDdEJFNkFVMkdG?=
 =?utf-8?B?S1dEYTl6bGlsRldpeDdPN2VBOC9iN0JMbkZoKy9qRHdBbnpPMmhCT3I2QWVm?=
 =?utf-8?B?Q3E1UTJsOC90aXFtS29HaGYwbVFFRVErS0JSTU4yT2FkOTRJK2IwellwVXRK?=
 =?utf-8?B?RXY3cWM4Y1AxdnVqbHdjZDdNdEZ0R3hzeTNlazdkM0ZvSkhFamVqaXNpdlBo?=
 =?utf-8?B?WC9CY2NTSTlCdWY2VE13NTdONGF4U3gxR1RaWHR2VVRFMVpHRFBweHdRMDdz?=
 =?utf-8?B?dFlxUENmNVFjM2hyR1NvNmp2a201cjJtMTJrdU16VXRIM0RsZEtFVXBUWUlL?=
 =?utf-8?B?RXFmWFFIMDFxVmRwb1pIaUxIa09lUmdIUTlxUExLOWdIdVNHdFA4VmNPQnlw?=
 =?utf-8?B?enRPdVhja2ZzMUdUM1JvYkV5LzFsb0hoT3JlQ0lVYXdOR2FCdGd5eUdhSm1F?=
 =?utf-8?B?NjJPdmUvaTRNUlh5VldNSXJ4STI1Nk1HOFRyTXNhcnJXQVRybW5BejVBN0VC?=
 =?utf-8?B?YWEwNkw5Szk0STlTQ1JzcGl5QkNCRFo4YTk3cVM3dk5DUmZDbTZDK1VPQWpP?=
 =?utf-8?B?RlVlTUVvbitoSkRzUE80NGFyQzZheHhpRWhnRjh3U3ZDb2kwWndOUVBISlFR?=
 =?utf-8?B?aDM4aXMrMExoMDZPNTYvZ1gyNjdqdFYreU94RDBWZk9YU0ZWd0dXb2ZySGZw?=
 =?utf-8?B?RUFyU0VXdFVTL1ZYK3lsYXRSb1dSeWZnSFZRdEtjUkpZM0FteENaV054Skg2?=
 =?utf-8?B?L3RVNUVEbzJQMWtSQ1M0QTdNUFlkMjJaZVVOdUJmd0MwbG1qZmxxSEtkOGoz?=
 =?utf-8?B?MkRUeUx4YTh2UmRtZGgrQm9MT0N0bVhNMjVOMEtvVVJsUzFpU1hBRDcwL0pI?=
 =?utf-8?B?Z21jU1hJZndVVnI4SXd5L0xiS1V5cVdzb01Uc2pMKzhPYnFkSDFhNVYrL3hn?=
 =?utf-8?B?VWFPY0pCbzlVRFR5K3R4ODg1aURmcVF6YkhUNGRoZm9LR3hzanRRVHFHMjI5?=
 =?utf-8?B?N294NXFlRDcxZkpTcDFzZnltV3hBUE5SZmZnNGZEamJGTndWamFmRXRpL3ZQ?=
 =?utf-8?B?VVNpS1F1b0hNTnIvTm5adng1cW9sV1U3MlNWUXI0VDkzNW5QbmRyYXlBOWh6?=
 =?utf-8?B?UFFlWXpwNENrUDNhU0JuL2JsNWhsVDNCOHNDTElwZlF5bmVxM0FGVHRmMFRw?=
 =?utf-8?B?STh0RkxpeEhSekdkNG5yaVJlQ0xEdjFGZHdVSlRUU1NlbHY4UlZsSmhPUTVL?=
 =?utf-8?B?QXdiTjZsSEhIMzNOc2lJZ3hST3pHUVpoRjdJVFJ0cW5JdlN3a3JDaXdTOXNC?=
 =?utf-8?B?c0srejBFNXo1NktoaHdGL0NZQktTVlZqNFE2aG8ycGxlR0FHZnBFeklXUHRC?=
 =?utf-8?B?WGtaeXZUc0hjWk5JSGszZk9nTFExODlDYnhOSXM2dEZDY3Ixdk1SWjJ0RWVw?=
 =?utf-8?B?eGFGaU9FTHhxNHZ6VHMvK2l2Q3Bhakt4QW5OYzUzVXUrSTFLZFJkQVZnS2Er?=
 =?utf-8?B?ZXNUamt0aUlhY2VNR1NoYW5kcHRZYlVmT3pkRjdxbnZxOStSZ01DbUdrTWt5?=
 =?utf-8?B?dS90VU95V0FXc3pDZFpoR3JuV0dtOFkrK3dPUlRYL2NEV09jUXp3NTdIbVVL?=
 =?utf-8?B?RTVqZjFLTDdBVGNmeFdXWitpNjN5aVdUMGR5MGRFOWFPRXZZcW40dVA3TzNV?=
 =?utf-8?B?cjlrL1FLbDlrUGxsY2Y1UC9IYUpwcVQ4M3gySU1GVmNnNnY4bU96VHlMRnZq?=
 =?utf-8?B?Z0wrMmc5b1hMakVrTWgrYkFYNzJHMjFwekVvQjV3ckNkMUl3NnJlb3c3a1pX?=
 =?utf-8?B?dUVMd3I0TTdsUEdoaDBDWS9SL0Q5TnRIaTN6VFRYRHlqSmIwYmhwcEI4Zk9L?=
 =?utf-8?Q?P4g4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTY2OU0xcnUzOWh3WWkwMkRiSGF5TGFqYjZRWW4xbUFqTHhNYVJCeEdaZWZR?=
 =?utf-8?B?VmsrcCtvdk5nUkR1Y0lTamFJWUlIaUpOOGtKeUtmVU1XejJobnVnaTZ4b3l5?=
 =?utf-8?B?dkJqODFzV2Y0QnNwdGpycE5sOWwzK1laQTArMmlzcDFqT09JUjdFRkZUcEFi?=
 =?utf-8?B?MWIvT3R5S0pzTFVxd3NFOEl1aUNGUGpsdE9JTFByWVNjWXZLeVZkeUp4RGxW?=
 =?utf-8?B?eWgxN29heDdUMTZicURaVTlMdWNkbFdlL054SzB2eEx1Wld3QURMWXJLbHZV?=
 =?utf-8?B?bHpyRHJQYVRtc3RlU2NjRGhYS2htWVMzWTNUa2tyQzlLZFlrSUhYcktINHFT?=
 =?utf-8?B?ZzJLK2hXRDFqYjhlR0txVVNHM05RQ1RoQ1hKMUZKZHVEUTVwdEJiM3p3MEFy?=
 =?utf-8?B?UHRJb2dhS0tKV1J0THBDY3ZWdmJ2UHlzNnZlakt5WU5BWjRaVnBXaGFWdE4x?=
 =?utf-8?B?elZ1Z2R6d1BGaW5vUmorQXVyQ1ZNaWtMT1o5aU1tazFKNiswK2F4Um04c3Nu?=
 =?utf-8?B?aGlTS2pZQWxGU1lpMk9UMDdlN2xQRURYZXBEY0paelhJU2xIRU4zalRoL010?=
 =?utf-8?B?bHdwajMxbVhwOU10d2hWTkpDdFVVenR6Tksvckw1cnBXNnBVYUpZQU9IenVE?=
 =?utf-8?B?NjJ3dThmc3RWYk55bU9HR3RmUXlvZWxrSlNFcXJEb2tZTlB1SnFXOGRYTXJU?=
 =?utf-8?B?WTlsNURDY1hldTF4UWFGcmo3ZDJ1d0JoTVJhQjBUaURRUEhNUkNObmhDQXc0?=
 =?utf-8?B?a2UrQ25KK1ErOThtV3F1cTlESTlySUNDa01TaER2c2lFdWVuVkNmNWwrYmNZ?=
 =?utf-8?B?dTBMMld3eUJleTFXWWJBRTlXY016SE51bFczcTExSVA0cllGd3NlemNmYUYx?=
 =?utf-8?B?MW1HTTl5TC9ESzhQQTFNYlNNeG05Mkt2OWtSN2NvcGdyL2JoRVhwVmJLZXpl?=
 =?utf-8?B?NS9MK3RYR1ZYOUg4RmpqZHJqbGN1K0xtUnMrUG1HMFpwSk5UcjVOd2hBd3Ns?=
 =?utf-8?B?bXVONmY2dm5iQTdmbk93Vk9XZVJneWxIbEI4RnZ6Yzg4aTJub0JlTWtYVzJU?=
 =?utf-8?B?dW5iMlVvR2JqblREVkt5SmJKK1ptVGRJZzZRYSt3OWlDd0E2TWNzci9jSVFN?=
 =?utf-8?B?a2hlYUJrMENQTUVFN2xzOU05WndBTDlRU0tpc043aHFkL3JLZlZuOW82VE5K?=
 =?utf-8?B?VDJBT2E1L0RaeDhkbmgvTVZXVXpDS2kzYW1Sc2Q3Y2gxeHJMVVBxcjZEUTRP?=
 =?utf-8?B?U2pqQjM1dVJYdTBXVko2UEVzTnVYY2Z4VjJaNUJIdnN2L0Exb2RIOFpzNnBm?=
 =?utf-8?B?ZGtaNWxJN1UvYXRkRVQwVStQWUV3VFdMMHJ3Z20xYzRzM3dabGU3Y21XZHBH?=
 =?utf-8?B?aTFXbS9WYkQ0QjJ2cEY5dFNoMFBMUmhaZS9Ldmwxa1kyYkgvcmtNYmRBc2xa?=
 =?utf-8?B?WVk0ZndzMjBvcE8rUnk1Zzgxc3BLc2Z3elJDM2hrSjl0WUlxMVNscjczcDV2?=
 =?utf-8?B?STJHdm16UnA0dmpJc3ZzRFNsbjE4WjJldmJtWXBNREtyWGI0cTd2ZFFXQU1M?=
 =?utf-8?B?SDRBQVJISU53cW1wczR5WnNjWXU1Um1VdGxra3VzWmpUZTlsVzI3dmFhMTVx?=
 =?utf-8?B?WnBQZGNEUVR5TnM0ajA4Z1FWUUdwQzRGLzZoS2huQVRzMmVPUVgySHBvU1B3?=
 =?utf-8?B?VWhsSFlWSjVpT0VEWEF2N243dGJlMEQ0K2d6SWsveEZPT1psbWRuZkhxbVNz?=
 =?utf-8?B?SVNMTXBWRlZYR25zU3ZwVjNYbDFkZHErMGxVc0IyMloyMlV5V3o3b2RPay93?=
 =?utf-8?B?LzVXL1ZqZWNTWkxoZERKRGVQZzZ6T3dVT2JGVHcreGJTR2FxbjJlaS9WRFNQ?=
 =?utf-8?B?QWxwLzJCb0dXU2RMczNjZG9QWFZFaFB5OVBFbHpOUyttWWZxcXBTVk00QVdu?=
 =?utf-8?B?dS9SbThXV2ZkOGdSUHg1UDZUdjMvdXM1TGlpajNMbjBZZmhuYWhBL3RzcmlX?=
 =?utf-8?B?L1VYMVk3c2ZZNHBHRVZsNVR5V3RkbUZld25ORFowMlFZZXZpazBKUUdOc3Ji?=
 =?utf-8?B?TGZjaENWNEk4Zi9zK1hPcXJJU1BXQ3VPVitwTFl3aldZRTFkWGlsTmt6RWtH?=
 =?utf-8?B?ZlREOFJXMWU2Y3VQcDBnNXMyTEtkcllVaTk4V3Z5OGRqWVJXM2czQlNPVG9w?=
 =?utf-8?B?bE4vaG1pQmhzbTYxekM5UDZNRlZmQ01uRk10LzF2NkZqSU9KNERneFZ2RFMv?=
 =?utf-8?B?WmxkbHAzUEdBalc4eWlGM3dzNHBBUVNwVTFuRnJMbUlnMDRQMFNBL2ZjZGo5?=
 =?utf-8?B?Z21hMzd2ZFI4WmtMS240amtVTC9TVXdlYTVodEJMMUtBbXBsNmdVQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0295c90-99ac-4517-294d-08de583937d2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:33:10.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4tm7rNxoZm0hzxcxjgNoQfWSIDAc+F236W/rnXoxNcFh8ziDRSpIBUQYsbSLTo67G+uCYkwebwahNGKe0+mGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7058
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 50156481B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 03:06:47PM +0100, Roger Pau Monne wrote:
> This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
> the current memory target for PV guests is still fetched from
> start_info->nr_pages, which matches exactly what the toolstack sets the
> initial memory target to.
> 
> Using get_num_physpages() is possible on PV also, but needs adjusting to
> take into account the ISA hole and the PFN at 0 not considered usable
> memory depite being populated, and hence would need extra adjustments.
> Instead of carrying those extra adjustments switch back to the previous
> code.  That leaves Linux with a difference in how current memory target is
> obtained for HVM vs PV, but that's better than adding extra logic just for
> PV.
> 
> Also, for HVM the target is not (and has never been) accurately calculated,
> as in that case part of what starts as guest memory is reused by hvmloader
> and possibly other firmware to store ACPI tables and similar firmware
> information, thus the memory is no longer being reported as RAM in the
> memory map.
> 

While kind of obvious, I guess this needs a:

Fixes: 87af633689ce ("x86/xen: fix balloon target initialization for PVH dom0")

So it doesn't fall through the cracks for backports.

Thanks, Roger.

