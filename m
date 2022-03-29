Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96044EA80F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 08:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295688.503287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ5Zg-0004WV-9m; Tue, 29 Mar 2022 06:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295688.503287; Tue, 29 Mar 2022 06:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ5Zg-0004UI-6O; Tue, 29 Mar 2022 06:43:28 +0000
Received: by outflank-mailman (input) for mailman id 295688;
 Tue, 29 Mar 2022 06:43:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ5Zf-0004UC-5S
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 06:43:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8907e0f9-af2b-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 08:43:26 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-gwte915ZOmGV74gDa6f8NQ-1; Tue, 29 Mar 2022 08:43:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2622.eurprd04.prod.outlook.com (2603:10a6:800:5b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 06:43:20 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 06:43:20 +0000
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
X-Inumbo-ID: 8907e0f9-af2b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648536205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sIY9Sm79ptr3vLtTUrIZ4GAkIm+kxQtGOibXJqwaKgI=;
	b=CV8EaUAuifIChSkFCM2mCU/HONYEtnVOunbZvAMxHi4NkwMjqXQxXZxoQYRw+L1ehgPB6y
	rwF7sFKAeLjPhcPGqM48UqUiqQG055YlbmwpNvSH5LwFQg+F+lw9arfAtkjDH0bSZBSAX/
	G9IbriiW8mTLdmMWbwsUdnNQJ+VEuAY=
X-MC-Unique: gwte915ZOmGV74gDa6f8NQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2JLyxZiqKftamtiTrhG/iHxxxvGAOnqbnXnYoHaZUISRr40qT1Fg9CWs0Aipm+ZLRYaD8HFlxme1/IGAZM0SF+r9WVw675eB6u8IXzT8JW4cFBNMVRR70Qi+Vn/TNP7UUG/EBr1O57IRk8hIVkrVhGEJmEyWlG2vMeXxan2Hdd2xUccICQzXJd8tUNRIjY54oz5h3k5jbI2IbJ4WVgv88pTDVVFK1aBoQ5dvSVITGMtGQZA/6E/KcYTbgkrlcy/fMKRPnzu2cX5h6aj1vxtGRR5kKwBIVhNL8P+cwQSViLENtylRNs8UB0b2/Xsic25dLrbWsRFtu9TA5JHmpSOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIY9Sm79ptr3vLtTUrIZ4GAkIm+kxQtGOibXJqwaKgI=;
 b=G9SY0n7vcfn1NjvTsG/DdPStdD6H8pPOs4t27yWZ4SX500FrWs/wyoBCQHXtTRGAJrU/gTFRVNkaN5pFKF8zIcP3RCFMCn6/Cu57/M3ZbuGQFSR/xL8v03ptTQ5vhGW+HCNpckTjOVrpRaxP3+SqIcHJy9qO4FWMhbrB9rLpdrpognAOeDXCxs9Vc7UiMibzvIKPvGHMD/AtTRZVXw3tnocaNdqFjlpT/pglrG8iVrn+rlxFUTpR82G/7Zoe8G8yq+ePJnoo8o0jOSiDZAtK7fsZ0HBUl13lh8CLKjPGZO7tvnpFj6tlPobO73K9A2I8Yb3t8S2g9TqiHsGa2yMFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
Date: Tue, 29 Mar 2022 08:43:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220328203622.30961-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524f4a79-21a3-4fea-b5c6-08da114f69cd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2622:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2622CEE521BB8C0E66786165B31E9@VI1PR0401MB2622.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UU744EN21SZzHWdq/Q4A9ovXummzI4kn3bo9U8K4xIVchDwlJ7GnI4tAvfQgbSZyNqj3EAu5WuuUtD51n89iXy287tq/J3EgXTt+pQA7qhthmbedU8aa96FdSEK9jlQM3xWZYIGKQa2YmhmUplWEKcRttsYrkwdIF2HDkbajL02QQNA2aBfYxE7nuuZnsXrxtaxmq2SK7f7mDnMWlZgRozH/WQiyw8/kaFuXjQl+aSyJwRTn2G2K1B0MypsBXKf65/dF56WO5NsxGbikd61WwuP0zAPI3Ts9XkUNSajy+auCk14/IUQVm0Xn/Da+09rWtDz3EYmOAgG8IkNzOfZ8px1qZ3RmNpOUhvtiB2TRrGmTgOG2EncgtGOoUkove1GVEYaZqZj2YBn0I3KmnhxA05H6mDeALqwIc8vY+SjXMfE876FAly0Cdta3joOUh7pG6BCFYCH6kGDyuTFSyTnxnLj3g9DCIvtPE8vzgOQXNO7GzmAWVns0S0XVSELeTwFghvxztZPi8XvGUidQ3U+fIYkt1AIbN8lOaUjaj17+3dpU5H9GpLKEzg0O9TD8dWJ6KLR8kIckvisdlyfdMzg4qRxYee7EfDr2qRYLnyGELmOfII6FwzX2Ev7rLfgxVLTsinnI9aCdPIgExmdu5ZHSikJWyoRQ1QV1kj0Bu8LTWPsLwKWl23ogfkBLlYdRRBG2UfHfRQ8pGg7VyUmnRbtVe74ifVh3OH00Nxxi7RGPlATB1RP+78A3wSq7lwsCk9Zj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(53546011)(86362001)(6506007)(8676002)(4326008)(6512007)(2616005)(2906002)(38100700002)(8936002)(6486002)(508600001)(54906003)(5660300002)(316002)(6916009)(31686004)(36756003)(26005)(66946007)(186003)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVNmTUM2ZTRtNzk3eVd2RlRPb1hkZDhweVE2Z21FU1o2QXp3NTNjMTB2R3Fy?=
 =?utf-8?B?UWRVS2JsL1RtSUZiMHlETmpUL28zNUxPUEtVOTdaMnRqclhySldMb2tsb3Fs?=
 =?utf-8?B?V2UwUEFwMkd6WHprK1BMS0lpKy8vdlFTeUZ3WUgzNzZESHpPQzhHbmU4K0lE?=
 =?utf-8?B?M3lnRFN5S3BwNWV2a3Q3UHFUSE40ZTFjeFBKUjV0TWw0RXFQVkt3dmMwRVhT?=
 =?utf-8?B?QVVjY0tHaGp6bG82MllyNzFEN1hpdGZXVVBjZWs4M0ZTM1NOUnp2QUhGUFps?=
 =?utf-8?B?bTZzeDVWTnhzWnAwbXhIQWZxQ2QzL0YzWTRmT05xNjEzUTY3QTcyWDZ6Q3pY?=
 =?utf-8?B?WmNCd1d6TGlYQSsrWlFlcWRka1NUK25RUzZvNEY1L2VMT0h3enUvQkxRZVVi?=
 =?utf-8?B?OUoyb05mMnRMdHhna1ZFcExYR3EvcDVFN3BBc1FRV3FGODhxWkJsMDNVRzFm?=
 =?utf-8?B?TUhwNTdPOFRvMTAzMENQMnMzM29FbUZsalJZM21jcWphTUtXOE42dFIxa3hw?=
 =?utf-8?B?a2FiMk5ySWdnNEcwZUVkcTRZWllIVzVxWTBCYWs4Y1RJaFZWTjVDU0M1TVgy?=
 =?utf-8?B?RzZjNjQ1S1pyamczK3YyNVBZc1Z4KzIxblNmZHFwdmFNaEF0bmowSFM2c2Ns?=
 =?utf-8?B?eXlGS3FhY2tUN3g5d1pyenUzR2JReDhQTkR6NVdqd0ZEMFBraVVNUGs2citx?=
 =?utf-8?B?QVhJQUY5OVVsWnViWlNuKzNwL1ViUEV1TXJrTFNIYkJ4ZzcrUVd4MEZWYzVW?=
 =?utf-8?B?Zm40Qk8rbUtuY1pndUpFZjFrK2w5ZG9pVXhUcVg4R2krb0d4OXdONGFwRWVt?=
 =?utf-8?B?RzFQU1RrdTR2NkJUdy80OVZVTWRaeFRGSDFLMGlqbjJ1VFZoWHdRM0dUVVlv?=
 =?utf-8?B?NUlWdXZDWVN3cVUyZHIwM3FsZG1aWWtzVnB2MjRhUjJVaklJWFZuN0dkQlNx?=
 =?utf-8?B?UmNHTmpnanF2VEEzR0R1Y2lBVDMyenYyZVFrWFJHc0tmYlVoN0VNeFoyaDRM?=
 =?utf-8?B?cjdpMlFueURqQm9MaERHek14NkJSTDduN0xrdlUzcHhuZGQ2VlZ3ckc4aG9q?=
 =?utf-8?B?cTgya3N2UWpFY1RWMFc2V2dLamhCME1QaERGZFgvSTNGNmdSSHRQVWg2cEE4?=
 =?utf-8?B?bVI0YXE3QzRHRjJ0aXhLTDJvMTlJQ1lPcjlVZnJnSWo2UWZVQzdXZmVvVStH?=
 =?utf-8?B?czZOVjltOVV0REt3eFh5cERzV1dGRHo1TFZEU2RNU0FDMkVXcEFBRWZhNkVv?=
 =?utf-8?B?ZldiSTVmbWQ5RFdrVFdlTDJiUTdZekVsY1dtSlU2OVRtL3U4TndTM21HVjIy?=
 =?utf-8?B?OXBUYU9aa05VSGlPakpJc0MrbUVEVFZZT2pKS1dJbHZqREZsaEFGYlIxOUVL?=
 =?utf-8?B?YUpjbUlVL04rQlNtOTA3aVhxY3gxcGlVUDhzZVhZa0RZa3ordmp0UnlSTDZ1?=
 =?utf-8?B?RUU2NER4TnI0bldPMkpMcXhaeEJBTzFSS1FwZ05JVDdvc0I3S2ErV0hhd2lP?=
 =?utf-8?B?YWVPNTB0Ny80K2FxNDBsMEtDcGNQdEtyM0QxcE1LN2k2RVNnVFp5blplRklE?=
 =?utf-8?B?VjFTZGFWTWYycmYwRElMenVTbUNvMFp1Wk8rVUNzUGpOVEUzZEErN3B5bk93?=
 =?utf-8?B?M2loSGNUa1NWL0VZVUVpemNFdXhSVkxKSUdnbExHeEIvUGQ4UFNya082YVpH?=
 =?utf-8?B?YStXTnlWWHdkMk1UdWJxVUtYSEZSNDR5dldMdW9ncU9ZdnJsMWpKV24waEsw?=
 =?utf-8?B?VjBqTXZPWktTd1R4QzQ3dUpuRmdtbFQ1VURnR09mZldNMllXNjdIUnVyNXg0?=
 =?utf-8?B?YUl5WVZRclY0SXVUY0ZtMnlUUWYvS2ZHODBFclFNU3E0RWN1aU9tSzgzQVBS?=
 =?utf-8?B?RXVFeUhkbXFabkZ3OEtyU0tieVRTVWEyZVdNYXp4elM2TUhZTE82dUxuUUVp?=
 =?utf-8?B?Y1kzd01XbXE4YVpvUCtuNUtEY0QrUDBaZzZTUHY5R0dScWRzRHo4T3REMEM3?=
 =?utf-8?B?cHNNc2JTRzcxMTZ6ajdqQ3JPVDdRekRWak9RKzcwSDVQd2RpVU9KUzFwVnFQ?=
 =?utf-8?B?WVZnYmpPczk1NzhjM0tjQ1F0MXoxQStGWjA3bjUvOWIyME5JWWdNY09jY1pZ?=
 =?utf-8?B?SzVLbzdvalFsS1BOemh3elJLbHVQQ29IUlQ2WkY0S0I5SE00bS8yTDMwL2Yr?=
 =?utf-8?B?SG93UzBMb2ZCUE5hUERDOTIrOU9pZ1JpMjhBRFhtTzZCVzlFWUUvRFRiRmJ3?=
 =?utf-8?B?czBtMTJwaS9qdHNkMzZpMVFMeS9Fc1Y4QzNxb3QxbHl1QjNWbW9VRmd1cG9N?=
 =?utf-8?B?UnpiQ3gySFhsRUFNcENnL29hTUhqTk5MWjBqaGtJdkNJZ0QzT1Azdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524f4a79-21a3-4fea-b5c6-08da114f69cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 06:43:20.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvbTU3EQkoNMGQulBl5cyTY9Q2Fe183AsxUlpFvYnN0R1ziLznFI3a/xdp+R01hk2NueLHVPmDV+whxQzo4Fdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2622

On 28.03.2022 22:36, Daniel P. Smith wrote:
> During domain construction under dom0less and hyperlaunch it is necessary to
> allocate at least the event channel for xenstore and potentially the event
> channel for the core console. When dom0less and hyperlaunch are doing their
> construction logic they are executing under the idle domain context. The idle
> domain is not a privileged domain, it is not the target domain, and as a result
> under the current default XSM policy is not allowed to allocate the event
> channel.

I appreciate the change is only needed there right now, but it feels
inconsistent. _If_ it is to remain that way, at least a comment needs
to be put in xsm_evtchn_unbound() making clear why this is a special
case, and hence clarifying to people what the approximate conditions
are to have such also put elsewhere. But imo it would be better to
make the adjustment right in xsm_default_action(), without touching
event_channel.c at all. Iirc altering xsm_default_action() was
discussed before, but I don't recall particular reasons speaking
against that approach.

> This patch only addresses the event channel situation by adjust the default XSM
> policy for xsm_evtchn_unbound to explicitly allow system domains to be able to
> make the allocation call.

Indeed I'm having trouble seeing how your change would work for SILO
mode, albeit Stefano having tested this would make me assume he did
so in SILO mode, as that's the default on Arm iirc. Afaict
silo_mode_dom_check() should return false in the described situation.

Similarly I don't see how things would work transparently with a
Flask policy in place. Regardless of you mentioning the restriction,
I think this wants resolving before the patch can go in.

Jan


