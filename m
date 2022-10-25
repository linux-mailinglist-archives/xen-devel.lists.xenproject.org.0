Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3060D131
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429953.681320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMLJ-0002Wd-Tc; Tue, 25 Oct 2022 15:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429953.681320; Tue, 25 Oct 2022 15:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMLJ-0002TY-Q7; Tue, 25 Oct 2022 15:59:53 +0000
Received: by outflank-mailman (input) for mailman id 429953;
 Tue, 25 Oct 2022 15:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1VE=22=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onMLH-0002RQ-EU
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:59:51 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2056.outbound.protection.outlook.com [40.107.212.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e1f00ad-547e-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 17:59:50 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 25 Oct
 2022 15:59:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 15:59:46 +0000
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
X-Inumbo-ID: 0e1f00ad-547e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpeVi+50FmrkXED0Rn71IsDBCpmYLonoHRSFOomF0pBEruzOpjXS1nZ8IlXeBKcAMoKqPDKFSVEqdcVCkUXNLpA8Yg3phxq0m/FTm3Ea/SuduGvKpBA9sHr/M3Wu7By5lbjfxsB3pLo/gjALYIvLo7ESNu3xaNQ9FkhQQkJRYhlwuvYQTPhqtGbD8nZBh+C2Idy/eM1L4l6rKKLJa/O+gOYmCk47Odcr+gCz6k75jsqnerJA6cE+LWvP7+gE5R/P8SsqqaRbk5lYjylKWqWYbKz39niXY93dPGr0Q/9FEJl898weDQCtER5+lhx/w5hPJQQcV1rkOdmtIR/C7xAGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCQKQzD5HwavRhiH24ue/a+nJT22VYAuQrHCwGp/X5o=;
 b=koOC/5iLi2q8zjCJNTNKC22ZDdCJnz00YEFGGSMM61g+UayE1C8p6BpVs1CwaVufGK3Nyq8klrqQSvGqRe4LzTyZlGMOB7jjuulbHC/CV/gYiAS5AIcB9I93Ujd+S4MZgnEqiXm2GgCbnR6pNjAvg7hpWI+ND7GvMgke72BnHqxgA4A+rCI/xfmJmlEhMMcx5A58W7phQwMT/5oBh9PnfZwuYtjpmrDQNwBuU3CtP+GTCIbYKGZEmSxztt6q4fPRO4lmspj7InhRqtMTKVzMQUY/xchClQNVYeDlqRW/Ss+lZ1SWTfaq8gPtb9ahKat+gcleiY9Uf5RUffG+j1p+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCQKQzD5HwavRhiH24ue/a+nJT22VYAuQrHCwGp/X5o=;
 b=p7atjMIeZWTeNEJra4WorITOB2xbQWC2ifkQcvQB/RSh8Q9y9R376NT9XvLZ2tlFKak+YCG5+7tr9oYYBuTtBzNjoyJo+rHV+wZ3lm7kCVfUNd2EA5jIBwjyrtXvOMlEt9j9PSo0NhWyIxWYp+9uNg2eM4m2FLlkzvGMYPwTvpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6799b845-08a8-3f4b-1695-d4d198833636@amd.com>
Date: Tue, 25 Oct 2022 16:59:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 03/12] Arm: GICv3: Enable vreg_reg64_* macros for
 AArch32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-4-ayankuma@amd.com>
 <19fc76cf-cdf2-0321-8336-7c5a7fb09406@xen.org>
 <e952fcd7-bab6-68ed-d884-6505e529a073@amd.com>
 <b0b4fc69-3da3-3229-77d9-9fe0f4bf1ec3@xen.org>
 <a27873a3-3697-9a67-16aa-f4340dc622aa@amd.com>
 <e083c3c3-3978-4339-ab5b-030d32d05325@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e083c3c3-3978-4339-ab5b-030d32d05325@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 172ee128-0ea3-4b89-5454-08dab6a1f01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M4eGCMfEoGK5lZGWotEUpsiXxdesHJwRE3dLWdApSRSdDiaktBvNnq59sZI5fFe3eBUOoSqW6kkrt35B351uZyhhFYOnsKJ8pHCqwQ+En/NkAaQrm7qdVgx68/Ew06+h7+EDrWO7mZ+RAu51Uv5UhFUlsLo/08fCegi4HvI1w2lseGpmj+CPzRxr+2fKmed6YmXRsyWzVE1/Vcmy4xi10W8mXr3+WVn6CpEb+vYdzFxC8Mb2Li/zjwXZSuJ/lZP2MxMkBADY3aA1PYbMOI+fv9BUF2K/itH2LZSsLLD3wV4++w8T/3SQ8LFsIyNg4DcgFN3xqCYzHDbJYRXGeryrtIffbbet3wTTze35RdE4CuxSomHblTKgsk88yCL8h8WRqRTG09s8ltaZbLgy91vm6w+EZ8+oWkH/zyuwRzYTgBugs8vHmc7jdss7kLrGDWmC/krDEIVFXWqusuR0by/GoCgkv/CgTWKZwK0162K02VFOX9PtZGJLPMXKo7cCuldaFTbNdWV+TYwcmeKwILmA4vwwbyv2wsVcjYxLwcA2sZkI8bauzYeesA86+mjEbJ22DK0mBwlrfy6x3RkbSwHol1Dx0zwP/APgVbtVNiW/z73Qk4Nqne/S7PvlO+PskJYmWKWNkBnBFKbG01pBObws8+hep2jJltFjFWuUqnV/iMoMvjMYu/kfzFOcS6DIgi6PEIRc1r1JP/9REH6C+Gh83DTR4h8y6TxGHw61hI1DoRCA33I0hT2XX/7uFUYIR6dLFx8ZUU5su2M6dVPpJbX10aNPH4h0Sb+u91khlCgX8co=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(31686004)(38100700002)(4744005)(8936002)(5660300002)(186003)(2906002)(83380400001)(31696002)(26005)(6512007)(478600001)(2616005)(6486002)(4326008)(316002)(66946007)(8676002)(66476007)(66556008)(41300700001)(6666004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBrRkVVSEZueUtXZXNReThGVStJUkVRL3ZFT09XZG1LZ2t1dWVlWmJpMm5z?=
 =?utf-8?B?K3dRY1pTQnJqa01iemorc2hhQnpKSlhNdXQ3azN5MkkreEZSUFdrMU9CbCto?=
 =?utf-8?B?a2k3ZWoyWHR2RU1XNUxQT3ExZW5zWDQweDI5RzhUSFpEUXR4TXBSNG82RTUw?=
 =?utf-8?B?Z2ZDeHNzLzZxMkZJeGI5UWoxY0NWRjJmRHA2UHlwWEZEeW9WaEs0cDFPWHk2?=
 =?utf-8?B?QnM4OUpBckIrK0U3OWFDMWRDeHArd05CdDhDVXVTdWx2aUo1VEZXLzFpL1BH?=
 =?utf-8?B?dXhkcmZMZHQwTUphUUdoZjgyR2hPdFdMYWlGKy9KYTViRUdWRitjM2pIU1li?=
 =?utf-8?B?cjBjeTJ4SDcwaExvNUxTZ0c4SEN1QjRSdzZlVEhCbzFZVXR1cVp1Q1dTUnFv?=
 =?utf-8?B?dUFlYkNlTE1ickF6VVIvYm54UWZFUnFkcDREZUozcTgrdnlLWnYwbUxDYmpi?=
 =?utf-8?B?UEhNbGxOQ3Zpd2ZqYVc4WWl3WWJ4ZW1SZ0YzZ09HcHFndUcyL08rd1dJOGth?=
 =?utf-8?B?VExHbEQzZk84K2xyVlFuZHg2RjI4NHhZUW0ySHQ4ZXYwc05CUFR6ZE5JYUVB?=
 =?utf-8?B?bUpoZy9yM0wxMk1uWWt4VUUwWklUWmx6RjRKVDBvako1ZS84MS9PRk9mekdN?=
 =?utf-8?B?dW5uU1Erd1d2ejJlVStZY0NrdDNpNm5ZUDZ0WVRyaUxNbFVmQ2d6QTQxOHdw?=
 =?utf-8?B?ZkxYcXcrbWxYbVJRVzVaelVOelcwSUFuREJGMGxPMzFZb2lIRXE0cW83bGNh?=
 =?utf-8?B?RHU2RDlvV0I3L0JGTlJBdXBQZGV2OW9kVXJiZHRPeHpyRW1TNHdLVEp6ZHM5?=
 =?utf-8?B?SUhIdm15K1RpNXhma2JWS3ZORWI3aDI4NFU1QVA4M2xwNENyZ1h2U2hzMDNv?=
 =?utf-8?B?aEFjZ0dIdEg1Z2xvdzgzQUVZbEgrcDJFNllEek5rcy9EZjZNcTNYNjZuNkdm?=
 =?utf-8?B?L2kyZCtFckFCRXI3cUIvK2VVRWlNWU93MndGcmVpSVRMSThsYmhMRDIvM0RZ?=
 =?utf-8?B?bmorczhPS0tMeGpRbWt4QXVFR0JxaU9HQnVkOFdkZy9nNDBhYXpBQmFGT2R2?=
 =?utf-8?B?QkFaK0tBWmY3V1Bja2NTd2RSN2pPN2JudUhMclhrcnN2cEUrMzYzcUNMVUFI?=
 =?utf-8?B?VTVVZFZ5R3k0TnNDdzczOFFQZDlrMmJ4SmNXNWFQK0JuZS9YeXl3RjFSRzVD?=
 =?utf-8?B?QjR0MDRhSWJBdUxhR0E1ZHErUVZNYXpyN1lINHpveWQ3SG0vUWtabmFkc1pE?=
 =?utf-8?B?NEU5bHJvVU16K0lDYjZnR3NPd2l0aWZaTTVwV2RwZktKZW9yNStJRW01TUd3?=
 =?utf-8?B?NitRMEYzblkvV3RRV2dWcnJpY0xkYisrSStrdWRkRmNINHBjSXhyOUd2Y3I3?=
 =?utf-8?B?RWtRVnhUWnVUdUpvUCtmRCs0TkJTaUhsL3lBUll0dWRqYnpTL1BMc3pnck1u?=
 =?utf-8?B?bUZVT25CbFVJMVUyM0ovTlBzZGFocDA0R1Nha3dKWHUvOFFZM3pZZ3BsNHNw?=
 =?utf-8?B?aS93eWxveFZ6bVVLY0ZvaG02b1NHQStoL1RTTHlTSVRHaVZvVlNRWmczaDEw?=
 =?utf-8?B?UVRQWElMNy9GcE1KanAyZ2V6YU1yM2IwSmVCeitucGdQWmZBTWpCYUZDdEsx?=
 =?utf-8?B?V1QrbnQ2KzFGZ3pIR09ub2ZTUTFpNEFpYWNPRURmcUkvdk4vWmJFNmJ5bmR6?=
 =?utf-8?B?VjFDRjAvZldXSHFlcUxjb0Z3VkRBNlM3a1NpTFRGUEN3WVdsWENoN3puYUda?=
 =?utf-8?B?ZzM0bnJGUHA3TFpEUlh3RTlLK2dtWVdBT0phSElzRTdFKzg4engvWjdmVnNW?=
 =?utf-8?B?UCt6OXpPSTVDMDI2R3A3bzNTVWszaHJ4cUVWNEZEMlRFYTZIVXlWL1laY2RK?=
 =?utf-8?B?ckdDN0g4alJ0UXZrUE1hU285Vy9rMlJ2aUNjN1d1blArRDZaMGdqZ2FEdU1W?=
 =?utf-8?B?aHhpKzh6cmt2KzRIZzFQazNYUlNrdkI1QlY5QmtCWFlaL1N4OWN5dlZmZHVD?=
 =?utf-8?B?ZDBWR3RuRGpDQ1gvdmUzeUY2bFNKdFdjVmMzNmpIbHQwOHk5QyttbXZDb0g5?=
 =?utf-8?B?S2tnbmhTR0xvWStjL2NOVDhjRXZQRUtkODJ0QWdMc2ltc2xJNUNwVDlDRHVq?=
 =?utf-8?Q?wD3pjoW3rJLcbwUXdOVLWYXQM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172ee128-0ea3-4b89-5454-08dab6a1f01a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:59:46.2781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9ywPWxFG7lXh0S/FqAZ+uQoIV3oDGgrbS4Zxv8xI/bmO6BUYQrW8CC7ZIgeQwEvClocHQXbmcKweYJ3QkI8zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397

Hi Julien,

> static inline void vreg_reg##sz##_update(uint##sz##_t *reg,
>                                          register_t val,
>                                          const mmio_info_t *info)
> {
>     uint##sz##_t tmp = *reg;
Drop this as we don't use tmp.
> uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);
> unsigned int offset = info->gap & (offsetmask);
       int shift = offset * 8;
>
>     *reg &= ~(mask << shift);
>     *reg |= ((uint##sz##_t)val & mask) << shift;
> }

I think this is correct. Except for an improvement (as above).

Also, we will always keep this defined for both Arm32 and Arm64

VREG_REG_HELPERS(32, 0x3);
VREG_REG_HELPERS(64, 0x7);

- Ayan


