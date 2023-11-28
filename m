Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6647FB7FE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642949.1002790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vRW-0002Ks-N3; Tue, 28 Nov 2023 10:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642949.1002790; Tue, 28 Nov 2023 10:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vRW-0002HZ-JE; Tue, 28 Nov 2023 10:35:50 +0000
Received: by outflank-mailman (input) for mailman id 642949;
 Tue, 28 Nov 2023 10:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vRV-0002HL-NJ
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:35:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e511a115-8dd9-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:35:48 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 10:35:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:35:19 +0000
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
X-Inumbo-ID: e511a115-8dd9-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTY9VZ3FtFfNLLNf1tLwN6lFg/c1KOZELtmNav7n5bPB8zNgj43QoZN4oN4Ow0R52tG3Jmx2bCti4I3KmsO2JpmSciChaKNkbgqG1UwfYInDLVlt5XpE8B99r1Jw0DZU/auGqkLQ9Wsv/PrPDu8zJ2lvYBpZDN0OtCc6HoENnh8X7Pyu8KC8zs46eRSfUPxSASWapxWMxYyzDEYXTcTVe28ZHSs4rqRGU6Qj53FsIoJ0BNS4B1zP1qtaoGp9ScB+EZLhf2xtIf6E3WVh5BX4c2zgK26rS3PlF02xTlCoG80/+J9Vq8agkZlCAWP8LcYtmidqf3FV7zQIUArRsMDbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9/1l+ViIg+Ju3Vw0L1eHHvCH642HR7HZCOl2I/vlGY=;
 b=VyfwxxaoXlvKdU8n4BLRHyB6yvZkVY3i4bykJutSp/1Bs5aOylONNKN/H784IDk0jM00w2HlfWpXCt/OyYB2kE9S8AyeZCVH9lf7ARhImP2LEGnBQDaASVG7yv/QNohSjmB2ccbIAWrChNFfW6xqGynUMIDwtpyo5ds1FN4lTND3bZHy6K9VeKqQDtpqGoZF7sUufQrTOiiL2sZ+Z5wtdwioQClq27gDUPLRq6k9TVnzEVzJJvwC3Lz+d0+slPkXpa+nIXJZYSTsfYxdpS3D4SQ3JI8uiXmwFDKnPCzQEoY5iDfMqAaDvESy4uK0vq1qGtb1tLIwM4r+Ct5EhwGs8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9/1l+ViIg+Ju3Vw0L1eHHvCH642HR7HZCOl2I/vlGY=;
 b=HQXjIyfaMYcgjy66AqnuSRACYplrEefhMlDjdjyAcUJdJ0CVu01mb9znvb9F+1F40N5mU5MmeA+sWxyxpc66nFrgRDSRpf8wFjMoKUsgMvNpl7gkrzLUGs3VInmxKJkH13/lvE6iMAhSrArHsrpcgxSdNwcHMxGEuNwqorPpuiOReNKvp2KiWc8MOReF2NzMUP62RrkYL61AQQZ6c1J9NHxqc8RGXS7rU6bo1jCxzuLJdBJsGomj8aufxKYjNU3PHQcPa+ocZJudLLzPRBFBF5++PP/LS4aRTQQg05fSCdoDwGEPU0QvSEhjncmBgVlTpBYp4+D9GvTUK7LWPdR6ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf1ff132-878a-4cb6-8eae-1995a78576a0@suse.com>
Date: Tue, 28 Nov 2023 11:35:18 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/6] x86/vPIT: check values loaded from state save record
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da09ffa-6143-47c3-4b43-08dbeffdb7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iXNWD1FmDPjz0f923BEYB20iueGRpWcff9PlMURHPL2qBDeqNXU9ApeWDsirgWjHbIu7fDnXSK2BD/I2fGHR3/7YQFps9j1FpG5nG7zQ26mSlR+OKZDTah2uxC47IhUmt73qo6pZVPBqbwyMxxd6ghnHwLNPkG0tNj/v5I/qjM35t5/5irT75abEAqDYqDesCejxb4RsG+DIhsFrAwlkTjVkUITiGL/znAwqDGTBOOUVMFGTRtxfIR1RAXz4CJ6uIe7rCz5I7SMKa1uvpo7N8xzO0ucm3aX6SEkePLI0HfdUcUVwE89UeTIMnOo9NIyiOGtdH3wAceg/c3IT52tBG+8Q5ve/RculWIKeQSeXebWSLatWHNAF4+jHp2E6mgQMb9XGtAIZsJOiaN95O2f5RjSbZDszexolEX4G+CedBASTKcZU3eqjFkpMwlMWHI96uQfBkLdKVL0deyFqHZBI9NDDQg4BgjLC0EKaKl/Oox5n6OptwQlIJQ5sldfVH8j9cpt38vurOser4+3lKh1QW2vFvzLnu1qvw+8PonIOFHZwiezBoGRXKK0Tkf5Cwxg8EkpsDl1svzogP2jjJ3H3Fe3q0Bc5TscKtk5BX6bunOIowU39eNmKTUH2Q162+gWuSGhC3XcRQswqJ1yxsAsuOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31696002)(86362001)(2906002)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(41300700001)(8936002)(83380400001)(316002)(54906003)(38100700002)(36756003)(2616005)(478600001)(6486002)(66476007)(66946007)(6916009)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnJFTE91anNEaVpNMjhyM0o2c2lLTGtlYkJFUHRVZFQvVkVNOXptRTBpYWZZ?=
 =?utf-8?B?VUplU013aWs4ejEvOGV6OGZFVWNaNWRYR2VyZ3NzVlBpMTFnTDVzSm5jWmIv?=
 =?utf-8?B?Qzc1UklHTWdleWd4TllFV0k2UVZ2bkdqdCtaRWx3RFB2Vk0rZ3VVb0hZMFRy?=
 =?utf-8?B?Tk5zNXd1RmQ3OTY5YXlTNCtOZnV3QUxTR2FoajN5cS85bU16cW9QVkhvVHBE?=
 =?utf-8?B?WWhxUWtOdzAzVElmLzFDOVJLRUxVd3JmbFlTUTFzeElSa2ljVW0xcm5uaG41?=
 =?utf-8?B?a2d5blJEaGEwcEtZNzB5cmZsWWpWQWlub1lpSHVkZGRxQjQrN2NRdnB2VjE5?=
 =?utf-8?B?U0VGOUdLL2xuOUdCMllxcGtzcU5EQy9WR0N4YWI2d2JLVW9GWUdhWE1pUzdx?=
 =?utf-8?B?eVM4YmhHMmlmUGl4TGhYaUF5M2wvMi9DZmdCNi9MczVpMHNJWGc2NktKRDBz?=
 =?utf-8?B?MHp1b3JmOFR4dTA5cThYaVVMY0pxWUJFV3VQQkpPaENmZlJRMFZ0eUZxcTdy?=
 =?utf-8?B?RElFK0pZY3h0WXJJaE5xcE9jWGgyaVE4MTVnZU56dXc2dDc3cjh6ZjhyLzgy?=
 =?utf-8?B?bTEzelRtc3RmVmtFVlJlaURPL3cxam1kUmkwdlRNaDc3V1BKQ0ovRm1kaitV?=
 =?utf-8?B?Yjd2ZEVzSWtUL0lXTnlTVzhjVUxWQkxhOUV4T1JRdTZFbDQ4N01CWGRoV3Ux?=
 =?utf-8?B?SXpsSkFxV210QlJ1dEVCVU9RL1Y3RXcwYjVkR00xQzd4cFJQVXhKUzVXNVZo?=
 =?utf-8?B?T1dYbHBraDRIbW9kUnhTekJ3TW1MeFQ1TDE3ZDhTdVMyclJ6WVA3d2VDWmhx?=
 =?utf-8?B?Nm93OGVyNDRkZTA0eVZZR0ZKZnpWOXdNZVB6YU5DZG5HUERpZzMxVm1tUmVH?=
 =?utf-8?B?SUxEUkVaOFZ5eFhIWG5hV1hHaXNObnl0REk5cGtVTFlyY0RyQWNCMEJDVk1G?=
 =?utf-8?B?bHFIRHRnTm5BaFZqcEhzTUlobkduZXpEbFdZcUYvOUJxNU1qMXhjZjBFTWJt?=
 =?utf-8?B?M0N2VDg2VzMvdUIycHM2akVXWGpLRzF1dWdxbDFkY29wTzRaaVQxMDZDRG40?=
 =?utf-8?B?a3lyT3lzR255WVFRYXlISHZoSWpyZEVaaFJEMy9CalVDLy9mUVNkZ21vNzRr?=
 =?utf-8?B?VEd3S3kyUnRKSW0wVEN2YVhPWTE5NmpVWDVYa2YxdWtCRmp0VTJ2YlBGSTUv?=
 =?utf-8?B?MVpMSDNUaUl4c1pGbit5MmtUYzc5amR6RE05MVBGWVlvMU1ZZldvZkI5ZGxj?=
 =?utf-8?B?em1JemFMdnE5Zm5zTGloREhhNEUwa0NBK05vNEUzS2E5UEl0Y0s5Y0hJSU9R?=
 =?utf-8?B?TzErcWJiS2czNEpwSlJBbGdZYzFtNGxkVVJmTUhWWXNFMGRxQmFYb3lDOTIx?=
 =?utf-8?B?ZDV5Z2QwdlRKTzNETjdWaVBzVE04UXpCTjk1M3BvZXcxSlVoTEZlRG14UVk1?=
 =?utf-8?B?Ulo2U2xsT2pWbTNpbWpzSkhNOWdZR0dmSTB3djMrblpDS3Vvcjh0ZkxXZGx6?=
 =?utf-8?B?WGZ6ZUhJOTMwbHUzbDZQNjl6ZDFwMG03MUxRQ0dLdzRycVlEcHE1U0tXamU3?=
 =?utf-8?B?bVo3S0FGV0dDQ05MMGtEb0VCa0ttMEt1WEcrYndiZTAvK2xoTzVpbDQrdVBk?=
 =?utf-8?B?bFBBUzRjN2hYVlY0Vy9XdVBUWnA5RWdqcFJmaW5KUHJZejZta0ZaRlovV1E4?=
 =?utf-8?B?bXlQRmlXaU4zamJyUXRoWTZSalAvTnFVQzF6U2hZRGNTNEtMMVN6anNyUDhx?=
 =?utf-8?B?NCt1cTZNMFk4Q2h0RjVSUE1zdjArN1NQZzRweVZTNFJqNmRlbisvVndyZ3Z0?=
 =?utf-8?B?MHVNTWVMaG00TDg2dVNmZ1pFZ3JGVnJBblJLRUt3bDd2blFhZG5YYmR4VW1l?=
 =?utf-8?B?Mm1kQk5GZlZFRVJQc3ZrU05HYTdSekYyb082RXUrYzJGOXB5VEh2WXJ3QSt6?=
 =?utf-8?B?NmVIRnlEN21pd29DMjZkTDM3ckRNUWUydktmeHY4ZDZpamVITzgwblFFd21t?=
 =?utf-8?B?RE4zMUU2alQySzdDRlgzcFFRZE1rSXBkeGVQL1k2K3R3SVQ2NG9HMEV3ZTNF?=
 =?utf-8?B?V3ZNWHMyQWo5eTlWb3ZOUm9KMTU4NlVUSnY4eEZ2eERnR21oRWd2cmNpWTh6?=
 =?utf-8?Q?F6ktacHrOJG/MmlgQC5vy10m0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da09ffa-6143-47c3-4b43-08dbeffdb7be
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:35:19.2332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9dMEiegVL26VEHoGUtEuntx9NjLCoeimn1EkVE05YZZpP76j+78Lozx9QBQQRQZYtH6tvdnLpmfZ+Z2piXfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

In particular pit_latch_status() and speaker_ioport_read() perform
calculations which assume in-bounds values. Several of the state save
record fields can hold wider ranges, though. Refuse to load values which
cannot result from normal operation, except mode, the init state of
which (see also below) cannot otherwise be reached.

Note that ->gate should only be possible to be zero for channel 2;
enforce that as well.

Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
the value pit_latch_status() may calculate. The chosen mode of 7 is
still one which cannot be established by writing the control word. Note
that with or without this adjustment effectively all switch() statements
using mode as the control expression aren't quite right when the PIT is
still in that init state; there is an apparent assumption that before
these can sensibly be invoked, the guest would init the PIT (i.e. in
particular set the mode).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For mode we could refuse to load values in the [0x08,0xfe] range; I'm
not certain that's going to be overly helpful.

For count I was considering to clip the saved value to 16 bits (i.e. to
convert the internally used 0x10000 back to the architectural 0x0000),
but pit_save() doesn't easily lend itself to such a "fixup". If desired
perhaps better a separate change anyway.
---
v3: Slightly adjust two comments. Re-base over rename in earlier patch.
v2: Introduce separate checking function; switch to refusing to load
    bogus values. Re-base.

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -47,6 +47,7 @@
 #define RW_STATE_MSB 2
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
+#define RW_STATE_NUM 5
 
 #define get_guest_time(v) \
    (is_hvm_vcpu(v) ? hvm_get_guest_time(v) : (u64)get_s_time())
@@ -427,6 +428,47 @@ static int cf_check pit_save(struct vcpu
     return rc;
 }
 
+static int cf_check pit_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const struct hvm_hw_pit *hw;
+    unsigned int i;
+
+    if ( !has_vpit(d) )
+        return -ENODEV;
+
+    hw = hvm_get_entry(PIT, h);
+    if ( !hw )
+        return -ENODATA;
+
+    /*
+     * Check to-be-loaded values are within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.  Note that the channels' mode fields aren't checked;
+     * Xen prior to 4.19 might save them as 0xff.
+     */
+    if ( hw->speaker_data_on > 1 || hw->pad0 )
+        return -EDOM;
+
+    for ( i = 0; i < ARRAY_SIZE(hw->channels); ++i )
+    {
+        const struct hvm_hw_pit_channel *ch = &hw->channels[i];
+
+        if ( ch->count > 0x10000 ||
+             ch->count_latched >= RW_STATE_NUM ||
+             ch->read_state >= RW_STATE_NUM ||
+             ch->write_state >= RW_STATE_NUM ||
+             ch->rw_mode > RW_STATE_WORD0 ||
+             ch->gate > 1 ||
+             ch->bcd > 1 )
+            return -EDOM;
+
+        if ( i != 2 && !ch->gate )
+            return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
 {
     PITState *pit = domain_vpit(d);
@@ -443,6 +485,14 @@ static int cf_check pit_load(struct doma
         goto out;
     }
     
+    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
+    {
+        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
+
+        if ( (ch->mode &= 7) > 5 )
+            ch->mode -= 4;
+    }
+
     /*
      * Recreate platform timers from hardware state.  There will be some 
      * time jitter here, but the wall-clock will have jumped massively, so 
@@ -458,7 +508,7 @@ static int cf_check pit_load(struct doma
     return rc;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_check, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
@@ -575,7 +625,7 @@ void pit_reset(struct domain *d)
     for ( i = 0; i < 3; i++ )
     {
         s = &pit->hw.channels[i];
-        s->mode = 0xff; /* the init mode */
+        s->mode = 7; /* unreachable sentinel */
         s->gate = (i != 2);
         pit_load_count(pit, i, 0);
     }


