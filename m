Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE87F5DE6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639645.997204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r680t-00089r-00; Thu, 23 Nov 2023 11:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639645.997204; Thu, 23 Nov 2023 11:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r680s-00086X-Sk; Thu, 23 Nov 2023 11:36:54 +0000
Received: by outflank-mailman (input) for mailman id 639645;
 Thu, 23 Nov 2023 11:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r680s-00086R-1f
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:36:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9918ee26-89f4-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:36:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 11:36:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 11:36:21 +0000
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
X-Inumbo-ID: 9918ee26-89f4-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnYrdb3kCka/k75zDVu1lzmF3lD540sTnZXvrxNqRHYUcvMVsuJ+Hg8XEZR89quTaQPAmCoFfFavBS1cB3z3PZtyM5CgBAGllhiVi/37FLQ2tHVbRBoi+jJlyiacxWDqOyjmQmFNu2CwB+0HeIhZ2kMMfPhPPfm0mYzIfORzugTK5NQKWzBOuZnkxGce8Ci5IxWotKXEMJLTH67FPRVWV6juCXTPVnuLJylzm3mWF9CACB/LLChq2OgLinA7qWPxrH+rTnK6l71Cdk1nz3LSe8kpr2YxsBmX0dC/CcmkKuqwufhKOIwCoRQJZW7sFEeV+bQSoi2e4X0tUWJDBANv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUBCnqGw7BivzaC44tdWLx7rcwqPa/41nUuRiv5Q4Eo=;
 b=GrGIkSpENT7pmqpXgKjp1NHfrPYcUG8a+ipxmq2WgKAMCbdLElASFMkn9bw1+KLQmLmr9y2r9yoXnEs52+z/nH++GgLC/ANBBFx1uwCmWiqMsNut84xs1qE22RQWTlw+xXbRROE5wkktOQvvJM1tH99Pp5WaFI9o2t6eI4TfMNrkRLZAM0yk72OIx3rGlZHZ5PC5TS31pEm9XT8ocs+Z2509bB7CAbP9nyyyMy5v9skTZD0rND3f4RI2OOVlH0KUu+FYPNI+1ISFCJ46PoCAYMJa53/2SGoxfDaYo+yGK1jJVMoAcRT++/YxdS0/hY+YwVuL7TrCFr3SyLX88cjWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUBCnqGw7BivzaC44tdWLx7rcwqPa/41nUuRiv5Q4Eo=;
 b=5O1z4eeeSG+bTN6Csoz+JtC7eq6/ENWJVW2T2NlbP/aO5KvqMBKP3aHDQ4ZWUHg5b/Qpdp+2BFMS3CG+1/XudrS28yitquqnvGNB8m/6f137r7Pw4VlFbxzeCgpcU4f703nCA7W0iYLqzsVhq/q2fOaSzdJtHA6f/eWHdknGkR5d+K7RdLqoIU3oe5iNgsMQXBpcNVZLAUwzQf/Lruakd+f7SJx5Ph8Ziv3g3mWtZE+BRjcBv+EKXF4/0Q3O1FeHtoDS3w9YDWhTv6W5MqUXWW0D0NXSi9ISTHZOkl4FUnREu6kEUOGvLxXxKRqxFeCRiUT1d3V1j0EkrDxDJejo8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <182670b3-39d8-4d32-a22e-2fda9857c207@suse.com>
Date: Thu, 23 Nov 2023 12:36:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
 <6d89d2e3cb2ac28f7f40285f213c74ef@bugseng.com>
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
In-Reply-To: <6d89d2e3cb2ac28f7f40285f213c74ef@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c69f62-0168-4b33-6fac-08dbec186a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PlbcDQxrltuxAFUMA/dRrllRHpgvHcdIVymz23Wf0xKD4LFO9xpQAcK9oJwgtBU2mJuxg7nJ/v2u69W8HUF9okwJtCu0Kmlb9Oe1/O/zcaosvY9K5r+6L3NsF+5Pjpg+u2b/0pdzHw8EKNOrTQxwK4zYbYMtyt0sDogx14mIec4vkyBSFelyxDjogbMvbsAFyg27FO7kIuPkFFG0pGiDrTISIAHCHKo3hTsVFG3mDE8Tvgd8k59BUlG6zOo/JlHYwzBqvgCRsfdqlMI1earNwOvFG8EgODARLnscG/okCIh9KBriV/RwZdMIuNWt1ME2SRAjuEeXWM9QFZezLL740UdG7kpTRh748isq9lF+zz0JlssrEkXstUNeDoIPmqFjDhC7YEkrKGlMpj+Vz4el9wzJ2+sJgZNBXGFED2cynFvdEiVM6kyCcgDLGO2PTvMsjuE7QJVXg93CcjfTJ/6hR/95T3eTdaZ675o/hD4IPf7zVpskeyS3JJJkkAaCsJ0DCH/S43jqHUm2Rq2BMHofqPY4R2u7jeYrNEe2Fq/FYmJXiY/1qBsVBxq7Nq8qtVjwrZDuA3FPWjXDgYb2E43dNyQFBhiQlUlkTPZ5lyw0g9PCSCsvJ8788H6t7dYXUXIS2vXw7B0sVYqy1oRGNFx9qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(36756003)(558084003)(83380400001)(54906003)(8936002)(4326008)(8676002)(316002)(26005)(66556008)(66476007)(6916009)(66946007)(7416002)(5660300002)(6512007)(478600001)(53546011)(6506007)(2616005)(6486002)(31686004)(86362001)(41300700001)(31696002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEhNbk9tWHgzVnZwTkkrYmNITlIyZmxDNTl0bHlSL2pnUkJMV3l3TTYydHkw?=
 =?utf-8?B?dEo2bHA4RHU5aGR5UjhBVDZYT1dSQlJXOUZCSDZGTFl0amQ5NFcwaVlCdXI3?=
 =?utf-8?B?WUVmVWVoYjkvUklublZiMEF0WEpCRzFCTkc2TkVkMnlUaTUyaUpLanZNZGFX?=
 =?utf-8?B?cERLc21GVjRmMlV1dE9DRXF5QndpRFp0a01CZzlMdHFXT2toMGVsaG84Tkwv?=
 =?utf-8?B?bTR3OFFHVlBua2N4YXpMVkp2UG1zSHhZMFZKeHZxMXg5VzlVdFNWSXJTR1JD?=
 =?utf-8?B?eFkxeGxJOGk0S0hGOHp0V05VVnBQOUdWVHFNcHpGNGg5bUo2dGF0bGtNWXJw?=
 =?utf-8?B?cmpBeHZzaFdmTGlCbjFVNklPbkl5WEpjZDQ2UUR4K1BOcWdxVjVqWTZQWlpw?=
 =?utf-8?B?K0Y1WFIyb08ybDVNYWtqVk03TzA1OXJUM2dTU0YxMnRiSWNaQnBpd0RtV1Nw?=
 =?utf-8?B?RDdiT0FyYWdRaTMyTVNUcTA4aDVEMGl6aEpFcXZPeENOYTJMZFdMREU3TTJs?=
 =?utf-8?B?Z2RmTFI2dmVRejAzcDl5cVV0WUlKSzZzODdIaUJFMHFYRjhubmdNSllDNHdv?=
 =?utf-8?B?Zy9RS04wcjFkTXFINUJMeHdPU2t0ZzI2Q3ZMWUhseS9QeDgxSGhrK3dlUWt4?=
 =?utf-8?B?NVR6bWJhRTJSeHpZSzNxKzFWNXUyNHo4NWhMU2NPWWRJenFReWFaMWdEUGpj?=
 =?utf-8?B?c1lwWEdCaDRvbXVBM3dzWE43TFJFSFcvR2JMVmpLd01MR3BVWTk5S25nMkxk?=
 =?utf-8?B?TzRwSmxGWXBQV3dSYXIxb1c1NThsUDVyczhXR1h0RzRuczVIM1AxWHpyWjVF?=
 =?utf-8?B?SGw3VkxWSElCUlVSRjluYTRDM3RaTkdWeEFlckEyN1paM1d1ZnZCWVlPNERi?=
 =?utf-8?B?Y2pBelU1L0hnOUxLOFhqRlFLUmpsaU5WWk1zdHdwZW9WZE0rTTZBdWJRYzBv?=
 =?utf-8?B?UWN0aExHeVFQNGlkZThOM1g5K3lWZ25WaDlEdjNUYlNLVlpVZVFFcGpWeGFp?=
 =?utf-8?B?RDd4d0ZqV1I2c2JZTHZXb21RZE4wVFMwVEEyNkhJTE5sUXpKMENLOXN3TnBz?=
 =?utf-8?B?Z0dIQllPdjlqemtzT1NJbWtWTExDc1V2Zjl3TENNam9tR0I5NnIyc25CK1NJ?=
 =?utf-8?B?bnFuR2tRZGRmT0R3R1BYOEdLVVMwa2NFL1dVOHlCR1RFTFZoaFhvdld2MUxI?=
 =?utf-8?B?bXVOWDdDajloVjI0b3g2R01weEc5MzRJNnZibWhlaW1sZEdZWVlZbEVsM2N4?=
 =?utf-8?B?Z3JUS1N6TTZRREYwQlVlTWgzVlBSdmV3UjNWMytWcDBpQ3BibG9PaUhEWHhl?=
 =?utf-8?B?N0w5bFBBcWdod0ZLUDNYZEFrNVBhTWhnUWhHU3hZVHpjcC91RTRiU2FCWkcr?=
 =?utf-8?B?UzZZdUdmeno4NjMwTm85VWdtVFJjOGtDc1ZOeUxHcmcwQXNMYXYrMkttMDU2?=
 =?utf-8?B?Q25SdGJIV0x2TkcxZkpyL3ZZeldsUWVXRHdnK1VYTHdTcXQ2Umo4K2xlQWh4?=
 =?utf-8?B?V3ZmekhpNGtsWER2cnFxRWl5cm9iUmRWUmtUV29MTkdzVlc2bk9xN3laQlpz?=
 =?utf-8?B?QXhIRTU0RjlwanlzL25NT0Eydzh6ekhNVFo0MS94elhvbFYvUk9LR3NjbnJG?=
 =?utf-8?B?MnE0MXVKSE44aGlwNDJDUzdxSW5XWkRwS2t5VDNrZGFjZjdQRVFjQURHMTRq?=
 =?utf-8?B?OW5NM1dmTGVIMXFvV3dwb2RVd2l6OXRmYnVjNlhlcytKZ3d6YW1mOFNra1Rt?=
 =?utf-8?B?Z2YxUHF1cEtES3ptWFhBL1cwUWZHbXc0T05GcGo2R2Q3MDJIWWt4b3pwc2la?=
 =?utf-8?B?aFQ3RGovR0hldVEyK3dZOExpWUVLNkp0ZCtYcU9YbVFVUWFjRWR5eURwZkQz?=
 =?utf-8?B?OFptck4zU0E4a0dqWWI5Y2ZqdEtDRHViM29YUmJBajd4NVVLSkhjekZJRkRz?=
 =?utf-8?B?YS84aHlFRytLbTZxTFEzZGExRHlZc3VpTGpNTG5sVlRJOTNOQk4xQWJBSVZM?=
 =?utf-8?B?aEFlQ1FEWWFRVThsTlhzNmRyclIzeFBDdFk3Q1UwL3V2QW80NjFhMXVWZGVy?=
 =?utf-8?B?cGZtdTc5NHlRczNyY1ZXbUdmakpFT1lXMWNWRkpjRnR0akgzS1ZiOWw0VVNC?=
 =?utf-8?Q?GjwIRQ1vRdNCtlUv9ZjKPktC+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c69f62-0168-4b33-6fac-08dbec186a7f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 11:36:21.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdDg6FbMU+uolnHVGr3mnOj53UTefRuurlpfWXmyCzUbYKuKFGsLn5oU496RpSI2JrmwGZgsfniy2Om9A/8OCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948

On 23.11.2023 12:30, Nicola Vetrini wrote:
> I guess this one as well should remain as is. Can you confirm?
> 
> void asmlinkage __stdcall cmdline_parse_early(const char *cmdline,
>                                                early_boot_opts_t *ebo)
> 

Indeed, I simply overlooked it.

Jan

