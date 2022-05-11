Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A85235C6
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326995.549686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonVs-0000G6-FF; Wed, 11 May 2022 14:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326995.549686; Wed, 11 May 2022 14:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonVs-0000DY-BA; Wed, 11 May 2022 14:40:28 +0000
Received: by outflank-mailman (input) for mailman id 326995;
 Wed, 11 May 2022 14:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nonVr-0000DS-Ig
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:40:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aff4afd-d138-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 16:40:26 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 10:40:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB3661.namprd03.prod.outlook.com (2603:10b6:805:42::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 14:40:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:40:20 +0000
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
X-Inumbo-ID: 4aff4afd-d138-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652280026;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xR/LGYp7NH6Emk6fmDcrmMbdt7fueI2f/9Tt2hfoHHY=;
  b=Utkp3AnkRFzM68Tia6/7lNFeShAwkpotAg8gSKXsaFkc0OR+x3wfVEyt
   0k/8TnFY6x7ap315dOARH3vc2fqWCv1xgA/9nSPDvk1RavIuNLDdrPu7Y
   zShuWkALSjRdpjC16go/aeCutndTvPC9OdQGCvyygftkowSDKW8Ew4zD4
   k=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 70947052
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MyCFxauiM5/aGSaL18pPIn3Md+fnVGlfMUV32f8akzHdYApBsoF/q
 tZmKWzVOPuMYGr3KY92aY3i8xsPvZ+GzYViHFFrripgEHlB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8TOLDtoMQDXyNyTTtbO5Z03ODfAUGg5Jn7I03uKxMAwt1IJWRvZcg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5o1qiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3N9PZouzWJpOB3+LbXAufKd8K3f4ZQgVzDo
 nKY8Vr7CB5PYbRzzhLAqBpAnNTnmCrhXYsIGb6Q9/h0gUaSzGgeFB0XU1SgpfCzzEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceRyEu1
 1KPt8PkA3poqrL9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiJ43pgLCSJBkCqHdszHuMTT5w
 jTPoC1ggbwW1JYPz//ipQCBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:ArynpKt3NFnp3a7va5uuBaj07skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="70947052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvZEYYHybrv9L5DOkUDbldgVmrRIzYGGHMkMiovz36WZke5Uic30gqg07PoaSJV5cYhU4gh3fA9k3VagCp5miyY8RAcsXOyvyatklPHFsqFq3F8TYMIz2Aam2fZiBbPB1BLYmn7b3cfZ5aPLi5/ojHrx/A/r+Y2A/f7KT8i2TpKwywK8zL+rqy9RzS0vpaFbeoLs8+NHkjvvh8tTz38X/jEz0qzPKUapxvYoGLRmWc6l+7/cub5Gb2XBp3NuA0vHCb4pQYtyOnitp2p6stYIkw3M4BwMNBIlSIwWTjRzzY/qCdLc083SD6onxhdbaQvLYcm8OLoTjjUiHrz6uqzyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMXWt/M9Qsr7lS8ZgCrHGD4/arQ6gMgHS7x2uYjxOns=;
 b=BnVMSRT/otscfjntj0MwNB+NlfBd0UHcv4Be9XUxKFLmhEgbCzUkQgMvtJnekvDrRGNh/R7f3dQvyoDxrOPB67C/OSsPB/dgJ9k7B8ruG8K5I3qLP6uCDhyd2CnBr35nDNwjJaTGe0WiDECd0QON4fM3RAhfyNo6B3o6tzsza/Q2NyAzqN/k7tKVBgfWCOeg8GPiKyOWBqNp5BOSWSbko3AbOPJeE4Eb2hYF3LaVdtz3jEsZrtvq9SIOeQLHDZFsPhQfY70CE7wTSodXShg6jhvbi0x6rEuWgiTKse9IO7H717bq8XveNtNveMBxX5fN/+k7hKL5zBCvfHztxYJAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMXWt/M9Qsr7lS8ZgCrHGD4/arQ6gMgHS7x2uYjxOns=;
 b=VSDMlXOL6iTYneTg2gMpVop7z7rqMbCNTmuKPto38eyIkjo2nxnrWPX/aCd18makqkfcqNbycufmAqiSEwbLL3+7K/9m+Hp4+/MuIUj3Q/Nr5lGWOY05miuA6dbhtdPSPSnP+vyo2vgbezCgfoyEAFxfaOg41PLpVcnVR6bTGaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 16:40:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Message-ID: <YnvKz6NLowrczyEt@Air-de-Roger>
References: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
 <YnvFFdBR1tgbOMkQ@Air-de-Roger>
 <9e087a55-8384-b25a-fb94-1ef421c7fcdf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e087a55-8384-b25a-fb94-1ef421c7fcdf@citrix.com>
X-ClientProxiedBy: LO2P265CA0478.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aee42dd-1218-49df-f6fb-08da335c2cad
X-MS-TrafficTypeDiagnostic: SN6PR03MB3661:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB36611D9795672AE6053C410E8FC89@SN6PR03MB3661.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x/y2KKCzLmbjFjK/xtt1+LTeD5gyYaAegl/u/iS7UH5m1NGN0lKoOTNNvKlgU/KiNoJoBlrOaBiYpBZXcXQa5Cfa0E0vYHKuSSstNZYJHqACWjeabZeLoQn/vGnqX0ztoUVX36jgfXIi6ZnJnkmKEseXIkHFR/VOm9akqXuBv9xbwkwVaHUZjvz8u4M1biNfVGJvF8yfy2Tv42qMUlJ3YGd0dHjihwH9N0WC/OrQ28KNsMhSSp8cV3WnpsHrm49MPPg4bU7PQLHRzbVgniJZ7aVyPck+16aMGkyKoeugF9Be0jU3PKLLOtuCe5Wo4WkTj1O1+wXKX2GpEpJpbnEzz2nGl9rBiSvVIq2YYiIpujAYOGEr4PVPaTIAwLTVlzj+zp0p394+fogev/0BLh76Atl5aW6keJ9r+K9Psc7jZDZNzTlVWqaegkdUgv8WX0P77JAyDpqM4qMk62i0ordv5XWb+J0AhhGAKKev6/EqN9qjGF+rbr6tltLav/0iwh/c5YuYSkVh95o7qqy3EQORTQ3M5fzuvkVvNYkXdaaqsdw8gI91Zjc1NSb0CQOPqV4N2gIgfgHLS6CXuFj2FkK9y9RqriLzWy7oHB1H7IHbmPSoBcNshq47F/xF99cRA7KDTsz/WywWyxqZyi4HmQLGRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(86362001)(6666004)(53546011)(33716001)(38100700002)(508600001)(6486002)(83380400001)(66574015)(6512007)(26005)(186003)(9686003)(5660300002)(85182001)(54906003)(6636002)(316002)(2906002)(4326008)(66946007)(6862004)(66556008)(66476007)(8676002)(8936002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2wxbkhLYUF5TzFBKy94Wm5TRnhVVEpKN2Y5MmJOSGM4TVc4NXVvTXYrNnY3?=
 =?utf-8?B?VkxCcmVWR1JJbitBRGxucHQwaEovbG1ZMFlKR3YrdGd6WFhDdmI3VE5haXhY?=
 =?utf-8?B?VlFoTEVwZUphWi9XNGNlbDl4enRpMTViL2NHR0pwVW52K1ZRRWtWUHVlaTZi?=
 =?utf-8?B?Zlk3VTIrODNmRG9QbFVZR2pvbjZhQ1ZYZm9rdEs2eHF0RGl4R0FHejY0OCtp?=
 =?utf-8?B?dS9vUnFibit2Y3I3NGdPR3BsbUZ3MHFuU3JidzhEL3Ywc0g3Sk1kenppM3Rl?=
 =?utf-8?B?RFdRK3Q3YitHZnYyRlE4Y1pXMFhiY3lid0Q4STAycGxkSkd0Wm9sbzlKaXU1?=
 =?utf-8?B?Q0xZbDcrRTRKMGZyVFpTS0tyYXV1OUVYcUpPK3M0SGcxUnZuTXdsOWo3eENB?=
 =?utf-8?B?SnBwMVFpbEFVaFpUUzA0THJNYVpOaXE0OHpxcEZLb2VIVThMdC9TK1BGMndp?=
 =?utf-8?B?UzBUVHVQckRRMmRQMjdhRDZRUE1XTTRyK2FFVGRscHFycjNURlRkcU9IOGo3?=
 =?utf-8?B?Qk96UmM4MFRXUHpqRDc2eEU2Tk9sb2lUQld0bUY5TFd0QTRCOWhybmRyUjh0?=
 =?utf-8?B?OUxSMUhQR2hkaWF1QkNzMldZWjBqbXRTMWlZSVhsS0h5OUFpek5lZW1RclRn?=
 =?utf-8?B?bHQ4cnZib0dKK0JDeWdoNmNESkJSRFBIcy9ta3hGeDBuZDhUd2dNdC8ya05E?=
 =?utf-8?B?dGhQWUdMSVJac2RDKzh5ZkZTeFlVOVAvYmZXYml2a3I5MGJFYXZuZ3hOZTB0?=
 =?utf-8?B?YSt1cHY1ZkRjL3M4bzgyUEVtK3lvVGpCUGl2VDdJTzhQNDYzVUlHUTBGbnYr?=
 =?utf-8?B?N2V1TDJmY0RvdHJaWE9NTUZFZVJ4clFONjhwL3FUMThrcXozS1U2c1NNWFFX?=
 =?utf-8?B?ZVRtdGRRTkFLNFBKTE1WaVY4YnVGdTladXlWd2xVSjdPUlNqdDBuQlhCUXcy?=
 =?utf-8?B?ZDJFN09XV2k1azJHb1NGL3JsZFhGdG1TU0UyeHpLSWVOMmVpVkMwWDZ1QVlU?=
 =?utf-8?B?WEVzQzEyaVAyVUtkKzNOMlc1Sm9GaHRDQ1JRbTRBaGh3K1Q3d1orWk0wMjU1?=
 =?utf-8?B?bzVjcS9pQnJncm5iV3ZYR1VZNEFsSEU4UUVha0hKNUZtL0hseXIzRmRPS2x5?=
 =?utf-8?B?UEd6Y3pSTDdya2xLazdNL0c2RHlJMWNHd3I4RHljSXdkeU9IeG9hMDRDYSsr?=
 =?utf-8?B?WGowbXROMG40WTcrZWJ2cm4xWGdJb2lsYkRlekVxdzhPQk5rVzRpWXVna2l2?=
 =?utf-8?B?VEt6cys2eDByUmZZWjlsdkUzbXhmOGpHYzlEVTlvaTZzQUdsOGZIdmg2dkh0?=
 =?utf-8?B?Ym8vS3Zyc3ljVEgwWGU2SFp6dGx6QksyeWU4M2hGZEtPWlBaYmxKMGtvWmU4?=
 =?utf-8?B?U3VwNkN6d0NpZkNEL0VUc1NGYTdvQmRtVHh4QWowVmJRZzJtTHFEOEhvT3c0?=
 =?utf-8?B?NTJzTlBmYTI4a2tUMzRrVFFuaEtMSFFCT0NTNHpCaVFmQzk4ZmdYTGN4Ym1v?=
 =?utf-8?B?d0RidnNmb2VPSUZtbHNKV3JwTENOZDE2VDA3b243T0FFUU83LzU4Uk5LM2ln?=
 =?utf-8?B?dWVEcHVXOUgxMUJHT0hxdk1SSTVxZnYyYkljcmRnU2xoM09najA2aEdSdjEx?=
 =?utf-8?B?UkxYUGs0Uy9tNWdSSkJDNHlmYW84cTh2anMzNjJHQVhEeU1mQTlsRlFReThQ?=
 =?utf-8?B?S3oybFNBL0djbmtYS3dQU3l6VW04cG0yNVVuMTZlMzFiVitLOGhjYVVIRmhv?=
 =?utf-8?B?YnZhOVV3SnpxT3NTdXIwcmdmbHQ1c2tGdXRKSVJvTDNia0JlMDEzczRJd3k2?=
 =?utf-8?B?K2Fmdm92VWtBdjIvQjd1cGRtbGVPRDNRbzN6RmdzbTVsb3Uza3hnWU52MFda?=
 =?utf-8?B?WVRsVHp2Z2x6NTZhUENkNVQxSFhWOS80QkJpTGxiTnMvS0ZGemZDdnE5aVA0?=
 =?utf-8?B?NlMrZ1U1cnZRcGIvRWNRRzdhQ0RtRVBOeEN5bDRVdGw4UHNHRmtwV0tXcjMw?=
 =?utf-8?B?M0RRTlVqdFB3Zlp0U0FqTS9Yb3VYM2VRN0xucFdFcGpJRVBMaFR2TEtpNUZZ?=
 =?utf-8?B?WlVlMnNLdkdtTjJZbXRvUC9qcmhtQWZNcitmS0YxOFZzVlluUmpSaHQwcnJ0?=
 =?utf-8?B?bWFNZDhBaWt4Vld4ODhlcjVVN2NDZFZLYXc5dW9wRklicGNKRllVUVdyVUM0?=
 =?utf-8?B?ODNrN2g2UlQ3UlVrRGFvdTBHSXYrUzM3SEVsQk8rWDdyellaNXF2T09sYk52?=
 =?utf-8?B?eisxbE1NOWpXcWJOMGV3OU5hN3hXUS9VclVSYXhVbzlpSEkrbVU3UHd0VnUr?=
 =?utf-8?B?SnlJcXc0QTRhamdzMDBNcjN1NVlBY05ScEY1NHdYWWg0U0tBSTR3RFVuVmZt?=
 =?utf-8?Q?E+2hdg5yyhXOWuF8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aee42dd-1218-49df-f6fb-08da335c2cad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:40:20.9041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQZVW+jjuSWjiWPidI3TKfaMea6Agp/SDNSzBz2dDiU9iPsoYtOf44k/c4Hk3CeYVn1M1iYeXlv1hHyYrhYJAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3661

On Wed, May 11, 2022 at 02:35:05PM +0000, Andrew Cooper wrote:
> On 11/05/2022 15:15, Roger Pau Monné wrote:
> > On Wed, May 11, 2022 at 03:59:28PM +0200, Marek Marczykowski-Górecki wrote:
> >> Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
> >> by the PCI Local Bus Specification Revision 3.0 (from 2004) as
> >> "unknown"/"no connection". Fallback to poll mode in this case.
> >> The 0xff handling is x86-specific, the surrounding code is guarded with
> >> CONFIG_X86 anyway.
> >>
> >> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >> ---
> >> Changes in v4:
> >>  - adjust log message, change it from WARNING to INFO
> >>  - re-add x86 reference in the commit message
> >> Changes in v3:
> >>  - change back to checking 0xff explicitly
> >>  - adjust commit message, include spec reference
> >>  - change warning to match the above
> >> Changes in v2:
> >>  - add log message
> >>  - extend commit message
> >>  - code style fix
> >> ---
> >>  xen/drivers/char/ns16550.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> >> index fb75cee4a13a..c0d65cff62fe 100644
> >> --- a/xen/drivers/char/ns16550.c
> >> +++ b/xen/drivers/char/ns16550.c
> >> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> >>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >>                                             PCI_INTERRUPT_LINE) : 0;
> >>  
> >> +                if ( uart->irq == 0xff )
> >> +                    uart->irq = 0;
> >> +                if ( !uart->irq )
> >> +                    printk(XENLOG_INFO
> >> +                           "ns16550: %pp no legacy IRQ %d, using poll mode\n",
> >> +                           &PCI_SBDF(0, b, d, f), uart->irq);
> > There's no point in printing ->irq as it will be 0 or else the message
> > won't be printed.
> >
> > With that fixed:
> >
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> TBH, can be fixed on commit, save another round of patching.

Indeed, thanks for taking care of that.

Roger.

