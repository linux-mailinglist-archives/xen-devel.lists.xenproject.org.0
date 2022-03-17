Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1274DC427
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 11:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291481.494715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUnbD-0003gU-3n; Thu, 17 Mar 2022 10:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291481.494715; Thu, 17 Mar 2022 10:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUnbD-0003eS-0I; Thu, 17 Mar 2022 10:43:19 +0000
Received: by outflank-mailman (input) for mailman id 291481;
 Thu, 17 Mar 2022 10:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUnbB-0003eM-H0
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 10:43:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d1f2b88-a5df-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 11:43:16 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-fRPGpr8nNdaQ8ouF7MXToQ-1; Thu, 17 Mar 2022 11:43:14 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4421.eurprd04.prod.outlook.com (2603:10a6:20b:21::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 10:43:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 10:43:12 +0000
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
X-Inumbo-ID: 0d1f2b88-a5df-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647513795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouDn1d60YR/2pX0Xed/S8YOUCFZJ0++aPkPnbAMQ8qQ=;
	b=nqM/Uz2Auu6PR0P9eLHLlYtzBnHwpi8Wfyl1N2ClacZDqxYef9OGbjAvxF/VeirBX045sY
	8QDUog3vvIczDcspfnK2P1n+pWC200yn/nRcWBJI5nxgY/akEdVPtqR/zOeqpQ3/zMe4+g
	afO+AEKVAFus+ZhvctHsTUWj30XR2+k=
X-MC-Unique: fRPGpr8nNdaQ8ouF7MXToQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/IkgEoWXKM0KF6rs6uPTRRfBldKKd4A4uUneXr1Ye8lzSXzjIGcmzFPX4+XVnzWR98ZaO4Ptb3yP3VQMT8YT3fhCrdKBLbvZ676QYSr223sPhIlKni127EL0m0EIZEAIRp726C120wTs6IvYkiHcc2dx+shz6AUg4Jff0BchPuOHyo6hw2w/2tIg2FgVqKoncNl/mMPDWP7jWSVR0BfB1iinG4aUeE8nb3MZSKNKTC2HIH5iNS3zpCMGeucaPbO9GJkfKTzBgLB1v1gjIlfrW3hbLAuh9ojPTLvXrY2ylyJ3M/K+2l1VAjDK8f4u4lcGA0lYu9qe94wAUiYf2hQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouDn1d60YR/2pX0Xed/S8YOUCFZJ0++aPkPnbAMQ8qQ=;
 b=Mm0Ooa/1iatoLQcz6qwSvXj/9n+r9CFHwArmNS3nworRjE257P5aKfyJCkGVxwv+zDvLUDf/hQ2/pMhzbezkkIuW0ghqY3n8J3ndoy+EekrIqPQAu+swJXXRLpYvEcn49ea+jhYCRHoRshZK65NInyMI7ylAqhA/i9bRNLV9EXGQxePrZOkCXMjzO6Y+gQooYTMJrWHXqBaEGXLxQoCmEduogjXoL6oI17HZGa1hgmkHuCNjBmFENSHNT/pBRUpWNsIYEBcs065jrIlbbS7DivSC8S86ZQ9D0ebx5RDUlyjPerwCfaz4ABnwB9GUXcYfgKaM7f0RAgPPl7u5TOfN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db1e9af9-5441-c035-1998-33be07f6e908@suse.com>
Date: Thu, 17 Mar 2022 11:43:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Bjoern Doebel <doebel@amazon.de>,
 Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220317100204.16391-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220317100204.16391-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0273.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917a5abd-23ba-466f-e147-08da0802ef8f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4421:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4421C15171B54B7152DFF8B2B3129@AM6PR04MB4421.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FoH3XERTXQJeRI7Gpp/3mo/4qXl2TQbVP4yN82hVSB0jop9SWelpZgPJlZKR8tdVSl19kfo5dc8YiHJX22cpCCf/N8/PzcjmHGtk1i/xTva63HvhxlBySwmXNzVhhmbPH9OpLiflbuSJtdZZDY6RLgWh0fWHaZRIpoy1uFk4XWO2EX8rMQSdrcT76clXVZ6VVVKQbaxFt6TMQeow/bKuhRG3TD/1wJVSnB4bRP42bVjFYVzdFDIzzJLM/ow6eZzceFcjnusdAM/G3wbfNZk0Ca/99iHufV4dGomL1Ji13iga7hZPb9bfUPyCveBbpXZJ26r2GtoTDnuY8+9CfseueTNpfaFOZRbGnAno4jUtxrGWYSdck8croF/xYbBVoOyZTa6E2humOQldU7UM9BlVQ3PhQUQPxGIsSdkl+ulYgDWPpGsZt6RY2xp1HDluENsDGQYuBD2W1U85Wh1mtTYuia295QT4VwgrosanpNkV+bQJEA3OrHa7K+OvJpFKR6cFJR35+OiH7TK6DhSpGjaD12EveRCQOyUFnNayx8t47UhPYsU2e5pAY8uIbqI0Ms78WcNpHxU3nkMLlJNnAJzcapfU0VSGtW0PqIAJVgs+QQH+LsMXRIEhmcSlG7onnEY3C476nKq4CqgwexVo6tEZfiYOxet0Hp3URMufsq/R+z3ejjiSSaZik5np/HO57NDi83DtXaigZIvh4FLhPfsYzmuSxxTdQgHfNw6Ec+MUriwKu8D4tX0sJs0NquuYzDpKhnbmNgTMvmI3Gy+7pA9V1TZ53yJiXplChnC0j3UTyRowUtN/CkWlrxGihKRnE9gW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(2616005)(8936002)(31686004)(8676002)(4326008)(316002)(2906002)(83380400001)(31696002)(5660300002)(54906003)(6506007)(186003)(26005)(6486002)(966005)(53546011)(86362001)(36756003)(66556008)(66476007)(6512007)(66946007)(508600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkQwbzhGd3FlSE9sS211V0pHeFVnczd4WDZUVUZTZzErL0tXcmFkcnFXMmZV?=
 =?utf-8?B?VS9YQWR2eDBKN1R5d0ZHSGtubThxRE82UVBsYysrNVEvdnYzeVZFZ1UzQWF5?=
 =?utf-8?B?dDczRWhHMmRuR2RmelVHV3VMQXM0OWtuMDhualJxS0t4RmtzcXRhNDZndnVj?=
 =?utf-8?B?YlVuRjNoOGUzSzdraHBvWk0zMkdQWnowWWtoWDZhRjJiTCtuaHdnN3I2Y2hW?=
 =?utf-8?B?VS9qc0RzZkgwV0JWOG5OZWVKU1FMaHBMTnBjN29sTm1icy9Sd3ltcWxnYk1B?=
 =?utf-8?B?TWhvcWFnWkFuUy9oNzZBdnZpd3pzTVBnNEs3NklXaVNvdDhzYnMxL3lwY2hn?=
 =?utf-8?B?eWV2VU16VnRvNm1LNjN2cFJtL1Z2clc0d0N2cFFkTGR5Q2p2NHJLRm9BMHBK?=
 =?utf-8?B?Vk1MdnplaytLSUFZakhiN2o2RThoU3NNVEF6dVFYbTFLanR1TjJZNjd6dnBE?=
 =?utf-8?B?YzR2eWtiSWF1MVVtVHlSUjVSVGZaanZHZzhzbUJqMVVKcHhldjJ5eEs3VU5n?=
 =?utf-8?B?SENxRW5BNmVvRXdkWWhyaUhCKzYySmxOUWZLRE5YRnJkRjhxRWIyRURORGxr?=
 =?utf-8?B?MVFUakZCUVRrOEJPR1MrOUl5YmcxUkJLM2dVaW56dVlZSnN5MGl1cCs1V3Iw?=
 =?utf-8?B?ZHVHMUQ1Ymx3TGx5NnhIQXp2emxWY3R1T2pUMldGbzhOSmR6UlNRcEFxQzdk?=
 =?utf-8?B?TmlWdkduQmh6ZkRaV2pwY0VlZWxWUERWNE9MaUY3SDhkeTBYQkRscU93eSt5?=
 =?utf-8?B?UnBGOXZTZFV0ZDVnUjRZSFRpQTkrNFo5TWdvZWZCam1JTW96b1ZLTVFXaHl1?=
 =?utf-8?B?YWpjdUZSSG81ZWpnMVYyaitQdUNTOUhHSU16T2hSR1QveHNZMUUvdkVCd1Bi?=
 =?utf-8?B?YjFkNTJINmhXcWdMMHJwYUhLQmNMUGQ2azM2cDF3UUM3Zm9ZV1N4V2tDV2RP?=
 =?utf-8?B?YlZRQUpSa0piVVhWcDlibC9nU0lSbDVxK2VPZWk0ejQ4ZWhBeVpNU1BGd21j?=
 =?utf-8?B?S09PTWlsREhBYnBuTjAwU00xbjA5TmdwZ2dOQXFEMFpCNGtzaTFDRmZ4N1ZR?=
 =?utf-8?B?QVY3c0JoY3Y2WTR5bmNhNUlpQVVETVVBUXczNzloWWJROEZZcEpNaDNOdWh0?=
 =?utf-8?B?eXlLdXhjK1dxVER3ZXA0UFJuYkRGZldxZWlYV1VSV01nb3N1OUE1c1lFbHNp?=
 =?utf-8?B?aTVNM1huMTVRQkZra0lYWCsxTUN3SldseUFIdTRvREZUSjdoVU5KN2Z6MlZ6?=
 =?utf-8?B?cHNKTm42TGF1TXo4MXpBbjlCZHRyWlZ0ZWlKKzRDRGhDNHVaV3ExaFkxa0F6?=
 =?utf-8?B?eTFnK0d2NFBzREJhTjFhbm5YR2x4T0wwUlYxVUlVNDRuck54RWJTaXdoNGtx?=
 =?utf-8?B?RWhDdWRsSmhHVzdjQThtMVI0NnZkcVc1T2ZJeWNGZXpnckVJSmU0RC9xTzB2?=
 =?utf-8?B?VlBqTHROQ1VNUVB3bzdNbDFrdThwY3phRXVRWlVpSExJVnQwQlNNRzI2Mkhu?=
 =?utf-8?B?RzFLUm9xcUpBOWFQTDBPcFdlTWJHNldBTS9Wd2k2VDRGbUk4NnUrQk9nM2Rp?=
 =?utf-8?B?YVdWSExmQWxFRGltbHpta2hjRjJpUnJVN2FBaGFsOTRjT2dmTTc4SDdvbTRM?=
 =?utf-8?B?d0x5UEtEdFg5eUNpbEFVM2t1ZDd1K1czUTY5czU4NzB1KzFjY2wxRGJGejZ0?=
 =?utf-8?B?TzJwekplZ3NKelROMGQrdjVCbWZYZDhpQ2c4THVqT0FkektrOWRzV3RIeFly?=
 =?utf-8?B?VTloMGs1dTVOSkJXem9TTEdNdzRnUTNtejlQNkpxOENOMUNpdTJtMG5qQ3g1?=
 =?utf-8?B?dnF3Z213ZXNzZlVaVVhjOTBFZmdqeTNqZkJRdHordFRIWkkrL2pYaU43anYz?=
 =?utf-8?B?NCtoeWRWd3BUclRzVHQybnNadmg2cWhoaERiRW5RdUVrVW5tNEUrQjFEeFlQ?=
 =?utf-8?Q?kKjMpSs2q8F518LBT7vMV2stu+wVG5D9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917a5abd-23ba-466f-e147-08da0802ef8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:43:12.9580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5TdqwDtAxGQ3/dz/IhJFyKVYOLjyL1jPFe+RIaz7r6qtBsBSQ9LVDzRgwKhgqq/HS7e1jiGWvW5ovHQRk7/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4421

On 17.03.2022 11:02, Andrew Cooper wrote:
> For livepatching, we need to look at a potentially clobbered function and
> determine whether it used to have an ENDBR64 instruction.
> 
> Use a non-default 4-byte P6 long nop, not emitted by toolchains, and extend
> check-endbr.sh to look for it.
> 
> The choice of nop has some complicated consequences.  nopw (%rax) has a ModRM
> byte of 0, which the Bourne compatible shells unconditionally strip from
> parameters, meaning that we can't pass it to `grep -aob`.

Urgh. But as per my earlier comments I'm happier with ...

> Therefore, use nopw (%rcx) so the ModRM byte becomes 1.

... a non-zero ModR/M byte anyway.

> This then demonstrates another bug.  Under perl regexes, \1 thru \9 are
> subpattern matches, and not octal escapes.  Switch the `grep -P` runes to use
> hex escapes instead.
> 
> The build time check then requires that the endbr64 poison have the same
> treatment as endbr64 to avoid placing the byte pattern in immediate operands.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Jan: As you had the buggy grep, can you please confirm that hex escapes work.

(Build-)Tested-by: Jan Beulich <jbeulich@suse.com>

When working out the workaround, I actually did test with hex, but
then switched to octal to make easily visible that the two patterns
actually match. I also did wonder about octal and sub-pattern
matching conflicting, but the grep I used definitely didn't have
an issue there. Hence I assume grep behavior changed at some point;
I wonder how they mean to have octal expressed now.
https://perldoc.perl.org/perlre specifically outlines how the
conflict is dealt with - assuming you have observed grep to misbehave,
I wonder whether they've accumulated a bug. (The doc also makes clear
that such references aren't limited to single digit numbers; you may
want to adjust your description in this regard.)

Depending on how exactly your grep behaves, switching to always-three-
digit octal escapes may be an alternative to retain the property of
making obvious the similarity between the two pattern representations.

Jan


