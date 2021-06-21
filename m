Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91903AE3EE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 09:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145365.267462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvE8O-0004XU-EJ; Mon, 21 Jun 2021 07:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145365.267462; Mon, 21 Jun 2021 07:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvE8O-0004VR-Ab; Mon, 21 Jun 2021 07:14:16 +0000
Received: by outflank-mailman (input) for mailman id 145365;
 Mon, 21 Jun 2021 07:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvE8M-0004VL-W1
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 07:14:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8c24296-2931-416f-bb65-984b3fa6b7bc;
 Mon, 21 Jun 2021 07:14:14 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-8Ev31JlwO1uOcBxyeTXmPQ-1; Mon, 21 Jun 2021 09:14:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 07:14:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 07:14:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.9 via Frontend Transport; Mon, 21 Jun 2021 07:14:09 +0000
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
X-Inumbo-ID: f8c24296-2931-416f-bb65-984b3fa6b7bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624259653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8p5EWsavLYqmFEVhNRluVS3NJB+znh1u9p/pejtpCw=;
	b=NC4K6qtuGcBZQUjfngoevr9Jg6PaSMmPmdLXCOHguhpvE15MbpoarMMS2BDJuqtlXQ5J1x
	9kxAR3LcHSfG/XVcZNurC4yqeJUdL8GV8Vg0QkLZwz2iXZ4FMGR3wN+axHgkJFWa7nJKEN
	909hejM8DUchf3zKC0hd18eJ7tjeXGI=
X-MC-Unique: 8Ev31JlwO1uOcBxyeTXmPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfI7pscZH+/duSoCP3VqMIpKtNleH9ZrR02j7Aw0MyAlTHVSxyW+vcN44DgHQcE4A6X4zf4bNgsOslzeTbVB7XIhjwwT59TfUvD5/pMhlLqH8PrXHdQkdXIeNGJXYdv8bGm71feqSgBjxRAGVx7pPFvTaC4GKS6xciBJH1DVvwkq6zorAUZTqBdvz0hMzeozIBrjDAYU//a2WG52VNuzrHtUjUz6suoH9NOGZFVIbajzYsIZ/rHKJ/CjnUWZan3bvU0Z33ozSA6zkiX7Dw7f5VD26HA987jpSj333ZtKWIn/l8SdgoPxDEjEkon2w4xDOMGX2gnZqs5KvWXDVuhhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8p5EWsavLYqmFEVhNRluVS3NJB+znh1u9p/pejtpCw=;
 b=PXeIk0ob6GiedsnyxCPC7tkCVvLIEacH8gq2NiT4RIWmooKw/2Rg77b+foCh3350qNeJThI6VwAkmHzmlkXMgiw0EqVyCx+SqTOJb8YpUAJ2kYxorGO+SWI4SYGJIyfLb8UAtVjpnpq79KUubyFGa6ygPBBwyVWwUGVpAbr4H3HHO5SI880ohuh8MdYkyatzXkk55K3eP0JM6hmEPgxEZsnLbxSLlEynAOHsfn9xwJhUSxxfuU22pE+gDIolqAVuxgGkGEki2UYNVi8pM2LoGhNTKlWIrTCeani4dnlBwAp0sF1X+pa6J7pmulElavTfqArZuzbYzuGvWiaR2pezAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH for-4.13] compiler.h: define CONFIG_GCC_VERSION
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210618164207.5111-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d2d9420-2285-8742-f59d-d136e97f8fd2@suse.com>
Date: Mon, 21 Jun 2021 09:14:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210618164207.5111-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8432c990-b422-4347-0fc7-08d934842a46
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477761B4DC27E33795D8882B30A9@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ptoU/6PM7mPIhQ6Zbmt+der2hezOZGmpmKBPGT/uTzm9C4ixilNYhoK9rIdzMOmCXuNmFPQTz176c1U5qX8ZvYBfi1ts1oPkfWWNexEvQFmyVTQEvYloZn9KzToLCFJsInWT/1U5HwiLgsFA20d8qttdJzii99lAHcSzKkyUPHqV2XrUCXHdZGgp11keJwZTaIDov+WmntZ6+Q1wSNa+aeGEfWOkWVrenhBqTkkvopnTJldSupT+S/4u28+Wo7pWO/w7nRsTaj9t01h2wFSfYVe/jTlIQh2K5/9+Bdu8mw9/oSc2o3SJR4UI8h0LOHFwdIfwOxtZY8Eb4xmCeYs3h1vshDd2IokFgPXxym5Li2lj4ed3aszqLrXPQaKIrBlsf59BGoyJA6F5FZCm5La54LOGoDdR1SFBsOd9JgQBzpMZcvUsU7G16vcFNqEyUmb7ovQd92ZSpuBCCXkkXvBAgSP9tw8Gf34aJyDE430edfIkbDn/b/2Mt5WHcNQlq1GXKZBn5yk5njEmCp7QtwlTcYlpl9Kvlwwk7Xg9aQzyZZiDzq0qgrs3Fm6MSeJQ7hdgfhx35oxli6hPhGS+jYx3TDXSotEwhS12IKxHXndpfro6tmMb5g15XLYOAd4d082Bqlv2fg+Xxv63kCHaw0XYJuQ7riXV1m7V6wxCYyzAWh4FLBJFGgqXPeVudBHF2F35
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39860400002)(6916009)(31696002)(478600001)(5660300002)(316002)(4326008)(8676002)(86362001)(36756003)(956004)(2616005)(38100700002)(186003)(31686004)(8936002)(4744005)(53546011)(66946007)(54906003)(16576012)(26005)(2906002)(6486002)(16526019)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVRtbi9FSzBVNGpaK09HTXFrY1NTQWdXTmxzZnB2U01NNTM2QW9VV0FKVDUz?=
 =?utf-8?B?d1gva0hZbGZTS25CVGxZU1ZrdUFGWGVGMkZCRU5ycUJVMFNrM09zL2c5NHRS?=
 =?utf-8?B?Qm5VUXlZeTRuUVpTVlNUdHo2NnV3Z2dZYUVrbCtYV2NaOXJtbXRYTTQwWXNB?=
 =?utf-8?B?Z1BCUWRML1lHN1dWVHcwcE5TcHV5QTlFdFFEK3V1aGRTNlZwOEVkT3dpek82?=
 =?utf-8?B?c1FYOXBzZDVRN2x5VGpVaUhkcGhiN2tZWGkwMFo1Y1dEeWtiSTRxYmtKQlJy?=
 =?utf-8?B?dy96MDBqeE9tUGhmSEhrMnJLcUFKRWtKd0JyVnZObWVPWU5MZEMvN1J6THRi?=
 =?utf-8?B?eS9icGtrZWpYamFBR3oxMmxzTXpwL1BHdjk1YW01TVZVZE8zRE41Z2w0WWc1?=
 =?utf-8?B?SFR1aDVrNzhTUzdDcU5PTU1KZktqWjdhQm9TQnA2UVMrb0lYQStEOWU4eUdT?=
 =?utf-8?B?Ynh6Z3JsYmNNeG5WU1NPZWEzSWFXanYzSXNycEdZcGltekZOQ0Uvc1ZRNXIx?=
 =?utf-8?B?eDNiQVJuN2FYMkFFVVJrb0t5VnQ5TCsvTG16R29XMUNSNlloUHE1L3pIOGtC?=
 =?utf-8?B?Nm9BZEZ6RnBnQjkzMWpBVml4NlhHRXhyc1ozTHc0b1lZWDdjZ0FJRk5tcEdI?=
 =?utf-8?B?cGhyOWY1YnNCT1J1djMrcytBZjhNcVljRm1QeG9DQjdwTXAzVCt1MHYwbWRK?=
 =?utf-8?B?NFZBYStwVnkrQTBkdStFSnRLT24vSVlxaDNUeTBpT3V0Uy9KN29MMjRkRU1Q?=
 =?utf-8?B?RWVFM2gwdStObzFBWmY5SmhZQ2Z1WXYwUzVHdG8xcUhNbHhJYWIzWHBGeGs3?=
 =?utf-8?B?N3Z0NzRVekVKNEg2Y2RoRXY4a2h2MGpkYUZiZ1hCaENKUTU5VHdveGR3YVN1?=
 =?utf-8?B?ekJjSnpHbkVJMHFIVFRwc3lyVHlGVmlGV3dzTnhodlIra3R2YXBtSjhLSUJW?=
 =?utf-8?B?UmE3WHhtemZwNzlvS2dPQVlSaFVPcEFjRlljUlRCMTJzN1c1WnJJcnFsUXBp?=
 =?utf-8?B?UXJ6YWdWMHh4UUhTNFJEQ1IrVUFHbGFxeUFpS2M4bDdGUUI4SFZmQnFwRVIx?=
 =?utf-8?B?bmlkZjlXUi9HZ0wxWmZ0TGI1MitUN29ZRWw4NGx5N21pV2lsSkpqRGlsZ2RV?=
 =?utf-8?B?cWY2enVueUdMa2tZbitlTDEyczErTGhLcFBVNXlNNW9TVndPYTZldDhGTW5Y?=
 =?utf-8?B?TG4rbVQ4b1NSdE9ob0Y2VDFOWUNGL3EwZmtLZUJMVTZlNmhMUjZiZDB0N0J2?=
 =?utf-8?B?MEY1emZaYUplNGQyZTNSTDA1TXRaenArZkpjbUF0bWd6NXFLUndPcTMzeFJV?=
 =?utf-8?B?UGR5ZXIxWG9KZUNXcThhVkpacnVZMkI4TXBXdnV3UFFVSWhFbUtTZ25oM2FN?=
 =?utf-8?B?OVdWMk1Mc0ZxUFFEVGJmcW5OV0NKZVJFd2JmbDJURXBiMWozSW05WE9DNUcz?=
 =?utf-8?B?aEN0RXlHWEpodS9SNW5vL0ZQKzRJY1dTRzQwYVRVWFFvaTNiSHkwZzZmWmpF?=
 =?utf-8?B?T3ZBOHhHVzBHT0hkTjBUR1Zaak1rQ0gvRDcrU0Rzb1BxV1A3RlMzV3R6OVFT?=
 =?utf-8?B?ZlNyeFZ5bDdBMzdFTEZjbDNnZzB2RTlTQ1QrdFRFVHZrblNraFZHa0JDajUz?=
 =?utf-8?B?bDk2Z1pvaDRSZklDbURMNTl6OEEzcFF5eGpVSVYvWWErWEJRMEp0cjNHb0dK?=
 =?utf-8?B?OXJDVnpKUTNoY3V1SFRpTnRUK1pwckpXc0NheDl4cnVQUUJFTVR2SE53VGRV?=
 =?utf-8?Q?CEZDG9gUP5i+nxSgPdrbeGdsc5vcTZEBcyGRkEQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8432c990-b422-4347-0fc7-08d934842a46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 07:14:10.0647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1z0GOM6f5FEZZ6sgEYLdtwknTE0fRuwZjCBoCZ8foXo1Xh5YteMufxHrFKOEZdczJN3H0PuViBavlSVbzSqgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 18.06.2021 18:42, Olaf Hering wrote:
> Fixes commit fa5afbbc20ef3577c5338f9d0b24dad45cef59cd,
> due to lack of commit 534519f0514f52007d504e0f2eeb714de7b2468d.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -99,6 +99,13 @@
>      __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>      (typeof(ptr)) (__ptr + (off)); })
>  
> +#ifndef CONFIG_GCC_VERSION
> +# ifdef __GNUC__
> +#  define CONFIG_GCC_VERSION (__GNUC__ * 10000           \
> +                              + __GNUC_MINOR__ * 100     \
> +                              + __GNUC_PATCHLEVEL__)
> +# endif
> +#endif

... I question the need for the surrounding #ifdef, and I may also move
this higher up in the file while committing.

Jan


