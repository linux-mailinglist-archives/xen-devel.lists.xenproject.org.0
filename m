Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C24BA53D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 16:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274874.470491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjAD-0006ni-8B; Thu, 17 Feb 2022 15:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274874.470491; Thu, 17 Feb 2022 15:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjAD-0006lZ-46; Thu, 17 Feb 2022 15:57:49 +0000
Received: by outflank-mailman (input) for mailman id 274874;
 Thu, 17 Feb 2022 15:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKjAB-0006lT-ON
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 15:57:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 591e9acf-900a-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 16:57:46 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28---t2E1Q1NiCqNUpACSpbnA-2; Thu, 17 Feb 2022 16:57:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7672.eurprd04.prod.outlook.com (2603:10a6:20b:23e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 15:57:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 15:57:43 +0000
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
X-Inumbo-ID: 591e9acf-900a-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645113466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iunAgiiwD/6hmyu1jkkrPQJWUH9YFXwUtL+ILSNeHbc=;
	b=nkoJ9gwjMiLr2NDCvsy9OowpURuFanstRnp+sY1CkrHlTM2ZHiLs1f2P59pfnmNGIUFfw7
	t7UWjRDMHmPBDidJRhg+opvCbmNEQIf35ZieHnyqGcpGRms34QaNXv3Uh2KxWDpk69dnR+
	jIf0xUUf3vf8QHbcGCxOLCiFJaDoaUc=
X-MC-Unique: --t2E1Q1NiCqNUpACSpbnA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAIP5PNA+/b1nOkFmCerz58gP1AYuHvsFYhSHb27oATXWw9tMEoWU+3NpYyOiJWfgYDtbaaLX3nFWUudyb1i55zs3uh3P7hrCOctpD7sel+zFuNcyNiJSFjIexZOfsWzTzdao3dZ1OOzXCLvk91/WXDTN375vmzgLiEaLSORhF3uO6z2IPPmNAC6DAQXqg9a6v2Slj8IOX9Z0UIFxLbpI+rnHGrgTj/3gwyhwNUhB5ILpB85ikQsWvbx31EixcJkxPIo35AjUi6EdT6BI/iZARMTP9v5b00F6b9xbGe6yNMjwrBYsTqYHJ6UGuvTuslnBkkQHdurrcl3LOg2X1a6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8PaQRst3XiOwatV1sZARRAChZY4jzPC6XQs4ZHxiCA=;
 b=i21GlgTAs7tufkx65inKxACTEPabvcRKgO8FKI4wI18bLBbEAXtwRYlaaqjzaKMq53ORszY+lpMg6whjpT/aUtSK3XbbNLyu51ikllexh2KcmwnBPJPJOfkJjIJrPKFSPRXjDEA2TFYAxIjtD6TjyPuh1sdSk7FuhrqsDozCuZhkQpykBlnak7bOjyqcERVvwm90TAzJ1tsy3dIvLyiEQRjNdXx+gSFBIUiDWcB13vGO4P5UOoG6AvP9wQzcjLTctPPlYpyo7IDaOeN5mwvvdTYK/K6ZsC9w+pUAN6J2+UAlNl69uFFjtCD2+V1wDSzPK4HpJHo/KGhaw8HH385mvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f343b71-80f7-1aca-3be1-58239ba81dff@suse.com>
Date: Thu, 17 Feb 2022 16:57:41 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg5urE+rpOQGWiH9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0029.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8961105-23c7-4ab2-76c6-08d9f22e3b95
X-MS-TrafficTypeDiagnostic: AS8PR04MB7672:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7672F83B91DC61BAC4B6824DB3369@AS8PR04MB7672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ln341RwRLbHBCmsmK+vje+0S1LGA0qWYqtOGjZmnsw2//Vj8bRbc5sw3bxWp6F5u2xM7ceHFe6ergZrEccLcsGEwLbd+gXUH8LOKiJLfsl67Yq6oneWulX5ro7vwOnlvrUq0VQdXQmU2y9VRNDC1DDSxhScwWkYy9p8N/QY7ZlqoXdd+eLfFA9IzYmVL5u2UxZwv6rc5dXXcCVXgItHhHNNVs7YT+uwMYaffF8YOoY/wJokITGE6mQg0o90yFaDkN0lw/ehKZp2zcu9PHbVwHg+c07OzyL5EiuctgN1eFvjK4RQNgGjTp0db5LBYORa9lLkT5z+/OVyWWBIxVyp0vL5fAwYfX7kMlGXi1IOwkTQptAiU4y134tIy7CFZrUK7meycNNsKa2Zs3TA1Zeol5QgsMKnWnSka6xWoMExpguj/Zc0TGyDZ9O9nS/qyvR+MpR6ujSgdGZMHasmzLvQzwWIY9pQeEyOPGHsCO0sBkoAGWulLXx4TTpy2TOC1WM9hV9X38Ire8KOemFuSBOlYQXuADbkys2DX4AJ/9JPOufyAsQk8+YYqVRTEJ6LI2KBCupcGCdQ8kWVuuPfYXtw3o7eFJJDerzrLymAdszj+29Y3eD6pOUnkEeosiQz5JBsh3t+ZJSPbgnmCsZspzBxK6/WaWCmG/ivi60/iCykkZk/tEGRvMkwlL+7v+0YWlZBugcYHQVA3Ds0/IylA+adUbT+vuJj8I6OxVf63hz7Q9uWuPc+qx6uXIUGlZUiAzDioX77SAxT0L0ZWkDX5WdT9pP5z4NW8OHmohI0xuMvRYz6aMHX/QmU3omES7lumfrKZnkpmGs1ZAXppTR9hh1tTcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(8676002)(31686004)(54906003)(83380400001)(66556008)(2906002)(5660300002)(6916009)(6506007)(6512007)(53546011)(8936002)(508600001)(6486002)(84970400001)(66946007)(86362001)(186003)(66476007)(4326008)(26005)(2616005)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ejJvvVdpJr4JTiHMMEgIIlWV3sE6v1gzpgTzxaGM30WX44RfOLXmcUNSS1Uv?=
 =?us-ascii?Q?Eggbofv1+fL51uopzAv+ugIm+FBWXYdd1iD4mSZ8crfyaWSpNlKVG8sfl3B3?=
 =?us-ascii?Q?1ke/+4hnL8QZ9hIKQUbwrX2/qkZk9JVuJLiNFTMC0sMwSFnntGdjil28WV/k?=
 =?us-ascii?Q?5X9okakNWib+a7HxW/+CvIBRKvXcJFFcwAAMirgaLkCPAcHooOduso40/C6E?=
 =?us-ascii?Q?3EzaHbxyN7vDWnOx3gFbVTteMoiq5GuZ302A4XKPt6jT78/O1ErQpnej73XZ?=
 =?us-ascii?Q?ynWDyiEZ1KTWOi2tZsQ5Nr2yD4YHPACqwognEESrS46Xd/huiv1HUW5B8sfZ?=
 =?us-ascii?Q?XTvxXhSit9ZReHGJeWP1oTBzGCWbMrE6tdSbxPHr0+ril8hKib4uoh9Ex0a2?=
 =?us-ascii?Q?2xlmNWNwNqd3aRSdi1kU0PJQsrUULZDRbz1RCaxdQDJ/qiO17WEHKIimd6+3?=
 =?us-ascii?Q?45ggjpWnNPwpE396TK7s3gpLYXV14hlPFVXPfzB00BVUboLtllCD/OzRpMSJ?=
 =?us-ascii?Q?kbmkp4lYBjpPjeo61k7DscCMB+ogbzlpZ7jutrXZ9Nqi+7cMP5q50Ln4Zsj4?=
 =?us-ascii?Q?vW/61xzSYVDGAOcjQjNZA3a9ili0I+V+2a4k0tlglEFPvQnO9uGI+cNfXkEm?=
 =?us-ascii?Q?exgKFNmBubwpgt6nOUayRvDdBmgo/4fWK+csZnvgbTE+/9bBjv13L6yFM5y1?=
 =?us-ascii?Q?4QiMpkCXbqwyexZVeTxFq5EbrTn87IXwyRdxCN3Wan62NCFX1LhcfI2g1WbW?=
 =?us-ascii?Q?tYc/vsQgbw05W5sp29SCHS1e6510EuayjHFa6vbeO5lKDxbrRfRuEIqpM24N?=
 =?us-ascii?Q?wykSLDGad7yJCKTx4IW5ctWE2j+sYyZ0Ebbo9o2atVfnrDGiagD+6auEE/Y6?=
 =?us-ascii?Q?xOAJCp7rHVcS0IyR6N98Q9AoAi0SsXe9PQwtQz/tsrhTM+9uR3cLw9Xr/Aju?=
 =?us-ascii?Q?mK7pyYuBlX7YBw/QuhgOgRUaZ8nJS4xMpXHredrvsRrORC9EcSnictdx4u5T?=
 =?us-ascii?Q?1Y1wa5G06SlanLva8EzzHyDYHCgX97cIXQjaIb9e3lFqKNRCNkU/zMFCW83+?=
 =?us-ascii?Q?RF5ssO5X9Sjh3xyHFv1wJwgaIz9SIXsxOrzbHB6EFbQZIQrIZ7N6fNJa+mR9?=
 =?us-ascii?Q?+AfNh5yNhZLmIFjlS2vp0AVMALNTVU41llkBsWWw344xIXBTgOd5uCq65C4E?=
 =?us-ascii?Q?ln06W6QutJQAQ56nS+qbdNSlXnjSgtOoBPRdL3wuqOU8OLtq1+t5nGKfuVjp?=
 =?us-ascii?Q?Xc/lEA75k8yFkrhtv3UoxqEd/j7r7VYkdhUrZDHy2pWjp8BMxnbogx0DiN+T?=
 =?us-ascii?Q?JW2/uXSIfjQy7IpLZtgBPtvTaBW2ANXKvnLOC6FfggsNUl4rIP50AhDuW7rZ?=
 =?us-ascii?Q?OhNo9CquDUviqgwC0C4KgUUvFZ1zJ6olUe4ncWA28NGsVcIdYFuh3eZPYedm?=
 =?us-ascii?Q?j9Zzjt4J8TbzDj7lFIRlafxzduEFzf/UKeto9iR3IYsI1WUQZ3uzzYHNYBAh?=
 =?us-ascii?Q?nOhuNPdGmX9IO39M3MMXLS5NKoUeXv80ds+2u9Cp8Bzbjjelj3CO/P6xAoBz?=
 =?us-ascii?Q?eEmZxiMgI0MVq069VEN6YZWhmV16jJimZOIdKbbKHQBuGQ+IqsA6Afgzrwf8?=
 =?us-ascii?Q?sqcX14CnYSQo5/2WLbuoYkY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8961105-23c7-4ab2-76c6-08d9f22e3b95
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 15:57:43.4516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQcYCuMdxPa6NHP7JQ6nSOwuoTHc2AJl2G45jHUfgWGAV1HsgZznmZ5BRhGh7wyorEDBC+w/RamkclP+ga94/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7672

On 17.02.2022 16:50, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 04:02:39PM +0100, Jan Beulich wrote:
>> On 17.02.2022 15:47, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Feb 17, 2022 at 12:01:08PM +0100, Jan Beulich wrote:
>>>> --- a/xen/drivers/video/vga.c
>>>> +++ b/xen/drivers/video/vga.c
>>>> @@ -79,7 +79,7 @@ void __init video_init(void)
>>>>      {
>>>>      case XEN_VGATYPE_TEXT_MODE_3:
>>>>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENT=
IONAL) ||
>>>> -             ((video =3D ioremap(0xB8000, 0x8000)) =3D=3D NULL) )
>>>> +             ((video =3D ioremap_wc(0xB8000, 0x8000)) =3D=3D NULL) )
>>>>              return;
>>>>          outw(0x200a, 0x3d4); /* disable cursor */
>>>>          columns =3D vga_console_info.u.text_mode_3.columns;
>>>> @@ -164,7 +164,11 @@ void __init video_endboot(void)
>>>>      {
>>>>      case XEN_VGATYPE_TEXT_MODE_3:
>>>>          if ( !vgacon_keep )
>>>> +        {
>>>>              memset(video, 0, columns * lines * 2);
>>>> +            iounmap(video);
>>>> +            video =3D ZERO_BLOCK_PTR;
>>>> +        }
>>>>          break;
>>>>      case XEN_VGATYPE_VESA_LFB:
>>>>      case XEN_VGATYPE_EFI_LFB:
>>>
>>> I think in vesa_endboot you also need to iounmap the framebuffer
>>> iomem?
>>
>> Again part of the full series. I guess I was a little inconsistent
>> with leaving the VGA unmap in here, but breaking out the VESA part.
>> It's been a long time, but I guess I did so because the VESA part
>> needs to touch two files.
>=20
> I think you are hesitant to include the chunks for the above items? (or
> maybe I'm not properly accounting for their complexity).

There's no complexity, it's really just that the zapping of the pointer
needs to be done in a different place from where the unmap is. See below.

Jan

video/vesa: unmap frame buffer when relinquishing console

There's no point in keeping the VA space occupied when no further output
will occur.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/drivers/video/lfb.c
+++ unstable/xen/drivers/video/lfb.c
@@ -168,4 +168,5 @@ void lfb_free(void)
     xfree(lfb.lbuf);
     xfree(lfb.text_buf);
     xfree(lfb.line_len);
+    lfb.lfbp.lfb =3D ZERO_BLOCK_PTR;
 }
--- unstable.orig/xen/drivers/video/vesa.c
+++ unstable/xen/drivers/video/vesa.c
@@ -197,5 +197,7 @@ void __init vesa_endboot(bool_t keep)
                    vlfb_info.width * bpp);
         lfb_flush();
         lfb_free();
+        iounmap(lfb);
+        lfb =3D ZERO_BLOCK_PTR;
     }
 }


