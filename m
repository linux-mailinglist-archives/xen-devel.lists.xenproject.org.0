Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E83D20C4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 11:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159665.293655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Uso-000793-UK; Thu, 22 Jul 2021 09:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159665.293655; Thu, 22 Jul 2021 09:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Uso-00076l-R3; Thu, 22 Jul 2021 09:20:46 +0000
Received: by outflank-mailman (input) for mailman id 159665;
 Thu, 22 Jul 2021 09:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0jmz=MO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m6Usn-00076f-BP
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 09:20:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6c7e21e-81ef-489c-8432-d384adf3282b;
 Thu, 22 Jul 2021 09:20:44 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-uepIUy3fOwu-f9Ba-KN0gw-1; Thu, 22 Jul 2021 11:20:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Thu, 22 Jul
 2021 09:20:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 09:20:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0088.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 22 Jul 2021 09:20:40 +0000
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
X-Inumbo-ID: b6c7e21e-81ef-489c-8432-d384adf3282b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626945643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xy9KziwkBTqPBmE/2n9qVyAw/l4nb41AiNBoPr8h9Mo=;
	b=EvlYkNMd8hWhgTYgvMd5Qfq/v3a5AbXlFUT9N+jeeOqnxceUfOH21vpg9NNNFZhSZ7yXzA
	0+gb0r1ZrT7/io+/W3yZhmQAdrRC+27bhaOvXIEVkx0mMASCNm21Uu93ZgG9UGK4eJQgly
	+RyIm6rsqt/kXA6eiCylpA9NH/hL/8c=
X-MC-Unique: uepIUy3fOwu-f9Ba-KN0gw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUwyRhRj1NVrUsWgB/CaE7bT5brRE0sL/4DQMtB99N7B70i6DDchSLLGmtn0SXQwrYinGl68LF0XU02iBo1aBUVwlvxJwOeVYHh2lt06NEcVC53pdf4CNnQgO6CrpLUwjdRxVNaXZ98FrReMJzzu62N0Z6azIPAfmVBPXUrTIJmXiW5Wp2nXA4x1cE6ZFJZGtZJEGj5xwsNqu1VwlmaxH6DjCRJj0ZWZRS33gaGNkKc8XLtFW96+N6UnZky81/xqp4NP5b9thdRHG7CB29NUTWV0OpiJgEcYX2ILGJgPE0VQ7kgCTPcjrnoDqPASrOVUeigX9NYYUl0Nn3yO0Ly1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy9KziwkBTqPBmE/2n9qVyAw/l4nb41AiNBoPr8h9Mo=;
 b=ksj54kNA8Ov7kyaFxrsq6kZcGxNDIdp8s08y3Ymhx9G2VkjCzhaOpQjN73wN0+Hb4c/5n2CJS4R99mpzO4hzU79Rki5xLDj0iy/LHA4Kuz/umYsz03tF5rM8RNZqJWeIDFDIPYsAkVtBQHVMxwYgpgm6NImU0O7cfyey5tDDh6H4+7i2yIc/YkqCpC4jMXg3aECYJMTQr/OtzQahEdans71uAzSYMVTI1mxxGd6PeOEozaQTVH90YzLzr82q0oSf19TznE6kbwig5tGbff6ypiboB90LkGFTUh8s3900iondLR98DKtH7ndjSRH/yQLJouxrmUA1TA0Yj27dIRnM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: work around build issue with GNU ld 2.37
Message-ID: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
Date: Thu, 22 Jul 2021 11:20:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0088.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1c383e6-3453-4ce7-c340-08d94cf1f9bf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26086306304E43D55A967006B3E49@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tIn7cak5emdaClE3IDGYMaTk9rNUIBgr7vLRJuHTzAZtlY2vWmriuVMAeoufYnwcKr/5JHw3Wr654QcirNBYn1MhdmdAhckK9EdLlAhNEuGRyc5xGzt/oyHnLhRwqYZxtOueqh8rgfelVm7Bnes1qUHfGIsjTpBw6PgT2Toap9cgD64iiTU293yRTYP/1GrHlxwGpt2rxq01szXapnl55NI6v+RiG8v4Z1ohX6KhztkhSF0eue4yc91PJBJ9I48MW/G3TDD/TPWO3ptP0W4YbMGWwzQhynwM18kf8c46iCDmIuhlc/jscp1066dkfHPIsFk/9MWVP7exJvrrTscqsGXmpgIVqyIymzlN70DqHDsr+4yt27WfiHIqhNbhoJox8uMwP/RmuJOLhy6sWQFnsbQdzPK83rZXyZddqRKjQU1QILpKKJbnMKGNgk3qKI1Z1nL6xgskmJZyX/YbX869xSWWB1UKvpsotBJLkedrHtvUVgaKQ5XV/t0OYFW4zJrayaOKMwaMc3X6EGaGllqqGdTz28zmrz+jD0CtSjw1PNejTSn/89eFYUsxR4+GFDNiJ5qFDoLp9S+Ym46Sv7/JRAoB35gbbGGovCh5S2RFHUU1mSKK3Dzccsmfn2UmKJ63d59PqHQtBfB8gTvpkqk2tGsQP3mzi1mSa2NLKzAGvsNCeS5EiDtVoPEYVMsLq/1ffnegxfGUV+UZIpC+OgQNqEzlwnWobNe20uplx7BRriI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(956004)(2906002)(8936002)(4744005)(508600001)(26005)(2616005)(5660300002)(31696002)(38100700002)(86362001)(36756003)(31686004)(6486002)(186003)(54906003)(316002)(66946007)(16576012)(6916009)(66556008)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVJSOHJ5TXA4S1lxdlMzSHF4TmxPV2QyWkl2MDB5ckdJVlVaM2hUOVNJQWRy?=
 =?utf-8?B?NTZ4TmVzUU5GSit4bmY0Q1pLMENrdXNLSmxOR0ZGcGVGRS9SOXFrV25TT3RC?=
 =?utf-8?B?bXp4Sk5wVmtLenlpemNhN0h0RXBrOW9nWVVFbUk4VG5VMW1OWnNxVmRNdHBJ?=
 =?utf-8?B?MnUyNWc2UnhtQm5IQnd3TVJNY2tDWkc5UGdEYzlJV3lCa0FZdDQrdTY4NFBY?=
 =?utf-8?B?S1U2dmQvZ0JZR0I1MWMyaXdJWFlENlh5SEdjN1I3RU4wUmszUXVXTWg0MGFC?=
 =?utf-8?B?OTNmdENKWkJ6dVFQcDk1MS9uc050QlZ2ZTRVZ296UVhKSkdwc2UrYy9HQlUx?=
 =?utf-8?B?OXgrbkZBanI0QndacWU4eGV0cGdvWC9nNXZ6L2hpRWhYUzVVVnFJYVBvbXhm?=
 =?utf-8?B?VmhNaWJBd2lMci8ya09DOGJRR01CL0tpdVM3YlZ4dmY3eEJWKzNpbzNzV3Qw?=
 =?utf-8?B?RXE5d2U1TU4vbkFHS3NYK29oL0tnaDRjNmE1dmRwVm5ua1ROMUo5cWY3Y1h2?=
 =?utf-8?B?aVNwSi94cHNvYlE0amdTVnNSem04blNwM3htanA0eTNUQUpLU0VlWTQyV0pm?=
 =?utf-8?B?OGFEYms0Qy9SRWk3LzFYTFpURFlBK1NXQ2s0NWwrd3pEWDVxYXRQa1VZNEZI?=
 =?utf-8?B?L1RtMVVCQlhIMlNwNS9WcjFlZWhaL1diMVA2NlNkRDZLNlJQL1dQUnNObFZC?=
 =?utf-8?B?d083ZThPYmdDcVZoV1pValppNW83QTR2MTF2ZHd4Z2gyRFRGN1ZTemJFOFhX?=
 =?utf-8?B?ZUVsbFJKRDN0RkdoSXMzOXBKemQwNStqUzhhbmdETmY5bDBuam9GTTlBWVg3?=
 =?utf-8?B?TmFsL0NNN3Yxa0kyNGdCOGNDTHV1c0t5OWlwV3lHaGhCakc2b3dtcUNIZEdL?=
 =?utf-8?B?dEYzeUVuWWs3MTFWNXR1NVBPUTQ0SUNYbVhEaUxYaXZqTElqZ1dqb2toSHJw?=
 =?utf-8?B?eHY3d1F2dUJ3eFZ4NWgxWmhSbnNWZUJkeldWUVNUKzQ5WUZqcGozeng4Y1Bo?=
 =?utf-8?B?YS9RTEZuUVUveUtXTDhTUVNDNVhJZ3hQamxhNnNLand5ME1xMGxESzZSc2hl?=
 =?utf-8?B?ZEd3WUs5QjUyd3piZnRnY3oxTVMxeWtYK0pjUVUrRVlrTEhKc0dKSHdBM0xr?=
 =?utf-8?B?NjYxUmFJTk5SRHY0V1ZlQVdLOGc5a2NCZDkrMGhsWUZkWVAzQUZBcHFLd1JS?=
 =?utf-8?B?OG5mcEVvdmZVbHlKVmtIMGdMWDdvMGtpalNneGVyS2U1bHQ0Z3phNTh6VVpl?=
 =?utf-8?B?WkZaSHA4bGNNSEFGMmJaL1BoT09jb0ZiUldmL0tqMGJPOCtpZXVoOVRPTzlO?=
 =?utf-8?B?NzZmb1VLTEFKQ1o0U2pCNDVJcVYwNVRZQ2RPQklwMXFxQWxscld2QUtjdVU4?=
 =?utf-8?B?Tml1S0ZkMk1aTlVEaGN0cWYreFFpeDNYTTVsdVNMY1lWTWFaZU85WWpVK0Fm?=
 =?utf-8?B?Smo5cWNhc1kxTzVBTFF2OExqcWRQS1FoTE1WZ09vc3NsSkZYZDgxSDVNZFhG?=
 =?utf-8?B?UXpXaVNQQzR3aSs4ZGcwZm1GSkxqK28ralc2R3dKUFFBSGxUQTF6MEFJNDZx?=
 =?utf-8?B?dm1kYStqWWthdVpwV2V3NVZrTHIzQUpxVC9BSG4zS1ArUjRucHV6LzN0Nnhy?=
 =?utf-8?B?WlVtRWpFcWc5NTlZQnZlREFVNk5xend2Vm9VMWQ4T1REK2laVDczSVFlaEs3?=
 =?utf-8?B?amJaTktBeDNXUmdGT3FlRVp5Z2dReDE2ZkNFVFc3S0t2MVpBVitTSHNucWZO?=
 =?utf-8?Q?cH4n2cg2eTT4ZQp/KxnZR+VvhJAHZLS4ZVQMOXL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c383e6-3453-4ce7-c340-08d94cf1f9bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 09:20:41.1278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYMmCa65MtUbNfoEFLyDiQ7xBj3PaHQW71vIZ3UOfYOtWIqwKnzpfr8BADjKy6TE2Rb7VMuIjB9QhL1nHXBjog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
which broke the hypervisor build, by no longer accepting section names
with a dash in them inside ADDR() (and perhaps other script directives
expecting just a section name, not an expression): .note.gnu.build-id
is such a section.

Quoting all section names passed to ADDR() via DECL_SECTION() works
around the regression.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -18,7 +18,7 @@ ENTRY(efi_start)
 #else /* !EFI */
 
 #define FORMAT "elf64-x86-64"
-#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
+#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
 
 ENTRY(start_pa)
 


