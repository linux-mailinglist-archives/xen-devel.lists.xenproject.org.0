Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805C7FB96B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643074.1002954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7wFG-0005ik-2V; Tue, 28 Nov 2023 11:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643074.1002954; Tue, 28 Nov 2023 11:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7wFF-0005gi-Vg; Tue, 28 Nov 2023 11:27:13 +0000
Received: by outflank-mailman (input) for mailman id 643074;
 Tue, 28 Nov 2023 11:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7wFF-0005gc-6Z
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:27:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 122ac6b6-8de1-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:27:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:27:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:27:07 +0000
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
X-Inumbo-ID: 122ac6b6-8de1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3XF31EK9a7i08Y6y9TDprvKYUxdWVa4HhfuufW1pW4kO3EEMixOxd/WqfFtjZwtgVCmyeKqyFQPumFPfrGrHvHyJwVnhwUTP3EGju28tsf5C7HO5KMeNR5o7CPD8cLIcxSwV406pr0COF1fRjMBtEZ03CL9MeQcd41fxsRd6IkRqqTWlzeXRQl3WBvZG/domEhY5CYIfox3JkHYwzJPc2dWcOVAQFUMKJ9+Agzqft0NKgdS5WGdogH1ClMB762qHAJOcEgjNq9hy0LvKidO0KABVmrrIqrMwVCdADJ/otnk+R2DBBzmTZW0bHCgtr+Ni6EVvAlos42kFsmI6ODPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTC/n79uuiwJnhKuQ9xsTvAOjc1SDzEnT5Qz3rTZ3dw=;
 b=g/YGQLWvsT2jPC3bx2+pTP5nUlBqFbGqKcld4ypWp3EG2KFMUAsc02CDCdDBaVuUl5uGesoEhx7NraW+RlUHwvXuSRMhK+LrWQJI2OMmO3IW6neZWbj62tSTEB/FVGb0PPJ6PTiBMp4Jh8dMSXT02QBvQzk15R9FJ/L9KyJPBp5sIYOTKE8w7VWJ/kSaed7nmRbTRA4j1EHB/wyQb2jnuCGXJlQdwf8WxDiaexLrUuAJ607dvoRQROGNcuBf5F7fQ8JnEEvMXWFVAAuSYKKqSvnAUEuIv8L4w3/j0cRwfPutBjIITryjCb57LOkaGrGqn4JnAxifMCnVkds6nnS8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTC/n79uuiwJnhKuQ9xsTvAOjc1SDzEnT5Qz3rTZ3dw=;
 b=U7iciL4V9OIbB/8NtNrzhYKbjdhwIHyZhPToqI9x4gF2e2hm10ZEmKXGf4B6OKmjCbxV7ntsqNgsj2GuWwYRXiMoWrEedbrvjf9jjWVTMXz/lv2lfrW2OrOXF8ULHMmgZQQDnrf9bi6s9Ng+FXGtOx7nJBA0SWQTkothrwlVZ7cRG/jQxZYY6iV1yC3RIz5z5xY32S9AzqHt+2gOp/Pa/RMjsA8bP058qGYK9jBfCMc2vtaMtsHDPdPXg/QsRUBs4lmG/AlhU5jdM4YmeS/4xEvrtVovsP3IuAzQibJMJL8Ks/9aISSOB6JxzhsPlUWimE0HD2xNDwSos+xd8F8WDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfc02fcd-8e0f-4f3f-a17b-c85c307878fd@suse.com>
Date: Tue, 28 Nov 2023 12:27:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
 <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
 <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
 <53B2087D-A24C-45EF-BC4F-012714C718B3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <53B2087D-A24C-45EF-BC4F-012714C718B3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f4549e-9b3b-41ac-0742-08dbf004f4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NbyoG/ffWOU6LyKABR/2lK9QKZEOYTAp+dBVUvBMhopoJUD+044gVjizln7ZxkRa/LaIgCZa64oHletFeYFQ4bLdG/+lwnvh6plC0ns8++YhV+eBJgdo7TpMqsqkAm8MpgzsWyJYpN2hoyj99nAmziI0HZrr6vQ0U6QC0Bg4xSkCYwestNaxfglsdYzXS0TX1ig3pP8pUVk5PXZHCSa0wOriui7ljoQu1iUFMNDb7XBbB5NdDue7tfZaCGZXRcsANATkI+nSvm4E46DpBi0IJx22ta+dcnNO3hxTnuvopDyD4STQkyd82NuK4zxVMFSLaMm6Iz5brMeY4wYHO+Z+qdubMC5NQLCxsSMjaVwtxurUq4aUR3yOzQPLo0cOkIXDUyoH+T3JSTVRl/GzCqvbXXGbfG0RO/H3XhqClyChBs2si1q7yI6RolqaPwRxZWlvxTP7xYFZrnSBnjVVmbuAznfEKWzPOB5YzCNtlvucM3DSQXbvcfryWA104n193oJbqR6lmx8YQk2E2QDTpWBtmRJB6H14qL4YJDpKkjUiBNSMrnL0fF64zVupCyJe3uNQOotJ+ZXYBz8wXIXZILkS7qEHOIX1QHVpYAj3yPI2THfPT4SG+YCJ3FeQR0mjFwQwuIdNxmzmq+ranHzeHseOmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(38100700002)(31686004)(6512007)(6506007)(8936002)(66946007)(4326008)(966005)(6916009)(316002)(66556008)(53546011)(54906003)(66476007)(5660300002)(31696002)(7416002)(478600001)(8676002)(6486002)(86362001)(2906002)(41300700001)(36756003)(2616005)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUpZVDFGQmVnd3YzQmk2WmtaZFR1Q2hUK0JuSC9DcUpXekhvY3ArbThERURW?=
 =?utf-8?B?RitlblhTV203RzdhRXFpVlE1RG5lcHBtOWtPb1laNTVUbVl5b3VUbXI4L1JB?=
 =?utf-8?B?Z1pGMUNDWHN6cVRNcDYwMmdjSG80MlUzbDdpZEo0YzhpSGFySFRTdkZiVXJq?=
 =?utf-8?B?NDIzRlFMemJFbE5tcTdoWEVyMkZJRnp0dDNCUDZKandOMjdlMENpNE5XOEdk?=
 =?utf-8?B?WHM1bFB0Sk5adjY5RVpESmlORituV1V6OWxzdTBLaVdhclEwNW9TaE9zZTZO?=
 =?utf-8?B?cHVHbnZXRTFHMEVBS1lNTFVCWmlGVkQ4dGFQdnl3dlo1aUlUbGFiNUlaVG5v?=
 =?utf-8?B?dElEdXRySVZyWmtFbFpSaXJMbFFpUWY3aDJpZk5mYjlIeWcyNFRuTWJhYTdK?=
 =?utf-8?B?bnpHR0ZmUkpKWHl1UzZJaW16cDN4VVpvNXM0bUZJMERKYm9lMTdmbFFOM1Zp?=
 =?utf-8?B?dWs3cjZ5akFIVzZzNjJEeFNDeW9wUmduUW9ZaDNKUHIxZllsaTUrVFVGOTVE?=
 =?utf-8?B?M0RwdDNKck9nRGJRTmhsS1pEZnNqYS9oV3ZxcXZVYmlaN1ZqUytiYkRSR2lF?=
 =?utf-8?B?T01YQm9IU3RISE10cXlXU1dTTTFhM2JBMFFCZ0FZMjlIT0ZEYUd4VjVPcGtk?=
 =?utf-8?B?VDh5MTkyd0c5M05qQVcyZndjZUw0MzdCeXBzQ0lPT2pPcUNVRkV4TUtJY3VE?=
 =?utf-8?B?bUgwZFdJTFNkQW9NWSs4QnZZaWc2bmVoZGtNVmpQdkFhWGR2bzJhWGxiYzg3?=
 =?utf-8?B?cDJGY25kaHc1dzk3bW9DVUFQVUxjNlJTNEdzYTNvRkdUMXB1ZGQrTEowUWlZ?=
 =?utf-8?B?MmMyeDlhNG5SVDh0QzVvQUU3aU9zYzZmZ0xTS3VGRGk0RWd1Szd5djI3WTBy?=
 =?utf-8?B?dys4WHFRN3N3MkNrV0dZOXRJME9uMHpoZGRkS290RXE2RzVveFloMkFoLzhz?=
 =?utf-8?B?RTJ4MG1kTEUrM1E1WHdndk90VW1TalhOaldrYU5NVHBjNkM0bnQxSDk4U3Zz?=
 =?utf-8?B?c3ZzNjJmVjZJQ1pQb3dxS0dIRzlDTlVYeWQvbU4rTXVYWGM2a3JLRXZMVTJB?=
 =?utf-8?B?NERhQkNyUlZhT21rTWR4aVNuSTU2MkdHQkhyb01CdGxQN2Eyemk1T2RUc1NZ?=
 =?utf-8?B?VnhnSFNlVXhtaHIvNFB1Qk9KV2NzdzZ5dmlKZVhrMjNMSDl3UlBzV015elB3?=
 =?utf-8?B?bHpSb3A1N3NpMVF4cFc5SWE0TUpicUhxL283VHI1cHpCMGl6N0h3QXArNmZn?=
 =?utf-8?B?LzY4V0V6YUxKcm1yZ25YeVRHdHFaaW1hNkpCa0JUam5Fa3hDQ0RjeG9kbnRX?=
 =?utf-8?B?aUFHbDZLWU8rQVZyUElJN0Y3VGNac0gwNFBQdHJsRDMrN1BMZWxqYmx4SWxJ?=
 =?utf-8?B?eGxCTlpKeGRWUTh5NGFHVXhOK0Y0RVRIaGVVZU1yUEkvNUpQckg5T0RkK1Fu?=
 =?utf-8?B?S1VWMXJsS1lhUUdoQXdZZ1poaGpRTnNEektQTmZyY1dhaEJSelB2OUY0dHRi?=
 =?utf-8?B?b0NwYXBqUGlEWnJjUVlueEQ5SlNXbzJrMTc4YWUwWTJxcmZ3TFBhL3RjQUY1?=
 =?utf-8?B?NTBGVG0rb05XcUtxcHZwYWgvU29GR1VFd1VoaVlXem5HNVFvajBFQkVtZ0xH?=
 =?utf-8?B?Y21ZNlc5QlNjYTVLRU5nK3kxQUFEZUF4SXVQTm95cnVwM0ZNV0VyOS8xYUw3?=
 =?utf-8?B?NkNuN2ZONTI2V2U4VUhQb21kMXRtcHprR05uU2FCWHNpelpuaG1ocTdOdzN3?=
 =?utf-8?B?WTVZRlJXbUtZcHdWbDNYc1RqWmZvdllpbUJzTUkrV3l2dDNaRklMcFEwMkg0?=
 =?utf-8?B?eTJKZElzMDdyWExabC9lZytwNXZVVUR2aVU2ZzVIUm5udVQ2OUtRR3lkMlV6?=
 =?utf-8?B?UUFLd3BGbFRJcWN6Q1pPdFRHWS9sV1pJWUNTR3M0a0tKRTZpam1ETXFLaDdG?=
 =?utf-8?B?dXlBaWJqQ0JQODlCN2k3M0tqOGxpdm5DcHNjbUQrekFpbVpxU3ZpZ2dyYkdu?=
 =?utf-8?B?N00vWkltd2ZGL2dQeG5GL21CUDFEczVtMkYzZ242Uk5qcWFDeDc0c3k3d2Fk?=
 =?utf-8?B?eWUxNVZheklQZ2xWdXRwS2l1ckk2K0RGeHN6SjF3aHBKVTlDL0lkWEU1TEFn?=
 =?utf-8?Q?8HiRNyCbg7qIvFeIsAtF2t7zb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f4549e-9b3b-41ac-0742-08dbf004f4a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:27:07.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQHCLECBUmVBa0vbNsPgzwed0/J1yU3iVlwkzBH/7Ygs4rgADj8W2Gcr3S3jmi/uWd7td9IiEB8nUHY0oF1Geg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305

On 28.11.2023 11:55, Luca Fancellu wrote:
> 
> 
>> On 27 Nov 2023, at 15:37, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>>
>>
>>> On 27 Nov 2023, at 15:13, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 27.11.2023 15:58, Luca Fancellu wrote:
>>>>> On 27 Nov 2023, at 12:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 24.11.2023 15:52, Luca Fancellu wrote:
>>>>>>> On 24 Nov 2023, at 12:47, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 23.11.2023 15:47, Luca Fancellu wrote:
>>>>>>>> Let’s continue the discussion about clang-format configuration, this is part 2, previous discussions are:
>>>>>>>>
>>>>>>>> - https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
>>>>>>>>
>>>>>>>> You can find the serie introducing clang-format here:
>>>>>>>> https://patchwork.kernel.org/project/xen-devel/cover/20231031132304.2573924-1-luca.fancellu@arm.com/
>>>>>>>> and there is also a patch linked to my gitlab account where you can find the output for the hypervisor code.
>>>>>>>>
>>>>>>>> For a full list of configurables and to find the possible values for them, please refer to this page:
>>>>>>>> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>>>>>>>>
>>>>>>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>>>>>>
>>>>>>>> Our coding style doesn’t mention anything about alignment, shall we add a new section?
>>>>>>>> I can send patches when we reach agreement on each of these rules.
>>>>>>>>
>>>>>>>>
>>>>>>>> QualifierAlignment: Custom
>>>>>>>> QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
>>>>>>>>
>>>>>>>> ---
>>>>>>>> For “QualifierAlignment” I chose Custom in order to apply in “QualifierOrder” an order for the
>>>>>>>> qualifiers that match the current codebase, we could specify also “Leave” in order to keep
>>>>>>>> them as they are.
>>>>>>>
>>>>>>> Where do attributes go in this sequence?
>>>>>>
>>>>>> I think function declaration/definition and variables.
>>>>>
>>>>> How does this relate to my question? I asked about the sequence of elements
>>>>> listed for QualifierOrder:, where attributes don't appear at all right now.
>>>>
>>>> Sorry, I misread your question, attributes are like invisible for the tool, they can be placed wherever between
>>>> each of the QualifierOrder items.
>>>
>>> Hoho, one thing where various options are tolerated.
> 
> I realise now that my answer above is not fully correct, I wanted to say that the attributes are like invisible for the tool
> only when dealing with this rule about ordering of the qualifiers.
> 
> On the other hand, yes, if the QualifierAlignment is “Leave”, clang-format won’t touch them.

Hmm - gets me back to wondering what "Alignment" in the name is about, when
order of syntactical elements is affected.

Jan

