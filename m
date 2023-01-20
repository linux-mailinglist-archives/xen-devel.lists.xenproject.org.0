Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFD6756C4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481817.746963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsCT-0006uU-NO; Fri, 20 Jan 2023 14:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481817.746963; Fri, 20 Jan 2023 14:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsCT-0006rV-KA; Fri, 20 Jan 2023 14:17:01 +0000
Received: by outflank-mailman (input) for mailman id 481817;
 Fri, 20 Jan 2023 14:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIsCR-0006r7-RA
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:16:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18dc7638-98cd-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 15:16:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Fri, 20 Jan
 2023 14:16:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 14:16:53 +0000
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
X-Inumbo-ID: 18dc7638-98cd-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A72YYcSZI9WIVOG9uVXtvsB6lmPuFOH/2yP/LXzM9xMyPU5NStNudA7ErKvp3l1GQEJlEVRBzQ5TJjhBi+/ko+5jA8wZXxBNvDfwd79b24YvebIaJavrNOu3MAEyqf6ShlZzGv5v6vy5aCH1sux/4yjZk9nD9PhTNiK4AaG6YIjUMSPTTRrXMFpRSsAxCEBOTyoWncFsvIqK5Ao3BxSalgPRzbNt4eWmUBXpYyRziHACdKCXD8YVtiqKVYgO6dzraURR7Ywy1sCg6jSM9pWpPZvI+5E7dNZ1cgXqB4i52Kc3UTdwCbqIF8xTz4QYBWEaqc4LQWpXEFVemnNfkMsOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAkNAJNbpqHnz7hWUsIgJtVYVxBDwYG/EWbdIQSgTGs=;
 b=i+gsLtb44OV6Pt+msawPBX10auBbUw3p/Sf64JWeMTpcUK4XoNhdfV0kCY8Sy+E2/+JoTL7jCXGHoYYmInLbG6yuU5aB6odNgkntm6PIB+nqNwnGGFR8og+NUFN6reVTzrte8uY2Fwt2I7cjqaAslAKkxDA8pOOACvzmXm2+hjObBODXuL7Zkkd1F1HsP+OedwLVev3Xd8U6ABCl5rxto+35S4F6ElOE5wect1PB9lU6IDZ5t+K1bDk1St4LaOxBbGpF4xKPYU3lqbCSEIgZvECMKn3BP8QKWSm8lTgKSCIX1gPVRqI0goVy8afpRuzTYLrbo2+xawzDE4w+yHcgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAkNAJNbpqHnz7hWUsIgJtVYVxBDwYG/EWbdIQSgTGs=;
 b=qZTKUyfGdJc8dQZpunTpcY1o96kPuLgTx/691DXEnhokzb+a1uUIVOAEr+vRJrIvou2sEK1CixLSsJmcCXD2A1w2viQEs6QnRaBDWTVhT5p6Da8LHrTpN5chs3Fc3LmrVDipd3xN2DCOLf54mkZUl8qXbFUad+xRq9pV8IB8YfioruRTtKMIinaSE5TIhRfiluC40bbCshqFkR/TXIGW3P0Y9Bw+MJg5hLjLXdv6D9CGMagQfq3TqMcC6sHqJ5mgwHUpZpmjoEbYRde9jjEo58kBpn9W3iJ3MzytGdz/5w6mjGmAagmBAfmBYnqIAEk3v0520tMKGxIMPtJD8JnAvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5c7af20-2694-6f09-2c06-81e4bd338b8d@suse.com>
Date: Fri, 20 Jan 2023 15:16:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH] build: fix building flask headers before descending
 in flask/ss/
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20230120133626.55680-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230120133626.55680-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: e70f0fa7-d7ae-4fba-243e-08dafaf0faaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/MCkgIWG1KnGk+CSWR6Fr8A7+bjlKYPcuPyj7c155YtmFP1TkboGmhVj5frGQjK9JLXTmDEzWTCSnj3RMu/X5cOexD7sJ6AtS5fMSAiBIpZ7bKDYL6+3UdYpSxSgdmMiA3bgjh4YKcm5XCdFFHkcs3j/cR6GRHrsmYlAUleNecgT12V2fFJ54selJfXNAk1XE/cbzZAZJpGcNRMT0x6XH9ETq8QCTOV2F1luvPBIfZqJvUZLKn9drYDaUFLSOV04sOmZ/4jJmV8pjJwxnOP28OBi0X9fiSz7EcSO7yr8VRe7fj0iSeaMzscecB/TkQAKdYSVlbOGzFomLbrWDIeADNdht+WqF/XOdZpPCxhYdVOJKcy+3J9k1wBSLUi1UlDhLYVECwmxlzSo0TS4SlKE5ji8A6nZ6THp39M6GNLfr7NBDLj3G+VG04XtuHsxkX8dNtnN1ep0ty97ZZX7sg3U3+rkt8khKvwraUL0G2NDWgqv6V6Fa3ozihin7LEW+VOBQbVrEsRSgI00rqDoi+eNJErLoqcBHHB18HmyOwkqiALXqNZG/0eWuvDe5ksFZvzqNXA4wVPSG824I2CNCxVdFx3Xt3Rtx5E77+JQKaE2lznpRx1FdeH5V70ckUlIC8LxUrjoHinjA/nSNTXeSIso19ybs760stjFwnhSfekP7L3mgSUDE6mFdpS1Yy7odT/kLKIFzGyvSsVpZL+6TarFsC/xhPKVAMSKFa40j3gro3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(53546011)(316002)(31686004)(6506007)(38100700002)(2616005)(2906002)(66476007)(66946007)(66556008)(4326008)(26005)(478600001)(8676002)(6916009)(31696002)(186003)(8936002)(6512007)(5660300002)(83380400001)(36756003)(41300700001)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkdSR0psSHVCcVFKVTdBamZkOVBsYkRrNndZdnRsV21NaGtwdnFENVRZY1gz?=
 =?utf-8?B?YW1tdFQ0Uk56aUZTL3RBV3V2TWtoWThsUWVWeXZpazdTbzZaeTZyM3NNUWpu?=
 =?utf-8?B?bTVlL2FHS29kZVNDaEFycEt0SmxoWGNNalZQM1RDY0R2Y2toMUFsZWswZk1t?=
 =?utf-8?B?TlU4QWk3S2lhalpDSTM1SmY0aXM2TkRxOFV6bjVKaDVpL2UzVXRpNEJOYVl1?=
 =?utf-8?B?c2tvdEEzMjBlc0ZOQm1ab29scG1mdG96WFVjWDVNTWxaZk1OVmxOYjkraWc3?=
 =?utf-8?B?VGU1U3AwVEZLNlR4U0RIcjAwR3FyNTFteHlncndRazd3YTI1S1FHY2xmY1Rw?=
 =?utf-8?B?SFFyM0x5bllZQW42MUpXOE1WV05xOGNtUk0yL2o5RlQ0Nm9RaDFhMHNpcG4r?=
 =?utf-8?B?M3B0STNCa1YxTmpxbXg4eEpiQXJGckpMRDRhSnZ2eU1RRWF6aGNSdmFSaEtY?=
 =?utf-8?B?bDlDSHQ0RGxSREdxZ1FUbnJnQXY2dFRCaGRoQUsvRm1XLzYzV0hnUXVMRFcw?=
 =?utf-8?B?SmFxS0VzRE1JUXFqY0l1TExVbXN2aW9WajF3QXJrK2JRNi81SkV1V3JsQkQ5?=
 =?utf-8?B?RW9sT0QzN0k5d2R3N01RVE5Hd0tTYytZNWZBZk1ZTWRtVG1iUkZZSWtNaitW?=
 =?utf-8?B?UkJJNW5YVmhzOVRGMTU0U1BYbk5Gell3OEVuS3BqallXWkZkL3hIMHljZlNT?=
 =?utf-8?B?OE1XczJ4RVYrdGtjR3NBMWVlU2p0VU90VytkZ1kza2VtRDdYYi9Od0V1OXpW?=
 =?utf-8?B?K0hLdFgxYyt1WFZLUVpmRG1Dbm1vY3ZBK1hjOFFNam1sRkNFNTNNM0NBQ3Uv?=
 =?utf-8?B?ZkhZaWR0aUJ0UGNhYzIzdkdtc2lBaE1GMWVOVkdaNUdXeXV6QjRYL2FYYWVz?=
 =?utf-8?B?WVcvOXdScHlXMTRWdFUyempSUW81Q3BSd1hTaVd6bkcxSjAySDFNYk83TG9t?=
 =?utf-8?B?S2dZbEp2Qkp3S3E0Y2RCZXdpdm94QjRZY3VMNmdPZS9aUndDc0hybm40M2Vl?=
 =?utf-8?B?T2s0d0JqaThIbnA5MU85NjNMNS92a050ZmthbEZoakpIamZRSHhsOWZDMldn?=
 =?utf-8?B?M3BiZDFRaWNnM3VHTWZuNnpYR0p0a2c1c2x2REFHZkk0OUNvNjFxY21odDVL?=
 =?utf-8?B?NU5yNWhJWXFKK3d2bWRBSlFjSktnZEJ2RnBLSW5pSC9VeGlDclA4SzZLbUFJ?=
 =?utf-8?B?VUtCS3FpNDNWbXVmS1Ewcm9uVjVacURSQlZXTDluYXJQcmUycjdFa2c1blYr?=
 =?utf-8?B?QXVLT2hUV3FHNFI5K3RsZWh0TUtUOHhPMXBwR0RqNUFPOXRvS0piNFlReHZ6?=
 =?utf-8?B?dlREWTQxN1N2MFpUREpwS2FsckIxTE1pRXNSNXdSSkZ4cGZIUzNBejAwUlZM?=
 =?utf-8?B?SXJrbWszU0gvSFF3cm5nVUxIRStNZGxDRnJxdzFUeXFvcFA1cjlZZkU1UVJE?=
 =?utf-8?B?MWpkLzN6VkU5NExETHI0SkZINlBQTndWeTZtcHc1ZkplVzc4ZTlCN2FpRnVR?=
 =?utf-8?B?ak5BSzU3R1BIZ1hBOXFaMmw0NnlETkdmSHpSSHZvOWw5Z29LTVpTb0dubmNP?=
 =?utf-8?B?ajlFQUQzdmsrK2tQVHlFVk5ZNGZhanRkNWUrdUR4VndjTHhseTBxczM4WGdC?=
 =?utf-8?B?OXNVNWRpb2RwY0RDOHAxOGdKQkNYVExsZ0dRTGFZOWdyL1RFaUtmR2ZtZ3NL?=
 =?utf-8?B?WXU1TjVPZnNkbEdJMStEcUhtVHFZQTBWQ3o1Y1lTeFM1VzJOZGJ5VG9NOXIz?=
 =?utf-8?B?QVUzR2VyVjJXWDRlTWZ0Y09DemF4ZmZaaU5YVHcxc0NzN1BPR240K3k1VEVQ?=
 =?utf-8?B?QTl0UkFJcWo1czljOEFybEdXWkhyckxFQVIvTzN1K2FhYmMxNkFKMDBoVElu?=
 =?utf-8?B?a29jRGJJcTFoMVdyazIxSUhHeHFkTWZkL0hSbEZGTFRhVVNuZy91SStCU24w?=
 =?utf-8?B?dkQxYU8xYlBPN2dvYXRnRXoyWDZ2NHRKdGI5ajBScERtZzVZZjRmMmtxUVBJ?=
 =?utf-8?B?OTgvOVpnWlZ3a2MyZWJTTWIwSUtmWFdZV1RGTFRFL1U2dXAxSGxjOGVieUdV?=
 =?utf-8?B?bXRtbXNmd2JNdkY4cnFrV3FVZDZKNEJZdzBFdDlpSVEyd3pOQUdaWG4rSWVv?=
 =?utf-8?Q?Y4vsuY4B41zRkfD2Ot5I+f62b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70f0fa7-d7ae-4fba-243e-08dafaf0faaa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 14:16:53.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBmizQ8yw0N7+4VO6qh9Wtq8s5xn0IhioCQTfZghD6NaEMHnZ05ICn5+xRvvjaaRKqZXfyhRRg8bb9Glu37ErA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

On 20.01.2023 14:36, Anthony PERARD wrote:
> Unfortunatly, adding prerequisite to "$(obj)/ss/built_in.o" doesn't
> work because we have "$(obj)/%/built_in.o: $(obj)/% ;" in Rules.mk.
> So, make is allow to try to build objects in "xsm/flask/ss/" before
> generating the headers.
> 
> Adding a prerequisite on "$(obj)/ss" instead will fix the issue has
> that the target used to run make in this subdirectory.

DYM "... the issue, as that's ..."?

> Unfortunatly, that target is also used when running `make clean`, so
> we need to ignore it in this case. $(MAKECMDGOALS) can't be used in

s/need/want/, I guess, as nothing would break, we'd just create files
only to delete them again right away?

> this case as it is empty, but we can guess which operation is done by
> looking at the list of loaded makefiles.
> 
> Fixes: 7a3bcd2babcc ("build: build everything from the root dir, use obj=$subdir")
> Reported-by: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -16,7 +16,11 @@ FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
>  AV_H_FILES := av_perm_to_string.h av_permissions.h
>  ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
>  
> -$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
> +# Adding prerequisite to descending into ss/ folder only when not running `make
> +# clean`.

That's then for all "clean" targets, isn't it? I.e. maybe better to refer to
`make *clean` (or `make %clean`, but I think the % could be misleading there)?

I'm happy to make adjustments while committing, as long (or as far) as you
agree with me doing so.

Jan

