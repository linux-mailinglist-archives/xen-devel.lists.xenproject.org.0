Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A3B7CAAB4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617627.960398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO9z-00037O-9G; Mon, 16 Oct 2023 14:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617627.960398; Mon, 16 Oct 2023 14:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO9z-00035J-6H; Mon, 16 Oct 2023 14:01:31 +0000
Received: by outflank-mailman (input) for mailman id 617627;
 Mon, 16 Oct 2023 14:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsO9x-0002aw-Cg
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:01:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e27b62a-6c2c-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:01:26 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 10:01:13 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN8PR03MB5074.namprd03.prod.outlook.com (2603:10b6:408:78::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 14:01:09 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 14:01:09 +0000
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
X-Inumbo-ID: 7e27b62a-6c2c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697464885;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=f6K9QCjSnWHO33Tkl1r+WMQVXig3mP6s9RuDI8R/oY0=;
  b=KUJZvJERzWizE5oZ8gM5mg5ZmtY0D2+TY86OGgqT8zPB2fJkyz5/5RDK
   DOL9QKilL+B864/HSnZTHuriw4DC4/LC6XkPxbmJJUTqkYa7TeQOLu62M
   dynjRNSbFGoG3D9q+DLdnS28DFVxK2lUBCEqAbkaEUaYIBBIkn6YztzV0
   E=;
X-CSE-ConnectionGUID: 9HG31xPkQwGejmztaHJ7gA==
X-CSE-MsgGUID: cdbqpi+KTyehOn85a/JTyg==
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 125577049
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:6jFsMqA8LVzNjxVW/67iw5YqxClBgxIJ4kV8jS/XYbTApDsi0mQCy
 DMdCj2PO/bZYGP1eNF+PYzioxwOvMDWz4BrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtB4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq8ZYWjhez
 f8hNx8AbBWRm+uW4u20Y7w57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC/x2bCXwXKTtIQ6H7Gy7+Zrw36v12ETLxtGCFL8g8WohRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4M+A88hDL9aPS7C6QHG1CRTlEAPQts8ozWDory
 k7PmtrvDDNiqpWFRHSF7LCWoDiufy8PIgcqZzIATAYDy8nupsc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/7q/1UDKhXSrvJehZh444EDbU3yo6it9ZZW5fMq45F7D9/FCIY2FCF6bs
 xA5d9O26ekPCdSBkXKLSeBURrWxva/bYXvbnEJlGIQn+3K14Xm/cItM4TZ4YkB0LsIDfjyva
 0jW0e9M2KJu0LKRRfcfS+qM5w4ClvSI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:/Z2lGqgE5CyWhKZOL28h3wBRwnBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHjJYVMqMk3I9uruBEDtex3hHNtOkOos1NSZLW3bUQmTTL2KhLGKq1Hd8m/Fh4xgPM
 9bGJSWY+eAaGSS4/ya3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: 9a23:Twaub200HsVBsFvJAob1LbxfS+AKKSTN9HTpPGC1C2N7VLS1awCf0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A/TKJLQ+a+FPIPAstfb5SrZeQf8xk6b22CQMurYQ?=
 =?us-ascii?q?Lu+6CZXF5fBWhnTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="125577049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzeOWSCFyFVg8vVJU3lLRqOWFpC9AaB1YTbnM5lATjBOwpEs7o8nUAj1bIuKj0AYrBBv2UlFsenETLuH9mjluUKeo4ra7mP89pouTZRo0cfhxuGJl6E2BoLUS7pYqxMBpk9LjhU/qBqfgQizEfFhC5rl/baFwHdefUZ4vbA856pEkO882FFzp3GiIYtsBFR5szL6Kb5A7mzYrKwEES3n9Eug63tTa3Mf5HwicsBfozMc1BvCt3814REgjWyNl9Vt8Gv+9/nZ9hQcXX4KaZRklvgWkWjZi5FpmvGJyhJpelzCMB7GBtpN5prw7uW3HYNy5CxSfJk9Pe2hRXP86TnOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+CVXwtRqiCPO4MyecTKnwC418XSZbeKsyN2GfsgXRA=;
 b=G8WLdrd8PQ/neLnXzEXqtQOByAO7hvuGt+EVD60o/bGuAoTX4y3DK84ctlM/9f6MdJKuHoD4T7fFHTUPZxAsJXf8XwxDddkBtcMm4EWciHBwWgAN7X8ERx2Opj4EzoKr7/vOk8eU2gStlETvW8R1ZK5jQJtlHflww65PAx6Q5kVAj9ib3joGaiVbZaMYv+uXzS36nJKA6xapXzVAMaURx0jTjaGCn27hs3aTjd7B407rV4UxBiCdY1XLQyfd9ZPXs1ZWXgzTfjNigclBbuJZtWPOkwT9ZVpWwlTMWixyjvY4Q81xp+zQZYVYPbCf3RtLzBDY5W3eKqln1v4xxNi3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+CVXwtRqiCPO4MyecTKnwC418XSZbeKsyN2GfsgXRA=;
 b=QTdvXrTI9XKl1MLFftvsy6Q3jEIpZt3PLFetiz0gPLslOGkOujt6VneKMqY/vxnh1xn0F2ZuQW0zQL0QeT0WT8QO0a2lhmSMWCiqr29yogkMx8CMfHylV7j9LcCxmqss3lcq4H0LSyhUoQoahIUG6siaekRu3j4JrTevEi/b6qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 16:01:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Message-ID: <ZS1CIFA1FoeGHONZ@macbook>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com>
 <ZS0z89xtFzkmK8_d@macbook>
 <2cd47d7f-00de-3409-c21c-561c92a5c42c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cd47d7f-00de-3409-c21c-561c92a5c42c@suse.com>
X-ClientProxiedBy: LO4P123CA0666.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::17) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN8PR03MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 9241b497-a349-495f-0a7c-08dbce505921
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j0PQDjRuFJ3d0Azt1cKJxg+kGZjIlUMk1n/c+ezyMhj6OHdTNxTRFB60B7sJy+z6s5Z8quHNNNyOBTUn+7xLrqclwzenJPovr5nMo/5cPZbMN81E6QqgVNDofBJj99hdppm1SLZ5MmgcC5h7iZdQZVlPhk+vakeRrFG99Tk1ncfMrsqNLVgLkWyjoJ8KfA2Y5QPGF54A98BNt1Qz3Cda2gRq6e/zDLMB9/Mqu9maLJjUUQKswaPVsis8b3NpRzBfli76DQhwrut+8uydknPb8gvSmhfSPkRoPTxGaan/04VaaM+6yPtLgG0fAUgbLZrdLhuFitC9Ugxi9LEYwIph2bo64dk5MR4XsmXR8d9mNGp38SF+bJp309Jwr3XEb2+xN2b1to7ioBaraCJZkokMpA1GPeIIPppmBr85qRvkPYAYn6uTVqNCpzQdiPrSt+W5aWwuoyboZ/Gt+ZyOe9b8sy0rUBKIE2vML4JMwwj0ZKTLy4Nm1awYvHaVuM9o6LNCp2lTKAl6BbUXWX65P4otRPHgEbpsAyY1FG4CoKO2HiCvmRCInS/KfpXNsIG1B2+u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6916009)(6486002)(66946007)(66556008)(54906003)(6666004)(66476007)(86362001)(82960400001)(38100700002)(6512007)(316002)(9686003)(6506007)(26005)(53546011)(85182001)(41300700001)(8676002)(4326008)(33716001)(5660300002)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWw1dzRHU2pyc0dTeDhTZ21SOFFQQ0pMT2wrblV1V05sbUFZeUl0VjZ3eXpr?=
 =?utf-8?B?YmxVOStVd09Xc2VKckxLU3J2N1dodDE3dkRvUUsxSUlrQndDQytuaTdyTWY2?=
 =?utf-8?B?WmpEajlDQyt5Q3RleHB6L0lKQlBsYm1GajhkYnhBSk1FbllOVWoxdGswMU9l?=
 =?utf-8?B?TSt2bTlHV1lSekpzR3Y3YUpFYkdnbHA2YzloSU5hMldHYTl4ZWpnNjljaTV3?=
 =?utf-8?B?WFFNQldtV3ZiOVRoRnhmUHBEcVpxT3BtVDRFRzRTOEJWTWh4bGlpUDlvc3Jz?=
 =?utf-8?B?UmxPWktZd3BKMWRTaUk4VmV3eXZBZks4ZzgvQTZFRmxHVlBON3FVNGNycnFF?=
 =?utf-8?B?R1Zha2VrYVhlMVNLVitoWStZVmVLNGVGNTFqMk9ITW4ybm85VGtBeFVRTGJv?=
 =?utf-8?B?OTZXWHRqMk9FYVN5K3ZyQ2JWSDhPQ2lQWS9nNGlhUCtXcUpvRDRXWU8yelpq?=
 =?utf-8?B?bjNGQ2JVeUJ2dnBXL3JjTjd5SVljdjJMNTF6ZUVBdVFjcDVLYXN2WGtsS0c5?=
 =?utf-8?B?NzM2UkszTGsvZisyUVJ0eGpRR3YvU3BQcGR2UU9HQ1RhcnRjbjAvK0xCVzho?=
 =?utf-8?B?T3Z4RnRrMElkNXgra0ljZzNXZG1jWmRLU2tZUzJoRzZGcGJLZW1nMTA4ejdx?=
 =?utf-8?B?b2tIVy9KaWpHb1M1TG9KY2toRWxrbGtpSERUSlgxRFhDYXZZWWlYNkl0Y3Zs?=
 =?utf-8?B?dlMyUmxPQitIckllNXVHeWh1czRMZk5KWnpjVTVNV2RpMnJPdWRySHJZTVpP?=
 =?utf-8?B?Njc1ZW9Od3RUVlBpWG43a0sxaVNzRFNoYUlBVFhOKzVDREcrTmhWaHQ4WGpS?=
 =?utf-8?B?ZG5IRzcwYlk1WjJ4aHcwOGxhQTBTYlJQQjdmeExPQzQ2eUtBTERyK2d1Qmd5?=
 =?utf-8?B?cnhGS0pXNTVVdWxWS000Rk4vbjU3YjdmcG1GY2lFU21LTVVkVkwvUkJ6RWJO?=
 =?utf-8?B?OEw4NzZ5L1A1U1BNSmNoYlRhRUlvKzlZbkprUjBsWFVxemZETUV0SmUveENl?=
 =?utf-8?B?Mi8zeXVwMUFIVGRjSWkyaVB2WWl2WG40VHlsNXdMU1BGZm1iZFdQeDhGcUsy?=
 =?utf-8?B?eDhpY0NxVElIRWtxME1LdEtDeStuR1JXQ3ZBbzRkTEhhN3BnTko4SzZINFNs?=
 =?utf-8?B?T2FwNC91dzVvRVNzY2ZYVWllSnNmUUNCTmthMnFDdHZtckZRc1k4WFJJQmM4?=
 =?utf-8?B?cjZNQzlNZWs0OEcvWm9GdXBGbGJpT3VxQlpMVXN0eS9XQzgrTi9QNzloUFJu?=
 =?utf-8?B?SnZCR3IreXZQY2thTytCTExHOVJJd3BzQ1d0TFAyaUQ1a2pGanJlYmd6dzJZ?=
 =?utf-8?B?NnBxcTFnM0pLcVpLSXB4cDh5KzVIT3lKTWZtdVJTMVlJQ2JadG9IVkNJbjZJ?=
 =?utf-8?B?MCtyZ1hhQ2tkdWNROVNoWFlTU0h5T1IycFRMbHpULzJSV0p0b1NkWmh3RThr?=
 =?utf-8?B?cjRPcU9Ta24vWlJuOUlhS3FPaHRFNU1FelEwbTIyTUpJYllDaStnREx6RlJD?=
 =?utf-8?B?NlR2em5RU01uRnpuWDFIbTRYV1FVYnVxU2loWUN6aE10OUgwSExWdkF4dGNE?=
 =?utf-8?B?M3Exdno4aFAyN0pMTmNvTkhzOGsrS1gwU1RWbTQ3ei9KMkR1TVpXMHZFKzUr?=
 =?utf-8?B?RTg0Z1BQNTJJK0RjRm1WNUtkTkZmeVp4cXpBQU5tWGN6UU5ZME52R0pXVmxo?=
 =?utf-8?B?Z3psRHVCZ0RmZ2djODJueGdrU1dSNURSTzVoRXpndU04aHNnRjRhYitMUFdS?=
 =?utf-8?B?UjZOaVdOMzVIU1FCeXJDamJHb05XRHZJQmhBUVNLTDNmbGdMS2pWMHNLWFNO?=
 =?utf-8?B?Mno0RU9zY2p4T0ZseGVaYVBwbFdxZmRUU3hFMWEwaGFNUlY0TTRjOWNyUmRR?=
 =?utf-8?B?aCtLL2c3b2ZGUzZRdEtYZ2xVTHI1Q2crMm56NFdTMnpwdmxUZWZ4bnVlWGxq?=
 =?utf-8?B?bnZTYzQzSmp2bTVTcmFKSzRuTnBoMGJTa3dCWGpBV2ZZSmZnaTVnMUg2NGtk?=
 =?utf-8?B?VnJ4R0YzL09LSHRtMSs5U3JGczlpSHRtOWozMlBzTHNMZDg3VEo0ZTcrc0Z0?=
 =?utf-8?B?VVYwejl0ZnN5WkhWc0h6L1ZqRVFyNTBEZk5PVGdaMmZ1SHE4TldSSzZ0THJB?=
 =?utf-8?Q?x3JzNE4v4jHmZmb19FgaVlpqh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ex6xos1koE/7T9Ua5nmNMKLIcjJDw2mTiAED/jDf+LVGsH9auw7ECjzK656RpaRCUumcpUDLfzxTlCGr40qihMtjYHRi2DWD/91z0PD5zqjfPvTyX5vcsP2xaESBEcjTJAoHnmU8VoRuFLHXlLrjIeSKLlrZsrj5B5JbsQtONX63DPfy4rrlAOBE1dkKpluGOLe1uwcOBpg9ZDHbVbKAJaG+ooz7JwL6Ei5+6SSKRCedbLzyjVV2qWBwZkmIWptlRab4WuTiji2GR1e28lN1ltTIZhYNjFoyAQ6ipFdwSxYjNRQhWYMZVvqjnvK1sDVKRXaVPKgSZ0z12lYAdroI+7puN3r5+U2ZqOtU1Md2OgMj/S1JzyML7/MfdsM0ZI3LqOv2eHo0ocLzmBqdXFk7LffVT0wD776MQHl5AnlgxyNre5aAnSrCgXw8Wk+RluC0D9NQUwbF5Y8WX/Lc5m/HqLnsCL9ivgFqIauNLQFjZ3SMTcncZqmbrikar4YOjqFu51nK48JEcZ0dEuA9gNp36RSwdfqxDwb+29fsvwx7YQVd50X5jRlhAFwK/PmebmuAGUABc1e8Eat/b8sr1GzUXDFzGhSRpToOpBAq5P1iVZ0wFPZcATC8+x+xT1yhfWHXI8xMdutNWHqchG8boqjfPaUycUosrktAzrmBGAzVkFHEd2vcUBOZZYOR1IStUhApqzu6Igo1aHjTU6aUjKucS/VU+DZew3Q/PnLUvs7wuYHXsxpzeoDrrteZ3bOVI2wJ/HRrE07patZZvt2IGlKdXaZlgbr7kiRvx6Ja3uJQH8sUca+NHxojcNZT8lasrvmf1diEoYT2D62Sfkubstn23JaaWQ7hVMpXBFhax9VEtb4LmIBfCX3rBwoduweLM3H6sHneAUVDmlZc0JESRsyeSjWcZr4jTGz5mOAsFBWvUog=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9241b497-a349-495f-0a7c-08dbce505921
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:01:09.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM3mO+nMjI/Vnc7Mi2tz93ohf2lWAvZsgddAb9Z4bivceHW0dbhuqzYcIhnOpDclDa3mV/UP2Qyf2nZJtcGB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5074

On Mon, Oct 16, 2023 at 03:58:22PM +0200, Jan Beulich wrote:
> On 16.10.2023 15:00, Roger Pau Monné wrote:
> > On Mon, Oct 16, 2023 at 02:35:44PM +0200, Jan Beulich wrote:
> >> On 06.10.2023 15:00, Roger Pau Monne wrote:
> >>> --- a/xen/common/domain.c
> >>> +++ b/xen/common/domain.c
> >>> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>      {
> >>>          struct vcpu_register_runstate_memory_area area;
> >>>  
> >>> +        rc = -ENOSYS;
> >>> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> >>> +            break;
> >>> +
> >>>          rc = -EFAULT;
> >>>          if ( copy_from_guest(&area.addr.p, arg, 1) )
> >>>              break;
> >>
> >> ENOSYS is not correct here. EPERM, EACCES, or EOPNOTSUPP would all be more
> >> correct.
> > 
> > I don't think so, common_vcpu_op() default case does return -ENOSYS,
> > and the point of this path is to mimic the behavior of an hypervisor
> > that doesn't have the hypercalls implemented, hence -ENOSYS is the
> > correct behavior.
> 
> Besides that other ENOSYS being wrong too, I question such "mimic-ing".
> Imo error codes should be the best representation of the real reason,
> not be arbitrarily "made up".

The point is for the guest to not take any action that it won't take
on an hypervisor that doesn't have the hypercalls implemented, and the
only way to be sure about that is to return the same exact error code.

Thanks, Roger.

