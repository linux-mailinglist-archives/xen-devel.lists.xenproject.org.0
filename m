Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E57F0DFA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 09:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636481.992008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zvb-0008Sa-Sr; Mon, 20 Nov 2023 08:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636481.992008; Mon, 20 Nov 2023 08:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zvb-0008Ql-Ps; Mon, 20 Nov 2023 08:46:47 +0000
Received: by outflank-mailman (input) for mailman id 636481;
 Mon, 20 Nov 2023 08:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r4zvZ-0008Qd-Q1
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 08:46:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 551acbc5-8781-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 09:46:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9817.eurprd04.prod.outlook.com (2603:10a6:10:4f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 08:46:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 08:46:42 +0000
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
X-Inumbo-ID: 551acbc5-8781-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chofDkZWUfa7S63RWTZ48VT1mfdbgD7BNv0jKdKMf2oiqeTOm0okIOgnLylTavTP4LvjVCDV/juO0oGvw6N98JP62ipfLXAuw+VIjRS/hg5nBcQmTkltN3a+euVCOFSS0+bBd2E/7DonTta6ICFi9KlemEza2Ex/iZLTF4pXYx58V9fgrtLW4+vYzMTUFiQOgh5p39XtVBg0HhfUMjSXtiMP44wlboj6BKjVTLoHcrS4MFHfahQE+FtO62YOd5DgWcWEXAN/8hc5x3XkhuI4J5gj3itQroqq5eoNksabuXtF11BKqXe9NKmi/AbqN3utQ5HImWs3B69VY4AAQTbZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmZiVgCJ5wI6eHIUd5gCObiY+6gaTwI1SlTB60c0kqA=;
 b=htZVpEv9SAzcDX8emYMZ+5er5u03T3K78fMAA0npJGVrvfj+x/ExFWZPlfhEq+dfgBvvdQtvEer+pyrcVLYZH1F4824VVMx1l8RpR55F1fzrByChvDOW5vlbUot9itmEDHFyYywJH+pykTS1BWVPsatBGUn5gdlfZBbl9PieEYlANtR4SChSu2f1dib0OHJXWt4dk/DuVtiUYS9zNuEry6ahA2/C4+mhQnQDtkeDdOBoyetPHhi+eWny/Y6mQT6zAi3wh3Z8irT3Kq0Ei0qcs8RX7ldTzcns8y/QCc1P+BDIigFAV2Zs6h/mZQ34dM7YtQbAFap7LGqgKr/pTrkntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmZiVgCJ5wI6eHIUd5gCObiY+6gaTwI1SlTB60c0kqA=;
 b=4SZB6SAnN6fLfeBh2+V8nxK+0bu5RgoJ8xjTQXfWttlszFswpDUJXagrDU0qo7leftt2MVQ6977yjok3sOT29XKhLJMCNPJvi7U95IAuYyMMuCt4GX1DIS/xit+NRLYXJbn+PI84U6xk90qxrtdQygJUq5AK6vEDW52xDrVok2lJDWzarkGDlKpta/PVMca+UXgoqt3AK9xhsr0Ug+7aswbht++J349h2f5A2MMaqNHd8aDv0i6sxrj3GK9THJUJ6ZFfCLXUwlLkrjBNN7u4YOcdxZP0/AOHEtU9fIL6wEZIL3DQka+sRdPRQKbYmDIZDYT9pKi6Sy348ZmOykv/BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b5eec6a-571e-4262-bab2-698a663adac9@suse.com>
Date: Mon, 20 Nov 2023 09:46:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien@xen.org>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <991883873b73e644ccaf8114a80331c0@bugseng.com>
 <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
 <c4ff5ecc8f4e11cae4a8e282d87c4e14@bugseng.com>
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
In-Reply-To: <c4ff5ecc8f4e11cae4a8e282d87c4e14@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9817:EE_
X-MS-Office365-Filtering-Correlation-Id: e6698f77-99c1-471d-ef5b-08dbe9a53835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZSxTscvZ8Qo0+mkVSD09pAQAIMn4SHcyqALmv/Tvfu8YFQC/LU3GBNClMWd6XtegnWicQSRYrvTw1tyF6/Qhh9wMmutAfMcO0sn5iiujvKHFsOHn+ArBsMWnyJ0qmKDWVLt3DLCnyGU9zdeNrDW0PjbAA7i2zHbXS+TKlQAsdUg3gy3CC5BSGp0gkGDz5b/JDX0W4oLokCa/c+uG+9Trsqq/1sckt6+ex+uOSaDsQ4KPxCLRhIGw5G8AZJZCfDpMWRQt25MXEgiot8QfT4o05slrrqdpdaRwmVp5trESydoCNO0EXRPefmv/ArGZOEHa5yJmiPYPLs+N1EWX3tPGNzc5OMpLAqcaT4wjvdKExoi8r+2i6KPDrzz037rnM9aw90hs9GMikj9aqNCkSt3jK7b72oH1ai642sBONTBGK9K1iFd6l9DXOL/hxFSPbwS5BTp7KeGaFxWmUKDe/dRlYAosZGdofDWtS8VLX+rgcqohIPxBqqnxCKhj7l4UE5YkAJ/0YkfFM67dnrA53S9kGxZLZdovP4gLgRoC2voybzRjItb89Fz540CRh4vCEvN6SvsnevVXzr6P+/J/8ACafGi1B1eQ9kpNfo+61C1CHwedonbBU8n3eheDE/+ku7nn5i/dQQvFybbtCt4hCm0zNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(5660300002)(4744005)(7416002)(41300700001)(8936002)(4326008)(8676002)(31686004)(6916009)(316002)(54906003)(66476007)(66556008)(86362001)(26005)(6486002)(478600001)(6512007)(36756003)(53546011)(6506007)(2616005)(83380400001)(66946007)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWQ0UmhMRWV6Z2YyeXB2WkF1UGpLdlUxU0FybzNybnNNZkJEakg3TEEyVmpn?=
 =?utf-8?B?UkNzWDNMNEhNOElPeFhQVjBrcE5raXRFYUt0R282Z3VRZFQyZVZUT3dxWFVP?=
 =?utf-8?B?dG5POWd5a295Vm1KalE4a0FOR2JBOXh6UlRDL2d2c0N0blpvWkpIZmUzQzBX?=
 =?utf-8?B?ODJSZXhzSXJVTm9JblJtNFFFOVFSZ3hSYjNtMmhpTnFXaTFiajhVbUhyRURS?=
 =?utf-8?B?NmUwMmxFZENVMTBjeDFuQ3JGT0VuV0RENndjdFZ4Umd5aHVnV1EzZkYya1VJ?=
 =?utf-8?B?UitYVHJWdnF4WXB1L3JSL1hMUTlMMXV1SU9wanppYklVd2wxbmlGWlZUbXpo?=
 =?utf-8?B?VlNXNkh3dDMwYjFkaVpRRDZ3cFRldHNvVHM0dFp3cHNKR0NoTTNzZkpnaEZv?=
 =?utf-8?B?VDVkeEVlYmxtVm1lWlU1Rm5MTDEvc0lZZExrbFVLb1VVdWsvRjNhYm5uV08x?=
 =?utf-8?B?T1ZUdkJuVktYTWlzRCswbTFYOVZiZEpRaHRaZks1M1JITFVULzJadTk3d0py?=
 =?utf-8?B?UGl4S0FqYitPekV6YlBtZ2lSSGY0VmtlUUtqMVBkQkVYRG0wL2Vpc2tSRVZZ?=
 =?utf-8?B?QVRnVUpERGJzMjBmTnYxNW5MbFdjOHVLQmZFQVBuZzFFaUFSdDdxRkdkMmE2?=
 =?utf-8?B?Uy9JQ0U1YmJ0VkZsNW9nV2RiQUlnTXJudzVwNzV1aVl1Uk56cnlFeEtpOHdz?=
 =?utf-8?B?cm0rYXhuOC9lRU1sYmNFWVdhS2ppeUFKcDFUYVA0dnhhZjJKaHkyM1NHZnRY?=
 =?utf-8?B?ck5DL1BXQ1Z1OTVReXlOSm1lcXBJVSs1U2drVDVEckhWL2IrVDBxYW1nNFBo?=
 =?utf-8?B?RVV4UmpETmdEemVaWmthTERxWmdWdnNvWTZwZldqL0NFRXIyR29MdGJxWmFO?=
 =?utf-8?B?SFZaM2VwT2QzeGdMVEx4VXlldTRvYWRPb0ZORXl0ZGtldTJkV2J1Y0RWZ3pO?=
 =?utf-8?B?bkZ2QmxIUDd6TU9RN3E0Mk9ac1V2cmlxWWZiZWpwZkZmem5vS2tkU2tPOUUw?=
 =?utf-8?B?VDBhK0s5L0ZlYkxrNzhCRzlYT1ZOelZrSmU3dnczQ050L1Q0emJqZmw4ZW5j?=
 =?utf-8?B?NVEvK0tiZmJKOEc3cFpxallnVU04OTZ0QjFvRFhXYjdDTTh6ZHdmeWt0WG9j?=
 =?utf-8?B?RzBPWVQ3dTFrM2lGalRiaE1NNCs2OGMwY3l6dUg5T3hHMlY4QmlHSmU1SUpl?=
 =?utf-8?B?MjJ0WDhkSnh4Q0RDZGVQZ3BadzNOY3laWm9QdGFPaWpTbmhTQXpLMHZteDRB?=
 =?utf-8?B?TDl6M1FCME43akd6M3VLRW5PKzRpTmc2NjFjU3dNeVZ0UU9mZHRMM3NXSFlr?=
 =?utf-8?B?cDR6YVZFSTRDQ2tLclJsdzV3SHJqVjZaYnlyY0RjL201VlZ2cmZXSHBseWZs?=
 =?utf-8?B?VFBVRzhuRGZRY3AxTjJWd2RlUnUyUjRWaTBKNVhnSGZnb3pweHlKY0p5U1ZW?=
 =?utf-8?B?R3B1ZEY0SW9MNEFKa0dyUzh2cWJQR01oNUxZbkx6Q2srOWlqU1ZzRllwTURF?=
 =?utf-8?B?b0pMQ1NzRVI2Nk1ySXIrZUhHSFBydFFoMHNHQUp3aG5jbitvL2lHRWFad0Ju?=
 =?utf-8?B?d2xMY3dka0pmdE91b1psMjdycFV1N3JrT212TXRzQVFCL21qcnBVajhRT0VR?=
 =?utf-8?B?Wk56Q2gzQ24wdG9Ubi9uekJTRURQdlMvL3hubm83bCtoUjVoUkM2Smo3VUVq?=
 =?utf-8?B?Q0pzSmJUUWlHOTRpRlhUWDJCajZOdm1JWlhvQWtqWi9xTGFEbnFzOVNrdUhw?=
 =?utf-8?B?TitmbHprMDBmWUV4cXk3RmdtMDI2MFRHTVZuQjJPeTN4YytHcElCcUh3d1dq?=
 =?utf-8?B?cUNCa3hlYTA1R05Lbis2aE53NDd3a214Q3N1NkVnK1F1R1hNV21KcndhNFhB?=
 =?utf-8?B?eU1vL3cvZW1pa3EzTUdWNHF3UlFYTHVIR1BZRDF6N1A4NTkxYitDREorSWRS?=
 =?utf-8?B?TG9QNXBjcXhTb0NmMXNQY2JDWU9oZWNHMkszNmdmZ0NtM3Jab2gyNVpHVXl0?=
 =?utf-8?B?ZDJmS1VOakpWb2dkMFhIa3Y5UHkwSGxsM3YxT1dpNTVFZXpKZUd5T0YxQ3hs?=
 =?utf-8?B?emxvK2NBa3ZxemQvYkxBcU5PTVVEMW4rUTQyRUw4L2ZRR3A4ekJsL3BmMENy?=
 =?utf-8?Q?7400M6vJGr5pkj7mxbqtkPNeO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6698f77-99c1-471d-ef5b-08dbe9a53835
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 08:46:42.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU26+mg7Qm1PaWXEAVemw/Dus7cbZPT0WkIPkxmZPGol9MGrd6EYvsaWBRNCUrJOVP4+e0PwOMcAQyQcO2BFCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9817

On 20.11.2023 09:39, Nicola Vetrini wrote:
> I do have a folder with all my in-flight patches. Please note that this 
> big backlog has partly been the result of patches being acked, but not 
> committed.

Which in turn is a result of there having been too many patches while the tree
was closed. Yes, there was agreement that Misra work doesn't need to fully stop
during that time, but still I'm entirely with Julien regarding what has been
pushed out having been increasingly confusing / hard to follow.

Jan

