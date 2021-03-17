Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39533EBB2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 09:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98583.187084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRjx-00044V-LM; Wed, 17 Mar 2021 08:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98583.187084; Wed, 17 Mar 2021 08:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRjx-000446-IA; Wed, 17 Mar 2021 08:41:17 +0000
Received: by outflank-mailman (input) for mailman id 98583;
 Wed, 17 Mar 2021 08:41:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMRjw-000441-HC
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 08:41:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3804235-f04a-4878-a7bf-0219438dd8df;
 Wed, 17 Mar 2021 08:41:14 +0000 (UTC)
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
X-Inumbo-ID: c3804235-f04a-4878-a7bf-0219438dd8df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615970474;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/RMgB6BBRjGqIs/Yg9pdp4/vYfjRYLQgoiBoy++X+N8=;
  b=FZBsvSliFzlnh8FNrwfbf6UUBtucdH6clW7AjqgO4NnUErGRc2djbzB0
   Gm+gb425qAIo6cYCEqtxaIIRF9mzzFqAEH3l4L2Z48lj9LjPUAHJ1krZY
   y5FDGUULn8LOb9yEuNCv3SpnusktfoGY3IG5NKJyUAGC7GXBVfEOha8bI
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cD8GqvqOqlwgKcg83JCp1iIizneX98ZRZq6hqW/Fr81Y0Busdf5z0piajlzhaipb7vBFNlt7NP
 vn9xi1Hj/wB80i/6dYU/33gATduD7f7iyusKUabD/rmstrUVB8fs1f6Gg5eV/+hrVSeXyrq8JU
 E7tWUMyBUCjqb8sauYfXt9VP9eDQLK5oiq0aQbPuCMjGh7Q0Xd7q1o34bXVv4Oq2rweS5/xErH
 nHAGkS+3aZFdmBC2Zoqbt1193uUPpLi4JwPQewMd9qXc+rRlmyd1Lv24G619BdLMmuG4p37uXu
 0DI=
X-SBRS: 5.2
X-MesageID: 39480783
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zP9yHqzXciinHuQnE3e3KrPxve4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbacQcLbiRXkzWmoBGJzPrBExae1goDSD8n+9kf2E
 XMjgCR3NTAj9iV0RnZvlWjiqh+uNyk8ddbAdzJt859EESQti+NRKBMH4KPpyo0pubH0idarP
 Dprw07N8p+r1P9F1vF2CfF4AXr3DYw53KK8zbx6hGC0K+JNw4SMMZPiZlUdRHU8SMbzalB+Z
 lGwn6DsN5vBQ7A9R6NmeTgbQ1glUa/vBMZ4IgupkFYOLFuDIN5nMg0+UNYF4o4ByTq6IwrO/
 kGNrCi2N9mNXyddHzXpW9p3ZiFWWkyBA6PRgw4ttWSyCU+pgE182IogOgk2lsQ/pM0TJdJo8
 zCL6RTjblLCusbd7h0CustSda+Y1a9DS7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBeEkwjx9yR2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCy4Tkw0mcfImYRQPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOIPvNIWXE+Pv9LrJoXmuvezSoeRGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1PhE3aPv65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gTdE
 t6K7X3r7OjqQCNjCP1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXmxOwn2dJFtaQ9nNGA
 BS43R7kJjHYKC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9cfFZYpWKt4EC3RDBxrkQNWqG
 NOATV0BnP3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAGhv801f2AaWDSvSMaTpg4rS1Nv9x
 lM2p5apIDFtSekKGM5juh9FFFXcmyYDIhLCxm/aJxOlqrmfxxxSmm2lSWX4itDClbCxgE3vC
 jMPCeUcfbEDh5mtndU3r3D3Xl0em+eFngAIkxSgMlYLyDrq3xz2eiEau6PyGOXcEIF2fxYGi
 rCeyEuLgRnwM2X2BaZlC2ZL2gvwowjM4XmffMeWoCW/knoBJyDlKkAEfMRwY1sM8r2tPQXFc
 2YYA2YIVrDepQU8j3QgkxgHiZ6qHMpy6y1nDLk6XW1x345D775Jk98S7QSPtGb6CzFSp+zoe
 BEpONwmdH1FGP7LuOi4+XwSRVoLxvIu264T+0ys/lvzOsPnYo2O6OeaCfC0XFM4Q43I8j1nn
 4PWagT2sGyBqZfO+gpPx9D9lUnlN6zPFImnwz/DOg5Z0wshRbgTqe0youNjbokGUuaogTsfX
 GZ7i1G5v/ANhHznoIyOuYVIW5MblI752kn1OSed5fIAAHvU+1Y5lK1Pjucd7BaIZL1U4k4n1
 Jf49uSmfWQeDe98AfMvSFjKqYLyl2Ze6qJcXSxMN8N1ce7N1SKirar58D2rA6fc0rGV20owa
 tfdUIRacxfjCIFl4Nf6Fn1dpDK
X-IronPort-AV: E=Sophos;i="5.81,255,1610427600"; 
   d="scan'208";a="39480783"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJm0zpJiTGp633nyEHPZiPyLq5H4BuzxIpDTgN85Wt8m4FOVS35LTG74/uv7uqh5Cu+zRjTnOe4m2istjO1yG3qL24clb+0Ps1GVly7OAkDkCqq0U2Pw5Eg9ACHVMAYPHfNChHA6AprDuJYT4iZxA2KCQlAkIEmGfUTVFxHjsspMj4mPCnzBDLTg+o5x93NxVMxsKp2U6LxVMkqeOjzfzu41P5s/5hZhNzB4K5q1Lt9T4i4PTt8TBIVgq1xTQNWQhCtuLoFPTQsofEW5s92LPbHfy+TZX8okIMLMxWzAwwALmebfhm/rq5tTpXNqQ8r5/KKWUf/IMj9e2umkUjGP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFyGBI/eiR7KrWqWCdQTtNC4YUgmYVqHlxSKYFtdePA=;
 b=Mbfee2XNnk62Peup5hY2UhQz282NnQxcA6dIXwOqyyPFloltc4Mxo+q0l8GbqkZZ2F9CutSx5C7MBEnnvjTiVqFaM5tZNVAH+tu+NPFdgm5CfD74oRET7fX1E0yPOp2o1oEQeIMnTVoTMk34u/HujcOmc65aXwLnljag1lJjlLh5ggYK1kILuYQar1ysAyMwk8wdI9MsfXlnqzPG5lKofkgFwv2GX47Z3Xk6ZiOxGY8ryVGNwOstUZcKL2XnH4EoLSZvoX4sdqh6Lo0kapeeon3u7kLSmYBDHzcAwItKNVKClG5fGaAyjDCbmbN2Juy41lvdi/VMuIHzfpPXa4tUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFyGBI/eiR7KrWqWCdQTtNC4YUgmYVqHlxSKYFtdePA=;
 b=ps186h8VS8LycLq/eufAeoNi8Bqxv94LyyAQyJ0KyPcWPN1yfxvVML5aY3GwxrTej+n9nsdY7NJgK2bZnsSvNoIYUxI/o3M3pEdkTNFD+xnUY6VTWopnuPo9cYoVDE770AFtwubT1CvzDIu11Ip4MqS42DDSmDEBNeEuFmmAIoI=
Date: Wed, 17 Mar 2021 09:40:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
Message-ID: <YFHAiv5VOK1wFcs2@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210316161844.1658-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AM5P194CA0022.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 771e6944-02a2-4a2c-aaac-08d8e9205ce6
X-MS-TrafficTypeDiagnostic: DM4PR03MB6190:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6190BD17507FE79E3BE1E0408F6A9@DM4PR03MB6190.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oMa4V1Lq02Y7RtH4Re+U7X0Ur0qKwhu2Opepk+u74D8TlnHUTn28GYJ+boO8aUkt5+cZkL+DBE5OJ8OqwZ3e/HUgtjBJm7DPl4ydKxu5Qx9m8PLFQNfAOprVatLSA8P24/y4G4RbBNx6dJ15lcisUAmIHSQyLr1GlS/Z/Rqf2cvI3+6G54aIQLAVx6c5XIwvHCntD0HKJ9V9AAlsnVe/4jpL4s2vkrRw5NlediOIBNFXQ7AKUtyEAYLlkhTL2q/CYQPqaJ0W9QGnesBcWgsnke8XPJHrqVQBMehoIJ+sRxTEaaJJuibcoAD3Xl/81uzjB7E7TIb8+eGYIl5lJuXtPU2PbzQWsjuV7ykekEHUt9VUf0vOESeTcAo8yGdN3D1+o2Ydk++GTrVBOH+Ysrh7r5mHGRCIERTinTURRjFGK0Gq7pA8qEzqvmZv2wUDt0Kk4/txuiXj2j7NEgf7tPFqkTJ1jDdfsWnpC7tA4cEbHwIt6gEszchcmOP7WfMgffVSpl86IlU8eCP3WiiVaHc+/6cjB45eG0OOVgjvcDCZd+gZTMSibeB9cTpbSbHQUiL9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(366004)(346002)(136003)(39860400002)(2906002)(478600001)(85182001)(316002)(6862004)(956004)(16526019)(66556008)(54906003)(5660300002)(4326008)(186003)(83380400001)(66946007)(33716001)(8676002)(6666004)(9686003)(6486002)(6496006)(26005)(8936002)(66476007)(86362001)(6636002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b3FpQzkySDBJbjR2WnFiUDBEREZYMVJwZCtpZEdyaVkwMUluaFRzYlZaQWt2?=
 =?utf-8?B?bUlUSCtBNWxVK3VDVFBZdVE5dUNYbllHMFl0UUhONEE0SHF4V2QzVzV6ZWsr?=
 =?utf-8?B?MmVBenhFT3JseHNhbXNnN3VwTWFxcXREbUVldU1lMmNnOWp6bWdRUjhNRDcz?=
 =?utf-8?B?QTQwbzhhdDEyNlBsRTBtNnBsZ1VxdHdMazAvNFFwR2Izbk1GT0tNTTZiT1BD?=
 =?utf-8?B?UjNyUVVpUzM5bVVEY0JqcTZYYmhjZ2tmL1BQMEVabEFjcWNoblRST0NSRTdw?=
 =?utf-8?B?QTJnNWNRdnhXeENweXcvbXE4eXFkOWFRSlRjekcyVk91SDN3Y3J5SGZtZms3?=
 =?utf-8?B?YnBqRTVZSWFyczFQMmwzNWl2UkEzYlpSQldhckRrSUhvTTVsb2hIMHdHNnZo?=
 =?utf-8?B?K1ZQblJwbkJCcFg5V0RGaXlTYWZwSndUMFB3YStNUGhqWDJjM0lvaWhXQmZ0?=
 =?utf-8?B?ZmNtOUh4NFR6Y09GUTc0c2ZENENpS2kxZCtaajFJYzNBV1NVcjliZnJ5UnNE?=
 =?utf-8?B?enQxRFBZZE1LSi9CUEZqMnBBWXBDc0doYjBjeHN6aUs5N0NrS3pXcklNeC91?=
 =?utf-8?B?YVlVVm5VelIwL2J1eDU1ZldzWXVCZk93QzJMVGlweGR5aExtUGVISDZvWXJm?=
 =?utf-8?B?TGVwVm1FTlRHQ0VyK2NpaEczUkxiN05CYlUrYk9oTzU5YVQyQ3FUOWJlZE5V?=
 =?utf-8?B?RHRab0UyRFFqVTJtWXgxd1h0YXZRNjlvSlVxNzRPQUNLNmVjM0EvSHNTeTd1?=
 =?utf-8?B?eExTQ3pEVC8wVWVJSGVTanZyTHY1bkNhNWlPNWhHTTZ4MjNING9TK1AyNkcx?=
 =?utf-8?B?VHZIQ0dIRU1TMlk0eEZMcFZ3WGRVdS8waHNBbCtZbE43bnNWUG1UdjBhbmha?=
 =?utf-8?B?NDBVRkJmQkJLZnpNSGxzSThoKzVhTCtCQm5Zc2ZjWXkvUHdubXRVUE1BRGlG?=
 =?utf-8?B?MUJIV05EQm9qOEJsV2NlZHQyd3V4dGt4WjBXVEprdENneUhsdzZ0T1FYYWdj?=
 =?utf-8?B?dlFRVXpLNDEvUndSRGF6YlZIVUpsVkdPdm1odzc0R0hNRU8rTXRPbTBaOFNN?=
 =?utf-8?B?Sm94YnVRMk5TK0hrYm1Jdnd3dThjSHZNYjE2dlExcXpTWGtZZnFYd1hGaWRL?=
 =?utf-8?B?amZOZVVyTkpNLzJMVThEWEQvREtIeDQ4MXBsZlpCRlovSm0zeit3blB5Zk5m?=
 =?utf-8?B?bG1oSXovYkJqTHNDdlBYU2hOSWwveVJTdy9vek56N3hCckpRVkhSMEJlWW41?=
 =?utf-8?B?eGJFRlY0ek53dkQ4QlJ5a2s5TmNVT2YvUDRPYkRIR09wOFJKcXRnSTZwSmJa?=
 =?utf-8?B?bm9BZmE3dEhmVDFmM3BxckFVek41MUJCTVNHUkpENWwwRUJBRk5iQnZaODlG?=
 =?utf-8?B?b2Q1Q0dCUWh4aWZhS2w1Y3VqL21nL0NDOFRrMWcwY2R3dzFRenRMd042cHg3?=
 =?utf-8?B?Y1czM3FGQVVnWjY4M2tXby9JMkxlemh4WkJYdlc1anJQMkFHTGdiTHU0NVNV?=
 =?utf-8?B?NldqNnRJRkRyYmwraDZhWXZiUGUwVVVVVHFOa09jMjdpK1E4N0hhcFJrNUQ4?=
 =?utf-8?B?MStZVDlqU2hkMTgxd2l6RGhUNFJ5YUsyVlNxamJ6ODl4RklaZ2hFUXpsTUkw?=
 =?utf-8?B?Rnd0dmQ2NkFsM0hZZUNoOWlTOGkwZ0VGV3hRUmZaWnFNUnNzZnZXaWcrSHlh?=
 =?utf-8?B?YUJxR254bUtQRHBDdWxrb3A2aGwvbWNRUktPcHRBQ1ZYVGYwQ1dGakxCNURS?=
 =?utf-8?Q?/IdeKanPartWDZdJDICaZg4qsDd+zXRkNG6MG3i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 771e6944-02a2-4a2c-aaac-08d8e9205ce6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 08:40:48.0906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozefVMY4TBqZivIy0K5u50pgKMAVPVwd25tC/TS6I4pf/+gyyZNit8NaJbsVXE+4fvGBD3Xi59CIxzJY9Qz5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6190
X-OriginatorOrg: citrix.com

On Tue, Mar 16, 2021 at 04:18:42PM +0000, Andrew Cooper wrote:
> In hindsight, this was a poor move.  Some of these MSRs require probing for,
> causing unhelpful spew into xl dmesg, as well as spew from unit tests
> explicitly checking behaviour.
> 
> This restores behaviour close to that of Xen 4.14.

I think it might be worth adding that guest access to those MSRs will
now always trigger a #GP, even when msr_relaxed is used. This is
however fine, as that's not a regression when compared to older Xen
versions, where access to the MSRs also trigger a #GP
unconditionally.

I assume the wrmsr side is added so that when using msr_relaxed Xen
also injects a #GP for writes to those MSRs, as it would do for
reads?

Thanks, Roger.

