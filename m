Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814270F856
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539064.839568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pBS-0006u9-Lf; Wed, 24 May 2023 14:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539064.839568; Wed, 24 May 2023 14:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pBS-0006qb-Id; Wed, 24 May 2023 14:09:46 +0000
Received: by outflank-mailman (input) for mailman id 539064;
 Wed, 24 May 2023 14:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1pBQ-0006qU-Tc
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:09:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1024558-fa3c-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 16:09:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9918.eurprd04.prod.outlook.com (2603:10a6:10:4db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:09:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 14:09:41 +0000
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
X-Inumbo-ID: a1024558-fa3c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C55b8NMvaDIGjFXBshyxWprU71e5uP2EJc5d33VOr2KxPWpp/8Bmb+/fErZIsxwlBS8QU1mXeOQbirdnzER5a2f0ZMKJADirZ4tge5cA5A5ExUB01k91WWyP7//IajZAxj2sTtp9n7PXII9ywTI55zV2gZfcUYyYwNX5qxJiV8mMqFrzQ8LyTpXCdKYkJmA8MTsBux+75xzbX59hQJfeGRuz9G/glDYE6bwqZVpvDyUWhoY2OCpaYhbSSF5lMB3iAWGI/bLsACiRslaFmZgSdJkIBfZUAuuizTI9LvSFTZHGpg8XEulj9YRBlnr3wgoEHNEW68IVk/Nq0s1l2QPokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAeBHMFs+GjiCVZ8B+czgLLU3xN46DLXZkoDfOs5V1c=;
 b=MYvb4i2xhygdQ42Y/8b5V5IQxS9ODJ2K8g/OJgoDunepZaUmeXgZCqp7ix96cQawY6xHt/ZppEOHg4fciS9UDC+8xiMLwIaMFClNyxkVMAX/LJOuh50YsFvk2JETvgIWNMg3CMBfsqz6LzHqaI53r/05scB6sePcl8GG460uqcnAASI4iNmFYK52yWTcvEbdAkQM5Tc8pbxGBY2d1Zg6t6pmnOjO8WhcSy5ADRrnHI7IxchMRJdV+JqKExJmhXmb7Os4aCky/l8sogp24Jc0n3JygincuayXgEQADQkBHWRtW/gk7yniURMKZKsW6NRg4EWc6vJMxcrOELhgW28JbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAeBHMFs+GjiCVZ8B+czgLLU3xN46DLXZkoDfOs5V1c=;
 b=rQ3Ynfn0vfg365qscZrLbudPGSm9qOBQ5C+wzMnn12sgXm7R1VBzzbivC8/9Xw/RjBH6Rlgp3ov3wP5RnhPcH+nCBSWawEmkR0AFcWHzF8g1oHY0VZSmhUc2IdmyMUPuoOwskRnzCTe3GwCCAvX+A5PfVyzLD6WX9eLC1HQY7uQEznc8podGRRUj/Elh7lyyaaCeri3VMXmCJPDaKxBk/3BIGgR1G3TIvkkw63ykm6ibTrgUonzn4Rpf0VRZEPiadqZ+BeYBEeDhjM6gK+Zp83h2uCHiedIS9Wfr0+XrMr283uJ9BVl3AeYcqKOrgdcW+8J1nu0ly70ft/AkPt0vaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6cf71fcf-789a-e80d-2d9d-407257fe5e3f@suse.com>
Date: Wed, 24 May 2023 16:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c0c222-8093-4b9f-b517-08db5c60844c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpsUolwfNwMvMH0Yxxco2zLLGkzjGyZf3BEs126xvCLyh5nUrZxdrgWFCUN6DkWk8hG7aF3QDMW01RsjxuMJB0tz1WSBUd6p0AfIB75WMpgcwOBbXw2LNwygHFS0wluoZpQE0Lfl+TT838P1S+5/3A5IHKQHcnGPHggfcORxyz7Vuc45U1+LDZ8bHkiEEPJZKltawN3u/33NWhkRpkhzl5mJ3e3jVvwVL1J2GniyqUaoSYd3b2GvJqDfZ8xdd3knWKqm4EKApaZuGlITdi/LzvS34V2e+ZkG4zhRdLZX5n+ACT2qs0Sbxf2cmzG/T6ePkHMQLOzr50zwF9FBEsZxsthhUCcSHlgwoJSXDoUZa2nsnMChgAVDm/Tak5lhJ7qG816JEvgPh1d0TnAbXjt2bH+8ceJRTkddnbll6tcHyWi63bP2t7URNjarcLp/OmF1fukvZZaVRFtrWjXhk1IPh408NNabEAl8Fhf2z3dq3w86uM08RTRzpyns88A5xdJCNK2P1v7bXyahj8M+drHpUD+Y1lUr94Uld+zZ1WlyxDsD11RgwRE8/4AQChjat65l2I8f396Iq2lNGBToixHS6izOFMFjSKPeP2n6A6d1ZlldJ24dG72Jcv7dVJ51WVHqmRHz4RsmuZ3ZHffaLCOKJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(53546011)(26005)(6512007)(6506007)(186003)(2906002)(2616005)(36756003)(83380400001)(31696002)(86362001)(54906003)(31686004)(316002)(478600001)(4326008)(6916009)(66476007)(66556008)(66946007)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW1lU0F5OXJNRHhPMUlzUElWZDcrNEs1Yk1nNzA0dWE3N1pBRlZpVi81RzAx?=
 =?utf-8?B?UUdIdW4xOVJ6VE41NU5SUVhKbE5hTEk5YnVkaUZ4TlhQZEIyME9FMmVNYTFp?=
 =?utf-8?B?NkpBT2JaSkljbHRGak5PbVBOK0l5eHVzblZUa0YzOEszQU9nQWJFMWwrRndt?=
 =?utf-8?B?bG8yQWxlR0ZYM2l3TGp2VWpvZ3JpMmFqTXBEbHpFeG96bXIybERONXRzYUps?=
 =?utf-8?B?R0xOOTNPWnJNelRjMFAyajNqajB1a1ZudUxBU3ZsbTM0SHdmVCtvNUt5Kys4?=
 =?utf-8?B?NDN1NnFOQlg5UC9uc3hKTzdPL2V1YmlZQ1YxcW5ZVDd5Z0ROWTZhb1JyN3g0?=
 =?utf-8?B?Umw1UzVPcnltNlBjL0d3b3dnWkYvZ2ZVTm5BR292am05cDJWOFQ2YkdvTTFr?=
 =?utf-8?B?Y2dLTjJkUjZ5U1NuNEw3ZUNSRG8yUmQ4b0JjU2FhUWJBYVdwQ28xbFdmRXM1?=
 =?utf-8?B?aCtHaWVBOHA2ZnhNR1ErVWxQU0R4TVlXK2NXUjduUU1iSXRFT1AwQVBjNVhm?=
 =?utf-8?B?NTJWb2hOTDI2cHFCdnBLdW1XZXI0Y3N5ZmZ1WGpteDFMNEtUVmlZdXluMmxv?=
 =?utf-8?B?RVZTTjZwTG5DbmsxcU1zK3hjTng2QnpFUkNYbHJDUG5mSW5mMi9NWklQeU11?=
 =?utf-8?B?SzZzelFSNGo0cUZmMUlTV2tqUm1PbE9QZXpxN01pUHFXeE5tL0Q4UXRFU2xE?=
 =?utf-8?B?WENRMkJrSTAvclVaZStXTGJ1cUpxVlhxem9KZC8yaWl5QzZyWFliUjltTnI4?=
 =?utf-8?B?WDJEOXdpbFRKSlVUYzNmNWxDN3RLNnF6eWI0RlZkalB3bzhrN0dheDRYVVVp?=
 =?utf-8?B?U2NvYkc2RTlGZXVhQUxlb2thMENLM0MwazNZTThSVWFCaGVISjE4TlhyTjRs?=
 =?utf-8?B?SkdNczczMTFmZ1dkZ1dFQzVBd2pPYlF4WVBob0k5OS9VZWw4bnRxYVFnSUFB?=
 =?utf-8?B?YzIrcHdrSnhOS29GYzNydGpEWUJEQThWZ3NsS0RrMzlGZGJxdWxoUFR3RUs1?=
 =?utf-8?B?K0kwbTNkUjJjeWNsNXZxZkVBVWpVU2ZNUC9DVk91SmdtZS9Mem02ZS9EckFS?=
 =?utf-8?B?V1JsakJpRXdDUjBtZ0F5K3dwQUtWeVV4YWhVeVFuVG1LQXdpWkZsdFBzQm1H?=
 =?utf-8?B?NWM5eU01M3NHcG1TYVFvVythcUFJWVl0WUkvOUt1QXQ3Z3BZTk9jZmpYZmc4?=
 =?utf-8?B?eSsyQ0I4NW5PNW1mem5KNTk1K0NWeFlWdlBRbG0xZlNqbkR5NTQxOVJjVDdS?=
 =?utf-8?B?b1hkR3ZTdWNxdVcyOWpwSVVZdHJBS3Jyd0g1OGZWWWNweFIyK0ZCbGtCUWdR?=
 =?utf-8?B?UWhoOG01S3ZHVmMxR2pOczhrWFdZSVp5VkVPWCsvOURqNExKOWo0VzNVN2Va?=
 =?utf-8?B?TzZEN1lqeUc4d0U5azdVZmdoSURzN1E4QWtoVzMxcndwK1p6OGJ6eHQvajdj?=
 =?utf-8?B?d0NsNTkxbk9LVWdYSVlEa0wzOVRlVVVqMzRtNUtIcW9xR3h1aVJJWVJhTDYy?=
 =?utf-8?B?K2VpU0VMTlZyMkg2NzlzRzFsbzJUc3dNenhKUTBWalc1dnljN0c5WVVuZ243?=
 =?utf-8?B?czFWWUpoZWlpTFFTcERaaWcwMmE4ejVFTmc4QllTQ0tNaEsyK3kwYmZrSHB3?=
 =?utf-8?B?SWJrb2s3alo5b2E3U3EzaFczeE5IaU4vTlpDSlZidmZGYUZxUEtOV0dhUnJp?=
 =?utf-8?B?NUtTTXdBSzNCMmFQVnJtKys5MkxjQ3dSQ1dxUXJqdTZ1aVh4WWhFczkwVEdX?=
 =?utf-8?B?VVhYT256L3RmcEhoaWpvOXpmRlZPcDl4K0JhMDJTaHJsN0l0ak9JSk9oSUhx?=
 =?utf-8?B?aVN1eE41dGZVeFZhOTdVMFBqSG01NENwLzk0b1hhb1FrUmZET214U2VKQWg0?=
 =?utf-8?B?M01kWUMzTTJ1Z3J2amo1L2JsWFR2Mzl3NzJPaGYwbjZzeUFtUVZIcDlzNmhK?=
 =?utf-8?B?Y1VYcXpERDV3ZUJKUVcrNEhhbnpvOUgrY1NoQ00yNHNLWm5ncmxXY0t0QllI?=
 =?utf-8?B?ZjNWc2Zqamt5amlvcnd3SlZnU01SWml2K2o1V2VyRGZMaml3N1FNN1hLMXdR?=
 =?utf-8?B?bWtCaW9haVY2Q29zY09nektSbEM2N2xQL050ZkRER1N2WHBNaGJZV0lucm1y?=
 =?utf-8?Q?7+h8cMk73IUltDNzeA7cMxHMg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c0c222-8093-4b9f-b517-08db5c60844c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:09:41.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PhcH3gajJY3ndpu9DnnYO0HJEPKLzOxNY+VCRaDw6Gu12wB4lcA+vpfW8z+KkZKODLAtqAM3u33obAputtkMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9918

On 23.05.2023 18:37, Anthony PERARD wrote:
> Use $(if_changed_dep, ) macro to generate "asm-offsets.s" and remove
> the use of $(move-if-changes,). That mean that "asm-offset.s" will be
> changed even when the output doesn't change.
> 
> But "asm-offsets.s" is only used to generated "asm-offsets.h". So
> instead of regenerating "asm-offsets.h" every time "asm-offsets.s"
> change, we will use "$(filechk, )" to only update the ".h" when the
> output change. Also, with "$(filechk, )", the file does get
> regenerated when the rule change in the makefile.
> 
> This changes also result in a cleaner build log.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Instead of having a special $(cmd_asm-offsets.s) command, we could
> probably reuse $(cmd_cc_s_c) from Rules.mk, but that would mean that
> an hypothetical additional flags "-flto" in CFLAGS would not be
> removed anymore, not sure if that matter here.

There's no real code being generated there, and what we're after are
merely the special .ascii directives. So the presence of -flto should
have no effect there, and hence it would even look more consistent to
me if we didn't use different options (and even rules) for .c -> .s
transformations.

> But then we could write this:
> 
> targets += arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s
> arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s: CFLAGS-y += -g0
> arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s FORCE
> 
> instead of having to write a rule for asm-offsets.s

Ftaod, I'd be happy to ack the patch as it is, but I would favor if
you could do the rework / simplification as outlined.

Jan

