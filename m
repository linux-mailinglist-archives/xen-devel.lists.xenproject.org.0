Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768794FD73A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303593.517948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDkL-0003tC-AT; Tue, 12 Apr 2022 10:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303593.517948; Tue, 12 Apr 2022 10:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDkL-0003q7-7N; Tue, 12 Apr 2022 10:27:41 +0000
Received: by outflank-mailman (input) for mailman id 303593;
 Tue, 12 Apr 2022 10:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neDkK-0003py-7I
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:27:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d733252-ba4b-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 12:27:39 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-iA43Ylw9MhGFfjsVmbShfQ-1; Tue, 12 Apr 2022 12:27:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6315.eurprd04.prod.outlook.com (2603:10a6:10:d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 10:27:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:27:36 +0000
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
X-Inumbo-ID: 2d733252-ba4b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649759258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjldoVbWk4dOoIvq/Xe9YOBnGVbnNaI2DQunigbNhnw=;
	b=S5iuABdzAuPduQJ1a4zdjtE/SEPlZL0WjmvP2ZaYli0L0ozr9T1nxYAX9RiYPUM8KG67MB
	yMj/Or8ZMDWtpMLk1ljyAp0PfE+S6To2tgeUv8naDEqCnDeWhgJQEZ/XgeBnTZw5EZwPyJ
	UK5WEJsnStb8cApumn1kUEkqZd5XWGM=
X-MC-Unique: iA43Ylw9MhGFfjsVmbShfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLd7WcPhzCqHZ5EC+x1II3oUv4hDAeYSjf/1gLBcgWZ5SX0urld8vq5kDaqfDdHQJvtkSDd3rsVwyaludxlVuxBv9Lj5TZREGv9aLJ5utugrNQGvJS/P1aRn83bPNU8SsmGDzbYXo9AQ1sKXBwdcfTTdLYGeemOHl17AsuYplepCtWNahnW3FTT/vOZgSj9B5zs8gqnNjgZsUjXt+p/vYfjYixFpJpAQ1RO5n/jaSlCIDzY94vqiz+xxYzsnoYglXh0vwJYl73nZijDsiYKberCVNsdx+YoyE1nhTunf17n/61nGYb8Urzuh7jd4pJ1kaVv0qieOHTCKnx4jZ2Pvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjldoVbWk4dOoIvq/Xe9YOBnGVbnNaI2DQunigbNhnw=;
 b=NB7uN0u/S2p4uLXyb4L68sZqtmZfpc2Bja0To7DY2xzoTKNV0Np7DnYrJ8j+XywiTGl1/GeRMQvEpS9mPJXvkeSvWinFZk5gjX2L0njf7CIRCosLHDVBP+PM1gOvyJlu+AzFhrMQ00Au8C4i7jgrwdI7fFOoKydFeE4AAKYz11TKOE1svHLa57YkRWK2C8D9z9HRFBJUJ6v0OPh02bPrqp14Quu5Fkx0rCeAQqenpzh4d8Cg5THo8DXEB0pX+WmsAIVczTpQxfFoZwbbHv2SjyNWcnpHM2sPepiGLS5BWNf71+ttUmdugmCYvvLIuVb1A9IHAu+d0/1PE9YEap8S9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
Date: Tue, 12 Apr 2022 12:27:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 1/2] x86: improve .debug_line contents for assembly sources
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0070.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::47) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14b6ecd3-3354-43f6-3356-08da1c6f0ff0
X-MS-TrafficTypeDiagnostic: DBBPR04MB6315:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB63154A8E0409A8E2FE905B41B3ED9@DBBPR04MB6315.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kufnx0Qp1M6aE8YATIyKc0ticivtTRk++PCkcmk3nwqKZosYMfj4jL/lX1f1RyRqmtN6RPfBjo3Gp1NmfN5qVQxUiao59SmVEdkI1yyjmJlHzzw/8A2UMhc+s/HwRZSvXS2/Bqx9O0a90HCCxwXX1k8yB/kPr2ruXZurhNNqLkV115p7UW36Ef8IVJnScCUZZWpSZHlgff+jTaXSvSCsa5BPnkiv2C2oEStbeM5T9r/k3eN+K17D7265w/dVp5y6HSSjsON2HyEfdkxI9Vjq345+vcsX6oqj2dOpqQQWPHGn4zHF+jAwyZK0NFZCISQTIDO3jNS1HX06ie59RI8/ijCzotJIJklRfkrNM5/OUe56dMfvwuATDTnQZjqUcS4dmJXVrIAuaIvIEwMQJXxT3Kxgs2cZMw4SrKs3IVMzgX+aTbFZ6Qdk4Qxek162GNwxBtNtd7iU8xSfDut7HCrpjg+TNTX1gbLEuMw0TpJFXeQ1a5ZVbwGxdSOCy2BRFccMH+T6mKiJlJYM3wDn4E48WR8F6rDsSvuVHKgvtQ1GbH3PadNLVhPqh36iCPnr6jnDVnxcYUFV4npcszOVkczmSrxPYqTmaplMA5uKOHVxXcLGrAZY7wrgrJObZm7LaDs4CDl7gue/2rBX2jbIaFgyy63b5526notbnZVWCIrOmPRqZMMXJ5RcXdjdAtjANy3ctfoNrt33UIkg5/wI5gh2jJrMPGDLf2TtQaC6vuBFkVPsa/XywcV72V4T+DYv56HSwBgFcaz9AqLx31wDOonWze+ZvwaRUV1IOlmHV3YX8LZEhi6Jaq81fWdPUSa2LDoMwiBTYOaC6F8ZQ2IacF/H6pcyyIpbyjMBOtfA/D+kz63viyQaaEqSrcBUEvVFp+7tviW86ni+XEK7yHkPCGkRNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(5660300002)(8676002)(86362001)(54906003)(6916009)(316002)(6486002)(966005)(36756003)(8936002)(4326008)(508600001)(6512007)(66946007)(31696002)(31686004)(66476007)(66556008)(38100700002)(2906002)(6506007)(186003)(26005)(2616005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1Y2RVBDRWJ0WlFmWWc0WWt0UlFvTmtXMmFudlR2VVZYYnBkSmNXeExxbUVq?=
 =?utf-8?B?dnRHdERTQ3gyczBLWnhWRU5lWUx6bEFwVVh4Z2FJQWoyN0hrQ3BQc1hCTGdk?=
 =?utf-8?B?ZENTRmhFVi9FWVJtNy9NZDlMbTlVekZEZzJZWEV5TU5NajJEak5aaXI0S3pF?=
 =?utf-8?B?dU1URGV6UXBjbm9jQmc0aTFaWVprZGlwM1Vzd3RleXJ6UTFCMXJmejM5clZs?=
 =?utf-8?B?UklmSktzTzZIZ0pSTE5vYkdWaDhra0xQTTV1MGJ5c01tbUd4Z3FtTGl1enZP?=
 =?utf-8?B?Y1ZNMW1TNG0xTmFaNDUyWXIycU52YXdtTFBYSFRXU2N6b2QzZUs5THhKMThY?=
 =?utf-8?B?aURMVjRtSjNqaFpHUSt6YnFlYjFOYlpib2hHbk0xYXIxQ3BmYzNod2cvRENx?=
 =?utf-8?B?ZjdUdzM4cnJ0YXBQODEzdnlXRThnUFdLYS8xR1VlNkYzZ0VNdUswSWVKWU96?=
 =?utf-8?B?VlRIZGpaS3I4Z3RkNE5ndW1xNEpOTUJ4cmFVa1c3NDRTb3hFamxRa0ZpUFBV?=
 =?utf-8?B?UU01cFQwelBSK3JKU0s3dW9FaG05VjBKUzRyNmkxZWR6RHByaVpTckNvRFNL?=
 =?utf-8?B?YTlmbWpJaFhDMUdaTUMxd0FIOGt1dUNJL29KaTJhK1p2VUFMOGFWSU5OUisy?=
 =?utf-8?B?M0FwcnVlem9wTDMrMnlIREt2TGlvNzZJaUFod1ZWSmhTS3RkcGFXY0tyNGZ5?=
 =?utf-8?B?azB2NmdHd2hlRk00cEdFNlBzUm5Qb0NSUnNZLzBwUWkzZWl6UkY3aHFib0ZB?=
 =?utf-8?B?Ny8rZUVyMGQ5emdnbUZrNkdoODE1TlYvRWh6eEhVQkgrNnBXV3ZEeUdpZi9l?=
 =?utf-8?B?c0lwTThtRmE2Q1ZIQkhMaitBUTliYSs3S05sTlArWGlMdkt0dEN5aURlUzFS?=
 =?utf-8?B?WXgrUGNLNndpTU1TSjFMaDJYMUhEVnlVZkkzWDZOM0dtOElqNWNtVXRiVGF4?=
 =?utf-8?B?TlNkZHJEdHJNZTdTd085R1F6c3VmSTdFUkJQTUtZZ1h3ckc4VXNyV2hla1pa?=
 =?utf-8?B?WVBVZTRrMWk2MlR0TEw5bFlGQnE0ZXdXR0cxUlBGVnhGQ3V2WENZbjVqNUpm?=
 =?utf-8?B?QzVzT0xJbnN3dHpITVRxanJqVE0vVlhiLy9qOEdycnlTVkJmK1ZkUmt3QUJH?=
 =?utf-8?B?ZnZ2UjljV0ZicGFhQ3RtRVg5YWhTUUxHc3RTazNkNlVnbHJxYUUvaHFSWDlI?=
 =?utf-8?B?bzFqUE9NZ0VTM0s0SHlDMVN1VGJ4RzZHWjdyWms4OVA2MmxsVGp1U3VRbEEx?=
 =?utf-8?B?djd4dCtYRkEyWEtTOVNpS1dCVE4zTjNDT0FrRjFHbHFCbi9UaWtQb0FtZ25n?=
 =?utf-8?B?UFFSMUdocXNTYm9Ia21jSmdJbUc5ZEVYbVAwMVlwdGkzU1gycWEwVEZDVVBo?=
 =?utf-8?B?clJsRVBkNUExYnkxUHVlTEVaS3ZpVFdCcDNyWmRVb2xrUTBKOEtBMktNL0Mw?=
 =?utf-8?B?ajd3VStRd0xzUTJFTmVPcE1reWhLM3dwcVZJdjNuNExLR3NFNmdvY0FlR0g2?=
 =?utf-8?B?a1JuSXlaTS9IaVp5Njhkby9CTDI3T3UxUXV4VTJVbVVLT3FWRWVvSm5MUnVq?=
 =?utf-8?B?YlE5TGNlV1c5R0JWUGIvUlZ5cE5lQ0IvWkh0MEY3QXV6VjNzQzVQN2pWN0JD?=
 =?utf-8?B?dERwZ3dJSGpxSnJjWFU4d2tBYVpPMjViU09ZWFRxdm5zMlppOWFvVGZGbEdZ?=
 =?utf-8?B?anJYMklIdDg1Uy9NMTN6NGpxdkliNXdoUUpSa2VGb1VxWm5PYU0xMDRaMStF?=
 =?utf-8?B?elR3NGcyMGk2ZjRSdmJmOEJyT0t4Vzg5amxJSEUyZUYza1hveG04d0F1bmY4?=
 =?utf-8?B?bmJaSzhUSGpReit6VUxpSWFHekwrbFV6TUR2NTV3UlRoTmwrb0hhSzNtNjNY?=
 =?utf-8?B?dlpwWFVtTFlqMGs1NFdiTXh1ZkduL0gwa1psSTNRT3dTMmthemcwTytVVy9j?=
 =?utf-8?B?dTEwWEd1VG5QQWtIYXU1NTZncXlHd3NtazFuRnVzRGhzeXhCRU5pRlhMcG5z?=
 =?utf-8?B?RFpQUVZqcE5YemNXbHpHaVpmYlRRczNkUmF5VUd3cUpUV21yRTJ3UlRiei9C?=
 =?utf-8?B?M1ZFVFl5b0xYeXdlU3plWDNkelE5ZDFTUytvbGx6TjJKVVZ4amxZL25LQ0JX?=
 =?utf-8?B?UUZHSU1HRUlONnQrQlRBUWZuYlEzR0NFZ3oyaTJGTnVpZytQYytLc1FzWHpY?=
 =?utf-8?B?LzJ4eVpraXd3UEVZSGVWK3Q3d2VSNHRVdDB0aVhaU1gzM3B5N2tJUHNGMWUr?=
 =?utf-8?B?WEVVSUFWcnMvWjJySDdLNkcwT3ArZUVMMGJMakkwRnlhVFJ5UFRORVEveUZn?=
 =?utf-8?B?TjFHL2NHZnBCVVFvdW8yVzRhUGhFa2ZZekxlV01QY1E5cUxTUWRsUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b6ecd3-3354-43f6-3356-08da1c6f0ff0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:27:36.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uwwEmx6lON2cv5Nme+0DQaTjxyio6v44rD1CyMkncCIIKoUHWMO/BoEDzDSSfbr21XZCe1A62J4Lhp8H6fWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6315

While future gas versions will allow line number information to be
generated for all instances of .irp and alike [1][2], the same isn't
true (nor immediately intended) for .macro [3]. Hence macros, when they
do more than just invoke another macro or issue an individual insn, want
to have .line directives (in header files also .file ones) in place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=7992631e8c0b0e711fbaba991348ef6f6e583725
[2] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=2ee1792bec225ea19c71095cee5a3a9ae6df7c59
[3] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=6d1ace6861e999361b30d1bc27459ab8094e0d4a
---
Using .file has the perhaps undesirable side effect of generating a fair
amount of (all identical) STT_FILE entries in the symbol table. We also
can't use the supposedly assembler-internal (and hence undocumented)
.appfile anymore, as it was removed [4]. Note that .linefile (also
internal/undocumented) as well as the "# <line> <file>" constructs the
compiler emits, leading to .linefile insertion by the assembler, aren't
of use anyway as these are processed and purged when processing .macro
[3].

[4] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=c39e89c3aaa3a6790f85e80f2da5022bc4bce38b

--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -24,6 +24,8 @@
 #include <asm/msr-index.h>
 #include <asm/spec_ctrl.h>
 
+#define FILE_AND_LINE .file __FILE__; .line __LINE__
+
 /*
  * Saving and restoring MSR_SPEC_CTRL state is a little tricky.
  *
@@ -89,6 +91,7 @@
  */
 
 .macro DO_OVERWRITE_RSB tmp=rax
+    FILE_AND_LINE
 /*
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
@@ -137,6 +140,7 @@
 .endm
 
 .macro DO_SPEC_CTRL_ENTRY maybexen:req
+    FILE_AND_LINE
 /*
  * Requires %rsp=regs (also cpuinfo if !maybexen)
  * Requires %r14=stack_end (if maybexen)
@@ -171,6 +175,7 @@
 .endm
 
 .macro DO_SPEC_CTRL_EXIT_TO_XEN
+    FILE_AND_LINE
 /*
  * Requires %rbx=stack_end
  * Clobbers %rax, %rcx, %rdx
@@ -192,6 +197,7 @@
 .endm
 
 .macro DO_SPEC_CTRL_EXIT_TO_GUEST
+    FILE_AND_LINE
 /*
  * Requires %eax=spec_ctrl, %rsp=regs/cpuinfo
  * Clobbers %rcx, %rdx
@@ -241,6 +247,7 @@
  * been reloaded.
  */
 .macro SPEC_CTRL_ENTRY_FROM_INTR_IST
+    FILE_AND_LINE
 /*
  * Requires %rsp=regs, %r14=stack_end
  * Clobbers %rax, %rcx, %rdx
@@ -288,6 +295,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
 
 /* Use when exiting to Xen in IST context. */
 .macro SPEC_CTRL_EXIT_TO_XEN_IST
+    FILE_AND_LINE
 /*
  * Requires %rbx=stack_end
  * Clobbers %rax, %rcx, %rdx
--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -12,6 +12,7 @@
 #include <asm/asm_defns.h>
 
 .macro IND_THUNK_RETPOLINE reg:req
+        .line __LINE__
         call 2f
 1:
         lfence


