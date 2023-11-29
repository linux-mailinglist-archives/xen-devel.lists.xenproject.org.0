Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF77FD094
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 09:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643724.1004172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Fou-0001lv-MT; Wed, 29 Nov 2023 08:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643724.1004172; Wed, 29 Nov 2023 08:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Fou-0001k5-Ie; Wed, 29 Nov 2023 08:21:20 +0000
Received: by outflank-mailman (input) for mailman id 643724;
 Wed, 29 Nov 2023 08:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8Fot-0001jx-GA
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 08:21:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452b5b8f-8e90-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 09:21:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9737.eurprd04.prod.outlook.com (2603:10a6:800:1dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 08:21:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 08:21:14 +0000
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
X-Inumbo-ID: 452b5b8f-8e90-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbdYjtZAJ7gKeUA+36t1ucUiLR+rfDVNQmpAHa1pCZW2zA+bg51FSz5eOvgBRI0tHxGeSzwxdHEaVKW3p0Vl3W4DvR1LBkSPvGwiZcsHDLXVm994xdHAdES4nBks6opZepAaYZ+6SMT7LSQUjAyFtl0MLmCQRkQJl+4BE1aj6Xt1V8seM1uW7kRG5e2JqNyzwja7mpPLbAruLsPjNICtjINj5hRIOqsLrpFSCdPC2H3qjqsBvsy3tA13bOrY139ZKPgKQndq+buDMawuFi2uqkjVDuMB47xHr7GrFYtLxVo9l6hI5dJcfOF3Q1yozCrRJn1eo7Jy/CS4DameDrYfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wglg0ZMDMv586ESw9J5rA9aumQQgsD+/xsQ/GOaVOYA=;
 b=XUIIKkKpN93mkWkEccs6czZwCDq/U0B1RMEu83Dh8ziLlz/2U9j5zNC/3pM/hfIKr5bdFY2k029XHCZnL0jRwxCe9P9Ug+MOGqq6x9orl523shuWwQdMl7cg/GcFqYv12b71qIsYsATFjtmLSuy2GH5O9oTo0ICE3AJrmoMJuPFUoOCu+JIh1YknKyK7r6SzpW85mhLvfvP6mydKJXmCMJGZD9Qr6kxj7iNelNh9cSp+Ee7x7xWTXZq0xKy/CuP9RejssQ94MEK7bBSXXxgDy+CWFzgRqMBXHUJNUx6ObP0cA44BgSvQHO3MuturUh+nzzMCKMkF0pVJ9jeqxWEnpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wglg0ZMDMv586ESw9J5rA9aumQQgsD+/xsQ/GOaVOYA=;
 b=V9SVls5/OtQIF0a62NQP2+vL77oybLTB5FP37hl9wlThzBneuO17QOA6FLMPatIHlGYYsTSgFSTrw4EyCye8NjEKXLQaRWMqqz+hjGWWGZlZbRGCKPIIyY59QqLS91PAX/DEq7x3djaJnbuTDVAoMR8FvzWhzSA3e2EEVPYCWSHWB+jKceF7q2k9CByfAXMAhZUShGCx8pjcawKe1Cny1h5uUq3LrjDhwJ5pW+Jp5O+W/isWrE74IV33mfvkLfDou0+o4gVyqPcbf3k9f/IkvHtq9kHXh9rOSY+0zPq7E6ML7733oX/4hxiFTYMN6dkvTuV13l0zt73paKdV3zTpSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8350624b-a889-4258-b0e7-0d3ad021b3cd@suse.com>
Date: Wed, 29 Nov 2023 09:21:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
 <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
 <77169e15-f1ce-485c-a7be-45901708056d@suse.com>
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
In-Reply-To: <77169e15-f1ce-485c-a7be-45901708056d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: baa6bbe9-d92f-4630-7aa1-08dbf0b42733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oggsh5hcy+b2Gg3FXGJUAG/O0YsAAdcRrpjg2plUwxT1I0SWOx3VbcOT4VeU7KDCnL9PQX23nC69wCDIeFNBlWrAFHwAkAEnxPXi+pNvag1NSYSarTM8sUcLPoFU3BSWwXmG3J28pLh/wgjQTpTvmnpU2THu60ZcqYIIuE2pqXdzB3Lpp2Mx/XoSpf/M0Q6LTWT2TlGWNdUwgkw6Po7y8/JQijoz8K5fjR1sYsRJn1zJabk6UwqvmS7GjftK/s9dvEUAJqm7Gh+4hLkGPSEUSiWsS0Kh8i2D6IuonOvvsPNHe1V9c7D7CrHVjw/MD1RrE+1kKZG/qoHIiwMt282hZcN6nXr6uIzezb2IWvdw59kLw7jVfmpOHPHbDA+Vt7MvMAiGeGfj4/88mcwwaOC++OMwYXuHbzC5jdMhp0dGoGa7tUzkyCdO2NCVGAmReCPY3RwhTaK5CbeATPgYtXftQTTYtXEPF6Ygl/IzlZhOVxt1zkMlPs6g8veNES70UUnekedsgOdD0DuCU5fnrfv/FFB3ZnKsQc/BdxKNJ4wGLAqsuSxVJ+gpHxBjXqGzCrRLYI62WyPzlw8lnM3iTtgdakeCeov6Mh0afYigQRR59KDrf31ht14WjVYidhTe3jR96JaT0juool6F73P3iedLTIkqNG1EfUG8E8TQOjU81S0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(478600001)(6506007)(53546011)(6512007)(6486002)(316002)(54906003)(6916009)(66946007)(31686004)(66556008)(66476007)(26005)(2616005)(8676002)(8936002)(38100700002)(4326008)(86362001)(5660300002)(41300700001)(36756003)(31696002)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlExbElJQSt6b0c0NWgyL1k4QUVnc0haNkQvNjNvRmcxbmNQcjUyUCt1V0VM?=
 =?utf-8?B?bVJoeFVUR1Jjdkx2QWg0Ly9Id1VIcVAzZGUramFzNldDZEZRc2Y2eWJxeGRW?=
 =?utf-8?B?UWpGYTl5RWUxZUoxS3ExODdQSjlwSURuM3hQMExLdGlEL1NQZ0Nza0d0SWtN?=
 =?utf-8?B?V0RwSDZwWEVBbUlUWTNnVVRsM1NHQ3lnQlVFdjd1LzI1NjQrdjAvRy9VVDdi?=
 =?utf-8?B?S21EUUdkSmxCSGlvRGRFTDZlNE0vV1ZqUjhUNzd3Tlo4ajhmalc4S0RIaUZ5?=
 =?utf-8?B?QzUxdGQ3Mnk2SkJTUFF3VmF1S1R3alJDN2xYS3l1dVJkU0FETUoxRUYzL0hI?=
 =?utf-8?B?ekE3SldpYkJnT3ZLRmFjY000czNUMy9TNlVuSzdwR2M3eHVicFZXK1l3VWwx?=
 =?utf-8?B?d21RNTRXTzZBcmprU0hQUE43YnJ2dldGb04yWmtXYmxYZWdIR1VqRzVQNXlp?=
 =?utf-8?B?SDN4eFZzNFVRMTQ5R25HQXdJcUtlamxQY1NzZWJNbWlKTkRGOXhzS1B1YWNX?=
 =?utf-8?B?SThlWjRQUG93VTFhMVpwL0JpaTZkWDd0aDRiY3NMeHBZRWpqbTYwZzZSMTNG?=
 =?utf-8?B?MVNGZ2E2ZHU3RmlpK0VHZWdsendsUGRjT1FaOWltOEVkNTBjVnE5UCtsSHRC?=
 =?utf-8?B?R0JMTzBvVW5UV21KVmVZVEVINjRtbjhmRnpsV0g2YUU2aWJIMy95VHNkSEkw?=
 =?utf-8?B?UDVsTzNlZlJMUE9YOWRueW5jdWZ6TWtaTmFvTFFQNll6aUFRblZJY1lwaVRE?=
 =?utf-8?B?aldHZFVNK2NBS2wxaklCUldLNGFQbGU5cmI2UTcvT2tuQmRtNXE3b2M5Y0lL?=
 =?utf-8?B?SVFTcktBdk14c1RJTXNmKzhvNkhYVi84MWtLMzJWek1lM0d4TXc1YmhJVytl?=
 =?utf-8?B?TGFPN2ZKcVIzWTdqeTRKUXVCdkRTUVZOMmVmZmx0ZjVFaHhPZk9NSitBd0hB?=
 =?utf-8?B?LzIrRG81WkcvbUpwdmV0cDZCK2Q4elNoRnh6SkRVZXYydHhZaDlvZWFDUHRR?=
 =?utf-8?B?amtOd0pkZFpZcElNNmxOSXFMenMrUU5BaUlISVQ0R1VLN3hxblcwT1pnNWQ0?=
 =?utf-8?B?SXJqZEpXL2hkNU5SWWVvUlUxSFkvNFl1K24vbm83bC84WTNzWGlxQU54c1J0?=
 =?utf-8?B?TFAya2FkQU4yQTZhYWw1QitSemtzeUdTdktpazFvbEtGaDdUT2RGd0ZSNFZZ?=
 =?utf-8?B?dFdYdlF6K0xCQXJySWcrY1lmYUR2U3ZaaWpnTGtRVHhFTGEva0laTmU3azkv?=
 =?utf-8?B?a1d5NmQ3aS9qOUYwbTdVZTF0MTFCMzBXbjdpVTExbUgyTHc4aldaekJ0cyt2?=
 =?utf-8?B?Wng1cEIyRFl2dllGeUNqc0xSQklUVGw0NzFPRDA1NHV2ellrb056VWdCVDcr?=
 =?utf-8?B?ajBRNVQrbFgwNkUycGVRR2NpY2NnK0dybUFzelpIMUlXVXI0RExDZGhHek1L?=
 =?utf-8?B?ZTlIZ3pnQUdSaEVEM3Ftb3dydjhFNFozekJXRXpBRVdrcVBEZmVLNEhKQXpZ?=
 =?utf-8?B?ZjBDZGFmNDVrMnQzdUg2aUFVbmJZTHpVZWd3cDhHMUN5NEFxNmYwNDBrNDFN?=
 =?utf-8?B?SzE3KzdtaCswbzRzVW1qRnI3THFqcFlFaUl2elZKVFJrcG8wQlVPN2ZPMms2?=
 =?utf-8?B?N0xtT2gydnRiMy9xNENhK3MrYW5iT0R3YnFkREtFSVFwbE9URWNwTmJQRnpr?=
 =?utf-8?B?b01RaTBUNzByREpmVWpSYVMxYVIxaXlBdFZIMlFnTURGYjZGdHZCYXpxU2JK?=
 =?utf-8?B?VlhJVC9VNHNoUUNjQ3NSa1o5eFM2Vk8xYUc4dW5qZXUybGhjZWRyRHA3UEh0?=
 =?utf-8?B?Mi9MKzhHSUtPY25YSnJQN2lyYXd3WllXZFFObmtBcE9Xc2Y1OEduNFBXN1Ev?=
 =?utf-8?B?OXFndGhVd3lsQnFSQU9nSklza3VPc3NWRGpiZ0dGdGI0VGw5V0xHamwvcDhT?=
 =?utf-8?B?T3lJa054MkJOUUEramZhNGE0blFzcDFUdC82V2huaVlvSzIvUUlpSGdYTExp?=
 =?utf-8?B?YlVSQytpTURleXpRNFJqY2dLdDdlWUZYbk45OEsxNTVIbmVOZTJrZldReDUy?=
 =?utf-8?B?ejRTN2FjMGhGNXRaSHA0VzhLRG1SV2lRaXA3VXZTRnN4aWRvWGtMcnVHeXlC?=
 =?utf-8?Q?X/rCLXvf6QWI7kCja4ma8R2Rl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa6bbe9-d92f-4630-7aa1-08dbf0b42733
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 08:21:14.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X250+pNmRsyi9uUYi/GEM9wqwmKMWw5+ZY0zzwYy7Ti8fMH9g40LHTbaAAtJ13XHkplXwxLWqQbPG2bjJuQ2Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9737

On 29.11.2023 09:19, Jan Beulich wrote:
> On 28.11.2023 23:21, Shawn Anastasio wrote:
>> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
>>> --- a/xen/arch/ppc/include/asm/monitor.h
>>> +++ /dev/null
>>> @@ -1,43 +0,0 @@
>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>> -/* Derived from xen/arch/arm/include/asm/monitor.h */
>>> -#ifndef __ASM_PPC_MONITOR_H__
>>> -#define __ASM_PPC_MONITOR_H__
>>> -
>>> -#include <public/domctl.h>
>>> -#include <xen/errno.h>
>>> -
>>> -static inline
>>> -void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
>>> -{
>>> -}
>>> -
>>> -static inline
>>> -int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
>>> -{
>>> -    /* No arch-specific monitor ops on PPC. */
>>> -    return -EOPNOTSUPP;
>>> -}
>>> -
>>> -int arch_monitor_domctl_event(struct domain *d,
>>> -                              struct xen_domctl_monitor_op *mop);
>>> -
>>> -static inline
>>> -int arch_monitor_init_domain(struct domain *d)
>>> -{
>>> -    /* No arch-specific domain initialization on PPC. */
>>> -    return 0;
>>> -}
>>> -
>>> -static inline
>>> -void arch_monitor_cleanup_domain(struct domain *d)
>>> -{
>>> -    /* No arch-specific domain cleanup on PPC. */
>>> -}
>>> -
>>> -static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
>>> -{
>>> -    BUG_ON("unimplemented");
>>
>> I'm not sure how I feel about this assertion being dropped in the
>> generic header. In general my philosophy when creating these stub
>> headers was to insert as many of these assertions as possible so we
>> don't end up in a scenario where during early bringup I miss a function
>> that was originally stubbed but ought to be implemented eventually.
>>
>> Looking at ARM's monitor.h too, it seems that this function is the only
>> one that differs from the generic/stub version. I'm wondering if it
>> would make sense to leave this function out of the generic header, to be
>> defined by the arch similar to what you've done with some other
>> functions in this series. That would also allow ARM to be brought in to
>> using the generic variant.
> 
> Yet then where would that function live, if not in arch/*/include/asm/monitor.h?

Hmm, maybe implicitly you're proposing that arch/*/include/asm/monitor.h
include include/asm-generic/monitor.h in such a case, and define this one
function on top?

Jan

