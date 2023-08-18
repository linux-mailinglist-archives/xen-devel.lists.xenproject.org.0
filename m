Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2C780C3C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 15:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586227.917455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzAK-000288-6y; Fri, 18 Aug 2023 13:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586227.917455; Fri, 18 Aug 2023 13:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWzAK-00026T-3t; Fri, 18 Aug 2023 13:05:24 +0000
Received: by outflank-mailman (input) for mailman id 586227;
 Fri, 18 Aug 2023 13:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWzAH-00026N-Vh
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 13:05:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1691a73-3dc7-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 15:05:19 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 09:05:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6046.namprd03.prod.outlook.com (2603:10b6:5:391::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 13:05:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 13:05:11 +0000
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
X-Inumbo-ID: e1691a73-3dc7-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692363919;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Io72RflFEs811+hdgO/38erN7cyQ/uKxhbX4yEzEtIw=;
  b=Vr4hWNT0oWpxTlOLG3BTCyfK0ZORAJySt+DgjUCDZ6VfpwrT+M4j3aOl
   CRQTvHzQybBHgG463bt0mRDQajm2+yGct9tqaNns6mPo2V01PgS/7vMXY
   tWNFPiC/xKlxYeKJ79wM7K7Mr9PM9t62Ip361cm2GvDdwaZ156MGYHNfQ
   4=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 122574622
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TuV40qvW+bycZr73sD+oFWi5kufnVHtfMUV32f8akzHdYApBsoF/q
 tZmKWmOM62NZ2b9f9h0b4vk8k9UupWBmIBgT1Blqnw1FnkV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+HxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDGwCaC+gvfmK/5mide1Hip8KHMXBM9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIa9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTirKM13APJnAT/DjULa2Onism7tHW1RvNeE
 Gc1q3ByrfELoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC9
 HWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBscOcey9zqoYV2hBSQSN9mSfaxloesQW22x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:fANjwKot9R3JrIPKHDsqezAaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3AatcN1WhUp22F7RxnFZadTzcyaTJuViHSykjzGVS?=
 =?us-ascii?q?ENk1wd7m+RQS5yK9OnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AHdWAvQ/QoeNCbWZsX/wUta2Qf9pW27iFOEIzqp4?=
 =?us-ascii?q?bmsi/Hg0hYWud1Q3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="122574622"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjV92D3kfNdAnYrGkFDe4hJOjMj65OthUT/Xb5i1HleOZAxh0k0JpxRGxbi3HnS84vyKhAp7NXAiEWenH5hvDMUq4u0d0s8U1NS3z2m45ZGRU5RSnE+7xQoQ3G5r4pD0VjlwG4sZPSJ1E8SWC/tjlKQNIVvQL86dcPH2u38jImsjSCl6UzXSd0qQroOGYWAZJUf97gvXfUp0f6jrnfUPtkAxYZZe966SlcAb72pkGqjY8ioP+3mvU45DQ99rm6ptaNYeYVygecRaeFaL8ir2te4GQaPGP+Dk/ww4gfmAQ2COL9BVHduSc0YS1cFnp4clUgH/7+cTh72N8f/n3jQ8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUivElGh2I3v9AsOPpxh3jFx3T5Epuq7Gi8aBNbOCHM=;
 b=D2Su1qJ6vlAq+o142fb5dq1t0ewuyrojKPFiSQWB6VcmHuGTM1O/MqDPNOoqvlJsmrDFpF4ZDTGm79f7pbbI2jAO2rxXVaRJyENx3SWpiQtbQIfb4sITtrbARmFZGj6VdBKaDvShbTmyosxJTcGHYX5PMDoSPbf6rlymEGhmDC764F0vsWFEp58WFuatSBtCWAY9Emel9V1jOSfilobstVhBnaW/CJlWkEP8ImQi5L1UfwhFF57+Z9RVx44jvIrAOdfLBchWY4idQqUSyPLsi0rQudAq8WOmS0CK2aDieCfe42DOxBHkzNx/8pkWX60ZfSf71vRXNSmIagAPCzr7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUivElGh2I3v9AsOPpxh3jFx3T5Epuq7Gi8aBNbOCHM=;
 b=IjG36W4HUJoOgQ7YAbPadEMhCmCQkq/FseP0HKcZrvbga6SKrCZEhXNeRrsUGTnrRdZkuVFl5SnS3159zjwtMV7OvXHkyGj1gXm9O6b00/BQBmh7ad+JLG5FeUQZep3BLsIdKRG+AZCgBW5KMtQ6wCQ0xVLOdDLDRLowF9VRiyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9c9ac724-9f86-14bc-5a22-e6e64c64e48c@citrix.com>
Date: Fri, 18 Aug 2023 14:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] Rombios build fixes
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230818125753.876699-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230818125753.876699-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 459c1401-b7e6-40a9-3763-08db9febc133
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1zylqkPYg1jVRTUSxYaF1ChcoCA/klctF4nX3fIUYDswAk62C8YGRTbDF1peZXmc4HhQoQ2fuzi3RSNTZjldLSJog9VlHWOSwyuzbOvQxEpklLRnGiCu9gpEMj5V8YZVelpN3T/EKlgEd16SbBlkopHNtp6a2X2VRCvwPmSVL856Uw1MZvYn/KhIzH4YMwNRevgUQmvxcdI6cpv8MYTSVCpDvq2lH7Mr0N+bdaXATz3YVeeUfpIljStTs8y51XoA7tEtEDFCoI4+QOpa4Y6Bstuq7HtyQxTxOHL87DUqDGy3e5dNA4vO/G3FG6abO/zyzdlrm/4DR44NLF2A6N0UDmqpJelMm8FtkBYxpENTbYE6Ds/5C0fNZbtQeqRx8S9l/uJVRl67XzjttKQ+2OzK2/oiBExzgi6aW78pIUSmKutNM41WZHoGIIQRSBp4NzWSBTjIEV5EUQDgu8LbYl6joDexHMM4Zcj/zhR8pSAxQNeXfEhN5pXF5O2hF3yQYLFxd4zrAWnKii1ZVaTCBBnuF7l1cZJn4jsXNvCfr3pg3VImyD43W2zrP8oqyHp7tiuII53fG/J0ckhcUz27pcA+6YsyBA7Vj0JqvNfe9CCHjTWIfl0BqIKWHnTRKwnBQfGC6uctOiLrwCs+HaMU0HdbQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(186009)(1800799009)(451199024)(82960400001)(36756003)(86362001)(31696002)(31686004)(6916009)(54906003)(316002)(66476007)(66556008)(66946007)(478600001)(966005)(41300700001)(38100700002)(6486002)(6666004)(6512007)(6506007)(53546011)(26005)(2616005)(8676002)(4326008)(8936002)(5660300002)(4744005)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFGbHo2MllTVURDN2ZONFhrS1ZnYlg4TW9UaDhCSkoxODhIOVNUTGpnWWlv?=
 =?utf-8?B?ZVRySDEvNnFZcE4yc2daSjI2a2dmT3c2WVM1aElwTXhROXFQbEk5TFlSNkVq?=
 =?utf-8?B?OVMwQVhVTmpGd1dmWnpvbE5ucW91b2xzVlcrZ0I5TXdNYnF5amR6aDdkUmcw?=
 =?utf-8?B?QzZYZ3lJQlJBODk1ZzA0WXpldXVVaXo2Y3lNSFFwS3NvcE1vRE1kOGxMQzZ4?=
 =?utf-8?B?NndHU1FhS2kwYUhEOGlsTGJyclVQUmFMdnNZU3lVcUxKUlBFTUdKenhBSTlw?=
 =?utf-8?B?c1BTMWFOL25rYzZvZHJvUWx1WUdaVHMyOGgwL0Z5amhjUE9Qb1ZJNzZCT1Av?=
 =?utf-8?B?YkxaZHlvdklHYWs1bGhheGI5MmtoYWtFaFY5WjdkZ09vOC9mVEJZQU1lVm1N?=
 =?utf-8?B?YWJhRDhPVklNb241aEd0K2plMkNSeFZ5MUVjZzkrbkxGTmJ3VHg5SEpoelAr?=
 =?utf-8?B?cS9NdTVJWmRNL1FHdkR2dGZEOTYrRVR0eXlZbnh4NXpQcVpDb1hJRmNadFc5?=
 =?utf-8?B?YmpEOERPR1RUQnM0ZGZWSWJEL3ZEcDZBRmt6cUNKQ3AvbWhwanNzcnZTWVNz?=
 =?utf-8?B?RU9ML1pqTGxseHdhM1JuU29JZUNPZTJmN3h4Y3J6aEdyYkpoL1lwTlQwQm4y?=
 =?utf-8?B?cWlDSHJQZU9WT1JJZFh4VVdFNkUrZmxZRTNJVjJqTzhhdWRROU9ON1RGVHFF?=
 =?utf-8?B?TmY4VXdVUnhDSDJoQ2JMS1QyWE9vNGNLK0NwcGZPT0lGODZuMFUxakducnUz?=
 =?utf-8?B?TjdxRWtMVFZnNlFxVG0rQWRyOFE3dEpBQzJJUVBpRGpocnhDR0dwUEQwTlJ0?=
 =?utf-8?B?U3BDQXovVlYrRExUSFZTeHZFaEFlazBVWVcrUkhWSXd2MFhHTEhaUnphTkd1?=
 =?utf-8?B?elp0TXpWVy9peW9NZ2NNVVBrN29tclN5VHk1cGpkaEVhL2F2OWszRHQ1eVJw?=
 =?utf-8?B?Q1pXNS9nZkY1WkFSNkxlZm5zTGRnMk9wUzVIWTdEMzlvK1R0Y2x3UEdZS0lV?=
 =?utf-8?B?VEUxYW1EYk1tWWs5dHJHMW02WkJFTkNYcUdWZjhHMlcxUGJSWW1JWHZ5Zm00?=
 =?utf-8?B?NVFxUjJOT1VWbnhaZHhUOUY4VUQyV0pVSWRISFBObXRHb1IySzdOeTdOQkZ2?=
 =?utf-8?B?YnU4MjduOCtObnJXZyt3VEt1UGNKNXpqdW9JQ094M0dGa3RFaFBtUGNIYk4y?=
 =?utf-8?B?NWlOVko5QmtiUUM5U1piZThZeWd5dmpTV2ZNSjJoZDRYbkkvN1J2L0JYakll?=
 =?utf-8?B?aHVKNVc4L0UrK2JTdTQyQWFBTmxsVm41eTYvdncybVJhS012UEIxRWs5WGZH?=
 =?utf-8?B?VGJDNCtZTER0OTM2d0JuV3V1NmxPQTBPblg5ZUNlL2pZLzc3S3ViRVl4WEln?=
 =?utf-8?B?L1BZZzJqZzhKU3UzZ25SL2dHSWQrbmRLczlLc1YzTDFmQmo5VzVWa3pTdXJj?=
 =?utf-8?B?dGRZU1RDcEVkdmg4MzFzTG0xdDNmaFoyY0FPdTIyQm5GUGgrZ0V5T3phQnBi?=
 =?utf-8?B?dzFKaG5LM1dTZ1F0aUZGS2IwdXIzSEprc1BBcWFzMFlOWVBKRTlFekNEbTNG?=
 =?utf-8?B?elNucjVFOThwTVIzaFI1dllhSFJ0dTNKNVovNzk2c3FHU09EUnc4UTVFZ1dF?=
 =?utf-8?B?VWpmUnZjLzIyRENpNGpGR2N2VGxsV2RCNE1ZeFBYTkdqa21TNTZZb2JRWjBw?=
 =?utf-8?B?amx4bEFCSXVRbGJQdE1BNkMydGN0Um1MRitrVWtLMXZFQURHSXR0Zk0zMUdr?=
 =?utf-8?B?dTVYRS9JTGdqWGpHWHJYTUw4YkVYbGFDbmwwZlJmQitFQVh4em9ydXZGZEs2?=
 =?utf-8?B?dnpNNVQyNGJLWEdKbW5hMnZPVTk2bkgvblhCejlIQ3NjR3I5bHk0SExRd0hL?=
 =?utf-8?B?VHViRG55N3VQUjNtL3dwcTl2WHllajJNVC9jT3RqUVBVcmVyVXNudTN3bTdW?=
 =?utf-8?B?Z1dvN0hUYU9Iemh1MXlIanFBc0VqQzNNc2tORXBkVXNIendodldaajZKbW5Z?=
 =?utf-8?B?WjUvTnA1Z0owN2txNmxSUS9mQmJnOS9YZkpWaGpGUndyUnJYUnlLendJclQx?=
 =?utf-8?B?eHBSa09JNXRlNEJrN3RNOTlFSzNSZk9BWDV6NUdCV0tqK0tDWjlNRTNHcWg4?=
 =?utf-8?B?VGVLeFJOV0FmYk9TV052REtDR1ovV1J4YzhhSW84QS95RllTMzJmL0FaT0Zx?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hpWsVhhMpdGXmvl2RLTle1anblWLhFbUHAPvsWavhYgaTBkuk06GmxdZ5f962S1ldfXa6dbTwW3JBpSsLyWvtwXvPHM0v0EfHSeRoWqECXQv3yrqZ/qy3VEPk5Cvz11WoipRMusStP0xlzRd7pgZvxes1F/++dC1vsVCeIRapNprLKAjzh4VoGlkZhRl3nZwPwodC0YX2k9g4V9uy7jOqgn8NmY13ndtOxOU6pJQL9F6cTqvYdjhcandpYw1VVunxSJOakhmXQ6xhNa/hBlDv0MwmPyDLK1873dVmv8n8p1UsUTuvcjE4eIWuwjIsRYPeX3lA94dGWJGToGcpoOrcRSEqoTeLW7MgojFv+hUq44NX3phEbhAkFhIp2LkQpz2AWODEDpJgLSVX14lpZqJm1a9XoJwV42JncR5t5AyvFmLBBaUpF9Uc1rpUnWgTCf0NCOkIf55M+7P1o5S30pL5Z58dKHPstn7UG2eTQozkfp0fVlcrbGYC+ty5E5J6g9EV2g3lCPtSAky5gRBJGQj5Ng901KMw7525os2Ovl555wLMGaQQHvxWx6U9ymY5w61bzbDTcFZsaxkgl4kH4IdcB1rHaA5Km1NJg9pym6d5w2f99ii6cCHsVKl+rE6G1ZWnYjYwe8s3llE8SutaFBPeUWwfVzeSkGKriJTUslu/vKB54j+NRu1DH+bNaz6Xa/Fluts65sv97oqykZe4YlqVXinifc7qDu8G7q3WAhyhMh0jqGU97PmZT5xzYbXZBbtOP2ch0aoaq19oNsKaSBgOAtB2LcnuD229dPBjBBS86BhzmlmhurDbWdBdguFysxR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459c1401-b7e6-40a9-3763-08db9febc133
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 13:05:11.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjtxneAG6iXA4yVV77lQa0OTy4VeBaMN8lOZpxtBwYqlV2ooY9aZmBGr+g0EXgP47367ZMy9F1nWZh5bjaUCzH/CPuUUfCGFeW/ReCoUA+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6046

On 18/08/2023 1:57 pm, Andrew Cooper wrote:
> Andrew Cooper (2):
>   rombios: Avoid using K&R function syntax
>   rombiosn: Remove the use of egrep
>
>  tools/firmware/rombios/32bit/Makefile          |  2 +-
>  tools/firmware/rombios/32bit/tcgbios/tcgbios.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
>
> base-commit: e6cb27f2f20d09dd2ba135fbc341a4dc98656e10

Urgh, forgot to write what I meant to write.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/972116359

This gives a clean CI run when ROMBios is explicitly (re)activated.

~Andrew

