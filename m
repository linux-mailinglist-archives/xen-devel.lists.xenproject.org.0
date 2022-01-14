Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2A48E4AF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 08:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257551.442651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Ghj-0003fx-SW; Fri, 14 Jan 2022 07:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257551.442651; Fri, 14 Jan 2022 07:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Ghj-0003d8-Oj; Fri, 14 Jan 2022 07:08:55 +0000
Received: by outflank-mailman (input) for mailman id 257551;
 Fri, 14 Jan 2022 07:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n8Ghj-0003cm-1A
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 07:08:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d404e695-7508-11ec-a563-1748fde96b53;
 Fri, 14 Jan 2022 08:08:53 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-6Nabo37GMtWFJJ4rL6h0VQ-1; Fri, 14 Jan 2022 08:08:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 14 Jan
 2022 07:08:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Fri, 14 Jan 2022
 07:08:49 +0000
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
X-Inumbo-ID: d404e695-7508-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642144131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz9lzFsJ/c+Lbn0wg90hNQLe0EY2iriQLbKsLo3V/EE=;
	b=F+dBcvhxG/rORvQyi36KLMAQsaT3KTLGv3tNTXmSG0F+amEFSovezwhT05zDfePNQUC6qd
	TOHa7G68W5Nmd9KLwtjBwjaRCELesUxBHvH07ee4nUNcFEB5vICm8zUZBN7Tg9LFc9V6sB
	gtHOYtU0sUi+nMwg+nUubjBfHqfBMq4=
X-MC-Unique: 6Nabo37GMtWFJJ4rL6h0VQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXQiB9GEcY0HbKMeAWeS74e7ud/S4hA4cY08OKZY/FCZw7qWqvYC4IXFkDzgX/qDb8DHIqe29oSMKrmU6jSm36pVo8MK1NiLdSgys0JhbualRyj9IDro7MXId6onfjDcx+p6HrbPaSudAmFhtvzm+yx29NE9TjrIMwOQsstw5IBUj+dOmgw8nFtiBMo95JtMOBwKJnesV7ootgfBXFVZw3/gP6Cfa8CY17rf7QyLKp7GE9NxviMt+EWYo7vP0Am14xMHPxD+8tdjtDm6CSzYWM914Do/2FuBI/H18kL2i5YDIR4xiJTQPwWiIDkXnnxN1mLZNpTTCRXmNdwASlV7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz9lzFsJ/c+Lbn0wg90hNQLe0EY2iriQLbKsLo3V/EE=;
 b=gNtVnbOP5GSlfxfiFuAemoO+DuyAXJD0tIB6A/8pl0aYwJBxxu5ubkd1YiMKo/ti2YwtgXNfOn7YlYUmr0EJuBGAC+PGwNxT/zqjab+Dh7ZFrQUFHra86BE4v/bMwVX8ZzqwLIUpY0iVIk8INggUntjj3+sLuSXcHkSbqYHNo/Q+GO417gayVXOaEdQ9Gu7cuprfoBvzy4gg3aaTxKrLMqfpFd/quAiUkoU0OyYhUVVYhGPNQc+koPk2Fr4cXv6YZR/u2BR/P/XV1K9FC3/saXpdEJU/hWPQNbA9FUXNUFbEKdmnJTSWI5epzrrJ7G8jPCfuoMGQ0E+mGmhj1m5z+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b137ad7-a022-bc6d-5551-3c01aa179261@suse.com>
Date: Fri, 14 Jan 2022 08:08:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/hvm: reserve another HVM context save record ID for
 Amazon
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>
References: <20220107125542.212725-1-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220107125542.212725-1-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0199.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cef68a7b-4fa7-4c33-e26d-08d9d72cb6a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383AEC241B6B194286F06A5B3549@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XFFBgKwR1w1j4hGvS4K7qtgFgeyHt/AuWNwxe5JRpMI4TaBDe+27AfXJa7aKhIZT/WipqOpaquSwlfe69yk3luPcqUT3HU57uP32bqmdr80pwvXcz7u/zm6ytn2asInUYUwe0kdaieicGPvZy6TXINRJ3Rq2SCPNMG4GnVm6nwI/Jw8Einx1LuuZ3COA/vUQmGArcUrtK1cRqVAz/wUo0Fg+ycdMdpSFVnI62AT4Ki9g9PRVJPxpFgKzUBwTIeMMtWzHiU+XTyDmLfiIyu7rJgatdnnwBLgjzCPPyF1DrfllIhdc8kHxNLRL83htoQWoXiVAwdsZc0RPr9OtJY7iRb2BoMtrLY2AHJr2MFBLgdcCGn7wGWBz9CXp13UNxJwbVOgvRNUAZv0/Ddb3bWmCQFbJ/cXtUcj2cfNPYgiZ0OdRX4n3WHf7OSwqgjfSAMRpkTKcKVrbYrtCQKdOLolE1lukjKy2dOh+Idl3uAHW1zW1YLS0Hiqrdkt30Ue1mgAL27BkHWH5jC9OQOLMuwhEf7Z9Onp/r6FqsF5rOoUnqh/2jRh52ugNVyGh6muYk+/OVo1PS+F3rU47hE5zc5NmnT44S5kSrsM1tVUbseI3hqfsUF95iOfvW9luCnRTiqwRcb0VbJbyQFPeieibUVxy7pJd41YJ5m623yr5pYR38SfGkGIP1I2sJMLayXDlrZz8FqpZYv2OvoN81OXgKtt3RKD0XdSp84A+2zJPcAVUCtsDPlFVaQpXNgMpI2ZRuupJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(47630400002)(4326008)(6512007)(86362001)(26005)(508600001)(54906003)(5660300002)(36756003)(8676002)(31686004)(83380400001)(2616005)(6486002)(8936002)(66556008)(186003)(316002)(53546011)(2906002)(31696002)(66476007)(6506007)(38100700002)(6916009)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZ2ZkJnNStyM0t6bkZsYzhOTW8rU3EyNDNHSVk4TXJPNnNTZUx1TUE1MDZP?=
 =?utf-8?B?WkpmcDQybEdFMmdEU2ZxY0w0L0RFRkt6UGc5YkZDYTFRaE8xZzQwQ3p5MVd3?=
 =?utf-8?B?ZXdxQjVOc25uM01Dem85QVFqYWgra1FOWkNKeFBKSEhQVEk1M3AxeXZwd3I0?=
 =?utf-8?B?eGp0US9qRjJwVVVRTDFJVnBrbmpYNmdyclE2cnZnNVBUTGhPMUxNTEZZU3BP?=
 =?utf-8?B?d0pzTkdsYWF0TFJXZmNtSmFVbmN2anBFTEZ1ZGM4c3g3c1pEVHNnZ3BkUTBp?=
 =?utf-8?B?bUR0cEJ1eTNOeWNzSFpHNlJMQkdteUE2RmhzRlRjalRsdFlZSW9XZllwZS9v?=
 =?utf-8?B?akU3dXVLbVJWYmxoZG1kYytzaVdKdFd5dVVBejlNQ2ZGRzBIWUtUbGV4UDdR?=
 =?utf-8?B?QTV3dllyTGswSUtycHNacG44RWFmcUc4YmJQam9jb1l5ME54V2o1Sy9hRDZI?=
 =?utf-8?B?ZlJDaDl6NkdJNzAyakJaM2NlV1MrTHFOWU4wUHkwWVhrK1RvajlLdWt6VzBQ?=
 =?utf-8?B?Q2ZvekM4T0xBMkZQTUNTNSt1VkFOQnk4OTl4NHYxYTBWYVBIMW12dVUzSTVG?=
 =?utf-8?B?QmJJUGZmUmczZTVhTXRtK2NDbTRvSytpOHVlaWhZRjNRZG95NGRxS3lNRnpp?=
 =?utf-8?B?a3d1WXJhOUQzYytocVM4MjFXNFJ1VmlqYjhFQ3hkRExiUW40ZXJvZ0dpOUtl?=
 =?utf-8?B?OG9Cd0lQVFpHVGkxV0pJTTFMOWZSbGttZFpNRklBRTlZN055M002Q1ROSkky?=
 =?utf-8?B?NUo0bGg0REcvdTlNVmNQY0NEelB2UmZaMkVLaUV1cDVCTTJOVjF4cWoyMlYz?=
 =?utf-8?B?Nmh3MUFRLzRhN0NvbVA3VTI2a3ZSam1hbUd5ZUZSYkJVanVBNzJsZWZGRXc2?=
 =?utf-8?B?b3R6OWxpQUVTYitNdyszWVBna01OaElyUlBQeVhvVTdvMW9DcVplMko3UFI4?=
 =?utf-8?B?UXNVMUM0Ti9oSzBtZzFJNmNSd01BTmllN0V1anZOYTNleGxqSWNWU1o5N005?=
 =?utf-8?B?ODZlbkt5cDI1TEFuSENWUzJ3V3FSQklNdEd3KzVza2NjcDQrYjFySWIrcWs2?=
 =?utf-8?B?YXA3UDhkSFNReFRkdlQ2L1FrZlJMRVZjNjhvQi9ndWlsZlUzakxSNTg2OEdH?=
 =?utf-8?B?Zkg3KzM4QnhpWUJQUllWSHBHNzc3ejhWZ0gyY2FreWNVR3dtVlVPcEk5RGhK?=
 =?utf-8?B?UmIxQ1Yydm50Z01uVTArN1JoSDRpQk9QTE9rS0VFVGxCcWtsVW40NE9nNzNp?=
 =?utf-8?B?UlJRY0ZsdVVPRWFNc3ZXNEgycW1ZdHF4M0lyTG1SU1YzZU9NU1lwb2ZKVGNJ?=
 =?utf-8?B?amV1QzZZQVEwU3VxRTFnQWtRK2w1MmV3S3VYUS9UU2xwZjhmMFlyd24xdTFw?=
 =?utf-8?B?VWozVmVwdDdnc2gzc3E4MDFISnd6Vk9rM0JKZVNCa0JSS2JpRGRIVFdQZFNL?=
 =?utf-8?B?NDFIQmpwenpJazhHODdERkpWMnJXaVpaRVd0K1ZEcUNhSEFFMmppcnJPSGgw?=
 =?utf-8?B?Q3d5aGk5d1lYZTNnaWRjNEhVM09pRW5Fa2dBdVN5T1B0MWlTWitJRTFac3BQ?=
 =?utf-8?B?MEl4eVRGQnBUaUhqdGFXNVZLU3dmeTJTUStWcWJKRGJ1R3MzTmhLWE5qcXdT?=
 =?utf-8?B?V3JiZzB2eXZyc1RrR2xzc1VzY2prdkV4aE5sNjcveDR6cXhkQlcybEJMY2d2?=
 =?utf-8?B?dHNXRjRuRjhoNk1TNzh6UERQOXV4MUVaaXpaMjVjb0MvUXg5T21mOElKSjlP?=
 =?utf-8?B?Q2RKNlZNOFNDaDdBRFdKTEhYeElYVnlLSUJyRHROdmFHbU5tUFNpeEVhQXVp?=
 =?utf-8?B?RTZBSXE0TXRubGVXRzVoY2J6TFFPU3MvengrRS9uZWZQTDN0bXRzYnFKdSti?=
 =?utf-8?B?RFRoaFpOZFNTZWRJZkF3N0hhSEZsc3JsTVgvbmhtTTNMeklJU0F5QXI3dTQ1?=
 =?utf-8?B?WkJQKzR0YmVmNEZwNjd5cWVDVldjN3lTWU1pNkFaN1gzZk9XcUZSRDEwQml3?=
 =?utf-8?B?R3RwaHFLbWlrUHhERkFDQ1A4Vm1zZ24zY0VpR3RlRFFOZnMzd01OclBsaThn?=
 =?utf-8?B?K1FlZkI1YzJybGRZVEdiRVVlOHNuSDRxc2Nva2ptdmlzNGhIZkJMaE9PSGdT?=
 =?utf-8?B?ZXdJUFltM1lrcUJHM0NmSVlyU0xIcTl2a1hkM3RmQWVIR1ROYW50TFk0MHlC?=
 =?utf-8?Q?bioBe/edK4U7dLSVXDq9XPQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef68a7b-4fa7-4c33-e26d-08d9d72cb6a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 07:08:49.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roVmc6x/ETPN559RKatUy1dMgHoz1noJkSbzlQl5xJYD7yqBDyNbq2JSyCNEWZlguk0quuJLa833ip8+KvVGNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

On 07.01.2022 13:55, David Vrabel wrote:
> Amazon's guest transparent live migration work needs another save
> record (for event channel upcall vectors). Reserve another HVM context
> save record ID for this.

I have to admit that I have reservations: I didn't really like seeing
the original range getting reserved. Even less so I'd like to see
extensions / further such reservations. The more that iirc the
original reservation was accepted based on a (perhaps vague) promise
of the respective uses actually getting upstreamed. Yet that hasn't
happened (nor even started to happen) in slightly over 2 years time,
iirc.

What I could see as a compromise is to have, say, vendor ranges
higher up in number space.

Jan

> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
> ---
> I've added it to the end, keeping the unused ID at 21.
> ---
>  xen/include/public/arch-x86/hvm/save.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
> index 773a380bc2..2de3dfd9bb 100644
> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -641,7 +641,7 @@ struct hvm_msr {
>  
>  #define CPU_MSR_CODE  20
>  
> -/* Range 22 - 34 (inclusive) reserved for Amazon */
> +/* Range 22 - 35 (inclusive) reserved for Amazon */
>  
>  /*
>   * Largest type-code in use


