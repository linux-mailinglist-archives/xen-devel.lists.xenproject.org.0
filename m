Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5D8FC8E1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 12:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735691.1141806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnmW-0001eV-Pb; Wed, 05 Jun 2024 10:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735691.1141806; Wed, 05 Jun 2024 10:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnmW-0001bm-Mw; Wed, 05 Jun 2024 10:22:12 +0000
Received: by outflank-mailman (input) for mailman id 735691;
 Wed, 05 Jun 2024 10:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rKp1=NH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sEnmV-0001be-3F
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 10:22:11 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76d98a4a-2325-11ef-90a2-e314d9c70b13;
 Wed, 05 Jun 2024 12:22:09 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 10:22:06 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 10:22:05 +0000
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
X-Inumbo-ID: 76d98a4a-2325-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVVq9EUDADTMBa0IcD4BFrXJkVTRg1Wg1WL09Zdxazyf2Rq+R0PHpPonyBqdRwhfijpY5dh1DtR7gm6gRbU8/MJi5k05/Gzlz8grOr6QR1aunIQbaGFGgVXdxw20HNFGXkQIVhHDDzUi8GpvRMjirAiZjU1qacnPWXArnmDj1RNaXTlAJz4yXQsqv270rjSDAq8nivl/J31iL5SLqQmRNm8h7npf/p3ntaqv7KjR6NnR8Bu54NFHe+79pi16yhZSI2sPL/hCLcVecRq8PNMn67zD92ar9X34fAXIsBu210y4/xPI/E7+SARjMrotZbqXMHhSxUxdiur+t7dH/+tINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDhwJdRIQqsVW8o307fkgrhnlbwWH65fIFvsBZ0/BYA=;
 b=Bwx3bsa4KqwmI3eP1NHdziLi7R6sbu03V/KWlHLRirWNvxDBYfMdLLWbVVwj3qnzo0O85f12/jeXwvPG0YAN2BfWhsdJxeLYJLa+QKgY4/zUUtwbSSAIEoBIFE8UbliLftQFfyl9u20tVmTUR6WYiDWBGT6xCTsAL4IFCGX+hw9Bzo/L5/oYR8DMwApXk/9LN4J4JQEk/MK+k32nU4vqNAnr8/jUY6KWl57iElym3qIaCLj1FZs7pXnS8dQkn9DdBeeqjL+lCnj6JpoNVVOVX35HOr2tA80KTTw3L2zHTaBXIoNDukrEhScidQAjR5cqFEePJL4D9MM3uqVzLES45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDhwJdRIQqsVW8o307fkgrhnlbwWH65fIFvsBZ0/BYA=;
 b=kRBnioSYRDpvkiydnXxYQBD9nCPk6KLt5Wgw6wob4Rj9lakZv1SyUuIzb3S0Q8FsSSj9Vtp3Btc4Iav0uN3J20yATvPLB3Wl9AYRpwsiO+qcdZuUyE153sO+iRx6rtKAl/Jh6ru9uivkwWyHiIjmbvCfaEKvpYZF8yKRrXPVSg0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAP//yCWAgAeLLwD//6n2gAAQ1XyAABA5GQAADz4pgAAu2vkAAEmxvAAAkQD4gAD05PGAAfOTNwAD1iZlAA==
Date: Wed, 5 Jun 2024 10:22:05 +0000
Message-ID:
 <BL1PR12MB5849932D0F3D280E4B8574DCE7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
 <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <46b884e2-cbec-46f0-9070-7013307a310f@suse.com>
 <BL1PR12MB5849C1D40FCF9861BFE7B208E7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
 <6d2e49bf-7be2-48f1-8075-dc0626015c17@suse.com>
In-Reply-To: <6d2e49bf-7be2-48f1-8075-dc0626015c17@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8597:EE_
x-ms-office365-filtering-correlation-id: 0b7b4479-f7a9-43f9-92c6-08dc85495971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|7416005|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?alRwU3FnUVNEOTl6N3h6bGZ4eE40TWJNcTZ6Q2NTYVE2Wm1hLytPRkQwKy9W?=
 =?utf-8?B?aEhoTUZOOTdvQkVBWDNmaFpJT1U2OXRZMCtzNENDRjRWbjQ4akZiL2xUa0tZ?=
 =?utf-8?B?bytwOUNGdVNBR2NOYm1ONVlPWWFTbVp6U1FWZTJNdlhNR0JxSXg2M1YyMTdk?=
 =?utf-8?B?MzBkT3cyZVJVRzVxeTRxam1aQ2FUQ1l4QlpXWHFmMHlLVXFiWW1VNkdMR1RT?=
 =?utf-8?B?NFBuOHVTUmlydWMvbWU1Mm05SjVveWt2U3VRUWlMQi90d3o5VExvVG5KSnNS?=
 =?utf-8?B?em5sNmV1a25NZEdRbDZkYXNXYnA2MnczNnFFVEFtOUYwYUttU1JiVU9DeElZ?=
 =?utf-8?B?WkYxd0FIaVZCUEZpbE9zeVlhSzdqZnZ4dEt2TS8xWkUvZFpaVXhHakF3L29o?=
 =?utf-8?B?ZWsyTXF4cExWTEkwNDVaSHhaTnpsblMySGpBb05TUllpMzlneXpEa1B1VUdl?=
 =?utf-8?B?RHZiOERUK1h3elBCYk9GeWVDS0dhZU15RURNdk1BWTRZRXJhQWRpZnFnNnpp?=
 =?utf-8?B?alBzR0MrU2RLWHJIZFc4eHAvNXk4dXA2TnFJaFEwSCtDZmhVM0hNTSs3TmE1?=
 =?utf-8?B?bXllK0QvQ3dabC9GZ1JZZ3dlWEJoSk1VWnZNT3ErRDYzbFZzWHQxRktjTThJ?=
 =?utf-8?B?emhvVis2U1BDYS96eVhuOTQyZWQ1OXB1dGx5RTNZWHRvb2tZRWVCMXFhemVI?=
 =?utf-8?B?bE4zTW5hRlhGb0NEQStyWFFYeE5vS0hiNUdwSTVXdFBpcUVpRFJZUkNTZEZt?=
 =?utf-8?B?TktvTC9NUGNsVFZ1SVhmWG1jM21mdElSZHVJL1dkdjRtSlZ2Ni9lNEhaWXpM?=
 =?utf-8?B?RWgrWUdOcnJ4TjdhdGE4LzlEODR0bEdURlBYMHZPZmJDeDdaRENkWmlDcDBZ?=
 =?utf-8?B?ZVdyTy9IbXR3L3ZiMUZXTjFTWTZ1clduRXZoZFREZFdhVkNPVERFSWdYTU9n?=
 =?utf-8?B?dFlndmdqNG1BUEV5enRYYmNvbENncXRGTXpkcWY3aG9lcHNXWU4zYUhJTmFG?=
 =?utf-8?B?cUdVWm9vcE1VVGliUnhXWDl3ZFpCb0lOU0VJV1Nqems0YkRGcUs5NzI1TVRL?=
 =?utf-8?B?YmJLNmN4K3Nsakw3L3VyWnN5OW1LaW92NzM0dSthMnhObUNlRnh5RG9SOERK?=
 =?utf-8?B?U2dsTzZiYUxubS93S0RrOW5KU2pwOTM1R3pBYVkrZjNqSWVxNXZKVDgrTGto?=
 =?utf-8?B?V0lnblFNbThuMnprQmRhSGRGVUdPNWhsYkRTdytBR01TeTVaNEErT0F4eHdv?=
 =?utf-8?B?WTVRYXBiQ1FtekNUbzgrRmZNUmNsVHBxUkloVWNBVStzUUVBeEpVbWhoNzdt?=
 =?utf-8?B?ZytXbTlESm5nQ3ZDTEtJZ2FQZHBOeHJaN3grem1KZXczY1BDQzh3ZExKSzIx?=
 =?utf-8?B?MWZBQVNpekpkV05KQkxMeGlMWUFYMjZxUUFsazhlRlVRSmo1dDl1RFByVk52?=
 =?utf-8?B?QkpCZjJMa3hVVi9IUmlOcUhWODlJVmVLVEpPL1pMNm5xS2NhWmp5TS82TEdD?=
 =?utf-8?B?M1hBK2Z0bVNINDdRRDNIYUl6NmNVaFBEVkRNSkVQZVU2cDZtQXQ5c1Y1d2NC?=
 =?utf-8?B?Kys5YWFXZm4xZEhQc3BCM1B0SmxVNEtMVGpMQS8wZXFRNVhrL3B3ZnNXUVda?=
 =?utf-8?B?dFdTRDdNOGtjbGVPQjVlTFc3Y01SZGx0Zy9CYy9LbmFTNVBEV1V3ZU5RaHcz?=
 =?utf-8?B?SWRXNHpuamxqYXBYWGtqYTZhQUptaVN3NzZFamE2dVRGL2w3NjhhUTI4U3pu?=
 =?utf-8?B?TjY1MlNDNXZKZlAvREFtSkVucyt0bStNNk1Kc3ZqdW5qd0pEUjJhejFvc2VD?=
 =?utf-8?B?K3dRZng0Y2xtQnBsWUZBQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDRqUHV6R0M2dmFCZytpbFFXK3FjWmtxOW1qaldGaE5ZZHA4QVE4REdvL0No?=
 =?utf-8?B?ejFLb2NiVFljMmJVQ2lqd3E0NHlmZXM4RUZjdFNXUkErN1FJdVB0VWdzald2?=
 =?utf-8?B?NlpBZHo4c2lWa2J2S0hGU2RpdEpPZzdOWGpZUDFwNzlrbnBEMnBHb2lESDZw?=
 =?utf-8?B?a3E4UEI1Zlh5TjJLT3UrdDFETFRlNk1IVzAzTGU2SWNEaVRXMFVFVStESTZE?=
 =?utf-8?B?M21GTXRSMCtONG1EV002U05jc0F6ZGVDOFRrRWRFaUlidEVLcHJ3ZkV6QXc4?=
 =?utf-8?B?TytDZTRvejhxYU1wMFJMY3FyYXlQTVVRT0FoVFB4SnBDYW9jTnpNaFJnUVZi?=
 =?utf-8?B?RjBML08xR3MxeU00WG93UHJrWXgvM2EzdGJiZ0xkL1NrUmF3dTVNQUlnN2dn?=
 =?utf-8?B?bDl1Mi9BWGlQRlczRzdMMWs2WVRuaVEvV09SdTlTQkhLc0JHYlN5ZW9yNUNs?=
 =?utf-8?B?b2twanAwTlcwdmxzdi9BNlVnaStUcGczcVZtRHh6eTNWQWRlRndoMUl3a2tG?=
 =?utf-8?B?MlRxdGVCUTczNTBGMDJCWGNUQnI0bURqNmdHdHg1UkUwZlR5RXh4c3hoMUI1?=
 =?utf-8?B?UHZVZTZuemxXYmFjWVY2S01Idjc3Mis2bkZFSkNBdlRsWVFsdCs2V09Wc1hJ?=
 =?utf-8?B?NnR3YjBmSHJvOUU4d3I0RDhpTStQUWJ1Ritsa01oazAwRGNkbCtmZnV6VHZZ?=
 =?utf-8?B?ckk2c0RMVGRzbVVlRUFWdEwzM1V2M2YxenhYWlE4L0FDNkYvRitXTGZqMm1h?=
 =?utf-8?B?M2tmcU5yeURrcFIwMkFLckJDVUovQm00UnlIYjVSUFhCSmorSDFNVHJRWmN0?=
 =?utf-8?B?TXIyTVMwVEQ3L1BqbDRHVEdWb2VxQmV3SDNGSlNtQ3I2RkdESmkyb0hTYVZo?=
 =?utf-8?B?REFlZkZiaDlINTNVT3RyQUJMVmFzcDVxT0R3cUM0czMydjV6dUYzKzBkT1B2?=
 =?utf-8?B?WXpNNi9zcXhzTS9IN0hFaldaU1NFUGU0TWphM3V2TEtPUFFncHlYSTNvVGta?=
 =?utf-8?B?MmsrbFFjMHJuajVsYkhaVG9qVlNyNUQ1ZHZCM3E0YWhLRHArN3A3VUZRMWEx?=
 =?utf-8?B?WnI5bTZwZ1NQRmxGN2h6OEl5bDNlVko3d3dpN2NVOTNsRHl1c1h3R09LK0Z5?=
 =?utf-8?B?OVJPREFuUXI2RzFCODJLTGdSbjBRNDFqRkNJUnBQQ0kzNlhSYUg2QXRsOWsv?=
 =?utf-8?B?ZlVJcGx2Z0xZOW9ENlF2aytNd2lkSDY0YnZ4NmVxTzZoSCs5cXo5ekpRbDFs?=
 =?utf-8?B?RnN5bGZ6bFB6RGJlbWhxWjBhcGt5eVFnYjB4TjhjTTFjVmRTendTdit4WjMy?=
 =?utf-8?B?RE9idlR0SEtOQ2RIbldpTWRvN28xNHV1Y3RGUEx2ZkxoOXpwN3JGbVJJMmQz?=
 =?utf-8?B?QTRKOWxFTThCYVZtOWh4bkoxN0hJMkJreGVsMUpFa0Z6WFVMZWQwQnlpM2Uz?=
 =?utf-8?B?YTlHUWxQTkxjMWQ0TVd5QXNFa3BObndMSjgwQThUQ2hrK21ycFhlcDFXWXlH?=
 =?utf-8?B?U2h1YWxKT3E2a2tGcWRYRGNoaHRIekJ6MmxDY3h1Q2F0M3VLWjB1MFR3OEwz?=
 =?utf-8?B?eitQa1FucEFIdGQ3bjd6VGFCV1VzdmtMRDFKWEJwVjVHTjE3UFFwM0ZsWXpM?=
 =?utf-8?B?cFNmdGR1MUhDcitOZ21oejF2dXFqMWhOUS9zcGJzeHpQOThnVnZDQTRtNmhr?=
 =?utf-8?B?Uzc4bkVmTEM3c0tFa1FCay80V2J1cndML0NPaThkSDBsTFgwa0FZc2dDVTlE?=
 =?utf-8?B?U0JDYW9sRzlNNmR3T2I4WmJGZm9GWGNqd1RDZlFTV254cUJwVno4V1NkUjYw?=
 =?utf-8?B?dC8vdmlUV0d1WnlYbGxHWU4zRllKUnRybzRKMmhidHRDZGhDWEpwcEVmZ25z?=
 =?utf-8?B?Y0VxSlJKMXhZbW1qOU0yOHcyK2xuQStlS1ZTV1RJdGFHWUNJRHl0QjFBQyt2?=
 =?utf-8?B?VEVRNEpsR0R4TXpjUHlFSmNoRzJhSk5NcTdyYUIyNFB5S1Z0NlZHK25aNitN?=
 =?utf-8?B?NUQwdU1XSWtya3RlM0c3ZkhQUjY1WUl3cDA2RXZNdU9RcjV2SVE2NVM5WDZk?=
 =?utf-8?B?R2dLbXpTTUg1UWptcCthZlEvbGwrZUhrQnZJYXdmMDBHZ3I1SjNWYW5zMmts?=
 =?utf-8?Q?ALUc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D08E908882CF07488C39DE03E48D7703@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7b4479-f7a9-43f9-92c6-08dc85495971
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 10:22:05.8904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpKrZxtk1InFwaOyYR68+7BNeE1Miudw8NXt2uGEC5WCEBmwl7vGDWgL8p8VOFWz7vQWXD3E0S9jp8iRiY5zXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

T24gMjAyNC82LzUgMTg6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wNi4yMDI0IDA5
OjA0LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzYvNSAwMToxNywgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDQuMDYuMjAyNCAxMDoxOCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0K
Pj4+PiBJIHRyaWVkIHRvIGdldCBtb3JlIGRlYnVnIGluZm9ybWF0aW9uIGZyb20gbXkgZW52aXJv
bm1lbnQuIEFuZCBJIGF0dGFjaCB0aGVtIGhlcmUsIG1heWJlIHlvdSBjYW4gZmluZCBzb21lIHBy
b2JsZW1zLg0KPj4+PiBhY3BpX3BhcnNlX21hZHRfaW9hcGljX2VudHJpZXMNCj4+Pj4gCWFjcGlf
dGFibGVfcGFyc2VfbWFkdChBQ1BJX01BRFRfVFlQRV9JTlRFUlJVUFRfT1ZFUlJJREUsIGFjcGlf
cGFyc2VfaW50X3NyY19vdnIsIE1BWF9JUlFfU09VUkNFUyk7DQo+Pj4+IAkJYWNwaV9wYXJzZV9p
bnRfc3JjX292cg0KPj4+PiAJCQltcF9vdmVycmlkZV9sZWdhY3lfaXJxDQo+Pj4+IAkJCQlvbmx5
IHByb2Nlc3MgdHdvIGVudHJpZXMsIGlycSAwIGdzaSAyIGFuZCBpcnEgOSBnc2kgOQ0KPj4+PiBU
aGVyZSBhcmUgb25seSB0d28gZW50cmllcyB3aG9zZSB0eXBlIGlzIEFDUElfTUFEVF9UWVBFX0lO
VEVSUlVQVF9PVkVSUklERSBpbiBNQURUIHRhYmxlLiBJcyBpdCBub3JtYWw/DQo+Pj4NCj4+PiBZ
ZXMsIHRoYXQncyB3aGF0IHlvdSdkIHR5cGljYWxseSBzZWUgKG9yIGp1c3Qgb25lIHN1Y2ggZW50
cnkpLg0KPj4gT2ssIGxldCBtZSBjb25jbHVkZSB0aGF0IGFjcGlfcGFyc2VfaW50X3NyY19vdnIg
Z2V0IHR3byBlbnRyaWVzIGZyb20gTUFEVCB0YWJsZSBhbmQgYWRkIHRoZW0gaW50byBtcF9pcnFz
LiBUaGV5IGFyZSBbaXJxLCBnc2ldWzAsIDJdIGFuZCBbaXJxLCBnc2ldWzksIDldLg0KPj4gVGhl
biBpbiB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uIG1wX2NvbmZpZ19hY3BpX2xlZ2FjeV9pcnFzIGlu
aXRpYWxpemVzIHRoZSAxOjEgbWFwcGluZyBvZiBpcnEgYW5kIGdzaSBbMH4xNSBleGNlcHQgMiBh
bmQgOV0sIGFuZCBhZGQgdGhlbSBpbnRvIG1wX2lycXMuDQo+PiBCdXQgZm9yIGhpZ2ggR1NJcyg+
PSAxNiksIG5vIG1hcHBpbmcgcHJvY2Vzc2luZy4NCj4+IFJpZ2h0Pw0KPiANCj4gT24gdGhhdCBz
cGVjaWZpYyBzeXN0ZW0gb2YgeW91cnMgLSB5ZXMuIEluIHRoZSBnZW5lcmFsIGNhc2UgaGlnaCBH
U0lzDQo+IG1heSBoYXZlIGVudHJpZXMsIHRvby4NCj4gDQo+PiBJcyBpdCB0aGF0IHRoZSBYZW4g
aHlwZXJ2aXNvciBsYWNrcyBzb21lIGhhbmRsaW5nIG9mIGhpZ2ggR1NJcz8NCj4gDQo+IEkgZG9u
J3QgdGhpbmsgc28uIFVubGVzcyB5b3UgY2FuIHBvaW50IG91dCBzb21ldGhpbmc/DQpPaywgc28g
dGhlIGltcGxlbWVudGF0aW9uIGlzIHN0aWxsIHRvIGdldCBtYXBwaW5nIGZyb20gbXBfaXJxcywg
SSB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQpUaGFuayB5b3UuDQoNCj4gDQo+PiBGb3Ig
bm93LCBpZiBoeXBlcnZpc29yIGdldHMgYSBoaWdoIEdTSXMsIGl0IGNhbid0IGJlIHRyYW5zZm9y
bWVkIHRvIGlycSwgYmVjYXVzZSB0aGVyZSBpcyBubyBtYXBwaW5nIGJldHdlZW4gdGhlbS4NCj4g
DQo+IE5vLCBpbiB0aGUgYWJzZW5jZSBvZiBhIHNvdXJjZSBvdmVycmlkZSAobm90ZSB0aGUgd29y
ZCAib3ZlcnJpZGUiKSB0aGUNCj4gZGVmYXVsdCBpZGVudGl0eSBtYXBwaW5nIGFwcGxpZXMuDQpX
aGF0IGlzIGlkZW50aXR5IG1hcHBpbmc/IExpa2UgdGhlIG1wX2NvbmZpZ19hY3BpX2xlZ2FjeV9p
cnFzIGRvZXM/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVu
Lg0K

