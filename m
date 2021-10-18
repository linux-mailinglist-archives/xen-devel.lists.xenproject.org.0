Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F1431231
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211818.369482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO3h-0004WC-OM; Mon, 18 Oct 2021 08:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211818.369482; Mon, 18 Oct 2021 08:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO3h-0004Tz-L2; Mon, 18 Oct 2021 08:31:49 +0000
Received: by outflank-mailman (input) for mailman id 211818;
 Mon, 18 Oct 2021 08:31:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcO3g-0004Tt-AP
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:31:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d498f3b6-2fed-11ec-82cf-12813bfff9fa;
 Mon, 18 Oct 2021 08:31:47 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-CZLK6DqUM1GK2xGWyQcF8Q-1; Mon, 18 Oct 2021 10:31:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 08:31:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:31:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0049.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 08:31:42 +0000
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
X-Inumbo-ID: d498f3b6-2fed-11ec-82cf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634545906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9fXPAUvp+PI5noEtMwq5/nEfyVlrqz8Jizs1H8AwfI=;
	b=NWmDijg58Br73LK+ZsPFbTG5GHvG/okYbPfI6nVIezy54MOB/cuqWkMXEIasTOBsrrKpFJ
	5zLF7GRJrgFyi6bW9iGgMu+JDzmnjt2SBWMt8M+EoG4aM/aVHbSQ1+ATmHQML5D/KMqHQj
	SR5KK37Sg0llGu9H2k9Y6NfTkvbnNiY=
X-MC-Unique: CZLK6DqUM1GK2xGWyQcF8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOc2yzo8J091O9JzRtmGa+FcbegVMDQkfH9A8ynYx0ak7qQk1OlF2vwPnHwskM3DEV6s8docEigPbi2pFHcgSK/WPjj685mkEDRD7fRD7JzD1jBw9QR002897d480ih+G0wFvSpT0mSJYsVVloZhuRV//yoNt7/qeivKlb4XW2o8JaWAZ3uwd8d7sNxoUNHoVezSP+tx1nGfsgbwCFq5BWEQWZFkZjA2J1bQtQU6ItXy/Kva+ymJRWFt3lTwblYXOPJFT49UynSd+fgPxJMYQlBt1t/YvloVZUxAKXbqQJfS43rFBWMMQvj7k32V23iQSdeP/F0c3Dw7UKoi5zE4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9fXPAUvp+PI5noEtMwq5/nEfyVlrqz8Jizs1H8AwfI=;
 b=WRNIC/wd+ac3BpDiziV/HYlHix7N+fE3FnDNNd3+Q8uGj7yWh6zF+uftsO0/EfL7wXlzNQHHphlgG/Bscub1T0sY9zXQdv6UH0RfsTxi2QZWsoD6tabYVjQka1z60Ul+1h78IDfdLaSn0GW4faHCTnkSeshl9/2xJyh4uVLD+FqCIiqJ9/szfXUQDmtXL26nVHGBsjp9YFCVIVRyEg0Y8QGmK6adG2qAtoevDRFml0m7hOBXr43IBhTqVV9YAqADZv6k/xnjxTgeos6dXo62sIiTtzS7UVEPtNzCuyImILFqgZiXUAdSZAktaHGYxjdlr899nGMgFyLu3UV8PvgFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH 0/3] x86/PV: '0' debug key stack dumping adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Message-ID: <9f86c0ce-0a47-dc2f-5642-95c99cb8bb4a@suse.com>
Date: Mon, 18 Oct 2021 10:31:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0049.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 896db434-9bcd-45f9-4e04-08d99211b6dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71523D87DFC8D1DC52381F5BB3BC9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKilwBEjSqVWoJDfS08CAl54MFtq24G5ICx2Z8GU9DcVi/SI3EJ4jw53jRYYOuNRJDfsL5y8ykSsCQs0HWYeRgVUobcftnFz2JERpxjyLhAbXkTzVi5sAvymv3aQE86CiOSaJVdVz4N/T5iVVTo4ncHuO2RAKkR8dahLhQf4lUjP/tN7sl0+dfI9zIBLl1Wwzuio7RDwoiB5RJCqAtAdkGj8qhVLwbDZx8ycNF5Ix/F0wxbryVt3DHMN1CpTAMoP1FEq0WmaCEZJDXRz+ll1WpdykYdLNiOOT0rdfVi98H/UGy/tDUM8zvEoj55Vm6J9a84n4JHsksIAEJHMX5K3kuji9Vi0OCyp7eV/CzpT8ecJzSz8BDR+5+bPDEYFh/354YkjjluGaIfhOKDenVxpa9MzEzrrefZve3e9Ou4xzQ4pkfATlDZGZdRUuAL9Pn9jH+6FiaS085v4GIXafEjuEMECZGs6ASwQjEbYenb0ugLzhCO2ILxN58jTMri+2gxFOEKZ5NALSETVxRUUDS2a/6JGtxqYrKl5uuT7xJueCwDw1Wnk7ojp0L5XqDifWAp04aYbR89mXvzg5PXzqsTGMciOeIvjgPYZnbW1DDfVcCiZfKGufIPemw05by9LWH22gSwfO2jVVFKE4vC+F3sPouAa0PjTio5f67taC4zpUJvG/kTFvdBnGyPg5lUaCJWF9YMFSSmV0cnUyfFGkqws74EpNO/iDHs1DV8A1GlJZDlwk/oo+XYb3y27wrKB1/Y3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(31686004)(186003)(54906003)(6486002)(31696002)(26005)(8936002)(38100700002)(53546011)(2616005)(2906002)(508600001)(8676002)(86362001)(110136005)(956004)(16576012)(4326008)(66476007)(66556008)(66946007)(5660300002)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0RMQ0ZOT0ZoMmNnQlYzc3N0R3VvdnZLSEFsb2VrRkpWenNXL1BZUE9FYStm?=
 =?utf-8?B?RmFWSFppMERNdmFvR09wU3ZXQlpMd0w0UmNCMG5rWXN2ZUtCZEFKendybVBy?=
 =?utf-8?B?N1h1VG9tZkdaVW1ZeGZwT2pDUE5QbDNkbXVTbS9EUmdUR0kwdnJ5NzZJeVhx?=
 =?utf-8?B?eVJUR0NYSVovQ2VtYUpmOTU1YWNRQnBlbDdkSlN1aG4zd3oyNnBUS0tKTldW?=
 =?utf-8?B?M2VPejJzVEVZVFNRKzhUSFArNy94VkFIQUwvQkNPbVhuelNSNzBXSUt2dFh5?=
 =?utf-8?B?aWtQdDZ1UWNGUGNWQ2hGcHFyN3poR0pQT3hOcXpCR0JIbkpHd2NBVWFGdkVs?=
 =?utf-8?B?K0owblIzaFdiVzl2ZnhyUEdVd2E4NEM3QU5ZcHNnNy8rbFI3NXcrZXZMczMx?=
 =?utf-8?B?K1BYNkQxekJRYTdlL3d4bndlSVRjQit2N2J3cTFLSmw1cTlGd0ZadDdoc2ZM?=
 =?utf-8?B?Sk51ZnBpSmwwbWFtSVdUbVlPL1NETFU1UTZ3Ykxkd0dpNWpaQzNJbGRuZExL?=
 =?utf-8?B?MVdKeGVYaFNSdnhOY3BhWEs3K3BxcEZWUE8ycCtTR1ZMMHNreFFYOWo0Nndz?=
 =?utf-8?B?akFBR1ZEbjA3THk4YmVpYmo1UkN1WGZpYTlsdUF4WmIzVUJzeEdUVkltZVR0?=
 =?utf-8?B?eFNHUTFzM1VsV053N0VlZTgvY3p1SmkyNEN1V2pwWVNtRmtnS2N6ZmkwQ3gz?=
 =?utf-8?B?WjBNMHIwL1BDZDRHMTF5ZXdpaW9ZSmxnejYwbnB1eUcybUsxdS9BVmdKemd4?=
 =?utf-8?B?TkNXdmV6K3dLVXdSQW1lV1d2SGZIeU5qaFZoQWZpUGd3MU9KdURqRW1rQUFF?=
 =?utf-8?B?NWE2bk9oOXVVNUdibUs5NEVWYUV2R2pBOGk5aXN3WTkyUEZYUUdBdy8xeElC?=
 =?utf-8?B?S3c4dld4Ylp1aTBqWm1VVWZvbm92YkNYdnJIOUFBbzE4b0dYTGlBUitrZXFk?=
 =?utf-8?B?d1VSY3diTVFGQ2tWZ09sK2I0T2k0a0J0OWlYTVBwTG53RUF6MnVKbzE2cUQr?=
 =?utf-8?B?bWhCY0ZGTXJESmozSWxML3dJZnE1ZDdzcnlhbjBDNXRQVXppOTNpQ3Y5Uzhn?=
 =?utf-8?B?Rlk3ejhiZHhSc1Y4N1pFcUdnYzVQbUF1NU56NXMvLzB1ek11Rzd6YTJZMDFB?=
 =?utf-8?B?bWszVGxFeDNUaDNJclM3cDZCY1JKUDRVQnNadFVsdzZZbjdQeEFpdzh2cUF3?=
 =?utf-8?B?WEo3TkdBY1VhMGwwVFd0WDU1cThkMVNINEF6V0NsZHRGTmt6Yit4cDd3enh6?=
 =?utf-8?B?UmtQRGxLMTFUbG91RFU3d2RWZUR5SjMvTGJEQW4wd2lvOHVmbXRCVjRpdERB?=
 =?utf-8?B?M3VBNkdFTG5Zek1EbU5KOW9ONGVraTRhNTV0UkNmN3h4YytZYlkzTk1uKzlp?=
 =?utf-8?B?SkpRb1ZNaTgvYTNKVHBuWmw0YTV4c2VSdmxhUG4wbitNWTdmVjhRNU91V3JQ?=
 =?utf-8?B?bEdQMFFiWkxET0tFb25vdmpRb0VCRWVjYVVUai9wcExBVUxuakhibTc1UWdR?=
 =?utf-8?B?L0lYMDdSSmYzeExxWXB2T2JEUGIzTlZENmVOaG1meXl0YUxZU20rckMvTHg5?=
 =?utf-8?B?c0c2MGFSQUFUZU1uNVI1TDZQendmVUNHTW1nOXRDb3pLTHpTSXpFcU9Ucy9G?=
 =?utf-8?B?R0pIWWM3TXkxSDBtMWYvMmlEY0E1RTZ1KzhkUG5FamdJcTBXM3FvY2dvY3Nl?=
 =?utf-8?B?N1cyZjhOd0UvU2YySXRtY2FTa1VQdHRUa3l4bFUvajBLbCtxK09QQk9EdTFZ?=
 =?utf-8?Q?RaTtdxAZw6P342IrmcNJB6vur/QFEu8vzsLgabW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896db434-9bcd-45f9-4e04-08d99211b6dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:31:43.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LonuiIc3MW0NuheEtCGX2CU7xtc8V2CViEXmhwyV8CKKFqinLgCj2whyU80k3BtptscXubu50lkNYt3YUCwqmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 29.09.2021 11:40, Jan Beulich wrote:
> Having played with '0' for PVH quite a bit lately, it just so happened
> that I also tried it with PV, finding that it has been broken for quite
> some time.
> 
> 1: make '0' debug key dump Dom0's stacks again

The breakage dealt with here can be observed in about every osstest flight.
Therefore I consider this and ...

> 2: replace assertions in '0' debug key stack dumping

... this bugfixes for 4.16, while clearly ...

> 3: drop "vcpu" local variable from show_guest_stack()

... this one is only cleanup.

Jan


