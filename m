Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4484800936
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645462.1007619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91FK-0005fq-7x; Fri, 01 Dec 2023 10:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645462.1007619; Fri, 01 Dec 2023 10:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91FK-0005dT-4c; Fri, 01 Dec 2023 10:59:46 +0000
Received: by outflank-mailman (input) for mailman id 645462;
 Fri, 01 Dec 2023 10:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r91FI-0005dK-7a
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 10:59:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baafe9ca-9038-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 11:59:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7560.eurprd04.prod.outlook.com (2603:10a6:20b:29d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 10:59:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 10:59:11 +0000
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
X-Inumbo-ID: baafe9ca-9038-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3AAtz2hqnY1C3BE5w+4b42cayO+PgnqjZy5QqO0abUcBlUzwkR6jEr9t8y/w/bckJ3a+VzrAHkRnGV+vKrQfhtogUh+sgnTW5wXSJ1JNRr3p9r7q9js6fB7Y6pIJe7OR7NtahiQ1hBHQ8cFvHgfnRPCCGNovybKYXyKelZxnQRzOpj7JFpq4bEf+I/USrUIV6VvelwHbUqhckYVkmqPpbICXhnkJOsdOA/oc/1EolVWCY2WhCOs25RKDUsq+C7wloi76S7Zz/h6vBjZ4a5HlpBwZ7PFfR9pYvdoHizZo9o6uxEsFbZKS/TtzBGC5aouo7MAbpu0f2Zk615ZHtLIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rch61Vp+nHgQNcu/w9wNxu+6cDClod/OExtLq0kBudk=;
 b=X/TPN+uOtsqMkvSST3dvQUfMPTzCfGIOBff6eR43Ou/MEAqvZV4hbUZQEtVUExG5whLE5Fb7czQk50Jeqpk1sjLPCKx6IucjJaMTtiRHATToqQY/Xc1A6pmd+2l9Zp+P6OOHZrj5vpqUHfXq9WD+DnZen0WouuszmQhPvoeIyu8QRTrIl+y5zvqW8jaNa/86H6zKq8IxF/gUP3V7Z+jR30m08JrkTBiQje6vjldPoPymoRTB4ypkxGHTbxH/Vqd31WuG2IIY/PzMy+8ClYSNPjSFcKrh4GCPNIXokqNJPrHcgNVBhdCfuIJu7bNKT+70yboZWpCqP7vzujZSNQxCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rch61Vp+nHgQNcu/w9wNxu+6cDClod/OExtLq0kBudk=;
 b=z8TJ/RzrVMEN2i+kAu2mgrdzyu2MaHy/UURFAY7fm63k+k/lgg5TOyGlbO/Iq6HtqfJh+JU40rxCt2XaLYahwwxsn3JeqLbF1xt5C2KX+w77KN+TtXW53L4zmNKTgsOKyvog9O9ZEZhitwrHji6kjjeeHOLYzn+FfnBisKa4YbwPnvADfPHZ/7SOzJsAUJnGNWu2wPVPZu5dpL9w8SJWPSe7XaWyQja6w4YqF4hFydmiDyRXrxZxEpxKVrABQFfZYtW2uOepD65ZOfaYM60n9UnxcRS0yQEKn2nfNjZvgoowfU3ACUpZCBKY6IbbE35vhtHvyNgVsXYBvcEQNJZQwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15fb0b37-da9d-410c-ae02-872dd45cd327@suse.com>
Date: Fri, 1 Dec 2023 11:59:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com> <ZWjIX0Jo5gW5SEDr@macbook>
 <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com> <ZWmeV-y5RpGAG5cS@macbook>
 <0d9bc0cd-3719-4961-ae7d-3e27508000a2@suse.com> <ZWmzo68abRmRtfwN@macbook>
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
In-Reply-To: <ZWmzo68abRmRtfwN@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0406.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 7214d132-9c12-43fa-556d-08dbf25c8c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hfTQlEc0cjLldhuW3gDM/nMfIgwksEu+RiAnsHm4LXO85yndiD5qPB/tCAHXc3nYdgCWZp3FuDsddbAvXmAY6P630IrdMfCtQKQX1F+lrKnoTIJG5YOBRjzWOvnhB6p3WljPNpRv+i78UleqV9ziedg0x3OQ5+IrtaZWHAMUq9vURY4eR6AdnkaLIubi43/+Lba5v5EFq+LGdzzMRWWxSB3AkPMhA7YKy7mTwuV/oqanZ9BajYqNesUQUkenMmSLPgGduqhFAhjyS4ZyRKrHwcLKknZI89yLkxoQrrzuTZ6/ibPf3uZQiYW3k5PfOqY6+XPAWXezRID7bAGtzt1TQCIQ9XnWA6PvbhN8nJpNsHh4atCs3bv7GDVX9qIcl1Cese5MjcQGBGYsUtErKAlf6AjC51l3MMVqRx4sMmQEVEDlon2ApIwcoI2jvjm/JawipHAFqKtmhziJegdR5bkO9p2WBDWenzev1GuWCG+X22iIRg3KGjOpby8dTofqRo5MA1erQ5zClGhU6OiWEZ7ihHB52lJUWLksb4WEPRZCO+xSZscgkzSu72SiZC/9Rve2G9Xyar5XZpKzmlbUl038I7sZewG/eT16TVSuQVkj5SdGm03hrD6v0DlYdxJ987TGsj0uvHkdEKKMZ3tz0E3rpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(8676002)(86362001)(38100700002)(6506007)(66946007)(54906003)(66476007)(66556008)(6916009)(31696002)(36756003)(316002)(6486002)(41300700001)(4326008)(8936002)(6512007)(508600001)(66899024)(53546011)(2906002)(31686004)(83380400001)(26005)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1VYRXg2VzBwT1VxSVBRNEgrYmVJVGxvNUNvMDlHYUJyMXkvOCtXN0oxZjdS?=
 =?utf-8?B?SFhYbFA3SWwxa21ycXVNV2RHVVE2N1QzV040QysxWCs4WmhoY3lOOEZWMTEr?=
 =?utf-8?B?aVJlbmswaHVlK2gxQmlSTjdVdy9OR2J4RVNQMmVLODJVMWNiS0J0NWkxUk9a?=
 =?utf-8?B?WW1SaTVxQUZGaG80SnBkcUI4NExsajA2NVZ3QkZ6NEtTZVk1SVJ2OHdNK2Vw?=
 =?utf-8?B?cG5wc3ptS0JqT3ZUdjRDWXVOd24rN1R1MGIzNm13RmZJRWdPSE5KRHFQSlN5?=
 =?utf-8?B?K1V2Tk56OUxRUnlCS2xTSk9yUk5xUWozdHhBc1VlRTFicUY2RTh4bFh4RWIw?=
 =?utf-8?B?YTF3RUkvNUxXYWdIWGl3Qy9XY0gvU3dLTTlOWnM3VUQ5Nk1vWU4yb2daamIy?=
 =?utf-8?B?MW1TZTNBbWtDR0wxK3VRcTNCcHdodWdVWU9qMHBENlRUQTZSSUZ5YUJPOFg0?=
 =?utf-8?B?dm9VU1l2T2RrcFlML0NaTUtia2pSdU1jb2xJOW5hODkzQTRTL1lLK0htdXo1?=
 =?utf-8?B?RFcrZmdweXZpaERkc0d2UlZxNlY2RXV0Y1UxUStuMWlHVHdTZVdvNExscysx?=
 =?utf-8?B?dVNWa3AxdVAxUndMeGx3cG1CcDdTQXhPcHpZOTBSZ0xLQmNHMzdZeWg3UGdu?=
 =?utf-8?B?ZU9kaGJpSFFlaTE5OURtUXkrTkJpazlYczJUSG1TODl1WitFNGhsOGdGUmU2?=
 =?utf-8?B?ZGV1d3RXNnNLbVpxYVFHa2JVU2xycHhLZmt2aHU1YWhNVG1HSWpHMUJ0ZlJ3?=
 =?utf-8?B?YkZ1ZGc0NU1JUHZjaHhUU0hTRytlcWhicmtvSFhUZ3E2bzRUUVoraDJ3aExH?=
 =?utf-8?B?Qml0d2ViOVBEaS9CWnlFbTlZcWJXVzlJSVphMWFDdG1xNXErcnFiVU1ELzJ0?=
 =?utf-8?B?TGdBN29xZUswdTQwSVRxYisxS2VrOFVSM2FkYXJYUVRld1FRTzFJdTRoejRl?=
 =?utf-8?B?YjB3NDZXL2FyOHFTSnVDcWlBaEc5N1FTVm5uU0c4NXYrYTVGSVZWN2thaVNq?=
 =?utf-8?B?Z2FxSlo1SWdUKzdEWTFka1B4Q2NnWEtzaHppRjd6RlFXYXZsTDJxcmc2NUxz?=
 =?utf-8?B?T1B5K3QvL3kwZ0p1WVNIUkJsamp0R1pMdklOamdnRW1pV3NBMVgwbjB4eDhJ?=
 =?utf-8?B?MzY0ZGZiR013Y0g2UU1LR2NxbER2TlNNQjB2c0tBWW42NWltQU4reUxhdjFV?=
 =?utf-8?B?RmliMTZTQmxucU01YjJtT0FJMWZEU2g2VGJ4dkM3YjZpLy9UTlg4M2VYeG8y?=
 =?utf-8?B?a0l2UTllVG5LeFo5SVpYV0NlRlpzM1ZPK0wvaHJ3Qk5YYW9DNCtwQ1dnMiti?=
 =?utf-8?B?RmJBbU5XWTlLSTVVSmViN3RiTWNQRlIxbDVlSUZCMFBVKzRrK1RqK1krUmdw?=
 =?utf-8?B?SWYvcUtMYncySmVROEx0MktZYXdSeHpPeEttR25DS1d4WHBMOVRLRVJ6ZmZh?=
 =?utf-8?B?OXFFYm8vMlZQelRoUGs4M2xpL05YZ2Q2QTN1bFFWY0g2QWRPUUFCa3FaZi8r?=
 =?utf-8?B?bW55TFBsdk1TY1hrUXBWS0xKZUd6UmFYOG1xZDhZZVp1U2VUWE01dlZ0aWdH?=
 =?utf-8?B?c1RNQTRLRFpNMVFMTW5IZytFYk4wOUdtL3JZWkk0LzhCa0RxTHp2dFdiN0J4?=
 =?utf-8?B?TkpwbTUxSm0xL1B4MDczUlRLM3U4c09EazAwbWV3QkE3V2M4YlRTb0NSbklZ?=
 =?utf-8?B?SlZTSTBGcVJtMlpuVnlEamNjaEVjcE1lVThrZzRhWXljNlMrSXFvanBEb2FE?=
 =?utf-8?B?THBFVllOU2pHTnkxQlZFT0MwN2NISVFZYnBKRDQ0UElTOXk5bVVkc1I3THNV?=
 =?utf-8?B?SjA4UHF1Nm9lZUIyTWRQc2dGREN6LzFRZllQclg4U2RxakxRV3FxNVZzdFZM?=
 =?utf-8?B?WjZ3anlRNmVMMVZLdDA1YjNIQ21wRkRXZWdrKzVQeTFlNEZ5WFhyOTU3TFli?=
 =?utf-8?B?a0txQ0pOYU50OC8yc1NFUy85cUxOdHdqQmdnWVg3aXFmbHZmOWdmbExzZ3Fv?=
 =?utf-8?B?VWEwVE03VmhOTzkxQUp6bUpOeE52a2FrRXZRUDVLNnBvWTY3cEljTXBJa0dR?=
 =?utf-8?B?ZWszNzlYM2dzb2tvTWZrL1ZnOHF5YW5NdFFQSGlKVlQ0ZUFJQjh3SXRGZHU2?=
 =?utf-8?Q?47AdBqcFWFnTC+L5ExG6dllbQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7214d132-9c12-43fa-556d-08dbf25c8c8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 10:59:11.4029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5BuF/mjzMEFh7RBgHNKes1KmbhTLGWvcbdBKwmdgOi6ttqxyltogFAL7AeGrMecZf389QqLFLLzTyg+lsEszw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7560

On 01.12.2023 11:21, Roger Pau Monné wrote:
> On Fri, Dec 01, 2023 at 10:41:45AM +0100, Jan Beulich wrote:
>> On 01.12.2023 09:50, Roger Pau Monné wrote:
>>> On Fri, Dec 01, 2023 at 07:53:29AM +0100, Jan Beulich wrote:
>>>> On 30.11.2023 18:37, Roger Pau Monné wrote:
>>>>> On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
>>>>>> On 28.11.2023 11:03, Roger Pau Monne wrote:
>>>>>>> The minimal function size requirements for livepatch are either 5 bytes (for
>>>>>>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
>>>>>>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
>>>>>>> depending on whether Xen is build with IBT support.
>>>>>>
>>>>>> How is alignment going to enforce minimum function size? If a function is
>>>>>> last in a section, there may not be any padding added (ahead of linking at
>>>>>> least). The trailing padding also isn't part of the function.
>>>>>
>>>>> If each function lives in it's own section (by using
>>>>> -ffunction-sections), and each section is aligned, then I think we can
>>>>> guarantee that there will always be enough padding space?
>>>>>
>>>>> Even the last function/section on the .text block would still be
>>>>> aligned, and as long as the function alignment <= SECTION_ALIGN
>>>>> there will be enough padding left.  I should add some build time
>>>>> assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.
>>>>
>>>> I'm not sure of there being a requirement for a section to be padded to
>>>> its alignment. If the following section has smaller alignment, it could
>>>> be made start earlier. Of course our linker scripts might guarantee
>>>> this ...
>>>
>>> I do think so, given our linker script arrangements for the .text
>>> section:
>>>
>>> DECL_SECTION(.text) {
>>>     [...]
>>> } PHDR(text) = 0x9090
>>>
>>> . = ALIGN(SECTION_ALIGN);
>>>
>>> The end of the text section is aligned to SECTION_ALIGN, so as long as
>>> SECTION_ALIGN >= CONFIG_CC_FUNCTION_ALIGNMENT the alignment should
>>> guarantee a minimal function size.
>>>
>>> Do you think it would be clearer if I add the following paragraph:
>>>
>>> "Given the Xen linker script arrangement of the .text section, we can
>>> ensure that when all functions are aligned to the given boundary the
>>> function size will always be a multiple of such alignment, even for
>>> the last function in .text, as the linker script aligns the end of the
>>> section to SECTION_ALIGN."
>>
>> I think this would be useful to have there. Beyond that, assembly code
>> also needs considering btw.
> 
> Assembly will get dealt with once we start to also have separate
> sections for each assembly function.  We cannot patch assembly code at
> the moment anyway, due to lack of debug symbols.

Well, yes, that's one part of it. The other is that some .text coming
from an assembly source may follow one coming from some C source, and
if the assembly one then isn't properly aligned, padding space again
wouldn't necessarily be large enough. This may be alright now (where
.text is the only thing that can come from .S and would be linked
ahead of all .text.*, being the only thing that can come from .c), but
it might subtly when assembly code is also switched to per-function
sections (you may recall that a patch to this effect is already
pending: "common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly
functions").

Jan

