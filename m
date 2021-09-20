Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501474111AE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 11:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190412.340235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFKd-0004H2-1V; Mon, 20 Sep 2021 09:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190412.340235; Mon, 20 Sep 2021 09:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFKc-0004Eo-Tw; Mon, 20 Sep 2021 09:11:22 +0000
Received: by outflank-mailman (input) for mailman id 190412;
 Mon, 20 Sep 2021 09:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSFKb-0004EN-Bo
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 09:11:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b46554ed-19f2-11ec-b866-12813bfff9fa;
 Mon, 20 Sep 2021 09:11:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-19Ol8OHHNF6txHZRVlkRYg-1; Mon, 20 Sep 2021 11:11:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Mon, 20 Sep
 2021 09:11:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 09:11:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Mon, 20 Sep 2021 09:11:10 +0000
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
X-Inumbo-ID: b46554ed-19f2-11ec-b866-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632129073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQ14YNKsbXfYrrub9l0XRKId0d3U7KU+ivHIckNGKJ4=;
	b=HhC3LNP3lwl9js6Fuz9T0bQF/fhbjDuqFZFOGCZgfqoPVqr7TDMx1yrWdW2e6/xnrp/Yo1
	ua2Hc5Cqs8ROhysyNqvpQpNp6htVXCrAiIbRhP75qTzt2GS9FxIJymdBuIRUAOr1Ey/SV0
	m6xvpdyJwmb57B06zvCM0fCpeAJrk80=
X-MC-Unique: 19Ol8OHHNF6txHZRVlkRYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WktPLMPgIBogDq6XhyIlKH7Gp3XIkpDAVIoYLI21aGQcCuwPUqbRzkDgML/Onx2qpiEwHsB2VRyhdFThJJL3SJTmY0pU8qdy5AMTaSo7RSytiWoVlHRjNrFt+spxHQi8Kuv6MvWN5GqxxMxC4YmOnmkOdFTznbheKLcPUomIg502ncw0dNQAXaBTHf6Evm2bYxbtdykssDtff5gwU095XyGZTBa7LzX6H2qLKlenU16lDsEsJMxPyTrhI5Na2FnQep0S3QOx8sBlTsUGoYnR8ZAxJbxUAO23capv45ij238ydAlpJZTx+lPobuFtQhz9JXyHCTXoKSNo9L4chJsAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZQ14YNKsbXfYrrub9l0XRKId0d3U7KU+ivHIckNGKJ4=;
 b=kwm51En0PbTJpdBQ3cfSeZU31wCYn7XJguTQAZ2sToCesFE3RaedbGcmp6mIx93hKWt/dE6yn0pXLmUG9oWVdp8dV0PlLVkvtqJOIb+XWcBQcF7IzyJQhXhg2PmJ21jWbtt3shOLkLEm1ejWYUmig2X6bAJkJRHq3ifRF1LimWIHMJ1hC/OeMk5Q55II1lHSj4q02XCdwZbywaAAKZjYPSu0vxnVi1lFw8JlNEYl6xS8VvZGc7iwJ2VqLJaFayeoHZFY+8cvKZfqVEend+pnrG03JuP02SeYMlOhJGoUiDpk2wSqtcUsblnfPaobUMr5HulyU1eWExVvpI/qEGizGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/6] xen/credit2: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e93db022-169d-e58d-84fb-c5d7edd7da06@suse.com>
Date: Mon, 20 Sep 2021 11:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917084559.22673-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bef3ee10-87d2-46b4-e196-08d97c1696e0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26080740B3EAD426EE3A9C58B3A09@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PrdjB8MZ+7e/CMUTolZFLohrq4ZmWLnK09ZCF1SxJ7eBVBxLrf9jTdbI95s2KCb1qaNuaK3BtXM5f8y5ddfIbTvVCO2udxF/YokUvSrx/DtkHI76VChlq65KLiHcxfsfu+Z6hxdy0fYiJXQ/69cqV7YJSKAq4HEVPiaE+X8PLb3ox3MnqdlUzmIMFbB5mtfECl4uHM+WXFcIWCAvHtf4TgWsjMPVB1B62fLgPWA5Uw4nZPUt8HAt/m+rbaHDfSJTJRuohdwdDNwGPC+qDyzUDKeJI7Lts+2bp72SWZe9W2Lu9US6NsIZpQAhP0YM9gfa726ZLRbKoRzRlgSnB3EQJCoetZ0+8AiP4fwRXOIYLAtsoCJSOyMBVZiDCP1eoOMzklUggkdvaRrbiHUN0QM89Dd3N6MTC1MqSDKSQHivx12H+GBf1++uRzosXVNxXW/19Xnyk2/LgsqfTEx2EYO4ELfl9sa8jlgjky87qXoKwjKc1xgtUxwLfzJvSwHX/poN57qgHLDUzA140i25yRQkT3V3mDJm98uYCh8Q7SzRBBQRiOqpNq/HbnLkzlp6a8KCbWYsT9uYc5/GYYpaprSdvdWxzcr/nDx6UimmgWmitYDN2JKrU5FuzTSe2bG8NaGO2HFlAamx3rmV6oEXHrvpvFxG/OebLQXnPYjzGwxcfC7oLryqVNHDjQxpnxSNhO/MBiIpWWPLlfjsPT58r8PYzFDmynDu1ayf5DanEHZ8VCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(53546011)(2616005)(54906003)(66476007)(26005)(186003)(956004)(66946007)(38100700002)(66556008)(8676002)(316002)(8936002)(6916009)(5660300002)(16576012)(2906002)(86362001)(4326008)(31696002)(6486002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVRsQm5CSjl6VFJTUEVCRG1mYlFOSTdQOTRrVktDYW1xL3VVd21xRURBSVNE?=
 =?utf-8?B?a2xodlplKzhaUmlheWdxa0tNcS9LeHNOUThGVFJEemtPNkw0Q3pHSTVUaW5s?=
 =?utf-8?B?Y0NpMnh3UFkzaW95RDJKNVBZbDdqK2lWSDZScEZjVGxIWEFDYmNkdHhsY2ha?=
 =?utf-8?B?VWg5eUw4cVhVRUUrdXp1UENmSmI3Umhka01oSmUxaDlCRmkzaUxqdlBKc2dv?=
 =?utf-8?B?aDBYa1FUVUZTazVoZkthQXNWZ2JBZ2JPVXZZRTQ3SlU4eFl1TFZQeXV1VkY2?=
 =?utf-8?B?TnBYeDhISVVEVW5hWnp5UVY0QytHK25nTHZtalpxQlcwWnpmRFdCMGJ0TERN?=
 =?utf-8?B?UjJRVHBOdU9BSWxnWGF5eHNYc1dSNzI5ZU9XcmVWZk1PYUpBUEZmd0dYeDJG?=
 =?utf-8?B?SDhZNlo5WGFWWlZEM0dmbG9abHBvRjBBcHk0MFg2V0RSbUVERzBVZGxRYWFq?=
 =?utf-8?B?WEt4R2YyWWhCYmQ1bUdUZjkwc2dIM0I3MGF4T0JxR0tRUWpiYVVQeWZVdHpS?=
 =?utf-8?B?L1VOQXd0alhrdjNZbFFVdXgva3Zsd2F0cUJSWlVTV05HSVZRa0tCanN0Skgz?=
 =?utf-8?B?bHN6MmxPVk9aWEd5Um9UYUlYZ0t6VVkxaWhqSzhpMXNkanFFQm13dHlURWV3?=
 =?utf-8?B?UjUzT1E1bjd6Y1h2emJvRXJqNldobE5DQ05teXFVQUxNVHZjRkVwbzBZeGNo?=
 =?utf-8?B?RlhqUktNWmxBS2V1S2N2SHFVRE95NkVwTWxuMWhIdkZrM05aR0tNclB5UlNH?=
 =?utf-8?B?NkxaYmJ5cnFnamFJa1lkRHJvc3lDMC9PNU5iZU92UGZ6cEZ2aVFFZWJOeExD?=
 =?utf-8?B?ZnBhM01GUUkzeFpOdDZYa1hITnZWbWJjNG5yRWxwL3ZoTlhONVJ0aFVPb1gy?=
 =?utf-8?B?Mll1dHRMbkJod1VBVWhENGx5eXZINEVveFppc2hmb3ZrZjd6VjFKVlRsZ3do?=
 =?utf-8?B?N3VoRlA5a09OM0lCUGRUYzBXY2pqcS9MekVLWmZhb3VCbFNyaUVBOE9scHg3?=
 =?utf-8?B?TXJmTHkvWldmN2R0ckZjOUhuY2NSR2Z1VlJyM3FZcWJNS2UwRDRBZ1h5Wm1v?=
 =?utf-8?B?dzlqREcrNm1hNXZ5VHMza2J4Mkh6UGw3OWdjSi8vcFY3RUhnVFY2SkZFbDNK?=
 =?utf-8?B?UHBFZm5zbWNWNTJ3MG9PMU9qc0lMN21INEl5TG1FaFpaazZSZE93M3NRSkdE?=
 =?utf-8?B?Y2k4K2w4T1ZhMEFrUnlLRndPUHNQMFdraXQrdVJjR1hJbFJRNFVEVHkydkdp?=
 =?utf-8?B?OGtKNWNxQVlCSHdZdmlvUzBzcHVmSHA3amhGWEZrRXdRMGZTUnpNdnNoeEFv?=
 =?utf-8?B?RDBHa1J5SXdWL2pxMU9WK1RYSmZvTW1KcUhDWWx2TnJwV2NDS3REa0FOVTlz?=
 =?utf-8?B?R3N6cHQzQVp0enVvWUZsNy9HcXRlR2M1c2cwalpSalU1RGJDaDVPa2Nrcmdn?=
 =?utf-8?B?Si82TFpGSVNYemtrc29ZZ05IN3NpL0NiWE5XZ25rQnJ0UzQxOGNrTC96YWYz?=
 =?utf-8?B?L1pNUnd5czNTMjFNS3U1VkJ6ZnI4Q1VRTnIrbHhxYStSeUhtWnJjVk5seUtZ?=
 =?utf-8?B?RFdjbGFydGtLYWZpblRUb1BPWENCeFIvakNSdVBSeitpQk5OWjJ1K1RDd2RB?=
 =?utf-8?B?ZXEzWHRkRHZNZkx5L3dEYWljOW5MQzJTNlE0blJjbytLS3lHeXFkTW8wTG9a?=
 =?utf-8?B?TVRpT2Q1blJzYURiY2tOMmUxWTJ2QUhRVG1NbGhiUUNmdFJSWlh2Skd1eE9L?=
 =?utf-8?Q?f9ktxkYUec6194ofxLHtzZpS/13S6jb8e8Qo20Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef3ee10-87d2-46b4-e196-08d97c1696e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 09:11:11.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRNEe7DJITAgZ0jdGMzpK/9F0fWxHT9e1gmOkD+aa3v9u+XfAbC5vHwJzgMtHxhJ96qDOocdYR3f0q+zTl7vdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 17.09.2021 10:45, Andrew Cooper wrote:
> There is no need for bitfields anywhere - use more sensible types.  There is
> also no need to cast 'd' to (unsigned char *) before passing it to a function
> taking void *.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with (nit) ...

> @@ -1888,18 +1883,17 @@ void burn_credits(struct csched2_runqueue_data *rqd,
>      if ( unlikely(tb_init_done) )
>      {
>          struct {
> -            unsigned unit:16, dom:16;
> -            int credit, budget;
> -            int delta;
> -        } d;
> -        d.dom = svc->unit->domain->domain_id;
> -        d.unit = svc->unit->unit_id;
> -        d.credit = svc->credit;
> -        d.budget = has_cap(svc) ?  svc->budget : INT_MIN;
> -        d.delta = delta;
> -        __trace_var(TRC_CSCHED2_CREDIT_BURN, 1,
> -                    sizeof(d),
> -                    (unsigned char *)&d);
> +            uint16_t unit, dom;
> +            uint32_t credit, budget, delta;
> +        } d = {
> +            .unit    = svc->unit->unit_id,
> +            .dom     = svc->unit->domain->domain_id,
> +            .credit  = svc->credit,
> +            .budget  = has_cap(svc) ?  svc->budget : INT_MIN,

... a stray blank removed here.

Jan


