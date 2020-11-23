Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FE2C0344
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 11:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33710.64850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh95R-0004i7-1W; Mon, 23 Nov 2020 10:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33710.64850; Mon, 23 Nov 2020 10:28:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh95Q-0004hi-UE; Mon, 23 Nov 2020 10:28:44 +0000
Received: by outflank-mailman (input) for mailman id 33710;
 Mon, 23 Nov 2020 10:28:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kh95Q-0004hd-02
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 10:28:44 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0336085d-d0c2-4e49-945a-6030380555ee;
 Mon, 23 Nov 2020 10:28:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kh95Q-0004hd-02
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 10:28:44 +0000
X-Inumbo-ID: 0336085d-d0c2-4e49-945a-6030380555ee
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0336085d-d0c2-4e49-945a-6030380555ee;
	Mon, 23 Nov 2020 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606127322;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=JbFcyG1geXIbPfSiPoanX3UaC0NrUBzcTd5k+xwL+Jc=;
  b=PbgqbSC9Gjpgze46Iqg3t78MWTpfrH3d9RuxUX7Bf8uFsReM1ykOb4Dz
   vWacvEQO0JHQD/y16SDNUOMlorcIwfdWEc0ZMak+sC2Kg0Nv0Fv70G27z
   ZzVIWlUWtBCHmgSyl31DM5O9SyuTfqnBxAgr5BIitjgxVPeu2hgujrOUa
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1bRO8SMn5awFSZa2v6QL32ET6Q2hSNLaaaQojI3Z8n2HQPy1+E2JO8qtxlT0YcHIoS1Rle+H3H
 x3aMbeteU5UIRld8ky1VMyxRXqZ9r14Y0+bvjLcd7Z3S52FISkx/L7XIG19Yx2k3oy5RKq1E44
 EaqLEjR8GMJLBb5KFDxy0cIkpr5WjA8y9z6P1dZ+m89Y3eoFlKqRrKAG1pPNJHrUpVuzCpahsK
 zA8FiLmO87FVAAAQka8vL7BIb9Dy9LIO+yamSwXCFVF9l6LuNaND54rf14IH/sH2OAD7tx/Ui2
 uZc=
X-SBRS: None
X-MesageID: 31701223
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31701223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpiVSaRiGyZg21ibnRO0KSCIurVQM/clHyYxyuM89nNyeIrCwYA5ne/Vkg6lJ9M1s0q/DchPCgb19BzhRjerAclNmQc2j45wEmvHMecpS65lps9RBovFuWZI/y4mUox/oh0gMeYIy9dKl5YvzCUywz6NrbH8hk1XO9yyVWMzvfwGCyT7W7ZrhrUj0WPRZE+Ib0XGO3giKO24Z3JnqqleOqcGjCqUcuhoOoHzLFRpG6w1rcBVgzYOF7DOQeTlI9zjbcz0wK80zHzVOoPUgIzUfv2sGeKNskHovi5q1JWLrtFLf0WRZ20drKf0VoA1jbElBfo6cqitguwm6xOVoDwm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMyS7uxn/ezwxNaFplls4x7G6ok6YjvqFLqIhuFoSZ0=;
 b=cLaquo7TuvaRO9KJdOKnwk8V6l15TqjLdR5Hpe3/KkjgJNXf9mvdO8vEofIm1PndwwOLfWH+pUR7dzdZOkrhtWPmYinVGwGrkDlp4UdK4ZsmnI9NBHjEYs2rj5i5q9qxCY8Lk7zV869IcTzr1KcnfZC4gtqsFupM74UDR973P72CZ8evlheC3yUT05AN02ggl3AXsraFpEVn3/ugZ4GW+n7JBqKVQH6XvJL2/DPZ84eQyIOy8FVclSJh+RxjeM7OYUfbnD3DrhAD7u0dO1LwdFrG/RZ+qvCkEvpY22SRg3l7kB0dg1OFLR23Zap9plzCQflbiX/H4xZ/U32iv7Qlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMyS7uxn/ezwxNaFplls4x7G6ok6YjvqFLqIhuFoSZ0=;
 b=qfnIhiBZtLPGBXfYvrQ6zAkmyttl3h6Zas4SVoTh7qwYfD5UsAMepioB7o9C1LF5TFq8ejyYuvyllIC65NnlTf7QW4JY15li5C/OgmIYthOSt9hwT9mmxq8VOSKhKdFzcfjQe+oGXJmc5+LBX2Qz3j80yxm3wMsbR1MJRevjJFw=
Date: Mon, 23 Nov 2020 11:28:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 058/141] xen-blkfront: Fix fall-through warnings for Clang
Message-ID: <20201123102832.4f33hkwuaas4vs7m@Air-de-Roger>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <33057688012c34dd60315ad765ff63f070e98c0c.1605896059.git.gustavoars@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33057688012c34dd60315ad765ff63f070e98c0c.1605896059.git.gustavoars@kernel.org>
X-ClientProxiedBy: LO2P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26298a66-f6f2-4f2d-9a57-08d88f9a8996
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5542198ED6A174566F6C72B98FFC0@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dcI4qZkWGiVmqxcroJHhkO5UxXMu3vgvX8q6o3oT/oiYslGLgPWVUuJuLKbvqEBI14UXoXKt0mJslSvG6wlHl1NFtpcOPNbnA5sU2ZvUkm92yGvGiNr3xdOUCpfApac2QgVR2aKMku3dsPlLT/OeLboihv9HtHK12stqfdq1yJKNkUE6EQZ+ozB8oA/Jg+5XLYXm2MYrtZ68uSIb7fFKTNz9Gjs71nPKMXRy+2QLeOzexwCc1UPFbdmnBSEzEv6azd+PExaRyv9LRdiGpk9w3o9MUQtlHA9I54BxoIs3hA5Bnfko05DGSbish30ibNlzFui8brOh19pYP0JZGCMWNwtAn3n+NYxrzCro7RdCLg8ZqW1JMpo/Jo2FvaSYrU0K7YQhTntMR/sKYIsZf4oKmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(66476007)(66556008)(2906002)(1076003)(85182001)(54906003)(6486002)(9686003)(86362001)(33716001)(956004)(316002)(8676002)(83380400001)(4326008)(8936002)(66946007)(186003)(7416002)(6916009)(6666004)(966005)(16526019)(5660300002)(6496006)(26005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fdOccS6pzuN3DpyBkAd1oRENCi8q2xL81AvVXXkb6Xe9PqvOkYawaR6mS788hRZPOt08zzPfPL2Ze34HTMuUWqHiNntG3BgmXaXsUpXBbsC/w3q96YpuZ25wjxSHgmlcHoHSixLt/F1PQUuURJQt0jVGjtTqRmYiJ2etXg+W3pHgrUbM5E2+u3DdbwyxiaKk9+f2vTe80N6cV2n8TVVX3bT5XL4OgR69mUyHH0ly7HKJVnsHK8uOAOOojgVkiH0hBbJBOm0VjJsHUAUKCKVPUm6hnl9wrzoMpVig0V4cMr7K+Tgwldjkaz4LarFrVeXZJXaVcPLHTdxGp5PpWVuHBjA+jQmRlHQDeue9UGK5nHk3qPyIVcCPY0w9Rg5xcLLxcBbmMYuKo+8AvHnORp/kiMbhOzWW7gmz0AXRAPv+xO4r2dVRuMd/KqJd4Mb3yLr29Q1FJC+MeE/jcKKBuwzSDoIfTdD8rM1RbFmBlHQbEBHqwDQi45DRzZ7rzxPA2QenggNOvGBJXXP7GU91F2jyS7z/IURzY3aVoawTUxyMAZ22lROzqGJ/M13aTNDU2O0yCY5jkfGrVx5Bxv3ZNCySREpSQX6QUdFMAXaVvb46gW3Gazm1GVioYyrg11tIZj6HYyBGZIFel0OepC/smObiye3TsnCU1+6vy7UhmuQH7Y7N0m2fDZ7U2hwTEE7Rw8JwDRR5eeSaU6kHCLfspT+WZI0Bz7UH4EEymQ3RG8h0XhpdmdkFmTnp4YTDrzVCRrU/ZyJS6pQ/XAAAJ8gCcvE+ZSgpITJLnaj43b/afFwBJhC0d1X7gioL18ckzAj5nut/itGR1GeJ9hH6RyYWa6tRAreJGW1nkSJ/+Zw6NNqDEh5J+ELQoT6P4RZiwiMuanX/fdclF4w/DeEkC+2i+zFzPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26298a66-f6f2-4f2d-9a57-08d88f9a8996
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 10:28:37.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9+ul0BdrXUu6zD/tKMdHexwz+V6N4izkJGWirzuawsbwQq0hBThA+b5fm6gWXiwwi6DI0o5OcoEoHpazSyL+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Fri, Nov 20, 2020 at 12:32:58PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/block/xen-blkfront.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 48629d3433b4..34b028be78ab 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -2462,6 +2462,7 @@ static void blkback_changed(struct xenbus_device *dev,
>  			break;
>  		if (talk_to_blkback(dev, info))
>  			break;
> +		break;

I would have added a fallthrough like it's done below in
XenbusStateClosed.

Also, FWIW, I think clang's fallthrough warnings are a bit too verbose.
Falling through to a break like the case here shouldn't cause a
warning IMO, falling through to anything != break should indeed cause
those warnings to appear.

Thanks, Roger.

