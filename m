Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DB750F162
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 08:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313458.530991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njEvM-0000Rj-Jy; Tue, 26 Apr 2022 06:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313458.530991; Tue, 26 Apr 2022 06:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njEvM-0000Pt-G0; Tue, 26 Apr 2022 06:43:48 +0000
Received: by outflank-mailman (input) for mailman id 313458;
 Tue, 26 Apr 2022 06:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njEvL-0000Pn-0F
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 06:43:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38308c10-c52c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 08:43:45 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-bKGG0EMaN_KxcxaYJfKWzA-1; Tue, 26 Apr 2022 08:43:44 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5287.eurprd04.prod.outlook.com (2603:10a6:20b:7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 06:43:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 06:43:42 +0000
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
X-Inumbo-ID: 38308c10-c52c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650955425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbpB8bXWJ8os4uKsHgZoARTuDXfvIZfhceEPa9udbPE=;
	b=mmEc4Fxcc4697ZzwlwRjdXng6XkbuaentZ4dPzAXQzDFt2cYoEDi+qVV0qCUDIcJaRUwVt
	VHyH+tjw6mPpx59gp9EgHqk08g+sXk5M34V9A4cT3sGUYMjJXNRNcjSgaOl2W4cS0uksJb
	Acc19ObAj/02iEL9J8YyWmG85mwTcwQ=
X-MC-Unique: bKGG0EMaN_KxcxaYJfKWzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5e7l9y+nciH2ZNl0KrcaNd462fuE4DDlyrVoUsI97VXm61ESvSMcXIrg/lH1IOZcNX0vP6MUHiuOzwQEwD3ucBqyxzJUISg98NEhkXieTPpJgxg6pcrpbvdsFX1MGRWjQ8WzUCUMbv7UTFJP4iK9iPY1GzS7YMa7fF9tZOMr9/6FJy85LtxT2KiqzIbpKlA9Y1GWa6gTlD+WO8XCjpq4RjeAjSYS5PPZHAZzquaG1eFN2/JL8eO9wxnQOcLcmhU3t5jjSnLE8/ySeDXX7onN7OaQyd9Agmx0ZewieKuiAW7yzhrVVlL3dCFcrcoWVe2rM+eVENSH46UVg7+GwM9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbpB8bXWJ8os4uKsHgZoARTuDXfvIZfhceEPa9udbPE=;
 b=XN3oFKSPO74lUMp/uke5cA5CBoiWC56fQUNUSLYJqn+3qt1KHh/a0A3CUaFT3O3W4qjDHL86J/SCuSp+6kVxRXxc+hthcUEUExb+0ZZwpIT0QCxnFFh9HvjLyfnsN6V3DK+0JpAO81IZOct2b31fGIciQwVY1TTtAeKN+zf0sURYfWFyCTGh7Leud4CysUzr8g7s3+xTjb75l4SnUOi8rJlsrjMrR8TEDeyOjR3SVcfuJbctqDHW08O6M99CeYGrwyCirhMFNl7vFv51J0mxU8t8LcQ2ZWIhs7AXsQXo6qVtcirRZb6oANJxCN22cEm1zgU9ounEW01kdT/VPddeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d93fee60-0d17-06ee-bb8f-e68ad5aa4fb4@suse.com>
Date: Tue, 26 Apr 2022 08:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/nospec: Fix evaluate_nospec() code generation under
 Clang
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220425175603.21086-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425175603.21086-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0165.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d89d52cf-f18b-42e6-5cb4-08da27501aa1
X-MS-TrafficTypeDiagnostic: AM6PR04MB5287:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB52875C8BC290579EB634EEF4B3FB9@AM6PR04MB5287.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4hOLuVAn7pDTIBagXttPhliM+wyt9JXq0PSL1+/mY7AhtRigdia3pCoF/yo44ojmAILwopFfXj6cd6C1BLZKL599v8OD96M1i4vvr4AlxShRiRhYuGtHB2Psi5zujkpK5MFJgMjCNiTeT2eijz09ACV0MgCS/dOaafmdbhnyLZTQgx5HU5M8LAAA+W4UGkk5R2jJWJjmwfM57tZBqEuBPR5lF+gTDDOn1HqeIoyWWSVXJFSHmF19a4HNJAgjVsKiab6oIlVXVLZ8yZNKDP3pPPJaP5kQXeuZovNjqkd4l1rNYK9zvk8SaphRbvyMwAuyYXCmkjg5519mthsDdPxsb2dDyBWPKs0pk7U5LWEmMRbKBRIXGz8g+1zlF3rmCSwsR6K6UgC7lVpw0SNNiCYOtbmsyFhwsOonIc1X3rcHijwOI0UzIgmXITAX220ZMUcJKfyWGVVGNWE8YRyQOyflcncGyotkd+q3aVSlSzjNI4RSxVIKd50+MSAC3aZaMbNw3m3s0NIDofyRM1GxGn38ommdDpr45xNYcbBpPUM+B10883OEOZwIB2GxC5PrJ47vfIIhyXNaXwrfdpPrgWzT4L6oU7lgKL/WjS5X1g7NGQ1EZKI0/55Ktjx7ktI+8PuhY+ddWWeTXSNJUsd4Npsu49bFgJI6O2KFXs5vsvI6VDU9QIvV4TnUpTkRRn6Qjh1QfTqXgI8xBgSxCbtDCkP3YrENDEb8d0hsqPS7WlKcJ419hYUMm+ab2kAYt3YMN5H4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(4326008)(6486002)(508600001)(66556008)(66476007)(8676002)(86362001)(31696002)(6916009)(54906003)(38100700002)(66946007)(6506007)(5660300002)(53546011)(2906002)(36756003)(6512007)(83380400001)(31686004)(26005)(186003)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUhBOU1LNjRhOFVuTUExdzhIOS9EN0pld2MvbE1hR0ZBMG8rZExobk02ZzB6?=
 =?utf-8?B?TUU1T204aGJPM1ZWOUZ6T2NUYWY3RVhxQUJCWW9qdVVjSFlkbXlIYnhBSzJp?=
 =?utf-8?B?UG15VUFibTgyU1A2emlKUlJJbWkwMWM1YWRLQVFPWjNZV1ZZV0N6ZVpiRjFa?=
 =?utf-8?B?eTZNU1JlVlZMZXBpRzJseDQvOFBRTDY0M3daRnZCKysxK29jaVpMMUdlUGth?=
 =?utf-8?B?dUFqVzlXbG0yUXpjRUFwdTZvOWtIY0hXdVZrc3VsV1FBcEFaMkpwcEYraXlY?=
 =?utf-8?B?Qy9oMVprcis1WjUzSHk5TnlkUjRKTzc3VzQzblFmalFidFhPSTdKd3B5RUdD?=
 =?utf-8?B?T1lqeHVLcWVVRXFULzZhVXBTZnJqdm81RS9hNXNSZzJhclQvUnlEK1NzQm9F?=
 =?utf-8?B?Yy9pTS95MHhPNTArNmpXUzA0K3dNWVpBemNST0RSQXFPVFhlQ3crNzFzb0F0?=
 =?utf-8?B?NW5aaFBZOWlISWozRWZ1S2tTOVRhaW9LMUVlTTFhUUhidDcxWVVFVUJuYlZy?=
 =?utf-8?B?VGM2RkltRE90LzNjdVVid0Irc3o0dFlHTEtYM21EZkkveDJJK0xaaTFURG41?=
 =?utf-8?B?ODJRNzI1UHVpeWtJSDZFTkpiZ0FueHk1Q0I2VHhlTFp5Lzh0Y3Q3MTIwanRO?=
 =?utf-8?B?S21UTTNpcCthNzZncUQvWjQxcHZKVFY4N3hsUDJnMjdka3V0Z2ppdnhLU2VG?=
 =?utf-8?B?RmRpL2pHY2svWUZwNStCbnp1ZGxTNjh5Y1Yxb1RSQVY4QisrQkVoSzdZZHh5?=
 =?utf-8?B?c3VJTDJXb3BJQU9Ub1ZRb3dqNk84NjN3amRLY2hRME5uZnMyQWo3bzVHa0tR?=
 =?utf-8?B?THBKbzRkR3RHSjVMRmhqdjF3bEphT0lmK3hYYjBOUmVTbXovZFpaOE5vVVA2?=
 =?utf-8?B?dE1FSE5rVmlFU3pXVk40d3Frak9JYURrdmd2SzdqZGFYd01CSVI5NTN0bDhR?=
 =?utf-8?B?MGF5a1hRQVZnTWNiUVBEbDc2cVJWYjh2QVBzcHVEY1c4Y05KMXlROVZZS3F6?=
 =?utf-8?B?V1lnSmc5aGx0dkhNQmFabDlSMG1rdXFqTjlHa3ZxdW5McFRwT1FpWkdyajlE?=
 =?utf-8?B?YlZhSjNnU0JFQlF3WW9mZzA0S1lscm5acTg2eG9NMkxBYmxnQm94MXU3M1FG?=
 =?utf-8?B?RjNVdVpvZVhOMEk5bEpLWXN6cGJOMm1oOFJnOU42YzRnSm12U24wdHF0cU02?=
 =?utf-8?B?dmdCWE1GT1dJdlhoMnkvMnd4RU1zQ0s3b3JabGtGVEM1OGM4L1NkQVdnb2Zp?=
 =?utf-8?B?UXlhYVMyT1hTS2VtbDhGWmdRU2U2RDdtQTFSUFFZblNRb1dOTFFpSnl3MVY4?=
 =?utf-8?B?RkQyMEpDQWdZRElSY2Q5dHMydE9TMWR1cnFUUVpOUUxaYUdRbXdVUVpkQmJt?=
 =?utf-8?B?djZGTWtrbURTUG9FM1BQRnRUSjRHQUNqTG1rWkVXWHcrMTVTdG5NV2tyc0pD?=
 =?utf-8?B?MVJENzgzR3ZvSkxkK1BLelRGK3U0dU1iUjZzUnN6Y3V4Uzh2by82bTViSFZn?=
 =?utf-8?B?cFRnelVIZWJoNmEvZjJSY1MyWExYUmY2VzZxZUwvRTVHWW5vTTlWWDJjZ25N?=
 =?utf-8?B?SzY5K2U0UDgvVlZDeHFBYW9uS3Z5WmlJN21NVnRiT1phNGJsdmM2dUJ4T1lF?=
 =?utf-8?B?am5KYkpHVHNHVGZxRUxMcm9PcXE1bG04MVNtengwc3V1dWpFUUpjUDg0dkZD?=
 =?utf-8?B?eDE3bVhTdDNrRWNrSFBNeXpGZ2VBM2VndGRBVUx4cHVoQzdEbU5xR09ZQVl3?=
 =?utf-8?B?S1M0SFlVeGVVRFhUclplVzY0cEdHZWREeWxabE45dHk4UGk3WXdOdCt2aDli?=
 =?utf-8?B?eW1YN3F0K2s4SW5qdE85WFpYZEFCU0pTS3pBODFhRkczNnlwTW5yN2JUR29D?=
 =?utf-8?B?T0NnbWZjK0JyUzYvZVpZb1FZT3g4TnVIaG1CRkVXVkg4azhaUFVRbDB0bktp?=
 =?utf-8?B?TlNsZXUyNTU0MUFKbzhDMHRFMmJjUEpBeDc1M0dzS1JPZW5STzBYelFwVzNj?=
 =?utf-8?B?bFlmd0pRZEcyaXBBalhaMWUvRm9Namg2UHBSblVpNW1nNE4xQk9IRjlMbG43?=
 =?utf-8?B?YXdKdjY0aDJUMUJzNSs4SXMwQjJiNUVwdHhsOWkwN0xOQXdiMFFJSEluendX?=
 =?utf-8?B?S2ludVNLSlZwUnBOWVJHNEpSRE5PMVRGdlNPUnVidytEclZGMkdhbGYrdGZ0?=
 =?utf-8?B?RjVYdGZCbjdyaTF5cGR4VFh6Qi9oaHVEcysxa2FCZGk4RnhURi9GSDkvSHNy?=
 =?utf-8?B?OGdQOEsyK1R0U1p3TVh2Nno5OCtNU0Nlc1ZnaTIzTXN4RktQK0ttL3BsMURl?=
 =?utf-8?B?RHBxZVVLWVhaYWFGQVNVZVhrVWExZTRUNGJCdUdYZ0YxT3JzekRYZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89d52cf-f18b-42e6-5cb4-08da27501aa1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 06:43:42.5089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XprUknWbFbNbWRx6SUpaw9FQi3Uqg2HvYjy0uCujSf7yUTjOmagBsfsMx8dcEky+HYDz4S5Olxh255IO2o6WPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5287

On 25.04.2022 19:56, Andrew Cooper wrote:
> It turns out that evaluate_nospec() code generation is not safe under Clang.
> Given:
> 
>   void eval_nospec_test(int x)
>   {
>       if ( evaluate_nospec(x) )
>           asm volatile ("nop #true" ::: "memory");
>       else
>           asm volatile ("nop #false" ::: "memory");
>   }
> 
> Clang emits:
> 
>   <eval_nospec_test>:
>          0f ae e8                lfence
>          85 ff                   test   %edi,%edi
>          74 02                   je     <eval_nospec_test+0x9>
>          90                      nop
>          c3                      ret
>          90                      nop
>          c3                      ret
> 
> which is not safe because the lfence has been hoisted above the conditional
> jump.  Clang concludes that both barrier_nospec_true()'s have identical side
> effects and can safely be merged.
> 
> Clang can be persuaded that the side effects are different if there are
> different comments in the asm blocks.  This is fragile, but no more fragile
> that other aspects of this construct.
> 
> Introduce barrier_nospec_false() with a separate internal comment to prevent
> Clang merging it with barrier_nospec_true() despite the otherwise-identical
> content.  The generated code now becomes:
> 
>   <eval_nospec_test>:
>          85 ff                   test   %edi,%edi
>          74 05                   je     <eval_nospec_test+0x9>
>          0f ae e8                lfence
>          90                      nop
>          c3                      ret
>          0f ae e8                lfence
>          90                      nop
>          c3                      ret
> 
> which has the correct number of lfence's, and in the correct place.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can live with us going this route, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, I'd like alternatives to be considered: Would two asm()s
perhaps not be candidates for merging when they have different
(perhaps fake) arguments or clobbers? If so, would this be less
fragile than relying on comments, which clearly any layer could be
viewed as free to strip off (when the same isn't true for arguments
and clobbers)?

Also you did say you'd open an issue with Clang to try to get their
view on relying on comments here. Could you please add a reference
to that issue in the description here?

Jan


