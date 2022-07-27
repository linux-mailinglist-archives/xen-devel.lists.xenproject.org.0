Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8CE5824B8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376050.608639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeYP-0005Yt-SU; Wed, 27 Jul 2022 10:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376050.608639; Wed, 27 Jul 2022 10:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeYP-0005X5-Pc; Wed, 27 Jul 2022 10:46:13 +0000
Received: by outflank-mailman (input) for mailman id 376050;
 Wed, 27 Jul 2022 10:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGeYO-0005Wz-29
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:46:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 522bd99d-0d99-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 12:46:10 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 06:46:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5129.namprd03.prod.outlook.com (2603:10b6:5:1eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 10:46:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 10:46:04 +0000
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
X-Inumbo-ID: 522bd99d-0d99-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658918770;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2H7Xk5nN2/wEUsdUiR9+iVtjYWT9AOUJiLQr+li5S1U=;
  b=SDgKZIxzOuXOxEdHBDOjHkRUhPEsPIbQoIpgxf6b2YY0SFQ4a3w+Dq9Y
   l2dPpylHsrSTnPBtWmp8sPvGN4nlA8glX23w1niLKEATNBo1CSFmk+MHA
   Ta9UVAqHsIa27D3YgQcQ+VYBn/0irAEIAAODTUbSelCoIjscTV4bQIHhe
   M=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 76725124
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AFWkt/aL7wWltGRF5FE//H55yqmolRxNeyxNyt?=
 =?us-ascii?q?3ClJ83I83tWLY9U/1M1TtTqPb7RdcPX9eFSkeUyjDPjDhmbA/iZCYnXWPvbo?=
 =?us-ascii?q?GfyAjKero8WSuoJKROtBLe51pzqpRrcaqoL6uoNMAjO69CH84cjrJbXTerwM?=
 =?us-ascii?q?DPeGvqEFFcHIFtJJVYz3Vr3ibL1CUf0Dfc9wNp6gIRO3srlfoB3mr1fgAIiJ?=
 =?us-ascii?q?0fV6ja7NemqagnkSmh60j914TrpVoJ+kTxUX5k81MN91yCpADO7/cR+w6acl?=
 =?us-ascii?q?U4ySVRuh1pyDVd0M7EEfepn/9o3h2MroSFK5Mxbpn+J0MkYn/VsV1oW2IxH6?=
 =?us-ascii?q?GRz06WgdxXPY1rJOKE5Wg4SfTh9Z6Ww+TecUQ3lXvpLobz9JJThmeAqStCdD?=
 =?us-ascii?q?sCU9DFrQx9YffjkO3ZGVeF3HZXADRUyAraniTZOYa3O2ncZ+kLjugSw1IEFw?=
 =?us-ascii?q?FbfeXMfynuQl/BL3kPuLv2eFiImUyVZPmdivZUCv6Bxx2LUKRq8g5R1REMZk?=
 =?us-ascii?q?dTS+uZr0lIZLRK/vGrGojm7zwkLlmdaGuN9f803V2CB2+sbB/VtQsFS568fM?=
 =?us-ascii?q?C/saP0aBHR2zCYbN3zvkAkzDCGoBbd1ntLz/2lPaj5+ZGgUmHXSHoknR4nqu?=
 =?us-ascii?q?m/s5Ym73bhADLYolOt/X3oplVlI7FA6SyMeckDraosUC2vH7WVqwty20z0MQ?=
 =?us-ascii?q?XSn8FIcHaR0cDbbVBfUcgznoKBQsY6zGMfcncqS+6lUfA/T9Bb6mdT1mNf4U?=
 =?us-ascii?q?Ik8mJu3f1/f5U+aiesDw2BIaWRJAJZrWHqcUYPXobKBV1mgwq2XIP28Qmy2v?=
 =?us-ascii?q?Kq8NWfKx6Sx+nCk601IfPT15zFU2rkZYD71/51Lst8YVKX6rDrgcFxCNCwpR?=
 =?us-ascii?q?aQL4evRDR47Zv0QwZllU9wY/FGEIJw7DZ3z4bd7erqHnpRDdgLOJisxexJpf?=
 =?us-ascii?q?pmqdjq3r10vUsbkld7JtA7uH2ehE2EnSmeY3OHvfJfy79HW/apNlwmS2jDjq?=
 =?us-ascii?q?vIfGAQBE+l5yC6CzWiqMKY5+oBDhKZXSISh7n0l1YCk8m/6KoYWykOTP6WO+?=
 =?us-ascii?q?+YO+fDp1Fq4+97uczbM0saVEiA/m6/J4vO+gz//kZQVEbR6z07sRSLf90Zlu?=
 =?us-ascii?q?u1mIPv7g4VlSrOQjHaxhhBcmsH3lic2WlRvL5PNHpjrc2mnouyO2kuIs7lMV?=
 =?us-ascii?q?TW7ndIdp5Cr6Q3poH3Htc/T+9LXpWgm2IUDEgg4R864UcPiXcpVauAPAmfbC?=
 =?us-ascii?q?UkuKKLE+BS0hblroCMG7nc2F90JuTJEDv5J2FGvB9Y29C/K4C0z7s/KX0shb?=
 =?us-ascii?q?yjuH39lFo9QuxmjTU7lqs4rQUF9DNl+syMPtZGjXhEVuOVIZluNthINajQgs?=
 =?us-ascii?q?jWRE9BxkXmakbNS78YYoIdqkj/KW0Qyds1YoNmIqDC0K5+uwmjEtukkbQunF?=
 =?us-ascii?q?uDjtVf9eGn85JCxaYqqbC6kzKdcKo5rTUKO4Y8WG1LTr95a+yY2eOqFVw7rR?=
 =?us-ascii?q?Zia0upDtbcYTE5N12ypj+4huhMC7TWJidLxliqimZx3MvOt/bFl4fMurE+/x?=
 =?us-ascii?q?6VdzLuXppYFuFH4XiYzOhoTP1+N+se5XVzxQ7shmg2p72KP6zLSTgOHvqf1P?=
 =?us-ascii?q?xKn8X4Fp8UFeIcFtDYx5c+INp87Y8YjLNzDAci2ZbX+ESXYGiERCe5fi8Hsl?=
 =?us-ascii?q?+nlCAoSXUFKogLCWJ+XeILHKoUwRcihx8tjYSOpOW+jP66I/jXnTfQAQVKCZ?=
 =?us-ascii?q?TFXuJ4XFKM98Bc8/OWiGwnv8rM1DBxZIcrZId9XO5vr+LsL2/RHXt3WQC1ty?=
 =?us-ascii?q?a/r0zZThnkyc78xljRXbSUTn+N5JXoQxmdqecaVIasdstvPLgco6xy1UQY7T?=
 =?us-ascii?q?/+g/O54nqKjuM3Kuj58f0+TsttYgzBFOZsff95sBlOY0yuTLzftFgwn0zyWi?=
 =?us-ascii?q?/B6/ZC+vi4AxutBy9cG43+Nbcet0C6lpVsFNszAR5FYCO/de2cL5AgPRmiwT?=
 =?us-ascii?q?tzvLYCwUHKCtiIgJY/lI4GKWv+m6kgl5lJoVhfIWw8WwTPkpfwwc5BJtTpdG?=
 =?us-ascii?q?ss5l9/z96a+yqi2bt8ll5F+9OaUV4B0TtEdl2kQSAgiKL0wYodFukhLYLgAm?=
 =?us-ascii?q?fDaZSTHE/15wK5EsDvj/iVMvn866XkW8EB5Ls7Qm1pFB8cjP1Sh9LvPRjkGl?=
 =?us-ascii?q?k+yTXMGHyEwD4x2T8UUeESUSooherbObajcMs5QV7Q01FRfYP56HgQFcgX8J?=
 =?us-ascii?q?KYZn+dIRv702H8uLUTCP3adaAlVZEfsSjm3DM9ASrCZ26+w6+nD00U6AFMci?=
 =?us-ascii?q?hFYmtdiktz0qvihReHz6EJGrPTqxuUsxYsg64SwGGbVueDKeYaNKUJ0XJm45?=
 =?us-ascii?q?Npj7ZoBOQUPrHshtC79gL4fBBA8Um+gumkxr9ZPjoLgHyt60Gt2Jc+tj2fM7?=
 =?us-ascii?q?R/Dh2AHOM2/RIKKKcZi5fEVjdG1ToyJumMzX8qlAP10j6E8plBMZHGS3qVtW?=
 =?us-ascii?q?0DzJHNYKmUKd7r4fJVcPZlgakgv9XVZ1nYnCK9bdP29RWZhhatZdB2g+vha4?=
 =?us-ascii?q?oXPQQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76725124"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BciU5WhWTpSjg/xC7TBz6v9Li6PZ+sqm56r2So5H6pDVrVr1KB1p5BiSp3mRY+h/CHnsWxaaOaunBvX0ZCkfzzeTIBLTmAM4Jh0tOETuGtTKbrAXPT7n631zikIj0fzbk2di+SPOkupDb9C7xRQvX/B3O1ogDz8jag/zaqc3ird7bJ5/Mv3p7Ixvh4hOVIU9NaXxiDDGmIr4GseobNpzjXovd/wGa0PGTF12rH1P7d50aXMdqV2tP0O88OssdZzTJaZQVRoVigBaX52hy5BMEK6QC5nwHj8aLvUe1a5HoeVqb+FHlMgnbM5VbS6wOyEcJ6iDKC7qlGJH0a6fpeTJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H7Xk5nN2/wEUsdUiR9+iVtjYWT9AOUJiLQr+li5S1U=;
 b=YQ66EAut6zTVOmBAWIVtU1jTMK7fXFrMcRQ32Qzc9IkatTVJ1ocA0kgUQw9+buccuD1k0KT3GVXGMpOtNmSDl0c9Phycmn1tXo8scg/8n4AeZnXyaIj7LqINS+cXB08A4d+/1CN3pnm5PPxluMq7r5uhpkXktaQYYs3PXtQ6/QtxFqf+xKi88YupeADW9WpUmVxpeSMvyicmlT0tMJ2S2Hm6BW7zYJp0/HniY/Fqb6BTcOs8TVxrytr6mFHr1AD+Jx26VPEXCyrYSXzyRTB50t+16OibrN3b5jHqpuRitlbv00x0cCicDkUcsDu9zrblkBkRMwhQd+aWnQVNWFYlKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H7Xk5nN2/wEUsdUiR9+iVtjYWT9AOUJiLQr+li5S1U=;
 b=qkRpcCwV6jk9+c5yOoP6Xv16S0medFuEJnHgtvyc9UI40dSQ45fJCXoL/+5P/Oq/qvV8ab85wLkLc6ONdwNKrwwxgvExMfXW/dstx5oCInGnIFxKyOTKYd1e1RkPLhxYnn9Nhdw/6ibYr1DbNpjm2gxvKPVscIzbvwhVDWkPi+I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Andrew Cooper <amc96@srcf.net>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH] x86/PV: correct post-preemption progress recording in
 iommu_memory_setup()
Thread-Topic: [PATCH] x86/PV: correct post-preemption progress recording in
 iommu_memory_setup()
Thread-Index: AQHYoaV9YQ4YmJ68iEaHOmfXphsBA62SCFOAgAAAhIA=
Date: Wed, 27 Jul 2022 10:46:04 +0000
Message-ID: <d7cafbee-37e2-0e28-d1ba-51d4b49c0752@citrix.com>
References: <13f6ca1c-559d-b89e-207b-d2685ea80bef@suse.com>
 <b5c3d4e0-5055-f220-691d-8367536e1ead@srcf.net>
In-Reply-To: <b5c3d4e0-5055-f220-691d-8367536e1ead@srcf.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea79ce87-f753-407f-d8b3-08da6fbd3427
x-ms-traffictypediagnostic: DM6PR03MB5129:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uiK34nOr4uClvZw4nixoL7yNy1yfNluzb2vgPuEIsu25oeyxPXwM2odRixtoXz3kKREB0BJSYb+CxmsHednb4AMYAOEUDGBjzefM+cTzumCIIzQY0uzBynywKnvreItdLxl/7iOngE/Lhoe+M7kSUNQbcNxat/QEqy/WjrwPYn42XP8RiB+hrP2/5cOwvbzVSvxlYtBdqWjruT7kzPiPHSHhjO8yS9+36Y0vyg2DHZZKQD1YHv4yQtQjeD90pHsKqr8LA1LQaveAGb9hTbk1yn51YNrFwxFLfBypSmfaLDaNEOsIpm036hVMw/lb6SkokfSAw0EDk9KRSUosycHyb8P04FAKxKlmdVxOPHajcVyTw35RyDuxHI5daHgZ3YiSeLZpUhbeQkGCppHpxC1dQ0v/qVaN1nO1AKSeEbLm2NyahtPzu7jo7VpSR3nYWP4zyRVNMz8wvSMePdL7eXgafSFkeZ8VnmWQL1SXdPu3TWeokSdDxnK80CiBf7CWLoN/Fu9tP7HcxmBEvRWNcADLxfqWeV36ZEvhMpmcv8pSSX66+JEI4ofjX2Udfzbg2hRI6xqyZu+ErQNAH8IkTmgDRXHuQT4YFkTuG1qEm1LCo7TdKX1tF3JIcso9lytHcldy0YZsGaM+bEXuwxto1yCoKs9DnkQO1YiNhwchrTtoU1LBmyipT0+iZ0LpqA9bDPKgTziwIWvNm+WZ0PPCElG/IpoJjm/cpi9dwisvx4MkTglDKWNV6FH6F5qFbJukq8Rn6czD1i4jKWM3sbZ96boqTPZG6a2X/TPzdNTocGo/vaNofiYnXcTekFqffa0gWxEt/Wkxnly0FCmKIT7PBJ+1v+1fjCKpYQyPqomqSGZ7Rfz59UiBJixO7mwbvzTJXyIa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(8936002)(66476007)(186003)(5660300002)(8676002)(4326008)(66946007)(76116006)(316002)(66556008)(91956017)(110136005)(54906003)(64756008)(6512007)(26005)(2616005)(53546011)(36756003)(31686004)(6506007)(41300700001)(4744005)(38070700005)(38100700002)(122000001)(66446008)(86362001)(31696002)(2906002)(478600001)(71200400001)(82960400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDF3ekE5em9XN0F4ZmxUUW1wRElnVytCd3NPMk9SeC9YUm5KNENUVDEzV0lM?=
 =?utf-8?B?bWVHQ1lIS3RIaHJEamxVeTFxdUpnU0l2YWdoYm5tOGFWVUhQc0FtMGhpVzRB?=
 =?utf-8?B?aWNUc2x1TGh5dzB2NzVtZGVTSEFkQUJWdnppdWYwNWJrampMMW80ZXZhS3F3?=
 =?utf-8?B?dzRSQXQvazQxMUpaNmJtbmFNSXk4MUFXdTlCNUlBZ3pSTW82a2xsL1FPanBm?=
 =?utf-8?B?b2FHUll5K0psNWFWU1dXa0gxSkFCQlAxSUltTTF0Q3JHQXRCVUJKVlI0V3JU?=
 =?utf-8?B?VUwzc2FJSDVod3U3SUlNL0U5R2FKOVY0eHdGZ0dxRHdxVzNCeHFlVGExYVRL?=
 =?utf-8?B?V3U1ZVhMZEpPd1cxL2s3QlMvK1Z6d3V3aXhSeUIzTDZ5MGlLOU96SFo5OU9k?=
 =?utf-8?B?WnMxMGZtbnMwNGxNVkFwRUNHUkVUOXVmUlJ5UDY3NEkrcmlZbDFhcU1hNGVM?=
 =?utf-8?B?WDV6OWVHZFRFckllTjBRbmlocjZWVlhWck00QklxaWpQRGJwcDNjQkMwUUM3?=
 =?utf-8?B?YnFFWjlPVmtralFiWlpnc20rNUxHS2gvdlJSZ1JZQS9WUUVmYmsyMElVc0dP?=
 =?utf-8?B?MFYxNk8vZmtpQUxwbm9YRUJrRUJjNUppT0EvNUY4ZktRVUJBZlE5TnRoNlhT?=
 =?utf-8?B?VmxEdXZMMnJrZmdTb0k4R0t5RjdqNUxkdHJWc2NhazNMbGpqakIzeW5rbVQ2?=
 =?utf-8?B?UnVIZENVQXIzenBzRnFHY0EwNE9iT3l1RHRWTUpGWlBNMWNTMkMycmgyRGZq?=
 =?utf-8?B?U1luOVZKMkUxRHgyaGk3S2IrT0xTbzY2Sk5PTWxzLzNTcW5RYTRhR2czRDQ5?=
 =?utf-8?B?d0RpRkhLWnovcmo2Q1hqMkp6Vy9uREhacmM2aDdHclpmT2dnRzBIVFJybm5j?=
 =?utf-8?B?YXFiTEdWZHNGbnV3YTRNZXMveEpDWjdjeEhDa25rQm42MkZaWWttYU11NUFP?=
 =?utf-8?B?VmJKaFk4VXlOZDlWbzFqN20yZWVYNEV4TDUvY1FRWkZpeUNDY3dFWVpGNW1M?=
 =?utf-8?B?UUtLYXI5T0RCRnZoSlMrWmN2RTJYUWdVQzZuVmtDY3BJREl4dVJyTk9LNVRP?=
 =?utf-8?B?NVRaYVlBMVJyaGhlRysySHA5WlB4ZSt6ak15ZjJPdG1qckVtVFlxNHd3Zjl2?=
 =?utf-8?B?eU9xTE1kTnEvRXpZZ3phc1Q0anZyaEkrSnFTbktZVzVSN2JvTXVKcnlLcU1S?=
 =?utf-8?B?RUE3ZTNSdTNCMXYxVUoxZUgyaDlzQVFpRDNtK0dJb1F0bm80NWNHaTNSSFlO?=
 =?utf-8?B?ZkRzeHR4aE5PelA4RkF5bElRQzBlc2lkakVYQ2wrZVk2eVJLMjl3OEd1eVhx?=
 =?utf-8?B?bW1JaDdCS3Q3dE43cUFBWC94b3lUbjFEMmJIT05HRDkyNTJZWGZGWVlJS1Bk?=
 =?utf-8?B?YkRCdjVjV0I0M2xId0N1SXFjY1hLa3ZsUlVwWTZFbWtKZ1NuU2RzenVZdndP?=
 =?utf-8?B?WGEya29CcE10N0lzbnhsN3lpTzlROUxyTWRXRXpwRUYzZDlzSWtJK1Z2c0tZ?=
 =?utf-8?B?cXEzbStsTy9jVlhmeHk1UlQyL25MME9EbFcrZ3d4MVU3VEdvOTJUYmhUZXQ4?=
 =?utf-8?B?dGwzaWtGZ2N4bWR6UzZ3ZzhiM1o4bUtYTm1WcU45VGpsL2F5RUYxSnpUKzBp?=
 =?utf-8?B?MFdjTTNGT2lXaGNvT21MTXJJeThjdWt1c1BtN0hBU1NLRktMclg3YjVUU2VH?=
 =?utf-8?B?KzFWM09wazVRRVplT0YvMEdpNXhpNzJNc0dILzlLOVZCMlVjMHZBS3g2cWFX?=
 =?utf-8?B?Z3hmb3puUlo3RG1PRnZNUTYyQjBvR2wyNzg4dTgyOVhKTzlzYWpYZzZ2dEtu?=
 =?utf-8?B?MFo1NXd6YnA3Q2NyQzdoR3orVUlIVDVtYjhQajhzbjJaclhWMnlsdVR2a3gv?=
 =?utf-8?B?dDdZM21RZ09RRld3TGljaDM5d05JdkRyRklEcnhCZERRSkNMRlowOUZNTGR0?=
 =?utf-8?B?TU1aeEh3RkoveTdIUWMyQkd6OHk4TTB4cmp6MFpjK28rZ3BqOXRHbXE5Nzla?=
 =?utf-8?B?NEUrYUVQcVkvRmNBRkhIUnBXbkt0Tm1nYU1JZ3YwMjJKSmVJNm8rZ2lxckd1?=
 =?utf-8?B?Y2tZZTZtUHdLWTZhalpvNG8rWWNHemowVmYyL3RyM3dtWWhpbjNlTE1pVDVU?=
 =?utf-8?Q?yz378ApiX284Xxq264pDL3qGg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AE70D71CFA62D4DA02635049A1E3B61@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea79ce87-f753-407f-d8b3-08da6fbd3427
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 10:46:04.0406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwC8GB8wawvIAsMbzJ/0ss8fBEcNF36XQ1hrs0zQzfx9R1n5/4UT9PMiZwb9lFIE22/v/i06uF+/DZkX7894oeuTVHUWNckIvFnFs6bWSqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5129

T24gMjcvMDcvMjAyMiAxMTo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDcvMjAy
MiAxMTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBDb3Zlcml0eSB2YWxpZGx5IHBvaW50cyBv
dXQgdGhhdCB0aGUgbWZuX2FkZCgpIGFzIHVzZWQgd2FzIGRlYWQgY29kZS4NCj4+DQo+PiBDb3Zl
cml0eSBJRDogMTUwNzQ3NQ0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCg0KQWx0aG91Z2ggb24gc2Vjb25kIHRob3VnaHRzLCB0aGlzIG5lZWRzIGEgZml4
ZXMgYzFlMTU2NGM4OTk1ZCB0YWcgdG9vLg0KDQp+QW5kcmV3DQo=

