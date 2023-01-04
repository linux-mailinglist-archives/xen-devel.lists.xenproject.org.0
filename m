Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A165DD5B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471454.731299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDA0G-0005Y4-PQ; Wed, 04 Jan 2023 20:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471454.731299; Wed, 04 Jan 2023 20:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDA0G-0005Vy-Mf; Wed, 04 Jan 2023 20:04:48 +0000
Received: by outflank-mailman (input) for mailman id 471454;
 Wed, 04 Jan 2023 20:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDA0E-0005Vs-V6
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:04:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 071b0d19-8c6b-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 21:04:44 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 15:04:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 20:04:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 20:04:30 +0000
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
X-Inumbo-ID: 071b0d19-8c6b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672862684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Q8lqIglA3cLE3gjKfVs53dWzklNgm/Z2M2j8Ey4rR3I=;
  b=CQI0kznF8bTSA5UgKzdn3RCyLc0gsvBfg3PaceTUZV1Ym23gmzdJD16K
   TQkagn4BemF6NlFexc/BfKb0kzXDmb3bc6t/hc7iTEZXUr2utlLRbTJVl
   cuYjVmkzpG7cxyPaAAxAdQr9E5tQ+8o5Oufolj06dbb5dMQG1q2v3+af5
   o=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 90151052
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5/XurqrtoCwaTiObZQ520C9RH0deBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnXaa7eajP3c9pzYI22/E0DvZTUnYU2SVc4+Ck1QisQ8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyVNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQURQ+ju+a1/LW6G8lVvskOEunZE4xK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWNEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXprqc32QXOnAT/DjVRVVKqgeGGknW3WvZmK
 3IR8ycJlogLoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2gheRSN9mSfexloesRmm2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:OCvYYqo++QmBgGtBG2IkRPcaV5scL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRYb6Kq90ci7MAjhHPtOjbX5Uo3SOTUO1FHYSL2Kj7GSpQEIaheOjtK1vJ
 0IG8cReb6Ab2SWlfyb3ODRKade/DDtytHQuQ6x9QYLcehCUdAd0+5MMHfkLqQ6fngxObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4+bGkZr3CCR2ciLOvGO17A+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc/3W71eUYpPLRjv94QOCcgMkcLTvhziyyYp56ZrGEtDcp5Mmy9VcRls
 XWqRtIBbU+15roRBD6nfLR4Xir7N9u0Q6o9baguwqqnSUtfkN2NyJD7bgpACcxpXBQ/e2U65
 g7rF6xht5yN1fngDn54d7LEyFjkk65ulYyjOIVlXxVVIc1brhNoYsD0UtJGP47bV/HAbAcYZ
 hT5f7nlYZrmHOhHgTkVzpUsauRtzIIb167fnQ=
X-IronPort-AV: E=Sophos;i="5.96,300,1665460800"; 
   d="scan'208";a="90151052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUduF74z8gtOEPoxpvdB+b9Zk3G3cOqbVwGagme4YFA4hlu4+7GOtXe/j5QswTA8JERYkLOiVKHSfXwHZoM8VQp8KEYO7iRPtl4mPRpy5SnliedMKbZP8uoJ8t5x02QREPdNLLRKV7wUj4TpMxQrUR779fWU8hrU3oc9OltZLE5ZkNPA/iGHMMr5vUCT2y9R2WYIHzNIBKKEyOqkSoPTOoUHm5VmZFDN5L4xYNr91Av1a5ffAzNH71eDztK7CRZpsbvAcRGYNdA5AVmR55QBdpqNTGmGJVaZxsfK7/69ffLqqIOLDFDn00f1t75wSzeo38XWoQtzJxd9HMpZOoC+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8lqIglA3cLE3gjKfVs53dWzklNgm/Z2M2j8Ey4rR3I=;
 b=P3EdI7bC16DC/fWxWhGKHMsY4AOzgiBqg0+dSfVT2fGrkQdDIdxgf/6N4WeNzT+IL0E7y9qG7RLUMzl36X3fAmqvn708OuPnUsi5s3jJyaZe4sji66IiSZ+BoRZyoUHxd6wNcetLCvEIVKkXtiBt3as9vPrQ+TlmQxo1pR0ZpwcKzLs2G5ZD8FtogAIq3GqaXNWt8ARcaPtMtZcUcJLO+nHcNuMpcrII3dzTQ+bEASxx3Zs92kF8mWKal1G8X94YA40UeZVWk3DDsr3qnGK9BNjyk/8ckZiNJY51eFdu/vNrSaNdbFCfgbwH1pbdvD4zOUSFTWjuWB28RUEnKgC5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8lqIglA3cLE3gjKfVs53dWzklNgm/Z2M2j8Ey4rR3I=;
 b=iXTrHbSs2g7yG1zFjyQvxUAc0jUf5bQ8v+jjXYbN73+cq+QY27epcVY+5qv5XPaeWiLgtWMK5FqemQCxckojXD/cHK/2GYZA0sbvrrwlNwh07zvYBS4WAzchTwt6Pyfxawfrj7XzByN31FalGPZssGmVpp4blvT0GTgS0ykU784=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2-ish] x86/boot: Factor move_xen() out of __start_xen()
Thread-Topic: [PATCH v2-ish] x86/boot: Factor move_xen() out of __start_xen()
Thread-Index: AQHZEYuAyVgzwEEad0Cj70OyJmEML6520VMAgAB2soCAALPugIAW0HgA
Date: Wed, 4 Jan 2023 20:04:30 +0000
Message-ID: <5f3df359-2906-ba20-b8df-ae2f2d5f5981@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20221216201749.32164-1-andrew.cooper3@citrix.com>
 <520cdde9-07e1-fce8-56d9-205fc31c62e3@suse.com>
 <c14dacf1-7057-d860-7708-2dd13e8d6a4f@citrix.com>
 <e70bf233-4444-8c65-8cca-1b7ea74c55d1@suse.com>
In-Reply-To: <e70bf233-4444-8c65-8cca-1b7ea74c55d1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5312:EE_
x-ms-office365-filtering-correlation-id: 27caa092-f2ac-4007-b33c-08daee8ee43e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aAXGvrFz3uHCl8YNj5zjio432c/8YP8/+2LRHHynR4ZT45lTKrqyLBV6f4ngXJ+/D3xbKmJeoPuTF3tLHFSpdHiCpBacHZH9XmzeNxhHlDeY+ZgcATu76MHhXlTHFPUxaeDFxaPTeRA02SexT/kTCgd3RyDYvgf4FXzhUem141SmnQeIZAIcm4kgRVpcPrVf2DxCZefg7OGLCi6Ks98rWaK9Rm9VqJG5TJo5uf4j+18whn6eVBHf5SbahJr3rgWEU7AsjckR8rhrqJnIWUnL5uci48STYpGaUAWkgNta1o+zMzhiuM5YNQpG+64OvZYqrTOjyW5O073+HdM+8Nz7s0JoqTjGQ4bBWhjJY1s3TOB/xCOFuy7yozStkDNy/cMRnVyR3VhyoFwdSoXB5EhzVUiKNZNcCHC1b66L1MbJQjVZLns3c9Qoju07Dl4Je23c9Yh8/AKF1oGMXxsYGhsXy1Ga56TW2BmhfNi8iOH45MeDmutTkMc1rbA/nnokoUPOfgewFHGuDTNwdjdCglxC+IDPJQ8McAzqaHXkdOfGqrm0OA56oyi8F1QjeZD6Zm9A4E0x3L8cz1EJ2NRffD1aGNnI0eD92rZTWBmR4nU6+xyE2S6SM3pTtGOLaqejsrGYFvNja5VkB/X8tY/3BnDxpSDky9cjHPiy7PwGMhm/fXUtZsEqSXCZSAEl1DJSDFl8g6XaTuov9VZOLtGxlZyTjDJ0we5Y+crSW1AroPaHqGRfOiHHi3oSh5U9aU/GVWmguy9HqdFh2etY03QZvAyXTbrQMoK2BY5lFWcAsYi+0Cs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(36756003)(122000001)(38100700002)(5660300002)(8936002)(41300700001)(83380400001)(86362001)(31696002)(38070700005)(2906002)(82960400001)(966005)(66946007)(71200400001)(66556008)(76116006)(6486002)(54906003)(6916009)(31686004)(6506007)(91956017)(66476007)(4326008)(2616005)(8676002)(6512007)(66446008)(316002)(64756008)(26005)(186003)(53546011)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjVyUGxRaTYxYTdaTWt6TDZpcU00WVdBNmJvckFNN2JkbDB4MkVhQ2p3Sk5E?=
 =?utf-8?B?S0J4TTBCbThTMHpjMDkrdkp2UGgzWXVPVXNjZHBmeHpHMVh6V1VKR1RmUDI5?=
 =?utf-8?B?dXdqbVNZdUZZdTg3U3BrbjFBaG4xOFl6Ump0WUJRYllWMTJJN0RCTTRLQ3Zn?=
 =?utf-8?B?cWE5dXo2dGpENVRzWm5NYjF4d01WRjZGeFEvTy9jdE1FWHdpMkExaTRlUFN1?=
 =?utf-8?B?NVBIMytjZThTTXBDeCtYUk5WZVVXMjlvcVAzQ1l5UDlpNjY5V05iQTdQWWJq?=
 =?utf-8?B?TDVZdUNTenQ2eHFzNWQ0ajY5YU1OMEg2ZnNsVXVEOStSOU9TYnRIWkgxSkd2?=
 =?utf-8?B?VkxZNVVWZzVzV3JoVTlOU3NjTkl2NFQxN05DWG1LU1hkaW5BZEJvZXFLZmJB?=
 =?utf-8?B?MmtEOS9qV2NBTllCMFUwN3NneTJPZFNONW9GZmxxOFpYZTFJT05iV1ZiQ3Fv?=
 =?utf-8?B?dFhicm55QzdCYUhTNUVEbXBrR2hYT2RzODZGZUIwalJIZHp0UENKMlpjOXRQ?=
 =?utf-8?B?SDRSN1dsN245dCtpVlVxMTZ1cVRBUU1TVmxQRGN1Uk5CMDkvSUdPQVlhQzZY?=
 =?utf-8?B?MEtSTTFSNUJSSXZZQ3FGckFZVHBqWE1Zdk02dmlkWVNmRllLMlBLdDlEazVZ?=
 =?utf-8?B?S2JLUmVScEFnNWtTQzBrOC81aGMxQmU0WWhhdkxJdGZHbjltN0xBWXVjN3A3?=
 =?utf-8?B?MGcxaktJV0d0RXlJaUU3UzhKeEpHck1pWnRkdXJzdUhKYmkzU3FxZitNQ1JB?=
 =?utf-8?B?UzFRYzNBdVlGeFVNUGpWcXM5KzFZTmYrR3FLU0dOWDRGYXlrY0VwR2toU081?=
 =?utf-8?B?a1B4QVhRTjZXRmdjckxpbkxXRHFhNnkxRGlkby9DRVJGVVl1S2NZTHlDRVZG?=
 =?utf-8?B?S0lvb1JMMGFxd3lDS2xUSmNUMzEzR1BEb0pEL2lNRmZBeWR6Q3hXQ0VFdEE4?=
 =?utf-8?B?Ymg5OCtuLzRGZHNIT0RBaFRkS1g1ZGNBd0pBdDRxTDJEMHEvd29YaTVBVHJI?=
 =?utf-8?B?SmF6aGFoSkVvam1pZlZsVmVjVDVhbnpMQjRiMnVZR0N6QmFKVUVqUmxnYklB?=
 =?utf-8?B?MGdjK1IzWlNaN3ZzbENSTzFOZ1F1L2lCRk5XSVRpYkg2THpNN0RtdDk0T3hq?=
 =?utf-8?B?MXRCUDRsNUZtS1cxclZSQXc3VlZvc0JGekxPOVhaMkZaZUxLR1R2Sk04a2F3?=
 =?utf-8?B?NXRwcXhLMEhWcVp0bWdFM3JSdXhvaFJldHpKVGNhM0l0U2t4eGJMQWFJN0ov?=
 =?utf-8?B?MG1FNnloNzdPYzc2d0FySTBSMGw4SE5WcUEydWZhY0VDYmNlY1ZoRkZlMnlq?=
 =?utf-8?B?WFBraUJRekpPUUx2aDlNTlFaUDg0bjJKQWsyZmt0YXJzcmVGSCtzMi9UZVBn?=
 =?utf-8?B?aHJDYWV2V2tDU0YwM2IvWXdtRDJCY0tMNVZYYW94T3cvWWpuUXBOVzZVcGph?=
 =?utf-8?B?dUdSTG5GekJ1L2t1VlhlbTFPYnlTdUE4TVNNR3VZTTNJV0Q3S2hGYjZjUXZE?=
 =?utf-8?B?ZklOT21uUHpKMUJySGp5bUpyRUxCWHFMZUR2ZnZ5K2FjY2Zqam9EMklzM2xa?=
 =?utf-8?B?bG10MVBmRXUzZHB5SHVKWnNUaGxCWWpra09tSzV1WlMrc3ZnTXJIQ29QRWs5?=
 =?utf-8?B?K1RtOC83ckZSUzE3ZWZJekJzOTBMYmFrWjFEem5sWGtKb2tGVzNLWWt3MFFE?=
 =?utf-8?B?SDF1NktjWm1FZFZuT3ZTeE53SWNlU1Vyelhld1k4Y3llQlkvZDJ5TThWdGdX?=
 =?utf-8?B?ZldNSC9URTZDUjliOGJrVFgvdUt2MStURGlwbDBGS2xaVENENXBSTUw1WUhR?=
 =?utf-8?B?eHpXb2ZwYlJJL0VXZlo5UzV3ZXBvODVqYjJCcWtQQVQwZ0pYMk40ZHJoOUM5?=
 =?utf-8?B?WTBVcTduTkducTJFVTF1RXY5SkcwV2FvNzhsZlh6QUR2d3R4UnZpc3hhNzdG?=
 =?utf-8?B?eEZGMFRFbFREakJMQlNQbjVoeFZWRWNQcXVCR3lmeU5YK0NTM21RQ013QlBi?=
 =?utf-8?B?L0xqZS94bWNoaU0wRUxGMFVpOFM4QWVWTEdlV0RuSWpick1TckhWd1ZZK3Bv?=
 =?utf-8?B?N25NNlZTejFycG8wQmJoRy9WNUxGUkdaNFVUYkE1TUhSdzdFd1lHL29iMDJG?=
 =?utf-8?B?cXVTTjZrQU1FZEhWeTA0cnJqcndzdGFlb096SnJ5UUk1cWR3VEtDbm9SQWFI?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C3073882006F0489B71C3F9AD10B543@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3GVJQUPme3502kB408snSO+lbyxtufW/d+3Hcjg94RMiNn8XFe8nmvWSqJX4oCmv1WYL7BRwF5Xkt7voQxGuHDlZs4MIukMWk7kgM3FWlA4N50FtEktsi+R7XD7Le/xSAfQU8i4a0qc0GDpVc/nnX198KT2aCPWtjHMdhgduGyTPDV8HcKe73BXP4OBbMHNpbjDR5gbqWeY0X6Ae/DtOgsaP1V+bT3Tp77P3xTTiI9hbmnCag2qNhWbSsB65dI8zMV6HkCESqLrDBzEU9+7cjE+uFb+WapeklYdG9x2aNvmi3cb6oFohuVUbHT1kbv4yvYqQ/hqKu2e9/DHG0jWAo27OeHWvu0+RA8yY7o7at2WDiLNBbgJsysSXV8YyhT9wXKRThf/2er8rRrAU95LXPy6665lxhwgBV+38RBxo4SC1eeMsmJNrBLbEL93flE7bj6B/7mSAyjiHmUIciIr2BLDs60xseqMOAWsRUbaDFn8aWcnRm+JMekPTTsbsBtfI65pGp0IN0AimwWR56FMsNTa1KbRRGsAVU6kkvtMmqqiyhKn4tB4TVYL+pHVrFHbE6AgbTkrasNIPlVmTFIsPZPUBcHVgKfrgV+j1QLSeBCIpE+xDKiKcYOG1rITDQMT/O85Go3e+8j7DyC7fYnT/VxlOIxcsUU07q+BLjKcEF3ajDUmQLSJ2pnQfFDgX01ySpaZo/J/4i6CkD1vn6CLWI3EkwbaNSvxub4yWnQPkFVi+FJYRc6/uhmsYRZCWSLarBPOryinxCucMraZ8JAXQ5BtFb9t2IpFl2vqrJhptezZqZcT/EmBQqb80ASe6hRP5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27caa092-f2ac-4007-b33c-08daee8ee43e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 20:04:30.7802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XSBZYAZ1AhrR+gJ56L9v2jZat6uDOBH+gbMGzI8dCfQjzb926Ao9g+2AmOoFjshkbBgCdCW4MvvptyMxtWRdrox/tHVnjsrDfJRpD7sO1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

T24gMjEvMTIvMjAyMiA3OjQwIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMTIuMjAy
MiAyMTo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDIwLzEyLzIwMjIgMTo1MSBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTYuMTIuMjAyMiAyMToxNywgQW5kcmV3IENvb3Bl
ciB3cm90ZToNCj4+Pj4gKyAgICAgICAgIm1vdiAgICAlW2NyNF0sICUlY3I0XG5cdCIgICAgIC8q
IENSNC5QR0UgPSAxICovDQo+Pj4+ICsgICAgICAgIDogW2NyNF0gIj0mYSIgKHRtcCkgLyogQ291
bGQgYmUgInIiLCBidXQgImEiIG1ha2VzIGJldHRlciBhc20gKi8NCj4+Pj4gKyAgICAgICAgOiBb
Y3IzXSAiciIgKF9fcGEoaWRsZV9wZ190YWJsZSkpLA0KPj4+PiArICAgICAgICAgIFtwZ2VdICJp
IiAoWDg2X0NSNF9QR0UpDQo+Pj4+ICsgICAgICAgIDogIm1lbW9yeSIgKTsNCj4+PiBUaGUgcmVt
b3ZlZCBzdGFjayBjb3B5aW5nIHdvcnJpZXMgbWUsIHRvIGJlIGhvbmVzdC4gWWVzLCBmb3IgbG9j
YWwNCj4+PiB2YXJpYWJsZXMgb2Ygb3VycyBpdCBkb2Vzbid0IG1hdHRlciBiZWNhdXNlIHRoZXkg
YXJlIGFib3V0IHRvIGdvIG91dA0KPj4+IG9mIHNjb3BlLiBCdXQgd2hhdCBpZiB0aGUgY29tcGls
ZXIgaW5zdGFudGlhdGVzIGFueSBmb3IgaXRzIG93biB1c2UsDQo+Pj4gZS5nLiAuLi4NCj4+Pg0K
Pj4+PiArICAgIC8qDQo+Pj4+ICsgICAgICogRW5kIG9mIHRoZSBjcml0aWNhbCByZWdpb24uICBV
cGRhdGVzIHRvIGxvY2FscyBhbmQgZ2xvYmFscyBub3cgd29yayBhcw0KPj4+PiArICAgICAqIGV4
cGVjdGVkLg0KPj4+PiArICAgICAqDQo+Pj4+ICsgICAgICogVXBkYXRlcyB0byBsb2NhbCB2YXJp
YWJsZXMgd2hpY2ggaGF2ZSBiZWVuIHNwaWxsZWQgdG8gdGhlIHN0YWNrIHNpbmNlDQo+Pj4+ICsg
ICAgICogdGhlIG1lbWNweSgpIGhhdmUgYmVlbiBsb3N0LiAgQnV0IHdlIGRvbid0IGNhcmUsIGJl
Y2F1c2UgdGhleSdyZSBhbGwNCj4+Pj4gKyAgICAgKiBnb2luZyBvdXQgb2Ygc2NvcGUgaW1taW5l
bnRseS4NCj4+Pj4gKyAgICAgKi8NCj4+Pj4gKw0KPj4+PiArICAgIHByaW50aygiTmV3IFhlbiBp
bWFnZSBiYXNlIGFkZHJlc3M6ICUjbHhcbiIsIHhlbl9waHlzX3N0YXJ0KTsNCj4+PiAuLi4gdGhl
IHJlc3VsdCBvZiB0aGUgYWRkcmVzcyBjYWxjdWxhdGlvbiBmb3IgdGhlIHN0cmluZyBsaXRlcmFs
DQo+Pj4gaGVyZT8gU3VjaCBhdXhpbGlhcnkgY2FsY3VsYXRpb25zIGNhbiBoYXBwZW4gYXQgYW55
IHBvaW50IGluIHRoZQ0KPj4+IGZ1bmN0aW9uLCBhbmQgd29uJ3QgbmVjZXNzYXJpbHkgKGhlbmNl
IHRoZSBleGFtcGxlIGNob3NlbikgYmVjb21lDQo+Pj4gaW1wb3NzaWJsZSBmb3IgdGhlIGNvbXBp
bGVyIHRvIGRvIHdpdGggdGhlIG1lbW9yeSBjbG9iYmVyIGluIHRoZQ0KPj4+IGFzbSgpLiBBbmQg
d2hpbGUgdGhlIHN0cmluZyBsaXRlcmFsJ3MgYWRkcmVzcyBpcyBsaWtlbHkgY2hlYXANCj4+PiBl
bm91Z2ggdG8gY2FsY3VsYXRlIHJpZ2h0IGluIHRoZSBmdW5jdGlvbiBpbnZvY2F0aW9uIHNlcXVl
bmNlIChhbmQNCj4+PiBhbiBvcHRpb24gd291bGQgYWxzbyBiZSB0byByZXRhaW4gdGhlIHByaW50
aygpIGluIHRoZSBjYWxsZXIpLA0KPj4+IG90aGVyIGluc3RydW1lbnRhdGlvbiBvcHRpb25zIGNv
dWxkIGJlIHVuZGVybWluZWQgYnkgdGhpcyBhcyB3ZWxsLg0KPj4gUmlnaHQgbm93LCB0aGUgY29t
cGlsZXIgaXMgZnJlZSB0byBjYWxjdWxhdGUgdGhlIGFkZHJlc3Mgb2YgdGhlIHN0cmluZw0KPj4g
bGl0ZXJhbCBpbiBhIHJlZ2lzdGVyLCBhbmQgbW92ZSBpdCB0aGUgb3RoZXIgc2lkZSBvZiB0aGUg
VExCIGZsdXNoLsKgDQo+PiBUaGlzIHdpbGwgd29yayBqdXN0IGZpbmUuDQo+Pg0KPj4gSG93ZXZl
ciwgdGhlIGNvbXBpbGVyIGNhbm5vdCBub3csIG9yIGV2ZXIgaW4gdGhlIGZ1dHVyZSwgc3BpbGwg
c3VjaCBhDQo+PiBjYWxjdWxhdGlvbiB0byB0aGUgc3RhY2suDQo+IEknbSBhZnJhaWQgdGhlIGNv
bXBpbGVyJ3MgdmlldyBhdCB0aGluZ3MgaXMgZGlmZmVyZW50OiBXaGF0ZXZlciBpdCBwdXRzDQo+
IG9uIHRoZSBzdGFjayBpcyB2aWV3ZWQgYXMgdmlydHVhbCByZWdpc3RlcnMsIHVuYWZmZWN0ZWQg
YnkgYSBtZW1vcnkNCj4gY2xvYmJlciAob2YgY291cnNlIHRoZXJlIGNhbiBiZSBlZmZlY3RzIHJl
c3VsdGluZyBmcm9tIHVzZXMgb2YgbmFtZWQNCj4gdmFyaWFibGVzKS4gTG9vayBhdCAtTzMgb3V0
cHV0IG9mIGdjYzEyICh3aGljaCBpcyB3aGF0IEkgaGFwcGVuZWQgdG8NCj4gcGxheSB3aXRoOyBJ
IGRvbid0IHRoaW5rIGl0J3Mgb3Zlcmx5IHZlcnNpb24gZGVwZW5kZW50KSBmb3IgdGhpcw0KPiAo
Y2xlYXJseSBjb250cml2ZWQpIHBpZWNlIG9mIGNvZGU6DQo+DQo+IGludCBfX2F0dHJpYnV0ZV9f
KChjb25zdCkpIGNhbGMoaW50KTsNCj4NCj4gaW50IHRlc3QoaW50IGkpIHsNCj4gCWludCBqID0g
Y2FsYyhpKTsNCj4NCj4gCWFzbSgibm9wbCAlMCIgOiAiK20iIChqKSk7DQo+IAlhc20oIm5vcHEg
JSVyc3AiIDo6OiAibWVtb3J5IiwgImF4IiwgImN4IiwgImR4IiwgImJ4IiwgImJwIiwgInNpIiwg
ImRpIiwNCj4gCSAgICAgICAgICAgICAgICAgICAgICJyOCIsICJyOSIsICJyMTAiLCAicjExIiwg
InIxMiIsICJyMTMiLCAicjE0IiwgInIxNSIpOw0KPiAJaiA9IGNhbGMoaSk7DQo+IAlhc20oIm5v
cGwgJTAiIDo6ICJtIiAoaikpOw0KPg0KPiAJcmV0dXJuIGo7DQo+IH0NCj4NCj4gSXQgaW5zdGFu
dGlhdGVzIGEgbG9jYWwgb24gdGhlIHN0YWNrIGZvciB0aGUgcmVzdWx0IG9mIGNhbGMoKTsgaXQg
ZG9lcw0KPiBub3QgcmUtaW52b2tlIGNhbGMoKSBhIDJuZCB0aW1lLiBXaGljaCBtZWFucyB0aGUg
bWVtb3J5IGNsb2JiZXIgaW4gdGhlDQo+IG1pZGRsZSBhc20oKSBkb2VzIG5vdCBhZmZlY3QgdGhh
dCAoYW5kIGJ5IGltcGxpY2F0aW9uOiBhbnkpIHN0YWNrIHNsb3QuDQo+DQo+IFVzaW5nIGdvZGJv
bHQgSSBjYW4gYWxzbyBzZWUgdGhhdCBjbGFuZzE1IGFncmVlcyB3aXRoIGdjYzEyIGluIHRoaXMN
Cj4gcmVnYXJkLiBJIGRpZG4ndCBib3RoZXIgdHJ5aW5nIG90aGVyIHZlcnNpb25zLg0KDQpXZWxs
IHRoaXMgaXMgcHJvYmxlbWF0aWMsIGJlY2F1c2UgaXQgY29udHJhZGljdHMgd2hhdCB3ZSBkZXBl
bmQgb24NCmFzbSgiIjo6OiJtZW1vcnkiKSBkb2luZy4uLg0KDQpodHRwczovL2dvZGJvbHQub3Jn
L3oveGVHTWMzc005DQoNCkJ1dCBJIGRvbid0IGZ1bGx5IGFncmVlIHdpdGggdGhlIGNvbmNsdXNp
b25zIGRyYXduIGJ5IHRoaXMgZXhhbXBsZS4NCg0KSXQgb25seSBpbnN0YW50aWF0ZXMgYSBsb2Nh
bCBvbiB0aGUgc3RhY2sgYmVjYXVzZSB5b3UgZm9yY2UgYSBtZW1vcnkNCm9wZXJhbmQgdG8gc2F0
aXNmeSB0aGUgIm0iIGNvbnN0cmFpbnRzLCBub3QgdG8gc2F0aXNmeSB0aGUgIm1lbW9yeSINCmNv
bnN0cmFpbnQuDQoNCkJ5IGRlY2xhcmluZyBjYWxjIGFzIGNvbnN0LCB5b3UgYXJlIHBlcm1pdHRp
bmcgdGhlIGNvbXBpbGVyIHRvIG1ha2UgYW4NCmV4cGxpY2l0IHRyYW5zZm9ybWF0aW9uIHRvIGRl
bGV0ZSBvbmUgb2YgdGhlIGNhbGxzLCBpcnJlc3BlY3RpdmUgb2YNCmFueXRoaW5nIGVsc2UgaW4g
dGhlIGZ1bmN0aW9uLg0KDQpJdCBpcyB3ZWlyZCB0aGF0ICdqJyBlbmRzIHVwIHRha2luZyB0d28g
c3RhY2sgc2xvdHMgd2hlbiB3b3VsZCBiZQ0KYWJzb2x1dGVseSBmaW5lIGZvciBpdCB0byBvbmx5
IGhhdmUgMSwgYW5kIGluZGVlZCB0aGlzIGlzIHdoYXQgaGFwcGVucw0Kd2hlbiB5b3UgcmVtb3Zl
IHRoZSBmaXJzdCBhbmQgdGhpcmQgYXNtKCkncy7CoCBJdCBpcyB0aGVzZSB3aGljaCBmb3JjZQ0K
J2onIHRvIGJlIG9uIHRoZSBzdGFjaywgbm90IHRoZSBtZW1vcnkgY2xvYmJlciBpbiB0aGUgbWlk
ZGxlLg0KDQpPYnNlcnZlIHRoYXQgYWZ0ZXIgY29tbWVudGluZyB0aG9zZSB0d28gb3V0LCBDbGFu
ZyB0cmFuc2Zvcm1zIHRoaW5ncyB0bw0Kc3BpbGwgJ2knIG9udG8gdGhlIHN0YWNrLCByYXRoZXIg
dGhhbiAnaicsIGFuZCB0aGVuIHRhaWwtY2FsbCBjYWxjKCkgb24NCnRoZSB3YXkgb3V0LsKgIFRo
aXMgaXMgYWN0dWFsbHkgZGVsZXRpbmcgdGhlIGZpcnN0IGNhbGMoKSBjYWxsLCByYXRoZXINCnRo
YW4gdGhlIHNlY29uZC4NCg0KfkFuZHJldw0K

