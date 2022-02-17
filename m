Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC6C4BA3EE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 16:03:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274842.470447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKiIz-00087F-2Y; Thu, 17 Feb 2022 15:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274842.470447; Thu, 17 Feb 2022 15:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKiIy-00084b-UY; Thu, 17 Feb 2022 15:02:48 +0000
Received: by outflank-mailman (input) for mailman id 274842;
 Thu, 17 Feb 2022 15:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKiIx-00084V-Gq
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 15:02:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2bb849-9002-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 16:02:46 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-qICcIUNZNKiH-dR6lCqz6g-1; Thu, 17 Feb 2022 16:02:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4979.eurprd04.prod.outlook.com (2603:10a6:208:c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 15:02:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 15:02:41 +0000
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
X-Inumbo-ID: aa2bb849-9002-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645109895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyvb255NzLHiS7Bzf96OV8sjF9N9UsX1kY499I1qVoI=;
	b=Jlvp3DQjVC0vWz9zZg1mWAOldXCQeV80fDF7lIKJ8KRUIyG48hL+jnSLpJDMUTn113d6ET
	JxYjozLckcocUxA+H8ezpzruE8ntOmcBZrC6cDA4pATkqEN6evbmfxZsvd5eTndyg75xjc
	37P7T8en8ILTQqgBtStyFx/gkMq8PWU=
X-MC-Unique: qICcIUNZNKiH-dR6lCqz6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSDO59iOrHLw0U7HPfxVckdEhCl2Yo+i8Hbk3QSV294BN2Py8ZZ9uM+5JtNVUuV7Xo8WWZpbaOi1ctRJQgducjUt3LMrdyzNYfUTlv7lYdUQ7U34oNr9/P4eMezMO0qUwHogfnSJ+04M2CRJt7JIjMi7eT6IwMDKPr2j9Y+mZzvMcU2HR0jvcUcXHYtfDpWwLAEHCcW8RKjAYrM/4sDrqjy23LtYyBAw08Eqa5hcKkUBM6cwtCtAw/BcPw5wlqxgzZSAjGkF2DKwyPMMF2pp0TPFR59ww8H1d/m/ZE84CL7AizLQ9aRNO2U7HL1+ML7XG3ibxoLnVpmns6QbxA8W9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpC1FcHME74XGsJB+ztRJkpzb0uREjKBdr4epQR6hKo=;
 b=VPJI9W2LcJtxoSowEwjIsvewlfWu2Us5+u9nlIyMKYUxxaUP93l6rA101U6B0gQzaBiwUZXuFdqpKcgyRVoFguHpNMOVpCTUyTUtOftw5RNY2azhuThvMaq4Tc2YiSANo5j6J0BcqjjQ0KbovIlOLZMhXbLExoRWGEigPtsKId5SUi3xfEIM0XjgMiHdhdQGGbNOltXhKNG+RZCbM5PoGN1mwAoduOd1JsZPigLwnhGoOvvLJKBUy6g8uflQz9xZVhcyoyoA2bx+Onbl07ISviU5EOJkDWRfT/qRiAjuOaDCTKsuBBFW64b8FqaCM6N/s7w70kbE129C/I6heliK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34dac738-0631-f80c-a3db-7367e37ec0b9@suse.com>
Date: Thu, 17 Feb 2022 16:02:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RESEND v2] x86: introduce ioremap_wc()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <c56aadc8-e568-4625-5d6f-bd2b8981f3ae@suse.com>
 <Yg5gGenFpAwZqtSW@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg5gGenFpAwZqtSW@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d5e365d-d243-4594-9a23-08d9f2268ba2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4979:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB49798D3C677AE49483A96458B3369@AM0PR04MB4979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1EMx1RckkiGNW9J0qICcQRArYykrUNSVqiSEqbmuO5drUZcDWqad2TT2OgfeJ3q8i5zxS7O3Lq91QoGPoaEOZIpDVbm5Bi1Cd6SJZh7HgFsoQ1mjThFVKK70shn/wYHw72eY5XFPAOQpSaMsKD9AKwYE9jq+/cFLjHiqJtaU+xObdPTuBpxyhCWqZ8ykC22pvuS6Fn5WcrX3H7fnz8E6FwP6+KIzb3AED0e9cfJG2GHFkCtKGa16VYy2zNRQXEjlkMbuN0IiTFNReQSBjQxsKqPT0mKtlzWkzP++YRKQ4klBhGatZyhpxUtBM22XIvyozKe4x9UOp1McuL/kz9Ol4GULhOvX/Gzrm2VnnfX0wXP7Cz211P7j50STsPCbPR/dqof3Kh+GEJGiHXoksoMDgR/PKSVQjpGQCcN4ykvDRuWay1AybaQqb/+SeCLiuRpWXI6IeHmHvkh6ck4P43qRpsyg0NAkfZJJpRS/RWN51KIh56JtGLTsPnLRVM3E5DkRPLJTIlvVQhM5J/8a+K75xttZrOtrKiyOQjc9S4N1pV7R9asV5WizH/vIAZcVadMepMkDNNwvGSLgbGWRI0vob3XUlfxxj5sK+e7c4EyTjLZzGFy1Cme07GYBvChrwM9bMrluLnEu5fF+xSyTedlBrFJW0YG3igxL09RBaRiz8mx7jy1fVyuJPlPvzcBs/O64NMwLktd4yxnHbiYpQH2/P3gbmn+idprjV4RZ2o3iWiiJjaA1aoqqSeCP/PX4OyUF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(53546011)(6512007)(6506007)(6916009)(2616005)(26005)(186003)(36756003)(31686004)(86362001)(31696002)(38100700002)(2906002)(316002)(66476007)(8676002)(66556008)(54906003)(66946007)(4326008)(8936002)(5660300002)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nq8qJO2t1usBofeGYPskkEnTTkVbDCaO3ir+6YQ6ksU6/5dST66kM5FdZ02z?=
 =?us-ascii?Q?2ucyxxPoSsUNc65Jm9ENIEOg3LsBlpwlzS2Rp2CGOB+zkcTcPdZR8u/kc1d7?=
 =?us-ascii?Q?xaxAJNa+fQ9BAXXcDZTf3pqPjrn2JvxgD3aJgknuWZwCS1xnEN/yO4VAoWO/?=
 =?us-ascii?Q?D4xJT90+07hU5tJCR3AVeFiWAOF+3CBITAeoMMKgLpMvRNReH2PlAk/lPsgb?=
 =?us-ascii?Q?oMt27BYpPtWJjcsMGFW3Aqqism7sqEdF96xcPv4tRylEC8y3Veipb4uz3PPW?=
 =?us-ascii?Q?YA26iE8GBxrJHSJRb74Kj+RV8hL+5ssXMZQT+pFFfVKf0pC39hbOq7zGSuLC?=
 =?us-ascii?Q?9hj2e1k3ao0C4VQ/vcff+W6sPb5nmZqdXNUtiKx/3+1INwBcOa0e4PLqIMNc?=
 =?us-ascii?Q?nDRYlI3Qq1+K8usp0zd70AZdq36skkxnlZVVwbZ11xd4Vw4+adonM6XZSiXc?=
 =?us-ascii?Q?jDZjm1V1g7mAttdp+whwzffpylf392ABQZCCNi8N0XscG8jWpbciFeCspl0i?=
 =?us-ascii?Q?7rxuRHKruvlAvMUxze0pWr74Av4FtEI0bnvU96ZZiTWnDlSUkjCIcCus6cEY?=
 =?us-ascii?Q?/js+EKn2yBYVxa7TddblWn9xysVlSRqdQ7I+kAs/dd6UEV79QeL1YjWRH/+d?=
 =?us-ascii?Q?hdyrDPRjLXPxrH/BbOPy+yo38ZC556vZ3x6VRaktWb561TGc8mw8kZYaCRAs?=
 =?us-ascii?Q?8RoZLD7EFnm+hr98wK7RmMpV1RNpbsmwufHXh/l7I1GayAiGry0eMnQ5XECE?=
 =?us-ascii?Q?SJfNEU5G6f4U5Gfr/EB9zdDATO7EE//X8WwI2kQ8jaqXBzjb9OJonyQHklkw?=
 =?us-ascii?Q?QCcuvaFI+K79G1m6U/OT/kcV0VMzGa9kOviBKaV1r3j2jAMqRa9cm8mA6yIh?=
 =?us-ascii?Q?kBiHtB8NkT0tXvki0lKKKgRzRHXLd+3RGMgfaMDWkBS01VJFUvxJmGvu1gU7?=
 =?us-ascii?Q?J5DJNLXZMWyzgn/VRvNKBSPkJTj8phtSkpy6GREi88RDR8XMEbmZv5rZsepw?=
 =?us-ascii?Q?TvIYMk+4mr36Ae3qtF/DsoP7m5ZSfGXF3Uv4gKQ3EM4iC9O0sWRyPySM/TmX?=
 =?us-ascii?Q?qFbCg3bhqM7DiyFNWDwJykL0Z8r/3ylwAIV3POYeyuk7TfPzFSz/9HGhPXgp?=
 =?us-ascii?Q?sxVGJvLyJVHPkWC72HUkswbEruLs2rCcOhhgKqMPEr4NVV36nPDuGFK8to2M?=
 =?us-ascii?Q?F9Z00+NUhW4zyUroNmJ/b/l+L4xPNom74Y1cOVUC8u0/90WUG/P+af9aKRwr?=
 =?us-ascii?Q?6W19tDb05d4NZeTbWbLPv18DIH3Z7tMiG1JATz8BIuyM0q24CdPTgjwhn+qR?=
 =?us-ascii?Q?hUAAGoJ2EXfDoMzqJhYAk4d19zeQQHzxuUvgrUhqDFcw7+PCt3NRuBpOMWtb?=
 =?us-ascii?Q?nYJl6gvOUUcBNTm5W8xhIlFi5exGWau4mxiBMhAFYN4MaF3YvaWTZBHVdRxP?=
 =?us-ascii?Q?tr5AiZxqzM4ffiSoTkgThc4rR5Iy/pYgRbsk8k/eW7Ytqo8qOIIAkb1Kx3Wr?=
 =?us-ascii?Q?0dcGT84Ui0l2QxRBymH9tBD7g4QVvKGNnfY3LcBSnJtsu0UD8gPZfPI32cKO?=
 =?us-ascii?Q?BSnQzGYVPal1CXaZRc8pSNBcKbsAItJHezTKaNpIPdIbNEaGFHeh3+EI91jV?=
 =?us-ascii?Q?sZ9sEeWt2yqvprYsAXoYD64=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e365d-d243-4594-9a23-08d9f2268ba2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 15:02:41.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pp3CYkv1Mx1hppsWu55oyG8u4OhY0/w5izHyPS3JJ5yTWDZzpiT32tx5p8kVAQK3tBe5tl2YsrNRZupg3dEwEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4979

On 17.02.2022 15:47, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 12:01:08PM +0100, Jan Beulich wrote:
>> @@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
>> =20
>>  static void lfb_flush(void)
>>  {
>> -    if ( vesa_mtrr =3D=3D 3 )
>> -        __asm__ __volatile__ ("sfence" : : : "memory");
>> +    __asm__ __volatile__ ("sfence" : : : "memory");
>=20
> Now that the cache attribute is forced to WC using PAT don't we need
> to drop vesa_mtrr_init and vesa_mtrr? The more that the option is
> fully undocumented.

Yes indeed. You did ask to re-send this patch in isolation. This removal
is part of the full series.

>> --- a/xen/drivers/video/vga.c
>> +++ b/xen/drivers/video/vga.c
>> @@ -79,7 +79,7 @@ void __init video_init(void)
>>      {
>>      case XEN_VGATYPE_TEXT_MODE_3:
>>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIO=
NAL) ||
>> -             ((video =3D ioremap(0xB8000, 0x8000)) =3D=3D NULL) )
>> +             ((video =3D ioremap_wc(0xB8000, 0x8000)) =3D=3D NULL) )
>>              return;
>>          outw(0x200a, 0x3d4); /* disable cursor */
>>          columns =3D vga_console_info.u.text_mode_3.columns;
>> @@ -164,7 +164,11 @@ void __init video_endboot(void)
>>      {
>>      case XEN_VGATYPE_TEXT_MODE_3:
>>          if ( !vgacon_keep )
>> +        {
>>              memset(video, 0, columns * lines * 2);
>> +            iounmap(video);
>> +            video =3D ZERO_BLOCK_PTR;
>> +        }
>>          break;
>>      case XEN_VGATYPE_VESA_LFB:
>>      case XEN_VGATYPE_EFI_LFB:
>=20
> I think in vesa_endboot you also need to iounmap the framebuffer
> iomem?

Again part of the full series. I guess I was a little inconsistent
with leaving the VGA unmap in here, but breaking out the VESA part.
It's been a long time, but I guess I did so because the VESA part
needs to touch two files.

> I would assume this was also required before your change, yet I'm not
> finding any iounmap call that would do it.

Indeed, this has been missing all the time.

Jan


