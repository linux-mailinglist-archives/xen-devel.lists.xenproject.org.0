Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB96E510F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 21:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522307.811559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poUd0-00047u-QW; Mon, 17 Apr 2023 19:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522307.811559; Mon, 17 Apr 2023 19:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poUd0-00044Y-Mt; Mon, 17 Apr 2023 19:35:06 +0000
Received: by outflank-mailman (input) for mailman id 522307;
 Mon, 17 Apr 2023 19:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poUcz-00044S-Ee
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 19:35:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2912397-dd56-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 21:35:04 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 15:34:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5464.namprd03.prod.outlook.com (2603:10b6:5:2cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 19:34:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 19:34:51 +0000
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
X-Inumbo-ID: f2912397-dd56-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681760104;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WDzioplaXFGWPDpYdQ9L6MkAr86TpdPZn/E+7Hc8eFo=;
  b=fsTpYUtuA4Ch1Fopi9TXuDP8r/qbjIplckZ4E5xz5ceFTbZi02OjLVS/
   L4UbtZLCpMT9fROkYhk7rvHoPNgf+7mUi8bhD2GHwaWLaqlc8UyA3un1U
   sF8JtjK3L9GudVvm+EoQGwhv5TRh7trK9/lvVBkIW7vShtYO5ySUKKk/v
   4=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 108298942
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gx2zmqqIKXbSpUXj/F6IUQY7l0xeBmLdZBIvgKrLsJaIsI4StFCzt
 garIBmGMqnbZ2HyKN53bti28EkAvMPVxtYyGgNqqy4wESwboJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCziZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGwSNE/EnfPt+oqQWsh2n+UfJ/nEJZxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrq4w0Q3CmjZ75Bs+CGv8hqeSoHaCRogFd
 Vwd8BEO9Ixj+xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 ViPhdrlQyNutL69TmiU/bOZ6zi1PEA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 w1mtwA7jrQXyMIOiaOy+Amehyr2/8eVCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:CEGJwKlvSAWw/dCoe1ZbmrP2GdjpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:mgFrV2z8XATxxsX2jkf9BgVIBZp6NWfMl03oCF+ZE39IdLalZkaPrfY=
X-Talos-MUID: 9a23:ZoXIOAjnSNJLOpEPBqj+TMMpafcvxPqFIngxjM9c5dmNPxdQYhPMg2Hi
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="108298942"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSjKuuDoEC1xU2ah714KK/PB30IQAsHAZ9zBgwJpdU+wcoXr9G3misGAJNKRlsYZLnuwCXolzRbUZc8iNW6LX1pnFDXLJANLlR4qrTlRsTuqWKJftnSUO+K3e2QsU2Vpj+Wq0CGiVSjCILLFFrai7MhFWQmcXtLMd9/BZNkEdVYkHlf7dg0vguLSpD5BqMJiKN5AoA+HDj1zjqU+MJ8ZxXQAh5jj/9q9rWV7a/HamWHu8ZYzRGWDZCcRxOScZk+boPr0sn/XlRyrSH1RAToPa2g6BlXzJ1HD11tIdnPCzNdFyheXuJaD2CIk0VTSUWe1n5eWZOZuq6wTtM0rmy2MuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwi354LYQz9HN1BxA3lYJIr3XX6+lUTpBdgKKHkHq7A=;
 b=FETas9sxy7qZQORcy/bRZNRziOJWDe/YE8jQRS/sjIetDoT2+tKeFy+a1/djpRSyynoe1SX/6koe1y2kC/ixJRjPLf43jnZzIhdMthexFrARogU+LjO0sk8tuK04Q6xo6TFCcD8veQM5HI/eli+Nx1OxCauF0aypMPu+teVDSOB0SokPSC+X4u89P8ARqNbnbxle17rklAbUZVKhXgEX0HIaj9B8wH21e0tKA+XdEYvhJ319OhAb5Dpher55id/HlLzxXs5v+uNI+opAnAwLC3Qvx6MWsKZqHbfYhFI50NEJ77zKrdh0XfRFXWRMBYYpH57+yZUU3JiY+a/kd81UdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwi354LYQz9HN1BxA3lYJIr3XX6+lUTpBdgKKHkHq7A=;
 b=lPH7NHlAU48YWSyMel/4KTZ2NDI50oBz3foJNyYmjN89f82Z1UGxyn2MGNwko2MRlBVAZ+nTsdeHI1tDZDlSb9ubcf3ihNsfJxXmBTIayTkm2wQnbUb8nAxrF4XbeZzArv5ABXTexAvsPiw/BVqYbUtE+7m35xUWQhkdvkydfQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2ebda1f3-23fb-3f06-c4ca-1ac508c82b40@citrix.com>
Date: Mon, 17 Apr 2023 20:34:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
 <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
 <22179eac-4fc9-1521-2a83-2313b8c44a2d@citrix.com>
 <3ea38da5-70a9-6887-5384-fe002d8568c4@suse.com>
In-Reply-To: <3ea38da5-70a9-6887-5384-fe002d8568c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0538.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: fbaa915e-a1d2-4204-c52a-08db3f7acfc9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z6jpqTzjH6wmIQ9PqAssZx8rTPSBSHDiyMzRklZ6pYOiH1Td4Sm17V60UizNdEHsiJ642b48G/DKJcahkuwPxAHed9ZM19H1+jZ/sZc7IOBcv9TRlFQ1lxMOYJctMovqE5IgjMn7gUpd85u0QOO4P+WiSyy36PyGEd84vZOYA/uPOYKrY+1LKw1sXLRe4x3SeJAW2nKmi8uPHiqKGabeHNZW0/d6acnPGsTDRm77n0I90zYMOlNhett8v6lxHQTjKrzoB/UNOQbUmmcVY7ZtZIrGMLaGlqWJEnqWwJc2U0G1X5HhsjgWADxXqSpYqTVdMCn3vtLRBP5eKgsb+uNJDYEWAK1Vn6g9yLFsy71RGStbeIps+EMLkLng/ixVXyT4q9RQ2/qW3CbIMnCtvi9vU0JdpyhCYtRyqBrEimRAyYEi53glgFioeIPVASaFHJLbn+8tc8nbR1PJsh8Rn40PVWUdU4koLIycIAmYrPpSJ09dAV7hTmM+fLORpQYWaVNEBldL+vd6aLcjJuP2bmk4op0lZsAWZRFjECMqZ60bew4nQb1MRYZ3sJXvT6RxPJ6VR3E0BhROYvxsTM4boNA4ftAosjpVvd8QODmeRys7J6NhrlauahwEVjo24Yt29cjjhyndXjSIHUGIK+/1YrSHGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199021)(38100700002)(8676002)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(6512007)(6506007)(53546011)(66476007)(66946007)(26005)(41300700001)(316002)(83380400001)(82960400001)(6916009)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHMvUE5tU3grMEZkSVVkakJtNGxheEVJYWlZQ3BOTlowOGxnUzVqWEk2RFdJ?=
 =?utf-8?B?bnlYWjBFVUNOVFV1WDdKMEF3ZFh0dzc1cUh3V01adk9DR3ltODF4WW9yNkJ2?=
 =?utf-8?B?ZUt3QnFLQ1ZzeTd0ajZvQWJFNFZ5OThUeldJcURZZ0tWcDkzWUFmd2VzMDJo?=
 =?utf-8?B?djk5M3Z0dStGUjNtU1E3eUM0eXdZRXloNDI0VnJobk9zNnV3TFVhMHB3eURN?=
 =?utf-8?B?QkNrbW51ZlNBUkhXNktodU1yYW54U1lIanF2TEtoUzNQWmdEYnQ3M1ErdjVk?=
 =?utf-8?B?T0RnZ2ZRSkVJVmlJT25VTmVCUG9tUHJhVWgyTlB6c3JRWDhJM2dQSzFLS0pl?=
 =?utf-8?B?V1U3aHFYemFQMStzdWRCQ3Rqc1YvOVpoaHZBdjdyLzVLTGQzeElVOXpHbno5?=
 =?utf-8?B?bW1saGZvVWZDY0dnYXkwLzhMNjdCSDZNSHF6a254L2x5ak8zeFhEeVpXaU1j?=
 =?utf-8?B?VGcxeWo2VVdmMjg0cDd6dmtaSzBha1M4TTY0RUc2Lyt5QlkxZGlKVHVXRDZM?=
 =?utf-8?B?QVRkdVBPVVdGSkp3ZUsyQVQ0S0IxOFJIYy9uRzcxSERBalMvZDBEVlh2aTc3?=
 =?utf-8?B?TEJSaHJjbzRReW5CM1N0VGM0TDI1Nnp3c0g1OG0wdURUeEZTWllpTmdyYXR1?=
 =?utf-8?B?ZnV3RVNiaDg5UEdEQVNMcm9jQWI2dVVYOXluSm1xRFN2NUtLWit5T05Lcm1m?=
 =?utf-8?B?THBqMC80TTgwM3N2S1h3U0VBN2FBMnJMaDduNE5KalArTnVFbjR0bkdobmh3?=
 =?utf-8?B?RlhxQnQ5Q0ZhbEc5ZUhsdW5PandYbDA2WVpMMEVCM05UR0wvQ0w0UzUxM0o1?=
 =?utf-8?B?c0s2eWM1aVA2M1lBako3NEphK1RKeXZwcGEzM1QzNmRoNWs2VGRvbGd6dWdX?=
 =?utf-8?B?QUxRQWRQdTZZd08vMXR2eTVPVjBnYmdnNitWeTQzNndZV3J6TWJKU0M5cFg5?=
 =?utf-8?B?N2o3U0RLd2dmQlJLdHhsQjRzaFdCMEtYNVlkRnE3TXA2aVV1MjhRZUlsc0xQ?=
 =?utf-8?B?clBNN1dqeEZDdHZ0cGRSOTBCOUdRQ2MvUHJPQkxMZ3ZqQjEvN3ljTzhqdStq?=
 =?utf-8?B?bTkvL1JRRUFheWhHQTFsOHk3WDlGR1E2Sk5vajJ5QkM4Ym8zVnhObmFQaFdS?=
 =?utf-8?B?N1lyWlBEZlpzVFBYbk15QXlSY21ZWWxJbFYrSXJYWjRzWDN1aGxVaUFLNm1q?=
 =?utf-8?B?ZW82Qm9wY1BTSFRiMm10bU03NzZyVXl0OWg2SVJkS3BiRk1Ta0RubnMySjRp?=
 =?utf-8?B?cnE0ZmkzTDNESnR6OTkyZGpiNDlKUEs0M0ZzRURUcVVrdDl2WVlkZGFFSmpx?=
 =?utf-8?B?S2xhQUtSY0ZDK1BEUngwa2FoMU1KT1owYzFCUzU0d3FYUTlFU0w4NmdVWlp6?=
 =?utf-8?B?WC9xenJBYkcwc2QvNTkydForK2V0M1N3SllWbnduZzZRaFo2WkdrMzJsUWJo?=
 =?utf-8?B?MjQzdUd4Z1JQWUlLYzdtdGhSWHRLTFMwbHdlZE1IZXZFeW9qV2VHZjY3Uy8x?=
 =?utf-8?B?N0F0L1FJQStmVWtvcUVqb3NTa1JCMWRsUzRZbkpPZitza2NVYVRIMGU4K0hW?=
 =?utf-8?B?dWR3aUE4bXdYVStlcVF6anNnT3hOZmRTZDNUN0w0a2JqTG9ZQW5vdUdFWno0?=
 =?utf-8?B?N1VSVDN3dmJUREQ3Z0RiY3ZBUW5WdVppS0NKTTNmL2ZRay9JNlU0VlZ4Rm5P?=
 =?utf-8?B?K0d4YUc5a0RzK3poNDFma3FBbVMzc0hPcGZPd3IzUURSWkhKR0VYNllXQ3Bh?=
 =?utf-8?B?K3pWbTk1eXJLMVhqMjFaNkVubk1FV21taFJFZ21LdGE1TDVlT09NVWhLY1hz?=
 =?utf-8?B?d29qYktIWXhhN0ljZFNWWGNjMktqdjB4MmFmRWxJKzY1VmVwWktlM09hMWov?=
 =?utf-8?B?Qk8xRFI1QkM4dkJXQTRtam5yc2VUaXNpaktIeDhVV0M3cWo5Zjl2cmw5SFhX?=
 =?utf-8?B?SXBGaVdabWZCVnpCL2gvYUhNQWlzcFVuY1lOeGRZSHA0Z2tzblV4S3FDZTBh?=
 =?utf-8?B?MFJtRzRXdTBWSkRjRVF5NEppcDV2ZklSd0hERVM4SzNCRmQrRUNkbUluazFF?=
 =?utf-8?B?THI5amVPclhYdExIUm03VXhuVlJFblB1TWFCdjhGemJ2OVFSUXdtY1MvYUVZ?=
 =?utf-8?B?VUIyWkdrd09lVmRObjNFVk5iSVZtTlMxekt4YmthY2xlOUVyU1J6UDRSTFFD?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	65IOBTonZfE3SIQQWQjIQmPN3toy0QbYvDeORPOKzlgcyOuJJ55iVQuJNSWFfTEfhqV0jXVH5gfLbWe7O/rVBbiL47gM9fXEfQo9rtkAZd3XM7v0aGyyG8q4MVBqHtfIA8YHhHkNU9S6uPM6bdmcDyid1KfvHn+FoW+GDvb/jyPjuylt5dC09RUTGD4RGDD9B+ltA2bhdGdBMMyl+zc/zCpsqsOtNWL+S+P7TKgzKtUUfRvv+Mpj994EU4ikNRoGudrUnCQ0VnIcaRNBcTrEtkjwWSgkSmOTbOgv5lPQMbke+xcTubbGMHeFThLJxxSVXmnkGDZI1NCQcJSRSDC6vdrHeeTGBJVC3ItfaDjVD+qqTeKrquM3CVGPVEhHmpeLaoTUtllQnIgfY9uB5mbAwx+inF8+Se6SZ87k2lS7pe0m8YnrZTTywa7qvGW+vTvqChwZ36PD+sT5Ui4RO5jvc/Z6Fy+i6tgZmoB1l07XdK/JPwcHY3gpgoWilXOC8SNBZNJ9h/QVe3OKzkye3vIxAkvpskSpkRG/XFJoFGZXV1D7BU5QDgz19sqKGweHUX5Fc8zSC6FJ4hfcUD0+uopxuxI5dyCzhzmmkKDU5AGDPCihztro6zCA8XZKnqr01wnk+O2RrzRsYBZm5U4UkJ4d6JhX28blTaQLLE2gQzMXTL0Jjc0ncDLT8gDY3Oj7XkgzF5UR0uJiA1cHhLBTcB+6nda5ALyNvTnawvibNqlHamjcS2Ufegq/MMG36YdmDjq+A6m3IC9ej+BqEIga1BYGQN7AwJB9wyfY35y+/dxIzCG6fG+nT9kQ63MoPYo5ua+XExem+187m5wfCcybbI27PN8OS8Yy7b1FroBkRfCvjQI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaa915e-a1d2-4204-c52a-08db3f7acfc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 19:34:51.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXLPc7eN8mbJ+ug33o308TZ72JywYIPUTePwKKiqf4MS+GtSC5yKN1LTlKWFwJRjP6KzPToEoIzVfl/OsRDEwPJC5Fa/vlRsV/EMUm968bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5464

On 17/04/2023 3:51 pm, Jan Beulich wrote:
> On 17.04.2023 16:41, Andrew Cooper wrote:
>> On 17/04/2023 2:59 pm, Jan Beulich wrote:
>>> On 17.04.2023 15:52, Andrew Cooper wrote:
>>>> @@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>>>  }
>>>>  
>>>> +/*
>>>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>>>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>>>> + * responsibility of the caller, and *MUST* not be introduced here.
>>>> + *
>>>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>>>> + * Must be called with present flags, and over present mappings.
>>>> + * Must be called on leaf page boundaries.
>>> This last sentence, while wording-wise correct, could do with making more
>>> explicit that it is the caller's responsibility to know whether large page
>>> mappings are in use, due to ...
>> The meaning here is really "this doesn't shatter superpages", and this
>> was the most concise I could come up with.
>>
>> Would ", i.e. won't shatter 2M pages." as a clarification work?
> Yes, that would definitely help. Nevertheless I was more after something
> like "..., i.e. for 2M mappings on 2M boundaries." Which, thinking about
> it, points out that while you have a respective check for the start
> address, the full 2M page would be changed even if the end address wasn't
> 2M aligned (but fell in the middle of a 2M page).

There's no nice way to check for because a range that starts on a 4k
non-2M boundary can legitimately end on a 2M boundary at 4k granularity.

How about ", i.e. s and e must not be in the middle of a superpage." then?

~Andrew

