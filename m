Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA67FBA88
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 13:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643129.1003041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xau-0006Zc-3G; Tue, 28 Nov 2023 12:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643129.1003041; Tue, 28 Nov 2023 12:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xau-0006Xx-0K; Tue, 28 Nov 2023 12:53:40 +0000
Received: by outflank-mailman (input) for mailman id 643129;
 Tue, 28 Nov 2023 12:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7xas-0006XY-9W
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 12:53:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 257a0577-8ded-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 13:53:37 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Tue, 28 Nov
 2023 12:53:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 12:53:34 +0000
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
X-Inumbo-ID: 257a0577-8ded-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdGmWu6pljHY3SJ6uOBYKEkqXn6+RNVibE3tfq/sa7L+luNn0dgBGGIlnW+2B98UbVBT+QDrS17MigZzQ7skTMW1NzamnSAGihiRmEoFodREV0uuB6kKKeJnT7PYKTwN0Flwm+RhoeuiZBd24tmu+NUF215zITdLMZ5riPzykhVc9zgLfKfijg8s5OCLMta/venjFDzxjD2YN17TznIcrR/PrB2J08VnA7BTU71t3hzDFyW3hCxc93hBsR2NyOKXgAdd/iN8K4mKe0Wzpq06OAFvnJKfNksfP6l4GGIzpNS3HzA+lzUEtjxtISG1X4JzipzaAN0NaNQMliqEHvq9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFPX65n/dNQbtkvqTS6v+24oVLa9jQduzJeifVk+3fE=;
 b=cGQM30yXtmI9OKqT/U9qa6mci2GQHwEfIi4urrPotJcLSvrQZbgBLTU7q9/TnPQ58gF8ZJv8mTLRD2xfHeNFlcSnhaJvvqDzjDeAbj8/JnyfG872qDUneK4g4gFtXTahKOohsjcWzIy8yQPGNVmbZ6pqzDItBBd9PqndoGfY7z/arkN+BvexqPV1QmrR2Ym0tgO4Gm85Y75FapOxCg+eu0ffqCXDOfyKM7Hhb9CBaYIsnkQr3S4N0WhIBiFh4qXO8X5VU5/mm48NY6/2BentRJ4xAhMlyXF9oMF0WEp9I1TZ9QQ83cSUmXT7kUhFEyZTwAHHMgi267LlVfws0FCdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFPX65n/dNQbtkvqTS6v+24oVLa9jQduzJeifVk+3fE=;
 b=Ot3XJkGS4pCIjLa5owtpAmgI+AzcivX7OAOsil8UHWv/9qZOX/2LrBfUoBbBw16tw/uCu+mpzoHnTeWIiunkW2QfRuNUSK9/ERUZlNq4rcpxcW0aJHmg6RFKa1YskKxD1z1w8cv9no/yoSxEfqgicfXdD4am+9HxXvnIHYopuL2l84sTRNMmui6ld7boC1QrduRe5kStnP2l+CHfZb5gGQNC1mTQ11TnP4ZWbRukG5+oOzDA4X/FZTWS5AcC9USNqv/a7puCZUT/DmQqKhfIAFA/MArOe3VdyMpBZ4T4eLKXTR9agL08rnSHWk/s2oLHQAh6DdaNzkDuniMzOBrkIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e486d72-d223-46a3-b52d-aaad2fc861ea@suse.com>
Date: Tue, 28 Nov 2023 13:53:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
 <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
 <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
 <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
 <195a50316efde86113f6f5df269c754a90490c57.camel@gmail.com>
 <b81607e0-409f-4805-a4ee-8be8fdd959b8@suse.com>
 <893de5be9743dd4fc908dfbbfd1e7dc890f74b07.camel@gmail.com>
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
In-Reply-To: <893de5be9743dd4fc908dfbbfd1e7dc890f74b07.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: d79a7da7-6ea5-44d9-239a-08dbf0110852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nJH8e8vmAiUY/yEYgsUN62sF3cDyu4NJ5x43xiLRDybH3IELXLxcbclvLobdpDCSe+5jzkDFqzjakjDxkqurlzDg552eUNv/of1PTXaD3NNoD7pOPoKyPs9Ch5yiQBKtvkdRPeJT7hQSNYm6pXikGuTfvUd0br4BlF6bWm+WcXQsqbCa50VzKxmt5y1PSmrc+Udt+misXUncOtv/U6Wi9TESPliUFsfFyk0+ol7WM8XsN8J/yhZQrx9sgyWDTkQqH7KT4/PU2OpOjUt2tp3aQcd7zMda3PpKpnDpIDxG+MPhcY2hmt20t53dZvY+j7nV+la0WGxDbS9N8Q9BO67qAkcLeZ6SwUunGm/sWO3NOi5g4vtwP65RfJDbr1+/579zz3pvk6JpS142fdDUs3O6W+FoJgAGh0BMK1SBRvigEMukbN/7bJat1vkGZb/OvWDxxjBcuHCv4TWHCYfxXV7D/3TWqeMWECTICksMJ8m0Z83dZTI7CIkX6nOACQlvPUHq5aACMiyjqME3eLI/gp6YckIHB3h8AusSvknp2KdZ2gYNWNE9xndreFusNhYehPfXbiRj89Y5HujNv+BwMCtXOaQDmo6HBTrVxr3EIRr2OPFy65AarzK34bQYOKAvY56zT6QuK9Ajqwp6xBP94xjKNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(26005)(6512007)(6506007)(5660300002)(8936002)(4326008)(7416002)(6486002)(31696002)(478600001)(86362001)(6916009)(66556008)(316002)(66946007)(54906003)(53546011)(66476007)(8676002)(83380400001)(31686004)(38100700002)(2906002)(4001150100001)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjZuZDVEZzlPa1drQ1g5OVJYV0ZrL1owbi9IRDAvUjVndXNPT0ZXVEh3b2FX?=
 =?utf-8?B?T1ZJcGRWVHdmMEowUW9ad09JV20ySnNkdGFtaHZ1WjQ4SStuUWZzRE5tbzlV?=
 =?utf-8?B?d0dtQzlTUitQa25xbml5NUZUdVI4VXEyM1IwbXlkMzkxUVM4NFd6TTgvV28x?=
 =?utf-8?B?dWF1akp0eGo0cStyN1JpQWNIWmhpNHRJRGg2eG9tT1RUYzVFZFVEM0sxeFhV?=
 =?utf-8?B?b1pkdXV5SDk2UWRJNVZERmxXYXlQQ1dMT3JSSFZIK3FORzRRbmFENHJNNHBh?=
 =?utf-8?B?WGphM1ZKLzBaQnJuSVYvaE9GSGduSkxlNlRVbTUxamk1dnBIMU1jQks4UUQ4?=
 =?utf-8?B?OUVCb01hSHFYck1PSUNrVnBBeEZ6NVNPdEQyTFM2Mi8ybTFTZXBjcENVaVJ1?=
 =?utf-8?B?aU1mWHI5NE1GdmtHMnluaG02TkF5NktwUWM1S1pBYmVnWjBUckVGYU9TU0g3?=
 =?utf-8?B?UHlwRjRIMytxT0orLzZRTlE5WnhKT2RkZzBrRmhGTmp1UnRIZ0hzKzQ4ZFdN?=
 =?utf-8?B?bUdIYkE3TTJZaWVZYzl1MXlHaUljZFYveG5yZ25QTTRNdUJwNGo3T2lJQUxG?=
 =?utf-8?B?WGlEa1h4V1pHdnc3c3U0SURSNmJERko5THlSYmlLeUlEeURVZXBKRWhQaHox?=
 =?utf-8?B?OVJKS2xvSkMzWkxnYnArSk1SRFl5SjU2emtmS2hhdWh4MVhvU3JXU0trNVJh?=
 =?utf-8?B?eWtqTlkzSTJOSC8yVUJCN0xSckJBL2NuY3daQUYxM3lpNU9yUjdKb25mU2xu?=
 =?utf-8?B?b1dzQ2pqZHU5NW5kbXRTVTltQVlXWjJNUzZJQ0Z6bHJ6UitBWGJmUlU2cDl1?=
 =?utf-8?B?MHYrblh2Ky9JQkpZMStEU1NzemQxNWlTK0trMVBZdmd2akh5cnd2elRMUElr?=
 =?utf-8?B?Q3h4QjhhcHRKaksrMnFpa0F2cHdNT01mWDZDRXA3c0U2ZVBJSjM0Z1RpY3c0?=
 =?utf-8?B?TlBCQzBCRGJ1SFJWQUZQcVRSR1NkZUI4U1V5eEtnMHV2UmRHZVBEdFppYlBa?=
 =?utf-8?B?SjN2d0M3ZExTblhJUVcxSEhYY3NPMi9JMHNNeXY3YUFQV1p6TXZNYWx2UWo0?=
 =?utf-8?B?S0d6c25TcllGNUtDWlRxdFVDT2ZCb0MyY1B5U29uK1J1MU5pcTRVVnE0ejZG?=
 =?utf-8?B?bksrTHNxUDFENHBkMDZQUHlxSTQ4SFFUV045cjVnNDBVZDBKUmdJTUMzNThs?=
 =?utf-8?B?L2JIWXEwK00yNldHMEtocnJYWEdLSDJ0VEVDMFgxbDZRZ21lQWU1bmNRR3Aw?=
 =?utf-8?B?dzNQbis2OGlxREdqMEkvc2tYaG4vamNVVldhSElYb215T2hQejBDMSsyMGZz?=
 =?utf-8?B?MC90S3l1VklkZXRUNkhFSzJnb1B4VHFpQlRBcVNHOXRYWHg1eEkxY0tZTC9E?=
 =?utf-8?B?T25haEtRNEtXWWI0WnFXZ01uRkdjc1E1bUNaZWtYTUxldDFDMzM5ZzRQT0Zz?=
 =?utf-8?B?eHlZVElXSWFyTzhBYXFIV1JCQzAydHdTVzhsZWo5RllOYy9LN3RybTRPR3VF?=
 =?utf-8?B?UXJMRHc5bWN6SkZEVU43MW15QTg2S0M5UGRud1h5bCszNGdFbXFSWXFQWUxv?=
 =?utf-8?B?RjhDQ2F1YXZYemNHT3d2bzRrY3dHVXZML3EwajdYNmhqZFRrd1B2cmZDbkVt?=
 =?utf-8?B?dmEyL3Q0V3FsUmVaQmpxdUxiZ3NYOXVTRnQyWkdIWG50bzJOQUJNbjEwcHdH?=
 =?utf-8?B?RE5HQk92S2c2U0t1UWxBNlZneFhnM01UZTBRT1NwRWNEOThSeFlLbkJQTkNs?=
 =?utf-8?B?MUR3Q05Vc3hKcTFYRkp1R2U4RkNOai8wekt4SWlXSndWaWVHN3hmUUJZcU9Z?=
 =?utf-8?B?bzJtY21uUUp0ZytvWGxpNW13bytFVFphNnFCVTRYenhZcVZIUVliVDNaQy80?=
 =?utf-8?B?QmFWQlJOb2FsRUtlNDJPWWFwMEhPUnoyOGFuMGJyMFM1WE9iRlNpSi9wekZp?=
 =?utf-8?B?Wko3SUdBa1M0YmhuR2hYdWhDUFNVMnFPbURHdTVCck9zYkhUZWJ0eW1lajY1?=
 =?utf-8?B?Y3RXeGphcThaSDIwQjVRK3lCaXdZVG56YWRkdW5WNGpKY1lhS01sRWRCOFJl?=
 =?utf-8?B?bCtIbWs5SVNrTlpxWE96NUNHd0V5ZGxKdFBvc2RLNnVsU2RoSm9CaUlsNXRu?=
 =?utf-8?Q?3IBH8Vsa9vC7SpUaDlivI7rKV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79a7da7-6ea5-44d9-239a-08dbf0110852
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 12:53:34.8609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrAw/W3IR3Pzaam2mBjFoZzYHcfBfYKe5W0A6/Tw0OWmMBAPvw9PU31pwaumfexHzWEjE6+zjM2c3jx6iRMtDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

On 28.11.2023 12:49, Oleksii wrote:
> On Tue, 2023-11-28 at 10:58 +0100, Jan Beulich wrote:
>> On 28.11.2023 10:28, Oleksii wrote:
>>> On Tue, 2023-11-28 at 08:57 +0100, Jan Beulich wrote:
>>>> On 27.11.2023 20:38, Oleksii wrote:
>>>>> On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
>>>>>> On 27.11.2023 15:13, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/ppc/include/asm/grant_table.h
>>>>>>> +++ /dev/null
>>>>>>> @@ -1,5 +0,0 @@
>>>>>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>> -#ifndef __ASM_PPC_GRANT_TABLE_H__
>>>>>>> -#define __ASM_PPC_GRANT_TABLE_H__
>>>>>>> -
>>>>>>> -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
>>>>>>
>>>>>> Removing this header would be correct only if GRANT_TABLE had
>>>>>> a
>>>>>> "depends on
>>>>>> !PPC", I'm afraid. Recall that the earlier randconfig
>>>>>> adjustment
>>>>>> in
>>>>>> CI was
>>>>>> actually requested to be undone, at which point what an
>>>>>> arch's
>>>>>> defconfig
>>>>>> says isn't necessarily what a randconfig should use.
>>>>> We can do depends on !PPC && !RISCV but shouldn't it be enough
>>>>> only
>>>>> to
>>>>> turn CONFIG_GRANT_TABLE off in defconfig and set
>>>>> CONFIG_GRANT_TABLE=n
>>>>> in EXTRA_XEN_CONFIG?
>>>>
>>>> That _might_ be sufficient for CI, but we shouldn't take CI as
>>>> the
>>>> only
>>>> thing in the world. Personally I consider any kind of overriding
>>>> for,
>>>> in particular, randconfig at bets bogus. Whatever may not be
>>>> selected
>>>> (or must be selected) should be arranged for by Kconfig files
>>>> themselves.
>>>> That said, there may be _rare_ exceptions. But what PPC's and
>>>> RISC-
>>>> V's
>>>> defconfig-s have right now is more than "rare" imo.
>>>>
>>>>> Some time ago I also tried to redefine "Config GRANT_TABLE" in
>>>>> arch-
>>>>> specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it works
>>>>> for
>>>>> me.
>>>>> Could it be solution instead of "depends on..." ?
>>>>
>>>> Why would we want to re-define an setting? There wants to be one
>>>> single
>>>> place where a common option is defined. Or maybe I don't
>>>> understand
>>>> what you're suggesting ...
>>> I just thought this change is temporary because grant_table.h will
>>> be
>>> introduced later or earlier, and it will be needed to remove
>>> "depends
>>> on !PPC && !RISCV". And not to litter common KConfig with the
>>> change
>>> which will be removed, it will be better to redefine it in arch-
>>> specific Kconfig with default n.
>>
>> Right. But if it's indeed temporary, what's the point of this patch?
>> The entire series is (supposed to be) to improve code structure for
>> longer term purposes. If a non-generic grant_table.h is going to
>> appear for PPC and RISC-V, I don't see why the present dummy would
>> need removing. That's only useful if an arch can be expected to live
>> with GRANT_TABLE=n even when otherwise feature-complete, and at that
>> point modifying the Kconfig dependencies would (imo) be appropriate.
> I agree. Let's proceed by adding the dependency in the KConfig file.
> 
> So which one option will be better:
> 1. depends on !PPC && !RISCV
> 2. depends on ARM || X86

Agreeing and then making this suggestion contradicts one another. Unless
the long-term plan is for PPC and RISC-V to not use grant tables.

Jan

