Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31A78C779
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592313.925000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazf4-0006LK-Hm; Tue, 29 Aug 2023 14:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592313.925000; Tue, 29 Aug 2023 14:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazf4-0006JP-DZ; Tue, 29 Aug 2023 14:25:42 +0000
Received: by outflank-mailman (input) for mailman id 592313;
 Tue, 29 Aug 2023 14:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sej8=EO=citrix.com=prvs=5989d6290=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qazf3-0006JJ-16
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:25:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb5d2100-4677-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:25:37 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Aug 2023 10:25:29 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH3PR03MB7411.namprd03.prod.outlook.com (2603:10b6:610:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36; Tue, 29 Aug
 2023 14:25:27 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::7b93:d9b3:b043:8c8a%6]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 14:25:27 +0000
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
X-Inumbo-ID: eb5d2100-4677-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693319138;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vsRr326Xw2OJ8FlGon0rmZVKhGeylzTBk5V5UZz5VcU=;
  b=AIPl0AWKoX9Ye7JXut49lucpru6TOQhr+Qg+zv/UJfYrOKPbun4KOR7o
   BU1c3cg0GYT27m79ZKqEvwAzTUbrUqqJKpM4E/O5zruVjJhs4/uT+GUR2
   ldmFh3BvWsuMauMkfKdiEfUPp0OdYYYCFLmERc1zyoXqd5IWJih57MVMl
   U=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 121415123
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2FSTDqC9mhM3chVW/9viw5YqxClBgxIJ4kV8jS/XYbTApGsh1jFVz
 moXUWzSOKmCMWOje4gnO47g80tS7ZKDxoRiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GNC7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1sN4W3Fr2
 8QkDxsva0ugm7qrzLSiRbw57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCvw37KWx3iTtIQ6M5aE0/5E2W+v9n0vKDAuWFW4haeplRvrMz5YA
 wlOksY0loAu+0i7Zt38WQCkunmCvw5aV9c4O+8w5RyJy6HUyx2EHWVCRTlEAPQ9tcoxQxQr0
 EGIhNLjATFzsLyTRmmZ/73SpjS3UQAKKUcSaClCShEKi/HmqZs2hwjCTf5iFrC0ldz/HTzsw
 zGMozM6jr9VhskOv42r8FaCjz+yq5zhSg8u+h6RTm+j9hl+ZoOue8qv81ez0BpbBIOQT13Eu
 WdencGbtbgKFcvUzH3LR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCH3BUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:/IfsGKgrZf+w6bu1oFjGLCr77nBQXtoji2hC6mlwRA09TyX4rb
 HJoB1/73XJYVkqKRMdcLO7WJVoI0mskKKdiLN5VdzCYOCMghrNEGgN1/qE/9QiIUHDHyxmuJ
 uIv5IQNDQ4NzZHZWCW2njaL+od
X-Talos-CUID: 9a23:JPu4KGA7CYB/0EL6EwVC+xQEP+4dTlr27nKLAFPgFGpvUbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AgaoY7g2QytF9xFDdqe1aCEuz9DUjxI+SLUAjyKc?=
 =?us-ascii?q?6i9i4FQFINjmeqGqnXdpy?=
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="121415123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEhbit0IZLTQkmxumi8PMNU6O03Jl7i5228EyVUBRsRVUmhCIGMLERjtRcyFUebj/bq4l3yJMfp6pQoPHuilj2rcU6RdPjVyKd/iw3YJSjtzvDNfuYefg4/UKB7rZhUabTahr+Z2efExFVjpQvrrv/PpR4qBFeU2UqzkMk81EOZnFGgBE6RZs8WmjA2GZsDtwMLbMdlwA13OH4M1JHpmU1hD7E5refxDPjo8MjZSNw6rWuYAHuRVU2F/9YssZuWHg8yFR0RQ8vxSc7dXNptVurMx8D+rjailteuQzK+PeKzlJalcNxwD106ZbJ842FQba4IgYaDgUKZ9MpHlmOhzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP/LdwFiec20IrDICoiz/rBWHYj1B+a/9/5mAJAYe/w=;
 b=OrvfFcfkinpa8VgWCuctnd4cxy2dpgYq51t9/82Spn0rQfGcPuanZDErayUh6wfH3/HLB5Emy8RcrPoPY72laScJGEze7cXtBRWAbwI2VIkB8yHehMKYvkYhskfFIR/EJcM1UNd5AU6c4rUmrh0mzZ0p8HhRza/8PFLib197PrEixMB5JEijtqqGMd+jAPS1/m8XV5uf+uab9j/yICKaCdupHEVzZzRw5EZAEPF9IREUnz5QjIQipec7WsPubZE9J/WxC+k9JMJ7Icyjs5nEGJ5HKKdWLoKxW1L8Tgk19rq+NO1iz0kEGlWWkX2uadoE9cGld9raAwKStixhz0D61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP/LdwFiec20IrDICoiz/rBWHYj1B+a/9/5mAJAYe/w=;
 b=pOKsbyCbIgfe7seGAnYhjucCkU5uDjLe9UXEK7TehFGM5rcyCcKHHZIv+1J1+KvUnzP4dSLlo/YS6CnGu1+s9yrxqari6iHMP5hzBxYxcm8U5zLNZDHsLzRxmZs9U7t6AdxEzpc4R78pFdmYksd3yddP3PKWc/k7CKXeDFaxHew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 29 Aug 2023 16:25:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Simon Gaiser <simon@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Message-ID: <ZO3_0GKvEk-qoaoa@MacBook-Air-de-Roger.local>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
 <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
 <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
 <26c50dc7-adf3-dbf1-253b-ce333d31911c@suse.com>
 <87jztga3sg.ffs@tglx>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jztga3sg.ffs@tglx>
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH3PR03MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 018ad168-a457-4682-152b-08dba89bca2d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L1ymU9/SZO48SzasaWEPmSqnY5lmMX7TFIzfiwnHvoz0KsbmDbKhU19/TLHDh84Ms2+IAFGJqJZITsmn7VLlrgUJVDZ3ZxJSnl3atlZrHG4GIo/X4qQzNgu2YrNGK8ycdd8ZQbNGKMhHOW9m0WNOl0Y/ymDgHIE33PZGrQdkkw3KXh08IEhukhIDd9/820QDvF2H6caX00TnpXviHeM44rcQdVwoIWtE8HG7SiB4w3IG/ffwa4it3Wdfj/tsLBDS3/v4yCkl2sZ4hdZoXXpIfGNOvw8GytFjAHMUSo6MuEST++bep1y5biBK67XckLh0TdaWGvuZmkuVt1gwFqJO8p5dAQmHRsWZGm5xKBy1bTF/hBHw+JmJS7pw+n/377W2gMcznDxIZ9ZeaWJyRyV7rKtBSC1t+ao/NAeZjacw6Ga+jsW4H6d2GPNC0VKIRxiVhA4LcTwXFAbpXj8L+TvzwhEGYY5BzPa+dry4mbGUtwUFvHTrE6Xt3UZNorVN3DyG/bpNE/TTtCCLU+WoSl3WxqDydnQO6pRL/OdHprPY7LKAi96Oe97o3hWybWDja/hT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(6666004)(110136005)(53546011)(478600001)(6506007)(66556008)(66476007)(54906003)(66946007)(6486002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(9686003)(85182001)(26005)(8676002)(5660300002)(83380400001)(2906002)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akxyNngzdEM4MjlHVWZvQ0F0RWE1QVVtY0FkbXcybjU5UHZWYUNOOURRcENs?=
 =?utf-8?B?VFFoWmtOVVNtVmczNi9iNnJObkEzRHZQaFFGS0FUQkZRTGRmY0hyaFJMb2tp?=
 =?utf-8?B?T3BQVmVWYVZSMGt6MkI5aUtra1VJUUZYWXVVbVV3Q0dDU3FoNnhGNkZVeHIr?=
 =?utf-8?B?R2VFaHVsTTB0Q3oxL0ZNSFNwcmpCMG5TdGlwK2dmbFlPTldzUzY0M0V2NTdI?=
 =?utf-8?B?a1oxVDBYY3NqRlh1NzIyWWxBUS9CbDRUUlhrbDJoYkIxYzk4aTdDTmQzNmVj?=
 =?utf-8?B?RUdscXNpUWIxdXl1NEJ5SFprZXFSTkJLZE0yRTZqZDh1VVYrem9TRi95a1Nh?=
 =?utf-8?B?MFIxSTFBajRmTmt5OTIwMk1wWWowV0kxZFZzWnEvUTdtSFJlL0RqSlhuSFN2?=
 =?utf-8?B?YzFkTkFQUllOMDhzY2taMnpKQnJvMGFLYlZMemxHNE4rT2FadVBwL2tDVGpT?=
 =?utf-8?B?L0xiQTM5Z0R3bzRnSnBoT2RGR0ZXeVFUSkZydW93U2dxWGJQN3hoWUFoUDFu?=
 =?utf-8?B?Q3hDaG9NQTNSeFE2dFZsRGdRc1cvQW84T2dHTWhlNHZKVXNIeXdkWWMxVHJx?=
 =?utf-8?B?b0xCV3U2cGY3TjZYY2doODlBL2EzMnpxMCtGYldSdzRjZThZTmJaQU80aVJH?=
 =?utf-8?B?eVJWWFBkYkp2eVEyUUllL05jbXYvUDlBNS9NdmVaRDVyaThtSFkzWVpCNzY1?=
 =?utf-8?B?ZTY4b0k2b2h4TW1PQUlmQURwY3dycnlwWVdnSHpuNTltYmZrek0rNkwwNEJ2?=
 =?utf-8?B?d1EzaWhJYkdSbExXY2g4WVozU2ZhQXErMUVjK0pPVDNJK3dlN0NWRURPSEUx?=
 =?utf-8?B?MkdUZmdYdDhxdlhuSHlLQWg1WlVEQ2tEcnBHQ0o5WTZSZkU1U1ErbFFCbVZQ?=
 =?utf-8?B?S1BkV01pMWJTRHdsVTFIM1dUemV1a3d1S3MyT3dQdHpiQWZCSS82UWlUMUFu?=
 =?utf-8?B?ZkV1azFxTTVaL2NYeGRnTmNVY2dNZElocGlIek1aampQVG9vcXp6aDRmZytx?=
 =?utf-8?B?ajUrOHhhZithc1NtUUVJNHc5Z2h2NkQrekprcFZwMEszQ0ZQUjljbVV5akhq?=
 =?utf-8?B?NFhyWDJjVERqOVdBaWJBakw3UTJOdGxWQWdBZFV1M1UzbnFRb0FUZ0ZYblpM?=
 =?utf-8?B?aEVWU3Y5dGthbFRoZmdINHpmOFM3K3c0MnN2RlBrbHJuazNraEVuZFJOMnZQ?=
 =?utf-8?B?L3RycUxEY0lVYm82UDllTkdreXVwVkJzYVY4cHhTMGdyYUdraEZYTkhuOWRj?=
 =?utf-8?B?OWZXejJaUWpQNWhjaFROMStabkFTSGNncVJnczdHVURvQ0x3WnpoTlh1OUV6?=
 =?utf-8?B?YmZ5UFplS2svamYrRHF2NU9uYnJ5RzVXMjN3RDhCODBBL3J1K0Z0SWtHdDZI?=
 =?utf-8?B?bkdqdDNLK3BMUHFBYzlTSHBhTDJCSm92SDNGaCtyY1NJMCtoOG9KandkZjVF?=
 =?utf-8?B?U1lPa0g3SkZhVzhwbnBKelNiTlJrOG1FUVpKT3FON2xlNjQ3OFJzMkxydGgv?=
 =?utf-8?B?eURsYkU2K1hna01BU0NyWlc0Q081UU5XTVJlWGZlaDNNVTc5YlR1TmNWL1Bl?=
 =?utf-8?B?SFdLbjJ1dW1FWmY1eXA5N0hFMWQ5d0dVOFVlc3ZMMHZsbXVvMHNuSUtTSWVr?=
 =?utf-8?B?bGZvY0RuaW4vZ28rVmFETzNsTDAxbjFobG1BakNkWVhoOXZVNHhmVEIwMjd4?=
 =?utf-8?B?UGs1T0RSaFYyZ1RRT1pSaTJIaFc1L1pFQk5qaGxsYlJXb3VLZld6WE5INFdN?=
 =?utf-8?B?b1d1bXkyYVp3dHpGdy8yOThpOVBFSlZkdVJNTzJENzg2c0Z1NjlSSDZMUHNk?=
 =?utf-8?B?cjgyL2xuRnA3VEFCcTJ0OW1NWUVieHFBc1NUc0ZqQUxRL0dZdytRbUFZUFJJ?=
 =?utf-8?B?ZzFvcTNDUEJzZitZb2VLOFVLTm9MY1Fsbnp4VXdNRWFUZnhrMEthcmpWL09I?=
 =?utf-8?B?blR1WDhvVVNQb0tlckFycmZ3dXF2SklHN1dwbjFML3Z5ZCtVdVFhSHBYYjY4?=
 =?utf-8?B?enpzWUx6dmQ0dytQZGt2OVRaUkpOenZOMlkyVmh2ZEZoaGJ3L1diUW9zUTNi?=
 =?utf-8?B?RE15WlpXYnlhcHhnR3lKbTNzTmw4S1o5c0VJM2lQa0pIL2gvQzFBZUxNY292?=
 =?utf-8?Q?tGddxM1I8pa+54PQg5tW6LUZp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fY1i4tctrmcKKbY6zfOAXHj7o1e9cEqJu4k+XG+ew4aLTSxzZx92h7OZ0nFr/nhUhRq9GZegSJa/KMtfqyZt9nsvxT5VwHrYXDGHQbPIsGPzyKHx3umkrNtpg71IWzgDQ4KG9pLb6HnLen6VXzHs12jiTMO15liAgi+qU8boGv9QBcfu7pk+PPoo1ZxVJ7H0VOGZtO3DM1Y6Phm1GA13wXbgkaWRsCUkowOPZ8meDXx1DLTce0Q3Lft1oj7ElahN1K3hQY9GxY90X7KGhfyrTCbZ6oV1urIvswIbdf72tpmqWwTZ+Pm9Q0fIot5EVZb/JoMcn9VnB0podxUZ3ZMWeV/+mq8aVXKu3SgaQq/GRwS+5S5Vs/VWrv7SwcIXWS2mu1NJa2wqClaNjJNifTfH2PsbXviHk/b08oLJa5su09jXvtpCgyLyuAvLETHnLv11HO8sC3vIUKiQs6s+8N4uMWU4WRiOsoFysxX6RNA5SZFiR+siIpRD9MlSiRvD2SWHCGpoznqiaBZsGzZG7tpnHLTbhwyEPJtmWp9pXtBtP339SgRtICZANVNya1R4n/blj0W7xatM3oPjz1VdsA25GcXrRAk73b7o1YcF+oHPbas6lk1/9vB5in1jNRbIyZql7PSOlGpx+TWUpnjHP3smp4hZTrdbgqsb1AQbKkba0W+DuKy7DIUbqbYjmh3WIkNL17Dr/sTWiqZkiG22JKI4fkWBnHagpQ7ziPcNKh/br12a0tNXE0ZalpdTMQyTu7PXOXc8yImGxE8J7zdJoiY6yJZTKwHhT0rJDoRViqEVRgiZxHmQ0xnh07xgr8gMHe2Ty9J6sIciNEksIUaQ3cKziyTwwbEDmESnNR6voCqT0Gq7bzqhZG3fm6u/1gHczw0w27erUTTj5Kz8U3NxdDfI9hXucBd+AK4P+mk1llUOc50=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018ad168-a457-4682-152b-08dba89bca2d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:25:27.0951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1acpuGnQuQD/K5jZdWNczcApRWJpDvhBcrJWeamcnHghXUdYo99pTRpGwsFhhNOqdofm+GtjNeQN0aVUCOLSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7411

On Sun, Aug 27, 2023 at 05:44:15PM +0200, Thomas Gleixner wrote:
> On Wed, Aug 23 2023 at 14:56, Jan Beulich wrote:
> > On 23.08.2023 11:21, Andrew Cooper wrote:
> >> In the spec, exactly where you'd expect to find them...
> >> 
> >> "OSPM does not expect the information provided in this table to be
> >> updated if the processor information changes during the lifespan of an
> >> OS boot."
> >
> > I don't think this tells us anything about the ID not possibly changing.
> > It merely tells us that OSPM is not expected to parse this table again
> > (IOW firmware updating just this table isn't going to be enough). IDs
> > possibly changing is expressed by (a) the "if the processor information
> > changes", and (b) the next sentence, forbidding them to change while the
> > system is asleep: "While in the sleeping state, logical processors must
> > not be added or removed, nor can their ... ID or ... Flags change."
> >
> >> Which is wordsmithing for "Some firmware was found to be modifying them
> >> and this was deemed to be illegal under the spec".
> >
> > That's your reading of it; I certainly don't infer such from that
> > sentence.
> 
> The APIC/X2APIC description of MADT specifies flags:
> 
> Enabled        	If this bit is set the processor is ready for use. If
> 		this bit is clear and the Online Capable bit is set,
> 		system hardware supports enabling this processor during
> 		OS runtime. If this bit is clear and the Online Capable
> 		bit is also clear, this processor is unusable, and OSPM
> 		shall ignore the contents of the Processor Local APIC
> 		Structure.
> 
> Online Capable	The information conveyed by this bit depends on the
> 		value of the Enabled bit. If the Enabled bit is set,
> 		this bit is reserved and must be zero. Otherwise, if
> 		this this bit is set, system hardware supports enabling
> 		this processor during OS runtime.

Sadly this flag is only present starting with MADT v5.

> This is also related to SRAT which defines the proximity of memory to
> processors at boot time with a similar set of flags.
> 
> Also 8.4 says:
> 
>   Each processor in the system must be declared in the ACPI namespace in
>   the \_SB scope. .... A Device definition for a processor is declared
>   using the ACPI0007 hardware identifier (HID). Processor configuration
>   information is provided exclusively by objects in the processor
>   device’s object list.
> 
>   When the platform uses the APIC interrupt model, UID object values
>   under a processor device are used to associate processor devices with
>   entries in the MADT.
> 
> 
> MADT is the authoritative table for processor enumeration, whether
> present or not. This is required because that's the only way to size
> resources, which depend on the possible maximum topology.
> 
> Otherwise you'd end up with a CPU hotplugged which is outside of the
> resource space allocated during init.

It's my understating that ACPI UIDs 0xff and 0xfffffff for local ACPI
and x2APIC structures respectively are invalid, as that's the
broadcast value used by the local (x2)APIC NMI Structures.

I think Jan's point (if I understood correctly) is that Processor or
Device objects can have a _MAT method that returns updated MADT
entries, and some ACPI implementations might modify the original
entries on the MADT and return them from that method when CPU
hotplug takes place.  The spec notes that "OSPM does not expect the
information provided in this table to be updated if the processor
information changes during the lifespan of an OS boot." so that the
MADT doesn't need to be updated when CPU hotplug happens, but I don't
see that sentence as preventing the MADT to be updated if CPU hotplug
takes place, it's just not required.

I don't see anywhere in the spec that states that APIC IDs 0xff and
0xffffffff are invalid and entries using those IDs should be ignored,
but I do think that any system that supports CPU hotplug better has
those IDs defined since boot.  Also it seems vendors have started
relying on using 0xff and 0xffffffff APIC IDs to signal non-present
CPUs, and Linux has been ignoring such entries for quite some time
already  without reported issues.  Overall I'm inclined to say we
should take this change, as it avoids flagging a lot of systems as CPU
hotplug capable when they are not.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think Andrew had some minor comments.

I wonder whether the check should be done after the entry has been
printed if `opt_cpu_info` is set, but seeing as the ONLINE_CAPABLE is
also done before possibly printing the entry I guess it's fine.

Thanks, Roger.

