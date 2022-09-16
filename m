Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EFD5BADD9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 15:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407980.650678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZB6I-0005tQ-F7; Fri, 16 Sep 2022 13:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407980.650678; Fri, 16 Sep 2022 13:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZB6I-0005qQ-BK; Fri, 16 Sep 2022 13:09:46 +0000
Received: by outflank-mailman (input) for mailman id 407980;
 Fri, 16 Sep 2022 13:09:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHCK=ZT=citrix.com=prvs=251a9f4e5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oZB6H-0005qK-9k
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 13:09:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d26d647a-35c0-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 15:09:42 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2022 09:09:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB5140.namprd03.prod.outlook.com (2603:10b6:408:7d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 13:09:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%4]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 13:09:24 +0000
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
X-Inumbo-ID: d26d647a-35c0-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663333782;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=JdlPdq19PNkXivfOlSMbxrfZ6weJ5GXQWe5ljGhsANo=;
  b=f/keCud/poxAr4tJsxECjgjqhodJLz77wibc9ooSZoCdCpRL0fZgPVZb
   22HDauMrGRAzL8tq+WwUX+tVIfiygrq+Ms2exeFkmRhFJFj+Xly091tl9
   PoF8AoVIox2VN0NNenh9yk3o6vL2RNtK8aqM9ng2BHiKoJW9B+7tStpxl
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 79830986
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J5xBfakSvRAl8F3RBB0A9ZLo5gypJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCz3TM/qIMTbxKIgnboy28E5S78ODyoUyQVNtrig8ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37a2s4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kLB7Q3/MBnGF1r9
 N8VFm9OVRbEpryPlefTpulE3qzPLeHNFaZG4zRK62GcCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvL9cLb4ECKpOB1+KLqP9fPPMSDWO1en1qCp
 3KA9GP8av0fHIPOmWHdoyLy7gPJtSjVWoUvCZCEzP1npFPQ5146GSZHWlTu9JFVjWb7AbqzM
 Xc84TgjsqMp80qDQdz0Xhn+q3mB1jYZUsBVGvc36ymMzLTV+AeTAmUYTj9HZ8civcVwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iIQ6jxaKRNAzFqew14TxAWupn
 WDMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgXpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:7gDpYq/5tqUg49Di05xuk+E9db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlGl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFfJccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiT7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri+knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYd099RrBmc8a+d
 RVfY/hDK48SyLaU5mZhBgl/DWUZAV+Iv/cKXJy+vB80FBt7QNEJgUjtY8id0w7heMAoql/lp
 v525tT5c9zp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.93,320,1654574400"; 
   d="scan'208";a="79830986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyU5sXPuAkB3mwgjHo+Pblv7kSUnR1tdiZSh4dEQB7eBKr+z3ExYVLTYLtO51ROxuoBEw+CZusgjEvWtWY5HvP7eUw1KyxJ4cLx9Nh5DQ2YN8tAZnllzYmcZu69cGhkem4gRa+5zjSgfB0Gme2ZdKzoaBb+EAjccwlLEaCZkPdPyIeNLIgqAawDe35FQUmQDdul5XeS4boLYJZM4U+q00s+Ccwn5ooKsDrtiuJaB4jPRAVvkK9iywco7Z4XyMosibjua3hDRrjvDUqA7M1oiUFdxokwmk2I2FNCW19Y/3OaRxdsKGvyQ6SJG5+HrlmK3bosxgmC60RUf0P48aZOM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODRnY/SE9sVqvYB79YIXmFVMbxNco6oSGy6y/lpmThQ=;
 b=fzKoJmj+9HVstdDC4mtIkcXRQFu26vfvMxBLJBpFjmozwnu7AjGQCuwv7FwNZKmKrrWTIOHLuVWtjaFEKMv/hMcss8UwWiFuQLsoOjKq/9f+YYrWDpGkEeq8GqtCjlevO0QRiC+1qcArM5v627iKFUvT5cA+4bBM926Ccij+zkdr+/Qp5EUo4ueJljiVW3v68FuA5DvDKxppgipzyef7o0Yec4T+y7/SMrlVpxpsjbDi2w+MG/uCl4w/DEwQPX0vF3vQeyQPwvtVyvc1+p4Pv1sQ6YTTQt0Pwu1+dRew8btpS/vfbJggmTM816dT2/urGu00lCPkPVld5aItcEMZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODRnY/SE9sVqvYB79YIXmFVMbxNco6oSGy6y/lpmThQ=;
 b=uVK6VMwcS5YduCX8zDLRebya7lBiUxGaEQsHTQKq+FFmWsGxwZ+ObE53vzCbiFKm4dqI7ecKf4w6j9h6cIO7ohmZms0JHWKZ7kUqdQRV3H1O1jc9gtFDejyjdv4TO9rCaPFu1Owwvmpmyk6IiQeCPTyXGzIyZqoAM6V+0aXwDYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Sep 2022 15:09:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Adam Szewczyk <szewcson@gmail.com>, marmarek@invisiblethingslab.com
Cc: xen-devel@lists.xenproject.org
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
Message-ID: <YyR1eUfbq9aVSVXV@Air-de-Roger>
References: <CAHsotTjE_n8XcCkVFTbynCYVw_LdM2oyiAAH2KCxh9MELxq-YA@mail.gmail.com>
 <YyRD4Zq9XSusFM9W@MacBook-Air-de-Roger.local>
 <CAHsotTibs204KVYsm5E0x7ogUzpZOdmV4g_6LyD8RSkLnfJ0UA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHsotTibs204KVYsm5E0x7ogUzpZOdmV4g_6LyD8RSkLnfJ0UA@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BN8PR03MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a4e8a3-65d5-4d35-909d-08da97e4ad2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s45yzYPFEjyeGkfMGJMBDdf4IBssfEeJ4knIoMza2L39v33b/Pn8sKR+c3Kh9hft6ZNabvLffaNUH6TIYW3hkZeRz/Xz+Q0/O/9TiZwBH79t/MBCRRPy6OP/UR1hfJEfp89f4MJt3V6uLuGiFFONQlgRNyij/+WJYKE8Ntbb5fsv1fjdd3vpQYEuYyQPgLndh6mK5jyQkhj/lODJ4qsbPZNGBDy7gf0ru0iUKLlQ+GCEQ62JabyMZAIoCYEaZYIOsnh6YTRAFINP2pYC8ZfOh1DGWHI70HVSdjom5WyEBhMrMOsuWg+eAmLXDrAno6ETUzoKpQVKtah/v2sIV9e5pfQIKHBJgQsDYopnfJn4WHhjbQ+S4nJSnXQ9JERwcdfDYAdDjYpgsQere89Q5p44H5CmLHMG7JYvojbo7zy6RBMoujoAXpYT40ATv8qIkTk+y/aarRDjreTeIxVrshkwQtmOca9ParTrv5HUVouWdi4IgC7rFZ9dEpULc5pqoS3ptvJ3wC+cLT6GRjf5vHD39fveOCtTcXkUGxkVGJOx9iPVGJ/JmiyKJYF3vb2ZJxj0Q6r6wrBs6IXUrpXr/pC2le/f7UOq/cqwZdEx2LJKu9XdaShTEOxsZC3LcZbppJIaVB+Y9+gVZpHzszwsNJhoy1+PpjuHOCzM1hxHqYCif8ruI5KrfEIm02/h/MPFH6GBa/qHydr0yxtlMOQcAYNPD8JOXmq/nqB1UCaGRrNPPzq4xft0khD+NQtfC/BOqNmq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8676002)(66476007)(66946007)(82960400001)(316002)(38100700002)(6666004)(966005)(66556008)(83380400001)(9686003)(33716001)(6512007)(6506007)(186003)(26005)(85182001)(478600001)(6486002)(86362001)(5660300002)(41300700001)(2906002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDg2Ni9WQTE0ejI5cDR1UVlGUDZuUXBIREpvbVBIY05iTDFhd1VZWGg5WjhL?=
 =?utf-8?B?VTVlRWFNcFZ4dlBUWnhqU20rL2toRFA5R253SklLOTNIckpQZ3JFcUF6RUQy?=
 =?utf-8?B?V1ljYUdOS2FNV1FuekVaa09OdnB5TnpLRGJsYVFNaUJQOVNkekYzcHlWbUVO?=
 =?utf-8?B?RnJudzJHYzNHeU9lYkRueVhxRHhlK05XUG5VckQ0dHpqWGJYczRHM1VHdlBr?=
 =?utf-8?B?TFNPWkdPNDIrYmxVUTNWQm5QVUxsNkRHM3dCQk9kMy83R3NNMVN3blBwdDdQ?=
 =?utf-8?B?TzJHeHV2U3phS1dyeEUyb2dkdFUzQ2dBU2FlU09OdklDem5wcEEvaHU2cTVj?=
 =?utf-8?B?SHFFOG5DTVFrWitJMUdrZmFoR09PMmMvRkNMb1VuRTI4MnlLVXFoek1lVkM2?=
 =?utf-8?B?RzlNS1dVUUFhSjFmVlpqNytJZyt6ZDRNZ2JjaVVCSi8xWEVUOExUcVJqSU1L?=
 =?utf-8?B?cTZVSU9VZTN3VktycDFOOFBKeGVTWWZWc3RTRDBSQTVaencyOTh3YVJoWmFx?=
 =?utf-8?B?WmxYNU5qSHJXMDZZWFNkRjc3cUJ3ZWRCaUExVG92d2dEOENpb05JNkJyMjdW?=
 =?utf-8?B?TFBLR2hJaGdLdG94M0Q4K3JRSENGYldRZXo1NjRHZm55Qm1UL0duUDB2TjJR?=
 =?utf-8?B?bnphNHFDd3FkL1hUUjYwYkg4bU5Eb000T2tsMVFpNTZ4bmlCU0lzZWRqcU9B?=
 =?utf-8?B?dkZSV3hFT2x1ZW9jbXJaTnpWRERBMkFkbElTVTdPV3lXM21sWTRzdzhiSC9X?=
 =?utf-8?B?anVxYmpoaE00NjVHK2JqQWhtMlRxZ0ZOdVJNRVpiM3NuWW0xMFRQU2dYaHdN?=
 =?utf-8?B?QmlWSmhqTFpQTnhLblhtTTlSK0F1bG1saDBXOHg1czRLZGdza2lVS3JITjBP?=
 =?utf-8?B?WEZpdnZEZWQxYjNyclBlLzJEaWtOTEsxanJtc1FHL3RVdnpOYkJkeHRlLzJJ?=
 =?utf-8?B?WHZOam52blpScU51bFpoaWtzbTArLzR0V3hMMUZxTzhneEJKcTAxTHdvTXdk?=
 =?utf-8?B?Y053a2dTdjVSTFp5SGdDU2pjTFJzRk8yRzRYcFlFVFRTNnNYcjUwR09wMytw?=
 =?utf-8?B?S29YbHBOQm9zUDh1SHNJZWJ5c2RUWnB4TkxxeERiUzlvTmdweWhGd0VmdUZR?=
 =?utf-8?B?T0lIKzFmTnNXeVhqUjUvRmU5Z0lKUHhEOXVyWXNKY2Y3MEdUWHBwL1VVdTYz?=
 =?utf-8?B?aFpJMlV1SW1MVHBUTE5mQWVpZ1lzcW9JS21Xa2piNFI1R0F5clMyZWFCc1hO?=
 =?utf-8?B?N3FYenIyS1dCUHNoRGVWaGNiZVVqY2ZYUURBdWJmTExBZGYzNDIwVERLdnlG?=
 =?utf-8?B?ZHVRM1h3cXFjYi8wemxXWmhjVXRSMUpyVFVETFFsWDBtS3hxb3BtTldydkRh?=
 =?utf-8?B?bGw0V1NGRjgwZjVlS09WT1R0alVJUXljcDFiVVgrZzhUeXFRTER6TlR4NUlr?=
 =?utf-8?B?d1drWnI0WklVNWFHRDNCY0FBdXFZcCs4c1NqTGd5bUxFNW1QRWc3V2ZwZUFy?=
 =?utf-8?B?WlpoYSttZXNhWU5vKzNwWUpMMVJ2VW81Uzg2a0pXSzhMdWZHSWVPeSt2YUVJ?=
 =?utf-8?B?bVhlSFdLN1QyekJHTmhVZEdubmdYSy9mTkY3WjhWVkVmemZsOHFxaEpCNU1X?=
 =?utf-8?B?a0pSZ1U5WGRaRHd3TmQ0UDlkd0V5MW5UblBrVTYra0duMFdaeGdIVzhUSjc0?=
 =?utf-8?B?TmJBdjhkdlhPOW9MSFdjRG4zMkVmd0xHOVd3UXVrV1lkSE9zeURhWExTUEIv?=
 =?utf-8?B?Q3NWN3lXRnl4d0F0eUw2WlpLdlY3TlNVU3dyS0pUOHVWd201eTBmd1BwVW9j?=
 =?utf-8?B?L0xnTmcwSDFUaEUvU1htQUY1QmlIN05tRTkxdjNyZStNVGF4bDhnZW5kc09q?=
 =?utf-8?B?dHoyRmwyLzk5cndJYlUvMEl0eS9PU2J3T1NSeUp1bDhPMVRZdFdvS1o5MFRa?=
 =?utf-8?B?Y01seEhWUzlDTlcwVlNsVW0vNzd6RFUzL1YzTmhQbmpWRC8wUWVNTHBaV05q?=
 =?utf-8?B?ZFlQZG5tLzFYUlJYRUZUU21jMFE3U3UzRTdBdlhwbGNCZnZtcjZ4S2VGNlZj?=
 =?utf-8?B?Qm5Mc0dUWEc2VW9JS21ONEZWUFcwQ2Q5amxWcTRWMW9QdUtvYklJMGRLWFR5?=
 =?utf-8?B?WXFnUFRoKzJneisySGFtVEJ4WTVvQXpBNmNUWW9CT3J1TnlYRjg2QTYvV1FG?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a4e8a3-65d5-4d35-909d-08da97e4ad2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 13:09:24.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcDpUymCadvu2FWBRrNqwJnDACGajvf7byElwEZdfigdCeM1X1OyovmoOBw5DHCK0fXsn/ZxB5lQ+CypcQZRSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140

Please keep xen-devel in Cc and avoid top-posting.

On Fri, Sep 16, 2022 at 02:35:17PM +0200, Adam Szewczyk wrote:
> After trying to configure previously disabled iwm0 interface first those
> errors appears:
> 
> > iwm0: fw chunk addr Ox404000 len 712 failed to load
> > iwm0: could not load firmware chunk 0 (error 35)
> > iwm0: failed to load init firmware
> >
> Then after second attempt or if config is set in /etc/hostname.iwm0  during
> boot system panic:
> 
> > panic: kernel diagnostic assertion "sc->task_refs.r_refs == 0" failed:
> > file "/usr/src/sys/dev/pci/if_iwm.c", line 10352
> > Stopped at db_enter+0x10: popq %rbp
> >        TID        PID        UID        PRFLAGS        PFLAGS
> > CPU        COMMAND
> > * 19554    71630            0                   0x3                    0
> >         0K               ifconfig
> > db_enter at db_enter+0x10
> > panic(ffffffff81f1e289) at panic 0xbf
> > assert(ffffffff81f8dd81,ffffffff81f8a6db, 2870,ffffffff81f39e88) at
> > assert+0x25
> > iwm_init(ffff800000211048) at iwm_init+0x2c4
> > iwm_ioctl(ffff800000211048, 80206910, ffff800014bc88c0) at iwm ioctl+0xf9
> > ifioctl(fffffd802900d8c0, 8020699dffff800014bc88c0,ffff800014b1f7a8) at
> > ifioctly+0x92b
> > soo_ioctl(fffffd8030f e0b40,80206990 ,ffff800014bc88c0,ffff800014b1f7a8)
> > at soo_ioctl+0x161
> > sys_ioctl(ffff800014b1f7a8,ffff800014bc8900,ffff800014bc8a20) at
> > sys_ioctl+0x2c
> > syscall(ffff800014bc8a90) at syscall+0x374
> > Xsyscal10 at Xsyscall+Ox128
> > end of kernel
> > end trace frame: Ox7f7fffc3330, count: 5
> > https://www.openbsd.org/ddb.html describes the minimum info required in
> > bug reports. Insufficient info makes it difficult to find and fix bugs.
> > ddb{0}>
> >
> 
> pcidump returns:
> 
> > Domain /dev/pci0:
> >  0:0:0: Intel 82441FX
> > 0x0000: Vendor ID: 8086, Product ID: 1237
> > 0x0004: Command: 0004, Status: 0000
> > 0x0008: Class: 06 Bridge, Subclass: 00 Host,
> > Interface: 00, Revision: 02
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR empty (00000000)
> > 0x0014: BAR empty (00000000)
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
> >  0:1:0: Intel 82371SB ISA
> > 0x0000: Vendor ID: 8086, Product ID: 7000
> > 0x0004: Command: 0004, Status: 0200
> > 0x0008: Class: 06 Bridge, Subclass: 01 ISA,
> > Interface: 00, Revision: 00
> > 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR empty (00000000)
> > 0x0014: BAR empty (00000000)
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
> >  0:1:1: Intel 82371SB IDE
> > 0x0000: Vendor ID: 8086, Product ID: 7010
> > 0x0004: Command: 0005, Status: 0280
> > 0x0008: Class: 01 Mass Storage, Subclass: 01 IDE,
> > Interface: 80, Revision: 00
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR empty (00000000)
> > 0x0014: BAR empty (00000000)
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR io addr: 0x0000c200/0x0010
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
> >  0:1:3: Intel 82371AB Power
> > 0x0000: Vendor ID: 8086, Product ID: 7113
> > 0x0004: Command: 0004, Status: 0280
> > 0x0008: Class: 06 Bridge, Subclass: 80 Miscellaneous,
> > Interface: 00, Revision: 03
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR empty (00000000)
> > 0x0014: BAR empty (00000000)
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 01 Line: 0a Min Gnt: 00 Max Lat: 00
> >  0:2:0: XenSource Platform Device
> > 0x0000: Vendor ID: 5853, Product ID: 0001
> > 0x0004: Command: 0007, Status: 0000
> > 0x0008: Class: ff (unknown), Subclass: 80 (unknown),
> > Interface: 00, Revision: 01
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR io addr: 0x0000c000/0x0100
> > 0x0014: BAR mem prefetchable 32bit addr: 0xf0000000/0x01000000
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 5853 Product ID: 0001
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 01 Line: 0b Min Gnt: 00 Max Lat: 00
> >  0:3:0: Bochs VGA
> > 0x0000: Vendor ID: 1234, Product ID: 1111
> > 0x0004: Command: 0007, Status: 0000
> > 0x0008: Class: 03 Display, Subclass: 00 VGA,
> > Interface: 00, Revision: 02
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR mem prefetchable 32bit addr: 0xf1000000/0x01000000
> > 0x0014: BAR empty (00000000)
> > 0x0018: BAR mem 32bit addr: 0xf2018000/0x00001000
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: f2000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
> >  0:4:0: Intel 82801DB USB
> > 0x0000: Vendor ID: 8086, Product ID: 24cd
> > 0x0004: Command: 0006, Status: 0000
> > 0x0008: Class: 0c Serial Bus, Subclass: 03 USB,
> > Interface: 20, Revision: 10
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR mem 32bit addr: 0xf2019000/0x00001000
> > 0x0014: BAR empty (00000000)
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 04 Line: 05 Min Gnt: 00 Max Lat: 00
> >  0:6:0: NEC xHCI
> > 0x0000: Vendor ID: 1033, Product ID: 0194
> > 0x0004: Command: 0006, Status: 0010
> > 0x0008: Class: 0c Serial Bus, Subclass: 03 USB,
> > Interface: 30, Revision: 03
> > 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR mem 64bit addr: 0x00000000f2010000/0x00004000
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000
> > 0x003c: Interrupt Pin: 01 Line: 0b Min Gnt: 00 Max Lat: 00
> > 0x0090: Capability 0x11: Extended Message Signalled Interrupts (MSI-X)
> > Enabled: no; table size 16 (BAR 0:12288)
> > 0x0070: Capability 0x05: Message Signalled Interrupts (MSI)
> > Enabled: yes
> >  0:7:0: Intel AC 9560
> > 0x0000: Vendor ID: 8086, Product ID: a370
> > 0x0004: Command: 0006, Status: 0010
> > 0x0008: Class: 02 Network, Subclass: 80 Miscellaneous,
> > Interface: 00, Revision: 10
> > 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,
> > Cache Line Size: 00
> > 0x0010: BAR mem 64bit addr: 0x00000000f2014000/0x00004000
> > 0x0018: BAR empty (00000000)
> > 0x001c: BAR empty (00000000)
> > 0x0020: BAR empty (00000000)
> > 0x0024: BAR empty (00000000)
> > 0x0028: Cardbus CIS: 00000000
> > 0x002c: Subsystem Vendor ID: 8086 Product ID: 0034
> > 0x0030: Expansion ROM Base Address: 00000000
> > 0x0038: 00000000

None of the BARs are at 0x404000 which seems to be where OpenBSD is
trying to load the firmware?

I would have to look at the code to figure out exactly what it is
trying to do here (and why it fails).

Can you also paste the output from `lspci -v`?

Just to compare with what is OpenBSD is reporting.

> > 0x003c: Interrupt Pin: 01 Line: 05 Min Gnt: 00 Max Lat: 00
> > 0x00c8: Capability 0x01: Power Management
> > State: D0
> > 0x00d0: Capability 0x05: Message Signalled Interrupts (MSI)
> > Enabled: no
> > 0x0040: Capability 0x10: PCI Express
> > Max Payload Size: 128 / 128 bytes
> > Max Read Request Size: 512 bytes
> >
> 
> As for realtek can You send me some guide for using xl console or some
> marks for xl dump to find those keys?

I'm not sure about QubesOS, but you have to execute:

# xl debug-keys 'Mi'
# xl dmesg

From the control domain.  I'm adding Marek because he can likely
provide guidance about how to execute those commands from the control
domain.

Regards, Roger.

