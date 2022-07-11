Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CE57059F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 16:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365203.595319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAuSU-0007lx-N3; Mon, 11 Jul 2022 14:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365203.595319; Mon, 11 Jul 2022 14:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAuSU-0007jL-IC; Mon, 11 Jul 2022 14:32:22 +0000
Received: by outflank-mailman (input) for mailman id 365203;
 Mon, 11 Jul 2022 14:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAuST-0007jB-3Y
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 14:32:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44d9061a-0126-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 16:32:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8658.eurprd04.prod.outlook.com (2603:10a6:20b:429::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 14:32:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 14:32:17 +0000
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
X-Inumbo-ID: 44d9061a-0126-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ1avI9fmZ7GD0zK5pxgQBGLMYojyK/OE8aH8KPpFk0a0b/7cte6bWR6yVu8NlEadl4q3GoGetC1CF/2NVUH+IoD50cFAaOvy4VEm5WHzy3b4vVgxR2ZLQ8Sjei7F6hQKiz9Qg4EA4OlUvl190r3+dyjOIJQ3qsuWLcCsvFrH4BmJJoV3hB96XXUjkkquOTMeLxGC40rbJY5DkdvjVFcBnf4c/UqLD09fwl77JSOakHEDzzj7emERNWOkommme+FMPJ8HD3vyuvVKi2cDfIlOz25X1I/p+G4wL0Kpluy3mXZHzX2msgrtKKI/MGlp+mN6+otXjfJNQGHUyaDCpqUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5ilYfVvTdvnaDfIBOkumYXWZCHNCtVKRfl1EGELMhY=;
 b=m+T8FbnJ690pqM8XBtWALBOC1bOvdGNEqujRCv9drMq+W15TE39tv5ItmqN5tHkbMJbRHFgLtPiT/0TISF6FkkbvwH5QpyhT5faHbQyFzpbY3C/sAugcjtF+ChyQVyR0RSShDc+XLQ9AN8PzuiYQ4ydwtZQ+Qa8rxfL6TidFtlghyRcVNe1rSvjymhc4Z04IfULdz25UQ6CRLp4JQJjFm7Xu7mYXO3gIS9JXot53/7r+2DRfnbGuhub8Te0PEs4VHQzbCgRTTOnvHuCINKbRjodXLHWyeQL871f6cUdJZouRIby8T+p3Eh4B4PHqEx8kkV5Wsi85R9+8pRguyD0flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5ilYfVvTdvnaDfIBOkumYXWZCHNCtVKRfl1EGELMhY=;
 b=swWYlYRB4gMwzJnFJ6k7T010AQyzmidwEq0f3B774eSFq8JKiCxCvBrDcnOm7MTVatUJf9ed6N6W//nvVzU/V67ZSuXtR7N/0D2goxJkSdfc5zN9jjI8Egd9lpOOvSMYp0xVj+JJI9zEY+xkS01tk7zaRwxaRkB8SXaOuY5vHpXrq8NemOW1u5r+WZ4iIGaX+7RnWvGRJGHsn4oedMrUwCPZm4eD2qkYc3gbz9vs5LzXBhM73JVFCq7OI+ku6QdDGCBJGIrFkYEL0SOwIQ/h8nQt6UuhK8Iz+kvYT5JHOm25l3CbjJs4utqk+QAQlTXEeMev+KpYFn3nQ1fpWRaYEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04b5e393-e7ad-956c-dbea-8203b6846726@suse.com>
Date: Mon, 11 Jul 2022 16:32:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: Arm64's xen.efi vs GNU binutils (and alike)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52a9c03a-2764-46db-3e4d-08da634a27fe
X-MS-TrafficTypeDiagnostic: AS8PR04MB8658:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	evMCP5eFuc6tok0h2OiuipOmKIVJmWcEl0LVrwb6+UMPiqNy+eU3wdJxRWaT56VShtyfYmODJhoa+WZhBMBx6Kv1zX4hpDqyg93k4wu0zqSkPSFooK31dFQl6fw9NJwozSKgGuVPfnZytCsN52tBp96E+6ZSZTVyeV92rnqnJ11R0tT2qCqLQ4jHaO+3EqCtcdDpS9O7FgOmcHg8XPT1BaEbejGeN1mvO8/c6WkTsrLOklu0tYFJbfIOdMgH1a4yOZAcKQz93I/t5VZWAmxN1eelWi4D6eEicPwlw/oKMd+CnFdutKsigR5iH6x58VKXK/dSgjalIxoyvAoo2lFZT4b0HqAdlhxoOJm1KjAazBXFCnIJwDid0ut/2TuCdrigOjuPUsfb68B7tnCbQgs9qlxd8CZdS1JBt5DiRLubg/b/Mv+/+3FffgZYPdFFQzkP4OUUUR1IVU6q9KNSJNpWvyDUaGdWQmZHpNN0GjIcq3SwVfeogJ4YV6qQbQmscO2LjEmEyxT2h2gfz+M3B4CaOLXv67NpOKO9YKlwyntZR0daZbTq+BdpMfGyV9K70WF20DFGTwZxW8ahbpXK4yyX1eZa1k9JoZkoz5voKq9NYJ+DEhNp5qDa2RexoE+3sGtSqbw1xLnp+VjKwirAqGXaMKdOQMZ+7pC1wqB5vn81YSEX7Mg4ZoR0szi/18ARzDEFODnwtr/Y//k2tI9eP+10W5PbL59VgfYuHl9NfFTvFsy0+aya//w+15YuDqOe4Wl87+PLv3gjL6n1kw62KAmaS3QGRwi4bTWniolAJmKxe/H8ES6GVfTNT5uoUXek6RE7lddNhR8HM1ccz0EycTuiCa/x5PbqAmaz8zziXDXtYQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(366004)(396003)(6486002)(2906002)(316002)(6916009)(6512007)(26005)(6506007)(54906003)(8936002)(31696002)(5660300002)(36756003)(4326008)(8676002)(86362001)(31686004)(41300700001)(186003)(38100700002)(66946007)(66476007)(66556008)(478600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXFsdDJwblFaY0ZFNUU1aVg0dGdFUEMzSmNJZW1RRGExd2FYeVFtZnFLamJD?=
 =?utf-8?B?ZUdrNGh5bTlDc1R0dVpYQ2tWZ3Z0S1hpV3c3aWUxdUIxaEJPTWZpWTJpNUhU?=
 =?utf-8?B?cVYzaWpZUFRScUpBRlZPR3lUb0VlQUVCQ0ZyaXdaQ0wzTm5ZSER2akRPalM4?=
 =?utf-8?B?cHUyYXVHQnZHc3Jmb3lUaGdQRDcxYWs2WWVlWEJXTkM0WU15bGJpcXFLTnd4?=
 =?utf-8?B?MFlKVkNxUnRkVXMrRlFJeUY4U09MVEppaS9Od0g1bDM4Tnc3ZGppVnBMa3dN?=
 =?utf-8?B?OXVBUkFUL3lLUWxzZis1aGg5NXVjN3RxSUhVWkZ3aHp1blBMVzZ4cVpjcWcx?=
 =?utf-8?B?S0ZRU1dwRzVxN3Y0enlrZzlBQ09BSHo2L05aK3ZSUlhDNkViMWttUHAvWWJ4?=
 =?utf-8?B?ZW1qNy9FSkhBWGIvanVvUWhnNDRVZE9sRzRJaUNGY2lZSFNDaVFmdnJuVWJh?=
 =?utf-8?B?ZDZzNXZ4cWZmR3MwWGFmMHVpeitnSk9yczNtSUxzUzU4OUorZXZmcHhMY2RO?=
 =?utf-8?B?UVVCQWFQQmlhcUNtalZJWXNuaFBpWFFscVM2Zk8ybGU4Y3htQmdIdTNTWjdz?=
 =?utf-8?B?NGZranc3TnJ3REZFYXhONFdNclN5OEhEK1IvcittU1RYZTNuaDJLcW9RbUxw?=
 =?utf-8?B?aStlbEtNUU9NRDhCcldCY2ZJaGEweGlHUTdJNExzaHRMRDJ4dmRyU29ldDlC?=
 =?utf-8?B?QWdRV3FOTWNRLzdHU1VtcjgvMjBlQnYrYXlwOGlwTklzem43dVAyWWhld3RI?=
 =?utf-8?B?Q2VGVzJLUTkyY0RSNzJtbXQ4WmdiSG9EQWRiNk55L0lxdFFhMVQxaXVlVER5?=
 =?utf-8?B?bDlmRGlISzJkWmc1T1JpOTROakZ0bjl5aFR4QzJoWVlGOEphcm4ybmF2MHhj?=
 =?utf-8?B?Q3gxak5pbnhBdUx4TnJIeVNUZy93YzhTdmkzMkpUckdIUXdsYkZid1VQWkds?=
 =?utf-8?B?VnlKS2l4eThVOW1nbWdyOEdzMFFvbEdaZmxqNWtpTU5JNGtJSEUxTkVsS2Ro?=
 =?utf-8?B?OXpvazJMN0t5eFRBYUxDYU1nS0t3SWtVM3hXV2Z5UU5WcDBJZXdWbUQyNDJF?=
 =?utf-8?B?Yjh6Z2o4R29Kd3ZleG1QRnJrWmluUklmSmRIWFFtZ2NpWXBvTEQ2UFpFb2w4?=
 =?utf-8?B?RHQyL1AvWGNKeDdqNmUrMlFwTndWV3BEZXVoUjI3RU1HT2hsWGs5MEpXTU90?=
 =?utf-8?B?YVc3TTFFR1Fxb1lscFhFQXJ6TzhZbmwyMTNic0Q0NkNUbCttMWNCb3Q0UUFj?=
 =?utf-8?B?aXhOTXc5Yk9ubkozQ3NlRGRGaDZqcmlPS2YzT3RmSklGTS8xKzFvd2p5Nzlr?=
 =?utf-8?B?RTg5NUx5YkNuTmhUcXRPU2w4L0RkZDRQZUtadWxVbVN0VnQrdXFMTFFWblBM?=
 =?utf-8?B?a1pXYjZHWjJPMzNKcE1EWVRTZnB0U2w5eEVka1k4cFMzNmhFU2t5dzZ3enJQ?=
 =?utf-8?B?dE83NzhPdURvQnYzOFNwRHR4QS9Fc0ZINm90b3ZPbmtiRUZlMjdtQ21ESDBp?=
 =?utf-8?B?b3hUWG9FOXpMVlJNRmx4NWVYTVBsd0ZIV0lsK0JrT0pRYmZQU2J2OWNiS0dZ?=
 =?utf-8?B?UFZwOVVIeit2bDJ5ei9TNEVKT0d2WXFMZDRnblRoTWVhdkRTcDN1YmZXeWRH?=
 =?utf-8?B?bFZpQ1FIc3pLY0pmR0Zhb2FCTDgrYmpubWdHOXRpS0ZJZE5SZ01Ma1BNU1M1?=
 =?utf-8?B?S1FqamZ6dnFhL0s3TmUydTVCZ3dHMGNmcFRNM3dFVmxkSlpCQ3RySXYydWNK?=
 =?utf-8?B?emNEY3pvSFVSWGVIS2xZdmdNM3lYUmFRNFNsaCsyalZob1JTdU80RlZnZXdm?=
 =?utf-8?B?SlhmMUFmcWFEeUJ5eVdMRWovTHREOWhDMi9yOWJzNDNzTzdyL3JENjdUZGJp?=
 =?utf-8?B?UXpXNDhyQzF0b2FuYjRQSXZhcUxVbzBzRzUyQzM2U1grK003N0R1RkhZbzVF?=
 =?utf-8?B?TFJRTlowL1lhYVV0b3RjRjdNTW1EQWgwdG95NXM0czVBYTZUamZteGZuSDlv?=
 =?utf-8?B?emZMRWdsYVRiR20yZ0RKQzNadVY5QjE3Ly9ja1AwcmQ2N0JYMzl4aUVxemVC?=
 =?utf-8?B?RXhzdXJuSHhvZjVjeVdndE1DM1p6VFdkRnUrNFRXL3dMZVNhZWI1V1ZJblpH?=
 =?utf-8?Q?RdKIftJrv6UiYXeGqzFoOq/bZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a9c03a-2764-46db-3e4d-08da634a27fe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 14:32:17.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fb9ZB32t/onUT1T/OHVmMF7OXV/FocU3q0dDLbxQTXUczXj0EBOrA1g4ytumAz4O0DZVlYYfkwQm8mubxVRd5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8658

Hello,

the other day I wanted to look at the basic structure of xen.efi. First
I used my own dumping tool, which didn't work. Then I used objdump,
which appeared to work. I decided that I should look into what they do
different, and whether I could make mine work as well, or whether
instead objdump is broken and shouldn't work on this sort of binary.
While I'm not fully certain yet, I'm leaning to the latter. This is
supported by GNU objcopy corrupting the binary (I assume this is known
and considered okay-ish).

Many problems boil down to the (ab)use of the DOS executable header
fields, yielding an invalid header. The first 8 bytes are instructions,
with the first carefully chosen to produce 'MZ' in its low half.
(Oddly enough Xen and Linux use different insns there.) This doesn't
play well with the meaning of the respective fields in the DOS header.
Subsequently there are a number of .quad-s, some of which again yield
an invalid DOS header. I'm therefore inclined to submit a patch to
make objdump properly fail on this binary. But of course with both
Xen and Linux (and who knows who else) using this hairy approach, it
may end up necessary to continue to "support" this special case,
which is why I'm seeking your input here first.

Furthermore the fake .reloc section overlaps the file header. The
section is zero size (i.e. empty), but a reasonable PE loader might
still object to its RVA being zero.

As to objcopy: It shrinks the binary significantly in size, removes
the dummy .reloc section, re-writes fair parts of the DOS header,
and extends the NT header resulting in the file position of .text
changing. The size reduction and possibly the movement of .text may
be okay as long as the resulting binary is to only be used with UEFI
(as it's due to zapping of the embedded DTB and the unnecessary zero-
filling of .bss, afaict), but my understanding is that the other
adjustments are all fatal to the usability of the binary even on
UEFI.

I may easily have forgotten further anomalies.

Jan

