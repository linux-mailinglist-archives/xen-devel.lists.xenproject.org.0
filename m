Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D557FED4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 14:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374551.606619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwzm-0007qR-P5; Mon, 25 Jul 2022 12:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374551.606619; Mon, 25 Jul 2022 12:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwzm-0007o9-K0; Mon, 25 Jul 2022 12:15:34 +0000
Received: by outflank-mailman (input) for mailman id 374551;
 Mon, 25 Jul 2022 12:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htba=X6=citrix.com=prvs=198305c53=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oFwzl-0007o3-53
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 12:15:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78fcb76e-0c13-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 14:15:30 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2022 08:15:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5828.namprd03.prod.outlook.com (2603:10b6:303:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 12:15:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 12:15:24 +0000
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
X-Inumbo-ID: 78fcb76e-0c13-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658751331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mj5BS7CNdwXmyx7Ynyd6mTcKHsXDU2C+LCrXRK/9TzQ=;
  b=NckIcOyFjaPWIK1KgXglihiQE5o9UDJ+oktYcg2z6wku21PNtwlDNXKb
   zR2ux1nTG1fNi8cUZ7AIWEzfAj+BAO3fJgnJjv40zReSTY1SWB2A0riDR
   Ng1CVaVZWhTEvOG1oOU9dkTX9I0ogguWQb4Skz8bXQorAyonH6SvTsdSu
   U=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 76551859
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tfRBa66QQNsFmd8zxyj5igxRtCHGchMFZxGqfqrLsTDasY5as4F+v
 jBLDG3UMveCYTahKNgkb43noB8O7ZWDndJiHQBp/3s9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ksw5qmq4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEgUbbNf2eYuOj9Lz
 tBHGhEqXBqJo+3jldpXSsE07igiBO/CGdpG/1pHlHTeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LmMe8Q3NzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLarC/x37+SzEsXXqoeOrbmpvFDvWS4hUk1BCMbZAadotC23xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht8ztLSxitvuSU331y1uPhTa7OCxQJmhbYyYBFFIB+4O6/9l1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlkRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:ZjhSGK+FakovlSCWpthuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.93,192,1654574400"; 
   d="scan'208";a="76551859"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBprPQ8UUS56any+8vmm/7FefxwAU22AqmwMe5gYmVC4kJ4IJL32B++nXKTm46kFADy/97+VZ9Gm/LCGilWhHNI/tVkiIeBEK/xA8A3K0UwoGKCUfgh2Q0gV1iqAbhaNBUaAi23lhUh6G4e+e5+OYfiEQ5eQOqiMPFfhiNz3QDtZCgOYD+4mZJhWFKjo7ZBDFEX0gLrkn2StV5GCwjuJ6wla5LEPio5E0lyDl/wmmRkDc2c14o23ArqzTQDEz5kS8bVdGUcq75nmSU0nkvpETH1GAhCjtolKBEWX+/mrGDwNo5EGw8j7g3mFW+lcHumhH2l834W20scb3X+TaUluJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj5BS7CNdwXmyx7Ynyd6mTcKHsXDU2C+LCrXRK/9TzQ=;
 b=cHxpfBb+rDSC0muyoLVDmem0pMdWufujl36apYroLNJUP2K3Kjx+7KW1pGH4x43iwEOjEnbDIW7Eu8+p3XB9cEv/6W+Q0y2e5GoMt9T1n/qNMetCMoWiMcHa0ofTBhKQSa3+W0dPNlsI2ryElxCtOv391kCptHG/dikgvfswHErGTi7ArznRenPm2bhi3UnJX15S3o9zZUqxJJjYoaZS53QS0xmBnLpQmWJ6UsITfa+qa96BVXoVTS3A68W4ds6Dn2xtjXYCljZcHtX81YhpTl2jEg6hAW9Qt6RLiPCZ4PdsbvibDClk0AB5m9bmiz8Ap3Ugq9m4lK9yvURptku4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj5BS7CNdwXmyx7Ynyd6mTcKHsXDU2C+LCrXRK/9TzQ=;
 b=Fu0r3GHx3gAW/IxwPN9pX0ZVsUadoRo5pWSFvZHNS8qwG8pw/e2AleJwE8nnpu3mUXoI4p7Ma9UYxoFBlLPZlbeu7NsP1hhhn2qiu5cYlOFmZaLfhir3i4XGdQ7SK9Mn4YoVAEBsIvzNnq/V4P29Afy7DGl+1gi28l8WPSbdD3Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: limit issuing of IBPB during context switch
Thread-Topic: [PATCH] x86: limit issuing of IBPB during context switch
Thread-Index: AQHYoB9g490kRgaofE+hh4IHFh3+f62PADAA
Date: Mon, 25 Jul 2022 12:15:24 +0000
Message-ID: <8b347c26-d1c3-b3c7-8e78-2e43b274255a@citrix.com>
References: <3327586c-1489-4af9-0fa2-29f48d957954@suse.com>
In-Reply-To: <3327586c-1489-4af9-0fa2-29f48d957954@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0409b292-bb89-4193-5d86-08da6e375a7b
x-ms-traffictypediagnostic: CO1PR03MB5828:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8BVM5in71gIVGpALa1SJ8YnE4grnzoXABXNP4F0PIOYnupiH+557yjWq8g63kcMF3bUiWPUid1IIJH1vxHRsbnHoPUFc2q+V7Y2T0+fAoV3vnhVZRtk0qynvb0onbeuqyw6D5UJ/SmmHgyBFwRf7gXMtFlk57iYL8p1edsPLAZVgJR9ZT5LBgZwkLfTvcgJVG9OUE7mY7/ZG96g5mZnh1WQIDGcX6WOur7rjQDQBOQd4vCB74hbNVv8We3aLiunjpj606lJ9xp1Gz8Y/WH9TVDWKgdhQhacPNVxgOyy2TfBbXUffTwCvjSgTnsXdX2srftn9sJFU0MdRxV24ZkYNFPEY4NdysaCT9XAoqMd4bly8AS4TqBdkGqiW3Mz73l/T10sYBPZGhP3qvaJ2CAKm8jJk1hlvFgzKr/FxgCJq/VPRSW7t8niYFZ1+45qpTqjGLpbKuFQqllgEIZwtYuc8GApQXhfibuWKDx9W5FvPLgs3Qwhv/knQId3V9ADh7NN+gTEYccslQHstKtyyZsJuYq2qtU4kf487r3IEvj7GedCKp+3uBveeUmAB8Q9HRKmwu0QLHPIPczbBFggUaZpjllOr2Licmzxovt6Q8d9d+8RmVyzG84sozbLQPzSH2oQQ5Kea9CDAxQgDCC5Uxprs/NY5l8fNBhTO0HWga6nGkydQhS/dDo8NfVtMX6Ma7AAvcR09Whsl8ASITSlzc8i40B37j37uam0Z94QVvJRwkWdNJhlLIjq6tGSMGI7qHJeM77+etftqmhNFl8pc+7tV+yRnD8u0QZpGaM7B7jqR4dSpriB3WBjP/XqWVr2GmqTa9bO6UwFmG2mySIc67yfX+R3Vw1PCmGz1+i5eJ5yKD6qlfB0Bg+xYxaF4RtvXrO0U
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(91956017)(122000001)(36756003)(186003)(66476007)(82960400001)(4326008)(38070700005)(8676002)(66946007)(110136005)(64756008)(316002)(31686004)(76116006)(66556008)(38100700002)(31696002)(71200400001)(8936002)(86362001)(2616005)(478600001)(5660300002)(6506007)(53546011)(558084003)(6486002)(83380400001)(41300700001)(6512007)(66446008)(26005)(54906003)(107886003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1dBNXE1OHdqTjJsb0RzTm5Eb1RrSzhhRytnOE9zZlc2RC9udjJ5WUZzUS9H?=
 =?utf-8?B?WEtTaDZ0RHRWd1lNaGdWbEdqUUdmTy9Ja2FKSldSaENRSm5PRmV2MnVtdzNN?=
 =?utf-8?B?d0lwTU1ZY0dGeVpRd3FwaWg1aXJQR3lXQzFoYkpDeHZYMHdUYllPUTR5RlVU?=
 =?utf-8?B?RWRzeFczc1hxOEtjYVBKUFNzSzFXTm43d1hWMXRMd3kyK2huTlR1UTR1VFdF?=
 =?utf-8?B?anZjdGxUNStEaDdKRjAyVFNEM01UR1U1NE1ITG5Oc091WTd2RnYxWXBXQTB6?=
 =?utf-8?B?ZTJnMUl3ckFCRFdSNmFUZXlwdkpTTjRsWTVXajExUXQ3RXA2K1B2NVZmY3ow?=
 =?utf-8?B?dG9lR09peW9xMkt2aEVsZEVrbUxiUHNxc0huWHdQM0pqMHlkaTBzQnQ4T080?=
 =?utf-8?B?alZiSUFERVdVZXdKVGMvUHBYSTdlaS9BYTl3bUtXZEVLeE5rd0ZsZFdNQW9J?=
 =?utf-8?B?dWs2bmp5cGJkYUVzZTdEeFJ3RE5iNENyMCt1aHV1WUtXRElMUnZXbVFRT2pD?=
 =?utf-8?B?M0VxdDlEYlR0U1NnRlVjTXFSN2dTekpoNnJJVkJ4THIxendWc0dSY25KOWtX?=
 =?utf-8?B?UCtLaE5PR3Jrcm94NDBHRzQ1SE9PSzMxN012cFVBTnQxVGJLR3E0NDZIRXVq?=
 =?utf-8?B?MDU3djR6NDd1ak5EUDltUnFrSVZaUmRMWUhYd3dtMy9VSTM2RFo4RUJ2aUlN?=
 =?utf-8?B?U1pkSmFVNS9xdUhFdlZrSHA2dGxneE4rNjBCZmdWbkR6RXJXRXk2L1ZvTkdQ?=
 =?utf-8?B?bnRlM0FUN0Y4OG13REtHT0lCa3lIUlRoVjhMV3dUNWwxdk1RMTNDbmNITlNG?=
 =?utf-8?B?MVNvV0xSYVgxMVNWMG9DUHVYZmplRE1GRXFGd0R2c0Y4eWdnVUswUGx2UUFl?=
 =?utf-8?B?Tm5Vc0lwZndla255UG1USk8zQVhGZUFudHpmdGt6OWFtYXJyVllhbFZrT25O?=
 =?utf-8?B?bXhRQkkxdnRidXh2eHpraHRPMUE2cVoxcHdRa2VYa0M3L0hrczJNZTl1eXNw?=
 =?utf-8?B?QlNnQUxRZUp6R3dGamZaZSsvTFIrU0tzV1pZNXRCMkllRW9TaFlaOWVUWFhZ?=
 =?utf-8?B?SXp3ellwb0FXcklZZmVLejlTMGFsSWwvaTIxd0FzWWEwN0VETGpRcEdZVXVY?=
 =?utf-8?B?dlJVVVIxM1daRmpLU2RMeGRua2M1bUJSUElua1FoZXd2dGI2ako1S0kwSk9K?=
 =?utf-8?B?TmlGeGVaNS84dGxqNk8xYVQ0TGZNUkp5QVlPTE12bTg5NHFNUTBNTjdieVhB?=
 =?utf-8?B?RUN0TFprZXd3Wjd5Z1piVDZZSmlUek1FZ0pySzZMdUZwQU43OW5mTFI2b1pQ?=
 =?utf-8?B?UVhxV2VidXdEZnBuLzNmOTVTVzFhTUtFSzRsQWpFVjhGY1BuT1pBbk9xT1FM?=
 =?utf-8?B?T3dPU2wzQ2phSmVQSjgveVJrTlA1VzFSN2NiUmxDL2pLdkNJMzJ2dFdBU1hw?=
 =?utf-8?B?b0hjVjlnTkU0eEJaVnlJRkw4MWxvQVArTm4wcW1DOU9WcGN2ODZkOEpJQUZ6?=
 =?utf-8?B?VUl5QmNyUG5xNHVqWVNORlJDUkZpY1NCVHB2a21jN0xBcDZvVjRqS2hpb0Iy?=
 =?utf-8?B?WDQrN05OaTVCMFIvTTdSUlVPdk9id3NUN3FlU3BWaW5uMmJFSlpvbWp6Qngz?=
 =?utf-8?B?bVhEeFc1bVZpYlRMUTdnWGZuOHBQdERPaVRHck8yTWhMSXpnRVB3bFROSm1u?=
 =?utf-8?B?eTAya3dwMUdNbGVIYmptSkVHQ0tNWGhJY01vdkVzMjRuZDQwT0kwNjdCNmli?=
 =?utf-8?B?UWRNZWFNVS9JZEd6OGxnWEFtcUFuRkRQclI1NHZWbkd5UitzR3loV2tGYSty?=
 =?utf-8?B?TEluTVJDaHJ5U3AwbzBXR2JqdGVqd25zVFZEMVBwSGI0UkdlUTRyVUFzNEFh?=
 =?utf-8?B?NnFPWk5Qc2pZQlZkUWh0ZGR1MHp3RUFPYzJ2dDhiWFVyMVZDaVI1bVE2YjlW?=
 =?utf-8?B?NjdnWUMrSmtOTWpqT3VTUnEvM2VHRmJHMnlsc3pKQmdncHRjUUNRZUNlS3ZO?=
 =?utf-8?B?TFVxbnRJQXBkVnpSVnlDcUVvMUdTWVN5RjIwMThDVjhHNnFISnJESmVpeFp0?=
 =?utf-8?B?d3A4eHVXNDhwU2Y2d3hlM2xoTnVxdUp6UFJ5R25TZ2xzWDFiK294YVp0YUxx?=
 =?utf-8?Q?z8bZLWrt6OIJZq1ebIABacqAW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AD94FF9B35C0D41924D0876C419AC3B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0409b292-bb89-4193-5d86-08da6e375a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 12:15:24.6481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/pf+trZkEvv7XldcQZ/moHsR8uOjiQJ2GYdEUaOdQhc4OdhKK9/ZX3M6m/0WucSBNLAKiXVwOo/5n9K9aZpDXYbIScgzjiuKxII4aq/3j0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5828

T24gMjUvMDcvMjAyMiAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoZW4gdGhlIG91dGdv
aW5nIHZDUFUgaGFkIElCUEIgaXNzdWVkIHVwb24gZW50ZXJpbmcgWGVuIHRoZXJlJ3Mgbm8NCj4g
bmVlZCBmb3IgYSAybmQgYmFycmllciBkdXJpbmcgY29udGV4dCBzd2l0Y2guDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhdCdzIGFscmVh
ZHkgYWNjb3VudGVkIGZvciBieSBvcHRfaWJwYl9jdHh0X3N3aXRjaCBjb25kaXRpb25hbGx5IGJl
aW5nDQpub3Qgc2V0Lg0KDQp+QW5kcmV3DQo=

