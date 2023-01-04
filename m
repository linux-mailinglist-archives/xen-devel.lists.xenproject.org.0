Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C8F65CB64
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470874.730530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsYo-0008Oj-C1; Wed, 04 Jan 2023 01:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470874.730530; Wed, 04 Jan 2023 01:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsYo-0008MR-8y; Wed, 04 Jan 2023 01:27:18 +0000
Received: by outflank-mailman (input) for mailman id 470874;
 Wed, 04 Jan 2023 01:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCsYm-0008ML-T5
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:27:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea2a94a8-8bce-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 02:27:14 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 20:27:11 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5962.namprd03.prod.outlook.com (2603:10b6:408:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 01:27:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 01:27:08 +0000
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
X-Inumbo-ID: ea2a94a8-8bce-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672795634;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CsMEGptc43vLte0q02CVPOWS3aRKtCm8JX6gPknmLfM=;
  b=ULq994mPcGoo/JoMTeJk5yv0mBznXEgAiBtJbjE4fTfm3SgFaofftJPg
   s9USZV5T1bE8loB3RZkzkUlKAhT9402euZFuKtuIS8swDTEDT4eTVQ/5L
   wi/7eD+q0FhBq8ll/UebGrf6LBMWK+AQ2ifVVTPdpZwgwfMn0MEmJ0Ni5
   Q=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 91475861
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rfnMHKp/nnagpfBlVQIOqt3YA8teBmL4ZBIvgKrLsJaIsI4StFCzt
 garIBmGPf2NN2DxeY1zPdnioBkB7J7cx4A1SQdl/yoyESND9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyJNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACAcb0+8luXs+7iyTsJ8u+A4PuLgJrpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWNEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpr6I13Q3NnwT/DjVLBFeRiOS4sXePWvx2I
 m491hoIrqktoRnDot7VGkfQTGS/lgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9JmYYaSgJZQAM+dXkrcc4iRenZtNiG668ipvyAyP9x
 xiDqSR4jLIW5eYM06i45lHGxTGxvJ/CTg0yzgrSV2OhqAh+YeaYi5eA7FHa6bNMKdifR1zY5
 nwcwZHBtKYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX74Gu9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:JwGQCa/ozJNLz6UEVFtuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="91475861"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j35cgxW88//7tu9zUnPYnw89O5WIBjTRF+Fw+9EjwbmzmERUsEI38jxJRsP+GkdbAKprYk4xkvc6YR93XpduvgkSgTCiV0BRn+JpZMri2CwcV6F8kD+3AZ/A/NQWXFwpn0JVnoryYFRpTfTz3yylz2jmclOhqS7zKMKTPF4w6S8IsEM5WUI9m/MeZNFpq/m+7UP5RWWS/UcOYVwf0N6JZLhwKRJ8Jymay+iix4Tv8JpXae717T9QkSxERlw7WPmnMUbtfKzsFumvFg4fOlaOvkbJSGc5+wYjmd0wenutgaWYzW1fBRAE3MulNuwJzTzoqONLJ7icDxs66yh1xM2Plg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsMEGptc43vLte0q02CVPOWS3aRKtCm8JX6gPknmLfM=;
 b=d4NcYJ1Hx+x+MPF00zboJ5BT6tR6jSa7iwWa59ImHY9QS9aYOQl1Up0vg+TMWrkcztfI+TGSoCYRLgJ8k/huVUxzM36yOivM4dCpvMzJFQu32zzvjdUnZrL7ogDpCVK+VAhvEDrbpqHLJexJJRJvJqWBl0MwUxqDrkdQZvbUSq0fhcy0YQVS/rBiEj1CT/CvrbVVtr9r88pi37InZFV++M0q73YUI871TcxI/OnLn95F5kxKkhXdkaDzyn92vuwDJIOSBfLMEqzF13Gz6EqA9jUQc+cSozYReDbAqAa4EYrxLvbt0rUUOj0Co/Gd3K6lfekWZYXW89zYxavQWcb03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsMEGptc43vLte0q02CVPOWS3aRKtCm8JX6gPknmLfM=;
 b=onQPY8K/ozqeQXc66qN0SQj7Ii8pGb8flLN+s+mlIsBHvWyHhM9KifUdbKWJ5XJIY4tIy+c7+XnaRX0wW7HY6b+ATd8FJ3EgTQRxux0x9FJCG7C0BY9UdBGbsVIwAfcBZuQm9VFTPDo2Tjm2HUOt51kYm4DGtLOlXBXpaSUAOwk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Anthony Perard <anthony.perard@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Thread-Topic: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Thread-Index: AQHZG+cbFLjU6ViRqEqaO8BfTNldnq6NfEWAgAADPYA=
Date: Wed, 4 Jan 2023 01:27:07 +0000
Message-ID: <34e692e3-ef76-a43e-ec4f-a7c1ed2d094f@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-5-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2301031713530.4079@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2301031713530.4079@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB5962:EE_
x-ms-office365-filtering-correlation-id: 187c1aab-702c-45e3-5da9-08daedf2cb87
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /v4ND3ZQbgdjQX3BW9gyCmC0r1dhlP6o4NuZv1D11joi0BQ39rfHWjLHLIr017DmFtTWRXArxfki8BM8dBceS1LLcYxwIqii7W7L5g8reqmzkYAhg4za3lx5x7PHJabdYREoIbfCgv3o9uzE9K/c1jP0c8hI++zgKN8SIB038bH8WsXvTa2Nw28HDd+efVZYJukVXkM211KyotLMPOvt+mDPjHSKDqXNyvKFL65wl6cJapRuySXCHUBKzlIaFcyeIqFtgNtr7GkOvZWjblKH+iglYc9+qS0d2EIM2o1NgqNsKSdGew0pzZ5unfRlooJvfTGBXORweDsajpVfXfZJo+d2/Yym5DicEc4ORgiCZDTgJsoVJWxMi4KHoNRwKhXlFzAfNj/5nilHnI7bZ5iYnpCEnalLKocbsVTYM1FfdCYDh8yRgNHUEmxVlYXHCZ9f+z1HGX2d6sxC3HyxCMr1WPQveNVMKHTpOEgBt7UIHSmjQrhYbwZwe1lenjRlEKVe+9p68739i7Dv+/mI60chloRSuJpHk7oa8sdTYMIFx7qWlhHKWG55oQpVwZ6QGOMJR/lVaXae0rbWOe+P6tsnDkZPZjAkIdtf6ulwgPKnmW+7xRs0HrR3XKsztNovsPVW4T7yU4cbXoUKPztN63gMMSF3tcvJaapU0izkXfcrHNfoK2MYlQkRtNcttLT7+fo1wuRtYdHT8wqZcGiKdjfkFA6e7bKHH1DK3JO88QtDEBC7iEKeooCcrQ0mhNWhzZBKVCGh9D6XhblR01wDyxPuBQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(83380400001)(186003)(6512007)(26005)(6506007)(31696002)(38070700005)(86362001)(36756003)(82960400001)(122000001)(38100700002)(53546011)(2616005)(8676002)(4326008)(31686004)(41300700001)(8936002)(2906002)(5660300002)(6486002)(71200400001)(478600001)(66946007)(66476007)(6916009)(76116006)(316002)(91956017)(54906003)(66556008)(64756008)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmE5ZmV0S2JUZFNUd2JQV1I1QnlvMS8xdnZlZ2FtVDdjM0MrUmRvUHpyUWVL?=
 =?utf-8?B?TEVRQ1BaWDYwaUU2cnNtVlRxWmtJYXQ1SklwSjN1bEZ5MlJvWVFCU3NLY25D?=
 =?utf-8?B?Yk8wd0ovc2tobTh3L0U1alpyaEUzOHZwL2dQc0IvNVBpbVQyakdIcFMwM0FG?=
 =?utf-8?B?UFNqdzRjSVdnVjJ5UlhNV2M3ekFRckJSV3cxejZzandzQ0RLeHBadzBFNmlo?=
 =?utf-8?B?S2FUemxkN0swdmZmekFaVkEvOHNKWUlFKzkzTXlLK1k0RWd6dEdyb2lrcER0?=
 =?utf-8?B?bytWejVwdE5rWkNtYUFJTFR3SkJGRXMzRktKOW9ycUw2RFU4aEtZSEh3Zmhk?=
 =?utf-8?B?SDkzVjYyWDZzcmxraUVXdmU2T2FlZEVRR05YL1B6UHVpSy80bmowdTc1MU5Z?=
 =?utf-8?B?S0pQL1VtVUxCNThIdk02VDNhc01aZy8vQzczb1N2aXFQV0NhQlk5eUJvWndn?=
 =?utf-8?B?Yy8zK1NLaVhGU01DNGd4R2xhV2RLR2pxWEZRaTV6VlNqcHdsMjl3YWd0aFc4?=
 =?utf-8?B?bnY1LzNaWDN1ZEZQK2JWSnNUSlJkaGtMdGtDMHFhNGFpUnpGYU4wSXk0M3Fi?=
 =?utf-8?B?V2FwYjV4UXB1U1Bnclo5Z2FkKytnVCt3U0hPckFROG10WnRKdE9jVmlVU3NG?=
 =?utf-8?B?TnlZS0xXd1JZVFNFNVo3bUR3M0lLRkVMZ2ZTWW5pQXNIaG1PU0ZYcmVhd2dq?=
 =?utf-8?B?WllBRzRpd2x5ZkJBbEcvb1lGSUVaZ2dWRVVPUUVIR25ibmVmazQvNWFPbzVz?=
 =?utf-8?B?OS9QeE43NUEvL1pKalJzZ0FtTFdFOStubEpsdG5QbUI0Qkg1M3VnWDNuN0F1?=
 =?utf-8?B?YWp4eDVxU1AyUXNoUXdLY1RRb0VtenlvUUZ3YUNjTkNQb2lacWhtbW9OdlBH?=
 =?utf-8?B?cGIxVE5rYlFYTmRtc3NkcUJuQjF3eGJhZWc0cmI1d0x1bkZjZHZ2VVhSUGZ0?=
 =?utf-8?B?NmduRHcrTVcvdDdxZG1lTG0xdXoxYkRlSzRsQzc0VXZGeHU0NjVCalo3Wk1k?=
 =?utf-8?B?ejBCYU9LMXFZSlFDNmUvME1xaXFLZk1yZ2R6TENTcmZCL3llbjU0N2dHY3dU?=
 =?utf-8?B?WnF5dW51c21TbUhvb1pXSzRmbEh4WDVocEdKdUhXMXJGUFQwOXhFM2F2d3pU?=
 =?utf-8?B?WDZWdlhEeEN0U2xPRkZld20vQ0lBNHh5MDREcmFycEtqenY1Um5MTndNNzRT?=
 =?utf-8?B?eXpVTGxRZUhoTkFMSkkvd1VCUnM3NFViWDZWZUZxU3BacXYxTnNtWG5Hand2?=
 =?utf-8?B?YzZxRVVXMy9BTkJ2d2ZWSlZVWkx5MzY2WXA1a01Sc04wb3RhUnFqN3JJOWZm?=
 =?utf-8?B?d3F4R2JaMFRKLzZXUEJ6TDZrcjgxckV4allsTWlGS2t6RGtsVjFEdnVobUFK?=
 =?utf-8?B?eVpXTTNuSEhnQ1FjbW1ySUhjMjgrY3hwNjNSaXgvTHVNU3c5UEQ2cXFoRCtj?=
 =?utf-8?B?ejY1QWJCODVPUllyQkh6S290Sjgwckdpdlk3R25uek52RG1SWmIyZWducnd0?=
 =?utf-8?B?NytzM1h3MVVlejI2a0h2UzdpZDEwN1hod2xkMGNOSUNQSzUySXRTcndlamp4?=
 =?utf-8?B?WkJRTXZxRzNsOXRZdDJZd2Nxc1dyUnJMcDJCa1hGTWQrTW1Xam1sOTFxNkRW?=
 =?utf-8?B?M1hGTzMxVDhSelVkZTB2MWJBbU9pZXc1K1ZJeHh4YlprMnBhNFpKZGQydTQw?=
 =?utf-8?B?dmJ4N3ZpVmhXcDJyY3diRXJKWlYwTmdhSnpLUk0xaTEvZEN6Y2trUXBmMlkx?=
 =?utf-8?B?Qng3L1FnVDRaa2F6bFY5eGZ3L1Exck5yQ0ZRenY2V2FYZGpNS2lNejJkM1Rp?=
 =?utf-8?B?ak9xV2NKYmpaQXVMdTNnWTNOaXRqalVRZTBtRjlhWUFnSFJTMVBuOE9FTVBr?=
 =?utf-8?B?S0w4MWNIdDZFeFFzUE1nelU3QjVyQm1RNTc1bGJoS2ovZ1pPa1pWcy9IeVZE?=
 =?utf-8?B?YWM2N0Q0M01OZ2tGQ0JieldEcjB6azBwWFlpYm1YcGx0M2lPWTNJZmE3SWZC?=
 =?utf-8?B?RjJPcGoyd1plOWY5SkJvWExieFZ6eWVrZWNKSkM3cjkwUlFsWWc3aXlZdHBW?=
 =?utf-8?B?dWNhSTJmTFJwdDhaWWpYY0NXVUFKb3hIQkN5TWJsdkMrT05nREVEVG9YUys3?=
 =?utf-8?Q?ip+fuQahUav9n8no+MkUc500L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2D67F0DB1306749B21F0107D4DC0EC6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IIekUxq1ooG+5M7hXDklfTQgvJ+UziZomfAdvKzZE/9G0G5KEWYexsMtD2EailrNlQn1maFh4uMjsPoM326GS7EW1Mnk/14yrZErVd45G2wJHUG55FnkUexHooJNAbUxVyilykU06gsDJmsQLKQ8e/hPqXKnpuOUumoSImTYgxiWgEtntjWxUn1ev6O9+gwF5+ivXiVfs0uAxzdBOGi4EFulYVMakOFepg6X1f/duog7FnM2OnjlBffJzbQlSg1Scd5DSoD3nA8+z0p58pCWrB42z4RHjpZM/PuHrHOfxwIngvEwP6wY1oAnZDR1owL+Dve9NTSLtsm2Q2VCK54Iqmc7lg5pfJnHw/NLMZ+NTLd/GL+W4/GpNG+A7G/o79qOYOuOy6KxBkD/GfOyue6BWANrSS/LBcOjHL0oW7A05EeOSUGiTlOI6LNhlFC97Zad/E5sQG8pwwI/OnhVBJdN9rPUWknH4eopHt3eB2beXNZV9XymqJO7n8Ak+033rA1TzJh3ms1cyFReujEGcqqSn0fuVqbJYqfHsjSC2S2fzLVaNMrILubHLxvLw+eqdvBj55UA1mdbU6KCR9bZePzTWI9LKna0sWHiTy5EcbO6+3fUZdI0N3JB8nXTvWQ9BV0UJHyA7Y00hK6Jci1UAdT2k3SrgXz3d87qsdBlvV3pdRgxt7RV5EF6Bqw8yeBNghIbn6HGtZoWHRjboteHcOnCHIDu/ww0lMpiT55FG5zQ/DRDyfeY68U7mqTVyFyZ8KhdhqH26BijtPEKLO/pAjQ84bXQ6w2H2nwo6FIvBDbiO3EsbGqJwjPtTmI5UW37BMhYY1T5xJJ3PUrt7qFjzrtYVEGBZ1Ci1Ab0eQbtiqNh5TRahIHHZQEydVThzWB9XPFy
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187c1aab-702c-45e3-5da9-08daedf2cb87
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 01:27:07.8548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B3hwhehOI8jCBlHR4FRgSmRUVvI207TFmAWlbmMtYzO2JnGX7sAElbh7l4ZZLZFur0fhgnyR4JT/vQ/Bkde6SvCuh8GNlI93kLkVC44gHFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5962

T24gMDQvMDEvMjAyMyAxOjE1IGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIEZy
aSwgMzAgRGVjIDIwMjIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+DQo+PiBXaGV0aGVyIHRvIGJ1
aWxkIG9ubHkgWGVuLCBvciBldmVyeXRoaW5nLCBpcyBhIHByb3BlcnR5IG9mIGNvbnRhaW5lciwN
Cj4+IHRvb2xjaGFpbiBhbmQvb3IgdGVzdGNhc2UuICBJdCBpcyBub3QgYSBwcm9wZXJ0eSBvZiBY
RU5fVEFSR0VUX0FSQ0guDQo+Pg0KPj4gQ2FwaXRhbGlzZSBIWVBFUlZJU09SX09OTFkgYW5kIGhh
dmUgaXQgc2V0IGJ5IHRoZSBkZWJpYW4tdW5zdGFibGUtZ2NjLWFybTMyLSoNCj4+IHRlc3RjYXNl
cyBhdCB0aGUgcG9pbnQgdGhhdCBhcm0zMiBnZXQgbWF0Y2hlZCB3aXRoIGEgY29udGFpbmVyIHRo
YXQgY2FuIG9ubHkNCj4+IGJ1aWxkIFhlbi4NCj4+DQo+PiBGb3Igc2ltcGxpY2l0eSwgcmV0YWlu
IHRoZSBSQU5EQ09ORklHIC0+IEhZUEVSVklTT1JfT05MWSBpbXBsaWNhdGlvbi4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
Pj4gLS0tDQo+PiBDQzogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPg0KPj4gQ0M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+IENDOiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4+IENDOiBNaWNoYWwgT3J6
ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPj4gQ0M6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtz
aWkua3Vyb2Noa29AZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgYXV0b21hdGlvbi9naXRsYWItY2kv
YnVpbGQueWFtbCB8ICAyICsrDQo+PiAgYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkICAgICAgICB8
IDExICsrKystLS0tLS0tDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1
aWxkLnlhbWwgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sDQo+PiBpbmRleCA5M2Q5
ZmY2OWE5ZjIuLmU2YTkzNTdkZTNlZiAxMDA2NDQNCj4+IC0tLSBhL2F1dG9tYXRpb24vZ2l0bGFi
LWNpL2J1aWxkLnlhbWwNCj4+ICsrKyBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLnlhbWwN
Cj4+IEBAIC01MTYsMTEgKzUxNiwxMyBAQCBkZWJpYW4tdW5zdGFibGUtZ2NjLWFybTMyOg0KPj4g
ICAgZXh0ZW5kczogLmdjYy1hcm0zMi1jcm9zcy1idWlsZA0KPj4gICAgdmFyaWFibGVzOg0KPj4g
ICAgICBDT05UQUlORVI6IGRlYmlhbjp1bnN0YWJsZS1hcm0zMi1nY2MNCj4+ICsgICAgSFlQRVJW
SVNPUl9PTkxZOiB5DQo+PiAgDQo+PiAgZGViaWFuLXVuc3RhYmxlLWdjYy1hcm0zMi1kZWJ1ZzoN
Cj4+ICAgIGV4dGVuZHM6IC5nY2MtYXJtMzItY3Jvc3MtYnVpbGQtZGVidWcNCj4+ICAgIHZhcmlh
YmxlczoNCj4+ICAgICAgQ09OVEFJTkVSOiBkZWJpYW46dW5zdGFibGUtYXJtMzItZ2NjDQo+PiAr
ICAgIEhZUEVSVklTT1JfT05MWTogeQ0KPiBjYW4geW91IG1vdmUgdGhlIHNldHRpbmcgb2YgSFlQ
RVJWSVNPUl9PTkxZIHRvIC5hcm0zMi1jcm9zcy1idWlsZC10bXBsID8NCg0KTm90IHJlYWxseSAt
IHRoYXQncyB0aGUgcG9pbnQgSSdtIHRyeWluZyB0byBtYWtlIGluIHRoZSBjb21taXQgbWVzc2Fn
ZS4NCg0KPiBJIHRoaW5rIHRoYXQgbWFrZXMgdGhlIG1vc3Qgc2Vuc2UgYmVjYXVzZSAuYXJtMzIt
Y3Jvc3MtYnVpbGQtdG1wbCBpcyB0aGUNCj4gb25lIHNldHRpbmcgWEVOX1RBUkdFVF9BUkNIIGFu
ZCBhbHNvIHRoZSB4ODZfNjQgdGFnLg0KDQpJdCdzIG5vdCBhYm91dCB4ODZfNjQ7IGl0cyBhYm91
dCB0aGUgY29udGFpbmVyLg0KDQpXaGV0aGVyIHdlIGNhbiBidWlsZCBqdXN0IFhlbiwgb3IgZXZl
cnl0aGluZywgc29sZWx5IGRlcGVuZHMgb24gdGhlDQpjb250ZW50cyBpbiBkZWJpYW46dW5zdGFi
bGUtYXJtMzItZ2NjDQoNCklmIHdlIHdhbnRlZCB0bywgd2UgY291bGQgdXBkYXRlIHVuc3RhYmxl
LWFybTMyLWdjYydzIGRvY2tlcmZpbGUgdG8NCmluc3RhbGwgdGhlIGFybTMyIGNyb3NzIHVzZXIg
bGlicywgYW5kIGRyb3AgdGhpcyBIWVBFUlZJU09SX09OTFkNCnJlc3RyaWN0aW9uLg0KDQp+QW5k
cmV3DQo=

