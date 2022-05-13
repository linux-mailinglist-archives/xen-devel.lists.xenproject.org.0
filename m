Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163D525C1E
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 09:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328262.551251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npPXh-0002TX-Nv; Fri, 13 May 2022 07:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328262.551251; Fri, 13 May 2022 07:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npPXh-0002QH-K6; Fri, 13 May 2022 07:16:53 +0000
Received: by outflank-mailman (input) for mailman id 328262;
 Fri, 13 May 2022 07:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npPXg-0002QB-7j
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 07:16:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a53f42db-d28c-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 09:16:46 +0200 (CEST)
Received: from mail-dm3nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 03:16:45 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3255.namprd03.prod.outlook.com (2603:10b6:910:52::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 07:16:42 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 07:16:42 +0000
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
X-Inumbo-ID: a53f42db-d28c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652426207;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HFBCv2S4qTFBxh/5Pr3a+8f1SLwkTrn1oEDpempuNMo=;
  b=heohL7ZsALNKXHI9CepJJnpll+yNl8lh9Op/YtAjwR/teNPST4OCCkiN
   weozarngpcrEtc7oNadt08hAt7EaZQZoYwT7p5q8j78Hfp8wyqTyRW2kX
   +ykjHObm9juF0Agu0S0IUbRE8QXyG0r7j7Yb9ydheoALcR3PNSlfcMMdo
   k=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 71242393
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/W1VEa37lqrFBLySSPbD5dBwkn2cJEfYwER7XKvMYLTBsI5bp2EDn
 GAbC2qOb/uMNzake9EgbN+28BsDsZLWnIRqSQNkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx2oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1TqYeqGFguYZfuo8YwDxJUFi5QFolZreqvzXiX6aR/zmXgWl60mbBCKRpzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82dBfmQjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SClL2cD+Qn9Sawf23X5xlYg6+PUbNvYJuC4S+MIwleku
 TeTl4j+KlRAXDCF8hKH+3SgnP7Sngv0XYsTEPuz8fsCqFia3GkaEhAVfVq9v/iii0S6Vs5fK
 kob4S4np+4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcOscY3QXkm0
 wSPltaxWjh36uXJEzSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa38716bnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:KZghRaNpXdS5VcBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71242393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV1FLqJuzDoYwJYNKC/5Pb1ADFGvHzLsvdTvi5I/aCsru8gOkf2R64qZyDa6KF/aXYcL3U+qg1mxd+uyKm+bcSFelZy5DPzKNg0TpuDHG26FXAma2J9IKvR9jSqmN+M/35J+9fx3/Benn3/c+PjmQKa3aBZ2SaAgfzJ1wN+AYlaiFNtzIUXGSY5zxthWYJo2V8GDxE09VHCvyi8XJhAWq9jn/iGSpVTWUYafrVeul8LAug/zk+o3ugF7M+jKHaO6Y0IBg8O8uy3otZECt9cl3WHWiN7Fq2CUODT37RST3GPPcQdfBoOmTaKgMeOKf++UWvMxD0GRGiLfLhm7j2Sw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf3/xI4Pt3/c5egEe6YQeYzCjH5jxWKoUrzg3RsDyd0=;
 b=VSXmucSNr7s6RFQKau88XtSM1iNPe6K2Xca8DfUExavAnDMojvha55pyEDyQTf5fxpgLgutZ6Jx8HUoAw469Hw0uk4m+YYDfwg0YvA7wF2gEjHX35FE74DirRJbi///2JccUafq9t/uLrLZGh82B5O5rOxfvDpb6UsoVz+/1PuVayZjJazYjQJ46mCenszpxlVJ/eBYjA1yNw5l3Dy3mIFkTJTDQqD634FEywHHzQgJ/enHnhjkIXJ+2qiNNj3nSLrTxze7FEw0W2pZ9yLhKR+9ZpKnjGOi25yFc886H/YsENLPO0TQxgZd1+y29jb7VvSw4gVxNpRloEZEAMhzz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf3/xI4Pt3/c5egEe6YQeYzCjH5jxWKoUrzg3RsDyd0=;
 b=WUOkYAmIrCjd33hdgSqMhFsYwyD6+6ISGxoZ38hvxNrLpGADh6ewTKa07EMk8Km6V0oYxi5+u1+bUqNyf97I0SG2e1pXbcX6ejmg9zZ6gwUZvHgpCMPFwBh850PWutLlR/s3s0Q+ULICCH3JlYOX7Nnlbp+ZXM2XPwr8mIlGHdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 May 2022 09:16:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkfront crash on xl block-detach of not fully attached
 device
Message-ID: <Yn4F1fNlMd66nerQ@Air-de-Roger>
References: <YnwNjgtWtKaVLIuu@mail-itl>
 <CAKf6xpt8TeRYkbG3p=trqWjsw86sahYV_NKVPxergjsu7orocQ@mail.gmail.com>
 <Yn0SzjiwMU32Xc0z@Air-de-Roger>
 <CAKf6xpt+7-YgmW4eiQRcZHk6GZz0dT+8=nb_hp_S_DYDg5MSmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpt+7-YgmW4eiQRcZHk6GZz0dT+8=nb_hp_S_DYDg5MSmg@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86bdfd31-a176-479b-fabd-08da34b087bc
X-MS-TrafficTypeDiagnostic: CY4PR03MB3255:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB325503AC73291437E52D5A138FCA9@CY4PR03MB3255.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SXbMh9Xeh7cm72CWQ2B5L+S0eMNMcNj4UMpuXp2emBukh8kfqhIXXMPKD/BW4REXUX9JIJAphvhPw52KbH5b/VZAf+IjArG2I6qjZkVOXHTXTHAALl06J9mom8oIAy9SrtN1rIgDVVsoJQMxg5uHGj0iE6a4fjTv1iDZ3JS+4A280C3xHI8PKjqVnLe+F+IivSdi3yB4+cu/9hCMwoBIhsXZuwcNTCDNoKlQL+Fx3T9vYHDJAfe182WDXvWSpBk4E2MDeBlzwtdofh19H/g5KKlhy5YQbJrKk2VUHab8Er5XlrGT6pxRN3Tsxgq48RTCB/OckfmIsSp9S23O/HJB4rNhRI+3cR6LQoEmIUvErj/LQKmEIvVc5TH7M/nXbsXeTMYiG1uZa/E/pGakgXw7w9YAAu3ehtgq3oUXYxvlYP9fkehEOInoMdoHWqhKcDOmQ3j+vpqN4W8gXos4X0f6dIdlAewLLlEzjFO+wahi+AFRk4qJ4b0x1Pz/YTnonCM5HO6PAB61p8iOdDOq0FBzcsFLMrEoqIv6QpxkMKr1+c4/ejWGR5/Tzaj3hXh8EQs66GkQlKfVqeIFDUmwEitHZRxvElzzKit8r2rmIaLc4JzREQenPiR3tPKmoFdqJ8/XYQqea/W+Wkroqj/Wtz7R+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(6666004)(186003)(6506007)(508600001)(5660300002)(66476007)(2906002)(4744005)(82960400001)(38100700002)(86362001)(85182001)(6916009)(66556008)(4326008)(8676002)(54906003)(33716001)(316002)(53546011)(66946007)(8936002)(26005)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lvVmhpckhQZm5FdVY2bTl4UmliSWtpNjdEL29MVHRxeHRuWUZmTG5sMzU4?=
 =?utf-8?B?eWdWb01sbEk2T2hiWENIc3k4eGdLSkZBN3EyTkhzSXlLQXRYcStWZ25Ed0Zx?=
 =?utf-8?B?M3ZlNURYRGlIL3VDdUQvOWhFalY0eU9KTjQ0RTREV1Z3UFoyckNmNGMwcGkw?=
 =?utf-8?B?NXNvTU9Qc1NRSFdSdHRmUzhaUWpWNUdtdmdFdGkxbmR1cmIvUk1STWs2VWds?=
 =?utf-8?B?dkV6MURwa1N0YXhWekNYQU51WnI5S3RpWHl5Rmc1MHE2aE5KY2xRc1h3T1kw?=
 =?utf-8?B?WXpvWDFTcmJMMXNib2JPZkVvcVF5R09TMTZxTXM4aUZzeUVDWGE4Y2hvS2tq?=
 =?utf-8?B?dkNuWjBUM0pnRXpNL3EyUVAzQzJMRTBEVHBqdVBxWmMxQit5QTVnYVQyRE1Z?=
 =?utf-8?B?Z2xjdzI3d2lsb0lYcE1ySy9JdStKNHUvenJXOFpXZm1QZnFuZERkSGIrMTkr?=
 =?utf-8?B?d05Gb0tmNXI4d0MzZnJmdHlBWmQrZmxTeU1sbmhjVUFVNzEzSGNRQ1BGNks2?=
 =?utf-8?B?RmdNQ1VSUk9PMjQxdjNqUlY0UTBMZjRKWHhJMW9FRW1QUEdwNDZQSkJKcnR1?=
 =?utf-8?B?aldERE5taGpxb0FYWUtyUjU5SXFra0VsZ293ODRuaWk3ekU0QnoyaUNpamVM?=
 =?utf-8?B?RGthbS9YQWh5OWc5SjJ0U1NMVkNzRXNMSTVZbkYzOUNRWERLZitwLy9QSTdW?=
 =?utf-8?B?UjJHR255M1JmRU5ydmZEMmloSUdJdjB0VE5tRFBoQjZVdjJnWkZQQkUzVFJl?=
 =?utf-8?B?WEhjM29qM0ZJWjJDUkRKaHJrTzBDb0NncENxbStLRjc4Sk1jQVMwUUVMQW8r?=
 =?utf-8?B?RCtiNXpiOW02citYMCs0Ym5oa3Y1RDRFWUpHOWZNZXN0MG5LdzRQWVFWYmJl?=
 =?utf-8?B?d1hpTlRjOGFnVS9lS1lVaDhsVkl2Z0xhVmw4aFdMNVFtVlVlQVFtUjlOYkV5?=
 =?utf-8?B?NTJWL0MxWGlzU1dNalEwOFZna2xsR2FDZmcza3BXelhMenFSZ0hvMEN4MTdu?=
 =?utf-8?B?VEVMUWFYeTAwaEVnMUl5dVBmZExnOVM2eUNUWUVlWkt1b294SFFmM3l1Z2ND?=
 =?utf-8?B?ekZ2U3RleWpCTHBsUFJtSFJUUzVDTHM5WEU0T29mUWNlNk84MTJ2WEI1VkJh?=
 =?utf-8?B?Y3JtOXN3OTJTeHowUC9sQ2p0VjJNa0ljamNQWXpmbUt6SVBUOE8yK09uSzJZ?=
 =?utf-8?B?Nno2eTE4ekwrSHc1MXQ4dG5XaUloYkhpcWd4OUVvTktNWVZiK04zajRJZU1W?=
 =?utf-8?B?TG1TS0xkOEszQXJSelF3aUlCblFrZXk3czVkR0xIVkNJT2h6MkYzVjdLdkZ6?=
 =?utf-8?B?V0toQlNKNFlDUjVyWmk2d1FjRk9xek0zMjJyZ2JFK2VaL0hncWRnVENxdjVQ?=
 =?utf-8?B?R0JhY3NSd3VqVURGSWY3V2czVTlSTmJBNEhIN1FFdXVEL0tneWNQZ25mZ2lu?=
 =?utf-8?B?NXpscEV0WXNIMzM3YnFYaDYwUXJCNWlsem9xZTJIc2g3Nnd6KzBmMG1lUVRD?=
 =?utf-8?B?aHFCaXRyQjVaUGNBWFpqQ0NOemtkWXNXbyt5SHRJYUNQbys1VzF6U3F5KzRr?=
 =?utf-8?B?bGs5ejB2OVhhRk1EYlNSRC9PZHpSS0cwR3JhTzJpTzQ2ZS9oc3RWaW5qU0xN?=
 =?utf-8?B?ZzFRbm5TVFdnM08yL2l0T0hwVHdHWE5LbThxK2dHY29BTnNTTk1Cd0RiM0Yw?=
 =?utf-8?B?Qm9HQUx2bmx1aUoyc0pUbk93ZEtuOTdXa1h4bWF2ZHFFTE9KSkdLYjJOc3Qx?=
 =?utf-8?B?Zk4wbGRnVnA3MkRSaDAvK2RaRkN1MG5CYXhBem14eW9KMFFWSFhiNFhkdkpn?=
 =?utf-8?B?ejd5YjFxRVNQL3ZGWDdORXE1eUE0SEdQVUx2Z3FzVVdzQ3FUUUxSc3h2M0Qr?=
 =?utf-8?B?QlB4R2NseVUvRzlncHd5QU1zY2hVU0hSZkpPVDA5UGxiT3VyeTVQNmwwYWxz?=
 =?utf-8?B?Mmc5TGlDWldKbFlmTE5oR3Q0bGlyN3g5TlZ2dWZmMDJENm5Cb0w3MmNhTXc0?=
 =?utf-8?B?SGtDUGZCK1FESzl5UFk5QTNwbmVYR05tYWFCOEt6SldOUWZSeXFySlE0MzB5?=
 =?utf-8?B?c0UvRy9iMzRBQjQzTmUzb1M1NnJYVDEzTFpobUZCY1pEcEQ0dHBBZjMralp4?=
 =?utf-8?B?Z1pXaWMxbFFZbHlQWTliMlMvZGJkcUZTb3Z1TXRMcHBKK3UvbkNZVDNIQWtv?=
 =?utf-8?B?YUN0cnRwSFJGd0ZKNUp4blBKS0pycFNYNHhaazVHZGFnNmZpQ3NreE5yRUd0?=
 =?utf-8?B?VjNGN2Z1L2ZTeURIQkNNSFNVTkV1RVU4eGJjM3R2d2Q3OER1aDQ0eGdCdlBa?=
 =?utf-8?B?NVd2b1dRc2tmNHYxbWZKTzJDSnlmTk5yVW1EOXh1am55MkVYbko3cnBUSTJQ?=
 =?utf-8?Q?8Hf8IaqiTloUylCA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bdfd31-a176-479b-fabd-08da34b087bc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 07:16:42.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yb38XC1oTOUGFclMBW1T8DXZ6fQJ4NO4I3H+SKKvVBieg5LuGvZiUMiXx8o56o0xDlmGOPRUpwI8QWM8qru08g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3255

On Thu, May 12, 2022 at 03:18:05PM -0400, Jason Andryuk wrote:
> On Thu, May 12, 2022 at 9:59 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > Care to send a patch? :)
> 
> I will, but because of $reasons, it won't be out until next week.

That's fine, I don't think we are on a rush :).

Thanks, Roger.

