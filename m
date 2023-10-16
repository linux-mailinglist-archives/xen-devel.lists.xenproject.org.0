Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562D7CACDB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617710.960588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP7s-0008Vp-7u; Mon, 16 Oct 2023 15:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617710.960588; Mon, 16 Oct 2023 15:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP7s-0008Sp-3u; Mon, 16 Oct 2023 15:03:24 +0000
Received: by outflank-mailman (input) for mailman id 617710;
 Mon, 16 Oct 2023 15:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsP7q-0008Sj-Eb
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:03:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 257618bd-6c35-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:03:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:03:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:03:19 +0000
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
X-Inumbo-ID: 257618bd-6c35-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mycsJGhfRCrZSwFZev4sNtA2J0Yr/LaDfk2yzFkKjVekbysu4g06GeKsdTk0QMwpLCYC2kq8pMcL0k2lrJkyIbCw0/F9r5tM8Nj7rT7atju4/jBL4fPLhYk/2r8n8BpHWrtHgThmzy59t+UVyYJBl/y+3I5OzlisCmbih+APId6MoVOPgoISz0ujQEGniUqLIFD04TQ4VcIQWJRdI7AsYAWAB/IMN8qcpfoBXGPmxeYMCcTP4YWjEMg1gtbxAEdPI26Jj4G0IcK30+cQW3kVx/F2HiBctZCZO6HF44f7ZQfHWkgCbElpHYWWtSzXar6IEkwIvMuJT00J3qh2vicBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU5HIoi95UL4N/1p0yZPLe3uRfBIYW3N3Uf3GNeXf5s=;
 b=XxpiAtOduDLqCs2KRMlqbH4tzwoiAl0k2v8G5FDwvUhw6ryj6+F99i+LPmmQcL0ih4UGp0UH/fgFcGXjDuZbk0kAue1lSXdDpZcIR7s0Iv8HbyCPKtN2yRbpq70l3JXhF/JE0Jt3CRbgUteeuQKipLIY+lqzE3C7zk+a2PVIpOgaa7eIl2t7HyWgEYZ+Nt64xXvZEPPJSBMY490JniI9127g5NNRXHD8AFQC+yVAwKbT5wyJPRqRs+e8qxsJPwuDNctZzGEBzs8Rw8xffZKenzBxaFec4IJ9S7yn4tQvDSSnqttIsxAll5XDgoMcD3xD9qaWFQG+p5EM+wc67O6Vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU5HIoi95UL4N/1p0yZPLe3uRfBIYW3N3Uf3GNeXf5s=;
 b=lxfyDUQquRSSI6QFwNIRPsGCxgApUJIO4cw+UHiHluYNHtqVs7TMuQn/rAgcGVb0HKRFd08measMu8gOCc2Jh7RA1jR1cdlmlURFyZrodhXBcv2LWhzl8D7i7SWhyjHY9zP+rqxl6xCJlUhuMGLS5snEjX8BrIE/G1wBDjjBxgDFQB045IUB/Or5I9xDXY4bXwmZmj88NKOxmkbXRSlhMoeGde4GyJ6Hk/7op2BPKZnSa+ZXL0bhjSZM/hwGoxdTqwIzr6w763NY3t3Y+Iol8QeuRK31yrdzvEgBGHo9Xoe5TPvn59BnpEoXASzZE5zOuqm9hEn5S6gSv0UTvwZziQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a77c0ca0-7ed5-4c46-94d4-b4c5e57f506e@suse.com>
Date: Mon, 16 Oct 2023 17:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] x86/msi: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d8023a832f77dc872a92e71c4df2da39ddbe06b0.1695978595.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2309291351012.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309291351012.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d3d7f9-ac3f-4554-dbfb-08dbce59085a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lxxn7hhCOgAY2Iptog4S61HQHhLJgJdqfv6FjNRLrpv+cteM5RrjeTJMfiV9sRefw5HlTce1mqSAeAbscOO5lUiwXnpsPTU0UVGWHyqxDP7T+iErMOXHShYGC/sqGXU9vKYsgT9POVMVDOfTS8slkoYWBdbZGFu9DU1QqmWNp0mrKpbZqKOecbboMZvj3DPNdu3Asx5JvuAmv56Po/RmRJj0TKJO6TiWDs6TtEkA6LiDcyA2voIBExBVvUyO2E59s/tFr/t5IKwyBYwBI58ts3MGMNXsolokGWxFgSpAVxHKbXrbaBlhZDjf9ckeXq/TmpszktPXKtERQrfvXqLLxByjLpZYhxX2EapwFWXSZXVvkg01hDQeHfBpiFnFyy4CK7bRQ4tGbEVKtRA2nXUS04zr+VLV+Kk5hC0xFP01M3K5CdFzfkwjiMg+NjDvxQRqz+zRxEdXi3B+PtOrE2ILZ5T5ezh+dEO1Sq0kbzIs+wjNPNYguWEHoqtfpV9CJQQ1NOgVKWNkvf4bqPJIYK6v6CAeEmyB9UlDURZCDwO/patT8Pi3XcIFaYXqoYHvrfK7JR+blDcaNe+drduH77Q+9zB+DY2Kf2g+Agxlk3QiGnksaGgr5oAv+14y2+eQSYsJSZRE01vYtXCIcSE+N7onWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(6916009)(6506007)(26005)(53546011)(316002)(6512007)(2616005)(8936002)(4326008)(8676002)(4744005)(2906002)(5660300002)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VEcUVuZWpLejMxOFBRVFB6U3RuU3oxVFBoZXp5cXI4NlhEMm5qdWFNckNu?=
 =?utf-8?B?SVdQcGsxZWoxYzBnTEFFaURzWWk0b1BVaWZYQXNLRVVBdDVyMjRwTGJXQWxF?=
 =?utf-8?B?bkxOS2dwVnozUWg4cHNQZWlYQXJJSEc5ZFhuN3N0THBCeFRPTGFTMWJ1MDVl?=
 =?utf-8?B?UVZhejBQZkhmaVJoR2Y4Vm03dWVXVUpVbWJjWW5pMHo0dzA5dkdZMHpSMFVm?=
 =?utf-8?B?TStVTDRUTGttWUUzRkFJT0FNQVB3emZVRjdUMXNFbDZvcjFqRm16MFZFcEhB?=
 =?utf-8?B?MVpCOVQ0MW95V01SalRVS0tueWRuU0hFdVFWWGUvbWt4TXNscWhiMXFZL0JS?=
 =?utf-8?B?aFM2T1dZSk8xZTI3YndobHljaWNicUNXdjFJOFczNlhDbVVFemltb3M5a0RS?=
 =?utf-8?B?elJad2lKOXlaZEFYVFdUZGZrRVoyQ3FVQUpnQ3dkYlhXZEpTUktFemJTcnBP?=
 =?utf-8?B?bzd1OFRlL2N3NG11eFlwbXBLNjBNVEorS1d4d2dZR0w3V0xac1pudExVMXhI?=
 =?utf-8?B?b29VbFQ0YUNTdHBCMExIcmtyRndqWWdIMllsc0doTXRjaWNlbFlmakE3bVly?=
 =?utf-8?B?UmtvQmJKNFdqRXB4L1kvVDgvR3hKMVBnVXNFRDBFc01WLzJpZnJrSjhaMnJJ?=
 =?utf-8?B?VDl0dWplT2RmSjZUNHBEVVEzWFo3cGRSYU1lZndwSEZXZzZXNmpLV1ZoRXgw?=
 =?utf-8?B?RWFramJacHdBRWg4cXBxRDFOM2hYblNoRXhBV0xZeENUMHh1T29MNWVqcUdV?=
 =?utf-8?B?QWwxQlJtendoSHJQUitVbGcxMGl6YWJKcjNJOHgwWXRnWlFOaWxwVE1BMGE2?=
 =?utf-8?B?YzNIRjJOR000bnNFUGRrVTZna09zdHdWbnRkWDFJNnIrdXh0T3dseGRlNnFV?=
 =?utf-8?B?ZWJLWkg2MHBrSE4yakZFa1JwZ29UNVd6YzA0YnZKUGhMQmxpenRjYWx0U081?=
 =?utf-8?B?bUxaYkhwNzRja2NhRWF5N3YxT1F2RFFvVTM1YVNnaEx4WDhzWjkxZjQxTm9H?=
 =?utf-8?B?Y25wOU9iMlVka0o5Zy9sWXJEZkJiSFEwWXk4R3FCaHRrRTNZSlJrck1FNjB6?=
 =?utf-8?B?S2pHYzVlYTM5VXNlc0x4MjlqQnBmQUhaZFdQb0NwRFFJaHdYZmNwRDJZSXFB?=
 =?utf-8?B?MTAzVE5LSVRveTBFWVJRU0tlVnNCR0Zoc1p6UGNzZHhRcUlzNDl1dXFsSEho?=
 =?utf-8?B?RUNjalBwbWs0dWNLUXFncW5mRk5OMExQNkIxSHhsR0owYjNiY284dmY1QjFZ?=
 =?utf-8?B?MW1yc09uSGJidUdKeFhYSkxhcEROVEFLT3dRWW5CZmJLODRnb0pGWkJiblN4?=
 =?utf-8?B?Z3V6ODhyQUlVVFZJVlUvdFZsNU93b3psTEJHZFBLSm5MeDFnVzlXN1FEQml1?=
 =?utf-8?B?U3REdithZjNVdmpzZDFKeXB2dm5FMmZNMCtYR2lrdGpObGxXTkhiYThjQjRx?=
 =?utf-8?B?T3c1ZWdVY1l2RTBFM24wdSt0c0dLbDBoRFE5aWFZZlcrOGVWL08yMEFXRmFU?=
 =?utf-8?B?QjMwb3dONDJXQXh0RFNYK0plVVRlTE1Xb0ZVRTZ5ZmR2cnBaL25PU1k5MEFv?=
 =?utf-8?B?d3I1OEFndHVkdEpCbTZmcHVRQk9saENXWnZ6bGh5QzZtMTVYdEo3ODJVbmly?=
 =?utf-8?B?RkJ0QnZPaVppS2Zia1E2RmNpVUdQMXhwc0ZsS1VmTEhaNFJKY3k0OGdDb2Fw?=
 =?utf-8?B?NUpVM0l1LzhYM3lJekYwMHYxeElFWXVxTWRLT3RvN1BlWXU5UEJUK3YycVY5?=
 =?utf-8?B?YmU0dFRBYzRKWGZSWFQ3cTZyeGtydjhVZWl0cC9tU0x6dkFDelAxdkJKbkI3?=
 =?utf-8?B?SmhCcVBNcGtPUlh0OGVPN2dGdjFlUWM2TXNoN0NvdkhmZFh5Um1FTUtQbTg4?=
 =?utf-8?B?UDdtdFZCdCtMRGZlM2pQaEF3bE1odmt3R1I4T1h0K294cDBTVUNKSjE3QzQ5?=
 =?utf-8?B?a1lSNnJYQzdOOTRpeXdIdXZQc3llV1BRaWpnRVpwK3pOOW1Nb1l2OFBEK01z?=
 =?utf-8?B?UndiRVdDYjJFY29GNkk0akh3WTl1K3hWNU1WVFQzSndFOGhzL0F6b0xuZWFm?=
 =?utf-8?B?S2hXQzZGOUFHd1ozYW5OZ3lKWW1LNHV3Tk80SjRLbXY3L1hNQzJiQzQ4UUJ4?=
 =?utf-8?Q?/uNFRHWfdQoRzBwZT9znzcuoN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d3d7f9-ac3f-4554-dbfb-08dbce59085a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:03:19.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pg+NgQH8ZwYGbsDpiIYG70m0l0KWpvWoHH14vghB8Q0PPjI4N5iTdWLQHAbDYyFmCR4WHlA83azVBMRP1sFLOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 29.09.2023 22:51, Stefano Stabellini wrote:
> On Fri, 29 Sep 2023, Federico Serafini wrote:
>> Add missing parameter names and make function declarations and
>> definitions consistent.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



