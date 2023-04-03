Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE96D4C1B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 17:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517522.802972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMH4-0000Fa-Ey; Mon, 03 Apr 2023 15:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517522.802972; Mon, 03 Apr 2023 15:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMH4-0000CY-Bq; Mon, 03 Apr 2023 15:39:14 +0000
Received: by outflank-mailman (input) for mailman id 517522;
 Mon, 03 Apr 2023 15:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjMH2-0000CO-R4
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 15:39:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaac4a50-d235-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 17:39:07 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 11:39:05 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6451.namprd03.prod.outlook.com (2603:10b6:806:1c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 15:39:02 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 15:39:02 +0000
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
X-Inumbo-ID: aaac4a50-d235-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680536348;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TJSScj+YE23rouMUnkriZyhGcby3yNfMK2DU1gUCJ1g=;
  b=cNZzINFWJkz1LDra47OnhGPEfaRBOHUINB8+XwMNoebaR7G8GjdVp8fd
   1EzwppEFGVxHXrq1cJIfLjtBN2qp6oP0AcvxFG+uFfzzmLy2Ac4AIZjAM
   87HobsU5AjqSwyXwPrSyqKfQrU8LIrs/M78vqiyt5n0kA/afrknfJ4LXr
   8=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 104555290
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NiGY1qqicGihICXy111aXZKb5DBeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmAOv6Ja2WmKtpzPdi+808A7MTTztJmQQY5+y5nECgS9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyJNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACADdhmBid+p+ZGcdNB83e8FF+fIDapK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWIEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpOSeDlrK8y6LGV7koPD0YwdUaCneGWpnLufcJ8A
 X0X3QN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zop9g1hxeWF9J7Svfq05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:BLE14KEdxIFUGe1gpLqEKMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT4FOTOfeIHI/p/zciTPId+rJwrO8gd2VbTG19QYQceloAZsQkDuQEmygYypLrJEtP+tDKH
 KbjPA3wQZJKRwsH72G7mBuZZm6m+H2
X-IronPort-AV: E=Sophos;i="5.98,315,1673931600"; 
   d="scan'208";a="104555290"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q49pNWpv+VT7Gzrwq5lev7rcI8DZXndkMrhV0q0sNM5Ij4ygMI8avG3L0O1E1kg1gTBdt/rwJH1r6crwDZTKnE7pwgYdQp0d0XGL4Sk6VPhy4UK8chnoYZ2OaIKiFzxKRprL1k5N70ojrtGzXca22zKXhLCExVpWOgyJzWleQGhSMdUn2v3Vu6b8c6bdbU4vliIL3TXDFUV5oSv30JvafqJwNczCLp4YKo4Ul9u0pAgMwbHN7rLZXJjuYkL7sHBH/BglfZFcqBxTYxPeaNoXsBNrqoXeQRM+nv79k2LSqxTtulUM18A/EeVPPm/42zL3vYGfCRD/QSeXfQqy/1dl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMoA0HbVGxqEhBwVsdwSPwO02be0FeKEZK3UFGRXJsY=;
 b=HYrrU+6IzxuzIphui2P1kCAl+onAl9SOhBStcOLrVBHwkKOMqSCa3ayHfaj4SMn4Tt5gENsWNtfolTzvsv5jCfMsiWuGcuHz4ZSAHjCWrzeouFI3hE+viLYbu+c/nQ9vtUgz7J3lcKyUvNocabAvm2l/B6eHzXVZ/so+tZOUBvJrW8klkPRBMJneLEXEvYYCB0jp5ISymrdSJ0n91PYcKABGS6LxnN+p8buzz8Jc9bvxYHpabq8F2sb6Y/2OCfUYljCcZ+bUmB5PZMnOp7fSnfViWe80+OgOCzdUjPFoerMhOxD0J6H1NsUS1fG+JtJu3owOV++MB8FJrlWd+tkLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMoA0HbVGxqEhBwVsdwSPwO02be0FeKEZK3UFGRXJsY=;
 b=PPzhaNi2uYgHAusErCqvkdUVvut4o16rIuj+fTyVyS05Kgznm8N3h1842V92kS31tEeeey0rLAwN0rmEzg+yev4onwyLmA0yk/HwUSi1+fEttbBy1QrRHgoDGe9+TNw07+bMQzjJUGUb8y2Jy4jW4/i2i54NZDJjIFbemjRh17A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 17:38:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Message-ID: <ZCrzD7tH5WXARIvF@Air-de-Roger>
References: <20230403101449.93323-1-roger.pau@citrix.com>
 <0adcb388-d2a9-e43e-ec20-de1df51f33d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0adcb388-d2a9-e43e-ec20-de1df51f33d7@suse.com>
X-ClientProxiedBy: LO4P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 950c5119-e7c4-4b50-8036-08db34598c81
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4jv7sqOmRVFOn+PMG1efJRVL85AIxHhQ1VPsfaJE3x3C71eFh/CRXkH/J8OVwe3LZshOL30LOX+b9GkmGxN6Rjij5HDnkQpFCEco2l2YbxPn3dplzv05O0KHRMWPd0Aa+/+m9gsFNrcfElgbvWfow5xybNwMoG/lVsiyHJjnI3slvJhr6swf4aAu4i5S80v/pQqc9Tj9hxsD06sFp9nXKUlSBakE6SUzLeC7tPClWX4Wm3KT00/JPV0WmKVI7FhMDMhNazAOxwPk/FsRoGhClVbI/4wU5ul+q3cLVFYxa/e+7Dm2wgoyuLc45+72foPfN4kQLZoIWiy0wORiR/ID9aEhj2wlZRk4L9kN5DfXBGpkbSYz9SUYjvst/B7RwdjKNeKmDbgy4GWy2MVb38MsFVJF+eGE1arL5KSHIsQHL2Fw/55cX8pUAJfIkkbbJMoJ64KX7G6dJ8WbDmkg7dSb2QU1irbnRPf+7jgrqmztcHob8mvMFmpuXnq5ULrl9hXKsbhj6FlCf8VEqGF2EGhcb476by97kAYGyuXrae+pQFXGw5kvKhSCyPh/U/ENlrse
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(41300700001)(4326008)(8936002)(6916009)(33716001)(82960400001)(26005)(316002)(5660300002)(86362001)(38100700002)(66899021)(54906003)(66946007)(66476007)(8676002)(66556008)(478600001)(2906002)(83380400001)(6486002)(186003)(6666004)(6506007)(9686003)(6512007)(53546011)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDYrWk1VTEJnSTMzd2g2Vlp5RWh4VUxpQ2Qza0NYYUtrTFoxbWppcVJGVHZr?=
 =?utf-8?B?OHo3SC9rT1d2cHNMQTFaTVlyUXpZbm05MHY3ZmtOL0xwOEFnTHFzaURiUUtH?=
 =?utf-8?B?NXIzdjVGeDlieXdJZWdCOXBrdW5PNVI4d2kyaHg2UURWMlRtc3dudkF0c3pO?=
 =?utf-8?B?c084L3FxbDU2eU1iUTlRNnpOaU5FNG1Lbk5NU3dxbllucUZxQ2habGVvaXpa?=
 =?utf-8?B?YXhGOW5yQmIwZlB0Vm5iMSsxbWlUNE9sZnhUYXBQTENZSWtRdDVwanNIMkgr?=
 =?utf-8?B?bk5Sdy9rclhBZjloSnY1aC9zNS8ycG0yYVZIdERacmRNdTZTRkpIcHRpR3hr?=
 =?utf-8?B?LzdmZklHck1nWUwwWFBaUWF0cllrdEpNWHdXaENYUE40TzA4MGx3OFlTQTU2?=
 =?utf-8?B?V3cvajQ1SEJldE9XOWUxb0k2cTRJZklMZDVMTDBiY0NhQzVsc0FyY0o5d2VC?=
 =?utf-8?B?Y2YwYmtLc2FQbGNlejRKOVgxUHpQYlBOamFVbTNaL1dRZXJ3MlFJUzB3RUlY?=
 =?utf-8?B?SlFqYndMM3dzQTNjWEY0bjFNK0tzZzhndWd6TFg2Y1pXNlJnanp2dHNIVDg4?=
 =?utf-8?B?Ti9iU3lBa0lGVWY1blRFeGlrbThXZ1oyeENwaFpEcjF3cEtMY1orS3dYTGpv?=
 =?utf-8?B?OXIxT2JzbC9LZWdHd2lKUk43amc1d00xQ2JDdkNhaWlHSXNuaklmSEovVFR0?=
 =?utf-8?B?QlRzaWVQK1VtcnpENEtHQmtNUVpibEIrdXp0SkR6d05pUXBYRC8rVnNwOEhT?=
 =?utf-8?B?azFuVzJwZmM5SnVtQlM4aEFFQ0tLN1NTOXJ2MXNHQjcySkNFVzZ6c1JFK0Yv?=
 =?utf-8?B?M2pUdnVmbUtwWjQ1MFFFVjRpL0U4SlFmVjkrY2JobkEwMlJzeGRZRHR0cGh1?=
 =?utf-8?B?YXVkOTMybHlYOXVQQlRLMXBWT0NaV2RsV3BPdVpCVmdpemNJRjV5ekJTV1lL?=
 =?utf-8?B?L1A3Y3hQSEl3c0RHeWFkZy8ybjgxK3NjWkdIWnRFR2ViS2s2QXZrTW0xcVl2?=
 =?utf-8?B?MEw3VTFOOXVSWWJId3J3R0tLTloyandwNzBXNEVjdDdvOUExREpUeFhtTkh4?=
 =?utf-8?B?c2dFeVc3eHVNYlNZRkwrNVJzelIvMzNTY1NvTGV0Z0cySWFwVVR3V0tVVk1W?=
 =?utf-8?B?cDlrWVl1VGJwZ3JGT3B4dElQYTRDRzZhbVBmWE81ZE1Qd0w1Tnl6czVnenhr?=
 =?utf-8?B?U0RMTmFHZlJFNUNlVjQ4SUZ2VXpnclBmU1ZnWkozTllTbXlsMmNabWN3MUhz?=
 =?utf-8?B?TmJndHMwZURDNHIrbGF0eXNoaUFNQ3AzOGNHS2JUUDFDaDdtbHNzTktaOTJ2?=
 =?utf-8?B?RGhEVFRreDJmMEpzWTFQWTJyM0swMTZSNWNla0tYTUwwMTM3Y0JYMW9JVG1s?=
 =?utf-8?B?Y3Y5VUJFL2toN1ZUcnNacitDVENESEZxTFFFN2h4Y2VKNTZEY01YNVVjczFH?=
 =?utf-8?B?ckdCT3EyUEVlbjQzMUZnR2V4Nittdk1CV1h5TTNHWVYvenBMOWdRNmtSelNF?=
 =?utf-8?B?eXNIMHNtYUZFR1pWczhGZlFldnNXWVp4V0VqRGg5cDUwV0dqbXNGUE9wUkd4?=
 =?utf-8?B?ZjR4M1hhN05BL08rVS9SUHR6MDRxMTZMdkk5Q0l3RzVEcEFaam9EUFdqajBK?=
 =?utf-8?B?MGRJOEZ2RW9RN0J3eXlIa283VC9rZG84a2NocFRiSkVkVU9uQUpTc1RpdVdD?=
 =?utf-8?B?L3YvSmg3dXR4K2NnTER3Q0piRDdJcjN3TjZNL2ZQa2N1UW9WT25Pd01INEcx?=
 =?utf-8?B?LzlCUmxROEY5RnRuWTFLa3A3ZTRDbFJXKzNrTW5zdnZ0R3lsWHUwTFBTZmhC?=
 =?utf-8?B?Q09jOVhMN3NLT0MrOUtFRFZBd2pDRG1tYUZyaE5qUmJnQ3c2bUd3UTZLUmFk?=
 =?utf-8?B?M0RwUVhVOHpJRDR2Y0V6a09nYkxxZVlPSjluM1IvQzc4ZVRlZVVtS1BJTVJk?=
 =?utf-8?B?TEdRRnJLeXo5WGxnRnlPZ1d3L0xTaHNrVERieVRGWFhWQWJvWkpLcHI3dDVw?=
 =?utf-8?B?RVNPSlBqS2pPY29PVFhmQy9XZWxrcGZpenBZWDVPeUk4MXZFQmRFczg1Vy9X?=
 =?utf-8?B?blJiUzNpNjVmRjcwYWxCRng5aTBtTksyVk95YW5ZMUlOK0QwWEJEb2YzcVhF?=
 =?utf-8?Q?eMIZhSddkClRvbGY8N9FGWJnp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+PB7tguXWrxsznNO+pEzjro8ARwAH/aQG2iq2bW9fJ0Y//98Syqh5VcO/TGVUUGJ+YtvUCjJMLFWrHi8RABbwItqF5uiYN4Pf94CAoHB5KxlwrkBCvBXx7lrc7frzQ3Zmq3GRXAe21dyXr9n//6hXo+hZEPd3sSmDzYdv7U/iy/DiZNVMYbidozQLKoKZKvwY3iuAZR2bLVmwJSsYUHTTIv9x94xvatCrtdQpjWSMVlZc9Q6TsrkME4QbKkt7nH2rksBO6VaGIuEYzGcjZn6e5ubW4hdXh/Z1LMbXlxdDAfoF3wh0nTmi7tHAcyJyA2Fz1eHd2axKv4FFzhycFlOVJybNPeW7IkZp/m6zAf7tgDp8iNK/+IJ7kbszuvohZKGCbKFL5r2VQOJRxOVid+nzcDQArALarRLdZaOoeSD2WlXpHcc3e7eLGSMNk11vKWfvZU9z4NXpWh630hAKlgxct1Rk7t1ByoCuQNDPB1l8XmwRRuXy6NqJEjNt8xgKVM/gXvlFA4yP3kEEXLpvDx6NBEo8uispZJdOHFbwLBZXYZzs7Sin9TpxVRKz7jN92M+KUd2DRY9zNShVXbIArcJoyjFknaAmTOJzt1SChmXVlDlcFysAY1nKqyIQCR58U0mNYG6xMjbR/1eME5f+IC/7SlwLg1/N73CL1Z9ERNERzaf/wTNq2PT0Y4Y7NSU74DcAcjnWzaROWbisc2+q/ofLXUDkBNjhCXfUXdNEzGmcgCClLqPQkyh024VfqTW2yCbgcepYMRF6fZAJAxbs4lBxYYKQLJlm3elVKg38tTu3hge6kIGhdWKUucR7mXPZbqC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950c5119-e7c4-4b50-8036-08db34598c81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:39:01.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbzQ85k2Qh9uVXirGRUdMoxvxkLOgKWRnV9Tc1+RIRQnIvedtZlU715khrXvZQt9eBA79XvRCjU66k5mj3sU+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6451

On Mon, Apr 03, 2023 at 05:32:39PM +0200, Jan Beulich wrote:
> On 03.04.2023 12:14, Roger Pau Monne wrote:
> > Global p2m type recalculations (as triggered by logdirty) can create
> > so much contention on the p2m lock that simple guest operations like
> > VCPUOP_set_singleshot_timer on guests with a high amount of vCPUs (32)
> > will cease to work in a timely manner, up to the point that Linux
> > kernel versions that sill use the VCPU_SSHOTTMR_future flag with the
> > singleshot timer will cease to work:
> > 
> > [   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
> > [   82.793075] CE: Reprogramming failure. Giving up
> > [   82.779470] CE: Reprogramming failure. Giving up
> > [   82.821864] CE: xen increased min_delta_ns to 506250 nsec
> > [   82.821864] CE: xen increased min_delta_ns to 759375 nsec
> > [   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
> > [   82.821864] CE: Reprogramming failure. Giving up
> > [   82.856256] CE: Reprogramming failure. Giving up
> > [   84.566279] CE: Reprogramming failure. Giving up
> > [   84.649493] Freezing user space processes ...
> > [  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> > [  130.604032] Task dump for CPU 14:
> > [  130.604032] swapper/14      R  running task        0     0      1 0x00000000
> > [  130.604032] Call Trace:
> > [  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> > [  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> > [  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> > [  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> > [  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> > [  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > [  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> > [  549.655463] Task dump for CPU 26:
> > [  549.655463] swapper/26      R  running task        0     0      1 0x00000000
> > [  549.655463] Call Trace:
> > [  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> > [  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> > [  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> > [  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> > [  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> > [  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > [  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> > [  821.888596] Task dump for CPU 26:
> > [  821.888622] swapper/26      R  running task        0     0      1 0x00000000
> > [  821.888677] Call Trace:
> > [  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> > [  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> > [  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> > [  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> > [  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> > [  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> > 
> > This is obviously undesirable.  One way to bodge the issue would be to
> > ignore VCPU_SSHOTTMR_future, but that's a deliberate breakage of the
> > hypercall ABI.
> > 
> > Instead lower the contention in the lock by doing the recalculation
> > with the lock in read mode.  This is safe because only the flags/type
> > are changed, there's no PTE mfn change in the AMD recalculation logic.
> > The Intel (EPT) case is likely more complicated, as superpage
> > splitting for diverging EMT values must be done with the p2m lock in
> > taken in write mode.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm unsure whether such modification is fully safe:  I think changing
> > the flags/type should be fine: the PTE write is performed using
> > safwrite_p2m_entry() which must be atomic (as the guest is still
> > running and accessing the page tables).  I'm slightly worried about
> > all PTE readers not using atomic accesses to do so (ie: pointer
> > returned by p2m_find_entry() should be read atomicallly), and code
> > assuming that a gfn type cannot change while holding the p2m lock in
> > read mode.
> 
> Coming back to this: Yes, I think reads (at least the ones in do_recalc()
> which can now be done in parallel) will need to be tightened if this is a
> road we want to follow.

There are likely a lot of reads under the p2m read lock outside of
do_recalc() that will ideally need to be switched to use atomic
accesses also?

I'm open to suggestions to other ways to get this sorted.  And that's
a guest with 'just' 32 vCPUs, as we go up the contention on the p2m
lock during recalcs/misconfigs is going to increase massively.

Thanks, Roger.

