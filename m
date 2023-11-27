Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2F7F9DEA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641936.1000974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z8R-0000FK-Rv; Mon, 27 Nov 2023 10:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641936.1000974; Mon, 27 Nov 2023 10:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z8R-0000Cg-Ob; Mon, 27 Nov 2023 10:46:39 +0000
Received: by outflank-mailman (input) for mailman id 641936;
 Mon, 27 Nov 2023 10:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7Z8Q-0000Ca-QR
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:46:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d53ce9c-8d12-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:46:37 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9347.eurprd04.prod.outlook.com (2603:10a6:10:357::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 10:46:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 10:46:33 +0000
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
X-Inumbo-ID: 3d53ce9c-8d12-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSGOndY5/81GeY338cD/5BpTEFjlmU3DF+IiTbP7jGRulEGNAUYaEljZjFY1oQptpX4jblhiOzhVqE3YDfym3NdVIUAaAN2gCqOFVLB6zJSpbWlJc3/Wp/6KeBCx91K/kiLEOu83Z6nZnguonBUzj1NdFl/ji6HDUTB2+B0TcaeZu0X1WVgeSrIZyw4uOfz+v8F0Wm7uSlcF9pgMwIJIkH+MM+lqLLLzbkMhsGw4XNdtItKi656pPMYoS/3Hk2jjLkTE2aF5K1NCE6XDvJk1ECX3TQnLbNp5cc8f85TRE0OXMLIaMQJhYgV+wnfJoYUnBOLSOCiJ6+6hh/v5iIcbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3F4Z7GcJNquQVuGDzotKNtGtAraWw7HhIc6dlAURqE=;
 b=RIe+ldkJeWwfBIZcUuigS58fDbFREhlQtogKAvIe8fvmSUuNnJwYu+7BW5DkUSmuj1ehXxNkYr3inHqUeSyw3WYRrFQ2jxD1m+OIpq90/OALXwDgqbSJmNZ6xp+wN8kX+2IBHViFx0T8U4NVyRQN2sXc9oxetDl8GoOX8PKH4Uqi6/WWZvR+tiFHFH/GmiHZTWmnXgBqvWUO56N9cXDexAql4SpPnZOGwKkmWYy0Ga7b/0lk93s/8x3fBjPlHlLH1LMRftIXei9+qx+kE4nFyvaLy9b44nYpM/wLhYd/TzQoD9TtNZaMKQU5RAkWbqEmMLEsw5T0fW1iVs+kbVN4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3F4Z7GcJNquQVuGDzotKNtGtAraWw7HhIc6dlAURqE=;
 b=e5ZL4hJb5dhLeu+pyDK4+Lykf95uesWdIQUtUxVd4PyIf1a9jjt+k4VivB7Ojoy4kXODZsF/BMF7tJzwR+4gedt4kpYHFAS9FOSs8evxMMnwipfW8bVh9aYtOemOmTrV/KEwgGCifiKoB6jr412mFbvp/9MdlTxr0/xvVI/xZPxTk8XzYupUheuMtpFs16w5nEUHULZJTy2ubmcpemSwLLIeMLhg6Jr9VitGPD8wpFg42wokYPhk4o0h29wkAOhy2itwj6o37Xx/DhAqrvsBUeGvFdAQEpEKGEFB2DHEoxkQyRSFghgerfih+7MG2SFoanPNAww36nb+JBeDe9eT0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec587cf6-088b-4142-8067-4d9d67fc58c1@suse.com>
Date: Mon, 27 Nov 2023 11:46:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/arm: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f5709a8-8585-4029-f9a1-08dbef361f49
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPaPIDp2o39ig2/M63dSmdZl9+qbk0l2uQTvTq95DxJtbawxvSBlGdDROQS8YMvll3u9PdddkrRopcXOptPawtp6zIh3kr9pDlYMrm5pjwSnado/DMEcArUTPj5wmgb9scsWvss+WL/K0MChtvGXQcllErnDSNIUuhFaPe5wRTX3rj+8QeMuMs67mzCepcMVQGM0eHKclWLZe5/QZcDRtfHe7H3GQNlYWDZVtARdjplpQBHOdhJlZ7qDBgoKdFszYOk4XjL5+50H/HKQmvLzuKW7Qjgcr1kDt5aeuY9cUNGGXhn7EupTdtbq4SbhX7lOb4xCKyYtJH1O0bOpvKLUSidVYH+z4bZM8hYqLE0h9oFhVf0qcbyrnie/0U50zMWq8AbCTtU8nq3OfledMuMx6IGQnUpLNv/LghnyoUdZvZqTqn5ir911H2VpOkKKCGi0VF+8/1uyjvlJOqt3Gun5U8OdBCZkTThpVqzidtrVA1YY1oToIvtKQfJS49uUYY6jJvOny6xbZYbhsFuAInoBl3jNRUtk0bGak7Ji0LU0nCjwBzrvqNBKbDI8e0uMfr651+3r1qpSpW0MatCZcCsol7rIiq9bBGNnXhlQOrtjKnpO/+SlJnLHyqrYqzUJV18SYpLBsc+eWm0wGoWoFWUOuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6512007)(6506007)(53546011)(2616005)(6486002)(478600001)(83380400001)(7416002)(2906002)(5660300002)(41300700001)(66946007)(54906003)(66556008)(4326008)(6916009)(316002)(8936002)(8676002)(66476007)(36756003)(38100700002)(86362001)(31696002)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXJrOW1pZTRGRC9lK0d6ZlF2WXBxZHErbFhERmYvTHpjVmltTUVkT3NrNEhv?=
 =?utf-8?B?TXFaSkladitRMlZNcW9hNi94Z2pCMFF5cGozdGZlOE1sMnhZY3RxTTRPUWE5?=
 =?utf-8?B?M0V5ZHlqMjloUllrelkwdlNlVnYxN0RKYVpXUVVkb3BFbXZRS1o4WXQ5Tndh?=
 =?utf-8?B?Y1h3NE5FeEU3VU5yWEFkemVlWk80ci9NTDJwckxiVkJVQXgzUitzams0T3Ex?=
 =?utf-8?B?c2tMclZTcjBLNlJsREVLUEFxZ3pOS0RSUXZYWjRvTkRJVkwxZURoaEI4ZGZZ?=
 =?utf-8?B?ZkFBb3hBR2hUZXp0Y2ZNMEk0WTdxRlkzNTc5Zi85aXh4MklCTjFDbzgxQ2xl?=
 =?utf-8?B?KzYrcmFYb1hlN1lLWGI4MWlHU1NIVjlQMG5rVVFFcHhsR0JXVWFtQmx1UVV6?=
 =?utf-8?B?WWVYSmYvTE9zMzRQUHpTaStGVUJ3c2xjeThyVjkrVFNnV0JoSXN2a2JaYStT?=
 =?utf-8?B?ZWR4Z1pGU1BTSkVscG11QWl2ZHlnQnErcmlEamhMVEJWT2Q0YmRZUERFSk5R?=
 =?utf-8?B?RHEvVjFiL1VjeTlicGJuN3lCRVdRempkOFBOT2JpYy9rbGd2SU1XK3BWdHo5?=
 =?utf-8?B?Sm5lTHA5WjZVZ3NscUNsSi9GNmRqMGFSOG5aS2F3T0RVSWZ2VlRDMmV5RXYv?=
 =?utf-8?B?OGd1cStqdFZuMW1BWTBBbEJsci9McHFqTjlYeUlEVFZ0a2FpZlJpd0xHeWIz?=
 =?utf-8?B?VEJJUzRVRzdVNXhiU1pPZVhZYXVqS0ZFRDlYODVYeGZ6ODlMUlhhdjU2bk1P?=
 =?utf-8?B?bEN6cjkyTUZESGlXOTFybzRtSnBRQ20xQlJkSU5NYmtmdTZrTE5RUlo1akZI?=
 =?utf-8?B?R3NwdWMrSHB1eTQ4R2ZZclFVRG1kOWZrOC8xbnRxYmp4d1VRT3U0TTZkaWdK?=
 =?utf-8?B?ejJiaWhxZmtNMVpWWGlkTUovSHE2RHJDdGYzWnh1b0w0cHdvdmpJYkRoTjQ1?=
 =?utf-8?B?UXRnYlhVamhHY1FnUDEzRG51UkFkNXhQdkVhb0owaWwvdG5yWS9pcStsbDNF?=
 =?utf-8?B?a29yMGgrZkV4RjBiL0JkWWoveThSUVhQa2x0eFdUMFB3TkNvL2M1bXBaM29Q?=
 =?utf-8?B?VlFjM1g2eVBsaXFRMWlTSnZLbllRN1FOL0h3SnVxbFlueTU3MDB5T3h0M0Ri?=
 =?utf-8?B?bEVKNFl5Z3RNR0hqL2MrQnpwQ2tTOHZwK1RldDlTTTJ1RTl5T25RN0tZVFFm?=
 =?utf-8?B?ZHpHcSs1U2VWUkg3c0pHcDg3Z2JpZlMwYkVKTHZGK0VtbXNtbzFlZjZqNk5G?=
 =?utf-8?B?elpMOWlnbC9KbGZ2RHRnajlTTzlDZ2FrbzJaaWNkekZzUEdMeGdFOVEwQmFp?=
 =?utf-8?B?YnZCVEZTU3k2a2FlaEUyNzVzWVI5ekpGRDZRcERVZjk0TDdjRFdiSFAzQ0pK?=
 =?utf-8?B?R25oTGtMZHFXVlN2bktCYndBVHVGSnVCekNEbFh0SHVZY1V3Ky9FcmgwR3h0?=
 =?utf-8?B?bzl6cWRmR0w1UVhjaUZTc1I4bTZ3YTkrbVE4Y0hQdjhYMGREeDFjbDRVemVV?=
 =?utf-8?B?U0xWSVEyUTg1Y1A5ZEo0MERrZk9zdEdxbmxJZE11amQrSEloMXNTc0Iyb0JH?=
 =?utf-8?B?cEV6T25kUktmRFJTeExTUVh3ZUkvSUs0eDNCbmhaTVlwaVNaM1FxaXhuSlN3?=
 =?utf-8?B?clNCYmd6TURQMXlrTHRERjc3TnpqdnU3YXVTV2pJNVdRVFFkdHUrQ1FSUnFC?=
 =?utf-8?B?cklvNFp2dHhTcEhXb3VTNEZMc0M5SGtMYXdkaHhaWC9wZ0RSOXNqZzZyU09t?=
 =?utf-8?B?T3lVU1picVIzcldmTFpETlhHSmRtV1pReU1IUGhYQ1AyWWNtWWVLUGQwTldt?=
 =?utf-8?B?QnBUS2hhSUN4bmRIbUpWWnA2Q0NrS1ZqWFZEbldmd1pQSjFkVU43aGxIdDg3?=
 =?utf-8?B?VCthWkgxUkVZdW1uMjUyNGFTdVNwWjE2NTdKU1pob1hKOUgxSUdRWVpQSk9X?=
 =?utf-8?B?cGt6T20vMWVmRlVaQzZKb1hRVTFsSCtPZUo2ZVRpTUpnaXdsRHdrOXRNQXFk?=
 =?utf-8?B?Sm5FeGxKNGJoUmFWeW9INlk2cjhLR2wrOFB3Nmk1NjRBT3ZMQnBEZnNia3E5?=
 =?utf-8?B?d3V5SVE4YXBpZkhkbjRRelB3cDZsYmhkQkd0MTdHcnU1U0Y3cENoZTlHZ2RY?=
 =?utf-8?Q?i6BeuQZIGxFvUflJxJUUclm5t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5709a8-8585-4029-f9a1-08dbef361f49
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:46:33.6384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9W8cv7Qu5KcQvPuBK+fkcvQkvN4I4+NLEAjhuHz4f219bLysYsgERQqZx5d6GajNSS/ZliL/NJN3UIym4oKR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9347

On 24.11.2023 18:29, Simone Ballarin wrote:
> Rule 13.1: Initializer lists shall not contain persistent side effects
> 
> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
> of logging effects is always safe.
> 
> This patch deviates violations using SAF commits caused by debug/logging macros and
> functions.
> 
> Asm volatile statements in initializer lists that do not perform any persistent side
> effect are safe: this patch deviates violations caused by uses of the current macro
> (that contains an asm volatile) in initializer lists.
> 
> No functional changes.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v2:
> New patch based on the discussion for "xen/arm: address violations of MISRA C:2012 Rule 13.1".
> ---
>  docs/misra/safe.json     | 16 ++++++++++++++++
>  xen/arch/arm/device.c    |  1 +
>  xen/arch/arm/guestcopy.c |  4 ++++
>  xen/arch/x86/hvm/hvm.c   |  1 +
>  xen/common/sched/core.c  |  3 +++

The latter two don't really fit the title prefix.

> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -28,6 +28,22 @@
>          },
>          {
>              "id": "SAF-3-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R13.1"
> +            },
> +            "name": "MC3R1.R13.1: effects for debugging and logging",
> +            "text": "Effects for debugging and loggings reasons that crash execution or produce logs are allowed in initializer lists. The evaluation order in abnormal conditions is not relevant."
> +        },

I'm wary of this statement. Order may not matter much anymore _after_ an
abnormal condition was encountered, but in the course of determining whether
an abnormal condition might have been reached it may very well still matter.

> +        {
> +            "id": "SAF-4-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R13.1"
> +            },
> +            "name": "MC3R1.R13.1: volatile asm statements that do not perform any persistent side effect",
> +            "text": "Volatile asm statements in an initializer list if do not perform persistent side effects are safe."

Since each respective comment ought to affect just a single asm(), I think
this wants writing in singular. I further don't think it is useful for
"text" to largely restate what "name" already says.

> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>          .p2mt = p2mt,
>          .skip_mapping = !own_device ||
>                          (is_pci_passthrough_enabled() &&
> +                        /* SAF-3-safe effects for debugging/logging reasons are safe */
>                          (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),

What's the debugging / logging reason on the commented line?

> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -110,18 +110,21 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>  {
>      return copy_guest((void *)from, (vaddr_t)to, len,
> +                      /* SAF-4-safe No persistent side effects */
>                        GVA_INFO(current), COPY_to_guest | COPY_linear);
>  }
>  
>  unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>                                               unsigned int len)
>  {
> +    /* SAF-4-safe No persistent side effects */
>      return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
>                        COPY_to_guest | COPY_flush_dcache | COPY_linear);
>  }
>  
>  unsigned long raw_clear_guest(void *to, unsigned int len)
>  {
> +    /* SAF-4-safe No persistent side effects */
>      return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
>                        COPY_to_guest | COPY_linear);
>  }
> @@ -129,6 +132,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len)
>  unsigned long raw_copy_from_guest(void *to, const void __user *from,
>                                    unsigned int len)
>  {
> +    /* SAF-4-safe No persistent side effects */
>      return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
>                        COPY_from_guest | COPY_linear);
>  }

I can only guess that in all four of these it's the use of "current" which
requires the comment. Yet imo that either needs making explicit, or such a
comment shouldn't go on use sites of "current", but on its definition site.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1517,6 +1517,7 @@ long vcpu_yield(void)
>  
>      SCHED_STAT_CRANK(vcpu_yield);
>  
> +    /* SAF-4-safe No persistent side effects */
>      TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>      raise_softirq(SCHEDULE_SOFTIRQ);
>      return 0;
> @@ -1895,6 +1896,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&sched_shutdown, arg, 1) )
>              break;
>  
> +        /* SAF-4-safe No persistent side effects */
>          TRACE_3D(TRC_SCHED_SHUTDOWN,
>                   current->domain->domain_id, current->vcpu_id,
>                   sched_shutdown.reason);
> @@ -1912,6 +1914,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&sched_shutdown, arg, 1) )
>              break;
>  
> +        /* SAF-4-safe No persistent side effects */
>          TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
>                   d->domain_id, current->vcpu_id, sched_shutdown.reason);
>  

In at least the former two of these cases pulling out "current" into a local
variable "curr" would likely eliminate the violation and at the same time
improve code a little.

Jan

