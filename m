Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8444E4CF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225142.388833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlU2L-0002nM-Oy; Fri, 12 Nov 2021 10:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225142.388833; Fri, 12 Nov 2021 10:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlU2L-0002lS-LW; Fri, 12 Nov 2021 10:44:01 +0000
Received: by outflank-mailman (input) for mailman id 225142;
 Fri, 12 Nov 2021 10:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlU2K-0002lM-45
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:44:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70dddf0f-43a5-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 11:43:58 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-jXw2aC3FNa2lqRsdmafHcA-1; Fri, 12 Nov 2021 11:43:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 12 Nov
 2021 10:43:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:43:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Fri, 12 Nov 2021 10:43:55 +0000
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
X-Inumbo-ID: 70dddf0f-43a5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636713838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HthP/7rVFzNQgj/LdVk2wKfFGuSHorRH6kGJH7gWhQ8=;
	b=ku6SeKZ9FGcipsseqdK/LrQXpjaFiDxw3GZhy82sYcEEsSfB6mQDwEoRBKufkG4wzs57St
	EkZm3dB4GqT8HuFzlOafCQ34VRhdBJsjYDMYFCmGTG8/7lXGaEX+iBKL0SwQ9ny4poazl/
	nSoQAIBdypZZTr0oeqTA/QZ0hJ/7WjQ=
X-MC-Unique: jXw2aC3FNa2lqRsdmafHcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkNc1DsB3tOLKRF3gxpUrIsNorWn/+Ov//H7YLQiq9eSn355AeUoHQHjK23cZJJ2l9CM/KFQARHJcbFLplhxxN1UHZ+dV4MoEZ4i1OY0b/cnz49jYaEmNNBL+ToESQbusBfWUibYrKCDleB7D5l0xEPYehT+caD4nJ29oNMHK0fEVGPKCPpuw784az/mUyEn+KzlSd9C4K1H0GO6tV/K19s5I1r6eqPrKl0cYR64kgGx3yMhgq8GqTI94tSPKSplGLHBvVKoD7PsdscyZlk5w8TYjshM58Gc18fXor1HRWcBLwIc9c/H1YyZ07Mksc3QpyeNE2UCDhR2h3A/o6DoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HthP/7rVFzNQgj/LdVk2wKfFGuSHorRH6kGJH7gWhQ8=;
 b=O7uVy8744j3axVkO1RN4QdpJWEJg5MjQzIhggQ0OaiWahon2HkYBLpX6atU7w7gIDKp5cj6TH29YzjUFgww/xC2/2aG523fzDipf7ZTk4XGXHgqccnXHNSp7bLTWS277YiwEk2tomtFPeGWxDjFBb5tKAJY7y24jl9Flw1fLUFjIbAgNxFgw33BfQktyMP2oxbxiNavCykArarHAM9LBa+0yo/98QbUISie1EiK4CaWaZ0BHgEeEJ2hUgUSpoKxXn4dWODgVnGzZF6F1s93jVZqgDApQRRk4LUoX3vyzvh/NFHf9zyEnjP5oDn0G2AcvzEJRJiSGXEGfJ99pYC48qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e220b6f2-3cb9-e7b0-6b74-4b266e4e7fb6@suse.com>
Date: Fri, 12 Nov 2021 11:43:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] x86/ioapic: Drop function pointers from
 __ioapic_{read,write}_entry()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211111175740.23480-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54d4a043-592f-4ff2-423e-08d9a5c95356
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480004E8DCCEDCDD5C9CDD8B3959@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2K2klcbSefCoTsc5qRKcCZCywj6hTletrwwQyWRMqMijimO3EBod6IDMpRUUYdxshBVofiLinAcw3A5LI45CiC6/sUH81oBJKz02u8uJAm4YZBcXueZWp4CTv37PCpDj41UQNBi3GXjh9Pq6xmrE2gjvyAoO11PRogo3TBFLiAPqSr0fADiZQhl1GsuhKdPciMAYH2AGy02uBrO0oPOcUzqei0zFckyWPMD7a5inyCzKsK4Pjp9F4bpH5/fylW3tHqQwenFVTnZH6HZCp3Y+b+4F3+NfV/qa0wwFtsjE/cl67dv+nT81ZJy7roc0ymb4RmYE6k8rtXszEc0p2WHtQJUUCh+fLZjxXhhP8SDLKrnIVGM1u2YtdckPU8RJ017opNVwSPicYI6le/SNP9r1ysUwrLA3Qh+0Hx0Lvml4ZvtuO468HXfdh3flINlduD3Pp1XrNog3JbwlTMCMFyypAmOUijbOe2FTqP3ndABjgoa6Orxh+hxHx5LVJeMqdTV0JHESR78V3aLpkPzhd11lIfaZcUvd/GP/Wx94nQ0nqUSRbbGglb4IKG0r9ZCY0PBjVc77ZQeMqTeDftew3SStJ1TGJM7TSTTVhuUeZEKl5r2JH487F0qe3W54YR+pikvXMrFkMaIhll560H/pVE2FMMDR2urjKtF8ez87OaCcVhF/+fEMcH1dJmK0EA5guu6elCMmu/S3CyhOxma1DoQJWkh8pPAngZvRYTjuN1Wo3ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(31686004)(31696002)(66946007)(53546011)(36756003)(66556008)(186003)(66476007)(316002)(508600001)(16576012)(8676002)(4744005)(26005)(6916009)(2906002)(956004)(5660300002)(38100700002)(86362001)(6486002)(2616005)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHZIZFg5czBYOTMyQW5VNHFLZXVRTDB1VW96K3JVNkJUODVCOTZGSTdkc09H?=
 =?utf-8?B?eHNsRlEvN0hSK1FmNFd1R0hWMlpMSEkyRU5GQk4rMHo3aFBJcDZzK294dU5J?=
 =?utf-8?B?Z2tsUWs0cURLUk5PZkFoK1UxUjlVOGxVVldYc0E2OGlTYW9GM1NJMmVyWVBn?=
 =?utf-8?B?WFVLRkp2bWk1ZnMzMHdHY0pHVVJIUXNQWDV4MVNiSXZpMlR5NjU5ZEFQSkR4?=
 =?utf-8?B?RjNLNkJucit4b0Y0aWxRZFBsNkVZQVhkeXhPZ2QwZFRpLzBkbHhsVjUyam1v?=
 =?utf-8?B?VHF4VmpHZVpUODFVVDRyZUpraVRXcXd4N2NGbmk0YzdJMTdKTjV6OW8vMm5N?=
 =?utf-8?B?T0duT0FNVXQ3NzZ4YjZrNzVkdk14cHVWTzJFREVTajQ0MW4zYi95S3VJOU5q?=
 =?utf-8?B?RTQ5VzlDSmx5SG9CMXNaeHZldVJVcXBvbnh5Y1pIVmgvakF4YXJDMVZPb0Fy?=
 =?utf-8?B?WHI4TXVMZVFaRXI1TjZTc2Uvdnc5VGlDRVRhaDFHaXlnUkVVaWNGRHFnT09S?=
 =?utf-8?B?bDVsSnFKNUFvRGJyaEFaYjBDeXBKWmZWbUpQNTdBUHNEQjRmZXlvSkM5OG9o?=
 =?utf-8?B?ZGRoSEtPNEEydXFaZDNJUjdHMzFDRzRNaEF1dUFtK2VyT0xwajdwd3I3Z3RX?=
 =?utf-8?B?aThaUGtjbWxuTzBLYWg3d0pGcjBwSnAvL2tNMFhoeUx1QVA4K2syQ2xrVUs0?=
 =?utf-8?B?NklwNHVUcFFXak50YUdGWmY2MkZpelMwL2N6bDZqRHhjNnlpN0gwRTJ3OHhq?=
 =?utf-8?B?QXBpZHc1ZW4zemhSYU12WU91VllYRnNrL3Y0REoyQ2RhQU14Nyt5VWVROTFw?=
 =?utf-8?B?VFh3TWs3VVUwOFhMMFYyUUZ3aFVISTVxckxYSU5MNUVxTDYvek5HWTN4VFhQ?=
 =?utf-8?B?YlcreHBVSExSYytEeElOOGVFU3U1OW5ITjdFYXdyZTdtNEtCOVhWcFdxTU93?=
 =?utf-8?B?K1hVTDJTR1lLcmVKTFFXaGwydEEwS3VCVllPR2JYQmt0N2pIRmNPV1Q3R3NS?=
 =?utf-8?B?aEV5c0Rrc1hBSE9mV0RiTDdUTDlPeUVSdndTeVFselJqWXZPOXlQYmhER1Nq?=
 =?utf-8?B?b2JoYUt6ZXhSREZoVVVmck1ublM2MXdJMnJTN3hpeUk0TjRTdGU5UGdWNDY2?=
 =?utf-8?B?NkxrVmFqVGNzTW5qK0JIQWxYTmlBUDd2YUJKZkhKbFVkbTNBRWE1bUNPeGxr?=
 =?utf-8?B?ZXJGcVpNeUxROFBzQkRTQVI3Y05jK2pZUWN6UXBVaTJFbGlWc2ZFUkl6eWtQ?=
 =?utf-8?B?NXFFVC9oaHkrcng4d09NdkxLaEFaazlKRlo5K1lpWXNhZlEzcjFkTi8yaFZq?=
 =?utf-8?B?cmFLRUJHNHZQSkVBbUdkVFRaSW1GcjJ6RXU4R2haSWZnTzU1dWNLUHM5OEFm?=
 =?utf-8?B?bzFIOUsySXZLdjZ5UHFVTmhHeEZjOXBXMDB1dlRSOXZuMHU0TUtqMXl1d0xN?=
 =?utf-8?B?eG5yWEpIQlRWRXhGVkh4V0ZmWUtydlQvZmErVVhxUmZyOXJDOGtBb0VDd0tn?=
 =?utf-8?B?YTQxb3B4SWl6T0UyMmJHVW5TdlNOVnNXQmdZcndRWExpYTFmQ1crYlp1Y3VR?=
 =?utf-8?B?NStDSFVIblFNRDNaZml2VGZKWmdIZlE5d1UvdUZNQms2dkpPQVhRK0xlRGtx?=
 =?utf-8?B?NFBCZWJ1YTJXZlZUMXY0RFJvblMya1ZxR2JyanBHVUQvNFBUNmFrNFRsdkhP?=
 =?utf-8?B?cmRzelFoOE1LcE1tKzZ3OXBXY1hjSGxuaUZGTEczSm1UUExYT0lLMHFlN3h2?=
 =?utf-8?B?YmNlby96YXNaVlduZHFvRkJHYmdGUEhVQ1h2eWZTY1ZGN25nVklDWXYyRGhh?=
 =?utf-8?B?UGtNcE9yTW5ESVpEeC9kZThFcGZabnphOWtKSmFGd2RQbDZQb0xXNGg2U3lp?=
 =?utf-8?B?N3RFbG13YTVYQkMySHZvaXlCNnJ6bjFNRXZaejNaZXNudjhtTVZKVUt4QVFo?=
 =?utf-8?B?UTZuRC9MdDd1OFozb0Z2aFUvbWhPeXlaRFEycjNURW1FdllzancwRk5wK1RG?=
 =?utf-8?B?Qk83bzhoMk5tWCtwMm5GY3Zidnk5c0tnemJlSElnZFAvV3JxVEhiYkJKNWY0?=
 =?utf-8?B?ZDBKeXRXMlBZenVIQ2tHaG9uYU9sWk9tVXJRalJWbGlIWG5zZ3J2QkhmSjVN?=
 =?utf-8?B?M1VEN0ZKZjZCSDFwL2NUdlR2WTR4YVRmQmVKeEprajUrR1A2SVFzQXNZQmQ5?=
 =?utf-8?Q?nitLFzrKtcIqsoy9R4OFiTU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d4a043-592f-4ff2-423e-08d9a5c95356
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:43:55.6266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jv7gDgDHbKamR30cMe1ChwyugyFXBTVvDTdG8kKIS+pvpDkwGbRqisAGvqGC9NG7NRWKbzomAbOY/RNikv1Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 11.11.2021 18:57, Andrew Cooper wrote:
> Function pointers are expensive, and the raw parameter is a constant from all
> callers, meaning that it predicts very well with local branch history.

The code change is fine, but I'm having trouble with "all" here: Both
functions aren't even static, so while callers in io_apic.c may
benefit (perhaps with the exception of ioapic_{read,write}_entry(),
depending on whether the compiler views inlining them as warranted),
I'm in no way convinced this extends to the callers in VT-d code.

Further ISTR clang being quite a bit less aggressive about inlining,
so the effects might not be quite as good there even for the call
sites in io_apic.c.

Can you clarify this for me please?

Jan


