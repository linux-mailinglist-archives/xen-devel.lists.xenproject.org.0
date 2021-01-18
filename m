Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688CF2FA83E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69951.125434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ysg-0004lK-AE; Mon, 18 Jan 2021 18:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69951.125434; Mon, 18 Jan 2021 18:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ysg-0004kz-70; Mon, 18 Jan 2021 18:03:58 +0000
Received: by outflank-mailman (input) for mailman id 69951;
 Mon, 18 Jan 2021 18:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Ysf-0004ku-0r
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:03:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65946eca-2ae4-4a4c-8089-84dcea536846;
 Mon, 18 Jan 2021 18:03:56 +0000 (UTC)
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
X-Inumbo-ID: 65946eca-2ae4-4a4c-8089-84dcea536846
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610993036;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=E1XPgSJ8gGCbu4gXXkffCoKjDCb0F8xnrYSZQGK5/oc=;
  b=iDc4WbBul4aMfpmAcqI2+yQ/kaSU0Za9m4lPBUx3ZkZ1qcJ0BC7YWSod
   65deM0yarJXEwuePLUZ6C1edbLi9Ol2KKYd/hnanshM+Yq/m2B8cHzQzU
   Bz5RZIrsnpe31wcSPQALro8nQ93mi/0V2SFACy7sJCZMsgNo7gmM0HYMc
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kI2Yp6nV90UWI2u77CNdD8U+VdmfGtcuN3rWvThK6Af7TQK1k7J84sLtGClYVtiUtOsnhZGDDR
 w1wwZsyzM86k0I9QGr9P+8vld1BqEhZChFRA+HnMSyH9O10C1X+Ad8dDQ59QkEgJkR+FWFVCVD
 MnDFo0NXGKzO5aw/rE/OOIS7B7T0I5c9PmwXDwwbW4aP6liQIF+SFv6l4uOrhaWxCFjvyNvIH4
 k/vwUz36i9ToCk88hkVM/V6mLZ2MCIQADMxTrUVf6ri5KI7TKgqwSlhqhtVFGuiIO0HGLtmRpo
 Ezw=
X-SBRS: 5.2
X-MesageID: 35695257
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35695257"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOYJUuPFkwKHZQl4+s96O+KhDYgIfMJc6wOI/arL3ojDbcD81fGK5UtgTE7yM99kLMzss9r5wqOM3wNtigtD3j4ltq4kJUdFKBk4nUGjw9s+mldNds+URfwOlBtkNJAd9kq2oxJCq3PnUgf/Neu9Noq2tYwjVPfYKqYR3vo9U+d7Sw9d1s0rayEOluhKcdrI8jBUbq3k2ilWqmoX7F3Z+sydzRrm8asHlnCeUIHVFtEA9XZn17nwQcht1mM1nJa6Wu/RBPgjkX9kA+pCXvvvH53fCcvOvYRjz3WSh3Yjv4DCTyg5/kGGf3+5tNLTtbP9YjdMbvkwiwidKZx7edzyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNRlMYdaOrMjPIU45F+XDenOJVwduBI6AM59Pjt1N8w=;
 b=LM/G2YaITWtLId+aoV5myK/3dYDkzDQx2YV8QO9dPSOKv0/UvJ18FE+E/wmkTUHcRBBZm6cBJloxIIJnMdrD1edCLAf/PhI9D/+E/6TJqR52ojyQ5QUSH0tEYz9JdeVYw1jmdq1vXO6L0yCMHGVo7lIRdKX6CnjswtrGVKkjOv6I5qf7MMxD750BhYOkP/d/R1LUSu0+EZ2RT52zsSXhZeoEAD+FRMy6iXIHEzGJt9jRuRckG9dAvjBx/1HgbQTGglXQimvdXqPcarOMUqMMISHzAen2GxCGrB/IUG4pMXd9ChXC7CiIbUuwNYVhNUnlz27uL/4XF7ZW8K+kF6USlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNRlMYdaOrMjPIU45F+XDenOJVwduBI6AM59Pjt1N8w=;
 b=MbvAyghyn/CcSFzoF5fdUth253nyQTWWPbL0SOtvY+mLSJh+PwB6x7KxxSlqQkinYuxvHklWF2npSjF5oofgwMsl0hD10o7eixYYOpfoxrfH8Dy6Q4Y7ETvbTSJd8F72K0vH3e0NAQGYmhrHTEnu6Sb/1b09N4/QQ+bYA85UwoQ=
Date: Mon, 18 Jan 2021 19:03:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] gdbsx: use right path for privcmd
Message-ID: <20210118180349.l52rbadmmfe4l6qm@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-8-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-8-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 655e5fe7-be50-4b1c-be14-08d8bbdb6a83
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5356F426110BD9C65A1685F08FA40@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoTwLd7kJVf4doCTgmIQhmlOY0OakQQuVJFWJywUnwhH3EnqmLo8zxw4NPMJgmaDxn0C0Ip/1AKDZCCTauwkFNHPLPF/5R1T4ZqiBQzU7mus442z0epvAeTeXgys4hQuMzgz7g0MkIEBM4Y5m1N+6VitC2IKLszyszTZs8w9YaV/CkbG49uBnA3GxoT5vGt3rL452Xp3CMQcpb03ssNMZ7MosjfeGFreaefTknXKjfr2TYmfjT1Nhi+X8LcU4Lx3zHrX4ZMCKqWiN8xbrid5XPgf2vPtVDvDpTQhp20H8f5M0ThL+rBZSoL+A3+DPv1DN7wVZ/6t2fWm/f9cZVyh07NHXLQkNd4Oo+a72lKH6kvipsDZdY9qlySHWJ9EyE+Jbl6IwaWeaIuW21xF8sj71A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(136003)(346002)(396003)(39860400002)(26005)(186003)(4326008)(9686003)(6486002)(6666004)(16526019)(66556008)(6916009)(66476007)(1076003)(2906002)(33716001)(8676002)(8936002)(54906003)(83380400001)(85182001)(5660300002)(86362001)(478600001)(956004)(6496006)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cXAvMXE3NWVlNkx2bUZsSGJ0TG0vMjBpcktIYlEwZjVrTm5ERWNkaS9lY2pH?=
 =?utf-8?B?SGlXYS9QTDlvcXJQRFEzU2F4a3RJeXUvNkxwWGJqMEVXZzhIaVlXd0FqU3l3?=
 =?utf-8?B?eXpudnEvOXZmODJWdUZDOHNiVUtCZU1uYlR0ZFg1bU9xQUhsaVhScXBLSkxa?=
 =?utf-8?B?MWpZc2tXdEpQVkJuS0p0L3NPMWg0bFhEV1NrYlRQdjFJaW9XUEJSaWN6TENI?=
 =?utf-8?B?anBmT3F3UmhWM3BTSS9DbG1PNkkyUHRWT3VtZFJnOXhIWlhjNGIvVU94U2U5?=
 =?utf-8?B?TmNhUnhaU0I1Um42c3VYeFNHWWRTcjNWRGpxOGZQMVAvK3lrdGQ4TExqRmZZ?=
 =?utf-8?B?MDk4SDZiM1c2Wkg1ZXdzbUx3b0pHNTBtdG5wTW9iZ0pUT0VRZ3N5VXNmaldj?=
 =?utf-8?B?WWF0YXZxZTloS0w1RTdVMFVoeTRqakNaMkRTWFJHd0RQZ29IYUZYUVBhMklh?=
 =?utf-8?B?TWZ5U01kbm83ZU1qcWx2WkVnaDhxZXhsZTg3YUNOSGViSkVRQmtPd1dFS3RK?=
 =?utf-8?B?UXRvd1hkemJVT29OeVJsZkVHRXUwVTZiR0FoQzVNZ3hHNy9HcHp0d3Q0d3pE?=
 =?utf-8?B?cFFLTG80SGpXL2ZncjdmWmROWG94Y3h6cFI4YjNYbG50L2xOMkE4eTFHQ2s0?=
 =?utf-8?B?KzhKVi9yWDdPbXpaRUtFS3hwUllDSTJrVGdYN3ZZSzdqT1p5TmNKaGQ5aG5B?=
 =?utf-8?B?TGl6NndlaTFHWWVhTTE0S2dJdDlTanpaUkFDcGp0aDZHZmJBSktSZldPYzJh?=
 =?utf-8?B?QnlSd2RKZ0RCdmg3V0xvcnc1NG1razNXVld5ZDl6dFp1NmpmSEtkSG1HRUg3?=
 =?utf-8?B?WTdhTFcxQjdJWWp2Sk1jZjFyS1JBa1pPNHA4STJ1cjZuMkN6M1QrcWlKeWNC?=
 =?utf-8?B?TWdEeVlOY1VBRlN6MWw5bVRmQ2tFMThNQXNSOUpKZVRNTHc5STFEa3JPR25U?=
 =?utf-8?B?QlF4bkZhayt4T3NITkRDVktkUDdiaTdiMVlUb0gvclBKeE9UVmJrc1V4cEwr?=
 =?utf-8?B?MEt1YlJrbm1Wdk8rV2ZzYXFQZCtkcXNxbkpZL1NyT3VjMVV0bG5ETWJDTWNB?=
 =?utf-8?B?S1Y2akVFQzhHRUUxUy9sMC8xQTVZL2xZZ1VwcDdqZUJRUHBPSUFEaGJ3a01h?=
 =?utf-8?B?MzdXZk5YUDh3c09qR1d5TGliakdEQ1VyZFBNU011dFdjRTJSaWI0YnIvMHEz?=
 =?utf-8?B?TVFObFN1MkJ2R1NrcnJaeUo1eDd3N0ZWR1A1dytPak9YRmhpUThKYzNoTkJB?=
 =?utf-8?B?YTlQZERGYzkvQk04VVZnRHZqVUkzTnlyTHZHR0p3TlJTZHkxSXVqanhSczVO?=
 =?utf-8?Q?8twmpiZitbMlWPtKq/IZdhQVDnvw57ncRV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 655e5fe7-be50-4b1c-be14-08d8bbdb6a83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:03:53.4505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0kl/r2gK2uajynxQgC8sNaPmkApy8I9f3YsQuMxpJi9u5PJRamce97F4OphAWl668zc4ewU7Gj/MbQir3e9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:28PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> On NetBSD the privcmd interface node is /kern/xen/privcmd
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/debugger/gdbsx/xg/xg_main.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
> index ce95648e7e..83a009c195 100644
> --- a/tools/debugger/gdbsx/xg/xg_main.c
> +++ b/tools/debugger/gdbsx/xg/xg_main.c
> @@ -130,11 +130,11 @@ xg_init()
>      int flags, saved_errno;
>  
>      XGTRC("E\n");
> -    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1) {
> -        if ((_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1) {
> -            perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd\n");
> -            return -1;
> -        }
> +    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1 &&
> +        (_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1 &&
> +	(_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {

Nit: hard tab instead of spaces.

> +        perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or /kern/xen/privcmd\n");

I would have split the line, so:

        perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or "
	       "/kern/xen/privcmd\n");

If you can resend with those fixed please add:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

