Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A587E26CB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628033.979038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00aD-0005Ym-Pu; Mon, 06 Nov 2023 14:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628033.979038; Mon, 06 Nov 2023 14:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00aD-0005Vz-MJ; Mon, 06 Nov 2023 14:28:05 +0000
Received: by outflank-mailman (input) for mailman id 628033;
 Mon, 06 Nov 2023 14:28:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fhP7=GT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r00aB-0005Vt-Pu
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:28:03 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe12::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1310af8-7cb0-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:28:02 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 14:28:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 14:28:01 +0000
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
X-Inumbo-ID: b1310af8-7cb0-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9x9sB4TV7IReacBntZ9W6hHLZIA7xCWXJEzgpdl/eRFNGYku5bgolIc2wZF9MzFq32Gn1rNymf/9m512+ljJoLY7roNf5I+cDcXojSD3PJ+tx5jzUX13evRsAg34GuWTuY1ldZu/lOezCotzQyyJhFwiC/3vcfGfv8cyIZRyfF6aWZ6U0Gg2aMH7D/sghIhHlQG5gUwe2A2jkRWyDe/C62KbrwO9SWGteBG4D7stV+AzhnY22jdBUd6Kx6EKXP992PIVKfGMXqCZzreQNU9QAFav8Q6FXZSGtTr2sO8SpC+PjxJHtKudkWp4V7b3VNnZN26yMNoxrPFurcMYwN/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbzF92ZsPyTGKT4HUFdTx0UvVSW1J+2BxcYu8QUCqyQ=;
 b=fE3RJ9rqTCCFHzRhbBgHEFxA4JtNo1AJAShYzfiStEouHRKMpTfEV2UJSx/TE7jNAhAp0Gk22gV/SRfVmZXra2P2vJ4hyp/rNqVp22pH2Pwh9RJWGyopUsibyXbOt023f8mtrN2zx1VQkPxfzgZe81SAv5+X8ZOPxHrD0MUgLNQEqeL+z+Nd2yg91AJF5zaBVnbNonVGuYmo+YdqTcOimrsvXn1oV10Xbz+LMbUp5BOvQSI0XZXsz6NjyIS+ihQfOWwV8nxGTI46Ilrpt2/5xeERUBa4kIDj++QL512cuRIUr/keCzQCSVECatNiVXy7O+9DQxh9PaBZnBD4FPc4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbzF92ZsPyTGKT4HUFdTx0UvVSW1J+2BxcYu8QUCqyQ=;
 b=OAjA7wFbM8doV3bxafLyM0UJ2HycY9Duvn15WjUi89HYffS0DporuGWaaKEHU8gevSANmY84i2Vu0gjnndmKJ/B9sxFT7Amg/PRbgx6CoI1YlWICx1KMaBJpWM59oxA0r5ohUbFflLk/6VK1IVfjgwS4utP2GmaTrG3zLGt7W3h6PtSM+ayLzrrF/NtL6daFISPSNPul1xQI4/N9Ra125W+O+eIqZt1MaAC6y9g5D4Zvf9xNRvQesqUOYdbgssiacF5cPHTkcfvmkbF2jH/G1tJERP0tdI7BAMifzg90Y3+NjSHMe1vxjt6EQc9aFavc8EuWga11BJZwACrqd6IpPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc56aa7c-9931-cadf-53cd-0f1f482a953d@suse.com>
Date: Mon, 6 Nov 2023 15:27:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
 <fe9f04781ea1ad9bc5f9b92bf58cd09b@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fe9f04781ea1ad9bc5f9b92bf58cd09b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 435601de-3537-4c61-59c0-08dbded49484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cS7mxcHBsHwzmar9UKZQADwOi4VWOOSQ/6Q9GxuNDzbiihln0eCdtSe8E78HjE41mTRIWEGHvymzcBv8z6Lx4BzAZ8JfNKevX/kRAeh2mZbfD9WToaWhNXtTA1JI3sNE1LFSWL/TA1y6uLOJxsKhWJeif2BxQ8cRYb/5AGA+38Dg1C6LrhAeYGXuekTWSlovbMeBj0gAGbYYu3BkJlZeM4mYaC/rd3h8F1EqYnVy7YCnGuM5tdF2gc8Iv7Enke1xYhyvj7V9z6VBp0viJNVXJ4XkDlwfX/6cxf8EEk3pDSBSwHgzS67OeONyhxfYlpHw4vDUJFFPn8zwfay7iuqJEvW5lUyHSNWJ85bVykrSTi+YgfJkZ50LimKF9eFQKD0qtqPndDXpmK9vST87unBCivFtW4PBGEKkGYwC3AFhqIdaquoxgCJjTa66QsX5L8AYvcl3cd3enZqjU9elvekZvRE0fwY2u/t8k6MniWyG0R5X4nFT5+w4kxP6zgSnRbc29M7jtktJB0rWrbocaBRYqsB2YKGxWKb9vs3p0HnkM2NFmD4otGJ/6O6fz4gtyTqwG4l1Br/VeAS92qO766Pjlrji1amnX16gQg8Lbgol6t3AcUtrMtY3ZvD9PvFkPKQcodMzTYjHTfenGCE7R70Zsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(31686004)(31696002)(86362001)(38100700002)(6512007)(53546011)(6506007)(2616005)(26005)(6486002)(316002)(8676002)(66946007)(6916009)(66476007)(66556008)(83380400001)(4326008)(54906003)(8936002)(478600001)(2906002)(7416002)(4001150100001)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXBRSGFBVzdnT0NDSWpUbHRoNVRpYzdtSXdMdC9sVXk2TTJsak1ibGtiTlA0?=
 =?utf-8?B?TzRDTTVjWnJpTWdNcEpISUgzOUZ0WmZUYWljSGtRSWxwdlBWZi9PU0FNbkh1?=
 =?utf-8?B?RkhkWENLUk9kUzh1TUZjWE9FWjRwK0d5RmZWYklNRnpEOEZEOFhKSUs2blZj?=
 =?utf-8?B?YVZmR2VhTFJ4V0FsajFQdktORjNzWDhhd3NZUEc0Rm5ZbERoMW1JRHJoYlJG?=
 =?utf-8?B?dXVsTi8yMVBtaHExR3h3eUFLbDNEUmVWcVBoTWQ5SGlqeFo1TEdsSlFVRDFW?=
 =?utf-8?B?bll4T1B1U01XSHZSc2NxSloxbkFhYmJvV3o0ZERnc2tuMHVpTkRBT0pFOFVG?=
 =?utf-8?B?aTlXMytVWlFhU21pTld6T2RadjMyUjUrRjB4SnpMVUVSMDYvbVM4WFlCQk1N?=
 =?utf-8?B?bzFVWC9NVk9EWU1kdmMwMXJmRVZuaVRkb0YzVmIyaUlaU2srd0JaUzlaanlH?=
 =?utf-8?B?elpuNDU2cExSZXpZS25kamhFUjBheHNHbHdrdk5TejVBQUZrNjFWSWQ4ZHBL?=
 =?utf-8?B?engyU0VDYUlmSGVZUWdvSHVxM1N2WHNXb0tyK2d1Rkh6Ykw3SGVWZXovTzZB?=
 =?utf-8?B?KzJQU2Q3VmRoOWNnb2xveEtHeHAvRCtFUSsxK3B6a2wreTBGUDdFamppSjdr?=
 =?utf-8?B?VFV5SzNDS2tkbFFhNVg5THJqZmRBaThCODQ5L05IVlpWMFRwRVpGVXlqMGlV?=
 =?utf-8?B?OTVNc21nenRvRUY3VUgyNW5VM2dtOFhSY0NZc0dnS3dlek1oT3cvR1FIRjNZ?=
 =?utf-8?B?eUREekszVC83UzBJQ0M3Z3RvNm9LdGFKY2l2T0RuSlRJSDY5c3lKTncycmha?=
 =?utf-8?B?MWhGRnJqUk5UOFc5ZFVOeEJ3UXB4VFRyczZhbnJsYlArTlBqZlVIelJjUnAz?=
 =?utf-8?B?WFpnRkk0bnVXWUFIK2FtZFhsby9rQ3hJaThKTnQ1MXFMTkt6Q3lKK0hOVk5t?=
 =?utf-8?B?WldraVdFR0JCcGpUVFE3YUlVMGZrdEJJV1lmS3dYUEhpNnZmRk9rdTZ4SC9w?=
 =?utf-8?B?VE4yY3ZYbDNwZ2hkZy9vVWwrNUs1SjVvQzAwSGtlM3ZOOHZSZjQxSW14dUl4?=
 =?utf-8?B?a1FQMDNDcXdsblRGbjNVNnVlaUYyZDNPcG5NYzJMdm1xR2RJZVFRenY3cFVa?=
 =?utf-8?B?Y3ErUHVKaDBsZDVjMUVCWXVEK2tHREplWmY4UnFwWHM4MTZhOTI4eXJrTm9E?=
 =?utf-8?B?UzJtRzZZamRMR2s3RHVYZzBQckxVNy9WemZyQTBydjA3cnZlYUNVV2JoNVA3?=
 =?utf-8?B?VVAzOEcxeXFJREJkeXhkZlRQMDlucWMwZFBUT1hUdTdabEEyY2pWQlN2NjhL?=
 =?utf-8?B?VC9hWGtROEREY1JjcERxbW9tYWNmVXNhWFdxY1RlU09RRHZmNG1qUUh0QytE?=
 =?utf-8?B?b3VhWGZNWGdUV2dKQ2Vab2dFWkZwVmo0MXExTkhqNjJna2pCSUVka2FpV25j?=
 =?utf-8?B?SGQ4OHYvVTFCQnZ4WGRvTXZHRzV3K0ZkVzZ1bnlUN0VkUHRFUmtHYTJJTHkz?=
 =?utf-8?B?Q0NFcjZNSSt0TnQzMGFudnNTbkJYQU41MVF1VXVjbThIZEFGeCs5RnBCVjFO?=
 =?utf-8?B?R2J0K2twNktnY3d4c0o2cDhOdkl6T2dXMGEyRDlxM0ZucWZRZ20rRXpaZjRJ?=
 =?utf-8?B?UEFyV2pQdG1BTTdxUm9naFRnYUQvaW5xa2pQa3FPdlEzMEtnZWNZOUQ0Rzdp?=
 =?utf-8?B?MGgzdlhpM05oYm0vS1ZOaEJDcTQ4SHRPR1JRbWFlVzZuTHRManp4eEdHYXdu?=
 =?utf-8?B?MzVXLzRyQ1o2dlE4aTVZbGhnRGVIditBWG5NRVRkU0d0amFqZ3FrbXZuY0sr?=
 =?utf-8?B?cnl6UlIxRlRLSnJIQnpiSUNMbDljU0NmZmxZTDFTd3pUSnZ4MEpCckdGVG5B?=
 =?utf-8?B?SjREbXBWMWZwQXRFY3d0T1BBWGdRNHFTazNDNjU2WjQwcmg4MmhvUi93TmhT?=
 =?utf-8?B?aGxtVTNiY0RIK1dEa2oyYllGRyt3LytWR040WnpyNVFDSERoSWZQZzhXN3RB?=
 =?utf-8?B?QitDN3NScVMyUkJHWlZuWnh6VkFhS0xCcnhmWitYdlNEK29CRmFxQTE5dFVi?=
 =?utf-8?B?SWQ4MjJGK3VwWnlvM09rUU51bnVmYXR4dFl1bUd3Qmh1MGFPS0k3bjhtY2Jz?=
 =?utf-8?Q?3ymLSV8zsfTBH4i5VmzQEZc6k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435601de-3537-4c61-59c0-08dbded49484
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 14:28:01.0651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g4k2bDizePw7Q3glDjxqDIoKMNvaU3W7ymCotGk2HqZMKDxeT3mfthQWuPSjJldeSPiw/u2tdwETe2rDmUDdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548

On 06.11.2023 15:24, Nicola Vetrini wrote:
> On 2023-10-19 09:55, Nicola Vetrini wrote:
>> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
>> compile-time check to detect non-scalar types; its usage for this
>> purpose is deviated.
>>
>> Furthermore, the 'typeof_field' macro is introduced as a general way
>> to access the type of a struct member without declaring a variable
>> of struct type. Both this macro and 'sizeof_field' are moved to
>> 'xen/macros.h'.
>>
>> No functional change intended.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> Changes in v2:
>> - added entry in deviations.rst
>> Changes in v3:
>> - dropped access_field
>> - moved macro to macros.h
>> ---
>> Changes in v4:
>> - Amend deviation record.
>> ---
> 
> This patch has received some R-by-s, but no acks at the moment.
> Perhaps at least one is needed to get this into 4.19?

I didn't think it does, and I have it marked as ready to go in. But
from an earlier email from Stefano I inferred that it might be
preferable to commit larger sets of Misra changes only once the tree
is fully open again.

Jan

