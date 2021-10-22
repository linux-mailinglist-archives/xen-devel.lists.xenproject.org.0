Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF459437292
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 09:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214804.373573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdonl-0004Nh-SL; Fri, 22 Oct 2021 07:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214804.373573; Fri, 22 Oct 2021 07:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdonl-0004Lu-Oo; Fri, 22 Oct 2021 07:17:17 +0000
Received: by outflank-mailman (input) for mailman id 214804;
 Fri, 22 Oct 2021 07:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgL4=PK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdonk-0004Lo-8X
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 07:17:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55318682-e34a-490f-ad26-14eefc316db2;
 Fri, 22 Oct 2021 07:17:15 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-f5U7pMleNFCLQ2fFYNgoXg-1; Fri, 22 Oct 2021 09:17:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 22 Oct
 2021 07:17:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 07:17:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 07:17:11 +0000
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
X-Inumbo-ID: 55318682-e34a-490f-ad26-14eefc316db2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634887034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLofXp8OMf2csGMCRx6v5ksl2kwJoumIqOk1JvxTuFA=;
	b=O1ESBE4owwmus7sP0A1ARmH3ZSsYmpgWNvwNG6pyAdO9gE4FeIUPq71+VNLDAoRW+ab8e2
	/PFW0ZxaSDQgwxauDiW1lcJ6DkSjpKHFlFQaj5zTXU++tMVPhVNpmUs+L4U6MUQ7TBl/jc
	tv8nKo5Xn4qBOivz4Fx0cK9G8uzz4vI=
X-MC-Unique: f5U7pMleNFCLQ2fFYNgoXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gcaea3sootJs5pf9XkMrUokjo+B0RU6X46Z17KMMADgNMMCKsyjqMXp8N4Q42BNYGpfTzXhhU7Z15pOTEl0e7MW9EPrkMUwX6vwU4uBg8kvhprxHAoxbosMeS1gnr2gVPj/IUAK1AbzuIwwfIEqH5McE1FT8tzjFeFAdmZO5jRlsK31mduadc1WBqzF05LkYg6iFe9/RqXhun1IzLYluPBqItMVV/+wmlCoKd3amCShf520cUjgr2c2SDUuh6bIGLgYF71PTm85aXJMRcm6LSUVN/CHo+n+qbv/x3++ay9yuiFA6chdbg+tI2o37zyiGhVa/6QULVdyeu2rhWq7rqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLofXp8OMf2csGMCRx6v5ksl2kwJoumIqOk1JvxTuFA=;
 b=och8vhGv6SlSWRk2GLttm6MpywEyYTShIhakt+YHGvgTA5yvPeiNkkbqpmJZVBqsEqkmgc/cPgOLAJvv1bKKGn9gz+c8F5cMiMUrn5+bOOy9S85eM8NcSLH1LqfVOx7JK0TuAPESDGCQm57ny1OGn1pOZWLMJSd0d96M3jAN1N7y2ky9uLnCJXVYCPMGu92EiARblad5aLf/+F/I1Lw8Nr1N/z9BLjMyCNCGPQYZUISMZ8PDb/+S1XrRacO9osxZrH4WhYaBGkSrBZ0lcQR/6QksIS6SYAZXn0iboH0QnaULrYBOkHvrS/WfbTrfBRYcNp95QiZtyLiZ9UihFa48dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 165712: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-165712-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b994413-d9cb-dfaf-0ffc-327c8f34096a@suse.com>
Date: Fri, 22 Oct 2021 09:17:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <osstest-165712-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 087d1784-8463-4d73-7fb5-08d9952bf79a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480508FEC202F6F26D2FB1EB3809@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	acrYMWGGBx/1U1Hmn79gUsNVQcOsThKgM44oThYhT/xkRmAzEnoXHAbJyB/QUT81gNu8F0vVE7olfELTMwGqfiRem9nMpspJy2XPLsYOnBBVfzxlUwTzw+tfQBSCJMCt9AsL8Zn9Rt86MtJhQs7Gggm9BEL+q6WmIiaimxX/PkNbx+/itKyeajAg4sqcNyWO4oAbi7ZkWa3rinwZ4hOwT4QM2fWI7rOzowXSBtuK7bGFHfsCyO2PYgzMAVEvvm4dG1Wub/olgP2JLURQ2S7bA8E1bgmDcNPE4dzQSCWvZH1jcaafCojnemyjK8/wq0s0OGRTHLGh3dj5Spo6UbQyhmvpH9s0AapPSFXXvagAhyC6SUbbx3LZyP1B/rXpoVziq7tiC6LJ6oflJD3i1f2ZysZmR0BtEimOBgrqttcUy0DMJFj68oiHILpflpuq0FwVPHXfM8RRMDlGveejzTmM1xkVwVkHAJDNTFGAm6NlMV/tOUDVLbx+EO6mgWa6pNXB08F9tGC1RLL+5a+4u0LwP1xP4jBTsS7Cpt03QcmvgrzP7nFxaYMiumcSA634+Sl8J37dWaYChq4hXZnaUBY2r9Ckl7iLrEp+FO0ln4sMMoEZAsCd5uVMTwdAphJH4y2znOW3kkX+zhPi9w7wx1no7OrH4YmJATr5KUwmDFaciZHGp3ojN9Ol99c1KSdSZ3NyWnBS2VoByDNENJQKZH9LyDcZ2nSdzbc2h1MXr92QfVSJmkG0JjCUt5zONB+ES5IruexkzOu1WhDvcmhS5vAexrK+36WsXZiaa9JWX4gFXMLNmmpHC4suAR/bX6q9zTnS7oHzjyrmCXB12oIC4Ofd+6e91G1IA8HgXAurMMvsWrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(316002)(66556008)(16576012)(508600001)(66476007)(6916009)(31696002)(8676002)(8936002)(186003)(26005)(83380400001)(36756003)(966005)(2906002)(31686004)(5660300002)(53546011)(2616005)(86362001)(4326008)(66946007)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2tMNC9HSEZiVTIxVnVtY0VhcURkQ1AyYm5ZUWpDbnZ0VnhMUUhSaTNndlRq?=
 =?utf-8?B?MTJiWnZ2OVNKQTBGRGM2U252V09rVld4d3g2eUN6S2ZoVEhDMVFjL0ZLZTFy?=
 =?utf-8?B?cWROcmlzcmwyZWFNNFE4VlFUNDE2T1VjS3dRb09OS0NRYmt6bllKbGJRdjBs?=
 =?utf-8?B?NWh0R0N6RjdxeXdtQ1dIb08xdGNGTk4xWnR0T3J0WTJkblNuT0MxelJXTzJB?=
 =?utf-8?B?WWZJSUU1bmVwU0ZjaE1hVmJoL3JFQ0luZWJJZVZjb1JsYS9rSUFvckcwNkVT?=
 =?utf-8?B?ZmdjZWdrVFJ3YTRwUFl2SkRvdnRRaG9KZGd0UEJZWWdFcUh5bjZIRzNKKzRC?=
 =?utf-8?B?VnlWbXNibVZ2ZElSdVNBa2xJUDQwNGg5S0pnVk9HamVuVnZzZnhpbE4reDgy?=
 =?utf-8?B?dVZEdzMwdnkzNmQ1KzhQYXkyc3lJdFlab1Z4aUNtYlZPZHNqY2pTUkllUkpH?=
 =?utf-8?B?andVTUhVYk1NQ2JZMzBQdjQzR0EzWkFPODJBNHorVTk4SEIxSXRTaUVVSVhs?=
 =?utf-8?B?Tldvc0FUK0w1MmJadVlhb24rb1NMTzBhdHJOT0FDWGMyMlFLSVhKeWl2dUpE?=
 =?utf-8?B?S0EyS2k0UkViajhsZW1TdVJGakJoVVpMeGhKQ3ZrbHJNQlVGOUM1eHl3SGM2?=
 =?utf-8?B?RUk1Y0hXY3Bnenk4RlNEc3Z6NkFEVm1RVCs2R1dyZW1uNUwwdjNBZXQ1bkhX?=
 =?utf-8?B?Nmh2ZkVKQnNnN1UrYkhJcHltY1VlQm9HeTZ4VlVWR0lTT3laeWtCRWRzcURl?=
 =?utf-8?B?ampmY3hoM1VIWThGNGRtRXh3N2JSWnFKOEhSWDc5RWt0bDFObDdITmdmbGd3?=
 =?utf-8?B?YU56NWpORVkrVlMvMXgxcitBZHE1VFdyYy9wVmJPeEpRQTNjc0hwUk41Q2s2?=
 =?utf-8?B?TDZkbytyWXRKOHpSL1VkaUFLMW9sUmtTNS9kTnlNUnF6TmV0czRRSU9YcnZV?=
 =?utf-8?B?Q3FReTllelcrRDJVVmlob0VVUHBnQVBpYWxCbEpPdWNvZi9tL1V1SHF1cldL?=
 =?utf-8?B?NGVGamdHWW5jejg5eGlKSlB4c0JwY2t6ejJDVC8vY080Vy9vUWRvMU9LbVZW?=
 =?utf-8?B?b3hsTGowWnhnZkI1ODZFUGV0dGlLOXBuc0I0TEQ0disya2hJbXBvMzBYMHNt?=
 =?utf-8?B?cUlveXF3TVJHNDkwQjJJWjhNc09LdTBFY1A1aFF1U3pYOW1XZ3FqNjF3U0dv?=
 =?utf-8?B?Slp1WUMzVEZSNEhvL1J3a1VUZFVKa1Z3ZE0yR3FlR0NkcGpQM2wrek5kVUFY?=
 =?utf-8?B?Z3F2c3l0OXNBMDBBNEpienRhekdvUUJ2SE1hR01QTG9qazFIbHdLeWZXeHlv?=
 =?utf-8?B?WGxMZFk3YW1oQkRPZFdZNjlQZ0o2WWMrUHRqeVlBSGZzSmdaU0kxQmlJVVo4?=
 =?utf-8?B?MC9Hb1pHOW5hQW1DSHRVU1lpSXk0YWg4VWo3cWNlUDNQYXc5SXR1WjdDN1dC?=
 =?utf-8?B?bE5ZWk5MeHVjVXd0SG01cnlwOFlWZFhUZ05qTlN0R1l1THpJS1k5Ti9zVnlQ?=
 =?utf-8?B?RExWRUlqYTZoZmtCeEE4WEtoNloyanBrZHZoMGdTTEJCcGtJUDVXODVuTjJV?=
 =?utf-8?B?NmNFcDk3MktoRkVOV3lPUlp4aTN5TVZsbXJ3OVlZYVB5dUloaEJnZ1V3UEN1?=
 =?utf-8?B?ci9TTHRXOFA5NTZoZlVyUzNuZEpTZGQxYUpJOGZ4NGdDQ0hyblRENVhiMEJ5?=
 =?utf-8?B?YmZjSkZPcGVQQ0FJNTFHUGJJRzJuc04zWmhOV2tNajJyTzI5SWU4VHRqZjBW?=
 =?utf-8?Q?LEAF6D4mikkcfFYiujGSJezPGxcT/5R199tSnzJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087d1784-8463-4d73-7fb5-08d9952bf79a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 07:17:12.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 22.10.2021 05:10, osstest service owner wrote:
> flight 165712 xen-unstable real [real]
> flight 165727 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/165712/
> http://logs.test-lab.xenproject.org/osstest/logs/165727/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 165699

As suspected it would (in reply to flight 165539's report), the issue
has now re-surfaced:

Oct 21 15:48:46.003369  Downloading NBP file...
Oct 21 15:48:46.003385 
Oct 21 15:48:46.063364   Succeed to download NBP file.
Oct 21 15:48:46.063382 [0m[30m[40m[2J[01;01H[0m[37m[40merror: serial port `0' isn't found.
Oct 21 15:48:46.159379 
error: can't find command `timeout'.
Oct 21 15:48:46.171404 
error: can't find command `label'.
Oct 21 15:48:46.171420 
error: can't find command `menu'.
Oct 21 15:48:46.171430 
error: can't find command `menu'.
Oct 21 15:48:46.183366 
error: can't find command `kernel'.
Oct 21 15:48:46.183383 
alloc magic is broken at 0x7a59fac0: 0
Oct 21 15:48:46.207389 
Aborted. Press any key to exit.error: you need to load the kernel first.

Jan


