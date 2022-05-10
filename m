Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF09521F94
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:46:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325821.548575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noS49-0005PY-4e; Tue, 10 May 2022 15:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325821.548575; Tue, 10 May 2022 15:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noS49-0005N9-1W; Tue, 10 May 2022 15:46:25 +0000
Received: by outflank-mailman (input) for mailman id 325821;
 Tue, 10 May 2022 15:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=To9D=VS=citrix.com=prvs=122921be6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1noS47-0005N3-BE
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:46:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55d8d60f-d078-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:46:21 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 11:46:18 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM4PR03MB6999.namprd03.prod.outlook.com (2603:10b6:8:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 15:46:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 15:46:16 +0000
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
X-Inumbo-ID: 55d8d60f-d078-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652197581;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mJUKc4eCFATDZw+aHSODAIcVRaZfKN9/cduWFGgo5+U=;
  b=haWRCMk8YopoRYpC7jg+fRJiM+9zY+d7NcFj/BKCRWWXPmkyKDOM2/EE
   caBsW1eehVfadh8i1Yef9Tut5Rx0uDUp9hjdaaJa8GRy3j2kpXkAR3UnJ
   y8H5LZ0komuce6g5I2eNnjr6Mwa0D3nyHLBNM/vEIF8ZhG9KECw/CDYIa
   4=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 71006968
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aLM9rK8Xu+oBSKS5RkSkDrUDvH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2ZJC2qOM/bZZGSmLdskPY6y8h8G7JPUztEyTVBt/iA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZDgbBoRZ5eSo+YEaz5mLC4iYupWo4aSdBBTseTLp6HHW13F5qw0SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHfuMuYIwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKmUA9gPL9cLb5UCIwV0y2aX3bubqa+fRY+ResGCa+
 2DZqjGR7hYycYb3JSC+2nelnOrGhy74cIMUCryj9/RujUGTx2ocExkfXx2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQN47sM47QxQ62
 1nPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMa5/HzrYd1iQjAJuuPC4awh9zxXDTvm
 TaDqXFkg61J1ZJWkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshQZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:Ax9eu6MzGWo22cBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="71006968"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhJfiUDyCWNMUQPWMwAkIndLqZT1FJzMYz9+5E9aT2tHQKmWUw9z4UHUY7S3qooCmkqPHNGyZ/jX9OMYFh+nvt0MYmXOZU+nuXPLP1tj5jz//YaCagHSfjmiLy4nIdzjvp0mT5UJR8rsYsR/vIjH31FVOD5b9rCkdZecNokNgRVX3MsM/TIF8kQGAdsPe1rXRNhi8cgKYqbARLadt6h4ED0bdMy+zjpFyX18VIwYB0iVEZKn23yOk0TOhajOmY2GVKsqUCkut5Aws0Fdv1ETWrY9QTG77i+ZmcE8THVYOdAz2NG3Xo4h8k4OS7SfOaQZc0ubg3gi4Yv9MePfTzCyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqdWI16gotw1b+24r2GL66eTxF9CTPtNeEtGucldqiY=;
 b=loSVK6mmm2B8MvF+obc7NGpz5+PTZdQPMByFrLxkKF/rQawDrEsuedYQ36KZfgtjZyqUg7lf37dWEpup65sQtE0yJMecfgYY/C14V3lyh9jhMAwFoJTNy4yvIN5LrByNWYE+wPcQm9xEeq/DkkqIk8VEHlsG/obJ3IRpSP0zwcNYbnCXFyATYWJkiTjtKP2QMdF0RyEgpXG6Ku9OqbIFZifZQ4Ui6bhmE1YtLmYTdXWIRHKBgSPTFcCnV0ajF0iYR6/LAvoLOd61P4By8PavT+QruJIW+n3pCHnCGigFdCvvkKl27lEiCAWpt7ixasBFzO0wNUqkEveesmLPzx5fbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqdWI16gotw1b+24r2GL66eTxF9CTPtNeEtGucldqiY=;
 b=iQPFreXw0v+HqWugBlifAN+9FxV+Rrnq8qLTtXom4cGJl8//45QgjVzlZKzNJo18Wgug23yVRhNfzh27z9N3GkVeQhkxzG68Im4qZC/h6MPIt02cBxNQFuuR9bPSRCTDyoiZ5BqH4ZEpR+3eMHSo/ZZhTdA/BdcBEH+bOCAs/AY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 May 2022 17:46:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] ns16550: reject IRQ above nr_irqs_gsi
Message-ID: <YnqIxGFrz9yWb5rV@Air-de-Roger>
References: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
 <4ed4e4c3-6b71-8299-69f4-7910583fd9cb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ed4e4c3-6b71-8299-69f4-7910583fd9cb@citrix.com>
X-ClientProxiedBy: LNXP265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ca03f7-ffbc-484d-2a6a-08da329c384c
X-MS-TrafficTypeDiagnostic: DM4PR03MB6999:EE_
X-Microsoft-Antispam-PRVS:
	<DM4PR03MB6999B8236E1AD5325FA93F9F8FC99@DM4PR03MB6999.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o9cWy9nsGFNlkCjt9q5ViN93LiNmtz5+bMOMhnXWqXksQH9KWkBhmzwBYW9oNpokOiho34a0zR7wbDHaYsIuVi+8KwlsOj6OYb6tEhBogU2YBqvgk/l3Q7DeL0ennZ4WV0x2S373t8gnVywyrXKkHjQc7eiy72VOjSGdJp1JgArSTkJgiNju+Xeo7fZZamcW5kPxc+/wrp2ya3AHPGSTNBNiKrQZ160/qL1G4azWQvzqY+hfLFRfqjcOfpj1nMk5ddkz6ODeYN9YA/VfkGJ12pssWhZGhSV30kxUy8aW+9IJgSUm3vLon5IGrpynXcnzz9VG+Rwo9Yys/z4vvdfn1p8m3v/GngazA63p9aX3+Ba6eWRepjNvLH0awT4Y7Hc4BsQqa98XMNQwpIjUjayECOxkWml0NSa/Vr0IMS8NruBnVZj7Zb5n07/xGLi8rZBbRsbVLFSlvFtUiKUC8wvQGlPihWAx9CCoA8x/zIpCCgPxIfWA1Euw3IgEXWOe6dwOWOGJpjgr72+ZXAauaq2stfoM2o8iLZz5mLG3wN8CwCMRxgPdR6e9//nKY7NfGuY3N3U/XsuSOILvxFehFDNBiD23MoiyCvpjb8Stg6k6K7KJFEtMGRWcXOXC1XMF1lCKt9Nxdr1LiIynbaIM20B0TA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(83380400001)(316002)(9686003)(6506007)(26005)(6512007)(186003)(110136005)(6486002)(54906003)(508600001)(85182001)(8676002)(2906002)(5660300002)(86362001)(4326008)(8936002)(66946007)(66556008)(66476007)(6666004)(66574015)(38100700002)(33716001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmtnNUp0SU55cUc5SUtzRExjNkN0ZUc1MG82eHhObnpHZTh5MnowWGZuMzVL?=
 =?utf-8?B?K1ZUV1MrS3h0SFVaUWJMR21mY0pCWnNzOS92bE1lNUI5SGR6ZCtVL3lHYlZN?=
 =?utf-8?B?OXlLeTV5NThhSDdsNmN1UG56QVpBcEw0SW56cDJTdEhaWmNwcEluSzZQWW5J?=
 =?utf-8?B?N2dGYnZnQVppT2VRSjRJaVVUcldPck5YUFNYRGgyVGc3Q2FxMFI0dWlmbFZk?=
 =?utf-8?B?Uk1TUE1weGZJR0R0YkEwWWxOTitXNnZzM2svT3VnTklSWWtzUm9PWXZvTG84?=
 =?utf-8?B?akthcXROK2Fjc0svSFQrZ0E0YWFqYTc3MVhUMkxNQzhkN1RnT2NjdmZPbmxr?=
 =?utf-8?B?Qms3QzQrMXdNbi92WHFPT05nT1NqbnVEaHE3akVIRDBXbTBicjRycHQvaUha?=
 =?utf-8?B?eEY0bllEZ1VIV3lZNkN1Vis4dlJCcWxqSTJkMlBabFdoUHZNSWZPYmtITVAr?=
 =?utf-8?B?OWhvbHVBdk4xMTZlYUpBdm1zZk5pL2pSaVZzYlhoeS85YkhTRmNHTEp4TUNa?=
 =?utf-8?B?clMxOWNyaEVhODZTeVBuaXRVME1DYUFmL0N4dzJxMWc2WHJnTmk0QWtsZ2hY?=
 =?utf-8?B?WkU3T3dEUlBxckUvL0lTMGt3UGxwc0drdFpYZzYrV3FQT1NuUTA3Y1dxWVZw?=
 =?utf-8?B?eldPNHhKY0p5MDZJUjBuOGt0MFJsVXFDS0IrUDI1OUVTek1vRTFEVnRucERI?=
 =?utf-8?B?MVdJTXo4R0tIdnYvZHRKVWxGMmVwc1c4UklTRU9PZlJCbkxXbGRua3F2bDlr?=
 =?utf-8?B?NmdvZ3JwcWFibWg4d2ljR3VXcjB5Q3RxRk1YZ0VNUmo0KzFVNDNYMmZMTVpt?=
 =?utf-8?B?bndsNGNub0E0VjBnMTRsNkdLbXI0TTY0TStZK200ZU90YlpqTG9mRzJUaXVO?=
 =?utf-8?B?L1I4d2FFMWpQRnVzNVF3NDRUZDZDWUFLUVVSK2J6QnkzTTVLSkpCdGxzc1ly?=
 =?utf-8?B?bnNDYk1RYjAvRjRsMjlHQjlyRTVIOXZlc1BXZEppNWtaS29McE4rekp5RXFx?=
 =?utf-8?B?NzlEM0NSWkI1aCtzOFJRcXpmUDRZR2F5d0FDb084OGVuZVozcVE2R0tURnND?=
 =?utf-8?B?enQvNjJOaXY0NW9JYm9vWm5uTmYzSG9VK3dRNGU0aFpIZFVIdEVGR09EVm14?=
 =?utf-8?B?ZVVWeTQ4Z2duYVZVMktRWFcvUE92MXMyd0RUVkxMbjVVck0rTDR4UEUrL1F0?=
 =?utf-8?B?Q0FTcTd1RlhsWkdJbDJBeFBUOGt3b3F3dUtjeFo4dDhTVDdHeTBpVWI0VDcx?=
 =?utf-8?B?R2E0OGZpNUtKenRxL0FFWGl1dHBvaWhMT3JMdkl4ano0VHVmRm1RNHhwNzlF?=
 =?utf-8?B?enlCU1VVbmFZc0pLVGdNa2JRT0xDOGNmLysrU0F3dUZScE5QZVhEQVJoSTA2?=
 =?utf-8?B?QlhnQSs1S0JYMXFnMmJIZFpYUnpYb2lITndQaVRBQWVMSUJLcEpmRWZFM2pI?=
 =?utf-8?B?d1RqeW1sRVlzNTl4RVM4NDJlRkJZYnBXOVBpNkE1OWpPYU80T09QLzNuMkx2?=
 =?utf-8?B?SzZMQ0xqRFAzVlV1VHpTRENYcXg5aWprV0VTblg3dVdUZVo4bWdIcXV0bHBW?=
 =?utf-8?B?blBqK3Ird1pjdDllU3FsZHpQVDFFcU81MW85SHpiZDlIclFRN2dXc3Vnb0Fl?=
 =?utf-8?B?Um01akx0ZW43eityOXFKRHNydlhlb1Y3YTdrenRHMEZFN2JkQm5iUWVaeG1m?=
 =?utf-8?B?UkhhY290Z0E5L3JubnBjWktGY2swcEZRTHJKY2Z0SDVRbytZNGFlR0VjQ043?=
 =?utf-8?B?STZjRG5heTIvVXAyMGU3YlhBcVVOc0tpQUJhNGN0dk9ZYVBEQ2hRdG1rOTRW?=
 =?utf-8?B?dGJGQ0h2ckw1N0dTSmw0WjNoUWFqaWdwTUVreDNXWjNkY25SOGMvSStuUUt5?=
 =?utf-8?B?WUdjMEY0YTlTTnk2NmNrZVFXZnRpbUZyMG5PNUdRYVVCVGxvR3pEMmx5bGQy?=
 =?utf-8?B?UmZIMHUrNHB4U09aY2MyWWJ2SXhlLzE3bmxXak05UWNSNFFYTzhlNzFEQ05V?=
 =?utf-8?B?R2VxSTZiazZkRWJnRnRYYWQ1MDQwUE01VlNTd3h4UFp6dFdtSUtXNysxL0Fm?=
 =?utf-8?B?Nnp0NjQ0Y0RuSStiY21kM0ZLYmo1OXZYbVhUZ1FpTDFyNEQxbnJ4TlYxbWhW?=
 =?utf-8?B?WnA0c3dmNkc1RTRMMG1tZHRyRVlrb2ZEbEJjQnBXc3JsSGxYU25jVHFDUmlQ?=
 =?utf-8?B?SDZaQWtIWHVBQU51RWUyN1BHVG5lZ0E2cVhhVklnVnFnOWZhektIcFYrZ0FN?=
 =?utf-8?B?MGZxQjFPK2dDY1AvRUxlVDFlWW1CVTBmMTBpTUFtQ1A0L1IrUEdCb05RUzRl?=
 =?utf-8?B?aUo2WEJ6WEk1anJnRmJHaHh1MDBvUFQzTVRMYy9GWVJxT0RxMzJ1aGNzRVJK?=
 =?utf-8?Q?N6s88EdCYPwzLWqY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ca03f7-ffbc-484d-2a6a-08da329c384c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 15:46:16.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goQ7MwV9oCAcmqJjnakM4JHt6g4EvNAZ6oHRRRJ+3GDm+6+KJArmmwe5KcVwiz33h4VCEBJkTBi3EhrcIqMttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6999

On Tue, May 10, 2022 at 02:30:41PM +0000, Andrew Cooper wrote:
> On 10/05/2022 12:55, Marek Marczykowski-Górecki wrote:
> > Intel LPSS has INTERRUPT_LINE set to 0xff by default, that can't
> > possibly work. While a proper IRQ configuration may be useful,
> > validating value retrieved from the hardware is still necessary. If it
> > fails, use the device in poll mode, instead of crashing down the line
> > (at smp_initr_init()). Currently it's
> > x86-specific, as the surrounding code is guarded with CONFIG_X86 anyway.
> >
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> This isn't invalid per say.  It explicitly means unknown/no connection
> and is used in practice to mean "never generate line interrupts, even
> when MSI is disabled".  It's part of PCI 3.0 if the internet is to be
> believed, but ISTR is mandatory for SRIOV devices where the use of line
> interrupts is prohibited by the spec.
> 
> Also, there are systems where nr_irq_gsi is greater than 0xff.
> 
> I'd recommend handling 0xff specially as "no legacy irq", and not
> involving nr_irq_gsi at all.

I've finally found the reference for it in (one) PCI specification.
It's in the PCI Local Bus Specification Revision 3.0 (from 2004) as a
footnote, so for the reference I'm going to paste it here:

Interrupt Line

The Interrupt Line register is an eight-bit register used to
communicate interrupt line routing information. The register is
read/write and must be implemented by any device (or device function)
that uses an interrupt pin. POST software will write the routing
information into this register as it initializes and configures the
system.  The value in this register tells which input of the system
interrupt controller(s) the device's interrupt pin is connected to.
The device itself does not use this value, rather it is used by device
drivers and operating systems. Device drivers and operating systems
can use this information to determine priority and vector information.
Values in this register are system architecture specific. [43]

[...]

[43] For x86 based PCs, the values in this register correspond to IRQ
numbers (0-15) of the standard dual 8259 configuration. The value 255
is defined as meaning "unknown" or "no connection" to the interrupt
controller. Values between 15 and 254 are reserved.

That note however is completely missed on the newer PCI Express
specifications.

Marek, can you please adjust the code as suggested by Andrew and add
the reference to the commit message?

Thanks, Roger.

