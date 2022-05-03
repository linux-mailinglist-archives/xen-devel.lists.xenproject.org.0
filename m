Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E02517F2E
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 09:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319210.539362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlnJB-0001TD-VF; Tue, 03 May 2022 07:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319210.539362; Tue, 03 May 2022 07:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlnJB-0001RJ-S1; Tue, 03 May 2022 07:50:57 +0000
Received: by outflank-mailman (input) for mailman id 319210;
 Tue, 03 May 2022 07:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlnJA-0001RD-Ej
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 07:50:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c08742d1-cab5-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 09:50:54 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 03:50:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO3PR03MB6727.namprd03.prod.outlook.com (2603:10b6:303:165::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 07:50:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 07:50:48 +0000
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
X-Inumbo-ID: c08742d1-cab5-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651564254;
  h=date:from:to:subject:message-id:mime-version;
  bh=raXzC/QvFMIC7LrFRabMthRbB4jChzSiAyzuZPY+QK8=;
  b=OuWkymjnC4JJaRpxZyc0n+snXYQJ1s3EOWJStwXi7WOh4aNqkOiXdtTl
   YoqlA1Tw1OVfroKeM90mFujC+gbwKvOcXERQVkotFO0Z+e+/aWcaoSh3C
   Jyaj42RmCLxkMR+d/cgpD/I/rwD6txMg4JFXV3lNuL1XovYUuSkTVERbW
   U=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 70445231
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L3mg9ashTumMyr26tMjOOIfKuOfnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWjTb/vYZjTwLY0latuxpxkOu5+Bn95rTAA/pHg8EXwa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17V4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi83IfacqONNSCJmGnAmOaAX5OLuGVWg5Jn7I03uKxMAwt1IJWRvZ8g037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IJmm5v3aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3N+fZquTOKpOB3+J7Oc/PRU/bTeZR6ohaHm
 nuY32bWMg5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GQR8ysq6KQ3qkqiS4CnWwXi+SHf+BkBR9BXDus2rhmXzbbZ6BqYAW5CSSNdbNsht4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:hevFsKDHEm7QaKLlHehGsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5fEtQ/+xoWZPwJk80kKQY3WB/B9eftWXdyQiVxeJZnPDfKl/baknDH4dmvM
 8PEpSWYOeAdWSS5vyKhTVQfexQouVup8uT9J7jJjpWPHRXQpAlyz08JheQE0VwSgUDLZ0lFK
 CE7s4Cgza7Y3wYYumyG3FABoH41qr2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8zKS+tPOQzAPaygbonuBrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHhzwxqPHH0idbrP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrKu6XCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5uLPSwphmiOP0DIfeNYo/jFiuLYlGfNsRdR1xjIbLH5AJlOy1GkfKp
 glMCmGj8wmP29zbBjizxhSKZKXLzUO9yy9MzU/U/yuokJrdU9CvjclLewk7wQ9HcEGOut5D9
 qtCNUWqJh+CukrUIlaOMAtBeOKN02le2OzDIvVGyWQKJ06
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70445231"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxGDmcIbVHUce5LwknItGCiObR204uzj+0jBiMGQFsGHPHda09QdwXxlRZIAUbuwQtQvpOaHxMDIl+GIPmzvYq5tg+NhSFLwRMlZ1rIx8p/WYKXfBYS2usw0sAXfJwrumw+1gnmddq5AQTIVLjZTa20t2F7YkzztRaYRJE6DpLuGl4HcilSxgz5Jp3HAbRFvA2E1AHQ35ZpreLPPkZzSHpk4SayaQ4W1WtxAxQkvTCopdxhqQ4j+R4CZVwLZVr3ZKR8z45qWaXnCkoDymRk2XhoJb6S9grMjMij/qdLukrBk3bCxnDx41oANh9ZoxreWTVES5WmZTrSa5Pc8U2K1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGqLdgLtXKFLolu15b9s7nisL9xDZO7gFtXTaY6FjAQ=;
 b=XQBWebqpggi6NaImB/vUnzelUEtGYhWN/G5ohKkSTnieQxdJPXAqtmuC3u8+M1UHErNwTPl0l5llUMRMXiE7STSwQi4gustF2nbvmo5Kce11H/eM36/ISXpoJife0CEvVY1JdhCM0gfGFonExEOCl/isjFBI3lg1aLeyjUG6B9lDP3nOzH9pUpHBvpZnyxRPrcVY9yd8EPzoxITzvNOOnUvx+6ac1jLwICVy81ENU2my+q71iHRbW9c9J1RZoLOwZmlHYptUtzXoyTDEBYkTlIf5QFcvnNAPA6oN7XgObICM5LooAyPD7hGJy8F3Fg7ZgNNH9KcTDmdBznPKdybMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGqLdgLtXKFLolu15b9s7nisL9xDZO7gFtXTaY6FjAQ=;
 b=hPZ0xFQDU5CvZZeqexJN45MjVtkH13ueFUxBPoVvByPu5MsCrtGOhNZLPEhkrbUQ+bFej+BissiKfhxMh7GWwwcCm1EODDXz0ALd8hiKNmm9asEoeZCNjhPvm1CW8eCBLn5iucLUqVMVQTrurbEnK+xyAZgnaUEoXiHU0PHbiTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 09:50:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Subject: osstest: blessed sabro boxes
Message-ID: <YnDe1BXLVsrkaKLG@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: BL1PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b703c5bb-a631-439b-05a2-08da2cd9a318
X-MS-TrafficTypeDiagnostic: CO3PR03MB6727:EE_
X-Microsoft-Antispam-PRVS:
	<CO3PR03MB672770FD8832D491C679C7068FC09@CO3PR03MB6727.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LPhgkt+8NWE56fpVej/s6SSNWdsgFUFV3EqucFJeHmqTumYuGiUspKieNJZRqFl/jR1cysZiqYiMR1bT4CcFMlF6Rc2oxd342DIqsfSWuu02z5Ug11knxlzODt9S1XQQt91neVsSe4eEL1WlGurNHR8nhohTCKV1Qu9V7GXqtfKG2r05RwvBlAA25clgxkMIav+KCsG8ZmoG+cSlX6mGjPRwR+GWGwR333v6KdFBGyDh3OhGjCtpyEebVE4a7dnt2o7Aosp8bc680zMdKWL7LwcUymtLaBLix5fd4i+NN7qljftfGW7vM3sdH/fcYmd+RHnDiS0NGi0Q9QtxxB46SDGefE3APXP9WmgnW5FnVpIyNZ9+/iWM3Yh+lzj9a4bNWkfiEsMIoGZHSVeP/IUqvcmG0vPr/ot+32fjrzBBX6nyMNLUgdaatmCw6Pv9QRhGt0pAHmhzxAJHhnxELZJt6wNUvMO7FhuMHCaHlIIlw5rytNeOe2UXZmNctjS682mfXNfVFdbxKwSaAqQJJVIsUWle8d/LKgPJeonqcU2FXiCzGmMWTuei1CXUxdgSEAK1FaQ88atXbFqOw3dkeqjs0enRz16JAWDBX7+f9AIAOl7g+/yJmcmdqIgfZW7CVMn1HPe3HQ9qfaKYnmqYKQF+bkDzQkJHe+HmzV6epZig2PE+wbrtuazh80ysgtXHIyfmKr5LCb3OEQ1SJNKf5FrSIVUWwDWplKqUggqVbdl20ZHoWKeKCMPIznMz4i6TpbiYZqVNALyDQmVyMPdGSo2nHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(2906002)(6486002)(186003)(5660300002)(26005)(6512007)(9686003)(8936002)(33716001)(86362001)(6666004)(66556008)(66946007)(66476007)(8676002)(4744005)(83380400001)(85182001)(38100700002)(6916009)(508600001)(82960400001)(966005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURNR2k4c1g1cEwwMk4ybU1TUkNtN1RUTHB6UUZscTVWY2FqQWNSV0NvOTR1?=
 =?utf-8?B?SlRvNU9vREJ1d0E3U1JURUJ5OXlxRWhBZlpWZUx4Q2tXbjlEVmYxVlJGSnJm?=
 =?utf-8?B?K0hmRVF2UHFMMWNsU21vMjRqZFJIaWtiQ3IwWmlNdEp4ME9SeUFORFU4NHVU?=
 =?utf-8?B?Y3BoU0l4VW9vQzNhcXV3OHZ4ZGFpVnEwZ2JJN0VMNWRvbzZmL0hSdkJSL0xy?=
 =?utf-8?B?Q2NoU1l4WEx1VlhGZk5kd1JVdDZ1L0lFM2pDZ2Y3WFBER0dZREYyVmgrbU85?=
 =?utf-8?B?YnJPQWVaSldYTUZLNGJSV2dVU1NTWFV4bTV5VmF0eTV6WE5Sajlibm55TnBV?=
 =?utf-8?B?STVNUVNyTFI2L1JLNXZ2VURoU0c1Vm8xYlN5R2E5eVFmVzkrU056YmFJSmFT?=
 =?utf-8?B?UlNzYUZNSWdmSnBEUCtrK0QrSkUxZ204RTI3d0VCY0tqNndjdllZQ0d3UXZF?=
 =?utf-8?B?Y0l5WUdvWi9iR1E2S015RHpwejVzd0oycklocWExMU0wTTIrR0R4YldGQkdE?=
 =?utf-8?B?NnRyUlpBb0x4VmFhUGorRktuTTZGekxBdGZlM3NHTHlmVmpUR1JobjdtRGht?=
 =?utf-8?B?bzQyNVQ0enRheENmQmsxSGhtajV5bzVHUWs5dDhJMUlSeSswQlU1dDRVN3lu?=
 =?utf-8?B?V2dxRXRrazBldUFGaktUa2hZM2VWV2xzU3EvdTBlNXhaanZkdjdVUmdsR3ZG?=
 =?utf-8?B?aWt5MzVkMGducDNvUUFqalhxUEdHWk9uR1JuTUZodXo0bWlXYjIyN3drYUxB?=
 =?utf-8?B?RTZ0ODZyWklBeVNNcEdSbERlMUo4L21pQWRvSllPU2NFQTFJaG13ZG5LOXhN?=
 =?utf-8?B?VjJZN1NFVEUwdlcyM3JOZlY4U284cnluMDZWbUhPbWZMdVBESnhCcHY2V1Yy?=
 =?utf-8?B?Z09UV3A2VUozZEQrQ2RhbGV3WkZDTTVVQ0pEanVTN3psdHBMQ2RvV25EME9p?=
 =?utf-8?B?bWdzNFFVcXFNVEFEelhRWkdxNkhQYUFVMUlXS0pOVlRJZURvTDZFNlVBOHZi?=
 =?utf-8?B?U2wxTkIrQ1VWU1owcG00WUVOTTBpQ2wyQUxXYzVBOU90K1Y4MFBLRlh2TnVB?=
 =?utf-8?B?bnFkZUxTalcraUNlbTkwcVV3ZEJiVTFPTXJNZlNNRzFhUDl2ZFlVamVnU1ox?=
 =?utf-8?B?OXIwaWRRbWxxVlJFNTV6Q3k5T1p2K1A5ZW82c29JYndjL21YdWlNaHhuSWZq?=
 =?utf-8?B?KzhvTGN3UzJVZ250VDI0TDVrRytNcnN0dGJTR2p2UlgxdndnM0RISERmRXk0?=
 =?utf-8?B?M0c1OG0zWkVLMGh0d1I0dGlZZkNCT3N3eStwUDBURUpVMWs5WTR1UC83RkMx?=
 =?utf-8?B?ZW9ncVozYUFQVWoveEt6ZGhDditDeStzV1luTWt6V2h5N3RlV3d2c2U3UlJD?=
 =?utf-8?B?b0pERXd4aVJ0eHVHU2IwTGRMQ1Vkai9YbmlXbFFGYlVoYnJsRFB5dDR6Y0V6?=
 =?utf-8?B?S3JGQ3VVVHZtakFNMmZlcndCSmQrK2J1dGhWbXh5ZGcrMC9GU0JzSnNOVk51?=
 =?utf-8?B?WDBxcXBYMU5STS9TanhDTTJNSHhjeVVJbysycHJuVHJSMGpucmY2NWNUUkxJ?=
 =?utf-8?B?MTBEdDQ5MzJHbUxMeldxTUhLS0VEMmRicjZDU09tODFzZXJvZVpFU2xoSDFu?=
 =?utf-8?B?OC9lWi9vK09wVDcxUmJYaXRHMW56OXVDV1krVGg0U0YvZkZwMi9LREM3WXNq?=
 =?utf-8?B?NHBQNUVkbzJpRmZYZFgxNFNLaEdMY2JCUHVKWGxLMWZEMkl4ZTluaUI5MWVy?=
 =?utf-8?B?dEttdFZPT3JoT093QmthQWdNWGVkREtjMENOdTNTaXI2N2I0WmljYnQrUVhn?=
 =?utf-8?B?d0tobGFCSlRQeGg4b1UvSVlncENsTGZXajVsVEZLU3ZuS2N0UlR2bWh0eGVp?=
 =?utf-8?B?b3BRdjhzMFB4ZDAveVpOMkpROXE2TVJ1d0RlVk52YUdBZ3kraGpIbFBxN1pz?=
 =?utf-8?B?OFM4UkRmZDFkMktQRlJqSW1wN0pkKzZudlZDZTZrdlRmRWlxMFV2UUFLSVpS?=
 =?utf-8?B?KzVPVTZoNUtwYlM1VGpZdndWamh2UHQ3TDdBMnhuSjRoeEZtcngxb1lpY2lx?=
 =?utf-8?B?YVR3RVFTU0d4UUE2dnZCb0pVZFBrKzVFazJ4Q1RtcjJ5S2ZHNVF5cXJBQjBT?=
 =?utf-8?B?Si9OSUhTbEcrdUN2R1ljdURrWUpReUJZanRYWXkrL0kwcTN5LytVUVRvejFy?=
 =?utf-8?B?dU8vaVNNdmRDYzh3L01OQjhRLzI2M2t4bkNQYW9HZ0Radjlyb1VUZ3k2enh3?=
 =?utf-8?B?bkNXRU5TTi94cDBuT2xDQ2ZHVlpPYldPTmJ3RXhIOTZkdkh2T2ZqYUF0ekdX?=
 =?utf-8?B?eGdiUFBHZ3hrcExRWFM2dmdKSk9XajJibEJ1Yncxd3BqdEU2K3NWUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b703c5bb-a631-439b-05a2-08da2cd9a318
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 07:50:48.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3toSh5NSaKq/yZjPCO2j+JPz2Iks9E1ew34r8kbojo7Hbh//jZ4usq4aI1AmOzQ9I9J0b5oE1u3OYrS7/YhLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6727

Hello,

I've blessed the pair of sabro boxes for production after a successful
commission flight:

http://logs.test-lab.xenproject.org/osstest/logs/169857/

Note that the boxes don't seem to be able to boot in 32bit mode, see
the following flight where all 32bit jobs failed to install the host:

http://logs.test-lab.xenproject.org/osstest/logs/169986/

I have no idea what's causing this, and hence sabros will only be used
in 64bit mode.  FWIW, those boxes where already not marked as suitable
for 32bit installs, I had to add the arch-i386 flag myself in order to
test (which I've now removed again before blessing).

Roger.

