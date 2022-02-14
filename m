Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F414B5819
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 18:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272565.467460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJerQ-0001Cm-2H; Mon, 14 Feb 2022 17:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272565.467460; Mon, 14 Feb 2022 17:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJerP-0001AP-UL; Mon, 14 Feb 2022 17:09:59 +0000
Received: by outflank-mailman (input) for mailman id 272565;
 Mon, 14 Feb 2022 17:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5JaK=S5=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nJerN-0001AJ-Nh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 17:09:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eda4c854-8db8-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 18:09:55 +0100 (CET)
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
X-Inumbo-ID: eda4c854-8db8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644858595;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6mBhT/QHqsrJau3daLLYBELJyyfB2AO7EiWvjjjskAo=;
  b=A/mxqXfGACWZt6tLVRAmjwb0oZ0SMT6RCT+STG/2e5c3zX/EEZkSxv/H
   t21f5XE9y01ZM4cqGOU2OwyXThnz5L7DtFkCCzTgQus/ZEZD6yY8NPrDf
   ycfS+RvUebIxMQmef1AFVpDpwm3MMnp102zqNMkEOr1lYLRnppPbbkBJd
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8zTy8LQrqf3VLyyxjyEMmTin4I8FVSJ6qiJS7LgAGz9hIMlvL4V0I2EGzYNK4FfswPv6Kjr7jM
 w5wQNha/tspL6xZSTS0GM0ZU6bNukWAPRWMH2G8kLW+eUaq6JjKLbeP1MBnODku+pD0svANOHH
 aju69g67oHgYK+gNwnlNN6sKd+U36rPRBvwdYPcdmIU8nP5GH9zN8OyqSxeWbbaXROX0OkD0DH
 QohWHFo1KJruB3DJnsTXI/Pg+NQAWQ8RQk1tlyDFHLXshF7UknMRDoEQgmGLNMthgWGdfkJ16v
 +SVcusWISyx4KYR+xH0rym5c
X-SBRS: 5.1
X-MesageID: 64175853
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wGVF9KO6i1F9U/nvrR3MkcFynXyQoLVcMsEvi/4bfWQNrUor0zQCz
 zNNXWuFaa2MM2SjfN53aN6w8htQ7ZTVytUxQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxqSouhf2
 dlVjK65ZT0nYYiLuacfUwYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YstlgMllCcDvNYcWvHxIxjDFF/c2B5vERs0m4PcGgG5v25ATRp4yY
 eIpcRhoNlfLTSZkN3UnEJZkkfqWl2fgJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQZBQcKT1K9rb+8g1SnRtNEA
 0UO/2wlqq1a3E+mUNj7GQG5qXisvxgAVt4WGOo/gCmP16yS5Q+aD2oFSzdpado6uctwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9vprZw3jxnPZs1+C6PzhdrwcRnvx
 xiaoS54gK8c5eYJyqG68Fbvkz+q4J/TQWYd5ArNWXm+xhhkf4PjbIutgWU39t4ZctzfFAPY+
 iFZxY7Ot4jiEK1higSiW9g1MqCl/8+3ORHmjwFKWLhi9TSyrivLkZ9r3BlyI0JgM8AhcDDvY
 VPOtQ452KK/LEdGfocsPdvvVp1CIbzIUI28C6uKNoYmjo1ZKVfflByCc3J8yIwEfKIEtagkc
 amWfs+3ZZrxIfQ2lWHmLwvxPFJC+8zf+Y8xbc2hp/hE+eDHDJJwdVviGAHQBt3VFIve/G3oH
 y93bqNmMSl3XuzkeTXw+oUON10MJnVTLcmo95AIJr7ef1I/QztJ5xrtLVQJIdINokiovr2Qo
 iHVtrFwlDITekEr2S3VMys+OdsDrL50rG4hPDxEALpb8yNLXGpb149GL8FfVeB+rIRLlKcoJ
 9FYK5ToKqkeEVzvpmVCBaQRWaQ/LXxHcyrVZHH7CNX+FrY9LzH0FijMIFexqnlUU3bfWAlXi
 +TI6z43iKErHmxKJM3XdOiu3xW2u30ck/h1REzGPp9Yf0CEzWSgA3aZYiYfL55eJBPd6CGd0
 grKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SLhJEdtqBEyrJDlxGxX
 0aDpotTNbmTYZu3G18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXUEfrVvMY4jz
 eMwg+Is6lSy2kgwL9KLriFI7GDQfHYOZLoq68MBC4jxhwt1llwbOc7ACjX76Y2kYslXNhV4O
 SedgafPiugOxkfGdHZvR3HB0fAE2MYLsRFOilQDO06IipzOgfpuhE9d9jE+TwJ0yBRb0r0sZ
 jg3ZhMtfajerS11gMVjXny3H1ATDRKUzUX91l8VmTCLVEKvTGHMcDUwNOvlEJr1KI6Akuy3J
 I2l9Vs=
IronPort-HdrOrdr: A9a23:Deylc6+/AUy76/sGf9huk+F7db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFr7X5To3SIDUO31HYbb2KjLGSjAEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadh/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHjWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNENyMIv/MmTvKe0Tt8gDg06t
 M740uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pVVFb/l/1rwKp5KuZJIMvB0vFtLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZNyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR52Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFAgFCvsukaSRloeMN4YDABfzP2zGyfHQ08n3KverKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="64175853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya113249/637716lcJDH3T/wygO/R2LJ2yJ2lIPoaGP6pvDlHun1akfXjuwGbakKMj0KzPv7Ib1xxPFySWxoXPivCqTo5Uqim+H2yjcOor2tW4wvGJ3uM/+z+brhNxeRA+zDig1ZY6+6Lg6c4ve+lgkirBAdl5xa/w+J2FXTUh8a86BGmenKZmQPHot/QCDRyWR+cTQJQd3bgSJqmDEqTwp4uHM4dMnXM46ABAS0r4OvWbk4YhDJkBM1prpHpnWZPg3JcEYguy46QfrX8dBU/RjnSK3SDnkUkGrPUfKYoe4COeuLABVgilvB/sXqAFqPnEUN2q1PmbIEOk903wWSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mBhT/QHqsrJau3daLLYBELJyyfB2AO7EiWvjjjskAo=;
 b=YlOAVX1ZvlJ9TecUXbSwcqzsfesi26v7wlKgH7kSmkS186zWS1usCuL5AO+SkZXG5Gzu2Kk1okX3nMfnZeTHTrB21mjQl+tqsZ6Nbk3GX8M4uwPrZexqxxaD5zAhojV9kZjv5FR/qkqVTPcgi/agk0zyHHDKqiw6K6lNdytMZNsdgGOpwBkjOYIiLxQ+dj4QChK/9X3Eh0B+lLBrn4GbuWG9xFgamo5NuItm046qGzsFhIY5NCFXWYhLMV1EvSj33ofiZtiMv9lo1Sjc3xT5nuIuqb5D+Y0HAf7TiGrii612bi+5VK6XzuRDdKU2HRdiefy1rgYdAYm1MkpuEDeTCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mBhT/QHqsrJau3daLLYBELJyyfB2AO7EiWvjjjskAo=;
 b=gJM5I9i9wP+AazIgLKNBjKDWtjZMgVmdxY4abhKLAoVR2fyjQh96ar1BYZ/8PzWIgaqqYodsWWpzUhxe9hykfPnMH4+NuxKWQ+uS4ck+wmlktM7Wx3b78sZAJ8WFwgHJ1zsMSwHOGGM3vP4fj9ElBbOfWmnglhqugFg9kpBlSsA=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYHE+TdJl64aH33EedeR0PZ4zblKyMkj6AgAGTLwCAABdDgIAABJKAgATOw4CAAAIAAIAAQJgA
Date: Mon, 14 Feb 2022 17:09:49 +0000
Message-ID: <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
 <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
In-Reply-To: <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 041e4341-9f6b-4320-f096-08d9efdccf6a
x-ms-traffictypediagnostic: SA1PR03MB6609:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <SA1PR03MB660916B48251B3C175585EBD81339@SA1PR03MB6609.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: goc0RZG20J8GPxDPgBAkfjjWF5f1rKMsqMaOUwyT2QzIKSV+HG4rvspyDd4gH4fGN5BDfcmf9YbGK2JeXIJDQSOuechsekzaoKk6ioKBb7OTeMHjYJA89NgN6+05W5OrTJajaFJ2gNRAbUr+2U9hzYF7uWba80WQqfPqk9MEyH9dfgDJky2jF1bt1TpzcH8EiUI6jY9f4Wm8lZioLjVyfpHf29cUOQzMBpVaClgcumcYsX2PCqaPi7eK82F/4H6tlzBqCp+cDSSbT7YQSXUGiYwTSW3QXzrqiABumLjCE8uZZeChm1eoUFYjVvC7RnrXC5wcqa4th7lfkPKSKH1Idi2t3jxC2IWtltjpYJTWPu38z89t6UISRb1jHZdI4guaBL2ZJDHXeARVDHLeEvysyeQgbLnZNik15jwGH6KpdhN8ZxgWh8o/LTC6LXW0Qf07A8FOOQe05kkdhxvVcDk5R6bq4mvS5Ts4l+2NDdZTvSNxUYeFkcBnQs9x73++i29xTSdZBLNC93JjCaAyy5vd/+rybuFnNYxA59ad7qrWUUQ7WSd317iKeYnMtnO7JpX/1uz6nwZkwlf3AQNofd6lpQiZ+fjrOIIWgXZtW18Ptz5omv1pEK36H7cVT2Zq/cNh8Xag3CbaqqWQmbA53j7fxHehUDs0IRY4oAKXLzodVJpFWbKU7pRabsiXj4Bi09FWozATp7a1goRA6bVPAINzqxcS6tX7cnE04vMsGVfIpZqAG4dnPn7TP9xn1TukI/2j
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(6636002)(54906003)(38070700005)(316002)(76116006)(8936002)(66946007)(66476007)(66446008)(64756008)(86362001)(66556008)(8676002)(4326008)(38100700002)(91956017)(26005)(107886003)(53546011)(6506007)(31696002)(2616005)(6512007)(122000001)(186003)(82960400001)(508600001)(2906002)(6486002)(71200400001)(83380400001)(36756003)(31686004)(7416002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amtMOThmaUxtaTVhT0ZzdUJCeXhtRnRhSDB5RTZDUHhxbDd0NnVyaEhQR0dT?=
 =?utf-8?B?UVJvVGVsRnpwVmVLbnE2NVpNSDhEb2JyL0VpRHJxOXFJYzNreVNMWFY5SXNz?=
 =?utf-8?B?Wkhha1Q4RWpNdStRcEVCZGw4R2ovMjhoMS9TeVNEY1ZDeEFHMjVuNDd6RE5N?=
 =?utf-8?B?SUxocDI4VWptYWl6NndtUmZEUlN6eGc0bzVEdDdEZUxyN1ZzdVVSNTdrNzNk?=
 =?utf-8?B?MzdzcHQzZzU0MktQeWNyN0FILzRnQlZXaEw1K1pGVW8vWTBvcHhkd29jZzVW?=
 =?utf-8?B?VnV1Ky9oTDhlSHFReHFTb3NrWitMcVhVakRLWDVBbi9WU01wcXkzNS83VFN5?=
 =?utf-8?B?TlRFYXJDNzNEWkZ0TnNCSHpzRmpxamlaNnQ1VWxSQXlJTExnenZTSloxSWI1?=
 =?utf-8?B?eGQzS2U0Q1lhbnRQU0RzY29wbVpPTWRWMjd5T0FNRnZVMmRRdkhncTJLVWhC?=
 =?utf-8?B?OVVzaCtYeEpRamJ0M3FuWFlJdks2ZzVyenUrSGpQZ1o3bTJ5SnVTMEh1UFlD?=
 =?utf-8?B?b1ZmWC83Uyt4b3o0UmxlVWJSS2N1RFlYbm1aUXBQTW5SenVoRFlRdXl6OC9H?=
 =?utf-8?B?RGt2RUs3T0dKMHRWRVJWeWg1cmlMeDM2aXZXaTZoVHFFdHo1KzBOZFlWQmR2?=
 =?utf-8?B?eXF2dUxQUmVvZHRzd2s0M3B3cEJaSUFUd3J1cnVDREovSUFkeGNIMFo1S3Vn?=
 =?utf-8?B?VVhiRGdyOU1SUU5veUdmYUk3VVBHNHkxQW1RWjV2WVFWNUFTT2ltYUR0d2x5?=
 =?utf-8?B?UlFzSXVjTXpIay9Ccm9lTFVaNWxBL2pzclBGQ3gzMC9JdzFDbzRHbkdOS1Av?=
 =?utf-8?B?eTFOc0NLNGNjOS9yeHBzcGhPcDhUdWVpTk1hRDMybDlWQng2QkZoUi8reU10?=
 =?utf-8?B?eVJhT1JISUJWQkR4b0VyQmhqK0Q0dFdnSmJwQkpCWlp1Z1Z4RTB6UHl1bytB?=
 =?utf-8?B?d1ZSSEdTTnNhdXpXc2VKaTV2alJ1RTA1bVFPZERJb3U3cE9iVnhNYmF0MUx6?=
 =?utf-8?B?VHlycjZiSm9LRytNL3BBeDZvdW16TmJhUUNMS0c1WktzczdSUW5wSzNNRnpk?=
 =?utf-8?B?ZnR2VjBXTGFzSWRRK1FpTXRPSUpTc3hyeWtob3RVRFdSaHBkUnNVTTZPNGNh?=
 =?utf-8?B?VnBXVUhUTWtVZmZMdU9mUDhnU2pYY0RQb0IyaTV2RFZldlNuYUJJeXFVWG13?=
 =?utf-8?B?bXRzTTJrV2ExTWkwUUxDSlowRldFRWlzTldvbEVCZ2YwejZJR2FTTTh3dWlK?=
 =?utf-8?B?VmNDS09SSlMwdFNTVXBzako2VEZpVlhDZHFLRnVSRE45YnBlalpSYnl0aUta?=
 =?utf-8?B?R3BGK2tEZ2hmSEVGTFljZDQyRWp4MTBnODZMY2JVaFhHQ0ovc3BxNjk4bUhS?=
 =?utf-8?B?YXQwdmVOVU81NXJsaElUeitrZTVhcWExV1JsZWZJK1FkY3Uxb2g2YnJhQWpj?=
 =?utf-8?B?bEhyY1VpS3ZuSzJEalNkdGRmbmtGaHdwTzhCYUorcTNqZGFjVktIWTdRMzRy?=
 =?utf-8?B?K0wxdDAzbTFuc0l5bGNkb0pxUVliSyszZ2ZZenNwOWwvY01JR0hXYVNKbk9v?=
 =?utf-8?B?QkYvNGdOVU1CbFd4bmJiNy9lR3hZTDZlZWhQTDZtdndNc01mRGFBaUNncUpQ?=
 =?utf-8?B?Ulp3RURUQmJCSU5QclRpaHpqbEhDMjBpMW1Sd3pIVmJmeStselhrS1kwYjVn?=
 =?utf-8?B?dTRtL0tINUsxYk45Y2o0K1k5Ym5ZMGxvNS9QcXVGYWlRZnJWNGtrbVNrU0pD?=
 =?utf-8?B?WGIvRTAzOUxMVDdoV2RiSHY3anB6ZXZiSTJpdDl3elZwSFJBTDNCc0tKbVJ2?=
 =?utf-8?B?RjVDZlNtNXpnOFE3OFA1YldvbkxuRS9TNW5SUS8yV2dOMWRVUzR3cy85QnA4?=
 =?utf-8?B?ZkVDWTZOOVdrVDh2cUJZa0tjNnRNSzhnakV1VHRMeEI5VS84SloxZ2pJYnha?=
 =?utf-8?B?SkFkMlJwSkMwZUNUYmcvT2cwUXBFdjZjUUh0aDhPWHNBa1Rtc0dsWFIyazIx?=
 =?utf-8?B?RC9jZWJ2Q08xbUc1YWpybHVJUCs0aDIxV0tOMWJlVUM3UHBMWEVhZmdzYjFY?=
 =?utf-8?B?Zk43NFdxVGYxMWNtU2VDd09aTVZqQ3BUWkFiUnd6Vm9XcS81aVBGOEtINFMr?=
 =?utf-8?B?dW51bjFUeFR6VVQvWGpkSnNiWFBYQ2t4WkxqS2diUkxacW1XbkVZRTlzWjdC?=
 =?utf-8?B?dnB1R0VaRFl1MWsxbDNNUzRnaXpYYzQ1VGdSOW16SmZNMkp5N1haZFNoQjVF?=
 =?utf-8?Q?A7CbzwHQ8ftZy6JOlOlQhfNE+jG3uGz5eBHeaEqQM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <549E9A66D9B6DF4C95052FDBBD1EDCAF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041e4341-9f6b-4320-f096-08d9efdccf6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 17:09:50.0590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXIIzb9Gl5bcAEGLERX2xLFInl/p66zPtNzXMrEX9RkToEioTJ/LJL8WLOzTjf8dxOtbWmVtAZ6ZnKoGnatwlZkVVRAIedIBwM53xwJJKio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6609
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDE0LjAyLjIwMjIgMTQ6MTEsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAxMS8wMi8yMDIyIDExOjQ2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBbQ0FV
VElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4NCj4+PiBPbiAxMS4wMi4yMDIyIDEyOjI5LCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBPbiBGcmksIEZlYiAxMSwgMjAyMiBhdCAxMDowNjo0
OEFNICswMDAwLCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+Pj4gT24gMTAvMDIvMjAyMiAxMDow
MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+PiBPbiBNb24sIEZlYiAwNywgMjAyMiBh
dCAwNjoyMTowMFBNICswMDAwLCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+Pj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgv
dm1jcy5jDQo+Pj4+Pj4+IGluZGV4IDdhYjE1ZTA3YTAuLjQwNjBhZWYxYmQgMTAwNjQ0DQo+Pj4+
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYw0KPj4+Pj4+PiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4+Pj4+Pj4gQEAgLTM0Myw2ICszNDMsMTUgQEAgc3Rh
dGljIGludCB2bXhfaW5pdF92bWNzX2NvbmZpZyhib29sIGJzcCkNCj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgIE1TUl9JQTMyX1ZNWF9QUk9DQkFTRURfQ1RMUzIsICZtaXNtYXRjaCk7DQo+Pj4+Pj4+
ICAgICAgICAgfQ0KPj4+Pj4+PiAgICAgDQo+Pj4+Pj4+ICsgICAgLyogQ2hlY2sgd2hldGhlciBo
YXJkd2FyZSBzdXBwb3J0cyBhY2NlbGVyYXRlZCB4YXBpYyBhbmQgeDJhcGljLiAqLw0KPj4+Pj4+
PiArICAgIGlmICggYnNwICkNCj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+ICsgICAgICAgIGFzc2lz
dGVkX3hhcGljX2F2YWlsYWJsZSA9IGNwdV9oYXNfdm14X3ZpcnR1YWxpemVfYXBpY19hY2Nlc3Nl
czsNCj4+Pj4+Pj4gKyAgICAgICAgYXNzaXN0ZWRfeDJhcGljX2F2YWlsYWJsZSA9IChjcHVfaGFz
X3ZteF9hcGljX3JlZ192aXJ0IHx8DQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5KSAmJg0KPj4+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVh
bGl6ZV94MmFwaWNfbW9kZTsNCj4+Pj4+Pg0KPj4+Pj4+IEkndmUgYmVlbiB0aGluayBhYm91dCB0
aGlzLCBhbmQgaXQgc2VlbXMga2luZCBvZiBhc3ltbWV0cmljIHRoYXQgZm9yDQo+Pj4+Pj4geEFQ
SUMgbW9kZSB3ZSByZXBvcnQgaHcgYXNzaXN0ZWQgc3VwcG9ydCBvbmx5IHdpdGgNCj4+Pj4+PiB2
aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgYXZhaWxhYmxlLCB3aGlsZSBmb3IgeDJBUElDIHdlIHJl
cXVpcmUNCj4+Pj4+PiB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIHBsdXMgZWl0aGVyIGFwaWNfcmVn
X3ZpcnQgb3INCj4+Pj4+PiB2aXJ0dWFsX2ludHJfZGVsaXZlcnkuDQo+Pj4+Pj4NCj4+Pj4+PiBJ
IHRoaW5rIHdlIGxpa2VseSBuZWVkIHRvIGJlIG1vcmUgY29uc2lzdGVudCBoZXJlLCBhbmQgcmVw
b3J0IGh3DQo+Pj4+Pj4gYXNzaXN0ZWQgeDJBUElDIHN1cHBvcnQgYXMgbG9uZyBhcyB2aXJ0dWFs
aXplX3gyYXBpY19tb2RlIGlzDQo+Pj4+Pj4gYXZhaWxhYmxlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhp
cyB3aWxsIGxpa2VseSBoYXZlIHNvbWUgZWZmZWN0IG9uIHBhdGNoIDIgYWxzbywgYXMgeW91IHdp
bGwgaGF2ZSB0bw0KPj4+Pj4+IGFkanVzdCB2bXhfdmxhcGljX21zcl9jaGFuZ2VkLg0KPj4+Pj4+
DQo+Pj4+Pj4gVGhhbmtzLCBSb2dlci4NCj4+Pj4+DQo+Pj4+PiBBbnkgb3RoZXIgdGhvdWdodHMg
b24gdGhpcz8gQXMgb24gb25lIGhhbmQgaXQgaXMgYXN5bW1ldHJpYyBidXQgYWxzbw0KPj4+Pj4g
dGhlcmUgaXNuJ3QgbXVjaCBhc3Npc3RhbmNlIHdpdGggb25seSB2aXJ0dWFsaXplX3gyYXBpY19t
b2RlIHNldCBhcywgaW4NCj4+Pj4+IHRoaXMgY2FzZSwgYSBWTSBleGl0IHdpbGwgYmUgYXZvaWRl
ZCBvbmx5IHdoZW4gdHJ5aW5nIHRvIGFjY2VzcyB0aGUgVFBSDQo+Pj4+PiByZWdpc3Rlci4NCj4+
Pj4NCj4+Pj4gSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IHRoaXMsIGFuZCByZXBvcnRpbmcgaGFy
ZHdhcmUgYXNzaXN0ZWQNCj4+Pj4geHsyfUFQSUMgdmlydHVhbGl6YXRpb24gd2l0aCBqdXN0DQo+
Pj4+IFNFQ09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfQVBJQ19BQ0NFU1NFUyBvcg0KPj4+PiBTRUNP
TkRBUllfRVhFQ19WSVJUVUFMSVpFX1gyQVBJQ19NT0RFIGRvZXNuJ3Qgc2VlbSB2ZXJ5IGhlbHBm
dWwuIFdoaWxlDQo+Pj4+IHRob3NlIHByb3ZpZGUgc29tZSBhc3Npc3RhbmNlIHRvIHRoZSBWTU0g
aW4gb3JkZXIgdG8gaGFuZGxlIEFQSUMNCj4+Pj4gYWNjZXNzZXMsIGl0IHdpbGwgc3RpbGwgcmVx
dWlyZSBhIHRyYXAgaW50byB0aGUgaHlwZXJ2aXNvciB0byBoYW5kbGUNCj4+Pj4gbW9zdCBvZiB0
aGUgYWNjZXNzZXMuDQo+Pj4+DQo+Pj4+IFNvIG1heWJlIHdlIHNob3VsZCBvbmx5IHJlcG9ydCBo
YXJkd2FyZSBhc3Npc3RlZCBzdXBwb3J0IHdoZW4gdGhlDQo+Pj4+IG1lbnRpb25lZCBmZWF0dXJl
cyBhcmUgcHJlc2VudCB0b2dldGhlciB3aXRoDQo+Pj4+IFNFQ09OREFSWV9FWEVDX0FQSUNfUkVH
SVNURVJfVklSVD8NCj4+Pg0KPj4+IE5vdCBzdXJlIC0gInNvbWUgYXNzaXN0YW5jZSIgc2VlbXMg
c3RpbGwgYSBsaXR0bGUgYmV0dGVyIHRoYW4gbm9uZSBhdCBhbGwuDQo+Pj4gV2hpY2ggcm91dGUg
dG8gZ28gZGVwZW5kcyBvbiB3aGF0IGV4YWN0bHkgd2UgaW50ZW5kIHRoZSBiaXQgdG8gYmUgdXNl
ZCBmb3IuDQo+Pj4NCj4+IFRydWUuIEkgaW50ZW5kZWQgdGhpcyBiaXQgdG8gYmUgc3BlY2lmaWNh
bGx5IGZvciBlbmFibGluZw0KPj4gYXNzaXN0ZWRfeHsyfWFwaWMuIFNvLCB3b3VsZCBpdCBiZSBp
bmNvbnNpc3RlbnQgdG8gcmVwb3J0IGhhcmR3YXJlDQo+PiBhc3Npc3RhbmNlIHdpdGgganVzdCBW
SVJUVUFMSVpFX0FQSUNfQUNDRVNTRVMgb3IgVklSVFVBTElaRV9YMkFQSUNfTU9ERQ0KPj4gYnV0
IHN0aWxsIGNsYWltIHRoYXQgeHsyfWFwaWMgaXMgdmlydHVhbGl6ZWQgaWYgbm8gTVNSIGFjY2Vz
c2VzIGFyZQ0KPj4gaW50ZXJjZXB0ZWQgd2l0aCBYRU5fSFZNX0NQVUlEX1gyQVBJQ19WSVJUIChp
biB0cmFwcy5jKSBzbyB0aGF0LCBhcyB5b3UNCj4+IHNheSwgdGhlIGd1ZXN0IGdldHMgYXQgbGVh
c3QgInNvbWUgYXNzaXN0YW5jZSIgaW5zdGVhZCBvZiBub25lIGJ1dCB3ZQ0KPj4gc3RpbGwgY2xh
aW0geHsyfWFwaWMgdmlydHVhbGl6YXRpb24gd2hlbiBpdCBpcyBhY3R1YWxseSBjb21wbGV0ZT8g
TWF5YmUNCj4+IEkgY291bGQgYWxzbyBhZGQgYSBjb21tZW50IGFsbHVkaW5nIHRvIHRoaXMgaW4g
dGhlIHhsIGRvY3VtZW50YXRpb24uDQo+IA0KPiBUbyByZXBocmFzZSBteSBlYXJsaWVyIHBvaW50
OiBXaGljaCBraW5kIG9mIGRlY2lzaW9ucyBhcmUgdGhlIGNvbnN1bWVyKHMpDQo+IG9mIHVzIHJl
cG9ydGluZyBoYXJkd2FyZSBhc3Npc3RhbmNlIGdvaW5nIHRvIHRha2U/IEluIGhvdyBmYXIgaXMg
dGhlcmUgYQ0KPiByaXNrIHRoYXQgInNvbWUgYXNzaXN0YW5jZSIgaXMgb3ZlcmFsbCBnb2luZyB0
byBsZWFkIHRvIGEgbG9zcyBvZg0KPiBwZXJmb3JtYW5jZT8gSSBndWVzcyBJJ2QgbmVlZCB0byBz
ZWUgY29tbWVudCBhbmQgYWN0dWFsIGNvZGUgYWxsIGluIG9uZQ0KPiBwbGFjZSAuLi4NCj4gDQpT
bywgSSB3YXMgdGhpbmtpbmcgb2YgYWRkaW5nIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2Y6
DQoNCis9aXRlbSBCPGFzc2lzdGVkX3hhcGljPUJPT0xFQU4+IEI8KHg4NiBvbmx5KT4NCitFbmFi
bGVzIG9yIGRpc2FibGVzIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1YWxpemF0aW9uIGZvciB4QVBJ
Qy4gVGhpcw0KK2FsbG93cyBhY2Nlc3NpbmcgQVBJQyByZWdpc3RlcnMgd2l0aG91dCBhIFZNLWV4
aXQuIE5vdGljZSBlbmFibGluZw0KK3RoaXMgZG9lcyBub3QgZ3VhcmFudGVlIGZ1bGwgdmlydHVh
bGl6YXRpb24gZm9yIHhBUElDLCBhcyB0aGlzIGNhbg0KK29ubHkgYmUgYWNoaWV2ZWQgaWYgaGFy
ZHdhcmUgc3VwcG9ydHMg4oCcQVBJQy1yZWdpc3RlciB2aXJ0dWFsaXphdGlvbuKAnQ0KK2FuZCDi
gJx2aXJ0dWFsLWludGVycnVwdCBkZWxpdmVyeeKAnS4gVGhlIGRlZmF1bHQgaXMgc2V0dGFibGUg
dmlhDQorTDx4bC5jb25mKDUpPi4NCg0KYW5kIGdvaW5nIGZvciBhc3Npc3RlZF94MmFwaWNfYXZh
aWxhYmxlID0gDQpjcHVfaGFzX3ZteF92aXJ0dWFsaXplX3gyYXBpY19tb2RlLg0KDQpUaGlzIHdv
dWxkIHByZXZlbnQgdGhlIGN1c3RvbWVyIGZyb20gZXhwZWN0aW5nIGZ1bGwgYWNjZWxlcmF0aW9u
IHdoZW4gDQphcGljX3JlZ2lzdGVyX3ZpcnQgYW5kL29yIHZpcnR1YWxfaW50cl9kZWxpdmVyeSBh
cmVuJ3QgYXZhaWxhYmxlIHdoaWxzdCANCnN0aWxsIG9mZmVyaW5nIHNvbWUgaWYgdGhleSBhcmUg
bm90IGF2YWlsYWJsZSBhcyBYZW4gY3VycmVudGx5IGRvZXMuIEluIA0KYSBmdXR1cmUgcGF0Y2gs
IHdlIGNvdWxkIGFsc28gZXhwb3NlIGFuZCBhZGQgY29uZmlnIG9wdGlvbnMgZm9yIHRoZXNlIA0K
Y29udHJvbHMgaWYgd2Ugd2FudGVkIHRvLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgaGVscCwNCg0K
SmFuZS4=

