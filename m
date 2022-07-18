Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACFF578825
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 19:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369949.601583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDUHf-00026Q-L6; Mon, 18 Jul 2022 17:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369949.601583; Mon, 18 Jul 2022 17:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDUHf-00024C-IC; Mon, 18 Jul 2022 17:11:51 +0000
Received: by outflank-mailman (input) for mailman id 369949;
 Mon, 18 Jul 2022 17:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDUHd-000246-I7
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 17:11:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b29074fb-06bc-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 19:11:46 +0200 (CEST)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 13:11:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5505.namprd03.prod.outlook.com (2603:10b6:208:299::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 17:11:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 17:11:40 +0000
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
X-Inumbo-ID: b29074fb-06bc-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658164306;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bpEeEnMoazSH37zmBTpeDyfR94GPgA7oxIZzCUgfafM=;
  b=bSc97eIMOOYFflSI22S+hAYir6H1rUL8RK+LkLHDjp/ZcMeGZCdg/RTA
   T/wMh7niPp5SgG8NNnVNWijxuPaBMAdkpiqJhBs6Ai5wLwGrzr7vHTrBi
   mK0KoG/T97cZnEp1kv0uODIi3/TY0GuXo+OmP15HCSRWeeHNLYRsKgup6
   s=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 76060007
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hDZPVqiMDRiIVtqTs3JBfucDX161VREKZh0ujC45NGQN5FlHY01je
 htvXjyPaP+ONjP2eNkkb9ji9xwF6sCGyodjQQo+rylhFnwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kur6GtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eY85C9MhFPD51r
 NcGcCIvXhemqevs6efuIgVsrpxLwMjDGqo64i0l6A6DSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsH8xTM+vZfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i3y3rGXxXukMG4UPJ6Ey9dJkkLC/TEaWEYXX1mxi8mzuHfrDrqzL
 GRRoELCt5Ma9kWtQsPsQh6Qr3uNvxpaUN1Ve8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTrKR9dnVauq1Nv8HGmsx
 yjQ9XdiwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBf8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:xcDFs6+DnJebvU7pRxZuk+F7db1zdoMgy1knxilNoENuH/Bwxv
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
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="76060007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANnFqDytOVrpsd726MqAeRdkc+Nwox9cNhlS7ppaSca1HncMw+boW4ye7OVYqICivsJJe49Do554EXxKtiZ3pk2A47EpHwi4kgIJv+2dYCqGcDkB8PqNTViFAzUtegDkCDPPVdJG2vf4+4Xixck/IM+2T/d8sBAiw7Kbo90K4h1vk0VSk9hW8uQ6cNZEqpCt0wOxwkP2PoOjI2Rkz/lLpoN17OdkSQ+yIVn9aHjCEIDZy3xOWyiC8UiPI9mG+xktZVzW1kF2bjB0wV3NO5csQ46w439SQ/UjGiL39dxJ3jnKorDN2nqqxvMi3bHJxa+PjK9UaKEvDkZVkABJd4Jyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpEeEnMoazSH37zmBTpeDyfR94GPgA7oxIZzCUgfafM=;
 b=LnMN5HNjdRcl50njd9wNTQGaHZUGXrB2OJUMBQQO+ugErDowzAyggiEWC98P65sZZ1FcEd6nna0T0m5mn8SSDTS0ebuYrZDg+pcwkWTJPfTedJ/rvHReaGr43OQAhw6B9QpMqw4kUjCUPf/rj73GuqNCVJmzZlOB8Et3N8bgQEnb1lqlr/9MaZlJMrlq8iC5MnM1volgv8TkoM5yvzQCFRe3q8ZV5PJ+YDfUMDxJsFEEslY5ltG4mlYLyB7L32HS2Gbj/iGzBkKn/ko3Up03ZtyFT0y7IB47RT0zCwMwNpXvdF+zC6/D6q1iSRdPGvvI2fGMMX0tT2umgb81NrTLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpEeEnMoazSH37zmBTpeDyfR94GPgA7oxIZzCUgfafM=;
 b=tD/vhFsyfPhRU6yqTz2w+HXGATXddZAflvsI9UX4EnWl8hESC0QXh6ML5ojesNl17KXdrut4sjTlP5xfcQ2eLMEZZxfDoDXUvqVwWbPFm+vwBYJIFZR7m7cw46MB//wVzLKVWKTas2jcgEYDbQPavqY8yLsR1gIRblLf30PZnOI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Add MMIO Stale Data arch_caps to hardware domain
Thread-Topic: [PATCH] x86: Add MMIO Stale Data arch_caps to hardware domain
Thread-Index: AQHYmq9yYQzuH8tiwky2K0QD3c10L62ELQqAgAAEr4CAACvLgA==
Date: Mon, 18 Jul 2022 17:11:40 +0000
Message-ID: <508d27ef-0a8f-5436-1cec-831910a27dc1@citrix.com>
References: <20220718140517.14771-1-jandryuk@gmail.com>
 <3842b4a4-c059-1eb3-c292-f53c5357e502@suse.com>
 <CAKf6xps4okaLz8Awi5987cFmKpc1GYsHYYQbJoedOYu0OmyDOA@mail.gmail.com>
In-Reply-To:
 <CAKf6xps4okaLz8Awi5987cFmKpc1GYsHYYQbJoedOYu0OmyDOA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67af4cc0-1d68-4b86-12b9-08da68e09490
x-ms-traffictypediagnostic: BLAPR03MB5505:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OH/WHOrHU+K5FPboRb8aXwEQyOS6CYJTjV53N9XiOTVmsHpQm7UYSXXVXoBbYqlcaVRzskGMKiIFuWIQR+xfOkT6dynYgh0JOgbCa0rUi99jOQHKP6eIzTf91rSH7Iw9U5c/Kno9QPXowegRZCiOj/3I5tVrV1IEIuzWcpPnXw+6CRKzndtFqEtQs8uTqbFR+HNxWqhSk7tg69Oj+CRRRYhb+ZSXHWUiK4E0fnst+3b6pxEP5ZCoZ52xbS3Iaulb5ZqA5Cg0nuZ1vl+QU2I9aX5g9QRiG6O6yu0CeInFfpmn6hI1PJ7GU+7yRg0IaeGa4jBeuyXAzcVgA9MDrZBxubmXxc/lLEHce1D8a/f6Q/gGSaPl0W6ASfEDrKY1JK61m13y3fSwdpWMs803hvoRrIdnGwFMzOZWH9LsMC/vCtTRqrz9Kq9GfiZeq7qHGlEjxnugPJlYBL7l4OoJZm/2a3f57ldm/l2w98S7Nb/5wNQPUvHwAOUTk6w73DcstbTE3AfqHkDCiq2DLzwuQSegOUIJ/rpMQMKYbqG7TASvwq++3MWEeIMGS6D6+DD8JqcABi+1qPhhstF8imsu7GiDBH3xhJIu36fZfaFNKOgjSUEwrC9IZrJIIgmbbJ9M9IvmUfL5G8s2QWmF3+iZvPWo+HopC08RPlpGAsULqzty3I1qs3inKaXGK0pEJPibj2SKgL6YUEPX0IrTtsaHAqG7kiH1UWtvY+QnSq4Fh0Oam/F/1OI6VyysK/GV1WDCfDB3SDP2/tMnlzbTMxcHLozXPbBBq6MHC+76J6XoAaqsD+GaQOducWMEfJRpucsEocW7Ozma/dLQMnIjEK3om/5NgGiTZmA2kk1gbWyKOqq5h6mP5tCGm2IH4G4DNGC9ggRF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(110136005)(478600001)(66476007)(8936002)(66946007)(91956017)(64756008)(66446008)(4326008)(31686004)(76116006)(71200400001)(66556008)(8676002)(86362001)(316002)(6486002)(54906003)(38070700005)(31696002)(2616005)(36756003)(38100700002)(6506007)(53546011)(2906002)(26005)(6512007)(122000001)(41300700001)(82960400001)(5660300002)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MW0wWDdKMFluSml6MGE3ZklyQ1JLbWlqTXNQRTZLVG1oa2tJUzV4RlhzVWFk?=
 =?utf-8?B?WjRpbVNBdEI5Q1JpSjRybTRhaEx1QU9MajlTWWo2dUt1b1N2UGJsSjYwa1V1?=
 =?utf-8?B?b2VaWTRvM0R3OGJtYmVLYnAydFZ5MFBqa0JkZkJHbFg3ZEppU0pieUNqbVFI?=
 =?utf-8?B?bDRhZ3ZyR1JWMk92T29xYklKcksrTzNxWFhYS0xRdEhUMmJzdE14SjY5K2l0?=
 =?utf-8?B?K01JVjkrcU80U212a01EeXBRcmhEMDJrRXErSzA3RVdHM2F4ZzZ3andUYzRa?=
 =?utf-8?B?WU54VlNwVWhUNzNIMytBaTVPMGRFN0ZlNSs2NjRnVTRpdFBrelBBdHFZL2Fh?=
 =?utf-8?B?eHdCdkZIc0loclBrQkhtdG9HL1NCSFlqZ01GcitDNlNiZ3p1RmdHNHpiZEU2?=
 =?utf-8?B?amN6N2FWY2dzT3NEWkc0OE15RUN2RkQ1U0dRQUl1Q3NublZzeFN1K1J4L0V2?=
 =?utf-8?B?QW1BR3h0Qmx4emUwNFVIVUtaVG5UbG45V2NKREJKbTBiVDRDSlIySjhqZ2gx?=
 =?utf-8?B?dlR4VWdtVWNQeWRMdFlsN1RYSkI2T05hc3k0TzN5aHlJVmRNTXVxSnRZemRp?=
 =?utf-8?B?cVRIUmJlYXVQUnRrWStKLzZuOEZNTW4zOGdlMlJ4azAyUlA1YUNqV21YVzJu?=
 =?utf-8?B?eTNBaHJNUU9MUWc2bG5GOXJKVzRhZERGdjA1RlJuK3FaT3VIZWxmb1JSLy93?=
 =?utf-8?B?YldYVVJsVytUVHhuYnM2anJka1VhU1IxVzVHRWlqck9VZG1BZjJMcVc4cEp3?=
 =?utf-8?B?eTljQXhNTUFDMi9MdjVLazNaMFNJZnpsdDNBd1hsWjJrUVZiT1BscnRUaXJU?=
 =?utf-8?B?ZWI1Umc5bmorSEZFREdSUWRmM2FaUUN1UmE2dWtCd0IzaG9aR3pyL2piSkVk?=
 =?utf-8?B?czlYQ0lIYldkL0JjVnpzYXJsMy9sSnhpa1MyZ0c5YmJ3b2ZWYXUrR0NuNW1L?=
 =?utf-8?B?US9hV2gvRW1vU3ZMbGhJNURoUGYzZFI3aDN3d212S3VxbkpDTU15cXAzckRD?=
 =?utf-8?B?b0M2ZFhBVzlONlg1OENUYkZCWTNJb3c4Y0EydWx4N0tzcXdwZmVaeHNrRXNP?=
 =?utf-8?B?OEt2SU5xNHYzY2VlbG0rWmxkbVBPSWV6dGZITndlSzYzWXd3dDBVeHhPMGdX?=
 =?utf-8?B?dUo4NzZGNkNvWkNQZkNtM0tPcEhuNXhpaE9aVU51ZWdJbFZuODQrYlg4MHJI?=
 =?utf-8?B?WTRwZk16aU5rc0VyaC83Qnhwa3loeGg0WWhPQ3oxWHBuRTFsSXkzR3dielZ5?=
 =?utf-8?B?Q2JOWGx6TkZHeXJ3WW9GVjd2YkNzUFk4R1RPZTUyZm5pVmZ2eHhYWkRJUHhT?=
 =?utf-8?B?TGdvT0kvVXNRalpycG1mZ0dnUHExbW93SXUvRzlmdjZKK0Exb1hYOFFJNG5S?=
 =?utf-8?B?N1g0aStvM3ZSNUNzMklKWW1TdXFscFM4RjEyTWVjOHpFeFNzT2wyK2ZMNXdy?=
 =?utf-8?B?WjdSQTFGTkZKTEZ2bDNzQWRFcndQZWZIMnFPUUVtRFVOZUlDTFhIblorWGZ2?=
 =?utf-8?B?eHZRM3NiSkdvYTErdFl3R1RZQ3ZYemRLV3FHZGRmeXdQWlNQZlIwZjBxM3ZB?=
 =?utf-8?B?bVdkWCt1Nlp1U2lZbDhobEtHTXdmMS9IUDR1RWt0WVVaU1NWY1NqMUlkTUxD?=
 =?utf-8?B?SnJTOTlGL2JtL1doVExsR2lVM3NVcFRLaXNxWTVPajBJVWxpVVkzeVJZUFRZ?=
 =?utf-8?B?eWs4dWpuSkFXL20rUi9jSUpnSFFxS01yeXIyYUFpMnE1VGJvSnhuMmlPbkIw?=
 =?utf-8?B?N1BPNUZNbnVnelRXakNtL3djS3B5ODU3aTIraCt2R0dQbGVRQzg3N2M0K1Nq?=
 =?utf-8?B?TW5TU1dPS0RkMndvcFJOOEJYWkZSSUJyUTlIcGNyNnVucDJEbXpUcGdlVkFq?=
 =?utf-8?B?OE15L001azBCMURyL0hoc2w5cTl3VWFkTXNnaE5kc0JoR3lQeXFzOGprYmNm?=
 =?utf-8?B?YmtYdTcwU2NZd3ExcjVNek12S0tkdVRMczY0RlZvYzZzN0M4Rk9kdVgrVDU2?=
 =?utf-8?B?RUxmOTM3dEhSQTVQWGpQT093NlJKckJPbGgwcGdvaUo1MlRkT2FlVjVkOXFY?=
 =?utf-8?B?enJMcXhDaDcxWXphNlRPSHJQK0FNd3JPZDQzVEZmWlp0bjFJWm5rVUczUnBv?=
 =?utf-8?B?NmtxcUcxaVFDcFdiL3lvd050dHB2TjRnNllWbGh0MHdidlJjREhva2ZNb3J1?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB8AF39C3157F94DA3514DB67247F0E0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67af4cc0-1d68-4b86-12b9-08da68e09490
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 17:11:40.0623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEReWpVw0CQ5Ziuwis8YsCfZiH3J/xUEpyH9tlwKrEitITXntG6hfta2c0MaAm8mp10iBwSrNvh18ydZEcwQAncx31wldRn4AUmLJ7xXA7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5505

T24gMTgvMDcvMjAyMiAxNTozNCwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gT24gTW9uLCBKdWwg
MTgsIDIwMjIgYXQgMTA6MTggQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToNCj4+IE9uIDE4LjA3LjIwMjIgMTY6MDUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+Pj4gTGV0
IHRoZSBoYXJkd2FyZSBkb21haW4ga25vdyBhYm91dCB0aGUgaGFyZHdhcmUgaXQgaXMgcnVubmlu
ZyBvbi4gIFRoaXMNCj4+PiBhbGxvd3MgYSBsaW51eCBEb20wIHRvIGtub3cgdGhhdCBpdCBoYXMg
dGhlIGFwcHJvcHJpYXRlIG1pY3JvY29kZSB2aWENCj4+PiBGQl9DTEVBUi4gIC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L3Z1bG5lcmFiaWxpdGllcy9tbWlvX3N0YWxlX2RhdGENCj4+PiBjaGFuZ2Vz
IGZyb206DQo+Pj4gIlZ1bG5lcmFibGU6IENsZWFyIENQVSBidWZmZXJzIGF0dGVtcHRlZCwgbm8g
bWljcm9jb2RlOyBTTVQgSG9zdCBzdGF0ZQ0KPj4+IHVua25vd24iDQo+Pj4gdG86DQo+Pj4gIk1p
dGlnYXRpb246IENsZWFyIENQVSBidWZmZXJzOyBTTVQgSG9zdCBzdGF0ZSB1bmtub3duIg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPg0K
Pj4+IC0tLQ0KPj4+IFNob3VsZCBjYWxjdWxhdGVfaG9zdF9wb2xpY3koKSdzIGFyY2hfY2FwcyBt
YXNrIGFsc28gYmUgdXBkYXRlZD8gIFRoZXkNCj4+PiBhcmUgbm90IGlkZW50aWNhbCB0b2RheSwg
YnV0IEknbSBkb24ndCBrbm93IHRoaXMgY29kZSB0byB1bmRlcnN0YW5kIHdoeQ0KPj4+IHRoZXkg
ZGlmZmVyLg0KPj4gSSB0aGluayB0aGlzIHdhbnRzIHVwZGF0aW5nIHRvbywgeWVzLiBJJ20gYWZy
YWlkIEkgaGF2ZSB0byBsZWF2ZSBpdCB0bw0KPj4gQW5kcmV3IHRvIHByb3ZpZGUgdGhlIHJlYXNv
bnMgZm9yIHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB0d28uDQo+Pg0KPj4gSSB3b3VsZCBm
dXJ0aGVyIHN1Z2dlc3QgdG8gYWxzbyBjb25zaWRlciBhZGRpbmcgUlJTQkEgYW5kIEJISV9OTywg
ZXZlbg0KPj4gaWYgdGhlbiB0aGUgdGl0bGUgd291bGQgd2FudCBhZGp1c3RpbmcuIEFuZCBmaW5h
bGx5IEknZCBsaWtlIHRvIGFzayB0bw0KPj4gYWRkIGEgcHJvcGVyIEZpeGVzOiB0YWcgKG9yIG1v
cmUpLCBhcyBpdCBsb29rcyBsaWtlIHRoZSB1cGRhdGluZyBoZXJlDQo+PiB3YXMgc2ltcGx5IGZv
cmdvdHRlbiB3aGVuIHRoZSBiaXRzIHdlcmUgaW50cm9kdWNlZC4gSWRlYWxseSB3ZSdkIGhhdmUN
Cj4+IGEgd2F5IGZvciB0aGUgY29tcGlsZXIgdG8gcmVtaW5kIHVzIG9mIHVwZGF0ZXMgYmVpbmcg
bmVlZGVkIChvciBhdA0KPj4gbGVhc3QgYmUgY29uc2lkZXJlZCkgaGVyZS4NCj4gVGhhdCBhbGwg
c291bmRzIGdvb2QuDQoNClRoaXMgaXMgYWxsIG9uZSBnaWFudCBoYWNrIGJlY2F1c2Ugb2YgdGhl
IGZhY3Qgd2UgZG9uJ3QgdmlydHVhbGlzZQ0KTVNSX0FSQ0hfQ0FQUyBwcm9wZXJseSBmb3IgZ3Vl
c3RzIHlldC4NCg0KRnVydGhlcm1vcmUsIExpbnV4J3Mgc3lzZnMgZmlsZXMgYXJlIGxhcmdlbHkg
bm9uc2Vuc2UgaW4gYSBQViBndWVzdC7CoA0KIlNNVD11bmtub3duIiBpcyBhIGdvb2QgZXhhbXBs
ZSwgYnV0IG90aGVycyBuZWVkIGhlbHAgdG9vLg0KDQoNClRoZSBjYWxjdWxhdGVfaG9zdF9wb2xp
Y3koKSBsaXN0IGRvZXMgd2FudCB1cGRhdGluZy7CoCBUaGF0J3MgbXkgZmF1bHQNCmZvciBmb3Jn
ZXR0aW5nOyBpdCdzIHRoZSBmaXJzdCBNU1IgImZlYXR1cmUgbGVhZiIgYW5kIG5vbmUgb2YgdGhp
cyBpcw0KY2FsY3VsYXRlZCBhdXRvbWF0aWNhbGx5Lg0KDQpUaGUgcmF3IGFuZCBob3N0IHZhbHVl
cyBhcmUgZXhhY3RseSBhcyBwZXIgQ1BVSUQuwqAgcmF3ID0gcmVhbCBDUFUNCnZhbHVlcywgaG9z
dCA9IHN1YnNldCB0aGF0IFhlbiB1bmRlcnN0YW5kcy4NCg0KSW4gcmVhbGl0eSwgdGhlcmUncyBh
IGxvdCBvZiBoYXJkd2FyZSB3aGVyZSBtb2RlbCBjaGVja3Mgc2hvdWxkIGNhdXNlIHVzDQp0byBz
eW50aGVzaXplIGJpdHMgaW4gdGhlIGhvc3QgcG9saWN5IHdoaWNoIGFyZSBtaXNzaW5nIGluIHJh
dywgYnV0DQpkb2luZyB0aGF0IG5pY2VseSBzdGlsbCBkZXBlbmRzIG9uIHVudGFuZ2xpbmcgbWlj
cm9jb2RlIGxvYWRpbmcgZnJvbQ0KeG1hbGxvYygpIHNvIHdlIGNhbiBzb3J0IHRoaW5ncyBvdXQg
bXVjaCBlYXJsaWVyLg0KDQpJIGFncmVlIHdpdGggSmFuIHRoYXQgZG9tMCBzaG91bGQgc2VlIFJS
U0JBIGFuZCBCSElfTk8uwqAgVGhlIGZvcm1lcg0Kc2hvdWxkIGJlIGVudW1lcmF0ZWQgZnJvbSBB
REwvU1BSIHdoZXJlYXMgSSBoYXZlIG5vIGlkZWEgd2hlbiBCSElfTk8NCm1pZ2h0IGxhbmQuDQoN
Cn5BbmRyZXcNCg==

