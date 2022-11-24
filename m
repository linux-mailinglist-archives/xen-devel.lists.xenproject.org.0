Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AFF6374A4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447824.704475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy854-000515-Ko; Thu, 24 Nov 2022 08:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447824.704475; Thu, 24 Nov 2022 08:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy854-0004yT-GP; Thu, 24 Nov 2022 08:59:38 +0000
Received: by outflank-mailman (input) for mailman id 447824;
 Thu, 24 Nov 2022 08:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTCw=3Y=citrix.com=prvs=3201a854c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oy852-0004yM-Dm
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 08:59:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fcf2ba5-6bd6-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 09:59:34 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 03:59:31 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5000.namprd03.prod.outlook.com (2603:10b6:a03:1ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Thu, 24 Nov
 2022 08:59:29 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 08:59:29 +0000
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
X-Inumbo-ID: 4fcf2ba5-6bd6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669280373;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aUAm85AP7F4TtH0SInje/cZasXEJJO5WCbO3yxakTSQ=;
  b=UTe3bv6yechVvRRqm5ThANqsu3ik4+kWeWPEkKHivKez3Bj93bCsWzMQ
   GR0TfJYWMVCbht42Cw6wmFQmALxNTzoFx2DyCLfA79COpPNFTjMf0Lli7
   V5s/6KEh3jm2NFytHsjbjZN8pW20JeB6sd+249j8aY92K6Pl+zw6g9vdJ
   k=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 88017872
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cY16OKomQzQ6iCthq19qPO9uSZZeBmL2ZBIvgKrLsJaIsI4StFCzt
 garIBmGM/7ZNjakc9lxPYzgp04D7MWEyNNjGQRkpSE2FixGoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzSVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADomYSKqjPiu+uuqFcBJq+9kCOe7LrpK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWPEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCNJKTeLoqaQCbFu7gV1LKz4zVkOHiuibumGFZNheJ
 UtL5X97xUQ13AnxJjXnZDW9qWSBtwQRWPJRFfM78wCHzqfI4wefCXMARzQHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIaqivXlFDe2x
 CqFxAA8mrESgMgjx6i9u1fdjFqEvYPVRwQ44gHWWGON7Q5jYoOhIYuy5jDmAe1oKY+YShyNu
 SYCks3HteQWV8jSzmqKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7ZRNGsYcfj1qNNvkX
IronPort-HdrOrdr: A9a23:2DtKlKoCz25dMZls1U7fndUaV5tLLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwruG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkLd+Qdrz0Wn5U6TgHPlr8C8bDUmC/BZjYYcVhfC8UIvsPx1za
 oOhguixtJqJCKFuB64y8nDVhlsmEbxiX0+kdQLh3gadYcFcrdeoaEW4UsQOpYdGyDR7pwhDY
 BVfYjhzccTVWnfQ2HSv2FpztDpdnMvHi2eSkxHgcCR2yg+pgEN82IogOgk2lsQ/pM0TJdJo8
 7eNL5zqb1IRsgKKYpgGeYoW6KMeyLwaCOJFFjXDUXsFakBNX6IgYXw+q8J6Oajf4FN5Icuma
 7GTEhTuQcJCg3T4PW1rd12Gy32MSaAtWyH8LAd23E5gMyxeFPTC1zDdLh0+PHQ5sn2AaXgKo
 SO0dxtcrvexFDVaPZ0Nj3FKudvwEYlIbwoU/YAKiazS5HwW/rXn92eVsrvD5zQNhthcl/DIx
 I4LUvOzYN7nw2WZkM=
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="88017872"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzugABqtD+ghIADzLz79sPn8IilRWo+sqFLxpwKlpzAQscIOnkeO+WQIKybih6hfibuLH/gOfcyDy93oChbbV8D2TZzuX+UYbw4umMtU/1D+F4VC8GLLRHI8Y+xoFHj74UqhR4JCK51ROx1ICNxSeohDuFwCoAduHtQVoKDANwwddW3ku+f/Jab3CLxvgjr3jhLAs1s3FVGA6LfpSI0LBQ5IoZ403VUdlr0SGpoGFAQCPSMYtKDiD38g6XyXH3BNHX461/k2x+mmk8j6Q0rgB+h+VFU352sfEvSIwOHeLySaMz+PdQ9KqLJ2sLhk0xm04IMhUIlwjpo27Mihaec9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7qlRv8DTdiiXdS1F4gRPtTOOlq5vl/LzIYkg3Wwdfg=;
 b=H+whRUY381YaKY381r9wP+qJ7nEXh/lJWD0Tbf2ryqOc79GHekqAxBkBWvQofJjbi94cKA8F+sAacIAlHw8q81WtmHCPe5eZQeZhxrYVdldH8f+5TFHq4sgyz801srV8NxCjksCRDjm60SJIOi5TNrq/wTqO5sogI7ClAykPcFs1Hja7ZXMB0FEZeN7jA6F+l8bwCT/Psl15uxZafQrZMtpmA6C3YyHnvaJEB8z8ccIsDa6/LGgDPfnkUPQ3rd5Wr/rBattr3Vem8+80vAJOaWqU+qih/KAzvW6ViQTlKqsdHF7Dr0pS/Sx1HzSCtc+Ya/jnb1CxMlNTYcXpdcm68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7qlRv8DTdiiXdS1F4gRPtTOOlq5vl/LzIYkg3Wwdfg=;
 b=fP9JZlVQqGYp72aYyjMJzEZwOEsBWnGXBrYKBLsXZKjEWjTv2XBz0gbEkDxFB+cO/I+51bifB8ESfMdu8QcPxoC1UWj+LL2Kllg55Kfmo+euTSHZ6Hq3KPcmDMgX5EHzXGEAneu5mS3cidlBthFt4fTTbkJsedACNFGG1255XzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Nov 2022 09:59:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc
Message-ID: <Y38ybQwCk9drdgxw@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <Y37940yMRg2iX3IN@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y37940yMRg2iX3IN@mail-itl>
X-ClientProxiedBy: BN9PR03CA0849.namprd03.prod.outlook.com
 (2603:10b6:408:13d::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f74047c-a230-4de8-da23-08dacdfa31fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oQ3zYnA0BEpkHzjn6+FGqyDTFj8bCS4GWyhxWuKuxUtaONvOewj/S2D8DVanzGifkC3GZ+NSleKzauZ8RjXqK9BSR+uJaKW1rKd904/wJtKianSPtdABwz9mDdyq57h/9U9KtONU+vUieYIBP181ulgycHzvOch/brj0JiEoATxg3G/NQIs6UcCWp69L18mlkKV8TBnHtazVGFVeUdlM7MZmoVsAmjogXVAkmO2GWUP5R+QraqivfHkSCvIRgUaCd8otuW+w40fIifbcUVzfcGPeomqnkFrcUKElD2UhZS7gIokWMy8Qo+Z/Xi4G4+BpMGuvz+0e8rH8LfP6JLM9cnA3SCfWks0TFKLBIBolyO0dDfvn7TqRNcaoU4mps5zsVIcfc1wPKBg11fkmHJlq1G1xKHU6qVrwSn0YduTuHhRLXxgxqsZH6qIAPKFEL+87zgJG8RqA0JuMLoRjHvEalvBxvQDIx67P+lDXflSRYYpUbA2hRk43Qpe3zppf2NOg3lZcbKVG4qC/uxl86aHM1JzNJplEKKUWB8ufPxkRAPawR2UlbsqsLHsTG+ow3jKCNp1+m+MDSR/tEIcGf1316oV4/hBaXkbF/+dT2AC+NO9kf/Oe3wEPiIFW1QBlPwFBjVxMC2xKn1HPc4QqMzHb4uv/Fh2uP8h9fFKA3HleeXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(346002)(396003)(39850400004)(136003)(366004)(451199015)(6666004)(38100700002)(9686003)(82960400001)(26005)(6512007)(478600001)(85182001)(6486002)(6506007)(316002)(966005)(86362001)(66556008)(5660300002)(66946007)(8676002)(4326008)(66476007)(41300700001)(33716001)(6916009)(54906003)(8936002)(2906002)(186003)(83380400001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SS9FS0FodHdLUnJoNkc3NTZGVXAyT0NWZG1QbUl3R25GWWZjUUFld1RsNG1p?=
 =?utf-8?B?SStob1gvNHQya1RWZHBqanBJL2ZUMXhBK25iVFQ0VHBoNGh5SWMzbFduT1Fy?=
 =?utf-8?B?cTN1aWU0dks0Z1lienRXMC9jZEphT2JSeWVyU3V0eFJYU2V0VWhpZlBuSWND?=
 =?utf-8?B?Q0FWS1RlMDhQUzEyb2V6ZnVuMGZodFhLS2FGWjhUd3prcjI2aXVpVUx5OFdo?=
 =?utf-8?B?OVUwOHBuNzNHM3pKQThIZmx1SzNubytmaWhqMEJ1dWRlVnlhNEEvRXNzWUVD?=
 =?utf-8?B?Q25oTldmM0FBOXNMKzJuc01oQkFtUFJTWXpHNFlrQ3UzeTdEY1lmZVJtQnZp?=
 =?utf-8?B?S3dSaE5rNjBRdVFMWW1KQkZKa2J6eDRlQUErUmxtUFVTR3pvTEhaNXlJY3h1?=
 =?utf-8?B?OWppRWI1T0JBb21uUmsvZjRueVFIL1BPaTdSbzZvenQ5U1BDTGpCdWt2YnJm?=
 =?utf-8?B?blRGdlRhWWg0dmp5UjJ6Y0RwUUJvRVQrNTg4VEpHWW81UWdlMTJTZzdpZmIz?=
 =?utf-8?B?SXZKRWx4bGJBdGo2Sm1UbHdWTDVQTVNmMC8ydXJWL2kwYlJZRHlIbnhGa2k3?=
 =?utf-8?B?Y1pTN0ZFT2svMU9GNE1aeFVpc29CeFcyc2gzWm1nSFhVb0FTcnB5bFlBQi8r?=
 =?utf-8?B?Z2JVd0VyN1UwL1VXdjlGNXZwVU9mb0pySjllaEdJYXNWc1JrYjhCcWx4ZCt3?=
 =?utf-8?B?T3p1SkRVa1VYWFhuNnpSM0VRSXpEaktmVW9aT2NoOGtsempkbEtoZnI3NENG?=
 =?utf-8?B?MTA2U0paRldXMnRORVVRcVc1QStWbnl4TzQrb3ZEbkJTQXlWaWhiZXB4NUJ0?=
 =?utf-8?B?bmdJTW1wYlZZeEJveUNFbVhoRkV2Y05LVDVYM0Rrd1NxYUFGV3B3TVlYaXpX?=
 =?utf-8?B?eHcrbWZtNVk3RStqRDZEZllpRFB4TFVVV1cza0hZZ3ptOTdOa2FiOCtINTh0?=
 =?utf-8?B?RzErTUNXb3k0NE12aFVMZllsdFVOZDFUamtsMTBjK3VDSjlJMTRYeGJYakhI?=
 =?utf-8?B?c1d4T2czeUxMUXd0Z3J0REliY1F2a0ZJMDZvWFJ0Q05LTERpWGxxdzMzY0cz?=
 =?utf-8?B?disxSkFpby94U1g3S1JidndxLzRLSEw5aXdSbGNYYi83SjlMcDRNRDJ6Wm5Z?=
 =?utf-8?B?VGErZDhVWTlJWjRyQ1VFYlBzU0hNbWxMNTM0M0hKbWJMU3hxRytyTGxWYU1X?=
 =?utf-8?B?SkV3dktBbHNLK3RPUXdmd3FLcEpkZlM3WGtQU2cxckFWanB0aW5SRWMzRE1x?=
 =?utf-8?B?REV3cnZONHdVOTVkYUpLY2RRZndEUGNjdDVCL1F5Y1hkakxoZll6Z2pOYzhn?=
 =?utf-8?B?NTB6UTNVUVVDZDdNRUpWdzBQNG40WkFDZ29ncTJUeEwvTVhxdGdtRFlRVWVv?=
 =?utf-8?B?UFdRb29WNUZ2WlMrQ3VWY09BcXBYdmdhRHcrVWthRlh1dWZhNzFRdGJKcGJW?=
 =?utf-8?B?STVrM3R1SFBBUVJwa2krdUV6UHJmNis5YlRiWlg5aFo4WFpWMElOdE9OZkJk?=
 =?utf-8?B?SXVtTTI1anNhanZkU1RDbmF0bFlKWFdQTkQ4dVJPVzNwNHBWMWFLb3pHaVJX?=
 =?utf-8?B?T3U2aFVZY2lFU0NIbkYzbExNdzE2czNHcCsyc2w5bjJDcm55b3RQdVUvaHdZ?=
 =?utf-8?B?bzZxVFpSQkdaa0NuQmh0bU5RY3I4bnRzS2JKZE5kTG9MMHM0SUU1cXBKZkdl?=
 =?utf-8?B?d0tNekRFcG04TnpWbC91NlR4Mmw5K2djSGdWRlB6UlFNSlVEblFxTnpaRGMv?=
 =?utf-8?B?Nis3WnM4dy8rUW40N0c2dzcrc0JNTjRMc3doMkxxSnpxVGIrb2J2Skc3UEgz?=
 =?utf-8?B?dTQwYWxHUDZtWlVhZVAxWXhwWUh5Y0QwMjN4NXQ3WVo1VHE3eEJWWmkxUjdr?=
 =?utf-8?B?cWdmdzBOdkRlTkZjV3BZQkNha1c4MDJYV0FsaDdkN2JRTnhjNjloZXJpSDhx?=
 =?utf-8?B?UWVyekFoOEw4MGd4ZVA1dHRyOTRCd3I2WlpRS2xZTmNPYmRxcFNKWjVOOUc1?=
 =?utf-8?B?dU5MM3ROdUVlM25XYkU0U0wzaThIZHJ1c3FiSlowWHVReWcyUXQwU2dqUmxs?=
 =?utf-8?B?cjhRd2JSMlhoaFQ5Wmdya3pxQ1cxcjBrYWZ5TFdDUU4vRDZoMTh5QzJnb2dr?=
 =?utf-8?B?QW50TTRiY3F2ZzdaYUdNQzREUjEvRXJnN2tHUjJpeFJ0MEE1ZmNCdGdFYXYv?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?OTdqYnJvaHRjVXRDLytaNkdrbW02bUJBTXBSbjZMUW9OeGlCZjZ6aStqdzk1?=
 =?utf-8?B?WHhXSit4bEsvc2lVM1ZIQk4zZXlsSzUwR29KWVVodnRFMlVnZGlMOWh0K1dx?=
 =?utf-8?B?ODlhVTZNVXJ3ZzYxSlUrd05ydGF6cWhSRzZPd0t6ZXErZG1kWFFTWE1lcTRi?=
 =?utf-8?B?UHl4Z3ZjSTVGSUtETWRUZzQzckRUdUVqcDMvOFVvVStBYnp3NnNONjlRd0Fh?=
 =?utf-8?B?Y2I3cmxVemh1eDZVNDVMWE9sSnpoUmNtUFN1TndZV1Q4VndwQXRYKzlpTGN5?=
 =?utf-8?B?TGkxRDhlWmhHbnVyU0pOakFNOTQwcGNWUXltVDRBdXUyYUYrbUYrODJSODl6?=
 =?utf-8?B?TUNVK2I2M1BJRklYc1lCR2ZxTUNBNWRRZVVIbXJXbDZiRjB4VFJ2WjRGK2hl?=
 =?utf-8?B?SDVudGsraWpsTW03a2RsRDdQYWNaZWZGODVWajNlT1FtSVNSdUdsczMyZlNp?=
 =?utf-8?B?Ymx6Z0tIb1gxZEdxSjgrd1NoaXBjc2UxQkFyR3VpY3EvRTZSR3JNbWhIcEJ3?=
 =?utf-8?B?SGk3a3lyanF0ZmFkYlF5VzJKSEE3Ky9ZdTVMeXdOUk00aGQ2a0hkenIybVFB?=
 =?utf-8?B?dVJCblU0OFh4ZjloLzB0a0pFZmNPenNUV0sxeENJbFRQcURWMnZaN0FTSzFt?=
 =?utf-8?B?YklKZlpNVlRieVNUYU9yRDRzbzhQenpGaldrR21BUWRucHRHL0dSWGg4ZjRS?=
 =?utf-8?B?NCtMOVVXNExEZThrMWlQeDVHeW1NN2hMaStzQUVSVkltdFJZQUs3VXVzMDFW?=
 =?utf-8?B?Z2N6Zm8ySUhua1F5TXcrOWZZbmw2MXBsQ3FLOU13RUZ3clQzdmdZbFhHQmw0?=
 =?utf-8?B?cjF5N2RvYkNUaklseDhKcG5jZW1yeEZTV3gvcXhWWW0ya2FEbGMrV2FXZ0ZE?=
 =?utf-8?B?RjNoV3Z4SjRnNGlDWE11TTQwNUxwYTJnMUg4K3Z4aGtsTWdJM2ZXb2pZVWJw?=
 =?utf-8?B?disvLzM4dUhZSk14SlhSQ3BHRXNOdmg5M0dXZnFQbFg0TUdkSVNaZDluWitY?=
 =?utf-8?B?VGJpTC8ydmhFcjV4K3EzVlZoWURNcmVrZVBPVEd1VDFkenF4cGN0WjdtK0hm?=
 =?utf-8?B?SnlpaGJsRVkzSDg3UHZ0MXZHVm9IM0FZZGhNY3JoTWRWS2d0Rk9ESkxHS1dP?=
 =?utf-8?B?SjBkVmhDYnNIMmJtdWNIUXo5dFgzanh3UmN6VWFLOUordXd0cTdwYm5ZZkkx?=
 =?utf-8?B?dG9WeWZXcDNmbjNGL0xxVGFvTUlSUW1jYUV1WFRFM0VudEpPUTV5YWJCbWJr?=
 =?utf-8?Q?JY3ti4OzKFwovjh?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f74047c-a230-4de8-da23-08dacdfa31fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 08:59:29.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz1c0vGOmX15+dnEfZdnNXonMgBKeAfX6WM0tPyWWUqUt5mPz0H85KFopx2Walmw0EH0dpHgbmJpk7vmUPtytA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000

On Thu, Nov 24, 2022 at 06:15:15AM +0100, Marek Marczykowski-Górecki wrote:
> On Wed, Nov 23, 2022 at 04:45:19PM +0100, Roger Pau Monne wrote:
> > Marek: after this series using console= without the vga option should
> > result in Xen not attempting to touch the selected GOP mode and the
> > screen not getting cleared.
> 
> Thanks, this seems to work mostly fine.
> There is one message printed from setup_efi_pci(): ... ROM ... bytes at ...
> I'm not sure what to do about this one (although for Qubes, I can simply
> patch it out ;) ).

Hm, I'm unsure.  As a starter they could be gated to debug hypervisor only
builds.  And then I'm unsure whether this information couldn't be
printed later when the console option has been parsed, instead of
printing it from the EFI console interface.

> But to get dom0 display image from BGRT, it seems something else is
> needed too. Linux complains "Incorrect checksum in table [BGRT]". The
> only relevant google result I get is this: https://support.citrix.com/article/CTX460227/citrix-hypervisor-acpi-warning-incorrect-checksum-in-table-bgrt
> It blames firmware. But then, it's suspicious that it's also about Xen.
> And also, native Linux on the same hw does not complain about the
> checksum. So, I think it's rather Xen to blame...
> The table lives in area marked as EfiACPIReclaimMemory in memory map, so
> I think it shouldn't be clobbered by Xen, at least in theory. I'll look
> into it later. It's getting off-topic for this thread anyway.

See commit 89238ef7797023f318f82f4f9dddef59c435b8bd.  I wonder whether
the BGRT image region is marked as EFI_MEMORY_RUNTIME, I will have to
check on my system.

Thanks, Roger.

