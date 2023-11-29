Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F57FD517
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 12:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643824.1004371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8IRd-0008G0-S6; Wed, 29 Nov 2023 11:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643824.1004371; Wed, 29 Nov 2023 11:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8IRd-0008DZ-PO; Wed, 29 Nov 2023 11:09:29 +0000
Received: by outflank-mailman (input) for mailman id 643824;
 Wed, 29 Nov 2023 11:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8IRc-0008BA-AP
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 11:09:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28353c2-8ea7-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 12:09:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 11:09:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 11:09:22 +0000
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
X-Inumbo-ID: c28353c2-8ea7-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvOPzws7wYunGbHQBCPKXYUYuysJIZg4rQ1mFqmrJTZ2cpS5OqlNaR8Rrn4TafvXkY6yO49cWD0egOOGbx0FoccN8dDPL44fPU+mJlK1+uAP4Ijui/4QP+KXU4auwTlFBPJcQeD2GEtBjdeI++B3qmS5Os+BNJV9JezHZ/rmegGy6PA/jQIp02+Pt+V7p45ahjtOJDfEKWe+DcPgztW2AMCjLhcPvSnxdWp/1q/qoriduxL8MPvGS5UPQhfhStCU8hbOfOwW4zq/hxh4i92h4VWKThdoTyBuumGXAIJzG3NMpd39LKFCdjNSJnXhRtg1nUwyXrMciYy0GcvocnBt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Th0IQ8i31FurnE2amFDWmXurFqs9R+EX8R9gdEHbNw=;
 b=ZLtRJ+FJG2LzVA/4TLXPgSqe7L5lPO7M6Z39H1RJ8C/uK0xVP7cyV+C+RL2qRsEDMAdpA/asEVEjkursx7CAHOxpmq+LM9+6BEqP0CXAsrrT+cd2NjmqnyoGJzgr49ocgVm68luFygHzA7oOMZKAJP9JhwwLv3/wzEYj4cRCG53VM4QhdrrSgNEBFY7TMoho8pJEpStO9cI2bnAeeq4UKhqcqX14u3gvyqa8+UNRfHhhJw1De6SyYBeb7qcyrycHjUhqtfLqBch5zlWv0ur/OmRggkkwb+sa3SDyiNwRrbABTGzPzbrqU4MjDhq/SQcs6/0G/a1nZ6ceIkWNK5W/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Th0IQ8i31FurnE2amFDWmXurFqs9R+EX8R9gdEHbNw=;
 b=KEtT3sioJs2aG4BfFHEvWaWTPyGeTNmmIA6VyIBj/1xmVhnstlbh1395kgA9AsevWyaVND3lQ+350Os0Xo9Jmyz0M5O/gE/5QkQ4HuyJx2++sXYxiYkl9DTx+Qgj3Y7md1mNY2FyehawWZqunO3mGUwhjQ+Ri7D5lpAjB9yk3aLo97lFmVJb33d201Snunyp8uxY7npJJ8fV8jDrgbxUcAXkOPOCHeVzX4sg0gi/bnxL7rkVksxSqH7PuJHV3iSu80YOq+7FC8ZlDMONrPcmkMMbrnXyE/Cqyac4524xbVuk1nRbMAsoeV7y0BOQUoIXx0chmf21tw86T+969hBGXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b418a851-35ee-4df8-b4b6-a37bea415b03@suse.com>
Date: Wed, 29 Nov 2023 12:09:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
 <4f09cc01-3975-4c2f-960f-67f3ac1f53a4@citrix.com>
 <74748681-dca2-437a-a438-f0a6294ea8e4@suse.com>
 <a1b56fe2-b19d-4ecf-ae10-df7f3d911e47@bugseng.com>
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
In-Reply-To: <a1b56fe2-b19d-4ecf-ae10-df7f3d911e47@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c28aa31-e005-48aa-c222-08dbf0cba3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8DpHIIcqNqX2gz+iPq2HmForoKSmzPPqX2STEvmwCCZbMnMJwjJs9kPMUjrtBRkZfQV09TBgRQ41mcHuex+2ys0ysfEeqYGD23HcKc9MlkZ4mW0N3voUuhIURIYfLad4foe/gqBGpr+P7tS1aqcIdeReFEdivHoCcHpqQebi3PPFRQt4ULT334FYoMHA9lZ05gRmxqfskSzMARyh4MoL0CgREouLDM+1O67WaDeVSK04j3lck/DiXOjKdSzwl11S2vgo5DfPhniZ3iinifDk50H0mv8JR7j6gjQD9CEWh2osebZKVyveeV8a9Csu3s0EYTRc0KBVW23m7Wj07LhdF0xkApKKksuTAb1p8jwzNENkj/6EX3iRGh5uiBrTGhMwN/fPwHyU2DME1/hdj5dRZLe9xOR/23MAbRyG6eQ7M9f8N7uIoI2PJmjrgZ9Z/Qa62hVZ7pcJpM3Kak3/P/zb5Ywy4xrqA2/lvKvvzcDjpU55Juai0U2/YE5XVDX/11srrXsO0+S+JqM7nUZTES6kJa5kbfYyrzEgxr9T94EejouOCJliymE6B2F9vzhW9CmVZ3RiuspfNeDmxQ6N8GAhsr0Ze5FpFlB9hMK5c060WPGoWVLeILC44b9ebJCWA43/TQseW8kLQJK2FOx3+cziug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8936002)(31696002)(86362001)(4326008)(5660300002)(36756003)(66556008)(66476007)(6916009)(66946007)(54906003)(31686004)(4744005)(316002)(6506007)(38100700002)(478600001)(6486002)(2906002)(8676002)(53546011)(6512007)(41300700001)(2616005)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elBldy9mbllxb0lKaTZzd0JPMzRvS2RmeTVMbHg1UnpoUXg3M2pmUmRaT3g4?=
 =?utf-8?B?YkVpbnQwSTdmbjlUalRjMk5WM204blZHNW9JRjVRSlIyR2RUTmQvR2tzQW00?=
 =?utf-8?B?Z0ZXd0c1Q285YnJDcytoOXRleU5QT3krUm1BbTZmY0ZXT3pUNWJHOWFKOE44?=
 =?utf-8?B?alN5Qk5NRG42SWNJR29qcDhHTE9HNU8zRUNDcUxWZkQ0TzU2YllsMVA2Qnk2?=
 =?utf-8?B?UStGYjZHQlg1RXAyZDJTTWhGMXk4T1hOUFZsZUI4dHFOVm1yQkxjZmx6M3gy?=
 =?utf-8?B?emZIczlxMmpPMHo0cGx4RmIxcnRnTXoyY0l2V3JoQ2NLUnZMOHBzeG4vaWVx?=
 =?utf-8?B?WmtYWWNCcFMzNmQxT3F6amZ2akVIdXA0cGQ4TkQvdWlQaWIrZnFickFsckdt?=
 =?utf-8?B?WmZobkFqZitQdEI2N2daeGp6OFlScnUwdW5mM3d6QmNSOHVGR29lOURmZlN1?=
 =?utf-8?B?bmJvR2NEb1RJbGtKczZaRW5HcHFpYWN2VW1KTFcyeEYvdC9DdDZWeXFDd2ho?=
 =?utf-8?B?bFZDaFpiZWV3eDN1K3g5RzN1M2FPVG5NVHdJUEphZWVOU21QU1lZWG16bFEx?=
 =?utf-8?B?OXpxVXlwSEFFdXJzYjFFMjM0WTlVeUdDS2pQY0RzWlFqZW93d2IvVjNUeUZ5?=
 =?utf-8?B?OUdSSEMvbFYwQkg2MHkvbk9wMzRNSXZvbW1kWFpIMVllSk9hZHRtTlRVSHlK?=
 =?utf-8?B?eHY3SnNMU2FQR2Vsc3MrYjVpL3hMRGgrNURvejUvazIza3FzekVLaWdCWTVM?=
 =?utf-8?B?aFNXcjYxUFJtS1F6d2xVb1RGMjIvQlNCelhHRSt6Zm9UMVpEYzNjNjhxZzBB?=
 =?utf-8?B?QVRISlhwTHpTR2RyRU1vQnk4aVFVRURFTlFYOS9vVkQ4aG1BK2taV21wT1ZZ?=
 =?utf-8?B?Y2tsaW9nTTJMTmZJSGNvVGRrdE1MM0VVbmhDKzYwVzgzSjBHNGRXc2dyZk5u?=
 =?utf-8?B?c3AvZHZ5VnArVHJ4MVBTSXd5aU1NOFgvQkJXUkFYVEQrcHZEWTc2Q3J4N2ZK?=
 =?utf-8?B?ai9RaDh4bk90bCs0SGZzbWZTWVo3aVh0ZmtKUENFcmZUYTlLYkFINlFDMjdv?=
 =?utf-8?B?WTFCdThsSnlmSlgzRzJvdm9Pemd0dEt1a3pLU1lGZnlIOSsvMzJReTRldUdO?=
 =?utf-8?B?Z1BraHIrSW53c2dCbGdWVDJ0STdYSTlTTk9RNzRXWlg3VXliYjlMTWlGdHUx?=
 =?utf-8?B?OU9Ia0hBT0k2bXhaTndsMWFkcHgzTGpIVUNLd1pLWmZxaC82NXo3Y3NZWXJH?=
 =?utf-8?B?VTJUaFU4UXpTUGZuZUtmVTFiSVBCc3FlendaV2RYeUQ1akFMUWg4ekY2QjJt?=
 =?utf-8?B?UDBpSTJLRjlTRzVkSC9GWW5lRzl1OFJ1UmlhTTFVWW1kK0RXYkVISmp6eVk4?=
 =?utf-8?B?L0NTVXR2QlBuTGNVNXBDVEhoUlZ1Ri9PYjQzcGQrdTQyVkZic0NzRWtoUWVy?=
 =?utf-8?B?cTQ2aGV6NTFzZlpMdndrdDgvc2NwTWcyMEN6ZllkSDdWOGJ1Zm9Tclh3UXZT?=
 =?utf-8?B?QmZ3amRNUTJENGY0S2NqZmx5UlN0RmJyRmZhZGZGKyswMVptRHEvbzVJL3BE?=
 =?utf-8?B?M0c5QzdaQW00aVVqZkNaZnRrVG1ibi9wcllFZXJhV2NjQlk3am85UW5NQ2NC?=
 =?utf-8?B?c0krbUJ4Q25KRGd3bWZsYzFncVZzbmkrdVJSSTBwQ0lLZFcvUlNpYW1USG1N?=
 =?utf-8?B?YmgrSnkwekRMN1RCK1FmN2lyalllUEZBSll1blRkaGlzMW1ja0NCazdaK2VH?=
 =?utf-8?B?Y29xTFJkOHBJd3BFRWU4ZlJLc2UreCs5VWViZkJjNy9tUS9LalZlK1AwejBN?=
 =?utf-8?B?UEgybnJIUlVjS0t5djZkWXo5ajNLQ2lBUUtzOTE5YTlOS1Z3eHNVdDk1UnlR?=
 =?utf-8?B?aTRXWkdyVFVKWjdQbzl6MVNtenNWRTBHUDNOa3I2ZUF2ZHRuaml6NUxIN1VY?=
 =?utf-8?B?bXFEWTQwYVJzMm93TFE0QzFDby8wM016RVVXTUUzK05MYkVRaS81YzlaT0dQ?=
 =?utf-8?B?UERTU2pkaXVZMTQ3WmNLK0ozU3RtekJUTXBydjFWODlOdm9nbk1WdHgzR1VK?=
 =?utf-8?B?VldVRDNtalhZNkJnUFhkb2VOY1VvL1ZYRzlWWWZudHFpMWQ2TXhiaHQ0Z2l0?=
 =?utf-8?Q?/UjkIk2aaUityvNrRVnKKIW6A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c28aa31-e005-48aa-c222-08dbf0cba3c3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 11:09:22.0630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CosHQvmCPn5zw4EaFZdlcb5bQIuVzgtqLw7YVIhH+Uj6d3Q/0jyzQXfQejIfeaLYCI1ntQcga3eEF52FbQRUbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

On 29.11.2023 10:35, Federico Serafini wrote:
> I take this opportunity to inform that we are really close to the end
> with Rule 8.3 for x86, this is the situation:
> - do_multicall(), Stefano sent a patch;
> - guest_walk_tables(), Andrew will take care of it;
> - xenmem_add_to_physmap_one(), this is the last one.
> 
> For the latter, I see you (x86) share the declaration with ARM,
> where "gfn" is used for the last parameter instead of "gpfn".
> Do you agree in changing the name in the definition from "gpfn"
> to "gfn"?

Yes.

> If you agree, do you have any suggestions on how to rename
> the local variable "gfn"?

Considering its exclusive use for the XENMAPSPACE_gmfn case, I'm inclined
to suggest "gmfn", despite this being a term we generally try to get rid
of. Maybe Andrew or Roger have a better suggestion.

Along with renaming "gpfn" it would be nice (for consistency) to also
rename "old_gpfn" at the same time.

Jan

