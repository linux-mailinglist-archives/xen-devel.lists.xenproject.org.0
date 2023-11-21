Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7B7F2FCE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 14:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637851.993884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5RAg-0006rq-Jt; Tue, 21 Nov 2023 13:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637851.993884; Tue, 21 Nov 2023 13:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5RAg-0006p1-Gz; Tue, 21 Nov 2023 13:52:10 +0000
Received: by outflank-mailman (input) for mailman id 637851;
 Tue, 21 Nov 2023 13:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5RAe-0006ov-OL
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 13:52:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2838f1f9-8875-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 14:52:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 13:52:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 13:52:03 +0000
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
X-Inumbo-ID: 2838f1f9-8875-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EprfpCcc/fX3rp+nEuxrqR79kAW460ykmatKS5N7k2A77QhH66mBA3Fptc/JL9WDacqvi32w8kMY3E/yx1UTXOEjcuO98lqlpLUYneMsnE1UUrZ3rhzR0fOgKnDJX/rYeMEmdHAil9jOx/WDjGl3tUmYzUEtHYql+2AhKgL7jAe3S8wNfMTru/FjF48RlOFcpCQYnFiX+1cv+BAlT5DWNSW3q5AJnq/f2X9hbevQBLivi+t7ruxs5ArOOXUXYxF7ItuOpFtLVg9MJYt9PpCPxqFOO4fV6q47CdfQwrkxgc4gWK3Q99KUV+8xlods8XfAptP513DI3dct8qF7Qeyl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5F5YCi1yVZWlpas+ceLImFf3IaH4ucz+ZF73lPmOuXw=;
 b=LwMx5fFD55/mNahyGhgtzzV4nnGt72rvA8zZh+Zn12eyOqvU9x1BIEqiQw+oajdO//ul5iHpxFTdCEZXdMQTp6vtndWdYUsZvYHNxTBEwvPbCKP6rgJbvGUo5KcxQ1WLRqEESoEdpjNumNwGlzUHyTPVWfVidvKkpTkmQRg6qiRoxGvCf3usm0D2ejFJgboeMnCfSsZ6fRILL9HFx+bekCqXiLjEU/otjZ8BvZuxpUzDGKVYL/1LeO9BhE9b1+udm7LsmmI/tF8mtw6enrHBPvCfAYtAGCXI3SCtn5OdoIrrwYLxUyl90w0xENznGDOOaLbYzQoULA6lI0ir/Xu0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F5YCi1yVZWlpas+ceLImFf3IaH4ucz+ZF73lPmOuXw=;
 b=Sr79KG4H8zQARFHQJGCX1Htr3D7aCPHWOMDnG/NBy10rerK1Q4W/xNNBErSjZSBORbWrTQUK6Dp9Em8eNmbQ752YszugKtMipCgy5wFwZ7x1VI5xQ9/mtSaFhLHlGpHTl2/zpfqmmxxyQrd2Rx1huTF9N6p0iyhMgZX4TG9Zve6ChAQ+zODqIYq5vcFT+P9v+OnuzPjdMXU0yvbUJjI7YEYyriTH3divg0GVwmHupabCTUeOBjYiRgaf2iuyyqC8AiKq5mGMw2VdgRlC02CRUfDzpxsLBuVDnElrxr1iKMGF8Csp0HCVx0n/UHqLg6WOAHzIyK3Q0/GTJq9/LGybhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5bfc0d7-148e-4d49-85a0-e23387635daf@suse.com>
Date: Tue, 21 Nov 2023 14:52:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] xen/vsprintf: replace backwards jump with loop
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <9fbc2bcfa1ee019a8ac1cd1a3d29c38b59b8edff.1699295113.git.nicola.vetrini@bugseng.com>
 <8d9c85db-5afd-4299-8f05-e74628c1f67b@citrix.com>
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
In-Reply-To: <8d9c85db-5afd-4299-8f05-e74628c1f67b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: afbf37a2-7bf6-4aca-4ac1-08dbea990ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bOgr62wsyv6BTAqSnWDE3s0TCgudUPxUQOlW5eRajhqhH4uqL3si6haK6aed5Ek5/mGzj/NdUHQDEhA6JtgwZntrQksheZi7/DDgGPd8NAMXvjDjkWkIkwia7L/icRAQRCT4pPWzfXpsZfyzQhf1LUXKfLtTH7aKDw7psWz9euZAaYH0WW67cTU3IWvqjY34Mt8uOtUW4okX8l2wUqL2KWJGktGIgIKutz8MjuakSDFHolH7bOPgcX27PQ5mZfz83T8yd8jfEP7iMqYIOIUEhk+Uv2Kpi6qPKwR4yhB5r+G1OEfrkobiLoq9yxgQ5YTd/NNBm+bFQ9DhOUPU889KrLRcDOD2kCEORhgupNTWxoVEdm87PAjLVl8+8a9wiSAPXiA+5QMSLBo5+Q23puhm74kOI3n/cEKiVjWzZ8cqrvlUD8vBD3Ytn/1jmKEvMLwymafCyIlUVtxB8cVrlYIzl3AZSQBbtDyjorllutx0kTS7HyPW1WN4sh2ge2oKfYBW4GdJpeo+wThYz5cw21PIcb0rJVAaNAK1ibR/I/dzEt6HgE+zCFohZLNjSTgzQb2JB5YuMyXdiuJ+iBieGEXve9qBD5cbM4jV+4uGQxNiwr71l4AC7+vNc0lYHzpnVWZ922EI8RY6Snefdb+8WIccmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(5660300002)(7416002)(41300700001)(4326008)(8936002)(8676002)(31686004)(316002)(54906003)(66476007)(66556008)(110136005)(53546011)(86362001)(478600001)(26005)(6486002)(6512007)(36756003)(6506007)(2616005)(66946007)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXV1SHNabWlPTFRDYWZSTTVoSXhUeWExcW5aR1llM0VOWG53SitDVGYwNjVE?=
 =?utf-8?B?THlzaGpQZGN2bEZXNWNJcTRvWkJ3RElRQ0IxaldHb3ZFQ09pRmNFQUtqUm5F?=
 =?utf-8?B?RDRxM21mOFBQQjNaQ0lRRFNHUXJxMENFSFNsUzdMRCtGZmxEZFNYMXBkM0JD?=
 =?utf-8?B?MUJlb0EyeHpsSjBWSWFoMTdONDUwTEp3WC9WMVNCTDBvQmxpTUlvUHlPYVVN?=
 =?utf-8?B?MlhqaFp4cE4yWlVCM05rSndETE5PUHNYRFVnVlE4b2Y4ZVZqZ292TlQ2Z0Vs?=
 =?utf-8?B?aU15ZVVIYkhHem5yZFBNVDVnbFZFS0FoU1JnT0xyUUNCQW1sSGNnTjVuVVVm?=
 =?utf-8?B?TzFMWDJXTnBudFltVFFmM3RoK0NOeXNOTWx1MXlOSjhwR0haN1djenFCTElH?=
 =?utf-8?B?M001YXp5VWVqZ3JWNGlhZjFsamtDTWFmRjFrdmVXckZ5T2hFa3dveFdHT0Mv?=
 =?utf-8?B?Wk1SUnR3WkhOMkxFbzBZK1EydkFJNUlEc29oeVZQMERHa2Npd09ZMjFaZDVh?=
 =?utf-8?B?MWYvVUd5YWFZT0g1UkR3L3N6bndGVXZUYTN5SnkyYVBBbklsZ3VtTnJJU1dS?=
 =?utf-8?B?UnREUzhVS210dllSZXZpU3JTY2tLZk9HTWpHWkkrM0U0OUhONlVYUUdHM3E4?=
 =?utf-8?B?eDdVTEd3aTlzNytjYzlHWEl2NnE5THZVbnpibDIxQm9nUHpBQ09XeElzTnc1?=
 =?utf-8?B?REIydG9ScGxvMjlqY0hraWE2OW56THhBdCsyUzFRekNGdytwTXhXTU9UeEg5?=
 =?utf-8?B?eW5RNFV6VkVVWHhXR0dTdm9rbXB0UFRBOXZpZUVuTWg3YWFyVmtRYWEvQ1U4?=
 =?utf-8?B?TGtnUzQxM1JzZHpqWTlLZzRiZ215a0U4allDUjdyYTJybTdoYkJta3Rudkpp?=
 =?utf-8?B?UzIxelFFWklhRkpQMzE0Zmh1Wkh5MlQ1V0NOcE54UGxkT2pmYUJJMUhqYWlj?=
 =?utf-8?B?REc0alV5OHQxZjVqamZqM2R3YXFsdGxhdGlidnlTVGEzbW11eFZPd0lLaFZS?=
 =?utf-8?B?bDJqS0pKSDZaTXdMODFnNEgwcHZrL3NqMTFwTmd0MElrV1FneE5JNTc2RkRE?=
 =?utf-8?B?c01oMCtTdUpQWENiT0NSSHdGQ1U3Vmx6TlRFK25McU5jQmF1STY4Q09va1Nz?=
 =?utf-8?B?ZGV3eUVZYWtlRkpuVUUvcndlakwyUENPSjQxNHo3amFWaFNsNkdraDlrMEFo?=
 =?utf-8?B?SHVaR1pPd2dBTjlJYlhtaHlFSksrdTEvYVY4N3lkRFRsdUk5d0R5Vm9QVzl6?=
 =?utf-8?B?Nm5ZZldiVU15Q1Z3NjRWYlE2SitsWHdEa05mUWxyTmxaamtkaDk0ZzMzWXFw?=
 =?utf-8?B?U0VuU3g1MURRK2hyQjRPTjQ4SUFXbGpLWVpUdmVsOGtOYUh6SkVGdk5NM3hi?=
 =?utf-8?B?L21EUWNYQjhjK2FnaFRFQ3B5Ty9RQTg5ditNMEtaMTE0R3NHMTcyMnpLQ3dE?=
 =?utf-8?B?KzVXRkpuaC95RFdEU0NDb0JJZTB0TzVWMmdBaVJJZ3ZVdkc5bHlCTkR0QkRO?=
 =?utf-8?B?b0R6a0d1OG5FZ1o0RkdGVzlSQjlnRG5qN1lLenV5MFFuSzFVVGVrdUJiUGJX?=
 =?utf-8?B?TzVyVjFYR3ZrbTZ4bWM4YkVNcGhTQnBDRm1XVUpMWnJreFdQcHAvTGczbDNr?=
 =?utf-8?B?U3hmejhncWFkWGVqM2xFWm9Qa0MvdEJTK0tBUmQzbGRkOHRTVnB2Y05HU2VD?=
 =?utf-8?B?WHFQYkpWaWs4a1VqQW1YQkJ1KzMvdU13YUlkMVRhWjVFWVMxb1ZwQ01Ralo0?=
 =?utf-8?B?VUR0MkZQYmRLQ1FHa2NxeFkxRnNCRUhDNFZTRUI5QnFmUUhYY0dSbVhKZ1RL?=
 =?utf-8?B?ekxSNTdIMkM0N0JuT3c3bFkrbElyWXlwR3FEMzBNVGhLeDd6WE9GT3RQZzBQ?=
 =?utf-8?B?ZXM4VitEUndOSVRFeGxnR2tnUXpWUWZhWnNEenYxc2Vxc2tmcE9LaWRidlFK?=
 =?utf-8?B?NUtXVWgyVmFQTFVDbzRBRHBoOE5VQUNMWGRuQzRNQUZRcTc3REJMT0NpVkRM?=
 =?utf-8?B?MnB4citDQkVUcGw2UmV3YzdML0lwMU9zUk5XNTZ4dGRpQjdBeFV4T25IZUwz?=
 =?utf-8?B?WGVvUCt6eFBDYlZxZUlCRXNjb2xZSDdwV1NqQjBIZGZmYXpBQ3hSMVp0Unlo?=
 =?utf-8?Q?tA0mEL3FMPsRazFYBu2U3+G5G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbf37a2-7bf6-4aca-4ac1-08dbea990ac8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 13:52:03.6631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndxIOHvoL4B387PmIw+JliPiUPq3IAuMbE0XDQyLkKa1LgtT5pQEvck4CjR1CGBPlraJuEHhjWXoe6/rIPLMnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

On 07.11.2023 12:36, Andrew Cooper wrote:
> On 07/11/2023 10:33 am, Nicola Vetrini wrote:
>> The backwards goto in the vsnprintf function can be replaced
>> with a loop, thereby fixing a violation of MISRA C:2012 Rule 15.2.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/common/vsprintf.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
>> index c49631c0a4d8..603bae44177a 100644
>> --- a/xen/common/vsprintf.c
>> +++ b/xen/common/vsprintf.c
>> @@ -495,6 +495,8 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
>>      }
>>  
>>      for (; *fmt ; ++fmt) {
>> +        bool repeat = true;
>> +
>>          if (*fmt != '%') {
>>              if (str < end)
>>                  *str = *fmt;
>> @@ -504,14 +506,16 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
>>  
>>          /* process flags */
>>          flags = 0;
>> -    repeat:
>> -        ++fmt;          /* this also skips first '%' */
>> -        switch (*fmt) {
>> -        case '-': flags |= LEFT; goto repeat;
>> -        case '+': flags |= PLUS; goto repeat;
>> -        case ' ': flags |= SPACE; goto repeat;
>> -        case '#': flags |= SPECIAL; goto repeat;
>> -        case '0': flags |= ZEROPAD; goto repeat;
>> +        while ( repeat ) {
>> +            ++fmt;          /* this also skips the first '%' */
>> +            switch (*fmt) {
>> +            case '-': flags |= LEFT; break;
>> +            case '+': flags |= PLUS; break;
>> +            case ' ': flags |= SPACE; break;
>> +            case '#': flags |= SPECIAL; break;
>> +            case '0': flags |= ZEROPAD; break;
>> +            default: repeat = false; break;
>> +            }
> 
> I'm firmly against this change.  It takes a simple and clear piece of
> code and replaces it with something harder to follow because you have to
> look elsewhere to figure how the variable works.

While I don't really like that change either, I also don't like uses of
goto (at some point we said using it for error handling is okay, but
the case here is clearly not in that category). So at least for
consideration, how about getting away without a new variable:

        for ( ; ; )
        {
            ++fmt;          /* this also skips the first '%' */
            switch ( *fmt )
            {
            case '-': flags |= LEFT; continue;
            case '+': flags |= PLUS; continue;
            case ' ': flags |= SPACE; continue;
            case '#': flags |= SPECIAL; continue;
            case '0': flags |= ZEROPAD; continue;
            }
            break;
        }

Jan

