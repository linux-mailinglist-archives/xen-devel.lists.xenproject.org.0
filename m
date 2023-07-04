Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1403B747622
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 18:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558540.872736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGic2-0003Tn-VR; Tue, 04 Jul 2023 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558540.872736; Tue, 04 Jul 2023 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGic2-0003RU-SA; Tue, 04 Jul 2023 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 558540;
 Tue, 04 Jul 2023 16:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGic1-0003RO-Mp
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 16:10:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52aebf9b-1a85-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 18:10:43 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 12:10:40 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5789.namprd03.prod.outlook.com (2603:10b6:a03:2d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 16:10:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 16:10:38 +0000
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
X-Inumbo-ID: 52aebf9b-1a85-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688487043;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Bt93nT1zg9KTYasM+uWVMwdTK6kw7XhoHbQfLpgTvUc=;
  b=X56S/Wgj7YF2I/TVleANf9FlQLQzQiZhJgAKULZfVhslItkGPxHkoD0w
   IayHqSSwJsLzAeJkTzJ75xy7i1GqFmUhldS+CE9mwNxqfLqutGA+rBoHP
   wFEl6Qak48pb+oVi905OOKzASr29XOnxYI9YvIlQVyLnjhL0d0FnnZ+7z
   o=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 115013130
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pNoBYqDs0HRPjxVW/xjiw5YqxClBgxIJ4kV8jS/XYbTApGkggmMDn
 2EYCzyAOP2OYmL3fdlzaIi+oR8BsJGHyoBmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxA4gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9+N6O3pJ5
 6whBCkdNjPaoPmt0a63Rbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDC7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy/037SWxnuTtIQ6OrH78qVrrEeohTIeBRMwTH6mj6OWhRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnp+Woim1IjM9NnIZaGkPSg5t3jX4iIQ6jxaKQtM9Fqew14TxAWupn
 GjMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:VxIYO6hlWhmATj9QKGjvr3tDy3BQXt4ji2hC6mlwRA09TyX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80l6QFgrX5TI3DYOCOggLBRuxfBODZsl/d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhzVQyuxQpeW6zA==
X-Talos-CUID: 9a23:DJcbnWFctrcLHxDDqmJq8UMuAcc3IkTx1WeIABafEn14VLGaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ASMoC8g5LhY5gQCfO76DrpMzSxoxG7+eqU0Ehi65?=
 =?us-ascii?q?F5cSJOwppHiqz1hu4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="115013130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUsftBTPZMzxfsfjxodgIKwfju0PGHh9hLpRhUNb3nL53OeuxtoLb9A034EoyVgjAqeBJdwyQa/UHV6wOwOEXe79KASsO46lPp1CLsWQV/Td3pw0TXm1PzIbdu8yGOfIfQuTLrtYNvIh/pfFPvl0TX1daxb3f4sa/LqZjNtp2SPYwIwux+hb+ixKqOsEL/dmBEJliXKlJT0dEwXpgUEmruMxhdz5bmUeRZgR2DuKX00Jo5kKverx3DGuDko5seEiP69Qty1EUx9VVVieDPj6xzhi1evRwVqb4BXorqS7nudGcTVYoeMjKKuUAXgg5rn9oi49xUjmnxEwa+QOymBrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIKXBwrWOoEo2vpzPk3libQACzHijNXPMKP0KCbHiu4=;
 b=oFh57AbBnfyO7cQcXa6Y93VPWYICJmljK1oAekM4C0fSp4sCyL++Mz9Oq6/clcdZFnboK6/GVTIqlh1exW/idLOBmfVFztfRT2T7Y2gstl27VOZpV0cXnu3RubxJIyOGSO7hWtRh6LvDY+5OhqrBndI9kRc6mKgPfzSB3TiVMZvSILyiMCtOi3qCJlWhIa2+ee1fZwBI7ejh2nmydjkE+vbkxZYAGKoMns8hEoVTS+Py+n3dhNi1iIrJ5JcMPq7LkeAkZuguxMXZt3+55j3QbzNtli4nVR9Jp8hdj2dBPIKQ9XDurjGCOaSAAzTca/9JDxz+7z51Pj0Uqs8+c6sEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIKXBwrWOoEo2vpzPk3libQACzHijNXPMKP0KCbHiu4=;
 b=l9wVkJpqvn4G1kIuDOBsZYvByh58uBfwqcbo6wncacv3ucg6tWZRmA7hf0MTQ9xjYAl+nU80nybeJsZZu3UhwwNYLoS/pZscvkCZyeAPHOjAWsm1NQkMbJ2hpqPpcCCPquLKAOhWJnqklpa4Fkt2kbmnGdVThGsRqnJJS3rZbj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 18:10:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Message-ID: <ZKREeO2XJ9C8FYOM@MacBook-Air-de-Roger.local>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
 <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
 <ZKRA_X9uudh6TRov@MacBook-Air-de-Roger.local>
 <39e5b62b-d863-ad2b-5e9a-461fab6c9d31@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39e5b62b-d863-ad2b-5e9a-461fab6c9d31@suse.com>
X-ClientProxiedBy: LO4P123CA0587.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: dd341efd-c86b-49a2-f5a2-08db7ca93493
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtP6mhAMfZr5WSc+sN2C+bFM7WIfALp1ZDHI0aWi8NirZSSDA2oUR8waNpB5Ci9DtcRpIGaDeP1ZDSHWGzI2kmiye8tA67UozoM1kpVt+jZLcT4TSEVkQoCjJxAicR0YBSZ31I2gvnkK7bzSVeDQ9xFDVTPmBs2iLPggr5VvElXS65H3DIExzoutXRY1p6vBbsLhKR3f4r/wluhWYouvstKXanrGMtGY/e7/1k54AXYJYmgn7UnAblaXaO5GCHbFVme771F+Hnz1E8n6aU9o6p0QP306ojBojDnA8V6iICYY1JQhoi66VwEgihP1Q1SQCsQMAaJZu9jGwNxJ0FNDB3dCrmbU7vtmYDByS9rAFjglBOYqecPvfDRhR3Hu3k8LApesTzVdQ+3MMf+qZz9QCspWVB+lpmDFPEqgUScvTLxIbTQvazfYV0/alxGhZHj5izn6t7o5DXfduRavn6GVh7r2xy1iro4bFis5M9gOpC5GZR4cKq+x3haTpw8ZP86OYrM72zzAeKtyM3NXP2GvmEYXL1Jp0xtfJKTujRSHFF7YkaLKC6HRjgC/Yt/7eGsL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(2906002)(41300700001)(8676002)(8936002)(85182001)(5660300002)(86362001)(186003)(478600001)(107886003)(26005)(6506007)(6512007)(9686003)(6666004)(82960400001)(53546011)(6486002)(316002)(6916009)(66556008)(4326008)(66946007)(38100700002)(54906003)(66476007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anFwY24yem9hZjRWZ2lLMExUc1F6SjBoaGdHdEpIczlhYmF2ZkN3b1NPbHFG?=
 =?utf-8?B?QW1BWnhIdzFhckNlVHJ5dHJvOWZ2MDdZdXovZkhpMytzNG8xMTBiRmVac0Fh?=
 =?utf-8?B?TnRKdGNGSzcrR0FGdmlDaHNzVDJTOEdteFB2cFlhWjhLOU9LMndlRkN1UCsx?=
 =?utf-8?B?QWZIRXdqcGFkNnpDVU93M0ZqZ3VNRkRWMnlzUDk2NHdKVEJqNTFSYVdYbE1M?=
 =?utf-8?B?ZnFPcVAzbVlaUml4cVM4M2I1WDB0YW03K1R2UmFocUZ0MUl0YVVwYWxVQnNv?=
 =?utf-8?B?T1dDMzkvU2UzTVZVU2Qxam9DRVJlQTVjREVyVS9WMGRWYVkyTDNBanlUZnBx?=
 =?utf-8?B?d1NOQ0FDSGtvcjFOTTNXYmh0bEtZdzg3ZGRiekg0YWFPdUNlYW04TG05aEVW?=
 =?utf-8?B?clorbnF5RFl5NnRnU2RsYm9XclRlR05qd0Jqbm5mc2dVdzhobHBiNUJPVWdE?=
 =?utf-8?B?bVpuWnNXbTZ4YWswMWhEWmdiQUJCNE45TUdXTVNLSVFqTFZTT2NicDhkNW53?=
 =?utf-8?B?cGY1Rm5WNlFzMVNYUGRqbGdjMmwvUVcxUm5uOUVaUUcxSHVlb01wbkxSMHJS?=
 =?utf-8?B?V3pZZG5FbFVkS3VmQ0lPcWl2YUh0ZVNIS2M5QklUc2w2TEQzWlJ1QTNxSE16?=
 =?utf-8?B?RU5DVUFmNEZoMjdlVG1TVjFkNXFVald3T2lKZTN1Q0pFNitEdnRiUXdiQnkr?=
 =?utf-8?B?TUNNeHpybTA3SlgrclRCTG9hTk9uK0FxR2ZGVkJESmRrbTZUSXR1d3pRRHd2?=
 =?utf-8?B?TEx0SkgxS2NQRVBUZnUyUmpwQUIxSmZ6a3BUR0RMNzg2WDNjbjZDcDUvQXRq?=
 =?utf-8?B?ZzNXR3ZYbXA2QzJzTS9BbWVmTnZ1ZmJrR3ZoVGdqWXJrY1Q5TjVIZmQ1anQ0?=
 =?utf-8?B?RG4rU0w4TGZrVlpnd0JlM2g3dVhRSWhleEdDNkdkWjRwcE5yVk1rMWFRYXpv?=
 =?utf-8?B?amhFN1FUMTdPTUdJZXROdE93bXorY05WOXJlM2xkSlZHSnYzK2NhTmJDSE9T?=
 =?utf-8?B?SmpTdDZDNWtlTi9qcjBadzNhVnFvUEdMclNPWUlmaE1MWDhwdHF2Z1RtcHNW?=
 =?utf-8?B?bVZVSyttc2RnN0RQeFdWS3VBekFaaHV6SU9HL3Fsc3dIR1A3akVad0NIaE9Q?=
 =?utf-8?B?ODR6cmVOOE5GT3JWblhBOGFzZDFwMHU0M29Pdnhub3JGNk80QVZFRllvUmlV?=
 =?utf-8?B?Nkp5ZENTVU9vQzduZE1DTm9TWENVZVZCSWxyWUZ6UDN5TVNvTUpvMGtuUFZN?=
 =?utf-8?B?bGsya0J2aHhLSDRmR1dFeGJzU2xQN0p6ZmNJUUNqWlRGR2xHdEtjaG5ydjZi?=
 =?utf-8?B?YVdtbSsvei9hRDFCYkF5TG1WZHcrOUk1R0h1alg3cTg3dllOcURwemtSY2NG?=
 =?utf-8?B?NWE0S0x6TmJwSmV0NmFmT3N5VG9RTzQzWnd2QzFBTEtjQnpPRnhuTW1nUUl6?=
 =?utf-8?B?SFBzQXlidjJPRFN1M3hpUFREclR6ZStXUWtXbmpDWEUyajdLV1dzdUt5SFdR?=
 =?utf-8?B?ak1pQWNwR0ZvRVpzK1VlbWpWdlUyMFhFQnZVbElSQlhGYkZNRVByTEYwUHQv?=
 =?utf-8?B?cnZNUm1TMnRXZTZIWjhPcmVWRW4wS1ZCeER4MmtGdzFZb2FSei9LY1lpNjY3?=
 =?utf-8?B?YVVJcFdZK3V3L2V4U2pHR3liazNLc3lRYzB6Q29KcVE2YXBhNk44clU4RzZP?=
 =?utf-8?B?Uk9hRTZnWDNWYmUyVmxkUjNSdm5ZWUJXMFZpcGJaUzFOM1VMSVFkOW5jeFVr?=
 =?utf-8?B?VW5KdmJQMzlnd1M0VUdORkw3Mm1ZN3NvcXFWZXlxeVl5UGovaTZsRlJ3d3Vu?=
 =?utf-8?B?Zzh4SEY2WDdoNWVEY2Z3NWd0YVVTeGxNQ2xJMVRsbEdtSmlrV1h4WFdLSU9T?=
 =?utf-8?B?cS9xbzJRWWw0Y0RlVkJjQVFkSUJ5djF1VG9GdWZnK01xKytIWXVsdVR2cXZY?=
 =?utf-8?B?dzNYRkVUZDJ4em5LSlhVTCtZMUpSZk9UZTN5azRjeHM5dkdlVk1XV0NSUzIr?=
 =?utf-8?B?OFB0RVZSVVltUi83ajdXYXBUM203VEVtUVhFZWRoQnpCeTNtckxzejRiMURD?=
 =?utf-8?B?MzlvdzF0eC93dDRDRGF6cVpGLzZ1V2dPdWJxUXhSVmFFL3hDblU2bnRBaHMz?=
 =?utf-8?B?K1AxRnJDcEJOdmwrMDZYbWtQU3liNWFHY0V6Um1IN0paVGJOcjE0VnIwQ2xa?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I2lhabmDfrw/K5sMgx+JxqO0WuNCCxCguhW0Czv1Z0kPPBnBUFKg8PyJwgDlzMPrmzAyngdFFC8xwe8u6H4l13dZ+yqtVj6elsXw4+SeOXz/i3zIxxCbifw/QdYTBhmQGqZ3gPvIhStJoA82iROq9OSS9aPRpnCF7d751CC+epdJdbirviHN2lUXQXIwRyyqx94W7HQ9Hl5/vRBxHtJR+5oqZgvmzTos6mfnZ+/nLKEUI3nBRmhkmHFTlveGDxdgSEuZEhps77uii+R4LMQN6H+h/ZKSkcqcios24FoWPcJpDP6eqVxZ22UbXmViU26N7Y0dxMYonU27Axe7M1I0E7Ji5ieSRWBseUWu7Tbo1VJ4CwwKn/L0x/d0SqnFUx55tceNhsm1VV/aqQR/G9FB6ldbgm23/s6QcxHg9KcjjbTQ9FEo1NzXBnO9F0On4g46s75w0898gZm1opdIf7eA/VJWljpmr2Z/L2KaDk2az6pIOSP+KC9y+FpG4xZZ1komBCxF5RFJztlbpXBkf9ZPIoQXabMrugcfC3RL3ytamTkW5UelDRx5bs+SflpCt3AKiUauqxiPrCkFV9VNxoEMFzhz+mY07ZSUX9rnCnOqZUuOpI2fV1lGgl4bicAw616bpNqb+vSsZrKNaqytlCx7+HWPVKPiMxGvlCaL2MLfKzvCb3gKFScdT5jYp0QYttueULWZm6bbDO6ha/ouIwrlLlDwqgjRhGy/Jvvp1oqJOyG/6i7GRBLaLDs1iCeaceKXWv9QkHOgPou8bC25QllJjrGNsYz3jbTORWOoVn7oJLWckErawALeIB9XIPaJ14fm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd341efd-c86b-49a2-f5a2-08db7ca93493
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 16:10:37.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDYL2OysTQWyAWAwdUfMZeORrtOFvyPyTfqxqyKjI5uRmx0cXKc97lYvz0VZm1zjGeOHy+0ne7NffRRW4gKvOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5789

On Tue, Jul 04, 2023 at 06:04:36PM +0200, Jan Beulich wrote:
> On 04.07.2023 17:55, Roger Pau Monné wrote:
> > On Tue, Jul 04, 2023 at 05:42:33PM +0200, Jan Beulich wrote:
> >> On 28.06.2023 11:46, Roger Pau Monné wrote:
> >>> On Mon, May 08, 2023 at 04:46:18PM +0000, Olaf Hering wrote:
> >>>> clang complains about the signed type:
> >>>>
> >>>> implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
> >>>>
> >>>> The potential ABI change in libxenvchan is covered by the Xen version based SONAME.
> >>>>
> >>>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> >>>
> >>> Can we have this one backported to 4.17 at least?
> >>
> >> Hmm, while perhaps simple enough, in principle this wouldn't be a backporting
> >> candidate. May I ask why you consider this relevant?
> > 
> > I have to take this fix in order to build 4.17 with current FreeBSD
> > clang.  I think in the past we have backported changes in order to
> > build with newer gcc versions.
> 
> We did, and this is good enough a justification.
> 
> >> Plus is the mentioned
> >> "potential ABI change" safe to take on a stable branch? There's not going to
> >> be any SONAME change ...
> > 
> > Is there any ABI change in practice? Both fields will still have a 1bit
> > size.
> 
> But what a consumer of the interface reads out of such a field would change
> in case their compiler settings arrange for signed bitfields when signedness
> isn't explicit. We don't dictate, after all, what compiler settings to use
> with our interfaces (which generally is good, but which bites us here).

Hm, I see.  I would argue that sign doesn't matter here, as those are
intended to be booleans, so anything different than 0 would map to
`true`.  But implementation might have hard coded TRUE to -1, and the
change would then break them?

I'm failing to see that, because those implementations would still use
the old struct declarations they have been built with, and hence would
still threat it as signed?

Thanks, Roger.

