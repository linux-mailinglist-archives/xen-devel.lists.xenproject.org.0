Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24CD1347C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200434.1516356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJDB-0006GK-Np; Mon, 12 Jan 2026 14:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200434.1516356; Mon, 12 Jan 2026 14:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJDB-0006E6-Ke; Mon, 12 Jan 2026 14:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1200434;
 Mon, 12 Jan 2026 14:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfJDA-0006Dx-36
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:48:04 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d5ae88-efc5-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 15:48:03 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5202.namprd03.prod.outlook.com (2603:10b6:a03:220::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:47:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:47:55 +0000
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
X-Inumbo-ID: b1d5ae88-efc5-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRx83vtypfDKFsufgxAvyKJ4lB3sS+Fe4P1DXIhor0lPO3UMbPXlxXA/6piwM2Hd2NhFjk5wfKkSyP01aTUlHkIAUMyNYnBUXUJwkhfElqnxksJto0b71IXyjeDRTy5mCevlkLXZuEs3fuelXwVHmwnOx6xagc/fUbmfqSv/OGQLfZTuertK+8WgsFEG6WFvXJVF1xy92KAC+6s6g8vMm5t2XT8u4cFOdZuK3EZWMK7uIPoPJ+HKirLvDq2viDALg8opYIk5ASsz1DB3ijy+mKdkk+Rirok3KmQCbReI/q8Zix5FUgQuSpVgLvnbVfYcMgzMU1zqBor4KufICNrByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYoH2pENNa1CA/KKc3Q5DHGXVD+RjMLMytystKpY/m8=;
 b=quwS/2iSq50QaoJhwUsaNL+xUCvhbtsUT6KayfXulJrMhqKdKIQtIi26djgFXcBQ4eoCTU4XtgQEPohk3HDzXbEWV292YioXUCpAYy6it6UChM4gr9eTIa9B+ZkA1PHo4tbB387NSQhLFQmtdkcsjlexRKdfFMETPJeBfP8Nrz0Umsvgm9pvcrlJ47OY5zhRQqP5IyjpS9vOrTkLGX3b0IqMYVgIPAHcySPccDSWle2wP6UeSzCMZMnPxMo+znHURnnkJQOo+X7LeEY0EuQ2QSdlAFWH9+tWFs/BTpSD9th7dyx7pLmhqqrL7duUE6RQl+MT7ghKARdDGN9Yev1cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYoH2pENNa1CA/KKc3Q5DHGXVD+RjMLMytystKpY/m8=;
 b=hXfjYuhqX6z7/z2DeGit+4mbRyXbkysdt/lzyf3plw2gRAGx9b/WZeIS6DPWHJ9mEu8xro6fHl8qEZXyc6kMT78vSnUrc105dry5mz+sA/9eskM8mwNvSUQpXgi2upY52GbMGDCw1vHMRs//cdbWpvMcX83+XTVwRTv7LGnVtJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <05372ffc-c1b6-4d65-a13b-cd28de6248b5@citrix.com>
Date: Mon, 12 Jan 2026 14:47:52 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86: Add Kconfig option to use a 32bit TLB clock on debug
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260112140851.55590-1-alejandro.garciavallejo@amd.com>
 <2a903c72-633d-4c91-938b-443628ac37cd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2a903c72-633d-4c91-938b-443628ac37cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: eea220ce-6ce5-4680-75bd-08de51e991f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEFPQ0hnd3VWWG10cnRFSnd0MURWYkNWdWVkRWgzNysybXdMNVp6K01KanNF?=
 =?utf-8?B?WkxNUEdpbFZua2F1S1BpYU52clZSTTZhVHVoYVBwWGZmVmZhNnQ0UzJoa0ZN?=
 =?utf-8?B?SGU4MjhvOUgyaHVlNHdYZ2JzT3RISlVBalMrL0o2MmlhY2JZcVZuTzloeDBS?=
 =?utf-8?B?WUUwMGsvMjdBd09rZ1Q5SENtYWI1VnVORVB6SnFPc3BkdmxBdFVnSDZzbG9X?=
 =?utf-8?B?aEtzZWM2dzJyYzh4Y1RUdjE0cUZ3S3dqbGtkb3BqcmRESVRVTGdTY2xETit2?=
 =?utf-8?B?OE5kOVA3aDRoZStFTnBPUGVEellIOFFMQ1FTUGpZVSswb2QvRjN1d2RzOWJ0?=
 =?utf-8?B?THgyajVzQ3dqU3B4RlY0Nk10WmNVNlBBc1p4SHg4UDFFaTI4RVJTam5tdGJx?=
 =?utf-8?B?Y0hFbUtRTE5TcUFXc1hFZlRJRlNSTmNsRG0rQmpGVm5TTTlnaEhVMk5nU3Vq?=
 =?utf-8?B?cWpPZmdnWDE0L2E4S2dTczhZcG56Tk51cG1TQ0t4MlduVHZDZjFwWEg5eDdy?=
 =?utf-8?B?STl4cDFNWUhpckd6Y2xtcGZhVFlXZW5RODlaSkFzVlNmZ0dEVmN5RU5FZDRR?=
 =?utf-8?B?dyt1Q1NmWkNxeHFSS1NabStvMzl5Y2xWSXVvUi9QYVhId0Vwem1qWVc1S3pv?=
 =?utf-8?B?Vy9Zd1JUK0dPb2x3eDdkRzBOSldtenVRcVl6MFRBNzZuam9IL2xiZ0V0Rm1p?=
 =?utf-8?B?NzVqR3BIN2FWcE9tdE5sUEdKakNlZUgrclc0SjZ2L3RCR0ZCdXBQcEVhWXBU?=
 =?utf-8?B?anY2ZmNBakVNSjVVTkJCSUh1V1BVU2VWUXdDaFFJVkpLU1hoaE1NOWZyT0N6?=
 =?utf-8?B?NmMxdkErK1RKb3dYUVcrcXBzNnovY05qUzE3YkhSL3UxODRBSGZ0VGdvNTBs?=
 =?utf-8?B?bzIyY1EvWWpxWG5Jd2hVZlNNSWU5Tk9uLzUyUmdtUGtpVGpTeXc3eURYdDV5?=
 =?utf-8?B?cU4rbUNrMVNEVVVhT1drVzAxNUJqbmZ2TlhnSWZDUjZ6a29kWHB4SHlQcXNE?=
 =?utf-8?B?RUxyT3Jjak5EbHIrRWpiUHIxYlhTcjZ3YnlUNm9nODRPeUdjMVpldEhCTmVu?=
 =?utf-8?B?QXhtUVRqNE9kMjd3YVZtV1NIWmFFLzFLczNsaFVsemZuUmYwenlneGUxMGcy?=
 =?utf-8?B?cG9IYmYxaHJTc2Q4UFpyd0lEemZwVFYxRTJXNllNYUtxekxXV1N4NDhpMUpT?=
 =?utf-8?B?RHNiZVp3L3dTWHlCSTEzeVpPVGRNOVcxZ0VhR0dhK2ZoQS9WRkNvc2oyelhK?=
 =?utf-8?B?bEd6U2N5Mk5TUTZkQ1RSSE5JaUVsZk1YVGR0SjZ2T2xCR1djbDR0SndNbkFE?=
 =?utf-8?B?cXN2dFdKZTg5YXUzTkl2MEx5bDlnUnhRaEh1UWZ4S3pUb3FRK2V0cGU0ayto?=
 =?utf-8?B?RG1PVktBYXZ2eGZORzhaNG8rcEQzWUQ5cC9BYnZZcFc3Q0M2Qi9ON3E5Qk5m?=
 =?utf-8?B?ejg2YnFMbDZ3TDRwdjBZUDdBaXJKTDBoWS9sU0VhVC9FazBzTTRLKzllUllm?=
 =?utf-8?B?L3I3c1k4MExTMGU4cVdmdzRIV2ZYMnJiNzh0VUM3Z1p0WFZWUVUzSkZka2h4?=
 =?utf-8?B?WFZCYnFmZ0VsZzJhUlRwL3hOVFVmVnNSNFIwSnU4ZDVxTUpxUEhlTVM1T0ZJ?=
 =?utf-8?B?WVM2VWFRTUNCZU42ZS8wYnNPS1VRNUMyTFEwQ1dNak9YeWl5RzY4SEh0OUNY?=
 =?utf-8?B?WTNrYU9ldEdUZCtNVEx0ZjJsR2Y5c0xlaTNiU3g3VnAzODZLaW5veFRKUGdz?=
 =?utf-8?B?WHYyMEN6SkZZZ0xVUU1KTGN4R1dpV2JoVi9nWkV3VHltTzF5UXE4dTJoTHNB?=
 =?utf-8?B?ODFDUzdyOFpMdnhQN0VVQlhlbFpVL3k0RW8wYmRmSzJpYkk3b1FCRmhHcnA0?=
 =?utf-8?B?dEM0VWwxQkE0THhrRHA1OXFEQ0k2dXNlMmVqbUZoMlU3eXFWbmhSUm5jbGQw?=
 =?utf-8?Q?zVFg5a0BhbDxOnTZz4vEyny9oyv/L5dw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkdDTUEzc0pGRG5qdFBJRnpkSGQ4dFF4K3F4UUVyVUptVnE2a2xvY2lKNis4?=
 =?utf-8?B?NmlCWUxDVmhUUVY0b1hTTXE1RTBLelpCMU1LNGVVTElMQS81eHkySDFRdFRK?=
 =?utf-8?B?L0Vib0JNbFU1YWg3c1JGT1FCQUpid040eTU2NHNjbHhsVHFpZ1VtZEt1T3ZI?=
 =?utf-8?B?L2ZZdnlJdWUzTWo1Nks1Q2RwV1FXaTlERTBldkR4cE40dEZjRlhqM1k3TTVq?=
 =?utf-8?B?SWZUelZzZ0dHNG1YNDRCRExDZ291SmdpUURsbmIzWkt6VnhrNjRRdVZuTERr?=
 =?utf-8?B?UnZ2SGdtSlFqOGlCTUh6VUYxMWlHSS9PNTh5UGhwaVEwTzVNWUJJNmVSbzJP?=
 =?utf-8?B?cUtZeDlKdlNGQTdlZDYrRDU2ajlTZHpIU2tmV2w3amsrWlBrT2dRVURoSEVa?=
 =?utf-8?B?cE03VUxWOHlpOGRXZUh4V2t6T1VRc2laMXU4NzZXWGV1bjEyWWJRMEFoRnFl?=
 =?utf-8?B?QUdRdWxlaXZ5OW1Gazc2cmc2cDBHVTloQ2I1NkFFN21UVlo3ZUEvOHBGYUJU?=
 =?utf-8?B?c2VyanBOWlBqcUlMeWZlS2h3Vm5oL1hOMU5XUTUrU2lwdVBvMHdjZm1XV2pk?=
 =?utf-8?B?R2l4cXZQcktyME5JSnN3VG9Cekp6dG5aMC8vK1pGM1grNzc1M0RQZnBZWkdL?=
 =?utf-8?B?NlVjeElXV2s2Sit2dEhFbmpoTGNiR1g2VXhqK3dBdjVJTGJ5a2hNWGNtVktq?=
 =?utf-8?B?U015ZTI3cjVoOE5DNnpHSUlhbEIzS2w0bDlablRqQlFyYmRuMHJsOW5HNm8r?=
 =?utf-8?B?Y3R1OXlTOWRIWU5QYVJHck1UWE9UTkVGRjRhbkZ6eXBZSjNROUdySm45TEty?=
 =?utf-8?B?RW9GZ0dlV045MFhCd01DZi9OS3JpUk5RY3dLYzhIaUtoR1JSNFVaSmdXUVFl?=
 =?utf-8?B?UW4zd0FtVDNnV291Wmx1UjdnMnFQSGZkbXZoUXFlcFBML2ZSdHFqZE5vTXRP?=
 =?utf-8?B?S3F4RktMOWV6NjVnTkZKWUdlZ24vWU1DdVp3aFFVTDFEdUhwQWRUSVgvdGox?=
 =?utf-8?B?WHIzM3JISWJEeHBVZ1VGcTVzb3NFQWdSU1JqTkdMQzh5a0VTVk95empCTlFP?=
 =?utf-8?B?cUlyd2JZOWNGMmpMWnhRcVRCNE9uSDJiVU9SY3dPL0VieXpXSXhyckcrbUtr?=
 =?utf-8?B?QWpURXBSd0xGWGtSSEZVaHZWamUvbFM5WVk0OXg1OEEwcGR5ZmkySWdXSlNM?=
 =?utf-8?B?R0pmY3R5SHZUMWVVU3VQN2xrS0xSaWxqVk1zN2hIMUxsdW1ubTU1QkFteE9o?=
 =?utf-8?B?ZisxQ0hCa0gzeHlzdGkrVkV2VFhqbG1rRU9JSmo0UGNrR3NmMkcvdmRGcWpK?=
 =?utf-8?B?N1ZkanZ5NTVCZzUyRUZPMHVueHhmMmU3cWZUaVNBcStvQmFDeTY0d1JSV0d4?=
 =?utf-8?B?b0dRb21BcUhNNXUwNjdQTFdZeUZkMVYxSW9QNU5tUnV4QUlrOEU1Z05QcVRa?=
 =?utf-8?B?SXB4cEdMY2VQeEVHZ0RGSFpYWHlnM2J0dnprWDZmcmdpbEZjbVMyVVo3Z0I1?=
 =?utf-8?B?dHpQQkt6SlAwTEJ0ZmpnRDloNmlkYnVlRFdrNWpWMUdsY0FXUUZtbFU2aUxz?=
 =?utf-8?B?Njl2bFZ5N1dIVnlHYkw1RTB2dlBPb05MVm4zdEVGVXV3b001Y01FdXRYdWs2?=
 =?utf-8?B?dFhNb0dMZmxQN0l3eTM5b010b3lNMnpWWjVheUNkMnlObVFxMG1sS3VpNzJp?=
 =?utf-8?B?MG52VkxrNS8wRHZleXRGbGFVNEVnY1BXT0p4MmZyYmd4Mm16SEx3c1gwOU1J?=
 =?utf-8?B?aHBWc1QzR0FOeG94eDRKT1ZKdkorbmc5MDllcGFTM1ZqSmN0OU40MVdYamhP?=
 =?utf-8?B?dXU4YzlLV3RYRUVzckc0T1RpZFlKRFRtMk5oMGFMbnlmbHBLS2Z0czNOd1Jk?=
 =?utf-8?B?ZEpEOGp1UFlHREtyUjNXQURDRWZNOE5MWCtNanJBdloxTjhrU0t0YTh3dlNV?=
 =?utf-8?B?aVE2eDI3cVhUZmZ1M3RDMkNLWG5XVUNhdTNoWnQ1N1lLeFc0Y2c2ODN2OWF3?=
 =?utf-8?B?Uk9ONE9Qc2xwODNYMnRLTGF2Q3l4V29jdWYyOER0RUZvcVdrZTlmRE44eU5n?=
 =?utf-8?B?dURrbE9qVjYvRzZiZUhsL3JiQUF6TUhUdDNUbWVLZlNrbllKYlk5bXdDQmZq?=
 =?utf-8?B?OFhZczhicjdEQmQ0ODcyaUd0emxrZ1Q4VTgyNWQyandYNityVkIyRUMyZExs?=
 =?utf-8?B?SUFZRW1uZVZjTFptcm1lSGdMeEhrZGljUVprbVQya1JrR0V3eUVNcWd4anAy?=
 =?utf-8?B?UWkzd0gxYnpxNVhWcWdGZ2ZBcXYvTkVoVkVEUksxa01hNzZWMndrQno0V1BS?=
 =?utf-8?B?UnpWRHZIeWd3cnQrQXZURDMwN01IQnpmcXI4T3I1a3U5b3g1K24wdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea220ce-6ce5-4680-75bd-08de51e991f2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:47:55.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HT2COtQRpugvmsH7i4oIrnu9yuRhkgCOkQCKBgA5smPNr9YNfJE3woSHFMz6Ae/vNjYBADtO+mXsiNpi0CUqM1whSbOYA0u1BuT2aHEajvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5202

On 12/01/2026 2:43 pm, Jan Beulich wrote:
> On 12.01.2026 15:08, Alejandro Vallejo wrote:
>> Debug builds stress the wrapping logic of the TLB clock by narrowing it
>> down to 10 bits. This is inconvenient to test real time workloads on
>> such builds.
>>
>> Add Kconfig option to be able to selectively use the non-stressed
>> behaviour on debug.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Hmm, yes, why not. However, ...
>
>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -20,11 +20,7 @@
>>  #include <asm/spec_ctrl.h>
>>  
>>  /* Debug builds: Wrap frequently to stress-test the wrap logic. */
>> -#ifdef NDEBUG
>> -#define WRAP_MASK (0xFFFFFFFFU)
>> -#else
>> -#define WRAP_MASK (0x000003FFU)
>> -#endif
>> +#define WRAP_MASK (IS_ENABLED(CONFIG_DEBUG_TLB_CLK) ? 0x3FFU : UINT32_MAX)
> ... the comment then will want updating as well, I'd say. It doesn't go
> terribly stale this way, but at least slightly. I'd suggest to minimally
> drop "builds".

I'm suggest just dropping WRAP_MASK.

We've done this locally in the XenServer patchqueue since 2011 or so due
to the overhead, and I don't think it's interesting enough to warrant a
separate option.

~Andrew

