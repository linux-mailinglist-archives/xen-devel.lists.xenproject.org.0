Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E167EDE6A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 11:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634111.989352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ZZO-0003pu-IE; Thu, 16 Nov 2023 10:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634111.989352; Thu, 16 Nov 2023 10:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ZZO-0003oF-FT; Thu, 16 Nov 2023 10:25:58 +0000
Received: by outflank-mailman (input) for mailman id 634111;
 Thu, 16 Nov 2023 10:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3ZZM-0003mx-A0
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 10:25:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 859c2d7b-846a-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 11:25:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9633.eurprd04.prod.outlook.com (2603:10a6:10:311::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9; Thu, 16 Nov
 2023 10:25:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 10:25:24 +0000
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
X-Inumbo-ID: 859c2d7b-846a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIgN3eDVapxb9eVBLjdflWeLCqHfqNoeeFCpdFcAR7eG4rAro+hJxDqcwHmSmF3/pNV6PqyB4IaGnM6A5KOLTDqvWygHkocaf90CCSZdQrRoRDGRTqL25znpAmf7lUtr4KGk5NAXKzbW2yPNNCApLbZ3j/HmcovV/aLKxB6/Smr9f0BNAXBPrhQv20BscAJ8QyysrKGJClPDiu57vOjtUZ4iAffec1ZtLc7HgxXMtW3DnBtxkdrCyBIcB+RQmEJVffW/bOk8h85rc89AgSmAW5E22rsuJVIUcwsPYDXcapzQS8OYe4p0/y+Azrdu07LKMRm4k50koUuJhbT3kfV8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11NTYYc8ynzNr+TD5Q+eSd5YiRCqhuwxGSHS/BM615w=;
 b=WIGtwsAiws0C4JKXIMATzfk5gPaho/l6ovFyTnb/BTqi+S9KS1/uSjZFIoHUiV7xd6/vUAMRj+8dtSuMZsFK7L9k1UEEchXD9uqX3FLypx/ibI/3C5r/Z9eW5B+ArZwsoMrXF6zMixOl/aynb6SDPWK16ZNAm6ynUG6J0bZOjUdFk4Vk3OgsPyOTvUD4bHmdFR+3cu8nTOV9OaaJOZgCrh8b4dZeeLE+6ZAmpzl52ZZXHP7IBAbaXpHPXzxI21mkIZJVgaMd3uw++sG2nWhiOwjBcRNXXxoF5LG62RmRbo3WNkKVKA/so0mJTv7S1huMI1WwSeXO5CEDfKamNs6+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11NTYYc8ynzNr+TD5Q+eSd5YiRCqhuwxGSHS/BM615w=;
 b=RQJKJkpOGGNHtxuAdVU5m+UHGf+el1kvHjZQrZ0I0lvehYF8AdrCoZoY/qoXUAt/dWLsxYAYvT82AehsbSm/Rqtrz3fzXrCk6hm6HhGPkxQubXAZNu8iBoaVEhBrcBIdbq514b5DmIE5dnljo+l/w16VdiUkF2yJEvJ7pY7QpBS6gtu3lXhTAhbL5sLHmRQf2DMI1ojPt0UyEOx8sMnnpjHEi0TYWf3hRcviMVzK0/oMmG7qSdMI9k+HOMDFxmzlmYIpFvEHcGav+GpGcrr/HLBICJln/wVS3VOuCq4cSyZ7ZtV0UAjoCu16CB4tfIvDYXyOuN2WvgS9SX/AbbxwSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cbf6f0f-d5b1-44e2-9a0e-a9d7d353eb6b@suse.com>
Date: Thu, 16 Nov 2023 11:25:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
 <817fab34432c854ce585aba80db77f7c@bugseng.com>
 <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
 <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
 <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
 <6b6f051130b724ee6a813235e049354c@bugseng.com>
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
In-Reply-To: <6b6f051130b724ee6a813235e049354c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc6b36a-ce9e-4e49-7f48-08dbe68e57b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4BMxeyfsMPdM7lUvfSwJMfFqmy0p/gEoIw7JCdHJamOHNNPgii6w6jz+iTFY+FKvQQnIpKCOLoyMOGtx0CRgyxkZu26XETnW4Kw9oV5sKK8Ar8gYhgxRsmaj2XCjRV6gCiLaOGF5pTCaO09+6CgJO+zBIcR8obiKeyu/GC5EvE1+35ucUEG3PxNWy7kDDXhkAZGhO2y2twTTxoWVRtcHLd3fAN+3Pdx4lJKbFrQBpo1Id0w/nRtDhI/xsbNwo5pQNTmlyVg6ytkRqlLbq9WGQRiwD0nk1zS604CTDI8Kl5bGM0es0qRPpWHjkOx7s1s6rifcPw1YbY7NI8WLRMY8yMhgM1d76kcN7ApkuhkVWIRFE9rOifc3hxdXZU8iFP4TGHMQClqiuYPuhVscqAErfTf5Gmq7SCyBUrHaYP6ixXHCguRJ9oKu6mRzsUxwtCohURkVpvf8hGKMQAwFTqXqAZ3h4iht3iBCiXwA+598pOIN1eIIX0PoD1OPxKdZu9sLUj3xyhB7xEoQn86yd8CUvYuKRSo6GfeUaBM2MAiOW0azgyNtT/UdGatkyLESins4UF5wx2YiKjkvF163rbYvkvg4B2nHkS1yAWdTDatTGrTHHs/nsnpLsVFiQAfZoeZp5W/oWejNpxWx4Xkl+vDuyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(66946007)(66476007)(6916009)(54906003)(66556008)(38100700002)(86362001)(31696002)(83380400001)(26005)(36756003)(6506007)(6512007)(2616005)(53546011)(6666004)(2906002)(4001150100001)(316002)(6486002)(5660300002)(8676002)(4326008)(8936002)(478600001)(41300700001)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTcvcVA1V2p3cnVqcjE5SWsrYkNHZE9oNDY3akVPdHV4ZHNrU2U1TzZrS3k4?=
 =?utf-8?B?UmNoSExKSU44Z2hzRmRkTENPZDJzTkoyd1dCZEhiRlA0M1dzMHVEYVZocUpK?=
 =?utf-8?B?cUVmTmxYSDFQa3ZhKzJQM0FocHdMQWhoTDQxd2JuKzhLK1dZYmVUL2hSUDVz?=
 =?utf-8?B?bzVudXBLT3htd0x5VHNIM3Rja1ZlRXdBcllDMmljeFNSMUtuM2lHWDFrU256?=
 =?utf-8?B?SThEU3lEQVVINWhIUGxhMDZIK213cm03U3BzdlM3YVlFcnpxWXE5OTBnaFRy?=
 =?utf-8?B?THhMY1Nkc3E3ekFwOWswTlEwbnE5cDk0S1BENFdOSXlTbjIxUnZoRlhEQVYy?=
 =?utf-8?B?eVBrNHBtR2g1R1FNSExXVGsrRk9MdFVjcHRnUERaZFB6QTFVV3BmQzJ1TjA5?=
 =?utf-8?B?NnQzWXZKTFgxZkFDSGtjRk1zNTF6QTJNdjlCazhzT3RPZlpkQU42K2tlZ1pp?=
 =?utf-8?B?MXVXMGw0bDlSRWVjQ0NXRVVNcFRFRDVpaW92TmM2N0ZaT3JGYmRSek0zQmpn?=
 =?utf-8?B?aUxiT1VUVnJLQXAxU1VlNzdjc2JvRmlxL2FvT2k0OThySU1DWHJXUlJWNjRj?=
 =?utf-8?B?dHUyRW9mTFI0cTdJNEFDRFJEUjVINm55a2wwdFZZejVzc2pHbURnbTdTMC9Y?=
 =?utf-8?B?N1N2UDd6ODZxSThPalJSSU83S3hVbGY1SVdvKy9HQUZObzUrdS8vU05PTE1H?=
 =?utf-8?B?WTJKTFFtdm85dFZ2SDJpY05iUUM4Z3p0Ky9SWnFUVk9XcGVwaWxKMXZlaEUy?=
 =?utf-8?B?dmhLTDljSVVvL2ZxWWpuSDVUOTl6aXdTMGZraGU4cUE2YnJaOEpLS2JZU0pH?=
 =?utf-8?B?ZTZiZlRhOWlKenhXUUpVZjN1RWt1Wkc0ZGE4aFdESExZVkhqdmNFdXYwS3Fq?=
 =?utf-8?B?VDB2LzFEc014enNheWhqRDJBZzhzZnBhUWljTW9oYmdtTG1VcTlGeXIxbUpq?=
 =?utf-8?B?cURzMW1WTmZoU245V2w4WnhLM0JmLzBPa0lXb2QrLzZoLzFCM0ZsUFlyWGIx?=
 =?utf-8?B?Y3ZiaXlLcUJXUTg0U2t6d1RveVp3SFRnZStRdC9VSVJtMWIyaEFycW1jOExY?=
 =?utf-8?B?V3hQTzU2T2JKWjNVMTZ5NU41eWY2cTBmYjFlUWVWK0FRdHp6S1VyeVVnaDlu?=
 =?utf-8?B?RmZhRFc4djhPa0pzTU1zTGN2ZUZlbFdNcjROYlNIWG9BV3FBQnlRL3NzcXdD?=
 =?utf-8?B?cXgxWll1ZUsxR1d2QVZGMFQ1Qi9ldGc3Q2FpV0hNOStqRHo1L3doNExpSWhH?=
 =?utf-8?B?djVWUmlCbTZYc05COERvREJkUllDRm4wNGIvdWd5YlU4R1BCY01nYWhqbW1R?=
 =?utf-8?B?WnVxQUsxUEdBNmtJQWNEeFNtclFad3E1Z1A0RUVPZEdVeXl4dERmWGRHekpi?=
 =?utf-8?B?M3FBZ2ZhLytBQ05Rd1RnL3pvQUFDYXMzaFM2aUIyYXdWbW1SRXhIZExhU29I?=
 =?utf-8?B?S0diZ1FhdmFqb0ZsaHVUUGFsay80UWtwRjFpRGFnTzI0ZHBJUUNPb0JEdEQ1?=
 =?utf-8?B?MmhYODBLZDZtNUxoQkZtRU9qY0FFRW11a3cwZHN3RWhKOTVRb2FpS0o4c3E5?=
 =?utf-8?B?V0ZFb0RsNVR2QnRHekFEajNqK0JDVm9PczBaMDFlVjJEUVkxZEpJd3VJR3Z2?=
 =?utf-8?B?NElqM08raHljUFdmYzJLL0JIY0hVV3pldWg5TWVMeDBFOG5SNXhKUlZVQmpQ?=
 =?utf-8?B?LzNnYnVScTRVLzV1K1Z6b0ZkaUVjdWRKWS9FV1B2Z1VKZlBLNEJ2NWlNdTN4?=
 =?utf-8?B?cGZkZHJxWkxxTjM3Mmsxa3FhSndjZVZsMTFVT21vdUg3NnlKMmR4Z29OdmRv?=
 =?utf-8?B?MHZlakhWb3RXY2JtdEdsaFdleFMzWllvNWRyZGhvSERaZDM0QlIxcldsL2Rv?=
 =?utf-8?B?YjlrSFlqdE1PYVdTSFBtZllNZzZxeU1sTzBoLzhVUmFvckpiTzBWcHl1TmpY?=
 =?utf-8?B?bFVkUWR6OUJWdjNRakdmd1dZemhCUXdwdnFvQTc0QUN5TWloNmpWb3FTSEV2?=
 =?utf-8?B?WG5NeUpaSGltK3A3dFhmUDlNOVdsQUdlNjZZem50N2pFYXJOMzU1Ui8yamln?=
 =?utf-8?B?dk9JazVmbjBwdFNJeUF6NUU3NjJOYkFKMEpBQkMxdk12TjFQSUhrcjFlNVd3?=
 =?utf-8?Q?an7W7IVJ/0SVKD005bE/TKl+n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc6b36a-ce9e-4e49-7f48-08dbe68e57b8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 10:25:24.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHJUHummkQ7OyhXspmQx+4JUhazVxCR7XsgoIiKGSI8yDWQBN4tKn4E67YriH4Q52pGR+LmIzXBh2pJodK1aUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9633

On 16.11.2023 11:02, Nicola Vetrini wrote:
> On 2023-11-16 09:26, Jan Beulich wrote:
>> On 31.10.2023 11:20, Jan Beulich wrote:
>>> On 31.10.2023 11:03, Nicola Vetrini wrote:
>>>> On 2023-10-31 09:28, Nicola Vetrini wrote:
>>>>> On 2023-10-31 08:43, Jan Beulich wrote:
>>>>>> On 30.10.2023 23:44, Stefano Stabellini wrote:
>>>>>>> On Mon, 30 Oct 2023, Jan Beulich wrote:
>>>>>>>> On 27.10.2023 15:34, Nicola Vetrini wrote:
>>>>>>>>> --- a/xen/include/xen/macros.h
>>>>>>>>> +++ b/xen/include/xen/macros.h
>>>>>>>>> @@ -8,8 +8,14 @@
>>>>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>>>>
>>>>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>>>>> +/*
>>>>>>>>> + * Given an unsigned integer argument, expands to a mask where
>>>>>>>>> just the least
>>>>>>>>> + * significant nonzero bit of the argument is set, or 0 if no 
>>>>>>>>> bits
>>>>>>>>> are set.
>>>>>>>>> + */
>>>>>>>>> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
>>>>>>>>
>>>>>>>> Not even considering future Misra changes (which aiui may require
>>>>>>>> that
>>>>>>>> anyway), this generalization of the macro imo demands that its
>>>>>>>> argument
>>>>>>>> now be evaluated only once.
>>>>>>>
>>>>>>> Fur sure that would be an improvement, but I don't see a trivial 
>>>>>>> way
>>>>>>> to
>>>>>>> do it and this issue is also present today before the patch.
>>>>>>
>>>>>> This was an issue here for MASK_EXTR() and MASK_INSR(), yes, but 
>>>>>> the
>>>>>> new
>>>>>> macro has wider use, and there was no issue elsewhere so far.
>>>>>>
>>>>>>> I think it
>>>>>>> would be better to avoid scope-creeping this patch as we are 
>>>>>>> already
>>>>>>> at
>>>>>>> v4 for something that was expected to be a trivial mechanical 
>>>>>>> change.
>>>>>>> I
>>>>>>> would rather review the fix as a separate patch, maybe sent by you 
>>>>>>> as
>>>>>>> you probably have a specific implementation in mind?
>>>>>>
>>>>>> #define ISOLATE_LOW_BIT(x) ({ \
>>>>>>     typeof(x) x_ = (x); \
>>>>>>     x_ & -x_; \
>>>>>> })
>>>>>>
>>>>>> Hard to see the scope creep here. What I would consider scope creep 
>>>>>> I
>>>>>> specifically didn't even ask for: I'd like this macro to be
>>>>>> overridable
>>>>>> by an arch. Specifically (see my earlier naming hint) I'd like to 
>>>>>> use
>>>>>> x86's BMI insn BLSI in the context of "x86: allow Kconfig control 
>>>>>> over
>>>>>> psABI level", when ABI v2 or higher is in use.
>>>>>
>>>>> I appreciate you suggesting an implementation; I'll send a v5
>>>>> incorporating it.
>>>>
>>>> There's an issue with this approach, though: since the macro is used
>>>> indirectly
>>>> in expressions that are e.g. case labels or array sizes, the build 
>>>> fails
>>>> (see [1] for instance).
>>>> Perhaps it's best to leave it as is?
>>>
>>> Hmm. I'm afraid it's not an option to "leave as is", not the least 
>>> because
>>> - as said - I'm under the impression that another Misra rule requires
>>> macro arguments to be evaluated exactly once. Best I can think of 
>>> right
>>> away is to have a macro for limited use (to address such build issues)
>>> plus an inline function (for general use). But yes, maybe that then 
>>> indeed
>>> needs to be a 2nd step.
>>
>> While I've committed this patch (hoping that I got the necessary 
>> context
>> adjustment right for the 
>> automation/eclair_analysis/ECLAIR/deviations.ecl
>> change), I'd like to come back to this before going further with users 
>> of
>> the new macro: I still think we ought to try to get to the single
>> evaluation wherever possible. The macro would then be used only in 
>> cases
>> where the alternative construct (perhaps an isolate_lsb() macro, living
>> perhaps in xen/bitops.h) cannot be used. ISOLATE_LSB() would then want 
>> to
>> gain a comment directing people to the "better" sibling. Thoughts?
> 
> Having the users in place would help me estimate the remaining work that 
> needs to be done on this rule and see if my local counts match up with 
> the counts in staging.

By "having the users in place", you mean you want other patches in this
and the dependent series to be committed as-is (except for the name
change)? That's what I'd like to avoid, as it would mean touching all
those use sites again where the proposed isolate_lsb() could be used
instead. I'd rather see all use sites be put into their final shape
right away.

Jan

