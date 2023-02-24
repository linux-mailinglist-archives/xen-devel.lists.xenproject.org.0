Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA36A1E0A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501164.772789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZgd-0000F4-Rr; Fri, 24 Feb 2023 15:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501164.772789; Fri, 24 Feb 2023 15:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZgd-0000Cu-Oa; Fri, 24 Feb 2023 15:08:39 +0000
Received: by outflank-mailman (input) for mailman id 501164;
 Fri, 24 Feb 2023 15:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVZgc-0000Cn-LV
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:08:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2085.outbound.protection.outlook.com [40.107.13.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c738981-b455-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 16:08:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:08:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 15:08:06 +0000
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
X-Inumbo-ID: 1c738981-b455-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RU9FAJZ68e2IE12rXyBC8zxNnhngK6plEM+sJstrfHKozC1XLFTb/pPH97OmpiqAQO/goBfDUzZAdWow+Z4/SQ9h4FcsFbkHrkCcReprXak/SX/eqAiWHl9K8zZIXHM1n/SHlsHEBC9jHMqsrL9i/M1MPl2dz4K9zfz5oLdEpSahAgjkxtDI+owK3pz0TY+jV8HnlMM2FXvK7iZYlxPfbObbXp3BZ88fDngeOV/O5Aeb087cbz+LTSQBgZ6Yw/FZRXBgFr3jwG7nb7jtKPA99icNhvGvnkCVEiDQBkY1i8oJOL8BvwVx68d8sdSion/pVKU8xzl143lj04kTpAeDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FU9S0wQ4o14Fb66xxfXuPOpqsc3+yhLf5uCXSDFQ20=;
 b=nV6dPr0Ut9oehNuswKvOgPxXEl8Wmul+Ad2t4g+Q3z1gH2JPnnwl+2H6pJIFra1EmaKJ24rNjS8MapUIyz/stFJQx+sbnHqDPhr65Lrg3hfyKizd70frfNo0BrKpxNfcm6VwZcN4s7OvpIMPJOT2GFoRDTHjEzU44IzQO8vZxyYaTRK0M3wUuSrHuA/7ltYNYl/3idXXA9/vpJ80cO5BR+K5HlNPss3r9aI4t5Q6oyM3Ww20TSasTObt1+g12NckM1lokQT0JS69dpwWJbT9c207loSL87T7AMDc8nI/Di9j1u+Ptz5i/U8NStoB1ieBkwzgEXF90aL3UVa6t23tPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FU9S0wQ4o14Fb66xxfXuPOpqsc3+yhLf5uCXSDFQ20=;
 b=E9S9+kWvtTRFIMzYMj8jf1BpvxY3swYkfWci59fLhWmHNIairO/NA3+CKZNBpzyarFtNVWWtA1rcR4hkvSByR1GVJOcjP9t370W6E3Ju3jGMCKEf8zgEVAJZ/yyQCqTOrFiZ1YscYi+mVB0R+kj0zTBIlukYCaidjEHgpFNUGRvLuxcuO4S/QYscJBJNECw4ptcfDbNBVsH3toct0aHkQ+UsxcksNCmKBuKoPSaWm7WHGUhNs7BNBEBPFRQWmks9uKxxV1v5E2FXMXcURlB6ake5ffv3j8MVo1LwHlxfJj8WBTJdMjDizxHmD9LWsvbfFCkm6DhraYqqJPa1kgEnxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f825ae6-a325-eb5d-f7df-f598fb22b27e@suse.com>
Date: Fri, 24 Feb 2023 16:08:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/riscv: disable fpu
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <63c797ba52f6d7edc64f9d2e41b460c7d64330ae.1677249707.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63c797ba52f6d7edc64f9d2e41b460c7d64330ae.1677249707.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 1215bdd8-c949-4d6f-9986-08db1678ef16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZP01rTlku7ysfOV2WFAfexiQOJQ/GkQlsl1zj/cy3dFna2gzNq6FeqkGMjpopG2D4OehrvO3P+VS00DK81zHq5rCrPD6M4/DzLXzukeMvtSqgcqF527sNPq4n6o4lovyJmNYKCCxVvRchVqvxzPFBZnBXfnonvLNdRFzOATncgdQ+caLuRDEP1EIxg5c3etIMJ90XRzVIdqpczu0hFVhcC6JCYC1vkoHhU3APxSGAL2MESdIR+iQly6oJXfZDdVFvERU3xZvFVIhQ/cd9a/i/6WBKLznm7W+09Xyj7Z4YLmeCyjYgH7UNK3QpGd/194DuIGkVoDkke8Nm5xknwuF9HxnFsrEcRbSs0vwKZr3oRSBMe9A5uplk7WhS3o8aFaTeaNqi+qlW+aHknuLsb38U4+bnOrbyVN+EigEMqvE6zWNN+R9+TmrZPWxhFqrbkWMp1j4NRlseeXovJYzoj4zPoU3gNXKvFN7WpGB37gPfXeurQ2m1W0FiPyXBGSdwTNHscbOUFzBu8CDALQvyvKjF6jj4yo9n9lbVc3GB60TfIKBRa3L1qDjvR/IPwULgyEvhoesTypCQgFrjGjFpF82glQ3MU3ErbRcLlEzCdQo1fRie5Rpdc+zC6pdu+5DoSgl8afvv63V/sTEEy+0A8VCrcjcdyGfNXkzWrkwh9MEHaZB+bt/LJ5XP2lpjX0leIhy43SOsjV4amS5wUMW9d5E8VxBGQPFS15BzNJqwLyLOzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199018)(26005)(6512007)(6506007)(186003)(53546011)(36756003)(41300700001)(2906002)(38100700002)(66556008)(66476007)(4326008)(4744005)(8676002)(6916009)(5660300002)(8936002)(2616005)(478600001)(66946007)(86362001)(54906003)(316002)(83380400001)(31696002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHBWZkpiZ1VoMEN0c1pWOG81SmFoTzFDU2pFY3hqVnF3NE8xdHg4eHJzV2hu?=
 =?utf-8?B?RFErU1ozVFViMVlnMkE4UDlOUzc2ZGYyaEtXWHpoNk9TR1JsdUhwdmpIditR?=
 =?utf-8?B?YXA4Tm96eUZSbVdrWWJydUVUY25KcGdzOWtxWitEbmhCRnB6K1dpOFJyZ0JK?=
 =?utf-8?B?bDhtNjBsN2tPOW5uRDBhSmhXd0lLUEJ3dWhYUEZ1VDIyUzBmWW1SYWR4UjJT?=
 =?utf-8?B?dVl6dEsxWnpJRDhSQmFMTmJ5T2ZCTFB4V3pYN1UvWUR2RkM0dUgxbG5xc3Rw?=
 =?utf-8?B?N0hHRVFuMUdkdjlKTWVNOVQwQXN6eEZjazhEWnJDOE5STEQzUmhJUVRBallO?=
 =?utf-8?B?YXRoYm1aR1pTUFdlbytjeWIzMEhwY2NRdTdHbUtaWmVYY290TnlDd1I0YXF3?=
 =?utf-8?B?RWxybDZxMWV2SzFlYVJndUdPM205Z2s2SjVTNTVZN2pXY0FZUkNMaXU2QU95?=
 =?utf-8?B?eDZxbGliMDVad1ZqaVRFTm03cXBvRDdUeE4veHBzVS9MWXoyaEhXRm53S2NE?=
 =?utf-8?B?THlCamh1SDROU0FzREEvMXlpMzZDMXVYZjVxdTFPY1Rkb2w3SU4vOVdzeHRH?=
 =?utf-8?B?VHEzdno4K3BjN01BcXRLd2JQZjVyUkVTZkprY2JXYndyWVdBVEQ0NUxtSVE5?=
 =?utf-8?B?OVJEQjcxb01QSU03QlczVVRWTEZ5YjRMc1lUYlhuVjNYZytpdHhCbTNsakY0?=
 =?utf-8?B?ZGF3OHVRMVVyenRHWUxQTXpZR0hDcmczV21ib2xnYndqNkxGRUpOTEx5ajFN?=
 =?utf-8?B?TnJQZVZyUEI5RlVFa2xYNkRVdW1qQUtncnFBRGJnVnViSW5IYTZIcis0Um4v?=
 =?utf-8?B?MXJXSEVuczlJN3QwRzcrTUJ3OG5iU2l4aThHYzlTdXp6NUY2NSsxa2pHNEYy?=
 =?utf-8?B?dlFlNWhZS0E2SCtLL29TRHdJQWlQT25wL3dDSXlUTFV3cVBBNXdJTHNROFhM?=
 =?utf-8?B?ZVZPL1cxa0dhbWRWcGVrRUNpaThEdDA2OTYxOWgzMWw2SlhaK21JQWtoZ04x?=
 =?utf-8?B?OUtLWDJJTDF6dGgveGsrK1cwWi9YakZnQVRUbDZtbjdJL29zbWJpZTM2QmJj?=
 =?utf-8?B?UFM0ZnVWMDJ6UW1ja1hxTzBxNXF0Mkt2cTRHcGVHdFBIbi9ndVJLVUpZeXQ5?=
 =?utf-8?B?TE4rVGthR3JTdzV3TTFpei8wWEg1TGI3UHFuVWZpRFBqWFRjOWs2R1lSNWEx?=
 =?utf-8?B?QTQwbzA5d0pCVnJoL2lMOURLWFYyNldnN0R0N3k3RmxnZ2kvUWZrTFVraHNq?=
 =?utf-8?B?bktuQnRocklmSXc4b1dQZGRKeTM2QVhoVU90b043dzVEUGJkV0xFUnYrWnd0?=
 =?utf-8?B?UnY0M2J4cmJWbWJML0F4WWdMT0dJclE2RzhWcmFObVFYU0NOQ0tZZFN3SFpD?=
 =?utf-8?B?NnV4VDVTV2ppTHBBTklJS3JCeVRUc3FXM2tMRFZSVDlHTHFzZ0F4Um9PM1o3?=
 =?utf-8?B?V3U3UnZoQVJMYlhnNDQ5cDdMNHdKbFZDb0E0WDdhVjFGQmpjUXY2QWFTSjJY?=
 =?utf-8?B?a3BWc0pLVTAzd2FOc1ZhcXRwdVp2djZTUlk3WkJOY2hpa2F4UHZTVFJUWUFr?=
 =?utf-8?B?TFBxU3MvOXBoU3F3WmpRbE01L2UxWUhRY3h3SFYxS1B0MXZiVFZTRWZ4UndS?=
 =?utf-8?B?YUVGQnRVNGR1dWt1OURnZzJNOE5IWWN1UHZpOU5oWXo2eGZLVXc4QStQaENT?=
 =?utf-8?B?Y2ZjY0dHc0tJN0QrSklUOVRQZUY4eTFVWlBwQlR3em9FK2ljcmxqejZIWXZ6?=
 =?utf-8?B?R215ZVpJby9xR3JtT2VuTlYvcjRjTUJGT2tuVHpqZEFNaE04WXZFcDcza3VC?=
 =?utf-8?B?eU9aRVpwNzFWNE9qd0xjSTJiR3JBUDFjNjF5aWdqTU9heWpwVE9HeTFlN05Z?=
 =?utf-8?B?ZVkzWmc0ZFB0d1MzZlQzbWppbVp6bDdWa25GeE9QZDlsdmRWS3plUFV4Z0Va?=
 =?utf-8?B?TEJUNWw5YThyY2V3ZEVwYWtJOTB6akZ3MDlGWCsrNGFYQUh0OHFWNll0VWNn?=
 =?utf-8?B?QzF3dCtCcGtjeFVjdWtEUW5qeCt3bU42L1JlSVNRUVBXeGUvd2xiemVFekZz?=
 =?utf-8?B?RGRlUlVlOC9nY00wdXVncVIwaGpoMDFxQ3BoL2tNUXRsR2JMMTM0UFNyUTNZ?=
 =?utf-8?Q?IdCHBfwCDlSGN8lWL/LIorTTX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1215bdd8-c949-4d6f-9986-08db1678ef16
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:08:06.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ap1RNjAWYiqSBgf7drbixAbtIfCMRk/3cRk8tepPoRN4ZT0Gph9H5Ck8AqysBrjZibMrQA0qCQ0cUydJ8pCY9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

On 24.02.2023 15:48, Oleksii Kurochko wrote:
> Disable FPU to detect illegal usage of floating point in kernel
> space.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/setup.c | 7 +++++++
>  1 file changed, 7 insertions(+)

This looks to contextually depend on earlier individually sent patches.
When there are dependencies, preferably group the patches in a series,
or if not at the very least call out the dependency in the post-commit-
message area, for committers to be aware.

Jan

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -36,6 +36,11 @@ static void __init init_bss(void)
>      }
>  }
>  
> +static void __init disable_fpu(void)
> +{
> +    csr_write(CSR_SSTATUS, SSTATUS_FS);
> +}
> +
>  void __init noreturn start_xen(void)
>  {
>      /*
> @@ -52,6 +57,8 @@ void __init noreturn start_xen(void)
>  
>      init_bss();
>  
> +    disable_fpu();
> +
>      early_printk("Hello from C env\n");
>  
>      trap_init();


