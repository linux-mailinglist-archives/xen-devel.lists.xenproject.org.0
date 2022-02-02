Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C74A7348
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264261.457299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGjQ-0006TI-A4; Wed, 02 Feb 2022 14:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264261.457299; Wed, 02 Feb 2022 14:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGjQ-0006Qk-6t; Wed, 02 Feb 2022 14:35:36 +0000
Received: by outflank-mailman (input) for mailman id 264261;
 Wed, 02 Feb 2022 14:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFGjO-0006Qe-Gi
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:35:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60ace059-8435-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 15:35:33 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-J48epH4TP124jraBD5XEuA-1; Wed, 02 Feb 2022 15:35:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5351.eurprd04.prod.outlook.com (2603:10a6:20b:29::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 14:35:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:35:29 +0000
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
X-Inumbo-ID: 60ace059-8435-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643812533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1UgrMmjUR/x017Ro/iQt0Tz87XGFU0Ky7vnfzyPvUk=;
	b=k9i8yiRV9N2zKHW4JCF7QlsieC2y1E2BUQEqDBptnTdNd30EyF2N6dM/YCbkURBx1oKJ8y
	F2RGUQLdpPhdelnepYpTJTJ8wcy7LPYFTjORP9e+aiB3h404u3jXaug39rPVMJp+/CSwWW
	QactihbmPOt0C8XTNjlEwmiahJlaljQ=
X-MC-Unique: J48epH4TP124jraBD5XEuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3ww0gTGrhM8QGGoBYd5Ble/q8zXZhXSxBEoDUIM/QqUmMPx+8vlYZHY6d91Q9qdSEntBG6Yz/gvdaSHovidAUh0EjsQWk0WS/j8n5c3iSUoDrwVMEZnjhmCRFvqVk3fjqd2D9iwaaU2E2drGkCgtchJyX7nIz36gRxc+tMJ0Gb22QdnCf4GLrmtBnIk08ntyZoRE5Ynrebrj+5gR6TiVJ213QJ9s5cmzzUjAltoLXm74yBVdSnRR4NhpwPthdYqpzBvHB8cmqGkbeDvs7C8SgeSiUoN9vtO+7nfAUZaPP0Xyz/tMCcmUU7lbl5F9Cu/ky/ujNYF6YV2cRIdgJD83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1UgrMmjUR/x017Ro/iQt0Tz87XGFU0Ky7vnfzyPvUk=;
 b=Ckbg0qup+U5Hx9fTkh1FOegdk4pWT8FFWkhPgrHqAgg9xt6D8qgcm8fOweHoNiKs6AXu3sDd1xWscJ/UhuKvUiHB/5HU0c4uV16InUo4Jd+TGuH0pPjH7qT6CGoDAJ7u26+a1ZI+y/g+uU49NgFppfdWtMqNY8U0j3zKXeGuPnD+AmINhG8mGXHCUm3bjGfyDn30D6zp5QmeSenNQ1O7iZai/5Pc8a/S6W0XnlwD6JtnDDylENxyo3omdM2JdmQ6AGrLv6S9fISO6Hy3E3vE+6BrdsKqv3vc98HUS4rrZID8HEyCFveFMLH8yD+1WHz32VGqzI3i66t0bWA2OJgWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46486c52-9475-90b8-9f2c-f8947cfd6cc8@suse.com>
Date: Wed, 2 Feb 2022 15:35:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU enumeration
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
 <bba4b96b-2d0c-6fe6-4580-2b62f0d635bc@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bba4b96b-2d0c-6fe6-4580-2b62f0d635bc@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0002.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 722ef648-79f3-4bf3-570c-08d9e65942c7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5351:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5351CBA32D90DA84F4F9C643B3279@AM6PR04MB5351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zfbDatymmjHqjNV8zo1Ftt0C7j3pdTMEJJkHuz3hD4OLXPRGYIMa/XpnKeCiidvsoeOWXzJIjd13AdBtaOQibfpnMG6Vv22djh/4KgrS8oE4TTBE/Inokx96+Y9mHbVgo5sA1I67RF69wur3YPdDRAoO5VRrXE1o/JzF2chk/2mpnJBCyHJcRxkwyDrUiqATvVka9FjwCeljWbI2FBxeVlc8ok2RnT/WAGqHq7AtrQB7thTHO3oMxUBW9fRlUbcMkDlLDxRTEFV3/PBTHnLI0fhuUr675TxU5A2n+rmwQGXdcESEKLdiyuQlLewJvMDW4IKUgxH8kJ7q4XDKdTmKdwhktrRDka/L8wlv//Wj8pFKbXhLvjMYjdgsId20NxVm5f0ftBPHoVOj/D4vGYjaXj9O1e+OyS7ZISFjwa7rVFBEMrbWlUoE6VgDkUr7cR9qw4c0TwU5OBtwalyueuY+Rr0YtLLDfnucz0nSVL3KWALyeq+fUgblLSqc/cJkUMye8FA9icCYYnWsVD4QR/zH8zrRYcXxeaFEoRRpSGWWeXJjtj2PydLXXcJh/e+0ViwkOa3Tn7IxbGjAMKVDukp6pS9d+UdV6Hg0vqL4gcgoLHYdZRPnsHwAJXFkeWWtqOJiR0Xts5BNhnMPqct1LsaI7K7k9G7NLP737k8ojKMnxpWFvRgr6+xc3bARX14SlXKcl1ZYeGM+Uh7EBr0azFE+P0CaNS0nJ7yOFCT2n3P19Rw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(66556008)(66476007)(8676002)(54906003)(26005)(186003)(4326008)(8936002)(6486002)(6916009)(31686004)(86362001)(36756003)(31696002)(2616005)(107886003)(66946007)(508600001)(38100700002)(2906002)(53546011)(316002)(6506007)(6512007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmcra1Q3M04vQnRhdEZSekEyT3VUZ29RRm9Qd1dxbEVzTEtVLzlsb2xyWExF?=
 =?utf-8?B?Z1ZvbGxKZm9aWXNCVFFFTWFEb1gvSlhURlVZd21tejZIYzVldjVGZVBteUhW?=
 =?utf-8?B?V3RBRXFXbUw4VmVyYkhLeG4xVHdBTy8xb1Zsb3hRelJPU0dSa3M3OE1DbHF6?=
 =?utf-8?B?Tmx2QWg0STN1cC9PQkpXSytlSmhEZmdMSlFhdXR2SkFreDh2VjVqRHZ1WHdL?=
 =?utf-8?B?QVlzT3hrdW1Gd0plNDNNSTdEdzBxRWlBa0l2MjUvQklBYXpGbi9seFdUaDNX?=
 =?utf-8?B?ZkRJK1Y5QzVyUjVhTFN0TXJMdDhWOVp1bmhkTWZHdXBPdnk3UEhPL2M2TDhE?=
 =?utf-8?B?bVZubk5mRy95TzZrUi9BanpZeURIZEoxWnlIaEZsRXdlOVJWVVBVa0VBYlVz?=
 =?utf-8?B?ZVVtOFhRdUFMb1Y0c3NmZjlVS0pFNDRiR08vU3pGN3E0WW1lQnk5dkdrOFhk?=
 =?utf-8?B?dFhhTzluUllOUlArd0FXTE5DQTZ2VG1BOVFETVgyU0UzaW53QUR1Q3QvdERM?=
 =?utf-8?B?TjhyT0tDSFZ3dkM5YXdJTE8rbmxqTXpmem4rTWFqZUlMc1hQcGlHaUVVeUpq?=
 =?utf-8?B?RmpvWlRVdDNTN0NlaldjZGV2dTcvUGRwQUNQN1NRUEJrc1hDZzlhTTA1d0s1?=
 =?utf-8?B?R284c0xUMjJNWnlySUtvNTFNYnhoMStzM2lKMVJKUlNxc3pid3BHTzJZVXNs?=
 =?utf-8?B?LzFUZmpDdEhHbHBjRGxrSWY3dnZMa0pvVTBlM0lkVEhybTh4UHkyM0VDQVRY?=
 =?utf-8?B?VUZkcEIzQW1mY0dRNkU4UlhrSFhGQlNldzdQOTBVUzZjSTVwSmRtVnVvdmQ0?=
 =?utf-8?B?WnRTb3I3alM1Wkc1YThOaE1RbnFRdjBjNHVtYUNRK1Rramo5UGJXbDZaYzNt?=
 =?utf-8?B?WjI5ZGJCcEgrK0pjZUhFYVhuRHVhZS9NVTdmOXhTbGEwYzd6a25pNE85UUZ3?=
 =?utf-8?B?b0VwdGdSS2VHWG50RnFnMGk5Zzk5SnJDcm1SS1p6S090MVBNN2h4SEJEeEVu?=
 =?utf-8?B?NG1Hc21HSGtWZlFMUmhQOEs1U0UwZ2duZkNWWVJRaEdQWlM5cEUzK3VldnRF?=
 =?utf-8?B?OXdEWXFyc1BwUmxyYUJ5M2hJVklwalpyaEV3eW9DTmRROFo4TnRZOGV0dmRa?=
 =?utf-8?B?S3hKL0NYTURoOGRhZCsvWDFVdStxWnBWL2pIQ2UxZXhjeHZ0YWJOQlVxRzhp?=
 =?utf-8?B?Mm1iajM4WkJkdUlaZEx2em4rakFNUTFRQUVzVkdRcFM5QmRoK2ZnUzhtOWpZ?=
 =?utf-8?B?R3lhRVMzYXZsazd3KzJBenN5MkhHeTVjZGF6b21hOW9ZNW0vZ01vTmhRc2JC?=
 =?utf-8?B?bGU5VEFkckdDK2xlbitDK0lBUVQxZkp3RWJGWitiMU1KckdZbEFWMWFMdXc1?=
 =?utf-8?B?NDNjV2JIRFFDYmRObUNOVkZJYUxHMllTb05VMnJkOGVzL0ZwSSt4RE9JSG1k?=
 =?utf-8?B?VU81NVpjTFZkV2xwM2lXcm8ybmZkUHRtWUlLODZBWkxoM3Eyai9ualVRUTlw?=
 =?utf-8?B?cFpBVkw5ODM1bWpUWVlPMGtMYVNOTmV1V0hiYmFlak5CSzRLN2RSTE9ieFFO?=
 =?utf-8?B?N2FYcW5Td3FQL1EzSjFPakdvdG90R1JGWmNtdkpwamtVTzRGaHpxbXU0VXB0?=
 =?utf-8?B?ZjNPS3FSYjI4a3NWT2E0WGxFOGcvTm03Y2NDaTkvYmRYcldiZk9EeFJkRGRY?=
 =?utf-8?B?WmRwczhlTTgyL0FjZENEUVhuYkhENk5kc3VEQTVsZTFHY2dBQWdoUmN6QU8z?=
 =?utf-8?B?MHRUUW5ONktXWStNK0lJeTBxUmFYcXZ4bUFlZDFBWW1VZHdvNU1FSlhHNmNi?=
 =?utf-8?B?ay96ZHNBUjArRHJwQTBlWjNTVjhnTlpxNVhmRDhqOFlGZHJrSnBkOXRtNmtY?=
 =?utf-8?B?OFY0Mi9hQ3RBL0s0Uk5sVnZoUnpzR2hBeVpXQTNpU0V3ci83djlXWjVRcXZv?=
 =?utf-8?B?cElyUFNyajFIcU80R0dqRjMySCtuaGI2OWpJaEcrQUhJNG9PSXpHcFhHTTBK?=
 =?utf-8?B?RnB6Z1ZVNS8wdGFSTkNDREMvLzFPdzdQeXp4eDZZNUZid0xSbEhEK2thUnFr?=
 =?utf-8?B?WHZRNVZkTlFyU01IWGlHeUxRM0lGY1ZaT0ZvNEJFcFVtb2ttOGdWb2x5NXlW?=
 =?utf-8?B?eVBmWk1NQ3lucU15UVhobjZCTjQ0TExaZjBmM29mZzU1RkxtTGkvcitqMy9J?=
 =?utf-8?Q?+ezO1EZaYfK+hs3ljIfB9Hk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722ef648-79f3-4bf3-570c-08d9e65942c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:35:29.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfDwuDOVbKRvuYxzoj0u4EScW8DYBDnvm/ZTbdnMLZDZjPhqtutvPxpBfkR1le7w3IK0dSL6fYQM5hE5ZxYWnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5351

On 02.02.2022 15:27, Boris Ostrovsky wrote:
> 
> On 2/1/22 5:57 AM, Jan Beulich wrote:
>> This started out with me noticing that "dom0_max_vcpus=<N>" with <N>
>> larger than the number of physical CPUs reported through ACPI tables
>> would not bring up the "excess" vCPU-s. Addressing this is the primary
>> purpose of the change; CPU maps handling is being tidied only as far as
>> is necessary for the change here (with the effect of also avoiding the
>> setting up of too much per-CPU infrastructure, i.e. for CPUs which can
>> never come online).
>>
>> Noticing that xen_fill_possible_map() is called way too early, whereas
>> xen_filter_cpu_maps() is called too late (after per-CPU areas were
>> already set up), and further observing that each of the functions serves
>> only one of Dom0 or DomU, it looked like it was better to simplify this.
>> Use the .get_smp_config hook instead, uniformly for Dom0 and DomU.
>> xen_fill_possible_map() can be dropped altogether, while
>> xen_filter_cpu_maps() is re-purposed but not otherwise changed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Extend description.
> 
> 
> That's been a while ;-)

Indeed. For some reason I had stored in the back of my memory that
you asked me for splitting the patch. That's something that would
have required at least as much time (to make sure I get it right)
as it took to put together (and test) the patch. Which was more
than I could afford in all this time. Recently I decided to check
with you whether I could talk you into withdrawing that (supposed)
request. But when going back through the old thread, I was
surprised to find that all you did ask for is extending the
description to point out that the CPU map management isn't the
primary purpose of the change.

> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Thanks.

Jan


