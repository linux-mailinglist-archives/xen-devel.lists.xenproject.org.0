Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F796E6455
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522821.812435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokki-0001HS-CW; Tue, 18 Apr 2023 12:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522821.812435; Tue, 18 Apr 2023 12:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokki-0001FC-9c; Tue, 18 Apr 2023 12:48:08 +0000
Received: by outflank-mailman (input) for mailman id 522821;
 Tue, 18 Apr 2023 12:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pokkg-0001ED-Fn
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:48:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 414bd391-dde7-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 14:48:03 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 08:48:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5542.namprd03.prod.outlook.com (2603:10b6:5:2c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:47:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:47:56 +0000
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
X-Inumbo-ID: 414bd391-dde7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681822083;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=DCXB6hBZuFTqo1uq2o2RbJCmxUgSEAIAU9hcDVZRye4=;
  b=MYfnyC8CWEuUlffh+X6IG3Hivm9zMRumvwIIFMZ/eCuJasuEHscrTP3l
   KwwQhcMIF9AG1fS7lo/D21XU8NJo2GEAIAtLLzCY6xsIs+5i5wg6DpS9Z
   3vAaI2x/NKbYREalooZZu8MYozjDBCuEepyErX5XTmeHJYWOqYjj7opNG
   M=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 105850316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Fec+taAlXIFNJBVW/xbiw5YqxClBgxIJ4kV8jS/XYbTApDkq0zcOm
 mAfUWGCPayKYWOjetgia9u38UIBsMfRydVjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+bd3M0Vu+
 7shMg8/azqI39q/7rjqVbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi/827eUxH2TtIQ6H6Hl8/1wr3SqxlcuIhkIFkubpsOpoxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkgJSCRQLuMvssAeTCYvk
 FSOmrvBDjtqtaCTSG6MsLKdqzq9NDI9PWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwgtirHzj1m
 mmOtHJn2OhVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5P2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:h0lRnqmc9c9jwOXQo9839tceAsbpDfPLimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qADnhOdICOgqTMCftWzd1FdAQ7sSibcKrweAJ8SczJ8q6U
 4DSdkYNDSYNzET4qjHCWKDYrUdKay8gcWVbJDlvhVQpG9RC51I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmKm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTpjxj78G6X64bg1eUbpDLT8KoNOCVKsLlaFtzYsHfkWG2mYczCgNl6mpDu1L9gqq
 i1n/5pBbUJ15qWRBD9nfKl4Xib7B8+r3Dl0lOWmn3lvIjwQy87EdNIgcZDfgLe8FdIhqAP7E
 tn5RPoi3NsN2KyoA3to9zTEx16nEu9pnQv1eYVknxESIMbLLtct5YW8k9ZGIoJWHuS0vFSLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2Hp500wbzsoCmWpozuNJd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTnfARBrdWVjiUGgP1Jt3RU4lh6SHn4ndvtvaBaDg5KFC5K
 j8bA==
X-Talos-CUID: =?us-ascii?q?9a23=3A7nCpiWsIraTd+XkEkioYFs2L6IsmI33v6FfeZHa?=
 =?us-ascii?q?iNlRsYrbNcVa+8vJ7xp8=3D?=
X-Talos-MUID: 9a23:X34d1woFYQhHWkepKQcezzp+acJr+YuHMUA2rL8CpYqUFStKKx7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105850316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvwAmuvjLfoWYQjCfeBtWXW1i20NjRXvc8T7uRhZJjd76sZsybMaH+EtrfsunRKv4brDegmmD7zHFECwpPOVfEs+QtqpslDN+UGqIT5+B44WHnpwDEEAmsrtp1K5B619bSqSpLW0APGNSyfAUmZUqTe+LqzLQuNKjLgn07jJygPyVw+zDcDGjzsUGEv6V++2Wk5yRzgFNtfZX5SpTCBuQbDUZqMZEywKGpGJZdWa7EVNO98zEZDaa9kdlHgnAvTCyfSayv4m8twGzbQe6gnMZXW7vgDl3NshWuLjUso2oK7BDH4UR6rpKeC7XMMfAZeClLyzA2pip95t91eiBuxDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKXhrr93JiSWj86pBbqD3mAJGN926lIyMx7TBVE7VCU=;
 b=JGJxi/ix2jC21ZPkekPb86YS0rhFXxhSvhzaKu5W9UhNCr+mh6PtA9ZxgHOz4spMiw/L3ZeNx82twCm2cqYGp3zw0Pp6nE/Nj6Ko/uIV8xbfKuTjZ6nJaJmG0J6BKc90J6/fZ2yiKZ5fJCQvjA4wQ40pMWESciCGl20/OIvM4jxdoBqyxSWyPgvz8l/nPSbChvW0EmzzL1HCy2AOvaS4jmtZfh7zPDSttOF7v2gK5JfyNZ7frOHneu/EDmYuJ5GSEaY9aYIcOFi8m3CAtrJuMTXbDsDLp/pxPTcK3cWI2zEl83ksRiZNjZ7Kt2lR7swkubcII2ZLGrlzE4VfGOTBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKXhrr93JiSWj86pBbqD3mAJGN926lIyMx7TBVE7VCU=;
 b=JW1TIVgVJX0ChoCA+HVf61SGy7aEGR2xm9f/OSDkbKAvP0ZnAHM9J+H7zQ3WEvQeWTMGbHZxggCsHdBJTtMdr5oPBMeo+tn4xrhuzoYqL8VXyZuqm8BkNzn2c+ns9FRasTsoxdjxTYJDl15uC9uuxx37Dk9bEJKg8hXk3Em4kYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: add gnttab_max_{maptrack_,}frames option changes
Date: Tue, 18 Apr 2023 14:47:48 +0200
Message-Id: <20230418124748.17881-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5542:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ff40c0-4b06-43ba-ab21-08db400b2154
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GixKzYpxJfrSdMqGwkNJ/xl6fw0FC2BAIQb8NjtP4nT+0T8p8uowbbA39bVtmj0tRXoaS4N02lvutzIs0YgYDoESqpdSuL03iZbA6URVyturemiOg5eJwJO1IhI6ZLykqdoYuRNrcYEScUXLA0jyqisZQiLuHf7MV5AOYrQKd7dNDdSRoJDPwxZ2IY+pyXnS/RjGY9PBvhzs65VoNJW2u2bbF2RbqjwKgsZYo5WYGwaM7C8tPTmRuBk9nKaFbbQIMPbD8Gv3O4CbVc63vlw723xxy2tlPcVWhmpgyxGZExXhhDg/DUN80WwKbZfpBPZY9mhYPGmZiKHSETLi9cLl+7dx7IzpZ16bo2tnhgjWYrbCHETS2bJRv4RF0p1XZecAz5K9fgo+TWPdixi7IIzUjUX3Df9OgSvHt6igtYU1qa/ya4z/oJzrNs2ycBWjjbxWMeprXd4aIQOLKLEHRdgmpH+TP6DVf53WznnSOJsDi0S10u6B6GkkWnLjONbzyLv4rJXvjmrSQ8vXwk8dMddK2T/27h46YoFFJb2lfTXw5c23FbE74Hb7SMH+ghOhmAwNMX/ZO1nx4WcFURMN3gtuB4cTpspzLAeCPpmGFPUk8QEfH880fyYBNfCBVGze3W5D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(2616005)(54906003)(6512007)(6506007)(26005)(1076003)(478600001)(66556008)(66946007)(66476007)(83380400001)(316002)(82960400001)(6486002)(6666004)(186003)(4326008)(6916009)(8936002)(8676002)(41300700001)(5660300002)(4744005)(2906002)(36756003)(4001150100001)(38100700002)(86362001)(207903002)(219803003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bS9FMGNsNXhENklQbjd6Y2JxL1ZYSG9GZndxZEVFWTQwQWVCS2tMd1l1QXZD?=
 =?utf-8?B?RWQ0eDBZUWtubjF3S1hoV3QxeWVZQzVOT2p2NWJwcTIwdlBIVUsvd3ZCT01Q?=
 =?utf-8?B?VG92OFlnSWtyeHFlWElpR1hRcGNoS0pHeWwrRVg3VUxVclRQVkQwYWlmVi9k?=
 =?utf-8?B?REFjSHl2ZTl5enVRdnIrNWJyUVlvR1plTitHRkw0TTlobU56NVVZYkorTnFN?=
 =?utf-8?B?dkZzNE9lN0EzdEp0K1JJMjNpUkxoaTFKbzN3V0RyU1IwNXlhdWh3amVsK3Ew?=
 =?utf-8?B?WlJQR3pnMlhQMW1CTjd3Yk82YXZwdm5NMEdzUFpkV25ydUJhaDdSS0swdVgy?=
 =?utf-8?B?citTd21QMlYyeG1ISEpMVnlUUitKdU1vbGdDaklkQkpqdnhUT3FnYWt5ejAv?=
 =?utf-8?B?T3Z0OHZlZmRTWCtzYXlvcUxicXh2M29GN0Rld21uRWhXTHd3YVJrNTZqVXdL?=
 =?utf-8?B?eUVyWHRuZWhtVHdaWldST3JSTmtzY3U1a2pPMXo0d1Y0bC9ITzdpN0FGclgr?=
 =?utf-8?B?Wk5IRFpUdloxbkg5alFQRStEYm9VOHFlSGljcjRHU1NYTGs1WVBOZUJEbFBF?=
 =?utf-8?B?d1k0QlZRYXBqSmFXalRGVkFVV1g3TEwxUmc3Wm1aMUxPS0Y4c1RMdW5aU2FW?=
 =?utf-8?B?N3Jxdnd4NTEvc2h0c0JxK0ErTGJyYWZuWUo1dkNReUJwbFNUV0ttVnRHZG5I?=
 =?utf-8?B?M1hVakR2c1MvZUZlYnljTXBZcmlpOCtUcFNXS0tYeWRFb0RHaWFha3EvbHZE?=
 =?utf-8?B?dE8zNEdYVTB4Nml4bGd1UDZlTlRyMFNXRld4eEpVUzRPdHI3OUxjOHEyYjdt?=
 =?utf-8?B?OVBaUnh0MVJtblk2bmRGM0ZSZk5TQmVMb1BVUE5heTBvdXNnczQ0OHJkWmdX?=
 =?utf-8?B?Y0gvNEV5Y083c0Jsc0FNTE1oWlZSeDFMN0ZXUkZ6QmRSSURIaXNybjA1ZXlS?=
 =?utf-8?B?c0dtS0gxS3lxV1h6ZkRLSGUreFd4Ym9xTGFCanFTazNUWGNGYnhQS3lySmoz?=
 =?utf-8?B?UzYwQS9NOVZTUEJjeVA5NStmaE1IZ0hNZWRvU2hFK3oyWUhvVldPa2tlVnJq?=
 =?utf-8?B?cE9ETDBKOUJJN3Z4bmxqWUFBYWNUOXJUYW43eEhDazkwVi9QVEo2Mms5RUxM?=
 =?utf-8?B?aTU3UEtFR2VyS0crbmJwaGtleXpXZ056ZjNJMEFKK1NPVjlzTm40WHN5eXoz?=
 =?utf-8?B?aEFuMTExWWE3alhEZHZkVkNuSzI3V3pET1lkUUF4NnN0cW43ckRtbEdmRjdD?=
 =?utf-8?B?ZnpZbGNpeFI2T3B3VStXZTJnY05nN20vZFpoT05MQVFKRXJ4VFgvVEh2NWMy?=
 =?utf-8?B?aUVNZlFTU1NwTUZjbjI5cXU1c0JLVlNudFI4NW9rUVZ0M1VJQzFHMFlyWW1N?=
 =?utf-8?B?UWNGSjJTQkR5NC9DU0FySHRPWGJZSklOcmliZVFxN1VYanhkelNzd09RUHFK?=
 =?utf-8?B?RzFNelhDdTdmSXdERXExb0lOczAyejBsQ0xleFJrV1NMTVZ4RUMrSFBaT1Ay?=
 =?utf-8?B?VE5Lc0Ywei84a2dhN080SHpCeVZLYkt3WG12V2FiVVJCQWY4UmlGa2F1S0sz?=
 =?utf-8?B?M3VsL0VyRmoveWRlRzA3c1ZLT1REaTFTdE51UTlQZGpBSW4vNjd3ZkEvY3NF?=
 =?utf-8?B?OURDTy8vWXlURE5nVzhWNENZWTd3YTdpYk8rUXFBajRvRWgza3ErNE9sTldC?=
 =?utf-8?B?K2p5OE9CMUswRGZuclZOb3ptenlXK2hWNW9jWDAySE84ZXZ0dkx3M2JtT0Z2?=
 =?utf-8?B?dk9RaFRucVlqeERlMzVaQmREbEw2SW5sZzdHM2Y1V3VoV0ZQMXpHOFp0QVBy?=
 =?utf-8?B?QnFCSmxiNFdNZ1R5UWVzVUJYNkpEM0dvUmxnNUJVajlDQUtGejJWaWd5N0kz?=
 =?utf-8?B?amcyT1NCREY3TG9LUmM2M2c2UVczRjdlSlZiZlhVQUFIQU9LZ01xd0srVkZD?=
 =?utf-8?B?ekd6djhVb245RDBoZ29XdUozQnNzcHBYN2dPSS9xTkt1c2hKTW1oZ0wyS1Vs?=
 =?utf-8?B?eUI4QWw3RjQvK2FyZnh0ZE1iUlRoTUt6ZFNWSE9rZGNCZ0lacVFzQ2lJL2I2?=
 =?utf-8?B?TlN1N2c3YWlVOUZjUlQzS3pCeVN1QW5ZUWI1bXFMSW84UHFsUTYzNmdxSVR5?=
 =?utf-8?Q?HEL+1qtaMRd7zN/UIYEvU+rGp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BC9LNps29cDdCumf6tkgDL3/RthXppPJDnN2Whr4rMLgJNtrtTWROBlX0NyTdGoPNcjm0wVmhltGDWmtrfxhunZs4//xIhuCDXXzJxnG03Hmh1tis3DFQ88XcjtAUGJr0kuMRqTYEguUHpw1dn8Z+SGD2nEPBHKYfu0kvZTEA2AqBo4hg52W4brX/95OoDP6dDbKXb+GIBETAYgJwaX5wVVCetJfxv1xX7vjsF1ch64vRkeIAut0EWpI9ZWxbaM8wy2KfW/JwCEP6pPdrLanXb/I2FC5+s6BbojtAPgHH5E379BI0CYlGyr8qVHFm3EDurm7rhdfW1+YYIL6sFDEY90ecj/U4n1Uk6sbJq874cUGjNCgs9m4lv25UG3xB9oFjeQxQdlNzLdWl+geMfc5Xt+wjYn+cU/Y5v56UgvJe9YPiZXfGf1BBnIV0vHiXEaEVJdH0RRhL1oG0NbHmLbEJsbLdd6Q2uAA4xp9cupQ/l2cahqI5W/6WosXCoZhpPAgh/fXagWEfZJy6DsagtmzoWqyOYlD02rZZ6CjIPPhwVc5X4pSd0zqTmHF5aCwA3YdFk8qwWw9z9QXGqav4v0VFkAE3QU+v7OjIq3622J00BRYVP6apws3dtD4eqswq+HB4NKCvlyuaOPU8HC2Hjiv8OZoqFWzTqs7WkA162F6wpRQ3EDA7mUPyWWaQv9PECd7KL8reCpx8U4WZ+dwdc8Ax4vWFwidO14izKf3BKDD7r6ftLjtDkEuhTuKzjU1v6V9RpV3gcTVM4jZUJg+jOxajF33GJJfh3r7m9uBMY+QFGC/XeGFg8/LEHVX8gwEnKoI9508J5/E2oEVTBo3x1PQPQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ff40c0-4b06-43ba-ab21-08db400b2154
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:47:56.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YvUENpDjpa88f6oXykQDE/ag09lVVnSKV/PXD2cILXenUCVNOysu8wVj+g4v/E8x14faSPAxCyU9lmtnEBSLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542

Note in the changelog that the purpose of
gnttab_max_{maptrack_,}frames command line options has been changed.

Fixes: b2ea81d2b935 ('xen/grants: repurpose command line max options')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c978cfd9b68f..2a7e62495104 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
      wide impact of a guest misusing atomic instructions.
  - xl/libxl can customize SMBIOS strings for HVM guests.
+ - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
+   cap toolstack provided values.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.40.0


