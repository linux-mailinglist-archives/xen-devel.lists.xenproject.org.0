Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3374F7801
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 09:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300465.512546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMpa-0001YY-E1; Thu, 07 Apr 2022 07:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300465.512546; Thu, 07 Apr 2022 07:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMpa-0001Wj-AV; Thu, 07 Apr 2022 07:45:26 +0000
Received: by outflank-mailman (input) for mailman id 300465;
 Thu, 07 Apr 2022 07:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncMpZ-0001Wb-F1
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 07:45:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af0c1ca0-b646-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 09:45:24 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-1gQ_7DP8Mju4y9_xdrK3sw-1; Thu, 07 Apr 2022 09:45:23 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2859.eurprd04.prod.outlook.com (2603:10a6:3:d7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 07:45:21 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:45:21 +0000
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
X-Inumbo-ID: af0c1ca0-b646-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649317524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyI39DVD2eJjSOo+tdQjm/3WPYgJrr+nJ+X7QWy+z8o=;
	b=UBt+eB4CHn36RFhJTRYk3G4G47hLd7FBuO/WtaRYq7rNAZi2oYEATmdXAM5LzLACwPxjFd
	oBCFCC78QpLepYvhc94+JQKngUlQRMCQRsqQfYD2TdIY80otwOj1CrKNqVrhk2gH4705IG
	iyptgO8uBKzfteKdM1lsl1TIxEKPERE=
X-MC-Unique: 1gQ_7DP8Mju4y9_xdrK3sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3JNVWQAPRwkkemILRGWxe1mcQ+gww/VLUCcWpQE3hzMHrABtOmgoGVTIqM2KWBcxkqoD3BkuZDg1fpN65aSz6R2AMZjMD0KQzaMjaWLm0NamjzeI9TzWim3jEEafYDI1RXtEaYlK//Fc6tGwbiYJblquQxCuPLURR4/sRunSUQYtpgsz1yQ3Qkv5Ra9WAJfmGGZfslPdmaQ6cCF7UQBeOtwN/cRXXklge2A7j06Cvf7EafhWrE5aQr3Gg/v2+cQdv2ollSu2NZEeuTGvUJTR8OWzFnjFl0VPaGJYjqUe8Q+Le0ihfX+/BDM1dniNtRyLdZpm54hHE60InujsSq+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkIlB57yCEt6Waar1zlwNpDuPjCppWtm3cQCQlXRgWY=;
 b=UTU8HgRRo8u5D4q3RJxKXf5NiDFQ2m48ca3pCmWfzgZxW5UUYfHqCf/1mQeIC3aFz4zOFKcDfZXRzoi74tdS6+6cVJDRmvGbOVfuJMl6YfqqoyX6ELyr5x5C3sB6ChtFhjfAxKBS1mL6ANKbeZsC3VWDtbz32YwwX8ePMEFV0aX5Ffa+WVvERGQtNwGsQI3kunxq9qb6ytk78dRlJT3oQm6jEOZKX+XeYtPvIZADLxUUY/R6hKowoeIFUb+5ZNrvfUd38xa/s7idul9eZyDouh9DULPWo0R7WuWMPP8x8XDIpf/GdvGE/aSWZHjQzP+2fxhtXFnla9r9HRz03AZ0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <211ca973-553b-e2dd-ab12-e05a8e624b8a@suse.com>
Date: Thu, 7 Apr 2022 09:45:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 00/14] x86/mm: large parts of P2M code and struct
 p2m_domain are HVM-only
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <A88AF737-14B3-4EE8-BF36-5D68F9FFD780@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <A88AF737-14B3-4EE8-BF36-5D68F9FFD780@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::35) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be66ba6-64d2-4da1-0da6-08da186a9162
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2859:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2859F89FF8DA0080ACB52012B3E69@HE1PR0402MB2859.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G+7GgERq21VPj+nn6D+6gBLD1v4dns1P4cfSV4+x10d7TaoFj3c2RO4X4tw5hZJ3DhU/BniI1u2PALcEej3OF0Cdd6Ye/yges7B3ry9R5WmRKGCKKquNfHYUR3b6sPs6tzmHRWi/Pm78KCVaTM61z9fZ1rLRw6yMH+pNpjcZOobFcp0wCreqra6YSbvjJ8YAnmXVCZLsw1LLiMfbW+c2jrk0hBkOfteZ2Zxw1XuviwgViN2wngtdVH9JPWshtpXtgE2xNei7YrUETZ4axAHPY0xz2bur5EQe1LPXuiuqGYuOLXarVILE1V177694RogAJi6dA5KTyc5hhvd5JHAt0rRoEFK7JtjitEbYW7jvqoNFBQ+8mLJ4nNJLT9ItQ5yEZCbDqmj1VtD8M45/WAKscBWjzjyMz6a0qntmnXopUair5IRGgDTGu9zIqLRWdHAjWSKZb6Y9SfB29doVPqIm+y7ThWgZavM5a39sgleV6bBeiKi9byBf0zR6mZu4Vb/cxTilIaFZ7v6hryJETfmtx39pGeezWLyKfM2I0c8UoAJt7Z50WSgk6P60Qr1Ii6a6x2asPoK3Mnsm2SEM5wj9Fu4bYYG4iDwmZAadbMklDtSrEvveuV1BYLCxFUDT7wEaNPB3WuBl3+HlbEUBZ1qm40HBfxR+UM0l6+AoNkJgA6v0Jyvzkf1d2yMTH4l51Snqd1GlIjRc8cDZteWCIZjIAd1zA+yU+wmNflu3tu/TSO1LKEGuID+J+LxtYxn/74G+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(26005)(36756003)(2616005)(6486002)(83380400001)(31696002)(31686004)(38100700002)(86362001)(508600001)(8936002)(6666004)(66946007)(2906002)(66556008)(316002)(66476007)(6506007)(6512007)(53546011)(186003)(54906003)(5660300002)(6916009)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m7t6CCX9vXnTXAlZYdKkO/X/zIWUIo4eO1Xd0gtxlmUXq9ZOJHZjhyhNryyL?=
 =?us-ascii?Q?T6J+kTmqIsxYTbEQsUWivfEE0wUMb7rKVKQN7E1gije6nrWXfQKAI13JtcOK?=
 =?us-ascii?Q?4API3cSt/rcjelsDMFRJvax6l/APcV3v0sKJ54GBwz9eeefrERGyKs7dT8qb?=
 =?us-ascii?Q?mvA69njENtVdlMQg1q1bygELDkAAytI553nbHmzgrZ5oJDg2uumLPWRB/0ya?=
 =?us-ascii?Q?3QgLZlirEbsalr+RnQmxejAi5DqRmAEoMzcAM9CUH21MEn1JzwOdWgPILS93?=
 =?us-ascii?Q?KPeZRvWyEuvq0JK6Rm1TVv5KJKzC29vixGa99cl9+BwKey/xuglXE+Zaeehp?=
 =?us-ascii?Q?/3oH0RfU1YMkvlTmD7LFelsXEyWDYjWUMJYKno7bETvCD/Oj4FLis8Et8t/L?=
 =?us-ascii?Q?BUQMAj6uZ4PT+Jd77GXJOf2z89AagPStd1Ss8bUn5zmZsqp/EmiTIhyIjwQT?=
 =?us-ascii?Q?HrMI1mgvBqkN5YkjqRtJBqBLcyZS2Tvu9jDz0wUaEuiOTRXOQmxGIRsgVAVR?=
 =?us-ascii?Q?b+xBUlSodyKtxvbOFA/lZQM9GXOlyjE1qCFd/rXQdGfueuetWdAyKNloY0bU?=
 =?us-ascii?Q?DznlVZSNOcWgQJXRGiz9h1pVdPpmzCFyK1XjDpZ4AW539yH0ghEAYHl895KL?=
 =?us-ascii?Q?RbP3FFn6+rWAraZI29XVUQwQNouof/iBND/rOkvdhMciysXfLhK+QLo0iB9y?=
 =?us-ascii?Q?8wBg5n60+2wRBjMRB/yspmLsaPV5+9TtQ0QfbmksWs+Fsd9Z3XPonRwaL5mN?=
 =?us-ascii?Q?KQpFehHwiHVeTGi/RVSev+VM6v4gTdyjmiVfMN2N0QQpp0UbXCjP41Lt6cCQ?=
 =?us-ascii?Q?osIln0uQNd5BmO0XB8f9fAf8KUp9Hxjk2y2DeNbDl2mHGqeAoQWp87AblmgZ?=
 =?us-ascii?Q?nPKgxbZNkH5vr7t+4UWbez+YN1TnMWXJEcPPiPT4LJg4kZ6qRdAT4QzgYh/z?=
 =?us-ascii?Q?I9Ui+oXxfzM6+NmRB4Q4ZwzQBj2Kn/t2tSrqeDI8asK4cp2Ixr9ItYRUhUTD?=
 =?us-ascii?Q?1CEslocA3/VjsIw+wbUrD8olW7YuP92uw0wSXtg7bOWuPGHTpO7N78XcOJyF?=
 =?us-ascii?Q?EJARPrL/MHaWy49fJIrTcWklzoUFembaIH8Z3vo5H6h+cpKJ/SeCAT0jRk4k?=
 =?us-ascii?Q?dQKCqvz34OGUtPQ2Nhbo4qH7Pv/7+k+PCAydpbDV9+fnkFYonEbjmNGctin9?=
 =?us-ascii?Q?Z8kwB8zC6FpFXu9ZZdXLHsF+EAP0NcTlgwC7hCPkczSitnIwIQvT3ezIV8Xd?=
 =?us-ascii?Q?HdFeDyEUPwVDjyrGfppG7mvbw5uCy+4oOEZaUP6ftzCI6hqVvLmcY/LpHs3u?=
 =?us-ascii?Q?gzmO4lRouvmMzaOtvSgoXPbRTmdge9ypxaFDVIH2NPCD2ejsj03d2pF8goFt?=
 =?us-ascii?Q?ypGBJTxt5X1vb2hoYijugwJfBoOtkv8UDAxEFengvPmAoJBndfwTsA1nqUzk?=
 =?us-ascii?Q?+EuqrQwGptzHvUnsKS9dmhWclqWVN0tqosfYIDPHzSI0OooSDuBLhGiuYyUy?=
 =?us-ascii?Q?a2fjIj7CXK/mdDxReL0iwxXmj7Q4wwmR7725e/EqxnZRZ5x2vPaREyTm/Rno?=
 =?us-ascii?Q?bVgM8jq3wfNqTLLaJnZw6b3hsuhANnswnsNkhJ6mPjpfHoZ2tha1+Nni+18c?=
 =?us-ascii?Q?GnuGJ5ogCCXXGW7A93nsPg0QsvQmlBi0i0yt5pX/aMB1ym7Db41uKUoAak9T?=
 =?us-ascii?Q?Y2dPesMldI3t4xZ3mFqYuATSsPYGvB50v0qoZbih7R5oQW9+NpRK+nTylrNn?=
 =?us-ascii?Q?rHqhbjHj2A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be66ba6-64d2-4da1-0da6-08da186a9162
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 07:45:21.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jwDOb2luFcElQgxf/eFyd2sbDLrW3fS9IQwOELbZjMQIsBUa6BUViy6gdFiOSev0v22tu0KkyWqws+uOnEA7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2859

On 01.04.2022 14:47, George Dunlap wrote:
>=20
>=20
>> On Feb 23, 2022, at 3:55 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> The primary goal of this series is to leave p2m.c with, as its leading
>> comment suggests, just code for "physical-to-machine mappings for
>> automatically-translated domains". This requires splitting a few
>> functions, with their non-HVM parts moved elsewhere.
>>
>> There aren't many changes in v2, mostly from re-basing. See individual
>> patches for details.
>>
>> 01: x86/P2M: rename p2m_remove_page()
>> 02: x86/P2M: introduce p2m_{add,remove}_page()
>> 03: x86/mm: move guest_physmap_{add,remove}_page()
>> 04: x86/mm: split set_identity_p2m_entry() into PV and HVM parts
>> 05: x86/P2M: p2m_{alloc,free}_ptp() and p2m_alloc_table() are HVM-only
>> 06: x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
>> 07: x86/P2M: split out init/teardown functions
>> 08: x86/P2M: p2m_get_page_from_gfn() is HVM-only
>> 09: x86/P2M: derive a HVM-only variant from __get_gfn_type_access()
>> 10: x86/p2m: re-arrange {,__}put_gfn()
>> 11: shr_pages field is MEM_SHARING-only
>> 12: paged_pages field is MEM_PAGING-only
>> 13: x86/P2M: p2m.c is HVM-only
>> 14: x86/P2M: the majority for struct p2m_domain's fields are HVM-only
>=20
> OK, I think every patch has an R-b from me on it now =E2=80=94 let me kno=
w if I missed anything.

Thanks a lot! I don't think there's anything missing; I've committed
the first few patches, until one where I still need an ack from Roger
for a vPCI change.

Jan


