Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22AD4F2A70
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 12:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298713.508967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgsp-0002WB-9x; Tue, 05 Apr 2022 10:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298713.508967; Tue, 05 Apr 2022 10:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgsp-0002UI-6O; Tue, 05 Apr 2022 10:57:59 +0000
Received: by outflank-mailman (input) for mailman id 298713;
 Tue, 05 Apr 2022 10:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbgsn-0002UC-Te
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 10:57:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc9c31f-b4cf-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 12:57:56 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-UZCcHXwSN6uM1k2WkuitdQ-1; Tue, 05 Apr 2022 12:57:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2380.eurprd04.prod.outlook.com (2603:10a6:3:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 10:57:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 10:57:53 +0000
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
X-Inumbo-ID: 3fc9c31f-b4cf-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649156276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvswwWuHyXJrpv3spz5jrC3uC1N7BqAlMc3IJ6AXjKs=;
	b=WuFEWFSKS/eH+f1v7NNFRIJPhubpPcteQl4VxRXwdR1zo0WN9M7Tf7e2SIsI/QkCrt1jzF
	02p/0/pDS4jNz+ER7h8ADUI/jRZMdThtZYipguAoOU1palvDkumEdtBJ11ntI4gjNwY7Jk
	Wu+QRj0juoxU+iLKL2tqE4pTOpJ7Jag=
X-MC-Unique: UZCcHXwSN6uM1k2WkuitdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GO7+jCoIekpXkpo3rKcZPsFadz1k0w/0yVObTNcwNWrEslkKzk2Tjc/t5fv4EpuTPYz6//QaRE33qH/ekag1gmjMnmrhcy3I5M5xzre9nDWqlcmrUtn3X89Ah/UK+uH9WCd++gCBqeK6PhhbUwbMKEtCNFzDzNqRp/Zn3F6CDTtpf8V0NJwyWXFACyWrnSKB/9YWycNijIsHW1xi/SgIrhhERLk+2wCqpNBNpymWLA93IBeTnrzmnjhn9lUlZb+GEQZ21vkrPl8PZ68fdjL/NDw13XRSMgzc0nEttSRyQxi3Xj9S/tQ07lajpdYl2/C9YWTVhEZEQOumoRum7HkgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7Oy1Y8rMgs2geC9iHlAb2+fU6R4bw72Jn623Q1web4=;
 b=CtoYUcFs+w/+xsqYq4Wim9ufnLGFWtxgZULZmF3yv1jX4ZwpU4CnKV0WGXLLt8yMqWJyXXpcEjJ8NZOR271RPbi1yKMKv5Mpz3T7wvxm9jPnh6MLDQJGiwzMGW7THUOmPhnwgpsPYu01i46uNKJ/MkEtenW1JABgiFlazoWJNnflawieoDVanMqAfqsZ4niy41HNA4jCJnFtg0X0fkHpyJPEeBqoTwF5kr2B/e6zf/2e7fJsqmLofeO9ODXbI+s/9j/oRfHH3iX4akyO+yXNsuO49Lelff6dhbdS5QlospImOhSXEQFlBfodTMeVHkYi0B8o8niI7aDWYaaVUL9VuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26b988cb-8b20-f78d-548e-1b1f16d10a63@suse.com>
Date: Tue, 5 Apr 2022 12:57:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/8] x86/boot: obtain video info from boot loader
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <6fc25224-7985-73a6-8877-bc209f64bf8c@suse.com>
 <YkwNbi3lTNJbWVNC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkwNbi3lTNJbWVNC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0052.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09e8af9b-4cb9-4897-4281-08da16f32227
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2380:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2380A7EE744D4CF1AA3F453AB3E49@HE1PR0401MB2380.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KV2iqP/cl3oNsO89Ehvb/8WAXxQQHYftTDIrBpk5sW6fYWRbZyV1HGv+6X0/gVmC5u1wguNqvQ1x7XhcimLbsNtxSOEK0hhU+CEKK2d3BAS4zt2TAvzwTVC33kmlPHgNyaP7MBfkNg8krHkAHWufVEWqZd9ul0Nw2NPLkh5Q/dmLbqtWMIaV/P7dnHjXHS/QKZcvwfKuOsphoUTft3gyHK2guNzgvi49P4xxiDdaWi2bji2aVxGyqSTLjyb76PnO70TPgrNhHzraNyQPlDbmbF2uF4H+bGbDnHft9C9G7fsWQ+6qQI71aX5NwaPl9mZgdsx70Mz7qauDKS1hFDnTi6YkaY8OTomNDoWDukshqZ7/tMGHuFo6r0nn/jE+5Czr9vlUtoU9iVDjMdkGGgad0B6jKKA5ANRb9yBKwLbdcEyeuY2N5VJSGbLxD+pOA0AhnYLc2vRhGosTyGQ0YacwN7degfI8hdkRON2tZRgkhCNzOr6t2m0YnATRAHf+pvyCcBOkecZbpWt7sSYgmZBY4OLVJ+j2NuVzMEdvsfGDwU/bV5pPpwUnpJnxcPZnUOKyHxgtnJhKAM1WBrut9pa14vH5hiPW+AblKHYXJqPd6Dpr5k9jFrmcvVUSH5rFiDnhhwyJvAfd9a37L1UNfaiJGlwkNrYbC6A6tAymOjl35qDOG060eoc5c5qmJITQlRXXxs+3tolXiyQV7XybeiTen2JzJQXSYptBE5jowlAbVP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(508600001)(31696002)(6486002)(31686004)(2616005)(6506007)(5660300002)(86362001)(36756003)(186003)(8676002)(6512007)(6916009)(54906003)(26005)(38100700002)(83380400001)(2906002)(316002)(66476007)(66946007)(66556008)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IkEIZWqWStjyKqyZQ3vy37z9+1mXYXcLSCv1XrLabgtyvCcVEJHKGjxKMTp+?=
 =?us-ascii?Q?noN5FbPqPI795oO9WmUiKXRrwQWBek3uJ+gP2ffGdjunTxfNq1tha5iOLPHR?=
 =?us-ascii?Q?ofBIIbThwqad+nfIxv24PPA/OU3AuVr+o0/Hzo4+1x4QnHhxb0NA/CVBMoRX?=
 =?us-ascii?Q?uCuQHWcZPTd6XOt+szMOA//rWYRzsBLZtLG6eFy4hljhbFd+GWgC/iuyfueZ?=
 =?us-ascii?Q?gk2FKiXPT1Quci0ZHW26QWr12fIKUdPBUIcT3Mk5+YlPy14aumsM4lDcjUFK?=
 =?us-ascii?Q?94KBj35qWR9zexZuUfXTnPlh9y+ZC0gqp6LeGLsjCTNGoOcLvOT1FzTWsUCv?=
 =?us-ascii?Q?tDdEkGT1Foo6qUk1oszmYdkEGsc+VXq9r7eJqcXOSjwbmz9vGnFdzf/lwQZm?=
 =?us-ascii?Q?q4cPrai+PzUXOih7+PX/Z527Gozz0nt3FTx4O3GGiIsmfSaMnJicSIDzs61W?=
 =?us-ascii?Q?64QVKaayHG8qyBlm+84Y9bjYZgejRbKfg+EBoLYNK6XlK7BqMs2xJeGsrK7A?=
 =?us-ascii?Q?XBBGk3pJ4QRoiwd2Xbf7TxT5hcEHf24DUcHgn9qhX6LmLr0TXmbouPeZO/fz?=
 =?us-ascii?Q?zERuLt17U7DG1KyX47oh8fOoBGnb9CAXBtu820hrTaHv8D2kq/nz7yPW6N+g?=
 =?us-ascii?Q?WierOsFtwPaAXWGWnK3gkihjT4B8hGQS/pkYGi5CRUSowd1el6Ze9W4dJSBS?=
 =?us-ascii?Q?6f1BwmW/gNh8627DiYiARNcazJ+XyVGZDJj8SZJKk0MAGiUBpQdHU16MiKxD?=
 =?us-ascii?Q?BaFZ7hnRDEzESkaU3SdzyVvvx9OLzOqSLlprcimxCJc80xsJx1Ira5rz3xV0?=
 =?us-ascii?Q?mUDFH8gTx+uFjJ3cNHHm+GrYNbUKN+CEosVMIZ0sCDASDStWhyqMdwtrA1L5?=
 =?us-ascii?Q?eqIiPCx05Uoqczaocsl1DDb3V4O9pGPx43SGV6d2RrAcxr9ohZbWI7+DPzt3?=
 =?us-ascii?Q?mQnVHFr1wJLeNkVK+jp0jso5/b9w4yWaWfHbEuBKRiaIFzytBawS3GiD/VFq?=
 =?us-ascii?Q?xoRv65Tb/SitPbGEWyVzht0ZCTwf08As6e7r1lOpqaLEc+6RL5FLK8m3z3yy?=
 =?us-ascii?Q?EFFRuF6zO57WXs1uULwUuJK2G7wp/wHfv1WxlDN7FtEU//mivjEhljBtC1DC?=
 =?us-ascii?Q?mHlYFVju3oIHxUp8KQEqkQHh1jQQts9zUArWUFsLCaxUcuojJVEx3ZcE6S5t?=
 =?us-ascii?Q?5+hvKt+0Yc9di3QpMcMEhscmvUoNA2hrr5xXES3XcsSCOGvNpDI+2T2wxhHI?=
 =?us-ascii?Q?OlGOozWWtu1KspINV/2lGpbvCR3rO4rADrH2Nu6p07dTAjImqqMbpjqVXXCn?=
 =?us-ascii?Q?X1FDWDucgsusrhpoGRcECTI3CuX0IwkOShKtsFSCkJk0gCBCCMeLCtvJlcHY?=
 =?us-ascii?Q?824RQKapfJvuIiKNWqjgnj/SToRUT66/W5JUcUTnF1VZ7+sHvZNVxU14HQyI?=
 =?us-ascii?Q?G9Od54xWk+CnhEUqrVIucwv2I+2wWb+lRBthesqeSQkP/7cju1QeEzoNrfMX?=
 =?us-ascii?Q?TEWFMRNxbOjLCLHmkuvEgOAh/gWXHe/QBq4jrT9DJ748q2NvWzeleRIGPNt8?=
 =?us-ascii?Q?U29hSLQXVe1p6QmXRgKky5aF7TTJLOUXaKMTuH0JvZQsMgdV8XrN8bRV4e7U?=
 =?us-ascii?Q?zTPTKGJo7m6LkWHLdxk8Iu2liSIn18MhzLCD9TEeeq1G57mLlUluAQp0Ttoi?=
 =?us-ascii?Q?/UKLK+ab1ZmJz89PQ09NSXdNhEBd/XCnsddxGn+u5svig1hRrysfrXumF0Jj?=
 =?us-ascii?Q?3klfx4W2yw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e8af9b-4cb9-4897-4281-08da16f32227
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 10:57:53.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0+mtvhCQqO4h+MF9lX36w+cyHcqyXsEDvYtTOH7RNSpa4qzosyuavZx6osVlhyCg/XsmkqPNxXYAMHQsTiBvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2380

On 05.04.2022 11:35, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 11:45:02AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -562,12 +562,18 @@ trampoline_setup:
>>          mov     %esi, sym_esi(xen_phys_start)
>>          mov     %esi, sym_esi(trampoline_xen_phys_start)
>> =20
>> -        mov     sym_esi(trampoline_phys), %ecx
>> -
>>          /* Get bottom-most low-memory stack address. */
>> +        mov     sym_esi(trampoline_phys), %ecx
>>          add     $TRAMPOLINE_SPACE,%ecx
>=20
> Just for my understanding, since you are already touching the
> instruction, why not switch it to a lea like you do below?
>=20
> Is that because you would also like to take the opportunity to fold
> the add into the lea and that would be too much of a change?

No. This MOV cannot be converted, as its source operand isn't an
immediate (or register); such a conversion would also be undesirable,
for increasing insn size. See the later patch doing conversions in
the other direction, to reduce code size. Somewhat similarly ...

>> +#ifdef CONFIG_VIDEO
>> +        lea     sym_esi(boot_vid_info), %edx

... this LEA also cannot be expressed by a single MOV.

>> @@ -32,6 +33,39 @@ asm (
>>  #include "../../../include/xen/kconfig.h"
>>  #include <public/arch-x86/hvm/start_info.h>
>> =20
>> +#ifdef CONFIG_VIDEO
>> +# include "video.h"
>> +
>> +/* VESA control information */
>> +struct __packed vesa_ctrl_info {
>> +    uint8_t signature[4];
>> +    uint16_t version;
>> +    uint32_t oem_name;
>> +    uint32_t capabilities;
>> +    uint32_t mode_list;
>> +    uint16_t mem_size;
>> +    /* We don't use any further fields. */
>> +};
>> +
>> +/* VESA 2.0 mode information */
>> +struct vesa_mode_info {
>=20
> Should we add __packed here just in case further added fields are no
> longer naturally aligned? (AFAICT all field right now are aligned to
> it's size so there's no need for it).

I think we should avoid __packed whenever possible.

>> +    uint16_t attrib;
>> +    uint8_t window[14]; /* We don't use the individual fields. */
>> +    uint16_t bytes_per_line;
>> +    uint16_t width;
>> +    uint16_t height;
>> +    uint8_t cell_width;
>> +    uint8_t cell_height;
>> +    uint8_t nr_planes;
>> +    uint8_t depth;
>> +    uint8_t memory[5]; /* We don't use the individual fields. */
>> +    struct boot_video_colors colors;
>> +    uint8_t direct_color;
>> +    uint32_t base;
>> +    /* We don't use any further fields. */
>> +};
>=20
> Would it make sense to put those struct definitions in boot/video.h
> like you do for boot_video_info?

Personally I prefer to expose things in headers only when multiple
other files want to consume what is being declared/defined.

>> @@ -254,17 +291,64 @@ static multiboot_info_t *mbi2_reloc(u32
>>              ++mod_idx;
>>              break;
>> =20
>> +#ifdef CONFIG_VIDEO
>> +        case MULTIBOOT2_TAG_TYPE_VBE:
>> +            if ( video_out )
>> +            {
>> +                const struct vesa_ctrl_info *ci;
>> +                const struct vesa_mode_info *mi;
>> +
>> +                video =3D _p(video_out);
>> +                ci =3D (void *)get_mb2_data(tag, vbe, vbe_control_info)=
;
>> +                mi =3D (void *)get_mb2_data(tag, vbe, vbe_mode_info);
>> +
>> +                if ( ci->version >=3D 0x0200 && (mi->attrib & 0x9b) =3D=
=3D 0x9b )
>> +                {
>> +                    video->capabilities =3D ci->capabilities;
>> +                    video->lfb_linelength =3D mi->bytes_per_line;
>> +                    video->lfb_width =3D mi->width;
>> +                    video->lfb_height =3D mi->height;
>> +                    video->lfb_depth =3D mi->depth;
>> +                    video->lfb_base =3D mi->base;
>> +                    video->lfb_size =3D ci->mem_size;
>> +                    video->colors =3D mi->colors;
>> +                    video->vesa_attrib =3D mi->attrib;
>> +                }
>> +
>> +                video->vesapm.seg =3D get_mb2_data(tag, vbe, vbe_interf=
ace_seg);
>> +                video->vesapm.off =3D get_mb2_data(tag, vbe, vbe_interf=
ace_off);
>> +            }
>> +            break;
>> +
>> +        case MULTIBOOT2_TAG_TYPE_FRAMEBUFFER:
>> +            if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=3D
>> +                  MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
>> +            {
>> +                video_out =3D 0;
>> +                video =3D NULL;
>> +            }
>=20
> I'm confused, don't you need to store the information in the
> framebuffer tag for use after relocation?

If there was a consumer - yes. Right now this tag is used only to
invalidate the information taken from the other tag (or to suppress
taking values from there if that other tag came later) in case the
framebuffer type doesn't match what we support.

>> +            break;
>> +#endif /* CONFIG_VIDEO */
>> +
>>          case MULTIBOOT2_TAG_TYPE_END:
>> -            return mbi_out;
>> +            goto end; /* Cannot "break;" here. */
>> =20
>>          default:
>>              break;
>>          }
>> =20
>> + end:
>> +
>> +#ifdef CONFIG_VIDEO
>> +    if ( video )
>> +        video->orig_video_isVGA =3D 0x23;
>=20
> I see we use this elsewhere, what's the meaning of this (magic) 0x23?

This is a value Linux uses (also as a plain number without any #define
iirc; at least it was that way when we first inherited that value).
Short of knowing where they took it from or what meaning they associate
with the value it would be hard for us to give this a (meaningful) name
and hence use a #define. And hence it's equally hard to properly answer
your question.

Jan


