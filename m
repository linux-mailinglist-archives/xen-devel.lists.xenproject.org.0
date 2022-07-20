Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20157B442
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 12:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371479.603422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE6XF-0005SH-UX; Wed, 20 Jul 2022 10:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371479.603422; Wed, 20 Jul 2022 10:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE6XF-0005Q8-Qr; Wed, 20 Jul 2022 10:02:29 +0000
Received: by outflank-mailman (input) for mailman id 371479;
 Wed, 20 Jul 2022 10:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6Hj=XZ=citrix.com=prvs=193cc1dc0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oE6XE-0005Q0-PZ
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 10:02:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d26c9df-0813-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 12:02:25 +0200 (CEST)
Received: from mail-dm3nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2022 06:02:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6148.namprd03.prod.outlook.com (2603:10b6:610:d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 10:02:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 10:02:02 +0000
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
X-Inumbo-ID: 0d26c9df-0813-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658311345;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GDFSOmP9rfU+b5Tl1tffmpdaFmigGJpnyCzCR5itSQs=;
  b=br5nioQbGmSFxpsxULSqzTjR5xB7cewM+bwkoKUBeBtUjW7cfS7F4VG6
   NtzCySqSCBNr4h8wpJz5aPAQ1OQes/OyyX9RW43gW+iGtgQlY9tmd+1/0
   6rscwMmpE1Y4Esun8CvIPrhZF+e0oZdWAmG/aqy5KInNhrvFbj2uBxSwd
   s=;
X-IronPort-RemoteIP: 104.47.56.48
X-IronPort-MID: 76641405
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MN3npKMiDHyHmobvrR2clsFynXyQoLVcMsEvi/4bfWQNrUokgjBTx
 mceUW+OaPqIYTb1eIwna9nj9B8HusPdyNNhTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPjb8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPt48VFM38bLbcY2fZsDW4S2
 tw6LxQSO0Xra+KemNpXS8FKr+F7dozHGdhavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr2wCWvG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFaoLDkGbdrxpAgMfjsXn6YLktBIGk/8dPoVK3lkdDDDsvAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFaPvgQdQPJcGuk38xqMzezT+QnxLm1CR3hQb8Egu+c6WCYq3
 1rPltivGD8HmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LFae0ipj5HGr2y
 jXS9iwm3e1P3YgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tbpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:VXgU667XDGBkMGGIkwPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG8fIzmZ0Wd9ih33ekLhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.92,286,1650945600"; 
   d="scan'208";a="76641405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH2yF8qvNq0EJ3VZ4eJhIKmWPO/0nlR86g5GXXNqFqOaWsIXmqW/LQBB214MjFuXAGhUWExrAyzYlACSVNio5+Jv7JYPUtF0GCtiOlmFPfWmBoga6nXoo1bdbUqu5HXOx5boU9LLlpVgJUxYbXa8uGyrsQXRYblwHsKEUsJEaJ7nyqD/viBXw5CsJ+c0YzKak00s0Tyh8S47nLdRB/MQueWZueSJspYB+cNUAUJqX8SRHWNhvm0ZuRVhaILaB5ZpWoRd6QP5m1lWWUJ8CyPV8Pz6fyEyxUGOKcj17SQp7j7vB5vUIEVrRFCEL4iMaI+QNgVyp74YfoNsuvQ9bfTd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDFSOmP9rfU+b5Tl1tffmpdaFmigGJpnyCzCR5itSQs=;
 b=Ui0W0tu5jnB+KGsvqMmcTfzyemdm1v2zqbb//XlNlXAjJ+8qCDUuWw+bFOHKP2xWScd+EHW/CWPnjfWM/2phenaambkgaIsD0lVAU38ABrsO/4VNYQTVy0npmpkUKrWCTGAT2Y3LkDyFpTrc7sxgw6huA3gJG0B9g/QGuySjZnkXs5eSHMYQEGTCysDvpidm0gLQNRClhhYw+qOub87fBbPqFxKC7tGgMUxLE0Z6ds57mvtpN10P+07BTVoDv9VQoDlS08zidUjuR72ozL7aUt8EZF+PPYTD9b0lA/kzv+ipbfwUTiHR01yeun+nvRdsBnqtLVflZAkITmjrC9aQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDFSOmP9rfU+b5Tl1tffmpdaFmigGJpnyCzCR5itSQs=;
 b=gYEZfx2NOE1dc5NPNTCt1L7lHztdTHdy4PXy7BnVaErR7jvM987BReAEs+AJr9luYsF175mOBn57x/zRDNFsX2UjNkgcsonkmEXEzCsnTVBRl1/S8kgepRvqwSxvGvkBRrJoXCl7X3puMVzkWb8YZ6SJyTD6gqIkoCqEhKEfCZs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, ChrisD <chris@dalessio.org>
CC: Michael Young <m.a.young@durham.ac.uk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Thread-Topic: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Thread-Index: AQHYmvJAgpD4dPs1E0ycG7IdcXuLNK2EtJsAgAH9iQCAADrbgIAAHJ+A
Date: Wed, 20 Jul 2022 10:02:02 +0000
Message-ID: <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
 <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
In-Reply-To: <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaa20c97-ec03-4a1a-3eb7-08da6a36e4a1
x-ms-traffictypediagnostic: CH0PR03MB6148:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qhNjJORWbTUZVMcw98Ct8KNjOfj3+WE1Kf1pi0UgljI/DTYVH6g1brnkAXwZie/A1NtxOeTuKuKxIh2NkWaT7CFLqFp0fu7RaiElvV0hFiEK2p6FKFi4fbA0u+1stds/HdGKA99DphiIAY2LxOG3zkRMdqNuy7lOUAvrgTbQXovlhLrW4oZS6yltmi8hulllvzN3K7IcZwjEC+G1MmXdh8Zviuk5zO8+vtZzut85iryCThD6t2kniTOm/g39FpIXpQOCMZRiFaNg3qEJKxEQG9dRSUXPHs+gYaKZuzZuvKM/rkVDJHVtETvAo2YeriIeLl8jZbUR7GoPx/mpxtGAvEuHZ2CO8xv1lQR7HWlXwVNtpK05SxaxR7jK2tHozYY1RxDOFILaMATHV3im3orGFP3plrN388ZYS5w8TqI6n+fiKU5FLzkzLOx82yDiK3uyBrpKbu4x6IKi37NRrejZd0wQljk9jLtVyCmB1KL3Q2jeDnqgbcNzO7H0jUXjv4TtCaDAonFL2dYTkQxFGVgTxQu0B86r03cfCWSvSNOQJMD1Hcy+52ELPoy6t2pNF/s56uj7CQsZka/GLm8KDK1VmgNw88yoMruiV3qnYfpR7GCFVe0Xo7sNnopVH20BFDV7Yc3NZmMpbHQ6+qhBLvX4Pwt2Brj7h5ZXtnfYwZXLWPYrwWpG1xt731JsI/+Gnq8ezy5oETMXxaf7z2aAmZSkbkbSAwA9vLj8htbScwPNh1UkQDuMqmW93D1bPhwNeGcfH3yrNSQKhaHPh1M2ujUwGfZ8j26eQUJ1S4n3Xer+0uWzpb53dafZXBLLHyFYwiLelipBfVvNBCpwj/HPr7d9hDkLPBcKhv7ia7eDJYX8GI26DY/vsDqS3WSkEgfCe2hv5rEnOvJi1MMsEli4rkhtDQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(38100700002)(5660300002)(8936002)(4744005)(122000001)(110136005)(38070700005)(82960400001)(478600001)(71200400001)(2906002)(66476007)(4326008)(91956017)(316002)(76116006)(54906003)(8676002)(86362001)(186003)(2616005)(66946007)(66446008)(36756003)(6512007)(53546011)(966005)(6486002)(31686004)(41300700001)(26005)(6506007)(31696002)(64756008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWJvQjJHK2lpczBSaGJIbGtTNWtNSzB5dStxWG83QnR0N0tBU0FaWmZONExz?=
 =?utf-8?B?NjUxVklMS1RsNGdZUFFVOWtjdU5HWUpYVmcyOXZ1VU9SeS9TVTFzRERnWWNk?=
 =?utf-8?B?VHl6S2N5VXMyaDBSYlNDMlgxQWMzUFNMbWV5NGlpcmFieVpuaGFjK3RvdVZj?=
 =?utf-8?B?U29tMXlGQ0RQSTRxTEg0M3N3Yis3ZVZMa2E4TUZCY3BaZjhva1VOQ2FrS0Vj?=
 =?utf-8?B?cW9mRmd5Vk9wTTRXWWhYU2V1V0JGRk9HVzV5S1R2YUMxVDRBajFyMmh2VWtY?=
 =?utf-8?B?bjZlcmVmaVVlNUJwZWNYYXRoanZydnVNNzZzamVoaEpDVERCUGl4ZzRqZnJi?=
 =?utf-8?B?SVdiQ0dMQUYraWtLYmJRSXg4U2Fud1BNME9XeXJxODZndlNTN2xBdXBTWG9J?=
 =?utf-8?B?aUNpZEY5bzJWYlR6aVpuY01Nd3JRY0xvei95dEZCamQ1eHp6SFB1V3dDZ3Rl?=
 =?utf-8?B?a0V1VjBScTl5bDRhblJwYTluVFdQOE9RanJxcGNEcjk0MmFra2NLcWxTSTQv?=
 =?utf-8?B?bUlqYXFVbVB3VGlRcEpnS005bGhFSFJEUHhMeHZUSDRaTGJ0aEF1RjN2WnRQ?=
 =?utf-8?B?a0pyVGhFeUljZ0doMnpheXRYNlNrcy91aStoWEtCK2xIdERzWHpOMmNpbzZw?=
 =?utf-8?B?eVJseE9mQkQ5MVo0QmJZU2o1bHJ4b09rMDRLSVpnUmsxendFR09ST1FZcTdO?=
 =?utf-8?B?WFlZb2NSMU9XclZiSTJWMlRWQ0Noek9YVUpwWGh1TU5FbDlpeVpyUlhUMXlX?=
 =?utf-8?B?dnhkeHJRcDFMdVY4Z3dseDdoR0JNUUMrdU1ONDFlVmJiQ3duQWsxWkpMQURs?=
 =?utf-8?B?c3p1MzZITHQ2ckFnNk1ockRJK0RhMTRzV2h2SXhnYmkrUzV6TmlrMWhDRVBR?=
 =?utf-8?B?WlRwN2YxKzFrTXF3SzY3MFR3NDBDQ0xvSDd4OGNzb1NjMFFPK2JzdWJEV0Za?=
 =?utf-8?B?NUNmYVNDaCs5RjhGMHh3ckc3MUpSQ3YzTzVEOFAxOGJnYi95ekJXK1d3RGs5?=
 =?utf-8?B?TzlEMlN3YXBoWlVDQ2t0RjNvZDN6YjFINHNST1RTT05iMllFMitUMG1nQ1Er?=
 =?utf-8?B?VDF6OHVSRFhiN0syM3NPZzFXbGdHQ291TUxmRWNGa05aUEVTUHo3dDN1L01j?=
 =?utf-8?B?ajIwditLTlRtNlJtMnBDTlpKbk9kSzlqTUhlWmpYM3NzU250WXdCcWJWbHlz?=
 =?utf-8?B?SXJ0L0hkOXNFUHRSaGdHMnRNUllOS0dDMStVWi9tWTFDMHpSZ0dFeEh2c0Fu?=
 =?utf-8?B?cnlURDZrcTZYUDJvN25Ob0tZU1M0cVo0STZUMTNKanVuL0pOMmRjUDR5c2RO?=
 =?utf-8?B?YmJuNGxMcHZqQ015WHFNRmlIQ0JoWWp0Z3NVckFMWnNoMUVCb0hDandvYkp6?=
 =?utf-8?B?YW11K1JLSzlhT0ZpNE5Xc1pJMm9PVytVa3U0VWFjSkdob1VwTmFTc3JRT3lL?=
 =?utf-8?B?Snhtb055bkU0bXZ4OUM3aGtnSERYS3NINXZjZVJJVWlOdW1YenUxWkpLRktt?=
 =?utf-8?B?bjBoVW9Kemx5MThJTTR2ZXI4K0VsK1p1b2FPWURuY29ya0JSWk1uY3FmWjRn?=
 =?utf-8?B?S25EaHlYaDdsdXdrMHFWMWMvVVoyZ29MSjhSTG1TaW5FbnBCRDlzYU1qYzhE?=
 =?utf-8?B?SHV4anA3OEtqcGZPVmdlaGpUcjFLQjlXdmxUOXRRd0FlSUkydWU2cVJBS0ZM?=
 =?utf-8?B?SzE0bFpJN1M3SWJscjlkaVpqQmtzaS83UGovT295WGxPdjlOSmluM3YyR0Zs?=
 =?utf-8?B?d3NZbm9yZzBLcHM5dHJSejF5cVluNy9lL3BreU1aQjliOW05ekJab1QzOVlO?=
 =?utf-8?B?K0hEaUw4aldnemRXckNab0prSzFUbGhPcWN1czZDQW1QOElJN1lWd0pFenNr?=
 =?utf-8?B?STBmdXhFczdDTGZLREVsZEFRV0RJTW9HQkxBWjRHanRSejZEbG1iRnh0SkJD?=
 =?utf-8?B?bmlFUk91RkJOaHNNdWZjWWhtSlRONU8rUjd3TThjRnFvNFUwUitpZFd5QkNG?=
 =?utf-8?B?MjQxQnNzcXVJaXg5c0hrekxkRjF5RGN2Z3hIczRFSW9hOTMwNU9RNHRHelFU?=
 =?utf-8?B?eXZ1UGJrLzM4YjhxTk1hVVpwdnhuQXdacTYybWZyZENiQ3Zzc1JFdnFYcnVT?=
 =?utf-8?Q?XJJZ9Rx46bG2LCkRFE030Ta8v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8BC1458041AC4469A5C6A68E570B1AA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa20c97-ec03-4a1a-3eb7-08da6a36e4a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 10:02:02.2428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVdCh2PCiYd777eynVMSw/QcI/QODfDnJT25mIxBnSpRoKsSiD5ZySYTRX5/iYWP7vL9nzyThEUE2QojxM3wE5YX+isWLDQYQAhzG3ZyQ6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6148

T24gMjAvMDcvMjAyMiAwOToxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA3LjIwMjIg
MDY6NDgsIENocmlzRCB3cm90ZToNCj4+IFNvLCB5b3UgdGhpbmsgaXQncyBhIHByb2JsZW0gd2l0
aCBmYzM2Pw0KPiBXZWxsLCBpZiB0aGF0J3Mgd2hlcmUgdGhlIGJpbmFyeSBjYW1lIGZyb20sIHRo
ZW4geWVzLg0KDQpTbw0KaHR0cHM6Ly9rb2ppcGtncy5mZWRvcmFwcm9qZWN0Lm9yZy8vcGFja2Fn
ZXMveGVuLzQuMTYuMS80LmZjMzYvZGF0YS9sb2dzL3g4Nl82NC9idWlsZC5sb2cNCmlzIHRoZSBi
dWlsZCBsb2cuDQoNCkZvciBpb21tdV9pbml0LmMgSSBkb24ndCBzZWUgYW55dGhpbmcgb3Zlcmx5
IGNvbmNlcm5pbmcsIGFsdGhvdWdoIHRoZQ0KcXVhbnRpdHkgb2Ygbm9uc2Vuc2Ugb24gdGhlIGdj
YyBjbWRsaW5lIGlzIHNwZWFrcyB2b2x1bWVzLg0KDQpPbmUgb2JzZXJ2YXRpb24gdGhvdWdoLsKg
IFdlIGRvIHBhc3MgLW1uby1zc2UgYnV0IG5vdCAtbW5vLW1teC7CoCBJIHN0aWxsDQpjYW4ndCBm
aWd1cmUgb3V0IHdoYXQgbWFrZXMgdGhlIGNvbXBpbGVyIHRoaW5rIHRoZXJlJ3MgYW55IFNJTUQg
dG8gYmUNCmRvbmUgaW4gdGhpcyBmdW5jdGlvbi4NCg0KfkFuZHJldw0K

