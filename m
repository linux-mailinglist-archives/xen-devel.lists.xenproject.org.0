Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A857FABA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 10:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374439.606487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFt0g-0000Qo-6U; Mon, 25 Jul 2022 08:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374439.606487; Mon, 25 Jul 2022 08:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFt0g-0000OZ-2Q; Mon, 25 Jul 2022 08:00:14 +0000
Received: by outflank-mailman (input) for mailman id 374439;
 Mon, 25 Jul 2022 08:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFt0e-0000OT-KT
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 08:00:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cea7473b-0bef-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 10:00:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4228.eurprd04.prod.outlook.com (2603:10a6:208:66::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 25 Jul
 2022 08:00:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 08:00:08 +0000
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
X-Inumbo-ID: cea7473b-0bef-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqJEo38bHLRwBOLcLbZeF52jujgGXcoHJxynZtbEYMnEW22l4mlGrl0czxaYfHpgxuuu6frlHXK426QCFTxnGjTogaDAYhNSHiwXMxI6II856n7Oln+fYMLNpKPi7+nfonY35zY7nfpBo1zWU+dd0kMkO1Czi74RuYL3+WSgyvn9duT9y+6Nh7bnmeaL4c4o2jedHLnJY0TEShUadM/VtEScvYp2GKzKyQruADl/IM8oxZ/q1NgslZegbopl4KVYRUDYmFGPPnUvh3O1d5Z32NKm2VGKpqstDDSHqdiPgrZ2SU2kymHD2ONNs/+WF6jUe4LCDyRTmnrJ6tG85dsoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuA/4AlDLjM1fwxUGbpAWYbhTC5JycA54f/haeULPP0=;
 b=j0URB+1GW51TM+gchapXdgSDNwYE6kvkAGX66xQDxc12AoBmsOZw97R9fJV8UQ/pShPF5aS0UVBJ/1HzyFcwtR0dM23R0+2m7iR72FIBArRuE240c43v3XOgsRteJl3Dp9pvZe96umx02CQa5yWOqejHc5fkWHe67i9GvPrdRhUycz+h9FM9h8z5LXyunE0K9i7Mdbr+qFbIwI8JzJQPxR1CJZl/Yt3CEjK1pnoWyihzWbOcbWmRnej1mjEEbltYJJtM7UByHISnk9xEQgtE5f3WpSgL5KzKQk2xsoU1DH/JXzCI6xu2iRJ/Qw3sfvgxwcNqCxK2YKyTs7fNwFcVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuA/4AlDLjM1fwxUGbpAWYbhTC5JycA54f/haeULPP0=;
 b=eQG0d6CiiwC+nc2OLruv0EDqObxoDxrBzipqsDAdoTsq/63bxlfgQ/u9sla1IqiGvxrRJMs9vnyTpd70NjB7EUB6meDxZbudn//SWskGEA/kQaR6qa4qAz7O9SyG1Ve5YxcRqyvcm2ePG5/Q/0eDvFwMvwhWHTHdsbt2ggNjb3oNDaoo3CZoVDG33wpkuresU9v0Zgdm/bu+bC5t68cK4d1Z1KvvIxx66OaQWmqrsg+FpGS0rwraQOgW/B8wXojUP5VRr5/G/c7z5ziBRXZPBrNld2JhbAmvFPzswlT0PsZ0RgWWYjXs1d6HXT+vYYwBTIxBOPMSmQS08S8S7JEeww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69b5906f-163b-b7cd-81ed-98be8e45bdf2@suse.com>
Date: Mon, 25 Jul 2022 10:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220724173159.410535-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220724173159.410535-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25746d18-457f-48ff-3434-08da6e13b0f2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4228:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h6J31ISsOERd9k50I9NXFYhPYuMwdLiLPUHnWBzrXMIrZ5lYxSLrYPKKw9+sGcJFod4Dci+FIMbVGTukSE84LF+lm1045ya9MDsOU4HAJzVAK2oZ0FMlnohcPH9eHl12ylmEdbGnen4Efii76dAp8eeGw9kJkLix9oZoCnxTCZAiob4LQUMicFr7+lpupUBQbS0DuoppzHjtYojlpEZ7NvZ4lPZAr3HyrvsbXRl0+Do6sKo45kcTemIcpMi+b8nElAyTMtIveTzRHsDRtrCki7FrWhA9j44arSz126attOAv6cBb+ubhs/veXgZHEopsQxEE35mE549hcBYpEXC14CwrbzlA6ec6pixMNouZ317dxSa3J7gpwpf4sZkEM6C52fJHH3G5+a1zD/JZ8TtMRqX5DhHEInUXfoFDDyeq2GPZDVgc2gtDbyvZd/Ey8aBcZ5MUj1BMP/hIltd856plipEx4pWNFUO0KOAazNvah3MaBJY5EabIR0HHnq1yatrHt5AILewihcxeknwwbY6skHOMeLZ752CrEZuNKdUQRsGIJXhm5hRILNA4d9z5Fa2Yk15K/vieA9x2o5eUAO5hokIC5Nzs7XKfP+IwrTWpJKsGfI652yKB5e1nQhhsPa568VAKUMuEmJC73ogzl5v8zpcS3bogldy9+N7d/Cz4ZmCN9EOHjhTxT50vxKC0qfrp7vM1YIUaZGuh9RUY62QMo5PFWXSwwSqm0/ycrkkewAaBQk+Wmalt3cdbb/l6w083IRN6N2B7RocBHG7Uq6Z7JFRXC0VkexYPSKTyBasHjYxWsHvr5ZV8T3YLvnDZwyuoVkCZwDjSh9VBsXDVTyhyOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(6916009)(41300700001)(316002)(38100700002)(36756003)(66946007)(31686004)(8676002)(4326008)(53546011)(478600001)(6512007)(6506007)(26005)(8936002)(5660300002)(86362001)(2906002)(186003)(83380400001)(66476007)(66556008)(2616005)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkhpajZlQ0lBdmlBVGIyR2pjVm5hajN5QVVObnpIY1NQOEphdjJJVUdFS0to?=
 =?utf-8?B?bEh1dkczcmFQMkRRQlBMOVhCN3I2a0pmV3NqeTJseTBmSUFIbFBnSllwcThK?=
 =?utf-8?B?aE85RjJyMzZlUUg3T1hkWktKOWhuYTVhMEFFS0NPT0dUZThKZGN0YURydm5X?=
 =?utf-8?B?QkI2QTlxaTlSYlJ4OCtMOExRK0FoOEJvd0lnVHRzblBjZmVzUzgzaFdaUXdB?=
 =?utf-8?B?Y0hnQmhCMUFTbENqU1RVSVY5b0UxdXBoSTBWV0RZTXFnOXhWbGFZUU5PcXAz?=
 =?utf-8?B?cktsQW5VYUZDekpQay8vbG1pUE1kcGpPR3czbGRoa09YbEpMR3dwQW1PSzA4?=
 =?utf-8?B?d2R0N0I3TW54OEovbkJFSzJoYlY5UVVMRG1qWU1udHI2WXR0c2Yvb0xGTVFq?=
 =?utf-8?B?a09pWDFaY3BUVjVzVFZQL2RXZFpuTm5jZXdSZmxUVVpYQndzOVZOTE5UYXl4?=
 =?utf-8?B?RXg0UVhZSmtoN01FL0hqdlBjQm11ejRWbE9kUEhKQ2cyR2h2OXhBUktyck5E?=
 =?utf-8?B?ZUJzK21wS3lOc0lNU1IxSDl3K2lqYVpKVTJuWWFtY1MzQUxwR3BjbVluZm5X?=
 =?utf-8?B?QkNQcVpvQXhJVTlLTTdVcGRScXgwOFJWUG5BRVNCR3RKdW1mcC85cDlUb0RW?=
 =?utf-8?B?QmdCRmNScUl5UXQxWXRXM2RnZ2JPaHJYUGdKWlIvdE9XQVkxVGlvQXh6R1Jl?=
 =?utf-8?B?U2pNbnFFcU15bDRCWFM4VEJKcEQxZ21UM01vNUxCTnNQZUF2RFQ0NGY4NlJU?=
 =?utf-8?B?bHRNbDJYeGY1L3hodjJzRE5oUlNwMU1mTzhNMnE0dlJTT0ZsampTVzhFZXk4?=
 =?utf-8?B?L21qOTlBTDYzT0lVV1RaYWZiblZaSEx0RzBmV241NjlKSnRuZ1dockZSSE1C?=
 =?utf-8?B?MndwTFpsandWTmxzaGFXV1lPNng2OGlOVTF5NkZIUUErMU5jSEY3eHp6YjJ1?=
 =?utf-8?B?cURxUTFQNlM1TzVpNWJORFR3cUpHV1dmZ0R5TmVBcVZWNW5OelZmcS9KMHR3?=
 =?utf-8?B?Q2EwMW8wM0grWmYrcDluRXEydXBlTDdHcXdob2RRMklIRVlPMUdzK3hERXUv?=
 =?utf-8?B?Yk5QVk1TemdOWitScGhBN1FNa002Nml6Q2tCSWNYQXZDUEtyUFVoK2VQZ09K?=
 =?utf-8?B?MFAvVENrVDJ0OWNoSEYrekhudGJaOUNsWDNZN2lHNUVHZkRPNWZTVXlXVVkw?=
 =?utf-8?B?c3QreERLTmhNTWdGdVFLT3lPVVVET252WGc5MDlQbUt5YVYyWnUvQ0NxOFdN?=
 =?utf-8?B?eDJ6a01rUnlGblRIUzMzMjArODlnYjRrTkZmRmRtNTBESklGREc3OW5IZ21Q?=
 =?utf-8?B?UjdIcS80N3ljbVJac3VCMmNBYlhSQmR2OWpuMVRPekxMRFkyemNZaFhVQkxn?=
 =?utf-8?B?cjB2ckE3M2U3VVFTUitYQkY3cGMrQk5BWFRJbHhtNFlxRFpsVFB1ZFhWTEMx?=
 =?utf-8?B?SjRqR1ZZSFZINHJvS2lvMnhCNU9MR25PRGQvYjV5KzVOMWtYRVFkVncvNHpW?=
 =?utf-8?B?am9kSkxzRGdPWEF0RmpCbkFic2NwSXEzME8veUF2MTlCUDRRclAxYUZOK3RP?=
 =?utf-8?B?dUtsWENDZUN5eVd5Y3dhNzdhOHlNcXc2blpGWWNLaDE4SWxEUU41a080Yk5m?=
 =?utf-8?B?RHRrRHNjRm8wWnRkVXpPNFVPMXJFaUsvS1YycE03OXBpSUttYnlVekRGVVB6?=
 =?utf-8?B?SWtiQnppRm92cmdpTlVzU212cE9rV2pQaXQyUTFwaFFvQy9xVWZkK0lRY2xa?=
 =?utf-8?B?WDZIeVdnTWg3YWU2LzZBNnpFbnZxL0Q1SytlREtyRTdYeGlwUjVvMkVOdnF3?=
 =?utf-8?B?elBrY0Z5blJmNlNlanIvR204NVloQmUzLzNIWDBYdXE5MktVV3VOWU9DT3NF?=
 =?utf-8?B?NHVRNkVzbHErdGhValppeUtVdXJNVjF4YkhuNTdaM2liRzZkTko1V2NVbnF2?=
 =?utf-8?B?MGpKcGVpeU1wSzdVME9heHRLT3BCVk1FV0g1U2h3Nk1sOWJxaUt1VkRlNndP?=
 =?utf-8?B?TS9CTXpRdDhvMjhLajdYTGNPVDQrdVRnV3ZyU1F4cmJOeFJ5WDVFNlNWNWpH?=
 =?utf-8?B?dTBteWkvdTUrVE81SUZxTGM4MzdyS1ZHMHN2SVNWNCs2dWdxbnNHK2lWOWJ3?=
 =?utf-8?Q?MKlozup90Lyg6/NxQw/uQyCVd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25746d18-457f-48ff-3434-08da6e13b0f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 08:00:07.9693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZw2smRKJBAVO95MZvL9kO8O/T1IaiMSHOsF5beqGipaSAgNYkiqoo+aMF/P0Uqm3+rd9nwvgvECgjLWfCCdXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4228

On 24.07.2022 19:31, Xenia Ragiadakou wrote:
> The function snprintf() returns the number of characters that would have been
> written in the buffer if the buffer size had been sufficiently large,
> not counting the terminating null character.
> Hence, the value returned is not guaranteed to be smaller than the buffer size.
> Check the return value of snprintf to prevent leaking stack contents to the
> guest by accident.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> I 've noticed that in general in xen the return value of snprintf is not
> checked. Is there a particular reason for this? I mean if there is no space to
> fit the entire string, is it preferable to write only a part of it instead of
> failing? If that's the case, then scnprintf could be used instead below.

You will find lack of checking particularly in cases where the buffer size
has been chosen to always fit the (expected) to-be-formatted value(s).
While in a number of (most?) cases this ends up being fragile when
considering general portability (like assuming that "unsigned int" can
always be expressed in 10 decimal digits), I guess making such assumptions
has been deemed "good enough" up until now. I think this also applies here,
so ...

> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -377,6 +377,8 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>      unsigned int e_namelen, e_len;
>  
>      e_namelen = snprintf(name, sizeof(name), template->e.name, id);
> +    if ( e_namelen >= sizeof(name) )
> +        return -ENOBUFS;

... I wonder whether you don't want to additionally put ASSERT_UNREACHABLE()
here (but leave -ENOBUFS to keep release builds safe). (I also take it that
you haven't found an actual case of the buffer being too small here?)

But of course the main purpose of using snprintf() is to avoid buffer
overrun, so truncation is indeed deemed only secondary in many cases.
Which doesn't mean adding such checks would be unwelcome - it's just that
in some of the cases your options are limited - see e.g. the other similar
use of snprintf() in hypfs_gen_dyndir_id_entry(), where the function doesn't
presently have any error cases.

Jan

