Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B792C7F9BAC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 09:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641675.1000433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7WxF-0005fC-4b; Mon, 27 Nov 2023 08:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641675.1000433; Mon, 27 Nov 2023 08:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7WxF-0005cf-0P; Mon, 27 Nov 2023 08:26:57 +0000
Received: by outflank-mailman (input) for mailman id 641675;
 Mon, 27 Nov 2023 08:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7WxD-0005bJ-5d
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 08:26:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6991fc7-8cfe-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 09:26:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7782.eurprd04.prod.outlook.com (2603:10a6:20b:28a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 08:26:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 08:26:48 +0000
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
X-Inumbo-ID: b6991fc7-8cfe-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+icNZSPRB15gZtVf+cR3CWMcgF/aZWlk+Bw09kXQ+hq8wCvnWAtH9R7Z+01Udz6vBvnEQ8GplrISigMnr5h49v+VSSwg0Ju/ktPAGMbF73VG/BPfhEya+yRUf6mJg2Sd5YkkXt5ZPPo7yUAoKNkniTX4YnsdfYPCmwb8PujrkqKw4P9ZxVy3yOPL2Eu9Hh0DSBcmBSkI0n0H6tiUsVaKOiZ6NAH+ugIBLJRDlJLnJJku7NdugY4kbU6tZCE2QZaaqDuEEs43CN9Ba9hfi0CcryXEFDyPWNI/YkTcloTtIU6x+Lpfj2RELmzPg9HaY/9BEajbbo49MC/tlk/wREt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bT7HH3MSiJMX+dcuTD01F57YpwhXAjzYnqVRQXlBdU=;
 b=JbUgo0y5pO35CKH8psIqgcsskQ+1kLdj10sgAXbVBp69lDEDxySPtCXVJlFgEul8nZQsDBrWEZvI24+5MZq2WX6DoTA5b/9jvogCde2fH3yYMHee0ShCs2Z+uI621NGvo9aXX9UN3Ys6j/s0Th3kdf8ac3VOytysUIGKEx00AXGWQq+XQrrMRfbg2f2vTkAJ44zwLjdRh+Sr7zFFqTjMEtXQLG2E/s0Aqc6+YuPBVGcaM6MK/AAVSPdOybA5rB6LnqXU+NLz8GVVQVFQ/+N1wkXhxyHjcsRr2FVWsMqxtROkGJ31ebpVN3Zmn0stvlyaF72D1mnvdPDnoHL5NaAKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bT7HH3MSiJMX+dcuTD01F57YpwhXAjzYnqVRQXlBdU=;
 b=Z9P5mJcx/WOmaNgbl2aaHg5fODYLyPL8tYIJtvBYY+dV1+QOg/k/X+cgOiLrO2ipbDSQiWfglduqFo6gnMZg7nHuBUsyE5c4//47arTjkUd02X6FP0BlqOwPoripZdjKN3gv2vOmN1F8PD9hfT1u7k2morrVpMcfVgaHUTw/hv+9XTxAu3TDuV7Ws24Tk4ed4AmmpmGg14F820FoXf+WRkqcOX50axLY/louN/qPXHBzlANmo7MiRy9onCmNn+Awt5CVFn/RxB01u/pCvIu5JeSlDHIqnUdXe1l3s8F+/q+Cb/XIln8U+8DuQ95OqEb4XJA6FjHYYoJ9OeJgbf/ghw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a4d4082-4606-4d5b-9e7c-b8186f3a5e34@suse.com>
Date: Mon, 27 Nov 2023 09:26:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/HVM: improve CET-IBT pruning of ENDBR
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <8112f1f9-3e3a-4839-9124-9adb87f82c29@suse.com>
 <c7e50f7f-690e-4402-a873-1534d01c6434@citrix.com>
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
In-Reply-To: <c7e50f7f-690e-4402-a873-1534d01c6434@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b95a74d-1aa2-4d84-111b-08dbef2298de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8tgiPXdRi9mdOopW6o7lmp47M9rhoLIyuU8wPUtD+a2LZMQZ/C+8uFqE6prmvfuiI9SxWPr9WY73LjaxINOpypUacBgzpQbKQcROQ4RG1ADHkC13xtIsQirTDwQLeD7GgOK17gKDRYIN+XDYYC8mOQhupFRdG8V0DXqFMsyeHeHKtPwqnp1BwyeuQMomKVdNOXpt3SyuA/37n8IFubWWYBlO3XzHqUed1j0AnfSPo8ccGg6tCp9rHRJvWdVWHf5r/CFD+yx61NaIH02iVHVE/HR7XnXIXwDMUnCwMkULj0gQWaH9temoHD7TSmRqpAsb2K/HWWMdsPwil0IaBAqES2Jg/kM6FkalXf5KLAHrPsCIo7TFjYzGY1h3KlXDVsDvJwD2NMbF97Bdc/JR6YHWdmNi7zw7KnK/3okEeWvwZd4OgGB2g2WnFWh+YRy9xd0idUGwsvS5QNaBPyZJTcMhW0lSxjPRnQ6Pkzhijd9DXThaZW/wVKqGFR2Lm7JjOiH661qVLoGQxc7X+O1091at/o2tIwq3gX4S1F4ioQ64EmmuSc0i5hs2JLTedG1CszuUuPzVzVWWnf/M30+H1Qk89iNbz8OS1kw3Lr/p6OTkdwSA/4CUoAFJYPO+L+GIqbdc/gOHdesZlShQuOYSGoNvOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(36756003)(86362001)(31696002)(5660300002)(41300700001)(2906002)(66946007)(83380400001)(66476007)(4326008)(54906003)(66556008)(316002)(6916009)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDRzejFoQytEK0hlVnZLSWdFb2JxcFR0U1JUaTIwcHpLUTB3bEsrN2hkY3gv?=
 =?utf-8?B?Q1E3eWFZaFdZMThuRmx4Y0RoTGpSOEhYNHVlTERvLzhNcUJkLzl4YkxZTDEx?=
 =?utf-8?B?Y2xrRURSTlloUDZOa2lPMk9zRkE1NUEvcGNlZUwrWDdac0RFMnE0RTAvcm9j?=
 =?utf-8?B?Z3hWVzVEMEc1b3Nzb0ZlYkVKS3M4azJhZWpaZWNPZjZPUHp1TTY4VDUvZ3FI?=
 =?utf-8?B?L1BKdHFkNGNMcjVYSXpEMDNhY0VFNHY3REphL3pjQmVZdW00UVlULzV6OTVW?=
 =?utf-8?B?MTRpWEVYcXJ1STJDWGMrUGdBaHNHQ0RVQW1VdlhUdW13REFnL0NLUmtnVWZT?=
 =?utf-8?B?Zk01VDdJNDJPTG1yM1BaWWMvSEVKUnJuQ0ljTWVTUitIV3JYRVA5NFVMVDZR?=
 =?utf-8?B?WFNSZ1c5aUFDZWNLN0RnWURYSVo2VTZiMDY5VUNhSEFvNHFWbkFHMGVyZXNJ?=
 =?utf-8?B?bHJzYWh3dG14MXh1eklQWGJITmFZM0YyTFRLdXB2bVY0U3U0LzFBdVhmSVZm?=
 =?utf-8?B?S1FETVVXemVCMzR6R2Q2Z1VzZWEydUxKM3g2WndKTzQ5UFVVMUNjRGxiUGpV?=
 =?utf-8?B?cWtVY3RZcTE0TCtNdVV2ZUk1bWhEdVl0ekNVOVFYQzlUTlV0YUl4b1ZMaDRX?=
 =?utf-8?B?cXpybllPU1hCR2ZZNmdZUG15QlpWTW43eWtaRXoxTzdMbkI1bUhGaHpLWTFX?=
 =?utf-8?B?T1RwVWx4c2xwcW1EdzdrRXllU3RNcEZaT1ZvekdPbTdiUnFTbEVLZ1RYalVC?=
 =?utf-8?B?dE1pQXgreEJBRzYySCtpMlo3UkNrZkthN0NxQmFBNzZiY3A3anVGQnNLeG14?=
 =?utf-8?B?Ri9LY3IwV2tDcDdCRTRsU3R3UDVHTTdFYXVXM3NsV2xOREdOZlNyQTFUL1Nz?=
 =?utf-8?B?NGNlZnowOWY5STBOT2ExRjFVcmExQ3c3VWVyb0FVbUJMeTZpOWdSWHp3Y2ho?=
 =?utf-8?B?aldiQkJYQ0RETHZXaWw5eElVOEhxVGViMUJjMlptVTV2RWIyQ1g1dDlJNFo3?=
 =?utf-8?B?ay9YRlFYbzZHa1kwNWJJUFhhZkdpWG5aL3VhQU5CR1hlV20vRStpTkorOUha?=
 =?utf-8?B?NnNTa0NzMDhMcHl5NkFiK21VM0lteHVSdlJ2WHB4STRPNU9RWEJtUUhBRFdQ?=
 =?utf-8?B?KzhBY25NN3hFSkRyYUtEWEJMeFF1aGZvR1NwQUgvb3gwakVZNy9iVmd0NHo3?=
 =?utf-8?B?a0h0YXdUMmVkME1NQWNYT0I2VGg3VERRUVNsYmNKUWhTejRVL0pwTHJkZGRN?=
 =?utf-8?B?cjBzV0RHVVB0c0h3U2ZGWVdBemhlS1FrcVYrU2htb0RycHUrRFpUWThZQVI1?=
 =?utf-8?B?dWpPSFhFdnhPNVQwTHB5cFhsai9Uc0hrM0k2WlIwVm9kK3FyS1NjUityZEFa?=
 =?utf-8?B?S2FzTXgvcGJHMGllQnVkVEF2MTh2ejVydGtjSXNoVFJiVzczVXdXMThUWlBp?=
 =?utf-8?B?bWJHN1ZXeisyWG02YUdCaXFlQk11aU10VFhrU2NLRXBrNFdJYm01b0NpWDFH?=
 =?utf-8?B?QnV4R3U0ZWJ5UGFYSlEvdmJLN3VtbER1STZhSVNBZ2t2eHVuQldiT2JHdkg1?=
 =?utf-8?B?N0h4Y0ZFOEc2c2xyeFlBRXhHOHI4TmVxVDhUT2dKbFlMSU44UFN6eGtvZklx?=
 =?utf-8?B?VGV2U3J2STU5Z28wL2J2RjRwZVN1cDJFVkxldno3dE9HQndTWHdmQk1GR2ly?=
 =?utf-8?B?eVlLV0VDTnFyemZ0aHNrV0FQS1l6Qkl2QjZIT0wzanFTYnJoTmorNndlZEdt?=
 =?utf-8?B?YzJ5Qm1hWGw4bnRaUTAwNEQxd3BOZUpLVURXMVhxalAyak80cnZ5ZS9xMUgv?=
 =?utf-8?B?aXVSbkJiamhJdmNrRjY5Z1g2My9tY0hzZ1ZZZHBuTHlweEZuWUo3NWdDb2F5?=
 =?utf-8?B?dEZOb3Bua0s0Qzd2L05aZ2pPcmlUVWdiaEFVRS9nUTJCdGVkbmRoeHM0M0hs?=
 =?utf-8?B?d3hESEFSRnBhcjF0NHhpWlhqUHZrK0VuUng3UDlvMFVmYVV2WHRJdHdXQ0Vz?=
 =?utf-8?B?RzBjWkx0MVhNVUZxQkI2bzFTbWRyMHdGUEc3cnd1cXFxV28vU3Ixa2E0byti?=
 =?utf-8?B?dWVudXpJQ3VHVkFCeUgyU2NLTVhGblJoczkyeUxxb0NkT0dBM1ZXVVRIYmlI?=
 =?utf-8?Q?FgxP/5aIzVGgPottj95bTaVIH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b95a74d-1aa2-4d84-111b-08dbef2298de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 08:26:48.0269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewm2mpAhSi6V7ZYAOGIi51VHIey77X0qg+PyBedvlQMjstFrsRiAotqGMo/OQhtR96Y6PAcGWtDX3QvBMNDbaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7782

On 24.11.2023 23:28, Andrew Cooper wrote:
> On 24/11/2023 8:39 am, Jan Beulich wrote:
>> __init{const,data}_cf_clobber can have an effect only for pointers
>> actually populated in the respective tables. While not the case for SVM
>> right now, VMX installs a number of pointers only under certain
>> conditions. Hence the respective functions would have their ENDBR purged
>> only when those conditions are met. Invoke "pruning" functions after
>> having copied the respective tables, for them to install any "missing"
>> pointers.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> In theory Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but see
> later.

Thanks. See below as well.

>> ---
>> This is largely cosmetic for present hardware, which when supporting
>> CET-IBT likely also supports all of the advanced VMX features for which
>> hook pointers are installed conditionally. The only case this would make
>> a difference there is when use of respective features was suppressed via
>> command line option (where available). For future hooks it may end up
>> relevant even by default, and it also would be if AMD started supporting
>> CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
>> continues to default to off.
>>
>> Originally I had meant to put the SVM and VMX functions in presmp-
>> initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
>> before hvm/hvm.o. And I don't think I want to fiddle with link order
>> here.
> 
> An alternative is the form I used for microcode, where start_{vmx,svm}()
> fills in fns, and doesn't have to fill in all hooks.
> 
> That will be more amenable to Kconfig-ing generally, and will probably
> be less fragile to getting forgotten.

You mean specifically "x86/ucode: Move vendor specifics back out of
early_microcode_init()", which looks to not have gone in yet? That's going
the opposite route (NULLing out hooks after copying), yet this looks to
still go against what you're asking for below. In how far this would reduce
the chance of being forgotten is not entirely clear to me right away, but I
think I see your point.

One (further) benefit of copying before editing would of course be that the
static struct instances then can be const.

>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -3033,6 +3033,30 @@ const struct hvm_function_table * __init
>>      return &vmx_function_table;
>>  }
>>  
>> +void __init prune_vmx(void)
>> +{
>> +    /*
>> +     * Now that vmx_function_table was copied, populate all function pointers
>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
>> +     * much of an effect as possible.
>> +     */
>> +    if ( !cpu_has_xen_ibt )
>> +        return;
>> +
>> +    vmx_function_table.set_descriptor_access_exiting =
>> +        vmx_set_descriptor_access_exiting;
>> +
>> +    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
>> +    vmx_function_table.process_isr            = vmx_process_isr;
>> +    vmx_function_table.handle_eoi             = vmx_handle_eoi;
>> +
>> +    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
>> +
>> +    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
>> +    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
>> +    vmx_function_table.test_pir            = vmx_test_pir;
> 
> That said...
> 
> This (the hooks being conditional in the first place) is bogus to begin
> with.  Posted interrupts (or not) are a per-VM property even if we don't
> wire this up properly yet.  It will be forced to be done properly in
> order to support nested virt, as L0 Xen *must* comply with the settings
> chosen by the L1 hypervisor.
> 
> So the choice to use the hooks will have to come from per-vCPU state,
> and not from the conditional-ness of them.
> 
> Any chance I can talk you into instead making the hooks unconditional? 
> If not, someone (George was volunteering) is going to have to undo this
> in fairly short order.

As you can see from "x86/HVM: drop tsc_scaling.setup() hook" I actually
did consider removing the conditional parts, where sufficiently
straightforward. I'll take another close look for the other hooks, but
I'm not going to promise anything towards actually taking the alternative
route.

Jan

