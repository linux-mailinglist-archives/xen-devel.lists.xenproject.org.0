Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DB4AF008
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 12:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269037.463008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHlHx-00071M-Jr; Wed, 09 Feb 2022 11:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269037.463008; Wed, 09 Feb 2022 11:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHlHx-0006zW-GL; Wed, 09 Feb 2022 11:37:33 +0000
Received: by outflank-mailman (input) for mailman id 269037;
 Wed, 09 Feb 2022 11:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHlHv-0006zN-P4
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 11:37:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa1a2245-899c-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 12:37:30 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-tRhVkFbIPz6XOhgnVyTPJg-1; Wed, 09 Feb 2022 12:37:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2350.eurprd04.prod.outlook.com (2603:10a6:800:2a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 11:37:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 11:37:27 +0000
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
X-Inumbo-ID: aa1a2245-899c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644406650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWMMrLLJn3NpHnUd6OT41d2b9nG86WZvF59IBkaEkIA=;
	b=Dv9dWdwyZBnu4J6svUF+OE6231nN4uIoklNnmynVrN0lLB5jcljKGJXym03ilt6CLI7JaJ
	t6blwdtyxLYwdfbgDKYO3uOm4BiVtvOcVUZ9jY/+dL3/DSv3tVQZ6ABNMfKw8CM+a8AT2F
	9W67KeR5nMgU88QO5Xq6h6UIrA8ANx0=
X-MC-Unique: tRhVkFbIPz6XOhgnVyTPJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9MhEkw4QZba/tgr75vqjItPAQYCLOSEKrCoUBZSvDn50mQ7grvJ+smyw3wR/KlBV8YJT0PrPL5mBYvybCYOW0flDgcN+KXt7MBt9UafEr35lg/GtLuWQw6//6zanU+ORve+GkwfFe3AxiVJ1oSFrWItWrjck7h9JhrVpQfeuXprsYodosEpJCkbDrQyaTvzLCM77ddctci0g1n6e+5hDFlZaScIin0hKp9pf6fFupIlOe5KVfxvmaVZ/8Ex1Hj67FP1EqHxPnQ2T5BpiNXSs4s0muNkSGaY6uOlvDFeGN9kPtSRWI+Z1rWDMPSEfya+BJq7X/5FpnYzwnAt4nfZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWMMrLLJn3NpHnUd6OT41d2b9nG86WZvF59IBkaEkIA=;
 b=l3cBu1Z+tbjIg1b6oAjdbXADEvREHBRcCpkcQnrycEGCDgDxiwuSWd4LQPCUfCL8PVGbnl3j6j97+Q4PNpWja2pdgkZkYVDMfqiKALNHFdeHCcmqlMsCmJ0uVHx8EQaDI9Zd0DU6pxhE1Mkl1hDvbNmWqLN1xrQwqdESaVSyHp8dWKDUTR9FsckkD5tGJCe4fAxvhKy1Z3oUzICGVZG7RRQyAK++2OzpIfCXDQ1OQqhABoGulqSSNZrRPFLBDl883EvrHJsilK5spTL4nG0B5mkjHaI+ATQv9MyCoRqwulhGlc9QiPEkFPrwv5Eo4kPdAxQvDtXu3jjnTOQyBknFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c44dea8-920b-6169-0853-01e18e89db94@suse.com>
Date: Wed, 9 Feb 2022 12:37:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] x86/dom0: Add log for dom0_nodes and dom0_max_vcpus_max
 conflict
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220209103153.11391-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220209103153.11391-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0159.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 988392d5-b5a2-4eb6-7965-08d9ebc08ca7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2350:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2350EA3AFD66C058039D7749B32E9@VI1PR0401MB2350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kpnS0mPNrLo7DjY7jnf30j2mZvitvhxCx1qAvJaGPO9PFfl76DwKWNwZyGhlN0eJn9zYxwgo0GYdgtvzKtyxGDptognDenbQIxHWE8zZSrYh95m4rNXiA5vHPXWEotI5yUxKGpjCn4tFna7FEsAPoNb6aZqyYPh2dxjtAE/B6nnUSGAYESwO0EmILSGR1xDUM5bLzZvm8jBry/MmYhBP4rjGVQAxYMk6JH++WvzxrjOGflSqOtjfk7I+1D5Ks/hXLS1ueKnY3fyyjjoG8xqMoKRu2Sa0G+qUiTPyZBbMyWR0hkqCeFPKL1tJf2mQen+zAVwFFDiNSHU6/SYs+l2NXDkE2T20HK4dIoLxy2Bsfv/dDU7I6Y9hmYCY3lPVw/6BtZSMy47bVrHmEgqSuOfX0xvHT2fdDaKWnnfh5GAepnbkRHjejoU3DK8h7UXoMPBwXvM5pAFUY23JnbjRwfodZEgv+AL4mb4f9pJ6/6BKO1/B6bxKCkV5e2Gm9PZY2XJk4DJ+Z3wgdZ5KmVD1l0oLa88O24+K7YInJjsz6CCmQVa/NpXZAG3l18p9rRJjPeC5p6yMqQXsJ/0Z7lU3bxQWUUNLSsyanjc1YpzhH4St1tFeJkr+0zrvXlh5JOYhDMaRt/6kL0L3x0OSQvjYYGiu7a0K3ewTF9eiCvdfj7hMH5irSd4EWJs6Ev3hUsbZyMBX/+825TNOHfag48FSRPMpQA32+YcJqMIPsJGYYRvBXNF2hWzh33su/pkdCl64m018
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(53546011)(36756003)(8936002)(66946007)(66556008)(508600001)(66476007)(38100700002)(8676002)(86362001)(54906003)(6486002)(316002)(6916009)(5660300002)(26005)(2906002)(6506007)(186003)(6512007)(2616005)(4326008)(31686004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUZWdURuN08ySzhYcHFqTzI3MmFjZ3dsbXRVUkJNVlJqZFR0cEJWejV0UnhX?=
 =?utf-8?B?aFZmZW5EUkl5TFl5aTdQa2dMZXU3TFRGOVlPTWo4cjB1emZJeEpJbk90MUtw?=
 =?utf-8?B?ZStybHRBbTk2YjV0aGxQT1VyY2FKS01jTWVGRzFkbzRJTXJyRFhSS1ZqWHVp?=
 =?utf-8?B?N0N6dXpaUXA0b0NOZGRXZ0Z4OVBzNmVLdEhqOUdsOERTMzFMa291Z3B6dnQv?=
 =?utf-8?B?RVl1ZHd0eHBsR3VVNVZFRVdFdERLRU45TWQ5bmRzNVRWRTRKUUNiemJpdVNn?=
 =?utf-8?B?ZU5oMWlTSXZuSXBvM2dvQnJWNFZXNFlJb29WRTlzOVZDLzc1UC9neG10U3Bl?=
 =?utf-8?B?dFNtenBZcFBVc3crSVM1aXBaY0NZckVXZmFPcEpTSWd6Smk0STBvZCsrbTV0?=
 =?utf-8?B?OStGY0FMNThsQUlydGx0Q2hIZ3NvT083TzRSRzYrNUpNbG5wL0xKN1JON25x?=
 =?utf-8?B?VFJ3cmo3T2hOZFVKbU1hUk9TK0YvOC8zVEltcTh6OGEwNU9zRU1lOUFyN2xr?=
 =?utf-8?B?czNJTWJOdjJmUGZOK3crYTNJRUlwUFlvMmczL3Y5VDdkVW9ZRnlBM0V0QmtH?=
 =?utf-8?B?UzFJSGF1SmtTQXM3Mys2OWpLeU1OQ1EzK3p2b0dwLzZmQlJFMjlhSEEwbHVP?=
 =?utf-8?B?TjJOZm9Yc3lWdmRIaE1jVHk4ZE0yV3g2KzFlU0Z0elpHeEdCTjBNQVExN3Rq?=
 =?utf-8?B?YlRLbzBkVWZ3SXpLSkFWckczbWI4ZDc0cTlmNExjRitYTmlxRDRqQ3E4ODlu?=
 =?utf-8?B?cXdZQXFXUmI5Nm5uTG1jb21zaHJ4T2o4YmNzK21GbkVaaDZJK0VpazBnMnE2?=
 =?utf-8?B?eGFQdnV3MkdYZkdxV09DaUg5Y1ljd2cvdzNhU1lHR2tOYjYyZ3VrcHJqRWdC?=
 =?utf-8?B?TE1jc2lBWTM5TklKTUlqeGQydW9Ya1RnbVczSUsxVENKbUNhdXVmM1l3ZlFS?=
 =?utf-8?B?SWYxblppYzFrcFRzeHZlMVNrMWNmUThHZ2Q5YWZJUHlpMXYzNmN2eDdYRXJD?=
 =?utf-8?B?RXVQSHVEM0s0N24vSGVaeUs3OHpYOXhKVGMxQTZzc2hXVkVXOGY3T1dtUXFD?=
 =?utf-8?B?d2owZkJ4Z1hueW1lN0duQjBJaU1idFdlbXBkb1ZRaEpSeXIvWFl0RGhrMnBI?=
 =?utf-8?B?NXQ1TmZFTUpQMEZtdGNVMmtJcGZwUkM3cXh6UDFRQlA5RUtCc2NLM0RDWDFU?=
 =?utf-8?B?NTBPc1I0Ri9qS1V6L2dxMFdhU3czaERaTDN2N3ljUkJzQk5OaEtlVzc2b3VD?=
 =?utf-8?B?U3Ryc3hVWEFybjU5dGVqWFVXZzh6U29VV0txOHlDRmlvc0gzNWFqMVJ3bWxJ?=
 =?utf-8?B?TG9WZlkvRlJsZERWZEVMa2V5d0Evd3BOMC9VVTZRcTFBSUk0M0tySHJaZzZj?=
 =?utf-8?B?MFRLMDhUYTFxdXR4Zk5NRXUzNGswK0pGemtiektydkZHZkRLbHJUM3JVWXlE?=
 =?utf-8?B?dFpKQkx0T2xCb2pHWUZlSjBwZmJSMkdacU83Y05adTkyU3g4VmZrVFIzV0Ry?=
 =?utf-8?B?U2JEWnJVaU5HaFV6dVNzUTB3cnpReVQvVjRPcXY2YTBES1RnOUw5eFdkTWEr?=
 =?utf-8?B?OHI5eS9LR3laODhsMTdzbVp2d2JvN2FBTjJNdnFSVExSSEM1ZG5JU0JwMkhk?=
 =?utf-8?B?R2JyYU81YXN1QU5HRU40U29NMnA4WEVCWXpDU1dvTlAyWXdRVi9IK09BUW5r?=
 =?utf-8?B?azRmanoyemtuWEVSTjRHUzEwblRHUzZ2Z0o1NWZiUDlRRnZad1hqK1RZVk01?=
 =?utf-8?B?UTBZUFJaQlhVcHlGSlVnaGVLblBOUFZYUEFQK0hLaEt1bXoraDlySithS2dU?=
 =?utf-8?B?Nlc5WFF4NnFrZjBPR0xWMXlZdjZxTG5MRkhzOHlNTU1VdTdNZDhaOFlnem5w?=
 =?utf-8?B?Y2hNTkdmeTB2OXJDWWxoNVZyNnpRYUhaVVcxRml4NldwZSswUlJMVXlmaVcv?=
 =?utf-8?B?akxqYWpxTzZMOUluSGFtTjI1QmM5dE00M2NzSmtxR1JWV01HTDBOV2pYajF3?=
 =?utf-8?B?SG0yRWRENjN5ZENqNmJxM3daU3I2SUFhUG83MWZOZUJlZzZKT25rUTh3RHJJ?=
 =?utf-8?B?ZmVrV1BuejNURUVwMllocmp1MjcwdHlYbDJvbFdzV21aejJ4VjVxdW1ZMUw2?=
 =?utf-8?B?cDYwREJKWjQ1ZjlGVVp0UVUwWVdWeHp5S0YyaWRhVDYxZzAzNThJQkNHWnNx?=
 =?utf-8?Q?sr2PVuZq4Ox662PwpHudWbM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988392d5-b5a2-4eb6-7965-08d9ebc08ca7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 11:37:27.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FkijuDn1Jdzc5F4R1z/kVAD9wv3+yVtlzgfeHpP20Wx80DAnMfLt7Ku/VBQsxmITCRHWtkC9tXqKNa3TDQWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2350

On 09.02.2022 11:31, Jane Malalane wrote:
> This is not a bug. The xen cmdline can request both a NUMA restriction
> and a vcpu count restriction for Dom0. The node restriction wil always
> be respected which might mean either using dom0_max_vcpus <
> opt_dom0_max_vcpus_max

This is quite normal a case if a range was specified, or did you mean
opt_dom0_max_vcpus_min? But min and max get applied last anyway, so
those always override what was derived from dom0_nr_pxms.

> or using more vCPUs than pCPUs on a node. In
> the case where dom0_max_vcpus gets capped at the maximum number of
> pCPUs for the number of nodes chosen, it can be useful particularly
> for debugging to print a message in the serial log.

The number of vCPU-s Dom0 gets is logged in all cases. And the
reasons why a certain value is uses depends on more than just
the number-of-nodes restriction. I therefor wonder whether the
wording as you've chosen it is potentially misleading, and
properly expressing everything in a single message is going to
be quite a bit too noisy. Furthermore ...

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -240,6 +240,11 @@ unsigned int __init dom0_max_vcpus(void)
>      if ( max_vcpus > limit )
>          max_vcpus = limit;
>  
> +    if ( max_vcpus < opt_dom0_max_vcpus_max && max_vcpus > opt_dom0_max_vcpus_min )
> +        printk(XENLOG_INFO "Dom0 using %d vCPUs conflicts with request to use"
> +               " %d node(s), using up to %d vCPUs\n", opt_dom0_max_vcpus_max,
> +               dom0_nr_pxms, max_vcpus);

... the function can be called more than once, whereas such a
message (if we really want it) would better be issued just once.

To answer your later reply to yourself: I think printk() is fine
here (again assuming we want such a message in the first place);
it's a boot-time-only message after all.

Jan


