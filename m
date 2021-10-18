Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAB4318F1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212161.369929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRcQ-00071l-5F; Mon, 18 Oct 2021 12:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212161.369929; Mon, 18 Oct 2021 12:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRcQ-0006zU-1e; Mon, 18 Oct 2021 12:19:54 +0000
Received: by outflank-mailman (input) for mailman id 212161;
 Mon, 18 Oct 2021 12:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRcO-0006zM-BQ
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:19:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b13058c2-300d-11ec-82d4-12813bfff9fa;
 Mon, 18 Oct 2021 12:19:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-FX_8b-S8OriweJtzjCrueQ-1; Mon, 18 Oct 2021 14:19:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 12:19:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:19:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0005.eurprd06.prod.outlook.com (2603:10a6:203:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 12:19:47 +0000
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
X-Inumbo-ID: b13058c2-300d-11ec-82d4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634559590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEQzK1MkG8qn4+sFJQLgEvMPHqf0VSLp5zs3UnJPRps=;
	b=U7Oa2V7X4Um5IbqLMicW2bnUhY/1vHeoiYt8Ku0TCM2gdUJqxbF8Rfcv5dHWcPDnyVteAx
	BEdiavENUU1mpf4dsvdJnp7VZ7m6mRYabsxlUZWxMtGtJDbLP3pcmDDfyG0OfETaIODWqQ
	ygbMBvMjHHBw6cozVb2jR3VYhhVtK0Q=
X-MC-Unique: FX_8b-S8OriweJtzjCrueQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJa/LnqFIrTY60cVDw1jsgjspftSfitVYmofTkeDh68pYiNiUBZxWj5JQ2fGRap5M4f61mhk/4Y+PWy0rMaxgJO2DkY/kBL8uvCo3+sf5f+1586SGMSknoorvFdyr126cm7ebPtp2MUN1CLxbyAVw7D0TQpD9amGXKxzwk1/zvWmrpGp8rahyWg51X8HaTxFznbptsZwjeIRnnZKfy1bC54dsTiuDdzpYhS5Qb/7TtPNytz/4FqN6YSLSnHifuPax0jtV+l1ih//9zYpVcGxL8m44jsYmiN7tqkF7om+YOgoYhTQ7wU8jxmYQCOFzHwd2dR+bDe+z4Zo/MAoYGYNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEQzK1MkG8qn4+sFJQLgEvMPHqf0VSLp5zs3UnJPRps=;
 b=KV6fhBjz7KDy905PiNhocYMMPKUKAGV1LvJbSwgJqSaYOksiecYAV5jrQQbo5yKiQEhe3mWo4+fY7IGtmCpCTai6R+ob3J2ky/p2sjKTlru/tjZXLAcEBOkvS64A4b/8XYbvZ0Xzr/s1mAVqqcA8Y3Hg9I8R1DWNHUH/G9sVa5HdHGV5sGb9/kmU1oYK1hm2jx9oaIZAGH1zieE6cKmhmwfV/Qwev+KvVccU0HEqoyfzYChL9ArYnQt8mabAIyZmdJ/hrKk4dHYZQH8lhDodQqb+jKK9nti+466Y1QXadZ/FHYnj4pvylxz7Ym6VX5QBAuZO8PLgLcjDJzktEiTgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/HVM: correct cleanup after failed
 viridian_vcpu_init()
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
 <24941.20394.574634.548545@mariner.uk.xensource.com>
 <16076406-9a32-5cdf-0ea6-72a8b21f420b@suse.com>
 <24941.23059.261983.36065@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f94a113-59ac-0da1-65e4-924b2b9d7026@suse.com>
Date: Mon, 18 Oct 2021 14:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24941.23059.261983.36065@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0005.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 926104f6-1c87-458c-f98a-08d992319405
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2959B91EBDFEA167E8E8B7D3B3BC9@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9rxN7/9BIF2JvkmAEkNwAdlWTxP/1Y3TWEUIEsmxfy0E+sYmCPl7dNLLPxUMVUkRrLs2rOn7ypiCHx5O5A8p22Xbm4l8M0Ph8KER8vYlvt6/H+1dSwaGWcEivqW2qrqyN3yx9dDVH75nm17fxbIDlkiROXnjT3Y+5omlXe/YaUCa2JxhkQTJCzNV1fLLFlVvmw8p5RHTkuTVmwwRkTv2/uWA70v0suWBBR/s2iLXFpGxcAWnkHINhwfucEPQRK3Hbjo1HJZxoE+X33pRHjqvHay5hObUGYti/Y5C2EYrlGcgz98yt97eA/FCshIc8Sz0LAXd8bv6ln5SQQ86DG8AYlcUt7fMaCD78B35u7XP8YG7uUuWj5xNBM0VkJNY9dlH8kMYYrOqAIw3DI4/XmFUh9D11ioQCe2BdkPHYmpgWFEXgDNe0X5BxKW1fi1PktwBLJw2D8+NkgIks47Wi0ubjzOf7bJWmIDr4U3rX/NWk5/1EMR3EVXPcZ8tPqA9nhA8eEvIm/upweLmGa4LIAqLiXXZ+qtYOVyhe0D/trqKk6vEwsZJcL3bjgnQ56f5kpZhSClboZXfXiwV5iShalCG2yI9ILH5bpRusgLiOzDc3YZf09dtOvkCJUsqlqMrIuKmMkSZ2mPa8BjrW5eL5tuCzXIKKFXIoG54/RHaAKsAHf6J8l45v5MP9UGohqxmVMfSdcRQsd2bYgYB9PU3BrDoAUq7GWBl7t/VpWoJ/ygUoMCxqfD9dxvF8Q0jVmpkrQDW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(4744005)(2906002)(31686004)(66946007)(66556008)(86362001)(5660300002)(4326008)(316002)(16576012)(186003)(66476007)(31696002)(6916009)(8936002)(38100700002)(54906003)(53546011)(508600001)(6486002)(26005)(8676002)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStCM3liaEN1cjZmdGMvdkZWY2o2VFUzSndIVHN0TFY5UG5SejlxRTZXYmd2?=
 =?utf-8?B?cDUzWFBaYkRaMUNEd2lwSmUzMzUwb1Z2bTdxb093UFJiVmc1RVhPZC9icHpC?=
 =?utf-8?B?aG1oYWE2V0dwc0Y5bGZraU8rNUFKYy83ekw5VXVISFI3c3NLbitWWHVqQ0g2?=
 =?utf-8?B?NXVtQXRoSDlzVDRCWCtnWnNYSTZKTXIzcDdEWStDZE9JV1M3TTdCempNUEND?=
 =?utf-8?B?Z1R1YWtWVW1YNk5kd2RuOU8xZjg4V3Q4MkUxY3BGd3QxdTJPZFVHMVpCY0Ns?=
 =?utf-8?B?SG5DTEtZMDRRSU1Fbk5Cc3dpTnBYWlJGYjRNUEM2MkRocnBKM2Rkb3c4dmJM?=
 =?utf-8?B?dFpsZ1JFY1BRbHZ2TXFJTENqK0RGSlFYazJ2OVF3a3l5TzE4NGp4WkNPOS9E?=
 =?utf-8?B?cnRYT1RsVUFrWEQ2OVVXeEJ5ZzdUR3draTZ2eVdPbWc1OGkrUDl6NG1uNksw?=
 =?utf-8?B?MWJKV1BLVG9QcGs2V1ZYZTBsN2plVnRoZEJsUHFlUEwrdEt4alBVSUE4MWo5?=
 =?utf-8?B?TjRuaThaa0lIV0JHcHFvR1NvVmt1UFBWYjBhQjYwbGlKTjhqOU1VMFU1RFJy?=
 =?utf-8?B?dmRZRG1EVisvYjJ6bHhjV2VwWm5RSUtEcVRtNVNRRG5KYUo3K29QVzByMWZM?=
 =?utf-8?B?VTZybHV1eXNmRnFUSXV4eVVLeWRtOWxiUWpXK3czWXB5M0tqVWxtWHpXblBl?=
 =?utf-8?B?c3FXRGZ6d2VkZzNUM0QzS2JEajlzTmpGeVlid3BwQ1FJNlVjcDhTZnhCTEJZ?=
 =?utf-8?B?cVdxcG5GOWFtaVBDb094eU56RHV0QlFhMW5lTW5pQkxrTlFuMnVHclc2bk9y?=
 =?utf-8?B?RWxTTHlzeE95aGdkc2tHSGx1NWtkZjh1UisvWFlRRjgxWW9laVlkQ3lyRVQ5?=
 =?utf-8?B?dGxNTDM3VWxuOXo0K2FNdWdpOCtBdzR5c0wxWC9YRFd2eENxeUU0LzYzb3Bo?=
 =?utf-8?B?eDVUTW5xbnUzaHQ2QUlndExzSWgzU2Z5ZDA5eUJGOXdDdWx6WlEzRUpDeUFs?=
 =?utf-8?B?dWlMUXJRaTErNWVBNnRXa09ma0JIN1hsVVhDMjZCbkxrTGE1NWdRRytONmky?=
 =?utf-8?B?U2Y4THN6MnoxUnFaa3JZbFQwNlJNeDhvd2wrWGNQS1dQancvenB6U0xYQVo0?=
 =?utf-8?B?Vkp5ZFVYZlVZemlRSW01aEF1ME55Q3Q3VEJOM3BKVklCcTlpL0MrVEtCSzJD?=
 =?utf-8?B?ajFwQWNkMmRadStBQ2ZrcXZqWjlTY1pBRjBHM3FpeXQ5VFo0aXYrR0JPRU9x?=
 =?utf-8?B?UXZnLzZLSm9SZDF0eWhjaTcvK0lydkl3ZCtHK0JGYW9uSnoza3pPOWZoTHha?=
 =?utf-8?B?N0lTZDQvRjJ2QkdHVC9EOCtuMEc5NWRrYU5jOE9iYklTdnh4dnBLNHNxbTBZ?=
 =?utf-8?B?RmxYcnVsQ1dIVDNmNFdUUDZ5d241dmlVT09jdXJxQjB3MnlvcVk0NHVNc0sz?=
 =?utf-8?B?TVk1K2Z5VkUxdC9uQ1lkbHZtb0prWUdHdTdOVUg5c2VIdHdrR0tteDg5Y0VJ?=
 =?utf-8?B?dnpSNnhwamdlOEhYSytjK0wwNmdXN0JLcTVmOGlTb2ZIamg4b2svRUE5RFBL?=
 =?utf-8?B?SEtxa28yU3ArcmJ5Um5SK0RETWZ2ZFBxZ2hkTk10M1A2dG9PSXQwOXZhMHBw?=
 =?utf-8?B?Sy9PTGd4Z3dvYTRBY1BRTVVacG9QQnp1djdJeDdldzVxbzg5L1R0QXh2QWow?=
 =?utf-8?B?QUZWMC8wbWxyMlp3M3NRNW5RZi9GMFVzRmtJWHU5SThOUlhBcFd3YWZkUnA0?=
 =?utf-8?Q?TTfrjjrpikysFzPvMn0pCXtm/MzFcm5nKKenjE0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926104f6-1c87-458c-f98a-08d992319405
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:19:48.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcENEt/uFsWn8KTZkEF59abLqil2t+QDQ/15C2J8KWxQ7cuXxKQJTgpRNUx0l20q8kAaSMTu5qNNBlO+8CLq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 18.10.2021 13:27, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()"):
>> Since you've been looking here - any chance of getting a release ack?
> 
> I don't think one is needed[1],

Oh, okay - I keep mixing the different forms of "freeze".

> but FTR
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.

>> Perhaps also on "x86/shadow: make a local variable in sh_page_fault()
>> HVM-only" and "x86/PV: address odd UB in I/O emulation"? Aiui that's
>> going to be needed from today on ...
> 
> I assume these are bugfixes too ?

Yes.

Jan


