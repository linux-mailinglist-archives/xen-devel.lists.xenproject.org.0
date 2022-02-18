Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3F4BB56D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 10:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275262.471047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKzTw-0005py-UL; Fri, 18 Feb 2022 09:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275262.471047; Fri, 18 Feb 2022 09:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKzTw-0005ne-Py; Fri, 18 Feb 2022 09:23:16 +0000
Received: by outflank-mailman (input) for mailman id 275262;
 Fri, 18 Feb 2022 09:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKzTu-0005nY-H1
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 09:23:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 655cc655-909c-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 10:23:13 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-0mKHGwbMMmScHo8n-eTT3g-1; Fri, 18 Feb 2022 10:23:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8969.eurprd04.prod.outlook.com (2603:10a6:20b:408::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 09:23:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 09:23:10 +0000
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
X-Inumbo-ID: 655cc655-909c-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645176193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0ZwXjK2viuZHUHMqRNew1B15bGiZaTyRgb8wudTT48=;
	b=k1mbqchgarP75pMC6YGb4MtqqQXUsPXfGtdCmNy8rvlSFRCcMw5uheCtA8XEbahinZvxIO
	AXnk0yPZhT7o7u4h3rp4L2A2xjQ4UgUMHxIhEIlIuIZ8P+jEh7hXL5/ZXZw5LPVhcs9xLS
	yncj+VAUAtU11i3ztZYiOQ0zlevu0Fo=
X-MC-Unique: 0mKHGwbMMmScHo8n-eTT3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfkSbpArsXbUCPg3fjdhcMlhCBYkvwiOt7Euxg7NNVcgQeuVR6GQY9NxZ1EXoISx61SMo4F5NP1OO8VTPanudezvHD/5cd6dugtLRKQrBQkmHYMdTqwGR/JPf+Bi+kj8zb0ATlQnQnmx51a8ejtDx7utLPhVFKrx+RDj7QyKDoF2yF8ezb2tJtyuakC7MR8b6kX85lF2Fb7rr3Ha4uxvdaN9AjzX0kcMKUKXvadaUb9R7RXS7JXNeBlTuo+l3mfAtGblL6RzBwPQvZm23WsBt83eMMCA3LTf6cqKUmsg7fHWGkrkyfwnchTzqV+TkJpoX2X4GF4cyMHq37NoQImtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPOU4T+sDkpArn1Kw6m7Awwf/Dr26oM/r+SUieR7NJg=;
 b=VEwEU3rMxcoTlCq+SJBSTvxdMPfOE7sg8+cIjjPSMqh36Mh6GTWZn74v9tELhhZa1ob+o0JjwaH9mgg7H6QQ2gVfb/fAqCuJqz5Gcp7ICF39UgmfXbF0ESYgnT4qGnfCabwuhtYbJpi3RQOIHwjp3JMT8Gzwsv6SoC43692+SuN9MNSM9j1qJUIv8+CSXSJbVWwBVQbd+Db0s3BWkph/cePFZmqFxH5F2Ubs4rRCJsPPeM7KojJe0HcWxwDQbVxDUBlzEoMirzcLISMWj34GnEnwDV76YAQeg7L+QSUrLTqJvBlgHEXGt2BJjpRwE3/YAmtVbTepSOWimCmL5lcJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9029ba87-632e-5061-521f-fb3fdcb6724f@suse.com>
Date: Fri, 18 Feb 2022 10:23:08 +0100
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
 <34dac738-0631-f80c-a3db-7367e37ec0b9@suse.com>
 <Yg5urE+rpOQGWiH9@Air-de-Roger>
 <6f343b71-80f7-1aca-3be1-58239ba81dff@suse.com>
 <Yg9iQq7AEnDirafd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg9iQq7AEnDirafd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b724c8-3b25-48d6-7547-08d9f2c047c7
X-MS-TrafficTypeDiagnostic: AM9PR04MB8969:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8969B9397B00D146ACF9C182B3379@AM9PR04MB8969.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GKysKR6BGU9KL3b4gPqSOcTF7wxtSgCeppaR8WDntitjjK1NyZRo+GdpT22UKWTODpVFiYALHOSnb1h6q8bVstSSsyY/ejVDrSeuYN/l7VedBqZF0G1jy8sgS1OnXeo55VcrPcZfEdGMX6VtZowBHTLgKHZvBJAvW0WwIzMqzMqZBCb8lwEmGZX/++YGwddsNrS6C+0q0fyjXJaFxtnrZuWG/UZSa/4GLLrdD/KvpQ57FCLFDZvJsz15TeOQola3UxAYeh9CzHuoUHo3k9+9YuEPu2b5Db5nXoF17s7oV/RgptGtk0MViFPWefSxbwIvkn6KeNQ7UDwt9navErkrnRc6RMXfZ+RR16hBsJcey+MjJDihA5QbtzjffmQux5bCugxQaClyLVhNugM+5UR53AxZUAb55GgoPh6nLcjF3KAGPXkoDotN9/yiPrazP0vfu7XBJ5U3q+ticBlhxgHdp2de+0ZJnE2pvbzY0qaqsvyDya+Royw6mgtLso0Bl82qtz3c5Y/552G59FJJiAcJGoeAgfdJbuSuhuptvVxaWgLArqshMMp5uH9smXaYM8x9UXaXBZ3Rol013s06+9W+AqwVJm1dakbz3aeAb7JiMK/swvkJqZBPtsci6AUeAxOEFk1iEPJsVOE+a9q2KWwGlKZiw67y8IKP1spG5w/v7zzHDySDjFbGVjJTeDwSAvBY/XChHJutsMZCZkYEM59Yp38M0emkQ5obGH9lpXIdo5zA59w0HzkW6Y/xFHmKa+Cd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(31696002)(83380400001)(2906002)(8936002)(186003)(6512007)(38100700002)(5660300002)(2616005)(26005)(508600001)(86362001)(53546011)(6486002)(316002)(6506007)(8676002)(4326008)(6916009)(66946007)(66476007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xp4iPNeDBPpNpmAgV9KeYTIGnPBzTCI/tCjodeTdP8Cw0UCxyUzbsA4It5qd?=
 =?us-ascii?Q?AWBSMPqjZRHoZ/F/GvbiQhleck9BQJhzR5sA+9HRmoSZrGWmR+9zf4mKNupK?=
 =?us-ascii?Q?E7eT8OAzbWrFE12pXpMJ8YKjtPZgy18YCztzfueObupy9UOjVdLNz6xWlM3U?=
 =?us-ascii?Q?KHFF6H9oQyOECk7UgtKl2gUL1vMlEqWC5nQDsoEdw8I7jP569paqcJNZPcqI?=
 =?us-ascii?Q?UC4TDAEz/xMfoDeK7nnCrl4M1q0xYh/bR2BHGvucqIJL+Pcl0TFie/niM1zr?=
 =?us-ascii?Q?baN7CKl7knjUmdFV/u8XX9Jc81QlpriMrwmfSLJwXe+HUN8oh7i70P/Bvrg7?=
 =?us-ascii?Q?IXrIumbAUa8HGBG16ZGmC+p91aYhnvihXsYoXnkrA3/Ns01GTpm8HCCsCpui?=
 =?us-ascii?Q?IE4CVXUY1/mkua0UJWoTPjFgQhmGGTD5kRgcDQri0/cdPfarfhFVfnZRW6x/?=
 =?us-ascii?Q?x8aARy7nRm5reZb0FXCZyZI+mZuA6regi8/Hnepm5SPI72Nxg5VvCoYGgfmF?=
 =?us-ascii?Q?p3gOewYf8IZpRoJY4tHRW3l4Q9DzCRvyk+S8ctWJgjZ+bVqLyato3aLM1Rma?=
 =?us-ascii?Q?cxAYJFyLej5XpfHePeJadoexyLlsO43FGLdsj5bU1O1LuT+2/QIlGtnMHaDY?=
 =?us-ascii?Q?YGIz5HQjIY6GzpPli+0p1U6h06Aw9Im5+/qN5p6NYcS1sXjN1TRJChu5vmJW?=
 =?us-ascii?Q?QelYQRT9vJ326ZakcxZS1UHx2AYair9A/jaEBBvFal3d/42FibkkLWTj7jtV?=
 =?us-ascii?Q?Dzafrqzc8J0OnvXz+6mECy8/QIrjPZ1VS/rS380Pi1bo1x63VY07m5cAPTgD?=
 =?us-ascii?Q?apz1loYwanW/ExL/PD8RampKikM/nAzy3vvE2iH2rl6CDSf5pOoalDw6RnbR?=
 =?us-ascii?Q?Ycp0IWqPLhSgf72A6OoDr/M5VdEQQT0LtQK5x5WWDiQf0eerTncJBHL2LjSw?=
 =?us-ascii?Q?aZbzKvzK2p57nW6QHOPNbOSBU/08crZWQj2JC/bKusvwmS4uCV/ACF8WgNNW?=
 =?us-ascii?Q?jYbJbb0sEJFV+ncQXWLF7C6oykNqBFN0cvBpZ5qdQJ6xEqsaWC/yxsDnBFq6?=
 =?us-ascii?Q?QQHqYKtF6d6KtJ1X49k37Yj4IWwQWueR+R9db1fN4/DkPk+ZSc19T7ZtgNSj?=
 =?us-ascii?Q?C5Wd6THAnoKvlEx4IQ0bovQSdI//Dw7Qx8ijoF/UEq9JMpqWjEAKKas2rFe5?=
 =?us-ascii?Q?iHMy5E+Sax7C5NMp3bUaiCLYSxEu5JZYdJCoycMayeYdR5md9487q+Y+cULj?=
 =?us-ascii?Q?ggWM1E1IYyHuYrcnY0t2N1gAHbLELlP/opnnc0T1/cY3mkcQlbPaFbPBzdmR?=
 =?us-ascii?Q?8UxdodXP0F6FH7AxqEkqmm2jHrV8Uuie3XWBKTNWDxgWyiY6ke6TrYjEIeon?=
 =?us-ascii?Q?x2fPNVsonaBolGfxhi5JXQbES6sBmvXDihDci2A+NQeWy47PQf2XohKfg004?=
 =?us-ascii?Q?9Dl/v3hmNORKoLqACbTRbaGdwR+BrNK/ReNb/LxQDICyWx6czScoABYipRTS?=
 =?us-ascii?Q?rLoPqTVOhwU4BsjBsKpMjDhKhcuLuqJYjHg/BRA3eKARsgz37uy0EH3UYfg5?=
 =?us-ascii?Q?Uh2WNvLmjSMOV/D03bD4D+Nn9LiE7G0f2j7SZmQ87H08xb9mwffVn7RYIzQ8?=
 =?us-ascii?Q?BfbcVBJvIxcGDRoFvEDdFUI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b724c8-3b25-48d6-7547-08d9f2c047c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 09:23:10.6844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44TbRIDM49ARo3IArEg0VmUx3X7t6b/0IM0V6sPWeaY+mD3szq0LUN88UAFwu0QM28vcJ9ML5hm4m2vgjXxj9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8969

On 18.02.2022 10:09, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 04:57:41PM +0100, Jan Beulich wrote:
>> On 17.02.2022 16:50, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Feb 17, 2022 at 04:02:39PM +0100, Jan Beulich wrote:
>>>> On 17.02.2022 15:47, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Feb 17, 2022 at 12:01:08PM +0100, Jan Beulich wrote:
>>>>>> --- a/xen/drivers/video/vga.c
>>>>>> +++ b/xen/drivers/video/vga.c
>>>>>> @@ -79,7 +79,7 @@ void __init video_init(void)
>>>>>>      {
>>>>>>      case XEN_VGATYPE_TEXT_MODE_3:
>>>>>>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVE=
NTIONAL) ||
>>>>>> -             ((video =3D ioremap(0xB8000, 0x8000)) =3D=3D NULL) )
>>>>>> +             ((video =3D ioremap_wc(0xB8000, 0x8000)) =3D=3D NULL) =
)
>>>>>>              return;
>>>>>>          outw(0x200a, 0x3d4); /* disable cursor */
>>>>>>          columns =3D vga_console_info.u.text_mode_3.columns;
>>>>>> @@ -164,7 +164,11 @@ void __init video_endboot(void)
>>>>>>      {
>>>>>>      case XEN_VGATYPE_TEXT_MODE_3:
>>>>>>          if ( !vgacon_keep )
>>>>>> +        {
>>>>>>              memset(video, 0, columns * lines * 2);
>>>>>> +            iounmap(video);
>>>>>> +            video =3D ZERO_BLOCK_PTR;
>>>>>> +        }
>>>>>>          break;
>>>>>>      case XEN_VGATYPE_VESA_LFB:
>>>>>>      case XEN_VGATYPE_EFI_LFB:
>>>>>
>>>>> I think in vesa_endboot you also need to iounmap the framebuffer
>>>>> iomem?
>>>>
>>>> Again part of the full series. I guess I was a little inconsistent
>>>> with leaving the VGA unmap in here, but breaking out the VESA part.
>>>> It's been a long time, but I guess I did so because the VESA part
>>>> needs to touch two files.
>>>
>>> I think you are hesitant to include the chunks for the above items? (or
>>> maybe I'm not properly accounting for their complexity).
>>
>> There's no complexity, it's really just that the zapping of the pointer
>> needs to be done in a different place from where the unmap is. See below=
.
>>
>> Jan
>>
>> video/vesa: unmap frame buffer when relinquishing console
>>
>> There's no point in keeping the VA space occupied when no further output
>> will occur.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> For both patches, the one inline here and "x86: introduce
> ioremap_wc()".

Thanks. Actually, while looking back at the original thread, to re-check
what pending objections there might have been, I did find the reason for
the split: In the patch here I would have introduced another leak, while
the other patch fixes an existing one.

> While at it, I think you should also push "video/vesa: drop
> "vesa-mtrr" command line option".

Yes, that one's merely dependent on the one here.

Jan


