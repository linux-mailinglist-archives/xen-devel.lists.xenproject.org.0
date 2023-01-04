Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87B65D226
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 13:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471151.730876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD2dE-00064F-DA; Wed, 04 Jan 2023 12:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471151.730876; Wed, 04 Jan 2023 12:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD2dE-00061m-AI; Wed, 04 Jan 2023 12:12:32 +0000
Received: by outflank-mailman (input) for mailman id 471151;
 Wed, 04 Jan 2023 12:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD2dC-00061g-NJ
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 12:12:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d36f55c-8c29-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 13:12:28 +0100 (CET)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 07:12:24 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6345.namprd03.prod.outlook.com (2603:10b6:303:11c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 12:12:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 12:12:22 +0000
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
X-Inumbo-ID: 0d36f55c-8c29-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672834348;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GzrVoLQbytdkR1Wp0KQFMh+Px/VkZ4Z8nHXx96puNtI=;
  b=bIUTrIImGpmRCbWlKrWEQwpIFXGQYtEh5z1Frk32aCofAd3GwuOcNQe6
   6pAe4rvPcNOaNv1mFw3bTbJY4xR6SM40mT5+lh4CMigIbqomguel/dnkm
   P8t/IGYpWFoole6LqBBDrLCf6ylqMph/w8SRwjKUUhJpQtZYa8RtNayyL
   I=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 91159701
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Tg52davV94b2m0kvJLqOgIaqvufnVLZfMUV32f8akzHdYApBsoF/q
 tZmKWGDbP7bZTOmLtl/a4m1/EsA7cDQmIM3QQJv/ns8Hy0b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAR8uaA2AgbOK0p2kWMV9m+V/dOTTFdZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIW9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzhr6M73wXKroAVIDQOeEKAq+OIs0eRedBQF
 XIS2jQnioFnoSRHSfG4BXVUukWsux8XW9NUVeog+gyJ4qPR70CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMiEPIWgPTSQNVwcC7p/op4RbpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pckP2qag/FGBgC+2oZPJTQkd6QDeX2bj5QR8DLNJfKSt4FnfqPxGc4CQSwDZu
 GBewpDBqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meK0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:0euD16xdKvjeTyHpdCXAKrPwP71zdoMgy1knxilNoH1uA6+lfq
 +V9sjzuSWYtN9zYhEdcLK7VpVoKEm0nfVICO8qUYtKNzOGhILHFu5fBU+I+UyEJ8U4ndQtt5
 tdTw==
X-IronPort-AV: E=Sophos;i="5.96,299,1665460800"; 
   d="scan'208";a="91159701"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2Qzs8reLCpDxPF+xgVraCyCy1SX4jXeQx5ZvCVI/07byZRhnOcXvClHp65Cbbk17y0i6jDGvV1WPmG5XtDMltVNzZlwYn+yMOY+VGMVyDxGwCJHf2lDX7m/9ksTC6ffwJCoEd0Ay6Aro615qJ7lXNK8tlUptQhZ44QknDJE36E2+dFS5jg+o3/W/h1W7lHgtnUi5hEFySqRevPE8c2VJkt41A46pS7n2YCJ5gMZTQEtbRU6TvAGMKa3AyGTxr5hjLJmW2ETkDVIW3ahBqjtzDW6v5wqrlrJfzlsKke4fZFWdNIKmTJjccMoe4Rne2LnlB6Bq/5NFgzRCZsN8wbVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzrVoLQbytdkR1Wp0KQFMh+Px/VkZ4Z8nHXx96puNtI=;
 b=WeHdu18g6l5POtV6ABN/vHDXVdc+ArSCcHbFB33Ojj8kBjrUeowz+M7XzsUHchkUJqvpV83J1jRNFbhSSlCfLTa0PAq4xv/a/uk2e6NuwhbyI3MVG9NXGeJeFFxgrb+LWtBtxNNQLitWGaujR9Hs/QjgAttP8IRMGadHiEt5sJH40GC920gksk6flc+3c0uM7G1n/EZEcmAjRvaMdRJYxUlzfRhE3zNGFxVEknK2LxO7/u1iV/cIM0ZSnWQ822zAp1ux0vtrSvnV/CVF6dbgiJ7RqlCJZnCT0EOCIWqstWAp8KN04wCMUcT8K1TN5tdJzGVQcC27Vy1ArURx7owm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzrVoLQbytdkR1Wp0KQFMh+Px/VkZ4Z8nHXx96puNtI=;
 b=xKJ1LRgz/WXhEeDPgZFHjicl3HIcQ+9wXYop0GuOhRiKh0GR9CyjukxJT7PHiBxcwnBeAPkjvZJZFFX9vNM2CBkftGEJLEmEDvxDT+8NQrmsIU05O0i4BO4qCritgi78mZvEd2LcSNJLQPeVbUM1v5oblCOxTZDYBy8dfG3mEdA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
Thread-Topic: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
Thread-Index: AQHZG+cbH36uve2aEUGxm9tAfYRLqK6LLXmAgAMGUIA=
Date: Wed, 4 Jan 2023 12:12:21 +0000
Message-ID: <c48536e5-37b4-4dbd-4715-cd8d776e496e@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-3-andrew.cooper3@citrix.com>
 <07b5cc36-e0ea-9b51-036a-9523920dd74a@amd.com>
In-Reply-To: <07b5cc36-e0ea-9b51-036a-9523920dd74a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6345:EE_
x-ms-office365-filtering-correlation-id: 44cb12d5-77e1-402f-a341-08daee4ceef0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G6h9PgyduLJ0RbgdAwCaM0xLXwLic4yfPLvQlgyGYXyriccXGUmNTweE4NbOND1eySIY5ltrf2sdaP0k6mTJ7acZ0YwUilJTOl2WpTGVz1zDsEH7kNIX1CiW/P0PUzVDvYSictzD0OC/nWnOACR0vYkA9tefJ1508hM2EQQ+DYgr6TybWpYmrSmvqMkQjt2cVVb2h+QpIIL1OgJ056hdj8FaUeaZwSIm8mUJkSLEfvDZnDVkc1wyrEKkjchmixNpD6yYbC49E0MMHaB4S/uZY8vKUF4T/rlYVzzEvnFC9YJ5rTDX0F+RHSvQDL8EzmvZQNXIdi+WNQ7RDk2EEpvcu+zO5iQPTvuTR9OPR9Afq37aUMJY1wwUNPkNHnpTpwZlL4f/rNkJs8HuWP1XbsXldnQmAEpHyD/NE3dFuC/8whSbB8gz3QJPhp+5v01ENeYubP8uB5gIaLsc8itTlMnsqjrGaHeG230HwXWjVj7ltkUPdpfrIEWdmpQIa7lus5+w60rU4SW3Ybp60DNo4jpX5n0UomOf8gMo+PgHzZ3ILfxGKpQJbTqRahtPA7VUDOQgPPrrmNOb5jkFJFy5T5o6mRJ2B4VBLlFO8P9GgM8+C6P/mK+X9XVgp4a44HkhByd5eDFcq2/DdK1JYxNfAz5xxs0QLu2J6TSIUwOToAu7ejK0rghCcMKwO9ndKM5/TcHjDpcXTRZD3iP6W3gdignTGY9pJE+Gqm/xOAnLEan0HFoUGtAcAZDR20kwRqp/H1ZOibC512O1QtPfzQaBvFVFbA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(38100700002)(83380400001)(122000001)(82960400001)(38070700005)(31696002)(86362001)(5660300002)(4744005)(66476007)(2906002)(4326008)(8676002)(76116006)(64756008)(66556008)(66446008)(66946007)(41300700001)(186003)(6512007)(91956017)(26005)(53546011)(6506007)(8936002)(2616005)(110136005)(54906003)(478600001)(316002)(71200400001)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?am5Zbm45L3FIMWlrcFYwVmxCZGpIOUxENnNaRjVrL29tTkpoOE9LMkNUR3pa?=
 =?utf-8?B?YytFR1BQTXRHR2ZsbitqeS9TS1MzbHVEN2hycGwxSnlja1IrSjNxSjlxMmdQ?=
 =?utf-8?B?UW5lU2tsNXVObTdrWFJCUnd5Z21KVjI0ZEJUOVl4Y3JSd2RUZkd4UTBnbDIr?=
 =?utf-8?B?VEd4WkpXM2VJWWpvMVRrWDAyK2dtVndSZHo4VGNndjB2RU5lVUJPQmNoSVhM?=
 =?utf-8?B?ZVBGUTF2dlhpcmlUck1GRFo4enBKOGtiMU5Gc2VUVVVTMkJxeFRkQmJud3pV?=
 =?utf-8?B?NDZiNlNXaCsxRlVPWTRGZlJTdkxDQ1VEMmkzRnlpMzJrazNINmRrRzNUSUdK?=
 =?utf-8?B?QjJ0VG0vS3Z5bGJmSkovNUMvTVNyMXlLM28xVnpac2lmdEhDQlJSOCtOZTBH?=
 =?utf-8?B?RklKMVdlcWV1dnZSNHdndzJEa25MSGdFZVBBRFVRYnVPSnRlWXp1c2NmeEFL?=
 =?utf-8?B?N3ZnV1hBemtKY2R1NzNGdkR6WGpudGlra1dsU2hibmtiM1liaXk5VVdHOXll?=
 =?utf-8?B?cXA2MDVWQ2t5V1R1YTVtYVR6MFYzQ1R5ZHVZTmpudTM2UGx4UEJYVVpINVJs?=
 =?utf-8?B?bFhwekZvRUJCTDMvWXg5MjFRYkFKZ3FVc1g3cnZCSDNVYjAxeGxpcjBIM1Jq?=
 =?utf-8?B?ekJQRndMNVowclNHVDNtaFlHTHYwMjBoWDd3VkNidlljNkkrUmZYZGhaVXJ1?=
 =?utf-8?B?c2xkcUxpdmFtTS94Y3N1YUFaU1UzeVZhdWF5ZTlkWDdaVzRrS0pGVWE2MjJi?=
 =?utf-8?B?UjBIMjV4MVhZWnVLdDRlRGpRNDFYM0tyOERCUEtwRHRIVitwNUYveTFKZ3E1?=
 =?utf-8?B?dDBCeTdnQ1pYbEFMZkxKWi9QODlHNGtHcjAwWEFRZEh4U2FCZDdiSlJYSUFG?=
 =?utf-8?B?UDM2Mkx5WFRPVnVVM1dhellxRDFuOEhJMitnN1I2TEMxYkFhWHRVZThSbFdk?=
 =?utf-8?B?U0p3YUVmcjFERVhoNHpSWXNyaGlCY1lmRWNCNFZSOVNDWGQ1elQrWFM2ODRm?=
 =?utf-8?B?MUVWREIzMmsxUlZZbWpvMEdPV0VIekJNNU5RNnF2em9RN3NZRXYvRkt2WUxk?=
 =?utf-8?B?bGxzMC9GeXBmSnB4ZzVzUDJxYUk1b1Nzc0FjSEtDenBFWlN1VEpnTm1QVXph?=
 =?utf-8?B?U2dvZ2s5ZWtCVDFNSFJFTFdvK1FwRWxSVVgybzFDYlNvVUhKbU9xSnNleWh1?=
 =?utf-8?B?NEpNRnBGZk5KTGt5Wk9vWmIrRG5DaXZUZVVjdmxBR0prbTFaM3ZMYlFPSGtG?=
 =?utf-8?B?U2E3b2crNm80b28yVFRNZHVIa0VUTXVIMXpVR095YVFieXNVazFESUZhSXpD?=
 =?utf-8?B?WnZwKzBJN0k1ak5WbjFmeFJKUmdqNENVK2R0d3pCU3dhWDVqZ1RrRWRoZnFL?=
 =?utf-8?B?d1E5YUhlM0FXRUxDclFsanJsVXlzbTI1akpLMldFZHl5UW5relA4ejg3Sitq?=
 =?utf-8?B?QUlIM2pVQzJnNG1rU0Z5c1kxVithUjdXV2FYQVVPL3Q2YWhQUlVVeHNQVEVu?=
 =?utf-8?B?U1pxcnB4Y2lZM1lXRzJFcHA3MnJ1Zi9kQ3lEbWliaFF4Z1JuWG9YMUNSelRD?=
 =?utf-8?B?Y3BTZ29ZZk5FZm5vb0VyTzdrWWhtMkhhQVdvNnRmelBxeG1iOHN2ZVlJQkxH?=
 =?utf-8?B?TEZ5SkRUZXlERzNMTE80bXpPWTFFeDJkUCs2cy9hUWhpWHRxak5kVyt2TVR3?=
 =?utf-8?B?ZlJLbm1YeWkwM3ByUmV3cXMxVlJBTlprNHFPRlRXWFRqK0xJbVRCM0tnc1ZI?=
 =?utf-8?B?UlBrTEdmeEgvTzlLdzY1U3hDdk5IQjNkVEg0Vm5sMUhFclhQK3RMMFNZUnFm?=
 =?utf-8?B?SlhuY0lLTUg2b0FEbXZDT2ljbXlac1hvQVU4ay9uWUFvZlVWQTdsN1ZsTTRk?=
 =?utf-8?B?OFI4TzRFS2Z4eDJTZGM1UzcrdzNKaFZYenRGOVdVdHRidndab25PcHl2WUVY?=
 =?utf-8?B?RTErTDVKdWVVakRodDhEZ2Z0NldBL1p0L2xDUmRuNDE3OEFXUU1rZ2t0RWVk?=
 =?utf-8?B?VXVab2dSTnNNSWs3TVNoR04yTmxIVTFrbEdKSUVJcWlwK1Z4TmR3Q0htb01s?=
 =?utf-8?B?THVDZitOMG1jUm9UdWgrRVpRL2ZWSlJQSlhTdlVPQ3gxNnBVTjZXbC9lbG00?=
 =?utf-8?Q?YLNVWnm4OrULaFFZIeBh7JNHT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90E7DE2C213C5C4FBB44CCBC7E8B790A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Nj88TlfsgWnyFUS5jU/aTCO3qzIf4a0/3RMsJWyS1A7VP0MEhZ0mot0SiP2r7pc9zPlxhEBU4yCIt+9En6b4rLgTqFNs6GktYRC3QA3zJO/u738TTicf+gLRZofMhejKxlx0aNoFn1TEJgq0JQ8XOZDY0cge+lh/8xprBR56MCDWQDxhTWe03KCE5TyyJRC8tvs8PMUddC68ACNLCWckIhBSFcVxwJUkeKhxP+HPDsKDNfRkbPkLHCIuxkn4liW2uJ8mXlyLKoq+eLxD5vDC2ZXTmMxxhxqnna2BQ6Htzrk3TjQvh188U1FJHHgvBlY5goPNNu+r9N98xltsw7wMjuqxlBn9wzE5ub2iEjq+8jpSetxOkyX+DurpHqiSUwWE9ZnKtiEbXFD2QdrcN9UI4loNSQvLi62U3Xx3KTHpK4pA19ns08BUWTY9Ger9yYLt4mNMEDHAH7zlmBasNYXJ6ZtLwWHBunfwoJhsiX34Rd+bV7XAYrfKUdJYWAN3rg8afIXp6OarEdd8jdG9qtsG6hFewuftKSVPI8C972zFliwbslEVO+EZxoItgZw2JzT6ZwtQUAGkbmf9KXbblnGlU/E94USfQj1CxsZozE5lM3u3WACKngsmY521n3R1U5fDFAeI5jmdTq4gMD7C/l/6PT7305sYBJ3epXuOr1mVEgX97kRlgGmg01nVA+sy8qi4B2Ko/dp3lBfo2yb/EChngevxM16MXPn4M3QTDsnHl7aVjWKSUjjNhXC2aBZ1mRw33WClinnztucThmmssxxhB5yKPWz9++o8xSTdq02ByCwlra7SpRjimtvfNv72lVbXmC7DfxsmOxepUSr1YnEBbnwtfeiQbmZFp08nkyboUllZzOVVIrHtHz580N39O8l
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cb12d5-77e1-402f-a341-08daee4ceef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 12:12:21.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwGdT9Ywx68hoQfBQyl+mNntpPC/h3I/MstY4Etl9MtZoCsOgvoNB6DJgn02hSxFUl9XmK9dG4gViUqOGT3TuISp5dePOoS7Yd5D2+IpGoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6345

T24gMDIvMDEvMjAyMyAyOjAwIHBtLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+IEhpIEFuZHJldywN
Cj4NCj4gT24gMzAvMTIvMjAyMiAwMTozOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IENhdXRp
b246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2Ug
cHJvcGVyIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywg
b3IgcmVzcG9uZGluZy4NCj4+DQo+Pg0KPj4gUHJlc2VydmUgdGhlIGFydGVmYWN0cyBiYXNlZCBv
biB0aGUgYG1ha2VgIHJ1bmUgd2UgYWN0dWFsbHkgcmFuLCByYXRoZXIgdGhhbg0KPj4gZ3Vlc3N3
b3JrIGFib3V0IHdoaWNoIHJ1bmUgd2Ugd291bGQgaGF2ZSBydW4gYmFzZWQgb24gb3RoZXIgc2V0
dGluZ3MuDQo+Pg0KPj4gTm90ZSB0aGF0IHRoZSBBUk0gcWVtdSBzbW9rZSB0ZXN0cyBkZXBlbmQg
b24gZmluZGluZyBiaW5hcmllcy94ZW4gZXZlbiBmcm9tDQo+PiBmdWxsIGJ1aWxkcy4gIEFsc28g
dGhhdCB0aGUgSmVzc2llLTMyIGNvbnRhaW5lcnMgYnVpbGQgdG9vbHMgYnV0IG5vdCBYZW4uDQo+
Pg0KPj4gVGhpcyBtZWFucyB0aGUgeDg2XzMyIGJ1aWxkcyBub3cgc3RvcmUgcmVsZXZhbnQgYXJ0
ZWZhY3RzLiAgTm8gY2hhbmdlIGluIG90aGVyDQo+PiBjb25maWd1cmF0aW9ucy4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiBJJ2QgcHJlZmVyIHRvIGtlZXAgdXNpbmcgImFydGlmYWN0cyIgYW5kIG5vdCAiYXJ0ZWZhY3Rz
IiBhcyB0aGUgZm9ybWVyIGlzIHdoYXQgR2l0TGFiIHVzZXMNCj4gYW5kIHdoYXQgd2UgdXNlIGlu
IGJ1aWxkL3Rlc3QueWFtbC4NCg0KWGVuIGlzIHdyaXR0ZW4gaW4gQnJpdGlzaCBFbmdsaXNoLsKg
IFdlJ3JlIGZvcmNlZCB0byBjb21wcm9taXNlIGZvcg0KZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLCBi
dXQgeGVuLmdpdCBpcyBtb3N0bHkgQnJpdGlzaCBub3QgQW1lcmljYW4uDQoNCn5BbmRyZXcNCg==

