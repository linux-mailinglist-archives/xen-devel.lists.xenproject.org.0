Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF649D019
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261041.451565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClZZ-000324-4q; Wed, 26 Jan 2022 16:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261041.451565; Wed, 26 Jan 2022 16:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClZZ-0002zQ-0D; Wed, 26 Jan 2022 16:55:05 +0000
Received: by outflank-mailman (input) for mailman id 261041;
 Wed, 26 Jan 2022 16:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nClZY-0002zK-9s
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:55:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b47dcc43-7ec8-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 17:55:03 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-3EYudVVgMNuEmcBXFsX4Tw-1; Wed, 26 Jan 2022 17:55:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:55:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 16:55:00 +0000
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
X-Inumbo-ID: b47dcc43-7ec8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643216102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KACc+NqMAkGAFUe0+VlyybcigpM+knPh5JmP0EmPjE=;
	b=Xdp49pbiwEyJcSh1ggkfoiiiRxIa7F579NLJUha+1GhSATd+1nTOKzsD7A1SMmUDipUYXw
	kL/9Q57zUmkHuyFze7StlcchFgjxUZI96yXPmcrs2dDbDRl98Q6FRnRpel20Eep4QeZkmK
	SeDv4JWqFuY+Qbd6i/OwKuuNXQwEtoE=
X-MC-Unique: 3EYudVVgMNuEmcBXFsX4Tw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUK2hXGlvx5APjPMnqdqaJTx/DzIurm67HCteZf8i3J0X5qf7MnYCXvUffYyVcbQEtf+RRksKAmjl1filQqKPrs0bQ+w0byb3/rb/1z0DQJM+P5oBt02d6IdPmbhvlAZRUK6E0tX1a7zaWoEM9gTzSgbtOZ0/yxZhnPBnmuvGpGe42+2rpcJwLMRoTdIeuQoNkjRdAwaXLmdd01k/XBRWqpdEp/+dfKsjh88SfVlBt3kRXVXHLkWi+6oHiZsJ6oYI/UOLJOoj6nSTAkr5ArbZDDnX5rj68DAyG0k5jlAjm4HbgeMFLD/+ar7Bowk/zKHTUxosP/IgNPRLkvxEQqo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KACc+NqMAkGAFUe0+VlyybcigpM+knPh5JmP0EmPjE=;
 b=X4WBOJKtJ/H5XgAOchfzc4V2NOgLK9SrTBvbWz2bTd60hcOnV1Cr+mHqLZvPgPbU1bf21VbYrMSKOX2lbEr/4FkQ/sYtfSLrlEaVsr30bFIDdVQpIMueb7/WqWBp4AbGIU3N+SoqEpT1L/5IADTYpJ/6xV/sR6u3Bvi934oyjaaXCs5puT2UDBxijf5oZuBxEqWlCt/mC6kBtbMf9fOt4QVn6ts8Ab2CR31IMKFbUQPAaTb5nDhTSxslrSfqYfgVcaqugwlZkOMHaA4o5aqU9JCrIdkPNSk31wrv1V/4K2ALrqj6i0I4TUKL9XalFFPBWYYdwwdRSEaPOMb4JNISvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49924d67-ef9f-6ae3-0f1e-83041c1c447f@suse.com>
Date: Wed, 26 Jan 2022 17:54:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/8] x86/spec-ctrl: Drop use_spec_ctrl boolean
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb1d9e6-c023-430f-3bcb-08d9e0ec971f
X-MS-TrafficTypeDiagnostic: PR3PR04MB7339:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB733925DC83701820FFF19226B3209@PR3PR04MB7339.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zWJn7jobr4pKnSN7A0ldaoycYZcVin9mGMwCBRvzOX1EwJb9oa3mQDErNCv/ZEzuuQrbpdc8RyYZrYuGf2ZSCnOSnGe5shIWrH0VD/JmCQGVpIO//XNjtifLTxWFOUBs8q36vHJ4aZqhRk2adChJv3DJmtI18oEhbkzSQdoBhj6LjVjn9BK80S9NGgHPSvJmNCqTt3De7clZp3we1XSimhW5jUwfbxvt8KUy1LBldLUTiDgPr4hyJp78YK/gSr+011ZsP5S/Oc9z3Kf/R/gJig8dIwEF0JNHTHBiYrv3eyXYm6/AnUyEkSciZpuesBqp3cMN4wO7/ARh9fw2g+Gsw/tUQwFTv7YeXbRmKKdPI1V4TLeW3RFCMBvAkBhTAylixfUQt8kKz5/4K1WjVHCEGEswubrzAz0+v0ozz/g3saMHRvanIWWcvCGgdzi7HVTB3S+9J4eDmfFAmgp5Yf8VwrDkYbWRFwpF72oPz5LxhTA2FHp0eyvm9phhxIXPr4/UFawfUyUCwrIReZ6X0ow9j/t5RZS61N8DiUSSE7vRJ4QPar1kGatC+mUWILob5YWEQEX/NBpOtRoblOkiGjy77Kz5byXKz9zbkuEgH0i8AfnelqCz8wS0TSp00zHqJILZxMY6tP6M1SHD8dY9p6sWsGZWhOMGk7Va0y4lCo22ru7LcYOIco/91ogV28C5e+k/uVV85eqxdJnWt/tKHN3SNY4xFIg/yzWC770zlbcfOPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(508600001)(186003)(26005)(36756003)(316002)(6916009)(66556008)(31686004)(6486002)(2616005)(66946007)(54906003)(66476007)(5660300002)(4744005)(53546011)(6512007)(6506007)(86362001)(4326008)(8676002)(8936002)(38100700002)(31696002)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjN6SS9EQ0MxdEx1bzRaMWdTdUtNQW5NNWtMZzBxMmNWV2djd0ZYaHFHUE9m?=
 =?utf-8?B?VDlRZGpvUzhBVC9tU2JYa0RpNGNtOG8rcWxueWViWFNFRnM3Z0QwSnl1TG5m?=
 =?utf-8?B?d1BqOU1jR3RLSzVmRHhod3ZybXM2SXhYT3lDbWJQWGl3S0FDbzdiNTdXTWJx?=
 =?utf-8?B?RjRwaUVUSEQwZGdMVWtuRmlBZHRVbjUyRWFIeE5TQldadlFIVFIxcHBWUDJ3?=
 =?utf-8?B?bnJNZEtSbVoxc3NYVWo5L29lcjEwbDhkdlRCcHRMVFdmaUMvVUIwZXoxbEVl?=
 =?utf-8?B?S1pUN1QvQTQyZC94S3YzV09OejJLS2tydFhDcmVYSXVKMnlDRFo5ZjBpSnd1?=
 =?utf-8?B?RWFlOGpEajJkcmpCa0Rkckd0cG5JcWlVTEIyOVAyV3lRNXdqaG9yVUg3MUMv?=
 =?utf-8?B?TG1Nd1Z1QUtDYTlxdmF0ZEZydmRpNDNHNUlCVS96bUI2MlNqQnladnFNeUIx?=
 =?utf-8?B?T0RmQ0FpcUtpTjdtVkhrMGNTNUpBNlBMRWdLQytEcVJwVy9SSVlRNG8rdklK?=
 =?utf-8?B?VEhjL3VJbmFiOUw3a0dXN2kwai9RQy8zSTU3bXNSaWM0dUxIR3FpTCtPNGNL?=
 =?utf-8?B?T2Z4aWVZZlNKaURnT1NmY1EzRjlpNHFQdzA1c2x6dHVsYngvd1M2NXR3dUpL?=
 =?utf-8?B?RDNYWXNyQXo1ZHVRUCtiNFdPVHI4RUhzZmxUOC9qSHVxMGIxVG9nTVIzMnM4?=
 =?utf-8?B?RndPRUUrelpHRDVoeTIyd3V4eVpvcm1Gd2VtR08wVnhURUxoeVFLSEVxNG1x?=
 =?utf-8?B?MU1FMW5lNlhQMWdEcWVsbXozU2xmVjRtdTkwMkhuT0g2N3RwbEo3R0w5T25i?=
 =?utf-8?B?UktBUlZiSTNIQkxYeEdaWnl0NmgybWNQVGFYQk82c1ZZWXYxMTd1MEQrTFFw?=
 =?utf-8?B?cVN2cW9xMGR5OUl2VTdnSVU5VjNyejkvMUNjd3RzbVZVNkV1eVVYVmo1eUE2?=
 =?utf-8?B?eU9DZjVGdmtvdU5Bc2lHclZSU3F4M0VjNVBjNGhVSXBvNXpDYUtzMURKQkxh?=
 =?utf-8?B?RzVLN0xSeCtaRDdHTHFRa2tVdEZMcDFmcjlRRFNVTmdhb2pQNWFGbzZ2VlZO?=
 =?utf-8?B?SEZjYy9xWUhuNlViNUU0UnpPNEJiaXVrZlorekM3Nk1LZVhjRjdrUllRQjNW?=
 =?utf-8?B?UURUM0dlMmQxTTZFbVlTV09iWFp0MlM5NlNpL3FlSjVMZGFQcjhJUzk0b2pq?=
 =?utf-8?B?M0JEeGdIWHJzU1NCcFExelkySHVqQ1JhUFV5L2lxc05tR01kQ2pWVGk0ZWtI?=
 =?utf-8?B?L1p4OGtQNTd5cThsR1JxN2M1Z21BRWR1SE5pSit1TnN1RHpsWG82bTJUcC96?=
 =?utf-8?B?dmJidWxJVFNrY2RrRFZGTGp1UUpEeW0ydSsydTBkK3dGdGU5Z3Q1S0FXbm9k?=
 =?utf-8?B?Q2pPTHlKbWdIaUluZE1nbVlVbVNPMUxHNU4zcGpkZDhLOCtHTVFPTzRwV0ky?=
 =?utf-8?B?aVY2cXMxWUdrckE1WHNleHZWeDVaN3dJUnRESm05UnNkZDRKTXVKQlpUR2hL?=
 =?utf-8?B?QXJPVVU4WmtqMUYrUzl1TzRLWlpuQzJRbTlFL1JlaTJ4dXRQc1djbU14alo3?=
 =?utf-8?B?MFNrTWk1YjRHcGcyTTFySTBzNGhFQ0J1enNFQWkxc0FTa2RKbTNiZmRpbXlZ?=
 =?utf-8?B?MVFrQmk0VWhrM3JOS3BLZWJGMlFsOWloQlhuaDFvdGpQbCttaGl0NzNZU1VK?=
 =?utf-8?B?UmFwaUZtbmVoeXdWcGp6Rzh6ZGVFTTJlcDFManhxRlFlaDJEN2tPS0E4eWxM?=
 =?utf-8?B?Y2xRVVNlbXhVMjM3aTh6ZzZvRTJ2bm1kb1NMdldqdkdlTGREOE83YmhuWGsr?=
 =?utf-8?B?R1dxMHJZT1VHNTRiNFRqamJvQ2Y5NUZxSUlvbSt0WTFkZkFHaVdacXd6RURZ?=
 =?utf-8?B?dmZxWC8xWnNoL3JPRmU5T1NUTklVVzg1SkVuQjZ6V0lLY2s5bU41SGpNNFRx?=
 =?utf-8?B?ZnFrTjMwRG9yYUlFb284NjdvWEJSTTFrK2xpdW0zclk4QUpmeVZPM1ZCcHhT?=
 =?utf-8?B?M3p4WFVnT0M0Uk1YbEtsNExSaXZOSkVEVFNHN3N2L1RudmFIbThaK2dkK2hL?=
 =?utf-8?B?ZmhacFgwVWNPV1JTd2dkNWY2RGs4aHYvOW1KTCtSbyswWUU3VGNvZldXV1Bh?=
 =?utf-8?B?Qk54b1p5Q2VyUDRMU3F4dzNvVjBHeFlpUXlnQmtNL1FDK2V2c1dXa2FKZzln?=
 =?utf-8?Q?hFAj4FsprXdRqE+zjmKqc2g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb1d9e6-c023-430f-3bcb-08d9e0ec971f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:55:00.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/jSUe8QB6NhopMYiPckNKfv2rK1+kcGLmqvtBqd488YlIXuFSB5Xdfl1+kZMwaDZzoF5W+CKEg3CD6gzfwQ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

On 26.01.2022 09:44, Andrew Cooper wrote:
> Several bugfixes have reduced the utility of this variable from it's original
> purpose, and now all it does is aid in the setup of SCF_ist_wrmsr.
> 
> Simplify the logic by drop the variable, and doubling up the setting of
> SCF_ist_wrmsr for the PV and HVM blocks, which will make the AMD SPEC_CTRL
> support easier to follow.  Leave a comment explaining why SCF_ist_wrmsr is
> still necessary for the VMExit case.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


