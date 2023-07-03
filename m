Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E54745E21
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 16:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558095.871919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGKCB-0004ex-WB; Mon, 03 Jul 2023 14:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558095.871919; Mon, 03 Jul 2023 14:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGKCB-0004cR-Sp; Mon, 03 Jul 2023 14:06:27 +0000
Received: by outflank-mailman (input) for mailman id 558095;
 Mon, 03 Jul 2023 14:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G/7H=CV=citrix.com=prvs=5416de508=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGKC9-0004cH-Pa
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 14:06:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9480b38-19aa-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 16:06:22 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jul 2023 10:06:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7208.namprd03.prod.outlook.com (2603:10b6:806:2ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 14:06:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 14:06:07 +0000
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
X-Inumbo-ID: c9480b38-19aa-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688393182;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8SDCemCy0Ha/MMvfjru/0aucOrQNCKVjha9IMn2BbpA=;
  b=RzacABmE9Hda+9yoJSsER7w1j/CwzqF9lKEv9LlFEBeE2VCBlRLIEyaf
   7ZBs+3glUGTnu8bb11LvC7I3m4P4EU2SV+yN3a3WmGTnqBEWKe9K7oU8z
   M5PZJ71Wk6AEswGqJjRdKqWcPPswDH+8wxh/JuPXSxmcZDOr4D05k9v1x
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 114302879
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cD5Rha5Kf08gw8gc2JcTLwxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 mcfWmmObqvfZzP8eYwnbo2yoUwH6pPVzoBhTFZt+y41Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8T5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 8NDCW8fNyK4rcGcnqOpDcJcheEnI5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxH+gANhCS+zQGvhC2EOUmTU0ITcqTkK3qOiGgHy3B8h4A
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUj0qy6+RXNhWKqr52QFwotvFyJDySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:rRbk3apYQGMCfPzQ3JhrjT8aV5oGeYIsimQD101hICG9Ffbo7f
 xG/c5rriMc7Qx7ZJhNo6HmBECrewK/yXcN2+Us1MmZLWrbURqTXeRfBOLZqlWOJ8SUzJ846U
 4PSchD4G6cNykDsS4piDPYLz70qOPozEjh7d21858mJTsGV0kvhD0JbHfjLnFL
X-Talos-CUID: 9a23:c21NsG/KgxvWMowCTPWVv1QrQeF6YCTv913zCRGpGyFCeL6wTVDFrQ==
X-Talos-MUID: 9a23:sO4QWgVZ1GO3bwjq/Gfyg247E+5C37+3BEkcrp80spWeEgUlbg==
X-IronPort-AV: E=Sophos;i="6.01,178,1684814400"; 
   d="scan'208";a="114302879"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V88kPAH84qXFaYIBwibslUnhFk+B9SYBYlZ/gvWhp9YcQS6WewnbTD7Bq5jrDXLdeAlas2rmisF9j+8n0mo1PV3EfTMgIdRM1rHXBpidn6Tdkyu+lW9Bb82735pJ0J4s/HDVd01Cj/1zUaD5tBdrEoFDERlllPjD5wcLY9RLdOoHiCEjl4RiA5F+x+oG9To1MMqvjCz6eBSz05svD4HsDiYO2BgXvvTmk/a6k7P624t59FXn6EPJuCXEMPUsHmA20T8LDMU8WR0sVgsKGrkZDWIET/gMiN3SPFmyTYne6GYfRa8iSeyxTl2sYePgRW/P752i07Cn6MY8ifWkV3SaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDQU3W5cX687L1WQosDpVw5bcXd4QsSkW2708q0Pimg=;
 b=lrpmT7H8KruKIPzL2qlyXrshbq1dpA0ZP6IIQ1+kOPOHkQIApbz6qh4RxhW9lYxhepo1TnLsaZHLQVlWuulC8SwHLUXQA/6/NeMWvw2lFAYN8on5ofNFNv/aXfRfj47VFxvWeuQEToCHXRFEnPWU/hjlzjUnTWIBx97CZplRwelaJmKNJH2y4yItVF7VRQiSy7rUiBw1LHYmAkxG58VNzuviLkUaRXNcV9VwEPdLx+cDTtn0I43lNlqXs6zTdJ+yTkDlHuDf9VmILeoiZfV2hMabduanxcaXaiPUohG2lorVPtZ1mreMkyIuf6MDG3FJV0NDzEn/WDknNjcqviN8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDQU3W5cX687L1WQosDpVw5bcXd4QsSkW2708q0Pimg=;
 b=XEaSSYtGMm0HpUjIrwagRiDPik3Q4UcLpcV9KmlEuProqltjFRyG03pOEHIsCVhIX6hZ/eZvhe/tMC5W3Cw56QE6xXOrFWm7L2njc1KilVoG5kwc040koEMiD9LZH05mf/1kgvnmc/61qYZTn62OgJpskHQp9hMGmVQXGWMjrTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Jul 2023 16:06:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] amd: disable C6 after 1000 days on Zen2
Message-ID: <ZKLVyfa_Ft_tYCm1@MacBook-Air-de-Roger.local>
References: <20230630131820.29323-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230630131820.29323-1-roger.pau@citrix.com>
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8838a4-32d9-4803-816a-08db7bcea582
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GCQ60Dct4YsxXAEvoTQUe6cBYb5ITGOCD/GCqnFjop5FLc2jbqyaypyna3T/P+EkdOC9qnuTZgU6qFIfpEUdkuibOdCHvHE/ehW34PiWK92i6yYlbGIoSZsYJahq3ZSqoTIVX8/G2RySmIPEWcID8uqeHZsQ21Fha/yB+yxfF3avE/vy2saSTT/vmROUEoF+sfQ0zqklyUNZ9q/3ZsUmg366IcJRIKE6Befhxfa0e2Tqcrh2hIUXGJ+X3GMPElr3WQ+7uW1FdhXc675nNKeVSKZ/o97w5ClL+2VYKkqfz8dx6DHFZ+mHG5xaKMLce2aa6FsVvdNrVRXi7hFnmGh3iP7Om5Y3KgiW181xsWKkNcDQ5Ogz2hkfN76Xybzc/2FJ5zZcdcTSCTNm9DOd+kz8SZQCqKf6tOk9eOtHimrP3AzVB3R/P9+2KjUDrvGCopARsMZ1XWPXCvYbqZtyEoU8Yo0GoieTVVOsLpTOOLHAK+7FeIjeXZDiHBD/G72bOdQPJZbO+7Cm9SadtBe/Cln1PaiB2orzNICMYkRrae0rk5XiLeaVBHmBtvuqCtPOPp/zqTCvmzFTKYPH7kT7pHKfFt2O24L8a2YSRgnqRzHpSP7KcuKWgwpikhLfKxGcHmTu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199021)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(2906002)(478600001)(85182001)(8936002)(8676002)(5660300002)(41300700001)(9686003)(6512007)(54906003)(86362001)(6666004)(6486002)(38100700002)(6506007)(26005)(186003)(82960400001)(83380400001)(221023011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sml2ZWRnQUJlKzBqTm8wenJDMVJ1T0R5MXNCK0VxeHRtRm5PVGViQUtNcGc1?=
 =?utf-8?B?b1o2bGFudXRCb05HUjROazk1N1N6LzIyblZ3K1FOWGNxVStqYTI0T09KY1lp?=
 =?utf-8?B?Q1RmdjY3aWIzRG1IanlzNnlQQitrSVBUM1FGUUQ4QU5OYWxHMGZlL09jMG1P?=
 =?utf-8?B?endVMlBIeGpLcFBmTGx1ejZ1dE93S24rcFNEOFhvdUZuRlUwUWdnbXlPWTZS?=
 =?utf-8?B?NjJodmhNYTI0cG1XeHVlQzhLelRtN0ZrL1Zzcmwza05jdjF4MUJZS3pVeEVw?=
 =?utf-8?B?SWNIdncrclAwUGN2TkY3S2h6V2NCeWwxS3JvR0NEZFF1Q3IrbjQ1cDNmMlpR?=
 =?utf-8?B?amZlNlJzUXhlUDVoTThxSGVvalpSN0FhS3FrZU9lVm9wYlgvMlJMaHhzY3dM?=
 =?utf-8?B?UUlJR2tkK25BbS9tU1pTRUVGeExTRGI4MVZhdzZuZ0lhNlNDdXhRWVlTTlFY?=
 =?utf-8?B?USsvaXF0c3FIeUx2dkJocnVoUVZvWWx2RTRqL3pqNzlHbWZhVVZsRE4yNzBI?=
 =?utf-8?B?K29qcjhTQWd4Y3ptWE55U2NKQlArbW0rT2RWUVdoc3hrR1VDL21jMTRnMXpu?=
 =?utf-8?B?TkQwMXBrK0kxZS9ZSU1yZjZ3Wjl0K3NGQzNwVFpNdEF6OVZTaTJCNVN4UzVw?=
 =?utf-8?B?cm5nVU5LODdyQmNLU2twU2tLaUY3OFlJclE1enozVFdoSUdlaTZNV091RzQr?=
 =?utf-8?B?d29ocWZaL2RuTlpyQ25wNTZqZlRYMnVwdGJOYUZ1RURaMFpnenBsSGZWRFpD?=
 =?utf-8?B?ZWVjbFZmS2lyRjgzQ2FhK1J4bTVEekpIUCtTOGZJTlIxR0UydldQN0NuNnZs?=
 =?utf-8?B?Q25OWm5ZYVVZZHB3VE94cVVpZ05FMlRNNmRmTkVaeXhFYlhzVU8zN2t3MjhI?=
 =?utf-8?B?bXhIQzR3R3hlQlBzbTFkZVhtSXpRbzNmNU1oMVRRbmR3MTNWZkJUbHV3bjhy?=
 =?utf-8?B?N0Q3YWpZZUhGR0F1bVh4VWVpQWRiUGdiUGlSZ2pDRW1NblFSdGJmSG1tZVpt?=
 =?utf-8?B?VlN1Nkpvdll3RCt0dGZQQU5MWGY2NXNhRTFwWXF5Z1NObTNxNWVrakw3MTVl?=
 =?utf-8?B?R0tlaC90N2ZXVFg1NFoyTFlxdStMdFNwWTJKUTRRTWFvNEs1ZDl5RGROU1Bw?=
 =?utf-8?B?ZWVPbG5ZSXd3YXUwR2lrT3Qxb3hTenhTVWp4VjNqQnpwNXlZQ3JvUTFuekQ4?=
 =?utf-8?B?ZjUrcUxoMGhZNjVnTUY1MU1TYXQzL2dhbzBwVGJzaURGc3pUMGxxekd1UlNG?=
 =?utf-8?B?eGp3S3hpdmpnZlA3dnNZOWc0Y3dBVk03K3Bsc21OWGdTMXh2WmRHekgxektl?=
 =?utf-8?B?TVZjS0FqVFY4NndqamFmWlI5ZktPSDBoZFFVRkNuL25vZVcxVlB4MEUwTk93?=
 =?utf-8?B?YnBtbTNidXRXeDBwMDhvS3ducDNwNUZtNHpUQURzT204ZnQ1aGVJUXVrQUN4?=
 =?utf-8?B?QS9JUFNoVWUwNkhHRWwrQW41NzhqOEtEK3JpaCtQVCtHNHdnVjE1cDdxN2Fh?=
 =?utf-8?B?RXU5WU5kWjNkWTZIeVl1RzgwZUJYS2VCVFNXYWFMVzBqVjZaL1JlaU10RDhu?=
 =?utf-8?B?N0RYRjRKZGlYc2lRbjFIVUN1ZkNhT1NIQVhjTGVENVFiM3lQcEJvTmVNSDA4?=
 =?utf-8?B?Vlo4MGVOaE9FeTlidDZ2M0gycTB1Nk9wWHNjRkp4ZE9tTmdLelhuR0J0MlJJ?=
 =?utf-8?B?NWViSytIcnoyMEhFczhoM2NHSXU4SUNHSzhDS3Q4RjZLYWFCcVhHOFZWODFX?=
 =?utf-8?B?STVIYW90aDMxWi9zNDgzTDM1a3Nqb3hLRkpNM1dlV2Zqb1YwM09sZ2NUNlEw?=
 =?utf-8?B?Z2Y2QWdqMGNhcFFaMHJWcnpPVkZsdVREQVNzRGxuNGk5ZkNjQWFrTkFSVkRk?=
 =?utf-8?B?VHFUb2lTclU0ZWVKL0RtbmIrT1U1OVE3MEVTU3lSb2FFd2paY01XbmVFbUhN?=
 =?utf-8?B?cDk2Y1J1N2J2OEo5aXpjWnVoa2Y2Vk1OYUtRb3FXWXl2YkFweVVIbk9vVXBm?=
 =?utf-8?B?WFoxNUwxVlNTcFFxcWRDRURrK1ZMbWxHK1VlNXlEZ3ZGcGZRODZuQWlMQ3V5?=
 =?utf-8?B?WjFHbk5BNzhnenJPamd4VXBVTkE3eHNGRzQ5TVBnTlV0LzJpVUpObjF5Rng0?=
 =?utf-8?Q?k6W562pjuzNGWXNxT6zJeZxap?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pK4eYPq9nCZfQS5DaQs71ogg+DGGDHV5CMKDGw9RNScNwxZRFayi2Bx0VA+2Dya8hKUknikQr/DaPBDVNdShdtf0AyskowehgXFF65XXLs5mFV/wI2bO2g60LPa8Zhlqt1dE2njH2lvB4GNqgmvJGJ/bzmfnz+fPw0zIyI8ii0x8iHD3ZnuW/394EOkYfJu7nZvdBekmXeFd7cMW3GKzv6rTYL8DeN2Y2tdYD1ZlXDuU6lU0/qs3DWW8g8sD/glv71UNy3gTDEX5c27NXCTzNFPGsmmg/KgAOfl96wZTtlNon8HWCPxX6qa8agIDn89IpMK586PSUlQufc+wV2HwjmSipJvMzA3PlOM+xgQ4Xsz9UDT3eFTq2bdIlTZA2n0hxax27+CXaxHFPkQLyU5DIIh1e7N7783MWxOSMcooGwtBdBPuzcLHC8OpQjfoseclBt5GQeY5f6fnAnSXiTC6CAplaNsZ8bc2/jDzsv3qLJZQNuHk4oWQAsElW6swgigsmjQC5iLEIVo9f8u67/pEwVcHgZQRhaBibwZCzssFB4fRUJ8EMTrD7X86SX9i7h01vScv3gu1dxZ6ObrYD5eNBXwVoegFk3yLxT/QDMnCUIdlg3lO1BBSZkZ+9xHgJuO67k7Yg7RipJL1nHylwjtfiLxMta0aIy1mdCTecCHB+491jbJWDdv9EzNJtj2a/CaPKeVVFYCKUsLUgqP9BugMkD/gBelVOb0IOLNE+/rloe1uv3efkk9ZOXf1ZUMEHSB36TF/dT3Rvnym4guLdUpUTzSOmmKoqKjGGwaaOozzdskV8dIB0JmJGYR9P2FlsnpVu9KjmFOjxXkGReolK6OZdzO4+IpEalCSkAXUHEzGPfk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8838a4-32d9-4803-816a-08db7bcea582
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 14:06:07.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqFPICpDOA5/TVYTg2eq7hR6qyPtyCWdEFBKegZ9Hmbd2I+XBxQqaOHfHvRz5GA+Ii8fpc8pOGVkekQVhOcOQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7208

On Fri, Jun 30, 2023 at 03:18:20PM +0200, Roger Pau Monne wrote:
> As specified on Errata 1474:
> 
> "A core will fail to exit CC6 after about 1044 days after the last
> system reset. The time of failure may vary depending on the spread
> spectrum and REFCLK frequency."
> 
> Detect when running on AMD Zen2 (family 17h models 30-3fh, 60-6fh or
> 70-7fh) and setup a timer to prevent entering C6 after 1000 days of
> uptime.  Take into account the TSC value at boot in order to account
> for any time elapsed before Xen has been booted.  Worst case we end
> up disabling C6 before strictly necessary, but that would still be
> safe, and it's better than not taking the TSC value into account and
> hanging.
> 
> Disable C6 by updating the MSR listed in the revision guide, this
> avoids applying workarounds in the CPU idle drivers, as the processor
> won't be allowed to enter C6 by the hardware itself.
> 
> Print a message once C6 is disabled in order to let the user know.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The current Revision Guide for Fam17h model 60-6Fh (Lucienne and
> Renoir) hasn't been updated to reflect the MSR workaround, but the PPR
> for those models lists the MSR and the bits as having the expected
> meaning, so I assume it's safe to apply the same workaround there.
> 
> For all accounts this seems to affect all Zen2 models, and hence the
> workaround should be the same.  Might also affect Hygon, albeit I
> think Hygon is strictly limited to Zen1.
> ---
> Changes since v1:
>  - Apply the workaround listed by AMD: toggle some MSR bits.
>  - Do not apply the workaround if virtualized.
>  - Check for STIBP feature instead of listing specific models.
>  - Implement the DAYS macro based on SECONDS.
> ---
>  xen/arch/x86/cpu/amd.c               | 70 ++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/msr-index.h |  5 ++
>  xen/include/xen/time.h               |  1 +
>  3 files changed, 76 insertions(+)
> 
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 0eaef82e5145..bdf45f8387e8 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -51,6 +51,8 @@ bool __read_mostly amd_acpi_c1e_quirk;
>  bool __ro_after_init amd_legacy_ssbd;
>  bool __initdata amd_virt_spec_ctrl;
>  
> +static bool __read_mostly c6_disabled;
> +
>  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
>  				 unsigned int *hi)
>  {
> @@ -905,6 +907,31 @@ void __init detect_zen2_null_seg_behaviour(void)
>  
>  }
>  
> +static void cf_check disable_c6(void *arg)
> +{
> +	uint64_t val;
> +
> +	if (!c6_disabled) {
> +		printk(XENLOG_WARNING
> +    "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
> +		c6_disabled = true;
> +		smp_call_function(disable_c6, NULL, 0);

I've realized this is racy with CPU hotplug, so I will need to inhibit
CPU hotplug around the call to smp_call_function() in order to prevent
CPUs being hotplugged and not seeing c6_disabled while set and also
not being set in cpu_online_map when the call to smp_call_function
happens.

Thanks, Roger.

