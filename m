Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67F431232
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211824.369493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO4p-00055o-2Z; Mon, 18 Oct 2021 08:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211824.369493; Mon, 18 Oct 2021 08:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcO4o-000538-Vh; Mon, 18 Oct 2021 08:32:58 +0000
Received: by outflank-mailman (input) for mailman id 211824;
 Mon, 18 Oct 2021 08:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcO4n-000531-Tq
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:32:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdf340e1-2fed-11ec-82cf-12813bfff9fa;
 Mon, 18 Oct 2021 08:32:56 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-u0fxkqNxMuaVSXyAW6rMHg-1; Mon, 18 Oct 2021 10:32:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 08:32:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:32:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 08:32:51 +0000
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
X-Inumbo-ID: fdf340e1-2fed-11ec-82cf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634545975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ckteT9f09rmydGrRAXFDU1djCAJx0Y6/nZgDk36Vcw=;
	b=P7uZv7mRSVJG5BLdQKMHiYt4715567a0c0abroC5bD44eOXKFFiUKekN2leuaRmhbCsxYE
	RNbntb9MCV4d2ZSw1EVuY4l3LSNaMCZnpqrFMp37ZAab/P71UW6531Ud0qgY0N3SMd9Tqc
	TkuXxphwnqiHDYz/vxZRTHTZvCrRk6Q=
X-MC-Unique: u0fxkqNxMuaVSXyAW6rMHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEplxdq7J63IkKXsEyJutkPA6zfA8+h9wxSV4AGjDuJmM3mPEjUxm2VI8rD40QUPFNKGm5+Ypl2FakmyaGj3IXe4CNyoxzN0fDPOuYnV7Wj7yK8cfrveTyhAYOwcs1+Fd1s7ocpnUjCT3MexWojK1V0vVvaNEiE09abP9qTYH3KewJ41i3kktSxnIcjvV2iyTcHyt077Ru1bl9YbiTTa/rtFA4Ai2+PnEx9jgErseUMRh9nwBh8VgP27Tt8HdiN58izAk94vFMo6dGtVzUovdUPF7o9EVqOUFJgUpAtUjU+N//uBmrLhlJcv9TBc1RH9NjjbFNBiY/FNpTKDJrQCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ckteT9f09rmydGrRAXFDU1djCAJx0Y6/nZgDk36Vcw=;
 b=As/jVrJwbpwtw2UmHBYdg6fQ07S3vA1HOQBKjwNsGHV73GN+ugn4V9rdrhx64JciJWbRWzWvxPZ2uRz2LsEk1X1fhOQBt2u+Ng4vEcRaNZqQ3Mo4A6UpTgHbi3pEigZzxFNBvXNiAegmAJQZZqegj97xgHBP4xezt3TxCA6bJwGtFruYy0SMGlHZrVogRuiN3eUwwk0PlQNZJtz8ArKPCxaFP07/nLm3L5AXqhoAOUtgn05ucFL7sDsj7SqMlQjl34SHK7MaHdVC9pEOn4lBFQFuCPKjUosTRQ9tTZGnmkcdLWBgvRGBMwrWP1G08v97ErilzNHPL+yOcQtxiyrAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH] x86/paging: restrict physical address width reported to
 guests
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <e0acfa40-0901-2fc9-31b6-c2609625de22@suse.com>
Message-ID: <aaefaf9f-3970-b954-ba1f-0b4ed70c1fb4@suse.com>
Date: Mon, 18 Oct 2021 10:32:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e0acfa40-0901-2fc9-31b6-c2609625de22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9612f6a-5b56-40cd-edee-08d99211e00f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70248F6AD87346BE2C9EFC9BB3BC9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xz+XYD/FdHTQA/H8JXEPbqsRgEyGj4MymIpSaXvMVd7AYrllo8lGoJDouv94B2yGya9/EzUJKzh+9/yY10F6P0k2r74mp0IAE9AmwFvB1BWZ/Yj1M4eqYqoU0eUT1a7jqeIBMntqoHQ+RFDgmR2MPxekHIkr8VvuCddRET4fEdjw/Y82d+z4Za68xNgWCVsPofCnKD/cmeJwqm1ACVhky6+ii279qmrJy0lcnawjarXirdaoT8EVwcIe/qHSLNf6JCo6/frjAdzZTDIzrVIVToDru7LAo+pIaVqVfkM7bhFLnReAskGD64eq+4P1FWBf4RMQOdCNoe8qieqDzkD+YY/+598fhlwQMP8e0g/JnUCmrbgoQ+OaaIRTHu547UNjINMZBPSzZwZNfe+sATQhGja1DyAE8tbuCATYZu+R9bES5EIwm+l+AVbeMfYSWnE7fMGogo1IKpipOeCBK0Zme6qIFUqLRWiD9o+iqW15VAQ2k3PcRMAx3O0A5Fi9p7Qi8Ri0zc3LFMot3VR+76RSVJnfhz8rKZJBzka/rMuNwLIN2P5LfJWwXA3Ql9QL5mPhNpoNBXUPMSwVdrgo/90HG+RRPEti6AUfuWIdhQlCeIXKdTYwUw/fqbEHAVuatx5tU9/wqqRp5qXXSKF1VYBXbSnqRUCCZMo6w0vFtbaYS2E7769mEEPknobVb/DY2n1f6ByXkY706gb4LqMjWzaVPFZ6cZB0J7Kpd9oXL6d5C2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66556008)(6486002)(2616005)(66476007)(16576012)(508600001)(8676002)(110136005)(36756003)(38100700002)(4326008)(66946007)(186003)(316002)(54906003)(5660300002)(8936002)(2906002)(31696002)(86362001)(53546011)(31686004)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2JWYmFPY1FkTkF2RHEwTGJ4cUlxdUU1UVVGUkhyeEJmT2VBUE1lWmNISmZw?=
 =?utf-8?B?bVl6aGp2b2d6MGMyVGxUNERRUFdCNDd3R1FONVQ4VDROR25OLytmYVZ0VXZw?=
 =?utf-8?B?SUxEOTJuSm92ZHdOQ1hRR2xwQkZKeER3d05VN0x6UGpjK2VXWXBFT2Viam9l?=
 =?utf-8?B?OVYrRFp5ekVqYkpUS2Q5OURyMTVBRmRZODQ0bnlGVEtJcWlQMzYwQ0hFV3pJ?=
 =?utf-8?B?QzVBWFZCNUxDMXorcDRNUVN3S3N6NDg0YWpRbGRTOHFWZTR6K3BpZGpTcVN5?=
 =?utf-8?B?Y1N1OEs0ekdTaHlDcm1aYWUvQzFGTDNYQVhrSXI3WjRiTGlOblZwaG5UeldE?=
 =?utf-8?B?ZytJM2Fxb1RUaGNoNDdaZDlyN0RvM1NydUhjbTljMVMvL0ViUGY4QWh6azdy?=
 =?utf-8?B?SmxnWWMraGdwTnBwandaekYwSWdxYlFxMGFkTy9zMFpyNndWQ2JuMWx5bmxJ?=
 =?utf-8?B?YThVUndmN0svRXJxbUM0ZnFsYmRSbjE0RTF0a25wa1FpKzZBdXRjQ2QyOW1S?=
 =?utf-8?B?NUw0a1Q3M2lLSmdwZmU5aEh6OTNJS3A2S0FxMHJsUVgydGt2WjhJYUJDMG1F?=
 =?utf-8?B?RHBXdmcvNy9abk04aDJiM3ZveWZPcDBvVlIwYlNSNTg4Z1RBK21BYW14eWxt?=
 =?utf-8?B?YzYzb0hjdDNUWXU2WFRUVCtrd3MveXZSaDhhRHdvMmtCdHlkS1ZJOFNyS3pw?=
 =?utf-8?B?bnRjTUxySFpqR2h0N1E3MVRVVmNoOHR3Y2d0OWxYdk9Sb3oxMzBqY2hWQ0RS?=
 =?utf-8?B?NTFqYWJlSy91Nzg4SXYzSnRZWHNQMjhURnhiNUxMejVQUmhvb0EvK3hCbFcz?=
 =?utf-8?B?N0VYZGp1SWEwNkNvQjNVWlUxNE1Qek5UdEN3aGtqdzlHcjBtY1R5bGZSZUwv?=
 =?utf-8?B?UnNaTE1iWDdRZmd6Y1lNNFVhQ2N0MjJwSG5aaWgwU1lhS2JES1FBblZHekhi?=
 =?utf-8?B?bk4rVjV4ZlhBZ0ZvVk9UcDhQSWpyaHBZZnNIYnJPa0dNL3MvRzhUZ1JrRkcz?=
 =?utf-8?B?TVMxTTVHY0ZYOW1zeFo2SkVZcmwrR1lseGhKaGlZeTdmTkNzY0xmMVhPNDFu?=
 =?utf-8?B?ZkJmYlFsalNUNXpYbU1TTHQvc1dPMEp4Y3FxS2phM08wQVRrdENmcjBrQlpn?=
 =?utf-8?B?Q3NOUUxDQjFkMW9GbkVTMGo2VGNyYXdUajZ2OVBGbVZzdndDTm4xQ01DREE3?=
 =?utf-8?B?VFVPMmxvYjlDbmMzYXRHVzZZVndCemZXcFM4RDg4Q0tsZXdKRFo2MTU3Zmdi?=
 =?utf-8?B?cVhkalhreDlFTmJkNGhhN2J2UUFvbVhkQmUwai9udlBtUklCRVFRNXNtZVlP?=
 =?utf-8?B?bUZrUFlxNUlJRjVpbXN1aHJodmpUdnVOK3YzdXN5UE1rUUpEUmRkT0lLaE1Z?=
 =?utf-8?B?dzdGdDc2N1ZGNlp3dmVyc3Z4cTVQUTNaaDRGV203Uys4RXltREVnbkdNZGhF?=
 =?utf-8?B?alJwWVJlL01IcnVmRmN1SXJOTXlmWnF5UlEvL1NxL01uRnlGOXBWNjkwODdU?=
 =?utf-8?B?dWpsVWhCM0JITFUvU0lZTXJYS2ZncVNWTStxTGJtQUJrcVpHUktIWnZLamNu?=
 =?utf-8?B?am4zY2c1YlJyMG1Vb0dIOUxpb25FejdHV0czWlNCRzMvTnJKL2FDa0hyMktI?=
 =?utf-8?B?NUtwajR2dTAza0NBbEgxK2pXQTJxZUdwdzVabS8vS2VEUXAzN252clBUWmdD?=
 =?utf-8?B?WHAybU14MnNhY2VTdzhsOFZucXhOZGdRTzRHN1RMbDUrckhjM3k3TDFQUDVD?=
 =?utf-8?Q?1YBjxqdVgaNrsypXwHkZsWQ/c31JmKahD1a0BG2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9612f6a-5b56-40cd-edee-08d99211e00f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:32:52.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTSIDcJW7VIeTbZLs6M3aPIfVpN+SlqUylqrHs9EkIyElNfhViJlNo+syl1U0ldJC5EIY6IWCyJpIfWooQCuqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 29.09.2021 14:47, Jan Beulich wrote:
> Modern hardware may report more than 48 bits of physical address width.
> For paging-external guests our P2M implementation does not cope with
> larger values. Telling the guest of more available bits means misleading
> it into perhaps trying to actually put some page there (like was e.g.
> intermediately done in OVMF for the shared info page).
> 
> While there also convert the PV check to a paging-external one (which in
> our current code base are synonyms of one another anyway).
> 
> Fixes: 5dbd60e16a1f ("x86/shadow: Correct guest behaviour when creating PTEs above maxphysaddr")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Anyone?

Thanks, Jan

> --- a/xen/include/asm-x86/paging.h
> +++ b/xen/include/asm-x86/paging.h
> @@ -401,11 +401,18 @@ static always_inline unsigned int paging
>  {
>      unsigned int bits = paging_mode_hap(d) ? hap_paddr_bits : paddr_bits;
>  
> -    if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) &&
> -         !is_pv_domain(d) )
> +    if ( paging_mode_external(d) )
>      {
> -        /* Shadowed superpages store GFNs in 32-bit page_info fields. */
> -        bits = min(bits, 32U + PAGE_SHIFT);
> +        if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) )
> +        {
> +            /* Shadowed superpages store GFNs in 32-bit page_info fields. */
> +            bits = min(bits, 32U + PAGE_SHIFT);
> +        }
> +        else
> +        {
> +            /* Both p2m-ept and p2m-pt only support 4-level page tables. */
> +            bits = min(bits, 48U);
> +        }
>      }
>  
>      return bits;
> 
> 


