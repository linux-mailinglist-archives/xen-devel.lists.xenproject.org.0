Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF7A716F2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 13:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927779.1330521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQGc-0004WG-Jr; Wed, 26 Mar 2025 12:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927779.1330521; Wed, 26 Mar 2025 12:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQGc-0004UZ-GX; Wed, 26 Mar 2025 12:53:58 +0000
Received: by outflank-mailman (input) for mailman id 927779;
 Wed, 26 Mar 2025 12:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txQGa-0004UT-OQ
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 12:53:56 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2413::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0e62e0-0a41-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 13:53:53 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB9347.namprd12.prod.outlook.com (2603:10b6:8:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 12:53:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 12:53:49 +0000
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
X-Inumbo-ID: 5e0e62e0-0a41-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCI+0tRdyJOQXeH6u6oIe5+CjSYRbJ9XEsa+0advFoUHGnCmWie7z0eNrMPeY8AJl+cRnp9vdY3+5M73G+15VbBRMBTpaIsqmDRhKywZyc2cbyqXDiAH02XMLtBLXcJI14AEGzYiINTzkTwidGyczQY+9IOx2p5qMFl1pOmUXMzjtelanxWY/6HhZroUxC5r5Tfl5Ii8S+T97gkbtrLWlBUsItAxcCd+nVKfuiia5fy5Te3SorjJJ1g/N7fE1pbxbPwi8g9r0Ph1mmacbQX+wxUWOZ870cT5OIsdGWJWvOpicpn2FyBbfaFMX3he7jVE22kBF+YWLIY19yfS5DTLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSVdtHq9L9L9ILq42plcHn8K4YwO7lvmIw42K3Yi0a0=;
 b=TklYGBwdcOhyljchHywJP5MjNDRuiOZdWpJFOobr+Z1S97nNxVnAPmEsdTSZRq1RYO9kMMEaCXDLDv5rVnpr9onU2iBCAaXiFqFyZrzsprGFyTbV9dWSmTK9xU/2VU0fFOUHgaytnVie5wtuqqYlpGCnhMonNA8FeXzRWlDd9gXFb1x/FuqfATpkn11BIDrAadfaTKKP8xFCfdB/Pkom/YbAt4RmFne9WYHkC4LnnrGvjYHkyOfKEpLAunW5da3LTSwLbZzYbVOtZUa71aJiVvCRU/3gn+Qo1zeDxbeFzfm2fa9zGk6ZuBhg3kJHkgvRo+J3CeDXdR+oZA/0SgKHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSVdtHq9L9L9ILq42plcHn8K4YwO7lvmIw42K3Yi0a0=;
 b=R1553ZXef1ZOdPAAXmp64bbScdbNLnT/K3yIyzJUPxMHaTXApb/E62Z4tRp4jq1pQwyUeHOzGlAlMrOmMFKkuVo9Za695eu/UjpB/efIA1ZjEf9r9DwRFX+QKsT+PK+IPKzKOJj8JWxRnT3IMw1c24+yoU+U+Ph8Y4ncR5XrImw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7b6698a7-f9ea-4ffe-94cb-c30244bf8cc2@amd.com>
Date: Wed, 26 Mar 2025 13:53:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM/vgic: Use for_each_set_bit() in
 vgic_mmio_write_sgir()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250314212153.136154-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250314212153.136154-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0335.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb59159-300a-4a3c-1bad-08dd6c6540eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTB1M2NUcjlxQWdqSnJ3T293QTRWZU5DcmtKZ2R3K2RjQTlkWWFrdUZ2eFFU?=
 =?utf-8?B?ciswUlM5WlRleUhBNSt1emZxRnlvZC9KR1ZON0ZRaFVDSHIwL1A2LzIzc2Jy?=
 =?utf-8?B?dEpqRHAzOWlMNUZpMXFFWExSVkd2SUs4QzRPMTFFWThHVkZwdE0ySTlYQ3FX?=
 =?utf-8?B?RXZvNTU1MmNWT01GcFpGNnFkZDVPOHpmQ05pMmVVbGFVZks4UlVSOTFremVF?=
 =?utf-8?B?b3RGOFlCYWRKYUdNbitFMFowZHVMR2RWQ2p4bDhPV0JXKzNnV01IYXpWR0xJ?=
 =?utf-8?B?YjlWMENja0J4eFM3NktBUlRCcnBOaW1ZSFpmM29QOGdGZFZXTlZEdVdWQTNu?=
 =?utf-8?B?dVJIWWl3NXlmYVZQajJOb3d4LzU2YjBVNHZzU1RxeGJ4YTBJZWY3cjdVRjl3?=
 =?utf-8?B?N0xoOSt4S3pCRytnaWkvemZudk9Mc1JKWHFjbzBPODkwOHhkUG9wYXNuN0po?=
 =?utf-8?B?RDdhMzFHVmpkYVQ0aXE0bWRvRjR3R0RQU0lKWEFLdkd2dlF0ZFFSSkU5NFg3?=
 =?utf-8?B?ZEF6MnlmTHZCdDR3NmtpcGdNZ2VTSE1lMnNBR0c2dXh0d0V4T24wMDB4R1Vm?=
 =?utf-8?B?NVFLRUtjVFROL0tYb0cwUHN5eXhPc2UxY1pGT2JIN3k0c2hOeWY1V2FKRXQ1?=
 =?utf-8?B?RnZOKzJlRXZoeUNJM0M5S2lGZmNjQWVxM0Q4bXZKK3V3UnZMNisrUlVOTG5z?=
 =?utf-8?B?UGt4TEJaK2ZyU3h0MnI1ZGZHdTBOVERNME9YbHFlV2VvU21UUktNM09YV05t?=
 =?utf-8?B?ZDdZYThIenVsek1VRk5qOVozZE83M0VVZy9WamVvY1NNNDhSNWNIV09hNHFu?=
 =?utf-8?B?aVVWWU5ORmovY01xUWIyR2hFei82OXNhdDUvZ1VTdFhDbFIxSEkwN2RIa2Y0?=
 =?utf-8?B?U1VnSTdTMjJSL09YbWYwY3M5VUJnU3NXMmtiR3VGaDBtRm1mTmUrRVdpNkN1?=
 =?utf-8?B?eFZRV3Y5c05oV01OUTZQNU5mU3ZJY2JSQ1pIWE54NTJHRDIxcFQ1Y2ZYMjNQ?=
 =?utf-8?B?UHJGZDlPTzdwQW1sRWt5KzV2TGgxZXR0ZkJPMUo0VXcvdmNScEU1dlJWQWI2?=
 =?utf-8?B?WUdzMG5Fc1NNWllveEZaVlpiZmtkM2VSSVMra0p3L0huZVQrUGxLVWhzZ1pY?=
 =?utf-8?B?eHpNSVU5NGhrYjV4L2lpZzluVlRwYkI0Ym5ROVdVVFJtcVY5RHhrZVdwbTND?=
 =?utf-8?B?N1NNOEJQUFpnN3VkRzVYRzVmM0ZjVlN1NzYwODVUQklleERja3lCdlNYYnZp?=
 =?utf-8?B?OHpoUXl2L0YxVU1PaHlQRmVSazUzeS9Sb1dubEtJY0xmZDQwT1hQMGVRaENG?=
 =?utf-8?B?OTAxM2p6UUx3MkpVY2JEUGVvYzNPR2FzeEMvK3FDSlNKUGRNWXNKN2g2SDI3?=
 =?utf-8?B?aU9nSnVCY3AxMmp1bU04MVBZM1RRb01pNmQ3WDE4TnRNemxiTjE3MVo2WnFn?=
 =?utf-8?B?UmpDZ0pVNy9kZVZiR1JtcFlMc0dMSWJ5Q1NrRndiNU5lc3NNUjcyVHErcGRC?=
 =?utf-8?B?NG9mdFoxRi9hbERXUGo0THltdlhZeE1QS2V4czRLQjNpaE0wU0t4NGVocG9i?=
 =?utf-8?B?NkZNSlpnZitTbU40TWRDM2Q5anBnU0dPNC8wd3JqS0UrTUJmMG5BRzRtOWxv?=
 =?utf-8?B?TlVvY1l1UlExTS9qMW1BSW9USU10dk1jK005V01rMnl5VjJzdUhFSG9CVHJT?=
 =?utf-8?B?K2dPc3JhdGZ1RFJVTlpqc0NIWTRSdHNqSUQrNVg5U25wMG9YeURqUDZrWjdU?=
 =?utf-8?B?QkExV3dYOVk1TnlERTNiSDE1MVY3aUdrT25zUVhYNW1yckZuZm5vcDdaakdp?=
 =?utf-8?B?NlYvdE8zb3Y5OHZqNmtJQ1FCQjQva1ZkQ3ZJUkdKdEZreU9vN09EVXNNUGJC?=
 =?utf-8?Q?BEkvrCOzTeCki?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3B3QXo5UEwzVDQxcU5rK3J3Vm9EbHlvZFR0MnJoK3dsSG5lZmV6U0p5RVJH?=
 =?utf-8?B?K2JmbEVJWDRJTnlYOVhMT2tuOW5idzVuUC9LNlBYSjdzMVd4WWxCSXdjK3l5?=
 =?utf-8?B?NUxWUVhqbXFxZi93M0VsY0VDaU5SVHFxNnBrdkVhTTlPRzFNMkhXblRLblkr?=
 =?utf-8?B?RnRqWW45TmpTcWxKcDFXN2pNb3YydEllSzJMbCt6WUE2cmhZUVU2ZzZUdHlr?=
 =?utf-8?B?QmxFYnBKY3pwUVU0YlFjVEJaYzFUclBGWCtwM0t0eXk4MFh6K1hkOVcwbmVD?=
 =?utf-8?B?dWdSS1RqeG90MG5HdDRKamJ1cjl4WXVUSElETUplVWFZYnc5ZEdYdVFoOFVY?=
 =?utf-8?B?OXRYWTV3bHFoQ0tIQ2dvZTI0MnRLblFjQ1J1eFFoQTdWN0xXVlo0MUIzc1FN?=
 =?utf-8?B?OUdiMExrTjVzanNxSXFzbkpKeXB3MG9BT0JFRHVUTVZBRXY2Vjdla2ZVZ2g5?=
 =?utf-8?B?MUdNV3kvcUJTU2NoOTg0bTJnbGVDVEFjNXlHLy9KbnZMeDFKL3BFd3ZqakdS?=
 =?utf-8?B?eDNPTCtuYkFVSHVJRU5MSFhtYlpGeTY3WVRpL0NYT1dmRnZDUHFxZzRRVFIx?=
 =?utf-8?B?RlRyRVRZU0l1elZMb0hNcDhCaUM0cVhrSkpVR0YrTVBGTTRZL3VJelpEZHBn?=
 =?utf-8?B?NmhlUFZNb09XTE5lTFc0RTZROGdKbVdLVjhDMDNCeXk1cWpjYm40ekhDS1NI?=
 =?utf-8?B?NlR4MTI4QTAwNThFeGRGN0xQUXpST0lDdjkyVm9VaW9rME1aMmVjbUFrR1ov?=
 =?utf-8?B?ZDBoWkhVaU5xMldGV1d3WEFjMXFDOE5ISEdQa0xkRUlLSHZxWW4yWThuY0k2?=
 =?utf-8?B?YWdQN3ZCOEpLUVNRUFBRbis3SEhPejJoNE5PYnFpQU53ci93d1FSOEEyZ096?=
 =?utf-8?B?dTRSU1VNdnYwYThzK3o4Z3RrcnJQY2FXcjcxcnB5K0IzdVQ5Q0RlT0FxNmxH?=
 =?utf-8?B?MVVkTHZjOXlnRXVJY3hwY1QwTktzZnJjWXd2OWpkeWt2ZkUrbEVuM2dheDFU?=
 =?utf-8?B?Skk3OVhkSFRWRVZabDFXbFpXbk13V0VyYWVvSUlRdEU3ek5mUXdoZDUyR1VR?=
 =?utf-8?B?enRLQm45bUdHV3VSZERzNmZ0MndmbnNRNzB5UXZURmxPVDhzbmI0RXVsc0Vz?=
 =?utf-8?B?cmkyNFNXVlJYZWlWa3pnZENEM0Rvcy9KRVljWXV6amduclBiUWNNL0oxNE5W?=
 =?utf-8?B?clpRL0czS0R4SEk1cDVjNW8xelJ2cEl6SHhScXMwRUtwcUpNdTFGZmJwdXpI?=
 =?utf-8?B?MDZad00xU2JDOG1pZklTaGw4Z1lTSURHMlFUd2JrNWhxdE1zTU13Y0ZObWxH?=
 =?utf-8?B?eDNQVldrSkNPblF5YXE2djltV0NXVlZ3dnRvamQ3RHMyS3VhV2pBYnZhMkZl?=
 =?utf-8?B?RmJvSDlOUTEzNy9RVzdYZlFQL1p3Wk5lRVk3ODdZcDdjUnFhenN1SkRUSUJL?=
 =?utf-8?B?WE1JTW8xYUFDVVBEVTFkVDZWMVpFMzc3K2w4ZWI3blZRVTUyd0pRV2xuR2J2?=
 =?utf-8?B?TFR0d2E0ZWc2R1Fsb1JNZ1ZodEJwRCtIVlR1SlZ3ZGxmdDE4b3JWMWRiMDBv?=
 =?utf-8?B?WHF6QnhGTDR5RFd0S0RCZ2pXOTJVQXlXZkp3blFvOXlxT1VrZUNvMzhxdld3?=
 =?utf-8?B?OTRTamtsZTBBQnNFTEtWTjY4cDVwSWNWNU45R25VNnJ3aDVzWmxNa1VQLzNw?=
 =?utf-8?B?TFdINDhyWE9kNy9kbW10SFRRbjliZGIxYlQxTkVWdkNYaUVySWZ6OGp5Vk05?=
 =?utf-8?B?aXdPVm8zM2RJZ1RDTjRvS0FRVVVDdjBkd2pMbDR6ZGxUQmZNSXRLV3FDZEta?=
 =?utf-8?B?bkdoTzcwSmorTXEzQXFCb3NHZkZzcmZzQ3djREdnalQyM3ZURW11TFhQZ2RI?=
 =?utf-8?B?WC8vazVRdk1NLzMwVHJ6bkFPN3N1aDZmYjI5VWpla3RXayt5VHZ1MEtxWUNF?=
 =?utf-8?B?VjBnTXI2S2pDeWhGN2dNVlllUi9zNnhaczBKYy9XK09sRmZicUZTVHp6TElI?=
 =?utf-8?B?Uld4enBVOUd5WDB3YW5ncG9jV2sxMVJvYUdGT0JNRWF1YWZQL2g1M1JwMUZ5?=
 =?utf-8?B?aktZdEp1MXhoT3pqWmxGMU1wcFZJOFFubFdIWmpINExQQW14R2g2SHhoZ2d1?=
 =?utf-8?Q?6sle6yAAV2lOj6nRLzVor7MtT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb59159-300a-4a3c-1bad-08dd6c6540eb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 12:53:49.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyjrtjWRkA9aEzIVVbxpJ1CWtheRu4q9lJRO2x/YkF7rsIB3bdoaMNgLw7+tH43w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9347



On 14/03/2025 22:21, Andrew Cooper wrote:
> 
> 
> The bitmap_for_each() expression only inspects the bottom 8 bits of targets.
> Change it's type to uint8_t and use for_each_set_bit() which is more efficient
> over scalars.
> 
> GICD_SGI_TARGET_LIST_MASK is 2 bits wide.  Two cases discard the prior
> calculation, and one case exits early.
NIT: I'd add ... calculation of targets. I had to read it couple times to
understand.

> 
> Therefore, move the GICD_SGI_TARGET_MASK calculation into the only case which
> wants it, and use MASK_EXTR() to simplify the expression.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> v2:
>  * Split out of prior VGIC work as it's somewhat standalone.
>  * Leave the case labels as they were.
> ---
>  xen/arch/arm/vgic/vgic-mmio-v2.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
> index 670b335db2c3..da62a8078b5f 100644
> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> @@ -88,13 +88,12 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
>      struct domain *d = source_vcpu->domain;
>      unsigned int nr_vcpus = d->max_vcpus;
>      unsigned int intid = val & GICD_SGI_INTID_MASK;
> -    unsigned long targets = (val & GICD_SGI_TARGET_MASK) >>
> -                            GICD_SGI_TARGET_SHIFT;
> -    unsigned int vcpu_id;
> +    uint8_t targets = 0;
> 
>      switch ( val & GICD_SGI_TARGET_LIST_MASK )
>      {
>      case GICD_SGI_TARGET_LIST:                    /* as specified by targets */
> +        targets = MASK_EXTR(val, GICD_SGI_TARGET_MASK);
>          targets &= GENMASK(nr_vcpus - 1, 0);      /* limit to existing VCPUs */
>          break;
>      case GICD_SGI_TARGET_OTHERS:
> @@ -104,11 +103,12 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
>      case GICD_SGI_TARGET_SELF:                    /* this very vCPU only */
>          targets = (1U << source_vcpu->vcpu_id);
>          break;
> -    case 0x3:                                     /* reserved */
AFAICT 0x3 would not be even possible to trigger. It should have been 0x3<<24.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


