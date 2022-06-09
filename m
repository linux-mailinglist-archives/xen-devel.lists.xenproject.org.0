Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D6A544D3C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 15:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345474.571037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHxz-0008B2-Uv; Thu, 09 Jun 2022 13:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345474.571037; Thu, 09 Jun 2022 13:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHxz-00087u-RP; Thu, 09 Jun 2022 13:12:51 +0000
Received: by outflank-mailman (input) for mailman id 345474;
 Thu, 09 Jun 2022 13:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzHxy-00087o-7e
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 13:12:50 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe08::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbb69295-e7f5-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 15:12:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3889.eurprd04.prod.outlook.com (2603:10a6:208:d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 13:12:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 13:12:46 +0000
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
X-Inumbo-ID: dbb69295-e7f5-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyiJHIdhsjCKCErzx2rT6/Gw2tbRYiBlxMLU6GkgS6RM/sjQXvJzyq84ZjJOo0iaLrR7vYiwRlbf7eo6Ii85W2L1ienTGTNPns030v3XcftrRpPicl2liWPgv2smt7C77QgPYmDcGdLvhp8Xz0b2dU57BRdNLoOCCR2CoD+hClYHVH6i1DCcv5UfoOkCkvas7opaAAor4rRPzajY/xeYH6Vpo6c3Yb3ft1oYRzoftavRjUmay/T2Xs1QEL8J3nBNNtvegGTLm0AJ23W/m3rJLiGVs/XI1eeackPOD5k/5QZeYiw7h9XyRCvs380EokXvZIN7PQOxTCV5RC//aRZoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXCEqLr78E0GK+gCnQehEZAMC4x4ISHwt4p+XJw6k4c=;
 b=nVWaaslSyiUM0u9fYiFrkLglX9bBKg7gFLktMtbmaXE6/6cMQQd6A6gbz2CYpzKGhZ9ab7CRY48S4rjzAVXced7Di3tWiPuxrHRwVodhhtYlWKBHwwI0AOTN4VdTM0eK3sS+KHPXGwQ6jpS20rRbysIyE/BK+kEqIBP8IzMO/HBXJ8vRMI0Jk4lvFS1zxNeLSuJ3PKBPFSTr3uKzPl2d+k80Jkgpc89ewZAK2HUCmo8vVYgUxDKL2JBraTf8JNciupJPsHFAnHleYweMCyQinslGU2jIH5TE/7w24rBammclx7Hr3f+PIb8eHBQadO2tyBoUZzTbAjXPHtWfR6mKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXCEqLr78E0GK+gCnQehEZAMC4x4ISHwt4p+XJw6k4c=;
 b=1QinHxfy8OZWtpw2bE6PvJcO8M6+fHzZixPdye3QF2+VsKcdd5DYXKh5AyQGxh+Tn/wncFWaao/wS2OEVSPyg6fqg0YDW283gHXbg0gaOgCha8cRzpCYk6+mQNMkkJaeW2D9PCPPiYkseRzzXnn9Tnz/oLrRYs6+hKEXKTuhMH1n00kYYtvYojK0LpdbTbBEAyeSNC4fkiwNkeqK4WM2Dsbnd5mr0Lg/QaVpMHjOWd7pFU5FE/Fz3VzcI/jYEFVQ2j3+/sztfoSTHe/zisfDeYLKG6SQU40YOgRU+Xq3obIHQTtBK9k5p8FNn9HwF+Givc4qA+zjPknIg25wo0+evA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4e6c1a2-639e-d9e0-5cac-c34cf5f148d7@suse.com>
Date: Thu, 9 Jun 2022 15:12:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] xen/heap: Split init_heap_pages() in two
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-2-julien@xen.org>
 <23552ac7-7548-9dad-fe41-7dc581c78585@suse.com>
 <b3d82607-a7ae-52b3-a9e4-d50780d35b9c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3d82607-a7ae-52b3-a9e4-d50780d35b9c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0031.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::44) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b457ae-52b4-42ac-ae31-08da4a19bebd
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3889:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3889D67292CCA487CCA3078EB3A79@AM0PR0402MB3889.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gReOz9jpssYGL7POfEK47VLmyunipBoAl8W6378cdebAt3pykvrFnx9f2I+vegs6+4ZbFnRPxR4diokZ1b2XEioi5M9mwfm5qEWmlmhiSFL2sGEr4+Knd6enkQag1nkRvlQAerOkcJwyDZlDiusCPCa83dM1OqlRPy7ti6+pARzdvuyCifhlRW6mASS0pTyaUuyvxPmwekezKus0ki6Pg+TEnFOh8MVEMnTwIn7zbBJzTmQdePZ11xfcYSpOPnRTtHQZS2mYCvJGg6AZyUOpIoVoxp29r7sGOi3gqqhFmJ/ZkOGSkz0tbXv+azyBnD1DykB4v/hirWXWYHvRO8GlxqUReaOqtzkOOAfarudebPRJ1Hpi6ojFPyA8Ba/BFGo0mGMmaZUtm9unrrbNMkgWnyCCcIxUblHwbOVgH+Psv+CofBSLss8iGAMnPls+A1hD2qAeNHHQL9bDhDslXwKeEs9xa+QNu0czcm9CQ7l8V9lEBEgwJxlJy3frafYcFXxErdiF6kQtMODf+xz5k6rcuxToVs2dvyvkTJriVw+FDSzPSHg5y+Snj1n6n96391KHxrNnxgGLuCTRICWTuJ5EsrCZpoPh/rUmzfF+K8T5bgNMpQq7SfxVU3d6sL3YxFEJsAnv7Sj7PY8s/aUr72nD4bKy3Q90Kt0M58kaQW0Q0kHy2Dmyk2SrBTO6JnIKd3w715toTzagagfC5K9tkhh07qxbrmqlnsXIStII0SUMMSaVt13WJOFDramy1CHPXggHCLLi/i65N+ciBnhewXzzgmrsCVBRRCfZX2sn6J6mrv3wZa2O5WuO7Va0AY5siakG6HvuM6xuOaJrxXow54/mbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(316002)(966005)(2906002)(6486002)(5660300002)(4326008)(66556008)(66946007)(66476007)(36756003)(6666004)(26005)(31696002)(53546011)(6512007)(8676002)(6506007)(86362001)(508600001)(2616005)(6916009)(186003)(31686004)(38100700002)(54906003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajdMMnVmWFhEREQwTzYxaUJrNURsZHRWQTUyL2RiYXdmUTZvWjRVenVrTkxL?=
 =?utf-8?B?TmdybzF2ZDhnSnNEaE8vWEJHNlBjbkpaR25SYy9RbWhDMnNXRU1OUHE3NFhC?=
 =?utf-8?B?Tnc3ZzNxaVlETWF6UXFwZFphQkVnYVk0c2lpRCtUdmNyaGpRbWRVeUhWM1ox?=
 =?utf-8?B?Q1RmOFJyQjFlM1N1dnBDVXZmWnErTmtuTVRSU0wwWUV4SUs3WDlMNWdmVUxJ?=
 =?utf-8?B?SlI4aWhFYTBSU3NqT081UDBMcXYwSithaVBqK3VjeitEQVFOUFVoVEpzaEU5?=
 =?utf-8?B?bFAvc2ZKMVVqWnh1KzV1VVRHK05NQjBmSkFjOGR6RytZRy9sQ2NJTUdHYnZW?=
 =?utf-8?B?TXFqYmRtQUxWekR6V1l6d25CM1pzZ2hWeWVnQ0JrT0UxUXJyTEdwY2FDWHU0?=
 =?utf-8?B?S2xZUEtFU2FxZHRjOG5FbTRrL0NwUzY2Rmw0T3R3aEd2NmJJelZnaVZjSWNG?=
 =?utf-8?B?UDRYb1lyVVRCTmhZK2hCanpaaXZGSFpXQVBiU3JVdzVXc0l3d21WU2xpRzBB?=
 =?utf-8?B?YW9JUVFCTGxwVVNhSFg1b3BkRDVhWUFSNG5OUEdxYTkySUNQVVFOeUhWTkpL?=
 =?utf-8?B?bU9rYkRCeEFKeEVQSHMyWDFXSEhlK0NPNy94TWc2T0F5LzFSQWNWY0lLb0Fx?=
 =?utf-8?B?Vi9JV3k3Y2NuQUJid1JueENuNmpGeC84T3l4U1hoaDRvb2RKdEE3aEdDelIv?=
 =?utf-8?B?YjkxWTFvSnhBQlpRVGo3ckt0b3ZyNHFhT2NRQmd3SFAzallNZ1Nmb1dMd1Mr?=
 =?utf-8?B?d015Vkh6MTI3bzJId213SnhUZkYydm90VnhRdmowTzVxUGNWeGgrVTBwZmlB?=
 =?utf-8?B?OFRUMU5NcDRDUDN1Tjh6V1J2bmNBT2Vpbnljb1EzVVE3UUtZZmQ1VkxORlo5?=
 =?utf-8?B?L1NBSG05SlJvZTVGR0xGMnArSS91OXY3Yzc4Z1hneCszS3Mwam91WlFqU2Fw?=
 =?utf-8?B?cnF2elQ3Nmt2WHhzSU5JSGo0dnRnZzZ4SmhKaGtZczhjOG8wdGl5S0U3L2tw?=
 =?utf-8?B?U3JDV2Yxc3NJT0tNSmZFTzdQQ3ZmNWpEOURyYmU3Yko2eUtiSEpSTHJteHNL?=
 =?utf-8?B?UnZqTzl4a0dzNlUzb0J1WTZZblZUT0VmU0lwd2YwdmF3L0xEVXB1czJNVUVR?=
 =?utf-8?B?TlhSOERKUElhOU53dnNDYWNZSGRPc2V2a0owbzRDRFNDMDhET1JUMXUxQmNr?=
 =?utf-8?B?SlhyaHFWN25XdTQzQWlVMit4ZVUwY29tbkZrcWxSaHhUM1hDMW93WUlSN2Zn?=
 =?utf-8?B?Y3lSVUhra1dCdVA5STlEM2lrcXpQWm1oQVhIVFI0TzdYRHhramJJdjRMcUR6?=
 =?utf-8?B?TTJqb3BLbmQwcHkxRXVnZU9GTGRleXNvZkpOL1RXWDh2eHRubktIQzBXaE4w?=
 =?utf-8?B?TEFBdnFYZ0ZubEhhOGVhN1IyL2QrVzE4NGtsS05GUGdQM0psdWJUWW5PWHVh?=
 =?utf-8?B?SE5uNjFTelRjNnNTdEZPVmJ5M3F0S0NidWxKZUZzenZuQ1R3SGJLdUd5N2k4?=
 =?utf-8?B?VmFrRkhYblBZNFJ4bHMydEpXU0FlaCttWlY4NVhsRlhNT1F6NTNLZ0UydGZr?=
 =?utf-8?B?b2c0MVJGRmZHdGZndmhtcUU0NG1DRXJQeWk0NEFtdnRrZzkvME4za2cvM3Vv?=
 =?utf-8?B?b21sdDU1c0Z6UytUbUlKcElpV1R1YXVnSmxTM0pwV1RPb2UyYzBTU21JTFNB?=
 =?utf-8?B?cERCeVdGQlZYbm4rVVJ1bVkxTGlOeXdYczNTRmFwUStOSWZFNDNESWJrU2JD?=
 =?utf-8?B?L0JGUWI5RWpORUl4NEtvRm05Z2k3Q25MUXB3UThqTFEvd1FLUUFWNU00YTlQ?=
 =?utf-8?B?bW1OM0JiMUdySGUvVUZ2YXFYQ09WYUdNc1VOZjZqWkhxQzhLQkc1N0RoMnlT?=
 =?utf-8?B?ZGlDU3lQaDFsTy9MNWlWd1B5a2xrdStZT1VrRjdReUlxUEpPNENRaDZ2K0t3?=
 =?utf-8?B?WGd3RnZsV0t6Z2I4Q2Jqb3NZM1VobTBNV0d3bVlGWndxWHo1N1FtOEhTRXRZ?=
 =?utf-8?B?QmtXSTFMSWg2VTlTNW94QXNUaHdwbjZaK0svOFl0aWtEZnRSV2VYZVZtQm1Y?=
 =?utf-8?B?Smd1MHg5a1Z1VTlNZm5nY0ZydmIyTXVrbjJkMytSL0lmaTEwL0JFd1VUbHpW?=
 =?utf-8?B?L0FuT3h2YXZxQ0txTlhSMG5oK1c3NTB5WW9zTGNsOUl5RHA0QWlkempHL0pR?=
 =?utf-8?B?MUo3TVRLNjI0K253eGo0czNWc05KZHYyY1pTNWtUd3FwWVBYZTAxNEY5NFAw?=
 =?utf-8?B?S1o5dkRxemtoMlBRbGZRWHdQV1I2alZybWhKT2tLaUl2ZVAweUtxOVFBY2xL?=
 =?utf-8?B?emxtZEZBSDVzTlVlQ3RUMU1KNFluMkwrb3F5Z3FsVUYySldPeFNuZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b457ae-52b4-42ac-ae31-08da4a19bebd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:12:46.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt/CqYXYRpMV5eys5NbUU5AJZWZ3XBacwXk6qcxaiUfSzvM617QZnEGByYq7lZeJJOWD/imVrIijRt7uJ89rWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3889

On 09.06.2022 14:33, Julien Grall wrote:
> On 09/06/2022 13:09, Jan Beulich wrote:
>> On 09.06.2022 10:30, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, init_heap_pages() will call free_heap_pages() page
>>> by page. To reduce the time to initialize the heap, we will want
>>> to provide multiple pages at the same time.
>>>
>>> init_heap_pages() is now split in two parts:
>>>      - init_heap_pages(): will break down the range in multiple set
>>>        of contiguous pages. For now, the criteria is the pages should
>>>        belong to the same NUMA node.
>>>      - init_contig_pages(): will initialize a set of contiguous pages.
>>>        For now the pages are still passed one by one to free_heap_pages().
>>
>> Hmm, the common use of "contiguous" is to describe address correlation.
>> Therefore I'm afraid I'd like to see "contig" avoided when you mean
>> "same node". Perhaps init_node_pages()?
> 
> After the next patch, it will not only be the same node, It will also be 
> the same zone at least. Also, in the future, I would like to 
> re-submitting David Woodhouse patch to exclude broken pages (see [1]).
> 
> Therefore, I think the name init_node_pages() would not be suitable. 
> Please suggest a different name.

_init_heap_pages() then, as a helper of init_heap_pages()?

>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1778,16 +1778,55 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>>>   }
>>>   
>>>   /*
>>> - * Hand the specified arbitrary page range to the specified heap zone
>>> - * checking the node_id of the previous page.  If they differ and the
>>> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
>>> - * not freeing it to the buddy allocator.
>>> + * init_contig_heap_pages() is intended to only take pages from the same
>>> + * NUMA node.
>>>    */
>>> +static bool is_contig_page(struct page_info *pg, unsigned int nid)
>>> +{
>>> +    return (nid == (phys_to_nid(page_to_maddr(pg))));
>>> +}
>>
>> If such a helper is indeed needed, then I think it absolutely wants
>> pg to be pointer-to-const. And imo it would also help readability if
>> the extra pair of parentheses around the nested function calls was
>> omitted. Given the naming concern, though, I wonder whether this
>> wouldn't better be open-coded in the one place it is used. Actually
>> naming is quite odd here beyond what I'd said further up: "Is this
>> page contiguous?" Such a question requires two pages, i.e. "Are these
>> two pages contiguous?" What you want to know is "Is this page on the
>> given node?"
> 
> There will be more check in the future (see next patch). I created an 
> helper because it reduces the size of the loop init_heap_pages(). I 
> would be OK to fold it if you strongly prefer that.

I don't "strongly" prefer that; I'd also be okay with a suitably named
helper. Just that I can't seem to be able to come up with any good name.

>>> +/*
>>> + * This function should only be called with valid pages from the same NUMA
>>> + * node.
>>> + *
>>> + * Callers should use is_contig_page() first to check if all the pages
>>> + * in a range are contiguous.
>>> + */
>>> +static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,
>>> +                                   bool need_scrub)
>>> +{
>>> +    unsigned long s, e;
>>> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
>>> +
>>> +    s = mfn_x(page_to_mfn(pg));
>>> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>>> +    if ( unlikely(!avail[nid]) )
>>> +    {
>>> +        bool use_tail = !(s & ((1UL << MAX_ORDER) - 1)) &&
>>
>> IS_ALIGNED(s, 1UL << MAX_ORDER) to "describe" what's meant?
> 
> This is existing code and it is quite complex. So I would prefer if we 
> avoid to simplify and move the code in the same patch. I would be happy 
> to write a follow-up patch to switch to IS_ALIGNED().

I do realize it's code you move, but I can accept your desire to merely
move the code without any cleanup. Personally I think that rather than a
follow-up patch (which doesn't help the reviewing of this one) such an
adjustment would better be a prereq one.

>>> @@ -1812,35 +1851,24 @@ static void init_heap_pages(
>>>       spin_unlock(&heap_lock);
>>>   
>>>       if ( system_state < SYS_STATE_active && opt_bootscrub == BOOTSCRUB_IDLE )
>>> -        idle_scrub = true;
>>> +        need_scrub = true;
>>>   
>>> -    for ( i = 0; i < nr_pages; i++ )
>>> +    for ( i = 0; i < nr_pages; )
>>>       {
>>> -        unsigned int nid = phys_to_nid(page_to_maddr(pg+i));
>>> +        unsigned int nid = phys_to_nid(page_to_maddr(pg));
>>> +        unsigned long left = nr_pages - i;
>>> +        unsigned long contig_pages;
>>>   
>>> -        if ( unlikely(!avail[nid]) )
>>> +        for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>>>           {
>>> -            unsigned long s = mfn_x(page_to_mfn(pg + i));
>>> -            unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>>> -            bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
>>> -                            !(s & ((1UL << MAX_ORDER) - 1)) &&
>>> -                            (find_first_set_bit(e) <= find_first_set_bit(s));
>>> -            unsigned long n;
>>> -
>>> -            n = init_node_heap(nid, mfn_x(page_to_mfn(pg + i)), nr_pages - i,
>>> -                               &use_tail);
>>> -            BUG_ON(i + n > nr_pages);
>>> -            if ( n && !use_tail )
>>> -            {
>>> -                i += n - 1;
>>> -                continue;
>>> -            }
>>> -            if ( i + n == nr_pages )
>>> +            if ( !is_contig_page(pg + contig_pages, nid) )
>>>                   break;
>>> -            nr_pages -= n;
>>>           }
>>
>> Isn't doing this page by page in a loop quite inefficient? Can't you
>> simply obtain the end of the node's range covering the first page, and
>> then adjust "left" accordingly?
> 
> The page by page is necessary because we may need to exclude some pages 
> (see [1]) or the range may cross multiple-zone (see [2]).

If you want/need to do this for "future" reasons (aiui [1] was never
committed, and you forgot to supply [2], but yes, splitting at zone
boundaries is of course necessary), then I think this wants making quite
clear in the description.

Jan

>> I even wonder whether the admittedly
>> lax original check's assumption couldn't be leveraged alternatively,
>> by effectively bisecting to the end address on the node of interest
>> (where the assumption is that nodes aren't interleaved - see Wei's
>> NUMA series dealing with precisely that situation).
> See above. We went this way because there are some pages to be excluded. 
> The immediate use case is broken pages, but in the future we may need to 
> also exclude pages that contain guest content after Live-Update.
> 
> I also plan to get rid of the loop in free_heap_pages() to mark each 
> page free. This would mean that pages would only be accessed once in 
> init_heap_pages() (I am still cleaning up that patch and it is a much 
> more controversial change).
> 
> Cheers,
> 
> [1] 
> https://lore.kernel.org/xen-devel/20200201003303.2363081-2-dwmw2@infradead.org/
> 
>>
>> Jan
> 


