Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7737318CF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 14:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549564.858155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9lwe-0006Mt-U1; Thu, 15 Jun 2023 12:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549564.858155; Thu, 15 Jun 2023 12:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9lwe-0006LQ-Q5; Thu, 15 Jun 2023 12:19:20 +0000
Received: by outflank-mailman (input) for mailman id 549564;
 Thu, 15 Jun 2023 12:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAiO=CD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9lwd-0006LF-N7
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 12:19:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8d86665-0b76-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 14:19:17 +0200 (CEST)
Received: from BN9P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::9)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 12:19:13 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::4c) by BN9P223CA0004.outlook.office365.com
 (2603:10b6:408:10b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Thu, 15 Jun 2023 12:19:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Thu, 15 Jun 2023 12:19:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 07:19:12 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 15 Jun 2023 07:19:10 -0500
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
X-Inumbo-ID: d8d86665-0b76-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S85GYti7BA9U1Imp86V9RPAEX2NUoerv61XHmR+4Kkru46+80/fqBrp01pKMKkn1ZSQYUVDKeYrtVc8GjfblpwReWOS8PMHtKOAPQ2qtzDd7/vLL6+/RgzTlta4GP6TBznGkdO6ZFEaHHkB4hC5XXQvERx3vKf7of5ZttdjWdghjsprebM0RLt7AfTpRi1u8syiNsCHP0yB+wHVMVlKu+uMpApmxrADJFYYflWDdXfHi9qkykA0GgqKZXBw1YEgK6qWp75mYf/eLwrg3Qfgs6mm7D+0D2yktfX299ZHmvJIY2oab5dgxqvLJlKw3ngn/+TT4vYzWqY9n+5MU8jRdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f52EWptb0zm4uV+cNUY2upkFs0zbDUbzOAWVNbWXJSM=;
 b=N4ANzF+BiNlePnSw0Nl60rx6PV8ObouIywd1ZgdZ/4HbnW/bLR41cxaOUtMhamfopRjYgP+dwQCq7QXdtUbps60Cvq3W0Pfp67nDhJZquhcJ3Hu4fwdl20muD2MTKB8As9cuhW0EnGNVxRoLDU/MH9P6fAwb6guM2bG91ShQKJt41DM0uG7+Ilg/1A3TFiOmtU6GQmkmh/VFJ2UpHk7MKtOWzeyydVr4DosddpmfQvuGsvlzX3Vzrjy8j8em141r9y5HgZJx54oR1bzJgRtWIlMO5SD7QULAlh4kaIuYnRERnJHZiFQ8VtU21fsyjq0W6JGcpG69XtNvTjDuhJoxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f52EWptb0zm4uV+cNUY2upkFs0zbDUbzOAWVNbWXJSM=;
 b=xl3VjZDnm0nOJ3wK+CUPAjlZazvp1y/0MroTYB52EdeNojIg8+UCJT3PO16+vqZ6JppIFrFIhbGEA3kjJA+QQVOWJ7sscn22I91i1d0iQG8MdlnWlwnxT2BeSXWFo1S6K4LReH5AtxYs9PEBhCWhfp8tcdQsKRkmEW+kfEHxbgc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f88fb6e4-731a-e8da-d713-785a9e6c177e@amd.com>
Date: Thu, 15 Jun 2023 14:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4] docs/misra: new rules addition
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <julien@xen.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <bertrand.marquis@arm.com>,
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <20230614225515.1057820-1-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230614225515.1057820-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e25efc-d2fc-4f71-c421-08db6d9abad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vSJWyAT3t4HBk2qTjt8Jx/ysPrBC1pPfxLzLeKz9ma/xhlF817ps2Q+Jrv7+1HF+q1+8LwHCQ38TwBZTY9IlZ8OgVEEutzmAQfJVcGon+66wKA9w4Y88+SjqIdAKDjER/qogGRPgPujQbC+Gb3PKhtoOtzHlQ1hsxe30bxNwH5KODI6kV06EaC+DWfz5QYYDlzO171i8S/RNWsgvxNYbe4FyzYdEM5dO8HYu08TeqLvwoW2OYY2WC1R/buJ+br0AGYWyB37es12OjsOvWhHcici0G2xqBMpdTxe+ujMRQqukFMiKr5IMuGGgis6tHpf4p6Czme7FXZ1Ka9Q6W3An1yO1URenrvDXJ9F2rWuO/QfDvE01qcRee5f1RWwlo2aikCXPXiERCmfrtL0fBj/oBkjdHJ/yyqGqS0SaurSlF1Wo+UAmOe2vqsQChimbSBo4XrU/D8qVJq5utR1lRpGb7ds10DnRzWCwFvNyDtTIxVMlOoJatxUihi2ytBbZHXcVtVkG7AgQU8tBDENFxU0jvvftyxeGJZwRIy4bOuHbb4k67iCgP1rox34YRR0HQZttjfCsCoMsf3p8fXgr4/EACnnY7S0a/8YgWVAAswQIPmZsdVa1YBqpPvOSPL6wjxPiwRj4fpNazx0soY6ZT+6lhdFAk00H9sT7ZCHE8Abw7flksCBahPmz/6ou7QOsSXKRJmx4NKGauuX5b6Xgw5ro63euHrW2X7lZg2yI3scPw67BdbZnG6/RgP95lkvCtQEWKhCM9htx7Fb7dkpcTIRfvyyZ906tQsnukpyJk7vmbIFDFdeRpxomRiuVL6x+QSGNVS71SzkwRyMAx6yctkcqwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(5660300002)(82740400003)(81166007)(356005)(336012)(2616005)(53546011)(83380400001)(426003)(186003)(2906002)(26005)(36860700001)(47076005)(44832011)(478600001)(40480700001)(70206006)(316002)(8936002)(8676002)(41300700001)(86362001)(31696002)(82310400005)(70586007)(36756003)(4326008)(31686004)(54906003)(110136005)(16576012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 12:19:12.9223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e25efc-d2fc-4f71-c421-08db6d9abad0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290

Hi Stefano,

On 15/06/2023 00:55, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> For Dir 1.1, a document describing all implementation-defined behaviour
> (i.e. gcc-specific behavior) will be added to docs/misra, also including
> implementation-specific (gcc-specific) appropriate types for bit-field
> relevant to Rule 6.1.
> 
> Rule 21.21 is lacking an example on gitlab but the rule is
> straightforward: we don't use stdlib at all in Xen.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v4:
> - improve wording of the note in 6.1
> 
> Changes in v3:
> - add all signed integer types to the Notes of 6.1
> - clarify 7.2 in the Notes
> - not added: marking "inapplicable" rules, to be a separate patch
> 
> Changes in v2:
> - drop 5.6
> - specify additional appropriate types for 6.1
> ---
>  docs/misra/rules.rst | 50 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index d5a6ee8cb6..41a727ca98 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -40,6 +40,12 @@ existing codebase are work-in-progress.
>       - Summary
>       - Notes
> 
> +   * - `Dir 1.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_01_01.c>`_
> +     - Required
> +     - Any implementation-defined behaviour on which the output of the
> +       program depends shall be documented and understood
> +     -
> +
>     * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
>       - Required
>       - All source files shall compile without any compilation errors
> @@ -57,6 +63,13 @@ existing codebase are work-in-progress.
>         header file being included more than once
>       -
> 
> +   * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
> +     - Required
> +     - The validity of values passed to library functions shall be checked
> +     - We do not have libraries in Xen (libfdt and others are not
> +       considered libraries from MISRA C point of view as they are
> +       imported in source form)
> +
>     * - `Dir 4.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c>`_
>       - Required
>       - The validity of values received from external sources shall be
> @@ -133,6 +146,12 @@ existing codebase are work-in-progress.
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
> 
> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
> +     - Required
> +     - Bit-fields shall only be declared with an appropriate type
> +     - In addition to the C99 types, we also consider appropriate types
> +       enum and all explicitly signed / unsigned integer types.
> +
>     * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
>       - Required
>       - Single-bit named bit fields shall not be of a signed type
> @@ -143,6 +162,32 @@ existing codebase are work-in-progress.
>       - Octal constants shall not be used
>       -
> 
> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
> +     - Required
> +     - A "u" or "U" suffix shall be applied to all integer constants
> +       that are represented in an unsigned type
> +     - The rule asks that any integer literal that is implicitly
> +       unsigned is made explicitly unsigned by using one of the
> +       indicated suffixes.  As an example, on a machine where the int
> +       type is 32-bit wide, 0x77777777 is signed whereas 0x80000000 is
> +       (implicitly) unsigned. In order to comply with the rule, the
> +       latter should be rewritten as either 0x80000000u or 0x80000000U.
> +       Consistency considerations may suggest using the same suffix even
> +       when not required by the rule. For instance, if one has:
> +
> +       Original: f(0x77777777); f(0x80000000);
> +
> +       one might prefer
Shouldn't this be "one should do" in reference to Jan remark?

> +
> +       Solution 1: f(0x77777777U); f(0x80000000U);
> +
> +       over
> +
> +       Solution 2: f(0x77777777); f(0x80000000U);
> +
> +       after having ascertained that "Solution 1" is compatible with the
> +       intended semantics.
> +
>     * - `Rule 7.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_03.c>`_
>       - Required
>       - The lowercase character l shall not be used in a literal suffix
> @@ -314,6 +359,11 @@ existing codebase are work-in-progress.
>         used following a subsequent call to the same function
>       -
> 
> +   * - Rule 21.21
This is incorrect as it should be surrounded by `` similar to other lines.
Otherwise it will not be taken into account by convert_misra_doc.py which converts this document into cppcheck rule list.

With that fixed (i.e. on commit):
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

