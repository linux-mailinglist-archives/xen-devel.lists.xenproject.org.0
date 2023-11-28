Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60007FC040
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643386.1003561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81po-0007WD-3K; Tue, 28 Nov 2023 17:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643386.1003561; Tue, 28 Nov 2023 17:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81po-0007Th-0D; Tue, 28 Nov 2023 17:25:20 +0000
Received: by outflank-mailman (input) for mailman id 643386;
 Tue, 28 Nov 2023 17:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r81pm-000731-Se
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:25:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190fc642-8e13-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 18:25:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 17:25:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 17:25:15 +0000
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
X-Inumbo-ID: 190fc642-8e13-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0ZTuS654kR4yYufjffTKS8WXIPV/kDInL8cKI/8nc3rxrO+3f8zCnZyvoC5K4bkbVfe8q2oJBw6deCZbjtVTq3bRV1ZLdg2qIx4eXFPX4IPlFt1v/YSkLqJM1pjiZBUbbaKV22kjB9hNR2o96+FRltWUkH0B64Mw8uuH2QMac1C7iyzuBtXc5TcnlSf1hvGiGixmoHOJRFg3zncvky7GO0RlDyM3aD6EqVOO5Lks+SxXRRCFeocFKybD+IrQxSwrK15M1ejrJKATdUokxyqi/9yCf3FqSpLQyXVMc30soMoUxMg+kdGvUKLcdVHBDj+welnAXJDncqf9PiRGmNLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=ljw9OUxBGbROejrSOjeyJln8B/rZ7CWsZ+VrkMROG3FlfSqpfXBl3q3Ws3C2z6JbEKhuZYBDdAnz52iYiUzg5vo255WmoWYE+AFMgybmBXzqSyXGONMkODRYP66W4DtMvXWAI7t88MMyBKwu8Cm/AaxCheg7eLA/JCfg/YVCIB3FQEeCPjl0H1so1y4zcbwI7Io1EacbZvYhtRvdagF60ZP0HZ7JTOq7/WN5xvwCGSKt+6TJJ3bu+9j1gMy1JeoPPhfRrTQx4zYM5br8RtbgwJM4uT2pidGAfOTZTdDZ3hcr3aRyvKsHkdKQWb+ObUEGBydqisKLDW+2b4lqF1lw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=pl3Vaau0QZwp0IGKiEwoHtREO653zYHauZnr+7xFT5PLeuuyvVB1gp5TyE/PekIJbmc/zWGB0saKkPBuxkCwXR82xXGByLhmQOnU07mWkvIgwSh276fTgIpKRcmg0SkL/K9KD13zAhAwkAwrbGy5ftsGiK9mLOoptZVgZ5slqpObkeKID4hSrNJ4aBn5jXBMT5uOsBcy6sq+cMWMbTPbJbgKl5TnUmlmYJ5/Hs4/VpXl+h7WTXnNZqoP42pgB2Nk+UCeG2hx3OEknveyd/fhpz1xK6jGuBETkJ9iFTGCs5cDzXjj8LtNUt4zUJ5Z3p6si/YIclu5EF7UJZ12Tze5zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d425c3a-bb4b-4d0a-a3c5-c224b385a43b@suse.com>
Date: Tue, 28 Nov 2023 18:25:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/11] xen/dmi: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <0eaa7a31011dc3b2f22217d2c7389570d5634549.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0eaa7a31011dc3b2f22217d2c7389570d5634549.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be171af-b2aa-416b-96a6-08dbf036fc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iY0g+aJo01PCL3JNlWs3NE19PPfQI77FdR0Zsx+qndaI0Ju2iN8j+UZAzfKPbUxFBAJVxTqUJteseyn4NA1P9m1L64rbljtZw4NoRjfUf/9XApVzgyG9U73edj/hKFHURI2Eb0OCnXbrKMJ9Kkz0VDR+plMuHrvP333Yx6T5g1BE5XTYCsEbhv0Gv+Jt/RJa7uo3duFm03O6T3buQQV3F6qdAK6CAHXX8QuayB4qEf3VweGIvkVeXX997aPfQKAye9SK7l+AfutFovpbXEt+tc7r3NtreOGg3Prr66YfMuBCw+49AyTam5RrXb76VPpye0KThMGzs/1lksU5iGFh+kgH++OEuVb7B17rUsY7o+p9HpwrQYwjytj3TxeX1GorAutvEExnH9nILmcwDzan6patRPGXvBSaBzh0UwjIm50Nayv6Hk3w/PN093yonwiSI+8znL2HVFXk8+vH391e/NkZaqnE9+O5mCaPSgywpGzUXQbPZdSsDXEugmAm89lBpYKeNa3uJ0snxy3juuxaqR7FcE7f7CB5RED9DTvZYzEwVM05dAUoPU7pzq6oB7/SBg/xRm9EfNecGFNGl7sQh6jNDiFK7cDpUarBny68TeQdkGdBh0Np5eoGfd1mdO7Agq9t7kUAHl3A7lVrD28niw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66556008)(316002)(6916009)(54906003)(31696002)(66476007)(66946007)(8936002)(8676002)(4326008)(6486002)(478600001)(41300700001)(36756003)(86362001)(5660300002)(2906002)(558084003)(38100700002)(2616005)(26005)(6506007)(6512007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG5hdzZ0TUg4elJJM3c3NkxrWDNLNTBWckx4VzJnbUs1VVowUS91UThKajRV?=
 =?utf-8?B?L3JKZXF2WStMWTVsVSsrRWplOCthSE9CTFBGVFNTQ0dIWkV5VXBLVnBLZStB?=
 =?utf-8?B?L2xtR0VYak5Mbk1lZzZ6VEFYeXhEWmVhSGtiNjRKZHFGZW9HSHExQVUvaGZ3?=
 =?utf-8?B?UUFQZCtqWU5EbHlpY3lEdlFXQ3o0Y1ZzK3p4RU5xcjR6VHRFZGtKemV5MVRt?=
 =?utf-8?B?WGtOYlM4TXl0S292dnRncHlJZ25laDMvOWV6V2RvZWV1MzVJYTA1WEdpbUZJ?=
 =?utf-8?B?aWV5WGd0a2M5cUF6cTkvZTNhOTdRZFBBT2N6b2gydTR3a0FRVU9XR3JLd2JM?=
 =?utf-8?B?em12MjFiZml3cjdSUUE3WDkxRHhuMENDVFNDNW1aU2F1UFdHODVDSTBVTG8w?=
 =?utf-8?B?cndtbEFqODlVM0tQQ0I2N3hkOUVrR3c5Y2FZQ1RJRTI0MndEcHJ5QkFjQWtl?=
 =?utf-8?B?Nnl4M09jVENITW9NWWVWUmtvUHRFbktJd25JVE1nYzhBR1hMV08vOUZJS0pW?=
 =?utf-8?B?YTd0Zi9neUMreTNBczl4K0VRMC8zNzVTU0EyaEdXRXZZRU8rbWo3Tm9MKzJI?=
 =?utf-8?B?bmpwTld1MDBjMWQ3eDJMdTVUR0dnbTZYeWUvbkI1OHVRSmd0cjZkRzdPWEhu?=
 =?utf-8?B?VkFjU1VDbzdjdURjZTZRSVR3MUZrcFd5R01DbnRZSVBlbWRsbFU1THlsV2xk?=
 =?utf-8?B?WkxJWHd1c0l4aTVCcEpob2Zvc0lNSTY0b3lBcjJEei95VkVITDNUNEJ0a2Ro?=
 =?utf-8?B?aXJYY01oSWdMVDR5b2drMGtsZFNLdUFRSzcvcFVPZ0hwL3Y2TER5ZUp1eUZM?=
 =?utf-8?B?bGRta3Z1UXpET0lGWE1xL2x3QjRydHdycWFlbGhFL29sVDFtM1Y1RVM1OTBp?=
 =?utf-8?B?ZjRMQUM4L284Tis2YmY1eGV0TzJPNVNTKzAxTDBVQ1V2UXZkK1RMbmpjbWdm?=
 =?utf-8?B?Z253RTM4L3NZWFcxZzVXZ2VBdnJjTW1BL1VnTmc0bmpNTDJjUjY1alhiWm02?=
 =?utf-8?B?ajNGdndsTU1HNlFsYkltZ3FHR1dSK2djRFFJck4vTUtjOCtmL0ZqRmRSVm1Y?=
 =?utf-8?B?UUZ2VHJFa09OR05wcnV2MnF6TzNETnJQVDV0OWN4eEN1VXVOcVpiMi9RMksr?=
 =?utf-8?B?Q1k1eFRRMlRhU1htMjV0QWJQRXpzSCtpaG55ZWFwNHlmQ3I5N1JsV0tiZFd0?=
 =?utf-8?B?dXg1V3V4U0lKaDdJbkI5aTFoeHB0V3NvQmVxTmsvQ3JNRjFDRVJSTnVCR0I5?=
 =?utf-8?B?WVJKeFBOYmRRTUY1Slg3Ymd0NHUyQVp0OXo2VjBSdzdDRU5DZ0wzTktlZjhH?=
 =?utf-8?B?YXRHR1laK0JFUmh4dVVjdlhyWHJISzEwS3JOVFFsTFRxankwQm40TTEvakpo?=
 =?utf-8?B?aHZEMmVoZlRNam1lRzZoWE94bi9QNlBIUE9JWGZwckdVWkFWMHg5Q1FUdlVu?=
 =?utf-8?B?YWMrb0h4eWlyMnZPMnBtR3JMNW9EM1R6bUt2c2syNElmVzF2TDdCRHI1SUg0?=
 =?utf-8?B?T0duaGtrVEhDQ0dTL2puNHE2dGQ2NmwrcTB2bXFpT2x0Ym95NklTMjVvSjBn?=
 =?utf-8?B?Vmp1eG1zQ0xrbkNRQVlEZDdkTFo0a1dhbmlHcTFOZDJyZUhjcUE1UklOSlA4?=
 =?utf-8?B?eVQvb0ZTK0wzRGV0elN0ZnhLVW1kY3Q1UjJkQU9TSHNnY09MK09tNmpycUY5?=
 =?utf-8?B?RkRvRWhNNnhYQW1qUEFVdXpFNzhUU1hDdUlhdDVYUXhWa0gwb1U5T2dxay9i?=
 =?utf-8?B?MnF1Y2JGcUVFVytxS2prMTZRS21BdHBxRll2MVBSMlM4Vjd3dkMvUGJnOUt2?=
 =?utf-8?B?QmlSR0ZESGVhNU9jYjZKRHNpL04xbm5lMnNXV0xFTHJtdmxWcHlpZ2RhZDBL?=
 =?utf-8?B?WVV1blFUU0ttN2EwR05NVDZibnMrd0ozbFgvMGhheUhSQm8vWnJIRU5PSWpC?=
 =?utf-8?B?U3Fta2FJNGpaQmJDT2kyanNONHZUbjRkT0dyZWpONHQ4MDlsVVI1ZVF2SUE0?=
 =?utf-8?B?b1JMcUhneGE1cldPNkxSZG9UdWNIODdlUW8yK09WZktmbXlwa0ZTZHEzQXlC?=
 =?utf-8?B?ajc0TlNmUk4yWUhmVm9JbSsyY3R1eDBBb0xJVGZwMWVzaElmZFVNS1JXVURw?=
 =?utf-8?Q?orosNImZjqfpUxSJbOSc8naUY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be171af-b2aa-416b-96a6-08dbf036fc6c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:25:15.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh1IQPVO6GWz3SAPj7I0PGdaMf7SVPnajnZczQ24EPbL3QyduFHkAH3czaZjdvVj6+IXh3sdfWc6NMsWDnctAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



