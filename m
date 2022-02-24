Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D368D4C24C7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 08:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277916.474774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN8x0-0003I2-Pd; Thu, 24 Feb 2022 07:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277916.474774; Thu, 24 Feb 2022 07:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN8x0-0003F3-LO; Thu, 24 Feb 2022 07:54:10 +0000
Received: by outflank-mailman (input) for mailman id 277916;
 Thu, 24 Feb 2022 07:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nN8wz-0003Ev-0n
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 07:54:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1aa89ad-9546-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 08:54:07 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-uYnziiY-N0mBcRKRSTRsLw-1; Thu, 24 Feb 2022 08:54:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7546.eurprd04.prod.outlook.com (2603:10a6:10:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 07:54:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 07:54:02 +0000
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
X-Inumbo-ID: f1aa89ad-9546-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645689247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlB7GjP4r9JbdA3p80n5siQ79+EBx92wRl/zmg2Hfyo=;
	b=d19rPG9s8LuqWG4LCjdE97+uU7u78MfofcdYagMEi28SRYY+meBGa0OcJJvZ+8t8T8VIhK
	NDa7RCbp46cPXSVnYVwlefGBFxujmcvYrlBx70ov4J4CgcWMBemFTTi/N2KB+R8MVivdO6
	hblREgqiQ4R2ubFKlLu+achYeW3VKCo=
X-MC-Unique: uYnziiY-N0mBcRKRSTRsLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeMjWI1RJqkDfvNjUCBgwzldVAczXu07Y71EL6afFqnhVH6CDd6iTtEmQv8wYjygQtLB/ExG7Z2RmWQTJDvPB4XWr7GE1ypjH3C2tm9U75HzKrFb3oPuOWVIeMu5gt4rdD2Zx1OnfRQkSkMGRFG9eFJtb5mNvWn/aJzY+ZeUp5zADK2Es28LtWrg0N/0aElyjDajl06z/+XyfFPkrtzi7FZv1nW3l/9me7mVVrnXpxZCHE6weJwE2c3DmVay5srKLc7toh2wxWLrgJIf9JarUO7nzAxGNmjJAkxwQ8oZtMVh7ijuwRUK8ve5hSFpzFdhjZuVBQVmc9nGxb1/KidwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlB7GjP4r9JbdA3p80n5siQ79+EBx92wRl/zmg2Hfyo=;
 b=F40pREI1IDhAV6rS99za5djklWR/dVvOo4UI1TtwOMLpZIu8FgsIptbGrRO+FZDV8sclSso+axaY4hBOlmHXEbNKgOe662dU3TSTnBTpP99BVHmOpWQ9DV05q486bv3+3SC+/YujkswAz8qqS4BwkNvfEz5KvAc0WVR4xVH8vfzbJWPOWTAiEjRY3/hsbBgTPvoj21a6jeTOff4YdkNn7AbOP7ZJe0KjGcrO4eAuJ0PpD+lUg3lw9fIYa04mWE9mafEE7Mw0Wvbm8JAyqO3iiyiJ/iN44GBuI5mr5Y1cKOCTNifjCax4WRuCbf5v3LpVy4zK0unJH7b9pNIDjI4KrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab5c32e8-93bb-234f-f38a-1eadbc107d70@suse.com>
Date: Thu, 24 Feb 2022 08:54:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] x86/p2m: make p2m_get_page_from_gfn() handle grant
 and shared cases better
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <32526b73-25f7-e6b0-208b-669a7648ee44@suse.com>
 <5a8c1f9e-e91a-a7f5-8c8a-025ab6a39908@suse.com>
 <CABfawh=Eh==cadaQX+n9BzuK5RE=sud7sjLtbAzpp5ouMYGCdQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=Eh==cadaQX+n9BzuK5RE=sud7sjLtbAzpp5ouMYGCdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04684200-af32-455d-d03b-08d9f76ad2ed
X-MS-TrafficTypeDiagnostic: DBBPR04MB7546:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7546FD6072A2C942C75FD49EB33D9@DBBPR04MB7546.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YLCctp6XTf+3LYHDAohXZ4tAMC4leaTD25z/y2i1n5rS/gHMCiNgLIxKJgHDq7aHooidsxmr178gj2YJJLP37EuKlJJEADPgo2GCiG+VP/Rt/Do7oeiTGPkJRGYWr8GqYL5gm653gWAiL7uK9fRlw4bDGnc3Vz/wdJ111zgd3JF6VJ+jF2fj0EiWXGQulxCWUThVhNc8Q9aNzbyEEz9s1LJaG2Cj4EqwZzLgmEf6eIntrj63DELXfPk2V/JOUesFRaQCyG8yEBBR3biprOcg14GJwWED+s7jt616MbnIUSYPRqnlvTEwCJWGikzLpSle34ieRaH4TKVzfCvfhk9qPEIPLnWBHAzUTaDzTCzLYMZzqchYHvUVHMtaZV4SIbK8twuD8Ecs62fZwyi5hoYRa+RKcdQl1gaOoG53cvyt0CCTr6CfNE3Ny2qeiKx1KvBxOQ6J9wvKlFJwXSgUCKBvafByY5EXbVACGSDJlmvH60kHVcldoOeSjtVIWYgDIchOxh00LlEigN2f4wbLa596QRoR7GWMTBU710q5OOB0DuSyMjKjJ1/c+mFP9/ESZI+xsPl0BTv9yN9NFX2Rlak/Brw+bzpf3oFrU42ehcD4gB5Kq03eNgSZarpfQ3pnBgji0j46j7Hfzp+KXqr96t54KZ1YETbHjMyViDwQ2R5crpUEMieW5JpVezc5H1UCVmNCrOyYhSA6tGSV5SnJ0LEMJ+uJO3MgTYEmL+QIFDXZ1H0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(31686004)(86362001)(26005)(36756003)(31696002)(186003)(2616005)(6512007)(38100700002)(6506007)(2906002)(8936002)(6486002)(508600001)(5660300002)(66946007)(66556008)(66476007)(4326008)(53546011)(6916009)(54906003)(316002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkZWUnZZWlJyeXhDL1RJeFVvTkFNS0U1RlNJTjhKbmp2L3duODVnQmNXeXNZ?=
 =?utf-8?B?Y2dvSHZuUjhHVDU5N0N6aFhOelR5NkxjZmhkNnpuQ2ZITm1zN3ZEUU10S0lv?=
 =?utf-8?B?cURmNmVuWEhTNEhxczFCVUNNc25LZTRxbDJmdEpDOE80YXdUSnlTU0J1OWtm?=
 =?utf-8?B?VktOZFpiUmJKU0N1UFRpVkFEZ01EZitVdEhXSUs2TzZnNzg3NDNqVWxKdngz?=
 =?utf-8?B?WWpGYWM0WEZHTnduN3BmZVFmR0dyc2hVbkhYUVREVi9nNmErdU1kYjM0OVJJ?=
 =?utf-8?B?RVVqS0xWVnA5Qm1Ncml2M3RpbVY4Qk5vVzdNYXZrVFRBVFFDNkxtakVPMlA1?=
 =?utf-8?B?WXlxYlhvcy9Jd1djTDFkMFNpVmNoZ0RQTUpOT2pvNkN2WSs3VVc0OE9lTW1k?=
 =?utf-8?B?VjFUT3cvaWtGdjJqb2F4TFp2RkZjaExwNk1ZMnpvLy9mRjRpR1ZoQkdVOFN0?=
 =?utf-8?B?NXlBNC9BYk56NzdpZTNYelJrM3pKanZ0SHh4KzFwOW9CcE5GdzlMZVlvaG9B?=
 =?utf-8?B?Ukk1SkdhK0duSWRkaUdlSXVhQ0wyMThFTldEZk0yS3FPR1RlYUNGRWpQSFZ5?=
 =?utf-8?B?Z2NnQWVHTU8xMitTN0lmZnpsZWNJVndjY2lxc0JMSnhlS3NsRldXa1pQeFBM?=
 =?utf-8?B?Q05FSStYRnZnSEJlWUYrb3luS2NMSE15MTYyQjdFRVdPR3RJOGU5WWYreWND?=
 =?utf-8?B?aEJvYklKa2V4S213S1ArVVRnWFJETW9Uc0lpTGVYOU9zcGF0eUZHbE0wMVU2?=
 =?utf-8?B?K08vQUpJT1NlVUhRTWNLanYrcjR5S01CbmFVREJuT1NHRXZuZG5JOEFZcFM2?=
 =?utf-8?B?dStacy9TclhhU3JPcWI2djljWjdLRnk2Q1hhTUlxY1pFTG8relkwc3hzd2Uw?=
 =?utf-8?B?QnlhcjlyUDVFenRIeVNWWjZXeG5tbjRwamVNUEJDcXBrSTRNdGw5RUlpOVhj?=
 =?utf-8?B?dWlvUWwyUkt3M2ZZU3FkSWg0N0RHZFRxTG1VZmFuRUFvc1JOS3ZYR1o3OXNp?=
 =?utf-8?B?TlBGS0ZZMVM0WmdGNGNCUWh1MjY0b05IY05TNFdkUUdyY3BCNDlNOHVldktB?=
 =?utf-8?B?NnhreTFQMjR6UEltNGo5d1VWc3BqZVcwTERxTDlqM1lwRWI0V0MvLy9nM2Vz?=
 =?utf-8?B?WHpIaXdTNXJYOWF2WTNMOStmbDM3ZTh2Wkd6R1lBNUFPeXhtL2p0TlhGNmNH?=
 =?utf-8?B?QXduMHBVajJOWFhSU0NOMlFwZndERDlBczMyVUJST2NCSnhRbE9FMlNqeVFO?=
 =?utf-8?B?bk1DdU5zRTlldnJISGxZSC8yd3Y0SkhjUGtGNi9UVk45bjEwalEwbEZJRXk3?=
 =?utf-8?B?VFUzTTRBRkNaSFd1OUdHU1V3QWtJdE1iUURlSzU4V1FHOEZKb0dvai9tTTd2?=
 =?utf-8?B?V1BaZDB1OElkK0lmR2dLUkN4cjdzVUFEQWxWUDhFMGZwQkw0VklKT0hUSVBL?=
 =?utf-8?B?Q24vTDIwYVYrWmR4b0NZajJlVStvV0FtMjJIbS9mNDJwZ0NPc3FYaGtzNENQ?=
 =?utf-8?B?elkzeXdHTmkzZWU2U2M3RjZqSVhqUFhiNWhGWUdWc1d0TEU4czMrVDBwTEdY?=
 =?utf-8?B?c0grYVdrcnNSck5MVXhlbkNoNTRzQ2kxdXM3cEZrdjdHOTAwN0tVSk42UlZi?=
 =?utf-8?B?aVdMZDlsUnlUTXZCNnkvWnpSd01pbzRkNWF2U3VWcDE4d3M5ZHcyazV1ckMr?=
 =?utf-8?B?bWFlQUNNNUxFNllhK1cyeEFsbFlTNVlBOEdVek0vUk1Uck9HRUtIZTI4ZFlp?=
 =?utf-8?B?aFBsU2UrQlgvM3MyNHE1ODJFcUZVYkpvUXJBRzBIK2ovajFmR1JkMEFOcnNR?=
 =?utf-8?B?RTdmTmx2d3hXeVc5cEtZN2hIZUVrMDA4SEVwdGlTeEZLQ3lRUVFrSWdvaFJF?=
 =?utf-8?B?OEltaUFEL3FiaC9xb3dYV3k4dlZXMy9DTDU1UkwyTkFWTU9WSFdIQy80RWtv?=
 =?utf-8?B?TmpZdWhQQ01ma21BZDN2VVQ5NmhSYTJkMGJiMTdPRFY4bmdZclhHU3VaQmlm?=
 =?utf-8?B?R052bmJYT3VNWjJnWXNpdUFDc1owdTFkOGpKM0kxZG1pRFR5WWJaaU16RzF5?=
 =?utf-8?B?OUVTd3NjcDdmemhQQXcxa3VEdlN6UmZvSUtqQWtFbnMzQ2l0bXZoM1FMcVpC?=
 =?utf-8?B?WTlzZXhTZVBmdks0OE42MnBQdEMwTTBqL0hmRGt6b0dSaGU0Yk90TDcvT2Jy?=
 =?utf-8?Q?dNaYZDg5wgVSpc8wpmXK1RU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04684200-af32-455d-d03b-08d9f76ad2ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 07:54:02.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8RFfF9JcmRrGFq/PLcXh6qfBV7TBsB5CikDBqPIO0CU6tirr6W0bx+l5OyqZM811QSWTDwlbmcIEz582aQU6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7546

On 23.02.2022 19:11, Tamas K Lengyel wrote:
>> @@ -607,6 +607,7 @@ struct page_info *p2m_get_page_from_gfn(
>>
>>          /* Error path: not a suitable GFN at all */
>>          if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
>> +             (!p2m_is_shared(*t) || !(q & P2M_UNSHARE)) &&
>>               !mem_sharing_is_fork(p2m->domain) )
>>              return NULL;
>>      }
> 
> I don't follow what this is fixing. A shared entry would return true
> to p2m_is_ram() - p2m_ram_shared is listed under P2M_RAM_TYPES - so
> the rest of the if statement would never be checked. So if we get past
> that check we know we definitely don't have a shared entry, ie
> p2m_is_shared must be false ie the check for P2M_UNSHARE is dead code.
> Am I missing something?

No, I am. I mistakenly took p2m_is_any_ram() to include the shared case,
but p2m_is_ram() to not do so. Thanks for pointing out, and I'm actually
happy to be able to droop this hunk.

Jan


