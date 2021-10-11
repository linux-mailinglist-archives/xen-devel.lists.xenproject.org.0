Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C808C4293E2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206294.361833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxeu-0008Nf-SJ; Mon, 11 Oct 2021 15:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206294.361833; Mon, 11 Oct 2021 15:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxeu-0008Lj-P2; Mon, 11 Oct 2021 15:56:12 +0000
Received: by outflank-mailman (input) for mailman id 206294;
 Mon, 11 Oct 2021 15:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxet-0008LY-TI
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:56:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77967b8b-7c05-477b-8cbe-fdab0168d741;
 Mon, 11 Oct 2021 15:56:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-eR7Z0b3jNHOf181esA_YJg-1; Mon, 11 Oct 2021 17:56:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 15:56:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:56:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0068.eurprd02.prod.outlook.com (2603:10a6:20b:3a::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 15:56:07 +0000
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
X-Inumbo-ID: 77967b8b-7c05-477b-8cbe-fdab0168d741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4fR32Mu8InmyzNkbrp6G63rGpGnTPpRY1tLxjSIr0M=;
	b=LnnNoMsS4bmQfOAujnI26z53IjJ92zyUygqywwRjGHaIl90DPZGhZZN9BG7Y6oc9m3mhGx
	h4zg2z+JL1hxqWatwE8vhREjjYLkhS6kss14zAsSd6UOfrMqVvAUh9Avt0cQVZQxRH6DkK
	dVwqZNj1Mt2aleMKcLLTcZePaUMyUoM=
X-MC-Unique: eR7Z0b3jNHOf181esA_YJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt4kS3S+IkvbvEeHOZtD4vGpOglSXQQs3FBsW3sXtZn4O/EBs0m6rKITYJzU6kO7RXoNBHore0HvC1PuSu/O4XOHtoKS43HSsziv2P4A9Z6kaujX4e4+Z50zyos1u8B+YOSj5t8uG0jZd2S9LIBB49Bll+ABah/1ymWye0TWnFxheBkGlMc5oUN5RAGevTxJPCtGLt15Hcp9QTgJ7aQnKTgQk/hM2a76R8Da0jBf9Z9RH5oiHIwl97p9v3BFsFcRzLJ3fuH5/+H2yJ1R/FBa/Mgi0B8VUsiodhdSYLbOMLVeWRY2z2ph/lnAEBqbLowb8SNvaK+IfTgTW6enwf+SFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4fR32Mu8InmyzNkbrp6G63rGpGnTPpRY1tLxjSIr0M=;
 b=MZzXfTlQm7RPT94sTXCltv83jlRp02aN1zoTDIAqTLVu8pYR89syGba7s8j8ITALhBgW9HKyvVQh976ng4bEFfiMae6InOcyHGzSGueyZXFuO22hItg/jVmhGpk3gZ5MP4eQO0tvBYXVIRY8eQ88xM0khQJIyPOdGBo+w3esSfHTYHIZf53/HYSmmy09LdLOgNGh/YXDuFMG3wD1Mu+2K3yxtiSDkIOIne5CVt+IS31o14G0+w3imWSV6gzlD4TH6SWxuBEKPWc23kwKuCqXJ2f9239oje/SXc7d68yjxxWPO4uKw82c/fXADHrnSuTacaVeoAdi72DQGopa1kITCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 38/51] build: use main rune to build host binary
 x86's mkelf32 and mkreloc
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-39-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2d9d545-4529-fe1d-652d-8f8828838452@suse.com>
Date: Mon, 11 Oct 2021 17:56:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-39-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ebf429c-14cc-4ec4-3543-08d98ccfa391
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480FAAE74F460F74E9968B4B3B59@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oWu/WAphhozD6+9A5pZhfcqUigaJlaOoao8QMAXrJadaAZOSAL2HoVc4L4mkcV6R/5FhsByqV61bcPwChuPyBbV7oBKMOpwrbapDohMeivrUGgVTT4qebvO9kx0RBCGXKo77b75Vw6f4rwXOG/6gX2aBGlAqi6V+YT9nD5FyXESnIiLrN5AZ6vm1/ZQdFVaS4KQSklTLJ7P+KpM8qsqKlRIv0xJXXui2X/uKr5qQYh8kbI1uB3Vdf2XSWrkiEhM1VIOa7GAnHXupV52wfz6tBAGUItV3Xw/9dLgovssmheHykErAqJm/WI144Hj03MNjQ81RPb4Ck3xzB2HkGUylI3LcgKtEZV1F5OHkFGjc2h1s0VNAXsJHVRF7wxF0/5pcchnmJMc12h9a5DcYPG2+riJbswLdXCfo8eJ9Nj3ETLTQt1ONEiPgb+nZEIDUpHGALeuhI0bSXusYHKj+V0B3gt7d0d/o09wKCgn6gxd/yHvTWOOLNFJYf9UD8dwrRqHPN1sN/pec4bzrXzwE9v48o5VKl4PqjtSiYeUCLIHX5+glLjFwMqQxBDDC52jphCM1gYASSE1yNNf2MG1Cj5rI6T3k7VYqlOvdVT0qdjOZ+F3jJj0d+fdj7QY/Bq4JqANPLHMK5xMI/KXn7a5CmzLseKwM1szzZlMA0N7ACifnkX7JKbiS2kPv2yKc2fJDYlDAhI+UYkq4xSm0L3qyc8qeUSZBqm06MIiFhyXrRZuNeqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(36756003)(6916009)(53546011)(6486002)(186003)(508600001)(8936002)(26005)(38100700002)(8676002)(86362001)(31696002)(956004)(316002)(16576012)(2616005)(5660300002)(54906003)(4744005)(4326008)(66476007)(31686004)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtIUmlmQklxQmpTNlQxZHpLLzFBc1pPeVFTdkFpK2RyTGlVWUhnMUhaQjJo?=
 =?utf-8?B?QUl2RFNLYllGYmpJMzdyOEw4T1JFQTN4c2NBcVlFY1RCeGlBam82Y0lIVkU4?=
 =?utf-8?B?M1NyeitXRW9Yd2o3RjJaQW84SnhML0l1UURybTNFZE1ORUZkUGlKUVd5UVN3?=
 =?utf-8?B?SVZvNjhiYnMwZG5sei9Sc0lUYndUZ1FVMG5SYmdwMThTSXk5bndVdVlIS2M4?=
 =?utf-8?B?ZkxZVm9vVzByTnV1VDgwd3ppdGFwN1ozZzdDUEI5cHAwUERaWVV6czlHanNR?=
 =?utf-8?B?Qm9vV2RwSlZQL1pRdWVGTHpmUEdvNlNLWm5EYXJ0cXB4MCtsdktDZXJJU0J4?=
 =?utf-8?B?QVFBbTBvU0R0OXpmYUlEQVdFNC9GTFpVR0J5TnNxbDllRkhwekVYV3ovc1R4?=
 =?utf-8?B?a3h4UXVjd3lvemgwdHMrZGc0TVJjaDBXY09LVWhvWUx2Sk1rUGNlMkUvYTBk?=
 =?utf-8?B?VlVkUC9QS1RMZUZCNmp4MU0xSEVmT2pYOUlqTjZlZHEwaVh6ckFSUW5BckQv?=
 =?utf-8?B?eXRrSVVJVUVGRG9uSlpyTC9Ienp5Y1J3Y2FrS05YU01xVy94RllYUjJRTHlH?=
 =?utf-8?B?QzlBV20vTjNCSk9sc1phRVJUc3k0YktUL0JnblBjYzR1QmxwMXEvaXlZNjcv?=
 =?utf-8?B?SU5hZnoxVGhFRHM2QU53SklaNVhEb3NLSW9RQXVhd3RCMjJOSVZGNWQzbERt?=
 =?utf-8?B?aVBuMi9US3ZmVnBWaSs2aG52Q2xNOXl2VmZ6QWg5amtRL1d6ak0zSytUZmQy?=
 =?utf-8?B?VFFRMFlhK3lUUVFhTzZHNU5GMU9mVHA2QzY2MmJsR2RWRFVWWXBNbmtKdnI2?=
 =?utf-8?B?N3U0TVZoNU1telo2MDBXUEJObC84emt2b2EyNUh2V0pGazV6dUNyV2JhVnQ1?=
 =?utf-8?B?QmE5MDZQMFBveVdzbFp4VDh1WXVUVGl5SXM3aGJsWlZPTm95a2FLTDJxbXRx?=
 =?utf-8?B?RGZPbFRySXZ6dWREd21FMVNweTZGb01qK1ZnNTdGUHBkTk10RmlXanJzRHRz?=
 =?utf-8?B?VnVNd2xyVWNUOE4weDRTZWl2cmRvSzVqU1luaHQ2VTdiajFJcEpxcUVrUCs2?=
 =?utf-8?B?dytTN3lIN0Q3aU93TUdNZnhpNVFZQStyVEdTTTlFZGczeWJZVmpCQ1BjYSs4?=
 =?utf-8?B?QUdyNnNDZXNFeEEydWUxVnZZbmdvbGlKejBQSXhVRjZITnVNYjFUNmorQjVa?=
 =?utf-8?B?WjVVQkRBTlN0TXJBdHRrT3VZZDNhbm5ENXgxTzdZWVFLZ1UxTndQdHlBYzkx?=
 =?utf-8?B?cDIrbEVkRjdBSDl4UkRINHU2TUhDQjZtS0pKN2ZCdzY4cFBBYkhqWnI1eS9D?=
 =?utf-8?B?OXdock9CeUFNUFRlS2l4aHhYeXY4QnVnYWozUTRyY0R4bzV1bHNPMVpITHVk?=
 =?utf-8?B?TkRpZ3IzWVdPbTY1SVRvbkVGMjdUeStqcTBDT1JNOG4xaVJPL2cvZytISkx6?=
 =?utf-8?B?ajQ1OU94VHQxeFFtcEYweEZUYVF5bjYxZnBJM0xGdVNBdTdleXFVdWpoN3pR?=
 =?utf-8?B?UWJSeEE4b0FJOCtVeFdSOWwxV0dFS3RXb3VrOGNMZCs3QWtBcEwzbjNJcFNE?=
 =?utf-8?B?a1RzYzhHaXFHUEhSSTY0MFdUdFpKTTcxelJxWFV3ZXdXSlFYempOYy9PMCtp?=
 =?utf-8?B?cTVUdG1MSkxnSzFIVDFhaHo5YW01ODBJd2xEREJHR0daQkFMc0ZrVWt2UDM5?=
 =?utf-8?B?MFVJNkZPbXU1NG9UTkxaSW13Wm9mTzR3VXA1N0xtY3Z4b2RDNWJRWWZnWTlU?=
 =?utf-8?Q?Az5ttqifBTWRaKB+zfKVqJH1cw8P3HCFWbUW4q5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebf429c-14cc-4ec4-3543-08d98ccfa391
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:56:08.0586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMiUQmIjc9AVIJ4/FgX1wxnZQNsyoUlM9/i4YJMl0O3TWULOLAj7IMVsbVADHjW7qbW2NiN57nkRIYfdQHyu+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 24.08.2021 12:50, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -81,6 +81,10 @@ endif
>  extra-y += asm-macros.i
>  extra-y += xen.lds
>  
> +hostprogs-y += boot/mkelf32
> +HOSTCFLAGS_efi/mkreloc.o := -g

To be honest I don't think this extra option would have been necessary
to retain.

Jan


