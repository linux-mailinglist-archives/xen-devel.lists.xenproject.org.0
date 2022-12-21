Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139965357E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 18:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468007.727069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p838V-0002Dy-LK; Wed, 21 Dec 2022 17:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468007.727069; Wed, 21 Dec 2022 17:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p838V-0002BH-HL; Wed, 21 Dec 2022 17:44:11 +0000
Received: by outflank-mailman (input) for mailman id 468007;
 Wed, 21 Dec 2022 17:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p838T-0002BB-Qs
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 17:44:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c75365-8157-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 18:44:07 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 12:43:57 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6937.namprd03.prod.outlook.com (2603:10b6:510:16b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 17:43:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 17:43:51 +0000
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
X-Inumbo-ID: 10c75365-8157-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671644647;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zChxmQqnmqDAaMmujjd1cviuq1JES5gpKWZtot9D8FY=;
  b=CQ6wcc/ifYhIqBbApn3VhvpChUa4MSsAhIN8AyQgbaYbE7NDKthcCjVA
   oVH7LA8wlnbbP6U7E4uAsGOCuvQbWc1FMFWNpcPgwoLsoycqVWjWaSTqD
   PJV9cekxkD1ad5qPK0k7mVl/QGmFzjRPsnfDCl7kmJZ44g/F8pUObX61u
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 89913155
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XNJ8lqpnBTW+JAHAlBjwL2IN8F1eBmIoZBIvgKrLsJaIsI4StFCzt
 garIBmOMvqLZzb0fY1ybInk8ktUv5+En4dhG1c6/HhnF3wW8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzSBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHdKaS2Imtyo+7Oydapu35UoNtHqFoxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXop68z2wTOmwT/DjVVDEWkq+aTjXXhXo0DO
 kIo/zMFgpY9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBsZRcE5vHzrYd1iQjAJuuPC4awh9zxXDv2k
 zaDqXFng61J1JBakaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUUvlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:WREr8qvXU+gZl/rIlDlGPRmO7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="89913155"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaOivxo5G38x4WBmm53ifGSnk3iGdJgl8PdPcqWKhwTG4v222c2fgYs1z0CshX31nPC4nhBx4Y8sjI/2kl+Xhx1/Ohb/cUwi+SrDxeXpW3fK4VPaDQmSVLXWcYeA9j6hwavX/SxTNDOQe8P3kT3fVmD70QhfKPPjFgL0aVO6gfuDvumFA4O6S02DAqAH2x728OtCM/vUyFgZ1bcoOydpdCsCBfGsYu/fGwfgaZbeZsmLxlJnhuwPK+Z4RawJfdstO28BEcb3Wv3kp3OiWqALaNBlQi6RgTfs2bzWonuWpZ6eFEtyFj59V4pzerTaS+ViAWCokpYSKU0RhG42do2eUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zChxmQqnmqDAaMmujjd1cviuq1JES5gpKWZtot9D8FY=;
 b=G+VWT/g8iXf6oHKC+yN5BazXJ2jCuEF+D6fjl5iwWg81YxCSs729h0GUUQ9Xj16Uaj7aslaIagTiiXxWxMYFpjsPvwJYmZZ/9ukNaw6Ng51KyfG2u9vV9UBvLAaTh4J0p/RZ8M+/l1B0AlOo1P8gySL7qp43TeOhza5SJVBRfvVX9uP8IDx0NIOoMY0q2IdxSUTSGETvac1Ne6re5FIRRWSdiqyPp5QUNhnW3vvYOX59dm91w9TgkP4lkyxjbRMDYxLx0abSLS0/BU+skgBIHaiqX2UHzT52OT1B63xyCgG+d+lv5D2YnWQdlf4sB7jCqmdLkF5ZwZR454frQ9sFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zChxmQqnmqDAaMmujjd1cviuq1JES5gpKWZtot9D8FY=;
 b=U9DQf/llo0mTEIG7jBQTjBITSJ40+p9tVIaOZoKkY0xEG6wZzn9ivO+/Hnq98anvYyW+FCt69Pu4lOArH9Swvz5KotLeNXanYhfAuz/aqNuSx37U4flbol7eAy8buJKmbSyNE66aEFzFaGGseL0fkmlAsshvR+fVk8jfAriZe7c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 3/8] x86/paging: move update_paging_modes() hook
Thread-Topic: [PATCH 3/8] x86/paging: move update_paging_modes() hook
Thread-Index: AQHZFT/G4QjmyfM5nk+WhnK7qSG8yq54nRIA
Date: Wed, 21 Dec 2022 17:43:51 +0000
Message-ID: <de5343ab-9083-360f-3d7b-8bf84a70732d@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <bee2d51f-534e-f6e2-6385-70f8597eac1e@suse.com>
In-Reply-To: <bee2d51f-534e-f6e2-6385-70f8597eac1e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6937:EE_
x-ms-office365-filtering-correlation-id: 29d37482-76e9-4092-a158-08dae37aec23
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qnb57AOafpS0x2Yr685prvp1YqkacSyrzpoXtPzUInSG/O4AUnr9WbzBlDP8zVb9hfikvWAjUvMPTn9jioGg0H8YbNLjLnBFp9RvTL3LvZlltjTbeKssiksV+rkVQ828GFp0NxpHD0MaP0QhQnERw3ftv0+iTK7004IcuV9f5NKtMyMKOZcbuHEL9w5k8cF9+YVCcCeAtyLH+d5KhGmznuhUIYyWVIjb6NKSN57a7IfM7P0fjDYezo9VlYk5vJuanYwWmPfwmJ2/Or3koD7apXE9hAVslB+PQDKTk7Uergsf9fTgkcX2DduzyF4ryGHt4VTNhJ7qse9YkmfQpBXAJGjb1Yv7LuLI46O9RwyaeGB/CYvaDLcJ7+FnGiuTLMO5wJByAwipxlCQokV94crzJfmDN+UeTtijktH4HXwvYFH40LNr9URe+g3pP63Ym7PbDf0ZClWbrj1cM2YGGuMItuporxOnjpyWMcqtSww8E/Yv3gg9MPCh0Ithy1mCcEiHUr52G6ORELuRJN0lMSPhf+iS6QZrOYAQP7o2P1dSCSVL+fZOtC1U/69kAWA5AGarSc7nXK3SRMK872xcI2tvyKbKrYnMDJauB9tWOe/UtR/A8w5y3878drmoQymY6exY8X2wXC5MCg266aU8HxBvslbi/ha3hd51dQ79t6Dg53q2nxRX4UPBiI7Nwg5Bb1Rrx8UItsh6Qhzgy+1a985P5pY8BaatsNBAJVEXsjuElWmqYaQipc6Is1X7wpf51BDb+X5gCf+sACryu1RaNUJE9w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(2616005)(15650500001)(71200400001)(6486002)(26005)(6512007)(186003)(478600001)(54906003)(6506007)(53546011)(316002)(110136005)(2906002)(86362001)(36756003)(31686004)(82960400001)(31696002)(38070700005)(41300700001)(122000001)(38100700002)(66946007)(5660300002)(4326008)(76116006)(66446008)(64756008)(91956017)(83380400001)(66476007)(66556008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVptSllUUGxDaXNzbE5ZZTVuSG9rZDVkODEzR3R6QTBrK1lSaTBCUklhVDN5?=
 =?utf-8?B?azBab1hvamhkZXJrVllqVG1xMGMzUXp3VE00UGNZeG1jUUhGNkpmSkFUb1pR?=
 =?utf-8?B?UU04U3Q0b2JTSjM3THBmQnM2TmZnTS80S0NWck1CcXVEOE40NnNkYkhOamp3?=
 =?utf-8?B?YmM4M3VPY2VJT1hrZHRzdnpqTU9YdGR6ZmlXUDQ2T3ZZT3NXVk5jbW1wWWM3?=
 =?utf-8?B?SEtaUnRpSllwODNhSU5hbjgvRTRaQjZ1cndvZmxSNFgweGZwNks5amFTdHU2?=
 =?utf-8?B?bGExNXYwZWk2a3JwSTlkUHZlQ0w2UFlZZmdkakVpU09SbGl3WVdIK3dYRVVI?=
 =?utf-8?B?ZkVhNlNrSmt2WWZJbHB4cnlLMmFFd2txWHdtenEwVnZjY1NuZitxUmkzZ0hM?=
 =?utf-8?B?bGZ1VEtPVVRCYkk2bmFEcHVJV1publhEbEpFci9hV01STzVUREp0ZnZ3RVIr?=
 =?utf-8?B?bW9IN0kzek8rTTQxMEgzaFovZ1kvTlBhR2pSRWF2b1ZYUkFRYWdBOXBPN3Zh?=
 =?utf-8?B?bGQrdVk1RE1pdDNQNzNLT01TNHE5U3dQVlFXZGxUZUF6b09QaDJWVmZpd2hy?=
 =?utf-8?B?ME41cU1kK2lBdjRIakp4SE9PM3FWMElTb1VpZUlpN0FVYzZnUzNFVnpHU3V4?=
 =?utf-8?B?M0p4U2ZhdnlBNEE3ZWxFdlpkZG9qZG90VFl3Tkh1Qm9pUmVEaExqS1pFTjdU?=
 =?utf-8?B?a1hUWG1BUEZJSmVXSUQ0dENtVk1tOWNyMVJnanV3SGlYaGtxUCtjcEFZd2Ra?=
 =?utf-8?B?TUlQWDZkU25wT1h6MC9wUm9seGxHMnJ6YUNpRUphLzludFg1K0I2QlJQK01C?=
 =?utf-8?B?YnFxRFQybTFENTRaMks2dk5ReDRoeUUxdWMxZFFSY2dKVHJDazQzYzM2Y3Rj?=
 =?utf-8?B?SFhjRjhLeWUvTjFBdWwxb0xJRjdsUFNFeVNKRHAzSnpVWUZyZUtrZ0QrRS9k?=
 =?utf-8?B?L3NINXF4cjVpTGZ5bUphMitqSzU5MW1lT0FqbG5DUEp2VVRpTTdoTmxBNXlh?=
 =?utf-8?B?QTdsblVnU3pUdElYZDhPMUJOYnpqeWFYb3VRMFY3S0Z3VURaT00zUDJmcjJv?=
 =?utf-8?B?TnhnK3llTTFCTitwNVpqakkyZWM2bFVka0dQOWY5ajcvY0ZJOE1kWktkeHU5?=
 =?utf-8?B?ODZsWU53WFJ5Q2w2a29YRGNJVlhtV3c2SVN3ejk1RUxFTE5peDI1Qjk1bjky?=
 =?utf-8?B?UGV5V0F2bk42ZGhraGp6ZGQ1Rm1obXROS1pTeDVtMTN0ZjBFdTdualFRdXJz?=
 =?utf-8?B?SUxnNnQ2UENsYUVDSnhBTStNUjltWUE2K00zSFF2bWlvbFQyandxQlQ0cnh5?=
 =?utf-8?B?NTdiUHRsckZseklheTQrOXI0NzZ2b0E4UjlCQmk2OEFHYU80M214cmIwbXNh?=
 =?utf-8?B?Nm9qY0EvMzZMVTdIcXBKQkE4ZXpLZVl5VnBBZThGdnFOL0ZucHFzWTJ1b1Ni?=
 =?utf-8?B?eExKUGVIWE9EYVV2S3BlaUgrWnZWZU9TUVQwcTBPWldMaWxKU3BxS0ErWUFP?=
 =?utf-8?B?RWVuN0NJZWpFd2hoUUxrb3haQTZibVBScXVuQmVEaXIvT1BacDNTSmVXZTdI?=
 =?utf-8?B?d3VMOTFhNEhOTHhDNDBrYTBMMzJlUWMzUTBRWnU0RFR6OThBMnl0MmxEVXpE?=
 =?utf-8?B?WVZsVEl3UEJDdEFEWCtTcHQ0bzNDcU16aXVjM2FLODdrSmdMQ29yQzRWNWE2?=
 =?utf-8?B?V0hKUVJRRk5CZEMrVUZ2a25Vc2pJdTE4a2pFTm1OdjFDUnY1Z3BOaG54SUZl?=
 =?utf-8?B?TldaSzFNcm1OZElqQzlUcERmRUxUemhsMmFXWEYrZ0V0TTlXMjZhcGRmNFJU?=
 =?utf-8?B?cEh2UnBWVU5HbmpFMGFkZStzbExLd2ZGRXh3Tng1cjBhTnBPemt5eVFNSits?=
 =?utf-8?B?MG4xWnFvUXEvYWhWU0lkUWo3UndBV0orUHprbVp5Yk93OWdrMGkrYkM0T1B6?=
 =?utf-8?B?YXdCR2ZQRHcydFpjUHNmemlJNHRoYVZFU2wzYnp0bi9OZ1ZvTldGajY1TFht?=
 =?utf-8?B?blVXWkhoY0xyeWlCWHR1R0cwWU10S1dRVGk2MG5QVHh1ZFVlMWZzdkt4cnpw?=
 =?utf-8?B?SG9XVVJVRjBRNWNhNkt3Y0hPL2c2NW9sOWdWTVk4TExaSDBaZGdFR3JIL1du?=
 =?utf-8?Q?rwuYzoBIKX+9VhlB1kpwAdAlE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C620366228751B4686ADFB0955D97612@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d37482-76e9-4092-a158-08dae37aec23
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 17:43:51.3151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6Y7FM+C2iZwzP26hc5sZl7lAcrUifQJRbma3d5PLVGI/fhBajOcMEelfmbUfbSfFC+4yAcpd11zwINs1PemdHDAIeUjFqCWHWEJ8DPGxtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6937

T24gMjEvMTIvMjAyMiAxOjI1IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlIGhvb2sgaXNu
J3QgbW9kZSBkZXBlbmRlbnQsIGhlbmNlIGl0J3MgbWlzcGxhY2VkIGluIHN0cnVjdA0KPiBwYWdp
bmdfbW9kZS4gKE9yIGFsdGVybmF0aXZlbHkgSSBzZWUgbm8gcmVhc29uIHdoeSB0aGUgYWxsb2Nf
cGFnZSgpIGFuZA0KPiBmcmVlX3BhZ2UoKSBob29rcyBkb24ndCBhbHNvIGxpdmUgdGhlcmUuKSBN
b3ZlIGl0IHRvIHN0cnVjdA0KPiBwYWdpbmdfZG9tYWluLg0KPg0KPiBXaGlsZSB0aGVyZSByZW5h
bWUgdGhlIGhvb2sgYW5kIEhBUCdzIGFzIHdlbGwgYXMgc2hhZG93J3MgaG9vayBmdW5jdGlvbnMN
Cj4gdG8gdXNlIHNpbmd1bGFyOyBJIG5ldmVyIHVuZGVyc3Rvb2Qgd2h5IHBsdXJhbCB3YXMgdXNl
ZC4gKFJlbmFtaW5nIGluDQo+IHBhcnRpY3VsYXIgdGhlIHdyYXBwZXIgd291bGQgYmUgdG91Y2hp
bmcgcXVpdGUgYSBsb3Qgb2Ygb3RoZXIgY29kZS4pDQoNClRoZXJlIGFyZSBhbHdheXMgdHdvIG1v
ZGVzOyBYZW4ncywgYW5kIHRoZSBndWVzdCdzLg0KDQpUaGlzIHdhcyBwcm9iYWJseSBtb3JlIHZp
c2libGUgYmFjayBpbiB0aGUgMzItYml0IGRheXMsIGJ1dCByZW1uYW50cyBvZg0KaXQgYXJlIHN0
aWxsIGFyb3VuZCB3aXRoIHRoZSBmYWN0IHRoYXQgc3RydWN0IHZjcHUgbmVlZHMgdG8gYmUgYmVs
b3cgdGhlDQo0RyBib3VuZGFyeSBmb3IgdGhlIFBEUFRScyBmb3Igd2hlbiB0aGUgZ3Vlc3QgaXNu
J3QgaW4gTG9uZyBNb2RlLg0KDQpIQVAgYWxzbyBoaWRlcyBpdCBmYWlybHkgd2VsbCBnaXZlbiB0
aGUgdW5pZm9ybWl0eSBvZiBFUFQvTlBUIChhbmQNCmFsd2F5cyA0IGxldmVscyBpbiBhIDY0LWJp
dCBYZW4pLCBidXQgSSBzdXNwZWN0IGl0IHdpbGwgYmVjb21lIG1vcmUNCnZpc2libGUgYWdhaW4g
d2hlbiB3ZSBzdGFydCBzdXBwb3J0aW5nIExBNTcuDQoNCg0KQWxsIG9mIHRoYXQgc2FpZCwgSSBo
YXZlIGRlYmF0ZWQgdGhlIHV0aWxpdHkgb2YgdGhpcyBob29rLsKgIEl0IG1peGVzIHVwDQp2YXJp
b3VzIGNvbmNlcHRzIGluY2x1ZGluZyB0aGUgc2luZ2xldG9uIGNvbnN0cnVjdGlvbiBvZiBtb25p
dG9yDQp0YWJsZXMswqAgYW5kIFRMQiBmbHVzaGluZyAod2hpY2ggc2hvdWxkIG5vdCBoYXBwZW4g
Zm9yIGEgbW92IGNyMyB3aXRoDQpOT0ZMVVNIIHNldCksIGFuZCB3aXRoIHRob3NlIGNvbmNlcHRz
IGFic3RyYWN0ZWQgcHJvcGVybHksIHRoZSBvbmx5DQpyZW1haW5pbmcgYWN0aW9uIGlzIGNhY2hp
bmcgdGhlIHJpZ2h0IG9wcyBwb2ludGVyLg0KDQpJJ20gbm90IGNvbnZpbmNlZCBpdCB3aWxsIHN1
cnZpdmUgYSBjb25jZXJuZWQgYXR0ZW1wdCB0byBmaXggdGhlIEhWTSBwMm0NCnZzIGd1ZXN0IHRs
YiBmbHVzaGluZyBjb25mdXNpb24uDQoNCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9u
b25lLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMNCj4gQEAgLTI3LDYg
KzMyLDkgQEAgaW50IHNoYWRvd19kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAg
IH07DQo+ICANCj4gICAgICBwYWdpbmdfbG9nX2RpcnR5X2luaXQoZCwgJnNoX25vbmVfb3BzKTsN
Cj4gKw0KPiArICAgIGQtPmFyY2gucGFnaW5nLnVwZGF0ZV9wYWdpbmdfbW9kZSA9IF91cGRhdGVf
cGFnaW5nX21vZGU7DQo+ICsNCj4gICAgICByZXR1cm4gaXNfaHZtX2RvbWFpbihkKSA/IC1FT1BO
T1RTVVBQIDogMDsNCg0KSSBrbm93IHlvdSBoYXZlbid0IGNoYW5nZWQgdGhlIGxvZ2ljIGhlcmUs
IGJ1dCB0aGlzIGhvb2sgbG9va3MgYnJva2VuLsKgDQpXaHkgZG8gd2UgZmFpbCBpdCByaWdodCBh
dCB0aGUgZW5kIGZvciBIVk0gZG9tYWlucz8NCg0KfkFuZHJldw0K

