Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02345F556C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416217.660860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4V0-0004WY-E4; Wed, 05 Oct 2022 13:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416217.660860; Wed, 05 Oct 2022 13:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4V0-0004Tk-B8; Wed, 05 Oct 2022 13:31:46 +0000
Received: by outflank-mailman (input) for mailman id 416217;
 Wed, 05 Oct 2022 13:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iqu=2G=citrix.com=prvs=270658c04=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1og4Uy-0004Td-Kc
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:31:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc5e64a-44b2-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 15:31:42 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 09:31:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 13:31:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Wed, 5 Oct 2022
 13:31:37 +0000
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
X-Inumbo-ID: 0bc5e64a-44b2-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664976703;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=86JnqBAzAn4eW6aJyozuZfmFs4Yl2qTIJGdbe44vE9k=;
  b=gzHBNCzAWYdsCjljhf6FLrOAuDsupZT2g3HKGQnGrRPXiyl3UHhqikqE
   n70o6pz/kDcF6C0UtDAY67ALMCO1BYVSZWEJVFr5y3mS+b0rRzxr+gwQb
   0OFAxrQOtIL8bSAqM4mcGrWH0xXIQwR59UYJ9DuDkFcQCiSgR4yTImSww
   8=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 82014715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D8p1kqvwlddzdSpOJHASf630BOfnVKZfMUV32f8akzHdYApBsoF/q
 tZmKWyHOP6DZTbzKI13a4+08EpSuZXcmNNlHAdkpSBgRSpG+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPagW5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl21
 twJdj1Sciqjnt+t6piWV9lyhMk8eZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUuiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNhKTeHnr6MCbFu7ykkJWUYyBFGHu6O3kEm1f/1GL
 UE59X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUciaCkeXE066t/siIgpi1TESdMLOKu8lNj8Azzz6
 zGMsiklhr8XgNIL1qO05lTOiXSnoZ2hZgI44wT/X2S77xh4boqoe4yp71fA6f9Kao2eSzG8U
 GMsnsGf6KUCCM+LnSnUGeEVRuj2v7CCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUqzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:2nN5XK6yFVifFTtGJwPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="82014715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdkLL3eoupd+JjPUgGvBKDH9+1H5/xkfXd9Oor2NIBZZcR7SWo3JDcwyiLE0x+jDtgWsCbVHkqf3Izx/jvQSsf/o87/huQNEJEQpZt5h4XxsRawArBacYBnb8Nf/GRRZodjelANVFpIBOHfQwV8MC+v+Lvn8FvSvm3VYXEBWG+P7QcFviIbH50Azp5RIHk9ijahHr4vbHo75dZNTMTx7AjvI8Vfl2Suf75hm3p+u+/6hvwOcFe5k69Krswv9jD3v9cDIr2K/ioxS4KhzQa7lx1HvrKoOuDZVcOFe7LnuDpkWBSvkt80Qf9E9V7m4KmFr2ZhrBf0He6mBBDcuskXAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86JnqBAzAn4eW6aJyozuZfmFs4Yl2qTIJGdbe44vE9k=;
 b=n8LZytumBRhZCO9CT/z2f3bFc7bZnyCuM6KDkQIYNHzkGhAaLsuOliM+E+iLDxL80T7d0kMSGkBgYf7TvwtJ/vMls55RyPlZJv/ducwF+f/XV33h09kHMNWxXIeGASy2WTf9XiR1GdogoYblfHWbJQfgaCwiZC9lLvH5kdGaJNj7LdY9zu+y05tDuulFZKjLdUjcVtHN/7TDYOeZ7c57hzm0JTc48W2Jn3khwKM45Wf/KtyLC5AAKTNqVrVA+QOP0pIS3nqvO/e825hQY4bDZalJumyi6bqLCLcwbV6V9eeMnisUJS3s4gfTMp3ACH4Dk6X3tYiZHcfSSjukRXuSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86JnqBAzAn4eW6aJyozuZfmFs4Yl2qTIJGdbe44vE9k=;
 b=UepISAQTiH5lfgo7oYAPKpFah8AxbAha407v3kQum0ZJb6F4Uh8Zyrb+eNpWZ4XhhmdBwnvLO0hOt70IHHn7aj0rZb7MnWM62e0SLbLIv/oWC9QRtTA1lj3QaaDDU4Np98Ox3rkhfpr6vyXjtqjyxVQ+ItxnbiimWbZ3HwK2ooM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Henry
 Wang <Henry.Wang@arm.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by
 default
Thread-Topic: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by
 default
Thread-Index: AQHY2AuYv4kI/POqCU+FUM3MxB3Uxa3/mA0AgAAei4CAABbmgA==
Date: Wed, 5 Oct 2022 13:31:37 +0000
Message-ID: <d986df42-f50d-2ab6-14b7-3ab17dc6e774@citrix.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-3-andrew.cooper3@citrix.com>
 <Yz1aZJx5AZae/2U5@Air-de-Roger>
 <272c62a7-798b-1b00-0a4a-1eb18f480798@suse.com>
In-Reply-To: <272c62a7-798b-1b00-0a4a-1eb18f480798@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5312:EE_
x-ms-office365-filtering-correlation-id: 4b613e98-d941-420e-4f1b-08daa6d5edcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7KIciIkEJRogemEZDIVOvg4C1u8NX/+iGSRy/FFvf3NrXfgmM5sOD08+60mqEmIciR6XfooGPS24wnwo0+wb0JBVvee9AO+IsVmWVtKZu9O9a6I5Vel2JfONUU2B8j0Tf65Dlge+Pf8YWMIdLJp67MEB0N2s1cSUjp77s3y7uCp/itiLXlXCX81kjKfMEw5uQQ7mVbyVbuaLhL9jmIhvfTsP8BxrEInfM6SR6Bcr71fjtWj94M7n9V8+nHrOLcz80i9JN1ohw0rMfvrszHixfHw5hsCKAKgQu93i4l+A0xJtevuo57nZOnQdTfofIJLm0Yx51ugSCX3o3+2cDTKcNY1HRkN4SSm/u1zNb7VJv/Mc6ta3W4rvs5Hs5CwgPFN1NAjIJhLpKkZGnwCncLFGUK6Atm5Jg3zMVfcNr1cQSWULW7fQgsq0ZMVYmoFD9VBzMM+2aoR+RMeA6ilRHTsJtLR8VSNtrKXk7UeYr2X+tDwqm0AiPvcZvfDMFI2Hndcr04qtBMR8wHdSxVQeiQ4Aew4elBTtwbtEyfSdBJFtRfgUgRxdaZVVZfwT4J3wv0A/sRysdiTSA2YAPaCd/xjLP2bchR57e+6En3JL3es0X8izJFyW4mES4len0rskzTwPfuFHxZ5mQwr8gGUV2+YmfcM2xHxK66IViRi++EVy39eEXVorTi4bKAdd8FQMh0Udrne2Pi0B+ucFq8KIVXuw59OxXMBfNZtmxCNcL3+YL/FuL1OWT3DX9886z0ABI2vurSZkiavFWB58rtZsQXa/ehimrHlB1jef5NJYTbBkh2caHJJY8O8LJA7rb0jV0sUGlhSiugvQZs2PL6emJ2pyVQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(6486002)(478600001)(8936002)(71200400001)(38070700005)(5660300002)(186003)(86362001)(82960400001)(6506007)(53546011)(36756003)(122000001)(2906002)(2616005)(31696002)(41300700001)(38100700002)(26005)(6512007)(31686004)(4326008)(66476007)(66556008)(8676002)(64756008)(66446008)(66946007)(6636002)(76116006)(91956017)(54906003)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFFuK21GbWJ2cElyejk3bDZDc2lKYkJiRHNIZ1MwRlRKSGZHNXhMRGd3Uzda?=
 =?utf-8?B?Z0IyMEwxeDEwaWJoMHU3dnNIZUhFS0ZSMEUwNDJMVHJhVXJLZWQ2ME1nYnhS?=
 =?utf-8?B?ZUhvUGpOQWVrejFEMmt2bUpheDJCWFFDUWt1Ny9kRy9VdWlkMW9ISm1Oc3N6?=
 =?utf-8?B?dGpDT0dEMUV4OWliSm9lclNSbzdWWkFzV2xEbUZZdXB1bU5WYXliT3NsbUE0?=
 =?utf-8?B?QlNFOHBRUWZaWkRTU3NiT051ZGpSRXlKOEt4cHBEZ2tTYXFUNEtvZXdKaGwx?=
 =?utf-8?B?S1o1YURONE5VQ0gya1RhbUJ5cTRabnNKOUFad0QrRy9BaDBJVGhiQjJFNitZ?=
 =?utf-8?B?czRMUXRoZ3BkT1VpVlNmSkdGSDFueVVKbldjTVdtd2ZITGhrdWVjSyt5OGVO?=
 =?utf-8?B?VE1kcEhKUTFmRHk1WHZxWTdneGtRMFhuM2tseWdjWHhNQTZQL3BlUTN2QWlU?=
 =?utf-8?B?YTNXWWRDZlJCbDg4YlI0emdxejJrU3NKaEx4WW1VNFFOVUlML1NsUytuUVJp?=
 =?utf-8?B?cXF1and0Uy9zOXUxVSt5VGMrKzhKUUtPUGQyenhkSnlPQWxjdC9QV3BaSlR4?=
 =?utf-8?B?MDFtTndUbU9PZFNidDhSd1JyTmFTeGprZlg1YXVRY1hrOWhna2hvbGNOWXYy?=
 =?utf-8?B?QVpNdkZrWXMvd2tPOUNRZ2xWRkZ1N0VSNUV5QXRUSzR6RlFXVExLc2R4MCta?=
 =?utf-8?B?TUdSbUp5VDQ1WE9KbGtRWm4rSnY0NEpZNjFOQjRueWFjai9PWlhBQ24rVFJH?=
 =?utf-8?B?TXlvWUlkTHByamFKaU42SUFza3ZBS1FRdEFlWVpJKzJUWmpMOG5TNk5UeWll?=
 =?utf-8?B?YktNY083WDJ1RzJRVWtDa0lZR2tzZXcwVFZYaUVtMzY4WnlPaGRVcm5iS2Ro?=
 =?utf-8?B?RUZOY1d3ZnFDajRMak02QkE3RmN1R1hMMVRRMTV6bXhNYlBlNzFsL0ROb2di?=
 =?utf-8?B?VmJEVWVEd3lJVWtyTHAvamtZM0ZjZGtVa096aVRHMTZYSk5sbURZTDNwSUFs?=
 =?utf-8?B?R1lrMzlsdXhBL09ETFl0TS92S2VoVmVQWjNMKy91R3l2dk4wL0RGSUpXaUZl?=
 =?utf-8?B?UnBXbkVMWW1vaHBFNFJORmM0TmEveUFjSC9keE05OS84QzcrMkt5SGdSSXZI?=
 =?utf-8?B?YXFTenVUV0RJd2tEdGVzS1NSMWswUHBsYXZ5eFRUVy8vNlBNSHpjVGYyR0Ru?=
 =?utf-8?B?VlNCMHVPSmk3ZmxzMWFyb21IbEpUdXp5eGxlNFY5L2cvWmRGRDBnWXBNM0p4?=
 =?utf-8?B?VjdmMWFmVXpJc1VSZW12eTh1MVlSNU5zaUQwc1RtQnBXbXYzU1pJSjRwTGxt?=
 =?utf-8?B?eUsyNnlVOFlDaXAxbG1RTmFBRzg3NEVlekN6MnJhYUkzZGVQRlppMkorNENV?=
 =?utf-8?B?UTlOWHVJSndQUXo1VUQwTlZ5VjZSMnJaNkNZa1Zna0NNZGpOY0ZvdTdqUXBS?=
 =?utf-8?B?ZTlFOStWV1cxeWtmZ0dsUVJRdVRnT1J2a1o3S1l0MmpEcnhIblRBUzNlNnVu?=
 =?utf-8?B?eCs5RE1rRGNFK3luNGNndzZjR1NrWk1YNTd6Y2pjNEJoZnVyY1hGNHA4dnZN?=
 =?utf-8?B?Z1pGcUt3b3ltNHZCUmZQUU16T0s2RUxsN3VWTTJMTVZhM1hqYkVsR3BKOFRF?=
 =?utf-8?B?cTB3K04wM08yOEl4bm9QYmh2N3JUaWNIQzhuaXRSdjlhMDFwYzAwRHgvQTVm?=
 =?utf-8?B?b2RXbWlGVlFoZU15SU1hNU1vclhHSFFveURVdEx1N1RVRzJ3UFVWZEJqNXZB?=
 =?utf-8?B?QkM5MjRIOWxHdi9ha29YcTAwTm14REsvMENZT2d3UThsNmZSUTVRdFU5emZM?=
 =?utf-8?B?WmxhTEZBcXk5S05HckN3ZFh0RXV3VWN2cXgranh4S3drNEF3b2R3dDNRTUNt?=
 =?utf-8?B?N0tBT1FQMi9VNXlhUzF4Z1c4WDJrSXVpV0JnMEtKQzdBMHFUdnpwcnFMYTE1?=
 =?utf-8?B?ZG9XcXo3MVJ2TVFCRW11c3d2TVNRY0lTekF2WHZhdENBZEcvTk1WMGhPKzEz?=
 =?utf-8?B?MWluZ1lmNS9zcGlqLzM4L0g0eU5idnhzZktIalRqTFNNWnhYckVsa0M2VDd5?=
 =?utf-8?B?ajh1NkY5MzFTNHpIaU9uWFBtUkFnVU5YLzRTMCtGQ01tSVRRUE50QkFNbUdO?=
 =?utf-8?B?bHM1UTFVd0pZL25NMkI5TE51U3RISmlzbVdkNDRYaGY1K1crdEJyL2pwQmxp?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C22BA4B80373EE478235BFD10CCCA4B3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?d3Z5L3hKSzE0dy9PellWeEhMQXpISngrYnAxRUZCc2FIWFBoeVNDQzBxYmVD?=
 =?utf-8?B?OWVsVXhlQXRJVnUzVXlZLzNHRGRFbVlTT2x5WU9VdU5STFlLVlBya2w1UjNU?=
 =?utf-8?B?dEUzWTNXcHlDTE1tMVVHUW9pd1dxbFk5VnhsWUJaU1JWeEF2d3pta1FuQlZ0?=
 =?utf-8?B?Q0FpMGtocmZoaXVEcFBOQ0FDR0N0bzhRb3h3RkcyOWhiR1B6SkY3SE1xdTNY?=
 =?utf-8?B?Q1JWTmt2WS9udDFmeHlsTTkxZldwK01yb1FjT3dCbEVjUXEyMklUdmIyYTIy?=
 =?utf-8?B?UEZNR25zSnhtamRPcUNQUDFBeS9rWmU0MzNpbTRZcGpGa1g4TkJtZ3FCcmNE?=
 =?utf-8?B?c1ZHQUVncmpGb2tSQm9ROVVxcm9zRXdHU0hxUG0rODYrczl5SGtDTGZQNFY2?=
 =?utf-8?B?N0NWTmVpMnYyMm9tTUMwSWJlVkwra1Q5dU54WHowSWw2MnFka1JTTTlVQVB1?=
 =?utf-8?B?WFIycVdtZDY5RDJQeXVIT0w0aWNlR0ZWelNYUXgrMmMvU3pvaWluNktvM3ds?=
 =?utf-8?B?OVZ5RHMveHpvN1djcHJaeUFxQ0NucW94anhzdTBNN1JibVB1NGtVRWFqRFF5?=
 =?utf-8?B?d3lXMTVQSmF3Ly8wRVpZVnVhTVVKTXEyNnk2SzRDWUloVWFhWWFMeDdXYXFD?=
 =?utf-8?B?ZGRWdnZvQ1NlTXNvVU5TbDBLNWM0QzB5bmRtWWhqLzJYT2tlTmZoSU9FeDkx?=
 =?utf-8?B?RlBTOGw0UHgrYW4zazdIUUpkTXV2aDRjQ1JydFFlakVqQ2RxZDViZHAzekRm?=
 =?utf-8?B?RUFIYlBXZXl4cDBGcittNEM4V05HUDlZVzRKUHBOdzBEc2t3U05YUy9qanV2?=
 =?utf-8?B?K1lPSFptODd2aS9UQ1ZjRU0yQXJxdTNCRVdSU3N0d3JGdU5Zak4vcjRTTFpk?=
 =?utf-8?B?MWNpQXZwN0JWcXVOSVpSd0U2RkZtVjIwUTl3SnVJMTQ2MDRUQWMvRHdSMEFN?=
 =?utf-8?B?TGtLOTUvN3E0TFdzVjJhV20wd1Z3RHViQzVxbU5TZVNndlNvdEQ0UTNEbW9i?=
 =?utf-8?B?dUlqY1VoZXJUcVBhbmdiZUdVZ0xOZDdEN0IwcVdtQVl0SkdZZGg5QnpuU2M1?=
 =?utf-8?B?MGR4ZU1CUElZODFWc3ExN1RWNkEzNWd1L3c1N2U1NWRvY3o4YUpmQnNhUVdh?=
 =?utf-8?B?ekwyWmR0TFhxWGhVVWtUTmhRTGRTVjJ3bzhHWjdaWU00VklPZmo2REg5aVVR?=
 =?utf-8?B?dC93WWx2Y1BudlZwdXVaaDhvbUl3UzRKNlJvdnZGYlN6MU1WU3FqQ3M5SDhT?=
 =?utf-8?B?eFVlM1RqTEVNMFpEWU8yV0MzZUthUm9ucXhLWURLWlFwSzByZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b613e98-d941-420e-4f1b-08daa6d5edcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 13:31:37.3712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQdLldDeLjlnWWxW7l58zz7yyEBDAPxvrH691p6se8ZPwzxEgosAZm/fclRACjWhMUg9CKwQ5CnEDlQoH09MhQSQSbveoJi1HpwaXwU660I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

T24gMDUvMTAvMjAyMiAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjEwLjIwMjIg
MTI6MjAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBUdWUsIE9jdCAwNCwgMjAyMiBh
dCAwNTowODoxMFBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvY29tbW9uLmMNCj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5j
DQo+Pj4gQEAgLTIwOSw2ICsyMDksMzQgQEAgdm9pZCBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoY29u
c3Qgc3RydWN0IHZjcHUgKm5leHQpDQo+Pj4gIAkJYWx0ZXJuYXRpdmVfdmNhbGwoY3R4dF9zd2l0
Y2hfbWFza2luZywgbmV4dCk7DQo+Pj4gIH0NCj4+PiAgDQo+Pj4gK2Jvb2wgX19yb19hZnRlcl9p
bml0IG9wdF9kb2l0bSA9IHRydWU7DQo+Pj4gKw0KPj4+ICtzdGF0aWMgdm9pZCBkb2l0bV9pbml0
KHZvaWQpDQo+Pj4gK3sNCj4+PiArICAgIHVpbnQ2NF90IHZhbDsNCj4+PiArDQo+Pj4gKyAgICBp
ZiAoICFvcHRfZG9pdG0gfHwgIWNwdV9oYXNfYXJjaF9jYXBzICkNCj4+PiArICAgICAgICByZXR1
cm47DQo+Pj4gKw0KPj4+ICsgICAgcmRtc3JsKE1TUl9BUkNIX0NBUEFCSUxJVElFUywgdmFsKTsN
Cj4+PiArICAgIGlmICggISh2YWwgJiBBUkNIX0NBUFNfRE9JVE0pICkNCj4+PiArICAgICAgICBy
ZXR1cm47DQo+Pj4gKw0KPj4+ICsgICAgLyoNCj4+PiArICAgICAqIFdlIGFyZSBjdXJyZW50bHkg
dW5hYmxlIHRvIGVudW1lcmF0ZSBNU1JfQVJDSF9DQVBTIHRvIGd1ZXN0LiAgQXMgYQ0KPj4+ICsg
ICAgICogY29uc2VxdWVuY2UsIGd1ZXN0IGtlcm5lbHMgd2lsbCBiZWxpZXZlIHRoZXkncmUgc2Fm
ZSBldmVuIHdoZW4gdGhleSBhcmUNCj4+PiArICAgICAqIG5vdC4NCj4+PiArICAgICAqDQo+Pj4g
KyAgICAgKiBVbnRpbCB3ZSBjYW4gZW51bWVyYXRlIERPSVRNIHByb3Blcmx5IGZvciBndWVzdHMs
IHNldCBpdCB1bmlsYXRlcmFsbHkuDQo+Pj4gKyAgICAgKiBUaGlzIHByZXZlbnRzIG90aGVyd2lz
ZS1jb3JyZWN0IGNyeXB0byBmcm9tIGJlY29taW5nIHZ1bG5lcmFibGUgdG8NCj4+PiArICAgICAq
IHRpbWluZyBzaWRlY2hhbm5lbHMuDQo+Pj4gKyAgICAgKi8NCj4+PiArDQo+Pj4gKyAgICByZG1z
cmwoTVNSX1VBUkNIX01JU0NfQ1RSTCwgdmFsKTsNCj4+PiArICAgIHZhbCB8PSBVQVJDSF9DVFJM
X0RPSVRNOw0KPj4+ICsgICAgd3Jtc3JsKE1TUl9VQVJDSF9NSVNDX0NUUkwsIHZhbCk7DQo+PiBJ
cyBpdCBwb3NzaWJsZSBmb3IgdGhlIGZpcm13YXJlIHRvIGhhdmUgZW5hYmxlZCBET0lUTSBhbmQg
WGVuIG5lZWRpbmcgdG8NCj4+IGNsZWFyIGl0IGlmICFvcHRfZG9pdG0/DQo+IEkgdGhpbmsgYSBm
aXJtd2FyZSBzZXR1cCBvcHRpb24gaXMgcXVpdGUgcGxhdXNpYmxlIHRvIGV4cGVjdCwgc3VjaCB0
aGF0DQo+IHNhZmV0eSBjYW4gYWxzbyBiZSBhY2hpZXZlZCB1bmRlcm5lYXRoIGFuIHVuYXdhcmUg
T1MuIE5vdGUgaG93IGluIG15DQo+IGVhcmxpZXIgcGF0Y2ggSSBkaWQgc3BlY2lmaWNhbGx5IHNl
dCB0aGUgYml0IGJvdGggd2F5cywgZm9yIHRoaXMgdmVyeQ0KPiByZWFzb24uDQoNCkZpcm13YXJl
IGlzIG5vdCBsaWtlbHkgdG8gc2V0IGl0LCBidXQgd2Ugc2hvdWxkIGNvcGUgd2l0aCB0aGUgY2Fz
ZSB3aGVuDQp3ZSdyZSBzb21ld2hlcmUgYWxvbmcgYSBrZXhlYyBjaGFpbi4NCg0KSSdsbCBhZGp1
c3QuDQoNCn5BbmRyZXcNCg==

