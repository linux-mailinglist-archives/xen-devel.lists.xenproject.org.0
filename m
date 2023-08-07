Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A973771C09
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577799.904823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvIx-0004IT-V6; Mon, 07 Aug 2023 08:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577799.904823; Mon, 07 Aug 2023 08:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvIx-0004G5-SL; Mon, 07 Aug 2023 08:09:31 +0000
Received: by outflank-mailman (input) for mailman id 577799;
 Mon, 07 Aug 2023 08:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvIw-0004Fz-JU
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:09:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bac74d8b-34f9-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 10:09:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7205.eurprd04.prod.outlook.com (2603:10a6:10:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 08:09:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:09:26 +0000
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
X-Inumbo-ID: bac74d8b-34f9-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGEx9Z/ALLfB1M2ziu4d7RsCpnPsIA8iVee0iRRghoPNE5KHNKO3mUfzERpqcLECkh4AKziFQphF046/i+iDvCqAbr0M0cCnuaLPsQ6T6PAUHKGQSHMzTTN/It5GCmxoNNKzNAO/wmHQCia73zpVglKyMOm7y7WbOZ7YEQq1lxmVd3EvbMETLzk4sbaA8IzmjmfzsvKnZ1PsvxeMLkLOu+ScqMy79zbzS6MKQPBZC9MhyH2r+2BQjbmyWBepXHSl+7IbqC50aPPRXZoIxk8zIFYSZJSMUsCdJv7hOgq6m1P6SrU3jUmwBeED15ud4TSJB26oMI/9uGfB/9gfwNbgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MwbzB67oxEI7ogaF4SvdyY/jTHqGNrSN6zBwjin06s=;
 b=kh0knZ+9LVwN23jsPuBozjOGPbhjkxanl2G5/Pok/QJKkKSSJiqckt4CpbmFuMC6oSOgBbdy+jlkGPLncfs3xCB35DH/Ah8pkBMOiVedW51oc3lIPxWqhVtlCD+hrGODL4wsb+XHz427i9VrSp5IzelKipRWaB8SnApjSjwXM+L4AhDorfljNrwh0CQGAWhgTR9sUPQWW4e4o0X4U6mUeAMqrNs+Hqe4fzGeyxhF5lIt+idxCw4eWmZ1vVuFm7Qwru8WrWVeErHdxBFPFALcfaJadA65s594SMMdfaCMe//AAb3NkOxBFQbaKSXElWUq9EIUed/SEY+rdqk9AKw3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MwbzB67oxEI7ogaF4SvdyY/jTHqGNrSN6zBwjin06s=;
 b=V/ia+n3JLYkMm9nsB3KarqYuDbQ8b0sh8zxYGq4nKxs0dpjlYLCuoKOFok8JOERFy3J7lakdFfXBhyetTiR1ZVxMy1dn9LUKRRTzRVs+Lj+xy/HwExgzVm3jUhz9Kpc8qAiKQiJyN2VXF1zMAkF2264STUc22YRea5k+hSyH0h27xhFIQW5F4XMjz0KJfd4zsi/t9E4whD8xse6ftJ/YYTtYJVzhdEBvfB0DRAQe6mUtX+6Xey/gI3VSpijd4hGl4VOKwZlg95hcgRP6Ala1Z+NoNBZkgXmIVlVztl3Ut6z1v+nmlKthzbk3mcd5uVoX/tVQSS0rq7MHGAH3/NCZaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
Date: Mon, 7 Aug 2023 10:09:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: a5222520-9eb9-42e3-65de-08db971d9dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	azi5ZJxi/grSOJZ5XpNTogpU8w/uYD71IDv1w6d/txVcgOBCJUNVGUvJj8ixZeoyjDMxUc76OuSfMCehPMNbNp+Ar0Jp2xyAMP2F0373PG3h2cynrwINc6ybDFij5J+tUtIwlNTRUZ7YglU1SKBqF45/bYyfJxfTjyvs/vLwq0eyjEhGhYCpmPASO5Tf0ZRmDMquHgqc1lM2/Jj2lkQ2AVjEA6xBcCABo637J9SukWDY64gOVcPwBP058DdlOr4cTcI8z1xtLsc4MGn7LN3tXqs2EDc55u9Ik4fbmqriYR++YjVOk9QPeJO1/ab80NSA2nDGH0PVYAttV1MQizWHxFzPZwNv2hSawZRpCVkd45GUxnA0uxyibHVImWP1tQRQGuWK0xwLSAjFxi18uWMFjALfAM75gusox7ntbmQ94JjYEAiCiXOvOkqobUwVoo8xCJGortnwcfPconsau84dAs9hX2+/lek1Gmp1en6WIDRLuffB3rB5HEbKKlhiTnAt0mDRfYSafYgs1bx0cnJASMhYU7wvuMWbz5mkcTXgU1SvJ5bhq0HFzwSRpMNs4w40+tnwbB66f0eROEi5NGR2ddJ5HsgcQ+pOBGZQlIAZPrI7f5Jy4J76QSqppLTfwQIxJLOO1sqvw2h29unDH2VuVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(376002)(346002)(136003)(396003)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(7416002)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(31696002)(6506007)(53546011)(54906003)(38100700002)(6486002)(66556008)(66476007)(66946007)(478600001)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sy9BbkVJSmdPWG5lSHIwUnVLcUN6WmY2WVBwS3drQkdBVXA4bUFuUSt2OXhB?=
 =?utf-8?B?V0t1amQyUTN1T1ZScU12YStPenFPVXJEY2ZCQW9ScWFpa3N2Z1pqWk9mNjlX?=
 =?utf-8?B?U01WM1NWOUlRTHFvWHBFblF5ZnBXWTdvVXJuQ2xQRTBYYmdON2llZG8xSEtX?=
 =?utf-8?B?LzJ6WGhGNG9hYlczTFhqMHArNXpkTXhEdmVCaDZsVWRNQldZNnZRR21HTFd0?=
 =?utf-8?B?ZEZKQktCek93L3VKWGVlT09FcWVUQzFwRW5IZXd0Q0hSdkhQRXlqQmphU2Qw?=
 =?utf-8?B?R051Vzl3c0R5WDBLOHJGc0c1TVlpU1pVeHMwcHByOWZBTC9oZmtWR05IcnlB?=
 =?utf-8?B?R3BEQzkwZmxyUEhmWDE5RkZPdUZhTlFQeFJLNlhHRTdCS0lCcjBaTnZ5UWUr?=
 =?utf-8?B?b0hDcXZoQ2JQd1EyVnc2czFhbEdHbXhPOVo1cFRWNlRPRUowa2E3d0ZpTUU5?=
 =?utf-8?B?V01MeDlUNHBFelE3YU9Gc3UrMm9aWXFlem1MdlBnSkZ2dGpMU28vOHBwYVBj?=
 =?utf-8?B?VU54YWZ0RkY1K1VRRVcyRUpIK3BsSUxGL0RSc1BLMG1VcFNBMFFEcUkvNVc4?=
 =?utf-8?B?anlpMTBPd1NJVzkwTUFVdW92MHhuSFpBaW82R1pWNFJkRnJzKzFkSVNheHlG?=
 =?utf-8?B?U3Y0SFZoVnlmejl6VHRnUUxSTktGcENTME1lYjZPcVBWN1U1Y2o4cFhVeDhV?=
 =?utf-8?B?R0libUwyakwyQjlEZGFkOE1qNnUvL1ZKb0p0NzFUYnBBUTJYVTNncWIvSm8z?=
 =?utf-8?B?Wmo4MXg4L2FHWG9RZVVsWm5CMVc3Rkg4U2JkUnJ0dDJhS0w2M1IxZmMxR1l4?=
 =?utf-8?B?UDZtNjlXcmNhckZmMkR4VU5GZFJYdDB6Y09PUzZTczFUK3dWaWhoTUhxaURu?=
 =?utf-8?B?ZEFCMGdUbmdZaitzWFlpY3dEUVFRR0k0eGZHZWVhemVzc01IZWhrTUU4VjNB?=
 =?utf-8?B?WHVqZTN0TlByblZvejN0eXBMSm9YNkxKY2JpNVgrMHBNMHdhUFEyYVo1MUQ1?=
 =?utf-8?B?ZTgxcUFGaU9zNzBHdzdSWXlBc2FGaU5lajY5ZHVxZmd3UmlJRHdDcnRaOHZw?=
 =?utf-8?B?TjJBbU9WQm9wZk1rQVhGbmNxclhva0JQZHU4WW1QSGM5UXgxcnV6R3ZJUVBN?=
 =?utf-8?B?bTdndjVGbW4xdU1JWVdUSXpBWllvK0pUVWxoVUlmaC9QRnZoUDlKVGtkN1Bv?=
 =?utf-8?B?R2dTQjZobFZsQ1FWZzdDRytiNHRVSGQ0Z3NLRkxGbVBjdmlzQkVzNHhCR2tX?=
 =?utf-8?B?TlgvTC9mRHNlc2lXSnVEbTRZMHkwWmF0NXhRNHZGSUlLYzBMWDRvckNqakNx?=
 =?utf-8?B?L1VsKzBwYUZ5c2twa2JiMHNBdkZkUWNYdHllK3h5OFZKUXlpcnF5OFdtWTY4?=
 =?utf-8?B?RUJCTWdBSXRFeUZUZXc3YlloZXdYS1RZSzhFZnBTWjlMbCtIcEZOWEpOaE1N?=
 =?utf-8?B?cEpsQ0RqaWx5QkNRcU1TbytYY2w3M0xjVFphVTJDTmMxMjV4bEQ0aVMxbmZi?=
 =?utf-8?B?ZzMvRlIxN3ptMThmYmVMK0FRU3U5OEhlbzRDNzdydWgzeDBCcHUyMXBXKzR0?=
 =?utf-8?B?V2IvZkp5T0xLUW9TcDZnYXo0OHJFQkhqcmlSRE5FaHJ1SVRVSHNhSDJhSzVN?=
 =?utf-8?B?RlovdWtVU1l4QnRFQjhnYU1pcU9FNFJmSjA3bjBMbk1ZZ1dlazQ0V09nRGtY?=
 =?utf-8?B?NElGZFBodmUvWXBkRWtuNGZXZkZMRkZIdHhiMzNJZzQ4aWI2MzU0cS8wc2pG?=
 =?utf-8?B?YTJlYndPLzBQd1RMSmxMaUxHa1RDV0tGWFJZU0F6aWg3RC9ncFhkUnVMQWlS?=
 =?utf-8?B?L3AvaUJkNzBXbkorRmpLSVlJMUk2cnVGN3BNWDJBTUlaSUpiN0JWbHUxaDc5?=
 =?utf-8?B?b0NSQkhxbmNyT3d2WE1FTXB2aitIbUZ0YklWT0svWkVpWlJGYXdrY3hROE5z?=
 =?utf-8?B?VjlrT1BmNTh5TnFsS3hSQ3ljdHJ5dFpXOGNyb2dhWndSclNKQXl4U25KVmFk?=
 =?utf-8?B?Q0dpcmdTc1RnRWhVMy9qMmpycHZNOU9iYVNXcHZoTGkrRjBJRHMxYVp1Tk1u?=
 =?utf-8?B?d0R2Wm5nMkRvUko2ZmhNMXNqemp6K3B4UkFPQVVTVFNPSk00ckF0QTVTcEpD?=
 =?utf-8?Q?TBO7ef4JkfiisB/bZwzBkNPb7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5222520-9eb9-42e3-65de-08db971d9dea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:09:26.4088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zv3XhbGOfOXLAZCGEz9PgoS1J0b06/CmjWKvHeebhtmcwvvLWtk6PcoLMrCLCNPqudIKDYEq9yrTxvt1E6S0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7205

On 04.08.2023 17:27, Nicola Vetrini wrote:
> The variable declared in the header file 'xen/arch/x86/include/asm/e820.h'
> is shadowed by many function parameters, so it is renamed to avoid these
> violations.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch is similar to other renames done on previous patches, and the
> preferred strategy there was to rename the global variable. This one
> has more occurrences that are spread in various files, but
> the general pattern is the same.

Still I think it would be better done the other way around, and perhaps in
more than a single patch. It looks like "many == 3", i.e.
- e820_add_range(), which is only ever called with "e820" as its argument,
  and hence the parameter could be dropped,
- e820_change_range_type(), which is in the same situation, and
- reserve_e820_ram(), which wants its parameter renamed.
Alternatively, if we really were to change the name of the global, we'd
want to take a more complete approach: Right now we have e820_raw[],
boot_e820[], and e820[]. We'd want them to follow a uniform naming scheme
then (e820_ first or _e820 last), with the other part of the name suitably
describing the purpose (which "map" doesn't do).

Jan

