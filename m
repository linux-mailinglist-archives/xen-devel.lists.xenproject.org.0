Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A532A750A1E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 15:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562532.879249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJaIL-0001DG-De; Wed, 12 Jul 2023 13:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562532.879249; Wed, 12 Jul 2023 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJaIL-0001Aa-9d; Wed, 12 Jul 2023 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 562532;
 Wed, 12 Jul 2023 13:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65J3=C6=citrix.com=prvs=55084c2ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJaIJ-0001AU-Ro
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 13:54:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94adb952-20bb-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 15:54:13 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2023 09:54:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB5999.namprd03.prod.outlook.com (2603:10b6:5:38a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 13:54:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 13:54:00 +0000
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
X-Inumbo-ID: 94adb952-20bb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689170053;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vCdrEdqrufE4zBgy5pmd7cjq7Z6h7Nt5UN56pxCJ8MY=;
  b=fU+9Q0j3+KZZIFkqTchnW9JkQMCkiDWKdl/h+i0KjVWcqEnuyk+xHkDn
   VNpecqbe9jMzWP3Oi8QRilohEjNWrLrai/fcZynK4zRdtMN/0B9kf24Vk
   AVz146DEA6cVETFVXLK+xjMhZ5t3n/Qx5yWLOsLCU7WivnI90RwNWDRsF
   g=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 114683009
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Gk3fpqip1lEgwsxT5xB3Zaf3X161RxEKZh0ujC45NGQN5FlHY01je
 htvDziPO/ncNmagKI9zadvi/R4EusLXzYdnGgRt+CwwES0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4waEzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQSESJcQEqi3tmt/++GYe13tp5zCo70adZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqnBtJJTOXpnhJsqHu19mMUNDhKbwL4qtOdpkq/adJbc
 2VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:6HVvkKtMF2iUxA/SnBOBLISI7skDWtV00zEX/kB9WHVpm6uj+v
 xG/c526faQslwssR4b+OxoVJPwJk80lqQU3WByB9mftWDd0QOVxedZnPLfKlbbak/DH4Bmup
 uII5IUNDSJNykdsS7HijPIcOrJ/7O8gcSVrPabxX9oVAlrZaYl7woRMHf/LnFL
X-Talos-CUID: 9a23:YPeRDmDpfC/Ab+/6EyNe5h86QOF8SWbikUr7J1SIUzZPD6LAHA==
X-Talos-MUID: 9a23:GVHK+ATEmDKIiexsRXTKogFtM/tNv573S0sntbkCuvuEMXRZbmI=
X-IronPort-AV: E=Sophos;i="6.01,199,1684814400"; 
   d="scan'208";a="114683009"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BokNYzyCHaeJApe/xvdhvpjQdl8kwyhpqmBEwUmnIimatjxAaa8Zikt/hQ3iXJ4M1Ca5+i40QBcvyuXs/7ZWf/BSeFSUGiCXhBZX7GvJe7Vx1ZdkW4+vtdy+hoD/Fln71P44CNclHRQqO+wtgarCYrtGsaYaC2H93Unje735vsaQvQIps9cJCqrSazYBAurSw0IrF4mOpimBsIEU5SY18KLEaWCgt8yBIXjVr0HXL5iXiZN6iSCZB9DPdofnQbmJwW3uLkJAlUnp8iGSVntfNs5IYhNt75DAdQr4O5M6qXVx7GWVjo634qrX/ctQjJEVy+MH/r9rbMFSsVCe6SfGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/vQOwoWy4tF03DCtwjLc3AtsQSOcYWmuL0vQhZhTms=;
 b=LIuYEkFs8hYAGa12vV9hbTO/9U4ti6wK32gs7KPL62opTIloiBXT7Tk417QT+/TESJNx5p7PxWW0Cos6bV4m581CLTAeH/MQy/m7s318q3pu55eEtDFiGK1ij5S/RyOh/TeZURQdvE95wgSC8Oj0/ryyDqE+s378/vZFsX+lRqmKEGtEhGFN9sGYWWiM19+0C5h8LYIE8GWhju0IVMus0S9F21bzAmdmHVqKNkuOf671cZ+uV7AuYSCz5DHRU5N+UUoSVKIF9JJlZ2l4cqarGVbQkJLWrzlViVre4Hstc8ydWoVexPS7k5I7OJBySgWH62eybFaoSDwrQPBOryPmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/vQOwoWy4tF03DCtwjLc3AtsQSOcYWmuL0vQhZhTms=;
 b=tB8Xcv6+NCfJI3S2GnTOV8la7IowLwmmG+As+4d4Iu1v3oq8pmiBOAn8gL7CgUJgc6y8nltDaEV1QR2FveRDzzBZxl8QfxaGi5X8tvh9ZRjZwrdQD/8C8LflZYFe24rC8q/1ucVF42tl+hw2GGnankYaI11Q9YEkUmlAyDwQDAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 12 Jul 2023 15:53:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: fab9ef08-7ef7-48ef-69aa-08db82df717d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R5UKSr7vn0ASD2FkZPFgXJpiYdT1NeKenfL3ITZYx7nvjNGuv0Xx2IhdFs0Np+zPMlBEONdeODET+8sxAX7yuL/k+ED29tH6CnKro7Ffyt5CbXXZPogUZ1qmGAEZ7e/7eDL5vYFbuwub/KKHjLo3UT0vOadCXYoU7+tvMe7MtI6lH/zpIvu7H14+FA5RiYDpcxd358S6XNOhAx6OsuMfI1KGHb/TXYA1/+uNYm1B89GnQGgk/Y0Tsf7JWBPxnwkHeoyfLdrF5C7I4QbzQ1Unmpfgn4uAasE9Posehm5INUEF7mSA7374mFWaCLtsBjmOSK8b159Tnsm/h2Hzv85WKppvSzV+50r+xE2Y2C7Q1z9iZ8T4zgbw3jo17k665JYlYImAwCH6UodEmKcs52g1GeZcaKi3JFQoQP5gpmtEW39ozg3gNriUINVKSxwt1mXPFejSQQXVihpajyeHsso8iUAKmCD26Ut09Nr+XpDSWwr+l6i6IGyF8MXfXvMFGSwd6WoChhq2RVVEMI42irj8sMWyaEz8XzLvcq21dPytCSpqeeVe/xsaDkkhTtiQ8pqy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(6486002)(186003)(82960400001)(54906003)(86362001)(6666004)(478600001)(53546011)(6506007)(26005)(9686003)(316002)(8936002)(8676002)(85182001)(41300700001)(5660300002)(6512007)(66476007)(66556008)(66946007)(6916009)(4326008)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0N2RjhGK0JFNzZCYzVHQXlmQnFMNVNMNEFMMFNmc2xGWUR2UDZxeGswbmhZ?=
 =?utf-8?B?SDVhQnZXVkxkelVJdGhkYzU4ekZRQU9ROHcrbDl0Wi91M3ZiM0V4Z29FNG9x?=
 =?utf-8?B?aTR5cjZPRVUwWFJkdzUrWUw0ZzErdU1EMkRJZXVJeEd2Zy9RYTR3VktVdzlO?=
 =?utf-8?B?K0lqb0k3VjRHYkdCOUNjcnNFcXQ4K05sRWl6eFNDazUxejlSU25uamF2RFNP?=
 =?utf-8?B?MktJaDk2bVFsMzUvUlBlcHM5TG1SOE9SaVBtK3crVklPQTUzbG5wUE9XVEdL?=
 =?utf-8?B?VXJxRVNMWGh5b3FzU3cvL3ltdis2d2psNFptMXlyUmxHUUtta2o3YTZDY21q?=
 =?utf-8?B?UDBYaFY3RUdDMEdaSDR0Q3V4ZUpQem1tNi9jb0Z3NEFZdFF2bGE1SFkySmlz?=
 =?utf-8?B?V0xWTzRYYVMzUFluc0xNSkZleGIySDBtdUU2V2JrbldTSDBPZjZCRlFXeUto?=
 =?utf-8?B?aGx6K2pvdXJpUnZucTR0Wjl4UzRjUHhQUERHVXVYOWs5MHkyZFVPdmg3MXR4?=
 =?utf-8?B?VE16ckdJMDJlU0daZkxMdXhtNG1aZ01SSjJSWnliditpOTFZNDY3NW5NWUhz?=
 =?utf-8?B?OGtscmdKaFUvZXFBVElsTERlM1VLYjlpMENvUDd1U2s2bWgvZUFoRG9LQnFZ?=
 =?utf-8?B?ZUo3bVJlQWh1V2Jkd29aR0dzcWNtMDYzWFlycHI1d3dXQlViNlNoZmFtRzVH?=
 =?utf-8?B?NUtaRnU2WGJ1N2l4cXpSOUJVMGJUOWxkTUJRQytTVG1SZUhFYS9HTkZESEdL?=
 =?utf-8?B?QUM5RUx5ZWFlRGpiSzd4M1dIelhWc243SXJleUhEU3R5bWtNRFVQdnNScTF3?=
 =?utf-8?B?bUNYWWdIQ0d2amlPZFBRamZWVWd6VEJ3dmFwZERZbmMvUG55YisxalNOMXVz?=
 =?utf-8?B?S2M3eW83RHlUU1RjSUNGMDg1dVc0cnhCSlRqOVhDQ2o4YXlYcjVEUHpsOUhH?=
 =?utf-8?B?bzV2Z2VjV09adUZzVitENmRnNC94Z0U1MEw1RGQ2Y1lXeVFsVFBHd3pNS2RF?=
 =?utf-8?B?YmJ3elhRMDhlS085NDJ2ZHdQeDM0OEhXamozL0k1alBFUEJyMFZaeDdTSUtX?=
 =?utf-8?B?RlZUNjRkWTZCeUhlZEdJdkRCMGlWc1habkVCUWE4LzRpaU5SWVNmb1pJNkRo?=
 =?utf-8?B?MmhQWU5hNWxKeG1pNTluV0FROVpnUVJXRFFpc2EwSEFSNWhkSzQ3bm5WckNa?=
 =?utf-8?B?Q0hwQkFmbW14L3hibEtpMFRPTElFWVA1dHpYM2hFTDNySGlLWkNJS0Qrb1B3?=
 =?utf-8?B?VWxmZklxWFlScjRENEhiLytlR0F1R0JDQjlaK2QveVdzaVQ4T1F5eU9qUEM2?=
 =?utf-8?B?eFQrdlFrdnVmMFZzb0d0L1dOdmkwL0dGcVBlS2QrVzY5VGxLeUhKMG9kZUgv?=
 =?utf-8?B?dlNxU21lME5HLzZZMFpSN3dwYnpKWGllaVMzZTdPMHpBQklySHI2QU54R0w4?=
 =?utf-8?B?VDlrdDRCWTZBZFprSy9zby82QjlTZktCamQvMGMvdkJDeGhESk5hQkFaY1ZP?=
 =?utf-8?B?a2tRb0NKclVocENoWlQ5SU1PeGhpUzFpZXlsMEZXbzFDdzAxUC85Y2prOGs5?=
 =?utf-8?B?T1dTaTROVkw3dG9ZM3M2Q1gxMDlZS240RFJUcW5hM0prcEJNcTBGcGxNb3A4?=
 =?utf-8?B?VENqenFMRGZBSEJCR0gva1BPVmQ4blFFYTNBNGdncWs5Y1UxdFowM3RHQzZP?=
 =?utf-8?B?Mk5nNkZqbmkrcnlrUVp5V1paZ2ZpVHRsWVd4VGRRSWt6N21hVHFURjhsR3BZ?=
 =?utf-8?B?ZUJuR3R4d2Y1TUJHMWlYZ1VIY2pYTWFqb29hT2t1aHd0MTJxSFROS282Q1Bs?=
 =?utf-8?B?SDR3Q3RoMVdXYUhNNzJmSjdWTFluWTdHNzEzcVlvazhMN2F6NnoweVZ0cDV0?=
 =?utf-8?B?U2FHWmVhalcvZXQzMUZGZlJTWEFza2xKWjMwS1J2dnBqSGpVNnQ3bVUzTi81?=
 =?utf-8?B?RElVVUo2TmtUdVFTVmY1SHdpRGg2WUlQeXR4Ui9zYlMrdGV4QWlSSkVBS2o4?=
 =?utf-8?B?OEtvaFdwNzdlV2VLME5hTXNHR1NiTk1XZC9YTWpCaVdPM0JNZzVrZnBaQVN2?=
 =?utf-8?B?a3F1R2NNak5EcmxhM0F1QmxLVjg5NnlVVGpML01LQVN0S3AydXcwUERzMDVq?=
 =?utf-8?B?NnNHZElGOVlBcjF3TUR3cjRxS1gxK2t4T2J2UWcvYy9ZYmtmczFrN01nU0Vz?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IQ7ZsoN75F7ibhuAtca09+92sBNXHuhYAxpYYhv2pts+ibTJIm+NGrmnBF1aYSTb6+zO0xKGvWyxSSytvvNFeHdbvbyZSd33qnSmfwgmD15gXXeMYbP3NIgnmtI2tGte4o4yo7xHfowdtOh5q8acsHMcrM/jWWZSKRFlo5REjIKvPtMTHBKCOKNkW5H0uX8sbwykJUgHCA5WduHdtwqrOkw/sH6qHdArn8wBR5MGAJjCJYAVtvhLWe58xuwO+NWfZIhvGg2RQKJ6F3fRTp8Omium6mLDnPOMVnP//L7Nno1UWgukbuahZO/zfGmhMxmcggw/pBcf2SNmfJ2tLxmnyxPFj/JGu4Cu6DTTT3GJ89kYt7crurTx+96okmwfQZpGHreNODF8PWf/zgWxawYyG61nk4+o2ccMvahG+aJsc84d+7czGR8khLHFw9o5ISFUe5PPF2HPTzJW7nRkAH3cgyWa0kX0jclbaQgAG72BHMTAPJLU7FA+L8ygM0h/4OaR9C+lui8eQWpnrCMedD3F4/MU5Ui0+ocjtd+SzEEFjWToB32anSRBWLhApKvoDpvkWyP3qr5Nu+EyaGIQWtw2v0KQlh7+B+3hMBvrvn1kHcItBUlgUdBmJIOu9UvG9xJT3gHKn+8CX0q5TYVzLGVNkNFaufRNYDrjk9oBkmuthYPyCsfDGtQg2SDNDeXE7E/c+NDQRZxEwX6f1QTet2JesrUGA8wsglRTX8EajTjwIY/YXWjB1+AJJbE5mIUVdyI4jDhFUyh8Gy/dwh0Bpvoq9cg9ZOOcJuFy8DW2DjaPQJpHJrU9SOeiV+I5l6o4CJq8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab9ef08-7ef7-48ef-69aa-08db82df717d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:53:59.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4+Ekyyrfd8d556iZa4Np3Ehk/iR0oCsFYyqptYy70rYrhEWcNVnxAeeeybKP/qsQxE4JPp37rOKqKFhpQnb4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999

On Wed, Jul 12, 2023 at 12:07:43PM +0200, Jan Beulich wrote:
> On 11.07.2023 15:02, Roger Pau Monné wrote:
> > On Tue, Jul 11, 2023 at 12:53:31PM +0200, Jan Beulich wrote:
> >> On 10.07.2023 16:43, Roger Pau Monné wrote:
> >>> On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
> >>>> On 07.07.2023 11:53, Roger Pau Monne wrote:
> >>>>> The current logic to init the local APIC and the IO-APIC does init the
> >>>>> former first before doing any kind of sanitation on the IO-APIC pin
> >>>>> configuration.  It's already noted on enable_IO_APIC() that Xen
> >>>>> shouldn't trust the IO-APIC being empty at bootup.
> >>>>>
> >>>>> At XenServer we have a system where the IO-APIC 0 is handed to Xen
> >>>>> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
> >>>>> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
> >>>>> APIC is enabled periodic injections from such pin cause a storm of
> >>>>> errors:
> >>>>>
> >>>>> APIC error on CPU0: 00(40), Received illegal vector
> >>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>> APIC error on CPU0: 40(40), Received illegal vector
> >>>>>
> >>>>> That prevents Xen from booting.
> >>>>
> >>>> And I expect no RTE is in ExtInt mode, so one might conclude that
> >>>> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
> >>>> of course there's then the question whether to change the RTE
> >>>> rather than masking it. What do ACPI tables say?
> >>>
> >>> There's one relevant override:
> >>>
> >>> [668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
> >>> [669h 1641   1]                       Length : 0A
> >>> [66Ah 1642   1]                          Bus : 00
> >>> [66Bh 1643   1]                       Source : 00
> >>> [66Ch 1644   4]                    Interrupt : 00000002
> >>> [670h 1648   2]        Flags (decoded below) : 0000
> >>>                                     Polarity : 0
> >>>                                 Trigger Mode : 0
> >>>
> >>> So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
> >>> connected to.
> >>
> >> Then wouldn't we be better off converting that RTE to ExtInt? That
> >> would allow PIC IRQs (not likely to exist, but still) to work
> >> (without undue other side effects afaics), whereas masking this RTE
> >> would not.
> > 
> > I'm kind of worry of trying to automate this logic.  Should we always
> > convert pin 0 to ExtInt if it's found unmasked, with and invalid
> > vector and there's a source override entry for the IRQ?
> > 
> > It seems weird to infer this just from the fact that pin 0 is all
> > zeroed out.
> 
> As you say in the earlier paragraph, it wouldn't be just that. It's
> unmasked + bad vector + present source override (indicating that
> nothing except perhaps a PIC is connected to the pin).

I can do this as a separate patch, but not really here IMO.  The
purpose of this patch is strictly to perform the IO-APIC sanitation
ahead of enabling the local APIC.  I will add a followup patch to the
series, albeit I'm unconvinced we want to infer IO-APIC pin
configuration based on firmware miss configurations.

Thanks, Roger.

