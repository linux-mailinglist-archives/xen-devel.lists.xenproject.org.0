Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A976D6200
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517847.803743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgPB-0006Io-5V; Tue, 04 Apr 2023 13:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517847.803743; Tue, 04 Apr 2023 13:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgPB-0006FZ-2H; Tue, 04 Apr 2023 13:08:57 +0000
Received: by outflank-mailman (input) for mailman id 517847;
 Tue, 04 Apr 2023 13:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjgP9-0006Ey-9u
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:08:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7513fd9-d2e9-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:08:51 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 09:08:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5697.namprd03.prod.outlook.com (2603:10b6:303:94::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Tue, 4 Apr
 2023 13:08:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 13:08:45 +0000
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
X-Inumbo-ID: d7513fd9-d2e9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680613731;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u/A/J0571XYKFGpeBNTr7AZ4HdpqCckhPqJWR+JnJrE=;
  b=Cn4lpczMcXVKzxVvcqyIQMMd31cGrnHpg+weUuaCf2fD2ZCkIx1vDpkI
   xpc1TZF9s/BXZtyu4DD69cUeuaeNs1ErjKMvaqITchYRRjqBGvCyoqtzQ
   6LU2zZq2+Ueeq+VeF4lx7Ol66h2PupqkTVKqtRSL9xKevhrpxPCe6EkHg
   o=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 104184127
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZwLyJasDrrBr06p4mPij/K9smOfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKWmDOK6NMTPxfosib9izoEpS6MWHn4NnHgdr/ixjQygV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAg4mYTmku7qMmpmld7I2hZ0DD+y1M9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqc63ATJmQT/DjUdBFv8nfW4jXSlXuxGL
 0BPynow95MboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2hBSfSN9mSfexloesR2C2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:WhdKqqM6ZHK6M8BcTsWjsMiBIKoaSvp037BN7SxMoH1uHfBw8v
 rEoB1173HJYVoqOU3I++rwW5VoMEm9yXcd2+B4V9qftWLdyQmVxe9ZnO/f6gylNyri9vNMkY
 dMGpIOb+EY1GIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104184127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKVqkx0Baz9qaPqvPEZWjAy/JF4w4Qh/1Y/mzk7WParBecgAD8AVorJTCGQ9LSOlwvbH04ABdSCq2Z2Uyce2gv8NsdJUlYEBis1lnYD5psmaHVQMBWcXFcNCh5QJa5OLu6E9jLyBu1XbXlscoudF4WltyEnmlAioQD4P9PZMmvOpVCcBPeKCoaDWNowGnBH/d4PFmAN6nUVTR/SCAbOWWNjVmomyArJ9IR1hDt5YQn5RhZyX3CB/n1pWhU0lHrBLJVlUy6Om6XTHBTZJVXk76awSM8KQ8TBwClwXE9B6DgKFc3PFDhOBkf43ZnvLKfWFPOEKFZYrzUstevmo+4pYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlemeQ7aWqQk8Ow5+xbGNCu6nFUcKoMWH3TsirNkFks=;
 b=dpyCRInhvZO+CBErJZN6GMaiDlpXgiT8qki7n85VCz7I6d6V9wREhAoHqtSQxuV+nVrUZZvfZcgcOQp3qls6tj84v84DmHMNmuoOlll7RFCjsiBqLunAz5EAT1yMgZmT31pWoz0Wxyfhe65LHymW+xrRE3AS9zQ+q7LxfSHIzMhJVN6fv9tFXlkX7gc8mgzC9UnQH61dymiiRUkUNE1qMN24fbNOcjxIZwqllAfTnBaJvL8mo53dz/riZ9GeVvCppLW5nnbLS0nCkQce1gJQHJZSswvffNppAyucBG/0hscQbi8W2Yu9pt3TrDMjFZoDZNRooRMiUBAu6/4/b0aSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlemeQ7aWqQk8Ow5+xbGNCu6nFUcKoMWH3TsirNkFks=;
 b=M5aIjkNNE5aZCKHE6i+oahL3k53cU94WRM/AabclROSXeGFvAF0pTnKG+r53p/0ic+o2+FpRFqKS9VS+hgyOKd5JG9ywEnKVCD7U9aCfS4v2ZpmHc3h9vxWEcVOZ3LLSVUquI1yI1T9gfgNYPVBhbhdWxGNEVnSlwmtQCKkZUD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6d64dd4a-5b25-ddca-5c07-7b4c0fc48c0c@citrix.com>
Date: Tue, 4 Apr 2023 14:08:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
In-Reply-To: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: 0111f8ac-691d-45b4-cd79-08db350db893
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	70i2Ln9FsZTQYRJ8YjgEoSNjt8KMb/4qUbZN67FyqyWKCyWi/wz3xeuoU9DM4+4USnYtXAdE3AeLQD64P5eC/tYQElkaBHCFJSvRJ8ZL6NGCeRjwCSVtHIiPthwQHK8xWH5F8TP3MkQxBOUkd7WkRWVxzbTsZWYKHprh5MUSw/yY85fBe0pwO21m8Y3nX9cKlFKFPb1AexGXb+Jct+eyCcs5e6iPzKi2NxeAS5Wkb02O+pT5baBD3Rb+7WFLVQZdKm7uDIbzLiuVIr/gmv+C4K6hUIiHn3lUTEZFQEvB9LNDYiz6etDdMecqVVpDqefmvRT6tCuxXdglc6l5SageKeXOJqW2oymSeI/gKyxFAZxJkRB4U1v3AZqAjcORPXerPn0voJvxlY6pGLrBe1Te39A906IgtNJxwPDFYlFsJ1mZT72qGOWDXuc+NjIhQijhDBkc1bq31RZvHS6LhJ/Up0TiYDAlGbEn8Mv4mtc2Hdo8BGJWuW/OulPXDZO0EBjyYplhs24UCjAz9PcWkCqftB20vMEsGRJZQBPCzNitE3VlJjfttXvfohEcjBrf3mciHJngWOmOHql0IBq+RGQA+ipmBVrbjdgUu2OKDNR3TNlwo3tuixLRkdM4hdjSdAQ4R9DFe88IxZ2OW8o88+EW2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(4326008)(5660300002)(8676002)(41300700001)(8936002)(38100700002)(82960400001)(66899021)(86362001)(2906002)(31696002)(26005)(6666004)(6506007)(107886003)(53546011)(6512007)(36756003)(6486002)(2616005)(83380400001)(186003)(31686004)(66476007)(316002)(110136005)(66556008)(66946007)(478600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFVHZjZ1OWxSdEJxemdNc2ZYais4RXB3TVJoVVFWTEcrTUxQWkEyME1jN1oy?=
 =?utf-8?B?QXlQSlk4VWlIZloyQkdTZDhGTzE0OFhzMFBNUTdIMzEyWGppaW9tUjFGK3N6?=
 =?utf-8?B?RSt1VGJNZWpjemVNMDJLZmVPS2J1M3duVlY1akdvZnJIaXhXMmYwM2hUSnJR?=
 =?utf-8?B?dEVySE96b1hKeDRFK0h1dytOeVdFVkdLYVp0Nkowa24vazVOWGhySkdQVytM?=
 =?utf-8?B?NlBVYXpWL3ptS3RZMFN3azNSR05ZMlI1TTBkbUUrYnNtSGhXb3ROL2xUaFhS?=
 =?utf-8?B?N2tuenpmVE1UajViZWVjcFVHcWwxSm9YeGFBT2hhaUJWZHE1NFhtTGYvbG1O?=
 =?utf-8?B?U0U4WFJwbkhHVTFoSlV3L3ZJVis1SDRwcmhRdmJHdHdjK0Zib0R1OFRaTzJq?=
 =?utf-8?B?elFTQmh2TUdaSUQzelorUGZUSHhrMFUvajNJN3k1V3UreHBmVVk1eEFMTlFp?=
 =?utf-8?B?K3pNNkptcXdMK0t0WU1ENUFvN0hYenlkM1V0RE43M2hnZ1ZyWE00UzVWNnBN?=
 =?utf-8?B?V29LZks1NjBib2trazlicW5NbEh1S3E1OTNVM21tQWhQalk3RGptRnJCVENm?=
 =?utf-8?B?RzZEV2FEREVXSHcrcU5BRUZUTWNpYU1GV05uK01IRndSQjUwbklOQlZodG5P?=
 =?utf-8?B?SnJRM2R1aVB2Q0MyNlNiVy8wMUMrc2xLL0JSTERoZnEyRWd2dFJ1VStDSTdl?=
 =?utf-8?B?ZDBKaUF2YUZGYUphWWhLQ2ZPUEhBMFRuTG1EMlprb3dPR1o3NjZWc1YwQ0FM?=
 =?utf-8?B?K2VhSExUZjlUeDNIVFZWSmZMMkJqYVJXRSs5cXNXOHRCZWxnKzU4dUFHeDBy?=
 =?utf-8?B?dmMrMDArVmhuakJFSlNUVnk3U1BuNjF3ZzdRTjNrTVc2L0hXcUR1aWswckNO?=
 =?utf-8?B?d1RRTnBJRDhCaFVqRUdXc1hTMlJiTHBYVTZDdE4rUUtmbXY1eVl5V1Y5M1Zv?=
 =?utf-8?B?aENvRjRMTTZFVllaSmVsRHFNLy9MamxwSG5KY3l2Zk9aRjRKZlRDS1ByNy85?=
 =?utf-8?B?ODBVK1dLV3RiNFRTVVg5V2JXVS9leFpDUUxLbGhYeDhMZ1dySlVibFRuQlpu?=
 =?utf-8?B?SDN6bk9ZMnBPSGpzUjAyNzdYQVlleEk3bHBZZEhRSkM1NDhUYldkRTBZVVdR?=
 =?utf-8?B?LzJoUjJXS0ZqOUhBdzhKWUlkODRMbEtuQ1ZGbGtyYzBTY3BnU0V4dXRhWGI3?=
 =?utf-8?B?TlAwVzRQaFltZTY1M1VSTnBaTFdrRk5aeGpPWE00aW9ET0tHcUZWa2kraVRt?=
 =?utf-8?B?MDM1N3BjRXhWSndtZ3FTVGtqZisya1FjMWhIeGE2LzllR0FaZmhmeG1BVklt?=
 =?utf-8?B?VHdYcHVxeVdPQWlPTHFlVGhnTjIrWWRwamVVWWlyTkhJd1I5ZjNGNkxQcTd3?=
 =?utf-8?B?YXI0MkhqWm5QK3dJNGdqRkk2bkdWbnRXVEZRSVlWdVJ2VnhxenRtTkRQL083?=
 =?utf-8?B?MVpYNlBIaThjZmZDUXpBYzV5dXJPay9xM0NDRDFyalJFYTZZek4zdW16MTZH?=
 =?utf-8?B?N2UxYWVhOUxlUkphN3l5c2tnQkhCU0IxSW8weWpJd2hNVkVwNkRweGFDZFNj?=
 =?utf-8?B?dUpCcjkwWm5mSDRhT3JWemJPdXhVVFJPYmZFbDZVQWR4YWJQcHhCcEFieUE3?=
 =?utf-8?B?VVFwRy9EWnlXTUtaMU10enVaa3ZreElTMzVOU1c5NGNrVi9jUDNaRUFOMVlQ?=
 =?utf-8?B?eHYzcUVaV3BGSno1RWZoK2pBM243dUxDM240SWFSbHllR1BDYjIwdGZWVUkz?=
 =?utf-8?B?QWRISjM5N3lDb3pUQnluUDBnWldrQStjU3lPSkxwL2FDY0lPbkVQeFB0N2s2?=
 =?utf-8?B?bTlScHlxUXVxUWFwM3hVTTB4YWFXaWFGYmFwcUpjVkFkaHRFdUg3R1FSVGlD?=
 =?utf-8?B?K0hYdThJaFhEUGtoQmtyUnh6L0gwZmR1NHJLWDZxenhUZHRNd1E3WEJaVkh5?=
 =?utf-8?B?c2l2bklVNFJSZUtaZzdLVEhQUk5BQ2F0YnB0NEFkaVFubkgrMjZxeS9mWE9i?=
 =?utf-8?B?dFlCRE1wcUE1eit5WE9lNVdzS2JvcElzSzZkb1lHYWRxem9rcEFhZE9GOGxn?=
 =?utf-8?B?NmlIdkFUM2xLRkJlR0Exa3B3N21FNFUzVDNTVGFMYUJkYXZiWVI5djZ6cXdZ?=
 =?utf-8?B?L0FIOEZRajlIbVZzd1ZDWUtvNlh0dHNXb1BYWW5FSTZ3dG5Oa3BBZ3Rrd1BO?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lrriTmojV1wymCQJ1SdzRb6nmQq18VowdfVrPM67IidYgqWZ14zcc1d0unNccaSq+92rQ4VruKgIEM5FzSeW36d/Uvnzf24OS9Voj4H86ipGOy4cGcYbPtiPi/2lpqwifp6FsXVi8aPrBmm9+c5EaB/PSjoGulkxL336WL/wrXVzeKBoC2pyZEE84c/bMQYAN5bvwUE5Ja734ktFyGC6bLtTaIIgQxKQVqrwefZ/L2VpkXcrKiLf9piKEQevu/kW9GfTQdjohSFanzMe8nFbcQMf9yf1G1srD+fe9mO2diPLH5DMbfrHgC1yE0H/aZ7jj+PduvHvyjVOTXdOZkw3N/TLJVo7YBAe4n3eTspS6/3mWwYVPOfCG8Fz9h8X9YXixoxdHKMIbPpWyhVs14gOIOh5hVDHza/jiMxdYAEUSPsmvEn3gThgXVg+vqnHtscv3J6Fxe4FtPVC5UbVDlw7JPFtDYaVR8JRR80tjLun0ppSVOm1cFOAHp0kHqWfCr7ZM/Vwvk0jU/kJkHqDY80/R8ixdK4+7bHQtoHcVHdtxchE1xvDT3KE48rIIXpggO0adzkJHosa8TSe0UkDnNR8ctSyv44uDxmyN8KK2BEw4bDsQdmrwz+OnRfDwBt7JgfJvmqtHBi91BXRlj1o7wKKEPtkOtfVSUiY9yAxKCx8ye2zHK/YoSTTu3zpMkr6T+fqy9oy4QrO05ZWOoBWcH/ZZfs5htZOGYOYGEdHzw3hjx3Ds+/LAipxgC7JENMpASiq6ZhvO6HQPYWbPKQ/i6YoFtYXUBTgc/HZFSxJiupbq5or0/k72R2IN7LiOwz0P+Ss
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0111f8ac-691d-45b4-cd79-08db350db893
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:08:45.4977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xfJFUPGmMSMP4hMUNW6XJhaPVsrRWCWxb/eeR/PNbaJIputK7OvB144d/OmGBv2HR2V49i2oKSn+tCToS0tF7S5tz/gc3VklfS7sVszoRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5697

On 15/02/2023 2:54 pm, Jan Beulich wrote:
> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
> applies to guests also when run on a 64-bit hypervisor:

Is this really true?  Even when looking at Xen 4.2, 32bit guests are
required to pass a full 4k page, not a 32b quad.

Which makes complete sense.  It was a hard requirement of 32bit non-PAE
guests, so it was a natural restriction to maintain into 32bit PAE guests.

This is *only* a 32-on-64 issue, because this is the only case a 32bit
guest could in principle use an L3 placed above the 4G boundary.

>  The "extended
> CR3" format has to be used there as well, to fit the address in the only
> 32-bit wide register there. As a result it was a mistake that the check
> was never enabled for that case, and was then mistakenly deleted in the
> course of removal of 32-bit-Xen code (218adf199e68 ["x86: We can assume
> CONFIG_PAGING_LEVELS==4"]).
>
> Similarly during Dom0 construction kernel awareness needs to be taken
> into account, and respective code was again mistakenly never enabled for
> 32-bit Dom0 when running on 64-bit Xen (and thus wrongly deleted by
> 5d1181a5ea5e ["xen: Remove x86_32 build target"]).
>
> At the same time restrict enabling of the assist for Dom0 to just the
> 32-bit case. Furthermore there's no need for an atomic update there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was uncertain whether to add a check to the CR3 guest read path,
> raising e.g. #GP(0) when the value read wouldn't fit but also may not
> be converted to "extended" format (overflow is possible there in
> principle because of the control tools "slack" in promote_l3_table()).
>
> In that context I was puzzled to find no check on the CR3 guest write
> path even in 4.2: A guest (bogusly) setting the PCD or PWT bits (or any
> of the low reserved ones) could observe anomalous behavior rather than
> plain failure.
>
> As to a Fixes: tag - it's pretty unclear which of the many original
> 32-on-64 changes to blame. I don't think the two cited commits should
> be referenced there, as they didn't break anything that wasn't already
> broken.
>
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>      unsigned int   partial_flags = page->partial_flags;
>      l3_pgentry_t   l3e = l3e_empty();
>  
> +    /*
> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
> +     * understand the weird 'extended cr3' format for dealing with high-order
> +     * address bits. We cut some slack for control tools (before vcpu0 is
> +     * initialised).
> +     */
> +    if ( is_pv_32bit_domain(d) &&
> +         unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
> +         mfn_x(l3mfn) >= 0x100000 &&
> +         d->vcpu[0] && d->vcpu[0]->is_initialised )
> +    {
> +        gdprintk(XENLOG_WARNING,
> +                 "PAE pgd must be below 4GB (%#lx >= 0x100000)",
> +                 mfn_x(l3mfn));
> +        return -ERANGE;
> +    }

Having dug through source history, I see this is largely the form that
it used to be.

But I'm unconvinced by the "cut control tools some slack".  I'm quite
tired of different bits of Xen taking on unnecessary complexity because
people are unwilling to fix the problem at the correct layer.

A toolstack which has non-pae_extended_cr3 guest on its hand will know
this before any pagetables get allocated.

That said...

I don't recall encountering this in migration v2, and looking at the
logic now, I'm pretty sure it will malfunction with a
non-pae_extended_cr3 guest.  When interpreting the guest cr3 value, we
blindly make the transform on the save and restore side, and I can't
spot anything limiting the L3 tables to below the 4G boundary.

So I'm reasonably sure I accidentally broke such guests in Xen 4.6(?)
and the absence of complaints in the intervening 8(?) years shows how
many are in use in practice.

For this check specifically, I'd suggest prohibiting non-32p guests from
setting pae_extended_cr3 in the first place (I see no limit currently),
and then simplifying the check to just

if ( unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
     mfn_x(l3mfn) >= PFN_DOWN(GB(4)) )


And I suppose I need to make a non-pae_extended_cr3 XTF test which is
migrate-capable...

~Andrew

