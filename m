Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0317F4179
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638568.995256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jQg-0007SY-QS; Wed, 22 Nov 2023 09:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638568.995256; Wed, 22 Nov 2023 09:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jQg-0007QG-Nj; Wed, 22 Nov 2023 09:21:54 +0000
Received: by outflank-mailman (input) for mailman id 638568;
 Wed, 22 Nov 2023 09:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5jQg-0007QA-4o
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:21:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91f3babc-8918-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 10:21:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 09:21:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:21:47 +0000
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
X-Inumbo-ID: 91f3babc-8918-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVR9Mz9Zqia59Gw14m5So/GXzPEmaIAw+TcIXRkiucNyQdF6nZV+76uSTOGzgYoIRBipMSkVVhvlBv33PmIO9j5ITHhTRJjn9XMYCeO3IuE/Jdy1RFJ/aUZS7dDAbe484jZvP4RlDYqqRGdZIUtkmUlYnO+wZGIiKEM/4S/BLlEgOj2VUPeUD7RmK0RA4s9BBOKBupjw3eMri8tpHRos7BlLwBS6hkV0LnRLTtbnNxshbnL4DjX22BuR2b02JHec4RUXf2DoaXBPy5sdiO7EIEkG1GY+25JtDiYA0kEhr05xZHs/glYLJVrPjehrYr4w0pgWuRkDWpKuIkxqetsa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/Su3ZnaRpQTCP54yq3CJnLHKzPwQ6ku1Y8p1YiTP90=;
 b=fePP3FTuAuS1urvETL75gT0fb2s0UWt1Xgt89DiVVaWYRAfUDdfeAqCXcT2ge7qzINKIsKAcOrFrH/fegMDIPIj14LOWxeUMKdK4CKLyDBoCt2xF+zOsI8/TiFRxKnk6JGqIeW+MXQpZqLWDO54sHlYT7cmtlZIMCna/+6hjitKLG1kTYdhccucCoPjHwzKSnh763hMscZqW8kn9jGtpvlkWh4LvXuX5kBIBW/j9GPfYiX4uOozZXHweHlCLtBtDpgmtKIiV4uWZl4qxFKPvytaiYsTZ/5/KIs4ulFrLr0NwIQHBQ3wxkorNOiTfxVlahsgxkFbu9FFnLKNKQAeLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/Su3ZnaRpQTCP54yq3CJnLHKzPwQ6ku1Y8p1YiTP90=;
 b=YcmtVmtmEI6P5hwIasbuA/FAMlQwyhP60q56yFdZZdWIG1vUNXeLkr283D5Y7VAEM02OXgU86H9uFr25bJfNgLnTq9hbUpg16givKc+uyjRp1t3UQBBNgQb2vPSJHxI9pDwpd+J3Vu+fPpwwGj6Rke9uoFhdCUFN6QI0qlliTUu+pT9NOs8QTpMmchLIMxNsTdIjIqWEw/8oWIqrdFaOyS7EkV4EVZKAfF6Op4IGpC8pqS9ATYQA3umiBJm3MFcOrLZRWRONwTsxyrtJb44IkxaKiQ4u03Oi1IW4yMO5t+u/XiYmOqzlA3eyqCjCrlhApIPnGQT6h1OxqHLGpF4ctA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a00b32eb-002a-4a5e-bc2e-6e9482a17520@suse.com>
Date: Wed, 22 Nov 2023 10:21:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/python: add .gitignore file
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20231122083153.24101-1-jgross@suse.com>
 <20231122083153.24101-3-jgross@suse.com>
 <5471227c-40d9-4b85-b4f6-d0a41c471166@suse.com>
 <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
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
In-Reply-To: <2016455e-6bbf-400a-82c9-05128487c5d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1b9abd-ad15-4084-2737-08dbeb3c735d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOxfivYxGWigwCwZj56E/MP2tpfR64LcVzXfcaP2r7o0mdefw9VzuWtqkj18jIim1pJ0y2nZHWI214L/B4S9btVLYpslRxIx9iHsat5R7CTxd/uX2GAkj1Uy6TeKWT1dN52d6DKgUuej6Z5skyS0u/yebTzmWkz0HKtF4t92Qz+Qrb1ojYQzETtpITEwCy+SPtM/3lXFqZdtZyQdBoow9teqcnWhFf5/46hrtzSM4jGYCLPgvifalRCoG+JngsROfbE1mD0EoxhKbwIShM1Ksnk+rCyN90wrngqT6rxTHul1bfYJDcd3iyPxpFG0rizGP8sTGqXm9VTp/n80b/ugx414+CIijDGA7ctjDFL2/6hXS/FrOyhIMgXLoAA2NGKk3bBc/wII04bDgQ+4ZElx5hUfFKq2NIfomDcGJ6l3Se5Haq+G8ty2ZDowkRn7XZlbS4kdA0abettw3/F4V3M+0qNqVxNQlw7xkyNO2eND/f1ZcpE3Mm0DmlMDNCx2AgUu9Q8sCQFxRrPv4Oct6WF9k3pmhWiPh6YTnee0W+NcUG0YbPvd8eB9WVdnMeUPvQ/vK4533Vn91GGSIVM6TVXZEHIPNkr7djaZSkcU4VwKQg7WM5+DEciNDzWqX474xXJuSXoGXyuBJiBbUluxHS/4QVfTkzlaQvPLxeISaLbD2HBe8JiFe/PCmWVsVShPFJfn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(66556008)(54906003)(66476007)(37006003)(66946007)(6636002)(316002)(8676002)(8936002)(6486002)(4326008)(478600001)(6512007)(2906002)(31686004)(83380400001)(6506007)(53546011)(2616005)(26005)(41300700001)(38100700002)(6862004)(86362001)(31696002)(36756003)(5660300002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk14N1NUVHdkQmFkY3dIUGNCdkY5ajRNU1lVdENxR1BFOHNzQjArNVN3OFJy?=
 =?utf-8?B?TkhFWnc3Si8wUlg4NmpXTTE2MXdjYWx2bDRHY1M2SnFIdG5aWEFLSEhvMkVl?=
 =?utf-8?B?SFlZd0FQbGkvTUw1aXZvNUVEMjVvTEp0emtSRGQ3dGdraDhuZ3I5TWJLWUNU?=
 =?utf-8?B?am1HMUlOZFhJaDhVakEyamdHL0V3OVRSczJ2WFJFSFhQZElqUkQ5TnA0Nm1F?=
 =?utf-8?B?bktBSDB6ZEJrbkFaNjNDV0w2VzZoRnpqTm83ejY5WFpYc1VFKzJsNVZMTFlK?=
 =?utf-8?B?VVdyRHo2YzE1ZEZQdWNIVlBCQzZiNzBWVWhWTGw1bzM0S3lJc004a0FxcDRW?=
 =?utf-8?B?RTErdWVMa0pJeHZ5U2RRZ1g0bjBPSERmb0U4bTVlV0JvcVVid1RsRDZqNFNx?=
 =?utf-8?B?Vzl2SURpS0tYY1I3Q3ZPV280eFdhY25FWEo3MjNUck0rU0NoZm94TXAzUzRz?=
 =?utf-8?B?Nkc2ZWN6clNDOTBLcTB2cU9rQWxrdmlUMElVeCtYZ1RSbW1IQ21wM212MmY1?=
 =?utf-8?B?RnVTZzBEbmJkd0NNc3VEV0x0ZlJhcm8yN0dtRjh0ekJaY2FqM000WWY4YmQw?=
 =?utf-8?B?cjVieTNMNisrR1N0SzRJZ2ZnY2NtbWUxZUU1UmtVOVVPbE53U01MU1FQOUxN?=
 =?utf-8?B?d1pFTVVqeFlaUFpleGNFRE9FeTRyN25rL0VEb3R5YWZsQlBqV3NUMHdhSEVk?=
 =?utf-8?B?NFpBZHNHcndiaVRCazZEbDZGRFNQVHJWa0xjZU5TVUdSUkZSTWZpd0trbjBU?=
 =?utf-8?B?VXA1SmRDcHlNUGlvd0VTaTZqb2p6UXJnOEw4dWZMSmkyVENJUjdRZ3lqcXFj?=
 =?utf-8?B?NGorbUl0M1hqODduOGJ3NHlNelZ5NENBUGtUbWx3TlFTaGJRaEJ1MWwxemo1?=
 =?utf-8?B?VVl3WkZBOWRVRkZuV2t0K2JDZCsrM1k4NGNJKzczK1NTTklhNkdDV1RrL3dr?=
 =?utf-8?B?MzRaYWlxVnR0ZHVJRGhaU05CZitqVm1mdEFmbWc2ZHpCdjl0RUhSVnJCRVpD?=
 =?utf-8?B?NHBFUFRGMnhua0NpV1g1WGdjYmRDSjFLcUFHLzRmT2Y0bHhPaGpidFN2UVBR?=
 =?utf-8?B?U1U3RDZVSWJnVDNVMG0zd0xJazVrdkRzNmZlclhkSUtSNm1kYUdUajNzZ2Nt?=
 =?utf-8?B?QlRVTzloU09sNkhCdGFiV0dtQ0NObFU0c1dvQUN3YWk2L0RsMitheUlobWFN?=
 =?utf-8?B?WFBnaWhOalJaMXJ2bWU1TWpJazRLVHlxd2dHSGtjZ1h1VmtKQkRkVUxiV1hi?=
 =?utf-8?B?dENlZDc1ajRJUHl1U1ZMTFdCR0NZcENxblZybzR1SUZFM0Q5YzdQUnNaRG4w?=
 =?utf-8?B?VkhvTGhZaUpWeXBvSEo0U3lVeEt5TEdQNEFLZjUxeTRFdFZITFJ5cnk5ckVY?=
 =?utf-8?B?MnFaNnRmMG9weFdyTVZ0VEh5dG9JMEY1ZVlZb2YvZFJpbm9EbENuTXM1bjFJ?=
 =?utf-8?B?WG9RSmRHajJYN1MwZGJNNGs0aHMrbE9hUEVnTjR4c1E2cTVkeDdPZCtwN0RV?=
 =?utf-8?B?eHJZcWdESGYxUnpZZHFPdFl4ZmtNVTF1VStEN2RjcWhreVpZR1pjSG12ZjMv?=
 =?utf-8?B?QVdCNkJveTF5bzJOUmdmMVBKSjlWNEE3anVwZ3NtRkhQQ01lakZGV0UxTk9q?=
 =?utf-8?B?dHVVaWpURDJ3b2Q1L0tsUHRQKzRjRzlDUUc2amtacCtHS2tubXhaT0pzQmZF?=
 =?utf-8?B?ZFlkd2F3VkVCNW9SSURSdTZtekRIaVR5YlcyOWVVamVvK2s0dCs3a080Mk4w?=
 =?utf-8?B?Q0xzcnh1RVJtcUFjdTNhVnNMT2cxcE1SczBKblE4WjRsVEpaektvOFlOT3cr?=
 =?utf-8?B?T1Z1NVZWVldDZWFOeXVVSVlYZ0s1SWREZXZod2RUQ2hFWGgrYjM4QmhkVTN5?=
 =?utf-8?B?aGYzUmY5ZmRzNDN2S0N6SUZDR2FIa0lBTmlGZGhvbTFaQkFxNm1zTWtmWTVx?=
 =?utf-8?B?ZGNGV25YU1NBRlUyaWR6cUdsSzFpempJWFdJN1VydzhjUGZSYVB6WFl4b0Ew?=
 =?utf-8?B?VGFQZWI1UUlJYlJmV3RsVjQ3WEFTdVRPcFpIdjJsMmtDcW45VVVlRVh1WVdV?=
 =?utf-8?B?TjlGM3Z1NTFjY1FaK0h0MXlvOVl5UEtZNEtSVjFUL09SSUZKT1hDZUp3UjR6?=
 =?utf-8?Q?gAcBG3s/2LrOY4dYkN4gVwRgx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1b9abd-ad15-4084-2737-08dbeb3c735d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:21:47.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8101z40PjFnkPc9Nv2QohzxDwoxCMTH3fDUuSnEYgzQzDLwerW0Y1ABaadW4dtpt0CNFSY2rwR+BnUZEE8cNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767

On 22.11.2023 09:57, Juergen Gross wrote:
> On 22.11.23 09:39, Jan Beulich wrote:
>> On 22.11.2023 09:31, Juergen Gross wrote:
>>> --- /dev/null
>>> +++ b/tools/python/.gitignore
>>> @@ -0,0 +1,4 @@
>>> +build/*
>>
>> Are this and just build/ actually equivalent? Looking at our top-level
>> .gitignore, I see e.g. extras/ and install/*, which I would expect want
>> both treating the same? The form with a wildcard, to me at least,
>> doesn't obviously include the directory itself ...
> 
> The .gitignore specification [1] suggests that we should use build/ (same for
> the new entry), as otherwise entries in subdirectories would not match.

The description there of what a trailing slash means isn't really clear.
Nothing is said about anything underneath the specified directory. Also
nothing is said about what a trailing /* means towards the named directory.

What _is_ said is that all the new entries here should start with a slash,
to avoid matching similarly named subdirectories further into tools/python/.
Unless I misunderstand the intention of this .gitignore entry and the goal
is to match anywhere in the subtree.

Jan

