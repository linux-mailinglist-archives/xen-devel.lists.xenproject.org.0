Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06612467615
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237369.411694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6aw-0004Oo-OL; Fri, 03 Dec 2021 11:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237369.411694; Fri, 03 Dec 2021 11:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6aw-0004Ly-Jz; Fri, 03 Dec 2021 11:19:14 +0000
Received: by outflank-mailman (input) for mailman id 237369;
 Fri, 03 Dec 2021 11:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6av-0004Ls-9w
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:19:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b6050b-542a-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:19:11 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-fyJXiNhbOVOt3BPP9QuC-A-1; Fri, 03 Dec 2021 12:19:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 11:18:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:18:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:6e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 11:18:58 +0000
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
X-Inumbo-ID: d6b6050b-542a-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638530350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BQXIPX/L8qQrakgKoP511OLFf74HLVrRAZwLdKfXCY0=;
	b=ORKGpt/Cf6gVL4MGfx9Fs0Wmv4lcTohDUPg+3WDqsmIDamjQ4aWv2lwWWiWVfVXQl/AOBv
	gnaP7OvL0X/Gel8GobkctCeNBs4LgbSJZ2JEBuMfu7aoacmSC7VNoX8YvNd3qkImJXppt2
	jaxPZ9Zr01KZkMVKj5oexDf9bF2P5JQ=
X-MC-Unique: fyJXiNhbOVOt3BPP9QuC-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lulFvkU1FlgbbvYsMspp+HJI10eg5/dqKxd7ok70zUYTl7y96c5LhODCLyaNqqlpJ3FRWdPVp8oIfdhHNo8GLHZQNYmrV7ePLded3V5v01xNhhm6r8Xgi3FdC1k4akAQx/fQReS/2LYb1LazbRtHA3A2vPK8lfPdh8Qsz2hWw6uDMHYAqzSRVSvafihaaw+EzQx40w42k7x9yQDWE/chXs55L+1XBzVqj/psQxtcdxCZosOkxp52gCe2gy8liAM/rzSOKf9oD4tsmXFnmKY9BxsPb1AOKdoIGpMhZU2FkBTKjsT4984y5yvQTIUdwGJj5s1r3+RyOg14x9hBwNsPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQXIPX/L8qQrakgKoP511OLFf74HLVrRAZwLdKfXCY0=;
 b=TrG8yTZcT7rxyDEYkwLplRXUcEKUNyhirO6mZZ4XswLkLHPqXyUmvx4/bkn4xEeytWFtaVJdHbhRnSuxIBW2yiywpsC5uj4JKTxiRjoKrxb4mpuYKB2gulaf8CMDufHuFKjN5Fxa/6gj/5NV/WOZfu91TYT1AfqQWVhZ8l8eB1vWMTsH6belQdRKRwrSHLAPOX0P/FV7s/ePvYeA+lMA2lpMLTZXP9Ra2iV80eWlN7gnwJOmuMSWnvtol9ZP+hIoxyRPhGLCuxvMDEadtcjZsBCz8DaA6figAByHI6MNG+TjJLdsIkV6j2iTG5y9hRncyk0FVMM73hZlb991cqpNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
Date: Fri, 3 Dec 2021 12:18:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: insn-fetch related emulation adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e478e195-f1d5-4fec-0864-08d9b64eb3dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54712D6DE6D3A82EDAAA5986B36A9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3CPq5a1IOUxq4sP4cEVMJSqAJCw+Akyn9AIkIVMpZMP/6LVtpn5trLpAIhJO/tOwqowutDLWGws8BNQvJ5JqO+cygW29Ox6P5KEZ/XWJtW6I1fF1fK1uNYMVqu6IyWiYEKb8t0zqx9RM4rU8gVDvhfWybM2LbrK2AXmEtgDUOrkLz3I4sxlLEAoxUyuKpC2AC1Iqhtyi7NbApn3dI/vtYxfhp/EFQVXMNJOcNOIfEsW9siNRS7aapil+q9JSEH9bwlqt49mj1dRlcPYqYSq4PoF7atxFD33gmlyS9voXGif3yIINGBncEh/qIpCv3iRQAGcYVzfLorJFaX7CpRv2MVlau5JZnVpibqm10smGiPO48V5e+7Bhpv+ZXze8a0LJcO9maLBngWZ+NisX4NvmpAofoDi+avK/27Tft0Rq0BOMcoLDnJUhD/UE/Ued4ktTaJMMO1/aKKLYLNATBVmlsiVhiLIDgqY2r3QHbcCgB4IfdWpZJY4xNPHBaVBPT2yJgD38qG9Ns4QtlI9Iy1AJb6TgmqfzhCB0TvfMA4Z2Hzu7f4P9dUPcUY6XBZ0tT1FJ7uwRxWt3rxJKDgkxEbwRc2vTjo7C4NnMHyw8/ArPsZDiniBgGmlVf5Xtg5/gRlui+dkRAybWEEFr/yQ3iScIqj/9gn/fwYIt8Nqtz+7x6d/t7WX/tTBbqlBAQjSp9q2g6AYBSMkZbhIXauj4aULGdPp65QD+zt7d4KEtVGJkgyxTXvKMqxSNciXqXMmgvVcp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(2906002)(66556008)(16576012)(38100700002)(956004)(558084003)(4326008)(2616005)(66476007)(186003)(316002)(6916009)(54906003)(26005)(86362001)(8936002)(5660300002)(6486002)(31686004)(31696002)(8676002)(36756003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFBNcEpjaGtGL25UY0R2Y3lpUUR3R0c2Q2dxcEs3a3RKVXpXU3ArcHE5dG9X?=
 =?utf-8?B?bllxVDNYY3FNbkxpZ0NNS2FLZ1NycmVDM2NCUWg2L1NnSGgwb1ZzVnNrZEZm?=
 =?utf-8?B?RXFCZGxIQUpDYjgycGhMcHRDZmlnQ0NtTStqc2xLbWRrNUx3THprdWNsamwx?=
 =?utf-8?B?NFBQSXlVQVNsMU9EUWJ6T2VYa0drdTVlSlNBN3hYR3JYaVN4eURpdVNCbmVX?=
 =?utf-8?B?QXBFaHN4VzJURmFSeklPS0pDMmduMkJEZDU0cnhoTVljajdQR3pJKys0Qm03?=
 =?utf-8?B?Sk0rTVJwYVA5ZDlNRmZYTGE2QlNuRFpsUFczU3Q1UHZobTJOVnQvd3FRYStU?=
 =?utf-8?B?Y0N6aVlLQUdGUklMREgrYWxwSDBtaWs5SG5nSVd2NEF0T2JzTUM0cnVZTzdl?=
 =?utf-8?B?b1RiekxnT3BSY3U4SWl1cVRVYkNvV3k2RDZEK0JwTkhZb0FIbGZnbXFybUV5?=
 =?utf-8?B?K0o5cis2NUtIL2ZtQlR6MXdPdlRKWjZCNWMyUEtVUDVJeHpEQWVGRk04eDNa?=
 =?utf-8?B?R3A0bmdWY0VCQWZoc1pOTnVrcDhIelZ3MEdTdjNXUVVoSHJkQXBPU1F1eTFp?=
 =?utf-8?B?R2VwVCtZZWxrMGRFaGxjbThMaTRBbjI2S0FkWVA3SUdpL3FhNUl6cUlCbjNP?=
 =?utf-8?B?dXkzZURFbU1HbzRhd1l0bVhmMTVMQ2ZPRnJGcjk4V3lmaC9IbUZkekp2aSs4?=
 =?utf-8?B?WjZFd2NEdW1RaDY4dnZ0MWE2Z2lwWDZQVlRGZE0ySGRTVnJ4VnU5KzBzb2Jw?=
 =?utf-8?B?dUw3b3dFT1hRZGpnYS9mbm5ndjVWOTE5TVFVUVFFVGNrV3RvRDQzaVFMN2ho?=
 =?utf-8?B?Ujl1WTZIME5KSDhpV0YzVTQxTTlmYk04TzZEaTZ0M2h1Y0pHY3gxaFNrUkRt?=
 =?utf-8?B?RFVWTzFSd0pyZGVhcEVCRFdFNTFrN0hRZGljcTJnRXAzeFJJRGdvYkhudlF4?=
 =?utf-8?B?ancva1Fnc0RoQnFyeFF4VjJSenQ5NHlReHEwNExGY2ltOVg3bzhkZ09QNmx3?=
 =?utf-8?B?THVkVnhvVUpOVlFzcjlYTTFUUVk2RDR3K1dXSVBuQkEwa1NxcWliTnBJQWVX?=
 =?utf-8?B?aTZMblp4S2lKOHQ3dnpucVRNbGJVZ1c1b3NTQ0xORGdqUlRraS9uR3gvYStt?=
 =?utf-8?B?dzU1NEw2azFQZEVZcWFSd3FGR0dYVTFjTnVBekU3NXQwVmxmODNrbjlQeVpG?=
 =?utf-8?B?bUp1cGFBLytxeUg5alJSWjVmM1BNTDRUVEp0T2dtdmZtM01JdHRyVmNtS2JG?=
 =?utf-8?B?OFB5SGFLaFRLLzE3Rll0V2NwWDNrV2V2S2lmRlg5RXdmSnJlaTh1dTNPK3Rm?=
 =?utf-8?B?VXRqR0h0UUJndmZ3U1pxc0FGRmYzME9nbEUwbHplKzV1N2Z6d3ZPejZtUlJn?=
 =?utf-8?B?YkM2TmlRTnFoYUllK0NWWlJQMW9NWFNrUWJpYU5yNzFUaTlXcFRIYjBCNTQw?=
 =?utf-8?B?cTJCTlZlU296MVE4bU1Ib1hkMGloOEJyQXRRSFl5WUZSdG5wcWI2OEVFV3NT?=
 =?utf-8?B?dDRwWVhGemc1ZTVJSVIzT1A0bWM4SHlFMXFsNkRMU2FCMWh0Tml2R3JGb29M?=
 =?utf-8?B?VHVuNVVwM0N2aUV0SitGMTBwTnBESHlWQ2R5Uncvcm5NKzVPeTlXTEN0RVVs?=
 =?utf-8?B?R0dYbUZnNTB6QTRZWCtaYkdLQ29Kb1NhYkJrd1VreXE2elIvK2dNS2daZnFG?=
 =?utf-8?B?M3JyZm9uclo1L1d0d0JUSVh0YlgxY0xXU1IwWVFuOVlWYkNMMGFEWFFtSFF2?=
 =?utf-8?B?WU9iWTRUUVpyZmpQL3ZkNTdrbGlrSmdIUmdMTDZtRDRMcmYvRzU5eWRvUmh2?=
 =?utf-8?B?T1hIZWdRSGRUUnhsakkyTHRBNFpENzFYRmlnbVpLRlk3YkdKMGwzeFdrTnRT?=
 =?utf-8?B?VlorcjRBV0k4dFkrOTlmVm9SZlpwcTEwRnd1NmRidDNXU0o4ZnpOYUs2dk5w?=
 =?utf-8?B?QkpCWmtMdCtwU2dONnpvQVNOS1dtRTFjMTJhZjlkNW5Xd1BMTWRIZkM2WUdu?=
 =?utf-8?B?WWg3dytqZTM2U252QXNkbW5rQVVDUkJnM0xueHJtZ21OV1E0RlRkVVpSeEp2?=
 =?utf-8?B?RFB1VUxvMUVYcVk0OHFaZEZRR3RraithQzNvU2tuUWJqeEpacVFyekxqeWxJ?=
 =?utf-8?B?Vlh3QzlLczdKYklWcVRFRVluOGhZeVNIZzhwcWtlL1F2L2h4NmlWeWZwOGlq?=
 =?utf-8?Q?i/X3dIJo91SnXCJhZ609yFQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e478e195-f1d5-4fec-0864-08d9b64eb3dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:18:59.2800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPPU46BWFVpF+KxJunLHathyZ7sSU9VcrPDGwJLjdqjOMucytfQGp2gqup7pE0n6gy9Phu+O5TXC7J/koikyRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

Two fixes and some tidying.

1: HVM: permit CLFLUSH{,OPT} on execute-only code segments
2: HVM: fail virt-to-linear conversion for insn fetches from non-code segments
3: emul: drop "seg" parameter from insn_fetch() hook

Jan


