Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3454647DC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 08:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235608.408702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msJwL-0001T8-Ho; Wed, 01 Dec 2021 07:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235608.408702; Wed, 01 Dec 2021 07:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msJwL-0001RE-EX; Wed, 01 Dec 2021 07:22:05 +0000
Received: by outflank-mailman (input) for mailman id 235608;
 Wed, 01 Dec 2021 07:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msJwJ-0001R8-SS
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 07:22:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60bf0606-5277-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 08:22:03 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-sG1sJa-hNEGROp0zS53M1Q-1; Wed, 01 Dec 2021 08:22:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 07:21:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:21:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0072.eurprd06.prod.outlook.com (2603:10a6:20b:464::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 07:21:58 +0000
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
X-Inumbo-ID: 60bf0606-5277-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638343321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5pKpvjPhhnL07N0colGIr/vOt7cJNpx8x4n866goQU=;
	b=PUrUkKtpnj+UQW72vDjN3Kbj7PIdSZU8P8MyOpseU2RqxKlr8Pv1tqAoPQfbzEGiSDxjyE
	/xoU6b5noM8dYkxvMZi+XmCq++FNobE571wfPllGtUbbbgbdbdO4kUnJhA9oY9SySYsMyw
	cWpNLMsyNcwsugut9dSDnNy7l5kUJTM=
X-MC-Unique: sG1sJa-hNEGROp0zS53M1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4eaDVJNRRr/7IcweCO3yuCdCOuR9WgjdSmIs4Uda553aypdA5r37OYcz8y8wWW1X/MX1bNm4NqbYUSXy7a78upcoEGmBP1MjtJruPArDvToc5mdc8BbbUjcP2mjooE1hNWMwfW31qy0cgflvchhwUe08nVEOxXT/ZBROKK1AVqK9q4AOV3ybrzR5g1tYg+Kt7IypygkCKhmpMXj8R9/ep/qn306rQ3R1tFB0HM0kqAh5jlSMzH3Ye6HE2+VODD0oFMTP7EOk+/1Ujmf4I1RuZ8pFQ/GY5q0q3QjMgYsoEmLn+SzrCTlfGGjYs1XHhSrj0ku+mozOCD+7eT2eaxVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5pKpvjPhhnL07N0colGIr/vOt7cJNpx8x4n866goQU=;
 b=L7EVPB9dYC4jSwjmrSBTeTaQviYIwXgRc5U+0dSjeM9rFoo2HNMbhKyhL0qNSXXAVFHtibLc+oR0xryOc7m+z7b/th4nE/E6GoydfqkfhnQJOIAouLThRxf5oa8qOHQhdAceeM/2eUoVEZVjPezXiXELHVXP0k7fvF/sME4yRLDdGFaexsIkq4aI0suYb1qvxJD6LI23FqfsXrNhtY8vzkwMsG2uY6VGawrUe3oSp1j002FcS6Bd9C983InNCy4QuHrx+rFi5PwICESuXJNGZijqdu6mGYGdXi6NIbOZnM3AJ3D45T0sGkirswtm3DDmk3RuN2/iB9LGYG7hA63MSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41a683e8-9659-76b0-1a87-bb8bbbdc47ff@suse.com>
Date: Wed, 1 Dec 2021 08:21:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 Ayan Kumar Halder <ayankuma@xilinx.com>, andre.przywara@arm.com,
 xen-devel@lists.xenproject.org
References: <20211130181238.5501-1-ayankuma@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130181238.5501-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0072.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49434173-f9f5-42d1-11a1-08d9b49b42fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190037DAB211028B6149DE7B3689@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BoTUudKiRDWU5thbweOr4mEsToO/4z5nPl62Avby/czbpw5f7xhBLNXHdnLBiBpnOQSWOfeUh+wYPdavJPlQzatk4Z4576895qnupieFkvZ/aUzb6+rNutsAlqIoXY61tdekxEhXMe/1N0tp+eotftCL/IgAmgYYg0DZGKOgtFDs+qQP4cK0PaNY8HH+NK9ycfWKVTtrnAyCFXpe52v2tSzeckN+Qu+CC/ynj0c0hO94Qd4ArbYZ6qrjQsxtgJOBp2+gzFXrRGxkyfMmhwxzJq5ILxo7SRniJqT52PCEGn9GrjsKgokToPAbBJSIi6bpGXQNFYvnrQ8hq3jcW/kj87ThSwJE75qwV3dQAmo09adGThZFGS8TRLEu3pEmDOO7MQJgUaLEAV0pFoqo0W6UWi/NJ7GP1zt+ONvRHJQy+DPny47BS+J3xq96WP5pgk0wuxcpwSV5ZJg6Hc3+Xw9DwnJQfS5Qcm5VeA+Zv32a6CX6c+4HQiNLmLTZH/X5N/HncZi4U6KiVIsiNrQpMhPuVVC6S5yryyjANO63wUWEVLnLJWfURGOdO3TbTLQl3kguDGQlMulbNzNAbrOJnjxfKdZsAg/9p1AQzKm2TFvODRrJtNhwrXS2fpTpXFMhapOuU3DXKFe52Hg5PY269aeCOGQwDcxypLOAggt9IgavDSNKb4FD9UXAR1OZvQz7CmCJ697upd4YnayKddksfNMNXTgsae9vvgURU66y0Pq8L44=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(16576012)(316002)(66476007)(31686004)(956004)(66946007)(8936002)(38100700002)(31696002)(5660300002)(508600001)(2616005)(26005)(6486002)(186003)(86362001)(53546011)(4326008)(6916009)(558084003)(66556008)(8676002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1kvM3Z6S1N0YjJTWXB6anlMSHVCTGpOYy9TbHpnYlNmTmxEYjg0cHd1YW9Z?=
 =?utf-8?B?ejkxbTFmWHhFMFFxNnJnOGtkVDRIWHB4ejdCVnd0UEFTZ3Y2MkJJZ0lNZTNZ?=
 =?utf-8?B?TGhXSXM4Y0pFOGY2aDNNYUhTdGh0N2xMbytISmxWbGdtZFNsbnJzcnR6VE9u?=
 =?utf-8?B?eEEvZmI4WG5iODIxOFpvUk4xeDhQdmlFK1ZqNmF0clBQZHZFd29KV0pUOU13?=
 =?utf-8?B?SGlXRWdpNkZXY3BjYmJtSTk1VUdvWHBlQnBuZWp4aS92UlU4NmF0YzM4TXdB?=
 =?utf-8?B?bnJwOFZJTC9oYnpob2dJdTBCeGdtV3pzR05FbVBIdzMybWJnOWhqeFZDV0E4?=
 =?utf-8?B?NFlYZGJCMjBzWFdwMzJibVBkQWdKSGlwV2dHQXd1UUlWU0ZYUEp2Sm5wMlFk?=
 =?utf-8?B?VDRKdW15aXRJVzdoTmtGWEJvbTFiWDF0KytEakQwZzJXRHN4NWQwazI0dlY4?=
 =?utf-8?B?SGNIWng1bnpDcWEyMXdRMTQwc0cvdjRtYnVlVzNtNGhDbnU2NUF1eTlkdUhT?=
 =?utf-8?B?bGd5YU9DZ0gxT0docGZZVUNLWGhmRldxVXR2Zjk0UXVFMEhEUFVCMkV6S1l4?=
 =?utf-8?B?em1lUEoyWXN5aGZVbGY4UjlDa2RWQVJtcllLdHVZQmJqK2FCaEVEUmFNYVE0?=
 =?utf-8?B?ajVua0JhT1ZSNTUzTDQyM1I5OWxSVnc0SC9saXhVR2VudjZDM01IS2pUZ0Y0?=
 =?utf-8?B?OUQ5c1BnQTArUUxXdDhyUlFUVGdOTmF2NEdUM0pVWWNmTG5qeGJZSlNFakc0?=
 =?utf-8?B?cXFVVlhDUThBUEd3VFlZOFNoQUVSS1pkUWlYenEvQ3R6S1ljSkJ6Mjd5WTVs?=
 =?utf-8?B?Qmo3Y0FlWGxpb1NiVGtIbzF6UDRXc3Z0dDVrRjFEVld2VlZkaklmOFczdEVY?=
 =?utf-8?B?N3FlYzZ3T29sRncyazAwbDgxdjBOMUJ1MkRsWjJiNFBzaFVlWDI3TFErNExL?=
 =?utf-8?B?bk1qSkhHYjMxM3IzUjU3S21GS1JDR0l1WWVacHhrYmRFcVhubG5EL2MyYUpI?=
 =?utf-8?B?d2VPMVB0SlFCYWVHdE90MVBrV2lEem5QOXpkZFVPMFdRMGJzM3JTRlQ2VHBh?=
 =?utf-8?B?alpYbmVuL0ZqeFRhaGNOamlpWWIrWUpRaWJQOVhTU1VQWFlVUjl2a1lwYldy?=
 =?utf-8?B?RWlJWFd2Q2dMN2JwTXlBZG8weFp5MUpwU1ZHWDJUOXgvNFFTYUVvTWNIV1FJ?=
 =?utf-8?B?Um82andrOFNJb3kveWUzZHBaYkpQaW1kM1Y0UElXcFNVckIzQk1hdDNOZkxJ?=
 =?utf-8?B?bWtwSXBmQjlnL1EwSStSVUZHU0pNMVNKaFB5SkFzckpoL2luNHkzNXNLN3hK?=
 =?utf-8?B?eUc3Y1pabHE2QTluOFpUZ2ZmN1dSSDl6S2lWZWlHU2tLYmhYOUVKS0xscW1s?=
 =?utf-8?B?dU4weWo2VWxHaTdLY2RnRmplRzZSTmxINytUbnVwa0ZHVmVpVkFUYVhHZWFt?=
 =?utf-8?B?R3FuQW9iL29GUlUwbUJMZFpIakV5RVo2dmNDRGxUbDk5U25BaThrWWhTdGNN?=
 =?utf-8?B?VkJuZHNTM3k1d1d0MDBWZEhzZVY0RHc5QWRrSHZNRUkvSFJMWlg2YWZad1NT?=
 =?utf-8?B?SWZSdFZhQUNmWFVwT3VCT29SMUpnMTZrdWhUZWF0b3FhTzVLYjdTKzNZWkRS?=
 =?utf-8?B?SXZwOTM5WGpwNkJwaEx0YzQ0UE9Za25wNnVYZzhEZzJRN1Y1Q2pTT1A3ekRk?=
 =?utf-8?B?SHVkUTdWeWxUL2kxUlJneHd2VjQ3cmttbDVkNnlwVXh1R1hBRzdEMVpxMFZJ?=
 =?utf-8?B?aWxuZG1XcnJmRzdNZE9MeVZzNlZob240d2duWXVaR1JENjRZVXhPTzA4cHBx?=
 =?utf-8?B?OEVZYW9zLzZnUTd3dW1tZU95V1hFZS9tN1AwOU8xY2EwbmVxaHBBcHFwOUdv?=
 =?utf-8?B?UzZBSXRLTU13enZhMHUzMTlUandDZ1R0MmFPSUtCa094VlBhM2ExeDI3d2RY?=
 =?utf-8?B?RHpDWllHMnoxK29DSllaRTdzMjlreDNjQTN5SUhER3B0VDQ0UkVDTEpIWXdH?=
 =?utf-8?B?V0tpcjEvY1RIYjR3aG1BRXkyMDV3dnVYTWVMbDlkUExvVm13b3lYRlc5M0pV?=
 =?utf-8?B?bnNyQTF4ZFlsY0JSdStja1Q1WnQrR0V0NUhPNVlLQkFEN1hOaGU1andHY09j?=
 =?utf-8?B?RktQcHowYzVWcm1aK2NnMmdjTDlQNjF5cUE2aUk0VXd6YVduc0tMenJ2VzJO?=
 =?utf-8?Q?rtFRUeoxKLT1ARfoXvRjsIE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49434173-f9f5-42d1-11a1-08d9b49b42fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:21:58.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB7xAHq4hDzTqN7h1sMUYPjaVITpyHgt68gp3lU7xbJvIVjit1XozIOCcX3Z8msyvfak9j53bVulZcPhKr7l8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 30.11.2021 19:12, Ayan Kumar Halder wrote:
> GENMASK(30, 21) should be 0x7fe00000. Fixed this in the comment
> in bitops.h.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


