Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C75431929
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212170.369940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRnw-0000qr-8Y; Mon, 18 Oct 2021 12:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212170.369940; Mon, 18 Oct 2021 12:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRnw-0000oq-5W; Mon, 18 Oct 2021 12:31:48 +0000
Received: by outflank-mailman (input) for mailman id 212170;
 Mon, 18 Oct 2021 12:31:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRnu-0000ok-Um
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:31:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ae63675-300f-11ec-82d5-12813bfff9fa;
 Mon, 18 Oct 2021 12:31:46 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-oPzEKDNcNheB25fUFe7NQA-1; Mon, 18 Oct 2021 14:31:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 12:31:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:31:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:48b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 12:31:41 +0000
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
X-Inumbo-ID: 5ae63675-300f-11ec-82d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634560305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfqe/YEfxCbwvfLVoWy/0S77ziqucFehXqYss2BRZPw=;
	b=JszrLAP6NE5Se/NoCthX/M9txImXvFkSCFG44TTl0fH8u/9wwCCyzuy2e8vMmsij6qXcN5
	rWvhZXOiSfFsSxiv5yyW5ACqBqq1QKd8MkbtXjQgH0uwSowUXbi3jvZY/EYJJPA1/ZVH4T
	tefCq50VgU++djA1lXwt0i9k+lhNvPY=
X-MC-Unique: oPzEKDNcNheB25fUFe7NQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDMTu8QfbEYgUvvtdju0pj1/T8zvk+6TX2O3pc2OgqXAIwFFFXoezytLL9LWW4uuadFbVvZbhiv1RgUWAOPoAb62Do/Xi2G+z4s/louPDBhG+l8llCxgCtbsbD+PcOd/qXcdPawePeLnJH3A6oD9BMsIhDvtSAD/eIcNgZdu/AtZ//HAeblE+89lQxnGVv2/GBxRZEsOIsF4yOMJGn2kRiqQJKiPlmWVIOzs00Nge2tjiWBtPRN1CibeljV8TiX6nk/CrGenY1cHtaS8dhCYm4NxbrDrHQ7o3cMgoxDBnzN/TyE6UkkR2ju52LH2IkqJSwLk/dt2fW1yey0aEWQ18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfqe/YEfxCbwvfLVoWy/0S77ziqucFehXqYss2BRZPw=;
 b=JDr5+Gz9fa3midXW5wK28c7OJTdrvt0mrYxJZ15xYPBOnAJT1gm9qVsjH+oGx5Gyx54Q8OyXGRJ+vLLraQSmyVJ0Etu62jdjuqfEBKcnN0LxfSCqyShORdaoeaNQy7bo2sZ1urK6z5+TwviXUn7HIEzi3GAm1FAggDb9KolHL1sRoWabEjlfDGN1QfwmYsTxxf10JmT18dkzhtuUiVp3+YLvh2sr1It5rVNab+9n5386gEftPhsl/aQsp4JH1bCFWKmRgP9mcYglkRJhuPrA62bApo2/4d4EPVSiUoPxiAJAX6obVts4GTyZeunx8fUAmnwnIFjd5js2/ao0C88NfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] xen/x86: modify hvm_memory_op() prototype
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71fae3b2-9f90-878c-50f1-e9c0d7cf7e5c@suse.com>
Date: Mon, 18 Oct 2021 14:31:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 828cdda2-68c5-44b8-6c8a-08d992333d2c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384C898087C0C60568FCA18B3BC9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8lezL251FqCX/Ar+oQQuk1e9lfls/gJ2UPgMiXrWlb2RzP+bCJFssWVMadxtNf966rX5MLd+qoXE0UjMfiDHX1rmrn7k1FtLYF6sygXsNDO6WYO6yeP/vE8KOrbCYvOZbVge8vDCyWNfJ4e73AAJLmfH4nUB7N8jBEdRQIRF02YpPCnwyC9Y3hMs+xxhgjyJNDieAHsCz/ZU3wqNF/arv/X76DzxQhJ7j3CHAZKA04PevuWm6WPeHJZX0MB1fj+KEiBGR+N9NJA5+MFWAUr8SqTQRXLhzS33YjHIO4WQ3/MxMhjGKlZ2FbPjOoWOkTMoEhmtYtroYus5tyeNUTVXZyCpWZ610I5XvP8/36IL3V2oysKC4fIN3gQ4siF66cqkojESZiOt9zKJKaUGLhf7pBDlgbglD1IRkQ6ft75d/aKLSGFq0wBkIbO6rCp2/MHSpwzRhnKtEY6NcefLzyCl8wSTmVmEt4aSvycyAKTyBi5NhZyh2/Efn82oOHhiMGFofAKvWo0cy2AZRqXbER1cQ8TOkiclbebYALQj0A6wS1+KbKtaqn0Tl/BcpN18rMbZa5oOY0SQJGFDQuuiBFJp4oZsNJj72OpzcgVYM5SOxVqTQU1rUGn+AjTkDZPxkdXuLXhrAW3x1Jz8D00tvZvxp1j0nv4+4Y/h1h5Vf25lg5OzmXDBVQkrObOe8i4rOqKXkVYboyVS3es9yIW1DKWA+iKml7H6CGnsAF9OscUG0arkhTbkvbWo7tlGU3ffGrz7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(8676002)(26005)(186003)(37006003)(8936002)(16576012)(6862004)(316002)(4326008)(53546011)(54906003)(66476007)(66556008)(31686004)(2906002)(508600001)(956004)(2616005)(6636002)(5660300002)(6486002)(36756003)(66946007)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTl0NG1PTzMxdUZNcllrOEtydFZZQXZtYUs1NkdPYlhkckhBWEZ1RkZSeFFJ?=
 =?utf-8?B?Zi9FcDZUejU1SUsrZ2RVdndWMWJuWWZYWkFWK2k5Wk03UjRrcnVVai91emcz?=
 =?utf-8?B?cXBabEplVkpDSDRDZlYva216UkNoNmZ6R2I2Qi9KeWdEajhzbTZsYndHZmsv?=
 =?utf-8?B?c0xrR1BiL1d0OTZoVGhTMFZYamdvUEhQTVBzQytDWjNOeWxxRjEvRnpiU3Bz?=
 =?utf-8?B?djhkMG11a0NyOGdnVTNUc2NMaG01cVkyZkoyVG5BdUZIa0dCQ0tRZUxXZGtk?=
 =?utf-8?B?SjA3cHRyN3orbGd5a3lEbkRnazVTd3RWV0RqU3pMVGNCNjJVRjNBQjNiam1n?=
 =?utf-8?B?ZjREejg3MlRoZDZrTy8vMVQzdjlpcjBpLy9xOHZPN054d0hhbWplUjdVOG1G?=
 =?utf-8?B?d3RPZ1F2MG82SG5RKzNvTWIzZSttQ01BOW4za1VmMHluS3dkcXFMTWVYSXZO?=
 =?utf-8?B?QWRMb3FFN083L0EyM0p4QzJVMm5Xa0VwTGVqdFl2M2o2Y1ZSbWEzNjFZNnlW?=
 =?utf-8?B?b21ZMm5ic2l1WFY0d2UrdnczZ1dFc29tSzFTaElmcmszTmoyVXVDYnR0NzRh?=
 =?utf-8?B?NTNsSE1KbkkrQllzbCtQVUd0M1NnM0ZXNmY3WnNnN3VuTlVuOHFkU2tpWEwr?=
 =?utf-8?B?dllveFJxeXFPQ2l5QWVabHNTSm9WWXZEa2NBQ3g0dU5ldkR1TUprMDBvMEZx?=
 =?utf-8?B?QlI3ZmRhOFpKSGxkc2NhZElyV2tBZW9mRUlRRm1qRStjVitRdGlTRVhxQlFu?=
 =?utf-8?B?TnZaTG5xMFFYamFIK3EwSytoTFViamg4S0pIOFNhZmRCZGtKaUR4ckx1SzIz?=
 =?utf-8?B?QzEvM2RNOEtJYmFNSXBpQWx1NzcyREFoQit0Uko4VzFLUi9ZWU5XVzcvMkQ5?=
 =?utf-8?B?dHZVNDNuN1hLRFNnclBLY0NJQk8rNGtNZUNSRm4rQU91anFLSnlETVY4SDZB?=
 =?utf-8?B?aFk0OFhEM0FhVThQZGpJc0IxbDBPRWVsaFJXQjZFQmVrQ1B2aHFsbkFnYnZI?=
 =?utf-8?B?Qnc4OGU3YytkVFRYdTJVQk1JTjIvZWtObSt4a0E1VkpOTEtmOUMxK3JWbFJu?=
 =?utf-8?B?RlM0eDlnZlRiTXM2bHFIU1FWSjRaSnJXR20yTHJRd1VSdkozdVV2QmhTSDVD?=
 =?utf-8?B?ZUd1T1pEL3FBcCtmWjhoaGNIUXovQ0lObmNWM2dDVFltSDlMdjI5VE0wUlMx?=
 =?utf-8?B?SFo5SVdsTUVSTVVlU3ZJV0FIQjZ0L3FVYXpSbDRzWVJaL0p1bTRwelFDTG5H?=
 =?utf-8?B?VDhmWFhQd1RIMWNDM2FVc2Q0YVN4M1RvcGpaUURDdTA5bGpYN1hobW5reWd3?=
 =?utf-8?B?a2g3dk5vZENYdnU5Wm50WURBMEtURmtYMkZ5TjQreGZERjFlc2RPRENCekV1?=
 =?utf-8?B?cnZNZmplTzNuN1piWW5hZSt5U2NWNlJZMEVNZFRlVEpXTGpFQTJYVzJZaVZh?=
 =?utf-8?B?cUtFU2NhMnJmMjJYb2VIYjczdGlTZituTnlWTDN5TkNWcFdYSWpZTmswd3pz?=
 =?utf-8?B?TXRZQTA4V1hZY1M2RFlKc3JXdHFoQytmUVlhZWxoK3V1L2tFR2kxU3drOFNT?=
 =?utf-8?B?SGJVUDlNTFkyRUpheFRpVXA4TjVaS3N2WkNCUmJocngvVDlUYkowOWZFZkhy?=
 =?utf-8?B?c3E4VDN0TnJZb05tZGh0R3dHUWNRUFFlZGhQZGtnUENvTEE5R1VkcnlyVldI?=
 =?utf-8?B?Zmhkci9ubVlBaHZKOHFUNXJJYktkSFloSEpaQ2dnTVVXQVpSUFJRREZzSkpn?=
 =?utf-8?Q?RXgLOGpxplVb/8SiSv0oMQqFVQA+Oq63jnbfTWf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828cdda2-68c5-44b8-6c8a-08d992333d2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:31:41.7894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stF3GH+l4T07BNZ1/UurEWnNPvVhl3eD1gNeUoSwD1jvJkU/8ojbXharjyn5fHfaoWdq86pt2CZ6Q19uBEvhtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 15.10.2021 14:51, Juergen Gross wrote:
> hvm_memory_op() should take an unsigned long as cmd, like
> do_memory_op().
> 
> As hvm_memory_op() is basically just calling do_memory_op() (or
> compat_memory_op()) passing through the parameters the cmd parameter
> should have no smaller size than that of the called functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless ...

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -31,7 +31,7 @@
>  #include <public/hvm/hvm_op.h>
>  #include <public/hvm/params.h>
>  
> -static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      long rc;

... I think this would even better be dealt with by splitting the
function into a native one (using unsigned long) and a compat one
(using unsigned int).

Jan


