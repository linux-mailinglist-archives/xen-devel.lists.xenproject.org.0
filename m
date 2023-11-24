Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60297F6D26
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 08:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640190.998086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Qud-0000tw-5U; Fri, 24 Nov 2023 07:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640190.998086; Fri, 24 Nov 2023 07:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Qud-0000rg-2e; Fri, 24 Nov 2023 07:47:43 +0000
Received: by outflank-mailman (input) for mailman id 640190;
 Fri, 24 Nov 2023 07:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Qub-0000rX-CM
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 07:47:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id babeba7c-8a9d-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 08:47:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9302.eurprd04.prod.outlook.com (2603:10a6:102:2b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 07:47:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 07:47:32 +0000
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
X-Inumbo-ID: babeba7c-8a9d-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVV8U1rR7WCziZk6Ekr91BGz8fAEPpN/de5iFMjHPcMvr8D07V3cbYA1z0ObtB/bDNxZ4vJEIdon2wWHV5ZbL+jOt9SKssk1X5gFtMp9hy2khV0zD7PhI+OdC8o834bfKPSuDmPwlZ4B1547XBSmPUJjnWyAtiXMVciBKyIMyMEM3dLXKMiKeLccuFe3u+CC5MQGtCTsK6RReSRkM6zL8aF8T0ZNtOef5th62JiceubeHp+6cuiWQKHlDiTjmKjnuDGZLdx4VPoxV4rjdDyZtfeB51BEpGmVXY2m/KF+RejG+BIMF9RIZ6QbD4ZEbkAU0CsBEqGLWP9U991HLxmIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UY4t4xZSm7NT8OJL5t3IH/5GZ/aNPDqG0bik99MIuQ=;
 b=kQKOkZ2ZVgoVj5upM29Oz6iybHWffUbzJqb52kfymBdZdnWy5BKIbx66eKIj6u7+TAM+Jezzb4wA6k/AhDIdhtDRpfq2raj3LU5LLxzTwnOHGM3gOpjT3fJ3lmWuhwA1sM8SYfN1etnuAOrev5uYSeB2MHwox1NjsKXljbhxU6LOnULWQgoXWb9+5D0tD6ASTGAYzjFqSyZkcefjjvHaDj19eUDlUT66tTpCrDP2tzCBMSmLBFwjzgbTJ+n1/pwTNUY4sgh+MHXXdfmKcJzrrrVYXKBnI+/7tbwRIqBkl1exxXvgkRBupc/NzuDRTZD51sgT4N4EbQEkAAZrIiop2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UY4t4xZSm7NT8OJL5t3IH/5GZ/aNPDqG0bik99MIuQ=;
 b=MsEWA77mJFU/iwLnByis0UCjNqDVTO/zQO7PfVT7A/6OLuBQf+1Ha0WIhlvVQjMzuKW5l2fZ0T9lrdlT+KYiKvUGEHP4asqvWNanFLebvOpbqXBQf1pTl/jVDNBwAo4QCcE9KWackiB3+MmKBPq9pYB/ucSt0pW1yDE56AtUiFvu6bVamoM/cQQwAIzBteSWpVQQqNT39Q+b6/VNYR1b+pEkNe+CJTWVprdPKLoaxjnI5CHeWP2KRaRngcD7OQwDF48Hj8hMcLfiQid75URYksrSgvhL8dV/z1dVZpEdBfjW48k13IvGBXHjeQRWLWSmSkr2RVQPbSoA70JxRt34rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a74e8ef3-acc0-48c5-9c0f-e3a617d5ec89@suse.com>
Date: Fri, 24 Nov 2023 08:47:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <8b84bea9a52d9ae60fc355855bcb046ac5f24686.1700740128.git.federico.serafini@bugseng.com>
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
In-Reply-To: <8b84bea9a52d9ae60fc355855bcb046ac5f24686.1700740128.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 555ddb50-14a7-47cd-21eb-08dbecc19d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MUVojCdfj/j9W0NzPBcksGF1e+mwedZ/T7c4NWD8eP06ViwAfHa0565KjRv+jQyk50j1R+7CKBLMf/U86BRPReDkLK8I6PVCpHPKe19neNdRsMk3PaJDWdAzF1qrSvrkkd2FHFqLNpo7GzwDAJEixH10bNNpE/4v0vKY2rC3mfTTpEE+LnHccQ565q2kBCecBWqaycXZrKp40krukpYJHrhYkzzAuTD2iayYm/A9PPNCU/31X9BelSXS6HIfMZUV3ZW441rTQwO8HqTFaR9bnZqe1/XEYkEKoucv0giXiWSwyfPNKomU+zTMA7nT4ADSESEZo6JS2Eh9e6e1mbUYy4Yq7WIp61RpgHPjCWWnm3ddoiHLLFB7Pz4Indo82THCyJKaW21AmzZHZ9usZSDIlNZjJQLpHMSW9gfyuiF09iM9PzbVaIuU77v0qYRuYLEdwisBBYnszFe3OBS6blk2hwHc1tJcoGvu4+Pp3JaneJ5zMIKmBK4fBtl8r8IF11NgREXZGcBcMjMXGgTYxbodX+atfNtSEXEw+YRcNOMlGSFfRm4IkCKKcJnqUy3dZYzJbYMbzFtsWtiKF5sRA7dXmS6OF1IXYYbuqtsYUgathwDl4S715JRvhuUGM40eJD54Yu7yfqzJg/XGyAkOcvsJOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(6506007)(53546011)(2616005)(6512007)(6486002)(5660300002)(41300700001)(2906002)(478600001)(4326008)(316002)(8936002)(8676002)(6916009)(54906003)(66556008)(66476007)(66946007)(86362001)(31696002)(558084003)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHJKYWJlVlNNQkEwSmYzbDNmNHN0bHB4U2x6R3dSVEJONldkbmZKR3VCb25t?=
 =?utf-8?B?cnFEZ1lRUXk0VmgyOVZuZWJDM0gzTUs0bnYyMHhaZzkzOEdHQ1RKcnovRDM0?=
 =?utf-8?B?cUFNUHU2eE1sUllPUXVDSC92ZThhZC9hMys3S3FXTGIzbnNpZHBQVEJSUitF?=
 =?utf-8?B?QmZXci9Ia3JrZjhZWmJkeVIvQmhsbU9WVEVZTm9PSmZXR3FySnlMUFpHSHlo?=
 =?utf-8?B?YngrZkZuOHM1UXAxbTdkWnVPUTd2QktCcUlnNVUrL09xYXhMNXlSRnVaaEhi?=
 =?utf-8?B?RG9qT3h4dnp1eWd0N0V1cUIvakYrNm9GcTN2SFhRQlczTmJhLzlNQW9GZ25t?=
 =?utf-8?B?Z3pRcTJaeEprTGptZ2YwT2NIZEtXb0lRSlUxanVsQURoQ0JOeGJLNDhkVVJa?=
 =?utf-8?B?L1R6d0hOYmxZdHZPR0xPQjZ2NDl3cHNnUmIzaXgrdGNqQWliWVowSEw0RDhi?=
 =?utf-8?B?WUkvVjdwREgreHVWRjBCQkZTWXk1K1NFM2Zqd2xJbjZhYVNKam4vb2tVN1Fy?=
 =?utf-8?B?ajdobXY0V2ZxTVJmVmR0NFlHS0xVdm12bGkrdnNhRzdKOTBXUDBWdjV6a25m?=
 =?utf-8?B?Z2dZcEtobjRWQjVLZk9YekZ2WFdIU29mVEdQazRnRkJ2SXNJSFVNS21meC83?=
 =?utf-8?B?d0N2SzJOdGxvbTNNR3R5Qk1NVXhsM1plUlUxVGFsVHZQTHVhMzBFNzVkOWlo?=
 =?utf-8?B?dWxiL29XR1JlZ25OVE9RTHJRTWt2ZGNMajBTeDcyVERRbGdtbzFhaUpBN2hP?=
 =?utf-8?B?VVBRV2RpY1JXVHR2QnBPWWhaWGNiZHhubDR3ZGVxVlFyc0QyenYyRGlxUG0z?=
 =?utf-8?B?c2x4TWlUMmh4eVgvMkhNQ2VzWjlzTXNkZW5UQnlYVEFPZlMwMHRBdCs0K2xn?=
 =?utf-8?B?NFcyRG5BRWZCb3pUUndPMWxYZ2hRdHJlY1pKalUvYmVNSFU0d2x3Y2NvcDJv?=
 =?utf-8?B?RkwyZ0I5L2w2alZLSTlsQTFIbVg1Y1lKR0Z5Q1VCVmJyMkdMaVpWcHNMdkhr?=
 =?utf-8?B?Q0RGaVBnZWdqeDNiMmtDRnU0eUxHY1RQN3BTd3l3cnZyR0ZTa1MxaGhPRFZT?=
 =?utf-8?B?VXZtUlFuNEJ2NVJQNWZtR2RLN0tmWUt3cU1pVysySnBDYktIZk8ySWFEWk9s?=
 =?utf-8?B?VitnSHltNzg4ZFJ6REZGK0NFT0laTEJSdlRTNzNUTmQ0Wmg1b2Nlc1Foaytk?=
 =?utf-8?B?djFWZk9qL1lFSndzaE5CdXNPcDhtOXhYYkNKRW45cFVxa1htNmhMOWQzMm9z?=
 =?utf-8?B?S05HdG56S0t5N3p5Vm52cmZyS3Y2UWZxaVorQ1FXY0lIUjlTWjBDcDdYT2ZL?=
 =?utf-8?B?dWJ5Mk1nTGh0enNlK3g2Y2JubkFUUjYxR0E2T2QzS2RBU2RYbHRZbXplbms5?=
 =?utf-8?B?TXhsclVEdU5MZVFNYXJwMk5Ua0dsWFFrNUhnc1ZzV2JzNDlTOWtWTWJoNHZM?=
 =?utf-8?B?UGM5b2puOUNkNzdLNW43K2NMbVJ1SzhGZEdPUTArbHBqZlFWblltUFlaL1ZQ?=
 =?utf-8?B?UmlmbGR0TWMzZHJlS3ZYQmIwOWxIaTl3VjJHWFZPRDBaczJPbGNqYXN0eEhM?=
 =?utf-8?B?NURlY01yYjN2TzZkQ2k2NWwzTUl4dlRqUDVvUlFtbk1TdDVON1F1WW1ZMmda?=
 =?utf-8?B?UWNiMk5hZk9adklVZGhRUzNMRkhXQms3alh2eGJIWWEwdndaa2FsZnJ2cHkv?=
 =?utf-8?B?cGxmYjFkZ1BCWUxuUDhYaVhrbDJJYVU0WTVFd2MzR2tORDhlcS91R2JlOEZ5?=
 =?utf-8?B?d1RUNzY5QnEvNDBOR2N6SUlkK0lma3gzUWZWcFNpZktKR21FZ3llS1FCN3Y0?=
 =?utf-8?B?V3BtM1hkSGZhSFRwVGVGbmx0eTAveW9FVUcvSTBJd0Y4UHR4aHhzaGx6V3FD?=
 =?utf-8?B?U0JJb1F6bmVmZm1CaU5DSmJMRHdQall3RVljZVlqUnZWbEc3eDIzTFE3T0N3?=
 =?utf-8?B?L3MzUWU1YjdwMjN5SW84V1JKSU5XeFRuK0xxNVYwdXVRMW1FNFVjYkg2bmEr?=
 =?utf-8?B?elRxdXp6ZUNERG95UUlKOTFPK2lKT0FDVFZibmc0YUNXbzlnTDUrajRraS8r?=
 =?utf-8?B?Tkxtc1BJNkZJU1E5ZnVkdURCRjRLNGVnTEZSN0ViVGJCUTVEd1ROajdsb3Vm?=
 =?utf-8?Q?p86+Aoryu7MvCHDeQ4El2lfab?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555ddb50-14a7-47cd-21eb-08dbecc19d7f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 07:47:31.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cu0KOIa9g29XBsnmQo9+pOak3KXN9yWhwy9tvTO+d1pqJ/Ip+xkiq7hUu/e6ZVWaVsRum8m+UDQzt1fFh9Cf6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9302

On 23.11.2023 13:39, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



