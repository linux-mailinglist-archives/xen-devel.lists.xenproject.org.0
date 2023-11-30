Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CF7FF62A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645059.1006846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k17-0000IL-Q1; Thu, 30 Nov 2023 16:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645059.1006846; Thu, 30 Nov 2023 16:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k17-0000G1-NF; Thu, 30 Nov 2023 16:35:57 +0000
Received: by outflank-mailman (input) for mailman id 645059;
 Thu, 30 Nov 2023 16:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8k16-0000Fv-0P
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:35:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885770c1-8f9e-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 17:35:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 16:35:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:35:25 +0000
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
X-Inumbo-ID: 885770c1-8f9e-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OugQTKMC/fqlNSrlYFSoslNG11BgI8Yk6/yXr5kxytuoVssZuTjO+oAHfMsw6xVdTf4MtXP07teipkHRP8a6D69jOt2O7r7MJjvOX70pHadVN9MBjzM+yF+RbEnDEAB5YFe6JY85IDFtnLRng3j0z7tVhZgKcJ0qnB2wDxX9CteblLDyWqPCO7L/CmakR96/f7a4e0OKWCX4j4T262hwRImTPNQv8xZpd5DsqFOKcKS99wCtLgp5c3Yvrump/X1mLvIyZR8Lvrf1dIgjU20b9qT48xtjuf8EQBcXFjkQY09ZWEq443vQtzkPXogAOoUTNd+P5hZND7qFvSMz1HCXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=b9hDQgBrifCePBs0a3R4D3sW4AXwO8iHChawh2O1dzMF6QKQC4JtaygvRCS/6rhCmOuT7C3aU9+ckFJOIHzXZdakuTxS96Q9YMkSEFfXRAP3E5A3nPZmkt1XidVHywP3kyWMybazzJgbMRE8EmAR2+hr/OUZBHzgqDHxHSRpYOA2FvFDLJxKeQiSk+Eh2Pe//E3HvAnLgr/r4wGnKsu/Qd3zLSpwTwr3IEg16f5Mnzmu13S8Z34Xnr2pyTRKtv0tyr7didPlF/nXfxn1fm+vGLWaidPHtCVw+Pc3qnV+CKZDFbIgEF3IVmLEN8qW1DXRDujELqamFCJvaun/KzNIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=rcXtyr3yad0pPJcWa5exI0s4e79TmS8yS1UQ0hTD0zABEBy4PKXu4g/6Fq6MHN3LkOoWokZwjw4O5g5zM4ti8+1x8eKV4GWPoFE0qoY9eqo8g6lWUoh7JdoRpLKEXmImqaLfPuLq04lxJ0URfHy0v9i9KI4U1gdtUY+PMRt+KsQXkeUxEc/po1bqzFKh8o5w61rDq0fpHIwOJSLXD0J4b2Ar1s9kWQuI2DGpXJq/MOt1lsIRW1TkOatHqA80ihla7608v7xTrzkj4rIFZQDcP2bCeAu6wPjPVrLWPr2nrHRuy1AVTupcLmH6EuVJKZy6R0t3rH9vABX1mNzBYLAIRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f916a2da-7b47-46eb-b2f4-152fa053df74@suse.com>
Date: Thu, 30 Nov 2023 17:35:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/11] xen/perfc: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <642bcf2ea2147c797d102a12d51b7eee90f0e5a6.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <642bcf2ea2147c797d102a12d51b7eee90f0e5a6.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 2980bd44-313e-4365-5614-08dbf1c25abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LTDeBSza0LZqT1Nw9BWwthJdnD3S1iwoRvGRmzqULfS/ta3qHjo5VYuNOJ4mFthb3aTjxSoxztS8U6EDbt/LzQOkq9A3yv3BL3DFogKDsCel7QFaOWS1gs0/8f7rB9CCtadxvqwcJanS3WUE5RZ5UFM5b195D+EC16V9TOjiLdH12FHlIl5Hic3ssnrydShOCVhYZgV+5ohQB865sT/uoVB5yTD9BfP+1cqRSB+Ia3woZCCf2yugpq3Mad/sl5UBjBpo9X2j1VGNWTIgz2wcoMbHP/CtnlEz4APo9yWezqIls76szEZ1+ADnmFe6RBZ6SdMb7B45TuIN0O8TAL9KbTRnvJR+Ifs5w2EfOw1B8JyBnmj9TcEsueMhwqNkLodxvJJ3ylEdiwyb2EAHCdb70eWx9m5niegVlphJxJNnUiYIPre6pv520v1N+ifa+lWpCR7waCTJznOs195NfyQFZl7EKa+ErLm1WWMnIRwlsLIggCz+rPf2eKYWySiB6M8iUZGKiypboyOrCWlY9nEIbk7IsCQd1U4OJO29M61dC4uPSbyelwclyNUgl148AEolnEM8kNm7YIM0bWqMnzLCI4TvKlpbf/oWtOCPmGfJw/ZNdWk/DM4+iotaaEy/KArC3AtTMqUVDtBpn+6FJg+71g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(6506007)(26005)(53546011)(2616005)(478600001)(41300700001)(5660300002)(4326008)(8676002)(8936002)(2906002)(6486002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(558084003)(31696002)(36756003)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3RBZkJjS1dxVGU1Sm8wRmJHOVhtYXdnOXcveFJNc0ltSVM3dGM1TUtFd1NT?=
 =?utf-8?B?czVKMW1nYUhURER5bE1EL0tiYlowZEFTUThveXFmRlNCZC8wWkVlY2N2TzZ1?=
 =?utf-8?B?YyszaDhWeG92ZWlvNUtVTXF6VFYrSmVORXczVzVWdGpvbzRwU2VYN3lVdFVW?=
 =?utf-8?B?blpteU1UbFNqQ2hoT3IxbXFaSTNEV2x0Sk9WY3ZEQnRFdkVjdkZTNFVZcUZ6?=
 =?utf-8?B?Y21hMkVERDZ4eUlSR3oyZFRmR21KWnRPRGt5b0owRlJHa2pydHhqWlRONGN6?=
 =?utf-8?B?anhlbmJPQ3MvRVpyQ1p1dFIvWlYwQXdBK21NaW1wb0NMQTFmSVp5N3BJMzk1?=
 =?utf-8?B?UHhtQzVwdXd2azZ4VVJELzViYXFOY1BNTFF5ckdMNHNmVGd0MzNSa0pnS0VE?=
 =?utf-8?B?TVRLK3VZZEVjWFpoTjVKc1d5NjUyK1dxTnlENkNTbjJOMEhjZTN6azRyT1VR?=
 =?utf-8?B?MzFsSjUzQy80T0I1YmZERVp5Uy9jcnRrUHgrUWJDQ3N1d3NRaklyUUIwd1hR?=
 =?utf-8?B?T0F2SHRacEQwcXBQTlIzU0VhbXdFWkpCQW5sa0VPM2NVMHdCYUxoS2Y0K0du?=
 =?utf-8?B?ZlFKcFczY1Z5RVlFQ1VoVjR5TG5VTE05OTdqamNpdFlOb2puWnJ2YXMxa1RV?=
 =?utf-8?B?Wk15a2QrQmxWWi9mTklIS3pjT09JNEo1UzVvRENwRFpZeEV2RDk5TkNHS093?=
 =?utf-8?B?RUhXdE84Zk5sM0J1bUZMdjN2R1lsa281d2l4T1FZRDdCVC9EMmRkeGMyR2tT?=
 =?utf-8?B?YmRCcmsyNEVxSE12ZnFtbDJ4QXQybzBwL1FOZUlLdDQ1aExzQk83Y2NmTTF2?=
 =?utf-8?B?eWhkTU13L0N5bnVnd1h4UnN1K1dZbG8wRUJ4VUJPODZuanNwaEZWWUQvL1VE?=
 =?utf-8?B?dytUa3c4KzNjVzRsY2V0UFdzMnFnZDIzQnIyZWJZZlRuWjV5WUNTdUdiay9W?=
 =?utf-8?B?eHhERzRDU1JHZG54YjRmVTJsdmYwYUd2K0lvTE5zTnB1WjBCUU9Nek9KSDJ1?=
 =?utf-8?B?MGFtcnRvSmNqSWdqbTVVcHZmYVFUSXdRV1NGYjZQTnhjTlBSemZJMjA4eXBS?=
 =?utf-8?B?NmtIeFZIUjRGKzFLVEc5Lzl0Si94YWZUNEhCRUQvaWNrUWJLeDFOMThoNm9Z?=
 =?utf-8?B?eThpeDhGNktVb0M3Ulh3aXkza2RUeWtBaVAvK2ZMYkpyeHJOU2pMT0x5dDhV?=
 =?utf-8?B?ajk3M01wcUc4R3VvRXNJRjlmcVQrNXJjSjRCSkwyN3NZNnB3dml6bVpwV21X?=
 =?utf-8?B?a003a3g3YnluTlR0UFJOV29WbU01U1lXUy9LaDZTMzFyckZlUXBIQUJyS2JC?=
 =?utf-8?B?MFJ4bGNyUm9PM1ZIQm1jNDBtK0ZMRE1qQzMxQ0pKV01vY09LOWN1d0pwM3Q4?=
 =?utf-8?B?Y1ozck5kYzk2WWplenE5ZVNualB1ZDlia1ZIMHBkT1RNYmJFT1oxNE1PbGNP?=
 =?utf-8?B?T1RFVnJRcldLN2RxRTBNRmdyZmxTTDJ5Tyt6RWNQVGd0RkhkaWdJOVcrdGxD?=
 =?utf-8?B?d1JCSXZYME9wRE5HamJURHN3RWFUdWpBZk16NGVoM2h5WkM2eHh6QVNFWXF0?=
 =?utf-8?B?WjlYTDNPRjYycnBlUmNnaW0wNzJDQ2RkSS9yQkl1QXJ2U1BGK2RQVW9HdU11?=
 =?utf-8?B?WG05WjE3Nnl1bXhhZ0h6M2ZxMXpQWExVeWxqTGwzZVlUYmwxRTZiYUxyL1NI?=
 =?utf-8?B?azVuSUJBajFJeHl0RTNpRjR4a3Z6aUViQytIMEFpUUhSdjJGeDUyYjc2bmVE?=
 =?utf-8?B?dzlxaG5nd1hJUG1LNkZwczY3YXFKMWlUbTR1YWZRY3pXVEIzY1hXNGI4VnVr?=
 =?utf-8?B?TEJza0ZOSnVpVDhtbFNsNzBPUXZ2RlJHdmtKMGJ3aGNBMVNQWlR1QXFXVGk4?=
 =?utf-8?B?VUNtOGJIRnluL1lITDlHbU5KMFYvS2dZU1VMU2c5Zm9LZGx1bjlTbnFlQkxU?=
 =?utf-8?B?TWpKUHdrNU43S3ZCWGtlRWVUT3FQL0RCSFJOTHQ1eTNrNlVwZXdRMjFMYXdm?=
 =?utf-8?B?TkpGMVM1Y3lHMHJTbmRHL0x2d3BNdVgzVnVvd3k2aUIvWkw0Y0hxVnJJMzlY?=
 =?utf-8?B?ZGsvdDd1ZXdDMXc3Y21xaGt0dURHL0FUcE0xV3J0ODNTYmQ1RHljOFJrVVZO?=
 =?utf-8?Q?KejnG6JWS8ZOP90WW50+ETfOw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2980bd44-313e-4365-5614-08dbf1c25abe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:35:25.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zC8UG2ChnxcX6VwXSSWeii4B99gzLe4TK5M/SDncXHY9GQNe9vnzDBntgG21HFkoGffe5nsP6lVJyw1d4KgsZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



