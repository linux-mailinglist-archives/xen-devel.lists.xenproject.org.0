Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CA55742E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354506.581650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HX4-0004IF-6B; Thu, 23 Jun 2022 07:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354506.581650; Thu, 23 Jun 2022 07:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HX4-0004FX-1o; Thu, 23 Jun 2022 07:45:42 +0000
Received: by outflank-mailman (input) for mailman id 354506;
 Thu, 23 Jun 2022 07:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4HX1-0003bD-Qg
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:45:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30080.outbound.protection.outlook.com [40.107.3.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 796fdf30-f2c8-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 09:45:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2395.eurprd04.prod.outlook.com (2603:10a6:3:22::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 07:45:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:45:36 +0000
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
X-Inumbo-ID: 796fdf30-f2c8-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8GoNPnvKGTetEWJHAEdML1xQL5Q49LvCMTF2dZ/xxpwuRiI9h9A1yO+GRo6TYMSaiy05f8YGKfwTJKY6PMOs30CpZebWSLmxir+41SoOdfFdGy3TT5MQC/d2vgoTtxjLRoqw/Y/bCPIPzPPfQGxZJzQb078n/BAk8cf1KvEa+a9+3Cjz87UMUsx23a+RL9qUYWoamz2sHR3s/HTtQiX9FcEi5M2rEg9wgFMz5UydPbZlfAwfnhPNfGgCGh96mOE2aJvCgGkMBQg2hVOMkhaniOU7npY29Au8r+dcLsB8fd/0ecHGdI5nsGVJXC+Hgkn/5bgDwqFAV0DK4z5f0D3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S2XZHpw7oYuU0uz4uxqO4dJCzVpZtRR7V61f/opCNw=;
 b=byEc3hi0iKpBEmivVpLS6exSMf22+B6AMyNIcn+l/grPej8aMu3uT07/WzVps/HiqXmieaSUL2xO4fLUTtqyTqnn0/wEWe+BmaVjxgYXbB4fZBTrXL6lbsgbEDvoZhdNZDiN2aYaOp20ZW6uo2Bigs3Bw7j+zsNU5iaoG1mA6Fq1gPfpHyhaPllAvT7YRiZMNRpAK/ks5B4bTTz7tLs7vvE21RbcWUuZiTr9iO5y8QzDJLin7fmUza+DLxK4JFaL+6mfGPUt3PA05N0LppS2yaa3ZYoGSQqkERd7ERWFh3HlQh9HqNyP4YEqIXtj13Osv38EcGKlNtib/8PNRGffEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S2XZHpw7oYuU0uz4uxqO4dJCzVpZtRR7V61f/opCNw=;
 b=Jn1HGSKqJFuYwK98rFuF9BtbBlxZkAM0TxVxcYR8W9ez4XybCuJVJc0CDHqZYWvzqV7lrr/wHOfyzFts+Y0dYOLSC/+7SyfxsnW5Quj+ZovUA00l6tYVhyvCE1tTwgwYfGbmUfinL1VtGvLEpwCigC0j0BH9YKUUDfbGjMn2nRxjPkPLKCZslCtIpz/nbJy2lsqWGuVQwQhRezEPJpwP4Pdvw9/WA4FGr8TXm7VJzCLpFb2KvozMuxJaNcMLH7KC8R4ghk++bcdVOGslshL6i465jrCI1TiwrL1qL7utlnhToFB7LbsWcpH4Zi9QG4VFHyW8ylRdnWB4uJpquNVVrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c06b39fc-0813-edf4-9c0c-a45f8648b1b3@suse.com>
Date: Thu, 23 Jun 2022 09:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v2.1 1/4] build,include: rework shell script for
 headers++.chk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220621101128.50543-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220621101128.50543-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0510.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 312a3b2b-7902-4bd6-9388-08da54ec5c0c
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2395:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2395D0E49FADD798677F20CFB3B59@HE1PR0401MB2395.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8TcPEkW9DQwIQTxpJHqyHjDvvrlS3iqZt4IN2pRUNeyI4ujiFeX1Wgk4zAT0w5WzDx7nc6PVZaW3esKWE7BDW2WS1c7uZpKyat94OUp91bTY8HKe9EiqzKt0wf8oxdpl9QU8pMSoqWj61OzxiHZKCI/YqO9ohuKtGfQoUF1H23iQW9Qe8/6prNtT0461Brw4DaWtagp1YF5DDiDWpeKwAxvXgF46ZKYfC0+dYqZvIIdFIc5GEZX4MIk+rDVwKrxNMiBkK0eQTYbesUDdbpQVMn2RP7gI7RowOUF35Odmp1mpz9/e5g42uAclIjTBtLIAh6YvJsH27Abx9KgIjjF+ObQcMVAsr0yICkatvsI48k61bSGj7cjtpPNy4eWqZSy1lvNt+SCqR5OmOSkrGm955wUMrfcnxYsxqVNDbVmMc6MIDkfmPI8nhmbR19Yi9SADKT4zTMLlUXQLd+q445HSeWirxarcuOhqPA5GP+JhMPZYcuhVwg1LUgAgG7exnQ/PX/zPReyp8utzifJuz4fmQcRv+rBWTCxsv7mJGWCuwLWoS1MUucp4rUJMdycelOvk7jni2G41WfJkjCijW8dKLBVHr/S9yQRjZLE57tdKSPmGnGcjrB8SfPZG7vrwlJLoJTSCatVjRYy7GJfOgEHcNldTBe6kuk1ZYdZ21oVpP7DL1Grq0aYznxWy2WRAwdmWBvK5kNH5fYHV15pgqqKLVs8nI3TFuHQj6GzqmY1fG2x3uipK4g9tCqRni7x7fp93qup790HkaPN/Pcg993rhiIOAXuJbOLmWGSOBfu6BOA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(39860400002)(346002)(396003)(66946007)(8676002)(5660300002)(4326008)(83380400001)(6486002)(2906002)(66556008)(66476007)(41300700001)(478600001)(26005)(6512007)(8936002)(2616005)(38100700002)(86362001)(6666004)(186003)(6506007)(6916009)(31686004)(53546011)(36756003)(316002)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUFPbnpZcHpCVjFudGtIajQrWXd0aGw5QmRmQ0FUREpBSUplUDRjbUo5YmUv?=
 =?utf-8?B?WXFIVlNYenU1Qi9yQTdHNDJsZERzQjkyeTVINWN5TG4xcVFiWEJ0UkEzQzlZ?=
 =?utf-8?B?Zy9jdXZweEk5WVYwOW9aUVVlb1BhOXVGVEhHU0pBUGhyRTc3Yk40amRBSnly?=
 =?utf-8?B?ZXJRLzc3RXJWNzY1T1ZDTEw1WjdRWGhGMW9kNHY5WjRYRlozb0pER2gzV09U?=
 =?utf-8?B?ZnNkRnV6YjViT1BBVFdQZUZkQk5VRHI4bWZwZjdVOTlYMTdJdkF3WHBURkMy?=
 =?utf-8?B?NXN1RnRMMkJxSHVPNmYzeTdFRFF2VWN6dTNBUzVRcUNxQkRPTzFGQ2xGcWhP?=
 =?utf-8?B?MTNLZHJWeWhlK0Nua0FQQ0ZIRFJSeXhFVkszTWF1RDVpcTRVNnFaWXFGaFFF?=
 =?utf-8?B?NHg3a3RpZ0labS9GMmhIalpsWmsrYXdETExTNi9kd3QxcVhNUHNzSVlFd01O?=
 =?utf-8?B?WmM4b1oyampxS0dOZWdFUWZ4dWJHcFdYYUxXbTI3YWlGNkJUeGVoR3VoZG1H?=
 =?utf-8?B?c1hKVGJEblMwbUlpYXI2a2p4T0tjYU1obW13cWY4VE1JaGRDTXkwTG1GZjRq?=
 =?utf-8?B?dnl3ODNoUkg5UFVvUFNXTjlSTDd6NEx2amsyalBzOTZNb2QvN2N1QitIZjRs?=
 =?utf-8?B?OTk3T25zT1l4WnNoYkZlYzVnQ0VxREdNSzNaMlFtSkJwbmZxMFBFTXdIZ1dh?=
 =?utf-8?B?OGNzQUd6K0dHek45WnhVaDl4MmdzMmVoaS9Yc2lvbWdQWEJmdFNLVlZ3bnVN?=
 =?utf-8?B?UmJ1SEJMcFE3R0lCWHBuZHI5OFJPWlErRlAvdytzV2lFWDZZdGQrck5vbVQ2?=
 =?utf-8?B?SnptdnhkN3IvNWFUNFNsWU5TNW1qb1QwRXl4VWlIV0NsRTFiNWRoeUVQRzhs?=
 =?utf-8?B?eHF2bFVSeUNJL1Q2N2Nab3dxamxYaFprRWZUZmFYS1JNdlNVRVpYZU9MMVZY?=
 =?utf-8?B?STUrZ3cwVjU0eS8rWDFlRGpjUTRQUjFNNXlOVFd6S1gyYnloUVVIb0RQS0d2?=
 =?utf-8?B?SlFRRUFuTnRtcm44cXhuWEIwYXpXOGZXbHIxdmdxa29JcTBWWE5JL05OTFdi?=
 =?utf-8?B?YS9VU2x1bGhjcHJkSjRRaDhiVHFld05hU1JOV29heGdOc1pMaWdnVFlNT2Fo?=
 =?utf-8?B?ZjFjOVppaDhuQWw1dUJvUUc0MXFYUXRBYkIvTHQzaE5lWXFlcDNQOGRTdFhT?=
 =?utf-8?B?NFdadEVVelQzZ0pUSVhzTDFuRGc4dThoa0YxUWlBR0xPOWdKT3ZUb2lLUUth?=
 =?utf-8?B?UEd2dTVXUzMzVXR0R1dDOGtDT21MRENOeEJTV1IxWlYyRmZVVDZVWEJCejhM?=
 =?utf-8?B?b29pWSsyRjhzczhvVitzd25vUWtPZm9KeXAwRHhzOHU5a2wrbnhiMGhBY1ZW?=
 =?utf-8?B?TklxZjJUY2IvSCtIRXVxbXpUSTlaOE0rTXlmWGg3OEZHYy8rUmtBdU04dDZZ?=
 =?utf-8?B?dk1sZm9kYlV5Q0lsQWUwSmczaGptMGlHUVdHd2VzeTRnL210Ylh3R1pSM2w1?=
 =?utf-8?B?WjFMK09wRXN2RDdMdlNqejFITVdEdHArUGtPUXkwbS9Da3RQLzYvVCtCdFU3?=
 =?utf-8?B?Qmg5cEp2WW95NmpySFlKdDdDUkk5aGxjeHNpSkJIL1NXMkZITk5zSnRiWkha?=
 =?utf-8?B?NU9qaUcxOVVyZHBFVFFaT1lLaDVKUmhYRmU3N1cwbzA4Zk80TjhVUFJwY2di?=
 =?utf-8?B?YU5EaTdFK0oxRjVuWDNTOHJMSjVhOE5QU2UyQnV0bm1yNlJWakdxekEyeEZv?=
 =?utf-8?B?THpIWUZid3VIR1NCREZaZGFvWkJvL1FFNXFWaTlyNm9ja3g1WTJtOVNndWpx?=
 =?utf-8?B?Y2wrOHFqZzduYWtPOUtIT1NJd2R1RVRzdDg2a3hTVllhTmZpQkNreDZFUFJM?=
 =?utf-8?B?WkNXZzdPczVJUWpUL3YxNFpSRVFTdy9VclQ3Uld4U3hiVHVOdDA3MEFRQ3Ey?=
 =?utf-8?B?ZkJwcEJYelR2VktSZjhwOUNtYmhJREZqZXZwNmdIM3JuUkc5RFQwRzVvVU5i?=
 =?utf-8?B?bkxkNWc2LytFUm4yQ1BxOFd4c2RmL3ZUd2ZoRzNITlNWNndzVVFGeWJseTB4?=
 =?utf-8?B?YksvSDVHSTVBcWtaQW4ya2JKWWlQejkyS3RNNFU2TGxuRmEzVHN4RzZzN1ZB?=
 =?utf-8?Q?ISwJY/UdBWQWsFIRzmpbEztsQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312a3b2b-7902-4bd6-9388-08da54ec5c0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:45:36.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nGLvAy7caYGqAvbd7OLT+g4P0EEc3Z7ffcJqqoWDtc9aIfI1OG2XGdQ8+UwJN19vdtL0lSpGePPMcHpAoKdTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2395

On 21.06.2022 12:11, Anthony PERARD wrote:
> The command line generated for headers++.chk by make is quite long,
> and in some environment it is too long. This issue have been seen in
> Yocto build environment.
> 
> Error messages:
>     make[9]: execvp: /bin/sh: Argument list too long
>     make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
> 
> Rework so that we do the foreach loop in shell rather that make to
> reduce the command line size by a lot. We also need a way to get
> headers prerequisite for some public headers so we use a switch "case"
> in shell to be able to do some simple pattern matching. Variables
> alone in POSIX shell don't allow to work with associative array or
> variables with "/".
> 
> Also rework headers99.chk as it has a similar implementation, even if
> with only two headers to check the command line isn't too long at the
> moment.
> 
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I have committed this, but strictly speaking imo the R-b should have
been dropped because ...

> ---
> 
> Notes:
>     v3:
>     - add one more pattern to avoid a possible empty body for "case"
>     - use $() instead of `` to execute get_prereq()
>     - also convert headers99_chk
>     - convert some 'tab' to 'space', have only 1 tab at start of line

... at least the added headers99_chk conversion was not a purely
mechanical change.

Jan

>     v2:
>     - fix typo in commit message
>     - fix out-of-tree build
>     
>     v1:
>     - was sent as a reply to v1 of the series
> 
>  xen/include/Makefile | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 617599df7e..510f65c92a 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -141,13 +141,24 @@ cmd_header_chk = \
>  quiet_cmd_headers99_chk = CHK     $@
>  define cmd_headers99_chk
>  	rm -f $@.new; \
> -	$(foreach i, $(filter %.h,$^),                                        \
> -	    echo "#include "\"$(i)\"                                          \
> +	get_prereq() {                                                        \
> +	    case $$1 in                                                       \
> +	    $(foreach i, $(filter %.h,$^),                                    \
> +	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
> +	        $(i)$(close)                                                  \
> +	        echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
> +	                -include $(j).h)";;))                                 \
> +	    *) ;;                                                             \
> +	    esac;                                                             \
> +	};                                                                    \
> +	for i in $(filter %.h,$^); do                                         \
> +	    echo "#include "\"$$i\"                                           \
>  	    | $(CC) -x c -std=c99 -Wall -Werror                               \
>  	      -include stdint.h                                               \
> -	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \
> +	      $$(get_prereq $$i)                                              \
>  	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;) \
> +	    || exit $$?; echo $$i >> $@.new;                                  \
> +	done;                                                                 \
>  	mv $@.new $@
>  endef
>  
> @@ -158,13 +169,23 @@ define cmd_headerscxx_chk
>  	    touch $@.new;                                                     \
>  	    exit 0;                                                           \
>  	fi;                                                                   \
> -	$(foreach i, $(filter %.h,$^),                                        \
> -	    echo "#include "\"$(i)\"                                          \
> +	get_prereq() {                                                        \
> +	    case $$1 in                                                       \
> +	    $(foreach i, $(filter %.h,$^),                                    \
> +	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
> +	        $(i)$(close)                                                  \
> +	        echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
> +	                -include c$(j))";;))                                  \
> +	    *) ;;                                                             \
> +	    esac;                                                             \
> +	};                                                                    \
> +	for i in $(filter %.h,$^); do                                         \
> +	    echo "#include "\"$$i\"                                           \
>  	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
>  	      -include stdint.h -include $(srcdir)/public/xen.h               \
> -	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
> +	      $$(get_prereq $$i)                                              \
>  	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;) \
> +	    || exit $$?; echo $$i >> $@.new; done;                            \
>  	mv $@.new $@
>  endef
>  


