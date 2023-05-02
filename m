Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0626F4006
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528392.821467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmDj-0000W4-66; Tue, 02 May 2023 09:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528392.821467; Tue, 02 May 2023 09:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmDj-0000Tg-3O; Tue, 02 May 2023 09:22:51 +0000
Received: by outflank-mailman (input) for mailman id 528392;
 Tue, 02 May 2023 09:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptmDh-0000TZ-0z
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:22:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e331ab5d-e8ca-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 11:22:43 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:22:40 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6348.namprd03.prod.outlook.com (2603:10b6:303:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 09:22:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:22:37 +0000
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
X-Inumbo-ID: e331ab5d-e8ca-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683019363;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=cXZQ/ieTQqnv0yguUimYMbrZgvtXD6uzWuHWWq/PDVs=;
  b=fibALUWuSGbHKl/5WkVaXWXBI3Ge1Y0j2y4alYOL9jX6HS4ryD+t2f0L
   jleA8ARM3HqSRVTR1O4zlRPW5kjofqxejhcXr7H4jOCMSzUmX3o+poDkG
   ry4lw2b1hFQoQoMHvxfrQ/OD9TvhO9v9qHguPJ4seAK7OGnY32+Cn0S8i
   A=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 107567437
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pKlYPq8d9/v/dYFMoADsDrUDpn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jQbUW/XbvfcMGXwL950PNmw9RhV657RmtRkTldv+S48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgR5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklep
 N83DBkGUSmfjvqt2pWnSM99weIaeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUuitABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwn6lB95JS9VU8NZrr1646UwdFiQGbnbloOeY0FKOCvJQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5b5dDm+ds3lkiWEYwlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:d0fq5KAqEkL55m7lHejXsceALOsnbusQ8zAXPo5KOHhom62j5r
 STdZEgvnHJYVkqOE3I5urwR5VoLUm8yXcX2/hiAV7dZniFhILAFugLh7cKqAeQeBEWmNQtsJ
 uJeMBFeaPN5TARt6rHCGLTKbkdKBbsys2VrNab9lMoaTxDL5hn6QIRMHfvLqW1LjM2dKbQ0P
 Cnl7l6T//LQwVmUi3BPAhjY8Hz4+fTkY7gY1ovHgdP0nj3sRqYrITiFgSe3FM0TzNLzN4ZgB
 T4uj283Lynr/a4jjjV02O71eUxpPLRjuFbAdCKiIwyNDLhkW+TFf1ccozHhikxvOasrGwLvb
 D30mwdFvU20WrVYma25SHgwBbtyxEn73OK8y7jvVLT5fbhQS48CY5/iZlCch3fgnBQwe1B7A
 ==
X-Talos-CUID: 9a23:j0qjMmPvjGfLku5DSHhE22o9Ef8cbnTF1233P02eGCFPcejA
X-Talos-MUID: 9a23:u7aSbQrPEUBcnf5gX0wezzBNN+xHw6qwMVA2vMsHpejeKRwhGzjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="107567437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEoxG0VdALQg+l7WgfIC+Jgz7G7BisD9OG/30gA3LKQ3Y75lHzwNDk+20pPKW52/wX9KkiyHxrC67JZBgwLEZ4jN3+QFH0dpqRxqZ0erZp+iryw0yQfSlJA4wgD2CNRKKc7coZn8ClK61Y3pD6QQoyveTR9AJKUd2moRcPuaSROIrtYd/LP0SQr8XuLnrhrhi1zR9Ic3yq5+9me4kzvgMVFh4xNawQJAzsuIx2tagUd+Vk9Bb7hKLalwLf88J8Y4h+KiOhG47tpvXqhdhHo4xS7iwBmmMeiSOIgDfukC1ZhfMBRMeCX+w36waqZvWipXF40LabcVk2qzK855UT8gIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wsYJPe0iu0Z4mSkpPhl8HsiIbXw2+t+onLantpeZho=;
 b=Huhr7yj6GmH9BlDJZfUfroHMePtFb1yp3J4Jt/GauGiODO4r23G+mDEsWOdzdhOvIIuauyTmPt6gJIlI9wDE4sLxvklB+CGgCp1tAgE60GG1NnfAY9aG2S22A+JGuG1S7zCX3C1k4f//WZq8DkF410w5WLYiaEyjtO/TMH3wsdry3tPWdv1F6PFrwP3srFZGfJlhcfGGcUlSck7NQjrHcdoVIWNYynu9VAhBb2Q4b9stON8vZkpSMV4ud1ca8w0r2w5rHapLZBvVof6tylyFAFbzfv5wLZ9c3ewnkdckADdU1rNWWDXVIY/0Ht/IVnIc2Pdvz3ET5+pHuBxrkCbQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wsYJPe0iu0Z4mSkpPhl8HsiIbXw2+t+onLantpeZho=;
 b=XZMKRRRo0xHpKi4a9Sj7rpTC34e+7V5fVNg5vCVuZdL6RoqFOvgbyzU8D2Ohm8UZbHv4I3j9ZYCfHzcVXeA4t+uDPfTAemMlBsiygduLs7IQPqVUTMRaMROaUuEXlUNgQ5RqKg8X03YPR4H1Z6mNljwtMzeiGs56+eFr9J5o9gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86: init improvements
Date: Tue,  2 May 2023 11:22:22 +0200
Message-Id: <20230502092224.52265-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0528.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4d8aaf-6154-4097-76d6-08db4aeec550
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RC792jRsx6dSUTpiv6J5dTZNWWX1UoO3ZfqLoBhB3vGWTeLBdKqFi/mdSsQzWnfy3F0B6A7e5UkKsbRnAlyInq2VfYDjj1q1Y48L66AnJ6We4obLH07f+pcgzigPbiyI/reVz4mM1nLn92u6GTMfng1f5nEqB86869SqNUnWFkgW7agyL5QkNMvqnbJup3RgDMMU+AqDKSri0PVG+GMa/CftAH2Dpza21mGMEMA8Eea/FwaesYSarbLkzLb0rOTS8Ft7ZAaWsaXtwQO5c3OgR3Zb3Wmv5x0lB+MTivco7/ZzGLDVVup8ijEqXgXeSD1tmGsW6MKoF4LmGAwXKZFw9a/dGvnuMuVCfxd49WG5tzPNktVTFpHBffP1xbrn8bpxYf8vHYvxcgugiuvZRoYQBzFPKNllM+2lCi0G+f4Xq7EMqoACVdhJ/97wpNOgefQDe1CxL1LLqUy/LhYu47GsKzl8jnY6lD2j74ewUTn+pTL8w0vtsjlslEJv3auOc1K0fYZB7PpTO34vSlVZEP9A3+C8NNbetdqMzCIniO44ZpMy3ad/EvmLYeti96ULtnOK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(26005)(6486002)(6512007)(6506007)(1076003)(6666004)(186003)(86362001)(54906003)(36756003)(478600001)(2616005)(82960400001)(66946007)(316002)(38100700002)(41300700001)(6916009)(66476007)(4326008)(66556008)(8676002)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0VHekxvL2EyV1YwR3EyUkltelg2MmlEZDZVQ1NJRW9NSlhzNHBBOWVxRkJR?=
 =?utf-8?B?RXRlbzErYUtQRjhEeXRFa04yU1I1V2orekZIZG9GQ0pNK2p4c0Z2bnFuREZl?=
 =?utf-8?B?SG9Bb2Z4S1hTNDBBMjNxZ01YQlAwZlMrekcyQUNFTWV2Ym9hU21FUGpKUUU3?=
 =?utf-8?B?SnBxNTNyVTNTcEJzcjFSazdHQnlDK3dXNit4eG1wWXUwQ1hDYUhTMHg2dmtQ?=
 =?utf-8?B?Y1NxWm02TEp4WnBBbTFmcnRlN2pJaG9hV2FJU20xWDE2NktzTG5LOFh0WDc5?=
 =?utf-8?B?cCtSSFNpWjhkV2daMTg0cUJ6TDdiRCsvYzRieHJYRXl0UitDMTFWbk5NSkd0?=
 =?utf-8?B?QmRjUmxzLy9ZeXo3TkJSZW5BN0cwb2QyaHVXMS9lYWlRQTFwNTNEVm1YcURR?=
 =?utf-8?B?TFpLZ0psZ1BGTC8wRENLQXVFa250bkVwRlByZHZCL1ZpcHlzUU9tNEpFQno3?=
 =?utf-8?B?N1hTekFkN2hEcTJkRGswWHV2OU1CT0M5MmJmYjBEN3VMN2NIT1VJc3k2dngx?=
 =?utf-8?B?OUtUK2tZS3JMVnYzWmlJdndZZlVIZm5wVlhjcjhqRFR5VHhrRm13RWxPZzA2?=
 =?utf-8?B?NXF4Uy83Y2grQVhNR3lwVGYxaE5sWHJ4RzZzUG9WS0xsbEt0cjNZa3BKSjlV?=
 =?utf-8?B?ajlQeEp1MVRrZ1R0cHVXR0NaOUV0YTgxRk9SOFZoeS9JbXpCdzZVYmdmR0lH?=
 =?utf-8?B?L1pmWlNaSUliaFZMOGVnMUhwL1VTci9LVlp5TEJzM29jOTBTOFBJUkp0YkJR?=
 =?utf-8?B?aWhuRlhHNzhHOUVxbnVjZHNMaVZPcFppd0tEQWF3VXk1WFYxN0V2elhRcDE4?=
 =?utf-8?B?RmNDMWVYNExTSmY3TmcwTzc5bjZGVzZoa2V3bTFza3Znd3FTNXVXMWpORW5t?=
 =?utf-8?B?SGFlc3FmUEVYdmd0SXRaZGRSSzNHcHdDWjZGYXA0MlFWTGozNUtkRDIzVFla?=
 =?utf-8?B?NHdWMm9GVCtJazcrVUFGR3BFeW9pN1Q4cER3NnRBb0RqVy9TamZwenhvNHA4?=
 =?utf-8?B?QmI1V0pXYTgvS3c2SlNPZ1BEOVRCbnJ6TFFSRjR2NkE1UUNJQnI1VHJWYnJi?=
 =?utf-8?B?K2RzVjU4M3hUaWs1ZWQ3VjBYSWlocytxOWlOYmJYaUF2T3VSVzFXYWw2d3Vv?=
 =?utf-8?B?d2NUVjFVRWwwcWlnM29vWHZ5R21aVUNjYjZtclVCeG5TTUpsOVJRbGRYVW8v?=
 =?utf-8?B?bnNReUdaUEFGaTlkcUNNOU04R2FqbnJKVEpDcnJiWElJNjRrV1k3MmFwS0M5?=
 =?utf-8?B?MnlsaS9TVlA2YXMzU3BqU3NHbHpZazhWZXRuQ2dMZkJCVVBLNGliTWU5RXJZ?=
 =?utf-8?B?UWVoczVwMlU5V0RTK045OCtEbHNuS1YvWm5YN1RYVzRIT0lid3B2a1lQQWEv?=
 =?utf-8?B?SHNVcC9LRm9jdi9HTHBabnYrQkVFMDhyWkMvUWRIZlJIc0ZsMjJLMWdVcUlm?=
 =?utf-8?B?YVlvKzlKRWNjZnF5bFBENWhnQjlyc1lYa2U0NzMyZVkrbXZYeWlmTTY4ZHVm?=
 =?utf-8?B?WWZpd0xiYnNOMkV4WVVNSFZQVmRFRFpvWVhvcnJ5QVdhZTlXckFoM0VsLy9E?=
 =?utf-8?B?dVdLSHh6YlF1dDRtOU5zbmZLcWY1VGVVekpudzgyUU51WmROb29rYVNJVzRF?=
 =?utf-8?B?YTJyMGgydVlRbDYvcTYzRjRNZklzTlZsK3BTbVlnRlY2MTdCUEZnTWk0c3Zk?=
 =?utf-8?B?Zm1meXNwVDZPK1VBUzB0TmdJOW9UM2Z1TzZWN1J4T1lybk9VandoOHNsR2Fp?=
 =?utf-8?B?VGtDQ3JmN09uSUk2VEgyV0gvQzQ0UUdMMUFZSkE3TnZtei9OVWRwaGo1VjB0?=
 =?utf-8?B?QzdvRmhWSnBOTjVzY2ZCcDd2Y0FjRzFHMXQyMzU4T2p0TjF4dkZ4Q1JhTXFG?=
 =?utf-8?B?UFcrMkltUjNIWno3Mi9hV0hCNUFTQUVVcVV3RzFKbkpYNEhKVHptZk5PQUdV?=
 =?utf-8?B?TnNIQThFa0FSWkVrTjhiUjJkNVJzdUlrazJUbElYbFZrMWdEVUxoS2xtalM4?=
 =?utf-8?B?K2FWZ3BRQWFvbjl3dzY3eVNIWlJGcUx2VDEwWTZGZk9aTnFKdGxqRTJiUkxK?=
 =?utf-8?B?ZTVoZG9yVnc0OGRyRGtPWUo0T2g2L3A4L3RiV1M1b2lhaXJJZTluTVJLNmJm?=
 =?utf-8?Q?phM2DuD9agvGH6aZDo9E8iczA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J68I0eyDnjPn1mb+0lkfdKVXXi4T5M2ef2HHVubLu0B6f3WEBqfZqj6me95K/rdT7sFCjP4rt/IUAeRDpe7sJREZ0Knr666B7DJ4I9I+FVu2ETRbm/gSiNfpg9t3+sLIzMK2cF0i14JydbKLWrz8Q7kVdtxnhjMKry+wNhELpszQexpav8KQ4f9qlNGX4+Vkbt8uyPEPSYgH1ErJTGjpa1ztpfW5e7xnFHc2ORZ+f+rgOjWgiuL6rMb0lIFnbaL3VYdyiLfrBjSxq7/yws+nVgE0YkdqZsPZMnDsSitJRsHTs42Vs38rKBjG8684+IRYIyh02ef4QDUZqlNoC3Qe9Gfbuhd4jKMJO4di5gxRXw7Gas3ndhmX5uhJ2GL3dl+HvhdhcAIvux7SUcsUQIQ5dQk5ephBhvPPDO2PQI6q6TIKkMaZe2/BHDcquu3NuZpBIgDRuNbsRgZPY3GO9FI1CMGc7dXvIkC8wJOa2UwRTmlzyz9viE0LrbjsZVMRg0Ed5dLbpkxDVQopGvTg9sKJO9YneT6cFn0oIr+A88y86RWAkzReLAOzJDNbJXS2aFqpJZBKRw/rOnW2k8x9oTOgXG6bCJYeig8OepvDKMrwucix8ZUD/bl5f7tjG9+h4ku+FfH4QiFFSYIBxIljtstC/emeidbiGFHpV+5utS3Hwz36ubQRGaMxpLY6PBtxq/IZDI+XbqabjYqJv6mzjr7xOlTSuqilhZ0GZxO8g0F86E/4j704wAeMaDjBLmIQZ6W6V/nuClTrA2+i22I6YkmkNgQQLZDvSwhdYlLR4KVhgj9qz1ttqCePCmUaSMiBe5RY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4d8aaf-6154-4097-76d6-08db4aeec550
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:22:37.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR+0adD1cj/ewrJHc4FnZcIn++HFKEGXZ2VW4wq8nFepfcGIazeXC5Ce1WNrme+c8h9BpZma7nWafxBSgCqx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6348

Hello,

The following series contain two minor improvements for early boot: the
first one is an alignment check when building the initial page tables,
the second is a consistency fix for the GDT used by the BSP for the
trampoline code.

Both are a result of some debugging work done on a system with broken
firmware that resulted in Xen text not being loaded at a 2Mb aligned
address.  This resulted in corrupted page tables that would manifest as
the ljmp from compatibility mode in trampoline_protmode_entry causing a
triple fault due to the GDT being located in the Xen text section, and
the page table entry for that address being corrupt because Xen was not
loaded a 2Mb boundary.

The aim of the series (specially the first patch) is not to allow
booting on such broken firmware, but to print an error message instead
of causing a triple fault.

Thanks, Roger.

Roger Pau Monne (2):
  x86/head: check base address alignment
  x86/trampoline: load the GDT located in the trampoline page

 xen/arch/x86/boot/head.S       | 9 +++++++++
 xen/arch/x86/boot/trampoline.S | 6 ++++++
 2 files changed, 15 insertions(+)

-- 
2.40.0


