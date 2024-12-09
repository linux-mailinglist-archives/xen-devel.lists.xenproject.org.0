Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566789E9D2C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 18:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851767.1265786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKhhv-0003zt-1Z; Mon, 09 Dec 2024 17:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851767.1265786; Mon, 09 Dec 2024 17:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKhhu-0003xp-U4; Mon, 09 Dec 2024 17:38:06 +0000
Received: by outflank-mailman (input) for mailman id 851767;
 Mon, 09 Dec 2024 17:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68ke=TC=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tKhht-0003xj-Tw
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 17:38:06 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2607::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 576ddaf0-b654-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 18:38:03 +0100 (CET)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM0PR04MB7156.eurprd04.prod.outlook.com (2603:10a6:208:19b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 17:37:56 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 17:37:56 +0000
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
X-Inumbo-ID: 576ddaf0-b654-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxqmTOPAq+IZYf8Z+NY/K1x3FCwXAZXYS4tyWk6Wh6ruV319fZ+AMVGvKtMUZIz1Tf4W6/6zRSM06NnqjfyLUyNFPEufRtGq3DWUfWcRej16qybFdH59eOnK3CdpirYsbdoz9WkK1xsLCJ/J/YE7CN/f1261ijQa+lGX+OJ2MeTnOyuwtBIQ6rXOxDZlqy8ErDIb5glg4ntGYcxLPX2VMjTHNAMfEfcFMN11HlBDDieI9VolP6++iJo/w9/LeRtduE/ay+mle+0W+Y+QMjy4bCeGgYsTTVsO0bSWmE7g0L243lKk/chTU990nI1ELhnok8VC+67nJ3O9EPiG9NrSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzxybjhZfS5Xoqr1xkLsFs1MW/KUCSim6B/zXoAdOic=;
 b=YILJrtxAuFsX0LPo8hPSjCcLm+Q/71JhOCDTshUz5HBcnT0Q5pbaQO2g3Nn2F/TpEI8OY0wrOoAP+fILszKMStdfu7iuE0Xc3jdie80VdvA5oZFBnGSwZ4sgCYm8t5aC7mcVmt/OqcZdg4/m2BXl1QvvffDGx2vPv+kWgr2fuAz5fTmiIZ3slEwoHDda5ZMSd22XgiOPnbjlttq3T+HJytRenNH3eRVBxzB7XbrqIqYVQvL4PV/zvQ1NlzvHpl82qaP2jxUP6Q5XquAekxSigYho9StkS7z41/mnWJh3VOGMwK0NvGrou2dCu3f/Zg9eRT2D9ypAlMcV/SYCUUocuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzxybjhZfS5Xoqr1xkLsFs1MW/KUCSim6B/zXoAdOic=;
 b=ZBFjnAtRd14+wvWU+bmk89J3AKccTxKWgU7XLzzCjcm7Y6scSbY5DWa/xScWq+jC5BK5kZeSDscI+6t5YGsfBN4/6tQDN2KNKvabOafuXNy+6/iLORbSv+Hc85PTx1cV6Mh9HZrnqGVzl3eDEe68z8vBxCpbmbo2ZUwF1bxn4aiXshSl9AuBx5l0xa+UfYB441T+UUogGNqlWf1gwdBGATLFSDSfU/V/8u28wZXbP6hqy9QxGa7vv/ZmPLy/i5BPAuVjYoF/BgA4sLhVT8F/xh5cqn9Pkx03UdtcefKAwrBbnLc0EG7auQXienlc6aFDywNN44wIrIBi0UBNGN7xbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <a2470791-dd21-457c-a314-ca7484d51daf@oss.nxp.com>
Date: Mon, 9 Dec 2024 19:37:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
To: Julien Grall <julien@xen.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <59b54859-d893-4bf4-8118-7e4a00e7d87e@epam.com>
 <3d731902-d5eb-4f63-8501-5ddecf748cb9@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <3d731902-d5eb-4f63-8501-5ddecf748cb9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0111.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::8) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM0PR04MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: fd05e4b2-bdf5-436a-4c8a-08dd18783780
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnFGSUorVEJGMWxLWWJsMjJvQUNxOHM0YjFWZzZLN3QwWEg3ZmxFb2pRUnlL?=
 =?utf-8?B?SXZHdm9yV0VoRmtzcmFIYVpsVzlFSUY0NFJjK1Ira1kyM2M2OUZJNXV1aDEx?=
 =?utf-8?B?OTFXWlh5Q3BIZzdHQUU4YWUxUnR2Y3FUcEtxdUlFRlpNNlFPaWhBSGc1TXlL?=
 =?utf-8?B?LzY0bWQxdnRqdVMzbGduckZEN1NUeDlZaHgwbUp0UGxkR2tQWkZYZG1mdU1l?=
 =?utf-8?B?aHptQ3pDeWovZjJwWHpUeWJNWjJTNW53NFdFTmkwSHhkM2hpQUsvaldZa1Jp?=
 =?utf-8?B?K3VqWlhRdTNIQlMrNzJFVm5ESmhxS3BJdzkySHk3bnJEQ3hTV2Q5Q1QweElx?=
 =?utf-8?B?QmMwOUJBeGZDTTZnZmdBTmZQVndjSjZmNEtMNU05RG5GZUFNcnVtU3NqMmhu?=
 =?utf-8?B?Z3FjVUFlNzU0THpqODNHVUlRVnpOK21zTGVDbFFiVGpDL3lkZjdCZGpIUytF?=
 =?utf-8?B?R3RZdC9DeWNDWUl6Z3F2R2xjSGxMang1b3cvN3R4ZFhzallwOUVyTzUyN3NZ?=
 =?utf-8?B?MmpPbmx5dEpxTTdoNFpQM3V6QnV1QXU5amxOeGlEQWNBcGh4QVBHeGUvYVZU?=
 =?utf-8?B?YjJkcXR6Rk9xbFJOeXpYYnVLRmVYYVBEdVgvRzdyUllYRXJORlZPWE1qSzdV?=
 =?utf-8?B?ZmMrcExGWTZXTkU4MWR1cm55L3NHemRzaTV3Zy9kZFU4YzBKbDE0U01VamJz?=
 =?utf-8?B?blVCNnlDYzZBYWFtRTBTaVIwdUg1V1haY3l6RnJoOHQ4YWhDRk5kRkM3UVJS?=
 =?utf-8?B?YWJJOGhMUm5mdEduaVFtcGVGL3Y2Q3dBV1h4UVQ1WU9za0Fmald5MitBckta?=
 =?utf-8?B?RzFCUmZ2U0oveVlkSDNGbEpyVUhFY0JKc1VmOXdNQ2phWGY4WWJuWHF3aDBD?=
 =?utf-8?B?d1pWTWhtckFsNkZUZzU3VjBpUGo5NGRSdU4yVms0NVpuZ1l1MldDUFMzYU5z?=
 =?utf-8?B?U2tTU0NYdVBYcTBkVmtVUkNFSmRnMVlDdEJMTkx4L3g3K2xWQmJPa2xCanhY?=
 =?utf-8?B?d3ZxSklIUGtqTzJ2bzloN1dnUXlnUEp1N1RmZHNZVUhXNER2YWpjVnlmRGVE?=
 =?utf-8?B?VlVJc1JZVTRmYmtiOVBPK1FueFp0Qi9BbmozWTBtRXNKQlU1ajdQWHRUeUdO?=
 =?utf-8?B?dUx0TkN0Y3lQeDBoT1hKY01jUW9HRDNkUWdRM0xIdGRtWjVnZy9zOXlqd0My?=
 =?utf-8?B?dU5SZlUxSmUzVDVvRzRDM0tBSEs5eW5ubFNtY0N4UUM4VkxtSFhscENqczV0?=
 =?utf-8?B?WldDWGJpWGJPc25YTUxEWFBPd0w2a2NLT0taN2pwanlseExJM1RmK05DN0dp?=
 =?utf-8?B?SkhQUEI2NVNib0Z6dW1UVkJZSnh0UERLYlNTWjhiYmJVTWR1ODAvZWV4Vmp0?=
 =?utf-8?B?dW9nbDl1WDZid2kyK2FGZGdmS09UL0NFNi9LYytNKzlPaGFTdGJEWEJqUDZh?=
 =?utf-8?B?REgyb2RJT00xZDY3VDdLUlFTN1pZdzBOT3FJeGRwNXFqaTFZZEtoZkFjTjJi?=
 =?utf-8?B?T0l5eDZkYk00OXdvUUdSN2xldmJoeTc1d1pnSlVZdFc0aUw3RWVyUnBSU3lo?=
 =?utf-8?B?OTdKYmlFOVE4T0prSTc1MnFOdnVjeXEydkJsMkJ4bHVESllsKzhIVG0xVEw1?=
 =?utf-8?B?d011Y1haUE9ib2VtWkZ2NU9iZFBOdHM5SGdqcUd6b2dZNENvRUdSRjh1NWJT?=
 =?utf-8?B?Tm9UQVFrQUNpZkxvWDBFTHRLT0xscENhM0hndVVhK29sdG45d1g0Rm5xeVdV?=
 =?utf-8?B?Vk9POS9oTkNEK2VXa1hzck81OE4vWjhEYkVONWxIU0lTWGlBWHVaSXcva2ZN?=
 =?utf-8?B?L3NkRjN2Uno5VWtrdEJqZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZOSXZoSnoxQ3lEeHNTb05Yb0EwQlFKa1AyaXQrUzRuTlZic2dwQU5mRWhG?=
 =?utf-8?B?MHZpaHN4S29qdmZESXJBcUhkb0dJQ2czaUNDSkN4YTFrVnRRb3FkaU1HbGRk?=
 =?utf-8?B?RHpSWGQwRm40WWxlNmNOM1RmeEZIN1duWUZORXZ0cmxEN0svcFM1VmVzZmxS?=
 =?utf-8?B?UVZlUitTNjBObXNKQlZuQy9lay9NeWpIMU5ycDJjNVNrSmZERFVkNG5mSVJ0?=
 =?utf-8?B?bWwrYnhhOXRkQlUxR0tnTVE5Vi85MUpiSFNrY3VlN0ZrSlNFMjVqZ2wwRVpP?=
 =?utf-8?B?dnVyUWhwYU5MbTR5KzNvbWJVcnhVSWljS3JGN2RKWU5Wc3lQU2lLb3IrbDZD?=
 =?utf-8?B?Sk5zYWE5TjlwdkpBMG9sOE0vdFhJVCtYYmtrai9iWlVwMm9PRjM5Q0Nzckpz?=
 =?utf-8?B?K2VVU29nUE1PWmQvaGM2Q0V1ZnJRWTlUb1dNT09RLzMvWlkyamRmTWF1V3VB?=
 =?utf-8?B?NFdHTE8rQTloeVdPOEg4bFIzckwveXVxZC9tOUZiSlJ3ek5GU29DOVExdUE4?=
 =?utf-8?B?SHYxNCticE82U1Yzblk4UU84RGNsekFKaXlURGtlWDcwUit2eWsxQzdRUmVJ?=
 =?utf-8?B?SjJjdnFJc2hrYk80emp0ZGJxb0NNakczeTBaMkJOUFpLcnorVU94MzRUdnhH?=
 =?utf-8?B?UHBhTUU3UEdpZzFRUkdLYTBUazZvaWFmU3FCU280a1I1akxsRFFUKytFRHhv?=
 =?utf-8?B?dlhiTFljRVRBc2xmSlJaU3J6Tm94YTFnanJmSGlJUGpnV3RMeDIySk1STUcr?=
 =?utf-8?B?QXdURjRZK2VhNklZYlVWcHB6UFQxdUpGbmxvV1ZZbjA0WmNWdDRyVSthemNO?=
 =?utf-8?B?T3Jtc1lrZUhKbGUyMVVUME1ENlZRcnNJMjA2Z0phSUpQTk45dlBXejNScHZU?=
 =?utf-8?B?Vm9USUE0N292MHpXQ1drYk16K1hVV2ZVaGFLd3pHOWxnUUpGenFYaHBKWWtC?=
 =?utf-8?B?aGkyeVFMV2lTVUNmVkk1Z2gzTHk4N1VuWStRTkVEM0tJR1RLdVFnM2c3Y0Q2?=
 =?utf-8?B?SHVhcERJQmxVV1VjZDVyR1dGTlVwRnJLK0ZyYmthNW0rZ1ZpRFo5MkxQeGFF?=
 =?utf-8?B?WWtYdzlHUFJIVG9yWDZaUnRnbUx0aEFta1EzZ3NKcHpOUGVoNjgxUHdwVTJh?=
 =?utf-8?B?Sy9ZVkRCV1JGV09Wa2lvRW5zVnN6ZjM5RWt6d0xsTS9JemxUU29lMitQdHB0?=
 =?utf-8?B?WExxVk81b2RkRyt5NGtib1A5YjNLbTlDZXJpekUxTGF0RFJmZUJaSnNpVDBL?=
 =?utf-8?B?RFBtK2lwNDZxNUVBdHBkWitySG9PUGpsUEYvQ3MybEVNdkdOSFFLVVVZUmNj?=
 =?utf-8?B?OFpqcHo4VjlVZElhalk2V2xEa1RuOG1nNm1SK3pKNXZBakg4Y01OSDd6V3RM?=
 =?utf-8?B?bmRyeVNhTFdXeHNsSmNyNnA5S0hheXhKWU0wTjV5M1RwU0ZOREptaDRHWWov?=
 =?utf-8?B?WVpMSHJKQUgrSXhlU1dhODBpWHEyR001alFYYW1rNmFTYWp6elRRS3RtWW1U?=
 =?utf-8?B?aWUrK3I1UWRyaS9LazhSN0xNSUo2VjZZOXZDdHdFVFg0T1NJdHpzK0JkYjVk?=
 =?utf-8?B?ejJ2WkJicjEwRUNiazhXWklkbzZBYWZScDBtQ3ZOd2FHL0RCU2tIZ1ErVUpl?=
 =?utf-8?B?enErMGZNSG9sbUl0T2pSeGJzbDJkMW01MTR0WlUybnYxRDg0YVgrT0pFd3Fs?=
 =?utf-8?B?eG9BYWpmSGRwRnQ0RG5pZjlIM3l2M0xvWGI1QTFmQ2RwMU9PRTA4U0Z4ZUpF?=
 =?utf-8?B?alhYK1JLVDdHTzJvT1hmTWM0L09NdXcxZm04bzdxWlQraUpwZ2JZb0JURXhU?=
 =?utf-8?B?UG9DM2pGUmZWNktBd3RwR3pRV2xybWlVMllDM216VzhtVmo5elkrQmlLZCtL?=
 =?utf-8?B?THQ1TzQ1L0lhMjZZRXhTbXV3SGdHdTdUZmNPOW9lTTN2TUtTWUg4NzF6ZFo3?=
 =?utf-8?B?M2pscjRZSHdIY1A5NDMwMlNUUTdmWFF1QjN4UlU1Qm5MYzIyeUxnN2s3ZTUw?=
 =?utf-8?B?K2dyMEdLMWN4blNqYVdLdmJWS0NjRVNPVWhHL3pLd3VURmFzdFpnb3lsOVph?=
 =?utf-8?B?bUJXL041V0VaakUyeFBsNzdnZEJuNGxXMUFMMCtsd3pwZmY1YXRiLzRUajEz?=
 =?utf-8?B?NmJtckdlc0NlVVhWd0VpRy9XNmRqWTFDd2FlYXp4Y2VUL0dCNjViVTV5bGFw?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd05e4b2-bdf5-436a-4c8a-08dd18783780
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:37:56.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKsLKiMV4vQ6L/YFwASJzg+F0/a3AlaX0+BlbjV7qMNizPwwAvopxhSpmF5sF49+YRYSYy8oeniOKOj6WooiLZDWShfnKzJaPuWXceKNggk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7156

Hi Julien, Grygorii,

On 11/11/2024 12:33, Julien Grall wrote:
> Hi,
>
> On 01/11/2024 15:22, Grygorii Strashko wrote:
>> Hi
>>
>> I'd be apprcieated if could consider my comments below.
>>
>> On 30.09.24 14:47, Andrei Cherechesu (OSS) wrote:
>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>
>>> Introduce the SCMI layer to have some basic degree of awareness
>>> about SMC calls that are based on the ARM System Control and
>>> Management Interface (SCMI) specification (DEN0056E).
>>>
>>> The SCMI specification includes various protocols for managing
>>> system-level resources, such as: clocks, pins, reset, system power,
>>> power domains, performance domains, etc. The clients are named
>>> "SCMI agents" and the server is named "SCMI platform".
>>>
>>> Only support the shared-memory based transport with SMCs as
>>> the doorbell mechanism for notifying the platform. Also, this
>>> implementation only handles the "arm,scmi-smc" compatible,
>>> requiring the following properties:
>>>     - "arm,smc-id" (unique SMC ID)
>>>     - "shmem" (one or more phandles pointing to shmem zones
>>>     for each channel)
>>>
>>> The initialization is done as 'presmp_initcall', since we need
>>> SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
>>> If no "arm,scmi-smc" compatible node is found in Dom0's
>>> DT, the initialization fails silently, as it's not mandatory.
>>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>>> are not validated, as the SMC calls are only passed through
>>> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
>>> running.
>>>
>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>>   xen/arch/arm/Kconfig                |  10 ++
>>>   xen/arch/arm/Makefile               |   1 +
>>>   xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>>>   xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>>
>> Could it be moved in separate folder - for example "sci" or "firmware"?
>> There are definitely more SCMI specific code will be added in the future
>> as this solution is little bit too simplified.
>>
>>>   4 files changed, 226 insertions(+)
>>>   create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>>>   create mode 100644 xen/arch/arm/scmi-smc.c
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 323c967361..adf53e2de1 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>>>         not been emulated to their complete functionality. Enabling this might
>>>         result in unwanted/non-spec compliant behavior.
>>> +config SCMI_SMC
>>
>> Could you please rename it to clearly specify that it is only dom0/hwdom
>> specific? Like SCMI_SMC_DOM0 or SCMI_SMC_HW_DOM.
>
> I expect this series to be just a stop gap until we support SCMI for the VMs. Once this is merge, I don't expect we would want to keep a Kconfig to allow SCMI just for dom0. Therefore, I am not entirely convinced the proposed new name is a good idea.

AFAIU, Julien, you don't agree with renaming the config, nor with moving the
support to a separate folder since it's something temporary? That's my view
as well.

These changes do not introduce support for a layer of mediators for
interacting with system firmware, but only for one simplified implementation.
So I suppose the patch set that adds that support also creates the folder
(named 'sci' - per Gregorii's proposal - or 'firmware' to align with Linux),
and the required config.

But I'm up for doing whatever you consider more suitable.

>
>
>>
>>> +    bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
>>> +    default y
>>> +    help
>>> +      This option enables basic awareness for SCMI calls using SMC as
>>> +      doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>>> +      compatible only). The value of "arm,smc-id" DT property from SCMI
>>> +      firmware node is used to trap and forward corresponding SCMI SMCs
>>> +      to firmware running at EL3, if the call comes from Dom0.
>>> +
>>>   endmenu
>>>   menu "ARM errata workaround via the alternative framework"
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 7792bff597..b85ad9c13f 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>>>   obj-y += physdev.o
>>>   obj-y += processor.o
>>>   obj-y += psci.o
>>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>>>   obj-y += setup.o
>>>   obj-y += shutdown.o
>>>   obj-y += smp.o
>>> diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/ include/asm/scmi-smc.h
>>> new file mode 100644
>>> index 0000000000..c6c0079e86
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/scmi-smc.h
>>> @@ -0,0 +1,52 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * xen/arch/arm/include/asm/scmi-smc.h
>>> + *
>>> + * ARM System Control and Management Interface (SCMI) over SMC
>>> + * Generic handling layer
>>> + *
>>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>> + * Copyright 2024 NXP
>>> + */
>>> +
>>> +#ifndef __ASM_SCMI_SMC_H__
>>> +#define __ASM_SCMI_SMC_H__
>>> +
>>> +#include <xen/types.h>
>>> +#include <asm/regs.h>
>>> +
>>> +#ifdef CONFIG_SCMI_SMC
>>> +
>>> +bool scmi_is_enabled(void);
>>> +bool scmi_is_valid_smc_id(uint32_t fid);
>>> +bool scmi_handle_smc(struct cpu_user_regs *regs);
>>> +
>>> +#else
>>> +
>>> +static inline bool scmi_is_enabled(void)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +static inline bool scmi_is_valid_smc_id(uint32_t fid)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
>>
>> I propose to add "struct domain *d" as the first parameter to make it
>> more abstract from Xen internals.
>
> I am not sure to understand why we would want the call to be more abstract. This function should *only* act on the vCPU currently loaded. So it makes sense to use "current->domain".

So this should stay the same, right?

@Grygorii,

Regarding `scmi_is_valid_smc_id()`, I will make it private to the
SCMI-SMC driver.

And regarding squashing [v2,4/8] to [v2,3/8], IMO it is clearer
this way: to have the implementation of the driver in a different
commit than the usage/refactorings needed to accomodate it. And
this makes it easier to revert the behaviour too, eventually. But
I don't have a strong preference on this and I'm open to squash
the commits if you believe it is better that way.

>
> Cheers,
>

Regards,
Andrei Cherechesu


