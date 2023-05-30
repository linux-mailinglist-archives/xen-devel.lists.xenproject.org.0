Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A07166D1
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541222.843743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q415s-0008Bt-6t; Tue, 30 May 2023 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541222.843743; Tue, 30 May 2023 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q415s-00089C-3o; Tue, 30 May 2023 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 541222;
 Tue, 30 May 2023 15:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q415q-000896-9r
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:17:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 044c3dfd-fefd-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 17:16:59 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 11:16:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6529.namprd03.prod.outlook.com (2603:10b6:806:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Tue, 30 May
 2023 15:15:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 15:15:54 +0000
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
X-Inumbo-ID: 044c3dfd-fefd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685459819;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+tV+I3MaoCLQ59JgmYu9eqtd55d8pIiyrIwuDPpQLtI=;
  b=gQUzK6V+B0wMM9Rv/eep0+J80GIbObGcabtHzFzC8m4+rQqxaeRee2lY
   xI50LOrcJImFe1tpvxyagHGcy1jtZUqrWTVc6Yu7mjHik9QXRqZhaR+I1
   NZbH7KaMsY1eZxZ/8Yk/cnzL2Hb3RqlkFJ3UBA5/SeWoe/hkmfzOuxsTx
   8=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 113422152
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3YZqXq4KuzoxuBehOehYAgxRtHDHchMFZxGqfqrLsTDasY5as4F+v
 mNLXDuEaPmKNDPyKIggbI7noB8PvsfRzII2QAptr3thHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0Q5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mt
 qYUKyxKbT64h8G64LeYaeNFq+59FZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHinAthLSefQGvhC3FiuzTJCJzAsRVqp5sCU11S6WepdN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN07k8kP0Kmq+EHdtDilrJPJUw0d6x3eWySu6QYRTISofZCy4F7Xq/NJNp+ET0Kpt
 WIB3cOZ6YgmB5aHnj2AW+UJEbSg4d6KNTTdhRhkGJxJ3z2p+mW/dIFKpj9kLUFiM90sZjPiJ
 kTUvGt575hVOnyoYaZpYpmZBMEjzKymHtPgPs04dfJLa5l1MQWBrCdnYBfJ23i3yRZ816YiJ
 Z2cbMCgS24ADrhqxya3QOFb1qI3wic5xiXYQpWTIwmb7IdyrUW9Ed8tWGZipMhgt/vsTNn9m
 zqHC/a39g==
IronPort-HdrOrdr: A9a23:ClmYCq5EtYSzjCLMKwPXwOPXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwQZVoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eA3OBjKadH/DBbytHOuQ4D9QYUcei1UdAb0ztE
X-Talos-CUID: 9a23:+sRdeGPhG6idzO5DG3Nr91JTGe4ecl7R7HLzAEWRJEw3cejA
X-Talos-MUID: 9a23:4MxwEgsHkiR1QugjO82n2DRfP5k5zImUGEEf1qwr5tOANxRyJGLI
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="113422152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/S4Xy+Mah9H8/CuE8lwQrq7eBLl/xisuAWmlfGoSKFjeDNhP4qzL5S8Us0Okwx20fUYDMpmaWXdjOpClOGFDvwQSnKOxxRHujNkr45cneo+Eyq7UZY8A74VTD7ZdLBn1ZImrlu5DaSt3AuBGy61CusFlT4v4vrkda0+WA7tVDD4WycH7mDr+FTIBBib6+P8KeuemelWXHPZ0YHe/GQr+uUqsqPBrClHtNqF3Ixd7JdqgnDQf/1bK3yfppkvTCs24rtBEH246ei9tCczskL+I7YvtEjuEpKV5OoUiIKo5cmNAZJJODpNGQFHD3f1z+UcUz2RXjiufLiXcUh9bhwIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64Ja1OIWGKAGq3lZEQgphsue4Bzy238t+MhdZ6MqwEg=;
 b=AAX2j4rTcTdXGI9TmxpX2H8jq2MXiyg8xP8XCdg8qurAM/OqsqiI6ahkgntxFc8bm+8j+j9XWzk0FuVNxy634HSFN/ZMnje2810+4HoDFXWK2VB8gw5ZHpdubSZChgc1Ihz4wZQKtic5f3tC4+l4q6Y/4XAApx2QXJNDPLZOEZdN1GQ9Lvrdoo/7MJr8YdqPM3u9Plr2iofhDUGPforsonPEngaDK0J7kHissFDgcZRCz5TgcMLECAG5IBV+mhNGOyyttdXSguiEWXNnijjwkA5rDCiHXP2SqlvGnbupCg0ZII+BMOMH/DWMSWCmpcVm/RZq0zessOLYmdMh888V6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64Ja1OIWGKAGq3lZEQgphsue4Bzy238t+MhdZ6MqwEg=;
 b=rFmQxH16aDy9RK8oz3z9dJyADUb7ND5CsKsDejqWoi2xxgwNwHEczpMFrZDqV/SJ9QnklOH5v+OkzuqrckviwaZiEgwmnLsRa4qqyEiAgmrtBdiKwj8q/Y5qxFCDt5/lElPhVgLcxessMs+YQLTNMP5urrc1x55bistp0KX9snI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 17:15:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 1/2] x86: annotate entry points with type and size
Message-ID: <ZHYTJEndEaOj8gh8@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
 <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
 <ZHSp9+ouRrXFEY4R@Air-de-Roger>
 <bba057a2-0a68-bf05-9a92-59546b52c73c@suse.com>
 <ZHX4PR56MQZQCVUX@Air-de-Roger>
 <f87cf1cd-61ba-aaf1-dd81-f2352acf4273@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f87cf1cd-61ba-aaf1-dd81-f2352acf4273@suse.com>
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: a535702b-7997-47d9-30f4-08db6120c2e4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ha/gSwv5hgWJ6ALoQ+LPGx4dPC2m9bspv1scmpw2jKROUbjM+dpd34dQA7UwW8bFThUUWpvENUDcrpMLmBghxmhMfUppR1NlDGeSfCxJZEx4YO+iqlyfkOTYFNEeDNW15w3RursNoU4elHh3w73dZHP8kRINiRvjbLx1WQEK053CL50tXhauKjPE62CMiePktvzVl8z75yAk4JpMYvi7GfLxUEUceAl/y20iqC6pCVorjZY/Zyru5JNhr+hW0PtvNuyMtq/WUTFA5HKWLGcRl5ll/9aDgYbg+A17jumh9/AvLopiUI3RKMdvXUncCr2qdc2p6A7boHonnT+fu1y53C1UCo/8bvWoRwKTrGvgN2DYNHrYWA5ayUwvaILUPxX0VZhf3P7eO69qS+4cWdZU4hUiQobCTjhe78Bs06uJZU42t5wDai4vWKz6fBT4nwUuS2hxXkxLqMhMwkLFXOOdqnbfDzIMEZDS9mBzoIzPPiQkzAvF7q8WyIuGbT9bphbnSEEvlNGBYKvf4aiccR4qbkIvV2u/D+8zFN07UCCzFZmPWq/TFgpgJalg6+Eb+9wN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(54906003)(186003)(83380400001)(86362001)(478600001)(2906002)(85182001)(66899021)(66476007)(66946007)(82960400001)(4326008)(66556008)(6916009)(6666004)(316002)(6512007)(6506007)(9686003)(26005)(53546011)(7416002)(6486002)(5660300002)(8676002)(41300700001)(8936002)(38100700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlpiSDZoYklUU0UyS0RJU2NMSEZHS0pkbm9YclBaMDg4bE85OWhQU0hhditt?=
 =?utf-8?B?OEFvTXBWazRPOEllcTgrQXpoemgyaDRSOURycThKK1FGT3JqQ0ZHcFJVTlRI?=
 =?utf-8?B?eXhKeHFaK3NzTG90Rll5aWk4RFJBZFBnRkd5Z1lESWZ1NVJvWFJpMUp0M2tP?=
 =?utf-8?B?MncxOXFSK0xrMXpTUXZQQ0RUbWJvclZOQnV1NnpTd3k3YjV1Q3lCaExNMDhH?=
 =?utf-8?B?WnJHZTFaa2JRWHNScHB5M0w5VUhFcC91b0tteGVpTWRZZ3pHWUpxdkZjM0Fr?=
 =?utf-8?B?ZVRka2ZtRXpiSHpQMWRKb3VWclRyUmhkQ0ttZktOLzV1d3NmeFQyM2NXYmVO?=
 =?utf-8?B?YXlXRGQ2VUdxeVFaY0pnVDl6VSswRk5vTVFoOVVpM1JXZW9jUjJMMncxUHhw?=
 =?utf-8?B?bkw5V0hHZ25aR1RqVFBSN0l1N3YzeEpuVmNFdDVraHh5L0llSXorTjkxejJX?=
 =?utf-8?B?L3lyVG9OdVVtN1c2Zi9HLzhUWDhWdFlyRFFpZWw2TGw1ZytlS3Z1UGtidWNF?=
 =?utf-8?B?ZktLZEhWQmN3SXByMXdlWGpIUkR4U25uc2R0UzZ3Z0t2Z09CZDBXcmNneE1k?=
 =?utf-8?B?b0VrTGM0T2V0UzBBS1hlM2tYL2tjbEdHK1lzT1paMVdoNTRLclhRVE5BTkhu?=
 =?utf-8?B?cWR2bk9DU2hMQ3RndVZEUnBnVmNmaHFja3MrRFZPMVZyTVVGNGVPSkxwMVhw?=
 =?utf-8?B?d1Y1N085QWNyVkpEdHg5d2p1MnRQa0VTT0JMU2tFM3M4a0lJMG1wVndhTHJy?=
 =?utf-8?B?Y2tkTTNqUGZVYUtQTXlYcEwwU1FQREl2RWpPRVQ1cVdtOVU2RFJVK1VwVWQ0?=
 =?utf-8?B?OXZkWEtiY0creUpsbTFKOHc4b01uWmhmSWw5ZlZxYU55TmFRc1U3bmlzZ0Uv?=
 =?utf-8?B?cmpkNTFCMVV3bndMRStDUWRHZ05vQWdoazhKdit2bGxVeldGbVhRUEpNOUc4?=
 =?utf-8?B?T1c0NkNXOWhWVjNoVW5PRDc3K3VkN2pNTjVVVmh4VDI5STFJblFDOFpWd2tz?=
 =?utf-8?B?MWd3Z1JHOUtBWHZDUEphWUxhcUlIYk5RL3NQbjRHYjRlS2IzTUEwRitPdndk?=
 =?utf-8?B?Q1ROZXRIL0ZpVnJnTG9FVGZZelVlN3lKUklpYTNxdWk4dG10U0hvb0UxYW1G?=
 =?utf-8?B?bU9lcFBmbWlVOW45TjVFaFk5Z2hxNTI5NUFvN0dOTGtSVmdkRUpnZjVFM1Bp?=
 =?utf-8?B?L3NFbGZicTR5Y2hESE1DQXNYSkRIZ1hQTDF2Ump6cXo3TzBwVnlBNFVDTjlJ?=
 =?utf-8?B?QWpESGVZcmkranhnM090bXhEWFErTURlQ05xaFVCN3B0THNzTFFYVVRsdmxH?=
 =?utf-8?B?VWJCSVdSeHNPR0xLVm8vaTlPdGx5TUxBOWJlQTZSRCtoaGJlRDdpSG5VUndu?=
 =?utf-8?B?c3dpRUtvS1hTK1JJNUkyZ000SFpUSjQ3MEU4SC95UFowaDdEUnZJa3FUM0FS?=
 =?utf-8?B?WDM3eGQxN3JReEQ0OGRHejJVM1VUOHdUTnVQd1R4U096aUltZjN4MFdtUmpM?=
 =?utf-8?B?RmhMb3ZDVEsrMUg3L0tNMGpZQ0cwaGw3SmpoUndSZHR5N1dyZG9WbDFHTTRE?=
 =?utf-8?B?VHdIYzVZNjdHSVkybEVBWW0rT09DL1JvbXJad0FHR205Zk1tU0hkTEYyN3NJ?=
 =?utf-8?B?d2dGdm1CNEhvWE9lbjkyVWtNb3FSdkVJeVhlVkdXZ3VUcjZGdHl5QTFOVWpp?=
 =?utf-8?B?QWVqTWhtQmRpSnJwWE02a2ZVZHpmdVdIdk93dHp2QmhmVXEwRzRlYXNsTWNt?=
 =?utf-8?B?Y1plZFlKbFJsem9wNHRuNFdZM25EbmRScG9aY2M0UlJNZWJxZjZXYjRjaklF?=
 =?utf-8?B?VzVvREZFNERqRHpwSzFmMVVtK3ZueGpEVzd2TU53L3FUK0l4ZlZPK0RNS0VW?=
 =?utf-8?B?azEva2ZOSnhzdFV5aTFyMHlIczY1WmR2VHRqcTBHS3Z5UzBqQlpNRzZIWVFV?=
 =?utf-8?B?S05Tc3dKS05kYUdEQTUxYUdGN280NFhRQ05JWUVubFFpVFd3dzBPYmNRT0Jl?=
 =?utf-8?B?WDhoRHJidDdVUlZqYVdOL0Q5aUpXQ2tSQXA2Tm9LY2NnRlhEK2JYOThyWmN5?=
 =?utf-8?B?T0NLdzQ5aU0vNXNDblZ3RDhoRmpsek11YU5LQ1Q1aHp3ZklrZGNlTmVYaDhD?=
 =?utf-8?B?NUw2MlMwVm81cUhxTHc5VmNpU1dpRlJmaGtCQ2xEanppcHFOUEk3UlBha0l6?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?VWpTNGl6SkdObW9wNkJuQzN0eTRyZUVXRzZmNWIxeEFCRXhNZWR6QnBzUUh0?=
 =?utf-8?B?dnU0UTRiRnlPZndtZWM4dERpcnNKdG1WWXRRSThpYVg3ZWJJM3NZakh0dXlO?=
 =?utf-8?B?OVJRSVMxcnRyeUJCZ2hMYlNVYUg2a0svNHlLQ3ZSRkxaVncxc3FFd2ZiUGpX?=
 =?utf-8?B?bUptaUEzektKc2RieVFOVnp3N040ZWx2WGdIV1g3bUNoTmZvRmNibjBiS3hM?=
 =?utf-8?B?OUNwbEZOOVlsYUxlSkpQblE5VW9KYnlZUnpnZWo1QmxTR1krdEE1Q1dQaXRw?=
 =?utf-8?B?ZUQ1dHl6ckRLK2hsNnlXOXBFMTV6OGN2bW9nODJUZERWdXBLSUZySy8zYnVS?=
 =?utf-8?B?VVdCVm8vQnF5RWtNU1ZVL2Y0b1IwNGgzYzdha3NpVUVPMGlzY3dkZjZwekpV?=
 =?utf-8?B?RGZHK0hIMXVoeWVqd3hWbzRmVUtFNjNTR2w1NUZTT0dmSlY4V1hjSC8welFR?=
 =?utf-8?B?UzJjUmVFV2RHT09LR0c5OG1mMnFlaFRUVmZHR093d04wUkphMlRyV3VxUGVx?=
 =?utf-8?B?ZzZXOWdUSVJ4bXcyUU5IRGtKczB2ZU9lNW5sOW41ejQxQUc2RjdaWnhLckJB?=
 =?utf-8?B?WnNxb2pQdTkxczVxWS9iMXhzQjFDT2NSL2g0Zk9rcm5pZzNQcUc5SWJnSTBw?=
 =?utf-8?B?NlJFT2tCbnNVWlhYMFJyZ1RtM1hSYTAwdXkxTnRFVFluVVNzU1lTQkJBTVhh?=
 =?utf-8?B?ZUwrYUxKMkM5dGZiZnRIaXVEcHNKM2lMSmtwMXdWVmpKb0FzK3N1YXFvTW9P?=
 =?utf-8?B?Ukw4OTU5Qml6Zy84eFl3czFRRnBvc0t0RmFIY241bWgxSnQ3Z2JoS0tTMEJn?=
 =?utf-8?B?UmVzdnFTL253RUo1Y3B3bnVoVVFlbHBPN0I1VjlUQ0FwaFRMdXFCeE9DRUJW?=
 =?utf-8?B?anc3aHRKQm42RmpXNU5jMTc2ejV5Nk1sSzgrYnhqTEtnMzJYMTZUSE94dkho?=
 =?utf-8?B?RTZvVU9XdVBFVkt3emFaRGc4cERZbVF3Z2xPSFBwdGl5b3JNOXU0M0hVbTlh?=
 =?utf-8?B?R3pDYmNGcnFjYmRvLytzUUtyeno3SC9JQTFHMGIxRUtmWjlaeVI2ZnIra0hT?=
 =?utf-8?B?bnJJVjlLMGNtYmpwa2x2K2dtaktRSjFaSVlZQ0RSOW5qR3NkVE5QYTNDbFcx?=
 =?utf-8?B?T3pRc0FydmVTT2RiaFQxSis2MUlES2ZCc0ZaaEFSMnNzcmp3a2xSekttNUg3?=
 =?utf-8?B?VHBpL0QyUVBEQjhIL0pkL0FaVVYwcFd2OG9jbjVNazcrR3MwNlpjeVV1MVBz?=
 =?utf-8?Q?BlEUOL4V3hOi9qt?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a535702b-7997-47d9-30f4-08db6120c2e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:15:54.2046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cMXVmCkWyYQTrW7GjbSkYrqO1XV6QZUyNVKn3LK7OaAH73CQjyqKqvjn+chkxcrMssmJ+Q0YfOrlQ0dofz1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6529

On Tue, May 30, 2023 at 04:23:21PM +0200, Jan Beulich wrote:
> On 30.05.2023 15:21, Roger Pau Monné wrote:
> > On Tue, May 30, 2023 at 10:06:27AM +0200, Jan Beulich wrote:
> >> On 29.05.2023 15:34, Roger Pau Monné wrote:
> >>> On Tue, May 23, 2023 at 01:30:51PM +0200, Jan Beulich wrote:
> >>>> Note that the FB-label in autogen_stubs() cannot be converted just yet:
> >>>> Such labels cannot be used with .type. We could further diverge from
> >>>> Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
> >>>> labels get by default anyway).
> >>>>
> >>>> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
> >>>> still have ALIGN.
> >>>
> >>> FWIW, as I'm looking into using the newly added macros in order to add
> >>> annotations suitable for live-patching, I would need to switch some of
> >>> the LABEL usages into it's own functions, as it's not possible to
> >>> livepatch a function that has labels jumped into from code paths
> >>> outside of the function.
> >>
> >> Hmm, I'm not sure what the best way is to overcome that restriction. I'm
> >> not convinced we want to arbitrarily name things "functions".
> > 
> > Any external entry point in the middle of a function-like block will
> > prevent it from being live patched.
> 
> Is there actually any particular reason for this restriction? As long
> as old and new code has the same external entry points, redirecting
> all old ones to their new counterparts would seem feasible.

Yes, that was another option, we could force asm patching to always be
done with a jump (instead of in-place) and then add jumps at the old
entry point addresses in order to redirect to the new addresses.

Or assert that the addresses of any symbols inside the function is not
changed in order to do in-place replacement of code.

> > If you want I can try to do a pass on top of your patch and see how
> > that would end up looking.  I'm attempting to think about other
> > solutions, but every other solution seems quite horrible.
> 
> Right, but splitting functions into piecemeal fragments isn't going
> to be very nice either.

I'm not sure how much splitting would be required TBH.

> >>>> +
> >>>> +#define FUNC(name, algn...) \
> >>>> +        SYM(name, FUNC, GLOBAL, LAST(16, ## algn), 0x90)
> >>>
> >>> A rant, should the alignment of functions use a different padding?
> >>> (ie: ret or ud2?) In order to prevent stray jumps falling in the
> >>> padding and fall trough into the next function.  That would also
> >>> prevent the implicit fall trough used in some places.
> >>
> >> Yes, but that's a separate topic (for which iirc patches are pending
> >> as well, just of course not integrated with the work here. There's
> >> the slight risk of overlooking some "fall-through" case ...
> > 
> > Oh, OK, wasn't aware patches are floating for this already, just came
> > across it while reviewing.
> 
> Well, those don't cover padding yet, but they deal with straight-line
> speculation past RET or JMP.

Introducing the helpers does make it easy to convert the padding for
all the existing users at least.

> >>>>          sti
> >>>>          call  do_softirq
> >>>>          jmp   compat_test_all_events
> >>>>  
> >>>> -        ALIGN
> >>>>  /* %rbx: struct vcpu, %rdx: struct trap_bounce */
> >>>> -.Lcompat_process_trapbounce:
> >>>> +LABEL_LOCAL(.Lcompat_process_trapbounce)
> >>>
> >>> It's my understanding that here the '.L' prefix is pointless, since
> >>> LABEL_LOCAL() will forcefully create a symbol for the label due to the
> >>> usage of .type?
> >>
> >> I don't think .type has this effect. There's certainly no such label in
> >> the symbol table of the object file I have as a result.
> > 
> > I was expecting .type to force the creation of a symbol, so the '.L'
> > prefix does prevent the symbol from being created even if .type is
> > specified.
> > 
> > Shouldn't the assembler complain that we are attempting to set a type
> > for a not present symbol?
> 
> But .L symbols are still normal symbols to gas, just that it knows to not
> emit them to the symbol table (unless there's a need, e.g. through a use
> in a relocation that cannot be expressed as section-relative one). It
> could flag the pointless use, but then it may get this wrong if in the
> end the symbol does need emitting.

Thanks for the explanation.

Roger.

